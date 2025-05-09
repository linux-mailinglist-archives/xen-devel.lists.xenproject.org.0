Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD98AB1BB3
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 19:41:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980302.1366757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDRhi-0004CB-BX; Fri, 09 May 2025 17:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980302.1366757; Fri, 09 May 2025 17:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDRhi-00049g-8o; Fri, 09 May 2025 17:40:10 +0000
Received: by outflank-mailman (input) for mailman id 980302;
 Fri, 09 May 2025 17:40:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZc7=XZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDRhg-00049a-It
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 17:40:08 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a57708db-2cfc-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 19:40:07 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a0b6aa08e5so2085606f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 10:40:07 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4d0dbsm3813015f8f.88.2025.05.09.10.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 10:40:05 -0700 (PDT)
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
X-Inumbo-ID: a57708db-2cfc-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746812406; x=1747417206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/ufqjMjjGLDcX/y6Ny6XzzQY7VtN6IoO8mdowiNXBhc=;
        b=iGV34uGaVTi8UuDCFd0plaC7iwERVYySwF+Y7vDzQHoJ5aFyLmfcN2VsrQbXm9QMog
         wZUsKI0kzrUtAQ0udDIBf8PxKyuYxFBaG4hLMcxy1y+AgI1BTcRWOCujnga5nvEE41EK
         rS/tTwJJvgS9xQmg0k25BV1auAqzNjfLxNnyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746812406; x=1747417206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ufqjMjjGLDcX/y6Ny6XzzQY7VtN6IoO8mdowiNXBhc=;
        b=K1OPUwn9m3vWRIgqTVQHZq/y4UfoWWqrfaPZtM86gLRJ+r8c9ifn3dnYIky5LbWTip
         3pcm+4J0/qzNldyN0drLvgp9YhnzQoRjCWukH4HAe5JfMJ7yOZ6AH1Z2pSvFT8JHidBy
         VW1Ozx2lXlyNIZ583xXhU057Ef1tMpuiFfH9qt+/9NRdiDa+EIav5yEvzkIcWsl3gm+o
         P66mWQxPViHH5Vz3yFHFbHNnSRucKUZJL+FlYSLknvOwFxf0krdVmHtg6GJgOagaJ1lI
         Sb+ctfnEN1bMv/4GNZFJIzVRdhX4YAatq6iffsWDMf+o+aUbje5j8B3Y1JPOjIaRKrRp
         i+jA==
X-Forwarded-Encrypted: i=1; AJvYcCXwKzTH0rb2W2Z+x3owYJUaqaOZL4zz5+c73d5O/5Q8nP8UWSFV4jilF5VXYPZUY8PJWshJawEm1MA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKfKDtQT+4L3kZnuO8MJwRyMQ6dHZWo7LQC72w8rvG1ovyqqoz
	bSHgQM9hk6GMs33DqNnJqnx81WRfVgU7KhnlOLPtw5BMM3trod9xOLiHD5ADRck=
X-Gm-Gg: ASbGncti+iOO2u9eeuMm6yf2iXiZY8bt5v3Bb05nXqThlILwA7vqUkr1cHqnS1itdRz
	nF5TAx091Sd0E4Afcpau64iPeVmzhwaxde2AUvNNhtyOYzkhgJt+nVsJf/5M5azQgvBuIQH74Ej
	OIhM5gKaMIOMFHJNVQky98TrUgHZKYfLozzlyXGgESJaywvCihybiOwG/lqGq0xaPKcUPQBpyrP
	16ktdQj25MZo+DsvgQSbc4yqYQMZvMnrQBWuDaW9pR0VJRlLsfdyTAp2KLPoYdgG1fZNGo0I2Ez
	V5BWam/en9erZEWuuj1wZvzGCXEoT3z3xZ40SHjoyB89E1eRSPj+EzPl2mojbj8kpbhdeZphqXr
	OKkCwZA==
X-Google-Smtp-Source: AGHT+IGpzR3UIvediz0n3JTh8bTmafordVL/oLFjXDkwr+7iCGoGND6lrzbu67k0NCMWUUGDEOAOEg==
X-Received: by 2002:a5d:64ac:0:b0:38d:ba8e:7327 with SMTP id ffacd0b85a97d-3a1f6a1af23mr3091439f8f.8.1746812406265;
        Fri, 09 May 2025 10:40:06 -0700 (PDT)
Message-ID: <16fa3d79-7963-4334-a587-5cc289cfd693@citrix.com>
Date: Fri, 9 May 2025 18:40:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Allows Secure Boot for Kexec
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250507094253.10395-1-freddy77@gmail.com>
 <a197c145-1fc5-4482-bce9-12511a816a63@citrix.com>
 <CACHz=ZjuJoWCH7Dr4oXSXsFqKHcW3meRGrnPA0zBqZ89Y=DtSA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=ZjuJoWCH7Dr4oXSXsFqKHcW3meRGrnPA0zBqZ89Y=DtSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/05/2025 4:34 pm, Frediano Ziglio wrote:
> On Fri, May 9, 2025 at 4:04 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 07/05/2025 10:42 am, Frediano Ziglio wrote:
>>> Ross Lagerwall (4):
>>>   xen/lib: Export additional sha256 functions
>>>   kexec: Include purgatory in Xen
>>>   kexec: Implement new EFI load types
>>>   kexec: Support non-page-aligned kexec segments
>> I realise a lot of this is coming from kexec-tools and/or Linux, but it
>> looks very very mad.
>>
>> From patch 1, we're embedding this in Xen:
>>
>> xen.git/xen/arch/x86/purgatory$ ls -lah purgatory.ro
>> -rw-r--r-- 1 andrew andrew 30K May  9 15:24 purgatory.ro
>>
>> yet -Wa,--strip-local-absolute alone halves the size:
>>
>> xen.git/xen/arch/x86/purgatory$ ls -lah purgatory.ro
>> -rw-r--r-- 1 andrew andrew 17K May  9 15:25 purgatory.ro
>>
>> Looking at purgatory itself, we enter at purgatory_start, load a local
>> GDT, set up a local stack, call into C for the hashing (and nothing
>> else), then jmp to entry64...
>>
>> ... which loads a (different) local GDT, (different) local stack, loads
>> the GPRs and then jumps into the new kernel.
>>
>> Combined with kexec_reloc(), that's 3x we change GDT and stack in
>> several hundred instructions.
>>
>>
>> Looking further at patch 2, we only set up 3 GPRs; %rip, %rsp and %rdi
>> pointing the parameter block.
>>
>> Patch 2 also contains an a large amount of EFI-editing logic (all
>> vulnerable to XSA-25), which AFAICT exists only because purgatory is
>> built non-PIC and wants relocating.  I can't see any external
>> references, or anything that couldn't be resolved at link time for a PIC
>> build.
>>
>>
>> There are two things which purgatory does which Xen doesn't currently
>> cater for:
>>
>> 1) Setting up the GPRs in that manner
>> 2) The digest checks
>>
>> #1 is very easy to fix and can probably even be done on the current ABI
>> (older Kexecs using purgatory won't care), and #2 ought to be easy too
>> by extending machine_kexec().  We can do the digest checks
>> unconditionally (it's a sensible check irrespective).
>>
> I think the problem of #2 is that doing in the purgatory avoids
> problems like possible memory corruptions. For instance if the host is
> crashing due to some corruption it could not always be possible to
> boot the saved kernel.

It doesn't really matter if Xen does the digest check right at the point
of exiting, or purgatory does it moments later.

If there's memory corruption anywhere on this path, we're not making it
into the crash kernel whomever does the digest check.

Crashing is a best-effort exercise; it's never guaranteed to be successful.
>> I think that removes the majority of this series, with no loss in
>> functionality?
>>
>> Given that we're leaving the signature check to the dom0 kernel (which
>> is TCB and therefore can in the UEFI-SB model), we just might be able to
>> get away without any hypercall changes at all?
>>
> Yes and no. The user space could not provide the purgatory. But if the
> kernel is providing it, preventing the user space to send it, I
> suppose it can be done. At this point however the question is how to
> change the interface provided to userspace for doing it. It could make
> sense to have the changes in xen/include/public/kexec.h and let the
> kernel do the rest.

I'm not really suggesting any change in userpsace/dom0 kernel.  I'm
suggesting "we don't need a purgatory blob at all given two simple
changes in Xen."

This in turn means (I think) we can drop all the ELF relocation logic.

I'm unsure whether we need new hypercall subopts or not.  Even if we do,
I think the result can still be more simple than currently presented.

~Andrew

