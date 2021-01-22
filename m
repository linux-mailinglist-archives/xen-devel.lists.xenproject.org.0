Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF06300439
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 14:32:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72779.131100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2wYE-0005X0-7Z; Fri, 22 Jan 2021 13:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72779.131100; Fri, 22 Jan 2021 13:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2wYE-0005Wb-4F; Fri, 22 Jan 2021 13:32:34 +0000
Received: by outflank-mailman (input) for mailman id 72779;
 Fri, 22 Jan 2021 13:32:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PS9f=GZ=sec.uni-passau.de=hr@srs-us1.protection.inumbo.net>)
 id 1l2wYB-0005WW-JY
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 13:32:32 +0000
Received: from tom.rz.uni-passau.de (unknown [132.231.51.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28b881cf-94c0-47bb-a41a-248794a7e8b8;
 Fri, 22 Jan 2021 13:32:27 +0000 (UTC)
Received: from puremessage.rz.uni-passau.de (puremessage.rz.uni-passau.de
 [132.231.51.54])
 by tom.rz.uni-passau.de (Postfix) with ESMTP id 6EEAB125827C6;
 Fri, 22 Jan 2021 14:32:26 +0100 (CET)
Received: from puremessage.rz.uni-passau.de (localhost.localdomain [127.0.0.1])
 by localhost (Email Security Appliance) with SMTP id 5719410708D_0AD3EAB;
 Fri, 22 Jan 2021 13:32:26 +0000 (GMT)
Received: from tom.rz.uni-passau.de (tom.rz.uni-passau.de [132.231.51.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by puremessage.rz.uni-passau.de (Sophos Email Appliance) with ESMTPS id
 3AD5B104843_0AD3EAF; Fri, 22 Jan 2021 13:32:26 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
 by tom.rz.uni-passau.de (Postfix) with ESMTP id 22188125827C5;
 Fri, 22 Jan 2021 14:32:26 +0100 (CET)
Received: from [132.231.11.13] (helo=smith.sec.uni-passau.de)
 by mail.uni-passau.de with ESMTPS (eXpurgate 4.15.1)
 (envelope-from <hr@sec.uni-passau.de>)
 id 600ad3ea-0ace-84e733040019-84e70b0d41c8-3
 for <multiple-recipients>; Fri, 22 Jan 2021 14:32:26 +0100
Received: from smith.sec.uni-passau.de (2002:84e7:b0d::84e7:b0d) by
 smith.sec.uni-passau.de (2002:84e7:b0d::84e7:b0d) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 Jan 2021 14:27:44 +0100
Received: from smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9]) by
 smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9%12]) with mapi id
 15.00.1497.010; Fri, 22 Jan 2021 14:27:44 +0100
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
X-Inumbo-ID: 28b881cf-94c0-47bb-a41a-248794a7e8b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uni-passau.de;
	s=up-2020-11-19; t=1611322346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Loj0Wc+/cupV9cch8uwPjUxPG4EMJ0dEzB7PGYmwcc=;
	b=aQr/C+Xgj+SUC5ZAyr1NTxDs8nia+zdiHLgORLV5qMHcT10F2YdlmVjeQKxj1askHXS7vH
	kdEjBbTrdYfMYCocqFQbsad7VjKpRiDAVImGwqKtRvEoXatCZ5nOY6BTaBk1+862XLFN1l
	Qw1iMZmXQTcKuDdiBI5zWwA61zjKt7M=
From: "Reiser, Hans" <hr@sec.uni-passau.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: infinite loop in xenstat_qmp.c
Thread-Topic: infinite loop in xenstat_qmp.c
Thread-Index: AQHWtqWrJwDbUrC76EqHdHFKmhmKMKo0BisAgAAB1gA=
Date: Fri, 22 Jan 2021 13:27:44 +0000
Message-ID: <7EC98155-00AF-4C22-9355-20B1C7A38077@sec.uni-passau.de>
References: <9E9AC979-4A93-4527-B36C-BA96EEF190D1@sec.uni-passau.de>
 <b338b60d-85e7-90c8-262c-ab123aefa662@citrix.com>
In-Reply-To: <b338b60d-85e7-90c8-262c-ab123aefa662@citrix.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [132.231.11.33]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4AF1C3F62B0A3F4DB2068DF939A05DA6@sec.uni-passau.de>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-purgate-ID: 151291::1611322346-00000ACE-3D878F66/0/0
X-purgate-type: clean
X-purgate-size: 2323
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

Dear Andrew,
Thanks for picking this up. Sure, I agree with your proposal.
Cheers, Hans

> On 2021-01-22, at 14:25, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> On 09/11/2020 14:36, Reiser, Hans wrote:
>> Hi,
>>=20
>> I have seen several occasions with "dead" xentop processes consuming 100=
% CPU time, and tracked this down
>> to the following problem:
>>=20
>> When the QEMU process the qmp_read function is communicating with termin=
ates, qmp_read may enter an
>> infinite loop:  poll signals EOF (POLLIN and POLLHUP set), the subsequen=
t read() call returns 0, and then the
>> function calls poll again, which still sees the EOF condition and will r=
eturn again immediately with POLLIN and
>> POLLHUP set, repeating ad infinitum.
>>=20
>> A simple fix is to terminate the loop when read returns 0 (under "normal=
" instances, poll will return with POLLIN
>> set only if there is data to read, so read will always read >0 bytes, ex=
cept if the socket has been closed).
>>=20
>> Cheers, Hans
>=20
> Hi - this appears to have slipped through the cracks.
>=20
> Thanks for the bugfix, but we require code submissions to conform to the
> DCO[1] and have a Signed-off-by line.
>=20
> If you're happy to agree to that, I can fix up the patch and get it
> sorted.  We've moved this library in the time since you submitted the
> bugfix.
>=20
> Thanks, and sorry for the delay.
>=20
> ~Andrew
>=20
> [1]
> https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Signed-of=
f-by
>=20
>>=20
>> diff --git a/tools/xenstat/libxenstat/src/xenstat_qmp.c b/tools/xenstat/=
libxenstat/src/xenstat_qmp.c
>> index 19b236e7b6..0c5748ba68 100644
>> --- a/tools/xenstat/libxenstat/src/xenstat_qmp.c
>> +++ b/tools/xenstat/libxenstat/src/xenstat_qmp.c
>> @@ -298,7 +298,7 @@ static int qmp_read(int qfd, unsigned char **qstats)
>>        pfd[0].events =3D POLLIN;
>>        while ((n =3D poll(pfd, 1, 10)) > 0) {
>>                if (pfd[0].revents & POLLIN) {
>> -                       if ((n =3D read(qfd, buf, sizeof(buf))) < 0) {
>> +                       if ((n =3D read(qfd, buf, sizeof(buf))) <=3D 0) =
{
>>                                free(*qstats);
>>                                return 0;
>>                        }
>>=20
>>=20
>=20


