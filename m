Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C331468E90E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 08:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491579.760757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPeyK-0001Ef-Pq; Wed, 08 Feb 2023 07:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491579.760757; Wed, 08 Feb 2023 07:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPeyK-0001C3-MM; Wed, 08 Feb 2023 07:34:28 +0000
Received: by outflank-mailman (input) for mailman id 491579;
 Wed, 08 Feb 2023 07:34:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPeyJ-0001Bx-Br
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 07:34:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02f8d920-a783-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 08:34:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9047.eurprd04.prod.outlook.com (2603:10a6:20b:442::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 07:34:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 07:34:22 +0000
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
X-Inumbo-ID: 02f8d920-a783-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOZV7wYF3viDkXFCUfMBWuRZ204L6fSrLeKxDfe92yOb177hPSkvrclUGdSh96L8N6mPvNeQX47B6zg8qtFxh+hff2n7WbfAI2eEbzMsa9Sf9Tl3LfeDAOGD9BHS1/3ngkBm+GNGTf4RwjFKKu0GKSr6t9Gh586W+rHnFvSifnXlZGEWEKMsq9JrAhBXYLwicTtwjnGnzv+TeXGux4a/GTr2K8RJJdDIGANXz/+jsN48nYtGbHUaJkbXqZn18RnPCM9r8QW/g8zalGZZ6ksQlYwQ5WMuYlIuGhGVuL/YGlV7Z4hrsx4NfFNvOQvvVGdsJrloiLlMx0jOp8kPObQTdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohr2oxjexWs4hYfaEOfRQM9AJYLdjY64IyCAApzNVIk=;
 b=cVl0VGxt+kYsPxfRUeVk8TwyF3jsQVyVai6Z7SsxmV5NzFm1uYuzRLEeCKEy/CfxHtiOCoXOfUSBg0PveMUFAtsuV5xRMvQn6qLd2NtAfCSVBIBFcPyClnmiunpCSJW+/nCaM6WXX4lGiDqUuAPQViLrlwLH+rNGKEXESCo4r6Dx+/CttdjKwkDA15nJS/NgGdpbrSioN2+4CSFl3qDio4fSGv/bo08vWj9XiHJf2k98ITNtA/A8Zf1WxQ1AfFChLxZbJDurdUyeNRZ84NO97hNv4MvhkCPQHmxSTCNzEt1pNxG9pYiQ/sp+5VlXc3etGZ+tgWcnrjVKlvSfna+pjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohr2oxjexWs4hYfaEOfRQM9AJYLdjY64IyCAApzNVIk=;
 b=f9JaA4QxnfgiRfzhwMA4yeEh10+M7ZQiMFSku4mt7aY+jQyyRw8kV/ThceedvIXikdqJl6aHGt+95cXdTSUG2vp2y6BMQf8+kRZXcj7rUW6+YTGqXdOCutke4dji0qtlDYxAsQ8X8yAhDCrv1i8gdiBIMeft4XNTj6W08ZH1mHlfkbeY0L58ucweKEN+ljmialx3TOG122cM9dQwFBzr+COAsCwkBIIvbAtOAwct9bE1di4coZesoRnyUiSs+2ynTouyp+lWYghgIiwL1iFt7FTqe69tkKLo24Ld4Ut64/RRJ3A/EPFlcONqQN2rdnhdkCMHWOT1OaddHwWoD3T0mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87140c89-e3ed-46cd-f7ab-8688640416b7@suse.com>
Date: Wed, 8 Feb 2023 08:34:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/4] Miscellaneous and documentation: Only use
 TLS-protected transports
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Paul Durrant <paul@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <cover.1675829866.git.demi@invisiblethingslab.com>
 <83ecebe5c6b57713b0265fe0aeea25700f2b892b.1675829867.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <83ecebe5c6b57713b0265fe0aeea25700f2b892b.1675829867.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: dec252b4-4d5a-46ca-fc9f-08db09a6e569
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D2sGSj1K8k6x7awsC52c6aienh8hozWcA9eGDK95wHsk/6h8l0IG9IcIF/Y42bbPyPR49h43hTGCOWLwslBwTA3e9iHcbOe3XLGKek6LevaRLWnPVIC1Q5i8vDh0ypdFpV7lxeaLr/kj9fJUZSSOrLyTS0Sl1zdEVTq+qnNMf4Gm/PcHwHeI6pYkNoLv1mWUewdAL7xSTQr6Scpf62c5AZ1qbdf1xqWrgDAyvGcRG2ab/Zc/ZRhsUaqLn2cf2m01DsmrvuJHg9wF/TQEnTr+yVgITuLfcI6BOmUcN/JD2qnyAQM8IP+m3AWFCYFcG43PGTnKixeVpEUlND4FTWYZLN9arFU0ZUCjBekP9BFSxJ1RJ48PH02V6/BSrDHY1UHgA0Bl0KTBLwwYygCM/cFaCPe2qYL4giZyOTxJylFsAnrp42xCfTk+ULmXjxGyJRJGfwv5AmHLX+MX3v4eX+TQ9C2hNaKLotk2D1TBwz8vm8ShQWqMPc5XghlckX8m8dfV0g1OGWA0SKz1vmRaDLxYpbO8G4Jpv+wVtwSVOOITRDqA0PWXY83oB6gav5u5LbuZRZl2qNj0iA0WW88CoSEbar3SJHEUwEx/LJ4Jxg/0GgKZDcEKqQNDzlihWu/RMpnn/s2G0vD7rOOvEgVF29NMoOtVSrvaCEP/Q0XZJvgTEph1Ok/+LljZqbjWpFR2v6qy9PlCiV4OFUPQUwf72by6pVh0mVadIZNbvLLCE6c+RQuqzx09uSsn4E8h69y9jdZ+2zPmUn7/ohljmO8xhY+fOkSZMd3FfV6zO4gBJf+JK7ugp+L4bmu4bnlC+mD3mXDSH8KMHrOmsWM7X8z0Uvd3cg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199018)(2906002)(83380400001)(38100700002)(316002)(66946007)(66556008)(8936002)(6916009)(41300700001)(66476007)(4326008)(7416002)(5660300002)(6666004)(6506007)(26005)(53546011)(6486002)(2616005)(478600001)(966005)(8676002)(186003)(6512007)(19273905006)(86362001)(40140700001)(54906003)(36756003)(31696002)(31686004)(562404015)(45980500001)(43740500002)(563064011)(376185003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVJxQktmMlc2T2hzTXpZeDZ1Zkk5UXZJYitwS2lGbElPak01NWpvRVlvOUg2?=
 =?utf-8?B?UFVxdzBoUytXWThPZ3FmQ0sxalg4OUtDVjV0Rm5MQndIWldjaFF4YWgzekdk?=
 =?utf-8?B?RGlLSHJISzRkdm1DYytvRUN0WFVIQ0Rxa2pjemtTMk93U2phZVQ1eFRzazFr?=
 =?utf-8?B?dTFsUW5ybFlSaWtVWk9QYmFKb2N3ZFAyRm5wNThESkp1WEduSk9jTy9vT29q?=
 =?utf-8?B?RnNBQmxZWXZ6SzIrUmFDYTNKTDgwYWdpbHRqSUtzWkpPS1JlQTMyVVhOUGJj?=
 =?utf-8?B?cW5QVThrbGNkSUpCY3pVSGRXa0RlS0NsRmVHM3hFYkw2eWtzTHJBdE1JaXpI?=
 =?utf-8?B?OTNMNEVXcEFEeVVjZnRyaC9ib2M5QWtMdG0zSFhOYlI4VVQzQkppS1Vrd0dI?=
 =?utf-8?B?T2dzQ1BkWXVOVHJySHhlZjZ2a3BMUUt0WGQ0dmxWWGlCQXIxTWFKZGQwWXVa?=
 =?utf-8?B?cXM4YjBTdU5IQnEzL0tmQjBLWHBuRjJXNnJpaUFrTVNJOEVKQWp6d0lRNHVR?=
 =?utf-8?B?UTJraWpLb01SbkVldkd0Y0doZ3hDemVQQ245Uk44bE9YS2dEUC82cWFwVXRh?=
 =?utf-8?B?QWwzT3ZWSFlMZ3hUL0N5L0xHMUtFOGN6Ukt1cEh2ZlFoZmJYVFNaN2NSTStt?=
 =?utf-8?B?TldaSHZhTkxhRE9ldzVmMUJSNDlVNXpXY296djFsVlVHL1F0aEw2Y2ZxaUhL?=
 =?utf-8?B?M01LRE1mVzlIVlRIL2dselRBSUI0SGFkUDhKelBERzQ3azQ1eUttemU3dW1l?=
 =?utf-8?B?ZVEyRHBJb0FFNjJWcUFCZHVOMy9ubklDVXkzODJaMll6c3E2T2ZRWFljVDdP?=
 =?utf-8?B?NWRvOEZsbFZGQURJb0dOdEgrTXd6US9aalptRnZsUFlHY3JyK0NLRUswUTc4?=
 =?utf-8?B?TW9rNHFCbW12dG40cVJSVDhiM2dDZmJxR0J4bHVQRlhwRlQ1dWhKUWJRVnl4?=
 =?utf-8?B?YTJta1dxNnFkR2QwQUE3QzRwOWNmZXc3V2NLNXVVMDJHeDN3MVF3T3FFOHh4?=
 =?utf-8?B?aFU1N1J4OEVhU3Foa3Mvc0x6TUZuY2tweGxPMjlibDZ2VmlwZ2dFS0dReVph?=
 =?utf-8?B?MlJ1anFHOHA3d2Q4NXNpSjdJVlVyYkxoYzJLNS85U2FETkhPcmpuQ0hoNGVt?=
 =?utf-8?B?QkpXSTlJdlRFbW5PdUw1akU0cTMzRjllZmhZV0JYTHorQzBoOXpvd0VwdGVr?=
 =?utf-8?B?YjVrNXNwMmZVSHN6YmlTc1pFK0lzRks0RkJ3YzNoNGUxNEJBMWdVMCsydUE3?=
 =?utf-8?B?eStLQUZja3k2bkJxRm92NjhnT2V3WkJITTRRQ3g2NlYvNklCN3BQd21aQXlK?=
 =?utf-8?B?NHZMMXRTT09CVnhSQ2RFMklkM1phb3lBTTdjS2RLSFQzVkZIQkRBU3ZDc3Y0?=
 =?utf-8?B?amIxQ2p5MDlyMFMvMW9QV2Q2eCtsL3QvTkZlNFVadS9xQ0J4RTFZcStoV2c1?=
 =?utf-8?B?c2h3WjFFZ05TbjQ3dXlXaTNTWGhPdktMaTViR2VpZjdEeVRmZGM3Z2FPWVBz?=
 =?utf-8?B?RHhLOGhKS3RVZlMyMWNQSXFyVGRndVowMWdvdHFVZURmeE1OOG40ZjVBR25M?=
 =?utf-8?B?ellpWnhhVkM1VENxaXJLS0loNnJVRUxpaUhxTVZvdXAraFArcWZmNXMzZmtT?=
 =?utf-8?B?azhBYVhLWld3aUNPVnJJQU04UFN2Q0wxdHdLYnNGY05neXVzb1Jna1N6SmFi?=
 =?utf-8?B?V0E3QjQ3L3hRK2FoblpJMWRrRXNxaWJBRWt2Sy9jbndpY2xLNEpHdjQwekx1?=
 =?utf-8?B?Si8vUk44SkN4MVBzOXR6azY1Q0JQRzd1alNGa1lYQ1NRN0JDS2Fzamc3WmQr?=
 =?utf-8?B?bG4zVXp3dlljZFJPcVZPbGFGcXJ3bHZOVGs0SU1SQmFtWVBFbjhkTFc1K29J?=
 =?utf-8?B?YkZ1QlU0UkZLNFprTnYyYWhBbC9qZHpoODFlV2dNVTdaR2Q2SkY3dFRIdTdo?=
 =?utf-8?B?cjJXY1A4UWkwYXFLL2ZCejRvQ21KV3VuNmxNMWt6Qklpc0JXUW53VWpvU0Zw?=
 =?utf-8?B?QTgwODU3eGJObStHZGJSTTJjZUl2WlFGVkdnSDRqWFIwdzBpUmlhNFM2UXFQ?=
 =?utf-8?B?ZlpVVytyQi9JVzlMekFDQlBjUnp5MXlPMXpuR2VKeGtNaWhSVHZuRVNTRXEw?=
 =?utf-8?Q?IoXCWuSU97c0/aOqCay/Z8oX+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec252b4-4d5a-46ca-fc9f-08db09a6e569
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 07:34:22.6206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ag9s5wS1L8rrJ9usvhCeSqZGboduDJGiRtTM8fBkyOTzTN05crwixk2lxQVImdkX7gEK5jeb6kL5sgf4Er2avg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9047

On 08.02.2023 05:51, Demi Marie Obenour wrote:
> --- a/tools/misc/mkrpm
> +++ b/tools/misc/mkrpm
> @@ -34,7 +34,7 @@ Version: $version
>  Release: $release
>  License: GPL
>  Group:   System/Hypervisor
> -URL: http://xenbits.xenproject.org/xen.git
> +URL: https://xenbits.xenproject.org/xen.git

At the example of this (can't really tell whether there are others): Perhaps
a good opportunity to actually provide a correct (working) URL?

> --- a/xen/arch/arm/arm64/lib/memcmp.S
> +++ b/xen/arch/arm/arm64/lib/memcmp.S
> @@ -6,7 +6,7 @@
>   * and re-licensed under GPLv2 for the Linux kernel. The original code can
>   * be found @
>   *
> - * http://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
> + * https://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
>   * files/head:/src/aarch64/

Here (and below) maybe a good opportunity to unwrap the URL(s) at the same
time?

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -11,9 +11,9 @@
>   * Software Developer's Manual
>   * Order Number 253668 or free download from:
>   *
> - * http://developer.intel.com/design/pentium4/manuals/253668.htm
> + * https://developer.intel.com/design/pentium4/manuals/253668.htm
>   *
> - * For more information, go to http://www.urbanmyth.org/microcode
> + * For more information, go to https://www.urbanmyth.org/microcode

The original URL doesn't look to exist anymore, and the secure one fails
to get a connection in the first place.

> --- a/xen/arch/x86/dmi_scan.c
> +++ b/xen/arch/x86/dmi_scan.c
> @@ -617,7 +617,7 @@ static const struct dmi_blacklist __initconstrel dmi_blacklist[] = {
>  			NO_MATCH, NO_MATCH }},
>  
>  	{ force_acpi_ht, "ABIT i440BX-W83977", {
> -			MATCH(DMI_BOARD_VENDOR, "ABIT <http://www.abit.com>"),
> +			MATCH(DMI_BOARD_VENDOR, "ABIT <https://www.abit.com>"),
>  			MATCH(DMI_BOARD_NAME, "i440BX-W83977 (BP6)"),
>  			NO_MATCH, NO_MATCH }},

Such a change is equivalent to removing the table entry: The BIOS in
question won't magically change from http:// to https://. It _may_ be
reasonable to add a 2nd table entry using https:// here.

> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -4,8 +4,8 @@
>   *    MandrakeSoft S.A.
>   *    43, rue d'Aboukir
>   *    75002 Paris - France
> - *    http://www.linux-mandrake.com/
> - *    http://www.mandrakesoft.com/
> + *    https://www.linux-mandrake.com/
> + *    https://www.mandrakesoft.com/

Both sites result in "server not found". No point updating such URLs imo.
Doing so only gives the false impression that they are still valid.

> --- a/xen/common/README.source
> +++ b/xen/common/README.source
> @@ -26,7 +26,7 @@ The file is dually licensed under GPLv2.0 and LGPLv2.1
>  libelf
>  ------
>  This directory was opriginally imported from the libelf
> -project at http://www.mr511.de/software/english.html
> +project at https://www.mr511.de/software/english.html
>  This directory is licensed under LGPLv2.1 (see COPYING file)
>  
>  libfdt

Firefox reports a self-signed security risk warning here. I'm unconvinced
it is a good idea to refer to such a URL, but I guess it's better than
nothing (and also better than the 404 coming back from the http:// one).

> --- a/xen/common/bunzip2.c
> +++ b/xen/common/bunzip2.c
> @@ -35,7 +35,7 @@
>  		Phone (337) 232-1234 or 1-800-738-2226
>  		Fax   (337) 232-1297
>  
> -		http://www.hospiceacadiana.com/
> +		https://www.hospiceacadiana.com/
>  
>  	Manuel
>   */
> @@ -470,7 +470,7 @@ got_huff_bits:
>  	   and decoded them into the intermediate buffer.  There are
>  	   dbufCount many decoded bytes in dbuf[].  Now undo the
>  	   Burrows-Wheeler transform on dbuf.  See
> -	   http://dogma.net/markn/articles/bwt/bwt.htm
> +	   https://dogma.net/markn/articles/bwt/bwt.htm

Again the site looks to no longer exist.

> --- a/xen/include/crypto/vmac.h
> +++ b/xen/include/crypto/vmac.h
> @@ -62,9 +62,9 @@ typedef unsigned long long uint64_t;
>   * This implementation supports two free AES implementations: OpenSSL's and
>   * Paulo Barreto's. To use OpenSSL's, you will need to include the OpenSSL
>   * crypto library (eg, gcc -lcrypto foo.c). For Barreto's, you will need
> - * to compile rijndael-alg-fst.c, last seen at http://www.iaik.tu-graz.ac.at/
> + * to compile rijndael-alg-fst.c, last seen at https://www.iaik.tu-graz.ac.at/
>   * research/krypto/AES/old/~rijmen/rijndael/rijndael-fst-3.0.zip and
> - * http://homes.esat.kuleuven.be/~rijmen/rijndael/rijndael-fst-3.0.zip.
> + * https://homes.esat.kuleuven.be/~rijmen/rijndael/rijndael-fst-3.0.zip.
>   * To use a different implementation, use these definitions as a model.
>   * ----------------------------------------------------------------------- */

While here the server still exists, the URL doesn't anymore.

> --- a/xen/tools/kconfig/qconf.cc
> +++ b/xen/tools/kconfig/qconf.cc
> @@ -1785,7 +1785,7 @@ void ConfigMainWindow::showAbout(void)
>  {
>  	static const QString str = "qconf is Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>.\n"
>  		"Copyright (C) 2015 Boris Barbulovski <bbarbulovski@gmail.com>.\n\n"
> -		"Bug reports and feature request can also be entered at http://bugzilla.kernel.org/\n";
> +		"Bug reports and feature request can also be entered at https://bugzilla.kernel.org/\n";
>  
>  	QMessageBox::information(this, "qconf", str);
>  }

Personally I think changes to files under xen/tools/kconfig/ should come
via a Linux side commit that we port over.

Now that I've reached the end, just to clarify: I've not checked all URLs, just
ones looking potentially "suspicious" to me.

Jan

