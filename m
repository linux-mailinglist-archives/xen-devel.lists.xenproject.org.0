Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231F169794F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 10:51:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495807.766231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSEQz-0006h2-CD; Wed, 15 Feb 2023 09:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495807.766231; Wed, 15 Feb 2023 09:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSEQz-0006eS-9Y; Wed, 15 Feb 2023 09:50:41 +0000
Received: by outflank-mailman (input) for mailman id 495807;
 Wed, 15 Feb 2023 09:50:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSEQx-0006eM-Ro
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 09:50:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32e650b4-ad16-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 10:50:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7171.eurprd04.prod.outlook.com (2603:10a6:208:19c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 09:50:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 09:50:35 +0000
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
X-Inumbo-ID: 32e650b4-ad16-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdhl2co/NCSjELnfPgyFZ/9hOT1Mgmtbi+46GOPK//CITGSe9SyGAS3vqHywM6eVvi5Tjv+7KTpx1ccERAYVnsNt0Ps4+uVSDTwLFhtA+0jPIvKf7P0YE7Fe8sr3bZF/u0rJ8qZSI9KVMxvMdlpCCfS4NYiSbcj0zs7Yi1rvGLfw0NSvMLhHDyQmZvHy+yexK215XxiSXMkPLeUuhlJK6cuqPuTDpChfLhBFdt9ZsNyfqttD1OxGGZXkuV1D5zfmL2pi03WuHNmxBL2583bgNCpfZNHpk/9XXBM6FRUGocw8DBdwJDa/MNFqVt9eFkW/TztQR1eVOJBy4J2GW6uMiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d030QJs/paEOjeVj5QqAFgq32VGncikkRdJnJ397mPs=;
 b=lC6MCsWW9X/nwBvOEzp+OJlKdZXimxN+4QHhhxBrSuhiE1mIxEJaeQge/3CTwN7GdyHfPmUA4GfRcVD4DObOMQu/H+6bzqzH/LDuCD0ienUeYSlozuhFzsT0fBMotvVuBJGbjFEdjStwxKUvjSjnwL26+YDWqRwxBpRKuSU3nNGHA7FuALkyfo4TR9sA+u7at6lONRxzY4NCEnvdPdsbLdPLmcAyPcLxlMN8UycGvaO/IAgcGygfjEVf9qG3VtbL93UF98bE/7bypEJilMc5EIhwoQMGOzaI+IB8XAM7GsLVlKekxvLj6NtgmCT3+FkNXdebZgGDuuwIyLCp8w8AZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d030QJs/paEOjeVj5QqAFgq32VGncikkRdJnJ397mPs=;
 b=ahL268a+0LIb+LapZdFyAwAQ7aNsCllupxYF++7tg54qIdprg+59iyvXPV0d8zoYEFbExqWm7CNhsb1mB0L+FBsocXloKzKB/Hp73M4SFVY2MiTU0FKfkqljhLJcbntZ8hU0q1un5l+mTnUGscdUWrRu4rVAdsS18N2ExqJ3Bm/etJmIlHVsQ31VMpG5NK1bHgHD6dKnlXy5+acl/Yl/PFxpudCrt5uP8DAwxWmeXaNdPVtJBhV3KWiPRskdOZ2kyzfbHzU37C6F6nEG2hq5CJNOkZXXXF5+kpxf6GeYHZXW2cd5gelGc88UXUmIxGJOKC/ut+iqOiaWAgxSMM3zCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2981ceec-030f-12cb-4b86-b7fc1bc928fd@suse.com>
Date: Wed, 15 Feb 2023 10:50:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: HWP and ACPI workarounds
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
References: <CAKf6xptjWKXYeUX2yua6nsSnJOwOWOfU3TBxEQ8YC1tewvHJkQ@mail.gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xptjWKXYeUX2yua6nsSnJOwOWOfU3TBxEQ8YC1tewvHJkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da5490b-0fcb-45ee-ffc5-08db0f3a153f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NO4UbZ3VM7WXLRMmgaDFDb+LES5ewCpHQw13xCtOHFrUg3N8FTgh2mOLTFeNJnBMNRV4pMkTyid9OFT0VTuwwqgcUGK8iEeNLE1tkmbnYhFH6saOsegNeDKARMte3xndJGs9ncb8+mvNW6YT6oGWc7Vu+wKmERExaJ5GsWDwVHlktdOrcb5OFHKnZok6+9d4TBgkl+13t+z4TtoZh1SflHf+1PP/W8IDiRy/lgRS8WXrM7Csj8G/fh6MDas6A/zFnidNWvBtyaq25QKbvrV7IN4luZDJmitliBvsjk+eEq6iueOOW9BXrEc1ENY4i1h23HF8z07dFNTwLUza+6kmlP6MvRv0YB/Fd53B5yqakDH6kCDc0FHb0g5miWCbFIw3ZfGgFWstHnfawLVKEeaTKOmY8S0oHqA4q/2yyfGaiZmduu58REjpGIUzmboay+XC8vxQ64Jr/lfrVUMuQ9Lfj/dg3iJigbe9g0cxvVOaIFLR0PFU6Ayf5L+yjxScAW8jKZTD3G18LXMVc5uQsN7JJ3Uzh93KtmhNcxAM48Nn4DwSUu745mb7pyTJ9SyFSe7Rnv0pxhCTbUyRKhqxD2JdIcc8OSKBFtgtDAtO02h/2RoOoB+JJSqLRtZfseVDn07Xc48rN3PHQbFHmb8pIa+6mpeM73jPatdM5G12AquDNUAyXHxM7d71d3xeTJmZW3OAL0M9uuPiFF5p7793U2Ja/Gvl7cOBJrVVlK0r53KtGjM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199018)(31686004)(83380400001)(6512007)(36756003)(2906002)(186003)(26005)(6506007)(478600001)(53546011)(31696002)(8936002)(6666004)(5660300002)(966005)(86362001)(41300700001)(6486002)(38100700002)(66946007)(2616005)(66476007)(66556008)(4326008)(6916009)(316002)(8676002)(3480700007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MThRNXpwczVwSWRBY2FrUWFlSHJ2ZmtPRUNWbnMwN2IvZDdDcllnaTc5cUFx?=
 =?utf-8?B?ZnE1T0RaVnowd2ZwSFRKWDhETHRYbys3aHdYcjNmRjY3VDFUTjJpd2R0anhW?=
 =?utf-8?B?K1duZ3lMUHl0cTZPOU9waUZrL0xsczRlUGUxMmY1S1Rsd3VHUGJvZ3R2dFMw?=
 =?utf-8?B?QXFuWXBVamRHVVphMzFkbDcwSkJmTkZUNC9WSDZ3NWF6WWdBT0NJQ2VYcENa?=
 =?utf-8?B?ZENaRlQrZFNsaEpZSnFZSDMwZVRPSFpmdk1EK3RPeWp2bXgyZzdONG9lL3c3?=
 =?utf-8?B?Tkx5K2Jhc05sMWVEOE03bERjbWtYYzlqRWorUGJpajRZSkpxTVJBY2lPUTNv?=
 =?utf-8?B?cWxORW45L3pUbW9iMFJKZ0FYZGk3emk3b01HeWwvYyt0clg3UTYyWGp2ZDda?=
 =?utf-8?B?WlYwcXgvc291YlJOalFRL1A0NFFkUmJnSG5vUnB3QmV3SHNlK0R5c002SEpZ?=
 =?utf-8?B?d2paQlRGbDVPU0FXQWJSRjlnL2VwbUhWYVRYNHJwRUcyMGZqTTIzcDB4QUxU?=
 =?utf-8?B?R3lwM3RMTU53SFB4L1Y2bnp6enRMRFd6UDdPb3dqWjR6RXBJK0JOc01xNG5T?=
 =?utf-8?B?MXVESlk3VGE1MVJHTHFjNHcwQTd6S3dKcU44ZHV1d0o1U0FKZ3JxdXI2QXJP?=
 =?utf-8?B?N0IvMjdZTHNyTUFmRlZETldNQk4yVWc4cDRSMFc2M0lZK280QlhaSXhCcXFS?=
 =?utf-8?B?YW5zd25LVk4rblJITG1ERDFUeitlR2NNYk9DOFVXOVEvbFZQTEhUc3JORmdp?=
 =?utf-8?B?TXpRL2hLWGhUdkhNT0gyY0l0WkpNZkg4dWJKZjJSbGtaUjVoVkNFOHdwWmk4?=
 =?utf-8?B?emJFcVRoNmhBYll4MjZYLzdURDZEZ0thaEJoV25PZUlEQU0yZkpFUWtjVXBI?=
 =?utf-8?B?b01iRldhTnRoVW5PTWIzQnBXMzhJZHpTR0I2OUdOcXdiSHNCVE83c1hoTmdS?=
 =?utf-8?B?TmJ1eDRZQ0NrdVlSK01QQ0ZqQ2dCYUluVDNmVE1ON0VseU1XVmRTenpxU3Nr?=
 =?utf-8?B?cnZmVnEzOS9BSmF4Sys0THNTMUJUQjFxSTRDL0Q1R0s1WWltRUwzQmsrc2Uw?=
 =?utf-8?B?WUxQTWM2cjRDYnAxZS9CdWtjaHMvQXlXdlB1cURNSTFxczlZSVhUNmFadERY?=
 =?utf-8?B?cDY3OU4yY25CM1hmbkFZM1NHWHUvL2ZOaTk1bEpBdi9SU08vWmdIN3JZZGpH?=
 =?utf-8?B?bDVnSUhsVnBDdHN1d2tSdHNTRVZvMHBCSi94RmlJZWtkTmExMGxQYWhuSVRL?=
 =?utf-8?B?dGVrV3ZPOU1pcjlhNmtkT08zMUI3c0d0N0YzczJNREo4U29ERkpjR25KN1RM?=
 =?utf-8?B?RnBHdlhkMDZUb1JyMnFlTldlM0J3S201UjN0M3h6eFVidENIMytEQlhnazlO?=
 =?utf-8?B?TSt3ZkZFNXNwMlR2Y21Deis2Ny9ZRElrVHkwKzluZS83YnBBdDlhT1BaMm1I?=
 =?utf-8?B?V0NMQVhkbTJuQTFsekMvN3VMQUpWdjNiekpWdHQ1MThITXN0ckNMbE8yNys3?=
 =?utf-8?B?VC9raFdkMWxVUlhGOHUxVFRMcnQvVDhDM0MvQ2J1eUpnM0Vqek9xWTF4SnU4?=
 =?utf-8?B?cTR6QVZCcVk4dWRaZ1prRWp1VU9ZZ3E4Q3hXaDZtUUU5a2YzYmJ4MC8zWjhH?=
 =?utf-8?B?dy9tQWJHcEx6UUVlQTRLRDFOM0hvYlNKYk42KzZ6cmtIdERhWnNJZ3pFaWpv?=
 =?utf-8?B?UkE0ZEplR0ovamlqcm5SNWdzaWtjQ0JYdjNXR3ZwZW1tL1VBWUNYc0pKUW54?=
 =?utf-8?B?clpPanhlU0xLQ2c4aUhkeHA2WDlCT3dOQzBWakJHQ1BlZ0xTTkh2N3FQTFQr?=
 =?utf-8?B?MTAvcmQ4eWV4T1Y1bXIrQlhMMGxGSGgyKzZZRStXZG5wSzRZa2w4bUcyNFlx?=
 =?utf-8?B?bnVONUJkMGs4bDNBMjFlT3dieEVaRGdkYkpjWDFJeGRVRXVxdzY1SGRvUERI?=
 =?utf-8?B?Q2k2UUMweTk4cXZIblI1a2Z3ajVLMnJTUU9tSnNheUk1cit6UXdGY3hMRG9n?=
 =?utf-8?B?Q0dmN1lJOTlWbzBpdFFVK0dRL3RTaVNlUnA1YXdJL2taWEJTU1ZWbTMvT3NE?=
 =?utf-8?B?VFdoTW4xYktXdGtUakJWSVJVV1RCUkxHWjJUcXVwUkpGTFdoN3pyWVRxUmZ5?=
 =?utf-8?Q?RZRsQZRCREpKozEe/qn7fVnCw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da5490b-0fcb-45ee-ffc5-08db0f3a153f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 09:50:34.9748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVCkw9xLjBn2MRwDKRJJlZPEw5RBvwSxMEy3CkFPY08DnunQdicJ1bGi7XTeqWY7TRDC8tRlHx+v4Fk/KCt8Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7171

On 14.02.2023 20:04, Jason Andryuk wrote:
> Qubes recently incorporated my HWP patches, but there was a report of
> a laptop, Thinkpad X1 Carbon Gen 4 with a Skylake processor, locking
> up during boot when HWP is enabled.  A user found a kernel bug that
> seems to be the same issue:
> https://bugzilla.kernel.org/show_bug.cgi?id=110941.
> 
> That bug was fixed by Linux commit a21211672c9a ("ACPI / processor:
> Request native thermal interrupt handling via _OSC").  The commit
> message has a good summary of the issue and is included at the end of
> this message.  The tl;dr is SMM crashes when it receives thermal
> interrupts, so Linux calls the ACPI _OSC method to take over interrupt
> handling.
> 
> Today, Linux calls the _OSC method when boot_cpu_has(X86_FEATURE_HWP),
> but that is not exposed to the PV Dom0.  As a test, the Qubes user was
> able to boot with the check expanded to `boot_cpu_has(X86_FEATURE_HWP)
> || xen_initial_domain()`.
> 
> We need some way for Xen to indicate the presence and/or use of HWP to
> Dom0, and Dom0 needs to use that to call _OSC.
> 
> My first idea is that Dom0 could query Xen's cpufreq driver.  However,
> Xen exposes the cpufreq driver through the unstable sysctl ops, and
> using an unstable hypercall seems wrong for the kernel.
> 
> Can we add something to an existing hypercall - maybe platform_op?  Or
> do we need a new stable hypercall?
> 
> Linux will perform the _OSC calls unilaterally upon seeing FEATURE_HWP
> and independent of actually using HWP via the intel_pstate driver.
> However, not using HWP may be an untested configuration in practice.
> The intel_pstate.c driver will not use HWP when FEATURE_HWP_EPP is not
> found.  So we could potentially cheat and expose only HWP to Dom0.
> That should trigger the _OSC calls without letting Dom0 think it can
> use HWP.  This is rather fragile though, so a more explicity method
> seems better.

I agree with the "fragile" aspect, but I'd also like to point out that
no matter what features we expose in CPUID the driver should never try
to take control when running under Xen (or perhaps more generally when
running virtualized).

> Roger's ACPI Processor patches that add xen_sanitize_pdc calls could
> be leveraged.  On the Xen side, arch_acpi_set_pdc_bits() could be
> extended to set bit 12, which would then be passed to the evaluate
> _PDC call. _PDC is the older interface superseded by _OSC, but they
> can be wrappers around the same implementation.  But if linux is just
> using _OSC, it seems more compatible to follow that implementation.

Using the _PDC bit would look quite reasonable to me. Yet what's
unclear to me is whether by the last sentence you actually mean to
indicate that you're not in favor of doing so (in which case more work
in Xen would likely be needed to actually support enough of _OSC).

What you don't touch at all is how you mean to surface the LVT based
interrupt to Dom0; the cited commit messages looks to describe uses
beyond the HWP driver, and it uses that as part of the justification
to override the firmware choice. The LAPIC is hidden (PV) or properly
disconnected from the physical one (PVH), plus Xen's MCE code (however
broken it may be) makes use of it. Or is the plan to ignore all of
that (at least for now) and limit things to the HWP driver's needs?

Jan

