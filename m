Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC78483A53B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 10:23:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670833.1043880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZT8-0006t2-IQ; Wed, 24 Jan 2024 09:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670833.1043880; Wed, 24 Jan 2024 09:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZT8-0006rK-F5; Wed, 24 Jan 2024 09:22:50 +0000
Received: by outflank-mailman (input) for mailman id 670833;
 Wed, 24 Jan 2024 09:22:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3ap=JC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSZT7-0006rC-MK
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 09:22:49 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23a2b365-ba9a-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 10:22:48 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50e766937ddso6206330e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 01:22:48 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 ef5-20020a05640228c500b00557d839727esm16290583edb.7.2024.01.24.01.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 01:22:47 -0800 (PST)
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
X-Inumbo-ID: 23a2b365-ba9a-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706088167; x=1706692967; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=shxK/mjfxX+fUVfht29zbiJG7ZSk3Mn0kuammqyAbD8=;
        b=qUUT34pRGr3I/eDs7RzWydvc/sqL424epF/A3Q119BxzfKj8a391egj7gFSIX3Z9Ep
         RIf211dBT+3LY8yBG47Dv7iceAVejVtsmKsVQQCganMvearKpwuOldegg3VBk1xypLyV
         MBYNYxEXRgXzFvjANXoLcBUbY7NYIPZQ/AGA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706088167; x=1706692967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shxK/mjfxX+fUVfht29zbiJG7ZSk3Mn0kuammqyAbD8=;
        b=bpmWO6bIqQSnqjY2+7NmJvi2Ci+6ILoBmfkvtlKXHj1CqbRkBtm6NF2cMtv+kHcvTu
         uVIT0bT41RAVdomgbAFHhGu85VJJhSdhwzsRx+LQy6vZbdprPSLCzbKhk0LqIERKfnye
         oWvNVesGaZREzId95r9TJNlZ6+TbXFBMD/L9ns9qIJ8Nai+hkN3m+RGe9/WWu7IstShR
         lJ/W/3z2XME7nQdHQ2R9VTAbgHX8zRQjvhun79nxoeYFJ4yPmgyym2GmroF9yaULy2ki
         ZB1hpln3gKDj/Ao8mNWB/Dwj9zg8Sa23cKO9R6oXHdpkwv1u9vDOOAkrf5ZmuvWC7LcG
         dH4w==
X-Gm-Message-State: AOJu0YwCR7ZMHZ6v0NbXLiAIbLSoQx24AOKrqvNDHFcOft/FIZSp3m8H
	+FDQyeXwE02gnjedlyKLJzaEPOqfo+RqW+1yLdbqbE4FpbNQmojFIw1NWWAvndw=
X-Google-Smtp-Source: AGHT+IGIatMlXAIT9wtFN4TVKhyxS8oAmqGfVN2/qMY8nODju2VQwelodI3MBQqSNPKI+RmLV0f68g==
X-Received: by 2002:a19:7405:0:b0:50f:152b:48a9 with SMTP id v5-20020a197405000000b0050f152b48a9mr2744170lfe.122.1706088167663;
        Wed, 24 Jan 2024 01:22:47 -0800 (PST)
Date: Wed, 24 Jan 2024 10:22:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/entry: Make #PF/NMI/INT0x82 more amenable to
 livepatching
Message-ID: <ZbDW5nCuHW7xCYOo@macbook>
References: <20240122181714.1543738-1-andrew.cooper3@citrix.com>
 <20240122181714.1543738-3-andrew.cooper3@citrix.com>
 <0edeb969-6fef-46f4-b216-0858edbaefa6@suse.com>
 <Za_BF_wr0qWH5eKC@macbook>
 <ebdfc495-b8bc-4468-8b41-d5fdb2a85adb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebdfc495-b8bc-4468-8b41-d5fdb2a85adb@suse.com>

On Tue, Jan 23, 2024 at 02:43:15PM +0100, Jan Beulich wrote:
> On 23.01.2024 14:37, Roger Pau Monné wrote:
> > On Tue, Jan 23, 2024 at 10:22:10AM +0100, Jan Beulich wrote:
> >> On 22.01.2024 19:17, Andrew Cooper wrote:
> >>> It is bad form to have inter-function fallthrough.  It only functions right
> >>> now because alignment padding bytes are NOPs.
> >>
> >> But that's a requirement anyway in executable sections.
> > 
> > Really?  I was under the impression we wanted to replace the padding
> > nops with rets maybe, or even poison the padding with int3 or ud2.
> 
> Well, that would be a decision of ours. Which then imo can't be described as
> "only functions right now because ..." The assembler can't[1] use other than
> NOPs by default, as it can't know whether fall-through is intended.

So it's not a strict requirement of ELF that padding is done using
nops, it's just the default decision of the assembler because it
doesn't know better.

Thanks, Roger.

