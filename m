Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D040545E6C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 10:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345933.571620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzZpx-00060U-AW; Fri, 10 Jun 2022 08:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345933.571620; Fri, 10 Jun 2022 08:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzZpx-0005xp-6u; Fri, 10 Jun 2022 08:17:45 +0000
Received: by outflank-mailman (input) for mailman id 345933;
 Fri, 10 Jun 2022 08:17:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LSau=WR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzZpw-0005xj-4D
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 08:17:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cba9d665-e895-11ec-8179-c7c2a468b362;
 Fri, 10 Jun 2022 10:17:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5471.eurprd04.prod.outlook.com (2603:10a6:803:d0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 08:17:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 08:17:40 +0000
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
X-Inumbo-ID: cba9d665-e895-11ec-8179-c7c2a468b362
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7pYIyrGUSBe2WS/TwnhAp5z/nX/BP+YNvTM28mtaYCYLnl6SjiwtfIqEeCX1WIFt9pA1azXFm+xhsvbVyOw3xD2coLaf9rZuqkiGNH9BPtKJKLVi4KE8E4NvnEMiWnnAJeQt4wQTCZa+CoqA17mj0b53PaPTEMtUz872g3RQzGVXU+hHYZDOWIYqEVd2DcH5tPZyGRCKZ5Efjz1Y80+iNpOAvh5NUZBCovWAT2bBvUpZW4WI99yKwfFrBujSHJkoBJs7ny3sqpTEihIKm6G92MuavItcu4NtsXMFdISQzezq8xKsZ/vX1M/IkafUKzkGFuNjlIJlJYOfWQ3VN5yJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWs5CcmZE/ScatItp1kjPlVfsqlRjmbQZrNRltuxlfY=;
 b=hph0N8V5Ulk0EwcNsH5boRws3lljvm1uikCWhbhcKxCdBLbd2iJiMXG/JKacQDI15w3RA8nxUu2WVtQioesEipv2QbzcSeJlmxCGsQS2btP3qC9Bks5kAxDLmm/iHh2iQLsMcxvdLzCqfzqDPh9DWvYMPXte31Hb9RuMGA7P6yINl/myV5XfvWOKOohdJHmopcZeR0jTyrEbqnml1v3ozGFQ7jJA8dRXe77bLxuVh0Vqi4uAnksEGkU9EApGZS3oqNYqryMjgxP2bx4/pSHqbEMDBCwXER+5UEqQ9s/wtKH1OoukCJkt3O+vVytiMVHh/2WhTlr4EC/msnI0/TtxGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWs5CcmZE/ScatItp1kjPlVfsqlRjmbQZrNRltuxlfY=;
 b=cMgndodEYN4qi/7SJghhJr5TIlGWmLBwMuwCbGtlKy32z2t2AYPZUzJRCEDvt5QxYcff6H5j0Pv1ORh6wA8+onL596wA4aSVljJqywTSzahIcMg8uKyelhK3LRrMzM0X53BkemoDfp9QlbTALHRY0HK5Jez0FPO/MXAW2jk9NPy6lbErCLzhUXg9Rv3CSjjkv8wEZxnFa65sRO9GV1N3DZShtaly1bp+nvwjQV5W9fY4k0xs4UTitKhi3DSDfWribRKtV52nyLhbH2MSS5mewlmRitzgaarpxJauSMD1qS+q+5Oy//iJ5Y3CbfC75Cf25zJIOehPdwQHKyHyjrQWYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <661a2177-2352-a33d-3e75-39eacaff1b13@suse.com>
Date: Fri, 10 Jun 2022 10:17:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] x86/mm: account for PGT_pae_xen_l2 in recently added
 assertion
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ee7e7e1f-8d3c-0d8f-24ef-c281b09faa25@suse.com>
 <93283a6c-0a5b-aa73-7632-21cc9b4cae62@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <93283a6c-0a5b-aa73-7632-21cc9b4cae62@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AUXP273CA0073.AREP273.PROD.OUTLOOK.COM
 (2603:1086:200:44::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f2bd925-4f2c-4b5a-8893-08da4ab9af85
X-MS-TrafficTypeDiagnostic: VI1PR04MB5471:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5471E25BB563F23A0061DC63B3A69@VI1PR04MB5471.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tdifKKpr20AFDz934kmqkUNqSk+kbHgU9zwT8XBZxSzuDSMwXcQDaebnM/pDhLEG/k+60fanGobwRPPcsjCc3dhPjrPPqYkcnU5NWnC+654dzAOjQrql2QHDoJjkQ6q6McHD3wRkBDYgNOyEkdj1GZEpHgGVmf7MbFchzWQgePgaKD08jX2QgpaVjlStujWchk0PgvmYcg4h7DbG84fhk2uE5wQ8mVpy/HUJG2/8R4QGH9gr5XzvjbhylRZMAMHe6Usle5PPgJtxbFeNFmBsKcIi5tVSVSgXpSX0ZkCUw9A6PrWJNj9ylIVsbsNSKDdRD1kU5cPWVVWxnDHEDXFN3hXk0lFQV+jAOxksJhUeGtQkxIHQbmkVZBE68wVyktGVF5I+2LNr8IcZyjIaieL96/mkysqslmbqOfM0xzEI5g4WhEjMpHQ55mXkfXVQJ8D23atnuyj07ZDWDX5LEms/ppiKBzmJpN2LTCul9SWitHUyd9GWqhcALWVprBgQMp45rQ9LP9UceenltYyNqiCRsey1vI3kL2a/n83PWHuJBXqBAvzkeyCyWkPUaXOH7wJxEhC/84VgS+77PyPpXAAUXsfD73tmCzwhDVe5I8uDvok4BIBcGIRxpKjS74mMzVAiUF47YIWXhmC/xuABBD3T9s5NlglOb82Vr6+jbiYh7oWXBxhMOL5K8jvkflGZx6Mh29NT1yCstOZpinMU4XInKH8up18I69NyROvJ3AmUjr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6916009)(66556008)(6666004)(4326008)(8676002)(31686004)(66476007)(316002)(86362001)(508600001)(5660300002)(6506007)(53546011)(6486002)(66946007)(2906002)(26005)(6512007)(31696002)(36756003)(38100700002)(2616005)(186003)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3ZQZExKd1FjL3lpUTMxYjVJOXZwSkE3ZkRNcFVPWFl2UmZXOUp5MlpvL0g1?=
 =?utf-8?B?NEVVNzZoYzYxTnNvNm5wdVVMWi9OVUdVa0xzWHl0dXV1TFZpV0xRb3BlSU0v?=
 =?utf-8?B?Mk1tR1RVZnVCaXcyNW00TWtUZFJnYzJxQlE5SlRDanlCdVRlbjZQaXI4TC9Q?=
 =?utf-8?B?S2prL0VYRUt3QjlVekFFVldhbFJMQkltOThiK3VvQ0xLWml5ZTFDczhPYzJW?=
 =?utf-8?B?NXU5ckpyUkgxWnBWeDg3MkRHbExwZVY4V25FNUIyYWpMTWhjK3gzM2tndHpn?=
 =?utf-8?B?ekRDell0Mk1SUGxqbHBWbDRUendNNkZvOWgrRGcvbTBuNlFCZ1A5V3RqbExa?=
 =?utf-8?B?cDhXVkVpTU5GdzNhVlA0bFhFS2Jsa3pxY0ZubkorR1NtUTZKbEJBWFJxcE5Y?=
 =?utf-8?B?SXViaW5yOGpWKzNiUDdqd1YzZlluS1pEWEFsa2E0M2xCQzBnTjZaQ2M2dFpl?=
 =?utf-8?B?VzVneldxTG5mWlptcXA0V3VOM3AxSmpNcjlxT1dIbkI4ZlBwZDF5dHUzVFcw?=
 =?utf-8?B?ZHJXdUNubGpqK0F2TlFWeGVhdzIvVjJyRGw1L0Flc3JCb29Fem1qWXR6TDlp?=
 =?utf-8?B?MzBFdXc3dkhlTDNkUzY4UTB1ZUJkY3ZLNVdUUTFUREQ0bldCUkNxWVZMTjBq?=
 =?utf-8?B?L01uN0NCZE5TUDZEcmw2bkVXdnVwbkNsOVlvSllrZlJZOVYzM053VzBKMFFP?=
 =?utf-8?B?THdvRFA1RTBDWFVralR2LzRvTkRUQng5SFFqKzdDK0hPYXhCNWFxTU9QTG9R?=
 =?utf-8?B?cmZCdVZHOFR2cG16ZENDWkJFcU85V2liejdaWkJDOW5Wa0lzRjBYSW9TSExl?=
 =?utf-8?B?eCtRSjhDMGFuSVFtaDVUUzd5YVZqUXVGOEtDV2pBaUlEVlQrKzB2NFBPNVYy?=
 =?utf-8?B?YzN3bkc2MWEvZnFxKzhxVFhPUE9XYkYzZGt2NzdnNlZONUFMV3lORHdnMHQr?=
 =?utf-8?B?K2VuNjZpcE1UQWwyQThHOE9iTVJVam1qRUxhckZMOWRCTmxnazVnWVhUOE15?=
 =?utf-8?B?RjZ5ZFBhVGFhZmR6S3l3bjFCd2ZuaWlId0o5MWlZWkpxZ2ZOeVpxaC9abjJr?=
 =?utf-8?B?enhhY0tTRTgyRUplNzJmS21yWHJQeE1SSFRkVjI4d1FaV0FtcjR2MVFuY0cy?=
 =?utf-8?B?YkxUcFdZdnB0cGppNjdqOXJlN0p4SmNUREZYa2JSZnpmZTc2NFRtUExIUFJB?=
 =?utf-8?B?dXBMMkRHU2M2TXpSMi9WYjRVbkJJc3dIdStSNTNYZjU4UEZTRFdjclFvMTFQ?=
 =?utf-8?B?bW81SnlVUzRFU1ZEUkFTMXdEM1FzMEtXU0lMR2luNGxXSmFKODVIWGVudlN2?=
 =?utf-8?B?VUtWREZJeEpIdUNVbExud2hTNTI4L1BMVU1jbzQweERLYis1c1lkUHBKd1Uy?=
 =?utf-8?B?K3R1Si9nVGgvSS9UWTFvVGlNZ05xY2ROdkprcm8ycWdjTEs0YUFHMnVlMlBM?=
 =?utf-8?B?NkozaGo5WUsrQ2hMSnZtbGU0NFVaUTN0Y201WmxFdmhyRWJWVlExaE9KaHpy?=
 =?utf-8?B?bzhVNXVrNUNtblpuWjdNRVNSSHlPaDdHMEhVUnUzZ29KS2ljcktUU2NaU0xF?=
 =?utf-8?B?eE5KaGNlckoxSG5UdXlEVWk4U05vOWhHaTd1NU0rUTNORGhDbk9uZnBwaW9a?=
 =?utf-8?B?a1lidjE5dkNVTHNUWWlQUUkyaERiSHlxVGdYdmxzVUZuaEZWcm5ublpyMTNO?=
 =?utf-8?B?VklyUlErR01KT2ZTalkrdzVDWkxTM29vWVpMeGtucDg5eUNTSjZXdkF5Zysr?=
 =?utf-8?B?S3ZWNGxWQmZxTXBHaDBNMjNyUm0vZFZ1bFQzL0RPRitlVXRLMXdlM2xZVFFJ?=
 =?utf-8?B?Nlh0WEdRZjE4SFZHZmRIbUxBMG1XVFRYa0RxQjFiNzJ2RmRRaUhOLzhvQzNr?=
 =?utf-8?B?NElIMldGdTJxZGxOWnVoNzJCSUI5dUw3ZTY0TDFnT1YzZWF3REkzTlQydXdl?=
 =?utf-8?B?MXhEN28yVjAwdzRQOW5PakxndUFmaGdNZEZqQm1sVzNmdC9IUzYxVjNuZkJZ?=
 =?utf-8?B?MVZOQW9QbzVDZDhaem9qbGFYVmZZT3RLdWJVR25zRkpqTEFyQTdhSyt5MjFh?=
 =?utf-8?B?bGkzQ2hNcCtnQ2NWdTRISVJxT0tjc0l1b2Y3b1pReTVFUlBTRnVJMysyemxt?=
 =?utf-8?B?ZjRaSkpGQ1NnMDdwbnI1MERSNzZUM2t6YVE3Z2pKU2VFWFF3eDE4U3BHVE92?=
 =?utf-8?B?RGdoWE9ZUGRHeW5SS2ZPKzQ2NzA3cWlaSW5ZNjZBajZEY09zMTllcWpqcUR2?=
 =?utf-8?B?NGZuYmhpTFhNeUM3MDg1RzlTZVpyQnJNcnZNN05wTFdkNk5BcWZIQzNSRWRi?=
 =?utf-8?B?ZmdhZnBPU1ZIeGpxa1U3ajhJeC9LQTlsMzJSVm9uSndiNm90ajQrdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2bd925-4f2c-4b5a-8893-08da4ab9af85
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 08:17:40.3015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKQniY2Vn5vbMsnFIg3WN426DTMxzxWLUMi9fYDtFCJc1h/B1zyoXIj0/ZMmvk2T9GnkfGPoy6bFlrQvnAEcLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5471

On 10.06.2022 10:12, Andrew Cooper wrote:
> On 10/06/2022 08:26, Jan Beulich wrote:
>> While PGT_pae_xen_l2 will be zapped once the type refcount of an L2 page
>> reaches zero, it'll be retained as long as the type refcount is non-
>> zero. Hence any checking against the requested type needs to either zap
>> the bit from the type or include it in the used mask.
>>
>> Fixes: 9186e96b199e ("x86/pv: Clean up _get_page_type()")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> pae_xen_l2 being outside of the typemask is deeply confusing to work
> with.  It also renders all of the comments trying to explain the
> structure of this logic wrong.
> 
> I'm a little concerned with type usage in the non-coherent path too. 
> It's safe, but is (along side the IOMMU path) a misleading example to
> surrounding code.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> I can't think of anything better to do in the short term.
> 
>> ---
>> The check around the TLB flush which was moved for XSA-401 also looks to
>> needlessly trigger a flush when "type" has the bit set (while "x"
>> wouldn't). That's no different from original behavior, but still looks
>> inefficient.
> 
> It's not the only inefficiency here.  Still plenty of improvements to be
> had in _get_page_type().

You did say you have some follow-up changes pending. It wasn't clear to
me whether this particular aspect was among them. If not, I can make
a(nother) patch ...

Jan

