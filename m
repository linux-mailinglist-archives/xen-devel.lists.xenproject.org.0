Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF458B3A4FB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:55:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099562.1453351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urex1-0008A3-VZ; Thu, 28 Aug 2025 15:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099562.1453351; Thu, 28 Aug 2025 15:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urex1-00088I-Si; Thu, 28 Aug 2025 15:54:11 +0000
Received: by outflank-mailman (input) for mailman id 1099562;
 Thu, 28 Aug 2025 15:54:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRvb=3I=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1urewz-00088C-PF
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:54:10 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a6fc460-8427-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 17:54:08 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by VI1PR03MB10062.eurprd03.prod.outlook.com (2603:10a6:800:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 15:54:03 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 15:54:03 +0000
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
X-Inumbo-ID: 3a6fc460-8427-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAY5Rgm++mydFWe60OPsuihrYEjsR8F7ZWj96T4PF+fabsEZ2/GuOnCnl8kIqJi7dKpPkn3cfhs2/7aiGlfBZfQVnfH2PpB33+Ttukno+DGp8dnwM4unwWGrVr66Xa6JvOEqivuH4ilsGSCKUwmZNxTTDHiWECtl+SjEfMFaoQxK3hXrAD9TSq9EL3MONun/v68CBJr4arUIW3xOdYGCr77cf3ZXW9oLT5MA2cs0Uh6Ul9RPXqWgld0bDw4neKY441m7qf26Ig4bpU6b/52tl7kgVCZV6CfeZU1p4gHZrZKFbJQXo/VDVEJ5RcTT0tdri7600B9UMORzWsb5Kswuyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E23g8jVphwzpPkr1w172zvDJiB851Uccs7yXXG5zbVc=;
 b=XVKqwaQEO1UM5oF718V2lO/pPxsufCs7WSN27F8yf3+1eCvxmoyvoCZOslptupi5V/IWZHG+pTqFIcHPV72/tynVgsP0Ta2WtN8cYyibPCgMyGNu/edSjN6c20KToNarXiFU4NdsyaOU6fOgmnwHOv1HXlvXg5so7vAc/+odg1tN+UN10NNL4DNmnhUa/B0N8BUJed/KKMROrnifvpFygrib2riybBD1qtsTGnN8/1dXX64ZMXXd7X1ZGtM1j5FHOOWsGkgqAmg8HXBosRua+pbeehn9OWo1w9dqDgZYvebmfjhfhvDbmyNy1C3QzbsynwQAYDIYRtaZAXp/0cgi8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E23g8jVphwzpPkr1w172zvDJiB851Uccs7yXXG5zbVc=;
 b=vEDo/UF2vjpGX/Hyl5NgFmNpAAOJknZeAtCRJO9uj09fDGErqovk5EPY88KZMapSF9B0lD8d8ooUQ4RVsWy0O+l0MWvqj0x9HHZN1XQo1ex8914wZ5dxAcEkQpqlIKFKBTSz5bPrNDAVxuAmFJpn02hOxDuqSuSvdyBfve4puwXJkAs/dwF4NKDfPrPmHvnnzyLSldZfrvZ7s59zT4EknTezQ0DEDstjf/ZQnjqnDaSLptHZ+QdCO60XEmKj3dHHDSA/rhyn1mqc+9O+mxfpHBugd4DOM3U90eus6TRy0W/s9txaJjwlicGZdpHYsB63qp6TO33hO6hWfLilvPzD6w==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: consider conversion from UL or (void*) to function
 pointer as safe
Thread-Topic: [PATCH] misra: consider conversion from UL or (void*) to
 function pointer as safe
Thread-Index:
 AQHcETrg9Y9S2hDXvUqVfYmm522krbRswSIAgAAGvACAAhrPAIAEeW2AgAAEDACABOVWAA==
Date: Thu, 28 Aug 2025 15:54:03 +0000
Message-ID: <63a8e9f8-61c7-4443-a114-82db08c45f69@epam.com>
References:
 <9e5e4ff2c7ba0a90a6ac403e2de9318e18949274.1755628705.git.dmytro_prokopchuk1@epam.com>
 <90fb95a3-4b32-4785-a77c-373e5b9da6ed@suse.com>
 <e1e2abdf0ef8708097aa78440eeb7147@bugseng.com>
 <6b912698-b871-4819-ac30-14325d0be146@epam.com>
 <498f9629d2dda3f305c11512908b1325@bugseng.com>
 <d1fd1bbc474aad5a6a9841a8c109126a@bugseng.com>
In-Reply-To: <d1fd1bbc474aad5a6a9841a8c109126a@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|VI1PR03MB10062:EE_
x-ms-office365-filtering-correlation-id: 078fa6f3-2a61-44e0-d4eb-08dde64b1ca9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q3dHQWZZcTFmbUZqRnBBdHFXYnB4cEdWMHBMUTcyeDBSNGNjZVV1b25ic1Rs?=
 =?utf-8?B?VmgvZE8vS3lJRzRLMTlqb1pkSk5JYm9XSnBlNExQYWZZazJMaytMSC81L1B3?=
 =?utf-8?B?c3diV1RGMTZJUlNDK2lpK2I3NGh6U3RvTUxqWGZjU0hkMk95NHVBeTdqN2ww?=
 =?utf-8?B?MGI3ODRCVE1HQU12ZHgvL1VGTFJ2V3JLcUp0SWlaTjFFcjdwNEVJRDZvWWR2?=
 =?utf-8?B?Z05DVjRNQjRpQUM0WWp5K1YydWxaUVI4R2hyalpDNEF3eUtoSlZ5bk45RVE5?=
 =?utf-8?B?Tk9pb3doU3I5b1Evd3huK25FY2tmazJVTmswSUFXOFRSN0UvcWtKNEhnWlFI?=
 =?utf-8?B?SzdYbHNZeWZsZGcrV1NwM0EyaUpLWEt3RTRLS0hFemF2UStqTTVwbml2MWZU?=
 =?utf-8?B?U2ZUeFBGY3dFNloxQUFJMkF6Sm8zSzUyTGJxM2FGNm5aQmZjaCtOTG9UZVRO?=
 =?utf-8?B?eWtGdXhCQTkyY1VlWXgzMmYvUHlWWDdXcHZYV1NmQ3dlbFl1bUpSMUJWY2Mv?=
 =?utf-8?B?NGUwTW42VHJaWFJ2czhNUjJFaDc0OHJGd1ZSYlhHa0JoVTlGZmpwQXNWZWxQ?=
 =?utf-8?B?bmhYTWMxVU94b2grTzJ6bDZuOU1BVzA3OU5zS0UvRHQwbXRhVzZWbHdMR0p4?=
 =?utf-8?B?S0FobnVvbCtvSVlrenNHcEw0bnRsdytyejRaU1dEOElMUWdJQVU0N21SSGNp?=
 =?utf-8?B?NTc5WllKL00vTTFFNllxOXEzNzBkRGIwZ3ZhQ1pVL05HdjMyL3I0RHNCUGdG?=
 =?utf-8?B?dFN1aGV5amlTazlBS0tRb0JtaGxEMHNaZDNvdU9IaUFNQk5mWWg0a25UYjZQ?=
 =?utf-8?B?UzJFTHBLNDQ2NUp3QjRUeGU0NURMRWpQNjkrYVZXdXhacytXSzBnLy92TE1u?=
 =?utf-8?B?UkhKSXpMYWlEQXVaR1VkY0dLaGl6Mi9TYm9RR09IRlRQaXlUL2lNM3Nmb2hT?=
 =?utf-8?B?SzduZ0g1aW5Cd2tzRS9odGZSTHF6OGNyUGpxZDQ2MzgyNk95MGJzcEd0UTBL?=
 =?utf-8?B?YkYyYnZveGR3NjRmOWRPMFdEMkJBVDA4MlpXQllIUVJObkF4R3g5NWJzbXRK?=
 =?utf-8?B?STVRcHAvMU9FVXNBZTlta2pWVko0Vi92cXNVSTRvT0x2TDBaaUlKWjZlVzhI?=
 =?utf-8?B?WlA1czRKMUUrM01HVThoc1BtMTU5QTV1TzEzMnNUQ2Fkb2Z6RjFxaEpyUFIr?=
 =?utf-8?B?OWZSVGllTE1HYTNQdXk0aWVOelpPMEg3RHlDZmo1YzE3by9ObzZ4cGtWYzNF?=
 =?utf-8?B?ZHRzcXRSbCtOSVpHeExGTXNSWGdqekVNc2F4WHgvVm9vSDRiTEluK20xd2xi?=
 =?utf-8?B?R2VjRTBEdnQ4dFdEc0d5c1R3c0dvL1lzcFBOeEV6K2tZUGUvTUdEc1lEL3M0?=
 =?utf-8?B?WXQrVjBXdjZGZkFTWWFmVm9KM1Ywd2hWazhpdG9iSlV3anJtQTA5WEVCVVFy?=
 =?utf-8?B?TGxlWjZuc084U2VnNnUrdDIwWVhFSmN4T3BFS1ZTMGZrV2N3R3pmNVNqNzhF?=
 =?utf-8?B?MGdKTlJKa0I1Tk0rNWZjYUxBaWxGdDN4Tndxb0N5Szk1djJ5K0ZwRUdSdUFV?=
 =?utf-8?B?dUdLTS9hZDFZdWc3YzFRcG0wVndwMTBMOTgxMU90QWhHSEFQVDVuSGV3dmRs?=
 =?utf-8?B?MXlKOEpleW5YVmphM1p5UEoyejVMVUovNi9WMWdGOWFQcFlQekx4cGJsRWov?=
 =?utf-8?B?NUZXWDlPQ28ydVB0eVAwd3JMR1BEMG5idisrZHpYUUlvdXlYcE1NSFFvM1U5?=
 =?utf-8?B?VTN1MUlVUGRlYmpMOHVldVp6YU02Y244dEl5ZG1DVHJSdk5nRGdlZjNzeUdy?=
 =?utf-8?B?Ni9CQmxHL2NYam5vcWs4RHFLMC9keTZIM3o4dkpucXZqem1jb2h0bU8xSmU4?=
 =?utf-8?B?QkIyOGp1TVZhQlMvU0UwdlRmWjluSHJsOGZKdTNvNHA4U3hIS1NsV0pza0ZQ?=
 =?utf-8?Q?6BLfYSh92Wg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjRBRkp6SDgxeFJqaDZOMDVwSUlpa1hnUjRYNmhEZUp6QzR4enpjTUFaNWFh?=
 =?utf-8?B?KzdIOWhtVG8yOEltem4rS0FiRmszM1QxSXpuQnhhcC9CRVJWczBpVzUyUmxm?=
 =?utf-8?B?MHlaVGprdWdPWGVZUUF6RFg0R0FYTklKS2pvekRCaDQ5elJZTThRcFNRdEJC?=
 =?utf-8?B?dHN5aVBmWDRSSE1ZaUlzVVJjNUwwN0NBcGk3dWxlSVR5R3loYWhFTHBpMlpZ?=
 =?utf-8?B?NG0rMURJT2NEandaMGg1bzJqc0Z6R2x0a2VLOHJ4M2l3U3B3ckdGMWUyYUsx?=
 =?utf-8?B?TjJRMTZkd1lLeVVtUnNNRTM2U0VSTE5heHdzdVhJZVl4T2tYRGFxS1Q4cUNC?=
 =?utf-8?B?ckpkZ3UwZXpNSXA2MStMR3h5UnNINE53c2pqZXZLYUI4YXNIejNTaG12d294?=
 =?utf-8?B?V2pHNlJ6aGU2cWNCeStSRUNnTmFCM2pnd0xrTFpjUE5nMUNkSjJtYXAxR2FU?=
 =?utf-8?B?WEhqRzBlZUJOWTdlSDJ5bEpDT2lJME5nbDN0YzAwVys5NVRaRDBIYVgyYmZO?=
 =?utf-8?B?VTBST3JkWUVVM1hzWkZ3bUxXWDF5cisvS2VNeTU5NCtWSE5hcXd3aldVdlUz?=
 =?utf-8?B?VDV4VTA1NDViR3RsTHpHbDJLUFVSWUd5d1plUXIvZHpuUkhubGN0U1FHMkVF?=
 =?utf-8?B?Q1pyUi93WVNFV3RZTWJ5RXVCOEVYaVJ6SGdaTlpGMnQ0RUtEMFBXa2h3dHRh?=
 =?utf-8?B?aGN1cnplMUVJR2txYnBvdjBtWWFSNmZBRVFDY0sxc21TVkZYKzIwbmFVMUdP?=
 =?utf-8?B?OE5FMUxnMXNpeWp4K29FV3VTVWhvNXhVeGl5dVRmeDVrWkRUYkwraTFWRnRn?=
 =?utf-8?B?VXoxWnljMURxQTNGaURDLzU0MkprWFpzRGE2M0lObURpNVNOWE1rMGdNVkxB?=
 =?utf-8?B?REMrNS9FSW1oUFhTU3NuYkgxMk1mVTJNdTRndzd0Nk1HZkhUdW9BRTdzTm52?=
 =?utf-8?B?Y1ZJYnlLRFk0WjRpUEd6NktoMDgzb1RJa0xQa1hUdUFmMmpCbEluTDYvb1oy?=
 =?utf-8?B?ck1neFFjYndJSnB3WDFTdVFYM1VPSEdxYyswOEdFbHdpd2dDQmZZOC9oRjJW?=
 =?utf-8?B?TmpSd3Z1UTdLckFEdXhOWGFXa1htZDlja2YzcXUxZmI1bFhXSmV4MDgvbWpD?=
 =?utf-8?B?U2RjMU9LcXlQUmFaeGJ3NVVUSHBOcm9JQXdCMWY0WFZNakJ3a0ZNYTNGamFO?=
 =?utf-8?B?ZmR5cHlkOUdRVFh1a2Q5Y0ZzYXpmT1hFV2Jpa3RmaFUrLzEwbG80bzhKY2h2?=
 =?utf-8?B?QVIveWhzejk3eTVsVXFsQ0plandOM0NzRnAra1VQSkJVTUZIMk9jMmZYT1I1?=
 =?utf-8?B?dUEvdDNUUVI3T1g3TVZxR1RrY3F1MjQ4elc5RWgrNDZqR3Zyb00rREg5YS9s?=
 =?utf-8?B?bEVaYVpQc0VVRHVpd280RjB2T3ZncUtPYSs5eXR1SVRvd0h2R3l6aUR1T1FL?=
 =?utf-8?B?QVVKM0dXU014K2loVEhSNUtvdG4wYlhMckl6YUxZV0tETzB2LzdueXdBV3RU?=
 =?utf-8?B?VW1IOWx4OVl5ejZMZHRGeHZvWFFOeFVMWEFQakx5ZG9YckRYYWJxZjZGTzVV?=
 =?utf-8?B?RHdMT0JHcUt2akVrODdVVjNRREpzWm9Qdm5TR2tENktHRy9tNktna3Y1aXlQ?=
 =?utf-8?B?TjljOHN0alBpUUpkYlo0cUY3emdVTEd3eWJ1K1NxVFplQldHRG9uYXRJMzhY?=
 =?utf-8?B?SFMyK0lsWnZuNXZRcGUvNEd3SXhjTHdQRUt0N25BT3ptRzdHOHRBK2R6eXNU?=
 =?utf-8?B?RE9BaEh1T2wrQkJjbm5INHlINjVXdTVwVGdBYmZaclZuVitrNHc3Ti9kR2JP?=
 =?utf-8?B?ekJZSm1iRkZtR1luamxQYUdnVDJMUXhwZUpRWE90T3crVVdRVWlSWk43M2JV?=
 =?utf-8?B?Rk8xRE13TGcyTWRTRFJDcURMS1lHVjJ3UXpCdVl3ZG54QmVNajN1eEF5cmw1?=
 =?utf-8?B?VGhTZmZtZm02ZzNtbkNyWHgzMG52UTlteC84NWJ6dDZpcFYxTndEOHNsSWd1?=
 =?utf-8?B?bTMxSWw5T1A2MW9EMTM5SkFaWWRNNlpjeDFBVFB5SUtiYzN5anNVZzZBcWRL?=
 =?utf-8?B?MFRjT0ZGMVpIeDZoV0xURDUwcmFKRzZWZTNDR2RPOExLYzdmaFlEUEY5dWtJ?=
 =?utf-8?B?VGpVT2l3WGppWjZiSXBOWUlYRFNYTDAwengyRG1EK1hXR0hlVHpBckdGaG04?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24EDA3099766D44AB9D3EAEA70C72BCC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078fa6f3-2a61-44e0-d4eb-08dde64b1ca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 15:54:03.3669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /pOXx2dG5hfE/BjwYVENiQJGXw0uFEoyNmV+0JMqlzxNPNH+OiSFKYZH1A3pjcZ7h1WLVnfYLUd3nffwlXaj+xel0FU3vq1OESERMD+4dQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10062

DQoNCk9uIDgvMjUvMjUgMTY6MDgsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI1LTA4
LTI1IDE0OjUzLCBOaWNvbGEgVmV0cmluaSB3cm90ZToNCj4+IE9uIDIwMjUtMDgtMjIgMTg6MzQs
IERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+PiBPbiA4LzIxLzI1IDExOjI1LCBOaWNvbGEg
VmV0cmluaSB3cm90ZToNCj4+Pj4gT24gMjAyNS0wOC0yMSAxMDowMSwgSmFuIEJldWxpY2ggd3Jv
dGU6DQo+Pj4+PiBPbiAxOS4wOC4yMDI1IDIwOjU1LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6
DQo+Pj4+Pj4gUnVsZSAxMS4xIHN0YXRlcyBhcyBmb2xsb3dpbmc6ICJDb252ZXJzaW9ucyBzaGFs
bCBub3QgYmUgcGVyZm9ybWVkDQo+Pj4+Pj4gYmV0d2VlbiBhIHBvaW50ZXIgdG8gYSBmdW5jdGlv
biBhbmQgYW55IG90aGVyIHR5cGUuIg0KPj4+Pj4+DQo+Pj4+Pj4gVGhlIGNvbnZlcnNpb24gZnJv
bSB1bnNpZ25lZCBsb25nIG9yICh2b2lkICopIHRvIGEgZnVuY3Rpb24gcG9pbnRlcg0KPj4+Pj4+
IGlzIHNhZmUgaW4gWGVuIGJlY2F1c2UgdGhlIGFyY2hpdGVjdHVyZXMgaXQgc3VwcG9ydHMgKGUu
Zy4sIHg4NiBhbmQNCj4+Pj4+PiBBUk0pIGd1YXJhbnRlZSBjb21wYXRpYmxlIHJlcHJlc2VudGF0
aW9ucyBiZXR3ZWVuIHRoZXNlIHR5cGVzLg0KPj4+Pj4NCj4+Pj4+IEkgdGhpbmsgd2UgbmVlZCB0
byBiZSBhcyBwcmVjaXNlIGFzIHBvc3NpYmxlIGhlcmUuIFRoZSBhcmNoaXRlY3R1cmVzDQo+Pj4+
PiBndWFyYW50ZWUgbm90aGluZywgdGhleSBvbmx5IG9mZmVyIG5lY2Vzc2FyeSBmdW5kYW1lbnRh
bHMuIEluIHRoZQ0KPj4+Pj4gV2luZG93cyB4ODYgQUJJLCBmb3IgZXhhbXBsZSwgeW91IGNhbid0
IGNvbnZlcnQgcG9pbnRlcnMgdG8vZnJvbSBsb25ncw0KPj4+Pj4gd2l0aG91dCBsb3NpbmcgZGF0
YS4gV2hhdCB3ZSBidWlsZCB1cG9uIGlzIHdoYXQgcmVzcGVjdGl2ZSBBQklzIHNheSwNCj4+Pj4+
IHBvc3NpYmx5IGluIGNvbWJpbmF0aW9uIG9mIGltcGxlbWVudGF0aW9uIHNwZWNpZmljcyBsZWZ0
IHRvIGNvbXBpbGVycy4NCj4+Pj4+DQo+Pj4+DQo+Pj4+ICsxLCBhIG1lbnRpb24gb2YgdGhlIGNv
bXBpbGVycyBhbmQgdGFyZ2V0cyB0aGlzIGRldmlhdGlvbiByZWxpZXMgDQo+Pj4+IHVwb24gaXMN
Cj4+Pj4gbmVlZGVkLg0KPj4+DQo+Pj4gTWF5YmUgd2l0aCB0aGlzIHdvcmRpbmc6DQo+Pj4NCj4+
PiBUaGlzIGRldmlhdGlvbiBpcyBiYXNlZCBvbiB0aGUgZ3VhcmFudGVlcyBwcm92aWRlZCBieSB0
aGUgc3BlY2lmaWMgQUJJcw0KPj4+IChlLmcuLCBBUk0gQUFQQ1MpIGFuZCBjb21waWxlcnMgKGUu
Zy4sIEdDQykgc3VwcG9ydGVkIGluIFhlbi4gVGhlc2UgQUJJcw0KPj4NCj4+IHMvc3VwcG9ydGVk
IGluL3N1cHBvcnRlZCBieS8NCj4+DQo+Pj4gZ3VhcmFudGVlIGNvbXBhdGlibGUgcmVwcmVzZW50
YXRpb25zIGZvciAndm9pZCAqJywgJ3Vuc2lnbmVkIGxvbmcnIGFuZA0KPj4+IGZ1bmN0aW9uIHBv
aW50ZXJzIGZvciB0aGUgc3VwcG9ydGVkIHRhcmdldCBwbGF0Zm9ybXMuIFRoaXMgYmVoYXZpb3Ig
aXMNCj4+DQo+PiBJdCdzIG5vdCBqdXN0IGFib3V0IHRoZSBndWFyYW50ZWVzIG9mIHRoZSBBQklz
OiBpdCdzIHRoZSBiZWhhdmlvciBvZiANCj4+IHRoZSBjb21waWxlciBmb3IgdGhvc2UgQUJJcyB0
aGF0IG1ha2VzIHRoaXMgc2FmZSBvciB1bnNhZmUuIElmIA0KPj4gcHJlc2VudCwgc3VjaCBkb2N1
bWVudGF0aW9uIHNob3VsZCBiZSBpbmNsdWRlZA0KPj4NCj4gDQo+IEluIGFueSBjYXNlLCBwcm92
aWRlZCB0aGF0IHRoZSB3b3JkaW5nIGNhbiBiZSBhZGp1c3RlZDoNCj4gDQo+IFJldmlld2VkLWJ5
OiBOaWNvbGEgVmV0cmluaSA8bmljb2xhLnZldHJpbmlAYnVnc2VuZy5jb20+DQoNClVwZGF0ZWQg
d29yZGluZzoNCg0KVGhpcyBkZXZpYXRpb24gZnJvbSBSdWxlIDExLjEgcmVsaWVzIG9uIGJvdGgg
QUJJIGRlZmluaXRpb25zIGFuZCBjb21waWxlcg0KaW1wbGVtZW50YXRpb25zIHN1cHBvcnRlZCBi
eSBYZW4uIFRoZSBTeXN0ZW0gViB4ODZfNjQgQUJJIGFuZCB0aGUgQUFyY2g2NA0KRUxGIEFCSSBk
ZWZpbmUgY29uc2lzdGVudCBhbmQgY29tcGF0aWJsZSByZXByZXNlbnRhdGlvbnMgKGkuZS4sIGhh
dmluZw0KdGhlIHNhbWUgc2l6ZSBhbmQgbWVtb3J5IGxheW91dCkgZm9yICd2b2lkIConLCAndW5z
aWduZWQgbG9uZycsIGFuZCBmdW5jdGlvbg0KcG9pbnRlcnMsIGVuYWJsaW5nIHNhZmUgY29udmVy
c2lvbnMgYmV0d2VlbiB0aGVzZSB0eXBlcyB3aXRob3V0IGRhdGEgbG9zcw0Kb3IgY29ycnVwdGlv
bi4gQWRkaXRpb25hbGx5LCBHQ0MgYW5kIENsYW5nLCBmYWl0aGZ1bGx5IGltcGxlbWVudCB0aGUg
QUJJDQpzcGVjaWZpY2F0aW9ucywgZW5zdXJpbmcgdGhhdCB0aGUgZ2VuZXJhdGVkIG1hY2hpbmUg
Y29kZSBjb25mb3JtcyB0byB0aGVzZQ0KZ3VhcmFudGVlcy4gRGV2ZWxvcGVycyBtdXN0IG5vdGUg
dGhhdCB0aGlzIGJlaGF2aW9yIGlzIG5vdCB1bml2ZXJzYWwgYW5kDQpkZXBlbmRzIG9uIHBsYXRm
b3JtLXNwZWNpZmljIEFCSXMgYW5kIGNvbXBpbGVyIGltcGxlbWVudGF0aW9ucy4NCg0KUmVmZXJl
bmNlczoNCi0gU3lzdGVtIFYgeDg2XzY0IEFCSTogDQpodHRwczovL2dpdGxhYi5jb20veDg2LXBz
QUJJcy94ODYtNjQtQUJJLy0vam9icy9hcnRpZmFjdHMvbWFzdGVyL3Jhdy94ODYtNjQtQUJJL2Fi
aS5wZGY/am9iPWJ1aWxkDQotIEFBcmNoNjQgRUxGIEFCSTogaHR0cHM6Ly9naXRodWIuY29tL0FS
TS1zb2Z0d2FyZS9hYmktYWEvcmVsZWFzZXMNCi0gR0NDOiBodHRwczovL2djYy5nbnUub3JnL29u
bGluZWRvY3MvZ2NjL0FSTS1PcHRpb25zLmh0bWwNCi0gQ2xhbmc6IGh0dHBzOi8vY2xhbmcubGx2
bS5vcmcvZG9jcy9Dcm9zc0NvbXBpbGF0aW9uLmh0bWwNCg0KVGhhbmtzLA0KRG15dHJvLg0KPiAN
Cj4+PiBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgYW5kIG1heSBub3QgYmUgcG9ydGFibGUgb3V0c2lk
ZSBvZiBzdXBwb3J0ZWQNCj4+PiBlbnZpcm9ubWVudHMuDQo+Pj4NCj4+Pj4NCj4+Pj4+PiAtLS0g
YS9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+Pj4+Pj4gKysrIGIvZG9jcy9taXNyYS9kZXZp
YXRpb25zLnJzdA0KPj4+Pj4+IEBAIC0zNzAsNiArMzcwLDE2IEBAIERldmlhdGlvbnMgcmVsYXRl
ZCB0byBNSVNSQSBDOjIwMTIgUnVsZXM6DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgdG8gc3RvcmUg
aXQuDQo+Pj4+Pj4gwqDCoMKgwqDCoCAtIFRhZ2dlZCBhcyBgc2FmZWAgZm9yIEVDTEFJUi4NCj4+
Pj4+Pg0KPj4+Pj4+ICvCoMKgICogLSBSMTEuMQ0KPj4+Pj4+ICvCoMKgwqDCoCAtIFRoZSBjb252
ZXJzaW9uIGZyb20gdW5zaWduZWQgbG9uZyBvciAodm9pZCBcKikgdG8gYSBmdW5jdGlvbg0KPj4+
Pj4+IHBvaW50ZXIgZG9lcw0KPj4+Pj4+ICvCoMKgwqDCoMKgwqAgbm90IGxvc2UgYW55IGluZm9y
bWF0aW9uIG9yIHZpb2xhdGUgdHlwZSBzYWZldHkgYXNzdW1wdGlvbnMNCj4+Pj4+PiBpZiB1bnNp
Z25lZA0KPj4+Pj4+ICvCoMKgwqDCoMKgwqAgbG9uZyBvciAodm9pZCBcKikgdHlwZSBpcyBndWFy
YW50ZWVkIHRvIGJlIHRoZSBzYW1lIGJpdCBzaXplDQo+Pj4+Pj4gYXMgYQ0KPj4+Pj4+ICvCoMKg
wqDCoMKgwqAgZnVuY3Rpb24gcG9pbnRlci4gVGhpcyBlbnN1cmVzIHRoYXQgdGhlIGZ1bmN0aW9u
IHBvaW50ZXIgY2FuDQo+Pj4+Pj4gYmUgZnVsbHkNCj4+Pj4+PiArwqDCoMKgwqDCoMKgIHJlcHJl
c2VudGVkIHdpdGhvdXQgdHJ1bmNhdGlvbiBvciBjb3JydXB0aW9uLiBUaGUgbWFjcm8NCj4+Pj4+
PiBCVUlMRF9CVUdfT04gaXMNCj4+Pj4+PiArwqDCoMKgwqDCoMKgIGludGVncmF0ZWQgaW50byB4
ZW4vY29tbW9uL3ZlcnNpb24uYyB0byBjb25maXJtIGNvbnZlcnNpb24NCj4+Pj4+PiBjb21wYXRp
YmlsaXR5DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoCBhY3Jvc3MgYWxsIHRhcmdldCBwbGF0Zm9ybXMu
DQo+Pj4+Pj4gK8KgwqDCoMKgIC0gVGFnZ2VkIGFzIGBzYWZlYCBmb3IgRUNMQUlSLg0KPj4+Pj4N
Cj4+Pj4+IFdoeSB0aGUgZXNjYXBpbmcgb2YgKiBoZXJlLCB3aGVuIC4uLg0KPj4+Pj4NCj4+Pj4+
PiAtLS0gYS9kb2NzL21pc3JhL3J1bGVzLnJzdA0KPj4+Pj4+ICsrKyBiL2RvY3MvbWlzcmEvcnVs
ZXMucnN0DQo+Pj4+Pj4gQEAgLTQzMSw3ICs0MzEsMTMgQEAgbWFpbnRhaW5lcnMgaWYgeW91IHdh
bnQgdG8gc3VnZ2VzdCBhIGNoYW5nZS4NCj4+Pj4+PiDCoMKgwqDCoMKgIC0gQWxsIGNvbnZlcnNp
b25zIHRvIGludGVnZXIgdHlwZXMgYXJlIHBlcm1pdHRlZCBpZiB0aGUNCj4+Pj4+PiBkZXN0aW5h
dGlvbg0KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgIHR5cGUgaGFzIGVub3VnaCBiaXRzIHRvIGhvbGQg
dGhlIGVudGlyZSB2YWx1ZS4gQ29udmVyc2lvbnMgdG8NCj4+Pj4+PiBib29sDQo+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqAgYW5kIHZvaWQqIGFyZSBwZXJtaXR0ZWQuIENvbnZlcnNpb25zIGZyb20gJ3Zv
aWQgbm9yZXR1cm4gKCopDQo+Pj4+Pj4gKC4uLiknDQo+Pj4+Pj4gLcKgwqDCoMKgwqDCoCB0byAn
dm9pZCAoKikoLi4uKScgYXJlIHBlcm1pdHRlZC4NCj4+Pj4+PiArwqDCoMKgwqDCoMKgIHRvICd2
b2lkICgqKSguLi4pJyBhcmUgcGVybWl0dGVkLiBDb252ZXJzaW9ucyBmcm9tIHVuc2lnbmVkDQo+
Pj4+Pj4gbG9uZyBvcg0KPj4+Pj4+ICvCoMKgwqDCoMKgwqAgKHZvaWQgXCopIHRvIGEgZnVuY3Rp
b24gcG9pbnRlciBhcmUgcGVybWl0dGVkIGlmIHRoZSBzb3VyY2UNCj4+Pj4+PiB0eXBlIGhhcw0K
Pj4+Pj4+ICvCoMKgwqDCoMKgwqAgZW5vdWdoIGJpdHMgdG8gcmVzdG9yZSBmdW5jdGlvbiBwb2lu
dGVyIHdpdGhvdXQgdHJ1bmNhdGlvbiBvcg0KPj4+Pj4+IGNvcnJ1cHRpb24uDQo+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoCBFeGFtcGxlOjoNCj4+Pj4+PiArDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgIHVuc2lnbmVkIGxvbmcgZnVuY19hZGRyID0gKHVuc2lnbmVkIGxvbmcpJnNvbWVfZnVuY3Rp
b247DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIHZvaWQgKCpyZXN0b3JlZF9mdW5jKSh2
b2lkKSA9ICh2b2lkICgqKSh2b2lkKSlmdW5jX2FkZHI7DQo+Pj4+Pg0KPj4+Pj4gLi4uIGNvbnRl
eHQgaGVyZSBzdWdnZXN0cyB0aGV5IHdvcmsgZmluZSB1bi1lc2NhcGVkLCBhbmQgeW91IGV2ZW4g
YWRkDQo+Pj4+PiBzb21lIHVuLQ0KPj4+Pj4gZXNjYXBlZCBpbnN0YW5jZXMgYXMgd2VsbC4gUGVy
aGFwcyBJJ20gc2ltcGx5IHVuYXdhcmUgb2Ygc29tZQ0KPj4+Pj4gcGVjdWxpYXJpdHk/DQo+Pj4+
Pg0KPj4+Pg0KPj4+PiBUaGlzIGlzIGEgbGl0ZXJhbCByc3QgYmxvY2ssIHdoaWxlIHRoZSBvdGhl
ciBpcyBub3QgKCogYWN0cyBhcyBhIGJ1bGxldA0KPj4+PiBwb2ludCBpbiByc3QgaWlyYykNCj4+
Pg0KPj4+IFRoaXMgaXMgaG93ICJzcGhpbngtYnVpbGQiIHRvb2wgaW50ZXJwcmV0cyB0aGlzLg0K
Pj4+IDEuICogaW5zaWRlIHNpbmdsZSBxdW90ZXMgJycgLT4gbG9va3Mgbm9ybWFsLCBlLmcuIOKA
mHZvaWQgKCopKOKApinigJkNCj4+PiAyLiAqIHdpdGhvdXQgcXVvdGVzIC0+IHdhcm5pbmcNCj4+
PiBkZXZpYXRpb25zLnJzdDozNjk6IFdBUk5JTkc6IElubGluZSBlbXBoYXNpcyBzdGFydC1zdHJp
bmcgd2l0aG91dA0KPj4+IGVuZC1zdHJpbmcuIFtkb2N1dGlsc10NCj4+PiAzLiBcKiAtPiBsb29r
cyBub3JtYWwsIGUuZy4gKHZvaWQgKikNCj4+Pg0KPj4+IEJlY2F1c2UgdGhhdCB3ZSBuZWVkIHN1
Y2ggZm9ybWF0OiBcKg0KPj4+DQo+Pj4gRG15dHJvLg0KPj4+DQo+Pj4+DQo+Pj4+PiBKYW4NCj4+
Pj4NCj4g

