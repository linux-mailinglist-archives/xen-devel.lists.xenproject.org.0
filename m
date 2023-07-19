Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE370759A88
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 18:14:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565962.884620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM9oA-0002Hv-FU; Wed, 19 Jul 2023 16:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565962.884620; Wed, 19 Jul 2023 16:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM9oA-0002F2-Ch; Wed, 19 Jul 2023 16:13:46 +0000
Received: by outflank-mailman (input) for mailman id 565962;
 Wed, 19 Jul 2023 16:13:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SgS6=DF=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1qM9o8-0002Ew-S7
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 16:13:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b1ddcc9-264f-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 18:13:43 +0200 (CEST)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by PA4PR04MB7919.eurprd04.prod.outlook.com (2603:10a6:102:c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 16:13:40 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::a660:f949:7690:2dd0]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::a660:f949:7690:2dd0%3]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 16:13:40 +0000
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
X-Inumbo-ID: 3b1ddcc9-264f-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evA06aP37wbQQZ/zOSJWd/TqQwp/WE8c+lddz4Kl0/dYw0Amjfw+mHf/s3lVzxgCn1k0jL6nnil5DF+yd+8eoLB/w8gQbiEDIFd1F5Ic/miu/2QZsZQOHMhImqrZI3jjbi4+mp8S3QxQoZbyV8iK69WTE6U3FlXz8PZo+zYD4wANYUKtmzDSyYbTH93YCh0yu0A0KpKf782785Bw5o5wqUrYH32RFK0Q76XOBSP+5lbRQC6yMqhMMALHuQ4FHduVPyxZzWa6TfYNuVx9P6y7ZeEDJTpDrk9ci97G4hjbF9yRcgkSgb+/bxZahazx1qDNUfO7tk7cTdz6EloqgxQauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqRr919NUlOrmXHdah6Gk+0oOo6JMk67MeDVo6GolN0=;
 b=HiQ993EBEKfZbIacvgvZ2vfIMOvD8aCblp976hMArE44+Hw8BYN2F2ForKwYFd9oGiKquxAphM39qzcaNUxyid02mtWMsbFxdeRs/anvzOchX5Y01c9sPL1+zen0RxnPCQ0/m7Ckl0lLlEweRN6/gPZxqpXRf9ZjyougnsaR47AX24txjNvQlNH2Ueuf1h1C5J7xsKwFA6Syd5eu2VXtqmfTUvVYWOvjBBRgPCvS2cEcqIif73krzhsUWDjTXE0p8ILRjbJmKVDjUM7yCbtOJf0/UagRaWQtUyR/smyNCUzqTE12HewSZZNuq/t3/KykaSyhSg+cxThuDpcQeZUIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqRr919NUlOrmXHdah6Gk+0oOo6JMk67MeDVo6GolN0=;
 b=HWYwXFlI3iDjkTXBlyUs7MubdGvbnxgT/uoG2VVqCt3Hmo/OT6P2XLjAu35AMjB4418H9BOMKEhvJ0DNCeHN2WK4lK9lcNNXHH4P/afNLEU19f//aW8X0iQhAs6J/IvLulrJKp5+4juihuLnXAeuxYreYzgXsrrEnhGkAA7XJD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <62eeff72-c1fb-6932-6797-1b0058c97b03@oss.nxp.com>
Date: Wed, 19 Jul 2023 19:13:22 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, george.mocanu@nxp.com
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
Subject: [ARM][xencons] PV Console hangs due to illegal ring buffer accesses
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0177.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::46) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|PA4PR04MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 2760aac6-b6a2-469b-f8b6-08db88731d65
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BPT73KgnogkqqtYp6uAWkxCwYTvFHkkyhXANnridIx1WEefSv+iXRbSDqRnv7QUbBeAyXG/PuRmXDYpnDQhNWnKQ+svYURG6KWfk3hKUxYRqrZo+lyHWHLaKorfMG7ep1CeBPE+R+LZDdYuE8ONTVmmms9LMyB+MgMgEeaugQaidQg1JOdVkoSVUVQVGX+knyer+Nz7kJ6vvHUzwRmkCjAXNZknU7dYmrJegS20OL/JmyfXD6iqiK4wICnJOIPZvqe0zgchKYyZbERwe3lLVez7C9N5Fys1JCjDTyzRZ8/r/5FbOQS/D3deUInVNkyV7O0HTV2NuEGKtV+FcmlrJrwe//2UdBh4F6troGGzzkEBVrHZKvh6/mSXNAEFvIPMCpjib9rf0dyRkSmEMF8nFjXtxM5mp9zSPN3MZqdNBtgyZb9bNX/dCbB5SPbbgkZjXM+AGh/Cuk6N76Zl57kkJiF1libZQN4kk/KZ6aEBbraUc/7o0mGqmjU5Vc4q6SA8RryY+LohlgiBA/pnrg8f8qnFUKvtIyZm9FQ9W9Jz8UoLnQoUKwahWsHfzvW0F91RL4a41Vq0tth714a8j1biJ0CHvxog7uEu3rpdZzNTu/vqKpI2WuL/zQWenxfROzILWRZi08ii1Bd1/TQNeFG7RsQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199021)(966005)(66946007)(6512007)(66556008)(6666004)(6486002)(66476007)(2906002)(316002)(8676002)(6916009)(8936002)(4326008)(5660300002)(6506007)(2616005)(38100700002)(186003)(26005)(41300700001)(86362001)(478600001)(83380400001)(31686004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yzl6U2U1REk1aEI1akNQem5CRjRsWlAyWVhJY2NMMDBvQ0YyakhYRDE3SzJT?=
 =?utf-8?B?bVhwbHBGUlZJcCt0cndHWDgwYXZXRFdmd1p0bTA5RWxqcWZlb3BWOUgwUTdV?=
 =?utf-8?B?Qkx6aGV1TE5iaEdOMld6aXdwd0ZlOFhKL0RCdG53bmVRc2krOCtONUF5Qkhi?=
 =?utf-8?B?aStWaTVDeWRaWVZ0UjhQOUtQSkZLVHhnZXlQSkhmNmtFVzVsaFZrT3Rqc1h1?=
 =?utf-8?B?ZmNvYmtBWGh6WlJ4YThldzBSSm1WRFV2UkxJdzRoNHNIT2g4eXltd3hSc3BN?=
 =?utf-8?B?ZTN3VXJmaWtZczI2N1pwWE01eVdnQkdHSXVxQmNDNkcxOG9ZV3ZxYWtkdUZF?=
 =?utf-8?B?QnBFM1FoYUt0SVNQZkFUNStYcTlXQysvUEJlVUwrNzZBRS8vVFdNTExoMXBs?=
 =?utf-8?B?NkdxM0tHaEVERERYZGJLWE96aFB6dE1mTGFtbDl2SGdtN2wwYURaOFdWbXc2?=
 =?utf-8?B?S2xucVJxcHhRYXg4ejVHc1BBblNkZ2Y5WTc0QXBRb2RCMWhudjJaemx5ZUZi?=
 =?utf-8?B?ZTZiZFlyaTNjV1hZUjFTdURXdHozRE5JRlBkUEE4dzBnQk12RC9TTHhYSFdC?=
 =?utf-8?B?aDFXaGpZU0w0NXFzQTZUVW9wakZrNW9pbzAxYXQxZWJabnJEdHZkaFM3MVEw?=
 =?utf-8?B?ZTZtMURRR3oxYzQ1ZWtzOG9kMG1jSU51Ui83YjRMeUZ1S3FUU0JyaHd4UENH?=
 =?utf-8?B?bXdRRHlmK3dPSm82NWV3SUc1QXFlZm9maHRBdGFwVU42d2tqNDVuY3JSV0Fk?=
 =?utf-8?B?bENtOWNraEpSbElTSEorYUVJbnJpZVZMaTZkR0k5QklrbEpWbVkrOGY4REJs?=
 =?utf-8?B?Zm5OUGY4MWpIeDdnNC95UFVOTmZVTXBSVm5DME9NNWMvUHBSUk0xOHpQZ1ox?=
 =?utf-8?B?RUpsNzA3NFNDbW0yMDZ2U3U2Q3pSU012SVFDamhqa1loQ3Vid3FzNUplalVD?=
 =?utf-8?B?R1VlV25nZ1R4RFJSSldaanIvMjJTVk1LTVhXSk53WExxSTU1Uzg1UUNrVlVO?=
 =?utf-8?B?VSsxQVBjSk1RcmIyQTVJZFA2M1lVY29Mc2x1bmlCYVN0Rmh2TlkyUXp0MGZr?=
 =?utf-8?B?Sm43WnUvc0ZadHQyejUwZ2YwdEI4Yjk1c1hTdktpTTF6MHljMTUvTm93UnpU?=
 =?utf-8?B?M0kzRi9hZ2dzMmdpeERseXpkcjMrK0JxaVhOTlNWRTJIblBiS3N5TnVNYXZE?=
 =?utf-8?B?dndTT0hPdXpHcWI4KzRoNnFDOGwySVMxSmpVYjRaRkxjeEtpY0pjOWkxWjVj?=
 =?utf-8?B?SEFOQkpsVVBlOTZTZ1VtQ015c1hweER4OTFrdy9GT1o2NTFneGRTUGVjY2tt?=
 =?utf-8?B?UEUyc1lnYU9qT0o1TmZrYWpaRnFacjF1bUQ2bzhVSTF0bE5yMnVUakQ5bTdh?=
 =?utf-8?B?U0dlZUtUSEpaNDFTc0k1eTY0WVlsNHhZQ0RLL1l4OXEweWVrVW04WnZkYjdW?=
 =?utf-8?B?UUg4WHpSTnBCc3hFNlo0WUNZRGZLZWo3MmtycWZkQk1IY3VWOGkyZlIzdnZh?=
 =?utf-8?B?QUNTK0UrcGtjYWFDMGYxRGliQkVsbXJRUEJoWXIzaU9kMjNPVmc2RmNOQ2ZU?=
 =?utf-8?B?NFRkbHhLZzEraFlhNmQ4SElzRXZiNis1ZS9Xb1J2aFFPYXZBMVhPYmVNK29O?=
 =?utf-8?B?Y24xbXEwbDZ0UHh3ZjVTaU9ZZUJ3WUJWKys2UktUMDFvY1JoM09IZUZXOVB0?=
 =?utf-8?B?TTNaWG5mRGkwaExhUTk0TE9ZV0VRZHYzYXJVOEpXbHlHcHp6b2tqaHQvU05Q?=
 =?utf-8?B?QnV3WnNLaytTbU42UjN0ZXlXUmZZd0U4K29sbzBTRG92VjloaWJsYVVBNTlU?=
 =?utf-8?B?ckw0SnpMY092R1MrK2pkTW1LcDNqWjFyaWtweWYyaVU4cjVwM3RuQjc0b3E5?=
 =?utf-8?B?ZTZEb3p1b3UvR21sSE9KNjNSdkF6SEdFajZjUGVCNjJBNElSaXRRcDZFVEM2?=
 =?utf-8?B?WnlGZGZZV2hrV01QdXdzMXRsL0FaaHJMR3ZVMHAwbmQ1SlRpbVM4ZlFvYzJD?=
 =?utf-8?B?ZGoyanJHUjJpTWovS2VXOHRISGRrRjk2T2d0K2RHS3ZTOHF6MEJRSVJQMUc1?=
 =?utf-8?B?WjJycElUbXdkMzMwWmVoMjZZU1N6OGtFVXRXbzVqbThkZWNVUW9VcmJzZVdm?=
 =?utf-8?B?eDJUYS9TU1I2T2YxWmJwZHRVeHIvbGZkQUJ1UzEyc1JpTDlOTGNCQlRXYytv?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2760aac6-b6a2-469b-f8b6-08db88731d65
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 16:13:40.1273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ui8XVCmvslN2IvEpDNzQ+XGnYnRsn6+zV8GKFDoUHWQfTntCk6fZFOLaSJcfqyn99JhaCkbHcsCclnFe7QM826hdcDfhuH56GhfHhdMzdiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7919

Hello,

As we're running Xen 4.17 (with platform-related support added) on NXP S32G SoCs (ARMv8), with a custom Linux distribution built through Yocto, and we've set some Xen-based demos up, we encountered some issues which we think might not be related to our hardware. For additional context, the Linux kernel version we're running is 5.15.96-rt (with platform-related support added as well).

The setup to reproduce the problem is fairly simple: after booting a Dom0 (can provide configuration details if needed), we're booting a normal PV DomU with PV Networking. Additionally, the VMs have k3s (Lightweight Kubernetes - version v1.25.8+k3s1: https://github.com/k3s-io/k3s/releases/tag/v1.25.8%2Bk3s1) installed in their rootfs'es.

The problem is that the DomU console hangs (no new output is shown, no input can be sent) some time (non-deterministic, sometimes 5 seconds, other times like 15-20 seconds) after we run the `k3s server` command. We have this command running as part of a sysvinit service, and the same behavior can be observed in that case as well. The k3s version we use is the one mentioned in the paragraph above, but this can be reproduced with other versions as well (i.e., v1.21.11, v1.22.6). If the `k3s server` command is ran in the Dom0 VM, everything works fine. Using DomU as an agent node is also working fine, only when it is run as a server the console problem occurs.

Immediately after the serial console hangs, we can still log in on DomU using SSH, and we can observe the following messages its dmesg:
[   57.905806] xencons: Illegal ring page indices
[   59.399620] xenbus: error -5 while reading message
[   59.399649] xenbus: error -5 while writing message
[   67.353608] xencons: Illegal ring page indices
[   78.027813] IPVS: Registered protocols (TCP, UDP, SCTP, AH, ESP)
[   78.027865] IPVS: Connection hash table configured (size=4096, memory=32Kbytes)
[   78.028038] IPVS: ipvs loaded.
[   78.065479] IPVS: [rr] scheduler registered.
[   78.071249] IPVS: [wrr] scheduler registered.
[   78.084190] IPVS: [sh] scheduler registered.

Sometimes, Xen also dumps some info about expanding the grant tables, after the DomU console becomes unresponsive:
(XEN) common/grant_table.c:1882:d2v1: Expanding d2 grant table from 5 to 6 frames
(XEN) common/grant_table.c:1882:d2v1: Expanding d2 grant table from 6 to 7 frames
(XEN) common/grant_table.c:1882:d2v1: Expanding d2 grant table from 7 to 8 frames


It seems that when spawning the k3s server process, somehow (maybe due to intensive usage) the console ring buffers and the indices used for accessing them become corrupt. But the PV networking still works fine, and the domain is reachable via SSH and can continue to process the workload.

We've not been able so far to figure out why this happens, so any help would be appreciated. If you need other Domain configuration details or any inputs from our side, let us know.

Thank you,
Andrei Cherechesu

