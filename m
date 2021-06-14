Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB903A6B2D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 18:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141685.261633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsp1i-0003QI-NS; Mon, 14 Jun 2021 16:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141685.261633; Mon, 14 Jun 2021 16:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsp1i-0003OG-KF; Mon, 14 Jun 2021 16:01:26 +0000
Received: by outflank-mailman (input) for mailman id 141685;
 Mon, 14 Jun 2021 16:01:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lsp1h-0003OA-Bl
 for xen-devel@lists.xen.org; Mon, 14 Jun 2021 16:01:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0c67e3f-ef28-490a-ac69-54ad03371dae;
 Mon, 14 Jun 2021 16:01:23 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-4-6cUzbsp2NsieWGN6WuRrmw-1; Mon, 14 Jun 2021 18:01:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Mon, 14 Jun
 2021 16:01:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 16:01:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0014.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Mon, 14 Jun 2021 16:01:19 +0000
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
X-Inumbo-ID: f0c67e3f-ef28-490a-ac69-54ad03371dae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623686482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rk++hUTYuZOmQ9pmnn4qYpG7O75kSBf3YqVqAzd7i6Q=;
	b=Y4Fnnd5JLz9v2G1pPRhWPks6e+JpVrjUXvyUM8ggDTt99FnWmhHYsdQGq94DkRlGJIyiLL
	p+mOqhDavG5Tjg3epdR5et2UJwIhcJLLnTLDCu7daTL/M1j/6Ofoz36g08Ywv4zW3GkgvY
	ovfdyJQWJftvw6lzz5rtEo3y1eTkfEw=
X-MC-Unique: 6cUzbsp2NsieWGN6WuRrmw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPgM53Q3MyZFTe/Ipchdwd7ugzgS9qdW0/9oQMinntMKQvx+dXzZqQV9paTbKUcBA8563pjCzQAFqPvZhKA8RpUzT66494OWoqzP9rxk1nzdyhSQZvuXVOp7e3QCrgbvIh4wlKPKIpkvqjn2f0tauEPRfM8IVBJEwwqaU4o1nIroffP4FHNjTt+yKSQ8s/ujLsq3i6igDNUVqdNGPlhOzcJZ7XV3X8LBofXy/dYuB2UdLgzPRmiE77wrbQOet0C8F7FXQeUBSpG3aR56VNcT9biTuTnhjZ54ngYXOZQUmcGH3GhNypz88BHdmsUrxEYS+R3OfC5gu/azhQ4h2XYxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnPnQz8/uHJaLhR8pq0KrTGD680xZy3Tyh9sddeQ8j8=;
 b=jAgdM4XxwcQHtVL0ZpOBUhSmXLU5b48fGcIkpLabHR2esMrRccms9DbCJMcI2uG3Ds0pNBTCKPqg6jwcJ4DIzbl2/VZidUSDSZXejadCc0jMOdFbYWpFu24V2TIK7JmwyfCn3ZQny03m4aQY/x2RkhuQZXeZvaaPhQgFjTegyKItfMwBd/ALdzn2ldXe1cRkjWyYa1IKapmWeD2+UqiUXpRFZ5iZDRtpx4U6i8YQU6EAd+HAzd21NxS3IpvQ0W0fauoZ+JrUgt16Bp5mt0uIU+r+L96jfamWVatLRH1CafBfrQszYyPoa88gMRVCqMfKsY45Pw/5Ky+52nm3Sk4LYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=suse.com;
Subject: Re: BUG in 1f3d87c75129 ("x86/vpt: do not take pt_migrate rwlock in
 some cases")
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xen.org,
 boris.ostrovsky@oracle.com, stephen.s.brennan@oracle.com
References: <0efd0099-49bb-e20c-fe8d-fb97c9de2b63@citrix.com>
 <74378af9-5d04-f95e-3957-918cf5c81ded@suse.com>
 <YMdZKuKOnFKpQ3sg@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e9f4ea8-2fca-bf66-6345-0b73b960cba7@suse.com>
Date: Mon, 14 Jun 2021 18:01:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YMdZKuKOnFKpQ3sg@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2P264CA0014.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::26)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99563928-671e-467a-08cc-08d92f4da610
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71527BCE7875AFFFE5A68729B3319@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uniuRjrYPmL/MXN28d8OOEMWuBeT8Q/YwrupzvyZnpbWNv3diN00459Sl0lIMc64+XDy2x+1hY2oCEi/hO4HXYxXo4zQv6ZbccZkcM9dLLr03uNGox8vn/3XsKes/72525MMY4Qbk1YLoXFbzNx5nzGiO+oQrKtOMlAOqVYRzR+FIIHeKkqOBxchzCyLR3F4cf9eYSC3nieRRa/meW8W6EMutiGAMnNH8zeBLLTceI1HsUTlfj/O1PYgDrW6Uc3t29+UcqXmYdrBcggjyv+3yfoW7kE9CuaiDyrqmlBw1GukTGPAI1O5vawhXmVB6gKZjTZL+0upIL4y3u0bQrCjj5nifw9eaZMpLNP+tg4r2TAUdq7mDNmnlDMs0DCw4Dbd/iOYQ6b6NnLpKpipM/w+68q4VwG5ZDsZLQN5SaN3jr/4DZl6/JQDXNMWWbgxt7Qmk1Ask/2qrIh7wBTG7IE2Ym2QENGbgesYULyDUQj2b8uRzZx6xDUFFVr6l8hCR1NVqpET4eDMNsoT03OBa7Snp961bhPM6WWvOK2i9fUgV+F7Wv6AnITvXt+QjwaWPpXU9HamAbSb000MN06Mdxdx9lziQvxdg7UXfXlTevQ4yJHOSUbjRNOWdL0p7dPtqhKM85vHA8Dn5/wUF1Px3Y6FX1260hfWRPGgmFcxbdg3tiI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(39860400002)(346002)(376002)(136003)(26005)(66556008)(956004)(478600001)(2906002)(16576012)(4326008)(86362001)(186003)(53546011)(66476007)(316002)(31696002)(66946007)(5660300002)(2616005)(16526019)(8676002)(6486002)(38100700002)(31686004)(36756003)(8936002)(6916009)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wk2uSl2brQ2Cd7DoF1EhEw+gvSw5g5gUgzFV+WYoID58wQwXmej+RUDnBXZV?=
 =?us-ascii?Q?+AQbwMPpGlEGH9SEPPHC5juAi8yrLR+HXcIgbOllKUnshkRYrCol2Xdi5Mib?=
 =?us-ascii?Q?pPAwqq2vetaJAvlEGJIP4dCstHnHtHm3n+3k2IGuqFszQ0NFwyaShDSYYrSs?=
 =?us-ascii?Q?DMH8M/uaKdzn13bFl4rGzPejrXO/dPxChIRzSz0o/IRCg2Slf64pkK5bT7c9?=
 =?us-ascii?Q?qDgTW+30ICz6dPFQhNwiv38vpSyOcWoNEFXWOioCC+JWfCyWJGY55zCEM7Y4?=
 =?us-ascii?Q?VjvvW0lohnCejivjBhGYUu/kmGkk6NvvE+m6KMMlhQWrAh0dayoxN+TnWjZr?=
 =?us-ascii?Q?R619w0pwqA0oradJl41WFwqjp156NxrSiN6xsfmE1Rcf/rwvKyVRRL0ogVcd?=
 =?us-ascii?Q?Yd+20ZN6/IsjsqtT8aaIWfYBWRwYSgeGLYpeRdPmeR7eWrGPwdKQX8qrbM8b?=
 =?us-ascii?Q?C5tzaYj50A5PSQEHZnuzIZcb1ZDtAq4KGl9wuUMdeH2dI2MQXV9+EqyS2Du0?=
 =?us-ascii?Q?bptrq4Bu4wtPJZMqJFH3OlkaEVSUaVsL0XdTgMarBoBacs+HmwuYTITWfnc2?=
 =?us-ascii?Q?QGrz5j7akwT2RDYBb7l5LLt3tzDVTZY8eHRam1Yms/r9Fu//iQcEW9NGbDNU?=
 =?us-ascii?Q?TYoSlLkDLA6oo+3yfIReaBanf6+rceZnFhazXz2BMkURc4bPDhQtkw4oWuVw?=
 =?us-ascii?Q?9QRhomjz4mDAAzrMICZexi+7FsJ3Zx0cRlos4STTeat4VVZEwEn4ceteHZb+?=
 =?us-ascii?Q?I5osXvEmRgU6uHJc6Vw19df9Pcj5qwkQ3gcPC5BlcFiBS63DZ+BQKDT5HWeG?=
 =?us-ascii?Q?T+lMn2a6m5zcn0s+FrTG2rNA57weDoGMbyvWmNvYgrvMsuqZYcY94f1MfQqK?=
 =?us-ascii?Q?ACeWZ+iczG8NGvkFPChNM7vE91NouPZbEmAAEmmmLs4J4gfPeYJBfvsojRrA?=
 =?us-ascii?Q?fgvBZim5H0E+Jq1kGRsnlBiDU6DWn0S0GuwsVdcugc4ErXt4fZh/lEFhsDzc?=
 =?us-ascii?Q?EeEeuQDxDVWtYn6cfGKfG82sg5AnFK59UNFNQye+EdstVa5iK4B/4GB8MjBD?=
 =?us-ascii?Q?xcAB3B744fAgEQ+ZLdsTm9fZt6S54KPRXGwuDjilYp4oxTEY3CE3eHpuStpA?=
 =?us-ascii?Q?eXHStY3NXni9rqlhJNIDc2pf1apmHyTny1hWxo3bsrg04VbGOA0VR0K9ZNwz?=
 =?us-ascii?Q?U4Rjroy2ev4tPSHY1IviOCtOKheyD0bOmkbJzZV7qsOdOtCIM9AcTaWPdQBf?=
 =?us-ascii?Q?0w080+BnWUiIsmcIinH4g39RpiRVxUixL/nFaoSsRsyKEaxRIaJCqLgU9fld?=
 =?us-ascii?Q?WwyQg5FaTeXgGUdaYUUdoTck?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99563928-671e-467a-08cc-08d92f4da610
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 16:01:19.6890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0YNmgd14YmVeQYMdV3vuBU/nSMRhjygy1/Zu0U1/oKGsxkJ1Bm39v/9vwEiq6bKqitTkQNyBBKDBY8KHx2z/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 14.06.2021 15:27, Roger Pau Monn=C3=A9 wrote:
> On Mon, Jun 14, 2021 at 01:53:09PM +0200, Jan Beulich wrote:
>> On 14.06.2021 13:15, Igor Druzhinin wrote:
>>> Hi, Boris, Stephen, Roger,
>>>
>>> We have stress tested recent changes on staging-4.13 which includes a
>>> backport of the subject. Since the backport is identical to the
>>> master branch and all of the pre-reqs are in place - we have no reason
>>> to believe the issue is not the same on master.
>>>
>>> Here is what we got by running heavy stress testing including multiple
>>> repeated VM lifecycle operations with storage and network load:
>>>
>>>
>>> Assertion 'timer->status >=3D TIMER_STATUS_inactive' failed at timer.c:=
287
>>> ----[ Xen-4.13.3-10.7-d  x86_64  debug=3Dy   Not tainted ]----
>>> CPU:    17
>>> RIP:    e008:[<ffff82d080246b65>] common/timer.c#active_timer+0xc/0x1b
>>> RFLAGS: 0000000000010046   CONTEXT: hypervisor (d675v0)
>>> rax: 0000000000000000   rbx: ffff83137a8ed300   rcx: 0000000000000000
>>> rdx: ffff83303fff7fff   rsi: ffff83303fff2549   rdi: ffff83137a8ed300
>>> rbp: ffff83303fff7cf8   rsp: ffff83303fff7cf8   r8:  0000000000000001
>>> r9:  0000000000000000   r10: 0000000000000011   r11: 0000168b0cc08083
>>> r12: 0000000000000000   r13: ffff82d0805cf300   r14: ffff82d0805cf300
>>> r15: 0000000000000292   cr0: 0000000080050033   cr4: 00000000000426e0
>>> cr3: 00000013c1a32000   cr2: 0000000000000000
>>> fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>> ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>> Xen code around <ffff82d080246b65> (common/timer.c#active_timer+0xc/0x1=
b):
>>>   0f b6 47 2a 84 c0 75 02 <0f> 0b 3c 04 76 02 0f 0b 3c 02 0f 97 c0 5d c=
3 55
>>> Xen stack trace from rsp=3Dffff83303fff7cf8:
>>>     ffff83303fff7d48 ffff82d0802479f1 0000168b0192b846 ffff83137a8ed328
>>>     000000001d0776eb ffff83137a8ed2c0 ffff83133ee47568 ffff83133ee47000
>>>     ffff83133ee47560 ffff832b1a0cd000 ffff83303fff7d78 ffff82d08031e74e
>>>     ffff83102d898000 ffff83133ee47000 ffff83102db8d000 0000000000000011
>>>     ffff83303fff7dc8 ffff82d08027df19 0000000000000000 ffff83133ee47060
>>>     ffff82d0805d0088 ffff83102d898000 ffff83133ee47000 0000000000000011
>>>     0000000000000001 0000000000000011 ffff83303fff7e08 ffff82d0802414e0
>>>     ffff83303fff7df8 0000168b0192b846 ffff83102d8a4660 0000168b0192b846
>>>     ffff83102d8a4720 0000000000000011 ffff83303fff7ea8 ffff82d080241d6c
>>>     ffff83133ee47000 ffff831244137a50 ffff83303fff7e48 ffff82d08031b5b8
>>>     ffff83133ee47000 ffff832b1a0cd000 ffff83303fff7e68 ffff82d080312b65
>>>     ffff83133ee47000 0000000000000000 ffff83303fff7ee8 ffff83102d8a4678
>>>     ffff83303fff7ee8 ffff82d0805d6380 ffff82d0805d5b00 ffffffffffffffff
>>>     ffff83303fff7fff 0000000000000000 ffff83303fff7ed8 ffff82d0802431f5
>>>     ffff83133ee47000 0000000000000000 0000000000000000 0000000000000000
>>>     ffff83303fff7ee8 ffff82d08024324a 00007ccfc00080e7 ffff82d08033930b
>>>     ffffffffb0ebd5a0 000000000000000d 0000000000000062 0000000000000097
>>>     000000000000001e 000000000000001f ffffffffb0ebd5ad 0000000000000000
>>>     0000000000000005 000000000003d91d 0000000000000000 0000000000000000
>>>     00000000000003d5 000000000000001e 0000000000000000 0000beef0000beef
>>> Xen call trace:
>>>     [<ffff82d080246b65>] R common/timer.c#active_timer+0xc/0x1b
>>>     [<ffff82d0802479f1>] F stop_timer+0xf5/0x188
>>>     [<ffff82d08031e74e>] F pt_save_timer+0x45/0x8a
>>>     [<ffff82d08027df19>] F context_switch+0xf9/0xee0
>>>     [<ffff82d0802414e0>] F common/schedule.c#sched_context_switch+0x146=
/0x151
>>>     [<ffff82d080241d6c>] F common/schedule.c#schedule+0x28a/0x299
>>>     [<ffff82d0802431f5>] F common/softirq.c#__do_softirq+0x85/0x90
>>>     [<ffff82d08024324a>] F do_softirq+0x13/0x15
>>>     [<ffff82d08033930b>] F vmx_asm_do_vmentry+0x2b/0x30
>>>
>>> ****************************************
>>> Panic on CPU 17:
>>> Assertion 'timer->status >=3D TIMER_STATUS_inactive' failed at timer.c:=
287
>>> ****************************************
>>
>> Since this suggests a timer was found on the list without ever having be=
en
>> initialized, I've spotted a case where this indeed could now happen. Cou=
ld
>> you give the patch below a try?
>>
>> Jan
>>
>> x86/vpt: fully init timers before putting onto list
>>
>> With pt_vcpu_lock() no longer acquiring the pt_migrate lock, parties
>> iterating the list and acting on the timers of the list entries will no
>> longer be kept from entering their loops by create_periodic_time()'s
>> holding of that lock. Therefore at least init_timer() needs calling
>> ahead of list insertion, but keep this and set_timer() together.
>>
>> Fixes: 8113b02f0bf8 ("x86/vpt: do not take pt_migrate rwlock in some cas=
es")
>> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Thanks for looking into this so quickly, and sorry for not realizing
> myself when relaxing the locking. Adding the timer to the list without
> it being fully initialized was a latent issue even if protected by the
> lock initially.
>=20
> Provided testing shows the issue is fixed:

I guess the change here is needed anyway, even if testing finds there's
still something amiss?

> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

Jan


