Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711236E4A17
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 15:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522117.811294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poP3X-0007K4-JN; Mon, 17 Apr 2023 13:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522117.811294; Mon, 17 Apr 2023 13:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poP3X-0007HC-Ff; Mon, 17 Apr 2023 13:38:07 +0000
Received: by outflank-mailman (input) for mailman id 522117;
 Mon, 17 Apr 2023 13:38:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poP3V-0007Gy-St
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 13:38:06 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12fc7d69-dd25-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 15:38:03 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 09:37:58 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5039.namprd03.prod.outlook.com (2603:10b6:208:1a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 13:37:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 13:37:56 +0000
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
X-Inumbo-ID: 12fc7d69-dd25-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681738683;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rUTikKzqH8l7r3KkbCiKJLMqs6hE+lJQoZr8tHrl2Ag=;
  b=QDUF6YWSeHPRpNgN8xq5CWHXAM3Eh0DHxra4yxJHA44RXmnAqVX0pPdR
   xsqFnxqafidwsGEHCVxmC0yG81didaRsEpOu+gx9l+Grel7oPiSv25I7j
   lQR2mrlDanb1Dv1HPcbKyrYPq6DfXf+AazsdI03sFRnKjEG1PZaPqC4/S
   0=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 108249378
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:u/hwnqtm122+SECUDoGTW87aROfnVGdfMUV32f8akzHdYApBsoF/q
 tZmKW2COKyCMDb0e990a97koE5Tv8XQmtBkS1Nvryk8Fn4W+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOHyCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwKWpWQhajjeOM55WAbM831to4DcrlM9ZK0p1g5Wmx4fcOZ7nmGv2PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60aIu9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgpqQ20QbMlgT/DjUveWWe/d28qHeGQogGB
 E43xxsws4I9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAHSThbYdBgq84yRhQtz
 FaCm96vDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nczp4OKu8j9mwFTSux
 TmP9XA6n+9K1Z9N0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLtm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:S8oxD6hUqC7n0BMBq16uUgWUO3BQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: =?us-ascii?q?9a23=3ADF0kjWvQUFdz/3tcwkrkTmwn6IskKCbxylfaInW?=
 =?us-ascii?q?fLl1PbubFV0Sx+61rxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AbLjGvA+bDvT3GAi1GL4GJTKQf/5E3YHyLEUvqK0?=
 =?us-ascii?q?f4ZCrNw9NCimDpjviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="108249378"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIhh781JSFc8xH4hySb165ku+9EXzYBeKq6DweVq6RaIghNpTXM6FCbv9uSj+pBsc79C7+2h6KNrAJG1HUAAqcSCyR4LIiFsnDP+4MvQTQYY31JY1NKKoKBqME2RL79+FAnxTHzDOSEedH7DShbxTSc48FNopK6btPxU+xNssqRwjLQmM9pO5nUzviOU0xf0iSs3YZqQFj3qPQ1DLSGvuAnlQwbI5Uvljyame9hoTv4/keuntjbnG6noJrNQKZkxggm1ucrHYoDnwEuNXHmZInyPi1+Lmu1NuNxyd5mviLYE0i0j89vaPwV9NCZywcW81K6sy9WEF67feDw1VMrp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVo06p7g6W0ADpYJ6P+uNakowlj4o3PlG9B9LXLpdps=;
 b=A+wnwrnTAhFp3FtGql7x43212dL7bnxke5VBiJV/1sUNFOS20p01K7hZhWMIuNOC9VL4nf+h8BDOORq7siNnpiol+6DBIGgXmfuANjIyV5Uk5dDzWu47pU5q9d46Yr8CMXv3ghhGDVKMvbF/kNS82ULieKmhomN3oEeuiAQ4vI0ixNw4q6K8apgtqGRMUzeqib/IAAIHp3/tOJSJ6+rthrVEW+QX5U4Pcv8ThfvkzRwEbm/sqqXlGsdYANNGaq4XMXa2D3FFJa/DcB0GyL8qfILxNXbTpZ1J0SVChQI24mBrbrYCdngtEQEAySHD19vdRoJ+3IV/6IQVG+zyDERX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVo06p7g6W0ADpYJ6P+uNakowlj4o3PlG9B9LXLpdps=;
 b=vfJXl9TqZM0MkSfs9DJqd2zFdqhBjKnAARoas7dvF9SunwYlGHEShCGONw+3xKN03SbGgpdiMJaLk7ZDONz5MGMVMC7UeF2QZTb8auSZ2h43S8rH7Xn7dT4tfG6CeDlKlNzAJCdKUxQWG1V/el6IplNUvZC64PHsmDfJAnU1ctw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <881ec3af-19a8-a448-cb61-1667e146344b@citrix.com>
Date: Mon, 17 Apr 2023 14:37:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/3] xen/livepatch: Fix .altinstructions safety checks
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230417121357.3738919-1-andrew.cooper3@citrix.com>
 <20230417121357.3738919-4-andrew.cooper3@citrix.com>
 <3b1f3719-c8e5-8a98-8325-d907c160d81d@suse.com>
In-Reply-To: <3b1f3719-c8e5-8a98-8325-d907c160d81d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5039:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f9c5d2-467d-459c-623a-08db3f48f360
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ecCLihNrt/xAcdZanEqVrQ6GxsQZ4xg+f27zqeBdLaUQqABT6XJ8xqbA5MNPX0oRnbDJdNi9/vH8wyN3MxjPAO5XONOKRjxyvsjTzWJNjcrJ4/GZtemvScTIfgswqEJtC2wvHwKymihT5IgOdoZ5SzRELjpLqVqef4Ua6cLw6bgEYRbKW7nyNsyrtPtudNqWRKB3gjqhrEWK+5LAYGCKoGVXqx/i5r8FBteanVCwmfDgm9jfshDFFUIhMxlmYqM1hZFfYIrFqiW5V0Q1nG/2jXJvB3A5DO+zJDuydFkkK52MeyDuXOq5YVDg/yOYQfg5mdaGFotKsHQXwVAeI/teaCG/vhZ10Tnzfl1lPJ+GKcH4bxxZL/EdT7D9PmHRbCWWap6T5tUGuaUT4ME6Qb0z8oUkozLAcxjD199QVEGsJOwWoVpxKN57szKw+nUO282Vpa4fwiK7sX9pivhS9Z2UmPnI+MZ+m9mub+2nAzKPkfJEeiom+bC6S+6KwuXRD7umxingBquzGBrq8L6j7xUM8kKsWbjcq96O6EcWIsu2MT14R2HlBntHI7dQnfV//50uMwrZROoP8bvpHY4wBCVFdnGigxtJboWN+XYMgrXi6h31E7qWcy1cKCuHeHvCVe7dkr3k66UQbSrw42GZXJBEO29/cQ02lk98MBILoInk7xk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(31696002)(38100700002)(2906002)(82960400001)(478600001)(6486002)(6666004)(2616005)(26005)(53546011)(6506007)(6512007)(31686004)(186003)(86362001)(36756003)(41300700001)(316002)(5660300002)(8676002)(8936002)(54906003)(4326008)(6916009)(66556008)(66476007)(66946007)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1d5U0JaZ01ITjZlNVZPVS8xMVd6Z3BsTEdXY2pKRXZHTTh0OXozaGp1Uytu?=
 =?utf-8?B?RXprd3FXT2U4bHVXc09WcnBOdzduT2dZai9SYjJsdGZmNndVRExtTFF5T1FG?=
 =?utf-8?B?TUJOdUNTUjlEenN5aXBLc25KMktiWnI1MEMrMVFIR09lb0dkdFJnR1g4VDB5?=
 =?utf-8?B?QSs3RzNFeXFvVDZ6cGNjaktSS3BJTGNJKytuSFllZFF3VFVsZDdmOUMxMElo?=
 =?utf-8?B?RG1oL08wZXJUYlVHeTRidFNrY3VsQWpqNVZzU0kyeHlWL2JraC9TdUJPR3Yr?=
 =?utf-8?B?K2VvL1o2TkJDYXpKcEM0RmRPNnI0dzhKQzd0U3lUS1hsR25MQ3U1N1c3MjhE?=
 =?utf-8?B?T0dJdFJrVXExdEhYUU5CeE5oT3dZSHZRbFdIT3JndEtIVFhXVG5mNmpyM3ha?=
 =?utf-8?B?RjZzTk1PWHdZTGVDTnRQUWx3Ry8xUHJVcVhKUmh3VDRjVU1ramtpdHdYL213?=
 =?utf-8?B?ZEhtNWRQcmpJeFYwMWh2M0ZzVkI0cUp1MFUzWndOY0ZSTzNSMWtLOERCc0Iw?=
 =?utf-8?B?Z1RQd2xabzRPcGpudEY0WlBIVjM3Z2J2QXUzRnZxT1l2VUQvejhyVlVZVldR?=
 =?utf-8?B?T09uMkNBcVBqWHNJSkxoaTUvS1ZRdUZXbXlNaFEvdW9ld2tmYzh0ZGlHYU9q?=
 =?utf-8?B?d0JZRGhWVHFpUWxLdXdabDJ5dDVaTVVZeXluemMxUGMwelYrcG9qRTVRc1NP?=
 =?utf-8?B?OExobFh4cnBOdjUrUmJUYjZWazJFMi9lQ3RGUnh3eklHVUhNdTVOZVFPajdU?=
 =?utf-8?B?aHRCL0hST2tLMVJ3bWFwYitzOXl3QmhSYXM0Q1UwemhMZnpLYjFPZ3dkV2k1?=
 =?utf-8?B?TFZFWE9JT2RSalkwVjlRc1lhQ1BkU2xWeWplUndGU3VEYUxmV2laK210N1Fz?=
 =?utf-8?B?d3ZVamdTT2xtTGFNeEZ6TnlmUDRJcnRMb20vVUhucmdybmEzM2wvTG13OVVq?=
 =?utf-8?B?REpPajk3T3lpSTNKMWNPcWFGN0dCT0R6dlVOUWJtMyszbCt0V3RmQXVrbDcz?=
 =?utf-8?B?dEQzNjNoU0gwOHlaSjZraWxGY2FQSVZyV25JTTBSbWVmL0Q5SUIxUXU5blpi?=
 =?utf-8?B?enN6Tk45K2VuNUlaWUJ3cVo5YjQxdzFFNDJFVHIwNi80U3ZvQXpqanhEWGpo?=
 =?utf-8?B?U1lhYlNHcmxIMVdzYk9OUGFMRVRQTitYUTBSNEY5aHZ1N3BISzF6Ylk3Uit4?=
 =?utf-8?B?THh3QXMycHhRNUV2R0l3NkZCei9vTXJHZDQ4MHpMdVR0ZFdmYTFROHZBaHhp?=
 =?utf-8?B?YjhNTTdMQ2xlcTIyOHJlUlo2U1BydXU5d1hIQm5xQkFweEJ2c21kL29jcGll?=
 =?utf-8?B?dkpJeWt4UE9MYXdiaVVYRVlhbmhsZVlUTGFBUnZzOUJxRnNpd3hrblp2b2xn?=
 =?utf-8?B?N0RIUjhaYXFhbXRGWGxxUU5YT2N2eFdBL254ekRMMTU0cW41UHQvQWhwajZm?=
 =?utf-8?B?L1NhS2syRzRONlFvd3VIZzY5OU5peDZFSVBoVkxDWHJ1SlQxcGdrRHMxblNw?=
 =?utf-8?B?Q2xBaGp2Q0lSMWwySTVieU5RQzIxbGgybWR6WkFoNE5RMVFTL1RtWUN6ZWRW?=
 =?utf-8?B?a013bUlnSnF0Y0xrOG9HZzFXb0VrQ0ZsTUVDOWFXYlU3VmxjOUtRSGR5bjFN?=
 =?utf-8?B?NDRHMGxmSzUyWURjR2Zxb0NTcUlTWklTWnNKVW1nSkxwbWJiaG1rbEtFV3VL?=
 =?utf-8?B?ejJqOTl0bjEvN1lMRVplN1E4Tk5MRGFjd2hXNFVlSThzUUdVZXB6alRWRE5v?=
 =?utf-8?B?SGM0NjFXeDFPMHpVbXgrcUVhdk5kaW5wdWlvYlRJU2tUZWJwbnF0eDRFMFRl?=
 =?utf-8?B?RGZkalNXdG1LZ0FraS9PS2lnWlgwRStxWEVUZElMMXZiWWJZM3UxRFNJeUJh?=
 =?utf-8?B?bVhaUTV0R2hlQ0hLZVBoa25HNDB1WEhSUkRYakwxYjlFWE12dzdBcEt4T1VN?=
 =?utf-8?B?UXBmeUpQTExGdnFJWWRuckx6a3lYY3U1NGZYTDJaMmwrZTd4WTRYbnBwcHln?=
 =?utf-8?B?cGgxeGtpZnQ4SE9rR3FZZ3dUUzVRcVdaTS9kQTE0T2hjeFQwSCtMeEx1RXgy?=
 =?utf-8?B?cFd3RjdvcFFldjVzNDV0c3NQa1NkSVZzRUVNc1FKMW1NWUxxT2NzbW8yd2Mz?=
 =?utf-8?B?TzVTRWFQSERFYmV2RXhwZ0JXY1ROZkNyMUphKzlSaW5KS2M1ZURHK1ovN3FI?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AIrRYRChKDFkHZ93ECEGrHMKngvuwM9j5w0GJoCHmsN5JN9ftqcUsZYaA6g/0WP5p55bR7uViYq96JVRPcJX36ORgLp8NVErFlk6LGD1Ol8RCyIGRofTiGD4BF76fU9L6C4UGFvzwqvWXRyfKGAZd5SkVpkk0IUX6PSunQWbCBb2q9k0KKoWgRI7uQL64l8JDRCEhcgZLAxrIymV5DQK3uOMkZ1HSaOwgW5YGl6LuCSgYNSXzQpvn9y9jDT4Y+FO/LPKlf3ozm2sxM9qjGmurKWmxV4akPwKH2uvNqvvmw89Rqiuf8ZFrQ84f3uZ2FTHFNtq5sl3eo0N1hlTGPk57kri4At4nWY6m1x54ymof9GzpsF3IktS6v1k6U+dSDWVKxmJGTv9gyzbCitvZtqFW0PGAKJIg8+60Kqt6M2Cj4FOBs7dh9muOmiJQfv0ZPQEcK2oXX1PI5iErYPKNFJVsCmh8W109SCDpCuBJ7qD7q5UHmDhv1V/Hw0HIJvy5Gvfk+YKBmHQkbgJ+sdnlFH6/hG93XD6MEoCWES/Fnw0w9cd6pCf7/vnAz5EQ2zkj1FFJe4Ihgex3/sPzGi+dZxBhozIolbhAyYqYx9ZppHKjFMUYu9j6VdOzqdazngMZ0AjJFXEQz2+j0Sfraujlc0WNlUToyzLbePNlvfsAppTBEmb6TO8KVwcyBl7JExNz9GqS15I8BmnztOM/L5r/nkyPNlYLb52iv/IVoCcCFhYjo+Q2Dz4EOPgV5vCDBcDi9wXP79HcA8/y9M25kFScstlC4BJoYUJSxdVhEWTGpFhLZ9W338Ru+83QSe3+gK6fmzDuWJMH1ofo842V4vuF72oYA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f9c5d2-467d-459c-623a-08db3f48f360
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 13:37:55.9039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KecdJdEsXbqkvuguIHlxVf6f+1v1JkHhtQxsua3hJnL2UgW6m3MKEffD7PMbFibS7wSdo1+sgO2vtNVAnBQBN1WZUM+2tBuybFqlIkOY4RE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5039

On 17/04/2023 1:35 pm, Jan Beulich wrote:
> On 17.04.2023 14:13, Andrew Cooper wrote:
>> --- a/xen/common/livepatch.c
>> +++ b/xen/common/livepatch.c
>> @@ -803,28 +803,84 @@ static int prepare_payload(struct payload *payload,
>>      if ( sec )
>>      {
>>  #ifdef CONFIG_HAS_ALTERNATIVE
>> +        /*
>> +         * (As of April 2023), Alternatives are formed of:
>> +         * - An .altinstructions section with an array of struct alt_instr's.
>> +         * - An .altinstr_replacement section containing instructions.
>> +         *
>> +         * An individual alt_instr contains:
>> +         * - An orig reference, pointing into .text with a nonzero length
>> +         * - A repl reference, pointing into .altinstr_replacement
>> +         *
>> +         * It is legal to have zero-length replacements, meaning it is legal
>> +         * for the .altinstr_replacement section to be empty too.  An
>> +         * implementation detail means that a zero-length replacement's repl
>> +         * reference will still be in the .altinstr_replacement section.
> Didn't you agree that "will" is not really true, and it's at best "may", but
> then also doesn't really matter here in the first place (suggesting that the
> sentence might best be dropped, to avoid drawing attention to something that
> might at best confuse the reader as to its relevance)?

Only that "will be at 0" wasn't actually true.

Right now, the repl reference *will* be somewhere in
altinstr_replacement.  It is discussed here because it is what the check
enforces.

As an implementation detail, it is of course free to change in the
future if needs be.

~Andrew

