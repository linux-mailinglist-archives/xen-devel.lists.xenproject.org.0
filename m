Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC6OBVGC12knPAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 12:41:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A973C93BB
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 12:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276983.1562282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAmow-0004MN-9O; Thu, 09 Apr 2026 10:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276983.1562282; Thu, 09 Apr 2026 10:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAmow-0004KT-6V; Thu, 09 Apr 2026 10:41:10 +0000
Received: by outflank-mailman (input) for mailman id 1276983;
 Thu, 09 Apr 2026 10:41:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAmou-0004KJ-Tm
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:41:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAmou-00DEVF-9j
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:41:08 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d78240-bab6-0a2a0a5309dd-0a2a450894b6-14
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 12:41:08 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d78244-fab6-0a2a45080019-d155802decb1-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 12:41:08 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488aa77a06eso11387845e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 03:41:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd10af88sm21062155e9.12.2026.04.09.03.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 03:41:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775731268; x=1776336068; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ckV6gYFdL3pMo3Xru0rBvCCoUsppWgl6pey6o2PkSQo=;
        b=cgGbje+eMagQLpCFRcUcsxwTLymlMezIuGsxTJKoNyAFrVvLMS1FPpqtOJlcAa2NDy
         z43tP5UQIQl0G4XMEJDVk0Y2YR/FlJen/IdCQPurpngyds5riUukPA83Dt73oJFos/Vc
         f4HEw/pSrwuxcDtk0FjZzvNeu6nBaLyH8EBWZJyi1DP8Q/Y0f7iMsf05AzqIBoZ7NskZ
         x6Zo4td0hcBqr/6iLItqb0fmRsR4hiBkNS2r3E8TdSdmBmBSusx37CwoV+iw7AzrOr30
         4hDV3o3ZB8IifZa1aWpLb6y6MYuH/uIouXu1NivWLqPp/jjJDVudmOT3CWrmoRii6UKa
         X1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775731268; x=1776336068;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckV6gYFdL3pMo3Xru0rBvCCoUsppWgl6pey6o2PkSQo=;
        b=qOQ4w73qufxorjm/ILIdH9EWodUfQnhb0j1oe9C3wktWgcf7vscb/4iq4Q5jAscuCL
         3SbEDZLMAlGZbO+N++pOrwyecDa3I1b9WBSjMH26sEMpyyEe0bpjWby8acTbNzTqNQc7
         z3imtRcec/mdHc0ihX6Txg2H2Tjos3bdIWyjSA3EGKXhWhigu/VHAupL1G74LI8BcgNY
         csOspTRTcjxQRpyZ2Dzuc/RGLZHN25kO4IY68mPNcgctNPVCstpVWtaGQz4RLdY6eOEw
         O/dx0XNwRlenu5/0XzZx2lqSRb72z0Q6Vtc8AX/vz5Sl9kPheR03cjBVDKoJnRLGkUe5
         YjGg==
X-Forwarded-Encrypted: i=1; AJvYcCXCkhbMyFImjzKz5pzv2d33VT43p/gQB51/kFWKCqaNZS4viOM2OEVm4G8/yKtJeitcuYMW86XJT/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLJfASsWf+2HU412Jn/V0Z7Mj4wMEL65esjsqxuZ50TaFmfL6d
	a9P536DTKr6uDUrumOt5ONdoZIzPyya7RYQhC3HwCMIpeDkuqOn9zwg9M5Thyd1vtg==
X-Gm-Gg: AeBDieuHnKrkE0+d1gOUcYMyEy8kgaysQf9UBFzuZ0smj/8rxCSMgPxGbVR99X7hBLb
	XfE3ujq2TGeBEOTWawJinJZ9lbq4mxrQd7qAZCo0pRPizd6WhOS6mhh9g69/O0+aMDvPNt3TfI2
	q83SxuhWJWBcAAgygtoUxJe9EZPyf17ZWLYe7b4AHJjJ8hBmDOgtO8Cu5xGBwlFEiPxvE5JMIL4
	X3EuI18tXk1MjszWMVfo8Uen5SfrpztJV9BXCJtidnuDmhIrFV5uccdO/NlrVqhNHdDaH8I/Ggf
	x+CHiHI7AxFAOFq0dcCDSL1lfvl+WBgdOzyjjiAE0NJ9lHXYSD+88rUR1MQJQ/o1Zh40vSsRrC6
	WfxW+bgvQakAsTujeZJyOpH7yAjOBxmAULSkxYm1voIgB5ml42IGQvN361TKj00iXz5Dm/FNF0T
	7NweMk4uWQFoqgs+/o0KPDKE0EtuL88JCYmagZQbhRUynu6XVCl+jlQCbG5VZHpp/54NVmvoCVI
	SBbtwfLhSZfyhI=
X-Received: by 2002:a05:600c:83cd:b0:488:bd79:94d8 with SMTP id 5b1f17b1804b1-488bd7997demr159888045e9.18.1775731267642;
        Thu, 09 Apr 2026 03:41:07 -0700 (PDT)
Message-ID: <54a4caa5-782a-477e-973a-503f716cac42@suse.com>
Date: Thu, 9 Apr 2026 12:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86: prefer shadow stack for producing call traces
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
 <4bcc73db-38da-446e-b277-cf94c49002a1@suse.com>
 <7ca7679f-c160-44c2-98ed-f1b1761255d4@citrix.com>
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
In-Reply-To: <7ca7679f-c160-44c2-98ed-f1b1761255d4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1775731268-F7547497-0AC19B19/0/0
X-purgate-type: clean
X-purgate-size: 1199
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 80A973C93BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.04.2026 19:53, Andrew Cooper wrote:
> On 08/04/2026 1:23 pm, Jan Beulich wrote:
>> Shadow stacks contain little more than return addresses, and they in
>> particular allow precise call traces also without FRAME_POINTER.
> 
> Do you have an example of what such a backtrace now looks like ?

(XEN) Xen call trace:
(XEN)    [<ffff82d04032d730>] R extable.c#search_one_extable+0x70/0x73
(XEN)    [<ffff82d04032d802>] C search_exception_table+0xc2/0x177
(XEN)    [<ffff82d040358378>] C traps.c#extable_fixup.isra.0+0x18/0x6c
(XEN)    [<ffff82d040358e3b>] C do_invalid_op+0xab/0x106
(XEN)    [<ffff82d040201d98>] C x86_64/entry.S#handle_exception_saved+0x88/0xf4
(XEN)    [<ffff82d07fffe044>] E ffff82d07fffe044
(XEN)    [<ffff82d040412db0>] C stub_selftest+0xd0/0x168
(XEN)    [<ffff82d0403508d6>] C setup.c#init_done+0x116/0x15a

Note how both the stub entry and stub_selftest() as its caller are
present here. The stub entry is missing when FRAME_POINTER=n (albeit
we could teach that code to recognize it), while the stub_selftest()
entry is missing when FRAME_POINTER=y (and we can't do anything about
this unless we wanted to add frame setup to stub generation).

Jan

