Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389FE3EED15
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 15:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167851.306438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFyq8-0008Pt-Hr; Tue, 17 Aug 2021 13:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167851.306438; Tue, 17 Aug 2021 13:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFyq8-0008Nh-EB; Tue, 17 Aug 2021 13:09:12 +0000
Received: by outflank-mailman (input) for mailman id 167851;
 Tue, 17 Aug 2021 13:09:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFyq6-0008NI-PM
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 13:09:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ea1f404-ff5c-11eb-a4ae-12813bfff9fa;
 Tue, 17 Aug 2021 13:09:09 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-TAtYuZuXPc-sAIJSKz31Dw-1; Tue, 17 Aug 2021 15:09:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Tue, 17 Aug
 2021 13:09:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 13:09:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Tue, 17 Aug 2021 13:09:04 +0000
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
X-Inumbo-ID: 4ea1f404-ff5c-11eb-a4ae-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629205748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/yQoF4icSlGBXjVw+gYSNUB60+rTYYURZgz+N7AHR8=;
	b=FeXqAvb4F3yrgFF+xaLFlho5+6vjJ2qjhCAhjMVEUg91tseiW585antF+Bxm1NHv1l1zYy
	nCKCjYeL/9cOo11oQVgVWbdYTTP7IbQ09DdrXfGPN37ISu1AeiEAxJ4GzsWX0aQeP7gwNw
	0qbltLXzvyQgn2wsD8+0bCOZM2QT+Uo=
X-MC-Unique: TAtYuZuXPc-sAIJSKz31Dw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNfdMxM+cxS76AklXWgKyurkVlLwKDi4E/aEcg38In88EHjnk6Na+1kuNxkgVXBlI6EN3As+HVOknREzM8SJ1Y2re3srtPtYjrths69BasHoLv2cPXivQHfuGldxjPl0Ayawc1BS67+aiQzAHYWe781LjiMMOJ6qsj0Ob2RucniDettzeltlaXvq5yzXeqzkWe0Or9LDYb1zIcyj4xwxVEDyfm4Mb+TpgzaSMGIb1omNYHWpBvvw9UAfE4UTUjK68jFy7KMmJvthryNINCzBVHixhu/ZyV5JMxn15Co86eujWFZG41B/7x3fYY5cNkcZpnJ8d9t+1Uf1NY9xUrr0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7Dbv9x95m9ghnuubnMBPuNVVizz8qf/SwpwyJnYv9s=;
 b=hZzJIsFWwgmIKfwyxTDNPXq0E7a+iH4V0zvgUKlk9iP8L0nfLFl+IjV5ckVN+B1m1C3w7/cxafZYkWLAqJVKJzXlHh4xppMdxn0X6G8UCu4iIFYMS7U1YUJdP1Z3SRzgoY5yfWLw/MrZG/3d9+9JGHCFGwLY3ND3SD1JPkOdyAbqTPlYaeyKaeajZon8r5427vBWuCq5yF6i80KyMRPuQCUU11zQjqqxTW4KTOO8u50hV3YNDsBsIpM7SsGpG1XCHn5QukAt7XkeySsn/UI9ZAxxvTnMZQCkuLypJLttrraUtM2goDisIThVzmLTX7xixUBddaheMa4pIryA8bbpCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: Re: S3 resume issue in xstate_init
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
References: <YRsQArpQcpLB/Q5h@mail-itl> <YRuXNmpT+03aPo+p@mail-itl>
 <95ca90ae-9c37-c77c-67dc-66c1aabd1626@citrix.com> <YRuhFWLrplRRV6t+@mail-itl>
 <a575e7e0-156f-9ed1-cff2-92e4d7000090@suse.com>
Message-ID: <c2afe826-9c90-2ad2-2e7b-0cfa7f767f0c@suse.com>
Date: Tue, 17 Aug 2021 15:09:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a575e7e0-156f-9ed1-cff2-92e4d7000090@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P189CA0002.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e18640b-f983-4185-ecad-08d9618030cd
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2448CF2FA50FB7FE7A48F016B3FE9@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ve4+qCuTNZcpXGr8lqmpfDLFdfmc+lhEgCliXRLBRpKdgapn2rmJJsC+07gI9bC3oS3l4l2mSgXo3DuOO6kE2UO2EJZ4LYY6zGFg8FEd34qmzzjEcfKXfTN4rVzW7Z+cCNlbmjBQORkC0AfQ3ibI+0cHuHLhHdyXPT3Ev8PPdDWUNeK+ZauxOWBgt6SXVxOErN3/9cUOqD4TBdviLIgNxzNx9NdBz3CkbhiCLtJ0Y9dEd3F/DhabbvLl1jT7qL+0Ou2AkeWBu2QS3KrD5RB+zycQbVL+I7CEuN47iIg2atg+iK5GEt6cvy9Qy6WxzI+xbbm7BNSlTZ0LeAteJMGcTNK4oO00+vrwhGicQ3FgKayBSgxY2T4Wewqom5t9O7caQElzEL1zQ5DVsyec2GjqifIG+Cs39NmajAiA71JD4vZVxK3PydN+uzgQ4HzaMN+dPr20YSPpSgVHSySWDKMr2hUh5smZYTYyGw63X89e6r7Ov3g08d7ofoMckXk0JWIbOZnK8UiTrvyg7FBIny4XR7Ka0eIEsu81njM+2z6iHXOeJ2lDQ6CT+MtNl3Nh/XO4OrNY8jWDfw9A74/BeF9O2TFOqttVKOfbGHMbVWy/HogVNE0OwHfJFM3XZSd9Yr03Nu+ZwJtRjFTpMNpDlHOMCGQGsgA3jok4mwq8kCBFUNqOipwFVBjqIKF6nY50B0pGfNUzZoJZE+tticBC4v8Nl+fqhlx3yZzcB1uot9pCPmxWKRXQc9PhX7kqyfY4W1cBzXrlZPAIt1WI0P5XDQybNWj68wqlXbP8fsVRIL8vqXhtfaL2W4uSJFFu0cA8xl4F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39850400004)(376002)(366004)(136003)(346002)(53546011)(956004)(6916009)(966005)(2616005)(38100700002)(2906002)(5660300002)(478600001)(66574015)(83380400001)(54906003)(316002)(107886003)(16576012)(4326008)(8936002)(31696002)(66556008)(26005)(66946007)(66476007)(6486002)(86362001)(8676002)(31686004)(186003)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SmRseEteoWZEYBE4r4lmo4HZ2l4Krlaco9pGpjVr2bEhZmNiIQ4hjvLHp96o?=
 =?us-ascii?Q?xGfofNsio737x3lUvFZmLmOwm5bJzpjAzPSkJhweib8EK6Y1wacONpTZ2DKp?=
 =?us-ascii?Q?tpIyvZJQ+O9izyq0ybwOVytHghpyulMVJMXtihQdAhxl0yrdiUTeTDd6c9e9?=
 =?us-ascii?Q?COyL+cDzMl6vszr3W8QNMzErUhMNhWOdD4zhP87LXrV7Y7IIErcd3hE3YP16?=
 =?us-ascii?Q?PjmLLTmcrPClctxri1p4Q3/s3Frook4KSkcmVoi0N7SoOknWZ/tINDWj5mD0?=
 =?us-ascii?Q?ET97iz2CJ5QeymXKc0yM/qgkEtmFN3Uqu5VUX/1qOIGiZYD8I3S1W1Rt+Syh?=
 =?us-ascii?Q?rR4DGaLG8aZ45h4TWWRGY4o1bePxw6DXH5wNO67Eld2zYNIgg3U7Q8Ovube7?=
 =?us-ascii?Q?WA13tWnAA1pEVRWZR/SH6qoVzY3MuPGFvaTlvAyMv+wsxcj4LVdw20IjFvcE?=
 =?us-ascii?Q?ndlwNw7JgF9hLv6KeeF6SI5hvXtexkT+DHWR8AA7fcZFwYxniB5rV7LhjmRJ?=
 =?us-ascii?Q?1gmYyZWXeTekosZIHm7Yrz0on3RNvQxFeAOeYrKICZ+MlztMr/u5iLFbFFz4?=
 =?us-ascii?Q?izurnYe7KbWeNHJYf5A885f9t4eEalCa01ftLPiB5uVe1asnL5EfHj8wWHwD?=
 =?us-ascii?Q?lEFgEjYIIpxYAEHcloYKrGx7ZtDkppdPHnfER+A38j+IKZ3tsWkQeoAXMelM?=
 =?us-ascii?Q?vBaJ9E2uLpzhuQP5duE2eYfzAUahOeBL5rauQB9Z6YG9kjbt/V/pfYzdzOgu?=
 =?us-ascii?Q?x7PUbMvLb7Jrmfu3q5JmeH6zv1QZ7CcLXc2e7eHIx6wEAbYmHpoYd7ohKd/x?=
 =?us-ascii?Q?dqSeVuOWE4f0Q/t2seLnbYvP9rUh/UzkvExgLv2oLdROK442FNjZh1OpFyrM?=
 =?us-ascii?Q?7TGyW4d5ZVkPs/7lNfI3K/3khaKu2m8kofTYiGVfJW5E4dOOUP+2FxDxqQMj?=
 =?us-ascii?Q?xMkkvlM9yWPYOtJjSY1YYUBz4UGovFUnkaAQzL60LpFbmbaEHkH2J7jX92jc?=
 =?us-ascii?Q?7quxBqlIhm4gHMQdLHGdxABpysRSv6m4hCEUys7CS1/nGd3UecEj3Xn7LFdN?=
 =?us-ascii?Q?Bp1oGRWm4IGckR+n7DDOApa3RK7cJlLIcuOVWTj8MxBgeS/xCm9cOqpwRUo8?=
 =?us-ascii?Q?d1zn+WU6Wn6LZZK/RSyE235/84UTe1H2EWZ/MwJehGpcO+VTV1y2wZGIs07D?=
 =?us-ascii?Q?W64+9LkUL4SuqFXDI4F3sXdRuLPKQG7r6fTLYZ2hcliBK5qXJa9jwqwYpezm?=
 =?us-ascii?Q?Eqcq124QU7S/ugZg6I27Ps3pD+D71vGuUm+rbTRx1i8aYSfG3NYV978zHVcO?=
 =?us-ascii?Q?g7zOiG11tb7ZV1HoMyyZuAMG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e18640b-f983-4185-ecad-08d9618030cd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 13:09:05.3664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XNI7r+YnwGt+6qCxMF8GtYm0u0AmcA/BpK0S+vYGD3DlsRTknoACcVlnz7MTcHAFMRN0OW2+7yFHDsxW9uWKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

On 17.08.2021 14:21, Jan Beulich wrote:
> On 17.08.2021 13:44, Marek Marczykowski-G=C3=B3recki wrote:
>> On Tue, Aug 17, 2021 at 12:14:36PM +0100, Andrew Cooper wrote:
>>> On 17/08/2021 12:02, Marek Marczykowski-G=C3=B3recki wrote:
>>>> On Tue, Aug 17, 2021 at 03:25:21AM +0200, Marek Marczykowski-G=C3=B3re=
cki wrote:
>>>>> Hi,
>>>>>
>>>>> I've got another S3 issue:
>>>>>
>>>>> (XEN) Preparing system for ACPI S3 state.
>>>>> (XEN) Disabling non-boot CPUs ...
>>>>> (XEN) Broke affinity for IRQ1, new: ffff
>>>>> (XEN) Broke affinity for IRQ16, new: ffff
>>>>> (XEN) Broke affinity for IRQ9, new: ffff
>>>>> (XEN) Broke affinity for IRQ139, new: ffff
>>>>> (XEN) Broke affinity for IRQ8, new: ffff
>>>>> (XEN) Broke affinity for IRQ14, new: ffff
>>>>> (XEN) Broke affinity for IRQ20, new: ffff
>>>>> (XEN) Broke affinity for IRQ137, new: ffff
>>>>> (XEN) Broke affinity for IRQ138, new: ffff
>>>>> (XEN) Entering ACPI S3 state.
>>>>> (XEN) mce_intel.c:773: MCA Capability: firstbank 0, extended MCE MSR =
0, BCAST, CMCI
>>>>> (XEN) CPU0 CMCI LVT vector (0xf1) already installed
>>>>> (XEN) Finishing wakeup from ACPI S3 state.
>>>>> (XEN) microcode: CPU0 updated from revision 0xca to 0xea, date =3D 20=
21-01-05
>>>>> (XEN) xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f
>>>>> (XEN) Enabling non-boot CPUs  ...
>>>>> (XEN) xstate: size: 0x440 (uncompressed 0x240) and states: 0x1f
>>>>> (XEN) Xen BUG at xstate.c:673
>>>>> (XEN) ----[ Xen-4.16-unstable  x86_64  debug=3Dy  Not tainted ]----
>>>>> (XEN) CPU:    1
>>>>> (XEN) RIP:    e008:[<ffff82d040350ee4>] xstate_init+0x24b/0x2ff
>>>>> (XEN) RFLAGS: 0000000000010087   CONTEXT: hypervisor
>>>>> (XEN) rax: 0000000000000240   rbx: 000000000000001f   rcx: 0000000000=
000440
>>>>> (XEN) rdx: 0000000000000001   rsi: 000000000000000a   rdi: 0000000000=
00001f
>>>>> (XEN) rbp: ffff83025dc9fd38   rsp: ffff83025dc9fd20   r8:  0000000000=
000001
>>>>> (XEN) r9:  ffff83025dc9fc88   r10: 0000000000000001   r11: 0000000000=
000001
>>>>> (XEN) r12: ffff83025dc9fd80   r13: 000000000000001f   r14: 0000000000=
000001
>>>>> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 0000000000=
3526e0
>>>>> (XEN) cr3: 0000000049656000   cr2: 0000000000000000
>>>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000=
000000
>>>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>>>> (XEN) Xen code around <ffff82d040350ee4> (xstate_init+0x24b/0x2ff):
>>>>> (XEN)  ff e9 a2 00 00 00 0f 0b <0f> 0b 89 f8 89 f1 0f a2 89 f2 4c 8b =
0d cb b4 0f
>>>>> (XEN) Xen stack trace from rsp=3Dffff83025dc9fd20:
>>>>> (XEN)    0000000000000240 ffff83025dc9fd80 0000000000000001 ffff83025=
dc9fd70
>>>>> (XEN)    ffff82d04027e7a1 000000004035a7f1 7ffafbbf01100800 00000000b=
febfbff
>>>>> (XEN)    0000000000000001 00000000000000c8 ffff83025dc9feb8 ffff82d04=
02e43ce
>>>>> (XEN)    000000160a9e0106 bfebfbff80000008 2c1008007ffaf3bf 0000000f0=
0000121
>>>>> (XEN)    00000000029c6fbf 0000000000000100 000000009c002e00 02afcd7f0=
0000000
>>>>> (XEN)    756e654700000000 6c65746e49656e69 65746e4904b21920 726f43202=
952286c
>>>>> (XEN)    376920294d542865 432048303537382d 322e322040205550 000000007=
a484730
>>>>> (XEN)    ffff830000000000 ffff83025dc9fe18 00002400402e8e0b 000000085=
dc9fe30
>>>>> (XEN)    00000002402e9f21 0000000000000001 ffffffff00000000 ffff82d04=
02e0040
>>>>> (XEN)    00000000003526e0 ffff83025dc9fe68 ffff82d04027bd15 000000000=
0000001
>>>>> (XEN)    ffff8302590a0000 0000000000000000 00000000000000c8 000000000=
0000001
>>>>> (XEN)    0000000000000001 ffff83025dc9feb8 ffff82d0402e32b7 000000000=
0000001
>>>>> (XEN)    0000000000000001 00000000000000c8 0000000000000001 ffff83025=
dc9fee8
>>>>> (XEN)    ffff82d04030e401 0000000000000001 0000000000000000 000000000=
0000000
>>>>> (XEN)    0000000000000000 0000000000000000 ffff82d040200122 080000200=
0000002
>>>>> (XEN)    0100000400010000 0000002000000000 2000000000100000 000000100=
0000000
>>>>> (XEN)    2000000000000000 0000000029000000 0000008000000000 00110000a=
0000000
>>>>> (XEN)    8000000080000000 4000000000000008 0000100000000000 020000004=
0000080
>>>>> (XEN)    0004000000000000 0000010000000002 0400002030000000 000000006=
0000000
>>>>> (XEN)    0400001000010000 0000000010000000 0000004010000000 000000000=
0000000
>>>>> (XEN) Xen call trace:
>>>>> (XEN)    [<ffff82d040350ee4>] R xstate_init+0x24b/0x2ff
>>>>> (XEN)    [<ffff82d04027e7a1>] F identify_cpu+0x318/0x4af
>>>>> (XEN)    [<ffff82d0402e43ce>] F recheck_cpu_features+0x1f/0x72
>>>>> (XEN)    [<ffff82d04030e401>] F start_secondary+0x255/0x38a
>>>>> (XEN)    [<ffff82d040200122>] F __high_start+0x82/0x91
>>>>> (XEN)=20
>>>>> (XEN)=20
>>>>> (XEN) ****************************************
>>>>> (XEN) Panic on CPU 1:
>>>>> (XEN) Xen BUG at xstate.c:673
>>>>> (XEN) ****************************************
>>>>> (XEN)=20
>>>>> (XEN) Reboot in five seconds...
>>>>>
>>>>> This is with added debug patch:
>>>>>
>>>>> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
>>>>> index 6aaf9a2f1546..7873a21b356a 100644
>>>>> --- a/xen/arch/x86/xstate.c
>>>>> +++ b/xen/arch/x86/xstate.c
>>>>> @@ -668,6 +668,8 @@ void xstate_init(struct cpuinfo_x86 *c)
>>>>>      else
>>>>>      {
>>>>>          BUG_ON(xfeature_mask !=3D feature_mask);
>>>>> +        printk("xstate: size: %#x (uncompressed %#x) and states: %#"=
PRIx64"\n",
>>>>> +               xsave_cntxt_size, hw_uncompressed_size(feature_mask),=
 feature_mask);
>>>>>          BUG_ON(xsave_cntxt_size !=3D hw_uncompressed_size(feature_ma=
sk));
>>>>>      }
>>>>> =20
>>>>>
>>>>> As can be seen above - the xsave size differs between BSP and other
>>>>> CPU(s) - likely because of (not) loaded ucode update there.
>>>>> I guess it's a matter of moving ucode loading somewhere else, right?
>>>>
>>>> Few more data points:
>>>>
>>>> 1. The CPU is i7-8750H (family 6, model 158, stepping 10).
>>>> 2. I do have "smt=3Doff" on the Xen cmdline, if that matters.
>>>
>>> As a datapoint, it would be interesting to confirm what the behaviour i=
s
>>> with SMT enabled.
>>>
>>> I'd expect it not to make a difference, because smt=3Doff is a purely X=
en
>>> construct and doesn't change the hardware configuration.
>>
>> Uhm, changing to smt=3Don actually _did_ change it. Now it doesn't crash=
!
>>
>> Let me add CPU number to the above printk - is smp_processor_id() the
>> thing I want?
>> With that, I get:
>> https://gist.github.com/marmarek/ae604a1e5cf49639a1eec9e220c037ca
>> Note that at boot all CPUs reports 0x440 (but only later are parked).
>=20
> And for a feature mask of 0x1f only 0x440 can possibly be correct.
> I'm kind of guessing that set_xcr0() mistakenly skips the actual XCR0
> write, due to the cached value matching the to-be-written one, yet
> the cache having gone stale across S3. I think this is to be expected
> for previously parked CPUs, as those don't have their per-CPU data
> de-allocated (and hence also not re-setup, and thus also not starting
> out as zero). I guess an easy fix would be to write 0 to
> this_cpu(xcr0) directly early in xstate_init(), maybe in an "else"
> to the early "if ( bsp )".
>=20
> I'm not sure though this would be a good fix longer term, as there
> might easily be other similar issues elsewhere. IOW we may need to
> see whether per-CPU data initialization wouldn't want changing.

See J=C3=BCrgen's aca2a985a55a ("xen: don't free percpu areas during suspen=
d"),
which was an (extended) part of his core scheduling work. I'm afraid this
rules out zeroing per-CPU areas when they're already allocated. In the
description he says "OTOH a component not registering itself for cpu
down/up and expecting to see a zeroed percpu variable after suspend/resume
is kind of broken already," which in retrospect I don't fully agree with
anymore: It's been virtually forever (before that change) that per-CPU
data started out all zero.

Then again this makes me wonder why you're observing different behavior
with "smt=3D0" vs "smt=3D1": APs' per-CPU data never gets freed during
suspend, so a stale earlier cached XCR0 value would always be in place.
Perhaps the connection is more indirect, and things largely depend on
what ended up running last (before S3) on the respective CPUs?

Jan


