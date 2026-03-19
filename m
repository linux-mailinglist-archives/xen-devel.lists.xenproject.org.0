Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCq3Dva7u2mtmwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:03:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DB22C84E5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:03:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256793.1551274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39H2-00035D-ID; Thu, 19 Mar 2026 09:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256793.1551274; Thu, 19 Mar 2026 09:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39H2-000336-En; Thu, 19 Mar 2026 09:02:36 +0000
Received: by outflank-mailman (input) for mailman id 1256793;
 Thu, 19 Mar 2026 09:02:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w39H1-000330-Dh
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 09:02:35 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dae0435-2372-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 10:02:33 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4852e09e23dso5170535e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 02:02:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f4bc96c6sm64498975e9.5.2026.03.19.02.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 02:02:31 -0700 (PDT)
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
X-Inumbo-ID: 5dae0435-2372-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773910952; x=1774515752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9DgtjIUdC3TKFqCbrlVPmz/AAoUU2Q5d0HjDWi74ZQU=;
        b=IJyn/Xd4DHMhuw0+uf0jMRqwK3S8juNTbXEGNmRlFdEYDle4/FmwchKS0NexszKLr2
         Uhg/IfbJkJnndgqDBwsP382YZeM1VFm7Gww10aUA15+bWLJMQ2LmU1nqVYPdgBCRdK/E
         PKdB6Vp+6wHhPXsrGXUG9pZuqzjSlFbLqcKTJf/GsPpUysIR4hdyL2Ql7fewAlwORoLS
         uXeUIrK73fXCse4fhj4qGS9bFfhcFyONltcWUAXN2Qy20dBwuViDzGgfPqsL/qCp2FJ7
         KslSvcT+TtahhOS4NVmnmVnfrmF9NU5xX6uPN2O5a4mg2irHBFdTEkEe1BnX7CRo9B0b
         33Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910952; x=1774515752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DgtjIUdC3TKFqCbrlVPmz/AAoUU2Q5d0HjDWi74ZQU=;
        b=PEltxVejZ1wf7/rRTFZCYJLTTenLX00P1H7dxloNRyp/d2cNN/oS6Ps7fV+p/7eE1b
         4FzxURO5IElxAdV8jabDSkqPxtoCe9UzWQw16DitR5/J33PWes1xivM2pz6bMqvvWdKH
         ScbT66KaQoH5YIwtxAies2ceMqeHzpwQJISR444BC84FJ4J9ROdV/NNJdG1a0aBZz3wH
         vC70Kzk4ooMFdzzMeIj68qxMgvURkuDGC7b2NGJut8popmPBquOs4ckTGFppddHI2Onq
         VFvOX1lXec3ofAjKpSyzeXF9/f+paDySP2heFV16P1XoLJMkIixGky1TUVd0BmOmKhrI
         3ZlA==
X-Forwarded-Encrypted: i=1; AJvYcCUTKppcCM77ZCv8bgKhSxswZz3JMC9G6VpkGtTb3uXTqnog9r9PDvPpFaTmgKRkt/h4qGqfBBA6LSE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyODtPU3jApHB1IVkfoGLD2wfguavnLkiDqyJqHhUD60OvKr6+r
	/kgq6snPpqSRq0j0AQrjaBJPIHG34JsM7NPM2aX0PXR5q1HGZai3sEWCcMtUbRm1XQ==
X-Gm-Gg: ATEYQzy2FEwDB5hZecvrQtVea2p56nIE1X0FCRMl1TSI7NPQvriB4yGKlDFtE+zSx/J
	hdZzF+cNPJTXKPAfr6ut5PO36N5RUG/Yucalg+c9VEh1fVy4yUlw0cLSJI7RkbTwtpHfGjzwljr
	HjEFNneyfiPi5BAWlwHYMdUnVOO1iDGHDbIzWI/pQwRdL9lmTtVJD8QQ/QyNWyNBZErvqhyO82b
	1q49TkP6ccho4Zi10xEoAuZQMnE1TyCm3d1o3aWVbQ2aOcadST47oa90Tb/hKwL+i8vZra0RJVn
	ZnwFwK+ToiWdjfPkZYMEFmSebVEF6xrs6vTeMoX57QLy0u/Z1Ms/MF3RdVyTYuchIdAm67bI+B5
	KS8Sm44PIYlXybzkS6sZLm96SEPs1pjVadVWsKYQp84SSIUPbIxnS9ZLIBMa+xSfPlj8LdwvsEU
	PsDtDWkx34r+ZuIHHQQtpZfTqrhYPtFZlGQZgjLd4CyI44dxFFIkkjOH9Kx8k6GWtvxjwoeoR9H
	yaepYsVfjgmi0YKl4ymvUe/DQ==
X-Received: by 2002:a05:600c:8b0a:b0:485:3193:6ddb with SMTP id 5b1f17b1804b1-486f442207amr101268065e9.3.1773910952250;
        Thu, 19 Mar 2026 02:02:32 -0700 (PDT)
Message-ID: <325ee99b-f2a9-4eb1-8982-be25075f5ea4@suse.com>
Date: Thu, 19 Mar 2026 10:02:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] x86/hvm: Support extended destination IDs in
 virtual MSI and IO-APIC
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20260309123055.880050-1-julian.vetter@vates.tech>
 <20260309123055.880050-3-julian.vetter@vates.tech>
 <1e371e65-ca79-42a0-93f9-804f73084033@suse.com>
 <9f40fbec-008f-4a50-bfb2-27c35d88f2a2@suse.com>
 <635f1e21-f1e0-451a-9374-c91b33784894@vates.tech>
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
In-Reply-To: <635f1e21-f1e0-451a-9374-c91b33784894@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 29DB22C84E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.03.2026 16:06, Julian Vetter wrote:
> On 3/12/26 12:15 PM, Jan Beulich wrote:
>> On 11.03.2026 16:27, Jan Beulich wrote:
>>> On 09.03.2026 13:31, Julian Vetter wrote:
>>>> @@ -618,6 +620,21 @@ static int cf_check ioapic_check(const struct domain *d, hvm_domain_context_t *h
>>>>                e->fields.reserved[0] || e->fields.reserved[1] ||
>>>>                e->fields.reserved[2] || e->fields.reserved2 )
>>>>               return -EINVAL;
>>>> +
>>>> +        /*
>>>> +         * An RTE in the saved state has ext_dest_id bits set. Check that
>>>> +         * the destination Xen has extended destination ID support enabled,
>>>> +         * otherwise interrupt routing to APIC IDs > 255 would be broken
>>>> +         * after restore.
>>>> +         */
>>>> +        if ( e->fields.ext_dest_id && !d->arch.hvm.ext_dest_id_enabled )
> 
> Thank you for your feedback Jan! Yes, right the 'ext_dest_id_enabled' 
> must be defined before it can be checked. I have rearranged this in my 
> patch set.
> 
>>>
>>> This won't build, as the ext_dest_id_enabled field appears only in patch 6.
>>> But yes, that looks to be the opt-in mechanism I mentioned above.
>>
>> Actually no, how could it be. That's for the DM to invoke.
> 
> But this comment here I'm not sure I fully understand. You mean that 
> checking 'if ( e->fields.ext_dest_id && !d->arch.hvm.ext_dest_id_enabled 
> )' is not enough? This check only verifies that if the target domain 
> doesn't support ext_dest_id_enabled, no RTE in the source domain is 
> allowed to have a ext_dest_id set. But now we also have to check that if 
> the source domain has ext_dest_id_enabled, the target also have to 
> announce it, right? So,
> 
> if ( s->ext_dest_id_enabled && !d->arch.hvm.ext_dest_id_enabled )
> {
>      //ERROR
> }
> 
> Is this what you meant?

No. What I tried to convey is that besides Xen <-> DM negotiation, there
also needs to be Xen <-> DomU negotiation. While they shouldn't, existing
domains can write non-zero values, and the behavior of such domains
shouldn't change with your extension.

Jan

