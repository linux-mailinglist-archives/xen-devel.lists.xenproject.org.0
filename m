Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIC2HjShnWlrQwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 14:01:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B521875AB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 14:01:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240044.1541506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vus2B-0008S9-BU; Tue, 24 Feb 2026 13:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240044.1541506; Tue, 24 Feb 2026 13:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vus2B-0008Pw-8f; Tue, 24 Feb 2026 13:01:03 +0000
Received: by outflank-mailman (input) for mailman id 1240044;
 Tue, 24 Feb 2026 13:01:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vus29-0008Pq-A6
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 13:01:01 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc42c39a-1180-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 14:00:57 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so60164435e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 05:00:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b66932sm290887925e9.1.2026.02.24.05.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 05:00:56 -0800 (PST)
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
X-Inumbo-ID: dc42c39a-1180-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771938057; x=1772542857; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tXDxOZzASzGqgCA0ooOrwGPjB1yX0fBWyLXbLD4ndGQ=;
        b=XYR/70UzOZ9/kcSqJ/EDDRNCoV5E7SPoQngUi3sPZ0EzeUgVUtlodk65ciJqu/xF7T
         J2NP2ptUVaBxIywvp4O3iY+9OkHAkpiCEOIU3ssxd9XYfDaKxDbRHsN/yJj7tTWW/uW4
         5PVdf+H7fLFHAGNBWzcsGg3oiatWOSnIewapjrvZD7Qd0r28D2n9fuhx9kCQb+HYaqJ/
         FILif2MxNnEDNq+us4Ebjld3MeJgWTAXtgQCnUDbi9/YCCKYPU6SsbFaNxBew3fxGAhB
         RHDwyWv0+lA9jaYRREVFhNvcu5Nz72qGnokSBV0L9yJX5sf/7NjD04hpQ5NcuSABjSNU
         X1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771938057; x=1772542857;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXDxOZzASzGqgCA0ooOrwGPjB1yX0fBWyLXbLD4ndGQ=;
        b=JxPOaKgMct5iiVSlHT3HcPsMOfxg4L+o9Owmn+VK35eJ1/3FhVMDPfedtnPuSM3Ei4
         cOqapW2Lz0T5rfu1f6mNYkqrXnodTiWujXXCpKovFsKEuGpw+gN2j13/Hhqi9EJjbHtn
         CGeCpXZlnAhjBMmiXUaYmjDWU9BNESdt29CBpq1eByU9AeCpcDpghoiuW86LiGXbaVUY
         V2nCYHIZ541v82uciEiizByfnjtVeiOFP8oNR/xgtiGBhh02UpqgjZUbzUjKoglMifRI
         CZoWkWobTur/SCbc+LSgRbmnMtFbn1Jb/PAW6IRDz4zP7jXaEX+C9uDaE7rblvZj26Ga
         stdg==
X-Forwarded-Encrypted: i=1; AJvYcCVUej9h/w8cN0cb4+mkir/NDXchhGnqzWYJ62l2YduhJHcSJV06qt+b9F6zUHivMV2SMEqdOoSiL78=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOCSDfUUmxN/EapaML/4zZzwFXvwpE+glsNq1l63UFT0QmSXjB
	W+mEqp3bRwqMHVNN2Z1XQyQ42900dt7891h/I9rsAJjquys2T9zHFF6xizUTL7vfyg==
X-Gm-Gg: AZuq6aK52tCNH9XTVpmYGhhscht7FXy/bYbrkj5vsH8yA4yjZIYkZTN94YSqnUnvd3B
	ItOJng2OI6gGP4+SXPi6g5cWA9Ke8eEi7bjP8mXpD7+hDAsANbv/KCp+/W3t31yVaWqJyTaLhNz
	QUtoMu2cWfCTWgDCkNGVjtI4uE1hr4XMIlirKbp7kKwKuJEfmBJAxyGxg+ntSh0kg24p17MnWtU
	YSqFUzlqthnyeZihV2H7KTmdn0t9S8TkGwKo7Vv+uzw0j1OYz2RRlSRKx3fI6l2sQBV9I0/AEGZ
	2W19EiJj+VWYqC1LhnFUL83UtygXosJXWul9JZVldxCxRwhtmWAqMo1jmdNQLqG+XyX1nD0/TaY
	Uo6zx+vCw6F3pEKDEAy62L6HWakD1zHaOOWpheJUvWYRrvjBBgpkZsmi8e4/l/CQvKHZ6Y3Iiou
	oZ9EK3bkjt5RzyXG/5DCYuTCeBzX5XXMAWfQUYAXtRq4nH2pfkIlhhk+xi60fLVDy1cQad0TQpZ
	tZZ6YjWyIoKfOY=
X-Received: by 2002:a05:600c:8b02:b0:47d:5e02:14e5 with SMTP id 5b1f17b1804b1-483a95a86eamr209893555e9.5.1771938056818;
        Tue, 24 Feb 2026 05:00:56 -0800 (PST)
Message-ID: <f6d851ce-55ac-46a1-8d35-029f0ba66c26@suse.com>
Date: Tue, 24 Feb 2026 14:00:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/14] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
 <4f36d83e58bfba807660ebc1fc48e71ae056805a.1771590794.git.oleksii.kurochko@gmail.com>
 <bf8d5b4f-937a-4d6f-86ba-1ab07f53eb51@suse.com>
 <e084cd6f-e76d-40c1-9e30-97e10acae012@gmail.com>
 <541a6c57-406c-49e5-8b8b-019e30bf0d89@suse.com>
 <5e4362ed-c310-442b-a742-ca7c3d1c47dc@gmail.com>
 <c388593e-8371-4040-a179-c0bf32ae0696@suse.com>
 <42847a9e-71e1-47a0-b4fb-7d8c91370bf4@gmail.com>
 <1f2f7f37-0a2b-407f-918a-ac35cbbd5cd4@suse.com>
 <42da5eb2-06fb-49aa-8383-cb31f83c3933@gmail.com>
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
In-Reply-To: <42da5eb2-06fb-49aa-8383-cb31f83c3933@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RSPAMD_URIBL_FAIL(0.00)[cppreference.com:query timed out];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.973];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: E4B521875AB
X-Rspamd-Action: no action

On 24.02.2026 13:02, Oleksii Kurochko wrote:
> On 2/24/26 12:32 PM, Jan Beulich wrote:
>> And of course "structured" also touches on proper parenthesization of the
>> statement above.
> 
> According to https://en.cppreference.com/w/c/language/operator_precedence.html
> & has bigger priority, so I haven't put parenthesizes.

We tend to put them everywhere where rules from school maths don't apply.

Jan

