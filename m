Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894B50F6FB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 11:03:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313571.531172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njH5x-0005vh-GH; Tue, 26 Apr 2022 09:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313571.531172; Tue, 26 Apr 2022 09:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njH5x-0005sw-Ch; Tue, 26 Apr 2022 09:02:53 +0000
Received: by outflank-mailman (input) for mailman id 313571;
 Tue, 26 Apr 2022 09:02:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njH5w-0005sn-1M
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 09:02:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a650bfbd-c53f-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 11:02:50 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-4js75XMLPaOgpmiNv9y9lQ-1; Tue, 26 Apr 2022 11:02:47 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4836.eurprd04.prod.outlook.com (2603:10a6:208:cd::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 09:02:44 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 09:02:44 +0000
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
X-Inumbo-ID: a650bfbd-c53f-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650963770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x35vDbHqDus8D94MvlrwML05cIVW0G4PvZ4nKACIxOU=;
	b=WXaNzujVFZ9Aq7PuBx5ob1W5Cl7dlBd4VZ1ungoh9+SPQekzSHaLEgCEFPp26nNpbsP1mo
	7A0F1LTR0esnUlKvh2R4loT+rxEH6Fijf8But1ddlF4xlwlTC/qqRmVB7c+cmIUcflbrj3
	A6axOQ0YVBFwehKYvQmD8PGK7tXtI+E=
X-MC-Unique: 4js75XMLPaOgpmiNv9y9lQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRtS06mtuDq0oylCJVG5/ZUTiMyV1TWrj2kApCtBGLLmAjVeABTYxzU+X+nqOJ24wcsMsh/dYg/XsZ8TGgsdEejm0B6JaPqHc/yi1ErmFAc4uviULa+BlDJFrk8GZS9R8vCEAGrkxdqIISJkfflY+vtGBnv1t21k0z6sJ8sVCy6fz0mxCt0EEfXxWMr8ZiiVI4uIZtJjDODzUdRcCB6O+ABZNS3DrzAFvloQ+IaPRCbDi0/w62L/9nI3S+zJm1iXOg5TGmXlOfZYvjmFEPhVfyWzExKdOGPtUZToOqtJp1b6edboBZNX7ALyG6D+4PeHigdpI7UdMtzsccJ7vXm2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x35vDbHqDus8D94MvlrwML05cIVW0G4PvZ4nKACIxOU=;
 b=JboabU6dHi8CWB/w/wP692hSbgJYp+dsjXoqPPTMCpTje9xhTzbkrrUWUgt2Yo3IBHdtmgT22TCKKDdJWUJ7ctetKqrzSwgTgyNkTZbKXudJZrSSb2hvVBLgTz6o4Hz8rCGt928xgzR/T0aLH9U7M3SJi4gLZNwKroPJGSH+z1Ohiqx04B+uuDYCSKtsFXcgE/DXWuSVI1nW9w85PPfuOnbDxscdUP+d3pcQp4aHaoN0H7yJktKszbFJ3F0jlyiCPMhG1M/vdT9LWTUZV6mW7PXy5oy106Wm0ilmSbm8M5iSAhb5iJp1zstNv26r0KSmJy/QzdzxtiMBUo+zuvjHwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d666aa4-c0d3-b8ed-9fca-e9d2179564d3@suse.com>
Date: Tue, 26 Apr 2022 11:02:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 05/10] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON
 for phys_to_nid
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-6-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220418090735.3940393-6-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0046.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da545736-9dc7-4fb6-8300-08da276386c1
X-MS-TrafficTypeDiagnostic: AM0PR04MB4836:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4836156694FE503149FC1776B3FB9@AM0PR04MB4836.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	APUqBa+YBRY99wfJNRT3SYu2lRQXqSwHTIJF3267sMMG8ktoJYoBnSCvMDisABhoVTCtwYV8a/+wZKMDgYzjJ2p/sNu1XUIBogchhQwS11a0uPEjXcnzybOBPrP/DI4BUz2NIKGXEZklNWmu0wiv9MkdhSqvmBZtUpnWQO/lpMpNyHz3SNhJAGPsJ9nI2ZtMNbY3MXn8mlsUkWlY0FngjEwwPyBicF4N6OIM2FxCYevWxyX2xh43Ze0ouxdQmk+mj6CbA3rd9jvEm8qummNSmTMq7gI8qjg2SylGMI7KsoeqdsBcPX2PNfkbSpmYXyUjHbn0sGE5vvVRsKKkJ8Sk50Mbc+PncwcjEWofngUyehGCzGsNHk9ppK46UL1Gg7BICyYh8nk4E9TaVz5txkfWtHip+8qkcvhn9DO0Rwvpi2OSzp27JfYDfuDEJO0IEvoZxr3wZ3Vt7YhtKSQh5wJFRX3I7PSjnBXYhP0adIouDm67eLHCH29jDEOnIMZxFMjnVYGUY62a12HLqoH+/MjBhoJTVJUpSFp5xLYlgdnP9lWLhEp4gR+gIf92NJkCnpNeofBqoUca3RsMs0XGSpbbTIHboU2Hjl6C8/635OvyWHBnLAqmcbPZHThfftks46k8g0TxBYHOUrOJj7zY90VjzycjaLlKD7G/m1h8Ah7fIh/necp6eWfz7sY+syl+Hyq+aKPVluSmaxlafjCEamQX/Y8WiHA6jfFU2TgBRwZlYxePTrrNZYY+pa7wumLLgPOV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(66946007)(26005)(6506007)(86362001)(31696002)(66556008)(316002)(36756003)(6512007)(54906003)(6916009)(6486002)(66476007)(8676002)(5660300002)(4326008)(508600001)(2906002)(31686004)(186003)(38100700002)(83380400001)(2616005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWxVU0FQVkFiSENyYmVMMmhpcTh2VmdtamcvU09RdzhjQnVicUR3TlpkTU5K?=
 =?utf-8?B?dytTc0RDREw5ZWxhOFEyWk5QSEw0V25hS203bS84NDBsekNLbWwrTlZUTXZt?=
 =?utf-8?B?VDJHU3UzUlY2Q3M1QVdtK2x4ZExnS0cydVFvYnoweXhVa3hpcU52QU9QTFJ4?=
 =?utf-8?B?VFRmVzV4OFVxcHdzM01ISFlROEpmd2s3dndkZFVkcFBMYTZ4S3BNeFd2UUZH?=
 =?utf-8?B?bDFrRGNSNXNlZmsvT2ZUZ3ZuMTVwV1l4L1dtbjF6NkRJMFlaeExWSmRpSEZB?=
 =?utf-8?B?azVjb2E0Q05JZnJTRnlQOVdRSmlpWWZtc0dhWTVDVTdhcWRLcjRJUHl0bzRa?=
 =?utf-8?B?bVFyWHZEZW4rSTBJTm55blB1ZnhOODRTU3ZRWVh2YUpPV29hTDdobzdIenll?=
 =?utf-8?B?aGFnWXNCcVR3aTEwTFhsblk4V3F6V2pZRzNyME9Od2kwbFZ1U1NhSDBYcHFM?=
 =?utf-8?B?ZkF3QTZiQlFYZkppN3J0TSs1MVM5MjhpZ1N4R2tUVWpQNVlqUHU3aHVNK1R5?=
 =?utf-8?B?bGxXYWtQOWR1RDk2V3pWaGw5UzMvSXZXbWRZaC9zcW5aTTQrT1RhVVRzSnU2?=
 =?utf-8?B?UnU0bnQwQlYvVS9OVkRTRHJTSUZOMEVZWkY1SVR2WklBTFNUNjhwcE9IRGV3?=
 =?utf-8?B?bU5JeWtxTHd1alVrV2hxVFlVanNuVEZURmRwWmNXRDNIc0JRQlBNUStnUi8y?=
 =?utf-8?B?b3VyemVkT3JYOHJnWThtNmxJcXhBZkhra1hOajVlK3hrRUt2SW9KZ2phSjA4?=
 =?utf-8?B?R3NGcU9BaXNnRDErYk1wWXVKd2VWT3pWakhhL2J0TC8xYlNMMTFQVmkxbGRp?=
 =?utf-8?B?YVpwNXVicG4xZWxlcm9QQVNrVnVOb1hYU3owWlFYL2Q3K2k4bFA4MHlnNEZp?=
 =?utf-8?B?eGpiOThUdTZPeEpmMG1ocHNId0JCL1JxUnRRckFPeGF0bU40WkcvU0lKblNG?=
 =?utf-8?B?cGdRTU9DUmpPeVBOWVg4MVZ4bGo5MDlwZWVBTTJLZytHZHVScjFpZjJhQ2s4?=
 =?utf-8?B?T0ZOa0R2cXoyckxrUlNoZDkvVE0xKy90akhrR0kxNjB0RDNkak5LY2s5dDla?=
 =?utf-8?B?aG80d1Z3U0t5VS9PQS9TQjhTWWlDVjlqT1Vzb0Fxb1BiRTJmYjgyZFl3L2hO?=
 =?utf-8?B?YklaZnRDM2tXRVU5M1R3YTZ5NTRHV3NKanpqOEJUNkhyM3g5bmsxSnpFUW1s?=
 =?utf-8?B?WHQ5THhRZS9ESGFtYnhJVGhzblM2U2QwQ1JvL1dRRS8wTjFlbktmN3BPL1BV?=
 =?utf-8?B?UmgrNS94TUZrNnhJUFVuOWlZQVpPVEU5MGUyaFhXYzdwRjJCbitnamJCbkQz?=
 =?utf-8?B?MXhoQmJsbFhIVjg3NytMZ01NK242ZUVsSUxtRkg0UzRjc2RncktaRnZ0ZUl1?=
 =?utf-8?B?c05zck5mdGpad2d3SVNnY05UWXR1RHpzZzYrWjhWZHo0bW5RbmF5T3lUQlVL?=
 =?utf-8?B?YzlDSlVFM0hFbkhNSDVOdnFoZDlCTlViTWtzU0xIQlZoYU4rUkdxRTRQQnRN?=
 =?utf-8?B?dWFRRTZUSlhKOEpQLytIbXR2N2NYcStGc25IUml3cHJHZGYrWkplajhFdTQ3?=
 =?utf-8?B?ekNFTWw4dy9aTUJMdmR6STlPTHJvYmlnQ3pIc2l3RDRFWlVaOWNtbTJpWklx?=
 =?utf-8?B?bUJjSTQ1TFlscjRvZTI4eVVQSE5YLytSUEtrQ0ZjblBMMmpZMHZETUZLaEdq?=
 =?utf-8?B?RHVJb0dNMCtmSXgwblBQZDNISEh5cEMvMzNWcE1xdXc4dmg0azFiL2xzU1dv?=
 =?utf-8?B?dCtJc2dOVU9QMGkrOTZycGh4OVBkV2VpakVVRnhQazlwak1xUEdRN3pkNFlJ?=
 =?utf-8?B?a2dxL0FJNTN6cWZ5UlpUR1F2S2p5aG1ZYlpCb0kvWUgzZ0E4Vy9DWkkzTE80?=
 =?utf-8?B?YkNXa0xTUHRaelZZTHI0blRvTEZDQXVvZGRZY3dCNW9LRzkvVHg2YW1RK2dY?=
 =?utf-8?B?b1hmRHBtWklvS3NuNlJOVmFZZ29sa2RYdERoZU5uQ2NsbERKRVZydTZ0aVMy?=
 =?utf-8?B?TUxHNy8xRmVodGhaeDBJSXpJK2tuTkNDWVc5eTVXTEYvblNod2NnS3cvamlv?=
 =?utf-8?B?MGoxbVZNREZFWUUzMGhNYmdJbVlaalJNVFhHRHJPOXJ1Z08xaHh0RnlESENo?=
 =?utf-8?B?WEVra0h4ZWh3dHNlN0lPZ01VVnV0VWJCZ0hDV2tPR3V6Z3gxSmJaQzN0U0Ja?=
 =?utf-8?B?bURpckpDVVRpaHBMeU05MVJRODlXQmY0M3QyMnBnSHJVczN4ZFdFNkpSNEdy?=
 =?utf-8?B?ZTZTOFVSYktPZ3ozU3h3b2wxQlY1MzhtbU41Q1VMbXJRQ0RtV0hPR2FlOWlp?=
 =?utf-8?B?QnJWWjM0bFJvdlhZWmxSd1d6Z1VDMjYzVW9iNWNzTTdEanZreC94UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da545736-9dc7-4fb6-8300-08da276386c1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 09:02:44.4139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuYjgQn+iSsGfqK8DdJyJDlhkUFPAPAmqttwoL01LBso+BvA47Lvk5rzvBzSXT9i9DGRvMAc5V6bTB1uXpcd4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4836

On 18.04.2022 11:07, Wei Chen wrote:
> VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
> results in two lines of error-checking code in phys_to_nid
> that is not actually working and causing two compilation
> errors:
> 1. error: "MAX_NUMNODES" undeclared (first use in this function).
>    This is because in the common header file, "MAX_NUMNODES" is
>    defined after the common header file includes the ARCH header
>    file, where phys_to_nid has attempted to use "MAX_NUMNODES".
>    This error was resolved when we moved the definition of
>    "MAX_NUMNODES" to x86 ARCH header file. And we reserve the
>    "MAX_NUMNODES" definition in common header file through a
>    conditional compilation for some architectures that don't
>    need to define "MAX_NUMNODES" in their ARCH header files.

No, that's setting up a trap for someone else to fall into, especially
with the #ifdef around the original definition. Afaict all you need to
do is to move that #define ahead of the #include in xen/numa.h. Unlike
functions, #define-s can reference not-yet-defined identifiers.

> 2. error: wrong type argument to unary exclamation mark.
>    This is because, the error-checking code contains !node_data[nid].
>    But node_data is a data structure variable, it's not a pointer.
> 
> So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
> enable the two lines of error-checking code. And fix the left
> compilation errors by replacing !node_data[nid] to
> !node_data[nid].node_spanned_pages.
> 
> Because when node_spanned_pages is 0, this node has no memory,
> numa_scan_node will print warning message for such kind of nodes:
> "Firmware Bug or mis-configured hardware?".

This warning is bogus - nodes can have only processors. Therefore I'd
like to ask that you don't use it for justification. And indeed you
don't need to: phys_to_nid() is about translating an address. The
input address can't be valid if it maps to a node with no memory.

Jan


