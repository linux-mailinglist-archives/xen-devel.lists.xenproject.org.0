Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOX7H6cPwWk7QQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 11:02:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341722EF961
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 11:02:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259164.1552473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4c6j-00017y-8e; Mon, 23 Mar 2026 10:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259164.1552473; Mon, 23 Mar 2026 10:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4c6j-00015Y-5O; Mon, 23 Mar 2026 10:02:01 +0000
Received: by outflank-mailman (input) for mailman id 1259164;
 Mon, 23 Mar 2026 10:01:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w4c6h-00015G-DZ
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 10:01:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4c6g-008tLw-Pk
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 11:01:58 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c10f91-bab6-0a2a0a5309dd-0a2a450b89ba-32
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 11:01:58 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c10f96-ef63-0a2a450b0019-d1558032a5ff-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 11:01:58 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-486fc4725f0so33128295e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 03:01:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fe7e3a94sm276146775e9.7.2026.03.23.03.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2026 03:01:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1774260118; x=1774864918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=haUaNQa4QrC27aH36liiMap8cZhOcHLNbsldqy9JT00=;
        b=Lv19IT/B8BsiX1x+oHAtVM92X9B/WSP2VdthNEZYa2z87BlO1I2t/5NiW8e152ZGah
         O+PT8Kbntk5biIgdCQ4r54WnN/N37ZiKiwIEYiP4fLfKEh0JSxAYwTVVarQVOCif4Mxe
         yGjdB85vl0xlkkv71xazDzuwASP/Jary3awZFP83JyZ9VGQRQbGYj1zP5ELz2+wQVKUu
         sxEL4xK3JFFybN1uWOOaedKtvTf1YAjjLtt0QshZymse6F13lUvKTJrPuJkgKexf8p/c
         GxXje/g7k9PcYdMwib8PLjk0LqxoxluzWwoARkKqsdvrz120BJOVIV2rrTmNagZpdR1/
         uzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260118; x=1774864918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haUaNQa4QrC27aH36liiMap8cZhOcHLNbsldqy9JT00=;
        b=iUzYtE4ByPg/jK7DDBYXLdvGVE9sFZQrwK8i+DHbGPS12DpOZN9utsP/fhB9nU82kT
         yny2JevOZ2kdEqLvxNjsOOPTtDMTQibw3gAuJJxRtkKZzx9Exm0aDc35wkQNSf6Xogh1
         YN+e6h+J0caFxLwze6ztsf3mKzSP3qYuElfh8l6RjqLi2NVBDDu+uR8Cn9I529ox/Dq8
         axH6BbDseXhAxvy4HDrBkWVyDPxk1xoh4EenU/yIQ0oXz6PqeTlLS02auiY3D2yb75SA
         uVlGQVtu26flU9ZdrP2DbeCbvEJSPasI9RjKnfIQFsScOMJdweYjmfSsRg27pQHwj44U
         SDww==
X-Forwarded-Encrypted: i=1; AJvYcCUkpNp78y9t1CIFVt1c9b0QQceuNn8JhXVOkM3EIORHLiJQVTl90JefSZJwEIBXbyFW83xcdMAn+D8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKEbdCXYB3oxxftuYRzu5qbTpGEAQ/I3b8MtN1URiLyeA0xsY0
	favr/Zml3qseI5xu/ektIP1sKLdlMqodGbfXqe2wrNW7kYpnAm9SEt15ZVTRjMv0PBzB1YVDz6I
	Pp+A=
X-Gm-Gg: ATEYQzyJPBSUnfka+94epy+EJj9cdmktt25TJRPnwbM1Vwpf7qUIiGcS87om7GUzoB4
	W1Q7G2kjUTAnt2oooc2FZWmB+J5Lf6M9uffPFuWF7V/lCjjeeaP7i2cLxXM78huZeZW03YjbOvP
	Rg4uUkefcwWV0msUih9bjGQtSYObtolYxCx/D2XYdVRcR3j9yG+3VUt1HMAMyoYS5D3PTasRPIT
	K4GJsPSSVM2oR5Q0IRLKQPp+tb8NiiTskt5+RoJTnmjZgMBgGi66GeEygQ4zs05DFfhi8/38V+N
	mVmamFjk6Fk211OWQuReDONFAErGE0Bg4OAx/AkasiPFeizBv5A4Y+SIcLvI4dw+MH0khyitx4c
	9tJcqLX6HujzHH9dqj6mxqlQeIiB1cA3nSA1jI9GMUCguJEl9SPFbftSaasXQV+LMfQzNIYJ9In
	AhCN0S7+boxHccsCqX/Mb4NyXEIKjH+D8TEMh5xUpfK4oTHwcJUJWpBuWJd8tqsylWZs/r3Pw3o
	0SFowbkO7n0maY=
X-Received: by 2002:a05:600c:3e10:b0:485:3428:774c with SMTP id 5b1f17b1804b1-486fe8b0073mr173991345e9.4.1774260118072;
        Mon, 23 Mar 2026 03:01:58 -0700 (PDT)
Message-ID: <2bd67184-5f03-4f27-ba03-ea30dfae3898@suse.com>
Date: Mon, 23 Mar 2026 11:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v v3 3/7] x86: Remove x86 prefixed names from acpi code
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
 <20260313163630.1073019-4-kevin.lampis@citrix.com>
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
In-Reply-To: <20260313163630.1073019-4-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1774260118-98ABC112-50E3C299/0/0
X-purgate-type: clean
X-purgate-size: 382
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 341722EF961
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 17:36, Kevin Lampis wrote:
> struct cpuinfo_x86
>   .x86        => .family
>   .x86_vendor => .vendor
>   .x86_model  => .model
>   .x86_mask   => .stepping
> 
> No functional change.
> 
> This work is part of making Xen safe for Intel family 18/19.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


