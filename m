Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2AF7E299E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 17:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628206.979408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r02Md-0003jV-4D; Mon, 06 Nov 2023 16:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628206.979408; Mon, 06 Nov 2023 16:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r02Md-0003hn-0p; Mon, 06 Nov 2023 16:22:11 +0000
Received: by outflank-mailman (input) for mailman id 628206;
 Mon, 06 Nov 2023 16:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fhP7=GT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r02Ma-0003hh-S4
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 16:22:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a10a6f0f-7cc0-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 17:22:07 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7206.eurprd04.prod.outlook.com (2603:10a6:10:1a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.16; Mon, 6 Nov
 2023 16:22:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.016; Mon, 6 Nov 2023
 16:22:04 +0000
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
X-Inumbo-ID: a10a6f0f-7cc0-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXEedkAaEM6Rulcbs4IP3UGTbS1Q4Wdf82lLwhZLi+puVBneNLEt0fHSy9ifm7oGrjCesT8nS/662uHYKriu8/5EysSmzekG+LmT82ZKQtvi+jPM3Tv0H8AtsJfkl99RrGz6VcTFj0FVC8vWLMZ5L3zWKod+awzvRaknrfzBX3rbRAI7B1TfmDlbm2EEn0usQ4qqYMAMejqEWJXhPSqEDY7Y4OxObHklA2BYSVyDQo4MPMtsUkOj/ivjY3VgcT1hS4wdxYQmvf60JNhIZ8pQUejNHnBmzRXDBvr860btxL99MC9Kwk8SRe9aJY5JH8MotqOu0/e8HxIEmC/Fs8CNZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rAObDEDL1ynZezy8jMvZAdzISo3aJpqWQbI79H4Voo=;
 b=DSkVb27zfq6oEq42WSS/brqJCEb99P+fMYFG4SeGE73r2nHOyCzF4ssKc7irj9e3KXHlBaw0712xiv3ZE2scdrnZD3GTkCr10PzLxbWdKccQ2NMZWk8PPAcDft4Xnf84auzS/aARMVLKNe1lnulNyxjY4CInpvm8+OSMN075Rl7l14t6w2lUj9hPiAKfCrWIQhhdaYLwCQaHa3FuqS5ef49u2t044GqgjB+j9tCZiGh7wD+KSFOJYKoHl5ztgvdjTZaxBzMb6tpRKPnWkWEl9KjHhlO8QYxdNuT0ib2u0mBlPPGH+mzXCUEbFipkOuduzggdup2JK98MWi/S4SNbbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rAObDEDL1ynZezy8jMvZAdzISo3aJpqWQbI79H4Voo=;
 b=GPIXSKJ+B80T0CAqShtNQiPQcwIooalB/z07uLHw979a9WkrUwMOe3d4IgIH5r7DKDnHf+iNP1qWC2zd1DVr08KhOlDEeJj8kdiB+2ioPZ/FOCqnO73yhTqS+81ZN2Hys9PF5+H/t7LtCisuvcGA2HgCxDoAiEnCG1fL1jdbQHMZeLpq0CjasRLPjU5OQdlXMxfVxf4NZhxm/Y0ZUKZDKwkF5GTBNwk7uy8mb34sP7j0ilsWiYYMP982Woa5UXKqe5MPB2SWSAb5LSmubsG3b9UvpuUxMoeyKAlP/n8UKXfzwnVV3hR27yCm0JL1IZ0nTjY32A56cQ/zaVhJ1y/5pA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <311c7b8b-f3b8-ecc0-3a98-62b9dc43ed98@suse.com>
Date: Mon, 6 Nov 2023 17:22:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] x86/x2apic: introduce a mixed physical/cluster mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231106142739.19650-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231106142739.19650-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7206:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af1893a-4e6c-46b5-11b9-08dbdee483a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Oy+74X5FLtEEoVXGwgIesnMqhfWICRHTxGhAd6LCEY336UwIzGk6xaoFk0g7XtVl7I0L+vyq1qroZ40TxIqqxb8naFKK3wg9SK5jP6R4xj7D3iUPxMVtKrsrEhEiH1j5bWP4SnmRsPMN0WD390XK1uHiuyGplpPky0JJIyFDfyipqFgwIUFEbVgWLvv5VzUcZ8h81S4h4lIspMOFN29hBSC8MV/cUpbCrYTfwQnXW4c9ZR0etN9Il8OZzcSUh/KF5yKsmYY3lP3ehLqWvUeAU8WxB/lhvhcZUV0ruL9H3GAP+rLkVSTLoaUx1wO1SAXW4eZx2nuhrGs7hlCVR9FL6x84TuYGHlnuIti1cTov2JGjgoBwAqqitrz+q7s1kLx5IwUFvG+Jor6UeMFBxzZw0QyhHZQhKShhDyGQux1mkj4ydmYFAG4HNW9pTz/lzJxoVGb1w0Teuod3b9ySnJR64xbEwYZAyjMu8fY0J6iHvQqUdHvy7zDXLCPaFatuOpEb9SH+y/RLUg5Qh7u8bvF0bUU3lgGqs79Nv5IHZ31R4T3EM/DMxl04Kb0qkMvAhioyi31W53HI/+mTmXfEHbw+3jPXrGURw0Fc/vov3JbRkY7xIHUXtp/0rzfHAK/7Rp1IUQ5Qz0p0LEbk6AFy5iwawdlwFo0ttT9g4Eo+0l15Y9/hBwuPDQ9zV5sSnBlIPE0M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(230922051799003)(230173577357003)(230273577357003)(1800799009)(451199024)(64100799003)(186009)(2906002)(5660300002)(31696002)(86362001)(66946007)(316002)(6916009)(66556008)(66476007)(54906003)(8936002)(8676002)(4326008)(36756003)(41300700001)(26005)(2616005)(83380400001)(6512007)(53546011)(6506007)(38100700002)(31686004)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTBPYytTQXA1RjVYTUlObGFrYkFBdm1XOUFyaVdkdjIwMlBJWEVTVUJPeWlG?=
 =?utf-8?B?Z0xkd1hQSDFQRVJ4L1VpTFNaNWZSSTVERjhTcUk3NEtQd2J4Z1NNckV5VHNY?=
 =?utf-8?B?bmFMYjFMdEkyRFEyQXd6YWxwVnYwV2FtMlZITTVDamIyTVBaVkxZZTJieFFE?=
 =?utf-8?B?WHU5aWtBbFNPSU5MZk1HYit2WktyUGZKb3ZsVlZtNllrcWs3STBTMkpFbkx2?=
 =?utf-8?B?bTMzTVljcXFwTS8vVDV2YVFFSFM2N25hWU9pNjY3VUhHZ0JQZWcwVS96U2NB?=
 =?utf-8?B?UjJPbXJJVm8zekE0RXMzMndPaHBNWXovb3pYS1BKR2RNRnZoUVoxSUZBSW05?=
 =?utf-8?B?cW01dDQ2ZTZxdFJodTNqUUVqMkhBY1Q1UzhiUVFMUFNHVmE5YnVwTHYzUU1R?=
 =?utf-8?B?WTViN1MyOWxiRUpUYXZHbnJ6eDFnM3hza3JFMXl5RGYwdlhabXlKbitpMFBL?=
 =?utf-8?B?SWo4NUZReStXMlhwUVNRZDNESm4wOUljTjJJY3RDNjJBTUF1NTRHc2JGN0sz?=
 =?utf-8?B?QXNEVGpFRnN5dUtQYTEzS0x2ME0yb3MxUzN1dzFmUTEralpLbDdsUzJYc1Bw?=
 =?utf-8?B?Ylo1a1ROSGFQbjE5azljU0VJSTJqRUJOUXZ5akdnVWIzMnBoZklCV1o0YXhw?=
 =?utf-8?B?SEhZRDhUMUlVZzNtMHlqRDB3YnlJOVhUSjZvQnF0ak9BNXRCSzFETFQyWVcz?=
 =?utf-8?B?WGNERTdoU2gzdDFpc2drbnovZ0RKMXMvUVkwOVI5TkQ2OC8rZ2p1UmVLb2M1?=
 =?utf-8?B?SE9YNnlkMi9QMUlmR3U0YzluaWNBWjF4TFVOUysyZkdJZ2ZLOGxZanpDMVVS?=
 =?utf-8?B?SjZTSG9pOS9KdnJTaVZteGhSd3RtbFEyS1k1TDRBZlU4c1lPNGZlZDVXOGQ4?=
 =?utf-8?B?VUU5NG1zNmV4NUZuUkN2WW1YdnN3c0VNM0VxRTNDbzhzUjl0d3Z2QnR0OGZ2?=
 =?utf-8?B?WmJrcTlpaG5LY3JXY0Zpc3ZUWjlhMWhvVkVSRlNaT2hkcUt2bzRRVWphWEFn?=
 =?utf-8?B?OTBLOGtHV3p5czN6ZkFSOXlaQVo2UzhUTGRIR0ZmTS9JMmxRYWk0MlZqcWVo?=
 =?utf-8?B?YnczOVk3VHFSTVU5dEtmNXpwQ1VMZkgzOVdtRUlDY1VQTTY2d3g1NGp5NzhP?=
 =?utf-8?B?ZG00UjF0c2lvRG4wSUdyOFJhQStLejBKeTlHTXZKdUxKVDcwY0xKWm5CdUE5?=
 =?utf-8?B?cVVxWTR4VVZ3Y3FuMkJYelFqT2pIcmhGYUR3ZFkzNWI4WjVsVzhKYVdPUCtN?=
 =?utf-8?B?dm5iVW5lN2ozSXU3UzExKy9CbWxBTHBLN1cwSWdVOVVMUTcreHFNU0J0SitX?=
 =?utf-8?B?VzVDM3pieVVqVEtoS1R3dEkyeE83WjRpeVBLMmFSVTJpOWU5S2RDVlJKeVRZ?=
 =?utf-8?B?V2dkVEp6a2xYNm5hVitYcGQ2T2hoWXNoTFFvWVBzMXRuQkNqaG5vd3hBdmZx?=
 =?utf-8?B?c2lqL2lYbXdqTDJVUEZjdEdCZWZKalNWbDNKNHBXd0J6MFFIVGdrS3h0TGl5?=
 =?utf-8?B?QStvTjMzaEtYUkFQVzBvYTNrayt1ekNWT282bndmczdXMnAzd0JrMmg3bFJv?=
 =?utf-8?B?d0VRWm83L1JBWXlKeGdoRzhoMlVSOWwrS2RTM0p3dVBzVDJOTTRmSTNzVXFh?=
 =?utf-8?B?S2F5M0p1ekZjOXVhMmZGblpTeklEUVR2eDdJYTFOY2hFWVo5UU11RnJtYmlD?=
 =?utf-8?B?TGdab25YbGNicnZWU0JrRWZ3Z3pWRTEzQmE3STJ6UXlMaGtDUGRYbmd5d3Vq?=
 =?utf-8?B?S0xxOGZoN1Y3WVI0MWRxbEU2bXJSUll1UE8xNHV6YVZ0NTFIMVA2UHJ1VEdU?=
 =?utf-8?B?bGVDYXNrQit2Um9oanoyVW9sNmhibzdSTEt4YWU0cFFJNmpJUzBDR3B2UGxk?=
 =?utf-8?B?dFpISmg5VFQ0MXNpdGhKT0h1L2VyV0pibEpyRDRHWlZmUGpxWDJkbTVmNldL?=
 =?utf-8?B?YUZtWjN5V2RNQS8rc0prcjNMS2s2ckRKNDF4dmozNFpwS1N3c0tiWDlBanhY?=
 =?utf-8?B?RmlIMHhKR25qVDV2QVYvSUVPN0hlM3VvRUtpWENLcW85NXh4OTd4RkVBS1U2?=
 =?utf-8?B?azVZcVZHOVRtM1JDRG8vMDVXQ244VGlUTDhYV21oeW9lR3dnWmZKOXdzbVlx?=
 =?utf-8?Q?7hgBQreeF1nNkIK3L7ktftGWK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af1893a-4e6c-46b5-11b9-08dbdee483a6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 16:22:04.6755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RVdN/lAGbR8MEqHyhbnAt5s6Z3KKEliJGIOQZuAnDTeS4PSd0WJhCLE0E1cGUxJ7DYX8ppdMrU4mhm6Sg1TRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7206

On 06.11.2023 15:27, Roger Pau Monne wrote:
> The current implementation of x2APIC requires to either use Cluster Logical or
> Physical mode for all interrupts.  However the selection of Physical vs Logical
> is not done at APIC setup, an APIC can be addressed both in Physical or Logical
> destination modes concurrently.
> 
> Introduce a new x2APIC mode called Mixed, which uses Logical Cluster mode for
> IPIs, and Physical mode for external interrupts, thus attempting to use the
> best method for each interrupt type.
> 
> Using Physical mode for external interrupts allows more vectors to be used, and
> interrupt balancing to be more accurate.
> 
> Using Logical Cluster mode for IPIs allows fewer accesses to the ICR register
> when sending those, as multiple CPUs can be targeted with a single ICR register
> write.
> 
> A simple test calling flush_tlb_all() 10000 times on a tight loop on AMD EPYC
> 9754 with 512 CPUs gives the following figures in nano seconds:
> 
> x mixed
> + phys
> * cluster
>     N           Min           Max        Median           Avg        Stddev
> x  25 3.5131328e+08 3.5716441e+08 3.5410987e+08 3.5432659e+08     1566737.4
> +  12  1.231082e+09  1.238824e+09 1.2370528e+09 1.2357981e+09     2853892.9
> Difference at 95.0% confidence
> 	8.81472e+08 +/- 1.46849e+06
> 	248.774% +/- 0.96566%
> 	(Student's t, pooled s = 2.05985e+06)
> *  11 3.5099276e+08 3.5561459e+08 3.5461234e+08 3.5415668e+08     1415071.9
> No difference proven at 95.0% confidence
> 
> So Mixed has no difference when compared to Cluster mode, and Physical mode is
> 248% slower when compared to either Mixed or Cluster modes with a 95%
> confidence.
> 
> Note that Xen uses Cluster mode by default, and hence is already using the
> fastest way for IPI delivery at the cost of reducing the amount of vectors
> available system-wide.
> 
> Make the newly introduced mode the default one.
> 
> Note the printing of the APIC addressing mode done in connect_bsp_APIC() has
> been removed, as with the newly introduced mixed mode this would require more
> fine grained printing, or else would be incorrect.  The addressing mode can
> already be derived from the APIC driver in use, which is printed by different
> helpers.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



