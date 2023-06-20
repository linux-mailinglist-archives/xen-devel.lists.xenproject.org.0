Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7028A7363D1
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 08:50:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551432.860982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBVCA-0007W4-DF; Tue, 20 Jun 2023 06:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551432.860982; Tue, 20 Jun 2023 06:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBVCA-0007Tr-AW; Tue, 20 Jun 2023 06:50:30 +0000
Received: by outflank-mailman (input) for mailman id 551432;
 Tue, 20 Jun 2023 06:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBVC8-0007Tg-Sw
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 06:50:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd6990c0-0f36-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 08:50:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9522.eurprd04.prod.outlook.com (2603:10a6:10:2f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 06:49:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 06:49:56 +0000
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
X-Inumbo-ID: bd6990c0-0f36-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSDnKxYAlYnI+1QA2Ffco1Xrfu4Rtpkm7Iqz8wYCRUmF+tr9YEncRzuQyoFugnqZBn3gVygHMSgqCmGn40z1SjgI7dPeyQQIVFQZ+g9Uk6lA/kkeZPewZ9ZhQnVNmZ9WI5ZMPOXbonCzhRwKnxJRWiuONumALYp9ukVIpv9TOynflPXtnfa4NI2t794UWAorVL6jb0AId1e+LNXs65VMntwZYj2sDCb8t5uMTgUOTQrtxfJ9iiJ701RFXlrjM4kh6/uw8Yx62A59HtxsX/RzHd4HCN75AurBYYS3dNtaRgoCt49Utsd8DLh6l4fLq4hklQC7o+xbMXKtBueSVdo9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2e3EkSPhpvkiYF7A1yZfXWo8vj60/0NyL3eenArTeM=;
 b=n/x5CkCihxey1sweykJDgoDXZcyrGpqNRPXFre/suhSL7lvRdsSFrQNyXQY+PZ/BjQ680XraX2HqG/uXv4VOC4G3oE+g2MpS0v+6rCFcoj1THJmKo/ZMTj0FCg99+2IyhyweJyj4wPENAcOEeTbUFlJrP7v0jZoWzc4YhoEFQDXZG6sup1p2/yG3u7a6zcGRC2tOXk8wC3uGqXBfCtWeYQrdCJL1OswOQTABuw7HRiI6mJB/DbXaqppzczmeJyFsEWpjUgxO33ysko0Dj0dPajtCD4Rpox5WAj4xDDQhHXlournoz8mW1eOh1EcCDJ6EFO9EQgb//W88qmYdM/S4Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2e3EkSPhpvkiYF7A1yZfXWo8vj60/0NyL3eenArTeM=;
 b=Rbri45lj6yDIZVAwIHXURAdSIykAX4ACg6hA4dtpFObPWDDDT4TiSqBXmgmCWofaXaSU0UjS5yqFG9CXKtGevvrT0vgZcrSGUiOTLQ2E2O6jZNOVpQUKnClZvv3TkPlvFAmdia/Oiv51BZXQQn6eZceJSrXPkmZbvNGEQeYFJ++FoRIetjO/cECxWNhFzEDQpQr3DlhyF/BKfjbq+/nlBYCOWCnpvFXmtHf0N7EFYrbvgGw6u2tj6f0FBDxcAWeKbsmAzTfUGE4Wtikr7757+clWXu0BuTntZBmEUv+En2OlnjKMKrJbm60Jp7LnauGO7cpe/qpRfdGmrrNyf2EVmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7d36c50-719b-018e-2e9a-0cc61a678a9c@suse.com>
Date: Tue, 20 Jun 2023 08:49:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
 <8383dd1a-064c-17c9-bb7f-4509518b9b42@citrix.com>
 <85e5d7ca-e6e1-3802-22ac-5728a03fd86d@raptorengineering.com>
 <9258a65b-c980-9b0f-e704-c51d83db4ce8@citrix.com>
 <059e5cd2-ed7c-769f-5418-e4224e18881c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <059e5cd2-ed7c-769f-5418-e4224e18881c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9522:EE_
X-MS-Office365-Filtering-Correlation-Id: 05a6b8d0-f39e-4994-d0f7-08db715a8f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ybBL+CjkGTECrz0nEKUO04F/patoKbVn9Qlr4t322N9CfB/COdZx2eOk3iCx1ghCavYXYhHtaLcUVyt1znHpDyHDKAoPRUty+ZR3v9fSBv6xmxDK6VpnzPmhGt70LSmt9IF5OyKx0Fgc3lOD1jGmTvjTODeLqjWSScWLzaeNyq0pxdFIx9AjoOhkUClhH0a55EJbOdxtvpsV+4UGkXfxs4RrYk0AXR9a/XzFlNjdBy40GsvpcYbjYMF0Zpode8Dtp2EHn/IgYmHKM64cLLJ1OQDcjV81/8VDMf7+U9IO4YWfeob3L8vw6GMLcqGQrnpdQs9EZTuTQlXDDM7LKXDX41Bal42VthHKMWiBpSzUXMcEKV6hkf16ovB+WYuSk4yvfAUSJ1i/JX9pX5KirVpV5X6nF8wd2v8lvBnzVSvOLKpz66H552zROOjsD3IM1B/f6q+FtPuX/dWjbviZvPRf2cLBgXqR1d/iD3AoAOwe7uJI1WWe75a/q06jdrkVQ1BaXRLX9Li5haME9Br4WeocJ9gNgZjULfjDSIzb/YX7WZusWOksZCFGpnnDgt80eiWWReH3TD/4BWItn2/CkguQo5Ujm1g7ZQZz9GFJe6yIkMcoWlrmDVKG8UksD29Chje0cdS6sseHATK7T+Mg/9eogg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199021)(31696002)(86362001)(36756003)(38100700002)(478600001)(6486002)(54906003)(110136005)(8676002)(8936002)(5660300002)(4326008)(66556008)(66476007)(66946007)(316002)(2906002)(41300700001)(31686004)(2616005)(186003)(26005)(6506007)(6512007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1RYOUxSRjlmeVFWZEVuSVVCNjBZTDNrOTd4c25zYXMyeHBEbjJMdXVXOGU1?=
 =?utf-8?B?QmJtQXM5MmVBMFZqcFdWMU5mV2VPT0ZRSi84NnJWVDY1Qjd2QUg3Y2Zadktv?=
 =?utf-8?B?cXN6V0NTcGtyY2FKbURFb25vK0VmVGsycWRxanhjdk10MWF4bnF0SGtZdUti?=
 =?utf-8?B?RFdGSGZhQmljZVNSSkJiU2NkUHNkQXNMZmRpTGpCdlpFeUxkWEV0QUIzMncy?=
 =?utf-8?B?SGtXR3hpanhNVmNXNWxqSkVHTHdFNHl1ZGxVZVFtaE45ZkQzbUpoVWIyNDJo?=
 =?utf-8?B?Tkk0V2gycFNTNkhQZkNtb2FWSzdWS0Z1SHdHNER2b0V4WGdvTHVtTHB0NEJr?=
 =?utf-8?B?eTZpaUhyZ2RMTDAvNFNtNjRpbmoyY3F0ZDRvUUhxTVpWc2tOUk0rVGRiWERu?=
 =?utf-8?B?Y2xYY0hxMkY4RXRYTFNLdGg0b2RnYTFxSS90RVdnYUJnYmVlS24zOGhad2Za?=
 =?utf-8?B?a0xFcm1SOEhoYUZjYklPTklIR1VCY1FWSERhZHBtVllHb2h6Um8wN2FEdWZn?=
 =?utf-8?B?RmxjMHNJeHZzd0k2bFl0VDBaaXpqU2ZoL015LzljRXB0cC9hYU5mRWw4cFRp?=
 =?utf-8?B?bEZjRm0wbVRLM2h4Z0FkVFdMeXl6ZkpTRWp6U2N0L05CQ09TdmlYeXBnMDQx?=
 =?utf-8?B?MlEzSzBuaCtYeDMzQ0xEZUp5aFhqOVkzcFlPTWhHZ0p0Y2VrZWRCUC9TeHNz?=
 =?utf-8?B?ck5oM3VJRUZSRldZSlNZTDNsZS9UYUlQQmphbmxEaVBaeWFZckw0M3J2dng5?=
 =?utf-8?B?L0dxVDBSR2l2VGlIRG54TVJHY1dScDZPa2sweDMySDNpdC9YN1dYZzJlU0kr?=
 =?utf-8?B?amIyNkZzZkxpT3hvS3Q5bmpQQkFaaUl2UTgyYTZJeUJ4eG1KZGVRWk1YWHJD?=
 =?utf-8?B?NzJodTlYaGhZRjdHeEpnQ2NOYnZYbHhGaW9HWGxwRjRBN1dqL3FlVjlqQUcx?=
 =?utf-8?B?RnhZVFhVSFEwcWRDTGl3cGlPUTdDUnRZUkd3WXNzZ3JlYlBCQWthd1VIeDF5?=
 =?utf-8?B?dkg0Q2dSWDI5SlRzZVl2cEdqNU9SZ1k3TFNlNFdESnFxNWhHOGI4eFlib3Fs?=
 =?utf-8?B?TisxSW0yTkZQSExKN2JXejE1SVBTTk9RRVA1WHRBMlVDc05rRE8yQnh0NjJz?=
 =?utf-8?B?TTkzQnh6TkVZMmV2eDNNQWdnRVQyVXI4OWdESUEvMVNSN0E1RHg3VXYxR3ln?=
 =?utf-8?B?dUFpY0FnQTdkOHp6YktJeXRoVnZCcVdYRXJBbCt4a1UzS1B2ZVo2aVZaSko3?=
 =?utf-8?B?WlNlanNPRG9GRDhwVFZXeUFIT2NvRmwyNjQ3T1hsRHVwUlIzUFYzbjIydFNa?=
 =?utf-8?B?VFdoWlF4YjFoZmQ0aFRiRlEybVpXazFNbzdyc3lBTEJPN3RhSm1sSmNLS3Jr?=
 =?utf-8?B?dVNDNUhkYXVVYmdMVnRRMkx5VFU4QTdQeDNHN2w5a2RQSzhIR01HRUlPSFVC?=
 =?utf-8?B?UzVzTEtLdG51Q05ycHcrY0grMmtFK1pQL2lmVEtWaTMzUjZRMmNuWjVtQXdS?=
 =?utf-8?B?UDFyeHYxWkNURlVNMnc1alp0d3ZqRkJvcENPcmNXdS9KTXFqdnFDKzZ6RndP?=
 =?utf-8?B?WC8rejIvUW45UDJ6TFRUYTg0cUY5MzNzdndlYWljdXppYUNUSDR0QnlBUG5J?=
 =?utf-8?B?L0ZuaEhkLzVsNWZYckdETkRJcXljcVlGQUJ2L0doV1Y5TExVRWc1RjZFcUVW?=
 =?utf-8?B?V3k5V2NLais2Y3UvYncvMTVjNzVaV2MwY1FIQmZuRG16TlpSbFpSYzZGYmIr?=
 =?utf-8?B?S0pBZkhLbWxsK2pZc0hUdis3b3pNcXZWN3pGZ0RnQ1pIK2RCVEQwWVhGZlha?=
 =?utf-8?B?VktybFF6QWpNZSs3ZTNTei94NFAvb0pTN0VpSGdoTURSVWxIUnpvaUE5RFBF?=
 =?utf-8?B?cjRuL21XU2QzRjBVM0lXeFQ5MFRLNlpqeHpNU3c5RkkvNkNOalk2S2ZLSFBo?=
 =?utf-8?B?ZDJkc0owaU82RG4wZTZMMzhub3RDZkFtUXAyUysydlVBV2hUTVFLSDZvaU5Y?=
 =?utf-8?B?VmxNZFNja2h3aUhyMCtCRFY1NXBGc09Jb2R4Slc5d3JQdmQ1dWo1NVZqVUE4?=
 =?utf-8?B?MGJ2d01BWGxCSkZQS25Ta2RBclVDRENxRmZVaHdocXo1Rmc0WUhGMTBLcTQz?=
 =?utf-8?Q?2Jyx2t9VJHk5N02FwIjbSlvJP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a6b8d0-f39e-4994-d0f7-08db715a8f06
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 06:49:56.5948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhNkTr0UwdRgPkExgbUKN82hzK6XQX9CiwC9sub5KwQOci7HECWSOmpG2SH806wnKw8lsOOJtvlVntJePpybaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9522

On 19.06.2023 18:44, Julien Grall wrote:
> Hi,
> 
> On 19/06/2023 17:25, Andrew Cooper wrote:
>> On 19/06/2023 4:49 pm, Shawn Anastasio wrote:
>>> On 6/16/23 3:24 PM, Andrew Cooper wrote:
>>>> On 16/06/2023 6:48 pm, Shawn Anastasio wrote:
>>>>> Add the build system changes required to build for ppc64le (POWER8+).
>>>>> As of now the resulting image simply boots to an infinite loop.
>>>>>
>>>>> $ make XEN_TARGET_ARCH=ppc64 -C xen openpower_defconfig
>>>>> $ make XEN_TARGET_ARCH=ppc64 SUBSYSTEMS=xen -C xen build
>>>> I think the first of these isn't needed, given the config ARCH_DEFCONFIG
>>>> default.  I'd suggest dropping it.
>>> It seems like the build system expects an `$(ARCH)_defconfig` present if
>>> you don't manually specify a defconfig target. I see riscv64 has a
>>> tiny64_defconfig and a riscv64_defconfig that are idential, probably for
>>> this same reason. Would you like me to take the same approach of
>>> duplicating openpower_defconfig to ppc64_defconfig?
>>
>> Or just rename openpower_defconfig to ppc64_defconfig ?
>>
>> Is there any reason to keep openpower differently?
>>
>>>> If that's not feasible, then fine, but if it is, it ought to be the
>>>> default.  Which might be as simple as saying "or later" somewhere in
>>>> this text, or might be a giant can of worms that I shouldn't open...
>>> Originally the help text for the two ISA config options ended in a "+"
>>> but that was deemed ambiguous. Would adding "or later" to the help text
>>> for the two options clarify it sufficiently?
>>
>> Yeah, that would definitely help.
>>
>>>>> diff --git a/xen/arch/ppc/include/asm/page-bits.h b/xen/arch/ppc/include/asm/page-bits.h
>>>>> new file mode 100644
>>>>> index 0000000000..4c01bf9716
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/ppc/include/asm/page-bits.h
>>>>> @@ -0,0 +1,7 @@
>>>>> +#ifndef __PPC_PAGE_BITS_H__
>>>>> +#define __PPC_PAGE_BITS_H__
>>>>> +
>>>>> +#define PAGE_SHIFT              16 /* 64 KiB Pages */
>>>>> +#define PADDR_BITS              48
>>>> Is 64k the minimum granularity?  Or is 4k an option?
>>> Both 4K and 64K are supported by the hardware.
>>>
>>>> I ask because Xen has some very short sighted ABIs which we're still
>>>> working on removing.  There are still quite a few expectations of
>>>> PAGE_SHIFT being 12.
>>>>
>>>> To be clear, we're looking to fix all of these ABIs, but I suspect it
>>>> will be an easier lift to begin with at 4k.  (Or perhaps the right thing
>>>> is to double down and just get them fixed.)
>>> Interesting. Given this I'm inclined to go with 4k just to reduce pain
>>> points during initial bring up, though supporting 64k would definitely
>>> be desirable going forward.
>>
>> Maybe keep as 64k for now, with 4k as a backup if major problems are
>> encountered?
>>
>> I honestly don't know how much of Xen's common code is non-4k-clean, and
>> this is the best opportunity to find out.
> 
> The hypervisor itself is probably alright. For the tools and the kernel, 
> we did some work a few years ago so the code don't assume the kernel and 
> the hypervisor are using the same page size.
> 
> The tools and kernel have hardcoded expectation for the tools. Have a 
> look at XC_PAGE_SIZE (tools) and XEN_PAGE_SHIFT (linux).
> 
> There was an attempt from Costin Lupu a couple of years ago to clean-up 
> the definition (see [1]) but this was never merged. I can't remember why...
> 
> Now regarding the default page-size for PPC. At the moment, the 
> page-size of the ABI is tie to the hypervisor.
> 
> For the ABI, it is best to use the bigger size (i.e. 64KB) because with 
> just some rework in the hypervisor, you could run the same guest image 
> on both a 4KB and 64KB.
> 
> Therefore, I think the 64KB size for the hypervisor is probably the 
> better choice for the initial port. This will avoid some external ABI 
> issue in the future if you want to support more page-size (we have the 
> problem on Arm as we started with 4KB). You would also not rely on a 
> newer ABI.

Just one remark here for consideration: Grant v2's sub-page grants use
a 16-bit length and page offset. There would be a corner case which
isn't representable (offset 0 length 64k).

Jan

