Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGusOe4LimkQGAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:31:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C970112850
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:31:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225750.1532320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUAb-0002iH-3k; Mon, 09 Feb 2026 16:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225750.1532320; Mon, 09 Feb 2026 16:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUAb-0002fA-0i; Mon, 09 Feb 2026 16:31:29 +0000
Received: by outflank-mailman (input) for mailman id 1225750;
 Mon, 09 Feb 2026 16:31:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpUAZ-0002f4-SH
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:31:27 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6e34afd-05d4-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:31:25 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so30564785e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:31:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d77b3sm690845e9.2.2026.02.09.08.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 08:31:24 -0800 (PST)
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
X-Inumbo-ID: c6e34afd-05d4-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770654685; x=1771259485; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XYcLoq4Oc17WWFvApReP5TteRxaFCDVoh+pueH9sOJE=;
        b=XWlmklHBb4BdhLIjabonP8ZV9jNqH8oFZ7HHaLXeQDOywL4N0WfTbyT6pYQFiUNemc
         ZsWUdJP2mFFQiVZmZQbeUuYfKp45vxmkq7mRvGoch4KBCw+TcKwnIDxhzLSM9ind3TDy
         2QlCEWgTcj24T8Q/QDwQtAZ99JGTj79a4e26THwxzxo/TAu3eyA9jxKq3OArNZsD1Cf3
         GUVBGY17vWeHu/8wsbZXOOrNNVLTHZ/VvSH0MqCkaO7aD1M2j1pxaQxkTXYJFyQPEWBF
         D+6YVckrnUNKJPu6hrvXyJnoemNz4EtF0GDbBtQnHoijhqNjVSgPpSPdWYE6SrBYmJZH
         Ih8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770654685; x=1771259485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYcLoq4Oc17WWFvApReP5TteRxaFCDVoh+pueH9sOJE=;
        b=FTId2fky4t4OkaFUFrGYnTq0rNWEjSOwWiitr60WtqMl3Q4227/LzWikpKPVC0UU2T
         NxB4VW72XWj4HBhmoUht3Q/3fjKWv5T1W5oo5NhE8MPIqokG8Ft8To87iZyKIOf0fLKe
         bvx/FMel9Bq06IDPVWpb0gCwjHcOAeeV0fp21Xr7gVFHOoSSYHhNQCDO+5AJ69l7zeCB
         XppPKBi9D1Xh6+rL9jCY8gUX4qrUXunk7TjSkjZiEby8qSRlCZk8YI8acpopxql3hmV5
         /bYtMzqI8op75oZzpc18ofT9KZPDpAHFfWCtlC02QcI6dKD/3IK0aYU4mmUIxobYgBoy
         K+HQ==
X-Gm-Message-State: AOJu0YyOR48dONRl4n+5RQrahM8rCT2tDWmi41h/kTqi0p0rVydrnva6
	u9MS+UwCdq2iBepMi7REcFL/avkROk5GUmP7LIkFH/Saix4Ob1wcdPltDvDXKtTKyQ==
X-Gm-Gg: AZuq6aJtZYuAjDv2oCLKOghG12CzC2Fx4y7phOQB1ubnkSyMZ+2PzecblZXReJmXfqW
	bgk+3ice5Ixss/fu5kwn+rEv+k6QRGZ9z9KwLpVwSMkDKHLSBOFf041sCWSlLuPr+KBg/H3omHO
	K8cLwGKNnTCABKZsq+4pObdz2WHr4qGoUNDZnaNQVcRpngFMeQbhUakCK3TQGG2rAz0Kut9ju+q
	391fF9ypdluq5wrr/OK6V09KNF1FYeTl1J/FauPr6gQouhzAst4IQMQCsRUAoNmt1PtiUMlaxNf
	dv94BhrXQcWQBFYQR36hbUmxGC/3Zec9HnYTomCW0byNz9fJ9Y7+qPtAPu8mCwwVhJcNZEnUswJ
	oV2oOxVqrTPumfMUE4Hplo8QjWCFJO+NaB6lcQqXzlG/5AeHA4MNIvJHCTfsjDHSjeHq6WEjRMX
	aBGc+Dj/AiEZQImrW+wuB1rgR8E9/eJdmGB8Vqi8qbGKPs+iQiQHkpLU+3J1spHY7bOwaiuPrrm
	OA=
X-Received: by 2002:a05:600c:64c4:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-483202139ecmr181053565e9.24.1770654684666;
        Mon, 09 Feb 2026 08:31:24 -0800 (PST)
Message-ID: <5b16020b-4ca0-4210-b8bf-d71f127dddfd@suse.com>
Date: Mon, 9 Feb 2026 17:31:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shadow: Delete the none.c dummy file
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
 <aYnyY2MArv4vTXsY@Mac.lan> <DGAJI3UYR98J.FU94VABOFZ5N@amd.com>
 <aYoDiDiJ4rRLxhmw@Mac.lan> <DGAKH0QH3EG8.8GOWCPNH2Z79@amd.com>
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
In-Reply-To: <DGAKH0QH3EG8.8GOWCPNH2Z79@amd.com>
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
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:tim@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5C970112850
X-Rspamd-Action: no action

On 09.02.2026 17:20, Alejandro Vallejo wrote:
> On Mon Feb 9, 2026 at 4:55 PM CET, Roger Pau Monné wrote:
>> On Mon, Feb 09, 2026 at 04:35:04PM +0100, Alejandro Vallejo wrote:
>>> On Mon Feb 9, 2026 at 3:42 PM CET, Roger Pau Monné wrote:
>>>> Also, seeing the code in arch_sanitise_domain_config() we possibly
>>>> want to return an error at that point if toolstack attempts to create
>>>> an HVM guest without HAP enabled, and shadow is build time disabled.
>>>> I've sent a patch to that end.
>>>
>>> ... this patch you meantion. Thanks.
>>>
>>> I'm guessing it's still a hot potato in for non-shadow PV, which strongly hints
>>> at our being better off leaving it in that case. On HVM-only configurations it
>>> seems rather silly.
>>
>> I'm not sure I follow exactly what you mean.
> 
> I'm not sure _I_ follow exactly what I mean. Part of the confusion is the
> overloaded use of "shadow" to mean "shadow paging" and "fault-and-track"
> of logdirty behaviour.

There's no such overload, I don't think. Shadow paging is _needed_ for certain
operations. E.g. to put a PV guest in log-dirty mode.

>> Some rants below which
>> might or might not be along the lines of what you suggest.
> 
> Thanks.
> 
>>
>> PV needs shadow for migration.
> 
> shadow in the sense of shadow paging? So PV-only + !SHADOW means migrations are
> impossible? Why can't Xen operate on the PV pagetables rather than using shadow?
> 
>> HVM can use shadow or HAP, and our default is HAP.
> 
> For regular use or migrations?

HVM guests always have paging enabled - either HAP or shadow. Hence this
distinction makes sense only for PV. However, the answer is still: Both.
Because besides for log-dirty tracking, shadow mode is also used there to
mitigate L1TF for guests not doing so on their own.

Jan

