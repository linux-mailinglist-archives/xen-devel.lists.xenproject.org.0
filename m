Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74E352BB63
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 15:13:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332137.555782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJUQ-0003xh-8X; Wed, 18 May 2022 13:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332137.555782; Wed, 18 May 2022 13:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJUQ-0003v5-5N; Wed, 18 May 2022 13:13:22 +0000
Received: by outflank-mailman (input) for mailman id 332137;
 Wed, 18 May 2022 13:13:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrJUO-0003uz-Qx
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 13:13:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49702c45-d6ac-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 15:13:19 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-hVbh9_QpOEmpUKYa_QLW3g-1; Wed, 18 May 2022 15:13:17 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4124.eurprd04.prod.outlook.com (2603:10a6:5:23::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 13:13:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 13:13:15 +0000
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
X-Inumbo-ID: 49702c45-d6ac-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652879599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2yJS8IWcSVkk5NgcsZ3It4BivFPZc+QsJI8JiY6QOcw=;
	b=GM5zIFCi9IXup53MzAZHocUtb5Z5t3wjrnmWqVeWKu7ZpsC/I4AHDAOE6gVMw1ved4Hiuf
	sAGVr9HfgQIZeXx2MQsOFb2ygDRd+PDKa71AVSEkOQC38CafIKV0o+CbKsAIZaJP4ZB+nL
	7r21HQdMltQzjGbATl4YlY+YQ98J3Fo=
X-MC-Unique: hVbh9_QpOEmpUKYa_QLW3g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAGt9aHPh3w4JLDknew2uQkPoim1Seh9F7KOo+vidO1mC9z1+QbPQJP3MEILaKTbq9NOamnKUGBTNtH87S1CrcPF1mGYn/8sCdzbPxn7Pjsmk8nLBZWi/8xqALiXQX48NbK/pXfrNRn/KzBm6SXawe3Y1C/Q4CX7ejcRQ8BkLvstd8AT3SuoBPP+vOR/FmEulLm2lYAy/YfXSP46F8NWQhao+m07tcuDU66nDdXSEeKD0XbO7QTAUvV5sTuyTuF8jSFow1e8d+QmScqaFrK/ngDWMlgP/ORSyVJzoUiReWK67LfWMo+R9xrSS/0YqjoC1w1QE/xkkfKmW6IgDFGtSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yJS8IWcSVkk5NgcsZ3It4BivFPZc+QsJI8JiY6QOcw=;
 b=P4qKHZ9ELpC8Qd2RFJluDE0iNp+YEYVHJO9/NRdIBzQodPd1sn00VvxBu7DWFe+hVep7YwhNzAK+ZPJrtuGz8RmQpeFpXEA/6Lb+HRDVAVpl/fi5/WXuisnFtG2N/My5Pca7f2U1Z84SyrCRTHjpjna1j9CuwKaa+jlo+jj1O1kizR5BhJdTgNiw+TB4uUKu0DUCmtqNpn8higmqt3+gEpb+mZcCU5xAMPVdwnAxf91rQx5tSyVSndquykE9Te/TRbaeGWFWozpO3M8g82I055JcLHJjlr/px2h0w9IFb/jjEFJLZS7NGLq1pj9ngbt9r083+RbuMNYuwcQuZmmLUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ec9424a4-de50-1293-f4a9-f61b4181fe4b@suse.com>
Date: Wed, 18 May 2022 15:13:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 7/9] xen/x86: use paddr_t for addresses in NUMA node
 structure
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-8-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220511014639.197825-8-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::44) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d92fe547-61db-48ef-f138-08da38d02ae6
X-MS-TrafficTypeDiagnostic: DB7PR04MB4124:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4124DAF0D7D19DB9E515F974B3D19@DB7PR04MB4124.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m94Rnk7Gh8Ml16fsJo3p4p5tL1GYJH9HKpVNV4PBg5bd9qecXEnFqJ8q9/dUui17G3trYro7q4bYDMBajvNd9ezaf7yrnz2Oxxi465HORoM82s8PSKvBByQkucP/2gSwPeCvJWkkNgjFGlXUCMakmzDtGyk01UhcB/Kus4hoEWcJRyW+KjdGtQHH4p+2k5Fy/tTf91m0O3EwD2Q/b3hP67ux9sV4b/KP3VpEcnzPowYzMbaCITJA6lQDwdQLXXVuQUrF0T1gN8S3stGs28Cn5bJhUja0s2ic1sIF99Sk0NqfTvg4CbjBHejcqp6G1xj5qJkrynfCKrckKWgY5vQzL/S/hMqhewJuMupt+VAxaoCSJClsrfhtZA/ZJVmpJYeFBZSIp4d6zHO17+b2a+PogIM6BmHcWq+K8id4AWpklUvaY9HXD6Re9oJyVHPbIfNqxVcAxKybJoeJr2qgp/WluRecifhglzPJww2/Ep0Hk/R6fH+aGcKUCZvEdD8hAED5HZ61s7g/KLFrWjUla+Fiiy2MgFuI0lMZXh8yUrG4TH97PRMNw882MGLxA9cFZ3zLJM+ZcK/ipNVgMHRAX6RWMCukqBmNnClQZuuzzi3ZxVT7hx9ipHbwIvLcOFSsAE5MYeUljCbDVzpHvclV2JuPQBy9reEVRMIRz8kYikI6kj8aT99NDFthxKK/HahSAELgb01vOo9CPG7+z1hzzhgBA5NX48ge4D2lxtxuu/0b+hI3bouUJ/3oC295rdfGmYOq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(8676002)(66556008)(6506007)(316002)(66476007)(53546011)(8936002)(508600001)(6666004)(5660300002)(83380400001)(2906002)(2616005)(38100700002)(26005)(66946007)(54906003)(6512007)(36756003)(6916009)(31696002)(6486002)(4744005)(4326008)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGM3dXNPcVpRUEYzZkZlZ28zb3hWTUplRHJlTVdmdUpyS3FlbWVObHFkQVlW?=
 =?utf-8?B?NHdDaDhFK0RxNVIvNVpKVWxWRERlTUJzdG9ScEloVFFKMFIzdXVzUUFLY1pi?=
 =?utf-8?B?TFVFbHVwT2FrWmVka1MrVUU2ZWU4MUloUVFoWkNZeGowQnJzN2htTmYrTFNT?=
 =?utf-8?B?NWJKWm9jbGpwM2R2WVpzTDBSRitLZzNGdTFHcW4zNklqNXFkUFF4ZjlBNEp2?=
 =?utf-8?B?bUh2VW5qRzBJU2o2bm1wcEhUTE5IQ0g2Qk42WVhYdElkeDNaTnpkaktNaDBw?=
 =?utf-8?B?S3dYUkU1amVSM0RFR1dhSDRXenR4Y0cwK2kybFNGZHhCVWIyL2RoTW15ZTVv?=
 =?utf-8?B?K1E0VDRvQlhHQy94b0NNOEd5OW1KOWg2bkxPTE9oZjFlZVpDdkhUdTBQSjBY?=
 =?utf-8?B?RjRrUnhkNWJ3Y1czWThTU2dTM2FndHpmNSsvaWlYYVhTelJVVUN0L051VWoz?=
 =?utf-8?B?eXFFWFhjVHpJOGdVM3dNM2NnV0wrbGFLTkhqb0JqUmpLT3A2cG96VHFzMGNB?=
 =?utf-8?B?WWtpUFRlQnJPa3NTZzVTalhaM24rcnYzazgvclNTNmFHeHB2b0p1ai91WlpN?=
 =?utf-8?B?R3lpdW5aYTd2a2ZnK1psalkzNFJ4R010VEh2b1dVZWtMcWxOdEYxYlFqMDJm?=
 =?utf-8?B?djQyL1N0Umo5M29oSk10ZlNEMThGRVp6RklVZ3JBcVB6S0NOQ0k4Sm8wOUNo?=
 =?utf-8?B?b1VhRUxEUXZXSWtwb3Q2cnh1dHRGK0RiclEzbEkvYzg0OU5CNVhCaytHTHRT?=
 =?utf-8?B?aHlkTU5yT3BmcEpPSmNsbUFkOXlIUW5RdmVXYm5NSVlLcEtNMFducmJCOHo0?=
 =?utf-8?B?WlNKcDBSY2xudXE4UTUxeVBqRlExejFxQWh5L2c3Z0VCWjFwaWVJRG9BSW94?=
 =?utf-8?B?U0hOTHVRamgxdHRRYzJCbGE3eTN0T3p5UlNxSEZKMVlVcndPV1BCZXhUU1Zk?=
 =?utf-8?B?QjNiL3MrRk9ZbGQ4RitRbUtIclFqQlZRR3l4ZUx1NnFMWC9za0ZWdTA2NVN6?=
 =?utf-8?B?d09BNWptYVA1WHkybXo5ZHJOQzdGNEY3Ylk1T2dSTmdZc2hDY1I4Z0oxODl0?=
 =?utf-8?B?MWxkd1pVZ21pN1I4VjBoZ0F1VHhVaFRSS1Mvb3VWbEg3R2ZwbUZKYk1hUk9y?=
 =?utf-8?B?UE9IMXFwZUVCWkh2TGZYV0NSQ2IzZEhIanNjc2xmRXExbEFReEFpR3ZrT3V6?=
 =?utf-8?B?ZWhYRnlGbFdydnNzdnJ0MmpGMkRQTmM3ekEwWWJjTTcxTEo0R1hKbStpNG5T?=
 =?utf-8?B?VDZuR1VTREdkMXdncjAwQjhIelRIQnV0cGo2NTQ1OERwRVdZRkNjSWppWVRv?=
 =?utf-8?B?R25uSE5wemEyOTNmWjJJTVlEM1RmREVCeTdCVE1SeXJLcVhpM0JJbnRjQmY2?=
 =?utf-8?B?Zm03UlVlUDJ1a1VqaCtCWk0rUnZ3U1NPcC9Ba1FCcFc4VGxsdTAwZDg3ZmtI?=
 =?utf-8?B?K0tBN3hqTjNVTHcrbWZLQndnSUc3cDB3TVlnTUo5Y3h2VWg5Nmh0RXdyT3Ev?=
 =?utf-8?B?eWFJN2xZQ3I0aGFlQ1p1cHpDMCt3Sm5ZdERyeW9tSU0yU1NrRDV0NVZFVDBw?=
 =?utf-8?B?cmFqOEdRcUFwVFIzUkcrRlRJdUJNQ24rdG5EdlB3cllYWG8rUHRFUmNrSUZm?=
 =?utf-8?B?WDhMODJvaHpQNXJXUDh5K0tiVjBVc05NaStpS3pXVi9NK01wbTc2UmQ1ckhP?=
 =?utf-8?B?SDhaL3JWZEJ4THFGem02Z3VaOXJSNytoSlgxWXVCRGNSZS9hL0FpdUd6SXNr?=
 =?utf-8?B?RThYWjlTVC9FVk5iQ0Y5ak8rd1h6bGhIdzNqVHpTRDFtem14S0hGODZ2UlMr?=
 =?utf-8?B?Y1EyQXdWN0tyMUV4VXhDRTVDbkd3WlRwRi9CWG5SNDQwRWVEbEtFWExMY3Bn?=
 =?utf-8?B?c2NOTWRxendYR2pwaTZYeWg1WEIvM3YvdGFWY1YwMnZPdmR2QlNzTDJQSWZo?=
 =?utf-8?B?dWdsU2hGWDlCZ1NEUDFkUUYwUWVWSVN3a3hHalR4SnRUbWk4VU1jbWNQM3Vs?=
 =?utf-8?B?bmNtQkNvTlgvb3ZpK1ErNjdNby9xU21iTVBoS1VWS3pVd0ZQL2ZIY2tqQWhW?=
 =?utf-8?B?cnVtMmt0aytiZEo5bWMwdkU1L2dYTFlGa0JOb3dHaTk5RG5ydkxUdndPZlRV?=
 =?utf-8?B?SFVHTmZLUUZ6QzA0S3R2eUMvT2ZDazNxeG9KajduOUI5MXIzL3d3MkVZYzFF?=
 =?utf-8?B?WFhMUGgramtkeEtVSFZQbEY2bWVYcUhodmdpL1AwQTlET3ZPNEE1eXZVcWxF?=
 =?utf-8?B?N0V2OWIrZTRWa2FienZidTV4c1FLQlNOZ2xYUTVvVm02STV6MHdFK00zRlhU?=
 =?utf-8?B?QVVnN2Z3VmR6djlhVDhJZDFBWEM4Q3l1SGE0eWw5Z0xsVXp5bWpiQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92fe547-61db-48ef-f138-08da38d02ae6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 13:13:15.2040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtbJz2l4E67s+UQGf4miPWM/NshasYjD8ml7YQK/aqRRw/KTqG/5q9ubUj+XAqPD2nKYzmpQIwh/JBNE8G93fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4124

On 11.05.2022 03:46, Wei Chen wrote:
> NUMA node structure "struct node" is using u64 as node memory
> range. In order to make other architectures can reuse this
> NUMA node relative code, we replace the u64 to paddr_t. And
> use pfn_to_paddr and paddr_to_pfn to replace explicit shift
> operations. The relate PRIx64 in print messages have been
> replaced by PRIpaddr at the same time. And some being-phased-out
> types like u64 in the lines we have touched also have been
> converted to uint64_t or unsigned long.
> 
> Tested-by: Jiamei Xie <jiamei.xie@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


