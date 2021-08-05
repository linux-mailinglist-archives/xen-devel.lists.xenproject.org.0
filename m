Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 697063E0E3F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 08:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164113.300330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBWjj-0004UU-H7; Thu, 05 Aug 2021 06:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164113.300330; Thu, 05 Aug 2021 06:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBWjj-0004Rp-E3; Thu, 05 Aug 2021 06:20:11 +0000
Received: by outflank-mailman (input) for mailman id 164113;
 Thu, 05 Aug 2021 06:20:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FJ0=M4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBWjh-0004Rj-W2
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 06:20:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e52c67b-f5b5-11eb-9bc0-12813bfff9fa;
 Thu, 05 Aug 2021 06:20:08 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29--P8oLvc_PG-ZllhnTewraw-2; Thu, 05 Aug 2021 08:20:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 06:20:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 06:20:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0023.eurprd09.prod.outlook.com (2603:10a6:101:16::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Thu, 5 Aug 2021 06:20:02 +0000
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
X-Inumbo-ID: 2e52c67b-f5b5-11eb-9bc0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628144407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLqRPVGntwOlhd6ChykLbliTw/advFDueqsL8uqymi4=;
	b=U69cUOB1T8aNtORjCg2Rirqcf+e3ZaHETGVBCGeYu4+9rRe8zOI9Yr3q+e5sJtaukXxNZU
	yNMP2cVMJtid1vOLnh50B3urbqEGVofJRiwfJY+w/xnlsoJkv7Fc7PsLCg4BejRi7lkLrF
	itcfpEjSJq2YpT/bBQZLpixNYlIR8zs=
X-MC-Unique: -P8oLvc_PG-ZllhnTewraw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFjTxjHoyh9R2WU3UycQTL4tHfaJEaUPa1Z8T0HyAa1UQa91kR+7VrFb5HBgJ7Rww9KMLjnWQyKXqM+4fleMvKaQn5pUPUfU/VJiSg2TOEZNcl0en0rp9sr5bQquqt8j5X8CN65V61uYgQl7GA5rJbMX9LYPJLT2V8NCsLwKQD0fBMIS+EcHvao4NzxR8nGIileKHOtAd1akh1u4vfa/rkntDhUPnd0lDqzRZ7c9CISYHTWjHIe0VO44XRYrx5iq3t/1N5yLjsu+w+u3AZX6/sfhg386T0EZcGIz/vob/1QwyhT+oD/Sg+q6TCIkR5452qukDtS1SGMBS6SwxcSGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLqRPVGntwOlhd6ChykLbliTw/advFDueqsL8uqymi4=;
 b=Sk4HG5vDinHSfhMyxxznIKaqtrYLAEsxDa0A5gJbuVj/T0iz+Aa09QXyjjY6546B5Napsm1Kgj96wb+bwLkN8GdN6+jhq4KYqd+WBZUW9TtvBgvrLkUeztQ0P+BpJFR0YLc7lGkzhK5AtncPFi8eoiwxCkR0KyHv/vbgnTAeoR+Si4Dn9X57IHpyASs5pGhFBKoPZjiP0JZpR4+/SSqskBNV1o6CC4EZm43NZAvA/jiE3SWCwbp7Pc3KiTwv4BNJZpyHvODNFpilAOAggBTiDf9lqFpD5s+wtd1Z/4P0FgjMPSNw1zE5JlgAsCLi9ZScgFXOdA5JU6Uhg6ifjUqtbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] libxl: Fix stubdom PCI passthrough
To: Jason Andryuk <jandryuk@gmail.com>
Cc: pdurrant@amazon.com, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20210804221749.56320-1-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cb1b8918-639f-668f-c663-a6392a2d8e1f@suse.com>
Date: Thu, 5 Aug 2021 08:20:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210804221749.56320-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2PR09CA0023.eurprd09.prod.outlook.com
 (2603:10a6:101:16::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d943f08-ff0a-42f0-138b-08d957d90f91
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3774932B88E42656AAB9FC4FB3F29@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SnPjfmEL2RrNtIwcLoK4RKFXW3qSiq0RwQmwvGXDb2Ez0h5h+qzblte0jNOxC/VxkHP4b00+NEuPLtTg632PIDSOY2JHsWc1p2xyCKSZ0GmxURJiiz+Pi7eY5ATgXlU1ua59IyBQEMGFBLDPI+cNUcFLCLusjHVJfd6Izw8Cgyx/Ih5xJs9YuvKJALZlGkVBIsgB/YsR9q7eH9TAp5Mo2t/9FoElY9yDAa1FRtvqkMLrsK4JEX+09HOegUQreUiVJuRYO6jV5rZ3cgNVHh+3sgIF7DWUWknxyeCMe3xASFiP1EbSrqAxb06djOddJG+rFCKcjokeJ5UKhm6+u4UYi+DBI8ho0/dgpg5xwHwEkdCQx9EuWosckjm+bgD4onk4nC4LsSGMEI9ykbHLpmWxF6X17dS+5Uj/nQCk+Ip0L5GtJ9ttHxoq3+F5popXp6plv1/q+VW31jhkbldEEkgadXB8DTEd9jFyHd+giJf9K6H0P0JSyD/3Aq4OGpWdSZt8Og8CGoxnGvuTlYcTTGUnKrXTr4yfoFdXqbrsWU0gVdZ56p59IA0pG/VX9ElaOdlDQOe2jEj01sjMb0AjvZCxiJqQ789GMOjJhbCkisC+rxgJ/pJ7N8klrQWERXhEw/xnDSKmgP4rrvyCahqY3mFOMlCowkv/VvOA3QS/snbTOvcn4R/Cd6fg/zF3dFfiu+AVYZkmC32uieNlczQucG5vADgbyDWpnofBjRhVdNoTnRY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(39850400004)(366004)(136003)(346002)(478600001)(316002)(16576012)(36756003)(8676002)(8936002)(54906003)(31686004)(6486002)(53546011)(86362001)(31696002)(4326008)(38100700002)(6916009)(2616005)(956004)(5660300002)(83380400001)(26005)(2906002)(66476007)(186003)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RS94OUpSYzloTzNWL3NkNHVHOEY5YVpNL3UveUdsZkVLTStscWxmMy9GNWpi?=
 =?utf-8?B?c3F2MTZPbEZGdm9rTU5pQ3ViWklLeHRoVEozMGR0MzEzS1FYNUFMSkt4S1hT?=
 =?utf-8?B?MnAwTjBCQXVjeHFGb3JvdlBjeTlIdS8wZkVtM0NKZEl0cWw2VllzeW5xQXJ0?=
 =?utf-8?B?VzRLcVF4eXh0dG9jeU9ybHFyK0IzRGhXMFdjNzBmZmVDQk12S3RHK2xpclM0?=
 =?utf-8?B?UXY5QjVSV3Rad0VOQm1CMTBINUpsRHZXUTU5NkFZKy9Tajh6SDFjVjhyWFNk?=
 =?utf-8?B?aU1BQlVyem8xVmt0L1duTTlRL25zWS81SzFhb1NXTFpOUzlQYXJuTDBIMDN4?=
 =?utf-8?B?RHE0ZHB1MEJXRDhEZENyQWJDQVd1dlBzYTBnRGZRbkw3OVZJQXRCRFBEaTRj?=
 =?utf-8?B?SzBFYWZBOVJhZWhOOEVBNWE0aDdndXFDN09qL21IVTlVYmVOVGlHR1Jaekp4?=
 =?utf-8?B?ZEEyNGJQZXdVeWhqNytXWnlzOXdqcHhrb3hxQTFxRm9YTlJGTVVreEEwMW55?=
 =?utf-8?B?SWJqdElLd002TUQvcmtCaXJJZDNaNTFNSTNBWW9qcGg5RkJmMEIxdUZCVjMz?=
 =?utf-8?B?RWhNZTNaa2dqdmNQNDZURjkxR0hyUTRBZ0hVWTUzNUlJcllBeW03dzYrUVVW?=
 =?utf-8?B?V1NTOE5RR2VsUmJ0THkvM0EzZFFCT1NzWktMbG9mTUNRMzNNY0tTUnFVZlZs?=
 =?utf-8?B?UzN3aWl0WnRnTndFb3pOMTA3VlFrd1pwYU9uRVIwL1h5SS8zNW40VjhTOXZp?=
 =?utf-8?B?L3FIRUh0OXJrUUhpalFHTVVRWFZHTXNraVNmY2RoT0VsWENQYk56Q05Ec1hq?=
 =?utf-8?B?Y2xxU211WmU4RmJGYmFOd1o0Z2dSM0FWRE5sV3Q3VnpRSGUybkFjVmtsRGN3?=
 =?utf-8?B?RlBKYWtxTVVtL0Vnb2lBVVN0eTVqYnFxN2Fpdk5hQTFXcWVvYVcrYWdBaG1W?=
 =?utf-8?B?bUszNkZlVnppYUJlVkpmaWtnTmhwWHlCcTQySi8wQmNWM0YzUEpwTHdpOVdk?=
 =?utf-8?B?ZEUxTVYweEVYKzJRTStOSk1tTS8wellURFZ3OVJBSWNQRDBLVTc0SnRiSkhP?=
 =?utf-8?B?YnVubG5QQTBaTFF5NitiS2lRQ0xIZWErcFhrRHRlOWxBdUppVmNpNXp4R05W?=
 =?utf-8?B?ZldwUkVaZUkzQUJZQkRGSEVYSGVFanhodU0rSVNyVVVaaFp4ZENhRVJXcUVy?=
 =?utf-8?B?aXByQTQrbWRKUEUyZTc4bUlrdFc1U0hXV1VYQ0RLd0Z5b2hZWlZsUDArdkRv?=
 =?utf-8?B?SWl6NmpkVFBFR0k1TEkvREorTVNUTC9paHNRVFJiNGxiL1M0Wml6Y0dnTUhT?=
 =?utf-8?B?eUowVlg2WWZsSFd2bUF3cnprdmRhY0wyNFJWcnd4K0ZMcDRKdmg5MitkN2pl?=
 =?utf-8?B?aWZYMFdqT1Zuam5URXRFTEZTQ1dqNHNXdXhucktySzRYb2dqRFNyMFV5endF?=
 =?utf-8?B?SVRUdEc3NWRCNmN2ZnBvS0FsUk1uemFkTUIvRTNTUFVIcG9PUUhjQ0kxdkJw?=
 =?utf-8?B?N1JSVDR3RFpQWi81VlFCWDUvSGVqSmI2VitpZXFta0QrRiswbHQzdnpKQlFH?=
 =?utf-8?B?WDNOUXdEemMydVh0NkcreHRzc0taN0daaUpRNkhESndrK25Mdk1HRDAvclND?=
 =?utf-8?B?VTZGd0E1amR1NGx2UTN2QzVpeFBKa1Z2ekNpaHFIK29rNG1IT1JTWG1sK29k?=
 =?utf-8?B?M3RSRkVlY01XRHkrbG1YWlVjWmwvVkNZM1liajdvMkN0R2h6VVEyUmJQSi9V?=
 =?utf-8?Q?Z3x82DEYpOWjFFCeDLMH3WIM0DOfkY9/J1NSW62?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d943f08-ff0a-42f0-138b-08d957d90f91
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 06:20:03.2520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAfxFElgRCk5q40lnfhfCGjdaTJUPzKIsXLJKzKduOH/aW4Mmsthfp5mZnpvcVzLraHpt/b2fuVae12noHdTJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

On 05.08.2021 00:17, Jason Andryuk wrote:
> commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
> reflected in the config"

This should be in a Fixes: tag; whether you fully spell out the
reference here or instead refer to that tag would by up to you.

> broken stubdom PCI passthrough when it moved
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
> The wait is only relevant when the backend is already present.  Use the
> read on num_devs to decide whether the backend exists and therefore the
> wait is needed.

But the presence of the node is not an indication of the backend existing,
is it? libxl__device_pci_add_xenstore() itself writes the node a few lines
down from your change, so upon processing a 2nd device the function would
still behave as it does now.

Jan

>  This restores starting an HVM w/ linux stubdom and PCI
> passthrough.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> Looks like this should be backported to 4.15, but I have not tested.
> ---
>  tools/libs/light/libxl_pci.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 1a1c263080..19daf1d4ee 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -157,8 +157,10 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
>      if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
>          return ERROR_FAIL;
>  
> -    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
> -        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
> +    /* wait is only needed if the backend already exists (num_devs != NULL) */
> +    if (num_devs && !starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
> +        if (libxl__wait_for_backend(gc, be_path,
> +                                    GCSPRINTF("%d", XenbusStateConnected)) < 0)
>              return ERROR_FAIL;
>      }
>  
> 


