Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAD95A2285
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 10:01:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393704.632804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRUHL-0005CK-CD; Fri, 26 Aug 2022 08:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393704.632804; Fri, 26 Aug 2022 08:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRUHL-000594-98; Fri, 26 Aug 2022 08:01:23 +0000
Received: by outflank-mailman (input) for mailman id 393704;
 Fri, 26 Aug 2022 08:01:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cVPj=Y6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRUHJ-00058Z-Nx
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 08:01:21 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2043.outbound.protection.outlook.com [40.107.105.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4549f6fb-2515-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 10:01:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB3214.eurprd04.prod.outlook.com (2603:10a6:802:6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 08:01:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 08:01:18 +0000
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
X-Inumbo-ID: 4549f6fb-2515-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kj5Uo8eWLkS7YVGpudRfo1XXCGHZYOwQi5kq7Gu1P+jh0eE4PQkFO0fSW5jY+GXs5sJbRcw6PVgcx4BUJgHRoR3f8UvFM+G0/xCtsRLTm96SYDzxrX6HxpsgVO1RPKqeAciA/lLFlUyAcC+PwapuRivhQCrbSjSjyzi+L9Gh/izSvJmdaSuyCtxyHpv28/j2+dP6tQfhWYDrI9j8+wspTr6Sg0TYg7KxEiopq5zOEckXLcZfAB9GEaoAxL3o4hqDOJDg+4yhSxQhQUN7l1Zvtu8AEy749YQaJZBL9eMarnd/ySPIGSXgrfkUqaBMhWxbvW/FPFRZcMPAmUX+ZlLfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtpTCoOMpnhczrpSIGOvpOg2fd+K2Iz3qYZ2LBR1pAA=;
 b=YD8zjEY16kBDKCJVvE9VElvDdVejd5EJvDOIkkBFfLgz4xyQMu8IipfOiaVeGRpG/dLaLNCwZ9Hon44Xcvs3O8+FqlQCUlCkDUf07GtONKBHU/3w2fPTHfyyxmksqZ1Yu5EnwEYTyXZmcnL2hm5idg/BOl0caz42IeEtNH0f1Qp7+1vVJeD7xY2RbavGQUGagqRGt1IPfxvOZ1++coc1vlfGE66qdVj7yoM+V22Q9vj0ge4GLOcbA8m8T7i3MiNTSwscHFfchukVXe9jH8iNR0k2X8BDowZTVIRQ4p4K9qnvDSQpps/m9uDDKWWNFftDdf2xQIzCXUAmZUKKKZvFqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtpTCoOMpnhczrpSIGOvpOg2fd+K2Iz3qYZ2LBR1pAA=;
 b=qPlYg7PALdxwjllirwLua7CuHtHdq1vcp53SwjAgVo9WWP699Y/hnF/3uqkyCUl5HuPfpIO47ttB0Ki49xWNS1awrOQJxDVX45WmaWZjfRJkRvvq8kA0dgi1axs8G+iMvCeRjVinYAkO0UVHHOPnI2XoxD2ekxye69g3dTCkbWUXqlwhSKxuu8Wy3lPZY8mw7Qh3xm4rhROgxfaeLFora7qerqUPmHcOIxiScrOLTyoltULXnx0g1VDR5L2RyQdg6aXf8VNdTSrmH46f3VDM2M9Ctt582L+3+OPQtI39nAYRasF+CItKgERAN8Grq4458gSZhCnISNG73JUo6NFXDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bfe91fc2-c3a4-3361-509e-28493bdb958b@suse.com>
Date: Fri, 26 Aug 2022 10:01:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 7/7] xen/device_tree: Fix MISRA C 2012 Rule 20.7
 violations
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 andrew.cooper3@citrix.com, bertrand.marquis@arm.com, roger.pau@citrix.com,
 roberto.bagnara@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
 <20220819194359.1196539-8-burzalodowa@gmail.com>
 <9b053c3f-0274-a63b-2a6b-a1715c639092@suse.com>
 <25e4c770-9b97-a96d-5f5a-fea815bf9737@gmail.com>
 <7d32d3d3-daa6-5492-02fb-db6ca5f154c9@suse.com>
 <852c68d0-bda1-e56e-85c0-500c498054a0@gmail.com>
 <2ff949e4-5f02-f476-7b14-252252d1b8b5@suse.com>
 <alpine.DEB.2.22.394.2208251045380.733916@ubuntu-linux-20-04-desktop>
 <11fc391d-f53b-1bc0-19ec-168ec827a1c0@suse.com>
 <7348b3d9-4ab3-743f-252d-0441cd25dfa7@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7348b3d9-4ab3-743f-252d-0441cd25dfa7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83ec3401-3913-4f50-284c-08da8739281e
X-MS-TrafficTypeDiagnostic: VI1PR04MB3214:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JGrPlqgOrMtS2NHq125rxqexA4pB+QwsL7ugMy5iG75guThUvGJrzMX44wkKTbcQTvAuWtgJljOw1b92qJgGATY1k7Gtk/UE1Cjq8hnbdMIFldvDxD8TPFM6FAgZZp1TmIs2uGDU0VvzDo1v6C7iHFz1rv1Vqg3yOSTSEhXG0KkukJ13+5dqteutCvBE1NucgHoX+PHWqH36dF8NKIakMXG3idoymNty1MKGmA1hCOr3F5bIDYoCgJIseQW3U/G5Bo02MF0HFgAiOul7dsi0y0OmpfkjN5jYywb/fAqo8BfBWI3B+/5dYhwfmNo2YKRLKh9MkEjWGF1SMU65VvH4FhfacLcLFumTglelLpDsoXiL6BMgxYHUyXKUz03wB1uqb5s5ajmXYWmCnOgC8bW4u6vmAbTxHn/u9vm3z/teJE7602h0YP/fif/vQtSnHznA2f11ULdQ7+z4/AosLvGUpcoyWxzkAP/5OR6Z2NcYYcx/FbOCOivKUqJ8pYkldJIw4c4A8ch1D/vDjxfLeqHN/ljWlPbwGMI7T1edgq+alkEXn5q0+LscEioV6DXRDQsCuNozJW/o9VxpVj+sE4ChPLuYosOjzQU1//Zam/+HUaD5GUeb03/UU6MzLlCFWEi9pkuhtgpW3kWb9wW08Eh2K2Ft0fuPUjvoJqtbcYSDW9T3wAEeYo7ZqaPAe3KaqZDp1KaBlK8gyPQWqcYD5xMb04El+KL3LqM8DD2b3SFjsRh6j/JixT/uK0jlFPlXEQHOei2+liY2+xMKc55vs+ITwCuoFAzCGD4KiukGOwGw8hU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(376002)(366004)(136003)(39860400002)(66556008)(66476007)(66946007)(6512007)(8676002)(478600001)(26005)(6486002)(8936002)(4326008)(41300700001)(5660300002)(86362001)(2616005)(53546011)(83380400001)(2906002)(31696002)(54906003)(6666004)(38100700002)(36756003)(186003)(316002)(31686004)(6506007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFZERTc5TVVwc0Q0Q2FwdHZrZGV4RVVvYVRSQUdVcDZYbjNzbWllVUZMMU82?=
 =?utf-8?B?YXluMm5hTzVMNjFjVlp4WHhKTmtWWDNadEJTOXpabjhGTXVPWlJGdmxjSjg0?=
 =?utf-8?B?dVhsdEIzZHZhUTBtUUpSSDd6ZmNXSGpxdFRNMDhEUnkzN0wvdVZKbXd2aEJH?=
 =?utf-8?B?K2c5UENQVUdMRHZadEdLRzV6WFN1YzJjV2hDSHZtWWNLTytucTdXRS9Iekov?=
 =?utf-8?B?MnlLcnpVY21COXh1YldTdmZHMG9wUFk3UFhZQ21kaXAwdUtPUkg1dWNGWHhB?=
 =?utf-8?B?d2xsVGpiN3cxZThwem5LR09ZVUVqZ1dxd3JXa0hOdkhoV2NPUmgwYlgzT3Fy?=
 =?utf-8?B?bkhUdTdEQk5DV3Y4LzVoV0hhV2NFWG51d0tTMHQwWXRXTjArOVp6ZFhlM2V1?=
 =?utf-8?B?TUxkS2FuYXJlaEUwWnZ5VHhwQlYyMHlNa0ZaMkFVTWp5VEJybE1IOWhTL3Bv?=
 =?utf-8?B?bXloL3ZOTWtMcHU3YzRVL0lKcUtXR3J1N2huUTFxOHhUQnpMUFRpSDBLd1Vy?=
 =?utf-8?B?T2VTT01yT2VsaGFhcDZVcVBYV1ZrMzE5NG1aMmEvQkV4M2hYYzBwUkJEc2k3?=
 =?utf-8?B?QVQ4OFgydVR2UnBNRU1ZU3JDSStwM2FxODhabDdRcDM5by8xNXFDeU8xdTg2?=
 =?utf-8?B?REJHVzJmc0llL21Iam1YMVV0VFE2Sk9QWS9FNU1JSDdOemFBdzZhOHRTNm5Q?=
 =?utf-8?B?WXZWZlI0dDRlZWRmcnpKcm13Nk1DcHJrU1FZNGx5MkVBeWkrMzJrUW1ZMzk3?=
 =?utf-8?B?ZFdqemh0WUN3Vm1NekJ1UWN1WFNTUFRWQ1h3UXFhejc4eFBGRUNmcHZ3VHNp?=
 =?utf-8?B?dFNJUytNbmhNdDFqZ051MExJYjcxT2xFbUVKYXI0TXQ1dDQvQkQ1WGpFNU0y?=
 =?utf-8?B?OW5FQ3hxS3NlWGZadFFHbWpYL3QwK2s2VE95UGsrY2o0Q0VqcXlNcDVSYTVM?=
 =?utf-8?B?WmVlNDFBbVBKWFA2enNydFhja2tteVF5ZWZCRGpweFY1Vm4yaFpNSnB2YTYz?=
 =?utf-8?B?aVlkOHJDN3U2QlU4M2RsdnF2aHQ4YjUwTGM2VHIxaDI3by9kbEtTL0k2dGRn?=
 =?utf-8?B?MHpZVXdoTWxyV09VNTVITXJpbitSYnBGdWh3NWQrTld2aThWb09PcE0wSnJU?=
 =?utf-8?B?SU9ib1lENkZUWEJqYlBySzZuK2FSeml1VVhYQjRxOVEyRjJyL3lpZGZKY1U0?=
 =?utf-8?B?T2dINXY2UzZSSEFSNHltcnB0bjRZRktucTBBOVZUQ0Y0OGhuWVE2MmVySzM3?=
 =?utf-8?B?M1NlYXFwOU16YXI2emdnR2xMS0d6WHd2SnhtWkN1dWdlSHN3TVhYYkRmL1ZC?=
 =?utf-8?B?S2ozRU5yTkpNd21HUURyenBwajJyRjJIaTYyUWFoKzN5VmJ2S3VkK2drZHBz?=
 =?utf-8?B?TjZqSkVRT2xmT1hyMzE0eXFYd0s1UFBCVW5Sa3M1WTVzTnRONnhBZU5sN1ll?=
 =?utf-8?B?YjRLT3B0aktLUVZVZUpTOHp1SzBWNW1xdE9uSStya05xRFNuVDJFdFk2QVl4?=
 =?utf-8?B?M25QcUxYeW9WcW1PM1AwV2djZFB5QlNtSGRBS2Q4TEMyd0xyUGxJa29MYXN2?=
 =?utf-8?B?M2t2NzdoQUZNdi9uYlVDMDg4ZjRBNHA5L2dPTDlOa3JYSForWlBFRDUrNVBI?=
 =?utf-8?B?U1EwL2h6R0VBaUpzbnMvRFB1cGlKRkFTN2p0MjRZRWw0dUVxcnRxL1YxYjQr?=
 =?utf-8?B?blhEWUYzZVFQL0g1M3FMUFZTL2tZTlB1RTh0Z2NaZU5iRGxxZ2RoT24wNjZh?=
 =?utf-8?B?bGtQaWtDbTdnZTlESythVUx0ckVNeGorZ015QzZKcWMzcVpFczczZkNUMC9s?=
 =?utf-8?B?S1Zxa2NFZXZUQzlVSDQ1UHZCeHlYYVZOQVEvNWgrTWFUUXBMeGc4SjZzbjFi?=
 =?utf-8?B?eFIreXRuZFZPdmdEUS9sSURDMVJJRm9haDRSbXo4dUcvVFovWVdpMGZzNTNy?=
 =?utf-8?B?bjlyVVp0UG9yMEYvWC9FekIzdy9xejZ0MU41MGlNb1N2cWUrZU42dy85dUly?=
 =?utf-8?B?VmRLTWRMU1d1anY3MXAyN1l3YmsxWHhiQkFIbkRTUG56bStNWUpkUTlXSE5M?=
 =?utf-8?B?T2p3eE9GdlFJWUJMeFg5dTI5ZER1NUdQMHpQWXZNQTZKM2luWndaZXRaL0tl?=
 =?utf-8?Q?Q5xQ6TNC0sUwMajHpZuxliIXc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ec3401-3913-4f50-284c-08da8739281e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 08:01:18.3390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nof3spKrxX135zgfl+eoCKPZaHR2/Y4jPo02MtDG8qDR1TlTjWOX+wm/cGJ85Ihh1sLp2hmXyF2azVqOPRctHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3214

On 26.08.2022 09:58, Xenia Ragiadakou wrote:
> On 8/26/22 09:21, Jan Beulich wrote:
>> On 25.08.2022 20:09, Stefano Stabellini wrote:
>>> But first, let's confirm whether this change:
>>>
>>>
>>>   #define dt_for_each_property_node(dn, pp)                   \
>>> -    for ( pp = dn->properties; pp != NULL; pp = pp->next )
>>> +    for ( pp = (dn)->properties; pp != NULL; pp = (pp)->next )
>>>
>>>
>>> is sufficient to make the violation go away in Eclair or cppcheck.  I am
>>> assuming it is not sufficient, but let's confirm.
>>
>> Well, even if for the lhs of assignments there was an exception, this
>> still wouldn't be sufficient. The minimum needed is
>>
>> #define dt_for_each_property_node(dn, pp)                   \
>>      for ( pp = (dn)->properties; (pp) != NULL; pp = (pp)->next )
>>
> 
> If pp is assumed to be a valid lvalue, then why it is needed to add 
> parentheses here (pp) != NULL ?

Because in one expression is doesn't matter that in another expression
the same identifier is used as the lhs of an assignment. Whether
parentheses are needed should solely depend on the operators in use,
not any further context.

Jan

