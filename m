Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAD94E234C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 10:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292833.497302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWEIO-0005Fx-96; Mon, 21 Mar 2022 09:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292833.497302; Mon, 21 Mar 2022 09:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWEIO-0005DX-4j; Mon, 21 Mar 2022 09:25:48 +0000
Received: by outflank-mailman (input) for mailman id 292833;
 Mon, 21 Mar 2022 09:25:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWEIM-0005DR-Dq
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 09:25:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2d82872-a8f8-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 10:25:45 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-9h4-kNHbMemGymzZuYaeXg-1; Mon, 21 Mar 2022 10:25:44 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB6423.eurprd04.prod.outlook.com (2603:10a6:20b:f4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 09:25:42 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 09:25:42 +0000
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
X-Inumbo-ID: e2d82872-a8f8-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647854745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nc18XEidoK32VkpXbl1heceAq7oF3Feg2ySjkOYJUrc=;
	b=K7aVzpiwSBlOJTg5DMYy5QjfknUGC8P1wedLONaBTjeq1J71yJV1O4SeFUE8BwYnQLTLYW
	B7/csd3lUWXOGdzhF3Tuo9SO6rtoQljABBhGgpkQ0l8atHxKy+b8UpeROe58HTpnUiLLYR
	D2IqzXYCAFSDuXG+NhbMjeKvCG/pUy0=
X-MC-Unique: 9h4-kNHbMemGymzZuYaeXg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZVaqtH8Zd/PK0WrkYqV3mO8ozWHgtcHl0yeRUASoHj9u0oRkRUfydb3lO4N5bUPQwo+84L1YRtKRxIRRcmZBT00rBLdj44ynMI4koPq200ANyjhWDbXyQdEU9xwJwm+kSY3QmjEylCJIU6HAx3XHcoFI6sBHeZAEgTNHuC2SLGQ1SvXxchY+kh86clAbP5fe2gya47P6i0lJVksXZ+KaUCNpxhshiC2LMK1tsk8LgM0qlgKPkpLpyMQzt3LZsPeBK0+GD5nqP971R7/XPubaFevu0LI7Gcnin2PteGcby5HjjzFWc2Ec8AYpRJi3s3oaE0GgIKyQbxc/FKzN16HAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nc18XEidoK32VkpXbl1heceAq7oF3Feg2ySjkOYJUrc=;
 b=K/Q/U09zyOwZNtDNXP0b9jpBHYj5lCkLMpII6IlDNpqSYmKzisyCeQqgoSXPt4qEjXOA90vhXfzEgaqVrWfiXhup8VvzJru9bCtBwtxA/A2HiUe1M+x4Cl/xe3QRMednV0AHkKWTIKR3AuxkapqNVK+tQZvL0oEYv37JDfUtJvpOvDA0SoWCneK00UYk0CZS/ALXhamc1ziNLBadUD+ACkxS2lQ5eoLzuskZBruWoMc8yyvzRfWwmV+1aIylSyTZGQQiyhf4UYlW7mLvTKTTO+KPb2GzJrZXprvSQ/rx/LcRfVNjAM/DawmaWT6fO83JwFSSI2qmr2bOVf2FY9C22g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fca47661-5dc3-4228-a2d8-24344f451be0@suse.com>
Date: Mon, 21 Mar 2022 10:25:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] xen/arm: Make use of helpers defined in xen_lds.h
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220321082114.49953-1-michal.orzel@arm.com>
 <20220321082114.49953-4-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220321082114.49953-4-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0062.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::39) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d0a85fb-57be-41d3-253d-08da0b1cc526
X-MS-TrafficTypeDiagnostic: AM6PR04MB6423:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6423397B141AE1099EEE687BB3169@AM6PR04MB6423.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qfff1w6TIkXe/Ab4aWrf2rlN14ZDMeg8oIS1zdtiEr8gXcLsicrl5JfR90jsS8dG0HN4M5CEblPAi127Fiq1HjiN4OoCJjRFFKynLNhKNYdYUf7JgByc2h/I372U61ic1ENRCQ0YFX/a0Ca7nSUzHLSKaE3Y1ThCtz1GVNPVKABKYyvQ/QCS6Q/w7xoHzYkgCYn02VwK0pWjHSQM6p/vrSvbMQi0CONcfTRNWLZsbF/nykiv5sdXWzdNL1nfxQrRMtWsyBVvKUtbUUojmA4icA9iXyQR7qieTf22ORTz6hECJ4y6b5KhkawJ0lnBsIPLQHmFJK8j+xHgFRyhcJQHIWp5ytA9Bd7xB6EBDXyLjEWg6mhxEvowIbvV7cxupBdUmkEP1GPB5196thMHs+Lzp2akEyFnA7Q8TFbshYYhStY3RpjCqcqLDIUfoWLeewIUOLTpRIRg8759HrcxcwEBadq/+Yj35jOT2U7JsiAi07Y38Is2QsKTY1KQMQi6bSJZfx49zfpLn0ARPAsxho6BZpCX2H3Y19iyWew3Hh9oRfbcsDW0UvHh80ECS9apvlWloBSHGER4ZLgx12tZtCLgvA09W/RJE+CktP/XvgF/2BWmActvDGlbl6pgX6ZqxYWG/NEzVnttJtzagQhpKnTPyZjMkqbhvKhtH79J/GATNEDcDmwWzttQzBIhJ1ZkppKJsFQD1LIORwo5XtdwO+08WpfPhvDczU4j3X+RydmCXls+MiFc3MwMzHB0RyjudL1y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(31696002)(86362001)(6916009)(54906003)(2616005)(5660300002)(508600001)(6506007)(53546011)(2906002)(4744005)(38100700002)(6512007)(8936002)(26005)(186003)(36756003)(66556008)(31686004)(66476007)(66946007)(8676002)(4326008)(83380400001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0U0VzFGdzdaRm5EckEwTWVxZ0NmNWM5aGwwZ011WXhyeTU1cFM2MXBlNWFk?=
 =?utf-8?B?TWtieEtMS3cyWU4zN2pFTXRaSDFQTVZscE9JWFpWR04rRjM1d3FkbVUvMm1K?=
 =?utf-8?B?dFlRdnpTSDRtUm1TM3MwSVMrMDRPRWdsT1hLSmdCZVRqYnloZnlJY3NTaXAv?=
 =?utf-8?B?Y2JHaTYzaFAzWEtZemEvNlFhei9ZOFV3eGVlaFczelhYZThjSFhPaEk2bDZu?=
 =?utf-8?B?cVJ4eEZONzlSVk1IUjRQMEJrOGVOUDRhTHZ3dXpJTVNGbDRzU1c0WEtTUmxk?=
 =?utf-8?B?aUUxMDJwbWZwMC9hcko0WUNxUzRnc0NHWFhoTk5WdSt4cE1rNnlFWDU4b1BL?=
 =?utf-8?B?N1FjQVp0eURDbmh1QTNqaDUra1BqL0dJaXpWSy9zcTN6UGxGMWsxUmEyV2RX?=
 =?utf-8?B?UnArN0gxclF6STlWTVUyUk9CSmZ4bzdMMzRuN2N1Q2s0Z3lKZW5Dakt2eHB5?=
 =?utf-8?B?ZnY5UXcvSXdtZEVIUldnVC9wUTZleE94d2szOWE0ZWtJY0k2aWVSdnRBdnIx?=
 =?utf-8?B?Vm1DOU82OVZQd3diWDJXcXM0WFVwa2NzTFJTTzNVSFFsL08yVnpnTWtkWWNR?=
 =?utf-8?B?aXFEbnd1VlFaR25CM1J2RUJETGZMakIwVVdNd0FrQkZzVU1ua3YzL2NmaHlx?=
 =?utf-8?B?K05lSy9NOTd1OHBMdGJDMFcwZFhjL2dMTlV1MXFjNGs4Y0tpRlFyV1krajFv?=
 =?utf-8?B?R0FqMUg0U1BVUjdzLzdaSitLZGxtcm92bytvV0ZWQnE0eFI0bEFoNVJ5bmNQ?=
 =?utf-8?B?WElab0VjazVjbGNJRjBTVXdRTkwzV29iT2xJQUlLbVdOMUFnNndKQ3BidnFC?=
 =?utf-8?B?ZHVRcDdBT1FLa3hQeldLdmZYRER4WXNpR3B5QWhGNmFYZzB3TnBSNm4yamFS?=
 =?utf-8?B?WTMrVEpHcHZnMGR2ZllRVE1LeEZpSjlPd0trSGZqTURGWWpqUGJvVGFqNUZJ?=
 =?utf-8?B?OWtOLzdONzdWR0JtamhwamdkN0krZkpkUHJ1bGplLzVwYWU3cGRIRkk4ZjFQ?=
 =?utf-8?B?cjRrZnM2czFYdkwxNEJ0ZU9hYkxvU1pwaHBjY2J1REV3a1pETDkrWEc4VGRw?=
 =?utf-8?B?WU9YeVFkamIyNXFtVHNNS0FUZU45UkNXVjVSSy9JVmVJSWl5TUtXZzVVS3ZB?=
 =?utf-8?B?QlZFK1ErMjdoVUd6OEp1enVsd1BCMlltT2loMXJMQysybVI5ejBqU2hmVUQ1?=
 =?utf-8?B?aGY0L2hUZ3JMcUlYV1c0Zy9PNDNoczVCMXlJeTNjN0R3d3pvSjFsUWx2VGFH?=
 =?utf-8?B?SW1ud1BuclpvcEZPd2RwczNON2lCSUp3ZmlMdTBkdEhiVHNDOGlwS0tTSUtS?=
 =?utf-8?B?dGIyRXdPV2ExQis5ekN1aHM4NmxUemJyZmR0ejhvaEozdmFNOTFsQjZTVXlK?=
 =?utf-8?B?K3R0ZXMxRGU2amdJeGRiMzJRR2dCZUxQL0R2UkVMaHFJR2FSQ3VYYkx2amx6?=
 =?utf-8?B?UGExa1ZWdVZjbmdhWVNUL1dTelBBdGl4Y3V2Q0N1b3NHK1lkeEFDQUFsVWdU?=
 =?utf-8?B?Wk42RGs1SHJsNGtRam84NmVBeFNaaXgvdlJHaEpMbVhCUnB3YzhFVnkrRUtS?=
 =?utf-8?B?YUxLSWpWV3R1R01ZdGVNVUQ1L1NYcjlyWldGWGh6cWoxaDZmWTBRY3hXem1P?=
 =?utf-8?B?ckxkL2J3K2d0RFlqbGdIR2l4TE1jUUJ5YlZtcjh2aXkwaUp6Mk8zZE9zYXl5?=
 =?utf-8?B?ZC9KdXFEdzArNzNISlU4NmNJNzRhbnNhbVRzckdrbUI5cS9vNE05MGFlc01h?=
 =?utf-8?B?UGFwVzd5Y3NaYS8zQ3ZXdzNRb2c1NFJSQktkdHNUelZZeHlXRS9GQUpZS3or?=
 =?utf-8?B?TVZWRXRmVlhpNVJ2bEkrUE5MVktUOG1PKytEa2hJLzJUQ2RXb1oxc2kwc0pJ?=
 =?utf-8?B?VHJ0cDJtcnkyeEZCZGZHalVTdWZ4NlZYZXFTMG12K2JIdlZYenV0dTNzNWJD?=
 =?utf-8?Q?aMAoPH0vA5CKLbmnZb8Nyz0cAPijzAOE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0a85fb-57be-41d3-253d-08da0b1cc526
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 09:25:42.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtnFif9W7DVZJ+k+JRMR8B8Aj5AcVXgczdIWhFNuetF/9b+ZAFRmuPiLuUtECiFkoqwz9/8Z23QzUr3Tm4Ld+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6423

On 21.03.2022 09:21, Michal Orzel wrote:
> Header file xen_lds.h defines common macros to be used in arch specific
> linker scripts. Include this header and make use of its helpers.
> 
> Making use of common helpers defined based on x86 linker script
> improves arm linker script with:
> -explicit list of debug sections that otherwise are seen as "orphans"
> by the linker. This will allow to fix issues after enabling linker
> option --orphan-handling one day
> -re-arrangement of ordering/sorting in constructors section to match the
> default linker script

As said in reply to patch 1 - I don't think this is correct on x86 right
now, and hence I don't think you want to propagate the same (at least
latent) issue to Arm.

Jan


