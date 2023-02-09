Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E7A690CB3
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:16:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492576.762185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8ek-0003bO-Jc; Thu, 09 Feb 2023 15:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492576.762185; Thu, 09 Feb 2023 15:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8ek-0003Zr-Ec; Thu, 09 Feb 2023 15:16:14 +0000
Received: by outflank-mailman (input) for mailman id 492576;
 Thu, 09 Feb 2023 15:16:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3QCz=6F=citrix.com=prvs=397b6fb01=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pQ8ej-0003Zg-Bm
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:16:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9e49341-a88c-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 16:16:03 +0100 (CET)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Feb 2023 10:15:47 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5679.namprd03.prod.outlook.com (2603:10b6:a03:2db::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 15:15:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 15:15:39 +0000
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
X-Inumbo-ID: a9e49341-a88c-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675955763;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gbt/S871SWKQZNPYbBggF76yvQhiVuOPzHK2tiR0vOE=;
  b=PzGBBcP1rwUS6QD+OXALlcyEn56kkTHUs/KqHGZBk3aifokPgONS20ac
   HrzVxpzT9Mce5St470i3/wlrvrfzVyvFLypWf6LHMaQo2cguUu7XtnrR0
   noA7Pp0BvgMvj2OLjzqI63KpZ6fQHRauM2Wskugh/jA8cXYH/SQKBKQHr
   o=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 96377985
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:M8nrm6qGxX4YTpujrtqgBhwOhAheBmL8ZBIvgKrLsJaIsI4StFCzt
 garIBmGOv/bZjShf9AlbN+//EwOusKGytRrSQY5pC01HnkVopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzyhNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADwKMhveveaJ+ZKqSuJrj5QtcZLtP7pK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKKEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpqKU13wzDmwT/DjUrRHqCjfjgjXKEfMkHG
 V4+93YOq7c9oRnDot7VGkfQTGS/lhwTQd1LCMUh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+Wpz6vPSkeLUcZeDQJCwAC5rHLopw3jx/JZsZuFuiylNKdMSrr3
 zmAoSw6hrMSpc0GzaO2+RbAmT3EjofNZh444EPQRG3N0+9iTIusZojt5V2F6/9Fdd6dVgPY5
 CdCnNWC5ucTC53LjDaKXOgGALCu4bCCLSHYhllsWZIm8lxB5kKeQGyZ2xkmTG8BDyrOUWO1C
 KMPkWu9PKNuAUY=
IronPort-HdrOrdr: A9a23:XkVGHKDIhC3WFDjlHel+55DYdb4zR+YMi2TDtnoBMyC9F/byqy
 nAppomPHPP5Qr5G0tBpTn4AtjnfZqEz+8N3WBzB9aftWvdyRCVxehZhOOJ/9SKIULDH4BmuZ
 uIPJIOa+HYPBxWgcP7/wWiA78bsby6GMfBv5an857Bd3APV0gl1XYfNi+LVkl7XhNPC5YaGI
 r03Lskmwad
X-IronPort-AV: E=Sophos;i="5.97,284,1669093200"; 
   d="scan'208";a="96377985"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2EotzuG5oPOfW7TwThUSh5rn+6y45bw1WVxrUoERe7/bHcZVmo+RNKm6dvKVlEm5cp3Mt7AB97zAiECr4cQLUqOilAax9OwzYfjwU9QbKRUJctHQvTU8lJEGJ/qmi5UsVAeCFBtNCyCpsYYYpbWEU0ijYD7IOVTJ6q6XvKbzydFQnyZ7mgpKVlSidwfTjV5J7IcqpL1SaqP420Gx5FEgy9eiI0iD1zsa7VZ7PCbzOkIyj79lwdGdJrGds7bIuAT1qWL8Tsi+ocsXCS7SclHdvR7uAKj3xRnXKSQcvmnQvDac4AlzRjdZ45UgnAZKO3N96HCJhHNAncHyxtqlGQs3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1dy27LkRf7OQPFi3BOzbyJXyGzwsItRcKR442purcQ=;
 b=mPwVGXx6QwuRpIZGQUSkBSx8oaPDksXeKcvRqioBQHYi1n1fMTvHuGex5GJvGr6GAtBm4JpTy/6ZMxamWFHEL88S8oKbvaaBxAUhMyMGG00qYyheegAsbhKrXagWaIUGtdLRIRdkC3ZEOdgwknajejXMoaPJBnYwMAm9E9PffOXhRqL3mP5MMsBb60+o69OX2sYQr5VQrm5O9DVku/QmV2/6HT7dHZMX18+HQ9UC6pvZmIblkkAUqWOsNFj1THph+T1HlG3+JYlpYefcbghwYrr0JQBA65jz2/vybEzzhEM6YtC/IwUp9Tj5eQjC8SXBqLPqZQ/fQLc1eFxSBOVQxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1dy27LkRf7OQPFi3BOzbyJXyGzwsItRcKR442purcQ=;
 b=b9u33uEcaNXeQxmTua1lGGRcjNJ/ZJo7r2xrclWSuTOzyk47klZTrHyJiVhQFmlWVSONnFvLo+qlMdC8I95LPTiESrbnsZ0ZU3RNX38r7mAWciGJxQkaRMKJGFsASSwRAm75bmlIc/9wFPTo1TfOaZMS2/cIL4/VaBwAdQQUQKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <201204d9-038b-9edf-8132-fa697ab36175@citrix.com>
Date: Thu, 9 Feb 2023 15:15:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] docs: clarify xenstore permission documentation
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Edwin Torok <edvin.torok@citrix.com>
References: <20230209144148.4132-1-jgross@suse.com>
In-Reply-To: <20230209144148.4132-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0490.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c145a3-e6b9-4a79-1ae8-08db0ab080cb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QCq3yxw15x16EDgEWJgmDM4KFC9IyMjgL2TYTlZ6bviXoXZXUvFN5EBwmsebO5R0ZJK4e66R4O/m73dtKyq3F/C+nDRJ9fMggarMmfEdnipsq82YkZR/hJ2NDxDzhDf6egS5BZhcoayJZyqcesyafYn9wkd0jUTYjYfF8Tp8Z8/A3ofaH6KIvsBXbnYkuOzJlsmy2qMNoBu0jdxX5eP23DMrR3HFCkpYjteLx+hGeFMAvnbSxummTgEIAvfQv0nqaRD1+pwQNqGCONO5/nMGE6YElauX4DYHyYOf18EnElSn8XOx+WmT0FtWHJh0ukzIUT9RFO9uwSXYiksDck1FAkUFR+cgFI4tWGE4dS7qL7/69dnj41WBMfutZ16ntF7qHAfCbOHAh6H9xOxAQBt9bQDW1VSGbSxI1897LbC2mMInI+YXAko7MsUtNbs6RKL/yqTxQGTeG9eQmPngXpkd2qOQpligtxKmIVTRRoq5O7R6CKLKrMtJukreY/GXbBrfW1lk8WKmQOXa0JkIavbC9p3U8/88GU9Tw7sI3mUUJs8cKiGRn5yr6v8cVnbXmMeSZ+hzj06hLqwNckwpAjHBrPTsEKcvEg2Y0Y/r7Qc7Nstr/f2qxl9nk2jsfkfM1JsOJ7Xl9HLWCeBCOI4WS2UUOSsA8ANPixMofwvrFwgtOrm31/wjPoMCUMfhfHE9gylGTJn7kU7GBkYX6ouF8GM3vSucBwRnslUJ3180ncEX8oixvx57tEqd3+CCHsHcF3TwcWmJz6LsvODlAnoXsTbHTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199018)(2906002)(186003)(31696002)(86362001)(2616005)(8936002)(5660300002)(26005)(36756003)(966005)(6486002)(82960400001)(107886003)(478600001)(6666004)(53546011)(6506007)(31686004)(83380400001)(6512007)(38100700002)(316002)(66946007)(41300700001)(4326008)(8676002)(66476007)(66556008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVBMa2hkTkZCY1gvcS83eFZMdWlZa25CdVZJVEd2K3ROeHBvY051S3NmSHJE?=
 =?utf-8?B?RFdtVVdha2MveGcrd0FSakllRnhuZUFENjU2a21EYXpTNEVQcEl4K0x1UXdP?=
 =?utf-8?B?NUd5ZVRNV3BER1hBYzljSm1xNVlNM3h5Z0RBTndZSVV6ZU85MHcxZkVIa2ZR?=
 =?utf-8?B?a2pyYkNFN3Y0M1kva1VIS2VUZExMWWsraXdCQTROcHJ1bVBGb3R2M3Y0cEho?=
 =?utf-8?B?U01MbkNhYlFCQXdPM0h0SEtqZ00zV3hkK3d6YkxZMStCbEhnMWZYRmJRcUli?=
 =?utf-8?B?WG0xV2YyVWF3RGNaeEpCOVBFWXBKdzdhMGJuY0djRThXcWozcFNMVCt5b1R0?=
 =?utf-8?B?UFliMHhBU01paVptNXlRVFN5aS9YSXUyWUNEMCtjTXFHVU5tRnNFM0N6YkJX?=
 =?utf-8?B?QkNQWUVHWGV3QkYwVjByaUhzc0luOE9Kd3BuTXRobnZvSWlURjArL2dWNTVM?=
 =?utf-8?B?cFlsMlNxcUxHQ0R4WHhXVW01S2RCUTJVa2tNeVVScEV5MUFDV0YycmxFQWda?=
 =?utf-8?B?SDBtTXVCNlladmI1TkxReEpHdm52azZvV3FUWDhObVpEcTY2ZlAxRENUaFp0?=
 =?utf-8?B?Rm1abHFQSEI3aVlyS0pEOVRWNDVpMm4zTldCdkhYQTNqbnVDR1NmY3prZHlS?=
 =?utf-8?B?VWVub3lheEg2QkIxZnRpc1hPWEUzd2pxMFpFSVFhRWhFWTdDRmYzV0xFOUZF?=
 =?utf-8?B?VjRuQitpMGhyOTRwUDFUSjIzN2dOMHFFdXNWVjhtSTdDTU1GTWxhYkNDVU16?=
 =?utf-8?B?b2FsckUxZnlRRlk2V3FEMEtQelhtcHRJOFYrTlR3Vm90TWd1L3BxVWRscnRi?=
 =?utf-8?B?YmZ2Z01wY3Y4SUtpc0NQTHpkaFAwNjFMd0cyb3ZwVEE1bUxkRVlTNnNiNURB?=
 =?utf-8?B?TWd1VVFpRnFPdHdYS2JHUmZhRm9Ec015ZkU3bVA5VFVzRTVPUzVnUVpuUGcw?=
 =?utf-8?B?ZDg3VTYwcDNxVEtwUlZWMXdsSXhWNnRsYkJRVUV0bWJERmw4QStkcWtlK0Zl?=
 =?utf-8?B?QmIwdFY1Qmp2eVRYVXgvM3VYaWpHbGc0M1BaamgvT0JNZmVlUkxzM3AwN3VG?=
 =?utf-8?B?MFJDaWVaOHRobGhEVTRaME9DQTM2UjQ4WGhTbUxIVk90NFE1MVJiZWNiTk1r?=
 =?utf-8?B?U3hnQ2dqSXBaTnFOTWU4Rmk1WDVyYXE5emx4NHpvMjQycjhXYUMwQXBsT2pl?=
 =?utf-8?B?cThPREp1NTRFVzU3dTFISHdkWUZHNXlYdlpoMTJvNStEaW1GU1NTemhtNGVl?=
 =?utf-8?B?OUFNWFNNcE1EV2lsMFNZMkEvaGVHMXNtdU5CeFNncnRUb3lHeHpDNEEwNEhy?=
 =?utf-8?B?STJneTNvaEoyVnVGeGFIMFdlYW4yUzlDa2oySUFlQ2hmYkFieDlVMGJlOENq?=
 =?utf-8?B?eUVqNnZTaE5yRVl2YUQ4aU5PNFJBZTl2VjB4MzhIY1p2T1BvSS9tVVk1VVhY?=
 =?utf-8?B?TXBScXRpZXJUKzMwTFpmRnZmc3ZyMTRxOWhrMnRyY1NhU3U5bGpYd2x5UXNW?=
 =?utf-8?B?SHppbjRjUFNyUVRESXVQbjFuSEZRRm8ycnRXNUxqZ2NMZVY0eXFFSVlnK1dP?=
 =?utf-8?B?OUlBbEUvbi8zbjUyb2l5WFlZRWpNQnQ4ZlFOUFFrbDlHbk5DZlFqKytSclZt?=
 =?utf-8?B?YzdmM2Mzbkg4K0ZxM0drSWduNk9Ec1RUYytTUGRRVzVRYjVqajIzSzRtcjBy?=
 =?utf-8?B?RFN2a0pCN3pBOTFBRW9aSEwzaHBEaEFqaUlPeDl0UGJJVjEvLzlIanhBbUtX?=
 =?utf-8?B?bTVaZzJWam0rVjZVTVVQdVdHakNxbzRJR293QXkwVkEyaCtobTdLeGMxZ1Za?=
 =?utf-8?B?ckZnUmJlYzBEaUw3UFRaWFYyNnNKV1lLUWorS1V5NnRXT1A2U25KeWcvZklN?=
 =?utf-8?B?a1g3aHBpa1RlL3kwQTdGVmRsTmJHZ2w0Rm43MU5zTzVxSUZiV21mVGdnNlhN?=
 =?utf-8?B?MWNSZEZPMnVvQndOZXZaUHpRaG9NS0QyMWp5UXAyU0ZIdEhkdDl5L1dWU1Zr?=
 =?utf-8?B?aUkwR3A3cVR1RUNBRno1ZnRIOVFHRXJWTFhrL2prZW9iU0M3RGUvcHNveWxw?=
 =?utf-8?B?MmRQckVRUHhQSUFMN0VyaU9ZV0N3NzdSRHJBQ1RYWXZWZ2U1bkt0MW1DdEd1?=
 =?utf-8?B?ZWFOVjMzUS9HSGxGNmJ1WXNSMFU2SDZJb2hrR3JCcjVyM2E1d1QrbXlPMDR0?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f2TN3f5ny4YnFxP6QVa+huJRfJ7uGOu8w+JLTX39HmQ7u7IhUaE8V4uODz4PNYj5IbQKqEX5MZfzHZAXjlzSP2KkYkL49SFhCeDColAd2GTHkUmkGlSuiPTHw4cQf4YBq0CUur+aiJIiRp47cjFkSK7E2wBDdGADZLImMOa/i8RhCSftzHgQrHQPxMDgShwVX0vpmwtZmCVViin7TQCRiKFIH5AGaZMVKMCeUq7JTtym1oQ0Dzjyf7r8yhVPDkXTHM6a30a3Q7rtifm1b912Y9yQj3llP6xeYIAPrH6yK8zBiqA1WBkZ/1JTFaSGoht/8LVsfhzyqGddXLiWcNKtwyIU+op/V+cRWrqV1lIS2FszXvcy/eHszVH3T8KmS3JwrobxJObJFZUA1GdUkjFP1DqXNNriZFdoGCJI+n/QciGek+yCIJiqLoGyV0OZK7Y6U/rMUKdxdBLN41vFxyaDAFs0N5NIpSLirBW1faGJQcWzdXPezg6vC3dQmv+5BhX1/P1g6U2ToPssj5FCnyeAq85/54c+7ezj/lssG7AOhr61hM66oh0TBHTygKlDcE6Dr7Kvs1G6d514iWBa1vX14am6cmgpsA+VevAuPG9woixP3/43X4oExQDeb30zA2erd2Q2W9j91NZWIBHdY3RqHD4KkkuGH88kZBlMt0trxwhk5yMHDFt1tOxKrndLxatT9874iXWyU7innSb9zuBTB73qXHGNiTbyL4qyhDdZivrMpuWweOVVfkoJpcXGFQppGCCxpRqt31WW4bHIOKOgLY+YDv9YGoO2RhA5g1xOwnniSif/TzCBNixQ8HBTuGbzOqmqdiTyxO/RgmyQmtEfQEPWe9u3k/++p55lfsz5ffg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c145a3-e6b9-4a79-1ae8-08db0ab080cb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 15:15:39.7654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBdhJnMt7Bfi5eRhRNyMuuTJktS1kUQdjwPPMwoYqo7VHROXHGYI6wYTWUn2z1I3tgvWJJ+YFrbpPnv/jn3IluqIAO07KdPzSfug8phRX00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5679

On 09/02/2023 2:41 pm, Juergen Gross wrote:
> In docs/misc/xenstore.txt the description of the Xenstore node access
> permissions is missing one important aspect, which can be found only
> in the code or in the wiki [1]:
>
> The first permission entry is defining the owner of the node via the
> domid, and the access rights for all domains NOT having a dedicated
> permission entry.
>
> Make that aspect clear in the official documentation.
>
> [1]: https://wiki.xenproject.org/wiki/XenBus#Permissions
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

I feel as if Edvin deserves some kind of credit here, seeing as it was
his observation...

Also, CC to double check the wording.

~Andrew

> ---
>  docs/misc/xenstore.txt | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
> index 8887e7df88..d807ef0709 100644
> --- a/docs/misc/xenstore.txt
> +++ b/docs/misc/xenstore.txt
> @@ -45,13 +45,16 @@ them to within 2048 bytes.  (See XENSTORE_*_PATH_MAX in xs_wire.h.)
>  
>  Each node has one or multiple permission entries.  Permissions are
>  granted by domain-id, the first permission entry of each node specifies
> -the owner of the node.  Permissions of a node can be changed by the
> -owner of the node, the owner can only be modified by the control
> -domain (usually domain id 0).  The owner always has the right to read
> -and write the node, while other permissions can be setup to allow
> -read and/or write access.  When a domain is being removed from Xenstore
> -nodes owned by that domain will be removed together with all of those
> -nodes' children.
> +the owner of the node, who always has full access to the node (read and
> +write permission).  The access rights of the first entry specify the
> +allowed access for all domains not having a dedicated permission entry
> +(the default is "n", removing access for all domains not explicitly
> +added via additional permission entries).  Permissions of a node can be
> +changed by the owner of the node, the owner can only be modified by the
> +control domain (usually domain id 0).  Other permissions can be setup to
> +allow read and/or write access for other domains.  When a domain is
> +being removed from Xenstore nodes owned by that domain will be removed
> +together with all of those nodes' children.
>  
>  
>  Communication with xenstore is via either sockets, or event channel


