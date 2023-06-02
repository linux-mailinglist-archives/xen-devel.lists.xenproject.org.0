Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FF871FE69
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 11:56:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543070.847678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q51W5-0003rQ-7V; Fri, 02 Jun 2023 09:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543070.847678; Fri, 02 Jun 2023 09:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q51W5-0003pA-4L; Fri, 02 Jun 2023 09:56:17 +0000
Received: by outflank-mailman (input) for mailman id 543070;
 Fri, 02 Jun 2023 09:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqWc=BW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q51W3-0003p4-Fj
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 09:56:15 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe13::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b50d1227-012b-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 11:56:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8996.eurprd04.prod.outlook.com (2603:10a6:20b:42f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Fri, 2 Jun
 2023 09:56:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 09:56:10 +0000
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
X-Inumbo-ID: b50d1227-012b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiOATDrUcPNCpTD2XUZbXp2pjkAc2Og05digDQLo6W2CnwKnG790VkqRR32aFYgdxGlpXLg5BmAstxOCJYf3mcbpv+Ur75KeKHn3UmlO2VKIuAsC4tKeerc6YoEe/S2hskTJj48NCKacsCSGWOJWh4kVUHJxcFl9R40+JUFgkBMesyCctPs5Kd4J52gLaPoCdTKLmTkOegoV5C+aMon5BoDI+ZHuxlC7DVAdd2QTq88GoXmlk8D7eil2QcIG83tCNARFOs0THgdEiMNLM39lZ8ckBV+W6ODAk/6y3cw0t6afWJhyVeTX91n2YpY4oC+ZTS8GK1RnaYdhKh5vTAtwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyZhtGTJFTtSZ8JXB4wcO9Bifjrd/68+N7yM/LGYVp4=;
 b=aIT1AYFy/LAw8JN0Om65KfZuP3U8HUnZM4zz+x9JP5o/Lws2jfRhRjxx2kN7tSZyAbdgAwDsKiTmg8MEg9UfzY+jjLCpJhMwvN+ue8YVU1w/GfIqjzozBorkzlXOk7EjUD9ZIEZYbT4YRHtcs1ajSid/UmBYwakJMeV0U6+Abwf2kvYkZ2LA6Z00bffsLd8LvG8uZt8PgYOcc5I9Rpf43I0Z9AGHBkgAcdCQW/aH9OhyelUEYPt0spu8FIrvw4mspYETJLVqmTaEILmJ+6Em3y7sBFiGiUsFZP7HN8VWoWB09r9nsAl70DLpz9eNPWzdQydPpqISPJh7a8oXNqlVQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyZhtGTJFTtSZ8JXB4wcO9Bifjrd/68+N7yM/LGYVp4=;
 b=J0iNy8tsTCVwusxIOA7dtalUgaOU3oKP7oTHWz6GbsJWAD5PXJASsZUY8kfSDb0rSE3QLI9GuT0CdD5yruZyUlNYGqA7QRfKd399t9LIv1HTX06jipzejIIpJxXULilY8TzKHP4JyJifq8qiGfquKWo4OMme42EDXeoMpJy/yh36KBCqeVpFaGi0z1Ypapd65D+6fFYIr5JHgNOqASlKTBfwCV5dayaWBuntFG0sE4PZ/RL0rEspDmAuf7Bbbx4TTYFnXs5LDTVerHBdgyBtw16ij0S2oEbn9cTsutCNzbsJ3ITsQnb1C4v2C3xuy0Aq3fxzKCwXvypmiUscKIGv7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36b016e2-b378-f97c-42da-86a330471bf0@suse.com>
Date: Fri, 2 Jun 2023 11:56:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/3] x86/spec-ctrl: Fix up the RSBA/RRSBA bits as
 appropriate
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
 <20230601144845.1554589-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230601144845.1554589-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b1d174-76d4-452d-df05-08db634f9794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+cGRDKxSAyFe+wYj/fU35aDVU7U3nx5T9FT4rL/1b2zZkf8K9hsIZ1NLYhjNyYQ/R3Re7CN5GKdF+tdmcKBDGFCTjvz7hxTQDz3AcZNon3b3qOH21NBv+7Xv3qbLQFgRMwxxxdRstCDya/V95liDogibwJJRfiDjwafaIBV+IdZcU0ChRMAXlM01b7XWi+AARs6/w/OYmIQy5fYcY47rN/W8vkYJv6CQDjj8TuBLF0osOgM3zGvlbsAPbGvCgCBnKi2gKOeiDdVGzKLziygYrZCWI1Oi7ZSxRKVfhZhKmgM4GIrCwP2ezHvVVSUG5Uuuh3jO0BbW9osqIoE5Gi20sVZhehspMQ907dxwGuDpYXVLmzyVIf0CB8jAsAB18c+j27bhGuRsN1VJT77SXxmRphpTgjnCz2hjOqku2X3dEALEZtJczzxbDqrCL/ZKQW8fvDXI4wC2kMOMOpsU2KS94T9k16uWisHAki1EYAi7O1XaBi8jgEV8YFMYvRGfnMhaZDjRN1X5RNkE4mMc24xYOURWPD9hzM8QFVpfNi3y9PzivIkLwBezOkWIsvuj2LTkHxD5uNgHpBNmLT9Tn4sZdQ2iH9AEaNYGtY0a16gwThU+9f9lJZ5UaC/lQEA7uu6SDyUbROGreFwp5g7aBeX8WA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(4326008)(66476007)(66946007)(6916009)(31686004)(66556008)(5660300002)(8936002)(8676002)(316002)(41300700001)(66899021)(54906003)(2906002)(6486002)(478600001)(83380400001)(6506007)(26005)(186003)(36756003)(53546011)(2616005)(6512007)(86362001)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3NaeVZKWW4zR3BXR1hjMmFaK2tPSzJzK09YNTdzS09wc3ZMMVpFdzVBV0VS?=
 =?utf-8?B?WlJ0aDl5UUdlOFBSNUpOV3Bydy9pWTg5OGRIQWJlRGhuYzJRRExuenFGZGpF?=
 =?utf-8?B?bm1MUUV6WTJIOWNOVkJWQWw4U1RtZEVmWlFxYUNZL1YrQ3BCNGtxbzM5YTB1?=
 =?utf-8?B?dTIxRDJNYUYvUFRQdkM2L1ZGQ2d2TG5iWkd4dWN6b3NpaDJkdnJxUGRPTXVt?=
 =?utf-8?B?S2xVRnE3NXFueVJ5V08xcFFnSkFLbWk1N1JtM2xBSVlBWjU2OFZNTGtKb2g0?=
 =?utf-8?B?T1NDRW13Ui8zNmxLbWRuSHE2V1pPdzcrTkE5M0RNRjlYKzdRODRqTUE0b1Iz?=
 =?utf-8?B?bjdob0ZhRlRmQkVEVktUR3RqbDNVY0J1VGJjS3crM29kNXhTV3NsdkN2R3N5?=
 =?utf-8?B?L3hpY3RnNWVBM0wxdGVVbW5xTVQ1cXhZaUY4RTcwMUtlWi8zMTZBbWk1eFM2?=
 =?utf-8?B?NjJxVkhkc2FEczY1UHRZaUNGYnZOKzJnZmh6aVVLMEZ2NGswYmhHdk5MTlZG?=
 =?utf-8?B?NGN3ZnVEUEl2WkNDeDF1UllQSkVmbWQ4d092NnpxRjJUUjhad3JkclMxSkJ3?=
 =?utf-8?B?UkVTM2EvcGE2anhiRmxmZ0xzbnErdk5lOG9KYUlERzdNdmVFc1g1T1ZLcFp0?=
 =?utf-8?B?TVgwdEVoMk5hMjI5TlpJeEZ0V3h5akI1ZmxCeWhhQjNBN1V1M1JmZ0VlQnBq?=
 =?utf-8?B?d3ZnSHRWSkJWbktCckE0U0F0ZnlESUNsaVFQaDFrWEtoMmhzTE1qTEl4cjlO?=
 =?utf-8?B?UGJOUS92Q29maE5GcHdLMld6UlJUV1l4YTRWVEcrN1hERVY0UnVHdEV5OXFj?=
 =?utf-8?B?QlhmSlNwOGNmeEwrbFFwSTBVVHI1VFhjaUdyV052Ym96S0pja3NoMEdUV3hQ?=
 =?utf-8?B?eTRhKzZMY2hrOVFyZm1zd0R4M01FUUNQYmN4RTlBaWVaZzZsZUFSa3NMcnIr?=
 =?utf-8?B?blVoV3pidlArWjJvelVjMVBvSngrcTJEMk1RU0ZoVDNQV0pXL0QyaXFyRm94?=
 =?utf-8?B?QllyVDVDYlo4cVJPVW5FVkpDS21GM3JhamtZaG1qY05pelo5ZCsyVTc5TE9N?=
 =?utf-8?B?dWhRNmJ5S3IwdTN1dzZqSEtuVW1YelgwbmlzUElGUzU4S1lYaWFlTmFjcGVF?=
 =?utf-8?B?MWxZZTNZRlUwOU82QTJBcVRZY3NZSVFLSE9wNkNzam5EVFU5NDAvRUgxdEUz?=
 =?utf-8?B?eitSRCtlNVRZUkFQcDJMMitCbjlxTkE0M2pneW03dDFBYXpmbW5zSGQ4SFoz?=
 =?utf-8?B?VkZod1hrZjg4eDNObGVSUWtJclVqMXIvREFRcWVQM3JCc2hRM1V1dkx2R2hu?=
 =?utf-8?B?ODZRVUY4Yld1MUttT01NSkNnK1BXUnZ4Ty9WUVYwVkwzWk9ReDJRWWkwaGFM?=
 =?utf-8?B?cVREdjRSL1Jtbmt3enllOEhBcDlFVFpwNDNoRGpwSjM0Q01IbWFFWHhzQ0RF?=
 =?utf-8?B?emVSeGxjeFdNSlhabURybGd6OE1oOGJnVXFJN1JzdFB4bFZ3QVJnTjBEZ0F2?=
 =?utf-8?B?aXRvSGVkbldtNUlJVkdFM3JqT21IcmIrUWtnU2lrTnA1K1NsU2lkeXJrVTk5?=
 =?utf-8?B?elp6VHdHRWE4UDV6OXZEQ2JJTCtaQkpJZVVKdnNEKzlkN1A5M3VuMmRMekRw?=
 =?utf-8?B?Q2pTSUtPbzZUaVozVmN4Uk43dXZmUnZHRnJGS2c3T0FnRnZXTTlwcDRTZ1k4?=
 =?utf-8?B?ckNjRGdIbVpXUVpmclVsZHlPZ0FCaHdSTytYS0FyMitFUDl1TGphd0NwdTRJ?=
 =?utf-8?B?SllJaHVPUVZTT2dzNjRFYmV2R2N5RENEM0NUcExTOFU5ZktBOGJ4bmdWYVJI?=
 =?utf-8?B?UEJUL0VucXptZHVQZm1rZXJ4N0ZJanlReEdrRjFybUR2Y0ttRXNueFg4czNa?=
 =?utf-8?B?eXVIdFZFRkVEYnFtRHAvb3BnWTNFdTRvMDhYUEU2SFJrS1dLUHNyS0lPZzBH?=
 =?utf-8?B?aUhGR0xSMDhXSDg2K1pSMzk0VjhUZkN1NjJJQ09LMG5FTWcxekFYOFhHQTFZ?=
 =?utf-8?B?UkEwTkQ0L0gyRkZzNG4xNk9LZ2N5Z1FJQ0o4WDRLNk1GU1ZFMi8vc1FLUFox?=
 =?utf-8?B?bTNtVjVNUlpnbkpNWW9ZVkg2Yy9vUnZKNEptWnpPTVQ1MTdBNkdKQVloaG1I?=
 =?utf-8?Q?SgD+mvoRONqq7a4y+X8GRMW5f?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b1d174-76d4-452d-df05-08db634f9794
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 09:56:10.1783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K795I+yBCmsB8xGZTa2SNnp8X2xNqQyMWPgtIHx3eJtTtgNpEqnF4sS7+d15EvD2SsMA3OfSBF1YmLu6IfbXMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8996

On 01.06.2023 16:48, Andrew Cooper wrote:
> @@ -593,15 +596,85 @@ static bool __init retpoline_calculations(void)
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
>       *
> +     * However, we doesn't need perfect adherence to the spec.  Identify the

Nit: "don't" or "it"?

> +     * broken cases (so we stand a chance of spotting violated assumptions),
> +     * and fix up Rows 1 and 3 so Xen can use RSBA || RRSBA to identify
> +     * "alternative predictors potentially in use".

Considering that it's rows 2, 6, 7, and 8 which are broken, I find this
comment a little misleading. To me it doesn't become clear whether them
subsequently being left alone (and merely a log message issued) is
intentional.

> +     */
> +    if ( cpu_has_eibrs ? cpu_has_rsba  /* Rows 7, 8 */
> +                       : cpu_has_rrsba /* Rows 2, 6 */ )
> +        printk(XENLOG_ERR
> +               "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RSBA %u, EIBRS %u, RRSBA %u\n",
> +               boot_cpu_data.x86, boot_cpu_data.x86_model,
> +               boot_cpu_data.x86_mask, ucode_rev,
> +               cpu_has_rsba, cpu_has_eibrs, cpu_has_rrsba);
> +
> +    /*
>       * Processors offering Enhanced IBRS are not guarenteed to be
>       * repoline-safe.
>       */
> -    if ( cpu_has_rsba || cpu_has_eibrs )
> +    if ( cpu_has_eibrs )
> +    {
> +        /*
> +         * Prior to the August 2023 microcode, many eIBRS-capable parts did
> +         * not enumerate RRSBA.
> +         */
> +        if ( !cpu_has_rrsba )
> +            setup_force_cpu_cap(X86_FEATURE_RRSBA);
> +
> +        return false;
> +    }

No clearing of RSBA in this case? I fear we may end up with misbehavior if
our own records aren't kept consistent with our assumptions. (This then
extends to the "just a log message" above as well.)

Also the inner conditional continues to strike me as odd; could you add
half a sentence to the comment (or description) as to meaning to leave
is_forced_cpu_cap() function correctly (which in turn raises the question
whether - down the road - this is actually going to matter)?

> +    /*
> +     * RSBA is explicitly enumerated in some cases, but may also be set by a
> +     * hypervisor to indicate that we may move to a processor which isn't
> +     * retpoline-safe.
> +     */
> +    if ( cpu_has_rsba )
>          return false;
>  
> +    /*
> +     * At this point, we've filtered all the legal RSBA || RRSBA cases (or the
> +     * known non-ideal cases).  If ARCH_CAPS is visible, trust the absence of
> +     * RSBA || RRSBA.  There's no known microcode which advertises ARCH_CAPS
> +     * without RSBA or EIBRS, and if we're virtualised we can't rely the model
> +     * check anyway.
> +     */

I think "no known" wants further qualification: When IBRSB was first
introduced, EIBRS and RSBA weren't even known about. I also didn't
think all hardware (i.e. sufficiently old one) did get newer ucode
when these started to be known. Possibly you mean "... which wrongly
advertises ..."?

> @@ -689,6 +762,15 @@ static bool __init retpoline_calculations(void)
>          break;
>      }
>  
> +    if ( !safe )
> +    {
> +        /*
> +         * Note: the eIBRS-capable parts are filtered out earlier, so the
> +         * remainder here are the ones which suffer only RSBA behaviour.
> +         */

As I think I had mentioned already, I find "only" here odd, when RSBA
is more severe than RRSBA. Maybe the "only" could move earlier, e.g.
between "are" and "the"? Then again this may be another non-native-
speaker issue of mine ...

Jan

