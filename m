Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6229668068E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 08:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486589.753969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMOi9-000254-Ps; Mon, 30 Jan 2023 07:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486589.753969; Mon, 30 Jan 2023 07:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMOi9-00022R-Mt; Mon, 30 Jan 2023 07:36:17 +0000
Received: by outflank-mailman (input) for mailman id 486589;
 Mon, 30 Jan 2023 07:36:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMOi8-00022L-54
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 07:36:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6b7c394-a070-11ed-9ec0-891035b88211;
 Mon, 30 Jan 2023 08:36:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8875.eurprd04.prod.outlook.com (2603:10a6:20b:40a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 07:36:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 07:36:13 +0000
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
X-Inumbo-ID: c6b7c394-a070-11ed-9ec0-891035b88211
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aece+OUvSSu+rDp5tKwRVLpNYgEpJGJFUjCoG2RnNhcx9VeJFIyInihZR5i/OvgJ7jNLGSSzgEcpDVzXWpRfLt1SSB7LvRqR2HIQ16+de+Mb4D0nyyy+ELnOjbMaat1xKJcSykMwjO5xwxFpV1aLD0cJ3SaLjmWGZq9DziH28zsDrFL9Qp0pM2QgQTNeKtPdKJ2JuFdY2R+R2RmGPMaAWJ6gpq8NfGk5Z0y5xNATWGVy1wO/mRAARebvi7p98aVAolZMDHiHjFY80lYMk4VoiDQcdVD9F8E1a4R9ZTbjMyyZ0+s2wWMMNqGzX/yuU9o539dWTbQ6gWGsdSiZOu54Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9IGcYJqbsrEHuiTf2l9n2i6a7iZ9s/4bY309Nh2kkI=;
 b=f3B2iFlHIBj8uB97uk+YDSYjokMLut+qHvgOWeivZUDSJ4+B6I/x9iYaEXAOEHD6Q/v8uIEhO8wmZ/pz4H1KJ4Rli2rKxiiq2SobQJVdSV47WYC/bdOp7Hn/rK7F0qTscmEzKNke7i4JV3Mikr6PHT1xQ2fMo5R7wbrq6JF3dNmJXM0R1Ow3rFl2ApDughGwiATgfzC8eMAyvT1YP9rAd7H6KZ06JE7bK2h1kMN/cpsPqs0U5t6u/QoXLqOn96Zr/IFkFZv1bkQOOxM3E4tUbVdr0T3Fwi8d7Q+PdecRbZPD/H1h2iVrdN13dtW+6sgBc6UGdmVjMBr/zCTdYC715w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9IGcYJqbsrEHuiTf2l9n2i6a7iZ9s/4bY309Nh2kkI=;
 b=gOwAhUadFrjjwEuwOm6C55SXJz1VImMJY0IyfsoP7o8DNGXUf+2QQhQMIrxuhuwQypfM2od9UAU1jeI9rC5aPGmNqn9TUlzOckemST6jODkgG9V9xcY4NJxQ4lEe9zEJQbmbQKkEwC7pLvJKHXPnH025nHClhNQLwuKzaW6nsjdj5NhQADWZd9sbqnmHIw1p0Tgo/gR1YRLrCcXCtqBtsOjT207kf4VEKkfEOL94AkWeBek3g8R+6ysDgnHgKjrEyU5Qu4aIgj1vGEgn1c5DGgbI3g/XxK1aOYfTjN/rBy67Agvmhe3FkbhsrQZipAa0d9An+IexnXqadlGxs2fIWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03cfb3a9-66f7-c376-c815-feba34afaf51@suse.com>
Date: Mon, 30 Jan 2023 08:36:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/public: move xenstore related doc into 9pfs.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230130063725.22846-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230130063725.22846-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8875:EE_
X-MS-Office365-Filtering-Correlation-Id: ac8a3b23-65d1-40d9-1730-08db0294a9e3
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	clTaM/FI3Umr8p4mZjZhzssztPoKpByBkT6n33/vRt2tXw3XhbaP9bUCmE64KGo2DNDLKe8AlCDtjcotHYISMRD0HASnZGIIuQEPyxAPKZHPMX/xIxIO9Vbu50wMjyaGZoU3nu/d1w6xp99Ept6+zz229LhlczCKA/2ss7DzrNU+WaQYujDNnXgxTyBJcEQ9IMs2K6q13tA81R5o+4xZnZ5mCIfTANcrHPVc7ZQQ2HsP2fWBjIfHB5u+zmDqzskvNpcUdUCQxeMtdyTi1JVxlGNLGkc9ZRzsDbK4OcwbV3QM+5nXAsHmr4szIoUdNE2YNlIVyKGemaRZtEnuE8JnYwtFVLURxPbQcRlFAECV0hsVAVb5+CJc1aGFkdFy7278TPukcsuQ3YeC3CGXrCCPdnbIVjWvcX6yxp9WR7XNHzj7+gosrrlkxg6EX7enGnvGZ2/sTmowniYR+bDLs8DWxGfUGAAh2+A6ke+qfymaM7pg3U2v/sKu6SsoNsySvKaOt2khSk9EO9BdyyvFhvbrH2/RYzVxrH6wV8LMBRKCH1VK8lwsqTwZARpAQwY+X4eqaED1XzucWm0Cf1uHDmVg3m5gFqG4wum1bBv8LcBmiktGNvyfYbzJUfX+aKAGqGZ5PisjjdS3VzpDlC/lmk+urOAK0oT/0VmJ2JOtQ2WomUorJVlFZVY8iczqTjzcHYd9lbIU2QXO8P3TulQK99juN89XXXwC2QMbH7MQDYa6bik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199018)(38100700002)(86362001)(31696002)(36756003)(41300700001)(2906002)(6636002)(54906003)(6486002)(478600001)(8936002)(5660300002)(66556008)(66946007)(4326008)(316002)(66476007)(8676002)(37006003)(83380400001)(6512007)(186003)(26005)(6506007)(53546011)(2616005)(6862004)(66899018)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3ljUDhJWWxXall3QWJEL3VaY2VWaHYyY3B3ZkNXWWhRdGROZnRVOU9EeTd5?=
 =?utf-8?B?SHk4NW9pRGxXcHhoSlFpUjhJaC8vVTBjamRuK1Vmc0dpWDZlY2Y5N3FMT2Jj?=
 =?utf-8?B?RXlTRmV3WXkxcW9jYi9JaEhEdFExOGI0SnFoK0ZQVlFoTzZoL3JHNFliTzN0?=
 =?utf-8?B?SFZNdGIwM0llcFFycCtxR01lcHVFMXI3cGU1UllKWktjYjU0WXUrTTlLYTFH?=
 =?utf-8?B?d1V5TFJsY2RZdTFqMUlZWG5RSnVHa0dhSG4ybHcvSlI2UDJkd0FBeGFiZ1JL?=
 =?utf-8?B?bjhjZXVUNGdqcEk3Zk9YekFITG0yL0wwbGxGd001T2s2SHg4V2tEbnljZ21T?=
 =?utf-8?B?bStxeEp0bDFUSmNONWxvdEpOYTRkVmpBQkJtdW9taVFWYjVzbHVjRXpCKzhR?=
 =?utf-8?B?T0Z6alc1VGtzNVhjeDVXVFJrS1RLdjlNbmk2cEpEQUNZZEpLOG1qNnRiM04x?=
 =?utf-8?B?ZWNuUWxwekxzV1I5a1BKeTh6QnNXTG1TYlVGZGg5aEpDdjVhYnpWelg4VXpC?=
 =?utf-8?B?ak5kenRJQjVoYWtYY21HcTlpQVkrRlhWYjBjNUtLZkZhT04xL2dKVXVZQ1ZW?=
 =?utf-8?B?YVhiYTNuYTBzcjQ0VjBNNHRITU9QclJCZ2tLMlk3bWRqNjF3eFFnb2M4YU1R?=
 =?utf-8?B?dC9kbjVxY3hzTlc3c21VeC9IT25yN3hPdUJ4L0lqT0R2Z28yakx0QlJ3TUFi?=
 =?utf-8?B?U0Fsb25sd2FVU1ZqbmJ2d2dnUVFJRFRhNGc4N2o0dDVVb0h6WHp3cjBWdDM1?=
 =?utf-8?B?SitjYzNVa2tudUdvSVJ1WWJPNUdvTE1mckRjR1pYV1BVdVBzWmVmRTJYS0F4?=
 =?utf-8?B?b0hHRTMxNUQreFNudWlLc293N1l4WUdQSEJmYkFmV2hUNVRCM0hGYUZUS3NE?=
 =?utf-8?B?NE5mOFpwa1pQcmVlQndIZGprVEZVSktMejVucFo5R2JoUTI3QnZsVHNQLzBB?=
 =?utf-8?B?Y2F6ZWgvR2RNWkl3YkJuR1V1enkwU2R2YzREczlLa3FKVkpHbm53ZWwrQWdt?=
 =?utf-8?B?K1k2bC9xOEV2bU5TQnQ3U2hNcmZPUTAwK0p1bVpYemNZbXRnNDBiTjQrQ05p?=
 =?utf-8?B?ZXNSRFBVQVlCOHNVNEpZQkc0UHlWUHdXMXBXcVVNUmtqdE5td3NWbnVudkho?=
 =?utf-8?B?ME1MNVEzMGlXYkk2UmtMWDV4NEdHVFI3cXpRV3VuU3NQdDIvYU5hVGNtQzZD?=
 =?utf-8?B?RGl6NTg5YTJ0Z1pzektUZnZVcmc0RklXZE5sZXlJeUQvb2h5b1llSkJlU09p?=
 =?utf-8?B?eUNQKzh5elJPUFBhd2h2SkhwbE56b3dSdHZ2OXhPNXRaV1VEaGJDNElEeVdM?=
 =?utf-8?B?aEVHaUVSeTB1dlRsZWJqZGExUUlraHp0aThMRmthcE4vYkhwTXYwMHhjeEFG?=
 =?utf-8?B?QTZReURSSHJjdGFlcVdXSDlRdW9WWDl1Yy96VHg4LzJ2TkJxaWZScEFpdGpm?=
 =?utf-8?B?RHhkdm43TmZMb2taZEcyTFNpZGdLY1VSbjBNam9ObWIvUm9IaE1wTnNCYXFx?=
 =?utf-8?B?UFU0d2txSGxnc081aUY5QktjUkFibEw0d0FGcFRLTUxFVFpITHlqWjd4SDdk?=
 =?utf-8?B?dGpwSlZBQnI4VU9zNmd3RHdKTGQ0UTNaZ1gzSmV0L3hYOWZPZktIMkVwdi9N?=
 =?utf-8?B?cU5CT0ZWaWEzT3l2cEN6VVJkU05nZXl5RTZSSjFRTHE4UFZHOUE0RXhLZGYv?=
 =?utf-8?B?QWtleS9KYm9KMkdVTGVCZnQ0b01CUldjOTRUTmZJN2Z4ZFZ6MGJMNXNaQXJh?=
 =?utf-8?B?d3lqRDNaUVVacXVXNWtvWUZBbldUM1dkYWlrb1hTVVFMVVFmdURtWlZIcS9N?=
 =?utf-8?B?WDgrMXRWNk0xTUoveStuWkZBMkJyL3NQcm9xTDduL0RrMnZlR1k1VEowckZU?=
 =?utf-8?B?ekhZSVFlTXhiZ01McU1yWHpPZE5GVUlsSDJMSlZQeXZKZHNieXcvQ0FVVUcz?=
 =?utf-8?B?Z3U1QVFqZURoV01ELzJydnBWMnRaZXRWcjNFQlgxV2p6dXZ1NEZJbFFnbnJB?=
 =?utf-8?B?aFpQZkdzU0c3SkQ4SWtKTjVhREI5c2NUTTFSdDZ1VCtKRFBTdzM3VmFGL2NS?=
 =?utf-8?B?RjVINkFnWmR2cDMzcmc3OU5xeGNJY2V1aVhXdmpYT0JSdVViSlNjVUxhNEVY?=
 =?utf-8?Q?9h3xjswQJc5kc/MqGFbw3lr9S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8a3b23-65d1-40d9-1730-08db0294a9e3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 07:36:13.3110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdeAQmxFgSzSck+vvub9keYAEQhwtabXFXw2ojpmnx9Dh0pZ0A66gMOxigxcrRoGtAdlKKSFGDsrkuhPcTgLxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8875

On 30.01.2023 07:37, Juergen Gross wrote:
> The Xenstore related documentation is currently to be found in
> docs/misc/9pfs.pandoc, instead of the related header file
> xen/include/public/io/9pfs.h like for most other paravirtualized
> device protocols.
> 
> There is a comment in the header pointing at the document, but the
> given file name is wrong. Additionally such headers are meant to be
> copied into consuming projects (Linux kernel, qemu, etc.), so pointing
> at a doc file in the Xen git repository isn't really helpful for the
> consumers of the header.
> 
> This situation is far from ideal, which is already being proved by the
> fact that neither qemu nor the Linux kernel are implementing the
> device attach/detach protocol correctly. Additionally the documented
> Xenstore entries are not matching the reality, as the "tag" Xenstore
> entry is on the frontend side, not on the backend one.
> 
> Change that by moving the Xenstore related 9pfs documentation from
> docs/misc/9pfs.pandoc into xen/include/public/io/9pfs.h while fixing
> the wrong Xenstore entry detail.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  docs/misc/9pfs.pandoc        | 151 --------------------------------
>  xen/include/public/io/9pfs.h | 165 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 164 insertions(+), 152 deletions(-)
> 
> diff --git a/docs/misc/9pfs.pandoc b/docs/misc/9pfs.pandoc
> index b034fb5fa6..00f6817a01 100644
> --- a/docs/misc/9pfs.pandoc
> +++ b/docs/misc/9pfs.pandoc
> @@ -59,157 +59,6 @@ This document does not cover the 9pfs client/server design or
>  implementation, only the transport for it.
>  
>  
> -## Xenstore

Maybe leave a reference here now pointing at the public header?

Jan

