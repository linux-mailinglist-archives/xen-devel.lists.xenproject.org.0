Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DCE4CB7FA
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 08:36:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282789.481606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPfzj-0003c8-0y; Thu, 03 Mar 2022 07:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282789.481606; Thu, 03 Mar 2022 07:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPfzi-0003ZZ-UB; Thu, 03 Mar 2022 07:35:26 +0000
Received: by outflank-mailman (input) for mailman id 282789;
 Thu, 03 Mar 2022 07:35:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPfzh-0003ZT-Df
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 07:35:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b42c798-9ac4-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 08:35:24 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-7nupT1WJOrij8C13BCW-EQ-1; Thu, 03 Mar 2022 08:35:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3860.eurprd04.prod.outlook.com (2603:10a6:208:7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 07:35:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 07:35:18 +0000
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
X-Inumbo-ID: 7b42c798-9ac4-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646292921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VbeiCm2e1x/yLymCk0s7vQDaAs+AoczwFGivaOIU1IU=;
	b=iTqj0Cg9Xm/NIX0gbutHYIqBsHBklP09JFiEqvD3xKWToKvoXeBJP/NkZr3WYCtiSJNgzI
	L0jdrbY701ETvLhIjSJqhHuY46kGIHWTW5KtvUDEf/qbbchzw8KIvS/lYEAS5VbCB0Q78U
	kCblEAz6bUrgBApukkxguEW+lVKYkDQ=
X-MC-Unique: 7nupT1WJOrij8C13BCW-EQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6w8Par4tztUlh96tKk6ol+FFWGwBnLuTZi5zoDZd87i2RwnJY1gWTWE8ycpGGLf7APgzM6yWgyXJfrhFHpI6ML+oqqgKzzhOSOwpEiQXLO5s4W9P8ZwQLz51RuK1TFufjG37uHpHLNM8bbcFqw5V9R5XBL3Mv/cMT5YQFoXgP0LeYwx0G6Jv15SqIlob9xuKO+ROINPumWuiI7WaxsCggRqfVtZKqAyhztCfb4+4zLi2TMbDFbmxUXhq3TAai4gjRgxz/KBVcsOI87ZD6DLwh8zEHPAwJkA7qCVKdNZCdDgnwafS8dDcIxUb70Azb2QpP9f+nIsRBNY0lrs0MD/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbeiCm2e1x/yLymCk0s7vQDaAs+AoczwFGivaOIU1IU=;
 b=UlN563YoiJnCDWyE0YDlk01gARZvvr34BgxhUBNzidipWWHBfCwqmf07jw2V0GoW5uV2QL6xg100TW0wjEj/wzjXQjxaWuL1ACyuGjyjEhEvp656WHLBbwqNeePzvhhBHH/usaY6H06B4jb/OsHtwcgqFCpODdUR1khRaA1uHJeDL9yxOy3//09ivYcnZNbRyPgdOWTFEKHpyHlg4b5Md7aXbJlrfbA7kvmZ7hkSIbtgsOjoI+pO3KXhKBHYzN8ZOKFPMmsxQzOiuRSRzEtL/bOhl01FxhiLKnI8JAVUjih3LjjIvuaWGcq3cVSA6ajk4o79vc/pVyIQ729VHtopww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8eb7d30e-32de-fdee-43c9-3500fb10e6ee@suse.com>
Date: Thu, 3 Mar 2022 08:35:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/CET: Fix __initconst_cf_clobber
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220302221005.16636-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220302221005.16636-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0055.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e652828-cdcf-4ef4-9602-08d9fce85d53
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3860:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB386011F40C31B0992580FDCFB3049@AM0PR0402MB3860.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c9Ii8fRtOMM1BzOEB0QRCNSr1U/n9MJG187XIOLnFMbvS0P6nhnbXzMB3bgcZ+qseygrUpN0ujVm4vk+wujM9q472moNuEHydIokurf6XIhmsocQ1CifsRNbTpoxi7P1mYOkQeHLsDfnKpsOzYAZBy0Aqv5VolfZ/tMFuBkgDsmksC/PVEaIVdFO7JOD/YE9X+HIi6tfVy7rpfzUvpTMxYU/hrFplVPP4v7I8OpBc7GRo8Aielx0ORPTad8wiJ81JmFQo4AZnh3NC23/p4npAPRwTp1yIHBddRpqpRcesRbViAo8CSECkRdqQNrxzjjJydIIhLdwVoOj+56yEvVyUKTeWfEXv8icSflaBvRu+7UJILbEfvwRo96byG4Up/29vApySmt9kitI7W39f5b2UVcfKbciVw3J9Tba6SFwkQkbc6RtpO78/oDc4WdE1jRNygf1OcilEWSVR9s3oe60NB67bRgqafasSGP31/XVVjhYN4gBkEhKzWdTHbXTgQGZQm5t6IEsHVnkjkDPzxxQ4Dz8JmslYpF4E+PGqJNjntBoqlh4QuiYnA/2RZnCseFT4kN4XFf0R1FdIecrPJ6C2s0QvKdFs6yc/AC5u3LGIB3ff46HiR5bd2uMZtXmmMaHHkLK9bj6OeLZCio186v0WfQwCCmehyTkve9GpNvY+4dmO2suhePDQHfQzhkIi6+66AzUuY5rhjpGPavC22JtHixyh1E9YwmwrGfGEBy4nqs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(8936002)(31696002)(2906002)(86362001)(38100700002)(8676002)(4326008)(66556008)(66476007)(26005)(186003)(66946007)(6506007)(316002)(6512007)(2616005)(53546011)(36756003)(54906003)(6916009)(508600001)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzN0dzFBNkU2K2t0cVN1VG1jVmRSWllKbk1sekhQaW9KazFCZGpWYkRNNlk1?=
 =?utf-8?B?cllxYndVRFg5WnpHTk00c051U25sRXpjT3V2Ri9FckFWclFWZFFkRVNmRlgr?=
 =?utf-8?B?N0MzRkNxNExOcGFHSWVKaW4vbHErYTRVT0R0ZEpvSGtvNFp0MkRzRkI0SHdS?=
 =?utf-8?B?ekc0OHFKREhveWtzN0gvNmU2RHM0VVJZOFZRZkVtMW41dm4zN0I3VmZlL05I?=
 =?utf-8?B?ZFRZQngzaVFSTUM0WGpuRElHT28wblhWeWRPcHRlN2h4K25BZ285aVBNMUly?=
 =?utf-8?B?c0NsdEJwcEZQWlZUYmQ2WHdxM01qeU9EVFd1aHNYckl3T0Ruc0gzVklhdnh4?=
 =?utf-8?B?eEt4TXVkdXlYelBZK3JWamFGOXROdHFqbkE4MllJOXJhelNWc0o5WGRCd2xD?=
 =?utf-8?B?YkphWGRPeXk4SmI4bzVvY2o4SHFTbWVCNGhEM1hMN2hWeWl0ZmhIbmF5ZGdk?=
 =?utf-8?B?bG5pbXJYZzRVL05CT0dvZm1oRDg1ZUI0d3FXK3VtZEdlVHEwS2VTQnRMUENJ?=
 =?utf-8?B?MGRZUkNnK2NPakc2bXJzN1Q3S2RBbzJDbENnc2FVVVpoL3AwQ3QyWjhndnVW?=
 =?utf-8?B?RnlNeXNmT21RVXVwUVVrZ0Vyb01nWWxKT3QyYXMwcXNnOXlTS0hFWWVaZlpi?=
 =?utf-8?B?Nll4dU1MSTdkYWhQWThsVzMvb0NzQjYyZjdiL0tFRkNCcFhlU1lyQnFTOVZ3?=
 =?utf-8?B?TnA5c3Z3SnllZWxaQ2FhdDhKYm1ob1psSmpjdXJGaW9seUZTcS9sVk9rV3Bx?=
 =?utf-8?B?VHFzcldqbnR5Mk4wQkNHQnJlUE5PUGZqbGdsY3JCTU1SZ1pqcDNkbE8yYzQy?=
 =?utf-8?B?dEhOSXlBNGkwMXNkejFyeFJVMXY2ZU5iYkNodysrR09MRnJVNEtsck5LTVpj?=
 =?utf-8?B?VzRleW94Q1FmVDJPcWVidzZYU2J2NEthaTl0VnJUQ2ZyRjhHMnRndmJOdysr?=
 =?utf-8?B?ZjE0RG01dVM4d0YycWlDNDNQRDNOWHpzYnNTZisycFF2SEozby9PTEU0djhP?=
 =?utf-8?B?YnRka0hOWW1YWnVDYTd2WVlUUFZ3eGRwR0tZK29SM3RPZDV1YnEyZFdMZUxv?=
 =?utf-8?B?YVIvc3dwYWtuOEFTcER5a2xQMUc0YlR5bEtkWjF4c2JKOHBjL2ExYmpLdkwx?=
 =?utf-8?B?dlZZUFVTUTlnYnU5NGtlb1VOcVlFWElNZ2FtUFJ5WDdoUU5lVmV5ckYzMHJj?=
 =?utf-8?B?dlpqTE9aakI0V0RZN3VDdzBEYWpXdVRqUmQ5V2VDbGZ2YS9mRjJ3SjBoS0FI?=
 =?utf-8?B?b0RUankzTHFyd052VVdKNUxGQ0xNcW5JeDlmMWJaZ1ZJenhPSnFFVXhXTThV?=
 =?utf-8?B?MUVBQ0h5SFNUci9jaURNenhYNHFwYU9uQkxTc0MxNDI2QUR5bHNzNmQ4R3Jm?=
 =?utf-8?B?cWNNZjI5K25KYllyZmNDMVZlSHhqMzIrZWhFOEJna2xaVDVOVlkzd04wQXJw?=
 =?utf-8?B?UlRMYVl6ak5BanpWWlZBd3E5eFNoaE05Mk5STXhsc1R6TkpxTVRsWlZEVDFC?=
 =?utf-8?B?dzV6SlFTeUVUMnhjTzByaG1STUh3Z1lJczRxNERBalRFTWRRenVtY1pRMU1D?=
 =?utf-8?B?TWNZTlkyRzV6ZzZHcXRoWG43YnFoQU1vNmVEWlQ1V2FKWE13NU5UcWtvNVB5?=
 =?utf-8?B?OXU3MSswczV2bnY1c1NBdkhtSE9aT1V2Q1lrdjBnZHVybm43MUNkU0h4REs3?=
 =?utf-8?B?d2pzUWF4RUljVEZCZ3RrdVgrMkUwRzUxNU1VQ3h2WkVFcEVCN2FxU0c2NnBt?=
 =?utf-8?B?dVhBRGtpdk5US0xyN2ZDSlFmcFhTckY3ZjJSNXNBRUtNOWxhKzhLdm84WTdo?=
 =?utf-8?B?U3FhZ1UxcnF6bUZmMEF2RVNSaS9pVGpXdlVkVnpJb0VDcll2QjA3VFhLRDJo?=
 =?utf-8?B?TWRLSkFnYWNQQllzN2czMERhNGhxZnk3NURnc0E5U20veS8xNWlIdFRZSmFN?=
 =?utf-8?B?ZjNWTHhlQzhuNEQ1RlNkSjJRTndQd3dBMG54cE9sMU5uR21FTUtteW9aLzBO?=
 =?utf-8?B?amNVMnRNcU1URHJoZkdzTk5GeEZ4cW9jd1U0c0dOa3NvNjBoZGdMRjAxS0Rn?=
 =?utf-8?B?cVVWR1dmYjR2OCswODhZTEtOcGJpNDlIOHJvZFpENzgvRXBGVmkxb1hoQmpz?=
 =?utf-8?B?VzdESkZPRmlLTUNtODFHenNGRmQ1VmJMeWwyQm8rRWo4MThFNDBGNDd5NGll?=
 =?utf-8?Q?Ay2RYIclpLDQBO37I+OBda0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e652828-cdcf-4ef4-9602-08d9fce85d53
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 07:35:18.0506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjRwahwClgnZR6410qIx7iQFaVn6NOsEdhWB0bBOG2fRGb7bSMOcd8XM5b7cZhuY977cQv6DYpL/B4bsoK9tcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3860

On 02.03.2022 23:10, Andrew Cooper wrote:
> The linker script collecting .init.rodata.* ahead of .init.rodata.cf_clobber
> accidentally causes __initconst_cf_clobber to be a no-op.
> 
> Rearrange the linker script to unbreak this.
> 
> The IOMMU adjust_irq_affinities() hooks currently violate the safety
> requirement for being cf_clobber, by also being __initcall().
> 
> Consolidate to a single initcall using iommu_call() (satisfying the cf_clobber
> safety requirement), and also removes the dubious property that we'd call into
> both vendors IOMMU drivers on boot, relying on the for_each_*() loops to be
> empty for safety.
> 
> With this fixed, an all-enabled build of Xen has 1681 endbr64's (1918
> including .init.text) with 382 (23%) being clobbered during boot.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

This will do for the immediate purpose, so:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I was unsure whether to go common or x86 spefific IOMMU code, so went with the
> conservative option.  The final hunk can trivially move if preferred.

The hook is x86-specific, so the wrapper should be too (and the existing
inline wrapper also is).

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -210,6 +210,12 @@ SECTIONS
>    DECL_SECTION(.init.data) {
>  #endif
>  
> +       . = ALIGN(POINTER_ALIGN);
> +       __initdata_cf_clobber_start = .;
> +       *(.init.data.cf_clobber)
> +       *(.init.rodata.cf_clobber)
> +       __initdata_cf_clobber_end = .;
> +
>         *(.init.rodata)
>         *(.init.rodata.*)

I wonder if this shouldn't really be two sections. Live-patching will
need to supply two ranges to apply_alternatives() anyway (one for each
section, unless you want to start requiring to pass a linker script to
"$(LD) -r" when generating live patches, just to fold the two sections),
so in the core hypervisor we may want to follow suit.

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -462,6 +462,12 @@ bool arch_iommu_use_permitted(const struct domain *d)
>              likely(!p2m_get_hostp2m(d)->global_logdirty));
>  }
>  
> +static int cf_check __init adjust_irq_affinities(void)
> +{
> +    return iommu_call(&iommu_ops, adjust_irq_affinities);
> +}
> +__initcall(adjust_irq_affinities);

I assume it is intentional that you didn't re-use the inline wrapper,
to avoid its (then non-__init) instantiation to stay with an ENDBR.
Yet then you could at least _call_ that wrapper here, instead of open-
coding it. And I further think the iommu_enabled checks should move out
of the vendor functions, plus the hook also has no need anymore to have
a return type of int. I guess I'll make a follow-on patch if you don't
want to fold this in here.

Jan


