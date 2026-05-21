Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMmbMGcdD2rbFwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 16:57:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB665A7C57
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 16:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315314.1585126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ4ph-00040A-Gj; Thu, 21 May 2026 14:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315314.1585126; Thu, 21 May 2026 14:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ4ph-0003xH-DW; Thu, 21 May 2026 14:57:09 +0000
Received: by outflank-mailman (input) for mailman id 1315314;
 Thu, 21 May 2026 14:57:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQ4pg-0003xB-2d
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 14:57:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ4pf-00EFwr-Eh
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 16:57:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f1d38-e002-0a2a0a5209dd-0a2a450c9046-18
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 16:57:07 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f1d43-62f1-0a2a450c0019-d155802ad9b4-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 16:57:07 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48e82c23840so50795205e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 07:57:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d9edcbsm76823485e9.13.2026.05.21.07.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 07:57:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1779375427; x=1779980227; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iaCwIVAYsmiL0Vvz1AfLADHLOPBlm62cOoYqQEOSbTU=;
        b=JGcJThqeO9a7I/n6wQOB8LqJ+0+itP5pWkz/JvY2MR+SQMo6o8wTaHimc/8uxLXFei
         W7K+tAQ27/P0ncs2AnDLZvbaHCgp+VY7vUkZnKa7C+SEuqtGZ58TnB8MnUVxWBOkSJ94
         549YbSnXs9xAePjjGUYaOaBgwx+m8ZGmpfeSo8/1jqL0e1nLkm8YTwn9hmjuIVWPpiV6
         QVWAuiKnQQN8CJcOqpEgTVGnYlTk89i9UCVfCKPhmpZ5ajwVTM59KrWR8FQleg9g8hpm
         jRQlzRgxKVR50O47xaJqdrL53e/TplTyeaDvDFtZwjsImUbu4blbOFYQRpblGAVc0Y/k
         Hjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375427; x=1779980227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaCwIVAYsmiL0Vvz1AfLADHLOPBlm62cOoYqQEOSbTU=;
        b=YIpb8CmWXZk+0uJn0wXifJlAhxGS1uMDRKkyDmWy4I85qwTW7j5d0BzCaSXcAhNUgj
         YOZGIVodsra9r3FUQb5VWtiaIlg96B/UMYXsrJfKxiPCKLcbffIL6E+7Te6/kHYNc46s
         rUfZ5AgVVrfHksNz4o28CBUwmkP4VOvbyUJCLpDtRh4XqRJoVgFoftiHmNj9LJHEzuid
         bA1QTMDMCX2a744uYVYnBau1zp9bWBUG8jguo2cCJGG3CYDegOJNhjmKWQ17uwcrtFjA
         Vna3NxjT1s3NjzptGVM6t+67F2GTyvPDaXc0zMTckaDj2Oo+97X+GoWTsMUwFYXPGo2e
         HLbA==
X-Forwarded-Encrypted: i=1; AFNElJ+CWB3qKb5e/A48BJVtftG1TwkFS1HuWnYUBB8azLNQ7xP9HU+0XH6l7xeeruWe9kQmUY7w1+P+DTY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKkk5QaZ1Dv9Aewxi0zpPxQDasu+/3GAgfp9Zjutx3ntVCszMO
	5YVEBeMb+TOcn6rgztDl5GGbp7qqCrRDV8WrFQHV4Ryyp1u86WxJ+DHXRH4i2AP8zA==
X-Gm-Gg: Acq92OEFc8sgEAnOpmIjQ7f+p2XCcPonV7xlb2aQEX9yoEIz/DjK4j3+OKYWr+n2Pig
	4qKW3houYheTjyaYllmtxiXJaFmKmqolFtKdcv3TVrLn6bPpJxnLgO4/b2RVxayg5wjv+oF/G66
	k3jyI59TUSdUeivktTTo1ZoI1TegDwQQRcf+4B/lrZLgX4Yvgtk7C6u3vXtcRzq8Ulc21FmaaJO
	jymOhKT5PD8MHg9KvgpXyfaF/xp5pn30dkPxvGCaxpw5n4y+0eqbNnVZuhputqgnMZdFnU+7MwT
	f0l+lPh0N7YfcYEL/boT85AWHaM8uyd6XNaHVpks8BsxyYYipYqv31Ghld6vjXIkpCMy4d02Sfk
	9V5aowmRybekn27dVvHeyF26aBaDq6RiJr+4R3w+2rwJsu9MELpPe8yWZPvfEUwXg/nvlszK2OV
	d/V1KdRbcaT2oP14f6fUQdfgCZniQp51MOWLE5mj0w/Kvc3k8xxrFLFrpU1XgZHkC53WJU6u016
	0mXOk3ZhLlqUE4=
X-Received: by 2002:a05:600c:4e87:b0:490:3b87:be0e with SMTP id 5b1f17b1804b1-4903b87bebbmr32533925e9.29.1779375426759;
        Thu, 21 May 2026 07:57:06 -0700 (PDT)
Message-ID: <c4054fd8-5491-4cdd-8921-e058c2243f7f@suse.com>
Date: Thu, 21 May 2026 16:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/26] xen/riscv: introduce aia_init() and aia_usable()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <66ca7f49756740c3d54ac660bebf406479ed011e.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <66ca7f49756740c3d54ac660bebf406479ed011e.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1779375427-F4C79CF5-7C71E9F1/10/73395122804
X-purgate-type: spam
X-purgate-size: 1248
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2BB665A7C57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> aia_init() is going to contain all the logic related to AIA initialization.
> 
> At the moment, it only checks whether the SSAIA extension is available,
> and if so, sets is_aia_usable (which  indicates more than just the
> availability of the extension) to true; it also signifies that the necessary
> components (to be introduced in follow-up patches) have been initialized.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit again with a comment for consideration:

> --- /dev/null
> +++ b/xen/arch/riscv/aia.c
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/sections.h>
> +#include <xen/types.h>
> +
> +#include <asm/cpufeature.h>
> +
> +static bool __ro_after_init is_aia_usable;

While in an if() the is_ prefix may make sense, in most other uses (all
of the ones below, imo) it is of questionable value. I'd suggest to drop
it, but of course with the then leading underscore retained, to ...

> +bool aia_usable(void)
> +{
> +    return is_aia_usable;
> +}

... not conflict with this function.

Jan

