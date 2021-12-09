Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A3B46E48C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 09:48:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242791.419879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvF64-0007S9-5g; Thu, 09 Dec 2021 08:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242791.419879; Thu, 09 Dec 2021 08:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvF64-0007Pk-2Q; Thu, 09 Dec 2021 08:48:12 +0000
Received: by outflank-mailman (input) for mailman id 242791;
 Thu, 09 Dec 2021 08:48:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvF62-0007Pe-OQ
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 08:48:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc0b2205-58cc-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 09:48:09 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-uHwVgNM-N3S6ZE5bfXsTHQ-1; Thu, 09 Dec 2021 09:48:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5599.eurprd04.prod.outlook.com (2603:10a6:803:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 08:48:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 08:48:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0402CA0002.eurprd04.prod.outlook.com (2603:10a6:203:90::12) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 08:48:05 +0000
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
X-Inumbo-ID: bc0b2205-58cc-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639039689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/wjiQ0J3T6bulvXOwbJPkh8GBjSj7haCrvlH1MsovY=;
	b=fot+Lzz0O5cnNk6v/wKG+4JxR7sy8tJhlCOLNKxc2PoyCoJ32BVjAwOzRGMGLFIPHLjx7Q
	8VhuA9rRYcyMuR0aISSZEGBhSXdTNHG/tJhzdVEoeS2MpW8tAMgrxwLfdjKCDCQgCv6WKb
	mwsEjjKS7fnvMqae7IDuqe66rW/fP64=
X-MC-Unique: uHwVgNM-N3S6ZE5bfXsTHQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9eslVOnIQW6zN3j929pbIpWxjMwxqXW/+Fn8lemb47ALam8Bzoc+Ej7QtHmnMjxssIP322vcjoBCs0EEAf6+YQ35nZfXzAWS2M2FfzwQ/Rv+e5EvDiwAoJIUJWytqQqNX+NtmqWsFk8tBTfPeqI8OdDBnCtpg36gN6yOn9pLU/1NEwkGo8cwiArBnNFyMvqhLe9CYQGCk6s8wWDAGRZOv+Ec8jtqPKQP/6GTHoTEJ6Xp0BI+cFTo1tZ2wqnj8DPBedLaBRgaxDHcq43XqQx2L35c5OsQjSTktSudjEG7pd2q4u8VspchIC8CjWH5lSKgJ8bGrr4pU7sXxu3yABdTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/wjiQ0J3T6bulvXOwbJPkh8GBjSj7haCrvlH1MsovY=;
 b=OGfoziSVsMXQJxyqwAdLQKpGZBmMSQQUYfjMpJ3TXWTECYGIBjrRyeIyTmVMH7mAjYWiMHYzBXdzApweJdfeB2uYNryMV7uugVgbwB1sN+yY2sRJWEZDcUg62Y06SIVnQA9h9BO7opKWFobSiGm/UK2mnGx76YpvlK4t6lVoYgoMkEzGpNYELYQeV9nrvoLL8qyy7WKcHEGfqsmfR13gC5HL343gfYMuzId3yRnqGgHezXWo/5TcOblyrbc3NVUrgn8qdy4fHhKuvknKdGgg4nCLPH9sQit1xCTncPS7PSMlKx6pr7NSKDu5keCbAWkrXCvV/C5ZfEdv7o4+2559zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ce9cdf6-228e-b4e3-f0bd-f64fb89c03dc@suse.com>
Date: Thu, 9 Dec 2021 09:48:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] public: add RING_NR_UNCONSUMED_*() macros to ring.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211209070942.14469-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211209070942.14469-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0002.eurprd04.prod.outlook.com
 (2603:10a6:203:90::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 149ddf9d-2e14-42cd-7e20-08d9baf09e7a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5599:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB559983C138636732E2DA7766B3709@VI1PR04MB5599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tedSnI2K7f23meKH3XT7kVOaksdkLMi/OPg/pgqSsGAZMNBrP5MQmBMJAdFheUCn5Ch2BZ3u5L7TshtiPoYexAdTbC/OvlPfjmHaAPY1rVcWKbeGKQbnYWfcQ8pF7y5XyQs70j/XL/YWA90hlheCW9iB/ZwDxWUJxFIs9RnAe+12pEuw9Da8GBLG7LIRhfZQAptv66r7UuUoMOx3DnopFkYmQlpapw8VpGAkSfApn+D0LFmYGNfAFv0n8VXaJ2CUpxWkGJgje6jp6r4twTFbxkoPPJ1U1GonDqK4MpHIJLxs7/HThXHSP+FXZrUCgW4FMNRgDis+3nrRNLOc6Nt8YRsOmYNlsn1UxTXPcn2gZv+PeXj89iMoxbnnh7vwByjOCeza4N93BlHgyuH3vX0HMoeXVF3SLICEzmVUSDn1HkSm9MVISs23lWKvTWQ2KxfNawKn3iK1AB6zeswqrzylRy5kviBps4TUAjsbq4B1ew3ENgyizQ/rn2fV+sPo77H21HXvcYwvSiFoIbI4uBuI4X3t7BRbZ/yuXnwAXOnb4Nx6Y3CIZm3097Arcg/Br9re+sJ4OEX9Pydm8eaH4v7ylw/A6P/3TqVEiQZhUR74B4/g3WFaToan/+RVBtPm02aeDhRsT+ZdMRiCfH0/L5DA7t87f/WqElGCzuw0Gg6YaLIaVXQGgUyol/mQGQTPrDg2PfPfWPpENiqRZJPkf8SbR+/q/AY9lwPrrHrKesGfSCM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(956004)(6486002)(53546011)(8676002)(83380400001)(5660300002)(31696002)(6636002)(36756003)(2616005)(37006003)(54906003)(8936002)(26005)(66556008)(66946007)(6862004)(316002)(16576012)(508600001)(4326008)(31686004)(2906002)(86362001)(186003)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDZvdXNKMk5CK1V2Sms0U2h3Nmh5U1UySVNaRkRXVFZxbDNHS2Y3UlQ4b2hW?=
 =?utf-8?B?eWlYOStBRGx4N2M1SFByRTVyYVBIQklteXRrTDZ0QUpTUHU4MlpabisycUZy?=
 =?utf-8?B?ZVJycEpGL2FrNGdocUVHSnB1bzVTM09MUnlVU2pzcWlWUVlxZGRIVnhweUFo?=
 =?utf-8?B?UTIxRks5ME4ydW1NampCcTRhNlRRVnl4WkRhcmJqcnFqMmJiazBvTlRJc0Zw?=
 =?utf-8?B?blNtZUpYZ0JoMGJKSHZ4OGxtRlFqNisvNVRUeGFHZ1k1emxQQXA3L0NsOUR5?=
 =?utf-8?B?NFJmRGp4VGRROVBJY1dHRlRLWXVjYldQejQvak5SeTl5SnhncXhPNHRYbkN5?=
 =?utf-8?B?RDFoVmlQdEZNdG1LWXU2U3JQTVRLT3p5STd5RlN6NEMwNkNNbDB5OHRYN1Bx?=
 =?utf-8?B?ZWg4TnhpbFdQYWN6K213cEdZSlFEdVJBOHlKdnM5SDlsbzRLbUR5czRqc0ly?=
 =?utf-8?B?bmFoTFBsNWM2ejhHUktsTVF1YnZzKzJSUW1Lb1U2VnA0bm9RMW5tdjY4RVYw?=
 =?utf-8?B?ZTBYcFMyejJMSmY0Mkt2VGgyRFBTTnFGQndaYkpRNWFiZWo3ajdNemV3eE9Z?=
 =?utf-8?B?MzArUzdkOVVtY2ZJVmRnSVkxY2YwMktnRWQ4cDlZOGZNeWlLNWhsU0lBUEg5?=
 =?utf-8?B?Q0xwdjIweEEzR2MybW1lR3crTlRWVVM5a0J4N2JCL0NxbzhiUDEwdUVORURl?=
 =?utf-8?B?ZFpDVjRaUUx2S1pCZWdiNnQzWVYrNWxhYVRVQ3JLN0RHKzdjOERPNTljalNY?=
 =?utf-8?B?QUV0VnhJeWE3dStqSXhGOXQ5bkNnTXJXZTFlWmFTL01QRU9ZRldkY1gxNWU4?=
 =?utf-8?B?OW5ad3VxbCsvYm83dnBuNERvNlBxRllXMHh6K3dPL3hOZ0dBOUlFZWRXSVZC?=
 =?utf-8?B?aWxTZjNsNjlHY2tLQjlQc05sVUR2dENkTngrZGprZnFkWTBibFlYaXJsVG1s?=
 =?utf-8?B?S2RUSVVZeFBRcnRrV0hocjg4MW5RNEVSMWVFcDR6OXdTWjV4YWJPdTZEOWM4?=
 =?utf-8?B?ckUwc2U4VGJISzNZOWI1WnpXNlhoZXFBWjF4b3Y3cWFGM2xKVEhsbzJ3d0Er?=
 =?utf-8?B?UG1mczRUZllBUWZNUldobU5jSWV1R2VINjlpWXh2YXNRQ0lMK202S3ltZjNF?=
 =?utf-8?B?Rkd0emF1Rk1aZzN1ejRZT015U0ttV1AvVURFNGtEL2s3UTVKL2NEazFsN3Uy?=
 =?utf-8?B?U2RDZjRkSWx6NGt6MVBiaGpLRHJzN3BPbTBmUkZvdzVwV3NUeXI5bUMwUzQ1?=
 =?utf-8?B?TzlsdStNcFdIRVNzL2d2Ynl5RW9tZlU3TVBnS3Y5MXRaRXg3OGFBUDN4WXds?=
 =?utf-8?B?V2xBblFjYXJKbndBYnJlczFMZyt6d2lGaGJ6NjhhUnRObUp3OGQ2Rkx2a0k4?=
 =?utf-8?B?c2Q5NzVOQWZaSVdJbExvT2pGNGEySFZFRzFpWWF1K1BOSWtCd2piM2NsSk1O?=
 =?utf-8?B?aVhXSGdjK3JaY2VDY295amk4eENoM0ZlZ3pmeG55MEk5VlBPZEpiSVJXYlFL?=
 =?utf-8?B?Q2ZZdTNmVU5oZEdpWGdmQzA0SlRKSm1IM1NFNTFNbnlyb05sM0NtNFlNZXFa?=
 =?utf-8?B?WlRNaERNclRCRU9ITDl5RUlmRWZTZVl2TlhXTFBWY01kb3RzYytiN0l3YnhB?=
 =?utf-8?B?ODRpbGNlUHBiRXNUOFZJYk1UYlNDK1VwV0wyUmNYSnZkTS95NGpaTXFnMGNN?=
 =?utf-8?B?YUZ6YUROK0tFaks2NmxFMnhhL1owNzJvazR4ekRDV1B2bUJ3UHBaaWNaaDlH?=
 =?utf-8?B?TUJpL0xIRUpYYVdxV0xWaHlrM2VzUVJnRUdEU1VydU84VEx5R2YwM0c5MlF2?=
 =?utf-8?B?citOMkI0TW8zMnNGZ0RjbUwvb1lXcDFIRWxZcjYvQmo1NGhMZ1BvQ3JIMHYx?=
 =?utf-8?B?TFBHVllYMm1Oc3ljL3JaQThzZ095VzJLQWtaL1VVZmFRUjF0WGoreVdIc2h6?=
 =?utf-8?B?aVlBUE00RXB4eGdSMnBNUXRQY0JoL0NreW1lQjg4Z1FUYjFkdDdUQStqT1lS?=
 =?utf-8?B?dXBOZTJidUFPVXRpR3BVQ2VrZ3FhcjVnSnBTZUs2bnBwWFpLc256Z1VTcTRX?=
 =?utf-8?B?Rm5Ja1dIUTJSNVYycGNaN3d2R1VtK25lYjV6RWI0eGk4RHVpb2tpemhlWFJD?=
 =?utf-8?B?NDRVbzhMYk1XQVBGL0hKanJKaHlqOTYvenUxRXI2aVZPM0g2N1BNVHBWOHFX?=
 =?utf-8?Q?Eesn8ovOAd1nEF8ha99T6Ho=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 149ddf9d-2e14-42cd-7e20-08d9baf09e7a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 08:48:06.4700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIdOzIJCocKMnT2EJKJADYqUlPw/Wszc4dz8/xlbEz+g+cQSXsC7N6plXY1aTIX1rxMbbJsvIOgm7UccVIzhGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5599

On 09.12.2021 08:09, Juergen Gross wrote:
> Today RING_HAS_UNCONSUMED_*() macros are returning the number of
> unconsumed requests or responses instead of a boolean as the name of
> the macros would imply.
> 
> As this "feature" is already being used, rename the macros to
> RING_NR_UNCONSUMED_*() and define the RING_HAS_UNCONSUMED_*() macros
> by using the new RING_NR_UNCONSUMED_*() macros. In order to avoid
> future misuse let RING_HAS_UNCONSUMED_*() optionally really return a
> boolean (can be activated by defining RING_HAS_UNCONSUMED_IS_BOOL).
> 
> Note that the known misuses need to be switched to the new
> RING_NR_UNCONSUMED_*() macros when using this version of ring.h.

Is this last statement stale with the introduction of
RING_HAS_UNCONSUMED_IS_BOOL?

> --- a/xen/include/public/io/ring.h
> +++ b/xen/include/public/io/ring.h
> @@ -208,11 +208,11 @@ typedef struct __name##_back_ring __name##_back_ring_t
>      (RING_FREE_REQUESTS(_r) == 0)
>  
>  /* Test if there are outstanding messages to be processed on a ring. */
> -#define RING_HAS_UNCONSUMED_RESPONSES(_r)                               \
> +#define RING_NR_UNCONSUMED_RESPONSES(_r)                                \
>      ((_r)->sring->rsp_prod - (_r)->rsp_cons)
>  
>  #ifdef __GNUC__
> -#define RING_HAS_UNCONSUMED_REQUESTS(_r) ({                             \
> +#define RING_NR_UNCONSUMED_REQUESTS(_r) ({                              \
>      unsigned int req = (_r)->sring->req_prod - (_r)->req_cons;          \
>      unsigned int rsp = RING_SIZE(_r) -                                  \
>          ((_r)->req_cons - (_r)->rsp_prod_pvt);                          \

To answer the "whether" question this was likely good enough. I wonder
though whether the use of (_r)->sring->{rsp,req}_prod doesn't require
further sanitizing of the result as it's now intended to be used as a
count - afaict the returned values could easily be beyond the number of
ring elements when the other end is misbehaving. Or if not bounding
the values here, I would say the comment in context would need
updating / extending, to tell consumers that they may not blindly use
the returned values.

Also imo all new identifiers would better have a XEN_ prefix to avoid
further growing the risk of name space clashes. But I can see how this
would result in inconsistencies with existing names.

Jan


