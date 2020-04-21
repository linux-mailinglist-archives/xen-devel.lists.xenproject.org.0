Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FA61B2CC9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:35:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvrY-0000Lp-Ma; Tue, 21 Apr 2020 16:35:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zh6d=6F=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jQvrX-0000Lj-Ff
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:35:07 +0000
X-Inumbo-ID: 0e75d610-83ee-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e75d610-83ee-11ea-b58d-bc764e2007e4;
 Tue, 21 Apr 2020 16:35:06 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k22so6364026eds.6
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2020 09:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=jBH6wLTw5xYtoFHc9CAmsGToP+zT76M0LFJjcJ4nRYg=;
 b=Sp384YhaBHDUJHFoh+hYzGPOpMVjLo/BD4jyk5IVJDQocdAwQBAoQBuQp9yniVn4N4
 s2AiYDiz60zpkrO/RNQvR03Wyf9vGy5fqZYO6vvT0bGYbuSk5DggDpRlWZfmhrnc74gl
 oTGiIRzbdOTpRtFqHndO66znHBVNygnWK1kUgR8NsJRTd5OImYPb6j2mjOpVl2qiKTOs
 bgx2RUS4NgSxzDQA+FUrHaMFQqm5neJNX7srdMaDj3LQZzGXuAjaQPGtvDlwXtM2PN0x
 xgsh2sN+MfehD7L3O8ySldCugH+s74u+TJOSb+AmQSqmLRD/kcFhJWr1IGlEM3ZKozfi
 AGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=jBH6wLTw5xYtoFHc9CAmsGToP+zT76M0LFJjcJ4nRYg=;
 b=hD6d4RNnH5HJ3IfNVDmyJD4nRWuy6+9Rw9eLGzvCeJmFai7hINI+/ceilMhwsDYcHE
 WzxNvkP09pLU92ip9dxNIQRjeluKmGnaHDQihYUzQVvUBJX6n2g5QxHz5LaHr1+XH8FA
 khSBVJdm0oGMMNnf2RXe+WLk2HHYiwahDye7HGXjZSpkD8gP4U0QYibHQ3KPFIy8B3TG
 9XBw3meoJ6Iz+Se+lWOfDMuE5ntaPsCxSQVXByzmk2d05+SwarF2FQzY0OO8hzY8XAVl
 UrcBVZwXtYImoSCTCeBfECtWpNYB4M3KRHhF1pbMCNlsp7nR6iXdcksheaiNNVeWb6u0
 HH9Q==
X-Gm-Message-State: AGi0PuYv5rvPdFDFgmliCI/KuZJhwtXdulHAp1iac9d40fWCb6w3VSTf
 B5OYXSvl3HDxWSgj0u8jm4I=
X-Google-Smtp-Source: APiQypLPfczPzOtaPhKUfdgH1b3A3rAhZ7yd9Hk10EcwATviNuevw/qjdwinAM0Gy6WJoBhgy86fhQ==
X-Received: by 2002:a05:6402:2203:: with SMTP id
 cq3mr7735609edb.154.1587486905247; 
 Tue, 21 Apr 2020 09:35:05 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.177])
 by smtp.gmail.com with ESMTPSA id r26sm361132edw.34.2020.04.21.09.35.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Apr 2020 09:35:04 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Maximilian Heyne'" <mheyne@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20200313123316.122003-1-mheyne@amazon.de>
 <6f476505-5e85-8a8a-d6d7-db56ea921637@amazon.de>
In-Reply-To: <6f476505-5e85-8a8a-d6d7-db56ea921637@amazon.de>
Subject: RE: [PATCH 0/3] Cleanup IOREQ server on exit
Date: Tue, 21 Apr 2020 17:35:03 +0100
Message-ID: <005f01d617fa$cf921ad0$6eb65070$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGvBAjA7hxOW9V3ZNauiodGQFqJFQEiCWftqMjdIaA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ping v2?

> -----Original Message-----
> From: Maximilian Heyne <mheyne@amazon.de>
> Sent: 07 April 2020 10:16
> To: xen-devel@lists.xenproject.org
> Cc: Ian Jackson <ian.jackson@citrix.com>; Paul Durrant <paul@xen.org>
> Subject: Re: [PATCH 0/3] Cleanup IOREQ server on exit
> 
> Could someone please have a look at this patch? It solves an actual issue:
> Try soft-reset with qemu-xen-traditional and it will fail.
> 
> On 3/13/20 1:33 PM, Maximilian Heyne wrote:
> > Following up on commit 9c0eed61 ("qemu-trad: stop using the default IOREQ
> > server"), clean up the IOREQ server on exit. This fixes a bug with soft-reset
> > that shows up as "bind interdomain ioctl error 22" because the event channels
> > were not closed at the soft-reset and can't be bound again.
> >
> > For this I used the exit notifiers from QEMU that I backported together with the
> > required generic notifier lists.
> >
> > Anthony Liguori (1):
> >    Add support for generic notifier lists
> >
> > Gerd Hoffmann (1):
> >    Add exit notifiers.
> >
> > Maximilian Heyne (1):
> >    xen: cleanup IOREQ server on exit
> >
> >   Makefile            |  1 +
> >   hw/xen_machine_fv.c | 11 +++++++++++
> >   notify.c            | 39 +++++++++++++++++++++++++++++++++++++++
> >   notify.h            | 43 +++++++++++++++++++++++++++++++++++++++++++
> >   sys-queue.h         |  5 +++++
> >   sysemu.h            |  5 +++++
> >   vl.c                | 20 ++++++++++++++++++++
> >   7 files changed, 124 insertions(+)
> >   create mode 100644 notify.c
> >   create mode 100644 notify.h
> >
> 
> 
> 
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
> 



