Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8467D3051
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:47:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621344.967720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusSu-0007xt-N5; Mon, 23 Oct 2023 10:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621344.967720; Mon, 23 Oct 2023 10:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusSu-0007vC-Jf; Mon, 23 Oct 2023 10:47:20 +0000
Received: by outflank-mailman (input) for mailman id 621344;
 Mon, 23 Oct 2023 10:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qusSt-0007tn-OY
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:47:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8973f27e-7191-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 12:47:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8157.eurprd04.prod.outlook.com (2603:10a6:102:1cf::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Mon, 23 Oct
 2023 10:47:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 10:47:16 +0000
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
X-Inumbo-ID: 8973f27e-7191-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbBqsMAIgJqMBBJ1X/u9leo/RmP0CfR4AARivQ0QiU1suxFrV/V0RXx2LSidP2u1Qf8M+31TiIyoG2MWjgbvjiMVJ3dd3bSbhDSw/h3TJ9xCXQUNxD6BnvLWEAgSOhJ5xBYqOWklw7wSMAupWr0EWJszZrZlA1PfLQK1LOCDZ1sQIvqH32rvuMxcX9SO4qDwJ9dFsYPYVmfjiuuDb+ooHKxPM5P/rmscVEhHhlEilNaDQK2E9unjECKNuVgRENLgG7o+Zc8Diz1ezKm1ttHEexoU99Y+htAZiqa+UL86fe4b9M0mfZrlYBOmt7J69eWKOeAJ702mh28TJGQWu89rNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMVdrAofRWOmzzaTnPAS6V+OshazwYhvWUdWrgBldH0=;
 b=NQgPALbZ24EHBFN2bb38OU4xbMFT4p+LMwWmP0PSNFpcP7H+1gkeJ/8tqxq8IICS5MeMWNPkq5i6j/Oetk5taSFvq7FDar5GxQ7khJYy4VAs7tukuexVrzpNToOKuzxtFON6b2LZWvgufNbdh06kqFVg8A9RaT2BoEQe0pv0nbUwOORJ/g2L1eJbuLPMJ2kzQY1sdR/JBoYPbULGWYB/GaVfG4wmL7UHK4MSPP4MNSinB42WmA4Na4n3BgpxoCR0wuOSitsKfrLHBCdNSIBx3GdTfxWh/feuSNInTY0a/jtaOH21uf6q311R+EuiyDu5cpEiYgbX1pi21gc1u1s8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMVdrAofRWOmzzaTnPAS6V+OshazwYhvWUdWrgBldH0=;
 b=TG7fWWKWU6W30gpbT18ewlw6aHs8zjKhoGemuTWuz1qsQZDvJBa/k4pJUmbl24eMT04G5O0yFhhphRv854F5kNiUiZZvtH4U3B7GDVTHzVr0xsAaT8Ig4b5Fz4W+IHK9RSinflQEnt9WxNE7ZWFgSRYrKTOa+lS/lG5DEoLgYblVA95dR44hkMiWUUFaFIM7dNU9XgETvLcgjFiJNJjv+cc7VMBH5TRJcpcLXp8BF70h++kmVPYSk9zvIthb48XoAsf3wzTg5q2jZc2UAEhNKQjplRvdsT7fySeDJDMDHsFC8tML/TLb4EvtRKAS3nFCiRR7drOQxDP7VYBdVgmR5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <176d38b2-eafc-7a78-ee17-0d5e0369cb2a@suse.com>
Date: Mon, 23 Oct 2023 12:47:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 10/29] xen/asm-generic: introduce stub header iommu.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <8990c5c77c12333bfa7aba42b66bf7fffee5a096.1694702259.git.oleksii.kurochko@gmail.com>
 <65cdbeaa-6766-e5b7-65fb-191da6f59d81@suse.com>
 <e1e26fd0a31c7ab14e474d6d7fb16163e8163f2b.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e1e26fd0a31c7ab14e474d6d7fb16163e8163f2b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 916e46db-b954-4f59-43cd-08dbd3b56c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EQtHM4cJSZ0bfLIbt+jPPvUfYZicZkQ4gbkG913Tallq/eTu7nJCEG6BHsPnlEmp7QNmtjaCXV0UTpCYjX3FHMn6lGneKO3/KyDG1MDJiPITj1lwu1/scPndMMXk9cTMCSaOa6E+PSwIzVUF8BxoR4B16LlIKewu5NxgS1KzshlIlu1FZ96K7TVZSMaDnHFjKPk1Qhw5JLP4D/wdRMQ2K0SbsVkQ25GJsyno3c0df4ACSTTZbgtmo2kt9rwLJn/l6VFKGoujL0t/DaPGd2Agomk8u+FITurYgGoJTDQAubSNMQdAyGUUmEfbbDlwJvMsmBAknA1RXcN8qsRjVBjYAQH3flGh+Q1czy3VAqt1FhmIqL9cPj1/1NvmaQrpDQnGbFs8xlOIGPcMWS6OilcthdV+L4J2tDhAGFmvrUXBlP79ezLAMjVxR0zY4/vhvZeu12nHd4bC68g5y27TPX8/VBUpok40KrQ8Od7a8ldqmcI8lKd5VVoNq/Mp0eOXvWymnBVhFIajwSpRm8uq2MXiAOcjEgRjprrFXw9up7SZvL6BXsO+xPUvUUSMmMG0C4LRkpC+wRAq8j4dK++Ko33YfMUKVftrZkfYH9Zp+ohP7HwwOjyGqaI94vbnpd7x3j6j71IsXEzU5dKAejGdHGoRvJbgBhpJhaRun/uwuv7TnS4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(8936002)(8676002)(4326008)(41300700001)(4001150100001)(2906002)(5660300002)(53546011)(36756003)(6512007)(6506007)(2616005)(38100700002)(86362001)(66946007)(26005)(31696002)(66556008)(31686004)(6486002)(66476007)(54906003)(6916009)(478600001)(316002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHQ4bnRLZG9MVHRmbzBrOWtrbW9RaTNscWtCY1VXKzFYVFJlcFBNWElUb2lp?=
 =?utf-8?B?Y0VwQk15SjV0bnBKalBPOWg5dVFrTWFDVFdSa1k4eUo0T1E3dG54dXBnSmpi?=
 =?utf-8?B?clJlOGVSZzJqRjZBMi9wL1F3T2JKRnVFSExJZEd3ZXNHS3RWcjJJYlZUeGVR?=
 =?utf-8?B?QnEvZTRQOTk4bGoyT29FZjMzQWZlSFFwYlN1cXJKN2VLaE9IWTBjUXd5V01Y?=
 =?utf-8?B?UkVqZmdCcmtCT0xrMGlRMjlpdHpYcFdqMUluNWdSYWwrNjdJeG05N295Y2NC?=
 =?utf-8?B?SERGZWE4dlJBUG56SndaZ1pVOVJHSVNlZE42VzlEU1NXZzJCV2ZMeUNWYkJ2?=
 =?utf-8?B?ZzM5TmNxanpaOFF2N2lua2xJa1Q1NHFUS0tMaGJaUnJTQms2M01RaXZ3V2VD?=
 =?utf-8?B?RFhUNzNBK0YvcHdtQzgrMnB3M3VzK3JGUlRIK3E1Z0YraWhId2RuWnEreENI?=
 =?utf-8?B?VkxvOExpL0t2S0FVWTM5dmxTVVUrK09oY0Q1TWs2TEcrSXg4a0s4bXB1Ykta?=
 =?utf-8?B?eWdtMmtVSnN0K1NqUllNTHZNa1Q1Z3NGQTJ0ZFZkVW5nS2lXWnNsU09OSFBZ?=
 =?utf-8?B?T1ZJVlRqOWpNVzgrMngyZ1FydERBeC9hL2xwQVhOYlRNWlFvOWNqNWsyM3ZJ?=
 =?utf-8?B?dHcrWHRMRHhWNjB2NjhCRFRqM2pVTERmMEJSU0JTUW9DSmU5OWwzcE5UNW0v?=
 =?utf-8?B?SU92WVNmNEJMTGMrN2k1WEhOQW1vYUU2bVpJWVc1d3k0dDRLMDM4M1YyTlZ5?=
 =?utf-8?B?ZVhJK0RUVHV2T0xYbk1LVk8yQXVnL2dRa1ZNYW1CbDg2UURWeGhRYk9MNzdm?=
 =?utf-8?B?c0xyVlpkNXM3ZkVZNTdZOGRuaVlNZmlnTUhkQVN6NTZRYTY1QWtYNWgyZEdG?=
 =?utf-8?B?ODZvTUNPWkRHVkszVHZuSzk1RlBYOFpPWko3OWpJWFk5U2ppSDgyalVRcXBI?=
 =?utf-8?B?SjRNRXI1R3A0bW1TUmdDaFpFSm5QZ0NobGVnYTlkc0V1N2w2WHVYUHhHTjZk?=
 =?utf-8?B?dEI0cWhNRDg5d21sMG42bGNHRS9zb0FOc092dzVGelhnVDc0azhLTW9FbnA3?=
 =?utf-8?B?M2NLTlJwalY3VmtvZ29MdGFQOE5DbEdqTUgvMXdIbTl4bUphcS9yWW1KQW93?=
 =?utf-8?B?WXYvUmp0T2MzYmt4YUtrdGtJKzh5NS9RdDdWdy91bmh6VW8yZ0IvU0lySlB1?=
 =?utf-8?B?QXNaeUZ2eXhDdVRhejBHbml3cmNIL0xSellUOCtydFhpb0ZpZDZ1d084aGtp?=
 =?utf-8?B?WVVFK3RhRnVWcXh6S3BkOXlld1N4TTU2b2tZblNjamlpMStvWm1ZWjBJWW13?=
 =?utf-8?B?UmlRdTVSektWcXVxOWp3ZHRqeTd0UCszYzcvVURqSGZoSit2WEFCUkZMYk5p?=
 =?utf-8?B?ZlRBWXhqbUt3K0YwUkZsRXVqM0tiUy9XZXcrcU9tTEJzWVYzcjZaYmdEREsv?=
 =?utf-8?B?SGdGTklrOTdYSGZycm51cW1HRW9EbDN3citsTGZMc1BxL3lOVitSWFdHWTZL?=
 =?utf-8?B?TXdtVGZDVWFyN2U3bXhKSDRCOXlnOVp6R0dVNldQY1FLaFV1ejJ5UWJ2NjVL?=
 =?utf-8?B?OVVweTE1UnkveGNDdXp0TmZyaSs5c2dsdWQ2S296cTdSL2xra0QwNk1TVkto?=
 =?utf-8?B?SUlMeXFjQTRWOG9vUzZ4WlE0bmFiZWZsWVA1WThLd29UTW5vYnMxRkdPZVdq?=
 =?utf-8?B?eUpZdjNBSkM3VmVyK3drUmVqenRWbGhsenF1Y0JtcWF5Q3hzMlNpclpMN05Q?=
 =?utf-8?B?UkIzcTA4TytLVDZ1bGRMWm5ZTTFneEp2UWFNM1BrTm9Za3I0WDh6ZnFEN2dL?=
 =?utf-8?B?TE9nUDRyKy9tSytUNzZDaDZHUU04ZEt4c1JVVGp5RVQxUGtYbTJ0Ykl5TTE1?=
 =?utf-8?B?RVFVbDNBUnBpM3paWmlicE5UR0JrUWRWR1Aya0ZDZjlsalFGdnVtWERIaDdk?=
 =?utf-8?B?SWg2cEVyK054SzFYbThIUVlMVVNrWkU4TWczWHF2cDIrQk9wOGtsdk1ZSmht?=
 =?utf-8?B?Y1VLQ3JXYnZrV01rSlc0Zmd3NytleGt1VmpIbEVpT0xEZDlJdERxRXZoQUxB?=
 =?utf-8?B?ZUhmVy8vb1Bnd2QrUkJ0YkxZTzBHZHRIN1VjbTZJMWMybmxZVDMrTnk0OTJv?=
 =?utf-8?Q?nSweGd4rfwG6+iVf7CvUCPLao?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 916e46db-b954-4f59-43cd-08dbd3b56c8a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 10:47:16.7932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TMxggE8g4+y3YDLzxX3qd1GjyIZ3p6HrNgnkzUz32OEqIXdIzxZZPbyozRGAxizdKN4Gq/j3nqWj5vZ5kb2uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8157

On 23.10.2023 12:43, Oleksii wrote:
> On Thu, 2023-10-19 at 11:44 +0200, Jan Beulich wrote:
>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/iommu.h
>>> @@ -0,0 +1,17 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ASM_GENERIC_IOMMU_H__
>>> +#define __ASM_GENERIC_IOMMU_H__
>>> +
>>> +struct arch_iommu {
>>> +};
>>> +
>>> +#endif /* __ASM_IOMMU_H__ */
>> This one's perhaps slightly more "interesting": Yes, we have a
>> HAS_PASSTHROUGH Kconfig option, which both Arm and x86 select. But it
>> is in principle possible to support guests without any kind of IOMMU
>> (permitting solely emulated and PV devices). In which case what's
>> (imo) needed here in addition is
>>
>> #ifdef CONFIG_HAS_PASSTHROUGH
>> # error
>> #endif
> I am not 100% sure but not all platform has support of IOMMU.
> 
> And I thought that passthrough it is when a device is fully committed
> to  a guest domain with all MMIO things. So it is a question of
> properly mapping MMIO to guest domain. Am I right?

Yes. And do you expect you will get away with such a stub implementation
when you actually start supporting pass-through on RISC-V?

Jan

