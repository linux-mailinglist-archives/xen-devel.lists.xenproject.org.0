Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B047B3B1A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 22:15:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610689.950178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmJtE-0005bI-Ug; Fri, 29 Sep 2023 20:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610689.950178; Fri, 29 Sep 2023 20:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmJtE-0005YR-Qz; Fri, 29 Sep 2023 20:15:08 +0000
Received: by outflank-mailman (input) for mailman id 610689;
 Fri, 29 Sep 2023 20:15:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CPsi=FN=siemens.com=dan.driscoll@srs-se1.protection.inumbo.net>)
 id 1qmJtD-0005X6-N4
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 20:15:08 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfd1798f-5f04-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 22:15:04 +0200 (CEST)
Received: from DM6PR07MB4316.namprd07.prod.outlook.com (2603:10b6:5:c1::17) by
 BN0PR07MB8295.namprd07.prod.outlook.com (2603:10b6:408:129::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Fri, 29 Sep
 2023 20:15:00 +0000
Received: from DM6PR07MB4316.namprd07.prod.outlook.com
 ([fe80::ca48:1494:943c:3430]) by DM6PR07MB4316.namprd07.prod.outlook.com
 ([fe80::ca48:1494:943c:3430%5]) with mapi id 15.20.6838.027; Fri, 29 Sep 2023
 20:15:00 +0000
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
X-Inumbo-ID: dfd1798f-5f04-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naOi9KXwlqd+uvwE7VnSfaL7X7oj/+UuJBZoSXf45y580KLf8WAmO1VaWC/xjEhnAO+EgAgvMrqkvrjOsEDsj9949A5NCY/8gImUXd+gwodtrmG/LlD5rt5ePOX1Jzh7PYpW2jI8XKXqSl9aDSfb5dQBYlLBNAGAi2JNs3aaVWlYsco3g9NGtTlCMzYNGrJc3dh09T795MQvKIUb3VL2AuQD29yC/lfEJGQR2GYKhDsE6Lz7aaOm1emk8cPXqy5/aDlBU6PAoVAc4FYod4ZC+JunQ1MLZjekyrOhYM0U0RPSqtRGz2tTQRNCK2xTfhbyfnUL4btfl7XBT+HibIh9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/hygJry5wZv/MSkmMm11JaP6xmwsgYP02waF3c6fJ4=;
 b=Z//38aB5MwpMMI2Vt6LIsRPTIQ9MT1FmXs1VWgVTBDVuBEzaDrmKSTBcvhXyTPrYOb7qigK0f3aDyujBSPL7PTdLK5G2U6D022d6N9rbBzz5QcfMQjM8+8B85Hjs5SrrqtTFHi/S+hnovr1py3bdcvNNctTdYPfcuQuJ8ABW+Bt9nd0c6D1G5BDuec/b0N1ephs18MBVq6OEFuQNYpS8Zc7v+I3HZ2mZYUHl5PhNtAsyqRR+8ONoo49Ht1x95pedVCuqGQB26n+GBCW3m0/kHhhoDHq61NwsDcHwY3O93YRMptj5OrDW+mK9WIGWryVqn/WOgcBqZefzlJxiTVCH5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/hygJry5wZv/MSkmMm11JaP6xmwsgYP02waF3c6fJ4=;
 b=TfZnu3cSsEIQaeznZ1E7KtqCYyyur61iuFTw6QzMQgM5rWHE2ZHzACw45/7569YHBAx4FjeHz9NG4iVeohqbJd2fcLZrPBFHN0WrC70xvEe3pLiptxzt+ENZRIVmRkn5G3gJd3vK0Q1gBKgEvYH5kuIeeXa0S1CmpjKjsM2DVybuj49jbvgux1vyc+KBRGrXnN/hkPlx+Q4IGaUJF01E6VXOKwudrxXxYxl0sGan8sgORrldp9v7Z9w4XfFZOx1vrCaE7VYX9NBNl1n4Oke22+0h7R/u444woJF+04kg69y7LVQYteJ1TrAF/tGV0z+I6iOTV+caZ+DbWJP//VZlmQ==
From: "Driscoll, Dan" <dan.driscoll@siemens.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"arvind.raghuraman@siemens.com" <arvind.raghuraman@siemens.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, "rahul.singh@arm.com"
	<rahul.singh@arm.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Subject: RE: Xen on AWS EC2 Graviton 2 metal instances (c6g.metal)
Thread-Topic: Xen on AWS EC2 Graviton 2 metal instances (c6g.metal)
Thread-Index: AdnwsItjvuOZZuTtRQy72nkgCbOw3QAkdpIAAHOBb7A=
Date: Fri, 29 Sep 2023 20:15:00 +0000
Message-ID:
 <DM6PR07MB4316E030CEF6D6E27ACD58819AC0A@DM6PR07MB4316.namprd07.prod.outlook.com>
References:
 <DM6PR07MB43168B0D4DEA80BF2474B9D89AC3A@DM6PR07MB4316.namprd07.prod.outlook.com>
 <ed3ea203-4244-4bbe-a9e0-ac8882ecc83c@xen.org>
In-Reply-To: <ed3ea203-4244-4bbe-a9e0-ac8882ecc83c@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-09-29T20:14:59Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d1533a6a-78fc-4628-b8a3-93e6a6f3a83c;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR07MB4316:EE_|BN0PR07MB8295:EE_
x-ms-office365-filtering-correlation-id: 5b54f6af-1fc0-455f-0546-08dbc128c217
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Jk41uOvZmmV9SezOzIriEeym5bEp8kR7DYFwAWqVcfsDVF+76ptxr81aMapFk51PkGtgTqcBE/rk8mCKSHjAR0WB6Vo1iHtlGA9fWWrQdvLfHSTi0v5GoDE5nU2BfGQ8QyOPmGYZXBU3TwtD25xE+et+1hMc/bsPeWdyJP/9BgMEatfI24CJzJ4UjuIIB9CX8FAhwq0ZqTZkE4+CwNU/ZHmh7jMiWY7qrAvfka/wzyscWi2OhChuLTL9MBYe6n2SbVqFVkoj4z86tS97INWBdROz7uteqpTtrf85v6WMK/XikI95rEjFoyr5kw1eQTHTku9w2YlxT0zLTvKhIUynb92jQGv3gHxuc3ySewgM9K2E4CktjKChSD7+6MbG7mEyRQjL2wf8nuUFreMlqa+VGL9I3o6/O8ja6ZEJ2q8JkKN9Z3iAacGwyl179tV++obqNzrs/WU4RIeL5MKzECGjwZ23dOR4lRZ/CHYJ2Yfx5WpRAGMQ1bFhSOht018aAHXyrdqNi6yWtDOwqHTL99BEfIOTVADbMofkmkhmatSY91KbO1+xQ1lbRAN/96jigrCrJ6mAI9KeZ0O+oclyKRzxfbpw1jsLeiSG2nRAL69WsQc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB4316.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(71200400001)(5660300002)(45080400002)(26005)(2906002)(33656002)(83380400001)(30864003)(38100700002)(82960400001)(122000001)(86362001)(38070700005)(53546011)(55016003)(7696005)(6506007)(9686003)(4326008)(8936002)(8676002)(54906003)(66946007)(66446008)(64756008)(66476007)(66556008)(316002)(41300700001)(478600001)(52536014)(966005)(76116006)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?g//iC7f2neYYL0or+eQOF3UYuwd/uMOeD3Gnl/3qfAhAvj+KtWonvCqn2IiU?=
 =?us-ascii?Q?E1jXKknOb8BE1DoL8l2u96U7irZgU+D40cOWkfj0glyzEvN4xAmebLRWYEeI?=
 =?us-ascii?Q?meQEs4tk738520d8BYepV3SIPZtfdbA5OdAjE/7+ee/m1/IrE3zcCUkcG8Lb?=
 =?us-ascii?Q?mc/c5wQaP2IfCZGAoIRCjPemDYjX1VkNbRsfeDFb7wQoQdvAOC7KZwIucJuH?=
 =?us-ascii?Q?xMXl1rDQzczgVtGjAJRs3/z2W9taIyWE+b+ys+9qdhcoEyFYkfXiJVSa31dg?=
 =?us-ascii?Q?8SCA0tuAq95HmosnND3Mvw9cB/mH97eRpsneie49o1Zab9fLmTQzqb0qBbqz?=
 =?us-ascii?Q?+y1gqerDNwJMfAN9VZ0Lp61uJkfV06udg9y1QkXzhA6EZx0oeCf8rOnAJ2Bk?=
 =?us-ascii?Q?WIakjfXDN+lmyFscZAZxsCO+5TRZMBLGlpZD9KBYVLzBrO9qj1bsUAMuMGQ1?=
 =?us-ascii?Q?khwa7MEV1dfNbXEhllpdId4xnZJGofhezOz6fHF0uJPIsH7q+anaCUDo/trE?=
 =?us-ascii?Q?cUOqMKYyhJwX30+7/rTHvTcsICS5kylk6eC6Ay1M379k66P2ro1XcQ80kTAO?=
 =?us-ascii?Q?5TRgtHarbOyYY51EiN2NbO/ZiOGzVHkPm+XNdZXoGFanMcn1fmeeoPBF7k+J?=
 =?us-ascii?Q?MngVB7IV4yP6+FRujQExsaJqry+LUPfq0dNrgmRNJ/ExgvblD/kg/+j+cy5e?=
 =?us-ascii?Q?Olup42dmTp0JieDPGWWRaKoSYKqauwm+V2JIkfGZgdWpRnz2RxSRhcWIV66+?=
 =?us-ascii?Q?HCbXbExa6s0lfxsf/bOHmQf7zQi7IatyqS4D9toRUROS3ezLN9mO2LdCtK3k?=
 =?us-ascii?Q?q5YYapNFRe/WmDA4WsNB9NbjPoNOkT7O3mRAy8NnOXk0Oili6jV6oQY7RJza?=
 =?us-ascii?Q?jxt64lbN0bP+UGcYUsAsKL/Hbu6q2h4SMB6KLiD3mc98r3tf75h/hs+gPh4b?=
 =?us-ascii?Q?P7o2WvLqSIqRhehzY5INAZRUDoBQymtXVcJGYgK/KFHMPGlbkff6GKeVAQJv?=
 =?us-ascii?Q?189C/k1Rd0VCailPxNcRKtSK3tMcv3F9JC9iCHXfocT9HS6cMv3slSIHoRhR?=
 =?us-ascii?Q?+0i0ook63j0p7jN1KGIt7p3YmHKnzho+H3HkrdHPIQSMoydZvuygHYWylsqd?=
 =?us-ascii?Q?OhPiULeF9xHwAUZhkCLxr3A7kTdKJeqdYfvWTPkQpQVSrqWwystOIvAmPGrQ?=
 =?us-ascii?Q?AZ8xa+WhLQoGBVUPgDvxOk74TNr/y0ADH68Yeo0JhYDKLurB7N00ipvgMPQ3?=
 =?us-ascii?Q?UmGeNh4sI8Y/CON9icJDd5lV3nGps7DylB34sDH8dIXYQP8XVLP3tQa5Ucza?=
 =?us-ascii?Q?KScaMUiyz0fGjGiiqAmn1qVEOFlyC3ZUIBJ/lzkNhDQzgQKok1qwwAOJVRZv?=
 =?us-ascii?Q?dg5yju7/WJ0N5ycCrrzz9LRHnjasKlNjGVQh2nLSzX8vMkaqsL5M6c4xqv67?=
 =?us-ascii?Q?8zKymTTVyfsuL/cyW5G/Lh5540knoiQPXVZIHUO3eImqgQ2W9/T7MYdtVKZs?=
 =?us-ascii?Q?MF4wTfB9OskXO6s4al+/pL0FN/nPVSF8aAiZEDLTt0KBXgjTJP3hjokU3xTO?=
 =?us-ascii?Q?6NXyKZP3ahmbu9TglKG437+akhQj1D78nWynKYeS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB4316.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b54f6af-1fc0-455f-0546-08dbc128c217
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2023 20:15:00.1716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xht7s7X15gzT+2nOd0cwjCMM+KnwUrhVrPAPSTKpSqVdNzgIjEBNuETPbxGhRvus6MojAh3kkEbQi6RHShomG4P/gaEWNHD5yR8m9tRZUmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR07MB8295

All,

        Just an FYI - using the debug guidance from Julien on Graviton 2, w=
e have successfully been able to boot Xen and 3 Linux VMs on a Graviton 2 c=
6g.metal instance.

        The problem turned out to be that the ACPI table containing the arc=
h timer interrupt vectors had an issue - the result was that the secure phy=
sical timer IRQ was getting set to a value of 0 which resulted in Xen panic=
king at vtimer.c:75 and stop booting the system.  The quick work-around for=
 this was to just hard-code this IRQ to 29 which is the "typical" PPI assig=
ned for this interrupt (and I suspect it isn't even used, so kind of a don'=
t care).  This fixed the problem and we encountered no other issues.

        Out of curiosity, is this problem we found here one that has been s=
een before?  I guess I could argue that the ACPI tables are incorrect and s=
hould provide a valid PPI number for the secure physical timer, but I could=
 also argue that Xen shouldn't panic if this value is 0 and should maybe re=
place with a "suitable" value and continue booting since it really is not u=
sed?  I can provide more details as well as the patch used to work around t=
his issue - we are using Xen 4.16.1 BTW.

        Much appreciated for the support and help here... as we progress in=
 our work in this domain, we might have some more questions but, for right =
now, it appears that things are working properly with the limited testing w=
e conducted.

Thanks,
Dan

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: Wednesday, September 27, 2023 7:59 AM
> To: Driscoll, Dan (DI SW CAS ES TO) <dan.driscoll@siemens.com>; xen-
> devel@lists.xenproject.org
> Cc: Stefano Stabellini <sstabellini@kernel.org>; Raghuraman, Arvind (DI S=
W CAS
> ES) <arvind.raghuraman@siemens.com>; Bertrand Marquis
> <Bertrand.Marquis@arm.com>; rahul.singh@arm.com; Luca Fancellu
> <Luca.Fancellu@arm.com>
> Subject: Re: Xen on AWS EC2 Graviton 2 metal instances (c6g.metal)
>
> Hi Dan,
>
> Thanks for the report.
>
> On 26/09/2023 20:41, Driscoll, Dan wrote:
> >     First off - sorry for the very long email, but there are a lot of d=
etails related
> to this topic and I figured more details might be better than less but I =
could be
> wrong here....
> >
> >     Within Siemens Embedded, we have been doing some prototyping using
> Xen for some upcoming customer related work - this email thread attempts =
to
> explain what has been done here and our analysis of the problems we are h=
aving.
> >
> >     We have done some initial prototyping to get Xen running on an AWS
> Graviton 2 instance using an EC2 Arm64 "metal" instance (c6g.metal - no A=
WS
> hypervisor) and ran into some problems during this prototyping.
> >
> >     Since the Edge Workload Abstraction and Orchestration Layer (EWAOL)
> that is part of SOAFEE already has some enablement of Xen in various
> environments (including an Arm64 server environment), we used this as a s=
tarting
> point.
> >
> >     We were able to successfully bring up Xen and a Yocto dom0 and
> > multiple domu Yocto guests on an Arm AVA server (AVA Developer
> > Platform - 32 core Neoverse N1 server) following documented steps with
> > some minimal configuration changes (we simply extended the
> > configuration to include 3 Linux guests):
> > https://ewao/
> > l.docs.arm.com%2Fen%2Fkirkstone-
> dev%2Fmanual%2Fbuild_system.html%23bui
> > ld-
> system&data=3D05%7C01%7Cdan.driscoll%40siemens.com%7Cc7c8b262cbfc43ce
> >
> 45b908dbbf598a6d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C63
> 831416
> >
> 3551872035%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
> 2luMzI
> >
> iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DTfGY5InUn
> BnfUO0z
> > ato7l%2Fa5IIAek%2FOip%2FdNMxuXEgM%3D&reserved=3D0
> >
> >     So, this specific EWAOL support has all the proper bitbake layers t=
o
> generate images for both bare-metal (Linux running natively) and a virtua=
lization
> build (using Xen) for AVA and also a Neoverse N1 System Development Platf=
orm
> (N1SDP), but we only verified this on AVA.
> > c6g.medium
> >     AWS also has support for EWAOL on Graviton 2, but the only supporte=
d
> > configuration is a bare-metal configuration (Linux running natively)
> > and the virtualization build hasn't been implemented in the bitbake
> > layers in their repo - here is the URL for information / instructions
> > on this support:
> > https://gith/
> > ub.com%2Faws4embeddedlinux%2Fmeta-aws-
> ewaol&data=3D05%7C01%7Cdan.driscol
> >
> l%40siemens.com%7Cc7c8b262cbfc43ce45b908dbbf598a6d%7C38ae3bcd95794f
> d4a
> >
> ddab42e1495d55a%7C1%7C0%7C638314163551872035%7CUnknown%7CTWFp
> bGZsb3d8e
> >
> yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7
> C30
> >
> 00%7C%7C%7C&sdata=3DrPcqfn9w9C9cS81Ee5HpyupEBD%2BqDY18dvPm0N6tB
> Mk%3D&res
> > erved=3D0
> >
> https://docs.aws.am/
> azon.com%2FAWSEC2%2Flatest%2FUserGuide%2Fgrub.html&data=3D05%7C01%
> 7Cdan.driscoll%40siemens.com%7Cc7c8b262cbfc43ce45b908dbbf598a6d%7C38a
> e3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638314163551872035%7CUnk
> nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h
> aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DZwLDw%2B3vOtaVJwg%
> 2B7kgHXJcE8yuu%2F7TNewmE2Yn4AiQ%3D&reserved=3D0
> >     As part of our effort to bring this up, we did a VERY minimal patch=
 to the
> repo used for the AWS EWAOL to generate a virtualization build (attached =
meta-
> aws-ewaol.patch).  The resultant build of the AWS EWAOL support with this=
 patch
> applied does result in Xen being built as well as a dom0 Yocto kernel, bu=
t there is
> definitely missing support to properly build everything for this virtuali=
zation layer.
> Following the instructions for meta-aws-ewaol,  we generated an AMI and s=
tarted
> an EC2 instance with this AMI (c6g.metal type).  The resultant image does=
 boot,
> but it boots into the dom0 Linux kernel with problems recorded in the boo=
t log
> related to Xen (see dom0-linux-boot.txt).
> >
> >         Looking more closely at the EFI partition, it was clear that sy=
stemd-boot
> was being used and it was set-up to boot the dom0 Linux kernel and not bo=
ot into
> Xen - the Xen EFI images were not present in the EFI partition and obviou=
sly no
> launch entries existed for Xen.  To rectify this, the Xen EFI image that =
were built as
> part of the AWS EWAOL build mentioned above where placed in the EFI parti=
tion,
> along with a Xen config file that provided the dom0 Linux kernel image de=
tails.  A
> new entry was added into the EFI image for Xen and the launch conf file w=
as
> updated to boot Xen instead of dom0 Linux.  This resulted in the EC2 inst=
ance
> becoming "bricked" and no longer accessible.
> >
> >         Details on the EFI related content and changes we made are capt=
ured in
> the meta-aws-ewaol-efi-boot-changes.txt file attached above.
> >
> >         The next step was comparing the AVA Xen output that was working=
 and we
> noticed a few differences - the AVA build did enable ACPI and UNSUPPORTED
> kconfig settings whereas the AWS Xen build did not.  So, we tried again t=
o bring up
> another EC2 metal instance using the same AMI as before and utilized the =
AVA
> Xen EFI image instead and same Xen config file.  The result was the same =
- a
> "bricked" instance.
> >
> >         We will likely try to use the entire AVA flow on AWS Graviton n=
ext as it is
> using GRUB 2 instead of systemd-boot and we hope to maybe extend or enabl=
e
> some of the debug output during boot.  The AWS EC2 instances have a "seri=
al
> console", but we have yet to see any output on this console prior to Linu=
x boot logs
> - no success in getting EC2 serial output during EFI booting.
>
> That's interesting. The documentation for AWS [1] suggests that the logs =
from boot
> should be seen. They even have a page for troubleshooting using GRUB [2].
>
> I just launched a c6g.metal and I could access the serial console but the=
n it didn't
> work across reboot.
>
> I have tried a c6g.medium and the serial was working across reboot (I cou=
ld see
> some logs). So I wonder whether the serial console is there is a missing
> configuration for baremetal?
>
> >
> >         We have had a call and some email exchanges with AWS on this to=
pic
> (Luke Harvey, Jeremy Dahan, Robert DeOliveira, and Azim Siddique) and the=
y said
> there have been multiple virtualization solutions successfully booted on =
Graviton 2
> metal instances, so they felt that Xen should be useable once we figured =
out
> configuration / boot details.  The provided some guidance how we might go=
 about
> some more exploration here, but nothing really specific to supporting Xen=
.
>
> To be honest, without a properly working serial console, it is going to b=
e very
> difficult to debug any issue in Xen.
>
> Right now, it is unclear whether Xen has output anything. If we can confi=
rm the
> serial console has intended and then are still no logs, then I would sugg=
est to
> enable earlyprintk in Xen. For your Graviton2, I think the following line=
s in
> xen/.config should do the trick:
>
> CONFIG_DEBUG=3Dy
> CONFIG_EARLY_UART_CHOICE_PL011=3Dy
> CONFIG_EARLY_UART_PL011=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_UART_BASE_ADDRESS=3D0x83e00000
> CONFIG_EARLY_UART_PL011_BAUD_RATE=3D115200
>
> >
> >         I have attached the following files for reference:
> >
> >     * meta-aws-ewaol.patch - patch to AWS EWAOL repo found at
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%25
> 2Faws4embeddedlinux%2Fmeta-aws-
> ewaol&data=3D05%7C01%7Cdan.driscoll%40siemens.com%7Cc7c8b262cbfc43ce45
> b908dbbf598a6d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C6383
> 14163551872035%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ
> QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata
> =3DrPcqfn9w9C9cS81Ee5HpyupEBD%2BqDY18dvPm0N6tBMk%3D&reserved=3D0
> >     * meta-aws-ewaol-efi-boot-changes.txt - Description of EFI related
> changes made to AWS EWAOL EFI partition in attempt to boot Xen
> >     * ava.xen.config - config file for Xen build for AVA using EWAOL
> virtualization build
> >     * aws.xen.config - config file for Xen build for AWS using EWAOL
> virtualization build
> >     * xen-4.16.1.cfg - Xen config file placed in root of EFI boot
> > partition alongside xen-4.16.1.efi image
>
> May I ask why you are using 4.16.1 rather than 4.17? In general I would
> recommend to use the latest stable version or even a staging (the on-goin=
g
> development branch) for bring-up because we don't always backport everyth=
ing to
> stable branch. So a bug may have been fixed in newer revision.
>
> That said, skimming through the logs, I couldn't spot any patches that ma=
y help on
> Graviton 2.
>
> Best regards,
>
> [1]
> https://docs.aws.am/
> azon.com%2FAWSEC2%2Flatest%2FUserGuide%2Fec2-serial-
> console.html&data=3D05%7C01%7Cdan.driscoll%40siemens.com%7Cc7c8b262cbfc
> 43ce45b908dbbf598a6d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7
> C638314163551872035%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD
> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&
> sdata=3D%2BQF9rA7KVEGbGJZIX0lhCv0du4oKR5632Eff2EoC2PY%3D&reserved=3D0
> [2]
> https://docs.aws.am/
> azon.com%2FAWSEC2%2Flatest%2FUserGuide%2Fgrub.html&data=3D05%7C01%
> 7Cdan.driscoll%40siemens.com%7Cc7c8b262cbfc43ce45b908dbbf598a6d%7C38a
> e3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638314163551872035%7CUnk
> nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h
> aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DZwLDw%2B3vOtaVJwg%
> 2B7kgHXJcE8yuu%2F7TNewmE2Yn4AiQ%3D&reserved=3D0
>
> >
> > Dan Driscoll
> > Distinguished Engineer
> > Siemens DISW - Embedded Platform Solutions
>
> --
> Julien Grall

