Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B469B401FE6
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 20:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180198.326750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNJez-0004ZQ-H8; Mon, 06 Sep 2021 18:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180198.326750; Mon, 06 Sep 2021 18:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNJez-0004Xd-DX; Mon, 06 Sep 2021 18:48:01 +0000
Received: by outflank-mailman (input) for mailman id 180198;
 Mon, 06 Sep 2021 18:48:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNJey-0004XX-3S
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 18:48:00 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f40e3060-0f42-11ec-b0b5-12813bfff9fa;
 Mon, 06 Sep 2021 18:47:58 +0000 (UTC)
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
X-Inumbo-ID: f40e3060-0f42-11ec-b0b5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630954077;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=r6dJB/O4rfn/f1vnVoxveZOWS+xUToPTgwygMcGwfpI=;
  b=Rsjv8lehegNjo5qlw5lNcflDBVWAr7HOW+jQRK8K6VmmMoR6tzvMUSRS
   Ua/9cl6ZIlqcKooSGPBqECPnzOs8G0F96YnwB+xcwb0nqrRyRP2riLqjJ
   99n6CfJ32ccEpjMmLMIuwP3n7k6ub/qifQvXOTNE8dj6oN3KXUR+OdwmQ
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AJXT4rlBSSGvZOOwuOBvuo4L/XXCjH0iB/CLg+0YhgkIHdyZY3o1gHnF7eu8qJCMNB/i9+9TNi
 HWUy60jzdt5mqsHpu+gAK6OloYu9Wt4aok1lFoZq6xmkU+v6ueyV/1V4UyAyCYloEpQfh3BHKj
 V9VQGid+3UGlX02V2svaAw1Wty4JfBZVXUXHQ88m6kcKWgxhBtCeWf0nZnXQeSoVneDG14yZmf
 TqRWTfYXEqjO5jt31PaKcxoxcBgDc4CzDE7pCJjEPYaRzmxyMQRcXYXo7hEdKmsLm3wHi+yGdb
 zHyNJK98xOp4tw/N/Sp/wbx3
X-SBRS: 5.1
X-MesageID: 52092572
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:krThmqrv7lTshhETEpBGsAQaV5u7L9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBbhHO1OkPYs1NCZLXXbUQqTXfxfBO7ZrQEIdBeOjtK1uZ
 0QFJSWTeeAd2SS7vyKkDVQcexQueVvmZrA7Yy1rwYPPHJXguNbnmNE426gYzxLrWJ9dPwE/f
 Snl6h6TnabCA8qhpPRPAh6YwGPnayHqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD19jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU+11rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAxzb5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwtjrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGZgoBW+q3vYp0PJGbCfqBb0fbllwS+3UoJgXfw/fZv3Uvpr/kGOt55D+
 etCNUgqFgBdL5RUUtHPpZ1fSKAMB26ffv9ChPhHb3ZLtByB5vske+93Fxn3pDhRHQ3pKFC76
 gpFmko7FIPRw==
X-IronPort-AV: E=Sophos;i="5.85,273,1624334400"; 
   d="scan'208";a="52092572"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBKZzdLwZtsB+VXBUp2mxSzyT6moFjPoWyL4WCfVs0n2ntpJe1w9x+Zx8bmXfCUasUiIPXnDqd/ECk3wsYoF4t5n9o/JGxXObv6ri+b/+7DcXaZscSFyyNGNsVjN1admH4bG1n5IZHIbY83Xz2SL3pN4H6J1IYABTTAq/95NSFuqOnsjv/ZSaPWJylLQcMFN/QZPNltDywJ4TBPYxrnucVpADbCBjdUoSwPKzrjdeUhdEj9tKCagi07dLIlrryAZ89EunokQwW3EBz7EaKTDU7Rlpp73dyrc8S3nQuy9F9fOjUsqw/Mbh/IGdMmhP++ho0SZa7UaqGT5BgOV1QLWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=e4AQjytToAgMKCwoiUEbPXNarq36A5NlNm1hQZ3oCF4=;
 b=kaEut+8XyJVY9pgOb4iHnBOwttBa0umwAIzZ0SzgRV4SNdVU4xe+Ilec6Fc1rh/wVISRSXn4anfxrdtB0kRpwbqRD0OUZp31wyXt+DlQJXPfwV6IGXKRhwoJLAATlNJWf2dHLa/bWJmr2SiOB/ODT6s42fwnoFHXbO7ZQAVQ0Iz5ggNVU5TUD1UxfHSVXQtdhStx73WXAFE72N/DudbQZK4N0h1aUmAqe6CdVWHoSG/4uOBkUbtMFNj6U+YM6HnsiRQzIQzY1QYnZqcsSfSQZdNLRo2IQhx2mQyfVoKVsQs2ZQHUHcj0o3hDGSJ3HWriiOwSzsv3C8Hssoy6WjMpxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4AQjytToAgMKCwoiUEbPXNarq36A5NlNm1hQZ3oCF4=;
 b=ZHGKSmrC8P2b22k35rEseaVQq0SD0aukCRAqHAxLz1LZOsdenGFnWWttGeSWUkTu6ZKPvSqnWzD17ci6q296hbAjWup3gTHCX170PQTjWDnUO5EclDXCjxKQ8YSKEpemzYTc7bB5iWwVVUMnAUqzAPXXNye3R/7Vl7sl3LVTL4E=
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-8-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 07/11] xsm: decouple xsm header inclusion selection
Message-ID: <17155620-d091-3205-6af0-65e19dfa1bfb@citrix.com>
Date: Mon, 6 Sep 2021 19:47:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210903190629.11917-8-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0387.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63831b78-91ee-4d2c-4469-08d97166d309
X-MS-TrafficTypeDiagnostic: BYAPR03MB4486:
X-Microsoft-Antispam-PRVS: <BYAPR03MB448689936667101A67D816D0BAD29@BYAPR03MB4486.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f9UTy/Dwkc1ycStsa0hSSBSjyk6nDxfVvcaJj2+Ib/xKnvnm9mIOTWRiOmFVjWAj7iFqOKbHEhzDfWVaqOP5EDdEo1QDmSglp3g5T/89TEFf59iGWo7btKfYjIluc49lQbXHgLPnd6+k2MC9HiT4FhgOgeYV7vozUDmYdVJUR19BntOPkyel2RxiC+S0jt6ImspW/nQI1eRpWzpgK8sFxYQao6ngf1ysLZFFV6ff0HUtHAhCtGqOYAIQMXaTH5/oNJsQ5vZD6CwjQMkxJRv4gE+DyulIo+3Ghrm+BB6FBYtaK/QMNTvKKUVyUBR4D9WX7x4zYj4TUUF93RODMcr1+F/LA2ykj0i4KQBzRrknML0o9h79eVu73ulnIqoxfZy7BxTGdPiMcIR/LQeidomd7FS0A/Dft5Tuzqu3O3Zu1k6MvurqQ+P8ReO9aZQ+1iihrqHkmvnlrIuug8JPRHUnEEUQBFrKOKrsSN7xTlBuu5kjezHE3o9mUTc6bkyHWBhfed/yirYwMblX1xynBnqZyc+fVID3W6G9Wxh7uTl4mHNzsEBG7veii9Ta0u07P6HF+CO87kmreW4Z0wnmdHGvxwrTnJp0uEPwks2bmDVaEldpmrFVl22HHfttgnuqGXmjDcm3ukecAuHgdKGo3AFGABbGXj1WgTiXyRxRTKLCqgEcakyJB3qyF2ixv5RY0hqpAROo/QUjGrFL1U8CrdFqEuNWJEbPQdLO2+c1uudLyUWZ44lZ6evLE07LI3hqZzhX6EUuE5ChZMRgQ2K5BqZAhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(36756003)(31696002)(66556008)(8676002)(66476007)(86362001)(2906002)(38100700002)(2616005)(956004)(6486002)(26005)(55236004)(478600001)(31686004)(4326008)(6666004)(53546011)(83380400001)(8936002)(316002)(16576012)(5660300002)(66946007)(186003)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXBYYlBZR21mY0ZIMk11Z04vaUk0ZVNZbHd2d3BIUEF6WWxBVXVUNDk4SzJO?=
 =?utf-8?B?V2xtQU03QlFaMnY5dnZIWUxlZFRGZHJWVnJ1WGk1UWVDbFRKRENSKzJmeUF2?=
 =?utf-8?B?Z25ueWRKZjRnWnl4Y1VTYUJ3eHVBZmRqbUpBUmhvYTU3ZmJtT1cyL1R6RnhB?=
 =?utf-8?B?UDdwbWZtdys2eWxXNjdsaTF6cVlZYVUxU2tja3pJM1BMZWlycGxHc0FCSGFX?=
 =?utf-8?B?NU9CanZGMmgrcitkdUovVS8rdE1QVUo3Y3VOekZ6TkhuM1FWZ09uNERpVmw4?=
 =?utf-8?B?UDgzS2FFRzRtcUxQekdpYStZVW5GZk02VDVtcWVMY28yL05BL1JiVTNaMFJw?=
 =?utf-8?B?UDljT3RCZ1FMZXNhOWxNSk0xT0ROd2ZHT3RVWElyUU1UOGhaeldVd1NCblRt?=
 =?utf-8?B?WElEdm5qeEg3bUlDOW0za3BnSEoxRGNiSnU4YzBMb0JVRGhKaFV0U1JXL3Ix?=
 =?utf-8?B?K3pLMkpSMkYzMmE3TmVYY3ZaVnFIL0p1SU0xZXVkV05rUGtJODFyUlVMSU16?=
 =?utf-8?B?NU5ZYWpQaXcxcWZEK0EvVXJtZ1JrWkQydnhQbnZyVW0zR3lOZFRYSjUvNmpN?=
 =?utf-8?B?RFJIQ0hkVDc4a2xyYSt2cGx1OVdsUzNXU3cya1B1ODNaMDZIcldhVlJZczVB?=
 =?utf-8?B?Q043WHgvMjhkZ3AyYUZKSHFmNWRMSjBDaXhtMmJXWHpIV3diOTFWaysrV2xa?=
 =?utf-8?B?K2ozNGYzUXE4THkyQkNPaC9IRjhQdVRoTXNhZWp4aERrYm4yeEVudGxMUUM1?=
 =?utf-8?B?em5ERWV3OHlDK0NTQmk1SEJTRmpQdTN4bVI4aHBKaXhxS3FvQ3doWlBtVGYr?=
 =?utf-8?B?UFR2a1BXdEdJb3BjZWQxcmdxTHNsSWlneDYvMFpsdndPMkd4N0dyL2VpcUlU?=
 =?utf-8?B?cG9VWWVubkh4ak9Md21QaHRWeWpLQTgvNjRJdjlUOUF1Nm5HdUoxc1lRRFhU?=
 =?utf-8?B?eHpxNEtGeUE2Ui94TWxTbTNRNGRDdWY0N0FReXFJbDBZNlVNV0MzcElYa2dK?=
 =?utf-8?B?TFlYeFR3Z3I2UFhpcGpYZWkzamttQUdvWXZYUXYyVUVuUDY4M0VkRGxLWVdW?=
 =?utf-8?B?WmhOS054ckRMSytxR3VWOWNvaGhicHp3eFZRYXplRzFZY2thSE5OVFgreEh3?=
 =?utf-8?B?M2FDUDRybHByRks2aFM4emhleS81UnV5Vk8rZi9sZlZVWHl3UXRhb0NidDdK?=
 =?utf-8?B?Z0dSbjdTeS9iSXBYZjlQTEJxTWZTdVZQUEw4Zkp0dHllQ25JUi9RYkgyTWVy?=
 =?utf-8?B?SU8zM21Ia3RQeitHSGFqLys1WjFPQVlxN0dpdzd3VGZ2UEpkdW5pWDlSZ25I?=
 =?utf-8?B?UlhxSTJ6RnFyUXRIaGZDcEQwQkU3N3RpWDhqV0YyYTZuRGZ6eU9kaFBCVUVq?=
 =?utf-8?B?NUVGWlB0S3JMTVU5cTZUOGlwTE5DWXk0S2diMjBjL3FqcHRnUmdMSmZFVEFD?=
 =?utf-8?B?VGFLZjgxZDNWWVNYKzU3RkhXOTZheG1uL01lWjRGRUlKL2pCa3RIcVZzb3pu?=
 =?utf-8?B?YXJId0hWaUhueHo4cld0UVJ0Y2J0UTlyQitKZjF3NCt1clZkQ2JvK0YzOVBI?=
 =?utf-8?B?c28zVk5TVUVNYnNBd1Q3SWpKN3lZczJJb01tNlc3VDNscXJzQm5WT1ZZb3Fv?=
 =?utf-8?B?RVhNcW5HbVpTRHVhb0VWSDQvSExnelhJdCszWE96cnE5RjVoK29hTnBlL2kx?=
 =?utf-8?B?ZTM0T2hJSDl6R0p3NVdIU3hSK25LcG5JOUo4QmJqcVBhZndQT2lPbzFIaUF2?=
 =?utf-8?Q?AxC7FWQIjPZW5IhY7ZZI+ghemaCPZ9YNxy6fCEp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63831b78-91ee-4d2c-4469-08d97166d309
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 18:47:49.2757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ee5h9aRE/tlvyyacY8LXzVAV3io5aOiAho/akPkCD4X9bQo2veBzcMdQd2zHb1eZG7s6KAjFI/pHgZq3kM5EIQqhs/HlP6rWrtMTSrkqWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4486
X-OriginatorOrg: citrix.com

On 03/09/2021 20:06, Daniel P. Smith wrote:
> diff --git a/xen/include/xsm/xsm-core.h b/xen/include/xsm/xsm-core.h
> new file mode 100644
> index 0000000000..4555e111dc
> --- /dev/null
> +++ b/xen/include/xsm/xsm-core.h
> @@ -0,0 +1,274 @@
> +/*
> + *  This file contains the XSM hook definitions for Xen.
> + *
> + *  This work is based on the LSM implementation in Linux 2.6.13.4.
> + *
> + *  Author:  George Coker, <gscoker@alpha.ncsc.mil>
> + *
> + *  Contributors: Michael LeMay, <mdlemay@epoch.ncsc.mil>
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2,
> + *  as published by the Free Software Foundation.
> + */
> +
> +#ifndef __XSM_CORE_H__
> +#define __XSM_CORE_H__
> +
> +#include <xen/sched.h>
> +#include <xen/multiboot.h>
> +
> +/* policy magic number (defined by XSM_MAGIC) */
> +typedef uint32_t xsm_magic_t;
> +
> +#ifdef CONFIG_XSM_FLASK
> +#define XSM_MAGIC 0xf97cff8c
> +#else
> +#define XSM_MAGIC 0x0
> +#endif

Eww.=C2=A0 I know you're only moving code, but this construct is broken
(right from XSM's introduction in c/s d046f361dc937), and creates a
fairly-severe bug.

It causes xsm_multiboot_policy_init() to malfunction and accept a module
which starts with 4 zeroes, rather than the flask magic number.=C2=A0 The o=
ne
caller is suitably guarded so this is only a latent bug right now, but I
don't think we could credibly security support the code without this
being fixed.=C2=A0 (Again - fine to add to the todo list.=C2=A0 I know ther=
e's
loads to do)

> +
> +/* These annotations are used by callers and in dummy.h to document the
> + * default actions of XSM hooks. They should be compiled out otherwise.
> + */

For the coding style patch, this should be

/*
=C2=A0* These ...

> +#ifdef CONFIG_XSM
> +
> +#ifdef CONFIG_MULTIBOOT
> +int xsm_multiboot_init(unsigned long *module_map,
> +                       const multiboot_info_t *mbi);
> +int xsm_multiboot_policy_init(unsigned long *module_map,
> +                              const multiboot_info_t *mbi,
> +                              void **policy_buffer,
> +                              size_t *policy_size);
> +#endif
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +/*
> + * Initialize XSM
> + *
> + * On success, return 1 if using SILO mode else 0.
> + */
> +int xsm_dt_init(void);
> +int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
> +bool has_xsm_magic(paddr_t);
> +#endif
> +
> +#ifdef CONFIG_XSM_FLASK
> +const struct xsm_ops *flask_init(const void *policy_buffer,
> +                                 size_t policy_size);
> +#else
> +static inline const struct xsm_ops *flask_init(const void *policy_buffer=
,
> +                                               size_t policy_size)
> +{
> +    return NULL;
> +}
> +#endif
> +
> +#ifdef CONFIG_XSM_SILO
> +const struct xsm_ops *silo_init(void);
> +#else
> +static const inline struct xsm_ops *silo_init(void)
> +{
> +    return NULL;
> +}
> +#endif
> +
> +#else /* CONFIG_XSM */
> +
> +#ifdef CONFIG_MULTIBOOT
> +static inline int xsm_multiboot_init(unsigned long *module_map,
> +                                     const multiboot_info_t *mbi)
> +{
> +    return 0;
> +}
> +#endif
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +static inline int xsm_dt_init(void)
> +{
> +    return 0;
> +}
> +
> +static inline bool has_xsm_magic(paddr_t start)
> +{
> +    return false;
> +}
> +#endif /* CONFIG_HAS_DEVICE_TREE */

Shouldn't this be an #ifndef CONFIG_HAS_DEVICE_TREE ?

And the answer is no because of the #else /* CONFIG_XSM */ higher up,
but it is incredibly deceptive to read.


I think this logic would be far easier to follow as:

#if IS_ENABLED(CONFIG_XSM) && IS_ENABLED(CONFIG_MULTIBOOT)
...
#else
...
#endif

etc.

rather than having two separate #ifdef CONFIG_MULTIBOOT blocks doing
opposite things due to the position of intermixed #ifdef CONFIG_XSM.

~Andrew


