Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF6A7604AA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 03:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569314.889723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO6pP-0005W3-Mz; Tue, 25 Jul 2023 01:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569314.889723; Tue, 25 Jul 2023 01:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO6pP-0005TU-Jh; Tue, 25 Jul 2023 01:27:07 +0000
Received: by outflank-mailman (input) for mailman id 569314;
 Tue, 25 Jul 2023 01:27:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pBYh=DL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qO6pO-0005T5-N3
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 01:27:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c61f2ec-2a8a-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 03:27:04 +0200 (CEST)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBAPR08MB5686.eurprd08.prod.outlook.com (2603:10a6:10:1a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 01:26:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 01:26:34 +0000
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
X-Inumbo-ID: 5c61f2ec-2a8a-11ee-b23c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrDipqVjMu0wp29bb5LwNtZkGlX0/7U+kPl41Dk/HWVgx9bgiaMqsrGeEGqapxzS7wd230YolTSQwl9/PKBgEJYYPMvwh+EX177kYCyPM+Pr7xe+VFXiBKITI3E6XAN9if+0KWzoiBAYD95cbpg9zCPcAFxJvOg9uS0EWxtYdy8lcZptoWNItkBmEF/9NWPTfvzc6D1YWC5nAqY9/qqdTkw5cZfWXjkz3y+J5jFtlY2+/nlk+vslZKy5nRdh8dI0b84i859rC6n4uDdZrOpNFSioSD0n4LdtYBojtgWDldGISiZ6mwn4Jr+Y/JO7gAGujJnidQX2HhCiv2cMyAPhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aP1OG4ctH9AeuM3fwW0JA76HBgCouhtT64QRlakYqo=;
 b=ROIu1no5mxWD1bwr3AoheERshH2gc/ZhpiIgSi/bI3qbDuz6Q/XOzUIicxCfVfF3aIAsXS/GcyqYb+awhzGpNszx7NjXW9TGCHvqDCsO1IoE4gzXEm9dDblk6H9N+aQLn9FexeENP1xVy3DYd16iarHWC+c5b6QwuCEVQpi8K4zYhK7T5cqsEKPPTOqO3QzniWrueM0ZqoZdSF8Y8flyuT8TXFNrT73mUsU+2F8hg5rHG8JbTxxCkKP7CQ/g47M2lZEx6PMiziFekSG4NmRdrbyCwsPkUfCuChp5qEqVa1DBxLtwSwdo682eyEJY/+HZHXuUwgzetTALklg+McmELw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aP1OG4ctH9AeuM3fwW0JA76HBgCouhtT64QRlakYqo=;
 b=kIXDDZ0iLBGjkGlNlxgupbGR8Qqhtz9eOrBRzr/f7ij+ne0/iyJeU+6OTOKHqWpr2BufEz2cRB97NGSC+6GOIsCuD/c4npTHgW6HaMeaQJV8UbOL4oDxouFzmwDn6nChaMHJTrYOirPk0Hype/4ZLaucKSqKw4F3gvz3Ozc2xjM=
From: Henry Wang <Henry.Wang@arm.com>
To: Federico Serafini <federico.serafini@bugseng.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "consulting@bugseng.com" <consulting@bugseng.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: RE: [XEN PATCH v2] device_tree: address violations of MISRA C:2012
 Rules 8.2 and 8.3
Thread-Topic: [XEN PATCH v2] device_tree: address violations of MISRA C:2012
 Rules 8.2 and 8.3
Thread-Index: AQHZvgqIKEgaqsoxpkKjuK/J/mFe36/Jsdfg
Date: Tue, 25 Jul 2023 01:26:33 +0000
Message-ID:
 <AS8PR08MB79919B7BE07C1594BE8012689203A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <502a92e9b53960a6b78fabb48d354cbb5bc1750c.1690187572.git.federico.serafini@bugseng.com>
In-Reply-To:
 <502a92e9b53960a6b78fabb48d354cbb5bc1750c.1690187572.git.federico.serafini@bugseng.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B4254949AD2AF1469FC87F1E64718D2E.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|DBAPR08MB5686:EE_
x-ms-office365-filtering-correlation-id: d84ea2cb-51d8-4313-5e28-08db8cae2e4e
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zBKCR3QUeGk7pDTMod1CxvDlmOAwioHliwoNzxPY0163D60Mm1iPnOusNVsm7V5ZMQAYPdRrXI4qt+peDG1BpeHseJUKp9GsotJJkfLdX3gva7zuO/PhCmDL3L5khij61A0zn5Uy2haqWWSzTTyctAULpLcF2jH1Jf2kJfVGA7BFR5j1KDmsAPS3SAAgNy1/JppyWVuu/7r3iHda1Ev9dc/c4hnI7Ks9UBLogfA52Dv1GYqEens/NOzkxhyvaBTpoHv+r6yPwE4KlIXjvX4bxndepBKylIxyHgl/Qpa0VExe9VRZcnT5lq5AYibyxIJBDq5D2wjCEnHmUyDJgZPsnjLRG4//Ctt9NDboGQjyYknQbRYhRuAcJyWUYYjtQ7Ng7pJjZ99ADVcDIJJGrYwkidLV60qtch/pBIC9CpM0l7nx3GdiJJkZDtAmudCW44H2NjdHOFd9eC39tjSvEZIv8p7DTeLJyZVdynOyJjWEKbQeO2yusfN78SD6thF1FFAbKAuEq2WvjKfOtEMuzS4O77NDFGmIJZ+ZvkpdLApHBD2kfnk0ZOj6vJtgs9vW2m/tYl3LX6hInbADh4it7ADVv9V7ih5TdvQokULdhpRq6lpxpdujgdc24DjOzrXUC2zt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199021)(86362001)(38070700005)(478600001)(66556008)(64756008)(66946007)(66476007)(66446008)(4326008)(2906002)(55016003)(7696005)(41300700001)(9686003)(316002)(76116006)(8936002)(8676002)(26005)(6506007)(71200400001)(110136005)(54906003)(5660300002)(186003)(53546011)(33656002)(52536014)(38100700002)(122000001)(83380400001)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?r+XZVWeBXgRYPvCohN8JjxsPhnyjixrSXpdvTsM2g+PAIw72lqL6+QRSalRp?=
 =?us-ascii?Q?QpgDVtPahN3Irs4Q+OeM5bf63OIl0r5fSCFj5ckY5mnqV0H6RwJ7YMnvGs0B?=
 =?us-ascii?Q?MkcTUUtMLbKKn0LPoH4eW11v7e6B3imhvFEDcAiW8XbpljfDCyE0GnjMg6WP?=
 =?us-ascii?Q?FxyS6E1id+p+90+tEp51KS7O12N+sYPwg+PP2wUP3G/8cHGhbNAQScPQiylV?=
 =?us-ascii?Q?UF0nvVhP595MC4IGyDwfxkYKXcqQn+bdCPaRfkzXEpmLAKqLNdk04kF+XMx5?=
 =?us-ascii?Q?fUr/XPhQFGmgBa35m8VYK20Py7eyKS85shB1atDpbk/xbLY7zTdq2nCP1fNF?=
 =?us-ascii?Q?X7QrLrlNOlzllrC2qpdYhz+utYoKZa1QaBUVSJoQw7LQed3oXhudqJZJ8b8g?=
 =?us-ascii?Q?SJqDkEZMmsVYOYjWa/MRsgfIaUToCDN8hu5cQdiBTX/iKmnXI8lBXAB2Xqel?=
 =?us-ascii?Q?WNpXuSnhOtxFBb5C/WIoraZnbyyD5cnJUev723K5YKZsdJLPlpFHFyyDfrjP?=
 =?us-ascii?Q?0/6s0mcsOQ5DJ8e0mZHu4QE8ZD5c3YV6wlR0Uu91/8w8NoKcSPR73KFz/PqT?=
 =?us-ascii?Q?YpS8BHG9F9coNmUiTJewtRsXVDr6VhL3Vbc0IrRClQ9ibJmDoFG1dyGWjkS2?=
 =?us-ascii?Q?rtlyfm9YE5fDoAUhh8pOXeijNbrqvXa3g/3iSfXOcmZvIw2vomYjv92lh9cU?=
 =?us-ascii?Q?nrl9s6tqmQN91jXHC3Ha8dhtdBkaBg51bt3gr2+2FA59UG4Uicfhp+k3pWvG?=
 =?us-ascii?Q?B2ffHgO8vv9ZK7r4AmslQ59VN3+uDqyaH1mQBPR0e8Z2WvN2ar+ujZMAezMy?=
 =?us-ascii?Q?hcy3BxrGwg+JUkiJiYDRGnp7WDjjioYwOWkNL+dYW+wBdK5jlIcK3fZhJlTI?=
 =?us-ascii?Q?PEuoAbeqPw1UWeJRPd5mfNWk/T1DDs5V1VJLy4mosK/Cpb1urec0VY0Sgnfo?=
 =?us-ascii?Q?cRgtbDs6aYIe+3Iicmdwn+BwEXGTmBRIihjV7SIwpu6bakhmFHY9lRGruoFF?=
 =?us-ascii?Q?o0zeYUJ9p+qENpcdWQyUpJMcQKtORjX2ijeSqIe78nGF7er1iy3D+kVzbqJt?=
 =?us-ascii?Q?Oslab4gqZHD874mx3SBf+FZW2ZmGt+zpZnEiaTAhvPtSdQVNDVGMxr2acnPq?=
 =?us-ascii?Q?5pWHDjZtZrjUMYnBg8cehxY0DLm2p6yLF5OIIf1mp65QDt0huLr/s7oz2B6E?=
 =?us-ascii?Q?T8+a0QknewdtmZpieSnWIpayvDLk6sx31oNNuB2byJTBR9ONDAiqj0MgXHBb?=
 =?us-ascii?Q?3eOYAwnBADg00vOsUEwjqu8rSYrnhgT3Oy38vQ5pvzIw7F1rBVUD5+b5kMWH?=
 =?us-ascii?Q?7XU7+ZfxyyZW1Gn6eAtvmojKuzHk6JjBeDRzJ5MqvSeMyahmfCTPBF0Qvyfw?=
 =?us-ascii?Q?Zw69SL4ccad9w06FBLs29VexsJ16JFBTNr10RZepvNzEmdvAFkcewmQe88kl?=
 =?us-ascii?Q?3gZIS6g7TPc/LCX/C+kyV6pYmJQkxNxjV8sNpuIBa7+EQPJx36AZY+B4tEig?=
 =?us-ascii?Q?YI4IcFD4bBDLtsHvBsxTm/Pu/esdLCN4HWGWAHVK8/azG078WQhWNY5+jSax?=
 =?us-ascii?Q?0vmJNR9xx5os7vVDZo+G83qxotWZKW/ASIEg6wXM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84ea2cb-51d8-4313-5e28-08db8cae2e4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 01:26:33.1650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a/Ecgl3D1k2oNiXMcfmFbMzFww/qj1XS+aWAdcGCR1yIqxz5AxExEKgAzT5X8FPIEPwKuFBeGy3sRujqv1AUww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5686

Hi Federico,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Federico Serafini
> Sent: Monday, July 24, 2023 4:40 PM
> To: xen-devel@lists.xenproject.org
> Cc: consulting@bugseng.com; Federico Serafini
> <federico.serafini@bugseng.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>
> Subject: [XEN PATCH v2] device_tree: address violations of MISRA C:2012
> Rules 8.2 and 8.3
>=20
> Give a name to unnamed parameters thus addressing violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between parameter names and types used in function
> declarations and the ones used in the corresponding function
> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
> ("All declarations of an object or function shall use the same names
> and type qualifiers").
>=20
> No functional changes.
>=20
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

