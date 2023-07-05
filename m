Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855A8747CBB
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 07:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558795.873197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGvU4-0007FV-N9; Wed, 05 Jul 2023 05:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558795.873197; Wed, 05 Jul 2023 05:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGvU4-0007DZ-KN; Wed, 05 Jul 2023 05:55:24 +0000
Received: by outflank-mailman (input) for mailman id 558795;
 Wed, 05 Jul 2023 05:55:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGvU3-0007DT-4D
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 05:55:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85a37ffd-1af8-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 07:55:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6807.eurprd04.prod.outlook.com (2603:10a6:20b:104::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 05:55:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 05:55:16 +0000
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
X-Inumbo-ID: 85a37ffd-1af8-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1BqsiYL5+m39bPN7PLJtgzoBFXFbTrpfksCMx04T+6PD3GMGuTdqhqEVMQgE0nyeZcHQS46ZNj+r9rCnLcdcNt5LF8F8aNIfDmozVQVukx0/NauG4w17oxBXmHBuuamLkbx+X2mjs3FGe8CMZ6r/jUDBeyQwv5xJ00U3iJUXpDAjRfPEIilCL+G6uVDEpAMu5uYObpxquPqLVdfOMTe/iEjLyRmjVD/YRymUgKX8mDh5drJ7eZvTCsgrtJNp+3I4SqS9jBNeKewNrUgVMGsqW4aHqfhqeK0KsFkET19WX4dMrzDjwCFhxl9xBNW4YUhhEYQyOqWPRUr1UiSLKJY8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFXuHwi8MErehPL94LCVzBnn/1tQkS+ll6kwLciD8FE=;
 b=aAZ4S1NwRdvPlw4p/keYHfoiM9kTzsifTbFzwZpIhjQf9KAbVtJKwZxArXXISVvE/zYdsaszgsP5F61rnIMRqxBchALLyAfXTjy96ZX+Mak0DElacBNqpqghXEbZea8w/2exo0TrdndcHJWQw/Tw/OiSRPYCD177kSZx8SSVi4WQDckyPPDHwRfUq/jUczDhgD11AmjqalKGI5muma0szJh+sXec6Fs7bQ9DteoOLZ58vE/MrYyCMeO0wIa/L7Fgb8HDrjkZpmIeF395Fu0vkA/JJ5eNVDqdcILW57F0Ilkrojk6RiYm3p5yWXRSBVJei05PDbfiSASKMWDWEfSBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFXuHwi8MErehPL94LCVzBnn/1tQkS+ll6kwLciD8FE=;
 b=0Tgbw+QaKrBhnlDfuF8j++B6teNrC1yN6+/WNf6UIyy/uFvVihxr+8JSkVameTmSaZA69/575Czy36VmUU51BFMSZvzqAfLDulCPe9NsFWuGJ5fM4JAs0S95F8pd4/LByJymXacGo53Jd/v/V5pxvy4ZLZ7ozRu2gBBFh9B2sHOmLgB9fqt36OqKs24H7jLzJsXE351vKQ4PX3KBqqzCC+nRzMn/4imRUZoNN4CMD7diBUN8/Kik1btZK7zMSE75WooBObVF4LTjLMvpHC3HxS7UV1DVZd0mB+560R+zWfjJDIX5TJWgvQfoATW5tAOgvLZ+aO3o4T3jsrTyyw8pKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <86d278fd-e355-8b22-f402-321328be3976@suse.com>
Date: Wed, 5 Jul 2023 07:55:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] x86/asm: Introduce a tailcall pseduo-op
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230630152057.2944373-1-andrew.cooper3@citrix.com>
 <e85c73ae-aaba-a649-6bf5-5528b4cf6e95@suse.com>
 <91a3c0b4-04b4-d1ae-e849-f9c23540e0ba@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <91a3c0b4-04b4-d1ae-e849-f9c23540e0ba@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 071e4983-6d1b-4093-8b1a-08db7d1c67f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CbDVhftS/IErfbX2Xo6D1kzdAPcaValgSeHFJKmWslwEPddkv7PhGeSyJSpTf6qL+dr2xI9mPyE8RCo43YNyXtLJPgvSFJ2zfH0fBvY8k3ROXv0p2SWqpUIQxPt3oVJUp0vqPfvLnhM8jHuQ4pU3G9KvCPF3QcwMkbB+GGMWiuxSmFnTZp5NwHW55YZlc+3uw2ONxiuPUpOVQ2JIHBYH6uLj3bMlUvtHoPTY0HITw+93/nPHIyuAKRqUPWsTUNWEPYFsEcX0etKMvT0KadIRI0JcXyjqRfzA2hIhqqsIB9NFG63KSNjqA5p2SNIckwp6hfRCtPTm1wIGjRqRArhRA5IYdYZYgP/eoPcyYg96m8sNAetJKCPz9iRCXR4aKUSQ7zR4I2LIzmKfC0nzc9Da5gtz36f+Mj5Bgz3cKiXyg/kUZqhUwPYy/SE/tEmBpkfasujQzEJO/1ZzqB5BwF9/JGfjHwuys2XG5cSkS7HT7NelYwJEG06E8ePQuqNICCwvAydiO/hwErj1AgnzWmM+XoFEj/jMJ0p5lbUuKHZM+MVIv33+np08wvabkd4Lt5Tjyf1gRHgnPOyHRu85tVqg8krnU7F+O3DLIbq8jyNIefmmyosYWlZnfOPs9GxLmnhBFLOKRfEXV5ROoT3P4bSIdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199021)(54906003)(6486002)(478600001)(41300700001)(8936002)(8676002)(38100700002)(4326008)(66946007)(66556008)(66476007)(6916009)(316002)(2616005)(186003)(6512007)(6506007)(26005)(53546011)(31696002)(86362001)(5660300002)(2906002)(4744005)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MG5oNDlBd2hEelQvQ1hVNGxXNUVaemdnNGJPMTc3WDNac2VxRml0eU9PbmZn?=
 =?utf-8?B?Rlpkb3pJTW9xMlBwd1RQdEcreWlxNG8xaVoyWG1UMTVIWkNRZUszbkZHek93?=
 =?utf-8?B?dXkwZGdqT0o0TTU0QlQ3a2d4WElxWGtvY3BvRFNNVGRkaUNIamNKbjYvSzln?=
 =?utf-8?B?WGx5SHlCWE9sZlZiSHM2K3Z1b00wc2NROTQxTm5XS1U0RjBjUTRMYjBIQVBZ?=
 =?utf-8?B?ZWtDUUVrNy9yYndrc0FDMUp5LzZIL0FxdGRkMDZ3VHR1aC9YZS9FVmRvUEFL?=
 =?utf-8?B?a3pXY3BVUC9hVXFaYWdQLytCbStjL3JaalVEM3ozbUxFK0pnWkJkRXV2cjFn?=
 =?utf-8?B?ZTR1a3M5bTJ4c0grQlVxb3o4Q2VWOG8yOTJ5Q3BQUzVIWlhQNnhJRmxqbCt4?=
 =?utf-8?B?clc3bWJpVVFlL2w0anBWYmN2d2lwY09RRFFxRVNkMmg5MDBrZWFUdUFYaWhw?=
 =?utf-8?B?RExhQTg5eUMwYnhnY09zdzlrVU01TmNQQ20vMjV5UDAzSHRhVktmV2xqVnJK?=
 =?utf-8?B?M3BmQml3czh2M3pOMTdtQWNmVXFrMWpSRmJvcXZwMnJ0NzB0THpaWlhscmhp?=
 =?utf-8?B?eHpsR3QrWWp4WGM4QjB3OTRtQ2Y4WDZaLzUzVy9iOEwrMy92NW9rYU44eWNC?=
 =?utf-8?B?b251ZUl3NTVUL2h3aUJZYWZWNTVwWFNEU0E4WmlzY09JY1lIV3o3UWgzc2Zp?=
 =?utf-8?B?ZXo2MXZ1c2hBb1JrYlRUcklzSzRYdDEwWW5xdE0wZ3dDQjhRaWE0Z21xSjl2?=
 =?utf-8?B?ZlFQYlFIVXZTVkc1RlNRSWdMUnFQYVFwVVdDT3N6a2g2TDB4WFl3RTVHYkRj?=
 =?utf-8?B?T2lMRng4QnVaVUJzb2k3NitvSFRBeXQ1KzE4bU10dGIxMTUzWjkrbEoxdWt5?=
 =?utf-8?B?T2Q1SE1lQ09oMk8wL1FsK0NqRmpFUDVPMlljRUFCblRuUXJ0Z1hYeFl1KzNJ?=
 =?utf-8?B?b0NWYlFZS244VysxOXg1WGt2WU9WYWVvdHJkVlYvc3kyV3k5MkJWa0xMRlpx?=
 =?utf-8?B?RFl0dFYyZk5oV3dkamdnajRDUXpVV0VLTk9INlRuNGp5Qm1PanE5WEtmbGkv?=
 =?utf-8?B?WG5IL1U3ZTBwVCsyVEVDR2NZYWV1WkV6R285QnRENys4S0xoVG8wWnZjd0dL?=
 =?utf-8?B?clNFcDR3bU5qTXIrblloQXMyR05xVTkybjhWdHRnODhrSlZJV3oxMTFmTVFE?=
 =?utf-8?B?dnFFVFU1ZVBYbGptS3p5YmRVci9ReVgxRmZFTmdaT3VCU2JNTlZWaWgzVnYz?=
 =?utf-8?B?R1FrRXpjMFYwZm9xMmpsMnV3MWVvK3dHRGszRlpicXVycHFNY2xLblVTaXRY?=
 =?utf-8?B?SDVmOTdLTlJxR0Y4Smg2TTl5Wnc3Wlprd0tJZDVqbzBDaXB2anNOZ2wrSXpw?=
 =?utf-8?B?TWtTc1VMeWNhZlQ3SDBJbDgyMXJCbFErczFtRWpNd0ZQWHhVczU4NFZQRlk2?=
 =?utf-8?B?UnJma2RTY3UzN094MEVaL2dwbzFWcGNXSTdDdURVb3NYK2c0M29PMXpGemRB?=
 =?utf-8?B?RlhBaHJnK2lZbldQNmNZWTZVQ0dEM1pLL3FCak91RGEwUmxIQktmelZYbFJH?=
 =?utf-8?B?Y3lMdnRFY0E1RUR5RTNWdmEyMEQ4di96SUJ5OUtXall4d1gzOXlIZXlBRVV6?=
 =?utf-8?B?dkRIY3lmaklvbHdpeTAxbDU2TGdONWZsSnFaeTRjNFVtTHhuZFFCOHRoZEpj?=
 =?utf-8?B?b1c0c0tBSk9pc08yVzdvYUZsM1JxblJHL1RrTm4yYWwxZThSVW9LSy81eWxF?=
 =?utf-8?B?eVBWdGtWUWpZaFBvM1dZVGlhZG0zamE5OU5IQjJLVzA2U1VkREZ0bW5TWWtv?=
 =?utf-8?B?TEZUSmJGd3NHb0RFV2JsTFFxVmxDWjNtcDNKYVFlNFhkTEtlWVV3SDZyRnA0?=
 =?utf-8?B?aHdRY1dDVzc1RmVjUi9rZTYwby9DZTY4WGM2aVNVR0pqMXdDYVhwcUd1SzBX?=
 =?utf-8?B?bndzdlpqWlUvZ0dQN3crRGVrYjg5TlkyNmR1a0JFa2U1OUJ2cjdESitoek0w?=
 =?utf-8?B?RjBYcFYzUGRGSEFwM0Y5cysrSmpTeGdTOXZYU0lqNitBY1ZJMlpnOXlEejB1?=
 =?utf-8?B?cGtqRDBuR0FVcWZuQ1V0N3BuRmluRFppL0xDQy9RcjhaWnV4VExzTFVXWVRB?=
 =?utf-8?Q?A0NBiowNIfX4LLCsBAUP8Y55F?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071e4983-6d1b-4093-8b1a-08db7d1c67f9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 05:55:16.1074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSaDNt1uC9CrL5rFziLTZrENWCvrCa6gve86Ptyyw2mmBjhRzRwAwoDYNJvwZ+ulFLOzxHO2JAaL9T9j90cn8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6807

On 04.07.2023 19:04, Andrew Cooper wrote:
> On 04/07/2023 3:29 pm, Jan Beulich wrote:
>> On 30.06.2023 17:20, Andrew Cooper wrote:
>>> It was previously noted that CALL/BUG is a weird combination, but there is
>>> good reason to use this pattern.
>>>
>>> Introduce an explicit tailcall macro make it clearer in context.
>>>
>>> No functional change.
>>>
>>> Reported-by: Jan Beulich <JBeulich@suse.com>
>> Did I? Must have been a long time back, as I don't think I remember us
>> talking about this.
> 
> This was discussed on multiple patch reviews, where I was introducing
> the pattern and you were complaining about the BUG and comment.  I can
> drop the tag if you'd prefer.

I'll leave that up to you. As said, it must have been quite some time back.

Jan

