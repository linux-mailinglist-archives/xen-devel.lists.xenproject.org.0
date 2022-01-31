Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FC74A41ED
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:10:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262969.455465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUZp-0006Kg-Sd; Mon, 31 Jan 2022 11:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262969.455465; Mon, 31 Jan 2022 11:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUZp-0006Ij-Oa; Mon, 31 Jan 2022 11:10:29 +0000
Received: by outflank-mailman (input) for mailman id 262969;
 Mon, 31 Jan 2022 11:10:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytUN=SP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEUZo-0006Id-DG
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:10:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6396a67c-8286-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 12:10:26 +0100 (CET)
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
X-Inumbo-ID: 6396a67c-8286-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643627426;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=53/mHGAoV92EXAJIjS4AkpvvTTU5lI9wu3D8/TyvtWQ=;
  b=TdKUx1YIkgNimHWk5WnKDmz0mfvnCzzKpM+WaUINMntoUs8iHTFs0LyR
   W5r2AlzC8i/W0RJ4bW3kOHT9MWJBAlRjjQwd51JJPnXipkw+O0bR4/IWI
   P7B8jZ9KPnjMPDWZuSbO9LEmXHZBjYO+Us2Si90C6QcTQo03kE/LTMnhR
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SMSI+oOj7XycrkFql/OWFntfskiuLqN4QjuL6hDwQlWYq/Pfj59iGNvORctquOAe13QOeSpHPn
 aCoXAnu3/XXQBSQmYcd2IwWBEyNqp+Tp04XNsIy3qsUP6NwCuHr6XYDn2pLwUvdEhfNseHj4BK
 RaxqaPtJA2Zf4PF866YZuG1JBpw5rRC0RsbPbbLtXL5QYfdFGuuRyJETvHnLWYCN8arWTII5KB
 YXmTl2ovXirRlhmFiSyRTDuO6pxaFSNsGMZGC3/MapflENuSEhG4rV4yRgi46fVaacGV+cwJCD
 XTXWPkxz90ZD1eR9s5cuGeC0
X-SBRS: 5.2
X-MesageID: 63115692
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:K0LLsaIdoglk/cbzFE+R5ZMlxSXFcZb7ZxGr2PjKsXjdYENSgWcOm
 GBOUWqBOa2Ca2Wkft1xPt+zoU4GvpLUmNNmHgZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us4wrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Su/p79
 O5I9qCrUCkgLKPMutwFUx5xRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UvoYBgWlh3KiiG97xP
 +oBUSJQKyjZXBFjJXY2ErhnoL230yyXnzpw9wvO+PtfD3Lo5A573aXpMdHVUseXXsgTlUGdz
 krv5Xj0ByY/JdOWyDeb2n+0j+qJliT+MKoKHaC83u5nhhuU3GN7IAcfVUa/5+K4jEG+c9tFL
 gof/S9GhaI/7lCxR9/xGRixumeZvwU0UsBVVeY97Wml9K3Q5AqIA3keeRRIYtcmqcweSCQj0
 xmCmNaBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kbqRbCTc1qFqKvufTzFSvt2
 DCBrCU4hLI7gNYC0uOw+lWvqzCxopnESCYl6wORWXiqhiteYIOmfIWu5ULs0edbLI2ZQ1+Cu
 1AJg8GbqusJCPmljzeRSe8AGLWo4fetMzDGh1NrWZ47+FyQF2WLJN4KpmskfQEwb5hCKWSBj
 FLvVR15v7t5NkeRaOxLeJufAtYkzYrYDdTif6WBBjZRWaRZeAiC9SBoQEef2WHxjUQh+Z0C1
 YenndWEVihDV/k+pNaib6JEiOJwmHhirY/Gbc2jl3yaPayiiGl5oFvvGH+HdagH4ayNu205G
 P4PZpLRm32zvAATCxQ7ELL/z3hXdxDX5ris8qS7k9JvxCI8QgnN7NeKmdscl3RNxfg9qwsx1
 ijVtrVk4FT+n2bbDg6Bd2pubrjiNb4m8y5gYHxzZQb2iiRyCWpK0Ev5X8FtFVXA3Lc7pcOYs
 tFfI5nQahixYmmvF8shgWnV89U5KUXDafOmNCu5ejkvF6OMtCSSkuIIijDHrXFUZgLu7JNWi
 +T5imvzHMRfLyw/Upe+QK//njuZ4ClG8MovDhSgHzWmUBi2mGScA3av3qZfzgBlAUir+wZ2I
 C7PX09A+7GR8tBkmDQL7Ijdx7qU/yJFNhMyN0HQ7KqsNDmc+WymwIRaV/2PcyybX2TxkJhOr
 80Mpx0lGPFYzltMraRmFLNnkfA369f1/ucIxQV4BnTbKV+sD+o4cHWB2MBOsIxLx6NY5lTqC
 h7epIECNOXbIt7hHX4QOBEhMraJ28YLl2SA9v8yOkj7unN6peLVTUVIMhCQoyVBN78pYpg9y
 OIstZdOuQyygxYnKPiciSVQ+zjeJ3AMSfx/5JobHJXqmkwgzVQbOc7QDSr/4ZeubdRQMxZ1f
 m/I1fSa37kFnxjMaXs+E3TJzNFxv5VWtUAY1kIGKnSIhsHB2q090ipO/GllVQ9S1BhGjb5+Y
 zA5K01vKKyS1D50n8wfDXu0EgRMCRDFqEz8z1wFyD/QQ0WyDzGfKWQ8PaCG/VwD8nIadT9ep
 enKxGHgWDfsXcfwwiptBhI19629FYR8pl/YhcSqP8WZBJ1rMzPqj5inaXcMtxa6U9g6g1fKp
 LUy8et9AUEh2fX8f0Hv51Gm6Ikt
IronPort-HdrOrdr: A9a23:ZJxYWqo2jysqsbSxeseO318aV5uxL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NCZLXXbUQqTXftfBO7ZogEIdBeOk9K1uZ
 0QF5SWTeeAcmSS7vyKkDVQcexQuOVvmZrA7Yy1ogYPPGNXguNbnnxE426gYzxLrWJ9dOME/f
 Snl616T23KQwVoUi33PAhOY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX202oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iAnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDQ4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAqqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocZTbqjVQGbgoBT+q3vYpxqdS32B3Tq+/blnAS+pUoJj3fxn6ck7zM9HJFUcegz2w
 2LCNUuqFh0dL5lUUtKPpZ3fSKGMB2/ffvyChPmHb3GLtBOB5ufke+93F0KjNvaDKDgiqFC3q
 j8bA==
X-IronPort-AV: E=Sophos;i="5.88,330,1635220800"; 
   d="scan'208";a="63115692"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDbI9fI2KLkvFt8MlZpQPbOjm2TWSSasrGskFkJOLSi7Mo67GUsHzjGrfoVOt2aYbWTOa8iRqRUisjyW/TuscOFkg0izBr6FV6RYL3iXLXkeK6N/oGz6zkVz11ziniTwB2ZAEm/ekwug/E3jYloDXVIV1qKG1PYhG/izY38wCRmZufdnk7MIM9muBvT94QzX4DCieTvY55u0eySC9Gs28dhICO7hrhJLYXTNfzml0Egkd5zNXQ9vOYf5UKDLQMZLWzq1uP2ln91lqank3qwpOX4bme8SI3Rnw8vivYVJJO38RbFPjtB13MsoltDyBzpBUdxAFpxNuzMqvlWU84Wglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwEIqYJXTpCzYSGu/OnGTxScL933UEbnrqIaEm41bJg=;
 b=NWBS3JvEFAcOz1vJl5OlXqqXFnN1ewhXosEK1BUV4DDjxT8roARYJqjTaZOHcFe/L1stkRax1uL/CH/Lo2qXvfexAl0yOH22w7SJG59Wd7XT4YABzuvkWQrccyaTMXBY88a+Sq93SbJCYK571JCbQwvsjhoR5jDijDN5xrNDD9prTGoMxylkisohN+cUkPKVj8loDpEyQ00rzz73zqFGNcX1V623kPUQicCtuqY1ZohfthYf1hC44j2BWEpbrDpr4O2BUSnqEZgQAyJdOdZaqkm5c9LXfk3oXO3ybPq9wk2WXvEuDFLnCQVVsyc+P1kQmAlui4JVH/eBxHPNfDmM1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwEIqYJXTpCzYSGu/OnGTxScL933UEbnrqIaEm41bJg=;
 b=Nj0nXMoKzdXkVANepzp6+aFIjuv0WnXFLbsvxo3hq2eiFmNpXPuZP8S5fj0cKYylxb4bnflEKe+619/uJhP6Ly4aLq23ABadFTUuDbfUQm/V2b4ajSius4kLkEOOaZ/gSLJ01hFFgMA1EP3Nvtw4U86ZrhDIlrH0lh8p8GzMY/o=
Date: Mon, 31 Jan 2022 12:10:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Message-ID: <YffDmW4JGk+iDIVF@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
 <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
X-ClientProxiedBy: LO4P123CA0089.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4370acec-b25f-42a5-ef79-08d9e4aa452c
X-MS-TrafficTypeDiagnostic: BN7PR03MB3427:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB3427CB6D96F8ED66407421158F259@BN7PR03MB3427.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9OaRBAb4am0HFeoU/oaVVxb3e3GSlQh2yDEMr8EqwKiTz8qczSoV+bW0+oldM7s0KTgRL16p/+x5uc2mb/Wf2AiLu6+NlN843xlQgH1pxB/xYSWYCf6abrc4VkjAIHR7uGsVq6QcL7Ypn8D2tv95U4wGOY8SiAOqSTchvJmfwy2jBBLoX6r2duX75dqCHXV+3QbSa20eOR7dCAHRSVz84+N+C0d3oJUM0mBcoOeFjlmfe1HTwAQUA2zYQNTyqsz3gXS0z07KHsfXsdKKRP4Ge7eeEAsx0xabr83VO6Lbi07FSZCQMbn+qshFZhiMTK6d0iUPVRmcTM747T8AfOQvCp1cdZ4jfjIjIdWb8llzlamaUvitYJu6ttnUq/ahIMSP4QxTDmiNIImkG6EQHslxvcK9jn8JRU2+6yPGCHpasBUTd8zgjjVJBEoohW0nOs+R7kxxAxC9bUvBfgI8hgPGD90253mKmYNcr4aBDo931DJoQaZjvlFdPYfA4toeRJUJxRQ1wdwijwa5EElH9ZIFLllUBFiHqeH0E6jio/bb4uMY36fGQMpTSapoDX04/FLp75zE2uqr08xrnjUSdqoMJoVx7OGpuw8ARJDYq4bC5dxk4h8J2n2f7Y/tO5F60UN1t60CkkE4SeBNpZI5//3OZtOlud/npB+BejWMJzqOUr8D1IwkA1Z+eB7mquUZsILqDK3vaKHVLIDmBM/kjQUuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(38100700002)(8936002)(86362001)(33716001)(82960400001)(8676002)(66556008)(66476007)(66946007)(6666004)(9686003)(6512007)(4326008)(53546011)(5660300002)(6506007)(508600001)(6486002)(54906003)(6916009)(316002)(83380400001)(7416002)(2906002)(186003)(26005)(85182001)(67856001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MThONkRvU2FPZmdVWWJOM2RmNkNTMEpDMFlrWDJPWWFFYzdtc00rajRDdGIv?=
 =?utf-8?B?RCtLVVcxVFk5dGNEdi9RL25EWnJ6UENjcnU4eG1WaDBWTnN5UE4zUFFRQ3Zi?=
 =?utf-8?B?YjVvaEtPY1VTRUNMWk5ybGsvdjNCdEdXcTE5S0RtUWpKTm9QZzR4NlRPa2NV?=
 =?utf-8?B?MmpHcGhKVVJOc0owY2J3aXFieE0rdU9HbEhYSkx2NE13QTYrVmUrZ1llTkw4?=
 =?utf-8?B?NEU2Yk9jTjMzQnAzbVJQMGpYb1hCcEl4K0kwNmhRdjlhNWVpdVJqYnJ6a3hN?=
 =?utf-8?B?MVkwZm13OFRHdE5kMG9kN3lYVkRyYmhVTVhiWitaSlk4NS83RkVUNHRzb2Uy?=
 =?utf-8?B?SEkxVzV3RXdKVVZxcHlLTHZWeVJCNnEzZm5Hb1NreVNXODFhd1U0RGVIYnc3?=
 =?utf-8?B?Rmp1bXFMV2orQzhYOHlrcEdRbGt4U0RvdTFpclFBelhFdGcwQ3NTSTY3NlNn?=
 =?utf-8?B?dTRlNVBJUVRKbnhCalAvNEd5SnBwSFh1MDczenc5TzFta1NQY2YyemxuQTJ3?=
 =?utf-8?B?UjVUYURYR0loRlZreTVoNExvaEpTaTdoTTFmNGp6R0FpYzUvUlhKV0wweG5i?=
 =?utf-8?B?bkc5ZGdWTmxyTzR5cFNMV0lVWVpQZlk3aUh5MGd6bjRnOXQ4THFNSFZic1ZZ?=
 =?utf-8?B?eUNWcHdyanVBZGViOVNoalpZZk9ZeU5SWFJpS2NwVmZtVnhSR2NiSm8vY0Vl?=
 =?utf-8?B?WGZ6WnEzbUxMSFFQWTQ5bk9sWDQ1eUgxZUtlTjYyOG41aDNUb1F3MHBEMnZJ?=
 =?utf-8?B?cVFWREZkUEZjUGZNbkVzWGdUYzFWRGpHeTJ5SWRtSmNWU3VlZUpXbU5kQ1A0?=
 =?utf-8?B?NjRCUGtUNVN6WDFDN0JodXZpelpaZnMwNndkZHk1QlVjMkZsdXB4cXpyc2R0?=
 =?utf-8?B?alB0dDB0TU5SNUl2MHJ5NGNPV1c2dVFlZmxBeVh3RXl6elRhNVN3Q2dSc2V6?=
 =?utf-8?B?cHUwcXJZdmNwMS81QUNETUZCN1JRUGlOeGpYUGUxOS8vOFdTOE1acTE1R25p?=
 =?utf-8?B?c05WeXB4cjhaZVJCbVJxTG42L2dXVWZZNTFGUGV4TW81NHFQdEIzNWFVbWpo?=
 =?utf-8?B?ZEEwRTNZNEdUL3pYK2NER01KaXhYdlBjRFF1UVBzZldnNHFQZHZPdE5JMUc5?=
 =?utf-8?B?Z25wb0NoK0Zab0dXWjJMZHlaby9aRmZTUS9EdXhOQXVzYzNsTFR1M2xOVits?=
 =?utf-8?B?eTNXWlJBdzFXMkt5UHdGWVdNZ2RTNVlMMHRYakJXRnlQUEdReWJYMDd0RDl5?=
 =?utf-8?B?dytOU2VWQTYySkxGaGhzTjRDOGZteHRyTnAxcWhXMCtzYkdFWGZ5Vmt2cEt2?=
 =?utf-8?B?N0dSWTNyQVNyZW90UnZJa29ubUpOSE9Nemo3dHUzbFFPZW51WWVVcXZSTkJC?=
 =?utf-8?B?R0pCRGh6Z0JlTFVoTGwxQ2RCOG52Ly9pdUFXMDdJcWM2Q0NhbXZiYmM0YmNJ?=
 =?utf-8?B?b3VBRFBtbElZNVYxd2lxL281VmRCbEpQdGp6NTJjS1VxWDZTSmZJZmhqSngr?=
 =?utf-8?B?TkxUZzJnaHJnaWszME9lT0dSUnlWdEMxWHRBNDJUVDdWMkZmNFR0eThsd1ZH?=
 =?utf-8?B?bExhUEcwb1VycDAwZHkzOXFBNHdhYlgwc2ljdzlkWVVHQjlNSVh6dm9ZVjVZ?=
 =?utf-8?B?Q1FRSWh1RGJsUDE4YnVRdGNQV0VpdXJDV2RrY2ExUzBCSWVCU2NBR2tScmNs?=
 =?utf-8?B?R2FRakNCajltNGoydkJ6Zno3aUs5Y0EyRGw3NjZ3QlVlTGdjcWVDblc4T2hE?=
 =?utf-8?B?N25GaE8xTDlaNXhpcXFNamkrbnM2VEhzbXR4cWR6K0NiWUdsRERRYVZjZDU2?=
 =?utf-8?B?TDhXRmdrTVBodmdJMFZ0QURnd2tOMmFlMVlQYUFuNlNLL3h6TjNxTUNRMTdu?=
 =?utf-8?B?TjZlbFRyTmY1TWtwd2FYT0pwQm5LZkplS1k3djVpQ285aURTRGxiMXphN0JD?=
 =?utf-8?B?YlFJTEx1b2FIdVpkdzcvVllZdVNVRGVVcXFHZnhRb0UzYWM1UmUycHdZaTJK?=
 =?utf-8?B?T1E1OHNValB5Yi9kMGZka0ZEOXlsMzMvbzhVZjkyNFVPMmhNYkRJNDUwcHB0?=
 =?utf-8?B?cyt0V3BBK3ZkOXN1RXRUK04rMk5vSWIxc3JVajZiRkhkYldXelNqYlVZR2hW?=
 =?utf-8?B?d2JCTC9rNTFpSkNIcWxORU4yQ2FtRnA0ZWhsNVozdWpDTVpNZEU5aUlWaVV0?=
 =?utf-8?Q?FyhL9WJtFeTgJt4yNVeWhZo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4370acec-b25f-42a5-ef79-08d9e4aa452c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 11:10:20.7736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qk5SL6DI1J/EBpgQulSNooZiK8B0tIJIv+ueVg5rpVZC6q2HTf9WjEIQivnU8tY2QkjQThAv9e5MvLm+q6w3wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3427
X-OriginatorOrg: citrix.com

On Mon, Jan 31, 2022 at 10:40:47AM +0000, Oleksandr Andrushchenko wrote:
> On 31.01.22 11:47, Oleksandr Andrushchenko wrote:
> > Hi, Roger!
> >
> > On 12.01.22 14:35, Roger Pau Monné wrote:
> >>
> >>> +static void guest_rom_write(const struct pci_dev *pdev, unsigned int reg,
> >>> +                            uint32_t val, void *data)
> >>> +{
> >>> +}
> >>> +
> >>> +static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned int reg,
> >>> +                               void *data)
> >>> +{
> >>> +    return 0xffffffff;
> >>> +}
> >> There should be no need for those handlers. As said elsewhere: for
> >> guests registers not explicitly handled should return ~0 for reads and
> >> drop writes, which is what you are proposing here.
> > Yes, you are right: I can see in vpci_read that we end up reading ~0 if no
> > handler exists (which is what I do here with guest_rom_read). But I am not that
> > sure about the dropped writes:
> >
> > void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> >                   uint32_t data)
> > {
> >       unsigned int data_offset = 0;
> >
> > [snip]
> >
> >       if ( data_offset < size )
> >           /* Tailing gap, write the remaining. */
> >           vpci_write_hw(sbdf, reg + data_offset, size - data_offset,
> >                         data >> (data_offset * 8));
> >
> > so it looks like for the un-handled writes we still reach the HW register.
> > Could you please tell if the code above needs improvement (like checking
> > if the write was handled) or I still need to provide a write handler, e.g.
> > guest_rom_write here?
> Hm, but the same applies to the reads as well... And this is no surprise,
> as for the guests I can see that it accesses all the configuration space
> registers that I don't handle. Without that I would have guests unable
> to properly setup a PCI device being passed through... And this is why
> I have a big TODO in this series describing unhandled registers.
> So, it seems that I do need to provide those handlers which I need to
> drop writes and return ~0 on reads.

Right (see my previous reply to this comment). I think it would be
easier (and cleaner) if you switched the default behavior regarding
unhandled register access for domUs at the start of the series (drop
writes, reads returns ~0), and then you won't need to add all those
dummy handler to drop writes and return ~0 for reads.

It's going to be more work initially as you would need to support
passthrough of more registers, but it's the right approach that we
need implementation wise.

Thanks, Roger.

