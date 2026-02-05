Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMhXAC7LhGk45QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 17:54:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660AAF586F
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 17:54:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222258.1530257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2c8-000116-AS; Thu, 05 Feb 2026 16:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222258.1530257; Thu, 05 Feb 2026 16:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2c8-0000y1-7J; Thu, 05 Feb 2026 16:53:56 +0000
Received: by outflank-mailman (input) for mailman id 1222258;
 Thu, 05 Feb 2026 16:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vo2c6-0000xr-D3
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 16:53:54 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40abb575-02b3-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 17:53:53 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-658034ce0e3so1953277a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 08:53:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65949ed6b7esm2282020a12.11.2026.02.05.08.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 08:53:52 -0800 (PST)
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
X-Inumbo-ID: 40abb575-02b3-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770310433; x=1770915233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aDW2its2ag7sQlrKqMebqKmR/ovlHMxA0hy54j4hfaI=;
        b=BixUkDskfq2ovToKnlreKqoXcGEyOEebLPOcQ17DjZvKcLXeDG9uyL7tmuCHdG4fbO
         5Zs9nMktybjHGK/gynq8It+kV35/Mv/3R/4lTv1bdw4IYKSzwnm8LSEt/azaaZJ4gYKC
         xcBoE0TNo+xnAsendFYg7JQsXAtBBnFWh63Aid5ha3fGsUovdrSL5CUY+qICInjkV67s
         8wnOJmn32ExvW9XibC5RPq5nGKu6kAPxDeYsYIF3xgYtMv278fS8Ck/7ivRgHYbl8021
         30aKXqSzfjRmVbzfPpn4GGVpAidww3Mb8EZEoEy4BPkuwxw+gGKzc3J3kC/NWEOONjsh
         H2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770310433; x=1770915233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDW2its2ag7sQlrKqMebqKmR/ovlHMxA0hy54j4hfaI=;
        b=oo9bKZQkck4xjlsOM2Vfte3EzPp4owWwFu8jDP0bDeLUYa9xGwcwojcHFKtmTEefMC
         yP1uiY0NsGXq1qUB119rXoVyoHHxpTRPFU8/Otbv65owaDfNaYLhXtmYc+juESXdjial
         AiRsI9shP6loIq3tga7REeZnec8csK9kpiMClggr86F9qBerk+Kfr+TX05u3wTDiW8Ik
         gIRReAmU63fMhg6ZD3lPShkAZkuhxGmcq1s2WSTsvyWwKl3SbYjMEcPSU9p6cJsa6l9U
         JMNVwd/FZosbibj21SEvUas8KRocgFTUbaitJkjr96zLEKz/zl9StunO4n+kYKfY+BZ7
         VO0A==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZRljZ46lVUnQ/ecd8o7TLCiglvAK5L1ojyZpzE6T220EhU4KgdCvSw1W2MQ7aknACsnpdQNF1MU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8yiSsvpbSPvEbts0422Yu/PVt9hakwDoS/CABIxbp+em6U1XX
	REeVHg/kWtzvFM/zbsiBU0uVteLWbFtoFYTmQq7WHuVZTK0c8kKEdXcBGUhLuHg6pw==
X-Gm-Gg: AZuq6aKIumUCJpvrzx4A6k3Y3Ml6LM/4+gHxGppJToDw2Yt1CWFDTdqM0oaiCIU0K1u
	zNOGdpmpRBtFCbxn81ZEWSNTgs7hLUcM+JtnFQ0h+THS6loGF2UHADIU0ipxlQleSVOW1ZDJVJQ
	+F6hTmDgv1h82T/pmnXj2f03RpyOUFCwzDBJ8nq1FBqWAx8eLrMZB7Q2BtqubhiSisHCPL2IVwo
	REmHQpX8d1prnagucAFAin4dszZKJKv7ulo+f6IWLuKg8/AO5WKlbNyOHhl9l10Fv5F4sSpdeex
	YTBbii30hKr6vCQZnO6vrVv09KzvYFU4hhqMDswBUPKMenGSgj4QQ1F1gTo+BJgGx1WlBgv+eAZ
	zjhJr2QAyaaeGxSpfPVwW9BGnttN42rLCOMUlCn1IPL0MdAWMGwqtuXRcwZ/HLr6vA0pI2blTwe
	Bz2BulDI1kXSb87XxPj04C6GpCxCAnPFQfLsgrqyP1NU7vqMpIHAOX98GHvYdA/+3aeZ4QRkvEh
	sA=
X-Received: by 2002:a05:6402:50cf:b0:659:3671:137 with SMTP id 4fb4d7f45d1cf-659499b5160mr3925262a12.1.1770310432761;
        Thu, 05 Feb 2026 08:53:52 -0800 (PST)
Message-ID: <dc87ce96-a54f-4b2e-93df-21240d6372b4@suse.com>
Date: Thu, 5 Feb 2026 17:53:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/16] xen/riscv: implement sync_vcpu_execstate()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <eb254f5a49d01712f9b3745e420dd37a4a9ba0bc.1769099885.git.oleksii.kurochko@gmail.com>
 <316accc5-2e6b-4571-98a7-5776a47a4ad7@suse.com>
 <135afbb9-8863-4a9c-b012-832575f04edb@gmail.com>
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
In-Reply-To: <135afbb9-8863-4a9c-b012-832575f04edb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 660AAF586F
X-Rspamd-Action: no action

On 05.02.2026 17:51, Oleksii Kurochko wrote:
> 
> On 2/4/26 11:49 AM, Jan Beulich wrote:
>> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/domain.c
>>> +++ b/xen/arch/riscv/domain.c
>>> @@ -259,3 +259,21 @@ void sync_local_execstate(void)
>>>   {
>>>       /* Nothing to do -- no lazy switching */
>>>   }
>>> +
>>> +void sync_vcpu_execstate(struct vcpu *v)
>>> +{
>>> +    /*
>>> +     * We don't support lazy switching.
>>> +     *
>>> +     * However the context may have been saved from a remote pCPU so we
>>> +     * need a barrier to ensure it is observed before continuing.
>>> +     *
>>> +     * Per vcpu_context_saved(), the context can be observed when
>>> +     * v->is_running is false (the caller should check it before calling
>>> +     * this function).
>>> +     *
>>> +     * Note this is a full barrier to also prevent update of the context
>>> +     * to happen before it was observed.
>>> +     */
>>> +    smp_mb();
>>> +}
>> Where's the counterpart of this barrier (going to be)?
> 
> As it is mentioned in the comment it is invcpu_context_saved(). ~ Oleksii

You may have seen the Arm side changes to this, as I did Cc you. From that
I think you should understand the background of the question.

Jan

