Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOSBGeQ/A2ro2AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 16:57:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3EF5231A0
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 16:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306878.1578606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoXz-0007f8-L8; Tue, 12 May 2026 14:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306878.1578606; Tue, 12 May 2026 14:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoXz-0007dh-IQ; Tue, 12 May 2026 14:57:23 +0000
Received: by outflank-mailman (input) for mailman id 1306878;
 Tue, 12 May 2026 14:57:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMoXx-0007da-Mv
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 14:57:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMoXv-008lpm-EY
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 16:57:21 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a033fc7-e002-0a2a0a5209dd-0a2a45018c90-12
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 16:57:20 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a033fd0-c1f2-0a2a45010019-d155dd29ed54-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 16:57:20 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-44b330c5cc6so4097357f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 07:57:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491304505sm33349503f8f.22.2026.05.12.07.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 07:57:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778597840; x=1779202640; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEFQ1R78NO62nghWNzHqK8JNPvDTRtf7it9+UXQQMTo=;
        b=bubVGWJCW8KwYNRim8rCnY762ut2N4NhV7F/l75ajJ+QFabWnq9EK51ckpZ5/JkCUz
         66XHShR8EgnzjkUbywrf0uNqhUz+c9J6rKLd01mL9/87WJas4eFhgyfCniRSzGMgnbn2
         NyCUMFq2Qx7Zua3o+sI8uOuOK+6kMSh1BWPe8uMvjJh7qd5eHOTnQ4vQRRdV0IVPiOJV
         26PF1QpuMaRLKNQLuxroMqdgbckJBrnaIT0s0sL5uw39BuKuVTK+d5QNVorHiygdJe2a
         rK8ufwboHofK2edINGE94UsiOmQe6Cp9LU5ltDfZKrQqd9QQH3pfi8B6iWgHDsMsbPTD
         496w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597840; x=1779202640;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEFQ1R78NO62nghWNzHqK8JNPvDTRtf7it9+UXQQMTo=;
        b=QPEjZtt9Gmv92JZR148W7fCKrCF4/UWj07VFqvGSmJnhFx6k/54XfmNkr7LG4QKxrJ
         gyz/b+Rg8SHPNAWpeVOu0TxPxY5UHRE6uLIEWZM7CnXdHiXFnT3GVbn21XtBJm/zvdAH
         bDAWwObKYuTV/ebXgt4DCBfthg58ZfMIntntygak5QR0GNi3c6lh5t6MndIu9JYCeqj+
         A/HzdfEJYbfGoj/ecDN0JtUdXg9C5qtTHMlGZeVU7mRuIS6ye/2M7QDs0rcRAnOwtouR
         n5vXP1OYuC5hQQ4+XCAUC242FXfZWgwhESzlyHsBPAZAErsWf3LhP9/WyQITgce7vh0p
         ULlA==
X-Gm-Message-State: AOJu0YyKPEIvQbTQ6JxV00BoR3uZ84LNqZ4vsq3sFiGhTgAoWcdeu8t5
	zPVg+CeQQ2IIVOPu9StxKQumB+iE4lsDziUP2fGPTPH6Y5aSPelPsUxcLUk465YFWgK9sXjlvgD
	g/z0=
X-Gm-Gg: Acq92OHKOKO8AdjK2IKCOzTB4/zkiMICcMMDEtNYI+O98iXTK7kz2308y8xBgqNsXwq
	90iV7JWXXQ2JJYRABuJjcQJkBvkn+iscrmoZwpCSVF7mKL22LucWv9flTaSJRqTEmXk5bMr8q30
	AM93NylHZnyBPjF6mcKBZIMRLCSQn0z+Cmqu4VdnrDCtWvxMwCWhZQMIwIOEi3a+Bf9uuHvwzCJ
	exnWSPQNP8qTE0jRm5Bjn17ofd412m1v6VsKh0BX2ryHYInEenF33I1K3G4Qb+Qd+rGjzB3ICj4
	ZuRyMZ0aH09VQD/GgDChEgPMC0sWBcEOnXr3nJuZMRvfXw1RmLJG/XQqyzaJzJYL9TJpHAZRley
	rv5sN+mRX/8O6KfbXbNfilmSAf5nyYN8f910OnO45ncX0OcV+Y4X5BLN/cDCXMIQlsUWsWt0aWt
	TgK86UsJVjdv1wANF8eGIbNRt0sTTIKLh1yBBWuRUBVQXtlbTDeV6i8IPS8tG9PBGJI6uri1Cq7
	gHgffk5/WUL/e4=
X-Received: by 2002:a5d:5d08:0:b0:43f:ea25:c965 with SMTP id ffacd0b85a97d-4515d3dc1femr42835656f8f.32.1778597840367;
        Tue, 12 May 2026 07:57:20 -0700 (PDT)
Message-ID: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
Date: Tue, 12 May 2026 16:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] x86/time: CMOS RTC century byte
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1778597840-B534AFF4-ADE2EF33/0/0
X-purgate-type: clean
X-purgate-size: 499
X-Rspamd-Queue-Id: CD3EF5231A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

I'm surprised that we didn't consume this thus far, and that we got away with
also not emulating it for HVM guests.

The 1st and 3rd patches are imo candidates for 4.22, whereas the others (more
or less associated cleanup) likely aren't.

1: x86/time: use RTC century byte when available
2: x86/time: move BCD_TO_BIN() uses
3: x86/vRTC: support century field
4: x86/vRTC: use available macros for BCD <-> BIN conversion
5: tools/xen-hvmctx: shorten various format strings a little

Jan

