Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB53B2CD35
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 21:46:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087027.1445180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoSGr-0006DE-4L; Tue, 19 Aug 2025 19:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087027.1445180; Tue, 19 Aug 2025 19:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoSGr-0006Ac-1M; Tue, 19 Aug 2025 19:45:25 +0000
Received: by outflank-mailman (input) for mailman id 1087027;
 Tue, 19 Aug 2025 19:45:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h/XH=27=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uoSGp-0006AW-Qc
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 19:45:23 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0abf117f-7d35-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 21:45:21 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b9d41bea3cso5984533f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 12:45:21 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c077c5767fsm4728251f8f.62.2025.08.19.12.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 12:45:20 -0700 (PDT)
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
X-Inumbo-ID: 0abf117f-7d35-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755632721; x=1756237521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z5DClGb7SROt07W/Ktgq3F9Lcjr5IAxjD2sOWP7WqH8=;
        b=uUQOTb3p2Z1/rH4B5N5aHuE4zkssrZ6K16HU0GtSaOp4vz139I06ptxK+7viIaYlc8
         E16wibclWEGPNaRX9s/gKtWeUY4ujMF8ezp9vRkMnPh622DT65oA4Ns6udXBd+AFusGf
         Eq8XAmqZISv+4vBc7Out4iTupc7B+qlul7rrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755632721; x=1756237521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5DClGb7SROt07W/Ktgq3F9Lcjr5IAxjD2sOWP7WqH8=;
        b=hpBWwCqhmCNGCFurlnYtRkUEbXNFJehANyQGA+I87Dev+HyLZSD/nwH2IQBzzj9rCV
         NAe2mO9vHnNjbBJul5+QJQKdWsF7W7cKt4iMDOFJJ7XHk3nhTK+wB9Ad9oxeB0uVeyzz
         xtgKJNpSc09SV62htAdWuQ0WvII3T5shydWMF8xahOvWP86sve044H0pJ0jNi24kagHV
         4IIrOEanWG7xYBggdYHMvtjx2Fkkd5Nh6Dfhjj0QyWRLT5hcKh5DfwwRdKmGc7TVRohX
         a5gsQDKNISZ7qdR7m1MwR52vMb70/ruwffJ4aWBh5vmBG5gTTGEeSJNP2M9JT5NK95j/
         MdKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2tBWxVgvDQkShefsVLgiyODPPSdtlvPimOhfUN8tAjtaSRdQOmuES6X652W1r9chJDMDa35lniww=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQoZ2JfLdd1P0s96gloE0uUfRBDMBOg1gs77Cnyt/0mFJwyKEM
	wVGCPKwRb17Gm5wPK0BL1InLewRA9EGx8hLbhmEHWfIHP5ydeXpvENvX33mMX9FhoF4=
X-Gm-Gg: ASbGncsS2zUz8/ElHirSI31TUDbsJgFEq3GwGq3elp+c8z7tvVoyGBFBogKRuCnYdyi
	7Yo5lm05JrJAkOv1pX8goVWnrjvn1dK78WUgUoNtu5ikbTnICCqUMYBe7S41yMzO1990rZCEAGm
	5jxLtCca6cZJh++/kAQyaYd9770ra3QQ6G+3nX9yAZ/K3j15lIMXbeos1zbgh4CvY+Vu+CFAB87
	w/w9Q3o2WCT0+ph43GT4zoC3CiKeDQcJPNKr9BTaUyu3nUdBIAoeKY8ViE6Ii+14Xg5GV3VF/zI
	m6rmwaapYgPSUIy41oyCatU+0qOZWJ72r/zhCZLlbIt0IA5PX5aN4iPQrDpnyObV73CSnliKq0S
	pHTNWgWDVoQbQw96v6CQHgZCei8p3WTTi3nngnvu1h+b5ojv/4/7aMqbqosdXyJrU20ea
X-Google-Smtp-Source: AGHT+IHn6ItZ/55KdJjFIlqpp1Vqr+n+RQcvcMCo6Y+dMB7k9WYscwcNwqwPwtL4K5RBGJTqfuyeOQ==
X-Received: by 2002:a05:6000:420a:b0:3b9:48f:4967 with SMTP id ffacd0b85a97d-3c32ecce49bmr164415f8f.56.1755632720979;
        Tue, 19 Aug 2025 12:45:20 -0700 (PDT)
Message-ID: <7f737ca3-5aba-4ae9-820a-448824174f2e@citrix.com>
Date: Tue, 19 Aug 2025 20:45:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/16] x86/msr: Change rdmsr() to have normal API
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-12-andrew.cooper3@citrix.com>
 <493d4580-62b7-4ff7-9159-4079b4b98f61@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <493d4580-62b7-4ff7-9159-4079b4b98f61@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/08/2025 1:04 pm, Jan Beulich wrote:
> On 15.08.2025 22:41, Andrew Cooper wrote:
>> We want a consistent MSR API, and these want to be named rdmsr() and wrmsr(),
>> but not with their current APIs.  The current rdmsr() flavours writing to
>> their parameters by name makes code that reads like invalid C, and is
>> unergonomic to use in lots of cases.
>>
>> Change the API, and update the callers all in one go.  Where appropriate,
>> update the write side to wrmsrns() as per the recommendation.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> I do have a more creative solution if this patch is considered to be too
>> large.  https://gitlab.com/xen-project/hardware/xen-staging/-/commit/e13cf25d06d08481e2c138daa1fd902cf36d757b
> I'm not concerned by the size of this patch.
>
>> --- a/xen/arch/x86/cpu/intel.c
>> +++ b/xen/arch/x86/cpu/intel.c
>> @@ -23,17 +23,17 @@ static uint32_t __ro_after_init mcu_opt_ctrl_val;
>>  
>>  void update_mcu_opt_ctrl(void)
>>  {
>> -    uint32_t mask = mcu_opt_ctrl_mask, lo, hi;
>> +    uint32_t mask = mcu_opt_ctrl_mask, val;
>>  
>>      if ( !mask )
>>          return;
>>  
>> -    rdmsr(MSR_MCU_OPT_CTRL, lo, hi);
>> +    val = rdmsr(MSR_MCU_OPT_CTRL);
>>  
>> -    lo &= ~mask;
>> -    lo |= mcu_opt_ctrl_val;
>> +    val &= ~mask;
>> +    val |= mcu_opt_ctrl_val;
>>  
>> -    wrmsr(MSR_MCU_OPT_CTRL, lo, hi);
>> +    wrmsrns(MSR_MCU_OPT_CTRL, val);
>>  }
> I don't consider it a good idea to suddenly clear the upper half of this
> MSR, and ...
>
>> @@ -51,17 +51,17 @@ static uint32_t __ro_after_init pb_opt_ctrl_val;
>>  
>>  void update_pb_opt_ctrl(void)
>>  {
>> -    uint32_t mask = pb_opt_ctrl_mask, lo, hi;
>> +    uint32_t mask = pb_opt_ctrl_mask, val;
>>  
>>      if ( !mask )
>>          return;
>>  
>> -    rdmsr(MSR_PB_OPT_CTRL, lo, hi);
>> +    val = rdmsr(MSR_PB_OPT_CTRL);
>>  
>> -    lo &= ~mask;
>> -    lo |= pb_opt_ctrl_val;
>> +    val &= ~mask;
>> +    val |= pb_opt_ctrl_val;
>>  
>> -    wrmsr(MSR_PB_OPT_CTRL, lo, hi);
>> +    wrmsrns(MSR_PB_OPT_CTRL, val);
>>  }
> ... this one.

Yeah, both the local variables need turning into uint64_t here.

>
>> @@ -456,15 +456,15 @@ static void __init probe_mwait_errata(void)
>>   */
>>  static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
>>  {
>> -	unsigned long lo, hi;
>> +	uint64_t val;
>>  
>>  	if ((c->x86 == 15) && (c->x86_model == 1) && (c->x86_mask == 1)) {
>> -		rdmsr (MSR_IA32_MISC_ENABLE, lo, hi);
>> -		if ((lo & (1<<9)) == 0) {
>> +		val = rdmsr(MSR_IA32_MISC_ENABLE);
>> +		if ((val & (1 << 9)) == 0) {
>>  			printk (KERN_INFO "CPU: C0 stepping P4 Xeon detected.\n");
>>  			printk (KERN_INFO "CPU: Disabling hardware prefetching (Errata 037)\n");
>> -			lo |= (1<<9);	/* Disable hw prefetching */
>> -			wrmsr (MSR_IA32_MISC_ENABLE, lo, hi);
>> +			val |= (1 << 9); /* Disable hw prefetching */
>> +			wrmsrns(MSR_IA32_MISC_ENABLE, val);
>>  		}
>>  	}
> Move val into the more narrow scope at the same time?

No, not based on the history of this function.

>
>> @@ -699,7 +715,7 @@ void cf_check vmx_cpu_dead(unsigned int cpu)
>>  
>>  static int _vmx_cpu_up(bool bsp)
>>  {
>> -    u32 eax, edx;
>> +    u32 eax;
> Like you do elsewhere, switch to uint32_t at the same time?

Will do.

>
>> --- a/xen/arch/x86/tsx.c
>> +++ b/xen/arch/x86/tsx.c
>> @@ -42,6 +42,8 @@ void tsx_init(void)
>>  {
>>      static bool __read_mostly once;
>>  
>> +    uint64_t val;
>> +
>>      /*
> No real need for yet another newline, I would say.

Where?  Before?  that's separation of static and not.  After? that's
separation of variables and code.  All as we do elsewhere.

~Andrew

