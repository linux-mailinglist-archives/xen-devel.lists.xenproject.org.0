Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51F2759601
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 14:55:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565832.884390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM6hi-0007XD-Qw; Wed, 19 Jul 2023 12:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565832.884390; Wed, 19 Jul 2023 12:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM6hi-0007V4-NZ; Wed, 19 Jul 2023 12:54:54 +0000
Received: by outflank-mailman (input) for mailman id 565832;
 Wed, 19 Jul 2023 12:54:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Hz6=DF=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qM6hh-0007Uy-AZ
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 12:54:53 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72b20485-2633-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 14:54:50 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99313a34b2dso832313566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jul 2023 05:54:50 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t19-20020a1709067c1300b00988f168811bsm2317230ejo.135.2023.07.19.05.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 05:54:49 -0700 (PDT)
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
X-Inumbo-ID: 72b20485-2633-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689771290; x=1690376090;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YnZISCSl30HLhKCwlsmkigH+KLcMbv+jSOcCTVz0Oe4=;
        b=adOFosXsUaOqRkC1WtPa6wsRuh/+mqtvBB6ODWAQzpHBvVqyslCNDUSIR7S0/q/n+7
         IArvKYurUotv3TnZ/JosC6yvRRFO0wOYD6yiZXwUSo2AHC7uHdM6MisTNNLOtjRhz72P
         q7kgX5b0q7YHhPOHuQEV6RCS1dKZLR0tWmzK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689771290; x=1690376090;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnZISCSl30HLhKCwlsmkigH+KLcMbv+jSOcCTVz0Oe4=;
        b=EhRj/IMaShKVG1efuQKrV7MibSwcCrzBhRPJz6gR/je/71+ttRK18jyCdBbSBHdlvk
         n8e7A9Mh8tSOTQtDEzXelg3XzBeYx/FKiVA1V8Ffy2IZ+t/Fk1V0vycxfwqfE0h6fohT
         xwmmmQnvgE+sGS2HMK9lCDJfDELc4Azrm4gEQGssKQDerfGV1jyitJ5aFHJJfL5fyrCO
         9jPY0x5TpcOpRrYISuKuCR2oCCrmcnAaRNtqrGfWXUcdcPcWIjo+F2NeAyISz4hlOZSI
         lq5BIQT/dAmxcpPeVa8vehAP+qgEC4pKq960yfU6k+8REjsTfK+sMjYf7Oulfusi5AG9
         S6IQ==
X-Gm-Message-State: ABy/qLbTHt1qNTXHa7uzaih5WjVA1hk+djU4wloaBzItOPBx14hVoEJT
	ILql7jjTx/XlwOKX0RCmKH793A==
X-Google-Smtp-Source: APBJJlEixRXl91mIhNCAqYkQaSVyIPomTdN1UyiygGcNpSeomMWl6MfzG8We+2tBrCO54HZ8aCdCAg==
X-Received: by 2002:a17:907:728f:b0:994:17e3:2753 with SMTP id dt15-20020a170907728f00b0099417e32753mr3022361ejc.26.1689771290078;
        Wed, 19 Jul 2023 05:54:50 -0700 (PDT)
Message-ID: <64b7dd19.170a0220.26387.994f@mx.google.com>
X-Google-Original-Message-ID: <ZLfdGI1h/HwC+YKV@EMEAENGAAD19049.>
Date: Wed, 19 Jul 2023 13:54:48 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/mem: Make mem_hotadd_check() more legible
References: <20230719100808.4046779-1-andrew.cooper3@citrix.com>
 <64b7ca84.170a0220.758d8.90e0@mx.google.com>
 <468474ed-60b4-9ff2-83c4-036e1252b99d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <468474ed-60b4-9ff2-83c4-036e1252b99d@suse.com>

On Wed, Jul 19, 2023 at 02:09:55PM +0200, Jan Beulich wrote:
> > [1] The hand-crafted alignment there is going to collide with the efforts
> > to integrate automatic style checkers. It's also not conveying critical
> > information, so I'd argue for its removal in the spirit of making future
> > diffs less intrusive.
> 
> ... I don't agree here. First of all I don't see why this should
> make style checking harder. There's nothing written anywhere that
> such alignment padding isn't allowed in our code, so any checker
> we want to use would need to tolerate it. Plus while such padding
> doesn't convey critical information, it still helps readability.
> 
> Jan
Considering the last Xen Summit sessions I think it's reasonable to assume
we do want automatic style checking to become a reality. If we want an
automatic style checker to be eventually introduced I think we should be
mindful of style changes unlikely to be captured by _any_ policy we may end
up having. In particular, alignment of arguments across different
statements on different functions/macros is unsupported on (most?) major
style checkers, and that's highly unlikely to ever change.

In particular, any style checker must follow strict rules in order for it
to yield consistently deterministic results (otherwise it might suffer from
termination issues). Expecting a style checker to automatically generate
heuristics that happen to match our current code configuration is not a
realistic goal, I reckon.

In this sense, having a guideline (i.e: not a rule) about trying to avoid
hand-crafted alignment where the benefit of it is not critical would be
good. In the spirit of making a complicated problem simpler rather than...
well, complicated.

Alejandro

