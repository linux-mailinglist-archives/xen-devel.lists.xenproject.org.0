Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8975EF2F2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 12:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413576.657304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqNu-0007WG-AW; Thu, 29 Sep 2022 10:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413576.657304; Thu, 29 Sep 2022 10:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqNu-0007TI-7X; Thu, 29 Sep 2022 10:03:14 +0000
Received: by outflank-mailman (input) for mailman id 413576;
 Thu, 29 Sep 2022 10:03:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odqNs-0007TC-Rg
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 10:03:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60071.outbound.protection.outlook.com [40.107.6.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8d73a19-3fdd-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 12:03:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 10:03:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 10:03:09 +0000
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
X-Inumbo-ID: e8d73a19-3fdd-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeuWtdWhmgPoBXp1dzv43YqUEgEtt3acyGgjPZIjITbaHnDKWMCjJYkjhBWCIMpkskH/wmEFG699tmFXCfPCRbkoubwCbTZyEVugjs1Hz9sefV4+Q9HrrEwtfyedPcFjEXFv1zE+dTv+XSxMuh6ysjL8SbARbLpynl8hMducLnnWpwPsrjkxvLB3/VkumGN8CMZm095QH4CpF4wZhYHCq2X3DogROljfuqzSCtDSP2vcX/ryHv1LYvJQrbYopnfuCIwmTNRMx51HoEMg66KIcvexd2xsKc8y4F4J8/PkZgiBNMBh3E90M8BeGG5Xa4H8YDjGFGBwcXZ7swtDN+4ptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqHPrMRFDMxnRH3mmMDEVFzyzEdco3YGI8ccjHt7J8w=;
 b=SWg3hHXoPUS+SoGNLe108vvcBPcf6azLFoRwY84FAc2offB47rbUzQTo5SAe11e+eStrWfT/0UgFYkEU4PehZ7UkwLmgj2jMuu8cIogwDboI21TfsRM3CZs6A8pUXyJc6/JFxqW9fbgnjb5ZUydSmaXCZhAp7ckSJ8pQupZwaYIT7IhnL3SNtRXcYi5EWy+8zzFP59TLcVrGzdjhSrpJkmbJ5W8f/QxavlexYdk8RUxr4IhtXcA3dsPDDYa/IjI2sd1LMN0lwW2p/3Cc11+R3vU+1yuUJeL7RHAttSHjDi7Oe9Q5iXgLG+TmVoC0qwuKfP11iZcnOGDObMZ8jV7onQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqHPrMRFDMxnRH3mmMDEVFzyzEdco3YGI8ccjHt7J8w=;
 b=zkuDnhrBnlTWumWCBrb4DDfXCgoy5WNI5+z8FEQ+sE7cs0woNnYUedGRF7gIWKXf25bbZddFc00kgLjDyOgZXtK/FR6GuzdDMbqK0e7DvgFHROUBPN6+ISD03vYcpldGPDOyjujLWuzALKQaO06TFiJfT0sRnHIJFC58F3sXtjvABVK4kOOaeXKbGWX8CyIuu5BswIFtdr4/HHkYF513ikq9okHHLwhvg3vunJXuq+kudBmpjpdxa/GJzMZkjS5o+88h5fTHApzLGlZmPZyMwyYXiEs070ZjGDBRRWqlc/05LG3Gl5+rpIUQHPP/IUmQ8h4OwCh46XgHVfJRfHSxyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f4f8dd4-cfbc-e2c2-4a5c-ef31acc4162b@suse.com>
Date: Thu, 29 Sep 2022 12:03:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2][XTF] build: suppress GNU ld 2.39 warnings
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: fa83d8a7-e82d-4ab5-48ca-08daa201d014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nnULCkhNu81tEgk/R6U3aspb5ncSGkV+25K7hNnFLnBnXx6SFHt3uwe3+I3VpzxumC39+t7FZ0GLrUcbKBYiMQH1yipX0/kc/o7/5vcAIOvsEkLr4inwZbK5+X4zR/snS07RBVJHr2wxH6zsGRAU4CfSGGQfgoVkfyFFKQfTaH7QwZTEODY1zSb2ft6eP5kZQP4B5nBEWz/1jKjV4PUtJT9SAbSvFO4C8PpEEUmp1mq3hXh8FomjvgGXCrXX9FS6cVnq1IMP/3+sS2IGv9JfT9UMGl5rhi+ZQhccDte4tVqeH2L/YJyCCk0/r2wdxTFDtyQaQrzwqBBYk5GGXVpDQPehjsiqWGisqi7Ol7t8YOSMGw+H0ydHPfNYAH6PFwfdX6Gz77troOX0sv6TZQu5hkEa3WMoevLcd+ldhEwvBa/pHYX/RCCiOCrGcf7dHU8TNBCQ0CAnsrXCdzgI5cg2UoiWy/J++TSpqFkMxCA+GCqUtioqqWqpDacwOwzpUTrOFjY/ZcSH+3Uy2Kkbw+RyXokO9bpA9iASUxEOhMDIKktZnFWmto/1j/kh3jHAJYmR4WCFNuU1Gq1MbuWVeTaR6QN9U2puzS84QDduL1ElMF/7qHPKr0kKX+hR3wc01AoWL7G9wrHzH0fmugaW+gSZDxuzTP/uyPBsMxSoEoF5O0JT3mSRtWIHt2lTSWCdRXm3RYoY2SGAN15mQXlLh+SU98g78Zxni0hWezMf4u9oly7ZAHj/KUrWq2IZgDVkcrd7f9HFheKuGRvJW80ISN1xYrtrjmviUDoS8VSmIy5++Dw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199015)(31686004)(6506007)(66556008)(66476007)(4326008)(8676002)(558084003)(31696002)(86362001)(6916009)(38100700002)(36756003)(316002)(83380400001)(186003)(2616005)(26005)(6512007)(478600001)(6486002)(66946007)(8936002)(41300700001)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnhzRjU1QjFWVGlTbThCYmpyODFXbnNzSnJweTJUK3I5WG44cUEvKzljM21Y?=
 =?utf-8?B?WnM1WEtxWkEvTWQxMitLc251bG50dFNiSFlaWEt3d1dCaXIxYStjSE5CQ1dR?=
 =?utf-8?B?RlF5bmU2cFltMEpGQ0JGdjI5cVgyaTU0Umk1V2lzazNxMjhlSjg3cE1nTlkv?=
 =?utf-8?B?SG1ieE5pQzBjLzVweGZyN3hnU0NET0o0a1YrVHBqRzRwL0FWQnRmREN6eFB2?=
 =?utf-8?B?LzJtcCtZdUU2MmpNcXZGT0Q4aXZIKzA0Sk5kTk85aHBBdlZUb2xGN1JxUlhR?=
 =?utf-8?B?UzJVeDlKOFFJeS9mdFZWR0VsRWtTUEhRVUVhblB5d0dOK2ZDODR6NllQeUxw?=
 =?utf-8?B?T2xnMmFpMmJMQWpwM25jRU1KMlFFMlBEUjhETlBBNEF3S1B0STV4UGNYSjdq?=
 =?utf-8?B?OWdxOFoxTFQrWGk4ak9GQ3F1NXVCcGV0WmlYWlZKUVpYaVhvSTU1eGtqSGE2?=
 =?utf-8?B?WnJlb2c5NW5kWnUwRUYycUErc1NjYkd0eDczSis5ZGZEMG5xMmp0R0xaTUs1?=
 =?utf-8?B?V3hhWW9PVHVMYkxtZU84eTdENHpRQlpZb2xDQjJ2VGpJaUQwSmRiclBJS3JU?=
 =?utf-8?B?K1lwQ3R0Rk9CUWxqb2ZPNFlZaU9JTERLYmd5RGdZUTJpeUd1b1VnekhXdzlt?=
 =?utf-8?B?alBTYTFLSDhhcHlnbmZmMS8ya2tmY3I1QStoNWJvWTFkSGdTZkhSSHkwL0VZ?=
 =?utf-8?B?WC9BYXNVZ0VxaG4xdUVkVHIxSUdCK2ptL1BiRlNYLzlFNko0L05BYWtWckNn?=
 =?utf-8?B?SkJQVmZnK1ZYRng2ak9Ub3ZhZHR0a2tmR1ZoZlE0c0pzNmxrbnd1YWhCb1Ix?=
 =?utf-8?B?Z1RDcHp4cmVFbW5aVSt4WEtLVUxuak93ancvQzVOTnM1cWpkVXJybjZUNTRV?=
 =?utf-8?B?TVpFaURpUFhxcEdqREgrS2c5K3M4TUhjN1A0eHBpZUZNUEhuRDRSOG9XWmNk?=
 =?utf-8?B?SEtnT0Z1bitwLzI5dHRuT240cit0SGZvcEhCZ1QzYiszWVAydGRDWTgxNmtw?=
 =?utf-8?B?TUFsN2k3WGVDL2kwN2xVWU1ZSTZFUVNGQ0RGMi9kOTFyRnpMQVlEdVZRNFVD?=
 =?utf-8?B?ajQwa0gzOU9JNWRmbkI1ZUNDTlZhSWMzYjhCa3dRNGFDblkyZkNjRmQ1U3Uv?=
 =?utf-8?B?bWgrMnRLQklrVmNROHAvbkVnTVRoOTN2bkMvNlVZZXNoaGlZbGcrMEMvYlE1?=
 =?utf-8?B?UWxKWFlkc2tNUHdNVnI5akJJSHlQL0d1aWRJQWtoU2sycnViMEpXczdxMU1m?=
 =?utf-8?B?bjduRXJ0SG9SNjZ4UEVMZEUwZ1pTTWdJZ3J3TlE1TlBUQ0lTSSttTldSODhz?=
 =?utf-8?B?RlhZaDBIbm51bXdkRDdCUk5qSmFnampBQjdPbi9tOXpNTlgyNEt0RE1IejJz?=
 =?utf-8?B?YkRiNmZYWEdGUDY3eVpuY2JoQjRvL0Yva3BaOWFsZEJTaDJHV3BnMVkrQ3Fx?=
 =?utf-8?B?OGRHelNuYUJsVzRLZVNjN0I0QUJrUmJWVkZNM0h2aytoU3hMdnQ5eWw5Qkhr?=
 =?utf-8?B?YTJtMm1oYzFNL0YzeW1XalNuckFTTFYwR0M5RXlVY0RnMndOUHU1Q2xFUVlX?=
 =?utf-8?B?a1VENFk5ZW9YQXNwbTc3dFZaN2JrSjdXRWkyd3R6aUpEUWJWRjJvNE45ckw2?=
 =?utf-8?B?clpVclRHdlBNWlZhL3pBTFVzL043QTBjbUhWb2NoQ0kwakFXeVI4aTY3OWRz?=
 =?utf-8?B?WHlEbVl1UHpDRi9JNGg0ZlNSWkJtZ09aL0VRbG4zTmtLcm9iTE1FR3JnQzZ3?=
 =?utf-8?B?SEtpQ0NIVEdRQWZTZllZK0NOcHU1NmJncDRwSTg5MXR4bE9xYmVPdEVHVFBW?=
 =?utf-8?B?QXNuNHhpWFVhbXVmSEV5cFNjVUdoOXhkZXpVaWtpQUtuTC81NWxlMGZsRFZL?=
 =?utf-8?B?STR0Q2l4Wi9wM1ZjdEMxWHJ0QWh3NXYva3U4WmdjeFo1L0JrcnRJYlE5Vlg5?=
 =?utf-8?B?NjZhMlc4L01lbW12bUJWYkxSREtJWEJrdUlFYTJ5OUgyLzlSL21jTGFBMUFB?=
 =?utf-8?B?ZzFzWWw3cGNNV2laSk96VnAvV0lUKytIYjBZWkJ3N3Jyclh6SVdvcGQ5UVFw?=
 =?utf-8?B?eWJUL1RURy94ZmplRWo0Sm1FV2RGSnlDR3cxcmtnbkpOTWpSM0pXa0FxblVl?=
 =?utf-8?Q?H+09cbv9XkYEXITKz2o8TIQOE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa83d8a7-e82d-4ab5-48ca-08daa201d014
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 10:03:09.8034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4/bnWYxdGk2Z0uZSb/ujzf20q7LerHQsG2udfS77GbkARvi+FtSYUNpXxvQ3Z/OhO8dVn5ndhubt5KiB/E9nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

Like done previously for the hypervisor and elsewhere.

1: suppress GNU ld 2.39 warning about RWX load segments
2: silence GNU ld 2.39 warning about executable stacks

Jan

