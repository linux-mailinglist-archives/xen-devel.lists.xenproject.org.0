Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B034C34C4B
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 10:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156057.1485367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGZiA-00025B-CS; Wed, 05 Nov 2025 09:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156057.1485367; Wed, 05 Nov 2025 09:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGZiA-00023X-9c; Wed, 05 Nov 2025 09:21:50 +0000
Received: by outflank-mailman (input) for mailman id 1156057;
 Wed, 05 Nov 2025 09:21:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=meL4=5N=citrix.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1vGZi9-00023R-1O
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 09:21:49 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da04cca4-ba28-11f0-9d16-b5c5bf9af7f9;
 Wed, 05 Nov 2025 10:21:48 +0100 (CET)
Received: from DM6PR03MB3482.namprd03.prod.outlook.com (2603:10b6:5:ae::22) by
 IA1PR03MB8261.namprd03.prod.outlook.com (2603:10b6:208:5b0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 09:21:44 +0000
Received: from DM6PR03MB3482.namprd03.prod.outlook.com
 ([fe80::4cad:bfaa:fd27:3555]) by DM6PR03MB3482.namprd03.prod.outlook.com
 ([fe80::4cad:bfaa:fd27:3555%6]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 09:21:44 +0000
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
X-Inumbo-ID: da04cca4-ba28-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1JmNMIw3XHiTbB4ARHa2RTWdb4p5mSq3anrXbb5xxekUtm0NitategmWHxwgpgxexHPAT+HUDlbn1WK66sqZNwlp1GUxJYV3guf7lO9Lc0ZDMF9PG3gi4upJSVlJY5UP0awDU9iZzy0dshcSS+Awb/1BP0TwL2aEhpQJHEWrGqueknuiTPmBLXmAJVTSjw8IWquydd6ZjdE41D7DLghTJfq7x6RPYFms306QHCvXxyQj1WKwE4zqmZUTsaEdJu5HiZ3/g0XQUXBBV66V7f+uqMS8nQeXw86ccb2tFGhf3i/pN3VCgCpNUgGN9w9sRKnWqRs2ICB0CpIuvVcJVCzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MQYLKc1VTf4ijgPZyNVj5VCsbRnlaBZYeo3Lt+4358=;
 b=GNC2GLbEFBKlOU71FIIZgZFW0mFCLAPCFxC3lHHTudJ/h2UA+Zy2INh0TtCO8F9sZg+TXPgSouKHKOK+eDXuwEgqZv1kFBpsZmzlKeLKgSnKhxJKTCG88cAXTJpISUdatguS6b3c43QE/ubbnGX2t1HL3qoKg+cysog6x1PJF2dQK9hCKLT2GTpUISdKN7Mv/7G3LIolYFDICChz2sXyAnrlmifE/Fj4hxxzOUyxOxGiqbSizHzRKeynQm3qoHiwgHfSmM2bUziaD129UjMXu1kKgNpIb2AjXFsqH22VyBZN/gizi4Leb/+DWfclACn+sR0hyYAkUPjYbxGeN9NiuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MQYLKc1VTf4ijgPZyNVj5VCsbRnlaBZYeo3Lt+4358=;
 b=EE0ffJeYi9LDFEyLvkIkW6dJmNJTkv7EXVisFHaLMioT1iiRTV6te7AnZuKZR7mJ/2owWvuhdVWMtxCiRrFObMhrsd/QMA6OqTIM95hH9/Se00EtekZVM9E1AWbkVWP5wUeyZ2TJdwZmMhqBaTN3kJIVBLigafbF0ZWUCoHi0wE=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <andrew.cooper@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Edwin Torok
	<edwin.torok@citrix.com>, Rob Hoes <rob.hoes@citrix.com>, Pau Ruiz Safont
	<pau.safont@vates.tech>, Andrii Sultanov <andriy.sultanov@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] ocaml/xsd_glue: Fix dynamic linking configuration
Thread-Topic: [PATCH] ocaml/xsd_glue: Fix dynamic linking configuration
Thread-Index: AQHcTawFHWS08HLeIEeNO/Ffj2wNHbTjz8+A
Date: Wed, 5 Nov 2025 09:21:44 +0000
Message-ID: <8C185CFB-6074-429E-8622-4439D24043A7@citrix.com>
References: <20251104165644.4011663-1-andrew.cooper3@citrix.com>
In-Reply-To: <20251104165644.4011663-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.100.1.1.5)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB3482:EE_|IA1PR03MB8261:EE_
x-ms-office365-filtering-correlation-id: efeb254c-d513-4e42-0fe1-08de1c4cbcb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WTVpaWl2MFMzQTNiVG56RUd2UzQwWTA4YU1sZFZnWEFlMFRyWS91RDNTZ1Fy?=
 =?utf-8?B?cmVndXJ1SzdtZ05yQnV6SHY1eFVtdjFYRUhKalV2VU1lUlR4NEt1Z29HUW9J?=
 =?utf-8?B?RExRaXNSR25hUWlaemQ3V3BJWW1HZHFlVGs3eUVIc09rcU1WK1IzQUdwRmF3?=
 =?utf-8?B?ZmtXMTRmN2hiZk1kdElWbStiM05kVlprQVBVM2JreHRkems0UTk3emxBcTVD?=
 =?utf-8?B?aTJoWTk5ZXVkMkZHQlV2ZGs0ejJhRjE3aTRCa0NLOHJOcEhxQjFiL3RjZFQx?=
 =?utf-8?B?dVdoTFBQZHdVdmhsQVhHbERWQmgxZjdCdUtDeTdqRGtGOXlpeE53aHA2ZWFK?=
 =?utf-8?B?a3RSa2hFWlhhOFMrbjltU2pYWEtFL0xFeVFTemxQUEJmRFk2NHArOTRMYTR0?=
 =?utf-8?B?ejJLYTlvN1B5eld3ZzJtMXBoNnNrZDFlazRwbnNHcG5vYUFLaFJIZlZpYU1Q?=
 =?utf-8?B?amg5K0c5LytqYW0xRVVDREZzK1RxQXBNRTg0b25Oc20vcklwTlo4ZTdEZEJr?=
 =?utf-8?B?NzVYMUxmSHJjc3l2TTJyV2p3dTZJN00xVzdleWlScGEwRG5YbUsxUG11VkJH?=
 =?utf-8?B?T3lwWVhrbGZscGQySnBIL3BtRjVleTgyekJxaE1sNjBOMkt0R2Vuci9FZTZM?=
 =?utf-8?B?eU5XN0t5K3p1QjVNMnpvdXliVW1NclQ2dTlIcTBsSnAvdktwZUtLeEFQVTBR?=
 =?utf-8?B?K21NVzJnM1NNRkNTazVMYW9Yc3NFbmlkU01QRjBQZEVmMjVFbVc1WkpWZC8w?=
 =?utf-8?B?eGlWaG9yZmYxNHAwSGFzS2NaNHpNNHpHQmxyMkRiODFsSjI1ZGoveTB4Sldq?=
 =?utf-8?B?Q0hxWGNhTTZmK29WWDJYcHBLNEF4TFZkNVg1SnNrNThrS08rWVJiYXlhZ0sz?=
 =?utf-8?B?NGc4UGNvSGdHK1pPUjVrQnpIQStmNmxEb3QzTzBKejhzdjR2eGY5SjRuQnB2?=
 =?utf-8?B?UG9NbFAzUmhaem80Yzd6OVB5dFZQWVIyNG5MNlB2QTVHN01ObHB5WElZRVov?=
 =?utf-8?B?NkgrSEdaSEFDdDZYelZWb1Q1ZVFIa1J6V1BFVGxFaXRMWVpQQXFMYzJTbnQr?=
 =?utf-8?B?R21GWXlTVVcrcXU3dUFBL0xWcVdHVUZycGNkWmJicGs5R0Y2aXNWbVh0TkxU?=
 =?utf-8?B?T0Z0T3E3MElubmpQY3pxZDk5OFAyS2J5VURSYi9URExQVlVJM0lWSUxma2hj?=
 =?utf-8?B?WmpXTFpVY2lxa1JpRHdETE1GODZoZmRNR0t3RDkwSm9JbFk2Rk56TU52ZGxr?=
 =?utf-8?B?SWxicHdPUSsyMkhaRkk1MkZEUmxmLzVZVDBLMjdwVjFVb2Y1YzliNnkvckRu?=
 =?utf-8?B?QlMzZGk3SHVmVnRyRnROUHh2dnU3V3F4WWVGQkJWZmFkRVJWSG5sOHBGVEx5?=
 =?utf-8?B?cXRRRlpDeSt4T29wdURxUHhJZFBqMWMrR0dCY3p5cXluMGY1bDlydkhvdHp0?=
 =?utf-8?B?R3l4YjhuaFRPaFBjSWhWdVRUaXB2elFkdnJYRnlJNXpHNlptMU9PNGxtUXEv?=
 =?utf-8?B?SnB1aDdTek5vY0VFektTY3BjNWNCWG9zRkJpOXVvNEtnWElaNmlEa0ZHbDRD?=
 =?utf-8?B?MDY1Sjd0eWdxb3BXajl6WDJ0bnkyUWt6bWNiSkJGNWRpL3JDVDQrWXJVbzR3?=
 =?utf-8?B?YjRLSjJ0Qy92cWRlTDZQbm1VMzluQldpWkM2Q3JHcm1Va1RBNGdiczQ5eHBX?=
 =?utf-8?B?QmRGU1JiZ004dlpxZzJheUtvcnVFMTI2emp0eWs0ODlObGJMQTBUbXU2Mm5p?=
 =?utf-8?B?ZmFXRUdPYjh1QmExQjB3ZG02QkpjenRqQ1plcjA5YUp4YWNrZHhzM0dlYzF4?=
 =?utf-8?B?YmgrUmtnaGRNUXFTeFhMU3R0K1F4WWR4eDhmOFlHWndqOFNjaUlCay9jc2U5?=
 =?utf-8?B?Z0ZUN0w2SUZ2bXdTcDg3MXhRREYzbXh4WjN1alhKMDNHNkpBbHpTWjZRVkZF?=
 =?utf-8?B?SlJjMVFOZ2p0eS9EVGdDbC9yVXk4aVZna21ZVVRiNnFxa1JYejNnTXZJUFMx?=
 =?utf-8?B?QldOT0pWaWlFcDltU1hWZGVPWU1Ua1Y0RFJKMi9IelQ0OTVRREVMejlkaW83?=
 =?utf-8?Q?gCYzWU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB3482.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aWhnN0Vpa0ZBZ3BxVzVZcjhFaHBISVI4alFiSXgwUFVreFhhMW1qazBrNmhC?=
 =?utf-8?B?a0F3YlJZeUdrQ1NKb0RKN0dnMEF5aTY5Z2VmMWZkdmM2V2V3S2w2NnZkMktR?=
 =?utf-8?B?Tm1veWppcDBlQkhlaGxOdkZ3QzBSa1RzT3Vyajh3cml0Qi81eFRDR041YjRU?=
 =?utf-8?B?OXl2VXp2MnFrd1JDcWJDSS9zOEhZL2wwNzZLbUN4MkJkZWJsM09tb1ZYa0R6?=
 =?utf-8?B?VVRYTjlZVCszeWc5U0pJTXdKQWF0VXVMaG1qRkRaSFFwSTZSQ3NsdlVPU0Rv?=
 =?utf-8?B?VkpxdDVLL3VtTWdWVFBZYUdKZVR1WWlrSTN5Q0FpZGpSbmhwdG1TbGtpTjRO?=
 =?utf-8?B?VkNLcU83bFNTVGRSRzlsMDRkRFcvc1hiM2Zjd1dMQytHMDRvdFdhR1JzQm9H?=
 =?utf-8?B?SlRTY21PSUptNndSaVk5OG9BL3RuTWNPSk9CbmFyeE8yNFRNUlNqQlRUamw2?=
 =?utf-8?B?MXo0TXJaVjFhMTZmSVdud1JUQ1JZTE03akdVdkNUaVEwSmJIMmR2UmEwdTdG?=
 =?utf-8?B?c0V0WGlvSWlSRi9JWUNTNTViLzQxT0tBVSttcHRKYk11NEs0WllzRGJpTG9N?=
 =?utf-8?B?ZjRXbSszYlhWUDZFWnpMV0IrOCtTQ1Jxdm1hMEdWUU9UOEtnc01FcGRuVE03?=
 =?utf-8?B?MXJOVVVRdnFvd3ZONTFoV2psRWtwWUhvdHg2ditZMFBuQmdYdjlpODRXMjNR?=
 =?utf-8?B?RzRGQUhhZGNsQlIvOUFHMXJET21XUm44M3RCQW1DaktERENQT3BkWlBneXNa?=
 =?utf-8?B?RFl0VWFuOUtpSnZnN2VGQTdTaEdack9MNVhlalhQOGR2OUZlSlV2THNyRFhv?=
 =?utf-8?B?WVMyeUJWeTh0L1FJZ253Z1FaemIrL2Q2blB1VVBvVUl3Wkx0OTZLcS9hRnFr?=
 =?utf-8?B?RUZmVjNVN3RmU25UeGN4RWR3UTdzK3ByWmZCZ0xvYW1KcGxOUEJkNTJkei9Z?=
 =?utf-8?B?YTZzVHRPbm5Bd0tJbUpuOGt3YWR6WDRKenhNcU5HN1NUVmx4QStrZFQwOFk4?=
 =?utf-8?B?bU42UmpKTWdaMFROUEpBNWVRNzNIc2g1WHJmb2ltQ3VPNGpmK3VIVTNmbmox?=
 =?utf-8?B?VHJCdVkxaGpLYmtmTllkUThlMU10c2tmWDhmQlBiK2thR25zd3RQMFFacDhj?=
 =?utf-8?B?ZTROMzN1QXF1MkcvU3VnTmJraGxCbmlodlBvejFwYlVGK2NhRndsRmFkQ1RC?=
 =?utf-8?B?MWkraE5PNWxFY3Fxc25FNVJrL0xUWXB1TDB3OTR2UUVIMFlrczRjdWlrQklv?=
 =?utf-8?B?bFBFNXgyVThUb0lSbjhDTXNjaCtwRWhMZkY5VGxPTytkZGVGR0lqUHdkVjZs?=
 =?utf-8?B?R01zSjAwTkxGQjJEcGNUYk52Y2Zvd3E2cTRRWG1QOUYveHlEcGVJaEhKYTdO?=
 =?utf-8?B?Ym9ZTXhGWVpVU3h6U2ZiZE1iMis5ekhmWW04c056eHdvUW9uUVdkMTFZS042?=
 =?utf-8?B?dXk3MmUrT3VVRFdHdHg4dkFiQ1B0akJrUEdqcEtZTjR0SU9JdHE3c05nekp1?=
 =?utf-8?B?MXB4RjVjc3ZJKytxS1VNYitudmJKcUlhQmJpbThsZER5eHBWVXpVaTU4WEN3?=
 =?utf-8?B?MWVnbmZ5VFpMcGhEb1JhdzlSU1hPcXpHbGZiZkJ0WmJPRlpqNXZ2Wm04M0Jm?=
 =?utf-8?B?bDUwa2ZtMEtHRi9YbEdIYVl0RDhmNXNxRlMvYnhuRm9RN1FOV2lWM05nUCtj?=
 =?utf-8?B?eXkzRVFpMUtkUFJpMnlxalFEVHVKRGJyRnlLUjZqUGs3YWx0em9EcVMvcEVY?=
 =?utf-8?B?VnM5NjBicnRLbHFDbnpZeGJkMENwRFY2UFExSEtLb2czOG9iQy9xNzdTb050?=
 =?utf-8?B?ZDI2VUtQeEdqaHM3MjdoWHdiWUQ1dENESm02MGFNOW5na0ZhQStReWcraEZv?=
 =?utf-8?B?LzJJdlBTZlByZ1JKVTdpUUUrYTRvL05ZbmJXL2MwYzcrQnlPbW1RZFN2OWlT?=
 =?utf-8?B?YTFOT1dZUUdabnJvUVpOaWsvWkdkTVlkZzlLUXRPUU4vTmlaOFU4c1ZOUk5y?=
 =?utf-8?B?MlhpcTQxSHFVYnRlSjBVUnFwdEhQWkp4ME81cms5K1hjaU5NWW1hKzN4ZldX?=
 =?utf-8?B?N1VlZVdrTFlKRnI2L1J3RWRZTzNFRXFoaXZyUnYvMjdGT1AxSU9RdjNhRmV4?=
 =?utf-8?B?SGNUTkRVdXpHL1B1K25QMEhkdFgyaDlhd3hicEhyUURJV29wMTZwSFkrSy9z?=
 =?utf-8?B?ZlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CADB59E23587A34C96F42250D3843AAB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB3482.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efeb254c-d513-4e42-0fe1-08de1c4cbcb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 09:21:44.1579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cVpWMyMJ4CWNUrGH7tTFO6q/Vi0kIFpsVqpDrUhP5j4sE24jla47PtahtdhpD5Z1MONrfSZ8IzaZV6XJmFKjLWJKW56cLzAayrRPBWJCXrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8261

DQoNCj4gT24gNCBOb3YgMjAyNSwgYXQgMTY6NTYsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gVGhlIGxhdGVzdCBveGVuc3RvcmVkIGZyb20g
WGFwaS1wcm9qZWN0IGZhaWxzIHRvIHN0YXJ0IHVwOg0KPiANCj4gIGxhdW5jaC14ZW5zdG9yZVsx
MjAxXTogU3RhcnRpbmcgL3Vzci9zYmluL294ZW5zdG9yZWQuLi4NCj4gIGxhdW5jaC14ZW5zdG9y
ZVsxMjIyXTogRmF0YWwgZXJyb3I6IGV4Y2VwdGlvbg0KPiAgICBEeW5saW5rLkVycm9yIChEeW5s
aW5rLkNhbm5vdF9vcGVuX2RsbCAiRHlubGluay5FcnJvciAoRHlubGluay5DYW5ub3Rfb3Blbl9k
bGwNCj4gICAgXCJGYWlsdXJlKFxcXCIvdXNyL2xpYmV4ZWMveGVuLy9vY2FtbC94c2RfZ2x1ZS94
ZW5jdHJsX3BsdWdpbi9kb21haW5fZ2V0aW5mb192MS5jbXhzOg0KPiAgICB1bmRlZmluZWQgc3lt
Ym9sOiB4Y19kb21haW5fZ2V0aW5mb19zaW5nbGVcXFwiKVwiKSIpDQo+IA0KPiBUaGlzIGlzIGJl
Y2F1c2UgZG9tYWluX2dldGluZm9fdjEuY214cyBpc24ndCBkeW5hbWljYWxseSBsaW5rZWQgY29y
cmVjdGx5Lg0KPiBGaWxsIGluIHRoZSBjb3JyZWN0IHZhcmlhYmxlLCBhbmQgcmVtb3ZlIHRoZSB4
ZW4gcHJlZml4IGZyb20geGVuY3RybC4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBFZHdpbiBUw7Zyw7Zr
IDxlZHdpbi50b3Jva0BjaXRyaXguY29tPg0KPiBTdWdnZXN0ZWQtYnk6IEVkd2luIFTDtnLDtmsg
PGVkd2luLnRvcm9rQGNpdHJpeC5jb20+DQo+IEZpeGVzOiBhNjU3NjAxMWE0ZDIgKCJvY2FtbC9s
aWJzOiBJbXBsZW1lbnQgYSBkeW5hbWljYWxseS1sb2FkZWQgcGx1Z2luIGZvciBYZW5jdHJsLmRv
bWFpbl9nZXRpbmZvIikNCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NCj4gLS0tDQo+IENDOiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3Rp
YW4ubGluZGlnQGNpdHJpeC5jb20+DQo+IENDOiBSb2IgSG9lcyA8Um9iLkhvZXNAY2l0cml4LmNv
bT4NCj4gQ0M6IFBhdSBSdWl6IFNhZm9udCA8cGF1LnNhZm9udEB2YXRlcy50ZWNoPg0KPiBDQzog
QW5kcmlpIFN1bHRhbm92IDxhbmRyaXkuc3VsdGFub3ZAdmF0ZXMudGVjaD4NCj4gQ0M6IE9sZWtz
aWkgS3Vyb2Noa28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPg0KPiANCj4gRm9yIDQuMjEu
ICBXaXRob3V0IHRoaXMsIHdlIGNhbid0IHByb2NlZWQgd2l0aCBkZXByZWNhdGUgb3hlbnN0b3Jl
ZC4NCg0KQWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2xvdWQu
Y29tPg0KDQo=

