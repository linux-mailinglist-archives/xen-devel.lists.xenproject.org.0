Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SACRJges12kMRQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:39:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051A23CB620
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277381.1562594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApb8-00052Z-6E; Thu, 09 Apr 2026 13:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277381.1562594; Thu, 09 Apr 2026 13:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApb8-000516-2a; Thu, 09 Apr 2026 13:39:06 +0000
Received: by outflank-mailman (input) for mailman id 1277381;
 Thu, 09 Apr 2026 13:39:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wApb6-000510-AT
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:39:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApb4-009SaE-49
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:39:03 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d7abec-5cb7-0a2a0a5109dd-0a2a450be708-20
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:39:03 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d7abf7-bca8-0a2a450b0019-d155802fd1f8-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:39:03 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488b00ed86fso9998515e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 06:39:03 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ccfb7912sm50598895e9.0.2026.04.09.06.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 06:39:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775741943; x=1776346743; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0oORSVLd7vxYi37eQ1hOt5lcg/1JZwZxdRxBYDZMYW8=;
        b=DwHXtNMEH5/UefQo4/PkTZ9EsJdNDFhmSCvCQCbD97r8YEXw12dlb+m4yifJKox87o
         Mqe8LrrncNDcmuCMIs15b2JqweYpu9AqtC9N1+HmVDqoa8qpDqrnlbZ6FvS1xgDisWv8
         GCbbAntDL+6xyhy3wv3zsZaMkFARAoQZ9Q8Mfw1AhQNYdnNWZAoTEY7S6h5ZkuAgKNvU
         3fHlBcnV+aqrIxBE+MyWEqAyWj5rGMBL3S/6rfKAJhSjcTmTWo/7YZb/u87F+Wcgzp1a
         PiON5GzIOTTOmtnQnPbA7V9HcmXeTlEdgRac1FzwBQi2SL74buvoAkDV/fNfZsmDmQoz
         VAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775741943; x=1776346743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0oORSVLd7vxYi37eQ1hOt5lcg/1JZwZxdRxBYDZMYW8=;
        b=ST34xOvwLuDeBwyOHUKaIMK5BpOqTz+tV0QzZgmP6vV1BMmv/kKLAYE4q+XUUSkj6W
         NMfG2lwmm40dFoXSceYLhuDBV1kpgFp+61NVBXa9RkyiJsCLacBBImaSEDjZZ4pWsXtV
         B8/oPD867i0kEAr8OdS6zLnIiXUzj2FUni+l4HutD7RjlRLFPZRSurORJ3ZmQUuWPlEI
         n5mdIZPZ1Aj6KxIxzmVbDjkJPjq0SfHFJEiNh3z/GzpiE1MSCHiw1abKmI5VXaw4iWca
         EDY1TRNaomRUcE3aCv9zGG3BhEWy+kKhkVmSAHSeQMAXQKfxIMCZHt0RiNnsZ8z2drgU
         KjwA==
X-Forwarded-Encrypted: i=1; AJvYcCW60cNmRsUryZ0HSUuMANwCr+m+IaRKCPsg7GHj0gPZdm4wgefeNKtnSrpYrvhNTpL6/dvQRl1GMlQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjPgvbATvPltXEG/UWpQAh/4pmfbvYd2DadE2AKr4w4JtLt4Jb
	l67qITshE4TxYzczmxabCQGp0lJFFzun/xZCx6QOaxhr3c7H1pRyugd4
X-Gm-Gg: AeBDievbb2HhZuxjUQJ+ZAgYGHHYAw8xM85l7eoXNMzquo/COAhXTRRoSjTNmy8959L
	pffoKvCQJ5DxvRCMr2BJ2CzGkq1dBgSzn0VFAUUxwEqKFFNrb+cRlg/JdTIzy0XOKwJc36Lg/Jg
	ryPNGcgSiDSmIIUvn25hyAawswtUcZTasaiWmavT0N4Sd9KFZc/uPq/jv4Bhm0K0u6TjAPL08hO
	vPt49ekKY6YCFaDXf9jRSATcDUCuB+F/Mruk3dl4GOik6e3e6TMz9dGulxskOO2uSg3mIKELCHd
	otnYwzRzYGNF4wVygOIxK4sjPbZIugKQPPuxIiU5837ezQwk2S5kWAl89fFFo/Wfhzq5PpHouYa
	W1yIfTed1Z+86z6+XMl23xH7tlcAgDkjjEYpCjCMrLnRn0GrD5HwYEB5UYOC2r8PCfhTD3TZn17
	G3alFqELzv+ma6ERLx2T4lXcAHlGOK5pCn81kJGk0g9nu5KjAwg6O8Wa1/4BlFFbQBbAHrE0k5a
	t4=
X-Received: by 2002:a05:600c:1e0f:b0:488:b1c7:b432 with SMTP id 5b1f17b1804b1-488cd059947mr53266585e9.24.1775741942835;
        Thu, 09 Apr 2026 06:39:02 -0700 (PDT)
Message-ID: <2926ad08-39c8-4559-bb40-7231c69d9a65@gmail.com>
Date: Thu, 9 Apr 2026 15:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/27] xen/riscv: Implement construct_domain()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <3a86599284108e6f2a27488a03145f8dd1b71def.1773157782.git.oleksii.kurochko@gmail.com>
 <cd1fa52a-0ff2-4b7f-9b0b-c33b6a01b6c8@suse.com>
 <95fc62d9-cfd4-4b75-a9b0-7e90c9ba1095@gmail.com>
 <c3e20570-6dbf-4dd9-86de-d334e0f71f3a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c3e20570-6dbf-4dd9-86de-d334e0f71f3a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1775741943-17F462A1-E4BB3BEC/10/73395122804
X-purgate-type: spam
X-purgate-size: 3628
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 051A23CB620
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/9/26 2:58 PM, Jan Beulich wrote:
>>>> +{
>>>> +    struct vcpu *v = d->vcpu[0];
>>>> +    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(v);
>>>> +
>>>> +    BUG_ON(d->vcpu[0] == NULL);
>>> Why not simply "!v"?
>> It could work. I'll apply that.
>>
>>> Also, while in the cover letter you state a dependency on another series,
>>> this is somewhat unwieldy here. From the titles there I can't deduce which
>>> of the patches would introduce vcpu_guest_cpu_user_regs(). Yet I would
>>> have wanted to double check that it doesn't de-reference v already.
>> It was already merged. It was part of:
>>    xen/riscv: implement vcpu_csr_init() "02b3a1b0e53c"
> Oh, indeed. Which makes clear that the BUG_ON() comes too late.

It makes this BUG_ON() unnessary at all if d->vcpu[0] wasn't created 
then construct_domain() won't be called for such domain.

I will just drop this BUG_ON().

> 
>>>> +    BUG_ON(v->is_initialised);
>>>> +
>>>> +    kernel_load(kinfo);
>>>> +    initrd_load(kinfo, copy_to_guest_phys);
>>>> +    dtb_load(kinfo, copy_to_guest_phys);
>>> These all return void, despite this also being used for non-Dom0. Is it
>>> really fatal to a dom0less system if one out of many domains fail to be
>>> built?
>> For a dom0less system, my opinion is that it should not be fatal, it
>> should simply ignore a domain that fails to build and continue with the
>> rest. However, with the current common dom0less code it will just
>> panic(). This is a behavior I would like to change and it is on my TODO
>> list.
>>
>> Regarding the functions returning void, this is because all of them
>> currently call panic() on failure, which I expect will need to change in
>> order to ignore a domain that fails to build in dom0less mode.
>>
>> For the current implementation of the common dom0less code this is fine,
>> but I agree it should be addressed in a separate patch series.
>>
>>    Especially when, despite the name, there is a Dom0?
>>
>> For this case, a failure there should indeed be fatal, so panic() is
>> appropriate.
> I think you misunderstood. I wasn't referring to the building of Dom0
> failing. Was rather emphasizing that when there is a Dom0, failure to
> create a DomU likely should even less so be fatal, as Dom0 could later
> rectify the situation.

Oh, okay, then it is really less fatal if DomU creation will fail in the 
case of Dom0.

> 
>>>> +    regs->sepc = kinfo->entry;
>>>> +
>>>> +    /* Guest boot cpuid = 0 */
>>>> +    regs->a0 = 0;
>>>> +    regs->a1 = kinfo->dtb_paddr;
>>>> +
>>>> +    for ( unsigned int i = 1; i < d->max_vcpus; i++ )
>>>> +    {
>>>> +        if ( vcpu_create(d, i) == NULL )
>>>> +        {
>>>> +            printk("Failed to allocate %pd v%d\n", d, i);
>>>> +            break;
>>> And no error is indicated to the caller?
>> No, as generally it is enough to have only one vCPU0 to run domain, so
>> we have to print that something went wrong with allocation of vCPU1...n
>> but it is okay to me to continue domain construction.
> Hmm, now that I look there, sched_setup_dom0_vcpus() ignores errors
> and doesn't even emit a log message. Question is why neither Arm nor
> RISC-V use that function, when we have it.

I haven't seen this function, I will re-use it and in separate patch 
suggest to re-use it for Arm.

One thing I think we want to do then is to drop #ifdef x86 around 
sched_setup_dom0_vcpus() and rename it to sched_setup_dom_vcpus().
And maybe add dprintk()'s to provide some information about which vCPUs 
were created and which not.

~ Oleksii

