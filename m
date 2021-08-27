Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2583F9461
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 08:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173392.316385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJVLu-0007ST-0W; Fri, 27 Aug 2021 06:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173392.316385; Fri, 27 Aug 2021 06:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJVLt-0007Qi-S2; Fri, 27 Aug 2021 06:28:33 +0000
Received: by outflank-mailman (input) for mailman id 173392;
 Fri, 27 Aug 2021 06:28:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVCk=NS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJVLs-0007Qc-LC
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 06:28:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff2ab2fc-06ff-11ec-aa90-12813bfff9fa;
 Fri, 27 Aug 2021 06:28:31 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-ba7-L4tGP8ukV92k2KIHVg-1; Fri, 27 Aug 2021 08:28:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Fri, 27 Aug
 2021 06:28:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 06:28:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0092.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Fri, 27 Aug 2021 06:28:26 +0000
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
X-Inumbo-ID: ff2ab2fc-06ff-11ec-aa90-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630045710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wuzQFD4utnY7rFI3iTQdoxtZCBG4A5b1I7lQ8hrBEvk=;
	b=MEWXSK6XME1IayUaQNjB0DyyUUmKbcMVCkOE+iyfPyBl260vB9itEFe9HSfG8UXIQIVrU4
	8cLH5MJC05ro3XSyzssn+v5/osLRtWbSpcjROWgEsbaJwt9CZu6vd5+HIWKDVxb/0OL9Jn
	oe7ikp28gIoULDXNDz8leykrXbUi6dA=
X-MC-Unique: ba7-L4tGP8ukV92k2KIHVg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgyTMqZUF2QpH1EeEmQHIF2sI56eh5zrLghryXD+DZE0/KWvLeR72MuX4wUKDLcoDfdN3ww+cqTQQ7lHNmcjk73lcSACjRV6dNRWx8rYgLOdh1ttrOL9xsx0heVMFsAZ94e58wuk8J3PiNaUyztXQ0cLq9szACh4mpu/pn1x6ZcM3jehPD7i+x5WtcqJEGb/ZPLufVIJn1Z/ZdCIwK8jgGjZMtqDLciovN/y9XOz1u94VtZSJ216ydB9p7DCz9a3xpHlErXGMgJm65al+MetdUZjlBG8EqR6GeKXpCej11otm4vXd/yAZxNYbZQKvfGn1OXZY18gy9EWmBw6lOm7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pp6AXQbcNJm3Li0YSJQ8jm6grjN9bJYKcWH0MiR4LCs=;
 b=lnL9Bzw45CRm4p01pQ2NfKEwRhNgYGDK/pVmRyPkrXtxhEg/eewZbnGsqRZZL15iKJpVGW+UTuK3R5NWLIY3+DpLNZPrVdIE0Nlzq5GAbiHG53HDYux75n7K0KNMuma6Pybgsw9D7DRB1rOu8gJsVejVunTNzpPLG7c+FrVLly9Or+fJFGCkmJi+cWF8Gk1fuHFADjorrbDP4KACjjEpvPyMZaEjHFVVpaQsoQWEVFTYOkF4+e6jYnNstbjCQt0d93A11kgbUt9RpW+eEL2LtBNAS2uAvKOyioddzfb6MJ8Cc60kkl7uxcKMuUWLnIvRj3bArqWcWv57kSjcCwUC8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: HVM guest only bring up a single vCPU
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a1724918-94bf-748f-5c4b-5a3ec176368f@xen.org>
 <781aeba6-5e77-9995-cf58-9dc6fd443ad8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b2e6fce-98a2-c18f-7068-9ca990b0b95e@suse.com>
Date: Fri, 27 Aug 2021 08:28:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <781aeba6-5e77-9995-cf58-9dc6fd443ad8@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR01CA0092.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acb058ff-3e94-4538-de60-08d96923e0ca
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6383AEB7E6B28A39E7504B90B3C89@VE1PR04MB6383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0v8/Xmz637uqWhDEnv4uRodmCbROHzPerzz+L6SZwVjY0A5R7dDURIEvwGyGQPkGZl5X4HRg2IRFkWLioMWDUaibdMIfSrr1XuCjYlZncp37b8fQvzfQw+T19tlEGOY0EAtlxl1IM1WEn0KOIjb7Bm+H7Z4qldSzjk6DUmha8QBmqjoDL4Z9TrNtYHTdyo5aQdmGJS1eUCsKnOv+DnQn/WArc+JbrNzbmQLkyEjyoMDrKb6xbJLX8HPC93+BFTvEOtAhgKaNQREiYd6+sPIpYgh+85MIjffOsW7GldXhWfKk7oK8KlGqYBtwzOUKdYmAnpu5wwPZqv6fzyeJnzsGjtcMGs27myw86VEpfj2ZZY26DML8ygKGKE3+3stmhOTptTXt+Gjdr6zK3JA9rkIX7gzi/kCP12E609pCbj1kLRjnCsC63viUW1kBMiS3QNW5t/UlPfD17FuWGzPNITB1rHRYRHTFKw8K7eEafr67hQkWZNwtkFDixGnzmgQZ0Su7WrAkGScyPEFawONScfkAF5tN3G6Q/C/owqZCFPweNMam4t5mBjA2Av8MR0VKI+FTIgWD2WfANNF5OkLIGXHebgTcNPSSKcai6L/HO95fuyI+vOo97Aumg9zgkkLL7N19bE/lWr0A1Qd0bePnAJM2ys9Hklii7MOLHYQWEmWZyVxpn8ajKdgVHIuJ2O/byqxF6CIahY8NJGERjTt2zrhy9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(346002)(366004)(396003)(39860400002)(186003)(5660300002)(8676002)(86362001)(66556008)(316002)(8936002)(36756003)(66476007)(66946007)(53546011)(16576012)(26005)(6486002)(31696002)(478600001)(38100700002)(2616005)(956004)(110136005)(83380400001)(4326008)(2906002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sLhywzMi2HF15zEcSjpcU18fi8zLKmUdCqZnKmWElYb0PrZmkFlG1vyHvFqr?=
 =?us-ascii?Q?6+dvl7P8A4gII2xNqNhxixHma/hFALaWjhQJu2J560UPuihAeYu+ysGYGRsW?=
 =?us-ascii?Q?/EcvsPjSPo0bzk1hlcsJ1bVFJRluEQAzYFqX8EPahbZ/Er2OkP0rfW7Ch1cL?=
 =?us-ascii?Q?+FvEEDz5l7GGq+H1ULICwpnwALK0G3P7UiSnTeCNRqxEkJRa+Aasy6TaMzFz?=
 =?us-ascii?Q?LLfZWSmCnGCuQVliHmBW428g/RxyBRpaGib65vrgjG0gSC+UX2N+emP+EBl0?=
 =?us-ascii?Q?A3Wb1m0v4abbvrKFXyfPIFgfUFqP+GRG9wPuZrO9sBMCvoa/eVlzfDkqcgiw?=
 =?us-ascii?Q?YqrCeu/VNmYa+qKq6FL8EIFuYCwVqTmXvRR+PsyrpdJbikRfas98FN9tqua2?=
 =?us-ascii?Q?jQDalejehmIDRwE2xLwCwLgpmo+nSJMwjZufFtuio1fRaO5qg/gjwK/jexMp?=
 =?us-ascii?Q?kT97Lrth/aeVacNkM/p+NQ9o4BwdcrWwenprZ/PnAQdgkMsU13BZlKMrFSVs?=
 =?us-ascii?Q?aSaumAnIbE3faAnYAbdFa7SKMD1R6wNJ9NOmd0sNxgywgRo95uxtNlo6MAbv?=
 =?us-ascii?Q?Qr7JN9MXKc4to5ixFXDUQX4ZkSGU9fWHLmZBAf7igzWFPbO7SQfKCYWwVBEs?=
 =?us-ascii?Q?lKK0U6PzTwwZcfdbFo/89Yq5WEZpEfzJW1XGeiw656uvzkacOtjJKZCJlwVS?=
 =?us-ascii?Q?nrTb+IN1xu8ZGfQc54UiISrHw5No1ETmZyIZKyuBHgi5SHmC3rrG+LeX8ie3?=
 =?us-ascii?Q?17lVKE/pFS8+/ZmeYmP/3iynGe7PRUN1DlmqRV8+8Jh08zjMxH7u4s2nAaaQ?=
 =?us-ascii?Q?r+x+0js3SGhauvGxYs/ViO8b6xuuOdhsWzAWs9Z/GJGMVDjQcqG2ZuGN8dRc?=
 =?us-ascii?Q?C3qGjd08kHS3s+7jHJ2Z/Uh6oG4Cs5owWnMXhtLTNui37pEvclpw4sm2Jo0u?=
 =?us-ascii?Q?92LBznnJg4EJRY7xOUEMR3PACZHqB6Iv5TfThcVJmp8LBUdFnjIrSG+njoyn?=
 =?us-ascii?Q?JkaPu9HcAO/r1wV6j0nEa7w6o2AzEE13kMWR1keVgXzaitqdMQ843iYbuveZ?=
 =?us-ascii?Q?Q4x8GHnaw3kHg/Z4Btsob1r/gl5rbdejWINCuJjOM6sXRzhVcFkPWnZw9XdI?=
 =?us-ascii?Q?koguQsEpgWejJ0n86FyA8DKAwMTgUa8P7YZ2qfHIW85tpyte7fwbEEj1Iw08?=
 =?us-ascii?Q?RQ0StO2IBwB0o2op7pidza4R+zRHyo/EisKApUuEbydVCreTyixDTVc4HtLI?=
 =?us-ascii?Q?v31Of5z08BYA5PJSuniJnN4TcmbA3rA7wYsU19ODdRFFlsZfcEKOyNcLfUct?=
 =?us-ascii?Q?LEqYMHzNMsaAL8YErpYH1X18?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb058ff-3e94-4538-de60-08d96923e0ca
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 06:28:26.7238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yH8rTfI2C41ACwwGhZBUqHe+/jbtLwQUIvcfMTqXbPTCb6bOKJp05fRk39a7bZx7h/VrMHCIaVGdf9vD6I3wcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383

On 27.08.2021 01:42, Andrew Cooper wrote:
> On 26/08/2021 22:00, Julien Grall wrote:
>> Hi Andrew,
>>
>> While doing more testing today, I noticed that only one vCPU would be
>> brought up with HVM guest with Xen 4.16 on my setup (QEMU):
>>
>> [=C2=A0=C2=A0=C2=A0 1.122180]
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> [=C2=A0=C2=A0=C2=A0 1.122180] UBSAN: shift-out-of-bounds in
>> oss/linux/arch/x86/kernel/apic/apic.c:2362:13
>> [=C2=A0=C2=A0=C2=A0 1.122180] shift exponent -1 is negative
>> [=C2=A0=C2=A0=C2=A0 1.122180] CPU: 0 PID: 1 Comm: swapper/0 Not tainted =
5.14.0-rc7+ #304
>> [=C2=A0=C2=A0=C2=A0 1.122180] Hardware name: Xen HVM domU, BIOS 4.16-uns=
table 06/07/2021
>> [=C2=A0=C2=A0=C2=A0 1.122180] Call Trace:
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 dump_stack_lvl+0x56/0x6c
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ubsan_epilogue+0x5/0x50
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 __ubsan_handle_shift_out_of_bounds+0=
xfa/0x140
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? cgroup_kill_write+0x4d/0x150
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? cpu_up+0x6e/0x100
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? _raw_spin_unlock_irqrestore+0x30/0=
x50
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? rcu_read_lock_held_common+0xe/0x40
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? irq_shutdown_and_deactivate+0x11/0=
x30
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? lock_release+0xc7/0x2a0
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? apic_id_is_primary_thread+0x56/0x6=
0
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 apic_id_is_primary_thread+0x56/0x60
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 cpu_up+0xbd/0x100
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 bringup_nonboot_cpus+0x4f/0x60
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 smp_init+0x26/0x74
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 kernel_init_freeable+0x183/0x32d
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? _raw_spin_unlock_irq+0x24/0x40
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? rest_init+0x330/0x330
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 kernel_init+0x17/0x140
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? rest_init+0x330/0x330
>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ret_from_fork+0x22/0x30
>> [=C2=A0=C2=A0=C2=A0 1.122244]
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> [=C2=A0=C2=A0=C2=A0 1.123176] installing Xen timer for CPU 1
>> [=C2=A0=C2=A0=C2=A0 1.123369] x86: Booting SMP configuration:
>> [=C2=A0=C2=A0=C2=A0 1.123409] .... node=C2=A0 #0, CPUs:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 #1
>> [=C2=A0=C2=A0=C2=A0 1.154400] Callback from call_rcu_tasks_trace() invok=
ed.
>> [=C2=A0=C2=A0=C2=A0 1.154491] smp: Brought up 1 node, 1 CPU
>> [=C2=A0=C2=A0=C2=A0 1.154526] smpboot: Max logical packages: 2
>> [=C2=A0=C2=A0=C2=A0 1.154570] smpboot: Total of 1 processors activated (=
5999.99
>> BogoMIPS)
>>
>> I have tried a PV guest (same setup) and the kernel could bring up all
>> the vCPUs.
>>
>> Digging down, Linux will set smp_num_siblings to 0 (via
>> detect_ht_early()) and as a result will skip all the CPUs. The value
>> is retrieve from a CPUID leaf. So it sounds like we don't set the
>> leaft correctly.
>>
>> FWIW, I have also tried on Xen 4.11 and could spot the same issue.
>> Does this ring any bell to you?
>=20
> The CPUID data we give to guests is generally nonsense when it comes to
> topology.=C2=A0 By any chance does the hardware you're booting this on no=
t
> have hyperthreading enabled/active to begin with?

Well, I'd put the question slightly differently: What CPUID data does
qemu supply to Xen here? I could easily see us making an assumption
somewhere that is met by all hardware but is theoretically wrong to
make and not met by qemu, which then leads to further issues with what
we expose to our guest.

Jan


