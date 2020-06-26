Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA720B0E6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 13:51:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jomsk-0002im-1G; Fri, 26 Jun 2020 11:50:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azve=AH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jomsj-0002if-4M
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 11:50:57 +0000
X-Inumbo-ID: 4b556abc-b7a3-11ea-bb8b-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b556abc-b7a3-11ea-bb8b-bc764e2007e4;
 Fri, 26 Jun 2020 11:50:56 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a6so8726694wmm.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 04:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=4NJZpymAfpFAgCWr9gUb+oM6L0GUKtNoFK72YNX8rV0=;
 b=RXke+fAmjc/dfZ3jYsRG9U8NrFELQlUZ1rGNjSlXFNRTDBTfNMqt+iYmz9H634Mjms
 TVJH6rAkGKGucZWveqQvRaYAJIY49mZmhsdVR7/egQxpTusuY6v+H13DNLHPdHvUVa1l
 jT2fWelmM7MBbKKj3HYsYKjObEbtJmGVP80P3lTKLs/+8jiPg1jOmZKdV/fkLsnvnmjI
 CLwXU/m4j+8ocyW4xvWRb0HuKVq5C4ZDKg52XDozNjSyCw1JIk5cjA6SLxLgNe+f9BqV
 hFf9sssVYDmFin6okvwY8YN0tEIlI1h0Sboq8CnYzuMeoI9DO6foK1kHYuTZsdao6Iue
 xbdA==
X-Gm-Message-State: AOAM532/afCx38MF7SJ8ZMxLw3WCVnKKxH7diJcmcC7H+A+vZ5b6ud0L
 +QYjSzDUa12TtGOFBOtMkxY=
X-Google-Smtp-Source: ABdhPJzb8L2eVl5EThx2cNUh/2m0xjSUjkf7/Csj4TO0qsGKms60PqrjJyKoxgd4Gtu3DBiEcnBEZQ==
X-Received: by 2002:a1c:c3c5:: with SMTP id t188mr3161863wmf.53.1593172255660; 
 Fri, 26 Jun 2020 04:50:55 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z16sm26598818wrr.35.2020.06.26.04.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 04:50:55 -0700 (PDT)
Date: Fri, 26 Jun 2020 11:50:53 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v3 5/7] tools/libxc: add xc_vmtrace_* functions
Message-ID: <20200626115053.aaugxnmb5wgh7wb4@liuwe-devbox-debian-v2>
References: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
 <1478140470.11443872.1592849522947.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1478140470.11443872.1592849522947.JavaMail.zimbra@cert.pl>
User-Agent: NeoMutt/20180716
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
Cc: xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 22, 2020 at 08:12:02PM +0200, Michał Leszczyński wrote:
> Add functions in libxc that use the new HVMOP_vmtrace interface.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>

They look to be simple wrappers for hypercalls, so their acceptance will
be dependent on the hypervisor side code.

Wei.

