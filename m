Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2411E7EADBF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 11:15:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632305.986558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2qRb-0001Sa-SR; Tue, 14 Nov 2023 10:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632305.986558; Tue, 14 Nov 2023 10:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2qRb-0001QA-Po; Tue, 14 Nov 2023 10:14:55 +0000
Received: by outflank-mailman (input) for mailman id 632305;
 Tue, 14 Nov 2023 10:14:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ZB8=G3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2qRa-0001Q4-UX
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 10:14:55 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2054.outbound.protection.outlook.com [40.107.13.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a74774c5-82d6-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 11:14:53 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7729.eurprd04.prod.outlook.com (2603:10a6:20b:24c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 10:14:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 10:14:24 +0000
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
X-Inumbo-ID: a74774c5-82d6-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSEDar8s5kJgIKb4CqT95EKEKYg5i5FaDjRDkoAgDuw5drVqlXoe9qE/yBZ7UFho52U/DyHlPl8jzp/V6b7l2ENycZ/v9EYxW+Z+frdYq3cRW50xOMor7NNW/s77rWYr2rmhDejmirFT+1EWj34kmvFBoV5D/bAOu/fUjtObdpWRmw/85i4TxXgk7CPmqIHE2VASDdRawAOrh5Dp/efSy4RtPUgyul9zFR3ftb40wsViShWWVUzOSF7Z+Lqsr03Mbupfkjy1N5rulAYhjfKc4D8g6CpZvbYr8apCnhNngtnffNMqlXhcMVfJyrxUzt4iQxsv5OMexK5alRz6729ALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aiR8w39VYSpttCJ6qkgGJWuaLfuXf2yNj11oB8BG5M=;
 b=QvYg/TFqaq0ZvLFHF7QH/1R20acOpKA3IZukj5qjW/enfztkXjgppWz9oesGX9zFZ6bDYx15MBHF2KDlBpRhfb7WD6wiZR43Qf5W+136rdFbHWxNoTSM+JyaADEAARHWnydDi6uW7ovpPV5qAV2jBVRszPflo2DB9sIYuvHSpxjeDgthZW/rfvM97e8c5HF3Y9b/DEGWN8fQuEGOpPkA11uFos6M8kk+DTG5fI/oUsVcKiwCt4UzG+HwRXyj+pbOdzJT8XcnMcfpGtbhwvFgI+GTEtOV42ZlJjYG4nIAuMYranyy+y4uloPU6FtbsTRtZGJ4rzCKR8FLDvwzKFPwNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aiR8w39VYSpttCJ6qkgGJWuaLfuXf2yNj11oB8BG5M=;
 b=ZurEBAAzZ/PZ1kalV4OIEETu0n6YWLzlQm2udjVvHASQEXj+dxwMtxrQnrjETPbi2b+c8xfB1ilZLXAhyIYP5KBiAKGl1E70Iub6+XicBHsID6yrA4YpCsacbNcctxXpuc8O33jod17TdEDOFQruH21F4zcTO2ittdAHGzIrttu5+2ZvLtA7ifWoGnSNUrMmoJjv+2O1eUoHuLMo5q6zbLXo7ZxIlPwhAZY42gYYd74jkSE5nf4UWITzW1qxkR8KBfrxfZCQDn00KHLWq+YgReRUMmyDwA4NpXTDL5tOZI5g3j+oq4QW4qtBsBTzSXX19ahh6z98LbpSSubsEmlkDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5c4a237e-975d-f452-1261-f9fc10ef65c6@suse.com>
Date: Tue, 14 Nov 2023 11:14:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] xen/x86: On x2APIC mode, derive LDR from APIC_ID
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20231113165023.5824-1-alejandro.vallejo@cloud.com>
 <ZVJifMqOR_3zINYZ@macbook.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZVJifMqOR_3zINYZ@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: da9f67cd-bb2b-4b9b-ea24-08dbe4fa7a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XC0SKiIC7l9udawIYf4omQuRDtudCz+PHJ8G9CP5D0/vvLIo5XtWIzeXiHj2icNht5bbRaq2e4pTx3o3dzv4RNL5Uc6OWOwAeQt1aEpeOIRrnMNrz7Yj6RxMY+LD53e9uYkohXKQkbM79iKjcZyNt0YkYNsKMbVqUkJ5CudNfHIfgy+tNPWOcXoieIDjyfdqZQthYnZd+R8J/BI/N446sJNL8U5PspmSNo1PpLRtqqfHxD7DeP686INiwk9PhicEVov7DG6+gLrxMzAP+Z87iT4674BG2d5VygsuQzfCstMbO46oABa/oaZveJVaqwbIWZWAetI89Ab0EijO+sdm6l7zEVufuWouJZCek5EhmRyY7Q7QfJQsrmy5QLnmr34GtXXqKFRLUIuWYgvXh6YFU1rL22e3GjU7/NId9QATjj2sUeE+EDpLaH12ZOSZ3xzUqmuG/Y1jVmzygVJ7fKMq+isTX6x7ObLGf7nXKV72pxySK4j6AgOdumU75QPi+KhPCMPk2nubS4Th9DY1IM9w1RNJFAp1iD9OppXOJx5xGweOBLj4O+/gshJDi8ZnpSrhcnPJJdE1Cj2BHZV7A2zSUgQda+4XhRHHQBVCulu7xEe4OMKwPEOMdCh6mMiE11RdqH2Nbpb18XFUQi283N5e208Y5ro0glMgakgoY3vHiFaIqrjPij3O5UK69FMCgCtN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(230173577357003)(230273577357003)(1800799009)(186009)(64100799003)(451199024)(2616005)(26005)(53546011)(5660300002)(86362001)(2906002)(6512007)(6506007)(38100700002)(31696002)(41300700001)(31686004)(54906003)(110136005)(36756003)(66946007)(478600001)(66476007)(66556008)(6486002)(8676002)(4326008)(8936002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDdPQmgzb2YwOW1peTdMU0cwT2tNbkZHbHZRdG83bzZKbTdvMzJkWTNZaVhK?=
 =?utf-8?B?TCtRVFRLSnQyTWNEbjJCMkRpdzNFRGFCYnRoTVplS0NHbTlLVG5MUCsycVp4?=
 =?utf-8?B?bG0waU95RXFpV0ZUNEhXSE9tZ3RGZW9WYlhrWTBWazRQK1VodHN3S0c3U1ZZ?=
 =?utf-8?B?NVZ0ZW1BZ0p3ZmNuUG4yellHOFdGSDR0TXRkM014MzVEVWpOQUYwWGxCVXBj?=
 =?utf-8?B?Nkx5T2h5MUphRE5RckNFUkozK0RuR2lWdEs3SmxjR25uQXZMcDlDcWR6ZjJ5?=
 =?utf-8?B?S2Vjc3pHOFNia1BXalhrRUJ4Yi9CRjU3WitmaGFLeGVEZkprK1NvaS9ZL0Mx?=
 =?utf-8?B?cjJINHJodkN1eXRxbnFIZ1NBSjFnOTNiQ3grRGMySkFpaDBQM2dQUnFySERk?=
 =?utf-8?B?NHFkbm9SS1pzK0JiUy9PRUQzZFNSZUNXS1RjTTBtTC9BRHhYN1loNE9SOXlJ?=
 =?utf-8?B?cEdLMDYzTjFUaFlQQ2JlTVg4OUdiWVJZR3k4OU9POTNKSFNVMUxUS3lwRlJy?=
 =?utf-8?B?QmJoaGlwdmkvU0YwdmN6TkFrSm9jSm1yaFNoTGt6ektXNktpQ3N5OGVHSlZQ?=
 =?utf-8?B?TVpKemFmVFd1QW1tdkE2MVV1MUY1UHdZYVFYeCtaMEpuS2djYStVMENReXFu?=
 =?utf-8?B?a1Z2U3JnUzN1aUlNd1NpM2M0Y2VFV1paNnI2V1hpNWlxY0xzcVhkekdzbENm?=
 =?utf-8?B?QWNhRWdnMVAyWHFHd0tFTXBacm5RVVJJWENqME9KdW8rM2FlcGhPSkxabzg2?=
 =?utf-8?B?eFN2cFBpbWtwdlVBYlRsM1RhK1p6TDRxTzdER0EyYnVjWlJnRjR0UThRVWJs?=
 =?utf-8?B?Mzk0Q0F6NUJjTWZWcExaR25kdSt4aUZpazJRRWdqUnowTjBhSzVvUWZGa0Fo?=
 =?utf-8?B?MjAyL3VrUE80bm42aTcwZEc0RTkzbEhhMFk5UmtZeUlWamhYWmxHWmp0WG55?=
 =?utf-8?B?SjRIeDNhWURRUnhIZ1NRTGt4dnR5Z2d0MkNOMzlTYzhHVHlEWW9aVUxEakdM?=
 =?utf-8?B?NEdPVmVSZE1YSW1uUTFNTlUwWHcyL3pEOGFpNzZBRVZCNVp4U3FUdFZYQWJi?=
 =?utf-8?B?QWVVY2RsQU9FUVRGakcwZk51RnYyUzBCLzNzeENneHNBUnF5cm5sNndEMlZG?=
 =?utf-8?B?OFpORXB3ekFqRWEvTXhkN0gzWHNMOUJWSFFlWTF3MXhjbEIyQzRPa1MrK3ZS?=
 =?utf-8?B?T2VaRjRHQ3hRVUhsVkt2YjJmNDFlcHo5OSs3TUx6VkNXcVo2T3hOaTd5NUtr?=
 =?utf-8?B?MFc2ZGJ3WEh0d29keFEvN1BXNU4veEoxWVo4VEZwQUxlbWUzU1ZVZmR2MHF4?=
 =?utf-8?B?ZXJPU0E1MXZSOU9TcGh2V0VZdW1YZTdoSXZ4aXN4TEUvU2pMZVRoSy8reHRI?=
 =?utf-8?B?d2oxM0Z1ZUdJZjA0S0kveW51SXVmb1VkLzhHMVkvK2hrVlZ4UERodU1QNEpU?=
 =?utf-8?B?a2JIenN2czRqWXlvTDRKUlBlamtyc2VmdXVyLzZDd1dXZytLVUNJcFRaZWNn?=
 =?utf-8?B?dzVkaUN5ZEh6MTNoSWpucjk0dnVDNFZIaElqME1kcXBuWmdKYTByOUdjSFpS?=
 =?utf-8?B?QUxQMlR6OUdVVUdRUEVXMi8yc0RuZXFrUE1oRCt3Y1JjSUJsUHdyemFINlpi?=
 =?utf-8?B?bVZjZnNkRVpCdjVBR1JtSDNRU2JBMlBCTkdrUFNHVGVVUC9xUU1WNUxKWEty?=
 =?utf-8?B?S3pkWDJwekhkMkcza0h2MFFhekkzb2VrQ0MwT3hqeGhrUjRRY0dFeHN1aE9u?=
 =?utf-8?B?bEhIbEtJd043Y1NUZ1dWZ3hrQjhwaEgyc0hSU3c1cS9vd1ZXa1lWeU13aEhu?=
 =?utf-8?B?d2Z4Z2pDY3dHWCtVSUNVektVKytLNFZEaXdEN1p5aVRCRkxiY0NtQzZLbEZJ?=
 =?utf-8?B?TmpMUFIzVWd1Y1pZRHltZXR0RVlkNlBjN0NBN0o3TzZlc0VMSFZWT09MaUVV?=
 =?utf-8?B?d0tFdE5MVHJCQmxuZHA0SHhPSk1hUm80MEFYVWJ4T2FQVUcyRXNHYVEzeTdO?=
 =?utf-8?B?Y3E0NEpFeGU5ZnZqOWh6aVNQbUZHU21EQnMxTzNSa04xU1pVRmVxQUtBUUdY?=
 =?utf-8?B?MU9ONjh4R1phK3M1em1jdUNlWHlvcVlFWEhxSEJ6THhhRkhhUU8vK21CcVho?=
 =?utf-8?Q?ZB2rfkLva+7crj+G7aOlUmgao?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da9f67cd-bb2b-4b9b-ea24-08dbe4fa7a36
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 10:14:24.7583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8IZBDo+fUmwetEOJHak+kqhYV7ay9hK3RpS+a3yncPfiuqZIz/caD5Z+hyyaC1zQsIvNcZ7cuGTBcXbOZadGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7729

On 13.11.2023 18:53, Roger Pau Monné wrote:
> On Mon, Nov 13, 2023 at 04:50:23PM +0000, Alejandro Vallejo wrote:
>> Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
>> registers are derivable from each other through a fixed formula.
>>
>> Xen uses that formula, but applies it to vCPU IDs (which are sequential)
>> rather than x2APIC_IDs (which are not, at the moment). As I understand it,
>> this is an attempt to tightly pack vCPUs into clusters so each cluster has
>> 16 vCPUs rather than 8, but this is problematic for OSs that might read the
>> x2APIC_ID and internally derive LDR (or the other way around)
> 
> I would replace the underscore from x2APIC ID with a space instead.
> 
> Seeing the commit that introduced the bogus LDR value, I'm not sure it
> was intentional,

Hard to reconstruct over 9 years later. It feels like Alejandro may be right
with his derivation.

> as previous Xen code had:
> 
> u32 id = vlapic_get_reg(vlapic, APIC_ID);
> u32 ldr = ((id & ~0xf) << 16) | (1 << (id & 0xf));
> vlapic_set_reg(vlapic, APIC_LDR, ldr);
> 
> Which was correct, as the LDR was derived from the APIC ID and not the
> vCPU ID.

Well, it gave the appearance of deriving from the APIC ID. Just that it was
missing GET_xAPIC_ID() around the vlapic_get_reg() (hence why LDR was
uniformly 1 on all CPUs).

>> This patch fixes the implementation so we follow the rules in the x2APIC
>> spec(s).
>>
>> While in the neighborhood, replace the u32 type with the standard uint32_t
> 
> Likely wants:
> 
> Fixes: f9e0cccf7b35 ('x86/HVM: fix ID handling of x2APIC emulation')

+1

>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> I do wonder whether we need to take any precautions with guests being
> able to trigger an APIC reset, and thus seeing a changed LDR register
> if the guest happens to be migrated from an older hypervisor version
> that doesn't have this fix.  IOW: I wonder whether Xen should keep the
> previous bogus LDR value across APIC resets for guests that have
> already seen it.

That earlier change deliberately fixed up any bogus values. I wonder
whether what you suggest will do more good or more harm than going
even farther and once again fixing up bad values in lapic_load_fixup().
After all LDR being wrong affects vlapic_match_logical_addr()'s outcome.
I think one of the two wants adding to the change, though.

Jan

