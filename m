Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDD958FC0E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 14:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384543.619937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM79f-00050r-Nw; Thu, 11 Aug 2022 12:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384543.619937; Thu, 11 Aug 2022 12:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM79f-0004y7-KZ; Thu, 11 Aug 2022 12:19:15 +0000
Received: by outflank-mailman (input) for mailman id 384543;
 Thu, 11 Aug 2022 12:19:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM79e-0004y1-9p
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 12:19:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf7d92a6-196f-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 14:19:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6408.eurprd04.prod.outlook.com (2603:10a6:20b:fe::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 12:19:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 12:19:11 +0000
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
X-Inumbo-ID: cf7d92a6-196f-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oijw+qy+lo+ibc2AzNyWyAzabVp78IZCIu8vgCFeO4PgLpE78XVkXKQnB8NDh9iQd2SYVermtht8SkQU97J6P68qsiKx0C/ojN32Deu9CCWPV9SXEP2Q0QllZ2mL60slO+sNituVwgwKSgI5oiEgScJ1gDT8MBoE/NWn0+ZYjqzklSV37rBAY8KfplV1nvwvpop+S+CBRmOYQXkq1Zmpt4mVQbLeqz96nm1fHr8joAh53ExBmgj9lnYO9TWkO41v7vXmcvFn8L+SjM8slo4MPD7PQ33uXF/QpG/X66NppPgPRA2ezetpYgbweEZIzODTmqTklJJuP8Zv0g1V4MQhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vt4YhZ+VsFMAnXlFl+BbRUtWC73QOZDgvmRBY//Bzks=;
 b=WId0e9fW/zEj+Ieot39LyfBO1Xe3pjGCTDE9nJVdE0BcLdGnMk9RgtEaJfoBS2pa4UCjZ/UcHwlbjhijJYqHH6oCBfnrlmBiUAm03cTTOr43+HOSqytgB6lrE98tCxQ5/4RhkUnodjLJM3NPGwvtSXv3NILho13T+5VZLrBlTxBws+fq7F95nJZH9R1Ep+lgrkq2xA1UScylmuli/NQqZnr1em6NIWKJ0BwWdlSFoL+VrVGvt7gVOw/DwVT0zr6uJErJBIJtOXz927Y8AHIyarrplpmcdx3+YTKjzZDbeCIpeXgoqUAPcZZxCSD2n3t5/40VuNQ8YuF0UvT6FtHYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vt4YhZ+VsFMAnXlFl+BbRUtWC73QOZDgvmRBY//Bzks=;
 b=suybSlTu2k38iXBFQlZgsmCT8EHm/D2UNtqMMlXGBLoRQ+UasRXG0+z3MRq/Ab2BXa8lIZjjQ4+Sx7AaqYJtVnekl6Odg/CEuXx1JEHMiUmnaq8IrqpDUBvvhDs0YzlwOVvd0BVvmNQ2Ku7YBN6V6Gu8ZDavGEm+4XUeDPRu6kbc7J1ETjWobIcZOW+8zuIa1hempty4Z7+Cy5I0rjS3X/VdVuDIT2z4IFfkY4/CGo79w5KP8L1Q5wcZwX2ef+s4TYFlPXvW9kCXvpwmKs9NAdrqbvv94/4bZw3TrU2oEOh+rRhEWAdrmf9CE+EH5ecPf/dCG/UrfEmN+D2oQO08SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a74707fd-9ad1-3541-00c7-f0f91e9af4eb@suse.com>
Date: Thu, 11 Aug 2022 14:19:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] x86/amd: Only call setup_force_cpu_cap for boot CPU
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220811105956.3984262-1-ross.lagerwall@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220811105956.3984262-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0025.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fc34293-2aa6-4b53-1971-08da7b93b28a
X-MS-TrafficTypeDiagnostic: AM6PR04MB6408:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ubSKYMhT/7ZfUkENa6V9Gfi6n6dWkR2bZXQtf9FnTU1PaO9+ZHMhYWe5ueN3pYJ0mjecz1Ldo+PumD4QL2FqRjsA+PsoMyMsiq5klWeKbnBrPA9bMAsvlDcFDrkv6RV7smnQ3oxKS23J+7KSAgwcsY6vVtmf+PVhEyFfI2BLAmMofZtdup4j6NDLwcqYcuG2DKkKiG6H0CEleSVXyBfsDuUxG1ljWfwBxojFEJTdjBkwX2QIWXwwX+GXy6cLsTJSFtuX9ASUyTkORisFcRUWeoT1GWemQ7f8qm3yzpfMEJe49/SFD/NITvjP/u9IHk+o73l2cGmdORQZd79GkkM8SyjqX1gs8cNVn9nk4lNBFO3j1N2hilo80P6Hoe7U18MUEiRNhkrUQIOQR9R5LVdI7YII7NJAegvqwPviJjYFsJ3O3bYC93+m3oTe+krgOxfDUN7I6aLvHoCXD1vJT8+S6qIwi6DPaY++cQol+bprN05OYM+V64TS9EpCiCP/IE5Fjp5dUi6keN92QEaaqKf6MzgHzAXep7Jq792WKcXkqI2+ldsgErqiQAzgVLidSmFB9CROZcwytrXkTP0BnHw5k+Bv82PuWvwXjiWdod/DWMK8TUvEW5URzkbPWvHqrEwICZLdM4+juX0eZjqL6NcX+J67rcC/pCcoI7SpVFJ2tj+1bKOhs/5MPY56pd2Cr+xDGkTk9haqdvmggjoYifcp0I9LtK7Ocgzs2YNt7pCZnSf0FBAUehbmogs7B3xesOG0MOyqnfdy75opwC34VfMxY3YNmrGPd0hI4vb2hYWZfj+XDcdcfaxOXaEWZdKNjGbb4/XMT3TwhJ4aikLhBT36MQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(136003)(366004)(376002)(346002)(186003)(83380400001)(38100700002)(66556008)(66946007)(66476007)(8676002)(4326008)(316002)(4744005)(5660300002)(2906002)(8936002)(6506007)(41300700001)(2616005)(53546011)(26005)(6512007)(6916009)(54906003)(36756003)(86362001)(6486002)(478600001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUlZR0ZhUEQxS2RFNGJ3SklHbWZwaTVUb2xhU1FoTGdnb014QUNBRVMxZWVo?=
 =?utf-8?B?d3MxTTRWNHhkb3BKK3JmcFloa3RLR1FUQ291SGZHSThZbG5rdFFiZkFxK0kv?=
 =?utf-8?B?QjFYZ1RpU3ozbXR1L1lWdUU1VjE1M0MyZzFWSGZLbVJYU2xuN2ZiUHdrVTh6?=
 =?utf-8?B?djVnYXN2aHBmRDNLUFg0Q0c4M3p3S2ExQUtBc05NUDN3YXlDWXBJS2JHZkZB?=
 =?utf-8?B?a1NCMkxwT1FzaHloS1BzQmFzMGhkYVRRSUZublVXQ3RGdjVEMG12RTRLaFZN?=
 =?utf-8?B?S1ZVRFhaenN0UkQvbHZBejgzQlFPTmMzamVDL2UwaFU0VVpLbGpiV3l5K2pY?=
 =?utf-8?B?azJJclRFQ0c4NVAwR0gramJBRmFWRGZCNjE0U3k5VHFiSzVFUTFMRGhWZTI5?=
 =?utf-8?B?Y1lvc2I5VG5qdjZHWmpybHRkaVVGUjIzdXBYaUMrQzkyWUc3RHNzV21YQmR4?=
 =?utf-8?B?TlRpL2RPTTJnak5qaUd6cWtmUEhFNXFwYUg1L1Mzb3lPY3RaeUJwSG9wZ0RE?=
 =?utf-8?B?UHhmUGlYNTM4TWpRc0xzSzVqbklHK2tGb2l3WEhCUUtVdW5JcExxNTJTNTBK?=
 =?utf-8?B?QlNyKzJzOUtUWVdJZWJEd1R6VTJZSUh6anFIdm80RGU2bDhLeENha09oVXpE?=
 =?utf-8?B?YnFOQVYwaWt6VnlTUGpwZ2hWa0p1cTcrMzhYUkNEWlc5OXprdllGelkweGdo?=
 =?utf-8?B?RGd2OUFrTTBsazcyNmZtY0lvN1VuR1k0M3JwTzIxekxoZE5ON2VRTFFndEZu?=
 =?utf-8?B?SzRpVm9NOW5IZjBnVEhjSERRZUZQdC9sRStDSmJuL1pCZDJxZGpNWXpTaHRW?=
 =?utf-8?B?OGJ4cnJWTzhDd25xNUdrQkZDQ3MwY2REMEpMV29uUlVUaFVLUFkvM1N1Ky8v?=
 =?utf-8?B?Q2JzY2lxcHFQVWpxU0JJRXYzR2htUGlLZEVGOHRGNi9LaHNPeWZqWkpGZ3hZ?=
 =?utf-8?B?eXdtU0dVbTd6R1d4dTloS0FnYlZsQlRLVEpaT3pXVG9mbEpVdFlnSCtEcU1u?=
 =?utf-8?B?dFFISzYrdUdkaEp3akVDMWZvSEdqUXdpc2o2aVVaRmdjaGxGa2pPTlpIVEwr?=
 =?utf-8?B?Si9CeVZOSW1ERWo4dFM1Z2xHd3FmdDdZd3djaDJZMTZXSjhLY1pXQk9vYXVa?=
 =?utf-8?B?b2JyV2cyZmxMTGtGUjMzUTZmM2Fxcmg3OFhLUU1ZR0tNOU5oNEVFRG1Sb0Zz?=
 =?utf-8?B?Q2VHbWhMZmMxMG9SVzJlL01jK1ovUjlTVHJyS3FkZldQRjdLMjY3WGZHYWpr?=
 =?utf-8?B?ZDN0T0N1VCs3aVNVWUIxcWFDQUtqMXRzcDlWZk1IdFdETTNpaXE2NmFCejNS?=
 =?utf-8?B?K2hieXVuZnFiZWs0MFFwZDZKSnNaRXZWR0tVVGhwd2ZSTjJRY3U1MEZlQjdT?=
 =?utf-8?B?YWNyMHZHQzNacElpc0UzSjR2bGVvVHUxR1lidUlhSGdxSXl3QVI2aXRqS1Mz?=
 =?utf-8?B?dXZBa3ZxS0JRQWJMWEJ1d1lKQkNoQ1lET0NrSHBGUEdQdWY5KzFQM0pxY1Fp?=
 =?utf-8?B?bDVIOG0vZVp5Rm0vVGprUy9qWDNCSTlnOUJDU2N0blRsN0lHbHVTMnBGenNG?=
 =?utf-8?B?MVF2UFlKV2JnZkdYZ2g1Qk8xWGNLMmVQYThabUpEd0hBS2ZjKytvQUt4U21v?=
 =?utf-8?B?WDRUdTdMYU95cHVNeThkRTBhdTl6eTQvcVVjZlBGWDQ0Tkw1NEllTDl3N0lr?=
 =?utf-8?B?alZ1RkZQVUFJWE14MSt0TGFPaHRtOFdVM0JaRHNOYnErR0oxU29XQjZNLzI3?=
 =?utf-8?B?RU84SUNiUHVGd2M2QXMyWStxU3lkSmppOFpsZ3J3K2MyRnBtU3B2SytLSk95?=
 =?utf-8?B?RWdENDczcS8rendsWWoyQVlBZUF0TkFhdmg4M2M3dkpIQlFTNWNyempncVR2?=
 =?utf-8?B?eE5YTllVYnE0UDBLd0NqeEZnZ29yWnNheERaVG1MWlIvdFc4K1Z5YkZFZ2px?=
 =?utf-8?B?djhSUTBpWHBMcmpmUGxTNEo2bjdHczNJcXZnV20ySUZYVVpQMFFBRUtjRXgr?=
 =?utf-8?B?QWF1K29MQzVHTlpPYzNZYnJwZnlJRDBWMTNKVUVaV3Qxck1iMTlyWUE3bnA1?=
 =?utf-8?B?SHcvWWFRWDUxTEtVTFZsQm5oeGNpU1pXRHdxTGZZVStDQWxKWndGcmVwNTlU?=
 =?utf-8?Q?rtkCI0rdv6L+bt70pz9/Jms4q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc34293-2aa6-4b53-1971-08da7b93b28a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 12:19:11.3400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXH97tHtVeU0rAHVzTYzdNvsrHnVpXTM4CQsTk7EaMgxm6bkMSVs+rwlbOZ3q8xp4BzMjpnOM28mU40Isah49A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6408

On 11.08.2022 12:59, Ross Lagerwall wrote:
> This should only be called for the boot CPU to avoid calling _init code
> after it has been unloaded.
> 
> Fixes: 062868a5a8b4 ("x86/amd: Work around CLFLUSH ordering on older parts")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -845,7 +845,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>  	 * everything, including reads and writes to address, and
>  	 * LFENCE/SFENCE instructions.
>  	 */
> -	if (!cpu_has_clflushopt)
> +	if (c == &boot_cpu_data && !cpu_has_clflushopt)

... I would have put the two sides of the && the other way around.

Jan

