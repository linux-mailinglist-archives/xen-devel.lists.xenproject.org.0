Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DD827879A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 14:49:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLnA3-0000eW-6c; Fri, 25 Sep 2020 12:49:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4q2y=DC=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kLnA1-0000eR-Ig
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 12:49:13 +0000
X-Inumbo-ID: 380bd37e-d2eb-4932-9071-3e30c5bba210
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 380bd37e-d2eb-4932-9071-3e30c5bba210;
 Fri, 25 Sep 2020 12:49:12 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id a9so3177216wmm.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2020 05:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=UyZWxoWtHaf7ml4GMZLnbo6VzUFlyuP7fW8c9SPe4Rs=;
 b=rU39jGtx0F3pgkPEPHiojwbVmWX3W9DaRcQIkfty6TePFXseHnjNtLzimfADpfkqAW
 oTOmoFk7tAA9GImSv1sfHqhqgR9O7+eC2yAqinZh9JdCRz/M+Vw0rym+fDmNBgsbYNpt
 qwhvFXSWENiwyjCRkH0pCDZo8iAW5E6lCcchuKpPK2HAbUKqsduJrHqaswsWDCgP/2vK
 AiLDdGUjzSgDG6X1xNmDtYt2E+J/MjjR8FTqTsDyPEJXXKHsab8N9GKYTOc5de9BvMUD
 Bfm5bvU5SI1jwdULIW5K0+meRSB9hHBBgU3eQVqNz248t0cpQSkF/dPWY/9G7imp6jnl
 kKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=UyZWxoWtHaf7ml4GMZLnbo6VzUFlyuP7fW8c9SPe4Rs=;
 b=PcopeNT6jzu2aE5vwVr78lMJQiLxGISHhSMOka7b3w99snrP9QbS9piDeT1EPzjYmG
 YGY5EdQHMUFtVh8ycKm/W6pbDWGoPiAbyJcR7UE9OFbXey+8ZrxTOHs+nVmKHwb+cV4z
 exSTDe6cWcpDz225sUWfgalK8UBUAGHdeuJE0aJOLyib2EUw2mQ8egkNyYK5K9QvGd1e
 Sh++6kQZQZCHte7YfeylIAzaTnDJirKzmhUBOhs2tfRWIl9UVsO6z3+so3fpLRCobGnA
 9S/j4G6huj/RkVSuPC9EdKAYdrpuBBsGqoeKNi2CduXytBZflOIkDQ0JmsM0Fw8RAnVP
 mWCQ==
X-Gm-Message-State: AOAM532SmyTw8XQ1oi13lCb13JOMMExvdrAg3ZuOR+0LD55gj7BOHC1z
 JDmCLYVtsRPKjvALHzleIKk=
X-Google-Smtp-Source: ABdhPJyMV947Jj4eM1ioc/moeAPPKlPxZmfZBM7y+/lmNFhNz8EmhOQMwDL6zb/HrNZS1nLp1sv1BQ==
X-Received: by 2002:a7b:cf36:: with SMTP id m22mr3170108wmg.51.1601038151862; 
 Fri, 25 Sep 2020 05:49:11 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id v17sm2844416wrc.23.2020.09.25.05.49.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Sep 2020 05:49:11 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Lengyel, Tamas'" <tamas.lengyel@intel.com>,
 <xen-devel@lists.xenproject.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Daniel De Graaf'" <dgdegra@tycho.nsa.gov>,
 "'George Dunlap'" <george.dunlap@citrix.com>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>,
 "'Jan Beulich'" <jbeulich@suse.com>, "'Julien Grall'" <julien@xen.org>,
 =?UTF-8?Q?'Marek_Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>, 
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
 "'Wei Liu'" <wl@xen.org>
References: <20200924131030.1876-1-paul@xen.org>
 <CY4PR11MB0056034DE1EE8445CE816494FB390@CY4PR11MB0056.namprd11.prod.outlook.com>
In-Reply-To: <CY4PR11MB0056034DE1EE8445CE816494FB390@CY4PR11MB0056.namprd11.prod.outlook.com>
Subject: RE: [PATCH v9 0/8] domain context infrastructure
Date: Fri, 25 Sep 2020 13:49:10 +0100
Message-ID: <001301d6933a$4409fda0$cc1df8e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHMaZuCwoR0ssB24MBKMpsJEDSJHwGwujGcqYAbJ3A=
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Lengyel, Tamas <tamas.lengyel@intel.com>
> Sent: 24 September 2020 20:36
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; Daniel De Graaf
> <dgdegra@tycho.nsa.gov>; George Dunlap <george.dunlap@citrix.com>; Ian =
Jackson
> <ian.jackson@eu.citrix.com>; Jan Beulich <jbeulich@suse.com>; Julien =
Grall <julien@xen.org>; Marek
> Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>; Roger Pau =
Monn=C3=A9 <roger.pau@citrix.com>;
> Stefano Stabellini <sstabellini@kernel.org>; Volodymyr Babchuk =
<Volodymyr_Babchuk@epam.com>; Wei Liu
> <wl@xen.org>
> Subject: RE: [PATCH v9 0/8] domain context infrastructure
>=20
>=20
>=20
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf =
Of Paul
> > Durrant
> > Sent: Thursday, September 24, 2020 9:10 AM
> > To: xen-devel@lists.xenproject.org
> > Cc: Paul Durrant <pdurrant@amazon.com>; Andrew Cooper
> > <andrew.cooper3@citrix.com>; Daniel De Graaf =
<dgdegra@tycho.nsa.gov>;
> > George Dunlap <george.dunlap@citrix.com>; Ian Jackson
> > <ian.jackson@eu.citrix.com>; Jan Beulich <jbeulich@suse.com>; Julien =
Grall
> > <julien@xen.org>; Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com>; Roger Pau Monn=C3=A9
> > <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>;
> > Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Wei Liu
> > <wl@xen.org>
> > Subject: [PATCH v9 0/8] domain context infrastructure
> >
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > Paul Durrant (8):
> >   xen/common: introduce a new framework for save/restore of 'domain'
> >     context
> >   xen/common/domctl: introduce XEN_DOMCTL_get/setdomaincontext
> >   tools/misc: add xen-domctx to present domain context
> >   docs/specs: add missing definitions to libxc-migration-stream
> >   docs / tools: specific migration v4 to include DOMAIN_CONTEXT
> >   common/domain: add a domain context record for shared_info...
> >   x86/time: add a domain context record for tsc_info...
> >   tools/libxc: add DOMAIN_CONTEXT records to the migration stream...
>=20
>=20
> Hi Paul,
> Could you push a git branch somewhere for this series? I would like to =
see this being integrated with
> VM forking and if its not too much effort just create the patch for =
that so that it could be appended
> to the series.
>=20

Hi Tamas,

  Done. See =
https://xenbits.xen.org/gitweb/?p=3Dpeople/pauldu/xen.git;a=3Dshortlog;h=3D=
refs/heads/domain-save14

  Cheers,

    Paul



