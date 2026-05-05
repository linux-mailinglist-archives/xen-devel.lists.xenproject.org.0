Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNgIOeKy+Wld/AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 11:05:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557334C91CA
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 11:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300384.1574921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKBiZ-00006V-Mk; Tue, 05 May 2026 09:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300384.1574921; Tue, 05 May 2026 09:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKBiZ-0008Vz-Jl; Tue, 05 May 2026 09:05:27 +0000
Received: by outflank-mailman (input) for mailman id 1300384;
 Tue, 05 May 2026 09:05:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKBiY-0008Vt-WC
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 09:05:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKBiW-005GRI-M1
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 11:05:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9b2d4-bab6-0a2a0a5309dd-0a2a4502dace-0
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 11:05:24 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9b2d3-af86-0a2a45020019-d1558035e024-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 11:05:24 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so79238275e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 02:05:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a820c8556sm378553705e9.4.2026.05.05.02.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 02:05:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1777971923; x=1778576723; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bJxNjvN6LpH1cYninMNyGJU1LRrWL7z2/RVNF62y98c=;
        b=WVee4XNdxLAxnOt7Y0w8RCN2uKSREtDaubcXBVxxyQ2OO1Z/EFsMyj1TaFmidycDaB
         OUobM5D8Q+2vs7hIvVaSo5PhdsZnuVHtsf7r5/mm8OPWq3gz+eSEplye47wVdRWCdoG9
         LODVUW9PS8BcWaTKbS9GeQRAhv9XZGZw63LR10cl+bzZ7MftrPzS0BLGItPli29Pe0ty
         9y4TFzk3LPIy3WtFOpCUSeEFQL4IQx2lTcvwcNbPFAPrtkEyngMu4jPBbKaR5hB7HMal
         xhMZpVBu+lIArcJWgb7WYTPzgNiNKtEKfXGiT3FZ2xoXOPzaqDihvwX5IIiBhaerbNB6
         04rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971923; x=1778576723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJxNjvN6LpH1cYninMNyGJU1LRrWL7z2/RVNF62y98c=;
        b=sUdQpMtu3+691T/0Ez3QrAsmSyKmvwbRhbXmS52QKbMVXaFik28/nixZnoizQ6YaEh
         VXMS0PGagUqfRp7tI/t+UNNaWbz8/k0wTWjNsU77i5QwneZIakm4Fyo1PweHUqpa0Veo
         FQ2munPjdzaTOZqzuo6HdCYN6lzyi+/itYFPeX+EXDTRAV/0TlZYKDWAxLo30yJtgz+D
         8v4noOeqDv87J73qnUk3d2oo+2NEZZZ6C3RfdadTkiCEw627W2E1rGAByc5+XLBD6rz6
         rMgd6I9IYNgMaDqFEC4QiJfDYldSF+zm62aq09pAnBuILrIcgjkTY4F/vloSwCABBXPB
         1wdg==
X-Gm-Message-State: AOJu0Yx72Oj2zRHLhEiCUSPHa/EzZmL8p+0Ujc625ekwD8dqvdrFehw2
	5RaZcnUsHsjZt0KV0ck1Y3b2+fUCOaTrH8kTkjWx/Eno/6i73sZBk7rd9mWAPRspmQ==
X-Gm-Gg: AeBDiesam1EHLrtyhANFi6kxMu0wvbVj3JUu9LQ7SdTfOxCBmNMd6VtXTO1ND4jU2wa
	6rOExWq1twpm06I74auTyUxMbE0v4ylexA9LhS0UUKT0B1elOrL2nd7t3AO9npB3nqFcUzzK0eD
	iTGu3eB8aDTC2cHZ1F7aY3qZ9CSM4hFFCvLvU06AI7+YQoVRglp7nzyd6ucfFELO5NkZZ2Rr2HO
	H+j9VZ6ynpVPvqj1EVyyvsAeoT+jjlAzStj96IQjXlNtaJh7iAqR+jdhE8XvPoYrV20zOmbh2/L
	t7wf1xdaXBCbC0FHANRMPw/wah/IyEQ2OiRECoDwtJTxYkYdce1CmYmIaXWbDAcay6Kccp1e0Sq
	3j962c1s4PczNbEX2/ZzazGc1A4AByNOvaZ6PIi3xxLPpiKe4lGfj+ecO3QWUfABuwu3YL8ebEh
	Mbg/a+/7Z9QC5BqhUzhcaIz5lYJ8fjf0QV2iPbSgQeAiaJ+e8WXC7EJFraoTfqReerEj7HgN+sv
	r0dscA4uOkcKVSbQi4t29IEaw==
X-Received: by 2002:a05:600c:444c:b0:489:1fa4:50c6 with SMTP id 5b1f17b1804b1-48a986691ebmr216651375e9.20.1777971923451;
        Tue, 05 May 2026 02:05:23 -0700 (PDT)
Message-ID: <32eddac5-73c7-46c4-8944-99cfe970c803@suse.com>
Date: Tue, 5 May 2026 11:05:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] xen: arm: fix len type for guest copy functions
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <e29e6176063f8e7c612a4bfa44ac072d7a686b81.1777303844.git.oleksii.kurochko@gmail.com>
 <53BD54C0-E493-4D04-9CB1-D16B148CA3A9@arm.com>
 <edfb6bc3-ad1a-4185-9966-29bb126a6b3f@suse.com>
 <F9DB9C27-810C-41DB-95DD-D00772CE4385@arm.com>
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
In-Reply-To: <F9DB9C27-810C-41DB-95DD-D00772CE4385@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1777971924-890CF161-5E0D81A8/0/0
X-purgate-type: clean
X-purgate-size: 1169
X-Rspamd-Queue-Id: 557334C91CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,microchip.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 05.05.2026 10:27, Luca Fancellu wrote:
>> On 4 May 2026, at 06:30, Jan Beulich <jbeulich@suse.com> wrote:
>> On 29.04.2026 12:08, Luca Fancellu wrote:
>>>> @@ -136,7 +136,7 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
>>>> unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
>>>>                                              paddr_t gpa,
>>>>                                              void *buf,
>>>> -                                              unsigned int len)
>>>> +                                              unsigned long len)
>>>> {
>>>
>>> Now that we do this, potentially we could have truncation in the places where we store its return value
>>> inside an int:
>>
>> Those would suffer from truncation before and after this change, wouldn't they?
>> Just that where the truncation occurs does move. I.e. if necessary they would
>> want dealing with separately.
> 
> yes that’s true, truncation was already there in different places, do you want to deal with it separately so that
> we have a Fixes tag for it?

I already said I'd like that to be dealt with separately, didn't I?

Jan

