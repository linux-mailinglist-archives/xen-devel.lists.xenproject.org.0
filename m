Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EF072DDBA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 11:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547923.855579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q90Mz-00055T-UA; Tue, 13 Jun 2023 09:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547923.855579; Tue, 13 Jun 2023 09:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q90Mz-00053o-Qu; Tue, 13 Jun 2023 09:31:21 +0000
Received: by outflank-mailman (input) for mailman id 547923;
 Tue, 13 Jun 2023 09:31:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q90My-00053i-KG
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 09:31:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2058.outbound.protection.outlook.com [40.107.7.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0be31b00-09cd-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 11:31:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8975.eurprd04.prod.outlook.com (2603:10a6:102:20e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Tue, 13 Jun
 2023 09:30:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 09:30:46 +0000
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
X-Inumbo-ID: 0be31b00-09cd-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5x64T1CLjTjDkJoM7O1uzi37W7opUZ0rqORA32S/h3LeXttx/mqJvpl7JpYnRSz3ctLtATtIWMBxlPCgnBYtUJDNc9sdYrjK94BZeTn+8yjBQEGfRwX3szkB6GLQwzt0Hz5uw9rFkGaknMp5cJW1uHge1QyTXvR/NRZXb47+d0Q0s3DgbwknyWiJKCgmBJQvMEWLKqO06OPCZ1KzJFLqS2t1/KHE2HziuB8s08yQpO54M6cNOVRCym39YQT9G6/9ejus/aWyQ7CiZKHHS3NxjiVm6x2adIzAt2BjyxQ6HXCXAit1AsbPvN75G5sv3sCq07acto8NbfH5GzsxBa4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9kSIYMVG8XziLWtWdDYHGOVY15fJRUb5dwyAwn396E=;
 b=hm5p0HWyB4JhpXA9/RGflRgTpjvNdDTrshsaNaCLmc/LhjG970NhMX6xm+zv5h1+K2vp51pgr4Wcv22A4eH2Y3lRbiQWZLGzAlP0BAnFF7tvso3aF9S6bhjuP7+kUwuxxnTAjLmhxOFakHUpnOQG5TS0f1GZR6hW0yg0mJQrCwDM7l7M4k5iWm1fDvjFS06Cjzf2D7v52+56BeB5UwsAcVohIyKPtXA9O7/U51HJrAPfuX6acYS36+Wo5IaNA3lVQ72okd6bHSMw1i1K2hTDFsH0wHLawXvBoX89Zu9/NIRNLLiB+HFZaDxb6QZszNHIJcyGaaUZnu8LkWCU+AoqUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9kSIYMVG8XziLWtWdDYHGOVY15fJRUb5dwyAwn396E=;
 b=xZk6UrhGEAVDEsZi+rxx6VeU50oGh4kYT0gEfRNsN4SjcZkm9Do8DCN4I/jnPS1Z0WDNvrDHpdtIwFuZ+fjD2VRIrol9fmxp6/9RYP+oJb9HK+4J6PDqEP3/t5kpY1ChW5gmkDxqRQFzbqTumJ2qqSq3ToNodzkKgNi5Oc5GSLWRuCKyradSvMYe5gT/+eKGBqPrW69hbR6FHFPsM0qPP5LYsKkXjdEUx6J4J7+lCVdrQfHbabvczgjkt0M5rM/9hFDTLtCEX0rCtmEGSnx3Rjgt/P8HM+N0nQTjy6WQdfJbydtXmHgcwkiUhcR9MA/4Yh858Oe9hAV718p9ntzWjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81f74759-766a-bc3f-f4de-199cf3f1bd75@suse.com>
Date: Tue, 13 Jun 2023 11:30:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 3/4] x86/spec-ctrl: Fix up the RSBA/RRSBA bits as
 appropriate
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
 <20230612161306.2739572-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230612161306.2739572-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8975:EE_
X-MS-Office365-Filtering-Correlation-Id: a97c1238-3bf5-443f-d44d-08db6bf0dde7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qh56knnxLcvHlENnFs45vh3S9KjsHh32R6EiPrKz4Satj9mfunIieCPNs0wtWlWRIdcfbuRlPTFuLQNNw8LkT78VdIcBhF7CB/qvKhp275hUR5m8LHHbGuAnT15sG40Gtc7FvMhVMX3msohkOfl+m2JYtbLFwLodvtR/cJ7xfUlxwduAJdyfY7gsvYytcWp5T5AAZZm+uLomG9mLNhD7YconG21lsu2giMvodHjW/HK2p5uaN9WyMmyrgrw119FmQsZXOUrdWisRlXSQx+wtbeuOhOckwox49UENoqajvxGoLv4LBv+kLLpidZ+FLDC83TLjZy73qD0rSUChrPGo/7YFajwFnhunYgOITz+SPuhAY8AEt5gMy6g1pPQeDfr4dTfNRPyzcJYZYZVWCjpPnV8EQJPibm9Fl8N7PcydE07TSrG0eA3I1pqQ8hTOQBgWAjteVNWXLSi+ooH/dMkp6aKIxQ7LeLNN0shI2fsT1Czzv//GP7z3nQgMN7dG8Dv4TUUqaX0aAPZLP3vuQXLXZrM3Yg5L9tlSyXxfmxm9h0TTmlFk6em6T1RL9bRb0I67STjSVCfJWLrrlals71BBA8M3CVa3CWMKCkUrJPI3xKjhkrC4mTpAkBmWe32tZe0GZUVSd1/fMTLJfz6lFjrSug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(2616005)(38100700002)(86362001)(31696002)(36756003)(478600001)(31686004)(54906003)(4326008)(6486002)(8936002)(8676002)(2906002)(5660300002)(66556008)(66946007)(66476007)(41300700001)(6916009)(316002)(53546011)(186003)(6512007)(6506007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rlg4WmZ1emxubGtVT0NMWjZRK2xZaDV2V0JNMFUzMDNNcENTUUk3ZUVDekpt?=
 =?utf-8?B?UWZVLzU5WGV1VktyOWh2WmljbDcxaUtlN3ZsckVlemxzYlRXb3N0RDJVVzIv?=
 =?utf-8?B?OE0xeC9lcEtyYjh2VWNsMTdDMnd0am1EZXhjZTdZM0FjbzJWN1JZK1M0SVFn?=
 =?utf-8?B?UjBreC9tbUEvYjVHTWlBUk1Ud05YWVU4UlJJd3NOcy8yWmFXNlBIdm9tRFhn?=
 =?utf-8?B?QVJsdER5S3JNclUzVG1YZDVoamdEd0EwOFVxa2JUbTZZZU0rTDEzY0NWSUZF?=
 =?utf-8?B?aE9zb2xObnNXY0xwaWFVT1VPVWFxd0RwcVhTZWNYSS91L0t1eUlFQUcrUVFG?=
 =?utf-8?B?NllwVGlsRmR1MzFROUdwR1daVmxxV1M0a1hnK0pncWJJSWVaZExxYXQ5b3ov?=
 =?utf-8?B?STJUR3hoaHdoemp4S1BMUE1pb05idXJ0R3M0S3dISFJHcExVaWdHZmlycFJG?=
 =?utf-8?B?MUFMbXlNNUlxcWhQTU1lR0hLdEw5TVc2bVk3T1ZGaklHOFgzQThSWXF6VTAy?=
 =?utf-8?B?VHFabzBOcDFETHVvWnhSVlVsNHNJUnBRbXRRczRwd1dXS0lFZnNHdmR0OVA4?=
 =?utf-8?B?bzc4N01OVmpRNWxVUjZSNkM3aXM5cVZ0T3Qrb2dEcnd1YjVlbDY2T0Y1MVB6?=
 =?utf-8?B?cWJJa1JZK1VMOWRMY1lOeTd1RFJkOTAwKy9oNnBBUHFlV2hrSElVQzAyTEtT?=
 =?utf-8?B?SS9xS3B1cnZCZDA4UTBFYzlDd2lCSkRNZWlLdGVIMDAxblVsNFR5MkcxMkRW?=
 =?utf-8?B?ZW1UNENsUndBUWp0OTZlM3ZWeFo0bW5XQk1HdXdWTWNKei9RV0lLbEg5dEpE?=
 =?utf-8?B?QmJrbjhDKysvUVkvQ0xTTDRrRUU1VmlsNklidTNhQld2WnAvbjlISkpKblZw?=
 =?utf-8?B?UlFGUUpXQnFpZzI0Mzd4VzVSWTRQV2NXVHBRWWtGaTlkK1hQaU9LdzBuZDZr?=
 =?utf-8?B?WlMvZ2dITlJRY0FTMy9YL1dtVkpJcHB4ZXhLY3owN2Z1Y0VoMGhQUWdPQ25I?=
 =?utf-8?B?QUt4NTlFck1EcXhmSHZmTm1ocC84dXVhaW5WTnhndk9lcWszS3h2ZE0vbGdE?=
 =?utf-8?B?QTg1L29DY3ZpUTFuUm5rNXllUkZ4NktKaXBVbVVHSWMxWk5wbnVDMW5WRUo0?=
 =?utf-8?B?Sk1Wajl0NllEd1NNcytvYW9nSDI2UERMNDhJOExmV0ZvWElySlEyMmN3M3NP?=
 =?utf-8?B?c3R1Mlc1R2M0SW5HVWpReWtLbDZmYXpNM0l3U2lUN3BLNWhWU0RTMUE2WmJC?=
 =?utf-8?B?U2pSK2FuL1E1SkU3RmFkM2VRVk9JaW02OTlXcjhubDBPTGpBV2EyemMrWTll?=
 =?utf-8?B?UFlNSEx0YU5ZMWtoTXUxYUFQRDlPMGtuSjNYeExXRzRYUFpHN0x6K21sd29u?=
 =?utf-8?B?dGlITC8yTmhOTldMWkYwdlYvNitXYTdTUk41anQ4TzhlaEo3Z3FhRFhWbk1E?=
 =?utf-8?B?Rm92NnVjTmtPMlVuRVJVVUdVYmZjZlBRUmpPNzU3VDJEcFM1SGlsdjFsa0Y3?=
 =?utf-8?B?aXcxS2xHdlVsNFV5cTZud3hRVEJId1hiZWJjY2lPelBHQ3RDbFJLRzRpRkRL?=
 =?utf-8?B?SDZnM0FZYWVPcG10UTJSS0JDaHZqQjF3bXk5MDBQekt5MWw2YnE3ZDlXWUhJ?=
 =?utf-8?B?WE1UWkxaN1JsN3hHc3lxUXFXMUxVMkJaOWlkQ0N2eFhTMzRxbVR2V0tVZkYr?=
 =?utf-8?B?dWtlVDBGbmpmeG9iTXF6RFpnRzFaRCtXdDRsVHFlMWNvNEdhYUtKcVFURXlV?=
 =?utf-8?B?NTRGRlRJbHBZTEJjTEtOcXo1QVBSMS8rbHRiS3BjZ1MxQ1l5SG1lSW10UFM3?=
 =?utf-8?B?SVR4ZExla0ZWbTdyL0xGbFZvemhYNFBLZDlhZHBpTTRYUnVxcFFKdEtHS0ZO?=
 =?utf-8?B?UW9TcDVhcjJkNE82ajFwd0xRSHdXTWQzTGpuOUlhbGNXSEVNMnNHcWh3OUdR?=
 =?utf-8?B?dGw1K2E5NjZ2a0VBNytraUsrNm5BcEI3YThudHl3cEZsTWxHdWZQbmJuYVlG?=
 =?utf-8?B?bHJTcVBBeHpoalJORks4QnF1S0RlRTg0Q1dFT2pkQW5SQmZkY25yRTZuS1Iy?=
 =?utf-8?B?UU9iQVd3MmJWeWc3Z0ZUNThXRFN6Q2VwanNhZEZ5VHk5b3ZLUGR6YzA4S2w1?=
 =?utf-8?Q?zcMKcslRTex8xUZTiBNxWGtXp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a97c1238-3bf5-443f-d44d-08db6bf0dde7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 09:30:46.3805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WXXxMBwd4LWwW3W2LbsOYfAihIDPm0DbAdB3taQYKl2JRHNPkqCeDdoXm+c6yrBVblZ5dHggyLBExO74o96rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8975

On 12.06.2023 18:13, Andrew Cooper wrote:
> @@ -593,15 +596,93 @@ static bool __init retpoline_calculations(void)
>          return false;
>  
>      /*
> -     * RSBA may be set by a hypervisor to indicate that we may move to a
> -     * processor which isn't retpoline-safe.
> +     * The meaning of the RSBA and RRSBA bits have evolved over time.  The
> +     * agreed upon meaning at the time of writing (May 2023) is thus:
> +     *
> +     * - RSBA (RSB Alternative) means that an RSB may fall back to an
> +     *   alternative predictor on underflow.  Skylake uarch and later all have
> +     *   this property.  Broadwell too, when running microcode versions prior
> +     *   to Jan 2018.
> +     *
> +     * - All eIBRS-capable processors suffer RSBA, but eIBRS also introduces
> +     *   tagging of predictions with the mode in which they were learned.  So
> +     *   when eIBRS is active, RSBA becomes RRSBA (Restricted RSBA).
> +     *
> +     * - CPUs are not expected to enumerate both RSBA and RRSBA.
> +     *
> +     * Some parts (Broadwell) are not expected to ever enumerate this
> +     * behaviour directly.  Other parts have differing enumeration with
> +     * microcode version.  Fix up Xen's idea, so we can advertise them safely
> +     * to guests, and so toolstacks can level a VM safety for migration.
> +     *
> +     * The following states exist:
> +     *
> +     * |   | RSBA | EIBRS | RRSBA | Notes              | Action        |
> +     * |---+------+-------+-------+--------------------+---------------|
> +     * | 1 |    0 |     0 |     0 | OK (older parts)   | Maybe +RSBA   |
> +     * | 2 |    0 |     0 |     1 | Broken             | +RSBA, -RRSBA |
> +     * | 3 |    0 |     1 |     0 | OK (pre-Aug ucode) | +RRSBA        |
> +     * | 4 |    0 |     1 |     1 | OK                 |               |
> +     * | 5 |    1 |     0 |     0 | OK                 |               |
> +     * | 6 |    1 |     0 |     1 | Broken             | -RRSBA        |
> +     * | 7 |    1 |     1 |     0 | Broken             | -RSBA, +RRSBA |
> +     * | 8 |    1 |     1 |     1 | Broken             | -RSBA         |

You've kept the Action column as you had it originally, despite no longer
applying all the fixups. Wouldn't it make sense to mark those we don't do,
e.g. by enclosing in parentheses?

> +     * However, we don't need perfect adherence to the spec.  We only need
> +     * RSBA || RRSBA to indicate "alternative predictors potentially in use".
> +     * Rows 1 & 3 are fixed up by later logic, as they're known configurations
> +     * which exist in the world.
>       *
> +     * Complain loudly at the broken cases. They're safe for Xen to use (so we
> +     * don't attempt to correct), and may or may not exist in reality, but if
> +     * we ever encoutner them in practice, something is wrong and needs

Nit: "encounter"

> +     * further investigation.
> +     */
> +    if ( cpu_has_eibrs ? cpu_has_rsba  /* Rows 7, 8 */
> +                       : cpu_has_rrsba /* Rows 2, 6 */ )
> +    {
> +        printk(XENLOG_ERR
> +               "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RSBA %u, EIBRS %u, RRSBA %u\n",
> +               boot_cpu_data.x86, boot_cpu_data.x86_model,
> +               boot_cpu_data.x86_mask, ucode_rev,
> +               cpu_has_rsba, cpu_has_eibrs, cpu_has_rrsba);

Perhaps with adjustments (as you deem them sensible)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

