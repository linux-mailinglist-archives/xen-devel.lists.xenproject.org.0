Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839F54CBBC2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283113.482020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPj5Q-0004ew-S8; Thu, 03 Mar 2022 10:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283113.482020; Thu, 03 Mar 2022 10:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPj5Q-0004ch-Oi; Thu, 03 Mar 2022 10:53:32 +0000
Received: by outflank-mailman (input) for mailman id 283113;
 Thu, 03 Mar 2022 10:53:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPj5P-0004cb-0o
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:53:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 290fc58a-9ae0-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 11:53:29 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-TIiGH9RrOaqjdpN2MUggHA-1; Thu, 03 Mar 2022 11:53:28 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR04MB3222.eurprd04.prod.outlook.com (2603:10a6:6:6::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.26; Thu, 3 Mar 2022 10:53:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:53:27 +0000
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
X-Inumbo-ID: 290fc58a-9ae0-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646304809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKs7L7BI8yKfprv/IaPIpHmgDddE8nqaz0aAd/uQNFM=;
	b=Q2A3NjwhzfrH8ixIQe/gOaRpTfWwzrIjK5EhmUFrhybMW7eNoAA1NUrM7RIL2I7SWUjhAC
	8e5chlj2iPAxu+kK4zKt8BhKMxIfaEcw0RAi5ck47X5QZFiYgRm4YH4+jVDjdDKXOFR9Fh
	qRSCTdGH8iQXVm14ZZ29kPS9Kd9XN2A=
X-MC-Unique: TIiGH9RrOaqjdpN2MUggHA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtQdsggWqF0VOh6SOblD6rzHAYX1Obk1/y3OKAUDE6JXXilPXx0Rh5lbPWzvR6H6PS/Z7arlSHe6VcPmi0kxTFfv7kUTGb0/EeXHVMHBiUouxZCBMyRX1Bu6lnS80I8wg9Fdts68j8B4evkU9aIqB+aXLDS9zSBhJEHNKwdxFmvHinNXklPgAilkUpwNdmeuKh6oSaj95lD2isnBvFw5JvTrlqk69A8cafK9Cip18Unr7a5GOwFS/26Aj3MleEp3pIXCSNWZ/VhFsjwflOFnjtzZWAVQsJJ8pyAvG6j+3IUkoScmqX3bFCcZhxVm/a04rrz+jiogFDjcWTTQHIehBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKs7L7BI8yKfprv/IaPIpHmgDddE8nqaz0aAd/uQNFM=;
 b=EUWeFAdMALIoqyNh5x/+prMbR+Nh2vuI2zLKVBWsG/S9n8dEM2gzdamEJWF5C5p2jTfvcx0+92oFR5a4hgRB5YI1X9AWJ2uKgQU8X3bqSoQsu8sTDGDhfQyENsL4yScRB08ARrqPaVlPPW5VLYKes4lo7rPb4B4tZUqyT+vetcOFIKWjJH/GHEceFrImoncarQyjDS8+RnfRIXrPZ10VYDakrhAMGCCrB7vRgc2fkS+vaVGSdtDmH+nP+6EPUF1AVuGytc2QKRFEcsb+5cDHoSN65h81CtLeh5VvgygPccsgFP5JqMs65/cU+bL59MYUdr2LC5q9XVQWk0NxWN7K5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68c7236b-4cde-2425-bdc9-858169f95b1b@suse.com>
Date: Thu, 3 Mar 2022 11:53:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [XEN PATCH v9 28/30] build: specify source tree in include/ for
 prerequisite
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-29-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220125110103.3527686-29-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0021.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb61b0e9-4773-494d-dbb8-08d9fd040bb4
X-MS-TrafficTypeDiagnostic: DB6PR04MB3222:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB3222BE0F24A2C68FD98D5660B3049@DB6PR04MB3222.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pcp9nHEOBAVgUAiHMCuCr0q/Utd+mb7wRkOeF+sa8I8U95AifhERmGHBeo+EduM0nv3ClZevomZjwJ4m6G/U3+36LtbXbxQRM48hUYBHSaiABwmt8OfLP/HqlPRmWxPrdLOIXxesyGNA+Ql1uoYl5zcTy9zS11uSfHulSv8GYWZ853SEwk1tj0r6aw/I4ZUKssQHEeztcHe/7C7OuKD/oSI0ZQA5WsbVq+DdC/e7UlxGvEnuoIjKuHrV41BUVddIsHg71kBZ+q+Hp7CLMdA2O6YGo6xb2hmX45FKjEIOJXt7/CPrqq3woHqnvfwNupucDAE+GrK4dCS/cGR+96QTeAtgjBhK6nBrZG6fHxkS+/QRLxTGgVLZbmDfTgtH9mM9twDWFvUmudbABhzn5vptG9YGmuI659hLyQl0KV0LAMbpX+fkHbqpfhGolqP7Hte4RY/gmX3JBKfOtLNSNKcJChyW9x+rSZK+grrnc3hH3lbAVAnHofdzwtWppWWGwOuhlubVSotRDR+JuWbXZ8+WFexrjcl5UzHDRlXV2UJbSbzdTdk0zsQY2qG1LJ1AoU1qdcdlyfgS/uFHQihEdSXiyKKnuQ7SoDGH0kChX9sFwkk/8x56t0+0TncaXUV0oJCamrumYZiUI9IuVK43D8Uy5sWZb7rAo4NkmNA/fvUPErT4Z3DcHN3zn7LYvCC7P1ziDSHkeTe4S0/zR9rWsyMB8i6QRWNMMCtqXFnfyt9EGs2RPvT9Pfl7HZrbg3B1nL+r7RyjKbgLFcvHjrRX2WaobB93RHvLza+5d3vRqUI0v2T7DrdcbE1G3kc2bY7Dgips
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(2906002)(31696002)(186003)(2616005)(26005)(5660300002)(8936002)(4744005)(4326008)(31686004)(86362001)(6486002)(966005)(53546011)(6506007)(6512007)(6666004)(508600001)(6916009)(36756003)(66556008)(66946007)(8676002)(66476007)(54906003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3FnVE9VTjBwVHI0Zitwb2puKytnMm9BM1NoQm9RbUdWeENrYmxLYVYwZUVs?=
 =?utf-8?B?TUhUUzZLRHFrVlR2U0hzWHRFK2tlY2RSdUM4RWV5RXlqWlI2aDZqL29xZkYz?=
 =?utf-8?B?b2k1SHpFZ3FnTFA5TzJLVU50d1dOVklrcFR4WWZvM3ZMUTlING1reXBKMjE0?=
 =?utf-8?B?UklFTVR3ZGFuMGE2TE4xdGFVVjBzQWJtdVRQSjc3U0NNN3FKTzVhK1VhMTJn?=
 =?utf-8?B?cTIvTkJkT0VKSVFTeUJ1QldoV0NFUW1GUWFkMGhIZFVSVEJqeWhjVDBPT3Zm?=
 =?utf-8?B?OUZRejFBZGd5QVR5Qk9kUS8ycU4vRlZlNUNkWFI0R2ZkWnRXZHdSMElzT2Fv?=
 =?utf-8?B?dVZwb3F0ZmUzN2huMFV3QzEyZ0poemdKK2craEhYR25NVnpWMlE0RlRyR0lZ?=
 =?utf-8?B?d2ZJZzlRanFiRTIvSGxZOXpEVDY5K0ZEQkJkeTNSU3VSZDl0ajhtZFNPcFRJ?=
 =?utf-8?B?a010L0FSNUlzcmtVOTREZnpSbTZ6UVlzY0E4TDlSYzdzK2ZndHRicHJjWUwx?=
 =?utf-8?B?U1RzMTdXMlpUR1orRHg5QkhtSnVtNXVudTgrQW8vekxJRU5BaVluVU5JVU10?=
 =?utf-8?B?azVOTFNWRWN4WDQveUg0d2FJV2V3QWozbmxvWVllR28yeUNPOCtzNHloVnJ6?=
 =?utf-8?B?SFZOcjlLZDFaaWpNaThGZUV1TVZYZFVTem1Ub2hDUTI1RExVT2ozeW9WbVVh?=
 =?utf-8?B?NFNUc0Ryd2tNeHNNMEJEaGdXMnZFVVlKRlpMZWF5NzA0bWxNUFRMbStWRCtk?=
 =?utf-8?B?d1NQb2pwUmRnS3FyaUtrbm94SHB2OG82eVRxMU9uT1YvNHVmcUNuck9XcktF?=
 =?utf-8?B?ako2UUZFV3BLK0VxY29KTmYvSVhsWmJSYjNhNjRvU04xMTM2a0dFZ2ZsV05V?=
 =?utf-8?B?eFR3QlN5QkRxSXJLUG40SnlZcCtPd3ZqZmVWZE92aVc5eFJDdHdzY1RwQWQ3?=
 =?utf-8?B?Zkdna3VJbVJaS3V1M3lxek84dnUxTnE4dUJlMzE3cnh5OEZ3aTZvaGs5RFlj?=
 =?utf-8?B?Qy9rVm50UVp2YzZwSGhtdUJBL3lzNnlsR002elBPY2h2aWdSNVl3ZVk5eXRl?=
 =?utf-8?B?Ykd2ckNGYUFpckVWekRHd2xib3JSaFJUaXFpVUFqcFg2dmp2TzdBeW8rRHln?=
 =?utf-8?B?RDA1bjFNTjBMT3RFWnF3YXJDeWRMeWJxUURoY1hVdGdqckdMOVhyL3hwZS9p?=
 =?utf-8?B?MStBV1QyZC9lb2txTGFjNTZ5M2dvNU5QaEN5Q3BtSmI4THB6MW5CNi80Z2tT?=
 =?utf-8?B?Q1pQWjY0SHVnY3Z6a0Rpb0UvNkRSMmt3VHVKVUxVeERGbFRSemplVWJHenRC?=
 =?utf-8?B?SkQySmlBYVR5SWxiZDVtWmxnUGRzbzN4UklHZjJNV00ycEhxVGtIaFEvZUVW?=
 =?utf-8?B?aGptanhQZUtSOWZwbzZDbmJBdDdKdUZRMWNSRExPRXZPc2FYeTROQmhUclM0?=
 =?utf-8?B?VW9YZDcvdGFYdUN0djFCMDJLQ0FnY0k4L0x0TVlzYS94OTdHRHAzS1J1MW50?=
 =?utf-8?B?WUh6N3piTThWWmRFMDY5aFRyUXZkOWxRdWNiOHNHdkZHMys5c1ZuQ1JwL2lu?=
 =?utf-8?B?QytKdW8yY0NkQXBCbE94NHlaRWNKZCs2ak5uMXdZTE05NWh3R3ZNb0pCbHNj?=
 =?utf-8?B?OVFPaGlOMFVQUjBnTWlCbjFNZjVKYWphUEVEb09GcUFOQkcxTTcybEg3ekhx?=
 =?utf-8?B?NHd1UUhveUJVNzBTbjNObGV5YzZKcm5BR3VkNFRDM2NCbjEzR25MYVlOOWJ5?=
 =?utf-8?B?SWhJUTAzbWFwRStPcVRTSVJhMCtxRDZ0L2tNaGJONU1mNnZzaUFmWURUTXlY?=
 =?utf-8?B?bnI3UVowaUNFcUFMV2d4a1gxNFZjaStwSUdqNThPSU12SzkxVVZKZHVYcDEw?=
 =?utf-8?B?VVE1MGxDcnBMT0VReVRranJJYlJnT1piNFNmMTZHdndpYlprVEc0L2p4NTBN?=
 =?utf-8?B?QjNpNkR6SVptRlQxR3FoVXgzSlVnR3NkY3VGcDRNVVl5UWZvY0RWWVpNa3NW?=
 =?utf-8?B?NkZWTnp2ei9DSzhoQkY5TzRBSkQzWGJrdWZndlVrR3pETnRPaktOQkYvdHJ3?=
 =?utf-8?B?cnF4MDIwUFE1QzY4MHRNc3c4Z2VaOXFGc3gzRUdRK29WaS9DNDBtVU1VVlQ3?=
 =?utf-8?B?QjdJR015cUFxWGJpbjZZaVMxemVJOWlKL2l1Q0pjVzZyakZUZ1dNNFFuTWQ4?=
 =?utf-8?Q?AN4GviwkUTCQ9U0DbAFM4uQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb61b0e9-4773-494d-dbb8-08d9fd040bb4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:53:26.9609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alW3BH7YJPtsnY2ZNy85NAJYZgnrLkGS4uF9VSa2othVGGtbEkJLe5unwoyaaEqLRs36PRShypZh+Y4YdtgsZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3222

On 25.01.2022 12:01, Anthony PERARD wrote:
> When doing an out-of-tree build, and thus setting VPATH,
> GNU Make 3.81 on Ubuntu Trusty complains about Circular dependency of
> include/Makefile and include/xlat.lst and drop them. The build fails
> later due to headers malformed.
> 
> This might be due to bug #13529
>     "Incorrect circular dependancy"
>     https://savannah.gnu.org/bugs/?13529
> which was fixed in 3.82.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


