Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 556DA9E7EA7
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2024 08:15:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850576.1264985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJp1w-00068c-Rz; Sat, 07 Dec 2024 07:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850576.1264985; Sat, 07 Dec 2024 07:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJp1w-00065y-Nd; Sat, 07 Dec 2024 07:15:08 +0000
Received: by outflank-mailman (input) for mailman id 850576;
 Sat, 07 Dec 2024 07:15:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6yN/=TA=kernel.org=wei.liu@srs-se1.protection.inumbo.net>)
 id 1tJp1u-00065s-Gn
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2024 07:15:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f970e34d-b46a-11ef-99a3-01e77a169b0f;
 Sat, 07 Dec 2024 08:15:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0B1055C448A;
 Sat,  7 Dec 2024 07:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF90C4CECD;
 Sat,  7 Dec 2024 07:14:59 +0000 (UTC)
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
X-Inumbo-ID: f970e34d-b46a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733555700;
	bh=oAnCIry7zz0LHB2JW5rkUj+VTlRZl6GeP5F62hw39yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=py7KvUFtZppqNtobuVWrAtrD0KzRh3xrhqdYXD4b2BBIl+lqwCXNYgtsisWjkwNu4
	 H2AbmUTKTvXiw+Y85xQCkb57jphuQiRBjZrSBntJWxcGDgYBA0dgZWrvVbcqxduhVY
	 5iZcI15Cyhok4bRWttmALPJulLQ1zBaHTXWjhDgcSZxdjTdVTPGwOzv/B/9PJKpU6g
	 64nGyRFfxYBRm4tPoKnTtycZJfxHNNb9YyTnKlIP3LDkIFu1o00VS5XK6SaXz11ElV
	 aLH/lhF6Qd+h+H1ZpDPlo9b57QnW/KbXG3hz/maOo0seAu0VG+Wtqz9TnT8JSYfTZF
	 JKIVeHHZys28Q==
Date: Sat, 7 Dec 2024 07:14:58 +0000
From: Wei Liu <wei.liu@kernel.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Michael Roth <michael.roth@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Kai Huang <kai.huang@intel.com>, Andi Kleen <ak@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Xiaoyao Li <xiaoyao.li@intel.com>, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH, RESEND] x86/mtrr: Rename mtrr_overwrite_state() to
 guest_force_mtrr_state()
Message-ID: <Z1P18uRSY0dSQjfi@liuwe-devbox-debian-v2>
References: <20241202073139.448208-1-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202073139.448208-1-kirill.shutemov@linux.intel.com>

On Mon, Dec 02, 2024 at 09:31:39AM +0200, Kirill A. Shutemov wrote:
> Rename the helper to better reflect its function.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Suggested-by: Dave Hansen <dave.hansen@intel.com>
> Acked-by: Dave Hansen <dave.hansen@intel.com>
> ---
>  arch/x86/hyperv/ivm.c              |  2 +-

Acked-by: Wei Liu <wei.liu@kernel.org>

