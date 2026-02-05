Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FxZLOayhGk54wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:10:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CF4F4700
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222099.1530137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo0zl-0007AO-IF; Thu, 05 Feb 2026 15:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222099.1530137; Thu, 05 Feb 2026 15:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo0zl-00077W-Ex; Thu, 05 Feb 2026 15:10:13 +0000
Received: by outflank-mailman (input) for mailman id 1222099;
 Thu, 05 Feb 2026 15:10:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vo0zj-00077Q-Ib
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 15:10:11 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2a00024-02a4-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 16:10:09 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-4359a302794so824597f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 07:10:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e25e8csm13005818f8f.1.2026.02.05.07.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 07:10:07 -0800 (PST)
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
X-Inumbo-ID: c2a00024-02a4-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770304208; x=1770909008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4WWGzM8AGKjwXOGwWw8MQyUZqxv1kgVP3Hqg433Uf3g=;
        b=We/hL3M44txNTSaPmqwoRzSqRMxhpEIpcyrH64dwiSIbH3CuqDNTt9vpXxEWmy1ZGO
         /v798AXfyzOuxlsvDIBVbNRNjqoql/36Gzn6CCrSZzc7WmuJ/t608af5YFWZkHg1tmgg
         t4MI73JC5XG/YY6J0MEDdmpXgyQSFglyT7nFacHdZA+/qEnHe+hScNem+kfhM95iuajn
         VMhtif3CzttoMDKROarrZ3P5CiBKYzjY7AUarkx0Ku3p9gtSPBQ0kH5dNDio+Swhlq4W
         gkvSZQovJcPAzQMYc+7y7jHaCznn0gIXaDi7JkPqtsaQ4o7jzUblFp2IokV50hK/g168
         j97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770304208; x=1770909008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WWGzM8AGKjwXOGwWw8MQyUZqxv1kgVP3Hqg433Uf3g=;
        b=MYoSrjwIiadrIy/kC8WRHt1mDbkSlvAMDXXeqDSSRMIpKv3nsrEEhC8opCw2/IyrZR
         IB5ZXA0v898JfyLQgWv9qrjXh85etsy2uzf9z04ELh60baJuK1wCq8wYWtRoxAw6HvhE
         +EMzhgLOZbThELwXd2ZOLQIdzoane+WllAFEHgGdh1ujC8Brg4w04ExJXHCLLaxdhtuc
         k22wjrRU1+zD0Y1ElYw8K63VSI3RJDlrqB2tXI7UVgUI9dbDXJpsxSRRnxosML9LMogC
         wVwvL/qcvksRUQoJTbSSJgWx22LkViZru1EyBeLqOXPU88qRm0keGW+kybaXG20fn7u1
         1kVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3pipvod+Uq0E8Pb5Z6hz+mHMawjTE8d4NDijxT0dAZBbmNLtZTf0oXvx0SOJ0xgLC4pYQZhHNc/o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYRK9oUu2KDApgsvpeBXvLonc4laHgc+RGzd5gtpR18iROK25J
	dRfbMkbU9LRCtp2caHpIRjBRnSS1gvnuIVBNpiXNDhLEKsqU56WQpuKzrQNN9dSzPw==
X-Gm-Gg: AZuq6aJJXV6uhtPmCL3HfEaOG5TPaQcJTVxcreve4f+7LJaU8hN1SB/8QeH6wwdu/oK
	PXEUUORIPPITqkNtsVEADRdia4u3wK4wGff5gMDmemtJnqzW4iEDqiDbqFRpq+0/QHmdsOR3Y4z
	x/D30o4qtQPsILY9P1IU+53npc0HFFox8xnuyk1wGjTAwoyKv3xugzskyXV1+WmXH7zNHqJmgJ9
	VqzuZN0ceprTeCQxyofJePcYrS3dd1I6DAbSIX7+4mBu6b4VaZasGxFzoVZMoGO4MRENt5CWakM
	UpN6r5700lOUYH4xTmPIKkEVQj0VaRW43LElqWvoHnVRg1gJvtAWzgtkMQj/YOaE3jHGC0Jdnpt
	2GpxL8BwA+ry6hTqf2g0/Me1NsWOB6pzPzp0XQ8EWD5KqISw37hAObzZe46d70GXfN14hgyEXqh
	CT+CvGq6ykbWDSEHrGYofp5hiyroU4DDgEK/Rzle4uZIw2Zp10i8XX1Af0QvTrSh9IrQufLxmkk
	uo=
X-Received: by 2002:a05:6000:24c6:b0:436:23a2:5e32 with SMTP id ffacd0b85a97d-43623a25f2cmr3561201f8f.48.1770304208463;
        Thu, 05 Feb 2026 07:10:08 -0800 (PST)
Message-ID: <2038c5c4-c542-4382-b89c-0082a51d6d2a@suse.com>
Date: Thu, 5 Feb 2026 16:10:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: use BSD sed compatible regexp in SRCARCH
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260205145913.99032-1-roger.pau@citrix.com>
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
In-Reply-To: <20260205145913.99032-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 26CF4F4700
X-Rspamd-Action: no action

On 05.02.2026 15:59, Roger Pau Monne wrote:
> Convert the ARM SRCARCH variable setting to use the more common 'arm.*'
> expression rather 'arm\(32\|64\)', as the later doesn't work with BSD sed
> for not being a basic regular expression.  The usage of | alternations is
> not part of basic regexp support.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index 13e336ba5484..31352d4cd260 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -242,7 +242,7 @@ include $(XEN_ROOT)/Config.mk
>  
>  ARCH := $(XEN_TARGET_ARCH)
>  SRCARCH := $(shell echo $(ARCH) | \
> -    sed -e 's/x86.*/x86/' -e 's/arm\(32\|64\)/arm/g' \
> +    sed -e 's/x86.*/x86/' -e 's/arm.*/arm/g' \

Perhaps to guard against something like armv7, use arm[36][24] ?

Jan

