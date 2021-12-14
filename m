Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBBC474237
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 13:18:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246700.425449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6kj-0001TH-0C; Tue, 14 Dec 2021 12:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246700.425449; Tue, 14 Dec 2021 12:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6ki-0001Qn-TP; Tue, 14 Dec 2021 12:17:52 +0000
Received: by outflank-mailman (input) for mailman id 246700;
 Tue, 14 Dec 2021 12:17:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pz9/=Q7=linutronix.de=bigeasy@srs-se1.protection.inumbo.net>)
 id 1mx6kh-0001Qg-Mf
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 12:17:51 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 004c6a35-5cd7-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 13:11:43 +0100 (CET)
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
X-Inumbo-ID: 004c6a35-5cd7-11ec-85d3-df6b77346a89
Date: Tue, 14 Dec 2021 13:17:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639484269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5EjK9U4c1B2UMzOdb/VrmnUd2kGnJXX71T0l2vaNMvw=;
	b=LFK+C3/7skCLlAKeYual5QNG0cjYG8e40f7TSY4MQqfma/UQ6d67wFxp39AR88lvO6nePR
	uhIdror80ph6fl02ir+ouKap1Hd1kz2bMADADJoY6PsTyu4+kU3FplepMkdGvK3qkXxqNT
	tI3GVA5NH04Gtx6TlpfCcMKQmyjUClmA2jz5tFDeaMGotkSsNlkrABbE3cMeZxaphrP9nI
	wRS44pc63FwetZVhkg2U2AYJOaOJmd9mm4rVm406sRAGsN/ooXy47H2AnhrOEKxMYLFvVb
	4y6n1ZWibQT/Ol1h5qLWCHj2AAq8DyPA9vjubBln43hM6sEiWGYE8+gyrJ26UQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639484269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5EjK9U4c1B2UMzOdb/VrmnUd2kGnJXX71T0l2vaNMvw=;
	b=rJpgtcmrZni7owWFcBoJFviG+yZFYbPz0kQR2t++AUzw4JSTKMPNOiAow/U3ui0/V0TFgc
	gHq6c2V421H3vDAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org, x86@kernel.org,
	xen-devel@lists.xenproject.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Longpeng <longpeng2@huawei.com>,
	Gonglei <arei.gonglei@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Valentin Schneider <valentin.schneider@arm.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 0/2 v2] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE
 state to be brought up again.
Message-ID: <YbiLa2nK3pYruDSK@linutronix.de>
References: <20211206152034.2150770-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211206152034.2150770-1-bigeasy@linutronix.de>

On 2021-12-06 16:20:32 [+0100], To linux-kernel@vger.kernel.org wrote:
> This is a repost of the previous patch (#2) and adding Boris
> (Ostrovsky)'s suggestion regarding the XEN bits.
> The previous post can be found at
>    https://lore.kernel.org/all/20211122154714.xaoxok3fpk5bgznz@linutronix.de/

ping.

Sebastian

