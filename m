Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0058B10983
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 13:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055825.1424142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueuQr-0004P3-CE; Thu, 24 Jul 2025 11:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055825.1424142; Thu, 24 Jul 2025 11:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueuQr-0004Mz-9G; Thu, 24 Jul 2025 11:48:17 +0000
Received: by outflank-mailman (input) for mailman id 1055825;
 Thu, 24 Jul 2025 11:48:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSid=2F=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueuQp-0004Mt-Us
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 11:48:15 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 147f33b4-6884-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 13:48:13 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so1202102f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 04:48:13 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fc6050csm1933371f8f.3.2025.07.24.04.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 04:48:12 -0700 (PDT)
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
X-Inumbo-ID: 147f33b4-6884-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753357693; x=1753962493; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1g1x0nBHLG99qWHpy8GMU8nwk5sTRrhev6aXP1gNBt0=;
        b=o/2BAydxW1a42++OVn4c5AhpugKDpfrbBishhqdusnDZ21JLcNw8ssc25GMpymc6v/
         QLebm+P2wHqwRWi/gC+78mAzgVToCSPxwspfuWHPvrovmWrsouoYALt/yGI4C+0MQVHf
         BZ7bPjEGltop6AEls2WWM+3hY0n1qOr+rGiYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753357693; x=1753962493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1g1x0nBHLG99qWHpy8GMU8nwk5sTRrhev6aXP1gNBt0=;
        b=nH7GmUqlyP8gDm1GVJnkln32SPFXvb6R4AvqJFDp9edqhIaWN2sA8LWAlj90bRF81Y
         2oEWnzepL7gHLStcdm81jkDfRRFqVS+2L5tQndT2U07FJCeGPUAOqF14TE3pMFwbLvlT
         NgKZf+qCXQlTRohJ+INsXV2T2hH1VUIZqt94uayUve/FQb6argaHdwpBShKfwYQ6pbS4
         2NzBP3KOARf/wBW6g6SzClwKBzG9FSWPtmDQI+Zj7+GcK+9RakenOGWNBSMzCt7Fo1aA
         AGF9IlwDEF9wwMMfWAP0ionWtYZHL6No5iqFjkCGVakAPsI+ohhGrXkLCPdS3IQx7hpB
         GOow==
X-Forwarded-Encrypted: i=1; AJvYcCVRpuBGMh9w9qtYiuUTwu9H3nBXfaXF4Uf9IB33Kd2IfDU9CY1RCYvmMn+NQlBC4GnV/9hmDv1lW14=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyagiEeZE/C+iqgcz0Twq3mj0gwU4GTdGQSS7mLMCH81jQpbH0c
	7RVzoftW20elv2LCKaIRbOHSgBszL14YpqzzFbPd9j5EC+yuUT1yGQxlW0pzsqqcRAw=
X-Gm-Gg: ASbGncvcsVk2Fs/bW2jbQrBsnjAdmbaSxJ7+DDZ6alJgCxnXF28VJo9+YgGB/vLCeen
	m2cZO6FOyypFCt9E1IDnW5T4TUpEkwTUmzZC6oK60Glx3CbIIO6lCej9bgU5WjXEQOt447TbDvv
	Ofthu/55RAhv5uRcl8CKuTCvNMSnWQMyukdMLNRDkCRgXYtebEW+4C+UQuSOvU6V2HPlr4iH7Tx
	UCwL16Ej4OuD/F8bwLsExi+YitFWOpVFzBQEHTzbUmT2N3Tj3zVnyZZ4MN1Q8vyovzHJ5Ai1VF4
	cYhm+IzUjQ5JN6vCBuWLtgeLAJEGjTsIWiIqkW7nkOq4iB1nd9KARlNtCBtO8Wi8dMSFIIQSGFv
	LZ/ge6jhC/AyuqxWeSj5qWVAnH9n39CXyBqr01zIxEJTTz4OkPnQ0iwSIzN4/2CskWJjOSEapyy
	qKZog=
X-Google-Smtp-Source: AGHT+IH0r68FbO39Xz/8tOqxWBMnn/hWPj3gDwKc/q2BefE8n3qw1hcVeeiqQrXOfrnaZV0u7AFXRA==
X-Received: by 2002:a5d:64c5:0:b0:3a5:2b1e:c49b with SMTP id ffacd0b85a97d-3b771382638mr1394814f8f.29.1753357693282;
        Thu, 24 Jul 2025 04:48:13 -0700 (PDT)
Message-ID: <0377fdd5-90a4-4b53-9a20-009752c9bd32@citrix.com>
Date: Thu, 24 Jul 2025 12:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domain: Dump domain paging pool sizes with the rest
 of the pageframe info
To: Aidan Allen <aidan.allen1@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Bernhard Kaindl <Bernhard.Kaindl@cloud.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <CANgacT8YrH66iUEPr60AVytXYMivPzxC0SO4_RPohjk1Vo2w8Q@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CANgacT8YrH66iUEPr60AVytXYMivPzxC0SO4_RPohjk1Vo2w8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24/07/2025 12:40 pm, Aidan Allen wrote:
> Added the ability to view the paging pool size via the debug keys
>
> Signed-off-by: Aidan Allen <aidan.allen1@cloud.com>

You should have CC'd all the x86 maintainers.  Adding Jan and Roger.

> ---
>  xen/arch/x86/domain.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 503a55705b..b64d09a9c8 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -253,6 +253,10 @@ void dump_pageframe_info(struct domain *d)
>                 page->count_info, page->u.inuse.type_info);
>      }
>
> +    printk("    Domain paging pool: total: %d, free: %d, p2m: %d\n",
> +           d->arch.paging.total_pages, d->arch.paging.free_pages,
> +           d->arch.paging.p2m_pages);

The %d's should be %u's, as each of these are unsigned quantities.  This
can be fixed on commit.

Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> +
>      nrspin_unlock(&d->page_alloc_lock);
>  }
>
> --
> 2.47.1


