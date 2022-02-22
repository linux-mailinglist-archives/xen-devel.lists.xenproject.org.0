Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFCB4BFC98
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:30:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276914.473285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX7B-0004jJ-KR; Tue, 22 Feb 2022 15:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276914.473285; Tue, 22 Feb 2022 15:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX7B-0004h0-Fd; Tue, 22 Feb 2022 15:30:09 +0000
Received: by outflank-mailman (input) for mailman id 276914;
 Tue, 22 Feb 2022 15:30:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMX7A-0004gG-6q
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:30:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f71da97-93f4-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 16:30:05 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-LdaQXLoiOVWhOHH88-alOw-1; Tue, 22 Feb 2022 16:30:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR04MB3237.eurprd04.prod.outlook.com (2603:10a6:6:c::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.27; Tue, 22 Feb 2022 15:30:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 15:30:00 +0000
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
X-Inumbo-ID: 4f71da97-93f4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645543805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9vcLcvHzkFV74O9UMXo3EGKnBtcR8W1+5sVbvWIVopk=;
	b=dZwt/CwUTFTESoAxKbm49EkGIHnz6qnIpONQ/cQ8kRAyDgN/jm1pzwiGstM6vcdV2y9lue
	ufF7E77iAaTHaw0P1nYAnoXNnVMHiOsXQ0bPc9xoHXINqgcJR+r3vSZS7l3B3SlPAUwSFF
	UdMVC7x1VWsVVHAariKL0OsovV7ws3U=
X-MC-Unique: LdaQXLoiOVWhOHH88-alOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1d+KMh6HPcgwBuvwo+vAkckNmadagSbryStDmTISZ26MNqjfuyx6rFOtAeXIntcbjVsjc2bhSzCs7Q2JMVEXqNe+2VsdLQT3gE+Wv1/j6JA9zoDptflzj4gtDgGd3FhUT4eA3n07xuOINoXAuFR26boCxg//cne5xK9zqz1LDhBwWLoy+AC0HJfRLNFX/rE/wPZJuqWOOaShZqhgsRrVqkGZunThzr0wIui/mYi/kf9WtWDv7x8/gmwdRi+gTOKySTrhOTJkfwaeyUZ8J7lPCrXG2amGZIQuUOjncjmAbq+BA+jNRLYqyBKjKP1BhL9ZvGsEzhJOPzQ5s8e0y5oAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iS40/mvBXdWx80/i6q6CRvVbya1cY82Toy/CaYHieVs=;
 b=L8THG2k1OBRTSjuuiqIiPfnHJrymVTuU6ZpfqtVGUSWiNhjTEImiT6qxrutvjTJ6QABMOA8P9g/4AG0j87Vwei4SbnBaDfFvhqMIBlJ7MI9Js3VBj4OtJUbVdfX9eUVH0bx8ulsBjONO4BwnG6ddMPkhS4XKvkxs5Exmufd++0Q+7kTtlBX3oYV14QnuXwuGVzAnJtsKvernZuXy6hAhb1pncohBoV132Z6PkJbSwy41a8Yzav2cPnE0SN3qmUJaNa+EOik9M6p0lvhMEGyEoeGib9mImSplP+CzVwHdcQ7O/CQ1WFU63mllzcbIaAEvrJLzzzNvrOSLGl+J6Ul2BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1106b26-ffa8-2b8e-5063-c2e1059b46fe@suse.com>
Date: Tue, 22 Feb 2022 16:29:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 00/70 (not all posted)] x86: Support for CET Indirect
 Branch Tracking
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75793c93-63ad-4c5a-6283-08d9f6183088
X-MS-TrafficTypeDiagnostic: DB6PR04MB3237:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB3237C4BC42DEB12932D575F2B33B9@DB6PR04MB3237.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xOmcyrj3wbaUgV5tEY3E84c/B07DI6C4n4pItQ0LxGVFvYC6VQ6jVtcDpZ4AoZHuzKSaDYhDS6SVbieXUKKailtRuOrJs75NE45GgDeUv3Qs21hMrIjd2UBX0LjLv+vmwTMIn/+Fo++KBMJHwjk7LZ6jmooKvMwFvhikQor+tdYyR9/3lwIHIzC+HBVEY8RGhSVTG9EKll+9zleAV1VIOYlSo8sxZhXPjOx2YFz77Lka0/UKyWQZW3Yndakh0RIMrrbipG3eh0ndN3E+jae6gI8IwuZ5TU4eZFyVpwYMQmhirmabC8CX2Qd27NiYxfUJK8bbKfX+l4987Jgn4Cwao9Rch+oX4320C8DaN2oZXnngo6UGFW1nztkeYIQTS7Fz7Azzwwa/Cq9f0OCArTT60mDM6PELYhIGrc9J/Flam5Omq5reoQxhOLwosNyRe+s1fxWkGwelZdcOf0CJvPSrsOAf+xLrmuBFC3CX67dyWeB8R2JxV1oPwx+AZvG1jOLkpywMnj1JyjaitQxBTt8U4C9bSiKko998zv+73gb8INMZgDsXBnSgqN9q61Zak6tyObgd8DSUSPwgT5BZLgBV6nGhzzkoRSA3Od3GfUUKd2NKBrzX0F9sM39LDwosA8k7Z5+ghpRPCCDOgbiMxW+BvumEa4RbFmXygdnXIM7Kj0YbRrSVpCKPwg7I0/uWl35wHVb/HWjnnaYCAWwNUga7pS411d2ue+8GoFY8dOq1SRLJWI5wMt59wDT1ozHleWjgjoZVW6ihv8z8esvae3dqOkj3J9jg4BBC6eWxX366K6RT8avlVMyrLVBCOU4PASP5k79JpDY8aThHwqaBXqGEHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6512007)(66574015)(508600001)(966005)(6486002)(31696002)(54906003)(2906002)(6916009)(30864003)(316002)(5660300002)(2616005)(83380400001)(86362001)(8676002)(31686004)(53546011)(38100700002)(6506007)(186003)(26005)(4326008)(66476007)(36756003)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NwHDJKpyjzFbiH4L+Yl1G1mhVXAuX5uuQIvFvYBdXsrb+7NgWklimQjrGR7K?=
 =?us-ascii?Q?LQ8vCG+V7Bx7/CAdFKK77TvsF433S95xOBziavxRXGcKEkYSBfHPEr9nM/2L?=
 =?us-ascii?Q?uKSktNj5u1cdojvSIPQEtiZVzFtvcXaj7iPZFzBQHfd9NFaA4QBKT+w3jC4+?=
 =?us-ascii?Q?Ztm2rBu4KEsmNpD7Al0lUjzl+KsulzWxYdfl3T26OdvF4nAh3qOIv86B1LUf?=
 =?us-ascii?Q?gW5o3by0BBP0ijYgPxGQB2XHvP9utpzNKwC39Af05Zj+/cgrv80V1DbsTvG4?=
 =?us-ascii?Q?mAM3JpHSk9Gl9pMjkMQ+AydxZgCeeI4/oCbQGxyBd+mMl35yjSxgh+KOHoy3?=
 =?us-ascii?Q?mUqhwAm1lLGM+f+QK3OQYRLNyK/6kp6Rah+stzUXcfICWAwIrIy3xMdFkkas?=
 =?us-ascii?Q?P7xmEDY7R0G/mFCDA9T0WFxOKtF7NTVmZHZ3qvFDpHwP7gR62dqZQ+DcUZpX?=
 =?us-ascii?Q?q1lgZMQe5DN6lL0XQ2tIdkXkhy/tP7j92qlbXJeT+gTwlTATEqAqh4EJDBxm?=
 =?us-ascii?Q?FQ4L6ZEoB605pO/mSdKcvkN0vQLsqvtLmDrNBW3xkeMfV7EAiq/x6VitwKrv?=
 =?us-ascii?Q?7XzdxqdEen8aAPjviDBpks5mDvtvMoHER3H/RKN3EPRDm6btUxmnEr9FbnvP?=
 =?us-ascii?Q?J6/qwsIHSU6QwssibQS6SDfXP5+FudVyET7jvwD2AlpsZ78+Vhv1avyb6Sl6?=
 =?us-ascii?Q?JFS9qGD7f20elXRWhp97qNU2cRIYxNlCk79Oo0b8tr4rU/G6V4pwOW3QLrSy?=
 =?us-ascii?Q?t7D31FbYp9sUX6c3nus5Jml2I4OCOqqVSrVk0/6AwmaRx0DXpEVcoBPbWqMo?=
 =?us-ascii?Q?tobgxwGfaVSPIF+i+5GXH1eSVk7qbTrmdVy+qtHRTIBm4FOgOmSD4BNQBGpc?=
 =?us-ascii?Q?C+kV/ShLlnybRfKmmqMN69VuVyCZAIMQDI6PeJZlmROqW7QDDpdbi5CdkJ6h?=
 =?us-ascii?Q?H+/onx0ugmMH3QGApT5HjfYubSpuSek74LvCTTEVrHTF0W5GfhAOHcNtWj/n?=
 =?us-ascii?Q?ANwRX0KhzyPfJ8VYgErgalvtMcu1+DkghGzCfpq9GQetvZj2sFUoD3SAnp/a?=
 =?us-ascii?Q?WEoUapzMtr2IT74L6B7ver+HzweHyxAlw88m+Kk8+Uy+jHLgx69RPlSSDErt?=
 =?us-ascii?Q?j9aQIl5SlebCJwd79MLVgv8jJfrO9ZpE754rUjVgXi960oLJ9Y4ZF+35Tt7y?=
 =?us-ascii?Q?WDIWtBKRbxxrDqUV5/DGGNfYJbMcRA3n8p4SVolimLCGr8mATroVAn1moVNe?=
 =?us-ascii?Q?Bqj5k8S2ZqKz8fHlJzFu1sSur0CyXuJAD5zEVboLglY0AkXUssCYzPZNkCwo?=
 =?us-ascii?Q?wzS72RRkjfgt2/6GPlPmMssdPFBIT+sa+J/s2fLT5cVJc2s0ajUXFTRMz01n?=
 =?us-ascii?Q?dVBOJbPOg8jE/5+n6FbIlrM9sBBHs2wcoLERGjHUKstd/Qs0ypipURpf1UkZ?=
 =?us-ascii?Q?oIyEsZ5xmSR4FUuRxrSagy2VIp0GzbJuuheiDV2/L9n8GodNm2NigsRJ6Efq?=
 =?us-ascii?Q?bqbM5Nfc9pYotzIX3xhNZvyrw0qr+ohW4cGXYOTvFfo4OkXFOidiT++Tr0Cb?=
 =?us-ascii?Q?LnWsB0g+LHoL2vqv5AMb4KdJC2Jm0JulkhhyxdTtTqx/tnPY92v+qKal2uaq?=
 =?us-ascii?Q?UJx7WeC+CV2ZZHElaIfhc5Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75793c93-63ad-4c5a-6283-08d9f6183088
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 15:30:00.4934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkIWUqpHEUW6UqyYWOPeHHTU9w7+u9ZENnMpSaLBVHtLPnHXFjnNVsrhEg4Ryy0sM/OIulwglkbJEDpJ+Di+Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3237

On 22.02.2022 16:26, Andrew Cooper wrote:
> To avoid spamming everyone, I have only re-sent patches with changes in v=
3.

Could you enumerate which ones these are? Otherwise it's hard to tell
whether everything you did send did arrive in the recipients' mailboxes.

Thanks, Jan

> CET Indirect Branch Tracking is a hardware feature designed to protect ag=
ainst
> forward-edge control flow hijacking (Call/Jump oriented programming), and=
 is a
> companion feature to CET Shadow Stacks added in Xen 4.14.
>=20
> Patches 1 thru 5 are prerequisites.  Patches 6 thru 59 are fairly mechani=
cal
> annotations of function pointer targets.  Patches 60 thru 70 are the fina=
l
> enablement of CET-IBT.
>=20
> This series functions correctly with GCC 9 and later, although an experim=
ental
> GCC patch is required to get more helpful typechecking at build time.  A
> container with this fix has been added to CI.
>=20
> Tested on a TigerLake NUC by me, and by Marek also.
>=20
> CI pipelines:
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/476819536
>   https://cirrus-ci.com/build/4634902334275584
>=20
> Andrew Cooper (67):
>   xen/sort: Switch to an extern inline implementation
>   xen/xsm: Move {do,compat}_flask_op() declarations into a header
>   x86/kexec: Annotate embedded data with ELF metadata
>   x86: Introduce support for CET-IBT
>   xen: CFI hardening for x86 hypercalls
>   xen: CFI hardening for custom_param()
>   xen: CFI hardening for __initcall()
>   xen: CFI hardening for notifier callbacks
>   xen: CFI hardening for acpi_table_parse()
>   xen: CFI hardening for continue_hypercall_on_cpu()
>   xen: CFI hardening for init_timer()
>   xen: CFI hardening for call_rcu()
>   xen: CFI hardening for IPIs
>   xen: CFI hardening for open_softirq()
>   xsm/flask/ss: CFI hardening
>   xsm: CFI hardening
>   xen/sched: CFI hardening
>   xen/evtchn: CFI hardening
>   xen/hypfs: CFI hardening
>   xen/tasklet: CFI hardening
>   xen/keyhandler: CFI hardening
>   xen/vpci: CFI hardening
>   xen/decompress: CFI hardening
>   xen/iommu: CFI hardening
>   xen/video: CFI hardening
>   xen/console: CFI hardening
>   xen/misc: CFI hardening
>   x86: CFI hardening for request_irq()
>   x86/hvm: CFI hardening for hvm_funcs
>   x86/hvm: CFI hardening for device emulation
>   x86/emul: CFI hardening
>   x86/ucode: CFI hardening
>   x86/power: CFI hardening
>   x86/apic: CFI hardening
>   x86/nmi: CFI hardening
>   x86/mtrr: CFI hardening
>   x86/idle: CFI hardening
>   x86/quirks: CFI hardening
>   x86/hvmsave: CFI hardening
>   x86/mce: CFI hardening
>   x86/pmu: CFI hardening
>   x86/cpu: CFI hardening
>   x86/guest: CFI hardening
>   x86/logdirty: CFI hardening
>   x86/shadow: CFI hardening
>   x86/hap: CFI hardening
>   x86/p2m: CFI hardening
>   x86/irq: CFI hardening
>   x86/apei: CFI hardening
>   x86/psr: CFI hardening
>   x86/dpci: CFI hardening
>   x86/pt: CFI hardening
>   x86/time: CFI hardening
>   x86/misc: CFI hardening
>   x86/stack: CFI hardening
>   x86/bugframe: CFI hardening
>   x86: Use control flow typechecking where possible
>   x86/setup: Read CR4 earlier in __start_xen()
>   x86/alternatives: Clear CR4.CET when clearing CR0.WP
>   x86/traps: Rework write_stub_trampoline() to not hardcode the jmp
>   x86: Introduce helpers/checks for endbr64 instructions
>   x86/emul: Update emulation stubs to be CET-IBT compatible
>   x86/entry: Make syscall/sysenter entrypoints CET-IBT compatible
>   x86/entry: Make IDT entrypoints CET-IBT compatible
>   x86/setup: Rework MSR_S_CET handling for CET-IBT
>   x86/efi: Disable CET-IBT around Runtime Services calls
>   x86: Enable CET Indirect Branch Tracking
>=20
> Juergen Gross (2):
>   x86/pv-shim: Don't modify the hypercall table
>   x86: Don't use the hypercall table for calling compat hypercalls
>=20
> Marek Marczykowski-G=C3=B3recki (1):
>   x86: Build check for embedded endbr64 instructions
>=20
>  Config.mk                                         |   1 -
>  README                                            |   1 +
>  automation/build/debian/buster-gcc-ibt.dockerfile |  66 ++++
>  automation/gitlab-ci/build.yaml                   |   6 +
>  automation/scripts/containerize                   |   1 +
>  docs/misc/xen-command-line.pandoc                 |  16 +-
>  tools/firmware/Makefile                           |   2 +
>  tools/libs/guest/xg_dom_decompress_unsafe.h       |   2 +
>  tools/tests/x86_emulator/x86-emulate.h            |   2 +
>  xen/arch/arm/bootfdt.c                            |   9 +-
>  xen/arch/arm/io.c                                 |   9 +-
>  xen/arch/x86/Kconfig                              |  17 +
>  xen/arch/x86/Makefile                             |   6 +
>  xen/arch/x86/acpi/boot.c                          |  24 +-
>  xen/arch/x86/acpi/cpu_idle.c                      |  43 ++-
>  xen/arch/x86/acpi/cpufreq/cpufreq.c               |  24 +-
>  xen/arch/x86/acpi/cpufreq/powernow.c              |  21 +-
>  xen/arch/x86/acpi/cpuidle_menu.c                  |   6 +-
>  xen/arch/x86/acpi/lib.c                           |   2 +-
>  xen/arch/x86/acpi/power.c                         |   4 +-
>  xen/arch/x86/acpi/wakeup_prot.S                   |  38 +-
>  xen/arch/x86/alternative.c                        |  13 +-
>  xen/arch/x86/apic.c                               |  12 +-
>  xen/arch/x86/arch.mk                              |   7 +
>  xen/arch/x86/boot/x86_64.S                        |  30 +-
>  xen/arch/x86/compat.c                             |  21 +-
>  xen/arch/x86/configs/pvshim_defconfig             |   1 +
>  xen/arch/x86/cpu/amd.c                            |   8 +-
>  xen/arch/x86/cpu/centaur.c                        |   2 +-
>  xen/arch/x86/cpu/common.c                         |   3 +-
>  xen/arch/x86/cpu/cpu.h                            |   2 +-
>  xen/arch/x86/cpu/hygon.c                          |   2 +-
>  xen/arch/x86/cpu/intel.c                          |   6 +-
>  xen/arch/x86/cpu/mcheck/amd_nonfatal.c            |   4 +-
>  xen/arch/x86/cpu/mcheck/mce.c                     |  22 +-
>  xen/arch/x86/cpu/mcheck/mce.h                     |   2 +-
>  xen/arch/x86/cpu/mcheck/mce_amd.c                 |   9 +-
>  xen/arch/x86/cpu/mcheck/mce_amd.h                 |   4 +-
>  xen/arch/x86/cpu/mcheck/mce_intel.c               |  49 ++-
>  xen/arch/x86/cpu/mcheck/non-fatal.c               |   6 +-
>  xen/arch/x86/cpu/mcheck/vmce.c                    |   4 +-
>  xen/arch/x86/cpu/microcode/amd.c                  |   9 +-
>  xen/arch/x86/cpu/microcode/core.c                 |  15 +-
>  xen/arch/x86/cpu/microcode/intel.c                |  10 +-
>  xen/arch/x86/cpu/mtrr/generic.c                   |  20 +-
>  xen/arch/x86/cpu/mtrr/main.c                      |   4 +-
>  xen/arch/x86/cpu/mtrr/mtrr.h                      |   8 +-
>  xen/arch/x86/cpu/mwait-idle.c                     |  12 +-
>  xen/arch/x86/cpu/shanghai.c                       |   2 +-
>  xen/arch/x86/cpu/vpmu.c                           |  13 +-
>  xen/arch/x86/cpu/vpmu_amd.c                       |  16 +-
>  xen/arch/x86/cpu/vpmu_intel.c                     |  16 +-
>  xen/arch/x86/cpuid.c                              |   8 +-
>  xen/arch/x86/crash.c                              |   7 +-
>  xen/arch/x86/dmi_scan.c                           |  10 +-
>  xen/arch/x86/dom0_build.c                         |   8 +-
>  xen/arch/x86/domain.c                             |  16 +-
>  xen/arch/x86/emul-i8254.c                         |  14 +-
>  xen/arch/x86/extable.c                            |  18 +-
>  xen/arch/x86/genapic/bigsmp.c                     |   4 +-
>  xen/arch/x86/genapic/delivery.c                   |  12 +-
>  xen/arch/x86/genapic/probe.c                      |   2 +-
>  xen/arch/x86/genapic/x2apic.c                     |  18 +-
>  xen/arch/x86/guest/hyperv/hyperv.c                |  10 +-
>  xen/arch/x86/guest/xen/xen.c                      |  15 +-
>  xen/arch/x86/hpet.c                               |  29 +-
>  xen/arch/x86/hvm/dm.c                             |   5 +-
>  xen/arch/x86/hvm/dom0_build.c                     |  16 +-
>  xen/arch/x86/hvm/emulate.c                        |  93 +++--
>  xen/arch/x86/hvm/hpet.c                           |  12 +-
>  xen/arch/x86/hvm/hvm.c                            |  47 +--
>  xen/arch/x86/hvm/hypercall.c                      |   5 +-
>  xen/arch/x86/hvm/intercept.c                      |  28 +-
>  xen/arch/x86/hvm/io.c                             |  38 +-
>  xen/arch/x86/hvm/ioreq.c                          |   2 +-
>  xen/arch/x86/hvm/irq.c                            |  16 +-
>  xen/arch/x86/hvm/mtrr.c                           |   8 +-
>  xen/arch/x86/hvm/nestedhvm.c                      |   6 +-
>  xen/arch/x86/hvm/pmtimer.c                        |  10 +-
>  xen/arch/x86/hvm/quirks.c                         |   4 +-
>  xen/arch/x86/hvm/rtc.c                            |  18 +-
>  xen/arch/x86/hvm/stdvga.c                         |  19 +-
>  xen/arch/x86/hvm/svm/nestedsvm.c                  |  22 +-
>  xen/arch/x86/hvm/svm/svm.c                        | 404 +++++++++++-----=
------
>  xen/arch/x86/hvm/svm/vmcb.c                       |   2 +-
>  xen/arch/x86/hvm/vioapic.c                        |  12 +-
>  xen/arch/x86/hvm/viridian/time.c                  |   2 +-
>  xen/arch/x86/hvm/viridian/viridian.c              |  17 +-
>  xen/arch/x86/hvm/vlapic.c                         |  25 +-
>  xen/arch/x86/hvm/vmsi.c                           |  16 +-
>  xen/arch/x86/hvm/vmx/intr.c                       |   2 +-
>  xen/arch/x86/hvm/vmx/vmcs.c                       |  22 +-
>  xen/arch/x86/hvm/vmx/vmx.c                        | 155 +++++----
>  xen/arch/x86/hvm/vmx/vvmx.c                       |  16 +-
>  xen/arch/x86/hvm/vpic.c                           |   8 +-
>  xen/arch/x86/hvm/vpt.c                            |   2 +-
>  xen/arch/x86/i8259.c                              |  10 +-
>  xen/arch/x86/include/asm/asm-defns.h              |   6 +
>  xen/arch/x86/include/asm/bug.h                    |  10 +-
>  xen/arch/x86/include/asm/cpufeature.h             |   1 +
>  xen/arch/x86/include/asm/cpufeatures.h            |   1 +
>  xen/arch/x86/include/asm/cpuidle.h                |   4 +-
>  xen/arch/x86/include/asm/current.h                |   6 +-
>  xen/arch/x86/include/asm/endbr.h                  |  55 +++
>  xen/arch/x86/include/asm/flushtlb.h               |   2 +-
>  xen/arch/x86/include/asm/genapic.h                |  18 +-
>  xen/arch/x86/include/asm/hpet.h                   |   8 +-
>  xen/arch/x86/include/asm/hvm/emulate.h            |   8 +-
>  xen/arch/x86/include/asm/hvm/save.h               |   2 +-
>  xen/arch/x86/include/asm/hvm/svm/nestedsvm.h      |  18 +-
>  xen/arch/x86/include/asm/hvm/svm/svm.h            |   1 -
>  xen/arch/x86/include/asm/hvm/vioapic.h            |   2 +-
>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h           |   8 +-
>  xen/arch/x86/include/asm/hvm/vmx/vmx.h            |   4 +-
>  xen/arch/x86/include/asm/hvm/vmx/vvmx.h           |  18 +-
>  xen/arch/x86/include/asm/hypercall.h              |  81 +++--
>  xen/arch/x86/include/asm/irq.h                    |  24 +-
>  xen/arch/x86/include/asm/machine_kexec.h          |   2 +-
>  xen/arch/x86/include/asm/mm.h                     |  16 +-
>  xen/arch/x86/include/asm/msi.h                    |   8 +-
>  xen/arch/x86/include/asm/msr-index.h              |   1 +
>  xen/arch/x86/include/asm/mtrr.h                   |   2 +-
>  xen/arch/x86/include/asm/p2m.h                    |   4 +-
>  xen/arch/x86/include/asm/paging.h                 |   2 +-
>  xen/arch/x86/include/asm/processor.h              |   4 +-
>  xen/arch/x86/include/asm/pv/domain.h              |   4 +-
>  xen/arch/x86/include/asm/pv/shim.h                |  11 +-
>  xen/arch/x86/include/asm/shadow.h                 |   2 +-
>  xen/arch/x86/include/asm/smp.h                    |   6 +-
>  xen/arch/x86/include/asm/tboot.h                  |   2 +-
>  xen/arch/x86/include/asm/time.h                   |   6 +-
>  xen/arch/x86/io_apic.c                            |  28 +-
>  xen/arch/x86/ioport_emulate.c                     |   4 +-
>  xen/arch/x86/irq.c                                |  28 +-
>  xen/arch/x86/livepatch.c                          |   2 +-
>  xen/arch/x86/machine_kexec.c                      |   2 +-
>  xen/arch/x86/mm.c                                 |  35 +-
>  xen/arch/x86/mm/hap/guest_walk.c                  |   4 +-
>  xen/arch/x86/mm/hap/hap.c                         |  29 +-
>  xen/arch/x86/mm/hap/nested_hap.c                  |   2 +-
>  xen/arch/x86/mm/hap/private.h                     |  30 +-
>  xen/arch/x86/mm/mem_sharing.c                     |   2 +-
>  xen/arch/x86/mm/p2m-ept.c                         |  34 +-
>  xen/arch/x86/mm/p2m-pt.c                          |  19 +-
>  xen/arch/x86/mm/paging.c                          |   3 +-
>  xen/arch/x86/mm/shadow/common.c                   |  33 +-
>  xen/arch/x86/mm/shadow/hvm.c                      |  16 +-
>  xen/arch/x86/mm/shadow/multi.c                    |  80 +++--
>  xen/arch/x86/mm/shadow/multi.h                    |  20 +-
>  xen/arch/x86/mm/shadow/none.c                     |  20 +-
>  xen/arch/x86/mm/shadow/private.h                  |  12 +-
>  xen/arch/x86/mm/shadow/pv.c                       |   4 +-
>  xen/arch/x86/msi.c                                |  18 +-
>  xen/arch/x86/nmi.c                                |  16 +-
>  xen/arch/x86/numa.c                               |  10 +-
>  xen/arch/x86/oprofile/nmi_int.c                   |  16 +-
>  xen/arch/x86/oprofile/op_model_athlon.c           |  18 +-
>  xen/arch/x86/oprofile/op_model_p4.c               |  14 +-
>  xen/arch/x86/oprofile/op_model_ppro.c             |  26 +-
>  xen/arch/x86/percpu.c                             |   6 +-
>  xen/arch/x86/physdev.c                            |   2 +-
>  xen/arch/x86/platform_hypercall.c                 |  11 +-
>  xen/arch/x86/psr.c                                |  41 +--
>  xen/arch/x86/pv/callback.c                        |  25 +-
>  xen/arch/x86/pv/descriptor-tables.c               |  14 +-
>  xen/arch/x86/pv/domain.c                          |  12 +-
>  xen/arch/x86/pv/emul-gate-op.c                    |   9 +-
>  xen/arch/x86/pv/emul-priv-op.c                    |  71 ++--
>  xen/arch/x86/pv/emulate.h                         |   7 -
>  xen/arch/x86/pv/hypercall.c                       |  11 +-
>  xen/arch/x86/pv/iret.c                            |   4 +-
>  xen/arch/x86/pv/misc-hypercalls.c                 |  10 +-
>  xen/arch/x86/pv/ro-page-fault.c                   |  31 +-
>  xen/arch/x86/pv/shim.c                            |  60 ++--
>  xen/arch/x86/pv/traps.c                           |   2 +-
>  xen/arch/x86/setup.c                              |  80 ++++-
>  xen/arch/x86/shutdown.c                           |  10 +-
>  xen/arch/x86/smp.c                                |  20 +-
>  xen/arch/x86/smpboot.c                            |   2 +-
>  xen/arch/x86/spec_ctrl.c                          |   6 +-
>  xen/arch/x86/srat.c                               |   4 +-
>  xen/arch/x86/sysctl.c                             |   4 +-
>  xen/arch/x86/tboot.c                              |   2 +-
>  xen/arch/x86/time.c                               |  68 ++--
>  xen/arch/x86/traps.c                              |   8 +-
>  xen/arch/x86/tsx.c                                |   2 +-
>  xen/arch/x86/x86_64/acpi_mmcfg.c                  |   2 +-
>  xen/arch/x86/x86_64/compat.c                      |   1 -
>  xen/arch/x86/x86_64/compat/entry.S                |   1 +
>  xen/arch/x86/x86_64/compat/mm.c                   |   7 +-
>  xen/arch/x86/x86_64/entry.S                       |  49 ++-
>  xen/arch/x86/x86_64/kexec_reloc.S                 |  23 +-
>  xen/arch/x86/x86_64/mmconfig-shared.c             |  10 +-
>  xen/arch/x86/x86_64/mmconfig.h                    |   2 +-
>  xen/arch/x86/x86_64/platform_hypercall.c          |   2 +-
>  xen/arch/x86/x86_64/traps.c                       |  42 ++-
>  xen/arch/x86/x86_emulate.c                        |  34 +-
>  xen/arch/x86/x86_emulate/x86_emulate.c            |  10 +-
>  xen/arch/x86/x86_emulate/x86_emulate.h            |  33 +-
>  xen/arch/x86/xen.lds.S                            |   3 +-
>  xen/common/argo.c                                 |   6 +-
>  xen/common/bunzip2.c                              |   2 +-
>  xen/common/compat/domain.c                        |   3 +-
>  xen/common/compat/grant_table.c                   |   5 +-
>  xen/common/compat/kernel.c                        |   2 +-
>  xen/common/compat/memory.c                        |   7 +-
>  xen/common/compat/multicall.c                     |   3 +-
>  xen/common/core_parking.c                         |  10 +-
>  xen/common/coverage/gcov.c                        |   8 +-
>  xen/common/cpu.c                                  |   4 +-
>  xen/common/debugtrace.c                           |  10 +-
>  xen/common/decompress.c                           |   2 +-
>  xen/common/dm.c                                   |   6 +-
>  xen/common/domain.c                               |  15 +-
>  xen/common/domctl.c                               |   2 +-
>  xen/common/efi/boot.c                             |   6 +-
>  xen/common/efi/runtime.c                          |  18 +
>  xen/common/event_2l.c                             |  21 +-
>  xen/common/event_channel.c                        |  18 +-
>  xen/common/event_fifo.c                           |  30 +-
>  xen/common/gdbstub.c                              |   9 +-
>  xen/common/grant_table.c                          |  29 +-
>  xen/common/hypfs.c                                |  63 ++--
>  xen/common/irq.c                                  |   6 +-
>  xen/common/kernel.c                               |   6 +-
>  xen/common/kexec.c                                |  18 +-
>  xen/common/keyhandler.c                           |  47 +--
>  xen/common/livepatch.c                            |  15 +-
>  xen/common/memory.c                               |   8 +-
>  xen/common/multicall.c                            |   2 +-
>  xen/common/page_alloc.c                           |  14 +-
>  xen/common/perfc.c                                |   4 +-
>  xen/common/radix-tree.c                           |   8 +-
>  xen/common/random.c                               |   2 +-
>  xen/common/rangeset.c                             |   2 +-
>  xen/common/rcupdate.c                             |   8 +-
>  xen/common/sched/arinc653.c                       |  20 +-
>  xen/common/sched/compat.c                         |   2 +-
>  xen/common/sched/core.c                           |  40 +--
>  xen/common/sched/cpupool.c                        |  35 +-
>  xen/common/sched/credit.c                         |  59 ++--
>  xen/common/sched/credit2.c                        |  55 ++-
>  xen/common/sched/null.c                           |  60 ++--
>  xen/common/sched/rt.c                             |  47 +--
>  xen/common/spinlock.c                             |  12 +-
>  xen/common/stop_machine.c                         |   6 +-
>  xen/common/sysctl.c                               |   2 +-
>  xen/common/tasklet.c                              |   4 +-
>  xen/common/timer.c                                |   6 +-
>  xen/common/trace.c                                |   4 +-
>  xen/common/unlzma.c                               |   2 +-
>  xen/common/vm_event.c                             |   6 +-
>  xen/common/xenoprof.c                             |   2 +-
>  xen/common/xmalloc_tlsf.c                         |   4 +-
>  xen/common/zstd/zstd_common.c                     |   4 +-
>  xen/common/zstd/zstd_internal.h                   |   4 +-
>  xen/drivers/acpi/apei/apei-base.c                 |  32 +-
>  xen/drivers/acpi/apei/apei-internal.h             |  20 +-
>  xen/drivers/acpi/apei/erst.c                      |  57 ++-
>  xen/drivers/acpi/apei/hest.c                      |   4 +-
>  xen/drivers/acpi/numa.c                           |  10 +-
>  xen/drivers/acpi/tables.c                         |   2 +-
>  xen/drivers/char/console.c                        |  36 +-
>  xen/drivers/char/ehci-dbgp.c                      |  28 +-
>  xen/drivers/char/ns16550.c                        |  34 +-
>  xen/drivers/cpufreq/cpufreq.c                     |   6 +-
>  xen/drivers/cpufreq/cpufreq_misc_governors.c      |  22 +-
>  xen/drivers/cpufreq/cpufreq_ondemand.c            |  10 +-
>  xen/drivers/passthrough/amd/iommu.h               |  45 +--
>  xen/drivers/passthrough/amd/iommu_acpi.c          |  15 +-
>  xen/drivers/passthrough/amd/iommu_guest.c         |  12 +-
>  xen/drivers/passthrough/amd/iommu_init.c          |  49 +--
>  xen/drivers/passthrough/amd/iommu_intr.c          |  20 +-
>  xen/drivers/passthrough/amd/iommu_map.c           |  22 +-
>  xen/drivers/passthrough/amd/pci_amd_iommu.c       |  32 +-
>  xen/drivers/passthrough/iommu.c                   |  56 ++-
>  xen/drivers/passthrough/pci.c                     |  18 +-
>  xen/drivers/passthrough/vtd/dmar.c                |   7 +-
>  xen/drivers/passthrough/vtd/extern.h              |  38 +-
>  xen/drivers/passthrough/vtd/intremap.c            |  14 +-
>  xen/drivers/passthrough/vtd/iommu.c               |  94 ++---
>  xen/drivers/passthrough/vtd/qinval.c              |  28 +-
>  xen/drivers/passthrough/vtd/quirks.c              |   2 +-
>  xen/drivers/passthrough/vtd/utils.c               |   2 +-
>  xen/drivers/passthrough/vtd/x86/hvm.c             |   4 +-
>  xen/drivers/passthrough/x86/hvm.c                 |  14 +-
>  xen/drivers/video/lfb.c                           |   4 +-
>  xen/drivers/video/lfb.h                           |   4 +-
>  xen/drivers/video/vesa.c                          |   6 +-
>  xen/drivers/video/vga.c                           |   6 +-
>  xen/drivers/vpci/header.c                         |  18 +-
>  xen/drivers/vpci/msi.c                            |  42 +--
>  xen/drivers/vpci/msix.c                           |  20 +-
>  xen/drivers/vpci/vpci.c                           |  16 +-
>  xen/include/acpi/cpufreq/cpufreq.h                |   1 -
>  xen/include/xen/acpi.h                            |   2 +-
>  xen/include/xen/compiler.h                        |   6 +
>  xen/include/xen/domain.h                          |   2 +-
>  xen/include/xen/hypercall.h                       |  69 ++--
>  xen/include/xen/hypfs.h                           |  49 ++-
>  xen/include/xen/irq.h                             |   6 +-
>  xen/include/xen/lib.h                             |   2 +-
>  xen/include/xen/perfc.h                           |   4 +-
>  xen/include/xen/sched.h                           |   2 +-
>  xen/include/xen/sort.h                            |  55 ++-
>  xen/include/xen/spinlock.h                        |   4 +-
>  xen/include/xen/vpci.h                            |   8 +-
>  xen/include/xsm/dummy.h                           | 211 +++++------
>  xen/lib/sort.c                                    |  80 +----
>  xen/tools/check-endbr.sh                          |  85 +++++
>  xen/xsm/flask/avc.c                               |   2 +-
>  xen/xsm/flask/flask_op.c                          |   8 +-
>  xen/xsm/flask/hooks.c                             | 236 +++++++------
>  xen/xsm/flask/private.h                           |   9 +
>  xen/xsm/flask/ss/avtab.c                          |   4 +-
>  xen/xsm/flask/ss/conditional.c                    |  10 +-
>  xen/xsm/flask/ss/conditional.h                    |   6 +-
>  xen/xsm/flask/ss/policydb.c                       |  53 +--
>  xen/xsm/flask/ss/services.c                       |   6 +-
>  xen/xsm/flask/ss/symtab.c                         |   5 +-
>  xen/xsm/silo.c                                    |  24 +-
>  xen/xsm/xsm_core.c                                |   6 +-
>  322 files changed, 3316 insertions(+), 2739 deletions(-)
>  create mode 100644 automation/build/debian/buster-gcc-ibt.dockerfile
>  create mode 100644 xen/arch/x86/include/asm/endbr.h
>  create mode 100755 xen/tools/check-endbr.sh
>  create mode 100644 xen/xsm/flask/private.h
>=20


