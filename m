Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEf2EtIpl2mXvQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:18:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80A516009A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:18:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236465.1539166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt5nR-00035p-Gw; Thu, 19 Feb 2026 15:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236465.1539166; Thu, 19 Feb 2026 15:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt5nR-00032r-E2; Thu, 19 Feb 2026 15:18:29 +0000
Received: by outflank-mailman (input) for mailman id 1236465;
 Thu, 19 Feb 2026 15:18:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt5nP-00032i-UN
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 15:18:27 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cf4d86a-0da6-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 16:18:26 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4362197d174so721391f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 07:18:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abc85csm49176737f8f.22.2026.02.19.07.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 07:18:25 -0800 (PST)
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
X-Inumbo-ID: 3cf4d86a-0da6-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771514306; x=1772119106; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eOvkefcwv0/OASM6NzuaeIF5Beka0S0Whqn80jVkDK4=;
        b=ZNANArKJZA/Z+IhdgTaiCna8F6NQw9s2VvpPoBwBgxkjNnFmreUVXgbqvFWL5/U7nL
         K2QgTgHVjeJuT62Mtu+u963L4aXVrn/jl6T1yckFX8NzgyAMpwwjJBJw37ArXPVty6Mu
         ueK12+deWEJ9LQaVAK1np2bWlKFfqWUDJ/51nb5e9r1oMPXe1MXSpABW/qFnJIoQp0GE
         9F0jkkrN0ra6cB3+Y+p65OFPhsjYhopPdW6hr66My5CBI+jza3epzQYSSUmr6xDPZjW4
         IwGTGwHVFGXAbtbLK/1Czy9+Ps36FWngMPfWeKnCrOMZaiMyLkZa3ee87ccc6vQFxnlJ
         5cdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771514306; x=1772119106;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOvkefcwv0/OASM6NzuaeIF5Beka0S0Whqn80jVkDK4=;
        b=OHxmJqTpcdJaL77qJEADTSsw5K+Vxa2zv+8CJXmjTO287zXeF4zlodwMJzim4fCR/v
         nTIBIjIgSPp8/alQOTdUtyAt2LyVQbf0i3//GMLk4Igjz1371ULBLiMf520G1jZMA+8V
         Q/1fis1qrtFxaTjGING50Y7em85duK3gBv4AaQHgi9VFrC3Z0O2wf2IAqaWXGopICLMc
         z55hfNGvbU4PqmHyFKhCRc5JryhSZ1s4b+MShJVMMRgbyTWuBPLwuyXHeewxBRUd02xv
         MEQYIgekKLZC9QgEMD8JLZC8hl3GPfyuwEL3bQJirkghyLtwDjjsjtLQ8Yc+C66/cvIB
         Enpg==
X-Forwarded-Encrypted: i=1; AJvYcCUZRBflSIFC80pgtQVOZfEFeoixlEvBcVxApHD9HJZ0JUxvQVX2cRLuHWvUMALnWEHcnqqXsdAE9Pw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVrh7r07zGKJgaeKIid+w5EIYrrv1SGvvIDY5UdGhK2cCuglOp
	vQMFXtIRp48LLLZgbhq+ZxyGUdiZNeDSo9gpMyj07UrfrNOyQNe8B7Y1gdr7KpJeyQ==
X-Gm-Gg: AZuq6aLup/Tw+1LstEOm1wyLTvgpz9LOFnXVdJjtDplCffZznJWpa234bzS0delv4Tn
	SxgUtAO/XGDE1LQ6Zi9wNN88wHEo34Lhn2u6H/XYouWbvye0eHCHxATfu9y0NwP4KEM3y5zlN95
	qu257FhCCdSbuG3IYbj0Q9+hcGGPzsNbJSyx3CnitbSzLDDaToHip8XjGiFHpoolwomWVxFyP7E
	3wwJXfHYSrNTJvxz3b59gqCQ8JaLJPhayG6WXn01iiDbXPhQnqO5hhOlO0GvGHhULIrd7+5hzj/
	AHAPZyGZUVzNIOQMeTclGZ8+uK9Bm7ovtVYdfnKmHVfh21BgLeq88dsuqzR9EUPNX+ON+RtXTk+
	GdljwmOjbQyiC4n1zul8Fv0fRQ6ElZ5Tqe2gzjLZCM6O993CkDbIjbLparlf5h1i9Ah4odrAqth
	RWna5XmbFhMfUP0vS2TY3juTc3opl0hLlFkyAChdsyViFCKcsvYf9I8hXmqYUSDmMfZPMS5bfCF
	/aLJ4+z2plj5ak=
X-Received: by 2002:a05:6000:601:b0:439:5027:a2f7 with SMTP id ffacd0b85a97d-43958e02c02mr10620583f8f.18.1771514305952;
        Thu, 19 Feb 2026 07:18:25 -0800 (PST)
Message-ID: <4f09c460-c74d-4dfc-992c-c743df32f463@suse.com>
Date: Thu, 19 Feb 2026 16:18:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG v3] common/domctl: xsm update for get_domain_state access
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Dmytro Firsov <dmytro_firsov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260219143707.1588-1-dpsmith@apertussolutions.com>
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
In-Reply-To: <20260219143707.1588-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,apertussolutions.com:email,ainfosec.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:rogersc@ainfosec.com,m:dmytro_firsov@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A80A516009A
X-Rspamd-Action: no action

On 19.02.2026 15:37, Daniel P. Smith wrote:
> When using XSM Flask, passing DOMID_INVALID will result in a NULL pointer
> reference from the passing of NULL as the target domain to
> xsm_get_domain_state(). Simply not invoking xsm_get_domain_state() when the
> target domain is NULL opens the opportunity to circumvent the XSM
> get_domain_state access check. This is due to the fact that the call to
> xsm_domctl() for get_domain_state op is a no-op check, deferring to
> xsm_get_domain_state().
> 
> Modify the helper get_domain_state() to ensure the requesting domain has
> get_domain_state access for the target domain, whether the target domain is
> explicitly set or implicitly determined with a domain state search. In the case
> of access not being allowed for a domain found during an implicit search, the
> search will continue to the next domain whose state has changed.
> 
> Fixes: 3ad3df1bd0aa ("xen: add new domctl get_domain_state")
> Reported-by: Chris Rogers <rogersc@ainfosec.com>
> Reported-by: Dmytro Firsov <dmytro_firsov@epam.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


