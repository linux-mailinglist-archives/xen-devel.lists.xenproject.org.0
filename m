Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F007EB33F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:14:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632774.987199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2v7Z-0000l5-D5; Tue, 14 Nov 2023 15:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632774.987199; Tue, 14 Nov 2023 15:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2v7Z-0000j7-9u; Tue, 14 Nov 2023 15:14:33 +0000
Received: by outflank-mailman (input) for mailman id 632774;
 Tue, 14 Nov 2023 15:14:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqXQ=G3=casper.srs.infradead.org=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r2v7W-0008AQ-AQ
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:14:30 +0000
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 815e72df-8300-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 16:14:29 +0100 (CET)
Received: from [12.186.190.2] (helo=[127.0.0.1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r2v73-008dEf-2f; Tue, 14 Nov 2023 15:14:01 +0000
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
X-Inumbo-ID: 815e72df-8300-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=zLWRl6fuh+QlAq2JcSTCgSqOD3rW63ZP4Laj6regjn0=; b=CDbCkxBOGqoE0okEs41cvDk5fY
	avC36PbcnvrY2oGlWB+RQPF4liPIPZGR3EmI5Av83WCkoqFq/6JecFkFY7vUWsvo7/8BmYzi44D1g
	Ws5geOrtzOEM5Q+9dgkqYhjuO8CCj0m7FwKXRyGH/otFSxezkrYf7thCJcuan3UovTroWWy1VVTp0
	pnd+C2RYiX9iD91nqIjI4v94iVedb61DZAmiijnR8rGW40PapOik1v9uw6WmF0h27udRo7vUsUI+/
	CdQBeD4lSkTeDsX/DqpzXtj+VzppGTN+wtPUM4BmDuIgnKf9HDMxmYUNaj5vpn46oYHJTmkvPF/K5
	uuDkjPBA==;
Date: Tue, 14 Nov 2023 10:13:58 -0500
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
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-9=2E0_v2_06/19=5D_hw/pci/msi?= =?US-ASCII?Q?=3A_Restrict_xen=5Fis=5Fpirq=5Fmsi=28=29_call_to_Xen?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-7-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-7-philmd@linaro.org>
Message-ID: <EEC18CA6-88F2-4F18-BDE5-5E9AAE5778A7@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On 14 November 2023 09:38:02 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>Similarly to the restriction in hw/pci/msix=2Ec (see commit
>e1e4bf2252 "msix: fix msix_vector_masked"), restrict the
>xen_is_pirq_msi() call in msi_is_masked() to Xen=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Hm, we do also support the Xen abomination of snooping on MSI table writes=
 to see if they're targeted at a Xen PIRQ, then actually unmasking the MSI =
from QEMU when the guest binds the corresponding event channel to that PIRQ=
=2E

I think this is going to break in CI as kvm_xen_guest=2Epy does deliberate=
ly exercise that use case, doesn't it?

I deliberately *didn't* switch to testing the Xen PV net device, with a co=
mment that testing MSI and irqchip permutations was far more entertaining=
=2E So I hope it should catch this?


