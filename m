Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E5EA49C41
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 15:41:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898778.1307270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to1XV-00061I-PW; Fri, 28 Feb 2025 14:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898778.1307270; Fri, 28 Feb 2025 14:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to1XV-0005z1-Mk; Fri, 28 Feb 2025 14:40:33 +0000
Received: by outflank-mailman (input) for mailman id 898778;
 Fri, 28 Feb 2025 14:40:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXoc=VT=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1to1XU-0005yM-Ni
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 14:40:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20607.outbound.protection.outlook.com
 [2a01:111:f403:2613::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5bda88c-f5e1-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 15:40:31 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS2PR03MB9224.eurprd03.prod.outlook.com
 (2603:10a6:20b:5fe::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 14:40:29 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8489.019; Fri, 28 Feb 2025
 14:40:28 +0000
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
X-Inumbo-ID: f5bda88c-f5e1-11ef-9aaf-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AT5N/xrVRCvxe57curiO0taWEDI1AVqu1Bo3V9BisNL/oAtFg64iXPqir/mFpODNEoCSJq1BuG5TiajS0oZz8cmjgMpC1GrbSUrgr2QokWG/GawImp+pujGQov3/AsvJSEvkP9nFF7S1bF0PsznTb+6pVgTCyshZjkKdWUfAsMZ57HhIBSN90Zh7oVdjbZtyX8NmgyyfM6farpGnNerFjoDRcExlUOQtdT5elpBa3V5NP3BaRM6WEi6IEQmqx4qFYRuw9iyI8cFPeALfWp+p00XtIedAKUSRCULnu+DD0ZRE+cZMz9XiBwWzWJcjxVckOAG8HUKUiK52gwdF+OxmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BG7ZV2KxvzaYhSGnlIKY6PasTLDjRnsspTXgVhkq3c=;
 b=KlcPYNwJ+5zS4aAjF0LrB7hdFIcbZBLjkRH5pY1hb/er9ptEYTUf+sGYrGfLOAoMf69puQKARimel14aUiREEvg2RwgoZ+qWAK7dwZwUUmEVPIPC50WIkj3TeqO+Fru9V6+ENcEVjlWWUGIy6I37NJtV/zZqAGmfu/Yjqqffek9iYjESa3Fz+ETVDkBBb/D8ftmhuiKOxiMETGfg2OYzalQvsWDw7hAWj8fwBxH9ZTPgjS7jDKPwvOMFnNo9Je1lFMEBc4XGoWVqareTV4sAMx1u3nl7jmNKQFKyIlHkIvqvkTX1kHVZpPSEyZzeQXZ8r+ilstDW7Lx6qz9O2cDWZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BG7ZV2KxvzaYhSGnlIKY6PasTLDjRnsspTXgVhkq3c=;
 b=hmcVmSPAdFBcyQzZ82YSboRC2Tc6RTR5guyqUK35sjkU6j3OjUScWxQBMYZABsJVyv3TkfQCXSwOaG+BattiU82ayWRM1HXI5yw8Ebca2PnPdz8uX6HcuDFyRbz+DtfpTHofWZa+9jMGNUQw8VwDddjOgAC1JlQR3PktNzco5WWDKaJa7g8oL0Vp0Pz9RcSEQi2h3OmBTB6dFlz63l15fiZIcJlGMgP1SWRVF431du5yr42nBiJAYUQlrl9SKtwafOnG5eMsw4Gzr2zniZu48RDmf9XEL8NCzTJD2c0FJs/TWShv+kvOz8S0atIYfGBytZqW1khSZLCG64E7kJmpbw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v16 0/5] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v16 0/5] PCI devices passthrough on Arm, part 3
Thread-Index: AQHarJvJwdjYrmiobk+ttSutSUp5prNehDMA
Date: Fri, 28 Feb 2025 14:40:28 +0000
Message-ID: <1ef27a22-e541-4f44-97d5-400fe455222e@epam.com>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
In-Reply-To: <20240522225927.77398-1-stewart.hildebrand@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS2PR03MB9224:EE_
x-ms-office365-filtering-correlation-id: 273aed51-c591-4561-7015-08dd5805d87f
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aWp6aVJ6MFR5eVordHFScU1DYWN0Y1Nsa095MlBSOCtnL3U5bEVwTzQraUY1?=
 =?utf-8?B?dlZ5L2xhVVlvWGxXS3IvRU02WHd2c2pSdXhXdG02aGJBaDh6YnphMlNEaXZB?=
 =?utf-8?B?L2FmMzErL290ckY4ZWJwMEF6NzdVd1EvSU1WSWpiZlhwYXlRaUU5aXpQVGFs?=
 =?utf-8?B?WmhDcjJNcmdPcXlKU01vdmVaL3BBcjNkNnBQMW9wdjVDcFJWRWZ1S1ZTN1U3?=
 =?utf-8?B?VDV1b29MVURhc05IK2FmMHovRXQ5SWVQWkhtMWN3aCtXR0NFWG0zclg2VWMv?=
 =?utf-8?B?c2ZmUzNXemFuWjh6S3NBQ01jUitxcUN1dmNrL3gxVkxveFpNRjBpQW9JaWNO?=
 =?utf-8?B?KzhDTWhqNThnSGNsanA4Y1NFRHFtSm8zQ1g5cE5GZXZBU0Y3TEpHVFN6NjFk?=
 =?utf-8?B?aG0yVUFDNm9VUjVGeFlrNUFrU1JrWCtSY29sM3M2ZUFkMWpJNm5Db1F6VWp0?=
 =?utf-8?B?RGVrUFAwWTNsT3ZpdlNuSDZIVWZuNTNid1YxeStvMjBlRVpoSE95cjE4dEJS?=
 =?utf-8?B?bGdqb1dIekJQbE44MzNhS0JadEtzRnNMTGdPd0hKakYyZ2JYang2bVpzVDlX?=
 =?utf-8?B?aFVrLzRMcDF2RzdYaUlwRGwxSThoSmZ0bDRMTlpOY0diNUNmWUtiVStjYnpz?=
 =?utf-8?B?cmlHS0RvVmF3UThuNnpDQkV1aUpnZzJCUGlGMGV6UFRwTmRYaEpNcEdzLzZT?=
 =?utf-8?B?d1NBYjBFMEpMQmJOYmtQSjhUSG53NVZ5RWc5T0VDZ2lGcFlDdTNxZXl2SUVN?=
 =?utf-8?B?cjQ0enE1bkVPREV2SmRMQXdKMm1FWkF6UUwzNURVSXJCeVJiZmhaazh2Ritj?=
 =?utf-8?B?VE40ZlVKK293ZXdsenk3VXcyRHhTbE5vaXBGYzkxc252MkwwWkoxdG9FVTU3?=
 =?utf-8?B?M2hlMytOVVNKTDdONlBXWUxseEFlQ2FUTGlPSm9adUdiMVptN2pxTVdUL1Nv?=
 =?utf-8?B?Y095L1NBS3U3ckNici9RQWIzSDgxTi91cnp4RkpSTG9od1B2d2hjMlJ3N0wv?=
 =?utf-8?B?TmRyNnRablZ3bVQxanFMS0J5bFdQOWFudDNMcE82dXFWQVE5SUpOQUxKMmp5?=
 =?utf-8?B?dGtyZk5Qem9zbUhLYmF0OFRWd0wyL3pJaFlNUFpBVmQrMTdQRi9uUWk4dWZY?=
 =?utf-8?B?Q0FuaDkxR21ySXVQTmtpS0p4bkNhWHR3cFRxTmlFWFZIREVBaDk3VFdrV2Ez?=
 =?utf-8?B?WjhPd1lDWGNMa0tnUlBSSkZLMmxCNHNCdG9VcERQajRhWU1LT2xDRFMwbXQ3?=
 =?utf-8?B?d1JscTE5N2NxbThXejVIZC9qRHdjbysxTmpxRnRCT1Y3TFpxd1Ftdzgyc3Fa?=
 =?utf-8?B?YjBsRForYnRnVzBhZGFIK3V1aklUT3V4Qlp6YVNXTjBWU1ZKc1BCTVl0eDlQ?=
 =?utf-8?B?ZHdGZCtjc1NOeElMS3FvczBKc1lsellYWmFaOHdMVkQ1TzNYOHhYNzVFVGUz?=
 =?utf-8?B?c2d5YkxJQm1HQnNIWnIrZkJZUnNLc2FzTmRxbFZpSGg1bG9lcnQybDBMZE9v?=
 =?utf-8?B?RkRMSS94UVRlUU0wZkIyNWVEelNocnA3Sy9XUXZJWmplNWkvbTAvK2RWVVI5?=
 =?utf-8?B?SEVmTmhqZ0hRSzJyRzVodFFDdnlrRUM5ajZINTlhcUpaaG9KaEZhSzdybTky?=
 =?utf-8?B?eGloRXZHM3E3cXhkTS94SzJEYnVNUjB1VmN1ZVBJeUdRLzZYZHBwN29xdDVJ?=
 =?utf-8?B?TUxDYUN2QzNySjR2VDg4TzFlVXNVcXl5RjZ6d0xycmtqeS9GOGl5VUNmS3VM?=
 =?utf-8?B?V24raDk0UkFOWkZiTmo2SDg4U0NqMmNGclBNQWtGU2ZYZW94M0d4RWZtOXR4?=
 =?utf-8?B?TCttWS9zWklDUzc3ZGc4WTYyTDU5cGI0Q2VieXhnSlBtN0FaUmpHcmZXVUZ4?=
 =?utf-8?B?dzhOSExsQ1hLUUNpWmsyU0twb3ZlcVhCN1hIY2o2QThxMnk2dGpXbHE0RnNv?=
 =?utf-8?Q?UjuldiqRlTGhsXVvzBkvqCc6NQ2ODkp5?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SE1UZzJJcDZqQVNzOW1BRmdxN0U0R1BXL2xYa0h3RThId3FjUmFub1J6cHFw?=
 =?utf-8?B?UU00YzJ1K3doQWtKdkpiZkxyUlJhWEs5Z1RJRFlObnREam1tYXh1M2lYdVd0?=
 =?utf-8?B?M0ZSeTZKSStzNnhLSTdpaGw0YmFvOXVOZ3p2N3A4Wm8vZ0hjNVFWdDByY0xF?=
 =?utf-8?B?TFdNaE16a3ZJMkllK0hEdWwza2ZDcklha1FCc2U1MVJyQlZSNk1qWDhQZkxJ?=
 =?utf-8?B?cVJJTkxOenNSeUo4WE8xVGVmVkwvOUNnWkVVUXpoMjV3Sm9EV2FZTGh2MVVm?=
 =?utf-8?B?azRHd2p0bTBhRm4yMXYrd1NzVE1TeHlUbkV0Y0Z1NjZMNTE1MnBDa1FXS0ZF?=
 =?utf-8?B?dUFwQWxpZUU1RjVoMUEvUHBTa1pTYzdaMzZyRWNUTVk1RHY2RGlQWVdLY2pN?=
 =?utf-8?B?dEoyWXVYTHRzaThsM2owOTh4TXVOS0luS2hQMWxPN0x5YVlLZ3EyUFpLazM2?=
 =?utf-8?B?K3VkWi9pSHBHTjE5SU1NTEM5YWJtQ29XWGpkRjJqNGZiTnJzYkE5UXlhQ0dv?=
 =?utf-8?B?N0tka0ZMYjN6MU1LSnlObDhJTmxVR00xbCtweHNobXcwMDNYWGgrU3lJU2JJ?=
 =?utf-8?B?ZXZyaThWc1FUTjl4Mm02Wm1lQVBSTERwbUZ0Mi85bmRKd1ZvdGE5SU1vWENw?=
 =?utf-8?B?UURBRDIxRU9sa0dsVHEyM3FTVlNUNzlmUjkyR0JvamhiMm5ldGV2cnFBRkM4?=
 =?utf-8?B?b1dmcHYwMFJrZXVmT0llZ1Q2RXpwNUo3SlVuNEVyWjFueFMwamhZNkZHR1U5?=
 =?utf-8?B?cjlGMW1NVlNNUXBrYWRRQWltenBkMTBZMzJOaHNIaEw0MEFJWnhkMWRKN3BT?=
 =?utf-8?B?ZFN2Yi9TNE9RenZjSXVBb0NYaC9reTM5aGNBdHBHMkt5QjZYWjBaNmRyUTdr?=
 =?utf-8?B?NjJ4VTdnNm9sRDV2Znpoc2Q5MGlvelZRMW83aU4ydUhOUGR2T3I3TTRVT0xs?=
 =?utf-8?B?blROWjlBck4vdVFiWWNHMUhnclVXaHg0OEFtVkR3S2VuVFB4aUpOR3B5ajUz?=
 =?utf-8?B?dTlibmJjYlliVHBaM2JIUDRSUDUvbXM4a0l0UHk5RG5NbTgzMFdPTWQyV2k2?=
 =?utf-8?B?Z25WUXp4dGNocXYwRHBhNWZ0N2drVTIzdWs2NU96V2Jwc2M1RDhwQ2xvS3lu?=
 =?utf-8?B?Z1JseTh5eXM0aE5FZFpMS3JIY2tHaTZwOVdaVTNKcEZOSDhacTdPcHBjcnF0?=
 =?utf-8?B?QmpWV3B0NHhkZklGeWZVZUJhaEpLUThQK2Vlb1hiVDV6QjQ5ajMrOVJWNzZx?=
 =?utf-8?B?Q20wL1ozK3EyRTVYNUVYb0RUZ05kcllwRVNmeVR1SEM2YmhRazUreXovbG1O?=
 =?utf-8?B?bzBzYS9SUG5iRFJST1dHYUZub1Z4SEV2TzNtZGJwaEc3Zm5PUUtmTStCMXo2?=
 =?utf-8?B?VUhTU1dTUGsxdGREWlNrd0pnSS8yVWdXSzRLNDNtUnVqQitGejVhZkZHT2Z6?=
 =?utf-8?B?UnFLUGlFZjVKenJOdWJKK1gxeDZBWUNydzFYNXJlQU0zdjRUYW5wa2ppTTVB?=
 =?utf-8?B?SEw1WlJOcGhmOU5lL2ZYSC80TnFjNUVUS1RkeXVNdDRONVc1czl1ejZsOWdU?=
 =?utf-8?B?ME43SUppYWx6Y0NLc1RKVHhmQkhuNk11QmxpeWJZc2FFODVvRlVKa1pTYnpa?=
 =?utf-8?B?b3E5Q3ZvZDJPRDNMTFp6Y1dkLzhwSVZFdW53azhtalFCMzJScUVqbDdXSWph?=
 =?utf-8?B?dHNFbjJmMFJuNWkwcEdqYjFoeVNTSzMyRVY5Nk5NejROWS9jVkhSd0VHL01J?=
 =?utf-8?B?ZjVSZ2VYbkNnT3czeWhGOHN0b0huaGVaMnoxRkltdkN0empuK2lsRGJwZmVu?=
 =?utf-8?B?dnZzZGt3RlY0OExqbHBOWWpOV2hjM0UzaDhoZEVKMmVTcDhnMDcyczI0cFhy?=
 =?utf-8?B?dU1VRjBsOElha2hpeDQrdGNlWEtwRUVvZVo4VmJFeG1ZMG92UnZ2ZmNJbjdD?=
 =?utf-8?B?dERiVzlxYXJ4NkFuUVRITllVQ2JJMDFaTHRvSXhoenY0REwwbzJMQ1BvQ2FU?=
 =?utf-8?B?MHpVa3JWc2x4MEhVdW9Pd2JYQm9mRVUraXJNNDhEKzhqZndmYThGaFp0SEdZ?=
 =?utf-8?B?b29ITC9QRERMbDA1a1YydkRyeVZXeHduMjg5cGdtcFE3TzBqbUdQYW9vanZK?=
 =?utf-8?B?R0FoZDl0MU1pQmFhMVNKR2NnUXNDcXlwSVVUYmZwZnovSXc3cmJ6Z3QxaHFK?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98FC28FBCBA46A409BCAB7FA78BFB408@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273aed51-c591-4561-7015-08dd5805d87f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 14:40:28.6704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6pK+CTceyokl1sw9bS+9hEecgR8/oIYVR0nlQBE93IiQk4W3ilPrONQ2C56V88PLz2/nxZSIEf4xN1F47nEDJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9224

T24gMjMuMDUuMjQgMDE6NTksIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90ZToNCj4gVGhpcyBpcyBu
ZXh0IHZlcnNpb24gb2YgdlBDSSByZXdvcmsuIEFpbSBvZiB0aGlzIHNlcmllcyBpcyB0byBwcmVw
YXJlDQo+IGdyb3VuZCBmb3IgaW50cm9kdWNpbmcgUENJIHN1cHBvcnQgb24gQVJNIHBsYXRmb3Jt
Lg0KPiANCj4gaW4gdjE2Og0KPiAgIC0gbWlub3IgdXBkYXRlcyAtIHNlZSBpbmRpdmlkdWFsIHBh
dGNoZXMNCj4gDQo+IGluIHYxNToNCj4gICAtIHJlb3JkZXIgc28gKCJhcm0vdnBjaTogaG9ub3Ig
YWNjZXNzIHNpemUgd2hlbiByZXR1cm5pbmcgYW4gZXJyb3IiKQ0KPiAgICAgY29tZXMgZmlyc3QN
Cj4gDQo+IGluIHYxNDoNCj4gICAtIGRyb3AgZmlyc3QgOSBwYXRjaGVzIGFzIHRoZXkgd2VyZSBj
b21taXR0ZWQNCj4gICAtIHVwZGF0ZWQgKCJ2cGNpL2hlYWRlcjogZW11bGF0ZSBQQ0lfQ09NTUFO
RCByZWdpc3RlciBmb3IgZ3Vlc3RzIikNCj4gDQo+IGluIHYxMzoNCj4gICAtIGRyb3AgKCJ4ZW4v
YXJtOiB2cGNpOiBwZXJtaXQgYWNjZXNzIHRvIGd1ZXN0IHZwY2kgc3BhY2UiKSBhcyBpdCB3YXMN
Cj4gICAgIHVubmVjZXNzYXJ5DQo+IA0KPiBpbiB2MTI6DQo+ICAgLSBJIChTdGV3YXJ0KSBjb29y
ZGluYXRlZCB3aXRoIFZvbG9kb215ciB0byBzZW5kIHRoaXMgd2hvbGUgc2VyaWVzLiBTbywNCj4g
ICAgIGFkZCBteSAoU3Rld2FydCkgU2lnbmVkLW9mZi1ieSB0byBhbGwgcGF0Y2hlcy4NCj4gICAt
IFRoZSBiaWdnZXN0IGNoYW5nZSBpcyB0byByZS13b3JrIHRoZSBQQ0lfQ09NTUFORCByZWdpc3Rl
ciBwYXRjaC4NCj4gICAgIEFkZGl0aW9uYWwgZmVlZGJhY2sgaGFzIGFsc28gYmVlbiBhZGRyZXNz
ZWQgLSBzZWUgaW5kaXZpZHVhbCBwYXRjaGVzLg0KPiAgIC0gRHJvcCAoInBjaTogbXNpOiBwYXNz
IHBkZXYgdG8gcGNpX2VuYWJsZV9tc2koKSBmdW5jdGlvbiIpIGFuZA0KPiAgICAgKCJwY2k6IGlu
dHJvZHVjZSBwZXItZG9tYWluIFBDSSByd2xvY2siKSBhcyB0aGV5IHdlcmUgY29tbWl0dGVkDQo+
ICAgLSBSZW5hbWUgKCJyYW5nZXNldDogYWRkIHJhbmdlc2V0X2VtcHR5KCkgZnVuY3Rpb24iKQ0K
PiAgICAgICAgIHRvICgicmFuZ2VzZXQ6IGFkZCByYW5nZXNldF9wdXJnZSgpIGZ1bmN0aW9uIikN
Cj4gICAtIFJlbmFtZSAoInZwY2kvaGVhZGVyOiByZXdvcmsgZXhpdCBwYXRoIGluIGluaXRfYmFy
cyIpDQo+ICAgICAgICAgdG8gKCJ2cGNpL2hlYWRlcjogcmV3b3JrIGV4aXQgcGF0aCBpbiBpbml0
X2hlYWRlcigpIikNCj4gDQo+IGluIHYxMToNCj4gICAtIEFkZGVkIG15IChWb2xvZHlteXIpIFNp
Z25lZC1vZmYtYnkgdGFnIHRvIGFsbCBwYXRjaGVzDQo+ICAgLSBQYXRjaCAidnBjaS9oZWFkZXI6
IGVtdWxhdGUgUENJX0NPTU1BTkQgcmVnaXN0ZXIgZm9yIGd1ZXN0cyIgaXMgaW4NCj4gICAgIGlu
dGVybWVkaWF0ZSBzdGF0ZSwgYmVjYXVzZSBpdCB3YXMgYWdyZWVkIHRvIHJld29yayBpdCBvbmNl
IFN0ZXdhcnQncw0KPiAgICAgc2VyaWVzIG9uIHJlZ2lzdGVyIGhhbmRsaW5nIGFyZSBpbi4NCj4g
ICAtIEFkZHJlc3NlZCBjb21tZW50cywgcGxlYXNlIHNlZSBwYXRjaCBkZXNjcmlwdGlvbnMgZm9y
IGRldGFpbHMuDQo+IA0KPiBpbiB2MTA6DQo+IA0KPiAgIC0gUmVtb3ZlZCBwYXRjaCAoInhlbi9h
cm06IHZwY2k6IGNoZWNrIGd1ZXN0IHJhbmdlIiksIHByb3BlciBmaXgNCj4gICAgIGZvciB0aGUg
aXNzdWUgaXMgcGFydCBvZiAoInZwY2kvaGVhZGVyOiBlbXVsYXRlIFBDSV9DT01NQU5EDQo+ICAg
ICByZWdpc3RlciBmb3IgZ3Vlc3RzIikNCj4gICAtIFJlbW92ZWQgcGF0Y2ggKCJwY2kvaGVhZGVy
OiByZXNldCB0aGUgY29tbWFuZCByZWdpc3RlciB3aGVuIGFkZGluZw0KPiAgICAgZGV2aWNlcyIp
DQo+ICAgLSBBZGRlZCBwYXRjaCAoInJhbmdlc2V0OiBhZGQgcmFuZ2VzZXRfZW1wdHkoKSBmdW5j
dGlvbiIpIGJlY2F1c2UNCj4gICAgIHRoaXMgZnVuY3Rpb24gaXMgbmVlZGVkIGluICgidnBjaS9o
ZWFkZXI6IGhhbmRsZSBwMm0gcmFuZ2Ugc2V0cw0KPiAgICAgcGVyIEJBUiIpDQo+ICAgLSBBZGRl
ZCAoInZwY2kvaGVhZGVyOiBoYW5kbGUgcDJtIHJhbmdlIHNldHMgcGVyIEJBUiIpIHdoaWNoIGFk
ZHJlc3NlZA0KPiAgICAgYW4gaXNzdWUgZGlzY292ZXJlZCBieSBBbmRyaWkgQ2hlcHVybnlpIGR1
cmluZyB2aXJ0aW8gaW50ZWdyYXRpb24NCj4gICAtIEFkZGVkICgicGNpOiBtc2k6IHBhc3MgcGRl
diB0byBwY2lfZW5hYmxlX21zaSgpIGZ1bmN0aW9uIiksIHdoaWNoIGlzDQo+ICAgICBwcmVyZXEg
Zm9yICgicGNpOiBpbnRyb2R1Y2UgcGVyLWRvbWFpbiBQQ0kgcndsb2NrIikNCj4gICAtIEZpeGVk
ICJTaW5jZSB2OS92OC8uLi4gIiBjb21tZW50cyBpbiBjaGFuZ2Vsb2dzIHRvIHJlZHVjZSBjb25m
dXNpb24uDQo+ICAgICBJIGxlZnQgIlNpbmNlIiBlbnRyaWVzIGZvciBvbGRlciB2ZXJzaW9ucywg
YmVjYXVzZSB0aGV5IHdlcmUgYWRkZWQNCj4gICAgIGJ5IG9yaWdpbmFsIGF1dGhvciBvZiB0aGUg
cGF0Y2hlcy4NCj4gDQo+IGluIHY5Og0KPiANCj4gdjkgaW5jbHVkZXMgYWRkcmVzc2VkIGNvbW1l
bnRlcyBmcm9tIGEgcHJldmlvdXMgb25lLiBBbHNvIGl0DQo+IGludHJvZHVjZXMgYSBjb3VwbGUg
cGF0Y2hlcyBmcm9tIFN0ZXdhcnQuIFRoaXMgcGF0Y2hlcyBhcmUgcmVsYXRlZCB0bw0KPiB2UENJ
IHVzZSBvbiBBUk0uIFBhdGNoICJ2cGNpL2hlYWRlcjogcmV3b3JrIGV4aXQgcGF0aCBpbiBpbml0
X2JhcnMiDQo+IHdhcyBmYWN0b3JlZC1vdXQgZnJvbSAidnBjaS9oZWFkZXI6IGhhbmRsZSBwMm0g
cmFuZ2Ugc2V0cyBwZXIgQkFSIi4NCj4gDQo+IGluIHY4Og0KPiANCj4gVGhlIGJpZ2dlc3QgY2hh
bmdlIGZyb20gcHJldmlvdXMsIG1pc3Rha2VubHkgbmFtZWQsIHY3IHNlcmllcyBpcyBob3cNCj4g
bG9ja2luZyBpcyBpbXBsZW1lbnRlZC4gSW5zdGVhZCBvZiBkLT52cGNpX3J3bG9jayB3ZSBpbnRy
b2R1Y2UNCj4gZC0+cGNpX2xvY2sgd2hpY2ggaGFzIGJyb2FkZXIgc2NvcGUsIGFzIGl0IHByb3Rl
Y3RzIG5vdCBvbmx5IGRvbWFpbidzDQo+IHZwY2kgc3RhdGUsIGJ1dCBkb21haW4ncyBsaXN0IG9m
IFBDSSBkZXZpY2VzIGFzIHdlbGwuDQo+IA0KPiBBcyB3ZSBkaXNjdXNzZWQgaW4gSVJDIHdpdGgg
Um9nZXIsIGl0IGlzIG5vdCBmZWFzaWJsZSB0byByZXdvcmsgYWxsDQo+IHRoZSBleGlzdGluZyBj
b2RlIHRvIHVzZSB0aGUgbmV3IGxvY2sgcmlnaHQgYXdheS4gSXQgd2FzIGFncmVlZCB0aGF0DQo+
IGFueSB3cml0ZSBhY2Nlc3MgdG8gZC0+cGRldl9saXN0IHdpbGwgYmUgcHJvdGVjdGVkIGJ5ICoq
Ym90aCoqDQo+IGQtPnBjaV9sb2NrIGluIHdyaXRlIG1vZGUgYW5kIHBjaWRldnNfbG9jaygpLiBS
ZWFkIGFjY2VzcyBvbiBvdGhlcg0KPiBoYW5kIHNob3VsZCBiZSBwcm90ZWN0ZWQgYnkgZWl0aGVy
IGQtPnBjaV9sb2NrIGluIHJlYWQgbW9kZSBvcg0KPiBwY2lkZXZzX2xvY2soKS4gSXQgaXMgZXhw
ZWN0ZWQgdGhhdCBleGlzdGluZyBjb2RlIHdpbGwgdXNlDQo+IHBjaWRldnNfbG9jaygpIGFuZCBu
ZXcgdXNlcnMgd2lsbCB1c2UgbmV3IHJ3IGxvY2suIE9mIGNvdXJzZSwgdGhpcw0KPiBkb2VzIG5v
dCBtZWFuIHRoYXQgbmV3IHVzZXJzIHNoYWxsIG5vdCB1c2UgcGNpZGV2c19sb2NrKCkgd2hlbiBp
dCBpcw0KPiBhcHByb3ByaWF0ZS4NCj4gDQo+IENoYW5nZXMgZnJvbSBwcmV2aW91cyB2ZXJzaW9u
cyBhcmUgZGVzY3JpYmVkIGluIGVhY2ggc2VwYXJhdGUgcGF0Y2guDQo+IA0KPiBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyAoNCk6DQo+ICAgIHZwY2kvaGVhZGVyOiBlbXVsYXRlIFBDSV9DT01NQU5E
IHJlZ2lzdGVyIGZvciBndWVzdHMNCj4gICAgdnBjaTogYWRkIGluaXRpYWwgc3VwcG9ydCBmb3Ig
dmlydHVhbCBQQ0kgYnVzIHRvcG9sb2d5DQo+ICAgIHhlbi9hcm06IHRyYW5zbGF0ZSB2aXJ0dWFs
IFBDSSBidXMgdG9wb2xvZ3kgZm9yIGd1ZXN0cw0KPiAgICB4ZW4vYXJtOiBhY2NvdW50IElPIGhh
bmRsZXJzIGZvciBlbXVsYXRlZCBQQ0kgTVNJLVgNCj4gDQo+IFZvbG9keW15ciBCYWJjaHVrICgx
KToNCj4gICAgYXJtL3ZwY2k6IGhvbm9yIGFjY2VzcyBzaXplIHdoZW4gcmV0dXJuaW5nIGFuIGVy
cm9yDQo+IA0KPiAgIHhlbi9hcmNoL2FybS92cGNpLmMgICAgICAgIHwgNjMgKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0NCj4gICB4ZW4vZHJpdmVycy9LY29uZmlnICAgICAgICB8ICA0ICsr
DQo+ICAgeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyAgfCA2MCArKysrKysrKysrKysrKysrKysr
KysrKysrLS0tDQo+ICAgeGVuL2RyaXZlcnMvdnBjaS9tc2kuYyAgICAgfCAgOSArKysrKw0KPiAg
IHhlbi9kcml2ZXJzL3ZwY2kvbXNpeC5jICAgIHwgIDcgKysrKw0KPiAgIHhlbi9kcml2ZXJzL3Zw
Y2kvdnBjaS5jICAgIHwgODEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gICB4ZW4vaW5jbHVkZS94ZW4vcGNpX3JlZ3MuaCB8ICAxICsNCj4gICB4ZW4vaW5jbHVkZS94
ZW4vc2NoZWQuaCAgICB8IDEwICsrKystDQo+ICAgeGVuL2luY2x1ZGUveGVuL3ZwY2kuaCAgICAg
fCAyOCArKysrKysrKysrKysrDQo+ICAgOSBmaWxlcyBjaGFuZ2VkLCAyNDQgaW5zZXJ0aW9ucygr
KSwgMTkgZGVsZXRpb25zKC0pDQo+IA0KPiANCj4gYmFzZS1jb21taXQ6IGNlZDIxZmJiMjg0MmFj
NDY1NTA0OGJkZWU1NjIzMjk3NGZmOWZmOWMNCg0KDQpIaSBldmVyeW9uZQ0KSSBzZWUgdGhhdCB0
aGUgZmlyc3QgdGhyZWUgcGF0Y2hlcyBmcm9tIHRoaXMgc2VyaWVzIHdlcmUgbWVyZ2VkLCBidXQg
DQpwYXRjaGVzIDQgYW5kIDUgd2VyZSBub3QsIGRlc3BpdGUgaGF2aW5nIGFja3MuIElzIHRoZXJl
IHNvbWV0aGluZyBlbHNlIA0Kd3Jvbmcgd2l0aCB0aGVtIHRoYXQgbmVlZHMgYWRkcmVzc2luZywg
b3Igd2VyZSB0aGV5IGp1c3QgbWlzc2VkIGJ5IGFjY2lkZW50Pw0KDQotLSANCk15a3l0YQ==

