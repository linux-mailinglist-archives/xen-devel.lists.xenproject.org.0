Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 872C3945E31
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 14:57:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771128.1181708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrqn-0006N3-JJ; Fri, 02 Aug 2024 12:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771128.1181708; Fri, 02 Aug 2024 12:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrqn-0006LH-Fw; Fri, 02 Aug 2024 12:57:41 +0000
Received: by outflank-mailman (input) for mailman id 771128;
 Fri, 02 Aug 2024 12:57:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tTZu=PB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1sZrqm-0006EW-TC
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 12:57:40 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc42b336-50ce-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 14:57:40 +0200 (CEST)
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
X-Inumbo-ID: cc42b336-50ce-11ef-bc03-fd08da9f4363
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722603459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O5e/6G+UM25BxlQUWxbyryv4bOzCBkl7nWu90dDPr9o=;
	b=Dup5ih/c9Ll7xhiCpSGh6zVCY45x1W4PsqPA+PCB2DM3mpo1gNzQsSzdGifc36R5UOEEze
	ZBf+q+DoMqnSL3mH7Z3U9AYqpEE2HTPJ5mEQ+w3MpLBalmERpW8IHVyYlTI6tZwnyqmDGk
	grL+8QKBU0YhDQEo10R4xMukgMgisptf2ry2Lj0mg9VVdDgHK5Ehd9UtfgPaWfHk0dEofp
	uUugO96lR/VPSIbBdV8M5v6s+snNRFloDqJwNg46jkP7iekI51Da/tMj19GJLXlys6cOTf
	n/Q6aBK67Le/w2zLg8JrQtoV2R5E52HHF89/tHif4Mt6QqgtK+ZUanD/ew8ZNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722603459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O5e/6G+UM25BxlQUWxbyryv4bOzCBkl7nWu90dDPr9o=;
	b=EubcF067iHPxmtEKaSAyakWHQcL1X08DPzdAbR8Q5dHoQQix8euEBg5kr2mEjOPGylVXfE
	Q5JLjuPUIADNINDA==
To: Alexey Dobriyan <adobriyan@gmail.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] xen, pvh: fix unbootable VMs by inlining memset in
 xen_prepare_pvh
In-Reply-To: <3fe4502f-020e-46de-976a-b32a76de478a@p183>
References: <a9f505a6-fd31-4cfa-a193-d21638bb14f1@p183>
 <3fe4502f-020e-46de-976a-b32a76de478a@p183>
Date: Fri, 02 Aug 2024 14:57:38 +0200
Message-ID: <87cymr13r1.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Aug 02 2024 at 11:53, Alexey Dobriyan wrote:
> If this memset() is not inlined than PVH early boot code can call
> into KASAN-instrumented memset() which results in unbootable VMs.
>
> Ubuntu's 22.04.4 LTS gcc version 11.4.0 (Ubuntu 11.4.0-1ubuntu1~22.04)
> doesn't inline this memset but inlines __builtin_memset.

memset() ......


