Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D83C6CC100
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515842.799104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9RR-0005Nk-55; Tue, 28 Mar 2023 13:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515842.799104; Tue, 28 Mar 2023 13:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9RR-0005K5-1E; Tue, 28 Mar 2023 13:32:49 +0000
Received: by outflank-mailman (input) for mailman id 515842;
 Tue, 28 Mar 2023 13:32:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph9RO-00051b-U3
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:32:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05d03233-cd6d-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 15:32:45 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM0PR04MB7074.eurprd04.prod.outlook.com (2603:10a6:208:196::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Tue, 28 Mar
 2023 13:32:43 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 13:32:43 +0000
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
X-Inumbo-ID: 05d03233-cd6d-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoGdNevQl0l9nKEQUNppydx9akfVXMpFYM9fsEOYN7A6FUO4S9KNOrW6EzdxltDeK4kJ18C5HAI+2NF0rRzrsERV88v1wCtz0yUgZGsKnAjdxybNJ9MtPfPnLhOAJu6PFl5TDHZjAJSNBS+MhgTEG4t8ihp1w8l5pEyGQf/48ED5fFshDkAlfF6ehq7AxUKNnhKlWQ1cdPw6tBOcDqU5VEROZpn5CRaCZBYX/ACBTQCMGYm3kDLnFPuqlZkQibI+ziAXsKWg6puphhqNI7LC9tjvGPgdqHvXOkuLRJom20kCgeHf64rw52YoJNtA/QPkcBrI9BZTAR0gZ8nrS/CL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuEfew6F7O5FqpL5JfXk/rbchYCXeV0JaKg4P/PJ6vs=;
 b=hIeZMn0LvSh4ftUjf0PPCKzwjNkzEtOyE3r9IVgBMGWtpUwfS8BVjn7i/zDncAqAaYWmqUofZ9yBWsq36gWhK+lYnhTeZlqU88R/IGi3VIfw/0h2/T1wS1kiSLqp8ODl1GJ/1kqec23v8OgisYCvtYxD5t+J2QijJnEBjJfLsR/X8Y/nU7c+L0uuzEuYDhhPbtyTUNIMreSit+BJMEQEJPOrY/PtR83Xq4Q0dfL941jJIPFTeOvig459XQWoRmAIh+ixa2KN3Zqupc5eKvHyAOByOlkDsjJHF/S3JXE3ysEDF2Rr3U4XT/EBpYeyhrbdsF9Ski5k1tkB+Gbpay0jHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuEfew6F7O5FqpL5JfXk/rbchYCXeV0JaKg4P/PJ6vs=;
 b=LoblLIO8Jg+axYjCeImL/5GgdHHP7R1JRzp0QrRlMYAO8g31/W1iUJz1I4fZCAZ/PP8+9zUHg0znqgPmA0hteY4MolYPMXnpmwL4humSJZhrFtkXRNyJ5oJtUREgRMaBG/ISbchQXOAXRqmbexyBqJ0uk+yb5EYb/21C7194zkHWSdo3n5TPSUg0iImAKs9moWq9huQc18q9i5RSCRGyyWSWk5zJdp8UtW45cAK8Qf5wVLQNfFZ/adKf0rOPB1wlM5gq3F+2ueQqig/fa730JX5qUyWInpy0S37J2C7xYSPXLtBYaQE910/qKqECTrgL6SgliQBSyZDmbavBWbenQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <435f5ab4-e0ca-f66d-dc0d-0ed8633ed2e7@suse.com>
Date: Tue, 28 Mar 2023 15:32:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] xen/netback: use same error messages for same
 errors
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20230328131047.2440-1-jgross@suse.com>
 <20230328131233.2534-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230328131233.2534-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM0PR04MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ad4562-b714-4248-27a9-08db2f90e91d
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IUauTuyV2q7+xh30MZeB/5pgoI31ZpHDXfyGpGTQ3bpxZsVx0wRKCDw7j5285EJAkXh9sbUiniVmHBjeDCU0guTt8vMVyrgtoLEGE4qmDfqVzAZ+3ihtd6PuV3pZVPlvdbaGe6zc9lh9Bu8aGkJNfl5qT+KkoekAEKn6uQPcFsRjw7SezHhrAurkmOpRRUZZOslYFELcQZHWKUXqeMi6XfuwizJEJ6M6XqQ2ibwoAFsSNNaHPaqLW3vZrXw/FcDiY+EM0O48wtCUhkv3HR50zDxZUPdv5ewU9xYO2f4Q9Uloj2iPRsbtOz7EC+qK6EYNRYmycgIC9aB1O/5Lv98OaivYQRCfHLqNU81m1M39PoQXpdxMzu2sT0b3J7iVzOvbH2xwvCSk+Ai0kpdmruS+C4vfOmP3/8IhxxNkola+7tNqLMn2w+ZhNwXelG1znjfBS8BUWWWeflIyJZeJEoKYV5lWnq5bWl89jPzf5PmGpM/rxl4+SzbUH8GiP0fciSQI2TLpxCOf0P9FwXL2uQ7qDTqKCVYmBfthM1Rp//niPbHJ91GcvyQCqowszyH6I6DOyRyHTXY/MQLeXpq4OWB5o5SL2SGezsUQSO5oPKTgP9YRCjsGzkzZw80HA75ASPW8brrN7WDB0Al10Q17KeUGHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199021)(2616005)(83380400001)(2906002)(8676002)(66556008)(66946007)(4326008)(66476007)(6512007)(478600001)(6636002)(54906003)(53546011)(316002)(26005)(15650500001)(186003)(37006003)(6506007)(36756003)(86362001)(41300700001)(31696002)(8936002)(6486002)(38100700002)(5660300002)(31686004)(6862004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um1mdi83OGduVGtCL3JQQjVVM0UzRUhqQ3hvK1AwY3dCcXNhdEpYenVXVzAx?=
 =?utf-8?B?amdRNDM1bXZsR3dNeXkwR0YvSk02Sk9tOXBhRDMrTm9yWTJVRFZJWTJRelhW?=
 =?utf-8?B?V0k1dlNpZFI4cWkrUXBpL3B1anJHUmQ4QjNUU1RqQ29JMTlGTTdtN1VhdG5L?=
 =?utf-8?B?YTNYYVIzV2FqejM3MUxvSUsyWlBuUllxUWhJd29YZXpMNXQ3RUN3cTBaSUwy?=
 =?utf-8?B?NkpBKzZKZjBGbGkzTDB5OXpHYzNvaWREVnpUY1pTQ2lyd3lyRjFCR2RKc1g5?=
 =?utf-8?B?K3dqWnBmZTBnQ2RiaUJKQWFoZnA1UUViRmNqNG1CMFZSZTE2dkE0U3YyOFBS?=
 =?utf-8?B?QjdzVHJITkFDMlhrcWR0ZEErQXpMYVhzZkxGdWIxZlIzQzJoS253MEM3SHlk?=
 =?utf-8?B?K1lJUFczd0lCRENRVVVqek4rSGlIY2UvSXIycHVOMGJWQVF3bVpaNG5DdWdv?=
 =?utf-8?B?S3huejE2S1VRL3N6UHAvaEczYnRTOEZqTkRnWGRyQmlMc29MVUMvd29wbWVT?=
 =?utf-8?B?a2RjT3RxeUJFLzFMcjZjcDdZT2FjWnFvODdnTk95cGpNeUFSRWhPWDI4UnlT?=
 =?utf-8?B?alBSSUJ6TnZGOFZsRmVsU1FoelN4OHJKZHZqcFpGY2F4azdLbVhTNGhlMG00?=
 =?utf-8?B?QlhRdklPQjRyR3JibC9iTHA0VXZsRVppSmlPNStJWmYvVWlZbFJlcjNiTHgr?=
 =?utf-8?B?OFE4cENJNlRTOExuWEtCSnhSY3FRQTRsajlTWkFwRm94OHY2Y2wxWDh5SWFG?=
 =?utf-8?B?aWQzOHNmRDI3SXB3UmZvd3p5anhZSC9sdFh0TnluMHFtS3h3cUIxazNmYlQv?=
 =?utf-8?B?SEMwOGo0TDF2a1JYNTBHeG93UmVzWDZmQjlSR1d1dldFUG0wSW5mNE91YnlW?=
 =?utf-8?B?SlZSRUhiMDZvWGtGNXJndkxaUGtGeGE0bFJMRkNnZkJ5OEdiWitsbmdmaFB2?=
 =?utf-8?B?SEpubXFHZEM5WDdQemJsMkZzNklsSTN4TlUyeHNqdWQ1cTR2Mmk2MnZtZVZG?=
 =?utf-8?B?REhQRmFLMllVeU0xMWZDaXk3S2JwdStIb2l1TWxsWXlhOUFhR0t1eVl1OUtW?=
 =?utf-8?B?Wkc0bDRRdjk4VVJXeEI2N3NVUmh4YjJjU2FnSVVXVDV3cDFzdjMwWFRMQlM2?=
 =?utf-8?B?MlVuUUs2TjlHaC91MkxBcUI4VWlRRm0xcUZabWVML0NhTGpKU0hOOFdNZUdX?=
 =?utf-8?B?bWtpck9OZGxjMUY3K1BtazNCMnlxaVpibzBSWHBIRDNHeWNrQmJqV3djSDNW?=
 =?utf-8?B?aVJZbDhqRlhCUDBacmxRK2poSUJkamtKRnI4MzZsMStpWXVtMUFmS0JCeFJu?=
 =?utf-8?B?U0liK1I4TzlaeGpvOURqRWptd1hrSVFia1pWYUUrWVQ2bjlBdE9vQmJzMTM1?=
 =?utf-8?B?a05yY0Qzd0RENlpleGdTQ0N3b0tOMXpNMmxlTE9pYTJIclI5czVIMW5kYnJx?=
 =?utf-8?B?MEUram1YNG82dmo4Y0FuUGtFQnYzY1VPekFBOW5aRzc0Q2dzc0ZGdEpuL1ZV?=
 =?utf-8?B?Q3BnSzYvRXJ1UjBDSlFJeU95RTlvWkFyRjAybVR2SUE1dnIwd1dlQ0lEaUNF?=
 =?utf-8?B?engrVU5WSnIxSjJJNFRUVFA3dXZBTWpVNWVHZjgzS2ZQYmN6TnJGcWtMa2Qx?=
 =?utf-8?B?b0NRajl1NjhIa0FTTkpGMDNoRFc1OGJSODFiMHk4UnVWMlBKVEVEcUw5M0dx?=
 =?utf-8?B?b0J4Q1VmMnoyZDExZnB0QUxSQ0tKYXBOV3J3emJUanlSczFaWThGd0I0dzAx?=
 =?utf-8?B?MEczeE4zT3FCOE1taDVDUmhxMDNPVE5Ha3dsamQvTDFwYW9VdFBKSnVVTjRL?=
 =?utf-8?B?dko5a1BCaC9abWZzU0ZGR0c0Z2VERXhmQlVQYVR5Ym5NR3UrcmFLNkpYTFkr?=
 =?utf-8?B?enlxYWgxVmlzb3F4MmVkelpjU3lUWDhvM090NVRkcHAySityMWY0N3ZnOUt6?=
 =?utf-8?B?cm9NeXJORjFFL3dDR0VyM1NWMmRub0tZMURpZmxEaTdoQVQ3YWNNMlNsVFkw?=
 =?utf-8?B?WHFEbzg4ODZtaWJXc3lrL2VkdDZwS2tCbG5jOERsR0JBOXBBOHV3U2VDV0l6?=
 =?utf-8?B?czRjdkU5dG80OGl2YS8xR0VzTU43a0NETG1jK2R3Vk1HU1hIM0VBNnFFMFlK?=
 =?utf-8?Q?HuIwrKzSKIGBTcYEVT1Evex+i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ad4562-b714-4248-27a9-08db2f90e91d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 13:32:43.7083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDhUOBZpEjcMuS9QNWxgIscSsywGOvD69wdu9tW2dfVOzmQukQ+MKzCDSro0wefJqZgmULa0xdlRbHbxIDEcvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7074

On 28.03.2023 15:12, Juergen Gross wrote:
> Issue the same error message in case an illegal page boundary crossing
> has been detected in both cases where this is tested.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> ---
>  drivers/net/xen-netback/netback.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
> index 9ca4b69d3b39..5dfdec44354a 100644
> --- a/drivers/net/xen-netback/netback.c
> +++ b/drivers/net/xen-netback/netback.c
> @@ -996,10 +996,8 @@ static void xenvif_tx_build_gops(struct xenvif_queue *queue,
>  
>  		/* No crossing a page as the payload mustn't fragment. */
>  		if (unlikely((txreq.offset + txreq.size) > XEN_PAGE_SIZE)) {
> -			netdev_err(queue->vif->dev,
> -				   "txreq.offset: %u, size: %u, end: %lu\n",
> -				   txreq.offset, txreq.size,
> -				   (unsigned long)(txreq.offset&~XEN_PAGE_MASK) + txreq.size);
> +			netdev_err(queue->vif->dev, "Cross page boundary, txp->offset: %u, size: %u\n",
> +				   txreq.offset, txreq.size);
>  			xenvif_fatal_tx_err(queue->vif);
>  			break;
>  		}

To be honest I'm of the opinion that this goes slightly too far:
Making the two messages more similar is certainly helpful. But in
case of problems I think it wouldn't hurt if they're still
distinguishable - when the one here triggers it may e.g also mean
that the calculation of the residual size is causing an issue. So
maybe stick to txreq.offset in the message text, with everything
else left as you have it?

Jan

