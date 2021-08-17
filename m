Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6DC3EEBE0
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 13:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167777.306307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFxYP-0002Cb-0k; Tue, 17 Aug 2021 11:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167777.306307; Tue, 17 Aug 2021 11:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFxYO-0002A1-SZ; Tue, 17 Aug 2021 11:46:48 +0000
Received: by outflank-mailman (input) for mailman id 167777;
 Tue, 17 Aug 2021 11:46:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFxYN-00029H-7g
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 11:46:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 657d8e97-bbdf-43a8-ae62-1d576aaa652c;
 Tue, 17 Aug 2021 11:46:46 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-adHl868rNz-wOC6mC2iodA-2; Tue, 17 Aug 2021 13:46:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5904.eurprd04.prod.outlook.com (2603:10a6:803:e6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Tue, 17 Aug
 2021 11:46:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 11:46:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.9 via Frontend Transport; Tue, 17 Aug 2021 11:46:42 +0000
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
X-Inumbo-ID: 657d8e97-bbdf-43a8-ae62-1d576aaa652c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629200805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nislrUMvR1FUU66NVmTRaOfLD2ysNHa91LE6egAQZ2s=;
	b=Cundnl+DnRt/UbF0uSyd553AZvW8UXuc37bqmFWpKPo17OOHjHfHewiVBWhhFPwRSs/UPU
	3rbpdsqgx8+dClC8ehG00lq+SxnzyS1Zkv3ycM3Om7TelUfWG3yN1yry2NeaG4Mi1e/0O4
	L3Jmmn7cm4jLXwWvR8Mqg4SoeyDradY=
X-MC-Unique: adHl868rNz-wOC6mC2iodA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfsPS7IfBwRWzmcRF+/khoEBSiewx6hKEfkhfxb9ZDJRLyBdJ/n7LG+IRrEn2SDGgagErhSa02Oa/+//n3jacG4qcAtsU3uk+Mt4KA67HQ1pMX5AJto05fndMFwoopeJt9O6APuNplmiqiYi5aRz3M6jJw0oPmNQwEvw/uH0S3uvrQCd2/4rPL1md6vu6uD/4YfBRZXfJ9e8F27Kik443yWGOySIgJ4NTitXc9FrtFMct200mjTdVo7ciWAl6IBF8nOd4OQXt6QbdqlLEdOY1btltHE8iDPwcNFhRRXlRFaRQoPwMxXkRUmB0fKOOKm+S8cOmbbJSP24P1/SH5cocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+pxUy5NSZ2UENkdCEJ8Jr68HilbO6ZIu6YVZV0r71w=;
 b=RLSgIn5D/qwC4bFHMmkVVz5cAjQmBu+ZUh2ys/0psUKcR8FEByvUszae4FxFdMME+O5PZyq1GZsqedTffZg1+l/QGcoVMx9qP90IXzZc0fJ02UvdZvEDgS1tqouPcQBgy+In5j04AODz7cGKGjlBUb2hvMXWqZAhx/cMGz68q8aRiRPRQtK9Vi9pEWwfhqGdz8sz2Nj191DHSqoDUTT2y3aGulYgoMtvUrp8hDMs625qNqIm7dsWpFRUNrJja/C+0/De0OqX9AVBkW7+LKMBxZ4qnqCAkvYE6N6oVtX+ehpKygf8JfAwLNrfJ2Q0l7idpWjtDh2D6Yspy4kPEHmuNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/PV: assert page state in mark_pv_pt_pages_rdonly()
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cbe46564-74ab-af38-7e31-2f0a3f46ab41@suse.com>
 <d72d072f-d785-f90b-4e91-5ef7e8f17862@citrix.com>
 <14de6486-a1be-156e-f2e8-e82dd35d231c@suse.com>
 <876bd7e8-d472-0f81-63b8-b57169cd87a9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3c3b8d0-9628-1c8f-ba6b-c3acd0a5132c@suse.com>
Date: Tue, 17 Aug 2021 13:46:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <876bd7e8-d472-0f81-63b8-b57169cd87a9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f723ebdc-cc2f-42fe-4cef-08d96174aef2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5904:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590466F32C1B01167672575BB3FE9@VI1PR04MB5904.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iU8BgNtbZXVDRcF8s475/B1OR0vy4x3sBezufh2X6Ezk3KL7ZmT+bn5CroB1YETSymIMRbS9xwMA7pvLKYO9k/2VN66G3SSdcxZ2KhZ4to2c3DpVa6ffNsLtXhzoZRaYeG7V4jaVcDVGzWgE/YOlOQaV96Kz8rnm7xZkPZyYQwCDSM66PvbXYiZvNMTDwKBOJ2fMjmrx/aGKlL1oe/y4Zug08+Sy5PziWvZeczTz570ichJclnsHiBsEf3t2vR0lwuwS5uF/3S/bEj24ki2iyDXBzAmZikbuegAezwBqbMYxmNonSBvuhmGVGueaj/HKOuoUq4jh1G89+UfS0cLhuY17yXLp9EmpTvZ3oAQq859IfwwiVjb8eQMpTniX3erk9xwxE7c8jWTScpuA4gWAfdSZBA+U8cnNY1+7LQcDHQlYkynnx1N4v24o/aelXcn1AQQlJF4ASNLSNvxk6KnqKAqOlbXBM6dsHeHWlzue1DYMBdaVPsgl7ImSfgJ8pzw6bNRoWNxpBx8X/tDInkhtcBTiZbuL8Rek3ZNagdy82NyOIcs/p0nxe6fi3qRlFqGFZCYo9AkG2VKIRvK+Z5k3Cjw/gNseCBIZOGD3pCHQ1W8lf7Cjb+T5RNkauodnR2TaM/v97wUdmS9rSIhDMyRfJxDljXIq48mWiCvn0gnToAsrIDIEkkXsxJGPjKTJRkcraF4/Vail3pZFRlSuAHR+UzeIFHw74vFuLjmz7chUM48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39860400002)(136003)(396003)(346002)(36756003)(66946007)(478600001)(8676002)(8936002)(2906002)(53546011)(38100700002)(2616005)(956004)(83380400001)(31686004)(86362001)(186003)(4326008)(54906003)(16576012)(316002)(6486002)(66476007)(66556008)(5660300002)(26005)(6916009)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A7PjeccK9FqopZKFzZ60FwZ8UQiW1P/17Iob00N1lyS1+TTIlKgRXWxd4VC0?=
 =?us-ascii?Q?0Xn54tqSCX4Zq6WqdtO8NCOp7i+xlOHRLHmVt30jeyfOCCbIeSCS1noucC8+?=
 =?us-ascii?Q?7PD8qAq2PChzQluSNKlEZlFKwUrCKO1YM4nM44/NaeyQ9Y/qRZFvOs5KD9eP?=
 =?us-ascii?Q?+OdQc3+AZI8k1ORI0390XYPEu4GTCKjBLinHpmOdKXGm64MI+m7Ot8RS4t+g?=
 =?us-ascii?Q?BQUvB3IYqTWbVwHFi+zTdZhv61fw4OScV7yBbwRGS2VqV2KHW4KrnBhK615S?=
 =?us-ascii?Q?i2CQAyyukLY6855Wziu4pOQRxr5lJFSoAszZjMhHBvbx9Wc8oS5pws3t+Isi?=
 =?us-ascii?Q?akJlCgYd21nem2s/aESUglBstqk2Itz9lO7FiBJU45A6JO7Gc2SUkxS3Bxuj?=
 =?us-ascii?Q?Di+BaMXvsyHfoLq8HnpR72AEG6NvDMuOZsU+1ljUlVPMk2qJg0Muy/KJ8eEl?=
 =?us-ascii?Q?sBsu6R91T/sLaHr/GTt5Jc+ajrB92Bi4lQRaJ3hPd4arn3ou032MY7nZbkd5?=
 =?us-ascii?Q?0gg2WZKitwRCBXuTIdwM9VoY3582M9yh6F+bNdCRUaxHedxQDYMCpUQiiDjM?=
 =?us-ascii?Q?Qm3xCij/tqMeFHU1wz4O8AepagQH5qud1ULiIpAbFXC8rhvs3/ROrx0nX5fm?=
 =?us-ascii?Q?X1JFVVSK7sQ4DWlTVen/R+lDyw3tqm0sv+rIJPSbQ6fgJUm8gwSGvilACVVx?=
 =?us-ascii?Q?SZWVpuUj/CQO7Q1LTKQ1e/rIRX3VWNSTdJk3liBzyNg8RKfusQa6yrwQeMs3?=
 =?us-ascii?Q?8sIq4aGLHTw+iG/cGLhBxRBmPneKoSdB+qUv9PVSDyP243zeZM89ZWRbbq7L?=
 =?us-ascii?Q?humn2g6a8O2h0R1dHQAomOoxupRcbVqEgT0zeCPEOYbRi+FO2Pzifpn0pKRa?=
 =?us-ascii?Q?QCpPjdpviXE8dmQ+W4IiMTDXebbR2z1+g0igvVKa95GTXbU84wZQaYpuWeK+?=
 =?us-ascii?Q?hQhXJ6PB9S4Bh2sqbPIK8OOWrfCan16IWN2lnP5g4jDtaq9g4XQGKPYRCKOr?=
 =?us-ascii?Q?A3yzzhFFxH5tFI6YgtwRTYAtOQPNaOPUNCtNEXBpudAEbFjv8ItvHza4GTxp?=
 =?us-ascii?Q?t+MG2TWlNYYahojovBvllrfEIuRYx1mXjd0ynN7pCT2gzA9BQYmLNwsquYJM?=
 =?us-ascii?Q?CHNn9s/NguLnUBmPJkLuHq0D8aDegGuHNQUoqjORUH1Th8ASbRuS+MHY8pV5?=
 =?us-ascii?Q?c/sCX/80f8R3bufuIwrD6iVF6Grmi+dqFL4S+JPCqUIw3itKWubhu71+mwzi?=
 =?us-ascii?Q?d3XFzSo/ExCZXWUauW8hGQ2xf8Qk8xtRjIga8GAyHND34pfYyD+093CDcfTZ?=
 =?us-ascii?Q?rwaLvY0FpM464pc3pRajMOfk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f723ebdc-cc2f-42fe-4cef-08d96174aef2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 11:46:43.1989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8zk5d9X3xx3DBUXgpt1xcrES8NybQi06yxYkxy7hYHkmw+BOcXO9OxBWYg6I6PwID+mQKc4Nmopp54la1U8Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5904

On 17.08.2021 12:30, Andrew Cooper wrote:
> On 17/08/2021 09:54, Jan Beulich wrote:
>> On 16.08.2021 21:25, Andrew Cooper wrote:
>>> On 16/08/2021 16:29, Jan Beulich wrote:
>>>> and an apparently wrong comment stating
>>>> that not only v_end but also v_start would be superpage aligned
>>> Which comment?=C2=A0 The only one I see about 4M has nothing to do with
>>> superpages.
>> The one immediately ahead of the related variable declarations:
>>
>>     /*
>>      * This fully describes the memory layout of the initial domain. All
>>      * *_start address are page-aligned, except v_start (and v_end) whic=
h are
>>      * superpage-aligned.
>>      */
>>
>> I see nothing forcing v_start to be superpage-aligned, while I
>> do suspect that the "calculation" of the number of page tables
>> will be wrong when it isn't.
>=20
> This is an XTF test booting as dom0
>=20
> (d2) (XEN) *** Building a PV Dom0 ***
> (d2) (XEN) ELF: phdr: paddr=3D0x100000 memsz=3D0x12000
> (d2) (XEN) ELF: memory: 0x100000 -> 0x112000
> (d2) (XEN) ELF: note: GUEST_OS =3D "XTF"
> (d2) (XEN) ELF: note: GUEST_VERSION =3D "0"
> (d2) (XEN) ELF: note: LOADER =3D "generic"
> (d2) (XEN) ELF: note: HYPERCALL_PAGE =3D 0x106000
> (d2) (XEN) ELF: note: XEN_VERSION =3D "xen-3.0"
> (d2) (XEN) ELF: note: FEATURES =3D "!writable_page_tables|pae_pgdir_above=
_4gb"
> (d2) (XEN) ELF: note: PAE_MODE =3D "yes"
> (d2) (XEN) ELF: using notes from SHT_NOTE section
> (d2) (XEN) ELF: VIRT_BASE unset, using 0
> (d2) (XEN) ELF_PADDR_OFFSET unset, using 0
> (d2) (XEN) ELF: addresses:
> (d2) (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 virt_base=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D 0x0
> (d2) (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 elf_paddr_offset =3D 0x0
> (d2) (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 virt_offset=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D 0x0
> (d2) (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 virt_kstart=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D 0x100000
> (d2) (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 virt_kend=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D 0x112000
> (d2) (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 virt_entry=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D 0x100000
> (d2) (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 p2m_base=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D 0xffffffffffffffff
> (d2) (XEN)=C2=A0 Xen=C2=A0 kernel: 64-bit, lsb, compat32
> (d2) (XEN)=C2=A0 Dom0 kernel: 64-bit, PAE, lsb, paddr 0x100000 -> 0x11200=
0
> (d2) (XEN) PHYSICAL MEMORY ARRANGEMENT:
> (d2) (XEN)=C2=A0 Dom0 alloc.:=C2=A0=C2=A0 000000003e800000->000000003ec00=
000 (240731
> pages to be allocated)
> (d2) (XEN) VIRTUAL MEMORY ARRANGEMENT:
> (d2) (XEN)=C2=A0 Loaded kernel: 0000000000100000->0000000000112000
> (d2) (XEN)=C2=A0 Init. ramdisk: 0000000000112000->0000000000112000
> (d2) (XEN)=C2=A0 Phys-Mach map: 0000000000112000->00000000002ea2d8
> (d2) (XEN)=C2=A0 Start info:=C2=A0=C2=A0=C2=A0 00000000002eb000->00000000=
002eb4b8
> (d2) (XEN)=C2=A0 Xenstore ring: 0000000000000000->0000000000000000
> (d2) (XEN)=C2=A0 Console ring:=C2=A0 0000000000000000->0000000000000000
> (d2) (XEN)=C2=A0 Page tables:=C2=A0=C2=A0 00000000002ec000->00000000002f1=
000
> (d2) (XEN)=C2=A0 Boot stack:=C2=A0=C2=A0=C2=A0 00000000002f1000->00000000=
002f2000
> (d2) (XEN)=C2=A0 TOTAL:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
000000000000000->0000000000400000
> (d2) (XEN)=C2=A0 ENTRY ADDRESS: 0000000000100000
>=20
> It would appear that v_start comes directly and unmodified from the
> VIRT_BASE ELF note.
>=20
> Other observations:=C2=A0 The ramdisk start/end aren't zero despite one b=
eing
> absent, and the M2P and start info ends aren't aligned.

I've already dealt with this ramdisk aspect in the v2 patch altering
the printing. For *_end there's nothing wrong to be misaligned (as
per the comment in question) - only v_end has a statement.

Jan


