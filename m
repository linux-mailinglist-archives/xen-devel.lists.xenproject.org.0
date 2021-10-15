Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E563B42EFEF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 13:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210357.367212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbLff-0003ai-9N; Fri, 15 Oct 2021 11:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210357.367212; Fri, 15 Oct 2021 11:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbLff-0003Yg-4D; Fri, 15 Oct 2021 11:46:43 +0000
Received: by outflank-mailman (input) for mailman id 210357;
 Fri, 15 Oct 2021 11:46:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbLfd-0003YF-Ty
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 11:46:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbed5b85-7657-46fa-baf4-98570b0cdf60;
 Fri, 15 Oct 2021 11:46:41 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-P2oPqzP6OOyTDZ2BkKPE2g-2; Fri, 15 Oct 2021 13:46:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4846.eurprd04.prod.outlook.com (2603:10a6:803:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Fri, 15 Oct
 2021 11:46:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 11:46:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17 via Frontend Transport; Fri, 15 Oct 2021 11:46:35 +0000
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
X-Inumbo-ID: cbed5b85-7657-46fa-baf4-98570b0cdf60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634298400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ouqg4ZcgVSb17GN+FWPxCQe48GIW9ahi4s1Ln/bTg8s=;
	b=XZ1yRhfz85T9NgHYkZ3HSeP7bLOj3YDvgJ82/G4ZfIq118du4WKRxZjry1slqJLto89X9a
	KXWBS7uq06FsQqBNMzp2Msj99woTkXZc0XIVSPEEjG3/60g3VxTrQiMTYkharBLHW+j/gK
	gffYi8ZyqRH4SnbCWg1ywiT6jJFBcgA=
X-MC-Unique: P2oPqzP6OOyTDZ2BkKPE2g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wh7m/V1QLBy6HcKy3wqiYe55dJGUB06PdOPkOCUGla0sIDbEa7rJCgarkuCiLOo2UF2O4KEJNpXdjSLTnI5Vaat9fJLxaOcDhp8ZoXSsFyT4GnmYTW2TuD6d38FwUM+zqVGvERit5ENhcjawfiP+G/1uOaBccFmkE62q6xP1Vx+tQcllQqL397t4T9VWi7I/FtU+Yhx/6RHGo/wIoXS7NtdeXwMuLppHgx/LWaz5c5dpRFuoJoZ2QO9ZA5x2oDGh1bcwC2Vj+SdLrtkE3a3oM0+dcETjC8A1oJ85RcJtfNWFd8OjgMA7GGs7X2cMLwJl93hzC39qJGswGefKgMCb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouqg4ZcgVSb17GN+FWPxCQe48GIW9ahi4s1Ln/bTg8s=;
 b=SRstMUdTd3JULuDTK8+0dQ+m8k6zBe5PlVArln0YK4nU6BNhAHv56gA8Pu9MdeDTjf1+MsHYHp8kKQ2l3OaVauSI9nuW0y6WPfV6aV4xq2ieSh0KHDsFLI+mdXqkJlqtEgjbWYlevK6aI0zcGUq+dKJcjCJqJ1HtM8GN7h2Gm5mfm92gcTEW2Vqxz8mF4l9FaiPDl74kG4opVGY8Ss8o2Y/JDGCKunq87gzYIsc1Zf4VYOztHEu4uZSSgnZZDs7bUO5gWd6db9HhNknC46lGellByB98TltKPtBmgwFrmm5Hf8oZIl9rQ8/su3BnTBb89Bsvh+uC/7lIZtTrlUFojA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 3/6] gnttab: allow per-domain control over transitive
 grants
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be74d987-6968-3369-b7b6-96ca1fcd3e0c@suse.com>
Date: Fri, 15 Oct 2021 13:46:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210922082123.54374-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0010.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c0ddd3e-8326-48f8-bd7f-08d98fd1713e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4846:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48466949E34BA02646D36E15B3B99@VI1PR04MB4846.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JM8YLz2xbg28OH6bYVLhu8ie/6TfJt993LRilt2m2DiRug/ws5l4qvw+Rhx83jK9jnXHSsIjSb11xjndJ97zIcTvj6oJhv4nTpvxcOyFW+pEgqIEgpUKVB58CP0jkru71j6OFCuSaWjSnBTW+LhLq+YKjlUGo2hB0VRFF6kVLCAE9MyqQ5flcmcwV09suvcW4qDgtbKehcgT4704aa5iU5Xty/WzHgIuYXz3vLNN3KN5EdYV1XKzOFovRJWCZLHGMQcnlQRQ+geB9OfTiZKCCp043UlF0NJNLwWWWxEX00YbViKmwEAasZELVLokI0IunFskcrEGCmWmtJ0ILinn0BPxm4Cf77lBlSkM0h/DaDThgfYvPdfXFlUs/CM5dEs7HmOhNFyX70SunnSZpZQIUqNZjwI8i5HrfSPUP9Ait1HxHrW1d40C+AOXmZzcQ1px4Bi2s/h8MGqktlPqJqCs4lrP2yivIpQ8GfQQXYQgZKKKoyF7IgXdXcHDaklEGVbzVHygBlEVUNbBaN3guscr2R+FwwwgiBoOje3ZX3i1d6kxTaBitW+nbNTNNHspuGRtSr92kMDTslRLfNa0CWOr+OvRLD6ATqSOq16NMXFCsfBrATbzU61FLBCEe8B8/gcOecCwCLg8lbZKHRXOGxf5lumo/mF/c6r/BaxLWVbVQHC/LpMjSlEXwxgUJSRV5pJAKRJ2tz8we0srMoY6O89/9PTWoOpYA0HRKaVm1NhBQmFHluE6KsOb/rCKjN2zEYXH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(5660300002)(956004)(86362001)(2616005)(7416002)(186003)(6916009)(508600001)(8676002)(4744005)(66556008)(66476007)(26005)(31696002)(53546011)(66946007)(316002)(2906002)(31686004)(36756003)(16576012)(54906003)(6486002)(38100700002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWNFSzZvV3RvUTF4UkFFbDY0Ymd0WHVmR3YwRXcreS9vTVRtUW9QS1FXSVNP?=
 =?utf-8?B?cm5ETE4zcStVdEtIamFiMWp5M3dKVkx5QXc4U2I0djdlVDg4UXJRMmZrSzRu?=
 =?utf-8?B?TGRSd2JDUG9vRGJhWlhlejgzK015cEp0eE9rdmo1QlJ1MmRBb3UzbHBYTzZr?=
 =?utf-8?B?cTFVeEw3MkN6MWR2U0FoaldVblZNY0o0YktlMHlKUDU5K1NEZXhzMklGNGh1?=
 =?utf-8?B?eE5iN1FvUDVTZEhlNmQrNVlhNHY5eGpCYlpmTHF4RS9LcWt1azFvTEp6aGFl?=
 =?utf-8?B?eUMxTHh1d1AzYTdnbXpoYk1tL1VBK0lucExDaXRPSlc0SmFxMEV5TXM0ODlE?=
 =?utf-8?B?L3djOWQ3TXd0d3NZdE9QaUhWZUtieXBYQStqSTdUbzB6NFcxakp2WjNXbWJZ?=
 =?utf-8?B?VWpCK01EZTQyczVFWlRQMU10VTd6dUF1YkluMkgxYS9FZ2d2SXlNWmhNdVJW?=
 =?utf-8?B?Z1lMVnRMQ2doa3phSE9aSXZhdzNhQzVTZzFxRFh1YUhNUjBPeHl6TkVTSlF6?=
 =?utf-8?B?TG5tWE10MHU3dEhYU0hTVmRwZ3ZhcjE0bkdQbWlzRUMzMFQ5NVBjUWZ2N0tY?=
 =?utf-8?B?YU5ySWlFWWdST294Q213VU1sZ1lQS0FNK0VKWDBYRStEa0ZWbFFEQmNJOUdl?=
 =?utf-8?B?dmJLbC9kaXRpYlJiSGVLSTQrck9DMWJNWUF1ckJ2aDhyU1gvUFdDdlo5TnBP?=
 =?utf-8?B?ZWhpSXpENnFYdUJiYWFIRVl6WFhjRUI0bFBEejJTb2lzVG9BdFpKR0Z6aUZk?=
 =?utf-8?B?Z1R1SERBR3FzMmQ0QmZsMXJBdTFnS1dXd1hub1lOVXpMNHlkVjVwQ0ZNdnN3?=
 =?utf-8?B?VkMzMlh5cnZpWlFldzVEb2pIaVoxQUxXQXN5NWF5VG5WbUxrWFdKUjd2ZWg2?=
 =?utf-8?B?b1ROa245TUh5a2VNNzB4TTZpM05JQWdIejhlbGhPV2RNOTB5WkEyQ0dzYkZT?=
 =?utf-8?B?ZS9ydGZ3MENYS1JTN0xGcTdqcW9wTFc3b01DaGN3UnNqUU4wQWtiWFJwZnFN?=
 =?utf-8?B?NzgydzRQem9DMDFVLzVGbFlPT1VYWjhoNldOeE9HWmNnRHJvclFuWEdINkZv?=
 =?utf-8?B?Wno4WGtZNjRTUmxjQi9SWk9iZzZtKzBzNnZZZEw4bGFGeWRDTlZCVGpUMGVj?=
 =?utf-8?B?eHVJRDZ3TTRvdVV0L0dNVUJPL1lwaTVlRC9saWRyVTZ6Q2lPempWb0Q5alJX?=
 =?utf-8?B?NnZBN0pKZ1BoYW8xQlNYNVZtN2Zka0RYYzZLOURtbXlFeTBib1lmdGhZQjJG?=
 =?utf-8?B?QkZKdjlzNm1xZUFvYy96SkZuTXdZUWlOaWlrU1dnRlhNNmxQdE9VY1VQbVpa?=
 =?utf-8?B?WnA3SUZjcVdXa1IrQXhvNGZGazc1VDRXOWFQVnRvRmg3Z0xJK2NseGYyZnRD?=
 =?utf-8?B?Q1dEQ2JxMFQrL0dLNTV3N21DVEUrOHlIQjZ2amd4SmFFV3dyejgrRVZib2w2?=
 =?utf-8?B?Tkl5aE0xUS9XUmYzS2l0UURUQ3M2dE1kV0V4cHMwdmRnck4rV0tvOGFJVFVV?=
 =?utf-8?B?SWs1ZFlrSSsvVTZtc3lZSUpUK0VZWkV6U3R5clV1aHBvOWhRMzNmUUNuUlRy?=
 =?utf-8?B?N3ZJSXR0cjJlanRaQmR4enNTRXQwWkVOaCs0WVMzd0FzaHl6UTQ1NDZWeWg2?=
 =?utf-8?B?cFppcFpVUnBMTWlid0tQbTdHNUtRRy9SQnpiOG1wZTJXNmZxaldBcFhSbjR6?=
 =?utf-8?B?c01JSmF0MmtDR2Zac1FxNU8rOHZDYzRWWDQ2RkRIc05WQk5HaXpLREtxWEMw?=
 =?utf-8?Q?A2n36Axav4biAXsaxGsxXlXwn3bLvN7Cjhs4Plo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0ddd3e-8326-48f8-bd7f-08d98fd1713e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 11:46:36.2268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ui4rQUn4gE6Ttex6Tu8XJYkxeTAoLYfFRapPi9ELTHIHtLfj/iHPXWQw9IELSRRg/r3niMV4B2ps4cyoz9djMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4846

On 22.09.2021 10:21, Roger Pau Monne wrote:
> @@ -1965,6 +1969,8 @@ int grant_table_init(struct domain *d, int max_grant_frames,
>      gt->max_grant_frames = max_grant_frames;
>      gt->max_maptrack_frames = max_maptrack_frames;
>      gt->max_grant_version = max_grant_version;
> +    gt->allow_transitive = !!(options & XEN_DOMCTL_GRANT_transitive) &&
> +                           opt_transitive_grants;

Btw, should you perhaps reject the flag being set when max version isn't 2?

Jan


