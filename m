Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOSLDktR52lW6QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:28:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A44439837
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288820.1569060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8L1-00084e-7S; Tue, 21 Apr 2026 10:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288820.1569060; Tue, 21 Apr 2026 10:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8L1-00082f-4p; Tue, 21 Apr 2026 10:28:15 +0000
Received: by outflank-mailman (input) for mailman id 1288820;
 Tue, 21 Apr 2026 10:28:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wF8Kz-00082Y-PZ
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:28:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF8Kz-00GeKC-6P
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 12:28:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e7512e-2eae-0a2a0a5409dd-0a2a45079470-24
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:28:13 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e7513d-229c-0a2a45070019-d1558035e87b-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:28:13 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so30984845e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 03:28:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1cfbf2sm371587475e9.15.2026.04.21.03.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 03:28:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1776767292; x=1777372092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+yA9uuPRTggtI3vfSlk1mEZeJ+vSAsakm0Eo+IC9+wQ=;
        b=VacsBTftq0GUVCWr0Ubr8j3zy5iKeZ8yVc3kQMKZvU5hFJuK1SkLgFcJpm3cLQdUgx
         hmGpMn3L6Q5Qkg0getKOOUvfQStj46Qaik+I97iL/O7CIGhYzAaqYdD1ndK6ukd88eea
         Lw5UVhkvWMabfxLldU8gErrifrtbprZC3yf0McozObJrFB3YPZJ8zIGKc+dHoyTNqCqf
         wukPAOeIKgBG6YiTdHFklOnHM1Nlo6YGuZh0FazcVjVN7xtfkoUsgCCZPbR4dYOxB6sO
         t6og1B2/OYpFQlig855NxokFGLAfR+WCoIe23ULhKa6aEalkx35oWgfVmpItht51+OY7
         XeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776767292; x=1777372092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yA9uuPRTggtI3vfSlk1mEZeJ+vSAsakm0Eo+IC9+wQ=;
        b=FMtTN2Y3tGXNFP3vji+/c43Zaz6ER7v2WsvHWMnoazn76Wb/EJPj5a5wjp5kpYKdyM
         ZxBlEfL4F9djlVJnD+fLUuGbLxFLLHDChMvNBFvHSUgI8pIoex/9g3FAUaSstRjoR8vV
         f29cOC1XZ4tvMnUrocEFVkOpxilQqfbrqOXJRKAst/Qo/AFA8TYYreEYpgNMASLL8H2r
         1J+KWQXx7oprP5Q6Jmog5j2ok4gW+1y+F6QaMY8yJawfIphgLG4I7He7ObUT6hwB4NFB
         QPvD+uq+9U5KcrKHZCYOO3jzM9IJGxqs4N9A3zAO/ihM2Iej/rh36aMrvcectXfLrg7N
         IL+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+M0+03df5jmznIWdu+hh40dtXjo8qtfrProv81My9ChK9weGHf798Y11ub+mgoVbzfvR3ue/r1ovM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDyYw19IYIOUYFVkWQFEZsfBngWPdwPJwO8pEVKjy3gRbQhX/g
	nkm36CCAFBynpL6kdqMseSxq499jxgC31sIX8QT6D2OhXsr6bmUlqstNTL72t8ZRmA==
X-Gm-Gg: AeBDieu+SISZ7c6bik4ft2u2IKMmg8DJY+9vSagaBrO2404djS4K8cdFp9E5yvZYJGz
	8rfy1xCFxUhL+Pel4GBU8JQZmPxM7bjaO2HT3skmFUKnN0M5ymwAYxY6BRbpt3YMyNIk/sBuv+K
	e/knb6Seys2vJJ7XG4/caZlRNpo1i34lfyOyk8CQuWAux14zVV7vRlYQapZymddp6Jj7id/LRnb
	uDgXmiRxYouXgTAFG4/SXKFhBY54VoJNdMQUEjegaWPujHWKpMVeyXNze5zCjio5GWsDhoeQK07
	8R9rMkrw9J68hxwEhLJE8zk+6PYzVz4m/1lL9993pKck2CZ+Mq2qK1UTsM4fgF6DHCvMAATSJ6v
	MSyZzFfRn8cTpAIDszhFvl0rA2lwv8tT8RWOP3D1aCStHXowl7Op+IAdoNpHQ4v8b1G4O1Omtql
	Ks1dGysegr5OxasGnO0SD56M9nJm2k80mNSw6FM8WFNfzK12O/0YzD8CIX0H2iT0R4NGHBlPUwt
	IswT1PaGBqRjjNQ4ISuE4Z7726tSjlzq7uE
X-Received: by 2002:a05:600c:3e1a:b0:489:1ca2:eafd with SMTP id 5b1f17b1804b1-4891ca2ee65mr112590685e9.11.1776767292001;
        Tue, 21 Apr 2026 03:28:12 -0700 (PDT)
Message-ID: <a7143b08-5355-42cf-b9c9-fcc8781708ed@suse.com>
Date: Tue, 21 Apr 2026 12:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/riscv: allow Xen to use SSTC while hiding it from
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <2d5892447d6b6ad72962b8bbcb7c4d865b9e9989.1776765651.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2d5892447d6b6ad72962b8bbcb7c4d865b9e9989.1776765651.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1776767293-1505AC48-4914A7CB/10/73395122804
X-purgate-type: spam
X-purgate-size: 1592
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
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
X-Rspamd-Queue-Id: 73A44439837
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.04.2026 12:18, Oleksii Kurochko wrote:
> OpenSBI currently does not advertise the SSTC extension via the device
> tree, so if SSTC support is detected by Xen the riscv_isa bitmap is updated
> manually. Furthermore, removing the "sstc" string from riscv,isa is not
> a reliable way to disable SSTC, because OpenSBI probes support by
> attempting to access CSR_STIMECMP.
> 
> Introduce a runtime probe in Xen to determine whether SSTC is available.
> The probe attempts to read CSR_STIMECMP using csr_read_safe(). If the
> access succeeds, SSTC is considered available; if a trap occurs, it is
> treated as unsupported.
> 
> When SSTC is detected, Xen may use it internally to program timers.
> However, the extension is not exposed to guests because the required
> context switch handling for the SSTC CSRs is not yet implemented.
> 
> Note: clearing RISCV_ISA_EXT_sstc from the DTS riscv,isa property is
> deferred to a follow-up patch. Also, the corresponding HENVCFG bit is
> not set so guests fall back to the SBI timer interface. Timer requests
> are then handled by Xen via the usual SBI interception path.
> 
> Introduce set_xen_timer() to abstract how the timer is programmed,
> either via the SSTC extension or an SBI call.
> 
> Drop sbi_set_timer() as it is more than enough to have only introduced
> set_xen_timer().
> 
> Drop "SBI v0.2 TIME extension detected" message to avoid confusion
> which set timer function is really used.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


