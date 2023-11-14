Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0B17EB2D2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:52:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632664.987012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2umD-0000f7-Pg; Tue, 14 Nov 2023 14:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632664.987012; Tue, 14 Nov 2023 14:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2umD-0000cq-Mn; Tue, 14 Nov 2023 14:52:29 +0000
Received: by outflank-mailman (input) for mailman id 632664;
 Tue, 14 Nov 2023 14:52:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqXQ=G3=casper.srs.infradead.org=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r2umB-0000ck-TJ
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:52:28 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cd52059-82fd-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 15:52:26 +0100 (CET)
Received: from [12.186.190.2] (helo=[127.0.0.1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r2um4-008XpM-3f; Tue, 14 Nov 2023 14:52:20 +0000
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
X-Inumbo-ID: 6cd52059-82fd-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ICHewS3Ac/ijiK+ks360OQMk79lzoLRKl9is1vU3rIo=; b=U/CUMp0TGxLvfnFsfS6JM/cNfY
	5wmBRW+E/1KIVJf20V5+jE5hpQoIcX1ntDj6CtV56TFeY35OnTNbWKI5T7TT0iusmxdyY4RQCoN6O
	8Ip7i0xzvikC5ImMhtcy/PdvZnNB5arsCne2k1TIYXV4PWFX0AcSsCK4OejpSHOklM/U3JvNlk9AJ
	xbs4LlptfNvnJtxX2h0FDT7d05kYqCiqBpVerZMMBj2s115qnRA9XGkM+p4HCMOticwQ/2VpprjWX
	iM+ol5pmxESEpBoFUrpDzg9qUko74mhma5Oy7pNE6vKjBY94rSAmlpK6Q+HDrf3aHgarnsIvOzmlR
	YMNWRmZQ==;
Date: Tue, 14 Nov 2023 09:50:06 -0500
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-9=2E0_v2_01/19=5D_tests/avocado=3A_A?= =?US-ASCII?Q?dd_=27guest=3Axen=27_tag_to_tests_running_Xen_guest?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-2-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-2-philmd@linaro.org>
Message-ID: <94D9484A-917D-4970-98DE-35B84BEDA1DC@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On 14 November 2023 09:37:57 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>Add a tag to run all Xen-specific tests using:
>
>  $ make check-avocado AVOCADO_TAGS=3D'guest:xen'
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> tests/avocado/boot_xen=2Epy      | 3 +++
> tests/avocado/kvm_xen_guest=2Epy | 1 +
> 2 files changed, 4 insertions(+)

Those two are very different=2E One runs on Xen, the other on KVM=2E Do we=
 want to use the same tag for both?


