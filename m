Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4596160CF75
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 16:45:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429881.681222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLAz-00059w-9W; Tue, 25 Oct 2022 14:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429881.681222; Tue, 25 Oct 2022 14:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLAz-00055M-2f; Tue, 25 Oct 2022 14:45:09 +0000
Received: by outflank-mailman (input) for mailman id 429881;
 Tue, 25 Oct 2022 14:45:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bJBo=22=citrix.com=prvs=2902c4af2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onLAx-0004yW-8q
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 14:45:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c669ac6-5473-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 16:45:05 +0200 (CEST)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2022 10:45:03 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5808.namprd03.prod.outlook.com (2603:10b6:a03:2dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 14:45:01 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 14:45:01 +0000
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
X-Inumbo-ID: 9c669ac6-5473-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666709105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=XRI3mzs1B0cmEFtJwKBPVRLdZTaKuGUCgVHbs3Soa7U=;
  b=EM0xehqGjqvbqGd3haR3mn1TOOPUQWNC1aZr6UkT0/Al1qAtw5jsjhCy
   3rgZZp58EyFnhMLIekOtZSt9bHBsV4l21SSkQhJ4x/YX6sifPyUozVfX1
   Alp7LF/enlWPuiIdMJ89GOcld+9grf7ypTA6WPPhvoVJlEkp8KQYM/DQw
   w=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 82566550
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3M4ubaDMYicRkBVW/z/iw5YqxClBgxIJ4kV8jS/XYbTApGl00mdRy
 GAbWzyHb/+DMWfycoona4yzphwPuJ7UnIVmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25K6v4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2ltA7wEpcVXJ1pJ9
 OUZA2gzdB/A3ryPlefTpulE3qzPLeHNFaZG4jRM6G+cCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAI7gvN+sLb4ECKpOB1+KLqP9fPPMSDWO1en1qCp
 3KA9GP8av0fHIzFlGTbry/07gPJtQ2mYKsdG4+Hysdnw2ON5H4oJh8PS1Tu9JFVjWb7AbqzM
 Xc86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooL07gCDFy47RzhOQNU8sYk9QjlC6
 7OSt9bgBDgqvLjLT3uYr++QtWnrYXdTKnIebygZSwdD+8PkvIw4khPISJBkDbKxidr2Xzr3x
 lhmsRQDulnatuZTv43TwLwNq2jESkThJuLt2jjqYw==
IronPort-HdrOrdr: A9a23:MqZOMa29Kg6sIWeKguO/OAqjBSlyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjjfZq6z+8O3WBxB8bYYOCCggeVxe5ZnO/fKlHbexEWs9QtrJ
 uIEJIOd+EYc2IK6voSiTPQe7hA/DDEytHRuQ639QYQcegAUdAE0+4WMHf5LqUgLzM2eKbRWa
 DskPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolis2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REoGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUMTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+6Z/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUR4S0LpXXt
 WGMfuspcq/KTihHjDkVyhUsZaRt00Ib1i7qhNogL3X79BU9EoJvXfwivZv3Evoz6hNO6Ws19
 60TJiAq4s+P/P+FZgNYtvpYfHHflAlEii8R166EBDAKJwtHU7rhtre3IgVjdvaC6DgiqFC06
 j8bA==
X-IronPort-AV: E=Sophos;i="5.95,212,1661832000"; 
   d="scan'208";a="82566550"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELLtw+na07llVQnb4nJkroVA71UKIZDDO+cBTjhbp0MtsRSMFo/FGhm+tDFtRw4S26a/Ge8gATBhGzTNICaCi5hLpTkavGrAnlTyKNuc9uCzEEOogTJWHTGcf1dyy9/Qy5bKyQ3oqUmmk36jhKBYs9OAtYvR+KHZSRXoA/yjdapfN6+oeGxMyBHP1jO92Df1LAxdvsgiKvjERiGg2TOlhEso4/zOI5rgOhoEhHN+VBxfck3Nm15di5EybkOCjIzZLyw7BzylMOAF0Tndp30quiKcQLMSLqla/Lz4HMm+Ve9SWNyCFYcxeQWkOYUvbayIIdEuHb2twHJC980oe51Klw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ni/1RlXrdeaGMkzCL+CI7189B9RbrNPyY4w069aWnxk=;
 b=VvoPitA9rmo13uc7WoZFrvPvMSvHWbS6AbeNZqDTpDAIVPDuMHFqqrNR8FsdGEANixv1WjIMSMhPC6BquiYIwh/p2UV6PO/zEAjTfhFfHk2sGFrj+txcZQ7818/UnG5G220fi9vNfWfHz9cIsNzulBeWIEHTPoL2QGeDO35NCvu11DOm1awAZY4oIM/TsD9LOcqlXDLa0PzUMpOAb9NkDdasbbjKVRjGosERb86nssYtC0R63PF8o+HCarEvo2llCp2vky0NM6ELUCTTC3Qc1k0My15XHVc/KEVtlNcETfRZ6odm/UgbPT8Ws74BGcHRWbiBFVOloWO29pdKKZffBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ni/1RlXrdeaGMkzCL+CI7189B9RbrNPyY4w069aWnxk=;
 b=CJTG2obLQsBpThHFipsusmFksY2bADfO5b/AUkSoWC2l5pFtYlw58spK0b1TrCzPbRnvZ8VFVlZSGfji/1EWQZVEdtNvlTbFJqyck7Bjzb9P2P30d+qpw7kWq/e7zswPtM/dQkjCS5H6S/FqbR6YrzasrhxWRN48BfW1iAIkA20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.17 v2 5/5] vpci: refuse BAR writes only if the BAR is mapped
Date: Tue, 25 Oct 2022 16:44:18 +0200
Message-Id: <20221025144418.66800-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025144418.66800-1-roger.pau@citrix.com>
References: <20221025144418.66800-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0568.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: 52e45150-27d1-49ff-d095-08dab6977ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4gg6rX80hMu6WjtWG/gThsz47QgWVQ60DUalK2JpM6DykUZExCQAvwXTEPO5Lu3WOQXgwuJ9yrZ6LiXNgboXBykGoqrwCs+2TVgUdwGaDaH92zjNvRPcSj4OaSWSiEN9asP7aI60KNOv4usGY9GiFp/veMwdvylk0eQ6CgCqOh5XeQUuDJ7cTL4LHbHkLcOLrnRSAp/BrXBzQ/WqRtwynm6c/912xzn7yXV4M/cxY4q2NmRB+08wri177daC8S8TRcauV3B477NM+M+3e4hGgVdpgAsf0j3SHDIRvpCUnVeShSBALieUZPUdKXJ++SNXqv/0WjzGp7mcd/yt/D4XoUaw8odZvmsKWpj1Pie1Jf/tUjCv7zN6NWILsXJcbqzR+ZqFTCRJas8iphHU6ryuLgaUP2NtiKFGMsaYM75ePx2Ul1GuFdieFQFI/jfmyIB603Hy2MtNXmnalGyGDeTVqlq4JnzLP4q0U77stQjPaRyxunkwAn0VdA+CmTpfeWgnsLpQVq8toAkH+FbW61R3xZdxComNEfrbfhZywmlAfZxBxkSxkYc7GatWVV9DKy+iWsQVM1qhy9axHxD950rzEtNYmPzLn2i8+NxLSTnyDPnysMZzeEJ+Vxyx4UdiapwSgLM5VN6GRD7EP+hSn38zJ5pewqKKAfuP8/mu5bCibYXFiJqgkJQtwB6/nF/xXBBKNtk0G7NlWobXbdfSN2RUSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199015)(83380400001)(316002)(6916009)(5660300002)(41300700001)(6512007)(8936002)(26005)(4326008)(66556008)(8676002)(66476007)(66946007)(86362001)(107886003)(6666004)(36756003)(6506007)(2616005)(478600001)(6486002)(82960400001)(186003)(1076003)(38100700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWx6NVRPS1JleThGNnBMbGRxY0FrSkdBK3M2R3U4UW1XRmRxcENBTm1VaVg4?=
 =?utf-8?B?aEFSN0lzcitxaGNnM3dCNCtnVHFzU3MxdWhGelh6UGx5VElRUXRKeEU3Q1Ev?=
 =?utf-8?B?YlV3RWFqOHRnSUJ6alUvK09mNzY4VVdGcWFIYzJtcVpudzl6YXluZDd3YWFU?=
 =?utf-8?B?YlphaEdZWDcwYk8vUlBNUjFjTGJLQW53NzZ4MFZoR0djNG1LNUMwM0xMd251?=
 =?utf-8?B?RnVyUWhVMnNSZ2FxTDRFV2lBU25tUEFSeG9TQnpjK0hFc1FNMU13eXorSmEr?=
 =?utf-8?B?aEkwNkJjNjRKSHhmYmwwZGlVOFhBOE5kNHRHV1pOZ2V6eHdLcmR6bnZSWGFC?=
 =?utf-8?B?ekVkOG5ZQy84WW9jeGhaRVh4Y1kxYWxYREE4QS9uTUlVMk9uamFWUFREdW5G?=
 =?utf-8?B?RjZOZFhyaG83SS9FVW1Ma3g4ZU9PWG1oQ1pFTUN4Sm83WVZNZGRFQlI1UVBN?=
 =?utf-8?B?b1J3UFJOdTIvWDJUaW14TWVjNmNmSTgwTkpYRnd0K3NCTmhyRFpLdUFGc1Iv?=
 =?utf-8?B?b0tNc3RtWjBwd3hqRFlFWUhJQk5aSVVwN0c2SVFUSHo1WndoS1VJK1VxaHhi?=
 =?utf-8?B?ZVh4MitIc1p2Y2RFSGVqT2lUbFR6Z085TllsRG95L0VXdm8zSHRpUERTckdR?=
 =?utf-8?B?MCtPTnNkL1B1SVBDZUJXK1VZc0xuUlZqQWZBM3NmeG92TGZQckIwMnIyeFBw?=
 =?utf-8?B?dnZqaGJsYWlQenRMK1JuMStxZ2JkUFdBRnc0b0dnYmU1cEtkZVdRQUdLWEcy?=
 =?utf-8?B?VDc4dzdWTHU2SkF0YlNhZ3JBSk9BQjFOUkVaWTJEeGJBM1IzbXRTM2JaZkM4?=
 =?utf-8?B?UXZESzQrMUJkMzFUVUR3d0RoMSsrQ283c2VLb2x1cTNkZ2x3SVAyTVJsRVBi?=
 =?utf-8?B?Z1dvRDB6VDB0cXdVUG9GUVNxeU5kOFdhT1BqeW9BYjlVOFRLN3BENmg3YWlj?=
 =?utf-8?B?ZGxoZkdDOURaUWk1c1l5T3VCNVRRODZPdWFpMGUwT09Dd09YK1RVRjlwNjRZ?=
 =?utf-8?B?a0o2QVo2U2JYT2ZJTHRTQWZSSzhocTNuNnFpN2hzcS9lZXZaMGVleE1rU0pm?=
 =?utf-8?B?Y1VISXo1L2lHWnFHTmlGSEpkWGVXVm9CWTFpb1dPSFVwQmtYL2kzcjU3Uks5?=
 =?utf-8?B?VW5kY0JPVnp0OVlSL0lKTSsvdFRBQkg5enRFRGhpZUxPdlZ6ZTdYLy9GZ28r?=
 =?utf-8?B?TXFBckFsQTluQnJPVDgwMDhvMDVCYjlhN2ZmTjY1NjRPQWZBcHA0ZTdXc2du?=
 =?utf-8?B?ZVNaWWhLcHBXV3hZcmlWdjdyOGJCeDZBakp3UzJHSlpmVVdOa3REQkFURVNO?=
 =?utf-8?B?WnhmK2tSKzlTeEFINzU2RGdtekxScVdEdzBUOGVpbGVhZzlXUEQxMU96clpR?=
 =?utf-8?B?L3RuS0Jaa3Z4RXVFd2YrRkdtYVplZFM4YW9PYnNVUDFUMHVSNFRKeUdTd2xi?=
 =?utf-8?B?SFdwbWp5N0Y4WmR1MG42eVorblc3bmJhZXJkaXBZakJLTmlIZGErMko5RWlM?=
 =?utf-8?B?bjZOZzBVVjgwYnhFa0xQcFpSZnJ4Y3ZPalU0RVEvNkRTYmt2anI0cE01a2pK?=
 =?utf-8?B?VU84UGszZ1RDdFRSTFprZ2Jwa2ROSDFrOW1lQlptaVY2RlpRS1V5Z3IwNjZq?=
 =?utf-8?B?S2UvKytuUmpueWZWYVRSaE50d0g3SnhFT2RHNVo5TCt2M0xxYXg0NzVDaWJi?=
 =?utf-8?B?Yi8vSDlXQWxwQmxEMW9DYzNaL2pWdHlyczJ2alQ4enc3WVhjL05ZS3BwTHZQ?=
 =?utf-8?B?cmpydFAzOHgvRlhyWmZxS3hPR1pYcW51Sm93cXFINmpjaUJTMk4xWGRyVWlE?=
 =?utf-8?B?NDhxcllnTUw3eTdlV1RXRzc2a0xiS1RhaHJvQVRBRU5hVUdwdm5RNzlWWXY4?=
 =?utf-8?B?cjZZL0dQY2cvSG9ZUElza2p5NEc3WCtLTng1Mk5lR1BkamVBdk42OEVjY3pU?=
 =?utf-8?B?YjRiMy9qQk1odVdsNEtEUndEenlRbHk4UFd1TGh6bzB5RWZrSFE4bmJrTzlI?=
 =?utf-8?B?LzFxczllNWo1ZEhub3JBSVh1SklKTmJNWkg4bWdLT0hXbm9JbXRlc0NJcFVi?=
 =?utf-8?B?YzRMTnE1WTAvYjgyc1NMTGo2Yko0TnNpamlKcXBxeWY5MWtic3BnK3RtdVlR?=
 =?utf-8?B?ZEZNc1MybUdOSHVOME96WDkwbHl6ZXB6Y0dkREJ3blpvNnJKMVZGWFNDV0Fy?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e45150-27d1-49ff-d095-08dab6977ec5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 14:45:01.2524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inIno9macsuacieyc2E06qK6/4MhRwFXRusPqLZj64olJSk7RBABwmQgYCqLV5hf66tJUDyfLTRvMsJZgl1wgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5808

Writes to the BARs are ignored if memory decoding is enabled for the
device, and the same happen with ROM BARs if the write is an attempt
to change the position of the BAR without disabling it first.

The reason of ignoring such writes is a limitation in Xen, as it would
need to unmap the BAR, change the address, and remap the BAR at the
new position, which the current logic doesn't support.

Some devices however seem to (wrongly) have the memory decoding bit
hardcoded to enabled, and attempts to disable it don't get reflected
on the command register.

This causes issues for well behaved guests that disable memory
decoding and then try to size the BARs, as vPCI will think memory
decoding is still enabled and ignore the write.

Since vPCI doesn't explicitly care about whether the memory decoding
bit is disabled as long as the BAR is not mapped in the guest p2m use
the information in the vpci_bar to check whether the BAR is mapped,
and refuse writes only based on that information.  This workarounds
the issue, and allows guests to size and reposition the BARs properly.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Cache setting of memory decoding in command register.
 - Reword some log messages.
---
 xen/drivers/vpci/header.c | 18 ++++++++++--------
 xen/include/xen/vpci.h    |  6 ++++++
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 4d7f8f4a30..ecd95059b2 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -128,7 +128,10 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
     }
 
     if ( !rom_only )
+    {
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+        header->bars_mapped = map;
+    }
     else
         ASSERT_UNREACHABLE();
 }
@@ -355,13 +358,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 static void cf_check cmd_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data)
 {
-    uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
+    struct vpci_header *header = data;
 
     /*
      * Let Dom0 play with all the bits directly except for the memory
      * decoding one.
      */
-    if ( (cmd ^ current_cmd) & PCI_COMMAND_MEMORY )
+    if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) )
         /*
          * Ignore the error. No memory has been added or removed from the p2m
          * (because the actual p2m changes are deferred in defer_map) and the
@@ -388,12 +391,12 @@ static void cf_check bar_write(
     else
         val &= PCI_BASE_ADDRESS_MEM_MASK;
 
-    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
+    if ( bar->enabled )
     {
         /* If the value written is the current one avoid printing a warning. */
         if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
             gprintk(XENLOG_WARNING,
-                    "%pp: ignored BAR %zu write with memory decoding enabled\n",
+                    "%pp: ignored BAR %zu write while mapped\n",
                     &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
         return;
     }
@@ -422,13 +425,12 @@ static void cf_check rom_write(
 {
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *rom = data;
-    uint16_t cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
     bool new_enabled = val & PCI_ROM_ADDRESS_ENABLE;
 
-    if ( (cmd & PCI_COMMAND_MEMORY) && header->rom_enabled && new_enabled )
+    if ( header->bars_mapped && header->rom_enabled && new_enabled )
     {
         gprintk(XENLOG_WARNING,
-                "%pp: ignored ROM BAR write with memory decoding enabled\n",
+                "%pp: ignored ROM BAR write while mapped\n",
                 &pdev->sbdf);
         return;
     }
@@ -440,7 +442,7 @@ static void cf_check rom_write(
          */
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 
-    if ( !(cmd & PCI_COMMAND_MEMORY) || header->rom_enabled == new_enabled )
+    if ( !header->bars_mapped || header->rom_enabled == new_enabled )
     {
         /* Just update the ROM BAR field. */
         header->rom_enabled = new_enabled;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 67c9a0c631..d8acfeba8a 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -88,6 +88,12 @@ struct vpci {
          * is mapped into guest p2m) if there's a ROM BAR on the device.
          */
         bool rom_enabled      : 1;
+        /*
+         * Cache whether memory decoding is enabled from our PoV.
+         * Some devices have a sticky memory decoding so that can't be relied
+         * upon to know whether BARs are mapped into the guest p2m.
+         */
+        bool bars_mapped      : 1;
         /* FIXME: currently there's no support for SR-IOV. */
     } header;
 
-- 
2.37.3


