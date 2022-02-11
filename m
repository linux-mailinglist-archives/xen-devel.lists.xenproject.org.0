Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710CA4B23B6
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 11:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270329.464579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITVv-0003rO-1m; Fri, 11 Feb 2022 10:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270329.464579; Fri, 11 Feb 2022 10:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITVu-0003og-Te; Fri, 11 Feb 2022 10:50:54 +0000
Received: by outflank-mailman (input) for mailman id 270329;
 Fri, 11 Feb 2022 10:50:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jrYj=S2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nITVt-0003oa-FQ
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 10:50:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b0eeb66-8b28-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 11:50:52 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-29lRvt1EPBOCpJMNNlIOFw-1; Fri, 11 Feb 2022 11:50:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR0402MB3878.eurprd04.prod.outlook.com (2603:10a6:209:16::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 10:50:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Fri, 11 Feb 2022
 10:50:49 +0000
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
X-Inumbo-ID: 7b0eeb66-8b28-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644576652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8BYn4als1Dc2v5D6UFzwcjqbPQqsMn3/f/Bwb1l5V+U=;
	b=MLDsdgZGy2h2MInZjK4DHHy2bW8i7YibtEIaqWT6EF1+7xnBvtiLYjMskVyF9ki2oZ9SEI
	A1Zv/wBgxqM40IjQFZnuLBs62i3x8mOZdDfKNlV/Yxd9wX4gFmbXmY4pyfZr9DRdpjXh7W
	ev9tUaDGmh768mCzR0qIFHYePoP856k=
X-MC-Unique: 29lRvt1EPBOCpJMNNlIOFw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEuFDbeGWLtAaOb9/vHjAnLtEdINFktQmpGVlfJV5zlLe5wHhu5Hk2UBFdriL2L60m5HyJ3ivrnNgnlcXkl4W71nfU3Y0zFsKzp0xu07hF/fywkp9JiPA4ISyI17a3EPC4NENrxmowuax5IlFiHkhf5obZUnXRUjIShIX2G+NNNFnN1eA9xSMXEBE01yfOi4lmZErXISTAlCdrEWobtbsdekllcJ367l1HTnBnP3FOpb8NORPQqdhM+/0AvWWgZhxL2cXuBnMd7Vy6hRbRo+Ab0QtadMiFAg/j7q1oHKPAoYWdy4V5qYow9j5/F/t+SPR7Y8v2tEvGqJTUi6TjkYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMokT7ZxKOF7IoLPmv848YKFSrrZom3MZndFvDTZ0aU=;
 b=dir/JVqrTY4fcVPTmPOtI4SNiaeuQnlh5namd64eOL17ybteUTFWHGWN96lV2fEFjTSI/7sEJjVlvANDMcatyXFLC0NrNU2ADR8SbihSweO/RSaMKJ1ELuNDyD5uRB4yDn4tStObWTVr2jWbDtfzshXoc/LbUxZEZujEI6wL5fxTvEwFiJGZk2fvpGQJ5wbDxUm4XyVzcY87f34Et1hg2XXQJL3SNhuACrm4ZCuqudAOBJ/Qqmxp9ogTrYsp21k5bhKpci5nvhpMmeEnIbxRF/qHmZWa53lOVD/DBR15LUC/ch0ljb5290ggcHxWkf/8v3fw6It1zGDWB/c7uPrqyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <717694b1-bcb9-b2cd-3740-71d8431a3058@suse.com>
Date: Fri, 11 Feb 2022 11:50:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH CPU v1] cpuid: initialize cpuinfo with boot_cpu_data
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Norbert Manthey <nmanthey@amazon.de>
References: <20220211072327.1213-1-nmanthey@amazon.de>
 <YgYmKiZaX2vZYgKP@Air-de-Roger>
 <85182aaf-1d3b-981a-1108-8eed79516893@suse.com>
 <YgY+sUOIaW7c3Mq2@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YgY+sUOIaW7c3Mq2@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR03CA0012.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d367e558-463c-41b2-2865-08d9ed4c5d40
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3878:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3878E56D6BD2EBC398828A5FB3309@AM6PR0402MB3878.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lKmi4CGQnEYbcQkQ1O73dzHkG+1EyrXUJFTAlss8CknB/BhyBgBhe6dpYDP2petHhjoMhSHgSTvuWI4s4q4Dr2JRqJKdQaa3PLo6oTbLJkgnyDKsXsG86VrlqDiGOkPvKmm5sh7wv65Lds8nA8uBz6PMuUJ+rWNt7V0xlFAmEw6hhZO5dTZE0yXPCRGohAedMNTjWsPQeNtyGDU4DKKijtX6B5criyNUfkWvP49B6/bw7bYB0ce0Obxj9sCV64Wnd9hZWra2uSyRbfr+CoEPfUkJMKjrehcQhNXjwNCNg4Av7v+BByykA4LF2F6AQ2YFRfETaZY8SWCgfVSNdFQx3gG95Qc8myAhUlWMTMyNxj8Kbv2PPPkm5y21VnhOrEZZ1er4Iv5Vocm6M1DOrSAmkMf85QcJizlKarpqVFtkCmffwga0/sEq3KCaY0Ypf9wzyioPhnRM8bayAl1NNMm8Ajf3YxelC1EZZwZvDEmkDvNSjd3n0zb2yK7RPns4FfMj7/YxBXAvOuGDVB0GQhID9bJcOEayXAZ/M++4iWciTA6xMW246LdNQaGgj1n+uQVBJRiobSPGWrGqwOGXUb/TWbGPPtBraiP+nX4mhVoTDYStNc3glPG5wMU/E/FzdJbg/yYq4hY/9JBAwIrp0X9V6NpFqxJcH34q1f39/slKbh3aNW906n2rx7kSlh+mvE1TyDfuPivR0Pyruo5JcvaX6jZ/CwqDviaqGTP1Eg4mhHGKdLmYKAyWBwPfsuWTwW8y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(53546011)(6486002)(2616005)(26005)(186003)(36756003)(86362001)(31686004)(508600001)(316002)(66476007)(8936002)(31696002)(66946007)(8676002)(4326008)(54906003)(6916009)(66556008)(6512007)(6506007)(2906002)(5660300002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d5TAwTm1cUVm7oYcZv+tSCxlb/ElxIb5I6KRC3M//h9SS1oIKSEDdDuCST0r?=
 =?us-ascii?Q?XNkrigapBby7hdY35rPWS3lmrTuCrY6XVCUcCj9Zrc2YcYrj72AqWroyf+en?=
 =?us-ascii?Q?XXSaSmn83vMAFE+xFBMKlEz9DLx9e4UlkYJRY27vV/ThmnxEYjUOrd8ukr0e?=
 =?us-ascii?Q?Nf8pZkBPFwic77hXbE16T9Po/uzdqPeCcwDLb/Svlcyf71Lr5+XIYtH9kQ7n?=
 =?us-ascii?Q?7qoZNd+YOOTcDV7lqNQHUpOh5hMXjS/ynDJEaNQ7h0j4VGOi6MrYZf8sNt2b?=
 =?us-ascii?Q?7YolkAugweP0bo/yrqo62nDrmLXZ38DKc27APHu+s9r04LF8CajnRXI3VEqH?=
 =?us-ascii?Q?IE/kN07n4v1w8zEseBFu000KcewNvKCcf7N7xJEGJxSyLjk0kZY3eh+o3GNw?=
 =?us-ascii?Q?BBAbpLmEBVHajsSr6gybOTSgwl4DjaBrZ5Ig4MPIFO6Nl5LIMTIRBBMWX0n/?=
 =?us-ascii?Q?z15t8D/zGqHC5J0qLR5t83RwARRR8I3fczCVg1smdXzMH+Q6/GhRQEJtJngO?=
 =?us-ascii?Q?VCLOXaVRhcCGpUpk0zPS0zb+RIelhjBbYAS0foyWu7v9oQJ23eQWFSr/qWv1?=
 =?us-ascii?Q?Bm1TaCPUsH6svkOaN+22hcPmTLp+ApabpJCHzcdiHm3cAW/P5wBOpN+0u5m4?=
 =?us-ascii?Q?2a7R7yHgUZ5EqlyrgLnr8Hb0BHsjTapKSom9ZJTOn6OItIB8G0qfQfkrfX/f?=
 =?us-ascii?Q?mNje+W5iCqJq47jT+53eBO73s0E7O7wQTA0kDTJKODo/oTyf5mDwPn0eWYK3?=
 =?us-ascii?Q?N/WjSfpg5BAyAQ5RRd2RiZky5i/OxaZJvcER1BjNgnqWLb11/mNAphLuPU7G?=
 =?us-ascii?Q?4JJYdr7cP8Q5LuL7oYgbAV9UQ2Z9r35Iu36t9phN2LRHGnCn0r9VHrItZiiW?=
 =?us-ascii?Q?hEEpNX3XCPMq44x1L/2FdMvMVwLr+i2XyaHYLshAy/MjnQsJoWnquMX9JLw/?=
 =?us-ascii?Q?CpTlUrh4WWIk3EzRfKlV0cwz+JtITO6KFkocXjPGbRpQf2A5ORvqO159jplO?=
 =?us-ascii?Q?ko7JYCtaikMtAByMTgEoKeZC1LVZXjQC+pTr4X6zDweWQ3/EIuDJKCkE56Tn?=
 =?us-ascii?Q?fJrqHFVG0yFQO+bJ3q4ZlUf+NkBHbJ9IWtlvjzPq/OhJekN1yma9IFfthp7E?=
 =?us-ascii?Q?LQzwHoOAdhMxmgloF2/xQ2fbraH07It65Vg5WFbfnsCuzbV5K/QNMNlousFx?=
 =?us-ascii?Q?KuzEzl71N+eahN6OhdzB7eoR3adY5Oqpk9mt5/bhgZ55cXDeGS66se/AHAe5?=
 =?us-ascii?Q?UPLV6QLKzIHw5kgpnkP0OZjk15aWv30hEqVxpCwZj8rnS9yWoBsNw8FsM6NG?=
 =?us-ascii?Q?yTaWjAoJyf54jwuXmOmrjl9QK2zAXj4NIJXdYkrbFBvgfAjRBEdr8dVSIq7X?=
 =?us-ascii?Q?lfvUXbvNQjL443ipBtR7y/7noOjwmnI1h2fPAuv06xY1aNupeNCopdkF7sDq?=
 =?us-ascii?Q?ev4hyWnIoQS3qRfhmJO0ppu1Xn5hsIInA1jsDBFMyc3mSRdnLNCggdc3SV/T?=
 =?us-ascii?Q?Ype9p9FipIWgBkJXIV8uc99oi+q5YHeeOVPVo2/bHaqyIYmnytD8mItWlQQI?=
 =?us-ascii?Q?ZWsZ1yLlLbJUFxKRAVuIuOH0SQ5ibfaTuQXcFPOFM+G/XIImiKspuYndR+1N?=
 =?us-ascii?Q?+KIoRjW7/Pl6ij+r2cx/lFc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d367e558-463c-41b2-2865-08d9ed4c5d40
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 10:50:48.8668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rj3mJLQfdPsBPLasG3B6ySvgupNDiFNfw0t17ZouSYcQ/tN5+7OmbA9SZf9UUx1CrQR+/lAAwK54sMiES8MCvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3878

On 11.02.2022 11:47, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 11, 2022 at 11:32:45AM +0100, Jan Beulich wrote:
>> On 11.02.2022 10:02, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Feb 11, 2022 at 08:23:27AM +0100, Norbert Manthey wrote:
>>>> When re-identifying CPU data, we might use uninitialized data when
>>>> checking for the cache line property to adapt the cache
>>>> alignment. The data that depends on this uninitialized read is
>>>> currently not forwarded.
>>>>
>>>> To avoid problems in the future, initialize the data cpuinfo
>>>> structure before re-identifying the CPU again.
>>>>
>>>> The trace to hit the uninitialized read reported by Coverity is:
>>>>
>>>> bool recheck_cpu_features(unsigned int cpu)
>>>> ...
>>>>     struct cpuinfo_x86 c;
>>>>     ...
>>>>     identify_cpu(&c);
>>>>
>>>> void identify_cpu(struct cpuinfo_x86 *c)
>>>> ...
>>>>     generic_identify(c)
>>>>
>>>> static void generic_identify(struct cpuinfo_x86 *c)
>>>> ...
>>>
>>> Would it be more appropriate for generic_identify to also set
>>> x86_cache_alignment like it's done in early_cpu_init?
>>>
>>> generic_identify already re-fetches a bunch of stuff that's also
>>> set by early_cpu_init for the BSP.
>>
>> This would be an option, but how sure are you that there isn't
>> (going to be) another field with similar properties? We better
>> wouldn't require _everything_ to be re-filled in generic_identify().
>=20
> So you think generic_identify should call into early_cpu_init, or even
> split the cpuinfo_x86 filling done in early_cpu_init into a non-init
> function that could be called by both generic_identify and
> early_cpu_init?

No, I think it is quite fine for this to be a two-step process. In
fact I was hoping to eliminate some of the remaining redundancy
where possible. recheck_cpu_features(), after all, cares about just
the feature flags, so doesn't require things like cache line
alignment to be filled in.

Jan


