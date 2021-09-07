Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26484024EA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 10:12:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180566.327284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWCc-0001y2-8b; Tue, 07 Sep 2021 08:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180566.327284; Tue, 07 Sep 2021 08:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWCc-0001ub-4b; Tue, 07 Sep 2021 08:11:34 +0000
Received: by outflank-mailman (input) for mailman id 180566;
 Tue, 07 Sep 2021 08:11:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNWCa-0001uV-3l
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 08:11:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fd28f35-4acf-4b82-a357-48ad7d4a734c;
 Tue, 07 Sep 2021 08:11:30 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-WNOwULU5P1-pdkk2dJTp-Q-2; Tue, 07 Sep 2021 10:11:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 08:11:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 08:11:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0107.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 08:11:26 +0000
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
X-Inumbo-ID: 0fd28f35-4acf-4b82-a357-48ad7d4a734c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631002289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NL5+XZXMZuyGIIbtbG3QIPRva4YiO/MGTh6ZA1O4+5Q=;
	b=LZHnLs+0psfwctVP47zmDYmB6CBiSh5PeGQwksJZ6J1VyK7FBMEK+F61DJaChXXzF//Pyk
	AwhEvnMgiIVwYq8c22Jsg+2JhEsH2XObER7L6IhNcwp3JnEIs+ZNNkhV81vdg88+e6XLt6
	UsPqY4LBPfcgJGXdgSSQMjp8nZ/PAHs=
X-MC-Unique: WNOwULU5P1-pdkk2dJTp-Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYDgMW6ar0nnsQeWaPyczkp4e9EnuxWFXNZYiYnE/o+cKh5jTEVXZ+cLWFB9AO+D80I1GVKLijyrNA0fX7rMfehTgegpgmhntQ+FW3qmj77BEg8vkHh7fVS99Qj86oo8PsXRs35N0rXLI+A6waZ4qeTJAVwmM4QdchYrCl5JnFhYD9J8h84YMxbBGAtgKYiIwoPN1jmz6OOCeSVNLnJLWWeHEZQuAkwYOn1PvsQyL6yG7iudk2hoyCOGaoaftvmzU6x3mwaOoejsUGKtf+NuyKhtszYG3QU1XJh5UoM7I21W5ZF2Bl4L3v8cuei7wDFF4kQSaiN3fLRH9POuJ4ZLOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=95mzxOnnCf3gr5z3HF9NfKZisG77yTQkq6d66SJJ3zc=;
 b=hShkfj+tuwxIFAK3UUaOvGm0sMKwF9RJqGCjFst8IoXM3pi76pihBz6hBNEoh0FkO1DoYX3SbIRuYyfctrpDqMtnpl8MgUyhGnBMKWQ4ZX5TiK0YTd6fNyO7TFCVShdg0jgDh3wc9zsqrCNQADMrjkD+j913l1nCXmP2ioUs56z2G71lUzyGzE1MUflD/6CJGHx+SZomRN+9dFVBPKF94QnoCGc4yUymj3o7RELQPj8l8Lj8X7AtXi7IK+vTRtfXdH7a+BoSC7zdPR/O7U0Y/dwWA1AO/b4NG58DriIirkOAViXJNejY/b+IPqP566m4hRIA0cARLMJQjJnlcoGmsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: eikelenboom.it; dkim=none (message not signed)
 header.d=none;eikelenboom.it; dmarc=none action=none header.from=suse.com;
Subject: Re: xen-unstable linux-5.14: 1 of 2 multicall(s) failed: cpu 0
To: Juergen Gross <jgross@suse.com>
References: <9c36205e-cc37-ed9a-3408-0cccc4a83115@eikelenboom.it>
 <0ae9bb1e-dacc-a3d2-ed90-f85cb52c698d@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sander Eikelenboom <linux@eikelenboom.it>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36e8dec0-e777-a4d1-de8a-8991d95407cb@suse.com>
Date: Tue, 7 Sep 2021 10:11:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <0ae9bb1e-dacc-a3d2-ed90-f85cb52c698d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0107.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3344e7c-dcb5-468a-6cc6-08d971d716c3
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48483C381199B09E09529119B3D39@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YKAV0qSviyZeu0E2pe6klOFT9CbT8K8sTd8snsUZIdQ3VAEM1hvwWQfacymFxlDHSsW18TT0tYSOycySklJjPwJ+Sfz+9TuWx4Kbbt1awzT9RtVpd6eSYe/Yj1Y9Jv/MmOYkYN5hf8QU78sSJ6iA2iaMZ0IttvnpF3pRAYzVu4+rbR2FvRG8ZwYMhV2lBEdO8S61MII9lYUCWBZoyghJpPcUE1cmn6ogAXSKv6tgw7vlyofTEmKCTuCn0rw0xnbCsZ5S8/au00jA8kqqEl4wDany8Us/QFIsanbQuAVuMornBE2eUtCTiddWtlxfNzsQRABsoyzhu9oNTdEIzlhCPXuhVV+qTY76PIvS5oSg2lcElx6ihWPeDTXDH768Pnll0bBQBKZRg1SgA44wtrjxUdW60qP/uTZYm4R2VqIKaAcX+mnE12K+tqJyviO0DSlFIbY6YW0IzeCNRDXA8GVSrqDsygqp3ume/Jp+ohyLXwZr/GmBkvqxKi+oBw/6PixnMfY8PQwiXQlEopi/xcPGDw0aH7I6TWHcpSILvwpaob4zl/M868j9EdqRHzXNl+5n9AOxSpQMQMYRxb9C3pJbuHRIlJU6GsrZVdANW43fBR69b9UxrKmQtDDqDs3HJrVBv6knWaVoixTzO7n9SbVWI8aV+R4Sf5O0kp2lMozur91GoxOwo9fY1oB+6/byeNuONellYK+sYuyobN2RWb8TEU88pYGm80jGUsKWb1MOAK6rP8i4KlNfR7MiXSmQgbOt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(396003)(39860400002)(6636002)(31686004)(26005)(8676002)(53546011)(4326008)(2906002)(186003)(38100700002)(5660300002)(6862004)(478600001)(86362001)(66946007)(66476007)(66556008)(83380400001)(54906003)(956004)(6486002)(16576012)(31696002)(45080400002)(37006003)(36756003)(316002)(8936002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?334//3fKJiwriJdtQBrBaZTrLKEkUyDtivoQuwpw/KB8Yues/I4IhDab6xaQ?=
 =?us-ascii?Q?2UYYpIIGVqxiDL8xaRKiesqYxCqvv2Lutohikoce6VlLmCqSiWYgTbS1iaB3?=
 =?us-ascii?Q?I+iXdOMqsx+C4fKcKUrs9cFHpXFYED2Eyl/VoM/c5BFg5dMTigUtTGq5h7NL?=
 =?us-ascii?Q?9z9T+HQGFvCly/RZKEPFGyAzbi1n14qmM8tz6ecgYl5rOfUBgmk6WeENIxld?=
 =?us-ascii?Q?ac3TFQSA+GXv3jFI9U8u4Oix3izdrKDXXxcPNQtAZkbmKlp9+0adztLCiKLg?=
 =?us-ascii?Q?GTW6eWqrMEKffZsMJV9ntWQpl22Guyh8VtZ6TJDjdf/rMTqNBbt6+77vuLgz?=
 =?us-ascii?Q?TeFrtgIIMnrE+sMCHKLnt07JgYTjtI4lCqMr0fo++pLg8yk7g+c4m8Rfuy1x?=
 =?us-ascii?Q?W9KHDhnT+WSwBcU1Qx6CK1v36QlqDcDBn6qNTfYk7/VBLzbNyTMtaKRfovHr?=
 =?us-ascii?Q?Vyhi6p98enDK4GgKu6yjXAMKsBzJNhB8fFDxsuhWI6FV6pqje5C1fMuzSq/p?=
 =?us-ascii?Q?W1ATr8bTiG+7y8e6OR9wlFypw5rT5Bvmzy/BPvnL1kincBgPffl3Ov7WO80/?=
 =?us-ascii?Q?WkECkUBUk0EbiFAbx7/Sz0m0M6BUHI38isZNR+BSzZ8mu/wYYraZ5j+jige3?=
 =?us-ascii?Q?zxqoEtsJHIQl71rqKkalOGsWZpLqrsGJkJ4WBalEM8Hf/ME5LdcMHZ82Vedn?=
 =?us-ascii?Q?floygQPq20r8YJHAplendf3zIm+fPLGAQbvet3J69AcQz+fDBXLOEgwq8ReY?=
 =?us-ascii?Q?VmnzRpoFie6SXMgVz/yRl00fF4aI0vgKdmAjMduXZju7YfSu9ay/P/QDPQQx?=
 =?us-ascii?Q?THfsbx9iCORpfwyPrFY0ouWHZptwhAgeUP8rtlO58SXrxyMeIFjzQPdVVgQr?=
 =?us-ascii?Q?6Bg17upT/X+388HUsOA5rL3y5zft+MyMP3hvk7ueQuEQ54Vp8nWGYEgbQDxO?=
 =?us-ascii?Q?Pd6LrZVp/Hcgk+TkUawmnp9H/Qq/BtG54qds4ax5hRzlgZv1/gQnOnYei0LM?=
 =?us-ascii?Q?waPxh3YYq4ffwaTPpYo5b4WK0K6gBEoNlcPKJrttGrF3LUUok6//qmOFb6S1?=
 =?us-ascii?Q?FOOrdXtW8YY5RYgRgS3DxMgpg22UYKsOj2rWpMnZSdvrDg/S8auIfaRoH2n3?=
 =?us-ascii?Q?rl/TaIDdVSJDhVEyp08P/MWoAcfbSFXYy2NG8+enyRtWQlwDaymGuzkhOztA?=
 =?us-ascii?Q?88jBwHZdlDT/QQReLVwwdEIqrzfANNdH8F9qYVuCa/KIRavWtpR4P0P0UcYZ?=
 =?us-ascii?Q?6y+rEW9YvbH0tGML0lH4HlYDfHwcRwk0WPNwhk+pf1d21/J1W1rpp4qR+WeV?=
 =?us-ascii?Q?ItZtnDGFyUx8Wic9x5KjYTZA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3344e7c-dcb5-468a-6cc6-08d971d716c3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 08:11:26.5288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +aPmfOsaRHhEX/E8tYL8pmiotLzZVpmxU1L3DBNTepnZvNmOVdB7vgOrPbhPQozXuVSWn6ZTRmCJpvQqc9yhTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 07.09.2021 09:58, Juergen Gross wrote:
> On 06.09.21 23:35, Sander Eikelenboom wrote:
>> L.S.,
>>
>> On my AMD box running:
>>  =C2=A0=C2=A0=C2=A0 xen-unstable changeset: Fri Sep 3 15:10:43 2021 +020=
0 git:2d4978ead4
>>  =C2=A0=C2=A0=C2=A0 linux kernel: 5.14.1
>>
>> With this setup I'm encountering some issues in dom0, see below.
>>
>> --=20
>> Sander
>>
>> xl dmesg gives:
>>
>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 63b936 already pinned
>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6a0622 already pinned
>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6b63da already pinned
>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 638dd9 already pinned
>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 68a7bc already pinned
>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 63c27d already pinned
>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6a04f2 already pinned
>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 690d49 already pinned
>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6959a0 already pinned
>> (XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6a055e already pinned
>> (XEN) [2021-09-06 18:15:04.090] mm.c:3506:d0v0 mfn 639437 already pinned
>>
>>
>> dmesg gives:
>>
>> [34321.304270] ------------[ cut here ]------------
>> [34321.304277] WARNING: CPU: 0 PID: 23628 at=20
>> arch/x86/xen/multicalls.c:102 xen_mc_flush+0x176/0x1a0
>> [34321.304288] Modules linked in:
>> [34321.304291] CPU: 0 PID: 23628 Comm: apt-get Not tainted=20
>> 5.14.1-20210906-doflr-mac80211debug+ #1
>> [34321.304294] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)=C2=A0 , =
BIOS=20
>> V1.8B1 09/13/2010
>> [34321.304296] RIP: e030:xen_mc_flush+0x176/0x1a0
>> [34321.304300] Code: 89 45 18 48 c1 e9 3f 48 89 ce e9 20 ff ff ff e8 60=
=20
>> 03 00 00 66 90 5b 5d 41 5c 41 5d c3 48 c7 45 18 ea ff ff ff be 01 00 00=
=20
>> 00 <0f> 0b 8b 55 00 48 c7 c7 10 97 aa 82 31 db 49 c7 c5 38 97 aa 82 65
>> [34321.304303] RSP: e02b:ffffc90000a97c90 EFLAGS: 00010002
>> [34321.304305] RAX: ffff88807d416398 RBX: ffff88807d416350 RCX:=20
>> ffff88807d416398
>> [34321.304306] RDX: 0000000000000001 RSI: 0000000000000001 RDI:=20
>> deadbeefdeadf00d
>> [34321.304308] RBP: ffff88807d416300 R08: aaaaaaaaaaaaaaaa R09:=20
>> ffff888006160cc0
>> [34321.304309] R10: deadbeefdeadf00d R11: ffffea000026a600 R12:=20
>> 0000000000000000
>> [34321.304310] R13: ffff888012f6b000 R14: 0000000012f6b000 R15:=20
>> 0000000000000001
>> [34321.304320] FS:=C2=A0 00007f5071177800(0000) GS:ffff88807d400000(0000=
)=20
>> knlGS:0000000000000000
>> [34321.304322] CS:=C2=A0 10000e030 DS: 0000 ES: 0000 CR0: 00000000800500=
33
>> [34321.304323] CR2: 00007f506f542000 CR3: 00000000160cc000 CR4:=20
>> 0000000000000660
>> [34321.304326] Call Trace:
>> [34321.304331]=C2=A0 xen_alloc_pte+0x294/0x320
>> [34321.304334]=C2=A0 move_pgt_entry+0x165/0x4b0
>> [34321.304339]=C2=A0 move_page_tables+0x6fa/0x8d0
>> [34321.304342]=C2=A0 move_vma.isra.44+0x138/0x500
>> [34321.304345]=C2=A0 __x64_sys_mremap+0x296/0x410
>> [34321.304348]=C2=A0 do_syscall_64+0x3a/0x80
>> [34321.304352]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xae
>> [34321.304355] RIP: 0033:0x7f507196301a
>=20
> I can see why this failure is occurring, but I'm not sure which way is
> the best to fix it.
>=20
> The problem is that a pinned page table is moved: the pmd entry
> referencing it is cleared and a new reference is put into the pmd.
> This is done by getting the old pmd entry, clearing that entry, and then
> using pmd_populate() to write the new pmd entry. pmd_populate() will
> lead to a call of xen_pte_alloc() trying to pin the referenced page
> table, which is failing, as it is already pinned.
>=20
> The problem has been introduced by commit 0881ace292b662d2 in kernel
> 5.14.
>=20
> Following solutions would be possible:
>=20
> 1. When running as PV guest skip the optimization of move_pgt_entry()
>     by letting arch_supports_page_table_move() return false. This will
>     result in a performance drop in some cases.
>=20
> 2. Unpin the page table before calling pmd_populate(). This adds some
>     unneeded hypercall and without flushing the TLB I'm feeling uneasy
>     to do that.

I agree as far as the "unneeded hypercall" aspect goes, but I don't
see any connection to the TLB (or a need to flush it): Pinning has
nothing to do with insertion into a live page table; a pinned page
table can be entirely free floating. It's the removal from a
(possibly) live page table which would require a flush.

> 3. Add a check in xen_pte_alloc() if the page table is pinned already
>     and if this is the case, don't do the pinning. This is a rather clean
>     solution, but will result in other failures if a page table is used
>     multiple times (this case would be caught today as in the failure
>     above).
>=20
> My tendency is towards solution 3 as it is local to Xen code and has the
> best performance.

I agree 3 looks most promising. I can't judge how big of a risk
there is for a page table to get used in more than one place, and
hence how important it is to be able to detect that case.

Jan


