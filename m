Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF4D7CDBA8
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 14:30:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618539.962285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt5fm-0002ru-Qu; Wed, 18 Oct 2023 12:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618539.962285; Wed, 18 Oct 2023 12:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt5fm-0002pl-Nn; Wed, 18 Oct 2023 12:29:14 +0000
Received: by outflank-mailman (input) for mailman id 618539;
 Wed, 18 Oct 2023 12:29:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt5fl-0002pf-9a
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 12:29:13 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe02::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef37ce9a-6db1-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 14:29:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9428.eurprd04.prod.outlook.com (2603:10a6:10:368::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 12:29:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 12:29:05 +0000
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
X-Inumbo-ID: ef37ce9a-6db1-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiqHSLhGF/4gI0A/AvWMZIIcHY9Ut6eCj6zZUWg6PjNOnim10QLl6gCW20G7Yk0cHarPPCxizgNR91VIxlXgCeaymDVYckK2SwspV3HfJt2ULupwg4xflcpAhX4XjQ6mmI/tW3pris/kufVYPbGCUGT1Ff82kbR3RGRMQUZQCaLa2DVURI0I7smsM4L1nzJAtlUzFkUSTOhNadUHZXhDKLDl+s5fz/AT7wQfstSgt9drmIlDesP3O4p+CGMDrfxpLUafAuhvBzrOCCNAewFSfMkwIiLxAoaJzh3QAMTPDuFZW+cAnzyWffSRWgs+z6cSraELCVJGIAL6u3N8K+gZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2rrSjuV2MtVq4owiuIMMMyxRvsRjf8DFN/f1vE6/hc=;
 b=ISjNxkMSD9buWXuPX2klBKc4Zf7kFPhWAzuFqgrpLPpOTktjanCqCm3ar4gNlnQME1DJWsrBp1jd98TP1wwzfpJmlzWJdnV94d0/vRn4Zl2oYbdS5FsjbOjdfWzr1VtuK/SiuAWRKjxynmV05uUwN4050H9MDHlcX1+AT6wu6UCuEYvJOb76wa8KuClnfRi96aBZg6Wpju5FXn2ordIsBt3Q6CcAI+8o4IdOq+KCJX2BcWww3qukm/yNnVaWLrR/sRipqF2W40YbKncXlJfSobwPg1cQqa008bXezx7TXxQTLZry1yeyfUuaKqBKRlJhd1suSyvj4Oet5S1EPZu1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2rrSjuV2MtVq4owiuIMMMyxRvsRjf8DFN/f1vE6/hc=;
 b=xhA1QRbVEOlZXc83ZS52K4mEquYNnxIgjngF45D7IzYtLjeIjnbsKfGxARw0BKc0Av2IUe4LI7CF2vUdkCcXBSZ/haEz5Li8scgYjLHpgcoVPtcTf0PgcNZSF3q2SHJXrJswO4aL00CQdr4MkRTEPrsQvheShNF00N6XElwxkPUn5laYbXTbzNS6KCAJ1RZ01RK++AZA5Pj9IzUFexFx20QN9upb9LZr6b2hVUr8lGvHvU54lQEKDaExhqeN0Z4+TRAupoVp23xtXmx2nECS/vlFGE4VJU/HTNCxFUdPP9AC+7Xpqq3wkkcHJOG4oKBQSOe9jNARSGHRuroi/zgfwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <27f708ff-e94b-1ced-34f6-a41264ed43fb@suse.com>
Date: Wed, 18 Oct 2023 14:29:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC] x86/CPUID: bump max leaf values for guest exposure
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4fe76484-fa35-807f-2323-276087469bc2@suse.com>
 <35f127f6-9c5e-4832-b116-cdc9a9ff1fd8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <35f127f6-9c5e-4832-b116-cdc9a9ff1fd8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: 4980ccde-f6de-47ec-76f9-08dbcfd5d1a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ToG+1QHdqxvXS4ICnpU/v3Z8YEMzBCqggCjkdu61F5mbKX5JApW4Sx949wrknrUQ0KDAWajHHCRU2rlfzYxsHIGS607nRRtwCPvfdsEB0FpSfKXYpVjws2oWK4FuOmI8Ug5kaYQBheYwuiEUQkMfjLEeu1s7VWQ6+egKio4WLeBKO0mcG2eFk0jpEIYj2DCQ4B9MhazOaM8AZu5Hro6PdxcNP9JoLTwHqS3GpJQ6D3gtdGf60fOfb0Ax4i+v+MJ5udD/+/vFK1+zHgY0dNdMg1Y+Q8VUk9MG6cl9PKdKXvq7RECKrju1evrYxUsEfJiYXInST9PXir/CIHNTTTxJ4UDKHlYjh/PoIO3lFjGp6sIpVmZXwxhE8CgCSS7pBH2pXpAVPEm/1/DjN2zOc4YnatZE+nFRspWxUeXgZYc8oDouuMzLCcE+yeXrv5HMONttzoaUP9icBKWbOHI533ZQh1T/nDdOMfn2QyEBdakugfExoTEzunlckpw5isKXgayST2IQoSbASnlWEgUgBf++5yPRLMRWDBqtOsTcmlr7ZM5R5+4lbNYcGqENuXbzEUsdCOQxtOvUcXizmDIkpu25bGNNmxbka/EQ6jsINTg7nJtr2cp+UoqIi5FUO09h53Y+z0Zw5NmKEn9PJvH/04nYQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(376002)(136003)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6486002)(54906003)(66476007)(478600001)(66946007)(6916009)(66556008)(83380400001)(6506007)(41300700001)(6512007)(2616005)(26005)(2906002)(4326008)(8676002)(5660300002)(36756003)(8936002)(31696002)(86362001)(38100700002)(316002)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVlFM0RCUEpwNDNnMjJVa0JFemZFZXZsczZHSFZqZTN3eWZMQkt6eXdJMkcw?=
 =?utf-8?B?YmZxOXRvZ1hrOHJCRVgrYi95K0tCSWdZY1lUTmlXNzRMTENzR2t3cUFud1Zo?=
 =?utf-8?B?VXhOWFBVbW9tYUNnOTg1blpuTTlLM1Q5QXlaZ0VMOHh4Y2c5R0RTME9XVksw?=
 =?utf-8?B?TEJmUFkwNm9XRWF0cjdvRnJ2ZTlqRlNHUm5xakVRd3pEVFppbUR2YlU1NDFs?=
 =?utf-8?B?MXhGS0JSYmFNVHpvcWowNUIvT2pZMDdZVUJKdXZ6aDg2WjNmajUxUjYwbFFK?=
 =?utf-8?B?SG9Obkc3WEJYR0FObXpobDRnVjdkZVhkWHI4S0FRMUd4bkFSMDlOTWFQRGkr?=
 =?utf-8?B?b0kwVkp5UXZNYzcrSTZMZU1zU3Ird0ZzWHV1TUZhWk9YdkEveWt1dFp1MnlC?=
 =?utf-8?B?Um1FUTRONnNHTkkxUDJ0Uk11Y3JQUU9TVVZ4RmRHQzhCMlZQd2pSeEJKMGUz?=
 =?utf-8?B?a3Qxa1JKSngyTEhHT1RQdEhkNDNLYVZSbXN5YVVNejZEWGhGKzRUWkxGRFVM?=
 =?utf-8?B?U1ZtdjNHcnpqcXgwRU9yNHVZV1VSWVVqNmhFUkJFODJ4d0ZiL0ZzYlFnNDVt?=
 =?utf-8?B?ak9DSGttQlBGWFJJZnJRUTRJYkRyTDkzYTN2d242dDJWSjExMWlOYXZCakpH?=
 =?utf-8?B?UXk2NWN4ams3UlRyM2xtNDlKSFQyTlRWeCtJQmk0S0JVVytzdWtqTkl1S0Ev?=
 =?utf-8?B?QUxmditmMksreHdVc3ZRdFFBRUc5MnVOalVwNHNhUkFFQzlwVHRKNVNUajJS?=
 =?utf-8?B?NDR0VWhwOUllQk1jMlY3YlN4Z3krL3VIa2xKbVFZS0lRdkJ0T1B4YW1LdVFo?=
 =?utf-8?B?bXdqWUdYWFBDMCtSS241WG00OGhKS0NmU3luVVgralI5eWlkZGx3ZXNieEtk?=
 =?utf-8?B?VTJhRFFyZENGSytxWWVGczk1a0lUb2xEeEdpY2psMVIyOFlZUHBRbmpwRXR5?=
 =?utf-8?B?RXE5Mkt4Mnl6YzcrZDM5VEF0dCsveWFoK0VXZE9DR1lCYms4NEdVOTZudnlo?=
 =?utf-8?B?YmtwNGF0VWJBeVd1cVFPM3YwbVRoNVZST0RsWldrWTVjMmtoTmNFdTFUUWMy?=
 =?utf-8?B?bVlhN29yUE1zT05jSUIzcHdJc1RUT3ZUdEVuOTlDSUZHNldyZUxmWUM1ZHl1?=
 =?utf-8?B?OEtlK1hNSkkzTjF1dkJHMGRnaWtycnl6K0drREQ4S09rUEpmL2lBQndMeG5R?=
 =?utf-8?B?VU4xT0RXbGZibVZMcVVTTTZMTkpvdFV3SVNyRDNNb2pNb3RpV1Zwc0Izb3NZ?=
 =?utf-8?B?bnNyTXBRNEhiMVd5YVNGYnJKaGp5THVveVVxZnMwNCtGVTY2WTNtU1o3MWd0?=
 =?utf-8?B?OHU3L3RnK1BpRzh6bnhPL1JDYmRWcGlMYmZiOTNadmEvZjRDVmNmakZWeEtq?=
 =?utf-8?B?QUFiZnBGQmd1OXpaNVpHdUcwNXU1bkhEV0NOQTJnN2xybldmeUZqTE1vOWNn?=
 =?utf-8?B?V1JacDVkbisyTGhKb1F6Y2lEeVJOaEJVQWdSaFlTNlBVRXFXM1N2ckdBZk13?=
 =?utf-8?B?bDdSRTVBSWRtV1pGTDJkOUIwdjNrWXNiU05IWDBYalZjZVZTSkxpZW0raG8v?=
 =?utf-8?B?TWxTaVlaSTZ5WnZoV3lONFZ6dzBESFhydDNhbHA0VlBxdXV0cG8vd3VoclA0?=
 =?utf-8?B?bXVSMHJhQkdHNDlERjQ2WENpYmFJYmJOZ0lKazFRNGhFODEzMWpYb2hnUVZv?=
 =?utf-8?B?ZXJObG1BWnVVRkI2RXpLcEl3MVJ0WFFBdGl5Q2lKdGF5ZlZNbHMxaUJrRmxq?=
 =?utf-8?B?Qm5mNmVDSjg2ZzdwSmM5VFFTWXdKSkFzKzZqMW45ejY5b2dKWkYreVZkZ3Nx?=
 =?utf-8?B?cTA5Z2Y1aFZIa09JYXYvRlJwd1lIYURtU1EyMjY0QW5aaUhybUN0NGM0M01H?=
 =?utf-8?B?TWo1b1hTNTkxcEpsS2d3elFoZlE0bDc2K0FPOXFSczRXSW1nK3hVU05vQUFJ?=
 =?utf-8?B?NlNnM0V2Yk1YWXkvWmFCWS80czVPV1JjVDNJeU9jbUZUMGZ0cGcyMW1WcmRh?=
 =?utf-8?B?dmp5QkxGZnNUSVB6UnhqSkVMWnp5WjdIOUV6K3k3WEJRNG1UaVhyY21xSXl6?=
 =?utf-8?B?cGFDenRsMno2cnlIYjg1YWdtWjlUcWlIU2RadmdWNXEvM1dmaGxzOUIySk1M?=
 =?utf-8?Q?y4sk8zLYzhDnHoZeG0iAyi2Po?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4980ccde-f6de-47ec-76f9-08dbcfd5d1a4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 12:29:05.6183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCV1DQzMKsF42f71nVreqWmZzUSXPagsgv4homNZM9LuzWkkw7Qwp1wX3S+y/ekxuou8LlcVD1EuqnEwi7QY+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9428

On 18.10.2023 12:59, Andrew Cooper wrote:
> On 17/08/2023 7:22 am, Jan Beulich wrote:
>> --- a/xen/lib/x86/cpuid.c
>> +++ b/xen/lib/x86/cpuid.c
>> @@ -104,6 +104,22 @@ void x86_cpu_featureset_to_policy(
>>      p->feat._7d1             = fs[FEATURESET_7d1];
>>      p->arch_caps.lo          = fs[FEATURESET_m10Al];
>>      p->arch_caps.hi          = fs[FEATURESET_m10Ah];
>> +
>> +    /*
>> +     * We may force-enable certain features, which then needs reflecting in
>> +     * respective max leaf / subleaf values.
>> +     *
>> +     * ARCH_CAPS lives in 7d0.
>> +     */
>> +    if ( p->feat._7d0 && p->basic.max_leaf < 7 )
>> +        p->basic.max_leaf = 7;
>> +
>> +    /*
>> +     * AMD's speculation related features (e.g. LFENCE_DISPATCH) live in
>> +     * leaf e21a.
>> +     */
>> +    if ( p->extd.e21a && p->extd.max_leaf < 0x80000021 )
>> +        p->extd.max_leaf = 0x80000021;
> 
> This logic cannot live here - this function is a simple deserialisation
> of an array.
> 
> Such logic belongs in create compatible policy, the patch for which has
> been pending even longer.

What's that patch's status?

Also the extended leaf bumping previously lived in calculate_host_policy()
alone, which isn't anywhere near "create compatible policy" either.

> The toolstack does need to take when extending like this, and it is not
> safe to do it automatically like this.

Feels like there's a word missing in the sentence, so it leaves some
guessing room. Question is - if it can't be done automatically (see also
the RFC: remark in the patch), how do we achieve a consistent resulting
policy? Plus I'm not sure we can distinguish the tool stack requesting
certain max leaf values merely because of finding them this way, from
a lower value being the result of a guest config setting.

Jan

