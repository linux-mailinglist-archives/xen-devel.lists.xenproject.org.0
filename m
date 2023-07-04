Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323EE747574
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 17:39:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558504.872668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGi7R-0003Zg-SF; Tue, 04 Jul 2023 15:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558504.872668; Tue, 04 Jul 2023 15:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGi7R-0003WJ-OF; Tue, 04 Jul 2023 15:39:09 +0000
Received: by outflank-mailman (input) for mailman id 558504;
 Tue, 04 Jul 2023 15:39:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGi7Q-0003WD-9T
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 15:39:08 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe13::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8ba58bb-1a80-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 17:39:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7733.eurprd04.prod.outlook.com (2603:10a6:20b:288::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 15:39:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 15:39:03 +0000
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
X-Inumbo-ID: e8ba58bb-1a80-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeXbFAI7YI7FdIKyOXo/rpCLLePIt+zeCnq1yR8oaXq2Ve0OPb8KuLFVu2iTaZ+KH76yyqZjJUrptS5qo3eJI8bLZFoWr6/0u/QrSZ6QPgLYbQvs5158SLyd+1SCIWhTWdBPNVdmEMIKvQC8s1Hgh5ZAgBkuJzRdz0McbAkChhlH5hhwfo0xhU/xD5ramP9TJu+SLUshJ3mRtZ2mubL2YWylR35yBMR3uJcunmZ22t4ZrY0gyUM8hY0JmP5bhj2i0QFVjULiP61FfheUOSYHSdcCQvIUnskeM6fas3WGe/h/fpj8ZnGLvqY6ROMOjZaOEN4Ho8y989+jHyatXa6JEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7zz3Rsy8pxP/JX0TStDJWFtTNM4S9ARPkklH004b2Q=;
 b=VD7/fmDZA2vBrtqWzDR0j7Jn8IkKvuI+fZLr7QQNpbKWledEDIvMtdQ5i1OayXXnMkhF/GaxZR4W8kL8VSPTAsaj23cpfbN0Tn7rfHdafSi+d0c9U4m8C7tFjamnsJnwFTt9L6tDXs9sdvwVWh1WOzkyNqHRLNCBxtFGdPhmt/DQlAP589GIicuTgTeqU8Cv/IuoKfKRjifSGP4ajkJ+/OPmuxrydQ6B5Ta5c40ofBdDyV2wt0U3jblGfxPVdK3Syjo9o60XMM5ukxd4Bixi3UEesDWrwrHr3aH71EFUlS3AWRggBiHdrZPxZcRlF43yfNg+YbkjRJUcoZlTsIfV0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7zz3Rsy8pxP/JX0TStDJWFtTNM4S9ARPkklH004b2Q=;
 b=KlXvQdAVYkKRLiOwleLc3AeT7ktmqoSZzjVKk1NVJ5xYTlH6bEswVY+/WHuDn0DKsAb6HOx7aUZls6o7GyK5FHHLwMhssPhAhsu5S4cngDRz9lJ1J0jA0hULyLKokdXcVcpxET58sdmRmXv6hgEnyR3Er7kYqenXqSAb7vtERkbcvKozv+WATamDmTIXNQz90Tsn/hGl3EjKXiehZAivlQfuME/fDHshuMVNJA31FPCr3pgcVG6GKCdRbLDnFAbNPezYsZgZviMKQhsrUeFhxSZiCRl7KJUCdQ3R9eweQ1NflTkSiez5XY2HNVnMuENwMqPbHh3VN5TZHP3I7ouRTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bff9074d-0345-2931-c57b-3acda238a9b5@suse.com>
Date: Tue, 4 Jul 2023 17:39:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: xen | Failed pipeline for staging | 9dd3caf1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <649eeb9f5347_281f686f427353e@gitlab-sidekiq-catchall-v2-54666fdc77-xrbls.mail>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <649eeb9f5347_281f686f427353e@gitlab-sidekiq-catchall-v2-54666fdc77-xrbls.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: e4f222d9-1c47-4121-f9c0-08db7ca4cbae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y8VpYnzI0bjVrcT44PKiuWJnKME2ubv/H6RRL/oGAxQjdKHYpDNRVaiyZ16yMv0M01fVu6iajogCZdp+2iTafgAYN3f1xY6i8NdbSJi2ImbavmHhlySCm3HBQHkRp+NCaXly2pCdWS7sfMRY3aA478byZB9KyicU7w2sLoZlw3ywykaKFAfHmdXOdTPbbqDK63thAQbEgto2U0IiOXFpVvmZA6X9g1MAndwRmEaQ1EnQs2VQmb5DV+RiNK8ecnh0gHGmalvEEM+aXBx6M5mfH1G+0prRW0kTujgUffH06dnbpF+irLrr6kcQ+3h7ha0YkW01Tp4wxzkyv+7+xrtQ3r0yQ4F8TrTVo6ILOpAc/trRLGzctgOwICHYXg4t39EEL6aTCyv0AbIRxZDjVO5te0j/LWsecldLOm718x6szZTkZZL9OXAgWXEp++IhZuK2QX50dHXQsDn49+K4Fe2kIE7E9lPr8xuMw/aO7H3ax5HiK9p+YvFHAhU9soTMJ9u07B7YL87OulUojwZ0h6ckqZeI9mZk+ZsLK7V0j/Dcp0ad0MLSQyPuMISKuSVrwJqycU6PagOCX8Ov+NeJ/68ASI1jtmeYUtzsBa1Hl1i3L3XePwQp6bcNuWMKfMgZXCUM2MHu/HpO4U1J02Ju7/VDIbFmBGYGS8ykaDUNItVN1eS3zWOTaH+2Yqk1F4rSltuE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(2906002)(478600001)(6666004)(6486002)(966005)(316002)(5660300002)(41300700001)(8676002)(8936002)(6916009)(66946007)(66476007)(66556008)(83380400001)(36756003)(2616005)(86362001)(31686004)(31696002)(38100700002)(26005)(6506007)(53546011)(6512007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1R2T1BzbzhIQlYyZjVMQ3UzK2hUNnJrYmE1OC9ScUorLytBdXI3WGFuOEQ0?=
 =?utf-8?B?N1Jpd0pWNFBxZ1hKREo5T1k3QktDTXdsWlAxWVpnVWdHci84aERaYnAwM1J5?=
 =?utf-8?B?YTVaOGJ6ZFVCcEoxTEZVWm1zOGY4a3lKVVlEY0drZ1RlaDlYSHFTdlRLMlVD?=
 =?utf-8?B?bHA3WXovT21yVE5HVDI4M1VYMjI1ZFh5ME9zcUFIUDk2d3JpY2JtUVNhK2tl?=
 =?utf-8?B?aXVBSnhOZWZsQlBXSy9XTzRXUXl1Mk80Uy82V2twNWllMFFaMG5SWUNTY0hK?=
 =?utf-8?B?U0tZMmlWV01WRHBidXl0WVZWWTlHTHRQc043TTdHWE1RL1BOakpXbjk4UExJ?=
 =?utf-8?B?RUI2aXE0Z3JwUm5ncUc4TDlJRHNaL2lKSWFWcHRvQlg5WVdiNEdQekNQamc2?=
 =?utf-8?B?K3UvVk5MSDh4WGdMczlhQmxEZ3lwZmxkclpZZUNhZmw4cDEvbWtpeml6cEdy?=
 =?utf-8?B?emtkREExZVFNS21wWkxNY1ladUdsOTltVGh2aWQrOVV0YzVhMHI3RkJaVmZQ?=
 =?utf-8?B?MFh2UW9vbUVTTnBMdFhjQ0pUVzR2aTA3NDh1WnIwakcreDBxNW0wUXJ6Q1BW?=
 =?utf-8?B?OXM5cnl2aUh5TjY4TlJYeHFtRStReURKeURyQzR5K1ZkNmJQRlkzWXhzakVh?=
 =?utf-8?B?aktxd1lzNGduM1k2MHFBLzhrQXRxOURUYXRFL3Z2ZDhhQjE2M3NaVW1yNXUz?=
 =?utf-8?B?Y2NQT0REMEM2MWZ0WWNWVTNRdHBURFpCRjhkRDhuNHFNY3RheFlJZ2FwUUJO?=
 =?utf-8?B?ZG5GY0p5b2hiWUF6USsyc09YcGZKL2dPL203UVdsREVvbFcxWks3MmlZN084?=
 =?utf-8?B?VFRVMHdleVFlcG5VTzZDQlhZa2FtN1hxYTZVVTJzaTZlcFRCOFVHdnNCL05W?=
 =?utf-8?B?eVNubDdhbVBVMExMYXpmY3FwM29DVjByZjltMUdOSmh2b2RFNE1SOVNxSzEx?=
 =?utf-8?B?YjdVMFVjdktTWVorWi9MaGlHWG9nRVNxTksycCsxeGd3TUtHYzZDMmI0K2M0?=
 =?utf-8?B?cVEzVjY2SUJUeTh0NEtLeFhyRU1EZTM4UWVQcm9zSTZQK1h1WW1ZRjMzUjBO?=
 =?utf-8?B?a2VqbUFrK2orcXo0VGhyVVREdkxNakxyQTB5RFB2MEQ3WVF6WDh0SEY4N09K?=
 =?utf-8?B?LzlXZzkwRW5BdjBkQjZ3dkpCTWZyUEkxNUNFczJjbnpselg0VGJUQ1VEUEsx?=
 =?utf-8?B?UExCUklldlN2aks0WFMyMFF2b3o2U2s5Z3F2VXdwWWd5dmxDdEc2S0V1ZFUz?=
 =?utf-8?B?ZC9Nb2E4Ui9FZU1oM2x1bS9RVnV5MHY5a1VRZlhUdTJzL3lSRG5LWUt6elFY?=
 =?utf-8?B?VTlUTU8vQnJhZDNBMy96NGNYY3dISHcvOVFWNlVHYXkwN3NuY0p2RExYT0lL?=
 =?utf-8?B?ekFiSE40aWdPTUhwSmp2aGpqZGJod3dseVFRVjJwaG15aUh6dVJNejZhOTRi?=
 =?utf-8?B?OFJmZFBpYzExd3VBWDZQUWFaeXJVQnc5emt4U0wycU4rQkNsU0IrclU4Wk81?=
 =?utf-8?B?V1phT0kwcmhPeGkyRjhtUStPVHBsODdNYW9wSWtQOFkvVWQ1V2hTZE1nVkYw?=
 =?utf-8?B?QVhpQVBCWFFXaysrRTF0YStYOFRkYlpyenV6d3ZxOUEvTU9JMHM1b1dpOXdU?=
 =?utf-8?B?bWpFbzI3NFUvMVAwTFJReVo1SHA0ejQxdmh3K3U4VVR4Q0EwVG43MjNIMXQy?=
 =?utf-8?B?dDBNV053Y0lkU1FkTzBBVmUvRmFjMHVFWnVtcUtiNVNyT3hPQnFELzBYRXJT?=
 =?utf-8?B?bWtHS1Q4aUQvTEt1ME1lb0UzU3VvNjd2MGtXRTQ2VWxya0Y5RGdsSU01Q1or?=
 =?utf-8?B?dlBqZm1pTTFQc3FHK2tHMHR3ZXZBRXUzL3lSK21OZWUrV2RjcTRRaDdIMnhJ?=
 =?utf-8?B?WHhEYmNiOXlKaU1KSU1FYmYyN0ljZ2tiYWtuRDVVaU83RUcwL2EvNFVPZGhL?=
 =?utf-8?B?R3pnSWpzZGtBRW16QmxxR05NZ3ZWL2hvL21ndCt6cGpiMkl5YlFTV3YyY2tF?=
 =?utf-8?B?VEF6R0JuMkpHQ1hpZm1RQU5tek12SFNpcGw0SGRpRmxPbm1JRm9ReE84ZVBt?=
 =?utf-8?B?WmtVbWlKanJvYUs5Q2cxQ2dydXpsLy81dmh2Y1ZGaUhBclZpRW9PM1VzamRT?=
 =?utf-8?Q?Vr6rnTDt5oHLSNqxrTu8TAA8k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f222d9-1c47-4121-f9c0-08db7ca4cbae
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 15:39:03.7856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzACFzlU/vl6l5u90WEPMIiOy/xmeWp5FQQENZXEjEk/td5FlNULgYRnldTPPyGsBCeo6LC9/4AiuVGKrb9YaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7733

On 30.06.2023 16:50, GitLab wrote:
> 
> 
> Pipeline #917215286 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
> 
> Commit: 9dd3caf1 ( https://gitlab.com/xen-project/xen/-/commit/9dd3caf12f52b859947c260b1cb3a48b491d53b6 )
> Commit Message: {x86,arm}/mm.c: Make populate_pt_range __init
> 
> ...
> Commit Author: George Dunlap
> Committed by: George Dunlap
> 
> 
> Pipeline #917215286 ( https://gitlab.com/xen-project/xen/-/pipelines/917215286 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 3 failed jobs.
> 
> Job #4573553348 ( https://gitlab.com/xen-project/xen/-/jobs/4573553348/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-gcc-debug
> Job #4573553345 ( https://gitlab.com/xen-project/xen/-/jobs/4573553345/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-gcc

While iirc the above continue to be expected, ...

> Job #4573553188 ( https://gitlab.com/xen-project/xen/-/jobs/4573553188/raw )
> 
> Stage: build
> Name: debian-unstable-gcc-debug-arm64-randconfig

... this one has

ld    -EL --no-warn-rwx-segments -T arch/arm/xen.lds -N prelink.o \
    ./common/symbols-dummy.o -o ./.xen-syms.0
ld: Xen is too big

in its build log. Whatever the .config, I'm inclined to say this should
not happen.

Jan

