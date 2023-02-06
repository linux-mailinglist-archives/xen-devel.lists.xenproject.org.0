Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F7C68C3E3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 17:54:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490641.759432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP4kS-0002Us-9j; Mon, 06 Feb 2023 16:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490641.759432; Mon, 06 Feb 2023 16:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP4kS-0002S2-6I; Mon, 06 Feb 2023 16:53:44 +0000
Received: by outflank-mailman (input) for mailman id 490641;
 Mon, 06 Feb 2023 16:53:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pP4kQ-0002Rw-9g
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 16:53:42 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20618.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cec2b8bf-a63e-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 17:53:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7410.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Mon, 6 Feb
 2023 16:53:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 16:53:39 +0000
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
X-Inumbo-ID: cec2b8bf-a63e-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+8xERCtl8nVH50N8rKZRFdyeJDfXgSQ6s1MNwqMKBGzefZFSShiRsJM8CXeR53sfC//JO5+4Ns0nv46xccQUjj2GNyTT2eIp8OcQUFbTUc5UIXMfNwsehEA7supdcMgNfqlDl4N8x+vRuPdJKcNywQiajoQF50OKnMTKrzUy+SD5IR5HuJjw53iA+CoYq/YYRnCJ8dkiTpAvff8pmWY1QppI82qphbhwg5BeFm4bPqOUyNEgyJagVSV58TG/1gIS7SiqZ4G2I5FSvyOHVLgetqa6qa4EKlntQqy+SxejQlH/vfeUSPsm+Qf2Ax9C2GbzboMpn4nMzZhHIQNtFCZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BA3hVnymw75XyzT28ezWDicOIUf4EVaML1zrA+X2Bsw=;
 b=bSjsUcFw3dQRJH/AGnG5wkvdLjwnLN6tIYtyTCAarw1Lj7ElCaX+tq3BhDGhCJO9Uzwr8I/XlLbT3Qr/9WeFtwE/gkwjePYbP0xe0OvQiB3zsn+kj45z38KGAxONgG5oM4slQDm18u1HZQpS7H3bU23W5NW9s/qxVK/miwM8KK055ZeED2YI//x/8B21yM3ZLYQQ5HYrIptRoRto+mDENAXt84NCZK+LXHXN0iLSEj+pVuk3YlOzJZkpJcnf9Kojh4GvlaPMuJRO8U5JgtPKJ4GzOQCkVOzS1dffTbeRIbnVH0+/TR0T0NfU/zCR6xRs1Wj2P81/Q1trM28/SXFjpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BA3hVnymw75XyzT28ezWDicOIUf4EVaML1zrA+X2Bsw=;
 b=qLt4ljyOLlq/u/9ijV4XrAWAZwbw/FS8WndKJDBbFgcAq+yMlDj8Pm6gUgjD2MHRPUDK+meg6rb2LeWK3ix+PhDb62RiRtNmyittQ6NuWvqzIsv+BhBs0fOspbpU5+JJgl4Z1KrEnQNFwMkCKAFtRW9DsNWTBzzyByQNp/EPhOxolTJvAZgKxXejWszglvbxC+bqBct0jN6zWDjvFCrksx9eUET0zzgIqYMO/9OFcNa93s92EUlox/VGuaJyqCITkofN5Jfhpz+aGui8n3XzaO2PyCmiyqfIK1Lo0ZBnaZ/QihaOJYpOJbDqB7VUlaO3x2bs8ssT8W50CUgLaKrQMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce1ece50-53a7-fe30-06b8-98f2940944b9@suse.com>
Date: Mon, 6 Feb 2023 17:53:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] x86: do not include asm/hvm/support.h when not used
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20230206124251.911744-1-burzalodowa@gmail.com>
 <20230206124251.911744-2-burzalodowa@gmail.com>
 <90bef569-a49c-fd29-a855-5ef0b93b1056@suse.com>
 <5c112f02-37ab-8637-3e61-e5e19f42115d@gmail.com>
 <8a1658e0-0778-688a-e2a3-bd8e4de0d542@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8a1658e0-0778-688a-e2a3-bd8e4de0d542@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 33dd2149-e5e6-4a51-09ad-08db0862b209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zq9zaq574UCBMonQJBkMzLcRHKTIWV4RBoRrsXC09gA/tZexds+dhYJ4+ZMRZ2PH/5sGypkNSSn8BjYjc6coVQkvRbXCWWhOb9rTypqrAPReerpGdSJyfsph6O4qMcBUWRcJAMvp1/X7AE6YmKgYZwu4VY7VJonMpnxFEVlOWhJ+qfsOyjsDW8xn/zCbGWkEBbXofS8XaYpySykP4/hoXc1lmVRDtuo7K7fTrXEbJHPDA8PRpytdg8orR9O/go0Je87dqj4TxQgbgw+AVuzqBWVdBc8Xg+bAADfSRiGUHyFqFwaj6ffdrQlMNPb/QiBEWA73E7sS2HQ56P6DeIU4D//ha41mGSQ4FDA0jbihEkGOvtY2JUZ2JcopNnjkuqW0mYfP92UDjdkW/rJFupwEQrUv42UwmBQhxiM/Fuf2/1Hdrkhr4MeOTfVnkK2LEGit2lUslGp3c/cQNFXf/kJc3enyI2OUDbgaM+9CXMf7b+o1XOh7VJKpaHixtuXMAuWG1l983Y0H1Tmh4V9BgTHS12EOTN9X7/ZapNeFxOfvtI7HKFi3KFCjz8hWaczxcjBG6GlusYhLXjniksrsPZq5j7QFvX80NX3cvStOmkD3k7kN7p13yA7kYAWg0BNVBVFdtthY+VctxtM8ljkju78yNDS/4QgZrXNdy95ss2cu8oAfEqjx72Oyrp9cEGfXTbMJ4CX8sNHbjZSStuDCsG5UB0hAHN/vIBAzJFdTyu9fRG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199018)(31686004)(66899018)(186003)(316002)(54906003)(83380400001)(31696002)(2616005)(86362001)(36756003)(5660300002)(26005)(6512007)(478600001)(2906002)(38100700002)(6486002)(66946007)(66556008)(6506007)(8936002)(6666004)(41300700001)(6916009)(53546011)(66476007)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnFUT2lQUTY2bXFaejVvcW90NzYrM1p4MS9hWlpnSjd6dHR4cDJRSHdheldh?=
 =?utf-8?B?czFVRXpQTXVDQmgrS0ZRc2FlcnV6WUgxejM2NnFESmN4Snp1UmVJYmRCMCtN?=
 =?utf-8?B?WkVxejlNMUc4VXd3dFArU3c3RWVUODFjWGl3VkhXbktrQng1YjJRbTJtU3lP?=
 =?utf-8?B?dVBVZnhEM0xyUjdvZlhQWUcrbEZhd0N2RlJGQ2NZVU9KSFh4dHlJRkFzN0tH?=
 =?utf-8?B?NEFsbmwwcWlkSWFWMEtGZUVsMk92aTR1VXlKYlRtbFl3M3RuZlJXL25NeHNT?=
 =?utf-8?B?TzVtdjBpbEVaY0dhTC80a0xQZnZkNU5TQUZkZ0RON3RpRlRRdjVIL3l4QU5D?=
 =?utf-8?B?Sy9uQ3dzdms5S2pEbCtZSXJKd05Eckc4bkRVN25md2dmeW9lYk9iUVBwNjJB?=
 =?utf-8?B?YVRQQ1JFKy80bGxzQkNCQjM2eTc1dWFzWUhiM2NSOGV3VUQzeDNuYnBBZGZJ?=
 =?utf-8?B?Y1JzZU1KaExFVndYb1drUHpKMGtiVXRXb2xxZWp2LzIrRmtMR1FrQlBycDZ6?=
 =?utf-8?B?NTVsUUp4WlNhMGhJbytqT093bVFPeHBtNWZiVk1WdlAvdnQ1QXJES0w0YnpW?=
 =?utf-8?B?Wm5iNFM5Wjd6aUpzS3ZFODAyL1FBVEQxUkFobEtsY3dIdkMwMExXbjV5QkF2?=
 =?utf-8?B?Ym9uSGQ5K2xtYllIZG9lTGZBdFdlWGc0d0tZeFBabXRIdzZEb2VBWE95NnE0?=
 =?utf-8?B?S3JQajNTci9pRTVOVHZHZDVJRmNVT1NIL0U1eXJwRUlPU3VTMHp2M2dnMGE5?=
 =?utf-8?B?Z3hsYTBDRkJPSDhyLytzSzlYNjlQZkViNVVKLzNLQnpTaVlsUFZuWmFVMity?=
 =?utf-8?B?K2FWSnp6TzZKcytuTXdPYjJqNTJ3TVRlU1BlRi9mcEdKaVgzaUVCN2RWYU1q?=
 =?utf-8?B?aXdWMzBOdXBIbDcwZmt6eFpLS1VyQ2lMZVBvN0NQTStXMkJoNmVESTgvT3pl?=
 =?utf-8?B?UXZ2UCtpRTdxZi9KQkxqYm9LdXRQZ3FaTE9kM3lKTjVMSVpxUFg4VVNHQXh2?=
 =?utf-8?B?V1VXUFVtbkc5QmhDaG9GRmUxSkRucHFVSC96YThNRGY2M2Vwa2dtQ2hNMU1R?=
 =?utf-8?B?eEhvbEVZS1BUZTkwbUlEYlozQjFDcjB3aVpWVWhPTTdiaHRaMkl5bkRaN01J?=
 =?utf-8?B?Q2RzN09aQ3ZKcUo3Rk1zbHRrUE1pWjlIUzJKcGlwc0JUM04rb1d0S1RyZk1n?=
 =?utf-8?B?cHEvaUFzL011RnBPQ3dKU3pQQVBqS1ZJcE0yaTQxN21pdmE0eUNtd3lxTDhl?=
 =?utf-8?B?UkRiaWRLdENjbDcxbGR1MWRVS3NSNG8vZTNyZlRkdWo5QjJVeWYvdlR4a2RF?=
 =?utf-8?B?M2lLRmowU3JtY1J6VG1rVUJoWkd0QmlRb2ZlemVod1FxbXFMTHQrbHNWR0JK?=
 =?utf-8?B?RlZ0MHZ2SERzNDRIa0wwMDFOQklmcS9aVFlpeEZzbHF4TnEvdmhQY2hsa0NF?=
 =?utf-8?B?NGc5LzFoR1FTRlpVbENXS1ZtNlNnYmJpL1Q4TFZZZXhucjJyelprNkczdWlk?=
 =?utf-8?B?RzlXalZSektBVGt6dzJwdUt3cTJTanY3aHFxWUEzcDJFSWE0UXRuSEpXVmk5?=
 =?utf-8?B?cEJSaXI5UmdRNFQ0cHFwOHpqNDg4eHgxWVpmNytZUUdGS2x1emlQQmFIUnZT?=
 =?utf-8?B?ZVd1YWhYcXVXblEvY2hWeXFma2JiY3IzMXJzZ1VTczJ1eEwrWnVWVWtndVJv?=
 =?utf-8?B?VS9mTExycUVEYXJ2b2NNczV2Q2drb3ZhV0lGTzZlc1QxeXpSQ1liWWY0Y3RS?=
 =?utf-8?B?MEhibXk3RGtKdzIrNktsQnhQN1ZDTDRCV0JtL2NYTHpBajBtUVE5bGNObHhW?=
 =?utf-8?B?SjFlMFRXVGc3eUdnWHpHV3l0YmMwV2tWdHQydWZMdm53aTJrck80NU56Qy8z?=
 =?utf-8?B?bWswbTQzZTRJeFRFWExiRnpIaGh6TTg4eHlVUkl6b1QvLzBHTFBlRVFBRE9J?=
 =?utf-8?B?ZW04ZVZCVm1BaHVQUFVxcTVVZmg0Zi9YMjFqRlVkRXplc25pclhqUnZ4V0Y2?=
 =?utf-8?B?L0x3RGZoUTY2U01zUGZ5dnZYMm56NmcrdURGVEowNHN0dHRGS1ZrS3VFQXFU?=
 =?utf-8?B?a0daNW9NTkFBRzZyZ2xKSC9TMnEwMzNEaGVoUnk2OEN4TVR5enFJbGV2aytt?=
 =?utf-8?Q?1dcLMQWZt+wncgQDw5y/ysTBA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33dd2149-e5e6-4a51-09ad-08db0862b209
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 16:53:39.2935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcprZlrkUIGhw2fG6aAWJmTbrUp0rILLEFlfDfX2fVlUIxGYpZDjDFEKXoUzVsQbykeQSCRyxFUVrgvRWXh9uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7410

On 06.02.2023 17:30, Xenia Ragiadakou wrote:
> On 2/6/23 15:11, Xenia Ragiadakou wrote:
>> On 2/6/23 15:01, Jan Beulich wrote:
>>> On 06.02.2023 13:42, Xenia Ragiadakou wrote:
>>>> --- a/xen/arch/x86/emul-i8254.c
>>>> +++ b/xen/arch/x86/emul-i8254.c
>>>> @@ -34,7 +34,7 @@
>>>>   #include <asm/time.h>
>>>>   #include <asm/hvm/hvm.h>
>>>>   #include <asm/hvm/io.h>
>>>> -#include <asm/hvm/support.h>
>>>> +#include <asm/hvm/save.h>
>>>>   #include <asm/hvm/vpt.h>
>>>>   #include <asm/current.h>
>>>
>>> To be honest I'd prefer if only the HVM-specific part of this file had
>>> this new #include (and ideally the other hvm/ ones would move there as
>>> well, but I can see this being beyond the scope of what you're wanting
>>> to do).
>>
>> Ah I see. That's ok. I ll move it in v2.
> 
> After having a closer look at the code, I think it would be better to 
> leave it as is in this patch because the struct hvm_hw_pit_channel 
> (declared in puplic/hvm/save.h) and the function hvm_get_guest_time() 
> (declared in asm/hvm/hvm.h) are used by the common part of this file. 
> And I can send another patch to cleanup the headers in this file.
> Unless you insist.

Oh, I didn't recall it's this ugly. We're indeed using a HVM-only struct
for PV here as well. Your change is okay then as is:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

