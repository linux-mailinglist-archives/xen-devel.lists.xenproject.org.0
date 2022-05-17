Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D082C52A7B7
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 18:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331242.554727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzsa-0002cp-Bq; Tue, 17 May 2022 16:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331242.554727; Tue, 17 May 2022 16:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzsa-0002a5-7c; Tue, 17 May 2022 16:17:00 +0000
Received: by outflank-mailman (input) for mailman id 331242;
 Tue, 17 May 2022 16:16:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqzsY-0002Zx-Mn
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 16:16:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c52f60f3-d5fc-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 18:16:56 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-uIE3w4ZqNyq13vbe5KGkGw-2; Tue, 17 May 2022 18:16:54 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6794.eurprd04.prod.outlook.com (2603:10a6:10:11b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 16:16:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 16:16:53 +0000
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
X-Inumbo-ID: c52f60f3-d5fc-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652804215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+SLWDNDM900chpyBUlVFtLC/KqH7c87vTOavH25HHc=;
	b=RYskU5EjTV7bQ8dPI3HuiSK2Uk30Ui3g45QFevCxZkPp4YBkDqLbDkaaczr5r9xilCVkc5
	fuDwMrSjEmS2WPzd3vScG8JSiKI66gKFYPKJOzrXmT4oghzWF17DzynrCPrUzBg9LXAPqd
	a/2X7mywKU9yHctIY1SKYum5C7ZZQyo=
X-MC-Unique: uIE3w4ZqNyq13vbe5KGkGw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqxgMzSkhGfR6zzlFAPEpwVUazsRFrDrbZLIt7bXGrOcNYmjS2jho7fR2cGyPegkBMnlE7j4HFJFjU1yZQtH/ly2gK6r0S3utt5apKEhKoR2GIEp9GIF8QoODHjVfEJuEdTTswWcIbul8V6GiM2I1wt1/cXYSIeoCsVilxiDttXukPg/PHSqpNaGIsgpvdci0+tb+uM/bMD2O836v5oN4wg/g3NvLKaAcdOpyP3rQNLlItp6+XG497qyvwfz05+EbwLXmw3OJLnidSgbwLFHg4nEmUkMbpZWmh3wDl83s7siZd9EjnFspe1O2eJIEHpDe6Wp4Qxb1wtSWDtSVjK6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+SLWDNDM900chpyBUlVFtLC/KqH7c87vTOavH25HHc=;
 b=JuDxTOySUe/RtLqeQOX9EpwA0m1ZwflK+ThHo/KajoYJTAkX5hYUZbTv0LuwHgx96oPQM4Fp8K38ezI2hnI2gdtiAIYcTVbmVzW+U2WW/ZC9PQZ+RWVlirmQHCdoNXoY+5b5KaBwqvNuGoDzGZnvPtdAkNV5hLniT21n5RmN4v+SRQqNIj9Yb83EUsGfNwB635n4FYDeJdFsrN3OdyPLJgePslo4xLGvlF+kK6WnH1AQ0aSVyFufGIJswRu5NF+qpept3GbS1N3LMUr8aexWJeyp/174TASieY6Xome5wG81H/jkNS1IsUc/0luqmcwhbIhwUbi3rQHLtuDM+ot+jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ef3b2dc-ab14-d48e-6590-b35efbab863e@suse.com>
Date: Tue, 17 May 2022 18:16:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 6/6] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
 <20220510022733.2422581-7-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220510022733.2422581-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0051.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9eb676b-d3a6-462f-3aad-08da3820a7b8
X-MS-TrafficTypeDiagnostic: DB8PR04MB6794:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB67949BF2EB7EF41DDAB647FCB3CE9@DB8PR04MB6794.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P70Zq/uFtwhZphtDSVKaL4rop1rymO34t8GiinPLqg+VIKMhT6p1SHdM/JD5nYgZ8HJLm0y2UguErsgG6CDF3HmwOut/FdR2XUbLP6lk0hnhF0cht5ptXqsKQXW2ps/mVH7iR/vqAQaSZO2qbpkaZz8Ne79PgPs4oHCdIUCndbmUfiMY2XgQoULBF1yWUgwamHgqGf3SrxycOOuNi0Qe9ZqCnKQG9hCxvFbIWl6X9dc28OKSzBw1Z8pVduNoQGXp4HmUNlPrX5xWFpPi/VGe/6mfPr7Wngp942/0s6V5ALhvvbECom9nWTpZBnA9cR/4eHp6Sbyl0gyFjQmvnCynI7pPsNZ96M8yaIUBQZLcY7u3t3rigbURp4RPVN+RprAnnsL0BI7bTI8P5BfuF+GnSkv65Ci0abeQsSfslzahLRczkUyvs/tvRKhzTQZ/XXa+oT1YJs4CfUCve5mLRwP9KrbUp8ZT0U8sbjYQcScPb3VFp2yhMin8ZqtdgXydpS9kd6XZe9yAJu+HzBGTasdKkkvYbtiQi7Le+DGW1U5kTwCLWPa0uMObaR17wcmh3RLjyfEmF+j9mNz7UJklKrooW4k9lGAriMxHgsPNETkMGWu3s875PBr51B99bx8TN2rrrb+GZL9VV/2Nv2xoP2ctOiBjAGKjHhy6gLTH++dcB2YcNyArk+BTfzpIJTcWVIu5ZW28Db1xlYOyo94e/1ySnEXtFULFBGK//wiPv2MA9QA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(54906003)(316002)(26005)(6512007)(8676002)(36756003)(2616005)(6506007)(53546011)(66476007)(4326008)(86362001)(31686004)(5660300002)(8936002)(2906002)(508600001)(6486002)(38100700002)(186003)(66556008)(66946007)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjVtczBEUG9mSlVhcUZ3ZmE2dVdFOHBDSlBpMFgrT0hkMm1iZlAvYVM2bzJJ?=
 =?utf-8?B?TGNXZytmbjlMeHFXZS9PS05jWDh1T0t3M0dKU1VaZFUyc3dyb1FVV2kzZUVP?=
 =?utf-8?B?UzFiU251TlRFTExmNmplRldoZ3BhYjl1VmwwUnFCNXJ0VjE3OXg0RkxuRHNx?=
 =?utf-8?B?ZGt5ejNsUDFVTkI1eXBTaE0zVFdhendBY0NNZmhrNi9YenNiQ2VyMWFDd3hF?=
 =?utf-8?B?a1ozYTVocytyZFUreEs0RnlSdVppci9oUzVKbEdRa2VyaG1uZTlSVFhmdkEy?=
 =?utf-8?B?L1ZQdzc2YXlVTk5xSU5aOVZvR1lRUk8relZMNm1RS2krUmpoU0FLWXhtY2lI?=
 =?utf-8?B?YS9xdW85N1IwYzNZTlMxa0d4OVQ1VUc0SjEyd2diN0tYQ2tNcmpUZ2w3bG91?=
 =?utf-8?B?Ymx0b3U3b3MwSEV4STVoMy9ycjRlaXNyZ2ZpZ2c5UTRlYW9mWlgzYS9TcENp?=
 =?utf-8?B?RXhtU2lWck5VRDR5Z29FYWZlYUdVeDl3ZEZ1dkJob3Bxc3hCMk84Sm5tZFRn?=
 =?utf-8?B?cVFZRU5rc1AzUHlpc3Z1M05GODY2bi9aNi94U1ZnTlAzQzIvY2daaUNEaCtj?=
 =?utf-8?B?VFkzUXJtZndNZ1V4b0w2WDFkaG4vUHc0b0Uwbkp0aG9IcnBtZVpZYmdyVmxK?=
 =?utf-8?B?N21wR1lUS0tjdkZZN1FobzdzbGQ1LzVnTHRQdkNGSzBSOS92VTh2cU8vbUdq?=
 =?utf-8?B?VEhNMGRLbUhVeENVTWR1TWx1TXpxTWhMSzRCU0x3WVFEb3NTVDE3MkNJRTN2?=
 =?utf-8?B?OFNKam1CWE1qeDNkejNVejFTL1BQRjN6OUZ6M0J0aVNWZmhmcUZSTjBaWG40?=
 =?utf-8?B?Y012RWJMUHp0cVNBNFB6N2pLaCsyUUd4cmNMV2JENWh6VDMwblNtZFA2WVRW?=
 =?utf-8?B?NFlmWTM2OWU3MkNKcm5xaksyRVl5dS9uQ2lLTExMZ1dsWGFQa3huc2VQQU8r?=
 =?utf-8?B?cXJuTmVtOFkvRytYK1BmU1RlY0RVVVlKSm5NNGN3SU0yNzg2aWpHcGJsT1Vt?=
 =?utf-8?B?S3dNbVVSWkF3YmNOVzlVRWlueTRvS3IxWEZ5U3JWVVJ1eTl1RTM5eVFVVkov?=
 =?utf-8?B?NG1Fc0gzQ1JEeUpDWW0rc1UxKzd3MFN0TE9yb0NIYjFvLzNvTDFTamxENzcv?=
 =?utf-8?B?am5SOUNJUlErZnhHRDI3REozQzFhdUwrczVzVmwxeFdRV2I1ckhTbzVXN3d3?=
 =?utf-8?B?bXk3YnU4bHN0c2s5MVpKU1ljSlA1Zjh3RkQydGlzbmsvRE5jYWdQVjBpOGxB?=
 =?utf-8?B?aGJiL3BHcExzNTdSTnovUGFSU2lxTldKQnRvY3prUHRoencvOWZ0NzVkc1hq?=
 =?utf-8?B?cGh2WDhaTEdUeVFYbkkyWjR1NkZ0aStCMndaRWRLS2VKWEtQTFY0T1Jqa3M1?=
 =?utf-8?B?UTJuSnF1SE9xUjErNHNuVk0yOGxtbDZlL2ZrWm10OFd6bFUwajc4aWQrdDJi?=
 =?utf-8?B?TnNTcklsK3NoTFZYcXRVMGkxelpoSVJNZWRsVW9LSy9JQ0wzemwwYTE5a0JN?=
 =?utf-8?B?VEREc3Ria1JPazZrQkJUKy9yR3h5ckl0RGUybXZjem1NV2toOGs2MFBpY0kz?=
 =?utf-8?B?UFBWZXVCamh4czMvTmNSY21WdEJOc0c1bUJEODZPMzE3S3hkZGd3MjN4UERY?=
 =?utf-8?B?c2FPWnNmd2U2S3lkUnJhUGUwb3AzUXArZFZPYXZ6N3IxK3ZFMStQNEVxclVX?=
 =?utf-8?B?dDZDUGhpWm1zZ0x2VC8rSld2ZllXUkdGMVdCdzc2VEdDdVJmbEFrQ1RpU2hY?=
 =?utf-8?B?MW01c1RpeVBJdTdKeFpIMmo0bGlwSkxsRzNwandiWUMzQm84cGIxRG9aRm50?=
 =?utf-8?B?ZTE5cFFrK3dUaDJiSVIxK2M0Z25yMjRYamc5eXpCSU5jVXoyMjVZRkdJWUdT?=
 =?utf-8?B?bHNQS2x0TEFpTFd3emxuQ2RjckhTVUp5M0F0Y1FtT3RVSGQ0RTJCcjUvR0hM?=
 =?utf-8?B?aFlGa0FhMGZFVENJK045bnFLTTVoZjQ4eW5Jb0cvSGhzNmQvK2FvNmVDbFQ1?=
 =?utf-8?B?dElwUDVEVS95SnYyRjlsY1FOdzBsTEd0YXJPRWNtV3VZUmpDNzhIdDFkYlRn?=
 =?utf-8?B?d3RMblRtNDhYcTdUVzFGQjd0ODlEN3RseERYWE9rTVFqTlZaclBqaXRpdU1Q?=
 =?utf-8?B?ZlRRcUY4Z1NHY3Vkeld6VjNwMTB2YU1IQ0tSSUNUSmtqTlQ5dDB0SnZQUVps?=
 =?utf-8?B?aXpqWWZyYndxTDFVVko3WS94KzBnY0ZsQWViRHVhdGZNcXl3RkRRVXJ3YStQ?=
 =?utf-8?B?S1J0TFRUODNNVUlNYkVIZUUzMUV0TW1qdG4xNldlaGZ4a3pFdGl3cXhlSTl6?=
 =?utf-8?B?Z1k4VEdSN1B3d1BMdTlpdFJOOVh4SkxHSVRqNmVoclZUc3FjZ3RrUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9eb676b-d3a6-462f-3aad-08da3820a7b8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 16:16:53.1574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYiOTglClbuLxT7v8yF4X28hSLAtJuxpvIbpef6NPZQacC8PdW3r3R3zgdENLEgQIMCTaRPQM2tJE5Y8YVqqBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6794

On 10.05.2022 04:27, Penny Zheng wrote:
> @@ -2769,12 +2769,43 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
>  
>      return 0;
>  }
> +
> +/*
> + * Acquire a page from reserved page list(resv_page_list), when populating
> + * memory for static domain on runtime.
> + */
> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
> +{
> +    struct page_info *page;
> +    mfn_t smfn;
> +
> +    /* Acquire a page from reserved page list(resv_page_list). */
> +    page = page_list_remove_head(&d->resv_page_list);
> +    if ( unlikely(!page) )
> +        return INVALID_MFN;
> +
> +    smfn = page_to_mfn(page);
> +
> +    if ( acquire_domstatic_pages(d, smfn, 1, memflags) )
> +    {
> +        page_list_add_tail(page, &d->resv_page_list);
> +        return INVALID_MFN;
> +    }
> +
> +    return smfn;
> +}
>  #else
>  void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>                            bool need_scrub)
>  {
>      ASSERT_UNREACHABLE();
>  }
> +
> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
> +{
> +    ASSERT_UNREACHABLE();
> +    return INVALID_MFN;
> +}
>  #endif

Much like for the other stub function added in the earlier patch: If
is_domain_using_staticmem() was compile time constant "false" when
!CONFIG_STATIC_MEM, there would be no need for this one since the
compiler would DCE the only call site.


