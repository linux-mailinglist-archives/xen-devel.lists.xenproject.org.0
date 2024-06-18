Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 805C090C576
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 11:45:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742926.1149809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJVOe-0003kL-CW; Tue, 18 Jun 2024 09:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742926.1149809; Tue, 18 Jun 2024 09:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJVOe-0003iF-9s; Tue, 18 Jun 2024 09:45:00 +0000
Received: by outflank-mailman (input) for mailman id 742926;
 Tue, 18 Jun 2024 09:44:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qMuf=NU=bounce.vates.tech=bounce-md_30504962.66715718.v1-20c3e0d591fb42a98919864b1479226f@srs-se1.protection.inumbo.net>)
 id 1sJVOc-0003i1-Uj
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 09:44:59 +0000
Received: from mail177-18.suw61.mandrillapp.com
 (mail177-18.suw61.mandrillapp.com [198.2.177.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6be7a28b-2d57-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 11:44:57 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-18.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4W3ML01GbXzCf9KCN
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 09:44:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 20c3e0d591fb42a98919864b1479226f; Tue, 18 Jun 2024 09:44:56 +0000
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
X-Inumbo-ID: 6be7a28b-2d57-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718703896; x=1718964396;
	bh=Ogh1Twxwluua6JbFcStBvILAn7Dr8nm1RzNhVradvDc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eW2IGoW2cgOMx5cb94n1/+CrXR9xjb36LjglpP5rXG0PgM/t21INLIeJviwt4moFD
	 GKQWrJy9k/cx16MrnzN8ZiNsizGVJhjzBYpU3uLCbbTwmCZ/zzskbxr07uQncG1QPr
	 8Q3WVsrgagsmNvVND71WCQuF+Jx0JqxZOi3YV8O/rVsWM8N9oIppkO4afJqEfyLmwF
	 JmIqOpAG7yJJOVaXohoT7C//JYIWiNeSfqwTvlYgs+8suCzwD8+UUAO2CiJqTIuxFz
	 tEKW/XUu6tc7s3qZVOGADmz56U2X7vjoNso2cuUW9l11BuFbWZ+mUkPrCNF0NPmEIe
	 C2cybaBmR38Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718703896; x=1718964396; i=anthony.perard@vates.tech;
	bh=Ogh1Twxwluua6JbFcStBvILAn7Dr8nm1RzNhVradvDc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FZcTzsJ/MY1N3/2UOn9UK50g0TK+V6aBZu7n/ouxl+iWk0g86RhHWh8iYq2yQ6xPd
	 7A5BZEYHlbEC5tIiw0uuSVk+O8WIUZWpThYEEkMOx+t2G/VudnZISGysZrMp26Yn2h
	 11SMMn0nZErrHL41vNlt7MQaNzPOW6Zf561NB+YzjysCkRzri7MW70CP1NbtsiNM0D
	 UCUas1kvqpsumiFaEhZW/MVSUJzp7XS0GxQMqvHLc4nK+uHBszbdQzlXHqw/BtFGI7
	 37yLTZvi6E2p0lRse5uKBHE7KwITmg8+5JscYKu+qRTpROHjpJ02kOXQ+AkR/8wEzf
	 Q68IlkNw/hGMA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[OSSTEST=20PATCH]=20preseed=5Fbase:=20Use=20"keep"=20NIC=20NamePolicy=20when=20"force-mac-address"?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718703894789
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org, Luca Fancellu <luca.fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Message-Id: <ZnFXFjeakYBmBHSB@l14>
References: <20240617144051.29547-1-anthony@xenproject.org> <a65a83be-1236-4699-8124-c0bd809c4b97@citrix.com>
In-Reply-To: <a65a83be-1236-4699-8124-c0bd809c4b97@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.20c3e0d591fb42a98919864b1479226f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240618:md
Date: Tue, 18 Jun 2024 09:44:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Jun 17, 2024 at 04:34:09PM +0100, Andrew Cooper wrote:
> On 17/06/2024 3:40 pm, Anthony PERARD wrote:
> > diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
> > index 3545f3fd..d974fea5 100644
> > --- a/Osstest/Debian.pm
> > +++ b/Osstest/Debian.pm
> > @@ -972,7 +972,19 @@ END
> >          # is going to be added to dom0's initrd, which is used by some guests
> >          # (created with ts-debian-install).
> >          preseed_hook_installscript($ho, $sfx,
> > -            '/usr/lib/base-installer.d/', '05ifnamepolicy', <<'END');
> > +            '/usr/lib/base-installer.d/', '05ifnamepolicy',
> > +            $ho->{Flags}{'force-mac-address'} ? <<'END' : <<'END');
> 
> The conditional looks suspicious if both options are <<'END'.

That works fine, this pattern is already used in few places in osstest,
like here:
https://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=ts-host-install;h=0b6aaeeae228551064618abfa624321992a2eb2d;hb=HEAD#l240
    >  $ho->{Flags}{'force-mac-address'} ? <<END : <<END);

Or even here:
https://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=ts-xen-build;h=c294a51eafc26e53b5417529b943224902870acf;hb=HEAD#l173
    > buildcmd_stamped_logged(600, 'xen', 'configure', <<END,<<END,<<END);

> Doesn't this just write 70-eth-keep-policy.link unconditionally?

I've check that, on a different host, and the "mac" name policy is used
as expected, so the file "70-eth-keep-policy.link" isn't created on that
host.

Cheers,

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

