Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B012F7EB2EC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632711.987079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2utF-0007AJ-55; Tue, 14 Nov 2023 14:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632711.987079; Tue, 14 Nov 2023 14:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2utF-00078K-29; Tue, 14 Nov 2023 14:59:45 +0000
Received: by outflank-mailman (input) for mailman id 632711;
 Tue, 14 Nov 2023 14:59:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqXQ=G3=casper.srs.infradead.org=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r2utC-00075e-LF
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:59:43 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f068324-82fe-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 15:59:39 +0100 (CET)
Received: from [12.186.190.2] (helo=[127.0.0.1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r2ut1-008aJs-S4; Tue, 14 Nov 2023 14:59:32 +0000
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
X-Inumbo-ID: 6f068324-82fe-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=2V2aN1FlolnINR1l3YlTw25qRr0vJF7wJ6RIq/GchL0=; b=E/PEXjvt0+RnUlYrN++xmBLgjc
	HuCaeTYOVkOefp8uy3ZSz/P6HEQekbeWntiUJxH7m1YR/R9+NhRL2luaaOdAWWsfGwCj9vF7sfChu
	J4kSiafVKeRtFjBPxiuFAo6xu2mHULfx5cUzZjHFsJkKJXM2LkwTPWm94lP3pXzh+8dAXVF2IOAFF
	fSfV1upQceel86/fLJuSmWwADzoC+KPOtbAHed77Z6tkpuV9iEklSCO+Alm8btl+EphB5Pfn4Mzlg
	mK4N8HkJxJMjd+3+0P+LbO2K/yb2HegPlM96HCDpOt/n8/RjcauHGDBym2kUbXZSjBDzkYQJXKD0P
	jq+BiHiQ==;
Date: Tue, 14 Nov 2023 09:59:29 -0500
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
 Thomas Huth <thuth@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-9=2E0_v2_04/19=5D_system/physmem=3A_D?= =?US-ASCII?Q?o_not_include_=27hw/xen/xen=2Eh=27_but_=27sysemu/xen=2Eh=27?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-5-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-5-philmd@linaro.org>
Message-ID: <2D88622C-9DFB-4DB6-8F9C-E45850FB1DCD@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On 14 November 2023 09:38:00 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>physmem=2Ec doesn't use any declaration from "hw/xen/xen=2Eh",
>it only requires "sysemu/xen=2Eh" and "system/xen-mapcache=2Eh"=2E
>
>Suggested-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Reviewed-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>


