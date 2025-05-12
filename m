Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3666AB35E3
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 13:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981306.1367701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERIi-0002hw-0l; Mon, 12 May 2025 11:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981306.1367701; Mon, 12 May 2025 11:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERIh-0002eo-Tv; Mon, 12 May 2025 11:26:27 +0000
Received: by outflank-mailman (input) for mailman id 981306;
 Mon, 12 May 2025 11:26:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oz7/=X4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uERIg-0002ei-He
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 11:26:26 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efdd9d9b-2f23-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 13:26:24 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a0be321968so2532662f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 04:26:24 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d773f794sm81649465e9.0.2025.05.12.04.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 04:26:23 -0700 (PDT)
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
X-Inumbo-ID: efdd9d9b-2f23-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747049184; x=1747653984; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LLyuq94eLIOoomhbtngtzYWNd8RViT8j01aFh2gXs7M=;
        b=cW3JwGrh60AxB7LYjM2oaBCzNWgCC1bTnA5mZiqGebYnlSrrmfDc5oFpGRBplRYj0n
         yaR9RcxAyhyEMmbXU0srWZ3k7qScmoLpA25PkZ2dqGEbBM3jcwdgufecB99Z3scto5XB
         KXchF9ThPixLfB/+xuipAon8FRYS3Ek9GghZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747049184; x=1747653984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLyuq94eLIOoomhbtngtzYWNd8RViT8j01aFh2gXs7M=;
        b=FP8ywT93neHNI+z5VTQgehK5fzx3zXZy8YcMIVZoHutWaTa2mUkDYkkFdTR7mXrDgQ
         uw6pgj40S4N6hyvnb8dQ3lH/8irnQNGCZSGli2X+r3xG9d4+kQ9e0+17tyyy+WbDJAfV
         44r1Iih1NeQouhiCBd1aDuH7BC8+np/wrYjzgMotBzEs6tpdf+dYupwlEfEH9N3RnXgt
         tgBHlkyFQmZxt9pouCepZg5VhT+yf3YG1CkbtjKMV0JkTJmK7TsXk3k6w58QfWfy09WH
         b5RjuNT5b53SpU+piZ7V9GuAQeYjQzoXZtgFpRrTt8rnpVfzUKedtVyl2+EXy/9UMu9B
         SMMA==
X-Forwarded-Encrypted: i=1; AJvYcCV4mtqNPY5GA7SK8xrgWF77rPCHZBY/o/R8a+5TeS43sAwhS0Xr0SlD2mUWbB3BQ/YgPLV71LVHqZM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+h4tc51wWG9QpozpeBGCf1pPdbeXkv3dgqSpKCHSj3X/KTuX0
	NIXW6EWNckLfFrjI0iL7GWdnl47cPOEBdI84qDTXt9RFXmCkgkDK80duAGw2veo=
X-Gm-Gg: ASbGncvnNlBuPI4HQDz+mtvNOhKjFgeb0U0rL0B0afgpLDbxxLKytKJ505vxlBATPHx
	5ICUOQII0NrIHTh15E7IU/qK3opww/sKBOYWVuRj9pONtZoPnYbOV54v3ntvmdyUBIMB0m65KI8
	FqDU/tiv1g9Rc+iTBuL+ATHTgyHm4lxfepDId5fY0uF8NN0a7Qtr1CnqM2GTHcAd7IUQDFqzIz/
	6qzNn53VxL1IYd+sTNno5e5dlCvZnPzzL2upfCmbke7C/BoxolDtkrH3PD+ihzBWyJyut7BLkAD
	lkn+qxNTNTAPPnQJaLipnyodf9D9GFjLZ7FrkymKlMvBoEf/Xs3TsbeNEanmbkdGPLOZ8m7pz0c
	8QBK4bTg02bdfJWo4
X-Google-Smtp-Source: AGHT+IGw9UqU4jDjGgGTcaGF/+ci6pKQSiBtPRCL6EtFhxMexazWh0EFoAfk3WVfgqq7J+xVcgqJDQ==
X-Received: by 2002:a05:6000:200d:b0:3a0:7d27:f076 with SMTP id ffacd0b85a97d-3a1f64299d8mr10634898f8f.2.1747049183878;
        Mon, 12 May 2025 04:26:23 -0700 (PDT)
Message-ID: <6c64fd25-e7cf-47e9-9830-c631cb497c2b@citrix.com>
Date: Mon, 12 May 2025 12:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] sbat: Add SBAT section to the Xen EFI binary
To: Jan Beulich <jbeulich@suse.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: dpsmith@apertussolutions.com, marmarek@invisiblethingslab.com,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250507135442.3439237-1-gerald.elder-vass@cloud.com>
 <94652153-99fe-47d8-84d5-cbf2865ad6e0@citrix.com>
 <f43c7091-bd82-4341-9143-dd4a78e6bbc6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f43c7091-bd82-4341-9143-dd4a78e6bbc6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/05/2025 11:50 am, Jan Beulich wrote:
> On 08.05.2025 10:51, Andrew Cooper wrote:
>> On 07/05/2025 2:54 pm, Gerald Elder-Vass wrote:
>> Also,
>>
>>> ld: warning: orphan section `.sbat' from `prelink.o' being placed in section `.sbat'
>> This is because sbat.o is getting linked into the non-EFI build of Xen too.
>>
>> I'm less sure how to go about fixing this.  There's no nice way I can
>> see of of getting sbat.o only in the EFI build.  The other option is to
>> discard it for the ELF build.
> We already link $(note_file) into just xen.efi; I'm pretty sure the same could
> be done for this new object.

Ah - that was the string I was failing to search for.

But, note_file is special and complicated.  sbat.o would be a regular
EFI-only object, but that can't be expressed currently, with how
prelink.o works.

I think in the short term, the v4 patch is the way to go.  Reworking the
build system to have EFI-only and ELF-only objects is a larger task.

~Andrew

