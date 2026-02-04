Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPOOB7AWg2mKhgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:51:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84619E4188
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:51:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220317.1529029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZXe-00012S-Gf; Wed, 04 Feb 2026 09:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220317.1529029; Wed, 04 Feb 2026 09:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZXe-00010I-DA; Wed, 04 Feb 2026 09:51:22 +0000
Received: by outflank-mailman (input) for mailman id 1220317;
 Wed, 04 Feb 2026 09:51:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnZXd-0000zt-5A
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 09:51:21 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0db45364-01af-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 10:51:18 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso433153f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 01:51:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e387b9sm5391554f8f.12.2026.02.04.01.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 01:51:17 -0800 (PST)
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
X-Inumbo-ID: 0db45364-01af-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770198678; x=1770803478; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=libfc9BhgH96C4+zLwIAP07Ravr2Tm/OGfwGAOkbnUU=;
        b=eatzgbKFdR/1nZVNCLCfjQpoL6JRX09+6WLhJ0zUDtptLKT1cT8y1vm9aSZjfGWg/L
         NA1kr2M4qVDbj5OvxZ3ObGrzsGbzDLrnj3lQOBgsb0iX/IB8kHCvGBnGJsHFvs5mhuXp
         HYYdT2s7pMU0queyrQLwdz8nMsWg4wBEueB1iVSsTz2AFEOTzx5+TTS8QWrm7yPusDOa
         gXJbwneVG6ak/p6Y3GgRDQHxX4AmoPczRUbY8rEx6wc+YLrFfEoSBYbTmRvIGLGfL/oh
         LTl6L59xWRpw83xJQaPOdYbfodYZuekF58pVx3vDfKhtE4+s0cmuWi5HbD6ZxLSEreVP
         nC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198678; x=1770803478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=libfc9BhgH96C4+zLwIAP07Ravr2Tm/OGfwGAOkbnUU=;
        b=nhjD7K41T3u/PYGMcsY6eNOte7XtE22ZYQgesIxKqtcbDRQ3zrWMhRVInQFsZekUTO
         X1RRSg/pb9ynf3/BYapAPZ3h03uRICHQOU7l07s2aV2AFJzd5o6ly019009LinF26Qpk
         U2efPYUVRivOc7XSd7wkBeiDo0AwHUthHYnESvfckEgnY1XNu859o4vDJNQwJv6TZQz1
         1CFsNIotMFJfnfY3rd7ivPTyB+op7Su7x8tASfgTKTSjkhE/aO7yvdvku/Lord7hXqOQ
         VaD8KO0udpnzrPQL/sc/68Xc+Dfzz7830NcGdKDQlZwTpVOBuVpXJpib65Xm10mOyoFq
         ZUJg==
X-Forwarded-Encrypted: i=1; AJvYcCX3nnmXiPuk1yHObyzvykdB/nOP2egyHeS5ULkOS32sdvQW/CcLyqZTC8HXmmNy420Gp95DWUxoFLY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9731VA3+lge0jJqQUcwVX1NPT34QSa51idnNSGxCQ474goc8Z
	2D3o0j9DVDhKBCxuTN/jBIP3leoai2mO9M4gYPyVbTPsoyJ343NzhdzGOOhNom5FOg==
X-Gm-Gg: AZuq6aJRkmkfZn4dCli6muy5bB4rzApKVwL9e6dSMB1GjK/UDxDtyT+APEXG8/hz0F+
	/XPy93u9sONXqSFb2+wBuL0KaobIgewNORk0Mx3Vd5SvYJTm9/5kVfRwSL95omAyXourF8RIZoN
	EsrNykpYE9aCPwGGE5c9yuPamxVd6eFJ+YMuCEmz05yKcQQQqWdPS8RM22RedfcbRP5NkvSKfvS
	EPNmiVIOXrLdklQvoqHI/jWZbZRUbdSYMCMYg9OLKCW+990felI4OAs0CgAFXPMJV4XRzor8uO9
	pmgjuC0VVjSPl42ADcroeRez+jq9/D52p9TEe02+QT4hfMhch539YyePtlUt0QovtZ86gZmHm1d
	qI2jO4S4xaM6WMy3IRqhRx6Ua6FLhPW+LP9/c+x+RW3HRWK2qPnacRd8S4u+i+CKLcmctQZticv
	Ko64XwG6fDH4q/nRNy88HAE2rA9ruqyDfF8XnJFQNDnLcsYikTwS6NY88t9lDHT1HbsHzH8lTa5
	Ng=
X-Received: by 2002:a05:6000:400e:b0:430:fcbc:dc52 with SMTP id ffacd0b85a97d-43617c974e3mr3357562f8f.30.1770198678177;
        Wed, 04 Feb 2026 01:51:18 -0800 (PST)
Message-ID: <36537370-1fe3-45e8-9790-852d73f93e07@suse.com>
Date: Wed, 4 Feb 2026 10:51:15 +0100
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
In-Reply-To: <e31a8309-a963-4084-913b-39af9222eb2e@suse.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 84619E4188
X-Rspamd-Action: no action

On 04.02.2026 10:25, Juergen Gross wrote:
> On 04.02.26 10:15, Jan Beulich wrote:
>> On 04.02.2026 10:00, Roger Pau Monné wrote:
>>> On Wed, Feb 04, 2026 at 08:56:10AM +0100, Jan Beulich wrote:
>>>> On 04.02.2026 08:49, Roger Pau Monné wrote:
>>>>> Also, I would remove the tools guards, I think once a DOMID_ constant
>>>>> is allocated it becomes part of the public ABI, and it cannot be
>>>>> withdrawn.  See for example DOMID_IDLE: it's only used internally in
>>>>> the hypervisor AFAICT, yet the define is fully visible in the
>>>>> headers.
>>>>
>>>> It was me to ask for it to be guarded like this. DOMID_IDLE (and perhaps
>>>> others) not being guarded (at least for IDLE: by just __XEN__) imo was a
>>>> mistake. That mistake may in fact be correctable, if we could prove that
>>>> the ID cannot usefully be passed into anywhere.
>>>
>>> Even if it's not passed into anything, does it make sense to guard
>>> them?  The reserved domid values are already consumed, ie: cannot be
>>> reused in any way.  It just seem to me like more ifdefery churn for no
>>> specific benefit.
>>
>> Well. From an abstract perspective, purely hypothetical at this point, I
>> could see a potential need to re-number them, e.g. to simplify checking
>> against groups of these special IDs.
>>
>> Yes, excess #ifdef-ary is an issue. Excess exposure of things also is,
>> though. Finding the right balance between both can be interesting.
> 
> I have a patch in work which would want DOMID_ANY not be guarded. I think
> especially DOMID_ANY could be useful for other cases, too.

Mind me asking where, outside of the toolstack, you intend to use it? Note
that unlike IDLE and perhaps a few others, ...

> Look e.g. at XEN_ARGO_DOMID_ANY. Even if I don't think we can switch it
> to DOMID_ANY, it shows that the concept as such is not restricted to Xen
> internal use cases.

... I don't mean ANY to be constrained to just the hypervisor. That more
strict guarding came up only because of Roger mentioning IDLE.

Jan

