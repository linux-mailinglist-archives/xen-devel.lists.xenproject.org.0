Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0559B73072E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549208.857621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uyk-00072X-KZ; Wed, 14 Jun 2023 18:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549208.857621; Wed, 14 Jun 2023 18:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uyk-0006zk-Hd; Wed, 14 Jun 2023 18:12:22 +0000
Received: by outflank-mailman (input) for mailman id 549208;
 Wed, 14 Jun 2023 18:12:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiGM=CC=citrix.com=prvs=52225e267=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q9Uyj-0006ze-IX
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:12:21 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffc54890-0ade-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 20:12:19 +0200 (CEST)
Received: from mail-dm6nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jun 2023 14:12:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5020.namprd03.prod.outlook.com (2603:10b6:5:1e8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 18:12:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6477.037; Wed, 14 Jun 2023
 18:12:14 +0000
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
X-Inumbo-ID: ffc54890-0ade-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686766339;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fKKNfStN8rZ0/YG19xlj/3SmaOuMzI8FBOOKilA0tfo=;
  b=cH+LtzL7j7I/772syAF2pUgXeotFsWyNHn1ai8b2sJiYVyb7fsZY0s66
   kKC61JHc2YHJ7+cj9vIHGm6EpC5HPGuCnjkB68+gWjRYFY5gLr4yRZRNa
   2/OhHvY677hbI5C65oKVR/39JulDyfiA28pNF5qCfrpe3o66i1+kzrBIC
   E=;
X-IronPort-RemoteIP: 104.47.73.47
X-IronPort-MID: 113225193
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ohgPdqv5aRPDCOSGfcedmHdZz+fnVHRfMUV32f8akzHdYApBsoF/q
 tZmKTyPaanfMGL8eo11bti29xkEu5XTm9RkHgM/+SBhEiIa+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGHyyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwGD8UUTCTrs+Nzo2rEeVttPsJCJTvM9ZK0p1g5Wmx4fcOZ7nmG/mPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0oui/6xb7I5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTjrKQ32QzIroAVIBEHbwCnqufhsWWZXfR4J
 hMkqio2/bdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAt5tDipMQ/i0zJR9M7TKqt1IWpRnf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:o7//c6NsMSXIpMBcTt6jsMiBIKoaSvp037BL7TESdfUxSKalfq
 +V98jzuSWZtN9zYgBCpTnjAsi9qBrnnPZICO8qUotKNzOJhILHFuxfBPPZowHdJw==
X-Talos-CUID: =?us-ascii?q?9a23=3APx9ivWqxZqGbYUVmZp/dl13mUfAqa0L93F79GEG?=
 =?us-ascii?q?HGT1lSY+qY3vN/Kwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AV2YzTA5jrK9kSOeyZMapE00Yxoxk8p71FEsTya4?=
 =?us-ascii?q?tnM+iEiEvC2edlGSoF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,243,1681185600"; 
   d="scan'208";a="113225193"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iat15Ijn3PZP0I4/hN98J2IG+xI/oTNQEkF0jqrDfGlqKQskCN97YDy65OPccWRJ44BhMF5rZXVGtJavmUK6XOUEUvA5TnH+ENS2OG6wpg9pTvZ/aydokGdu+WOfoKDnFAPah0fswQCO+FJtAPyezkevhwndkht6b22BDCQRqs/XTtmSvHntYL/BeRBX/nOpaheDQ16j4Y3RZ+2xgvKEOKdcqpbaIGY1CvJcFt0kxv1uEIjeZDuy8btyKNGX/B+0kvFXDJ7lgyDXT0z/dJUrKxBuxJPuFG+kLKIdEWEtv1iarJ9lOs2kimNw3ZE+ut7HhfRxseRS9nkyUy4noAKudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8lBetZ2vR+N1A6WS3cRCmk8npyX1ISr5Xyjh7/4okY=;
 b=RQp303oRKnk2thTjFgERp3pzKCSgg06RNL4SCMup+AkwMHbo6iaJoDeB1Lku6LhXQgjFAGxc9MW0+3YePeUT1OkO0fBgshV+3GyXXEehMwk7BQMXgh4w/to0PJQ/0vwQ3R25uGF6nck8bWCSqG9l7RcwvHZnuNOyFLFmF01PlflwNUSi5LqSVAjSlCxwUo2QoKzR/jUmzxprvm83FTyoZmzn8bfvumlqay+8rtv621FNWWpPc3ao9ft+UfVGbQ84lrH/Yt8BFgdH2O2TwJdSMtA+4joj3PzVuQ/JITmlEZEpQL8q6Gs195enXa0jLHm9Lvd/Pd3Tcfg5DyB8O3EasA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8lBetZ2vR+N1A6WS3cRCmk8npyX1ISr5Xyjh7/4okY=;
 b=UC8guKWPVzH9jLOMi3LdYva0XIySlO9IcgcFtzsegaDIuSpcBF+cctXs2wtOk7Cg2LMWNwHilYh/EG76FAxDA5huyK4VFKV8fmljfVk2Za8IQz6SmHpqg4MMPdG9vRgjqMA4qJbwdCnr95zyLYgyNN+WhykubxCBxLS9FdVz5kI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <386058fe-e9a8-d0e1-c3a0-3f15a4585bd5@citrix.com>
Date: Wed, 14 Jun 2023 19:12:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 4/4] x86/cpu-policy: Derive RSBA/RRSBA for guest
 policies
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
 <20230612161306.2739572-5-andrew.cooper3@citrix.com>
 <82ee7908-4597-433c-0aca-8c0ad22fff13@suse.com>
In-Reply-To: <82ee7908-4597-433c-0aca-8c0ad22fff13@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0663.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5020:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbb9ddf-6bc3-4ca6-b144-08db6d02e18e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W7okn8+OgRAOLcaz32R0K+bS5PflS7AxGEoQUKc4EKcKIY/LgtIfJ9q1PnsBI/lKuX9J5wav9HnQtOcIqMdqx2zPjheuKisaPiU7XKBkeFWYfPntIwQi8fsAXegSuy7KBCk2EQ4SxVizARF1nQdRGD6/gHg+HD+/+h6ppnSCGcpx5W2yU+XTmrB7Rv7ATLKKSAzpnKUdNjmOZ53uQBA8tJKlQ5SwJcpfDKUkh6vrSDFnQpl+kXJHFx1L+7ffwA/vhwwb49GHEuX1sLTj5Pf8zogh7eh+apMBwUtsIzlNQUeMbaGkwJH99y/vJkl0WY4SJ3Ew+50Wh2lefYoju1w9dfG7ePdH+J13d7tSRXC0cNuLIUDt0RytKmqZUAulVo6VdSLmzHXGCwYGVFZYRVmQZQsO0QjvwvQxhcdysQnImHftl+b9ZLwBoiMh4CpJwxzBHloTjvJzkisSAiz6poYxqCEZ/N1CL2h6643/vF0NZSv4d/rpbPHJ75NqUY+vXiFXNJmN9HxBNq23GSqNS9xYz8/bEPLYLJZLqK5HBisrcRnEAgKKbeAi82bTEh88Er++uWwTCpKur5E5ImG/V99WmeOWvqIpvjoIL/lktPVsd0mhwjDDdwLSyNKdVfiMTC/HrXPVRrukTINgUkZlVaozOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199021)(86362001)(31696002)(6486002)(8676002)(41300700001)(316002)(83380400001)(26005)(82960400001)(5660300002)(6512007)(38100700002)(53546011)(6666004)(6506007)(8936002)(66476007)(66556008)(36756003)(54906003)(4326008)(66946007)(478600001)(186003)(6916009)(31686004)(2906002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXVjSXJjNTFtTVA5LzJ0Qm0vZ3UwZHJjZ2J0anFDT29Xc1ZWQ0NObEdvNm5m?=
 =?utf-8?B?UGtaRkhtS2ZXYThzNGh3M0NGdGdQek01cjRZOXNObGo5T05xbk1FNXlGaDZm?=
 =?utf-8?B?cXBDbGxHN0Y1b3FUWVdhdlV1WlVrMmhDR0EyT0Q3aEd2SGlOSnBaREJBeUE0?=
 =?utf-8?B?OCtucURIeVhSb3ZJK1gxbUxSSFlBNURtMVk2aUdNOFg3dGZZSEQwUm5pd2Z2?=
 =?utf-8?B?aVZaa1UrMEtLNks3R0t0WUNDMHFZU2tITEROVDFqcGhKV2tyR3czdVlvblRT?=
 =?utf-8?B?RnM4YmlHWEQrd1pkZld2MnpEWVVKYldCWTRHc2hxclpmZ3hZRVZTQTJnWEVt?=
 =?utf-8?B?OGRhYXREd2cxYWgvMTdkM0hPTkZkMTBLRHBmUktQRFhYN3JIUWd4d3loYWZV?=
 =?utf-8?B?UnYxZmdZeDBRTzVNcWZFS29iRG80Zm04azdIV2dyWEdNaUxZRzYzd2NLdVBz?=
 =?utf-8?B?R3VGd3ZmeVNtOEFMaUREWjZldG5Cd1BUWm4zd0RNUjFDYlQ5dVR6U0l5V0pC?=
 =?utf-8?B?Z3RXeERLakFnWFk0UmFrT28zZGpyRFNYeDFvSE8zTDhQb0xGSnRoQ01uRS9o?=
 =?utf-8?B?M0dNK0ZBS1lwTXNoNlViVytBZDB6N0hHRStNRDFGdFNGQ0ZFL1hneXFoSlox?=
 =?utf-8?B?OUhMMkhqYkJic013V3J1a0xoMFA4NVRhTkoxNTNhZ3M5N2g4Wjcva2Nyb0RT?=
 =?utf-8?B?L3lXaWxSeGVsdFI2Y0haSUpsQk1KMlBqVElyUmtyUzlZN3RXbEVhdUlLd0Rk?=
 =?utf-8?B?SzRpRlFUSW1yVDVRMkhCZFBqMkMwbjg2M3UxTXBKeHZyd1grc1E0RWc0VFFW?=
 =?utf-8?B?Vytaa0x6RHY5Ny9QY2hzMHhGdWQxRG50TzU3dGNvaWR6a004a1pnMkdYQnov?=
 =?utf-8?B?UUQ4OFRxc3o5TllSQUZlTjZodXdmZW9SaThlUUw0Q0ZYUWVPMXRGOEFGYUpL?=
 =?utf-8?B?NVJSaGgvUWp3ZE92bEU1SmsxeXp1ZVQzZGNJeFJjc2hPYy8xVStvMDN5YXBG?=
 =?utf-8?B?VDFJMElIWkNaMzZBM1NySXdvalE5S3RQZTlHUVQ0dU9uNmU5VkE3UlY1WFB5?=
 =?utf-8?B?TXZMZWgvejREZC9VK2NMeE9KaDgyVEw1T08vRDBBZ3BGUWozRFFtN0JBTzEx?=
 =?utf-8?B?SWRrcWlLUjdVRmFGcXJ4a0VXbTdTRjkxZDIwSnRQYk1ucFdNWlRwS0pBdEcr?=
 =?utf-8?B?TWV3clFCMU9MZzVFbUVreW1QckRYZGtGQVBRT2hmc2ZBdS9IdHJwUW9uOHln?=
 =?utf-8?B?S01sdDh0Yk9KMkVyS3N4VnIxK0lDOTB6MkVqSHcvWDBmQVFWUGl2Y0ZUY09S?=
 =?utf-8?B?WTBCcjdGREF5cnhGbTFRNHBVQmFxSUo2dVVQVXc0RzlkcFFROGlmQ1lrNUFr?=
 =?utf-8?B?Y0FXMm9JdDh3K29VVzJHSnZMWTE0bzNzMSs2bWZHYm5TWTRGT3M3dVFjU2hK?=
 =?utf-8?B?eWtackd6ejdxV0hwbGhKRTFPeUZwOUxlWGZDdjZiRFlrNDhoMzVNU3RUa0Ux?=
 =?utf-8?B?QmRkWlFnMnFGYVBXL1NoRmgrazhzQUtScEZHaDlQTlpKLzc1TEhwRmQ3MXFy?=
 =?utf-8?B?VTVjNVl1alZnL0tvaGVvaWZsYkc4WW45TStlM2xCY3pRcUZxY0ovYVI5eFhp?=
 =?utf-8?B?VkQvYklTdm1vQzVmY3VsR0ZGdGZKOVcwM1UzSzhxVzdzUW4wMElFRGE1K2dx?=
 =?utf-8?B?VUFDYVBJbk1WWFpaM3k0eENOaTNKUUMzOGVQb2plbFBBNVY1YlBRVWEyZUc0?=
 =?utf-8?B?RTd5VlpFRkt3YUJadFFGeUtWVFcxbWluSlY4M3FhTVM2TnVYRzdPajlOR3ZH?=
 =?utf-8?B?aHFQbXBxU2ZZQ3UrRlk0TzJzTXFIejRYdnpuME9IME4yRXNRRDJjbWNqMkpi?=
 =?utf-8?B?UUdpWWVsKzVZYzR3ckdZTU52RGxCdTJUS3c3Z3E5T08wMUpvK2xNK3BnR3Fi?=
 =?utf-8?B?cVA5YkhKd3crVGpoMDZtSEZ4Ri80OHlIRUFhZndadjlOR1QxT1E1ZXRiQVFH?=
 =?utf-8?B?VjUrcit2TjlvR3ZQUWkvZ2pPR01RWTZEckRaNTFYMlpPRm9YN3MwL3ZnTXZm?=
 =?utf-8?B?amNmQkNOTE1KbHlINmdwRjd3Y2prZktrK28xdVFhQzh1WTNET0dWM0lOS2hR?=
 =?utf-8?B?U2Y2UnhBRDdjd3oyVTZmQ1N2SHkrZ1VHWjVOakNVRmFWb0ZSa3dwZFVYN1Jv?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nAZ6JPWKOmKBzTWdf5yu+ejTz1tSEqgeZrU9csIlv8HIkzkVaR55iq1F5DmlP82gHLmMa9jI99OmK4/HbfAYCDN4bb3ce8EeqdGCmDt4oU4E+Oz+ZybGh2a7qNewm8P//NEfojyIoorWiIaYPTIg7l1++b7Whh0Pj3ubA66LfKA3lAon9hsZUGtoxOJ95jci+F/2aHidogYxq9N/1+9uzY1+WswVnGjvOzIF0Wrqi5iriUfH1ZGwXPKgsbs+EEZi7fYjH+9tikka860Dji67lEs6LX7fYUt1OhBtbESfNpBAu2NH3UI/QkQO3OpV6YOCYe0ku8EdRNFAaxzJIQJBi2TnLP0+TSyldFgUCr96FU+yxVaxfzVtCVFSvmm74IO7ZU5fO0Em7bl/92TJnUzc5qiYFEe4CoUoCMdPj6KfqoR1FSpwyiShZdpwcfKwRXr8aY1LBjpZyVJ0j1WRDpLKDTORRbHKt92DYKbYA39owXvmo7mGrr4dcTDrvfncPytyqAu7H53FTA210MdEMs2l9oi+4vfjKT0ZQO/wlyb1uhMH1w8kBxK4hnlL9egSmHTQXriURvKn3sKmYHNFYFAPKkmVNErWTOnHkZ68fUIlZU+b1xPHxWnoNgC2A6fRCbNQdMBvyjdud1yf88/TOixrjnGyYWkv/ATXlgapKxeZdv9h9+vOaPe40LbsboitQAYPxLQ8wRYC7/dcX2orz0GaAxDudsqiYcCyg86uxXHGfLLBTguH47BwP0C+mNi48l9jjRQGH9AlSfW/gnY+qXI5IXVFyeHlgNNjndlq0/aCGaIH6TdfHP61xta0SoJq6fIi
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbb9ddf-6bc3-4ca6-b144-08db6d02e18e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 18:12:14.7537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qO31ap5uqrVjYGvwG3+aotO+IAhar5OMWe5EFFr/7Bz1eyDe5eClEnGMYJgYB77ggNvnxvkfzMDSLdqiF0d4PeS08t4W1c4IgXTB/gozmIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5020

On 13/06/2023 10:59 am, Jan Beulich wrote:
> On 12.06.2023 18:13, Andrew Cooper wrote:
>> The RSBA bit, "RSB Alternative", means that the RSB may use alternative
>> predictors when empty.  From a practical point of view, this mean "Retpoline
>> not safe".
>>
>> Enhanced IBRS (officially IBRS_ALL in Intel's docs, previously IBRS_ATT) is a
>> statement that IBRS is implemented in hardware (as opposed to the form
>> retrofitted to existing CPUs in microcode).
>>
>> The RRSBA bit, "Restricted-RSBA", is a combination of RSBA, and the eIBRS
>> property that predictions are tagged with the mode in which they were learnt.
>> Therefore, it means "when eIBRS is active, the RSB may fall back to
>> alternative predictors but restricted to the current prediction mode".  As
>> such, it's stronger statement than RSBA, but still means "Retpoline not safe".
>>
>> CPUs are not expected to enumerate both RSBA and RRSBA.
>>
>> Add feature dependencies for EIBRS and RRSBA.  While technically they're not
>> linked, absolutely nothing good can come of letting the guest see RRSBA
>> without EIBRS.  Nor a guest seeing EIBRS without IBRSB.  Furthermore, we use
>> this dependency to simplify the max derivation logic.
>>
>> The max policies gets RSBA and RRSBA unconditionally set (with the EIBRS
>> dependency maybe hiding RRSBA).  We can run any VM, even if it has been told
>> "somewhere you might run, Retpoline isn't safe".
>>
>> The default policies are more complicated.  A guest shouldn't see both bits,
>> but it needs to see one if the current host suffers from any form of RSBA, and
>> which bit it needs to see depends on whether eIBRS is visible or not.
>> Therefore, the calculation must be performed after sanitise_featureset().
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> v3:
>>  * Minor commit message adjustment.
>>  * Drop changes to recalculate_cpuid_policy().  Deferred to a later series.
> With this dropped, with the title not saying "max/default", and with
> the description also not mentioning "live" policies at all, I don't
> think this patch is self-consistent (meaning in particular: leaving
> aside the fact that there's no way right now to requests e.g. both
> RSBA and RRSBA for a guest; aiui it is possible for Dom0).
>
> As you may imagine I'm also curious why you decided to drop this.

Because when I tried doing levelling in Xapi, I remembered why I did it
the way I did in v1, and why the v2 way was wrong.

Xen cannot safely edit what the toolstack provides, so must not. 
Instead, failing the set_policy() call is an option, and is what we want
to do longterm, but also happens to be wrong too in this case. An admin
may know that a VM isn't using retpoline, and may need to migrate it
anyway for a number of reasons, so any safety checks need to be in the
toolstack, and need to be overrideable with something like --force.


I don't really associate "derive policies" with anything other than the
system policies.  Domain construction isn't any kind of derivation -
it's simply doing what the toolstack asks.

~Andrew

