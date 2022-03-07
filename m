Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7784F4CF2AB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 08:35:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285667.484899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR7tx-0000rr-Ig; Mon, 07 Mar 2022 07:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285667.484899; Mon, 07 Mar 2022 07:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR7tx-0000q8-FY; Mon, 07 Mar 2022 07:35:29 +0000
Received: by outflank-mailman (input) for mailman id 285667;
 Mon, 07 Mar 2022 07:35:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nR7tv-0000q2-UG
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 07:35:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27ca135f-9de9-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 08:35:26 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-EmYvgOo9MRCRxMKbPsVHsA-1; Mon, 07 Mar 2022 08:35:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB7565.eurprd04.prod.outlook.com (2603:10a6:102:e7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 07:35:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 07:35:22 +0000
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
X-Inumbo-ID: 27ca135f-9de9-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646638526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3DPOzJfYnLuN2CUMbsCLzEVa402hEMBDzE2WeKXS48=;
	b=LYdEZBlu5WEYa2GKeLR2pcUqhzGmEHgibSR+z1mfvjo/TaNODMy+Mj5c5lGR2/Eub3Hlr3
	Y9iZhQyeD1eJYmx/n44NWzOE5zAPF8ki6EMnh/bn9SCtXtmcyFagpHvIocJRsLd/8H42eA
	8gF/jstJ5TW8Sr77E4jlrGQMyFb/9LU=
X-MC-Unique: EmYvgOo9MRCRxMKbPsVHsA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8gphM8vYDazEKsgkWwJd8/4wV8MTiA/jm0s751M7CJj8uwzvNdZM4v2KN96zV067l2BrW6Ab2tjI2q2+uo866w5ExITcXxVg9ySrMch3xQYf3ZuvS5hzSwxOfG2MqWfUBh1SsARvdZbsbd33Yt7msW6J8MYQMOXVq6pymbS2k0v3DG+nx2c1SeGZpu5cyVMOojl88WOfZ0vm50pW/U+hoc2qjtvM0jw0100UNQKME6CsJDMpFhQ923OPaCyrPQIO5HUejrppPNmInlxugTa82PXaG0gJ/WMdA0lAniqp5UDOp4i5MFm6FhgYpb/6qSihE522hJiOBM1/1D82dwLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3DPOzJfYnLuN2CUMbsCLzEVa402hEMBDzE2WeKXS48=;
 b=Kbm+8pvMN9+Fmul8hYFZabyUW7v0g/nc+vgiNiXWfEK691nBb2j5e/AAM0wXSOW+gpQKNwztgkGBjmiOxfvnWzSOSZu1vRT1hsVMpd9qdKISX7+sCbxp3bkE3XjvadDS181pcgjdUoiaA5mycwSmHvQ3QUF3ZC+eMD9l2LFkRkdqJTT0SIafwrbL9dVc/dD/mgCy6GmWZ270m20yApPMIy5weFNoQhOCxlVNpdYxj48Y4/rqTNcqk4P4n4jukOh4fEjlb4DBruXf20WPFaR5+paSX/eNxnxKVsb3iGE/JvkA4UGd9KZvA7T6kVQqUosbf4X3o6PwqitsakyzZNJ9ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08710561-3afa-4708-86fb-91eeec908a5c@suse.com>
Date: Mon, 7 Mar 2022 08:35:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 18/36] Alloc: introduce page_list_for_each_reverse
Content-Language: en-US
To: Marco Solieri <marco.solieri@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>, xen-devel@lists.xenproject.org
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-19-marco.solieri@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220304174701.1453977-19-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0008.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f49047c-48a5-4ba2-f728-08da000d09c3
X-MS-TrafficTypeDiagnostic: PA4PR04MB7565:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7565A1D41655F351295216A1B3089@PA4PR04MB7565.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oUxpL0WIC80asDV3FAXvlFfeyH7F+M8Y2rwptbl//iS11u+b4DgkHsK2Myn24iM73XyL5aDyv/3QfX23cb+hCyJcOaokcEXZWa0qiqgKvRPSAe3llYLfOD4/wVzptECNqGu1zhK0QliMv3OKLiMrQpFqzSR8vmyk8nsX5z2HPDwYRxG0ieHZ4YWcWtu1ICWsiHxBwt09MWlC4qrbLOrxlEZueyABGurrvFRFLaPXMT8Ti4cqh47HfSUtJ7TJM7L3RLz61viIbU0qOcHrmrHbcoLoHy+z7K5521/dWujhooLoMNr4Aw2plQANfxdWI7mDCFOVDiMGOJO9Qd0d1oS5MF5b5+5hG3hX09LMzK1N4godDOCrRnd+Dne9X17oNuFhJvIZr4mGnbu/CYoQPrYsVJUnQVA4TTFAow7RFpQssBig7XSrEW3NMZ5nE5EnpT1QIg6Q8SMRobgO/zJB1T99jLUmED8J9nFKd1PeozyAtL4JeFIkP0Il4Qt4mxVPedp1P4xtwFEtvziTBYhxqhSlAHQejLq9Sz7RDRh6fRt6cB6qCVgRn4WdF92agZlQREQBjMEZC2X7FTWuwYNLsCEePe2cdg4u7/blsbXKbAp+GXvBzAN4DtyCXvAzMGpgq0V+BbseTrZ/W0fjWmNkBtQTLHQUNbxfeyOTsyMmYwR6X7A1Ts6k4a5qP7jPDCKRpvv6Bty/xFzaJJLqpnY5BveraYU0yKovRW/QanGHIrU1B3k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(8936002)(53546011)(6506007)(86362001)(8676002)(4326008)(31686004)(36756003)(5660300002)(316002)(2616005)(66476007)(66946007)(26005)(66556008)(7416002)(186003)(4744005)(6512007)(6486002)(54906003)(508600001)(2906002)(6916009)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUJTa1lJWEF3WW9oVzBiUS92QitWRm5xOEMxZWRxOElodEtzVk4zRG80ZWZk?=
 =?utf-8?B?VTVOd2FlWUt3Y3h0dEtLZ01EaWNyb3dTWlZHZHg3dmRlZlpPb2kweXVPdE9a?=
 =?utf-8?B?MWRwNkN2cmhQT21GWitna0JoNWVNbzlZemtYVEljdVdpMEdHcVBNd1AwTm9t?=
 =?utf-8?B?L085NnpDUkFCZUVySUNxU2J4NGNiWkp1bVZ5eVB1Y3FQSHRVUm53dlNhdlF5?=
 =?utf-8?B?TERNS284NnA4MXFNMjFPZngvUXNZczM3Y3g5OUQxYldidk5nUXBUd3I1UUdt?=
 =?utf-8?B?QWtzZU5jYVV1T0dWdUxHblJHQWRMZEZSbFdYMVNCUFlzdGMyb1RrdE90NlQz?=
 =?utf-8?B?N2VIK3hZc0dTMU03QUoxaFE3TVcwTTlwb2kxZ0NiQXhuQnNqSDliNmF0Q0tX?=
 =?utf-8?B?eTh6UVdNU2dGTzVYMjhSSEZuYXdSUzA0eUdyejNRSkkva1NpQXNlRXh0U1k3?=
 =?utf-8?B?K0FWOW1POEpaUW5YbXBWMk1MZy8xNjVnQ1pEcnBLdy9BM21ib2VudlV6ZWFU?=
 =?utf-8?B?RTNQNVJLV1ZEYmhxK3JKTVF5RDdmUHM2KzhSQjRzN1FuZENnaS9ucjdaV3JH?=
 =?utf-8?B?WGM4M3ZwdnRKVU9GaEV4TGpNY0NzT3NQMzI3cDJNc09NNzVWMEJhMnoxNjhI?=
 =?utf-8?B?cDRFVUh1aUVhWTIwOUpJbEpscmJEaWo0SFdpRWQ5S25rcDQxMzAvMzYwWDJq?=
 =?utf-8?B?UllrMXZJRldnTVIwMVNYWXo1dEVXYWp1Szk1UlJqNjdvVXhZMFI1ZEh5T2c5?=
 =?utf-8?B?YUdNd0JqTFB2NGFTa0FnWVlkdGRMVVI4ZUVrbnByckFCQXZHa29sOS9jS1Rk?=
 =?utf-8?B?NXgxT0s5L1kydDBHSVJkRWpOTERxTHN1SmIzbzJ5dHExM3A0LzlaMEExUmJS?=
 =?utf-8?B?WUF1bHZWU0VBK3FuMFAyTWI1TVdzbzdwTmxxOFlkMlYxNUVKYUllNTk2RzRH?=
 =?utf-8?B?YlA3eHc5QUhvYklLMkh1ZCtZNVhqSFhuYllsWGhReDVWQWVlcG5XcFAyODRx?=
 =?utf-8?B?THFsRXZrQSswVVZ5TDJ3M0Znc295QjlialBrU1JZWlV5a3o0Q0VDcFJqWDBi?=
 =?utf-8?B?SDVPR2FwNjJKYlUrWFhmeUh1NmM3M0s5UGVwRWhIc0lIVll0TUIxVXBKKzEv?=
 =?utf-8?B?UHBabVFYT1BJV1MwZ3FmaE0wY1BPUDc2UzNEZ2ROaU1pSmpPd3hiY2hwR0pz?=
 =?utf-8?B?dlF0MFRMVHlXK3Q2b1h0RU5yL3BxbVl0NlFPQ0Vtcks2MGU0bHNudzkxRzlh?=
 =?utf-8?B?akZXWU5iSE1qa3N3RzVmODNoYzhWbjdWTW9uZUhkNFM3RDZORTdlSWFmTzZy?=
 =?utf-8?B?ZnVIN1FQMlAyTlpKNkNtYkdkMGxFTUE1T3BSMkxMT3ZpK2R2Z3c2b2RKUGtv?=
 =?utf-8?B?TTBsSWFSaU9sUy9rbnVpbms1cEJjWTdkaGpHUCtXZ3VMQzRrNVFZSDUwSU5m?=
 =?utf-8?B?d2FmVUdQL1dmMUh5a09tWG9JaEpyeGppS21zTkp6dFZKU1l1NVlVYVRaOGNL?=
 =?utf-8?B?bFdjNlRTQzVXZm9CQlI1dXFCa3BML1crb3RZY01GMEhGRllJUTBvRFlOSGZk?=
 =?utf-8?B?MzdiNXZIbVo1VFdpT0trbUV5S0NVQTczSjBLRTNNZzFLOStrdG53aXFid0Ft?=
 =?utf-8?B?YThRN0s4SWt2T3lNekN2akRlTXRkNmliaEQxb2NqamEzbTBQck81U3ZwU2pG?=
 =?utf-8?B?dDN5ZS9TV3Z3clhrR2w4ZHgrUUkxbTB6YVJJbEs3OUEyR0ZDd3lZZFhpVVJm?=
 =?utf-8?B?Z2tPamJ2elJFOW8rcUo1S3B0ZHhKU1JEV0RIekZ2OVU1VzdWY0Nad1h6VjFj?=
 =?utf-8?B?TjY4WTZQT0JSZ1dqV3R0Mmt3SUIyLzFVZklBM3JhZ3ZSV1BKM3dOdnMvVDVH?=
 =?utf-8?B?ZTcrRDNqNjBjNGR4cHArTmt6MFNwOHE4TmpVN0o0alduTVgrV2NVOGtiRUxQ?=
 =?utf-8?B?M1A5SVA5d0NzV2hER0JsMnlLS290VjhGRGhGZmIvdkU5eDAxa0xkMEg0ZG5n?=
 =?utf-8?B?Mmo2cFllelVRVDBSelpJa0JCSlA2Lzl2cEl5dnNCQUU4RlNZd2kvTlplemZp?=
 =?utf-8?B?TnFNWW9WNjByWlJBSzJFdjMyVlVPRXJXL08vRi9obm9QRnNpdHNFbFQyVTdy?=
 =?utf-8?B?Y3YvSldUVVhER0NleHY2QkJncmdYVWVjMk5sb2habzVoUFprOW1zM2pZRnNN?=
 =?utf-8?Q?IFPUNCHOeWPUCax/x96Qy7Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f49047c-48a5-4ba2-f728-08da000d09c3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 07:35:22.6165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2S1N4ef59QQa8h+l3TqnWBbJs36/Ldcx1FFvAGNe7IAsFJU9thLlKoj3mACFU7SgoOo5Q6X10Mn5BMVAhD/UrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7565

On 04.03.2022 18:46, Marco Solieri wrote:
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -488,6 +488,8 @@ page_list_splice(struct page_list_head *list, struct page_list_head *head)
>      list_for_each_entry_safe(pos, tmp, head, list)
>  # define page_list_for_each_safe_reverse(pos, tmp, head) \
>      list_for_each_entry_safe_reverse(pos, tmp, head, list)
> +# define page_list_for_each_reverse(pos, head) \
> +    list_for_each_entry_reverse(pos, head, list)
>  #endif

There are two sets of macros (for there being two flavors of lists),
and hence - even if you need only one form on Arm - the other form
should be introduced right away. I also think it would be far better
to merge this into the patch actually first needing the new
construct, as only then it'll be able to judge whether none of the
existing constructs would be a reasonable fit.

Jan


