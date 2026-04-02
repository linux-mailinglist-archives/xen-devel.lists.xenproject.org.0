Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGkxO/mEzmm4oAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 17:02:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDA938AF0A
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 17:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272082.1559980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8JYZ-0004h9-1K; Thu, 02 Apr 2026 15:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272082.1559980; Thu, 02 Apr 2026 15:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8JYY-0004ff-Uf; Thu, 02 Apr 2026 15:02:02 +0000
Received: by outflank-mailman (input) for mailman id 1272082;
 Thu, 02 Apr 2026 15:02:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w8JYX-0004fZ-Hm
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 15:02:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8JYW-008cgH-Qg
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 17:02:00 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce84e1-5cb7-0a2a0a5109dd-0a2a4509ae58-28
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 17:02:00 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce84e8-bf79-0a2a45090019-d155802fe5d1-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 17:02:00 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso9405135e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:02:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48885553118sm45398915e9.14.2026.04.02.08.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 08:01:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1775142120; x=1775746920; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f0yt+3efUoC6uHT4hidYZz5Gx0Xpp4Vc6nbKmpmd794=;
        b=BAcgBf39w+goaHBq05AAesTmaAkxn4Q/ppnHc+72BNB4uG07KF9tPfRVioA13MdM8w
         /PLfruFRVeoE9gNCpmNZInmPuT8TV347Vk2ehelECQvH/wcm5/4/xQWmPA40bfnHBHhG
         64798aKeXo1G1SULjz+EYiQ9tsGTHG0LNg1YVAFQyM9PiV2LtVZixoyXnMbiwG1pcsYS
         WINKp0GA2ZdoCQLmG2y/SbZTukGkDvHFVSnlcNhPNZP8DDJ3S2cIxVj1fZOOwskhkrX4
         BInSbrUW6zmuZLVSHoFl/kfbFsaP2/+lRb4dFri9Vk0rxPbu/Y4cGupvhMZFx7xme5Np
         SBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775142120; x=1775746920;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0yt+3efUoC6uHT4hidYZz5Gx0Xpp4Vc6nbKmpmd794=;
        b=sjzcrYvT4r5HRVkF1Oeha5g996BkVRZzt4ISRtcNYm72El+fyFZfHxd80GaVJCiH+D
         klKC1Bvap+YCx5KCuYt95umQQH/wTogndkYnSRxKuPwQhUpxEk6/+DvW1ndVewHajJm9
         a3mU3Bfe2+UVYpNAdSyvZn5C1V69QKYCFKSOuiW6I/ecwbMLO+19XZsQDctrtjJgYtwd
         L6Tp4Kqxu1/4lis2OiqmE3jWLJt9fcblSQJzzUDobnxKEAYFVSj5/xfmBRsO2cSjNvkH
         t81/kNq+jdIjUd2izHdkKgJx57vZ2fpyhY1On41j9U5bgAS4JtvnWgwsSi9FdHWF0FqP
         Kz8w==
X-Forwarded-Encrypted: i=1; AJvYcCUyWge/KnGzGWojLOc9mgmsUwL1hNK4oau0d9wFmspn8pPWFUeMXBLpyjaQkbb752liQmyKq5v5xgA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybFUptLk7oI+ls2f7+qSUm5pMf8FqKERht4FHiA6D0u3ZSxEQi
	wQTu9GV+qMUbYUWFc1kiF595hnL2KYKswp93uvCn9EAMf5ULE/R4H+ThScDe5jUXdg==
X-Gm-Gg: ATEYQzz0i/8dVR0FhzyaRu802M/GXU/cDwUTeMTPSd5YixcpH4p8bU96ledU3IKx34S
	KpgLoKRgeSsiK+Sd1iDIiPgbI/sCkhkLX9j4fS4kbKDqHbddsc3eZpzxg+kkbG0vB/6yAnUcqnp
	rRymsXF5IjxY0+BuP6CqJOhW2PzWqdYaOJrMhD2a3zY2FwoxgNg/HCdvKP7AozcZWO0db0LXh/3
	6k3Zt26JLFZHahwJQEIWNrbrIz8Y5+eBrJEVMrXeCKkVYj1Cchgq55NBupohefv5ZeIoczBKxnk
	qq6mWf4Uyfllo4IYyH+6kX/3f+ZH4hfAaqjIZ6AJ2M5Sni70D2trKOCwI4XBhIJwE5R7RcdV4TD
	ESSEtRMMlnQujfEvzSbIFON30y8hupv8hr6wDMCADxVeVJ+3d6Ld4nlYE2ZAfD2wf8Jmvdn9CF2
	uS7V3FD8BJal0Ab9ksyp7xJAvLwONZ9JgLdIyXsV9T4e2B7hzb2NlZSsQDJDM3/VVXqnvlJ2TOd
	cugquP7xTIOOW8=
X-Received: by 2002:a05:600c:4f91:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-488835b7582mr128852825e9.26.1775142119827;
        Thu, 02 Apr 2026 08:01:59 -0700 (PDT)
Message-ID: <1061368b-c13e-4967-83fe-c8ff911050bd@suse.com>
Date: Thu, 2 Apr 2026 17:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 23/27] xen/riscv: call do_initcalls() in start_xen()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <e039f2a351bca2f37bb40655b5bf2eb41ab40c9b.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e039f2a351bca2f37bb40655b5bf2eb41ab40c9b.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1775142120-57742152-1022F23C/10/73395122804
X-purgate-type: spam
X-purgate-size: 411
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
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
X-Rspamd-Queue-Id: 3EDA938AF0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> Execute initcall function. Additionally, before do_initcalls() call
> scheduler_init() which is needed because of cpupool_create_pool()
> is called by do_initcalls(); otherwise BUG_ON(IS_ERR(pool)) will occur
> in inside cpupool_create_pool().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


