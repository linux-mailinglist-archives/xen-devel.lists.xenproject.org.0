Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M3K1NO4mIGq4xgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E486637DFE
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=JxkLkfnv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326263.1591807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlJ0-0002Ou-Op; Wed, 03 Jun 2026 13:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326263.1591807; Wed, 03 Jun 2026 13:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlJ0-0002J1-Dk; Wed, 03 Jun 2026 13:06:46 +0000
Received: by outflank-mailman (input) for mailman id 1326263;
 Wed, 03 Jun 2026 13:06:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUlIy-0001rX-7y
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIx-00C2Yc-Jg
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2026db-2eae-0a2a0a5409dd-0a2a450bb19a-20
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:43 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2026e3-212f-0a2a450b0019-d155dd36b45b-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:43 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-45fd461e4a5so3260943f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f34413csm7284992f8f.21.2026.06.03.06.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 06:06:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1780492003; x=1781096803; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1MJA+2NbmVQKXujYvUSkt1kO/HT1VLx1sANxeZf3v3c=;
        b=JxkLkfnvw+1/i9VyC1p7onOV41uNFnLzc0mfOXCUDLBs0VC+o2zRSrCSGrICiD6mFj
         dhiAji6pTaF1fOJp+kTXbRPw0MwNJwvkiMiC4EdwR21yZzG620b/RoUZ3fL4DTW4fxDa
         8XYLfz3oaFThFbk9E5ojsL//ExVnb6peSmbhTaMkMQY/IYMBa2IcHYM7xGYCRsqeqS4d
         +UgPZJUC8hehMIA1Uc5ujVyr0Nxotwb0J1aRrfoptVQ1cGlorhTs8DHw2rzcNPeLpgik
         lgNlhWMro/tpcQ3NqeWSFQb/KQ9nYfKVxFkPtc2a2pv2y7uFQ4QtFJ69YEjaJ8ingmBL
         3uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492003; x=1781096803;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MJA+2NbmVQKXujYvUSkt1kO/HT1VLx1sANxeZf3v3c=;
        b=By9hBXb95MPFpG+uBf2k1+XA7bTSoDwf/1L7B6ByID/91utR5V+XNakZVoncxGfinb
         peH+RG+VzjiV0+mCWRKJ1Go8jxswqAO+tu2ZS+9gArddZsGI3oi1ln0ZQdvj2wgwri18
         cSb4oPXV2u+WPg6dRRJARpsWfIkpVuKqa+n86nNnF2dl5fIc3/FPTIHI2z8poQU5Iu77
         37peMpkLDBPxSQxLFiGJBclYAjUGeGL1mUy7RMcw+ocvPLTzApnBIDfdXgrkYnSpJKwI
         BXTz2tX19P91zkDYcmFSOcooLhK8MNRPrzJa7zjCO/qJrggHHa58jsYUQn0Ui/NickTV
         A9Ew==
X-Forwarded-Encrypted: i=1; AFNElJ/vJn1QgINfj/HxB/TOMJwVgwiwUCwmYbXKBGcqKy+t7co74WGJUtR36u1s0rekDLs/POIHAXkvYCk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOEOKY1AxDO73Sn6yJgdgm2QNZI4iErAvlvl0of48ANP4sKVFo
	BmTwhz7sq7tpXBq766NBx72awcB5G3G5ud/7ODZuylTmbV8+xuJR1+cqBEnGAQUaMw==
X-Gm-Gg: Acq92OHexQj4LEUIrCZjvd1sawVJzyHP3Obnq47xwSV8qFWrNtM97OgCs5M1gELoKsn
	S7hr+87YnJ0UNOcO/w7XQREGCDS2deDybh11B584MEf/cKxGeCfMwZXo580+RDIAjooPyEVTLWX
	7ybI0vWzNH7X1HnufMclJOga4Zur0GuAmhUs/uiIt1FAPcOEItZLc9sC20n8wjGFpFP2vdgiykf
	u20ZymdOtNEREgzbF5plblQbDuJMF5TZA9XzYW8aeHgLEbaVoH+CWiu7OzvbmGb/2sDxQ8NUrQo
	WkOi0PGDVQY3knCngIKIQ6J7Bqc5533avfTIZ1dW1QUcrxVLJmKeBqDe+S9pUe/HzNvK7o+UtDu
	E9TvcHBdkksP5+F4iGXNahAKRXAaIaTF/AOPET54rC30W4fVYk/D0XMhFcPFWMgMWWdDQ/1dPYC
	trxRg1VwagiVW10qh2TFI532UTi08Haxkowd7EPogsSmXW+OwdpTFnxJ/HSEB2HWc1U0mgMUqsW
	GgSXlEDC8ieDYNJZbJF7/BQ4w==
X-Received: by 2002:a05:600c:1d86:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-490b60de617mr51873705e9.16.1780492002716;
        Wed, 03 Jun 2026 06:06:42 -0700 (PDT)
Message-ID: <4d52e642-c235-477b-92f8-f8d3af6db23e@suse.com>
Date: Wed, 3 Jun 2026 15:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/24] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260531224755.9481-1-taka@valinux.co.jp>
 <20260531224755.9481-8-taka@valinux.co.jp>
 <7040c58f-2d4c-48f2-854f-c874efdcefbd@suse.com>
 <OS9P286MB72221F0A5D5195C7A4CAFD4082132@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
 <OS9P286MB722241B5C3E48A93F7E0BBA782132@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
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
In-Reply-To: <OS9P286MB722241B5C3E48A93F7E0BBA782132@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1780492003-1BF7EF3B-195F1061/0/0
X-purgate-type: clean
X-purgate-size: 1816
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E486637DFE

On 03.06.2026 15:01, Hirokazu Takahashi wrote:
> Hello,
> 
>>>> +
>>>> +#ifdef CONFIG_DT_CPU_TOPOLOGY
>>>> +extern struct cpu_topology cpu_topology[NR_CPUS];
>>>
>>> If at all possible, no new NR_CPUS dimensioned arrays please.
>>
>> This is also part of the code imported from Linux kernel 7.0, which is used to
>> store
>> unique topology data per CPU.
>>
>> I kept it as an array to match the original Linux source, but I understand the
>> concern
>> about adding new NR_CPUS dimensioned arrays in Xen. I can refactor it to use
>> Xen's
>> per-CPU infrastructure instead.
> 
> Just a quick follow-up to my previous email:
> 
> While I was looking into moving the topology data to a per-CPU variable, 
> I remembered the ongoing effort by the team working on CPU hotplug. 
> 
> This introduces a dilemma: during the early boot phase when we parse
> the Device Tree topology, the per-CPU areas for CPUs that are not yet active
> (or yet to be hotplugged) have not been allocated yet. Therefore, we wouldn't
> have a place to record the topology information for those inactive CPUs 
> at boot time.
> 
> Should we have the hotplug team parse the Device Tree topology information
> on-demand when a CPU is hot-plugged? 
> 
> Currently, the functions used to read the topology from the Device Tree are 
> marked with '__init'. Removing '__init' to keep these functions resident in 
> memory feels like a waste of memory. 

Indeed.

> What do you think would be the best approach here?

Can you know early enough how many CPUs there are going to be? If so,
allocate the array just at the size needed. Next best option may be to
have a NR_CPUS-dimensioned array in .init.data, for the used part then
to be moved to a dynamically allocated, generally much smaller one.

Jan

