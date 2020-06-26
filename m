Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C8620AFEC
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 12:41:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jolnH-0004Ug-KX; Fri, 26 Jun 2020 10:41:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPqg=AH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jolnG-0004Ub-Fv
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 10:41:14 +0000
X-Inumbo-ID: 8e4c8a08-b799-11ea-8496-bc764e2007e4
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e4c8a08-b799-11ea-8496-bc764e2007e4;
 Fri, 26 Jun 2020 10:41:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id g18so9052472wrm.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 03:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=hrZx328xFMdqRk3GEzuNDkIS4cmTBPvBlwK6wnYbx/Q=;
 b=s0XsWscjF6IL2OxcvbGnbl2/251Nm2z0aL+0V1SW3ULwaaG9CXWJvOT+xHfdMEV/hw
 gDOoxyR1hdntTGjzS/OQfeSAwmlGiiblu1jyD9bC6RFrdqR0cXwN93XEUVbnxi8U5Cw/
 rz3HP2zP7oWop19eEVSXG+w5eGiNVaSl2I8EWExcOtf7fMEskXSFUHZJy8tCWBP6Vhxd
 WtBxV+NYMduZ1U4PBI2BxhvsAgk1nrjvcG8Ldt1FkBBT3y27jfP27KqAoRug36YDTAYm
 o4HF0+J12YSHBnLutEXdMHx6idI4mdwLYqZ88DP4QhjfsUmF5aOGAnKmF63/hmKwNDhn
 BRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=hrZx328xFMdqRk3GEzuNDkIS4cmTBPvBlwK6wnYbx/Q=;
 b=IuWXGP5voM75ZSghwqZMuu7x9wOIL226Ia01Ivhp8DIXDRSNUGah8wtuk2Y7poTYpo
 RpZH4vCZ2z2FIdbnw2TszdiIGdVg86oGKTkC13WLCdxmrxkt0n+TJad/4W1Atlcde5Ej
 W/4MRFGNg6SINCLxryl1cL7qrUml/C3VDkZkhN5+OYyQlgEWp0LZhb+kzSuVttIL7pm4
 M5q/nc+J09XxMJ1M8DS09AELS8NtqB9GYdT34AEWDLFucjK6k9oMnxHCMQQu84D7CJ/n
 lEXXJMSObsdCMIzRu8KFwW7f/Wfl9/vlm6/4q20YaEHHSusmW4plDrd46V0tq0chK0GL
 43Kg==
X-Gm-Message-State: AOAM532QL4rxqmcw9OGUGUNsVAlBOBnP+xmytb2/bCi4ECLbYyXpyVXJ
 XJioyFT9h6F1UomDalxoWj0=
X-Google-Smtp-Source: ABdhPJxLwspoXfM05fKDAJjGrgJk/lNl9mFqyUZOSnEVwg+LnZWVlVCcVy4z8vIdWiWqu4JkQ+R5aw==
X-Received: by 2002:adf:c404:: with SMTP id v4mr2911572wrf.85.1593168073051;
 Fri, 26 Jun 2020 03:41:13 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id a22sm17026455wmj.9.2020.06.26.03.41.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jun 2020 03:41:12 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>,
	"'Jason Andryuk'" <jandryuk@gmail.com>
References: <20200611032936.350657-1-jandryuk@gmail.com>
 <20200626101807.za6arkdlah7zsjzc@liuwe-devbox-debian-v2>
In-Reply-To: <20200626101807.za6arkdlah7zsjzc@liuwe-devbox-debian-v2>
Subject: RE: [PATCH v2 00/10]  Coverity fixes for vchan-socket-proxy
Date: Fri, 26 Jun 2020 11:41:11 +0100
Message-ID: <000501d64ba6$4f8d8f60$eea8ae20$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLDGQiei5IbGzqMSAjg0ij1F+BV+gLqYT69pvnHS1A=
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
Cc: xen-devel@lists.xenproject.org, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 marmarek@invisiblethingslab.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 26 June 2020 11:18
> To: Jason Andryuk <jandryuk@gmail.com>
> Cc: xen-devel@lists.xenproject.org; Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>;
> Paul Durrant <paul@xen.org>; marmarek@invisiblethingslab.com
> Subject: Re: [PATCH v2 00/10] Coverity fixes for vchan-socket-proxy
> 
> On Wed, Jun 10, 2020 at 11:29:26PM -0400, Jason Andryuk wrote:
> > This series addresses some Coverity reports.  To handle closing FDs, a
> > state struct is introduced to track FDs closed in both main() and
> > data_loop().
> >
> > v2 changes "Ensure UNIX path NUL terminated" to avoid a warning with
> > gcc-10.  Also, "Move perror() into listen_socket" and "Move perror()
> > into connect_socket" are new.
> >
> > Jason Andryuk (10):
> >   vchan-socket-proxy: Ensure UNIX path NUL terminated
> >   vchan-socket-proxy: Move perror() into listen_socket
> >   vchan-socket-proxy: Move perror() into connect_socket
> >   vchan-socket-proxy: Check xs_watch return value
> >   vchan-socket-proxy: Unify main return value
> >   vchan-socket-proxy: Use a struct to store state
> >   vchan-socket-proxy: Switch data_loop() to take state
> >   vchan-socket-proxy: Set closed FDs to -1
> >   vchan-socket-proxy: Cleanup resources on exit
> >   vchan-socket-proxy: Handle closing shared input/output_fd
> 
> Acked-by: Wei Liu <wl@xen.org>
> 
> Cc Paul. V1 of this series was posted back in May. I consider this
> series bug fixes, so they should be applied for 4.14. The risk is low
> because vchan-socket-proxy is a small utility used by a small number of
> users.
> 

Agreed. Series...

Release-acked-by: Paul Durrant <paul@xen.org>

> Marek, you gave Review tags in v1. Do they still apply here?
> 
> >
> >  tools/libvchan/vchan-socket-proxy.c | 183 ++++++++++++++++++----------
> >  1 file changed, 119 insertions(+), 64 deletions(-)
> >
> > --
> > 2.25.1
> >


