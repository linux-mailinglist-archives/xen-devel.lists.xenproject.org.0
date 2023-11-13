Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39847E971E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 08:42:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631344.984594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Raq-0003Sa-Uv; Mon, 13 Nov 2023 07:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631344.984594; Mon, 13 Nov 2023 07:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Raq-0003Qx-SG; Mon, 13 Nov 2023 07:42:48 +0000
Received: by outflank-mailman (input) for mailman id 631344;
 Mon, 13 Nov 2023 07:42:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2Rap-0003Qr-TP
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 07:42:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cdacdfa-81f8-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 08:42:47 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9258.eurprd04.prod.outlook.com (2603:10a6:10:372::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 07:42:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 07:42:17 +0000
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
X-Inumbo-ID: 3cdacdfa-81f8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjDzev0lUJe/fopdm2N3VmubACCSzFcd5fRcjBxdAWmlVVYLolxIWXXObReajDkTfPz4aWMEjPTNuUWfoV/GlrsncPIrAMn+V5ZCZozsaPHE+2JtsCVXl1/n3r3YxF5AAG8dvw6OeMzGQksuXS22AunGRhaUVi/r6cAOP74AGdeFuYs+0Janw850pW4pkflyRjBOCb1kvA7pG2nl4AF5x3pd7z4iSJE4Oe6ckP1N7Z/T02NoS1azK3PMAHROUu5yAuz2zlFUOPGpEDfiwAr0RwR6gRUNrZ1C83G+kW8Qy92FpEsWU5eII9oHX7SrnvKYWvqW2NTiKq98q7NFw4X8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQdPypHk1D38FvhAeKAP2lmJ5NwIRU0tMSeoUducric=;
 b=Sm4NhG2n7d4nn28j5N/xmbe6Nx5+DKF1BpMQ44gEd+pXZjWtucXTAZQ/5hWCfoj8sfJ0OPIIOiUX/9ljhh+UsIXpz4Ml15gLOo6grPvfkgfTS+2ItREGvETYVfokRTbmL2cnZXg6LhhnDS1HvjuBE7jXGxMyg1IXo88eGQ/u3ccyNm9TJhMFQKFnr4apFRqEAcuMYhSzxt361qOhbA5jeiOpcZt3125LzdEljae76Daxpm5qLxrrwjGLVJylmu8qfGyPfu/i77tM0BIxAC5CIvz/n1ghB9Hgj6WLVNSzBWoxBQEqRVQWie3Vb6kvC96gSw++ElAkDuPNfOeVc38mWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQdPypHk1D38FvhAeKAP2lmJ5NwIRU0tMSeoUducric=;
 b=S3VUhPT+2TE/659x/O1J83X3e04/Y+eeXwl/rY6hwBM3BmcybLNOyt5LD3OJFommcPHlXv3LRwCw4QI2/vn+kOhzmOus5+eKKWIzlDfSLR6R4YN+KjXuEcrkg5KnqsOu5ut1+uKgjULarZdLHnnMdOlitmv1WRx78H/C4M5S7/e1W5NjwXHzfBGjpQyuLGSEyKD3e4VlJ9n56Z94RZDA8Kxrjp0rs0/Qmz8JtKTfOB9Y7K+1JlVqj9PHb1b1qIIR/GWpw2y6Aexl3wg8py5lFTGqSICA5RL3uufIG5weaxBpMiG1/h2WsVM1VuXPF9YHTvREzzTl+xgJyDd9l+jd9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a3ae560-13fa-b8df-75b7-6473048232f3@suse.com>
Date: Mon, 13 Nov 2023 08:42:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18] docs: Delete kconfig docs to fix licensing
 violation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231108143751.49309-1-andrew.cooper3@citrix.com>
 <a6f54856-f0e2-a2ef-5cbc-900ed87c5d31@suse.com>
 <alpine.DEB.2.22.394.2311091558380.3478774@ubuntu-linux-20-04-desktop>
 <a162733f-859f-41ce-8575-89b0e2cf702e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a162733f-859f-41ce-8575-89b0e2cf702e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef6007e-fedd-4b3a-e533-08dbe41c0f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VlXBLv8QCkbwDgvL0Ggydl/qHVHFQudoXGX2byy/kEZNbHG1M1/gbSwsxzhPjmmeMZ2EwDQ1aNhdTX1/xVAp3IjQHk9dYkzH3orvcXLrNv8pF+LEcvhvlXe63H+tAxJxVBMtgaBQJwjvuAFodiDrhsbHr6IOWnIvzqsJJqzGjLXUY44rexNSX0T7xdHqnXn4wMGOccwa9D4TantDnUsRlVFNqsux5bNT1SJ8cOujvy4+rqc0l7jKk+vqmEPIo+82rlQD5hHJJc+HRE7UeqTuVtdZzqDSWJFAiAwRpIWhwKi8GGnYfs/J+xUOjb4WY2lvHOkjF1hqyKsbWrFeq76yRoX3r3SnvaP7eTkX7TtiZRQCoNuepqsxaHogP0Xkd3blLiWLxKSDWNBjGayY41GgMamfdN2obO1kypsRxJBLoH4MG5eHtFHefV+ifFCzQRL8sK4XfnM3cMreCJ1SZmvy2tHO6nxGOPdbPtybg2XZc/l6p4ile71tiMy3++fZdsHQSF72o3tP517uR+/qBKywp837vlr2baIBfPdzP1ZO/ftGS6HAKGZIg+il6Pp4k3ou+G6V4wYW9+pDIUoPo9ct2+b5qxS/j6qIINqYOHuHDl6A4FgH2Qh3EhOuJAf9tu03lejgTp9kS820KTnPiyH1fg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(396003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(38100700002)(2616005)(53546011)(6512007)(6506007)(83380400001)(31686004)(26005)(6486002)(966005)(478600001)(66899024)(66946007)(54906003)(66476007)(66556008)(316002)(6916009)(36756003)(41300700001)(8676002)(4326008)(8936002)(2906002)(86362001)(31696002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dndXQk9mcDB0MkhtdHU5akIrZkZYSGg1YTMxSDFrYjFjbVhVbGRUWUdZa3BJ?=
 =?utf-8?B?YU9VNytGVldzMS9UUitTdlZmM1o5cEw4dWw1WitYQjBHb2RhOC9kRWZvdnRN?=
 =?utf-8?B?b1hvK3RZNTlHSVBZbEpTZExaanFMNU11Z1NoVEJnSUVMTzM1dkk5NXF6TEc2?=
 =?utf-8?B?b1dZbnVKL2xHZ003WkhldE1wQmZwQVpNazBrOWVXVEpaZm5yVDhOeGFQUXR4?=
 =?utf-8?B?SkNTSE9Lc015NU9MT2NjbVIyRjM0UWMvdWp3ZWpnY0IyaFF4MXhnb0ZMOHlr?=
 =?utf-8?B?Q1VsTitSTHpTeE1mYkxGaHhvSTl0N3E2L3h0QXlRdWE4bndWUHg2ODFLVzVE?=
 =?utf-8?B?YnNKMmZLRFo2akxzNnhEelJJVzl2Qnh2ZEdIVDA3emI2emlSc3BOcGJUSG10?=
 =?utf-8?B?aTloWFdyNVk3ZlZHUzZ3ZElFL3lQZE5YZGlydnloS3VmWXlna09RYURNZXlC?=
 =?utf-8?B?R2V5V0NXWCtMNVgvVVAySjhZOWtOUmd2T0hJV1M1ZUJOSkZERmN4QnZiTjMz?=
 =?utf-8?B?S0NlNXdxbFJJQ3d5OFVLWGsrSlE5c1VJY290N2VCdnpySjc1Q0lnQzVvZWhi?=
 =?utf-8?B?WW1zeFlQMVJqaW9zQVcyb3F4VHpEa2dxbXdGQmVlK0VxYjMzcVk0SUFsRWZC?=
 =?utf-8?B?dUltSW44SVM2bUQvOHZQMzJJMURZbWEyY2VQaGJ2WkpUMjZ6Mkk5ZVR6RWJQ?=
 =?utf-8?B?WHJIZGhibE53VW1DU0RrbVp6QjRZem92ZHRzeEpXUnI4UWJXZk5NN044Qmtp?=
 =?utf-8?B?Zlo4Z09hTEIvQnAydTM3WTBjU1ptRXJjY3RkNmswUUt4TFJKb1ZLVHRSeTNN?=
 =?utf-8?B?QVJoVDdiV3JGc0x3WGpWZzVUQk9PN0I1YWpRUjRKNDNHVEw2aituRi9MNk5Z?=
 =?utf-8?B?TlI3SDM1eGtROFhEUllTNmJFbXc3Sys5WU0zOVN5cjZ4RkdNUW9oUy9PeDBN?=
 =?utf-8?B?ajJBMmVuc2hTUld5KzhWSWRzRFZJY0U5UmRkK1ZFa1BraVg1WGk0SG1oNFl6?=
 =?utf-8?B?c01xWVpLUk9Fd0s3cTRvU3RLUEFoTVZBRHBEMDdteStWYzF5ck9WTS9DdVBo?=
 =?utf-8?B?a1BwZ0twVVVDK2Y3Zm9rZ1ZzeWUzdEtlUDZJSW1ad2g1N2JNaVZmamdIK3hF?=
 =?utf-8?B?aGVta3FwSVFLd1htSXV5cFk4aCtUS0dFSzJzUzNqNUp6RVYvSzZScEx0WXhY?=
 =?utf-8?B?MWRVUmtLS2lncGNMMEZZSkVwTkMySHB1T210b1lsblZOejdwSndWMFlRdVpH?=
 =?utf-8?B?R01VakVXTm82WllRaGlrWG1aQkV1V01mNnNLSE1ESGJqeTBVZ2JEa1ZiaTJQ?=
 =?utf-8?B?a0NPUXJFVVZ2aFpDT3VRcGlBU21NK00yd1BpeUdqcmNSQ1RPZ09hdGxCWVFX?=
 =?utf-8?B?Y204UUltekRsRFo4VjJmQ1E0RklTd2JRV2xSVU9lb0F5ajRCVVZqZXhCVHNX?=
 =?utf-8?B?NUZuUVEvT2tUMzJzaFdLNmk1eFRSdWpIYVhBZVNGcFBlVHFGclpWUU5DcFBP?=
 =?utf-8?B?SkJCSDJ4REd5Vkx1OVJ1MlVEQW51d2NlVVN0aDg2NzNTY080YWQyS0orVFBE?=
 =?utf-8?B?bDUrVWlMK3VnTkM5eEhNSlpyNGEzR0RzbEZUZUwxV3B4Mno1MFR5UTVkUXAx?=
 =?utf-8?B?Ri80YzZZWFpIT2FiQXdETEZLa1pmUWl4YWZPWHZTa2hQbUNRMjRsWmVvZ3VG?=
 =?utf-8?B?OEY4dW5OM3pKY1BqeWZjV1pETlFwN1lKYXBIKzNnM3JLMjNncWsvQnNLRVJF?=
 =?utf-8?B?UEZzNVR4OWxKcSt1em5yaks4cEhaSjVBNjVmUXQvQkR4NC9XV3hFcDRmNW1U?=
 =?utf-8?B?RmREU0hMdEtwUDd2alFDZHF3elEzUklTUThGQkliMXdKemoxczZsTnlZSnJk?=
 =?utf-8?B?Q2FZM3JGWUlTVmpWTXpPSCtyVlZsa0EzUDZKV0xOU0g4SFNab1Jyc2grMWpx?=
 =?utf-8?B?dVBSWWJaNVdkNlpCZHZaUXpTZ29uWmpaSFVOVlZQZzhPRkFFbWJQNlJXRVdS?=
 =?utf-8?B?alB4TW4reXcxQ1FCeWNWaHhXQjhTOHJwd2pmVVZNditoR2NUUTVnVUdsSGVl?=
 =?utf-8?B?Szg2WjNQamV2NVR3T0Vkbmx2bmRYU0pCVGZKOTN2Sit4eWdGczJaMzl4MHRt?=
 =?utf-8?Q?rPYGKITCH8eHeZzy8QLnT2r05?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef6007e-fedd-4b3a-e533-08dbe41c0f63
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 07:42:17.2614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eb16bdrhsZNE9nq2yzXq8NNXInDygqKdJRDh7gXeNlKeNfKSBHw9YdPbdAs6YyBDjp1lByk7RVu3Kyq5p6bLBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9258

On 10.11.2023 23:13, Andrew Cooper wrote:
> On 09/11/2023 11:59 pm, Stefano Stabellini wrote:
>> On Thu, 9 Nov 2023, Jan Beulich wrote:
>>> On 08.11.2023 15:37, Andrew Cooper wrote:
>>>> These 3 Kconfig docs were imported from Linux erroneously.  They are
>>>> GPL-2.0-only in Linux, but have no SPDX tag and were placed in such a way to
>>>> be included by the blanket statement saying that all RST files are CC-BY-4.0.
>>>>
>>>> We should not be carrying a shadow copy of these docs.  They aren't even wired
>>>> into our Sphinx docs, and anyone wanting to refer to Kconfig docs is going to
>>>> look at the Linux docs anyway.  These, and more docs can be found at:
>>>>
>>>>   https://www.kernel.org/doc/html/latest/kbuild/
>>>>
>>>> which also have corrections vs the snapshot we took.
>>> Imo this reference ...
>>>
>>>> Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: George Dunlap <George.Dunlap@citrix.com>
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: Wei Liu <wl@xen.org>
>>>> CC: Julien Grall <julien@xen.org>
>>>> CC: Henry Wang <Henry.Wang@arm.com>
>>>> ---
>>>>  docs/misc/kconfig-language.rst       | 701 ---------------------------
>>>>  docs/misc/kconfig-macro-language.rst | 247 ----------
>>>>  docs/misc/kconfig.rst                | 304 ------------
>>>>  3 files changed, 1252 deletions(-)
>>>>  delete mode 100644 docs/misc/kconfig-language.rst
>>>>  delete mode 100644 docs/misc/kconfig-macro-language.rst
>>>>  delete mode 100644 docs/misc/kconfig.rst
>>> ... wants putting into, say, the last of these three files you delete, as
>>> a replacement. I can't spot any other place where we would have such a
>>> reference.
>>>
>>> One problem I see with deleting our shadow copy is that by referring to
>>> Linux'es doc, the wrong impression may arise that whatever new features
>>> they invent we also support. Thoughts? (If nothing else, I'd expect this
>>> aspect to be mentioned / justified in the description.)
>> I think the ideal solution would be to replace the shadow copies with a
>> link to the Linux docs of a specific Linux tag (v5.4), instead of
>> generic Linux master. I am not sure where to place the links though.
> 
> I don't personally think we need to keep any other reference around. 
> They're not interesting, because they're not going to be found by anyone
> except those who already know they're there, and won't need to refer to
> them for the kind of content they provide.
> 
> Kconfig isn't a fast-moving target, and there's nothing new in Linux vs
> what we've got here.  The only interesting difference between us and
> Linux is the fact we don't use modules, and we didn't even strip that
> out of the shadow copy.
> 
> We do have xen/tools/kconfig/README.source which states where it came from.
> 
> I could be persuaded to add the following hunk.  What we have isn't
> precisely v5.4 anyway - we've got some reasonable differences in the
> makefile side of things.
> 
> ~Andrew
> 
> diff --git a/xen/tools/kconfig/README.source
> b/xen/tools/kconfig/README.source
> index 44631f68e8..ac394106b9 100644
> --- a/xen/tools/kconfig/README.source
> +++ b/xen/tools/kconfig/README.source
> @@ -5,5 +5,7 @@ in this part of the Xen source tree.
>  
>  xen/tools/kconfig
>  -----------------
> -The kconfig directory was originally imported from the linux kernel
> -git tree at kernel/git/torvalds/linux.git, path: scripts/kconfig
> +The kconfig directory was originally imported from the Linux kernel
> +git tree at kernel/git/torvalds/linux.git, path: scripts/kconfig of
> +roughly v5.4.  Linux's documentation can be found at:
> +https://www.kernel.org/doc/html/latest/kbuild/

With that addition:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

