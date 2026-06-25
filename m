Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IqkODOUPPWoRwggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:24:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E12F6C5133
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:24:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=adVijpyE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345506.1604357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wciBc-0002cv-TB; Thu, 25 Jun 2026 11:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345506.1604357; Thu, 25 Jun 2026 11:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wciBc-0002bW-QS; Thu, 25 Jun 2026 11:24:00 +0000
Received: by outflank-mailman (input) for mailman id 1345506;
 Thu, 25 Jun 2026 11:23:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wciBb-0002bQ-EY
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 11:23:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wciBa-008Zap-Jt
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 13:23:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d0fc2-bab6-0a2a0a5309dd-0a2a450aec4c-30
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:23:58 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d0fce-e40e-0a2a450a0019-d155802bd5ca-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:23:58 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so20877795e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 04:23:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46d3ba68d8dsm8884057f8f.27.2026.06.25.04.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 04:23:57 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782386638; x=1782991438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+H42EMxKhs5WohC3ErDqUKqCaxKLLi7r6g+O9nb0AA=;
        b=adVijpyEHLp2h34jAvCQHsqEckx75Z67J0B7TeIsatvzDvglaMe5Vh8HHL4jkhDi8K
         bvt2fOl6MiUDWT6eGSfZFp/v7tKJ0uW0yktAnzFZwEsqh2PjzUesKrsigZ8ut27Q2F9E
         UkSZJtU7az68yzNmEdOBuNFIpBL58Uq69+r4F9sgWB+oFAJgcCDKTntYIpu+MyZdvWuI
         2pcpidJyZ1DjfYzK/yZjCbTUBgAueGnQl7/iaA+aZc3f/sAuuSRC+ZUKxRC+b2L0O1ZH
         //rkaKuTPpW94ot3Vg2MkVnP9YVXbXTvzTiFXrXJXd4JrQr56mNBy3ySMuMYLputIipc
         HgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782386638; x=1782991438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+H42EMxKhs5WohC3ErDqUKqCaxKLLi7r6g+O9nb0AA=;
        b=j2qlHC/GSQvESJJej0Z0kipslPmhqEFBJfuTlaL3GCS/SV3gr0jxf7hmvWy/g1eBiE
         x16bgKYySJh6yl41wghbjHgjNYE7tyoZVsbMVZzhMVSCcXGXalW8kMxdFUvXQCl5lYHd
         3X0RuK1k4AchbgRrAYqCeHfJYYJRJ8xOzW2bwwLDYNMfi57xFv2diXK8KLePhcDKAOLe
         UOJGIPLpIWp8h5Q5e7Nfwkj4JRgoUp1wEp50J6nhtwu/DIE+JioviE+2df/Y13YlBgJa
         EjwF8h0Lzl0XVJ7woX56x3V4XWmCw5s/clmyJTxRzxKRrtfa3gye4zPLKOlWBA7VnYjG
         k2cw==
X-Forwarded-Encrypted: i=1; AHgh+Rpt6caMtF3/6zqnQSSJWL9wdvHGxtean7LNq17Wyi7MH1qMGTKKK0Hdk7T2uk3H+X6iaNdt/0DmMrI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy53DMWoFhJi0PFfEMmg181bOFj7lXvQhwDr+NqbxTUU0XDs8gw
	JsL0zuuklilfwOAp+18XkKbtvOhuszsqE47XDav/uGpam3+XzNnyCp4r7+Hs7qMqcQ==
X-Gm-Gg: AfdE7cmBobgZ7f4IMWlLfToxHpRUD1JuWha4HEvDIOQ8Yrrg5qevOxBisJgKnYLkjRA
	xOzpW+WZwQY408+6KgrtfmyUaSxic8jL4ITuxKWAroq9ZdGdAvxUPgEmE0AxCXuyMS7zXlVr+EC
	x7W0P16qVs95/verLIXU10Z61lsjt70tS6M/vrPqjDuhPKrhsdj7YREgzHez0H5cq2qcIQ1mS9Z
	6Pgrxu3cmPnPCoxKlfeHgm8d1vjj/RVBGDB+0f8UgXy+Al0ai0a0q5lPL/QGKo/Nd+pIO8HVgZr
	XR9U9f2yyxtBq5Bs3WX2gXCqDIYxkVYyLy6CRBmCn/PDpEu4hc2sdHdYuoxv3RM/HrC/Zt5dq6V
	WxnbrQX57e5BTkbmn1CTufTMYHq2LzZ+bglMLq2OFrgY49lyIbu1jlo6c1CIs+AQuWE+HVh29nT
	K21O93TybAruPOlvquvd8KYX+Yvz2Nx7JIbAldZrJpov2LG3H5JuPvIHbS05uaZN8TJQ5b4JZ1e
	XRp
X-Received: by 2002:a05:600c:4f43:b0:492:660c:5fca with SMTP id 5b1f17b1804b1-4926688582fmr28060535e9.23.1782386637899;
        Thu, 25 Jun 2026 04:23:57 -0700 (PDT)
Message-ID: <c0f66758-f0e8-4a29-bb7f-f43e14ecb976@suse.com>
Date: Thu, 25 Jun 2026 13:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1780494838.git.oleksii.kurochko@gmail.com>
 <7ed7b888e203b7cc6c3a3a82b3bcc89d90b3fb48.1780494838.git.oleksii.kurochko@gmail.com>
 <d63a3877-286a-43fe-97fa-301985c3a0ac@suse.com>
 <910ed097-10d8-41a2-9035-a3f10d60c214@gmail.com>
 <73452348-466c-462d-884e-f181fe12b293@suse.com>
 <e8fa36f3-e8ae-47a9-9f75-0b8f9a306a02@gmail.com>
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
In-Reply-To: <e8fa36f3-e8ae-47a9-9f75-0b8f9a306a02@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1782386638-D5726DDE-C1E4476C/0/0
X-purgate-type: clean
X-purgate-size: 1695
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E12F6C5133

On 25.06.2026 13:19, Oleksii Kurochko wrote:
> 
> 
> On 6/25/26 1:04 PM, Jan Beulich wrote:
>> On 25.06.2026 12:50, Oleksii Kurochko wrote:
>>> On 6/17/26 3:26 PM, Jan Beulich wrote:
>>>>> +#define shared_info(d, field) \
>>>>> +    (*(typeof(__shared_info(d, (d)->shared_info, field)) *)shared_info_absent())
>>>> How about the simpler
>>>>
>>>> extern struct shared_info *shared_info_absent;
>>>> #define shared_info(d, field) (shared_info_absent->field)
>>>>
>>>> ?
>>>
>>> This could lead to compilation error:
>>>
>>> common/domain.c: In function 'vcpu_info_reset':
>>> common/domain.c:316:20: error: unused variable 'd' [-Werror=unused-variable]
>>>     316 |     struct domain *d = v->domain;
>>>         |                    ^
>>> cc1: all warnings being treated as errors
>>
>> #define shared_info(d, field) ((void)(d), shared_info_absent->field)
>>
>> Which it should have been anyway, to make sure the first argument is evaluated.
> 
> I expected that as shared_info() is used as an lvalue whose address is 
> taken (&shared_info(d, vcpu_info[...])). To "consume" d we can't just 
> prepend a comma expression as &(comma_expr) is illegal since a comma 
> result isn't an lvalue.
> 
> Trying what you suggested leads to:
> common/domain.c: In function 'vcpu_info_reset':
> common/domain.c:320:26: error: lvalue required as unary '&' operand
>    320 |         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])

Ah yes.

> Thereby this option:
>    #define shared_info(d, field) (*((void)(d), &shared_info_absent->field))
> will be better.

Or maybe

#define shared_info(d, field) (((void)(d), shared_info_absent)->field)

?

Jan

