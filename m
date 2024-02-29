Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BB286CB51
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 15:21:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687173.1070188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfhHa-0003EW-NY; Thu, 29 Feb 2024 14:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687173.1070188; Thu, 29 Feb 2024 14:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfhHa-0003CL-Kx; Thu, 29 Feb 2024 14:21:10 +0000
Received: by outflank-mailman (input) for mailman id 687173;
 Thu, 29 Feb 2024 14:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xh/y=KG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rfhHZ-0003CD-62
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 14:21:09 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c649d33c-d70d-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 15:21:05 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-412c23551e2so2086695e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 06:21:06 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 ba16-20020a0560001c1000b0033d9c7eb63csm1979160wrb.84.2024.02.29.06.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 06:21:05 -0800 (PST)
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
X-Inumbo-ID: c649d33c-d70d-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709216465; x=1709821265; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XyayGrmlCYqAjt5gP4PYhjhCQgqwvx5Smhda8T+WU1g=;
        b=s5wpTronZrfzsy5srvQbd7bUVHQ3KWjX9dH985iPaBgmWr4JI1HOorUCu75FLORNzk
         1M6zgoQWdIexETOTJATR+Sa6sXQc1O2GAzBOTKM0yLgidFELVYyf6aBffhYekqifZSTB
         Th7+Ngj6M/U/zTwpQMjJVTgfegVhnP8cqllFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709216465; x=1709821265;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyayGrmlCYqAjt5gP4PYhjhCQgqwvx5Smhda8T+WU1g=;
        b=lKBiPC3K002HwNv54xhWlmg1yQxpM3AsZxTPpoS15egUHSQxBNmufPfCOehX3N55+d
         8N9aAe050KmmqqEdfFtg1csZXMuMAdUtjzgbl3HTJOJWk0kLnsd05iPdTr6iAXoYqGgq
         9Rr7g8iHZHQoRScNWsCwrREkx+nhCT7FHrVLgxvuYNnfRp1iR6mtieV1orBduo+TpZoe
         sEolpZmMk9pvxasl8mnu79IiFLTSiasJ5Ov4549ObCFHIGXiDH03Ag95U4KYXippPG5U
         24V82VuJV13n/RNxWLAvfvTHem9AcCkj9GHz9/W5b/eokp7vFLzhIdhPTr6aEkY6W8AJ
         HUeA==
X-Forwarded-Encrypted: i=1; AJvYcCVDEtBTBogO5TB2lBHv3/bTzsbdCxlC1C2/MGsIpbqV0saaWYvFgN9MhDuileUKnemae9WrBQXfRy0YLHUUcmK37CKN/CnIqHdug19fEW0=
X-Gm-Message-State: AOJu0YxnkE6jBdHujxUSC40cGBOpgWKUBGCwDfLjICFz+kn7/ddBcSgi
	vTmUmcOwg8Mr22RFynrvA/3x1lTaQrKirjmYkahclZZLTA3IeXZe4r0d9xAIybs=
X-Google-Smtp-Source: AGHT+IHqo2TyVjn3Os5bPfWfibGbr6SfPjXd0ekwCoRyERAQ53fsLWLMdnXT9nbbVyvY9U2Nxln+Xw==
X-Received: by 2002:a05:600c:4f84:b0:412:c1d4:dd0d with SMTP id n4-20020a05600c4f8400b00412c1d4dd0dmr1173256wmq.3.1709216465376;
        Thu, 29 Feb 2024 06:21:05 -0800 (PST)
Date: Thu, 29 Feb 2024 15:21:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] README: bump minimum required clang/llvm version
Message-ID: <ZeCS0OC4FsbEXo8S@macbook>
References: <20240229095529.17723-1-roger.pau@citrix.com>
 <20240229095529.17723-2-roger.pau@citrix.com>
 <780ec3ab-08e3-4fd8-a85f-0e89ea75dcc8@suse.com>
 <ZeB7S6i7pIwzkUNE@macbook>
 <78032daf-9052-4ab8-ba05-456fa4aee17b@suse.com>
 <132dde96-d7d3-4823-8a0e-7b4a62526f2e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <132dde96-d7d3-4823-8a0e-7b4a62526f2e@suse.com>

On Thu, Feb 29, 2024 at 02:12:26PM +0100, Jan Beulich wrote:
> On 29.02.2024 14:01, Jan Beulich wrote:
> > On 29.02.2024 13:40, Roger Pau Monné wrote:
> >> On Thu, Feb 29, 2024 at 01:11:55PM +0100, Jan Beulich wrote:
> >>> On 29.02.2024 10:55, Roger Pau Monne wrote:
> >>>> --- a/README
> >>>> +++ b/README
> >>>> @@ -41,7 +41,7 @@ provided by your OS distributor:
> >>>>          - GCC 4.1.2_20070115 or later
> >>>>          - GNU Binutils 2.16.91.0.5 or later
> >>>>          or
> >>>> -        - Clang/LLVM 3.5 or later
> >>>> +        - Clang/LLVM 14.0.0 or later
> >>>
> >>> Wow, that's a big step. I'm build-testing with Clang7 on one system and
> >>> with Clang5 on another (and the latter more frequently than the former).
> >>> If any real dependency on this new a version (about 3 years old?) was
> >>> introduced, I would then no longer be able to locally test any Clang
> >>> builds (and hence the risk would again increase that I introduce issues
> >>> that affect just Clang builds).
> >>
> >> Would it be possible for you to update to a newer version?  I see both
> >> the OpenSUSE containers in Gitlab have newer versions of Clang.
> > 
> > No. These are SLES versions which I'm not intending to touch. See
> > 
> > https://lists.xen.org/archives/html/xen-devel/2024-02/msg01793.html
> > 
> > and
> > 
> > https://lists.xen.org/archives/html/xen-devel/2024-02/msg01795.html
> > 
> > for why. The most recent piece of hardware I've installed a fresh (but
> > not exactly new, yet still fully supported) SLES version on would
> > apparently offer Clang7 only, either.

Hm, OK.  Would containers be an option?

I don't know for gcc, but for clang I'm quite sure the only run time
tested builds are the ones used by FreeBSD.  I'm hesitant to claim
clang versions as supported when they are only tested to generate an
output without triggering any errors, but there's no testing at all
that the generated code is functional.

> Bah, that's not even Clang, only LLVM.

I'm confused by this, doesn't your llvm package include clang?

Thanks, Roger.

