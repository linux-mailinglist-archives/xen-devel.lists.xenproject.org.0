Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFuOLHtGk2l83AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:31:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273EA146354
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:31:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234403.1537681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1Vd-0005qK-Un; Mon, 16 Feb 2026 16:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234403.1537681; Mon, 16 Feb 2026 16:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1Vd-0005nW-RU; Mon, 16 Feb 2026 16:31:41 +0000
Received: by outflank-mailman (input) for mailman id 1234403;
 Mon, 16 Feb 2026 16:31:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vs1Vc-0005nO-4h
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 16:31:40 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f38ea5a1-0b54-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 17:31:31 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-483487335c2so31847735e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 08:31:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a10cacsm146572805e9.4.2026.02.16.08.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 08:31:30 -0800 (PST)
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
X-Inumbo-ID: f38ea5a1-0b54-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771259491; x=1771864291; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ES+1mVtv7WgfTU2r/djNzqCycFT73ujDqw5iDNt29/c=;
        b=A9DsuYyTgo5h9BBTCz7xsPtEp4cCX6IFAS0UyfdxzwzBh9zky+2dbgstom99A2hX0P
         pSiUMbflEBhXuNkzeIp3bZ5uK8PBFcaaZnZXuPbOs0AsftmH3MzM8yUG3ZS3tZP4aMuO
         tw64MXJyGYase4Cl4iaN1QCHLq1uVxt4lCcyjeAyEsBPPpwhxYstrIHYJ2JvP7GbBRGb
         V0a/azmo3/QUnx48Toywus5RWQ4EN82yiUPTlb1Xc/qmxtaJ+NML78UG3AcgpYuFJZLo
         aZ2FsumCuMzN68UgcUs02V4u2P7wyU1ruLYN6hjLdycqw4CQp2JHjc2MujlRMjgkwFH8
         VrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259491; x=1771864291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES+1mVtv7WgfTU2r/djNzqCycFT73ujDqw5iDNt29/c=;
        b=gg4lHFk4My5UdPeYjJtcGfPhzH6LNDVHl0o0c2PjtTOEHCq3YFcFxDf/Nr7hxn56OD
         n5UqKRFY6tvhH/3T8HYXrhy73ScuWxcN/xBhq4Y7gkF4dIORAH+t4DGa/SGF1zEgdUAL
         U8/vYgPgETlFnzkHgKG4opxFWb5hLDvYwA639ZqR2O4AY5fYZQTeYwED4U4Ph7yMbLXH
         5htCOsMiN10sP6P4eNg2VKapOsrnGLqLfL8wm9eWKmfnGNJrAm4cMZfEMMsqQpXUekMu
         G1oitEJqqzrE8ptPZSlvF+u3WvX+CsiLerGtAGZRLTPIBK076lxbRmPw251L2cjxfH7d
         Y81A==
X-Forwarded-Encrypted: i=1; AJvYcCVhJkd3K1PKihnQUqeWJmLzs3RIbntNzwkCh1Q7JX1xFPmQlbO0Qm9zqQy8XXa9YCiob3WIllyfAhw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYWr5EdkUjNfQ7Wzl0mRKgRj1X59cFUD6cVFwHFQPsRG0HoI0M
	oV1zBaOEXhzeloP1vobPbWs+KtmDENFSrJCsVsuHtZIQnzZn+DkGSYGoP9GGIWTY8g==
X-Gm-Gg: AZuq6aK15Hsi/JyGwHqWmChJIw6XTd74kGGcid/N4pVeQaUv8dsneSQ70NTLPF4zVg0
	5hjsTA5wrCe9HEu+RfZXhZzgViC07TE/Bri7Te1KFLMNBiMUO3pFjV0bdjqtKnr/Vd1AyJtlkvs
	46hvk0INOdqzn/J3zJkiOSbV12kZnbVSFIlmAWIUy4go4eD32Nm8IBNBowJGmZlLGjJlBvGEXpS
	A4UdXdt36mQzEtTJl4ggxl5yJXNR6f97QGzj39gxUnBFIhnFnaFJDDDMDLuvl/heYi+FiApYysm
	xGzy2Ubi/A5YXhvrBrJG7EKeLFehbTOPu82vESTzRLJrUVq2xe0yrryOwFUL1jHhZCRD2mOriT8
	6p31Uf6ODQFCJTTnOb4o6+DcanfW7WvnTEc2EL3Yb4FCt0wTuIU/2pcf80Cv4LdxrBb3p0/UXso
	ieqE3dQoCMQzKF+yYW7bMnHXEL0EZa/8nD7jqIpU02y2CFVZ/erOsW1zVDVSmLJ0jO3tK8Ao3Gi
	EavZXaOO5B2+AM=
X-Received: by 2002:a05:600c:1549:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-483739fc78cmr198038845e9.5.1771259491127;
        Mon, 16 Feb 2026 08:31:31 -0800 (PST)
Message-ID: <0bca8843-9c52-4544-88a6-87ddb110095e@suse.com>
Date: Mon, 16 Feb 2026 17:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/riscv: add zImage kernel loading support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <308c5bc1de15b23c643d48f975799739f44dde8d.1770821989.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <308c5bc1de15b23c643d48f975799739f44dde8d.1770821989.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 273EA146354
X-Rspamd-Action: no action

On 12.02.2026 17:21, Oleksii Kurochko wrote:
> Introduce support for loading a Linux zImage kernel on RISC-V.

Before I look here in any detail - where would a zImage come from? I can't
spot any support for it in Linux'es arch/riscv/Makefile (whereas
arch/arm/Makefile has such).

> Note that if panic() is used instead of returning an error as common code
> doesn't expect to have return code and it is something that should be
> done separately.

Is the "if" in this sentence a leftover from some editing of earlier
different text? I can't make sense of it. Also, which "common code" do you
mean? kernel_zimage_probe()'s sole caller does respect the return value
(handing it on).

> This prepares the RISC-V port for booting Linux guests using the common
> domain build infrastructure.

Again, what's "common" here? Not something x86 uses, afaict.

Jan

