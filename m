Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5174AB68D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 09:29:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266536.460217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGzOn-00035H-Pn; Mon, 07 Feb 2022 08:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266536.460217; Mon, 07 Feb 2022 08:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGzOn-00032z-MV; Mon, 07 Feb 2022 08:29:25 +0000
Received: by outflank-mailman (input) for mailman id 266536;
 Mon, 07 Feb 2022 08:29:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nGzOm-00032t-GJ
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 08:29:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d79a193-87f0-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 09:29:23 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-vMHiqXIwPXmVZiPelz3b_Q-1; Mon, 07 Feb 2022 09:29:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6333.eurprd04.prod.outlook.com (2603:10a6:803:fe::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 08:29:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 08:29:19 +0000
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
X-Inumbo-ID: 0d79a193-87f0-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644222562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wB7/UuM4am76mp9BiKb156REv1HjI39T7VQH49ocQNE=;
	b=I7ai0398zas0Y2YmlD/UYOMIHAMdse1KZtuRIlL+HrV9pw4j18fEfiS0uMXdrArpwxlyIw
	5dEFBQa4VnPNGEqBlrTj6dM5Zmn39nMY7gxhlZ/QbyfE+J5p6XzQVzuNJG7jXypqxo7nkI
	LuBstJ8ndgaeRd8pCOTKk1KLEtvVc9k=
X-MC-Unique: vMHiqXIwPXmVZiPelz3b_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFbS9wHbGfWOLM2t0DSvyPI7ZR36IiZXybARD+6P01aoHPRleym/yE5T0JQuRbL86QLXX0GkGKv7OFzNPsk6wHpm5Xr+JIolKC8rkL4q58puQ1v9dGm6MiUYKPvyGqXSkdUqulUBCmSTXxqRMWmghWwEXGhaRv7zsVNoA3N9wtbgDdyaHy/QGy+z/Y+pOcv0c5E0JAlKe89XUizZCWuth4WRQJfUT1LIHcimMRsb0Grnup/7UpEzvgRfoqJBSHlez//dRTFn9+XzS2zTEK1/tqRos5JDwEoH0fvHcfVfhPkBW5YAQd95w1xHabbv8Da1omA2BTyfbuifM5bLsuE2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zY8wF/cgDacGMiqAmzd3t1NrwEoSzJYZ79svQg7JFr0=;
 b=XeEEKEJtCpvmWuJiLunqWLlO4XKLlnARdCffEF6mDC5KkFc5+z3kDGZJBNdqVTQdyZJa+Ftrz7xi2h4e5MBsp5T+0bsEwKl1/+14rdOQRY2IhKMaHWmbgvPxRk6TI44K6MAEA1GA6HZSsXbzZNNOnr41GpnxcVMUwvxLqzpz7gnwFvLFt2M59UxFGlkfU7FSyiBzm2JNErLMlQ/u1pMsfKF0dlce4iyN1YrLKhN07GES8dJPKqzilxW8DzH6sFSmbVYZBMxTJKXrTAOsUVcrVF9aC4mhtWTswKyupWnKASPpmqRGQHaJ8Ezjudkfgx3+dsWfXOSgQyV8cZZCky5JhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4555a325-96c5-4fc8-5d6f-a5fe0f47146d@suse.com>
Date: Mon, 7 Feb 2022 09:29:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/hvm: Fix boot on systems where HVM isn't available
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220204173405.22759-1-andrew.cooper3@citrix.com>
 <Yf5HpzveBK+Ho3Nt@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yf5HpzveBK+Ho3Nt@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0069.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0afe2a26-e354-487d-ce26-08d9ea13efb7
X-MS-TrafficTypeDiagnostic: VI1PR04MB6333:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63332EFA9B33D4E75675485DB32C9@VI1PR04MB6333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DJIziOgMnwVNYVEMYC8+VZKkCLyA8dC/GEAWoxoinPF/MUjg7Rfk8c+xauEWMlgi2vTrawHCD5X5i9S6jxAN6P33ne/gpG1BeZ+N7a7wC2So6fF4MWP1bAaG38LQzhFuvc/VnRuAv52cKfLZGhzQ/xJ2FxbUSb5J8z3shGkE/btvRg6sevXDq87+FUHCcRkxFTwGyXRiTkLkqViOCfWj+ajr/nFl+ULIxzqITNH17VGV4CuuQkDLmJyVrEUXM6NwMCQrqjgLj32zy1MGcsL3PJYgL7Qq5xLn1POtnC2v3iGW1UnIvFLjjSoFee8B3k1lxI4lPeSV5ru1dUn5/jBTV6O38gpzZoI3qcHI07vxzpIE/GUkuywTJffXu6PQhQpmu4JGv17XLTnu2ycmL6e9T8LfwI4IS7wpIwHTw/KUqWI1KpBcA200yg9nko5LRDIP7k02N3P8wMsVARt7qeWgTa6TyrgVuoDcmyY+N22+ukPdyKx5Czeeh+jxXvxsUbIR3DVfHRadLGLYkXwQUKvtP9IjsjFb6vBnFTLxBfrk5WL+04nysM3l9ue7YnSf3ewyoj0zoUalCL9PZr2WR1BdIz9EdwxqFNYYVgRj52nj66sg0lxrxyk9tjignN6mbYaSaoCQT8rng5xHmOJ7nchmAawBCXav+he6Q9dJgcdSPRaEBrP2fJeYqb/gPkaDQ24Wde3AS2sEY8QVxH3DaOm2vl8qfeCiuOKnEb4hWt6lB5s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(54906003)(36756003)(26005)(186003)(83380400001)(6512007)(6506007)(6666004)(5660300002)(31686004)(53546011)(6916009)(316002)(31696002)(4326008)(8676002)(66556008)(66476007)(2906002)(8936002)(66946007)(86362001)(508600001)(2616005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w0+aHfmDEJ2SuKg2yu/uGDxBgYd8JSPizblmUzZFeFjJhetsrEM80aadxEqk?=
 =?us-ascii?Q?q78k1gGesRXqMea/lQDmc7gA1AWnoTk0fvvK9iRXP9T52n0enFo3GYoyIrAw?=
 =?us-ascii?Q?IuwyXwn2Nk3tPl4d3ezMSHvYHmNPQoU1vtbCdR3a+14Pqk8KYDHD0l09qEjX?=
 =?us-ascii?Q?5AQnF7ArQOATwU9LxRQYFu+bbNqsricYN2zKHytHvRUnUtPG8/fl1LewnP9J?=
 =?us-ascii?Q?zPIBDo2a/noBEc0FkBDl06tSPhWIIWtCTqZCIcKYhXzIwPNW72be4Y52Ua7H?=
 =?us-ascii?Q?3B8y6ZtAXDLbD7/If3FWQ0joYWZBRN/8RlQL+ySDKfyFQ7sRfy8kpafg8gif?=
 =?us-ascii?Q?IS1mgkzLolaGYafT57rtfd9GSye68FarmZDOjwjlfwvvaRVU5PiBTwf5LSse?=
 =?us-ascii?Q?ppY3It43gog6uCoj0arKgghWcM1uNhNzCl3xYmIQspinhoJCnVIVhJXXcTeu?=
 =?us-ascii?Q?AzPT8p+zqpo9xWYdmR/+pfBURvyj/EzsTloRNFE+zZmwFzAmCe71J1/28eLa?=
 =?us-ascii?Q?rssjVb04zV9WGvoPi6oJIi//IhYASE6dzaCZkm2qdI8chbVcCem0nTP3fSic?=
 =?us-ascii?Q?GmNH17mcqMB/JRo4dnbx5w+fY9VA8HDi34C2/bXQXcz0eEkz8InrneqqhYF1?=
 =?us-ascii?Q?BZrjeQk0Psf4bZVvK4VQJjm+gOb4irPNlCIeJMGh4xKYd/4JRQgJyGsflSOQ?=
 =?us-ascii?Q?iwYwi36KdgtlWzxWMgHo3NfJOJOA8xpxeHY8Xh47xQej4FRzvAg/efPyOWak?=
 =?us-ascii?Q?9r8JiDJGgIe7sMXpIGH/00CEie6jJNIwpAWJUjvqyspDi3q5ZSxCejwc71GB?=
 =?us-ascii?Q?00joMPnwh5UAB6o5HxdqhZUd5vs/KcoRXTfK4rdR5IwTzdQACHhy8R7zxeJ9?=
 =?us-ascii?Q?+B4+nRNqnUQiCVVFm+Iq2pjoTWTdgPbJtYTUNOGGN7dFX4NB2f0MrTSZMRXP?=
 =?us-ascii?Q?itxvc1cXyIVVoBd58DQfNkyX+72eYDVPfK/wV1fUjCNiu0WCyxD6qVPHoj7Q?=
 =?us-ascii?Q?oR9FEf3K7G8hM8OGwkTmCJPTuRWEzfLuyAHZ+k8NhPmyWvdx2wLfhPPeN/+W?=
 =?us-ascii?Q?3LFPidzuUMYVGfXVYgBGCc7bA6FjJJ2BKsEujrV1X5qJS3kRxw/ZoRf7FW+a?=
 =?us-ascii?Q?9EMEfZYWtm9YLN1K4kWNCn3nEW7SZMwGKGVJD9/W/Z35PHpsIJnM5l8FBnF2?=
 =?us-ascii?Q?1WXTHg4vVZIQXGF9eDxQln5RKDKjs3onddZpTTjojnS39iChBYyV7d4TfGJr?=
 =?us-ascii?Q?B+CFKX2iiyICdXRo44zldaaXpsmd+nb0tOUm6jqjNrlD3KKMJcjMjMioAr9h?=
 =?us-ascii?Q?lYfhwrBm8MzPTh9PvM/n+vAyWCN2HrWVaq5+eItC84ju+fzGDyJV5lXVIfur?=
 =?us-ascii?Q?VWzwY4I/H3glilbuuNQN2CHtmV/Jz/ILIEWkfYSkjW7fA0mfN46+AKwo+JLG?=
 =?us-ascii?Q?GcFA0LksC53dkBOstxuaTC4knHnDqmJrnBFpwOqyZPewZ3mSWhebzgKHrg2H?=
 =?us-ascii?Q?BK3VwQ6EMXXrDn6yZ6ALD4dwolE5kKURM3HA5gwAO29/aFpTy2HyVB80oazT?=
 =?us-ascii?Q?yg4Ddv/nhRWMrwtpqbHofoH4vB7qOMEXrQNqDA3/CavMkRvKCCcoMWktjNFT?=
 =?us-ascii?Q?fmhMkXaNVZqSWSiBtd7CUNA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afe2a26-e354-487d-ce26-08d9ea13efb7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 08:29:19.8433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sv8yws7bAAIfe7T/4+5nrYiMcw97khzpVLiO9tzYx0IDihOSPZjdRk1E+7dFch/YGzLYr370GzPyGVM2HcCsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6333

On 05.02.2022 10:47, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 04, 2022 at 05:34:05PM +0000, Andrew Cooper wrote:
>> c/s 27a63cdac388 ("x86/HVM: convert remaining hvm_funcs hook invocations=
 to
>> alt-call") went too far with dropping NULL function pointer checks.

Oh, I'm sorry, I should have noticed this.

>> smp_callin() calls hvm_cpu_up() unconditionally.  When the platform does=
n't
>> support HVM, hvm_enable() exits without filling in hvm_funcs, after whic=
h the
>> altcall pass nukes the (now unconditional) indirect call, causing:
>>
>>   (XEN) ----[ Xen-4.17.0-10.18-d  x86_64  debug=3Dy  Not tainted ]----
>>   (XEN) CPU:    1
>>   (XEN) RIP:    e008:[<ffff82d04034bef5>] start_secondary+0x393/0x3b7
>>   (XEN) RFLAGS: 0000000000010086   CONTEXT: hypervisor
>>   ...
>>   (XEN) Xen code around <ffff82d04034bef5> (start_secondary+0x393/0x3b7)=
:
>>   (XEN)  ff ff 8b 05 1b 84 17 00 <0f> 0b 0f ff ff 90 89 c3 85 c0 0f 84 d=
b fe ff ff
>>   ...
>>   (XEN) Xen call trace:
>>   (XEN)    [<ffff82d04034bef5>] R start_secondary+0x393/0x3b7
>>   (XEN)    [<ffff82d0402000e2>] F __high_start+0x42/0x60
>>
>> To make matters worse, __stop_this_cpu() calls hvm_cpu_down() unconditio=
nally
>> too, so what happen next is:
>>
>>   (XEN) ----[ Xen-4.17.0-10.18-d  x86_64  debug=3Dy  Not tainted ]----
>>   (XEN) CPU:    0
>>   (XEN) RIP:    e008:[<ffff82d04034ab02>] __stop_this_cpu+0x12/0x3c
>>   (XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor
>>   ...
>>   (XEN) Xen code around <ffff82d04034ab02> (__stop_this_cpu+0x12/0x3c):
>>   (XEN)  48 89 e5 e8 8a 1d fd ff <0f> 0b 0f ff ff 90 0f 06 db e3 48 89 e=
0 48 0d ff
>>   ...
>>   (XEN) Xen call trace:
>>   (XEN)    [<ffff82d04034ab02>] R __stop_this_cpu+0x12/0x3c
>>   (XEN)    [<ffff82d04034ac15>] F smp_send_stop+0xdd/0xf8
>>   (XEN)    [<ffff82d04034a229>] F machine_restart+0xa2/0x298
>>   (XEN)    [<ffff82d04034a42a>] F arch/x86/shutdown.c#__machine_restart+=
0xb/0x11
>>   (XEN)    [<ffff82d04022fd15>] F smp_call_function_interrupt+0xbf/0xea
>>   (XEN)    [<ffff82d04034acc6>] F call_function_interrupt+0x35/0x37
>>   (XEN)    [<ffff82d040331a70>] F do_IRQ+0xa3/0x6b5
>>   (XEN)    [<ffff82d04039482a>] F common_interrupt+0x10a/0x120
>>   (XEN)    [<ffff82d04031f649>] F __udelay+0x3a/0x51
>>   (XEN)    [<ffff82d04034d5fb>] F __cpu_up+0x48f/0x734
>>   (XEN)    [<ffff82d040203c2b>] F cpu_up+0x7d/0xde
>>   (XEN)    [<ffff82d0404543d3>] F __start_xen+0x200b/0x2618
>>   (XEN)    [<ffff82d0402000ef>] F __high_start+0x4f/0x60
>>
>> which recurses until hitting a stack overflow.  The #DF handler, which r=
esets
>> its stack on each invocation, loops indefinitely.
>>
>> Reinstate the NULL function pointer checks for hvm_cpu_{up,down}().
>>
>> Fixes: 27a63cdac388 ("x86/HVM: convert remaining hvm_funcs hook invocati=
ons to alt-call")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> RFC.  Not tested yet on the imacted hardware.  It's a Xeon PHI with anot=
her
>> werid thing in need of debugging.  First boot is fine, while second
>> boot (loading microcode this time) has a problem with vmx.

Sounds not unfamiliar: My meanwhile oldish Romley needs to be cold-
booted for VMX to actually be usable (not locked) on APs.

>> I wonder if we want to modify the callers to check for HVM being enabled=
,
>> rather than leaving the NULL pointer checks in a position where they're =
liable
>> to be reaped again.
>=20
> What about adding a couple of comments to hvm_cpu_{up,down} to note
> they are called unconditionally regardless of whether HVM is present
> or not?

I second this as the perhaps better alternative: The S3 path is
similarly affected (and you may want to mention this in the
description), so this would mean up to 5 conditionals (at the
source level) instead of the just two you get away with here.

Jan


