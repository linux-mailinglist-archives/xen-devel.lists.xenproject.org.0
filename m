Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B68642D5E7
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 11:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209135.365487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawvj-00077U-Qi; Thu, 14 Oct 2021 09:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209135.365487; Thu, 14 Oct 2021 09:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawvj-00074b-Nc; Thu, 14 Oct 2021 09:21:39 +0000
Received: by outflank-mailman (input) for mailman id 209135;
 Thu, 14 Oct 2021 09:21:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mawvj-00074V-16
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 09:21:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17131bab-b7f6-4744-bd6b-a5225be04f3e;
 Thu, 14 Oct 2021 09:21:38 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-8mQL9q-ZMAuZdcgQIbk3ag-1; Thu, 14 Oct 2021 11:21:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 09:21:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 09:21:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0360.eurprd06.prod.outlook.com (2603:10a6:20b:466::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 09:21:33 +0000
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
X-Inumbo-ID: 17131bab-b7f6-4744-bd6b-a5225be04f3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634203297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3bck/rJCyy0kh/AKYB/Mhw0+Rt313zEVP2i6+Gm0bM=;
	b=WlGqzcuR8/qdg57p/12bdDQAt/xPJXj77MYfTGOGRVVoKsJwnR4zcY76Jdj35QGdEdmjNW
	lrXmvZCA4DsChVXzzlI1F5zTW5YiZbQlYh1jyXYIj5yDrl/8x8YTPKZAV+s/ahcB4+fzWP
	NoNjUvtLdg0cMYW5pfAqPhdQoCjtd2w=
X-MC-Unique: 8mQL9q-ZMAuZdcgQIbk3ag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icq/JSjqQCzvJ5DQYVHXJhu+jOnoTXBVmpljMQwqmHyLDEKIMdL51fe+PIw7TmiSamFmH9HSBuuhnjz0yDV326+kEGrdH9BdJGxNtAMIMBzA5/Qewp4BqjjJolpEq+3LFlnPtgJ/xxSojb80Zwv0MNJS40lJf6pLQbYmzsldpmWZQNalIqC1zEUaLLvKIsd2Dbf+/9foMk6APfpjDxuToc1Kd3u1Vpx8MeIDYDNngfeaPO5g/SKoS/T+DOor2RFvzib7x3zn0oX1OwBADGgGwzYyELl4y5az3iCXo6nl2GMwmg6/MFSZ70lwgVibqcDK4/3y9e5UuYqIQnyf78GHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3bck/rJCyy0kh/AKYB/Mhw0+Rt313zEVP2i6+Gm0bM=;
 b=oS2flVuBhuFKfSa5iyY43tzkdWDBUWfEA537hlrxbZCbDJGhn9hUdgkNyF2jMP5FxQxrRIE6km8JoBnqN9BfSOmLWQofBUkzfvZtKKNJpRaR6iI8rxILwyRNBDu8f34ApctZzlnlgc9Bn6q3lQ6qEtT7XdxEFCqHnfCryWoaAPJtkVeAfF5TflSYuQCjm1pnoKfCnDeHUPr46VkXhKZ35E/c+ZCC1qJL7mGC1LM42n280xHeROXEg9BHPWeKa6G8LU1pA3MW7MWR68wO+TqqUXMyCl0TMgOmHgYQ3dXkljNW69euuAgYT0RHQlMuyDWAh9RJgCPVrrglrqyUchfM7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 43/51] build: replace $(BASEDIR) by $(objtree)
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-44-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0724e47f-09d5-ec35-a22e-428cefb9d9b5@suse.com>
Date: Thu, 14 Oct 2021 11:21:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-44-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0360.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32cb99cb-b49e-4a98-f973-08d98ef40472
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2607445745D8FA844F72032AB3B89@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qc2ZdDgq6jvPWJOGwV5141Y+VPsWfyE+jrQ8ab1RzpZwf+jUOm/nN/aP9BhFEl10cnBl6JTANMsXsBk0eQpVQGIOdYvgcxqwn4U1gDq1uFE6eGvZ7xlgAleK3KF94msRAnomuJ4ebk493c17XGvroLfiVixBZRs+sjBPqZr7I9h0YKETrOJ31rvGLCJdcUfGHOWUlxZ5fQUpo4TRh1EheJ0mcpI+9395HGdOlRxz+mtXJIoI2WIGG3FrnOJL2T45FGQuYBVH4U2INVrTdZ0Pyo2Z90BkqBAlfXUkklG6wkNvbkYYCsTdVDXr5KuqTTICi2V4gt6VRZekxAhAlEiU60OBmEpDo0Eltu+JCsEyvL13INditgalniN/s5xkUFaTZFAs81Y7/RlZ6Lr0MP7mfTABeSbI/WVyJ/YGgSrxzwLaqQKkSMq2tZONfyZEOvh7wVWNRucG9iWLCK29YkIooYcPsIcgvqtlpKqYl27k7P+rbeczBAjaG0c9eMQEnXX2xSMMHy/SAtG8+3QqBfioa/tPhUUviJVFwHNqEdu2x+JE4DhsG9BX1+fTRI85nV0whMXGtG8qEkyFIzcZGPvPJUZvj06gCmNANpgQSiBqWo5yFDz+XV/g1CKQqiNgPznsRcQ4krZUxfgzEPuxygAmEYDNGvhQKGbS3f2dOtPdZoyvj+dNTp9WnYxvgIoSdaEIYPvYmLX8yyLnVo3XoEApg4jr/b6JK03XQ8Fh/DJ4/nTNlwBkwLHkh2yAEechNMzJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(6486002)(16576012)(36756003)(26005)(5660300002)(53546011)(86362001)(2906002)(4744005)(316002)(31686004)(7416002)(508600001)(8936002)(6916009)(2616005)(38100700002)(66946007)(4326008)(66556008)(8676002)(66476007)(186003)(956004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S29LRHFyMy8xYUZQYzQrVzNoWkM1WHkrOGY4OFQwUjhhdzV6SUZtQ056Rm9o?=
 =?utf-8?B?eFByS0JHNmFUdnBJUEVxdnJEYlhSQWVBVDZzSTFySjRRZWVrZldoaGVXUU1t?=
 =?utf-8?B?bUt1R0x3MThCajVhMVloSG5vd0pySVByYStFNG1rRDlsMVF1MEZmUU9xQkJX?=
 =?utf-8?B?NFF2eWNsZC9aNzZuZFYyWTB0MWo2ay9kQXFzV1BrcDkvMEJhSXdTbDhjT2NR?=
 =?utf-8?B?VG9DOXVHbTlaWXNWaVJRa2hqaWRSZEZ0UjNhTnpBM012cTA1VlFtSnpHdjRH?=
 =?utf-8?B?NnFtdFRBT1FvUWM4TURaUXd0K1NRRE8vVzNobFFZd0FiVEd5VDNWeFpFeEYr?=
 =?utf-8?B?RC9mUW5rVWtiU0h2K1NzUFZWbFBrVGxpN2RLQmxXdmZuSXMxMWoyWEw2RVVr?=
 =?utf-8?B?amxOVUE0eVkwQmRocE5WcG1IVXFvblVFR3lrN1BYMFVjaHQvRmh4ZTRzSjJk?=
 =?utf-8?B?QXNTSWlBd0g3WTJjVTliUXNJZzg5cjd5V01LeHFoYlVpS0kxUmRYeGxka1Qw?=
 =?utf-8?B?ZzE3K1U3Ujc2dHc3ZmRSUlZjSHJwekxwQ0FEL3UxVHBVcU1UWTJMcTdkdEph?=
 =?utf-8?B?dDhXc0VJZ0xnMUkrZDNBNy9ubEk0QUpmNE93SFY4WnJvZTRyVVdGSTZwWCsw?=
 =?utf-8?B?MGQzYXk5bUc2MDlBV0VmUVZiUE1hc2tudEc5T3A2SENCNUxWSWpTMnBoNmhT?=
 =?utf-8?B?bWJKQ3AzcG1ZRmJ6aXRnUEtMWGdDMERuejlyWDYraXpBTEcxanVJM2ExZ0Vm?=
 =?utf-8?B?ZlA0Yzd3Z1FXMHNsbXdWUitydFJvK05lcm5ua3lmOWtHVHZaNmIwSjdHVWIy?=
 =?utf-8?B?bXJQcVR4OEhlTGcxdi9RckJ0aXJnU0VXeUk1YUpicnVDK3FUOHU2Zm5OM1pH?=
 =?utf-8?B?QTRVRFNJcDNzb1pydm8vdEIxTzdPR2ZoRExjcTlPZDRtdTJFYkxwcXc1Q1lH?=
 =?utf-8?B?ZXhuNnp3U2FaRHBoNXc3UzI5K2lOa2VCR1h0WE9vZERnMks2NG5ZRE9GZWlT?=
 =?utf-8?B?aVRxZ3JZOHRoc0s2TWZGYjRJZ0ViMGhxZVJxaEc4Qkp3NldWb0hKVFc2eGhY?=
 =?utf-8?B?RS95a1dBN2p5RHRjZVUyeTIrK2p0WlFhdk1CdU5VczV6N3cvT1VIUEpaVWQ3?=
 =?utf-8?B?d0ZINDJxQVZKeGxhWEhNSkVPV3dOYzRPbTVmcXJLUityZWFFaXFVVE40QzBO?=
 =?utf-8?B?Z0JqcFdZekxJSnlLTGhOU0NUZ2R0Rm92SHd5U2RCTGZJc2hoU2RBNytuZ0xH?=
 =?utf-8?B?elBpMUkzMVRkZTZYREsrSEIyK24wN0I5bzhsdTFoaThrRFRNRzRvWXllaS90?=
 =?utf-8?B?cWRzcGtuZHUxQ1d4WjNtcUpKMjdPeUpSeU9EZ1RrSWl0dlRLS0FvT1JXemZp?=
 =?utf-8?B?Tm5ic3J1MVgvaUQvVzhEMk0yQ0dMa2xKbTZmdDhOODVicFF6NWhIM1YyMFY0?=
 =?utf-8?B?MVRTdkU1aFh4VTMzRlAvQlJFMDdINTgxdW9IeU4wMi9hWVRyb3pzdE85TkNQ?=
 =?utf-8?B?NkNqWllEcnFDdUxtcWRoMGNnMVdMY25yUWJ6NWI3ZEJ5NTNDWUlxMzkyL2Vj?=
 =?utf-8?B?bTMwSDNqMEN4bXZnTXY5SXVIZndVNUJQR1Eva1dqTVRMeVFjRnZTMnFHZ2Zq?=
 =?utf-8?B?Z3kxam95dWdFdjA3cGwvRU01dUI4YUJnS3E5R04zMEFtYlc5UVpjZ3dkdkxZ?=
 =?utf-8?B?VlcrVjVlZ0FyV3FVdHpKdUN3NlFFSElJeXFwem1HYW1xSzQwRW9KdkNmaTRQ?=
 =?utf-8?Q?BYACqFFb8UolspnSe2eqT3A/Uwz6yOjOIU/u5+R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cb99cb-b49e-4a98-f973-08d98ef40472
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 09:21:34.8473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Za5AolrCWg6zCpdxdOPTULXCpthdAwyHl9Tya9uZW/rd4zyZ8+0q2FX2XrdSROp16a4q4dVjZw/7QALhWdmZQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 24.08.2021 12:50, Anthony PERARD wrote:
> We need to differentiate between source files and generated/built
> files. We will be replacing $(BASEDIR) by $(objtree) for files that
> are generated, and $(abs_objtree) in cases where an absolute path is
> necessary.
> 
> The "clean" target is still changing to the subdir been cleaned, to
> remove file in the root we need to use $(abs_objtree).

Vaguely related more general question: How useful is "clean" for an
out-of-tree build? That ought to effectively remove the entire build
tree, which may not be overly sensible to do via "make clean-xen",
but instead simply "rm -rf ...".

> @@ -117,4 +117,4 @@ $(obj)/dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
>  .PHONY: clean
>  clean::
>  	rm -f $(obj)/xen.lds
> -	rm -f $(BASEDIR)/.xen-syms.[0-9]*
> +	rm -f $(abs_objtree)/.xen-syms.[0-9]*

This part is common - would it make sense to move to xen/Makefile, thus
- aiui - eliminating the need for using $(abs_objtree) here / there?

Jan


