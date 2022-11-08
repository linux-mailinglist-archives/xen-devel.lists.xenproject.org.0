Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9AF6218DE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:56:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440226.694358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQxc-0005W7-Io; Tue, 08 Nov 2022 15:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440226.694358; Tue, 08 Nov 2022 15:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQxc-0005Td-G0; Tue, 08 Nov 2022 15:56:24 +0000
Received: by outflank-mailman (input) for mailman id 440226;
 Tue, 08 Nov 2022 15:56:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osQxa-0005TT-E8
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:56:22 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2062.outbound.protection.outlook.com [40.107.103.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e34b1017-5f7d-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 16:56:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8390.eurprd04.prod.outlook.com (2603:10a6:102:1c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Tue, 8 Nov
 2022 15:56:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 15:56:18 +0000
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
X-Inumbo-ID: e34b1017-5f7d-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egHCckw/QYQj3tKMNbkcx1XqxHeMz24R2p5t5DBCkCH6KziXjZBDFzuP76Qu30CRzHhpBzMkR4W9MyS6xSulq9LjxJSVA5R9orbEma3i+vm/JJFhOZMk4sBD9BTmjl1EIJjMY1YBSMdJwNGvtkHT5VWFaImV3TZuB7vHa2iHrMaPrui9+Vr2e+lYQTo5nQufDU1pOMJHZ7dtbSvr5xbS28KiVd7nQlItQEAO6/2JbMpryjwRzF8wSN6DUkP4LwELxccjRVnp8yYa/zOPEue9VWQ9WivLsq04W0Ehfpzr1TNEvhPpqDJKmZfj1wtVYs/LCkITAWpe6oX+PFi6GCwlew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VRjwtrJlSzhbCBzA6nF4Y5j6DTAKcPRKpNr0mhveYY=;
 b=IT0/2gKevDbrritWf2C/i6kepsicZE1lhUtQc5TiDE2c5zdgc+gGHHy7bSzgCEsl+lxbpGHKcitechfA40PlSuRbk7tdkb4pcqfDgI2Sa/bPbVnKNQdenVHhA3Al0+2lQglSn9AESwN2d6zSSEyJCikksoBX6lTX+16BfRKoKP8yfN1flS0hd9B6yXnaWnJooOINbG+N2u9WWtFyvewuzKfpEUo0Ug1NptaIeZhF/023C3Gz3ySkg3Qq++PHV2Qfedao1ynQNtVLdXdaWrWc+MZp5qSocRCULGNUlIylgASXrVIQbnO6u+LGAcDapkbRS+Bl9Ht8I5rXLujGfySzQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VRjwtrJlSzhbCBzA6nF4Y5j6DTAKcPRKpNr0mhveYY=;
 b=sbOfEnoJYud9K0pE4VVwkBIo7KDd+i544GGyyHvMK/kADd2INW0WT4lj44Pw4qdlcTp+swaMd34qJkMRzvhNv1SrU/JfPJV+E1SQJWjCJwM11YA2/6HnCM/7qusYCEAY+z5BHkqq4KnFS0sEyqnsAkNLd3pxDrdIc7MGlKW0PPI22eeACa3Nftm0wyJIkqHxIQKymfQtoA2zQhzojvW3p5EDKDSlXOGtYzeclpM6H4hnmTKnv/E9RooOBg6UC9rhuMWtR7ae5uc4mLhP1O+n7wHGAXP/ogUWjtkICNhR0wXUCQHjzGjoXPNnm4bWQVYIHyTIrKIjcyaU47Gx7UTPTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b785cc6-2de1-a522-9e57-62c0421c6a21@suse.com>
Date: Tue, 8 Nov 2022 16:56:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17?] x86/pvh: report ACPI VFCT table to dom0 if
 present
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, ray.huang@amd.com, Alexander.Deucher@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221108135516.62775-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221108135516.62775-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0043.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: edf64e00-3d92-4130-fe5d-08dac1a1c624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	goYNe0YWYXYrkhwLcwwpio6pamQVzPbw5wMrtoWpSugh08Ms9sIzBoNHgXMAqun72fx/HRccbZEMBRKSX5LZqK/cyInwOusfd09OqqWp2vZT53kS+VTUjerpu52N3n7F3nE43GPPgNoDI1/YGa6aQoFfGHXGv25rvF/P9dCzK85h8R1lQWw8+LqQFcuz90jVPWzvWWmMWToO6cGpnd0tZ5f6pGa/MH93PAA7HLJfKgBDuzucGSR/tb2xWEs2j/lr5MudxN6YUS1jwkaCgYkDs0t3ZwkIYNTy1JybiJ1kuEJ1oSZXpsLlEKKCffmlBOjC482jER+8/DYncQ62UPpQ0GVfkAwa38wDEkrRQcqCpgTMu3n+uVv6k6g+cR18SSwDnEygZsUe6lfVjTD2upMjMZr9bAZfEO/e9pDJMBRfva5OcwIL2rW2Ij1qzp/+VQrBzOAt0teWasLXm+sc9+Zr8GiGK3wBmHqt/7lWXorJ+vhkQhooC4ptTc0LvmYGY7CYf9JxBjSxep7TvbMEYC1/VOFYKwaAxCX/3Be8SX16SEIYZNr2wrsENIxyAoBpLewHhIUMo79BJSHslxQogso7Zz+eHtfhLcHhjbv7YUwXajNFsmboBp7iR34gaIfnjrYHgyoNXc4/Bo7asz3RSGg3gOTjpOLFUM9KBSPMsIYbCZ/duo7GF9c9bdcdvN0MskmwnBcR9evCLCFoswlbJHEqns3t1kWp+ZJt3aNqlfK8GNgExjdFDKKOHxU6tTUt9bBOJcCcSnpXXs//3cqEmHyvJfFwpsrxpnSBzVT3QHviEjk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199015)(31686004)(36756003)(8936002)(66556008)(38100700002)(52230400001)(83380400001)(86362001)(31696002)(54906003)(6916009)(2616005)(45080400002)(186003)(6486002)(41300700001)(478600001)(8676002)(2906002)(316002)(66946007)(4326008)(53546011)(66476007)(6512007)(6506007)(26005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHpRdkNtdUd1TU95cW8reXBONlhjb3VtQmN6YmhnVVJwVXlRUU5DdTRya0NR?=
 =?utf-8?B?ZytsQ21HQjVyUHdFWFpsWFI5UjA2ZnZ6b2U0Y3B5STBNSzFraDdZWjViOW9E?=
 =?utf-8?B?MkRxbHg3aFhwZVVhQlljSE41TDNTeTlHZWc2eGNFcGE0d1p3TTkzOGJoamgv?=
 =?utf-8?B?cjFCMk16OXBORy94aDFTTXduc3NnK0JTT0h0cEwzTlRUUUMrRTRnY0FvaW9V?=
 =?utf-8?B?VTdXRzVYMGZUcGxwb01ld29XUVNIbjAwRWlRZmx2Yk1FanovaFRuMDZmU2Yz?=
 =?utf-8?B?Nzg3RmVwSldpb3ZmeW9tdVNRcGIzQUpVYVZtRXVZRjVMVVRTbkZtclN0T1l0?=
 =?utf-8?B?Nmp1Z2l1dGJoRFJ4YmJyaTd3QnJuM2tGcEVrYzB5RTVKaHZZOXZnZFBydTBs?=
 =?utf-8?B?YTZJeE1NVlhhYkJJMkE2Tk9VSVI3T2N1cTVFREdyZGpNeHN1VzFhelhtVm9M?=
 =?utf-8?B?Y3dRMGZtcldJeENGVjhaRGM5QnR4Yy9JSmRMMks0VGZNc2IyS29QREpucnlh?=
 =?utf-8?B?bjVuT1Q1SlM2TlpIdGYrVGorWkthZnFBdjlqUjBpcDRMTWhhT0M2c0VBRVh4?=
 =?utf-8?B?bkk5ZnZBTGRXSEc2dmJocWFkRmxVNnVwSWhnc21IRnZtQW82b0lVU0RzYVU4?=
 =?utf-8?B?aDROSlg3WDBnaGpISEp4ZGVhRE9sUTB6NWl5bnVuelIxVllLZWV5ZVJBcVZU?=
 =?utf-8?B?bTlzMUtkUjkxaGUvSFYydzZ2OGRyY2Z3ckdoS3RvNjRidlFpbjgxWkVhOEdM?=
 =?utf-8?B?amwzMVNrQlUxblJRcXhXeU45NVo4TUVlN1BIRHpJaDQ2TjR2dWRJM0U5a0Nq?=
 =?utf-8?B?WWZWSnIyUTJDNzlvR1I4Y2EwemdxRGh3cG9IYkFkTG05UGJOODIyZW02RW5l?=
 =?utf-8?B?VkxkZHRuY1BJRDFSaHZTSDFoN2dpelc0eDRqSkM5dDhQZEtsOVBkcXp5ZTZG?=
 =?utf-8?B?MTBXQTcvOFBSaExjMm9QcURkWUFoSnNZYVNKZ0FRRHIydm1MbHhWUWFQalho?=
 =?utf-8?B?bS9NN0N4TEl0NUg1c1JWOEhBZXhobDAySm9FSHZhbVhyVWZZRG1ERmpReC9r?=
 =?utf-8?B?WnNrMHRBUHE1Q2h2UmdDbkxIcWxzVmFWSjFadFY3d0dhOUJoa1hTUmVpR1l4?=
 =?utf-8?B?VE5ka2FUaklQTUhNODUrZE82U3RiRzc3RFlBbWtVNDQ5ajB0cGttb2pYZlE3?=
 =?utf-8?B?clR3V09Jb2huYzVDblBNSHl2YTRhSytzcnRwRHJmbllSVzZsMVJLL2RER3B5?=
 =?utf-8?B?NWhGS3ZTYlB6cnovZ2ZDMmd6OVZlMzdGRTVOUzNnQWg4WXRITmpUVUpkOXVR?=
 =?utf-8?B?TmlEd3lJU21yVVl6NG5wVUJFWEpiWHd5S1oyTDhsL0hrM2dnNFJ4bmdxdVdq?=
 =?utf-8?B?NU16N28va0QzamJhSSt2d0RRdXlqVVFxRkJPRVhNcytIaEoxYXc5Z0g0MjZD?=
 =?utf-8?B?WkZMMDE1aGRsNjBNWkNHNVRiN1JjZm9VdFQ4RTdubmFVMkZmWG9BQ3NBZmNQ?=
 =?utf-8?B?dEtTVHZvMGh5UjhmelZJYWtmODJGdzVNYWZvL1YreERrODlENWVFZWpjVGQy?=
 =?utf-8?B?Wk0yQWx4QloyU0ltOWQvL1BHdGsxR1BpeXNOcjBRSGt6dFR1ZVdqNW83cWV4?=
 =?utf-8?B?UWRnaTAvT0R6WUtmbGJocmFxNW04SXFIcmpQWFBhQmpyVmRWaDRMVUxrOVEv?=
 =?utf-8?B?V1M4MlR0bFRsQmRkVXVrMzZwNlZaUWVVcEpPZUxDM0dlTFpHQTRuTW11R3Bj?=
 =?utf-8?B?b1o0U0RINDVQemgya29wV29sOWtVdFkzYk5DRVZPdVp3Y0lucjYvenpVT016?=
 =?utf-8?B?VXltKzdPdmtEQmlyR25MY2E4T3YrUGFzMCtJRHZaNFZlYzRneFduejh6SGl4?=
 =?utf-8?B?TldQbjYwMzJZL28vUEVUYWg5TVRieXpHblEyRmI2ZDVob1E0K1gyS2dSSDZn?=
 =?utf-8?B?Y09Fd2g1UzM4Y2U3NVQxd1NPVnFBOFJ4S3JybG02TU9vQ2dOZ3Z5Qjc3ZCs4?=
 =?utf-8?B?ZnpvanJqWEpUYTA2K21rQjhqQmJvNFAwVzRXaGhzdzgra1J2T21PUkp6OWZR?=
 =?utf-8?B?ZzBxTCtqaVFIdmJWYkhpS1RkVlFxSkpEMlZQOWh1b3gwYVZMZnptTkl1dXBp?=
 =?utf-8?Q?tx9a3uuyaHDFTaUJ4Oq47nARj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf64e00-3d92-4130-fe5d-08dac1a1c624
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 15:56:18.5961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X65ENRt87dKDksIAGMFZHR7ucowfdpLzfp7T9mc/Zh+vgTdKNR7dkajip1fQEMo3TE7iuM9xb35vCVrzvNaUjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8390

On 08.11.2022 14:55, Roger Pau Monne wrote:
> The VFCT ACPI table is used by AMD GPUs to expose the vbios ROM image
> from the firmware instead of doing it on the PCI ROM on the physical
> device.

I can't find any mention of VFCT in the ACPI 6.3 spec, nor anywhere
under Linux'es include/acpi/. I don't mind the addition that you're
doing, but there needs to be a pointer to a sufficiently "official"
spec.

Jan

> As such, this needs to be available for PVH dom0 to access, or else
> the GPU won't work.
> 
> Reported-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> This is a bugfix, but given PVH dom0 is still experimental I'm not
> sure it would qualify for the release.  OTOH being experimental means
> there are no guarantees it will work, so the change is unlikely to
> make this any worse.
> ---
>  xen/arch/x86/hvm/dom0_build.c | 1 +
>  xen/include/acpi/actbl3.h     | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 1864d048a1..307edc6a8c 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -924,6 +924,7 @@ static bool __init pvh_acpi_table_allowed(const char *sig,
>          ACPI_SIG_DSDT, ACPI_SIG_FADT, ACPI_SIG_FACS, ACPI_SIG_PSDT,
>          ACPI_SIG_SSDT, ACPI_SIG_SBST, ACPI_SIG_MCFG, ACPI_SIG_SLIC,
>          ACPI_SIG_MSDM, ACPI_SIG_WDAT, ACPI_SIG_FPDT, ACPI_SIG_S3PT,
> +        ACPI_SIG_VFCT,
>      };
>      unsigned int i;
>  
> diff --git a/xen/include/acpi/actbl3.h b/xen/include/acpi/actbl3.h
> index 0a6778421f..6858d3e60f 100644
> --- a/xen/include/acpi/actbl3.h
> +++ b/xen/include/acpi/actbl3.h
> @@ -79,6 +79,7 @@
>  #define ACPI_SIG_MATR           "MATR"	/* Memory Address Translation Table */
>  #define ACPI_SIG_MSDM           "MSDM"	/* Microsoft Data Management Table */
>  #define ACPI_SIG_WPBT           "WPBT"	/* Windows Platform Binary Table */
> +#define ACPI_SIG_VFCT           "VFCT"	/* AMD Video BIOS */
>  
>  /*
>   * All tables must be byte-packed to match the ACPI specification, since


