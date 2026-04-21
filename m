Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKCCD7VH52kF6QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:47:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB1B4390C5
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:47:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288757.1568991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF7gv-0006ZV-UK; Tue, 21 Apr 2026 09:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288757.1568991; Tue, 21 Apr 2026 09:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF7gv-0006Wa-R2; Tue, 21 Apr 2026 09:46:49 +0000
Received: by outflank-mailman (input) for mailman id 1288757;
 Tue, 21 Apr 2026 09:46:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wF7gu-0006WU-2j
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:46:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF7gt-00Dyrb-Bh
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 11:46:47 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e7477c-2eae-0a2a0a5409dd-0a2a450b9942-14
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:46:47 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e74787-212f-0a2a450b0019-d155802ec9f9-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:46:47 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so27975355e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 02:46:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a55b8baaesm58192255e9.10.2026.04.21.02.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 02:46:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1776764807; x=1777369607; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0a6vPHl8CPBNy1g2ZDOGx0HgWgSH8nsG52SKaOdTYxk=;
        b=Q2N3tLkWEHKPW+HtlTa08UMrLXqvlEhGov7maFOV57owUQ5C90RLRNq1dy5l1v3U6P
         8Nc2XyYtveb5lEhhDJwvt3vSxoUn/uFhXmlX4Xezjxu3s2cmXf2bPSgAY5SVsqneVT52
         b1wZLaUFqKbSsZPVNP36m59EiL5tOQyXiG5Lmn5YV0Rrl4h+NVaimgCgg3bL2bVhdr03
         aQT3g/fuM+eiH82jR5cxQVKkxuF3/BNMrsbP5rBOxDQxzhZrg8I6eCnBharMyOVsF2o/
         HKi6JE01IXD71yMrDo/YFcRVY3rBQWXALLvcJ58d4o9dgSzRV/b2nxmMetUxGvUSzI2p
         C0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764807; x=1777369607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a6vPHl8CPBNy1g2ZDOGx0HgWgSH8nsG52SKaOdTYxk=;
        b=JXoh78JH+HUQn1pKTWELejCFGlvYJnCGx648RpOQnJFYt7cfh1og6hVZ0jlYAB+mAl
         30BJO50XVXAjeoxxggFw+KSnO9/Ujs/404YQU2+8ZWKag19KE2en52eoh+E8Tp7mnCJ0
         +HeShsRjeACO5XN8npI6CM0EIpTgQMzL2/etMVEzeQ+7GhRvtpOkM4lyHwiOBSHYEBCY
         gNSHJRX5wUAiO089ttTzg4nnGfvsc5ygvffWPyxlyZD3LIAyLnhb5EcuFxOHiRnAvfcS
         yRCBb+YFJwUXf9uqPlv/hzDzG/yJ1yUBNoanAfZmxtMOw6SJpt6eBQMvvLnB9OVOmjMx
         Rvpg==
X-Forwarded-Encrypted: i=1; AFNElJ8SsphOtL1XiRcsCo3+3hwNKv4DzlX+FU742miiNC+7+puN8wuDTEtSoeSC/em+SyVQWKGrwTQEt4g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywi4/q7fTYbitTY+BRt29E+WXrtNyaDzyxIQ4EB+87WGptzjUDh
	12chvB1Yam+l7FOVkSbQcHMKfw4OCGnG8vb8sNzIHhtyrXzLh52njQGxUGy/9gr7IQ==
X-Gm-Gg: AeBDiet9YTvKBWigLgDIjDW/ac0NpfkJV5Uwm3xVuj0irSyn3UkZ8H3vVCzXidKhb2J
	jl8JjThtlfRusiMhQWT9RpeEduK987V5JgIfo+GL9nos2P+8L2mW24PHgJKB2TMdgWYYJxxwjWu
	cdkFHiZfJLy1eNSbzvw+yvHHMb2cIE67fZ3qOHzCeGFSgSo0zTAtuhd47IVbvphR1DtfcbQ70Cu
	HToeHECcyEZGxe0mDy7/jxpEGhrebsDe/bKcPq9gRKHEtLZecMujjsXkLkOR5iXD86K8Nybkw3a
	HsslYH1yUWulLMkbTkOOrD739qi19kUYqVI5kuI6rj6xL3NzBgI4058MaOtPwlRM19CnSe7gaE5
	metmGs0eaiusJEII72dMIv7mFTCeBrYFnnsFteyNWnL2kVAH9qbd72O/K9WrHPT0xYkWUS7EZ7z
	nkW0bWewzVOAIE3RHEU39F8Bw1vrBApiTXTWbpUa9DUWvFjsyB3Elk9mMe/t8p48nTceZQ9McO7
	YGUwSn21zuy3EfvS1054oGAG9E3vO2aEzlp
X-Received: by 2002:a05:600c:5295:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-488fb780463mr235112255e9.22.1776764806482;
        Tue, 21 Apr 2026 02:46:46 -0700 (PDT)
Message-ID: <14ae97df-cb9b-4b43-bb39-6b9395ad918b@suse.com>
Date: Tue, 21 Apr 2026 11:46:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] xen/riscv: introduce p2m_gpa_bits
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <87d8050f252fb76e241a40809763e60d9874e902.1775836193.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <87d8050f252fb76e241a40809763e60d9874e902.1775836193.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1776764807-24AB5F3B-6837FF82/10/73395122804
X-purgate-type: spam
X-purgate-size: 815
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9CB1B4390C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 17:54, Oleksii Kurochko wrote:
> common/device-tree/domain-build.c uses p2m_gpa_bits to determine the
> upper bound of the GPA space when searching for unused regions, so it
> must be defined when CONFIG_DOMAIN_BUILD_HELPERS=y.
> 
> The variable is initialised to PADDR_BITS and narrowed in p2m_init() to
> the GPA width of the selected G-stage mode, allowing an external entity
> (e.g. an IOMMU) to restrict it further if needed.
> 
> p2m_gpa_bits is a global rather than a per-domain value, which is
> acceptable for now because all domains are required to use the same
> G-stage MMU mode, as dom0less common code allocates it per all
> domains.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Pretty hesitantly:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

