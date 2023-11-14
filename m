Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF9B7EB41D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:49:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632847.987340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vfC-00050i-A2; Tue, 14 Nov 2023 15:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632847.987340; Tue, 14 Nov 2023 15:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vfC-0004wr-6j; Tue, 14 Nov 2023 15:49:18 +0000
Received: by outflank-mailman (input) for mailman id 632847;
 Tue, 14 Nov 2023 15:49:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wlO=G3=desiato.srs.infradead.org=BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r2vfA-0004pe-Ky
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:49:16 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bdbaf4e-8305-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 16:49:14 +0100 (CET)
Received: from [12.186.190.2] (helo=[127.0.0.1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r2vf5-002XJc-28; Tue, 14 Nov 2023 15:49:12 +0000
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
X-Inumbo-ID: 5bdbaf4e-8305-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wtURPiisGS2Hb9OQNj9FuNG7UceqKqAuVLVYS7MTruU=; b=g+J9KwGdZRYI4g0BjPhX3Wej4V
	qgf4G1p2wAcN0ZPSKlJTDLbDa6XzWqI79m4La+5Xg542iql0TG4Aa2bBhd1bNXq47iauucD6/Ws01
	q39MFSqTiOOKtNXKYVedMaF39zDxCwXjwSxbPqoJ4wo8wyGRIa0FUIS6KScaI3gUS1ZE8683oG0xC
	0ZZCj6wcHEVFbZshtzBfxKDTM3DRbHiSS4qoRs2Ik4XoXV5MhW23iSr5JRBMh6eY5DSxYJppv7H+a
	5/rO5817qfDyFhoFlUiiNymrxo7+awx/ceo7QpxfhIdD7b6B72zUl9AqNCaLHNVbi24MNccaGsAPq
	Ah78wSow==;
Date: Tue, 14 Nov 2023 10:49:07 -0500
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
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-9=2E0_v2_10/19=5D_hw/xen=3A_Rename_?= =?US-ASCII?Q?=27ram=5Fmemory=27_global_variable_as_=27xen=5Fmemory=27?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-11-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-11-philmd@linaro.org>
Message-ID: <84F1C2D8-4963-4815-8079-B44081234D41@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 14 November 2023 09:38:06 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>To avoid a potential global variable shadow in
>hw/i386/pc_piix=2Ec::pc_init1(), rename Xen's
>"ram_memory" as "xen_memory"=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Well OK, but aren't you going to be coming back later to eliminate global =
variables which are actually per-VM?

Or is that the point, because *then* the conflicting name will actually ma=
tter?

Reviewed-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>


