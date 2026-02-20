Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FzSNoE2mGkkDAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 11:25:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C7A166CE0
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 11:25:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237001.1539478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtNgs-0001va-D5; Fri, 20 Feb 2026 10:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237001.1539478; Fri, 20 Feb 2026 10:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtNgs-0001sw-AM; Fri, 20 Feb 2026 10:24:54 +0000
Received: by outflank-mailman (input) for mailman id 1237001;
 Fri, 20 Feb 2026 10:24:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vtNgr-0001sq-3Y
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 10:24:53 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 638872a0-0e46-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 11:24:50 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4836d4c26d3so17602645e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 02:24:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a3deb73bsm14851535e9.3.2026.02.20.02.24.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Feb 2026 02:24:49 -0800 (PST)
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
X-Inumbo-ID: 638872a0-0e46-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771583090; x=1772187890; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G8yuAOpKv5gJV7/hWT9Eym5FISxKjmQHGU5CBjznLIk=;
        b=GGMxKULluOwOO/EWEAIgu7V1EKsVWf1AktIRVr4I3ImumyfZhJqTwu5TB2i0wGTdzK
         b7Y0+iULLzV0+rRAD1eDSKg5PkJFluKyGXrnd1BhS5Cbc+DpirxXlUdXIoyvX1s1tH0j
         k2qtlgeSEnzmWBzooI1hPzSBDGqvC49VCs8yR2s+Szwofp8u2KFOtrwfN35ajLEkrTVr
         FKiJlh5OX6E7/ZvWysUqBLJyO3SwyPWqVirbBNZrffjQ79dCsjLXKhD9cjSGI66dyh6k
         F75T/AnldjNnlB1YhPhyghXFyIHC36NVWnlvYz/wpfyTxIJ2pbEfNYldhpTUxLDdPqRb
         iR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771583090; x=1772187890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8yuAOpKv5gJV7/hWT9Eym5FISxKjmQHGU5CBjznLIk=;
        b=NXGdSYK3TqJb2++571kcSl6gon7LML3JHxTgfhWZ8KREGkIpL9phW406qtP1LC0G4L
         ps6UAG+S1+HrN7+AQEyAPun7IC0rSOOaGx6jnjNExFOynlt96h8VD4xoUElu22bfWlPC
         3Nk49KH5lmyvaQfxOCGFNPxxcAbBm2xZ4/g5clrHeEKffILcl6o6y2yajFWsEEXvQVZ/
         y19O6kRTunCCFOIsQCEKoJplFGSc51HJcfaZs0Fat+pZLMwKW5yL1OCiOwJSBX25MAYS
         ZLG+ZBS9cpsG99P9Dg6qEkCZwU1Qs805e1yH+m2VF/7mQM/iLfu3cM6WKmlq1Mea2sxA
         Ym1g==
X-Forwarded-Encrypted: i=1; AJvYcCUpHUwkdn2SMJd6E1LX7/U4htZCZT1R1MLKwX65+hHnx+0xdXRofdlLjtQEqWV8exPLdH9cOcoNSZE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxU1dVgT7+RdSrtY8G2SkGGNwtp/JbFyi2mNUxzSzy9KSfNfO/H
	rE2namqGcDYoZX9Cntp6MmP5VQg6xWw9diAvNl+o/bkDTYjK6Z4ujp6j8c51HCMtmQ==
X-Gm-Gg: AZuq6aIkadFKlMLb/440pWCDvHC9Tx/ZdCD8Au5+ZWYl2f+9b3c3XJwBo0Hmg8VUYrH
	9b6yI6XvRJrFzxcF+ZnPM9VCwHT8ENFyVMI2ILLvpLRZb31x1kppmZTl/RSek5GjNpDTRMEounP
	BDPbWIhcIPu58Uz3ECWZotVs34gjhcuZFjsV0UroVooLrV6FvxvYd1F7XsKu/GYn5uZZ8WG6IPo
	amiksUfskXZrOtiRYxubWn0ilGzhdmgHrVC1WbXb/8+T+KKhJwn8FjpfPjQQHnW7CtxctyA5jTD
	/Sxl64Pd0JLDgEGnBmKMD/lf1A1Q5oAMMlDWe+PGpfHQnCHPOITWRDUIQN8pPHMAkzrnwLFKghS
	Nkxy747r6238Dmk4H7a+79gkABIQ/98A/5k7Trhaeb8u1gUWWKIW+C1yIfV3eUl5hFeD58hy1S8
	tRsrvyVlQ5JgUhwPEtE8N3e+O5iB/v5NnP5t7iDDssdDRdPltclR3mNDKEqCdnaLwiTt0c67ESh
	tPfF+sB5dnPCoo=
X-Received: by 2002:a05:600c:198c:b0:480:4b59:932e with SMTP id 5b1f17b1804b1-483a531d64emr21428345e9.11.1771583090113;
        Fri, 20 Feb 2026 02:24:50 -0800 (PST)
Message-ID: <edbfa0a5-466d-4748-93a1-a250156142e0@suse.com>
Date: Fri, 20 Feb 2026 11:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/p2m: clarify foreign map handling in
 p2m_entry_modify()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20260220100509.49700-1-roger.pau@citrix.com>
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
In-Reply-To: <20260220100509.49700-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 47C7A166CE0
X-Rspamd-Action: no action

On 20.02.2026 11:05, Roger Pau Monne wrote:
> Introduce an extra check and comment to ensure the outer caller has
> possibly taken an extra reference on the foreign page that's about to be
> removed from the p2m.  Otherwise the put_page() in p2m_entry_modify() won't
> be safe to do ahead of the entry being removed form the p2m and any cached
> states purged.
> 
> While there also replace the error codes for unreachable paths to use
> EILSEQ.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/include/asm/p2m.h
> +++ b/xen/arch/x86/include/asm/p2m.h
> @@ -1066,7 +1066,7 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
>          if ( !mfn_valid(nfn) || p2m != p2m_get_hostp2m(p2m->domain) )
>          {
>              ASSERT_UNREACHABLE();
> -            return -EINVAL;
> +            return -EILSEQ;
>          }
>  
>          if ( !page_get_owner_and_reference(mfn_to_page(nfn)) )
> @@ -1088,14 +1088,26 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
>          break;
>  
>      case p2m_map_foreign:
> -        if ( !mfn_valid(ofn) || p2m != p2m_get_hostp2m(p2m->domain) )
> +    {
> +        struct page_info *pg = mfn_valid(ofn) ? mfn_to_page(ofn) : NULL;
> +        unsigned long ci = pg ? ACCESS_ONCE(pg->count_info) : 0;
> +
> +        if ( !pg || p2m != p2m_get_hostp2m(p2m->domain) ||
> +             /*
> +              * Rely on the caller also holding a reference to the page, so
> +              * that the put_page() below doesn't cause the page to be
> +              * freed, as it still has to be removed from the p2m.
> +              */
> +             (ci & PGC_count_mask) <= (ci & PGC_allocated ? 2 : 1) ||
> +             !p2m->nr_foreign )
>          {
>              ASSERT_UNREACHABLE();
> -            return -EINVAL;
> +            return -EILSEQ;
>          }
> -        put_page(mfn_to_page(ofn));
> +        put_page(pg);
>          p2m->nr_foreign--;
>          break;
> +    }
>  
>      default:
>          break;

Unrelated to the particular change here, I wonder whether it's about time to
out-of-line this ever-growing function.

Jan

