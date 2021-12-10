Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257EF470113
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 13:59:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243835.421913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvfUU-0002ba-LW; Fri, 10 Dec 2021 12:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243835.421913; Fri, 10 Dec 2021 12:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvfUU-0002Zn-IP; Fri, 10 Dec 2021 12:59:10 +0000
Received: by outflank-mailman (input) for mailman id 243835;
 Fri, 10 Dec 2021 12:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvfUS-0002Zh-U3
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 12:59:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5e9eaab-59b8-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 13:59:07 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-bfxs38U6MJiTyrfvPVGpAg-1; Fri, 10 Dec 2021 13:59:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 10 Dec
 2021 12:59:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 12:59:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0397.eurprd06.prod.outlook.com (2603:10a6:20b:461::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 12:59:04 +0000
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
X-Inumbo-ID: f5e9eaab-59b8-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639141147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txJ9CIfL6k9DXHvkB8HDTO1ZVOUWN3gLCjvnciajTEw=;
	b=m4R47I0ZsRG63SaACb/cQvCD7IZk8KtZ1PL4M/gMEreBUKhpT5sF4C3Yxn+dLzH2mS3TKH
	NZr8VQl05p0/sJWFMeJK5PTne8cCdxsxGsK910FOVaLT7HtKj/SOq+RUxC5aYxuvrO74xC
	FYA6JQAG5SGEhT+evZnsY4BkXJtbu8Y=
X-MC-Unique: bfxs38U6MJiTyrfvPVGpAg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzhPqqPEswQaApaS1Wxiytlaon6WjrCqHtc4rZ6AohxoRihGTloO6OnWp7udRusZraHhhGaMtrT3RvMb3repyFvV0dBHGDbHpHJ8zgKgxmVXTCrKJkgY4jxHxRuqIBQ1WIG30CkZonBL5wcB+V7nX/jQ4iDoztClOxTah2zs0IfvoX538BC4uYz/Mz3HZgVRc7clmTCXKg6sVwQ1YBK1J5X/KAmP0OOJBTRgHE7eujzSysBrhk/m1YWIMPQElC9GASwbD4xo9vUu0jPdP0yan47y16Sh8YgFBAMDK8Nl31hPISetQpvyLYjUsJeVEE5NVRDn8UtpXM9RJkSX3UdMrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5SQvSUTE08HRX1K3p0iFyW1h91xmLmURncx5MpE4Ms=;
 b=oMJ7MZWyRsboNr4bkej/oaUJr0bptD3VdpvoQ+JmflzfJ07Oi2NGMVg3bOTL1JfiVpsEwycIJje+c2jIdIm2TuzjRCjtUz8QMz+WyhHbxfn+x/avu9IGtB0ofRNHYVbRfiLHwF5NqQGRF+if5CBk4IetoMrhwJfG1uBnq8t24dLoWE2Rpa3G2Pk7BshXezeAKknqPKGSDW1VSNxoDla0h87deT4BGTlKIfx5NCKSUQ5yjZzeZ5Z1Ty8nART5VGtMXjpsPRf4yhdzKOTyNWZl/wZWkuP9oY5mBLQx13IpQDUtrdS19iy2BdeQuO+aBDRHBAYUqvo1eCP2EwPxdXJImg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1fe2b37d-b898-c86e-dd4a-482bff9597db@suse.com>
Date: Fri, 10 Dec 2021 13:59:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 11/18] AMD/IOMMU: return old PTE from
 {set,clear}_iommu_pte_present()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <33819694-2787-4bd6-1830-6b4eb81cb4a1@suse.com>
 <YbNCpA1PDtINnn7j@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YbNCpA1PDtINnn7j@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0397.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9119df1e-c877-4e66-d426-08d9bbdcd830
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33924A253794E3C96332DC67B3719@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LFM3vs6biqu2Y9sgF437areEV0UCvZxroUF9IOZY+LXKAJrwfoVO06QhPiH7eFHlqMnn6NEW7el65WyHy4QKcAHv+ZUSFXm1Q+RVq3/MoVI9ly8bgRufHyyv+4AnDd6jQLmCH5oakDESQjCypY+ZxJyve4JO0144+ced+kVr2nyTxp/JO+PHMgtCEgq+M8A3lvy3uoDpXlUQRPolioM/QnNvuImxGjyc+zMKctsBf+vdaQZgh9CnlEh1a5SKZU16Ycmf2A6rnumbeach196V3ZB8LcRsSmbF2x7C2geuoLfKUJS3IrCAixkgQ/Zt+2hcBF171DX9SAVudvJlumIsAb4+U9WB6Y1V9kqUYZeBxG3eMJumEG9G+UUw/XmrmJ13voKIgvdvX4BALHyhKXRn891YmVnes49wvE6YYhGpaKLUGyEkTllVDFf4lyk102G3O7c2+Y+vXUgBSyqT5nEhx8BDVG1flrWA5ERxw+hAO2so5f43/uSXmXEAt6lLAxWdSz2sLF8DUuNmvinTx3xFPCFq0PxQIsmFyrrhaHDjypf/DB/i7WJp+64EuybWFdVXfLxQne2gU7TvJ2uwR6xVkd+iVQ5zlNNYImGk5ccU99EHZZxLff1Q4tSGSzBVo+fuizn9QVTvaglvD1CPl9d6atllgou2sAV/NIHYVPRNDIybPyYe4oU0+J6ZDslan5L9m2egi6zM3qfu21YCljAuBgP53F641yCnee7MGtIfqYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(86362001)(31696002)(8676002)(8936002)(5660300002)(6916009)(186003)(26005)(31686004)(66946007)(4326008)(956004)(2616005)(83380400001)(4744005)(54906003)(16576012)(316002)(38100700002)(66476007)(66556008)(36756003)(2906002)(6486002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3RxdKyI9S700hv6QEpGowuxYtipHAB1lWrba34E7zghLzIjmAlUiuUIrb7a7?=
 =?us-ascii?Q?y/ukyVat++896pNxEqAkTrjCqFsMiPg//OubfNO6kbk1u2XoiEkuBP19KIiF?=
 =?us-ascii?Q?x5dsFqVRrK/2kKI0abWiIB5YgIulKCcpoLIWPGluPfHtqf0ixCrXLRw8H/eb?=
 =?us-ascii?Q?0WL74xOLCIw+S4dLYh9JPtMr/RWpglqz67NPupEYYjeduyRcVeNO5Nwg1aIW?=
 =?us-ascii?Q?QwlgGwQ4rWeJ4zt4xCE8iXVBzJGsiuZpVkPeDBteb/tV/mInDiD0StdWW9sQ?=
 =?us-ascii?Q?l4XoktCi5eXRB2NIsYQR3WHVKrjD4c+0eun7RgcCQ6X2HRi8Oe/kV1neurtr?=
 =?us-ascii?Q?l0QUzl4RLpXNyPKUKjjfvy5QYw6n7CPbz3gD7ea5jnoJxcbckNHR+P+Q+gMA?=
 =?us-ascii?Q?XRNYm0/QzfIWwkU7aNwP52Q8nh9JJgdkhoZzacuxRxVlNjqbBPD/j3khsDBi?=
 =?us-ascii?Q?BmPeKdvblk78VXdaVHVqul1er59l1PQyiE9pv2PcqwgxHXnGG2+TONBTeyqJ?=
 =?us-ascii?Q?VurjXWeidClWIJ/PebHtYrP/rbGHvM2tM04MHWxl/bn6EdHenMHhC/irqV35?=
 =?us-ascii?Q?+8UV7gP3axijUxtfb/RDAnEbDazJtoACXkxGdpXTXsPUSchKnWCvH6Ij9CB8?=
 =?us-ascii?Q?V3ZEz7TwP/nLAX8NKbvLqEpNfvYhgJaDUPIXaBJT9/mCfS/UpelXH1hZErqC?=
 =?us-ascii?Q?xdckr6nlM1LwMon1W6nvPooJyT89KMXlmUcS5YPBKQ3207i/DEOsxS1qNzeo?=
 =?us-ascii?Q?hhppkG6Ae+C9jEQv8eYRQRuoQiXV/RPTxs5rCOgwcU0qQEdxkOoyDsc5Yqwq?=
 =?us-ascii?Q?5tJQJ7kuklfaSue3JJ4rDzXleFrmVgvmUv+u26k2OOWAhYqoMojJ2WHBT18e?=
 =?us-ascii?Q?E7zaiCmLc8zk2T9CV5hXaJaL2Ih2znt1H7S+zpySVuwM3uVN0HyLJdb46O+1?=
 =?us-ascii?Q?mzAwoGwKUvlIhK8ZvdEmZw94ugMHKkpThCHsiPCYEeBx/Ie2rDV4jN2FMo+e?=
 =?us-ascii?Q?cROYjHRaSfW7eigGWSmGN0jtIBCHEV4tGi76AkCaigFetiOVWcfK0anfRJYY?=
 =?us-ascii?Q?kzNCtaZZPdZ5T5iFG22eDqylf+6csEywcIqxPlih7nPKuiIH3lgEVaC9W3a+?=
 =?us-ascii?Q?peoN6KeMUB1y7onu5oAxOkZghMz0fgsjLoUetmMZPlRp3DsyA5gict4v0cxB?=
 =?us-ascii?Q?pSHa4XCMz0h6+Fjb6vWGYkCVQ0+MXjhg/+iQzx731c8vqewwgNceGpuJRo9Z?=
 =?us-ascii?Q?w2EI9k5NqBNKRwk/DGyS4JLdVSImAMAaNv26vdGwjUhnQ0a0bXLsurDC/Xkn?=
 =?us-ascii?Q?6jUNHvh1TtUo+KXmtz54/fZ4KNBQCRUQT+dyuZIAK4j6WxKkNaw/jeUZToNS?=
 =?us-ascii?Q?wGQQJFexZqkd9rzSNu5xLQzM2CG5I1eF0b0I7WEQS1hW0Vhch2DH6vatvi6h?=
 =?us-ascii?Q?cJW4IEv1+cNiYUTUiMpraQ53bFfmq9fW+mAXd4jw4Xkhp3za/MBAC7szEg6w?=
 =?us-ascii?Q?0N32U1UFSU5j18vuFjvBEpcFySwRqUc2aabwZh9Rk+w7cayHQ0E50LzDEpJe?=
 =?us-ascii?Q?4djU5q1gJ0Yd0vmiFHi5UhXC/wFA6kBZhyLqFbn1uL9Jzgo3ZJ0nKdxFB+iG?=
 =?us-ascii?Q?0JItiq+mDvTBskP/X+6CaVw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9119df1e-c877-4e66-d426-08d9bbdcd830
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 12:59:04.6152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHFKfSqDQ4lgCjSTHfX/73UMt18oCz3O/yA1hjS2W8WoJDiKvVQCf25ROS2shajYZzk9cqXOxH+x7APBwWASYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 10.12.2021 13:05, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:51:40AM +0200, Jan Beulich wrote:
>> In order to free intermediate page tables when replacing smaller
>> mappings by a single larger one callers will need to know the full PTE.
>> Flush indicators can be derived from this in the callers (and outside
>> the locked regions). First split set_iommu_pte_present() from
>> set_iommu_ptes_present(): Only the former needs to return the old PTE,
>> while the latter (like also set_iommu_pde_present()) doesn't even need
>> to return flush indicators. Then change return types/values and callers
>> accordingly.
>=20
> Without looking at further patches I would say you only care to know
> whether the old PTE was present (ie: pr bit set), at which point those
> functions could also return a boolean instead of a full PTE?

But looking at further patches will reveal that I then also need the
next_level field from the old PTE (to tell superpages from page tables).

Jan


