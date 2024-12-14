Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 532F09F1B1A
	for <lists+xen-devel@lfdr.de>; Sat, 14 Dec 2024 01:07:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857257.1269650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMFfk-0007iB-M0; Sat, 14 Dec 2024 00:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857257.1269650; Sat, 14 Dec 2024 00:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMFfk-0007fr-JE; Sat, 14 Dec 2024 00:06:16 +0000
Received: by outflank-mailman (input) for mailman id 857257;
 Sat, 14 Dec 2024 00:06:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V3je=TH=igalia.com=berto@srs-se1.protection.inumbo.net>)
 id 1tMFfi-0007fl-5R
 for xen-devel@lists.xenproject.org; Sat, 14 Dec 2024 00:06:14 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 353d8d15-b9af-11ef-99a3-01e77a169b0f;
 Sat, 14 Dec 2024 01:06:04 +0100 (CET)
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tMFes-002sgk-73; Sat, 14 Dec 2024 01:05:22 +0100
Received: from gate.service.igalia.com ([192.168.21.52])
 by mail.igalia.com with esmtp (Exim)
 id 1tMFeq-007HeJ-9B; Sat, 14 Dec 2024 01:05:22 +0100
Received: from berto by gate.service.igalia.com with local (Exim 4.96)
 (envelope-from <berto@igalia.com>) id 1tMFeq-007aKe-0O;
 Sat, 14 Dec 2024 00:05:20 +0000
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
X-Inumbo-ID: 353d8d15-b9af-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=s3baxnvsv0QDjdbqpZIjo+pfDf0zddAKGBM4vYP+R4s=; b=AJ1SV70n7ay56Wph5Xdsr6p6Fi
	ypQHjAi5++9f6K3K8cMFXVCH2s7dvz+JMkaIlBo/lK9PaeDMNi/Q38Sf5hfM4hllCFstq43GI3JIs
	calJyadqr4UGXbq8Y2sW2/hu/MZNMWw46Zc9M5goyZaQtwdZCeR99GZjBBAinedWfQeEgm/T4miw9
	ZTt+YioIM0tfkuWx3koJEJp+NbnzFzNJO4bQjV05qs8YzDJ09d3TCdIMIcpYb3egXDwr+f4ofM95g
	GhRivEcAA2t/BPOBkuZNquIHG/zCQrdwQ3XsDHwrjeYdqxmhmeJPdToREXKyQKnj+itqMXjmg7WH8
	yJISu/bg==;
From: Alberto Garcia <berto@igalia.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, "Michael S. Tsirkin"
 <mst@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>, Igor Mitsyanko
 <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>, =?utf-8?Q?Cl?=
 =?utf-8?Q?=C3=A9ment?=
 Chigot <chigot@adacore.com>, Frederic Konrad <konrad.frederic@yahoo.fr>,
 Thomas Huth <huth@tuxfamily.org>, Joel Stanley <joel@jms.id.au>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Magnus Damm <magnus.damm@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Vijai Kumar K <vijai@behindbytes.com>, Bin
 Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas
 Piggin <npiggin@gmail.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Samuel Tardieu <sam@rfc1149.net>, Amit Shah <amit@kernel.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "open
 list:Raspberry Pi" <qemu-arm@nongnu.org>, "open list:OpenTitan"
 <qemu-riscv@nongnu.org>, "open list:S390 general arch..."
 <qemu-s390x@nongnu.org>, "open list:sPAPR (pseries)"
 <qemu-ppc@nongnu.org>, "open list:X86 Xen CPUs"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 20/71] hw/char: Constify all Property
In-Reply-To: <20241213190750.2513964-25-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
 <20241213190750.2513964-25-richard.henderson@linaro.org>
Date: Sat, 14 Dec 2024 01:05:20 +0100
Message-ID: <w511pybi0xr.fsf@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Report: NO, Score=0.6, Tests=ALL_TRUSTED=-1,AWL=0.775,BAYES_50=0.8,URIBL_BLOCKED=0.001
X-Spam-Score: 6
X-Spam-Bar: /

On Fri 13 Dec 2024 01:06:54 PM -06, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alberto Garcia <berto@igalia.com>

Berto

