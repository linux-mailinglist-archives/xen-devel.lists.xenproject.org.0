Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F5DA49EBF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 17:27:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899025.1307516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to3D6-0002FV-NE; Fri, 28 Feb 2025 16:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899025.1307516; Fri, 28 Feb 2025 16:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to3D6-0002D2-KD; Fri, 28 Feb 2025 16:27:36 +0000
Received: by outflank-mailman (input) for mailman id 899025;
 Fri, 28 Feb 2025 16:27:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1to3D5-0002Cw-42
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 16:27:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1to3D2-00ANbI-03;
 Fri, 28 Feb 2025 16:27:31 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1to3D1-00FSXm-1N;
 Fri, 28 Feb 2025 16:27:31 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=R3BRUdvvvJJZ604ru3RAMycqp9+G4p0pWnPRAV5PYjo=; b=txCtdH2JyyEdRz0+PyfXC0m3/T
	9sPg8ZBYpWv/MFZPb5TtTDP/0nEKHF48AmSHMZwSMH+5q3HG10Qd3CKtXRtMqALEQUDDBq3x8LIkt
	97SL6OcvHXxexL7rdHciZx0nEzl4d0mC9e+44VIhV3RJiNSTa2TjjvCZ3PX7l+aL8hKY=;
Date: Fri, 28 Feb 2025 17:27:28 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Thomas Huth <thuth@redhat.com>, Jan Beulich <jbeulich@suse.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 8/8] meson: Remove support for Xen on 32-bit ARM hosts
Message-ID: <Z8Hj8Lm5SqkjLqiM@l14>
References: <20250218162618.46167-1-philmd@linaro.org>
 <20250218162618.46167-9-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218162618.46167-9-philmd@linaro.org>

On Tue, Feb 18, 2025 at 05:26:18PM +0100, Philippe Mathieu-Daudé wrote:
> Per Stefano:
> 
>   For ARM 32-bit, I do not think we ever had many deployments,
>   as most are 64-bit. Even when there are deployments, they do
>   not typically use QEMU, as QEMU is less important for Xen on
>   ARM compared to x86.
> 
> The QEMU project only test to cross-build Xen on Aarch64 hosts
> (see 84eda110792 ("gitlab-ci: Add Xen cross-build jobs").
> Since 32-bit host aren't tested, simply remove the support there.
> 
> [*] https://lore.kernel.org/qemu-devel/alpine.DEB.2.22.394.2502031438170.11632@ubuntu-linux-20-04-desktop/
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> While apparently running Xen on 32-bit hosts isn't straighforward
> anymore (see [x]), we don't need to remove it ASAP, it is already
> in the deprecation queue since commit 6d701c9bac1 ("meson:
> Deprecate 32-bit host support").
> 
> [x] https://lore.kernel.org/qemu-devel/173d18bf-f68c-4bd5-b822-abb1c1f0c51b@suse.com/
> ---
>  docs/about/removed-features.rst | 5 +++++
>  meson.build                     | 3 ---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index c6616ce05e5..f6ea53acc8b 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -969,6 +969,11 @@ MIPS "Trap-and-Emulate" KVM support (removed in 8.0)
>  The MIPS "Trap-and-Emulate" KVM host and guest support was removed
>  from Linux in 2021, and is not supported anymore by QEMU either.
>  
> +Xen on 32-bit ARM hosts (removed in 10.0)
> +'''''''''''''''''''''''''''''''''''''''''
> +
> +Untested for more than 4 years.

Well, not quite, we used to have some test of Xen on armhf hosts
(one of arndale or cubietrunk, I don't remember which one we had to stop
and never start testing again) until last year, and that included tests
with qcow2 disk, so using QEMU.

But that testing infra is gone so the patch is fine:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Cheers,

-- 
Anthony PERARD

