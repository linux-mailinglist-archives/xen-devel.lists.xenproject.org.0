Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ECFAFB236
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 13:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035499.1407804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYjy2-0003aK-Ga; Mon, 07 Jul 2025 11:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035499.1407804; Mon, 07 Jul 2025 11:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYjy2-0003Xd-DJ; Mon, 07 Jul 2025 11:25:02 +0000
Received: by outflank-mailman (input) for mailman id 1035499;
 Mon, 07 Jul 2025 11:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5P2I=ZU=renesas.com=jahan.murudi.zg@srs-se1.protection.inumbo.net>)
 id 1uYjy1-0003XX-E2
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 11:25:01 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff745f9f-5b24-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 13:24:52 +0200 (CEST)
Received: from TYRPR01MB12414.jpnprd01.prod.outlook.com (2603:1096:405:102::9)
 by OSZPR01MB6310.jpnprd01.prod.outlook.com (2603:1096:604:f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 11:24:46 +0000
Received: from TYRPR01MB12414.jpnprd01.prod.outlook.com
 ([fe80::c268:99ae:da96:39aa]) by TYRPR01MB12414.jpnprd01.prod.outlook.com
 ([fe80::c268:99ae:da96:39aa%2]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 11:24:46 +0000
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
X-Inumbo-ID: ff745f9f-5b24-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jpv/bybw++SOJi4+6so50rfX+R+PwbgN8YYdWnpnmAyeCCtjysFUo0HBGLg5XdLD7JAx/GWvAT78BjifY/5UWPOjPkWLktupNIhheBGBHi0O6avOM50Nfb7HNX+poPfLaZY2+OdP+vVUJ7+eAjkJjVDsalOtkdDqFVBHOEqIZd99h0I2D9x1kd8HV0xCrRWeUil2mzavuKtfBT+f/w22WcBlIVx0rVgN1OqMW2M/ydSBazjb0pQarYBke5T+nogX1SEJd3sl6kwdt+r+YktPWF7LJr36NDVx51A8DBwWN7gi/l4d33oG3EW5FL8ltKl8GX2iddt+kUEuJnVSehXZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvCfiNBsK76ronSfySvCSQs0MK2zl1xNq4AzfsoxSqc=;
 b=CCWk0jd4pkdLifhIkMfNhdNsupzePhYN40OToBUc22sWh5mqrrSSPrxqe0P33aqnfPYGOvxY+hzKAxseTUOd6s6ZSkZsAG2yBYqoI43dL67RZfbFc8tPY0rpx0TVJIajWnzUuz6aQhDXE1Rl0jde9QJcO/pOQcDC7RajNaRlzCHPhdvPgUUtXN4gkl/llWCZ8YnicdQ+0njYtUG/sjukxFJB1HhyKS67UQgcvqlKR49zBKLRCyd6uzONTrjyhPtO4cRbb8I0Yu0W5pZ41rNkoUtIyT1iEixD8TKxFG7Y/8geUxWTVsWNVmzXIAEljymMBWL37LsP49aIQKPI2WwF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvCfiNBsK76ronSfySvCSQs0MK2zl1xNq4AzfsoxSqc=;
 b=MmsjIqofJiS6AIOwx36TzyaEmWXCTO+XjZwKbUEIvYXUyeOZEyDD3ISW3FZUfFMO92uRYSd7WjSjUaBEsc4vv3/dfqbj/O+km7Vcjs8tp0gLlLswmY+7jS42i/geBI5U9zPcY3PsLKhnYmbtdXN9ksQcJuEbVd+wdRk5zciZvuc=
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: Julien Grall <julien@xen.org>, "Orzel, Michal" <michal.orzel@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: Enhance IPMMU-VMSA driver robustness and debug
 output
Thread-Topic: [PATCH] xen/arm: Enhance IPMMU-VMSA driver robustness and debug
 output
Thread-Index:
 AQHb4c6ALl3IHvqkBEOgbLXzyjOhU7QQXHcAgANRIGCAABW5gIAHh3bAgAAflQCACzRUEA==
Date: Mon, 7 Jul 2025 11:24:45 +0000
Message-ID:
 <TYRPR01MB124142BE747EAFF7DDDDB9011AB4FA@TYRPR01MB12414.jpnprd01.prod.outlook.com>
References: <20250620103123.2174529-1-jahan.murudi.zg@renesas.com>
 <445c5594-a003-4cd8-aa46-8544c0543b1c@amd.com>
 <OSOPR01MB12408AB9E8CD52B45381E83FFAB7BA@OSOPR01MB12408.jpnprd01.prod.outlook.com>
 <52b27bae-b182-488f-afcb-bdbfbc1a495e@xen.org>
 <OSOPR01MB12408F2C96C1E82BA03F842ECAB46A@OSOPR01MB12408.jpnprd01.prod.outlook.com>
 <32bbe11b-a92b-484a-ad77-d0354f8e9339@xen.org>
In-Reply-To: <32bbe11b-a92b-484a-ad77-d0354f8e9339@xen.org>
Accept-Language: en-IN, kn-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB12414:EE_|OSZPR01MB6310:EE_
x-ms-office365-filtering-correlation-id: f10d1c2e-a1cc-411d-f08a-08ddbd48e0a2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eC9aTTV6MzAvd0Q5YnM0UnFXVHNTaGlTV2VJUS9zV3ZpeFk0VVptYTZWRkU0?=
 =?utf-8?B?Y25OanBwRGZEZVNyeWJYYXoyN3RzUXdKemJLdWlEOUZTOUxuZUNBY3N5WUh0?=
 =?utf-8?B?cUwzSHpuaUxWUDcwVTZCUGV4alVaV2FiQVJmSEo1MlpTRUFPbjh0REY4djZj?=
 =?utf-8?B?T2lqTy9FdWdFRDFBQW8xMzUwMEg4cjd5SjczV2s5TEdBeExNbXB2MS9XdG04?=
 =?utf-8?B?cEVwV0RmYUxNTGJMOUlBbDRSMHdaOWlZandpVFZJSmpzYVN1aDdZeDVVNCt1?=
 =?utf-8?B?Wk1vRHI3NWFKaExWWXhLaFp6Y0ZWYWxzcU0wbklpTXJhWW1xS20rdnl5eisy?=
 =?utf-8?B?T0lNTExtbGx4ZFJ0bWRpWit0SkpvMGE5TURXOWVzakdYejRqcjVmakk2cWN4?=
 =?utf-8?B?ZFJUTW9hNmVNZTVIQUlOUmlNcmh3RGl1c2hUdG1aWTdCcWV3MlN2b2JEOFpN?=
 =?utf-8?B?SCtrWDZ3dVVtNmJ1eTlDZjRNL25KMXRtNk9ITkIrSEFCL2lSaDEreHlranlF?=
 =?utf-8?B?NGJmVkc3UFZiV3dNeDZjT3cwREU0VUZvYys5am9jYU9jNHNyOVlxNEthbUQ5?=
 =?utf-8?B?SVArOHdFaEhicExJYXFHaVhBY081eVJEUmxXeWcrZXBROGxZM3p1NDlNNm5p?=
 =?utf-8?B?c0dpMTJaR3d4ZG9pTERyWklXK2hjRDcwVC90Q05MQ05RakpId0tnWGVsUStu?=
 =?utf-8?B?VUlkYTRSamtEWjhudU5hSVQ5SVRDaG1va3lPTDdJOXJlTTVJZ0h4azBFMzJl?=
 =?utf-8?B?QlZZbGd1K2w5bEk4MkNINWgzZmFiYmMwdUNyaGx3U0hDRStOQXJEMzEzb1NW?=
 =?utf-8?B?T1pLNmN2S2NjY1ZHQXZYbUgyVjhiVjBkaHA5NllvZUtxMlhmSGsxWkh6U1Fl?=
 =?utf-8?B?akF6TW9UTEJHdm56UzIwaEZGbUJCdXh5OTFpV08rejR4a0RaVjI5M2N6K2tU?=
 =?utf-8?B?bVd1SGlTd0FmbTZVN0l6bm53RzI5bWdqY3BxeW40OEtuanNVOXFQQ0VPeEhn?=
 =?utf-8?B?NjJTekI2NXRVS2dRNnBCUmFQYUp3aVJpZXZ0cDgveVF0ZG0vZFNNTTFzNisr?=
 =?utf-8?B?N00wSm04NDFUTzhpdjBYOC9IRVBXOFJ2TXl1WnB1b0Z0czhBRmxVUnRCei83?=
 =?utf-8?B?WXpFTk9BazZXV0JPZ0N0SnhyMU9iY0hnU1BKV21vWk0wREdpYXVrNTl1VDJI?=
 =?utf-8?B?TkRpNElCSVNtNUZDVjh3OG9jd1hxbWM1RHQzQjc4UzFHRHJEZjZCbDBoM09T?=
 =?utf-8?B?UjlBbnBQRUllMjlhenVVQ0h2Nkl5QkJNNnNBT1h6eFhrQ1kxaGZzS1lBUlEz?=
 =?utf-8?B?d1VUbXhnQWVSbVh5Y09TbVRJNjhBVzNLUys5Njh4QWNYek5JUi96amI3RVN0?=
 =?utf-8?B?WC9lSXNOOHZlT3RocFN4ZllmMmZiNDRpS0g3UFhuWjBmYlFHVENpQUxFV05P?=
 =?utf-8?B?c1R4N2w2b0FDMnhoSkpXdDBJaEZiMGdCT29mbEkrUWdncWtrMWFqWTF4R1hq?=
 =?utf-8?B?ZnFoWjROZFBNZjA0OGRCN2I4QVFYc1hRNnFXRElkd1JndHBGbDlVYm8veWlF?=
 =?utf-8?B?SFA2WEd0cGptV2hzV0hoMVEzY0hPcjhYeG9yRU0zK3N2K3VFWVhLYzFiejVK?=
 =?utf-8?B?M3NiRnRqMlBlU2VMZm1TbGxIejQyVnNFT2tqYVFYWERTVmFRcURCeW5DK3Q1?=
 =?utf-8?B?TzN6a2kwanIxS1JqZEJJbE5XWDFLNkpybUVqSUx1VGZxK29JNmJ1OGMrWWVm?=
 =?utf-8?B?Z2VGVEl0bmVIbFdDc0ZMYURuMy91L0pnOTVjWndzeHRhMkZUYTd1SThIait0?=
 =?utf-8?B?a2J1YUFaRGFQSHNxa0FFakJ3bHNtZVZLUWcyYzl3eGlhS3BwbThZUXFJa2pD?=
 =?utf-8?B?akxsY1pKYk85M2VvRVhtWW5BSHpBajM4YWxoc01BcFpXSWRuN1ZoMmlsQjlO?=
 =?utf-8?B?MGRHTDNKWHBGSEo5WHJpL2d5bUdoenc1RjFCSEVkZFlmTjJiREZFdHJOdE1E?=
 =?utf-8?B?V1B5UWlSWkVRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB12414.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V05BZThSRU81VmZKeVlnS05ybCtESlBTSnlMVXRMbkgwVFhiU0dCY3h3UzBN?=
 =?utf-8?B?cXBtd0Z2aXkyY2c2eHlSWHdEY0QyaXE1M2VpbHF1elV1U1JmY0pkdUpuRlpo?=
 =?utf-8?B?WVFEckZoMFo3RDFSekxIdkFzb0xXSWdveGZjRjhvQjBVOEZ1R0xaemkzQm5S?=
 =?utf-8?B?dUJ2dnhYMk9ZNkVlRjNTVWJMVlJNa2JWUjRTREFVVXV2VGdOekxGM0FteTUv?=
 =?utf-8?B?U29IWkMzNlh4ZEFWa2Y0M01mckpiak5lNFc4Y3UxYVNwdWIyWGpsRkp0cUhw?=
 =?utf-8?B?NlJYZzlqR1F5Yzc2WXRHODJZM2JBSEpNMDlobHZoU0lJa2lKdEVoN0NBT1Ri?=
 =?utf-8?B?T1NjcmhOWG8wRVhHSURJdytKeGxQYzZJaUpBZ2xDQlBWWm9FbklGZFZsRDJi?=
 =?utf-8?B?MnFZVzZIT0hxREE1YnE1MjhrMjU3Mkt0Tlc5OE5Wak00SHZyNkFzNXVabHVw?=
 =?utf-8?B?YmpzenN4Qkd5MlNhQ3NIQWl1ZWNvS2cvcmk3Tis5YnN2dXJMTnMrb2RDdkJz?=
 =?utf-8?B?cWxyVUVtZER3dnFTT0JjbFVxUmdadmtTTDhCcEt5YnZtbjMxL0ZvUTljdlQ0?=
 =?utf-8?B?RXRPa3JjUFN6d2FzTEZnT2Nka1VIa1NRT3oyd25vclJkSXdQUENxNk1QQStN?=
 =?utf-8?B?ZmUrQllZZW9zYlJhck5uejRyaEJWYkNCQ2ZTRzFaRktyVVNSVmtXRTBFSmVG?=
 =?utf-8?B?MXVFeVV1WWpoWDhhVmM3am1rS1ZzdEJ1SWRhR1UzdlJ0WEhWQXpJZzdWY3JX?=
 =?utf-8?B?WDRwenpud1Q0dVJIVzVBSjJoSFVPOVFLMW96T1BOVXRTWnB0QlhHUVEvZnN1?=
 =?utf-8?B?Mmo0aVJ2aFRVZS9oVjdYdzZaamkrV0thVUdGRXBMR2RKc3BlWXFpK1o5RWZV?=
 =?utf-8?B?MGdUVG5IdVprNDd2anZLYVVKS2xPWFJuVmFlbmNGSngwNERBVDg1ZnJVcnJV?=
 =?utf-8?B?REVnaFFTcHdMMzUxaWxZWmcyRC9QTHI3WGpZS3FickdKMXQ1VjJOR2lHamZH?=
 =?utf-8?B?aVJDOTdnc2dBU2VON2hVY3RvRUJOMHh3eW5ZanlwOFBHREZJRFBwYkdoMnVs?=
 =?utf-8?B?ZmlmOWtrV0NSTmlGVXBtWm1jSFZMWVhZV01JNktHcTlodUlGcWNMaW9UMkJD?=
 =?utf-8?B?NER0M3dxTjFTZXJ5dk1Yd1MvLyswYThtMS92MDNaK2ZmQ1RRRG00Znd3Y2VZ?=
 =?utf-8?B?WGxrYjFIRnZlcjE3WUV0UDBpNVJjeFVFOGtKUTdRbUxuaWk4N0g1NDBzdW91?=
 =?utf-8?B?TVh0amUrSHVBVXkzOGdEellMM1VmbzdoQW0yN0FvVWFFNFlLOGJKOXFiRWhm?=
 =?utf-8?B?U3hnWWprYWlJYmwvaEdtMUk3QkEybXd3YkVEeCtxcVBKVVpuaEp5MmxaZDNU?=
 =?utf-8?B?dCtWYzBDc0FpRDh2TVVJa2NuZkxvRXVZOHFEZlQxaGhCY2NJU09BdVp1VURn?=
 =?utf-8?B?bW1ObnpBK25sQTFkOEp2R0tCcXI5T1VpNmF3cHhYYmNUb3BrVUpwV25kaWZF?=
 =?utf-8?B?QXlabzZGWjBSUkZUR2VBUFE4NzE3WHAzYWZ0TTQ1biswckdlQVAyNlk5SkdJ?=
 =?utf-8?B?REJVWW9rVXFNYzBYQ0w0SFdQQ3QxU25BcjdMemxQNmlaeDBpUkhPTi9OUENG?=
 =?utf-8?B?U24zKzhUT3A2MmMwalNKR2xxTjlQZDFaZytLeks5UXAwbkRBdEc1aTYzSDhh?=
 =?utf-8?B?QWdPT0Z6MFZBMjFyMkwvTGVNc1FWZUlCRXFqMExuOXFKT0hiVy9Ta0xLK09J?=
 =?utf-8?B?RmdFbHRBL0pISWppVWllT2xiM1p1cnlKNElvL0ZhVVlPejZ0ZkJEOVZWekVk?=
 =?utf-8?B?RlpHWXpYRG1zMnRkcU5DanN2c0pBQXZNRnZpV2RHOEVGNkhNZHBtV1FyMmVB?=
 =?utf-8?B?RGZ2d2xnd3ZYY2pPMmNoSWFMdFNFL1d6clpYZzhlQTB6aklPcmMyY0g0bmRX?=
 =?utf-8?B?d3c2R3dXcHp2b1dwM0hwK3libGUzSVVnU24zUHB4U3BSTFgvRTlNaGY3cHNm?=
 =?utf-8?B?ZmxOakFzUVNTSlh3NkltcU5HZThVZ1psbDRpcjAyYzJVUCtkUEI2bHlkbHFN?=
 =?utf-8?B?aFI3MmhHRFRQd0hKaXNzZDF2aXdBaE1XTHVYMEQraTVkQ0R2elBQb00rN2FO?=
 =?utf-8?B?cmpjVDNPeUNFQWpiL05kYWVvM01BNUl5YkFha0ZOMHp5WUt0V2N2OW1zeWN4?=
 =?utf-8?B?RXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB12414.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f10d1c2e-a1cc-411d-f08a-08ddbd48e0a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 11:24:46.0023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJ5t5p20z1E1gjmA4mGMWnJT6faVXxIWWpSrsJiYnn/XZ8858PW0bD8XV/UIZuM350IMeto0/47L6WPRvrSyFWMiZ2/tpOMcce2SleAK5WQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6310

SGkgSnVsaWVuLA0KDQo+IE9uIDMwLzA2LzIwMjUgMTM6NDQsIEp1bGllbiBHcmFsbCB3cm90ZToN
Cg0KPj4gT24gMjUvMDYvMjAyNSAxNjo1MywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPg0KPj4gSGkg
SmFoYW4sDQo+IA0KPj4+Pj4+ICsgICAgZHNiKHN5KTsNCj4+Pj4+IEFueSBjbHVlIHdoeSBMaW51
eCAobWFpbmxpbmUpIGRvZXMgbm90IGRvIHRoYXQ/DQoNCj4gSSB1bmRlcnN0YW5kIGZvciB0aGUg
UENJIHBhc3N0aHJvdWdoLCBYZW4gd2lsbCBiZSB1c2luZyBzdGFnZS0yLCBzbyBpbiB0aGVvcnkg
dGhlIHN0YWdlLTEgY291bGQgYmUgdXNlZCBieSB0aGUgZ3Vlc3QgT1MuIEJ1dCB1bHRpbWF0ZWx5
LCB0aGlzIGlzIHRoZSBzYW1lIFBDSSBkZXZpY2UgYmVoaW5kLiBTbyBpZiBpdCBpcyBub3QgY29o
ZXJlbnQsIGl0IHNob3VsZCBiZSBmb3IgYm90aCBzdGFnZXMuIERvIHlvdSBoYXZlIGFueSBwb2lu
dGVyIHRvIHRoZSBkb2N1bWVudGF0aW9uIHRoYXQgd291bGQgc3RhdGUgb3RoZXJ3aXNlPw0KDQpZ
b3UncmUgcmlnaHQgLSBjb2hlcmVuY3kgY2hhcmFjdGVyaXN0aWNzIGFyZSBpZGVudGljYWwgZm9y
IGJvdGggc3RhZ2VzLiBNeSBlYXJsaWVyIHVuZGVyc3RhbmRpbmcgd2FzIGluY29ycmVjdC4NCg0K
PiBOb3RlLCBJIGp1c3Qgbm90aWNlZCB0aGF0IElPTU1VX0ZFQVRfQ09IRVJFTlRfV0FMSyBpcyBu
b3Qgc2V0IGZvciB0aGUgSVBNTVUuIFNvIHRoZSAiZHNiIHN5IiBpcyBjb2hlcmVudC4gSG93ZXZl
ciwgSSBmaW5kIGRvdWJmdWwgYW4gSU9NTVUgd291bGQgaGF2ZSBhIGRpZmZlcmVuY2Ugb2YgY29o
ZXJlbmN5IGJldHdlZW4gdHdvIHN0YWdlcy4gU28gbWF5YmUgd2Ugc2hvdWxkIHNldCB0aGUgZmxh
ZyBlaXRoZXIgdW5jb25kaXRpb25hbGx5IG9yIGJhc2VkIG9uIGEgcmVnaXN0ZXIuDQoNCkV4Y2Vs
bGVudCBvYnNlcnZhdGlvbi4gQ3VycmVudCBSLWNhciBJUE1NVSBkb2Vzbid0IHN1cHBvcnRzIGNv
aGVyZW50IHdhbGtzIC0gd2Ugc2hvdWxkIGluZGVlZCBzZXQgdGhpcyBmbGFnIHVuY29uZGl0aW9u
YWxseS4NCg0KID4+IGFuZCB3ZSBtdXN0IGFsc28gcHJldmVudChtaW5pbWlzZSkgYW55IERNQSBv
cGVyYXRpb25zIGR1cmluZyBUTEIgaW52YWxpZGF0aW9uKCBvYnNlcnZlZCBzb21lIElQTU1VIGhh
cmR3YXJlIGxpbWl0YXRpb25zIGluIHRoZQ0KZG9jdW1lbnRhdGlvbikgLg0KDQo+IEkgZG9uJ3Qg
dW5kZXJzdGFuZCB3aGF0IHlvdSB3cm90ZSBpbiBwYXJlbnRoZXNlcy4gQnV0IGlzbid0IGl0IHdo
YXQgeW91IHdyb3RlIGFsbCB0cnVlIGZvciBzdGFnZS0xPw0KDQpDb3JyZWN0IOKAkyB0aGUgaGFy
ZHdhcmUgcmVmZXJlbmNlIGRvYyBndWlkZWxpbmVzIGFib3V0IG1pbmltaXppbmcgRE1BIGR1cmlu
ZyBmbHVzaGVzIGFwcGxpZXMgZ2xvYmFsbHkuIFRoaXMgaXMgdHJ1ZSBmb3IgYm90aCBzdGFnZS0x
IGFuZCBzdGFnZS0yLiANCkdpdmVuIHRoYXQgdGhlIHBhdGNoIGhhcyBhbHJlYWR5IGJlZW4gQWNr
ZWQgYnkgTWljaGFsLCBjYW4gd2UgcHJvY2VlZCB3aXRoIGFwcGx5aW5nIGl0Pw0KDQpSZWdhcmRz
LA0KSmFoYW4gTXVydWRpDQoNCg==

