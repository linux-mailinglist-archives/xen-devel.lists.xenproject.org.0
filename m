Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950DA571A76
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 14:49:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365659.595929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBFKI-0007qw-9B; Tue, 12 Jul 2022 12:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365659.595929; Tue, 12 Jul 2022 12:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBFKI-0007oU-5e; Tue, 12 Jul 2022 12:49:18 +0000
Received: by outflank-mailman (input) for mailman id 365659;
 Tue, 12 Jul 2022 12:49:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBFKH-0007oO-5Q
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 12:49:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09518cd3-01e1-11ed-924f-1f966e50362f;
 Tue, 12 Jul 2022 14:49:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5071.eurprd04.prod.outlook.com (2603:10a6:803:56::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 12:49:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 12:49:14 +0000
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
X-Inumbo-ID: 09518cd3-01e1-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlexC6lYarPcz3BJF9iWkIso2e3d7sxQEb30RDVO13s2SDA6jZbqRvX/A4oqx11HiUypBBKWOOFL8ErQqYv1gsLFJu5UH6A2hE7g6zENz6AJQCndsGUYvLxCZAbbEG1Ik0HC+sNyAGcYiL6rNbVTMzAnK+5Wz18/Jdn3qN7S+GZl+ciTNtBj44XAuDWjcrAbQLJGZIW/ug4k1GjP1DHNkf/lOCuEie6n6uY331G1l9b6Q+9x6cftYH+8h0xGCD8f7RyE/dnM1T8gnf8byVaWPBP/ow2JXy9QF/uqso1oXfNcJ9muIGzk1vH/GVTyQLIPknrel3fyIKGSnXm8ckkhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/RXziFGEDE5KmXCAwkKSJTIL1pSi9NrvrEVWZQIQVE=;
 b=Vv2JX4agEYdJTmcEUbvR6QLRrb0ttSa0W3gx0uYVNbZUdL7ah0C8tZCaDHtRf8ER5tE9OqASf2VWSmA7na0e1V5Fubwd82hfVBL0cYry3tivBwRoxTLMvTwK/y0MHTO/6Bwa+XbdDFnOj8JV5hCi2JPfBjyhrKfEClDz+efb6IpRetztUH+lvmOcGxxuE85lOuoUBpfg18wiyLJzi88p2adoxKErChraXZUtg7okLnIABml7qDEefpY+9rqnnxrxFQT6c2HVXqrcbZe2k1YyqGCqcnTw/XSXqnAFBt9lOgMdRQRujyADnwNmg04p85iHrhcNTaqA1CiQ+wruMNT47g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/RXziFGEDE5KmXCAwkKSJTIL1pSi9NrvrEVWZQIQVE=;
 b=FB8OxuMgV2KQewMTK9VBdtokpXdVTWvupG+HfLpJHPFp6aqBNF+kDy4n4LatfFEG+ICisG1b2/RiT7UGFdtqbfRLZgxMYXm1gm8H/LlYgqxZ98bXsX0xR5WcjcGYp/xSLlJxYjn/ORpugtopcVXgi8fctjn5sK/pLmpYvqB9ix3dWkxpoz8WOoE8DazJ0oUuJkkX/LN2lyBLZzUymTX5LZjV1tgDH/RXxzd9q2odZW4oNjVhJJUdgqYlWEoigYwMyDsUsAK1OgGwJF4/NFI32jNX4rFq54rFFXH0TlFfrYVoJb03TBgUUjL1vL3pKpxwR2hmTpsb59aaDqJiKuJJkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aff4a02b-6700-8b5e-5c2e-bf419a9e1b82@suse.com>
Date: Tue, 12 Jul 2022 14:49:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-3-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220708145424.1848572-3-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a553eb0-f1cd-4ea2-0f88-08da6404ec98
X-MS-TrafficTypeDiagnostic: VI1PR04MB5071:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zBuuLf10ukSwjzZVvihslLKW7/Dt+x7jU44omHJX46RVH3tp8kV03GvBt15t6f2SIFjjfF5dQNRJc202B7/G3t6i015tWKSIgfTBvJVhvol3YXIBSKY1N0samlBglC9cH5CrWFQh4kIUHK+07cFl0aSBIQhxy5bf0gPczGa/dmLWjdFHzoAfGuxIJfcMkbr4/jYSqVK+EHz+t7++GT0oPxJ3jLojldVusdnmMvvNNds65GUbAokUcTC6qS5twyFY0rWcyLqt54QXLBZg1vo/cMnMqal9p7JrLP9JxTy9hxCRXVe4JzCehBXCunXsIQQ7/jYLQkrtvXj0LoMcT1LEitdSoBwJCUAKu0J4JbJcO90ujcvwP+VrgEBwlpTsQcKlg4svITJfTJ1sUAj/1M8NCk/rLgMN4D4ENyRSMzxUC3mZ3ZvOM2qf5KYKJWvc68nlGTi/a+Fgb7c5lXev/obL7Amkkxm5dXVhvZQbdam5e5q5TINPW780yqxOrHgMhPrTErwYPd8Ip4zTx8ubFeHTKxSfVOhSyjfaRW/4MS9gTb/9F4NE7rrG+6SpuyzSqg1KJuWiTj4xJZDcdujlEOsrhf8exnVRz+Ib2arx5RVXiu8Yzsn6Gq3WSEcaWQdMGhlSOcoZQctsufdEPtjTAyQ/8LfZE6eaXqI5k/jNCy0W8m8SCIi0OXTXQ/xCBZ1z2QQB9mAeauW2qOPAWv2k8nSh7QdyopSH9y2rVh103fAAPrQOZTU5pnz1Lu4tB9vxT2J6QH5a98eWrd97YLygopfJnpPTwbM6DbedOsvS1V+I0bhmcAF0YwbTFtf0rL4HQ8X1A0VsnQPv1AAxQnUf9re4KbKrbP77Ss7w7Wz9ldF7Jkk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(346002)(396003)(39860400002)(366004)(6512007)(86362001)(186003)(478600001)(53546011)(83380400001)(66946007)(6486002)(26005)(54906003)(31696002)(2616005)(31686004)(6916009)(6506007)(8936002)(36756003)(38100700002)(316002)(66556008)(4326008)(66476007)(8676002)(2906002)(5660300002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXp5TjlBb2YydGlVVjExVnRLUkZMenBnNFpBb00zUnU3eXNIQ2lsMGVOanZZ?=
 =?utf-8?B?UTZvWmo5bEJJbXFRMmJGNnpNNi9QTUtPOGdIYkJGUk5OUENKRElQOTA0ejk5?=
 =?utf-8?B?bFkraTVNWjA2WWV0YWFHL1doN3RKdUlVbVk4V1E4dldwMFNZL3BPZGk2ZFd5?=
 =?utf-8?B?dUhJcGM5cmZPNlRjcld6K1prbEs0U1RyeFRiT3pVOTVnMHpWRUpvUkpDWEx3?=
 =?utf-8?B?aUVhMVcwUUsvQUJvTDJIcHpFc1JPOXhCZEtLdG84OG5FYk5CUWJKUURySy9u?=
 =?utf-8?B?a1pPd0k0VlFDYWNJNDNnVFdESmhEakxYRW8zM3N4cm04ckRQclBkYmF5RHZZ?=
 =?utf-8?B?RGpFR1pwOXZ6cVJBL0UraGVhSzAxbk9JZ3NYUjNvRVo5R3dKOURBY3hQV0w1?=
 =?utf-8?B?RDlMdjFmdHJBQlhpU3BBR1loeEFBKytlRERsMllsUEIwdWxBYWRpOXFNSkVR?=
 =?utf-8?B?ZkNMUTF4SWhvZnpoQ1FSYytzOC9KWUxWcnFhRmZFcElqNHN2OWJLK29JeEJ1?=
 =?utf-8?B?Qjc5SUFiTjhqK2Fqek4xMG9FSXZrSE1hZUZSK01uTzdxbnFyNVVsWHRQSDRk?=
 =?utf-8?B?SVJvSUZnRjA5cSszbDhDTTZsSCtadm5WZ1lyS2YzNjU4ZmJCdk9HSXZCUDYw?=
 =?utf-8?B?NGNpMTloWmlOTXVIeUlrYmhXUVFqL2Z0QW9IWDN3WGZ3RDNDdkF3SDU2aEU0?=
 =?utf-8?B?MjFaSTV0MlJtVGZ1ZEQwd1BwY3J2TlJicWxSRG5NWEhmL0FtdnhNMFdyQVhS?=
 =?utf-8?B?cWRXdHJTUGFIaUNqUGhZUmt2WTdRR25HUDRhR1I4bjhtUUFiTmZRTEJCSmlS?=
 =?utf-8?B?cGY5TzBGU3lob2FNeUxwemFBYkVrWkJoT2d4Y3hKd0dZazdrZUhQVDd6YVl6?=
 =?utf-8?B?RVhybTBvalh1am96aUVjTVBiNzJzbHRHbS94MmRWTG9mZXU2OGhYa3hZR1RE?=
 =?utf-8?B?ckVuZzJFVjNaNXIxYmM3T05TSHJxbm1SVjVJVjM1UGRha2dDQys3RnJ4a1hU?=
 =?utf-8?B?UmpDa3dYemJ3d2hwb2VpaXV6NmQzTzh3TVEzQjA3YmNFTmc2TkYrbGxRTTZI?=
 =?utf-8?B?RG9tWkQxbDJ1ejhzbWhoeERtbjZEamZ5cjJvdy85eUxlSURyTStnQ0U3dmkz?=
 =?utf-8?B?ZXd0WjJ6MWlXRGpCdkJ6Zi8xVGRCUDhXTVYvSGhIb2RyRXVPelNQNDZ6dy9T?=
 =?utf-8?B?VTVvbEVrMlJ2KytZMVl1ZDA5VFZiekM4UnNUY0hWYTYvdnlMU0JpcUlrY0Rs?=
 =?utf-8?B?aTlaRTBOcGQremNCRDl1S0JrWm1hYWQrWENlenNtaStma1FTUVRVcGltUTZa?=
 =?utf-8?B?ME5uY2IrbWhJTmE4dnJiQzlDcDFZRnh2THVmZUd1bEpzZkxOUk1BTGFtVUxC?=
 =?utf-8?B?WTFjZXVWeVM0Nnl4RkJBS215NHBDWkZKaFhYckRzNTlOTHAwbG1kU1liVkJq?=
 =?utf-8?B?YTFaSzBBck1yYkt5QjRXZXdkekJ4TmxFaGIvKzFmbSt2cDBqenkrc3F4THh0?=
 =?utf-8?B?WmE2OWMzcHo2S3pxeFZUTDI3UStqSXBNcHZndFZqN2VCVU9Uellia3h0WTZF?=
 =?utf-8?B?dFlSZUtQRERrbHpFRUMwWkRCbExBTjk0UzgvS1VtV21XQ2diL2xrb1RWakRh?=
 =?utf-8?B?VHpBbHhEVHBQOFZrSmp3cFV6NC9yL1YrZWw3cXpzbWlWall4MThZeDZHKzV1?=
 =?utf-8?B?YXhaYjhraVR5Mko4c2xKRFFWUzArdmdSb0hrUjVnTnFPdk4vd2pjbjlhZDFY?=
 =?utf-8?B?TXpxUURWZDB5a1hmMHYzYjRGUmFhWU5FSW9sbDNDN2o2ZUc1S0dJQmpmaEdh?=
 =?utf-8?B?dnI0UU1hMEF4U2FObVl3cnRNWERzUlNlcW44Ync0VDhTNHQ0VE9GU2N2eWhz?=
 =?utf-8?B?aElHbEhqcGZNS215bGY1Z1cyUHg1V1RJWkwwTUtXTURPRmlRSXVBU1R4c3E0?=
 =?utf-8?B?R3M1WjFEMGdYMUlHS3B5RVFTNkRkVWhPdkx2UGxvQmN0SFhjeDlRN3h5WjNN?=
 =?utf-8?B?ZWFCdmNyb2ZsZGQ5Q0p1ak5hNlYrTUdRNVFWOHNFblQzSEJiTGsvT1R3ekJ2?=
 =?utf-8?B?L2l1QlY1clhLN1RteVVQaTc4V1FsdnlLbkJjbGU3Y3NaY1Z6R3IzM2NvbXpJ?=
 =?utf-8?Q?QImUz7EuwkYNua/TqVoH+nmCK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a553eb0-f1cd-4ea2-0f88-08da6404ec98
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 12:49:13.9787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BdtoGMDj7tHMCBhwFcHJzGrtjka2aX3lnjHqMUBGUf2iyCFWBT3FcLjotXJuOM67PRYwNfni/FzOZn7F5cl0BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5071

On 08.07.2022 16:54, Wei Chen wrote:
> In current code, x86 is using two variables, numa_off and acpi_numa,
> to indicate the NUMA status. This is because NUMA is not coupled with
> ACPI, and ACPI still can work without NUMA on x86. With these two
> variables' combinations, x86 can have several NUMA status:
> NUMA swith on,
> NUMA swith off,
> NUMA swith on with NUMA emulation,
> NUMA swith on with no-ACPI,
> NUMA swith on with ACPI.

Hmm, with both this and the actual change I'm not able to convince
myself that you've expressed the prior combinations correctly. May
I suggest that you make table representing the 6 (I think)
combinations of original states with their mapping to the new
enumerators? (It doesn't need to be 6 different enumerators, but
all 6 existing states need a [proper] representation in the new
model.)

As an aside - I think you mean "switched" in all five of these
lines.

> --- a/xen/arch/x86/include/asm/numa.h
> +++ b/xen/arch/x86/include/asm/numa.h
> @@ -28,12 +28,22 @@ extern nodeid_t pxm_to_node(unsigned int pxm);
>  #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
>  #define VIRTUAL_BUG_ON(x) 
>  
> +/* Enumerations for NUMA status. */
> +enum numa_mode {
> +	numa_on = 0,
> +	numa_off,

May I suggest to switch these two around, such that "off" becomes
the meaning of 0, potentially allowing ! to be used in a boolean-
like fashion here or there? And please omit the "= 0" part - it's
only non-zero first values which actually need spelling out.

> +	/* NUMA turns on, but ACPI table is bad or disabled. */
> +	numa_no_acpi,
> +	/* NUMA turns on, and ACPI table works well. */
> +	numa_acpi,

As to the names of these: In the description you already say that
you want to re-use the code for non-ACPI cases. Wouldn't you better
avoid "acpi" in the names then (rather than perhaps renaming these
another time later on)?

I'd also like to understand what useful state "numa_no_acpi" is.
I realize this was a state expressable by the two original
variables, but does it make sense?

> @@ -528,7 +528,8 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
>  	for (i = 0; i < MAX_NUMNODES; i++)
>  		cutoff_node(i, start, end);
>  
> -	if (acpi_numa <= 0)
> +	/* Only when numa_on with good firmware, we can do numa scan nodes. */
> +	if (!numa_enabled_with_firmware())
>  		return -1;

Nit: Perhaps drop "do numa" from the comment?

Jan

