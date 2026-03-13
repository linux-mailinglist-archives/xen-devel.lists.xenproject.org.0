Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKqyDuq7s2nEaQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:25:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E011927EC1C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:25:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253320.1549598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0wtc-00082u-M0; Fri, 13 Mar 2026 07:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253320.1549598; Fri, 13 Mar 2026 07:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0wtc-00080v-If; Fri, 13 Mar 2026 07:25:20 +0000
Received: by outflank-mailman (input) for mailman id 1253320;
 Fri, 13 Mar 2026 07:25:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0wtb-0007Zw-AV
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:25:19 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8f60740-1ead-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 08:25:17 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48534b59cf3so16380205e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 00:25:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4855638cebcsm31565965e9.0.2026.03.13.00.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 00:25:16 -0700 (PDT)
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
X-Inumbo-ID: c8f60740-1ead-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773386717; x=1773991517; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fBIM0cz8SulZ6LTCbPlvvw+7SrAlHgp+BnCEcAiWuAI=;
        b=UUAmrVkuQDcXS7LQwzF0yX/PIpC0ALptV1E13sI8jfP4S48uNhbLLWfz8D/k6fSiMy
         qcOV6e7reDgsrRzACY8xJm8CYsVA7pvhh4lflg65GR6Zed/EmiwEbsZGLHEQBzL2ZoQO
         sUeE1P0k1TL23dPwRUTIMpYoVLiHnlsPUPLCQGOHC4zwYNiZqI/ded1c2vMjTAQgb2LG
         YegaKg+Iqo3hiMOzinUYcT3/L0YZlFfVzASP1s5hfxL7b1UnD6KGIXV52/sQxElHlHbq
         bKR95fQbNZpQJZCDluhmJoZFFVMOlrGI9gDMoUSdA7cc0rQJQEAq4r6MVTcbt/TTfJjK
         6UiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773386717; x=1773991517;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBIM0cz8SulZ6LTCbPlvvw+7SrAlHgp+BnCEcAiWuAI=;
        b=USSn+nfKKASsooYxqGFoPK/zRCZcucaXlFmnXIMwIvfz3/giM+TvhKQ0LgZhmlgmRG
         ebP0UNxbt7ydbJAfIVyL20jfmb+SQfF+cORqJ/efbxMd1FMqSBAUsDf/kDKrhRBDLS6K
         WtP8uQ7SsNlyQlfhsZiBOhq7EQWECan1zJXJt8TydQM4AYZFN+GMPzN2kWBX4Yo7luDn
         riZcgkIXLOv5QSadntbvdzQR8hB2PJdpBLLaXXo5cTou7nWWea80NLaf969kCwjlD4KK
         Bwiz/EpheZGsNcnDFsjdGiYU6tUSvyg2Qj8MVHM5mThq/IhiRJFQjElIwP3bGn6vnNea
         mC7g==
X-Forwarded-Encrypted: i=1; AJvYcCXBqya9l3ETPm1ct7GP3+4nlJ4nak/lgEAnzn6tbOVzXgS0boCLcXkVulf4cXW8w6slRxvdkEBG0dw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7yzJfdnQEIgc5bcgwvwgHX/wjRBe6TT+aVWE/pCdIjGCi1Wus
	LbUifYja7A5czJB/VgGCOcgEJE6IRwIiPBI444s7XMt5QhnPlTyTmshWfRnZuAp3QA==
X-Gm-Gg: ATEYQzy66Ymv2CkfdAox7qGCpYjoZYgwnB3MdO9Iz5mIu2Rbdju8Bncquxk4le7SN2J
	iEhLOdGmPAMELVMpoVEQ+4rIHyYEh5KpODIzsngk8VhhIDtkRuV/ED7rcwuNS0uMDdnricFjfsY
	wfEaIUZA6si1iXhaoZuE37EADjxLSC0H9KNbaqhlZyAQThMJqyYx/MxopH7QgrJG//eyFbSlJKB
	DMfvziiXtV7JmZ3/joqcl2ao/ky4w8whn50yNy4714ouJwUUx+GJIi9ENBNzGR9T6VVwwSVFB5z
	HzdlKqxr88HoovHpP/2957YvlralWRUzf4RRZQQYb+UqxjFQqr66A5NM+tRVFp2H+INvtAoFBQT
	ELqQDXXBHaj7vkn2+tP6kmPmc5X+5HcJuYFZzBYN3vIZrCTPNOGCQoTXzSNPdPsuXPN5xBvZ3MV
	sFz0epqtB6PCI51+TUMdTQwzu1Al28fjwdI7SpvUB/EMU8yUeLZ5IninQg0onJQKfslhigrM/qd
	qnlfO9/U+ritPY=
X-Received: by 2002:a05:600c:3b14:b0:485:3aa1:a7f0 with SMTP id 5b1f17b1804b1-485566cfbadmr31426855e9.4.1773386717086;
        Fri, 13 Mar 2026 00:25:17 -0700 (PDT)
Message-ID: <867de2ae-4eaa-4e39-abcb-5f8b824e37c9@suse.com>
Date: Fri, 13 Mar 2026 08:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v v2 6/7] x86: Remove x86 prefixed names from cpuinfo
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
 <20260312204339.740403-7-kevin.lampis@citrix.com>
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
In-Reply-To: <20260312204339.740403-7-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E011927EC1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12.03.2026 21:43, Kevin Lampis wrote:
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


