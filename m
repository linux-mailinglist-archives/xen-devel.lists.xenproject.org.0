Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F82B29C26
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:27:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085592.1443904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvDF-0007RA-J6; Mon, 18 Aug 2025 08:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085592.1443904; Mon, 18 Aug 2025 08:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvDF-0007Pf-F8; Mon, 18 Aug 2025 08:27:29 +0000
Received: by outflank-mailman (input) for mailman id 1085592;
 Mon, 18 Aug 2025 08:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czvt=26=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1unvDD-0007PU-PG
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:27:27 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28fc0a9d-7c0d-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 10:27:21 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by VI2PR03MB10788.eurprd03.prod.outlook.com (2603:10a6:800:26e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 08:27:19 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 08:27:18 +0000
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
X-Inumbo-ID: 28fc0a9d-7c0d-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkikN05tqdAHzO60Eobc+UYhLy0l8s0NxiiE8yuMcLiEB5wXolKZBxxIOEteZU2NvxYBjAzg/2cMGlfSqFP+WsduthafLTVaewOH7Gv1namsu0BKb4lJGlZmuhhBKkjIiBSNxZlrNTwgod4cBPrl9TgEawUGV985l/dTJHUZyCM1eCrgO5JuKuGSh2jI4fnOWVAlQlnepG7K0CF+S6a6jRvK/CjVs8qfjEKie9Dw0vll6OfIW5X7ITP8jRiYqKSOIL5vJhF+OujQ+tsbeelUlwCMOtq2ez5yZmxrw5x4kq1ckm042Tb1VldEyjdZm92F96alBOZnJxVp3t4IVt8hqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFz7/BEUKOfEzbRamS65lN5hdMqOqA7ZLGJkCAiGD1M=;
 b=mZuT/rfQVSYFKcD+7+GmccbUv4AwF3Khov3iP+IqwcfN8ZULEJYgDHoMoyIehYJbx9Fvp85Ply6giWDZULhW5bpbOfVFbup5wcopDXA/XBMno/aKnCdA25Qhuh53bXoeiOsL0rcrZBSnEG5J/SwaNM4S3d0v5UyVlGTCVpVFLUkKzH5FLa8uzf9kLQ228K5I0SWxfBbc+GyzIeDXyw4qiHIyR+2XQV50WeVPH7h165hmQ0724HRIj/ckfF3xDlBd0Z87CoJaYb0LXTtyFV9emkDCqWQg8NYcdtQYr333zb3AalIHOXTTgKqIllVv8lPYns91xpwriMzwdLbjcrBwzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFz7/BEUKOfEzbRamS65lN5hdMqOqA7ZLGJkCAiGD1M=;
 b=VjWx6oUf+JVImYNSsa/uO/DEygCMiCzE4bHVplbFL95MreIbExjTz0C8Ms9/NtdBP0/4KbeNXCVVbh6KQnmidY25RTjt7ndph85oKHkeeb+BhpvC+MI9CYyMtjuu9vlVigjl64rSMwvfTUF1b5wWejYuS0Aw5NCqMrZevps/62sAT+3OX+Youu+Cka82rm1uYX68r31idhl4S3+1l/GL4XYYzpt3cV4R3cKcGhSUfLSsoAKLLVQvnMgvVMmZPQaQPgPlQCGBaYCTFQMMjajK0g0DzUCSGxl6UteFpUschvS0zvteeXbL1pvvcouu5H+BXx+pWct5XdMNKpZ8Sy7vgA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] docs/misra: fix sphinx-build issues
Thread-Topic: [PATCH v2] docs/misra: fix sphinx-build issues
Thread-Index: AQHcDe8as9q/ao3zhECV/xRhyhAMwbRoCj+AgAANtAA=
Date: Mon, 18 Aug 2025 08:27:18 +0000
Message-ID: <1a687b9a-ebf4-495c-8fc8-453547b62dac@epam.com>
References:
 <f31b8d62f16bd272114276f53db842101cd53e52.1755266805.git.dmytro_prokopchuk1@epam.com>
 <17ab13e4-1fba-4c43-ba32-be512e66621e@suse.com>
In-Reply-To: <17ab13e4-1fba-4c43-ba32-be512e66621e@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|VI2PR03MB10788:EE_
x-ms-office365-filtering-correlation-id: 9b1dc52c-ae90-4944-9a62-08ddde310bbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YndIWnhhSS9PRkFVeGRQRWVNWStVVEd2YWxaUnc0NHV2WCtta3ZOMHV5YWZa?=
 =?utf-8?B?K1hYVXRBTlNCcUtyUGk5c1VIdTd0MTBpejZSWS83WTl2N3ZZcTBWT1U3bU5x?=
 =?utf-8?B?dU9jeld2NUpQb2Evd2k0RGoxdnhtVEZzMzIxUm5VNjZJVFpnZ3I2akgxUUhn?=
 =?utf-8?B?OHJMb0JPN3RvV2tjcHRlQzkyWFRJL05EcUhnRjl5MUtNNmRRNjRsbHdKN1FV?=
 =?utf-8?B?NU5OUzVkRTVEci85RVJEbDhjajJYbC9zZml6SnEzR3NBTkJyU2s3NXQ3SGtV?=
 =?utf-8?B?Tlk3Nko2WFh6dy9pZG9DSDk2bGRTT01QQ1BqM0RqRXJFY09GaU1rZjJ4UmF2?=
 =?utf-8?B?QWNxZkFyTEJpKytNWDIzQkc5cXI5dFRWZjdvM0NmWEl4SmsyYyt5Nm90RU80?=
 =?utf-8?B?Rm5Nc0R1ajVLUVQvbkJBWi9rVkY5QTg0WnNuQmlaWGl3WEkrbFovb1o0djEr?=
 =?utf-8?B?Z1pKditUbzkvUTdzd0ZuTWg5QW1mZmltYTRyWitBUG8wS296Mi9vS29ibzlJ?=
 =?utf-8?B?U3dyS1VlditDRUlxc0hHbnlsaWphWGQ1VkZubGwxR1loR2g0TFlOS2hHMTFp?=
 =?utf-8?B?aDVqTW1jUFRTdEVYMy9HbmlIZi8vWGI2YmlzeGdqQktHa0RURWx6K0J0QlRR?=
 =?utf-8?B?TFhLY0I4Z2dWZ3ZTVWFVcVVpU285RXFES1FGQ1pvb2VkWjJOaFpNckF5b1FY?=
 =?utf-8?B?UnFzQlFwbUNlbGoveTlFUk5QRHEwcmtYcEdjejAvWWdoRHkxenltRnBlUElt?=
 =?utf-8?B?TkZod21NbkRaNG15NzdxNUZONFpGVkoyUlVXV1ZFYzAvcDc2OXYxeGF3SUEx?=
 =?utf-8?B?SEZtU0Q4aTBOS2xiVlpqd3J5dEhsT29HM2NSQUlGUVYrcCs5SXJSTTgxdUFR?=
 =?utf-8?B?MTl0QjdCb2RpYkJ0d1FQR0RSTndkcVJnNmo1bGx1VGRVVllWQUpDaVFKaVI1?=
 =?utf-8?B?NTRpc3dYem1TUFplWFJGcXUvWmthQVhBSDJrdVFsakE3djY5aFRsd3F3RXdj?=
 =?utf-8?B?eTkrdWtONTlWY0NlZmk5UEJ0cjNpRTFFWVZmdnR1cWJockszaDhUV0Q0M0hJ?=
 =?utf-8?B?dnhuTkdaSjlGaDlDcEtNNVNEcnJEU3Z2L2Uydm5FZ0lDdDV2ZkxFamFCTmEz?=
 =?utf-8?B?d2ZOcGlUTjBvVVY4ckhhaWt0SUtpb0hEdUNqUlFVaFQxTjFyeDRwc081Z2V5?=
 =?utf-8?B?UFlCYlNuMlhrS0E3MTFVOFBOc0RKY1lCTk1xTzBvTDZOTWxqOEhnVm5MZTlD?=
 =?utf-8?B?RVBMcm4vQXgrcnhPRzRRRzNNdFdYeS95YTA1amZjNWRIRDBDRTFNZ0xOdnZo?=
 =?utf-8?B?RlpteXBFeEpobVl6amFjMktQNGtreFo5ZUF2L2RiSUlGRFh1b3ErU1dTTW01?=
 =?utf-8?B?WS9tRHpwVGlkUzZ3STJNTXpQTlJSZFUxOWZrbFo4clFNUXp5eStlREk3MWNa?=
 =?utf-8?B?bVJ1Vk5WVUd1TEFRYm9RZ3FLWG1vUUFSQk5SM20wSVVrakZWb2ZETFpiNktC?=
 =?utf-8?B?cG5wNGQ4WjMrc3cwaG1RY3FnSnhKUjFTVmE4OHVKU3o3TzJzVlNpRGxmbGkr?=
 =?utf-8?B?SGNqUENPVXVrZUpiYXJVSlhqaHBmZldlbVBxY25neDdRRjhrSDFRUmdHS0RT?=
 =?utf-8?B?WmpzeVlwMHVOVVFyUGZ3b3hXYmVteXVhT3BDNWErNWR0eTllQUQ2bFZZL0Zo?=
 =?utf-8?B?Q2cxNjRsS0dyd1krQUVqRkhzdW1lUGgrdHhJM2tJZk5wOG92UE9HaUhHYkpY?=
 =?utf-8?B?a05VcllsRVp4VHFSTkRDYTByR2NyeUp4SVBLQ3QrYWcyOTQ2bEZQTHBYSTEx?=
 =?utf-8?B?YzY0eCtNMzUrUEFOcmRra3gwRFEraSt0dVBrUXEydHhEdGZNbGVTZ0Y3VU9r?=
 =?utf-8?B?dzBOMVZwTW80VHB4a1lzbTgrc290NWdEUFVuZlRjRGlOZ2JQcHVZdjJLeHQr?=
 =?utf-8?B?ZUNieHZsUXFGQXBBaUoyU3hNdFU0V3RtVGwydG1Pdk1iV3VsenpYbVIxVWFV?=
 =?utf-8?B?L0s3Z0VqUS9nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q0tqMWF4eHdycy9zL1Iza3R4MUJ2RGNmcnNndWIwTndiN1hHZjkrbjg5aTVj?=
 =?utf-8?B?ODdRWDEyVVdVYy9Ebi84MGluVHd6VHEzSkhRMXR0REp5SVlYanJkYjNidjc2?=
 =?utf-8?B?QlFXayttQXJ5Vzh0dFRHdjJuMUpQUzM1RU5RdlZSZVJlTWxScWIvTzI4ZnJ2?=
 =?utf-8?B?SW1pdThGVEZBUkxxMlo3OHY2Mitza244M0ZKRWx3QWUvK2dYYndkRUM5VXN2?=
 =?utf-8?B?djBzMlhBbU1tbUJBK2gzeUZ2WUlOTVphczRZeDRRVDdhM2dmN2xTYVJadWhn?=
 =?utf-8?B?U05OWlpxcEl3S2ZmU1ZoeDBlUUtJVmNsakhXOVBscmtYd3UvUGlreG9ZY0RV?=
 =?utf-8?B?enNCVnJldk1TM1FuaGtoQjNsTFdhRk9FblVMVHc1cGZqa0tqV091SGxBeVEr?=
 =?utf-8?B?bDk1VW85U3ZxUDRrYWFLelA3VnRQeUlFMVVUbXh2NEVBSEZnd0IvZ1NSMDNu?=
 =?utf-8?B?YWVSWk5lbUQyS1U4dk93bVp2TTBZVGh1SHJDQ3lSVG9tTVd4dThjNWF3SHJQ?=
 =?utf-8?B?bENkSWZ6N2YyN3FuOVVLMzZjWDhiL01VNFcvRHJsMEhBYXM0MHFwZmJ1bE50?=
 =?utf-8?B?SWVhaDFZNm9VR1ZBMWFVcCt6UFJ1N3ZwM005bkd5ck14THdIcFloTGd6bkdK?=
 =?utf-8?B?RDloZldwTEZFY1BtbkM3WTltYTAxYmpIdWsxSnlvQVJFdloydCs1WlZsR2M5?=
 =?utf-8?B?TTJ4ZTFsSDdFUkRkZkROazR0Y0ptUWFXWkZ5SjJNeURnbWRIVFllSXhZbUZR?=
 =?utf-8?B?TWFLK2xXeXR0K2RyVi9BWlh3OENUV0hqQ0ZxMDQzd1c1OUFSR0k0Sm1YaVZy?=
 =?utf-8?B?bGtGZm5tU0lPV1FDOVYzTURTK2Fpd0FuSXNacUtybUw0VFZ4NVc3V2hrR1Jp?=
 =?utf-8?B?cU5vRWJDZm1TSTZwdHNBYXAwb090bTVyZGtFN2U1NDAzc0ZCNENRazhJeVhq?=
 =?utf-8?B?NjlXMTZoUkZwYmNLSnJPSmFSbUZ0R2tiWnBobG53czVGejZIakNPMzgzWnJz?=
 =?utf-8?B?S3BVWjI3V0x6TmFxVys3ZC9ZcUMzSFlJcUo2dWVJS09Kb2ZXeUtNKzN4Z1Aw?=
 =?utf-8?B?ZjVoT3k2SXNpUENsRXFtZzlLY0FXQkZ6dWhXemJpeTNTeVpWSUJoMmFzTXNH?=
 =?utf-8?B?OE9DWllpMkNFcGxETG0wTnFIY1llYzU0dzNTN1lUUy9LNmRLV3p2MUFNeWxW?=
 =?utf-8?B?NXA1cXNSVk1YM2VSWUxrTnRSRmVxdnpjOG9IbXl0QmdaRTFYbHVZUDloK1dz?=
 =?utf-8?B?N1VyUDFrTmd3NmhqbnMrcWpjSkZnTlZFL0ROZHJNaGl1d2FkdTdvcWRFNXA4?=
 =?utf-8?B?U052d0ZDTFZyZHVBOHZTNkd0aHprUDJuQzBQTEhDSTRkU1hOUUFhWWJnUmdz?=
 =?utf-8?B?OUthdlQ5YzN6b09NMUhWd0FRNDcrU1l6MWFYajZjM2orcHZmNXhWSUtOcjZh?=
 =?utf-8?B?Z3FYRDIvZUo5aS81WTVxWG1BNlZZaVpvVmRBUTBRclE1MEpZem9sYUY3Mnp3?=
 =?utf-8?B?WjJwSFBJR2JKSll4djlMaW5EaDQ1cDdRYUN1aG1FRTVRRG9mSVZ3TGZuSEg3?=
 =?utf-8?B?cDYySzV3MXNWUWlEbnZ1WWlXN0tpOXJCSzRIQjQyOEc4RWFJYllYSjA2T1NG?=
 =?utf-8?B?TXVwSnNHR3c1YzlYMnh1OHpUTnMwQ1R0S0RIczUxQ0ZQYWswbjMvUXVEREVi?=
 =?utf-8?B?Mk9DNWphdk01SHFHQUg1OUx1WWJ0Y2VEbEE1a1d0dkJTdlFKZUNuUGVzNVpV?=
 =?utf-8?B?V3BPc1E5WWUwY1RhMGdiL24vVlowNkhjaW03d2FHUUt2dEdKcklYbVFCUktK?=
 =?utf-8?B?UEgrSWI5L1lKU3R1ZnBac25jNzdGdHBCTEZBbW9Ickh1TzF4ZDNDclo4UlMw?=
 =?utf-8?B?MURzd0FpNkdKRzRkeXBHdStBbzJPZEVxYk4wYStJb2ZITmZjOFl4WjZJYTN0?=
 =?utf-8?B?TXhRd0lUNVJvRSs3UnJEeTFiUUdQUmtsVFhyU1laRVBtcy9OdWtWdHg5WlFU?=
 =?utf-8?B?NDlBOUlyMU5xK3RQQTIrSmZVTjRUbjVib2x1eEtoZHpHbE8yeHNtb09GMkZC?=
 =?utf-8?B?SEVUK1RYdGcrWE9NdjI5K1oxNzA0dE03R3JVa2VIbExKaW55am4xZ3Vqem1B?=
 =?utf-8?B?eWNtMngwYkpWTElDOVBhZXJLZFdTRCtiL3E0RkFuaWRMTHBoMlVQbDhqRmZ5?=
 =?utf-8?B?S0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3346983AF91C1C4FBAEB573867F4B105@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1dc52c-ae90-4944-9a62-08ddde310bbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2025 08:27:18.7823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bkny5ThWwdnT/wGIeN69XeDAmjVyX261zB3FWWq8IoK+kWlguJeDqY1EXKU6nw42GLgc3zQ5HhrYwGJJqQ8WQschUtKMdVmWEUfga6epLmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10788

DQoNCk9uIDgvMTgvMjUgMTA6MzgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4wOC4yMDI1
IDE2OjE1LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBGaXggdGhlIGZvbGxvd2luZyBp
c3N1ZXM6DQo+PiAxLiB4ZW4vZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdDo5MDogV0FSTklORzog
SW5saW5lIGludGVycHJldGVkIHRleHQgb3INCj4+IHBocmFzZSByZWZlcmVuY2Ugc3RhcnQtc3Ry
aW5nIHdpdGhvdXQgZW5kLXN0cmluZy4gW2RvY3V0aWxzXQ0KPj4gMi4geGVuL2RvY3MvbWlzcmEv
ZGV2aWF0aW9ucy5yc3Q6NTQ6IEVSUk9SOiBFcnJvciBwYXJzaW5nIGNvbnRlbnQgYmxvY2sNCj4+
IGZvciB0aGUgImxpc3QtdGFibGUiIGRpcmVjdGl2ZTogdW5pZm9ybSB0d28tbGV2ZWwgYnVsbGV0
IGxpc3QgZXhwZWN0ZWQsDQo+PiBidXQgcm93IDYgZG9lcyBub3QgY29udGFpbiB0aGUgc2FtZSBu
dW1iZXIgb2YgaXRlbXMgYXMgcm93IDEgKDIgdnMgMykuDQo+PiAqIC0gUjIuMQ0KPj4gICAgLSBD
YWxscyB0byB0aGUgYF9fYnVpbHRpbl91bnJlYWNoYWJsZSgpYCBmdW5jdGlvbiBpbnNpZGUgdGhl
IGV4cGFuc2lvbiBvZg0KPj4gICAgICB0aGUgYEFTU0VSVF9VTlJFQUNIQUJMRSgpYCBtYWNybyBt
YXkgY2F1c2UgYSBmdW5jdGlvbiB0byBiZSBtYXJrZWQgYXMNCj4+ICAgICAgbm9uLXJldHVybmlu
Zy4gVGhpcyBiZWhhdmlvciBvY2N1cnMgb25seSBpbiBjb25maWd1cmF0aW9ucyB3aGVyZQ0KPj4g
ICAgICBhc3NlcnRpb25zIGFyZSBlbmFibGVkLiBUbyBhZGRyZXNzIHRoaXMsIHRoZSBgbm9yZXR1
cm5gIHByb3BlcnR5IGZvcg0KPj4gICAgICBgX19idWlsdGluX3VucmVhY2hhYmxlKClgIGlzIG92
ZXJyaWRkZW4gaW4gdGhlc2UgY29udGV4dHMsIHJlc3VsdGluZyBpbg0KPj4gICAgICB0aGUgYWJz
ZW5jZSBvZiByZXBvcnRzIHRoYXQgZG8gbm90IGhhdmUgYW4gaW1wYWN0IG9uIHNhZmV0eSwgZGVz
cGl0ZQ0KPj4gICAgICBiZWluZyB0cnVlIHBvc2l0aXZlcy4NCj4+ICAgICAgWGVuIGV4cGVjdHMg
ZGV2ZWxvcGVycyB0byBlbnN1cmUgY29kZSByZW1haW5zIHNhZmUgYW5kIHJlbGlhYmxlIGluIGJ1
aWxkcywNCj4+ICAgICAgZXZlbiB3aGVuIGRlYnVnLW9ubHkgYXNzZXJ0aW9ucyBsaWtlIGBBU1NF
UlRfVU5SRUFDSEFCTEUoKSBhcmUgcmVtb3ZlZC4NCj4+IDMuIHhlbi9kb2NzL21pc3JhL3J1bGVz
LnJzdDoxMjc6IFdBUk5JTkc6IElubGluZSBpbnRlcnByZXRlZCB0ZXh0IG9yIHBocmFzZQ0KPj4g
cmVmZXJlbmNlIHN0YXJ0LXN0cmluZyB3aXRob3V0IGVuZC1zdHJpbmcuIFtkb2N1dGlsc10NCj4+
IDQuIHJlbW92ZSBiYWNrdGlja3MgZnJvbSByZWZlcmVuY2VzIHRvIHNvdXJjZSBjb2RlIGluIHRo
ZSBmaWxlIHJ1bGVzLnJzdA0KPj4gdG8gaGF2ZSBhIGNvbnNpc3RlbnQgc3R5bGUgaW4gdGhpcyBm
aWxlDQo+IA0KPiBJIGRvbid0IHVuZGVyc3RhbmQgdGhpczogRm9yIG9uZSwgd2h5IHJlbW92ZSBx
dW90YXRpb24/IFBlcnNvbmFsbHkgSQ0KPiBjb25zaWRlciBzdWNoIHF1b3RpbmcgdXNlZnVsLiBB
bmQgdGhlbiAuLi4NCj4gDQo+PiAtLS0gYS9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+PiAr
KysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+PiBAQCAtOTUsNyArOTUsOCBAQCBEZXZp
YXRpb25zIHJlbGF0ZWQgdG8gTUlTUkEgQzoyMDEyIFJ1bGVzOg0KPj4gICAgICAgICAgdGhlIGFi
c2VuY2Ugb2YgcmVwb3J0cyB0aGF0IGRvIG5vdCBoYXZlIGFuIGltcGFjdCBvbiBzYWZldHksIGRl
c3BpdGUNCj4+ICAgICAgICAgIGJlaW5nIHRydWUgcG9zaXRpdmVzLg0KPj4gICAgICAgICAgWGVu
IGV4cGVjdHMgZGV2ZWxvcGVycyB0byBlbnN1cmUgY29kZSByZW1haW5zIHNhZmUgYW5kIHJlbGlh
YmxlIGluIGJ1aWxkcywNCj4+IC0gICAgICAgZXZlbiB3aGVuIGRlYnVnLW9ubHkgYXNzZXJ0aW9u
cyBsaWtlIGBBU1NFUlRfVU5SRUFDSEFCTEUoKSBhcmUgcmVtb3ZlZC4NCj4+ICsgICAgICAgZXZl
biB3aGVuIGRlYnVnLW9ubHkgYXNzZXJ0aW9ucyBsaWtlIGBBU1NFUlRfVU5SRUFDSEFCTEUoKWAg
YXJlIHJlbW92ZWQuDQo+PiArICAgICAtIEVDTEFJUiBoYXMgYmVlbiBjb25maWd1cmVkIHRvIGln
bm9yZSB0aG9zZSBzdGF0ZW1lbnRzLg0KPiANCj4gLi4uIGJhY2t0aWNrcyBhcmUgc3RpbGwga2Vw
dCBoZXJlIChraW5kIG9mIGluIGxpbmUgd2l0aCB3aGF0IHlvdSBzYXkgaW4NCj4gNCwgYnV0IHN0
aWxsIHNvbWV3aGF0IHB1enpsaW5nKS4gV2hlcmVhcyB3aGF0IHlvdSByZW1vdmUgLi4uDQo+IA0K
Pj4gLS0tIGEvZG9jcy9taXNyYS9ydWxlcy5yc3QNCj4+ICsrKyBiL2RvY3MvbWlzcmEvcnVsZXMu
cnN0DQo+PiBAQCAtMTE5LDEyICsxMTksMTIgQEAgbWFpbnRhaW5lcnMgaWYgeW91IHdhbnQgdG8g
c3VnZ2VzdCBhIGNoYW5nZS4NCj4+ICAgICAgICAgICAgLSBTd2l0Y2ggd2l0aCBhIGNvbnRyb2xs
aW5nIHZhbHVlIHN0YXRpY2FsbHkgZGV0ZXJtaW5lZCBub3QgdG8NCj4+ICAgICAgICAgICAgICBt
YXRjaCBvbmUgb3IgbW9yZSBjYXNlIHN0YXRlbWVudHMNCj4+ICAgICAgICAgICAgLSBGdW5jdGlv
bnMgdGhhdCBhcmUgaW50ZW5kZWQgdG8gYmUgcmVmZXJlbmNlZCBvbmx5IGZyb20NCj4+IC0gICAg
ICAgICAgIGFzc2VtYmx5IGNvZGUgKGUuZy4gJ2RvX3RyYXBfZmlxJykNCj4+ICsgICAgICAgICAg
IGFzc2VtYmx5IGNvZGUgKGUuZy4gZG9fdHJhcF9maXEpDQo+IA0KPiAuLi4gZS5nLiBoZXJlIGFy
ZSBzaW5nbGUgcXVvdGVzLg0KPiANCj4gSmFuDQoNCkFzIEkgbWVudGlvbmVkIGJlZm9yZSwgdGhl
c2UgZmlsZXMgKGRldmlhdGlvbnMucnN0IGFuZCBydWxlcy5yc3QpIGhhdmUgDQptaXhlZCBzdHls
ZSBvZiBxdW90ZXMuDQpUaGUgcnVsZXMucnN0IGhhcyB0aHJlZSBwbGFjZXM6DQoxLiAnZG9fdHJh
cF9maXEnDQoyLiBgQVNTRVJUX1VOUkVBQ0hBQkxFKClgDQozLiAndm9pZCBub3JldHVybiAoKiko
Li4uKScsICd2b2lkICgqKSguLi4pJw0KQmVjYXVzZSBBU1NFUlRfVU5SRUFDSEFCTEUgaXMgdXNl
ZCB3aXRoIGJhY2t0aWNrcyBpbiB0aGUgZGV2aWF0aW9ucy5yc3QsIA0KaXQgc2hvdWxkIGhhdmUg
YmFja3RpY2tzIGluIHJ1bGVzLnJzdCBhbHNvIChJIGhvcGUpLg0KQnV0ICMxIGFuZCAjMyBoYXZl
IHNpbmdsZSBxdW90ZXMgLT4gbWl4ZWQgc3R5bGUuDQpTbywgSSBkZWNpZGVkIHRvIHJlbW92ZSBh
bGwgcXVvdGVzIGluIHRoaXMgcnVsZXMucnN0IGZpbGUuDQoNCkkgZGlkbid0IHRvdWNoIGRldmlh
dGlvbnMucnN0LCBiZWNhdXNlIGl0IHdpbGwgYmUgYSBtZXNzLg0KDQpEbXl0cm8u

