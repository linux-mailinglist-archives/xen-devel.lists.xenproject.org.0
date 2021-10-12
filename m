Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D6D42A1E9
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 12:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207075.362820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maEto-0001Hq-Um; Tue, 12 Oct 2021 10:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207075.362820; Tue, 12 Oct 2021 10:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maEto-0001G3-R3; Tue, 12 Oct 2021 10:20:44 +0000
Received: by outflank-mailman (input) for mailman id 207075;
 Tue, 12 Oct 2021 10:20:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maEto-0001Fq-1a
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 10:20:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d99357e-2b46-11ec-811d-12813bfff9fa;
 Tue, 12 Oct 2021 10:20:42 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-kaDB7sXmM0WWGYZg9zG1pg-1; Tue, 12 Oct 2021 12:20:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6670.eurprd04.prod.outlook.com (2603:10a6:803:120::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Tue, 12 Oct
 2021 10:20:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:20:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0322.eurprd06.prod.outlook.com (2603:10a6:20b:45b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 10:20:36 +0000
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
X-Inumbo-ID: 0d99357e-2b46-11ec-811d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634034041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vn6niiN5/polZaKHLQq7Qh7EXq+UY/qH5iK5QeVq9NU=;
	b=Dr+atFJaZ85BMc+3OipZ0YYrKcIK3rDbFLi75teknwvJZUSUan8//mjW7NAYE6GD4aL8uH
	FwzMYYKygJq5VRSO0S6Z+3Sf4EjShplplF906Vdg8IJ65EaKBGPBPzelppPfL1yfSg/3Ed
	r2el8pQpY2Sg5ybDcwHrOUHRMf/htLs=
X-MC-Unique: kaDB7sXmM0WWGYZg9zG1pg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJ53Z0FKC+pbHgk+xNphy/tUnlIbavGHw2+2/ACNZt8OM/nvsE7s9SnGjfjzHA1veE5uMSS0U0e2t7026iE8Y/0SGaM7UQWsAy1ST4unqP5R/zsdEE7L6WY9u1S13novpwsKRdYxUMfHXstwFSv/d9wqDUbGJedLfNF/ocjz4Dri1a013VQlt/IX7px959172Qps53m5MGvKRfx7bVjLMwSAKPcNt1IovYOz7q9C1D0QMRTDNb3TIWjHYMvX3vWFAWlEDiQmE+JkKkCfcr7lcLAXv9+Yi5AbYUYhpbGqT9k1ESd9zrUlip9w1wbRsVj3itiooiEBuT2uu7ynuSrMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vn6niiN5/polZaKHLQq7Qh7EXq+UY/qH5iK5QeVq9NU=;
 b=HZIM3l5sPF/NrGuMDkxMw6zZl7eQdODjWhjn9h0/x8FN+vy3MRlQFTwgMzih0dGbNAt/xS823BFJndJj/YxuwfhPE7rvH/OSysfBD3Q2lhYSVU1NbYFmFB08dnzGe3Wdfp/8SoZ6O/p84CWbkra3CS5FyqVEnROzHbeLP6S4TS+OLBuOTA66bOisdkAw6epoUghTMgSMVGZgttMLB+mwdnZ0quuMAOj5y9MAB18jUVjyePEeguF70pF7ev5Scb5UMIMRwluvEUTTTsRv14YjnofStI/hEArQFk8CwZJVv/cJjxvI/vXnHGZFkYtX/thX0m6IYtENa7jLqtvql11yVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andre Przywara <Andre.Przywara@arm.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
 <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
 <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
 <YWRnMfAi808TQ4Gt@MacBook-Air-de-Roger.local>
 <EB1CB53B-9D5A-49C5-A687-841BF94A153F@arm.com>
 <ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
 <ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
 <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
 <c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com>
 <c125b447-53e8-7d13-3b08-af62fd3a9140@suse.com>
 <c6b6c22f-fb8a-f2d9-7735-f1ebc9809908@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <09656882-b297-7144-c291-1ee997edb119@suse.com>
Date: Tue, 12 Oct 2021 12:20:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c6b6c22f-fb8a-f2d9-7735-f1ebc9809908@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0322.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 742714b5-421c-45ed-f217-08d98d69eed6
X-MS-TrafficTypeDiagnostic: VE1PR04MB6670:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66702A79108CA21867C3A64BB3B69@VE1PR04MB6670.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	49u6vKpbA9G1JNmc7qDQ2OmEdL0urFhDtJkUrqlutMxZ5abu5arF8StCPHAiiDa4GYykxb8S1GFWimRdLKYutdTmTUp0427/jYIhToAuTiNnfGX2fSu1YEiEoNNfVRO78Pm9Qof10Rrv0GRC9Et41Mc4/7w1UzbZm0N1MXvNdn/j7zK2epaFtOzlBRcaMlQwjJCoooRBpYJd+Ae1lOVk6Gz03ntlh/qFRbETNffYnKVpyzOjqo+peOAQ9K9Pr0KGBnUu1u/QJH6fuXh58aF9HgZGr42kL9NL02/w5/W2OS4/vUg+7JW4pOqCrEiA/0s1FFE6zuL5UZSJNO844wXz0YV6+/KjoRKJVZBo7eRUG+TRA9gKOZfMR1kLEIM4rpMR9Euquy26qN0kP//zZf2w2utN1Zp9cv3RjWHjm7qh8q2DQu8iIPpMBuu9XXZIVYVvgS1ifiY089kBJeo+JvkHuXEDt3Uf7lcTaZ90BF3PdiuR0WOcW88fiClnLfkD+qOkfa03sXLVDcbe6OkcO568aUBhW3fLD3JS6lbefrYyicy8yaotAyZKwyYqYY1eqOMzVYKyKA31Nlwjti96ETd639I1RVBqhNU1YNE5AxOCzdBbl8djX1hGg1zCoLiVC3/1DB7SCYg3XWuqv4h0mMMaC6bTZMhifJd8vSswaS+As6ddmNVpDSp2SX4mNqnLxAHCzVGdEZWenkrQTn25TxIYM25/vk0+oIbU7GIabWoIG1o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(2616005)(36756003)(508600001)(38100700002)(66476007)(31696002)(4326008)(66946007)(66556008)(186003)(31686004)(5660300002)(956004)(2906002)(316002)(6486002)(16576012)(53546011)(110136005)(54906003)(8936002)(8676002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3ZmYklqNm9YbktvRGJ5OTJWVXVhd0l1VUgzVW5HeHhtZEl5Tm9QWHZIcFU3?=
 =?utf-8?B?dG1rVzlpTlFwc2hCK0NNZUk3YVJaRThNcEFvWEZNZFd2dEZ2K2h5QW9USDV2?=
 =?utf-8?B?dmhCZnBJNHhwOHJrY3g3ZEVETW8xdzlRQ1pDTnpaNEFMRkFzUW1pcEFHTDBs?=
 =?utf-8?B?cW9JU1JzT1AxV0loNTI5R2d1QWc5R1BESUdOZ1NlTkxmZExKNW9CaitjOTQ5?=
 =?utf-8?B?QktiTERwNUk5bnZ4N1VmRE5TbmZ3QUpEZGt5cGR4MUlnQXB2djNZVzlacU1p?=
 =?utf-8?B?cVF5OFN5RXVoc1phZFVpSVdubEVmTy9DUHJUaDZ4UXJhTjE3aCsxcGFraE0y?=
 =?utf-8?B?bTVWNXFVQzF0cmZqOUZRazNRdXNNTWk4eFNGVjJMekFmOW9td0hXSWFGOGV0?=
 =?utf-8?B?SEkxaWJ0TmVMMlEwTHdxN09iV2NiTkxEODdKOTE2cmgzK0xaTXgwUkNpWmVa?=
 =?utf-8?B?QmVsMFkrMFhkM2VVK3lOZ1N0SldLYlVORk1GYVUzbDRqdzNlMVlyUWVLKzJn?=
 =?utf-8?B?OWxVdkZNUXdTVlUyaVROM1kxR01pckQ3bTg5VjQxckNjOGVUYTdZcHNxdlpI?=
 =?utf-8?B?eTB1eWIwMXdkQVE3U2RrVC9HZGcvUi9vWE5idjRBZG9Jd2xZa0FyeUgrUXNZ?=
 =?utf-8?B?NCs2bXR1Z2loaXFJTmNiNGczR0RaS2wwZFpJbnVXdTJrZGl4SFRVVUUvQ3dw?=
 =?utf-8?B?VWMyQmd4NkhsVlFCd0lNUUtwZmYyTmpMVWxwK0NCZ2VmSGlsRE5IV1Y0TWc3?=
 =?utf-8?B?QUMxSmxaYmwyRDZJUXlBZGlpM3NGdkxjc2ErSi9US2dyMkhwNVNoaDZFclBq?=
 =?utf-8?B?SWdOa3JOZ2FzM05UQ3VpVHRwclcxRUl1d0N6cFUyOUx4bnk4QUxmWGV6S0tG?=
 =?utf-8?B?Y0FEWFhyeDhKd21yRUgxNHVmWkY3T2Z1R0tqRFl2MkVlN2VieXRKQTRFeGpk?=
 =?utf-8?B?clBZaGFVZHZXaHdmc29aQmNuRnBsVURyRVJqdGNYT2xUMVN5eFIrcEM0LzVW?=
 =?utf-8?B?QnZCUlVEUTRFN0NCNmRsWGUyaDdHNGQ4YzllZnJ3WVBZTkxQRFdjL2pDTlJG?=
 =?utf-8?B?QWcyU3JZa2ZPcFU5d2s4c1JnUzFrNEc0MmxGZTgrcXR1SGFuMlpwT3oyZS9M?=
 =?utf-8?B?MkFjelhxaVlOdXZ2Sms5VUdVelljU3FuU0xsUWtuZ2xseFNqR0diQnhkZWpD?=
 =?utf-8?B?dDJCeDBwWTQ0MWlodzJLMmM2MitvbUZsb3VRQ3Q0aU5BYTRVM1Y4ZmFnWjZM?=
 =?utf-8?B?NWJYSW1EYmRJS0RvWW1lSW5CSmhudm1maFZMaFJDRTNMd0pWZkdyRE04Lzd4?=
 =?utf-8?B?MUJqYm95MDBha0VHOGI3VVd6VmFnRlZFeGNXSHJQaTBpRzM3ZkYwUTAxVEkr?=
 =?utf-8?B?ckRRalZBL2FINkhGMTMxVm5aTFc1bkRKRm1CVDErK2hzU2NHQjg5ZmlVK1lh?=
 =?utf-8?B?RmRGU2Yzc1lzV3duZHBkR0o1ajFpOFdBZGQrUzcxZW95VVFEa2NYQ0pucjQv?=
 =?utf-8?B?ckFVeWJGVnh1Y0dWMSthZnM2NHdSd2NyeENXZTg2LzkyTUxLSForWFZXZUto?=
 =?utf-8?B?cmRSY2QwQ1hlTFlVdFYrN2JZdmRPM0lxSGt2Y3ppM1RhYUhrd25tZVFWNDVy?=
 =?utf-8?B?QU1XZ3JQOHRHa050dG5EbDRPTDdyajJIaXF1a0ZTL0U5ejBrT3paK3BLNS93?=
 =?utf-8?B?OUFGSG96Umo1VDk3azVlL1FlV1NhUjJpZkJ6eDlBdGYvRUNESVMwUnIyMkxt?=
 =?utf-8?Q?KwSDiLeyMIPl8wESTMHjJDCiBoY+rl0Ny80B7fo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 742714b5-421c-45ed-f217-08d98d69eed6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 10:20:37.1010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8d3ZAI3DRk1lTLUradsr1nv7Cm9IihsUSMI/hEpIj4MLVzGSqwlEfx3eovD9DSmQW+YoHlMFtwV5djyAvXvvdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6670

On 12.10.2021 12:06, Oleksandr Andrushchenko wrote:
> On 12.10.21 13:01, Jan Beulich wrote:
>> On 12.10.2021 11:38, Oleksandr Andrushchenko wrote:
>>> On 12.10.21 12:32, Jan Beulich wrote:
>>>> The minimal thing I'd suggest (or maybe you're doing this already)
>>>> would be to expose such BARs to the guest as r/o zero, rather than
>>>> letting their port nature "shine through".
>>> If we have the same, but baremetal then which entity disallows
>>> those BARs to shine?
>> I'm sorry, but I don't understand what you're trying to say.
>>
>>> I mean that if guest wants to crash... why
>>> should we stop it and try emulating something special for it?
>> This isn't about a guest "wanting to crash", but a driver potentially
>> getting mislead into thinking that it can driver a device a certain
>> way.
> Well, for the guest, as we do not advertise IO in the emulated host
> bridge, the driver won't be able to allocate any IO at all. Thus, even
> if we have a BAR with PCI_BASE_ADDRESS_SPACE_IO bit set, the
> driver won't get anything. So, I think this is equivalent to a baremetal
> use-case where we have no IO supported by the host bridge and
> a device with IO BAR.

Oh, now I follow. Fair enough.

Jan


