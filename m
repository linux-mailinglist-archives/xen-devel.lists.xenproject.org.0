Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD364873E3
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 09:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254292.436018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5kGs-0001eB-0m; Fri, 07 Jan 2022 08:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254292.436018; Fri, 07 Jan 2022 08:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5kGr-0001bs-Ti; Fri, 07 Jan 2022 08:06:45 +0000
Received: by outflank-mailman (input) for mailman id 254292;
 Fri, 07 Jan 2022 08:06:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Ee=RX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n5kGq-0001bk-Tn
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 08:06:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c08caa63-6f90-11ec-81c0-a30af7de8005;
 Fri, 07 Jan 2022 09:06:44 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-zt_bKHsrP0e4t1LnmdB_wA-1; Fri, 07 Jan 2022 09:06:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Fri, 7 Jan
 2022 08:06:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.017; Fri, 7 Jan 2022
 08:06:41 +0000
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
X-Inumbo-ID: c08caa63-6f90-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641542803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1vhAduh4y5UlrlpT84yeVpiOvSj5pIwKWT4EKhf9AI=;
	b=mgR+xqjYJxKOuJ3YbqaU9MzrOEwE2WKpKtPRn55W1uXuoaAfgQLEgmsAdpFOEbKenu7Dfm
	XvCWKTK0jtFu92prrCJFOsZOJoMV92HuWSGmdYrHJG6PUanSKU4aUT8WRCiOmjGncEejI+
	gDB7b8dYRh0Zh9mgOE0YUGY1HD+A37k=
X-MC-Unique: zt_bKHsrP0e4t1LnmdB_wA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpN/QeVf3BjZisizaDN2hzBD/9m+FrQoDIG7koyAFHVeCgrzCTldx3UBfNWzL5PQUnK9q2yLdqM3yP6QLPm9vakb2Nb/fKwIQ5CCg2yEuIw0VdTTXzQffufnxdCkvEsHHORWNPOBTpzktA8ix1eokmAMFR6REXMEli2Z7/0W1Hb8kS0lUoQ/n21RFul8sHnFOK5ZeQeWYSWGaIKtW0VCxqKEbSf7Y/4vgWc7uMslbTkuzvFNWl98lYm8dNtCJpKInKDzn1Kg9Y8iht11K9tf76fC+i1emro28Q6Jc5aC2diO0iE9Ng1CQL/6YQp76aVBnYDBIQ1LAdCeDP+6o7yibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1vhAduh4y5UlrlpT84yeVpiOvSj5pIwKWT4EKhf9AI=;
 b=iQoC+s7Upt8UTKYQbb45hwEavZKA56jvvT0OTzNrLOvnBsGdKtSZONUEXnccrJuq5qrFmaRLfntAd7zSkDpuKs+8SF/9BEE5SZGv8EDWw6bKHpYMGFgcxyPv/gH3WwGbRd9DxmeTgUbZHCVxwJ1j5wCO0n1t+1ZpU9mJQMEAf2y6YtXKM09FbY7gX4bvJv4I92Y5JG0X0R96P+f8tzXxFy2kU+b6X7tqXR0v459lhzOgLdy1G4RWpwZ+5QM85wq4w4kGYNU3ysOLu1z2q78oHyM9Si+dsn9rQK/pUt7BGrVmiGHhl1KJppE1hCrn3oCoXJ56yhul16rIX1RDiULBKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77c8a25b-b98d-6244-ca86-01487449aca8@suse.com>
Date: Fri, 7 Jan 2022 09:06:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: preparations for 4.15.2 and 4.14.4
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d78054ce-f579-c0cb-8e0a-1c3ecc36e819@suse.com>
In-Reply-To: <d78054ce-f579-c0cb-8e0a-1c3ecc36e819@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0043.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28a6ae81-2c1f-4c62-da66-08d9d1b4a313
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590155805F62096173672F44B34D9@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pOGg3+COLQBxa5je9O5MeMreuxY1lDPoMJJXBevcaj3IwoqocPz3n93uwHpBdT29EAyrsmghJDNp6U7ZPKhqecjWaRrG4iHS3EqkhGr4kS3poq/FDSkzrKpv6q7/cXfiw07N5KtNrfspsSKC2hGqB12HWyydLYYNMzaU/dxhmlJJle5CAKkPiNzFqw8gygEPOR5nD6MIX7ipp0c/HBv32wa7XWbCQ/X0Uen4MIuK3L33UFL0kDKE2P0GrCROxOwUEPlk3zEnmQQBmRfPS+hLVHyGQn2hPQohUgDjLrwDZtdRqoVFcYMr7LAGBZAl55mYEnZ0wG3MeYsH1fADs6ybZ5PRLXsCHwEEDpN/Is+gz0KYNoJB6MPmSncxtZxNeTUBz7rY7yyCjfB2ApdF2Nmao+VXNSQ+ktgUmB1LosHWL3vIGA+mTsuz8KXY5hqGaOqjS9HNoff2gYwPe/B+Uo8gNgS/hASWK3EcuejkIMo/WTchfVVCyWFp/GvB+vApadMAh3gx7WnvF2xhzx7x0W/VwJTZAgG06eCXQCjW/VtXb3IdNJZ6H4pTQIEVBumRziB3HSLMzuK7P9U1taqvIGC8Z+U1AqK1WPX7AwTC7GWXilByu306fVZk546MhKmkfvnt3kLylODubxtrov4qR2ugffVdw4YtRAX5zNTngjXmfe3M1+k5jX8Drct1AqGt9wvqh8hS+ugiEslUGoCLocLX88Eni9DiG37qMv1ShBsIFYRF6Y4qQB1dalw33UHYZuQ/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(83380400001)(86362001)(2906002)(66946007)(31696002)(66556008)(66476007)(316002)(36756003)(31686004)(2616005)(8676002)(4326008)(54906003)(6486002)(4744005)(38100700002)(110136005)(8936002)(5660300002)(6512007)(26005)(53546011)(186003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlhOZjdEbzdzejZtbHBRNkl4MXBPSFNEWXVnN2haWmVOY1A0V1VtOHVmOFRw?=
 =?utf-8?B?MkFwNkJPZDVVeDRHQnlsVnk2STZsUGxyOUYzREo2V21ISXVJU2NCcEplUDVJ?=
 =?utf-8?B?REk0QVRYYjVOK3paWHBrZjU3VnBySFBKeHZUcjNXa0paMFkrdjloUWNhODBL?=
 =?utf-8?B?cVlVdWs4UnZUTGZZU2FIWDhzN2RjWnR2bFR3SDZCKzBMZ0ZsL1JIbE9BeHp6?=
 =?utf-8?B?cFhDOU5JUmVSb0ZyWVpNYjNCMzF2aHY1amtNM3lkUUFvYWxVWGoySjNWa3Ft?=
 =?utf-8?B?RmcrUFF0Q01jSWs3RHlxaEsxazhQRSt1c3NlcXNFcTdIdUJUcnVCaDJxUzcy?=
 =?utf-8?B?MnJ5KzBxckhPZVZNTHliWm84aWxFbldlMXJzRUxlSEt1UGk1SmxCZiswY3Jw?=
 =?utf-8?B?Z2FRVElFMTZwYzk1OW1zeDdETUV4VXQ3N2xZRDBMK1JjNnJUdU5ocWpSR2M0?=
 =?utf-8?B?Y0p0d1BiMDBHRnlrQ3NvYWpmRWozeEsyR1h4UDdoUmFuTHFQRDkrb05UMytz?=
 =?utf-8?B?cG5ML2JCQTVKdEsveVV1bFJDeVFkQkFCdU5RWG5ZeVlYaTVoOWVmMjdJbUFL?=
 =?utf-8?B?eG85MXdnY1B5aE00OXZyVy9MZkh6Mmk5MGxIVDJyaWtoam45bVZqTXFsZ004?=
 =?utf-8?B?TURWeXV5bnl5cERmQzRpcWd5MDdBWUNTR245OG53VCsyRVEraEoyRVFoMzlY?=
 =?utf-8?B?TmlkeVY0blo2L1N5Y25OUEFkaGVpVzRKYTZ1Z1JSd3JiY2tpZGNwZXFoU2tx?=
 =?utf-8?B?UkU4VUdnRm9BMC81aGMyY3dQU1gzOHR2N0w3c1NlRDBwSU9tOEZhbThWVE1h?=
 =?utf-8?B?d2tjN1lwcW8xWVBuelRUZEt2czBkK2crV2NMV1BnSms4dmt5R0Fab29MUGFw?=
 =?utf-8?B?ZW9ENGlIdFdiTzdUVXFoR1daeU41bTVoakdTU3BuUDBMUjNNOG9GWXdPSCt4?=
 =?utf-8?B?azFUTG5xUGY3RG9oUngvbHh2QzhRaDRoV1UweFBOOVIwM05JQUs0RFRXT3pI?=
 =?utf-8?B?ZzRHZGp0cElGbVFxa0RhMWZIZ2VsekdqVVFuMHFBYXd6cmZkVFA5cUZYdzF2?=
 =?utf-8?B?Y3o0dWxaUXNGZE4rUkFuYjdzdTBhbVRKSzR5UTFSaHFuMUZYQVp3V0MrZndL?=
 =?utf-8?B?ZVl1U09WcnQ1RzBxYi8wZUhyMSswUGdFY016OWQwNUZZekxHQTcvcEp1OE1H?=
 =?utf-8?B?czkrNFJiL3RqNTh3a1RDYWtKMHFaSStOajNqcEFOZHVZa3pNeisxSnk4VXlw?=
 =?utf-8?B?elRmYTgrODlsblk4N1JkcjZBTjlNcEdsSERobGx4L01OZEV6WnUwcWtjRnZs?=
 =?utf-8?B?UWxWVVgvTnhmSDRkMmpZbVFEL3pGb21IdnBtNUpSdUw0UW5Kb2RxRzNxVjB5?=
 =?utf-8?B?T0hFZmx4KzBPYWFyYXNZOHBCQjFqU21SUXE5bm5Cc2w0V3dySTVXT1kwWXpO?=
 =?utf-8?B?eXNCUDFnZ0Q4TnJuNGpLOGJXMGJ6cEpFUEd4b3djcGVXQnlEVHNhYUpOTU9S?=
 =?utf-8?B?NyszN3EyM0FHWS9tZ0s3bWY0Y2tqZklsOTlLbGwybmFqamt0YTVhMlA4ejVw?=
 =?utf-8?B?VTZEeE5odnRYa3dhMVhuVWlVSVFJRTllbzVVdWRJNXJBa08vUnM3dVVMWStK?=
 =?utf-8?B?amt6MEZjZERYY3lEYnJHV1pWbHZRZk1ZRGpObVMzb3I5RVIyZlY0eHBnOS9M?=
 =?utf-8?B?cHlzQUNMVTdiajJjNTYvL1BsVkNLbXFMeVBveUdwNzk4T3g4aFVBVTFlY29j?=
 =?utf-8?B?SWtKRDJJMmU2bEpURFpvSmltejBCRUZ6dHN4eWlUQ0w2WGE4N1BXTS93YlVj?=
 =?utf-8?B?RFltcGYrTC9EcUI1c2pqYU1CT3NGUHI1RklaWXduenljVjA2azRvNENsMnR3?=
 =?utf-8?B?NGozRENnWEQxTUwrSnRXV3lFNkNvS3d3RHRnSWlUMGNKcGZBVUV0RVg4c3Q4?=
 =?utf-8?B?QS9NTkVVWSsrOFZ1Qmw2d3RuazJDM01lRmtkOTJWTStlUVdzUDhsQktNM3h0?=
 =?utf-8?B?T3RJS1Flc0dTcHdidW8xOXJLRnlrTkE5V3hIQXcybWpkaUk4dlhCS0FYNFNR?=
 =?utf-8?B?UGQyV0dWSkxZSVZBaDhuVWhsNG9nMTFZYTFBcUViVmV4b3pxOEZJMnovOU9S?=
 =?utf-8?B?YVJXWVdDVFNhTUQyc2ZYOHhMT1N4ZUNWYnQ1RER6TEVVYjdSK3VEZGNmY2VI?=
 =?utf-8?Q?Jf27UJIHUWYGktcEPkOx9Ms=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a6ae81-2c1f-4c62-da66-08d9d1b4a313
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 08:06:41.2180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijd/MW+aBbSxbWwu22m1LSI56MXMjmvRQHQLF+OPjnd7U4hfd7sim6rDB8VpbhPklRcSPh5uXiarzlHiSACFdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

On 07.01.2022 09:03, Jan Beulich wrote:
> Please point out backports you find missing from the respective staging
> branch, but which you consider relevant. With Ian's departure, tool
> stack backports (if any) will need some extra care. I'll try to deal
> with requests, but I may seek assistance in certain cases.

There is actually a change I'd like to see backported, but it first needs
to land in staging: "libxl/PCI: defer backend wait upon attaching to PV
guest". This now has Paul's R-b, so I'd like to re-raise my request for
a maintainer ack (or otherwise).

Thanks, Jan


