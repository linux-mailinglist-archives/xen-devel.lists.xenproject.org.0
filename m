Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E96636F330
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 02:36:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120269.227471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcH8Y-0004Od-6D; Fri, 30 Apr 2021 00:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120269.227471; Fri, 30 Apr 2021 00:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcH8Y-0004OE-30; Fri, 30 Apr 2021 00:36:06 +0000
Received: by outflank-mailman (input) for mailman id 120269;
 Fri, 30 Apr 2021 00:36:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kML/=J3=gmail.com=dmitry.torokhov@srs-us1.protection.inumbo.net>)
 id 1lcH8W-0004O9-Jy
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 00:36:04 +0000
Received: from mail-pf1-x433.google.com (unknown [2607:f8b0:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13cadac0-c82b-43e6-ae79-e4b3148ba746;
 Fri, 30 Apr 2021 00:36:03 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id c3so28553986pfo.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Apr 2021 17:36:03 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6b9:8bd2:eb38:bd68])
 by smtp.gmail.com with ESMTPSA id r1sm116104pjo.26.2021.04.29.17.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 17:36:01 -0700 (PDT)
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
X-Inumbo-ID: 13cadac0-c82b-43e6-ae79-e4b3148ba746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UolD5z9Y/BwrWE8luDd19ytyeSssaRdFYLJsKipLFwE=;
        b=P/hqpiRefzjeEw4nU1fSlFn3OVxYvpuMZfZOtvsE9FKNP0iM9pfamhPjP7nzXsyZks
         7FGb8fAE3eE/H38Tkf3mfJ3BuXYJQb3qvfwBH55NT08gzSgiF6fcPXOXOVcg9Kn64fYW
         aIGgSNRms0U7SqKlSgxjGekCy7UIVAT4vZh8XItASQdQ7WdO1W0ioS7E2EYui1rl7kQx
         zg4TGdIKRnQcctqJVilGt4Q6CNgOb/8hWvaNKxB//BK7l21yDYVtlifDhfjfwRRrRZ0o
         BsrVy/OBnnPGEZOCv1j1qbYCtWoBEOOn9yCfCVlARIj3RVO8lKNBhrNJC/8qHqtil02p
         4cHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UolD5z9Y/BwrWE8luDd19ytyeSssaRdFYLJsKipLFwE=;
        b=YQD3Pwz4+vz3hE9QuUpZGUfpR/kg5VmpXqujeJRFo3+3cdDbi+gi21jg7/8xtG/T/m
         mEzrBfbDCkuGnuppRQIbs1K+BI3OVf399zvgamxVaIC8iLWOjkybUHrDp377rZ481V/h
         IUoRkzzaPybwFvZv5nbdhnQrsqWNQqXenuH1NwhelDQ+M9EOkX9WCUUJot+T0XpZUGIT
         GAO8eAoRdsmi2sitVYEe29zOevWCTX+JMf7cFssz1Tklu0cmu3CnIcUeNreuyTK1LPSv
         NOk5eTDvFdhcraTXLOCPTVqBE2GZvhHRFzHSEv8yzU0GxuiEPTRziW5+WxOx+lLJtRzI
         Oauw==
X-Gm-Message-State: AOAM532SiiYPthDVxY1ca9lTecx1TYi7BWTAg8PNQ+1oH/p9K/YZdJXD
	VjnFEGI5pCiQ75IxN2+QsuY=
X-Google-Smtp-Source: ABdhPJyNGbP2VbFfAou8zF4qFbXsBnaLQgpNPjVDh6CubISsMJ3KofUDczPLdkcuMoJieU089rzJUQ==
X-Received: by 2002:a62:5383:0:b029:28c:8d9e:fa3d with SMTP id h125-20020a6253830000b029028c8d9efa3dmr595294pfb.50.1619742962896;
        Thu, 29 Apr 2021 17:36:02 -0700 (PDT)
Date: Thu, 29 Apr 2021 17:35:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Phillip Susi <phill@thesusis.net>
Cc: xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: Xen Virtual Keyboard modalias breaking uevents
Message-ID: <YItQ72UkqyKuHEk4@google.com>
References: <87o8dw52jc.fsf@vps.thesusis.net>
 <87fsz84zn1.fsf@vps.thesusis.net>
 <YIszOwADJ8jdBov8@google.com>
 <87o8dw8vyg.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o8dw8vyg.fsf@vps.thesusis.net>

On Thu, Apr 29, 2021 at 08:11:03PM -0400, Phillip Susi wrote:
> 
> Dmitry Torokhov writes:
> 
> > Not every keyboard, but all keycodes above KEY_MIN_INTERESTING which is
> > KEY_MUTE, so that interested handlers could match on devices they are
> > interested in without first opening them or poking through sysfs.
> 
> /Shouldn't/ they be reading sysfs attributes to find that information
> out though?  Isn't modalias there to help modprobe find the right module
> that wants to bind to this device, which doesn't happen for input
> devices?  If user space is looking at this information then isn't it
> getting it by reading from sysfs anyway?

Userspace may or may not have access to sysfs (it does not have to be
mounted) and one can have modules (input handlers) that want to bind to
a specific device (see joydev, mousedev as examples, although they are
not looking for specific keys).

> 
> What in user space looks at input devices other than X and Wayland?  And
> those aren't looking for particular "interesting" keys are they?
> 
> > I don't know why Xen keyboard exports that many keycodes ;) In general,
> > my recommendation is to mirror the physical device when possible, and
> > instantiate several devices so there is 1:1 relationship between virtual
> > and physical devices.
> 
> Xen guys: any input as to why it supports so many "interesting" keys?
> 

Thanks.

-- 
Dmitry

