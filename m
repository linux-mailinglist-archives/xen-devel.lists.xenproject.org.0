Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIP/GgqsDWqP1QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:41:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D200358DF5A
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:41:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313925.1583949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPgEH-0006T5-K5; Wed, 20 May 2026 12:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313925.1583949; Wed, 20 May 2026 12:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPgEH-0006Qf-HT; Wed, 20 May 2026 12:40:53 +0000
Received: by outflank-mailman (input) for mailman id 1313925;
 Wed, 20 May 2026 12:40:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPgEG-0006QZ-1O
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 12:40:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPgEF-00H8DU-69
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:40:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0dabd3-bab6-0a2a0a5309dd-0a2a4506d19a-0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:40:51 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0dabd2-7371-0a2a45060019-d155dd2ca9bc-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:40:51 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43d75312379so3982472f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:40:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec39806sm52771104f8f.9.2026.05.20.05.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 05:40:50 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779280850; x=1779885650; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OVbt8LF2TFC/GW9jTs7SUeYjjipR2rJOKtaePna5zpo=;
        b=WT/d6FIaOf0P1HS1k/6FLrF8If1Aj2tleB7Q3qLxmTDw8f8hFixgLmeigy8O68eCzJ
         oPfjf8QDHyCu0086s+LmyLrzm1TcTo1sOHENbFosDRNsD9v9GHHSjIPLXGvBdWnlYMw2
         yfdOi1pEndjDYP0DTelOE4llYFKYBn18p92DaUd23h8QB+k1Y1TFssKqIzgVaUuUYx+d
         pJhJutOU8unoUbOxodZxuvttfCJU6vdqnuE4Rga6teQAghhLbDFD3vTCTfl7rxyLEENs
         ROb+LxSx3ijrVk3pi38Lg7NxDlelcpXtGv8P5hm4va7iClEJfakoZkz5lv+r93ZqzNa9
         AAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280850; x=1779885650;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVbt8LF2TFC/GW9jTs7SUeYjjipR2rJOKtaePna5zpo=;
        b=GGAg8woHJioSfJlRr/QG5jTbiv0B8jEuV/toIUsyfgwTcC/2agMwvBP2uaBw3ZY/xH
         nlr3KJ+k3DgCEmDoOamoI9N/rCdKjHXMOS3WW2siP33eWWR9t4zPF2pJQBB/h+iwSXGO
         nauyeGkRAxAwzaaXaCVcjgkmJC6IyVOT6Cwg5Sv9hrLw/veFD5z1ejC1M77bLbVRUzAf
         hU03oIjB/kBr58p5D+xtrOaQ51m6Hg5QaGMKVJNtNCnTnEGdEVItUfDzBdesLckL326b
         OT8h59Ms0LHl5wW0/HLVaheslBDiVH7B5FMVXNLfCaVmFL+wke30IMVajd9v4oI8ZLf0
         WrjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Jnm/Hysc4fxi8bP9CUBNKhIBI21gSnMkn7Of3xQn0Ga6Ve0Rz4fSEaJmrVHFEHLFAiIy4EcmVthE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxESZDCiBD4rX3Xxiv5AIDlgalzYVL5FmMUfsKpitFVOy8AurjX
	LjIMvBTwa0S5BZGOcGav5xK4ng8gJUE9HAF5WBzZIR0+Q0Bj0qxCbfVMULlch3wJYQ==
X-Gm-Gg: Acq92OHpA6in6ySxo3jetvCPYE0XuHe9WZIDbwmkZ09cE1aP6qlykSs5kEjh8fHlzo/
	CXqjEC+3gCHcg8CeCBg3PX16ytPE6T/xlJ6Cf822jXgTvwXKHkQDDozaD6eiRMdWm8r/Kb1Cu3Z
	UF9IHPtsPKvU+nahRMQHmK40m+p5poJjl//21VYj1FntxltAqYnVdvhffRwRcmHfzPZoDNRDtpB
	BpR1mGE7FaTbzVm6SY/uxMTwXCWoM9tLgFsMXR4ka9Tz377bX2Q+ATPv6ALLgB0FgaZPCEvoNE+
	X56SB01cIRj+p7GGwpg0aVGNVG0lExEnCtGr1s75aFo5pLBQnnCi6GR12znA6kXnWRSY6jYZPvy
	oeSqA6d1Qh3anAsJcxZ9vhpfCUan0Vw1413ElhwndNdfFrqMuWOVU+7vH4psVk2cvojqi1itNWW
	DHgaytzzR1C0caOiaScIT4dJDkxnSH/6rDFfU2atAzmXf4HBc9uAESwa4fkl1QigSoFkyT6Pisr
	sLdRcpft6AfquM=
X-Received: by 2002:a05:6000:23c6:b0:450:ad00:86aa with SMTP id ffacd0b85a97d-45d92796fefmr27972862f8f.15.1779280850574;
        Wed, 20 May 2026 05:40:50 -0700 (PDT)
Message-ID: <abb57426-4336-448d-b529-bbef066d8ae6@suse.com>
Date: Wed, 20 May 2026 14:40:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v6] x86/svm: Support vNMI on capable hardware
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260514175623.1869042-1-andrew.cooper3@citrix.com>
 <559dc10a-d390-4723-8c52-f649a7acf8e0@suse.com>
 <79b1d15d-f18c-4cc1-a763-ea2d10d6f91c@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <79b1d15d-f18c-4cc1-a763-ea2d10d6f91c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1779280851-87B7DD75-90B825AD/0/0
X-purgate-type: clean
X-purgate-size: 1539
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:abdelkareem.abdelsaamad@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D200358DF5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18.05.2026 13:12, Andrew Cooper wrote:
> On 18/05/2026 8:53 am, Jan Beulich wrote:
>> On 14.05.2026 19:56, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/hvm/svm/intr.c
>>> +++ b/xen/arch/x86/hvm/svm/intr.c
>>> @@ -33,6 +33,12 @@ static void svm_inject_nmi(struct vcpu *v)
>>>      u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>>>      intinfo_t event;
>>>  
>>> +    if ( vmcb->_vintr.fields.vnmi_enable )
>>> +    {
>>> +        vmcb->_vintr.fields.vnmi_pending = true;
>>> +        return;
>>> +    }
>> How does all of this work during migration to a vNMI-incapable host? The
>> hw feature is used ...
>>
>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>> @@ -185,6 +185,8 @@ static int construct_vmcb(struct vcpu *v)
>>>      if ( default_xen_spec_ctrl == SPEC_CTRL_STIBP )
>>>          v->arch.msrs->spec_ctrl.raw = SPEC_CTRL_STIBP;
>>>  
>>> +    vmcb->_vintr.fields.vnmi_enable = cpu_has_svm_vnmi;
>> ... unconditionally when available (i.e. the feature not being there
>> won't prevent the migration), yet the vnmi_{pend,block}ing fields are
>> lost during migration (aiui). Are building on the fact that all of this
>> state is already getting lost while migrating?
> 
> I can't quite parse the final sentence, but yes; migration has always
> lost the NMI state.

In which case:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

> This goes largely unnoticed because guests don't issue their final
> suspend from NMI context.
> 
> ~Andrew


