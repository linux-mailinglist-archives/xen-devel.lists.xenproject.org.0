Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0C6573877
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 16:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366642.597602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBd4T-0002a8-No; Wed, 13 Jul 2022 14:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366642.597602; Wed, 13 Jul 2022 14:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBd4T-0002X4-KR; Wed, 13 Jul 2022 14:10:33 +0000
Received: by outflank-mailman (input) for mailman id 366642;
 Wed, 13 Jul 2022 14:10:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBd4R-0002Wx-GB
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 14:10:31 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50042.outbound.protection.outlook.com [40.107.5.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cd2eff7-02b5-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 16:10:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5357.eurprd04.prod.outlook.com (2603:10a6:803:cf::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 14:10:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Wed, 13 Jul 2022
 14:10:26 +0000
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
X-Inumbo-ID: 8cd2eff7-02b5-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5lbu11iq/HA+yG4j1F7vgWiuGmQ1Wgk5zM7sUAoUJiDGTu1EHOic4TmT/L123VkSfiy9c0catGluwXQQUs7K8VD/01Rd6EHTWNjDdeEQVdz1/YODm8aMoUKZIGVMq5NYcudL2KfN2AGO15VOstOwZpxxGhsqahI4B8d/ynmt1jn6fgmb/96OEK5UdGey1uY+MFe5hm1qy0iqD+WjffXS1vVz3sCPiJBzuyhnaPMNz4YKuQ4YFQtKVqrzkdya4Hyg5SuQSgDIDmZUfD16mvi97RZx2wk5TKsXTlXTT++6+alzuXV/WMb9fto23XE74ga1Ig7xuFX1CyDnYqRnXd1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vO51oXF9hvdPBCZcvmnyXvB5mKwtxNhDW77IFfIfZjc=;
 b=GFpVe5ckDsB1Fo7pVl3UdkOvAAAHU1V30nIN+2MDMTidlgiaDvzH+XIarUh3hMxCUbF3ho0MyRUKkRdaDkwd6MsECQslL1GDF5hPjbp9TV8KFfSVut2GRLkJV4gvu849tTNBKUe2e0F69vLwQ3HlBd9/d9ORf3L7R5LeP7q82T17aE6Sze1n2AdbLAvgrb50DCFynFpH/JZHrr/406U3vBpY1ucDOoFmt/xrumXgY8LgMg7DPUJGiEc9RV+4IoJfAZnHjqoCJN0whSJ0UBEKRzEvii4otW94D55iSEe29Q84Til/1v7Lf1E4kqVZPm8HqI9uLxHrTtBmxrPv5O7FDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vO51oXF9hvdPBCZcvmnyXvB5mKwtxNhDW77IFfIfZjc=;
 b=pttEn9R1knFKOIkggF4RurBlTW+AlU/AD9yVXXv/0vvgwMrucKYDK2KaF8aSkO3CIIt9tYTiAtHOJCehmZwvqQC23hegaiAR+P/v/c7JgvsoWvvmk0UuFSatefk9Z9lzufzpbTRb/62b+LfTKVqTCLC/e7pYED73N/MD/IzmtvQQ5pkmxRmGsuNtjZgqzSrQq/9WMoOCGq1ZfDTU7wFj+Hy7ewAS2Dlr7LJ9QaNb7ElCtJMzF8GJezkJvqtAsAFpFhsZZnWdUADhm9Wi1NZ/gwTUCufAaKCQzn9HgRg/g8MmM+DDH7qzpD6aZJ1zMlM8A8avz099R0WiJ9o2EJILUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d12d85d3-627b-2591-9f0b-ccd11b6267a1@suse.com>
Date: Wed, 13 Jul 2022 16:10:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/9] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-4-wei.chen@arm.com>
 <444a540a-bf0f-f743-3b01-b65210b49361@suse.com>
In-Reply-To: <444a540a-bf0f-f743-3b01-b65210b49361@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55530fc1-8796-4c27-abae-08da64d96f3c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5357:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	koMM9rneJTHqQi3zYbbp7VEecAjHfcguhq8HWYNLi/xlFHztTXFykFGZ/euKzNXkzS1Mlcd07VuFCXg9+YE18S+s/aZpYWVjbFl49cQJ+C0dowhGUUWJPOpYbbAzt+ZQWw6+lB36UhqeOxsu/FLUXg/oYs9g7Ewv48xVvkMtJQe3s+Pp9Npif0f72Isth5g2NSt7Dt69BoOTx8djP5x1NiGhOtyCPjk68HUk3pU/gGHV+ZVGKJCsevi+CMU3N9apP5L3I3731h+MASg0d2GP9Jo1u+LFTp4cOxXHWQ9xhlivvFVAvisgtKvnNgXVG+4jDgAEYaf3WNJhyRe286haCkwGainfPImQI5QOlw9y94cfJ5SwZFpmerajHgeZZbvcBmmBB2fL0Gn9pUb6/4MmDddnFVfAQ4DOM/wYEwLCl26KYMZgOia5KagnFnQQh35t+1eFZCxESJ8oTvJFVpxhyBJGBAC0MXbQ04f0vssPzzIROpdy/ngFx1j0yuKL8q2LwB27gYdLAAFc53AmzcwpMTrPJRBL9aR5hAG76N42+UmN2KPAuzknk22BMsB3yL9+zcc4ndHnB5mcFLNji7YHbnn9Hdrg80PSdPE3LEeuFXdhIJ+tVfqjMbkjnN0wOjsf83qp/TYfC8AS76teiuNzJIYcD2h+YIregnY95BfJk8WA10SikUxDs2kj4lRdMRAkHHhIGLJjjtWD6qEFXVF+9YMYf0o04sdrozkj8YEvalB0AxI4D9yzI6CSPJKc2rfC+affYza9XTeYUu3xYeJ78o3HkP5d7qVy2ioyVzuVmT4kNCtwvOmyysAOvjZZBSKUFKRVa9C7HaLE1S/0IIhlY3JFygELwEe3MkZ4yGtkenk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(346002)(396003)(366004)(2616005)(8676002)(4326008)(6506007)(53546011)(66476007)(66556008)(31686004)(36756003)(66946007)(186003)(6512007)(41300700001)(8936002)(5660300002)(316002)(38100700002)(26005)(6486002)(478600001)(31696002)(54906003)(2906002)(6916009)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjNiUktURVJRRDN6YmVtUlY5STZCNmZhNkQxM3hiR0NJbnk0UEVBTE1pcWp3?=
 =?utf-8?B?KzFpbXlBb3pvZ21hbGt3V0svSWR1UzE0bUVxWm4xaHh6UURFME9zRFUyM0Vx?=
 =?utf-8?B?a1UyV2NDTnJ0UnAyM1gzNWt1S3NQbFRBSE95V3h4UmJ3NWdLeTc1SEZRNldt?=
 =?utf-8?B?cGlFVzR4bkF6ZEN2Yk50SWpiMFBjZXFBSVZIUU9EaUo4eU00OE8zaFpCUklL?=
 =?utf-8?B?OWdGaDZXREkySkpJbXRpZGloNmRVR3MzU0tYekdGQS9ETkIrOXlsT3FSdnRU?=
 =?utf-8?B?bWoxZ2NSS1RGMjFwSjBMbVFtTzBqMzJNU1pmRTM1cUJpdkVqY1hQRWg0V0Rk?=
 =?utf-8?B?TUpxMUgrR255WEhpeGFWS08wRDhMTG5mbnpEbm5aMkY0Tnl0R2pMZ2lXa0o1?=
 =?utf-8?B?c3NqcnVwOWk0d1h6Yzh2OUNLQk1RUUhCeGFsWDk2NjFhVW1zOVVKbzNzRmd6?=
 =?utf-8?B?UWE0QVRIc3VVYi9nVFZma0dnTVFzZldKLzF6bmFXTEQxeGUrZXc4cTg0bVFL?=
 =?utf-8?B?QUJWNlNpMjR0blF4S2c5SlZremQ5Mkdwekl2bklEbFRpVTM4Smxnc3grZTBZ?=
 =?utf-8?B?Zng0OVRnaGVyZjQxZ3N5ZXpHNnRDK3RzK045UjVkUzRoN2pGMmZLTFNLY3h6?=
 =?utf-8?B?Zm5lZVZBM1N5M3JpUURGVk5oSkFSVTdMc3BSR0V3RmdNUmoreURIY2wvK3Rz?=
 =?utf-8?B?TWFoNkFIU1B2NWd5Z0RmWENEVmRzNW5rampNS0lKQjNuV1Z5aTFmdjRnaWgz?=
 =?utf-8?B?QU1zaW1hNnhwQXM3eS9GSWlTbjVTUlZBc2YvcEtoUGRBa3l0eEwvTS9PNEtS?=
 =?utf-8?B?aE90dUdVUFFRLzU4ZEJMQ05DODRGVFVMK1NYM3NGYmxZOXlmL25wcE1Vdzcy?=
 =?utf-8?B?RjR5YVU5VWg3U2E2R1M5dS8zVlBUOGZRdS8vMldtdXVkakVsUTJjVXFCWWoy?=
 =?utf-8?B?Z1BBTGMrZHhoYVQ0UllITTJDdTZSdUptbFFINlVuSGdFRVN3WGM1UDduNktI?=
 =?utf-8?B?NDhYN1YweFQyZkhXN0tadjlQZUxVU25memkyallUMThvVFhYemVORDhQaFhN?=
 =?utf-8?B?QTM2WERmZFY3WGZkdVBsekp0bXJWOEliaStTbUQ2dDNZcXdsNUdmUVUydzYr?=
 =?utf-8?B?WUNnR1hUdTJzU1R0dE04L3ZmNGJiYWQ0c0VSaStxcElic2E2aGZuQzhsaCtZ?=
 =?utf-8?B?N2ZWTjdub3lQekdlUWNCZHRLaTB2R0NOZ3hOVkFBbldGYTRHdXBpVldCci9R?=
 =?utf-8?B?WmVGV2dXQUtxczFmT2k4eXRjeFhBQVgzNWQ4Yjl0Q051dmU5T1gxUkRFZ1Fi?=
 =?utf-8?B?d3ptSFM2bkhtSUlhS1dablhnS0QrNDRuT0QvRVluOHZMSFNUZnBaalVkSjc0?=
 =?utf-8?B?SWprK3pGRHl5RGpTNmlzYkQvZW1TWHRqblp3ZHBJbDFsRXNEaXlDQU1tcHZM?=
 =?utf-8?B?b0JIQnZEMTh2MldVaDBVMXZ5VWZaUGZ5ejRQNWVaM3Z1YTRFeTRjOFFPVTRq?=
 =?utf-8?B?czM0cituRWhrdGcrbWRZWUlRY0p1U3FpNVl5QS8zbDR4d1dmVXpDcWE0VHJF?=
 =?utf-8?B?bzc4NEZvcjdrTUc4ZFNEbHhvbHVUekxSSjIvZnRHdEtOMEQvZnRPWHA3TElo?=
 =?utf-8?B?L2g5V2lSeEtRRDd6VXpaUWdOZ05sbmttQklrUUYzU2pxQ3lLMmpYNHcrUTdr?=
 =?utf-8?B?dDZVcnpCaUdWVEZNaS94cjcrZXJlcWNIRndIL01LcWNIUFJHUGFwZzZqQVNI?=
 =?utf-8?B?Ky9NZERoRWVvSk9ZbCtWQk5USFJzVkVJUlB6a2lhTXRVZzZiaEI5VXk5bjcr?=
 =?utf-8?B?bzhjNFQ4RzNlNjBVNzhSSUhRSEY3WEN1bnd4bThaT21janBHZ1QxODZNeVNk?=
 =?utf-8?B?d2R3QVc1VzRjVjB0UHJ3TE1POFpPQURsblNuM25hYVdYTUpZTEU3bE03TU1o?=
 =?utf-8?B?NE9yZzVOUElLM1NSNmEycUJ1dnNXeHVnRElIcDBJY3lBU3I3TURBeDBvK3dY?=
 =?utf-8?B?em1EbUZhcVZNcEVldVRxdXFqbFBJNHEyam9RZmdCN3VPUnQ1S011QU9zb01r?=
 =?utf-8?B?cE9Hd3MxalZPdEZBbjlNcWxvNGhvdDhvb2NFcHM1OTRrVkh4VFZQV3NSMWFD?=
 =?utf-8?Q?SeysYJYWj0K+1rmJ3LIOAm17v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55530fc1-8796-4c27-abae-08da64d96f3c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 14:10:26.5461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +e1TrcupfqkTZbVR4gtWD1jeGCkUqHJpSzMyjtsSiq78TLczDYM+xT6rF8TJJK48Oeno+nzQ3Y2IpZTbi/FU1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5357

On 12.07.2022 15:13, Jan Beulich wrote:
> On 08.07.2022 16:54, Wei Chen wrote:
>> --- /dev/null
>> +++ b/xen/common/numa.c
>> @@ -0,0 +1,439 @@
>> +/*
>> + * Generic VM initialization for NUMA setups.
>> + * Copyright 2002,2003 Andi Kleen, SuSE Labs.
>> + * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
>> + */
>> +
>> +#include <xen/init.h>
>> +#include <xen/keyhandler.h>
>> +#include <xen/mm.h>
>> +#include <xen/nodemask.h>
>> +#include <xen/numa.h>
>> +#include <xen/param.h>
>> +#include <xen/sched.h>
>> +#include <xen/softirq.h>
>> +#include <asm/acpi.h>
> 
> Isn't the goal for the now common code to not be dependent upon ACPI?
> 
>> +struct node_data node_data[MAX_NUMNODES];
>> +
>> +/* Mapping from pdx to node id */
>> +int memnode_shift;
>> +static typeof(*memnodemap) _memnodemap[64];
>> +unsigned long memnodemapsize;
>> +u8 *memnodemap;
> 
> For code moved, please switch to (in this case) uint8_t. I'm on the
> edge of asking to go further and
> - also use __read_mostly for some / all of these,

Actually where possible please prefer __ro_after_init over __read_mostly.
While this isn't properly enabled on Arm yet, it should at least not
cause problems, as the result section is covered by .data.* in the linker
script.

Jan

