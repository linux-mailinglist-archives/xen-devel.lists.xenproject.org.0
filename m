Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ABE77726A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581898.911355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU0lw-0000lQ-5H; Thu, 10 Aug 2023 08:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581898.911355; Thu, 10 Aug 2023 08:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU0lw-0000ir-2H; Thu, 10 Aug 2023 08:11:56 +0000
Received: by outflank-mailman (input) for mailman id 581898;
 Thu, 10 Aug 2023 08:11:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qU0lu-0000ih-PW
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:11:54 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe12::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 905210db-3755-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 10:11:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7235.eurprd04.prod.outlook.com (2603:10a6:20b:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 08:11:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Thu, 10 Aug 2023
 08:11:52 +0000
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
X-Inumbo-ID: 905210db-3755-11ee-b283-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqsyL3uDNqmsgtCkaToTItyBDQKqGJuAvUrhfmFmRcZMSvl5UFYLLBxP0xSo49xDK2jNPTmu3aGZnHy2NCNddWO+ALOMZzDngA8D7DPRVZjYVhGg3/9QVAloBvE9LOnQRHjZF9E6ePUn7VQj4CJPO3Hwju8Y6cR0rbWvgxUcM+Jf9RxWHMu6icT7Kwv52wGo+/9nyCi8zfUbsCdvrXkAM1dgG9XQY8AokaSon1fkccwNSI3HOFVgppAAmFIVzs3nw15tltd5+g1n9dYX3LlLrpscWP2UlgML71AYfoiksqAVvmoV7SQ0Ugn+lEKR168YJz0mPYSD+Hs5Xf+FBK55vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrEdRhPDKplCLwtRTf7LJrYIn9U9dy0ALOx2AXSyzg0=;
 b=HNYJGg8F5c3GO1gIYPsRGnO1nBfLB3wGMxWhFK9XhhuE6+UnikCX5Y8i26Q5vM8o+wwIicIl/qjj/2daPvHXBqFMQTLssjxUwSa6bqvVRRkm8rra48m1LIDL+KU5wgsW54S8mhznGlDVmgXly/6ubuNt2mbQpnUpMKbrUrTeY5eSd9L+UDF3sHicW0cRv2WoqYDKy3xGwkdcJf6OTjVCndYOZ9r+k7ihBRX/mLAUEvi8Jp4rV/UropsrYIpzvfg/zkg0F3iuCDlY4k2vV5u4z5ql5KbBrXPslRMs7eHHPpShpX9vBCP5uqTHjRU28VrovdZQMyr5fCJ7m5L+zocSJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrEdRhPDKplCLwtRTf7LJrYIn9U9dy0ALOx2AXSyzg0=;
 b=n/p8C5CEfswzLs69+RtM+ECIN2tN5dNKZ72jOwjzm7XNiAe/P6fBTj1zD3D12PJNzXF2S51mxc78YoOH+zt6hP2AuUv0ZxDf8yfNmdb5QSm2qdFFXS8U58HwzWqOv0zJUwY4ariibS5cUjR3iiUevk7WE8esKc1csg+0kh1udeAl6+ZnNZSweIgWAbk++v3RKdkIuC+iln/868L+EO/4r9Cfxf8uS46p3iuWGoUjBjg6L2ehkzn2emEEpZCbJrNzo9Julyj6xOgHQShlVXtF83Wbj9QcvYJUIgtWPoGD96aMnlITNuS1REGSGvlKE571gAgmwHMWY/nOo68bTMdLeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5458ff58-bbc1-9616-fa43-bd0fb67688a6@suse.com>
Date: Thu, 10 Aug 2023 10:11:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-14-Henry.Wang@arm.com>
 <6c8f904c-d7f1-343e-2208-6cf963e1e25c@suse.com>
 <0A1CB23B-6597-402E-8420-26C908A13ED4@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0A1CB23B-6597-402E-8420-26C908A13ED4@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee4f1bb-0ede-4b7d-8553-08db997973ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CqsG9yeYyTnZ4b0O0Q1rf91V5vjYgpa2Lo4C6jP1ONwRdzCDhSEddovJRK0JWPnUV3dsO0TLAfTjeqoeUt8sLJEgdfqAV+yHkSawF0vy9wcGsPCJty/qz8R9KcaP0aZqwmgeJbrTxCyFIiIAhdAAt9Po4w0Vs+bi8AT744UaJTr2T6qg53ZG7wnE2pNDrQ9D4cW2i35RwNcHoZ5gITQDnGlLb3DOOZtSFbuuDsMWCsqYLoPAWjn9fAW/P7P/6y/kXGMHUziqOMghJunBTClHRXNlHkjnaQvOgFbQyWe8tV3HUF9co6YxyqCEsRm5DfQAbYnBlZMtWbReG/B/HrYo4av086YKWOAHOjKsVuY67EWolzkL28Eb37suiulRG57GUajvQ+u5bd9r2Efpvj/1L3PKSrTfB575wwlUkPPgYz7xN7W4meCZXu0dxg0JEiI+o+ffqwPSMIuLpOhG5wvZ6flkgGwBBbwWjO9z9pHLaggB2dAdSxdPDO3ktyeVRdr6o+3hf4r50jY3/LxJTKTavKppgmyJsYzDFR6hGmG9B5ka2013XLK2a+wcUEjP8BFz8480nl8WtLEhv46sGgh6wpxoPPk25WLcZoQRULdYxfjtwtXDFhY6pSmkNHWFwSlNVSDw/ObVc1/8BDz8TrqMPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(376002)(346002)(366004)(1800799006)(186006)(451199021)(66476007)(66946007)(66556008)(6916009)(53546011)(4326008)(26005)(6506007)(2616005)(36756003)(38100700002)(54906003)(83380400001)(41300700001)(6512007)(4744005)(2906002)(478600001)(316002)(5660300002)(8936002)(8676002)(6666004)(6486002)(31686004)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG5xZkJXREltUml0TVQwSEYyOWcxMHFrS01FWFZJcHk0dW1kNjJsazJOMjZx?=
 =?utf-8?B?QXBxUlZuM3N4S1NBOWhFTE1WTDRTb1E4SUp5RndHNHhVdGh4ejlKZDQycDBt?=
 =?utf-8?B?WEtBNG5zWHkrRVdCVDJQQ0dGYjd3M2xrVncvaVJxYTFXWFFBa2RVeW9tUnRv?=
 =?utf-8?B?MUVlY0tISktXZkxRQ0VBL0d4eXUzbmpmQjJJWmZDRGYzL04vekE5ZFQrTVdr?=
 =?utf-8?B?K3F2L2huMWxESHNnaGdRT3hhVlQ2cCtSbUs5ckZ3d0RLUW12WjgvZlNkZGpH?=
 =?utf-8?B?bU5EelIxVHBIYk1EdnAraExyTGJqcXFYd2dKYU5WUnpiaDBhMkFqbjRVY3Jv?=
 =?utf-8?B?S0ZadERmclJPbStBS2J4ejRjNTFQTHdqbDYvNlFoWFN1eUgxc1I0Skwzd05H?=
 =?utf-8?B?NHVZOFR3N0xzOEVjZFJGQWRBS0JLVUdDanhQWTdxc3V1eEtMeEVFcWFKTkNP?=
 =?utf-8?B?Mk9IRnJwZkFTbm4rK3BWblkvSFN1SVZKMk53TkFlQUltREV0dEQzZmRIYjcr?=
 =?utf-8?B?VDZHKzZWUTAyU0hleDhPbFppOVkxRVNRV1lLd09ISVM0ZkVDSm5UcFZDZU5U?=
 =?utf-8?B?bkhSNnN4UWRxUFVFVnNwT1B3bVBqbHJYQTlDZExCSjgwS2w1aFJCVm9aaWRt?=
 =?utf-8?B?RXpjWmV0SXI5c25TRnQvbWtTMGo5UVJCV2ZiSWRnREN3NytQNkpJN2h6Ukkv?=
 =?utf-8?B?ejE3QmVqSTJxRjVJVTcxbGJXNnQrUnUraVd5ZUFpSjY5NG1OYkhsaUlUendY?=
 =?utf-8?B?cDEwcjYvRHEvOFdyYVUxU29wVnJtK2YrQk5MTjVaV3VYVVZDR2Yyd2JBTFlZ?=
 =?utf-8?B?R3VxSlZRc1JXVERKMWZYL3dXWTRoVUhJZU1WVUE0akkrYXFDT0o0eGRFYmdu?=
 =?utf-8?B?eWJKRC9VNXI5UEhBdUVaeGlKeUVSWExCZ3BMczVTRERkc0c4NENTaHVVSGRr?=
 =?utf-8?B?YlpKemxIdy80NTBPN3daMmVvYjVHQXJzRGVrNEt5MUZhZFZ1SkF4anZhbW1N?=
 =?utf-8?B?R0s4R0phWjF1N0xQdElqcGNxR2FmdjdINzErVjY5OU9LTGpOR2M5S2lTWTRt?=
 =?utf-8?B?bEpIb2xVNVVqbVFKZUljY1VFcEdlZTdiZTNFMVJlSTVMYStRU0hVOE5tZUhh?=
 =?utf-8?B?c2lNK04xcnRWYmwxVlB1bEZ4ZGx4a3BPWVVuR2VNeFhEU3FZMzh1WnJ5VEx6?=
 =?utf-8?B?OXlnZE1yM1lxbGxBYSs5RU5oWDdSRnA4dFV1RmdRbldibEpiTlVQem44WEtU?=
 =?utf-8?B?TXphTjZQTmErTW5oN1dsUXhtbzNFWjhxcE4yV2d2RGlhbW1aeVNOTFF3eE96?=
 =?utf-8?B?UnBYVjVwaWRjK3VIUnlWVVptOFZQU0s4T214MWhHVWt3cU1PSlEyb3c0UTRp?=
 =?utf-8?B?Rzhzc09JbXRQRXZseGJkQVhWbHZ2ZmRzbFFBUXF5bUlBTTM3UGdxbDZxUk16?=
 =?utf-8?B?SHo1ZkRwR3prWWdOd3FpSmxxNW5oSDBGM2NSejZaSGpTSDRCeVVoK1F2WXQx?=
 =?utf-8?B?WE5jSUhhNi9zMUlwNnA1MlVPYmpZQ2c1TitHSHJOMmlxd3dPZWtoOGE5eERS?=
 =?utf-8?B?MDZkaEY0UStRVUFXUVFTY2NjaUZlZWx4Nko1Z3E0NWdPUXVEcjVoUVgzZlBT?=
 =?utf-8?B?bk1ZYkFvanNXOUswMWF2S24rTi83MDEvVUlEc2kxbStaSytXbkx4ZVBFSGZL?=
 =?utf-8?B?VnA3REdRbEI5aCtIMGtuK1NpN0ZKcnRyZHNaU0RwSWVBYnBVVzJ0NTI3WUkr?=
 =?utf-8?B?OERjZGUzVVRiUkpXWkJLQythRlRtTGdId002S0RLS0tlUWx0aStueEFUTW9S?=
 =?utf-8?B?SFJQdXhiTjJPWHZCMEpwMzMxcHAzNnNWZzFmZlg4L1YrU0JyMlc3YUtBcVc0?=
 =?utf-8?B?dUxyOUhEVVQ0T2FUbEIvemtVUFpGdDBxYVlSTTFydm9nTzlEU1U3Z2luQWtt?=
 =?utf-8?B?OEN3QzcvZnZZbFBGSHhyQjJ4VWM4czRQWTFMRGtGVGFHNyt5bFVkbW1adGox?=
 =?utf-8?B?QmZ3NEMvamlTcjFuZVVpTGJ1dVd5akhQQXNaZW1hQXpWSmhPOHZxbWNmRm1q?=
 =?utf-8?B?N3V3VjJDOGNkZjAyZC9pNktxYWwrRnZqbllRczFIR216YmJROEhNTDdIbjg3?=
 =?utf-8?Q?gQxohWVkECnnHLw+PvoTOIif6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee4f1bb-0ede-4b7d-8553-08db997973ea
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 08:11:51.9402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIIsp0oAUlwb1ru0U6zrn0KZ3i/JxjBYY4NlEu8zESouplU2gWFmHnMCZWLoH+jJlA24yDxySvqeh2/IrPUOPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7235

On 10.08.2023 10:07, Henry Wang wrote:
>> On Aug 1, 2023, at 15:43, Jan Beulich <jbeulich@suse.com> wrote:
>> On 01.08.2023 05:44, Henry Wang wrote:
>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>>
>>> SMMU subsystem is only supported in MMU system, so we make it dependent
>>> on CONFIG_HAS_MMU.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>
>> While entirely Arm-specific, this looks to require a non-Arm ack:
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Based on the discussion in [1], now CONFIG_HAS_MMU is agreed to be renamed
> as CONFIG_MMU, I will do the renaming but I would like to confirm with you that
> if I can still take your asked-by tag with such change. Thanks!

Yes, that's fine to retain.

Jan

