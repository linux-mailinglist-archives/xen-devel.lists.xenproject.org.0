Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /gsdKGDbO2oWeQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:28:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A359F6BE99C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:27:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=TzjslTP2;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344969.1603984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNdv-0008K2-AN; Wed, 24 Jun 2026 13:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344969.1603984; Wed, 24 Jun 2026 13:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNdv-0008Hp-7i; Wed, 24 Jun 2026 13:27:51 +0000
Received: by outflank-mailman (input) for mailman id 1344969;
 Wed, 24 Jun 2026 13:27:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcNdt-0008Hh-T0
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 13:27:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcNdt-002U3E-60
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 15:27:49 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bdb42-bab6-0a2a0a5309dd-0a2a450590b0-42
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:27:49 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bdb54-3cb2-0a2a45050019-d1558035a96b-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:27:48 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490bc6a7958so15619425e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 06:27:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4926105821esm36979155e9.1.2026.06.24.06.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 06:27:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1782307668; x=1782912468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lmoR4X1oAGRCqIjqrfLDbWfKDtB9nbJvf0SVrimyq7s=;
        b=TzjslTP2e6rqjaxtiXN0RkYtKkDQwzj6gqvvawCJ7A4HumT4Wn3yykh1rJ4yf2kU1x
         alLfiSe/z4ughUfDvvmFskSwU7O8bv/hmM4JJtkoGfuo81XGYAYPcJzV9SJ0nTHcoxtG
         alfPecRargQ2N7/JbhaEk1cpoZCjj/2cGlgkWXfU7p5gsba8eYbGSqfpOz2A1Fc0M9SU
         GDLbZwLvOkewqnKPe9IdSuKOp6JaBEDMlHqKKW3MZ9SyWdmLtzeKSO5iiegD/ldKIgeu
         7GmWcq6kGnTDCQuzF/ajMw/BYxJcXKZN9x+oHGaaU0ETmdplH6LelZvFlNXJIyi2yDG9
         yLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307668; x=1782912468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmoR4X1oAGRCqIjqrfLDbWfKDtB9nbJvf0SVrimyq7s=;
        b=gTCChCNMJMwWMpvlm4YBpz7FEKPDKf8+bVwwvTT8lP75Gr2MQReKcQySyV5c1abIZA
         GVa+2GHyeDwNKxSNQVnCKjGIBKjqwzn+U2eO/FasR0KMNeE3xWeDHtDTshS5H/eDS7SP
         pJjxdHhU95EJgRyyRKVlNoaMxOgS3ZB7kPu/fYctpqt7yOsUwT+WoFxwv1aE7sPW9KTc
         KGwCWor7R9bStu/O4sWaSBAknvOtbeyQEXojTR0AjMzO4UmLbENl1HbFA+nHk+YN3DNP
         wVta7JldhFO6CBRghqLRUevInP+IX9eNAooLjY18mzSUYs9VZ0B29rtNbIciJNplyKUX
         uVCA==
X-Forwarded-Encrypted: i=1; AFNElJ/re+rY70NR69g8kn/W61+04YbCQJP+PmNaNNYa0KbBQUmRwPd1fxBKiZr6sjDLm1JrxGopZLnyScU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+R+eZw7Y3mwA6zasIZnICLW1LNDHMmimZlqWh51K/nYkqgU1v
	Njlj9ec2qoUT7T+brWqsSaWwUQv2jRknM+O4fJuObDGAsGmFJ4pKUI0/mCn1U9fORA==
X-Gm-Gg: AfdE7ckA7lniSM0N6Um7d+EFZxC+7xpfiqmX5RL7tDqHbuy6rir0CNmmITcVdCLIEbH
	NiYT/WphpZUsJmTdvXvgvxOv4Qb7G3SWxuHzQXTuuGsh/NbL/8utx2xu/d0dID04eqx+ssT2JRg
	Q65anNyvz9tFrsYeo/qr5oHfZh2+7Cl0DswgdP+MKnHzRgf8VWqGd7AD9NPE5s3JTEoEsWffHfp
	vK3HF38CG5gfJzcAOduI/2JUmhdLozRwIJLNgMGjVpBAdVYq8Wf8Y2crnjryqgVfScn0I8Ykk8d
	E0wPVMa+jykAGh7SeV3XMyknt2HgzbJxbWBnzHU38NjOH0HWof9GCBrZnKNrHqfVUg6+BRSzCni
	3XqwtuIH0IQjc2teXdL3UdKAvS2TVFkibjX55USKMN92fUpIRljikAcza5DWrvEzMj87UxwKBt2
	jVauKFt/el4trqBuJAkdyQ8sX9RjjddYwSudpTwdgsIRaRh2bjRFBogaVYhaN3fi5xdu0N76VFh
	Seg
X-Received: by 2002:a05:600c:3111:b0:492:38c9:b265 with SMTP id 5b1f17b1804b1-492632b6ef8mr7124215e9.15.1782307668445;
        Wed, 24 Jun 2026 06:27:48 -0700 (PDT)
Message-ID: <52edb0a4-1433-4c07-92ce-b3419a20c83e@suse.com>
Date: Wed, 24 Jun 2026 15:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/23] xen/riscv: introduce (de)initialization helpers
 for vINTC
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <8bb11b0d9c905dd3dd9f922a3f1d2e7f2b75c978.1781693963.git.oleksii.kurochko@gmail.com>
 <063d38ba-8ead-4f69-bb28-752fd56f0b12@suse.com>
 <92a45378-133e-4b12-ae14-3e5f31fb2d8c@gmail.com>
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
In-Reply-To: <92a45378-133e-4b12-ae14-3e5f31fb2d8c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1782307668-0F1142B8-FA5E7331/0/0
X-purgate-type: clean
X-purgate-size: 920
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A359F6BE99C

On 24.06.2026 15:19, Oleksii Kurochko wrote:
> On 6/22/26 5:01 PM, Jan Beulich wrote:
>> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>>> +int domain_vintc_init(struct domain *d)
>>> +{
>>> +    int ret = -EOPNOTSUPP;
>>> +    const enum intc_version ver = intc_hw_ops->info->hw_version;
>>> +
>>> +    switch ( ver )
>>> +    {
>>> +    case INTC_APLIC:
>>
>> "version" to me means something different. Do you perhaps mean "variant" or
>> "flavor" or some such? (I realize this also affects pre-existing code.)
> 
> It is more about a variant than a version.
> 
> Would you be okay with me renaming intc_version and ->hw_version in this 
> patch, or would you prefer that I do the renaming in a separate 
> preparatory patch?

A separate patch would likely be easier / quicker to get in. But if you
absolutely wanted to fold the rename into here, I think I also wouldn't
outright object.

Jan

