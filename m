Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3994AB3B80
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:59:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981672.1368079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUcH-0001jn-6Q; Mon, 12 May 2025 14:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981672.1368079; Mon, 12 May 2025 14:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUcH-0001iN-3h; Mon, 12 May 2025 14:58:53 +0000
Received: by outflank-mailman (input) for mailman id 981672;
 Mon, 12 May 2025 14:58:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oz7/=X4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uEUcF-0001iH-4h
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:58:51 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99f5e65d-2f41-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 16:58:45 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-442ccf0e1b3so53234465e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:58:45 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd34bde2sm169088925e9.19.2025.05.12.07.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 07:58:44 -0700 (PDT)
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
X-Inumbo-ID: 99f5e65d-2f41-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747061925; x=1747666725; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oECtGyyiEbPi9KU2nBruScd8gOF2xB3/flfzNokTBcM=;
        b=c10NYhyxocF0goXqPe3fORb/dGCfKGjM5yNoUr3VIXAgsVdtI2pz58aZ+N2XT36Um3
         BFG1AoEf31aL1jvJvLJLFgy75vWBC+kC42wOtRiD0BrfqOPIzuJYZO36CqeqLW7ac8jB
         XKrPL8XJiLPXbxIBI3+HGyEIy7v7xteq/qzaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061925; x=1747666725;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oECtGyyiEbPi9KU2nBruScd8gOF2xB3/flfzNokTBcM=;
        b=AMxBoYZqyqUlWs6NYF+/KpjwmJlL/AYdRpKnJ37pGLHtVcME5t2U/F/gDZ9R0vsbIg
         hN6/NbtDTg1U7o11mEZ0PK94R66ky6LRp6r/uQYQGTVaZAqsB3LrV3VGyN4yD4BUKaZy
         +V87k8K/sMcxfFT74+bPJVYMJTgEkWFdqfIRgasn1H3JBsi1+LB3zA9KXcKZkyI8dIpz
         eMHscqYQX4isMNDvHowI+4OYClMLqS3kT3lT0VXpkkcEA8I5nsGbgpKIjiXBQtSdCW+z
         PeVWzsz1UcFAXUWXDKibni4fxUXzhgoia4xem0FVHlJMml28hPismXzMm8qdqjWBI9/J
         4kxA==
X-Forwarded-Encrypted: i=1; AJvYcCVEUJ8byPSSH9CpbwEzypqDRZLa0R8fqtRKbApaQgducT/7ubq7DUJNVN7ZeMHD2T3N0ZJDkaYKay8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIRHgsNxxZYsg/Rr/dtCCycMTkZcz3lFB6YAEZPRFtZZ9WiF+T
	cLPCheOBkt62bLsOjTdxNpOPboZS5DLtEdGyvZvSd0rYsbx9w65D26AjQF/V2bA=
X-Gm-Gg: ASbGncunSOdhvmHSSGvcotQaEOKApK3OuOHZjUTjTcbatvFBw2BCa//JOtIsM0qReFs
	HTwYPBUPuT22geZzmTAUvZP/owc+gt06VAlI/lQ3ks+EdKcUmJU6vrDpHgzrlMV+9z56+uGlN6E
	Y5BCXghEHJzgjfsk5IdfAGyhzA/L28jYjHa+hzY4doZZNGNDTbrK5XF4wohdx0XnRKTO3F6rt1p
	jaWBp6TPo156mLFCbD72M7QoQ3/+RZCERNfNaVS86+57R8RwLwouMWELEuWnIziLugd3lhvOcTN
	3uu4Xw1G7Ag4FIidZEjIz0Fs1QeAK1rH8WYLjNEYm22XfbZTj0uCd2UnZaWizV2e82Xz3t5lP1/
	XAVi2RXKILq7Bt1SR
X-Google-Smtp-Source: AGHT+IEW7PuhQk6tqVlitcwb25jEIiD7HkCOPGAUZblwFTjuhLPszhi9agikIkQc6V5LgJP0OKNLxw==
X-Received: by 2002:a05:600c:46c3:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-442d6d18bdcmr122788675e9.2.1747061924600;
        Mon, 12 May 2025 07:58:44 -0700 (PDT)
Message-ID: <63652356-4b82-401f-a6ba-8eb53b2f8317@citrix.com>
Date: Mon, 12 May 2025 15:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/Kconfig: Improve help test for speculative options
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250508160336.2232152-1-andrew.cooper3@citrix.com>
 <18f73078-c512-416b-9406-c76f8db178eb@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <18f73078-c512-416b-9406-c76f8db178eb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/05/2025 11:58 am, Jan Beulich wrote:
> On 08.05.2025 18:03, Andrew Cooper wrote:
>> The text for CONFIG_INDIRECT_THUNK isn't really correct, and was already stale
>> by the time speculative vulnerabilities hit the headlines in 2018.  It is
>> specifically an out-of-line-ing mechansim, and repoline is one of several
>> safety sequences used.
>>
>> Some of this boilerplate has been copied into all other options, and isn't
>> interesting for the target audience given that they're all in a "Speculative
>> Hardning" menu.
>>
>> Reword it to be more concise.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>
>> CONFIG_SPECULATIVE_HARDEN_BRANCH really ought to be named
>> CONFIG_SPECULATIVE_HARDEN_CONDITIONAL, but this would be a (minor) functional
>> change.
> Hmm, so you're suggesting all the straight-line speculation changes then ought
> to be conditional upon a separate, new Kconfig control? So far I've keyed them
> all to this one.

Straight line speculation is complicated in multiple ways, and our
understanding has evolved over time.

I'd forgotten that we grouped it with HARDEN_BRANCH, and it is not an
ideal grouping.  What we have in the way of SLS protections are token at
best.

First, in light of Branch Type Confusion on Fam17h processors, where any
instruction can manifest as a speculative branch, there's nothing that
can be done.  (This was demonstrated rather more thoroughly with SRSO
than BTC.)

There is straight line decode (at least) through any branch the
predictor doesn't know about.  Only "taken branches" get tracked, but
also you get a higher rate of SLS immediately after leaving userspace
for a long time (such that the branch predictor fully lost supervisor
state).  Again, this is inherent and we cannot control it.

Intel say that a branch type mismatch (for a direct branch) will halt at
decode.  Indirect branches are documented to potentially suffer SLS. 
AMD Fam19h say that any branch type mismatch will halt at decode.  Also,
with AMD IBRS, indirect branches stall dispatch until they execute.


Therefore, it's indirect branches which are of most concern.

Putting an INT3 after any unconditional JMP *ind is easy.  Compilers
even support doing this.  CALL *ind on the other hand has architectural
execution beyond it, so if protection is needed, LFENCE is the only option.

~Andrew

