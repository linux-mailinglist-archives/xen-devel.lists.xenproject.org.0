Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEPPMpUig2nWhwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:42:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3995BE4B4E
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:42:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220400.1529112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnaKr-0004AB-VR; Wed, 04 Feb 2026 10:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220400.1529112; Wed, 04 Feb 2026 10:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnaKr-00047R-SB; Wed, 04 Feb 2026 10:42:13 +0000
Received: by outflank-mailman (input) for mailman id 1220400;
 Wed, 04 Feb 2026 10:42:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnaKq-00047L-Kc
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 10:42:12 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2509eeff-01b6-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 11:42:04 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43590777e22so4131734f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 02:42:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805fec6sm5369739f8f.32.2026.02.04.02.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 02:42:03 -0800 (PST)
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
X-Inumbo-ID: 2509eeff-01b6-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770201724; x=1770806524; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rorERKJlNFMonmMiKQESjUzE834QhK9G7+qVVq8723Q=;
        b=OFWrFzdYhC2pLxcJiYGZg9eI+4tWsALk4QSIRDKf1RqVFccKmFucF2D+VBdzC/sara
         2fZz01CPfOi7BRr3TaP22VEsZctQ57f4YB60hD1FdjxEETpIyujEbe0Cw0+0oOvmCkGC
         vsjmU4JtgfL8mwL2Z9ulSUf2Nzd+Oheq7Pmndvb9de11YUH8P9Xy+8pNxAe0fak4/HDQ
         9apZ7nH8vfFZ0Q25QF5bMbQpzy3Y5j+LTkz0o327vz2jPXnxERfoLhv47cDZTbwM4acZ
         3w0jlo7V9J4yhrreP5tvcqg1TjuZexXyQKHSMd7DjhZ/4FNmV5eg4itcgsR44byoZ2X5
         KjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770201724; x=1770806524;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rorERKJlNFMonmMiKQESjUzE834QhK9G7+qVVq8723Q=;
        b=jmT3WjSILOoIx2ST2x8koeAF/A6pBg/NDfYZ77Mz1XXzW174Ps1GfxIuXsirxd/ay7
         bA4SFrTVMf6repDD26NYy6Kxkz5G9rZ2mKVfePzn7th8ApfMJtcH8uhKbjaOzBF0BZBd
         2alSptYZgucbGi9Q22vGdfNEmdghFeYXKFfRBLEO7SlcCaNuu876UUJJFZ4TxAB1VbPH
         63II+dC3R6uaQN+NCjPULX+6wsMy0X1TlUMFHCDfQHCfs4qU1LZpdArP9WVs0STOg39j
         KWujCCzomGwrpSi47PXHF4n27JNIgTQUr7CbtiZSchlolSDlCVeSsQ/dwBhFVCpueD13
         yEHg==
X-Forwarded-Encrypted: i=1; AJvYcCUbFCCn+Yqh3r3gbHEyVxmxcI7vQO7PHWRB+xuYUPZWgvM3w99UdU1qqr1E8kIl0AjC1g2kVVPNHvI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKwhX/u++9Xxji1RNUvedFJkb+hc50puWFRbWsQsHJyAYxBXyr
	43niS2iJ6jdLfy+m0woEKXa/0+Yutxv77fEHudPpa3ocv+aqWldSGKHAPw1aeytIAg==
X-Gm-Gg: AZuq6aI/C3JuIdN+ZbF4dcCfLoHi1yzGJDK9QeIetN84ZzmWMVMThAGId+DQtnkwhE2
	iflYukqNDnmagoF+E0h0D74bSBnf/Jaktshce6Dm2e1dta+6KCKiKhvybWi80o180MozNJapQJD
	Bc7aM38N/6w1D1W9qx8UxO2MeMxncL5pmYpfK5Eu9H45MHfpRp5UxfWNcEyCukWhr09RheRNskc
	r98LE0sfYpjMPe0uZiEUdh3YCFdd5DRxqdXeFbbxWKm1q6sFFJ4HmTMNkKAWhWg3JHcR5lOeqZb
	Z7YhF4HLWFYVyq8C66pobQLXUntWWwlLx7KQisb1OWg98w6YT/j4YpK3uEVAhsmklAB+LD/qKYM
	vUbUXTmXmGk0d0IK8iA/AJqHbCE0UMiqqKYrafpWI3amB4ZSgubQxZCsApDLcxvEOgDOGDuhllV
	HXTD3jYVD9q5oam3IUI+QhyzAJhU2wuv1XHKWZIYtN6wpXm3MQJx5orpSy7CFOwiCOf3XtG+vrU
	8Oa2cpfC9KtQw==
X-Received: by 2002:a5d:5d01:0:b0:435:a673:bca1 with SMTP id ffacd0b85a97d-43618031b7dmr3504464f8f.27.1770201723778;
        Wed, 04 Feb 2026 02:42:03 -0800 (PST)
Message-ID: <bc509f1e-b0a8-4544-a88a-549637fab9ca@suse.com>
Date: Wed, 4 Feb 2026 11:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] xen/riscv: handle hypervisor timer interrupts
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <5028577821754b86f633bedb0c32f5490ab6452c.1769099885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5028577821754b86f633bedb0c32f5490ab6452c.1769099885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3995BE4B4E
X-Rspamd-Action: no action

On 22.01.2026 17:47, Oleksii Kurochko wrote:
> Introduce timer_interrupt() to process IRQ_S_TIMER interrupts.
> The handler disables further timer interrupts by clearing
> SIE.STIE and raises TIMER_SOFTIRQ so the generic timer subsystem
> can perform its processing.
> 
> Update do_trap() to dispatch IRQ_S_TIMER to this new handler.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


