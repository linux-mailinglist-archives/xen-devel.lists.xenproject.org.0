Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262EFB01B82
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 14:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040853.1412136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaCYt-00056B-Ps; Fri, 11 Jul 2025 12:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040853.1412136; Fri, 11 Jul 2025 12:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaCYt-000541-MR; Fri, 11 Jul 2025 12:09:07 +0000
Received: by outflank-mailman (input) for mailman id 1040853;
 Fri, 11 Jul 2025 12:09:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D5XY=ZY=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uaCYs-00052J-BC
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 12:09:06 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6b222ea-5e4f-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 14:09:04 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GVXPR03MB10609.eurprd03.prod.outlook.com (2603:10a6:150:21c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 12:09:02 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Fri, 11 Jul 2025
 12:09:02 +0000
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
X-Inumbo-ID: d6b222ea-5e4f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yi0L/jLrGp/u1d2upgDEA6BLGmBlvEk96Qzx0whMqoXBwoW417q8vcN4w+9khc86NUzj6D82rqLZICKaiCPGqrM0MHjXiFe4nA5LYqWLi8Gyny6JpZl+9ieRYP9/8UFnVSO7vJ7vRJpRK3lcA+botxAL8GfnScHyL84d/rld0xy5uxen+MUErqr6401N6smKKwhdPUPfSfmBzKuZZyOh1W69UHAsdGwOzVvV4VEcK36yei3gzyvxIjEDAxXqBnwlB+FRu8QFCcKLnlH0qiZ02XQBiQ/D8GOVGSxYngv1jmvv+empIgRzKjt7LrKvnLg3R4nxqJs7QIVrOgW7Gofv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBy1AoOakJN4+RRJYznmGeGusmfksTKMp5H7bPh96/U=;
 b=quXVFK3gMElb5lM8TDLsKVMDdHsiXnpvbEu+PtH+5IMwdYVxt4N5W303EnaexCEQhrxGSW9pvvEJodZJ7cfa0PlAURm1YQRkbYodRVMvgq+pRSaWOrzsO2OmazxBH33+xAYoRZIi3H+jcnaATAAT3xB1l3KwXPK4rjIJED1zTzVYcXPaOMVym69XfnMIo/d+AEie50bqqqihjAPimb7JaEfEJE0QEsFDzyy+poiV9YLaHpqadkNJC+9Iel/R0yorSXa9rvDZIkhAr28k/Gj3IuNHkZfe2FPcztDwkB1Z6XwG4V0w4evgr/1wpp1BGysI3ekK9p0eLVqj7octN5RAFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBy1AoOakJN4+RRJYznmGeGusmfksTKMp5H7bPh96/U=;
 b=ap7LbcBL+sdHwRUFjX9oGUFti0WZGrIKJp0BB9uKE2r18tRYHLVMMTkCAauVwNBk0XIBxooS9YhnquNBRrIWmPHf2q1pAvshnWt4UR11P/q4/zBwcKl5Sgji5xYEy4vLX71G0lKmJdsTWZ5oDMNCtTf9ATApv+6ozxEZWiGEUGe3BkA2ouKe7RS1KzI/Hn7S/rpZoa5A1wEhkJbV3F9GFqOzgg5W/x3VX9zRBFfJTS0agPNucacHOjciVzc82nVpP1rWl1CGltpJyjR+PY/oxArLIm3Fa9IYZb60P36cUAzIBEC27Op6UDhpdvYg1QheUbhFqub0mXOKPMZudXfEAg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v2] misra: address violation of MISRA C Rule 10.1
Thread-Topic: [XEN PATCH v2] misra: address violation of MISRA C Rule 10.1
Thread-Index: AQHb8lj8U0c0yIOr5EqfSUQdGwVgzbQs0wmAgAABcYA=
Date: Fri, 11 Jul 2025 12:09:02 +0000
Message-ID: <abedffbe-fd46-4873-b38b-496a679b345a@epam.com>
References:
 <41538b6b19811eb74c183051d3e7a4fd216404e6.1752232902.git.dmytro_prokopchuk1@epam.com>
 <f88e729e-5373-473d-904f-c878bd8ce158@suse.com>
In-Reply-To: <f88e729e-5373-473d-904f-c878bd8ce158@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GVXPR03MB10609:EE_
x-ms-office365-filtering-correlation-id: e701134a-b1da-4020-da47-08ddc073b964
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|42112799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NmZtcGFNYmxxT0pNaXhkQzZpM1ZLVlBraGl0TDhaN285Y21vWHVMeXg5UmEv?=
 =?utf-8?B?bit4M3FDa08rYm1talFUc0g4RWtwckdrVkFodk1kVlUyQmZITGNzUzltSVVP?=
 =?utf-8?B?ZVJhQmplZUtGMjdnakdNUVJoNjRnR2x5MGdERGhZbWlJZ2xVQVN2OE9nNjcx?=
 =?utf-8?B?ZC9jMnZaMGZ0NTVLM0VzbkxrQ3FUZ1R4amNuTHlodU5DVWorQWJGYUc3YlFX?=
 =?utf-8?B?cFEzOTFOV2l6TnhKK01ZUUJTRkRYaE1GblV3Y0JmWFAyQTYwbXh3M1VLeXBz?=
 =?utf-8?B?OTlOdy94dEFabVVQNTIyQkxhMWwyanVFK1FEUDkvbjAyUzZxRzNzcVpWQWRF?=
 =?utf-8?B?TmRaSWhhbEE5VHQvNlFOdEREeGlxQitubWI3ZUdxaDhMZ3U1UGFnejNFRk5Y?=
 =?utf-8?B?Zmw4SHgzd1N4Z2RMUGgrYjN6aDRPa1krWGhBUTlqT3RpWlpNVXB0NldDWG51?=
 =?utf-8?B?clBmYm9tbm1SdUVhWmtpU0lydUs4cWhxVHNzU2h1VGRTMWFTd2QvN1R4S3dX?=
 =?utf-8?B?elZtY3J5Mk4zYWZwUy8yTkR5Ry9RLytzWXhmRitzM3Zud2w3SmlESDRDRytK?=
 =?utf-8?B?VEoyeVNYd0pEZXhyb1dPOW1GemMwalUxbE5tMktOWWV2Y0tka09wVWs4MkI1?=
 =?utf-8?B?ZDE1NGp6RDZxa2FxUTJUbGwxYnRMb0phcDlWbVVyTHpMOWlvcTdITStBd0Jv?=
 =?utf-8?B?anJwTzkyYkFTaUxkZWpUb1R2V3UrRTRZYmk3Wm0vdzYraWM1bi9pRkJCckls?=
 =?utf-8?B?SWd1VTRzNWVTWkoydXZ3dlcveURoQzZMeXVaZXc2TnF5eGlvZWdsa3lCZURt?=
 =?utf-8?B?NHFDK2ZZYUtPdEVuV2dLTUZYRnlZU25zaUk1QnBRVm9MTHJaQ3Bsd1BWNXhO?=
 =?utf-8?B?aTdXSGJMdytZSVRJRlJJR3lWRjg3N2I5dWpha3RRS1F2cklUOWNwVGh3T2th?=
 =?utf-8?B?aWVRb1cvSS8wVUhCZ0dDbG1jYnFyUm5BVEFQbWtSR3hMcUVPNnN6a3o2OU5K?=
 =?utf-8?B?Zis1QjdkbEZNWENNc0pTdGx4ajlJRG12bUlSTks2RGR1eUpjM0luem9tSnF5?=
 =?utf-8?B?MjVPaGU3cWRqTEY4NjFmdUNUMUFsMWdnRXlMNlJ1Z2lTYURwd04wYll2V2Qr?=
 =?utf-8?B?RjdESHNHOFN5S2g1V1JGaDZFK2VyUTNFNFZWc3NWcHRseUxxeHlpVlFSNWhz?=
 =?utf-8?B?ODBReHRuYUpBUmcwc3FLUUVZb1R5K004emxRWnhrN2RzZUxGZm15Ny9Wa0pr?=
 =?utf-8?B?SSthajJHdHBBZ3Uxam81d1M0NjlVN1ZHMkJQdit2Y24rQ2JpeklPYmpXV21C?=
 =?utf-8?B?bjVCMno4VDNFRkNtRUo2MXRRa3ZVZUhUWEpvbmJCdXdsMEtmdXFVTi9abW1w?=
 =?utf-8?B?dHVXNXlRQ3B0YWttODVtOFpvMld1eVI1ZEVHNFZ0NWp5VFB5MkZybERRS2V1?=
 =?utf-8?B?S1pJNVFDbm13K0xlSlhITmZqWVA1UCtGWnlpaW9zZ0dlNGs0M2lUZjQraDBY?=
 =?utf-8?B?V1BOQTdLOHFIZnBrMzJqZCtvQi9lUE5Bb09qWWxobDlnQ3FtL1RSckloMzdW?=
 =?utf-8?B?SWdMQXdqUDFNSEVPU29xS1puODlMSXR4M2xxZ3B5Q2RUVW42ZjJQSVkrcDBE?=
 =?utf-8?B?a0N3M3RUYUZodDgwMW1CL2IwcHpxQ3ZQUUNUUkpWVFJta3MrK1VVOGRLOURn?=
 =?utf-8?B?ck1XVENxWmpPTitlZllTU2kvUmpZY1llUTV2SklqdWtkeldQTXVSS1NSZlJn?=
 =?utf-8?B?TnVGYkszeWRjZDJ5aEZxU0JzVDFQZElIMS8yS1ZZUW9WY1Q3Q0ZiNjlBcTFt?=
 =?utf-8?B?T1JUTmFXcllHZ1Y3aGVlTHRPMHR0dVZwZVpOMitYNGU2U3NBcGZZbEE0dEtL?=
 =?utf-8?B?TnRNR0tQNG1NeEE0WTJNdHdoaTNpeVlJVnBIMjRoT3ppVVk1S3RnMGJ2U0Zw?=
 =?utf-8?B?UW4wQTcvYlF0ZU1JbGpTRFB2U3g2bDUzdTBBRWVmUERwV0w4ZGZPOTlJTHlp?=
 =?utf-8?B?MW0vVHlCaVJBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(42112799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Tkl1TTU4amxOSitVUzNyTk92Z3N6QnBBQytYaTB4U3FnblpkLytSVjhjMFZH?=
 =?utf-8?B?MEtYaE1xSEhzTFh3MTMrZzgvUTA0NFRrRmlabGhINmFXTEU5YS9GODFUQmdp?=
 =?utf-8?B?em9pbzJpdm1NdGh5L1NaWldHaUkwODlBekVRVTNJaUxtZGJhcVNuMVNwRFVy?=
 =?utf-8?B?KzNtblNXZ3dhQk55Q0tHdWxZZjF5M2ZNSURxUUpYdk4yYWhYckRvdm4reWJx?=
 =?utf-8?B?c29OOVpiZS9DRi96bkM0RWVEMTZibytlWjR5U3U4RDBuTWdYR0xWQkFWTGQ3?=
 =?utf-8?B?eTd3UHR3YkQ0WWZTMlZsZWR5Q29reUt4cmNlVlVTU2xiZXA3NEt2alNrVDhF?=
 =?utf-8?B?S1VxRlJpanBoYmloMG9tM2dRZGhON01rZjBzMUNheWRrTGpsaWYrMW5aZlJw?=
 =?utf-8?B?TFpScnVHTU9xNVpTcittcDgyQm9PZFl1SzR6UzcrTklTcVc0WUJtYnRIaGor?=
 =?utf-8?B?bUlDSnYycmNLc3pscW9hdEgxZTZuZDRoR3hqYklCVXNIa1laamtRSFcwdGVF?=
 =?utf-8?B?dE5IZ2FZOUJ1b2dPbE1BMnBmb1NNM0hPRS9acjJvQTAyQW5FRGRGZEpmOUdR?=
 =?utf-8?B?bHlwcmxQRDBvRXhpZm5KTXZ6dEwraG9PZDdoU0txOEtpRzVXUWF4UlN0YzB3?=
 =?utf-8?B?VXk2b0czZUpFRk84MWVLcXZtNHdmUnViV2tMN1RRSjNHOEh1cngvYVQ2dWhZ?=
 =?utf-8?B?L2xYTjN0OTh4Z2luWmQrZ285N04yMVorSVVuYWE3MGF0eHBGUGRFN3ptS2NC?=
 =?utf-8?B?YlNRa0FnTnIzdWNCRmRRUkhhM2x0dzl3K0hOcEVVUjM5WUlVa2o0SnU1M1RD?=
 =?utf-8?B?L1dPL3hhWkFSUzdjSFFXVHlVNnFjRzkwSzVPK1l5aU1Lcm1tc1I3UzhUWmdS?=
 =?utf-8?B?dUlnRUJLUjRWMEczSHFBWm1GUHU4ZmlxemZBdFBycGpPM3FSQ1g1NU1rdGY5?=
 =?utf-8?B?OTdmWjFnRkpETURkK3d1SHJzM09KQ2lpRHhOSElNMi9PVmYvMi80OW03M1FH?=
 =?utf-8?B?cllaNDd2NzBjckRadkZOWm9jNjBpQ25Wc1lYamRNcW9nd3JpdlFhNEZTd1NR?=
 =?utf-8?B?a1FaQ2FGWDhRQThjUHc2TkYvZWljL2FuanBoYWdKY2k5T1NHUDE1TVhZTlda?=
 =?utf-8?B?NHVZQ2xrQktqWmlvaTRpdm4zVFBQaXdCQW5xQlE5M1BZdHVqV3NOSk44Y0hn?=
 =?utf-8?B?eXNWdmFpVFpyZEQxT2ZqTnMvek8vdFgvODFIdHk3QUh6c0dkakxFUlQvTkJD?=
 =?utf-8?B?bEZxQlRYSXJVei9kMnNyUFV3V2ZIVFRqelZDS1lxVnBHVGtvQ0V5dThNY2tM?=
 =?utf-8?B?MWY3Umk5WWFtZk9hR1BucWsvQ2s1RE14WGdCK0lnUVdtQ2dwbi93TVpOa3Vz?=
 =?utf-8?B?NG9qVDhKa1NQRnBJYi80MCthR2dyZzJtZU13eHp3TkorTTVpY1k5QjR2ZzVm?=
 =?utf-8?B?MzUweEhBRVp5Wm1zclhFMzgyaEtKTS9WaTBhMWcyYzZZbWd1eVZZNlBmM1ZD?=
 =?utf-8?B?MThsaEdiL25GZzlGelZzY2wrR0t0ZWEyWlB4RGRRK3pTZkpVc3pxYU1HcWEr?=
 =?utf-8?B?SjNDOVVZaUFGM1JYWXBqQWs2b2ZjeFVNaUZadTRTQmFxbWZQajVnaWVNUndk?=
 =?utf-8?B?TktQdnRLeFNjU0JHM3kvUGd1NjgxYzVoY09sMk1DOEl5OEVkcnV2dDcvcEZw?=
 =?utf-8?B?N1dWTEtLNDhMYlVyYWFsSXNpeUFRMFVzQ000enYzczhCWkkydkF2TGVOeXo1?=
 =?utf-8?B?MlNoZ3VYVTQ0d2hwOEw1SUhRT1Y0OE5MYm8raStoQ0VrT21ObU54aFB6REtx?=
 =?utf-8?B?ODUwT0JkdVpnSlFwUU54RkZKejNEbVJ6c2I0YjdTV3FadEFYSDlZd1I3NE96?=
 =?utf-8?B?UmdtbWt5Ymc1Z0pJK2dubnYrY0FLdmd3MTlreDZrNUdjL1J4WFVlQlNDekFi?=
 =?utf-8?B?c1RTRmRQR0VEckI1eGRrcSsvV1ZseExqOUpCd09nTUVra2poMHoveGl5SXZl?=
 =?utf-8?B?RmxSUTR1SXVhTVd2RFZxRzVJdTBlS2Vrb3Z2eWJ2SDB5bktBVHRsZmNnMGRj?=
 =?utf-8?B?eG5SZUQ4ZFhRaTJTUnpvQmo4NnY1dmtGNUVpbU1kMFQrczlvOXUwckRCU1VY?=
 =?utf-8?B?VGZvcmVDeUljRUdobDhkMkVyODdNNHp2QkJhL1VJRmdUUHEzLytGRmpKSEc5?=
 =?utf-8?B?b3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C18B0C11116284479FF7169EE589F382@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e701134a-b1da-4020-da47-08ddc073b964
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 12:09:02.0244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4dlI3DkHvKbtq7pDav6WCV/kK0Vm60FcID7umCc+e3xgXoa/ZwZcT0IfRKJkGZk+zf4OWFlZgsIQUIrChBskK9tLf3NxnCvsFYdycHwW/OA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10609

DQoNCk9uIDcvMTEvMjUgMTU6MDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4wNy4yMDI1
IDEzOjQzLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiAtLS0gYS94ZW4vY29tbW9uL21l
bW9yeS5jDQo+PiArKysgYi94ZW4vY29tbW9uL21lbW9yeS5jDQo+PiBAQCAtNzczLDcgKzc3Myw3
IEBAIHN0YXRpYyBsb25nIG1lbW9yeV9leGNoYW5nZShYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhl
bl9tZW1vcnlfZXhjaGFuZ2VfdCkgYXJnKQ0KPj4gICANCj4+ICAgICAgICAgICAgICAgICAgIG5y
c3Bpbl9sb2NrKCZkLT5wYWdlX2FsbG9jX2xvY2spOw0KPj4gICAgICAgICAgICAgICAgICAgZHJv
cF9kb21fcmVmID0gKGRlY19jb3VudCAmJg0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIWRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKGQsIC1kZWNfY291bnQpKTsNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICFkb21haW5fYWRqdXN0X3RvdF9wYWdlcyhkLCAt
KGxvbmcpZGVjX2NvdW50KSk7DQo+IA0KPiBIZXJlIGFuZCBlbHNld2hlcmUgSSBjb250aW51ZSB0
byB0aGluayB0aGF0IHdlIHdvdWxkIGJldHRlciBhdm9pZCBjYXN0cw0KPiBpbiBzdWNoIGNhc2Vz
IGFzIHdlbGwsIGp1c3QgbGlrZSB3ZSB0cnkgdG8gbWluaW1pemUgdGhlaXIgdXNlIGV2ZXJ5d2hl
cmUNCj4gZWxzZS4NCkdvdCBpdCENCg0KPiANCj4+IC0tLSBhL3hlbi9jb21tb24vdGltZS5jDQo+
PiArKysgYi94ZW4vY29tbW9uL3RpbWUuYw0KPj4gQEAgLTg0LDcgKzg0LDcgQEAgc3RydWN0IHRt
IGdtdGltZSh1bnNpZ25lZCBsb25nIHQpDQo+PiAgICAgICB9DQo+PiAgICAgICB0YnVmLnRtX3ll
YXIgPSB5IC0gMTkwMDsNCj4+ICAgICAgIHRidWYudG1feWRheSA9IGRheXM7DQo+PiAtICAgIGlw
ID0gKGNvbnN0IHVuc2lnbmVkIHNob3J0IGludCAqKV9fbW9uX2xlbmd0aHNbX19pc2xlYXAoeSld
Ow0KPj4gKyAgICBpcCA9IChjb25zdCB1bnNpZ25lZCBzaG9ydCBpbnQgKilfX21vbl9sZW5ndGhz
W19faXNsZWFwKHkpID8gMSA6IDBdOw0KPiANCj4gSWYgYW4gZXhwcmVzc2lvbiBpcyBuZWVkZWQg
aGVyZSwgSSdkIHN1Z2dlc3QgdG8gdXNlICEhLCBhcyB3ZSBoYXZlIGluDQo+IChsdWNraWx5IGRl
Y3JlYXNpbmcpIG51bWJlciBvZiBwbGFjZXMgZWxzZXdoZXJlLiBQZXJzb25hbGx5IEkgZG9uJ3QN
Cj4gdW5kZXJzdGFuZCB0aG91Z2ggd2h5IGEgYm9vbGVhbiBjYW5ub3QgYmUgdXNlZCBhcyBhbiBh
cnJheSBpbmRleC4NCj4gDQo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21t
dS12My5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jDQo+
PiBAQCAtMzE1LDcgKzMxNSw3IEBAIHN0YXRpYyBpbnQgcXVldWVfcG9sbF9jb25zKHN0cnVjdCBh
cm1fc21tdV9xdWV1ZSAqcSwgYm9vbCBzeW5jLCBib29sIHdmZSkNCj4+ICAgDQo+PiAgIAl3aGls
ZSAocXVldWVfc3luY19jb25zX2luKHEpLA0KPj4gICAJICAgICAgKHN5bmMgPyAhcXVldWVfZW1w
dHkoJnEtPmxscSkgOiBxdWV1ZV9mdWxsKCZxLT5sbHEpKSkgew0KPj4gLQkJaWYgKChOT1coKSA+
IHRpbWVvdXQpID4gMCkNCj4+ICsJCWlmIChOT1coKSA+IHRpbWVvdXQpDQo+PiAgIAkJCXJldHVy
biAtRVRJTUVET1VUOw0KPiANCj4gSG93IGRvZXMgdGhpcyBjaGFuZ2UgZml0IGhlcmU/DQo+IA0K
PiBKYW4NCg0KaWYgKChOT1coKSA+IHRpbWVvdXQpID4gMCkNClJlc3VsdCBvZiAiKE5PVygpID4g
dGltZW91dCkiIGlzIEJvb2xlYW4sIHNvIHdlIGhhdmUgY29tcGFyaXNvbiBCb29sZWFuIA0Kd2l0
aCBOdW1lcmljIHZhbHVlLg0K

