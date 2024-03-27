Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB9B88E2D8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 14:35:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698527.1090291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTQC-00006R-5T; Wed, 27 Mar 2024 13:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698527.1090291; Wed, 27 Mar 2024 13:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTQC-0008Vc-2h; Wed, 27 Mar 2024 13:34:28 +0000
Received: by outflank-mailman (input) for mailman id 698527;
 Wed, 27 Mar 2024 13:34:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6/zG=LB=desiato.srs.infradead.org=BATV+cb512937bb1ca346be0c+7521+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rpTQ9-0008VU-89
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 13:34:26 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8f2390c-ec3e-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 14:34:23 +0100 (CET)
Received: from [2a00:23ee:1868:3da7:4441:744d:10c:c781] (helo=[IPv6:::1])
 by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rpTQ2-00000000H0t-3z9v; Wed, 27 Mar 2024 13:34:19 +0000
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
X-Inumbo-ID: b8f2390c-ec3e-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=a+mnVz+I2LBdh7f3Jeku0JCwAoJyIxFVfnocz+i6RMc=; b=q+v5/FPbwtAD6uQ9dCHGbJREjz
	H800nx781N9tH0ZcPPk9yn5Ape1VheAXWcyBkwRNqKh4v/J6DHpXEnVP9Qz74WQNMJbQVIsdax39L
	DlLF3RislEyl4kLLjeTkS7dO2SAN6YZChYNLRkkTF2vkDLvc9T3y0pW/3wF6+9ZO7wnocnQ00G53r
	KBhD2vc3Jo90OAxsDRunIY0TlD0Q9Lwepy7zWNB83EJpkEV4zhYDQ6il5F8K101e8mWUJhr+G9rSb
	4A+Q6ifEF4oA7e6058Z6Vrd6MQkld5/dNz/qhri2QxMR/MFmkWIOk/jAPxDKuKeFdMgjEPMoFD8rB
	Bv2BC0qg==;
Date: Wed, 27 Mar 2024 13:34:14 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Anthony PERARD <anthony.perard@cloud.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH-for-9=2E0_v2_?=
 =?US-ASCII?Q?09/19=5D_hw/block/xen=5Fblkif=3A?=
 =?US-ASCII?Q?_Align_structs_with_QEMU=5FA?=
 =?US-ASCII?Q?LIGNED=28=29_instead_of_=23pragma?=
User-Agent: K-9 Mail for Android
In-Reply-To: <76ae46e6-c226-49d0-890e-c8fd64172569@perard>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-10-philmd@linaro.org> <76ae46e6-c226-49d0-890e-c8fd64172569@perard>
Message-ID: <F096E89B-FB3B-4E06-B5A4-C28A285C07D6@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 27 March 2024 13:31:52 GMT, Anthony PERARD <anthony=2Eperard@cloud=2Ecom=
> wrote:
>On Tue, Nov 14, 2023 at 03:38:05PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> Except imported source files, QEMU code base uses
>> the QEMU_ALIGNED() macro to align its structures=2E
>
>This patch only convert the alignment, but discard pack=2E We need both o=
r
>the struct is changed=2E

Which means we need some build-time asserts on struct size and field offse=
ts=2E That should never have passed a build test=2E


