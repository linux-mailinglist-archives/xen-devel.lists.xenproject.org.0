Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIYjN2ZOlGktCQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:17:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5F214B3F0
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:17:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234853.1537964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsJ5I-0006Th-0i; Tue, 17 Feb 2026 11:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234853.1537964; Tue, 17 Feb 2026 11:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsJ5H-0006Qs-UK; Tue, 17 Feb 2026 11:17:39 +0000
Received: by outflank-mailman (input) for mailman id 1234853;
 Tue, 17 Feb 2026 11:17:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsJ5G-0006PU-2a
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 11:17:38 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 439677e4-0bf2-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 12:17:37 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-435f177a8f7so4447679f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 03:17:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abe3b3sm39378376f8f.18.2026.02.17.03.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 03:17:35 -0800 (PST)
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
X-Inumbo-ID: 439677e4-0bf2-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771327056; x=1771931856; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S5sWE+t6yeYVcfOn1brq0Z01Ev8xd7cPajO+F4B0yfw=;
        b=O8GLBuNrH6rueLff20N4cLU+RcWdmZk7uXx8r+LZTrQpI120CS6SJeRdPZraKCiKRK
         CQsK+3sMUkxD1oHPdwg8eIW1A2nE4ozFl2awk6JH3bKEVNDRggyx/7KQg7RcJULN1JSW
         B8t3z4os6t1239mjqRGdnQE/bvvi7SrmGwACrcQNTkO/1Hvo6PMvncJ5mhpJh/9ZzSNJ
         XKFRdd/LYMCdVvIcXC9cTCS7eXIYqoLrGTg/H/12RaGOa3HsTxz/VoVbRVbmn2JSHCuO
         OaZPzmQmyv9wVh6E33crFwyoBz/GgswdhjV/rtiY1DILre88362wjYJPo0IJbweIMrfu
         /0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327056; x=1771931856;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5sWE+t6yeYVcfOn1brq0Z01Ev8xd7cPajO+F4B0yfw=;
        b=i+KGgT+8fvCNV9YhTVu8Oz9YpGYWsF+Mqc50lY+/maxdSkKUpa1dJPHsFkFmhW/iiM
         b24z01JwQuE7JaPjGj8p7DEq7ZaCAOtlnvU+qWqypVkKa+dNE0a5Vi6fKLbATo329drO
         KRA5yi6bV0geL3c2LV52Ds1TXHKCI4c5z8ITeR2GJZwf1ct4lBw8uFBoanaTqko4he7e
         8YyZ1i/6/lCAVmgvMYxLRo4ydyzTqVfoqzzKVKa7WU7eWGzSVzr6XIpK0YBFOKy/RyDQ
         5g+C25G83SsR2Tg1P1ND7LkOVIZd28cXvuEyoSNJe6tHKYZaCnVJ5qTw6tZ3Ka0RDYy9
         tLUw==
X-Gm-Message-State: AOJu0YyWQpATZ2Xm8Ya24zawQiWBf+a2GaV2tncDnH1L4WrSMDREaZgT
	0t2dLmqEYbVLUmAkf9yNQTDgusYPhIq7WxjwRI9C57oCnu/7qUOKEDqAz7c9U5/QhQ==
X-Gm-Gg: AZuq6aJYRXraqNpaBMQ1mgn++SHuHuvR2heXijh3av8bXHbKeAX8gei9on2AtiFTS+c
	o1M2AHY9aB2wt/ZKsnWlGmeZli0rma23insqB976hHx+skLBdQukF0UQ7blxgtRNmRWLVfEQkUA
	LXe/TY4JAcGwG80l3kq2UQSGWKEcKb3vBr6I6HcoywFa8xah+sdYoqJZqnF3Yd2OpgDUkpxUShh
	EGkkVJ2WfGBKokvNT7EVrzETOSeVJgs103ZRhBv2FEDgYJ3XMJPBQrVGsJYtL1SSJjncYwJY5bp
	zVMhuOm0Pie7B05rsAozxWWZ4U9FruLmzL3yio5vBa5Eq54V1zGyrvAv1193eLd3m7UGrnfIWuW
	Xfi6wtIm393Y6OvR/XzRky3LiRZUtOfY3fvHLteWaglYCRMWLLRhB30l2oo7uKmAcljC6PwMNpy
	ctfMi2FYvVldzDnEEp/Km4miP0coNjsLXHB/rRCyYxo1Epto9pDZXa7knGXd937ZjN76cNKtii8
	ar+p3wyZuM5xjmHSEribepK9w==
X-Received: by 2002:a05:6000:2203:b0:437:677d:42d with SMTP id ffacd0b85a97d-4379dbaf326mr21058095f8f.63.1771327056323;
        Tue, 17 Feb 2026 03:17:36 -0800 (PST)
Message-ID: <a0e47cf7-91f0-471e-b6b8-6554f496190f@suse.com>
Date: Tue, 17 Feb 2026 12:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] domain: skip more stuff for idle's vCPU-s in
 vcpu_create()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <c0aef909-b294-40af-8d24-033b28450338@suse.com>
 <aZRLMePmm8ehD94H@Mac.lan>
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
In-Reply-To: <aZRLMePmm8ehD94H@Mac.lan>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4F5F214B3F0
X-Rspamd-Action: no action

On 17.02.2026 12:04, Roger Pau Monné wrote:
> On Mon, Feb 16, 2026 at 04:54:30PM +0100, Jan Beulich wrote:
>> Nothing hypercall-related needs setting up there. Nor do we need to
>> check whether the idle domain is shutting down - it never will.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> @@ -516,7 +516,8 @@ struct vcpu *vcpu_create(struct domain *
>>      }
>>  
>>      /* Must be called after making new vcpu visible to for_each_vcpu(). */
>> -    vcpu_check_shutdown(v);
>> +    if ( !is_idle_domain(d) )
>> +        vcpu_check_shutdown(v);
> 
> I would possibly leave this as-is.  I agree that the idle domain will
> never shut down, but it's possibly best to needlessly call into
> vcpu_check_shutdown() for the idle domain rather than adding the extra
> conditional for the common case?

I'd prefer to keep it conditional: Calling the function for the idle
domain gives a wrong impression, plus it may be the only one where the
shutdown lock is used for that domain. We may want to make lock init
conditional in domain_create() as well (possibly with other things we
needlessly do for idle or more generally system domains).

> My Ack stands regardless.

Thank you.

Jan

