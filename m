Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNNbCpdmg2nQmQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:32:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEE2E8D2A
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:32:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220930.1529341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnern-0005JJ-QW; Wed, 04 Feb 2026 15:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220930.1529341; Wed, 04 Feb 2026 15:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnern-0005Hb-Ni; Wed, 04 Feb 2026 15:32:31 +0000
Received: by outflank-mailman (input) for mailman id 1220930;
 Wed, 04 Feb 2026 15:32:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnerl-0005HS-RY
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 15:32:29 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6c8e257-01de-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 16:32:28 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43591b55727so6064654f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 07:32:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e250b2sm7820934f8f.8.2026.02.04.07.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 07:32:27 -0800 (PST)
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
X-Inumbo-ID: b6c8e257-01de-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770219148; x=1770823948; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nbI37ToayJGAV0bk/z5GYY1QMRoFHAJpnW6Aka6JAGc=;
        b=bf8jkphEhFnnX/lxqM2vkHOSRoaiBtoB4xrgB1Aq9tKVf6gE8pPjNkKfm27+h1sUnZ
         KSR0q1gGVMUMwY+ZDKasKUCFX71uQue5/dVMOF37UY9vUQQffowX3MSJDBd04F0Q/lJs
         S4cntb/S02O3tZONA9vitv50nS6UKhUXZf8dICMn1z6krj8KIugA+EvvVtCNcdFBmRrF
         v38tRlNNmvBpQ0y/u43pyUD6FFOb8xuz34SYskUE08mSzo+bEgy24gmMRHH0xqFdXePk
         J4disrW7DqFYjWhQpiQ6VYHjZs0DOWfzQdZyOJTDwqx+oscLQo+Re/tDT9O8B1glAOUr
         xAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770219148; x=1770823948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbI37ToayJGAV0bk/z5GYY1QMRoFHAJpnW6Aka6JAGc=;
        b=mxjacsRHxd4Kiz6QMM2I/3EATwVI9H3qfXaWCzfrQlDY6fKeszyZWTICIGwoPLnErY
         aJnmR8RD2udZ1ZPpaer03pvtQb66bHiCPIzx2h8xwL8B2VcwGtrvdwBXcO4dfFBmoxwD
         qnMjCUp47urN3EPGSQQ4j5o7LjAeeIqXSXFmiyrd7t/uwMIZv9P9orA96E8h11zLUBna
         rbbcVEjVC0ob/yCFdhxmX665/uvEZiLgBG7iH5n16QvF6sRlbkz6yL6TD7gtkTktqtGo
         KZrpxvXJY2uQ7JChWMp3eTdS3WNnDxxYQuSzYP4taPda+9hEV+OKFsM/sRrgWodqC7iG
         3Ecg==
X-Gm-Message-State: AOJu0YxsDm4YMl3uHndGrkLt6TYYlRETHvg6lnKAlnjbnnRoQKhyYQjN
	g5Tp83yQhldNO1wYfQ61G/1ytIJFk/UfgmXtF2zLYkeBm/ekFuJhMLBWE45X5VGRdv1pUTHBog4
	bKG8=
X-Gm-Gg: AZuq6aJ3ipJFmhTQ66wV+kIKmh4EQ/dBtB0D2dd3sUR5326oLisqQsPyynA4fvr+ZTd
	uc5ve8A5bx4ywYLOmqpvoCabBdBOeGSvQ52c4/RZQGt/IV4hyZunlnUGYR/fsNrzXLHpVNTufw0
	rEkj6xAjUkCq1hKziDZ9lizDazcBDYSE0ClHaOcMwP0jGQ9OL5VKvx8OgDSPoUZhFnC91EuUr28
	VTMVx2FleXeaRR4mL3s+92N467Gxis/JPXcP7EV7TC4a6c0b1O/hvYVQ/UiDUt5jZzberxZu8hM
	sKJZKHCjCZA+91H9NEU+l3l8U5NxMVos1oTTTio4RFuRv1lnu9Tn4thLXuwm0C66W5pfAMgjSlT
	RgHjTOgOw+0VJ2cTWXpEY4OHM5IqvGVCdXkkLAMCyLWhtUnsJdo/a4VglcAlANxmiwPVu+blEJa
	dPbEdRtnwUVsO/0fZ652jYkhSjjJL27szIkkr0KNULxTxffyuSYesQLql477P9fFcETH5+Fw19y
	Fs=
X-Received: by 2002:a05:6000:250c:b0:435:e060:8071 with SMTP id ffacd0b85a97d-43617e41ee9mr4499471f8f.16.1770219148127;
        Wed, 04 Feb 2026 07:32:28 -0800 (PST)
Message-ID: <a7ba4cfd-d452-48f4-99c8-a7c283facfd2@suse.com>
Date: Wed, 4 Feb 2026 16:32:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <cc8f0f84-fd5e-401c-ad71-ab5a10f21fa8@citrix.com> <aYNfVDgSgKCYd929@Mac.lan>
 <764e6a9f-8def-4f6e-8311-ef91b6c3886e@citrix.com>
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
In-Reply-To: <764e6a9f-8def-4f6e-8311-ef91b6c3886e@citrix.com>
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8CEE2E8D2A
X-Rspamd-Action: no action

On 04.02.2026 16:12, Andrew Cooper wrote:
> On 04/02/2026 3:01 pm, Roger Pau Monné wrote:
>>>> +        share_xen_page_with_guest(virt_to_page(d->shared_info), d, SHARE_rw);
>>>> +        /* Ensure all references to the old shared_info page are dropped. */
>>>> +        for_each_vcpu( d, v )
>>>> +            vcpu_info_reset(v);
>>> switch_compat() can only occur on a domain with no memory.  How can we
>>> have outstanding references?
>> As Jan pointed out, it's not references, but stashed pointers to the
>> previous shared_info page.  I've used the wrong wording here.
> 
> Yes, I saw that thread, but my question still stands.
> 
> How can there be any this early in the domain's lifecycle?

Can't (aren't) vCPU-s added ahead of adding memory?

Jan

