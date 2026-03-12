Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FxALvDasmlMQQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:25:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235712745DC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 16:25:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252518.1549148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0htm-0002i8-HT; Thu, 12 Mar 2026 15:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252518.1549148; Thu, 12 Mar 2026 15:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0htm-0002gh-EE; Thu, 12 Mar 2026 15:24:30 +0000
Received: by outflank-mailman (input) for mailman id 1252518;
 Thu, 12 Mar 2026 15:24:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0htl-0002gb-UY
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 15:24:29 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f380d24-1e27-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 16:24:28 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439b790af67so1893485f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 08:24:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe1abf84sm8889305f8f.14.2026.03.12.08.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 08:24:27 -0700 (PDT)
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
X-Inumbo-ID: 8f380d24-1e27-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773329067; x=1773933867; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5oLVtQpLqy428cgp/RNfUqKk5b/GyZ/2Zw1sXCyk+Vg=;
        b=JDg46vYufsvc/3c3C284SfnQsnGjpg3l0PSZaCIZX152SSkHhweF0lntIQeMHf8qBG
         Kfhiji56dSgUmXGbDkuix3WE1J5HLkCfFH/KxeVFzvgNJ2/j5ZtmWmd/SPZm7LY/lSm/
         cd60hyuxgdqjrVUI6XW+15xddIft8LHT2boDZ+FA84Jc/cbGVgwHFPdGQhJI6LdsLlfD
         OkjOGeSN/CV1Bh7I61jHX6G9hBOMJHGWLs6jPZ1OMvJfeKC6STKt7I40amZvzDYbAe4R
         ZHdOoNHSliSpOnmYnnUuFprd08guLVU6xY9blxhugoo8btssJeoP/LDJZYAr4GjajQ1V
         h0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773329067; x=1773933867;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oLVtQpLqy428cgp/RNfUqKk5b/GyZ/2Zw1sXCyk+Vg=;
        b=RkUmnpoi6CzvWXR+X+I+xCRAK2iZMtQQXvh4VyR11xMvjI/WYAiBtAfplyMfCX0R0R
         +oHScW6Kmq9IT1WyXDobmUHhD62fq/TR4on0hNsOcdJNgzMaiv2GkHGUjaXxLZseTvbB
         3f5uiDVVASwDBYSnnOggjuaHEXoK4GQI/jxIv6rA77Z4LnKyJrej9s5xET/wYeHg2qrf
         jS77piht3NMvsHQhjqi0EAfJMwvemsAeacSGyJIqBvyCOTOr7yCIzyHzW4jZA2dUnFEK
         x9lpOcrkDoOivpi0FyC7DCTvdy3157YtwyP36QkP1F55bIYkK0jOKQqHrjMIYLv5Na0c
         rDXg==
X-Forwarded-Encrypted: i=1; AJvYcCXUAK56DEBJi0/F6vX4/CGJYa8FlQnq1QwmdmEG8rUn5UdlvsRfmGbXZg2bL917obOmDVf+Z9GVoJ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCEiBcwqbj77iobcPWZFa625H1uY84I1ui6Ip0uPCKfGN9Lnux
	4uQwKxWRrinp3uKGDsGtAr4g0wOdn8HSjc4DRwtQx1Y3C2j3K2oUAm2TzIFRVnMAOA==
X-Gm-Gg: ATEYQzyH17BVolmvny27J34TzJ3WS6P4M33mGxovVCC4qbNBEGeWCVIWVJa8NZsvrvo
	GXCHwpe93M13PlnLunHJdyq16tZnioklV/NsE5te/oEsQ/OpV1Gr8crPSza1Z9T8WG9OuJVUqgE
	cAcoRnP8C92VyeMIi1pGEJv2Ky2pZjhmKxyDH2FZRjkYWeJNK3C67Ecyp+ziSC7NclPe0ejRygb
	3UA+zYGYquW9U6563DOHRyEk7kZeLRp5GYxK1kgIwuHd6CW9/dTpsEAdbIJo+z+n8kqByxoyYsp
	kJ71/Ub14cZXaf1fHQp3uEzJu5hBKsxkeLtSHkrc+j38vlK+8wMh6piioV1eikDqNPtv8oKyvlE
	8LGxv46f61ynr3VTF2w4sOFxMSNQTf5shFdvWAoAjsea1tv+TRsUH2Bqk2IC4odSmJAtjJQfEUf
	6C7elUs3rUWF35DtZlKDWFfhF6lPw1eTfl3HrHiPkFx1DRjfPopxWiBCQ44UBkBPXgYOpci9gOp
	/RDV11ioat6MHTNNT/xxCzGEQ==
X-Received: by 2002:a05:6000:40cb:b0:437:7719:ca82 with SMTP id ffacd0b85a97d-43a04d752b5mr193700f8f.3.1773329067606;
        Thu, 12 Mar 2026 08:24:27 -0700 (PDT)
Message-ID: <d4f81997-5e4d-4d7c-ac11-6961145e6420@suse.com>
Date: Thu, 12 Mar 2026 16:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/5] x86/hvm: Add a non-FEP path to the #UD handler
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
 <20260312134731.38475-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260312134731.38475-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 235712745DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12.03.2026 14:45, Alejandro Vallejo wrote:
> While the #UD handler is dead code when CONFIG_HVM_FEP is disabled it's
> helpful to keep the function around. Reinject #UD in the non-FEP case so
> DCE can remove the rest.

For the code change - I don't think this should be a separate change. I also
didn't understand Andrew's earlier request to split the original change to
go this far.

As to the "dead code" aspect (using Misra terminology it's really
"unreachable code" aiui), we may need to deal with that, as we've accepted
that rule. Yes, Eclair is unlikely to be able to spot this, yet that doesn't
make the issue go away.

Jan

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3835,13 +3835,18 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
>  void hvm_ud_intercept(struct cpu_user_regs *regs)
>  {
>      struct vcpu *cur = current;
> -    bool should_emulate = false;
>      struct hvm_emulate_ctxt ctxt;
>      const struct segment_register *cs;
>      uint32_t walk;
>      unsigned long addr;
>      char sig[5]; /* ud2; .ascii "xen" */
>  
> +    if ( !opt_hvm_fep )
> +    {
> +        ASSERT_UNREACHABLE();
> +        goto reinject;
> +    }
> +
>      hvm_emulate_init_once(&ctxt, NULL, regs);
>  
>      cs = &ctxt.seg_reg[x86_seg_cs];
> @@ -3863,20 +3868,15 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
>              regs->rip = (uint32_t)regs->rip;
>  
>          add_taint(TAINT_HVM_FEP);
> -
> -        should_emulate = true;
> -    }
> -
> -    if ( !should_emulate )
> -    {
> -        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
> -        return;
>      }
> +    else
> +        goto reinject;
>  
>      switch ( hvm_emulate_one(&ctxt, VIO_no_completion) )
>      {
>      case X86EMUL_UNHANDLEABLE:
>      case X86EMUL_UNIMPLEMENTED:
> +    reinject:
>          hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
>          break;
>      case X86EMUL_EXCEPTION:


