Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594086388D0
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 12:32:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448163.705069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyWwA-0007cO-VW; Fri, 25 Nov 2022 11:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448163.705069; Fri, 25 Nov 2022 11:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyWwA-0007ZK-Ro; Fri, 25 Nov 2022 11:32:06 +0000
Received: by outflank-mailman (input) for mailman id 448163;
 Fri, 25 Nov 2022 11:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pdMr=3Z=citrix.com=prvs=32106567d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oyWw9-0007Yv-AE
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 11:32:05 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80ea5c54-6cb4-11ed-8fd2-01056ac49cbb;
 Fri, 25 Nov 2022 12:30:04 +0100 (CET)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Nov 2022 06:30:01 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5760.namprd03.prod.outlook.com (2603:10b6:a03:2d3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 25 Nov
 2022 11:30:00 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Fri, 25 Nov 2022
 11:30:00 +0000
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
X-Inumbo-ID: 80ea5c54-6cb4-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669375804;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HjkCHBARGKytnEpsHY++QWGcGiGlNvtvKsy8tYsXbxE=;
  b=CHjueQqLCmBUgxw5P2biRL6TWX5c/jg1rm9GAgBDBiPeL1Y3+RxWPdpM
   N4obBrq9oGqX7Imsxnr5oAT4AI4XqIOpX3P28+86+oecoS0XOVKdLVRJF
   +uWcJNQ9IroP/+sqyRR/VSI7j2wngNXSnszkr4yVTMhOYzr3d95Zpb/qa
   0=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 85968259
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ccm5iaLoApQTFxzJFE+R4JQlxSXFcZb7ZxGr2PjKsXjdYENShjRVy
 2NMXzyDPP6JNGWgfIh2PIrgp0oDsMKHnN82HFBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wZjPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5ZOXtiy
 fgEBQsTc06GnbiR2uKgFOpz05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMkmSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iLx17Gfx36qMG4UPIbjp6VvoAXC/3QCNDgfT3j4nOOcg0HrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O+oh8x2A0baR6gqcB24sXjNHcMYhtsI9WXotz
 FDht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHeTJobixvOSpNvFfCzh9isQzXom
 WnV8m45mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 hDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:WejjhKFqDS1pk3h6pLqE7seALOsnbusQ8zAXPidKOHhom62j5q
 WTdZsgpHzJYUkqME3I9ervBED4exnhHMdOjLX5Xo3MYOC8ggCVxehZhLcKpQeBJ8SUzJ8+6U
 4PSclDIey1N2FZreuS2mWFL+o=
X-IronPort-AV: E=Sophos;i="5.96,193,1665460800"; 
   d="scan'208";a="85968259"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWxuwX9fjuOFKbZV4xJ26UL1kg/lSRufN1J/9i9KQlkYpt0LuMSnWbFjSTAU6wOvemkLGyZBxoqwWKp3TTu+KIU8VjH2r1yeLLuW9LRMK49C6mGEshkUrNrLBtC0XdHHNNrQL827CH+QQdt/vAfDKHXR7Q0m09ByMpTOozWJGUUmazusxcw94QP0ky6RDvim4kqetgTwV0j/gc0s3j9+8XzUT3u08al0H9cGCuYjhrMSFfRtY5iWHuo3aIxSnKL+3MlzjDCHHpjIlb1wfuDT8Zfrj62RxtdU5SxyGF/1ofmevdYJjCezNJsOAtIcY7BFBSmEXOPpu2lIIxKBV5saag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4EP1m6RqVfWDbdKKEMHXb2QJMYUuwVx9jUvhsHH95o=;
 b=X4RcUI/PIxZ2jsqusxbQ7WJB+i0QQ2H3Ulf7FepFqu4VfFVXACzxL0HDiJBBPCDt5Nie5wk2cZcWfpQp6l5JbAKaOjxKQZjzukPYvNxgYLv6wRzv1tsdqpXWZNDUxoV1ohZD2BN+ST+UjpPxAPr0TvmoR80ijMTa7upNGoSwOsR5vS+oWE+0pJLXcEUy00FXjV2a3vK/0mHPhJ89rMTYjyWmLyu8n0uXiPt+N9POrsToJ8qLYPHHF0bR82YMzm7/Vo8HoDgTC5vFQWIPBi2XdMzk33Zo97zPMXx+yQc/3efoZhBkAi2mfP3e373Nfbv1oVmeeyPrBUHb0cKbvSuiTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4EP1m6RqVfWDbdKKEMHXb2QJMYUuwVx9jUvhsHH95o=;
 b=Wgq/26G7N+BtkxBTSox4fT27w4FhrfqYTze5pkvThSLeg2asoi4wg307wZxOo+UG0BZhgYzAhRhWHWBZlhzgcYqdmdpzymHPKNubSKgipSz+YT+VPGn/EIXovMYoofZ1KlzJl9g0j0SxNtDX0rF6ko6Y/uUX6jRgpqVsKUllRpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 25 Nov 2022 12:29:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable test] 174958: regressions - trouble:
 broken/fail/pass
Message-ID: <Y4CnMzLz2dTGyYdo@Air-de-Roger>
References: <osstest-174958-mainreport@xen.org>
 <ea77d0a2-b701-11e8-afb0-2c8b7ed4a033@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ea77d0a2-b701-11e8-afb0-2c8b7ed4a033@suse.com>
X-ClientProxiedBy: LO4P123CA0072.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: c85ee860-df52-4707-cc53-08daced86347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GQiFNwP8jUoVBSO1SDCbkvDh/GkLL09g2ReBVb2TEbDO7clS9LV7fvGOULYoJGBU3v2w8GA2Wi/UJmYHjpV0t67P5WGmSAuMeO83JKcWYQDXsbejc9R+pJLNlD4oHWtjy2H86HPeV5ctyPrguxZMUl0MHze5aii0iEMA9/6gLJX6sE8eM7N6r3UG/a3MV44OfFpND7nnjos/us7AjpHuo/K0G4dbbms9yDeIyjgvvfYr9OQDFo6wf/el2qPeK/2qxUtWO8Fl+cZxyTsQuwxNMU2uL52L/kOob3CRuudlGFQs4DLWQTaJFgf5+y8EltnfsPbXYYUr4qU7aYQnc/XJyl9qd8MgWIiDuWFAs7Hq8gJRFCvXbxjNXra9KeZwR0wXT4xjERxQAXPRmQTOFH/t5MGPjyXaQbYtS3mpdiub2oHVlnQgXcmBgNnxiP4H8jhH96BviMfqu5WURlLtW9T4S7wh92UwkmzyMaclcA4aK71TQFBFjSbCqszB/qfaFD+3yBv1oB35A9LAoPXeUstWFyhPBGMbj7HMWPeGnLOWaNBWMzARAZ9nqxNF2oXVqInxPsmCTtXnU5VKd0H8fo0+6G8BVeu6K4E3SpL9r8v6Rqnjzc1tG1U4Sl/UBm7LRc65ZP7qMDInxpPTXyfj+tOfTh0Y6yvtPPQnZgTz+2O4o8ICYzCuTvtENqNgQeR4HMc8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199015)(316002)(82960400001)(8936002)(4744005)(5660300002)(2906002)(38100700002)(41300700001)(86362001)(66556008)(8676002)(4326008)(478600001)(66476007)(6916009)(66946007)(186003)(33716001)(83380400001)(966005)(6486002)(85182001)(53546011)(26005)(6666004)(6512007)(6506007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGNHeERESnpZd3R3K01nb2pFMU5HTDhRamRyMGtGUWZKSW4rL2pEdGtpcDQz?=
 =?utf-8?B?b0Y4eHF2eUJhTjUrZDNyMTZDU3RyQjVDWTNOcjBFQ2g1aVBXNDBabERQdXZp?=
 =?utf-8?B?N1U4YVc5ZGlYeVpTV0lRUUNDVlpVVFZ3cUZtem5PaVJTZzRsdU9mNXUvd3gv?=
 =?utf-8?B?Z0lZRWVyMHNYeGdnUVVaZUoxTlNmSERKWWcvZllhN1BySkl5bHhLbVpPMGNy?=
 =?utf-8?B?YzYrTkZOVG50UEdjSGV6L0ZjaVpOUXN2L2hqNzgrdUYwQytseWw2ZSs5elcz?=
 =?utf-8?B?eHJtU1Q1MmN5WFAxMnhDYW5UM25KbitGa042bjNIZWtDYUJjaEJaQis0QmZ1?=
 =?utf-8?B?WTlXbTVVR1JYc2drWnJjOUNHd081ZE02R2lIZnZ3cjhjeC9MSmJ5ZHl4ZVRm?=
 =?utf-8?B?ZGpHZHZDS3NaMGdZcXA0Sy9RSWxiL2FPcHkxU2w5ZnZMZmN3MDhaY2ozdXg5?=
 =?utf-8?B?b2NrUUxpQ2ZhaDM0ZUIrWGpNYkFqWkwyUWlBZGhrTWxOaDU1Q01HY2NVZVl1?=
 =?utf-8?B?RmZCLzM2TFRyUjg4NGRab1FrbmwxRU4ySFkxbW9wMVFOZnIvWnJjUkc3WDM5?=
 =?utf-8?B?c0YraW1uY0ZLaHBydTNORzE2a0dlVTRaZ1g0LzY3Sm5zUHJmRXIrRWFOMXJ5?=
 =?utf-8?B?d2t2blJERml0SkwxL0ZDQlNEV2VTclNGM1dEU29FNC9MK3J0NWZMWlUvb3pX?=
 =?utf-8?B?YThYd0lyK2hrOE9MOWwxODR3TFFHUDM5TEkrRkJMQ1ptc2dKc21yU0xjc0tp?=
 =?utf-8?B?MVlhS2xISUd3YWI0TEV6TFRvZWl4aFIyWm1VVWdzaVVhVFBkT3padjZEZ3BJ?=
 =?utf-8?B?cHo0QlgvWTh1TE5DSWhBTmFKa2RKZkRIWVdYdlp0UWZ2VzJyKytPeUNZTjg1?=
 =?utf-8?B?ZzZ0aUVBSEdmaTNhSmxkSUpPd0VVRWJ0TVpMRVBCNEJrZFRVd2lTbnNMYjkz?=
 =?utf-8?B?M29qZkJVWENSaUtZUUh0RGpoSTZ0ZXdmc282Q24xZGIxaWdQWElLYldETzU2?=
 =?utf-8?B?Mlk2YTBuTyt3cFdwQ3h1RE5RNTRpd2NlbCtBdzc3VlhHV3dDWnRNaDZYZ2NP?=
 =?utf-8?B?KzdhalJzekQwSVJTNnl6R1NGTk9BTVNuSEorR0JNRDZHT3JhQy9VNHFwSzRq?=
 =?utf-8?B?UVRlUUlxcW81djRDTjNmTE9PWTQ1MFpMcGZhRGtoQ0w5aXcxdW1MbUc2Y2lG?=
 =?utf-8?B?QWgycXgwQnRiWUtEMGRjK3RuZkhmelRIUHZWOFdadDlxN3o0djhXUVQ5OEJw?=
 =?utf-8?B?ejBZR29FM3AyM3lla3JDVGF3czhISmpJb25SUEtKV1RONk85b0xxeHphR2hj?=
 =?utf-8?B?c0VmQkxHWHh1YmlaOEk1SEUrNkozeW4yQVd2SDFWTXpSb2czbVRYR2oxdGx3?=
 =?utf-8?B?aFp5cXdXWHNJODJxTlp4VWtteXdRNzA5bU5vdnBISTloTE4rRS9qeHR5bE1V?=
 =?utf-8?B?QkRWVExLc2Vham50K0dFL2taUW9kZUZacEpic2IyT2tMUkVUZnlLbXJvUzFW?=
 =?utf-8?B?QytnNXpOeGU4TzZ3OGthcWhEZWN4UXJ0ajV4SjlHYTMxU0FGZExKQVFKbEd4?=
 =?utf-8?B?RFJ0MFBkSnJOSmwxMFdoTHEyUW55aDVMdE9vME5Dd0k1MlJlaTEzcVE1Rzd5?=
 =?utf-8?B?TmNDckxlQzZvRWRDd09TTE5Sc056Vk12b2JzR1ZCU1lzSytld1AzblRKZVlu?=
 =?utf-8?B?Qlo3SG01dDNuZGZmS2hKVitXK0NCcldRQzBLK1RVbVhQWEkrd3pERXRKbTNH?=
 =?utf-8?B?YWZYK0QvYmxHNy84eXRMZDVPUSsrUHZ5bi9hSSt5Rk45RTNxaVB4a1locU9Y?=
 =?utf-8?B?ZCs2OElGQ0tNNy9FcXJUdWgyZzFVUm9DSzVlZDdaZjlnUFA3aEk5bjJHeFEz?=
 =?utf-8?B?cW9mU0J0NGZqVWoxenQxMU8xaUQ4b1phTzNPTmxUYUVVdEsyWDlQeWE4bW41?=
 =?utf-8?B?djlia1B0VUhmZmlRSDN2YThXQ1dPb2E4M3dGZ2twbm9vVDhpU3pyRjhoVHRq?=
 =?utf-8?B?YkJzeGhWS3cvSEtSSWJoNFdqd2o4a3poRWtHQjBvTGJsajFZZi9vWUNHVkQz?=
 =?utf-8?B?VVNMdk9PRWpvdmdjWDFSdXZKMDB2dVFNN1RxcDBvV3UwL2NEMTVZcmhPOExX?=
 =?utf-8?Q?3J4WzrF/ePbKfzkGHrkSHAw/N?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6tdp+EHR1NEQbksEtJC0JmG/svHT30xXg/BgHK4l4OzdH9FZqFZmEYudyQWGhI4rh508ewgt0QtmRps7pyAwn8Inar+hnjI01BvbGrtCF/bq+ZQGtc6a6SBRwpRaUWJPPM7T0d1OZ3ZhKhfBZvmnHscA8ZMugXckncEAqvqoqHtX84phK9PDkh3vs13NG9Yjeu4mA3vWzmCVvDjJdHVD88ZbS/cOIJQ583mAk/NI3lS/3TnfLh0Szs/EcLQ82mUggZe67Ed2O6P70XTMng8mLMCXdSYheWscRaOk3KGRa7t+pcukvgNQNv3hvWcx+0p7X3cFGM5OZXCYrmfpbxOyPqa2HoarUMfdwo7A761bNz8EzPWPuKM+yQQ0KWDtSderV2brXz8KmcMcLRsPq3xn7JWyTGml9l1Vy9jV8/OXLLYr0KfzoOweoKu3L37Ex+f/dId7fDknptZQRGaivbY0kiJ9cTPiwM1HAKGSzDnFk/cmWCQzPhv9uIeQx3ENhQScz/33LBxe8JQwHmGpHvJ8unPlDp+eFeT3Y5JLq6E/c7LlIgLeNtvhXPRi8qJjvkXDjoYJxjoC5G8w+kFxqgwrm98jAU9TeNSnokMaLQnenj+PeAua412MjoEIp+dYekwmVsM2fkQWWoWw9R3cJthVc+lrTf37dx2IDsH/E92Q84QdufWcKjf4RxtKLcB/jP3yUUspnIehmTIWfK++feMTE8wRHwMFaJW2FMGoiWGoCEBgLPzaSjzW6tjjWcGVlsR6IDQJBOSpFVVTyLMIgNT4yjb0nlGOJ3JE3t+jgCjRCMY2Usi0Ca2efW/YM+8/M1f6/7zagxDCPHbe5a/cXsHQM5cxYuzrGPA6cBQi5y3dmCA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c85ee860-df52-4707-cc53-08daced86347
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 11:30:00.1972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AryeIinvksTvN1rVN7gHb16wWt4WxhgPXHTXAo7eUK0L90WijLKmhOg+eVHcgaN+wIClUK9xI7yVnkpRM22IZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5760

On Fri, Nov 25, 2022 at 10:21:38AM +0100, Jan Beulich wrote:
> On 25.11.2022 09:10, osstest service owner wrote:
> > flight 174958 xen-unstable real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/174958/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  test-amd64-amd64-migrupgrade    <job status>                 broken
> >  build-arm64-pvops             6 kernel-build   fail in 174950 REGR. vs. 174958
> 
> Just out of curiosity: How can an older flight be a regression vs a
> newer one?

I think Ian made regressions sticky (up to a degree) in order for us to
not ignore heisenbugs.  In this case this was compiler segfault while
running on native, so nothing related to Xen AFAICT.

Roger.

