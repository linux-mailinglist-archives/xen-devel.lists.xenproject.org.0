Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B9F3EB2A8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 10:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166681.304233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mESZ9-0000bS-AX; Fri, 13 Aug 2021 08:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166681.304233; Fri, 13 Aug 2021 08:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mESZ9-0000Z3-78; Fri, 13 Aug 2021 08:29:23 +0000
Received: by outflank-mailman (input) for mailman id 166681;
 Fri, 13 Aug 2021 08:29:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ewIu=NE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mESZ8-0000Yx-8E
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 08:29:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8df7d492-fc10-11eb-a264-12813bfff9fa;
 Fri, 13 Aug 2021 08:29:20 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-Gu2EbNICNVyfKZy3AsWjRQ-1; Fri, 13 Aug 2021 10:29:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4350.eurprd04.prod.outlook.com (2603:10a6:803:3e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Fri, 13 Aug
 2021 08:29:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 08:29:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0099.eurprd03.prod.outlook.com (2603:10a6:208:69::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.18 via Frontend Transport; Fri, 13 Aug 2021 08:29:16 +0000
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
X-Inumbo-ID: 8df7d492-fc10-11eb-a264-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628843359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iGKjXDLYENGLSrSimZ6sXwXBoh5c/+auGDgoybxCfow=;
	b=IRV8sQm6LCkkS2XsyjFIGlmgIPZPK1s52K+CXx+P0K5bh5PJDKfkgOdUJEZkf5j2t0rI/J
	Dwsbm3lluCFRW3Hi7LiY1/NwDzFpfV1FCSjTRlw3NKMlDoiehy4bxYRItFuDhQAFHDYzRb
	aQUOKedaF0kGxrO2TL4frYO40KsZvMs=
X-MC-Unique: Gu2EbNICNVyfKZy3AsWjRQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbFBvbDmdGOtam1CQRwJq1xbYI+UpQBmpkZm7bpcZYKTIm4LEHMTzTStONpvs/Ed64sosyNp9vRqXNbN38171q1pU2AostzQIyCcNFWVDtfoA7GhFSyKT3Y0UfyCzlDDskfKZRZVg+DVKNUUNJXixdCpH/oSP8dF+WMqHRfFNnvI0xtYYSyeLI6ZB3vsmf033Yz3yX1i0tOb6MndnfDti7OAso8HWKxR9DQZPM1yrqciEXE6l4l1ob8CX3TPdhRItDqcD0m2fW5mSJhtPvDIjUARv7YcmeqYncMqVler+oAlx1gLIdH4VYOwviTmCnDrqMpRBkgNpIXOI+CO48zizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgHFpBPUTtKPSQ12C2/+K29SL7vgOoAvq5winQVXTLI=;
 b=TCCIaV3Q3mLXNRCPdeNL6x6iDfE0p6In/+AkXLCbWTwdc9D5uURpicyaDnfnI+6nWYRlA7B15m13TXCZP7gwQUxp9DdNiYqVkqt+fGBQXxAY3obkMnGjPjwn787gO4pzdojBwaXL4/HkzrozDeokbTxDlc6Gj3wpfsc34aE6pjs2l03NhbEalmplCMdBVUqU/CNEzI8Ptt7rVB3ydWKxHfrKL8jtnseo8VecpHIXZJDkzSC5vXbsrT61e1Lt0J0vsZSXbxG83cly5zyj6pui5ZmoeadX5m9JkdZXHhk3Z6TJHuUq6JF54KKI+9QOm98JoEFhIDcEu1nhcnwj/Gs/qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN RFC PATCH 03/40] xen/x86: Initialize memnodemapsize while
 faking NUMA node
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-4-wei.chen@arm.com>
 <106dff13-e997-db8d-babf-0d6a73146ca3@suse.com>
 <DB9PR08MB68571676C6528B0AA56CB1659EFA9@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <127b586e-088e-e004-8320-c1f60930bf59@suse.com>
Date: Fri, 13 Aug 2021 10:29:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <DB9PR08MB68571676C6528B0AA56CB1659EFA9@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR03CA0099.eurprd03.prod.outlook.com
 (2603:10a6:208:69::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e6444c0-32a3-4e9b-1ed5-08d95e34708a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4350:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4350DBF134BA6006488D4DF3B3FA9@VI1PR04MB4350.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ly5o0DSS+ALSeRyR+OSHG0St1bvB+sL5cKnveFTIxoV+IPgepHH3srJXucZZAhb82F7vVo4NIR/OnXwIw5g9AmyrCA0K5Uc35GSJRpk+XiZo0IJMhx0Zlj6M/G1MOZQiwMailYA6dX71a9dwHERg4VF36TnwH0htSFSO5ilRfqdV0w1oXiIE3qnsjKdwlvQ3cDyfwfrEzjYVWCwwovMiaJxLQTJSXsG9BoDecnIVpQ5Az1ktaAGRqJwvtdrtZFx1zatkaEBtLQYOlgzagUkuOCwWja6y005p0coqMM4UTiJAswCHh8Xz+mSONcTsbdKeZ5FCvEIhtNYxGiEGq2v816/GNxXZlGan1pQzxN1KqiF5gtcBCtUKqQu9oQ2Q+4JnhQHsAigITfOELTrKLfwifp1/N/OfgFnJnpp2FFS2NEYnUnUFQV354PRj/LDHD4HXs8MPLTlv8zYUi8AnkcjNbvao1U2zIq6J49ZzquDUcKE9SudrKL9K4GanTEF7guF68HrARWfbi+eEBdm74LNYPkRWFHGDUHDqdqOQd3tKED4T1ds7KxtoZ7wONpydGSUsQ74MWBviAqNeGJpOwEFyWSZecJvDCcv+QQ73igeWaS0Mfmh1XtdM0EEbKPCllud7qXlwS9IyR0/95usF04ZpsEPR5G+ppSK7KMwmBa2eIzpAdcY7c864ZYlSUnOjA6BD4LsSKq10NC6OTaNx/U9DNKGHQCsbFrrYAgLPnRX770k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(66556008)(6916009)(316002)(86362001)(4744005)(6486002)(8936002)(2616005)(5660300002)(2906002)(4326008)(8676002)(26005)(38100700002)(186003)(31686004)(956004)(508600001)(36756003)(16576012)(66476007)(66946007)(54906003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H0LL0h/+9jZ3/LBCdSp9dgUXchrxFgWuCGQQauLYVZQKOHMTmajq/i8POcZP?=
 =?us-ascii?Q?TYPdpD27Ynf+SmUk7eCEds+RNEfnVdtUNr8tqIlWE/Bc0NSco4MtvNSJs06Z?=
 =?us-ascii?Q?QUiaUCcXcoV+nAJF7pr5hmFeqtzQXrusrtmJjUW/IFKl1Nw3butytC/mhfXN?=
 =?us-ascii?Q?i5ZcWP/FBCUBM8uqAQhE1xeJ+EhW0hMgrTXi3+JCvBximPsk98GNjhRSdaIs?=
 =?us-ascii?Q?/aaJrnJ5mo8T2Sd2N7nI8xAK/78j5zEwBCTRR0gO7sWXjzUIogkUR8jzFjvN?=
 =?us-ascii?Q?AkyrZMmgQGweD8U3fTigc8U1EvoBgKmh82zcR804HDyJLvmWnzrw/hdPebDC?=
 =?us-ascii?Q?buuiYys5XgHuFUGNXtb651vGiEAAYetR8w52qa2AJu6C0kQ/6wTUWfhXP4s4?=
 =?us-ascii?Q?msy4PHEB07vBXBbFpjy7FPAw/UTZyMznSlapVDP319XQr+oGXwqdUDkSPnTy?=
 =?us-ascii?Q?DWZ7c1aot0At4alu+a0dm9AzU3EXw6LWQGaF6FlrpcZZF+hXfWCpZX2xk+b4?=
 =?us-ascii?Q?jb+MFKmNyCfzV7/J4K/5g85wYgdQLr6F8tUFQBD60amD9+uaLTCfLBBHvgm8?=
 =?us-ascii?Q?bAkVvh4k7axGcxnLlqfpIRZMeC0gjcJ1P6zHhZK6n0I66fd5DeFv056w93kc?=
 =?us-ascii?Q?Uj/hYbZ10THOegSBgLXbwTE7wrfJ3X1NqBeXnsRhm6wqPFBvs5PnfeNcBYyj?=
 =?us-ascii?Q?QaGpr5M012JGeUZJkklGLJc1jm9hlXoeK2EeOIgC5+2ewF5lplBWqsFLfz1x?=
 =?us-ascii?Q?Fc3e6LSz63C5Z/kXfGWSeJxLJiSWzCG3Okoo0ZkTbUd3z+jjrcsX2hibWJaC?=
 =?us-ascii?Q?UbZdd2a6VI/mgj9is53lD8TZYrAuYE0AM70cb1/Eo/oRqA5yQdnJ1IusYYuH?=
 =?us-ascii?Q?kYO9Uws2qNhZmEEbROWo6DJbbu4g3qaY9iIaQ6DljR68XooY2lkQdR9KDPt7?=
 =?us-ascii?Q?2nENtjtA11Atyashygw51UJk0Kc3NII6cOMgH19FotqHLm9L8cwY0C/UDu4l?=
 =?us-ascii?Q?0OCLiKbpj9kypcfXWjQURIlsN1FiIBfC7ZBh1pIZcNDsRFWA6Cd+uUGN2b8S?=
 =?us-ascii?Q?2KVZTVu5wBbXAJUbyWLN+RlQzZP6ORvKNL1PFQ1++PSwyvfjaN/HW25Fu0c0?=
 =?us-ascii?Q?czWzSDubQSHDNBF7J2FYDrJ+yYlULkXqcDGQZMv0cz1hogym9y5eyBaGPLyW?=
 =?us-ascii?Q?SIOcJv0JVF3els9FdAjd7T//t7jdgyF8jSyysjyLxeZlGtmoJ7vvWaen/fRW?=
 =?us-ascii?Q?iiWP+bR3ZGqQnTNQyrOH4oq0LiMZJdmw0jtyNjRhfprvdthlOnZtSNeMQK7Y?=
 =?us-ascii?Q?+vA4RzesnM7+36rooEDihxbb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6444c0-32a3-4e9b-1ed5-08d95e34708a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 08:29:17.0375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGdL9mC0H5aCzZGpcWgb+IDMztWgJE/hXrNRwkxZJfW6BUhY/HtcC5D+sXIGNmYzdxnx5VH/mJnafknnJZgxyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4350

On 13.08.2021 09:26, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2021=E5=B9=B48=E6=9C=8812=E6=97=A5 23:33
>>
>> On 11.08.2021 12:23, Wei Chen wrote:
>>> --- a/xen/arch/x86/numa.c
>>> +++ b/xen/arch/x86/numa.c
>>> @@ -270,6 +270,8 @@ void __init numa_initmem_init(unsigned long
>> start_pfn, unsigned long end_pfn)
>>>      /* setup dummy node covering all memory */
>>>      memnode_shift =3D BITS_PER_LONG - 1;
>>>      memnodemap =3D _memnodemap;
>>> +    memnodemapsize =3D ARRAY_SIZE(_memnodemap);
>>
>> But this doesn't reflect reality then, does it? We'd rather want to
>> set the size to 1, I would think.
>>
>=20
> Yes, you're right. Actually, we just only used 1 slot. But furthermore,
> memnodemap[0] may be set in acpi_scan_nodes, but acpi_scan_nodes doesn't
> reset memnodemap when it failed. I think maybe we can add:
>     memnodemap[0] =3D 0;
>     memnodemapsize =3D 1;
> How do you think about it?

Well, yes, if data may have been put there, then resetting of course
makes sense.

Jan


