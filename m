Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448C71ECDB1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 12:37:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgQmI-0003RV-K1; Wed, 03 Jun 2020 10:37:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0NKV=7Q=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jgQmG-0003RG-Pf
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 10:37:44 +0000
X-Inumbo-ID: 41c40ec4-a586-11ea-9dbe-bc764e2007e4
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41c40ec4-a586-11ea-9dbe-bc764e2007e4;
 Wed, 03 Jun 2020 10:37:44 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id l26so1408938wme.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 03:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=MLU5khfbr7JsqvosO9o/P4FiYWqNa4DvdOELnUFqTOE=;
 b=fq5yD9vPOzqXwmPUbjASn3g2y/dI5Z43yaS6K5HsqaW/jMeybE+JuZ3OXbzP21Nz0h
 ++CWpcR7owQrdIJ37yad+NNbl3S5zPpGKt3+2j9pVfcebs6PREY8jtejWv+K2z2Hhvls
 Q5uW1f1zTLFMDJmGPxAmka6EsKhXc+neRUnUX3EWp7yBqFluYQtNgAnf9ehnfSzdxxgc
 F6AbZHxT0anE06KTNXPQbbmA8qzjSONVJmB2keK+qwZb2SF/1d7M4K9kqF4pXX2nIxUW
 L2wfgtYYWwxF72hA5jdlV1xnY+/9S81RTXV9p3dfWdxBCICRLwgcXn4vqk3u96e/Xf/y
 rNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=MLU5khfbr7JsqvosO9o/P4FiYWqNa4DvdOELnUFqTOE=;
 b=SbDYhmB6q6gFaEfEiLmv0zv6vmVluSMhIqwhiHcI3MsyuAuQwutfHNkidutWzob5tz
 UK5/dyoYQnsbccsONX6J8KSJtdIP3fu0EVl3guSOUwM76/2qYYtpSf9mI3IVxDeDplOJ
 7Sbri9z6KWluZ1QYx5DP9rH0zEMnUMo/f7cjHe2Cez+gSGpx45A2R4Lk5G7BuTFY9Q5o
 gwSxRmmJxGaldblQM9jOsivBHPOEnb9+Tp0H6By4InxOq6/b6BOE8KxlwgnG59MIgKE/
 Rshv4hVzOoChd4Mxd5V962argdS7tTGnmqzI0snrsHgCMFirt9N9L7XquvB1DbnmEAVs
 W8MQ==
X-Gm-Message-State: AOAM531qo+J0SNHPP2rfDqMBvysEnFY8m7U2lXaF5cZ+iReTPkyQk0HJ
 er87Co0rGQqjthAMsXsuLJE=
X-Google-Smtp-Source: ABdhPJzjL1a5ycQj8kmeVmMg8kvy3hEVZT7aNfil4y1xpKaz+MhTJ/pjSnWigSqNOsXopjT8TJaH/g==
X-Received: by 2002:a1c:24c6:: with SMTP id k189mr8638556wmk.9.1591180663194; 
 Wed, 03 Jun 2020 03:37:43 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id o6sm2717059wrp.3.2020.06.03.03.37.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jun 2020 03:37:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>,
 "'Roger Pau Monne'" <roger.pau@citrix.com>
References: <20200528102648.8724-1-roger.pau@citrix.com>
 <24279.29302.517771.382439@mariner.uk.xensource.com>
In-Reply-To: <24279.29302.517771.382439@mariner.uk.xensource.com>
Subject: RE: [PATCH 0/2] osstest: update FreeBSD guest tests
Date: Wed, 3 Jun 2020 11:37:41 +0100
Message-ID: <001901d63993$02f73720$08e5a560$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJmWAE7/fGO/u5K1e2UODFOX0tHRAM8LhApp4yRnBA=
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
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <xadimgnik@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 03 June 2020 10:51
> To: Roger Pau Monne <roger.pau@citrix.com>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant <xadimgnik@gmail.com>
> Subject: Re: [PATCH 0/2] osstest: update FreeBSD guest tests
> 
> Roger Pau Monne writes ("[PATCH 0/2] osstest: update FreeBSD guest tests"):
> > The following series adds FreeBSD 11 and 12 guests tests to osstest.
> > ATM this is only tested on amd64, since the i386 versions had a bug.
> >
> > The result can be seen at:
> >
> > http://logs.test-lab.xenproject.org/osstest/logs/150428/
> 
> Thanks, Roger.
> 
> I think that for this change I ought to get an ack from Paul as the
> RM.
> 
> Paul: how do you want to handle osstest changes during the freeze ?  I
> already pushed on Monday - without asking you - a series to fix a
> problem with bisection which was stopping osstest from bisecting the
> libvirt failure in the smoke tests.  Please let me know if you think I
> should have checked with you.
> 

I'm no expert in osstest so I need to trust your judgement as to whether a patch is needed for 4.14 testing. That fix was clearly
necessary to help diagnose the libvirt issue so I don't think you need check with me for such things.

> I think we should take this change from Roger.  Right now we are still
> waiting for even the smoke tests from staging to pass.  I don't
> think this would interfere with that nor will it get in the way of the
> osstest buster upgrade.

We should certainly try to limit changes to only those where really are beneficial for 4.14 at this stage, but it looks like this
series is adding more relevant testing (i.e. on newer OS) so I think it qualifies.

  Paul

> 
> Thanks,
> Ian.


