Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA4426BF80
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 10:39:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kISww-0001EH-2v; Wed, 16 Sep 2020 08:37:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HSPg=CZ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kISwu-0001EC-LL
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 08:37:56 +0000
X-Inumbo-ID: 9e234ce4-7df7-465f-926f-6712387b80da
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e234ce4-7df7-465f-926f-6712387b80da;
 Wed, 16 Sep 2020 08:37:54 +0000 (UTC)
Date: Wed, 16 Sep 2020 08:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600245473;
 bh=GGH4myuQELt2Qqt0Cee0BD7QUM8K7mbeyWpncdkRVYo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=bMaPH6Sgn3euXQ3YTjlD7EwAfqBmhSGerS3dHDc0e/xiOBIRogvrNd9fGiCMh9JuQ
 OIVXwrxsUTZJKLkdedzYSr6vHGb4xQk1I2J59kM7FM6BUVMcXA0fLYY2pqQ5t/6yno
 qqokALKxLa5HnIWp7+exHyS+yfR3gZPW7OOK8Ybs=
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v4 3/4] efi: Enable booting unified
 hypervisor/kernel/initrd images
Message-ID: <vJMfvKtNZyMgJ7EsE4gKz79cATC-4xxU3hrAkz1PlvmArEQJ_jcXR61uiCggcKjISspFs2h4CrL1M9uLGM1kI25UmudG9YueJY1af6VPDmY=@trmm.net>
In-Reply-To: <20200916073209.GR753@Air-de-Roger>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-4-hudson@trmm.net> <20200916073209.GR753@Air-de-Roger>
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

On Wednesday, September 16, 2020 3:32 AM, Roger Pau Monn=C3=A9 <roger.pau@c=
itrix.com> wrote:
> On Mon, Sep 14, 2020 at 07:50:12AM -0400, Trammell Hudson wrote:
> > -   s2w(&name_string);
>
> Don't you need to check that s2w succeed, so that name_string.w is not
> a random pointer from stack garbage?

Maybe? I don't see anywhere else in the code that s2w() is
ever checked for a NULL return. Perhaps a better fix would
be to modify the function to panic if it is unable
to allocate.


> > -          const char *section_name, UINTN *size_out);
>
> Nit: extra space between * and function name.

Ok.  Both will be fixed in a v5.

--
Trammell

