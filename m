Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1E57EB398
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632823.987280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vNh-00028G-FB; Tue, 14 Nov 2023 15:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632823.987280; Tue, 14 Nov 2023 15:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vNh-00024y-CH; Tue, 14 Nov 2023 15:31:13 +0000
Received: by outflank-mailman (input) for mailman id 632823;
 Tue, 14 Nov 2023 15:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wlO=G3=desiato.srs.infradead.org=BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r2vNf-00023Y-Dr
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:31:11 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4d40384-8302-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 16:31:08 +0100 (CET)
Received: from [31.94.7.206] (helo=[127.0.0.1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r2vNT-002WtI-0X; Tue, 14 Nov 2023 15:30:59 +0000
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
X-Inumbo-ID: d4d40384-8302-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kI8asQVhOaGuY/UltcD2EIrkJh3iOIJyA9g6wBOXluk=; b=R37YxD+21q3rf7xOFOp0slG+f9
	+xj/jKvNgv2ak6vgeuM+oEd2TkBIrpwWMJy0gnQcercjtVz0+mTVGvTGDNWhjq4sdt8mS8vT2l7kc
	cCVXqCeU4NDM74DxDlIgJqP/GLCUxRQSTOl+PT+Z35apucO6sEy7bPEf49aVglTMc2pLE3I+kOydB
	J4App7NzjOK0V0Snxpc2LLxYHcNIJDg0zhJ6Coc8TLNESIe2d73wUUsvlMLbUNqirlTy35l/Zljmx
	PjXYgavZnBmkovcuK4k/jZK6a20DhrEPQC04p8avEnhGf2OC45ZjGUXflE0pqgHzZwBJEKOjwrhXB
	zZOQGefw==;
Date: Tue, 14 Nov 2023 10:30:48 -0500
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
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH-for-9=2E0_v2_?= =?US-ASCII?Q?09/19=5D_hw/block/xen=5Fblkif=3A?= =?US-ASCII?Q?_Align_structs_with_QEMU=5FA?= =?US-ASCII?Q?LIGNED=28=29_instead_of_=23pragma?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-10-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-10-philmd@linaro.org>
Message-ID: <292FEC54-80CC-4C17-8027-F1CB3609FDF5@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 14 November 2023 09:38:05 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>Except imported source files, QEMU code base uses
>the QEMU_ALIGNED() macro to align its structures=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Can we have a BUILD_BUG_ON(sizeof=3D=3D) for these please?



