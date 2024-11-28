Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3849DB5E1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 11:44:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845268.1260729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGc0k-0001os-Hb; Thu, 28 Nov 2024 10:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845268.1260729; Thu, 28 Nov 2024 10:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGc0k-0001mc-Ev; Thu, 28 Nov 2024 10:44:38 +0000
Received: by outflank-mailman (input) for mailman id 845268;
 Thu, 28 Nov 2024 10:44:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53lb=SX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tGc0j-0001mW-RF
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 10:44:37 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c03f2d57-ad75-11ef-99a3-01e77a169b0f;
 Thu, 28 Nov 2024 11:44:32 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa539d2b4b2so129251066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 02:44:32 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e6dd9sm52415166b.92.2024.11.28.02.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 02:44:31 -0800 (PST)
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
X-Inumbo-ID: c03f2d57-ad75-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmMiLCJoZWxvIjoibWFpbC1lajEteDYyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMwM2YyZDU3LWFkNzUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzkwNjcyLjE1ODk0MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732790671; x=1733395471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+4djCGCTRnV2aYfxIR+FOc2yoE4WGWpYsqnf402GIg8=;
        b=ksnmnCN15YrBsCWHkK+FrbwV6isCkM+LOPoIvGy2aVmbV4J8ewj0jzvxcpVcR+4Hq7
         RuRvdtLdOgmVobc0sMa3vw71HAuhoJPbMKyIQHZrK1QEeAPaYBK0sANj0dRTxcvXey3o
         u46jeyDa/QqnGTg06T5KWs+IU9g55OhOyrV9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790671; x=1733395471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4djCGCTRnV2aYfxIR+FOc2yoE4WGWpYsqnf402GIg8=;
        b=ng932weag4Pmp/25OCYSvzzMphkGnFoJAIi5QiCLiYlDv4eWTghyPDoR6hNzdfZr4S
         8NqA3+2JqalyyPVAmCzt3MtFRH5PSVy618bq4rPjbFiE6j3E/7xjnxEWiGyv+KZ6SMg0
         6Pn7XD1i0rT/t9JxnXzhZDhMYCYvaBgUzc1rW9jhs/kT+DHSKaQ9aGBbc0Xyz6reSkyc
         8b/YeShDTeSgKrE/MVspy6WkzNLh5bTizDD5APPIPfs4ghAU2YcMkeZYtzONJ9WRxTAS
         GPDrkpwbytq3393h/EA9anGSNNOSZimFf1Ex+tqofZZi74bI3wC1DRS0ordIgA8OjYGB
         VXOA==
X-Forwarded-Encrypted: i=1; AJvYcCVjhTVWPCF1GfTpKnBBzwLzJ755ngI+ouTG/82SkZFIIqwej4TPxBTj1GFJu6kQnKQ9zO7QhjJPdX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzASP/UsAe+Rur98NNdxrWcYc5zH7Y8ysjPYvAvMW3LW06bstKh
	qZnJiKlYaFuf1vx1jpLq7pEYd6pAs1QGnKbjIuW6gU/DkjQGcTLI8jVxsw9d9+g=
X-Gm-Gg: ASbGncszkM3ecubhYZqlspnp6UmT5x6DyMFtQCb+APn1ne6+s6DRsqtSey0vVnWOZoC
	7u7d6hU0JT4gljSRHIjOW467JoRei6Za+O4RE5Kg0JHLv1TBQaoFvl4XLeOR+yk1Ls2D8fiW+5H
	DiGCdMH7g/8oYl41tankgWJrz0OvKZGl3/PVjUuHIyWpS/kfMDmN2tNPcvDLakSOtwD3CRBziFG
	HcALSgRrLCKUB6280U2B1I5SkkRcoqp+/E/VsyPnvnOOpb01O5IisH7pGOPUgQ=
X-Google-Smtp-Source: AGHT+IFtqSp4BvYZ7kzz/dByqJ0UEjPu3VAj6ajgE1727ALz0xv2gfSm/wXbCDOyC/CbTFUspiD/5g==
X-Received: by 2002:a17:906:18aa:b0:aa5:438b:513e with SMTP id a640c23a62f3a-aa5946e70cbmr269395466b.30.1732790671538;
        Thu, 28 Nov 2024 02:44:31 -0800 (PST)
Message-ID: <daf8547d-357f-4cae-a537-dc688a920803@citrix.com>
Date: Thu, 28 Nov 2024 10:44:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Remove workaround Pentium 3AP APIC_ESR erratum
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Javi Merino <javi.merino@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
 <20241126205859.23090-1-andrew.cooper3@citrix.com>
 <a2efdf6c-ab52-4ab6-931e-0801844b4875@suse.com>
 <912ba37b-f60f-4423-bb10-37c708382951@citrix.com>
 <7dc98504-9f0d-4d08-bfc7-8f7f96b3c8b5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7dc98504-9f0d-4d08-bfc7-8f7f96b3c8b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/11/2024 9:41 am, Jan Beulich wrote:
> On 27.11.2024 19:01, Andrew Cooper wrote:
>> On 27/11/2024 8:20 am, Jan Beulich wrote:
>>> On 26.11.2024 21:58, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/smpboot.c
>>>> +++ b/xen/arch/x86/smpboot.c
>>>> @@ -422,7 +422,7 @@ void asmlinkage start_secondary(void *unused)
>>>>  static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>>>>  {
>>>>      unsigned long send_status = 0, accept_status = 0;
>>>> -    int maxlvt, timeout, i;
>>>> +    int timeout, i;
>>>>  
>>>>      /*
>>>>       * Normal AP startup uses an INIT-SIPI-SIPI sequence.
>>>> @@ -444,8 +444,7 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>>>>      /*
>>>>       * Be paranoid about clearing APIC errors.
>>>>       */
>>>> -    apic_write(APIC_ESR, 0);
>>>> -    apic_read(APIC_ESR);
>>>> +    apic_read_esr();
>>> ... the one here.
>> ... this one is still correct in place.
> Oh, right.
>
>> I almost had a second function called apic_clear_esr() which was just
>> (void)apic_read_esr().
>>
>> I could put that back in if you think it would be clearer ?
> Nah, it's good as is.

Actually on discussing this with Christian, apic_clear_esr() needs the
write only, and not the read (given no 3AP workaround).

So it is genuinely beneficial to separate apic_{clear,read}_esr() in our
code.

I'll see what the result looks like.  I suspect it will be cleaner-still.

~Andrew

