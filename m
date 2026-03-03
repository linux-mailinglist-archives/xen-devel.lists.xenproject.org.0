Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OAFFj3rpmnjZgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 15:07:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3C11F1105
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 15:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244805.1544174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxQPb-0007hg-8S; Tue, 03 Mar 2026 14:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244805.1544174; Tue, 03 Mar 2026 14:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxQPb-0007fh-5a; Tue, 03 Mar 2026 14:07:47 +0000
Received: by outflank-mailman (input) for mailman id 1244805;
 Tue, 03 Mar 2026 14:07:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxQPZ-0007fX-MG
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 14:07:45 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 592ae95d-170a-11f1-b164-2bf370ae4941;
 Tue, 03 Mar 2026 15:07:44 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso48303835e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 06:07:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b4410bsm366195305e9.6.2026.03.03.06.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 06:07:41 -0800 (PST)
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
X-Inumbo-ID: 592ae95d-170a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772546863; x=1773151663; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qTpRZslKdHNhiq4x9+zdcy+FrkRxCVCvl4abBnfa+dg=;
        b=dBMcjxhNVAW6Y0UT3L22XhdOLt2dxV+ue+6X/le4pGyWpGLt+61bi19YHLTRAnxvMQ
         gE3usq/gUJgc+xQdwitQ506xBqnYcOrGkQ2X89t/Kxedg9YDL3k5CaC7WB8SWWBzByxV
         10O5IK+nRCjGxLh88gh9VF3N9a5sFEgDRqzs6fygc2hSTTini/TLDdSctle4sIBeyCQ1
         oj5Sl9QEfHdDs0RjeuGYZMY6y1KN4B8Yl+Mzn1vBr9ixZAcRZ7SEH9aMZta4UAXv0OTe
         lGdxIL8RnNnNdrGNm7oXi/tGXrJxb4tl4KpJ5oy1CpifqcZCm2agv79kdTjqMlftlmzz
         xPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772546863; x=1773151663;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTpRZslKdHNhiq4x9+zdcy+FrkRxCVCvl4abBnfa+dg=;
        b=q157k6/sFkSow5HFv4VvPsIBKKx8XHLrF60Ewc6m7cDi2s6sCjB7WC+SiJYB+aqgWQ
         UR9bCfStLDMl582vOGBswMkGIH2i5klD9FYw/6KwAKRhw3QiEksXxTeQT1HP9L2o+Db5
         eN0Ahfjrx1yiBmiX4Xe+D3xGq1l11y4u49HdFhBAgQdrl7Lqfh8AfShktiShAO1KZgo5
         qdM5quPG9NGfqL5p6e/kw3PdJeG4U8X1ffbPN4pMfVdpUd+BmlBLSyqPGpv7W/xQr+y1
         7MWt9qCwGA0BU0CDkyzP6+JbMSwqNreVLAGGBS18yJqzT0AFEQePbmBbKjwTp/O8WkSU
         Vf3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrhLwWw5u4cddqVt/K4zDqV7+8pTRaKtibmXq5HohqfYEu7DBsT8Eq9fMi4Wge1EEnOflfrs1NzMc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3mLgIdlbqayoMybFPlCgCaf0PbZ4hhu6hxbYVd4hP7CEf9u4v
	LG951jj7YnXX0GzZHfiBN7ysb7T1puHDdzbLV9yaVoz5yZOu4BRRlxaSJgPDd5ziaw==
X-Gm-Gg: ATEYQzzfpFDQ7eWL/vtdk/RE/OnxNp8rKaSU3G8k6t3QCIMdnp65SQhYPOq1zXZvbJx
	IcJQV2BZtatvut6s2qx9X5iZTJJb9esFOvSBrKUjFhVN3AUCcd68zLVDu8xgHn6sQP6bKHZyP26
	WYC25WddNNdGr8j1K2peZB8MLoU5mv7ZHMPIsp7mkxN0ugi6tckqunjymBnMDWY3dSpgoNev9UY
	y0GjeacOUQ1KqJaQ26JOpuPe+MGH96bQTtU0q2qhbBKsIKxQfOwkwMZHxo2QlhcVt/Wmdic5G/m
	nrd5P3vfTZildpOgUpc7PyXymuNxIN0s8dvm6nZitFuVqtvj1mmWKVxVLDVaoi2NEgiPkThS0f/
	m3ad+mzaMoeVAyUSNwypSj9YrSqCgKV987+OsEB3TKs10iNEVsgb2LKwfe+wNSNwTnczdoEHyFK
	kZUfNaUtylM3h18sujbdaSwgBd7+9EOfc5jE/4yHlBDyG5A0HIQM2w4TegU3Cm4LV9lXJ2u/K9p
	cEYQdp0p2x3tgk=
X-Received: by 2002:a05:600c:1c15:b0:483:6d4e:9811 with SMTP id 5b1f17b1804b1-483c9c0b6ddmr315268175e9.31.1772546862560;
        Tue, 03 Mar 2026 06:07:42 -0800 (PST)
Message-ID: <02d59353-8d59-4151-8428-dd6458f9165b@suse.com>
Date: Tue, 3 Mar 2026 15:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] tools/tests/x86_emulator: fix undefined behaviour
 in shift
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1772189234.git.edwin.torok@citrix.com>
 <cdd62288eed6b147e6c3e6d2c402de36cf3ce42a.1772189234.git.edwin.torok@citrix.com>
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
In-Reply-To: <cdd62288eed6b147e6c3e6d2c402de36cf3ce42a.1772189234.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AB3C11F1105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 27.02.2026 11:58, Edwin Török wrote:
> --- a/tools/tests/x86_emulator/test_x86_emulator.c
> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
> @@ -1100,7 +1100,7 @@ int main(int argc, char **argv)
>      regs.edi    = (unsigned long)res;
>      rc = x86_emulate(&ctxt, &emulops);
>      if ( (rc != X86EMUL_OKAY) ||
> -         (*res != ((0x2233445F << 2) | 2)) ||
> +         (*res != ((0x2233445FUL << 2) | 2)) ||

Why the L when res is an array of unsigned int? With it dropped (happy
to do so while committing):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

