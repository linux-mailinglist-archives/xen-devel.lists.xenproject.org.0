Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B66B3CBE2
	for <lists+xen-devel@lfdr.de>; Sat, 30 Aug 2025 17:24:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102996.1455056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usNQ7-0007cC-O5; Sat, 30 Aug 2025 15:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102996.1455056; Sat, 30 Aug 2025 15:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usNQ7-0007Z3-KF; Sat, 30 Aug 2025 15:23:11 +0000
Received: by outflank-mailman (input) for mailman id 1102996;
 Sat, 30 Aug 2025 15:23:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dd82=3K=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1usNQ5-0007Yx-SL
 for xen-devel@lists.xenproject.org; Sat, 30 Aug 2025 15:23:10 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ae18bae-85b5-11f0-8adc-4578a1afcccb;
 Sat, 30 Aug 2025 17:23:07 +0200 (CEST)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by FRWPR03MB10957.eurprd03.prod.outlook.com (2603:10a6:d10:170::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sat, 30 Aug
 2025 15:23:04 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%5]) with mapi id 15.20.9052.014; Sat, 30 Aug 2025
 15:23:04 +0000
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
X-Inumbo-ID: 3ae18bae-85b5-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMjYtqEy965P5dU2s+wIt/4FSYCahjk9oDn036drtew1dew4GGIXCbEt0ss46UsfrkobzxziApb98ToCLRQ7xD85F7GB+HAPyUyK+M3co8RcEPaeccOji14vDecezgsBwt7SKYTzlTEeMgWyebih+0n2CYEqPQU5ZhCQDsBZkv7hfm/QzW7OiwUziRKRj2sZ8vvAb4nTCuUCAAK9RPB1xhjno/9Mnrp9Ct+sBrY6g0AB/d/WWqQUlRxUlguSgovjsy45HEKBZ+yloyGMkAUGbzc1dF6X9ws4611aFfXsDHJebTsksBxne8LuNCMs1vACUFcIbD+Vxs5jgHP3psWwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXPaRT1qT0GMAyOhGXjgCFnE3h10qNG6IscIq1YCa2s=;
 b=y3Wro/8e2H2HNIYMcHuGuboJlazkhmQhmVGMT/lmAsyii6WpnVSJ3lovO/h8Bv8/r8mn6nCN6vb0wAuf84HLjczOmFRbfPmmTSgw/60U+2ftRtWO34LHAFlg/XRNR8+nrAL7GlO9BaHT6XUmAYNHZQYXnkWWZtif1DW5ONAKgiScG4iyscIxn6IV1NjS+i8UBBaxd9wJd+W2PjX4Yb/9UE7//kXVo+qzaSXR1MzMe3eiU5jM/ZUKvr8YEXnUkJKa+2mkvZbLmeYELz9f0OxCoFAX1QCViTK/WhqBu8J0kf5RkF4zU/ZThjLmdOgPp6luCHG93wEl714+OT+WfV7jNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXPaRT1qT0GMAyOhGXjgCFnE3h10qNG6IscIq1YCa2s=;
 b=C8RiUclrmxrzHpWEBXrxqR/pzq8US95UfxM3tNMY1BG1R/tWOeYynhXvnVbo7CwyPOcxRyldTiKJpfRdF0JgyFr7J21X09dCHD5RnQdnJAtKL/aKqKBX5TD7V/Mq3jHGi7HjY9EBBD2dI+qlJKmnbiuzlqPYxYsrRF4lzg/6Tlkrk6qn53T4bPIAXwOOvt6Dib/WUYsUJsuRbPWN64V0XfrURciwOxLX1U2U5MKmEusR5ADr66k79JqMA694ujZFJj9rkLkLi1e+S30OkFrJNXBt+8BeZm59tYcUra+7wq0kyoOlCQy1LcwYQHv+vFHuUIjYcGTDASfHfjZykbN1qQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <b24cf3dd-2f82-4470-8c6e-1f32e0564cbd@epam.com>
Date: Sat, 30 Aug 2025 18:23:01 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] xen/flask: limit sidtable size
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250822095123.998313-1-Sergiy_Kibrik@epam.com>
 <1797679c-582f-4b75-a036-ad3bb00bad4d@suse.com>
 <1d34d0ae-f3f3-4b25-ae67-6c4f6be2e2bb@epam.com>
 <59e884d4-e111-474c-9794-dcb190de8eab@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <59e884d4-e111-474c-9794-dcb190de8eab@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::21) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|FRWPR03MB10957:EE_
X-MS-Office365-Filtering-Correlation-Id: fd984174-2cbf-46af-9c8d-08dde7d91d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TCswZ0FhVDZFRnhBNDJSTmhWa3AvVWRBYTMwcFBJaFl0dFgrMWgvZ1M1Vjhn?=
 =?utf-8?B?ay8ydDR5LzNBbWZZNWFTSEZZMGNmVU9rZWovTjFWWE9qbkhBQ3kvKzdDdCsr?=
 =?utf-8?B?dEE5dWszZ3hFcS9lR1cvTTZUNWRzRUJmU0RpVmttZlo5ZDc1V3p4YXFoMVhx?=
 =?utf-8?B?ejZOa0V2R3ZFV1lCYWdqZVJhcVJOcWlmUS9MZGtPSDJFOGlacTl1WmlveDBi?=
 =?utf-8?B?bW1sdGJYelY0aWNnMTNTTXpnTTBnVmQ4T09FVndHN1hWVitQd0xqb3RqaWpO?=
 =?utf-8?B?K013MEd1ZEFYSWtQSTBLN21EeElEYUFZZ29JdW9QeW8rcExoaXlPSEJ5enFr?=
 =?utf-8?B?UFpRRmJJU282V0twc3ZhRDJSNHdMSjRwL3V3NjFUZTRmMVo0aXVMNjlFYVZr?=
 =?utf-8?B?WnRpYzJ1VmJkSlBGdTVYSnBjMVpra0MwbElFNzZtZlN6REdYbmpFelcwVU9i?=
 =?utf-8?B?YldNUVgzV210MThpaFpkSGZWYzlnNy9GQVZCcXA5S0tUSkppMnBzS2xWYnRF?=
 =?utf-8?B?WlAyMUJaVGZBZHBSSDFSdkN4ZGpJd291RE5HQ3pLYmN0SXZjaTI1cEZXd3Nu?=
 =?utf-8?B?ZE5QRGxQTGlxT2N2R2RzMGtuYjBObmpYelFTSjdNMW1CWFRqNFBlbE9vUzRk?=
 =?utf-8?B?VzhhRXc5bU9ETmN0SEFOTUU1OXZmRGhrNW0xcGp4MHhOQlAwbTJIUHRTZUc0?=
 =?utf-8?B?RC9LMkpWeE1nclV5M2t2Uy9IcWRjU1U4SFhrSU1SL3RjdGdmSm5rMGc3L1dy?=
 =?utf-8?B?ZXgxNXlXb05jVmNJOCsreEVFRTRUV2lsTkdRVkJpeGM5QjJ4S3R6TDFUOUlw?=
 =?utf-8?B?eHZGQlhkOUVKQjdWaDhkWnF3dzlWQ2hCUFlyK0kzOGdyNWFGOEV4Yy90Wm5W?=
 =?utf-8?B?M05qU0pRY2Vud25ZK0RrTndrazBJblFtS1k1aWZMQ2p5ZXFOQk1NMkFiN21I?=
 =?utf-8?B?eU81azZGTDNvK2dUUHFtM0gwMmp1UEVXYUVkMGF6NDc1alN3VjJCN1hVbGJ2?=
 =?utf-8?B?SFppM0dXbGxGS3Y2dGdoTmtEbSs5cmYwcFNvanhHM3d3Z3BJNzdhajhpZ3FD?=
 =?utf-8?B?Rld3M2NJdEpKV0hrcjdlTnQyeUhVcHk3TFllN0h6WVFISzlHcXBKb1VRb3hp?=
 =?utf-8?B?UTVZQzZHYk41QS83Wjg4Nk0waTVSbGY4b2xaNUZINDBOSUl4R3Z6Z0JpTHM5?=
 =?utf-8?B?RnR1R1pjR2EraTg0QTFlVEk4MGMxcC8xTkp2Ynhjc0p5eW9KbTJFdzJGZlo4?=
 =?utf-8?B?TzZXWXExcnVOMDEwSlg1V3J2elY4ZGdld2Q1STBsTVUvbkdmNWNHbDd3RWw2?=
 =?utf-8?B?RlEzRzZuZFZMNWZjb3ZtNXRIK3hiZVg5dmhldVhvTExjQm1hc3JBS0N0ZkdJ?=
 =?utf-8?B?NnI4Z1VaUmVmS2QyNU9aSkFWZW9ubUE1NjY5MUh2OTcrMUxGWElJZXdnU1Nl?=
 =?utf-8?B?cy9zcVRON0tMeFJPclBKaXJaeEtsSHBjcXpQNGZhRkozcTVEZXJLci9YZkU3?=
 =?utf-8?B?RzEzRFZwVVRwUWdLVXVBbVNlZFloeHNkamlxMHQzTWk0RUJEcnZSaU93a1Yw?=
 =?utf-8?B?a1pSK2c0NkF2emYwVEJqTTljUDBjOGVycG1tVXNaOE1QR0M3STFBWitVT21t?=
 =?utf-8?B?M21NelZxVnNOZHRGMGVHNUZ3eUVaL0ZjdUdyZU1uTjJRK3VHell0U0lpY3FC?=
 =?utf-8?B?UEVEcGZqa0dUczRtcnJOQVZkRXZpUHZkWjgybGFtOTJGUVZGUGFxekJwKzRx?=
 =?utf-8?B?WVg1c25MdkVCT1BJY2RaN3lkdCtFaVpxUE1BNWdSUTJQVzFLYkhXeFJMaFFF?=
 =?utf-8?B?NUtSWGN0cEw3dGd5UEhmd3ZaSE45eS9uazRLQk9GV0wzdlEwRWpiTVRORTZT?=
 =?utf-8?B?UkhucUlqSm1ZSVZYQXlnWXlwTFhsVFhZbEo1MU4xdXhOaER1aFNsUVVqUDlx?=
 =?utf-8?Q?p4hXixy6mDU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmlYYTdHQTJaU3RRVFFlbUtITlJXSGR3VzN0clh6NUlYZVRkZERTUGxHcVlY?=
 =?utf-8?B?UnJUSE9lYzRJNlRsVnRnNFRrc25tMExSQ1RJZ0FiZzVDMEhJMVE5Njg5WlFR?=
 =?utf-8?B?SzAzdjB3UHhwOGZKbU1VUnVzeHlyYlFsQVFnWDQxQkRxOUs0V1poZFJIT2NK?=
 =?utf-8?B?SUlrM3FiTnlobnJBeXBIcnhIVXNmVUlSVmxVZU5rV1VXUDUxeEdzOG5DbFhk?=
 =?utf-8?B?YlAvN0xvQzg5dFpJWTdibm5rVnM2WFJrMHlkb0ptYm1FRGxhQi85ZXNjN2x6?=
 =?utf-8?B?TGhjWmNCVEpVL1BEWXNiTG8wN21HUDNJSnRqZlgxRktNRnpzWVJDc05NaStw?=
 =?utf-8?B?SkkvQTBldHdHbjBxWGVXVFkycjl4WUFTL00rRHB2cWxybGZoMUJicGI0QnJi?=
 =?utf-8?B?bWZZRndUbk56bDVDbGsrc1BBbzYyQWdvSXBFUkdTbGxPeFV3U2ptMm1leWdW?=
 =?utf-8?B?YTd5K2phUFJDeTkzeENQdzhvaXp5eVFxVWtWRDViTFVGME9kRndrRnIzTmZD?=
 =?utf-8?B?NGVBcERZb1lsMktyUUxBZzArMTltK21hdE1MUDE4SlpXV1RTV0t3c205bng5?=
 =?utf-8?B?TmwyVDFMZ3ViQVVydXZoNFV0SklEVk1jbVNFTDRtMmtqL2cybWswT3ZZUzgx?=
 =?utf-8?B?MGVKU1YzWU5OVHVxRldaV0xoL2ZFMTVjcEQ0UWJNRFljM0l2MFNTdXFobVNK?=
 =?utf-8?B?UFkrbWNFSzFEZ3oxWTllbVRrNzlNalgxWUpBRXZEUkJBeEhxWkpIeTVpWjlF?=
 =?utf-8?B?Z2Rtakp2bjFEZ2wwakZtZWJ6WjFCNk1QV0djTTE2WVJGTEQ3dGlNQkowcjhp?=
 =?utf-8?B?eFAxcTMrNlMvemJPclVDa2hoTllQVCtoL3ZjVjEvalNNcm5PSDg3MVBoUTE2?=
 =?utf-8?B?Mkt2NktSWU5Odmc5VzRHSWVnN0VLR1krVGNlUFB2QnIxNVhuOWxBcURFRUhT?=
 =?utf-8?B?WDVmckl3a1NXeE5XblYwWGYxZnZXdXVlaHVuaktablhUalZUeTVwRVNubmJX?=
 =?utf-8?B?bVlCTVRadFA1QUxjTzhZRlduRkRmNHF2R1RDOEVKa2JjRzVLa0tTbnZYNDcr?=
 =?utf-8?B?RC9BbFR2aFAxUi9yd3lSTDNuUVZmQ1ZFdVg3YmVLcWhyYitZTWZNOTFkU3BI?=
 =?utf-8?B?bVRaNTNmY3pCYUo3THlFL1BnSWd0Y20wakFYWVRxN0pMY0dvSTBlQW4vQTUr?=
 =?utf-8?B?Z25rN0ZIS3kxUnVxcTQwUUVvcWcrNUtRaEh1NlYxZ1hBcDBFV1QvMlY5SmtM?=
 =?utf-8?B?Q1pDOGZEMjBIeWFVQXFQZGV3V1BkblRjdG84RkJLcmE0WjNLRkhXZEMxZE9s?=
 =?utf-8?B?L2hEYTRJNDY4SHorMStBVERDZFhzOTF1UUY1dW5neGk1NFRmaEIrWEpkM1JU?=
 =?utf-8?B?SEM1QWp1Z2EyMzVlTXpCQSsrcndRQk1kcHhGakhieUlUUU96VjArQmpUZmFr?=
 =?utf-8?B?eEtSWjNaU0orMFJlOGszTUFRRVFzdExKR3FtRGpFZGhaTkdaUzZvZWlZdTNS?=
 =?utf-8?B?NG1laHBwWllOWUMwV0ZmNlNGUDVtUTRpUHF6NGI1ZkdDbStCcVRFNGc4OGN0?=
 =?utf-8?B?WGdCQ016QjNSMFRWa0ZMYzRCam5zVjJrNC85RTlVK2Z2bmp6WkhjcHJaeTZL?=
 =?utf-8?B?eXI0WEdCR2hhSlBSNFpHeTdXNjFBa0NWandELy9ZMys4UFVrRXF4MXFuQjNN?=
 =?utf-8?B?UTJBUDlTUFc4SDN1ZWE4dysrd1duS0pUaUJBTk5qdlA4cEdUR3Q0bHFBSzhW?=
 =?utf-8?B?Q0FKZUREaTZOQ2tpcFY1U1VCUkt0NXBOcG1nY3VGUnFNcmk3MmZySmRybXlT?=
 =?utf-8?B?K0l3RTNLK3Y4b1JwTFpXdjF4NkxBd1RVZm5XNGQzSkdaYkNDWGJPWnZtZkFU?=
 =?utf-8?B?UVJ1YUwyWkMzT0gyMHo3dXg3dEtnVlRuM2pQb2lFVVpXWktNOE5rY0pUZ1VN?=
 =?utf-8?B?SEhJdXQ1RHV6TDNWRCtnbWdtemwwa3l3aEt6YkF0UllQUWVBOTMrcDdwNU1x?=
 =?utf-8?B?VzB4TzIxOVVaL1A0WjFOcTZKclY5dk9jOWVWbEVTZU5odk1Rb0pFS1FjZHdR?=
 =?utf-8?B?UUFyWXFmRkZQYlpSaUVNTy9tenNrZldYY1BVSVFCL1pMemlveWJwVm1pbGRp?=
 =?utf-8?B?L05ZRTFYeDcrZUlCYTJoR1R2cDl5bkc4eXBVbTZBSEJwNzVsd2VlYVRIRXZw?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd984174-2cbf-46af-9c8d-08dde7d91d23
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 15:23:04.0912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /aCiyTy5feBEDvUkcAP4alt07ugGnbJX3Vvu5mFP4Fp0cm11sBToFpgDUNPJJ12dKFQzx3yHR5xOyg0IMwDdVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR03MB10957

29.08.25 14:44, Jan Beulich:
> On 29.08.2025 13:33, Sergiy Kibrik wrote:
>> 25.08.25 15:00, Jan Beulich:
>>> On 22.08.2025 11:51, Sergiy Kibrik wrote:
>>>> --- a/xen/common/Kconfig
>>>> +++ b/xen/common/Kconfig
>>>
>>> I wonder whether we wouldn't better move XSM's controls to a dedicated Kconfig
>>> file there.
>>
>> you mean something like Kconfig.xsm in the same common/ directory? Or
>> move this Kconfig out into xsm/ directory with the rest of flask code?
> 
> The latter would be preferable imo.

then it probably will have to be moved outside Common Features menu and 
into the main configuration menu, while having 6-7 items. Is it ok to 
keep such small submenu for that?

  -Sergiy

