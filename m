Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E112B904F70
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 11:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739074.1146002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKTu-0003QQ-DD; Wed, 12 Jun 2024 09:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739074.1146002; Wed, 12 Jun 2024 09:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKTu-0003Nf-9A; Wed, 12 Jun 2024 09:41:26 +0000
Received: by outflank-mailman (input) for mailman id 739074;
 Wed, 12 Jun 2024 09:40:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sVMZ=NO=bounce.vates.tech=bounce-md_30504962.66696d19.v1-69e8e1b4a6ec4e9a978221c2533b8984@srs-se1.protection.inumbo.net>)
 id 1sHKTE-00031X-Qy
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 09:40:44 +0000
Received: from mail112.us4.mandrillapp.com (mail112.us4.mandrillapp.com
 [205.201.136.112]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5f4834b-289f-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 11:40:43 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail112.us4.mandrillapp.com (Mailchimp) with ESMTP id 4VzgWt0V5Nz8XRqZ1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 09:40:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 69e8e1b4a6ec4e9a978221c2533b8984; Wed, 12 Jun 2024 09:40:41 +0000
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
X-Inumbo-ID: d5f4834b-289f-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718185242; x=1718445742;
	bh=0dzQz5g+yQ1z3qAhbSgWZ1eOZhES88esoSrO8/gqnNU=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=r9TaUceBDQG0m5IF534ZS9rRZ2X3+VQ4z+aBycwjfv29rxaqyE+3oDZHizeTX8BVd
	 BWdiNBGzlgzoAY/IDhTXB7LNhRbS4hspjROmHZGgIFp65aP73vyfrqc+iA7Nqt+yAk
	 dRAKvsGSooaDPmxgr4C3j+ZNpX5ryMIF+yNuu9CNoCbYOEjGlqUmGdJbz+bK9x67Wq
	 wn1Wq9J4u7fizWLGuQfocokoVQzx8fQR+dcNt7htT3AWdgUJ0WZptW8PnGUK4xsiCA
	 X8AMFnAdD6ldL0Izq8MmmqGXQcIIv4IkF8cFcZNJXHXwe3IWzaaoATIWVhDHhtt34P
	 Db7oL030Tu0Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718185242; x=1718445742; i=damien.thenot@vates.tech;
	bh=0dzQz5g+yQ1z3qAhbSgWZ1eOZhES88esoSrO8/gqnNU=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=SsPjvoLjiHURPpQ8jVs1pJf/STej3jDn/JcWK5UDPR3x8HDc57MOwGTf1o9X9l6uG
	 TXzcGzluiJ9ied9ArialbxC/UhrmSa5Zt7zPAv63bEsED/NZEoyyciAPICqopQC/jQ
	 jyv2CpoRZR2sNP4WYg6ENJO8jdYANLC3T3R1YFRHOTdfKTVfFTocwEgOZvtx2F+IvO
	 gl4XWWp/+PHHRaGMC7MTHnWSY491iAp4yiz0B8VMF2zEu9J0XELi/vvtcRRbp8lOUu
	 TxAhth8/PK44Q9CoAX1joe88RPomsBpf6wV5ci457xlihs+w4nZl4RwXBRX/vnbT4i
	 dGjzhZ1KQF6Pw==
From: Damien Thenot <damien.thenot@vates.tech>
Subject: =?utf-8?Q?BlueIris=20error=20on=20Xen=204.17?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718185241193
Message-Id: <ced16fca-3b55-40a1-a7e2-ffadd9707394@vates.tech>
To: xen-devel@lists.xenproject.org
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.69e8e1b4a6ec4e9a978221c2533b8984?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240612:md
Date: Wed, 12 Jun 2024 09:40:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

A XCP-ng 8.3 user that use Blue Iris Software encountered a crash with 
Xen upgraded to version 4.17.
It worked correctly when XCP-ng 8.3 used Xen 4.13.
It is happening on Intel Xeon E-2378 CPU @ 2.60GHz CPUs and it seems 
more recent Intel CPUs.
His guests are Windows with a NVIDIA GPU given to the guest.

The user added:
 > On an older box with i9-9900K CPU it does not happen and the VM works 
as expected. Also working on an older
 > Xeon Intel Xeon E-2146G and a E-2276G. Anything newer than that 
however the VM will just BSOD.

You can find more information in the XCP-ng forum post: 
https://xcp-ng.org/forum/topic/8873/windows-blue-iris-xcp-ng-8-3

The user tried enabling `msr-relaxed` following notes in Xen 4.15 
documentation.
But it didn't change the behavior and the guest still crashes.

Has someone else observed such behavior?

Here is a Xen dmesg output with the error that the user was able to obtain:

```

(d1) [=C2=A0 132.028963] xen|BUGCHECK: =3D=3D=3D=3D>
(d1) [=C2=A0 132.029008] xen|BUGCHECK: SYSTEM_SERVICE_EXCEPTION: 
00000000C0000096 FFFFF80418A21E27 FFFFAC009F27B900 0000000000000000
(d1) [=C2=A0 132.029057] xen|BUGCHECK: EXCEPTION (FFFFF80418A21E27):
(d1) [=C2=A0 132.029096] xen|BUGCHECK: - Code =3D 8589320F
(d1) [=C2=A0 132.029134] xen|BUGCHECK: - Flags =3D 000000A8
(d1) [=C2=A0 132.029174] xen|BUGCHECK: - Address =3D 8589320F008EECE9
(d1) [=C2=A0 132.029214] xen|BUGCHECK: - Parameter[0] =3D 0F000001D9B90000
(d1) [=C2=A0 132.029255] xen|BUGCHECK: - Parameter[1] =3D 4166300FFCE08332
(d1) [=C2=A0 132.029297] xen|BUGCHECK: - Parameter[2] =3D 0355000002C881F7
(d1) [=C2=A0 132.029338] xen|BUGCHECK: - Parameter[3] =3D 0002A0818B497B74
(d1) [=C2=A0 132.029379] xen|BUGCHECK: - Parameter[4] =3D 000002A8918B4900
(d1) [=C2=A0 132.029421] xen|BUGCHECK: - Parameter[5] =3D 8B49CA230FC0230F
(d1) [=C2=A0 132.029462] xen|BUGCHECK: - Parameter[6] =3D 918B49000002B081
(d1) [=C2=A0 132.029502] xen|BUGCHECK: - Parameter[7] =3D 0FD0230F000002B8
(d1) [=C2=A0 132.029544] xen|BUGCHECK: - Parameter[8] =3D 0002C8918B49DA23
(d1) [=C2=A0 132.029585] xen|BUGCHECK: - Parameter[9] =3D 230FF0230FC03300
(d1) [=C2=A0 132.029626] xen|BUGCHECK: - Parameter[10] =3D 008AE22504F665FA
(d1) [=C2=A0 132.029667] xen|BUGCHECK: - Parameter[11] =3D 00C2F76639740200
(d1) [=C2=A0 132.029709] xen|BUGCHECK: - Parameter[12] =3D 81342405F7327403
(d1) [=C2=A0 132.029753] xen|BUGCHECK: - Parameter[13] =3D 6626750000000200
(d1) [=C2=A0 132.029794] xen|BUGCHECK: - Parameter[14] =3D C88303740200C2F7
(d1) [=C2=A0 132.029835] xen|BUGCHECK: EXCEPTION (0D8B000000AC9589):
(d1) [=C2=A0 132.029888] xen|BUGCHECK: CONTEXT (FFFFAC009F27B900):
(d1) [=C2=A0 132.029925] xen|BUGCHECK: - GS =3D 002B
(d1) [=C2=A0 132.029959] xen|BUGCHECK: - FS =3D 0053
(d1) [=C2=A0 132.029994] xen|BUGCHECK: - ES =3D 002B
(d1) [=C2=A0 132.030028] xen|BUGCHECK: - DS =3D 002B
(d1) [=C2=A0 132.030056] xen|BUGCHECK: - SS =3D 0018
(d1) [=C2=A0 132.030089] xen|BUGCHECK: - CS =3D 0010
(d1) [=C2=A0 132.030123] xen|BUGCHECK: - EFLAGS =3D 00040046
(d1) [=C2=A0 132.030160] xen|BUGCHECK: - RDI =3D 00000000000002C4
(d1) [=C2=A0 132.030199] xen|BUGCHECK: - RSI =3D 00000000005FFA48
(d1) [=C2=A0 132.030237] xen|BUGCHECK: - RBX =3D 00000000426ED080
(d1) [=C2=A0 132.030275] xen|BUGCHECK: - RDX =3D 0000000000000000
(d1) [=C2=A0 132.030312] xen|BUGCHECK: - RCX =3D 00000000000001DD
(d1) [=C2=A0 132.030349] xen|BUGCHECK: - RAX =3D 0000000000000000
(d1) [=C2=A0 132.030386] xen|BUGCHECK: - RBP =3D 00000000E4427520
(d1) [=C2=A0 132.030424] xen|BUGCHECK: - RIP =3D 0000000018A21E27
(d1) [=C2=A0 132.030463] xen|BUGCHECK: - RSP =3D 00000000E4427498
(d1) [=C2=A0 132.030504] xen|BUGCHECK: - R8 =3D 0000000000000000
(d1) [=C2=A0 132.030543] xen|BUGCHECK: - R9 =3D 000000009F25A000
(d1) [=C2=A0 132.030580] xen|BUGCHECK: - R10 =3D 00000000000002C4
(d1) [=C2=A0 132.030618] xen|BUGCHECK: - R11 =3D 0000000000000246
(d1) [=C2=A0 132.030657] xen|BUGCHECK: - R12 =3D 0000000002CEB528
(d1) [=C2=A0 132.030696] xen|BUGCHECK: - R13 =3D 00000000A81E3A80
(d1) [=C2=A0 132.030735] xen|BUGCHECK: - R14 =3D 00000000000002C4
(d1) [=C2=A0 132.030775] xen|BUGCHECK: - R15 =3D 0000000000000000
(d1) [=C2=A0 132.030812] xen|BUGCHECK: STACK:
(d1) [=C2=A0 132.030858] xen|BUGCHECK: 00000000E44274A0: (00000000426ED080 
00000000005FF898 0000000000000000 0000000000000000) ntoskrnl.exe + 
000000000043667A
(d1) [=C2=A0 132.030935] xen|BUGCHECK: 00000000005FFA18: (00000000A74AD76E 
0000000000000000 00000000A81E3A80 000000000000000E) 00007FFBA9BFF4D4
(d1) [=C2=A0 132.031010] xen|BUGCHECK: 00000000005FFA20: (0000000000000000 
00000000A81E3A80 000000000000000E 0000000000000003) 00007FFBA74AD76E
(d1) [=C2=A0 132.031086] xen|BUGCHECK: 00000000005FFA28: (00000000A81E3A80 
000000000000000E 0000000000000003 00000000005FFB10) 0000000000000000
(d1) [=C2=A0 132.031151] xen|BUGCHECK: <=3D=3D=3D=3D
(XEN) [=C2=A0 132.040828] memory_map:remove: dom1 gfn=3Df60c0 mfn=3Da3080 n=
r=3D4
(XEN) [=C2=A0 132.040975] memory_map:remove: dom1 gfn=3Df5000 mfn=3Da2000 n=
r=3D1000
(XEN) [=C2=A0 132.041124] memory_map:remove: dom1 gfn=3De0000 mfn=3D4000000=
 nr=3D10000
(XEN) [=C2=A0 132.041463] memory_map:remove: dom1 gfn=3De8000 mfn=3D4008000=
 nr=3D8000
(XEN) [=C2=A0 132.041905] memory_map:remove: dom1 gfn=3Df8000 mfn=3D4010000=
 nr=3D2000
(XEN) [=C2=A0 132.042072] ioport_map:remove: dom1 gport=3Dc100 mport=3D6000=
 nr=3D80
```

Thank you



Damien Thenot | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


