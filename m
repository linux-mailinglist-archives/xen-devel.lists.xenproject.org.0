Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLtjJZq9pWn8FQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 17:40:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 555221DD0FD
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 17:40:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244492.1543953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx6K8-0003Tm-Lm; Mon, 02 Mar 2026 16:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244492.1543953; Mon, 02 Mar 2026 16:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx6K8-0003RZ-If; Mon, 02 Mar 2026 16:40:48 +0000
Received: by outflank-mailman (input) for mailman id 1244492;
 Mon, 02 Mar 2026 16:40:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx6K7-0003Hu-7a
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 16:40:47 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fdf2a6b-1656-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 17:40:46 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-439b78b638eso1199588f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 08:40:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b55d15besm11972879f8f.30.2026.03.02.08.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 08:40:43 -0800 (PST)
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
X-Inumbo-ID: 8fdf2a6b-1656-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772469646; x=1773074446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AKyX3ptxeTzIuEOXF3s2i/pde3r0AGZiyoKUzK+X92c=;
        b=dqZ4RurYV2DF5tGl04rSp4W2yDKjYtcvbZhcGX9CO0kIxrEQKFVVIKVSAIVPhpwvx5
         94UOgnaBSVzCYaO1bIKXDIFVMmI47d+00vAylXXAPjZwsrVwI3+k0DKacCR7JPFxaEcx
         0Z5eKzV1YO1T0ER0ic24eq1IGdgIkmr2mzmvgCzi/k9FMSo1GcStDEmo3L2xy2jK1Th2
         aXf+HM0E+K89Ack3ZTkCCkh8OnStPiJTDEkR/CWVcON2qKdA3kKk8MqMCm6eeHTwKsuN
         5DP7GRA2P72N4h8H2bki80YHXVeBRfDJ87crlw7oLuze/Dr/asZ/R5UE8FYRGzaCU2T0
         AJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772469646; x=1773074446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKyX3ptxeTzIuEOXF3s2i/pde3r0AGZiyoKUzK+X92c=;
        b=Ivm5mJyjijrfOg6wG3dVkibUOQ1b19QJM5gf2Q66hBoI/yi1f8M0flarL3BkzQ9q9r
         /drAmy3hHk9+npirR/b+gQGSxp/d3IaEPbJWPcju/ZSojLgLgxrkleBdIXE9uhCpCW9w
         JgQwRPH69ru02ynCIMwMP5VHWSbk+qGwqVHAaPG5BTC4hIwc6oB1+P6E81lQ948qJA+Q
         Y98cE7hR2CCoDYpicg3DmryBfwDmKR4blHTs18C1c6UBjokOY0F6I9Cid6VhhoMlncye
         4ZagvAxVyvlK6TBz8n9IgoWhXuvtGYpSxgxdw/vXTJZc29QQdxoXxFvj+gvtY6YKrZUy
         NTJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNgNP33LHPGg1nyAy5IXPHbym7x2sPX36AMqzW7aZk0sHiVNGbvEawq9qapUotC1bCV/hGY95qpWA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEWLm8eu07p2fY6HHjtNOy/pZcIdvFcP9NEDQF5v6l/bgGBRr3
	ULamb6/3sB8otJJSMwJEeIuLeEke39Ga5FSLOQQDGpvI/3UYkRBYrhHqFKfMXjlxU4ODgD5WcCH
	vm6M=
X-Gm-Gg: ATEYQzyfYY9wGvqRheYINlj/msOibsyz2KmKWMMJoNv1cYvdxYlkU1k/BeCHq0Yep+T
	dpO28OP9BCKfJMYLy2ajwW8JYMDTo+yt8yPAxGsHcccepYTG7blEzws2MC+kNwdUgna1t4DKo5V
	k5keePe5HskjeonpDZrLrORnShRxDp5AQ8LZziyyzz9HQGTxGT3gGT1wdTqILEdjHCUrZ7j2jcb
	lGRAQcIKHibP/DZS0UhpKBLO5LKSIyPXyhjb512qVE+l9Tqlb2FVddTgztGl96glBpouKg3jE1T
	Q4LPeYBmTYBKF1W8KXFNNM4L7VJqRrz8yV7u68GUe348NTDAMgx7Xn/zdNOi7yB21zAHKFVT19b
	ziXkWlKpErxC2Sns04nZT1CgS+uc2f+PQfkXZqnniomqfeL0YmeWcViYLpYPMEhD5veWOncYbda
	iM8tusy0690DG13qi7TnZ7hY0ULYOQA4MYsnwzZLvCmoiNzhXh3AhF9wyPeg1GXdU8OOiqi2fnI
	q+rrh9kYb/Dsnw=
X-Received: by 2002:a5d:5c89:0:b0:439:bc31:a056 with SMTP id ffacd0b85a97d-439bc31a2f8mr3682030f8f.51.1772469645681;
        Mon, 02 Mar 2026 08:40:45 -0800 (PST)
Message-ID: <ee77803f-8997-4f9d-9d65-1e16512af71b@suse.com>
Date: Mon, 2 Mar 2026 17:40:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/14] x86/traps: Use fatal_trap() for #UD and #GP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-15-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260227231636.3955109-15-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 555221DD0FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 28.02.2026 00:16, Andrew Cooper wrote:
> This renders the diagnostics in a more uniform way.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


