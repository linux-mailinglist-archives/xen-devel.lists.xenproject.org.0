Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C42527504FD
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562314.878949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXIW-0007g2-Jl; Wed, 12 Jul 2023 10:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562314.878949; Wed, 12 Jul 2023 10:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXIW-0007dj-Gc; Wed, 12 Jul 2023 10:42:16 +0000
Received: by outflank-mailman (input) for mailman id 562314;
 Wed, 12 Jul 2023 10:42:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJXIV-0007dd-1S
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:42:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c26f5df4-20a0-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 12:42:12 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DBBPR04MB8059.eurprd04.prod.outlook.com (2603:10a6:10:1e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 10:42:10 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 10:42:10 +0000
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
X-Inumbo-ID: c26f5df4-20a0-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XC+7q9BaTnQHb2vXQ3FojEcG+huQDz1g0E5WJyc5nfcGCQq0mmO9lbQbnmwMGBT2LkY2P9ZDBrgcAUufdOr7Mfe9cV7O0yGoUS84vlETa9TbbsHpPjJBAv0F8YcL0eheeSei0n/7eLNNYuKPKpiKhh3ytBAmj0TN0ZXeo5Z8awh6gmpP+Lk5LeC37b0uedMy4n6TZPgOoJGd+cqZQCb/7yGOnZkdEU/lkYQqUXo1+mnlNZpXURYUzKuaw+wSoIatpFIMQLhDlQVDkKZQrZcg4XoXIZG8gb4d47DuPhjkvAkecWsX4e4CbzTVKGjhDyII1eF01mTsz+pGIul2Jb2EQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGIQzh1SUNfLLYTD++8e87ktMrg9m0u+487+hAjsAeA=;
 b=BA8sUaE4a+GEEMJ5aY3S9T22Sr+8+CSU6S12Ho38QG7uvPCocqRowsBH5mMrVZiYeNAPbQAf/hTIj/Ho3UF/FrvWHEDR/ajg3FQGEeiENn+YhKnPhzMDotZ+nmnRZv6dlYg7ENzhSTtKUfanH3/IV7bmfYk+0BEaMnB/lVrNZEyeurb+2/SEvD/CoDLxBob8z9Zw95eK0ozYcREXSTFbvzdevNY9vpz4mXUX37eQzDSXtqnouY9oTnyJyM5RyFIhlol1borJbqDaBiVtO2d/OtP6ITBCnAz0OFsRcL3Z/LeXB8DuGCDcB+Kg1dLUBTNcd2dDd3btwx+7ZrJ2GJeDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGIQzh1SUNfLLYTD++8e87ktMrg9m0u+487+hAjsAeA=;
 b=npU6tswNJ/wGjvGpKX80ALAQTp/GdnoX32DM2WjF6CBN2g0NXngfbcXSXfwK42o3JimozvlyAA0QXp6s9qG6Yb1r+46IbfPzYyNIlAm6+dCjJN9jTKc5R/Av8FiUUwKoReTPEUTBc7+uM/HtEPBy1uBh6O+HSIgWGhrEX5kKHxrKC6Fl37jtQxhX6DzciLwgcHTCPG8pensZqCXbKkD7v34FxtCO8r2zmu2hmHbf6ovq55TeIXOLI8plLlBs8HoexTGDIU1Nhqmmy5uxJwA2IfzX7nsG3im5muVOOGvQPbklCcc2eClAp6dNsTDFZbMdFXFBiNoNLWRGsBOhK5Q+XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <feef360e-8da0-4ab4-c479-0fc908827a1b@suse.com>
Date: Wed, 12 Jul 2023 12:42:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3 00/15] xen: fix violations of MISRA C:2012 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Juergen Gross <jgross@suse.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 George Dunlap <george.dunlap@citrix.com>, Michal Orzel
 <michal.orzel@amd.com>, Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1689152719.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1689152719.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DBBPR04MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: d2068178-5e59-4065-1617-08db82c4a564
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9bqhxZ8JLmRIWTveWbTOenqErs56PGzrg5W9H5Fjk+PGvFf34AR0hTtA82b89DxSiupytTVU85ydR8QuQoYr3bK5upUXms3/rAcLPJfx2DswhHAOGu/c2jub6+kCEde6272t2qge4FGk8KNAWiBqq8u9fv9iCAi7muspMlE0Sd1CgiQ/jftJPwCQOT3uZ1yX3ZOTZfskP4OOM/I8smobT+v/yhaMejbw4T9cDG6iIXQRpNi+c+2W65De+DB0l0JhOneExfZpXkKx3vtCaH3p4pupe2qOHXPDH4yWiueB/LfiVSnlXmED/++2IsKRSE6e+6NBR0ICpbHrHKH6ZS5x3u64/e1N6DqSLzSyHt6auZXdRQ3mXfyKBwQwyhw/HpKwj9ldU2rrAy9/WvX+t2As7T/9h/+VJppPbuXeVUq5JXbI/X9EPvasRphVs1WYkB3XIMP8rcmW1ZcgtWauvti5s+YhtMTzgKaacgsnIGj5G9PhildhyStlWhn+RHOy79wWSjNi6YqK5fSK1Eg/0QnyqGT4rZman5KXZx3zV+cu13CF8JADa/W+HCoqC/+DXg0NSY81qrVt1UuoRlWYNd30Tn7qNAZ91uSXowUkLkqqY2hNiSpgR3Z+L506LBZ57lXjdAmNDazaa9pYkMv1TgGxKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(6486002)(478600001)(54906003)(8936002)(8676002)(5660300002)(36756003)(2906002)(86362001)(4744005)(7416002)(4326008)(6916009)(316002)(66476007)(66946007)(66556008)(38100700002)(41300700001)(26005)(53546011)(31696002)(6506007)(31686004)(186003)(2616005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3NLMjM2VDN5Y2xjTm83cGp2b0w5WXR2YzIrR2NuSURXNWRQTTc3cUpDL3FE?=
 =?utf-8?B?V2JsL1ZFQUQyb1pKUDBBMjRRMDk1RnY0cmpSS3BydjRaRk81ZnRuMUFLaitC?=
 =?utf-8?B?eVg5Y3FTT2s5RjdLekFTc21TV29vd1RRSUwrdm5pK1c1TlR4T2lqN1kzVXdE?=
 =?utf-8?B?NnhUQzRTZWVpb015MGsrRStCb0RmOTNJTUdPeGJpZklsRkdNSHQzWnJxUWdr?=
 =?utf-8?B?djIwYlVRUEV2UmZxaFo2eUxpQzFQTEg3N3g2Zmxic2NaUXdXMmhuQ3FJb3l4?=
 =?utf-8?B?SFF3SW42MDBCUnJXYkoxS29XRlBwQXZyTElIZkFQOXhvU0p0WThBV0VXdGFt?=
 =?utf-8?B?YkxVbWhhL2YzZE8rU0lUTkRBRkFHaDdhdndDS1VtT0ZRMjFhTEx5OE1VOGt0?=
 =?utf-8?B?dnhlWmlrWlFvWllFQ1ZJRUIvQlNDU01KeEdiNXpVSVY1RGtCREs0akZ6T3c1?=
 =?utf-8?B?bWh5VlBqYWtjYlZNc3htUFErNDVaSDFBSzd2Um42TGRFT0Y1UVRKelNlTmZ4?=
 =?utf-8?B?K2g4b1RPQ29uYnpRYWZpcjh6ZEd2V2pKZkt0VjdtWmZhN3B1N3pqY3dNNndU?=
 =?utf-8?B?d1RiWitSMzQ1VnFwTEMrMkcwelNRZWFLK05qMFIxa0VSU29VSExFM2lYeEx4?=
 =?utf-8?B?UlI0TGdMUHlNcUdySUs4SkZaZHJsLzdiUFZxU1RGNHdleXUxeDliNWU3eDFS?=
 =?utf-8?B?V2Q3bFd3R1ZqUWUyQ0FtaDB1L29IVytTWjJuWndKUFBhRjhJZXNITElFYjI5?=
 =?utf-8?B?VUNUUmZzKzlzSlIxK0M2Sms5UE84M2E5TEpOaEg1R1VMNnZVdHpWa2hEU3dV?=
 =?utf-8?B?SW9XcXlRdGFqVHdwQ01TUlhmNkxRZi9PWWlWR3RLRXRjLzFDeXM1SFluOHky?=
 =?utf-8?B?NGsxY21Pa21hOGh3cG1lWkkvSW5yL2UvT0J5bDlmUjcvWkluWUc4NlNhODdN?=
 =?utf-8?B?OGtzek15MlZDbmFRZEM5N21RU2tZbHFKNjBwbUxoS1VtcXZUdTBhMDl1eG5N?=
 =?utf-8?B?cVBnT3MyRm1FazZjTEJSMXVwYnQrMnlrRjExczNnRzVaTkhXMWVTNFErTHd1?=
 =?utf-8?B?d2cxdjZmbTJ2bVhRd2c4b2t4R1h3WXAvaGdicEpYR3ROWFpza3ZrUUVkVlB0?=
 =?utf-8?B?bFdITE82emhsbzZDS0ZtSFlzcktRanlKVUpJc1IvUmZrTWJ2Tm1zZTVMQzRB?=
 =?utf-8?B?cFNuVlBqREwzUUk2clEwMndCVzZhdWJNbjFCTXRqU0tUZUJ3TTUrTmNZM2h6?=
 =?utf-8?B?Zko3VkFtcjFKWFJQMXBmVUxPZFlpUzNxb0VOYjBGK0lrcEhnZ25RdGRESVBQ?=
 =?utf-8?B?VjdaYTlnUnJrbCtpa2RrdFQ5ZTZpNzdTcmpFNy91aWgyc2xHMXhYQ1NlN2Qx?=
 =?utf-8?B?MzlmSmZjQUJzNHVBS1pCU0ZyMWp0ZmxJL2IyQ3VsVS9GbnhJcDE4NG91VVNU?=
 =?utf-8?B?Wnk2cER5QjhOR3Z1OTZsNzJkU3dOUTJzZ3FuSU9GT2VNdjJXVmllU0hpK1VC?=
 =?utf-8?B?QzhXbG1sbm1Xb0llYVh0R0kzNDFvMHBaV1p5UFVXVzg3ZGdPSTE5czdmMkZs?=
 =?utf-8?B?UGI2ZDMvMjlta1ZOMWhtYnd3K1RIM09iQVdyQjlvY1pNUlZNZ0xMWUpPSVNV?=
 =?utf-8?B?eHhwVU50UldWaEM0QTBweEdTRzBnZ0pjd2xkM2kzK1JCYnl5Sk9QbFg1Tjg0?=
 =?utf-8?B?OTk1YWwyWm1BYXBmNjRraW1TcXU2MnVaR1pVQUVDZm5uaWo3YXdVTGNMRW50?=
 =?utf-8?B?T3JiMnZkSDVJaEF2a0JNZWNrK2hLUmZ3R3dSN0x6RVJpb214TGZrNkZTNXRW?=
 =?utf-8?B?ZDAwUUZPQ1F1bHNONjV3U29iMjVqRVFGQjVTZmdGWUxsd0x2bWRtT2F4bUpC?=
 =?utf-8?B?dXVmUzMyNkxKNVc5SHdBOGkwNHJ0T1RJRG12M2hzYjZKUTIwZlNpWnhkVXRF?=
 =?utf-8?B?NFdUcnZ5YXNqdUZIVHlFQ1lwUGMvbnoxSWN6bTlzUHZPNUpuNGVqbWlUdEo0?=
 =?utf-8?B?ZTRDcVdReGtiZXJNdkk5VDV3aGFlaUpQdVVSYWxibUFqK1lKSFcvaUlnRUVN?=
 =?utf-8?B?YmpHRGR2WG1jQkVWUWRpeEVKMml3YVlVR1QzTWVtZ3A5YVllbjFWaldid2Zl?=
 =?utf-8?Q?X8RoSQ2oTsvbWmZC1JtEvngvQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2068178-5e59-4065-1617-08db82c4a564
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:42:10.4368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NOJIMp/ns+Ne1LcNL8IibLbVMGY8shw2fOyyCR+IlzsFTaNGpX7DZSyOP9ePCbWDSyyJOfoT4vQderxjFxwdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8059

On 12.07.2023 12:32, Simone Ballarin wrote:
> Changes to macros 'X86_CR0_PG' and 'MSR_EFER' in files
> "xen/arch/x86/include/asm/x86-defns.h" and "xen/arch/x86/include/asm/msr-index.h"
> are not made since they are used also in assembly files.

I guess I overlooked this in earlier versions. There's no need to skip
such headers. You just can't attach U unconditionally; you need to use
_AC() (from xen/const.h), as msr-index.h already does in certain places.

Jan

