Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D997430DD8B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 16:04:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80948.148557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Jhz-00086a-8a; Wed, 03 Feb 2021 15:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80948.148557; Wed, 03 Feb 2021 15:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Jhz-000869-56; Wed, 03 Feb 2021 15:04:43 +0000
Received: by outflank-mailman (input) for mailman id 80948;
 Wed, 03 Feb 2021 15:04:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+PM6=HF=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l7Jhy-000864-Gn
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 15:04:42 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e51bcac-c86b-4381-8f67-fc45582140a0;
 Wed, 03 Feb 2021 15:04:41 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id p15so24658266wrq.8
 for <xen-devel@lists.xenproject.org>; Wed, 03 Feb 2021 07:04:41 -0800 (PST)
Received: from CBGR90WXYV0 (host86-190-149-163.range86-190.btcentralplus.com.
 [86.190.149.163])
 by smtp.gmail.com with ESMTPSA id h1sm4082605wrr.73.2021.02.03.07.04.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Feb 2021 07:04:39 -0800 (PST)
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
X-Inumbo-ID: 3e51bcac-c86b-4381-8f67-fc45582140a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=zFn+fUtDL880wCZdN25GPb72QHjOshIvJImNRb7sZrQ=;
        b=s7Ub46YBAd86Pv0On5CxuRKvS2/F9T2G40qPaZBrfSJ8wE7AqmmkVZofm3w/+5MtTe
         Oz3IRfaD/qQf6DkinZHcQy1N0NUHswynWl/tvYSNeOJx1U/2wLSfWXbtxeQDev8GKLUN
         QfLszdnGPeLAY+nLSHE6XauqG6iUpSqZkxzmgdRhS9ZTMIglZcQF+KmreSohgStlQtzs
         v+8UF/48Cxmkt9XGqrJt7yPYb/K9ueKinO1qTxVUd6zp5Qje1VDw9SIG1Mdmg1qxg8Ws
         52UAaIjqLNUGqI0LKXU4ZVxraiZQYXExvQA0+aZ3FX7bjwaBseXoIkPNUvxNxL8wUVo3
         clPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=zFn+fUtDL880wCZdN25GPb72QHjOshIvJImNRb7sZrQ=;
        b=Rdc9h/CYeW8fxCMyEgttYdEDhQT1/16KVo4mt8Q8m41qUCpzcZpQfiYmM6SgXlX3BC
         1FIwcD0rTsEmSRnAK0CgdUTywmnLQM4wKK8BMsVVUXJiyXrpTB9n8s5cfsZDumCeEeYV
         sWZTpsJShNd0ddraf3N+uAIqNSfoZzh9Xx3/0VDViPD9odo7ZZOHqxgtOC3TkyPKsSTN
         xSMzm5XZQ1bxwl4W0SwfzlbjiTN9kgBCqBvaJGhy/BfI660DnYELLNZ/qmQwmE8yFIjT
         Yff8Vmph126sdSBVhEq0Zb/10hrRGH4eo0sinM5Zj2UK/vtgD8HnDayHeWgadBDb+Sr3
         cYHA==
X-Gm-Message-State: AOAM531F0HGSony6Gz6ZfFkf7dY0zhXC+Aq/ruRWes5Rn80Hzk5eSyfk
	/hiIZofIEajfKg4gEKDopqk=
X-Google-Smtp-Source: ABdhPJzjEsp0/dl9rrwtMXuUUKjgGCGEwJCbn3sJczQvFCrTdELVHeJFaUHc4YQHNIt69ahGMQRlqA==
X-Received: by 2002:a5d:6752:: with SMTP id l18mr4038462wrw.209.1612364680493;
        Wed, 03 Feb 2021 07:04:40 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'James Dingwall'" <james-xen@dingwall.me.uk>
Cc: <xen-devel@lists.xenproject.org>
References: <20210201152655.GA3922797@dingwall.me.uk> <d30b5ee3-1fd9-a64b-1d9a-f79b6b333169@suse.com>
In-Reply-To: <d30b5ee3-1fd9-a64b-1d9a-f79b6b333169@suse.com>
Subject: RE: VIRIDIAN CRASH: 3b c0000096 75b12c5 9e7f1580 0
Date: Wed, 3 Feb 2021 15:04:38 -0000
Message-ID: <03d501d6fa3d$e5227cc0$af677640$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJhmlK/cLfJLwTp9TTyTj8ctTVv3wG1IORhqSOdFuA=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Jan Beulich
> Sent: 03 February 2021 14:55
> To: James Dingwall <james-xen@dingwall.me.uk>
> Cc: xen-devel@lists.xenproject.org
> Subject: Re: VIRIDIAN CRASH: 3b c0000096 75b12c5 9e7f1580 0
>=20
> On 01.02.2021 16:26, James Dingwall wrote:
> > I am building the xen 4.11 branch at
> > 310ab79875cb705cc2c7daddff412b5a4899f8c9 which includes commit
> > 3b5de119f0399cbe745502cb6ebd5e6633cc139c "86/msr: fix handling of
> > MSR_IA32_PERF_{STATUS/CTL}".  I think this should address this error
> > recorded in xen's dmesg:
> >
> > (XEN) d11v0 VIRIDIAN CRASH: 3b c0000096 75b12c5 9e7f1580 0
>=20
> It seems to me that you imply some information here which might
> better be spelled out. As it stands I do not see the immediate
> connection between the cited commit and the crash. C0000096 is
> STATUS_PRIVILEGED_INSTRUCTION, which to me ought to be impossible
> for code running in ring 0. Of course I may simply not know enough
> about modern Windows' internals to understand the connection.
>=20
> > I have removed `viridian =3D [..]` from the xen config nut still get =
this
> > reliably when launching PassMark Performance Test and it is =
collecting
> > CPU information.
> >
> > This is recorded in the domain qemu-dm log:
> >
> > 21244@1612191983.279616:xen_platform_log xen platform: XEN|BUGCHECK: =
=3D=3D=3D=3D>
> > 21244@1612191983.279819:xen_platform_log xen platform: XEN|BUGCHECK: =
SYSTEM_SERVICE_EXCEPTION:
> 00000000C0000096 FFFFF800A43C72C5 FFFFD0014343D580 0000000000000000
> > 21244@1612191983.279959:xen_platform_log xen platform: XEN|BUGCHECK: =
EXCEPTION (FFFFF800A43C72C5):
> > 21244@1612191983.280075:xen_platform_log xen platform: XEN|BUGCHECK: =
- Code =3D C148320F
> > 21244@1612191983.280205:xen_platform_log xen platform: XEN|BUGCHECK: =
- Flags =3D 0B4820E2
> > 21244@1612191983.280346:xen_platform_log xen platform: XEN|BUGCHECK: =
- Address =3D 0000A824948D4800
> > 21244@1612191983.280504:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[0] =3D
> 8B00000769850F07
> > 21244@1612191983.280633:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[1] =3D
> 46B70F4024448906
> > 21244@1612191983.280754:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[2] =3D
> 0F44442444896604
> > 21244@1612191983.280876:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[3] =3D
> E983C88B410646B6
> > 21244@1612191983.281012:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[4] =3D
> 0D7401E9831E7401
> > 21244@1612191983.281172:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[5] =3D
> 54B70F217502F983
> > 21244@1612191983.281304:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[6] =3D
> 54B70F15EBED4024
> > 21244@1612191983.281426:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[7] =3D
> EBC0B70FED664024
> > 21244@1612191983.281547:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[8] =3D
> 0FEC402454B70F09
> > 21244@1612191983.281668:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[9] =3D
> 448B42244489C0B6
> > 21244@1612191983.281809:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[10] =3D
> 2444B70F06894024
> > 21244@1612191983.281932:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[11] =3D
> 4688440446896644
> > 21244@1612191983.282052:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[12] =3D
> 0000073846C74906
> > 21244@1612191983.282185:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[13] =3D
> F8830000070AE900
> > 21244@1612191983.282340:xen_platform_log xen platform: XEN|BUGCHECK: =
- Parameter[14] =3D
> 8B000006F9850F07
> > 21244@1612191983.282480:xen_platform_log xen platform: XEN|BUGCHECK: =
EXCEPTION (0000A824848948C2):
> > 21244@1612191983.282617:xen_platform_log xen platform: XEN|BUGCHECK: =
CONTEXT (FFFFD0014343D580):
> > 21244@1612191983.282717:xen_platform_log xen platform: XEN|BUGCHECK: =
- GS =3D 002B
> > 21244@1612191983.282816:xen_platform_log xen platform: XEN|BUGCHECK: =
- FS =3D 0053
> > 21244@1612191983.282914:xen_platform_log xen platform: XEN|BUGCHECK: =
- ES =3D 002B
> > 21244@1612191983.283011:xen_platform_log xen platform: XEN|BUGCHECK: =
- DS =3D 002B
> > 21244@1612191983.283127:xen_platform_log xen platform: XEN|BUGCHECK: =
- SS =3D 0018
> > 21244@1612191983.283226:xen_platform_log xen platform: XEN|BUGCHECK: =
- CS =3D 0010
> > 21244@1612191983.283332:xen_platform_log xen platform: XEN|BUGCHECK: =
- EFLAGS =3D 00000202
> > 21244@1612191983.283444:xen_platform_log xen platform: XEN|BUGCHECK: =
- RDI =3D 00000000F64D5C20
> > 21244@1612191983.283555:xen_platform_log xen platform: XEN|BUGCHECK: =
- RSI =3D 00000000F6367280
> > 21244@1612191983.283666:xen_platform_log xen platform: XEN|BUGCHECK: =
- RBX =3D 000000008011E060
> > 21244@1612191983.283810:xen_platform_log xen platform: XEN|BUGCHECK: =
- RDX =3D 00000000F64D5C20
> > 21244@1612191983.283972:xen_platform_log xen platform: XEN|BUGCHECK: =
- RCX =3D 0000000000000199
> > 21244@1612191983.284350:xen_platform_log xen platform: XEN|BUGCHECK: =
- RAX =3D 0000000000000004
> > 21244@1612191983.284523:xen_platform_log xen platform: XEN|BUGCHECK: =
- RBP =3D 000000004343E891
> > 21244@1612191983.284658:xen_platform_log xen platform: XEN|BUGCHECK: =
- RIP =3D 00000000A43C72C5
> > 21244@1612191983.284842:xen_platform_log xen platform: XEN|BUGCHECK: =
- RSP =3D 000000004343DFA0
> > 21244@1612191983.284959:xen_platform_log xen platform: XEN|BUGCHECK: =
- R8 =3D 0000000000000008
> > 21244@1612191983.285073:xen_platform_log xen platform: XEN|BUGCHECK: =
- R9 =3D 000000000000000E
> > 21244@1612191983.285188:xen_platform_log xen platform: XEN|BUGCHECK: =
- R10 =3D 0000000000000002
> > 21244@1612191983.285304:xen_platform_log xen platform: XEN|BUGCHECK: =
- R11 =3D 000000004343E808
> > 21244@1612191983.285420:xen_platform_log xen platform: XEN|BUGCHECK: =
- R12 =3D 0000000000000000
> > 21244@1612191983.285564:xen_platform_log xen platform: XEN|BUGCHECK: =
- R13 =3D 00000000F7964E50
> > 21244@1612191983.285680:xen_platform_log xen platform: XEN|BUGCHECK: =
- R14 =3D 00000000F64D5C20
> > 21244@1612191983.285796:xen_platform_log xen platform: XEN|BUGCHECK: =
- R15 =3D 00000000F7964E50
>=20
> I'm also confused by this - the pointer given for CONTEXT suggests =
this
> is a 64-bit kernel, yet none of the registers - including RIP and RSP =
-
> have non-zero upper 32 bits. Or is qemu truncating these values?

The logging is coming from the PV drivers (in =
https://xenbits.xen.org/gitweb/?p=3Dpvdrivers/win/xenbus.git;a=3Dblob;f=3D=
src/xen/bug_check.c). The truncated values may just be due to a 32-bit =
user process I guess.

  Paul

>=20
> > 21244@1612191983.285888:xen_platform_log xen platform: XEN|BUGCHECK: =
STACK:
> > 21244@1612191983.286105:xen_platform_log xen platform: XEN|BUGCHECK: =
000000004343E810:
> (0000000000000000 000000004343E891 0000000000000002 00000000F75F08A0) =
ntoskrnl.exe + 0000000000485507
> > 21244@1612191983.286340:xen_platform_log xen platform: XEN|BUGCHECK: =
000000004343E8E0:
> (00000000F75F0805 000000004343EB80 00000000F6A62CC0 00000000F75F08A0) =
ntoskrnl.exe + 0000000000486468
> > 21244@1612191983.286547:xen_platform_log xen platform: XEN|BUGCHECK: =
000000004343EA20:
> (0000000000000000 0000000000000000 0000000000000000 0000000000000000) =
ntoskrnl.exe + 0000000000458CAE
> > 21244@1612191983.286755:xen_platform_log xen platform: XEN|BUGCHECK: =
000000004343EA90:
> (0000000000000000 0000000000000000 000000007DBED000 000000007DA00028) =
ntoskrnl.exe + 00000000001501A3
> > 21244@1612191983.286976:xen_platform_log xen platform: XEN|BUGCHECK: =
0000000009ABE388:
> (00000000587D5673 0000000058F40000 0000000006002D2B 0000000000000000) =
00007FFB5B3207CA
> > 21244@1612191983.287171:xen_platform_log xen platform: XEN|BUGCHECK: =
0000000009ABE390:
> (0000000058F40000 0000000006002D2B 0000000000000000 00000000160C86D8) =
00007FFB587D5673
> > 21244@1612191983.287390:xen_platform_log xen platform: XEN|BUGCHECK: =
0000000009ABE398:
> (0000000006002D2B 0000000000000000 00000000160C86D8 0000000009ABE3E0) =
00007FFB58F40000
> > 21244@1612191983.287584:xen_platform_log xen platform: XEN|BUGCHECK: =
0000000009ABE3A0:
> (0000000000000000 00000000160C86D8 0000000009ABE3E0 000000008011E060) =
00007FFB06002D2B
> > 21244@1612191983.287777:xen_platform_log xen platform: XEN|BUGCHECK: =
0000000009ABE3A8:
> (00000000160C86D8 0000000009ABE3E0 000000008011E060 0000000009ABE4A0) =
0000000000000000
> > 21244@1612191983.287898:xen_platform_log xen platform: XEN|BUGCHECK: =
<=3D=3D=3D=3D
> >
> > The Windows guest is running winpv drivers 8.2.1.
> >
> > I'm not quite sure what else to examine or change at this point so =
any
> > guidance would be welcome.
>=20
> The hypervisor log (at maximum log levels) accompanying this might
> help some. And of course, if possible, trying on a newer Xen (ideally
> current master).
>=20
> Jan



