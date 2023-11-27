Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261797FA361
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:48:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642201.1001535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cty-0007F2-Ht; Mon, 27 Nov 2023 14:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642201.1001535; Mon, 27 Nov 2023 14:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cty-0007DR-F0; Mon, 27 Nov 2023 14:47:58 +0000
Received: by outflank-mailman (input) for mailman id 642201;
 Mon, 27 Nov 2023 14:47:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j1wO=HI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7ctw-0007C7-Uc
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:47:56 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2f19350-8d33-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 15:47:55 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c871d566cfso48140151fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 06:47:55 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 bi24-20020a05600c3d9800b0040b3d8907fesm9729261wmb.29.2023.11.27.06.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:47:54 -0800 (PST)
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
X-Inumbo-ID: f2f19350-8d33-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701096475; x=1701701275; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yMCWFdih6CSmmbiEu9RB4Dppy2Np8RV9HS0VcjNvI0E=;
        b=QqIwF26oqRN69ZUClA/dB8/8GGeNTCfD8m+7eoF5hkYphsfLiccw7KnvivOupzv6GT
         MZ+YC/8BOpV45x1PRcASeSjMO5YcH4QNpbdCcT1+V6QvNtBqnSsZvMivNmUldkpbcX9b
         A++FaETPXpht2XfNO7kTURQkR4J2k3n5xWMuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701096475; x=1701701275;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMCWFdih6CSmmbiEu9RB4Dppy2Np8RV9HS0VcjNvI0E=;
        b=MF92VEPsjPvIqaxTjcxLDm31ruoB4/y/bIjviPE+zkvU0NrammHzu3uy+L8nrJgPOR
         GjjWu5Z9iwCQHY60crriX0GWFtrtwK2AWYm4dqO0p3Gx2z3ZfNM38QNNtU1EkhEL6TbL
         Pl9nHfA2fJVPAgOSGr6DiiiHZJXNJ8SdBHbZzKDEJIm1Y7wE7Z4owYsRMpjlMie906zf
         lKSZj0J+nWsG9hcSC1CsWc4XkSMMOrlOi1T401sU0IGRhnWAb7LB5KqbARp7zoWoZ0BP
         erf8T7r9u5nOMWmjEi69YOvLp9mKm5108IwW8Sds0qgx8DTCzpddgldqOwVvHm/Tqs9L
         cXrg==
X-Gm-Message-State: AOJu0YxPHOHjaptw9fP3rF9YP04hUwzBim/eWvl7Eu2eP0INnuIlAtZQ
	rkFRP68N1RIVOn9JnIe2+6HBLQ==
X-Google-Smtp-Source: AGHT+IE8JyEWxR6JNM5df4zB1qUkYX/QpjxeqzhaJaLkON2warQ8UAL3/DGpv7ZVbGT0muuvETTY3Q==
X-Received: by 2002:a2e:5317:0:b0:2c9:94e8:46c9 with SMTP id h23-20020a2e5317000000b002c994e846c9mr5429940ljb.23.1701096474967;
        Mon, 27 Nov 2023 06:47:54 -0800 (PST)
Date: Mon, 27 Nov 2023 15:47:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Ross Lagerwall <ross.lagerwall@cloud.com>,
	xen-devel@lists.xenproject.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 1/2] livepatch-build-tools: remove usage of gawk
Message-ID: <ZWSsGfEx-F5yyRU8@macbook>
References: <20231123160535.18658-1-roger.pau@citrix.com>
 <20231123160535.18658-2-roger.pau@citrix.com>
 <CAG7k0EqQZLZDMMJg=20EgnKwhbXZ9US-9zMs0NkJD7eWYR2vtA@mail.gmail.com>
 <3706e5a8-7893-4e4e-a9b2-60517720f2a7@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3706e5a8-7893-4e4e-a9b2-60517720f2a7@cloud.com>

On Fri, Nov 24, 2023 at 12:10:57PM +0000, Alejandro Vallejo wrote:
> On 24/11/2023 11:43, Ross Lagerwall wrote:
> > On Thu, Nov 23, 2023 at 4:08 PM Roger Pau Monne <roger.pau@citrix.com>
> wrote:
> >>
> >> And instead use plain awk.
> >>
> >> There's no need to use the --non-decimal-data option for gawk, since the
> >> numbers that we want to print are already prefixed with '0x', and so
> plain awk
> >> will do the conversion from hexadecimal to decimal just fine.
> >
> > I don't think that's true (at least with gnu awk 5.1.1):
> >
> > $ echo '<e98b7>   DW_AT_byte_size   : 0x14' | awk '{printf("%d\n", $4)}'
> > 0
> >
> 
> I think it's a FreeBSD quirk. From their man page:

Seems like BusyBox inherited that behavior:

BusyBox v1.36.1 (2023-07-27 17:12:24 UTC) multi-call binary.
$ echo '<e98b7>   DW_AT_byte_size   : 0x14' | awk '{printf("%d\n", $4)}'
20

I've assumed that Busybox was the lowest common denominator, but not
in this case.

> >        Historically,  awk did not accept "0x" as a hex string. However,
> since
> >        One True Awk used strtod to convert strings to floats, and since
> "0x12"
> >        is a valid hexadecimal representation of a floating  point number,
> On
> >        FreeBSD, awk has accepted this notation as an extension since One
> True
> >        Awk was imported in FreeBSD 5.0. Upstream One True  Awk has
> restored
> >        the  historical behavior for better compatibility between the
> different
> >        awk implementations.  Both gawk and mawk already  behave similarly.
> >        Starting with FreeBSD 14.0 awk will no longer accept this
> extension.
> 
> I'm guessing the latest FreeBSD doesn't have that behaviour either?

Hm, I guess my FreeBSD world is not new enough, as the awk (version
20210724) I have does parse hex numbers:

# echo '<e98b7>   DW_AT_byte_size   : 0x14' | awk '{printf("%d\n", $4)}'
20

Will see what I can do to address this without requiring gawk if
possible.

I'm not sure if there are other issues that would prevent
livepatch-build-tools from working on FreeBSD however.

Thanks, Roger.

