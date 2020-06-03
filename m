Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B691ED35E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 17:30:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgVLo-000247-IN; Wed, 03 Jun 2020 15:30:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KLBN=7Q=gmail.com=glenbarney@srs-us1.protection.inumbo.net>)
 id 1jgVLm-00023s-R4
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 15:30:42 +0000
X-Inumbo-ID: 2c72665a-a5af-11ea-9947-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c72665a-a5af-11ea-9947-bc764e2007e4;
 Wed, 03 Jun 2020 15:30:37 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id c12so2344091qtq.11;
 Wed, 03 Jun 2020 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=14Oc4IIbH5lfOi6aqd01Xj+O/vzK1lMBVdL+M+b9qEo=;
 b=AeP1muxBvJ8Ah5fjIx/lOzHsPS2dY52HDYR9P4MMr2BX3Y9MpXeDPxThi0V2HfxHwg
 8K00mTUYj/D4BsSNp8yNoRcfC9gEA8IZkBxCrb0Kwu9T27RRcL3n8bjm2WUbdnrpBes9
 NGhv5Ei8bEUZsdZAK92A9+hMgCl+emMyKa5pIRnIjKz2dFZLrI5jh63XuZyJbxFY+EJJ
 uu4KliNUkxLdUQU3W3+0yRDVdBNg0Q2ryDAnvA7BJlmuPkFvh0Ol3NavDhrIRF2WIWK7
 g+uwRKp0MXYOHW7zDqIKqTuhSWSSSokbZDx4/OzM+7QzqgCOCL25byJHIJKFCOBj0jsC
 6bVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=14Oc4IIbH5lfOi6aqd01Xj+O/vzK1lMBVdL+M+b9qEo=;
 b=EYs2dR+GZbqhyPqUpMR19waCBLgjEfCK3ezPqJZJAIS0K68Y6WRhVojQKk0IqnkdwU
 4+emLGy8FVdrUoAgc1fBkn8YE0Y1KygSulMxuGmVTtqpjhu57RJRxonIA7ywwEGP9bBN
 JyGuGcYsYKSiFKfSF9udPHsMqsMfBMaqZcET4BLSWYAnf4yDSWzIPnF1gxF0X/32mu8Q
 Rec1LHRStfzoTjnisH80vwyIqr+7tqowiSV8mmByzQ016rsOC33zvxglFEASw+XvYusF
 YVxeJii1NPDO+fZQaDTHC9ew6F/aSa4I1Jgsr0BnXeslpP3ObhNaEMhbBNFi8LASCFP5
 WA1A==
X-Gm-Message-State: AOAM532Dc53nbRp1EIPUl/6YR29Iet1Hpzuzayh7I+7J5KwqleinYZ+B
 CRdvfOtY5VyuX+4ZocgdYSfCq8GuZbfAJaoV+hbKU1Py
X-Google-Smtp-Source: ABdhPJyNSWpPY64RY+qSK3E7xvi3A2r1Klf5W2PdU1VHfuLglYenpIkfs6+2+QK8vHkLyipsx224MnDjGRijQuxY5mo=
X-Received: by 2002:ac8:5148:: with SMTP id h8mr31684113qtn.316.1591198236813; 
 Wed, 03 Jun 2020 08:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAG6MAzRcvUifqf=m7EE98bz0w_s2+Z=0Nx7YT0SVv75ek0Mc2Q@mail.gmail.com>
 <CAG6MAzR_bU5qnCLKpuUAt-S_dfxjnxgh12gUjnXfsfC7Fw2qMw@mail.gmail.com>
 <CAG6MAzSS0Kw2KHWZpb6O9kfoDKK2spn_WHfy9gnZcZLvES0wnQ@mail.gmail.com>
 <CAG6MAzRZsSaVdO6Qv+Xi1dpaUsrdh+kT9F-_K=8s7fHyXRbFWQ@mail.gmail.com>
 <CAAVVsFmwoopngy6U8z1vUBH5j0gzuTLcMX+NcjQRjwshNr_LDw@mail.gmail.com>
 <CAG6MAzQ4QQjre7o5iLN5gX9=mRkJzy_pDM+aRgXi999yfp0srg@mail.gmail.com>
 <CAG6MAzQfX13KuaWtmJb_3Srdt5FTV+nvKmnNVXq5j8QF44NhTw@mail.gmail.com>
In-Reply-To: <CAG6MAzQfX13KuaWtmJb_3Srdt5FTV+nvKmnNVXq5j8QF44NhTw@mail.gmail.com>
From: Glen <glenbarney@gmail.com>
Date: Wed, 3 Jun 2020 08:30:23 -0700
Message-ID: <CAAVVsFmExExdwkokB1i9=KwT8k=eHABQZruYiA9Yr2MJ7ibyWA@mail.gmail.com>
Subject: Re: [Xen-users] xen domU stall on 4.12.1
To: Tomas Mozes <hydrapolic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tomas -

On Tue, Jun 2, 2020 at 7:43 PM Tomas Mozes <hydrapolic@gmail.com> wrote:
>> On Mon, Feb 24, 2020 at 4:55 PM Glen <glenbarney@gmail.com> wrote:
>>> I'm now going to bring one of the previously-live guests on its own
>>> host back to credit2 so I can crash it and try to capture debugging
>>> output for xen-devel as requested.  But sched=credit is definitely
>>> what we needed to solve this problem!  Thank you all for helping us
>>> get there!
> Just tested Xen 4.12.3, but a domU hanged again with credit2. It works rock solid with credit1.

I have several hosts back on credit2, no problems so far.  But the
bulk of my production hosts are still on credit1, and they do seem to
run "better" (subjectively, looking at responsiveness and load
averages) but of course by subjectively I mean that I have no real
data to back this feeling.

I was hoping one of my domU's on credit2 would crash so I could grab
debugging info for the development team - I hope you are/were able to
grab and submit data on that crash???

Glen

