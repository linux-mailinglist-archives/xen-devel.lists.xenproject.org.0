Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530ED42C0C3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:58:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208425.364542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madp0-0006pt-D8; Wed, 13 Oct 2021 12:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208425.364542; Wed, 13 Oct 2021 12:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madp0-0006n6-9s; Wed, 13 Oct 2021 12:57:26 +0000
Received: by outflank-mailman (input) for mailman id 208425;
 Wed, 13 Oct 2021 12:57:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1madoz-0006n0-5K
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:57:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bd06a75-2c25-11ec-816d-12813bfff9fa;
 Wed, 13 Oct 2021 12:57:24 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-2-CidXsJLlPRujiVMWsFMH4g-1; Wed, 13 Oct 2021 14:57:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5744.eurprd04.prod.outlook.com (2603:10a6:803:e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 12:57:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 12:57:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0002.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Wed, 13 Oct 2021 12:57:18 +0000
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
X-Inumbo-ID: 1bd06a75-2c25-11ec-816d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634129843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C1ayQ1zM+oi7NUlTKdU0l/k7yJ1WA71GzDRZNkrE9UQ=;
	b=YfVENhGi0NRLamhF73iIMdV1LGQNqfZtpcR42S4COLHn+kX6Wed7u2IAh1B98bfgCKUIIk
	WFv50crPqQ6iNHiMPUuiwKkfdXQQbO9v/A6P0domZOTozD6Eja0lz8jSVm72H5NxQ8OzTe
	OxQH51siZJErxpzYu+5fgvHVUaJXuLo=
X-MC-Unique: CidXsJLlPRujiVMWsFMH4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vkt3SoiHp0josD+lvCUasQvfyNHmNjsTNXQYSodocRqC0DZW9s3kzTLh4ny2kC7bZLm1GVVDiC7vdpMiVrg3196LXgBbkLd+G7OvTnpDZOuAHYH86rdvCBU1zMZCpyNB9gu/CewJOaAY1QbK5qi6p/bzO8SSDXc2sxsbPYV8RXR+JXdBynUZxcDTKEGd05tJ1LEFcaheJ/spfS2hWyI/1R7NgpS0eoZkYVOHXtvtjW/ZQxUhhokEC7Eyioy/pcxavK44zLqYpjvjaT35dqCRY7B4kV5WhDqAyUrtGnOQAAhWEIU8eozAlHN9yai88/NTcTwCfJRnOxrTIjxG2nZYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2bam5u5imnGIthGQgK70v8PPO+Edd0xse5xWM6RM94=;
 b=WFFQm9maTzEmTrDFhqAq+Kdio3w8bMUT3Oy2ZigkyNUEPwmI+zUZpyvQxLBq1GvvM0zhvHNGkmdlNBYqbLn7YYQDQdU60VWTCQk9F2OA2ADmUTb7zTJ1AEnT/azwflfHmG6V/ny3uJhGPONdklnP4VO9e/PF0v3LoQYrK7+RJplLt9YmRx5QaBxF2JAfFeoTPqX45cJz0y0IP4IIDJoKqXcwbpgqH0OM+Kq/aH7r+vuELlw6u0NWhoUYUgX/WeiZLm6Vnii2kWicjGCj7r5mhZ5DMk2mTUnZlMaC/5YgYL84MuHL1Jx5JST1OUaNCchijK6TpQwfqQ/FVHZdbrsagw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Michal Orzel <Michal.Orzel@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andre Przywara <Andre.Przywara@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
 <9217a6b8-fc53-a049-7cd3-7458b574424b@arm.com>
 <YWaZKX44IOfIBtX6@MacBook-Air-de-Roger.local>
 <8F9D6B9C-58CB-4000-995A-95517EE72A3B@arm.com>
 <YWa7eGr3D8Ax8VUX@MacBook-Air-de-Roger.local>
 <9C5C0FE2-67EA-4CD7-893B-82C156F5F77A@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e88892cf-e0c3-c39c-dce8-bfe2d25a5b53@suse.com>
Date: Wed, 13 Oct 2021 14:57:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9C5C0FE2-67EA-4CD7-893B-82C156F5F77A@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0002.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dc0b660-ac8e-4ab0-ce19-08d98e48fdff
X-MS-TrafficTypeDiagnostic: VI1PR04MB5744:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB574448723CBCC3ACEF6D0DF3B3B79@VI1PR04MB5744.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+B/oWbBPLAhj0gMHpw3e2AsZXLJ3Q9tS/Z2P5Hf6GIc5vqllynwO4zTdE6gfG1wTjmkqfTw/64+/151GwQCRFgcGGeT0Zw2esaPBZ6N0xBbe/9IBCuPp3iMZFuvXBXpTIOLA1EB7br10XFRAGJQX9P4PD2+wQBfGH2PBitDDEM3XlHlyAb5hSguIrEMdcYUAgopaNdpYbZWUZzk/1Qq0RHwpDdsUFh+4EL2x6SuEHdrtGFXbHPcTiQLPRCEe+0Z1wxg8egk6JyZeBFaNusRWbsoqhDG+B30R7SIXqYW9OTIsAPJpB1FVUY5iRhOcC+5zvUXKeVZbGTtTq60Ac3402SwZzm30ktZl9Jg6vwTgDAJ56LQZgGAi6wIRStXd2mLUYahEWyO4FaUobBNrOpU8dgj9hZDsBWuvbTzwTo3ufLVktltzMbD1EU73ZlJcV9Tvx9N23hziC8VERQgNzEEcmFbydRp3XW9h4KIHvU+N+TGUQC9ppreDZ5u3+bw4rJulrccS3AmW2c+f90eAKDvvmTlaNFI89uUH1uMvRpUm79OkYCvLOOIHQnIMSdksjNBCJM8psDrcGeuIQQZGM6pETEyaiiiDZsbC2fL4zzvLqhRGRUNPdjiXXZ5ZsKqKOVJITpnmPS3ho1ly1NvnDxdcZRDNsczhJhM1BfH+wZBq44SCzFKkYWdD+Kk8Sd3wnfvHszHnBUvt99sMJFeDquVtiItat+5DjXR2Nc2yJmZjIis=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(66476007)(2906002)(38100700002)(66946007)(36756003)(66556008)(6486002)(956004)(2616005)(31696002)(53546011)(8936002)(7416002)(83380400001)(26005)(508600001)(5660300002)(186003)(8676002)(316002)(54906003)(6916009)(4326008)(16576012)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XupZCMsYGCQEYmkgzFvjJPzxKB8yDE8qrlQ2jfWx5iE8B+o2E4Xc9H3CzuED?=
 =?us-ascii?Q?GBGTmzrUmHWl61ZO4xZNDxKVHgShofaDMdczl86RmOp/XDJXWa1xJqMfsM+C?=
 =?us-ascii?Q?ME7SzKYegteOjFdzNO4zU0ah40u1GiWGcC80FIZr7Elw/jCLP4Ou5Dkhp8cf?=
 =?us-ascii?Q?+6eEXl4kOs6f2eBFp7/jxyWX8sIhf0vBI5OpzxHgOOOMllUj/RGcjNAUCIae?=
 =?us-ascii?Q?lqbDN4yintjo1layOuNKrgZEyEbnZedGAPqt8Lm8KpE1ssYxwbscpoUoePMZ?=
 =?us-ascii?Q?Shh5iNEGRn7YFxpWX99cYbJcBweFtUgbOQfGz9M8NmJwl1y2JKn+OIn0viYb?=
 =?us-ascii?Q?9H1i/noNWzFHzL9oD8GM3uaNvxsGOoeWSvbT1VxhCt9orglg1Ii+R/qG+yp4?=
 =?us-ascii?Q?mrPRBBGMpIjKrig/BLpz3Qy69/k/1NqjmS7r4/Rc6etwOUWReZqud9X7AfR3?=
 =?us-ascii?Q?JWgHDEPCv2FwTkL0Y7CM4bIU+I+k7SYcMVveCVHbuwN7Oye6sYa5xcqf5+gq?=
 =?us-ascii?Q?cnIHXpJNnX63+/+iE82KCI/m+C5E7G8MIFoUH08L5Gt432NXJ441BnZuojg/?=
 =?us-ascii?Q?Vbw5qui9PEqCdnIkvTzCH//dAEbU5QtiLgolTpu3ktY2pqMNx8uIuAqN8rFH?=
 =?us-ascii?Q?ImOC8pVxeibdI2dsbE4NvhZNdQSY3veHjBGw7M+/Ig1TO6wSvgoqZiQP0HkF?=
 =?us-ascii?Q?nY2oMt1wfnSsGzr/rMrTihvelSkTD/wuz35EmvfkLTlqomh1JoxPMw2BM3UF?=
 =?us-ascii?Q?C2IYKPuTMrK28Si3cixZKQaqFXavJx5L02jQXj3JlVM+/dV4YjJvy5yYf2Xd?=
 =?us-ascii?Q?ihvYYK7lHJEgyHsm595erYgZuBzsjUh6IKu46OVKTCtLJZeHWUMUqQUf1gvI?=
 =?us-ascii?Q?0J29KFoaxoquyolZiz3VlPgVQdRmdx4ueF4s2TyC+NcZ9GeFSoSXzrPmC2i/?=
 =?us-ascii?Q?LeN8A75GjHJgaY3UMqcpw2dyOhrWNKH3oq8hG7DLfHrBqiK6bjARo1fXfmS6?=
 =?us-ascii?Q?MmV89Kymr3vv26b5XfjZ0re7DWNcdPkMRzMUXtBCqk/vQpoBKAJ+0GDHRVx7?=
 =?us-ascii?Q?xYdMDA3N92+Z2C8tIk7YI7jx7582j14A3Lg5da/KEv8jaG3Eut7YdBDPTcke?=
 =?us-ascii?Q?R1MoGmcAASGs4yl07K4dGeyjZ+l0XylUGEvidoB6zot+ZlHlhPfdf8cyoHqs?=
 =?us-ascii?Q?CmKQ6lNiEoC7PaBwQcc43Ozrl2r1NLsZG2s1U+8NV9LQopcN41JnnZYk9Xqt?=
 =?us-ascii?Q?UPsywzCQp5dMYI3teBEJKqoAPD+i+xOt6rHcOdj1GnbHcF12JHMY1ohDjZ1u?=
 =?us-ascii?Q?v/RHhi92D1qI2l1guR1yOtnY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc0b660-ac8e-4ab0-ce19-08d98e48fdff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 12:57:20.1044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUmhfZJgO8kdhllY7/BaEEbRLuW/rHG0rLUD5Yh/4DpwZ9CJF8QQc5Z7nFSa0fJImN0gM90cWhY/8yPYj8qa/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5744

On 13.10.2021 14:11, Bertrand Marquis wrote:
>> On 13 Oct 2021, at 11:56, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wr=
ote:
>> If vPCI for Arm on 4.16 is not going to be functional, why so much
>> pressure in pushing those patches so fast? I understand the need to
>> remove stuff from the queue, but I don't think it's worth the cost of
>> introducing a broken interface deliberately on a release.

+1

> We did not push that fast, those have been on the mailing list for a whil=
e (this is the 5th version of the serie).
> PCI passthrough is a big change requiring lots of patches and we decided =
to push it piece by piece to make
> the review easier.

5 versions for a series like this one was to be expected. Imo it has
been wrong in the past to rush in new features (even if experimental
ones) very close to the freeze, and it has mislead people to think
they can delay work until very (too?) late a point in time.

In fact I'm getting somewhat angry seeing how much effort is put into
getting this work in (including myself doing reviews there), when at
the same time far older series of mine aren't given any chance to
make any progress. Not your fault, sure, but an observation.

Jan


