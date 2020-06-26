Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667A820B06F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 13:28:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jomWo-0008M2-Op; Fri, 26 Jun 2020 11:28:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPqg=AH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jomWn-0008Lv-0t
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 11:28:17 +0000
X-Inumbo-ID: 20997f0a-b7a0-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20997f0a-b7a0-11ea-bca7-bc764e2007e4;
 Fri, 26 Jun 2020 11:28:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z13so9155409wrw.5
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 04:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=0A7365tN2dnp2+z5BYZNMahPAbsFD0WtG7o+kA977BY=;
 b=fORFYXQVXOqnxSZO/OHvz4yOy4R49VDonoriO2pCwODMeShB4222flOHQMoXa+RrfY
 OsHSsUD4h4/g9y18m8wVoJC/Wy8+VADoF8yltUDK0XnAaaTymRWh6OBJjlp6be/tSxVX
 Cnzef+UaOYMH/nZDg1b36ZCY3UP+XBXVJO0bw3PCCJzm1dr6HuqUroSxwEFoa60Y5zkz
 7xUyOxte7NOAoaMEuvMNRUl6ONtHEXNqvBBDeu3iCpk08+3yyhrgFTuRUFzNqu7j1QQG
 9FSKaT2t8HSDOMQrMmUmnNFIuDKGPrCuiLZisrtosSfmn+xd7owkVH9anXTBPhrBbsSL
 WDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=0A7365tN2dnp2+z5BYZNMahPAbsFD0WtG7o+kA977BY=;
 b=a7w16cowLQqE+n/BEg6zbJqxRV83qkqLHd48bLV8uCMxFdXb5tOwwJajGaW9TDX++g
 Cb/43WwRge7bqjfEqRoMzFhsu5NM7BwQT5x8A1OXKaq5MFUlrHXgN0emQoJUuYi5PLR8
 3IdDf+UfLDOwfY+lPTeKIkTmOWX79cQKVvNZ4FkSMFsH/q5TR20XZyIbq5X8/zVgOJnd
 8mTdvbuMaxHf8yS/XV+5+DkSRynAWQX/q5Np2wdRBf15OZVhfTrJ7R+rmOg9fDOj+Jk+
 hQHvv/7x7KnUUYyi/QzVto/Mz4e1iC+gAZoNiJJ0wt+4YOQ4+taE3+lYT3WHcVEFowjk
 Jihg==
X-Gm-Message-State: AOAM531gV97v5J+MxMOsLNftt1LVIBDM7Qh9cGGjBjH4y91GxZkwel7x
 IAvn6KcOWRHRUFMGa3HUgQE=
X-Google-Smtp-Source: ABdhPJwNJpRU2/Oz65xkWCSTRZAaGZUcA0Wh36182wY0eTM20lws3DuykHfL3J3UzJYpdnet2aoplg==
X-Received: by 2002:adf:c986:: with SMTP id f6mr3343956wrh.168.1593170895417; 
 Fri, 26 Jun 2020 04:28:15 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id d28sm39384548wrc.50.2020.06.26.04.28.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jun 2020 04:28:14 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>,
	"'Ian Jackson'" <ian.jackson@citrix.com>
References: <ebdcefb5ab4b9053dee7c090b4e6562e597b3474.1592151144.git.gorbak25@gmail.com>
 <24295.36070.945693.791220@mariner.uk.xensource.com>
 <20200615155646.GI735@Air-de-Roger>
 <24295.41945.883230.966002@mariner.uk.xensource.com>
 <003401d64337$f43c1990$dcb44cb0$@xen.org>
 <24295.45650.388910.186169@mariner.uk.xensource.com>
 <20200626112523.eh6lpm5hudkjmg4l@liuwe-devbox-debian-v2>
In-Reply-To: <20200626112523.eh6lpm5hudkjmg4l@liuwe-devbox-debian-v2>
Subject: RE: [PATCH] libxl: tooling expects wrong errno
Date: Fri, 26 Jun 2020 12:28:13 +0100
Message-ID: <000701d64bac$e1d689c0$a5839d40$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJRrVmR5Atw2cuOlpDTe0mFV6HHUQIpYa7PAtS50FEBvgZ2vQGhrmapAf99wXUBUCvbQKeWkvtg
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>, jakub@bartmin.ski,
 'Andrew Cooper' <Andrew.Cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 'Grzegorz Uriasz' <gorbak25@gmail.com>,
 'Anthony Perard' <anthony.perard@citrix.com>,
 'Jan Beulich' <jbeulich@suse.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org, contact@puzio.waw.pl,
 'Roger Pau Monne' <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 26 June 2020 12:25
> To: Ian Jackson <ian.jackson@citrix.com>
> Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; 'Grzegorz Uriasz' <gorbak25@gmail.com>; 'Jan
> Beulich' <jbeulich@suse.com>; Andrew Cooper <Andrew.Cooper3@citrix.com>; Kevin Tian
> <kevin.tian@intel.com>; 'Wei Liu' <wl@xen.org>; jakub@bartmin.ski; marmarek@invisiblethingslab.com;
> j.nowak26@student.uw.edu.pl; Anthony Perard <anthony.perard@citrix.com>; xen-
> devel@lists.xenproject.org; contact@puzio.waw.pl
> Subject: Re: [PATCH] libxl: tooling expects wrong errno
> 
> On Mon, Jun 15, 2020 at 06:39:30PM +0100, Ian Jackson wrote:
> > Paul Durrant writes ("RE: [PATCH] libxl: tooling expects wrong errno"):
> > > > -----Original Message-----
> > > > From: Ian Jackson <ian.jackson@citrix.com>
> > > > Thanks for the analysis.  So:
> > > >
> > > > Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> > > >
> > > > This would seem to be a backport candidate.  AFAICT check has been
> > > > there, looking for ENOSYS, since this code was introduced in
> > > >    826eb17271d3c647516d9944c47b0779afedea25
> > > >    libxl: suppress device assignment to HVM guest when there is no IOMMU
> > > > ?
> > > >
> > > > But that commit has a Tested-by.  Maybe Xen changed its error return
> > > > at some point ?
> > > >
> > >
> > > Yes, it happened in 71e617a6b8f69849c70eda1b3c58f1ff6b244e5a
> > > use is_iommu_enabled() where appropriate...
> >
> > So,
> >
> > Backport: 4.13
> >
> > Thanks!
> 
> This is not yet committed. Paul, can I get a release ack from you?
> 
> Wei.

Yes.

Release-acked-by: Paul Durrant <paul@xen.org>

> 
> >
> > Ian.


