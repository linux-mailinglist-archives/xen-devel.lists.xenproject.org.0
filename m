Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AAFB13F89
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 18:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061746.1427332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugQNl-0003s0-1M; Mon, 28 Jul 2025 16:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061746.1427332; Mon, 28 Jul 2025 16:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugQNk-0003pc-U8; Mon, 28 Jul 2025 16:07:20 +0000
Received: by outflank-mailman (input) for mailman id 1061746;
 Mon, 28 Jul 2025 16:07:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l9gA=2J=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ugQNj-0003pW-DH
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 16:07:19 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee4d8231-6bcc-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 18:07:17 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PAXPR03MB7634.eurprd03.prod.outlook.com (2603:10a6:102:1dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 16:07:14 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 16:07:13 +0000
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
X-Inumbo-ID: ee4d8231-6bcc-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvodDBeLcYukVK30wlDnp3C/IojMRs54l1MSvxdnMfWX0fTcxLB2qxPsZ0mJgf2qJWHLYMfq+CniDkDBdcwRRSejES4FWaaStKqZkwYUzAGJl8i7CgAXwrtBMIKWKwdaYKUBEqKYyece+qJLvkmBVInxf2KnnP1H261GBfYDbqhEaEEZf64b+/TukntaIgCxxLjVIkRUBWw3w22VagSAGKLkXSBubp76GLi2W8Iwj/2tLLlLUX82gQFc7X6etofMXB+sEcw5vDWw2zf4Kh525kTDlnF5VIPndDkdKLiS8BpeKR/GRhFNPX/dnXRtEwMnHwGlEjeo/kMWswyWHC64uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kq5rH2W6l5YQvPwdHOK6zBJe7E6uBeK9H4Be8r0Oo9g=;
 b=JA86OdJQkWWve/XGdm1Tn6+ZpvbdrkpYBNb72dm1dxtYvalEAggvy8rw/8Pcp0thH5+5uAwPGvoFaDc25OdyhDx1X8IfVriBs2pW7lfnnpFZcfYwbGFBcGaO9+xCzQ+g2EFRS6Gy8gD5m9beQoNPKS1exosImnX3UCUjYq19uhvBYipiWOhnW4FNhoKDn4ejtsS3AbHu3NPiPhVnyThgni1b16xRpHGGd1eGkYlvFEwMCqlr7jMe95Gq2oFnOwDtdEgaBplcPVhWW3TvPoIbVTGOA4HH3dtqe8IWs0Yo/bNIy2ScnCIT2iJ1SecSJosKCI79D8JxNvTMR8pJQ3Z9jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kq5rH2W6l5YQvPwdHOK6zBJe7E6uBeK9H4Be8r0Oo9g=;
 b=qQieVleK811BOx9BHqpG5UCtNhs7JfIAM3HI4KtcJ29+M8LOTeytEwAwryDwEkLa82MzfjXi33d085stV5LFxvMk/OrBJuKITrtKTXywCUt4FhGZEZQwIrhvn2entzRr6JeMnJA47EwKnQDFbmpDIMha51ZZnlxg5IlDWhzCgJ5PjIG0XqVbJzCn+/6YUpeXKCuxz4YK3wj5ad6pe4vY1+6ibmw5G677C1utklOH6rXUCVb8Hsc41+Jz34Fsb0+jxOLSS0LFBJEdgoSGGWvAB/UR9EOq3h3DgEf1gwkuEGjauxn/xj7LzXAro5HI5NO73Ih/xiw110IEfrTmA4PGfw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: address MISRA C Rule 18.3 compliance
Thread-Topic: [PATCH] misra: address MISRA C Rule 18.3 compliance
Thread-Index: AQHb+7pQeGfsWWy0sUade1ju+9GDKrQ/vEEAgAOkMwCAA9VBgIAAhjKA
Date: Mon, 28 Jul 2025 16:07:13 +0000
Message-ID: <13fe0c76-1cb5-4df3-a8df-9002af6077cd@epam.com>
References:
 <c9fb095c43edfedfd6174284bac404ec9ae5523d.1753263957.git.dmytro_prokopchuk1@epam.com>
 <6c7341a2-fd49-40de-8ad3-e7980d4e9e42@suse.com>
 <36042f23-7795-4717-be4a-cd22e52b3145@epam.com>
 <f5c4a7ab-5d63-4211-b8e1-73fb6a9d749c@suse.com>
In-Reply-To: <f5c4a7ab-5d63-4211-b8e1-73fb6a9d749c@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PAXPR03MB7634:EE_
x-ms-office365-filtering-correlation-id: 568bc601-19c9-49cd-fc63-08ddcdf0d0f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QVJPdHYxTkcrSEtDZkpqZDlBRlEwVkZHeThUOFVUTGNsNlAxb2VxdzRQYU5Q?=
 =?utf-8?B?dkNVaFQwQ1cwcGd3VGg1UjU2eDd0aDZmSnBQbE52ais5MWdNUHFFeGVEVXRL?=
 =?utf-8?B?Y3k0Ly90enNWdEhaVEtPV2lEL2pqZnRpaG1kbG5BdlhsUFFkRFZRanRGU0ZJ?=
 =?utf-8?B?TElTclpJOHYyOTRjeUlWVjdCWlVMa3V1b1NBaUVRYUE4WHoydlFxVGo0MFZq?=
 =?utf-8?B?dS9zWXpmaFllcEJidnFhaUpCMUY4Qmh5OUJPdFVtUDRCcWxjN3JKbWdFZ3JU?=
 =?utf-8?B?SHJ6WlZLekJlVC94Y2JOU3kyWHRmeHBZNHNOcmVWVE81US8xb21HS2hGSmRt?=
 =?utf-8?B?V04wSW9ESHRFc0Z0YWYxWkN5NSszR1QyQ29yQjFOMWl2T05OUHFJdmIxejlI?=
 =?utf-8?B?SHpiV1EvZ1Q3cmo1SlNWdnpvME1raTRkMnZLdzYxRUtjQUJPVldHVXVwcmVr?=
 =?utf-8?B?dE1TYUtYc3Z2Z2tTOHJmNW1LOXJsY05GSE1JUjBKTmdwY0xIUG5vK0tWUmpp?=
 =?utf-8?B?VHZISi9nNWt2YTJEOVJJcTREdzR4RWxQWnQwTGJSQWNrcTFqQlp1Yjl4bW5I?=
 =?utf-8?B?NjJDVWppMUlpS29oUDZEd1FQbHEvbnJ4L1U1UzBtZEZ0cnJOQURyRk00Sldo?=
 =?utf-8?B?QmRIT29JQ2hrcUpMeW1Ub2RZNlJGUlBBVW4wMllqaUhWdXl0elFXcUZEY2VM?=
 =?utf-8?B?VmRPckF5OFBRQ1FVc2tPSGpnL3RScnhpTDNGQU5SckVhSHNydzQrbU50MWZQ?=
 =?utf-8?B?OWlWSDlZcHRsVk01TkdpRTBPU1FxNVNBVFY2YUdqb2lMUTBPNFVBdldVMU1Z?=
 =?utf-8?B?OE5CVkdhbXJTTEVpWndicm02WkFhODdBbGFNeFJMWTdRMUdLQUxkdmlZaEo0?=
 =?utf-8?B?ak5HRkN4cVVNWlovYkVWbVlKMFlMQkhidDZhS2pLZE85YkhuNE8wYTZTRnF5?=
 =?utf-8?B?RnRNMGRaMWRmWm14VkhaOGJlR1AzSzlZYjdTVC9xTXV6Q01TY1o3aHk1NWhz?=
 =?utf-8?B?dVhRSmF6QnBqMUY4T3h6bjZlMHpGYW9xSkZOQXRFNzl0N0FiZkZ1VUUvT2ZI?=
 =?utf-8?B?YlJQTklUNTR5YjdQbEZiNjdvS0U0ZlhjVXlEdUk0a0s1eHdDRFhmWnBBY3NE?=
 =?utf-8?B?Q0s1TUJma3VDMTFhRG5lUVEvT2F2UlJkSlRpWkhpUlZRTXVlMStJNWlPQm1s?=
 =?utf-8?B?TUM1M3BkcWRqek1BT3R3Q3JSVkhkUVY1QVBUSHJMVXp0RmRmL0dPUjhxaCtP?=
 =?utf-8?B?Vjh4VGxQSnFTaFFaRml3UmFGY3NoRkxCWHJuUHJOanYwNkh6amVweUFPSEg0?=
 =?utf-8?B?VkR5NGFTTHE5cGxMQWZMdUhrV0JrZ0ExWlk4OUIrWW5tLy84aUFydXNON0My?=
 =?utf-8?B?K1VwZEJZTGtwREpldzgyU2o3VllEaDlIUi85aEN4eHpqeUVzRWFwY1ZkWURv?=
 =?utf-8?B?SU04dk9rSDRuQlpyZFZRM3g3bFc5V0RxYkFXQjQxUng3elZKbUYydGNhZkI3?=
 =?utf-8?B?eE8ycFQ5ZGwza0NVTCt0ZVRlRXIvQjVwTVBCcm50V0dUOGdiZjVkdFViODRv?=
 =?utf-8?B?djAvOWRVSjBtS0dHREZsa1YzbHZ1aGpWWVdWTXRoZmVKSHR3NThBUFMzS0ph?=
 =?utf-8?B?alRqdHovVEV2UXBKVld5RndhZ2VSaldWSGpqRnE0UzExWlR1N3BSZFZia0RJ?=
 =?utf-8?B?VUpMN0F6VktUUVJaaW5iR3FiK0d3cnMralZvTG94RzdRK05YNzBNcnl3eTY4?=
 =?utf-8?B?SUNqTU8wVmhDdnlMUWtWVGQ0UmFpY1lhQjNodUFWMi9vcnNMSnVzQk1Jd1ZX?=
 =?utf-8?B?MGxBT0NMaTNFUjFMdm9UekVFUExNYXdNeTdpUEhxbWp0OGJveXNJMUJjUHg2?=
 =?utf-8?B?Ym9KN3NzUXRBRkdUeG13UzZBTnppa2dreGlGOGxMTE1aZjNSaHhpYkh5b1I1?=
 =?utf-8?B?b2gyQmFCR2FvNFM2MmtROG9oMHFGdUhjYm1kc1RUS0lmcUcvanBmSnhxeGY5?=
 =?utf-8?B?WTFwTWI1ZHRBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Snp0d2dlKzRIamkzU1dXaDR0WlQxd3FzUlZ2NHhLZVViY09wM3QxZ0k1S01u?=
 =?utf-8?B?U3NjNk5JVXl0akZweHBVQVl4UVNkWGRzWmdKTXljSFlqTS9mWHZmd0lPWGt3?=
 =?utf-8?B?ZXBMS2VUSVZXaTFvY3JnWFhXKzZFSXBvVmlra2xKY0dWSWg4TGFkbUp1VGlt?=
 =?utf-8?B?ZXMxVGZndjFSN0I0WXlFYkc2dHlVTGpPV3pWOGZ4WURjWUg3bFBvbDBLTTFX?=
 =?utf-8?B?OW5DL1k1eW5ZUDlVZVRsMWovRXpSMTl0OVJLN2pwdW13ckZ2RTV3R3RiMUNu?=
 =?utf-8?B?dWhYMUJaZ2Mzd092VkdCdFF5ZWZDWVZDVUFVMy8yRDB0czNuZElWN1dSTUVt?=
 =?utf-8?B?TUNRMmxWSks2RkRmRUVKc2RoTUV6RzhQVFh3KzNKaVJZR3UwWTFvb0NVbVlu?=
 =?utf-8?B?cURBM3lVWUJnSytKMEc5RnIwelp6K05nSFM3UE5VQVlXaTQwcHgxazcxdFZo?=
 =?utf-8?B?SHNraS83TVN5RnByNHZZdzZKaXMwd2xBWXljQkIvTDVmdXBWWVZNNWxmWk5O?=
 =?utf-8?B?YldSaVROOGMwRHI5ZWpPajhvU2ljalM2V0lZUDRoa3Z6dE5tQ0U5OUJubjl1?=
 =?utf-8?B?bnhvOWkzSDdzK3lFVXBJR0FaS0FqSEQzNHVVeThoL2xlUmRmczhvWExHSUdL?=
 =?utf-8?B?SEMrSWRaZFA2S1NoaFUyeHRxUXp2dDJnR0J5dFExQnFwZ3pRWTRLN0tDTW4z?=
 =?utf-8?B?R0xjWHpmU01yaGlxTVRVMzdSU0QwUDMrSFp0T2lyUnFULzZQUnZSd2pxOHZG?=
 =?utf-8?B?SFB6ZGNtZ2h6enhZbjJmVDgvTXFLeVYrenZsVm83TEVlY0NVMGVFZGVsV0x1?=
 =?utf-8?B?QmJpUmxyUEs2T01DWFR4dlU4cituVWZNR01EbUVXeDBnRnZCa25ZUVdXZ0Jv?=
 =?utf-8?B?RFk1N1AwY3A1TzYvMTdBK2VnbUp0WFlKaVAvY2RMeDU3clhncG04LzRSMjRR?=
 =?utf-8?B?cUZ2Y1NwYXcwbDkzWDdhdGRWdnF2WURUVktCSGtlS1pRNFJaZm91M2EwTEJ5?=
 =?utf-8?B?eUcvL0hHT0t4dStqdEEwQ0VkTkZoeGt5anV2Q2NZUFlyZDNKd3Z1bEF1RVc2?=
 =?utf-8?B?RGZaNllVV3d6RnZuZHF6SVNXQ0Y1WE9FV2U0RHJyZHBMSjRqdTJPaDF5aDlH?=
 =?utf-8?B?V3JTV2VibDEzZkhwejl2L1J5UU5uZzVvd2pQOEdxak5sQUdaTXk3K1h1Snpl?=
 =?utf-8?B?eU1mbjhzM2Evamt1bW1mcnJWQU9KcDJ2dGN0MFpMeVcvOHhaMDdzcXVlNHlq?=
 =?utf-8?B?NHJmQVlTZHFBalZFOFU2bndteGs5cjdEdlp3WHpBY1VHL3VBM3dta0tMQjIz?=
 =?utf-8?B?MDhyR3hQcHJpanlFRWxacnlLSHpvNWNSeS8xaVI0WmhRcDI5ZWp4MFBPUjU0?=
 =?utf-8?B?STdwZ3hxZXNOck5jb1VzRWE5UC9CL0dmYTRCY2RXclpzaGF3T0Z5NkRodG92?=
 =?utf-8?B?bHJ0MEZjVjFXUVJQZ3Y3cHNQYVlrbHhEcjFZODBWUytLV3BUZFRIai9zWXhq?=
 =?utf-8?B?QnRsU1k2aUlGTlBJUWdtSEhyVlZqNTQzVk96L3krQ1FVL3pnTTN5eXNPRVRr?=
 =?utf-8?B?YU01dzJ3ZHJiNE5Sa292aFN6RnRsdFlPQ3dURUlNVGN1MVpLTm41MktmRXZD?=
 =?utf-8?B?bDEwbDZlRnA4ditOUE81ZFdhMXBkM0JjSlNZbDdwdUtVUnNJdlQ0ZlN2YXhw?=
 =?utf-8?B?cjdNOHY0TXZlRWVkVHFjL0U4MUZOT040a09XVml6VjliN3pDWC9JdFR0R0lS?=
 =?utf-8?B?U0dWNHlkUEd3ZlpPMlVYVzRtbmhyV29MUTFibVNqQXFIRXd4SmY1TjRueGVO?=
 =?utf-8?B?WmkrUy9sOUJSN1RQSmd4WjBNQ3FMMElta1lpQ0xlbERGbmd0a042cDF1QTUy?=
 =?utf-8?B?ZGJyS2UvMFNMTG9EQ1dZYm12NkVuNjhoeTlmcGdOdG1ESHBSeENsa2xLRkV0?=
 =?utf-8?B?ZEpuYzlOSGZpbHNYZXRVdGtWV1pqYThGd2RONDFwVHFrLzhDTFkwb0RpS3VD?=
 =?utf-8?B?UzlYNWYvYmo1a1BkY0dTYW0vQmdtd1c5VHplV2hLTVdJUDc4amJBY2NtbEFm?=
 =?utf-8?B?N0E3NjkrTTJhV0x3SWlIcy9jRCtNd3pvZ2ZrckhzVUZYUlhhVmF4MVowR3Ji?=
 =?utf-8?B?Vk1jbFE5S1kyYkRRajBvdUwyMktqbFhBREF5Szd4WVI5SjlMU0xWajhDSXpu?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48DCC939A3A0EA4AB9927341206A1074@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 568bc601-19c9-49cd-fc63-08ddcdf0d0f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 16:07:13.7766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NiEbp46bB9aHsU0S//hUNpjczayAf4eMLvuw+Qd/87TkwgXZvWjtQ0fcYob73ESxDP64OjJStRuundVvK3WYXFohW50EGuSSUWokUjIma+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7634

DQoNCk9uIDcvMjgvMjUgMTE6MDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNS4wNy4yMDI1
IDIzOjM0LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBPbiA3LzIzLzI1IDE2OjU4LCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAyMy4wNy4yMDI1IDEyOjEyLCBEbXl0cm8gUHJva29w
Y2h1azEgd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+Pj4+ICsr
KyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+Pj4+IEBAIC0zNjAsNyArMzYwLDcgQEAgc3Rh
dGljIGFsd2F5c19pbmxpbmUgdm9pZCBzY2hlZF9zcGluX2xvY2tfZG91YmxlKA0KPj4+PiAgICAg
ICAgew0KPj4+PiAgICAgICAgICAgICpmbGFncyA9IF9zcGluX2xvY2tfaXJxc2F2ZShsb2NrMSk7
DQo+Pj4+ICAgICAgICB9DQo+Pj4+IC0gICAgZWxzZSBpZiAoIGxvY2sxIDwgbG9jazIgKQ0KPj4+
PiArICAgIGVsc2UgaWYgKCAodWludHB0cl90KWxvY2sxIDwgKHVpbnRwdHJfdClsb2NrMiApDQo+
Pj4NCj4+PiBTaW1pbGFybHksIG5vIG1hdHRlciB3aGF0IEMgb3IgTWlzcmEgbWF5IGhhdmUgdG8g
c2F5IGhlcmUsIGltbyBzdWNoIGNhc3RzIGFyZQ0KPj4+IHNpbXBseSBkYW5nZXJvdXMuIEVzcGVj
aWFsbHkgd2hlbiBvcGVuLWNvZGVkLg0KPj4gV2VsbCwgdGhpcyBmdW5jdGlvbiAnc2NoZWRfc3Bp
bl9sb2NrX2RvdWJsZScgaGFzIHRoZSBmb2xsb3dpbmcgZGVzY3JpcHRpb246DQo+PiAiSWYgbG9j
a3MgYXJlIGRpZmZlcmVudCwgdGFrZSB0aGUgb25lIHdpdGggdGhlIGxvd2VyIGFkZHJlc3MgZmly
c3QuIg0KPj4NCj4+IEkgdGhpbmsgaXQncyBzYXZlIHRvIGNvbXBhcmUgdGhlIGludGVnZXIgcmVw
cmVzZW50YXRpb25zIG9mICdsb2NrMScgYW5kDQo+PiAnbG9jazInIGFkZHJlc3NlcyBleHBsaWNp
dGx5IChjYXN0aW5nIHRoZSBwb2ludGVycyB2YWx1ZXMgdG8gYW4gaW50ZWdlcg0KPj4gdHlwZSku
IFdlIG5lZWQgdG8gZmluZCB0aGUgJ2xvd2VyIGFkZHJlc3MnLg0KPj4gQW55IHJpc2tzIGhlcmU/
DQo+IA0KPiBUaGVzZSBpbnN0YW5jZXMgb2YgY2FzdHMgYXJlIG9mIGNvbXBhcmFibHkgbGl0dGxl
IHJpc2ssIHllcywgYnV0IGFsbW9zdCBldmVyeQ0KPiBjYXN0IGNvbWVzIHdpdGggc29tZSByaXNr
LiBJZiBvbmx5IHRvIHNldCBhIGJhZCBwcmVjZWRlbnQgdGhhdCBzb21lb25lIHRoZQ0KPiBtb3Jl
IG9yIGxlc3MgYmxpbmRseSBjb3BpZXMuDQo+IA0KPiBCdXQgaW4gdGhlIGVuZCBpdCdsbCBiZSB0
aGUgc2NoZWR1bGVyIG1haW50YWluZXJzIHRvIGp1ZGdlIGhlcmUuDQo+IA0KPj4+PiAtLS0gYS94
ZW4vY29tbW9uL3ZpcnR1YWxfcmVnaW9uLmMNCj4+Pj4gKysrIGIveGVuL2NvbW1vbi92aXJ0dWFs
X3JlZ2lvbi5jDQo+Pj4+IEBAIC04Myw4ICs4Myw4IEBAIGNvbnN0IHN0cnVjdCB2aXJ0dWFsX3Jl
Z2lvbiAqZmluZF90ZXh0X3JlZ2lvbih1bnNpZ25lZCBsb25nIGFkZHIpDQo+Pj4+ICAgICAgICBy
Y3VfcmVhZF9sb2NrKCZyY3VfdmlydHVhbF9yZWdpb25fbG9jayk7DQo+Pj4+ICAgICAgICBsaXN0
X2Zvcl9lYWNoX2VudHJ5X3JjdSAoIGl0ZXIsICZ2aXJ0dWFsX3JlZ2lvbl9saXN0LCBsaXN0ICkN
Cj4+Pj4gICAgICAgIHsNCj4+Pj4gLSAgICAgICAgaWYgKCAodm9pZCAqKWFkZHIgPj0gaXRlci0+
dGV4dF9zdGFydCAmJg0KPj4+PiAtICAgICAgICAgICAgICh2b2lkICopYWRkciA8ICBpdGVyLT50
ZXh0X2VuZCApDQo+Pj4+ICsgICAgICAgIGlmICggYWRkciA+PSAodW5zaWduZWQgbG9uZylpdGVy
LT50ZXh0X3N0YXJ0ICYmDQo+Pj4+ICsgICAgICAgICAgICAgYWRkciA8ICAodW5zaWduZWQgbG9u
ZylpdGVyLT50ZXh0X2VuZCApDQo+Pj4NCj4+PiBDb25zaWRlcmluZyBmdXJ0aGVyIGNhc3RzIHRv
IHVuc2lnbmVkIGxvbmcgb2YgdGhlIHNhbWUgc3RydWN0IGZpZWxkcywgd2FzIGl0DQo+Pj4gY29u
c2lkZXJlZCB0byBhbHRlciB0aGUgdHlwZSBvZiB0aGUgc3RydWN0IGZpZWxkcyBpbnN0ZWFkPw0K
Pj4gVGhlcmUgYXJlIHByZXNlbnQgY2FzdHMgb2Ygc3RydWN0IGZpZWxkcyAndGV4dF9zdGFydCcg
YW5kICd0ZXh0X2VuZCcgaW4NCj4+IHRoZSBmaWxlICd4ZW4vY29tbW9uL3ZpcnR1YWxfcmVnaW9u
LmMnLg0KPj4NCj4+ICAgICAgICAgICBtb2RpZnlfeGVuX21hcHBpbmdzX2xpdGUoKHVuc2lnbmVk
IGxvbmcpcmVnaW9uLT50ZXh0X3N0YXJ0LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAodW5zaWduZWQgbG9uZylyZWdpb24tPnRleHRfZW5kLA0KPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBQQUdFX0hZUEVSVklTT1JfUldYKTsNCj4+DQo+PiBDaGFu
Z2luZyBmaWVsZHMgdHlwZSB0byAndW5zaWduZWQgbG9uZycgd2lsbCBnaXZlIHRoZSBvcHBvcnR1
bml0eSB0bw0KPj4gcmVtb3ZlIGNhc3RzIGZyb20gc291cmNlIGNvZGUgKG1lbnRpb25lZCBiZWZv
cmUpLA0KPj4gYW5kIHJlbW92ZSAnKHZvaWQqKScgY2FzdHMgZnJvbSBoZXJlOg0KPj4NCj4+ICAg
ICAgICAgICBpZiAoICh2b2lkICopYWRkciA+PSBpdGVyLT50ZXh0X3N0YXJ0ICYmDQo+PiAgICAg
ICAgICAgICAgICAodm9pZCAqKWFkZHIgPCAgaXRlci0+dGV4dF9lbmQgKQ0KPj4NCj4+IFVuZm9y
dHVuYXRlbHkgdGhlcmUgYXJlIHBsYWNlcyB3aGVyZSB0aGVzZSBmaWVsZHMgYXJlIGluaXRpYWxp
emVkLCBzbw0KPj4gY2FzdCB0byB0aGUgJ3Vuc2lnbmVkIGxvbmcnIHNob3VsZCBiZSB0aGVyZS4N
Cj4+IEV4YW1wbGU6DQo+PiAgICAgICAudGV4dF9zdGFydCA9IF9zaW5pdHRleHQsDQo+PiAgICAg
ICAudGV4dF9lbmQgPSBfZWluaXR0ZXh0LA0KPj4gYW5kDQo+PiAgICAgICAudGV4dF9zdGFydCA9
IF9zaW5pdHRleHQsDQo+PiAgICAgICAudGV4dF9lbmQgPSBfZWluaXR0ZXh0LA0KPj4NCj4+IHdo
ZXJlDQo+PiAgICAgICBleHRlcm4gY2hhciBfc2luaXR0ZXh0W10sIF9laW5pdHRleHRbXTsNCj4+
ICAgICAgIGV4dGVybiBjaGFyIF9zdGV4dFtdLCBfZXRleHRbXTsNCj4+DQo+PiBTbywgbXkgcHJv
cG9zaXRpb24gaXMgdG8gYWRkIGNhc3QgdG8gJ3Vuc2lnbmVkIGxvbmcnIGFzIEkgcHJvcG9zZWQg
aW4NCj4+IHRoaXMgcGF0Y2guDQo+IA0KPiBNeSB0YWtlIGlzIHRoYXQgdGhlIHNvbHV0aW9uIHdp
dGgsIHVsdGltYXRlbHksIGZld2VyIGNhc3RzIG92ZXJhbGwgd2FudHMgdXNpbmcuDQo+IFBsdXMg
bXkgcGVyc29uYWwgdmlldyBpcyB0aGF0IGNhc3RzIGluIGluaXRpYWxpemVycyBhcmUgYSBsaXR0
bGUgbGVzcyAiYmFkIi4NCj4gDQo+IEphbg0KDQpBcyBmb3IgbWUgdGhlIGZvbGxvd2luZyBjaGFu
Z2VzIGxvb2sgbm90IGdvb2QgKGlmIGNoYW5nZSBzdHJ1Y3QgaXRlbSANCnR5cGUgdG8gJ3Vuc2ln
bmVkIGxvbmcnKS4NCkp1c3QgY29kZSBzbmlwcy4NCg0KLSAgICBjb25zdCB2b2lkICp0ZXh0X3N0
YXJ0Ow0KLSAgICBjb25zdCB2b2lkICp0ZXh0X2VuZDsNCisgICAgdW5zaWduZWQgbG9uZyAgICB0
ZXh0X3N0YXJ0Ow0KKyAgICB1bnNpZ25lZCBsb25nICAgIHRleHRfZW5kOw0KDQotICAgIGNvbnN0
IHZvaWQgKnJvZGF0YV9zdGFydDsNCi0gICAgY29uc3Qgdm9pZCAqcm9kYXRhX2VuZDsNCisgICAg
dW5zaWduZWQgbG9uZyAgICByb2RhdGFfc3RhcnQ7DQorICAgIHVuc2lnbmVkIGxvbmcgICAgcm9k
YXRhX2VuZDsNCg0KDQotICAgIHJlZ2lvbi0+dGV4dF9zdGFydCA9IHBheWxvYWQtPnRleHRfYWRk
cjsNCi0gICAgcmVnaW9uLT50ZXh0X2VuZCA9IHBheWxvYWQtPnRleHRfYWRkciArIHBheWxvYWQt
PnRleHRfc2l6ZTsNCisgICAgcmVnaW9uLT50ZXh0X3N0YXJ0ID0gKHVuc2lnbmVkIGxvbmcpcGF5
bG9hZC0+dGV4dF9hZGRyOw0KKyAgICByZWdpb24tPnRleHRfZW5kID0gKHVuc2lnbmVkIGxvbmcp
KHBheWxvYWQtPnRleHRfYWRkciArIA0KcGF5bG9hZC0+dGV4dF9zaXplKTsNCg0KDQotICAgICAg
ICByZWdpb24tPnJvZGF0YV9zdGFydCA9IHBheWxvYWQtPnJvX2FkZHI7DQotICAgICAgICByZWdp
b24tPnJvZGF0YV9lbmQgPSBwYXlsb2FkLT5yb19hZGRyICsgcGF5bG9hZC0+cm9fc2l6ZTsNCisg
ICAgICAgIHJlZ2lvbi0+cm9kYXRhX3N0YXJ0ID0gKHVuc2lnbmVkIGxvbmcpcGF5bG9hZC0+cm9f
YWRkcjsNCisgICAgICAgIHJlZ2lvbi0+cm9kYXRhX2VuZCA9ICh1bnNpZ25lZCBsb25nKShwYXls
b2FkLT5yb19hZGRyICsgDQpwYXlsb2FkLT5yb19zaXplKTsNCg0KDQotICAgIC50ZXh0X3N0YXJ0
ID0gX3N0ZXh0LA0KLSAgICAudGV4dF9lbmQgPSBfZXRleHQsDQotICAgIC5yb2RhdGFfc3RhcnQg
PSBfc3JvZGF0YSwNCi0gICAgLnJvZGF0YV9lbmQgPSBfZXJvZGF0YSwNCisgICAgLnRleHRfc3Rh
cnQgPSAodW5zaWduZWQgbG9uZylfc3RleHQsDQorICAgIC50ZXh0X2VuZCA9ICh1bnNpZ25lZCBs
b25nKV9ldGV4dCwNCisgICAgLnJvZGF0YV9zdGFydCA9ICh1bnNpZ25lZCBsb25nKV9zcm9kYXRh
LA0KKyAgICAucm9kYXRhX2VuZCA9ICh1bnNpZ25lZCBsb25nKV9lcm9kYXRhLA0KDQoNCi0gICAg
LnRleHRfc3RhcnQgPSBfc2luaXR0ZXh0LA0KLSAgICAudGV4dF9lbmQgPSBfZWluaXR0ZXh0LA0K
KyAgICAudGV4dF9zdGFydCA9ICh1bnNpZ25lZCBsb25nKV9zaW5pdHRleHQsDQorICAgIC50ZXh0
X2VuZCA9ICh1bnNpZ25lZCBsb25nKV9laW5pdHRleHQsDQoNCg0KLSAgICAgICAgaWYgKCAodm9p
ZCAqKWFkZHIgPj0gaXRlci0+dGV4dF9zdGFydCAmJiAgIDw8PDw8IEFjdHVhbGx5IHRoZSANCnZp
b2xhdGlvbiB3YXMgb25seSBoZXJlDQotICAgICAgICAgICAgICh2b2lkICopYWRkciA8ICBpdGVy
LT50ZXh0X2VuZCApICAgIDw8PDw8PCBhbmQgaGVyZQ0KKyAgICAgICAgaWYgKCBhZGRyID49IGl0
ZXItPnRleHRfc3RhcnQgJiYNCisgICAgICAgICAgICAgYWRkciA8ICBpdGVyLT50ZXh0X2VuZCAp
DQoNCg0KLSAgICAgICAgbW9kaWZ5X3hlbl9tYXBwaW5nc19saXRlKCh1bnNpZ25lZCBsb25nKXJl
Z2lvbi0+dGV4dF9zdGFydCwNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodW5z
aWduZWQgbG9uZylyZWdpb24tPnRleHRfZW5kLA0KKyAgICAgICAgbW9kaWZ5X3hlbl9tYXBwaW5n
c19saXRlKHJlZ2lvbi0+dGV4dF9zdGFydCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWdpb24tPnRleHRfZW5kLA0KDQoNCg0KICAgICAgICAgIGlmICggcmVnaW9uLT5yb2Rh
dGFfc3RhcnQgKQ0KLSAgICAgICAgICAgIG1vZGlmeV94ZW5fbWFwcGluZ3NfbGl0ZSgodW5zaWdu
ZWQgbG9uZylyZWdpb24tPnJvZGF0YV9zdGFydCwNCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpcmVnaW9uLT5yb2RhdGFfZW5kLA0KKyAgICAgICAg
ICAgIG1vZGlmeV94ZW5fbWFwcGluZ3NfbGl0ZShyZWdpb24tPnJvZGF0YV9zdGFydCwNCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnaW9uLT5yb2RhdGFfZW5kLA0KDQoN
Ci0gICAgICAgIG1vZGlmeV94ZW5fbWFwcGluZ3NfbGl0ZSgodW5zaWduZWQgbG9uZylyZWdpb24t
PnRleHRfc3RhcnQsDQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVk
IGxvbmcpcmVnaW9uLT50ZXh0X2VuZCwNCisgICAgICAgIG1vZGlmeV94ZW5fbWFwcGluZ3NfbGl0
ZShyZWdpb24tPnRleHRfc3RhcnQsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVnaW9uLT50ZXh0X2VuZCwNCg0KDQogICAgICAgICAgaWYgKCByZWdpb24tPnJvZGF0YV9zdGFy
dCApDQotICAgICAgICAgICAgbW9kaWZ5X3hlbl9tYXBwaW5nc19saXRlKCh1bnNpZ25lZCBsb25n
KXJlZ2lvbi0+cm9kYXRhX3N0YXJ0LA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAodW5zaWduZWQgbG9uZylyZWdpb24tPnJvZGF0YV9lbmQsDQorICAgICAgICAgICAgbW9k
aWZ5X3hlbl9tYXBwaW5nc19saXRlKHJlZ2lvbi0+cm9kYXRhX3N0YXJ0LA0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZWdpb24tPnJvZGF0YV9lbmQsDQoNCg0KSGVyZSBh
cmUgcnVuLXRpbWUgY2FzdHMsIGFuZCBlc3BlY2lhbGx5IEkgZG9uJ3QgbGlrZSB0aGlzICdpZicg
c3RhdGVtZW50czoNCiAgJ2lmICggcmVnaW9uLT5yb2RhdGFfc3RhcnQgKScgYW5kICdpZiAoIHJl
Z2lvbi0+cm9kYXRhX3N0YXJ0ICknLg0KDQpJdCBpbnRlbmRlZCB0byBiZSBOVUxMIHB0ciBjaGVj
aywgYnV0IG5vdyBpdCdzIG5vdC4NClByb2JhYmx5IGl0IHdpbGwgd29yayBhcyBleHBlY3RlZCwg
YXNzdW1pbmcgdGhlc2UgaW50ZWdlciB2YWx1ZXMgYXJlIA0KemVybywgYnV0IEknbSBub3Qgc3Vy
ZSBhdCBhbGwuDQoNCkRteXRyby4=

