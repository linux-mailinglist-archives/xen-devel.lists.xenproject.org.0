Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A641F9AA8
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:46:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqNL-00032r-0X; Mon, 15 Jun 2020 14:46:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8mLd=74=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jkqNJ-00032j-Ha
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:46:13 +0000
X-Inumbo-ID: f51ae72e-af16-11ea-bca7-bc764e2007e4
Received: from mail-ej1-x631.google.com (unknown [2a00:1450:4864:20::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f51ae72e-af16-11ea-bca7-bc764e2007e4;
 Mon, 15 Jun 2020 14:46:12 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id p20so17706870ejd.13
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 07:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=bV64FyCkRZZlsx2qh3xtsoegoc2vBUKU/6KGSKbhJsQ=;
 b=qPkV5H0QY+NbcSESAgZ+OdZK88+AQ7Io0M5SD7SIOzYL1UD+WytVbA3xCRjiDssNFr
 lDRWtI6OZocIekfp9CuKTzsGyA3QlkBCIyDXvaU9RJwoEVYLTdB2kt80oolKSw/2+abN
 PO16ct7mpca1ez2NeCojZ9+fprlvAX5WU99W8vcs0dIpec79Hirl3ANNvUl5zGRSKqgD
 NF01naEr6UZsx7vyWcM+s2ep9AcZg1mwXcA0Q/4Np2IB9Sdz2nGUqCPmA31SmWw0MqF8
 /VwzvupS8QQMPQyVhrnwGkfRs1TEnJiBYhBfZj+3HxpqmQf/PSAZ17flzPb9rAGjUgsy
 9LJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=bV64FyCkRZZlsx2qh3xtsoegoc2vBUKU/6KGSKbhJsQ=;
 b=BZxJ2GNMzdVoeOlMOTCC9aMsYVp7x4enfBrWzXiKoi02qnQzUG9srj3lWkOKz+zn36
 xBTkX6g00m4XCLvZd7J+TS3mNcAVpx8weLB4lNXcHI2dndSQhsXYKEpT7x1qYL9lwsPe
 qpWebbPrUIV+nyQrD6aTSBhTPORujY/tVwpQ6jY6rj+NNVZfP7mQ7xdAKI5QiygbWWwS
 mXwGMMVcIwmyoOmCJWtvLrmQHFDOPCxLY2+S8M27Zh6jx0UjwzdsrHr//1TAbQ3Yfg5l
 P5j8W9/1WZ2vAKnNsRIuY0zLGJnLKb/dnFY4qRnkhg7jAwMjsWmAPbwg53O4rx60AMxx
 0mhA==
X-Gm-Message-State: AOAM5312j7EjBHXReGSZC2+7+lb5uIUOoC/S29XLAj4NsQz1fepPLt/c
 9sW1xoqav3/xcAGxWo32/Mw=
X-Google-Smtp-Source: ABdhPJwm3Inq9ex3n+bYEY6HT3j9GFdFKAkT1o3yhAe4n9dfUsa9wQw7rtTS+xIQXmbacguk7nxGFw==
X-Received: by 2002:a17:906:1386:: with SMTP id
 f6mr24978433ejc.66.1592232372123; 
 Mon, 15 Jun 2020 07:46:12 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id h17sm8601980edw.92.2020.06.15.07.46.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 07:46:11 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>,
 "'Nick Rosbrook'" <rosbrookn@gmail.com>
References: <d2ca8de34a0711313e5eb1d5fb7d438ff3add7d0.1591971605.git.rosbrookn@ainfosec.com>	<24291.45045.185355.587474@mariner.uk.xensource.com>	<20200612215028.GA6286@six>	<24295.31778.201405.748753@mariner.uk.xensource.com>	<20200615143254.GA29455@six>
 <24295.35026.88022.957662@mariner.uk.xensource.com>
In-Reply-To: <24295.35026.88022.957662@mariner.uk.xensource.com>
Subject: RE: [PATCH for-4.14] tools: check go compiler version if present
Date: Mon, 15 Jun 2020 15:46:10 +0100
Message-ID: <002e01d64323$b64bddf0$22e399d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLvj3Cx2rRj513IhzeScODzcD7DmQK76zXVApflE6YCG+OqCAHzOOCIAtIKIUWmRYCswA==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Nick Rosbrook' <rosbrookn@ainfosec.com>, xen-devel@lists.xenproject.org,
 'George Dunlap' <George.Dunlap@citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 15 June 2020 15:42
> To: Nick Rosbrook <rosbrookn@gmail.com>
> Cc: xen-devel@lists.xenproject.org; paul@xen.org; George Dunlap <George.Dunlap@citrix.com>; Nick
> Rosbrook <rosbrookn@ainfosec.com>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH for-4.14] tools: check go compiler version if present
> 
> Nick Rosbrook writes ("Re: [PATCH for-4.14] tools: check go compiler version if present"):
> > > Ideally at some point maybe we would make this clearer but not now.
> >
> > Okay, sounds good.
> >
> > > Have you tested the situations you describe ?  That might be a better
> > > way of checking that it's right than the code inspection which is
> > > obviously failing for me now...
> >
> > Yes, I have tested the following situations:
> >
> >   (1) ./configure without go installed => go is not enabled
> >   (2) ./configure with go version < 1.11.1 => go is not enabled
> >   (3) ./configure with go version > 1.11.1 => go is enabled
> >   (4) ./configure --enable-golang without go installed => error
> >   (5) ./configure --enable-golang with go < 1.11.1 => error
> >   (6) ./configure --disable-golang in any case => go is not enabled
> 
> Thorough!
> 
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> Paul, this should go into 4.14.  Can I have a release ack plase ?

You may...

Release-acked-by: Paul Durrant <paul@xen.org>

> 
> Thanks,
> Ian.


