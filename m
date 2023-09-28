Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CCA7B24AE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 20:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610010.949217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlvKk-0002lf-O4; Thu, 28 Sep 2023 18:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610010.949217; Thu, 28 Sep 2023 18:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlvKk-0002jW-LO; Thu, 28 Sep 2023 18:01:54 +0000
Received: by outflank-mailman (input) for mailman id 610010;
 Thu, 28 Sep 2023 18:01:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EiTq=FM=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qlvKi-0002jP-Cl
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 18:01:52 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1966e210-5e29-11ee-878b-cb3800f73035;
 Thu, 28 Sep 2023 20:01:51 +0200 (CEST)
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
X-Inumbo-ID: 1966e210-5e29-11ee-878b-cb3800f73035
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1695924109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qCBpASJoVOKX9VMMrGRtPeWsM1IggJ7ZK6sK+Vspaeo=;
	b=qXsrR3/GF7IJihiwraCz8qKW8U2b68LXMY6UjZ3+IEZeLlUpwu8yBGJPZy408Azlz7lycz
	Rj4kjTzZnybeQh46tlfV3i5eXQjbE+k3IssGRQ4iYbgsbCvt4dOIX9AKqFF9hqpsouLjx2
	5dQumKoM/U8QfaT52MkqPCzA/3NncDElzueKLwl6yW7w9WdPutYT2GZt+BO2WQXIQNr16o
	pb7RU8OwZ0GJUC6iDnIyj7Ozlo7Hw6pkxxHYXRzlQNA5gQN4cSz5tE0QLuBN4tFVR61d5h
	0BA7cVC1H0gu2vmgG66P30S3HeoFV0NmX/Pu5uwdjaEwyQI7KG6IBTpFaFOfMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1695924109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qCBpASJoVOKX9VMMrGRtPeWsM1IggJ7ZK6sK+Vspaeo=;
	b=ZggqpdKB9KJL/89VvpA8wkdGK0oIINIwb21C02kaTkeWIRIgr4OEOE1ZY9ScEBJVZYX9F2
	/nS9HIbISQc7oGDA==
To: "H. Peter Anvin" <hpa@zytor.com>, Xin Li <xin3.li@intel.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, luto@kernel.org, pbonzini@redhat.com, seanjc@google.com,
 peterz@infradead.org, jgross@suse.com, ravi.v.shankar@intel.com,
 mhiramat@kernel.org, andrew.cooper3@citrix.com, jiangshanlai@gmail.com,
 nik.borisov@suse.com
Subject: Re: [PATCH v11 35/37] x86/syscall: Split IDT syscall setup code
 into idt_syscall_init()
In-Reply-To: <D4167CD5-B619-448D-B660-24ABC0786E0A@zytor.com>
References: <20230923094212.26520-1-xin3.li@intel.com>
 <20230923094212.26520-36-xin3.li@intel.com>
 <D4167CD5-B619-448D-B660-24ABC0786E0A@zytor.com>
Date: Thu, 28 Sep 2023 20:01:48 +0200
Message-ID: <87y1gqdvn7.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Sep 25 2023 at 09:07, H. Peter Anvin wrote:
> On September 23, 2023 2:42:10 AM PDT, Xin Li <xin3.li@intel.com> wrote:
>>+/* May not be marked __init: used by software suspend */
>>+void syscall_init(void)
>>+{
>>+	/* The default user and kernel segments */
>>+	wrmsr(MSR_STAR, 0, (__USER32_CS << 16) | __KERNEL_CS);
>>+
>>+	idt_syscall_init();
>>+}
>>+
>> #else	/* CONFIG_X86_64 */
>> 
>> #ifdef CONFIG_STACKPROTECTOR
>
> Am I missing something, or is this patch a noop?

Yes. It's a noop at this point. Later on it gains a

     if (!fred)
        idt_syscall_init();

Sure we could do

     if (!fred) {
     	write_msr(foo...);
        ...
     }

too, but I prefer the separation. No strong opinion though.

Thanks,

        tglx

