Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5384326DFFA
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 17:46:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIw6a-00045B-8o; Thu, 17 Sep 2020 15:45:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t+a8=C2=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kIw6Y-000455-8q
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 15:45:50 +0000
X-Inumbo-ID: 787e9a52-6225-4b17-b4d1-79a3eb7f46e0
Received: from mail-40136.protonmail.ch (unknown [185.70.40.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 787e9a52-6225-4b17-b4d1-79a3eb7f46e0;
 Thu, 17 Sep 2020 15:45:48 +0000 (UTC)
Date: Thu, 17 Sep 2020 15:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600357547;
 bh=JxE9dxGpCN+PYXRqqaGAv0QrXGC+KdotSSzRLhbVBLU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=eYmnjN5bA3PWIAwV4+SsQM00g3tOZztxR1yh4ZG5JR7eiDUoVZ+wykNNUACpmQKfx
 zsbca1kug0nJORbIOPIBV74MP3cV4soMUV2deXCChw044NADV1NsTD4ebd/yJULRfH
 oaeNcxxpR9QU4XT6XA8aid6tIqau0ytJ2jY++Fxc=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v4 4/4] efi: Do not use command line if secure boot is
 enabled.
Message-ID: <ueLZdIijYTI6p3rFQXXP2tsFQB9EKRp0k38a0xt95MYQ4ostsijdjqKczhYTDJhf0IbLudGkxMeHraIKMcySwhsfi7y2PIFF6viJdTRuInw=@trmm.net>
In-Reply-To: <ae3cd252-71fd-ba49-b53d-f0a4882d201e@suse.com>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-5-hudson@trmm.net>
 <3def666c-c5f1-a520-18dc-6c1c61026b57@suse.com>
 <Rtytoe06osw9o7-z0sRD22p_KP8B2SVSp6Ae6IYHyhS_LpwthJkTMwDc1tICmBReafaZOLSu0nNVPV3ceUTqUnjP7dc4DrsMHhjPwfze3X0=@trmm.net>
 <ae3cd252-71fd-ba49-b53d-f0a4882d201e@suse.com>
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

On Thursday, September 17, 2020 11:26 AM, Jan Beulich <jbeulich@suse.com> w=
rote:
> On 17.09.2020 16:05, Trammell Hudson wrote:
> > If we have a way to detect a unified image early enough, then
> > we can avoid the backwards incompatibility if it is not unified.
>
> I was assuming this was easily possible, if necessary as about the
> first thing we do. If it's not as easy, perhaps something wants
> adding to make it so?

v5 of the patch (just sent) has changed the logic so that the
config section is searched first thing, and if it is found, then
and only then is the command line ignored.  I believe this
restores the older behaviour.

> > That would require moving the config parsing to above the relocation
> > call.
>
> I guess I don't understand why this would be.

The early command line parsing happens before the call to
efi_arch_relocate_image(), although testing in qemu did not
seem to cause any problems with calling read_section() before
the reloc.

--
Trammell

