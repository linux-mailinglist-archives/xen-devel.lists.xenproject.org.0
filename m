Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD627FBE9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 10:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119.3683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNuIo-0004do-6L; Thu, 01 Oct 2020 08:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119.3683; Thu, 01 Oct 2020 08:51:02 +0000
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
	id 1kNuIo-0004dP-39; Thu, 01 Oct 2020 08:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1119;
 Thu, 01 Oct 2020 08:51:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=937a=DI=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNuIl-0004dJ-V6
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 08:51:00 +0000
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 749ab561-18b6-4499-8285-8b8fd128a0fe;
 Thu, 01 Oct 2020 08:50:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id t17so2128532wmi.4
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 01:50:59 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id f12sm7179254wmf.26.2020.10.01.01.50.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Oct 2020 01:50:57 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=937a=DI=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNuIl-0004dJ-V6
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 08:51:00 +0000
X-Inumbo-ID: 749ab561-18b6-4499-8285-8b8fd128a0fe
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 749ab561-18b6-4499-8285-8b8fd128a0fe;
	Thu, 01 Oct 2020 08:50:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id t17so2128532wmi.4
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 01:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=AkzjiZMLafZ+x+Gnujvlxg9Ab8orm1L/PW9GureQJlk=;
        b=A1wv8b/ygyYpy8m5iEo++faNrqMj1tDIbMHjiOJ7JTiB/iwfFizWzFVGEk9vjmaAR+
         1FNQIYG9zhkSv2VAmUTF8KhDZBFBG225pTvn9f/nazzbV5oS1WM0IQZhefKewesqlL05
         tg7A06TGiYFbhCUapp0GtMtisGsnDc/5ps+KieZ/jm0wriqF4H5kimCf7s+qgz/9f3Wq
         wetXF/U6Es+y+4PTZFi/X8zNZ3Ghe/VjFsD8hj4c5/Qq4QE3WZHyD/HgTqckY4dPNb8C
         gEcM5soUTUKVM9AuAsF3O2Y/hEcM1q1iat/XUgkDRZvojE3ht7n28vmILb8nHlosDsO5
         5MOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=AkzjiZMLafZ+x+Gnujvlxg9Ab8orm1L/PW9GureQJlk=;
        b=WvFPTZUvxPgkgpaRJclu2pA0eMrf+eJUGid8PghbD8aJ5ytA6TMHyWoRrn+rYS1yFZ
         WClKqoJsAgcxQmI/Hk01IliXBrE+DVXeOw9yrjrnD4zLcMAK4D58qTM6HThCKIcIkYnu
         OjqcyAs19A9uXL+esgrLnv+nqotROPk/Q091ndFuhpkPvOB8srvm5iMQrGoAl/dsnujf
         QKgBBUi561jqZPjKe16/CtujHv2QsbOEqTwAb8qrx2IjH3YQucgyYkdOa2HASMqPMPmb
         hAflDrbbviLHsgr9JG+uA9N2kneWUJCVJOMWVo3QDMPBtQ1VB1dGdlHULG2cMuj7xutA
         d/zA==
X-Gm-Message-State: AOAM532avC7YqMQTiopuxXOD2s5GHgoW3CsZbscp3McuQraeG4AK2N8p
	oiy8UzuvbQ2gSoasv3HNP/w=
X-Google-Smtp-Source: ABdhPJzqUELKOVgcuxd7fs1ucASFfmPoe3qv6taL24vhR4w2IqTD2F5DOrbvdP0JpukC2RyIs5e4ug==
X-Received: by 2002:a1c:4909:: with SMTP id w9mr5996628wma.133.1601542258243;
        Thu, 01 Oct 2020 01:50:58 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
        by smtp.gmail.com with ESMTPSA id f12sm7179254wmf.26.2020.10.01.01.50.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Oct 2020 01:50:57 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>
Cc: "'Oleksandr'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>,
	"'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <ian.jackson@eu.citrix.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Jun Nakajima'" <jun.nakajima@intel.com>,
	"'Kevin Tian'" <kevin.tian@intel.com>,
	"'Tim Deegan'" <tim@xen.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com> <1599769330-17656-3-git-send-email-olekstysh@gmail.com> <3997a705-ccb1-4b8f-41ca-c5507360c759@xen.org> <000201d69314$97bd8fa0$c738aee0$@xen.org> <c9131bce-f028-2824-9ffc-b4db08017569@gmail.com> <2cbe7efd-f356-0f1b-0bb1-bfb2243f180c@xen.org> <0f768df9-6e28-a0ed-92e7-b17303c24996@suse.com>
In-Reply-To: <0f768df9-6e28-a0ed-92e7-b17303c24996@suse.com>
Subject: RE: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
Date: Thu, 1 Oct 2020 09:50:55 +0100
Message-ID: <008d01d697cf$fac24b30$f046e190$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIQ4beZ3sUmYihKXwfoVgy4BRIJGwHfeJxHAedMvHMBMIgdOgK34vRDAgTQpPsBrefRNqiyzR4g

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 01 October 2020 09:49
> To: Julien Grall <julien@xen.org>
> Cc: Oleksandr <olekstysh@gmail.com>; xen-devel@lists.xenproject.org; =
paul@xen.org; 'Oleksandr
> Tyshchenko' <oleksandr_tyshchenko@epam.com>; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>; 'George
> Dunlap' <george.dunlap@citrix.com>; 'Ian Jackson' =
<ian.jackson@eu.citrix.com>; 'Stefano Stabellini'
> <sstabellini@kernel.org>; 'Wei Liu' <wl@xen.org>; 'Roger Pau =
Monn=C3=A9' <roger.pau@citrix.com>; 'Jun
> Nakajima' <jun.nakajima@intel.com>; 'Kevin Tian' =
<kevin.tian@intel.com>; 'Tim Deegan' <tim@xen.org>;
> 'Julien Grall' <julien.grall@arm.com>
> Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature =
common
>=20
> On 30.09.2020 19:47, Julien Grall wrote:
> > Regarding the fix itself, I am not sure what sort of synchronization =
we
> > can do. Are you suggesting to wait for the I/O to complete? If so, =
how
> > do we handle the case the IOREQ server died?
>=20
> In simple cases retrying the entire request may be an option. However,
> if the server died after some parts of a multi-part operation were
> done already, I guess the resulting loss of state is bad enough to
> warrant crashing the guest. This shouldn't be much different from e.g.
> a device disappearing from a bare metal system - any partial I/O done
> to/from it will leave the machine in an unpredictable state, which it
> may be too difficult to recover from without rebooting. (Of course,
> staying with this analogue, it may also be okay to simple consider
> the operation "complete", leaving it to the guest to recover. The
> main issue on the hypervisor side then would be to ensure we don't
> expose any uninitialized [due to not having got written to] data to
> the guest.)
>=20

I'll try to take a look today and come up with a patch.

  Paul


