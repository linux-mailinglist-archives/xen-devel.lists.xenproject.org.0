Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9AB268810
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:15:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkZN-0005yv-0v; Mon, 14 Sep 2020 09:14:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lZiK=CX=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kHkZL-0005yo-RC
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:14:39 +0000
X-Inumbo-ID: 0dbe3525-7c52-485b-96ea-5fd810df42a5
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dbe3525-7c52-485b-96ea-5fd810df42a5;
 Mon, 14 Sep 2020 09:14:27 +0000 (UTC)
Date: Mon, 14 Sep 2020 09:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600074866;
 bh=q4+NChuZOlbtYi9ozVOrR9R9fZ6PuvhPc7CPnAmEHBI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=JzmyUnAXv4TbSeDIUDV09tgYMx2LwsnBAEat67Cwp0EIOrK4QQ7FB/kXEh49DRKbl
 WcrMQcqBn8KIhOGYKrUX47LD9G/pMAiL8tMCyzxqfVtK19/Dbyhy+FUlLUQmxpap0b
 A9yovn/QsdPz7LikTG4lV3G9uOEDVv1xMDbjWC94=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/4] x86/xen.lds.S: Work around binutils build id
 alignment bug
Message-ID: <gdlY1Kh1f04pgsJpJS9plY_bWnJuywRv1f3Fm8C5I1Tuug8tl5Iv5XjbA8dHSiMSXgPURpnG2AjYfgvxKMZkpANq3_H3f7jHltoxqA-Wbs8=@trmm.net>
In-Reply-To: <e1eb360f-5ffc-aa3f-1f82-ace6c4bc6b0c@suse.com>
References: <20200907190027.669086-1-hudson@trmm.net>
 <20200907190027.669086-2-hudson@trmm.net>
 <5b8f533d-c646-8a52-cf37-d21b182ccf9b@suse.com>
 <6SnmUgvnHWozDhOcXRgAUuB_aEQdoXlOD5-uC6-t2LGRtadueg0vaUUmBISei_7NrT_9DCVBfNLUR12D6XTYoJNri7W2fw1_yeMUXULfwR0=@trmm.net>
 <e1eb360f-5ffc-aa3f-1f82-ace6c4bc6b0c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tuesday, September 8, 2020 8:29 AM, Jan Beulich <jbeulich@suse.com> wrot=
e:
> [...] As with, I think, the majority of new
> features, distros would pick up your new functionality mainly for
> use in new versions, and hence would likely run with new binutils
> anyway by that time.

It also occurs to me that the binutils used to process the xen.efi
image does not need to be the same as the one used to generate it,
so there are no build-time dependencies on having this fix in place.

Dropping this patch from the series doesn't affect the ability of a
distribution with a new binutils from being able to build unified
images, so I'm fine with abandoning it.

Are there any further thoughts on the other parts of the series?

--
Trammell

