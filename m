Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635374E7265
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 12:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294680.501174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXiME-0000Pm-Rp; Fri, 25 Mar 2022 11:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294680.501174; Fri, 25 Mar 2022 11:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXiME-0000NK-Oj; Fri, 25 Mar 2022 11:43:54 +0000
Received: by outflank-mailman (input) for mailman id 294680;
 Fri, 25 Mar 2022 11:43:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nXiMD-0000ND-DT
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 11:43:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7bb0a44-ac30-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 12:43:52 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-haoSPA1NOyGomJByzMh1ww-1; Fri, 25 Mar 2022 12:43:49 +0100
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by DB7PR04MB4363.eurprd04.prod.outlook.com (2603:10a6:5:28::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Fri, 25 Mar
 2022 11:43:47 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::5413:50c3:f5e8:d90f]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::5413:50c3:f5e8:d90f%9]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 11:43:47 +0000
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
X-Inumbo-ID: d7bb0a44-ac30-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648208631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YoS+yVpNABXRJkh5LF0mYJ+u68RL4SKmGCqn50EGriU=;
	b=kK9ba3+3qZ55qbvzLrJ8viYQcVE109+QDRnZMI/WIZ9x08ruJEc72oFJPsQ1UqPOCet1JA
	eihR9yGzeAERW3jTltFbNsrFPBne+d3vKb2K3IJR3Sy/5Db4+BrogwXcbbpLOBw6Tz5dnl
	MTX6mieklyUEjTLmS3r6BQskBIU+HQE=
X-MC-Unique: haoSPA1NOyGomJByzMh1ww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EV2gOr/UkOPaw0K5ldfKpKq1h0itD9JnrdUp6CZWaveQQ+PXaX3jdeY+o4XAvkqbySRlJNvc0BOW3/UPjlMFeYDcrI2KUqD0UGi/S6ajw51XU+TP0svJIeNviz4nU7ZR1cPqzcQtoqdY4W0UAIC/+lWU+L8V5R8KW7GtjfTLtr5ehmgFCLXNTxiMBijHdBiwTFfKeVAANjQllu7CB77/Z42S8Unp3s3UC6oHnXLbTUu1HhQMVA1NbMFbaXVUNhwgZKbssYELakur9LOYRQaoXksjeUpzDRsi70SxTqaJCXd4saAejULpgzbk0aqhQhhxNDVLYx+VdrO3zLnzzQXqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoS+yVpNABXRJkh5LF0mYJ+u68RL4SKmGCqn50EGriU=;
 b=LiKwe3WMVeciabc8IqX9ZRO7H8k3NkeZU71XaFqWKhgnq+l3UG5RF5pcQiiVhhN0lOKr288QN6iuRuPldGX5Ja6AyVp0tusuONwsMhV3uz5j1RnVUV1HVGgaBWjil8iSIn4MZitzThdnqhi9h2atRB4qxa80F06akiFiteDLz3u38dQzszjCgaSBMsYmMLN/pOOta0Ieqoc0dVRqtaS1p0UzhGo90s2+V9ibyUNK9PSPUi/qYYdKeo3kz6Huzwe20QtOcsAH4nM2AXXQhbVdTZmA8IVwj1e147YbBE3RvNSCvKG95/5xkUfeVSLgjIch5beT7TMKyfMshk4IGKNfcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d797474e-97c0-7545-c68f-1378a3b2fbd9@suse.com>
Date: Fri, 25 Mar 2022 12:43:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
References: <77c79e86050eef2b706ee11e64183d57a0f5bcee.1648119732.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <77c79e86050eef2b706ee11e64183d57a0f5bcee.1648119732.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0092.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::33) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a712c91c-f078-44d5-ddbc-08da0e54b92f
X-MS-TrafficTypeDiagnostic: DB7PR04MB4363:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB43630325787FB5EBA0DBD185B31A9@DB7PR04MB4363.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lJ02EbqibqWquQ885eJtVE+HCnCoVpl1kEvy9ORw35xkCoEB2hgDKihdsGZA8uicXbt7/mQCBzjoV5QyF0QN8DAbNmgVabWvPZn1efNcfW896Qr+d8kvIdWlIYBt9sLUi1MQR2J5+JUCfrnI8Fz9n6KpyO4u7DyYWOtRjo5sTLBTkp3c9R4DqXYPA5IA54cCbKW1hXk8guzcS1Ol339GGj/MOs1q+dS1LRDZAxx4YFWkDeSo+z4cPLDwPcPxwOGwxpd80rwbTkmyQ5nZ4iR1KKI13tW3Ua7O/SA2mNm+7CwU7xKXHadzoqOTQGBAebP4W27NiKfKLL1FNMmpdJcJS70AFDUoVzUtVSra10tW2vW3MyM1UlTsS5S6nd2+g4HB7EEVcF/HhlZUSCjDona8GuI6xHoinSKs0a6Wwt+MSc17M6LAobaZePukRd2Orxf/cHDaG9Ki6h4488IUE2oW/qghErYqSmKOnky+TtCpyC5aRQmYRHYdIwXzh1mqrPYMeExSwj6OhRKurQRsutiwVAs1vNGqJyIpKGaxtoLjc1al4ac0Xr/PUy9IQBfdzEnn7phgDasE5CCkDPswuL3NMo2/RAprPlZjoWw4+DH5iPceauvjP/2Ln7n/4GcNCG7qI+jRBqnnKyxGWhA1xP29FT6tPdgQHqHK4F93s0qZPUP2GWjB0/SWPHave2joj5w7OIT9ccmJpm11yUPLSepXEVeNKwogmNrYoNZ9otCkL6g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66476007)(8676002)(54906003)(66946007)(316002)(6916009)(8936002)(86362001)(5660300002)(31696002)(66574015)(4326008)(66556008)(2616005)(38100700002)(36756003)(6512007)(6506007)(53546011)(6486002)(186003)(26005)(508600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RS9VZittbFFnSnRHcHVhTmh4ZXpxTW5zM2JuRjFtdWVFT3VGaTJrbjIzUXM0?=
 =?utf-8?B?Zk5XZVExbVhCUXE2MU1QWU9TWTVESEpVYmg0Q1RoZHkyaElaVzBvZERlbzRM?=
 =?utf-8?B?OGFQMWxjRnZoaThyTTFBMmt2V0RQM0p3QTFMQmtmemg5dFJmeTZpcjVkb0dz?=
 =?utf-8?B?M1BseTFxNHQ2WElGOFdtTFBCYTNSVUtTZ016R3U3eGIwMXptenVsZHlhYlBn?=
 =?utf-8?B?T1B5WmR6UnJaTHhib3pUZUNJL1dMSkFXMUVpQW56UDlUWHk2MFlSbHZxcXpu?=
 =?utf-8?B?T0NKcmd4bmFHMzVvRXJoV2IxN0FxN1FXR0xvZE8xb0Z3d3BDVUVvOU9kdnhz?=
 =?utf-8?B?clJvbzZYMmxqZGlIZTJubzdTamdYcldzYjU3Q0s5TElxMm5QL3JoUHhtZmRp?=
 =?utf-8?B?eTcrN213aGtCQkJyaXVqNVhiMWpvQkJXY2lwemJhRElHcWliSmtWVCtnK1lu?=
 =?utf-8?B?bUZHVFV1N2c0NElnOTFiNFpjdHpTcEZHUVhmM1loTXBCeWlNRGsvcEU0YVdz?=
 =?utf-8?B?K0Z3ZTlhVGtRS0FJLzZtUmsyK0VtRStDbUMwd2Z5RjdyMVVvclg4dXZza2Ny?=
 =?utf-8?B?aHJLZkpoYW9YbTZqUVNSb3YvYmhNNGNDU2EwMEhTNzRpdjgwa1NXMU1SaGtX?=
 =?utf-8?B?Z1RLNHNVcVhyRFFkNTlUbEwzeFdIcWNXYjA0T0tZbnVyN3czTTBvdnJpcWdL?=
 =?utf-8?B?b1VHN1JqZDRnclJjSnpKVUFqdElKam5Vd05SSjFaV2hKVGVqWVd4VHExbEZ0?=
 =?utf-8?B?V2VpelU4QVFoa3loRXNaVjVtemN6aEFjWFNZWUt3akp4UW1odXpGcXJaMUQ0?=
 =?utf-8?B?VEFPc0lZUElQWE8zR0Q5UjZzbjRCRWNDVnF4NnpOemliN1V6dWQ1R0tZa2VG?=
 =?utf-8?B?Ulg4NWxTdXNGR1E5eE5pRjVlWW5ZWmFaNkNRc05ZYU4rQnVLczdUaEl2K2N1?=
 =?utf-8?B?aVk5a2t5Ym02RjFqU0FpL0QxSDdOdXRFOHFueGU5eDk0a0NSR2o1SS9obitH?=
 =?utf-8?B?VDUwQ3RpSGFwYXJpYjNXT3hZQ0JjWjlZYTREa21SdGVxWk1pRFFrZVlIbkRy?=
 =?utf-8?B?QThGeTNvaGxLUE5OUi9Na3Q1dEdjTTlSSG51QnlycTlpaFhJUGVJV0RUdVk4?=
 =?utf-8?B?QmRoWFJVQ1hGa2JOamFJeHUrQUlxbytnMHJaczYzeDVxZG1FejFycHJWcjFI?=
 =?utf-8?B?OEd2bmo5MThiVGVqVTlwa1NjNGg4Wm5VYmJjZCtSU3MrTUJvMWNKSXNQQzBy?=
 =?utf-8?B?aUxVSnVNSXlFWEFIdXRYSFI3NWxDV1hIOEI3Ni9EeTU1aHJ6SGVScEdqem5B?=
 =?utf-8?B?aGdzRWdGcWtHTDFIbDVnbzNFTnlSUGRid0lKMk1NOWZZelFVWEM3RFpPSkEy?=
 =?utf-8?B?ckpsb29kZHRlaTNTZUlOakM4REhSZWxkbEZRSUVWNVRHd2hvMVFFaDdGNDBI?=
 =?utf-8?B?dFRVMlU0akxteks0cHZUNVcxZE9IYVpoSkxtdmNkd0xWbWV2TWE2S0xuRnhm?=
 =?utf-8?B?UVhvYVBvSmZ3cy9wcVlvWEdkaHJwMEpxQjdJMHJIMVJYVkcxS3hiTDBXMWpR?=
 =?utf-8?B?QmtKb21hVmVVbklwRnVDaVN2dTkxeUZmelh1T3ArUytaTWd0ZUp2V2hCbE5R?=
 =?utf-8?B?WXpQS2pHc1AwWFJudjZZVGxUbTVFMVZ0R2xWa2c2dGx1dmZkcDk4UEt1N3dp?=
 =?utf-8?B?N3Y1WXVlRDNuZ0x4NUxXQk93ZUxTdWk5VjhYMDRmRE8xMHNXSGpINDlZYjlL?=
 =?utf-8?B?MkFxTnlXYUp0Q1p5OE1NT0NTZ2dDOUY1UlRXem9yVUZ6UjhFeElBUWNpMlZR?=
 =?utf-8?B?N0E4TUpZMVBrZUNYZ1pmMG9RRk42Q3JSYXZqdDdKTzAzRXNXKzlsN1RIYVFr?=
 =?utf-8?B?dGRjNmVseHpTSzBnMkgwZTVMMzJvL1ZxMUs1RTZyMmxXaEJXbkRrR01uUVNU?=
 =?utf-8?B?cFFURTA0alc3NC95SVFYRTFQc3ZwV3Z5dTU5N29pa2IxN216bFBaa3JWNmdC?=
 =?utf-8?B?OVEzZ1U2NDd0SlRDZUJpeEE1SzJsRUtnbU94VmF0VEJYZkljN2FkOEZUN2pn?=
 =?utf-8?B?anFJanhDMXpMSzBBZUR6djBBUGVpSHZ4N09meGpta2JEWjdady91WUJYcEx5?=
 =?utf-8?B?dllZWmYrYUZWUitKblVuQWpXSytDbUQxOFZlRFE1akpMN0Q5TVJWS2JWOHpo?=
 =?utf-8?B?dzViY0xPVm1LMWFkOGYveVI2ZzV4SGh3eGw0R3hJbmEvU1dCZ0tsRWZjaytH?=
 =?utf-8?B?dVp0ZFJaZXZqQm5Xb3JpM2RlSE5OZ3FXbiszTjhxTG5ZYnlVaWIwUStEanlG?=
 =?utf-8?B?Y0lpWm1pUUFCcXRmVENSVXphYjBiQ3Z2TnczZ0xuNE9FQVNQK25tdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a712c91c-f078-44d5-ddbc-08da0e54b92f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 11:43:47.4416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkc9l2o/wrfXqdHNAURvZEmJ3qUm62nn1y2dIpFHhaod+WstkmoZGPXMTPW32O52dtRCxYOTL4SOStZY+6xJxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4363

On 24.03.2022 12:04, Bertrand Marquis wrote:
> cppcheck can be used to check Xen code quality.
> 
> To create a report do "make cppcheck" on a built tree adding any options
> you added during the process you used to build xen (like CROSS_COMPILE
> or XEN_TARGET_ARCH). This will generate an xml report xen-cppcheck.xml.
> 
> To create a html report do "make cppcheck-html" in the same way and a
> full report to be seen in a browser will be generated in
> cppcheck-htmlreport/index.html.
> 
> For better results it is recommended to build your own cppcheck from the
> latest sources that you can find at [1].
> Development and result analysis has been done with cppcheck 2.7.
> 
> The Makefile rule is searching for all C files which have been compiled
> (ie which have a generated .o file) and is running cppcheck on all of
> them using the current configuration of xen so only the code actually
> compiled is checked.

Why this restriction? It means there are multiple runs needed in case
files are touched by a patch which can't both be built at the same time
(e.g. ones under multiple xen/arch/*/). In addition, by going from .o
files, you also require (and yes, you say so) that the tree has been
built before. I think you would instead want to go from the collective
set of $(obj-y), $(obj-n), and $(obj-), traversing the tree suitably.

> @@ -511,6 +513,75 @@ cloc:
>  	    done; \
>  	done | cloc --list-file=-
>  
> +# What cppcheck command to use.
> +# To get proper results, it is recommended to build cppcheck manually from the
> +# latest source and use CPPCHECK to give the full path to the built version.
> +CPPCHECK ?= cppcheck
> +
> +# What cppcheck-htmlreport to use.
> +# If you give the full path to a self compiled cppcheck, this should be set
> +# to the full path to cppcheck-html in the htmlreport directory of cppcheck.
> +# On recent distribution, this is available in the standard path.
> +CPPCHECK_HTMLREPORT ?= cppcheck-htmlreport
> +
> +# By default we generate the report in cppcheck-htmlreport directory in the
> +# build directory. This can be changed by giving a directory in this variable.
> +CPPCHECK_HTMLREPORT_OUTDIR ?= cppcheck-htmlreport
> +
> +# Compile flags to pass to cppcheck:
> +# - include directories and defines Xen Makefile is passing (from CFLAGS)
> +# - include config.h as this is passed directly to the compiler.
> +# - define CPPCHECK as we use to disable or enable some specific part of the
> +#   code to solve some cppcheck issues.
> +# - explicitely enable some cppcheck checks as we do not want to use "all"
> +#   which includes unusedFunction which gives wrong positives as we check file
> +#   per file.
> +#
> +# Compiler defines are in compiler-def.h which is included in config.h
> +#
> +CPPCHECKFLAGS := -DCPPCHECK --max-ctu-depth=10 \
> +				 --enable=style,information,missingInclude \
> +				 --include=$(BASEDIR)/include/xen/config.h \
> +				 -I $(BASEDIR)/xsm/flask/include \
> +				 -I $(BASEDIR)/include/xen/libfdt \

Why ware these two -I necessary? Shouldn't they derive cleanly ...

> +				 $(filter -D% -I%,$(CFLAGS))

... here?

As to style (also applicable further down) I think it would help if you
didn't use tabs and if you aligned things, e.g.

CPPCHECKFLAGS := -DCPPCHECK --max-ctu-depth=10 \
                 --enable=style,information,missingInclude \
                 --include=$(BASEDIR)/include/xen/config.h \
                 -I $(BASEDIR)/xsm/flask/include \
                 -I $(BASEDIR)/include/xen/libfdt \
                 $(filter -D% -I%,$(CFLAGS))

> +# We need to find all C files (as we are not checking assembly files) so
> +# we find all generated .o files which have a .c corresponding file.
> +CPPCHECKFILES := $(wildcard $(patsubst %.o,%.c, $(filter-out $(BASEDIR)/tools/%,$(shell find $(BASEDIR) -name "*.o"))))
> +
> +quiet_cmd_cppcheck_xml = CPPCHECK $(patsubst $(BASEDIR)/%,%,$<)
> +cmd_cppcheck_xml = $(CPPCHECK) -v -q --xml $(CPPCHECKFLAGS) \
> +				               --output-file=$@ $<

As per the earlier comment (just to give another example) I think
this would want to be

cmd_cppcheck_xml = $(CPPCHECK) -v -q --xml $(CPPCHECKFLAGS) \
                               --output-file=$@ $<

(i.e. with continue options aligned with the first one). This is
even more noticable with ...

> +quiet_cmd_merge_cppcheck_reports = CPPCHECK-MERGE $@
> +cmd_merge_cppcheck_reports = $(BASEDIR)/tools/merge_cppcheck_reports.py $^ $@
> +
> +quiet_cmd_cppcheck_html = CPPCHECK-HTML $<
> +cmd_cppcheck_html = $(CPPCHECK_HTMLREPORT) --file=$< --source-dir=$(BASEDIR) \
> +										   --report-dir=$(CPPCHECK_HTMLREPORT_OUTDIR) \
> +										   --title=Xen

... needlessly long lines like these ones.

Also aiui you shouldn't be using $(BASEDIR) anymore, but $(srctree)
or $(objtree).

> +PHONY += _cppcheck _cppcheck-html
> +
> +_cppcheck-html: xen-cppcheck.xml
> +	$(call if_changed,cppcheck_html)
> +
> +_cppcheck: xen-cppcheck.xml
> +
> +xen-cppcheck.xml: $(patsubst %.c,%.c.cppcheck,$(CPPCHECKFILES))
> +ifeq ($(CPPCHECKFILES),)
> +	$(error Please build Xen before running cppcheck)
> +endif

Besides the requirement being enforced here to have _some_ .o files, ...

> +	$(call if_changed,merge_cppcheck_reports)
> +
> +%.c.cppcheck: %.c $(BASEDIR)/include/generated/autoconf.h $(BASEDIR)/include/generated/compiler-def.h

... doesn't the dependency on autoconf.h here point out another issue:
Don't you require the build to be up-to-date? If this dependency really
is to be retained, should you perhaps make the new goal depend on
$(TARGET), thus forcing a build to occur (perhaps just an incremental
one)?

> --- a/xen/include/xen/config.h
> +++ b/xen/include/xen/config.h
> @@ -7,6 +7,10 @@
>  #ifndef __XEN_CONFIG_H__
>  #define __XEN_CONFIG_H__
>  
> +#ifdef CPPCHECK
> +#include <generated/compiler-def.h>
> +#endif

Could you leave this file untouched and have the generated file included
by passing another --include= in CPPCHECKFLAGS?

> --- a/xen/include/xen/kconfig.h
> +++ b/xen/include/xen/kconfig.h
> @@ -8,6 +8,10 @@
>   * these only work with boolean option.
>   */
>  
> +/* cppcheck is failing to parse the macro so use a dummy one */
> +#ifdef CPPCHECK
> +#define IS_ENABLED(option) option
> +#else
>  /*
>   * Getting something that works in C and CPP for an arg that may or may
>   * not be defined is tricky.  Here, if we have "#define CONFIG_BOOGER 1"
> @@ -27,5 +31,6 @@
>   * otherwise.
>   */
>  #define IS_ENABLED(option) config_enabled(option)
> +#endif

What are the consequences of this workaround on the code actually
being checked? Does this perhaps lead to certain portions of code
being skipped while checking?

Jan


