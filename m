Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGcBLmYcg2l/hwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:16:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1B1E458D
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:16:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220366.1529078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZvR-0006jA-BK; Wed, 04 Feb 2026 10:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220366.1529078; Wed, 04 Feb 2026 10:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZvR-0006gv-7j; Wed, 04 Feb 2026 10:15:57 +0000
Received: by outflank-mailman (input) for mailman id 1220366;
 Wed, 04 Feb 2026 10:15:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnZvP-0006gh-Og
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 10:15:55 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d4fe888-01b2-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 11:15:54 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-481188b7760so4749325e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 02:15:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830fe69e9fsm20068575e9.6.2026.02.04.02.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 02:15:53 -0800 (PST)
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
X-Inumbo-ID: 7d4fe888-01b2-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770200154; x=1770804954; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kyNNEzgjYQ2UoSAkz0Ru35OCzvdXA1FCSXJLwSZs2zI=;
        b=K6EwtT6/sn1/eFoeaPPhDQ2uew+7cjIqyt61rtBiORcqgr9a5f3dtY8X3yu5O0CVG4
         sH/Hix9AltX03ZWqV/984wRmv6yOwP7DA9Gb3NnkpAcDWj1yv0E5XTI3buT23uHQDEXY
         QmaIMNbdm9+oHAu91M07YTJgC2NpDsfqbEDXIexaNl8kBTUJd8BGh3BnnBdJgyENYT2l
         AeBc7nxMiN76d1idv+rcPgY9/b5V3RE4vj0AE8Lh0CVVvQAxko46CM1At1lZAPEw497A
         DMLDsd/E0oTUekHXZeR81sP/ia+nIMcy/D8t3r/JjItq/5zYcLWiYca06jt56bR1HJPw
         QuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770200154; x=1770804954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyNNEzgjYQ2UoSAkz0Ru35OCzvdXA1FCSXJLwSZs2zI=;
        b=PrySGjVtGHDBxTiSUKy/HRH/AMpmkKUpOyBeeCjvcuDXvCBnYLLJYhfVTOP4nIcpYV
         yolYkN8nlPDXf9apXudoFJ2WmfFFsJOL9uN0AcgRQ4A5EUX3nEAoxxAY8UYmHDocTFXz
         uyVYUdbwhAdcfA1KNVk6RmvcsMtiZgcl9tcnW++3ssJeigIcoYmkqNLRYiNZSwLsidPJ
         T95T2IrLsPxSOAd5gB+hirCPSVLacyWGCmIneek33D8ScH63HuiTAlEHNevEm5lGT0W2
         i5qxjF4sPpnVD76CfoyJ289ZRTDRfTJ/CGDrpIA2hx4A8MMIzO0/07M1bZspQiwrMmsR
         zrSA==
X-Forwarded-Encrypted: i=1; AJvYcCWigJxJcYAeDm1G9AEZ/gjJ992Q8LI4oqAOD+AbNZ+PjdYANgYhMEz0E3QZ6wsAdls84a9zMYz7dAc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRaDRZLc8VJDEcBnPDAVUNNdRv2RwN/MHbTJ6hsVJnclP9mVD8
	9Drm5m9qExI3m9hfpBeG0DH/cI5N8CM0GgX3y1ag5L9XdjEE0YcjLL1r3P7q4+5sDNtcHqU8OSV
	7WGE=
X-Gm-Gg: AZuq6aJxA7HzuQPdn3LdEeQSEJSwn2FcxS7FOJ5AadPysabV8NIhU/Rc8qpJ1+Q99wD
	d7XpdMuGwJj0/N190KQA6UxOlH617/ia7WOsphE7WyVScZ0sw9F/ID/u9UeRBMyDUgi5SFyv20s
	diDLaTfOOXEmSaM2LHq+EvBGeYPJB5xwBphhoL17vWTIGXbacndCIFWFe3rUWrVp4uLytWR6356
	vtqzRAB257iKmgOqZ4XzquaTmCQpBleIPppsufiz12f1UjcyG1EB7z4CQV8Ys4FymNdu4DClke0
	pnSfmePzJ5U/pFB9CR+ygeZtNjw5nLgypSYRUZuka9V2RfRLunT4cf0WhiZ5NSAqp7RPsI0X7u9
	5ZAnkMaV9pEbL47SW0hLVi9hjoOntOb1wbl3rIY84vF1777bICWUrUy0teu+kSA28bpkGw4ucz0
	syXTNISEKqjL4DRhueyC2OK/FwOXwvvKVUq0lfOoEc1Z9B+FL8XBFakzDVz4ZmcYYxcaVZhUUnQ
	K0=
X-Received: by 2002:a05:600c:8b5c:b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-4830e93c021mr33551635e9.16.1770200153835;
        Wed, 04 Feb 2026 02:15:53 -0800 (PST)
Message-ID: <17480ac0-438b-4af5-b733-f51eedd6e7a4@suse.com>
Date: Wed, 4 Feb 2026 11:15:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
To: Juergen Gross <jgross@suse.com>
Cc: dmukhin@xen.org, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260109140747.195460-2-dmukhin@ford.com>
 <aYL6Bt3Cs3HgeMPm@Mac.lan> <0e3a1af4-d87c-405c-a0a7-598929df3f4b@suse.com>
 <aYMKk9YtrR7NOKyt@Mac.lan> <cef81f1b-4348-43a1-a146-dfc57437a97a@suse.com>
 <e31a8309-a963-4084-913b-39af9222eb2e@suse.com>
 <36537370-1fe3-45e8-9790-852d73f93e07@suse.com>
 <f52c72ee-0579-4ec9-95d1-57c26eb21b6c@suse.com>
 <59fa62df-0fd6-4dba-ada9-ab89570ff624@suse.com>
 <056fa0ce-2832-4b0b-925b-a55e4086d88a@suse.com>
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
In-Reply-To: <056fa0ce-2832-4b0b-925b-a55e4086d88a@suse.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2C1B1E458D
X-Rspamd-Action: no action

On 04.02.2026 11:12, Juergen Gross wrote:
> On 04.02.26 11:04, Jan Beulich wrote:
>> On 04.02.2026 11:01, Juergen Gross wrote:
>>> On 04.02.26 10:51, Jan Beulich wrote:
>>>> On 04.02.2026 10:25, Juergen Gross wrote:
>>>>> On 04.02.26 10:15, Jan Beulich wrote:
>>>>>> On 04.02.2026 10:00, Roger Pau Monné wrote:
>>>>>>> On Wed, Feb 04, 2026 at 08:56:10AM +0100, Jan Beulich wrote:
>>>>>>>> On 04.02.2026 08:49, Roger Pau Monné wrote:
>>>>>>>>> Also, I would remove the tools guards, I think once a DOMID_ constant
>>>>>>>>> is allocated it becomes part of the public ABI, and it cannot be
>>>>>>>>> withdrawn.  See for example DOMID_IDLE: it's only used internally in
>>>>>>>>> the hypervisor AFAICT, yet the define is fully visible in the
>>>>>>>>> headers.
>>>>>>>>
>>>>>>>> It was me to ask for it to be guarded like this. DOMID_IDLE (and perhaps
>>>>>>>> others) not being guarded (at least for IDLE: by just __XEN__) imo was a
>>>>>>>> mistake. That mistake may in fact be correctable, if we could prove that
>>>>>>>> the ID cannot usefully be passed into anywhere.
>>>>>>>
>>>>>>> Even if it's not passed into anything, does it make sense to guard
>>>>>>> them?  The reserved domid values are already consumed, ie: cannot be
>>>>>>> reused in any way.  It just seem to me like more ifdefery churn for no
>>>>>>> specific benefit.
>>>>>>
>>>>>> Well. From an abstract perspective, purely hypothetical at this point, I
>>>>>> could see a potential need to re-number them, e.g. to simplify checking
>>>>>> against groups of these special IDs.
>>>>>>
>>>>>> Yes, excess #ifdef-ary is an issue. Excess exposure of things also is,
>>>>>> though. Finding the right balance between both can be interesting.
>>>>>
>>>>> I have a patch in work which would want DOMID_ANY not be guarded. I think
>>>>> especially DOMID_ANY could be useful for other cases, too.
>>>>
>>>> Mind me asking where, outside of the toolstack, you intend to use it?
>>>
>>> I'd like to be able to use it for Xenstore permissions.
>>>
>>> Primary use case would be to allow the special watches for domain creation
>>> and removal to be usable for all guests, but there might be use cases where
>>> a domU wants to give node read access for everyone.
>>
>> Would that require exposing beyond the toolstack's boundaries?
> 
> Yes, as this would require the user to specify DOMID_ANY as the domid in
> struct xs_permissions.

Hmm, I see. I wonder though whether things like this wouldn't want a separate
layer of abstraction, such that users of the library won't need to include
(and hence have available) Xen's public headers.

Jan

