Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id b1qyFBSBe2mvFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:47:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF8BB19B2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:47:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216774.1526710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUEq-0004ep-Gm; Thu, 29 Jan 2026 15:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216774.1526710; Thu, 29 Jan 2026 15:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUEq-0004cr-Cy; Thu, 29 Jan 2026 15:47:20 +0000
Received: by outflank-mailman (input) for mailman id 1216774;
 Thu, 29 Jan 2026 15:47:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlUEp-0004cl-J2
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 15:47:19 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca0c0eb9-fd29-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 16:47:17 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so9509775e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 07:47:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce4c3d1sm141106715e9.9.2026.01.29.07.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 07:47:16 -0800 (PST)
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
X-Inumbo-ID: ca0c0eb9-fd29-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769701637; x=1770306437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=faEELfnZlk+DnBUx7Ezay4imuuMlevSLumPBQ7F7zxI=;
        b=R8k3uJE8RTa1xzIe1K5/va/R6bcUct1MC/hNPh3tWcTKhU9kskqKWDxr8wMuz/yh0n
         7+lxrJ34NyOEN2IsbG4fy1W/sWZIH7uCNsPFu0Jmbnl5l5forBmUvufIdVc3kZpgR1Js
         nccq5sAaZDtsNBmxTe72Qt1JvHUm688N8z4gPtpW2WUJKq/ZhWOF3F41lXrv/GlDGB20
         7eP0we4eo18tquWMVXnTDIRCwXuAUvYHdSl1hW2ZYeeh7RJ4+m+FcMfYpxFk8hjaJTu3
         LczxspM5yUZep5F1MA1qnEkmcezi8v7mYHfn0Da4e13EKDh/JRUjFdzjzdT0q2iruYnU
         xlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769701637; x=1770306437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faEELfnZlk+DnBUx7Ezay4imuuMlevSLumPBQ7F7zxI=;
        b=T+UXI8AqCIxKfajzuo8eCw4kL/3c7REfkoeCKtW7Waar2XopPt4OrLBGO0V+d0SlNN
         gQiP9HXp0VF81R95rDlHLnk1GP9os6EPKkZuwtttnkcO3OT3GD2JiAt4mGbN0/HwUoh7
         0Ja75L/xarpPfFleKuL5avzLPoYmUTJZcSb5j9zCJ6twPjmrNMe/OYFdOZpXGXuWS8nP
         GkD3swDxYgUA2ZuLU2oErpvEKTP+f/ikpzgVpQOFepEQC7eqYKoxSYjQNTBlMOruAUNk
         +3j+cWkx3yJthG1iBBwxeAvF2YRrQZyAaeBLkRSdZtbP3OvDvPNOm854BXAqe6N6fHbN
         ORXw==
X-Gm-Message-State: AOJu0YxG7WXagyAUtU/OdOWjdnC3ctm6Fh513etsc/KKA0TeuY3djDFU
	7372+VEJuwIkgRZjm/vL00309Gs3qL9rPC0UAwSg9YlK1yHL2fPArgKYL+PSKfbUNg==
X-Gm-Gg: AZuq6aKfI5L5pMQODbQU6xLSV0LK3Sw5BXY5eiiW5PGmOrz4bfVz0qXWMzfxa1hy+OL
	SGeQlO1Tgx0UHilaVAA7NVKw2RG3Q409GKRBNn2IJJv8lctAI6NNSdAgMpqJRWJi+e4Ht91kgwv
	LLUV/H/8Lng/EHPrmZdvrKKG7jjdrhwtoBBw9SJyLz6fY/oFtsGT1ldI0iYyjhOboB1vjJQBjPo
	3WZ9p+lRRk+pvWLZrsyZsldyY0LbVNqGxbWwaPjeZut2uysXrY2FyFNGwRw2unjLHjq7eG9yfJy
	ikBC04vDMsm9L4DKj2vUfqE1TIu9E19izX2DWTdGQ/YQwNpEnm8tP8b7lUOUYzfEQfCwDZyl93O
	Piqgu2Qqbn/01TPbwRveCZ/fQSFq/nZa0Or5fDv+TUXGF4P2oJszxNU9WTmc8mv0jiENht+RIwo
	Z4DBVMxjbsjeqbw4jrZTmTsWjWQGJqzmAOMg7BxcHP1KRtydT9zaplxPo7e/NwBJ3P8v3eGTmAO
	5M=
X-Received: by 2002:a05:600c:6489:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-4808288f60bmr45605205e9.3.1769701636890;
        Thu, 29 Jan 2026 07:47:16 -0800 (PST)
Message-ID: <8132f09b-74b5-41da-a136-dc59c2d79e98@suse.com>
Date: Thu, 29 Jan 2026 16:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] x86/PCI: avoid re-evaluation of extended config
 space accessibility
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <a0b10d39-daae-4fc0-af42-a3794a96f9f5@suse.com> <aXt9mjFhSLwxrzM9@Mac.lan>
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
In-Reply-To: <aXt9mjFhSLwxrzM9@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,suse.com:email,suse.com:dkim,suse.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: ACF8BB19B2
X-Rspamd-Action: no action

On 29.01.2026 16:32, Roger Pau Monné wrote:
> On Thu, Jan 29, 2026 at 02:10:01PM +0100, Jan Beulich wrote:
>> When, during boot, we have already correctly determined availability of
>> the MMCFG access method for a given bus range, there's then no need to
>> invoke pci_check_extcfg() again for every of the devices. This in
>> particular avoids ->ext_cfg to transiently indicate the wrong state.
>>
>> Switch to using Xen style on lines being touched and immediately adjacent
>> ones.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> One suggestion for a further addition below.
> 
>> ---
>> v3: New.
>>
>> --- a/xen/arch/x86/physdev.c
>> +++ b/xen/arch/x86/physdev.c
>> @@ -528,6 +528,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>>          if ( !ret )
>>              ret = pci_segment_iterate(info.segment, physdev_check_pci_extcfg,
>>                                        &info);
>> +        else if ( ret > 0 ) /* Indication of "no change". */
>> +            ret = 0;
>>  
>>          if ( !ret && has_vpci(currd) && (info.flags & XEN_PCI_MMCFG_RESERVED) )
> 
> Maybe it doesn't need to be strictly done here, but now that
> pci_mmcfg_reserved() signals whether the MMCFG was already registered,
> could you also restrict the register_vpci_mmcfg_handler() call to ret
> == 0?

Possibly; you know vPCI better than I do.

> That will also simplify the logic in register_vpci_mmcfg_handler()
> since we no longer need to return 0 when the region is already
> registered, returning -EEXIST should be fine if the caller is
> adjusted.

I think this then will want to be a separate change, with its own
justification.

Jan

