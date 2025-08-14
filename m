Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F3CB266D3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 15:19:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081705.1441721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umXrc-0002sP-Oq; Thu, 14 Aug 2025 13:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081705.1441721; Thu, 14 Aug 2025 13:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umXrc-0002qS-Lr; Thu, 14 Aug 2025 13:19:28 +0000
Received: by outflank-mailman (input) for mailman id 1081705;
 Thu, 14 Aug 2025 13:19:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umXrb-0002qM-0z
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 13:19:27 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ca6a681-7911-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 15:19:25 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b9edf4cf6cso716240f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 06:19:25 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8f8b1bc81sm28892665f8f.69.2025.08.14.06.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 06:19:24 -0700 (PDT)
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
X-Inumbo-ID: 4ca6a681-7911-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755177565; x=1755782365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kBlyrzMAAt0g6rSni8C2Z1ie2xvubvyBWBNXXe85Mic=;
        b=ERlJ5i3ZqtTuc/8LeCqPzCH11G09fwRJlIR7HiF7gDg8sFMGQMozBboTWTHL4kWopb
         ApPbWCWBRMyBHrlBLAZOuVo45x5C1BEVAVnS7R2jlc7NXCz1hyYDhHzTerxadHAueBCz
         815sEAt10Gzy+Oh4D9QIMRxRBE7NTgE12t2gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755177565; x=1755782365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBlyrzMAAt0g6rSni8C2Z1ie2xvubvyBWBNXXe85Mic=;
        b=RY6s40jTEZmtwdWO0yMWpu2YjdtKt+Nu0hZptoflT7KsgqAK/P5rAnjzBcgfY1MYS7
         J+vQ4UAiOB1priBtomYcdvcKk4LyQPK6pF0QsXNk42A+mg6+xHMSuXDhV4ADlV8JuxIz
         mCAeD+BV+oUd17sqc58zasfU64U6sXmS6fSnxtEigRBbjUQcDhutyiB38BzJqfR3Ty3I
         z9PKWPm7jZVpEmFL64ylLJCeAyemspAhts544Pdh7zstdUinuvNHGUw+t1cS1i9pcgHM
         N/J1ztG5WMFm7cEIHwOqPbAY5i0F1ZgWR9qZol1E74j2O6rGRR1zZygVfSIL1nXLsFdj
         Gvdg==
X-Forwarded-Encrypted: i=1; AJvYcCXhuR9M04abPeB9abl4VlWCYtU/+gG9NYM9aLwMjdio7vzIICCmzx7wM6pIn4TH75hzMELVViOd4eA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbUTxD03wQAvt//AnSuqOzZUhmUCG+93rEavBBPp8dwM0GlxUa
	srfkTa2Kn/6Qhb3DE9rQublXM2JZYKGORNAOJM7kTmu7dH1PejSilqpdxjV6vaZtTkw=
X-Gm-Gg: ASbGncuRpGHdagCNxMmRa3f6M1SFyqXnCUCi30x1NcL7UGX1ZBv4/0c/zGGSL4sj9FT
	xB4tN9RZAuvNS9jfC/AAPBGVWx8YvmxcCxNt0AMr+C3q9A+7snC/7h/ngF5YgN5GXGLp2FF7Iz5
	6H0PuBrvJ/2srRrDzFwJiLTuA2Ni+ulAmICNdJaP3gM0jwKF7JxP59mDGa8iesPMsnGoDpEOjuQ
	KhENXcQ2mYCl/vfTTUzdAV0ZOdemduLy2nqiLWo6WWEGQJsoQKmFBBuMkAGrGksiUYnNbzLGHWC
	1NMfDLR89ccZL85w5me3+K/mGQq/PMXG0spct9fXw9LCuozFCZC70nhxg/0Gch9NY0X71l31MK1
	+3Gj62fia4SwDuY8gf9R9iJvwhq64SyQ1cNqfIlfDnSfwMGKZc4GSTNCvd/TRzpxwl8a7
X-Google-Smtp-Source: AGHT+IG4HzmXBhdMNNy7Yse9n20oYJum2vG/tJ3RuVlJOyKjrXBGd883kjGd6jXSt55Cl1x1c7vyNw==
X-Received: by 2002:a05:6000:2006:b0:3b9:1b19:a366 with SMTP id ffacd0b85a97d-3b9fc34bb92mr2340450f8f.34.1755177565124;
        Thu, 14 Aug 2025 06:19:25 -0700 (PDT)
Message-ID: <6d1c393e-39ad-4b43-ac52-a31bf93a3534@citrix.com>
Date: Thu, 14 Aug 2025 14:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pdx: cast PAGE_SIZE value ahead of shifting
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250813125538.78174-1-roger.pau@citrix.com>
 <e644c968-ab68-49f4-801e-0f161fd85f2e@suse.com>
 <aJ26UmemwxyyTioE@macbook.local>
 <3fbdd1fc-e739-42cf-892b-a561910a5693@suse.com>
 <aJ3eRFc7CCwVi5WE@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aJ3eRFc7CCwVi5WE@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2025 2:01 pm, Roger Pau Monné wrote:
> On Thu, Aug 14, 2025 at 12:45:40PM +0200, Jan Beulich wrote:
>> On 14.08.2025 12:28, Roger Pau Monné wrote:
>>> On Thu, Aug 14, 2025 at 09:18:45AM +0200, Jan Beulich wrote:
> diff --git a/tools/tests/pdx/harness.h b/tools/tests/pdx/harness.h
> index 5bef7df650d2..a0fe33b4f1e0 100644
> --- a/tools/tests/pdx/harness.h
> +++ b/tools/tests/pdx/harness.h
> @@ -33,7 +33,7 @@
>  #define PAGE_SHIFT    12
>  /* Some libcs define PAGE_SIZE in limits.h. */
>  #undef  PAGE_SIZE
> -#define PAGE_SIZE     (1 << PAGE_SHIFT)
> +#define PAGE_SIZE     (1UL << PAGE_SHIFT)

It should be 1L to match Xen.

~Andrew

