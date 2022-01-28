Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B34A49F40B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 08:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261878.453713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDLNc-00026U-8u; Fri, 28 Jan 2022 07:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261878.453713; Fri, 28 Jan 2022 07:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDLNc-00024e-5T; Fri, 28 Jan 2022 07:09:08 +0000
Received: by outflank-mailman (input) for mailman id 261878;
 Fri, 28 Jan 2022 07:09:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nDLNa-00024Y-RQ
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 07:09:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e0c1091-8009-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 08:09:05 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-NGlZpbFkM3uewBONAZ3bQQ-1; Fri, 28 Jan 2022 08:09:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8207.eurprd04.prod.outlook.com (2603:10a6:102:1cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 07:09:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Fri, 28 Jan 2022
 07:09:02 +0000
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
X-Inumbo-ID: 2e0c1091-8009-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643353745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h4CfLYkZCgQ2re1mVcjg9UU+1Pzuy7M47xgaksVvZBs=;
	b=J/98guYsh+Ty4Jex3vtSH0wGwOj4kB6p8e0EHwj2uYqzBAVDJrxE0zS0bIzZijVfxnNXXe
	EYwT2myadetjJKcdGfpgAa4+qLJgXtFp+pgftzB/eZQt/z/hp/yPM9W5GU4a6MNaXioUHT
	kQP83/7CeBbhUsojpPaKQepAaJvaJGs=
X-MC-Unique: NGlZpbFkM3uewBONAZ3bQQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYRO47sUWVRvp/W5Kv1Fw5YhuNmDdCsnwV7NUxXILrTC/UNGr7x6T7tf3h6KFOGEKcyJowY4jVcHcs8WnkDFwjzwEcXtnJW8EjhlJCtAxH7IUsVpOyg8UeLeHuovEL33s6vh+DCE+iC6BditZYQKTx22tt9Jry+Bsnvs+13w8X4Nym/6xVB7B8cm5FC5WdO+iiKLdRKGdDMql7i47V/fiOcBOB1WsQYBGXcuB4k8hxgozxRU87aBpby1dqqWygN8r4dL1BYuKDaSgDPy7tDZXeWzDb9cEGKhkZJhlf9ADfd+jCABUeGEtfKRxDqvBYXkU6D8ImoiKYt4GY2pL4exMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4CfLYkZCgQ2re1mVcjg9UU+1Pzuy7M47xgaksVvZBs=;
 b=T/hVg58KPy3kobQC9r69WvHNj02mibY7MmcmaHjlad1ic761IAQq1SdliQWau79ssPCWT5UUpQoxKff59wSAP7Gd8q01IeM3RQo8QlnUaxFAqgxGHyME0LH5mj30hQzeYd099MK9z0ea4D5Pnn++g67YCCgxf0s3hsbrzXXIGGYUH7nFpjPV3rXdCdyjuSJvUemHZyros/JQr2nbNwzyKsHJEqrEyVinm5QC7a9bd+6DsC1Jjq9VYD6aGyslqSBYSUNaJN06Pj0CfsynMWkWc0dCWkuxbAIP1jK6iCHiWvYmF84vp6DRv4dubA5fouTqBaOzr9cY4JOt4/2PeiVKjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1525cbb9-75c7-7991-853d-78b387528dfa@suse.com>
Date: Fri, 28 Jan 2022 08:09:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-2-sstabellini@kernel.org>
 <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org>
 <alpine.DEB.2.22.394.2201241652330.27308@ubuntu-linux-20-04-desktop>
 <14af544d-0d20-9b58-4d70-5f5086ece032@suse.com>
 <alpine.DEB.2.22.394.2201251435030.27308@ubuntu-linux-20-04-desktop>
 <a992cf74-a75a-43d0-f83a-cd9549f586a8@xen.org>
 <alpine.DEB.2.22.394.2201251530400.27308@ubuntu-linux-20-04-desktop>
 <aa7aee5b-71cf-78c3-f8a2-f8d166f22ecb@suse.com>
 <966ac15d-e91f-e812-1021-296ef60a9a06@xen.org>
 <alpine.DEB.2.22.394.2201261727550.27308@ubuntu-linux-20-04-desktop>
 <33d1c1eb-7d6d-21c6-8ed4-3daef5be90d3@xen.org>
 <b2edac13-f019-f615-0655-8510bfffedbe@suse.com>
 <55c8e510-8b8d-ca27-f635-e2109fff9c5d@xen.org>
 <alpine.DEB.2.22.394.2201271729410.27308@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2201271729410.27308@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0147.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b3463a2-f954-4753-2514-08d9e22d105d
X-MS-TrafficTypeDiagnostic: PAXPR04MB8207:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB820799E1B2E0143CA681EF15B3229@PAXPR04MB8207.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n64inkyQyuRMg73IaksoLsdqXmdB5FJygW6Q7i23YpH92QOYTKaxPlbyXl1yGEYjoXrAefRxWDbJqQ1VwHe6nTjFKgt305rANFOM+La8QWTYpwF+hwXThBtDFyx0Z9q4TvDU7VsYAjLZ4ck6LFMCXX7ykf5i4yZZnKMTYgTUGv6mGYWYpYeT6ORmCaQPVATjyR2MUC2KwipFBhMB31a3wxSBQsk42y5ykXMMPmWM69m+UZdCfyXvf+Nks+bc6eaQ7OaYcL3EDFF7A41r/uOKoFVThKfzIQv6cOfsw20Jvs9zaH6IyB2B5ZvfPfwSh+EurGpsdzP9t1vUFGnHCWmbT1nLtiTs5ECy1uba5Tbl/DzOalEmqKdJP/bZDHzwf7AkDcvX//x6H5UqzClQJBd3Ii4may3cI1+4reQ0Pgling8CBhZysnw6s7hDvUvwZYdO10GkMfWhypjz2c+pbTolU8Phy07GaVh4EH2WV0M6hEdfkEHzvHfNJXYNYQAYQO7MVwz8rNwwBz7vn7sQXxOuryVFn/0hBixHCHsWDygNyU0D1cB36WxtMr/yc5rdn17Ay7cWpSVxyvxuWh7hMYu4f3g1uqTHFTWogDyXpS9ks9K0ml4NR74pYaG2IUSUhWWof+ZE+3gq7LaLJvTqE7LYBaBBHEq6HEca+IgyVfqPKTqX4RnixzmMJatHKfUok7fkwGJ96LGnvcG70ONnSw7qc98d6eGHn0KRtotbkAA2jSiDDVqbGhOT+/A/9WhkRK26
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(508600001)(54906003)(186003)(2616005)(6512007)(38100700002)(6506007)(83380400001)(26005)(53546011)(316002)(36756003)(66476007)(66946007)(86362001)(8936002)(6486002)(4326008)(66556008)(8676002)(5660300002)(2906002)(6916009)(31696002)(4744005)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkFDaklTdEcyWWdBZ1Z5MWRDYlVHRHFyaDZiV2FWYXgyTVZyN29HVlBXNnVk?=
 =?utf-8?B?ZmFPcmlRa0VxVFFOZFBORXV6MjNUK1dkWHU3TW5MR2p6dDBjVm91YlVNRk1D?=
 =?utf-8?B?WkVMc3NjUkdheUs0cG12UDJqeDlYWk5RcXJ6WHBmR2o4djJSNU8veTZqZGtS?=
 =?utf-8?B?VWlNeERnQ0I1OE9MSWhOaCtsOGw1NGVxQlFnMXU4dmFKcWJyZlhXV3pTbkhV?=
 =?utf-8?B?ZFpBdENjZEd0b1JZSVFzZlNvY3ZZeUJJTXB3L1YyaldtTDh2bS9sTXJyYk5H?=
 =?utf-8?B?SU1oNzkzbHBEeHk1UDhFemoyZXBuZ2YyU3Axb2xCUklETXJGQWxwRDRwbDU4?=
 =?utf-8?B?eWZLSmpZRWZLN1ZHeDhCdTVBYlBxREJaVk45Z1BwUmthbGVhNmp4a0dYc1Fl?=
 =?utf-8?B?RkFQSlFwUTdIOXZrdGhENmpBTUNUR2lpelFUK3kzczB2L0JHZTVvbjNGYms1?=
 =?utf-8?B?b0Mxdlg5c0FpcnVlZitLakpwT0ZUV0NGOUxHbkRnMjhIdldnNUF4WnVEWVZB?=
 =?utf-8?B?ZjgwcXo5ZU5PODJxQUMvVmZCaEJCTTZsUGlhSnR1N042dTN5QWxHcm1PK0hk?=
 =?utf-8?B?dEZvK1NVRWdnNldid1R5UjVNWEhJTUFZV1NnWFdTTzdQbEFudjRqZEdHNEFV?=
 =?utf-8?B?ajJGY3A3K3lqWjNCSjFkczFJZVhtMFNFKzN1a2VJZC9WM05YZndxNk1ZdmhZ?=
 =?utf-8?B?dmd1emZzc0JtbW80OUg4TXRhRWpNdCs1SlF1VHgwTjJra0xqenk5eEhYTHR0?=
 =?utf-8?B?R1prMjRpeWVjdUpnRUJCU3F4Wkl1ZnZEVzVoZTFNUTE2ZFpXcC9NQ1dYS2wv?=
 =?utf-8?B?Z3JFY0NlMHFBelNtV1dkZFFrY2FIK3d2cllheU1ZTFNOQW9RNEc0S1dYQ01S?=
 =?utf-8?B?STAvS3VCZ0pMOW5YM05BZURKTW9aYVV6WVpHZy9GdjJHR2wxbWozZkZXdEd2?=
 =?utf-8?B?cUtQelBieFlxWWY2WXNWWlk2MitQZWQ0ekR5WGMxMmJNam1JaWptMFh2V25q?=
 =?utf-8?B?VVZoVzJhOE5TQTZlKzN0MzFScUtmeDF4SmpvRitUMkI3UG9IdTh6eXgvYzll?=
 =?utf-8?B?SVVSeml3MkdYaTNxaDFjdENVRGttNHhHalNRNHlUNzVZSGp3ejZyNElKbXdK?=
 =?utf-8?B?ZGttNkNndEZseU1NQnRuYy9sSkFuVTZTMWdxczBIVHNrRXl5ME9sbWVIMGhH?=
 =?utf-8?B?VW9TTG5taHVCVUNMRXJDR08xaTFMaldmTE1mZmN4NHYxVE9oWTFUZWpBYmdS?=
 =?utf-8?B?YkJJdVhUbk45a0k3K21WbWR0Wlp0a3EzZi9wem1EZXRQMFFzYzNkVUNWeEIw?=
 =?utf-8?B?bU5ha0I1TFNpRHJjVzhNYit0WjNOcWlRQzBZWjBNbU11MUlBSUZacERBTHp1?=
 =?utf-8?B?bmxYYUxFTjdnZzhVU2U5ZjYwTnh3d0dXZXdEMUloNzJMRGpXdUMyTmhpR1dN?=
 =?utf-8?B?dlQrb3NXeFZZV3dkNnlzQjdmYWVRa2N1T0pibHVTcHVCN05lOTJtejVleUk2?=
 =?utf-8?B?MkhYRzZ0UExPaitzMlNLZHllTFEvMWVWNlhqMTVVUHdnUElPSm1Hb1Z3ejhP?=
 =?utf-8?B?blkveFdEanpSc2VEdmx4YTg0dzdCNXZoWFRzWTBHWWhNM1FNTksrZUZBbjd2?=
 =?utf-8?B?YUlIT0V1eXVqYjVRWUVNMDFJZlluZGU3M0hFWU5PaGY1RDZIWE5yR0NKbGtU?=
 =?utf-8?B?Wkg0MzNvNEQrWGRweHVCenB4WVc2MHZ0Q0E5RW92bnp0NUhaQ1IzTDRIcmFN?=
 =?utf-8?B?UUgvWGNhTHNyOE9obEcrODBJM2U3RnlMbEQva1BhNHlGWDZxN3o0Q245RjJs?=
 =?utf-8?B?TlZZUW0xaFZCV013WEhuY1o5VTFjOG5aT3NZODlzWWxTc0dnR3djQU5pSmpQ?=
 =?utf-8?B?aEM3SUsxaFpXQ2M1WTlnRHVRQ1BQY0hVRkpiQnhpaGxwdzJRWkZ4blVTQ1VU?=
 =?utf-8?B?TFY1NnRNdkNNYm5lcjh5NWlOWGNOelZlS0Z2U2w3ZExDT2Z1Uzg0TXFvVmFp?=
 =?utf-8?B?VGJnMFRKWkRKWU1KaThLV3FoWUhjZHlHMmJ1bTlJOVVuR2w5eFlBRkJIQmNu?=
 =?utf-8?B?d0ZkZ2VFcmxSYUJ2RkhXa2tBN3VMZlJ2bGgwZG5CcUVNbHBaS3Q0elRocWpV?=
 =?utf-8?B?L1dOWUE2SkRPam9tdXZWQnIzeE54U2I2MXRCdWJyanVnamN3STlUdjdPcmsz?=
 =?utf-8?Q?O3ZHXwSbmeoIzb0700gsJG8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3463a2-f954-4753-2514-08d9e22d105d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 07:09:02.6831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqV4raHYRl2jm0U6+xm6s1+KvG3DIPQw4cXOHUNvfYMyjvvb6UU6SIbSpYqD0f/9Xqete0hFsrLoQ8SyWeRaVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8207

On 28.01.2022 02:38, Stefano Stabellini wrote:
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -284,7 +284,7 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>      xsm_evtchn_close_post(chn);
>  }
>  
> -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> +int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool disable_xsm)

Nit: I don't think "disable" expresses the behavior. May I suggest "skip" or
"bypass" or some such? Or invert the boolean and name it "check_xsm" or even
simply "xsm"?

Jan


