Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069E057A498
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370775.602651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDqg5-0000gd-96; Tue, 19 Jul 2022 17:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370775.602651; Tue, 19 Jul 2022 17:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDqg5-0000d7-6R; Tue, 19 Jul 2022 17:06:33 +0000
Received: by outflank-mailman (input) for mailman id 370775;
 Tue, 19 Jul 2022 17:06:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vT2r=XY=riversideresearch.org=rsmith@srs-se1.protection.inumbo.net>)
 id 1oDqg3-0000cM-8a
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:06:31 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0107.outbound.protection.office365.us [23.103.209.107])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2096b11f-0785-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 19:06:29 +0200 (CEST)
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::22)
 by BN0P110MB1418.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:181::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 17:06:26 +0000
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5c73:fd8e:2a33:be27]) by BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5c73:fd8e:2a33:be27%3]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 17:06:26 +0000
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
X-Inumbo-ID: 2096b11f-0785-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Tuza4z5t8AM6Jr0P/j+p9kgWGG2YCZTbhO7N02iiu2YK+8LtAhe/TV/qi/lp/p+oj3TG8OGoOG8p73EFaKMXC7y3v1xPiSHygY65z5lhEttyg7vIYmNCaR+syW80ceLQIzMHgbecMny+a/5DSNHap9oLW8S+o2oYN0dANFXGv2By0xGxIeAqEYF8NLopy/7qKATwf3og9jYNdbnf7hWEq9JxEHRk6hjeIQjUm6Rcr6D8W5PtleryJhLopphLWBNuMsCzjlP7VYSp6uMEeOypoXh9q+C1xo7erhTwwQ8rCFeSXAoHmgQEU8ZWWT3R/r8nv2YrX5iTQ5ZrY4Ebkv0nBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6te3jQ3p/QWgcuoyD3zoTgKMYHVzI6raRHg9aEQR3A=;
 b=uMdMEaWw5OnlbxaDPm0YUA55Ld2IE9XncrQCmHZ7I8/yIQZT7Wqkie01u+KxRNUzSWyqd3uxpSp7KOvquenR/uYvc6e4aS7d7YLMCmVY17SooOiD0OeJNmcoaJMurwE+TWNotB+R1EJEyIa7vWjHREZOh3bnfQAasLk+OmwgqzAFPOV8I9z3PlLbvWxS9dU5XGfY9d84LqQlNg8thMlRbfvAF0K26N6qh9GbJ01M1a662cCxevSRnlXogZwFAATMXE3n46ffXdBSeUJunW6jQVeVj9jN0HqVqxvWIpVNCz3ocTiobMW2+pqmIoda3BpJ0GJdHWOgC97JVt+oWijGdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=riversideresearch.org; dmarc=pass action=none
 header.from=riversideresearch.org; dkim=pass header.d=riversideresearch.org;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riversideresearch.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6te3jQ3p/QWgcuoyD3zoTgKMYHVzI6raRHg9aEQR3A=;
 b=EZo3bI5kI9j04nVMi3wA1DLrV2p2LVoeEiO4sBJZGCbVFbYQwWt6eOxb1GFpcuTus/Sj1IvZl4EE3NSuzRm+phL7ZZFw0NCok50oM7bmoCDwZOgNq4WY4c96BR/4FBjaY6TmwiiX+dkf2c34nSTAy9DLCvY2fYNDcpBljxs6uQOAU0J0lLTmFv0jh6Nr/4pa6e3ZLd9z7Mmo/qXebfmFzIXWEhG8FaMisvEHcrPIXzGCe5jtVTVcGL3J92iA0zN0X9Q0gcDZZ11O1L62HgxQ84tb6R4TAXZ/VzhPIHNcAlj8OpcmFbcd19ITBSEMSG/7ljPq9dsJWemZRIMOwdIfZQ==
From: "Smith, Jackson" <rsmith@RiversideResearch.org>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>
Subject: RE: [PATCH v1 00/18] Hyperlaunch
Thread-Topic: [PATCH v1 00/18] Hyperlaunch
Thread-Index: AQHDrne88XyYXkgxTAt6TFUls0rRYK2vvfVA
Date: Tue, 19 Jul 2022 17:06:26 +0000
Message-ID:
 <BN0P110MB1642FA64F48C31ED7F64AF27CF8F9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=RiversideResearch.org;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d93e4e1-fc7e-4bf3-6dd9-08da69a903df
x-ms-traffictypediagnostic: BN0P110MB1418:EE_
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8pzMy4DoeACj9hNnC4atV3e6N9figjCLk7PM1Z9UkKR3qVDDZf+DaEftbMt7zV08e4E0n1d/2qotN+CIUjgdxcU3wK6vrUqT850TmHgpFpxaoDwPH8MngZUGUdjpCMexiTlz0mG08qyFuTz8LWo3pSiM0gh8KSuf8me4hV5n1E53s5cj7txGwSHzRSRvI4BoIiOFoA1R/5MIV7YnQNTdBVqSEQoDNwD1E+Oz/n6FwIM9A6ErbmrXbTWmm66iJlLcOb/XlIM1nJ9BKif0IrZtgzPagpqtg+txwwsK1JIYtFTLfRpv4KWdoyrbCii1+9tA2GBNFyV1tLpxbulQ/pJPjFOEvC4zHh42DEmU0ocvau/ezFdOWKvZ9GQiH+vf6bg2LoDRxRPZH+Y7h22pKdqxuWMVkffm1HK2MFgAffncGVnIxzzvOdzLeKf2kY4YjGaiupOu/lLf9etgHiEnccksNdWmDXwpOwot5C24TQYJe3KaKtZ+HQAnehJLHP3I4LBfsyilOrqbhZvyFBEUXVE4x/1OllcVCiQg4l0BeZZrQ+i0j24GSydIvMLunrDnT+GPDjSyESXJ2te76gEu3GgT1/UdUkev0miuZzyyAqRguELdy4ARgN1W1STTLDMcz0ZIMi+TVMsirvwuMRjnLkSTH9o04O0T/yN2FVm2jOFcESR3A3N+jHwMHTOg43ihX6ZmBuuZkjwOFpcCmFa05AGNfws6bcPKRhcPODRMqpZg4os1m6BEybUsPiwn7KIMdR++
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(366004)(55016003)(2906002)(54906003)(76116006)(33656002)(5660300002)(52536014)(8936002)(8676002)(66556008)(4326008)(66446008)(66946007)(64756008)(110136005)(66476007)(6506007)(83380400001)(71200400001)(122000001)(498600001)(82960400001)(86362001)(7696005)(38100700002)(186003)(9686003)(26005)(38070700005)(85282002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 uMuNJL4aJojtcz9JVyZJJklEM/L3Mf7Xm9PO0gOqkL1fa3bxshF92D6H+7JUNiHOVy6T1czrxVUzcAectYgrKFQfHl4HCNkEihzJIWQterD/lencuL8W4TUSvs1JyBtBJ+VBj8v9UzaseKa/rngq0XXAOwcy/wITZMN9kkqkGE0h5c7h6stdqX7ua4NP9shciPgpMhzr+7JobDnynJRJnWkRNll4ZFKegiQ+43XFKQofU9Gy676neH1OzIUL5+XCFsa3o06mbavTIQb7ntJoVIkDpN25qRM1xoUyrXpz5Z31zCbGjVauhW58/iZBPQnhDnt5ivIeo2EuMforM3VwG5T6bjsR2EYkOrEU7NkJuKWemcZQPmYag2ww6fPzFBuShvwbKLtMuZWq/5Nq/xCXnHNa7htLdpB2oQNDiL8yal4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: riversideresearch.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d93e4e1-fc7e-4bf3-6dd9-08da69a903df
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 17:06:26.1397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc64a8d-9064-4c64-91c3-9d10b44c1cb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1418

Hi Daniel,

> -----Original Message-----
> Subject: [PATCH v1 00/18] Hyperlaunch

With the adjustments that I suggested in other messages, this patch builds =
and boots for me on x86 (including a device tree with a domU). I will conti=
nue to poke around and see if I discover any other rough edges.

One strange behavior I see is that xen fails to start the Dom0 kernel on a =
warm reboot. I'm using qemu_system_x86 with the KVM backend to test out the=
 patch. After starting qemu, xen will boot correctly only once. If I attemp=
t to reboot the virtual system (through the 'reboot' command in dom0 or the=
 'system_reset' qemu monitor command) without exiting/starting a new qemu p=
rocess on the host machine, xen panics while booting after printing this:

(XEN) *** Building Dom0 ***
(XEN) Dom0 has maximum 856 PIRQs
(XEN) *** Constructing a PV Dom0 ***
(XEN) ELF: not an ELF binary
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Could not construct domain 0
(XEN) ****************************************

This happens with the BUILDER_FDT config option on and off, and regardless =
of what dtb (if any) I pass to xen. I don't see this behavior if I switch b=
ack to xen's master branch.

Hopefully that explanation made sense. Let me know if I can provide any fur=
ther information about my setup.

Thanks,
Jackson

Also, I apologize that my last messages included a digital signature. Shoul=
d be fixed now.

