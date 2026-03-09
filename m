Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id F6gfNYSormntHQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:01:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B392F2377C4
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:01:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249265.1546736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYLm-00034C-7k; Mon, 09 Mar 2026 11:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249265.1546736; Mon, 09 Mar 2026 11:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYLm-000320-4t; Mon, 09 Mar 2026 11:00:38 +0000
Received: by outflank-mailman (input) for mailman id 1249265;
 Mon, 09 Mar 2026 11:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TKtW=BJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzYLl-00031u-Bh
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 11:00:37 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 333eb847-1ba7-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 12:00:36 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48539d21b76so7931725e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 04:00:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4853438017bsm197421125e9.0.2026.03.09.04.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 04:00:34 -0700 (PDT)
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
X-Inumbo-ID: 333eb847-1ba7-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773054035; x=1773658835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cA8i4u7EhErBXPUzNIm8vTS/NqpkxaK6TrJ/JPQzfVM=;
        b=SRpJQcf7oCrXqnKUnjbAVX0zJVuYXCcRZ2GeAE5Lu1yUi+7tqfjnqH8Yh8mywzKuuk
         MFsKVATbR7TgLxozdbUTZYawspuO2T1AOByClFfrldX8TCKbngmWN5JBghcuLS3ziYX+
         nr+YHQuy98Er9HhNVubuB3uP6nW56drRjV1nP/k42CfY1y7cVHxRse5iGOJ7Tx/Cpfka
         RPmuzPVdjo85hf4V1GCYCiV3b0RhKVYpsaR28umWCaI0dyLEHw/loy74FT3y6IDhwsif
         oQ6R7DlCj5wGOmn2MpbNWucIZQtjhdBOd0aJb2xBsNLUCC2IKMtvUsqE12szLprS/vaH
         DPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054035; x=1773658835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cA8i4u7EhErBXPUzNIm8vTS/NqpkxaK6TrJ/JPQzfVM=;
        b=AVkgghhjy3YOcF8cZ9BsUtgfPpLsC4wqSlungcxzNzPCmvhlWzynSZYt3jXxRZdeNL
         Gk0mYx4JmN+Q3uF31giwKtHqkaRsN/PAtJrv+VXikI+4lhF+AEPL9aYE87OxeqnwOqUz
         2LogzIxLyJlquByh6q+ZKe9hLO0FIRvE2FMA2Xycs6bzUdX0B+CgwXpycDqCMTQjhMB4
         PEGtNiEodbY34QLXR8475knjU1wFfgkF+eyHdqpQxT/0CsrDeG7GQdNjal7HAvi9hFdv
         ZVwVYXOdt7hQ+I0p3veCRm9LwFmMcZ7OKIRsIw04fVFexBALQhPZvFsiJ5z3hhURYyQ5
         nmQg==
X-Forwarded-Encrypted: i=1; AJvYcCVz2MffjJil0lDwDxd4+84+G5x6DTzX98W/qEv3bEAVFWEh+2SwTpx5Pte0Jc/o0iPMq3NSIPFb4X4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywz5ZXn4w+EpEMeuHxOBslvztnHQpNVShn9YMPAuRtylyK0g+kD
	o1Ka9lbVQgM6yOkf/OJqs9+K0Yfr5cUTzwAm58fbV/LjZtJ/b8r/PQZhg95N00Xm9w==
X-Gm-Gg: ATEYQzz2xRKB4ep2Yi9+CihUWLPN2ZW9EjrdV+zQcZUCUV4yLAx0MIsnq0J5HxP0oRE
	BXdO9w2zWJSMVKVxsz0nK1tnFiZW1AnSwuQ/W7ufJqSrNzH37/z6pnTEvECrHiiCp26oPv8gmtI
	nBLqiW/PhIfznM7wcYJn7TEYwewCT+L0IRs6fqEkAuDM5TEfeUnJtMK0fbAK1sso8veSba0E0FB
	V1tqNigLIE2vYHzm/fbEDWCvgIupIzc+159DpQ8ersOkmwVKmMWPRVejXRLIyn528VbQU9iEVVV
	e5x6D0XgslSfcuk5oPmZfC68N86xTj8eLdJai5D/oi5Hz0KzSJBJUwMnC7pdf5MOGLbrTZam8Sl
	pcMkyWNBo0PpscKo0hMY+cPSQYUdQeenG4Iklx3qpr7bb4BbcsezExg1p/swo9IRBDktn3Xlw0p
	jBmk62dvyCOR93IfG4WOlOK+muP2OaTkrV+LCzC/YQyCBo8W6aTMIwvLqxAhOPC/X5f9q4wLSCO
	TGbC0CJY5oXGzs=
X-Received: by 2002:a05:600d:41c9:b0:485:3911:b8c7 with SMTP id 5b1f17b1804b1-4853911bb1amr57874885e9.35.1773054035081;
        Mon, 09 Mar 2026 04:00:35 -0700 (PDT)
Message-ID: <efb5bb8b-175c-4efd-8aab-668b0664795c@suse.com>
Date: Mon, 9 Mar 2026 12:00:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tools/tests/x86_emulator: avoid duplicate symbol error
 with clang: use -O0
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <d0178858e5f3ff7a8b64e822b55c6179adc92ea6.1773052835.git.edwin.torok@citrix.com>
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
In-Reply-To: <d0178858e5f3ff7a8b64e822b55c6179adc92ea6.1773052835.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B392F2377C4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[citrix.com:query timed out];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Action: no action

On 09.03.2026 11:41, Edwin Török wrote:
> clang would duplicate the loop body and end up with a double definition
> of the symbol:
> ```
> /tmp/test_x86_emulator-0f3576.s:27823: Error: symbol `vmovsh_to_mem' is already defined
> /tmp/test_x86_emulator-0f3576.s:27825: Error: symbol `.Lvmovsh_to_mem_end' is already defined
> ```
> 
> Until a better solution is found: reduce optimizations in the test runner.
> 
> Using -Os might also work, but we can't rely on the size optimization
> always avoiding the duplication of asm blocks.
> This is test code, not performance critical code, and -O0 is more future
> proof.
> However for debugging -Og is recommended over -O0, and this still
> avoids the duplicate label problem.
> 
> Signed-off-by: Edwin Török <edwin.torok@citrix.com>

With the subject also switched to say -Og (will adjust while committing):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

