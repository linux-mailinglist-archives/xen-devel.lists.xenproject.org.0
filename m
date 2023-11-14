Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482B17EB387
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:28:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632817.987269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vKo-0005ee-0g; Tue, 14 Nov 2023 15:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632817.987269; Tue, 14 Nov 2023 15:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vKn-0005c0-Tp; Tue, 14 Nov 2023 15:28:13 +0000
Received: by outflank-mailman (input) for mailman id 632817;
 Tue, 14 Nov 2023 15:28:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqXQ=G3=casper.srs.infradead.org=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r2vKm-0005ae-S9
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:28:12 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a8eef00-8302-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 16:28:09 +0100 (CET)
Received: from [12.186.190.2] (helo=[127.0.0.1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r2vKf-008iHm-67; Tue, 14 Nov 2023 15:28:05 +0000
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
X-Inumbo-ID: 6a8eef00-8302-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=N6lsIAvT/LEG0QMHScLeB5rAujKwbWfIcynqEX/JTgg=; b=Q8wLxLTE99gkmHRWLTsrO2SdeW
	XfdKzTjDRskRz4FgWweoVthPGWW6En3PnTPFiWPPGI0GLEqYKFCbaeUhWCc7eqRld+EkmItyFum/u
	f8mR/LaDGf97Vypg8dR70A9njyk0ujfA7GZDBcceSMpPvIfPG8ySvMi5k6XkPRB+nhXIzXfrUJtqt
	0clzgOwbYlqSSo1XvNoqUO0a+GmML4/eWxE/IEVjTty/Z4Wj8qtR55DQRxJj44VukxbGuuQxa91Un
	cEKKoaJzdph/iZGXdVUaBR1VS+02QOG0uU75aMm/LiOK4lkOlIuQpg//W3mDTgD24Mh/X3NI0TbGv
	wu90QKlA==;
Date: Tue, 14 Nov 2023 10:27:59 -0500
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
 Thomas Huth <thuth@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-9=2E0_v2_07/19=5D_hw/xen=3A_Rem?= =?US-ASCII?Q?ove_unnecessary_xen=5Fhvm=5Finject=5Fmsi=28=29_stub?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-8-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-8-philmd@linaro.org>
Message-ID: <017E3F40-47A2-4F1D-98B6-18863ABB0FD6@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On 14 November 2023 09:38:03 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>Since commit 04b0de0ee8 ("xen: factor out common functions")
>xen_hvm_inject_msi() stub is not required=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Reviewed-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>



