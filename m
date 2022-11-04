Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352A2619278
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 09:11:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437386.691734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqrmY-0006b5-Ew; Fri, 04 Nov 2022 08:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437386.691734; Fri, 04 Nov 2022 08:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqrmY-0006Yi-AF; Fri, 04 Nov 2022 08:10:30 +0000
Received: by outflank-mailman (input) for mailman id 437386;
 Fri, 04 Nov 2022 08:10:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wJf7=3E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqrmW-0006Yc-Fc
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 08:10:28 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150083.outbound.protection.outlook.com [40.107.15.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 233caab6-5c18-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 09:10:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7129.eurprd04.prod.outlook.com (2603:10a6:10:127::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Fri, 4 Nov
 2022 08:10:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 08:10:23 +0000
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
X-Inumbo-ID: 233caab6-5c18-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7kJofI5h4Xc8ljf1gfOsuwFTuu0oB4KHYRwRVA7huJQj7Z3uut1cOCalTLbJxuhxvZXny3CspNY/2n7x6XCDZd/zM5cVhp/KyWJ0WbDKaROKNqA1swY8/UbZ1EGNEFNVWVT78GTq+gx9ZFBrVf0kcboy5cs4j2jvxOqiZnheSDx3g+CPsCFad61SyMmzycmn8Rjgv7+ADo1Wv7gCRa4KaBvr0lQmStrMEjuH26+JDXoIBHRgl/gFRzsAL5dyQJRYpHCXSjAxsKYxA/jD87ErD9OPtRJD1N/hdbCZRRJq6XHHZ6hGpVcBv44zWSpXrjkrNWzoLbaBTJUEdJ0pKFizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IEdaHYMGuJODnXkwERiUpE0qdQq3pZlyBELl1ZOlCw=;
 b=BSvFnJ7Q0bsVIo2uzaf+s60nFhh5iyneIUS18CBBHxMRgqiZkZV6APfQmzOaXXUhmOBlwPq8O1H3j7LrkBfAOJzpRomxw2VAALq9yRjHQtdjQJdUWzhiN3OC5eV0HNuf+MP6gLbNNYLR6cP5ViIOjN7LFOzQ2Vr+ecPpdIzucCOinx97UUAJZmdItmv/YLF6tvHrOk0d4DXnOncEcQ3z5fvjAGxEGpI0EZh0s6ZHrhxAhT8L3pCZtfbZaT5FWDZrd6o03h6ZC9XneR60M3YIWuD+GJrFms5Q52PDQ/Qe3S21xPUGGxpjOnNU7pmpXewdE0Ihn82Hz01db/4u7qIsIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IEdaHYMGuJODnXkwERiUpE0qdQq3pZlyBELl1ZOlCw=;
 b=LibIC3rSQKAwovEfQdHe4W37uiG+FkLe4yBKIll7663t1JpvY6QmBPZ/vkrH8noFQONeKCc+wR3Y3sGFP12K+JHLNmdXcEjO7R9GdcfZyzeH8BPt8xYfDqsbs/1JePXYj3IqnTsEGOqLwBJT6uWNfDSDs4GZkPsvSJx50m2oYEeQAIwmu1A8f3sYw93HdszQUnBJRLcuDeQ/WdHJp5NQl/NboeNNMRJ6la9rSidS78aaQQEnsRP657IY8XyNWDoh2lRWDi5nC8FF+72r55ZBxyiLpkyWRMD1qzh0YaSyvCHCrLYFsi4YTZ+rS9eJhEj+24Dgg/iAiyNhTwWsBcBRlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <952950b5-33c9-6872-0cc4-6ebdf1e015ca@suse.com>
Date: Fri, 4 Nov 2022 09:10:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v3 1/2] amd/virt_ssbd: set SSBD at vCPU context
 switch
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221103170244.29270-1-roger.pau@citrix.com>
 <20221103170244.29270-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221103170244.29270-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0309.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: 80df8f39-1908-48b7-7ec5-08dabe3c0632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nR9Pj5paz7qtNuocAjscl0o3iTjzl6kMkoE/5sbv1RXGbK+7OSlHsz0x2yMeHV7VXV13FbeN2IklTOykliyHjAEmu0cot7UeBY6yjf1LlAyXZXD64ZajuXwAHxyrZPv62k2ySwf8/qdbSFej/kEOyovy3F1TwAeZaFzHjXFVhrXa/HSgiTtPEQ4BrsdAIvxLS3Y5b5dFvj4eXD4rmjpWzqbBxt6dKgcEyahyVtdWRTbr0N4cqlv1R3d0qxpXeTK+HqjA1FIk87nwKdEGzyivh3aj+GD4U2a5mCAPJRN28oqq7KbaCybwut/jlpGHYFgmg3EJKMonmG2QJzDtZ6LKf5V35navTHN2pxcqMpKZ57ZuepPTP2sqrJ15Z8AzmK7EvNAMfk9qY6Gl104XsBXnPb65qf2+bw1gzCKRdX/7Zmy9jX3u1vnH2ZD62oFyToEpqK8gsZ5RZnCLvKIyG+qtHE4HDzLiWm7C+Zp9avXMM/RkkjB2F1e7en7P48KnaC3DOK4xvr6lFLw+gwLlN4demX0qgmMnFmLqytJTBNQpl429nmm1zrN7pC2EJbARbkYNU0do+X4gTaKhMUf3U5xBl37ivXQNDS7J0LxYoHIHuA3lNKWJVUkoef9mpO9d57gEYvpiRL5cmLA2KAGz3SVfJYkTktF0Mx1u6usRa485oErKHtH4Uqg4I2WmTa9uwTz6Y4VXKUIJrssoO47qdC5EX4Mpa36DrEZswDI0fR+7YN9HdBkU9AB2U7idAg/lH3yet9vtVmngoU1/xiYzRq00YnxPLADoBKerS3LVeWWYkBI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199015)(478600001)(66476007)(6916009)(54906003)(66946007)(66556008)(86362001)(83380400001)(316002)(38100700002)(2616005)(8676002)(31686004)(31696002)(186003)(36756003)(4326008)(41300700001)(6506007)(8936002)(6486002)(5660300002)(6512007)(53546011)(26005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXVzZUl1K242aUY0TkxqS0d1TWNDdStiU2RIUTR3YjU5NFFtWjFhcUVqMFZF?=
 =?utf-8?B?MTlUcjhsRHFwaHN6L0c0dzk5eXRrb0hwcENnTm1oeDJiYllXOU1NNDY0MlRZ?=
 =?utf-8?B?V1dCKzEyTEhuVThlbCtmb1V2LzZ4bHdLK3N1akozTXpaTnBIM3Yyclg5UkxB?=
 =?utf-8?B?VnZqZmxwZVAxMWd1cENTM2NzNTVST0JPR1JPOHdNRlVNbndHMFBJUy9mUXhP?=
 =?utf-8?B?ZUFBNklrSCtXaER5dEQ3dkJpbHNEeG5JZlM3cGxwcjJjM3F5Wlh4SDAwRUFP?=
 =?utf-8?B?aDBYUXFkU0pnWmw4RUhZT2VGdlpLMXp6T3BLT2RFN1g5S2pkbG8xK3JHYXZG?=
 =?utf-8?B?VlBJeUF4VERsUjhpdzlKUzRYM0VXcWRzUnc3TkxMNWhCbXMrUmdZcTJtU2hm?=
 =?utf-8?B?eFhqY1RCRlZwK3ZVZ3Q0Wko2ekdUK3RVSkZPZVorY3piNUZ4V0Z3RlJTdlBI?=
 =?utf-8?B?aFQ3QisxZnV6V0oyUjd3K0NMT3J1ckZJblFyWWQ5dERqN0VmTmxZMzBtcUNI?=
 =?utf-8?B?RVR5ZlVnczRURUM1V1BDL0ZQOTlUOENRMGIzWkpiQWpmTGVGUVJ1NGFYdnky?=
 =?utf-8?B?WksyNXM2dG9pWVhtZHVwL3VqVk50NWhtNC9SdnE3Q2pTRUsxdU1aUVMzaUU0?=
 =?utf-8?B?dXNpdHp1UExjWnVWaTdPNlhnV2dPYUpqdVovNUxDWnJFSzhtVGNIN1RqdnFT?=
 =?utf-8?B?b1ZTN2RhRnY4NytuRlZ2bkZvbFc0bkVzOG9YcUtjRjRFejR4L3NkMEl6amtl?=
 =?utf-8?B?RmdyVWZ3RTVEZVZMTjhEVkhoWDd1L3dqYnVjVjlHRzlpMTRjVm5GYTVKSjZC?=
 =?utf-8?B?QzNXSHJFOWFabGZBOHVFcWQ0bkpTaHdFQ1VFMTFpUnBnQlVJU2s1QXlDNWpy?=
 =?utf-8?B?d1V4RU5sSHJUR2JjSTRKcUZFTUVUU3hPM3FlYkhHendpSDZKbXNWQ2Y2bDFH?=
 =?utf-8?B?M2M0RzU3Rk1YY1dnaWtoUFdSY25KUDJHeUhCWUZKVWRpRC9EazdsRkJkMkxM?=
 =?utf-8?B?RjA4R3JFTHZGclgrdlNWYVNoQndWM3lOVGpPVDFzK1lKNnFWNEVsTGgwRW5a?=
 =?utf-8?B?ZTZSbWFEdmtsOXJ0eTkvTGk2akwxeTZhdlYxQlg1NW41VlEvTmFTSUZ1NlZk?=
 =?utf-8?B?MjlIcDczUWRxcnErWncwS2tqWWQ3RzdzSFNVR1NneTZITGJOdnM3T05MeFFw?=
 =?utf-8?B?ZXl5YTFVbVE1ZmprMVpyV3VWQjkvRzQyc1pvaDdMQlRqcERMRG1TaEcwSU03?=
 =?utf-8?B?MXV5ZnJ3aTR6M25JanFTVloxbHZYRWsrMmxvV3V5VHRBYVRyLzlJeWVaeFZm?=
 =?utf-8?B?RWtqYmQ2QXErdzJUUWtEdGRVQVBVQ1YzSFFQNFc0MEZIMHdZelRzQ0VaV3g4?=
 =?utf-8?B?QXVrb2RRMHJxYlpQUUJ5ZlBITmFZMlZmMG4yb0pRK0RvYnZhU2crenZQdnBm?=
 =?utf-8?B?cFB6NXV3T0tiSlM5a2FRTkRSZUM0MVZzSkwzOVAwL0xURzd3cWIrNFJpUkQr?=
 =?utf-8?B?ejl2SUxUNDZxY2V3WkswVWVaWjVZRVozaldLQlVZNDRZSndzZVlybDdNMGtj?=
 =?utf-8?B?cWFUQ2p2bzlRM2YybVVDSVl5UFMzMHhKWFBIL1VRT1Z1SSs4eUJURWx5S0tF?=
 =?utf-8?B?U0dRck1lb3I4WDdnUW14akdUNzZDcmN6NFhXbnlnRnZBbE9qQ1pDcWsrWTda?=
 =?utf-8?B?bEFOa01UN01Kem5rL3dieXpXdDk3ZGowVmQvOE9OYnFOVmorRFR5K3NoazRr?=
 =?utf-8?B?Y0dLMDFDeHo5WGJzSVM5T1FCR2Q3WTB5SVZwNXBybXA5REIwNmJGdXVqNkpI?=
 =?utf-8?B?ZEhrcUVzSlpFQm82NGlUcjI0dHRoUWk1WVVDd1lRbTdWMzd3WWl2MXpHOVpK?=
 =?utf-8?B?TWVMSTNLL1ZzMFNuQ2l0ZUViVkllVThpTjhEcUJCYkhKNFROZHp5dEx1SnAz?=
 =?utf-8?B?TEprUmxGODY0MnhsOXhJT29DbHhPTDV0aFdZdWpTenUwbFFBTERUYnVKYlFJ?=
 =?utf-8?B?NzN0K2ZPa0xSZlB1b243SkgxQ0xSaGJuWTE0clpKSjhVMllCV3R4VUE5dlpa?=
 =?utf-8?B?cXpNR1RtblFXOTlRbUpIamZXRXErdzVleUZYaDFvMTcwam8zT014c0xheTdI?=
 =?utf-8?Q?GCOOZdizbYxtZRr0osFH7av90?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80df8f39-1908-48b7-7ec5-08dabe3c0632
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 08:10:23.8884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJDwBL8cox+Wl0veK3FGllRuzim7ct8F2bNf2upNhKXxt0TnFOUM90/i8aBMaf8msX8WVB9WEV0j6dRHb15aww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7129

On 03.11.2022 18:02, Roger Pau Monne wrote:
> The current logic for AMD SSBD context switches it on every
> vm{entry,exit} if the Xen and guest selections don't match.  This is
> expensive when not using SPEC_CTRL, and hence should be avoided as
> much as possible.
> 
> When SSBD is not being set from SPEC_CTRL on AMD don't context switch
> at vm{entry,exit} and instead only context switch SSBD when switching
> vCPUs.  This has the side effect of running Xen code with the guest
> selection of SSBD, the documentation is updated to note this behavior.
> Also note that then when `ssbd` is selected on the command line guest
> SSBD selection will not have an effect, and the hypervisor will run
> with SSBD unconditionally enabled when not using SPEC_CTRL itself.
> 
> This fixes an issue with running C code in a GIF=0 region, that's
> problematic when using UBSAN or other instrumentation techniques.
> 
> As a result of no longer running the code to set SSBD in a GIF=0
> region the locking of amd_set_legacy_ssbd() can be done using normal
> spinlocks, and some more checks can be added to assure it works as
> intended.
> 
> Finally it's also worth noticing that since the guest SSBD selection
> is no longer set on vmentry the VIRT_SPEC_MSR handling needs to
> propagate the value to the hardware as part of handling the wrmsr.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one further remark:

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -973,6 +973,16 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
>  
>      /* Resume use of ISTs now that the host TR is reinstated. */
>      enable_each_ist(idt_tables[cpu]);
> +
> +    /*
> +     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
> +     * is already cleared by svm_vmexit_spec_ctrl.
> +     */
> +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
> +    {
> +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
> +        amd_set_ssbd(false);
> +    }
>  }

Is "cleared" in the comment correct when "spec-ctrl=ssbd"? I think "suitably
set" or "cleared/set" or some such would be wanted. This could certainly be
adjusted while committing (if you agree), but I will want to give Andrew some
time anyway before putting it in, to avoid there again being objections after
a change in this area has gone in.

Jan

