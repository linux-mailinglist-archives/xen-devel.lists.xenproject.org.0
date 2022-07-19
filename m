Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC430579309
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370343.602037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgX9-0007hY-MA; Tue, 19 Jul 2022 06:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370343.602037; Tue, 19 Jul 2022 06:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgX9-0007eZ-JO; Tue, 19 Jul 2022 06:16:39 +0000
Received: by outflank-mailman (input) for mailman id 370343;
 Tue, 19 Jul 2022 06:16:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDgX8-0007eT-6j
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:16:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 583efe9b-072a-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 08:16:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7309.eurprd04.prod.outlook.com (2603:10a6:800:1a8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 06:16:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:16:35 +0000
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
X-Inumbo-ID: 583efe9b-072a-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAAY2C22UnBpn5RBHkNlUVtV0FNVzo8FYNnwEY356g9W+CmuIKS3mIQhBgP0BXSLbvm4PeP37asQs8KyzYbKMY2q9p9ESsZc0xqsv8+4xrfOs0ycV0gYhrOwxi65k/kLALhy+OI0f9/pAs99yGWZWUtaInZeuFzhH7N6QBn7KraLXVCUaDNugrR0cnpTTMk9lTvhdJE+w+EacZ5rBqnutoMvvamtLff5OW25L1lDBxWGs3SVFWjPpJ4yz/daNbn8zpTnAUtZzW3bHxbYsOclJ/zDkw25IO4z2dNzYb2ROXgwF2nJBFZWOzgAedDW4vtX9HopWYe7ISQpWTqI+GslAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yf2WrGHy1y670El0ayoy76jyaTuTUcESRHL6PrSYcdk=;
 b=aP85kyjIZPAkHSOqlyqh53IQjKX0H1Mqx2a7SbaqUatoiO5f6o5rjeQU2pTp6tZA4Zst1Yo2ssh53VLmAe7HIsMvMNJQZSyIHRE6gbAyH9ZUaEOieFBU1rz0XlPw1+m+O/AqbBWweBmvnBy4OElv4H4m/qYgWcrhWIPpKiA3OAjcpMYh8xZ2V238xQ8cKBBNxukX7RGj3X4WAnxS85v81/s+Ijt+HAayY8o/N6hlPj6WOGA2piDM2ywrA+CVWqDAYgtjsmMi3BV4RpmLqzvh6VuSgwyOO267ayGAVRKQbQSB+F6J+SSiYq3tWsNwdI5ZstA4ruolDp3CS6QFglVw6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yf2WrGHy1y670El0ayoy76jyaTuTUcESRHL6PrSYcdk=;
 b=ufN3MbHDo6W20TzbQGKBXcNHDD2pp3aMvVgwKzZBj9Oxu2Hi9udLRQTJgq3+WYIjrgvI4YvHd6+vps4Fu2a2o7BWRI39xZNYaHgWasPtrWR3p/yVi1DeeiDYxqo0yZ/tbp2txVvVT6UVxwmj0qS+9XOKeC+kySVkhdcaZik3iho++X/baw81Y2H/BDA9E4WHTaXiEyEU+HxLg6P/lMHgpSG02BMZh9lo6TBFwImJA980vaO1bVhbXzJRe+jj1KDImjAtzAoEW+p5njPxO5YM49dL1OmtJtigs0vfq68/FO1TpFeICqRlnQtkiE6rF9Pu1wzzVEdo8yNfoGXKt01NRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ebd876d-5cdf-8ac8-86ac-e5333cbfa365@suse.com>
Date: Tue, 19 Jul 2022 08:16:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] x86/spec-ctrl: Make svm_vmexit_spec_ctrl conditional
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220718205009.3557-1-andrew.cooper3@citrix.com>
 <20220718205009.3557-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220718205009.3557-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: deed3961-689a-42aa-fadf-08da694e3b87
X-MS-TrafficTypeDiagnostic: VE1PR04MB7309:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1E2LUOFzrnU4L0Rb6Q1Pw2dsLgZp/0eby6QuberMKsH14eo4nGvxH0dikjSIGTME0ZA0Uuq+wcOGci5Ec5sQWFUabzpoUL3oJ5GZK+459FfSqzlYPGg3VVQw8Q2ewt2OW8qiCK0IKCeAtqETcJmPe8fUv72FWwMGNuyjluaeoa0yO8GH1ZQAiyQa/jCldJ8L8eAR35S+Ey0/eBPFtvS2+e0dZyvuyJ4TtxU4ucgOH2PthIr3U/+/MAXb0+84Lend5htMoU/iUfud77NlaPQzf8PIl8hkSvOBFh6aK53Upq4QpVyslVlF5l4IWfUHDShwMYCTDrhZUJ67R+C+nV4Ydc4bC9M1ROak2PgnnUbgzY9gsUYa+qdfSsumsctsR5WTSxxcCGlH1k5IK+upU0sJUGbm32BSQ6JjPjm8l14u8AQ+nzD68KmtwcRvJBIuYMYsQ9A4nTkwrMH+qrnD5RYe93o4c2h+9YB8udLlDwxxqzMysjoYlRbSMyUpflJGfGU3otgO4ggz/EAoAN5jiec7VVpkBb2b8JUovuXsGNI/7V08oq53fGynVz3bM9V1yEfJvNyB2aX8aI0CuHNnT3rkfh1WulYkQsrfZE5Cg9jMaTGt+Ckz0vWpkGBS2HLJnUS/socB2ciwWOg5hr0ijIa3cKpinUZMS6A/ZRrkA/tWkPL2t8+HyvX80YSTF6rgDtTd3uez5nqVUFAKx+MRTr8lLuxkJ3+xreHkF+0Ykj/4KPbDfSIrUMabI6zt2VDZ5ef7iiUXTWDnEHzpE1Y4nx9/Xh/mz5sCKz5clBruCiF4Ku6Yu74WREGrcBavy52RWfEgk5xv6MulzhNu3EHNNE3YSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(366004)(136003)(39860400002)(478600001)(6486002)(41300700001)(316002)(6506007)(26005)(6916009)(31696002)(86362001)(31686004)(2616005)(186003)(6512007)(38100700002)(53546011)(8676002)(66556008)(5660300002)(36756003)(8936002)(4744005)(66946007)(66476007)(54906003)(2906002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW15eGlSN2hkN0g4bmsyUXd1Qzc3N3AyNC85ZmtOcGF3TEJwNEZjeGFOMUtE?=
 =?utf-8?B?OWRlUkVnd25YbTE2eXFWL2pXN0lwUVRjVXZaNTN2NU5uQnJUQmtCY0pZSU9r?=
 =?utf-8?B?UTJpRG9VUDJobjc5My82RDlXN3VJOHQ4QkxyOEx5eExKTWF0MkZZQjlrVjJh?=
 =?utf-8?B?MUM4Q0w0cVpDYWJkVDBhYktWSXovRlNxWUNBSEJSWmVUK3U5bHN5UE9mbmoz?=
 =?utf-8?B?bENEY3hOdG1pUGJpdVBqMldGb1p6US96NUNNVmdsQ1lEbG14MDJ1aWwvL1dz?=
 =?utf-8?B?MXQ3ZUFjTnhhSEV6dGFINDcxTmFFR21LWFUyU3kvVE9oTmIxbWhaZ2o1eDdr?=
 =?utf-8?B?VTV2YnllbUkyVUpLQ2VzakdXZWcxMTh6cUNabjV3ZXJ6aHAxNEpkMnkyYlJj?=
 =?utf-8?B?WHJydWkvQXNxYkFTYVkxQW5SQnBLZzhPWVRPMzM4RDZZRVJtQ2xySko0L01h?=
 =?utf-8?B?TGlWT3JMaXFNczZsMXJXNUJnSkRadlluNFRIWnNHcFNBamV2QU01Zlp3SVhh?=
 =?utf-8?B?V05QRy9SRHZlUGhQR3VPVW43MElyM2U3ZmNLMk82VEFkUWZ6QTI3V1gxQWRi?=
 =?utf-8?B?Z0IvLzRIRjRiQmFIalN4ZW56SFBwYlFCUVhEOTY5dG1ObEJpNi95ZUdzdzU4?=
 =?utf-8?B?NGlicEJ2K1ZhUW5UY2szMUFvWmFXTzNtNTZoeEtKN2VJTU5ZMkhDYjRJVHpZ?=
 =?utf-8?B?bW8wZVZuNUcrcS90a2szcktvek9YSHpSUVdHcXhoNFpnTThRcGIra2t4QWxp?=
 =?utf-8?B?UmZJVVRRQ2o4a0IxNzBUbXRiWGI3NXpDdk1xUW5YdCtKQXpTTkhZUEg5Z3VY?=
 =?utf-8?B?SmNqbjkzemdzSmRmaXd6NXI2bWRvd1gxWjQ0WTk1bXRvQ1IwQXk4MjRJTkdp?=
 =?utf-8?B?dEE4ZnNmVmR0c0lGSnZuMmIxeUlMblNXTUNsZ3BJaGtpdk82SnJyVlY2RTdu?=
 =?utf-8?B?U0k0b2NEaW1ITC9LNFRnb1BKOTdvZVR0MUdWVVFFSU9oQk1hRFJvRVBZKzUx?=
 =?utf-8?B?SVdib1pNdnBZa20wN3gzQTRybGNjZnVjcjhETkcyczBCQUs2SEVYcHpLclBG?=
 =?utf-8?B?Nmk1UkxsZUFyMGpyYmRHUEU5MWdSb0RKQkZVeHNyQTBybkFCNDdzWmlTUHhS?=
 =?utf-8?B?VnlCODdjb0V4Umw0Qk9VdGYyVTVMVFJVRjdYMHlVeXRCb3hna0xlcWxQNld2?=
 =?utf-8?B?RDFSS3VkUm01Ty9QWGZBMUFGM3JDbS9XcHMrVkZ2TFdEZWJJOEt0WjNCL0tn?=
 =?utf-8?B?N01uTG83QXhVUE9GeXJCQ25PM3dpSjVma3Z6NDF1dWVuUDI2Zk5wVTZhZDkr?=
 =?utf-8?B?U1E1bTZsRk9hZjlOSUZuMytlWnBMYXYrbk1aaWVpcVRxbVAvMWtPRFptTlNT?=
 =?utf-8?B?VHJ3d3VrMkc1dWd4Q1c1cUV3WXlDWVBDbFFsVG4zcnc1QWE2bnNVWFNrNnQ1?=
 =?utf-8?B?UUtrUkxza3NVOGxoK2FTOVA5RHFuVW5NRFR4MlBXeEhPNmNEbTEyZ2Y2Q3V5?=
 =?utf-8?B?WE14a085VUs5aFlPaWxISFR5REZZNnFZdERzdHpqZU5PZUtuVzd5T2F4RzBk?=
 =?utf-8?B?RisyK0hTU3lSbUI4ZFNwWXY5Z1BFZlFRSmhqZHV6c2wzYXZ2b3ZkbW9kSExO?=
 =?utf-8?B?S0M3UGRERVhjWmlHMi9sM0FzT0xyRlJkQ3dNZVlnMWJvMHBxcXN2ZU5hVWhk?=
 =?utf-8?B?MjZsdk5DMktvdDlWQllPNFFtZXpXYllicnV5V3V0NU11bGVqUHhrRmI4cWgw?=
 =?utf-8?B?MjFKajZocTZsMTg3am1hT2pGZGsycUkzNmUzWjg0QTJNTzR0WmZhM3RUV05I?=
 =?utf-8?B?U3VaUVQ0dmZvQ0ZtRlM2b0JKV2VSZTdMMk9CSjI5UEVLSEMvTFQwNld3U1Ji?=
 =?utf-8?B?TG1vbG9aVy9LSG5jZ1p5K2hzd3JiNUs4QjhaTWQveldEVmdtdURlbmRndUFn?=
 =?utf-8?B?RFRUb2V2c3ltc2hKaHI4MmRkVHpwdmYvTUhCNXFtZlJ6YXN6ZUtuVndYdTBM?=
 =?utf-8?B?NWF2NytTZUJVa3U5T2h6MTRWTHlZY0dwK1NQenM2Qy9uWmRadGtjZlRjdkFO?=
 =?utf-8?B?MHJDSGNIR1NsYnlPd0hZS0xGejNUR2ErcGVlbEFDYXU1OGdQZlRLNXV0aURl?=
 =?utf-8?Q?uYZTkihBbqUHdr2T3pfaMLb1Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deed3961-689a-42aa-fadf-08da694e3b87
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 06:16:35.5198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNHKuZUw1aV/gpkOdYhNpn9CzErFjqZraXVQ9GPp3HFCK0SzmS6jm3e556Pqt/rcikgjMowk7SE7n/TpIZRo4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7309

On 18.07.2022 22:50, Andrew Cooper wrote:
> The logic was written this way out of an abundance of caution, but the reality
> is that AMD parts don't currently have the RAS-flushing side effect, and nor
> do they intend to gain it.

Nit: Looks like there's a stray (leftover from a re-write) "and" here?

> This removes one WRMSR from the VMExit path by default on Zen2 systems.
> 
> Fixes: 614cec7d79d7 ("x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


