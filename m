Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 382FB36F298
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 00:29:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120241.227407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcF9v-000172-Dc; Thu, 29 Apr 2021 22:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120241.227407; Thu, 29 Apr 2021 22:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcF9v-00016e-AT; Thu, 29 Apr 2021 22:29:23 +0000
Received: by outflank-mailman (input) for mailman id 120241;
 Thu, 29 Apr 2021 22:29:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5QnA=J2=gmail.com=dmitry.torokhov@srs-us1.protection.inumbo.net>)
 id 1lcF9t-00016Z-EI
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 22:29:21 +0000
Received: from mail-pl1-x631.google.com (unknown [2607:f8b0:4864:20::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c54d38aa-83fb-4f36-8d4e-dc3ec78d15a9;
 Thu, 29 Apr 2021 22:29:20 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id v13so21962959ple.9
 for <xen-devel@lists.xenproject.org>; Thu, 29 Apr 2021 15:29:20 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6b9:8bd2:eb38:bd68])
 by smtp.gmail.com with ESMTPSA id j7sm2048pfd.129.2021.04.29.15.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 15:29:18 -0700 (PDT)
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
X-Inumbo-ID: c54d38aa-83fb-4f36-8d4e-dc3ec78d15a9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sgF8y4qSHbAjhen0CmXgaqp9XHrSaJSa2Q0ESkD13WA=;
        b=tq/cCsIlvCnJBh+3GLUA7LgqRyfI04kFbPdD9WHZk2Znx/Zt/POlsXiTUSE7byz8iu
         5Nk1Vml6RCrecdX0Mj8NfTIy1LQSsNzyO6qPu1Ap6FbanlAKVxZi9rt/bAz94dpFmhdP
         FfPfYN3B90VIAW3APEFFyEFrZ0j0A5AYYbc3AA0jQBzMncEU0jXHmk7au9r966Q/ys+/
         DxUOK+OrQVAGqrM9DkAGb5x8mHOXQdtvz9BFfKc3nWPEhYULmb1iHgD4QOlv27PydA8h
         RdJDISkmkSr6mOEBfrUxevPGXE8GzZGH/jVoCgaf3XUrCmcqI7n5fwkR9p98ECahB/2y
         ycuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sgF8y4qSHbAjhen0CmXgaqp9XHrSaJSa2Q0ESkD13WA=;
        b=tELtKCimgvq+wbCLuC0aK3V768MV8HkIu2Dfp5Xt8EcWOzc+pgA/2GBjnKlazuEqPE
         F177w2fZ8RsoJKDfS4cHD0d9vzySUwVf9Mb9LJFDH6aS6Rhi64ELVRubyD6oyNO5rChv
         OrKgzJaUgS8sH0Csd0Nz3VuuWGmXKX6kSbLByz+CAH1Bv2R8SfHXS01mBr1VpkHmStb6
         pWZPQ3YfGhaCL+bh0zWb93TP+J2ic7wqrI5UouhvIolVzVAixumDKcBOtLpA1IExMY5z
         z6KqNXthtUPRZ6sWISNM0cybMDr7C7QD6fzu0IqdIA8IEMR4pJrAs/GCa5uK0656XCSD
         bWQQ==
X-Gm-Message-State: AOAM531hRcktiq3T3Xew1/AoD56QBQtxyZRob7fBP+gNHslNsmnOlA3B
	P/40dhUUE9mYPUAXeFlwe4E=
X-Google-Smtp-Source: ABdhPJwgS6dsHbtbdrmvAQv+WZG+s4dvsTwRZXxtfYQ5DPAe1rBRbtNpHlCFOQxg18hW22IsKoszwA==
X-Received: by 2002:a17:90b:915:: with SMTP id bo21mr2068048pjb.27.1619735359172;
        Thu, 29 Apr 2021 15:29:19 -0700 (PDT)
Date: Thu, 29 Apr 2021 15:29:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Phillip Susi <phill@thesusis.net>
Cc: xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: Xen Virtual Keyboard modalias breaking uevents
Message-ID: <YIszOwADJ8jdBov8@google.com>
References: <87o8dw52jc.fsf@vps.thesusis.net>
 <87fsz84zn1.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsz84zn1.fsf@vps.thesusis.net>

On Thu, Apr 29, 2021 at 04:10:09PM -0400, Phillip Susi wrote:
> 
> It appears that input/input.c is responsible for the insane modalias
> length.  If I am reading input_print_modalias() correctly, it appends a
> "k" plus every key code that the keyboard supports,

Not every keyboard, but all keycodes above KEY_MIN_INTERESTING which is
KEY_MUTE, so that interested handlers could match on devices they are
interested in without first opening them or poking through sysfs.

> and the Xen Virtual
> Keyboard supports a lot of keycodes.  Why does it do this?

I don't know why Xen keyboard exports that many keycodes ;) In general,
my recommendation is to mirror the physical device when possible, and
instantiate several devices so there is 1:1 relationship between virtual
and physical devices.

In cases where it is not feasible, we need to be more careful about
declaring capabilities. For xen-kbdfront I do not think the keyboard
portion should be declaring keys from the various BTN_* ranges.


>  
> Phillip Susi writes:
> 
> > So I have finally drilled down to the modalias for the Xen Virtual
> > Keyboard driver being so long ( over 2KB ) that it causes an -ENOMEM
> > when trying to add it to the environment for uevents.  This causes
> > coldplug to fail, which causes the script doing coldplug as part of the
> > debian-installer init to fail, which causes a kernel panic when init
> > exits, which then for reasons I have yet to understand, causes the Xen
> > domU to reboot.
> >
> > Why is this modalias so huge?  Can we pare it down, or or is there
> > another solution to get uevents working on this device again?  Maybe the
> > environment block size needs to be increased?  I don't know.
> 

Thanks.

-- 
Dmitry

