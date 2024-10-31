Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483399B78C6
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 11:37:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828589.1243523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6SY1-0002tD-8T; Thu, 31 Oct 2024 10:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828589.1243523; Thu, 31 Oct 2024 10:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6SY1-0002rc-5g; Thu, 31 Oct 2024 10:37:01 +0000
Received: by outflank-mailman (input) for mailman id 828589;
 Thu, 31 Oct 2024 10:37:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XIyL=R3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t6SY0-0002qE-4n
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 10:37:00 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d216a80-9774-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 11:36:56 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-539f58c68c5so1394852e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 03:36:56 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e56643f70sm52624866b.173.2024.10.31.03.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 03:36:55 -0700 (PDT)
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
X-Inumbo-ID: 0d216a80-9774-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmYiLCJoZWxvIjoibWFpbC1sZjEteDEyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBkMjE2YTgwLTk3NzQtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzcxMDE2LjQ3ODkzMiwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730371016; x=1730975816; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OvaWco0QKxR3BWCfgIeB1KDP/z7NvTZm7IV/OSfo/EI=;
        b=MTMn1WVu10UiQIHMf1jqL7itrd1QJ2pzXyDUb4xnqRRfgjz0MV2o+OiZTjIF54mDCa
         ajIFZ1I9YFtlDUBfXz2sSzRFQJ5cjoTZP0U4ftmA3igHYlMPPREFeSRYqqHv6lV4TqAV
         +pLAfYS2Fyu2CcI+Ze11mqW/aXx4sjkfGZa0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730371016; x=1730975816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvaWco0QKxR3BWCfgIeB1KDP/z7NvTZm7IV/OSfo/EI=;
        b=uMXerfaskXuFcM4B2fAWTJMFsQw6GjFkI5+uu2voRHujrNktndtU3SXMJkRU3AfP3v
         VS+VqdEZaJJl1q94+H6bq6/QKv1KafQ2OWHvijpaqubseumOkO2T7kx94Svxd81tWg/m
         enAQzIKpv5h+Z5zA1V7M+Tqbx37sLZy7CdZoBnN5wdx3oaEy1ilUQSe6jotRv0mAJwSv
         bsLb/WvtaSKPtyCgTY7lHpixrOZH0gy5fpKvF6Vmp3uFPAa3hf/xCDjgp0/uXz5wUOdn
         caDNjju7Q7TLV2M+c1/sZ9hOfdcekyLvPGOwMWk2Q95UAwHasV1i+uyOWetRfFcwUQ/G
         QaIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGq8XhZjJYkA4e09LZDu4wcbjTMCXEISqqPsfACZhN0qzi7oIPCFWyt/+aR9XctUynHvSJy2kjomA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywy4wBH7/9jC8AA/eDyJ6ZrNlJw3DBxSdoaNpVUy8WjqNlM7vD8
	WSOxWYt1JUdAZHT+E3f106SHMuoIRpVh4pHH8QbWcthoMXSuUcOUF8TYZAboTUA=
X-Google-Smtp-Source: AGHT+IHMPOCJ35h3v+D/D6gkdqEOs2HZqffUxwbpzrjmDQdhNenyjelSjHPwgwtjj+1uzNXy46WRfw==
X-Received: by 2002:a05:6512:334f:b0:53b:4a6c:1849 with SMTP id 2adb3069b0e04-53b4a6c6093mr5540591e87.35.1730371015789;
        Thu, 31 Oct 2024 03:36:55 -0700 (PDT)
Date: Thu, 31 Oct 2024 11:36:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/mm: ensure L2 is always freed if empty
Message-ID: <ZyNdxj8XMV7OIjdN@macbook.local>
References: <20241030114852.55530-1-roger.pau@citrix.com>
 <90996cfa-1c41-4113-846c-eade5c849104@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90996cfa-1c41-4113-846c-eade5c849104@suse.com>

On Thu, Oct 31, 2024 at 10:59:36AM +0100, Jan Beulich wrote:
> On 30.10.2024 12:48, Roger Pau Monne wrote:
> > The current logic in modify_xen_mappings() allows for fully empty L2 tables to
> > not be freed and unhooked from the parent L3 if the last L2 slot is not
> > populated.
> > 
> > Ensure that even when an L2 slot is empty the logic to check whether the whole
> > L2 can be removed is not skipped.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> > ---
> > I've attempted to find a Fixes tag for this one, but I'm afraid there have been
> > many changes in the function, and it's possibly the code that introduced the L2
> > freeing (4376c05c31132) the one that failed to originally adjust this case.
> 
> Yes, that looks to be the one. It has been a long while, but I think it was
> (wrong) similarity considerations with the corresponding L3E handling (near
> the top of the main loop) that resulted in me not touching that "continue".
> We certainly don't want to ever free L3 tables (vacating L4 entries); since
> the 32-bit case still mattered back then, the "continue" also couldn't have
> been simply replaced (as there that same consideration applied to L2 tables
> and L3 entries, for further extended reasons imposed by PAE).

I agree we don't want to free L3 tables and thus zap L4 entries.

Feel free to add:

Fixes: 4376c05c3113 ('x86-64: use 1GB pages in 1:1 mapping if available')

If you want.

Thanks, Roger.

