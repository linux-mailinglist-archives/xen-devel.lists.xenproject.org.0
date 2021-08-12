Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BC13E9E5E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 08:20:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166198.303506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE43X-00073D-H5; Thu, 12 Aug 2021 06:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166198.303506; Thu, 12 Aug 2021 06:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE43X-000708-D9; Thu, 12 Aug 2021 06:19:07 +0000
Received: by outflank-mailman (input) for mailman id 166198;
 Thu, 12 Aug 2021 06:19:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QHFb=ND=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mE43V-000702-UT
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 06:19:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 306763e8-fb35-11eb-a122-12813bfff9fa;
 Thu, 12 Aug 2021 06:19:03 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-Hpb9fKVyPaK-91vJtGOzxA-1; Thu, 12 Aug 2021 08:19:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Thu, 12 Aug
 2021 06:18:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 06:18:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Thu, 12 Aug 2021 06:18:56 +0000
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
X-Inumbo-ID: 306763e8-fb35-11eb-a122-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628749142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OmTiY1w5jVT0tuKdZpAX6o+y1qfIcJz67cooNmJd/DY=;
	b=fZeKuJP9Qt2eFjVcqc7EIwfhCS1VnwrA9qiqdCphuSWyXxDveTu9++uAFLm7ZuflLOedVC
	3q5sThvVJkyr4wCJZ5Q3s7FiNuQqxe6YEjS9nm8/lYmhebwFceZJ40z6jzDYmafluIHdjV
	+cKlo86S2FDY1tjbmJUnwUDHzefF/oY=
X-MC-Unique: Hpb9fKVyPaK-91vJtGOzxA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+8mVmcGrlbtdF4YaLofOQincWPdOGbmCD99zMHdHPWyYbvI/tM+XPstYCg+T+JjumSaYkSQaNB4StE233tJ4ZNuwXvBSc0S6Xo+ahaq/3RZjocLaPoTRZLnfJyz0tJRlbZSbGUZbtrHkCZLywNnnHYnVd1KgwOq0JhD8DQptisu5l3bGnC/yvlo7y3AjxQ/fMIcwBBLs05HMc38YIQJGewSNBr1TM6utU4ws4z9gkwYHJQHeypTH5XBJIHBm8nP09ljVkltj5yshWr/2PZEnzVOGAd7ki5gPT+2N6/Twtz7D0mnI1D5c0ybm+cCIOA2e4D8dPUfutH9+85cvcUQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmTiY1w5jVT0tuKdZpAX6o+y1qfIcJz67cooNmJd/DY=;
 b=YWJCwAd8GrXTKqR4sjoDIzXtBEW9z6R/1xvkPFOABMA+CZrGiVVraN5iheaVheyjIW9Jv75vMJZVNjcmWa2ritIg7yR0ahNYLhAj/uGMi6wRrrYsAoyzIowQ10TfjF5qPgPh2o5x9ucEQElWd4WYkapNZxjhVg+e3Uru9Gk6f9Qy6cBtkG4u5qJbHjQ5rbOodTa8lFKa+o+ktrU7oyOt/JoM/Fj6/YY4T9PiVfkQPnxrxzInZ0FQDyEosPn+5/Clenm3BKcboWE1F2xzLmvvlzzSGdFj3JdIi6Jgjhxh6nohB93ctY7X17lyEhITtYoU04v8vVQQ8rz8og2ESIHuHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] libxl: Fix stubdom PCI passthrough
To: Jason Andryuk <jandryuk@gmail.com>
Cc: pdurrant@amazon.com, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20210812005700.3159-1-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <30354256-4527-d909-8453-28dd384a35dc@suse.com>
Date: Thu, 12 Aug 2021 08:18:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210812005700.3159-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0014.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b02e836-0432-430b-556a-08d95d591150
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71490D83E792F07BCC453913B3F99@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YhTzJpx4uvg8P3SxCyHQOKHc+vzwFCPgbmJdruYKKn1XmbEHFLLDNw9M0nopEtpz1oqP4OMrJw94dYS8pQmlzk732r7QARUTUSgsipzvM2dB3p4B1unNwSlryhHKqsiQGKxYpf3wwr0cQTkKCFYikTKExaWAq+V9PGf0F5Go7uZguOmswUTtEdCrEuUDph6NyFvY0wDpAToycSLlKqUje640qfESfxMWJ3OiueNROttajKVA60oUvQJp018C3h6n6g/i9358lwV5Ddne78WIL2JCZ7FxeLP+Ua/ku2oKMrLz4mINbClbKgHmP+i+whjIm3f0n3/jmtJoVedshqyu8+dpwOG7UrmcA4+pw7emGVujF4hjq0i72SzhKBZm/q9hC+jHDUwKpFzq833XA4dvu2rPmzz5z/tMMttSU15Qbz54WibhU+hQTj5pkNZcbE2wzi2+WN/u4eBZC+mY3Ee83eOiYGO9H6VYgMvMNqbgW8omvh6K6LPQYWHmU+oqajpuj5hsEJEZDt9fthfwc+i7ruwUdWBAY9H3QnhaHEJL2CngSWVYppYqmr8hrPjTlxoKI/aML2vtQ26fFAzvPIWf4Sl00gU4rCvhmfVTRsmTMGZ/3czCnjewGGj7e6ciyaMVDmOSxLoSpG7zbKMWor+0NzE4DHkdtNy0M6583bOC5l7de/evYASFVkW+Pd9Okw2GQ1uMXeHblm39wMIXIjEoKspQmFE8Ad5pGLgKmlfHdnM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(316002)(4326008)(16576012)(66556008)(54906003)(508600001)(36756003)(8676002)(53546011)(6666004)(66476007)(5660300002)(8936002)(2906002)(83380400001)(31686004)(66946007)(6486002)(186003)(31696002)(38100700002)(6916009)(2616005)(956004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHkvcTQzdVVSRUkwd1AzSjUzbE4yd3J6Tk5SaHVPVWZmSkZzN1ZQVkZaaUZx?=
 =?utf-8?B?WDE2RTYwZ2lCNGVOdm1qK1p5NmlUd2NLeEF3azVuMXpJUVdYbDFUU0hFc2RL?=
 =?utf-8?B?RlgvaWdQVXVRbno1dkorZUN3bWpoRTVjemI2bTZXamhreWkwMHc0OE1ZZysx?=
 =?utf-8?B?R3pvRmFnaklwTTg4TDIwdUlEZHNaMkpRSmd0MzVnYUZjREgvK1Y5ajhuRFk1?=
 =?utf-8?B?MkU5K2F6RW5jZktTREhjenhKUVh3ckZMS2VPWW5DTmk0Yit2bkVEVndpMWxY?=
 =?utf-8?B?S2ZxME5hUEc2YTVxTE1jUlBjb2s0N1BaaVNhQ3Z6TldpMWcxV3pLN28xUGU1?=
 =?utf-8?B?U1pIQm9xZ1ZPZUlMdkJaU21MUzZCVHliZ3JKVXQ3UCsxQjdteTVlRmFiK0xv?=
 =?utf-8?B?U1JWSmxhZFFmeHNFTERXSWJwVmtVd3Z6TTN0OExROWJGdytEQXpoanJUbDZh?=
 =?utf-8?B?cG8wM2lhSFAwV1FoZGE5L20wOU9PdTZCcXJMNi9VWWhPVHM2blgzK1Z1dnZm?=
 =?utf-8?B?aThrTGJCKzZaVTRqL1kzbWphcnJTcnpSUU5CQm5WQmhERWphbEs1Q1RGSWRQ?=
 =?utf-8?B?eXkyVGVzZEllQmVqaDYvZk1jcHlNUzJoWkJpTVRWeFlBQjFnbGVtdENVay9x?=
 =?utf-8?B?MUxjUmZJMzFHVG5ya09RZkxBN05iSTNmTERoKzhlSllDMytvMUt3ald6VXRV?=
 =?utf-8?B?QTRJUnJVOTZUZklxc21XLzN3WWJOUm9pMkxUUnpRY21xY2JONWZWaE4vMkly?=
 =?utf-8?B?VVlSM0tMdlpVaFIwSUdWSVBLQW1GbmJKcjZIOUVsMU4vUUNzMkF5MkZOZmNL?=
 =?utf-8?B?S2xsZTZOVm93VVl0VUZwUUZNbmZQbjhlTC9xQzZIM0JwcmY1QUN1WjVIVmtG?=
 =?utf-8?B?MTdSRzJ0SWVKTDRFT1RlZW9vcW1tWkhPa0xnaE5JYzdsMlpEWHpWZmFiZkk4?=
 =?utf-8?B?TTd6eFRQZFQvc1pnT1c4aGdoWEttVW5odS9sV3ZYS1I2YmNiRHROTzdrdmsv?=
 =?utf-8?B?MFlGckxvaXVKUEorZGNwK2NvcGYxdEcxa2RpaWlVaHM2dnN4bURla212Yk15?=
 =?utf-8?B?RXZBcmkyTm9Na29ubjdyWkRGdFUzYWM4OFA4cUtxVkZXbHNtR0ZNZnJtejJC?=
 =?utf-8?B?MHA3OUZFeGZVNnNabUFzYXRWcy9zR1k0aUlTTHo0eUUvYk1TWm05RnVwWTlZ?=
 =?utf-8?B?aXhISlNBSk11SWRVOGQ5clhkL3crTExlaE1wM0xsRkhiT2dOUWgvdHRkUE1y?=
 =?utf-8?B?dnlYdCtVMnFTSnNTcWsvZTJ5ejh5azY3TDdEUUxhdytIVE5PSHlsdkEyZWlz?=
 =?utf-8?B?M3F4U2drM2xuRmxhQ0IvSDlRV0QrWFFVcnpEM2hSMjVpM3dmSTBOeEhnM2Zw?=
 =?utf-8?B?Zk5FMitudFhJUTJqTXpUME5TVlJVZzFYOVRvTU93UWlyNVFKMzYwMWJ1MW5p?=
 =?utf-8?B?eTN0UFpJU2R3ODYzalN6djdNcmF2a29LOWg3M0l1cFJkT1djZ0NmcFJXNFBk?=
 =?utf-8?B?QmJrZG1ENTNxR284dVFPRXgySFh4NGl4dSt6V0hCeDRaMzI5L3pVZ3NTWmoz?=
 =?utf-8?B?SFhxOUFoS1V6RW1zbnM4N1UwRUk5UFowcFVyMHlEUUkvQUttZGhyeTFicU5O?=
 =?utf-8?B?M2RFbXFsdHhIU0VaSk9xQXpTd01GbW1wOXFWajU3Ymo2ZEhoTXVsZ252Z1pH?=
 =?utf-8?B?NFl5VU1WQkhkVkJrRjRrRGowQVRyS243R1hPU0NMMlk4R2lqRXBrbm1xL01C?=
 =?utf-8?Q?vLtOgXbwszj9ZzJxq8tO/Heg2ozqdgLBUT/AiyU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b02e836-0432-430b-556a-08d95d591150
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:18:57.6574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rONGUSv9Zp2ecwUaQ/nbwOg9UEWX+NfYMPUHSGeUdXCjFqPqBZAN+RoB8oZwEXKZ0qXUy8hZTTll5+paqNSyvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 12.08.2021 02:57, Jason Andryuk wrote:
> commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
> reflected in the config" broken stubdom PCI passthrough when it moved
> libxl__create_pci_backend later in the function.  xl pci-attach for a
> running PV domain may also have been broken, but that was not verified.
> 
> The stubdomain is running (!starting) and PV, so it calls
> libxl__wait_for_backend.  With the new placement of
> libxl__create_pci_backend, the path does not exist and the call
> immediately fails.
> libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
> libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
> libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices
> 
> The wait is only relevant when the backend is already present.  num_devs
> is already used to determine if the backend needs to be created.  Re-use
> num_devs to determine if the backend wait is necessary.  The wait is
> necessary to avoid racing with another PCI attachment reconfiguring the
> front/back. If we are creating the backend, then we don't have to worry
> about a racing reconfigure.

And why is such a race possible in the first place? If two independent
actions are permitted in parallel on a domain, wouldn't there better
be synchronization closer to the root of the call tree?

Jan


