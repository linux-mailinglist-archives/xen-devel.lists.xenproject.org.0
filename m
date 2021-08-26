Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A893F8321
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172761.315257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9pl-0005BR-RQ; Thu, 26 Aug 2021 07:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172761.315257; Thu, 26 Aug 2021 07:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9pl-00058H-My; Thu, 26 Aug 2021 07:29:57 +0000
Received: by outflank-mailman (input) for mailman id 172761;
 Thu, 26 Aug 2021 07:29:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+8W=NR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJ9pk-00058B-RD
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:29:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00f8138d-6d90-4c40-b1ca-84c7750e2a73;
 Thu, 26 Aug 2021 07:29:55 +0000 (UTC)
Received: from AM6PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:20b:2e::37)
 by VI1PR08MB3517.eurprd08.prod.outlook.com (2603:10a6:803:79::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 07:29:52 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::8a) by AM6PR05CA0024.outlook.office365.com
 (2603:10a6:20b:2e::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Thu, 26 Aug 2021 07:29:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 07:29:52 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Thu, 26 Aug 2021 07:29:51 +0000
Received: from 635f5e754d18.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B0C495BB-DEF2-4683-B1AD-410B1DF002B1.1; 
 Thu, 26 Aug 2021 07:29:40 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 635f5e754d18.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Aug 2021 07:29:40 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB5337.eurprd08.prod.outlook.com (2603:10a6:10:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 07:29:40 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 07:29:40 +0000
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
X-Inumbo-ID: 00f8138d-6d90-4c40-b1ca-84c7750e2a73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/A3hVEHtFwQcB7iS+bmmWiyaOpWv0UYXekFXShlfyI=;
 b=6FwKjfnOdwP8v3mhzRbI3D33Brdn5tTn4Fr4SUH9Qp9KaP2JX7m7GU3MP0XiSR6x3sN4I8MLGODfeX5PeysxLRLm+zOgP7rakjXNleuBSYofVVcC10oL8eQnvEnCBA6w2Lhd6GgDhUGKnQnjb4PTOWlwSq+5l6K/w5fyNsYRKGU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjhTrtLgs9gdSIdc5+TaucgOMsuU73vnflzemFQ2e34shTiW73T+gBgWdtULloGFbRoc5mGqCHtZmRw4vDfPYIQYa+hqph+W/uaWCygGwUXZSBa+4mAJQF2AJgV1QYRxf7VEgojYxbC4RJmP2UWqgxLrdvwH0Wu4bnSbSvTcGZqxFuQBn6h9vUfyfWG/u93jZq03j883Hn3S6/8Fxnj4vobn6og9uL3Bx4Abdco81xBcxH/wgLJOO7K5L5ed8N85vuy+LDSsJhv4n9ZqKZ9YPJHtpqvDYLPUj6L0jmuG19x7Yj1oiyzLdU/oNZfhdALsiX/gVhZ+KxdPZrp7icYo2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/A3hVEHtFwQcB7iS+bmmWiyaOpWv0UYXekFXShlfyI=;
 b=lSozpnTvTLT+vwOKWNDU1U91MDCJZQugZOZ6VcpqU1sMPwCIsYlRY+FIcMonQtPjA7liJ+A6aR2UXfQbqwXJHDdTE6K3bckOygsBly3l4FyjPAo7hlfg9/ypK0IHS8b+BewrWlT3dueD6Y7h7RWrbOr1tcc1X5fbucgxqIGUqJeXHP8GmHn8WzsglFvHde84BvH3DMAp9w9HuQgtY2vpOX/p11/c262bVuACG3EjYMJYQ3tdb77axPwewszgyvWGIkyD+MIf/1qv+Iba2COShRHWKey7DK62zyj0/+sabCoUO6AJl8/iqwhfSa0pVC08HyB0istxsGXby0rMN+Ryvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/A3hVEHtFwQcB7iS+bmmWiyaOpWv0UYXekFXShlfyI=;
 b=6FwKjfnOdwP8v3mhzRbI3D33Brdn5tTn4Fr4SUH9Qp9KaP2JX7m7GU3MP0XiSR6x3sN4I8MLGODfeX5PeysxLRLm+zOgP7rakjXNleuBSYofVVcC10oL8eQnvEnCBA6w2Lhd6GgDhUGKnQnjb4PTOWlwSq+5l6K/w5fyNsYRKGU=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 30/40] xen: move NUMA memory and CPU parsed
 nodemasks to common
Thread-Topic: [XEN RFC PATCH 30/40] xen: move NUMA memory and CPU parsed
 nodemasks to common
Thread-Index: AQHXjptYt52pxy+mUUyQXgnpFPCLD6uEjLEAgADt1dA=
Date: Thu, 26 Aug 2021 07:29:39 +0000
Message-ID:
 <DB9PR08MB6857148B77BC55ECDDABDFA39EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-31-wei.chen@arm.com>
 <e97b705f-3bf6-9a01-a24b-ad2840a7c8a8@xen.org>
In-Reply-To: <e97b705f-3bf6-9a01-a24b-ad2840a7c8a8@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 02BE0D46F79530459722B205A1BD4F0A.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4f99a72c-d862-44e2-b916-08d968634b33
x-ms-traffictypediagnostic: DB8PR08MB5337:|VI1PR08MB3517:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB351731FADC57CC5DC00FC3519EC79@VI1PR08MB3517.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2582;OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mmy+jfoi3Uo5yw9tXDs2iSyCQkSpqDkHbYcG17Pf+ozrhMM80U80gMDwNQipr6E39HxebAcOUb8AEyp29O5jQlXQ0UhyQTCzJ1LzQ/d8x4ViFmE4HoUxIv/fzymOoIv0ek6QftWgi6vnxzqU8aJLuQ2cr8I1uCH2W040ACyuSMTL3I7sEq/ernFIMCSAMltjaqyrDTA9OEECNYFDeTbV+ik9/pGUGpIgweRUUNdItP0mcGPWvRZ3rpulyIkB2OTuqcoQUEVnaBxPuZhczTjj/eKkLF5Bs6KAggkeLNHuxw+7UVq9d0AIAfXsNnZeT1u0EkQKlrzWpfTwFC37UT/vZHz5B789WY8qKowvsg62sYo3gArWjCN0NnP3xMbua72sYeESuzqqcf3/t7ymVGl5gvTEMBC8w8phsGcfDRYFxCAp7Me0FcbDgbd6PpcjM6iIDoaeyqTW7jxypMzGRJF9lnuS17urFdD3pfDa3TyEmYibMAy+Ip2ZbbXnvlcbYor04fnrskBmWD08+6qYjL/VpRbABl8Dkv5N6k5ydLVo+hluWekbqyzui5Ntd4s4L1x01KYAzG/2p279nmGB1r47sKkGuGFRdzm2eDxnTkhtVsWymE+SN+/cPyoNqUVK/+az8iZxwNG/6QZM9I6w3KL3XCNYl7BiCQzhRfh71S2hVAVUfErQ/jLt4w3oVnKyPJEljR/NHcUMcuCFY+EM19rsVA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(66556008)(33656002)(5660300002)(9686003)(83380400001)(122000001)(66946007)(110136005)(38100700002)(26005)(8676002)(66446008)(71200400001)(316002)(2906002)(4326008)(66476007)(7696005)(478600001)(8936002)(76116006)(6506007)(53546011)(86362001)(64756008)(55016002)(38070700005)(186003)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEFsbzR4VnRjV1poOE8yd21IZXdML0dSVG45Z2xDL1prODZNWDVqYS9TbzdO?=
 =?utf-8?B?TmhHbmVBenpZSzAyeDlwajFoUUNQdzFEaEdPaEc5d2V3NjhJOWxqRERyZzBL?=
 =?utf-8?B?YTBKUG8vQlRLcHRiVzFGbDUzKzhibTBubkk1akNhazNMSTNkbVZZdG5vSkxu?=
 =?utf-8?B?SndjVzdOTUZGSWhlbXFMRVVLUERnV1lTN1FSUU50K0h1OEVQQUkzS2JTWVdK?=
 =?utf-8?B?em9ydjdZbVpHaitUb0NvNFFrbWw3TGV0UGJNTDdSR2wvWGZJVTAxOGo1WXdG?=
 =?utf-8?B?eUJMSGk1Z2U2YjVxbzc0Q2ltckhBNDFQV3RSTmpCa1hiL2xlRVJmZzJPZFdr?=
 =?utf-8?B?dEF3dGs1NVdwYnppYXRORytTNG5STUhRV3ZkTWpiUkhqOEk5M05Pa3ltRG9S?=
 =?utf-8?B?UDM1THJoWTcvckh4MmNQQU1ucW05ZFRzR1hGSVA0YlprWHFtSmF5NmgyZXFC?=
 =?utf-8?B?NDBrMjVBakk2TVFiN3l3Q0d5NXQ2c1BuS0ZHQytNZGlrdHc0L1JjSTNtb01v?=
 =?utf-8?B?eDVLaTVvajU2aWRsRkl0U2pvMVlmSFVkUnUyM2tSSFJzNTZHZitVRDU0YWJN?=
 =?utf-8?B?cXRsWmkwUEhNSFdlQWJZVFZlcVI4WGlBUTNFdW8vcE1mOURnUm1pejB0RnVZ?=
 =?utf-8?B?bWJQcllZMzA5aCtWRVBWNDA5SkNBSjdRUEI4ZUNUL0VrQ3VnNlVMSGFIbkxK?=
 =?utf-8?B?SHljUWxYbTZDVzBCVmJZcVdLeEFvcTR0NlI0WHRoRjZhN1BIbnR3YU9ZQ3ZR?=
 =?utf-8?B?SFBBWTQ0QWhmRG1GL2xtZ1QxTTI0WHJJT1NTN0RFd1ZsaHNlY1JranFZVGxT?=
 =?utf-8?B?eTAyUUhkMjdKWE4waExzeDBDY1lBOGl4ci9rdzd4Z3hROHlXQkgzWEpDbkZP?=
 =?utf-8?B?TDU4b1VHeHRVcklHREl6V1M4ekNlbjhYRlAveTNrVDhEQ3FnRVF1ajRNYWNW?=
 =?utf-8?B?Z0o4YVAzSDJvem1NeVBVRXhrK01Uc2RmU2IwdTRjRURlbVZlU2QrQUhhTGNK?=
 =?utf-8?B?eGt1RGlmV2V6QldKVk41QkdNUEZpa0VTQ3RTN2M3c3JZNmpnWXl0K1dpZGZF?=
 =?utf-8?B?RmhqWSt3dTM4RTZkR1Vkc09sMFBpNjJMY21HWkQ5cHphSjVIbjhoUXpYVUtL?=
 =?utf-8?B?QUZHSDZxUkZnZHorSXJEQ0laRlYyZ0t3M0xjbVQraTFUOUVqRVBpY0dWSVJi?=
 =?utf-8?B?dERJS2N0TXRaQzlBaDl1ODFOVkwyNGxnNU9mampNZDJpdXd2OUtqb2VtQkp3?=
 =?utf-8?B?RmRBMzB0S0s1V1V5T1ZZMTFib3Qwa2xrSVRaL1V4ZXRyUDBzcCtDT2hWUks0?=
 =?utf-8?B?VUFxU0ZlMWx5RlVoU0NDbS92MFh6UytaVGdMOTIrem4xVUNKTmV2bVl3OUha?=
 =?utf-8?B?b3VTb1NOSk40VTNjcUgwTU03WkJxcWNURzdETnEwejUyRWtXOXhDUnVMSEYz?=
 =?utf-8?B?aFZYRUJUdkdiUnprdlljT2k4MnVEZjk2Z0hXKzhSZnZtdXVRUmtkdmY2M1Fn?=
 =?utf-8?B?RVlXQ2lKU0hVMFhDQkpqaDNVTDgzNkprSlBHUXVFY3pTN1JMMzhreWtkU1RG?=
 =?utf-8?B?WkRobmtPTkR2eVJTZGtGaGMyMDNJU3VMQmw2SlBvckw5eGI0WUJ0d1N5QjBE?=
 =?utf-8?B?d216bWdvOUZoUmR3aFo3d1NicVhLd09GMHJOOGM2WjQzeVRWMjl3NlF0czlG?=
 =?utf-8?B?MnFkWWc3cndJTzNJWlFicUFCais5bDZCRjdDQWUxMVYvMTQxVWxpQ3hCK2lm?=
 =?utf-8?Q?daSjH11JIfiaLjmFVVdM+E6nYJxdU0RjQ81l+vD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5337
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f8c539c6-6bde-43e9-b1eb-08d96863440a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ry4gme/eRiY3K54a37DPEMzlDHZvQgdxOmBfANe4VrnndKKYYNtITIBKCUBasgD6jXWLpNwNkUR0oH7KSDwTrckPVqcx0OIL91i+YFOmlS0Q+RAeMDTScxijLqNvnLp3xnf+cBQZHDkEwcmXSVCH46IWj+7eFrA35FIpMtI3ysatg4tTuIU0fKnEbvXmsULfuuFTX8cI5lpWPyny44hYa0wXafO15kk2kB164mrph4lDrO5WHI1AGeN3JCU2sJg/hVb8AlM1aMe2cRViFAZMRfR2JaMX9cyaqT5elE6tFsiupMcqZbP+c5ZR3P9z9udqSZ9Y4Jhu0XH2h25hKixRCipL8moICjxXmB5JGI7zZckUImwykxmJd4F8cW2AkayVcw/51tYq05sVwXPo4RWVaZOBXSaY7otEC7rWvYLwQz9TkEadwR6uqI1dmcB9MwofcB5ZrON1rwCOcmDOl2+fUOsZ1XFD/ONKtsjDTQ4inFXuigsW6HRAu4QBLNj8Hwmvno5pHpL6RErPdoavRwPxnm9lNjzgq67LXf+b+HWN6OuyI9bkMtm8pGwm9w3AS0xI3j6cawwCwSR2xBPeYfDYPm5m1bW4TUXKTtPZbRusj7r/5wIRfFH4VWlTcQi0q/FBpja3+3yit9KTC9ED1grAwMD4PRh6m3hGAskWPzV1sEYq3wtGWEK1xDBmBkJV8dkalkHL1bNdEwYsAsgrPbUpvA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(36840700001)(46966006)(478600001)(2906002)(82310400003)(70206006)(336012)(316002)(81166007)(33656002)(6506007)(70586007)(47076005)(186003)(82740400003)(8936002)(53546011)(4326008)(26005)(8676002)(86362001)(52536014)(9686003)(55016002)(110136005)(5660300002)(356005)(83380400001)(7696005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:29:52.1228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f99a72c-d862-44e2-b916-08d968634b33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3517

SGkgSnVpbGllbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBTZW50OiAyMDIx5bm0OOaciDI25pelIDE6MTcN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMzAvNDBdIHhlbjogbW92ZSBOVU1BIG1lbW9yeSBhbmQg
Q1BVIHBhcnNlZA0KPiBub2RlbWFza3MgdG8gY29tbW9uDQo+IA0KPiBIaSBXZWksDQo+IA0KPiBP
biAxMS8wOC8yMDIxIDExOjI0LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBCb3RoIG1lbW9yeV9ub2Rl
c19wYXJzZWQgYW5kIHByb2Nlc3Nvcl9ub2Rlc19wYXJzZWQgYXJlIHVzaW5nDQo+ID4gZm9yIEFy
bSBhbmQgeDg2IHRvIHJlY29yZCBwYXJkZWQgTlVNQSBtZW1vcnkgYW5kIENQVS4gU28gd2UNCj4g
PiBtb3ZlIHRoZW0gdG8gY29tbW9uLg0KPiANCj4gTG9va2luZyBhdCB0aGUgdXNhZ2UsIHRoZXkg
Ym90aCBjYWxsOg0KPiANCj4gbnVtYV9zZXQuLi4oLi4uLCBiaXRtYXApDQo+IA0KPiBTbyByYXRo
ZXIgdGhhbiBleHBvcnRpbmcgdGhlIHR3byBoZWxwZXJzLCBjb3VsZCB3ZSBzaW1wbHkgYWRkIGhl
bHBlcnMgdG8NCj4gYWJzdHJhY3QgaXQ/DQo+IA0KDQpJIHdpbGwgdHJ5IHRvIGZpeCBpdCBpbiBu
ZXh0IHZlcnNpb24uDQoNCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2Vp
LmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9udW1hX2RldmljZV90
cmVlLmMgfCAyIC0tDQo+ID4gICB4ZW4vYXJjaC94ODYvc3JhdC5jICAgICAgICAgICAgIHwgMyAt
LS0NCj4gPiAgIHhlbi9jb21tb24vbnVtYS5jICAgICAgICAgICAgICAgfCAzICsrKw0KPiA+ICAg
eGVuL2luY2x1ZGUveGVuL25vZGVtYXNrLmggICAgICB8IDIgKysNCj4gPiAgIDQgZmlsZXMgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4gYi94ZW4vYXJjaC9hcm0vbnVt
YV9kZXZpY2VfdHJlZS5jDQo+ID4gaW5kZXggMjdmZmI3MmY3Yi4uZjc0YjdmNjQyNyAxMDA2NDQN
Cj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4gKysrIGIveGVu
L2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+IEBAIC0yNSw4ICsyNSw2IEBADQo+ID4g
ICAjaW5jbHVkZSA8YXNtL3NldHVwLmg+DQo+ID4NCj4gPiAgIHM4IGRldmljZV90cmVlX251bWEg
PSAwOw0KPiA+IC1zdGF0aWMgbm9kZW1hc2tfdCBwcm9jZXNzb3Jfbm9kZXNfcGFyc2VkIF9faW5p
dGRhdGE7DQo+ID4gLXN0YXRpYyBub2RlbWFza190IG1lbW9yeV9ub2Rlc19wYXJzZWQgX19pbml0
ZGF0YTsNCj4gDQo+IFRoaXMgaXMgY29kZSB0aGF0IHdhcyBpbnRyb2R1Y2VkIGluIGEgcHJldmlv
dXMgcGF0Y2guIEluIGdlbmVyYWwsIGl0IGlzDQo+IGJldHRlciB0byBkbyB0aGUgcmV3b3JrIGZp
cnN0IGFuZCB0aGVuIGFkZCB0aGUgbmV3IGNvZGUuIFRoaXMgbWFrZXMNCj4gZWFzaWVyIHRvIGZv
bGxvdyBzZXJpZXMgYXMgdGhlIGNvZGUgYWRkZWQgaXMgbm90IGNoYW5nZWQuDQo+IA0KDQpZZXMs
IEkgd2lsbCBmaXggaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+ID4NCj4gPiAgIHN0YXRpYyBpbnQg
c3JhdF9kaXNhYmxlZCh2b2lkKQ0KPiA+ICAgew0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvc3JhdC5jIGIveGVuL2FyY2gveDg2L3NyYXQuYw0KPiA+IGluZGV4IDIyOTgzNTM4NDYuLmRk
M2FhMzA4NDMgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3NyYXQuYw0KPiA+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9zcmF0LmMNCj4gPiBAQCAtMjQsOSArMjQsNiBAQA0KPiA+DQo+ID4gICBz
dGF0aWMgc3RydWN0IGFjcGlfdGFibGVfc2xpdCAqX19yZWFkX21vc3RseSBhY3BpX3NsaXQ7DQo+
ID4NCj4gPiAtc3RhdGljIG5vZGVtYXNrX3QgbWVtb3J5X25vZGVzX3BhcnNlZCBfX2luaXRkYXRh
Ow0KPiA+IC1zdGF0aWMgbm9kZW1hc2tfdCBwcm9jZXNzb3Jfbm9kZXNfcGFyc2VkIF9faW5pdGRh
dGE7DQo+ID4gLQ0KPiA+ICAgc3RydWN0IHB4bTJub2RlIHsNCj4gPiAgIAl1bnNpZ25lZCBweG07
DQo+ID4gICAJbm9kZWlkX3Qgbm9kZTsNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9udW1h
LmMgYi94ZW4vY29tbW9uL251bWEuYw0KPiA+IGluZGV4IDI2YzAwMDZkMDQuLjc5YWIyNTA1NDMg
MTAwNjQ0DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9udW1hLmMNCj4gPiArKysgYi94ZW4vY29tbW9u
L251bWEuYw0KPiA+IEBAIC0zNSw2ICszNSw5IEBAIGludCBudW1fbm9kZV9tZW1ibGtzOw0KPiA+
ICAgc3RydWN0IG5vZGUgbm9kZV9tZW1ibGtfcmFuZ2VbTlJfTk9ERV9NRU1CTEtTXTsNCj4gPiAg
IG5vZGVpZF90IG1lbWJsa19ub2RlaWRbTlJfTk9ERV9NRU1CTEtTXTsNCj4gPg0KPiA+ICtub2Rl
bWFza190IG1lbW9yeV9ub2Rlc19wYXJzZWQgX19pbml0ZGF0YTsNCj4gPiArbm9kZW1hc2tfdCBw
cm9jZXNzb3Jfbm9kZXNfcGFyc2VkIF9faW5pdGRhdGE7DQo+ID4gKw0KPiA+ICAgYm9vbCBudW1h
X29mZjsNCj4gPg0KPiA+ICAgLyoNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL25v
ZGVtYXNrLmggYi94ZW4vaW5jbHVkZS94ZW4vbm9kZW1hc2suaA0KPiA+IGluZGV4IDFkZDZjNzQ1
OGUuLjI5Y2U1ZTI4ZTcgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL25vZGVtYXNr
LmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbm9kZW1hc2suaA0KPiA+IEBAIC0yNzYsNiAr
Mjc2LDggQEAgc3RhdGljIGlubGluZSBpbnQgX19jeWNsZV9ub2RlKGludCBuLCBjb25zdA0KPiBu
b2RlbWFza190ICptYXNrcCwgaW50IG5iaXRzKQ0KPiA+ICAgICovDQo+ID4NCj4gPiAgIGV4dGVy
biBub2RlbWFza190IG5vZGVfb25saW5lX21hcDsNCj4gPiArZXh0ZXJuIG5vZGVtYXNrX3QgbWVt
b3J5X25vZGVzX3BhcnNlZDsNCj4gPiArZXh0ZXJuIG5vZGVtYXNrX3QgcHJvY2Vzc29yX25vZGVz
X3BhcnNlZDsNCj4gPg0KPiA+ICAgI2lmIE1BWF9OVU1OT0RFUyA+IDENCj4gPiAgICNkZWZpbmUg
bnVtX29ubGluZV9ub2RlcygpCW5vZGVzX3dlaWdodChub2RlX29ubGluZV9tYXApDQo+ID4NCj4g
DQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

