Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC23B33CB7
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 12:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092929.1448530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqUR5-0007a9-CQ; Mon, 25 Aug 2025 10:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092929.1448530; Mon, 25 Aug 2025 10:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqUR5-0007Xo-7t; Mon, 25 Aug 2025 10:28:23 +0000
Received: by outflank-mailman (input) for mailman id 1092929;
 Mon, 25 Aug 2025 10:28:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/bS3=3F=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqUR3-0007Xi-UR
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 10:28:21 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38e906d9-819e-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 12:28:21 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GVXPR03MB10802.eurprd03.prod.outlook.com (2603:10a6:150:220::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 10:28:18 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 10:28:18 +0000
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
X-Inumbo-ID: 38e906d9-819e-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgyppLFynmuFQgjxStk7P1V7c/udnDAUo5T17mGKmiu6b4iFTm2iRgGZWbmAOBABVnrNHr9tbuKA1RCTrj7JwccU/Ln1NvDhX/UEUxlElc+Es95tGAkMqnd1uWmmqrRVRnmwI+cGMRSZ7knODTWehcyg/WAtIyzuKqR4PiycZ2NWsITQkOK0n41w576o3AIjZLLA0zZcUWBVIxOe9pMDzaPGyqmVSn63K1pB9Rp7SLr+zv9EzQDTj6APF2ebYjgAKwDczz9Dj27ADtR3ezZ1I46N28zNsg217UGyi29egGgERH5KE6BDoo2Scg74ZrwyCt//cMMF3X7PwQGbh4JcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Nasimg8iyCoY7CKQsSbDDr6b2t1xiKW6YB3aXxqx6A=;
 b=MgEz+UhcfMqb5vlUZVeFHMLYlMe4w2tAzGr6To7MMQ2l3yQxGfV41cdeMYyv9Zh61actroXP+KJOnhwgNEylCwVBaAPnbauxfsMpcL8z9Sd+ChhBE0ZbyMEZryDKwX+IwxYV/sC7um5ZR4KF6RolFW7ERTiXLs3ZrRiOgiEdQ4txABRvkdlevYq9kZijv4gFCZ7gas2IoGS3fvszm/FrISqbdQRx6swkB0tHc5ivM8nhszpmDD8S1pPuiz7IE8GvFkK+9sGE36ic6bhcnGOtl65ZCBYG5qlozq0Azue0WXXuGgIf3MiMygPnQYFQ00rcNQFZOgro42Oshzlc0J5E8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Nasimg8iyCoY7CKQsSbDDr6b2t1xiKW6YB3aXxqx6A=;
 b=Rjq1i9bOQOjPbj1O1Edv61/aJWv8rtWFFEzQzcOhP8a8D4oCJIK+BhzKknEE52LS8Ctnh8Qq/8rAr4meSaShJpbHLjOXvwOLBRgUiMI575G+Ktml15CqNxafsSYhs5GMsXo2CBkKonyk088f4AyDP5xLQV/5twsgWr78iSV+JzXbpAIO31C1raECUv/PVa7D8b3sB4GNERSg2Gx3/0zsiUG1CVj5TAswD84l5DRtgP/iWCClIEqWwcfEI3DovB7up26aEinrGKbHIiAyKVbUb3qza9inMR2eo09NSPKgYropDcy7LyYYyVVl88uqeL9MLvkN/V2oWg8skhKPfK7tlQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] common/efi: fix Rule 2.1 violation in read_file()
Thread-Topic: [PATCH v4] common/efi: fix Rule 2.1 violation in read_file()
Thread-Index: AQHcFQlF20ah2tP5uUOdXQ1Ea/l407RzJ1sAgAAEg4A=
Date: Mon, 25 Aug 2025 10:28:18 +0000
Message-ID: <bed18f1e-0b35-4795-99f4-a43899e2a73e@epam.com>
References:
 <1e5a31fe588f58bd2b5c7835773fdf7899ff5511.1756047981.git.dmytro_prokopchuk1@epam.com>
 <b7a3ae83-3136-4337-b45b-c075dcb212c4@suse.com>
In-Reply-To: <b7a3ae83-3136-4337-b45b-c075dcb212c4@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GVXPR03MB10802:EE_
x-ms-office365-filtering-correlation-id: 298e4cc4-2d25-4944-0556-08dde3c21ba5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V2dPcVlZcmFCVlFFY3FGVE42U2x4SnEwWVpPOG83SWxMdmh1eVdod1oxcUlx?=
 =?utf-8?B?OVJySVM3YUFQbmQ3dlpzOUh3SG1WZEhHN3R2K0pWd0pwSzRjTzFFWDh6WDRL?=
 =?utf-8?B?SW5kaTRJWVdCTUtxb29tbEloQ1dlNHRYSkphS1FEVDlBQU90Sy9UUE9EdWNL?=
 =?utf-8?B?clVsbXJjVnU1UXB6bDVYNjU0LzFKYWVhT0wwdzVVYlBhdWdGYkk2dnFKU2NL?=
 =?utf-8?B?T3lUQU9tSmFsekNmZ3ZXSGE4RWhNQ2YxcSs2MEd0Ny9EQndFV1pVMDNRbEx0?=
 =?utf-8?B?UWVGZnpqbjlsbmRJTTFZNm5SZkU1VC8xSWJ5aHZqRElTY094cGdsZENMUjJW?=
 =?utf-8?B?TTZsRUhBcDNnKzVPbGxCOVhiTHZZUFJMSkNPNXQxWGlyaXNXZ2xFUXlmYTJW?=
 =?utf-8?B?UGR2aWJoeDdoV0VNY01udUN0b25FbjZzeEd3RTVzZTQ0S1BCUjJJVE80N0tI?=
 =?utf-8?B?ZnFBWExCdGtKcVVPRitjNXpsQnJUeUZVSGF3czNYaXNPcVVjNDBnbWxsZnc2?=
 =?utf-8?B?d1BjSUNHVy8yQ2ZrK0ViUUlaQ3V1TkRGOGx4S2dlcnoxcjBKZndIZXVNOFVC?=
 =?utf-8?B?UFR5bFZ4T2RsUVVCdkZMYjMrdGpSaDIzTUNNWFdLUlMwc3dnQnFWWlFBMjdE?=
 =?utf-8?B?UkFvaHZHMUsxcUlqeUFpS05BaHZMNTd2T1JGbXphK3dzYm1TcnlUMmJXZUs3?=
 =?utf-8?B?TExPMmZySW9ZWDFUOEZkMTZlZmVGcTcyTVhvMVphbkhjczNRZG95eGNORnVp?=
 =?utf-8?B?RXh0QWR5ekRMQzUxanNQTU5PMS9oZ0pTazhXRzJSMkw3WjUzQk5BamNyQnVm?=
 =?utf-8?B?RzkzMWdKdDFUSUJZNVpNU1pMVnlGWWV6dC9xMFNHdndiYzFtM0VuVnBiRGdE?=
 =?utf-8?B?dU8rZStlZklyQmM4a1FPM2d2V00wME1NNFRFRDV6VDkrV1lJUkxlVCtMQlJD?=
 =?utf-8?B?S0cwMTNTYUQyblFUWVpaNUFpY2pFa3NHajlPbTZHNHF0U3IwOHJIcXQzRVNO?=
 =?utf-8?B?U1VFVkNDL1htU2hFZlM5ZHlJUTE3YkRDd1pSU09BRU1OOE1CcWZEaVliZDBY?=
 =?utf-8?B?WUNveGlTeEc3RUJyaGI4QktqUHVyM0VSMDhRdHpRcHBreldGZFRkNHdKUmlo?=
 =?utf-8?B?TFQ2VU9tNDVjL09tbmFaK0p1OXJUY1BZQXVQbGtuWERETFBGMk5sbEtsait4?=
 =?utf-8?B?OVU3UTBpblFyZ3JqeG5ObUtwOXZabUM5NWs4eDVrbXh6UkZVM1U4MytiNWhM?=
 =?utf-8?B?cFY0NjRlNTlPQ1g5MVl3ai9KRzZDOS9BeERsbnRxZ0JlVEJ2dFcvdEhnampO?=
 =?utf-8?B?eFVOOGh2azkxaVFidFVEQ3lGOHhMdElQYWc2VWJNK1dVZW9oZXZyK0ZRditq?=
 =?utf-8?B?S2tvTHM2N0tjS3cwMWREdXJnc21xc0lSdUpLVXJLZjB3MDEyWnJxbjVGTzdZ?=
 =?utf-8?B?dVdHVjBqYVJ5UmxkU3JWeFpOMUQwb2tkR0V5ZGVyUUNxNE8xQTZqK1BhbU1R?=
 =?utf-8?B?Qk0zYlNYVkZ3T3lWSkRZOWVXVzhVRzltdUd0clIwc09YY2thYnBtYi8zcXhy?=
 =?utf-8?B?ZUJoN05vWVptVklnWENGa2I4eXZ0WldVZlpUbUNVSEZ0QVJVazlZNytscklC?=
 =?utf-8?B?cUlWM2dnY3M3UjdjNW5BaGUwSWo3SEtpeXh4QVdydjk1aG1FNitQT0FhUW9P?=
 =?utf-8?B?OGwyTUltcWsySTNDaGN2V29IYXYxMGFrQVdyQzJOd0dhK05iMDhEY2Zla0pq?=
 =?utf-8?B?VEhMZGxuOEcraWNwYXc4KzNERlVMeDZYL0hlaG1yZmk2OHpIaFVxZnNXQ3Y2?=
 =?utf-8?B?VzlwRk1QSlQ0dmg2OFh4VTFxMG1DbmdIbUVNQ1owdTd2MFMzb2ttSFVmL084?=
 =?utf-8?B?engwb2M0enY0Zlg4cUhiRzlTdTdJRkJpUnpoTzZIcmdvS1Z3eDVHbWhzSVdM?=
 =?utf-8?B?ZlpyRml3ZVN5c2FGUEh3UXRGd0cveTR0YjJCdFlYOElYRTJER09TUFpVMmZq?=
 =?utf-8?B?TXR6dVFsdnJBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R3VYRzdOeUtmOHFzcUhJR05XRnY5N0YwNXBUUTVOSUlQeGJtR1pNSE90bVho?=
 =?utf-8?B?UlMzQnVLU3lQYXhleEtqeTh3a253WVgwZ01KTnd4ZjBQcDBNRnlUaEd1R3p4?=
 =?utf-8?B?Wnd3OHhNQm12cUMxOGU2ajlmMVpudHJEWnFBNmMrbzdSNUtweEhhQm0wdGpU?=
 =?utf-8?B?NVdXRUpEVStHdXc1MU11TkZQZm9qcWRNTE1iczQyNEFMNmRleldJRS94NmJM?=
 =?utf-8?B?Y1JsWmF3MEIvelcwVk82NWV5TG9WbENqR3hRaFFiODBvd2V3Y29vOWF3UTJG?=
 =?utf-8?B?MGFYSG9vZ09VbjhKS0kycUFIQ0NTaS9YdWYzWTNhdXJUYVhmcGFrRGRNYXYz?=
 =?utf-8?B?VEZkRmJzVjVvMStlQXUyS1JWZGllVWVha1Q2N0w2aHpGUlhkeFBYcit2SmxW?=
 =?utf-8?B?QjhNUW1ON3JGQ1M5ZVhMeWtwcjhmbUJiSitsMFJlY3VnTFh6UXVSVXlQblgz?=
 =?utf-8?B?NDlxaDhRRHFYZS9ROS82RUpuY1JyVmw2MHN0bXE3M0xucllvaXpkUUZsZGsz?=
 =?utf-8?B?ZjhWU1VqQjFKV0tRWHlQaVNzWTgzY1hCR09aSnlsL0tucVBOZVdYSGtpb2k4?=
 =?utf-8?B?aDJjbmF3UTNLT2pwa3dKU3o4SUpqMUNzNmE5eVQ1aCtJbUZVSm9IbWMwaUR2?=
 =?utf-8?B?dFFVeWlHR0cvNWNrN21BUFV3SjBscy9jbEYvKzZUa0Nmcy9sSHNJSFVheGlw?=
 =?utf-8?B?S2YxOUppWm9oVTVUaWsvaXpxVXB0YzB3T1JOY2RubzZob3ZQVlJYaFlkcTZX?=
 =?utf-8?B?ZmJnaUMrQnNMQmJpOE80dWdSL21NU1RDTy8yZWM4ejB4OTVHQzZCZFdsOG4v?=
 =?utf-8?B?V2pTMTVURlBVdEJUVkxJcnBPeEFpajN5dEdSaUxnVUlzQWhLS2ZWK0gwRHY1?=
 =?utf-8?B?SGY2QUI5ZUFjc3VySDhoZUljdTBONHFZM1ZyaU5leFh4ZjkrVUdKR3A1a2tz?=
 =?utf-8?B?bW5BM2hJa2llMFVobHUvZHhMd2FUWTVDd0tHUGVIdHlvMGdjOUJOL1JhWVJV?=
 =?utf-8?B?MDlsRWdNVDYxNG90dWg1VEVjTG4vcEpmNVJhaVdkbjAwS3lOVjFiSjlxeXBE?=
 =?utf-8?B?TVFsMW9OWjc4U3lBcG9uOE9OTlplZmVsbmF6MG1Eb0hDTk9hamx4T1oraEdG?=
 =?utf-8?B?MHpXRXRPd3d0Vnc4a2prRUtSanNYY3o1RmlUUHErd2tsT3Z2c1hNOXQvbGZu?=
 =?utf-8?B?UU5kTy92OC9VQWoycTJQQTEydHhDMy9qdmc0QSt5UVJ6TlIrbjFGdVRIYUxp?=
 =?utf-8?B?cTI2S2pCT1BqS3lGRUIrc3k3VkFWbzU5SFQ1MXNSaTVVc3JUcGtKcXVSMUNE?=
 =?utf-8?B?TFh6VjE3STc1ZEMwVEE0NU4zNWRQMmNYYUxSQTNDL3N2RUtqSTVhV1JpQXhL?=
 =?utf-8?B?SnJ1OXNiYlMxbFhydXVsd09adWNLeTlpY2RRdUxORXQ5dllZR3pHYThCTTVW?=
 =?utf-8?B?RFNzbDg1WHA1SmVYeWJ5YmdoVkVCVEx1OFpvaWl5VFJleEFPVXFoV1BWemZB?=
 =?utf-8?B?aVU2K0RwMkJHRDVDcjd3V3BLeUpueC9NWk1MajdzV0tFNW5tb3FjbkJIM0d6?=
 =?utf-8?B?SHhrVGlIUXJwQ2NkeWlWVUdpY3RVOTczZk53eGV5bkhPeTVDMlNkbzY3SnhV?=
 =?utf-8?B?SktzNjNvU3pmTlYzWUFmMmRyMzhJb0RmQXI2TTNUcW1hTldYSWtheEVWaTEw?=
 =?utf-8?B?cGI2SG5FTml6YmlmcHo5Nmd3QzlRdGdicFVZTXpvZWo1N3R5bHlDN09NN2Nk?=
 =?utf-8?B?L0h4QlhzWGZIdjdXNHBManpGdURWb3oxOE9pYWQ4RlVMRXFRRythNndVeldY?=
 =?utf-8?B?NGVjNC9qaHM0UVZNYXJ3YjRxUHlSalVXeUdUWHNkZ1kvWXFwSWhQOFhuMlBY?=
 =?utf-8?B?czN6dGtXZXIrMzlWVCsxeTJOcGtncjIrck16cGFmNjIxMVNvQ2R0bGRadVA1?=
 =?utf-8?B?UVRTVldhdlhxK1R0MzF5TE5tRzRHYVc2MHREc1lnODFTQURXblhEOWsxZHBZ?=
 =?utf-8?B?cFhYa1IvTU92aHZISHplWVlNbjZqTG82QVhFbXY4TGRzUEdFSXg3d2xGZU15?=
 =?utf-8?B?R1VpbzlGWm9RNkR0alRDNXRHRElvZTJadmNKa09IWGZ6bis0OFZFN3dDbHhF?=
 =?utf-8?B?QW1iT2drakoyQVpBYTBkeUszRXBYMU9yZC9ycGR4ZDRQcnV2UzR5V3pleUJO?=
 =?utf-8?B?dFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93D2E6820E8E7943B1186D9A6E302325@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298e4cc4-2d25-4944-0556-08dde3c21ba5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 10:28:18.3054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jwXYWK3he3HAllLZSBYFjKUIhUCk211JpdviJJ15erG6VM4wPn0R7V1TjXSGX6XZyTYuWwnmNt6VlNSboA2aR3azDHfoW/HAMHz3Fsy8zM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10802

DQoNCk9uIDgvMjUvMjUgMTM6MTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wOC4yMDI1
IDE3OjEwLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBNSVNSQSBDIFJ1bGUgMi4xIHN0
YXRlczogIkEgcHJvamVjdCBzaGFsbCBub3QgY29udGFpbiB1bnJlYWNoYWJsZSBjb2RlLiINCj4+
DQo+PiBUaGUgcmV0dXJuIHN0YXRlbWVudHMgaW4gdGhlICdyZWFkX2ZpbGUoKScgZnVuY3Rpb24g
aXMgdW5yZWFjaGFibGUgZHVlDQo+IA0KPiBFc3BlY2lhbGx5IGR1ZSB0byB0aGUgKGltbyB3cm9u
ZykgdXNlIG9mIHBsdXJhbCwgdGhpcyBjb250aW51ZXMgdG8gYmUNCj4gYW1iaWd1b3VzLiBJJ2Qg
c3VnZ2VzdCBzd2l0Y2hpbmcgdG8gc2luZ3VsYXIgYW5kIGluc2VydGluZyAiZmluYWwiIG9yDQo+
ICJtYWluIi4gSGFwcHkgdG8gYWRqdXN0IHdoaWxlIGNvbW1pdHRpbmcsIHByb3ZpZGVkIHlvdSBh
Z3JlZS4NCj4gDQo+IEphbg0KDQpJIGRvbid0IG1pbmQuDQpUaGFuayB5b3UuDQoNCkRteXRyby4=

