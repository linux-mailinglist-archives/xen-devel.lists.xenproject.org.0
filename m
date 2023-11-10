Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC6D7E7C3B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:42:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630275.982985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Qps-00055O-Ku; Fri, 10 Nov 2023 12:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630275.982985; Fri, 10 Nov 2023 12:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Qps-000527-Hd; Fri, 10 Nov 2023 12:42:08 +0000
Received: by outflank-mailman (input) for mailman id 630275;
 Fri, 10 Nov 2023 12:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r1Qpq-00051z-T7
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:42:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cf8cde2-7fc6-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:42:04 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8638.eurprd04.prod.outlook.com (2603:10a6:102:21d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21; Fri, 10 Nov
 2023 12:42:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.010; Fri, 10 Nov 2023
 12:42:01 +0000
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
X-Inumbo-ID: 8cf8cde2-7fc6-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iG4eYuge8ccNa6lj4JOJfd9t0ej/6UAYs5HuKEbfLGAIlRkY++l3ou2IzhZ5CZjV2BBKMEa6bZXOv713ITr9yIfrvmzGPyv6+Vp/mSQxQ0PdXveTedQ24Yh7VQT9Vn93hs2lpndRzh25n7q2HrXJPTHiMNAumQRCxsfIxQpUQpMu8AFA9PaGvAOg9ZuZeywQCpNPcPf9d5fuY9zQGf/HkYIBo6aaAg1ryjkzMg1nWidQUQJ6sxh6M9hd6YdRXe97x9bHW6FrxwhfP3Yz62VJ9oFnNsP9QIPB1ZlAQPnLMLsBJ6vVN95WlviMg0QzsNgErYNCNiZDyBNFLxlzWfDCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ht6CGAYDcXqbjiDKoDntInmLwGLqvjlsjR2Iy3UMjeU=;
 b=Np8Nuoj5Csy249aaOGD9iwshZZ/JHDihdTDDBTbz1GuSQ2ejJJpNdV8UnHCLzDvsV1GW10NcXh9nTXkb4vgE87zfuaSfFkzIuPLqH1lCYIQNS6bILXH4RWf0mJ1nhBk8oFf7+1W3xyZsh4Oe1oomJkqBKhqjyoSmazZEoyr4smBWkmnA3Ty/QmmfU8zDl2rJBaivJT1LZO0LUAMT/7yDwfxtV60W5U4MpB4440cZO2D/5MEXmz0Ufza1Oy3op0BhTfqBH3j/vxfOHgAkesuK5CV3W7ZTDtQdzUbuYnrxw89hfktuhwkqPUGvzHr62m0G/jRnPOLIr1dfL6S0q8p1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht6CGAYDcXqbjiDKoDntInmLwGLqvjlsjR2Iy3UMjeU=;
 b=VPjPiT7lQbkW08VRP4FR+AjXjXkPSf6a6RaNpCEVxwH4RT7HPEHGQB/xHhKXEr5IjP2tEKf1Z7fwlBvM2eW271J+nURDn13EkQV5vGRXAZ7yGdHq0deVl0X6qynwFr0GCp7fUFzPrMUCLWKtBqLqkGVSR7aAl5oFXli7tdN3PFkx4F72Gzn49ZCVumTaKCMqNBJ7zeaPOUNwfnRh27f+A2w+ZdQ/oyTtcZ/B1px+RG3X3WYiPUTstz8sNZAHnHqveT0eK13Am1e8nJdDO2IBavmZo2I0He1G1PgcGwelMYgnnb+p+QIfy01zgPWWySQxWQKwXoyKGMBsssZLwsbyQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bd82d5d8-5bff-cbfa-2014-8be866892a8e@suse.com>
Date: Fri, 10 Nov 2023 13:41:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] automation/eclair: add a deviation for MISRA C:2012
 Rule 8.6
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <4de6c01f8af987750e578b3d5733dcd4ca536a9b.1699615143.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4de6c01f8af987750e578b3d5733dcd4ca536a9b.1699615143.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0351.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8638:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aed7aaa-b91c-4d67-4520-08dbe1ea6fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	958rIn290qfDHMTWrENp+shZqgLCxGbpWBcv48L4itEuLKx4+x6+vvT08rL7UvEZFUD0hcoAfUyHrGi2W9Cf1ZRU7o/iSXF7nW2rBZ9MNcl1m7vfXa9eeSmnnd7VZNaPwQt0LQuRka85YJKv9ull42YPXdRH5OpU/chQQwCnxf9vhmrN5u7raQCoeM3m8nNmxqNWzQ3RnYzfJ7TFQrm9LQcbrQCpECTQf0WdawLbDsApQwIW7brIY9NBNhBNuw7EMjZGiidbUyvp4rqeJ3KGc5i4y1HIlrhCAK4yKlWAVuA7NVFumggQ+YIBx8UuuP9Xnl4IsJY+Isl5HWFzv3SUPD33V0FkMu31FH5smSL0CzvjbZlUcWLzlJMj3aWeAMsbd9/c3Lx1ovqfdtlzeR5aGi4ts8RQN7g+bhZV88MGCGc2fVtCu9TxNuomHVkHBpKp2jbe1642HtaD5A5cGzTQXO7adlyNgr3+9uWDjK4P3m7uqHroifgRlITh0Bf8ADsztjUUUG+6oZEZZChwZuccAxDrFIQ5LmQj40KtLryh3iakY5KivorRXFiCzOKoNT5uCp5pR2aNWvtjYMeULXcnmbhCCSM76Aw8eu63UUPfiEK/QxKd86n9E6sQB905bHwaDqAO4Gk0U9irTwqeH9MAWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2906002)(316002)(66476007)(66946007)(6916009)(6506007)(6512007)(66556008)(54906003)(478600001)(53546011)(45080400002)(6486002)(38100700002)(36756003)(86362001)(8936002)(5660300002)(4326008)(8676002)(41300700001)(31686004)(31696002)(2616005)(26005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWgzRm5DMk00WGlZZnJWUmVJdU9VOWVoa21qUmIrdE05eCtNNVpLSjNKUmho?=
 =?utf-8?B?YUw3NkJFRlljS0lPcGlOdkpoSEczQ3Q1TW00NDNDekFGeUE5UEdqSGVJSGYv?=
 =?utf-8?B?MS9hbWdLWFMyZEozRGtXVkFkdHJvNEdMSkVZdm91Y2hVbzdLN3NuQUpBNDBS?=
 =?utf-8?B?bnU2aHZJakpMN2I5c0RXbURjME41U05XdGkwK0JydUJXTGQwQ1ZON1R5TmVK?=
 =?utf-8?B?S0dOQ0JKSmNVT2Y0SEx3S09KNjl0cFh4ZWhiQ2hER2tHYTkzcUh6elpMR0t0?=
 =?utf-8?B?bktyZSt6NWlCRmtsK1JndnZjWk1qUVNxaURYdld3WFNBWVRLVUdJS3hrWElP?=
 =?utf-8?B?YzFQdWJ3RWZ6YVI0MGd0VGlYVE9raTdqZ09CTkxiSXU0MEdVV3FaTnM5Y1lC?=
 =?utf-8?B?SlZacDlSQ3c5SG9SckxRWG95Q05BSVlSQlR4cTJGMmRCZWpBcTYxV2xSRFhi?=
 =?utf-8?B?eGNHSVRVNGdOaXFQMHhTazZ4b2V6cldCcTc5Y2FJRlJwTm05dzhLaHNGYWZ5?=
 =?utf-8?B?WlhXV0thZG5NbkNYc1BUSjZmUXZ6OHBDeFdnZHVTQllvWC9SY2FYUXhjZHdz?=
 =?utf-8?B?RVAxaU5adDU5cDBPdUx5VnFnWUIzaFllMllTaWxJSzM5eUw0ODd3UEpnc2pG?=
 =?utf-8?B?ZmkxdGhvYVNBcWR1dGdZWGpWVFNoRlpiQURJa0RGWFFRS0tOUG5vR2hDU3o3?=
 =?utf-8?B?QnErWnpqVXFOR01YaWN4K3JQTnNWcEp1VzZCZTBGMm92ZkZIOE5SYUlqWWty?=
 =?utf-8?B?anpEbWRQUlZPY01KUTR3YThZWC9mOU14MitlUXhEdlFycDM2UnI4Z0xDb3JG?=
 =?utf-8?B?cUlTeS9TNFBaL0ZlellaSUVOUldrRGs0Sk95cWRtNFZYYWdxcWREY2Y1eExH?=
 =?utf-8?B?MStOQ0xPZTZsY09UMkwyUnNBd0U1V2Q1TUNwQXpxQit1RWZ6SWNobG1VNUFk?=
 =?utf-8?B?U01Td0FzL2RUNGJYeDZrcWdFTk9WNnoybWNlOEN3Z3VaMzlhblNURElBYXZo?=
 =?utf-8?B?eTEwV0tVR1R2QzJoVzY0Z0Y5aFZxYTBiWWoxWFR5UkNlZUlRNlE4R1VUQ084?=
 =?utf-8?B?Q2pFMVlDZzJselRJeHFRTGIvY09FMUtzcFFncTNTOHBkcGtGUzVSK2g2QklO?=
 =?utf-8?B?dXZwVVlxVUM5ek9VamM4eGxlSlFlYmZoQi9TOGM3LzlIZDdLYXBlLzR3YWdr?=
 =?utf-8?B?Y05EUUczMWZmMmlEL0g5dkNJbUc1M0dJUmwycm1zV2xOTEhzMVZjYU1iYUVS?=
 =?utf-8?B?MXBVdmZyL2wyZXA4STdpOEhjNStkMUVUQmhYL2ZWcng4MklCUUVsNDllcnBO?=
 =?utf-8?B?aEttM083VFVuY29WK1ZEa2tFRUhoeTV1eEM0WkRQeG5iM3JsQ1BOa3Ava3lM?=
 =?utf-8?B?Z2FDZGEzcVdGQ21RS0R4YkViWXYrTEI4YXdxQkdUaE40SFFLR2E2S2pCVTM5?=
 =?utf-8?B?MGJ5Wko4K3FGMnhHdzFtMHEvcGV1bC80czNGbmtWQzZpanRrUlEwbk1JWUtL?=
 =?utf-8?B?QlRLZVVmRlJhc3pZWHRsa1FFTGpjdHJydFYxWFJJQzlEQnpaNktOS2cvVTB4?=
 =?utf-8?B?R0N6c2NKck5wNjROV05pZi9kNnQ5UXRXb2FhQ2xQTjZlczZWN1YyOGs1amRJ?=
 =?utf-8?B?b2NzaEpHRkJobE1DT3cwc2JBZ1Z5WHJFTzFrNUw1dElEVlVtaWFWMWRSckpx?=
 =?utf-8?B?MGZlRi9NMnNiY3ZGb2poOTNuNXRKNnZJZG1LTXcvejNUNnowZGRQUk9XbEdZ?=
 =?utf-8?B?Ujc3elBuVjZKOGtXRnNSRzRrSCt4bVZrZVZBdTRTNUU2RmdQa0xsaDNWcElH?=
 =?utf-8?B?MWhFRG81aU10blQxVDZvdkdvT2pzZVlGQmJyWEFUSGg3MDRGZ3hrZERLL01H?=
 =?utf-8?B?VUltSFpOZk9keWp1YjcvUXVBOXYwdWVtTjhTNmxhVjN5QXlPV2dFdXlTLytn?=
 =?utf-8?B?Tkt4MnJyR0pGTzA2VDQrK0JnMTJWbkFrR29aZS9KV1Q2eEhsM21xSWYrczFr?=
 =?utf-8?B?aHNSdjJ3OUR0YlNHWlU5TXJsbUZ2cm40d1FjT0lLOVNIZ0xjeUNQNXVyTThw?=
 =?utf-8?B?dUo4aXo5TXBiajFDYjdpQ3ZPK0lYSUtGQjBpNXdGdGo5b1FhMjNaY2cvTGFG?=
 =?utf-8?Q?qzeWkYTjiXwmj05V55OyjAylh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aed7aaa-b91c-4d67-4520-08dbe1ea6fd4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:42:01.8973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzdSvTfVNaiqgJUst8r0naklsw+WWpQVlSJZfNpqujT/xQd4oxiX2csETHyuC5D/M7Y0F26sREG5GG06SsIx2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8638

On 10.11.2023 12:23, Federico Serafini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -214,6 +214,15 @@ definition is compiled-out or optimized-out by the compiler)"
>  -config=MC3R1.R8.6,reports+={deliberate, "first_area(^.*has no definition$)"}
>  -doc_end
>  
> +-doc_begin="For functions memcpy(), memmove() and memset(), if there are
> +multiple definitions, those belong to different archives and the behavior of
> +linking is well defined by the toolchain: only one of the definitions will be
> +linked in (the first that is encountered searching the archives in the order
> +they appear on the command line)."
> +-config=MC3R1.R8.6,declarations+={deliberate, "name(memcpy||memmove||memset)"}
> +-doc_end

Why would this be limited to mem*()? Anything put into lib.a is going to
be treated like that.

The description also isn't quite accurate: Per-arch mem*() won't be put
in archives, but in .o files. Those are always linked in. Anything not
otherwise resolved may then be resolved by picking objects from
archives (appearing later on the command line, unless specially grouped).

> +
> +

Nit: No double blank lines please.

Jan

