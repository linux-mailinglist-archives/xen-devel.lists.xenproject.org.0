Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA7hH0lGqWl53gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 10:00:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111DB20DDB8
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 10:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246318.1545521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy4ZA-0004Oi-B9; Thu, 05 Mar 2026 09:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246318.1545521; Thu, 05 Mar 2026 09:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy4ZA-0004MT-8I; Thu, 05 Mar 2026 09:00:20 +0000
Received: by outflank-mailman (input) for mailman id 1246318;
 Thu, 05 Mar 2026 09:00:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy4Z9-0004MN-7G
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 09:00:19 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bab1791e-1871-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 10:00:16 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-480706554beso83982945e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 01:00:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb3668csm46722955e9.13.2026.03.05.01.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 01:00:15 -0800 (PST)
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
X-Inumbo-ID: bab1791e-1871-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772701216; x=1773306016; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HMlMivLVNc4EFqEg/5TpfRMuBK0JJc1ca//jhnipcfE=;
        b=FxDcdjXb0OQVMInLpsJ8lDE+0EXa/sglTdaI0Lncl/SMqvf2MzDBcmRktJBR7ZLUMB
         ZI8wGJyLUM1vEt+qpfWtX2vok+WmIGRZZXQJSvj0TPwKdCSwKFU2bwOuKKLSON1pXrAD
         STs9hDw34rQUd1u6793zgeNFG7cxeLrTbVcZRDK8F3XPyRb3/XFCo3RqnWb0YxJIlsFP
         6ZPVSitPI2zU8c+NP68IUHhm0rVv60gNdJtHSZthu4uAuLL4QhLwakHRNDP8MEAj6wZ9
         SMJJ4gcYL0flir+xb1sEDVS8WmIZq4d9vi2Xxkp8hCJ035yyHKvpDAv68ovqTaDJtK92
         HMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701216; x=1773306016;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMlMivLVNc4EFqEg/5TpfRMuBK0JJc1ca//jhnipcfE=;
        b=eqIud5pUNBfwe7hU3PdthNG0JfDPhrwro+dYOOxtTvI7KelnFOI2BfaLAaxu9SIpcV
         unzxCMGwr6NVHfJS3Q+jqvSkoyBteYrpEb2gPPkj4QrdV+UHzAQ9HFPOAndbKRKRa5tB
         1qxoP4PCl6ZwkApoOqT2UE5YbWpS3DAufSwRu2sKm+KVpzxcqde6wUhVwZeFqdK/zK+H
         ZTJ/XWrM0are/uLWZ32kIij73ijgMGhpQBWRjhXBYtJW1rRL6g0KSQ+jAIOCEmr4qqc8
         1FbD6ZGuTXedaZAhGHkZ9dbXJQZoNU8Ka0CoAqbhAPWQnlczkCMvyEjs0LZ/iTivGe/2
         vOCQ==
X-Gm-Message-State: AOJu0Yz2bStY0WzXYhgvdA3FNjEvNciHCbaah0Y5HHAEkdxDeS5OqAB2
	mlwcY+pShtHAe2+x+z9ysXdzHUw0CeVGoz+9ZqkUbkChBEFAtp4v1TV7h5z3V0Td6Iz4iJzZa8c
	E8Hs=
X-Gm-Gg: ATEYQzwHgzb3Rzj7PZtLbF7OSCuOU/mt1js6w4MquL9QfRqa2u97Fm7WSZqE+w80KEP
	Ylb8mhBHck6JQ/0gI0Qf8j0FyRlUUIdV6fPyDA1iw1G+Tp7wEnwzspvOowQP4ipbNxmJReFVFnz
	lePbxAV445py6GjgOVh1hliUZg2OTAiB4Ye6RyO3z7MkUGdZ0rElNpeVAzCtush2ORCohhwTwW8
	7ZB8r9EcO4NuVK9pPZWALCzQF2j3zpNyVzf/e6S4jmKfPSeVs0tAGaM5Hg6PMvl1DEZyUVspzgK
	qqf4cRaDBLP22MOv4OQXJ1jfkNJq+Pugxze+BJZC3hREhTcCgnCT0h9F8NaQANTXbh4NWl8HobP
	1pAR7bOtiGcd/oDw8p6K2c08S580lOYxNUsbIvvD8Yrx785cL1lgoOfytWjc/ttouJNpQg6ZJKf
	GyI1mWLcPJ0lQ2OSDGhQkZJpRwoKP4/AZGQt5Ogl/XRby78EiCUwKficOiQqWBAewxhAWJ+X66
X-Received: by 2002:a05:600c:3b9e:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-4851984f5bemr91299105e9.11.1772701215671;
        Thu, 05 Mar 2026 01:00:15 -0800 (PST)
Message-ID: <2c3fdfb6-5788-4177-a264-56719e1ae804@suse.com>
Date: Thu, 5 Mar 2026 10:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
 <9f1fcbfc-e7b6-4ef3-8f58-c88f9667d606@suse.com>
 <aahKkV2csf28Y0YC@macbook.local>
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
In-Reply-To: <aahKkV2csf28Y0YC@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 111DB20DDB8
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[8];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[jbeulich.suse.com:query timed out];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Action: no action

On 04.03.2026 16:06, Roger Pau Monné wrote:
> On Wed, Feb 25, 2026 at 12:44:44PM +0100, Jan Beulich wrote:
>> When Dom0 informs us about MMCFG usability, this may change whether
>> extended capabilities are available (accessible) for devices. Zap what
>> might be on record, and re-initialize things.
>>
>> No synchronization is added for the case where devices may already be in
>> use. That'll need sorting when (a) DomU support was added and (b) DomU-s
>> may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).
>>
>> vpci_cleanup_capabilities() also shouldn't have used
>> pci_find_ext_capability(), as already when the function was introduced
>> extended config space may not have been (properly) accessible anymore,
>> no matter whether it was during init. Extended capability cleanup hooks
>> need to cope with being called when the respective capability doesn't
>> exist (and hence the corresponding ->init() hook was never called).
>>
>> Fixes: 70e6dace747e ("vpci: Use cleanup to free capability resource during deassign")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> vpci_reinit_ext_capabilities()'es return value is checked only to log an
>> error; it doesn't feel quite right to fail the hypercall because of this.
>> Roger brought up the idea of de-assigning the device in such a case, but
>> if a driver doesn't use extended capabilities the device would likely
>> continue to work fine, for Dom0 this probably wouldn't be quite right
>> anyway, and it's also unclear whether calling deassign_device() could be
>> done from this context. Something like what pci_check_disable_device()
>> does may be an option, if we really think we need to "break" the device.
> 
> We may want to add a note there, stating that we have considered all
> possible options, and hiding the capability and hoping the owner
> domain would continue to work as expected seems the less bad of all of
> them?

While adding that note it occurred to me that in order to keep the device
as functioning as possible, in the re-init case vpci_init_capabilities()
might better not bail upon encountering a failure, but accumulate the
error while continuing its loop in a best-effort manner. Thoughts? (One
of the two return-s is already guarded by !is_hardware_domain(), so that
could be left alone for the immediate purpose.)

Jan

