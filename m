Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE427C0D984
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 13:39:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151596.1482115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDMUr-0005Zz-8o; Mon, 27 Oct 2025 12:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151596.1482115; Mon, 27 Oct 2025 12:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDMUr-0005Wr-57; Mon, 27 Oct 2025 12:38:49 +0000
Received: by outflank-mailman (input) for mailman id 1151596;
 Mon, 27 Oct 2025 12:38:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v/7+=5E=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1vDMUp-0005Wl-RI
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 12:38:47 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df92ace5-b331-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 13:38:44 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-SrQ0UeErOUqunzsoolkAgw-1; Mon, 27 Oct 2025 08:38:42 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4711899ab0aso31755145e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 05:38:41 -0700 (PDT)
Received: from [192.168.3.141] (p4ff1f1cf.dip0.t-ipconnect.de.
 [79.241.241.207]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd489e6dsm133581265e9.6.2025.10.27.05.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 05:38:39 -0700 (PDT)
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
X-Inumbo-ID: df92ace5-b331-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761568723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4cvIQRmqmBNV8P6YdgjJbon9LLe8l/9b6yM7q+yxHTQ=;
	b=c6eRaNEn3DkmXxywCs1O2CdnP4uVd0uKWqn8MuLxzrLgdAQolpaobJhMWi8VS0JUkr8Qpt
	UoFYqTVUzS8EijmomEI0MjvaTYvZTvy+27EVmx2ybQTMKgs7VXXc9dEDafQ6364giwt3kH
	IA01NMC0f0p6dCq3j974ufLpu/lOgF4=
X-MC-Unique: SrQ0UeErOUqunzsoolkAgw-1
X-Mimecast-MFC-AGG-ID: SrQ0UeErOUqunzsoolkAgw_1761568721
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568721; x=1762173521;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cvIQRmqmBNV8P6YdgjJbon9LLe8l/9b6yM7q+yxHTQ=;
        b=bHvbcHJZBFyfoAygmzGGmox+ZpNKHPA5PYQ7VO6XfA4KA/zLfq/ozi7yEQUD/R+0Wu
         SyktH8sutwVKRTEMmUlQ8E9R0esd/+z9+P1CsDSSh4ViPhEcoD3TpNNP297MKtauEPJQ
         Rf1uh7AiebMS7iv4EGAzkRKqf8dq93QO/CopCV/G0AVUU9KNZY8Lc58NIUF6nzEIMoYs
         ouJt9DKXnL8Ieah3ETThK6D8v0q4hg4G2qxqxdVfef3PX/VH1jB/1s+dCQF/lVM18M3i
         mw82l5M+EJFyERE9RvCtLjZii06c+ZCB+DklWOZjn02WqEk/kgo6j6VRPuK+RtCP658V
         1GJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6dwKmxW8cgOrz9CAcdDJ9jpC/8hTDCzWKf9Yg/VN0bjTSliCR90gHuiDjS8fjgGj2Egs4vro+2Ug=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzD91rCcDqyivZnrgeOKUgeuPJQU7QYcsyF2Fnpg2kvn5x8L8jO
	mA/cyj3fIaGJ5edJE3Ny6tSGOfoZfFm8qQAO4TOXl129hXgdQ8b6CWdb6WWznHUdOjhWT4z2pX4
	l/4DMDL+Q3YEmZuXB+A4Rwkllw46rgWB13CPD1Mr3ORImImMrTTlEHm32FqC6GT4GQxq9
X-Gm-Gg: ASbGncvzFiWXeaC/2uUjiHNMr1v/Bo6FCdLbpacOOcW1vwRjDELnB/R8De2WhXx6Rv2
	zEKkaeZ2pvfiqeKBLC2bJ4fb1OlvJzro7UVRCEWOfb3mo+K4YLsqw7ubsEgzZtwG3u7jhC3wEp3
	gxJtDvMDLzWchjQoDZySD1c57iiKHK7aGVmJ7bFrC6vYKudwb442mwZWz8bkWTp5OM92k1l6JUd
	GiEqoAVDBVwP+xDwAMYtPAq3hgQl6UMaO3V3qsAhwPFa4QVW4cp0JgbAg6ljLGcSeEKEr5Mq/rr
	PxLDkHCJE3C+6Sbab8/4uKrfnJTeMvwOZaUuokk1r9Z4XE3eq9owvvOJzU6B1mL0LbweGdz/7Fh
	z+XvdOeiqb9hOFRofWrmZ28qZwmZgl4g=
X-Received: by 2002:a05:600c:3b03:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-471178a3ff6mr279997785e9.18.1761568720552;
        Mon, 27 Oct 2025 05:38:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9bbdh4PWkc2jU/rl4KkAQD2PqCSpwK7SfjvxDRuSE3bTT/1W5umiWwesFjMbMJkHNKlChlg==
X-Received: by 2002:a05:600c:3b03:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-471178a3ff6mr279997395e9.18.1761568720112;
        Mon, 27 Oct 2025 05:38:40 -0700 (PDT)
Message-ID: <7df81ee0-1161-49f4-a93f-4d9245d48e1d@redhat.com>
Date: Mon, 27 Oct 2025 13:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Woodhouse <dwmw2@infradead.org>, Kevin Brodsky
 <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-12-kevin.brodsky@arm.com>
 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
 <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
 <cbe0d305cce6d76e00b64e7209f15b4645c15033.camel@infradead.org>
 <fcd7b731d38b256e59edd532e792a00efa4e144e.camel@physik.fu-berlin.de>
 <9faf750e-2369-4fae-b58a-ed9052cfd6f6@redhat.com>
 <1d9f416fd3665faf27841b6305b1e8d661427125.camel@physik.fu-berlin.de>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <1d9f416fd3665faf27841b6305b1e8d661427125.camel@physik.fu-berlin.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h2l2rt6-6euKfBuBV5GYnAsFCqk_iFu53OW9-4gWXEM_1761568721
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.10.25 17:51, John Paul Adrian Glaubitz wrote:
> Hi David,

Hi,

> 
> On Fri, 2025-10-24 at 17:47 +0200, David Hildenbrand wrote:
>>> Please have people test kernel changes on SPARC on real hardware. QEMU does not
>>> emulate sun4v, for example, and therefore testing in QEMU does not cover all
>>> of SPARC hardware.
>>>
>>> There are plenty of people on the debian-sparc, gentoo-sparc and sparclinux
>>> LKML mailing lists that can test kernel patches for SPARC. If SPARC-relevant
>>> changes need to be tested, please ask there and don't bury such things in a
>>> deeply nested thread in a discussion which doesn't even have SPARC in the
>>> mail subject.
>>
>> out of curiosity, do people monitor sparclinux@ for changes to actively
>> offer testing when required -- like would it be sufficient to CC
>> relevant maintainers+list (like done here) and raise in the cover letter
>> that some testing help would be appreciated?
> 
> Yes, that's definitely the case. But it should be obvious that from the subject
> of the mail that the change affects SPARC as not everyone can read every mail
> they're receiving through mailing lists.

Agreed. One would hope that people only CC the sparc mailing list + 
maintainers when there is actually something relevant in there.

Also, it would be nice if someone (e.g., the maintainer or reviewers) 
could monitor the list to spot that there is testing demand to CC the 
right people.

I guess one problem might be that nobody is getting paid to work on 
sparc I guess (I'm happy to be wrong on that one :) ).

Regarding sparc, I'll keep in mind that we might have to write a 
separate mail to the list to get some help with testing.

> 
> I'm trying to keep up, but since I'm on mailing lists for many different architectures,
> mails can slip through the cracks.

Yeah, that's understandable.

> 
> For people that want to test changes on SPARC regularly, I can also offer accounts
> on SPARC test machines running on a Solaris LDOM (logical domain) on a SPARC T4.

For example, I do have a s390x machine in an IBM cloud where I can test 
stuff. But I worked on s390x before, so I know how to test and what to 
test, and how to troubleshoot.

On sparc I'd unfortunately have a hard time even understanding whether a 
simple boot test on some machine will actually trigger what I wanted to 
test :(

-- 
Cheers

David / dhildenb


