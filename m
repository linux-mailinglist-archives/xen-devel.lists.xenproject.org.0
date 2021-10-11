Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F389442884A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 10:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205435.360735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqIa-0000kr-Uu; Mon, 11 Oct 2021 08:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205435.360735; Mon, 11 Oct 2021 08:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqIa-0000iH-RX; Mon, 11 Oct 2021 08:04:40 +0000
Received: by outflank-mailman (input) for mailman id 205435;
 Mon, 11 Oct 2021 08:04:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZqIa-0000he-4M
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 08:04:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfab9224-2a69-11ec-80d0-12813bfff9fa;
 Mon, 11 Oct 2021 08:04:36 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-pbvUUYAtN2yums_EJqQsRg-1; Mon, 11 Oct 2021 10:04:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 08:04:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 08:04:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0058.eurprd05.prod.outlook.com (2603:10a6:20b:489::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Mon, 11 Oct 2021 08:04:31 +0000
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
X-Inumbo-ID: dfab9224-2a69-11ec-80d0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633939475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X/4ljXLmYk1pUbKedYutRMFE70u9r2ifwdFCmcnSvbM=;
	b=JBIjZTd+/gelyhO2ZZxUAX96q9hzrnM880GqVHY8dlbV436B8OHOohnekoJU0YENdMfgh7
	qT/TuST70kL7oh+oH4U8eWtYjf9PLBQFmiU+nkysh6mOgcX0pbAukYA/1WUmxsau44ruln
	5AXYbZU8iRxOi7SjGJ0xKL+z+zygoF0=
X-MC-Unique: pbvUUYAtN2yums_EJqQsRg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZ7EOIWMicIp5PfltbhSvFOjt0Ltsj6Gd5pqM3mQdKzmsjojXzW4ORtd3GwJ/cxdzO1Qt3Jd8EWLYjAckyQJ3KJ3lLl6wzYxc1+V5XycSWTETbG5AnzcR7DIPWivWgOR2+Egyj2ljpQa69pptTbH9f7BbOtNmgV8Ni0NGPK/JqQfxGo5I5O3oECUKNnfvES0inpqmGYiRxUTfjYWgrXap0AIFETKYle+UrlzOhsfhhl9AtwfIrf0SaFCI/snqMXMJchS6e4hxaz+MM6DApbDwTq8rM1vqMGo6hRtxGDdZ5X9dRh6dlnryw2c8YftIzsCaYgPHFrtjTKDKGr6Y03Uvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/4ljXLmYk1pUbKedYutRMFE70u9r2ifwdFCmcnSvbM=;
 b=ZqDUHZd/PX6oJtEUnagu1oKRu6qZsipYPDZJbRHOpI2+orLrW8GdJsTN3gMvRmWiELvl25jKQQQj6jNTtzDS1Yhm37CkNnToq87IiNPATUKK9nJVlNt5Dm1Dbsse4CG1dAucRgn7iviNGrNxEReSA4HQlmRh+OHvu9GWx3ousR8dch8Wfne3ukwMPOvY2CP1UrPmoU1ABCIiWVefgK+yDyq92Mv6K1jiHgPm4m+FelOfjtfdrYxSXAJjqjK9HEvWON/7uEXEh7IdfoOCLvJiyHqOvTnUriNvjBk1fdKI+V+TUcH5uDKqQP2yHmWjJODgWyTY7WWGlS2tSRyXQ6/ItQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Ping: [PATCH v2 3/3] AMD/IOMMU: consider hidden devices when flushing
 device I/O TLBs
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c0a460c0-9d7e-c015-37cf-4775bdef33a8@suse.com>
 <09b6d94d-0116-c8ee-5daf-ddcc19d37029@suse.com>
Message-ID: <2b6cdf04-ab6b-bbbd-6df1-d90fc22752f8@suse.com>
Date: Mon, 11 Oct 2021 10:04:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <09b6d94d-0116-c8ee-5daf-ddcc19d37029@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0058.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57f96514-5019-42ae-b9ff-08d98c8dc1bf
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7152621F3EC51437B9C2FBE8B3B59@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mqTelGUD//fL82rEyEhATNlDM0mxqEQFPLA+vzOSg+RrckIi3yU0s160zMlTesGXPffXzaHWKbIorQtO6HbLsVhjbTJTX048bHvPr7uH0nFMKXHHT14ZaNwmughDEKs4XOqwPG6GcgTkRPp9S593YJQtEqSlqR7rvyq9uJL6QBjSq55gEWzIj/RhwRI3bhfRdeBMt3kwqMaToCv0amsiLVE1uUhwJs/wtMBH0FtPNMpF7aorNEwKQKAWQW73S4IF0YR7eOcknkzlJ2TQF+DtQxNzpwHkR2H1CcO+gq1tBrmws5uPs6yVEFsGeaPzhFZKcLYVMpPF7Hp3A0YZdNE8k/IauxdlMwFpWZfa5xHJDh1dG4pK/tWUAoIL9QNmsbfpET3adN6I2BLD/AFLEvDfxAr0RCDSjYvLt1PaRsiFx2i+taizSP4QOLXlJDAzYxnTp1aVQN1Xv/mdGsg/yr0pyIMJBLYgBU/cbauhsONnnuB5R9K2BxWaj0bvm7eNWAORdHbfDAFDp1/gkCGMTWK/AdIkk6lBtz/hyCEzA5yK2bve/gxW1imQfq+IEz9pUPEcGYkIUblVoKdXsgd4BsdOEYjn1eIdp0Q6LH5P6Ug5CB9jgza8VIQvxCKBMkqjdxsfboCuGWGCE7uph4iAXsnNb+xEA+fi/KW40I7nllmIk7tfQv9hYk4AbCKrBlN/GQTxc6NNEGXdwiGgxoMRp7ZSEANejwL99SlHLtUOF4s5Aas=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(16576012)(66946007)(5660300002)(66556008)(66476007)(2616005)(38100700002)(6486002)(186003)(86362001)(316002)(956004)(54906003)(31696002)(36756003)(53546011)(508600001)(83380400001)(8936002)(2906002)(8676002)(31686004)(26005)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YytjSjhJbDBQQXZsVWZybkVwY0lFSC9KVnpLcVpZZDJZaFFDWkpNbHIrdWIz?=
 =?utf-8?B?anlHOU9zdlgranhTRTdIWExRYUhXTmx6MGdqWHIrdjRGWTVISHhmR3NKZnNS?=
 =?utf-8?B?MmJVSVZ4QWlJTWNEWWtBZGFLN2RQR1U3ZzJubzNJdWpjQ09Nb0c2N2ZmYTZq?=
 =?utf-8?B?aThqZVNqQmphOTY1RnRvbVVETWRNb2tPZTVlRTNKYWh2TGsrMmRQZ0VSeXRQ?=
 =?utf-8?B?VDdhOFU2TFcxbjlndjdCN2hSK3c5U0tSbXdNSnhPcCt4VFdhWEVmN21WZGdY?=
 =?utf-8?B?b3pxbzZ3SWlFbEk2VCtVUEpzRGM2V1o5bXgvQnhoV05rWWhMamxUK2RleEJr?=
 =?utf-8?B?MTg3bnZqODdHbFVDbmdTWko3RmxKb214Q1A1UExEdXptd0hEL1lTNFFjd0Ur?=
 =?utf-8?B?MlNsU3ZOVXo3N1hsblpiaXFrSVpockxHMk05Z3VnWjdLNXJQUmxoOE1iUnlp?=
 =?utf-8?B?Q3drdzk5M2NySVVRZHovQ21iMW9ISytxLzc2dUYrYlBRLzFGNlNjczNaTTN3?=
 =?utf-8?B?aVl3azhGeEV3R0hkQlE2QzZBdVk5S3lnRmVwN1VEY1QrNy92M202WDdpdkp5?=
 =?utf-8?B?K24wWWl3SWJ2MyszOFRuQm1ueWpxaGVlcThjSjg3RTZDL214alVlQU04TDNp?=
 =?utf-8?B?N0JGeWh0VXEzSjFNVG9KeFJkTWtJNlYySlp4REdqMHlhNW4yRlRJZ0E0ckhq?=
 =?utf-8?B?a1BlNEMwdmYxVjdCOHVmK1EvOEtva1prTUMrWjVtanJNYXA4Q05tQzBoYkt5?=
 =?utf-8?B?VTRjdGlaVUtzNEtvc1pCcU5BQkQ1ZXpHcjZXLzBtdmpQck9PVlhFdlhoS0hV?=
 =?utf-8?B?LzJGQ2p1dXZLK3dJUnpZY21lQ094aVoyUkRGNjQ4OTBZbWJyUDJtVlF6TlZJ?=
 =?utf-8?B?NE9jUXJ1NUI2Mlh0Y2QvK25wZnhZMHEvOGowalpPMDN4U1l2aUpWNjVNZ0xX?=
 =?utf-8?B?OVVGOXE0VjFkQWlkSnA1R0czaFFnVWJlb2tIUkExcmE3a1hzQXVZYzFVeFJ5?=
 =?utf-8?B?TFlhS1R6OGNFd1h3SU8wdTd4SXp5R2FwcmZXWnArZXZ6cFV6RUViU0xqdW9L?=
 =?utf-8?B?Myt5WHBqNVVWb0dTbWNnRGlwQ0NFRnl3K05wSGFiNHNOSHN6allzOGk0YjRR?=
 =?utf-8?B?RzdQRmhyemVzM0N5dU1ldkcyZitIYmRCRHRiNVRGZnNaMHl4WmxseWV4MkFo?=
 =?utf-8?B?Q1FCelhHVXV4dTVwMTdkdDFSQUlaekdqT0FuMXFxbnlZdldGWnMzdCtjQzkv?=
 =?utf-8?B?enZDY0FxQ0lSdE16Q05sdDZPOXBxdHRtdlZQSGJiUGhTc0FvVlZ3WnB1QkVp?=
 =?utf-8?B?TkJVZkRvV1RabGJwYTNpc0c3ZmJIaVVtelZDMVdBc1N1cVc3YUthZjA3TnBT?=
 =?utf-8?B?TVhwOHBqZWJHajdUR2s5Zk1mVkcvYitiVXBMZVRFOEROdFEwc3RqSVlzVVBt?=
 =?utf-8?B?cFo3cHBIQVRFSVJrYUJBQXlIU2lvVlNVUXl2aWlwN0JLdnIzOWR6V2JOUy9Z?=
 =?utf-8?B?QVFZOEYrQ254Rkx3Z3BCcHZBSjJyN0I5U3B1QnV6dHdVa0I4TW1yYk9zdU9y?=
 =?utf-8?B?UzViaHd0TURVanRTQ1ZxSml1MVIxdXQySWJpMDcyZlFFUVlBZ1RoOEt0bkVM?=
 =?utf-8?B?bjNlK28xNm1TNjBnZCtKVDJJMkJKN3dnOTY3TVlPeFM0akdpN0xBRExNUmpD?=
 =?utf-8?B?dmFNYjJlY2dBcWpWZld2Wk9nblRrZGRjZ2lJbC9NbTVXN2RMMnl4bE14QmlT?=
 =?utf-8?Q?8qtjyUVeRlzzqqnqHA04zqUGgV269S+p0+FHPK+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f96514-5019-42ae-b9ff-08d98c8dc1bf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 08:04:31.9560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqLoS0aB6zE9lzAzs1B79ovxMZAoCS2w7Vri56bat/liXwlF/p8ZuRPzyOxX0u+9BobFVjyURIM6nt+XMXlkJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 17.09.2021 13:00, Jan Beulich wrote:
> Hidden devices are associated with DomXEN but usable by the
> hardware domain. Hence they need flushing as well when all devices are
> to have flushes invoked.
> 
> While there drop a redundant ATS-enabled check and constify the first
> parameter of the involved function.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

The VT-d side equivalent having gone in a while ago, I think it would
be good to have the AMD side on par.

Jan

> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
> @@ -308,14 +308,11 @@ void amd_iommu_flush_iotlb(u8 devfn, con
>      flush_command_buffer(iommu, iommu_dev_iotlb_timeout);
>  }
>  
> -static void amd_iommu_flush_all_iotlbs(struct domain *d, daddr_t daddr,
> +static void amd_iommu_flush_all_iotlbs(const struct domain *d, daddr_t daddr,
>                                         unsigned int order)
>  {
>      struct pci_dev *pdev;
>  
> -    if ( !ats_enabled )
> -        return;
> -
>      for_each_pdev( d, pdev )
>      {
>          u8 devfn = pdev->devfn;
> @@ -343,7 +340,16 @@ static void _amd_iommu_flush_pages(struc
>      }
>  
>      if ( ats_enabled )
> +    {
>          amd_iommu_flush_all_iotlbs(d, daddr, order);
> +
> +        /*
> +         * Hidden devices are associated with DomXEN but usable by the
> +         * hardware domain. Hence they need dealing with here as well.
> +         */
> +        if ( is_hardware_domain(d) )
> +            amd_iommu_flush_all_iotlbs(dom_xen, daddr, order);
> +    }
>  }
>  
>  void amd_iommu_flush_all_pages(struct domain *d)
> 
> 


