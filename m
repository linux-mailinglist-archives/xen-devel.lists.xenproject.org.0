Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLKXMO5J5mnSuAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:44:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E26B42E85B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286294.1567391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqne-0001In-B1; Mon, 20 Apr 2026 15:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286294.1567391; Mon, 20 Apr 2026 15:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqne-0001GD-7p; Mon, 20 Apr 2026 15:44:38 +0000
Received: by outflank-mailman (input) for mailman id 1286294;
 Mon, 20 Apr 2026 15:44:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEqnc-0001G0-6v
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:44:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEqnb-004NqN-Jn
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:44:35 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e649e3-2eae-0a2a0a5409dd-0a2a4502c78e-2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:44:35 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e649e3-af86-0a2a45020019-d1558032a8eb-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:44:35 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so10042645e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 08:44:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb75ab25sm93713115e9.11.2026.04.20.08.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 08:44:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1776699875; x=1777304675; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/leg5zPIHXcYJT9pnVBCSrFES28ADZ8CQyyvDb61MzA=;
        b=HaUTGeNzkIMyzTu4M0dOH6mR99k+QVvh3AiOGZ4pc4CmIUZEakz8ABLxbiRdJN687R
         2KSqNoyF5y/ZUgwWkixnOb2DyVRo/Ysz8o8F/6V8woJrRu3PBCQp6c1ZitFhZm3XaGwS
         ujxXjyaQBybh2VtCsSvovLHU7smYjEw3y5WvL8xyBZC3mwf/8REZM2BDOGBqStf8Izbz
         KVpuW7EMP4iBI6klLAB2YJl5vKLyfq8EDtS2RNIVhkBHvQJ1o8MJ1xHB6mZCL82mN63A
         jhkmD1KZrzBfYZ8+B/Cs8KSv6Pob0ydBwLhkzA2jXJ3pCGrGu1lIYh+v8R8vfhvRvNGj
         VZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699875; x=1777304675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/leg5zPIHXcYJT9pnVBCSrFES28ADZ8CQyyvDb61MzA=;
        b=DfTrrUs1OwrH+WrwxqVnLCKpC48cCPvVec2WFBIWVFcFPUsBqDHo5X/o7bNm+1+alh
         2KlNxUvST+nqpCHEZMzlwE4wb2lPMX66WuupQWGFMAIww3OKWl8bgZam3jiHrhOiLJHL
         g+N117YWz0duJzLzfdArXkoR36vYo2gj4pTHm6kj9aqRLEHpSm8swTgAxEVt8j+Y0XWL
         Tb5l9geWWScPKXHGYJifNVWi31T2DZiroUnCjx4x8+CTb1XjMCu3NxFp50f9q2dXdNZ8
         ugzwnea6QqMyZalwuZpKnVG3k4soU7KthjcsogYBZqi2zp77q7nK/AFXVKjyy/JaHWfn
         SCNw==
X-Forwarded-Encrypted: i=1; AFNElJ9pA+EROlEMLMYp13VMuXUR17vK0jf//G9HoyjuADweTnXCqMjZp+5DSO9FOwb7ndC+DvViwfCik0c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRgyYLneF6IJm0FoGvaZ3/1z7QLhp2FdQs+WdwrsmCmG2Tz+NA
	b3KQYKChCNQATuPUOsbbjmIr3sDhF257ZL00NmUoSuaDtDkzrrsQ6CaBe9zybTKMMBTcsi0NK1H
	seZtsbg==
X-Gm-Gg: AeBDiesUloYcFEQL+fd/xuznNFnjfZ8AfYEDlS9V4KM/mxIdP/2Wan7NnLIMRovWgkI
	dY32+W2HF5Uf440UeTMh9s4O2zO0S5TnivHWgEECE6lFv9bQWV8Lu/OvXwNeFXTKHE19/cafSeh
	NuXAJvp2aeX7bL2NuCHkzWs6TyoieChoMaUZT5PfCRrQ0Pgu6s/aoKTHZoVSY0/5ydWADRLGgv4
	a+9lNgbbFnV4cIq//UDMdM75nDd0ohFL4GyPcaHo5IRnL6P1zig+h0VtR6jzf4/Wz0QmD75yuaq
	vaC91YxewGUDO1kypMi3+CslS7rs4maTqTjAPdbk49lYhdaDc7WSxoNiqM+nVWRZrgyA33kJLm8
	GmCGVEv3E0SiCxvYdmo+Ekwo1CetVzWFDmGW7zfIX1cH91sfNSo6fzbwhyZmeVDxo+G1f/0KhSj
	7SsaZWzxOk9F/NafTEsyXSJ7D5s8K5Fyng7o365R/MkEYyIEZnl98BEMqEg2v5QvZgkDBtq6PUr
	RBXRav7aS/JZL9VW/KehIOh+g==
X-Received: by 2002:a05:600c:c167:b0:485:3428:774c with SMTP id 5b1f17b1804b1-488fb889336mr190069235e9.4.1776699874874;
        Mon, 20 Apr 2026 08:44:34 -0700 (PDT)
Message-ID: <d942bf90-6f8d-4389-90e6-a486ac510e1b@suse.com>
Date: Mon, 20 Apr 2026 17:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] xen: fix len type for guest copy functions
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <9154aea41a11bc0ba95ad15c217db79d029dd119.1775836193.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9154aea41a11bc0ba95ad15c217db79d029dd119.1775836193.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1776699875-886D4161-9CCD578C/10/73395122804
X-purgate-type: spam
X-purgate-size: 1044
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0E26B42E85B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 17:54, Oleksii Kurochko wrote:
> Widen the len argument of copy_to_guest_phys_flush_dcache() and the
> copy_to_guest_phys_cb typedef from unsigned int to unsigned long, as
> the function can be used to copy large blobs such as the initrd which
> may exceed 4GB. Update the internal copy_guest() len argument to
> unsigned long accordingly.
> 
> Change the type for local variable size in copy_guest() to avoid
> compilation error because of type mismatch.
> 
> raw_* wrappers above copy_guest() keep returning unsigned long to
> avoid type narrowing; it is not an issue for raw_*'s len argument
> to remain 'unsigned int' since the assignment to copy_guest()'s wider
> unsigned long parameter is safe and there is no raw_* users who
> are using a value bigger than what can fit into 'unsigned int'.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Actually: You say "fix" in the subject. How about sorting out a correct
Fixes: tag then?

Jan

