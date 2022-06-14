Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BC554B51E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 17:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349183.575368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o18pi-0004q9-FZ; Tue, 14 Jun 2022 15:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349183.575368; Tue, 14 Jun 2022 15:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o18pi-0004ny-CP; Tue, 14 Jun 2022 15:51:58 +0000
Received: by outflank-mailman (input) for mailman id 349183;
 Tue, 14 Jun 2022 15:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o18pg-0004ns-Oj
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 15:51:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea5459e2-ebf9-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 17:51:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6895.eurprd04.prod.outlook.com (2603:10a6:803:13b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Tue, 14 Jun
 2022 15:51:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 15:51:53 +0000
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
X-Inumbo-ID: ea5459e2-ebf9-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYofTkoJWct7vH0M5p9pdULTDriSfI9bClGC+fAHQXIgRrEhDTj1NnLDc6F3x+OcY8pzY9il8wu6vClM4KTQBJiRx5voBzOzlUcoDwcWfi3CmzMUja0twlIpMiuUwU5qfYayRKWNZJIipdBcqlx4ZTWsxyBVD3OB7iT+5NDrB3XXMCL0QaW9qD8K5/tolHugV9DkR1tRXisKgqFTlEfMsBkWA6RfVrkHTKyEzRllnkLb7DUQq5aNWgCFXbC9xLAGar2rI5hCV/ReDkNzNqDjTYD4lZO7Ok20eQ6VWEV1s+1LSayefeuGbTC+gTH/vu/3Zku82fdfJlqEml7Gnt4i3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEFWelMq6KmXE1vACNMJaly5JF58G9ndL9JvXvSk0Qo=;
 b=YF62dFmegfSMTHXTeQGpbr2whf6T3H3f/FfUg3r4dNCA/VzfVE+Io2f6DuA5m2te2V5PASFYr1If96sKAbPergQqznSgkYcEPI4iVn/NPkCj+Yvl5URK1FoM1sSB026ISR5YYUy1HH3NKGozPv0H3gd1N0WLP1X65s7oc9Ke92oWJP+ExdJOEM3UkT8oOchPAW8RNrA8oG3CbWHPnGXIJAww8+p3Ho7vKPFGpDMIpu61j5OIrCvOPyAxeMUKK6FUc/ECugVl8y6U9ZwohgiNAv0h8IUAzCX6sRwwbrElK7eI7F3zcOmHJpR5vSxVo2K8GVZGNXVkjYJ++amvFF2/hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEFWelMq6KmXE1vACNMJaly5JF58G9ndL9JvXvSk0Qo=;
 b=m47DrUGYgLdSOF1bAOlCOcWKGImHdXhGw/JSeN1M+12SIQKF7KFyyXezUC0V9u5hvookqTVy0Mg0tNBUVc4JGDizvDj2KZew77nbQf9g4BD7dfgIhX0DV7POCpbbNezlF+QFNWQUIsmO4NYiO+4IOVV9VousowynHLIRyJa2I1m3Tm6O8otCjnlVEaxcn/i5smQuWz5fZEO9/8GlDEX9VSnkqZbzkpgQLl9AueXVqefx6KZUwHT+KQwVLAjzaOzpuygRtQq1JOCc9H3HRami82MWLkG9hf6e5s5hSGAjeeml2PbZtwjD2PY2uaQ2FZz2hiM21/qQfXwbvFpJJX/lag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1f645ee-9af8-add8-a242-b78f69412353@suse.com>
Date: Tue, 14 Jun 2022 17:51:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] build: fix exporting for make 3.82
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <9282329e-ad08-b6e7-ec9b-7e827a8b66ba@suse.com>
In-Reply-To: <9282329e-ad08-b6e7-ec9b-7e827a8b66ba@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0017.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5319514-2c5a-4f4a-de8c-08da4e1dcd7d
X-MS-TrafficTypeDiagnostic: VI1PR04MB6895:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68959C189439333DED3AEA90B3AA9@VI1PR04MB6895.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KT/KPI49wv2AsKYEwX2Ihrj5WBedTWsEZTG4nbQkKn1LB1QWFzcIFHN5NheNFqFMTNSZW2qSoow7LIuIFZnRyN2VehYaVTipqodI5lxzNmWUXTOEdNni1Mf3MLn7TNhKFn7GTDs75U6nVZYE7XDN3HOiY6yWczqEAQJ7ka2aV7xYl9AWJ5j4KJlh/PKysGraMyt/ertH0iibSVNavsLpksXHSNot08klCkwLkn1aumS4D2bOxgLAXKJ2i//G2wxRMq+PTGHppg0gRofi1om4QvXdLV5I08nXC2HJNWPz+g3+kcFb6F9UXx52cTi3Qm52s0++6r7w5D92OJGrHkMwOI7eysYcW8TgOxhSrOM8FqDOO28GeB6NBZIoYmQac9R/tjiHMKCpS5UTT+9ruCt6Y6UYkJEAqQ+Rd72f/PwHhvAfqs/uzgw732xcZvSJBldF/Nl64j/PP7RAVOlLjt93GIGe0Z8jtQZM4e70Q+c4xhZWwo4gnta29Q7hoaF08QuAL04QWVIE3zvn9D2oGytySSKSY2fAjqlX0ZAVgKWPSRidxufmsADnNHSxU5+3fppDEIMUvD29ip1zjECehkxQEfwaQ8YZvbT8APGdsgiGSwtm4px23GxaQqeQliU21cYBeReopdU8LDouQk23IOmWL38iTqYvcCVu7Z5oIyXgAGTf1qJgxyYb0oW5Oru+bFsunoAMOz/FCuAnRT/2NBX116TH4Tzn+h4xni+H9ELIe12udC2uvlrntFy5iq103GvM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(316002)(4326008)(54906003)(31686004)(8676002)(6916009)(186003)(36756003)(66476007)(66946007)(38100700002)(66556008)(26005)(86362001)(5660300002)(8936002)(6506007)(53546011)(2616005)(6512007)(83380400001)(508600001)(2906002)(31696002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVJqTGVwOU93QXNlS2luK0NPenFTaU5vTjYrcEJVdmw2RXZyei9zMTdxV1Vo?=
 =?utf-8?B?RkZyMmJaY0ZqanNqUEIxZUFTdDBtYml2MzZqR3B1QlFqTEZxVjdzNUdWZ0sw?=
 =?utf-8?B?ZDhNWlJSSlVsRDlEcGhvdGxUaStSdkkxRW52ODB4SEUxL3dnYzcycVF6VzJi?=
 =?utf-8?B?ak9sWTdmNUN1NGo0T2pBZzBaK2hrMyt3bjJMWldzQ29CbVRGSGEzMlhFTVli?=
 =?utf-8?B?YlVIOTlwaUx5Vzd0YnBjT29lVk1yQWV4Y1VSZ24reitZZnFvM25zbW5haHgw?=
 =?utf-8?B?YXpXTEZiYlJDaDI1R2JsV1RiNDlGK1l4Ylh2QklSdHhKZUZkeUxFYlExVG1l?=
 =?utf-8?B?WnAvMy9XQTdiR3lmSFZrSFhUbndVSVJVSWxJbVhCSXFCSEM2c0dxUW5vdUFS?=
 =?utf-8?B?TmFjdFo4YmYrTk1FVlFmRi9scE92aFlEU3RBckdVUVRGRndJVFBoL1ZNaFY3?=
 =?utf-8?B?K0JoVDFKaFIwRnplc01IeWp4dlhLODIwZUxSTjhnUUU1NTFaOUdUL1VBb2Fn?=
 =?utf-8?B?V3oxUFY2aWYxKzZIc1c4aWh2NTh5VEFBc1hwRTdBbkZqS3gzbGF2MlUvNkNI?=
 =?utf-8?B?V3NWUnBjdFJUMjFUS2pQdHA1Y25CYk00NnVJd01VUGJTUTBqWThDMEdnNWE3?=
 =?utf-8?B?U2gyU05HNC8vcERtWkpIbGNuWUt0UHl0em9zYXdQdC8ycFA3dU1kN1c3UFFI?=
 =?utf-8?B?MDNKTlhTYTFnSkFGdHZqWk53M254SVByZVhsYWV6Z0M0NkkxTUtmdGs2aGti?=
 =?utf-8?B?dW14aGwrOTUxVlVMWEIwaWFuSUZRalQybVQydzJKR0dPMmtEaFZWck41dm1V?=
 =?utf-8?B?OTRQVGhBQnF6MGEvSWZMWVhLUzR2SXR3dEFLZVVqRGJhTTF1cyt0cHRXdkVX?=
 =?utf-8?B?UVplRWc4NFZZTXh5azhZVDU4dC9SaG45azhzL253ckdPMXZsOXY2R29YSm1r?=
 =?utf-8?B?eDVJYVpZamlBWWxaRFdzQ2NWR2VjbXppVjNmblBlb1ZvTktFOGpGc21KTXRX?=
 =?utf-8?B?aHUrWWJZUWk1Zm85bm9NOVZDY1kyZXg4S0x5S3F2VFk4UHNPNFlnSkZIQnc3?=
 =?utf-8?B?QVBpM1hnSVN1Z0lBcGJaZnVrMk8rWFBOUWZ4TFJVb2xEeGxWbnFTNVZnRkpI?=
 =?utf-8?B?Q3dhZ0NKcG5hZDJVOWpjN3VVMFQ2aDZHb0JISWUwdU9HajhISktKNmlWemR5?=
 =?utf-8?B?YWhSOE5rMGt4eTZjY0hwL1JZNEFOSmhnVDM0cnhiN2FiVmJIZlZWc2tmb1dv?=
 =?utf-8?B?aFN0UktLU2NCNEM1aEpjcUZ4L0F0aHdBdHR2VFRycldObU1lKzFaTUFYL3dP?=
 =?utf-8?B?K3Vwc0szQWgwbStqUFJyMzRWVDh4cGhuYWtGT21wK0dvRFZXZXZoY0hqN2RJ?=
 =?utf-8?B?R0pxeFQ3YVlXcDFjWGxSYk5XcmlibnNmdHhNV1FvZ296OWdWZElodC9CclRy?=
 =?utf-8?B?amd2RkxVd3BnMGpaT1pBSXRFK29ja082Q3BwOE5VbDJtTlRxVE1lQ01EZnNT?=
 =?utf-8?B?ejlVblhKeHVJMmNJeHNkVllZTUJ1R25WMU9IR1JFeDAybHRnSiszdmkyYWZo?=
 =?utf-8?B?L2Faci8rTy8zYzZUT0w5OGNkd3h5MlIvaVJVai9Pb1FRNzcrbmx1WU9uNFlO?=
 =?utf-8?B?WndrelZaM1lrL1Z6T0RFa0FSdnBNYWtCdHF2d08wazhxY05CM3RrRGMzRGRH?=
 =?utf-8?B?WnRjaStmNndSNkZQaDBObXNtWGJDVkFuekdIQlJRZFBJTUhqQzZSL3F5VU5C?=
 =?utf-8?B?R21RVnp4SmVZU0FNVnRXWGxwbDRTcGp1dG0wVU9QNFJvUzdVY2dTcWZOa1FG?=
 =?utf-8?B?R095MWU3WkRyOThJcHVCcnlRZ2gyVitoekpuV1FVTkljMU05MW1ONmJRMG9R?=
 =?utf-8?B?MVA0bUt1SFhlcVBNdDBrcjNZOU9QU2lGUzhyZStpNFNKYW4zdk0xU3lrcnA4?=
 =?utf-8?B?UGptSU5MRVNBemg1OU9rOTJVWnNDZWFKanZqWkp6Nkc3TENLV2habWI2VFIv?=
 =?utf-8?B?c1I5SCtnWk5TWG1hOGRrMEp3b3FHNnFnZVVFRWp2QzAvUW1McmdscHFhVm9s?=
 =?utf-8?B?UTNsTEhCZVc5UW9yWTBOZzhKTmdEQlE4b1VzMW1wcU04ZDJROUFiNlpUQWJi?=
 =?utf-8?B?U21OK2R5UlFIL1EvbmZuR29hbGY1eDJWbWVSZm80Mkc4OGkwSWZ5dVpGd0xl?=
 =?utf-8?B?dDMzTW1qSVdSRjdjanpPcWx0ai9sYy9lSUJLbVFSSStuR3JQUzZFNEJyWjBC?=
 =?utf-8?B?OGcvVkdlVnVqOXhRYUZMUVp1NTU3YTd1SmdYWHhVT1V6ZHM0cy9FS1h0djZ1?=
 =?utf-8?B?aHpYSVNNeklCWUxRS3pXN3gzQVpqRVd2RmNsMmFnZ1hMSFFaZHVPZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5319514-2c5a-4f4a-de8c-08da4e1dcd7d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 15:51:53.6349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2qMZC7AvMP5S143kTpxmro9u7lvY2yWGqmZNZkSPgMUT28FYjPgndSoL9xt0aV/yf4+Qu46qYueJJh/f74FZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6895

On 14.06.2022 17:40, Jan Beulich wrote:
> GNU make 3.82 apparently has a quirk where exporting an undefined
> variable prevents its value from subsequently being updated. This
> situation can arise due to our adding of -rR to MAKEFLAGS, which takes
> effect also on make simply re-invoking itself. Once these flags are in
> effect, CC (in particular) is empty (undefined), and would be defined
> only via Config.mk including StdGNU.mk or alike. With the quirk, CC
> remains empty, yet with an empty CC the compiler minimum version check
> fails, breaking the build.
> 
> Move the exporting of the various tool stack component variables past
> where they gain their (final) values.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> There may be further factors playing into the described quirk, as I've
> also observed that simply running make as 2nd time would lead to
> successful building of xen/.

Albeit perhaps that's simply because then no re-invocation of make is
involved, as auto.conf and auto.conf.cmd then already exist (and are
up-to-date).

Jan

> While this wasn't a problem until several weeks back, I've not been able
> to identify which exact commit would have caused the breakage. Hence no
> Fixes: tag.
> 
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -44,8 +44,6 @@ export ARCH SRCARCH
>  # Allow someone to change their config file
>  export KCONFIG_CONFIG ?= .config
>  
> -export CC CXX LD NM OBJCOPY OBJDUMP ADDR2LINE
> -
>  export TARGET := xen
>  
>  .PHONY: dist
> @@ -244,6 +242,7 @@ export TARGET_ARCH     := $(shell echo $
>                                  -e s'/riscv.*/riscv/g')
>  
>  export CONFIG_SHELL := $(SHELL)
> +export CC CXX LD NM OBJCOPY OBJDUMP ADDR2LINE
>  export YACC = $(if $(BISON),$(BISON),bison)
>  export LEX = $(if $(FLEX),$(FLEX),flex)
>  
> 


