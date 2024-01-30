Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1102084291A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 17:26:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673593.1048005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUqvf-0002Be-KI; Tue, 30 Jan 2024 16:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673593.1048005; Tue, 30 Jan 2024 16:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUqvf-0002A4-HE; Tue, 30 Jan 2024 16:25:43 +0000
Received: by outflank-mailman (input) for mailman id 673593;
 Tue, 30 Jan 2024 16:25:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5qC=JI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rUqve-00029y-Cu
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 16:25:42 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35bf1cdf-bf8c-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 17:25:41 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-51121637524so297870e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 08:25:41 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 w7-20020a05600c474700b0040ef622799fsm7250439wmo.37.2024.01.30.08.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 08:25:40 -0800 (PST)
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
X-Inumbo-ID: 35bf1cdf-bf8c-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706631941; x=1707236741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FWPkMTKmwB9IHV2ZgZrKBqk47ZOdkHbfP0MDNgUStlo=;
        b=gGfnYJ0t8Cftbc3EzdsMHJlESyERNLH56LPdGz3lf0aBRAmG0azPqrcX4Bq0y9dA82
         UuRiNjHDQPHvrYstV83Wr5KuX1MqZQsreKE/WPuzyQz1EA2sf+ILfhdSSQYgMcdP/B5b
         HEIobIDBoB7K9bGFY25ozDZ9o8wheD08wO3j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706631941; x=1707236741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FWPkMTKmwB9IHV2ZgZrKBqk47ZOdkHbfP0MDNgUStlo=;
        b=NNIAxUb1VVfP/DNVPbQOqMZJQ1BgCX4UztQSjqXwlz0cizfH4VYL9AJceXvNFum4aK
         TXzwFIk2X9gNNQ3UNPxxVwtaNUKNHrc53mz5fXEbfvzqzT2a7021eqXPqpmyQcJQlgXn
         CWBPAH58SvtxyjkHRHAyy5SkxNIAJllijjv9XQgHeKTRzc0geav/buszJTSRac3Cih0q
         61JoRvTgpEm1ejGbJiGBIYMbLkitgFCikQDb3IUwF51R0QTMENYzjIPiHFAR+YhR/0R/
         4Cli7LxZuql8rL8nlWnUWwgwsNTAFL0gu0uchOgrZGKaLQFq4Ec/93igIxaF9fZwpL1b
         EczQ==
X-Gm-Message-State: AOJu0Yx63wyzAasj7QadnWDZTh/p5qTHY8CHz40thXpw8AUuhBXjvC2R
	AyNSmo3z7g3BgkOd7uSj9J9hBl3RQnYLBYYIz79W2FU6EWMbXmRQW2xQwBLGOEA=
X-Google-Smtp-Source: AGHT+IHNEYM93lVmM7w4twwTPgqBkj1/2QjSgwjq339xR4D/QV6pWbD7LuCfc2e5iulEfU3ay/SofQ==
X-Received: by 2002:a05:6512:3133:b0:50e:4598:b836 with SMTP id p19-20020a056512313300b0050e4598b836mr7218966lfd.15.1706631940832;
        Tue, 30 Jan 2024 08:25:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWuqe6johRCcdtKv1L6N95ft4aY6Xvt9AsUUV8D+JrQwENj1gzmwnbaSq58rZ83KKBCvqy5giqHEkmqM3o506qaXM2loafuhxkqHK9SzEsWpBNDl3hHl0vJkoE=
Message-ID: <85794e25-03bd-47b8-90b4-c08fbbd5a756@citrix.com>
Date: Tue, 30 Jan 2024 16:25:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] x86/intel: expose additional SPEC_CTRL MSR controls
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20240130091400.50622-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240130091400.50622-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/01/2024 9:13 am, Roger Pau Monne wrote:
> Roger Pau Monne (3):
>   x86/intel: expose IPRED_CTRL to guests
>   x86/intel: expose RRSBA_CTRL to guests
>   x86/intel: expose BHI_CTRL to guests

A couple of things.  First,

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index a04a11858045..382bc07785d0 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -309,8 +309,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr,
uint64_t *val)
 
 /*
  * Caller to confirm that MSR_SPEC_CTRL is available.  Intel and AMD have
- * separate CPUID features for this functionality, but only set will be
- * active.
+ * separate CPUID features for some of this functionality, but only one set
+ * will be active on a single host.
  */
 uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp)
 {


There was a typo (missing the one in "but only one set"), but you're
also adding bits now which are Intel-only and very likely to stay that way.

IPRED_CTRL finally gives Intel CPUs a control with a similar security
property to AMD IBRS;  i.e. I doubt AMD are going to gain support for
these bits when they already guarantee that property and have done for
years already.


Next, I can't say that I particularly love that indentation.  This seems
marginally less bad

    return (SPEC_CTRL_IBRS | SPEC_CTRL_STIBP |
            (ssbd       ? SPEC_CTRL_SSBD       : 0) |
            (psfd       ? SPEC_CTRL_PSFD       : 0) |
            (cp->feat.ipred_ctrl
             ? (SPEC_CTRL_IPRED_DIS_U | SPEC_CTRL_IPRED_DIS_S) : 0) |
            (cp->feat.rrsba_ctrl
             ? (SPEC_CTRL_RRSBA_DIS_U | SPEC_CTRL_RRSBA_DIS_S) : 0) |
            (cp->feat.bhi_ctrl ? SPEC_CTRL_BHI_DIS_S : 0) |
            0);

insofar as at least it's fewer lines.  Given the length of these new
constants, I can't think of anything better.

Happy to fix both on commit.

~Andrew

