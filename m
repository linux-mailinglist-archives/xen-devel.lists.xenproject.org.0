Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD03A1F767D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 12:10:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjgcx-0000IX-IW; Fri, 12 Jun 2020 10:09:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d5ow=7Z=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jjgcw-0000IS-4e
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 10:09:34 +0000
X-Inumbo-ID: cfb4e4dc-ac94-11ea-bb8b-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfb4e4dc-ac94-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 10:09:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c71so7561469wmd.5
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2020 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=MxgozEb2i3R/ZypnNmn6ONFzbH7k/LVj1DaDP20JXYk=;
 b=rdDSD0Sqo7CoUWmQBgYbwJxhEuZ8n+t1g8ucShTt9XiCODFpu4ZeiFwYitT9h/yXG8
 LO8lHQ99ZCKBgLrB2S40fHfipwAFdKMml6SqL6MsIPxie+CMlClDBsH3y4i3t6+8zu7l
 LVShV3udvNKxq2BwYNxhjix1VL3B4FsC3OCub2I+yT7/zI8X6fGKYTTk9w0MRSa3TGwX
 caMXqWsZYrJ7CkXRNMIbTgAYbezfdgddk/xDHkUdLgX7rt57GWGcOGA7k2mUByUeAA1Q
 YqCCGDIfSBiiu3sBeNMwGMghrxCnGBCxLy56vyya3wwWgpUNGpRUCUQSoxgTFDIhHG/u
 hbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=MxgozEb2i3R/ZypnNmn6ONFzbH7k/LVj1DaDP20JXYk=;
 b=ECen1mNFmRF/3q4zdK+8AFVJk10i/McCl+25GqhmAhLh3TTB1X5R6PVvEbfT7v0bgP
 tBSn4YQK0rdxcMssaAy8q6oGGrQxkzeIFZc/RUdcoMgsn1tDpLcEcVopzHrZOghEvn16
 xcazEoSY2TuQqgJ2szOYWWJZGdiBnET5MJEILFWNAY9hT6tnI7ESmSHuT/qIIHED+igC
 j3AleklnQSNX0t7F04dHsYbTz9aPHKHGEjlrFwjmWlwqaSZ+M19DQoCaEubwFN3A+erG
 +Om/DwZZWFqa8YJavtkN/8E6Y+SnGSHuhfcnTVXiNVqFWJ59IXGFRYSueC4h6HJvcdRU
 18+g==
X-Gm-Message-State: AOAM532Fe0adSwZ1UPApg0gXuuJiqjLB1JmfTOQINixBEFaDw7bVZtWw
 D9KCwdf7ucOcn+bjBzvMZII=
X-Google-Smtp-Source: ABdhPJzudNR6VzVn46ftmM/IMMdNpZ79rD4rj8q6PMRLHjPkHaRRaZzxDCakkjNGeujEfpWCNjzaQg==
X-Received: by 2002:a1c:de46:: with SMTP id v67mr12480072wmg.146.1591956572339; 
 Fri, 12 Jun 2020 03:09:32 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id o10sm9317514wrq.40.2020.06.12.03.09.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jun 2020 03:09:31 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200610114004.30023-1-andrew.cooper3@citrix.com>
 <010401d6408a$2c57bba0$850732e0$@xen.org>
 <765b4fed-60d3-9c4a-d6b7-bcd9893c525b@citrix.com>
In-Reply-To: <765b4fed-60d3-9c4a-d6b7-bcd9893c525b@citrix.com>
Subject: RE: [PATCH for-4.14] tools: fix error path of xendevicemodel_open()
Date: Fri, 12 Jun 2020 11:09:30 +0100
Message-ID: <000101d640a1$90d46800$b27d3800$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJVAhO9pRR+GTACAAMIE1rLmlKQ5AG8VqlrAqKoKA6ntEbMEA==
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
Cc: 'Juergen Gross' <jgross@suse.com>, 'Ian Jackson' <Ian.Jackson@citrix.com>,
 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 12 June 2020 10:54
> To: paul@xen.org; 'Xen-devel' <xen-devel@lists.xenproject.org>
> Cc: 'Ian Jackson' <Ian.Jackson@citrix.com>; 'Wei Liu' <wl@xen.org>; 'Juergen Gross' <jgross@suse.com>
> Subject: Re: [PATCH for-4.14] tools: fix error path of xendevicemodel_open()
> 
> On 12/06/2020 08:22, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Sent: 10 June 2020 12:40
> >> To: Xen-devel <xen-devel@lists.xenproject.org>
> >> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson <Ian.Jackson@citrix.com>; Wei Liu
> >> <wl@xen.org>; Juergen Gross <jgross@suse.com>; Paul Durrant <paul@xen.org>
> >> Subject: [PATCH for-4.14] tools: fix error path of xendevicemodel_open()
> >>
> >> c/s 6902cb00e03 "tools/libxendevicemodel: extract functions and add a compat
> >> layer" introduced calls to both xencall_open() and osdep_xendevicemodel_open()
> >> but failed to fix up the error path.
> >>
> >> c/s f68c7c618a3 "libs/devicemodel: free xencall handle in error path in
> >> _open()" fixed up the xencall_open() aspect of the error path (missing the
> >> osdep_xendevicemodel_open() aspect), but positioned the xencall_close()
> >> incorrectly, creating the same pattern proved to be problematic by c/s
> >> 30a72f02870 "tools: fix error path of xenhypfs_open()".
> >>
> >> Reposition xtl_logger_destroy(), and introduce the missing
> >> osdep_xendevicemodel_close().
> >>
> >> Fixes: 6902cb00e03 ("tools/libxendevicemodel: extract functions and add a compat layer")
> >> Fixes: f68c7c618a3 ("libs/devicemodel: free xencall handle in error path in _open()")
> >> Backport: 4.9+
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Ian Jackson <Ian.Jackson@citrix.com>
> >> CC: Wei Liu <wl@xen.org>
> >> CC: Juergen Gross <jgross@suse.com>
> >> CC: Paul Durrant <paul@xen.org>
> >>
> >> RFC - this is still broken.
> >>
> > I'm slightly confused. Do you want this in 4.14 in this form or are you expecting to update it?
> 
> In this form, it is an improvement over before.
> 
> There is still the crash described below which needs some form of
> figuring out and fixing.
> 

Ok, in which case consider it...

Release-acked-by: Paul Durrant <paul@xen.org>

> ~Andrew
> 
> >
> >   Paul
> >
> >> Failure to create the logger will still hit the NULL deference, in all of the
> >> stable libs, not just devicemodel.
> >>
> >> Also, unless I'd triple checked the history, I was about to reintroduce the
> >> deadlock from c/s 9976f3874d4, because it totally counterintuitive wrong to
> >> expect setup and teardown in opposite orders.
> >> ---
> >>  tools/libs/devicemodel/core.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
> >> index db501d9e80..4d4063956d 100644
> >> --- a/tools/libs/devicemodel/core.c
> >> +++ b/tools/libs/devicemodel/core.c
> >> @@ -67,9 +67,10 @@ xendevicemodel_handle *xendevicemodel_open(xentoollog_logger *logger,
> >>      return dmod;
> >>
> >>  err:
> >> -    xtl_logger_destroy(dmod->logger_tofree);
> >> +    osdep_xendevicemodel_close(dmod);
> >>      xentoolcore__deregister_active_handle(&dmod->tc_ah);
> >>      xencall_close(dmod->xcall);
> >> +    xtl_logger_destroy(dmod->logger_tofree);
> >>      free(dmod);
> >>      return NULL;
> >>  }
> >> --
> >> 2.11.0
> >



