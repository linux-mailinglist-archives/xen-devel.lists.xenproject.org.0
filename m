Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGisM2CNnWkXQgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:37:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 406AF186644
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:37:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239919.1541324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqif-0007uZ-F4; Tue, 24 Feb 2026 11:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239919.1541324; Tue, 24 Feb 2026 11:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqif-0007sD-C3; Tue, 24 Feb 2026 11:36:49 +0000
Received: by outflank-mailman (input) for mailman id 1239919;
 Tue, 24 Feb 2026 11:36:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuqie-0007s6-M2
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 11:36:48 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19587479-1175-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 12:36:46 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-483abed83b6so20596455e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 03:36:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31f0330sm293692385e9.9.2026.02.24.03.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 03:36:45 -0800 (PST)
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
X-Inumbo-ID: 19587479-1175-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771933006; x=1772537806; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wcbfO0w5mD2tiYoO5vmB/C+XiaP1k8VsTMZP7q+TejQ=;
        b=V1CAlrrUD5X7AM+fivLpamSLes2SPwuVw6C78GSM+3n9yjG//yyJ60K8grhF1UAhbr
         Hnm+gjTrLy2z14IMu8t8EUdKxH4GG2XQnOFxdtRcXhtVZyivbPzJ4SfsXazZiHnuA5Ut
         5buERTRarI1rn2J5uka4VrM1bXCBZnSzG5x4iIcfsRNH/xJAhi+EsP9F9fFqNq4vjQ/p
         ca/cjGvERxsiga6VH2xC/vkZ0dbwfNCjIYI4QtTvDBQpM+8+05VPzeNsDUFHTB8TbYPu
         4HRjT4W4dUGZQbJZQ9xjNHFH21S3mqbc90Nzyxv1DX2y/YvOQyHRAagzHau0Q/FgmCID
         axXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933006; x=1772537806;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcbfO0w5mD2tiYoO5vmB/C+XiaP1k8VsTMZP7q+TejQ=;
        b=Wd+xGwxD9hF9FnSiWK6uzRFV2D0pK8ojsikEAlp/2gbAJOLa2hY/PVjNtHFHszdi6y
         p4V9mwrVqfTlOJ2ewLG9k82EMa/xh+woKYzXVkxTgJcvNjSabB5VzAzcA8Aol7MqLkl5
         yriI9G05qs+UECRU3K8KEwsshj72K2YUpEpt6uJvHGBDf+0ICGRcoaPEBM77fOhzeu/B
         MecL+zjrEylCS6GGjGp7dNLmizdnnuP91vP9wTqtNlokz6awKvfQfr0U0PJe5Qc4ikCD
         t1zePM4VZNWGl+pNmmxxL/oxNA6mg7nsc3uS3Bw+Lf1Rp5Tm9LjMuBul98YDRsYuLCRd
         fOwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTbgxdzQLv7BQ0Pu9jlUpZPcohUCqnTLzKBX1gDDgEEcXWZEUiu8Wv3IZIfpc7vfjpc1Z7pA3/Z7M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yweu1AXT1OxNVN5eRblYznkpk/hBuiMTGW1w0bNqdpWOimHO+iY
	GX5A2p2Q8gS0LEQx/4Q1n6DJ3bTJ88v+GlDhMhqkBsCEKO/8Akx5Ek6ZUR7TyMim10bWgXwYV3Q
	QARM=
X-Gm-Gg: AZuq6aKro54qH/4drpafQZueUOM5Y8wNKpj1YU9wygNQp8eI9yyWOeJYaEpZoj/QvQw
	n5v0Moxd0js0lyYc3lWBS0Nx+a0UsaGwDqn38yNrgtsGCRxVuVJsDPd9dLfLCeEPotsDyo+EV7k
	yN/TpwC4GM3I27IMW31ljuXO+WJtePWVGHmlfGTVDWYRsDzb2ySGJkK4eMbq0KIIAf2BYyu/+9O
	0O5jy7mWGsjAQhOu3YKIt4uupS9AfpTkI+pKzbbpV3YrPMu7+t6JeK6sTNcwUUBZoKXhbMyyfDa
	FM06ALFUbKuM2QbWchVOtWvKzegD7R+7xnzJuXTaNslpEp19xhKI4NdIjlroUn/vRZf8vhBEsKY
	Wm5d74y2YKVmCOkoD/UDMQ+RCkng1trrP/tCDkCApxcwUz9a8oQ2g1PzbVACZEzYalBR+/ljGpw
	e9j82/vVL+GaHVrCZALnRBuX67VsFlSTHAy0+gybFIwj8kOBhIYO006VAqqiE0Eo8F2Ny2uWaAT
	40nKBMzvb2VXV0=
X-Received: by 2002:a05:600c:46c9:b0:483:a21:774c with SMTP id 5b1f17b1804b1-483a95eab7cmr203476755e9.25.1771933005584;
        Tue, 24 Feb 2026 03:36:45 -0800 (PST)
Message-ID: <92a9c5a3-1084-4efd-97c2-350a41167038@suse.com>
Date: Tue, 24 Feb 2026 12:36:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] tools/tests/common: ensure error messages have a
 newline
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1771840831.git.edwin.torok@citrix.com>
 <b41bf6aed1fb428fd8097c4afb414d88664b2b05.1771840831.git.edwin.torok@citrix.com>
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
In-Reply-To: <b41bf6aed1fb428fd8097c4afb414d88664b2b05.1771840831.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 406AF186644
X-Rspamd-Action: no action

On 23.02.2026 11:14, Edwin Török wrote:
> Otherwise messages from the next test will end up on the same line as an
> error message from a previous test.
> (calling `fail` is not fatal).

Will they? Glancing quickly over the uses of fail(), I see most if not all
of them using a newline. Same for verify(). Imo either all use sites have
newlines, or all use sites lose them in favor of adding them centrally ...

> --- a/tools/tests/common/tests.h
> +++ b/tools/tests/common/tests.h
> @@ -6,12 +6,12 @@ extern unsigned int nr_failures;
>  #define fail(fmt, ...)                          \
>  ({                                              \
>      nr_failures++;                              \
> -    (void)printf(fmt, ##__VA_ARGS__);           \
> +    (void)printf(fmt"\n", ##__VA_ARGS__);           \
>  })
>  
>  #define verify(exp, fmt, args...) \
>  while (!(exp)) { \
> -    printf(fmt, ## args); \
> +    printf(fmt"\n", ## args); \
>      exit(EX_SOFTWARE); \
>  }

... here.

As a style nit - please have a blank between fmt and the string literal.

Jan

