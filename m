Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659572152DB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 09:04:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsLAO-0002ZU-Gj; Mon, 06 Jul 2020 07:03:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUWB=AR=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jsLAN-0002ZP-FC
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 07:03:51 +0000
X-Inumbo-ID: d8045e04-bf56-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8045e04-bf56-11ea-b7bb-bc764e2007e4;
 Mon, 06 Jul 2020 07:03:50 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id z15so28301457wrl.8
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=SBKsAA7+u0dXdQjfFG41WcLWxsA+fMDFgWXbL5FWNq4=;
 b=BkGYlwL8QNt/pwe8xZtOFlgec1ug2f/5YqgqifJMTUwvlYk+sLW4sTDOOGatKXN/Cr
 1bG9vOYYfCqyjuptcEJBpzWKz6akQIgKF7PhU8/exfRUnGogogitKCCaXbDY0jVAtbqw
 TvvBwHyF7558yP4dlAeI98Ee+FExtu7wzzpLa/5PZZ0x/wN24yEIKXdTaokYIm0ArxKM
 ZbU8irq+sXmKhgWVv0hofVHT58ZlCRczC58jlmTF3vzlygD8xW6XvCo/NZbdLW0IoCyP
 +4YJ2B5dSKGO2SxViGbC7jihkOn13cp1cltq85jcHGTXN3/Dui6oMEyABsVpB7db7qZS
 FocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=SBKsAA7+u0dXdQjfFG41WcLWxsA+fMDFgWXbL5FWNq4=;
 b=K/jSjLSmkdtVfSqDOhXVDnyoCMcRDxvVhewJsLxpPW2Lvs3tsZUtjaNEkQP/+mfYWj
 xgB9gKGJP5sByJvVUJ+kanc/4b7D5PoGvxPhlQLNhokitsk7x+MPUOCDUOt1/TTeZNT3
 s6Ajodxf+3NCTcIVWCzcyrCB7Z8G8HuznlN5a4bLBMjW2UvjuLO05XELiJf2E/9eI1rt
 cL87K8DQIz0uY+aabyLP0Ax8bYjFGzXjCDLllilQBQMrMkazkxGIIFousv71xB3+Ug/z
 KVEavoaSzPsnHybLU/gixUcU1YYWIjfNvhQx9GpeTwiYSlLKysCjE1v3rUSbxHY8tiRs
 bUVQ==
X-Gm-Message-State: AOAM533l4T7/l69nyG/ZUhn2BdVwuMq6j6Prof2+4tww14PA+zV3yNQn
 MktRX6CoH72UWaj9G5W374s=
X-Google-Smtp-Source: ABdhPJzOZ4Azv0pyfItyvCQIEo/vELaJ2ixVp+EAeyuIZQb9/x2pzVhR/02lYFbz3YlEDd7iKvtWaw==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr50099349wrm.40.1594019029689; 
 Mon, 06 Jul 2020 00:03:49 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5782:7500:8191:456f:379d:d246])
 by smtp.gmail.com with ESMTPSA id u2sm21773367wml.16.2020.07.06.00.03.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jul 2020 00:03:49 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Jan Beulich'" <jbeulich@suse.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
References: <20200701090210.GN735@Air-de-Roger>
 <f89a158a-416e-1939-597a-075ff97f2b02@suse.com>
 <af13fa01-db36-784d-dfaf-b9905defc7fd@citrix.com>
In-Reply-To: <af13fa01-db36-784d-dfaf-b9905defc7fd@citrix.com>
Subject: RE: vPT rework (and timer mode)
Date: Mon, 6 Jul 2020 08:03:50 +0100
Message-ID: <007a01d65363$9ab7c1d0$d0274570$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG+XT3UL7mtyhdM6X8x294LjZ1FmQGlQU2IApzoD8SpB/prwA==
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
Cc: xen-devel@lists.xenproject.org, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 03 July 2020 16:03
> To: Jan Beulich <jbeulich@suse.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>
> Cc: xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>; Paul Durrant =
<paul@xen.org>
> Subject: Re: vPT rework (and timer mode)
>=20
> On 03/07/2020 15:50, Jan Beulich wrote:
> > On 01.07.2020 11:02, Roger Pau Monn=C3=A9 wrote:
> >> It's my understanding that the purpose of pt_update_irq and
> >> pt_intr_post is to attempt to implement the "delay for missed =
ticks"
> >> mode, where Xen will accumulate timer interrupts if they cannot be
> >> injected. As shown by the patch above, this is all broken when the
> >> timer is added to a vCPU (pt->vcpu) different than the actual =
target
> >> vCPU where the interrupt gets delivered (note this can also be a =
list
> >> of vCPUs if routed from the IO-APIC using Fixed mode).
> >>
> >> I'm at lost at how to fix this so that virtual timers work properly
> >> and we also keep the "delay for missed ticks" mode without doing a
> >> massive rework and somehow keeping track of where injected =
interrupts
> >> originated, which seems an overly complicated solution.
> >>
> >> My proposal hence would be to completely remove the timer_mode, and
> >> just treat virtual timer interrupts as other interrupts, ie: they =
will
> >> be injected from the callback (pt_timer_fn) and the vCPU(s) would =
be
> >> kicked. Whether interrupts would get lost (ie: injected when a
> >> previous one is still pending) depends on the contention on the
> >> system. I'm not aware of any current OS that uses timer interrupts =
as
> >> a way to track time. I think current OSes know the differences =
between
> >> a timer counter and an event timer, and will use them =
appropriately.
> > Fundamentally - why not, the more that this promises to be a
> > simplification. The question we need to answer up front is whether
> > we're happy to possibly break old OSes (presumably ones no-one
> > ought to be using anymore these days, due to their support life
> > cycles long having ended).
>=20
> The various timer modes were all compatibility, and IIRC, mostly for
> Windows XP and older which told time by counting the number of timer
> interrupts.
>=20
> Paul - you might remember better than me?

I think it is only quite recently that Windows has started favouring =
enlightened time sources rather than counting ticks but an admin may =
still turn all the viridian enlightenments off so just dropping ticks =
will probably still cause time to drift backwards.

  Paul

>=20
> Its possibly worth noting that issues in this are cause triple faults =
in
> OVMF (it seems to enable interrupts in its timer handler), and breaks
> in-guest kexec (because our timer-targetting logic doesn't work in a =
way
> remotely close to real hardware when the kexec kernel is booting on a
> non-zero vCPU).
>=20
> ~Andrew


