Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FB22F15FC
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 14:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64853.114664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxYC-0001TF-1q; Mon, 11 Jan 2021 13:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64853.114664; Mon, 11 Jan 2021 13:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxYB-0001Sq-UV; Mon, 11 Jan 2021 13:48:03 +0000
Received: by outflank-mailman (input) for mailman id 64853;
 Mon, 11 Jan 2021 13:48:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+Cs=GO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kyxYA-0001Sl-B0
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 13:48:02 +0000
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55df34ef-9869-4268-a08f-47dc9697d6ed;
 Mon, 11 Jan 2021 13:48:00 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g185so15143765wmf.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 05:48:00 -0800 (PST)
Received: from CBGR90WXYV0 (host86-165-42-133.range86-165.btcentralplus.com.
 [86.165.42.133])
 by smtp.gmail.com with ESMTPSA id q15sm23455783wrw.75.2021.01.11.05.47.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2021 05:47:59 -0800 (PST)
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
X-Inumbo-ID: 55df34ef-9869-4268-a08f-47dc9697d6ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=jp3o8vNlwbZoCVWcbNeOkbLZ1+b7xHZoHiFVsLEdLOU=;
        b=uri0ViOvhRs0RsY+RYW+azIVG2aMKvijnO3PPdNTccOxQQu30dlWsut09jm7+VO3Y8
         4SHzWlGGPzMQXoQNrSBRMrkcgp9Tl69tRob1tLh2mFl29AUYknUpH3c36aQg+Pnw7usV
         3IWaMYsv3Y0cnKpsuFrpSJHx1NHlmlX0HxhO7X0IUHMLf1xTg9Jt5tX5O/EUyOp9Cbuz
         AA9n4r2xy8Lmc++K5DjZvoVOWwOIBqXVt0pkwIdfyEYeqDQHy+lfK606dqBbrEczD+Z1
         gDW/zUT0Mwv/u7rWtfow669MqhzqluA6aVI9z0uO8cyxwvS+aeWKtQbf0PWMCxNhPPFm
         cCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=jp3o8vNlwbZoCVWcbNeOkbLZ1+b7xHZoHiFVsLEdLOU=;
        b=lx4NraPBEU+hzm5Zn5sP4+EXb088K4enOO8tfZKEF/U1rTJXIAz+yqGgOZTx11yICw
         iGiWQOnyCpbRKoa2ru457MCpfztaR5qriBhsTOHHH2Cf0GPC4QO/uIZn2uI3WlpIYHaz
         X1iv0BiFoZ/jmJ+tlm7D9J5Vtxsl+i6tpakAVPbNPNcCIyji6cAhweh7hg/BFcpvaNbh
         ytukcosrXXCebmVY3OZEKdz96eMts7sj39VxuroJt5fMj0kjiADeO6FNw5By0645Froe
         J11fjd8eZbLRMBO3l2kk3YRM2CD9I5nCbn54gTb/2XM9xUkubA9EFGufDEucgGuxd5tj
         SfiA==
X-Gm-Message-State: AOAM532U1OFpc9HUelrPK9EwrNcfwro619yKwFHZahWbm587Sy4N+pTq
	NRNhY3ihKumhNa7mF81Injw=
X-Google-Smtp-Source: ABdhPJz+qCzDcqfhfzNOS5qrJo1CZHil3Q7Z6+d+0EIIjpxemO+x5xeEICLSg8jTSK0FhyBKwh5nUg==
X-Received: by 2002:a05:600c:2255:: with SMTP id a21mr14955948wmm.122.1610372879699;
        Mon, 11 Jan 2021 05:47:59 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Igor Druzhinin'" <igor.druzhinin@citrix.com>
Cc: <wl@xen.org>,
	<iwj@xenproject.org>,
	<anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>,
	<julien@xen.org>,
	<sstabellini@kernel.org>,
	<roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com> <009d01d6e598$bfdd0110$3f970330$@xen.org> <ce4814a8-4f18-c17c-c3e2-99a0ad18e4f1@citrix.com> <00ad01d6e7f6$1ebbe610$5c33b230$@xen.org> <33322763-6810-3bfc-9573-1e326b38293e@suse.com> <00b001d6e7f9$80937a30$81ba6e90$@xen.org> <00b101d6e7f9$e342ff20$a9c8fd60$@xen.org> <d5e7f52e-2ec4-a722-e6cf-4b0b9b1cd1d5@suse.com> <560f9255-3b38-62f6-2b0b-db87dffd36e3@citrix.com> <cb26b3e9-3a76-98a6-5a03-4abed060134e@suse.com>
In-Reply-To: <cb26b3e9-3a76-98a6-5a03-4abed060134e@suse.com>
Subject: RE: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
Date: Mon, 11 Jan 2021 13:47:57 -0000
Message-ID: <00b701d6e820$5f5d35f0$1e17a1d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIZObzvX1fStk6d0If1Grmzp4ChNQKH77KyAjM4vxoA8ianTwIvmyEuAapfz8YBmnsfowGbd8zyAQ8muU4CtlFhvakZtUNw

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 11 January 2021 13:38
> To: Igor Druzhinin <igor.druzhinin@citrix.com>; paul@xen.org
> Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; =
andrew.cooper3@citrix.com;
> george.dunlap@citrix.com; julien@xen.org; sstabellini@kernel.org; =
roger.pau@citrix.com; xen-
> devel@lists.xenproject.org
> Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per =
partition
>=20
> On 11.01.2021 14:34, Igor Druzhinin wrote:
> > On 11/01/2021 09:16, Jan Beulich wrote:
> >> On 11.01.2021 10:12, Paul Durrant wrote:
> >>>> From: Paul Durrant <xadimgnik@gmail.com>
> >>>> Sent: 11 January 2021 09:10
> >>>>
> >>>>> From: Jan Beulich <jbeulich@suse.com>
> >>>>> Sent: 11 January 2021 09:00
> >>>>>
> >>>>> On 11.01.2021 09:45, Paul Durrant wrote:
> >>>>>> You can add my R-b to the patch.
> >>>>>
> >>>>> That's the unchanged patch then, including the libxl change that
> >>>>> I had asked about and that I have to admit I don't fully follow
> >>>>> Igor's responses? I'm hesitant to give an ack for that aspect of
> >>>>> the change, yet I suppose the libxl maintainers will defer to
> >>>>> x86 ones there. Alternatively Andrew or Roger could of course
> >>>>> ack this ...
> >>>>>
> >>>>
> >>>> I don't think we really need specific control in xl.cfg as this =
is a fix for some poorly
> documented
> >>>> semantics in the spec. The flag simply prevents the leaf =
magically appearing on migrate and I
> think
> >>>> that's enough.
> >>>
> >>> ... although adding an option in xl/libxl isn't that much work, I =
suppose.
> >>>
> >>> Igor, would you be ok plumbing it through?
> >>
> >> This back and forth leaves unclear to me what I should do. I
> >> would have asked on irc, but you're not there as it seems.
> >
> > I don't see a scenario where somebody would want to opt out of =
unlimited
> > VPs per domain given the leaf with -1 is supported on all Windows =
versions.
>=20
> So Paul - commit patch as is then?
>=20
> > I can make it configurable in the future if reports re-surface it =
causes
> > troubles somewhere.
>=20
> This is the slight concern I have: Having to make it configurable
> once someone has reported trouble would look a little late to me.
> Otoh I agree it may end up being dead code if no problems get
> ever encountered.
>=20

I think I'm persuaded by your caution. Since it's not a massive amount =
of code, let's have flags for both wired through to xl and default them =
to on, so I withdraw my R-b for the libxl_x86.c hunk.

  Paul

> Jan


