Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7B16FE90E
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 03:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533052.829420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwuls-0007Zf-DW; Thu, 11 May 2023 01:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533052.829420; Thu, 11 May 2023 01:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwuls-0007XY-AG; Thu, 11 May 2023 01:07:04 +0000
Received: by outflank-mailman (input) for mailman id 533052;
 Thu, 11 May 2023 01:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6h4R=BA=hotmail.com=rafael_andreas@srs-se1.protection.inumbo.net>)
 id 1pwulo-0007XS-SB
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 01:07:01 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01olkn2071.outbound.protection.outlook.com [40.92.65.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20bb1517-ef98-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 03:06:58 +0200 (CEST)
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::6) by
 GV1P192MB1692.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:50::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.21; Thu, 11 May 2023 01:06:29 +0000
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::5056:b334:c71f:b047]) by DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::5056:b334:c71f:b047%6]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 01:06:28 +0000
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
X-Inumbo-ID: 20bb1517-ef98-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5+T3q3BLC986g/fpHXkHPntRmNZp/j3tKwmcTu3FXaNVr/Ne/xp0rvkK6FnzTmVXhkoG16ZCAmjuwbsP8TCm7CxMZc3Ysm4hzLf/5rEJq4BvHQI6zLPXdhqO2/2Ns2hjPU0T7fZXAcHazQ87//tTPm2jH5sP9W4yy9+gFjQRxu25rEexu1arNSZn3sSVABQUaXQI5oHMZ5RuWMH0Y+sdQMe0cq8hN8wmlPQwdxBjzldF2x5gIuUhYjXvEuwFF2zWOS/Zkm7jV+xpDvoq90W/rBsE+4zh1MCCa+EP8FOH5C7V6WZGykKwbp7MOfpqRrhWvC/1BuiCetiWDVrkRKPog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8efdFnv7QyOwR7v+2Lo1+b/mnbyjE1GIiKJ+okTHsg=;
 b=C9dFN37JEl0pvmtHsfcuup/fhUH8IVVTV4dAhbrwJkfKcDCw7W67WasYhgiT0+A2v9eYy5OuommszxxG6rNT6iH6b9mvfEjwQCJfEQmbRlbRPBsp+zYkPpTOZNna6dTGIUvPTIYZzN0xG/d0auiElZYpf9r8+BB/lTN8o7QFBVd+ufnSakTcEnLntgCxc5qDfAoj7n+miSTb5vgAz7hhGWoy7JZyFl8uIK8US7ZgIBFS477WhG+KQQk/p15ljDMsvt3ysa9N/qW0ltCXX9eiS09eSRqSobMUfipEwkUFtPGKm4QH2q5vrxMEWoqITioOmtCauCerY37No9IVOabf+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8efdFnv7QyOwR7v+2Lo1+b/mnbyjE1GIiKJ+okTHsg=;
 b=DUhRVo/ez7DJt9TuArR4ydBkZOMclV7esK+ViohNZSnE18EByHLVl0UI1WC5bE9aeuCoMpz/KNoXLrfaL7oXU8IXGJ0psDS3f33rB1ryTo+wQ8PERLbDmpanUoi00RdL/gCUPJh+4dblxgeHwrS2mlsqghFMqRlPKaOCc6p9vvKp4b0P0Q6WhGSGDzqoH9GMJKGiCmDUh8JwCbhf7E3qDU65rE6iaAR83g7ckoIsxF6KA0c1Ziv7G2qb9LHYmdkRuIyTbAAGFMlDQE44px/MfyMUOTuskxxZiNiipWVQ0UgJXm6gywHNPh8rcDcvVtveGyMrK9FheYZU5y3u1CfkWw==
Message-ID:
 <DU0P192MB1700618BAD55DBD486F27D56E3749@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Date: Thu, 11 May 2023 03:06:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: DROPME [XEN PATCH 0/2] Use streaming decompression for ZSTD
 kernels
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
References: <DU0P192MB170087F1C604F82B946E0CD5E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Rafa=c3=abl_Kooi?= <rafael_andreas@hotmail.com>
In-Reply-To: <DU0P192MB170087F1C604F82B946E0CD5E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [PiJqp1sftzF4McVFj2RHPyaxk95Su+QqrQkVZvwjYeqdQoyWeyTVQeoIUexkRF2Z]
X-ClientProxiedBy: LO4P265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::23) To DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:3bf::6)
X-Microsoft-Original-Message-ID:
 <33adcacb-9201-f588-028e-59a31fdfc7dc@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P192MB1700:EE_|GV1P192MB1692:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d9608c-0e84-4c90-428c-08db51bbf31e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RhSLZgEbWASSNgWec9NtqtcDdXwKclnhLqWWa5DGsSFPXZo1DzNECloqTkm3h4RtwPJ3wvDtq4qbkK4AQCJ8+oEAgghGLK6/gnxlCiSkcfk8r5Oi7Xj7mhpi9CUibQTUdwzrgxue7S86m22N3x2eEn3gA8SuZI4g56qJicQE/o4v7R/CZQNXe9QBsUhk02q66yPTOyF/eg4O2X+byLecXbAgl4LZOcWhXZs+Mv8VwvgQ9fvHd6/l6YPlgVygWcG1mgyoFlY1Y8evy6lDw9Y8FPCOWNrCoCDZ+b2gRxUHlVMziL26EvhT7zHQoPo/hTmJe+chzWG9sEd4CwOBG7bGbVmJ1iGCxR+ykY6lmGiBXgqhNOtQgYe6eTXD1J7bmbc1Sa6V9kZ+bf8Vay7id4XA0wHoR+t1JT805uwIxkDAah4MEwNhYdXI1Hp0L86twQGRcBst8IlntOCNcoDnZepiWW49Rnhuueg7srhaVWUje4FNhV31EYjuvi5OYjWugYGFOIx/M7CWRa9FAHV2LlM/Ig+Ni7E9X62Hm32IBhBn4L0b/tBkhfGJJbOras/9zOEnrP5r+BZUzmAy9YBSXHWzIGIgWTEUAKUhcUBlv4zJiKc=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1NEcnVpYmQ3OWU1Mmp2anRiY2k4VnA2L1VRcW1uZGcwWFc4Y0tZUnpJWk4y?=
 =?utf-8?B?K0RacG05Y1JlN3VsUVF0ckx3VzVYb29TR0p5UHBMbUFmbXJseWNncVAvUkIw?=
 =?utf-8?B?ck1FeXFPck04dUdudEJqcUkwb3RMaU01aTE1UEJlSitaWnJLRlZBdCtPSWda?=
 =?utf-8?B?RUM5SXNmUk8rRkVXSWlWcmtIOWdVd0dlWlM5NkwzUk5sVmwxdVZVcmRCazBX?=
 =?utf-8?B?cFpCaDJRaVl6aEpOMkdEOEhDanM1bzBrOTVGTXhjVzZmYkZnbUdhUERhNFFq?=
 =?utf-8?B?WitERXU5UGF3MlJXZEc5QndDYUxmd1YyMEp2TjBnYUc3dVdVdXpOaGRrS1pY?=
 =?utf-8?B?ejhBQmpNVlRNdGxjQWQ5RUZIM3M3RzlFQks4RHJtUHVib05SdTZlTFJaeFRK?=
 =?utf-8?B?RElRRXFtc0Nad05wVDFZRVpna0k2Yk8waVVVY3Q5ZFd6QlVYa0tSOHNEd0NC?=
 =?utf-8?B?by8zK29zUlM5VDVOdEtUUEt1UHRyR2h1d0p5NjVkSnYxUXkzNXZKbXdueW1G?=
 =?utf-8?B?NjlzSVltK0dEZTdSbUdKYjBRb2J2NU5hTmxMT0lYczRPZnhjL3l0V0wwWWpR?=
 =?utf-8?B?S3kxaUREanhCbDB4WEd4Y3ZqbmVpciswYjFET3hLZm9ZbGhCUWdoZllKOXZG?=
 =?utf-8?B?dXlrWm5CNzZwd2plYlN2UFBQV0s4RXJkMHZRcXFGMVh5R3pIeFFaa1g5bFZ5?=
 =?utf-8?B?dUJ4VksvZ3QxRTRhRFAvV3lCK21hVjI4NHpvQU45bE9OcnpUL0l2Y3cxL1hO?=
 =?utf-8?B?eHlReWxIdCt4ekdHbFQrc2VBblFvK1JyRk5ZTlBnK1pLeUhGZk1mZEpzT3Rx?=
 =?utf-8?B?aEpjaW41d2F2OUxMZEUzeTl2OVk0UmxpWEgyV2NVVkN6elpBNFlEM3FUVTM1?=
 =?utf-8?B?cnNVdkVSZ3Ixa2N3M0cyRXhtNCtNdTdJZW50MFlrbS8ycnRVaFFrU2xkZzRt?=
 =?utf-8?B?RTdNTExjNXNYWFVOOFcwU2c5OWhjK21neWEzNGdRT3ljdE9Wd09qeWFFOHky?=
 =?utf-8?B?TWEyOHBORVp5RGJpT1M0WEl6T3pwQ2dTWmEybHU2V0JLSVoxK0M0aE1BQzQ1?=
 =?utf-8?B?ZFRXOTc4MHZhQjkwVDRYVGR2QlNoRWdrRm0zSWNPMEFpck80VXNMeEJnQTRX?=
 =?utf-8?B?bzIzTGxTbVAwU3ZSa1RRUlBrT0VTU1JIb1V4TmdaQjltaGNOSW9ScURhSVBl?=
 =?utf-8?B?SmhUc3dua2xlaGJOcXBkN29wNlZPMWxMbWI1QXFacVZybHljZ0l2VDZEOXJR?=
 =?utf-8?B?bXJDTlI1Q3hOczZiZG5iQVZOUlZQYnl5SmorQW1uWitoMGU3UExTTEVKRHdt?=
 =?utf-8?B?K3NYbmFERXE5NWxuMnVuTHNSRFY5K2RlVEJpRHRoODl4R1lwMVRicG1pMU9T?=
 =?utf-8?B?djBLOEw4bCtQREQvNWdwLy8xSWhVQ1ZiOG13Rk1vdkxyNG1Ecnp5UW5jc2JZ?=
 =?utf-8?B?S3dveHorQ2VMazlxbjJMQ1NiVi9md0ZSZExPZmlndm5Oc3RieThTZmZZRDg1?=
 =?utf-8?B?VzJZSlVYRDdNWXhCVHhiT21BWTRhRmJveXU3a3lqa3RCSkhzVkdyc3hTbGJC?=
 =?utf-8?B?aGcwc2NZWmNXZVdqWGdKNENqR0FyTFlWa1NDQ2xPQWliclAyMXY0aWV0ZmNC?=
 =?utf-8?B?YllkNCt6M2hPamtPVjV6WmFpeGdxT09MTXltMTZ2dDlZY2QyU3M4KzZWdnJ6?=
 =?utf-8?B?QU4rY3ZBY29nd2NWczcvdUpGUTZLR3hYVGlrbjc5T09mSmExVTFTZXllMGNS?=
 =?utf-8?Q?4ElVVSPqWn7HObU46k=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d9608c-0e84-4c90-428c-08db51bbf31e
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 01:06:28.7394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB1692

On 10/05/2023 02:18, Rafaël Kooi wrote:> I've attempted to get Xen to boot Arch Linux as a unified EFI binary.
> Using https://xenbits.xen.org/docs/unstable/misc/efi.html as my source
> of information, I've been able to build a unified binary. When trying to
> boot the kernel Xen complains that the stream is corrupt
> ("ZSTD-compressed data is corrupt"). I've been able to reproduce the
> issue locally in user-mode, and confirmed that the issue is also present
> in the latest ZSTD version.
> 
> Using streaming decompression the kernel gets unpacked properly and the
> output is the same as if doing `cat kernel.zst | unzstd > bzImage`.
> 
> A problem I ran into was that adding book keeping to decompress.c would
> result in either a .data section being added or a .bss.* section. The
> linker would complain about this. And since I am not familiar with this
> code, and why it is this way, I opted to add a user-pointer to the
> internal decompression API.
> 
> Rafaël Kooi (2):
>    xen/decompress: Add a user pointer for book keeping in the callbacks
>    x86/Dom0: Use streaming decompression for ZSTD compressed kernels
> 
>   xen/common/bunzip2.c         | 23 ++++++++++++----------
>   xen/common/decompress.c      | 37 ++++++++++++++++++++++++++++++------
>   xen/common/unlz4.c           | 15 ++++++++-------
>   xen/common/unlzma.c          | 30 +++++++++++++++++------------
>   xen/common/unlzo.c           | 13 +++++++------
>   xen/common/unxz.c            | 11 ++++++-----
>   xen/common/unzstd.c          | 13 +++++++------
>   xen/include/xen/decompress.h | 10 +++++++---
>   8 files changed, 97 insertions(+), 55 deletions(-)
> 
> --
> 2.40.0
> 

This patch can be dropped in its entirety. The issue that this code
fixes is a symptom of another issue entirely. What ended up being the
issue was that the SSD of my laptop is dead, and that I messed up the
alignment of the sections inserted into xen.efi.

I plan to add some sanity checks to the EFI boot loader code to inform
the user if the sections are misaligned. That's a much more user friendly
error than whatever the decompressor will report.

To Jan, sorry for wasting your time, and thanks again for being patient
with me.

Rafaël

