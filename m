Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85015694257
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 11:10:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494318.764348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRVlm-0000el-11; Mon, 13 Feb 2023 10:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494318.764348; Mon, 13 Feb 2023 10:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRVll-0000bQ-UA; Mon, 13 Feb 2023 10:09:09 +0000
Received: by outflank-mailman (input) for mailman id 494318;
 Mon, 13 Feb 2023 10:09:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRVlk-0000bG-L7
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 10:09:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 738bdb08-ab86-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 11:09:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9421.eurprd04.prod.outlook.com (2603:10a6:102:2b5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Mon, 13 Feb
 2023 10:09:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 10:09:04 +0000
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
X-Inumbo-ID: 738bdb08-ab86-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/a2AWRl+hY5z1tdTt+5EPY2jIzUizdIZJaoyGzFWF02RxNiThOlc1AD8RwsEHjchjDA4md6tAjiC9ihvjK0pzr7tyHmle4o9GY0IR8oK6x7VDrw6rWB9LtwILo+UFelb41v2z4WEm/kXyHxwgFtvTADzjTVlUGu1PTKuo5d3xzFxyrSAroZE6Yw4Og+bAA5+1NKYDxKmRD7lYdrwgV4IyMm79vmUp4TkRcipXbqQcXVBmJNTzlEvHwG+ZIVBQ2vBXB8g435cDiZ/srMV4yLpU5oK0NaZFtit170PZnxGf0zj62nrixBWGO6UCpn5+O/v0h+oNgLXC6DECgPMW8cxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bs32FRsoUzDxNmNs6gGvFykdxxo0Z0MipiufvwNIX1I=;
 b=mwzWrIi0myOpbqpl4nbSav0tfWzC9c6bisSLjDvdoE9qNbbFnz/o4EGwfliuPsOfWobl/DRjxHaHfdkWMpne5Yoh6jmy1HWLGVE7JHIH/GscWOfrg6U8MnH9qip20Lvb6pP945rWOeiuxG1zbt6JC74eUhvgctJlj9Ph0TwXBnx8BGGHz7Utba3iZlKJgjE95WvZjHKFPLdJPbhLLg7VWAsIs2av8jiIr9TYd1uEW80LNDx2A8Hw92xyir0RRZvZA/GRI73nmy7K5uoE7pu2N6XeA8/ag+dcJ9oPIdICpsA/vK6vFZZB6GTi9a/KXvBTUJ47+K+cffz+6y8UtWzWbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bs32FRsoUzDxNmNs6gGvFykdxxo0Z0MipiufvwNIX1I=;
 b=reusc92x5+4k5mkqUAQQ75ve3/E7bmDOph09isCmVB6VU3bM5dd+BYhsoUEXnQo2NMLa3OUyPffl0Sdi6k0M6PUC+22bOIoG/fsdJUY0cVXU03dVhPfWl8XWTtljfcGmAFw5lj8rmgkEEWBYh6ygcs60NG5Xu1Yt26xyZhxcHEUmFeHr3JvhmwceTEwaoQOGYTc44fUAy5zWZpheRwB7phvzruS0skYFrEPnlgwNtzhEcWibn43VpODt/NjxvI/uPwHuJYUd7H9zmi5W+fkUisPaSUOhqYHgEunGmOFuYdV6hyJMLme38MwNoL9Z47zeXz8dvsXVh9Q68DQeTbDeoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1fbb69f-3fb0-3a80-cafe-94b0fdba5a2b@suse.com>
Date: Mon, 13 Feb 2023 11:09:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2] x86/vlapic: call vmx_vlapic_msr_changed through an
 hvm_function callback
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230207094347.1059376-1-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230207094347.1059376-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: 916b0484-46e3-4900-4928-08db0daa5605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eSd+QxlkOOzfUwu0hrOE2+4PgB1Efp9zlhDxFjRHgXzs7F4lawiq4/ZZUR6ZRnlnbGRLRUKvA8snkF3EIP2jIGOpmQUl6yaiWpJ5w8zTBVoUhF+P45htAs4EJWbwbyNVxJIrN+qI2wQRrO2+NNNxvtnXU/t4gJfDn7OHhhGVnTcMpTFvtOICJ+zBc7ujs9oHCcIxOnX01eNX59WVm/OnvHeX+wDUsaeFlyoCqMyD5j2bVekxuALw7YQMUO4qLN21i6OUOMD0zHD0OYw+2vQcW0mK+w2WxDNOpLcSe/bAfxl5wzx4M6TJg+icEEkjzmRDjmJ0xsOOc54jycnyl+8xcQElug03Xk2NTGINbWJdIBsRCuFe0QtMhCPjqvmpDXxfY6LLlLXwbRkUIjo3djy4TUlCV2cqbNzdlgm21qnyNx9FbWMX7BAkebj8alGdyqLkhyowzM8lACsOViWzLCGIzpGmNpowaut7D6TyAi72l7ICYgrCTUAS3AneZrw/Bz9i2MTCKUGlldDXLdCxdj1uvyr2S3Om0Xq3KiZWq4dpHCSVG4q2y8ZzCK0CEyr4H2lJicI/JUs4lYeFg7/2likR8XvX6MXnUPmX52xyZP7YNprUGjZaNE+xdVuPbHLXqIEE+3U5mzSVnBOJENC88myOACVILavP+d4/B4u0P2AWW7NWkwvQROTK7inmAx2vHb8mXeJDMFsCgQoRyd2u6UyUtD2acdzqEYr7Opu8BDvas/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199018)(31686004)(31696002)(83380400001)(36756003)(2906002)(186003)(6916009)(6506007)(53546011)(86362001)(8676002)(478600001)(41300700001)(8936002)(2616005)(6486002)(4326008)(6512007)(5660300002)(38100700002)(26005)(66946007)(66476007)(66556008)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnFWME15R0t0V0NBQWVwNlhGejVTU1NVN00zTTdjcWVQL0NWQ0UvL25mblVy?=
 =?utf-8?B?ZkdxUDFvOE02aTFpVHNETTBLcElHam5PSVBYUlNlbnVIYjRod1FTaFRGSW1N?=
 =?utf-8?B?VXIrZ2x0N2E2Y2tkOGFSSm9tV3hHZndVajNLQi8yK1gxWW5yMzl4UmdUZ1BG?=
 =?utf-8?B?SGt0Rjk1UG1DNmhKSnFGN3ZZb0pPdFdqT2EyZlZDY2VKUlhGdVR1RzFjWWcr?=
 =?utf-8?B?V29JVlVHVzFBN0YyN3FVVmI1VFhSdnlaMEQwdUlJM2htQ2RlQktqcnB4aytC?=
 =?utf-8?B?UG9wMkVrN3doZlFZRnBkTGZlbGRUbHpSaEVLT01meWdRQWtJQ1g5NXJJZUNJ?=
 =?utf-8?B?OWFUc04rc1ltNHZTMGord3NVMXo2S3FERy9RditudFFBSGM1ekVoekJYajlh?=
 =?utf-8?B?SzRDbkU3MGpDdTZrS0sreVVLSkdlMkViTlV2Ni9lL1JOQU1DaytCRi8rTmJZ?=
 =?utf-8?B?NXU5a0dOOTRyZmxKT3RXd1BjcVh3cE95K3RNbDFjbnFYOW9jeE1SeUpFYzFi?=
 =?utf-8?B?ZU9VWXB5a0dkZHdpellWbmdTczdyZEJsTE5rb0FseDRFSTJ4RDlnMmdVb1da?=
 =?utf-8?B?anpWZytMdUU1d09oY0J2L2F1K0ZjNFNRL0M3Rk9xcDU5cnpSYXI0K3owOERm?=
 =?utf-8?B?V1VBNjB3SCtoZEVMSnlHVE5SbWQxc1V5MDZKV2ZWOHZEZGtvN1BNZjNxbXBH?=
 =?utf-8?B?dS9Qdm82TVl3eFFOZi9LalFjZDJnVW1XY1Y5bnJRYlhONlVCOGJKSzM2dy9D?=
 =?utf-8?B?eUFSdXd1T09KTndLUHpTbHljZExTaWswc0NRK2d5QmRnUFFocXUrdVRvTi8x?=
 =?utf-8?B?MkNEYmN5eit6SThiaHdEK2JrU29FakFOeHU2N3NVVmtnVnNCdXUwSU1rMzZI?=
 =?utf-8?B?YW02dEFmZmY1TVJYTlc3NWFXWDlhRzhPMUFZK0dLRUN6VTZlWURsam16ejFX?=
 =?utf-8?B?TUR3MUFDVWlZNGgvZW5Eanc3WXdYYVR5eVEzVm9xUVdvMEJaSHB6TVAwbTJO?=
 =?utf-8?B?clhkM2d2SkxGQWZUQlJmUkg5V3E4QkJuRVZzdEUwb3YxV1VwaUN5aFBFcHFu?=
 =?utf-8?B?ZU9tRkJ2Y2ZzaG8rbmYyb3FNWjhPRXQ4d2NseFZKdVdXdXZVMFgvL2lMVzlG?=
 =?utf-8?B?SmEzVlhxdy92T1MxcjUyUiswenhZQnBZS3hJS1Y3b0tuMnl0VDZyUE1FRFlW?=
 =?utf-8?B?R2JSVktOK2xEQjBUYnQwMyswK3I1c1ZVSWFRd0p0bk9XUkVMWUN4SGVIbWow?=
 =?utf-8?B?ajhZL0I4NnZwelphWjdTOGFRRlhiUU13aDJrNTBpRGpqK2NLQzhwZ2QwZmNz?=
 =?utf-8?B?K1loazdFMXpXUTdrdnVVUmxhVXlKRFZucFh5ZitkTEI3Q2t6R1NPa0x4QXY1?=
 =?utf-8?B?YkZWc3hJTngzY0RZTmRBL09SeG4wa3hRK3ZQeUxJbGpQS3NhKy91TDVrbWpw?=
 =?utf-8?B?Zm52SFNGT1lDZmZaR1Q0aWpzNllIRVJ6aTlCbWg4clZwTXcrNDB4RlVzSHZ4?=
 =?utf-8?B?cnlpZTdKL0l2a214Y0pTVjJoY0QwV1BMWFFQRnZpWXlaTDQyY05YeFlVQ1lK?=
 =?utf-8?B?Tmc4R2xMYWdrNlVrYkx6YURKdU8vOEFPbUVYbWg4M3ZkTFgvdytoc0hXWS9u?=
 =?utf-8?B?bzBNcmM5MmtlK05hVTFQeEZBaFl4cUVKVjZNVktjZm9CdmtHVHByYWVmcXJv?=
 =?utf-8?B?d3pzR1ZoV3dFcm9POXBBYmZNN0hSSEROZ2hDOFo4bmJqTmhVR1o3K0FWQzJQ?=
 =?utf-8?B?S01GOVFLc3BxalpOSEJxRWI4eVZkdkd4dU1NYSsxMnlTd2ZFWE05NWlDU0lQ?=
 =?utf-8?B?U05jT2hUNCtLS0lDRDdFNFFTQ0ZUa1p5SE9hUUJOWGc1UWNhTEo4SENKTURu?=
 =?utf-8?B?V1J6cFRhZWRDR3VteEhNSStCUm93ZWxXekNndzhRSHRycUtjVVR2YnlldmtP?=
 =?utf-8?B?QnVCNnpuQXh2SmJTOTdIWjZveHNDdEhsRDZsampOdkExMmtieVc0dENRdVRu?=
 =?utf-8?B?Z21JL1BKZmJOQTdMVzhoSkVmWFp1d0hBWW9FOGM1VUhXdHZOdTcydi9WNEx2?=
 =?utf-8?B?Zi82bzFmT29vdmFRT0NMLzdRWTRCWW1UdzNXZmMyNHp5UlR2blZVUVlpZ1BI?=
 =?utf-8?Q?UZxOiPXqdmHoQzGmlkqMumMEb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 916b0484-46e3-4900-4928-08db0daa5605
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 10:09:04.3095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbfYgNw5X8M8ivVtIUT+Prihw41ASlF6EXDyulvdoxrNUzraiOHbczVCegYP29D8ALjwe+8GG3aBLKjNwb7MyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9421

On 07.02.2023 10:43, Xenia Ragiadakou wrote:
> APIC virtualization support is currently implemented only for Intel VT-x.
> To aid future work on separating AMD-V from Intel VT-x code, instead of
> calling directly vmx_vlapic_msr_changed() from common hvm code, add a stub
> to the hvm_function_table, named update_vlapic_mode, and create a wrapper
> function, called hvm_update_vlapic_mode(), to be used by common hvm code.
> 
> After the change above, do not include header asm/hvm/vmx/vmx.h as it is
> not required anymore and resolve subsequent build errors for implicit
> declaration of functions ‘TRACE_2_LONG_3D’ and ‘TRC_PAR_LONG’ by including
> missing asm/hvm/trace.h header.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
> 
> Changes in v2:
>   - rename set_virtual_apic_mode to update_vlapic_mode, suggested by Andrew
>   - in hvm_update_vlapic_mode(), call the stub only if available, otherwise
>     a BUG() will be triggered every time an svm guest writes the APIC_BASE MSR,
>     bug reported by Andrew
>   - initialize the stub for vmx unconditionally to maintain current behavior
>     since no functional change is intended, bug reported by Andrew (here, I
>     decided to place the initialization in start_vmx to be closer to the
>     initializations of the other stubs that are relevant to apic virtualization)

I disagree with this - unconditional hooks are better put in place right
in vmx_function_table's initializer.

Also now that you use the function as a callback, vmx_vlapic_msr_changed()
will need to have cf_check added (on both declaration and definition, albeit
I keep forgetting why putting it on just the declaration isn't sufficient; I
guess a short comment to that effect next to cf_check's definition in
compiler.h would help).

Jan

