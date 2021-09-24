Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F135B417070
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 12:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195284.347916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTikO-0005p1-SE; Fri, 24 Sep 2021 10:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195284.347916; Fri, 24 Sep 2021 10:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTikO-0005nE-Ot; Fri, 24 Sep 2021 10:48:04 +0000
Received: by outflank-mailman (input) for mailman id 195284;
 Fri, 24 Sep 2021 10:48:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTikN-0005n8-SH
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:48:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3a8691c-1d24-11ec-babb-12813bfff9fa;
 Fri, 24 Sep 2021 10:48:02 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-QN_VGcWWN5-PJbMsV60Iqg-1; Fri, 24 Sep 2021 12:48:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 24 Sep
 2021 10:47:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 10:47:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0017.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 10:47:58 +0000
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
X-Inumbo-ID: e3a8691c-1d24-11ec-babb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632480481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYb8pBlbVWtqo+n4g/3NRPt9nGgrYy6WaPLLK4SXB4A=;
	b=cyQKXdQq6GNhBPoIDuUDnTdDh5C8WdQdURBvbAV+zdx2tBhWiB8I374FsJ0Vc5F3lj1r0u
	EU8AuvUvkuSX+yJTQZBDiUbX+oBOpdrSUrz4awOV4RgfZjAtdLHSnMr6V4M2lYQlESZMtA
	N8mAGJnIyPEGPQQ3BO19+GPnPZ/TbD8=
X-MC-Unique: QN_VGcWWN5-PJbMsV60Iqg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DF+EyuRTUtRmdOebdCVfwMl+S2oy4chaSOfp/bZkpNXRkDIkfryxz/EtOdFOU/AoWtaltJ2OQ3YpL6PHcgdrZdkmhNwRIpo/uWYeNEeKBYok1dB5o2e0z75aVIX5l2qWDeZj7ULKk1d58ohQffVTQo96D3Tufcj8RQUfi3kS0rpuPONmrUgp2mC95IqRHLV5vzzLb6LIHJsJ0g9IsFknqUWr4f0cT5NEU4CcaGQfFV1LqdSPFUcbGeO3bFhB+5Rg6f/ni8M/yEiZ+i4XCKcWtAjk8jd41u6xMvEf2Gtl0rS3wmcvkz5LIGY5D+TUjmK5OdfNT0oYMNJ+fZFMCJv5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=KnO8Eali880/it8jdrwlJFiG2EqxzerrSYMMNelIrX4=;
 b=HpE7yRmy3WY37gQf3ECywwfcaK8drMhGplijhp/kkpXvI83ipwOBZkXvGHME1OsmhnlTtxUFY6KKPXwaZP8YC5cI1WrNOJr9vVAqtsaqlPEOybd5KwPHhoACMRsHL+xt0C1AH0Q2SKw07/libQL1QXWNJjXptaylGmBcYlbr4vz4J8uBreholF5ear7WaOLP2F0fz76+7OTyWgZz+K2f8ePU51Leb9u/hivRxUTeim/Xrrnk9Vs5aI0BSvwIEzoP6aTggXUayX9dsskchdg6Bhn2zBQ9fC8S4LNoLJ4W//2ZulDc5cIWdovK/37N0xZqrtJI0ci9rcLEP3ugMClbJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 02/37] xen: introduce a Kconfig option to configure NUMA
 nodes number
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-3-wei.chen@arm.com>
 <9bec4214-5f50-9ea5-0212-52d248b63ca6@suse.com>
 <DB9PR08MB6857E123564C930D7BC1E2BF9EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <18e9ea20-657e-bc54-5f8e-f07b2d5f09e4@suse.com>
Date: Fri, 24 Sep 2021 12:47:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <DB9PR08MB6857E123564C930D7BC1E2BF9EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR1P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaa4bd41-bfce-4115-b6cc-08d97f48c5f6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5742D7C9DC2F4A21E39B5061B3A49@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tbj9HzSLuysTuT3yWjynFskc/6bdvq5gjLQUnJ6rpAJbMIO9TMngnvLlauyvfvyQb1LqgjafgUF6jgSvcVDRqUXeUObhbdah7iYRP0rSfngEDd+vKpHNlVN8JHyLPcR0ij1Cm6G5zSqaHz+w9UdeoPVOMY6IUx91pQd3IkXIsfuzvccHbqJQITYUn1976q+fYHjh6MxFxbXqKWW8pQbL/6S7Nj+4KjpKRniAd1uiIoredRhfjU0XxOzM6ka9BkI548eYyJIN54ylxToh9QesEwDJJjD3ab2J5uW2tYFFpGZyTrKz/GQMqEBEZN6IQq3BOS+8LF7tLxgRNwQZTAuciEFae3oOKSOEh2+1EMnBqtAhdLgpML/pbzLxuPzMWxzCB/2qptC+PmMwen1X1SsYp9ptmBq49yxFNHDh/FPgWo43qaJsG2N1VLNiMLzll1e2rTWZ/UsPSvLq0uJmmsNSWdutPxPMuDnzEEXbPqFfnxgD5mPUYo8eiPSKAft7sNs+UaiY35XvNrvoZzDEn768o1UTUtB+mhWrAGKYkgizIU3NZbEuIz/V62d9ZPMPxTI4b1S6hxzgr7VlrOo1lxICx4Ad0x9NsQ6PfeOc8yWyoNTo9lVer7GQHYtaPrYALki3NouHR8HnApC14V+WSQEgqc6slPoTDsQ/y5CQ/26caQyjsbNlFhvgCG5OUbZrChp18zx19HJSDuZBGOrqDMNtyQyT6ubQEb3BKar2sbEzX5c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(31686004)(66556008)(6916009)(53546011)(8676002)(38100700002)(956004)(86362001)(26005)(66946007)(83380400001)(54906003)(186003)(316002)(6486002)(2906002)(5660300002)(508600001)(36756003)(4326008)(31696002)(16576012)(8936002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F6D0AWGqA6R6SZn+4bB/R1yrnJso8bljH4GInYdgRnIP25QHSRqbAYWOa+Cf?=
 =?us-ascii?Q?YRLlOdLbK5HSMlOxiPY5t+O+00WKu32x153q1Ud/oQm5tZYTZGxchMrI+UVg?=
 =?us-ascii?Q?LuCwjIKcejAKjMRK2wU6hTzG4PZPGJjPR9EiprKlzDeRWvD5dTX0/DrchhAW?=
 =?us-ascii?Q?GF5Oh+JQm92nsm3GIDPC6pxc5zWoyv4zwnAPLUZfTD58PW4wwUNgNERZQCTX?=
 =?us-ascii?Q?Q8jPlxLbb4zBpvdI+L6yniK5soSaTL2VHra0JKtvHs66hGWwx2/qfNAm1nR9?=
 =?us-ascii?Q?J0tUf7+UwmtvLSrmls9N1s0BCxRnCAMFVGmYEliIDAtHnuOpl3/R28RgfNDp?=
 =?us-ascii?Q?5urSU0kplLUCkXOHPi0HAk4adE2K4fUHQBjB1TWACyaUEUfeL2uKQ+ceGJHL?=
 =?us-ascii?Q?7y+W6NQyIp4MWbm5/PSBS3ruui/qi35tLyia8uw55EXodM6Wfufrl4uhOnEj?=
 =?us-ascii?Q?hkXsYk4Sk/eUKBzvxuuJv1JxIy18k2hxO5xn5/XLW3Cm09X6UUp0XzrjJx8l?=
 =?us-ascii?Q?nzJcKUA6O0iv/s0TkOPhNiq6Gxa3EnqvmsApau76HXGBATY+bnFxgpPNvKCs?=
 =?us-ascii?Q?cdj+Ql/B9RRCOBkdFd3b4huFXaQxbZ/6QfqLMcBitkkCelOwUKNmF9PwvWqp?=
 =?us-ascii?Q?7Y1vYwkc6SWG+w5pFsTL9JWOGol+OEY/w6nH0eWAdilIyES7cvi0iCPtahRb?=
 =?us-ascii?Q?4izazXJfFiWHfoIV6Zn8Km+0wwcvFj84XRwMJDTJ1Be9FrB6GG8D1dAKKGQ+?=
 =?us-ascii?Q?cSQoc0gyx/3iQTyWo9PccqJ+36GUOhyzFy5xS0fxPKkJKmlNMKLjN0r2xFyw?=
 =?us-ascii?Q?r4mEmFh9v24hLsY7EQ9wp+LSuemS+jjIzMbXlopGm+Vzr0fwK4Yz0kVp1dky?=
 =?us-ascii?Q?VxZYwxCJaIc3e8Nkx8CDDG1DY0uhh1ijbH+xGUV0YAJzx4zGvI7WF8zcQua+?=
 =?us-ascii?Q?ZQwKcLGFa8w2bld7yujOTxFRtbbBqQUaGqXaU+MhORqcS0wGGeZ5OtKtDJJM?=
 =?us-ascii?Q?1xhZCBW/XVxNaQQF1oj8WCnTGHIOETjUUEv551l7ezHp5C1ZMKLzdovFDdZ0?=
 =?us-ascii?Q?H2it//GVSE5wxUfEe0gbR4EQ90yEyoIMjHGWD+PQ5tNAIGoeCuvk1bufmMCU?=
 =?us-ascii?Q?qzUux0KxpHwz3v3Cg965klHmlN9tJ7kT1IkssaTPHjRP1ZqBWObhNl1RlW5H?=
 =?us-ascii?Q?sebdCbj2Vr4rwz7dd5eT8r6im6T4QZ/9d3TUD+ZMd0mT89S5u4J2iMqvXNOB?=
 =?us-ascii?Q?Vqch2uoi10pWNlBPRcOwwXv7WHuqWpYCK8svwfjMM3ZqCWFuPsHDulXBAz9a?=
 =?us-ascii?Q?B5C/KJPn1giJWreUInCDJzp7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa4bd41-bfce-4115-b6cc-08d97f48c5f6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 10:47:59.0885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FyTqVgvC0MDTrg7c7KckWaVbx3yNvWQ1CnDRpKVt3PquI+yWR8bzIFxuniUfS5aINx4hLUikyy8RWnZQOBbeJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

On 24.09.2021 12:33, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2021=E5=B9=B49=E6=9C=8824=E6=97=A5 16:56
>>
>> On 23.09.2021 14:02, Wei Chen wrote:
>>> --- a/xen/arch/Kconfig
>>> +++ b/xen/arch/Kconfig
>>> @@ -17,3 +17,14 @@ config NR_CPUS
>>>  	  For CPU cores which support Simultaneous Multi-Threading or
>> similar
>>>  	  technologies, this the number of logical threads which Xen will
>>>  	  support.
>>> +
>>> +config NR_NUMA_NODES
>>> +	int "Maximum number of NUMA nodes supported"
>>> +	range 1 4095
>>
>> How was this upper bound established? Seeing 4095 is the limit of the
>> number of CPUs, do we really expect a CPU per node on such huge
>> systems? And did you check that whichever involved data types and
>> structures are actually suitable? I'm thinking e.g. of things like ...
>>
>>> --- a/xen/include/asm-x86/numa.h
>>> +++ b/xen/include/asm-x86/numa.h
>>> @@ -3,8 +3,6 @@
>>>
>>>  #include <xen/cpumask.h>
>>>
>>> -#define NODES_SHIFT 6
>>> -
>>>  typedef u8 nodeid_t;
>>
>> ... this.
>>
>=20
> you're right, we use u8 as nodeid_t. 4095 for node number in this option
> is not reasonable. Maybe a 255 upper bound is good?

I think it is, yes, but you will want to properly check.

Jan


