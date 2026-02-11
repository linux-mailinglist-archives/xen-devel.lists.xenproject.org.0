Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDbFB1CcjGmPrgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 16:12:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C178125778
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 16:12:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227796.1534219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBsr-0006np-O5; Wed, 11 Feb 2026 15:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227796.1534219; Wed, 11 Feb 2026 15:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBsr-0006lu-Ka; Wed, 11 Feb 2026 15:12:05 +0000
Received: by outflank-mailman (input) for mailman id 1227796;
 Wed, 11 Feb 2026 15:12:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqBsp-0006gu-L3
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 15:12:03 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04e59c72-075c-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 16:12:02 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4376c0bffc1so2864945f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 07:12:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d50f3asm5587804f8f.13.2026.02.11.07.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 07:12:01 -0800 (PST)
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
X-Inumbo-ID: 04e59c72-075c-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770822722; x=1771427522; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yVuOkdB7rmc99GfP/XABLj+ccdJ9TARf5nUHNGW0POQ=;
        b=LAQVdubXIJaOtvgc4dhFQ+oOW4YIEnTGsi1xyv/rFD5r1KPQbU5WyAbXEC1Sf0plVZ
         8PLD9j4JAeNCO1NHOpEq0ZfQQDMA4N8MOxuuG0AOadVHa7TbznIr/akm7Cg+yYdVRC6A
         vLA9YzgKudUjvq6/EWiaDBIsX162sL9k5fLlq29SA/sKI6HM/Iaa307SQGAz8/JqTdJ6
         7C8ul7ED51knQSgK69Jdo8b+eHBeUideQLIChzsIUeQ3/cYQ92xYeGoSbo/Y5/h8clHN
         UKUP2pnAUnVG+8Ny2Fge+rNekw9fpHWDYSYHqrscNjA5TXdFOSI7+FYVFu9TsLbtOiEV
         R9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770822722; x=1771427522;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVuOkdB7rmc99GfP/XABLj+ccdJ9TARf5nUHNGW0POQ=;
        b=VqaB7PvZiydO/BEMU1vc813tsem1Qbh8XMFojbAEJFfHPqoGgf3spVUh3HkkPaYTti
         fmkHn4M3l5OwZqsIacXsEHfh9pIsXeEiMQmZZCaqVanMusOFSmngcO+k+q/M3mOK8+8V
         HaBSQC2UUQz7QGetnHHOeFIr31H+4nD9qhCLyFmKCtMhJSLbB0jPEKhZGcINyT95PdQu
         MQWu7M1wXiM31cwPl/ydYIxgJ1BIX20/G2Lld2g6RzELKTLYTsOssLcFtBUGM45MayYY
         brUOKhuDu0Monn4Divs+WmKyuksuMnIakPmNsnLg87kDvg9G1/pSKV+eKog+jE2iMmn5
         rCgg==
X-Forwarded-Encrypted: i=1; AJvYcCXWA7V1M9nZzX4nMprzFsz2vPT5uNAjdRy0nx+p1FlE16BodMMh0OIFz3V1ElwCc3SXXIGjUaDoHhI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBp3iaeXxmpwTD5O/FI+JGhNeEIBONgEkO8WjGVVvC0j8OS6x1
	Krm8rNgQ45mGCB5u6kywr2wea6kYawfXp4qzAvJdbb1zr1FZtL4h4RvYnqecE04+Pw==
X-Gm-Gg: AZuq6aKGOwKGSHsQCRug4CU/EIVk6k9aEKh12gg0MI5TSEIYBagNMOJKohgcjidAuGZ
	l4oVbdmnfBdTi3hchPcTdizHHIULa9ZZ01r6+bXCdpcDegtAl9o4/t2/B04eGco+LviN6BlWzeB
	UMExSUHDdfvMAvrgfFk78c0FQ3Os+LFLxBfZVyxXetKi6ydlASQvKMTYTkUWMAVvwIJBlxZTTRV
	192Q1tqYWbaRdk03EbL3luDcFJsBms8FNktLP67LTftMkUWgraMJLIguh0WSYDuqfFKvtyuvToe
	c+KuDC9Kh1umlCJtHuFqgUd+768fL8uwnmw5+JZOzQaqMZP8TKvPQa/Yvrs6F06emfTtnC6tsFF
	KcpSf7uxxjgF7N8URs8JX8VcNupipvRG9E3paEZSiJ8ytEyeG68HBfq8D++R4FjjjJnqXXYSN4X
	m8ff8MSsvE6gPVmLeVNuWTecjEsRk3ujSr+5S3zt83ypJ1C8ok/6mQmcfoyxWeUXX4m4c7CiBmo
	AknbrG8iACQTGw=
X-Received: by 2002:a05:6000:1842:b0:437:6de6:872c with SMTP id ffacd0b85a97d-43784521a51mr3649879f8f.3.1770822722083;
        Wed, 11 Feb 2026 07:12:02 -0800 (PST)
Message-ID: <3a584527-1c20-4774-b533-0ab802587f04@suse.com>
Date: Wed, 11 Feb 2026 16:12:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/16] xen/riscv: implement reprogram_timer() via SBI
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <b1e39e0187fc44fd926f774e68a580077a278495.1770650552.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b1e39e0187fc44fd926f774e68a580077a278495.1770650552.git.oleksii.kurochko@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 7C178125778
X-Rspamd-Action: no action

On 09.02.2026 17:52, Oleksii Kurochko wrote:
> Implement reprogram_timer() on RISC-V using the standard SBI timer call.
> 
> The privileged architecture only defines machine-mode timer interrupts
> (using mtime/mtimecmp). Therefore, timer services for S/HS/VS mode must
> be provided by M-mode via SBI calls. SSTC (Supervisor-mode Timer Control)
> is optional and is not supported on the boards available to me, so the
> only viable approach today is to program the timer through SBI.
> 
> reprogram_timer() enables/disables the supervisor timer interrupt and
> programs the next timer deadline using sbi_set_timer(). If the SBI call
> fails, the code panics, because sbi_set_timer() is expected to return
> either 0 or -ENOSUPP (this has been stable from early OpenSBI versions to
> the latest ones). The SBI spec does not define a standard negative error
> code for this call, and without SSTC there is no alternative method to
> program the timer, so the SBI timer call must be available.
> 
> reprogram_timer() currently returns int for compatibility with the
> existing prototype. While it might be cleaner to return bool, keeping the
> existing signature avoids premature changes in case sbi_set_timer() ever
> needs to return other values (based on which we could try to avoid
> panic-ing) in the future.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> ---
> Changes in v3:
>  - Correct the comments in reprogram_timer().
>  - Move enablement of timer interrupt after sbi_set_timer() to avoid
>    potentially receiving a timer interrupt between these 2 operations.

I'd like to mention that this is of only hypothetical concern, at least for
the sole caller in common code: That's doing the call with IRQs off, so
only the bit in SIP could become set too early, while no IRQ would surface
before timer_softirq_action() turns IRQs on again. (This isn't to say that
it wasn't a good thing to adjust the order.)

Jan

