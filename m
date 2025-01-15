Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EAFA11BB5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 09:18:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872191.1283142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXyaT-0006U7-Pe; Wed, 15 Jan 2025 08:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872191.1283142; Wed, 15 Jan 2025 08:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXyaT-0006SU-N2; Wed, 15 Jan 2025 08:17:17 +0000
Received: by outflank-mailman (input) for mailman id 872191;
 Wed, 15 Jan 2025 08:17:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KZm5=UH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXyaR-0006SO-Hp
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 08:17:15 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fffa9d3-d319-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 09:17:14 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aa6c0dbce1fso925418766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 00:17:13 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9563b06sm732264866b.100.2025.01.15.00.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 00:17:12 -0800 (PST)
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
X-Inumbo-ID: 1fffa9d3-d319-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736929033; x=1737533833; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wxDylGD/rECUaKXH5DNosILSAYVcMAnuYQqFeSShHhs=;
        b=MqPceTk3pnTSy3Cy5KOvf6uDqYCXQ2WGjrkqGRz6IiVRkZGgtR1CKonvwXWIc4A1nq
         xg7Y6VF26EQvfGu9UU8J39HYqAwwCg8ze5mYAlcrBCrC8Xb8jdU/igcIWyMzzzc6GDEb
         p9qGG9UYy9E59MiGiMGkFDlg6YbdGw5cvo7x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736929033; x=1737533833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxDylGD/rECUaKXH5DNosILSAYVcMAnuYQqFeSShHhs=;
        b=IHtPx7xrcLSc5616W88RRC7Ps2msgAdyxSsT19DxBtLKMmK9hjrAv4WxEqAp/VZ134
         b8gd+g9ahvAGIMjLM2wBlP6E4Hk8nhb2xu7Uo+KCaP11FVVYDmqHQuFT5RbNuP6FeBtu
         s++GEB6nozibklOYROBVlchOEH9QYU0eoxx7eBnrXizr09TDtoWsi+y3c4NE+NBP6Z9x
         Ivgq8nFh3OkcKZw2rYNxw0X9C7tTFKnUnjA8QLHTWTW9K/hdyCfUM4dHCxMZtkPcclHk
         cAzNuELPbeg/CwAToL6qRI1PgTQY/IwhrI3T798688E1sA9SpY8skZOmvB4neeK0NLEt
         TB5A==
X-Gm-Message-State: AOJu0YwRLW0GQ7z/UY4s0caGLiHhY66DrV+gBPfm9T1w4VJwv5rdZSMp
	MbygEhZnUpAyXlmuYVsYcvv6/MKfYsyvVDLig4nClBHg1hEcqpJLj1qd2NBiz7E=
X-Gm-Gg: ASbGncvFzNYl5yZsa88OCXC+jXx7vrhslnph56kub5vtDBcuFaiawo+LyAN8Hb4K/lN
	svaY69HxWdFwMdkfxCP8yVpTZMl7CncY1K8/+zQuU+9mPPoDt+aH8mti/68aC6KzmCFM/VdhgzP
	pwZabCIShKrC9G+ozpV9qGdgeo2T+wzNGfM5TZdUFw4huYUHOASOIu3o0Rgp6scWucX1N0sZPit
	G4vYjnRF8y5EZY9K2a6wzry03IH+hH9NZruS4GaM6dZgrcdJ6q/CRu/E5WBFoPp8+E=
X-Google-Smtp-Source: AGHT+IF2xXggUp2JiT/pL1wOOaIc21O4ZetVBDo4hyq6ucbyLmpWBql2I6pjC1JF/I3H+bvtc+KLRQ==
X-Received: by 2002:a50:858c:0:b0:5d9:857e:b259 with SMTP id 4fb4d7f45d1cf-5d9857eb31cmr44638768a12.31.1736929033065;
        Wed, 15 Jan 2025 00:17:13 -0800 (PST)
Date: Wed, 15 Jan 2025 09:17:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.20] automation/gitlab: disable coverage from clang
 randconfig
Message-ID: <Z4dvBxuB9gl-Y_yL@macbook.local>
References: <20250114174345.60887-1-roger.pau@citrix.com>
 <c715348e-0f40-4ac4-b38e-1aead29cde52@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c715348e-0f40-4ac4-b38e-1aead29cde52@citrix.com>

On Tue, Jan 14, 2025 at 05:48:20PM +0000, Andrew Cooper wrote:
> On 14/01/2025 5:43 pm, Roger Pau Monne wrote:
> > If randconfig enables coverage support the build times out due to GNU LD
> > taking too long.  For the time being prevent coverage from being enabled in
> > clang randconfig job.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> > ---
> > Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > I will fix the orphaned section stuff separately, as I'm considering just
> > removing LLVM coverage support because the llvm coverage format is not
> > stable, and the code to dump it has already become stale.  However I need
> > to think about it, and in the short term disabling coverage support from
> > randconfig is more straightforward.
> 
> Oh, so it's broken too?  Unless the fix is trivial, we should have a
> Kconfig level disable on it.  No point letting people turn on something
> that's broken.

It's not build time broken, but the format of the buffer that we
return in llvm.c dump() function has gotten out of sync with the
native format in modern clang versions, and hence coverage tools will
refuse to parse it.

I think newer versions of llvm/clang have now included an internal
function to dump the buffer, so that we no longer have to attempt to
generate it from Xen, I need to see whether that works.  Otherwise the
only remaining option is to convert the llvm data into gcov format
(which is stable), IIRC this is what Linux did.

Thanks, Roger.

