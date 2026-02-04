Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJycC7sZg2n+hgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:04:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83629E43CA
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:04:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220338.1529049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZkN-0003lm-PA; Wed, 04 Feb 2026 10:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220338.1529049; Wed, 04 Feb 2026 10:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZkN-0003jc-MV; Wed, 04 Feb 2026 10:04:31 +0000
Received: by outflank-mailman (input) for mailman id 1220338;
 Wed, 04 Feb 2026 10:04:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnZkM-0003jS-I5
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 10:04:30 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4698653-01b0-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 11:04:28 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47ee2715254so36506975e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 02:04:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48310859101sm29707595e9.8.2026.02.04.02.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 02:04:27 -0800 (PST)
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
X-Inumbo-ID: e4698653-01b0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770199468; x=1770804268; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0vnMgFPiR27N7LC/2Rkn5sZ63vXYoaf1jGzEaxR6C9E=;
        b=Xx8BRLtPDxPTiVaV0mbiqSZ8V2NvoAzvX3T+4YmpjJ9nZ4kbzG991MzRzJoncrpI2C
         Zfw/A1mZXrnv5xD4vjCn4oMwBNYFppfnlyXq2oXmo20HW3Zzl/5U6gxYuxLBStFrWWod
         uvoPc+vbmQrJLEA1hCoSN/0sqrXonc/I6/EtXAgOTP+ICMIyR7l4XyhIcz6orjv6/azr
         cvgCBSBPyuHm38P7E1vwzyTvY1MniH6V1hjMkxgdiOEsk5pTpWXOBNuFVAqaFSDIGC+y
         7jgo3afzudHFnlHo7AfiR07pfCAq6mk54iiN1jTMwRA+vnc18qz7+FXIw7qy2BCBX4g7
         Pixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770199468; x=1770804268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vnMgFPiR27N7LC/2Rkn5sZ63vXYoaf1jGzEaxR6C9E=;
        b=PLfK5jlnh2aHb6XClwNlVR917RMB/wxna6Bf/x7tqUO908Mc8i8gz41CUBopfXJ9Gs
         WpnDjj3fW6wDb+lPbuZa95D4jOeRHRlH6r8z+etnTZdbi0036kKE3ozPehtE53aDBVEu
         hoIjEba7OfElY9kVvyfUgkB+HzVeps67G1zt8vliP2LN7gWzWIvXaqB9n+ZdggpLpyD3
         xMpuIS2UXaWWE3baZqkQDuYjZwgH73Nvt9Fb2PDNfKarwKtzQW57j8sgpDAPLAan7dTL
         GV0YsV3R8QDFRz+PwieFe5zgesbL+119yXWvbdPxBHypwp1kmNOR0EIl1NIRGkORRS/O
         ytfw==
X-Forwarded-Encrypted: i=1; AJvYcCWISvk2Vt0S4A0DblyYqqi/NvFBvPN07f174Ls/QI7L6cPFCfRqsIxbuVzE1Au/jH78B5Z58CSYeZw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZ4lXG24EfLj8tpKTQ6+U9z1emjieffeRBAr0y3LRckt1PvRgS
	yViTr2rpNGwYslHjFDGiPPJPF1+uTUdJB0n+cWfmsv+zCdC76Fgu+D5R/X/q/uMdQw==
X-Gm-Gg: AZuq6aLkYP6DJB+Ti042t6UDrX6l+HGfVKIORiV+drrdIaywORMRzu8uPs6NJOYARz6
	W++nls++thGoGNpEN6Lfkx+3TBIBBvi15y0ML/wXriI30aO9r54Mo9KzZLkvbH8n0985cKXL4Wr
	qtvNWRmgfd5dX0LccUqNlCmz7+IyIotSczGls0d0l/fTUnjcpAiAOEwsCQKsu498PCNAD+R1WUC
	YJ6sfpZolPGHalJQb6Vh+FKiaC0n6hbCjetxlBn6z+Xn65fAABWSLiQkb4pAyq8aII7qStmt0ji
	J20zJw/Ff41cqbvEv7nuQFo8QjjtXKjYNmCUiJIUZFtYX2KuQRSLWBYexlkHCWIFeEyPrTCd52f
	Q3xnb3Y6TGVVlMWWv3He+LV9sFhf8XpDUngT5XEdHy2O2DkENZltdYWt29HTng5Tn9gxUFGjeXi
	KAkN/s8tmxDslK9tHuoMS3iuks6JnBpBWn8wJNhVVqZ23wKw55qAzB2HRWauVTvFou5aG3Pusjn
	5B+HS8rtFaM3g==
X-Received: by 2002:a05:600c:8183:b0:480:3230:6c9b with SMTP id 5b1f17b1804b1-4830e93ea30mr37154805e9.7.1770199467802;
        Wed, 04 Feb 2026 02:04:27 -0800 (PST)
Message-ID: <59fa62df-0fd6-4dba-ada9-ab89570ff624@suse.com>
Date: Wed, 4 Feb 2026 11:04:25 +0100
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
In-Reply-To: <f52c72ee-0579-4ec9-95d1-57c26eb21b6c@suse.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: 83629E43CA
X-Rspamd-Action: no action

On 04.02.2026 11:01, Juergen Gross wrote:
> On 04.02.26 10:51, Jan Beulich wrote:
>> On 04.02.2026 10:25, Juergen Gross wrote:
>>> On 04.02.26 10:15, Jan Beulich wrote:
>>>> On 04.02.2026 10:00, Roger Pau Monné wrote:
>>>>> On Wed, Feb 04, 2026 at 08:56:10AM +0100, Jan Beulich wrote:
>>>>>> On 04.02.2026 08:49, Roger Pau Monné wrote:
>>>>>>> Also, I would remove the tools guards, I think once a DOMID_ constant
>>>>>>> is allocated it becomes part of the public ABI, and it cannot be
>>>>>>> withdrawn.  See for example DOMID_IDLE: it's only used internally in
>>>>>>> the hypervisor AFAICT, yet the define is fully visible in the
>>>>>>> headers.
>>>>>>
>>>>>> It was me to ask for it to be guarded like this. DOMID_IDLE (and perhaps
>>>>>> others) not being guarded (at least for IDLE: by just __XEN__) imo was a
>>>>>> mistake. That mistake may in fact be correctable, if we could prove that
>>>>>> the ID cannot usefully be passed into anywhere.
>>>>>
>>>>> Even if it's not passed into anything, does it make sense to guard
>>>>> them?  The reserved domid values are already consumed, ie: cannot be
>>>>> reused in any way.  It just seem to me like more ifdefery churn for no
>>>>> specific benefit.
>>>>
>>>> Well. From an abstract perspective, purely hypothetical at this point, I
>>>> could see a potential need to re-number them, e.g. to simplify checking
>>>> against groups of these special IDs.
>>>>
>>>> Yes, excess #ifdef-ary is an issue. Excess exposure of things also is,
>>>> though. Finding the right balance between both can be interesting.
>>>
>>> I have a patch in work which would want DOMID_ANY not be guarded. I think
>>> especially DOMID_ANY could be useful for other cases, too.
>>
>> Mind me asking where, outside of the toolstack, you intend to use it?
> 
> I'd like to be able to use it for Xenstore permissions.
> 
> Primary use case would be to allow the special watches for domain creation
> and removal to be usable for all guests, but there might be use cases where
> a domU wants to give node read access for everyone.

Would that require exposing beyond the toolstack's boundaries?

Jan

