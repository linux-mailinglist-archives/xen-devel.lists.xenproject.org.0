Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FA43B5E8E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 15:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147874.272989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxqrx-0002ip-0V; Mon, 28 Jun 2021 13:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147874.272989; Mon, 28 Jun 2021 13:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxqrw-0002gz-TM; Mon, 28 Jun 2021 13:00:08 +0000
Received: by outflank-mailman (input) for mailman id 147874;
 Mon, 28 Jun 2021 13:00:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxqrw-0002gt-0N
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 13:00:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 129cfeee-f482-4179-a612-5a17d23fd224;
 Mon, 28 Jun 2021 13:00:07 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-BzvnfWplOSGtLwcI2QUZrg-2;
 Mon, 28 Jun 2021 15:00:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 28 Jun
 2021 13:00:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 13:00:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0030.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 12:59:59 +0000
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
X-Inumbo-ID: 129cfeee-f482-4179-a612-5a17d23fd224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624885206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4mQ6VsUPqqk/73sP0wLrxM9bN58O+3jIUWEXrgvJS2w=;
	b=Gyls/Xn0aZ32nLJ8zKcJ0fDzuX+HQxCkufS2dvf/fXZSf7OzRzUQhPXzsIoiMJrqO/uu23
	i0ycpt0pDS7Pt3fqZ+g92875vqvjhLwMrkHcJLK+tbtXlIHnfy8eRhCfrvRzvqu6oizAXr
	bGFKoA0KrS35hHI3z/8YjBv6uMjlGmY=
X-MC-Unique: BzvnfWplOSGtLwcI2QUZrg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjZkC9HvXWtttwMNKjLESiRD9kkXVN4FPArxr36cZ5rNEdyPwB3CVlrvu1aFZh1RbwXXiCYXoVoEwSxsABUIB0MDRrJGzhexxPjhnr58s45fvSnG123FsFYz08+srcZGeJXbR5GsRa7ZpHT5di019rNzRKCnFZ9coEvSDGxBygQm6kXt7NL68XbkKZkL++7w34W3Z+/d+qlokteMWC45e1BIdDnfsJj2h8eNt+EQbssSRRorxQDRVMBx8j2am6a0jJ9A3gxG9m/8kgnjUZhAJAYVqZCSv/rQzEdeGw2viGjW18A85lbtudCl2+vGMG/QWXNPLLg5/vA32Qc9inf7fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mQ6VsUPqqk/73sP0wLrxM9bN58O+3jIUWEXrgvJS2w=;
 b=GMXrBlwsSayYMYhVTXAmWgiF5JbA5Wkyx6EJpWfCDOdQ0bu+dCpX0dQ/PVt5wi3fllgP9BNrwUYKOCYXiWjVF0QanyIlCMG13NC1pFd/6PzwFMW33rYhETH5IiKwromYaDbvGjkQKFk+0qn/fc9Gz7/Q2JTUrKmDss5QVKJy72GoiR5Iq/3pbODwc6fUuoHz+5ds4bBZj6+ewdoPVrAsAZAG9a5PfacsdutvrSfBKmB/tIIVVR6dDs543e0ru7h5JcY8khvaqRwzLyZ7sOQBkK6o2knTGYtYcmyOqAlRkuI0ZsTgA53TYs1k9cYWCgVFyHtGEzyHMKONlchBGCw+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 0/4] tools/tests: More cleanup for automation
 improvements
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210622182124.11571-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88a88d81-38d3-f039-e8cd-342c07a09b14@suse.com>
Date: Mon, 28 Jun 2021 14:59:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210622182124.11571-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P193CA0030.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa632f85-412a-4613-2b62-08d93a34a333
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686195D2A4B44DB058CB89A0B3039@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KbjwCz1OyUDH82aMspGOksyzZH5LikO1yejKymbTlaKzvuq7d60g9/8jTldTS7H8uN4ytx4p23/SlxC5+f8jaVAzDO/nomis/d7k/pdtKwK0t1GM58MOvTh8/hJQYwE75Z5HT/FII9C9bVRgDh3sFdCu1ttNDAjHyRkAi1nOnrdQ9hDuINoQcfBqNr5VL6WG02PJ21pKV5EdOfirGH9VTpAabbHdv5J+sm7BrkYJskaq6XDly+sxGGc1P+yGeIIgfxomuQHhbjvZdIhRHjKqlIiw+dlJP1K//J3FtquXj9m3x2uDna+fkvrRAV2AES/g/61sk1a0pJOPzioZvj5C2JbISqJVgkKNIsbwiOqvg56d91HFXqZWZHLACyO84P5MlmRix7EvSunedLIQZDe57BtSMgAtI2m0NNPOMnXsoRV3F/k2mzHQXpwWwwov+5A/9vMEuZj10b0HbqdyyMA/zfiHqgjdQ5eqZgViY17T3DtKt/5mNQsJbtjAm0UDqDtP3Y0+a1/8n45zR+mq1qRQUoXr+HvMIlC2ICZqWuIstTKgm2ig80+OQbht2wF5jR5VmmDBhS6ipayjJKtCoBGTfDOKdMrfBB21pTx+2WCoWnQnwXdSo7VXajiXX4XiqFVgwFzEjyTwtDDa4gYLYD6SS9dW7kuGMsx0ugg53lC+HvoDqUWqDG/nopOje7Qlb0EEXnKYMWRPpTxs1Xa2uVrbV00GNwrY9jQYVrgdAcn9ZaQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(396003)(366004)(376002)(6486002)(4326008)(86362001)(8676002)(26005)(478600001)(316002)(83380400001)(5660300002)(956004)(16576012)(54906003)(2616005)(53546011)(66476007)(66946007)(8936002)(36756003)(31686004)(66556008)(31696002)(6916009)(2906002)(186003)(38100700002)(16526019)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3k1TmxlVmNWQ3hoRmJ2QTN3d1BtQ0gvcFZOYzg1dUw3Vmt2ZExGWU0wempR?=
 =?utf-8?B?M1JKRGJTNnNmMkl1QWxtVlpDbE9HcmlHd3hYY2tBaG5XQjJlM0JvOWlqK3V3?=
 =?utf-8?B?SUtwMk5EV2tWcGZpMTAyc21sUk90RHF1NmpYTzc4NW0yaXdna2FxbTVtUjc3?=
 =?utf-8?B?QzJCVkN3WTR6dW1VWEpTOEtwYkw3Tzg1RTNGcCtjVDhFdmdzU1IrdkJDa2JS?=
 =?utf-8?B?clgxd1FqVzJjSGxHZURzT2lTeHAxeU5LcGFWTmM1MXFXcEtQekI4T2RkV1Vw?=
 =?utf-8?B?RFVvRmxhOU5jNlM5MDBCVVh4UlVmd2Q3TjVKWkVRbkp1Y254OXZmcEVFTHdh?=
 =?utf-8?B?Y3NNWGpIU3p3TVhqZlpwMzVwNGhHczJXdXo4c0NURXJkaEpTSzVPNFJ0UWJE?=
 =?utf-8?B?N1JXb3FUZUwrTmtPdWdHUnRWRnV2Nmd5Z0JJNUQzOFJQQnJ4RE9aSWxOTEgv?=
 =?utf-8?B?eTdqNFNmT25sZ2hhUC9YeE1iUWFJTHdCSFVDL3RtZjVFL01uZFNJWXg1QjRC?=
 =?utf-8?B?Z2VJY1E4UFhGblA3NGx3WXVQU2lMOGhXVEhsSHR0c0VSNisydUN2cXFBWmFv?=
 =?utf-8?B?WnRncDhBcVhyemdTYXZGYkg2S2d5Rk9sbjZkWFpHdGNWQ0x0eTNMK2h2amRq?=
 =?utf-8?B?TGRlNDVYYkI2b0RoTFFmdGR6a1ZiN2UrZlJxK2duQlFERndTNWE3QXA2R0Fw?=
 =?utf-8?B?SmU2Y09BZWNaU0d6eWFyTncwVHRSTDlMNTF3YlozQStiTlJTRkxOSktqUjgv?=
 =?utf-8?B?UUpBc3p2N2pUR1NEaVhNc0xoYy9ZemZRb1dCWmRPVFlyODFxUmpZWGYwZlZG?=
 =?utf-8?B?NXhKN0pXN2lCSklFeFRrTE1CYmFSOUhLQU1DeW1QWDhZekZmQzl0SDlvY1h2?=
 =?utf-8?B?TUdUenExWENzT3MzdE93Tm9LTjZUNm5DeWtUZHVYSmx1eGRjMEJEaG5wR0JW?=
 =?utf-8?B?d3ZYRHg2SHdOWEZnVXVkaWdKZXNiNGZlaGlpQ0ZjcExsWkxEMTUreTZ0MGRo?=
 =?utf-8?B?dWtXZGlSTkZMNFlaY1dBTXNwaXpvcXpnLzlIT2lRckZDME01TjFEcDUxalRB?=
 =?utf-8?B?cFNJSStqa3k1WFpQelhSUnZCb0JWY25xOGM4OCtTK2ZKV3hITjgvWm9IeHU3?=
 =?utf-8?B?M0krck10RHZ4dVZPUUdmYWQ0ZWFvMVFwdTlrUDZWMHp5RldDRmQyWTZYSmJI?=
 =?utf-8?B?UGd3WTI4STQwaFBtVXgySXZydy9pNFRrUGxGYzdxSU9ON053TmJKN0Iyd1ZM?=
 =?utf-8?B?OHQyelJRZm1oMmdTYkpoRXNCcDlUYWpVTkR2c2M3NUpoU295ZHNOcks4bElU?=
 =?utf-8?B?aDJDb1FPU0FhMUZMTjlRLzUzRWtzaEFoakkyRnpuUytCQXdrUk9lcVhWN2JZ?=
 =?utf-8?B?dkl1WU1mYW9GSmJYU3laRzR4RWlBNE9rK3JMbGxIdXdEQWtxY0RPdzBMa3FY?=
 =?utf-8?B?SDE5cXhaaUtXbFBpellCajhXNjJTbTRBZnVQYnZBL203RW1GMWJzcXdRM2d3?=
 =?utf-8?B?di9rRWIrbmdrQmcyUFN1VUhFRGQrZWRPNzhtTVNxbDk5ZktOUWZIZmFXSHBs?=
 =?utf-8?B?MnBVTTlyNnVveWx5aG5la25pNFpVTWc3ZHRDYlMwcHpRenQ1RVhsSmk3cnZs?=
 =?utf-8?B?aVFNRXNuSkhhakFveHhXNEYvRWZ5dzB4b3RBa0ltZnM2YlpGZHYycmoyenhr?=
 =?utf-8?B?OFdjOW9XeU5QK0xlZm1JanoxWm02S2FhdGR4NFlOUWtzK2JtUEJETEQxZDY0?=
 =?utf-8?Q?1fw46F1xHVj4jyAFSMnTK/MYjbV93KcDwJFdV+E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa632f85-412a-4613-2b62-08d93a34a333
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 13:00:00.1695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +psO+f7VsZniqUknP8K1x4XdGuGwpqL3AP9Mpb/uvtJ7ZrJiuiDa5wGwMFWiSKjBfvPqqO8H672B4HEzCG3MUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

On 22.06.2021 20:21, Andrew Cooper wrote:
> v2:
>  * Fix CI failures from newly-exposed logic
>  * Drop -f's from $(RM)
>  * Drop the 'run' rune patch.  Its clearly controvertial, but ignoring the
>    problems isn't an available option in the longterm.

What is "the problem" here? The presence of the run targets in
the first place (and their wiring up from the top level
Makefile, allowing direct invocation)? If so, I'm afraid so far
I haven't seen replacement proposals by you (nor why exactly
this would be a problem).

> All other RFC questions still outstanding.

I didn't find any here or in the individual patches.

Also a remark on patches 2 ... 4 each saying "fill in the
install/uninstall rules so this test can be packaged to be
automated sensibly": Why is running (or at least picking) tests
from the build area not an option in an automated environment?
And why is installing tests unconditionally a generally good
idea? I'd view this as unnecessary bloat for the majority of
downstreams.

Jan


