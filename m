Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 339F544513F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 10:37:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221391.383084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miZBK-0000kz-HR; Thu, 04 Nov 2021 09:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221391.383084; Thu, 04 Nov 2021 09:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miZBK-0000j4-DW; Thu, 04 Nov 2021 09:37:14 +0000
Received: by outflank-mailman (input) for mailman id 221391;
 Thu, 04 Nov 2021 09:37:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miZBI-0000iy-Vz
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 09:37:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c97847a5-3d52-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 10:37:12 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-j1WIS8WONxm9crx5hvZjOA-1; Thu, 04 Nov 2021 10:37:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Thu, 4 Nov
 2021 09:37:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 09:37:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:20b:92::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Thu, 4 Nov 2021 09:37:01 +0000
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
X-Inumbo-ID: c97847a5-3d52-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636018631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6b4ENUkGgzMC9YQ6UxLJ/5iXzLycEhm39PiQJbawDnQ=;
	b=Fi1qeLBFga3DO5y1PVULEfav3qaG+EA4lGa1G86wDQJChFqmcIF2+ACrwplsGp4GM3Z7qy
	lXovW+DjaqIrlGLCgzzogNvV/daYj/16I35nTLzS3n/IVAKVAjGvgDjSS29gx089CLuyNq
	ig0K9xD9eVs0M/WAgk/8boswULj9yQo=
X-MC-Unique: j1WIS8WONxm9crx5hvZjOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGbAMJBz/OwfU46qpzR9xFnoZSOjXXgiqNYvXHBlX/tzIH7MPLnt7dNk6E7yri7P2ovFtiHoO43c7xMr8jVuYqKNdDws3vItq+FZYQXJFNl71F6hA1m62EWlHJVOGawDZS7+Br/51qP6LvLMpb48NfqM5pNYXNM15zydHZZ8v22Hx08HBBvB44CI7AGw38vDlQZg6qBYoDbHXOwThtncVAoYkLlgpKYCOdNCuivSAwf7QI+wVfauB48P8i4aDDMRNFwPAy8ZoqWSJKtLY/txtNwFUo7viMwzri3DwOAVrEo8DmaP6o7v2ur89tS5QIrLPTXNAI3TFidYLr98EuQsdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6b4ENUkGgzMC9YQ6UxLJ/5iXzLycEhm39PiQJbawDnQ=;
 b=JwNLBgv22ZqNFOeuXyIaEthbFY/c+4MJsN/l2/CSzVnNhJmU1wextrKp3Dotn8kHM2ShRbgKzHrydGbaj2GT+QZb6PAzZ+CY5j0xZzxoU6GYGpXJI//cMbamewVjUfYVHUBF/wZoIlBiQTc8zw1X/cO6Q+OUScepYQgkQldAlqSsv37lYv9aijAV/C+GIeyorstJA6jCDMJCZN811B1lNX5J6DFqE6rYVTBOvHkwZU7G7KSCtbzImBEsagoonf5hbQCGVOG06+XGsFtENX5QYdp/FNdKKtDUJgjh/NObWmDPaJBV8M/whZJqh+pbvZjQPXdbalM8kPM3GQUMyPsjxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac2ec244-b857-f785-0488-c46021bc4cb6@suse.com>
Date: Thu, 4 Nov 2021 10:37:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 15/15] tools/xenperf: update hypercall names
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211101152015.28488-1-jgross@suse.com>
 <20211101152015.28488-16-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211101152015.28488-16-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0029.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22bb06af-6657-4e79-f5f8-08d99f76a7f2
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6477D9EACAC677B05BCBB009B38D9@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/efSAdHZ1T9QFOEqpe2dXaWgCoX5MtKl+T3WWB1nsdPRoYi9Q69S9RudloNB60juscxQD6uepHaFNKpqy7AxRQif54vzvJ9ULxG+wNbIsEXFSOPaeaajkiplAt4p3u99BaRYybrLgZlCOGfyosDh/QKcqgGHDn/z/jIrAEIdQIfnCN97bsTyAto1udW2lpRglYnKgcRUDBsdqgF5G7x0zP+/eQYVukOqfs6OBVs9ZvCM++Zosm1lQJovaFv9BjYOIK1fe5RB3rAZsESTkNd/sdZvjild/eSHLIIN3jUdl17zmb+SEolvG5x4f3eI4bi0VvQps3d56JBz1zG4y2kHXWj6TTIFfRXvUmcEVngJoil+HBF3z+9u/EpEJpemqyWmbFBxzpbjGL2AJtsV1HLSGBp1nhE5KzMTbo7VCcmiUTAAi0dv1KK082gRGD5pCqNB6HnSc3FKj1xzkYKD7DcVeSQEX+rOxKY/7IMz3clRu8wjSw17qxDhHGzxcrYTbMC4Eg97+liGdSlKBuwaCLZv5kyekTqfW7BhljDpBtFapMDpnoTQLqCdUYX5AUppOj0CE08D2UzzV5I2KbVH5/dlvFjTBfQCOoxkXvu9n/MOcM6+kgSyyuuvNm654JzArKO6K8Byv2PS/1GFBd05bmg2B4C6Wt70f09pceZ5l0KkZ90bH85Ch3p4MCy0sbiCsmYLzdg7clNg0LqzDVrKQXrGWS76FNjI/2iZNfWHQ3QShX5oAmD1lNyQNgvTOqHgQk1q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(37006003)(16576012)(15650500001)(31696002)(54906003)(508600001)(5660300002)(6636002)(26005)(4744005)(86362001)(8936002)(956004)(2906002)(83380400001)(6862004)(316002)(38100700002)(2616005)(53546011)(186003)(8676002)(6486002)(36756003)(4326008)(66946007)(31686004)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlV5bSs5TkwzVCtwVUVDVGo3YTdleVc2SytMYmYrcjhpcERZZFh4cmw4SThI?=
 =?utf-8?B?OFRUOGVaR1YyUnNidkUydXNxRFZ1b3VUbHlnQzR1WUtIM21CZy9iRFpPU2xs?=
 =?utf-8?B?cmtTNlYyQ1RkM1lVbHBUU3BqemdNbE1za2hkVHo5WHJSZGVPSlB1QjVrNHdp?=
 =?utf-8?B?MkptNkg5VFp6UUxLQjJrdkhCVGk2T1Q3RlEzeE9nNENjR2EzSGhkQ1A3WkRi?=
 =?utf-8?B?WXcrNmhOSEI3N1h2WGIvWU1rOW5zSzdSQ1Q0RDRQSHJWUVJvdWdlK0xBSXV0?=
 =?utf-8?B?Zk0yTVo4YVMrNVl5VDFoVWprVDFyOWJWWnpBSCtJUHNOcG1CY1o5T3ZhLzRo?=
 =?utf-8?B?blRjWmhLTXRVWDJjdERSZi83MGxjcEVKeWN4Mmo4YUhNY3BNMm1FcVU1M0RG?=
 =?utf-8?B?WU1LQzFRTEpPWDk5WlBleDBhVGRnV004SDBPSEcycW1HbHdnb3R4NHBQS1Rw?=
 =?utf-8?B?UE1DMDFxLzM2b1dUaHdBdFZ0aDAzemNPRWoyNDhlZGRxMTlVUmFIa2M3NE16?=
 =?utf-8?B?RC92RngvS2lxSGpHRDJkTmQrV1UyUEljdnRmRFhUdGk2RjNvbi8vUFVRUUQy?=
 =?utf-8?B?KysyQ3BoWXR6M2RxZnlUdXVPU1pRWGMzRUNTVlpKYlh3TGJUT3BYeWRyM0RY?=
 =?utf-8?B?WUpKNjg5dzRZQVRhcWg0aUxKNU4wMngvdjJVaWFPVkZVMDJwQmVCKy8rTXdj?=
 =?utf-8?B?VUQ1WUkyWG5iWUZSdWFua2lITnhGMi9UaWUvM2plSUtRTkZPN25TUUs3SEh5?=
 =?utf-8?B?cDJGL2tUb2plVWJqQTBzdldDenRRSkZsL3JkTm9ZWGVwUFpoNDl1ZXNFVTd4?=
 =?utf-8?B?MXlWVUc4KzMzQ1B0eWtyK1lxc2hDNlF6aVM0MEYyZ2UvU3FwTXdEU0hwejNM?=
 =?utf-8?B?Qkg1NXZ2SUYzQnhBVXVzejY1ZHBUampDMFhWMkNHVE9HK2hJUzkwcjdFRXdP?=
 =?utf-8?B?dlhPWE9KamNTY2VCV3JUbE1HdUJHQnZIWHY3WXVxQndES3FublFwdW5zaWw1?=
 =?utf-8?B?MFlDTFNXSzdlZFV0TEdsbWZYVXp2S3I1UFBpMXkwQXRzVVVHT0hGdGVoWWhK?=
 =?utf-8?B?OVliNEpDTitDTTE1S2pDNVM0Tlo2YTNEb0NvMXc3cmdodFZtU2x1OGFraG1o?=
 =?utf-8?B?WlpHcGdQYXQzZXQwN1c2dzV6WDluNjNZc2ozUHRFVE9MekVmcGxvd2tHVGZq?=
 =?utf-8?B?bW83L0d0ZHJpd1FPNzNJek10S21yUElLYm0ySU50QXR0Q0xkaDRJRm9sN2p4?=
 =?utf-8?B?dzFkTWQwdEZXRVRLZ2M4TmcxQSttZVlscjdmbHpWTjZIYWd3R3laTWhCbnJX?=
 =?utf-8?B?aFNPc2NKdVBvZ3NMSmIrNmE4eUsxN0FOSHJVTVFJK0gyYlc2RkJoS2E2QzdT?=
 =?utf-8?B?TFk0YnlabkpjWG5SV3lPcHhJUWlQL3hBUTJCemdvQlliMitOaXpsOXdhVDIr?=
 =?utf-8?B?NlhUVEF6eXpvUkxxQzhxWGpMdmIvUXBlbnF0TGRWYUxFWmFpUFF2Y25WYXE1?=
 =?utf-8?B?Mkh5a041dXRKUEJMK0w0UXdseXVZNDlRdjlmVlMxSTNNamw2TS9nVEt6STg2?=
 =?utf-8?B?dkJyblMrOE43cGxuS0VRY2hkbC9NSlJQb05keXB4V3R0SUVVQmc2UnRhUGJG?=
 =?utf-8?B?UlkveHVBSUMzMk5NOFhYZ3gzVXdiS2sxYlB6ZzU5WHovczRhMlAxem0wUWp6?=
 =?utf-8?B?WksxNXFscWFrcVF0UmRRZThOcTRzTjdFcmtmaVZ1cDdUdndLKzlETklTYjhi?=
 =?utf-8?B?WGxqeENhbGVKd0Jlc0JFc2JxWHJaSkYwQkNuUTlTcWdlcWdWbFZOTUZmbkZW?=
 =?utf-8?B?elpjTEZPTU1ScEpoOHhNcGUweVRjUmtNSFpYamxoRGZRbTU4SmlLdFYvaGg5?=
 =?utf-8?B?bFFGSmxnRS93c3B5dXA2RmdVaHRKVTNKVE5PR3F0MW9Fb3NRQUF6dnF2Sllk?=
 =?utf-8?B?WW1PL1VXcmNHb1EvUXdUV0V4MmFYV1ZkL2YwUmZxRDdMbTNWYzZGMmY5REd5?=
 =?utf-8?B?RVgvUWc2MmJCckxXUDhiaHNqY0JTeEtVTURCYktvd0pHQ0hUUGFhQWVnWThV?=
 =?utf-8?B?YTJ1YWxwWWNicEsyUlMzWjlPdGxHaDVWdVF2bCtxRy9pQVdMczdIL01FSE1o?=
 =?utf-8?B?R09GRVp2TmQzc3l2bnFBa0NlVkpSVGhKWTV4bG5ObkxZb3ZsMnZnODcxWVdK?=
 =?utf-8?Q?yoS2GoOJsYSC2ZMttdL1JZs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bb06af-6657-4e79-f5f8-08d99f76a7f2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 09:37:02.4349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DHL9Yqklwv//hjpYHw/B0VHGFOhEMRPmxCBUDDefRWToJ+GIso6Z0CrFl3hedEwHhDN4Ni9W79Cy8ez9WxcfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

On 01.11.2021 16:20, Juergen Gross wrote:
> The hypercall names need some update.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

In the context of reviewing v1 of this series I came to make an
almost identical patch (sole difference being that I took the
opportunity and also switched the table itself to "static const
char *const"), so
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/tools/misc/xenperf.c
> +++ b/tools/misc/xenperf.c
> @@ -57,6 +57,11 @@ const char *hypercall_name_table[64] =
>      X(sysctl),
>      X(domctl),
>      X(kexec_op),
> +    X(tmem_op),
> +    X(argo_op),
> +    X(xenpmu_op),
> +    X(dm_op),
> +    X(hypfs_op),
>      X(arch_0),
>      X(arch_1),
>      X(arch_2),
> 


