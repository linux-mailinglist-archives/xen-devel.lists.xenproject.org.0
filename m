Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E38C561573
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 10:52:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358332.587484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6puO-0006LA-Kw; Thu, 30 Jun 2022 08:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358332.587484; Thu, 30 Jun 2022 08:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6puO-0006Ip-Hu; Thu, 30 Jun 2022 08:52:20 +0000
Received: by outflank-mailman (input) for mailman id 358332;
 Thu, 30 Jun 2022 08:52:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bdU=XF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6puN-0006Ij-BB
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 08:52:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70074.outbound.protection.outlook.com [40.107.7.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f121ad0e-f851-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 10:52:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR04MB3110.eurprd04.prod.outlook.com (2603:10a6:6:c::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.15; Thu, 30 Jun 2022 08:52:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 08:52:14 +0000
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
X-Inumbo-ID: f121ad0e-f851-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8fuCvmvRK3sPGXeU76+1Y3QzuiJ1bfOdJJncs7oYEsJV46nHHCDyeAYKtrF3XpVfqoq6lF3DsA8Z//SAVGYjKXWC0fs50CcCl4+pQHmHnbmMgNcU9WszrAMjBfmmFOQ9iBVb2k8zJe0tsivtBznv1xKUdZ079P6IcHZw43EsyUA1VISZN7pHL9Aj+VV/allwgShPXmtPvIc3oH9UM6Zf6vgAOJePU9pJExl+97BY3fW0LzSBVfwSqa4Ioa0UyZ7LJzHi83IC69e9CxS1B56GHT+iCXk/ZqunX7srnttaOof2sLo6amcK8tAIne2BMa2vpOz48P2lO/FTmqYwE7qbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nitpe6UruRN2EQBY2H41fFc84WNrY1b1bKtQkwan04=;
 b=GPT2M7i6Kmx0mOR4+Ua6T5URJoGgA5eBN0EnJnPg+TwlYPf/sXuFDYO6wFpHjuWnzIhe6WuvrkU28RJPB/7vcgl9mMHzntypMyTSerPfCrbk4fq/gZMSvO8havhsycaf6GU7CIl/kkAZr1yVE1nfJmPzuYXvGRsQnejUa69XkvojtY/ZhEo0P//OnhkPWEbAwjzW1rIqJzO7y7TEa68RAisEJC9Kso4h3tjcwqt+tYHiDZxAfnPFNzy2Fb18QQwjhDe5+x4dPysO9pAK6CWD3nzUjkRTvJknC9GgQzmDsBFDcbQFXynIeBMA47atkYW7ZW5yEIMiP4bWjR2HOk9Swg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nitpe6UruRN2EQBY2H41fFc84WNrY1b1bKtQkwan04=;
 b=c3Ofpu7UlH4AKn+j/bBJQMzsFjwx1ga8l94LbYQXPa73+7p9sxc+mkIl3QVj+vbeEXdAMgS+pW3jV0CrJhv4ySzhcVNbVcboXI/X/N4+NR4e0EETzhPAKp7gLdDzmQQ6h1jfVz7fC4rgWmEDyoyF8eb6I5vgS+k7pDwUDgOHjBaI+iNJPhKpA80N3c75x0SMJ/OOPSPhumOTmUM8FuNuUtX6RDMJYzjZEa7GuWq4PWUIb2wCWVTS11V3eDLukS2vHPhoJ+SsF3W+3bvrV6TxJB7J9ft7Q6BvsGgRdqRxfzRk1G2r5qvhIuLTEq9k2Sup6mTSiG2WzVLvwwbxh0WFdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8e8c90a-bbd9-d85d-876f-04de2617c000@suse.com>
Date: Thu, 30 Jun 2022 10:52:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] console/serial: set the default transmit buffer
 size in Kconfig
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220630082330.82706-1-roger.pau@citrix.com>
 <20220630082330.82706-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220630082330.82706-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0086.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bec33fc-17e7-49f6-26e9-08da5a75d411
X-MS-TrafficTypeDiagnostic: DB6PR04MB3110:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sj/eCaxYWjOSy3gigQuhYaP7K/5hIGnOyURx64JNPWqM2MZpWUpIZzFoFNeUbg7F6rEzKNY59LOz9apc2sdXNt9amHckVIxm6+skKhQUTN7yKAmFQCG0qkfA+a+TCZndBXs6E9MI+zGel3degSPTx5uZWOT/RJKiTyiVVo4DrDXnicWvL9aMEagLZQ1SaM1Vl3mgeaD2Dmh4/Zcxv213TKraMVlQuVhIwvNzpMsIsSbFbhkpT8ybzUCnMyFiSfWNmaHNjfHUMoPHXmbkRWrdIv2tA4pmtFbGPlQdTGJPA+WVXcRVeYKoe+ZgnqGzIPFNbF6cVedcozG1FWpyn9HK/wVTxiPV1PsOet8hF/yZooQaEp0LH493dCJS/ztlwhcuEya77427cjz76kf04S0hPM3ZIl2Vojt8Lv4jJMgWPfOkkBFqaN67xevHkfOR3hufp6XGZomFUofDPTC7SNtOwjax+cUA7bBMqfs/wSpj63EZtrkYtjrnVPGMwH0qX2T+MIfhzLZS63dItCPpycHKBlgeKpa5jptaqh0HER05GUC7igaRigdaoiZK65lHVEupD2N1T5+dDBuDa5CDTMyb2TnNIyZk+biP3pGnEK2FTnvBgoYePFPCES8RAzYppvhw7tKjsiSBJuNDvyMB/c0PQ10HIxUgAu7s99QEYcHvv1YhR9wfyhxVgrmm94rwmiWKrwjCPurmRsF0AmoUI6dGmqxslX2rSAf7U8tLMbJo0/8Mru/Den2R5Dkl5IyciRQnrbGr6aMqiwQKdcoLRN0/yQPrnfMr58Q7iEbxWS1yNcdDgYBz0v3GteVsbiwr6Lr7TVUgX6gZb2EiRVWcGBbmPKDyRD4DGvQYFKsY2XgkIek=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39860400002)(396003)(366004)(346002)(31696002)(86362001)(558084003)(66476007)(8936002)(6512007)(66556008)(2616005)(26005)(38100700002)(31686004)(5660300002)(6506007)(53546011)(2906002)(36756003)(186003)(316002)(6486002)(54906003)(4326008)(478600001)(66946007)(6916009)(41300700001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVcyT0FNcjZ0Q0lya2FTdk5pMFd4UmZWZXV0aHdnVXR4d0MveEVIL05NWFEx?=
 =?utf-8?B?anFPWVpNNVFGcXBJZ2dadDJjSzZydTlPUnFndG5FN3N2Y1o4blA5ajFraWln?=
 =?utf-8?B?cHRhbEdyS0M3OFhLUk9pTUFWVGlQcEJhLzdIYVRRNFpOZkR1eTNpUXdiTmsw?=
 =?utf-8?B?Y3NhZ0puOVZqUEJhaXhoc1dXQUZuYTJiYUdvS0RJS2lwN1BDLytsUUg5Rm91?=
 =?utf-8?B?cGFQYTBLQTZHM2U1NXJiKy8rTkZuN1ZrU08rckJmb1lLa1dad29sMjVOeCtP?=
 =?utf-8?B?SWxicjZ1OWxrRnl1anNZSVM0T2txRUlocjhPTG1kbVprZHJEZVkycG15Y1Bn?=
 =?utf-8?B?ZS81ZWJZZURiVHI0WTBZa3R4Z05PMk9rSGFlY1JNOU5wb2VBRGJoOHl4eHBK?=
 =?utf-8?B?TzBGTHk4TGtWMk8zL2lsUWZndkcxNDlndGRTdkdhMWpkN2M5RjhtN2RFUDZY?=
 =?utf-8?B?WFhMVitzTzFEVVVpYTUwSFpSTUorMmQwMWF3bDRIZUpnb0Y0MHFyQUprTEhl?=
 =?utf-8?B?YkRpZTNuZmdFcmhDTjRwOTFYNmRyYjNFdmVmWHh3UXkzblkxMmZvcDNuUG9U?=
 =?utf-8?B?MDN5UTBDZGxxc2tBanBqWFFtUWdRN1Y5YVZzZDZqVS8wUXZ0OTMzUmFhQ280?=
 =?utf-8?B?V0d4aVgvaFlMMlo0ckdzbzgvT1dFM2grSVBGaEVYNUdxbEhsMzlLczdURDNI?=
 =?utf-8?B?S2xzOEZUcytBTnJ0YjJJRS9BaWEvVzZFSFpDZ09IeXpkZUphajV5L1dDT1Jk?=
 =?utf-8?B?ZVlxa0NtUWR1RlRNbEU1dEUxUjd4VnozQnlCTGpkWUp5UXV1VTI1M01yMW9h?=
 =?utf-8?B?bUd1WG1LRExrdUczNXI0VnU3MGlzT281T2g3dEJYV3BLWE51S0ZkbGxsdDlH?=
 =?utf-8?B?OVczd2RYUXY2d3l1VkxaUW41YWVmZHo5b0J5eHNhQzRBbFVGcmhwRVRpK0pD?=
 =?utf-8?B?Z2l2TkdrOHVDS01hV3dxaTFKOFdMSzFaVzBJajF5elE3TzBUenlkR1Y4a1Ay?=
 =?utf-8?B?ZWlmdUM1bFQwN3BoeUwrV3o4SkUrcGRYa1QwUE1pY0xONEtTM3MrdE9uMktK?=
 =?utf-8?B?TWpvRXI1MWZzM2lRVEZvN3dwQVBtKzV1MDZRWjVleDhyS0RUNjVpTXhjaGpz?=
 =?utf-8?B?QXZQVjZkZHYxK1VGUSsrdHhOR3pWYlB4MEhBRDF1bGVEKzI2am1uVU9ibnhy?=
 =?utf-8?B?bDZvaFhRWnJ6d3JZY1AwUEtoMjRETnEwblcwN3czWnJnVGNCV1pXMzlIWTdT?=
 =?utf-8?B?SkdwSWlaQzVYWWNTQzlQVVFtMGEvVG9EYkdvZERhRXIwNVBEbit5eHF0MzVJ?=
 =?utf-8?B?L1pkbStYeWxSRzBYUmtodktBNzhTYU4rNXFKcDNIb3R6a0lNVldnZ3hWU3J1?=
 =?utf-8?B?aWhoTWpIZnZ4QjNTMTNqaFFMMDkyL1hJbnhZNDc2MWxOaWNDc0EyUm5wTDMw?=
 =?utf-8?B?RW5adVhPSmxudGFvVFg1UHBCQXZMUzRvR2ZQSmgwdU9sUW4ydHVjU1d0RjdY?=
 =?utf-8?B?enV5VFlRTlRFRjEyVGlxTkQ3NERYWkJsRHBxZWJTKzZESmd0bEs4bzRpNDE2?=
 =?utf-8?B?bGgzVjh1Vm1Gcis1VjIybndWN3pmUmdJOUVrTkVjZEd2eGVqSVlCcFNkbGNI?=
 =?utf-8?B?QXNDSnJzTWJuckxISDljeStudFVSaXA5eWM3bUpIb2hyUERqSmwycHc2WXNW?=
 =?utf-8?B?aTBvdnhqUjFocHhOSzZ4VjlIUDlyanN4MlEwVGp2Q09TQVY2dXcwUkRCTjVU?=
 =?utf-8?B?WFBjVnJaem9QWWlCR21QNTkwYldZeDhuU3g3Uisxb0RlYmtwTXF4NU4rZUFp?=
 =?utf-8?B?MjhFNW85ZjAyNzdzM0JlWTdyNUVEWWlyR3puWTJYSWsxcXZrMmZSb2pLWEl6?=
 =?utf-8?B?UFhsZFZEaUUwZDJaWUxWY3QvV0hJaUp2T0xUaW5QdXlmUnFraFdSUzNQaUN0?=
 =?utf-8?B?S2UxSnp0RWk0RWorNGtDdDJsZU4xZ3krNWR2bk9ieHFnaVBEWDY0ZUhuQmZI?=
 =?utf-8?B?b1NKZGg0TVRLVElhK0srNTBqTkhzWW8vTGhoY2ZNSVV3OW9QRnFFNFpXeFlF?=
 =?utf-8?B?VnljVjlUTGk5M0t5ay9JTlRPYUhoRjFjTVQzdXRTRnU1MkJ2aFpQc3c2NFFy?=
 =?utf-8?Q?ryqdMwsJCQ0bKQPZV0pmbHdWf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bec33fc-17e7-49f6-26e9-08da5a75d411
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:52:14.3944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ktGiLJT7dmxAAiSZC+QYz7v52lBDBm/I5PSzrDggg7dFdYmK7NHaSgQPNUPyuo0XuiowMd4P2GDZ/aElVmOjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3110

On 30.06.2022 10:23, Roger Pau Monne wrote:
> Take the opportunity to convert the variable to read-only after init.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

