Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131934310F2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 09:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211694.369329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcMe5-0004PI-2G; Mon, 18 Oct 2021 07:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211694.369329; Mon, 18 Oct 2021 07:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcMe4-0004M9-Uu; Mon, 18 Oct 2021 07:01:16 +0000
Received: by outflank-mailman (input) for mailman id 211694;
 Mon, 18 Oct 2021 07:01:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcMe3-0004M3-JO
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 07:01:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d51ade07-c6e0-4207-8ede-d6f18a8d5344;
 Mon, 18 Oct 2021 07:01:14 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-UNTXLoBQO9yOMGEOXgnL5A-1; Mon, 18 Oct 2021 09:01:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 18 Oct
 2021 07:01:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 07:01:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0502CA0067.eurprd05.prod.outlook.com (2603:10a6:20b:56::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 07:01:10 +0000
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
X-Inumbo-ID: d51ade07-c6e0-4207-8ede-d6f18a8d5344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634540473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aEW+RFKkCN8E47hLxhAvmBp6BRV0oVmK/rIjpI4iU3c=;
	b=fCL1P8Ec0MaYsj+jo038eo2+vw8Z+/LdsJyTW/dszvVUZdPrStQ5oPK91uOGg/NaIhbSm6
	eDp3Dg4r8ndEIT08H5ynrksLZpOMwl6IILbraZFROdQaHRD8D+czi0d1O9MMH9MM1E8eBd
	aVb+aMIq3Cqy1R4hkyv8VHMlsoPhOWM=
X-MC-Unique: UNTXLoBQO9yOMGEOXgnL5A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpcHexVSPjMJJo0wth+MwOy2JPh6nkq1zIPkKORCgP5suVLIUM2tmxUq1f5kBTN+Q9J0+3dNlu8Im+WFQyNLZuVjbKoq6gp+X/VvFsdHUwfyccCd8qZDnyjCVpUHUAbcxZiZeKrQXF8cNZl+kDeyFZ5mnlmJcIjHN43b94e8j4WRkKr6LardMndzEyNGFB9oPzQMz0ha39AzuayxfKt4xD7+j9YYem9KhyMzfE6JTTViNEPfjEpaRRyXEy5AS2zRWzpj679VS0Bj1zYVjGDjYnZ84QBOxREo8wVsvPBePmPG1haB4ytiUCb5V+V+Vju8iDpBZZ0XFmAgQWk+vblD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEW+RFKkCN8E47hLxhAvmBp6BRV0oVmK/rIjpI4iU3c=;
 b=gnzj5xr5yAg4GR8vfHiDmlhxft6zsE+SZ6Qz2rds97ikZP0D7JMS6AucXDhuI/PBCKSyiUD5wFD1ZhcukfrnarDz7+7YCFiouVDOrGXyCAve7qEHLVDfpBBo/uuuNBA47f1BKnVH6WKG+DenQhSVJedOoN+X4+A9CR4d0/ljhBtlrBgoKAX8g2LB8sot5z7vA4Nr9uUryF2DnQkzrbMU/hEOqJWpaCQGadox6j46LxHN+D36bfUoJHpveunEKGQMjMavt4gz7EQ96GXjj0/i9O+A59OKJbZrkZgYGw3Bk/Ak4d9nLGmc9l1CwNZqWImDc/tH2Yk6L214nm/ba31v/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [xen-unstable test] 165539: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-165539-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c19e4ae5-7b2a-3b3b-f556-b2d1bf5918df@suse.com>
Date: Mon, 18 Oct 2021 09:01:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <osstest-165539-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0067.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9201d3d3-426f-4f67-10fd-08d9920510d9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB460821731810B4291CF77190B3BC9@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hbE1ilSQkx9wdVrKmiuHbhu69g+TqxYkupwmQIbuTrDbfRq4vgVT0zTMXnucQU9l8H0+mdNweKTXlQ8dI6DZGzIrSRC3f0LaIMphA/e6jfY4NgGchhuiYzElg7zlXJ6TzumvQErWW/GYfi4coBuBCaf9ke5LO2LjcXQ3AciNV/opUxhqrZAiuHaToWYgdVflJTfxkB3m6paWXOFJ/442hfy/KrDLZ3WEo4xs4FAKTk9ZjeL7OiqBpd6n/YiqemrQkhxaSipjDpHC6rhaMbQtKuUmna+9F6lMlzH/H/5f6Hr+EJrMPgk8VCX3RzDdkV05FjOaT62+njJaG5cSt+AImZahjBIk1nhaOkJZpvzVtliMmE6zA3JH0ja1/srCT+Kg4jjt/jktEWl0E4yti1gyn3Hwr9jrpKhW0dzcbhqF5TvkrGium7E1HpsswbboWB34zIYeTZkITtnQ8Rjgu97HGd6zpA6WS+hWqqAQ7F0qalMbhrs90jTAzuDwqBpUleckefAe9TiZYNnF74+4+bXMbqRYPA7Leh5KmwpRv2ZqoLIEnel1ZeIyddp4x2pQfn9dG/xildyno7OvFUD38k3udOvQ3z96+uPTapGLbVVNBgYIIl+E1dXTJf2Bd7DIkjUc79PQR5+0rPtUh+owMZdVNMWRpl86ddpQj4KVt3z9PArl5NiEkmW4lwf+2mF0QqT+Hz9PmBsCRWqKOOzC0BwIRi/egVYSKS4D4gs6r91zoRSrEY6/+wWs2tVTLoR0bQLC5C+XKwlksJsGFUIow90YypHxW6IPgcPiaR47Mw6O/4/9ZW76fN3Xd/68f2Yz+v7I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(66476007)(66556008)(6916009)(4326008)(5660300002)(26005)(83380400001)(86362001)(2616005)(956004)(31696002)(31686004)(38100700002)(6486002)(966005)(53546011)(186003)(16576012)(8676002)(508600001)(316002)(2906002)(8936002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTBmRkdlNTNDbWlHM1dKMDZONHhkQ2Z1RXpQVWI2ZTkrWVVUdTZjbnpQTDZI?=
 =?utf-8?B?bVRRVkNsZ3R3SXdITUN1ME5rOHNUV2pnL1NFS0hlOWN3aDJCSEpienJieVg1?=
 =?utf-8?B?elNOTFlQaEdjeC9VQWtiVEhvbUEvNVQ5MDBRcjYxMlhWb0NES1dRSmczUzNy?=
 =?utf-8?B?bUpoWEQvckUrc2p1N2dzOGI0RHIxQUE1ejVmWEpLd1BqVkZkOW05d0QrMkVQ?=
 =?utf-8?B?d2RCS1VodVZEanZjdTdtMTdOK2lKeVBJMFJtSER2NnF6alhwTG9zMm1yYlZR?=
 =?utf-8?B?a3AzU0g2YUJpN0s2TUhES2dJbFBwUW9zRmovem1TcHJ4TkFrWkFSMXpLY2ht?=
 =?utf-8?B?R0F5T29hYkxiSzlZNzNXZEVIWS9VK1ZsYXFPWVdpTDVJL0ZMcHNBM0VuaXVR?=
 =?utf-8?B?UnJKTmpidmMyeDI5TTJIblJsYTJMdmczckFUVGZOUmp2TXJ3clY2VFpyaGI2?=
 =?utf-8?B?TUNnN3FUdnkwTmJtREFiQk1uOU1HdHQreHVjb0xBVEVoenlZazYyaDdwT3Jm?=
 =?utf-8?B?YUI4UkhDaW94YjFDRDdQMTRqY0FGV0JubWVPNnBiSnZNY3RVYjFKeFN2Wmc1?=
 =?utf-8?B?N2lIOFIzdEJzckptZXIrWE1QeDVSejQzOWtjbVRmTkJGdW5WTkFQbGREZERw?=
 =?utf-8?B?RDJvK2RMdG9RaGdCSmR1dElhZ2N1TEdTODdoMHZPakxFRzFvYkhhWTFZdHBJ?=
 =?utf-8?B?WEk5UXkwbEorcjIwT0xCcmE2cGQwcUk5bW9qWTIyeVA4Sno0VUlNRmthMzJR?=
 =?utf-8?B?bC9QUWlOa2dFeXZHaXdPNWFnODdwY2JweEhZZ0tHSUxRTC95MndxMUtwclhG?=
 =?utf-8?B?ZVgxWFR4TWszZ05OVEJPQ0V0UUlKeTFnMGRZNnBuQTFFNzdNMENRT3hQM25a?=
 =?utf-8?B?dW54N0ZnemdBbGQ2Q1NMWE9LODIwQ2g3NFZSTjVxQjc1RFY2dXBvbWZja29w?=
 =?utf-8?B?ek1kODZnNVdqVGY0VzBrWlV3K1FvaDR4b2RkbHk1ZjJaemVMMWtvMnU4OXhB?=
 =?utf-8?B?NHF0azMzZ0NGNy9qckxrZU5zdXA5bzl0NXg3S2FLdzg4SWZPNlFKSE5FclFl?=
 =?utf-8?B?dTlUMm5NMnZ5WklRNTdLS093Q2pXTG1iQVJkUThiKzZQdlo3MlNjcExyVFQy?=
 =?utf-8?B?QkdCenp2TmcySjVqK2oycU5Fa2VzQzdnUWJGaHh6bWJqQ3VkaXZvMld1ZVNw?=
 =?utf-8?B?V242L3J6TWI1dFBHQzFET0pYelZiM3dySU54cG9XdWc3QUdGZ0o1NWNMRXV5?=
 =?utf-8?B?QmxySVlXYndUN1lBYmt6R3FzTTNpc0JGN21UeDRIVFFKb3pNVHpLMVBNci9x?=
 =?utf-8?B?YkdhaVNTaFJDUGY4bFBBbmJWUXR1US93TW1GL3R4RHRZalMzZmVZN2U4YUgy?=
 =?utf-8?B?WHpNNVp2ZktRYkd2L296RmgvTDRkN3djTGorcUpETWJDWW90Vk1UOGFVVE4z?=
 =?utf-8?B?ZUU5TzBiYzZ2RGQ5Q0g3QUlTN0FXUHhCS0VZc2RRa0dJWDZtbVlON3RCbjEr?=
 =?utf-8?B?bzhwdVR5V0ZCaGprMVFBTzJDVzNxK09SbURxVS9wTUFrRHhJL1pRK201UVhl?=
 =?utf-8?B?UVNzYkR0akl0ek8vVXhkMStiNEdneU5DRHBwRk1sSTVjYlRYME9GRy9ZOGJT?=
 =?utf-8?B?bVA3YmR1N2s0VWhNV0xIYXV5Zi9RL0pDdEdQL3lPYU1RQU0vSnhMalZnN3FM?=
 =?utf-8?B?VzlUY1gzUEEramJzd2dQYVJLTngrd3ZBc3lhanZuMXhDUFVEazMzZGZxT0tj?=
 =?utf-8?Q?iE3BS/ASvvnP5zLieEn/OJ1Cyo/QGf+THb6PCFP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9201d3d3-426f-4f67-10fd-08d9920510d9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 07:01:10.5448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19C7LrexDgxC4aF/DB7Dr5N33dxyNGTtDE4oY+qn5JGv4ER8iuRLLYrkaMVcZg/JOQpe/7/TSJE5WFdihAMcjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 17.10.2021 01:43, osstest service owner wrote:
> flight 165539 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/165539/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 165524

This failure looks to have "resolved" itself on the next flight by having
got moved from albana{0,1} to godello0. I wonder whether the underlying
issue is still there:

Oct 16 18:03:04.051396 Booting from PXE Device 1: Embedded NIC 1 Port 1 Partition 1
Oct 16 18:03:04.207398 
Oct 16 18:03:05.215362 >>Start PXE over IPv4.
Oct 16 18:03:09.163371   Station IP address is 172.16.144.59
Oct 16 18:03:09.163389 
Oct 16 18:03:09.163395   Server IP address is 172.16.144.3
Oct 16 18:03:09.175381   NBP filename is bootnetx64.efi
Oct 16 18:03:09.187377   NBP filesize is 435712 Bytes
Oct 16 18:03:09.187394  Downloading NBP file...
Oct 16 18:03:09.187403 
Oct 16 18:03:09.247368   Succeed to download NBP file.
Oct 16 18:03:09.247385 [0m[30m[40m[2J[01;01H[0m[37m[40merror: serial port `0' isn't found.
Oct 16 18:03:09.343393 
error: can't find command `timeout'.
Oct 16 18:03:09.343410 
error: can't find command `label'.
Oct 16 18:03:09.355420 
error: can't find command `menu'.
Oct 16 18:03:09.355437 
error: can't find command `menu'.
Oct 16 18:03:09.355446 
error: can't find command `kernel'.
Oct 16 18:03:09.367359 
alloc magic is broken at 0x7a59fac0: 0
Oct 16 18:03:09.379381 
Aborted. Press any key to exit.error: you need to load the kernel first.

Looks like a broken grub configuration file that gets sent to the
system.

Jan


