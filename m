Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE92F3C9D63
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 13:00:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156544.288913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3z5E-0006S2-5U; Thu, 15 Jul 2021 10:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156544.288913; Thu, 15 Jul 2021 10:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3z5E-0006Pu-2I; Thu, 15 Jul 2021 10:59:12 +0000
Received: by outflank-mailman (input) for mailman id 156544;
 Thu, 15 Jul 2021 10:59:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PyhT=MH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m3z5D-0006Po-3M
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 10:59:11 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae21a840-e55b-11eb-88a9-12813bfff9fa;
 Thu, 15 Jul 2021 10:59:09 +0000 (UTC)
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
X-Inumbo-ID: ae21a840-e55b-11eb-88a9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626346749;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Rq5b8wgaqTmcuVHNk1HlBTa9j/k9aF4p+gNzPpA7o8s=;
  b=C9F3HyeBh5iXi+zkhk0ojrb9rT+iZIiqihg3hFVMWmG1WCtX+8ue2/Kv
   MLFYclsqNtoJYMIQjCz0wFQQlyoIr9oZ5hhwAccPvEeFj3XkTx+cuwMdB
   wXMdM3Waaiu0M4ksGFLSv0qOxGgoibnUDLUPkEW+OTg3BYeog5NuQqTXT
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bA7+qJaJkPQ/IBCdEmGUUaZEVmuqi5CD9UyWR3tvodNoPeJh3yWyzhejBFZWlH1tyvksVVkDlG
 nfuiC3fN9v0RT/ckwShfKMQ2Fs0k5JsRvkB/3cTxHVtKBPSxX74Mw1Oa4R1ZydZDrzr5mlyJ80
 Vd2aYiqpj3TEUSNOTXaD2oyA8gldwPlmPrpoy2tHs9dJE/9DaM4xal21az2RUNnjsP/+gwGRtY
 Vp0MzkfU9I/wypsoEcqUitdeoAeVPqrR3FafJhs7rJ7y6EP8FCV9zo5hbpSG6uiNGlCvzzSH/J
 XdI=
X-SBRS: 5.1
X-MesageID: 48027349
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jj+L96gzO1JlhOBF7N+EhFB9EnBQXzR13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmskqKdkrNhQ4tKOzOWx1dATbsSkbcKpgeAJ8SQzJ8n6U
 4NSdkGNDS0NykGsS+Y2njKLz9D+qj+zEnAv463pB0BPGIaCdAU0+46MHf8LqQffng3OXNTLu
 v42iMonUvFRZ1aVLXAOpFTNNKz1uEj2aiWLiIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7XjoyWsllP73tBzop/M29FDDMuDhow8LSjtsB+hYMBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhMF2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtjgPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4TkWUmxjIQLH48JlO81Gh+e9
 MeSv00pcwmMW9yVkqp+1WGm7eXLy0O9n7seDlxhiSXuwIm1kyRgXFonPD2Mx87hdsAoqJ/lp
 P525JT5fpzp/8tHNZA7dg6ML2K40z2MF/x2TGpUBja/J9uAQOEl3ew2sRv2N2X
X-IronPort-AV: E=Sophos;i="5.84,240,1620705600"; 
   d="scan'208";a="48027349"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqOhKpXbtFxqcN/OjDx+urSyztusDndK/C5w5KhockKWnUfLADtevQ9Gi4c3XRKkbX64iFakH6ZDx0o5usG1k+kp/VnixONes3s1DpXfMNvob+jZiEcF/bG3GlkflEWNM+QEvC/cgBbOLIolQl784ANo39HJiywE5Yj8NHb9jhlU8x3H3i0GGcFF7dFSIZpqlo6TfgvJGQkD+fcnn1+/xalPSjaAqg1H2hC1r4kLk4Rf5iKiP+IYyIw2c8AxQrqMiQstyRkalGDfCFrlNLVeM5Gh3asPXgyNjRrpM5l8PLbsWzFQbCSVSG8fKQ0frMjANZ0lTlZTvQ2QvVML7KlKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rq5b8wgaqTmcuVHNk1HlBTa9j/k9aF4p+gNzPpA7o8s=;
 b=feakfEY0thdf9CCSZECvL1dsOE/Aihd6ZvYpyQa1yldsABgoA+u9OzEHvyUDcmViFgODAFb5imZfU/eme45xmq6Jb9YDre4EXx8Ginl+Gy2Iqs6nY9Hg6ErfCsR/y8T9M3Ld28Iy40VOYo9C31pxeHDlY6IktFGK2og5jQ0GAtrt+6qeC9cIA6k1w4lBcMPnBQMl4C+9xTCDem9RNW9iJzpdWjgYeVrKxk/fgZ2Aiaks0h2Q7LVA4bmOABaefIbxJjr+KEhcAEPUPH20bb5fucJJIFeISht2hwmpWwkoWNzpaVRQNGgtczJF+SSHa1n0KKyRJImy8omwlZEIe5hh3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rq5b8wgaqTmcuVHNk1HlBTa9j/k9aF4p+gNzPpA7o8s=;
 b=GqaCel2nRo9nsrKB2T4SLzvDEVomi3HRmGFU6tXix04Jx0kNSl+xoOuVRtLblX6qnvQeqcLz79/vQsdqAolmHxbs2m+bsMspvOlOsbcj8wmskr2YSVIYSQ63SVTpidXjDxcArocP87Pn4d6QMN1LZsZbd8yONYGAPJ4UnXKLY8E=
Subject: Re: preparations for 4.15.1 and 4.13.4
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a37d01a9-69bd-b656-ff8a-b693dbc014b1@citrix.com>
Date: Thu, 15 Jul 2021 11:58:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0142.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b362af5-3845-45ab-6fb3-08d9477f8b3e
X-MS-TrafficTypeDiagnostic: BY5PR03MB5346:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5346A4E772EB3B6095FDDF0FBA129@BY5PR03MB5346.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TSHeYbJ+jHI3zXb4jjcoTKK09s+wdtmrTwh5bGKNkdFFaR6syiXLAJmgVqpxXt8Vv12sHTOHnwNySdD/pYCc1j2VMGxM8AR6JqOJwB0rxuk4dgopABeuX1Qdq3QVK90Rg6TtIDdVct3uScT7ATT6vj7rc886jFs+fpX0JBp3tmiwtGotaDCEjDyICxI8O6boNCtXHt2KZGNmYZFn+Jd8N+s0tklgKiYoPuHvHV28epRUTyM/ZwG1B0wRYcQOdTC3GHAdNTZBlP+oqSO3sauOY8Rw6AVBZMU1a1/k+iJwgS/Mtu1/JCqRLjgk2YbfEACXWqScGeAFyUeLwNiSHqO9nWxcq16MQoeQt/PmBZEmH0FbsySxX8cqoyVPjTZ5Vm3C4Xj6hX3Jw1oRCXhi0NwjopFMjnm29TiKCGUXK8oF7d6KDHRjFdRalJLjQZyPtc+TAsP+tt+gLpgo1oN38u07sXMPwD2QhoGKUVkoB1SE0lLthEZKk2MaVxYehbHDHuoU8AS+bfO+E3oIeloBt4sBa7zP6qXujIXCf/2SpWqQJMkBNVd6kwDhmLbqO/CZe0efQuoyFNtOCfaadyS6HQpMSu6HznJBUb04hfg7SjePXZRYnUHHLWogmIQOyxUcSFl8olvwMyImxP9RTppIZGD5rR6mZ8KnngthTfOiaV9o9ETSDRRD2eE6fCZaLm7kcH/eZ+7kUWGhmF/TRtkKYKWrIGtbwSHPuCk1OGEWgHh8y7M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(2906002)(31696002)(6486002)(186003)(66946007)(478600001)(66556008)(38100700002)(66476007)(8936002)(8676002)(4744005)(54906003)(4326008)(86362001)(36756003)(956004)(2616005)(6636002)(6666004)(316002)(16576012)(53546011)(5660300002)(26005)(110136005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1JwT2lNRlpVQm5SdUNLa2x1RmpxYXZsYjc5cEE3Z1pySStMNThyQlNDc3RN?=
 =?utf-8?B?Ty9JZTd4ZkFubFIyWVFhcFBUV1Y1YVJYL1MrUHJCUG9yK25pMnlLWFBoc1V1?=
 =?utf-8?B?MUtHRy9qTmxyMHRPWmUvUE9JV2tqaVlLMURQNDQ0elZUcEhsTDZEUnlMWnVj?=
 =?utf-8?B?V292TE1ibHRraWphVkM4WHdOeG44UGxmeWtIeVJia1MyenpGVm1sNjR4S0xM?=
 =?utf-8?B?emg4NVRPV2sxamxCM3R6VTNoaDRIUDJtUU13NW4yZ0RUUEVXMTB3NGFqK0k3?=
 =?utf-8?B?TG1iaWM0MkxGbU02NGY3SFRIVExQNWNpbU90cXlmNGt2S29Fa245UjRYbnpM?=
 =?utf-8?B?TVRzK3ZYTVAybDl1MllhRkh0R3JLMktFc2krMTFlVjZKT0MvNW1kTU9zV1p3?=
 =?utf-8?B?dEpQUmlmNkVraVR6bUd2ZW13NE1RVG1UNzZ4M0ttOXNMaVZEZHZNdlIxYW5T?=
 =?utf-8?B?VEJPUElnVmdCSGJDcEluVnZPMWVIb0hVUC9tWmxHSkxZeTlkY3hIWEdRZGYz?=
 =?utf-8?B?N1R5VEZ0VjdSd2xTZ3A1djMyWmdmRVltaTNRUmVNd2pwSUVqRlZKWHY4Z2ZJ?=
 =?utf-8?B?YVM4R1hMaldyUitnVU9TK1BwdnBYVjJhcUwvWXppckJPOWsvM0xQWE8xQzVV?=
 =?utf-8?B?S0xwak5Ddlp1bWVHQ1I5Y253UUlqRzdpc0crUk1iOWFIdzhGMzFCS1FKUTND?=
 =?utf-8?B?enVxRjZ6aUdVVlJIaVZ1c3hVMGo2ZmVJT1lsdk5OeHJoQjJkZ1AreDNralVB?=
 =?utf-8?B?MmJPbGw0M2VTd0RlKys3dlRKd0hsTysxdFhNV0kxOUhBdXQxRjFKNEFsaUhZ?=
 =?utf-8?B?Q053WUY5T2Z0Y0xpWm84MXhMdHhCdElOOUpWNFJkSDR5RDNObFJld0lMSjRv?=
 =?utf-8?B?cEdmODh1UGQ2dDNWS05qR0hjY0Myb3FEakdNcjF3WWd2MFJ0RFgveHBVVzhi?=
 =?utf-8?B?bXZVb2ZpVTcrQWFtd3RubGVLUFhxVmU1U0EyMng5ZFJaRDRqL0UwVERCeEpm?=
 =?utf-8?B?NUtJM3VHRFhsQ05FaEtrODJtcDZwVWtjNmRiOXpNV0hwbVhyNUp2aXpENEZy?=
 =?utf-8?B?YndyY2ZvODgxNXF3ajVNbUROMEtVV2Ywa3RzM2lReXZWT1dPalI1QU1ZZk9L?=
 =?utf-8?B?ZW9aMXNxU0VKYUdCZnd3V1drRmlFaHNhNm85YnpEeWJGbjRmMWppZEVUV2pI?=
 =?utf-8?B?cEJkS29zd3BzYjJLQ3R1M2Z4Q2RXQ0VFcVNvTXk1SHI5R1dRMDRONEtCYkd0?=
 =?utf-8?B?YnZ3NWdFQVg3RktOeHRJVmpSb1BtcmcwTm8xVjlYaDdLTzhwTmtqWHpaN05z?=
 =?utf-8?B?Sk5SQ2lEY254aTJOV3VFbmE5eC9wanhiakhGVitSVE5wcjY3SU9LYzZHeS9k?=
 =?utf-8?B?eS96UXMzQ3p3bFFYSTF0QkZJNVlMUDR5TmR1MXU4ajhFQXFmRnFtOWRlVmxW?=
 =?utf-8?B?T0RFM1ZVRWxRaE5waGNKeUZpU0c4RW5Da002NkdicUczalNRMUN6T3lKcVlY?=
 =?utf-8?B?UUl6bUNrT3QvbGZNem1jeWtHbWRNTXZHa0g2dVpyS3FHMVFCRm9pU3hPUzlp?=
 =?utf-8?B?cGx2aG16OVpQTjVIdWdTSjlrbkpWNkdxeC9WdDJxZDJhRkgxSmQrczNNM2oy?=
 =?utf-8?B?ZTdMdUE5WEwva1R4cWtxdjNtajZZV0hKRjZiZUxOS3JXV2o3VER3Qysxa2Nx?=
 =?utf-8?B?T0w5TzVZWENjamdvSkgweUMvby9tcTVtc3VQVWU0YlptazF0Wm5NZDZKNTFi?=
 =?utf-8?Q?FNBODVvnr8GzEviQN1xbUH4URAlXDJUT0zCfh6m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b362af5-3845-45ab-6fb3-08d9477f8b3e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 10:58:57.5557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdHsHEav1pOwjdccWb/DZRy2TBFTSp73QSd2FumdQk+0LQDxUdLoNlCUttD11cY2Oh7n2doVSy4CrUpf/25N5nASdn7obtuQTSdr5hQqHzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5346
X-OriginatorOrg: citrix.com

On 15/07/2021 08:58, Jan Beulich wrote:
> All,
>
> the releases are due in a couple of weeks time (and 4.14.3 is
> supposed to follow another few weeks later). Please point out backports
> you find missing from the respective staging branches, but which you
> consider relevant.

I've got a queue of:

* 429b0a5c62b9 - (HEAD -> staging-4.15) tools/libxenstat: fix populating
vbd.rd_sect <Richard Kojedzinszky>
* 41f0903e1632 - tools/python: fix Python3.4 TypeError in format string
<Olaf Hering>
* 67f798942caf - tools/python: handle libxl__physmap_info.name properly
in convert-legacy-stream (74 seconds ago) <Olaf Hering>
* e9709a83490f - tools: use integer division in
convert-legacy-stream<Olaf Hering>
* 1a6824957d05 - (upstream/staging-4.15, origin/staging-4.15) build:
clean "lib.a" <Anthony PERARD>

which I'd already ok'd with Ian as ok for backport.  I'll sort those out
on all applicable branches right now.

~Andrew

