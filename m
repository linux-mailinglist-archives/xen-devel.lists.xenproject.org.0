Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HhuBX/fcWk+MgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 09:27:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74560630B7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 09:27:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210485.1522141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viq2P-0002JQ-4Q; Thu, 22 Jan 2026 08:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210485.1522141; Thu, 22 Jan 2026 08:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viq2P-0002HI-15; Thu, 22 Jan 2026 08:27:33 +0000
Received: by outflank-mailman (input) for mailman id 1210485;
 Thu, 22 Jan 2026 08:27:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viq2N-0002Fr-1Q
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 08:27:31 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 303ec741-f76c-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 09:27:28 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4801c731d0aso5154855e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 00:27:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804705b277sm50856265e9.12.2026.01.22.00.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 00:27:27 -0800 (PST)
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
X-Inumbo-ID: 303ec741-f76c-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769070448; x=1769675248; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xa2uxM+IG3DuME+srypNySynCcFVcooq6Q82WVDSmwA=;
        b=R+6w5Wu/ZMh3L+a/grNn1T2TlBo025vXTrqryVvbNWZxdzao+MpYMLXCWxaMnY1n9b
         MtS1rdls5XuAIu27FhpLlexMHNSCTxf31b+uQWpwHjSsSqWAsmwd+9v4PLdH4obb3PBu
         FC16Hh6Ds9TJMlJSwZjzQloYelTq+KB9DSSIKYmtDQtn2e+nMd6lvZM4XEMSILdMzys2
         l/jmhECPpSWwGyk2KA0He34VCGH/NZt6q9ZAoUqhgLcyrwe1qQH9zK8xZjpxp25/9yra
         OnrRPSjMxMpabYxOGOcWqneAYdO7syEB8lvGQAPbntcrrLTW4oZmUJpuVFyBFm5SA1d7
         KHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769070448; x=1769675248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xa2uxM+IG3DuME+srypNySynCcFVcooq6Q82WVDSmwA=;
        b=LetbVDLmz3iOqtsgTTfCIZ2EiiQFPLAP15YUXfK6glZpahJA+tNMX86Mlp6Ssmid9c
         iWS/gbLyj0bnie0/rjX4mujaFLOMvtfIcWljUumbAKwymOKvr7qlm6f7uKex+A9GxM2I
         lWVMhHQYQ42eAfjMaDzXFfA+NTyLMD3u67oq5Tr2hJj93xZCRYMDcKbE6bMKkEfj0vh2
         2PF9W/iunsEubx4kStkNAtGXjn8k7WGohNhTE1Pai5/sZ2kxgKVT805a5WamlBIriBt4
         AxMBtqHMsgS+sC2cOSA5MtiU7Vc1juzRqvljN5ATASDpHjLO309JlaqAI5QM3/aotnOR
         yxqw==
X-Forwarded-Encrypted: i=1; AJvYcCXT5+tP1ympjn10ekopL8Ev40Zm6WMLlclkrmjlbsqIRUdNelLOioefvb4LnObItz8W4HDHUOd6mLU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBSwLzJd2tEb9T2o0ERA1ZFjbafNZASBnjDB81YKFszvGLSL0x
	n1BXlzwe9wuhcym+sawR6djV1VRnG0ZVH+N9j9XFQuknJP3J17raLPplbitsfnxFeG1xlKw+kdQ
	Uvik=
X-Gm-Gg: AZuq6aJh8rTwQNUIfoAXZSirB8Qn75YbzicydWam8R8W01WP3lF4wC480h8DFAwHSOO
	MB6f+wRMSkms57g0CTM26e4gbsowjAfIvOG2pFyANuAPMDsx39WlzhGk+9iKul3ZNix0dUjvRx2
	Cki07kWXiXp9YMe8U+ZCIhF7rzUEIY6Dw/Rnf3F26UI3PjWQ9NAfEIc8t7Bc4QR75kW9ucxLPcv
	d3ODvt2IKEMYRjQzca5YuENrQv7eUouxqb3AqPUFPcyOQhJ6htTexvqkgcHRCG7BX5n25HTRLOI
	jkj9WybmmCxJydUXiLxdP97p6ObZjgdAzhY3Pofm1VovNmDCxczjgiCBZJfyb+8IhOmS8CX8Vti
	8c7s2cZwt462U43/YRqmTzD0mZt3vWBpS/7qS2I0PZ5GPHIrddUGHcFbDmBDVZI/RbBTSiIeR0v
	MXWtw+1EZTOb8/SubPRGMBqEWusrn0P9MX1YYtTF0bN8vf9AZ1JRMZ4sXE6j5hVnhpN//gj+AxX
	6w=
X-Received: by 2002:a05:600c:4e43:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-4801e358875mr284169175e9.35.1769070448132;
        Thu, 22 Jan 2026 00:27:28 -0800 (PST)
Message-ID: <5948da25-0b4d-48a5-983f-0fc9424774b3@suse.com>
Date: Thu, 22 Jan 2026 09:27:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] earlycpio: lib-ify earlycpio.c
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, xen-devel@lists.xenproject.org
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
 <20260121154757.44350-3-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260121154757.44350-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,suse.com:mid,suse.com:dkim];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 74560630B7
X-Rspamd-Action: no action

On 21.01.2026 16:47, Alejandro Vallejo wrote:
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -121,10 +121,6 @@
>              "rel_path": "common/bunzip2.c",
>              "comment": "Imported from Linux, ignore for now"
>          },
> -        {
> -            "rel_path": "common/earlycpio.c",
> -            "comment": "Imported from Linux, ignore for now"
> -        },
>          {
>              "rel_path": "common/gzip/*",
>              "comment": "Imported from Linux, ignore for now"

Judging from Andrew's
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2277362625
this doesn't quite work. As I had expected, since the file is compiled
unconditionally now in its new location, some violations are now also
unconditionally reported. (Some, checked for at linking time only, may not
be reported anymore for the *-amd analysis jobs.)

Jan

