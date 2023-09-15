Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BA17A1234
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 02:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602787.939535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgwRn-0003AC-Qh; Fri, 15 Sep 2023 00:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602787.939535; Fri, 15 Sep 2023 00:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgwRn-00038V-Ny; Fri, 15 Sep 2023 00:12:35 +0000
Received: by outflank-mailman (input) for mailman id 602787;
 Fri, 15 Sep 2023 00:12:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3l1k=E7=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qgwRm-00038P-CG
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 00:12:34 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fbfa563-535c-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 02:12:31 +0200 (CEST)
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
X-Inumbo-ID: 8fbfa563-535c-11ee-9b0d-b553b5be7939
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694736750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KgPRsgSrxVNlEOyySaa1PIQm8JulpVoZGkS4WiKzu2Y=;
	b=Opufk+gWG3Yw6wgO+kfqspHQ/VgFO8K0Ud/Qg7tynRke3PDBgtKU+a460kKb/93gIiUO5L
	bzEoLG4ayaBS8fTrf6QlAolsiu8ly3FxA9C9EAuo7MZTffVz9n1bf7nSCIpvbZSVmXDYVW
	acMz0Jonv3RJ94KgCGiuk2sXBFifOrs6HKWprtunsu+B0FOomTyOogxJ0p7Ixnvh4aziKu
	tLsnvnhq16s2s3UxE26tnjrlvcrBGMLvc4cZsMLWD5evy/Gj658BwlQoIdcEyATUJU76k8
	bO2+R+GllHweAzkZON5NLUw8Xa8uqPVH57q4oEFbEYqLFZJkCnw//4Xc6xac6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694736750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KgPRsgSrxVNlEOyySaa1PIQm8JulpVoZGkS4WiKzu2Y=;
	b=LCuwmEnex0B5wafWqEhRbYoFiiceeuNdckfK2gNVmqyd/yygxlcSv5V67wVBfndBTx2X5k
	Wq/zjvIpWJ6zjYDg==
To: andrew.cooper3@citrix.com, Xin Li <xin3.li@intel.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, luto@kernel.org, pbonzini@redhat.com,
 seanjc@google.com, peterz@infradead.org, jgross@suse.com,
 ravi.v.shankar@intel.com, mhiramat@kernel.org, jiangshanlai@gmail.com
Subject: Re: [PATCH v10 03/38] x86/msr: Add the WRMSRNS instruction support
In-Reply-To: <7ba4ae3e-f75d-66a8-7669-b6eb17c1aa1c@citrix.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-4-xin3.li@intel.com>
 <6f5678ff-f8b1-9ada-c8c7-f32cfb77263a@citrix.com> <87y1h81ht4.ffs@tglx>
 <7ba4ae3e-f75d-66a8-7669-b6eb17c1aa1c@citrix.com>
Date: Fri, 15 Sep 2023 02:12:29 +0200
Message-ID: <87v8cc1ehe.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 15 2023 at 00:46, andrew wrote:
> On 15/09/2023 12:00 am, Thomas Gleixner wrote:
>> So no. I'm fundamentally disagreeing with your recommendation. The way
>> forward is:
>>
>>   1) Provide the native variant for wrmsrns(), i.e. rename the proposed
>>      wrmsrns() to native_wrmsr_ns() and have the X86_FEATURE_WRMSRNS
>>      safety net as you pointed out.
>>
>>      That function can be used in code which is guaranteed to be not
>>      affected by the PV_XXL madness.
>>
>>   2) Come up with a sensible solution for the PV_XXL horrorshow
>>
>>   3) Implement a sane general variant of wrmsr_ns() which handles
>>      both X86_FEATURE_WRMSRNS and X86_MISFEATURE_PV_XXL
>>
>>   4) Convert other code which benefits from the non-serializing variant
>>      to wrmsr_ns()
>
> Well - point 1 is mostly work that needs reverting as part of completing
> point 3, and point 2 clearly needs doing irrespective of anything else.

No. #1 has a value on its own independent of the general variant in #3.

>>      That function can be used in code which is guaranteed to be not
>>      affected by the PV_XXL madness.

That makes a lot of sense because it's guaranteed to generate better
code than whatever we come up with for the PV_XXL nonsense.

Thanks,

        tglx

