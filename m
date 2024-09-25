Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD69985648
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 11:24:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803672.1214381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOFe-0003Ha-E0; Wed, 25 Sep 2024 09:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803672.1214381; Wed, 25 Sep 2024 09:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOFe-0003FD-BS; Wed, 25 Sep 2024 09:24:02 +0000
Received: by outflank-mailman (input) for mailman id 803672;
 Wed, 25 Sep 2024 09:24:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stOFd-0003F3-BW
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 09:24:01 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5b42129-7b1f-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 11:24:00 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5356bb55224so8780101e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 02:24:00 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf49d23asm1664475a12.41.2024.09.25.02.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 02:23:59 -0700 (PDT)
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
X-Inumbo-ID: e5b42129-7b1f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727256239; x=1727861039; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O+086AQFO7CzN1/hotWCylRXy7yMXF8FwpxbwDdvwmM=;
        b=Qz496YDWpH1v+6ndqdX4CC0qbaG+vSWPMDLVx3DyhZP1a3DvXOdBAOczyUuAZIiic2
         Fg7kI51A2GKM3C1h0THj2URrbqZNj7NlRVIlyssQsNp5LznEWoR0awjT5+qCImrUIJ1C
         ydIOBYWEt12JzXqPIbfP1rAfPWjt9MVHTkVkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727256239; x=1727861039;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+086AQFO7CzN1/hotWCylRXy7yMXF8FwpxbwDdvwmM=;
        b=TBTMOucC6KLDjJaowmkkgaYc9vXNUT6IZmrbM0DliVf6ve+zkODI+oG6heV6Be0Zgh
         pqKdpnKUCSdVP6FUupxFx1yzmXXv3+lireQ69BYyRDz9LRIZBoNFnD3VO814TYr/FqM6
         xiXlkQSddINJD+7m6NfAZ9xIX26tp7ptOjaSHObtOzzlIx1kAGyX7CPzPuaQMT38zD2J
         mlgev37AJqp3MnTlf6f2KnQw1bE55Ig30B4PoVyeLYzc7nLBMhX59LAMQNOdJwNOnRg1
         jmJcnhxyc3oLs2wQt1ifMklMWWsOMGVZagV5zv506wSnF7Yqv29f16ZbI+8p4iNyQeQH
         v5xQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5k29BmSAjWeVx+eOrg2SSoA6l3iMxl1IcWNExhW+Dv3BUo5Aq7/3R5Fe2puGycB6yE7kD5Y6d0F8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCCslcy5XrS25YP6ZCasXxpe0W5IS42S5OZiM3yLnmSHDVFjxR
	pJo19DbUZsuNKG3Bhb7UKA7d6zx3c+fo44o251NWDWZmcRSQIpSWI0V9gPr+tVE=
X-Google-Smtp-Source: AGHT+IGyzzXyRI/8p2EtpfoqpmIEy0y3Nt5SDooFp4AHdFa2rqgMd0HBykXiHicdFp6WRW287PvgIw==
X-Received: by 2002:a05:6512:1188:b0:52f:c148:f5e4 with SMTP id 2adb3069b0e04-53870496978mr1130969e87.21.1727256239397;
        Wed, 25 Sep 2024 02:23:59 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:23:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 6/6] x86/alternative: build time check feature is in
 range
Message-ID: <ZvPWroluMNzSG0yU@macbook.local>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-7-roger.pau@citrix.com>
 <b34e0580-e5e1-48cd-94b3-f685562447fd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b34e0580-e5e1-48cd-94b3-f685562447fd@suse.com>

On Wed, Sep 25, 2024 at 11:04:45AM +0200, Jan Beulich wrote:
> On 25.09.2024 10:42, Roger Pau Monne wrote:
> > Ensure at build time the feature(s) used for the alternative blocks are in
> > range of the featureset.
> > 
> > No functional change intended, as all current usages are correct.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I'm struggling with what this is meant to guard against. All validly usable
> constants are within range. Any unsuitable constant can of course have any
> value, yet you'd then refuse only those which are out of bounds.

It's IMO better than nothing, and it's a build-time check.

Thanks, Roger.

