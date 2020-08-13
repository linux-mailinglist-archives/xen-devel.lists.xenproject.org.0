Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468422437BB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 11:37:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k69ee-0005N9-OM; Thu, 13 Aug 2020 09:36:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JVDZ=BX=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k69ed-0005N0-FE
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 09:36:11 +0000
X-Inumbo-ID: c252a777-880e-40f2-b715-ada8da67b2e9
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c252a777-880e-40f2-b715-ada8da67b2e9;
 Thu, 13 Aug 2020 09:36:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id t14so4446782wmi.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2020 02:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=4F2l7CYyl2ihR31lS7c1TSIJ/BFDhHW8ufRVF7UoS+Q=;
 b=YO9aq/cgFlDS3KnfmCztcDR+PgT336f5AMOoqj3YS4NW0AIIppWCbT2apyKBW8O8/i
 yAWezoSX/GTebziZAH6Mcft5lMv9nlbe7nStUG7T0dH7yuQPLIGYUgSn9m5eXCw1jCXn
 btjfreBIdg8dyJf4VOoBgIrsJWPAq6bMryztZuqAaj0LpoV49Hpg3JZ7i+MA6dJUbDRX
 pSg9tL/w1gjtXDe3FtSrQQ8KyHDQYBpMIBPIqdwIXewOsE5OZ/vlT2dB8x1YVVxTL6W4
 TtJRnKq5i5uY8yXUjJT+gRryiFVTOLovcufU0lVWVGHSjtHZ12NTwDlTC8NDLsE2sahx
 dP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=4F2l7CYyl2ihR31lS7c1TSIJ/BFDhHW8ufRVF7UoS+Q=;
 b=o93eZIXW0WSIac3WUntPGFXymss2MoDo5s4NZ8FiaEaqenb/jzg42vLGeeXzo2S2LO
 f0CQdXfBFElofkqhf/UrOIX7T4s/iPspsygG9WdBUOtf8xAf2CAeQtH4l1On61SiyjGh
 MD8jexo9zNv+jx7FTvtRVndvOp4UU7IgjqRfsnv7x5vwlNzzVrmaHv77/REWcsSC9Lcd
 6KMBc4ULQr4GT8SYhcOvTm4mlFn2OXAcths2mKZcKH9MXpH+lkjTOn1vVVDsd/Np5LWG
 xP2NTsqibkrVxEG7kswr6BXfY7pd6mz+g/iZY1S1EXbyhngUSUOXvZ4JI7Bkwt8buFDr
 Zl0g==
X-Gm-Message-State: AOAM531Vz3cfAM1n0Qz0s5PCMgjgJltIiwluoi/+C9eU7LwWiJWaOP5u
 JM/RruuRukPVfg12z73zob0=
X-Google-Smtp-Source: ABdhPJy3ljFEhDyVoN4gQdq8FQCv+LCjAYWBoF+egxN6Qt4nYtRz8c/G29mP+uof2h3Fyr8lPVkNew==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr3760343wml.106.1597311369408; 
 Thu, 13 Aug 2020 02:36:09 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-143-223-30.range86-143.btcentralplus.com.
 [86.143.223.30])
 by smtp.gmail.com with ESMTPSA id s8sm8448033wmc.1.2020.08.13.02.36.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Aug 2020 02:36:08 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, "'Wei Liu'" <wl@xen.org>,
 "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-5-roger.pau@citrix.com>
 <004e01d6714c$748450d0$5d8cf270$@xen.org> <20200813085732.GE975@Air-de-Roger>
In-Reply-To: <20200813085732.GE975@Air-de-Roger>
Subject: RE: [PATCH 4/5] x86/viridian: switch synic to use the new EOI callback
Date: Thu, 13 Aug 2020 10:36:07 +0100
Message-ID: <005a01d67155$2c689aa0$8539cfe0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHtt6hyfd7HfGtbm1qQjI5TC+nvgAFzOaW4AfrO1F8CylicMqjVd3RQ
Content-Language: en-gb
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
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Sent: 13 August 2020 09:58
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Wei Liu' <wl@xen.org>; 'Jan =
Beulich' <jbeulich@suse.com>; 'Andrew
> Cooper' <andrew.cooper3@citrix.com>
> Subject: Re: [PATCH 4/5] x86/viridian: switch synic to use the new EOI =
callback
>=20
> On Thu, Aug 13, 2020 at 09:33:43AM +0100, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: Roger Pau Monne <roger.pau@citrix.com>
> > > Sent: 12 August 2020 13:47
> > > To: xen-devel@lists.xenproject.org
> > > Cc: Roger Pau Monne <roger.pau@citrix.com>; Paul Durrant =
<paul@xen.org>; Wei Liu <wl@xen.org>; Jan
> > > Beulich <jbeulich@suse.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>
> > > Subject: [PATCH 4/5] x86/viridian: switch synic to use the new EOI =
callback
> > >
> > > Switch synic interrupts to use an EOI callback in order to execute =
the
> > > logic tied to the end of interrupt. This allows to remove the =
synic
> > > call in vlapic_handle_EOI.
> > >
> > > Move and rename viridian_synic_ack_sint now that it can be made
> > > static.
> > >
> > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > ---
> > > I'm unsure about the logic in viridian_synic_deliver_timer_msg, as =
it
> > > seems to only set the vector in msg_pending when the message is
> > > already pending?
> >
> > See section 11.10.3 of the TLFS (SynIC Message Flags)...
> >
> > "The MessagePending flag indicates whether or not there are any
> > messages pending in the message queue of the synthetic interrupt
> > source. If there are, then an =E2=80=9Cend of message=E2=80=9D must =
be performed by
> > the guest after emptying the message slot. This allows for
> > opportunistic writes to the EOM MSR (only when required). Note that
> > this flag may be set by the hypervisor upon message delivery or at
> > any time afterwards. The flag should be tested after the message
> > slot has been emptied and if set, then there are one or more pending
> > messages and the =E2=80=9Cend of message=E2=80=9D should be =
performed."
> >
> > IOW it's a bit like APIC assist in that it tries to avoid a VMEXIT
> > (in this case an access to the EOM MSR) unless it is necessary.
> >
> > Reading the code again I think it may well be possible to get rid of
> > the 'msg_pending' flag since it only appears to be an optimization
> > to avoid testing 'message_type'. I'll try dropping it and see what
> > breaks.
>=20

Well nothing apparently broke. The EOM handler basically becomes a no-op =
too, but I think this is fine because we only use the synic for =
delivering timer messages at the moment.

  Paul


