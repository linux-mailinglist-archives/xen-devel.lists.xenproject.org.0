Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587255F793C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 15:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418022.662790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ognjh-0004PY-U8; Fri, 07 Oct 2022 13:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418022.662790; Fri, 07 Oct 2022 13:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ognjh-0004N9-QV; Fri, 07 Oct 2022 13:49:57 +0000
Received: by outflank-mailman (input) for mailman id 418022;
 Fri, 07 Oct 2022 13:49:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nDAh=2I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ognjf-0004N3-Pj
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 13:49:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80089.outbound.protection.outlook.com [40.107.8.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc1f680-4646-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 15:49:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7381.eurprd04.prod.outlook.com (2603:10a6:10:1a2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 13:49:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 13:49:52 +0000
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
X-Inumbo-ID: ebc1f680-4646-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/7uQhADUEaCqTGDclxtDpKfQSG9bu/Klxe9LUV8B/m4J09+FqVbm9Ho1iCRWItiVO246Sj+smZab1lOlE8pCUH4lpNeWbIugBwu3COfpbq3AvvxlGCnNr42HSDykbsdKwTMIBHyLGLmRUChAhWuEvUZ+klw1iBX1REGfWEiw3OMLZX4a7+nRNi4wCz4QoOSMN8SHnJHskMshtifZx7+81pCyM7v3zh/MmbcPv5ugQUJ35dJnh4u4zM5F0GOht1HiQjHUtpRGCwk233CI59qqAzgBMnrXP0sJCZG3G14ud2z3RBxnJbZAN6rQk70j2S/TXyxaBjMkBYzHFQKcGwLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1geE7tFZULpCd4gG2I2wIrr0GVOAo3LXIf39DALJ1Q=;
 b=OSqN8/n/boBVwG+T17xHnYSxpVwG3HoGvk1oaADfhVdGVgGk+VNuelPmUCTQ/NDzYz2mTbWDHsw/wsSpCj0B8E4GudA/NyE+Z09tjzrEIf3vTor2xv9h7kr86K7J6BDmstLXuBTeOCjV4s661BjfpiTz1xDUtMwEg996rwAay6Yjznpft7krP3lAoR/gsd6/oiOSFHA1WsGrMZ+vWS6ERfRkzJl4OJbW6A7OIFipd2b4AhzWmeS2j2pfrBTJWcaQ85zAN+v6pzgSP5jHyI362XuGb8elM9CfbCxDZaLfINkWFIop88I/J/T3qBLSisxzw2RecGGvlhzMo5nFG6fzIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1geE7tFZULpCd4gG2I2wIrr0GVOAo3LXIf39DALJ1Q=;
 b=TGqvwOlUpY7IJtJZ11olXxV1u1ROZ5IWpdJWDXxE0LfQZ99qVFQPbLXDCn3VGn1ui/rkjuAKOFBwKMljzK8jvSfLqab7MkUHaU559jyO0kfIhC5GI8HMGyJ4iNub09Ce4BWd+WH43qO3NtrYm68H8iRHTRJNC8Y4vVJ28HB3cRyZx7+sNlXBpfrhXPQi09aYpwx+ySeEK3lgx+X2jZb6t9laaHQx/yAEpFQu76atS1wb7zVsOerE4Ta9zJOqkO2Uny8z5UvytB47uvLWlGpgYdmvmxV3KxWpb+qDfmqqUdhzfkkPCPmuoT2kqliYMqhPdxd3CUhzPtSVmLNZhsXEJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <806fa06b-adee-caa5-0b6d-aaf1282fca11@suse.com>
Date: Fri, 7 Oct 2022 15:49:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 0/9] gnttab: further work from XSA-380 / -382 context
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
In-Reply-To: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e96c1e-4afc-498b-2380-08daa86acf1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eC3SvXj4yL9LgZK/KEaC/OACDPiv2+QcDehSIFYadMIo7eSlWLQ8nyTX4lzVVxi3C3CWJS9xdyPIx+xjKJ4wB/6/k+jXODnWoHwEuamWCb2uBFUwKM8rnrNH0aep7PdaFXGjxA0Dc6oGxIVboeRarZnnirBROri22fhsqecSfQCJEgxC2WlYmqpebCB8GgOm0HTeA4SrynlUsH2uuPHx7XbaTiXhcyAdcMcxfzi+/ZPE4ERvySMf3SIPNipNS5z0E+XaeVf4qqmtUyQmXKVqr4BDDxONvmrQEmC/iKQAds/ZxNisF76zxYbgGNV3Y1XAm3mXJbju+/HxEgnQ6060Jzv6ArE9ZMgF3dSfwUhkuk7FAmhAPzCuWu4Fj1fk9l6IiqnHwUyZKyzItHYwt2KxHuvbM4crPIWlrWWsZ3ekKSZf6q30gH9g7vwnzE+XDIo52sNDAsABXZXEvtkTS5GRMK7aHBEl8EeIyhC5jmnKK9pz2+rYAt7VJJ72G3VXAGf4RBoMUalJb9Qr7XkwbMFYb8dSBNLOgg3bIA1CfOWL8As4xQ/bC1h6Q5JLbeB3h5KMNj71RrGaQyAky2IjC8s1Ipeq2HWsjVerDAZMNXralHT8BZRNvuAoeBoiJkWihhCWzNQQjgnnBlwE9yBHOF5P306coXfWDIuhkUTOJ74gLKvUVTzdtKAywUUQPnwTXgQYNM+1NowMJcnc22QnWs4HzRofmT8HCFd9f1O+oy2FdAnH7qhNfJccdIYiVXNE+2KfVXaXyecRWWrLvqtnnLb375WGqk3jYR9M6dkDySl0q7M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(366004)(376002)(39850400004)(396003)(451199015)(66556008)(66946007)(316002)(86362001)(54906003)(31696002)(6916009)(66476007)(5660300002)(36756003)(2906002)(8936002)(4326008)(41300700001)(186003)(2616005)(38100700002)(83380400001)(478600001)(8676002)(6486002)(6512007)(53546011)(6506007)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkJxVXFwMmY0MzZVUVVDckx4ZEhKWGR3R1hnSm1PNHVMdStHUU1kKzhkdS9U?=
 =?utf-8?B?SllaMEpZZWtRNy9uVitXNjNGemVkbTNCZ0JjUFFpMWl2OW9abXRCbzVuS2JM?=
 =?utf-8?B?dDd5MS82ZEROZ1YyQkdYSnBCUkE5dzI1TzFTR0FGZVV4U2dxbjNVMWp0bmFx?=
 =?utf-8?B?dWYwbmdNNVB4dlhjUHlWSGYyTnY4TkdYZTljRmdZQnVtLzZwLzI0UkFaMTh2?=
 =?utf-8?B?bFoxYVFyUDNqOVYrTkhFajJwWHAyelZBY1lFanA1aURNa0k3RjhRWjF3Z0l2?=
 =?utf-8?B?VldPMnFQUUdteU5ZcDZoOTUxWm1PenFrUFE4WUJqK0FNT1pHczk4SDJQVEsx?=
 =?utf-8?B?RzQ3cjdROEJqVitpZlhHSkIxRWxGNHNYWldwTHRKV0I3eE1wdGlZTFZFakNZ?=
 =?utf-8?B?TXN3SHZhRk13Qm1yUmlJcGZYeG9od25qaS9pUlJ4TjJuQVpuekZrQVAzbFRw?=
 =?utf-8?B?TEJuMXZiS3p1Ky8rZldKWldLTGtlMy81dEpxZzlHUTRVL1k3bXMrM25QdE1Z?=
 =?utf-8?B?VVlBOVFRVTdNNG0zK2dqOXhFYTFzNStqTnBXa2NrOTBhOG0vSzJ5TVAwQkRK?=
 =?utf-8?B?NTdDSDNMc1NQR2szZ3hzMmtuN1gvRUkyWm9POGFRVXZUREJZaXRINExHWFdk?=
 =?utf-8?B?d1JKWVdaWWo4dHRQd3N2V2JUbkQ5VWNOd3QreU56Q3M0RHR3YjZVSU5zaVo3?=
 =?utf-8?B?dG1pVUpwQnVVUjJUbGdEOW5UL3BBU1BmNXV4T05hN0R4WXhFd21JUGpFbEtl?=
 =?utf-8?B?RVYwNUFSV013NndKcEhMSjhZSUd3SjdEZ3VrbEh5Y0NEQm5hMk95SEZ5dDhS?=
 =?utf-8?B?OUUzSkNTYXZiTENoS3k4cWhBNmVhVzZQaCtJOVBZUXNMYVA5eHhnYU03MjAz?=
 =?utf-8?B?NFBUWXBNK0J5Y2RrZDh3R1N6cmlJQ3hnQ0szenBLbWRoVE1DanFFQkhmTWRn?=
 =?utf-8?B?TGdiTkNhTnRiSEI0VFdYUWEwS3BBYWg4b3BucEhoNnVYT2IwT05lN2Q4N1cy?=
 =?utf-8?B?dnlySWNFYVZqVk1uQ3FEY0VpaXZYQlFRT2p2aDE2cGxnekkyV3J5bmdWbmRw?=
 =?utf-8?B?a0RoRFQ0MDc4VlVLSHhZMUdjSkFGN1pVd2dLcjd1MHBlanFReWcySmdDTCsx?=
 =?utf-8?B?bEp2cEI2RVlsWDQwY2VUcWI2NThqYzRvYkhVYmtPcExRcm40OWVybTh4MHQ2?=
 =?utf-8?B?SnR1L09Yb2RSdTUxOFo3RERXd0Z3WitPSktZV1UxbzFDZWFpb0F5YWRiM3E2?=
 =?utf-8?B?cEtGZCthVFJJMTR0NVdpRldXaHFTVCs1ZnU4VGtkWkc5ZHpyUTYxN3krbEdm?=
 =?utf-8?B?Yis1RG9ZMXpvZGllYy9NUFRiYUJLeVFVVzdESndEMVhnMGtiSVB0WXFmV2Y4?=
 =?utf-8?B?ZkJTMDI2UVp5UjJxVmdVaXN6cUlJcW1TakpLRlozcVdlbkJMWmJ1UnhUODVW?=
 =?utf-8?B?ZFovclRiN3lFTTVuN3pZTmpsMFZiYmVSeHYrb2FQcFQveVRBME93M2FVQTU0?=
 =?utf-8?B?eDdjS1VuMHdkMzFXbjlLNnhzbE93ejNvQmZHdXFyUHErUGpXV0lhYmd1aU9M?=
 =?utf-8?B?SW5DSDFzL3V1czFQZFhYVVYrYS9RNUJxTGZ6WitjeXVZT1FTNE1TQ2FTZ0NS?=
 =?utf-8?B?Zk94eUk0NjdiaDUxdnlEQzhETmlMY0xRRkdrL1d6eE5Sd2pBd0o1YTVkUXFj?=
 =?utf-8?B?LzhhVEZNMjNWc2pkYjVVblNKS08rMnRkVHhZZ3hrRXV2RUNkYlR2V2kwempo?=
 =?utf-8?B?WWFWRStMejR5VUVMN3VwekxuWDBxVHg4aXB4clhVelh0ZUtvejh6Q0x5S1FY?=
 =?utf-8?B?V05CZzFaR2VuZzJlNXRmTTJmQjlMWldnRW9hMDZOVGhqa3U5bVl3Wm05OUNl?=
 =?utf-8?B?RXhtMkgya1RIYW5UQmx4LzR1ejVHVDRCZE04OWhTYkw2aWFxdTJoenVEOEZh?=
 =?utf-8?B?WFJIYWZ2UXhuTmJIRUJTdzBUWFdTQ0g3SjV2Y3h3QlNNZm1nSEsyUmVJaTBn?=
 =?utf-8?B?UGFtZ2p6VkY0YjRjKzE5dXUxV0dzRGpYWldLaG1YaExKNCt0RGF6cjVwYVZG?=
 =?utf-8?B?NHYxc0ViQTVsMy9RV1NkYklpMEd6RHRXdjhBRXR5Qm1MK1ZmKzJBZzBZZkdG?=
 =?utf-8?Q?myN+GD2P+BDGoZsdzJ9AavRiP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e96c1e-4afc-498b-2380-08daa86acf1f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 13:49:52.2833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fd/BgG+E9aXSWN5VN9Kcr+OiEoda6f1p//MyGDfEQgYLxq9zo5o3mmaZacjM39P8pJ/ORcdb0QWwJWMIFdQLeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7381

On 26.08.2021 12:06, Jan Beulich wrote:
> The first four patches can be attributed to the former, the last four
> patches to the latter. The middle patch had been submitted standalone
> before, has a suitable Reviewed-by tag, but also has an objection by
> Andrew pending, which unfortunately has lead to this patch now being
> stuck. Short of Andrew being willing to settle the disagreement more
> with Julien than with me (although I'm on Julien's side), I have no
> idea what to do here.
> 
> There's probably not much interrelation between the patches, so they
> can perhaps go in about any order.
> 
> 1: defer allocation of maptrack frames table
> 2: drop a redundant expression from gnttab_release_mappings()
> 3: fold recurring is_iomem_page()
> 4: drop GNTMAP_can_fail
> 5: defer allocation of status frame tracking array

Just to make "official" what I've said in the course of the resource
management discussion at the event in Cambridge: I'm withdrawing 1
and 5, in the expectation that eager/lazy allocation of resources
will become a property to be honored uniformly for a guest. With 2,
3, 4, and 6 already having gone in, it would still be nice to
(finally) have feedback on ...

> 6: check handle early in gnttab_get_status_frames()
> 7: no need to translate handle for gnttab_get_status_frames()
> 8: bail from GFN-storing loops early in case of error
> 9: don't silently truncate GFNs in compat setup-table handling

... the remaining three - even if these aren't really 4.17 candidates
anymore at this point.

Thanks, Jan

