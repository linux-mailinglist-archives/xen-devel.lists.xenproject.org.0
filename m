Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6557717C8
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 03:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577752.904754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSozr-000136-60; Mon, 07 Aug 2023 01:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577752.904754; Mon, 07 Aug 2023 01:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSozr-00010r-2A; Mon, 07 Aug 2023 01:25:23 +0000
Received: by outflank-mailman (input) for mailman id 577752;
 Mon, 07 Aug 2023 01:25:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BJNd=DY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qSozo-00010l-R9
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 01:25:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43f85dae-34c1-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 03:25:17 +0200 (CEST)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9250.eurprd08.prod.outlook.com (2603:10a6:10:419::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 01:24:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 01:24:46 +0000
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
X-Inumbo-ID: 43f85dae-34c1-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKvyOC58XQDs0LTpWiivs7BI1mHoW6Y8mt8Mm4KVTHrYh7tQabMk2aUyrND2A3LkAyxcOtoF2kyBy5+epbsq54Z5fuS6V2m0fQ3yxtlJ+OPRSXYJiSaBEiTz8Hr6C3cd3TsxAxf21m9obRTjPwLGgIPTUz5znQErSJwlQW5tuTHs3Qm3HR8UM5yquDKj+8UIjZwhJe8c/Ke42todkDWRncVxnNbx6+EUFbKB2GbQgTAxuVLWAyFCa9bKjrzh078hplH/eBqh9nI9b2xM9I91tGokvDQwhBVuvVxDJpJi2GPG/Cd46tubNusgvDXLb44DrbborcifgGQcFxI9zR6aXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGr4/CenZPJh4RmpNvj50HIldEWy/K/CGryRf+NrvgA=;
 b=WbLKefqSO/Oe1S1OCs0cbONs6j0ZOLGCk2F42ELWk85WuaVNuDGIZY6MUlVdhCJjUhT0zkuXZz0qnHOZ9j8vcBljCfYFHPlPwvTTpdqCcaWjp0f0mT9OiVbm/W++8g61gBLr7leOpY5ebkduSRrbYz/ZH8g/0GnEvF+A//UAvJXoo9TR6cX24RVdsuc5Pg/MokUMprK62FjD22XdZeAyEfH+IDLNRbg+fzJPiMmA29CZaAqP8mpjzlLTIKrzlqZA/2PQVv7+kabAJiByhe36PYjUXMSU//nqwmPpTfC5Q70PVXtBwM84HHEPcdYf8Ts7HWUmEnNwbzWqJqVoBgYEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGr4/CenZPJh4RmpNvj50HIldEWy/K/CGryRf+NrvgA=;
 b=JNH9hSPNDUdqLdms+eJEvwsZeIZ5uB02y+aeryLwDNd9kYeNHeOCmAHiHj7E/hNvGVocDn7ffD/dHf5oSmNVF4JaZ+995gWX+VyN/iCvEP6B8f+GHaLNBkdmHMBL+uNQQdr4UNysahrVri8sL2ZBU11bbg6SYYhBJBGPHMEf7z4=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "community.manager@xenproject.org" <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Xen 4.18 release: Reminder about last posting date
Thread-Topic: Xen 4.18 release: Reminder about last posting date
Thread-Index: AdnGpQJJnpHQXjHHQ2KSH/TFd+8Fbg==
Date: Mon, 7 Aug 2023 01:24:46 +0000
Message-ID:
 <AS8PR08MB79911746BC3D82A6341EDA6F920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6C11B5EC6797274CB7A445AD076849D7.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|DU0PR08MB9250:EE_
x-ms-office365-filtering-correlation-id: 1c24dc4f-d6b2-4d82-5259-08db96e515f3
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 otxbBgooWT6mOHQ/3/4z19kGv3nPb5a+pi3sWpZOyo14OFIRJtqbjjdy6uFXfUgYamZO99SroZCU2PmB02jI8vAwBTJhArzuhmR8+FOZuhBY3iTHMTcuPu/uGS0Gun5KQzU0cVtOwHgYWoJgPFr6ysZL0bY9O4WdIhXUJMecdJo0ik6E+0fW3ZLnQO4hmQM4SIkQYlyaiLYcSdkznxfm+ktAyJ9TZi9bsnLYg98/KL/n04Y83vKet7hWHX8UxhuX9kG3f5YbISytQUsRvQu86ZdvNAAF9dk6vQfk2H4KwQS5Ixn3J8RPcRHvrJHUG6lMOUoPR31kQTSnluH2Mm3Q6TMIbPYPJyfrhmMphLlbum9lW9r0LsjXntBryVDVBvhAOZNk0fBwL+AmIvBSbH562tY5v/7YBt47PGo6XeFRTCVCANaN64XTXeYnPBBcJH+eXCBv5ndffQ2a5Zm2Q6IQwoLMbd8E2Tm9aqPEdJ8JBb5gPx3HD6kgEVfD0COzPmRL2fffsuqvPGVuMekNeyxskv0292rbJuMpjlcTLSg++m/eYcIPU8xM2o6yGhRoIvQKPwWo4PBWl+rKxodq4zwe8GGAW/7zq4Ne7YzqpIHThrT/UlLO3FMtuycONUI9N3AMjwWhS7etfqF5Au5fdrK4xw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(186006)(1800799003)(451199021)(83380400001)(55016003)(54906003)(2906002)(6916009)(4326008)(5660300002)(8936002)(316002)(4744005)(38070700005)(52536014)(8676002)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(38100700002)(86362001)(966005)(33656002)(478600001)(122000001)(71200400001)(9686003)(7696005)(41300700001)(6506007)(45080400002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Vo6p5DnxMo60luVG+jm7r0x2h9/kStUhMJAP/fUJhTqhUBM0TQz6Sm6cvG?=
 =?iso-8859-1?Q?Tlq5FuJ8Z7PWc7u1Qeq+UTWoFbgi9IYxDT98Axq6aJLzd1BgrrdFYRdYPU?=
 =?iso-8859-1?Q?Zex8o00nJUm3wOQ4hvqL66gS2OeOt27vSRtv/iisTrxvdxLQaFc3J+TEn0?=
 =?iso-8859-1?Q?044ETo+NIPjXf6akrm8dcmTxUUiPgObdOO97L4y97nFSX/pJplPo3a5c6i?=
 =?iso-8859-1?Q?UnVV7vwY4Z0R9EROA+RbxnIUTLXoxn5PpP+aelcwDMnjLlwv4Gbyj5BqxY?=
 =?iso-8859-1?Q?ag2uRcX2vuvJuHbuUbHy7ixqaE/gdQe2q4QHCegJuS/0kpJjMwnxrJOb5x?=
 =?iso-8859-1?Q?JbwgW5Wa2k202VCf78TznAv4MIN2cL7T37iUKbBJjmVo6mxNKxOP8C8RAz?=
 =?iso-8859-1?Q?uj5PX4mOCNyPFyFxuyin//HxL8lQUoO4YZoObAc+NArak46r5JB6GdHFts?=
 =?iso-8859-1?Q?4WRTe0GqvbsJDsawsUE9vwINojr51xCdBRdEWOOQoy05G36apFwQv51Hao?=
 =?iso-8859-1?Q?kLPWor6AmdUIeCsGNWysgyD3iyjVYoiEcPhBHRQk8Xm+1mN9OlrhEOT/9S?=
 =?iso-8859-1?Q?S5CR8ieD30ZLBNhFMJtTPtXj86uTbCJzWBbUAAdPd0O9UsW6pbVHj8JGZG?=
 =?iso-8859-1?Q?k1KZR3sYDTlCVv9ndAAfLxKAGZqlsvLlyBHbYickMPeydbKuTLRqhza88r?=
 =?iso-8859-1?Q?/UdZY15OKGN0wIK/fkrDkdd8uM8mW3W324iU5gGcsCnuT2zG8UUNea6pw5?=
 =?iso-8859-1?Q?Z4w8qynu5pVl3GWLooKX29wMt3xefiwnJc6qnTkvSHlCNe/wqoLb8JRDuu?=
 =?iso-8859-1?Q?yqYL9NOiNW5U44heVrFQ3XsBO3pg3seUvRT/66f1AK9O42n0Mep5mXcdn7?=
 =?iso-8859-1?Q?p6bYhd8as7okrIA3SowdWYF40eh8BTTLJONeqRX6H55BUgtyR66Of4CeoE?=
 =?iso-8859-1?Q?5rg2kSbC8JFuSucVhJkBvUyxeX0N+8nQQ9zH3+VsGn1umfcgLCzd/6tydW?=
 =?iso-8859-1?Q?1b0N9nZ3TYaiDMkOXHrEQxhfaVroMX9naZZxgpTYXCsQ/Y2+bQttAwK4s8?=
 =?iso-8859-1?Q?LAA00Ul0hyxp9GgBtRKcOYaM3MyGFPBNJCMNeqlBSPJwjEfVkTqs7kOgBJ?=
 =?iso-8859-1?Q?+sc+Qce5ktCbuFcHfUa4xtw0nok9R270wOi3NoSabq6sx+fWxYXldVRTI0?=
 =?iso-8859-1?Q?ESg+1oSIZQ947nyvg8REArJPPXtgP8EOJeAVc/hwqrNOHnqQVoedD0ituv?=
 =?iso-8859-1?Q?xgFrtlsdCGoz5JWRdyfXcol+6v2ywgWqXKolgWFFmMndnr20Vw21gC4znH?=
 =?iso-8859-1?Q?/52oW5bxdtRiYC6jpyUzhQb/mp1Y44LZ2G6zJBHCEy2OCk9f71jCw4gfD+?=
 =?iso-8859-1?Q?HOl3+qPGQfBMUTXgdyD11O+gr2RO2RDXme3wEsZ7jz06BLKSINvlehUeed?=
 =?iso-8859-1?Q?1R7zzh38BRgA4n0x57FDX1HSEWrtcmsYhAy8Rl8JwwILfoqVORIWn2Mhr8?=
 =?iso-8859-1?Q?WfjAcyzvxGJhMru1G9oq0p7LDRbvnVZBuupS4mGkbXKgfZ7zkwwLqEIFYB?=
 =?iso-8859-1?Q?R3Nc2SG4P1/WFiJdlZkUyPLx5938H92pvecuJfEKybd5PbOcZ441J+gK51?=
 =?iso-8859-1?Q?lkC97t5YDlS4XAXOij/MLwWOir1M9SAxLI?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c24dc4f-d6b2-4d82-5259-08db96e515f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 01:24:46.2581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M4Hzt027otQ+MG/yVBVr66jsIsF1lMOi9cPeFXcz8vqRen3QBtpa0GKr8Lva0/aRlLMA2CiHOwkCGaMJldRrGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9250

Hi everyone,

Following the release schedule discussion in in April, I am sending this em=
ail
to remind that according to the release schedule [1], August 11 (this Frida=
y)
will be the last posting date, when patches adding new features are expecte=
d
to be posted to the mailing list by this date.

Also, note that we currently have 1 release blocker [2] which might need
some attention.

[1] https://lore.kernel.org/xen-devel/AS8PR08MB79919F9CE0B2BF80E7103FB59260=
9@AS8PR08MB7991.eurprd08.prod.outlook.com/
[2] https://gitlab.com/xen-project/xen/-/issues/114

Kind regards,
Henry

