Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMznJPB2pWkNBgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:39:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085191D79BD
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:39:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244210.1543670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx1cK-0002Js-G1; Mon, 02 Mar 2026 11:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244210.1543670; Mon, 02 Mar 2026 11:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx1cK-0002Gy-Cq; Mon, 02 Mar 2026 11:39:16 +0000
Received: by outflank-mailman (input) for mailman id 1244210;
 Mon, 02 Mar 2026 11:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx1cI-0002GE-9R
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 11:39:14 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ec09583-162c-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 12:39:11 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so25727855e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 03:39:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b4175fd2sm10883937f8f.14.2026.03.02.03.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 03:39:10 -0800 (PST)
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
X-Inumbo-ID: 6ec09583-162c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772451551; x=1773056351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KSkLSaaf6zn/E68TTmUwv+2Blx8aX8BKatFDwkdS8FA=;
        b=FviktDeUu3S5aZ2N6dtSrkpAkOcDf6Sk1b+oIoZsPfMBYbiQUDyrYv/r9G3WewQnHF
         AHeH6LtTVI9HTJjwxBKfKWynum8iHMS5D2mc1Zc1SugTQkF7cKjM5vs+CTX4UQjM49uF
         M8oidgNZhKdjK+1KQB5KMgHKtYkNpc1ZSYzYG1yHE9fkj7dpKF9AMom6MB1Im2QQBQNI
         Dpsf/WQAjI1Wy/NQJzJGOiFy16QCZSUe6J4gEJDmlFhk3W9Lu5M/ENhcH/fBSZ1TwKFj
         3Z/XhVx6ad+dFobDqe4qY90f4nUvynlQlh2/IQRWSrPg31yV3SNbV1MACoMC55Up+5B+
         hSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772451551; x=1773056351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSkLSaaf6zn/E68TTmUwv+2Blx8aX8BKatFDwkdS8FA=;
        b=MzMFw0fKLRJsbyD3pqetZFBH3R713lRg1T8nZOwuVxoSHp9EdgmFzDuDVpemKoej6l
         uNk7Da+uezQx4OvKKGTOn9uWIOrvLVJWFAoY2vd9grK9izQy8g+yCHs/VApjbz8ohaIF
         I0szL/FGG6/nfiNm/HzJ1xBlibBeNOMpYgH3NjMBRP2SmDxSQx2n1/U/l+xm349dX1aQ
         AGFTuND/Dp9ujKK9NHjrvUVaDpZi997XPxaFKb86hMBosmx4DVU9N4L0Q3bYOTfxjUzl
         rlWDy3xXq7TM4mbMjMbpK1FoD+glR+rxQdYM3thn0ebvDA6lhRwxMVlx9HUsfZMQWfKB
         JVuA==
X-Forwarded-Encrypted: i=1; AJvYcCXy+xdWZUmHsbEHePlNe08rvBC8lyxwr3L8bBY/ufj0JjT3hFF0xuiudRagS15XuIx6CjE8UwnoBNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLY+W/kAWfTpqWVNMulNXLdfUakRPOG52+pgut/dbR04Aaq+Ec
	EiqiTdr6fv7KzQGOR7C+IjPdi8O3DKAw4SNY6oGlS7EsE6MA5kWrl9GNoMU1LVfCKw==
X-Gm-Gg: ATEYQzzxU9Y71cqAC+fNwwm5efDV1wyoP6yPuMFAP05eDKO3mG5+NAMiw001m3hNlo8
	1KjQhMHTVCEVlDtH7WxUYhhHGmeS+V0yuLLy2fklQMtUIQcNJTk+gxv9PTF1yq+mV9onvFqDDrG
	Vg89nfEKqwDkSiYMoHXPJCHLsGAshgKFukvRiCYx3CJbxBI4WQL8bnuSnarE/Nge/uiZkk7d+55
	toSrdYqj0pG+LK1ExrVoZhHNi7aqiSewJlblRkac3cjzN8+47LbCgoX40VQXjWrdSxf8xmXEob2
	E56KvN8DWSTOXUXX8+/me0pfvo63W2eU66IoR0geROmtL5fHJOokeOxJfZJCfomiq54rXIiKnjU
	xdgyuZLNUxMmp5v8dvh46PwLfnvPJJk+a3LV2waeIflNOhdyepbRhnrYADYSV/xHyD0540pg/ZB
	Mdm4me7ug3go6IfkriXONVQHF7PgJkwaYeysk8Kn3soFJQ9Eg2WNbNNYSJynbkLXo5VB/fnaGQw
	QHhg9knpkZqkiLeKkrSdq8dng==
X-Received: by 2002:a05:600c:6385:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-483c9b53c9cmr228004325e9.0.1772451551256;
        Mon, 02 Mar 2026 03:39:11 -0800 (PST)
Message-ID: <b54f129c-71dd-45e9-8f31-4df322e30af2@suse.com>
Date: Mon, 2 Mar 2026 12:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/14] x86/traps: Move traps_init() earlier on boot
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260227231636.3955109-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 085191D79BD
X-Rspamd-Action: no action

On 28.02.2026 00:16, Andrew Cooper wrote:
> We wish to make use of opt_fred earlier on boot, which involves moving
> traps_init() earlier, but this comes with several ordering complications.
> 
> The feature word containing FRED needs collecting in early_cpu_init(), and
> legacy_syscall_init() cannot be called that early because it relies on the
> stubs being allocated, yet must be called ahead of cpu_init() so the SYSCALL
> linkage MSRs are set up before being cached.
> 
> Delaying legacy_syscall_init() is easy enough based on a system_state check.
> Reuse bsp_traps_reinit() to cause a call to legacy_syscall_init() to occur at
> the same point as previously.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Irrespective ...

> @@ -359,7 +363,13 @@ void __init bsp_traps_reinit(void)
>   */
>  void percpu_traps_init(void)
>  {
> -    legacy_syscall_init();
> +    /*
> +     * Skip legacy_syscall_init() at early boot.  It requires the stubs being
> +     * allocated, limiting the placement of the traps_init() call, and gets
> +     * re-done anyway by bsp_traps_reinit().
> +     */
> +    if ( system_state > SYS_STATE_early_boot )
> +        legacy_syscall_init();

... I wonder if simply pulling this out of this function wouldn't be slightly
neater. To me at least, syscall/sysenter are only a remote from of "trap".

Jan

