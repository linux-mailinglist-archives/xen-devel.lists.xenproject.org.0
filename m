Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CABE157FAD9
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 10:04:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374445.606498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFt4i-0001Bc-N0; Mon, 25 Jul 2022 08:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374445.606498; Mon, 25 Jul 2022 08:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFt4i-00019a-Il; Mon, 25 Jul 2022 08:04:24 +0000
Received: by outflank-mailman (input) for mailman id 374445;
 Mon, 25 Jul 2022 08:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oFt4h-00019U-DJ
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 08:04:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 645b675d-0bf0-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 10:04:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7119.eurprd04.prod.outlook.com (2603:10a6:800:12e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 08:04:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 08:04:21 +0000
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
X-Inumbo-ID: 645b675d-0bf0-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkRZ+hgeQzKN03JFqFe9tCz0vPMKl3HRXbc4B9klujxTtlMNJkytW1kh7BfGuHgkrGQOriyHYrw/4cnjaAFsGv2DaiuVVsfi+quK8cOzk9Wvh4l94FSoJdW/24pTIXLpfmmyKJThML8VhCsj4xYvk9MpIUc1LGtUg0b8w5eUqfJAg3HCJiPtrViYItngTOqeeBLTitdxnz0Kj9yqRZXO1QCnVo7GeRc8wY+gbEPNfL3G53Kira215Dy1xO7QOCJl1ZZrHcryxvBa6R7PKWUm9/5cW3CN/Bd9/ZVmX/DDz3DJdlHf1Cq4jk+BwYo6C9XhxH35I0Y9Y9a4VdogbQHwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhP/YKy/mAv37Wzk0qENE4pdZtbRspMJLZCokmVPwTU=;
 b=Nw8C+wkfRcb8V5Rvqt3YPDCeihQyc9iaQGeLasq/l0idEDk//h+HXDGGyD8PPlZ3T6/GcWEM8bwxKH+zNd/hdC+ys5MKecwP2+IBo2Uc6azl+VI8ZSEMS5Gn7r44+DRcycvSbpRdkI29iAMYXKzNlKVwXTHRHlql6hsMgkM258/nb19lcUqcLqSap46GZqikcpeANf9cDTIt8bzEiZJd2kSB8Gjx78Db+f64aV+e8BpKLmaEkpEgCwyfwp/JXIOVTY6IW+ibrbZ4/aogN9c2IHy/dBiNTSeqpI+YGl2YGBhbW9sGvUWDtYQPHqDj49LFizbCDYcEufsxhgJkFdNcqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhP/YKy/mAv37Wzk0qENE4pdZtbRspMJLZCokmVPwTU=;
 b=YopYgIKUwY6kEC8hUcbxNUr6MEwd/qWUr+EwDK4NI7eareRWzXSl97YRniujA/FofW6rg7fucUMcAbMTpmGlOWIxcdpTmWDb3AIALttEeoVGcYabwsqCIKzij2Honr3kAAEqa5R8tfl2md/lUqY3x/p50Q6hJxeeeJ2VRTHNO3sjQEQ/5axf8StTAc5jC7buQ951gE91Fi0m750960Rdj5/LWjckpiwB3jIt2TR2CeFLs5EOL6Z3Px3I6Zu6mA75VAY68gnhDCkLPDpdjt38QKIjy9ZoBdKlaWVlJs9AlIVa4kqxu5R/GeknrILnU7zlED6ZpAbExHkHdHM7SzO0Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d45c75a2-81ae-7061-6f75-ed8378fc6d16@suse.com>
Date: Mon, 25 Jul 2022 10:04:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] livepatch: create-diff-object: Check that the section
 has a secsym
Content-Language: en-US
To: Sarah Newman <sarah.newman@computer.org>
Cc: konrad.wilk@oracle.com, ross.lagerwall@citrix.com,
 xen-devel@lists.xenproject.org
References: <f0dfe416-76d3-0380-ba8a-f24e12c83a86@suse.com>
 <20220725032053.12933-1-sarah.newman@computer.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220725032053.12933-1-sarah.newman@computer.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50e99a5d-3e9c-4228-756f-08da6e1447bc
X-MS-TrafficTypeDiagnostic: VI1PR04MB7119:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZbtZXBJfk9ZHDuaqNPQ3FQaOZctHm2NfoRB0bSKqaK4VuXD3U5epBEXAVXbtY7G39cDHRb8NsJP35G8eJRFlOg5YO+aCZil5WFGrp3MQK/mdIVx/twPmXlSw5PUUp+h0le+pDVTg2l0uCZiup0THrM8+oQ9IZ4tnkMmohfSNf2i80a6jJ71O5zwuu7Vl/XiUR3J+Am8Uz5MXWUU3F8M5DeumQK3Pu2GizU1N/lli2v5qAVNz8jx1bTdYrFiJCu3ii0yM06PlcJw5Xqi8+0fZk65QDEhHj9C7S1DlBg64TLzytF00jFOgo9wPUOIxXP3HGncOfh3gnkq9ConPp+liQ4F9aJPv1Fc3d1mo3vyxGmjW1xi+yymA5w5n8V7ZEFh6bPfIVfc9dwiC4gyuEJARZFMHnjuWN1vDQmgtPONyqEAovH1wAwxYU6ldpCkM4IIoJsumuOEApwYFcYA83Ek83QiuFwZ0h96ek/49F1YVKjIm6vhXATFcleR+IzeK+U5rB8VFBZABpR8ICCc39I4eSjowjPYh5DY+xVdjqnVFZV4/rVvBDVf3lAPS89fEgZtNimIfKtrCLVNZVhv9zZYMioEnzqbo4V784Pgtgk2l8Ek4riiwlQARfafN8wur7aDAa1FC0zHJEnLqnIsVwsN+uxgsyBEVsMZq8Z2PsJGrzIqktXAc1a/VZl760BDrpo0kt3R0wJaZGh+y6c36aqWn+vhdXjTbSGC7emtjP99Fl0YZg8vVGQtDwC4OfIeJ3l+UncRGDrfSz5hQB7nmDMCeAT1Oru6zhUsA8xd2G1wOASj/c8ovi2UhZ92iHJ4vtPsZOsxS0sQzyfj5EAAs/klxOoX7D8aAcVMWyVhIFb5tkLbUOnYgSX9sMinzh9T9mYcX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(136003)(346002)(396003)(39850400004)(66556008)(66476007)(4326008)(66946007)(4744005)(53546011)(5660300002)(36756003)(8676002)(2906002)(8936002)(83380400001)(6916009)(478600001)(38100700002)(2616005)(31696002)(316002)(6512007)(26005)(966005)(41300700001)(31686004)(186003)(86362001)(6486002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUF3TFdhQXBxVHpwVW85WWNPUzQrNEYyT0VrL3UxdnR2UmE5SEd5Wm1GREtN?=
 =?utf-8?B?ZnJ2cWhNRzlnQkJDZ2U3dndLaW1CVDNSL1NueHBhbGRhcm5lWlp3aGpmZk1B?=
 =?utf-8?B?U09OWnRqNW52cWM0bkl3ZHlWZGxLdTBPTnU4M3kzVHVQYythMmYyeVJFTFZT?=
 =?utf-8?B?aGZYcE0vT1M0ZHhCVnRKdVJHdmt1VDd1dTVQeGhrN0VDNmpuQzk1SGNoQ0Y3?=
 =?utf-8?B?K1hITCtJdk9PWEc0bS9RS3ZITTlXZTZ6RjJIdDhHS0piM3FxaXZlUStxd1ZS?=
 =?utf-8?B?djYrK0pnREgzekZ2TThvYzh2dTNyYlF5bkdLTmdBdWhRR3Q1RjhoWXdjeDJo?=
 =?utf-8?B?Tmw4WUlHdkZxQkFWWm9ucjFod1RpSjhLbWdxN0IyUVB5K25ETWtYYU4wczVt?=
 =?utf-8?B?MUM2R01RVngrOTU4czJiNWlEZVRFWU5tQVdoYXNybjd0QjlqL3RIZDFKeVhn?=
 =?utf-8?B?NzAvekJsaEkxcGttVUduSXFEb25rYXkreDhqcE5TRjlLaElsNVI4RU9lblNx?=
 =?utf-8?B?R2NtUUZGQ3NOWWVIck5mWFZobkovR2wwR3h3WFRTUDNrVDEzL2kwMlFKbTE0?=
 =?utf-8?B?OE1XOW1tdjE4aVVvWGZJZTlFTUxrODdkUEt1UDExRDkycFYrVjQxSzMxdXVR?=
 =?utf-8?B?WTJiZ2Y0UXZOdk8xSm1TYTRhWi95WXFYbEM5Q2tBZVZxYVlpVjhpUzRWNFp6?=
 =?utf-8?B?ZE1Uc2JjYlFOWE9GeVVKaVdMRG9hd2Y2MlE0R3Q5MUtiWDdrTDJaMTNTMHpo?=
 =?utf-8?B?OU1xRmUrckllSS90dVBzM0JaUkhpWWRqM3ZxQkxwTU1DY1pNZEg4VFdhOUJM?=
 =?utf-8?B?THplb3BEbHk0bUFNTTE2UEg4MG9GU1Jadnd5VUtjZDJSNWNnMjFRa095ajdU?=
 =?utf-8?B?YmQwT0NEWGxHWGJyamZBVW9QcVczTW03UW9HdFdJNkhoM3pQUGRVcGlGNjFU?=
 =?utf-8?B?L0QwL0xYKy96ak1vSCtVbWVxdlRuOWRJQXd0K2lxUDFMSTdFdFZSZDZ3bUVO?=
 =?utf-8?B?NkFmTzdudk1haVNscnRucVVCa0ZXVm1sSjhMVXRMai9OdVlYQkhoWWFEem80?=
 =?utf-8?B?eFluV2pFRW1pSXRkU3ROTmwwR2Qrd3lxeU9QREJUZlRaTWlrVGYwN3ZHQlpY?=
 =?utf-8?B?TGhNTkF0TEozeDdHNTJ2UjZOS3NlQkFmN1Fpa25qNW15cFJYWjVxZGIyREk4?=
 =?utf-8?B?UmVSRUNhSXB4WmdsUlM3NzBZbXl0ZWdmT1lqZEtYVitielVyNHpIaGtHSENJ?=
 =?utf-8?B?V0NiYjhkUWZYVmYzdmRUSllmWDd6NitTVlNqSDBtM1VFcDA1bEYyK0w1a2N5?=
 =?utf-8?B?VU1ZNitKd3F1T0FsT0QyR2g4SHY3NEF3SVd0WWlkMW8yR2R0c29JcWlVbEVH?=
 =?utf-8?B?WTk0RXUxY3d1TnMyb0NPSDQ4VnhJVDU1TWdBV0E1MlE2Lzlub2R3ODJ3QlNG?=
 =?utf-8?B?YkxCR1lleHQ3citPNnRUZkdUQTVoVW41UHU0YThMTVJnRTQ4Z3I5YmN5UXN3?=
 =?utf-8?B?akR6TmxBcUhlbWxTbWxTRWE0SzRUMGJvbEcvWXVvSVpFSVpPR0VnQ2NBdk12?=
 =?utf-8?B?cDd5Sm90WHdSWmovWGk5bGYrNGxQQ0tZdHRmNWFyNjJ0REVRc1A5cGQrQ0F3?=
 =?utf-8?B?cVlJNFRQNko2K2ZnVytiRVZ1SjlFMjczMjRuYlpyZzlHTHVaa1IvU2pVbE5M?=
 =?utf-8?B?Nmk3K1ZoMGFxMGdXa05icE9LdmF1RmVxb1UwS2pieXJaL1FZbHRNN01BN2g0?=
 =?utf-8?B?UjJLeW9VKzRCVTNrZThXdmxBWjFDdTBCakhSSS91SEt2RjdtcFlnZmJYRHpJ?=
 =?utf-8?B?ZnlWVHBNMm5ndE1wQUxQMW5LY3BkaVhnQjZxNDVVbWErTnhvcHJEQURPdjNY?=
 =?utf-8?B?bFVNSlJGajZzUzR3NnNiVGU1R1JKVVhkSGhBUTRzMktRbE0xODJ3MHIvNGNQ?=
 =?utf-8?B?SXFiRmxIODFlVGdqZDI4L3JwbWVDUHBzUXVLQmpjdlFqbUJlZGVMMWd4OUx6?=
 =?utf-8?B?NUhyUUFXaE1MN1J6eGUrMXl0UHVyeTNVZVVJNHBYTGNUUmJXZm9HZHNZaTBI?=
 =?utf-8?B?NGhNVWVSVmRERVEyVUVGT3RraHd1Q01OT0RtTHpWY0pDQ3JIZjNRUndEbXNI?=
 =?utf-8?Q?N+U1td49oiv7o2Vn2mp1t9JfN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e99a5d-3e9c-4228-756f-08da6e1447bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 08:04:20.9999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LK5xy2BNkbnmQwjb2i63nX0xMmLWGFzFWtfOX8TxNYLVf4CaXF20zLL2S1jPM5fyPn683aK2y+bF3f3byfXoqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7119

On 25.07.2022 05:20, Sarah Newman wrote:
> A STT_SECTION symbol is not needed if if it is not used as a relocation
> target. Therefore, a section, in this case a debug section, may not have
> a secsym associated with it.
> 
> Origin: https://github.com/dynup/kpatch.git ba3defa06073
> Signed-off-by: Sarah Newman <sarah.newman@computer.org>
> ---
> Changes in v2:
> - commit message changed to use Origin

With this I don't see why you didn't keep Ross'es R-b. Please help
committers by keeping tags up-to-date.

Jan

