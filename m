Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AE8AC083B
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 11:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993317.1376729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI1wk-0003iz-Dg; Thu, 22 May 2025 09:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993317.1376729; Thu, 22 May 2025 09:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI1wk-0003hK-Af; Thu, 22 May 2025 09:10:38 +0000
Received: by outflank-mailman (input) for mailman id 993317;
 Thu, 22 May 2025 09:10:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI1wi-0003hA-FE
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 09:10:36 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eb0db27-36ec-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 11:10:35 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a36748920cso4964199f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 02:10:35 -0700 (PDT)
Received: from [10.10.6.18] (server.hotelpassage.eu. [88.146.207.194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca8cfb8sm21556178f8f.85.2025.05.22.02.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 02:10:34 -0700 (PDT)
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
X-Inumbo-ID: 9eb0db27-36ec-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747905035; x=1748509835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KflOCq7BeS3fgdiD47nTA671QGwjH0OBoU3sAG/QC0=;
        b=Wd31iBMrVbiWHDPD3+lU72PIy/qZJKkSarAIfoWCojnnltI/haTgQtikY4VpuilStU
         jjB7AEEng5d80zINYpDmL1HlUgHYt70A1k5FfHwvbyXGEQ/rlTWjS0n8eGkiaHN5VfVP
         BOeLHtvqaXdxUnC27nhrrkSMc7IJMhOftDnKuqwqVfSHmcBOfS9tN5eCSxJyDlhPAtG+
         UOr/cWLtHOyz9nLoAMo6tFBHbJ4wjJndlM3feLIpEMJg47qbZ/5/nP1ACmz18mRrBrbz
         mDoSB/V4d9B2pKntsP2uc4m+8d6iiT612aQ1MarsTU0QMRd1P2irk+YZU4Mvc1ye1sgD
         TF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747905035; x=1748509835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KflOCq7BeS3fgdiD47nTA671QGwjH0OBoU3sAG/QC0=;
        b=NErKGArL2sBuKr2lhU4f8/ZYh/SkJVkSENivq0FWMhP3hm5E0Iojhpy8hcPhhOV6hZ
         /1hu/Izx2ToNCT+r+Ll+QTHfTm08s/n8hnt+Jh8ZcmwVBAIxPEXTMxrO27b8q8WvBwf0
         h2/Rdr4unRbkFWxUYZQNpdL6LkqV7FjMZOnKPINrpAo4GT07PpcqSDx7bEbxR5FXirq8
         TW1A5pOhwRjbuspKh1gwm/JaVkUkFyBKvpmfhGo+MjGYNsQAtUBDtm9F8wvnbvpAT7+T
         fH9bIHw7biF3ptIzKhe0bs0YXm3ZQ6nDjRdYqF4ThqHqeyQv8CzgZSPF9qQ+rHiCcT5T
         AzVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/SCVodV9MnaP3wDYw0qJh5RZ8ICaK8EZMOnMRwRrJkYIQn9dzTL9vjyWuhgmQRfTk6agZxPrf1i4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKRbC95qBn45CbJGsr2JauHFanKjnhZZVOzqOlwbEpoMX04Ia4
	pJOuMX5hVr1FzjXQYUSf1buxpoDbs/OreLe8yDYT7dYbPNhto/t24KaDOhIakaIqAw==
X-Gm-Gg: ASbGncsfmEfiUftV9Lmz26zxEwDqN4XG6aTMUiww28sx5vf8Cqgto6ICnYE4p49J6gS
	0P+wc3moNx2XKtL7Swd2SxmPB3yNAlupPr/ZxfnBpayMYuEgwG92mGaxtTMN07PnoHH8MNwHNr1
	fNvnfCd8Hops76Xek43VFrCIIyP1dgzQnq14lKDnq0xnT9KWHD+6dxEUP6WYMP8m4MiFgaCVyfB
	Y2U+s8nODrtHa04qvEVsgbvshTytrhOyMFZyOZSwaU8QoU022OCXQ0GnoPCFFgxJg6yofjwfLTy
	WSd2mREL6fMMQ7hDAsM0LvLW3qb0bBgihZ8ZkdWoo1kux+Nq6bkFEdbnCIJk4y9le9TXw5XNqlX
	Tmmyh
X-Google-Smtp-Source: AGHT+IGOUuIeVn8Il/mmPQ88Wrp8b+Jl2eOQCaQKmrVjE6EDZTCMBJgQoKK0SdiMVoCxsuBpguKccA==
X-Received: by 2002:a5d:5888:0:b0:3a3:760c:81b7 with SMTP id ffacd0b85a97d-3a3760c82c6mr12807370f8f.57.1747905034672;
        Thu, 22 May 2025 02:10:34 -0700 (PDT)
Message-ID: <0028ad37-95e7-4b6e-87b6-07cadcac64aa@suse.com>
Date: Thu, 22 May 2025 11:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/boot: print CPU and APIC ID in bring up
 failure
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250522075440.99882-1-roger.pau@citrix.com>
 <20250522075440.99882-2-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250522075440.99882-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2025 09:54, Roger Pau Monne wrote:
> Print the CPU and APIC ID that fails to respond to the init sequence, or
> that didn't manage to reach the "callin" state.  Expand a bit the printed
> error messages.  Otherwise the "Not responding." message is not easy to
> understand by users.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Also print APIC ID.
> ---
>  xen/arch/x86/smpboot.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index 0189d6c332a4..dbc2f2f1d411 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -618,10 +618,12 @@ static int do_boot_cpu(int apicid, int cpu)
>              smp_mb();
>              if ( bootsym(trampoline_cpu_started) == 0xA5 )
>                  /* trampoline started but...? */
> -                printk("Stuck ??\n");
> +                printk("CPU%u/APICID%u: Didn't finish startup sequence\n",
> +                       cpu, apicid);
>              else
>                  /* trampoline code not run */
> -                printk("Not responding.\n");
> +                printk("CPU%u/APICID%u: Not responding to startup\n",
> +                       cpu, apicid);
>          }
>      }
>  

Elsewhere I think we print AIC IDs in hex; may be better to do so here, too.
That may then want some text re-arrangement though, e.g.

"CPU%u: APICID %#x not responding to startup\n"

Thoughts?

Jan

