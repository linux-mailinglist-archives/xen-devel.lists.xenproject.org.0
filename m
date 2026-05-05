Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIh2G66H+Wmx9QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 08:01:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BC74C710E
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 08:01:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300198.1574731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wK8q3-0002Zn-1Y; Tue, 05 May 2026 06:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300198.1574731; Tue, 05 May 2026 06:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wK8q2-0002X0-Up; Tue, 05 May 2026 06:00:58 +0000
Received: by outflank-mailman (input) for mailman id 1300198;
 Tue, 05 May 2026 06:00:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wK8q1-0002Wu-AE
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 06:00:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wK8q0-000fJX-87
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 08:00:56 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f98791-2eae-0a2a0a5409dd-0a2a450cc36c-34
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 08:00:56 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f98797-62f1-0a2a450c0019-d155dd2cbc5e-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 08:00:55 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso2689486f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 23:00:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-450524833e1sm1893763f8f.2.2026.05.04.23.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 23:00:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1777960855; x=1778565655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xtUVewt/R03FxOqaGFMrHIUdEoTCyLXNODTxb3YDv3A=;
        b=aoAP2uv0VesnN92tZO1zZ5g/NeCgZX7awIJ8h3/Vv1OvZf32r9hLmx9B2TPZ4CjRoV
         7WLFP1/nOr4vd9v4kxsp5DFepYV9rznVk1du0Cw7m3ZLg98DcCtYrWQx8amJDpzzoQtq
         FXCk9WgjuSBqE9LYji/AAoRYrc3i96/V48iRtwJYbq3rSAUiYszo6ZolbDO4Obj0mliZ
         mHXC+e9W4LsqAjg09mgZOGX4wd4ctSHHCejpPCNQ8oN52kqRZIVMNWWUpQ3cncF5P4B5
         CIHIn5jDVs0nQWWK2mDn0TLmXXhSa3iq9p8+MFoK8oADO0Bb0iLO+mo2uz4cbpWJhuT1
         cd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777960855; x=1778565655;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtUVewt/R03FxOqaGFMrHIUdEoTCyLXNODTxb3YDv3A=;
        b=NGonEGXnHcsTIxYAYZDb+5YbYAmoqiCfHUdEzq75tGp1je/AwC7imPMydOGKIHvqVr
         8nuo/tS+nfVnvK6dTeirI0XwUxew/MQpeKvvL/YaxWT9WleScK1dsb7kjESo3EkuJJFl
         nSatkGa9jJ7G6ixKf5DDSsOm2umZm+KMYk6YXPoa02EhQmKb4iOLfiYSSC9US/ZTzU0n
         pySwNE3mc8nFnmxyYojzss5B5HCJ9nt113eOIxZXLi7IyL5hjlB/WTG84vQtMNX0QYyu
         /xCijrG4cvVJECv0XcpJpUY5eSzheCRqt7Q7Xo9HBE/jWnsClXvkh5/mUIiH+laaWFJK
         DD+w==
X-Gm-Message-State: AOJu0YwPsb1DPioWC0ykesf4nzyUHMHFxS9HO7ho7pg6XaK+lNMfSHJe
	/QIpLegkyNuB5XbVQksfUeK3FWVNmgSa5DiiR0hdjpfUtiwMdhj7xPeIOUtJsk0ooEJAWyEM2cD
	G1f0=
X-Gm-Gg: AeBDievlh3Af5zOaTd3fRChJuQjvkf25BOziVVxoJI1RGPTa7uZKhfxn2TypLP7tIbB
	CFrWjyDTTM7v6kraph2C6jGG6bNaUjNDBkszVH6wETLHzAeSpqunq966JYVAKYD9BcAO2PWbvgL
	qcLvYfF1R0QW6Z+RPWlqCEx8kegiJVO4nq73dzyIdEbjad/d0A8oa76MIHErTKcbGJHFt7yxPaE
	2INaN7AbzyCul/fDBRYAqmSb2GWo3AyPvX/K7HstM0LuZCNs4YONZOA3IMj/SXFehjnxsaFDjT1
	p/bYXXXJSknbbdeYnTtBgfllOxQts6/f5b0Iq0AMxsitX7blcOuihR0HQuApTRAtk3LpAQIfyP3
	Z3dkwhDYBwtItdw+2zeIP7i90E93RYq3s4q1At7TVusGjyjqjxrRCGejbcdE0Zfsf8XWclrS1VP
	65G6WhbU/8FXTeZjo2Y8ecJtRPSpVYO4K45enDqNv0spZySzaTU+b/dSZ1w+/Iqnurqo/EIyKle
	PlSSvEcAaclsfQVaueFrLtDUg==
X-Received: by 2002:a05:6000:3110:b0:43d:1c4a:37c with SMTP id ffacd0b85a97d-44bb2e2eefamr21513703f8f.4.1777960855102;
        Mon, 04 May 2026 23:00:55 -0700 (PDT)
Message-ID: <d8d50b12-40c8-4103-a852-d7cc50aa4910@suse.com>
Date: Tue, 5 May 2026 08:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Always sync guest CR2 on VMExit
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260501213826.1291860-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2605011443580.512397@ubuntu-linux-20-04-desktop>
 <981a0dad-dcbb-42c8-a840-6f228eb89be1@citrix.com>
 <53c4fb20-8cb9-440a-b37a-d829ec940e1b@suse.com>
 <e1166c38-114f-4d37-bbd9-b4e1a534aaa5@citrix.com>
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
In-Reply-To: <e1166c38-114f-4d37-bbd9-b4e1a534aaa5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1777960855-F5204CF5-BA79FEE4/0/0
X-purgate-type: clean
X-purgate-size: 2233
X-Rspamd-Queue-Id: C9BC74C710E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 04.05.2026 18:24, Andrew Cooper wrote:
> On 04/05/2026 6:14 am, Jan Beulich wrote:
>> On 02.05.2026 00:21, Andrew Cooper wrote:
>>> On 01/05/2026 10:44 pm, Stefano Stabellini wrote:
>>>> On Fri, 1 May 2026, Andrew Cooper wrote:
>>>>> Under SVM, there are two copies of guest CR2.  One is v->arch.hvm.guest_cr[2]
>>>>> and one is in the VMCB.
>>>>>
>>>>> Xen doesn't intercept CR2 accesses, so this mostly goes unnoticed; hardware
>>>>> loads and saves the guest CR2 across VMRUN/VMExit.
>>>>>
>>>>> For HAP guests (where #PF is not intercepted, and therefore we don't typically
>>>>> inject #PF either), this causes the guest CR2 value to be lost on migrate.  As
>>>>> migration is cooperative and not done from the #PF handler, this also goes
>>>>> unoticed by guests.
>>>>>
>>>>> It also means that an emulated MOV-from-CR2 reads a stale value.
>>>>>
>>>>> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Thanks, sadly I made the mistake of extending my XTF PoC for this.
>>>
>>> There are also bugs on the emulated MOV-to-CR2 side, and they're far
>>> harder to untangle.
>> Any slightly closer details as to what?
> 
> hvmemul_write_cr() updates guest_cr[2] but doesn't sync it into the
> VMCB.  This doesn't show up on Intel because CR2 is switched explicitly
> in RAX across VMEntry/exit.
> 
> But, it's not the only problem path.
> 
> svm_vmexit_do_cr_access() is the fasthpath exit for CR intercepts when
> decode assists are available.  hvm_mov_to_cr() and hvm_mov_from_cr() are
> asymmetric in their handling of CR2.  mov_from will read from
> guest_cr[2] but mov_to will domain crash.
> 
> However, case 2 ought to be unreachable in hvm_mov_from_cr() because of
> how we program the intercepts, yet the QEMU bug which caused this to get
> noticed will trigger an ASSERT() if I were to put one in.
> 
> So, do I fix up both to account for the fact we know QEMU is buggy with
> intercepts?

I think that's going to be (about) the best we can do.

Jan

