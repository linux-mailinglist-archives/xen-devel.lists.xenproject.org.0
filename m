Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21F8B3322C
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 20:59:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092279.1448245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqFvl-0002UH-97; Sun, 24 Aug 2025 18:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092279.1448245; Sun, 24 Aug 2025 18:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqFvl-0002RB-60; Sun, 24 Aug 2025 18:59:05 +0000
Received: by outflank-mailman (input) for mailman id 1092279;
 Sun, 24 Aug 2025 18:59:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Bk9=3E=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uqFvj-0002R5-Nc
 for xen-devel@lists.xenproject.org; Sun, 24 Aug 2025 18:59:03 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65cf8936-811c-11f0-a32c-13f23c93f187;
 Sun, 24 Aug 2025 20:59:01 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PA3PR03MB10986.eurprd03.prod.outlook.com (2603:10a6:102:4b1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Sun, 24 Aug
 2025 18:58:59 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Sun, 24 Aug 2025
 18:58:58 +0000
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
X-Inumbo-ID: 65cf8936-811c-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVrjZvp2y2vGce7LCB7Ym809uDripcYpbWIHfFGfGAwxjsQg9dNBjcRJVojO/BzcEABL/ASy4NKyw8cf7ijqolg4adRk/g/ijeRoeQVK8WKoJn0xc9zXQeb0OcPMWKEFv4uV5bVLnqxxKXJlnka+3qo2kvDseerzLtFBsWqAWTQe9o8evFiVd9gjjwiuhz9Gc4Cg/DGrb7GJkuVMh5cQ8KT8YWt5Pq6sH27BeVZmZIKL+yi+mu7zZaC3e4nQ/s0lNZZKbLl3dXPYPU1iovTdmg3waub5Amkk5c9KxHsbIigmSsMYM6f2bJY0RmC44rlzAh60alb6K3fNCaLDnOLIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1hoL/+ctGGKIGAtorReJ2xI0e59MKaEmobUEgGH668=;
 b=BwyzWI0OcIn6k+2bFE7JkxAFeE1fcs3LhGNJ+SLi0Msm7R7JVRW1TOuWQNexQH+e7iVSbwNfMkabJ91ysOVl8vQjue5VobXDRro2XF7eoi9r9EK/sH9KbHT1m3oKSBTLicI7Fr1LOKejgb1kqiMdvuxcHAVHwt5oZjR+tMtIX0qAQqW9ilQinbpe6y+AHoXxsYb/Y33EwJcie3c2cDTBivBAUIzZ31mn8NrnBZhWRmUTMdzW9r6GgBzKMCh5ZBXWAZ4LbYwq8fgkYYrhzS36jL5mPelGmIRjKie1jSdHVVow9HeZCzI3FmEKEzp7cHQyNOptp3h2ZhVjxyLsD/mPgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1hoL/+ctGGKIGAtorReJ2xI0e59MKaEmobUEgGH668=;
 b=dFjjY7DmOrZURJmGx7PYUqcpC9YljrldWcor4BJ8xE/2tC+yNasdi/F52O7FKGyySsylEpayjKcuaXTJQM7TslR8JeVcPqt8M8sXOSFbSq5pomC35MDakClZgW1sT9J6R7WvzHDjJBPl/UDQmqat7qOR/bLz5c6pzCJBMJCUivG4rO6dibftBdbJhCCMAcDyZjdv17gM712IZbfXUT3MuVJAOQeUTCpluAKc0DahplccYUZC3gbW7MoippamyMMPtFmOXB+wYNhsVNqmQ+EsZXaiV0Gi64FEa7uM+bqK32a+9jDl4vMHNkRI7Hz5WWFbUVr6IEd6uIho2fEdNctOmw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 00/10] Introduce eSPI support
Thread-Topic: [PATCH v2 00/10] Introduce eSPI support
Thread-Index: AQHcB5d6CNAyJbck6EKQNoQgtljZhrRyJ8YAgAAbVQA=
Date: Sun, 24 Aug 2025 18:58:58 +0000
Message-ID: <ee73916c-1680-499e-ab30-3ec49ae4e48a@epam.com>
References: <cover.1754514206.git.leonid_komarianskyi@epam.com>
 <9009233a-69b6-4b6d-b8c5-02550035aac3@gmail.com>
In-Reply-To: <9009233a-69b6-4b6d-b8c5-02550035aac3@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PA3PR03MB10986:EE_
x-ms-office365-filtering-correlation-id: 2cab072e-245d-40a4-30ac-08dde3404861
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?alMxUk5iK2hFNnNuYWE1R0ZjQ0JDWXYyalFrR2dSMGU1dkV5V29IL2NoMmUx?=
 =?utf-8?B?MTNqQlVqZDJEamFGNEEzTTkyTFdDRVFkQWdiZC94cjR6dlRZaGtoWTRrTmQy?=
 =?utf-8?B?M2xiMFVaa21DR2E0SVhpQURTWGRzbGhNTDVsWWVHcUtiSlFSTEVCaHVJZjNi?=
 =?utf-8?B?ajVwMDZGMDZzbmNRMUMxeTJlLzFKTWIrYy9NUWxRSVk2VU5vTkFYRXVoY2pW?=
 =?utf-8?B?OHhQcGgzUDlqMVNUdk9JS1pwdU5pTVFyZFEzeXd6R1RqS1gySko5R3h6UDBB?=
 =?utf-8?B?a1NUc20wKy9jVCt2SHI3dGdNMDVRbzYzZDdkTkRpY092Wk5iVFdnOHF0b25p?=
 =?utf-8?B?TnF2ODhtYWNMY3RTZWErS3U3TTZnS2FnWHZtU0d0cVJqMmFxbFNLZldGK3ZU?=
 =?utf-8?B?TmNCZEcvMFY0ZHRvZFUrUGdMWFNqUkc3RDFaZitnNGpoaTFORld0Q2ZQT2J4?=
 =?utf-8?B?cXloMjNSa05Hb1ZNcVRJTlZYV3ZnY3dlOWkrMGhTSEYyNC96TXB5RDBpUVFS?=
 =?utf-8?B?dVkxZFBXQ3FTbWlON083WUkwR3FuRFpFWGRpdWlKNFlqMEZyOGtlV0FRRzdn?=
 =?utf-8?B?bWJ5cU9JOEpVWE5IOEZyRzZBNGNpUVd3RDV6aG5JN2lqSW1MaTVXWXNWTFA4?=
 =?utf-8?B?b0ZHY21nMDB3REFwbFhTanlITlBYSmFDUlpFTDhneU1pa0NzVlE2NzFJVm1M?=
 =?utf-8?B?U3dKMkNkMFZXS0VLczQxT0VwTHQ2R3Q5REhZOVZ0R3owRDZQbVJacFFCdjZT?=
 =?utf-8?B?K3lpWGNNVEZ4aXZ0T05XK203SUQvYUtrMlk0Witia1RBUHJUcU5KaUJLc285?=
 =?utf-8?B?SkVvM2w1OWZnMGdVaTAwOHlNQkF0a2E4UDFuTmRHZUhDU2VOcThrU2VUN0Zi?=
 =?utf-8?B?S0Zla1NRNWg0NEQ2MmFocFpBT1ozN3RSdEVUVzlxWXBwOVAzV3pOdHJCdWF3?=
 =?utf-8?B?cXgrUTRZNlZYbnNvRGIyMktwQldYeHVGeXBYMTAvbG9EQzhtRm5hN0tRb2JV?=
 =?utf-8?B?Y1Z4SUdVaWh4M2NIYjNlSXFqSFlNaE14NVYxbTNUVDlJQ2NZc3Y1enN5TWw5?=
 =?utf-8?B?TGk4ZFlub1V3cmV4dHZ5SGZPa01GZkl2Qkp5K1NEbkFvWC9wTkJTbm12Zm02?=
 =?utf-8?B?cVN1UTJRbzl2ZklVT3pFaEwvRUVjZGtDOUViNk9aR2tWSGNweW9FNUd1T2d1?=
 =?utf-8?B?U2pyVXhDZ2treTlpVFozVjBTQXpmMjV0eE4zVzhPNGp1V05MMzRFSC9ITTh0?=
 =?utf-8?B?UmlBbG9tOUpaZFF3UFoyamVPSDdoN1RLOXR5cEQ4akViNHkxNWRPOWRVY0NO?=
 =?utf-8?B?MHhUS3JMR214QndwNU1ad2FvTlo4L21KMzRJMGNEV3ZwOTZvVmM5UmZXRFF3?=
 =?utf-8?B?SmI5QU5qUWhkdXBHUExSbDlTZlRVL2ZkVXVvYktEMzYwMnRzSG9WQ2syWlJO?=
 =?utf-8?B?TWVmREc3b2xFN3pKN2VGWTZzQWlSZ2JHTTk1N1UxSm9rT3Jqb2tockIzKzhv?=
 =?utf-8?B?Szl1ZFprODRjZkRCeVRIT2pKTGZGcUVtTG9KL3B4eHBtSDZiQUlOaUVrQm5P?=
 =?utf-8?B?ZzhPUkFoWlI5d1pCV0hJeldMTkQ5Z2htSTR3QVR6WWU1MmtzL3hGV2lIU0Vr?=
 =?utf-8?B?bGI2TlpMZEJhbVZTRnNlZ1NkTlhtbXVyQUozU1d5NUlwKzZ1UHJYMUpPWlBn?=
 =?utf-8?B?bzlVV01ZaHVXNTN6WkNod281MFBVSUJJcFdHMnBRWEpFRWFSQW5zTGZXRThH?=
 =?utf-8?B?cW5WNmF5OWpUb2dlNk10S1B3YlovVnQ2czZ5TjY0eThFY05mNmpNSlNZKzRN?=
 =?utf-8?B?YUxkZDJ0UVBERkpNNWxiRFRjZmdEYm5GK1p5SEJUTXJZNThvejR1aXFOdDFa?=
 =?utf-8?B?RXBKY3BmVU96ZmJsdlVxb0d1K0Z0NzBlWHZwT3FYOEJMMTM2ZHRuRFZIL2tU?=
 =?utf-8?B?MXZrVHlDMW9pR1gyM0pnL2NIUWlFdWNVeUEvVVptVkpNSldlWjdlcVZRNVpU?=
 =?utf-8?B?bXZKNm1vQ1V3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YlhSVEhZajZIQkc5eVcwOEtsditGNE5OM0hvVXk4dFV4RHR0RDFsa0w0ZElD?=
 =?utf-8?B?eStyWnJ5SEdsZHlBOGRHaXRJbjMwVndMd0lheFpLUjdxNEErMFd3NVR3c0V6?=
 =?utf-8?B?VzZDbEdhZVhtbkY0NlZ6MmdDR0JFdjdEZW9CakdLMGNwZXBNN0JmMkc4Y2Jq?=
 =?utf-8?B?RmhtNWhmcUNhTnNycFVnUVJpWEYzNnpjazNlR2FRL3VkRGg3d2dDOHc3MlBr?=
 =?utf-8?B?VmdudFcvS0lrRmdydG5ZNmkyRmZwKzV0TE1rbG40UnZZNi9WUUFMYUI5ZEtw?=
 =?utf-8?B?Y1BoL2RHNUNtOW5LUEtZUENHOUtUVGI0MXg5NmFLRHJnU1RTb2E5N0xRdWNZ?=
 =?utf-8?B?a0xXeXptVEV1RktCWWtEaGlPQkpLU1ZCeDBYcHB1N0ZoL0k3cHpMQnl6OHFz?=
 =?utf-8?B?V1pZc0xmTzVRSmd3YWhsc0ZFeTdtemNTS1V4ZkMxUmV6SUZZYitUY1plVCsw?=
 =?utf-8?B?d1ZiUUNzNWVLYSt4U3lQdU5XK05tNDVyTVYzN2U5ekNwaElRTFY3eGtlc0hn?=
 =?utf-8?B?QjRKYTFtSG1pQ3dqemlGR0pueTZFckRLbFkveHAraHVqYUZ3MEVTOHYweEY5?=
 =?utf-8?B?ZG5sM2h0VjVCQlNFZENmQ0ZNUFB4dG05Mmw1dUdOWEc4TkpkQ0RDb0NTbmcr?=
 =?utf-8?B?d3lGU3d1U3FubDcvb3h0ZFR4YXNaM0tVb2NNUStqWUxCWmJpdUpkWXk4SURv?=
 =?utf-8?B?N0xGTnVRWXRXL1lLb3NqTFUxRHgvcURGMyswUzdNdGliUXFQZ0loSnR3NGh3?=
 =?utf-8?B?aUZrdGgrNzZTY05KL3ZUYzMxRktLYThlejRsdlN3NVNRMndsSjBkN2srWTZO?=
 =?utf-8?B?djFKMFBYQUU1dDVCRTdLZEN3QTBVQkVnVUk1SjdacVJKbGo3NkNiWHI3ODVV?=
 =?utf-8?B?NWlQUnhlSUt3ZEpIUE50OXFaK3ZDcTRIbko1bFlsb1RENDhSK0tJMHYwb3hG?=
 =?utf-8?B?QkJaaERnUENDcFZuOGVMR01MamlNMDNIVzdTUmJUa2hBdU1SeFVzYXE4VXBl?=
 =?utf-8?B?UFpJblpDZU02WVVydWFKcVJHZGk1N0RwZ2hYWWN3cTcrc3NZaWZqK1pzdDhj?=
 =?utf-8?B?ZGlCd3lsMkpNOFJ5ZWRjd3BGQzRpZVpDWmhQZmxpSllUNFBjeW12NHpINjZK?=
 =?utf-8?B?VTVnSTltVFNUVTMvZGllOWFmZm1ZV0trVjhpenBjWTZqNEFvbi9aQk1Iak5K?=
 =?utf-8?B?UU1JbXR2eERPR1hCdXkwSHM2R3lKREVrZkVVZ05EUWlnSzQwdDQrbUhEWktn?=
 =?utf-8?B?YTBUb1RibUhMOEJRaitQdVZOUExYdzR5VWd4K21SQkIxcklPZ3M0a2NSUzA5?=
 =?utf-8?B?OGVrL1NCYVliYy8rUSt1MEhzWjlkLzBrcDVicXczS0Z2ZUQ2dk0rQzNrOCtx?=
 =?utf-8?B?c2FNTUh5cTJ3d1dHTzdVTmNjdnpyelJtM2dhQUt5VlJoeEVoRXVoOFIzc3lO?=
 =?utf-8?B?cS9DU1lZSk42OGE3SmdSbVVSdWRSUE85eWxtYkxNUndIaWpTR0JGNk93SURR?=
 =?utf-8?B?SVo5KzgxQUl6RWZIVTBsZ01WYVhQeHQ2WWlTcGF1MllsQklkMllVbXVuR1FG?=
 =?utf-8?B?eVRQeXY2czltUTE5Q08rcGVCODFqa3RMZHJ2UzI4dCtXeG5xQTZzVXIvaklS?=
 =?utf-8?B?MFRoOUZXRHhwSnVweWNSNUM0UUhMKzB1Nmx6eXNWdHBUWHRuc1I2Vml2QjVm?=
 =?utf-8?B?dVhQVGFWNzRaeHdEWlJPV0d3QlR1VURaMGxVZm0rcEE3S1V4SUxZcDhPVWwz?=
 =?utf-8?B?d2ZpU2thd3czSTh5dmg1MkVYVEZzWTB4ZUNqanZNZTNaVmdRVjY3MkxwUUk3?=
 =?utf-8?B?R0FnZ2hlWEFnRWhXVm9scm8wcGd2dHBzdjhjdm50eXk2ZlhyajB1V1JseE9Q?=
 =?utf-8?B?YWpWdGlieHBSYk4rejVYY1RDbUpFbm5VamFPclYzbGlXb29ONmp3NDZ6Qi9w?=
 =?utf-8?B?OHlVK01qYzk3VVlPTUpkN1c0TUk2STZWb29wSlRZOFpqdk9OdkhLYUlUKzFE?=
 =?utf-8?B?SHpIOXJKeGZxbUpuNEFnUVRmUzB0U0R6ak0rdkVQbmNnUC93TWhTc0hXRnJp?=
 =?utf-8?B?YlB1S2xHeVFTNks0dmkzem51Ri8wQUN1UnY3a1lCOWNXVU9TWEd6WUd5dzNy?=
 =?utf-8?B?bTN5UWNNandZRFVFbnM0K2NVcndlUE1jd1QveXVTa2xhV3k3bE9wVFUwelJ5?=
 =?utf-8?Q?Py09IqIv7zJCQo7A2jqy0R8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EAD88EC9442E9429FC3A47F9CB1B2CC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cab072e-245d-40a4-30ac-08dde3404861
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2025 18:58:58.7866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gbJsztLqL1/4rMBlEoUYAVM7Pp4+Q30XEkFj4eHQbbmDi6QgF5O21vezHTm0oFSMMbqZ1cPuL61tO53HPzvUG4YVHI33U1CVmmMDIZyaTzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR03MB10986

SGVsbG8gT2xla3NhbmRyLA0KDQpPbiAyNC4wOC4yNSAyMDoyMSwgT2xla3NhbmRyIFR5c2hjaGVu
a28gd3JvdGU6DQo+IA0KPiANCj4gT24gMDcuMDguMjUgMTU6MzMsIExlb25pZCBLb21hcmlhbnNr
eWkgd3JvdGU6DQo+PiBIZWxsbyBldmVyeW9uZSENCj4gDQo+IEhlbGxvIExlb25pZCwNCj4gDQo+
Pg0KPj4gIyMjIEJhY2tncm91bmQNCj4+IFVubGlrZSB0aGUgTGludXgga2VybmVsLCB3aGljaCBo
YXMgc3VwcG9ydGVkIGV4dGVuZGVkIHNoYXJlZCBwZXJpcGhlcmFsDQo+PiBpbnRlcnJ1cHRzIChl
U1BJcykgc2luY2UgMjAxOSBbMV0sIFhlbiBjdXJyZW50bHkgbGFja3Mgc3VwcG9ydCBmb3IgdGhp
cw0KPj4gaW50ZXJydXB0IHJhbmdlLiBGb3IgU29DcyB3aXRoIEdJQ3YzLjErLCB0aGlzIGZlYXR1
cmUgbWF5IGJlIGVzc2VudGlhbA0KPj4gYmVjYXVzZSBjcml0aWNhbCBkZXZpY2VzLCBzdWNoIGFz
IGNvbnNvbGVzIHJlcXVpcmVkIGZvciBib290aW5nIFhlbg0KPj4gaXRzZWxmLCBtYXkgcmVseSBv
biBlU1BJcy4gQWRkaXRpb25hbGx5LCB0aGVzZSBwbGF0Zm9ybXMgcmVxdWlyZSBlU1BJDQo+PiBz
dXBwb3J0IGZvciBmdWxseSBmdW5jdGlvbmFsIGRvbWFpbnMsIGFzIGFueSBkZXZpY2UgdXNpbmcg
ZVNQSXMgY2Fubm90DQo+PiBjdXJyZW50bHkgYmUgdXNlZCB3aXRoIFhlbiBzZXR1cHMuIFdpdGhv
dXQgZVNQSSBzdXBwb3J0LCBYZW4gY2Fubm90IHJ1bg0KPj4gcHJvcGVybHkgb24gdGhlc2UgcGxh
dGZvcm1zLCBzaWduaWZpY2FudGx5IGxpbWl0aW5nIGl0cyB1c2FiaWxpdHkgb24NCj4+IG1vZGVy
biBBUk0gaGFyZHdhcmUuDQo+Pg0KPj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZv
ciB0aGUgZXh0ZW5kZWQgc2hhcmVkIHBlcmlwaGVyYWwNCj4+IGludGVycnVwdCAoZVNQSSkgcmFu
Z2UgKElOVElEcyA0MDk2LTUxMTkgWzJdKHJhbmdlcyBvZiBJTlRJRHMpKSBmb3IgWGVuDQo+PiBh
bmQgZ3Vlc3QgZG9tYWlucy4gVGhlIGltcGxlbWVudGF0aW9uIHVzZXMgYSBnZW5lcmljIGFwcHJv
YWNoIHRvIGhhbmRsZQ0KPj4gZVNQSXMsIHNpbWlsYXIgdG8gcmVndWxhciBTUElzLCB3aGlsZSBt
YWludGFpbmluZyBjb21wYXRpYmlsaXR5IHdpdGggdGhlDQo+PiBleGlzdGluZyBTUEkgcmFuZ2Uu
IEZ1bmN0aW9uYWxpdHkgcmVtYWlucyB1bmNoYW5nZWQgZm9yIHNldHVwcyB0aGF0IGRvDQo+PiBu
b3QgcmVxdWlyZSBlU1BJcy4NCj4gDQo+IA0KPiBJIGhhdmUgbGlnaHRseSByZS1jaGVja2VkIHRo
ZSBzaW1wbGUgQXJtNjQgWGVuIGVudmlyb25tZW50IChkb20wbGVzcyANCj4gRG9tVSB1bmRlciBR
RU1VKSB3aXRoIHlvdXIgc2VyaWVzIGFwcGxpZWQuIFRvIGJlIGNsZWFyLCBJIGRpZCBub3QgcmVh
bGx5IA0KPiB0ZXN0IHRoZSBlU1BJIHN1cHBvcnQgKHRoZSB1bmRlcmx5aW5nIEdJQ3YzIEhXIGRv
ZXMgc3VwcG9ydCBpdCk7IEkganVzdCANCj4gd2FudGVkIHRvIGVuc3VyZSB0aGF0IHlvdXIgc2Vy
aWVzIHdvdWxkIG5vdCBicmVhayBhbnl0aGluZy4gU28sIGluIGJvdGggDQo+IGNhc2VzIChDT05G
SUdfR0lDVjNfRVNQST15IGFuZCBDT05GSUdfR0lDVjNfRVNQST1uKSwgSSBkaWQgbm90IG5vdGlj
ZSANCj4gYW55IGlzc3VlcyAoYXQgbGVhc3Qgb2J2aW91cykgcmVsYXRlZCB0byBHSUN2MyBlbXVs
YXRpb24gYW5kIFNQSSANCj4gaW5qZWN0aW9uIGZvciB0aGUgcGFzc2VkLXRocm91Z2ggZGV2aWNl
Lg0KPiANCg0KVGhhbmsgeW91IGZvciB5b3VyIHZlcmlmaWNhdGlvbiBhbmQgcHJvdmluZyB0aGF0
IGFsbCB3b3JrcyBhcyBleHBlY3RlZCANCm9uIHNldHVwIHdpdGhvdXQgSFcgZVNQSSBzdXBwb3J0
OikNCg0KPiBBbHNvLCBJIHRoaW5rIHlvdSB3YW50IHRvIGRlc2NyaWJlIHRoZSBlU1BJIGZlYXR1
cmUgaW4gdGhlIENIQU5HRUxPRy5tZC4NCj4gDQo+IA0KPiBbc25pcF0NCg0KT2theSwgSSB3aWxs
IGFkZCBvbmUgbW9yZSBwYXRjaCBpbiBWMyB0byB1cGRhdGUgdGhlIENIQU5HRUxPRy5tZCBmaWxl
Lg0KDQpCZXN0IHJlZ2FyZHMsDQpMZW9uaWQNCg==

