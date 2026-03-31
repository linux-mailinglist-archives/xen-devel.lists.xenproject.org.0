Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL93IWtmy2mAHQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 08:15:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F4364699
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 08:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268487.1557753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7SN2-0006U7-2C; Tue, 31 Mar 2026 06:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268487.1557753; Tue, 31 Mar 2026 06:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7SN1-0006RO-V6; Tue, 31 Mar 2026 06:14:35 +0000
Received: by outflank-mailman (input) for mailman id 1268487;
 Tue, 31 Mar 2026 06:14:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7SN0-0006RI-CV
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 06:14:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7SMz-000B3q-AZ
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:14:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb6642-5cb7-0a2a0a5109dd-0a2a45028e6e-16
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 08:14:33 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb6649-63bb-0a2a45020019-d155dd2ea4b2-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 08:14:33 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43ccda008cdso1902993f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 23:14:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21eb95fsm26104921f8f.12.2026.03.30.23.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 23:14:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774937673; x=1775542473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5FDOSsiV/0KrX6PFsSaEXrl0LEpl/URcdawfdj3nnCk=;
        b=WKEdmq00b6B4ycVNYner8oHh14neIaMi0F1NQQMjBfhfQpL+JqZPhFckHACw8QMEYS
         tAs5aC0HqTDcrER85wBQycCfVP/2jKwGxZyrbcVSojrvLbci8SB5xtA7m6XivqCZ1rpJ
         xxPBCnJtM7eFsh7vhMK26lD2cnCTF6U7sxeGdotcdkxRwyLPpZ+8hZU3MJCiN+bNzt9X
         Zh3eCrsUeyFGKPolRgARiqfXqqFk8zuD881/U7KlhaJQFAKoR9Q0TnKt/eD8hkQMlI56
         9LwDnpodPlVSrDkgOcmdNVlmbO/8fX0qfmyGnsbYBBnwHSKmaiby4msLpSuzGaQA5KPK
         mGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774937673; x=1775542473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FDOSsiV/0KrX6PFsSaEXrl0LEpl/URcdawfdj3nnCk=;
        b=C5kSdCMavTazOvTa8gd7z3hr/WzDlfu4Ilt+tAmnzC7T+j+knYCeKJiAMVU1Uy3VRZ
         HG62uwDnJ8x4AsmJyhMMLDKFLBW+iQXAAGACy4LbfZ/qD42yZUxw+ljVH2BP9w9BC4hX
         ogvOtxne9aLK5iIRH/MSmAiozfRS8qWbVdmiWDORNB4HdypzWepnu4Aw4sR8/yjiphRA
         r+RzrxWGWBcOoeehzYcIGm7B+b4cxKpNe9YW9jWZTZdBPt0RoHgiAxcXhxbHLCBP4mfT
         UAKcN8hdd/gkSP8rUFin6FRINhEuBO91p1jraomrFstMpsX5nqQiMpoVk3CgexKHDkRV
         OyFA==
X-Forwarded-Encrypted: i=1; AJvYcCXpPAqUaYDMcKyrKxRwHT4ZAT3mJ//cD75NoIOcnXopCJzlp9sNL5j2CtwD1PEC0u22h8jhODZuBW0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwX5tQKEMnZuZKznCdPhPODCr2gSO3S3cQcBVWY58gywL6Kp5d0
	N98nC8TRKex6/SndYwxt1b0ag7U5B6pObVw+bOvfNenfa8UU6uIz8itlSjmaLnHpHA==
X-Gm-Gg: ATEYQzyiB+BxZj18U0jhoz8DycZMca+qsXmXmIT48CcElW69Eptw13CgantM7+VoNLH
	4VHC+2R9mdAmIAj+G/4TdKbr/UXg+8/equZwYEkmaV1VtFyVD63kYuZqJ1b+9QRTJgebiWPTwc9
	7DWV7LK3P6ugeVFA5SwxVn8kYF9UlBNaNhoowifHZXAchc7gY2WTMKM20z1JVs9SWaienbpnvYD
	VOGneGK/pvDuK1M6Gt0/DYI6TCX6GK1wvWYhyWT8a2eYM3c2fgZDKevnhMzoal3qoko03485p8U
	6K+L5vV0BVcvXiQyIgUVTU2ZInyEGdDd5xfDiqpk5UMCrb8vffjGuQW0loyUrJuC3C398GqoS0n
	FjKl6lv90R28HJLrpl7MW/jrPQ7wwMoZpd6bAX/UQUTE9IIxQGss7yS4ut32vGrBdtiowjMgjs+
	YYw2RQ+G/nGMLIkW7tPbmRnl0nHS2TQ80gKhGUgzv14m3wU90iXEZ6tjRDqlH0AdwXqt4VGDSoj
	NirLDaTdulUyUM=
X-Received: by 2002:a05:6000:23ca:b0:43b:9d69:43a with SMTP id ffacd0b85a97d-43d081c1b5amr2679720f8f.8.1774937672572;
        Mon, 30 Mar 2026 23:14:32 -0700 (PDT)
Message-ID: <16b415a9-b74f-4afe-a14f-e9d2df704eb9@suse.com>
Date: Tue, 31 Mar 2026 08:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] README: update minimum make to 4.1
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774886602.git.edwin.torok@citrix.com>
 <4bbe4e23abcd5b1b32204d391bdd593205b89201.1774886602.git.edwin.torok@citrix.com>
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
In-Reply-To: <4bbe4e23abcd5b1b32204d391bdd593205b89201.1774886602.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1774937673-43C8BDB8-7D68096F/0/0
X-purgate-type: clean
X-purgate-size: 1039
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EF2F4364699
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 18:17, Edwin Török wrote:
> Using .DEFAULT_GOAL requires at least GNU make 3.81.
> It was suggested to update make to match ~2015 era gcc/binutils, hence
> 4.1.
> 
> Signed-off-by: Edwin Török <edwin.torok@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Link: https://lore.kernel.org/xen-devel/c0ba57bb-0d86-4209-b019-daf8328b5205@suse.com/

Unless we're specifically meaning to use 4.1 features, personally I'd prefer
the lower 4.0 (which is what I have on my main dev workstation).

Also, nit: Tags in chronological order, please.

Jan

> --- a/README
> +++ b/README
> @@ -35,7 +35,7 @@ Second, there are a number of prerequisites for building a Xen source
>  release. Make sure you have all the following installed, either by
>  visiting the project webpage or installing a pre-built package
>  provided by your OS distributor:
> -    * GNU Make v3.80 or later
> +    * GNU Make v4.1 or later
>      * C compiler and linker:
>        - For x86:
>          - GCC 5.1 or later


