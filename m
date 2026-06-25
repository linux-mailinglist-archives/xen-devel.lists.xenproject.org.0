Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ilE0G1MLPWpUwQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:04:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C425E6C4F4D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:04:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=MjnDHlyM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345465.1604321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wchsn-0005yK-Nw; Thu, 25 Jun 2026 11:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345465.1604321; Thu, 25 Jun 2026 11:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wchsn-0005w5-Kp; Thu, 25 Jun 2026 11:04:33 +0000
Received: by outflank-mailman (input) for mailman id 1345465;
 Thu, 25 Jun 2026 11:04:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wchsl-0005vj-LF
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 11:04:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wchsl-005rFu-1N
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 13:04:31 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d0b32-e002-0a2a0a5209dd-0a2a4507b180-42
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:04:30 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d0b3e-9c8e-0a2a45070019-d1558032ad98-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:04:30 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso11602605e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 04:04:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4926541e03asm47182575e9.2.2026.06.25.04.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 04:04:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1782385470; x=1782990270; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xps5PxsAi+1CW3JuH3NN6Odr5QeT9LZlfHX2dEpANJk=;
        b=MjnDHlyM+89rkKlzxL/M4cinNiGW5uNrEFRt1R3rT+b40spo7TAaC2mtZycTHSlR+H
         9FKmyP7kJvlLD9ZKlJkPtWkxHURSUBSbMndLlJxmGv8Ut58Y+QputXzh8zR7GA7AYKvP
         UI+WU/v/tqSxixHYIeqoCeF9vsMkM9Pd8Nb3Simbo9BYswYZRp7GFvMbEwaap0hBUusO
         x08Q9sqnfyhaivxCpK0h/MzKfUn5VjiKvha4nsqqcS9RelNXWF5x+4HsRqEU9oPnKoGQ
         I7gepQ6LzEnlXtMzjTF8kPOHcKO0yGrIpu1F/pVsIxByki7RAVa5Q445S7h5RlPTTazr
         nicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782385470; x=1782990270;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xps5PxsAi+1CW3JuH3NN6Odr5QeT9LZlfHX2dEpANJk=;
        b=Xpd8ZvBTIzEnXDoGXzkVE9yQ3rICJD6ygxGw5dzL2XlpUkcivFYo3QPbkTmkUYGByG
         PiI/EP6Lj62SJElEHbNXYmS1kuhqaIjpgVgkUxP+DAB54gAEeb2TKGilIaMg4yMufzG5
         6DB8SeQ8IyAf8Gh3XIV36UKGQKMxf6z0p3SEipin4wHUR6qX415OdGjYEUFpHW3YPg0t
         /0HumLbXnXnmktUae4njSTRpNTXltZYE8b4lfQsaA1NDOpyBPlG6De9ztFRDduIVl+ql
         ZNoptjTyZcALB2bNey/mV/kI1q8hDfdnU80JpOa4ePqIQSqJKCiaATzAc05F/+eEloAp
         LvvQ==
X-Forwarded-Encrypted: i=1; AFNElJ99etVg3Ai8izQRORaS0dPaaMRmkKrGipGUf9zPwPRNq16+x4X/aNigfdc1KVnI1bzryLy8ENobUN4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdCJOU77QVEvVz9muCBe6IKbRTBcnpvClQrAn4RIpVdIZaHRIy
	9J4uCgJRYUqbiORoZrz82A9yeILvlQVzudh2Nbeui5DRdcosZdMz6n+JTE8VXFUAqw==
X-Gm-Gg: AfdE7cl0MvfUn4R95r8rsku2AAI6tnyuo7MOdHbLsdqX4xGy0Eayi95eKTIKLOVwieX
	MugyPrcI9LvfFY5SrgSU9HcjxRhNOpvydNZR1fjLihwuynSZr21NCkZxeuUPwEvt0TB2tjaWuiW
	+NUKBXAfY5RScGOYDwnG+VhU/HsIrMIkkMjphWh/WgOwK+uvXUwYh7EXM53MpgOB3UC8Rd6mxuT
	b5PO/UUshPDlrPkHZEhjfXDbUxe5Mlm5d+c/bmn3idO0hwvVXBInmS+9DJFEQN/toZLHfFSafD1
	h6ztfQe6C6dST9KNXtW8kE04YVF7lu8EK06KYFVA/+aMPjfRLGOx9nOrbzWUnisYDBAVckMhmSC
	NLYZu7sRFmhO5pT4pRDj2Q9RONUdedXHaTaICSRFHbhEVXaXjgDyBGGJsVvlEgB/NqB1ceP6r0w
	remjnpUF9auPNlGfTIZROr5b9XRy7GjtJllTiUysPhit8NZfga/dqscgZX6h3TlaHenSTmxoBqi
	VYl
X-Received: by 2002:a05:600c:3f07:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-492668961damr24546415e9.24.1782385470287;
        Thu, 25 Jun 2026 04:04:30 -0700 (PDT)
Message-ID: <73452348-466c-462d-884e-f181fe12b293@suse.com>
Date: Thu, 25 Jun 2026 13:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1780494838.git.oleksii.kurochko@gmail.com>
 <7ed7b888e203b7cc6c3a3a82b3bcc89d90b3fb48.1780494838.git.oleksii.kurochko@gmail.com>
 <d63a3877-286a-43fe-97fa-301985c3a0ac@suse.com>
 <910ed097-10d8-41a2-9035-a3f10d60c214@gmail.com>
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
In-Reply-To: <910ed097-10d8-41a2-9035-a3f10d60c214@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782385470-7F73125E-A067C807/0/0
X-purgate-type: clean
X-purgate-size: 832
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C425E6C4F4D

On 25.06.2026 12:50, Oleksii Kurochko wrote:
> On 6/17/26 3:26 PM, Jan Beulich wrote:
>>> +#define shared_info(d, field) \
>>> +    (*(typeof(__shared_info(d, (d)->shared_info, field)) *)shared_info_absent())
>> How about the simpler
>>
>> extern struct shared_info *shared_info_absent;
>> #define shared_info(d, field) (shared_info_absent->field)
>>
>> ?
> 
> This could lead to compilation error:
> 
> common/domain.c: In function 'vcpu_info_reset':
> common/domain.c:316:20: error: unused variable 'd' [-Werror=unused-variable]
>    316 |     struct domain *d = v->domain;
>        |                    ^
> cc1: all warnings being treated as errors

#define shared_info(d, field) ((void)(d), shared_info_absent->field)

Which it should have been anyway, to make sure the first argument is evaluated.

Jan

