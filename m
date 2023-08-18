Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA51780C57
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 15:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586250.917484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzHv-00052e-Fr; Fri, 18 Aug 2023 13:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586250.917484; Fri, 18 Aug 2023 13:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzHv-00050X-D8; Fri, 18 Aug 2023 13:13:15 +0000
Received: by outflank-mailman (input) for mailman id 586250;
 Fri, 18 Aug 2023 13:13:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWzHt-00050R-RH
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 13:13:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc0b9009-3dc8-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 15:13:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9429.eurprd04.prod.outlook.com (2603:10a6:20b:4db::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 13:13:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 13:13:11 +0000
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
X-Inumbo-ID: fc0b9009-3dc8-11ee-877e-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApZCEFUftzrahO16Zr132X3ID6Ad4Zc6QRi5mpovdS099hzCoWs9FHVA8OnOHOovWpqXo8GF2jNTSmT7kzQwhKh1bCsiEC2FMplph3uX+z2aPLEUzogAWK1c4grvuvEAQJKNCu92iE5K9cHpTFDvC00kA8g2AJK3hxL7FKDiv0Zd3lxG+uRARvxVCMuT93Yre3aTo8xcmzFAfTrzKt4JstvQiCGF0PStgAvGa+yGKnSNNIYEJgk816f/y3llVN0qCRR4Yrg9zOXq0uqkKIYy09y3lfP4QsFkwH5TayZRdQDOWhuqJYxfyvfWdtTETzPnMiSeGOGJsobqcnLnoj/xeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdxT7cBuCdXNxAiNN10sjXb8mbijkS8T7QVV8nVNzfY=;
 b=nt2Ntx5+gmxdasOR9WjZPrtZSG9tyIEcD8VEznA/zKC8oDytTusoLTtqzjYxjzgFCI6h6z+kk7bCb2HPpw09NEC2p8/8awIeP2K4X3W5Y7f6tW6etlX41D6r3jodzEj3Sfuhv0Xx1w4Wsea/EtLmCVdvh2jX/1gLBe6HLUgE+O9V3hBvEtcqRXwlaA3g09Ofcm+C23aJo1HmqI4eNMrmLjM0KzWxOFSt7C9dzD02Ij4sn9Px2AaY/TnuRZLDCRI6XaM8M52RrUj4qeT/kmIQcdRUxol4vBTvyxjTiV5L7ehVuOt9nMKzHndX0HnhuiTUj4XlJUhTP5ca+smt3jR+0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdxT7cBuCdXNxAiNN10sjXb8mbijkS8T7QVV8nVNzfY=;
 b=axWQE3/txFVAEeyztc/BnRnvFXCanLMs1+Xummz1e1XoNLXmC2DbWXIKKkhEutZRp0VZVVxNsUcvP5Bq+Y4rUUsuJo919DwdA7muSLgnP18YjPTN3J9JMhTU5cx0O8QsmiJ9L++3ZDjycpGGf1lcrV0h0t+EFwZzzJjkzaECCqPCH63iWRTp/54gjW7MtznAXXoHcMa/a0h0aZyS9ju6FMLfASQR5L/wBHF3sirteWT7MgK8MTtYTvVQyixEsF8P16iqU8slfN6iET+4JMQmw+wT6yYSFHx+lkK2gDu2fbCtrEve53rguSL2OoACsHSCTii5XAH4taDBsZc72KkjSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a59c7111-b349-4deb-326e-3fde6e5125f9@suse.com>
Date: Fri, 18 Aug 2023 15:13:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 0/2] Rombios build fixes
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230818125753.876699-1-andrew.cooper3@citrix.com>
 <9c9ac724-9f86-14bc-5a22-e6e64c64e48c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9c9ac724-9f86-14bc-5a22-e6e64c64e48c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: b2980bc0-bdb2-4770-2ab5-08db9fecdf33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XL5MP7z8odLbw5VnAZGHus69VpOJJtt4a9fEnhzsn6nN0It4CCMNlOvwvTOr2blBmiRBWHLkSkKf9kpgX8Z58c5WDZS+CIdViegd5mZy2wwl/PImlkAfkMKpJJhKsXV1tn0+mFAQCq9VEP2I2yD96CmU7BH4iECCLyMpC6S/F4Uhn4M/mSx4H8b8h6ObvIOE0SoyD9xY/rd4k86Ok+wA52deOONulml/a9grHo4QDEmnk7ca37k+s39xL+TnIFdz9+FdU77poY1RzHPFZq0hPQH1sBO312wKaFCTJ6YtFW+FYTugn6Xv7ZV68FDiXiFJD7O3uMU3gNHWW3lkV758CJfiThuUcACw3O54IWEbLniREghqpRoJUjaIJn0RfJFGYvBvp05ig74Jn8g0ajOr2HpKO2fmoXByOcEa/E9FVcMShWOoy/PyjaPUzHQOMZkQ17+dADFWUCSD6atmntrMWcdke4Z4EVJopRnKslsSNFPtkysL3QBbgriJbzZkpSUMlztwmtc7rMoxgK8gsZ5xMopu3Zs0qK2G5CMMVQaHmq91NEs9WaxRITbiCuzUEmjTerhm0WC/MazQMKU5tx1+LpqV0S0R8rwmoQrrbpSt7AORainE7DYqM9lVFzKXSgzeTBvR3kf+GKcFITjOtyN3og==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199024)(1800799009)(186009)(31686004)(86362001)(31696002)(36756003)(38100700002)(966005)(2616005)(5660300002)(66556008)(478600001)(6506007)(66946007)(66476007)(53546011)(6666004)(6486002)(54906003)(316002)(6916009)(26005)(6512007)(4326008)(8676002)(8936002)(41300700001)(83380400001)(4744005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmFVcVlzbjVWc0FGUUJDYlU5QWN5d0lEUVlDSW5OVzhzOStBQmt5TEJuWGxj?=
 =?utf-8?B?NUozVHA0R2xON3o1YmVXSE5GYUk0UCtVOVNPZmdyM1dDZ1R3ZENyQVpUWVVm?=
 =?utf-8?B?dDZNczBwTUtHZm5Yc09XRmxsNjNFck9jOVJ5OHFrNmd6SnhqSWtvcC9Qemdz?=
 =?utf-8?B?ZUdZbXhYZkJzZU8zNVNpRXJVVHM1dlJPRXVTaE1MM1RQbGF0bUtObUZkUzhp?=
 =?utf-8?B?U1cvU1A5SDJBVU9OMm82YkxsdFA4NWJsdkRZaE1qdnJDUXJEU0dMT29LS21F?=
 =?utf-8?B?aG1aNS9wd0RVaXEvRkJEK0JQVVptMFdwN3Z1TTVoR3lBai81U1dXNTNuUTdQ?=
 =?utf-8?B?aUFnRDFOc2hNN0ZLODBUVlBmS0p3VDh5RStmaGFHMHB1cjhPNkpDbkI3THdC?=
 =?utf-8?B?TklZMWtYR0FNNHFabHpmNzhrRGFpVWtkWG85Z253ZjllbFcyR3FZdlNNeWNH?=
 =?utf-8?B?VVAxQWREcDBISkFyUjY1MlJHS2ZDY1ptZ1M0cmovMW5ZaXlZTHhZVjdERm5T?=
 =?utf-8?B?QnRKOEtBNlAvakgyQk9wL0NLUUlYVTV0RVZIZEUzcEQrZEhVeFBTZFNxdjNx?=
 =?utf-8?B?QjJLSTZ1cHB6a3R1WFlldy9aTU45VEYxOVNFT0dBUlUvVDBhVjBSVmRpKzNX?=
 =?utf-8?B?amZ2TW1xN2lQVzlKbEUvQ281WGIzNHZCejRUeTIzdTZIUFFIa2R0S3lIV0sr?=
 =?utf-8?B?TWM4bllZYlJxcC9FZXN3RGxKZzZQSmxrdHVwNWk5WWhhck5jVVFsNnMyWm1N?=
 =?utf-8?B?dm9qSWptMG5SYzdlNmF0VnFDTlZNNDdjNzVmeU1NNTBPdXpoUlZrSEQxdmZn?=
 =?utf-8?B?R1dFTXNLYnMxMHJVNzZPQlFtUGJqSFpMMkdML0xXZktjTUhNc0tBK1laSFZ3?=
 =?utf-8?B?VkR5ak1JcWlwVmgydmluRUtlMEkydTR4djhUUE5vVVNXZ3FRT1VqZ21zTlk0?=
 =?utf-8?B?ZFgyNVl3dVNNVUdVcjJJR1RDM25Ha1pKcjQzSWdnYXFGVFVscDhWK3FidmVN?=
 =?utf-8?B?WmNNcXZXTGxnNThLYjlhbGl1YW5rbkF1bURDQXVJaHhINytuOHZFNHRUOCtY?=
 =?utf-8?B?a0ovWkJKZUxlMEYzbk9UU2RmN21YT0dNZzBtVENJRjQ3VWFMWW1BTGV2ZUdH?=
 =?utf-8?B?Q08zMlZRREsrMVJ6bEpaMkZIZW1yQVl1emIwMTgwS1JsemFjWm1zVUcrS1Vw?=
 =?utf-8?B?SWtNNEZOZSsrckpIWCtSVENRZWlOa1NoMnl1bWorSWdaUm5DSjh1Q3h2ZWUr?=
 =?utf-8?B?RkxJN3VaOWFEMTU0WHRHR2NwdURobzJzVUlPSnlkUDhVUG5VWnBKNFJNWGpL?=
 =?utf-8?B?b2VhbTRXeTFMelFOalQwbjliclkwVStUOFVhSHZTT0YxTzJBei8yOSttQ0t1?=
 =?utf-8?B?ZEFyVFE4TW1IQVJ3SDlBY05XTWxraXV6ZU5VbS93cXVjc1JXY3h1SlJTMXlv?=
 =?utf-8?B?WXZ0UjV5MXhrKzU1cVA4Q1hWKzlGTGMzWExqdVhIOGIzYUpCQ3NYM3F1S3B5?=
 =?utf-8?B?S1JHNzRlT0RzWk5panpHdFVxYmtwQVRuUS9vZVJzdDlGVmJZRmQxTWRocXRV?=
 =?utf-8?B?ZllXQU1UVktuT3VjV21nanFURzVEdk5mWndTVUlFVm5leWRRdDRsUHlIcWxz?=
 =?utf-8?B?LzgvNGd4OWE5SytvaXY0dlNIMEx1bVBHY2xwdHJEM0RKQndxT3lMMVVyNElr?=
 =?utf-8?B?SGJ4QVF1KzNPN1ZuQXVQdW83M3o3VE5NZzg1Q09jZVRyZDkvWmNoa2VBbXRW?=
 =?utf-8?B?eE1uY1F5ZXJTTGd5OGwvdnU1eDRTR1J0a0tJTkdJSXQzdHlDTks5SnVBUzZ3?=
 =?utf-8?B?R0JSQ3R5SmFpdGlWNFZzdXNYTG1NdVpIa2MzbENHalpycGxQUzlEZUwxUXhw?=
 =?utf-8?B?Y3JKODlWWVZjbGF2ZXE0QVJGR0pYcEs5aUV0VGdIWXFtNDc0cis0aXdNdmVr?=
 =?utf-8?B?UVoweTNpQUVSTFZKSkVPQXg0RzZjVDVtcFBxalhsZlJQaExITGcxcEM5aE5q?=
 =?utf-8?B?MFI4dEFsYi9NZzlmY09JcmV6c2V4VnVzSktQZXJPSnVBNVl6NmVvbzhuWGRC?=
 =?utf-8?B?RlhkWnRUdjFydTR0c2pZaVMwR1NmSGlQMUREWi84eE1PU1dCc3Z4ZVByL2Ez?=
 =?utf-8?Q?hIT1Rd2L23g2bHr+J1s1wRQDH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2980bc0-bdb2-4770-2ab5-08db9fecdf33
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 13:13:10.9818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGjIw761Vzijplj8qFTaRbqMrxAi+j0IsH+nyK1+4eBBhOIfvnHdpqvD5zCUFZYoWn+jk4ITbIhW91Lh9RCeAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9429

On 18.08.2023 15:05, Andrew Cooper wrote:
> On 18/08/2023 1:57 pm, Andrew Cooper wrote:
>> Andrew Cooper (2):
>>   rombios: Avoid using K&R function syntax
>>   rombiosn: Remove the use of egrep
>>
>>  tools/firmware/rombios/32bit/Makefile          |  2 +-
>>  tools/firmware/rombios/32bit/tcgbios/tcgbios.c | 10 +++++-----
>>  2 files changed, 6 insertions(+), 6 deletions(-)
>>
>>
>> base-commit: e6cb27f2f20d09dd2ba135fbc341a4dc98656e10
> 
> Urgh, forgot to write what I meant to write.
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/972116359
> 
> This gives a clean CI run when ROMBios is explicitly (re)activated.

On irc you said "more array bounds issues in GET_BDA", yet nothing further
is being adjusted here in that regard?

Jan


