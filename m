Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2875544D9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 11:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353628.580590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3wd8-0004sU-34; Wed, 22 Jun 2022 09:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353628.580590; Wed, 22 Jun 2022 09:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3wd7-0004qg-Vn; Wed, 22 Jun 2022 09:26:33 +0000
Received: by outflank-mailman (input) for mailman id 353628;
 Wed, 22 Jun 2022 09:26:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3wd5-0004Zj-OA
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 09:26:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 664a7e5a-f20d-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 11:26:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7005.eurprd04.prod.outlook.com (2603:10a6:803:136::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 09:26:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 09:26:28 +0000
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
X-Inumbo-ID: 664a7e5a-f20d-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8ejIyPckfKg2PLK+HSClOuXW4z9GgYWYIwsoQgFi2HQo4u5fDdfZs12WZ4llMgBEKJHsdziByY3OirgsmD1dyc8zWRAM4+6wDcUnVRm8Hf3T/efoRg8WVyNVLK1VxB5J6Ox7PohQQ0B2rG+lTtBggEodPUKyT/bQhxowhBqFGoutKxxV9i4RDWBMLq7lqztFTaAfhmW8ih9spmjQ7BXarOQSg4/B3HjmYSjGiEI6mN5BsoL0YdLc2zmPrIVCJRaGt6H5jXuTeNwPloDNAPJ48s7NwgRIIBDaNQReBjGYK6leC2zFg5sxJr3I9SWaiCwzUpoWdxoyB2uSisVj5jyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuZs7AscUaUDYSw/FQhVebXRBQoXaWNVZm36XO4KP9o=;
 b=ZCjyGEcRoJownKXm1wv7EjD7XUs/kiRjBF7LdFoy0ZyV/8qYWl4jVzorM6fQyhoQxr12AU2cmjnXYxbZG2RHJ4EP1wdndlPgRRVWQqP1rbuIcpIuTupUNS7/R7PbleOMMP0aALJrQTLdwXu/63Sxy7W1aAv6VzfE0D7Ks0FbL0WyvetuAIVZGRsOmnCA/iAbZeWb9tvjJViS+JMKQBNuLkonOyinBVvbnVpH1aHLFGtQghzADpQQ9nQ+i9NrgvYp4BYNVzdYnj/6QoxYTG68eclnUW5U7tY7pQ8HsaBHkPpwhE6nTiiFPGOh6KjY0VVARzs4BLWoTzrVzdXyy7p5LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuZs7AscUaUDYSw/FQhVebXRBQoXaWNVZm36XO4KP9o=;
 b=eCjCIQYDdBjpcnGYuN7l0Z8gJ7w15dz6e3dkc2KGFyzD1j/5+GQpVL9+VOc+8XVs8x+TToFURiwS1+Uq+nO/K19bbISUgsWhwvm8khH0UZUX7QtDfCVMoZVfTd71jpskPHU8GEMYP9JCwcEIvfD/sNaAIrmqIMlb67SR8ZMp4V7LDBT8sMYtU4umZtDHOvN2Ta9QwgpAoyZfXj9CXLkMssnnpht0sWFBmydmfFfbDLr9HAA5YJo0b8whgNRCJsFkzvv8Gn4nDM+S92PfUn64EfxcMFchjOMDSa2FGn3BLpUZq+lV9eMC/m1XXNKoWvi2Ged2STt3whHB8GjyfD39WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <676786ba-68ab-0575-c599-92a1c1eee6a5@suse.com>
Date: Wed, 22 Jun 2022 11:26:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 9/9] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
 <20220620024408.203797-10-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220620024408.203797-10-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0032.eurprd04.prod.outlook.com
 (2603:10a6:206:1::45) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3e83adf-29ed-431b-f6fe-08da543148d1
X-MS-TrafficTypeDiagnostic: VI1PR04MB7005:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70054428458A643F4D5DBF4AB3B29@VI1PR04MB7005.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kcoeFDKVN8KbVhHd/DNUX8A9I5y3cG3vidh9Tth4N5WlohXEP3NVQGC3qJJ0J5AROoUHSYUslmz1JyoM+wnolt8nDPi++tcerzwwpGgjaLWhuBUTI0PQ7Guq1z7fmUMaGLpK5l0shcI31HZEvJJUESjcgIFpqtotOPeOCJ0cL+lGara9mWuC13q5cMyMxOxMx1ROIayD4OWeLCZm/GNVZBeygIaoj/+R+VVpxV1t6lTXcP3VgYEYkmmjRA+ZdriDSjQlyp7sv72eYPMY4OcdyutCdZw/BC4YTwXHmCNP6LQugaPvmX2uqhBEymAu1dM8Qr0SOJGVyArZn90V7xYOK06iPh0LYIGtq3p3Z0fDH2E7LrrjDX/oeMHOcLERRFvocArbbUqm41OHtgh3ThIW2KkX9fhZJx8vb4vt6XUgQW6hlsGushjkY7xuMYkQzLZMKSKursnA+GSlHfqzPIEiuO6sBg75q4NmwCqEC3io6uTcsZLaWdfhBHj0DKOQqq8WftdrJT8u/XBEqJrSdw6cfaqXmpeG6ILMhbLP/h3jELMWea3x/GEoAvZV00vI6e6HCwHoeO16/uobAjX+gWOFCCim323/3dH6DcQ9uEg5q2uycXBy1hmS03wXBvj4Vk2fDygZGKffoRpjZWO/EgO7yM0y4weRmTpoBP5lhe0aBoHCilnUAzBhR1igGMSW4yrfSwCo/eMVYEwzU1LdrED0TPrEDKlEStia9ETrowfFXhwo1eJbvUZ1wCRb6j5I5/6+7xbc9jPQ2uK3jsLUM0h7vHBZQuF0TX1kAiCyZqcYwxYRGa+krk54EbsJowCeSDk3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(376002)(136003)(366004)(346002)(53546011)(86362001)(6506007)(66946007)(4326008)(6666004)(31696002)(31686004)(38100700002)(2906002)(36756003)(316002)(66476007)(54906003)(66556008)(6916009)(8676002)(4744005)(6486002)(186003)(5660300002)(478600001)(6512007)(26005)(8936002)(41300700001)(2616005)(83380400001)(156664002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjFOVjFWODVCWXRFR21VM2xKZlBxTFJJUXVjd0NFTzhnTjBGUUxSQzl0Qmds?=
 =?utf-8?B?VmlGdlY1K1pQVjRtRVJHRndKb3Arc0VMTUpTTjlGWXYrVWdrT0ljNlFlZ3BD?=
 =?utf-8?B?cHhBaXJkRWg1S1ltTGJjTWlXRFEvekpMdEpRUGNCNEd3SklMa0Q2ekxzczBj?=
 =?utf-8?B?dzAzMVBQZ2VpL0UyZFhlbUp2d0VodkxiYTFYaVJNdXhtU3h2eWNGMlA3NUli?=
 =?utf-8?B?QlNIaFJMc0V5QnpUeTROeWhzTUg2UXh6Rysvc2puaXRLT1NIN2pzckZRYjIr?=
 =?utf-8?B?WVVUZ0FrczlXRTZ1dGNFYVp0Wit2K0kxMGlQc2JkeVdXYm8waVhKZTRYdVNx?=
 =?utf-8?B?N3pMVjhhblhIbWs3eFhyaTVqUUxSeEZNMkozWlpaRXRTL01Icms0MGZmMnlN?=
 =?utf-8?B?b2VkVG8xenJTUWowOS9MekZQZkZ1dlpucStGczU3VnloUFczK0N1OU5lcUhP?=
 =?utf-8?B?NU5mbE4zcVo4aXQ3U1FTcGxXN2xFa01JVkRsWmZNaXF1aFhBalFBazUxbC9P?=
 =?utf-8?B?aUpOZFBhL01MaUxoZ2hVdkNwYi94dDJCNHQweG1EWlBXSU9xamxZaDRuN1dY?=
 =?utf-8?B?VUFVUi9KS0VTQVVEY2thL2RuR2FtejA3U0J0c1EyeWJvMFNxelREMlh1YnY4?=
 =?utf-8?B?TVF0NCtXVUl6MUpDR1hqTzF3S3A3MHYxU1BiT2pVSHhVUnQyZG5xS1VwZ2FG?=
 =?utf-8?B?V05oQWJ1MVZiZkcxRFBOaVRnMjdBTHZUeTJ3Tyt5NG94Y2pCUVJiSi9YRDEw?=
 =?utf-8?B?cm1IUXFxOVhHQUZ3Tmphc2oxTGllS1V1M2kwVmVVQ3VXeW5pcVUvY0JxSGw4?=
 =?utf-8?B?UThQLytzYlM5dDBOa0ZwOVZmVHdiMWVKK2JhMjJ1bEFuTldCYktOYWRmZE9r?=
 =?utf-8?B?MDVyZlNHWEdjNU5nMGIza01zRFVxR2p2dXN3cFduaU8rYlg1cHZKT3Y1NnRP?=
 =?utf-8?B?UjFaT1NPNklZNkNEek1aZ1BkZHh2NjJGMjFBaS9FbnJua0RIdit3bmdJQWtM?=
 =?utf-8?B?R0VId2pkblNXdUVoTUVaaGw0YlRTd28zVi8wbURMdkpvVUZ5TlM5YTkwNVJK?=
 =?utf-8?B?WmFKNkdBRTR0ZXQ2RDN0bFlTTVc3dGJ1YkFOQldEUDhRdXVoVmtmSjJZOFhR?=
 =?utf-8?B?MnZhQ0t5RUcwMmdVNmY1SlNYb1VkUnB4WWVBRzVMY2V5cGc0RkE3eklGOXFP?=
 =?utf-8?B?SGxFQTNrV2pueWMvRFVYVFB4b0ptU1FOTkMvdmVhYlR2Vkd3V2dHZWRMbUNw?=
 =?utf-8?B?MldFN3N6c3JuN1k1eENhQStaaE16Wng5VXMrRHhYRTlJa3NZTDZzZmkzN0Nw?=
 =?utf-8?B?cjNGS1h2RFhVYTlqTk9OdDVNVGpvNHZHYmZJS0xYQ2FWSExvMEd0bFdBcDkz?=
 =?utf-8?B?cDI1a2pVL3NtTU5yVnpTdFVTRmFTdDFEMjRFRmdib3Q5NGlJVnRWMUVIYmtT?=
 =?utf-8?B?VHVZa0F6MDNhYzJaOXJxRzJhWFc1VjdPTFpuSG9DQ1g2czhyS0RXVXFXVEhY?=
 =?utf-8?B?VWxkVnkwUFJOdDZqa1lCZW9JS1o0QTRsT29zZGhocVZQck1JYnhkUTVVaVVa?=
 =?utf-8?B?Tmd5VUMydUplcFNZeFRoNTlpeUN3MFRSVGJSazZGSWtiUUZjTWFSUjcxdWt3?=
 =?utf-8?B?UG9kVSthaTVBQVdtZXg0YXNjMEN1MXNPb2FUcnVDQUZMTFNORDJETFplT0Zz?=
 =?utf-8?B?T0dMZDB3aVJMRFNFRXVzeFZoV3FNbms3NEZ0UTh6ajRMNHRVcC9DeEE0d3BX?=
 =?utf-8?B?dWdoWXJwQitDQTd3LzZYSDg1d1VUMTNmOHltcFc0dTl1YjZRWXV6OW1kOWV4?=
 =?utf-8?B?WnVnSy81UVhmd09KMHpLNXdXWElYWGdrL2hacDIwSzVCbXJPd0RxMGtGQkM4?=
 =?utf-8?B?NklCMXBCRVBLT0xMY1lDTHdMZDFWVUVzd29vRmg3WU5DWEZwOW1jdWRKRmZo?=
 =?utf-8?B?LzRDRkFSdGhSa2Fjd055MGFWM0R5dlFQVmZhRDB5RVdjSGtFM2lzaEltMjBt?=
 =?utf-8?B?a1o1emRHVDJFZDNpYlVwdTJRRTRsN0IzS1hEZXVicW1VUlJoVEFzaUx1RnJi?=
 =?utf-8?B?Q3ZWdXZLaDRFNGdlemxCZzFyaHpXZFU2cTJXYWhobU5QVTEzRDc4akFWU2xZ?=
 =?utf-8?B?azZZcmRmWWhaSnpDSUwwTEYxSHlJVXR2amp6T29rU1FKekJuYjNDMTl5L0tx?=
 =?utf-8?B?U1B2T05BMXRoZ2hlUkMwVzhDaGlkaTE2R0t4c29ZaWZGcmlqQXJtS2RHL0Iw?=
 =?utf-8?B?d2RMeERhWVJqN1F2VlRhNVFDOUh3VEpSa2tQdGtrL1kzY1gwUklCUzBBQmdW?=
 =?utf-8?B?K1NkUDF4QjBOK0t2TTMxVnZrSDQxaWl5SFp1ZDl1L2pvU2lvVStVdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e83adf-29ed-431b-f6fe-08da543148d1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 09:26:27.9915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/newxIqWraV0zoXqbjGppHnzZJ67nOmgED4o+mALaZj+dd9pOxXPTAmAw+Skkc+UgnIShD8knrjTyl7QHs9dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7005

On 20.06.2022 04:44, Penny Zheng wrote:
> When a static domain populates memory through populate_physmap at runtime,
> it shall retrieve reserved pages from resv_page_list to make sure that
> guest RAM is still restricted in statically configured memory regions.
> This commit also introduces a new helper acquire_reserved_page to make it work.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v7 changes:
> - remove the lock, since we add the page to rsv_page_list after it has
> been totally freed.

Was this meant to go into another patch? I can't seem to locate respective
code here, and the remark also doesn't give enough suitable context.

Jan

