Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPFdNcAGD2qFEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 15:21:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F015A5A45
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 15:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315206.1585053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ3KK-0007uZ-DB; Thu, 21 May 2026 13:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315206.1585053; Thu, 21 May 2026 13:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ3KK-0007sc-A4; Thu, 21 May 2026 13:20:40 +0000
Received: by outflank-mailman (input) for mailman id 1315206;
 Thu, 21 May 2026 13:20:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQ3KI-0007sW-LB
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 13:20:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ3KH-0033oF-To
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:20:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f06a3-bab6-0a2a0a5309dd-0a2a45089428-4
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:20:37 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f06a5-63b5-0a2a45080019-d1558034a40b-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:20:37 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48fde648a71so44128445e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 06:20:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903c9b004csm16317245e9.6.2026.05.21.06.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 06:20:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1779369637; x=1779974437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H1D4BR5UO0yoHoRI0QNF4Yv2ieB2IAvqJtXB05Jf0KE=;
        b=MHGRnqKapYwnTt6DwYEjnIh0RssDGGltyUkVpTd7xoND0caSffow0f2e0F2ZizmBsv
         Wkqq4Ni5JkydYc66C3FgGuKeKEiaKJdNo+9+vV5mOV7q4JkQhnHv4hLIIC/FRjCPKOKH
         CdD/ozuJmk9Cjnpl8x73uoMdLzyudtUWyKq5FnuL3Dm7MWFE2GjCbC1BAus+LbivXh5T
         iM+EZ5qct4uL8UBk53+KVzpfAj4tGSp80AORTpafzT3ZVZ3+LwZHo8fLRdm9FwpP9Z1K
         /KOtXZLstodOwNhHHY4st4Rci1alLIfwQxpqV0Et/rtobcRJ8KcHlK3udrnqcK6YXSxq
         wTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369637; x=1779974437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1D4BR5UO0yoHoRI0QNF4Yv2ieB2IAvqJtXB05Jf0KE=;
        b=qXdRl0YbTeyjxn3yi/io9ivZO5qXJ4W7dDzh2yzGsUvcI8D/rFz5U0k9U/4g6KHkRL
         x9+FZPMPrY2lZcQbu9Y6a36SY92ny44NcyVPVHaz2UOwACagd4fPiKsPCsGQ9ViViBES
         CAbRd0ySfPcZr2XE7i/RTsbMBTyjuy1LuMl4lx6z2O0O+n5xGZgF+A+iGaML4oeuF58F
         4gE52gJn2crFpd5CuKcYy2Nidxz385YMt5yPdngOlagGWyPQ9vDMMhlCVFvVmdiQHv3d
         vgDUaMQhMSqi6W3N2VuhC9e4o05Xp4ZY/2bIe4foS3L+anFofw9OCMYQsatcTnETRKi7
         Nipg==
X-Forwarded-Encrypted: i=1; AFNElJ8L/3NY22MCeHMZtoiDmY4FGkQ51a3uD0aQ8zu2Ozs1fAYaVJeyRZzAJ4GYHEs561hDqDXT6SI2G5E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEyFSQdYuv6FzVcZE2X3xCajqnljn0WmS9wtYuBhnr166HdXhW
	c+Ji7zN2a8ObIhXLNu7dWqn2/tYOVQeNBGcSeG6haX1mVopK1IeHCJezhPmgwLUxkA==
X-Gm-Gg: Acq92OHZ3XZdADg5QpRaBRU2ATQuTLhqK8FbNSzh5K1f5C29vajfGFqJI10bv+1Ev3D
	PpQfxkhD7Yd3Km/JM7diAgrjGN/ksZBirghd0asgz104GJErNcQRjWX8G2esm0SJItZx0IwCY0i
	5DfGpVfOdL8xwJTrIQqAYKqk+BdrYBOEUdLC8mapwifGEPux6HKBs5W9YZGE635ZkTW42r9GUP3
	FTmnEKhlbvPT1lx1GZr53NBkuR+1W9d0o7JVGMBW1OZMi0qj3ldbLjSIYhtWxoDVSeDw8mPaN8O
	wcRQ4oltvIQOznnEnYrkc6NVFAiBWpaU5hyuEZ/v6tesVje5Y4S9v1zZ6vIW8sfS60RTT30ZQ7e
	VPtjpBgkfrbVo0+/EtbskRJVDbGW7fOpI+GYZ5sMP7T2XWKE5B0pBKN2oGLCqP6xtp8Rnp4TEuI
	Kb7N28vySbpMeXqYpuFRDmyMVlULOtwxNlL5A6YoMpXB0JUOBkGegprAwWqiM+UTace0pNeCBPx
	vSLCApjWj26yuc=
X-Received: by 2002:a05:600c:1c1d:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-4903607fd1emr37030015e9.7.1779369637113;
        Thu, 21 May 2026 06:20:37 -0700 (PDT)
Message-ID: <9ca54605-5548-436e-b079-fc4b33b5fb6f@suse.com>
Date: Thu, 21 May 2026 15:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/26] xen/riscv: implement make_arch_nodes()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <92338cb9254da76cccb242154d0617603b856052.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <92338cb9254da76cccb242154d0617603b856052.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1779369637-B5D6BDB1-DBF1AB43/10/73395122804
X-purgate-type: spam
X-purgate-size: 457
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: 48F015A5A45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> No RISC-V-specific nodes need to be created at the moment,
> so make_arch_nodes() is implemented to simply return 0.
> 
> It is placed in dom0less-build.c as make_arch_nodes() is
> only used in the dom0less code path. In the future, it will
> be extended to create an emulated UART node.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


