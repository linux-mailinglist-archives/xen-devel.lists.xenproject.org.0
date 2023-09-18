Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB0C7A4830
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 13:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603945.941102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiCFh-0000O5-PW; Mon, 18 Sep 2023 11:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603945.941102; Mon, 18 Sep 2023 11:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiCFh-0000M1-M2; Mon, 18 Sep 2023 11:17:17 +0000
Received: by outflank-mailman (input) for mailman id 603945;
 Mon, 18 Sep 2023 11:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiCFg-0000Iu-6y
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 11:17:16 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe13::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebf0bc80-5614-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 13:17:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9213.eurprd04.prod.outlook.com (2603:10a6:150:28::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 11:17:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 11:17:13 +0000
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
X-Inumbo-ID: ebf0bc80-5614-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H56rma4ZSA4/igbuW4nmJjG+zh+OdqRwGXIozwsLpcEFH6d5PUjXuUc19kxjyp+Jj2tl4uKgXcS6E1u7/8nJSpGwFN8wd4Qee9jdico0ejaInAFp3KJOl5P34DOFsPWTuRzdIhFivMmnaXix2u40Q7EqC+WW8QmOTxfm9b+4WeUZWfx0zX0/TTF6jZ2aAX++2c1W9D0CP5o9zekPVwjsquN/q+xXpmv7IEFIXC/tQ9sLkn3wfriPLaJTGb34DIaUiHJo2AETz0nCkSGmigwJYfHUCqEyL7ATPmDcty/eDb+qLjEWeT7yRtydpnPhLyplJu+9SxLtB8Sv8nHKUS0Y0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpC18uVwtzdSQ/egugNaSS+SFRnkCiOfKCxBJbklJds=;
 b=CfClEurNH/S3z1/mvAuo8BNEZCfgxnJSbQcvx+CwkxWht1u3b7KC4iSmWokC2nuYdN1nVisjQm/jzf8Hn+J+vQZfFbajXpW2IuwNX8INrH+RtN5CWl6xLZLea7ArJ3bVcn5s2b4qbsFmcCkC2S06SPOpFQUgZplC1CGmJdPEEEgVD/V0bJTaVz/a7GYx3CY270F0zqja2fWaSETEXoc+lEzee3atopfJjv5ozFzMd0gWr2MYoCpnB7XfO8Qz6BaHbcfQ7JgFtx/Ai/l19W3TMujUBKWbd4zVA3mktfizkiVgj3+Ln39h0dpR0g2ogpdhxhAJ1tHNPqFlsFWyB9T4VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpC18uVwtzdSQ/egugNaSS+SFRnkCiOfKCxBJbklJds=;
 b=vMEspUu0V07dN66V4+0WjWS0NwrRyzDsa4G2IoiA+6QQYvbOmmYYfwuyngUZbg16JpxxVCuWpJXGKvibru8KhR9PFoP4cyGrWpg6G5Aoo8/wEooHgCkpUwcS3rXNPvLs6485uwby3vR00+w7w+8YiX4h+nqMwl19ecF0OX0Dfko2mv9k47IX7Sg6/cM491zTO/6NyyVPspvFm033QiqcpBfJmctwrrruobcKsNBE3J8Gikdgo20mV2HL2+F02F/Y2PGeHPxZRVTiqKZUC5y8/pBovPI+YmfQsT4Yxx4ErQKoYYft+ucNtC2jXJKX/y5v8dXVIDu7GbMzP2YsH61a3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c4e54b53-1e56-b89e-0be8-bfabf0b459d1@suse.com>
Date: Mon, 18 Sep 2023 13:17:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/7] x86/emul: ASSERT that X86EMUL_DONE doesn't escape to
 callers
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230915203628.837732-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9213:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bdd3940-33cf-48bc-31fd-08dbb838cf06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	89Pv5lUwRT8jg9A1QUlCyeUNO/NdQ3voeIi13fPWiclE0gZz9pAcHhDBHDDRJ2ZVFRLFoZrrBC148MSVFWjwGEvZjfS4swwxBIbJ4iML37j1FWTYpFqXoLjn4aD/MJCBx4g04yeC5LgVfh7Ha3hyUiWGi4/2ScWyRqjevhBMYVQZg7usoe0VKdbuoAFpFc8Y58GlkxpZWdcs7KS5roOO7a2kT/SQLLom3NOiDIysw+uNft64neNofxKYfdz3itvy7UOn9t8eu1P9M0yvROGcDMq7OOdblFHA2yBSibVljo22IbH0HSkY2LVS/xSJEBfv3+WfEp+LF+F5Y+AL0/Ydc0CfYzT8O6RVfrMPEchPZXEPLpMjiQTn00FS0fu5wcK3v/U4WT0Gv8XHxseepOu2sVyDjRgwZwZ4TUoLlSPppjLoLtWG1G3bL5a11vLYWyeuagEYRoEX6xaerWECjKgPqpu1ErwDf6knDW0sV2Efr8QUjXafab87DJEGXeyZhC+F2SnMhgP5uABUD+l/Its8j01syR2Eckf/jPZ+gNN2ZQcMfImMWQGd1n9EtoHZA8i5HnYy2h8/48OkUs67zLDfPo3lxYNAVgkww7I4OsRBVsYUKHoa7AjzdNZqHkHl8BHRSX3pqbUHfkcLkMCKd//YJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(136003)(366004)(376002)(186009)(1800799009)(451199024)(6512007)(26005)(2616005)(6916009)(316002)(41300700001)(6486002)(66476007)(54906003)(66946007)(66556008)(5660300002)(8676002)(4326008)(8936002)(53546011)(6506007)(2906002)(478600001)(86362001)(31696002)(558084003)(38100700002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjEyckk2NTBNWURtVEUxSFgyNUs5b2N4endGVGMvTEkxTDBVZ3BHdFJKTGpO?=
 =?utf-8?B?cGliR3pvcTlPUjdxSEdiNmM4am11eXFGaEZ5aWRwR3pWN0RtbWJzWEJqS0dN?=
 =?utf-8?B?Zi9VOCtSYi8yLzJQLzFZVFVNZktRUnZFR3gyNWdUTis2NjBsN3oycUIwQnhD?=
 =?utf-8?B?eWdTYVNQdDd3RFFYeStZTFBqMDJkSjZsTWdRZEplV3Nhdkk1ZHcwbExOWktL?=
 =?utf-8?B?cmVSQnRPVExPQzhmRDN2ZGQ2NXZsVzU5MVIzVUdZTkoxQ3F1MTlwZS8wblZz?=
 =?utf-8?B?L08rMjZac2dBbWgwcFQ2RVY5bnVRcXRsQjhlZ0cyaUYvVHFiMkpSVGd4UFY1?=
 =?utf-8?B?Q2hNMEJPcTlST3R4bElsb0d6VDlEdzhPNVBjR0ROMUZnbk5NVE93L1c1aG9H?=
 =?utf-8?B?ZVVodXdnT0Eyb1ZOUE1kOGlvb3Jva3BpT0hJbjJlWW13dy9xZ2xHb0dMZjVF?=
 =?utf-8?B?dGMxOVh3VkJaNkhFNWdIMTMrb2V2RzdvSEx4a0J5U09rZENHL0lDVXlGUnBM?=
 =?utf-8?B?TWcvTERndEJqTnlWSitUMTBlTWNxcUxVQlNyWldCeUVydGNPRjlUdlJIcFJD?=
 =?utf-8?B?aWNMcUpTWWFjaldxRE5ONXZ3Unc2YlBUcmJMUE4yTHRQUExSTXYwalJ2YzlM?=
 =?utf-8?B?bEhldTlIYWFoUUhwdk40R3g4NmtkOHdTOHFqWGRjWUlEeVJibjBxaVY1Z2pu?=
 =?utf-8?B?TWcreWNKYm5nSDdkRTUvSzJKV1VEMEFaYSsvVHlZMk1lTlVSQUhUMWZQYXVq?=
 =?utf-8?B?aHpIaG91bkY3VVV3Nk5jYU1oYnlJV0hMU0dnSzl3bitkaEhaejJzK2RieFVE?=
 =?utf-8?B?N1liRUZlTEJQMStxNkY3bHRpVHBsMWlHc2EwYW9sYThMa0o0WCs1aXpiVm9x?=
 =?utf-8?B?em5ob1BSNU9ZTlhqSjdpRUtzVUxFam1hbFBwRTVOMmhicjVveHQwVHZnUGJK?=
 =?utf-8?B?L2RmUnY5R1kzaHk1UXJWSWJJV0JIQ2d1T2d6R1l1VGFzRkZ1NHhGOExtMXpR?=
 =?utf-8?B?dGIyNVMrMTdjd0phbFduNk44TXR1dGxsdlhUWFZGTEtPQjZaelVHcnNlTkRw?=
 =?utf-8?B?WGdMU0wvRnA2T1lmbnVkVHQ4aWxUSzB6TnlZNTBEZDFQQ1ZBSENHZSthVmw3?=
 =?utf-8?B?dXJlNlJNWkZBUDZjT0FGeVB2NUNkTkZ5NXhPOVVDQnhQb3VjVzRtUWJ1WnJM?=
 =?utf-8?B?RHVIc3FweHBJTVNTQ2trdjhBTGZZTVhCWXZhelRxK09LZWp5YzBpZWlFa05I?=
 =?utf-8?B?MmdNME40SmYyR0xRNGtjUXcxOUVoRitxRW01YXNJYU04bGtzZmNQbzJBak53?=
 =?utf-8?B?K3AyZERTUzJIYWVZeHJyWE0zRDVHT2JNK2tqbmZWOGtKM1FHc01yYno2K1NE?=
 =?utf-8?B?MDR3TEJhdHFQNHlaUDg0eS9ZeGlTTEZ3WDE4L2VVL2tnVG1LYVpiYjZkZXhu?=
 =?utf-8?B?VjZCRHNWZWtXOTZtb21yZzlzNW1Na0FITnJxUmsvMndQd3h4eFVsL1YybDZF?=
 =?utf-8?B?bm5SVXRLRHV3VlpuZHRFK2V4SUs0T25lZVdrek9LTGoyNTdkOEo5OXQwNjhR?=
 =?utf-8?B?K3RHYXhISElBa0xTVENYdWtTOTQ1VW9jZUF2UDM3VGlUNXA3cjJIcFVmQnFB?=
 =?utf-8?B?bEVxbnIxYnBrd0hSYmo1STE0bXpiVjRzY0JhSC9ZY3ZMeldVUDNJSWdIQmds?=
 =?utf-8?B?N2U4eGlReHpDTkNkby91bHorMXQ1RkhUZ3ZCRUxwN2dGZEx0Ny9wTXN0ZFE4?=
 =?utf-8?B?dytFcGZFc3JINXhWZUdPQ3M3T0RqYmNOdlU4VW1vSGRLRThka2JFYVRZcnN0?=
 =?utf-8?B?dElmUkRTWitMRWpmclRCajEwMXM1MEVtY2ZseXdJd1c3eWdYQTMzcStILzJj?=
 =?utf-8?B?SVBSdjRxSGpTQmVCNzQ0MUcrWU9XWGU4S254ODJ4dzY2OEdwdHVMV3hDdlF3?=
 =?utf-8?B?MkFkUy90c0JDMEVxcmhhYkJFaXJYRG1rK1c0c3haZW5YcVcrdzdKaEpXekZI?=
 =?utf-8?B?U0hXVHZKVy9JMWFrQzd0a2hnQ1FSRnZ2MEpCUk9KbGRCcHN6WWwyZ0FWWmZB?=
 =?utf-8?B?anFpWHliYngwSDhEQkw1NDVuMURUd01KWWRDVVRLclpLaEV5TEkxb0xqV2xS?=
 =?utf-8?Q?YY6Py8XUHoYvEL5OldB00vU5t?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bdd3940-33cf-48bc-31fd-08dbb838cf06
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 11:17:13.5380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHm1VW0F4yh4LWMUgZ6ZNXcAf2n88i/Cpgw2LIADZudnSm7LDv2fBEqvZ7ffp+LIi2C7n/GUZAtL/LfIHu+xtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9213

On 15.09.2023 22:36, Andrew Cooper wrote:
> This property is far from clear.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



