Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DC57D057D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 01:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619603.964960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtckK-0006xO-CA; Thu, 19 Oct 2023 23:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619603.964960; Thu, 19 Oct 2023 23:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtckK-0006v6-9a; Thu, 19 Oct 2023 23:48:08 +0000
Received: by outflank-mailman (input) for mailman id 619603;
 Thu, 19 Oct 2023 23:48:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/TV=GB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qtckJ-0006v0-5l
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 23:48:07 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1fa6414-6ed9-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 01:48:05 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so3123731fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Oct 2023 16:48:05 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c05ca00b004083729fc14sm5432068wmd.20.2023.10.19.16.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 16:48:03 -0700 (PDT)
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
X-Inumbo-ID: f1fa6414-6ed9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697759284; x=1698364084; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lsnXKjOkzP9wpLrWtaLiQnxMJDYEcsa5u2Q8tCbvO2U=;
        b=Um2qmeuQ/gPfIvQnrc8DBHdvPTh5hnhMlrnjbb/rIIDQvrlkIN8IFHb+/qwRc1pRwT
         US4hQHiYSJVjkvoJsmdEaw1I4t2iWdgZDqTRiP6AlHDr2yJD7b0+nxz2WfAtRiv3K6FA
         CyBTLuXq+9nMxSCTNcP5auwCJJ7yTz2y59Uic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697759284; x=1698364084;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsnXKjOkzP9wpLrWtaLiQnxMJDYEcsa5u2Q8tCbvO2U=;
        b=MGrPIQ2VUViyexLtExx0UTYfboNDYUDoXGCXHVcC3NFi/7pXVUwLD3x0tk6Nh0L5AK
         hHG3gRcXIoplJm4vRWSIP05JrnN3f/gBG4/aP4JkIvYlfLuCjuYDdMXHXsDbpYr7qbUq
         LmA8zlhRMAT01ght+0oxkFge16aHO54chdIeCTBfohOk7xTBdkLPS6+EsKmhS03RNn2J
         yvCN5ZpV69iBmECe+SRPVZxtp55Rer2/iDlJDW9YL642AMj+CJo4X152Yyp52ZDd48B+
         wbGPAGhcryv5yUA4ofNGvLMWVO24v9nU9FJ8C/w7xzQiLli2awXA155iv+VJETc/0Imy
         rFWg==
X-Gm-Message-State: AOJu0YzzgwhqKp0GUaLnIqpku9qVSROmXHDdgZ2cUiKtkycyKPPnQ9lq
	Lx2QbET9W5XIgoS0JsohMlbRqg==
X-Google-Smtp-Source: AGHT+IG6opXh2h2vBzrOmXB3+UcFhcTdHrLoC6XAEJ8FvwFsOZ0HKc/O6P1mk/Q7pBmbh3vGmE/9Rg==
X-Received: by 2002:a05:651c:543:b0:2c5:1640:3c97 with SMTP id q3-20020a05651c054300b002c516403c97mr324607ljp.22.1697759283617;
        Thu, 19 Oct 2023 16:48:03 -0700 (PDT)
Message-ID: <cc20f0f7-0216-4755-a9ef-ad5fa60982f6@citrix.com>
Date: Fri, 20 Oct 2023 00:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.18] x86/mem_sharing: add missing m2p entry when
 mapping shared_info page
Content-Language: en-GB
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, George Dunlap
 <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
References: <20231018080242.1213-1-tamas@tklengyel.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231018080242.1213-1-tamas@tklengyel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/10/2023 9:02 am, Tamas K Lengyel wrote:
> When mapping in the shared_info page to a fork the m2p entry wasn't set
> resulting in the shared_info being reset even when the fork reset was called
> with only reset_state and not reset_memory. This results in an extra
> unnecessary TLB flush.
>
> Fixes: 1a0000ac775 ("mem_sharing: map shared_info page to same gfn during fork")
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> ---
>  xen/arch/x86/mm/mem_sharing.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index 94b6b782ef..142258f16a 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1847,6 +1847,8 @@ static int copy_special_pages(struct domain *cd, struct domain *d)
>                                  p2m_ram_rw, p2m->default_access, -1);
>              if ( rc )
>                  return rc;
> +
> +            set_gpfn_from_mfn(mfn_x(new_mfn), gfn_x(old_gfn));
>          }
>      }
>  

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

CC Henry.  This needs a view about a release ack.

Cons: it's been broken since Xen 4.14 and we're very deep into the 4.18
code freeze.

Pros: it's a bug and would clearly qualify for backport, and is in a
niche feature so isn't plausibly going to adversely affect other users.

~Andrew

