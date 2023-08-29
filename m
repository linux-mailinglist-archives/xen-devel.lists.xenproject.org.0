Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE82278C563
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 15:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592230.924890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qayoo-0002id-R3; Tue, 29 Aug 2023 13:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592230.924890; Tue, 29 Aug 2023 13:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qayoo-0002fq-N0; Tue, 29 Aug 2023 13:31:42 +0000
Received: by outflank-mailman (input) for mailman id 592230;
 Tue, 29 Aug 2023 13:31:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qayon-0002fk-Ar
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 13:31:41 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6299e4ad-4670-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 15:31:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9410.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 13:31:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 13:31:38 +0000
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
X-Inumbo-ID: 6299e4ad-4670-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzChtJXEuOxNo8XUQEdqs3QJE6Hxi+Fie8eeBJPVpSmmSYUWabuzHSAV0DHQL/hLTJLki9LKENAl6le3u6H1/yGwOWr+qPh7BPw2Cr1pquYlMrlby/Qnz26edqpQ4o9iNJe+j6KFjGXW9wym8kZRHeLeqIwQJiaBsOm+fI3i+EIPjSQQqRc+2gX3mFGwqy6PD88/yATK3ks08BT73/dAiUv/nQQZ64J8sKLZ+HnaVwFJ+3HJbLQTB7GFbEOnsYnRCW8vNetR23PXZV5hsR0JltmGVT4d0Dwk278bnIKTNTI+zaahSK16rACobVYEGPz09bT1JOna/lJ/nV9K7LkHUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xItzR6I9ExFMeYMq4xpqk0v/mI0HfIWpTKBQsmLymyg=;
 b=O245nOFiTywSlBBakX5eOSIVvpIMalDmM2Dh6PVn796Lnr/SQSPBVUEHyOO22gG0rYG13HGX0+puv2M/ihWUgl0LrJtFeUujUHdTVFbdfejStJ2gMpFYWN6QT5+yIqmGQ+K8JVo06ycTEjkonNVScezlGx5koqN4TJHsgPNyp8fKTm7FICTgAriq0xT5Hu1kPXB6uMy5SaK7qxgBZvWZP6PmFa+3yFXMqgLpmotDJFMSxt8xnHL/A9dsMjTCc8MXhdhLuWt0dsr0AxS/PmkQ3cx6H139Ygw190+yoXBFgsVsEEeQ4D3uwqekwSn0tiWxmSGW7HKPj48MhMZOAlF8OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xItzR6I9ExFMeYMq4xpqk0v/mI0HfIWpTKBQsmLymyg=;
 b=L6d+b14kVhlWvmtiao5xJD4hN1ZIY58sXAjz0Vkhcol0kI5aMszTZ4GcDzGAH+AIbVAzciQOvHkM2p2r7udc1NOxGVXnIMPVYGd3s0hcUrz0hLNwpZNzOZc19ectXA2ssyBBGcDOsv6akMHuswM0E+fITNKjnCgF5X8tTkfCC7c4nbEVYnO9zE0rVTmNMtLWUAXSjtBqJmeFjdvD6Pf3FyKIuyFjT/WHlkU/DLFW6ioeNPhuhe5wN0XFDGiC4LMZSBrzxc7NVvj1gWw//CDzNVnD7W26pRtY0+/bW1U1OUsRPhj3asUD3IvjmUVRkGDLguYs05rZdDMhAKAOooVw0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae8e26b0-ff99-a4f8-2954-660686d60648@suse.com>
Date: Tue, 29 Aug 2023 15:31:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/8] xen/ppc: Add public/arch-ppc.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <85bc5f57ad41a54f84ac9fa118ff0d9e02b71461.1692816595.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <85bc5f57ad41a54f84ac9fa118ff0d9e02b71461.1692816595.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0232.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef0f3db-8c41-49e1-21a6-08dba89445b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eCN8Imm7s6bjezK0kWxNQmq23/8eZmXaCnvkQXIWgRq8/z3QtlYC1BGMnwF1WASb2TFTpjw1WoWYynKDDVmMeh1PvFr2RmX1+IMg6klYTmcxdgN9lxjUj5NsQH5gQn7gxo+E77B14Qc/D3tCOO+uMgzoMXj0pMZXXScKHeEdGXmcW7q9wgJkgKjN1TR30MO0uQXAWMKwGZJjb7BTdM0j2HUW3jwvo5HaPDteJM63p3kXRje6Bfu1Y9qn5hQNY51rsM3bgnMR8i7TwjqhhwfdpEVYWOJI6kIRjqRYgOU5zufvDQ49lsn/hAGcYF7vV1HsZrLLoqlA+xeQUduccCn15Mb4/4C5kRg+BwAuK9wK91z3+tRW6aGU6ioHxTbPq3+8VhYqLaL1iuW1cNRs/UZNnUq7KJKd7KfAMdAZzv97vR3MIc80ZVwicpyiTjynb7yO8EIcdz9YU/aanIj57jRujWXfEA9x05qmevRV9sTfg9fg7fDp7/E8wDB/ea548nE9MQ1yq5eY0rLH+MSPdYzbcpoFcTHXcg7SI1kBjeZXZ4or/mLKWJ058nkNmm2xWAxzBTZX3Kgu8iWmVYcekWPFbqopSpwxTaW8GZmbRkuDEGj8cuUafph33CWTqMLYC2EfJ3FpH+ZIS/hXici92aN4Eg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199024)(1800799009)(186009)(8936002)(66946007)(53546011)(31686004)(478600001)(6506007)(66476007)(66556008)(54906003)(6486002)(6916009)(316002)(38100700002)(41300700001)(6512007)(36756003)(26005)(8676002)(5660300002)(31696002)(2906002)(86362001)(2616005)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym9WRWp2V2xqSEtlcUp4M1JKS0FHMEZRSjdJSkRWakw4WWtjZ0NxZ05JTGx0?=
 =?utf-8?B?TTFYeGRXSlBodUVENmlVWTFkR0ZLVmdidER3bW9GbWZJYnAwUzkxNStaZlNz?=
 =?utf-8?B?ZkhaMzIxVXVBRytNbHJzTWcrSU9SRHV5NmkrUHl3ZGRGSTBXelRkOTdDdnRj?=
 =?utf-8?B?NjRiM3c0eGpReHI4TWI3T2xXUmhmOU1ob1NHbjdPUEVrYTdSaVFHeEhKZUJa?=
 =?utf-8?B?dTA4MTBpQ3dVbGRxRGpwTVFOallYQTRaTDhtUjNFSVc2enFnZDJBRHFveGc1?=
 =?utf-8?B?MlB2ODMyRllGbVF5K1lMbCtOM1N6RVhnT0M1aTdMckJxekJieXFsY1RHYTAw?=
 =?utf-8?B?TyttN1dWMVlzSGduZmZSd1lweUMrblVnZ3RqUmJ5aWJFNXIzV1ozdlAvaE1j?=
 =?utf-8?B?QjZxNXBGWHZWSHAzd003YlRoaEJFTnRVeVlyQnhLMWNvelA3TFlkQm82bDkz?=
 =?utf-8?B?UjdrT3RQZUFDSnBhSHdzRW0wSUFENjdCblJUQzR5cVorSWwrby9iUnc0SURx?=
 =?utf-8?B?MVdpUTNJQ3RmRzVnYXVxZDNhOTFLNU5mWnMrYjZZWlJBTFBuL3hnRy9UMUV2?=
 =?utf-8?B?MG9ESjZ1bTIzdFNVSlFtVUZqTys1TmRYOE1qMnp4d2JvMjFRSE9TR3crL3lr?=
 =?utf-8?B?YlBZWjNkWmZFT0FBa1Z2bWNvNFBNY09IS0tPL2wxcHFIUmoxNDBaUVE1UkpF?=
 =?utf-8?B?cjYyVjhtdkR1L0pIL3ZpZDZzdld6c3lwU2xPZ25ESi8yV1hIUnlXc1RqNldY?=
 =?utf-8?B?akJ1V2VaQ1hJUUNkRzVMZmJlOFF5YnQ3aDU4c1pkckZrZ3puUFJGakFBRHJI?=
 =?utf-8?B?VTJYV2E5UTc4ZUZ1UzdLOXl0UlJaU1F4UFdMWnlYcE9SbzJxd3pkamFVd20v?=
 =?utf-8?B?R1IrTUs4SEZrME1JR2RwNmNxajZCaGVkMFF0eDhrWTJ1K1J5YXQxMEZKcmkv?=
 =?utf-8?B?OTMvNGtjYTk0dDlXOEl1S3JaSVpoQXl3M1EwNXBGY0RmUXVVSExhdDRuYU5j?=
 =?utf-8?B?MW9SZ0ZUcmRVNHVjNGE5ZjRpVkxUVlRKVW9DS3NWK1ZXWkVySS9mWGY3TjF1?=
 =?utf-8?B?cFlzTUM4RG5CUTZuRENnSTZOdEpPemhKWWgwYUowa05HZWRuSDNPdXcxZy9P?=
 =?utf-8?B?aFE2UzhvbnJhUUcwNGV4NmVEcTVYWjBBZEhlekJEN014YkhDNGNLQmRXQzNQ?=
 =?utf-8?B?aitUdXB6OFFSWjZDVlI1K0g2T0p4L1B5UTJSemg3ejQ5N0xDN0lCa0xWbEJN?=
 =?utf-8?B?UW1yVWZmbTAxeFowdlNzcTVUK2prRnB1M0svNkJaRzl6Zm5oVnJJL2FPUzdI?=
 =?utf-8?B?OCtNOGF0QTRCTFdZNHFKelVlNGlVeG0yVVJmbkJrazVUcW5PM2lHOG1sTGVh?=
 =?utf-8?B?MkU4TjByU0NVbzNyckFMTGNhQ29qMENzZnJiZUJ4ZTFxNnNDOSt5OEpDL3hD?=
 =?utf-8?B?em1FczFzUzdNeHBoRmJGS1RwWlpzTTNBdlM2OXlmZzlJUnVYUjh2WGlYdjdX?=
 =?utf-8?B?VXdOMEFkckhiTEJXMDVRVTl6MmppSWhEZWZ4S2xReU5NMnQyS1VYQ2RmdXlY?=
 =?utf-8?B?NXVkRmo2QUtRT3hFVmFjbjVtaUVJM29uWHlZZGx1WjAzODNhYnVkVmNiMGli?=
 =?utf-8?B?TGV6QmdHR0JTcEVLYUFtVVRzZCtqVFJnOWJUc1gwUWRiTkIxZmNvN3lrb2Iv?=
 =?utf-8?B?ancrRXRST2tjRmp5ZmdGbXhoTHNJd0JsaXN4bTVYcGdueWF4Ukw1b3NVK2lN?=
 =?utf-8?B?ODBJb3hyTjBTRGdUNzY5anJJc0d6cHdBaWp4aXZJeGZWTU5PL2VaOVNaYXdU?=
 =?utf-8?B?dmkyT3V4OUd1WU9kbDZkZ3FpcU9JYnZON1NleUx2WmVCNGplYk5nK3I4QWZW?=
 =?utf-8?B?bXVZc2JXRkpnQ05ZcTg4M0VUY1VoUnl4azhVU3JkZnVFMUt3MktTVHV0UllL?=
 =?utf-8?B?V3RESmhLdTJzWmUyYjBqaGplNTFJRXNiTDhOQ3lBSFBCQjQ4UmJzbVRzcnZ1?=
 =?utf-8?B?TUU5c3NYTUJjbzRBdW9aaGhZQnVqN2xEdkptWUhSQml2ZG82QWFvTVZnM1BS?=
 =?utf-8?B?M2JJeHZ6MUNIUXJvUElUSU5IQXh6bG1TQVdrVmFUQTd1cHJEdVdiNnQzRUVl?=
 =?utf-8?Q?g6VyxsqE6/8XWKHZUHfArxj+P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef0f3db-8c41-49e1-21a6-08dba89445b6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 13:31:38.2446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/yRilgqVbZ/eszdqQSHp34IuFJFXzLcWc8OrXQ19by0d0M6MUabxA2a2yD2gzsroExJ7osH+9IL+ha/nBpBeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9410

On 23.08.2023 22:07, Shawn Anastasio wrote:
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- /dev/null
> +++ b/xen/include/public/arch-ppc.h
> @@ -0,0 +1,110 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) IBM Corp. 2005, 2006
> + * Copyright (C) Raptor Engineering, LLC 2023
> + *
> + * Authors: Hollis Blanchard <hollisb@us.ibm.com>
> + *          Timothy Pearson <tpearson@raptorengineering.com>
> + *          Shawn Anastasio <sanastasio@raptorengineering.com>
> + */
> +
> +#ifndef __XEN_PUBLIC_ARCH_PPC_H__
> +#define __XEN_PUBLIC_ARCH_PPC_H__
> +
> +#define  int64_aligned_t  int64_t __attribute__((__aligned__(8)))
> +#define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))
> +
> +#ifndef __ASSEMBLY__
> +#define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
> +    typedef union { type *p; unsigned long q; }                 \
> +        __guest_handle_ ## name;                                \
> +    typedef union { type *p; uint64_aligned_t q; }              \
> +        __guest_handle_64_ ## name
> +
> +#define __DEFINE_XEN_GUEST_HANDLE(name, type) \
> +    ___DEFINE_XEN_GUEST_HANDLE(name, type);   \
> +    ___DEFINE_XEN_GUEST_HANDLE(const_##name, const type)
> +#define DEFINE_XEN_GUEST_HANDLE(name)   __DEFINE_XEN_GUEST_HANDLE(name, name)
> +#define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
> +#define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
> +#define XEN_GUEST_HANDLE_PARAM(name)    __guest_handle_ ## name
> +#define set_xen_guest_handle_raw(hnd, val)                  \
> +    do {                                                    \
> +        __typeof__(&(hnd)) sxghr_tmp_ = &(hnd);             \
> +        sxghr_tmp_->q = 0;                                  \
> +        sxghr_tmp_->p = (val);                                \

I'll take the liberty of correcting the slightly broken padding here.

Jan

