Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /IGnFtdKOWpWqAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 16:46:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6BC6B070C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 16:46:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=EyI+lQ2L;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343841.1603062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbfun-0006ed-QZ; Mon, 22 Jun 2026 14:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343841.1603062; Mon, 22 Jun 2026 14:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbfun-0006ck-Lj; Mon, 22 Jun 2026 14:46:21 +0000
Received: by outflank-mailman (input) for mailman id 1343841;
 Mon, 22 Jun 2026 14:46:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbfum-0006ce-Jo
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 14:46:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbfum-00AXE4-0Z
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 16:46:20 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a394aa4-2eae-0a2a0a5409dd-0a2a4509e290-38
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 16:46:17 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a394ab8-4999-0a2a45090019-d155802ecda3-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 16:46:17 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490aaeabdb4so26563075e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 07:46:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fe7b9e5sm291550485e9.10.2026.06.22.07.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 07:46:16 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782139576; x=1782744376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AJcfWkuwAaY8u5dWM+XkMhgb8nj22BWw3YSW0oyoF9g=;
        b=EyI+lQ2Lc93Z1TW/QWJyhpU5t0ArKibqXS+E/M1OYPfBOwxSFKg/xkmo+wMPEex/W3
         LCxdyS/TsF7zK4HihAkqh5Xa0wrM+ktTIN0S3nfRt8IvIycIzOSCGJmMwZW3oVNAXNjQ
         s5rIGfvNdRaTpBq6OvcVtpMNjTlPaU/fLAdusOCO31y2Ce53pop/QI+74bWoIjlzdEGt
         7irbC60d3JKJaM31/5pWsYMdFjeqANXD/eeuWd0XDJnMrl6Axfjzo/PKC+oJFo5HQDeC
         r+dfLzI1vsu7QZVSS3C0Pz63lN91n+yPCH2aOrx6pLCVebQYXstMJL1zQdc16Q/OCztO
         phsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139576; x=1782744376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJcfWkuwAaY8u5dWM+XkMhgb8nj22BWw3YSW0oyoF9g=;
        b=s5GX/D5/d//PFdowBHkhbJPKRAArEqLCyGzDd5QPAQlWuybahrRufOfKKJRne7AJAv
         wmKs+T3MGYSFEvJyUWLRj8zZi9QoExPm+3wGPlh1O+b/eX0Wvv9RprD6ZEmPrZkmF7Uw
         ua0+j9ZAybhrzdnAYAddxilmIdQycOFjkQvuUN79H7FBEb3XxwqzPsdy/Wt4FU2ameOY
         OqRoYc/1uD3R0tWaAHWWgt56moq8GBEcWV3LwIdoTAf9MUk2wvhFmrc1CoF5+EIvmrTS
         aJBSipk5GStXLGSrxJvxk7tBIUx7ygpAqhKZwi+LXoHPG/SFEt9xcZQb8U1txeecVsI1
         F0pQ==
X-Forwarded-Encrypted: i=1; AFNElJ8u4x6MuOVkrDGUUUd3+2AkPHdvNH/yYqaqeZHak2EuOGlp83GXuM87gcBufldPAoYXjL9yVH9kjfo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlWbkD+c7mfnQl6DdkwHAvVUsIq9PBaihimRSgLMog6fRFnk9A
	npy2+KdqeJBnBqx+r1jaCQqN8tKUKphYt7ogO53UklwfPcqqbaOcNeIKGqjhZV11xQ==
X-Gm-Gg: AfdE7clysFu4SaX9hZle9RSivXiPJxdLK/y3DdEV7Bfgqx9jcF2PmEXZD7QBbCqEvik
	jcRcB6njQuzhFDAOXBEsG2hmv06gR5///jZS100lJDPUjY+NtWj3Y5KGitJpeI7tfIXGX7PcxEo
	WfT8QgC0VcDo6kazp98yVlsnsppjj30gFp09Ja2FIJ1oxypamPDXbj7kZvz0ie2vUKyhAa7cIcV
	F3BFeUXvEipILNI8l9WiNp0mO0pYtH3HEKVhn3/staGepqz4jQ5rXfNWsJoaIBFrQXbKAtnHyQI
	D1tqb480Do6S0b8ejt4WqDXaHI7laeUByqFAj+V9wUCD54mxVrQ8rp0+NEoyxe2ZJOwLoOXa2tD
	PM6LKcQnGwp+bxyyBzdzBgj/TjFjozuq0+x3ma9+zx1DYqfVavydSpQBrHSr7VmvCrpHgbIjozw
	agQeUHEkjMbpwp9VzDxZ2ZfpjCqPm/fV+whb3qyVvQvN91SoHHG7Y4Obl2bVhQmOqqNOifNvi8v
	arXxZNhLf1nNRY=
X-Received: by 2002:a05:600c:3e87:b0:492:46c2:f5b4 with SMTP id 5b1f17b1804b1-49246c2f68fmr208194945e9.32.1782139576575;
        Mon, 22 Jun 2026 07:46:16 -0700 (PDT)
Message-ID: <ca8ed8b5-04d7-4561-9e2e-58923c6a0f3d@suse.com>
Date: Mon, 22 Jun 2026 16:46:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/23] xen/riscv: introduce per-vCPU IMSIC state
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <69b84024f185db01d62d6c9ece1b5cee0e20a25b.1781693963.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <69b84024f185db01d62d6c9ece1b5cee0e20a25b.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1782139577-F71E3744-93242F7A/0/0
X-purgate-type: clean
X-purgate-size: 1184
X-Rspamd-Action: no action
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F6BC6B070C

On 17.06.2026 13:17, Oleksii Kurochko wrote:
> @@ -61,7 +62,24 @@ struct imsic_config {
>      spinlock_t lock;
>  };
>  
> +struct vimsic_state {
> +    /* IMSIC VS-file */
> +    rwlock_t vsfile_lock;
> +    /*
> +     * (guest_file_id == 0) -> s/w IMSIC VS-file
> +     * (guest_file_id > 0) -> h/w IMSIC VS-file
> +     */
> +    unsigned int guest_file_id;
> +    /*
> +     * (vsfile_pcpu >= 0) => h/w IMSIC VS-file

DYM "< NR_CPUS"? Else the above conflicts with ...

> +     * (vsfile_pcpu == NR_CPUS) => s/w IMSIC VS-file

... this.

As to the h/w vs s/w options: I take it that e.g. guest_file_id > 0 and
vsfile_pcpu == NR_CPUS is an impossible combination? In which case
re-arranging commentary may want considering:

    /*
     * s/w IMSIC VS-file -> guest_file_id == 0
     * h/w IMSIC VS-file -> guest_file_id > 0
     */
    unsigned int guest_file_id;
    /*
     * s/w IMSIC VS-file -> vsfile_pcpu == NR_CPUS
     * h/w IMSIC VS-file -> vsfile_pcpu < NR_CPUS
     */
    unsigned int vsfile_pcpu;

As to guest_file_id: In vcpu_imsic_init() you store IMPOSSIBLE_GUEST_FILE_ID,
yet that value isn't mentioned here at all.

Jan

