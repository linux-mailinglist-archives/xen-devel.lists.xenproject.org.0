Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5444A2D44AB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 15:47:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48351.85484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0k7-0001LE-B5; Wed, 09 Dec 2020 14:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48351.85484; Wed, 09 Dec 2020 14:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0k7-0001Kp-83; Wed, 09 Dec 2020 14:46:59 +0000
Received: by outflank-mailman (input) for mailman id 48351;
 Wed, 09 Dec 2020 14:46:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kn0k6-0001Kk-3T
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 14:46:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::628])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bc8507a-5566-4908-970d-8ebeacdc9b07;
 Wed, 09 Dec 2020 14:46:56 +0000 (UTC)
Received: from AM0P190CA0022.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::32)
 by DBAPR08MB5768.eurprd08.prod.outlook.com (2603:10a6:10:1b1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 9 Dec
 2020 14:46:54 +0000
Received: from AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:190:cafe::cf) by AM0P190CA0022.outlook.office365.com
 (2603:10a6:208:190::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 14:46:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT022.mail.protection.outlook.com (10.152.16.79) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 14:46:54 +0000
Received: ("Tessian outbound fc5cc0046d61:v71");
 Wed, 09 Dec 2020 14:46:54 +0000
Received: from 18395851d706.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8852F488-E3C7-47AD-902E-01E7D249CC25.1; 
 Wed, 09 Dec 2020 14:46:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18395851d706.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Dec 2020 14:46:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4774.eurprd08.prod.outlook.com (2603:10a6:10:d5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.22; Wed, 9 Dec
 2020 14:46:35 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 14:46:34 +0000
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
X-Inumbo-ID: 1bc8507a-5566-4908-970d-8ebeacdc9b07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8NIOMcqO2YuIZ25ESTOtw60WrM6U29ULZLouwF2GZY=;
 b=kSKTrZEpFcHi6to/HIVd6UUs6PCDvt0pJpbUFbqsAONSeEHD0K69mby6QkX3taEd5cezUJiqiR6uGbcdGmug05Ku+jGpRywAkKDUwlcdaS7aJjXD/D1iIRdmtximQOSocLfmgz3Al0Bp/xNz2rSsjd44jhRzOi5mlB4yOOwsX7c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8eb1fea6a40a7ee
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TA8mqwJqJKiu3JKuCdH2cMK042j0QPhayaTLXM+04bKYKfZP5rkDJQV80xTQii9iB81dF8N20GZaddI0wN/CKP/FHMeJ/NNq9AiJGdu6UAs1ZmCCyEsyo52AldJKI6COubuqSk3MvCAu+n9casE85hL7M2hsXo2NyI66PaZLBJCwFt9uF4mmLIaECuOcqAsU9gIkBVQIjBZLXT2QMeIoHmfSbgA0p7RD20HRrY+qioOix7o5JFuV78wImV1PSAwNLk5TJ1K5FbHJHWJwmhZgDcSq5T/aby3Mwp1lnADQ0dvH0W2dwxNO2t4WzrmYZgFMiLSWWupEivVFoBaw1IcYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8NIOMcqO2YuIZ25ESTOtw60WrM6U29ULZLouwF2GZY=;
 b=S4sYTj1zu4Ob9E0W/CLhpXvIKi3lEW0ZMHgzhDvzJkqQmB3piXV8oYmkYNcadVaDZGV5kc4X//MHQoE3okYVhqNdvl0j7zjj6WQyyhN4YVycKqQHay6B87Ah44k10kYFnrmGEOzZr9jicZ8xLC10GSSiHgZ3cW1CrdL5a1FEIdteYvGNnH70e5jVKDKEYvA4Vtjzpowr4xy3Q+aYnQ7bgrHIGlaZhHxigrryUCBlocZEZnrQ3Iej8pZmSBT9IE5Lhxzbx+vedm5ud78WieQtY3h3lZ3Bo//rm4MUV7z/oxYUS+eefe3SMGE4WYDeFWjcQTHE3ynD9XAvIujSSIOkpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8NIOMcqO2YuIZ25ESTOtw60WrM6U29ULZLouwF2GZY=;
 b=kSKTrZEpFcHi6to/HIVd6UUs6PCDvt0pJpbUFbqsAONSeEHD0K69mby6QkX3taEd5cezUJiqiR6uGbcdGmug05Ku+jGpRywAkKDUwlcdaS7aJjXD/D1iIRdmtximQOSocLfmgz3Al0Bp/xNz2rSsjd44jhRzOi5mlB4yOOwsX7c=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 2/8] lib: collect library files in an archive
Thread-Topic: [PATCH v3 2/8] lib: collect library files in an archive
Thread-Index: AQHWwaxzwnlkqyYO/Ea2tJ3MHVbjvKnuvCIAgAAzoYCAAAERAA==
Date: Wed, 9 Dec 2020 14:46:34 +0000
Message-ID: <AF8181EC-DE6D-4BFA-A1B4-3B97FCE0BBA8@arm.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <21714b83-8619-5aa9-be5b-3015d05a26a4@suse.com>
 <E7B41B4F-98F9-4C52-8549-F407D6FB8251@arm.com>
 <742e504a-02f7-2132-c631-6a31c03959e4@suse.com>
In-Reply-To: <742e504a-02f7-2132-c631-6a31c03959e4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a3a72d8d-d431-4cd1-576f-08d89c51455f
x-ms-traffictypediagnostic: DBBPR08MB4774:|DBAPR08MB5768:
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5768B2D04193A7D3F3075EFE9DCC0@DBAPR08MB5768.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2000;OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FgKWfQ6oVLESHpSGQi2IUw5/MIgVkXToqi0eGxSmZ2FBQa158CUHBz36lwCnNyecNTW4MsyB4u7J9mAbz0AmV6YxZ10p3+xXpaX/D91Gbh+0+PWS2iL7/QQc6cHV3llCK2OykU/9GQgKUnMUuFkBp9Zs22Es2YksZLVlTJoELxJ8WZsTbhL+irO+mfj+e6/ppt1Nh//leFwN2HLOv586PS5drL7+e647YTOSQaBgHAUzY6MhdaPov2m4XWGKNHIMmWpqNPwqOLMrLoXPUyFx3FHJ+3Dnw2nFDiwFhgykIuXAIbAAOCN3+q7jgMk3tWAxMRafeczODWKTZOzDbX+K4tUu+7XZZVMbPOzgQi+R24Rkf4Vtb05hroYQQtvZr838
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(66476007)(83380400001)(76116006)(6512007)(2616005)(86362001)(33656002)(8676002)(8936002)(91956017)(478600001)(186003)(4326008)(66556008)(316002)(36756003)(64756008)(5660300002)(54906003)(66446008)(66946007)(71200400001)(6506007)(26005)(6486002)(6916009)(53546011)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?jlUwNqCFZBHpyyzkHCUXzbadL9hhkclbUS667Ovw2KU2LbjFK5Y20go3s20O?=
 =?us-ascii?Q?8XdDh93JFC7BMjF50dP8xBZYaq33RORiXLFr3zmYysKF2wDZ0XHrV9S+mIOz?=
 =?us-ascii?Q?UAw4P1F8D3ohmx90yqrdnd8QFF5HcArynZAkQsChUcYgxh6Q7fQBTBzHMziu?=
 =?us-ascii?Q?3Id0SWnY8PndXHnXt4AV6wGho0VBBlZew5HmKT1YhVhh7FFxlboAP4fLrUyN?=
 =?us-ascii?Q?kgfwxvQHF6JsviwtB6Ff1fUz444wVcrO4PvzRArE1l1HGtDr+89YxdtF/oY3?=
 =?us-ascii?Q?PkcLpRsmX4wCX5wy8M1VLoFEFDj3N5PsA5JsiFcPbJdC/Uqq0oQjPmZj0sLs?=
 =?us-ascii?Q?uWia6qYxQcIx9XNXruo5KCkajS5Yrf2XxcG04qXN2Wf0TK/fwR7YJY8hasaW?=
 =?us-ascii?Q?G1Z2H6APXtZD6aP57svEUP1rYqZvEEKjWuJhGxbfKKvTd51IjUec9G6LYWsh?=
 =?us-ascii?Q?R/jUBVwYGqUmoLdlYb0rpV1NYnukKRJaFrDmdFps7FK5uRHMYr0amqvOmeJS?=
 =?us-ascii?Q?B68T3uk28/tdn+Km6tsCCh+JfEASgfDBYTaXGyoiiuVHsyvc63Vd39Z/gCSV?=
 =?us-ascii?Q?gkoKm7gLJ61QZylOUBm02M02mU8AuLuZhaQipeYXTKQOSEowzk34AVrFWVBs?=
 =?us-ascii?Q?EgfYxMHT++iLlNuSlc1q2jG5Ql7zVLTGk+ncXC+AUNw4Dbs2karkeidkH6VK?=
 =?us-ascii?Q?9zBoMrwLDdChFVBmBmxtVF2DLgu87d4qYb3ibTk4YKaZc7ahKLfnLoJd8FzK?=
 =?us-ascii?Q?S3Y3si0mpFCGDAfiq43LM9+ms3+xRAPr6Eu6U7Y8ixd6jFT3Z7GHs8oCgVJ+?=
 =?us-ascii?Q?zDtP0U0Ivg2vuFVN7eE4Mx2jzZPN4AFXuwLemTLISL+uHXjHsmqGlUI8am9o?=
 =?us-ascii?Q?/H2hAkIARjNJZqdTzJUlI+y0pyGNQx9G2m/FgNRuXqvA/MZC1fHcOmIoxXyp?=
 =?us-ascii?Q?lunm8bEIJFHxk9MsIM5UOXwrruoi9PzvbFFvkl6xIrrpMq+Qg6tx5xRHeZhd?=
 =?us-ascii?Q?RseN?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <68E2C66AF10B9245A34882B064EC039A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4774
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e97fceca-97c0-48ea-9782-08d89c5139d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VMASb4URZWY+H+Z4UsuyOKD7PL7lGr11lD/1n6Rl3dGY3SX3umGYkKoKF3TNpYNh5LM5cZDFIjkqSwNyDnbNWTE2O5hSS1dUttstZKhz7V98CbLgKfNAZwd871E3FORj9AYsQ0zpVs2/PLt5oHeGOsiSBL5AppFM4D8IzktUZo7J7DjiFG/K8vx3B2BYyB0vkr4chKIn+BKSeM9FlDK92GYtWEFNX2zS2mbb+xQIXXHRNTLDXouudywN561wddCcRiczb1Xa5yyyREZzYSO53FU8qvZaeAwZB6PeTTTPlJhDOQ7RdXQaYh/HWnj4dUs6MEDCwCsrabBfUhyCAQJVc6ujcAORnd+06T7AX489EOfPcZWt6PZqSqJ12SNNco4aOJ+NvP0ekLto2xAwwNSoiw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(46966005)(86362001)(82310400003)(6862004)(8676002)(2616005)(508600001)(107886003)(70586007)(6512007)(36906005)(186003)(70206006)(6506007)(54906003)(83380400001)(4326008)(5660300002)(47076004)(81166007)(33656002)(8936002)(6486002)(53546011)(356005)(336012)(36756003)(26005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 14:46:54.2525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a72d8d-d431-4cd1-576f-08d89c51455f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5768

Hi Jan,

> On 9 Dec 2020, at 14:42, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 09.12.2020 12:37, Bertrand Marquis wrote:
>>> On 23 Nov 2020, at 15:21, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> In order to (subsequently) drop odd things like CONFIG_NEEDS_LIST_SORT
>>> just to avoid bloating binaries when only some arch-es and/or
>>> configurations need generic library routines, combine objects under lib=
/
>>> into an archive, which the linker then can pick the necessary objects
>>> out of.
>>>=20
>>> Note that we can't use thin archives just yet, until we've raised the
>>> minimum required binutils version suitably.
>>>=20
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Thanks.
>=20
>>> @@ -60,7 +64,14 @@ include Makefile
>>> # ---------------------------------------------------------------------=
------
>>>=20
>>> quiet_cmd_ld =3D LD      $@
>>> -cmd_ld =3D $(LD) $(XEN_LDFLAGS) -r -o $@ $(real-prereqs)
>>> +cmd_ld =3D $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out %.a,$(real-prere=
qs)) \
>>> +               --start-group $(filter %.a,$(real-prereqs)) --end-group
>>=20
>> This might be a good idea to add a comment to explain why the start/end-=
group
>> is needed so that someone does not change this back in the future.
>=20
> Since we're trying to inherit Linux'es build system, I did look
> there and iirc there was no comment, so I didn't see a basis for
> us to have one.
>=20
>> Something like: put libraries between start/end group to have unused sym=
bols removed.
>=20
> Now that's not the reason - why you describe is the default
> behavior for archives, and there is something like a "whole
> archive" option iirc to change to a mode where all objects
> get pulled out. Instead this is a symbol resolution thing
> aiui - by default earlier archives can't resolve undefined
> symbols first referenced by objects pulled out of later
> archives.

ah yes i remember seeing that.
Maybe just add your last sentence in the commit message.

Cheers
Bertrand

>=20
> Jan


