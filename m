Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAE050F126
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 08:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313452.530980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njEnT-0007PC-Sh; Tue, 26 Apr 2022 06:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313452.530980; Tue, 26 Apr 2022 06:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njEnT-0007Ly-Oe; Tue, 26 Apr 2022 06:35:39 +0000
Received: by outflank-mailman (input) for mailman id 313452;
 Tue, 26 Apr 2022 06:35:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njEnS-0007Ls-Eb
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 06:35:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14a3e837-c52b-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 08:35:36 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-nsfmmzyNMU287z33FuIIng-1; Tue, 26 Apr 2022 08:35:32 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 06:35:29 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 06:35:29 +0000
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
X-Inumbo-ID: 14a3e837-c52b-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650954936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qcCVFyv0cbzKV80b6CyuFDTdQsQeNKXTwHyhv2INAVE=;
	b=H8iIYx55/tKYVnaYJkeSppfQ7WYBnOVbxn8XOyBLpX84gEoWuhhoOaFZV8SQuyHBUkfYB0
	fdes0d5BD6NZIi04XarhCWQaeuch3Pa2v0eGDuqJaQzC1tD3/0eQaLd/LbT7nlOMMeLKRH
	C3zj+fqHKaNEAj7gtKsaXsqILm06KKk=
X-MC-Unique: nsfmmzyNMU287z33FuIIng-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mr/V+WuMa/jZlQzFO4AL1ifw5fpXjI+HORwp0QX1O/0P/XfHvaBHp6IZwpX8IZHgz4MbsZfTJZKGsh7DZ0993Xf+WNE3+Cl3QK0tZjUIHaUEqjJnCFIvzHEKRavhBbzlLmp7igZvUrMCcl2MFfkMgRJJClwYpyyL3oGS5RwVe0+yhzHB2NumOOzO5CWac7wwl/UFflDVwbgiKV+QaEXDmcESmtCxz1MG/fZEgFtWHTmUKN2b3/qSU9lwtLJoCggJyeccf9CH2wUqOPefeRhLs1Zy4Mwic+7q8AyNPFSjLgXVqwTFcvDoLNumrHDk1RY/+s33MGuy5DYT9VL7wo2OSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcCVFyv0cbzKV80b6CyuFDTdQsQeNKXTwHyhv2INAVE=;
 b=Y285KV6nbBG7YCafQFAJ/QeH5KGLV/JEw/7r58a/33RKfbfCmR0J/Z9onhsJuPnQqLhYGy6qbLl5/4r480H2FphyhIl8jOpRKAk83l4E2Z1btkcET+c+cOl+ClcCFNd8JyLWWiQQ61Bo+52I8mP8BhoH1P45WbUR+pFw4LB1ajYjrCBCRFadz4LYfDqhe3E1qgNW192VYVczsxOCM7X5IaDM0bqz678GGJ/VYP8N5fN7OuuoUjB48W2GtRzeMVm8LZfXQ7SWH4DvHJdvYtE9r8D9luWchKoJ0INNHBV74pudm7mo6jZw7i+CP1XbesO8uLrh2km9SwsxHaMrocAnVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f82679b4-8b2a-ff9c-cc2c-60ba9b737de9@suse.com>
Date: Tue, 26 Apr 2022 08:35:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/2] xsm: create idle domain privileged and demote
 after setup
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220425172231.27401-1-dpsmith@apertussolutions.com>
 <20220425172231.27401-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220425172231.27401-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0115.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 208bc49d-0715-42ad-3f57-08da274ef4dd
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7630E2F2CA92909598E1D538B3FB9@PA4PR04MB7630.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	647psJ0X9/286433INnsi3Y/8VWBtOndCPU1nlLJPTmqcbo3H3hI9m/0JZyF18aGdV5p8dDHymr6B4PeufjNZZlPzIZhF0DivLVN9VGM57poyRkOqnKvNikSY0NpuM6/iDUw7NetMXWmp7qu567KMwvEXYbvTbjyp26R8vzJVtqN7dBKNvX7nz8RjLp5Pc+sW8yYVXP4Q5U3gnRUwQxLwFLirPF8MTfScGiY9BnfQW4+blvJqBM8bj1RDhgpscHVoYKhEEdv/sr8/u3DTosRlct2EwsErM0RU4nBrG1WK401S31cIRM/otclWOCHFQdAA9M0vPZqUFKC5ibSQH/ESf209YILdephJbksP5bsM/UnQHjiaQqcmFi9h7liQJtnyWi1u5PM6NcInqfX8utpfyJirE8nziIUE1R+V4QPvnYF+/2IEObv37eUJUYcPwDXFanLdaYJ6vSW2cOed9rAg0mtFI5O/Ll8S0k2WzYh0Y7d9TV5xujEPuRBwgIPKLb/4y+RGCZXMidlROaqWEdFDlOiAWHIv2pInJbhvDfJV2xDowmI0kWbSOpL+KDFABLpPTX2ze9w2TrghQDJtrL05rS3nnURcS347jKoX/NUYt2C13lvKTVi1uwXoAtPHjm3vdi7NU9kTsrb2S+K8WlACOiJJokSXCAO3uLLUEpV8XHeHIdlTa4LQFDlV5w5Zz5/DdhCaOyDHcn8nyF16S5+QhaI1nYjygSwIf2PMfdPTftupyujHw5uH6mA1mw4oug7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(5660300002)(8936002)(83380400001)(36756003)(26005)(4326008)(31696002)(53546011)(7416002)(2906002)(66476007)(186003)(31686004)(86362001)(508600001)(8676002)(2616005)(6486002)(316002)(66556008)(38100700002)(66946007)(54906003)(6916009)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um9wd2F6QkFEODdPanB5L2xPRnJqNENtb2NERFdLVnNIL1o1SDVZN3FEb1pk?=
 =?utf-8?B?ekt2dnI4Um9NSTNRRmM0aVF2Y05SZml1bGxYNG5xZWI0ODRTNmdMSkg4UDlv?=
 =?utf-8?B?em41djlDZlAzdjAxR2JWSEluc296cGs1UVhPWHhsczV2TWJ1UHQrem9vNFdB?=
 =?utf-8?B?QUdWdmN3emdtcVRPZ1FXdHQ5SW1aY1JQSDM0ZHliaWk2Ui94QTVYMnVyTWRQ?=
 =?utf-8?B?bUo1cmJRUmV2WkIwRnRIVHFlZm1ydURodkZ0d0pRRmc2QUVoWFlvOXVXWGhF?=
 =?utf-8?B?eVY0LzI0YWlwY0hJQklXZG11b2wvdW1GL0F3d1NHRlI3T0c3cEFBM2RiYkoz?=
 =?utf-8?B?bm9GNHVwTyt2dno1WWtTR0lZZEtOL1BkNEhRVldBbURKdlU0WU5PLzIxdGdY?=
 =?utf-8?B?bmFhWDZGY2l0czJZbGRPTGh2dDhnRDd6a3dneDZPZUdQQXpmampUQUV4OTJt?=
 =?utf-8?B?YjFXaFo0WGtWRnYyY0dFNjAycU1JcGl3RklsWGwzSDZNRWduVEVNUjd6Y1FY?=
 =?utf-8?B?ZXkySW5xajZtaUxTOHB6QnQ5ZnZQRldhNHVOV2NKZ3Z1VnFUcGtyWWxaK2lK?=
 =?utf-8?B?WGdZZFNaMXJWUXlINmlJcU5DOTYzQ0FOdVl6RmtOYVZJOWgyaldZUklqOWlZ?=
 =?utf-8?B?M2NUM0UvckFFRm42Skw4TkloRFNOUE5INXY3MzFyMXRTd2RaUzIxMEdBOVFG?=
 =?utf-8?B?RWxPRFkrZ20zZHUyMm05SHM5Y3BSTlg3c1hUaDBtL0tjK29RUlE1eEQ5d1Bs?=
 =?utf-8?B?NFJRaFNSM2NyRHY4d3FHd1JQTGx4ZWhiUDkyeGJpY3diRGMwYzgzN3RFUEpq?=
 =?utf-8?B?VldUcmpNYnkrZGJSSkp3WUNxbXNuUjd5aGxqdHBLckhsZFRBTCtpbjRLSzV6?=
 =?utf-8?B?M29WaTZmbWJrQ1k4RWJCSjh6c1ZkakFmK1gwUXBmZ2hYTU1Jd3NuUlBENnNx?=
 =?utf-8?B?RW44TjdVZS9MTXR1aEc0bDVJWnRoT0g5SjVaOUxCWTdRbzBLVENZZm1kZTE5?=
 =?utf-8?B?VXM2SGs4Ujc2d25RNmZWUGNPWFo2SndHL3A1bW5PaW5OVkkxTXRrK2gvUkZ0?=
 =?utf-8?B?YTN4RGxNTFVWSGliSVJtRGJwVzdNbkZNWmR0VVJwWldrdXh5d1pwanRIRGda?=
 =?utf-8?B?TzZTSVI2WDY0OHZSSkk0M1pZTU9NWDFhcm55RXlHUjU0YnJRbU51YmZ3RHhs?=
 =?utf-8?B?b2x3TXRldnhNekpxc0JHR2xvSGFDUWRvaHBSVmtYcW1kQ0dldXhtTGdFRzZG?=
 =?utf-8?B?dkxsSU5kem5rcm04cyt5UlVnQUpaTUtNejFxbURZZnhPWWJYSE5LOUFZa2RB?=
 =?utf-8?B?N0Q4VUxvYU9HVTNJQjBBWXEvRUFUNHhmNER1OXhSUXppRHVLd0FaeXpDcWVL?=
 =?utf-8?B?QlpNUElKTDRERHNzaEZibXl4RGp5dnJ0VnBzOVdBdkovZjBkKzh1eTZSd0dC?=
 =?utf-8?B?SSsrMGNFaUNXcGxXc2pEZFNDRlpreWJkV3kzZ3kvbk5kTFlPMzhjbjhiQVpE?=
 =?utf-8?B?eU1PTkh4dHZkRGxTZFlsRWxWc21SVGpocWJZNmFrQTJ2djJJa3lSQTVRRWIw?=
 =?utf-8?B?ek1nQWFpZnNzdHB5VFNDeUkxS3hIODhYUk12anhKMHpqckVadG9vNVV6R3J4?=
 =?utf-8?B?MjFhS2pJOFZmVHNJdldGRGVoYlhnVHRYRG5zMTFLRzA3UlpScWVkbkw2YjJ6?=
 =?utf-8?B?dHhWcjBGSDdjZDkxd3hzNkRPTTV2eXE1MFRCTmwzaGg0T3ROZXR4U2kxOXky?=
 =?utf-8?B?QzhYeGIzMmRCMzMzdHRSM0Z5MGtOVUxOMlVxaWlkZ2YyZ2F1WXVOQll2akNj?=
 =?utf-8?B?c1JBWWFselBPbzQ4TVVwQkZiOGJHN0dxb29pWXdEeGF6a0ZUM0NaVjdWRXpC?=
 =?utf-8?B?QzhoNG15ZUV1WXA4WCt6eXVnbWRoT0V5bUVIcFNzaEZYYzRxQWRDNTc2dUJU?=
 =?utf-8?B?SGhpTjNrSFFLVE0wYXVHcyttMlZFM3FkekxOMUF2N2hleHhCK21TUU9ualV3?=
 =?utf-8?B?WElBN2tsVmEzTVZYeEcvajJyUWFaSFE5WVZoYm5MSUQ0Y0dRRThzTzRmaVR4?=
 =?utf-8?B?TjdEQVRudHZ0SjBReHZEK2xHc2pzamRoZkxTYTZ2dUJWWVlWeDlqSG5kOStC?=
 =?utf-8?B?UmlUVEdqMjh5d3ViZTNEYmIreWhjZTV3TU9uOFpCT2ZhcUtRR3NXbmxMd01s?=
 =?utf-8?B?K3hVbUN0RzU4S2hEQjcyMjc0ZE9ycFFsKythd2dEdzNBVmtMTzZUV05CSUpu?=
 =?utf-8?B?R0RkNFNHK290cEtFRk9CS3V4SGRnbml3ZzBzRW10NUNxaExnTkpXNHRCMHdv?=
 =?utf-8?B?dlRRb1p2d3JyTW1SSHJMSkpmeWxCT2FVbytuSWRKbk84eTEvdk5Bdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208bc49d-0715-42ad-3f57-08da274ef4dd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 06:35:29.6356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bH6igb/3nXytBz5WCXzmH/tTUDXBHeRrvFyx51OCmHtHyNZf/TC1Ldfm8GyyIH91+KlgriaRVhMPBMVUunVSPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7630

On 25.04.2022 19:22, Daniel P. Smith wrote:
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -621,6 +621,9 @@ static void noreturn init_done(void)
>      void *va;
>      unsigned long start, end;
>  
> +    if ( xsm_set_system_active() != 0 )
> +        panic("xsm: unable to set hypervisor to SYSTEM_ACTIVE privilege\n");

Roger did request that the panic() either also report the error
code, or that the function be returning bool. You did neither,
and your earlier verbal reply also didn't really respond to this
part of Roger's comments.

> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -186,6 +186,26 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>      return 0;
>  }
>  
> +static int cf_check flask_set_system_active(void)
> +{
> +    struct domain *d = current->domain;
> +
> +    if ( d->domain_id != DOMID_IDLE )
> +    {
> +        printk("xsm_set_system_active should only be called by idle domain\n");
> +        return -EPERM;
> +    }
> +
> +    /*
> +     * While is_privileged has no significant meaning under flask, set to false
> +     * as there are times in hypervisor code privilege checks check this
> +     * directly instead of going through XSM.
> +     */

It feels as if there is "which" missing between "checks" and "check",
or something else (better fitting "as there are times"), without which
the sentence is a little hard to follow.

Jan


