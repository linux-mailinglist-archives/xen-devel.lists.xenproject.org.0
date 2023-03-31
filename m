Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630836D1D86
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 12:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516966.801912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piBYU-0001Fj-5l; Fri, 31 Mar 2023 10:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516966.801912; Fri, 31 Mar 2023 10:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piBYU-0001Cw-1g; Fri, 31 Mar 2023 10:00:22 +0000
Received: by outflank-mailman (input) for mailman id 516966;
 Fri, 31 Mar 2023 10:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTo5=7X=citrix.com=prvs=447f045ac=roger.pau@srs-se1.protection.inumbo.net>)
 id 1piBYS-00016S-6I
 for xen-devel@lists.xenproject.org; Fri, 31 Mar 2023 10:00:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d585af4c-cfaa-11ed-85db-49a42c6b2330;
 Fri, 31 Mar 2023 12:00:17 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2023 06:00:13 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS7PR03MB5557.namprd03.prod.outlook.com (2603:10b6:5:2d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Fri, 31 Mar
 2023 10:00:11 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Fri, 31 Mar 2023
 10:00:11 +0000
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
X-Inumbo-ID: d585af4c-cfaa-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680256817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=9mkcKgO6MSvhJxuRmV4lSgTE2Puli7Zu3o7kFqRJRFM=;
  b=arvx/i9OH84/udlX/Uha850v0+G/rJoABHNNR5kXttjyX89qQWKg+9BB
   FvBdPDC/H0eWy36+gA7ZS/pq+KMSaK4x3Xp5RbYn0N0YCNxOOqRfdxMJF
   JKMcpfn6Obel7DXso9bw6IOGZ6MpH+08AVTyAg+APZMLPi9vwGb2EXsRU
   w=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 103834773
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:C0GeXqqVjJr7+AopzZDkwKhf3u5eBmI+ZBIvgKrLsJaIsI4StFCzt
 garIBnSMv+DZWOheY1wPovk90wCv5WBmIU1QQs6/ng2RC9Ho5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzCBNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADQDVwq9tt2N+Y2YW+hFrcE4D/nVIYxK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKOEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdpJRObkqaEx6LGV7l5QWT80dVGnm6C8uBOkUopvK
 mYs3BN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBq16bO8vT60fy8PIgc/iTQsSAIE55zppt41hxeWFtJ7Svft1ZvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:UbRYyaBAvADCUuTlHel/55DYdb4zR+YMi2TDtnoBMCC9F/bzqy
 nAppQmPHPP+VEssRIb9+xoWpPwJE80nKQdieIs1NyZLW3bUQWTXedfBEjZrwEI2ReSygeQ78
 hdWpk7L9vsDVd7h87m4A++Cb8bsbq62ZHtouHCz3hsRwl2a6dm9UNTDBqdGEEzZA5IA/MCZf
 ihDwN8xgadRQ==
X-IronPort-AV: E=Sophos;i="5.98,307,1673931600"; 
   d="scan'208";a="103834773"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoCEJcampkBfI/QEd7vw+F+VBexzeRBeYbzAfGuP4Ax0wCpJ3SQT3XhwF3cbBKu8L1iR+B062VCGkmpXwGHYjD/AI1uDB/k9kczWF1+IumhpMFBvxbJGinaSUkyd6wS1Zou4kTFjNU8JN+n+x1P0lA1W4U/KnVv++h5WL4ghbLwk1Qg1Nx88Gm8Du1+sh27D4UqlBWuydHtUq5dHm6rPDkpS4eC/jmJHuu08TTe7B07VrUL/eZLAni4KKNxJhExg6GVmzrHmZnUdLz81ciCzf8XFKc/eZiScLIExcLs1h3uEYUyV7XBjRZivr/AMrQ0MP8HoTn8Z/ywZKFtIO4h3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o57kufVo1caTCe7BHceGTpC82HwXX2FBnVVlDnpxb3M=;
 b=HUGRFUR2eYkm290iRRr7bMrgEeoicDPS6OkngqaV54TK1vk/ajOiwubJhmPOsLOPqfCNXhYoKpUvfhqVQZoFeTnNsesSBT4hEzotpiP04ebl63IuLoqzlK9nBvlGtQjw41i5+twU91PMuoul3/WywEEyqHHIYI9+b635mkuA4kw11YdtO42KT9Jtv30wmby1nRV3ZORkodxeW/UzvkaWtJKvCTG4ws62p5EFCWV26HLrlyQFj9rHIBSIUJjHOBWvW/rnhqgY7X4VL/uQavBD7R8jHgI6DsF2/IHtRfszMWNyhWTOD8xxpLFBDvpjP+XK1eL200jdWLFiLYRDQakseg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o57kufVo1caTCe7BHceGTpC82HwXX2FBnVVlDnpxb3M=;
 b=MBFxG5T7zEWGiRuRrC2CALpmnC56iPsi4CpgvWF7ESSqv1GoqV96g0ICiTX4+2oUm5pxqoGYdZr1qiLJd9SY3xX4ggXo8c4FAfeHTKb4oyx9saEwlyDV5JpBidFBClbS7rpDE9KwXSRa01DsA+AkrNrZ6hEm+5X3hHFGliuW5WA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] multiboot2: parse console= and vga= options when setting GOP mode
Date: Fri, 31 Mar 2023 11:59:45 +0200
Message-Id: <20230331095946.45024-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331095946.45024-1-roger.pau@citrix.com>
References: <20230331095946.45024-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::19) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS7PR03MB5557:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d3d0c2-8ea0-40b9-c76d-08db31ceb757
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ADrwufvB9naEiH9NGcz1cEKcidt3/8HWfv0dRMPPAgZiYIN+xbiTnGfe1hzp0/WxV87lNLSa+nN77ZthkBwLAFlX8JSmpWmhjw71r6AN389o5QYXB1TNykcwmcOm47dfKhS2VYBiyl/AdBChlu7dHnwv4TttqVe6jkStRIV1R0tVUc9dVdX85QnAWR1baGauSGgDPOB0C5Fgn67zIFL+J4a7Y+tPfrVh2/S5u2c6xaa0/ysw14nTsxIqHB63qg6dmrZpOo+xJ5iPsKUSBY0DQ3UD1/iDaH6RVzx+qWQg4Ua+8UKFZYvn9PWzn+f5nGmJjw5LcmR5FV2cogf4EHJRin0xz4d/0zdV8jc1jIdJ8Qeg0E832PlWhkNkJgBF977ogmWn028yvOgG29vdgcw7HHHG45JvnQuE4kx/I4AR39Xr/U9RiRj7xxa5QiSjyTdi0wsiGig3UCXQVrByIJk7YdYerGNlEG5rspfH8TMSZFotmFeahS5su2EI26hkk5k6b3wB/c32OlhKFNxlPeHo8iNmsHqHCETmNevHUdREvRahpsjJhf5ksZNjySnaP5xAfE6yG1I0yK/Okwg53nhJqTiobYOscgInA2Fd0jleMTs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199021)(478600001)(41300700001)(82960400001)(66556008)(66946007)(66476007)(83380400001)(2906002)(36756003)(54906003)(8676002)(316002)(4326008)(6512007)(86362001)(8936002)(186003)(26005)(6506007)(1076003)(6666004)(38100700002)(5660300002)(6916009)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGZBVzVLWFZjenR3NnJSdjNsVDJPZ3VLZ0VTckh3cDVkRXUzUE5sU2tsSmJK?=
 =?utf-8?B?QmNFUlRWV2JMVmo1Rm9EblBHQTZCR2dsZHJiK1M3MXpjbUlNZUN0MDZ0c0JL?=
 =?utf-8?B?N25KOU9oQVN6N0FtRTR2eFhNTHZXdThwb3BaSTFYcmJSaHdTcDl2UWhuSnVY?=
 =?utf-8?B?V1lld0RCSXhZdkVCazJxRnJRai9nMkNLS3YyMWRteE84M0pobUY3TmdTUzVZ?=
 =?utf-8?B?Sk5FN2xYL1M1RWVub1ZPaHJlQzF2RFBaTW8vdVZyYWdUVm44clBHODNWM2tk?=
 =?utf-8?B?N0NqYXRKN2JVTkFTMkRtdlI0Y3JqN3JVdWFXYjdVTWxIQTJBb0hkay91cFVo?=
 =?utf-8?B?RVptQjk2ZnpaZzNVakFvYnkyc0Y3cGVZUE5CNjc3TlQ1bkhzdENNaFhWcHZm?=
 =?utf-8?B?UWFpaXhYTHdWVjNZcXNBUUxrUWowSXRmeHpjdnAzK2w5UkNVWERnQlFZcnV6?=
 =?utf-8?B?UmhpejB4Tk1lV3FSNlV6NzhHcjlHS0didHMyWVJGZmpnYnljQkM1YWdYbWF0?=
 =?utf-8?B?NDQ1MWJpQ2tjRVNPN1ROejJrYXZhMW9wd1Jld0dPUXEyL1dDVkRhUk5pNGp0?=
 =?utf-8?B?RDFhQ0xCaEpVbzdQVnRwRzV0VEwxeFd0T2RPTk5KL1Rsai9KanI4aUJURFll?=
 =?utf-8?B?RW1GTVo1Nnk0ZkJIYW84WStnbi93VTBoSnVCZEFRcjFKa0VXNGdkNlZCYm0v?=
 =?utf-8?B?bXBhRFBkNzBTSy9SUWhZK3VnOUE3RjBIaUQ1M0hEcUJKYUovMTdxN0k4RVpZ?=
 =?utf-8?B?VktrUlVVcXhnenBxSUxtOEpROUF4ajh5bFJ0VkkwRU1oY2RhV1NYOUlMRlB3?=
 =?utf-8?B?QnFwcUpqbzZML1ZJbmM1ZHhmK0pTR1ZvNUtEWmoreFp5NngxVnovZDJETkUy?=
 =?utf-8?B?QU4xa0hjaWdONFR2R1FCNHJrTjNIbnNReFdFYjlOMkFWKzhvVFdyK01ISzcy?=
 =?utf-8?B?UVhiQVk0QVd0bUVCT2ZLaTdOZUFaTUhKWFJiWXRHN2Q1TUtZL0FLTjRkMU83?=
 =?utf-8?B?bkRsVGtaNXFyR21vNE5UTTE2M0JldEhJL1BPbEg0MEpZRFM5SmRXVkY0UWti?=
 =?utf-8?B?a01OYmh5YXpHYzFBYWVLWkE2K0NkL3lxVXI0NW9FR08xNkx3dFhZdXBkYVZO?=
 =?utf-8?B?Vk9OVXowWnVFNHlXOEg0L0w2MHBLTTM4d2w1U0J0aUR3M3N1MHVXU1dOUkVG?=
 =?utf-8?B?RWFnK2FTWkFWWGxNQTNSYjczem1kTjkxemdmU0FmdDJmMGhMMmhFWEhVd2Uw?=
 =?utf-8?B?WDJya1N2T3VZYjQ0RXRhSDFvNmxnTDArb0s2bFIwcEx1Q1d6RUw1VFI2ckhG?=
 =?utf-8?B?SzVOdGxBNlhHcG9UOUJqaHdJVnVOd3ZrdGFMOXhIdzAzT3ZlaEpSWTVlYlVO?=
 =?utf-8?B?eWVmM2tyR0JwUUFvdzZKcXJORHNzVFBPbTgyT3JxNG5kbHV6eWZhTHZaZWk5?=
 =?utf-8?B?T3lUVDM0YTNYTFpjbGlyVnE0akhxRDQxMTRqcEFuRy9NZG1VSnZUcWRKcUpR?=
 =?utf-8?B?aXM0S2tGTkp0b2FGb0ZQd1dobXhPdXNEQ2RTdmFSbG9EZUd5STNvc3B4T3p5?=
 =?utf-8?B?UmhhcDE0eG94aDlva2F4N1NkS0phT0k2bDdmblVrS0dGZm1zTnNhV09ucnl0?=
 =?utf-8?B?dk4ySHRxR0dtRDdtbFJpRSsrNTBYWHI3OENXRSsycFROb1pzZXNqdmRKbDMx?=
 =?utf-8?B?eE12RG1kYzRuN0ZmQTlYUXhUbU5McjlKdTNoZ3NyZjFmWHJVTFRKUjgxbFdx?=
 =?utf-8?B?N3dpcDljdGdQandqNFdGSlRtaDN2Y0Rkb1B6bG84WmZ0TmE4S3dDQWovNldr?=
 =?utf-8?B?L3hlVjlyVDI2Q3BDRGp4a3YzdlJFK3FNS2d6R29qUXZqODhFcmc1VWxaQzZX?=
 =?utf-8?B?K2p1Sjc3SDU0NThQOXpLSnNmd0RlUWZjQXRDTVRwL2xWSThSd0d3SFRRSklv?=
 =?utf-8?B?NndnbjlXaWpFZjZHQ0RGR1MwN0R6NW1wV1BzZWRqWWRpNTRvQ1B4bDNPTlll?=
 =?utf-8?B?cTRSMnhKNWlFVkE1c0prakpRcHR2OVg2ZWVUQzZFWWQvaHp0WHowZGJnM3Jo?=
 =?utf-8?B?WHhQc0h4c1FwRkliemZERUxZVHJ6citYUEhlNk45bnY5bndBcWFRV1lvTXdG?=
 =?utf-8?Q?QsZCPCwSfzg4dviQeHtXsA2cv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Pshf/8AOXsgL1rV1TS7br85K/2P6yCMDwcL59t61oPIqb7HRvdaC2IGrOjQ1T2ZyyXrOHKakBDx1KBx6AkPrc/Ij8xqWEYop1JClWDkIm8wZRw+HH66hspl1ZGCTRELw01CMvdRpT8EeuoZ5LtSZ/OPkg5QOf8XCktk2ej7qjpKk/DiuFIvoPJSn46q3OUW6VorcVwEIXWnUWAoiWUfk/G6SBW3g3LSUMbKHg2AdmqkZNym5oNdlJzMAv8sSQ4nSLaKIIF3EVHPULMuBGga7hW8E0qeRafbKe7hfNySWPJGgo0Wj67D3lzP2Czo21ancFC58O1loz5QJm3No0YheAWTEm2d+gaB8G7UNTXXMAHy6T/OtABru2XGnrCifRKPQaUI3g9IZBqTvGr/nU7vU4lJQyBve6tt5Y7A1xiLtAuanKuWaQl/uyAq9QXMEmTEXkDmNw4okaC+PRQncUlAIgJz7SMJqLmKPInwzORQjICYbm5wshQIkOYDh5gcv59J4dbKm/DVaZbBK1L9aEYRXhVRnwjnb/BVHupPPFETjsZmyq0eTUhCHFVMKotP+8ktNQm1tY6L2j1EhjA83iUYMjkoxfh9Sh+YJJ4uh7OceCXLQcxVtnNwuFGu32OkJrlA2nJ9CYAoKlZ7qRbrg4D1U3mSRZDHgb0W8NXj0XoRW96+6zQn47t6m9BMx03xekEjtGMaMZekKVB++cOEQ+7ECwI8tkStz6WbJ8jHxt/avQmBClWL1oRD8N7GY7V5i1kHMGlhpzdnYsq0iW4hF6EjYC9AFnzJWQf4Farj0VM+m1h1Anwx9j28RLRCckCA95GiTXoHfNIOBUQ6F8+Nit+vWAQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d3d0c2-8ea0-40b9-c76d-08db31ceb757
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 10:00:11.3939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1w9i5U+swFQ3Hp3iPXECrU+YCN7i4yZMOlD1F1umKlaZv5iuGyCYZiqEmN7AOCCjaa9vgdN5AeRyMSbzxCwDVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5557

Only set the GOP mode if vga is selected in the console option,
otherwise just fetch the information from the current mode in order to
make it available to dom0.

Introduce support for passing the command line to the efi_multiboot2()
helper, and parse the console= and vga= options if present.

Add support for the 'gfx' and 'current' vga options, ignore the 'keep'
option, and print a warning message about other options not being
currently implemented.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Do not return the last occurrence of a command line.
 - Rearrange the code for assembly processing of the cmdline and use
   lea.
 - Merge patches handling console= and vga= together.
---
 xen/arch/x86/boot/head.S          | 13 ++++-
 xen/arch/x86/efi/efi-boot.h       | 80 ++++++++++++++++++++++++++++++-
 xen/arch/x86/x86_64/asm-offsets.c |  1 +
 3 files changed, 90 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 0fb7dd3029..9d13eee50b 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -221,9 +221,10 @@ __efi64_mb2_start:
         jmp     x86_32_switch
 
 .Lefi_multiboot2_proto:
-        /* Zero EFI SystemTable and EFI ImageHandle addresses. */
+        /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
         xor     %esi,%esi
         xor     %edi,%edi
+        xor     %edx,%edx
 
         /* Skip Multiboot2 information fixed part. */
         lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%rbx),%ecx
@@ -261,6 +262,13 @@ __efi64_mb2_start:
         cmove   MB2_efi64_ih(%rcx),%rdi
         je      .Lefi_mb2_next_tag
 
+        /* Get command line from Multiboot2 information. */
+        cmpl    $MULTIBOOT2_TAG_TYPE_CMDLINE,MB2_tag_type(%rcx)
+        jne     .Lno_cmdline
+        lea     MB2_tag_string(%rcx),%rdx
+        jmp     .Lefi_mb2_next_tag
+.Lno_cmdline:
+
         /* Is it the end of Multiboot2 information? */
         cmpl    $MULTIBOOT2_TAG_TYPE_END,MB2_tag_type(%rcx)
         je      .Lrun_bs
@@ -324,7 +332,8 @@ __efi64_mb2_start:
 
         /*
          * efi_multiboot2() is called according to System V AMD64 ABI:
-         *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable.
+         *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable,
+         *          %rdx - MB2 cmdline
          */
         call    efi_multiboot2
 
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index c94e53d139..f46c1f021e 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -786,7 +786,30 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
 
 static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
 
-void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
+/* Return the next occurrence of opt in cmd. */
+static const char __init *get_option(const char *cmd, const char *opt)
+{
+    const char *s = cmd, *o = NULL;
+
+    if ( !cmd || !opt )
+        return NULL;
+
+    while ( (s = strstr(s, opt)) != NULL )
+    {
+        if ( s == cmd || *(s - 1) == ' ' )
+        {
+            o = s + strlen(opt);
+            break;
+        }
+
+        s += strlen(opt);
+    }
+
+    return o;
+}
+
+void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable,
+                           const char *cmdline)
 {
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop;
     EFI_HANDLE gop_handle;
@@ -807,7 +830,60 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
 
     if ( gop )
     {
-        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
+        const char *opt = NULL, *last = cmdline;
+        /* Default console selection is "com1,vga". */
+        bool vga = true;
+
+        /* For the console option the last occurrence is the enforced one. */
+        while ( (last = get_option(last, "console=")) != NULL )
+            opt = last;
+
+        if ( opt )
+        {
+            const char *s = strstr(opt, "vga");
+
+            if ( !s || s > strpbrk(opt, " ") )
+                vga = false;
+        }
+
+        if ( vga )
+        {
+            unsigned int width = 0, height = 0, depth = 0;
+            bool keep_current = false;
+
+            last = cmdline;
+            while ( (last = get_option(last, "vga=")) != NULL )
+            {
+                if ( !strncmp(last, "gfx-", 4) )
+                {
+                    width = simple_strtoul(last + 4, &last, 10);
+                    if ( *last == 'x' )
+                        height = simple_strtoul(last + 1, &last, 10);
+                    if ( *last == 'x' )
+                        depth = simple_strtoul(last + 1, &last, 10);
+                    /* Allow depth to be 0 or unset. */
+                    if ( !width || !height )
+                        width = height = depth = 0;
+                    keep_current = false;
+                }
+                else if ( !strncmp(last, "current", 7) )
+                    keep_current = true;
+                else if ( !strncmp(last, "keep", 4) )
+                {
+                    /* Ignore. */
+                }
+                else
+                {
+                    /* Fallback to defaults if unimplemented. */
+                    width = height = depth = 0;
+                    keep_current = false;
+                    PrintStr(L"Warning: Cannot use selected vga option.\r\n");
+                }
+            }
+
+            if ( !keep_current )
+                gop_mode = efi_find_gop_mode(gop, width, height, depth);
+        }
 
         efi_arch_edid(gop_handle);
     }
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 287dac101a..fbd6c54188 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -175,6 +175,7 @@ void __dummy__(void)
     OFFSET(MB2_mem_lower, multiboot2_tag_basic_meminfo_t, mem_lower);
     OFFSET(MB2_efi64_st, multiboot2_tag_efi64_t, pointer);
     OFFSET(MB2_efi64_ih, multiboot2_tag_efi64_ih_t, pointer);
+    OFFSET(MB2_tag_string, multiboot2_tag_string_t, string);
     BLANK();
 
     OFFSET(DOMAIN_vm_assist, struct domain, vm_assist);
-- 
2.40.0


