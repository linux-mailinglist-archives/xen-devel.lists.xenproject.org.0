Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B92B517166
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 16:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318922.538920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlWqn-00085Y-19; Mon, 02 May 2022 14:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318922.538920; Mon, 02 May 2022 14:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlWqm-00082s-Tx; Mon, 02 May 2022 14:16:32 +0000
Received: by outflank-mailman (input) for mailman id 318922;
 Mon, 02 May 2022 14:16:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nlWqm-00082m-0r
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 14:16:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76633d55-ca22-11ec-a405-831a346695d4;
 Mon, 02 May 2022 16:16:30 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2168.outbound.protection.outlook.com [104.47.51.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-diCR31cjOF6-I_82YRRZ4A-1; Mon, 02 May 2022 16:16:29 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB6279.eurprd04.prod.outlook.com (2603:10a6:20b:b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Mon, 2 May
 2022 14:16:28 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 14:16:27 +0000
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
X-Inumbo-ID: 76633d55-ca22-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651500990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UGKVNXpk6Yv1J6OL742nVyzRVlUL2zXcUGt7Gxrlk2U=;
	b=dahptf5G7x6fUr6dLT2N2+NXDv6iGObBQnLazoi4k3rDdYf+iUeYE+2DRn7RZL2cmDUJ2h
	lq0FXf00+06ukTyw9gDpwzAXylzjxkpfGgV1cH3JkvhCKn5BzmGNWrg4JjfqI7kzDxIN18
	HqgawPITY8GgTr615M3FiMijVZomjRQ=
X-MC-Unique: diCR31cjOF6-I_82YRRZ4A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZFMD6kHjBOwskec7ZUcCiOZUsAQYTnDsq7geNjlArYfEv38nqsrS4sqifdZkT5TQ7ASFsdgcS9vqBuCtzXLflnP0A+Gq4h33tHLjxwhU4tOTNbUha+o9QgEK+oNou0WIXAd4r+GKXzVC7LZ6ilFLVgmhMhjm18WNXLQ1MQNCJFYSawX6v9eQg5Rpa8V5CBq8NuR//CF3Da8AB+80tbHQnzp6Dglv5ep9wSezSoBn7Mpow8AX8LWUzCchtBrVfZRDzWUsSkvEOc+GvojUMbcvLc1QqWcVPTFNNHrh5hz2tre/5rDkU8OY8hepp36yJTRxoSx2gFBLqqKWR8xyf6LLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGKVNXpk6Yv1J6OL742nVyzRVlUL2zXcUGt7Gxrlk2U=;
 b=Fu3yZfR7CJsfQYh9ZvI80FB8DmOuauzB4ugtbpT6zttftAAID0HK9fFV/ktAahxALSAJ/3jiIa4IoW8ZO6Oxql2gJATmIqz7jDi4zRhsGSRSyFgm+eetTM4nwrQow3QiJnfbh7UERsDWjsNR+0PkciqsbaneWmF4hc78+Vuupw6oNsqXO1DraZOEAxb5DY84OF+FPQHNzNlb8l/ecSethKgiAp5UBZhxF2m9pI4rHEsK/8YcGvbzm9CVxsUn9A4P74Qd7iN9mPFAXNmcf3LSNq3Cb/XR13xlKEMCWTs56U45EPFZnOzh6YTYf2CF1eAtbesmVpFK90kKp+hJsknA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c61d0a94-2975-db8f-eff0-773450511fff@suse.com>
Date: Mon, 2 May 2022 16:16:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 2/2] flask: implement xsm_set_system_active
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com, christopher.clark@starlab.io,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20220502133027.920-1-dpsmith@apertussolutions.com>
 <20220502133027.920-3-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220502133027.920-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c12979d-4726-4eea-a27f-08da2c4658f2
X-MS-TrafficTypeDiagnostic: AM6PR04MB6279:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6279B6673F8920A0AAD4EF8DB3C19@AM6PR04MB6279.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tZufiBjDzWIWKb/p8UX2UEfklTQycrWvuGQ3FqE5/WRJj/Zt12UzTsHJ8eRQO4t94+sTU/juP09Dnb25j3PEI9SGjN4ZywzYzAk9unTbiaQVFz3RnMwExJkPAhefkLsJOjuRw1HJaoK/BEjRoc2C9nsNSOTXx+baRbKp2n3WYFenxOPXpitRjBh75+PnoJdks/WLX6+tScTNMM79ub9cH1LxeuM3NCOLlQ7iWbtCxUGVKGowzO5Ec5z6R1ihaBarv3lgPHLUr1LrOzalSoXxt1UzrRAGPeolpjxAfqP7uDk67WuBGrZ/vkYLu5VOJ9pwNonEMFdoa3LUVmCx66ucjDlMRv7DnzOSNEUBeq8E/oxa2PTQ1ah0JdULtU2VT3KwZOjP24DdfbkjRe4Xob3nolpxVc1E5IBbMrcnPqg4Y0Dtz1b82Hii8lbN0gW2UFglHL65WnWfti7LCXq+11nEXjmIX+dlyL+eVz5h9ipHga/2vQSdUz1VHj2M5wlUm7ewpsfjY3Rd+hwO7ltufBFSxsBb9yke6BmsvzD+QL1k5h7vooTOPl1KNi9CfsQchAOGD5c8jBehZLLdPVawGOGRyZp7uC3654F//Ex4e7jlRtq80XBSakMGoQNMmWQv2YE45kJtCoA21W+AiymmV4mzgcAgW18AaKJ+UDn0kOa5YpnpD+Sk21WYidei25zbSnvzpwxH2xHNpIFSJGok0LfDUp1d+j2NNiPo3hwZ9rJ0LCs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(6506007)(53546011)(2906002)(26005)(31696002)(86362001)(38100700002)(508600001)(6486002)(8936002)(36756003)(4744005)(5660300002)(4326008)(8676002)(66476007)(66946007)(66556008)(83380400001)(31686004)(316002)(186003)(54906003)(6916009)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ny9LVXBzOVZXUG5OVXZBV0dTbkkrVUg1RXRXa2ZSQnU3dDUxc1QzR3JzZ1hs?=
 =?utf-8?B?ZzliMWFabTJaTHlmemgwNHJMQU03cnZPanhSNWFkS3c4ak1lM05JSDlZZWVh?=
 =?utf-8?B?WHplbUFSUlJlMWNUY1FaeXhnM2o1bFZVYTZUN0tnT1VObUpwY1FHYXdLNGZK?=
 =?utf-8?B?VksvR2REcTlLQllaU3JlYmF2a0Q3Sy91MDlvRFFFangyUDRlU2JQOWlvWFRY?=
 =?utf-8?B?ellYaWRlYWVLd2piQStHTjZ1b2MzYWUyTFU5ZEtJMGR5WWUxVzVvVHlHY0tl?=
 =?utf-8?B?a2pBOVlZWHRoZHZTbDQrQWJZOHlrUzZ4T1lwdWE3TzgwWXlEazBNRnYwVDQy?=
 =?utf-8?B?WUwyTTNMWk5heVhRbzFDSXlkdnRCdGI1UUZicjE0SU5od0VoVmUyZEdjYmll?=
 =?utf-8?B?d3EvZ3dFSEw3U2k4SVloS0FrL29YQlhaZnpLakYveG9VUEpSRm9LY2NnQ1h0?=
 =?utf-8?B?RkE1OTNFUm1qTGQyMUdZeGk0cEQyWTh3WS84b0R4dHp2UnZxeXNpTjlnTlRB?=
 =?utf-8?B?WXU2TmpFL25qcklYMktrZnFZMUxrclVONk4zVmFkaGQrVVkxUm1XQkZKanVm?=
 =?utf-8?B?WlpNV2N0VGFTKzNCWVN1aUErVk0rOTFvbThwNzBKelVzU1E2THpjTGtQUGFL?=
 =?utf-8?B?YXFJeTJsL2ZURXIrdW1zMWxVV21RTUY4UmdPRm5MSnVGSmFSdERQVlI1bG1s?=
 =?utf-8?B?b3d2dE9QWFB5Q1ZSTTdlNVlsTUkwMHp1aDZMTWwxcDVPVnV5aGpzamVCZFRu?=
 =?utf-8?B?azl1SnNoVXNqeHllOU40bGI0NjdvWS9CZ2xSK0s2K0R6Q2kwVjVnY0tTOVFy?=
 =?utf-8?B?ZTdTdDVaYjVZdWNTY3pkOTZWUk13SWRyMmNBamtEU3U5RlBKOTRpaWJ5a01R?=
 =?utf-8?B?eWhzUkRIdEZjV29EMTFJMUNsbk02VjlzRDNyd1k5SWxjWUpMVktaZHk5THJ4?=
 =?utf-8?B?YXlwcEpMVWduV3kzdGdiZGNya3lCUU5iLzhMUjJCd0dpaXVjSlRtcDJ6SHN5?=
 =?utf-8?B?QVJCdWZzeDFTczdhYjcyR05XWUFuanJDd3FGWm1FZm9OMkt0bUwyeFBjeU5M?=
 =?utf-8?B?dytRTUdwVVFVbkx1NlUxZS9WemVGc04wLzR3ZWhpY2Q1Wlh6RjBFYXhIai9v?=
 =?utf-8?B?bWxSQjdnRjIrMUIyWkU1T1d3TTJWQ094Y1dGMVlOR0tWYmU0Ym54UFNiMzZO?=
 =?utf-8?B?SlNXdVJHYmlxN1V3cGhhaWdOZElxQjNJK2JZMm1EVU1Nd1FYTTMrOUhaRVQ5?=
 =?utf-8?B?NG5UdytMRGlvcnJHMFlZR3MxbUF0RW44aHk0a2RURTIwRnlOQi9Ya3dpQUtR?=
 =?utf-8?B?Mm9zMEorNTQ2aTJFNXBQeExsTW14T1luL0lFOWtNR004aVJvVi81dW8rekJ6?=
 =?utf-8?B?bmpxK1ZvWnVFVHZhdlFtQ1l0SnkwRFlCZElKYVNVblMrTEYwZ0FJRy9OSlRN?=
 =?utf-8?B?TSt4djRYZFZtNFZBQlY5RG9nY2xpdmJVV1RYOVZOYm56bkwwNjk4bFVFc0wy?=
 =?utf-8?B?WWMwc3hQcHhNRGIxZFBZbGVCbGt1TXUzRjF2QVlqRTNTRU5aanhsNXVoakMx?=
 =?utf-8?B?OEpmbWU2Y0lNbUVmeWx5QXA0WGFNUTM5SlltbkxPRW5mQTNRV202SmVlWi9C?=
 =?utf-8?B?NU9WWkpsMjBaTUNjcGg1TXpodFlpYnVqOWhxS0oxT0VNVXBDUitNZjR5SHNk?=
 =?utf-8?B?S3k2TUE0cStiWFJqV2lKUnh1VFMrUkhrS21WN1VHY3QxelFiMWY0RGQzRDE1?=
 =?utf-8?B?bTIySmkzNWtVSXdOUXp6aHlHUzZlYXpIL2x2Ym8rYUl4djZvQ1ZLUk9IUTY3?=
 =?utf-8?B?b01CVW1KRVIza0djOVUvcnFhR1d6bkg2czZKUFh5eER2MWI4NEFCTmhMM25M?=
 =?utf-8?B?Nk11ZzRySGk4dlp1bmJNdWFpQ1IyelYwS2RJeW5SL2dnK2N4eUNiQVBFYkZU?=
 =?utf-8?B?U0FZSG01dnpSRGcwOVdIMFNEUEFJMThrb1VYMUdGTVhiVCswcGhIZjNUYnZm?=
 =?utf-8?B?RTJmRTNxRXhRVE1hR1ZnQi9yem9UTmUrbDM0Q1hOTnNEVVBBWFF0SlRlMU5T?=
 =?utf-8?B?cjArdmFQb0g1RGtkdW0vMnJkTXE2MXYybkt1OENZZTIvd2FxRTBIc2tNMkZJ?=
 =?utf-8?B?bDF2Ky9pSGEybWZqT2ZGaWRROG1adUdrVGd5anYrUUJpSlpOMDF6U0FaMTVE?=
 =?utf-8?B?SnBjS2xlV2NnQXduQnJVbGNTdWgzaUt5UWd1d1ZaQUNvU0lQQlRQQkZDK2th?=
 =?utf-8?B?K3U2dklmd0dhZEhvbGdFbXFFZDk3QnFPdU9MZXpCaTVQenRoMy8zN0ZLeU9K?=
 =?utf-8?B?NXd2TnpsTHozQVNlTHdGSjlMZ1NiRmQyWjd0U2tLVUlsSDRWL2RTQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c12979d-4726-4eea-a27f-08da2c4658f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 14:16:27.9069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpOpsKap4CuThdtPmgX/EnHMcjccIPIpVWxFCPxVSjUCWvPBkhEjrTqkZZ4LSLXQHq5VJ7/WrkFpNbBwHBmk4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6279

On 02.05.2022 15:30, Daniel P. Smith wrote:
> @@ -188,14 +188,20 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>  
>  static int cf_check flask_set_system_active(void)
>  {
> +    struct domain_security_struct *dsec;
>      struct domain *d = current->domain;
>  
> +    dsec = d->ssid;
> +    ASSERT(dsec->sid == SECINITSID_XENBOOT);

What about ->self_sid, which ...

> +
>      if ( d->domain_id != DOMID_IDLE )
>      {
>          printk("xsm_set_system_active should only be called by idle domain\n");
>          return -EPERM;
>      }
>  
> +    dsec->self_sid = dsec->sid = SECINITSID_XEN;

... you also overwrite here?

Jan


