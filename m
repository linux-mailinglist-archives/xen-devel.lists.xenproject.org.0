Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF54623CC5E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 18:40:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3MSg-0000Xy-Fk; Wed, 05 Aug 2020 16:40:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GWpV=BP=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k3MSe-0000Xt-Uq
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 16:40:17 +0000
X-Inumbo-ID: bd41ee21-15ea-4adb-997c-98667faf51d9
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd41ee21-15ea-4adb-997c-98667faf51d9;
 Wed, 05 Aug 2020 16:40:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id k20so6976052wmi.5
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2020 09:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=SaDNYE1xnldOkModmMjF+GRhgWILeGGODd/dskU7Ga4=;
 b=f/aBI1/vhiyiVvof8DmP7+mcqj+PYgvymSU9wTPytp0+sbkk+lyrLCE3fYv9/3Iown
 OErgOcHDRXE1eS1RdH4+cnPYXaZXJutNGZXzi0WJVQ1CEIY133htF2GfMKVuoIBEZhvx
 PS8dbgx/pwP/ak+lKLLTITVRgSuxq3xA5lIqYSbCgzm8Zn89yHASnBh8y2iK60xz2e1W
 cBVq6jwx8iU4IKBqSE6moOt/QOpcBfCzV1ME2fuqPp1freANxyVGZXeSWkcbhBwYT5jL
 +5JRJkbPDD11BBqujrTsYAUrjtoFjk2k19bgZTvkvt1l0ot558uCOuSH7sg8ABkK/7ed
 0zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=SaDNYE1xnldOkModmMjF+GRhgWILeGGODd/dskU7Ga4=;
 b=OvYF4786mZzBdpnqS5cataJQIPAWNHx+fjUPSeOLQ80c2I01hjd223LmI4txqM6aRs
 1bxQNWcR38mZea9WlPTKgxp+A3ADSdDFHsIsqUctm0i9uVTEk2XGzICi9Se+TdgalyFm
 vN8ImJXFivOr20AL4mh73R/1dtyITV+ZAkf1vu7kovCkXfpujb2fO8z5hhiuktrrjTJa
 tPsc1ajA1WI1LtPcmScOju40v9/PsAGiy1UQHL3gV8gSRBDChy/KYoVuBX3H1njQylqM
 H/uFmWVS735yZ/E/eijE6CxZt5ZfCCG1U7t9MN/ay1xTvwj854cVpNUZ1ymNlhbTFObK
 fnuw==
X-Gm-Message-State: AOAM530VZkRUyTZLevgvGLNTohqK4aIZdPUUXR3c7QLK4SWpvbNvAH9k
 DqgIwLMwsYVY67Cbe+YxKh0=
X-Google-Smtp-Source: ABdhPJycPFS19GDOO1UnYYa1JYd5SfgEsQ2Nuo61hTVplMA8adccp1QKIZdT0PoU+bJZDlLL+Las2Q==
X-Received: by 2002:a1c:ddc3:: with SMTP id u186mr3858771wmg.72.1596645615200; 
 Wed, 05 Aug 2020 09:40:15 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id g16sm3265825wrs.88.2020.08.05.09.40.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Aug 2020 09:40:14 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-8-git-send-email-olekstysh@gmail.com>
 <4ffa6434-3ad6-04dc-bfde-f75196930fb4@suse.com>
In-Reply-To: <4ffa6434-3ad6-04dc-bfde-f75196930fb4@suse.com>
Subject: RE: [RFC PATCH V1 07/12] A collection of tweaks to be able to run
 emulator in driver domain
Date: Wed, 5 Aug 2020 17:40:20 +0100
Message-ID: <005f01d66b47$1c58ccc0$550a6640$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIHYXuU00Oy15gaFT3m+7M9vTQs4QJrY6HzAsS1Dt2onkgdgA==
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 05 August 2020 17:20
> To: Oleksandr Tyshchenko <olekstysh@gmail.com>; Paul Durrant =
<paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko =
<oleksandr_tyshchenko@epam.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; George Dunlap =
<george.dunlap@citrix.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano =
Stabellini
> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Daniel De Graaf =
<dgdegra@tycho.nsa.gov>
> Subject: Re: [RFC PATCH V1 07/12] A collection of tweaks to be able to =
run emulator in driver domain
>=20
> On 03.08.2020 20:21, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > Trying to run emulator in driver domain I ran into various issues
> > mostly policy-related. So this patch tries to resolve all them
> > plobably in a hackish way. I would like to get feedback how
> > to implement them properly as having an emulator in driver domain
> > is a completely valid use-case.
>=20
> From going over the comments I can only derive you want to run
> an emulator in a driver domain, which doesn't really make sense
> to me. A driver domain has a different purpose after all. If
> instead you mean it to be run in just some other domain (which
> also isn't the domain controlling the target), then there may
> be more infrastructure changes needed.
>=20
> Paul - was/is your standalone ioreq server (demu?) able to run
> in other than the domain controlling a guest?
>=20

Not something I've done yet, but it was always part of the idea so that =
we could e.g. pass through a device to a dedicated domain and then run =
multiple demu instances there to virtualize it for many domUs. (I'm =
thinking here of a device that is not SR-IOV and hence would need some =
bespoke emulation code to share it out). That dedicated domain would be =
termed the 'driver domain' simply because it is running the device =
driver for the h/w that underpins the emulation.

  Paul


