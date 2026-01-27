Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLYfCJ7feGkGtwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:54:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 818109728A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:54:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215039.1525288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vklO4-00055U-3F; Tue, 27 Jan 2026 15:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215039.1525288; Tue, 27 Jan 2026 15:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vklO3-00052j-W7; Tue, 27 Jan 2026 15:53:51 +0000
Received: by outflank-mailman (input) for mailman id 1215039;
 Tue, 27 Jan 2026 15:53:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vklO1-00052d-Uz
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 15:53:49 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dd4609b-fb98-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 16:53:47 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4801bc32725so45708945e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 07:53:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066aaf235sm66902195e9.0.2026.01.27.07.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 07:53:46 -0800 (PST)
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
X-Inumbo-ID: 5dd4609b-fb98-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769529227; x=1770134027; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yy4TcRbI/GABuiyGc/RtiUpMaGZwNRoKB1+ggqxbCHg=;
        b=ILetlNCwm+numpjyNgfco8/ZA8ysjPZtm8hZnECS34JSuZXKhrzL3Emmv69JjW4yMA
         kBO/JjKdxaY/N+EaL+K2rJMjurWiJlcwK6gl6/NokeT7Tkt9KDLq0fu/N7PeQnYs98Bi
         bJRDHl1nX5/SkjzzGZZz/um59AE+NwhnKdcmyUPFVUYIEFwkrs4MzuFcThrgZz7V/m6v
         EDyPkx5T5UqazNJ9Z353N0jqzoRfWgpQIAge5Ax3tXbIkltAgjeisM1m892s0GuFUErK
         MHZGBMQsIPBuicV8+LPJ5yVvCsjn+KjuVKxTMIxg7r1eU25uqmlxSg4GZOB1tjclvf/Y
         6EUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769529227; x=1770134027;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yy4TcRbI/GABuiyGc/RtiUpMaGZwNRoKB1+ggqxbCHg=;
        b=BgIy+05HQFB7qUooOyT9gvATVq57R7uH92sRpnTRUo3/tRU4OTpSOAnAQSMDRs6TGO
         WfWeuLz3nQw//E36L8PtLI9aYKHRuuNK443SfSEbp4k1GdoUNXPw0DVAK59eP5X5PYNU
         vlktyCDxnu71GriOipNoDVLfIiXiavooEb4AbTiVd4oZn9obqwoLIxluF2oEZx1C2gdo
         HL1aViBrD+18Bzzm49H78CJxLP51u4CuDmezxjMVKeQNjjNAYH76HeebJCOFuwdRhaIU
         LQGbZ8CdSc/l5yimekvYKLA5VlxbkK3dn6/VSPZcEiZuVdZ2JsuviSIBOFPkDodJHcRh
         R6gg==
X-Forwarded-Encrypted: i=1; AJvYcCWSzGVw5jLN8xxfUcd6dBUIqBq1mdWnXdu/WNmtMMncpdrZXObKCEup0GczWw8qi4GMIGYt2OxrehE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywnfi7t8fHhcmCAOev03BxaL7KvyntZpZQfTnNyTr3MICXfPSfS
	Yh8WcJn7k8kF2e2K6DYif6HAojZbt9PLTYaH99498RC7SQY5VCBdbXGxOvTDYdB81g==
X-Gm-Gg: AZuq6aK8eFc20Ul+V0Um3ydYRCUP3xJxW1Ret6Ev1TGkeboF2nNydFgsD5Uv8RTDWo2
	QH1Ar0bnY1w9xQvUCabbS5gUSxcpNYW2V8f9AmBx/gs6NHeDdVbbEB5b1MRRSduv/sChj53wWs7
	95wQLSfzLTfM/4bgFyKNRm4CR7sPizN5iwQW+nkDrgskMOArxVd3SAmZLDSBSjuEPrYup1511lV
	/+E52QW7a5r4jOKhg6eEYs9SLgL9NTP0WKBNTNcwU5x+hcEfH1MJxMlfvLQWIDtAtorW3kJwjD2
	QToE8rR3y/dNIGu6uZuf3SfJdQUfq3c456nM4gfqvnu/vIy4t5etZKIoS+EDYAxlk8kqPljZcpr
	rWXZlQVeebblDIKh0hv1SRY7whii67jrraHigi4KT1JjibjrMeOkIKu0wKNC3lRrPoHJCOWEkiB
	MftZdwE6cn9tQeUflfNQr+k2p/nvqTf5NXs3tQtPAPylaItffIXLq4PbihxqEqepTliNmNEiPJi
	QQtRFfjixjc/g==
X-Received: by 2002:a05:600c:154c:b0:47e:e9bf:dd8a with SMTP id 5b1f17b1804b1-48069cb2fddmr28911695e9.37.1769529227201;
        Tue, 27 Jan 2026 07:53:47 -0800 (PST)
Message-ID: <99440e40-e49b-4101-9074-0be74651d3f2@suse.com>
Date: Tue, 27 Jan 2026 16:53:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cmpxchg: Add safety for bad sizes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260127102351.2215346-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260127102351.2215346-1-andrew.cooper3@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 818109728A
X-Rspamd-Action: no action

On 27.01.2026 11:23, Andrew Cooper wrote:
> @@ -66,6 +68,8 @@ static always_inline unsigned long __xchg(
>                         : [x] "+r" (x), [ptr] "+m" (*(volatile uint64_t *)ptr)
>                         :: "memory" );
>          break;
> +    default:
> +        __bad_xchg_size();

What has come of the plans to emit an assembly error directive in such
situations?

Also for Misra's sake "break" will be wanted.

> @@ -106,6 +110,8 @@ static always_inline unsigned long __cmpxchg(
>                         : [new] "r" (new), "a" (old)
>                         : "memory" );
>          return prev;
> +    default:
> +        BUG();
>      }
>      return old;
>  }
> @@ -137,6 +143,8 @@ static always_inline unsigned long cmpxchg_local_(
>                         : "=a" (prev), [ptr] "+m" (*(uint64_t *)ptr)
>                         : [new] "r" (new), "a" (old) );
>          break;
> +    default:
> +        BUG();
>      }
>  
>      return prev;

Hmm. If for some reason hvmemul_cmpxchg() ended up hitting either of these,
we'd immediately have an XSA. Imo these want to be ASSERT_UNREACHABLE()
with plausible recovery for release builds.

Jan

