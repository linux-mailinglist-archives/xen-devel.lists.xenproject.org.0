Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F071F9A52
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:33:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqAW-00022V-IX; Mon, 15 Jun 2020 14:33:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EAde=74=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jkqAV-00022Q-3z
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:32:59 +0000
X-Inumbo-ID: 1bfc8be2-af15-11ea-8496-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bfc8be2-af15-11ea-8496-bc764e2007e4;
 Mon, 15 Jun 2020 14:32:58 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id q8so15841502qkm.12
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 07:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xoZYTOrbaJ/qtaL6gpEpGtLcw0cV9fBngumMP/8sReM=;
 b=QqMwmPns7wD3eXZ6V0fxcUauGKmQdLa0qaGV+ui0UVjeLm3GJOf8PkWn05rZLVZ6cU
 MNa1fpNum1BkwRikQ/FGMbdafVZwS/DW4pPKA+l2KZj/kagtsti+YhIbeAc50CW8KIP4
 IQXfGQm3t3C2zqMW/IvYHKtXWtBV3F3xANmv00MdwJYw9bZNg767PYgzbMQ6XmcyDAFP
 RULDhhEdblcWtq6b5nfNxZxBvH57qI+MSLsKUuPU4B1KNXGpB3DyY7g8qbYTEmC+sUEf
 023/tK/31qHeHLvT/0tXnylBikV/DgGwYRIAV+TGLSPQPx02Xxq+831Bor96wmzoU9ez
 7lNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xoZYTOrbaJ/qtaL6gpEpGtLcw0cV9fBngumMP/8sReM=;
 b=lnThhLiyoH1qhaW+rBzO7A+/d8nbSwGiuY9WZb2HkyHItCxY6sIaxuKNvhkSwjR5Wh
 IKnWP2Jeozc+sgIBe0bbuQWh0bK4QvDmCJKFW695yO0xQKHDsEQernu9ivQ/dfuZRgxP
 Q9IYPm2fGIsaPA275alSWTZ/3on0MPvwhNj/hIPE3aTlZkaL/Ys70WBKrovdrNacRUSQ
 1OgE8p4bWk7eIImUy0ML6iiCH4UllwM95vDV52XgpsWTICKDeOfeAMoS5aeNbJgeUZGH
 Y49rnpLYe796lSVayK4LfLYgiD19q1IZ4aedDY0xFCN7Emjkl+UUvxvfTxL6ewyRWfRV
 sIzQ==
X-Gm-Message-State: AOAM532xzTk1d8sYUmf6pQRhuAQOmAYl+4x298E0kKl0brBj4p32hDOy
 D9QAOjssqBcjqiY9rL+q2+Y=
X-Google-Smtp-Source: ABdhPJw/swk4IFbSzol+4IYT/MmFSzV1G1JXY4dekTCGcaYcTfpMcGWLNv9chzO3z40pRE2+DA0+Ew==
X-Received: by 2002:a37:f505:: with SMTP id l5mr15143174qkk.118.1592231578399; 
 Mon, 15 Jun 2020 07:32:58 -0700 (PDT)
Received: from six (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id d14sm10990442qkk.5.2020.06.15.07.32.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Jun 2020 07:32:56 -0700 (PDT)
Date: Mon, 15 Jun 2020 10:32:54 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH for-4.14] tools: check go compiler version if present
Message-ID: <20200615143254.GA29455@six>
References: <d2ca8de34a0711313e5eb1d5fb7d438ff3add7d0.1591971605.git.rosbrookn@ainfosec.com>
 <24291.45045.185355.587474@mariner.uk.xensource.com>
 <20200612215028.GA6286@six>
 <24295.31778.201405.748753@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24295.31778.201405.748753@mariner.uk.xensource.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> Ideally at some point maybe we would make this clearer but not now.

Okay, sounds good.

> Have you tested the situations you describe ?  That might be a better
> way of checking that it's right than the code inspection which is
> obviously failing for me now...

Yes, I have tested the following situations:

  (1) ./configure without go installed => go is not enabled
  (2) ./configure with go version < 1.11.1 => go is not enabled
  (3) ./configure with go version > 1.11.1 => go is enabled
  (4) ./configure --enable-golang without go installed => error
  (5) ./configure --enable-golang with go < 1.11.1 => error
  (6) ./configure --disable-golang in any case => go is not enabled
> 
> I definitely think we want to fix this for 4.14.  So thanks for your
> continued help!

You're welcome. Thank you again for the review.

-NR

