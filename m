Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC1F4694FC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 12:26:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238816.413885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muC89-0006Pi-H5; Mon, 06 Dec 2021 11:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238816.413885; Mon, 06 Dec 2021 11:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muC89-0006N8-E0; Mon, 06 Dec 2021 11:26:01 +0000
Received: by outflank-mailman (input) for mailman id 238816;
 Mon, 06 Dec 2021 11:26:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWHB=QX=linutronix.de=bigeasy@srs-se1.protection.inumbo.net>)
 id 1muC87-0005h1-Tc
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 11:26:00 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48a8fb67-5687-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 12:25:58 +0100 (CET)
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
X-Inumbo-ID: 48a8fb67-5687-11ec-a5e1-b9374ead2679
Date: Mon, 6 Dec 2021 12:25:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638789957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XLs7YgdFMIcnSazYWZg4jsTq0LGaE/jvcz9Rja/NPMc=;
	b=nAoYk+Ns+6rmT6S9GzrSjhIPCBYjUqfpnGgNgz+swrTZH5Hw/lUwxcA6aKMJq7Q1zV6wb8
	lyNZuLXvJ7mORj0HmC2r9A1REaO6OPTuOtCiJhf4MK6jQvZS22Km7jBifTDhEfnLl0amBK
	LKOsEWmcdXrqg2LxF0mM4c8iJ22mWlKB0hM2uMXvqS1S4wXaJHQyrzN8sTx0C5l77fk0tj
	rX9FyDns92354iLK4whoATvbvW0u1G3rUCCx9LfCZFM2UjgRe43x8C4beJ10j+bdrhHmU+
	rDQqwswK9S41FtMsOXDdIKm1HF133yCuAlr6FysAznUe6Qn4lQo+lYA2435Z1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638789957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XLs7YgdFMIcnSazYWZg4jsTq0LGaE/jvcz9Rja/NPMc=;
	b=doqpd2ejENwBdGZzJ4Idl5tc2F68NpSZ4at5EQ4oLMg2zEZwjKY7pzeUgsuXYAnBVvv0S5
	TSsw8u9yi/SU/hDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	"Longpeng (Mike, Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>,
	linux-kernel@vger.kernel.org,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>, x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Valentin Schneider <valentin.schneider@arm.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be
 brought up again.
Message-ID: <20211206112555.ubscfwwxnn5bnyte@linutronix.de>
References: <20211122154714.xaoxok3fpk5bgznz@linutronix.de>
 <87y25djhaj.ffs@tglx>
 <4d04ea65-ea74-dcfd-5b0e-984b44f91961@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4d04ea65-ea74-dcfd-5b0e-984b44f91961@oracle.com>

On 2021-11-24 21:17:34 [-0500], Boris Ostrovsky wrote:
> 
> On 11/24/21 5:54 PM, Thomas Gleixner wrote:
> > Any comment from XEN folks?
> 
> 
> If memory allocation in cpu_initialize_context() fails we will not be
> able to bring up the VCPU because xen_cpu_initialized_map bit at the
> top of that routine will already have been set. We will BUG in
> xen_pv_cpu_up() on second (presumably successful) attempt because
> nothing for that VCPU would be initialized. This can in principle be
> fixed by moving allocation to the top of the routine and freeing
> context if the bit in the bitmap is already set.
> 
> 
> Having said that, allocation really should not fail: for PV guests we
> first bring max number of VCPUs up and then offline them down to
> however many need to run. I think if we fail allocation during boot we
> are going to have a really bad day anyway.
> 

So can we keep the patch as-is or are some changes needed?

> -boris

Sebastian

