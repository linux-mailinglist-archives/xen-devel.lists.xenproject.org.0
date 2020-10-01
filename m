Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7293B27FA2C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 09:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058.3538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNsvq-0003lE-Gz; Thu, 01 Oct 2020 07:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058.3538; Thu, 01 Oct 2020 07:23:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNsvq-0003ks-Df; Thu, 01 Oct 2020 07:23:14 +0000
Received: by outflank-mailman (input) for mailman id 1058;
 Thu, 01 Oct 2020 07:23:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=937a=DI=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNsvo-0003kn-EP
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 07:23:12 +0000
Received: from mail-ed1-x536.google.com (unknown [2a00:1450:4864:20::536])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23f95e66-aa54-40dd-8b7e-63aae811e498;
 Thu, 01 Oct 2020 07:23:11 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id j2so4524444eds.9
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 00:23:11 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id v25sm3367939edr.29.2020.10.01.00.23.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Oct 2020 00:23:10 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=937a=DI=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNsvo-0003kn-EP
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 07:23:12 +0000
X-Inumbo-ID: 23f95e66-aa54-40dd-8b7e-63aae811e498
Received: from mail-ed1-x536.google.com (unknown [2a00:1450:4864:20::536])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 23f95e66-aa54-40dd-8b7e-63aae811e498;
	Thu, 01 Oct 2020 07:23:11 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id j2so4524444eds.9
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 00:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=wYXYRhwbqmixpIy79JPI8rc1fWn7WjBc8vOTcyZaeAo=;
        b=Jvn+7g9Zqz6rvpx76xXMbXzUXANqARBmBiB5JoGKr6YjBgGdIf0wX5vJZeKvfaptuj
         6js7CDLuAEzYLUT817IyWvYrZaqErBG9xP/ylC3x4J0vjMMBD1OpeQrZ5woUdAx+PgRu
         5FxI8KJUxGrUbtq1WzUzHccMGYdOHvnkakkMo9cgQtecD9wwWKbF94Gfnid8/ZcJ/6Zc
         DcvQRFazcFJdYe12Lp5COdAix6Y3SK5NJ91gsOd1ulqTgX4BKglPEli+t8OY42NhcdCX
         bUiEjshZT85HKbRQpA20dmiBb0p/vaZazjWdLwI69PF6R+SRby3eX2WJCNpm/qqjQM39
         F2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=wYXYRhwbqmixpIy79JPI8rc1fWn7WjBc8vOTcyZaeAo=;
        b=NQ4rcbw1BkLX36nz2kKnKGwH+vNIQggFZBKrQlMk7O0INfUt8aiELgPQCd8XtS/tMw
         p9HmDHZU5ZcKogn/NT93J/gYfJnX+MOoHT9wmokExtH+WeI2nv4theyWjAzT64NvCPxi
         DVDSuJsyGRjS+PXW0n+ZMpQ9ImdDDYTtrHTbmNCugg7l+JpsjgnuQlqQDeo7l1WHkgD7
         zzmaphm8agK8hIGo3NRA5NfK+2jnvmrTO0zsCIZSrqbEQhfUv4xklkRDT5/rj6MEz9WM
         SMuqjGJ4wAWL1o5AdwswAGfWLFnAytbtI5K2+xYnoUhHwXlUEExvXgwgW6PCKz5yHgNb
         uU6Q==
X-Gm-Message-State: AOAM5312eo5VDSPM19yJLuMxKECxHpOsZ/kUH98FuuyXoZciHDb6POvk
	Dk0Gi766S5PjC5cWySGDhtg=
X-Google-Smtp-Source: ABdhPJxJQ6M7A6YJ4r8gH3r6d3bHIxyT0A18LDHuTXv9xgXakxgl4JJCrgPt7ED/odJub3sxWzD7xw==
X-Received: by 2002:a50:cd48:: with SMTP id d8mr4406454edj.286.1601536990871;
        Thu, 01 Oct 2020 00:23:10 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
        by smtp.gmail.com with ESMTPSA id v25sm3367939edr.29.2020.10.01.00.23.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Oct 2020 00:23:10 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: <paul@xen.org>,
	<xen-devel@lists.xenproject.org>,
	"'Ian Jackson'" <ian.jackson@eu.citrix.com>,
	<wei.liu@kernel.org>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>
References: <20200915141007.25965-1-paul@xen.org> <001001d69328$0d2790c0$2776b240$@xen.org>
In-Reply-To: <001001d69328$0d2790c0$2776b240$@xen.org>
Subject: RE: [PATCH v2 0/2] fix 'xl block-detach'
Date: Thu, 1 Oct 2020 08:23:08 +0100
Message-ID: <008801d697c3$b73a3370$25ae9a50$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJeoUus0OdpJ4MR5bCYHg0A3ED8pwIrGjDEqGDrr3A=

Toolstack maintainers...

Ping+1

> -----Original Message-----
> From: Paul Durrant <xadimgnik@gmail.com>
> Sent: 25 September 2020 11:39
> To: xen-devel@lists.xenproject.org
> Cc: 'Paul Durrant' <pdurrant@amazon.com>
> Subject: RE: [PATCH v2 0/2] fix 'xl block-detach'
> 
> Ping? AFAICT this series is fully acked. Can it be committed soon?
> 
>   Paul
> 
> > -----Original Message-----
> > From: Paul Durrant <paul@xen.org>
> > Sent: 15 September 2020 15:10
> > To: xen-devel@lists.xenproject.org
> > Cc: Paul Durrant <pdurrant@amazon.com>
> > Subject: [PATCH v2 0/2] fix 'xl block-detach'
> >
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > This series makes it behave as the documentation states it should
> >
> > Paul Durrant (2):
> >   libxl: provide a mechanism to define a device 'safe remove'
> >     function...
> >   xl: implement documented '--force' option for block-detach
> >
> >  docs/man/xl.1.pod.in         |  4 ++--
> >  tools/libxl/libxl.h          | 33 +++++++++++++++++++++++++--------
> >  tools/libxl/libxl_device.c   |  9 +++++----
> >  tools/libxl/libxl_disk.c     |  4 +++-
> >  tools/libxl/libxl_domain.c   |  2 +-
> >  tools/libxl/libxl_internal.h | 30 +++++++++++++++++++++++-------
> >  tools/xl/xl_block.c          | 21 ++++++++++++++++-----
> >  tools/xl/xl_cmdtable.c       |  3 ++-
> >  8 files changed, 77 insertions(+), 29 deletions(-)
> >
> > --
> > 2.20.1
> 



