Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A095AE5B2
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 12:44:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399780.641088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVW2a-0004IC-Nc; Tue, 06 Sep 2022 10:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399780.641088; Tue, 06 Sep 2022 10:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVW2a-0004FE-KF; Tue, 06 Sep 2022 10:42:48 +0000
Received: by outflank-mailman (input) for mailman id 399780;
 Tue, 06 Sep 2022 10:42:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVW2Z-0004F8-0h
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 10:42:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a42107b4-2dd0-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 12:42:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8374.eurprd04.prod.outlook.com (2603:10a6:102:1bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 10:42:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 10:42:43 +0000
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
X-Inumbo-ID: a42107b4-2dd0-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhNRA74FaOLlWZfpQJQLzaxUFK/6XmNdEGoZrFliBn6zfx1M7LMv04JvIy1GmaDjGhfSQ7Ce6VsTOcB37vDDs7YFngwACK/XNxaGt7wMm6ca0AP1uQ2AHRMUykXbKuWNuhqFAyxM/gXL7X1EQTceQayNRMh0D1Pj+Pr/5lLQtvj/kgiSlZux3rEnY3dHfpazXf70vQmTJEGR6yaerWO1oZEUJf3EyJRdCZhAhQJZmcIMyx4gb14CY9/Gbd+m8tnPvoRwxQ//lKyb4AkpVAo0wC9cXgoap72xDvKTUe+ZxYJLHNxanR4IGIV/0Bp5oNhkU9rQNNX2JIVJYaKoI/MfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3rZ+1mwFYsgypB89oHiViLaS3/xNfX43sEXZ6JhB68=;
 b=ElSpMMsHKERDq3mafud7Yqlj+D7EBQvPMcB0DnNW9ItJMlxCOpld+OJQ01lvGiPVZq9ok7hdJOdW8GL21S6zMs5kjhOOpq5q2h3c6VaOeBYnn1LquzTabLB5QPQG4twf6ah0T6MdBS5kQfI7YeyxLU5FCPMK2z8t7I3WKXBYMKM72uCGIYgOSmMeDRwKqw0uQssjm3c+1Weii0xnCPSM+HUzSGbukYuO0HRWbdJIU2FjmjpvwSXFJyflT6eGZnQfHjZOB1vbr9Gnnj2flxE3oVxlNIyWEWTJcLY7tgb4Fudkl26yKdqMr10MLHZL0Eha8iVYmsfh9ASX/hshITPRdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3rZ+1mwFYsgypB89oHiViLaS3/xNfX43sEXZ6JhB68=;
 b=Z9x5eTZXoeApRPCQL3kd8fKIIKvmuUts1SIngV0OwPdQ9iavFPtDwY/sgTdwYgr0lLbmvq8wVH1jqPPXanJJf/6D74SH6xNzZD0G+sT92MU7QSYXns2RTCEOACy4Nf3je/YXSASJLpe6S91D4Ifz9uY85BJRcI3hIwOEjiHFWZ//XBbvO/K4j3rGHG/L99W4B41G992pt45tx3gS5Gfk5tn1NRlIUT48IUHARXXzGvyr2Y3CifDR0YSoow9C6Qh3iXgQ+G4utmv2SyvXtCW7VLDFefDAlvvyaPf+aa1DIJ71YOKM+9TcPKgkIHfsuixyflLc3AM3bLvFTgF9aY/YNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c008b95c-0216-d2dd-87af-e616a7f6e4c5@suse.com>
Date: Tue, 6 Sep 2022 12:42:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v12 6/6] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220906073919.941934-1-Penny.Zheng@arm.com>
 <20220906073919.941934-7-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220906073919.941934-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c677957-7b3d-4fd9-0510-08da8ff4876b
X-MS-TrafficTypeDiagnostic: PAXPR04MB8374:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J6q/nCHymDOHPSP/7UYZEOn0WBqWkQKsUH9xxXCNF9EF7+BcgNSy9KPKz1VRgWwHd66DUvC38fBqY1nwmnPF8NU3BUML55REcityKiprLeKhKnUo9vOPl6LEYjvDK0fi2A7uOBYopxCDlMG2T9PrMo4VVzt03ddW+2uXeJyVYccmd4KxKp1zSK4g/GyFerCkxnd9Gi4rERcAPbDEXRBRsVg+/VimxRuY+uKBcgVJIdmy3P2neNQUGGEooD+jeahGKkjZdLmNcOv+hcN5GQ+jpEmqBD6md6Fp6R95Hh82ScgOA9+iNkJRvNCgWraIFHeJSnA60ywk/5LI80Q5fdrtizbOMh9vNpFKt/HC6H2yLGrirIdqC6q45stIhONN+XeJqVjSwuK/L1K7mPZknofTu/W61mquKvfhqX8ddMogWbxZ9wQoTkqCiFU1bV3NoFUZy79FgxVg3ji+eWXTxjh1rWfuyQYQd5uaSrP6PVlh1o+A+ZtCMoo8aE0UdyNUTiZvwh+LWawCM4tdB30r4L6poz7ydI+ZWHBqpMyYqIxkJHDx3Mm5wF1Ni2H/2Rjc2CzVHbnboV7/CQeoz6EAkCQlGHICXz68KOPW+KLEqKKyp5BIaNZkEt3Fpza8PxVCJio2ICnybsEc0MneJd1vTKGOR6gQ7K91TVrI8ha8h1/ebty/Ygtl4BWyD0ctIjyf8DjywXX8GPcVrj1cbS3SzdXl9k7dCoyQ7wrCHseJcs7R2KC2jehMJ1dsGaOngGBF3faZTqgDRA55TzmZt5UvCUvnRLKcb7nVWicQbaK9bloiSb8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(346002)(136003)(366004)(396003)(6512007)(36756003)(5660300002)(8936002)(41300700001)(6486002)(26005)(2906002)(38100700002)(478600001)(66556008)(66476007)(66946007)(86362001)(8676002)(4326008)(53546011)(31696002)(6506007)(31686004)(186003)(6916009)(54906003)(316002)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlNSTGttZEdLMCtFbVpoQ1F0c1BYbjBIMHNNbElMaG9sNHpHSGQ1K1dRMTF1?=
 =?utf-8?B?SDB6QTZiNEF4ekttYlM0bE5HUzZUZmllb2VmbzM2SEdONHloSEZiMHBNSFVN?=
 =?utf-8?B?MTNZbHc0N3lGY25Vdmkzbzc2SER5YlFtQnQ2b2w0ei9CRDZKV3h3a2x0Szk3?=
 =?utf-8?B?TFJzWFlBc3JTYVBIaEU4QklzYTMyMjYxQnpQRldUWEVIUHNUTzN1Vk9UOG0y?=
 =?utf-8?B?S29kN2tZN3VtQzZyMXZHeXM3WDhXbnFSOXBrNnZyRXNKdkxlUC9Sd3llZDdD?=
 =?utf-8?B?QUdLUWhiVXo0UXU1Y1A0Z0ovVGNHMkw4c0NjcThGOW5IVzFoY1hjbUg5NjNG?=
 =?utf-8?B?YnB1MCtKMEJNVVUxSnRMRTlENnI2YUhCT2syMk1SRHlvZThPVEs0TkRRcG4v?=
 =?utf-8?B?NGlvMXpnZ1V3SUpKc1F2VEp4SUtManVDTk5adi9UR3dwcHByeEhOaVYzV2ll?=
 =?utf-8?B?bUwxa0Z1MmR6Yjg3ODcybnRzQ3VVLzJ1WnJ1K1ZGZzUvaUNOYWZ6M05aNlVN?=
 =?utf-8?B?SXg4UzkwQWYxdHB2ckZIa0cxUjJuWWMwQXZtT3JSS2Q5Y3M5R0t3ZGJoREho?=
 =?utf-8?B?b2U3eWh0V3hXNGVaY09SZTFqUUxacTVtbmY1QjNKWUhURGFOcnY2ZEZ3b0dY?=
 =?utf-8?B?RDRZcC9Fc3JmOUNIc3B5RnAxaXUzc01oOVN3dEl6aW56amZXU3Zpa0JmbE5s?=
 =?utf-8?B?a1VOVzU4SlZrZ1c0L2wrMTU1bFJHOHdQOTNKVGZsMldBRDdxakNuQkh3em84?=
 =?utf-8?B?Y3daL1NNZlllNlFKbThvQXlHcUVtTEhYYTlNS0VpVklncUJBVmwxZWpTb1Bi?=
 =?utf-8?B?SEJzMjRFalRybHFpUHI1ZU5jSkdYOGZMaTdqNDZBT21KWGpYcVBCdEg1Tlg2?=
 =?utf-8?B?R0dmY0k5ZTJRSU15ZzhEcnJ2WEtidHBRaGJXNmpucHU1OUhxNEpkTHo0T2lZ?=
 =?utf-8?B?U1FqOHYxK09MamZVWGFXRFVCWjA2Qi9qODVJUTJtTFpkbnhLdVlMdVFpdFU3?=
 =?utf-8?B?SkhPT3JwUWNSNDBwOGdsZHpjRWsxOVg1VndxV2NTcUhVTlBqalBIdzcxS25M?=
 =?utf-8?B?MG5lcnJWcHZFM0RGNjVhUTE0N1Zod0IvVGEwM0VPV21uUVRqR3RqLzdyRlhL?=
 =?utf-8?B?WW5OYks2d01WK2hwRWpsdXFCTVY5QWlqeVhOMUJITXhPSnNYNEMzUW5uTEdY?=
 =?utf-8?B?V3V3KzZ0M2tNZW5WRW1LUWZUMEdtWkRpV2N5QWdIVytvMHRNYjNGSkJ2Njh4?=
 =?utf-8?B?OGZiZE9lZytTaHdDL2paTnhlVlUrQUpTQmt4MnZ3bVZINEpVMjhKbm9ObkVP?=
 =?utf-8?B?alQ3S1hNTVZSVU1TTHdYWlp4cDFnQWlFWm95b29HckZ1L0IrWElnTDB3VERj?=
 =?utf-8?B?TUxRSkN3NTU4TXhwV3ludVpNNWlBOVVTaURPYnlMM3c2TEF1eWF1ZjVkU2VN?=
 =?utf-8?B?WFBZKzdwT3pmV1JqZ2FUR1prN2VKM2RMbkxKSUcvOFllUTVoSktHYm5vbkMv?=
 =?utf-8?B?RlhYSmZDakgwYnR5ckNLUkw2U2FIczhmdGZxTkVzeFl3NktTM3hHMXBPeEIr?=
 =?utf-8?B?Umd0UkcxV2Nzd1Q5ZHlvajA2NmVBbXlqSEZFTWZpSFJ4RFB4Zm55b1lWRkEw?=
 =?utf-8?B?TWZ5T3d4WjE5cGZaVVBSQStIb3NaQmNFVDM0WWVMQThxbjlLNzhsSzZZL3VD?=
 =?utf-8?B?SklpYUlxMzdxK0YzWFRZVFJERkx3cEp2MjVwa2E0VVRQa0VaQm9EQ1lsL2tW?=
 =?utf-8?B?YXExRS9mUmg3OFNiNnNEcEU2QlBuazFWSkF6ZitsZTJzQVU5S3E5S3RLbXRN?=
 =?utf-8?B?YUY4Sk5qTTAyc0NIMHhuZW9PYmZ0L3BGNE1CejVVNnhnLy9oRW82VURvek1W?=
 =?utf-8?B?cXB6a25rY2ZLSVFJSFpTOXFqRDVMVEE5RXBvR3FNNkdKMkdhRzQyRnhYTlgv?=
 =?utf-8?B?RDNRdHpGQXNKSkwzUXNkTG9udmc3L3BGZngrSXF0RlBIc0p6b1dVMUZ1Y0JQ?=
 =?utf-8?B?bkNQMlVqRXpZdU4wUE91MVdTb1lGTHZEVUlvSVlzSTViZXVyVWZCaEVPUVdI?=
 =?utf-8?B?OUhKZG1kbk5RK3JIVEtUSklac21TM3pDbWh6enN1YUMrUmNVL0ZrVjZCNGdy?=
 =?utf-8?Q?9xJ+7Ur9s5d+bdR7SQTFYGHwj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c677957-7b3d-4fd9-0510-08da8ff4876b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 10:42:43.4795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BT3ig55szJRqBGonfeITwHcCFia37X62xPCOr0KEgSv+MS8bxkiZ6JUjyY2h1U00onUe3vobQ6W6yc6xOouElA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8374

On 06.09.2022 09:39, Penny Zheng wrote:
> When a static domain populates memory through populate_physmap at runtime,
> it shall retrieve reserved pages from resv_page_list to make sure that
> guest RAM is still restricted in statically configured memory regions.
> This commit also introduces a new helper acquire_reserved_page to make it work.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Just FTR: I have no further comments here, but I'm also not going to ack
this change with ...

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -245,6 +245,29 @@ static void populate_physmap(struct memop_args *a)
>  
>                  mfn = _mfn(gpfn);
>              }
> +            else if ( is_domain_using_staticmem(d) )
> +            {
> +                /*
> +                 * No easy way to guarantee the retrieved pages are contiguous,
> +                 * so forbid non-zero-order requests here.
> +                 */
> +                if ( a->extent_order != 0 )
> +                {
> +                    gdprintk(XENLOG_WARNING,
> +                             "Cannot allocate static order-%u pages for %pd\n",
> +                             a->extent_order, d);
> +                    goto out;
> +                }
> +
> +                mfn = acquire_reserved_page(d, a->memflags);
> +                if ( mfn_eq(mfn, INVALID_MFN) )
> +                {
> +                    gdprintk(XENLOG_WARNING,
> +                             "%pd: failed to retrieve a reserved page\n",
> +                             d);
> +                    goto out;
> +                }
> +            }
>              else
>              {
>                  page = alloc_domheap_pages(d, a->extent_order, a->memflags);

... the gdprintk() left in here. I'm sure someone else (Julien?) will provide
the necessary ack.

Jan

