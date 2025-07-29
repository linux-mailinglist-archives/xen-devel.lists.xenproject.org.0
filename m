Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D47B151A0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 18:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062919.1428658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugnUs-0000BL-Lf; Tue, 29 Jul 2025 16:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062919.1428658; Tue, 29 Jul 2025 16:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugnUs-00009E-Hm; Tue, 29 Jul 2025 16:48:14 +0000
Received: by outflank-mailman (input) for mailman id 1062919;
 Tue, 29 Jul 2025 16:48:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NAX=2K=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ugnUq-000098-TH
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 16:48:13 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf5b6b6b-6c9b-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 18:48:10 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DU2PR03MB7861.eurprd03.prod.outlook.com (2603:10a6:10:2d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 16:48:07 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 16:48:07 +0000
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
X-Inumbo-ID: cf5b6b6b-6c9b-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RoYCMUVRjL8bnA9tVozrjCElAMpT9SHtvdzJnH/ssHR/yLSgfnvHT4Jy8TryFYCX6tx8273AR3mYItawSZbfz1FH0PzNj7mctJsukLvuvWdp6LTCRh5qIEy75eq6H64WegD1KKunnesCN2VtIBEHVju95jcOWEbAY2/uU4swMcnAsd0nvPiTy/5YChfFhw04gsgxlpkHZ8c+KoXsq3fhlFAbOhuqm7ffx/LZ8wGfoVLkl2TiQmSkM1F99yKHhk8kk64eMi87+ijkq0Pa5ATQOilerwulc28H/i2i5AFluuNrsnsJYp+rDkxpuyiwd8ObN/EGYfycdm4YJAGq2YZMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBsER9Q5T5NMEVL9EeMOEobvremNesBVIudib6wVxL4=;
 b=QfUbzpYYyyqrC4ut2AH8MTPxm2dR+QhIoW0Nn7rpLQ6jQidatadMck1XCP2L86/IXmLQLZCEIyTjvtl+zpkMbJ5RsbGIZ8lshb03ya7lWgM38GHS4N7mTqugWHce52ApqVEz2HnPxyDn6UoYAyVrPKwWHox//2yekqNxYgYY898aWEDnAcjFrU3ip8DPmnqgNxvHHZzxHaCrJWj0s3US83YhlHx+yXpAlPsHNJRoJp72reFVG9l72vjJGcwsq4jLDnaWwiqgvbt3nSr2qNyry8U3xU+lJMJMlgZBQMh0MpbW5SF6Oe62ByvXi+cO8gWep3iIIXGLmFseDztK3nEhzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBsER9Q5T5NMEVL9EeMOEobvremNesBVIudib6wVxL4=;
 b=U/hs1bgFZzJiyAq+sR8dZvHi1E0WO0n69Tdn8L+tJfs9rx2R3o4aG/MTomZSZGaHSKpEWnmg03sNE7vnsk/Dpo8qv5o+xfAByfRiesizunY4z5v8NOw/MjWT3tWlC8WJESadC3iYFdacff0cv1xaoHah04O8MFQ1f5+uDrERt1RE3HqTd0JDwc9yprn8KUIJKxHnyZUz/zGdxr1vZWg8jezE6CbeELVgfLmNOIf29KuOlIfXZmmPDbtW0mSJ5LvDgCesIy1OrdZzrmInD77+bDFRYhHNyoqdW4rDXlggup7XDYWhULxlG9+L9DK2fbJdpn7ZA4VB5evekMGKNo6NRA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] misra: allow 'noreturn' as safe for function pointer
 conversions
Thread-Topic: [PATCH v2] misra: allow 'noreturn' as safe for function pointer
 conversions
Thread-Index:
 AQHcAINAh5kgMNbMpUuhxpfVzSXJUrRJCpcAgAAGhoCAAAHoAIAAAdyAgAAC+QCAADg9gA==
Date: Tue, 29 Jul 2025 16:48:07 +0000
Message-ID: <b9085e60-11b4-41e7-af31-e74c025f1d4c@epam.com>
References:
 <3b821bc506b04bf7ff8bf5a3712449d45429dc90.1753791398.git.dmytro_prokopchuk1@epam.com>
 <2ef0d0a9-065c-4288-badd-21de4cfc5d14@suse.com>
 <029ca331fd380a855aff95ae9cae799e@bugseng.com>
 <f94586c9-fdf8-4d04-8490-1a9b1a57bcc2@suse.com>
 <df2d021f8b50989cf77ec226a6a5a9b4@bugseng.com>
 <056fd41d-47c9-4570-9cd9-fc121c9d44b7@suse.com>
In-Reply-To: <056fd41d-47c9-4570-9cd9-fc121c9d44b7@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DU2PR03MB7861:EE_
x-ms-office365-filtering-correlation-id: 8717e97e-876f-4a18-86eb-08ddcebfb206
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VFdIR0NrVjRpMnhYY0NsalE2WUtnbVdlbzgyZDhRK2Rob3RTVC9OUEgrUnBi?=
 =?utf-8?B?ZHRrYjFiUkEvTU9kdzc3UXo0TWVLYTVXalV4Zk8xcG1Nb3dTZXlxeGUvbGpT?=
 =?utf-8?B?WmhCY2JhSDZjUE9WZ2V2SmNXZGpKUDlCMlZ1alkrcHg0QnNrMytzRWQzbTdP?=
 =?utf-8?B?NVM5eTBEaVBYeEpndG9teTFRMVJPRlMrMXhTUFVPU1ZwMHJZcFJwUFRKenBr?=
 =?utf-8?B?NFdET3BMMy9EclhaU01XREdrS1o4UXBxQTVCL3RDMUQ5cm1uMjVsRDM0M3FU?=
 =?utf-8?B?MHQ1dXVQQ3NEQlNneTZKakI2WURWOE5BbUxFeEhXYVpuVHRIM3daYTlmMXRr?=
 =?utf-8?B?SEVBbmZpZUx3REF3ZTcxV1ZWK0ZCQWNyaGllWlRJVGgzZXNLZGl1OU5ZWTBO?=
 =?utf-8?B?clVnelA2UWtWQlV0VW5JYXVUTmtRalE4QVNLaTFyZk1NdWhVc1VuVi9FdW11?=
 =?utf-8?B?Y2VrWCsxa2I0TkgwcUo4cktMV21mM1RBWjUrMEQ4SVFVa1QwY1pSaC9OWHRa?=
 =?utf-8?B?cWRHV1ZjaGF3Vm14Ri9oV0tIcnpWMjZFbFRjWll0Zm90K0NoZHhFVm1tWHpK?=
 =?utf-8?B?dEpRelFoSEFtc21nQjZWMmdOTHVIY0IwMFB4Zmk1bHgrTm5adDViejlhZVRz?=
 =?utf-8?B?cC92VlJkVWxmdWhZVVlFT3pPaTIwVDZiVnNkNkhJTWE1L2xJSjdVNkZ4WEdR?=
 =?utf-8?B?UlF5Tys1SVZzb2xtdjNYT0FEUkNLU2hwNWJQQ2tGRGszaUdDbGVDdGx4WU9M?=
 =?utf-8?B?SnZVNHJBM2g4VUxlWG5ZNlJXSDNJSWJSdFVicFBBN0VWWmJWY1V3djdwcWR3?=
 =?utf-8?B?MDlQUHhqMVdjTkg4cm8xNnJlNVFMTmVoZW9uWDhqTnArSkxSaHlMcVJ4aHBV?=
 =?utf-8?B?ZmZsbE1qdUtlTGRoVmVyNTFSMVRJd05BazZ4ZWJqekhnZ1VSem8rZE5qamMx?=
 =?utf-8?B?cENyenNGZCt1TGVvaXNzSm94dmNIK2VtbzJSUzFhSFdGQjhucFUrN1dHb0NC?=
 =?utf-8?B?Q21SV2xmMkpBNnprM1lXLzdxWDZIR1JoM1FFdENNRkNEMkI2SWltQXM1eXpy?=
 =?utf-8?B?NCsvR0x6NDN5OHhvcHhJaW1zcm92cjNkK2dka2hkclQ1L0RkQlIvSGY5aVVC?=
 =?utf-8?B?K2J6dkJFZkpyeWpaSW8rdzVTT3RmOUtFVnFvOU45dStNWEdidUtCL2dIS1o1?=
 =?utf-8?B?QUdFNkFEZkc1TjM5OFBmblZNTE5YQTJPL1ptVGNKSnFYN2l5RlJlY3FpMGhw?=
 =?utf-8?B?M1Awb1JhdjIvU1RXV21GQXd0UkpjZEF2bWJoRDVXWXE0eUU4ZnpHbVdpaENq?=
 =?utf-8?B?czN6K2orQkpUTktXUDJETGdLYkw5OWgxZ2hlM2NVd0JQL3hlVklTbk5Ycllr?=
 =?utf-8?B?Z0ZiSnRSVmJmTG80Sjg3a2lEb09yYXF2WitJTCtFekxsS1VtWmRDSkFRSlJU?=
 =?utf-8?B?Um41eVAwUGlyOFhEM1puUktPcWQybW1nSzlQRjRVVlQzVkxBSW41cUtZcmpv?=
 =?utf-8?B?cTlRQlgrWGROa0h6cTM5SmM4bXZUNUZudE0vdGNvY1hhVWllR2hiOGdEb1NO?=
 =?utf-8?B?Q0tUdW8rbmo4Y2g2UnFLMlV3K1RFMnQ1b01PbHdrSWVLdkd3c3MyWThXdXFS?=
 =?utf-8?B?S05wSHo4N1VpQjVUdmZabndXVTNwQW1SQ05WQmdCRDd3VUUxNHFyTnFJZEJF?=
 =?utf-8?B?Zk15YmprUU9WMHZqL3o0OFUwUTdISTM3dERqWXBucktjUnkvVDkzS01kN1Zq?=
 =?utf-8?B?bzdTWGk3YjhVMEp3QWlXZzAyeHVzOWIrMWhNeWR3dnkyTVMzUVQzdTdGTndN?=
 =?utf-8?B?QTZFMkdSY3pBS3BHcTVjRWV0WkNyNWhySHFTLytuRVAwSzBCMDNhZTZtM0lo?=
 =?utf-8?B?M1BtQThvSUozOXhGaG5DSmtzMjhxQURobDc5M1ZJYUF1ZWxRUUJVd1AvcFNK?=
 =?utf-8?B?LzJyTGxDdVZITmxZNjlnRHhBQXdNbFJGa2NMU25Yc3pvSHFIUElaalY2THkr?=
 =?utf-8?B?REdNL3VQU3FRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YzcrK0VsdEFMR042RHV4ZHNaOEJFektkQ0psTm9keklVZW1kdlIrVlBkZmNW?=
 =?utf-8?B?NjRBRkswVVhBaytaajFPR1JxUmE5QTRWeHhrUUdySEVVZ0lOZWl0WjJ2NzJI?=
 =?utf-8?B?UEphVTZtdTg2MU44VWtCR1pQMGxDektKZUtqQ1BaZUEyNHBvM1ZCOUJnRkNH?=
 =?utf-8?B?MTFGMmZFWG9mOTlVZ2ZjamVZR3ZiQkpEOW50dmtKNDRDdzZoMC9xY3hVZ1Ri?=
 =?utf-8?B?K2ZwYUdvcFpxaGxuM2hnOWQzSWIxdnZWdHk2UHk3SVV6RjZDQkxzaDdFLy9D?=
 =?utf-8?B?b1djamVtYVhocTJvZDJMM014N0tGWEJJQ2lHTXJ1TlNSVjByYk5ram1MYXNK?=
 =?utf-8?B?S3hPSGJvWGI3dUhJOFY5dy9FYXhDYTg1VVBGbDVTNUxiVzI3N1d0VnpnRnZL?=
 =?utf-8?B?YjlNU3Bwc05TazZUK2lIbkl2RGIvMmREM1IrRExrSloxUzBmVEZNY1krU2VX?=
 =?utf-8?B?aXJIVVFzcmVHbGZuUWRodDRtZnZkRnZUZXJaSEdvVnZ3TVJmekRqc2t2V2tM?=
 =?utf-8?B?NDI4YzJWYmRKelFOQ3QwQXRUM0lZQjdRLzkvQUUvWkdkMFc2UEtiZTVjY21X?=
 =?utf-8?B?TWJ5VERlaGp0b2Y4Qmdwc29CcFlpcFVDK1VZTmxrdEI2c3dMM1EvNk45UHEw?=
 =?utf-8?B?eHQzMlpKcThXV1dxK05NanE5cDNmeXJhSjB3bXhvYVNwQjRNZXllRGcwbk5N?=
 =?utf-8?B?M0tqNTJSZ3VKZGlST1ZyMEZ0dy80VkZSOUNleEJCU1NTanhKSGZhYTlERDFw?=
 =?utf-8?B?UnZoS2dPcVRPL1RaeE55aUpucUZmU21CTjVqdVhuM09SQmdHaTlRa3RzRFFs?=
 =?utf-8?B?ZWxIRVd2Nit0Vzl3S2l4MjJ3ODArMEJMcys4QnN6NUtwWGwrdFNlWndnQUV4?=
 =?utf-8?B?QnkxWlRjTWZxY3dSMlFaalJoWTN4eGRIeEE4NndIRUVHMWc4eEwwV0tXUitu?=
 =?utf-8?B?bHVLRE1nc1dnZzV4b2w5ME5mdTVUL2swVzEyRXlUUGhyVDc0amZkdVlHa2lz?=
 =?utf-8?B?dS9uYTVqTXBCa1ZZci9oZ1pSWWFQZldwczVBaFJ1Y2wraGlkZ3pkQUphekRN?=
 =?utf-8?B?MER3TDRnSDlyenIzUW9hbU1YeVQ5MTFRcWZEeHRtQXVRM2tvNTkxTVNFVU5h?=
 =?utf-8?B?SWs5eVZVdGtIMnVLNTBQRTB2NU9GbWpBdHQzVndIcm9kQVp0a1lKK0pCQU4r?=
 =?utf-8?B?L0M2ZmF1cU1TcXNWUkpQNk92Qm5IZ0xOSHJZZzhjV21zMjJYL29CMmh5Ky92?=
 =?utf-8?B?eGZ2VEhGT0ZIMWloVXJqaXhBQVk2SFhlSmIwK0I0NGZrM01MTGFZbUdhV0Rk?=
 =?utf-8?B?Z3BiTnJkU3lnL1FYVzhLcnI4TzgzN0g0cDJFSWFUTXJmVll0dVF0cUlTNkdR?=
 =?utf-8?B?N284Si9tQlZ2OGRKaGMzVDhrQm1JMnFKM1UwRGhwdEY1UWdoaHh0SGg1L2RY?=
 =?utf-8?B?RmsxcVhMZ0RkYXJNK1owb0NYL3BUbS9ablFXWVVpc1NwcXVtMWdLRmhtSGtp?=
 =?utf-8?B?aXgxN3poWFN3T1JrR21YdTlydUpsUlk0MWlzeHFwZXV6cE1HV1Aza3p6SVRX?=
 =?utf-8?B?MVd6YW00UWZWVE9rS2ZGVUJuekNtZzBSQ2JZbXZ1WnppTFhzb01QU0M5WTFR?=
 =?utf-8?B?YU5LcFFhUzkybnA0UFY3OEJ5c2JBNTN1SnNQQkIwbXdOYmNsZjhCTEZhRk9w?=
 =?utf-8?B?SnF1Mis5SDJGanpDaEdSSzlaZk5Gam0xQVNuMmRveGdRaWFSQk1sVzJGczN3?=
 =?utf-8?B?ekUyMXBWUkhqbm5GNXZqRjBNSDY4cEJLK0hIVmxHdDhGVlZDL3lGa05nKy9w?=
 =?utf-8?B?VE9TYkJsQ1JkbzVYZ3B1cWxRQ1FFeC9pVU52TmJkTi9FQldPTUJubnFWcmZu?=
 =?utf-8?B?Z2JJVm5USGx3OE9YTkF3Rzd5aTU2MVpNcVIxVERhSnAwNm1veEVJTS9pVGdJ?=
 =?utf-8?B?SmRCUVp1UEZKSGtRYUpRTEltOVdTT3dKSDRXQVBQKzFGSGQvVFNvZml5bUcx?=
 =?utf-8?B?cDBQTlNyK3FlYzgwUVI2OHJWR25XZkV6blhiOWlQblI4QnBYdlhpTjFZZkRF?=
 =?utf-8?B?NHJRdDRLZFd6MFBnRHoxMzRnZldmTjFiU3pPbmpscGthTitQQmRjZHNQNVIv?=
 =?utf-8?B?SVpaTStxVFFqQjcza3VxT0pCNTAxc1ZIcGp2MmZXaEV5WGNxdXRHUlRWNXoy?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1A11B9685670749BD62271A860D1220@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8717e97e-876f-4a18-86eb-08ddcebfb206
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 16:48:07.6981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NPUjp8G9C9lSuBgKJWbrBKtgY4hURYi6vHDngY6mrxljuVKy172KGMMTtjHdgpozCtzrMmyhaIy55wbrADDm9i7swtNB020QmwzxR4F4bsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7861

DQoNCk9uIDcvMjkvMjUgMTY6MjYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOS4wNy4yMDI1
IDE1OjE2LCBOaWNvbGEgVmV0cmluaSB3cm90ZToNCj4+IE9uIDIwMjUtMDctMjkgMTU6MDksIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI5LjA3LjIwMjUgMTU6MDIsIE5pY29sYSBWZXRyaW5p
IHdyb3RlOg0KPj4+PiBPbiAyMDI1LTA3LTI5IDE0OjM5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
Pj4+IE9uIDI5LjA3LjIwMjUgMTQ6MjEsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+Pj4+
PiAtLS0gYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wN
Cj4+Pj4+PiArKysgYi9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9u
cy5lY2wNCj4+Pj4+PiBAQCAtMzY3LDYgKzM2NywxMyBAQCBjb25zdGFudCBleHByZXNzaW9ucyBh
cmUgcmVxdWlyZWQuXCIiDQo+Pj4+Pj4gICB9DQo+Pj4+Pj4gICAtZG9jX2VuZA0KPj4+Pj4+DQo+
Pj4+Pj4gKy1kb2NfYmVnaW49IlRoZSBjb252ZXJzaW9uIGZyb20gJ3ZvaWQgbm9yZXR1cm4gKCop
KHZvaWQgKiknIHRvDQo+Pj4+Pj4gJ3ZvaWQNCj4+Pj4+PiAoKikodm9pZCAqKScgaXMgc2FmZQ0K
Pj4+Pj4+ICtiZWNhdXNlIHRoZSBzZW1hbnRpY3Mgb2YgdGhlICdub3JldHVybicgYXR0cmlidXRl
IGRvIG5vdCBhbHRlciB0aGUNCj4+Pj4+PiBjYWxsaW5nIGNvbnZlbnRpb24gb3IgYmVoYXZpb3Ig
b2YgdGhlIHJlc3VsdGluZyBjb2RlLiINCj4+Pj4+PiArLWNvbmZpZz1NQzNBMi5SMTEuMSxjYXN0
cys9e3NhZmUsDQo+Pj4+Pj4gKw0KPj4+Pj4+ICJraW5kKGJpdGNhc3QpJiZ0byh0eXBlKHBvaW50
ZXIoaW5uZXIocmV0dXJuKGJ1aWx0aW4odm9pZCkpJiZhbGxfcGFyYW0oMSwNCj4+Pj4+PiBwb2lu
dGVyKGJ1aWx0aW4odm9pZCkpKSkpKSkmJmZyb20oZXhwcihza2lwKCFzeW50YWN0aWMoKSwNCj4+
Pj4+PiArICAgcmVmKHByb3BlcnR5KG5vcmV0dXJuKSkpKSkifQ0KPj4+Pj4+ICstZG9jX2VuZA0K
Pj4+Pj4NCj4+Pj4+IEFzIEkgdW5kZXJzdGFuZCBpdCwgdGhpcyBpcyBhYm91dCBhbnkgZnVuY3Rp
b24sIG5vdCBqdXN0IHZvaWQgKHZvaWQNCj4+Pj4+ICopDQo+Pj4+PiBvbmVzLg0KPj4+Pj4gSGVu
Y2UgdGhyb3VnaG91dCBhbnl0aGluZyB0ZXh0dWFsIGluIHRoaXMgcGF0Y2gsIG1heSBJIGFzayB0
aGF0IHRoaXMNCj4+Pj4+IGJlDQo+Pj4+PiBtYWRlDQo+Pj4+PiBleHBsaWNpdCBieSBpbnNlcnRp
bmcgZS5nLiAiZS5nLiIgZXZlcnl3aGVyZT8NCj4+Pj4NCj4+Pj4gVGVjaG5pY2FsbHkgeWVzLCBp
biBwcmFjdGljZSBvdGhlciBpbXBsaWNpdCBmdW5jdGlvbiBwb2ludGVyDQo+Pj4+IGNvbnZlcnNp
b25zDQo+Pj4+IHdvdWxkIGJlIGNhdWdodCBieSAtV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVz
IGFuZCBzaW1pbGFyIGZsYWdzIHNvDQo+Pj4+IHRoZXkgZG9uJ3QgZXZlbiBjb21lIGludG8gcGxh
eS4gSG93ZXZlciBJIGFncmVlIHRoYXQgYWRkaW5nIHRoYXQgaXMNCj4+Pj4gY2xlYXJlci4NCj4+
Pg0KPj4+IFBlcmhhcHMgYSBtaXN1bmRlcnN0YW5kaW5nOiBXaXRoICJhbnkiIEkgbWVhbnQgYW55
IHdoaWNoIGhhcyBhIG5vcmV0dXJuDQo+Pj4gYXR0cmlidXRlLCB3aGVuIGNvbnZlcnRlZCB0byBv
bmUgd2l0aCBvdGhlcndpc2UgdGhlIHNhbWUgc2lnbmF0dXJlLiBCdXQNCj4+PiBpcnJlc3BlY3Rp
dmUgb2YgdGhlIHBhcnRpY3VsYXIgcmV0dXJuIHR5cGUgb3IgcGFyYW1ldGVyIHR5cGVzIChpLmUu
DQo+Pj4gc3BlY2lmaWNhbGx5IG5vdCBqdXN0IHZvaWQgKHZvaWQgKikgb25lcykuDQo+Pg0KPj4g
QWgsIHNvcnJ5LCBJIG1pc3VuZGVyc3Rvb2QuIFdlIGNoZWNrIHRoZSBkZXN0aW5hdGlvbiB0eXBl
IG9mIHRoZQ0KPj4gY29udmVyc2lvbiB3aXRoDQo+PiAidG8odHlwZShwb2ludGVyKGlubmVyKHJl
dHVybihidWlsdGluKHZvaWQpKSYmYWxsX3BhcmFtKDEsDQo+PiBwb2ludGVyKGJ1aWx0aW4odm9p
ZCkpKSkpKSkiLiBJbiBwcmluY2lwbGUgaXQgY291bGQgYmUgYXZvaWRlZCBidXQgSQ0KPj4gdGhp
bmsgdGhhdCBhdCB0aGUgbW9tZW50IGl0J3Mgb2sgYXMgaXQgaXMsIHRoZW4gaWYgaXQgbmVlZHMg
dG8gYmUNCj4+IGV4dGVuZGVkIHdoZW4gbW9yZSBjYXNlcyBlbWVyZ2UgSSBjYW4gZG8gdGhhdC4N
Cj4gDQo+IE9oLCB0aGVuIG15IGNvbW1lbnQgdG8gRG15dHJvIChzdGlsbCBpbiBjb250ZXh0IGFi
b3ZlKSB3YXMgd3JvbmcuIEJ1dA0KPiB3aHkgd291bGQgd2UgbGltaXQgdGhpbmdzIGFzIG11Y2g/
IEZvciBub3JldHVybiBmdW5jdGlvbnMgYSByZXR1cm4gdHlwZQ0KPiBvZiBvdGhlciB0aGFuIHZv
aWQgaXMgc3VyZWx5IG5vdCB0byBiZSBleHBlY3RlZCwgc28gdGhhdCBwYXJ0IGlzIGZpbmUuDQo+
IFlldCBhbnkga2luZHMgb2YgcGFyYW1ldGVycyB3b3VsZCB3YW50IHRvIGJlIHBlcm1pdHRlZC4N
Cj4gDQo+IEphbg0KQXMgdGhlIEVjbGFpciB0cmllcyB0byBjaGVjayB0aGUgZXhhY3QgZnVuY3Rp
b24gcHJvdG90eXBlLCBkZXZpYXRpb24gDQp3b3JkaW5nIGlzIGFjY2VwdGFibGUsIHBlciBteSB1
bmRlcnN0YW5kaW5nLg0KDQpSZWdhcmRpbmcgdGhlIHBhdGNoIHN1YmplY3QsIEkgbWF5IHRvIGNo
YW5nZSBpdCB0byB0aGlzOg0KIm1pc3JhOiBhbGxvdyBkaXNjYXJkaW5nICdub3JldHVybicgZHVy
aW5nIGZ1bmN0aW9uIHBvaW50ZXIgY29udmVyc2lvbnMiLg0KDQpEbXl0cm8=

