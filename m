Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BBC3EECCE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 14:50:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167830.306393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFyXb-0004SX-U5; Tue, 17 Aug 2021 12:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167830.306393; Tue, 17 Aug 2021 12:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFyXb-0004Pr-QM; Tue, 17 Aug 2021 12:50:03 +0000
Received: by outflank-mailman (input) for mailman id 167830;
 Tue, 17 Aug 2021 12:50:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFyXZ-00044s-Hi
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 12:50:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 806645bf-93b2-4736-b36f-e895e065d3af;
 Tue, 17 Aug 2021 12:49:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-xGxLrlbeOh2c0kU7xGuACQ-1; Tue, 17 Aug 2021 14:49:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Tue, 17 Aug
 2021 12:49:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 12:49:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.12 via Frontend Transport; Tue, 17 Aug 2021 12:49:55 +0000
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
X-Inumbo-ID: 806645bf-93b2-4736-b36f-e895e065d3af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629204598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0aSVlY0hXNCVepKsgeXaoK8+8gIHLwcUBwf1RXfJNSs=;
	b=IfK9HAIl8axt2sBVC59jP4CJFH1xoy51SUQzTqSgMIWKpBAXSokv90ilnIkNBU4NHj6Bn+
	wfr1eaAAl2YZf1MtVH+Rwxxff3hKIq79fucVbcO4zZ7poMj4xmuMAM5GD5X4dos+OrJxKX
	AkGe9mahI7SF16DM1el8OF4/OgXwzt4=
X-MC-Unique: xGxLrlbeOh2c0kU7xGuACQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWvaJiA7aqRp2HXXSOvEgWWipTlaNrWEaT2o1SALC7Ma6tJ3f0AZOT9AihbRROUJzOFF6Oceap7kIBuWPtaUzflkcXK5a04UDHA/nUlO2Jmp8p1PsUOtgxQ72d/pWipNVHI/64aDA+qY+EX2yIPSWoMDVDQjEWT2HN3ot1wY6RcdvuDn/cGpKVTMqXLFDOTKx6VpeoZo6YOd5BpuTGFhKsW9y/W/n47eQj6P4AW/xcrylLnihlW1Q2H2IuXAf4dzbI0cdoyjIHgCmsWfg+XSHh+mtUPEz+yCc9LGoh03u4gQEcLNj7aUfZgUCOIt92UKK+39rszIMYZOZU9nBLubdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3yijlteASFljaQcqJgx8q6O4k/MrACUYk1+uC/IbAc=;
 b=gmTtEqIGpIHLPate9S/bQKjSCmOJRRG5WmuORUcc71fwtITTLyJo6rvCL7FCqPCkoMqA6DzdKGOgqY7QHMVZEezy7VlDE0E2gt9DTKLPBSYC34mfrOEaN/nSJwtlX/BIctotBZrEPcTJrKPQk7AHOnnIN5ckif9xlvJjIYFpyNPxWILIGPnk9fSSJQ0TmnBosMuiPvV+8yXuOff3yxs8XpeaZUlCeJEBJZUgRGo3GHQhEXtiJyR6fQgEky/BKdxmAeIGLJbjLTqvTgqUvm9xqEK8qbL/S/OOB9KQH36a7PEehpbo8VZAUieKn3TsNmE410MUreuJP9tBBmM5WdhpUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: S3 resume issue in xstate_init
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <YRsQArpQcpLB/Q5h@mail-itl> <YRuXNmpT+03aPo+p@mail-itl>
 <95ca90ae-9c37-c77c-67dc-66c1aabd1626@citrix.com> <YRuhFWLrplRRV6t+@mail-itl>
 <a575e7e0-156f-9ed1-cff2-92e4d7000090@suse.com>
Message-ID: <6e76f639-6756-36ab-4df5-605ae07640ec@suse.com>
Date: Tue, 17 Aug 2021 14:49:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a575e7e0-156f-9ed1-cff2-92e4d7000090@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb80c1ee-83c5-467d-0d18-08d9617d8380
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5325FEA28AF2500C9E3305E1B3FE9@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+edc16aaYjo+RADGKZ/BN3R7ZndpTtMglAAP2Iz/aVA0LMB8s/nFxEguy5rRUafENzmmjUTF+xF80ad5GHw2T2ks8SDARlWUIo/n9vvN0SiSmQt268nlGE7Bx79VNt85zBCQazFdInAQ0+T/0Zq+tt/PIvIA0Fkp08ISySoYM7+SQX6XVsdnKENa3Q8IEaIIiJFgY84ytlAdQ/7D5DcNep8D4uTs7csfWF0qIehBZ2xM7zB1skbL6FImRul4ZYJVXcSb3Z0QA5qHA4ybjZbn2/abx3OUwEinVZuangvt6/j8h4VbDcoNSPvK+HuL1Hql8IznsfRli4FwW16D61iOyX72uRmkPQpYaOY6bYDNl/8zFVNYFAO0mUWuH1UG65ELtTinJSpElFkDkoCpcbGMlwiJP90ItJFLmnFGnOqsr6x4ob5LgsSfceAbBDS18G90cbyQFgrb5QX7RLzGHOFLUc6Cb9xk+gMH0uzqadIG8MIbmpJ9MewXTkhodXSBEbV9qAxkPW3N5BxaxhFh2GFvG1hPJqmkUSW8yVPvDtdvyDQoFDGNPERVNzPkvakQDtRv9cPymWRqtsedEtYoSE+Brn7SE9ti8LF/I1e+bLnbyH5H7SQZEe3mA39l6I8tcdd/U7U5FoA28seDFK0Jvq2hJFN3WNwPQw5WMAX0j0WMhciA/Ejcf6dEdZlZPiv3RqRQg+AiHxcWoLB2ZxjfCALq12OJPP7h8aXF7/8zjUd0rQ3qlXDlPieQJuV8UV0A0i0iaC0YFa9Q6b1ZrQfpy36zL8b6JW1vh1l7LXbMQDxgitu7jKl/RHUVDH0snN8pboFI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(39840400004)(396003)(376002)(66946007)(8936002)(66476007)(66556008)(86362001)(956004)(966005)(6486002)(6916009)(316002)(2906002)(8676002)(2616005)(31696002)(5660300002)(36756003)(66574015)(31686004)(4326008)(478600001)(16576012)(38100700002)(53546011)(26005)(83380400001)(54906003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zTG7HAvZ1TDfczSPozoCJdiRF1nkYRdow5f9mqIcw9DZQcoX6oyAbeNDZmNn?=
 =?us-ascii?Q?R3XvInyMy4EieMeV6TFCZrNKsy/mbkpGtAM4cnwbPCeEx2Y9kcnPpQ4XyLYu?=
 =?us-ascii?Q?ITTJRmhEccq8c19sGmf6QkH+YZKCsU4ElBxhyOiWY8dv7yiCpMy2wueTQVa2?=
 =?us-ascii?Q?4dG71Xuo5aZttPowBi9hPZcTkYYSNpNyqUxCcCuTBsnVbwHhccmaGgg+HKUd?=
 =?us-ascii?Q?zqr8umzAKOfXESkR3i6AN0FC5zO3t6z5WtgoasHLPQHQNWiOuCcLn5i5SCYE?=
 =?us-ascii?Q?muZeGiTfuiWqk8QsvyYe1y7VipwztQXz2qd8A4xT3pTIRrC5+8kihJqruozm?=
 =?us-ascii?Q?Il24thQxNP2c9AA/X79yBcxxN4cmEJ9XT6tdzWCdaiK9IdNhhgiefRqyNU6f?=
 =?us-ascii?Q?qk2ZEgnLQG6ZvZwKv1H0wOX+xvgTkNOp4OWIg3i9EMuC+KDczTSBmqCFo7Ji?=
 =?us-ascii?Q?BjYKlqnmvY622YwWjmqrKSngkOEMcUDi3hcmKpqXQ1kIFewlHQVkUtpLAy8Z?=
 =?us-ascii?Q?JJ8lwBSA1oYLZab5M6ZYxoMoL0rMpzRRwVabaiogpj1EsXExo9lGbaPW2L3D?=
 =?us-ascii?Q?ORmvItf5E5Dz1ANrf6U3S1xRA82aCRhrBN+TIMvOktE6+C9tJfDXHJ/h3NFP?=
 =?us-ascii?Q?W5a5xRPAfmxbwFdE4XLgOR4hIZqsCojz1noRpMHb7EURZbkkAJJHJglspdj9?=
 =?us-ascii?Q?1d3uNoI5zx6AbmDxQsSdSCO8nJ70K8C3TV35T9PiAcoPKDYSLRyZTdSPkW47?=
 =?us-ascii?Q?FDjXk76bgL25oos2dCHvvun0AEZxRekuARWk9zcQ2oitZefAUVydnN+sxUYE?=
 =?us-ascii?Q?nob0uLtyncbRHR9IZZwD4jUMJKNMFrQhmUZq+/sKvL5V397NL3PGI0pDRx3L?=
 =?us-ascii?Q?afYupovggh+IaWK37MpySAVZ97RmV30R8hiR4oOfFbqpkpPPKBEUDkGZo3nW?=
 =?us-ascii?Q?fr3EcTOG94ApZ9EZSGuNF10G8VitIYo5Vect4Ub7S09aeq625ectFAQT449e?=
 =?us-ascii?Q?wdBa95i9QVjUS+4idGqD7XAQFe2yGvcMXU0l8ri3btbPEHjWFSu9o62UgDTt?=
 =?us-ascii?Q?9nnZNvZuU8GflZ4HTH+NgxGksD2vfmyhDOvRzbjf3ozebob/Mr5LEsxo1IJ0?=
 =?us-ascii?Q?HkV4W3SvSbgIQ63mzqK4n+vj7DjyXkBqikCicgXorKgB3VLR8/K+Ha+sWjIY?=
 =?us-ascii?Q?qWSGwQBVCLBHzRp+LpLM5S0+Q0m34kQTLjPyNcp2PUbjXY95I+X8ekODVn/e?=
 =?us-ascii?Q?9XqJVIyD6LNKTioiMMG0PoSUhzE7CEnpFa4GAfxxHdB5wqx066YMEmi/495m?=
 =?us-ascii?Q?8tM1noqkxm5AMq+0bDBFxKOQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb80c1ee-83c5-467d-0d18-08d9617d8380
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 12:49:55.5858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c60Afmab+IwCiMH3+UNRtNImql/y/TB+EGC6UsrYR8hlxzvyi2SGxU3zzTF3S/o4bhzkDg4Mgd6I3LkxNMnCoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

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

What I can't spot though is where CPU0 would restore the cached value
to XCR0 (or update the cached value from XCR0, or clobber the cached
value to force a hardware register write). CPU0 is, after all, never
expecting its per-CPU data to get cleared (proven e.g. by the EFER
restore first thing after setting system_state to SYS_STATE_resume).
IOW I would have expected CPU0 to suffer the same issue, or it is
mere luck that there the cached value matches what xstate_init()
gets entered with.

As to other similar issues - MSR_IA32_XSS looks to also be (latently)
affected (latently because right now it won't ever end up non-zero).

Jan


