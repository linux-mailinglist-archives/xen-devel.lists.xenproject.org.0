Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FE45A20D1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 08:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393650.632716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRSih-0007zg-16; Fri, 26 Aug 2022 06:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393650.632716; Fri, 26 Aug 2022 06:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRSig-0007x2-UX; Fri, 26 Aug 2022 06:21:30 +0000
Received: by outflank-mailman (input) for mailman id 393650;
 Fri, 26 Aug 2022 06:21:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cVPj=Y6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRSie-0007ww-VS
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 06:21:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 500aabca-2507-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 08:21:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5219.eurprd04.prod.outlook.com (2603:10a6:208:cf::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Fri, 26 Aug
 2022 06:21:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 06:21:23 +0000
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
X-Inumbo-ID: 500aabca-2507-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUbiepFhIM6XCrfy+Rc062ZSAmtLvvT/YKja7TdwJtXdnW1eOkV5TxS2rxEZPxhTPjL7bqaG5+etfhOKVM0G2Bq8AoRj+tSjzPWVqqBQtIfUZkdVLuqFt/f/Bv8KYv21CmZB9eW65yr/c/rxcPpc0K1QXV4Ei16CK1Gg2hOnMg+Z8+WG3uhLlxgO4P9SD+F4mBOzkMvr/pvjrJM3AP/vAxp7m8lAHcU4/8goJjRLvoBcF644EHvG2seqPucgRHxkr+TZArsTC509QXXgmAzZU7+wtYfZ1g+25m+jsooIf3JAvbseHL+URcuRMXg4GiN4U1GUNupdZQfU8FYUcS+q3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpK1CWdht56f3Et5zwxZbuOxDAvRX4YCrhwcKoo0vkk=;
 b=fbhumtDeWcGyHih+LH6GUbj4dtzTrioEWiSlFAvKUrvMLxINOzcAf8JsiVCKlmMpZ9sWJRh7XYfwsylYEIQtrhfsYM+3eq4JEHEJULA0cHCROH0XU+HTaT18lk3yxitPzKC/X7Y24x+Wc64IHkVLU7N9kj3fYiCbeZ2qCLO6eEB8hfGPv/eoLOLWpNa6Y0IleMNJNY5HNuCNJnH3b007YeBDy6FSZcBLo7BIWRTEC2DKyrnLhOQemWqUFLHi7x8ztiNtBI5bQRvA3b0MGF91oQp/UFxWQvS/ZrQ6huknQa+6mRQ/4HuesYazzoLnMQjndhaiYtB5uAp7XiYeP+srXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpK1CWdht56f3Et5zwxZbuOxDAvRX4YCrhwcKoo0vkk=;
 b=hI5Nnm4lmaG4EHCaczfwhRT/FbN0Hn33WzoKDllaUKlxMAXtKRmfoVT5N1v9sZ2oV35klDDNBxNFilCjy2DdIajNjZOlWGekpHdxj8LHAnUSAchMmsI9X9p0xAy1FGj/1nnYjWTvLZf4sWCx8U+GIF6GST17KMPWYMpGRhJuNaah3v9u0HeWOv8skUrmalPqR4R7JDq9pXoMKlS7O46kTe/AibfyBeFSRSNBjXycKOAuqO1VYasAVEJuK/RVXVS08XdO7UVAgNqNMgHZ9tF5Hxqa8bRRMOP1M9t4Yd0mPasw4wTfk824a0392SgxtWnWEVNpEfS9BlWmMgthXiJHKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11fc391d-f53b-1bc0-19ec-168ec827a1c0@suse.com>
Date: Fri, 26 Aug 2022 08:21:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 7/7] xen/device_tree: Fix MISRA C 2012 Rule 20.7
 violations
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, andrew.cooper3@citrix.com,
 bertrand.marquis@arm.com, roger.pau@citrix.com, roberto.bagnara@bugseng.com
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
 <20220819194359.1196539-8-burzalodowa@gmail.com>
 <9b053c3f-0274-a63b-2a6b-a1715c639092@suse.com>
 <25e4c770-9b97-a96d-5f5a-fea815bf9737@gmail.com>
 <7d32d3d3-daa6-5492-02fb-db6ca5f154c9@suse.com>
 <852c68d0-bda1-e56e-85c0-500c498054a0@gmail.com>
 <2ff949e4-5f02-f476-7b14-252252d1b8b5@suse.com>
 <alpine.DEB.2.22.394.2208251045380.733916@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2208251045380.733916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48c8f5db-0b1d-47e6-73fb-08da872b32f6
X-MS-TrafficTypeDiagnostic: AM0PR04MB5219:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pPDoyl2ZyGX6VCf95DZtRep0+A7DQpCHNnJCm+2QxgN0bk5bHO1FIWa2IiyICX+XYjE7qFp4nnyRX00e2GFSGPNMH+CnleWBPYW2e+fxJb3AkH8DnL2/9s8ZdJUUMVQtxtjaNj15m9k1iPxqZwJvPALoZoqEVAU+dYSoIEkJkHM5TFGBu9UFGXsFt7k3OZ1CpMmuQb+oNl3Ky9a31nEyTCGjiLj7IFdXgBhZW1MDOMVj2aboEhpwqv/Jt7e7ksLjJp0e0LXN+volV5YiX65KfNCusHQbkXLEl8dF0y/vY3ScxDVO0xoQvnM2jiMPjNXlt9sYEML9h7OARL1LciSQnjhTAccKficWBsfdXhaI7PYlfP6WHVtZxBFr8Kgp4zbRos9zaKvIpt+6EIvwp9ShEMld9dDi0p8+hj64GJfCKy4Emq42tr0/sRpgTwCLcCB+Z63fJ/rqzmce1cQwbi8Ezwh6FgZrGd4yyxkbASaZjQk1AbJDT4tvAVrhpvs25h77LVlJQlOqbG3WhKZrx2+7YTu4h1ddGvyFTBLqMVHgq0BmluKv2vBJPJDdnVAiXozTG/19zs6i1SeRTzhwy4AqxHAkka5ZkAeUT+Nnoro3dD/QajT+BqM1klnTrsGg6cBmqZ75CktO4KI9HTmY+4tKjaYMBrWNQS89LMEt9kUloojwa9NuKrgaCGBkpkfDFFKlhTyOZIed3+4F4rjxgDPyTJbhMsSxKUxVUaXu1EX84+oxldEEyveIxDoWBUB0gzFobUrTgECGqpR9nasHou+eFsxP8noeVuyozFZacqgqnnY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(39860400002)(366004)(136003)(376002)(38100700002)(6512007)(2906002)(53546011)(6506007)(26005)(83380400001)(2616005)(186003)(8676002)(66476007)(66556008)(66946007)(4326008)(36756003)(6486002)(478600001)(31686004)(6916009)(54906003)(316002)(5660300002)(31696002)(8936002)(86362001)(4744005)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzhwdzZrdXFYT28yRVMxRUtPejZsSWUwaUZqdnU2QXFSL0Zpd3hEa3d1L0dr?=
 =?utf-8?B?MmtFZHNvTVRub2FzaDJmdkw3NHdsMXpQMU8xNTE5TEsydjlrNmhoMFVxYm5P?=
 =?utf-8?B?Vmg1eVJGV0I4VVJPTFlKcnIwL0RQY0Z4b3lwYUxWYWFXK1NWdFVyTEZHSnRr?=
 =?utf-8?B?ajBvdFpCYVNUZGxTcnkzOVBla1U1dWZpcExsM1F5cUhUNm82T3FYVHcvR0tm?=
 =?utf-8?B?a3Q3c3R2UHFIVWdZSEx5REhwT3dpb1R3QVpuZmVaMjNsOUV5MEg1T0VRZEp1?=
 =?utf-8?B?aHZFdzlsV3l0d01ZWkYrK01YU2xRTFRScVo5VWR5bFpGSGppQkc0UGY4TU0r?=
 =?utf-8?B?dDVKWDlEbnk3OGhLMVYzRHpsaWNFYnJZandzRDA1UG9QZG1Pd0hlUHZCWm9S?=
 =?utf-8?B?ckQ4YnN0QzBycjRpQ1NsMTIzM0pia0ZwdlZ2RDlueUJUNUlLY2ppNHlJdFlp?=
 =?utf-8?B?aWxLelNkcmF0VTUvMHZOWkczNytWL0VUN3FKazhER2dseCtFak9TQzFLVEJI?=
 =?utf-8?B?c21MN2Y3S0J2TTdaRkFkem85UVNONkc0MWJ5UzhTeTAybzhsMVRhQmhtSUNq?=
 =?utf-8?B?eVJ5R1VaOHh5aWVpOVh6cS9LbDFmTHRMQTNRbGliR1U0djdHR3lLZENvNHdo?=
 =?utf-8?B?M2tnS0NMZk9hOHM0ajhUYk8raTArSjZ5NmxyeWtJQy9DdXZhQnptUU9CK2I5?=
 =?utf-8?B?TGpYRG9DcXFjOFBuTDhiNEZ0NWtMQW8ycWs0WW01clp1Y3NHeVZHVUk4ME5X?=
 =?utf-8?B?QXpZRnh0WlNaR2hJZ3NDYTZnS29ka1BNSzRkUEJJWkNXblNkemdUeVRJWVdG?=
 =?utf-8?B?dXNxbU1rOVk1bU5FOGVPb2dkdWtnbnJJbC9rRG1XT3JHdjA1Uk1SdzNrZU14?=
 =?utf-8?B?MGQySStJVlIxQk43Vm9XaDhxN295Mkt0M1VveFF5VG9vZmtHU1EvS0VLazVy?=
 =?utf-8?B?dXdqSGxSenF2QWRTNUFLMzhDd3hHWFRuZDdyUWFDMUFCTXJ2MHNBejY1b2hS?=
 =?utf-8?B?UkVISkFHQXp6WlhlazJUd05kWVZVSVJ5cXAyVDdoaXlrU3NzQ0dhNXRqRFdG?=
 =?utf-8?B?RlVWeVZYYUNxT0N2cjJSekw2MU5qc2V0Ty9EWEs3NENHOW9NbEpwZ3FmSjJ3?=
 =?utf-8?B?cjdzOGNrUGE3RGtna0o1cU1RS2w4Z29uK28wcWtMOGhLTHR5eDFEN1VCSE5S?=
 =?utf-8?B?d0RQdDNRLzl0cWhkWlM5T3N3emUyeG9mWTYycWNpM0lPT3FzcDRvaDhTTmEx?=
 =?utf-8?B?TkQxTmEvOGMyUHljR21iNU42T2pmRENTUmd6VmM1M3l5UlZCcytqOWZ3NUdS?=
 =?utf-8?B?V1c4SlpQSyt6TkR2WDhUTDkxL2JVbVU3ZXAyZkJXQVkzYS9lUElCV25kUkgy?=
 =?utf-8?B?Q0hCL2VsMUNaRFlxek1ocGFsZ0ZTRCtyeVVlYmJTUW1YV1N6dTkrdFpXTUlY?=
 =?utf-8?B?dC9uUXl1RDNLdmpjSW1Kc3pDVkdSZ1FUMzlYTGhDSkRLeXd1MUUrT1JwS00r?=
 =?utf-8?B?SWZNVTFxeFdFU0V3bFlDMGwzS2xCQUdFTEFVMDMyaTkvWXBYSzhrdkVzU3ZC?=
 =?utf-8?B?OEZzR3h4MlB0ZTh2aDZvR05Qak1Kd3R6ZmJ4T2N5NnJHcmVKZElRczdkZHdP?=
 =?utf-8?B?Uk4yOXBUWkFkblg1WTQ1Nkxnc3dpajhJeitCL0JucEdiQy94VTRYRVdDTUV6?=
 =?utf-8?B?NVhhbGFlRk03T1FhVE1LVWZHZmVGemhKaXFocElYN05wekFDNG9MVDlDNUF3?=
 =?utf-8?B?eUJZVVhobDFEQ3diUThlZTAxNWpZUExFWHM4MlhkRVRyeTRGUGJTYzZqdURy?=
 =?utf-8?B?V2taUXRXajlNblk3VTFPMlB2LzM4blc3RW1CRGdVTjRxUDYvR3hEMXdpYWpG?=
 =?utf-8?B?eUEzS1BIU1JrNTlvQytqOUlnYzRjc3p6aDBjSjA2WHB1RDRNd0dGR2NIYXBV?=
 =?utf-8?B?QWd4cWdYYU1MS0ZxQkVhZ1V4VmdXSWFnSW5KOEdzQlZjVE9RV1JpcXBsZWN1?=
 =?utf-8?B?YTRXT2J1Sm5DbFlQenZ6bUgxbXJUcDV6U21SaVdGaXJSbDlvT2NyZk5FZHJN?=
 =?utf-8?B?MCt6VjJtYVcxb01vQlVvWitFNUZURllwRWxDb1lhYTZtM1hpeVhDbmtkYWZv?=
 =?utf-8?Q?U2iiY1MqyJVMMVvGwpe+5fDBG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c8f5db-0b1d-47e6-73fb-08da872b32f6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 06:21:23.6108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4SO1fhfjDcFjjELzgr3OqEJfZEOjD1SVCU8GXHlHAcw3HLg3pcgvOgVsLKCToF0ZTzXSppzgAtEjrRH9+5XaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5219

On 25.08.2022 20:09, Stefano Stabellini wrote:
> But first, let's confirm whether this change:
> 
> 
>  #define dt_for_each_property_node(dn, pp)                   \
> -    for ( pp = dn->properties; pp != NULL; pp = pp->next )
> +    for ( pp = (dn)->properties; pp != NULL; pp = (pp)->next )
> 
> 
> is sufficient to make the violation go away in Eclair or cppcheck.  I am
> assuming it is not sufficient, but let's confirm.

Well, even if for the lhs of assignments there was an exception, this
still wouldn't be sufficient. The minimum needed is

#define dt_for_each_property_node(dn, pp)                   \
    for ( pp = (dn)->properties; (pp) != NULL; pp = (pp)->next )

Jan

