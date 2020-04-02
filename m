Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CE819BF06
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 12:02:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJwck-0007Vq-4s; Thu, 02 Apr 2020 09:58:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/k1p=5S=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jJwci-0007VJ-1r
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 09:58:56 +0000
X-Inumbo-ID: 9017be02-74c8-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x534.google.com (unknown [2a00:1450:4864:20::534])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9017be02-74c8-11ea-b58d-bc764e2007e4;
 Thu, 02 Apr 2020 09:58:55 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z65so3420439ede.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2020 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=VUatLEQ93jKESu4XWv1B7dhdA5WTNqPmPRwmAUZfuSQ=;
 b=Flj4hKjoA1YpX/CCcxHmJnYmzfU6cpvGKPGaU2/ank6H2AYcSf+R/QyzbgvNg/oEoa
 K1B+INfjxMX/ucSMoEvLlMCV31V4/sIkNWUhzI63kasbUFAnTGwtZn1zaaBvt/ZFeIIp
 +JPvaRm7UjfMtWouhy0PXiwVWpbNGmmEoBitRPOjHmassRw7exJh2T6cyzu5JbP+2ZlP
 I37A02V9MULlT/l2hK2c9w3g87of4h42wXyczyiFRxdbDlwesWJWxFuaFvuYfygBORkb
 GRp6erGOctSPCnE8eSOJzfRnQbM86Kh6p24ZTgOMCbAIFf0rvVfFiZWvvgWS2Yl1Gr5y
 ZQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=VUatLEQ93jKESu4XWv1B7dhdA5WTNqPmPRwmAUZfuSQ=;
 b=AwwhmZW1cNQ5E7/vSaKUgMD8gqPT0iHxqZr+RHcX5mY/yxrg0yQftG6lJyqDrtUcs7
 IxzVNVoaJVSovJcThR01w43dP1msY+hKChyEXUlfykS3ItWkShDwL1qjafSGC/Yl6Jc9
 DD54msl18k+mRsAh2H5DN7bs1b+F3NuLrdb1nq16lSPYNko21wLr6YA6E51aoqENz1ww
 dkRTT28QPu1f//Uj5YfZId5G8gVjdeF1pgqiRqhKoH66ALlGuXVCL5XmGKdzPEsbhRMC
 a2XkJ/DydQgMZWg2djg3IpP+k4ePqmdMXQMrihLWMMI/xmlCb4Gn70i2Rg1NbHdzcyqh
 XeWg==
X-Gm-Message-State: AGi0PuYaULk723/bF6GOQC4sHUJoMZubN0qb6DnXeMPLll6Eg69K2iKk
 HSPhhyE6m7TJxlF4GQvIL1k=
X-Google-Smtp-Source: APiQypIzosd/kQwuzr0HEHWATfvqNBv2cUzOGeTUAmfURovxHkcaSQb/X6JR99YNcozN+sd6soGZ2Q==
X-Received: by 2002:a17:906:f187:: with SMTP id
 gs7mr2476359ejb.138.1585821534398; 
 Thu, 02 Apr 2020 02:58:54 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id 31sm846881edc.26.2020.04.02.02.58.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Apr 2020 02:58:53 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-2-paul@xen.org>
 <e9b21d59-3a4a-1498-e5f4-45d1420ddbc4@suse.com>
In-Reply-To: <e9b21d59-3a4a-1498-e5f4-45d1420ddbc4@suse.com>
Subject: RE: [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Thu, 2 Apr 2020 10:58:52 +0100
Message-ID: <001201d608d5$513a7490$f3af5db0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG3I8TZM/MLMEc/e2It3WEXPZVs8AC9qttvAjHRb6Soi+Tb8A==
Content-Language: en-gb
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 01 April 2020 15:51
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Andrew Cooper =
<andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; =
Julien Grall <julien@xen.org>;
> Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for =
save/restore of 'domain' context
>=20
> On 27.03.2020 19:50, Paul Durrant wrote:
> > Domain context is state held in the hypervisor that does not come =
under
> > the category of 'HVM state' but is instead 'PV state' that is common
> > between PV guests and enlightened HVM guests (i.e. those that have =
PV
> > drivers) such as event channel state, grant entry state, etc.
>=20
> Without looking at the patch details yet, I'm having some difficulty
> understanding how this is going to work in a safe/correct manner. I
> suppose for LU the system is in a frozen enough state that
> snapshotting and copying state like this is okay, but ...
>=20
> > To allow enlightened HVM guests to be migrated without their =
co-operation
> > it will be necessary to transfer such state along with the domain's
> > memory image, architectural state, etc. This framework is introduced =
for
> > that purpose.
> >
> > This patch adds the new public header and the low level =
implementation,
> > entered via the domain_save() or domain_load() functions. Subsequent
> > patches will introduce other parts of the framwork, and code that =
will
> > make use of it within the current version of the libxc migration =
stream.
>=20
> ... here you suggest (and patch 5 appears to match this) that this
> is going to be used even in "normal" migration streams.

Well, 'transparent' (or non-cooperative) migration will only work in =
some cases but it definitely does work.

> All of the
> items named are communication vehicles, and hence there are always
> two sides that can influence the state. For event channels, the
> other side (which isn't paused) or the hardware (for passed through
> devices) might signal them, or it (just the former obviously) could
> close their end, resulting in a state change also for the domain
> being migrated. If this happens after the snapshot was taken, the
> state change is lost.

Indeed, which is why we *do* rely on co-operation from the other end of =
the event channels in the migration case. In the initial case it is =
likely we'll veto transparent migration unless all event channels are =
connected to either dom0 or Xen.

>=20
> Otoh I'm sure the case was considered, so perhaps I'm simply missing
> some crucial aspect (which then could do with spelling out in the
> description of the cover letter).
>=20

Does that need to be explained for a series that is just infrastructure? =
The overall design doc is now committed in the repo (although may need =
some expansion in future) so I could point at that.
I don't think I'm giving anything away when I say that EC2's downstream =
code simply (ab)uses HVM save records for transferring the extra state; =
all I'm trying to do here is create something cleaner onto which I can =
re-base and upstream the EC2 code.

  Paul



