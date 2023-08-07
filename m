Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7D9772878
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 17:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578588.906159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1i7-0004ew-39; Mon, 07 Aug 2023 14:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578588.906159; Mon, 07 Aug 2023 14:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1i7-0004dB-08; Mon, 07 Aug 2023 14:59:55 +0000
Received: by outflank-mailman (input) for mailman id 578588;
 Mon, 07 Aug 2023 14:59:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT1i5-0004d5-Ix
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:59:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7d00::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f5c7442-3533-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 16:59:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8554.eurprd04.prod.outlook.com (2603:10a6:20b:435::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 14:59:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 14:59:49 +0000
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
X-Inumbo-ID: 0f5c7442-3533-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqgEj1UJwAmVPmwhFXOsU/5wQIt+KbkQJ/knDLSG8oLsNyUTy6GG9t0Iy+OVWmvIYNDsQOsRepCahOH6Q8+XcKDCHm4ODFX6cvSBYC4YCW6UZ75NJDBg2GF5ly3QoaYeeEwv85rKvjadFP/B6JAeP25lLIB4MxmsMpQi0DPnqhe3fORZW7EcPxL96jlyZmWopJn6YbpM2zyo9CcTPtO4YOURDb8KNWXXbU0YUkbOH06dvZaVMRZ8uMXngAcplAOqPWjhebFx3YTbY9eqvqmsWacYl3BLq6f0YOLvuFUeN5KrRpYs/zTUIlU+AFRfPGfoLbQwJNThk00wR7CakuKMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjjszNJAg1agTj1Mvzb83fMug2Tcw1mS6kh4T4FWQNQ=;
 b=K4wGWVXoCu1uEfXNTsea68e4jJyRNKlPHn+CyZg0sbTAVenU1LcarlPUcyAHfnmgDPb0as0shNd7o+tqgWc8AZWGVvcHw7YJ0bzzqXrONH8StBDsAppauZjtp1tS2pGxxxhMRmmc7poTJNHB3TyHsXy0BG0f1UKDauohBXsjSZmPas4T0HSyj52uBSUlFw35kEPnzsdsONPrJWYpLHuf2Q73gJp5dthvEQ2hDutXtRtpId26qb0dSAmSbnxQOyKoixJgGmRtybilSuESgCYHn+wvzmKBpMRSK634Y0otFhWnThK9dTAWjMwG6cgfXt2WgZRPDBEiibcWPSBBijLn3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjjszNJAg1agTj1Mvzb83fMug2Tcw1mS6kh4T4FWQNQ=;
 b=UcHcaZk7TogHrkTkcygitPIxnx+2XP6qNBbUJeu+B7mSnZvHeN3Ex0MnyBpuuGjYEtlWC1/IGPHZDryG6joa/i/Twuc/kc+x3/jA/96JrYfYZ5HjP1Pz7ZNZQP4JQ0TgyVcxMC3DN6mSaBpZlVQTfK7qDhryJ0om6/RJohH6uLraY4iQIIXa2A4bZ0ce+94IcEZeXuu3TZ3yEQxLyCiCxyPVien5yqEr28zEoAzIQFQwyFkUV24gk8R+1l/qJAfA4qBnZbTDYSayZ0nJTnAfHy/kwpMTYMQftuHe7+YJmSvk3DyXKsV+oWO02DJ+qQqIfcMoJwNnu1I35/Fmewz/mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f2a01d5a-a768-dd83-c057-59eaa4e103d0@suse.com>
Date: Mon, 7 Aug 2023 16:59:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/4] xen/ppc: Parse device tree for OPAL node on PowerNV
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690934409.git.sanastasio@raptorengineering.com>
 <7026e54897e360d935d065c7ec904dc3f6082857.1690934409.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7026e54897e360d935d065c7ec904dc3f6082857.1690934409.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bba8ac8-ac12-436a-1fa3-08db9756f29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ke/fU2/AuACY6eUtKQfqGlkvoux/ux6j6MydlJn5/IFdG4y3EQZfZtOcjkc75F0V362ZFYg3o5Yy9pCWyBKhPKtIuH2zrUKXveqqCpwXxWb3m5g3YYz0s2+9x57MeE+9dH0kKcz5wvl4hapM7TXEMCtTbgTsNT2XHoEPu+Rhz+xwCcuANeiLTWXuvTut9p8Xi5pvM/lBy42ebnoqJi+xjShDHAWwYfwTQCDKumBrOyrlbdhIbKaE+t315BBOruHI/flD+0S/+kxuj/JkShYy96DPNhMTkErYtAb3EyjdIcCRFyoMM+YVcHRJWMCRBicLje2KxJgH2ZJg0mmMIU3zAjOw0mQRYy9znAChC1pgc0PQTOUJ77ECIcny4vZvjj+eahVhb5oC6TxPBqmbawX3GW1wH8sJdupQeFIFTDRow5dpdVKg4xKz4Zu+tAs+YAu72V1XCYQuL3V0U1SsF8RBT4HNgtqsIYLoXV9P5tUx7fRMIsI/lNGVDYJe7o+y6/n8TeMCrr0HRlFse357cm1/Xob1sEWzgrOXvpzlLcRkFxzBjQS86sfOR6lTQf0l9HHTC5WDRPAX/Qg5rB7NoVPLLipwM+XinwLHfIDcQRNtrt8784ZE6D3hO3xwITkO+HtLfUX4qYFnBD47T4K7wgb4FQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(376002)(136003)(346002)(186006)(1800799003)(451199021)(2616005)(478600001)(31686004)(83380400001)(6486002)(6512007)(53546011)(26005)(6506007)(41300700001)(66946007)(66556008)(66476007)(8936002)(8676002)(316002)(31696002)(4326008)(2906002)(6916009)(36756003)(54906003)(38100700002)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VldnSVdTbXIwQzh2ZUREUWhiWHh5ZU9GR1dWS0l2bThHaHFETE84anBCMTlC?=
 =?utf-8?B?aktGc2owQWhCWitNTGVSTDRyb2N2YjVSZ04wb1dXRmhBTnBjK05aTmE4azBm?=
 =?utf-8?B?NWxidjFkVG9UUEsyeFdkRFFMRmt2LzB1RHJ6REpLRXFrcUV5bzBibmpjZ3hD?=
 =?utf-8?B?N08rOXc0YzlFYnB0c1pZeTRvUmtZQjU0cTc3ek9KZGt6VTJndnZ2cnZySHZv?=
 =?utf-8?B?MnNBcmtyclJUcDdyL25HWGhkWkg3Y3c1dmlEMlJIQ2N5cG14UVBOWVZwV3I2?=
 =?utf-8?B?RHArTnRFaS9ld25lQStyeVBsSTh0WUFvTVdwZFNqSG9EbmJBTFVISlJOb01i?=
 =?utf-8?B?NnVkaERsS1Mrc1E1VG9BNDZHTzFFM0QwSFdGQUpacnNmQWp2bTlIdTJSdWxr?=
 =?utf-8?B?N29xaUljQW1CRWJPZURBMEdvNzIxNnVCWksyOXVqdlE4VVF3dzB3dGhtU2Np?=
 =?utf-8?B?RFVrWGhFVFQzRUJJS2RuMFl1eENPRCtYY0xCc1l1cjhhVkd6VDUvRFh6TWpU?=
 =?utf-8?B?dEwwaFpPZTBqSTdJVEdzTWdvYzd4UWlqN1ZBbEh3ZHlUQ2dlZ1QxRDdzL3R1?=
 =?utf-8?B?R0htZjlNVFRjZUhwTUFWWWlKdzdqSXdIRGorMzZzdnFwVnI2VC9wT2dOL3Zu?=
 =?utf-8?B?OTFFQWtweXdHNWdkSEUvbTE1SWkrZHVFNi9kajhFYlNkYzdla05pb3ByT3VF?=
 =?utf-8?B?bkR3OVZLOHkydHFtRWhCb0RjbFZhbTIwRVdHem1hTGRCK0FCWGZOYXM3d1dV?=
 =?utf-8?B?NkZ2OUlzaktHakVLY2ZTbmd5dnFEQlovMC91K3Y5SDJNSXNuTGdkeTdlaDJ3?=
 =?utf-8?B?dHJvNTdmMndmSWFJWkd0bE9VVnlUa2JlR3V1cXVLSEYyN1QzOWdBeHN6SzU0?=
 =?utf-8?B?dTdubkQwcHhiSE9pNkYyWi9EQXpRY3NqdDd0cG0vTDE5K25MVmw5UWlTRkli?=
 =?utf-8?B?QUJ6NlR1Rk1JZ2xwSVB4U0FkaEoxeGc5SjVOWlFabjdKdzNlUjlGemJTVElp?=
 =?utf-8?B?dXJFdmtJV2hoOHFXQ0E3YlpXQ2EzV2REanhIU1QrNGhMZXlpT2dyUEdXZitq?=
 =?utf-8?B?eXlYalBkaXB5dXA1Z2M1NXg4VnoyVjlFVHJPZXpmQlZzYit2Y1hkcjhwYzhl?=
 =?utf-8?B?TkhPWFhVWVdvMVlad3J0cWhIYnJnM3NyRlg3QktiR21OOGwyVm5UUjN4elB0?=
 =?utf-8?B?MWcvL3hWbklZSXNVUHBPT3B4ZXRTQUlXbDFVNWJXUVR3K3JlMnlFS1JBb2hl?=
 =?utf-8?B?RWlCS1ZmQTR3VnVuWU1NeHBtZFM1ZmRab3Y1N0liSlhXTzhBVUZXSFB6WjA3?=
 =?utf-8?B?ZUdiTGZkUUlsc3I5cTAzTnlYMTY2K3dmdzZxK0VKLzhrR1hSeGtxcTZVTzNC?=
 =?utf-8?B?T1NZTFgwemJkREp5OWlsTWdBTy9STnRobDZ3UWJnRmFWa3g1UGV6NEdGeTVn?=
 =?utf-8?B?Tm9CVlQxd0RnaUVMVjdSVnNjajNEUmQ4VG1zMHAvV1ZTRVNXcnZBbTdWU3JF?=
 =?utf-8?B?SExOVHFLVmEvVU9NcWx2Z1JFQU9KYU56WWNDRnJhbzhzQ1B5Uk9kRHBNeW0r?=
 =?utf-8?B?Zk9XbzV4MDg4QjNQWjUzS1ZoNmNVRStPNVp3a1pUUGRwQk5KamptRndZdTJt?=
 =?utf-8?B?Vi9zMzE4RGNCVHlOVVZYeDRwMnBNaGh1cVU1N1pTTHRkbmpPVWphNkNUVkM3?=
 =?utf-8?B?UVdoY2prdnkwNjBtOUZOdU5kdEpCbGNLaUlMQjBmM04xeEZVaGl1Tkl4OHFI?=
 =?utf-8?B?dVNmWlVyU2JqYlVnanlUMGtJVXorTWwwUXVlTE1YSFBaUm5oa3Q0anhVR1h2?=
 =?utf-8?B?S24wUWRTVlFyVHZsQlUvWWVZZzJKbzdrc3pKbzZYZlNOZlg3MXFlQ2I0U0xk?=
 =?utf-8?B?MFpCL1Q3RE9GUklGNzFEcHdkWENhTFBMbkc0WDM3WVVTbWh2bjA1dlBMdGE3?=
 =?utf-8?B?K1N5V0VMRjlsd0YxQXNyOHdTcExkNUFXbG1PNjhIT1ZZZVFJWCtjWjdmbnp3?=
 =?utf-8?B?NnJBM2FYSXF1azd3VUZ2NEYxaGxVb1JsSEpMUVRENTRLSGFVd1F2SDMwRUVa?=
 =?utf-8?B?cFlRZEdoOWdzd3l4THV6Z2VuWnRsdGR6TG5NQk9KU21qOGRzanB1U2hWOTV5?=
 =?utf-8?Q?ydhg1MwVBcezsLOOZkJt/31Ah?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bba8ac8-ac12-436a-1fa3-08db9756f29a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 14:59:49.8033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZNv6R5Zx3rzMSJCq1Uh6LywkZYManRUkf5OVL/4Yy8REZ/UUK9E2JTU+rq6tcek4mFLNEI0gdfu3d3gjV47lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8554

On 02.08.2023 02:11, Shawn Anastasio wrote:
> Communication with firmware boot services on PowerNV requires parsing
> the fdt blob passed by the bootloader in order to obtain the firmware
> entrypoint. Use Xen's libfdt to do this and store the information
> required for firmware calls, to be implemented in a future patch.
> 
> The full xen/common build doesn't yet work, but libfdt and its xen/lib
> dependency can be made to build by defining a few stub headers.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Looks all plausible, so with the earlier constraint
Acked-by: Jan Beulich <jbeulich@suse.com>

Just one nit:

> --- a/xen/arch/ppc/setup.c
> +++ b/xen/arch/ppc/setup.c
> @@ -18,8 +18,13 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
>      }
>      else
>      {
> -        /* kexec boot: Unimplemented */
> -        __builtin_trap();
> +        /*
> +         * kexec boot protocol
> +         *
> +         * TODO: This currently assumes an OPAL/PowerNV system, but it's also
> +         * possible to be kexec'd on an OF system.
> +         */
> +        boot_opal_init((void *) r3);

No blank please after a cast specifier. Can surely be taken care of
while committing.

Jan

