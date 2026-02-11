Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJZJEGmajGlkrgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 16:04:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA8912568F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 16:04:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227773.1534198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBkp-0003Wx-OV; Wed, 11 Feb 2026 15:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227773.1534198; Wed, 11 Feb 2026 15:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBkp-0003Vb-Le; Wed, 11 Feb 2026 15:03:47 +0000
Received: by outflank-mailman (input) for mailman id 1227773;
 Wed, 11 Feb 2026 15:03:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqBko-0003VP-AO
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 15:03:46 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dadf2cf5-075a-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 16:03:42 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-436234ef0f0so4174019f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 07:03:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d310c6sm5737724f8f.2.2026.02.11.07.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 07:03:41 -0800 (PST)
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
X-Inumbo-ID: dadf2cf5-075a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770822222; x=1771427022; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ee64gM6DKzd1fjGKdjCsKO3cini/KSX8Hd367lvqUsg=;
        b=eRcje/UPVfcHOfF2oHI+Q2M6t6ZB97Lim6wzbcg3JeEElmOqdCWjA1axt4gT7LC1vE
         yAF/V6VduUDuA3GMoJ97ZLwNOWiLfiTOCvw7sHYYqeOE50kqeqSc14rEwi271EEZOpKd
         TtSgrPij1K97QeZZSVSlcDCErPKJMph9TuwkWN+iKYMq58qQ3LTUrXAeg9s5nZ8Twh8J
         uhPepLuuomnXt/7sSFSft9VOHn1WklNefD80r+hvJSzxS8QK0UAevyJMs4GOhp+MDuuM
         fz/00lKFHLQT+DdiCayISfQd9ya8YIpJ6FX8l/wTp6PqAMnIanXZS3FnVcSwh8SeAdlx
         0oqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770822222; x=1771427022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ee64gM6DKzd1fjGKdjCsKO3cini/KSX8Hd367lvqUsg=;
        b=UtdCZnzeNRX+EsDLWmbZCsizPGU4RVrYZSpDbBFL8lsIji16q7/ZHFAnT7ZOe5M+iC
         yR1yZS/cLXfl3iAprZgs7Psmkx80xVpw3XiJfCRBrcGiDYieuJYm8jbNdsT46iwsjw7P
         BpJzeOc3zGxZpbsub3zcfPtn69JHP1BqaHZTxWgOjZG+pPPJpQurl6MxKV+MSTBP+QyL
         PYaE0ZCTol0BTC6nJHBk7Uke8gs2mcBY+6IvXGEEbXsJXmRml7js3dtBcaM6bIlM1IFg
         jYjX8mnUbJhnkXO8TC9VZKd1qsbgA+d5Nd72Dot6XP7zqMRBrK0xP6KnCqf1Hrd1tdK3
         7hJw==
X-Forwarded-Encrypted: i=1; AJvYcCUqnzxuOgrnwjugiRyXbzSZ4NuOI2V0etR9WHTsm7zBVORyjt6SklpOdIUBznyf0JFe0dpgnsBIMt8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuiQE3/qkjPH1+u/Gvrf7/Aaoa6TGfA9WahqOa3svOeJzCrXfW
	3wBGoEI/pjfwzSFgiFKhradeqxZtCmKPttrLHNnIaJ2wOghg4iiOj9eAxTGNpEAUqA==
X-Gm-Gg: AZuq6aIY6FpPR3eLozfuVHoy6svzcnkFVlzyDYBGLDqxHX8XfU60omQkHbTvZ8Ed4rk
	nATdMcBHovfUw4SCGppxKBQlWZ7nuq7kGBA2iVZvt4Xf1Xx0HbZsmeY0bp19yMb3478vJ5tuRSO
	QED8e4w7Ww976mtJraWJtJdWNyrwGx031wLmhbAKN+Xit8KmuJ5v1HaHkUtZ7ZI79xbptYFu1Ku
	btCKIKA4sQx0TRIoCWwHJhSVsUo4nVya8duYsskilo8WQNHcUBG/eUKgtpUUJou12pREs/jWg89
	Nnj/W76Vsb4rVabiR5F+P/0ax65tnPxxskkVtaCUvKSbtUPBXXHQ+pSQ8itEWDodzJ69bay2358
	Ch+xD5FI4mROGe6qq7ADfXgYOUuPpxnXbcC4DJJFabylijkIr4hmu9ysd/Ok1L2vpjvktUskv/P
	bPpoeV9t8ON7rCDk42CeO22fiqx8Sdwbk1RHI3zXbj0vGZPTRxiy+i8qEkqjzH98PLtt0HDP+Sc
	7MXkpMql+ZHrdI=
X-Received: by 2002:a05:6000:2c08:b0:437:67b5:9bab with SMTP id ffacd0b85a97d-437845b39ddmr3759433f8f.56.1770822222071;
        Wed, 11 Feb 2026 07:03:42 -0800 (PST)
Message-ID: <4304e4a5-c820-4673-8ff7-bbfdea54edf6@suse.com>
Date: Wed, 11 Feb 2026 16:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/16] xen/riscv: introduce sbi_set_timer()
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
 <3b102fd2267c629e8505631277efc2eeae5a1a6a.1770650552.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3b102fd2267c629e8505631277efc2eeae5a1a6a.1770650552.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
X-Rspamd-Queue-Id: 8FA8912568F
X-Rspamd-Action: no action

On 09.02.2026 17:52, Oleksii Kurochko wrote:
> Introduce a function pointer for sbi_set_timer(), since different OpenSBI
> versions may implement the TIME extension with different extension IDs
> and/or function IDs.
> 
> If the TIME extension is not available, fall back to the legacy timer
> mechanism. This is useful when Xen runs as a guest under another Xen,
> because the TIME extension is not currently virtualised and therefore
> will not appear as available.
> Despite of the fact that sbi_set_timer_v01 is introduced and used as
> fall back, SBI v0.1 still isn't fully supported (with the current SBI
> calls usage, sbi_rfence_v01 should be introduced too), so panic()
> in sbi_init() isn't removed.
> 
> The sbi_set_timer() pointer will be used by reprogram_timer() to program
> Xen’s physical timer as without SSTC extension there is no any other
> option except SBI call to do that as only M-timer is available for us.
> 
> Use dprintk() for all the cases to print that a speicifc SBI extension
> is available as it isn't really necessary in case of release builds.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with one further request:

> @@ -134,6 +138,20 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
>  int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
>                                  size_t size, unsigned long vmid);
>  
> +/*
> + * Programs the clock for next event after stime_value time. This function also
> + * clears the pending timer interrupt bit.

"after stime_value time" reads as if this was a relative input, stime_value units
of time need to pass until the event. Iirc values passed are absolute, though.
Furthermore it was my understanding that the interrupt being raised is dependent
upon clock >= value, not clock > value (where the latter is what "after" means
when taken to apply to an absolute value).

Jan

