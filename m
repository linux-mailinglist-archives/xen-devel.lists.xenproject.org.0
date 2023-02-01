Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A4A686CCC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 18:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488371.756412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNGp9-0000Cm-EY; Wed, 01 Feb 2023 17:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488371.756412; Wed, 01 Feb 2023 17:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNGp9-0000AT-Br; Wed, 01 Feb 2023 17:23:07 +0000
Received: by outflank-mailman (input) for mailman id 488371;
 Wed, 01 Feb 2023 17:23:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMue=55=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pNGp7-00007c-D1
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 17:23:05 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 147b78ab-a255-11ed-b63b-5f92e7d2e73a;
 Wed, 01 Feb 2023 18:23:03 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by IA1PR12MB7589.namprd12.prod.outlook.com (2603:10b6:208:42b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Wed, 1 Feb
 2023 17:23:00 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a%5]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 17:22:59 +0000
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
X-Inumbo-ID: 147b78ab-a255-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aadjURwlSwYvRmgmN8Vt8w9rYNvlnAYHAWjjzf0M4f4rDD/tnkHRcegt6RxbJ5z3AJAfuux/+P7GQb4yUrMkO8btu6YjZnjhvitboayctBOqh2cuF8EowDmkGnTX9WJliu5rqKC5IS8e/9v9rZsn7CN+ZUb591I3jTDl4f9ho0t1YLtdfDN796LfuL4ZuOzOY2FuPA5agaa8XJNExaudTzdTczMqkqdJEqZVIbFQo6OnU7wku/gVrw1jR73CnRNQfX2X1OqDFvF1497Awc3KIJO+daVF54NxaP0pjhjwoPwIGfXEBUi6mFC+RVy1pvrool++Zu1hHOXl+u8AxphnLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vT3+Q0FqEUI+MrO5MSmCjiNIjXIEaPuJjz3zdnfZubw=;
 b=EWQM8suds/988UpY2pt1GuoIWtyAntHq5bLYXusU7zQi6wApCmwg6UxKYm3mC9lCDK9Cir21KVNthzuk1iGDg21RDzsoZEsutiKdcqMiIx6R8ALysbm3NXir2ql62oZQgSvDTvYgHUCqtnwAa73yxm0Ppv4sgfLHJkEMfU2UUodco/wwk/v8gIpPANxa+yv6Jl60PzT/j79Zto9bSxkvD5K4mhs+mrX8wplA6g9NMu+5Bx2a0t3W9mNemmvxmkGwlCi8m0vurhrcZGPwk5bqEcsZ38CcphAQB9KWQH4+jEI1S3azx9Yn9TZTjzGVTMuLHWcgSe7gfKf0PjFvBWII3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vT3+Q0FqEUI+MrO5MSmCjiNIjXIEaPuJjz3zdnfZubw=;
 b=IeG9HbdNdCLykbh0xlkcZQyS1CgwlWf2Z+Urf4KDWT/rZVTfcN8WIUCxhdfA3nFs4MyUYJuZUshnS1998OYKHNMP+ndm6VU0qP7FipMVWG61dIstl+6SfT9EUZLvnhRaPkLxxY5/p1P0kWJAiQf5Q9iH5WOtyycaYGRy+UKsN08=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b753db25-f4e2-1f55-5450-d8a1681603b7@amd.com>
Date: Wed, 1 Feb 2023 09:22:57 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 15/16] tools/libs/light: Implement new libxl
 functions for device tree overlay ops
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org,
 Luca.Fancellu@arm.com, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-9-vikram.garhwal@amd.com>
 <Y5NpZiWZOssDwX5Z@perard.uk.xensource.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <Y5NpZiWZOssDwX5Z@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::30) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|IA1PR12MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b92a1a5-35cd-4bf8-d870-08db0478f770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PZDw5SQncV+qYa/ea1OvJKtYLT3f7iV7vmti6JUE6qkiXlbREGUqDhv+tGPE8PEHskM/lZ7IO9Qj+oRhLuIqbLGHKXTII1W/GfMJVu1Pw1eAqxuf8PlXEdfkjDMpMR+mH2kFxmaIVpkAKtsQ/+XfOE6Q4lHVN/MOcZ9s6R23vxLj/HUN34rKslxAt4EIULLnejZc62fGtiVFHC9+bVgI3SxsV89QSb1//WFatpn1EqsvxjIDvxbVgdkTSOzj8TJXbIajhuOfzq/smdf9AGp/f+BfsKmkIRVwNH2s583NYE7EQt7XByqXTgSX1Zhuhx/Dzy4iA76Ih5WlL39s07/gs0fLj+sbsL0pHelag6Bm5nadvx1ktFIQbnvzZVh+8aT1/XZDzskQjnbbCIFYgpwUrPAua+pX3L+sB8IDaHJsEzSoZjK87/d43Ey0thoY4jb05tcVGpls/fF7ILxXaGr3y/fXi0xOJf5D8PJkOLzYlpWYde4WkErX4bBY82YVFiextqmzoknWQrhGtTvcYYLNY54hRgd68o1JONu9Gl1bPSu8Ce6Kg4/ls6r3JTG+hoyo6bFA9pw2pvavNzliNHlYoGzFRynWDZTtlZAISf8ubD7lbSXEi6KrnQozUrIcWHsqVfXQeDn2y30zBGPAMyxF9/Awmmku0u1TX4OoMh7X+N2onU+merLtmDBi3c5lf5o03f8PzUmYPz+PpAkUvTCsX8yY3jbrbBjWVw14RuggU30=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199018)(41300700001)(44832011)(53546011)(8936002)(86362001)(66556008)(5660300002)(38100700002)(2616005)(66476007)(31696002)(4326008)(6916009)(6486002)(66946007)(8676002)(316002)(54906003)(478600001)(36756003)(6512007)(186003)(26005)(6506007)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zlc1a2dMUHFsbTl0MEwxRkI4T3dNWm83eGJIMjN0ZEZxUDdXRXBjT3JMWGFr?=
 =?utf-8?B?NHNGMW5OVGZhMlFPbEdVM0Y5Q0R0VG92WTlVcXhUeVFYeWViKzVwWWJFcjNP?=
 =?utf-8?B?UXorbUlWRE8yYlhCSkZYR1JuaUNMUEgva3hRMldaeWw5L1BLRGh4MmQ4TE9B?=
 =?utf-8?B?YkNsSTYzTVMzRk8xZjdaUmZ2TDltZld5bFNESE1ReVNjNENLdXhHMGVodjlu?=
 =?utf-8?B?clNZN3lRcmNMRi9neENMbDY4M1BJMEs5MG51RUM1N3lOeUtxME9NQTVjUmps?=
 =?utf-8?B?dTJhM1J5YzFGdDZSYmIzSWhpWC9LWU9Ba2hRa2RxMytGdGROSlIyYmVxZUR2?=
 =?utf-8?B?Tyt5N3JVTWVNdGhITkZYcStTSis3MlNONGlpVVgxZzc1T09iMFZEcnZHTmZX?=
 =?utf-8?B?c3dyYTFKZVh3WmpMdHdBMGJCcmhuQVQxSmJJUGpkTHc1RGNJeU5CdktoMXFk?=
 =?utf-8?B?Mk1PMVd6aGQ4VUpNK2dhOG90WDFsem00Q3FCUUpTUDdLQ3lJVkVPNmdZaXhy?=
 =?utf-8?B?NEp1UmpDVVVlWXl4TjJiVXFhMVJuL2JOV1JuZnJDSHIzbjM3VXZSWCtjUkRX?=
 =?utf-8?B?bmgvcTc3NWt5SGNiQVZkUHkxb25MWUpFSWJVQVpaV0wrRC90NlF6YWdVdUs3?=
 =?utf-8?B?WXFrK3R5bFpQQjJLVEFxU1hpc082ZWcrOW5SZ2FoeHRMMGVHV2xUSUkxcis3?=
 =?utf-8?B?dXN6bnlWRWZVTHNvSzhlYW1HQU5vaVV3L2t0Q01lQTZKSkhDUUpjaFNWTVpX?=
 =?utf-8?B?a1dTUUZxc0FPbXJBSzJoOFlnQzR6VmhVbnlZdHR4ZjF3eVdmcmZhSVpGUzFR?=
 =?utf-8?B?Lzd6amVVU0ZBVkpCcGtvS3RNK3dycVZEcXlQQmhUTlJQdjdwQXZzdTBqeXk0?=
 =?utf-8?B?OWRmMGkrNTVXZXJUK3NHZHBFTm50d1BpUnZLS1dwdzdIWk1GUExPZ2ZZTVVt?=
 =?utf-8?B?VnZhaE1sU3AwRHBXaWlQUnN6SktjalhGUEczUXlDdE5zVVhqMWRid1FQZUZE?=
 =?utf-8?B?WG54YmpGME9JQmN0S0NuTVlDM0ZUdGVnVE8wblcweU5jemI4WThpZFp2ejFS?=
 =?utf-8?B?NUxmZTZkdnExYWVEWFZQMXdEWENmM3p3Sk9KR3ZPb2J3T25YWmVDK1VWYVM5?=
 =?utf-8?B?U1VyR3UvcmoycWFGbUc5M21KNXJkQ2lGTWZOWjlHNEFQYjBxZHNCVmVKL0Vw?=
 =?utf-8?B?UThwWGgvNlNlMEc1RzJudW9zTkdPSTg1cWRiU3VKRDhEdHVUQ0hOYkpjNkJR?=
 =?utf-8?B?dTNwMFgyck5kd2x6VDlabVh2ZFl6bzhhOFNvck9QZGoxdG92bjRMbEFZUFNr?=
 =?utf-8?B?UmMrdDRkUHBsYjJWb2pMbVRVNlN6ZUMwWnYwNmtqMTlNemZEZEZSdldmWkw1?=
 =?utf-8?B?THJDRkl0ckw0SHEvTmM4bkFFRzY1ZEhYOU1vYndnUXgrY3FMMndiSVFCV3gv?=
 =?utf-8?B?ZnptWjFvTGt4RGhhQzRraFZpRzVud0l1VmZydkFhd0VHSnU3NmQva05wOGdv?=
 =?utf-8?B?d1ZuZHFrU1MvZFBJVXIrQ1U2YUpPQVNCNnM3RjU1d3phQWZFbnllTXk4UE5z?=
 =?utf-8?B?TFpNMmJHZkNiNjZRM200ZnBYL2NJN3VSMVhvUXUwSXBKUUdzYmJoa09RbzFZ?=
 =?utf-8?B?RXdFdkRLVERoa1NIWU5mMnVXZ3lOQmRtaGdOUEQ2R2d0a3NSbVArdjVTSjBR?=
 =?utf-8?B?bXVzaVNFcjM2cEpvMW5jNmZjWngxb1RCeU9kcjNISUtnanMrOFVIU0VBeWNJ?=
 =?utf-8?B?VXBtWFFUSm9qT0xYR1JrQ1NOMlY4RjRrS2JFT2xBNEVpSzlxRld0MUwyN1hy?=
 =?utf-8?B?Q0d1K2VuZHZMd2RhTzFZVkpzbkpvL3YxZTZSSzljdWxBNWdBZDU1N3lheDcy?=
 =?utf-8?B?TEY3RVJQSkgzMkg0YTBJOGRESWhrd2dzYWhUNmc4NmxIUVZrT0tQRm5UcmhS?=
 =?utf-8?B?LysvV3FuakR0VHpvdmI2a29Ldi9KZWJXQlA4VzhUdXFHNnZSNXQ0TUcvVTJs?=
 =?utf-8?B?U3dSZmx0WHpQc0kyZTVPcWgrSVdLc3F0T0ZIV2FqYXZvYWZhRkJQY0xmNDg0?=
 =?utf-8?B?NWJqakpoNG9MRVpVQUtvSkVDUUhObktoanBrQ2xjajRkeTMxenMvM0xDcVBQ?=
 =?utf-8?Q?p08/kPfbixCKjEGsmM2Ss7/3z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b92a1a5-35cd-4bf8-d870-08db0478f770
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 17:22:59.8401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCQ3ZbuzLfrGLRmXbq9E/OxgfoAy9kXHvTxhNbidW7h1FBvFIEl/HfEnFmPySyw7EzRw9+hwpbGT3Yd/gkku5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7589

Hi Anthony,

On 12/9/22 8:59 AM, Anthony PERARD wrote:
> On Tue, Dec 06, 2022 at 10:18:14PM -0800, Vikram Garhwal wrote:
>> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
>> index 2321a648a5..82fc7ce6b9 100644
>> --- a/tools/include/libxl.h
>> +++ b/tools/include/libxl.h
>> @@ -245,6 +245,11 @@
>>    */
>>   #define LIBXL_HAVE_DEVICETREE_PASSTHROUGH 1
>>   
>> +/**
>> + * This means Device Tree Overlay is supported.
>> + */
>> +#define LIBXL_HAVE_DT_OVERLAY 1
>> +
>>   /*
>>    * libxl_domain_build_info has device_model_user to specify the user to
>>    * run the device model with. See docs/misc/qemu-deprivilege.txt.
>> @@ -2448,6 +2453,9 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
>>                                           int *num);
>>   void libxl_device_pci_list_free(libxl_device_pci* list, int num);
>>   
>> +int libxl_dt_overlay(libxl_ctx *ctx, void *overlay,
>> +                     uint32_t overlay_size, uint8_t overlay_op);
>> +
> Could you guard both the LIBXL_HAVE_* macro and this prototype with "#if
> arm"? Since the dt_overlay operation to libxl built on arm.
Will do this in v5
>
>>   /*
>>    * Turns the current process into a backend device service daemon
>>    * for a driver domain.
>> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
>> index 374be1cfab..2fde58246e 100644
>> --- a/tools/libs/light/Makefile
>> +++ b/tools/libs/light/Makefile
>> @@ -111,6 +111,9 @@ OBJS-y += _libxl_types.o
>>   OBJS-y += libxl_flask.o
>>   OBJS-y += _libxl_types_internal.o
>>   
>> +# Device tree overlay is enabled only for ARM architecture.
>> +OBJS-$(CONFIG_ARM) += libxl_dt_overlay.o
>> +
>>   ifeq ($(CONFIG_LIBNL),y)
>>   CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
>>   endif
>> diff --git a/tools/libs/light/libxl_dt_overlay.c b/tools/libs/light/libxl_dt_overlay.c
>> new file mode 100644
>> index 0000000000..38cab880a0
>> --- /dev/null
>> +++ b/tools/libs/light/libxl_dt_overlay.c
>> +#include "libxl_osdeps.h" /* must come before any other headers */
>> +#include "libxl_internal.h"
>> +#include <libfdt.h>
>> +#include <xenguest.h>
>> +#include <xenctrl.h>
> Don't you need just xenctrl.h and not xenguest.h? (They both already are
> libxl_internal.h so I'm not sure if xenguest.h is needed., but
> xc_dt_overlay() is in xenctrl.h)
Thanks for spotting this. I will remove xenguest.h
>
> Thanks,
>

