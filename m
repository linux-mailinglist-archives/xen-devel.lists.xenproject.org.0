Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1F252A588
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331030.554474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyhM-0006ue-KA; Tue, 17 May 2022 15:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331030.554474; Tue, 17 May 2022 15:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyhM-0006sj-Fn; Tue, 17 May 2022 15:01:20 +0000
Received: by outflank-mailman (input) for mailman id 331030;
 Tue, 17 May 2022 15:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqyhL-0006sc-Aw
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:01:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 340fffa1-d5f2-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 17:01:17 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-5lqg2WL3MOKmKqHI3EKodA-1; Tue, 17 May 2022 17:01:17 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6692.eurprd04.prod.outlook.com (2603:10a6:208:178::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 17 May
 2022 15:01:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 15:01:13 +0000
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
X-Inumbo-ID: 340fffa1-d5f2-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652799678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C2DTYz5hUvQByfZpdcN9casv6oRXTn2TDhQKNQ/Rzhg=;
	b=fPs8P9Dr6rGc43qcXp+lgflGHsweOHSIj6EaLuB5otDwRpBsWwNRJTxvRIVpLmW0CgdFHK
	djPyT5XUVlZ8pdgILwDtqNP83KKMWhJhrVE3Iwkzg/vENjww0iAFCLzSiLZOnevntwzN1H
	aRNEnrttd1MvJ58Wugu/b8Rpnq/SE4Y=
X-MC-Unique: 5lqg2WL3MOKmKqHI3EKodA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OplQsgA5Jc+7EL2mv3VvDBbhiZ956/2ldrGBVJm9t3tpdhLQxHgWtWmvBCAb4aOHe9fco+TkQnLmCpAk7NvCVEM+Kg0M/lwpVOwSoShqTfzR/DAnKXyoCbmYyuOCj4kr6zyBrkggA9IvaxE6dQShlTnXPDsMUnAHgqLrZwJCdwqHgi9UBbaT12yj1urkUV3uvDKUfGh9CkLUlG1VFbLxDDR+3eIZBA272I1jz5+ICieZM7Ox67YJXTEG5MNBXLmGF6s4/4yDAd6qJK/7wFB7F+//Jil6R1/JiJt/GYKLoK1WJZq3UGzVtEcckh7T0Y+nyBcgSXH2vNhvgf5mJha+eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2DTYz5hUvQByfZpdcN9casv6oRXTn2TDhQKNQ/Rzhg=;
 b=TfT4KpVUDu/H1yMtMAoW2/QJu/k9vTv7LrCicaT8tC6UV9oT800862PISwn01nluHykfzfIDu9BzKWAG+8xESKAs80lyayDp76+CExQhBKcVs1xl187e/4fLlNDwLkKi1EhzaRb+7j0SuKfT6qszw0yqvxeN73YMOPrdQTfqjlnoSM0f+BoXUCfle/DMLqWjdWmWJf6Ra3btYNi29LiUernT6ed5o9YEscnw5uP1QWX6l93mZaCOMsEytn+vlVQVMNkVNOUpZ3WQ+kvk4SxQobEpGXOcCafSy8lSwF2EfoMG4P9oLgodMqaa9HcyxQZbewzHZdoEFuFrRq8PqL4rJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8430c91b-edd0-76b8-6a14-7268649103f3@suse.com>
Date: Tue, 17 May 2022 17:01:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 6/6] tools: Remove unnecessary header
Content-Language: en-US
To: Lin Liu <lin.liu@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1652170719.git.lin.liu@citrix.com>
 <e6e161b23ad9860972a9af2e7dfa61ce1f0cacda.1652170719.git.lin.liu@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e6e161b23ad9860972a9af2e7dfa61ce1f0cacda.1652170719.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0015.eurprd03.prod.outlook.com
 (2603:10a6:206:14::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e38351b6-6a79-400f-844b-08da381615f6
X-MS-TrafficTypeDiagnostic: AM0PR04MB6692:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB66923D5D9680F86F8F233ADDB3CE9@AM0PR04MB6692.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yK7G8166lzs9MEttA3THFvOwVuCtZeIuoIHqNLL8D+R8poiEfmnswzuCeqSwXa50tJXSTKxo097BaqNf35XKMPNZC0OxzmvZWvyTCIJsyy2EAhtESI85DrjOHypYizcHzI1hCtRfMiEdgRtZXS1p33lt1eTGdJbjnysMDiup4/oa6cQrmcGL8Z8G25g6NXsyCtXE8mW3yBXpBCrVmTT9oGSzL//T0vrX+BtMNt8Oks4+5H1r5oUZkVDl3+bWC9GYn6pw+cuX7gJ4BAm4mvWCAcPQZ3M/ya1s36zLmblnxRchKk7hb7T6eWO3sPehd0iLNt3AAOQURgR3AUtseRr1R2zuQqult5px4lR0FgLim2BBV/Ez1H8vkYo0zO0vnztO1D8XxH7dLw4auo2fNmF7luSMr3687jnXpq50Wi9L7b1DR7NiiQ5dtz3L5aLhotrhNnPeO1wHE5LyrST8CAXmEgT6dtnl+5L30DZNYkI1hKiSuM01VLtGs/jd2RLlR2oAeo1u4dGGgVLrsc8hzAQGQj4GhlbAT0WPslfTs+PhsHLAmZM19E4cQw86ZrY0JVXDdIX9y1iFwLOI3Mf+N96gd4IFUuMJi7T0kS9H1/cZpemiplXLNiZJd3dXZsTJP877Iw/OcJ/xZAY3cShd7ZAHXdIFK8X4H9ykDxZqqFkYMc3Q2VGWlYwcYQAy77aRjvkVM4HtFRYbvALr5D7NcIPMXCtt6C1M+geeMkholCxajV27/CFBznthiINVcccHdwZj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(66946007)(8936002)(4744005)(5660300002)(8676002)(66556008)(66476007)(4326008)(54906003)(6512007)(508600001)(6916009)(316002)(6506007)(2906002)(26005)(31686004)(6486002)(6666004)(38100700002)(31696002)(2616005)(186003)(53546011)(86362001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHg1WEJPTkpaVElZbGpJa0lxQVRpeWtPd0dWSDVFanBGTy80SFBBTDFjemdY?=
 =?utf-8?B?aWR0eVNKbUVCNmdnNDJVK1VueUxsVzhSb0o2MEhXMTJqR2VUcjlmMDRYYlEz?=
 =?utf-8?B?S0h4MW52YU1vSGJMRmpMcjREZEVMeFNyd0pLdWx5NGFsTmYxcUVHZkdUNHZP?=
 =?utf-8?B?RGlzVTZXNk5RNFRHUE0xOVVUM0xlejQvaW9OUzZCcUxoK1V3VmF1YXgxMHcy?=
 =?utf-8?B?cldhdFRFUEgxLzZTSGNTR0g5MjJQSlBSc05aMXdVUlh1RDJvUXk1QVlEL3J4?=
 =?utf-8?B?TkU1cW95RVBSUnpnaS8zcUd4anF0S3JXK0JFTVdvNUdRMHpxR0t3NDczd0JI?=
 =?utf-8?B?R0JBL2tCVUdpenE2S0JXd1lWSFZta1UwM1Zyc2lyMFVlMUNmR2E4TEJUK3Er?=
 =?utf-8?B?T1NoQmlOTEtIRTBNVzZVbVVrQ3BpNmRtZGFqYUtsMmc5V0ViN0o5TnRZYjd2?=
 =?utf-8?B?L3dRR2JQSVJoNnJIdzAyN0pnTDVNdnRZWXViREZ4cjJweE5ZZnIxYVlXVWE4?=
 =?utf-8?B?WCtRbjI1Q1lPcWlERjdwSytIR3dENHZyZ09XZ3pNdzlmbVZyV3g5NVFUeFp3?=
 =?utf-8?B?bE41UUw3dDN4MVprczVyMFJwSzdwdTc0czBYazREK0xRaDFxM21DY3J5cHVW?=
 =?utf-8?B?Z1VqaUwrQWQvbFVDSDBxOWU3OVFEdjdaY2E5NEZVQnM1aGhmUlQ2UFhZb0lB?=
 =?utf-8?B?Nkk4dVJ0UGI2MHBqQzI2N3ZRbkJrYkV1dUl1ZnBweXhIT0J6TGJRZWVSaWJ0?=
 =?utf-8?B?VnZ5bkhhbGpLdmZpdERpTkxyV2dSL2RHMDYzSHR0aWZrQWhqZ3FNU1NFR1ZE?=
 =?utf-8?B?ejlROVFNR21oeVNZVTBnMitqY2kvTFNUSldkRU1UaXE5cThuSEFCRi9yclFr?=
 =?utf-8?B?VitqV1dueGNtMTF2SmJ4NTUzWWJxVmcwZFByYVA1dGx4TUthQUVWMkdIQnNV?=
 =?utf-8?B?TzRucEpwbFpuRm8xbU5uRHRoSG5OcGxVVjd6OW1CKzAyWnZhTHNFK2tCS3hr?=
 =?utf-8?B?cXNOQi84OEpMMjBsbSsxT2hzRTFjVGFJaWhwK1duTnhlZjNTK2YzbWtFSEZ6?=
 =?utf-8?B?cmtRTmxXcG1QRU1IRkRwdlM5RXBRZjFHNXJxQ2NvclY2YzQ0UGVLRWZibjJO?=
 =?utf-8?B?aGJyZE1LY3JFMWZjZzR0QnVjTVVRdFpZaDdGV1pZSWNiR3VPYkNmRHE2bkNk?=
 =?utf-8?B?b1BveXV1QkdWUlhzYW1CSGwxNU9YdjA0UER3UDI2ZWhSRjdmVEJiVzh0S3R2?=
 =?utf-8?B?T21DdGJjSGZMbzVQV0RSaml5R3lUS1JjeUJGZFF2eTNuRU1OQldzczNLNEdz?=
 =?utf-8?B?ZTkycWtQWlVJSWFCNEZ2ZjRzVXM0RFFSQWV1aUNVNW1ZNjUxbmxtaE5meGlJ?=
 =?utf-8?B?UUMzVUlPV3JDbGJiTUt0KzA3K2xRenVvWEl1bVNEM2tXdm9jZE8xQVRvWk1C?=
 =?utf-8?B?UEsyZy9NL0ZDUmMxMFRXNExuaVFmT2t2MVh2UVhwa3JLeEsrWXlTS0hxSGJs?=
 =?utf-8?B?Uzk3dkFlci9NVUhhb01oUW5XQjFvUzZnR29uV09xUVlWeE84bHBiVHlCUnl4?=
 =?utf-8?B?WjR3cnZrR2ZZRjBSZVY5c1pKVkxwa0F1d3JhY3lXRTdPdlZ3aWMwNk5OOE5m?=
 =?utf-8?B?ajI3KzZoVTNEV1Q4ajF2ZnM5RmFXYW1hSEVNRVRFWmR4ZVgrNXdzOUJYK3Zj?=
 =?utf-8?B?a2xlQWdaWHJydnpsWTJmQmJ6U0hzcE5xZW1RL1Y4QUF0MU5hYThpaDBMNEpY?=
 =?utf-8?B?Mm5uUi9WSlZaWENFOVQ5b3Y2OUI1ZTRqVFpHQXRPT0Q5am5SNTN1VTZvZWdM?=
 =?utf-8?B?ZFlldS9TS0haWkk4THN1NXRkMXNkZEdQZDFoZm5sb2V6YVBoTVpEOTFsSS9s?=
 =?utf-8?B?UDhWRFppbitrenBsRXdOTEYrTzkxdWFzcUQ5OHV6aGQ5Qmdlb1BKOG9vM0FI?=
 =?utf-8?B?S3FCV2p3VmlISTFweHBXVk54dkttSkJ4Si9Xd281QUVMUm1WeS9yeG1yd2xZ?=
 =?utf-8?B?Vk1IQTZZUTh2UFdMcU1NMHcrZDdZK29LWVh5dU5DYkdVQ2JaMnVIeG9rT0Z6?=
 =?utf-8?B?MkQ2cWJCQStMTXVwSVpRYk9NaG9HR3RENVBScy90bEhSV3lIM3libDEvME1w?=
 =?utf-8?B?UjF4Vk02eHI1OE1KTlY0MVdoblpTUDRENlRYa3pVZHYxOXFyamZ5aWhFSC9w?=
 =?utf-8?B?YkFQWkhtUHRlWm9kU1U4MXJQZnlwNFRTS285MmYrdGpMUFExbFlSbVUrVUxP?=
 =?utf-8?B?TWpoUEppL1lDZHRrZGV1ZmIyaUpWbVFFQnhSYm5PRGdPelcwNlNncTM0TExa?=
 =?utf-8?B?aktwQjVKRnNWd2JLc2MwOEhDa1NzeUZrQ0R0eWQ0SVpBOE1jaG5oQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e38351b6-6a79-400f-844b-08da381615f6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 15:01:13.8072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tx3mIOBvCF8gu008GefPtIif2Zt292H7gFMO06zDaNU9Mn30sWcJ3rmlOiyK/vGs4G2+8YQsIdZFO8sC6I/iZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6692

On 10.05.2022 12:15, Lin Liu wrote:
> --- a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
> +++ b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
> @@ -31,7 +31,6 @@ typedef uint64_t __be64;
>  
>  #define __BYTEORDER_HAS_U64__
>  #define __TYPES_H__ /* xen/types.h guard */
> -#include "../../xen/include/xen/byteorder/little_endian.h"
>  #define __ASM_UNALIGNED_H__ /* asm/unaligned.h guard */
>  #include "../../xen/include/xen/unaligned.h"
>  #include "../../xen/include/xen/xxhash.h"

Doesn't this need to come ahead of what is now patch 5?

Jan


