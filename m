Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ1POVR1lGlmEAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 15:04:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B30514CF1B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 15:04:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235056.1538097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsLg0-0008S5-49; Tue, 17 Feb 2026 14:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235056.1538097; Tue, 17 Feb 2026 14:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsLg0-0008PZ-11; Tue, 17 Feb 2026 14:03:44 +0000
Received: by outflank-mailman (input) for mailman id 1235056;
 Tue, 17 Feb 2026 14:03:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsLfy-0008PT-Kc
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 14:03:42 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75f4f2af-0c09-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 15:03:40 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4362c635319so4220577f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 06:03:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5b07fsm34046327f8f.2.2026.02.17.06.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 06:03:38 -0800 (PST)
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
X-Inumbo-ID: 75f4f2af-0c09-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771337019; x=1771941819; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lZKv+8xd+zkVjhnxLenUQp08t+RbtHIV9T9Xb9tFu38=;
        b=HGQdyfkVQNNnt8F6zfY6U4YW12jKpblMEcEjcuJ4A9c8lW1UhTqqD3zBq9IeeoYRNv
         nSKj/g27oMSqdYWbC5CnI7rRiScBUZrkNRDD540VqPB2B7kBfc5aCtYauQY1825A+2BZ
         Ff3v0SLdPM/IvGRkKe6vt12K7HGuFM4jDTJWDMSYBcwFjZSa6fCHI7cWq+N2nfk6YS3Z
         WQsVPhR6nYSH30O3qNA4JQnxKxIfoP+pbBQ/0l7O0Ei+QU4dye5Pi58IlcoJ3h3AD8UI
         EdukQFA7NIIXa3cG9G061RR9v4uhiaI59yFDUXTX0x0Ij3OVucIKSPxV4p2NBjfzXMHm
         AECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771337019; x=1771941819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZKv+8xd+zkVjhnxLenUQp08t+RbtHIV9T9Xb9tFu38=;
        b=fPyennkzcaVetNW6LHRG7NBDpRVl64Xc+V61nUXuS26EVqZgdi+N6iKuBb9l4GYOaL
         FV7dkDxRdV8rzXNy2KcSy8zF86SM8hW6cNIQ8I+r7Zjae79uh882hGdZ6GoSR7C3Ib+s
         moUmLlcf9i1sJWWqd+IWvuRQKMEn0bcH1CO8T2U2M7cPDq1xhoTUCJ+QyzSIr0wkMfNI
         amCmWOl3A/4Iu6dBI+H/7GSuuGPcohrOHDUFYVmOSOqTq9ztxg/bifeKuwhaUdnnD7JW
         Qu1FEcMif2x90F3qGmdouRI1U/cpLjVIUcrc50Y5NEdBRmenCkYK24UIsCgZrrkrM925
         GgTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbBpSLM39C+4Uu0hB8DOAMkHTL4r/1gexQFKKmdfnDCGJQ9KIr2Dx1gyHSBOJJu4H4xgiE8fMfG90=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9qoYFISNE/goeFTiyqof+uuCEmMoM0STENi8TX3LM9pw6TJg4
	FrQT67D8cjFRk6FW3q18oLpmVay7Vz39260AgDfHtF1pUsbFYLh1HparpNfj8Jlq6w==
X-Gm-Gg: AZuq6aLY3eGHesvsbUWomhhhCAERlLm+Wf7sq3uXnj5lCi+toZ1UXdplGfH6NGlmdtI
	ubaX5YMI+YCGI61QQ0KuksRo/7eJeZwbHj06RaG6PU/9Vnv6FbTmwwJgZNyiLUHZwKEedWygycr
	3NpNxWLDIeO853k0or6u4WNgTidWlvEeyca4yWh5IH1EXRxBW0fCQlNYDMfLVQ2eBUBTgUn6rQ+
	yauXlz8ZjNmHACDetlmZ2272OVeagRsomlrsLE65E27cwx/BmcasotQIrPCLkG+B8XafxOHjgyT
	RLq7FoWDMrhbwsePda9wtHkEvQNRdtwbTRQlUSYr0x243s3XffWOGpOquHFLBWzd/W50KNFH1y5
	qlFeUgTn6UEUrjsQNy2PNPRwpzMfKRz9/qkyO0y7RItw/ktpM7OM7R54dCD1yIOovA+RZLp6PZU
	GcTuwf12eJDwGAFaYtfbCtn10kXVkNTVHGXtUvrakrzYMrXiyHv6bNONiC3qXWt0o7VmPJbBI30
	fsWUe25XoAp3EQ=
X-Received: by 2002:a05:6000:2403:b0:437:75c1:578d with SMTP id ffacd0b85a97d-437978c792bmr26727236f8f.11.1771337019244;
        Tue, 17 Feb 2026 06:03:39 -0800 (PST)
Message-ID: <f2aa9384-dab9-40a8-9c21-2c746cf2f780@suse.com>
Date: Tue, 17 Feb 2026 15:03:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/16] xen/riscv: build setup code as .init
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
 <d2fcbb9248ea1659aa953e9c8a8bde1c4a2282c0.1770999383.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d2fcbb9248ea1659aa953e9c8a8bde1c4a2282c0.1770999383.git.oleksii.kurochko@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
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
X-Rspamd-Queue-Id: 5B30514CF1B
X-Rspamd-Action: no action

On 13.02.2026 17:28, Oleksii Kurochko wrote:
> At the moment, all code and data in setup.c are marked with
> __init or __init_data, 

"... which is intended to remain this way."

Nit: It's __initdata.

so leverage this by using setup.init.o
> instead of setup.o in Makefile.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
(once again happy to make adjustments while committing)

Jan

