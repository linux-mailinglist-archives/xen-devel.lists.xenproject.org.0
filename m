Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029DB4DCBD0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 17:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291697.495302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUtNB-00089I-AP; Thu, 17 Mar 2022 16:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291697.495302; Thu, 17 Mar 2022 16:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUtNB-00086j-7O; Thu, 17 Mar 2022 16:53:13 +0000
Received: by outflank-mailman (input) for mailman id 291697;
 Thu, 17 Mar 2022 16:53:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUtNA-000864-6K
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 16:53:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba9cd483-a612-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 17:53:11 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-gFScMaI-OWa2czg9lcKDXA-1; Thu, 17 Mar 2022 17:53:09 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0401MB2362.eurprd04.prod.outlook.com (2603:10a6:3:22::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.29; Thu, 17 Mar
 2022 16:53:06 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 16:53:06 +0000
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
X-Inumbo-ID: ba9cd483-a612-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647535991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k6R6j81jF9DUjgfiTwR6joBVvQOeR/OOAhQqaUoMJYo=;
	b=KcQkC9PmaJgMkVf6cSffEpT3yW/+VAtEA1P9hZy7NbeKxhoEYCYPzmBzhXVC57NefEnP5j
	eVOua9HXjPFVRi6P/Gi0mzDDB2cZWdBS88PjkX2JC4J7uoyQYbVDzu52ppm5g3Apv5FgaN
	2Su5WZVNPmdD7onyEryxcal10Xx1+/g=
X-MC-Unique: gFScMaI-OWa2czg9lcKDXA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1QKPTa6RT9B9T2KcPb1F/aSo66BaI9H6UwCJ7z47OOnQuACQpEKh5VmPViuagWpmZrXGWVWw2HiB/wyfbPgKdIT4PE7m9fI4JfI1C7oW5X409a2EzvIbeNJr/dcdjQ2Jw2eDy8EQwnXonyGkWRb3jse96inO3N80hZwc9GbOZOjAKSdexlRaWAzhILSn4EwQsPyLwE+LfjVs1zAgYS3pn28ygXcrC9xfYmIKdXUPPt0/iiPKmB+UYtpXtX13FG6kwAFVuGZm4HHWVuGXPHGD7GxxmELdwVck6FhGi2PgQipVnWOhqByLnIJ8wujh7EaKr85YZXpfWaiaG46Tb64mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6R6j81jF9DUjgfiTwR6joBVvQOeR/OOAhQqaUoMJYo=;
 b=TWCcvLqfASc6IasmlShXW0s5EjfNglIdsy9HSdtKgWb+1fWpNguTUrzobt2CVXnHj5JpFrejxhAIvHml79iQV4+alx5kKHk2TOKj6hvKIoO3StaKoJPRitmhy80ZD2NU39lWFmqqJk/18ta9rjSTlOt+/kAoI9IuhsxaHstwqebkXK/H6k6X+bhrK8+pMCrvNoTq/dZ+8uurvetXOWwS79N32v57sS4kS1QHGER9wMtOaiPXsLXS8zLoAu19eSjRITSF9Lhs7sDCKbHXzGB8Qwf1MxTFkL+hkt3UzVP+KNGwHnsf85rECwO14kn2iseMYfiEZXsw4EuCmrt4Ip1GAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <07f6d45d-b23e-9b2c-4475-dcc5d2ca20c9@suse.com>
Date: Thu, 17 Mar 2022 17:53:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 11/11] xen/x86: remove cf_check attribute from
 hypercall handlers
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-12-jgross@suse.com>
 <ac5efb3d-e55b-6717-de7f-78447d29f1b9@suse.com>
In-Reply-To: <ac5efb3d-e55b-6717-de7f-78447d29f1b9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af0fa747-55c5-4eec-538c-08da08369b8e
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2362:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2362B23BFDB1BD61B6BAFBCFB3129@HE1PR0401MB2362.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ezQA4mlw02Y3uCZCkjswJqxccaKDyVbUxvqCmi456eYUiTK4FLl4TQ+15LSnAZpODr6sZGvsJxrgop5SlYZHEMYJM71Lv8hAY8diD9KxX6kNy+TUjlC+a/Bwt1vJxzZ4pAgtS6/Ocv4/bDQzP65zZrToeGcXruWIrUmFSegCuRPpWELrJYVas58wqMAVySQLkYaSQsN0XVqN75ScJDhVyEP0kg5ahDwQvxPZ7xSdh7edNsC4RpNocYMwQY9wTp6mbar0j939hAxhWEUt++xHKXjmofUoXiiRkpuYrMKIgrAZ3KCiyOFQZXeiKJiT8XzgMB2MhvCrCfIApZ7AMzCr+5+mKZpX/qEF/myYM3SqqQ1ZP/XikmDJNvQ27Jrv5RNAnOsKT71iwwrno+Y6+UFhkUMhtTQq8uef4lOqc6xAcdBTVithwJMf1I+bBn32Z6RWT7z74HCCQf9nx5MuddfeD3hScF9vx2LSwNjHK03+YoBmzCcpupj1l/+2YR4PEFAPJo84ERcVVvkAo+mvB+RUDWkx2M5KlgGqoASDQ+tRYoFA3SvJqsq2cc86gVZpxybF+Ttd0JSAGAlsQd6epIG95XHPX3VEY9bjRJ4fYheC1FgLBzlDqKyWkQKAriwyIZ88rtZhC1AWmPwyfNSCLyp/qAqpvqASpW83xl4QVocMVh0BPZlpi9krCEEoC1DAmSEiVZ2+Of/VKfMNxh3/V+7GEOYnh7FqxSb6JwSNuz+NQNOGGuavuEMvlBPS9LbffGl/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66946007)(66556008)(2616005)(38100700002)(186003)(26005)(8676002)(6862004)(4326008)(6512007)(36756003)(31686004)(31696002)(86362001)(7416002)(83380400001)(8936002)(2906002)(508600001)(6486002)(6666004)(5660300002)(54906003)(316002)(6506007)(37006003)(53546011)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2trTVA5dldzeEZjRDV6U1N3U0MvRkRKUnJTQUlEekxxemtMRUYvSWExb1ky?=
 =?utf-8?B?ZzFuajAyS2pHSGtqcWVVZ1ZpVVB4VGpERU1Pc2IvV1EwVWUyeEkvcWZEcjFG?=
 =?utf-8?B?azl5WGZDbmFod3ZBM1lsemNEY2NZYmFOVGpYalE5UEpxK0VLMTkzT2grZmpE?=
 =?utf-8?B?THB2N0N5M0NjeGFoMHZlaFYzZnpFa1hEbGJycm1Ja0IvNFJJTVFBYVZ3TUFa?=
 =?utf-8?B?YXFQeFpBNUk1eDBXcERZU2JubG1UWVp1ZjBtMytQbWVXVnhMeFhYUWRNV2tw?=
 =?utf-8?B?U3hYMTRBYjQwU1J1andqUkk1UjBydStYNlR3SGt0WnZJb0toMm5IUWlNL05h?=
 =?utf-8?B?alVrR1JRc3QrWkgzKzNKVktRd3dLdXptMTZXWmZNbWJrc3RwYlhjeUZjUXI5?=
 =?utf-8?B?ZUkyRzVldXRGMXc4TmN6Y3d2THMxbmJXRWhOTTlnbWxWZnhORXBwMjBVQXJP?=
 =?utf-8?B?VDY4MXNiMFZNYkxRb2lKUEY3alZMdjIza1R3d2hzZHlpdzg1eDNqL1NFT3di?=
 =?utf-8?B?UmxzN3hQMUMvdTVzUFZZL0tnOG9rUjJiTitjZHpBTnJ3L0ZUTFZUdVV6c2Ny?=
 =?utf-8?B?U0ZPbG84QzMweHFnYXNuNEY2TnMrWWtHWmh5R2FOREtJamY4cS96d3FXd2p4?=
 =?utf-8?B?azhRb3E4eHVTY2NTeTZSRFNmdWhOcFJicEtLdld2SStLd3pMcGkyOGxzY28v?=
 =?utf-8?B?ci9GbXdLUG9LaDRjYWhIV2dkNm5hSEVidnNFZFM5aThKcW1PUHc4R1hpdVQv?=
 =?utf-8?B?ZDVrVG5zSnFjVWZBblphSmM3UzRMaDlGRWF1ZE40TUN6emV4K1diMFV3ZjQz?=
 =?utf-8?B?RFZqclB2L0FKWjNIcXRxd1dQekw4QVlYclNEZWc2S2dQeVpvUDdpWFJ0Mnpu?=
 =?utf-8?B?MHM0Zk9WUDdCb0pUcFg4UEdmTkFjSEE1MmdVWm5kSzY1T0dFMmZ4YmNycFhC?=
 =?utf-8?B?RjFGMDc2MjVIbllSK09RZFRQQ2FmRFJoOE9aY2tHMzhjbnZYMW5udXZ4cE1q?=
 =?utf-8?B?QktneVdrdW5zUEZLRmw5OVlPTTZpMWpVZTQrTFJPS2VDN1oxV2lCMUdLOG1R?=
 =?utf-8?B?NHUydGpJUXRCcXdoVjdJcWhHczJ4aVlBYmdXWExQaEJRS2tYYmVvYXBJNlJt?=
 =?utf-8?B?VHhGdDRjb2VkdzA2R08vZ0pCdG5pQ0hVbFFGd1RNVjcvYTlKMmdJQ2RpNzRo?=
 =?utf-8?B?Qm5zNGo0M3p5TnNYRmJlR05Yai9oclRab3VTK2lHY1VoQ3ZheFY1b3VpakRu?=
 =?utf-8?B?Q1M3Mi95SWN4U0h0eUp6M0FYc3BxaG1xR09YdHpTaElmMzVHVnRqM1R6dW4x?=
 =?utf-8?B?YVV0RFRGaTVybkhCcUQzRGREUXdMV2VXYVZrL2lEQS9tbkgvNlorRktQTmJx?=
 =?utf-8?B?aFBrMWR6WWt4OExkcHFXVXlsc0hFOG01emdzNFdnMjFUVDcyTHBXdlhNU2xJ?=
 =?utf-8?B?akVud3VpbEJLTFRBODhaM3lpaDhkeHdzUTkzVDh4ZmJqZDlYeGgreUJhVUdR?=
 =?utf-8?B?MVZhcVJHNTdCaE5pZUY4bGw2R3JSb2IyYmxCUDVaaDVEcXQyVURDRzNsVnRR?=
 =?utf-8?B?WHQ4cGl5ZndYSzJtWldaMnZDbW56SkF6YjV0VERvaHZhL0xxeDNPRFNQZjZ5?=
 =?utf-8?B?bWtxcExNY3BoSHhJTFJlYi9WbG9DekxacmpGMlVsS1pQUzVoTzg4UWZYdURX?=
 =?utf-8?B?S1hCUm1oM3krYnQ0OHZDZXdselZReDg5WkNON2xmd1htR1JTbkFlZjhhd29J?=
 =?utf-8?B?aWV2bm9qUStkTFhnWmxZWEo3TWFpSHM0SUF1bFdUTnVtRUNudHNLQ1RJd0w4?=
 =?utf-8?B?c3RzMUtzR0VZUUFoNjhYNjFoTDhlRk5wTmFDdXFVSy9iRmhoU3NwYUVyRkgr?=
 =?utf-8?B?TTlFZ08xUnBEVXNwZEtURXpWTzlvNjhSZ0ZNTExuNUFMSTRtaUJTZjdKN1pa?=
 =?utf-8?Q?vbhdu2W0ccAkcciYtoRTKqza5q52EfIW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af0fa747-55c5-4eec-538c-08da08369b8e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 16:53:05.9117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45EbAyve3r9u/JeaOEBqY+Lql0V/PwrRAny/9WXg+w0oRJl+BOPGVuv8pF+SAp9ZN3LZJfM+LqqR1QrXZk9lVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2362

On 17.03.2022 17:47, Jan Beulich wrote:
> On 10.03.2022 08:34, Juergen Gross wrote:
>> Now that the hypercall handlers are all being called directly instead
>> through a function vector, the "cf_check" attribute can be removed.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V4:
>> - new patch
>> ---
>>  xen/arch/x86/compat.c               |  6 +++---
>>  xen/arch/x86/cpu/mcheck/mce.c       |  2 +-
>>  xen/arch/x86/cpu/vpmu.c             |  2 +-
>>  xen/arch/x86/domain.c               |  3 +--
>>  xen/arch/x86/hvm/dm.c               |  2 +-
>>  xen/arch/x86/hvm/hvm.c              |  2 +-
>>  xen/arch/x86/hvm/hypercall.c        |  6 +++---
>>  xen/arch/x86/mm.c                   | 12 ++++++------
>>  xen/arch/x86/mm/paging.c            |  2 +-
>>  xen/arch/x86/physdev.c              |  2 +-
>>  xen/arch/x86/platform_hypercall.c   |  2 +-
>>  xen/arch/x86/pv/callback.c          | 16 ++++++++--------
>>  xen/arch/x86/pv/descriptor-tables.c |  8 ++++----
>>  xen/arch/x86/pv/iret.c              |  4 ++--
>>  xen/arch/x86/pv/misc-hypercalls.c   | 10 +++++-----
>>  xen/arch/x86/pv/shim.c              |  4 ++--
>>  xen/arch/x86/x86_64/compat/mm.c     |  2 +-
>>  xen/common/argo.c                   |  4 ++--
>>  xen/common/compat/grant_table.c     |  2 +-
>>  xen/common/compat/kernel.c          |  2 +-
>>  xen/common/compat/memory.c          |  3 +--
>>  xen/common/dm.c                     |  2 +-
>>  xen/common/domain.c                 |  2 +-
>>  xen/common/domctl.c                 |  2 +-
>>  xen/common/event_channel.c          |  2 +-
>>  xen/common/grant_table.c            |  3 +--
>>  xen/common/hypfs.c                  |  2 +-
>>  xen/common/kernel.c                 |  2 +-
>>  xen/common/kexec.c                  |  4 ++--
>>  xen/common/memory.c                 |  2 +-
>>  xen/common/multicall.c              |  3 +--
>>  xen/common/sched/compat.c           |  2 +-
>>  xen/common/sched/core.c             |  4 ++--
>>  xen/common/sysctl.c                 |  2 +-
>>  xen/common/xenoprof.c               |  2 +-
>>  xen/drivers/char/console.c          |  2 +-
>>  xen/scripts/gen_hypercall.awk       |  2 +-
>>  xen/xsm/xsm_core.c                  |  4 ++--
>>  38 files changed, 67 insertions(+), 71 deletions(-)
> 
> But that's only the definitions; for a reason I forget the annotations
> are present also on the declarations (really the "also" applies the
> other way around; perhaps it was that a future gcc will want to warn
> about declaration and definition having gone out of sync).

Actually wait, this was nonsense - the declarations are gone by this
point, and the awk script adjustment is all that's needed.

Acked-by: Jan Beulich <jbeulich@suse.com>


Jan


