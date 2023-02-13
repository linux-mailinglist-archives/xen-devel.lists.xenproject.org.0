Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1066946AC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 14:11:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494467.764534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYbn-0005G9-13; Mon, 13 Feb 2023 13:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494467.764534; Mon, 13 Feb 2023 13:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYbm-0005ET-UC; Mon, 13 Feb 2023 13:11:02 +0000
Received: by outflank-mailman (input) for mailman id 494467;
 Mon, 13 Feb 2023 13:11:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRYbl-0005EL-J8
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 13:11:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc282852-ab9f-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 14:11:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8285.eurprd04.prod.outlook.com (2603:10a6:102:1ca::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 13:10:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 13:10:57 +0000
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
X-Inumbo-ID: dc282852-ab9f-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXTxfmDGSuvpfSIL2Q9xewORxAKarov1J5n/EdcITML9DF4M9e4SZKwDiTFYU1CtT4eiUujMP5e8BdVxIf7zuyue8blGQtGTHxuornO82gmLxoYdq0aKtuGLlI22Y2OPdlONiMpebypiRf2aX/GTW1k//o2zC0wuKdfk/ciIWREluf3fIB9nXfYIRNfkZlecymoHH+Ke4njL6xn3JH56iewGR0aLUbyQEr9Z0FOJBI68jF/uSKku7MZVzfZvA/E6M26oO30a0RforHWyoXQGx1dWpOrVgKtZiKx0yHGpB0yCs81m85+AFu4oPRixqZUF2qPsUVw4E8AJzgqzucC4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcMWHlqaGGYXsT7zSNF8Pj/c8v0UVXl56kUhTRl9B+E=;
 b=lTKTmD1kmhXFW8CFzxZXvxqiW7FhhTPwZnlJ91nkItLpc//NeDdxLvB4BA/TlOTrTe/lzaLFfJJPMbBwdP4xmHQe/+uv3EyyS8PYpHyiM1sGdsBrSU6hIRD+eah+5RDpnwqmCKvLxFpK6nEKHlhyhCqgTJJjlXAGEhSJvPxdMpc2HjW07abZYl3IcgLPvmTxf8WlRG+TYZpicgjrODTjI2qM5diStLxqD1CChBcPNgbKPxjl/YkZKDfU6hzlVsyYkR5yui+0oQC7v11teylTrZ9fLov+hwrmjSt8dBEjCrXjoufr2vOY3l4L4FGgRNy0Q+/sHTeNGc9JnhAyQvA3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcMWHlqaGGYXsT7zSNF8Pj/c8v0UVXl56kUhTRl9B+E=;
 b=p8BiPJvkv9TRHLWnl58CChVEKTodRs4XSKBl+UBYj0+GNQYc/3XVnMJha/+74KYFc6dhBkaSPOSBLFImAiNhC8iqzo0PJz75QgmojekLz+dHIenU0qAFcSiC9dNVCJ3XDgCFZdY2bf8LWl4XCNNqRYdseJbYBOuQr9Qbsi5in7NuvZYdUgMOgkf9m01Gvc2yKyqYdgwBaFk4DrEyn3prxMfEX1IyVSDnJQaARVB6RZyiJAj130Qmdzv0ODm6UaDtm6xZbqyQPRXXPM4CJ941iFqh4y12JozOTrFUBnUtaeiHwgV/EgNh6Vy8ONlGw6HnHBuZyZIIEZMMfj52G4PIrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3dc6cdd4-30fe-b66a-bce3-44e798576fc4@suse.com>
Date: Mon, 13 Feb 2023 14:10:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 3/4] xen/x86: switch x86 to use generic implemetation
 of bug.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <b2f6ed2cd9f02c9f21b716595a158906499a22eb.1675441720.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b2f6ed2cd9f02c9f21b716595a158906499a22eb.1675441720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: ee492b72-a566-4cce-3073-08db0dc3be73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZfIwQ2OnmIv5QYJOES6/uhOyLQ7aimwdTEOjIFuVrWPhmw4D6fWyYZ8Q8eP6nCk9mcR7NzBALt12fPVBRlmaeCEwG9+SNV6G+P9LhlGeH4zCF0R/+bASTU8ayDd+4zZ1Gf140jWCgUzrv3iYIDevlPw6QxBUGGJXNdxVn5LxiWdiwSCGwiNGXOZChlgakTKsWXrw71oxyAJiBi6IfgV+rkYXy/kDEqMfpTPjyaGb6kNo11CcMocIb65JpekV5ig4uGUnUl1pEGtII1Fhb5ODZV+G5KuL8kK4GZ4loCZkMwLrVbiAf4zqppus4i9XB4+W+hKo+irltKI8UOqRio/oZ2VpCkjuSpO44SvAZR8hlRNXQGawRn0j1kJSgbte1ITyfh+5snEm4x+HnKAw+noHA/Y5+F0gcT3eI0LuBu8ObzbXzi12MSWP7VEyPvBGvF0l6W9rUp6IgOLLbm1LTbh+rwC5fM60UI6Dv+l+RI+FHj8lPV2A5WpszVlQTjTQBnZmuAaMbosX7MKvfvT6aHlmb7DnfhInKXer2TO/+QXKWoyKvslcXfEmd7eyvMiePtBKUJmylu5BFm+ZPB1nhUS327Zgrv3SzMqM/GthyzF6Ik6rXVI123HdtOU4nyaRlGHyj9uDmTQR4DRtbDWhgMpq0KmeDWIb+r48GgRdlAvJBe68liNJcrvwx6mlM2icTUy81HZWt9xz4j0Z5AupmyYyO7vQ3iQ9pJwLNvjkS/ELgdo6WwhS3UyTBx4RWOATN3n+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199018)(8936002)(38100700002)(31696002)(2906002)(6486002)(66556008)(66476007)(8676002)(4326008)(6916009)(66946007)(41300700001)(5660300002)(31686004)(36756003)(86362001)(54906003)(6506007)(6512007)(26005)(186003)(558084003)(478600001)(316002)(2616005)(53546011)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2YxbzFsVVNXOXhIUXM1OEljZUlDREJOcFVUeDQxME96NWN5K1lqTjdzWStS?=
 =?utf-8?B?NEMxRGV6cGRETHFnL3lhNE14bmtsSEx0ZE5wdjFURW5nNFlseWdJcWJ4OU9h?=
 =?utf-8?B?Q2hzWVFtZDVwZ0lML25VWGMxVFhid2g1R0Qyek54STl1ZnBaMGFjcFczTk95?=
 =?utf-8?B?QU5PNUhwdGZaNkRVWndKS2oyTjlVbWZIZWlZT2dORVdiKzlPRnRXRjNYalNu?=
 =?utf-8?B?eTlKOXNJbXZJYVI5NEhZYU4xS3BIcGUvc0hORjBVaGsxZzRNREhSL2lkNEJE?=
 =?utf-8?B?SzRVaC9vWnRFbEtsdURHY2RjTkdFblJTeGtTMWdrWTcrL1RmMk90VENmZlJt?=
 =?utf-8?B?U2pOMnM1QVBNQWwxeE4rTWVLaFVZUklnYVRIR2V6SVd3aXRzNE5NT0Z0YVlP?=
 =?utf-8?B?dktXMXV2Kzc1ZnRtaE5tYUs5d2lINEg3SXNOMWRiMGhHMkJsUDZxMTlhSS9D?=
 =?utf-8?B?ZmFmdXVPa1Jqcks5MmczaFhtUytjckw0Qmd2bVE3VEZ4WVVNQ3hWVGNOL0pD?=
 =?utf-8?B?YXVXWXlVbzVmeXZKY0tpd0NWTTJ1WlN3K3BZV2I1R05yREhtOXBWUGF2V0Q1?=
 =?utf-8?B?N1Y4bjVFWERYSFVBYlkwUnd3c2E4QzhyektoaUNjY3N2bzA4Y3ptRHZBZjZr?=
 =?utf-8?B?VFB4dzVOUXA5NUt4bkdkV2RNRXVqMjRHTUhSeXVKcEJVMFJMUlR4SHVUNGlj?=
 =?utf-8?B?UzByaU9pdlJsaE1NWFBCQ3Rhb0J4bHhMemp3K2grdURqUnh3WFNNcXFXVVpJ?=
 =?utf-8?B?dWY5MG5uanVKNERxTjJQd1VHaWFDblhLVGViLytCWEZhcXluSHB6Rld0U2g5?=
 =?utf-8?B?aFIyOGlxMFUwdlF4YThwVWZvMVpMSlhrSHY2c2Q2Z3ZlR1RSZzJtclRFZ1VN?=
 =?utf-8?B?clBOMjlULzZkdXFacy9rWGxwSWR6cFlvMmVLT01YNlVRM09vSXRzNnEyeW1J?=
 =?utf-8?B?cnE5VTZ6SXNDWEhSZzQrRVREajErTGhhbHE5WHhUN1ovTVRYTFFwWE5PdjRi?=
 =?utf-8?B?OWNKdVB2bEdWdkRHZDM3TXFXMFZ1c28rTE5abmlQNkF3MGdOUFhjbmw3UFVI?=
 =?utf-8?B?alJuNER5RGJRWCt2Y1FBUHRZdGFkL3V2M1h5bHdRdEpRS1U4Q1FSWXhHa3FI?=
 =?utf-8?B?aVdZTHJEeStEWXY5MngxUklLQ01nMjRMYWFZVnZwU2MwVkZXcGp6WXM3WU0r?=
 =?utf-8?B?K3V3VnZ1Vlh4ME11T3BYWHhkOGNscGdHckxMZjdIZkNTUzhNdUVybFJ3Qjh5?=
 =?utf-8?B?SUFIMVNyTFJsMEY2dDZzcjhuUk9peWxTUTAwTVQ3NE4wbHNZU3YzWlRSQVE1?=
 =?utf-8?B?VmJxdWE2OXU5NEtNUWxmRFpSdHJNaFdkOGJXdjB2cDRiYUZlTis0RlI1cHRy?=
 =?utf-8?B?SGV4Ky9MaU02RGRmNnZJNHdKOEcxaHJMR1hmelRlQUJQVG1YdjBBZGpqWk44?=
 =?utf-8?B?VGdCQ3hkN3ZXUmM0MWIxZ1UyL25ZM1luUm5IMU11b00vamhWbFpsNnUwZVli?=
 =?utf-8?B?N20wT00yUDVCVlZDYlU0Z3ZkL0poWWxsZGMwQWh6Nm9QeU9PdHhKaVdTN3VT?=
 =?utf-8?B?TjU5bVdXV3BCdDhrNWxoN0ZGNkdvYmJkeElNRDNlSEZmKzZMTGdKOXZpdWpy?=
 =?utf-8?B?S1VzeGRsUGdic21xb0pla2RqNW5sNFNWM1dnSmxqS2gvR2c3eEI1WDFFMksv?=
 =?utf-8?B?eW13Njc0UEFWaEdra0xYenR0RjZPeElQVTdxNTA3dnRkLzNPWG1DRFRjRGhC?=
 =?utf-8?B?UkJ2UW5NSU8rSk1iUVVockNsKzZpS2pKNDJCU2hVdGJWbkFZczNnU1ZVc2x1?=
 =?utf-8?B?N09NUFNoVnB5MkczS3A3YWN4SWRQdW5weHBMaW9iWVJ6OEYvNjRHcWZhVlR0?=
 =?utf-8?B?dis1dCtaWFFScnprMkhveUFzYU1VdFhFUmZWdXJDVG9GUVlXaE4ydnh1UFFx?=
 =?utf-8?B?clNyeUlhSWFsMGEzak9FQ1R5VXo1cVZiMUVGQ1FOeE0raFhna3l2NUQ1Rmdr?=
 =?utf-8?B?WG1Wb0hMVEpzZlZjbTNKUVowQ2QvSmU5ZW80TzdzUTFmSUwvZGpXaVAwdFlB?=
 =?utf-8?B?Z2g1WVJlT0FJb3BoVmtORURKVFNxQ2wwOHJXeGE4MzJhUEd6eXpzdm9kRlNU?=
 =?utf-8?Q?/4TFccF/5JSIdq2GXabT1pDRQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee492b72-a566-4cce-3073-08db0dc3be73
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 13:10:57.3685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OFUNfPKmDKwvwqP74+rTLQqhCLXiNPdF+56roAHwomlglcUpoYWIm3UUpEUV5UrhY1JX4rIohny78ULesO89g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8285

On 03.02.2023 18:05, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Is there anything keeping x86 from also using the generic do_bug_frame()?
If not, switching over would then likely mean no need for the new Kconfig
control.

Jan

