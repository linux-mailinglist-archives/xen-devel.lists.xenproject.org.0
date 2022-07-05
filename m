Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A56756703A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 16:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361337.590801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8jCK-0003Te-Uf; Tue, 05 Jul 2022 14:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361337.590801; Tue, 05 Jul 2022 14:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8jCK-0003Qy-RR; Tue, 05 Jul 2022 14:06:40 +0000
Received: by outflank-mailman (input) for mailman id 361337;
 Tue, 05 Jul 2022 14:06:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8jCI-0003Qs-Qu
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 14:06:39 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50053.outbound.protection.outlook.com [40.107.5.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af513314-fc6b-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 16:06:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9078.eurprd04.prod.outlook.com (2603:10a6:20b:445::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 14:06:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 14:06:34 +0000
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
X-Inumbo-ID: af513314-fc6b-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ky0sEi+EeBM5HdjHIIvV4VQnbLro6yRx1dxvZp/rYT6asfF8ZTGQjCJ27abfmXOhPKxbgxAluuQiUjNglxHYQFZ1BA5QFvJGrmCxclgHbdAfdQxnayThf9J0e1/k/Sd51Uu2GFWVpTyMjeYkuh72M78Mh4bi/uAM2jHzwVY0UzhYZtanU2J+mJ49cCcCW/EGSTloEUkZrUEYtK1lcUTO+PuvA0XKvAM7Db78PPnAN1Usvzd8yOh0tf0i5nk3lrLrSENVDPcasnQGVq08nFqBkPAyD0BgcOtYTJ/mp92aIRFzBDw4G6Ud4SjiaV+ayXwnYX08jZVaG+yyVkCKawe60A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bAOa85+pWScZPs8MLVb6ZZmrXViQP9KcG8Mi6dCzpA=;
 b=fs6oW7o/+FSrl/21Eyb9M7lD2SYcyWpCdYoz6TXjteVqhLfpUEoBNMxzSuPPRzBaYa5mNYpNJoYsARw+C9TPTyzYOgo1X52SCKJWP7fooaby++yqvxLYeJQRbgAYON9VZgTGX17VmnmsjyE/3tAxHBvz0JzDWtUrXxWacAmi5HTBsVONuhQqvOYQu92VGlQ1rmr2SRn8uS7GFOuHBw5KFQquThg/r1y2MCsVQhdFqs1ZDZopA/wJ3w4ZJQA8/EQV29McVlgxhas8PNmiGVC5WwPSbok+sKGYEZ26/vyH1YsywkTbPBcnaN1eoz5/FOUAgU9fa4+JNFcSrfkYkPTGOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bAOa85+pWScZPs8MLVb6ZZmrXViQP9KcG8Mi6dCzpA=;
 b=J2Y+XTHpH7Ip5ntE2nRhCAGagnUgHkUTHpBGWQ7L5fmpx/VwjSSM5+n9iQQig0kjVFr3QNe0+w6XAWt/ysxxDuCrxdOlOTiHKLp8HbomxOR7V1tsyMU2/l+d3bFLNsd+EHeQgNCrILcGo/bhCm6vISWW+uiph8yyDBySMXItusVesxYBglZvH6W2oR0ngIYTnh0YaEGB73JB3bJGRaZkj0Joo0Yi2xsaPxNSvXnQQmsnX6ThY+pOYmpGxcQkk4Ieaio8HqByK30ife/IGFip1m97c1HpUxffVEbCyyGfZg5bRUmKEBVn/qUd/wl67lCrWrv4AebtNirM/zObl/JJsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <69615e24-622c-1609-fcff-87e5112d998c@suse.com>
Date: Tue, 5 Jul 2022 16:06:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/6] x86/irq: fix setting irq limits
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220630085439.83193-1-roger.pau@citrix.com>
 <20220630085439.83193-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220630085439.83193-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aabf6ed7-a267-42f7-91e2-08da5e8f919c
X-MS-TrafficTypeDiagnostic: AS8PR04MB9078:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v8237egUnJAal36HED29p2ykv3qtNv0HxyGxWE3Jo0Ntq+53ksU+baknyO9jLXPj8cAQXm3GYf0X74iG3K+dKnAYoi9H+Q5G02gEhhTJ+tqSMEvH9fqiGZ/mOJ66kTOnsAw3f7AIpMKaAYOiPk4MSAeJOD9VkV9BY7vucvUKoW49rFJOM3VGGvbPLhMQ+qbOchfOFiIRpwvK4BWTt4LP3owKXr9jbIi9xojDHvK0lJ4NSJOLo3PrqLBjnV+FP+gUA123rpX/G088u4fHTZgkzmE3v/Qrc1y8CwV9S2o50ZVgJDD0noFYAgin57I1A5d2SAJ/Mgw/FwQbGX4JGvXlWpj1n6CzXQInLsT/+PNZrb6rnE1dZpE3AeIDGPe6tRg/pxGq2E5t9OY7uhoxBVYsxpqrMFXeB134a5FQ+a6Uincb6DqloItnOEUpur4lhVAIeoMWjCBixEF6COYZKhJrnuE+ZcGjBJRuXkKUU3zSpFS3aPJPkvXPKJgFXh/i4kDd8YnviNsYKzQwxMnJXHmGY6QqvNKD1X7RuKNtDsbalbe8Nkn1vIkwiVFM1r/JYYOEXpRTGYaxjKThRSS3k9G6q87hbnJgwrxajQwI/8X/MJhYUj8g18fAea7qtBeXQmFKVdjeddf8lzFAqV8eoDXNBIImWUOKvfhRHAtHv5zkww0xMbx1szgBCqdJp0IACN7M8cj8F+BzCOvcntYouEBqJ/vc8+l7lVvONadH8RwYMXwhfksAlmck3ex6t5H94CE4DrhogDhfa7joXNg76Sg/G69c8d3FUaLTxoVVnx2bN0ggc5Q7BN0Tyvg7HngqO+vyvCKIzIGXXwHl5xvfxVOKxVj6JoJSfAwVp8je9uF81vM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(396003)(136003)(366004)(376002)(6512007)(8936002)(5660300002)(53546011)(6506007)(26005)(66946007)(66556008)(4326008)(66476007)(8676002)(6916009)(54906003)(41300700001)(6486002)(316002)(31696002)(478600001)(86362001)(31686004)(83380400001)(36756003)(186003)(2906002)(2616005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1lnVmpnMzRuN0p6YjQvbHhmZlRTZTYzRkx0cU5ReXJWdys5ZERsQ2JDSE5N?=
 =?utf-8?B?T3dUZm9UQmJ6Q3dtR1ZqelJlcFF2SzJEOXduRlorNlNaUitualh0L1RpZEMv?=
 =?utf-8?B?SGEzbXpjNExEaUE4L3A0S1JscTQ5UDZncFVYQnZtYjlXUHhJNmVuV3E1YWNp?=
 =?utf-8?B?Q1Y0VFQwUUU4NUlzdU5VdzJPQ2xIeW80ZjhDTW0zWHFITE9tMHorN2dybVZl?=
 =?utf-8?B?Qk9BNDhzR0twUFMwNitOanNqQXRmaU9IVmlNRGhMRTZvdjZJQThSdVIyeUw1?=
 =?utf-8?B?ZnludVlmS2pENklRZENRWWlNdkYrQ3JLMGNSc0Z6UVpUUWRJZzlIN2Jmcktr?=
 =?utf-8?B?ZlR1YUthY3pXR3R6U3FvNDgzT0daRDRia0ptc2p3MHp0YTVNVnh3dS9JVjYy?=
 =?utf-8?B?OGE2cmVvcUlub21tZkh6WndBVlhTR0d6K1k5QzhpcXBmVVN1UDNrbys5Y0k3?=
 =?utf-8?B?SXUyK1hvYjJyS2pqYW9NL2dlNFQ4c0ZlRTBmT09aK3M3UGhudmNCQ1dMVlBq?=
 =?utf-8?B?ZS81OW5hYldzeWJrMDNGVW9hSXBRZStvU2VYRThvRjNVaU5OeGpiRDVNeHNa?=
 =?utf-8?B?SEtpSVlveFlCZnVZWXp0YVRMdGpvUmEwVVVEZDhETitBcXlCTTUydEwvNjJ0?=
 =?utf-8?B?aXpwZkc3VWZ4UFE1SEVnWjI4clZRUGZmZCsvb0txWUJnTFJKN2ZaSTlDNUdY?=
 =?utf-8?B?QkhSVmxycGZLNlQ4U0JERlZtKzl6R21VZWIxcjYvTml0SEpUQXVPb2JtNXVN?=
 =?utf-8?B?MytLcEN5cjdIbFpLSkF3Rjg5SFU4TGxyejZRLytjQTRCak1XZ1lzMzlsWmxF?=
 =?utf-8?B?eTdvNzBlbHNMQ0pOY252K3hHRWdVWXJkQlBaNDRiT3RVTysybmlJdGwwZUdj?=
 =?utf-8?B?bDhZYXZYZ2Q4OGhoUXg2aEsvUEFsSEdScUQyZVJjUDJ1c25HeGpLcFNTRWNs?=
 =?utf-8?B?MFF0TTlzTHdwYlFicGNGdHlvMTR1YjNEUXNobnpDM0dyVmpCSnFGdmFhYitS?=
 =?utf-8?B?bGV3cDVlWGR5Rm16eFNjWnFvdHVFZWdWL2dFR1hldkRkYUNTdkxIeFY0MGhj?=
 =?utf-8?B?a2ZCVlp0c2lCLzdxK25XWnUxM3Rld0ZOQlVVc1c5YnpubXNTNDdNcnYzdEEv?=
 =?utf-8?B?cnU4UGFVVktGZTRWaGNKaitkdHoxNnhSZmEwNzB3RjVEVC83UXowSndGWXpF?=
 =?utf-8?B?cDhtV0prSzBRd0Q4Z1VCWFZkWEJ3Um9RYkI0K0JjMm1NTDkyUHZ1cjV1UVJY?=
 =?utf-8?B?SndNN2RQdzg3Ukh5SnVSbkx2d0QvZThsbFlSblJlZnJUdEQ1RGpadm9BOWtG?=
 =?utf-8?B?cTF3Y280S1pDMnRqTU9kZUJ0cHFWbXU1YzZrSGhCaUJ3RTBrVkROV0pLTXNw?=
 =?utf-8?B?SWhCZmJuUUtEWkxuc3lOT1Jrc3ZoQjEyMVFuSWlsOUJxZDlVRnFtdU55UVd3?=
 =?utf-8?B?Tis3ejhLTWMvWDhyNHhtUjVJNWpheFZjN0c4VysxZGVrR1UvT1JRb3FEVDJ6?=
 =?utf-8?B?SVdZZ3JsYzhTRHkydEVWamRWdU5BZUNGSkxrejMvY0x0bU1XbUlheUtEV2lQ?=
 =?utf-8?B?WWc4V3RiYjh3Z0lGOEc4cmV1Q29ObzByb0xSSUtWMEtPNXNPanBIb1dEL3Fx?=
 =?utf-8?B?eFpleDBDNUF4dUpWUzN5SHNsd2VzRDZiRVpPYVVicnBpUmpLSGpIOVpvZTIx?=
 =?utf-8?B?VFNMVVAyVG4zdCtJaXZraTlBYm91bkNkazhOandWTFVHb21QR244SVNlUHh3?=
 =?utf-8?B?M1lRNjF3MTZETUs3OFV1TExCb1NyaXdNanEwMXlCWHdyS1Y4eUhlRHdlekFI?=
 =?utf-8?B?aGx0eU02b1Y2YkhaNTZnU3ZHQUlCRGk0UVFFN0dsaXk0UzVrWkt6RTB0YWt1?=
 =?utf-8?B?KzhJN1cyMTNqQm9QbWF0Yys3clkvd0p6S0x5a0p2UFZBZ0ZwaVJyekNTSE9j?=
 =?utf-8?B?cVBDem9RT3I5VFZHclp4RmdHMG5SUVBRakdJclYreTFoZVMxUGErc1p2Tzlk?=
 =?utf-8?B?dmMvNnc4SzhMeUlqa0NUVTduUzJOUGVYT2dQT1RTRFJwSStBTDRiSnBGNFJq?=
 =?utf-8?B?WjFIaGIxTlJ3blUxYzhRYkJhM2lZeThXK25GZlNHSHcwZmlPYVNsVjMxUFRV?=
 =?utf-8?Q?zE/mmj4Ifiij8D2szDibmX7fH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aabf6ed7-a267-42f7-91e2-08da5e8f919c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 14:06:34.3575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNDdUZGxtyq0M6N0olzkfN8pBXg/HJ7CzaRM6xmrTlNxE1LX4RYo0ruRYWjH7TTfWzEjxt9qbUUELS0A0ifeeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9078

On 30.06.2022 10:54, Roger Pau Monne wrote:
> Current code to calculate nr_irqs assumes the APIC destination mode to
> be physical, so all vectors on each possible CPU is available for use
> by a different interrupt source. This is not true when using Logical
> (Cluster) destination mode, where CPUs in the same cluster share the
> vector space.
> 
> Fix by calculating the maximum Cluster ID and use it to derive the
> number of clusters in the system. Note the code assumes Cluster IDs to
> be contiguous, or else we will set nr_irqs to a number higher than the
> real amount of vectors (still not fatal).

While not fatal, it could be (pretty) wasteful. Iirc discontiguous
cluster numbers aren't unusual. It shouldn't be that difficult to
actually count clusters.

> The number of clusters is then used instead of the number of present
> CPUs when calculating the value of nr_irqs.

This takes care of x2APIC clustered mode, but leaves xAPIC flat mode
still as broken as before. vec_spaces should be 1 in that case,
shouldn't it?

> --- a/xen/arch/x86/include/asm/apic.h
> +++ b/xen/arch/x86/include/asm/apic.h
> @@ -27,6 +27,8 @@ enum apic_mode {
>  extern bool iommu_x2apic_enabled;
>  extern u8 apic_verbosity;
>  extern bool directed_eoi_enabled;
> +extern uint16_t x2apic_max_cluster_id;

I don't see a need to use a fixed width type here; unsigned int will
be quite fine afaict (and be in line with ./CODING_STYLE). Or if you
want to save space, then it still would better be "unsigned short".

> @@ -199,6 +201,9 @@ static int MP_processor_info_x(struct mpc_config_processor *m,
>  		def_to_bigsmp = true;
>  	}
>  
> +	x2apic_max_cluster_id = max(x2apic_max_cluster_id,
> +				    (uint16_t)(apicid >> 4));
> +
>  	return cpu;
>  }

I assume you don't mean to also account for hotplug CPUs? If so,
please add a respective statement to the description.

Jan

