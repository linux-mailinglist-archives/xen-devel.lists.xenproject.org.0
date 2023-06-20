Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4797363B5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 08:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551427.860972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBV5o-00062M-NP; Tue, 20 Jun 2023 06:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551427.860972; Tue, 20 Jun 2023 06:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBV5o-0005zc-KE; Tue, 20 Jun 2023 06:43:56 +0000
Received: by outflank-mailman (input) for mailman id 551427;
 Tue, 20 Jun 2023 06:43:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBV5n-0005zW-Ei
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 06:43:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d286a63e-0f35-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 08:43:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8087.eurprd04.prod.outlook.com (2603:10a6:20b:3fb::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 06:43:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 06:43:22 +0000
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
X-Inumbo-ID: d286a63e-0f35-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvd6RArq3Jlzi5Rw1dU4epvYKtSl+ewETtqjMvfIkFY0ZgQRP3yQstsHYGrUoKXgGC0O+WsdFSPuqd6CvHPL9TfA1aUksB5mQZGRo6fAy3bWRs0YdeWk1K4pqGW/qVS9k/irn53kXzvyf/IzkV/jEp2qH4B/b4q1kG15kglWdCX5k9ihDOXawYKIv5sif03+tN+woQdZfUPAl43heUCFN+jwL74OMv1r7dQiS749eXzH9YrbbyfM29YHIO8bATPOOt4uV6v8tOQyH7LRt4gikIeXpViH6DprsicAIdmb9SaqHk8DnMVXQFFiVdK2ylBWWgLxUe1bRJCG/a/0d7PYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8+qmwKYLtv0OXg8IZ6efMfNz6pbzqUUf6Ey7Im5JAY=;
 b=BKzFEQjtUHwiuqnpiXsbOtroPdGJMLYzgioSusrXNAZhcD8LA3fV0c2gMbK2KZGLzvC61GxVszGECXW9tsBu9xLyUuQkwCvcr5qda5H7J4BbykcSFiP/KvM/H3TSDuxY78JEPqXaHOrJGptwK5AgG2jk+v+WdJbVqgZjeJ898oKQLIAir2dMqEnWvqakUfE1T4bWt6Uojv/eQirbKxWeh1E1lvwxh0u7OXw2SQ5XIfZdxW1u1WBpya3l3fFbPo3sNGPW1gnvMDUh0LThKHb05PnyqDuEQHtmz5exYdBhSrwCgWt71vo2aWkFdgYeOaiPtux3ofJGtZTu8KyDNM2Plw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8+qmwKYLtv0OXg8IZ6efMfNz6pbzqUUf6Ey7Im5JAY=;
 b=j0gv4zJqXo4g/izs5Btvc92MjpSVROHg3tR3R8gGtXKcrlSRubTnI7gexBo4CW4uxlGEJhp7wk6bS9i3LULj740Yjbq9ZtxtNeKGYMgkdj2oE5lwb3CVuLosE4MXEaM7w68Tbn0avwfDcAK8BeDAGiu+oKyK/TWJ0NcHEPROHZ9VwJmo0rzpKZltwBiM27a1+MF/0u29ZBr5rL3TEVCZQbpCxeKUG9Rm8QWHVG1p+JAlUEPp4cOeXtfslO98ThOFcbPCA+we1nURGQAZm55nU7pmC1J4xaf5kGQKzYBuMDBqKM7RIMaezLtshU8V657qrCRSz1uHvOKZQK02d72yLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c25cdbe-41e4-246c-46f2-9d544ce7cd4f@suse.com>
Date: Tue, 20 Jun 2023 08:43:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
 <8383dd1a-064c-17c9-bb7f-4509518b9b42@citrix.com>
 <85e5d7ca-e6e1-3802-22ac-5728a03fd86d@raptorengineering.com>
 <07901266-4536-bcd5-70a4-5b5675a1ced4@suse.com>
 <af192a6d-2ab8-6934-3770-6379ddb6381b@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <af192a6d-2ab8-6934-3770-6379ddb6381b@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 3061e3f7-3db0-4947-9244-08db7159a3d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FD8XesiyULjHs3PI2LQA59mU/Oblzp0D/9W1dg/5hG+KsD49gfNbNL7X1oz0tdYVAWxS1pAoC/IfpBQm1FpLzrkofwB/8jeaPBW7rMzwnXDXR5T0O52kxd6XBubGk9Wg7I8zbDbCONNuBb7tvw3Qb/xcx/JI91NCA5CA3IG2R0Q21T+7cMDKQY2VbfyXWyj3s2tImOWnmDLObYq7FOxKpYmC2A5Vb493+p1gL8uf48JRqB8LH+t7HpnIheQhCsI8TqqKku+I2TEp7S8QfGxqsdRh3T2vc7n89/g/pY3gcGk7t9c3inXiouVlBXYvbf0+filsHGlp/+uJd7p1MEPiMml1lM1DsZfb7nXfn1hXpL7GYfVlz9wcGxZ83RQXODnsyTFtrqm9jILA+x+1SOdtZFvzUVgYNYpFsrKSDsTQb+mX/riL3BgEsALCg3X6rbXfiQkd+4yVGkFqIymCcoEICXF6CJ1p1O63Jghr1afjdJZ/2Si8Xm3oHubt3E3VnVAnxBo54gFXj6EbYscz6rjrHGL7NyJi58ZgD3e8ASJodesiUyUUxycSHJ3JNLywN1stQIEfIeafL1VlsEvWeRT5h3fDJ7VWrTizlAJtjCEqLOQg7fTkEcR1AOviS3Nu6AFkrkh7ecIJBrKwlgvAgY5WEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199021)(186003)(53546011)(26005)(6506007)(6512007)(6486002)(36756003)(83380400001)(86362001)(31696002)(38100700002)(2616005)(54906003)(2906002)(8936002)(316002)(8676002)(41300700001)(31686004)(66946007)(5660300002)(6916009)(66476007)(66556008)(4326008)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXpwVnFUN3FQenhvcG9yRDNVM0xvM1dZUTkxQlQxRHI0RUJWSEpxN1kyUnI0?=
 =?utf-8?B?NTlUcm1NQmRFa0NNQzVPZlJ3MG15VjhMcDA0NXROZ1NyRnlPSmR0VmpEUEI1?=
 =?utf-8?B?QnBUOHhlRkwybE1RVnRIZTVEc2xNN0p5TUh3MElqOFNhSTdXUFpIZmczQy9o?=
 =?utf-8?B?THI5Qk5FajlTM1Yydk9FR2xOSnk0ZC91UWxOMFRlQ1YraGI4MmYrNHhJQXdC?=
 =?utf-8?B?b3FPL0VnWTNhY2p6R1N0NjYyZHhsZVg1RW0raTd1M2RIeWlwelhoM1U4OEl0?=
 =?utf-8?B?U2NvdGxpOFA2TXVURDBZYXFzbDhOYTVaRDIyYmVGNmFKZmt6dGVkdlkvRm1G?=
 =?utf-8?B?S1RwcisxTTIwWWU4VXJGSEFZQ1R6RTRJTCszdi9LRDJYSUExMEw0TWNJVXhl?=
 =?utf-8?B?TEUvTUZpVjZYK2wxQTc5S1NUK090YXkwR2J0anRzaFhDRU9yOHBhL1RlU240?=
 =?utf-8?B?MWRscWVibmlsMSt0VEtseUVSSUtQSnM3dFhLNEljM2tjZkJsUC9Gb3gyczk1?=
 =?utf-8?B?SHNFRGp0d0ZZaDNOa1Z1N2xXUnVQOXZLRHZZdVNhSG91ekhoZ3hUWlhDTEdZ?=
 =?utf-8?B?RWhzODhTbjlXRUNNb3hxaEl5cHhmNm5FdEQ0RE5wUjBCbVdJejFYb3AxU0xt?=
 =?utf-8?B?SW44VVBoRkFzYWlJUDlnUmM5MEkrYUhwRnFjYnRMaHpsL1VOaTY0MkJtMS9N?=
 =?utf-8?B?SUxZS2U4OUJuRncwOVZMVXZGY2k5aks0T0gvYVR3N3cvSE9kSDdvN2xka3Ix?=
 =?utf-8?B?NFN6OEdnUzZVbFMxZkhxeGhnUkQ2WE5maE0vOVpnZk9QeWoxalFua2oyc0Ja?=
 =?utf-8?B?NEtJMW1TR3QwMUcyeDgzanlBM1cxUVp1NmR1T082eW1abEZkQm94WjdKVkFu?=
 =?utf-8?B?dWlCRXBnVFJsVHRmR3dNOHFDQnlIU3YxOGFTNng3bnZIalhQOGRYYmorY0VI?=
 =?utf-8?B?NytZNU40bm83eVZsb0hkVWxVT0h3WDFKMkNuaWEzVFB6SWFpbmR4bzNPRVdm?=
 =?utf-8?B?MFJDWnBsa0xuZ3ExUUpGZ0xBd1dzcEhQZDhwa3V0SFE0V2VKK05Eak1ZdlNt?=
 =?utf-8?B?c3FUdDhKNmdnK0NvazRwUkplYVN6YUZzcUJuK3hxeEtPZUlJK1ZqVWtwbU1V?=
 =?utf-8?B?MzhaZDQ3eFhtTlNyUFlia2FTWDZ4ZTVHMktPY2o0MHU5UDFTU2ZmcDJTcnph?=
 =?utf-8?B?aGl0aUR3RjBndUpBQ3Y0cGpnU1pmN2Ztbzd6UjFSdncyL2lObkdxcEphbXNk?=
 =?utf-8?B?QVB4OUlVUVBBOUtsWGVSSCtHaEFjcFdtMHZxdkJsait5Nk9qWlNzNW53R012?=
 =?utf-8?B?WmZYbnlpdnAyNVFRdW92M3owdE1oN2hoVm1ndWFsbXY3V2hqNE40aWUyR3Z0?=
 =?utf-8?B?SkcyM2VnQTU2UURpWDIwWk5ZOXdoYzJZTFR0QjI2N2l1YlFVOE51K2hSc25Z?=
 =?utf-8?B?NGJzR2hUZFBMSjRNQSticG5zRzA1b3dRVVlzWjVxSDlvTHRyYlhyM0JDOCtr?=
 =?utf-8?B?Wm1adGtlbGsvUWwvMWxIV1pXS3V6UVNXK2V0QnFQQXN5aTgxS1J3YXBHS1RG?=
 =?utf-8?B?SDg4ejlGMWQ5R2pYZnIvV0NvdWx6YWxQbjU4Z1M2L05xTXR2SWdrbzgxbXJq?=
 =?utf-8?B?NmdjOFh4VmI1cUJHTXM3V1loa040VVRnMkU3NW5sZ2dqNlpPMFJiUnR1WVQ1?=
 =?utf-8?B?dXJXQmIxZW5ibGtoTERTWm0vZEZrbmZDNENMcWtMalI5L3lIbU0vaU5zZ1JM?=
 =?utf-8?B?YW9ncXhEa0tUTnFZRXFSVGN1WWVSc3NzdHB3T09hbHQzL3U3SjR2VUVxVUw4?=
 =?utf-8?B?TWhTUGlXak9PWXJYR2JnM25JRGphaTNRWGVHWDdrSlUxRERIcDRZMVpTaFpi?=
 =?utf-8?B?eUhrQWZmVis1OEplMWlRMGwxMFBDNUpTaHRMTkFKTk9qM2Q3OFNBcGg3WkhX?=
 =?utf-8?B?dG9mSWFERUd3eXJpRUxWMWV2U3lNZFVEYWJrbGU3YWlwUm9CdWZzK3lzeURY?=
 =?utf-8?B?NlNYcWtrUUN1RGJuRXB0ckdBNVBxcG9SNldoMFdwRFIwc0JDczRXRUFKdEh6?=
 =?utf-8?B?QjM2cjJSdVg4QVFuWG9xWXllaVBtcStWYlRFVnBqUVRKKzlpeHpyUEJQQ3Z2?=
 =?utf-8?Q?9I1ZBP9J/86T8jDz2wP56WVtW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3061e3f7-3db0-4947-9244-08db7159a3d1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 06:43:21.9467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFVXHidKxOW3qFXn2hdKqIxq2vmK2x8lCrLD5etZb9FEjESgmngpO3HZrpBfVvmKzO16ULZ5iAf4QGjrrGsgGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8087

On 19.06.2023 18:29, Shawn Anastasio wrote:
> On 6/19/23 11:07 AM, Jan Beulich wrote:
>>> Good point. Following the example in the Power ELFv2 ABI
>>> specification [1] for function type annotation, I'll place
>>>
>>> .type start, @function
>>>
>>> in the ENTRY macro. It's not clear what the difference between %function
>>> and @function are in this context (my toolchain seems to accept both and
>>> produce the same ELF metadata), but the latter is more idiomatic in
>>> Power assembly. The same goes for its placement before the entrypoint
>>> vs. after the last instruction.
>>
>> % and @ are entirely the same here, except for targets like arm-*,
>> where @ starts a comment.
> 
> Okay, thanks for the confirmation. Is there a preference for which one
> is used? I'd lean towards @ just for the sake of remaining idiomatic,
> but since they're equivalent it doesn't really matter from my
> perspective.

In arch specific code your fine to use what you think is a better fit.
There's a proposal though to make these ELF annotations arch-independent,
and if we went that route, we'd have to use % (or allow arch overrides)
to fit all architectures.

Jan

