Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9829A7A9374
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 12:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606268.944050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjGbj-0007tV-DO; Thu, 21 Sep 2023 10:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606268.944050; Thu, 21 Sep 2023 10:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjGbj-0007rS-AM; Thu, 21 Sep 2023 10:08:27 +0000
Received: by outflank-mailman (input) for mailman id 606268;
 Thu, 21 Sep 2023 10:08:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r6la=FF=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qjGbh-0007rI-Oj
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 10:08:26 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccec859b-5866-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 12:08:24 +0200 (CEST)
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
X-Inumbo-ID: ccec859b-5866-11ee-878a-cb3800f73035
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1695290903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGuV725+A52UkxEuSgzeQeAhaGDz2ANft+qmFiacDG8=;
	b=Uc1XkSaloHBlxYQ1zN6hh9geAvtQDrA6rzrrOm0XEDhASCCuiOJd0ZUQDVk5pu7smVlZfM
	YcyVj5MIlW6dCw0gZAVps0Rws2yHAHtHT3yI0KmpTXMdgnz/3Z1IfNIMpPSXeG2C1xVIZa
	RVC8GvYWzw2wNPbssRcVWZprhIJD5GCzDZQZel4mnlA7NNIdTJN8FZXnfD5refPia6Z4Ep
	NvWaLlqsVp24Afci/BqY4B8bDTeZUFFOfG/ZbjsHOCaUcJSGcTEfuO29KH+o6OntuQsdt1
	Yeu0DTomo1WSKteeMcOT97KH0jVECo7ht6Xx698kxrEZHO2MRgqhLwxglLtcag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1695290903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGuV725+A52UkxEuSgzeQeAhaGDz2ANft+qmFiacDG8=;
	b=YhxFLYB1hUEgCK9ZzqoixCOcdsJ9EkBa/RsLR3qBRdXVZTcXsEUrSFZvzIKcv5QclewR1g
	FaT5gQjP7YRGAsBA==
To: Nikolay Borisov <nik.borisov@suse.com>, Xin Li <xin3.li@intel.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, luto@kernel.org, pbonzini@redhat.com,
 seanjc@google.com, peterz@infradead.org, jgross@suse.com,
 ravi.v.shankar@intel.com, mhiramat@kernel.org, andrew.cooper3@citrix.com,
 jiangshanlai@gmail.com
Subject: Re: [PATCH v10 28/38] x86/fred: FRED entry/exit and dispatch code
In-Reply-To: <22921663-0e5e-58c0-c6c8-c45f991790ea@suse.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-29-xin3.li@intel.com>
 <22921663-0e5e-58c0-c6c8-c45f991790ea@suse.com>
Date: Thu, 21 Sep 2023 12:08:23 +0200
Message-ID: <871qerj0tk.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21 2023 at 12:48, Nikolay Borisov wrote:
> On 14.09.23 =D0=B3. 7:47 =D1=87., Xin Li wrote:
>> +
>> +	/* INT80 */
>> +	case IA32_SYSCALL_VECTOR:
>> +		if (likely(IS_ENABLED(CONFIG_IA32_EMULATION))) {
>
> Since future kernels will support boottime toggling of whether 32bit=20
> syscall interface should be enabled or not as per:
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Dx=
86/entry&id=3D1da5c9bc119d3a749b519596b93f9b2667e93c4a
>
> It will make more sense to replace this with ia32_enabled() invocation.=20
> I guess this could be done as a follow-up patch based on when this is=20
> merged as the ia32_enbaled changes are going to be merged in 6.7.

The simplest solution is to rebase the series to tip x86/entry and just
do it right away :)

