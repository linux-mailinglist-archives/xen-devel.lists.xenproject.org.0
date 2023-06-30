Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10D4743C98
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 15:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557488.870858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFE43-0007HB-GC; Fri, 30 Jun 2023 13:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557488.870858; Fri, 30 Jun 2023 13:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFE43-0007E5-Cw; Fri, 30 Jun 2023 13:21:31 +0000
Received: by outflank-mailman (input) for mailman id 557488;
 Fri, 30 Jun 2023 13:21:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F6KI=CS=citrix.com=prvs=538dabf6d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qFE42-0007Dz-LS
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 13:21:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 049503f5-1749-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 15:21:28 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2023 09:21:25 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB4990.namprd03.prod.outlook.com (2603:10b6:208:1a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 13:21:21 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 13:21:20 +0000
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
X-Inumbo-ID: 049503f5-1749-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688131288;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=9f2UAR1zU9SVXAtNdly+LYPF+ky4a9eufndeiHJdi+A=;
  b=WF94afY75sNt8l1zMWwQVOzFuuJLbwiPWL1iT2m0Ozm9LEN0E5eySkzm
   ouU3alfUq3JlN4u1WMT1NhO3n5hqzCG8vOoc9dsyEw7OZvYgHpmirFG7Q
   9TXEr6L74yve0iWE+F0WOZB4K+awrxAljVQcMev/xfOHDZQyKBtiF5S3Q
   A=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 114764113
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NEjxJa16Tv8SDpOFpvbD5R1wkn2cJEfYwER7XKvMYLTBsI5bp2EDn
 2dJDDuCPfqNZWT0LdFxbo21pkwFvpSHyIQ3SwZopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gJlPagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfW2RW1
 aUoCRc0TxWnptus6Y6lYM5NiZF2RCXrFNt3VnBI6xj8VK5jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6KlFQZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137OQw3+iAdl6+LuQp9tYmwTM12svGDoMT3b8+sfo0HfuVIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbRRwtJWFRHTb8a2bxRuwJCwUIGkqdSICCwwf7LHLu5ovhxjCStJiFq+djdDvHzz0h
 TeQo0ADa647iMcK0+C3+A7Bijf1/pzRFFdtvkPQQ36v6R5/aMi9fYu05FPH7PFGaoGEUl2Gu
 3tCkM+bhAwTMayweOW2aL1lNNmUCzytalUwXXYH80EdygmQ
IronPort-HdrOrdr: A9a23:5zAUVaGP4VrldywQpLqE78eALOsnbusQ8zAXPiFKOHpom6mj/a
 2TdZsgtCMc5AxwZJhYo7690cq7MBThHPxOkOws1N6ZNWGMhILPFvAA0WKL+VHd8kbFh4pgPM
 lbAspD4AKZNzdHZaGT2njAL+od
X-Talos-CUID: =?us-ascii?q?9a23=3A1v2ndGjeNg3K4oMTeY0ni6o2dzJuKHjF7C7gAmi?=
 =?us-ascii?q?BKGNNaYSPYGOO0oRFnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AJucWNw66zLJu8y5NwDih0PXcxow5xpa1UR8clqk?=
 =?us-ascii?q?WnNOeGGsrBWbHtWS4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,170,1684814400"; 
   d="scan'208";a="114764113"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGOXqlLTLFZi3Njg47GcNaPSgZJ3NHA8j81nNkyVadaj/27kjC3mSDsI0NyYawU3xeXawx9yrSVPwdNvfd/lh8P4PNFCb1EtQFEkEwHnskkM8qj+iQ5VppbXG8UjsDu3VPiRZ/SIOHkoQPnr+2JBJnp8Uqb6uhStjbbB4WNhzSrCiGdIXJaM85X43X05t3WDY6HC3nhLcATuGyqZXPLIyZQtiq3rx10ZQOCHeS/lufNddck5DtEpB43TcJ0fQs0fJdf/uUXk+mPa+6N7H7MzTMw1HErQ+NymTxCHGECGv3FugijyLLg3/uUl5FLaH11VSLfXh3CEcpPBO9bXcYqrcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v37ahnbQVAMnPOCwWe3H8Ii1Qz+FpCWeHJE9Rg7DH8U=;
 b=NxdN0ns/4e1y+2o3NSXP9chIcYcUSGxe866rckygXSk/7aRYhtVuWJCfkFN56/SQftF5p6nElpYnwHqv1TinRgYYGT6eZiCfDG00F8x3O0r8IhKiIE8y/n8lQYt/yhQmm/+ke/o/kXw8mVUlP7VCsdPWYaDiXdGzDopOqXiGgcaC72YvfFHqVEXPEOsQ6Oxh0yZgLhw8tCPQfaJzSaE4I+zx5qtAlTCIK7iFFdCxQtxkVPCV2qXC0tPIWZ1m5mwp+fBXGyFNMgDPH3teWmirQCOvOYomChJfIN0cUraTjxuOwY96gmT/3iPkCQAEh6dEDfkhpoFfb+ysKN8iuCVhOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v37ahnbQVAMnPOCwWe3H8Ii1Qz+FpCWeHJE9Rg7DH8U=;
 b=rnrQWUwcOHes9ZSIc//Oly6qd1DQGwrKZ2Yk28A9CKCfTLORDz+aSB+Wdi8wa5G6ZyB9e3smtilb8sMVbyNRg8ZbTIrXZKYaEni7b+lAa4hkgTHP3ynpe8enLhN2zLGUeMpv/BM40kdmXkJ907MG7xd3r9suICIlcs/4zeHuXA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] amd: disable C6 after 1000 days on Zen2
Date: Fri, 30 Jun 2023 15:18:20 +0200
Message-ID: <20230630131820.29323-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 7487aea2-b457-41dc-d980-08db796ce4b2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RFIBYWk9eRdV12W7GzE/MqJ/TMTVen+W9mJiKfn/U3EI7/SZr09UsDYNNuiyokbgwJ93nhKSbN9Qfmf9N+l6qEjRrnv93GnOzTvBbYBG+qE4wCCx0F0xBuORyqcb6rVXyXf1nH1oEm93vDtYkfgrwQXOBzXbJiHM5xdGg7Qi+xsj4fFhJ825OIId3jdVJsQ+vwU8Y0AeXmADeOuNICH72t5oN89jpE7L9sttNb40d9jiGkjpw9IlKCx5W4iD/gKUzXk0eDXUiJqGr/uqGjxjhCXRp8XjWr05xDB1HpXorabZCKYiXBr7PBxwJABiXW46g0z6hqnB21rVxZ1lro/naSu+bOwkepST8MU/ja0DSm00qd0nmz40qsAGVagkLzNoAYBhyMWnwuGPwRTpchuIY44tUbyFy1qStq9tUYm+pJCxH3+5Vz30+VbWdBzK9tpJFuRJ3Qs6JdmtRSToXwNNp5wu0sypRvB1Ywxjn89Rl6y3xmt1/6FKSdLAGRBXln8VaxBX/SymFKQea15d3DHtPopNbWXwmcOgP71GCjjvQjheYy+N3Rcz2ZBhjfqenNqNKmyoSGOY0ePVYFwZhTUWGJEYOEN7kwOrKMPJ27oHldW9iDHwe+oMCJuKzytnBqCi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(86362001)(54906003)(8936002)(8676002)(5660300002)(26005)(6506007)(1076003)(6486002)(478600001)(66946007)(66556008)(66476007)(6916009)(4326008)(6512007)(41300700001)(316002)(186003)(2616005)(2906002)(83380400001)(36756003)(82960400001)(38100700002)(221023011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU1tU2tBaU1CLzZXWHZJMEh5QzRDWXI0cXdGR1ByY2kvUjJ5MVpOQ2U5Q0tk?=
 =?utf-8?B?SkpEMFFLMUhKZU5BVHEvcDhwNnlibThPb256V2hiODlwMmpPWGZUUWRsUlVT?=
 =?utf-8?B?bzBFU1BYeXJXKzR5TU5yNGE3UEw0bEpDWDU0K0xSNlJMZlBGSlFuQlBoVDlB?=
 =?utf-8?B?YTBLZ1kxVy9jQnpFOVN1ZDRYSUdUWXkzYU16dElRcHk0eXZVMEs1VEQ0Y2o0?=
 =?utf-8?B?UElzczk1QzZPZFlweUgrcUE2dE54TW9VUFZFbzIwRTZkNWc3Yno0ZDdqUVlE?=
 =?utf-8?B?RksybUFSayt1SnhFbnFEcVU1RW45TlF2WG9yOU9FdTRodXNFU3E4YVBRVXZC?=
 =?utf-8?B?eUZKK3Z3dHFDMVF1cTFtaGFvelc3eG1uSmpYNlAxd3F3TXJUdFpOQmJFL2M2?=
 =?utf-8?B?S3FZUG1hcGdTTkowNzFHQ3htYkE5RlNvbkJOaDZvSzFiRXE0cVZQSDI0TU42?=
 =?utf-8?B?ajQ2c212MllSMjZlc2hRT3pXaUkycnVwZkRNZTRpVDZqdFJoTXdKY1F6TFNr?=
 =?utf-8?B?SnYvZVVXblF5V3BoYzNwWDFBNndseVlhY3ludmRuR1dxejQ5U3ZLMmtmT21C?=
 =?utf-8?B?YXFIbnNlUERmejdpeTk1Z0t4RVg3NzFHR3BHN1dnSXcyd0ZWZytJTXVFbC95?=
 =?utf-8?B?Q0d2WHppdTRianpYQzVqK3BmUzVLaEZFOXBzMWNqQjlWUTMwdEV0UlNIWlEz?=
 =?utf-8?B?RVhnWktheUVqMWtQTHU3Q1NGMDgxdHdGazhYb3R0YzBJNVZ1RTlOVUNXOEI1?=
 =?utf-8?B?eW5hdzRkdUQvejRDYXNKaC9TYU9SY01UaHAzU0I3dG9hL1pZc01HSmt4UUZZ?=
 =?utf-8?B?aGRmRUJsRFdQdjVmUU9kb1pkU0g5WWRwQkJXSmJIWk9YSmdNQ1FBVElRMldD?=
 =?utf-8?B?cVdWRmVqbjZ6MUt3TmhYVXc2TEUxOStzU0NwNXB6Mk9aMkI5d0UzbnFwRFpV?=
 =?utf-8?B?blRDTE9HZm9zdFMwcVM4Z2pTMTZ1Sld0Kzc2OVQ5Ykd0R1I5c1V1VGxraGRI?=
 =?utf-8?B?N2xvK0dHOTBORkswTHVBZ2lMRnovY2lpQkh1QjFhK24xd0pGckcwVkVyUDFu?=
 =?utf-8?B?L1Zrc2lkUjFsZjVYbnNEcFlRSmptSml4UUNFQTQ1ajVvSFRtczVxK2d1VTBq?=
 =?utf-8?B?OXN0VDY4NEpRV21LWjFIQW9oYmM2TVdlMy9kdHFMSHZYRmhIN3ZaT2VJam1X?=
 =?utf-8?B?TjA1bWZXdnNTakx5dVAzRGJ3YVdlQ0lERDduL0MzZjk0Y05ZQkoxRXBqWXdu?=
 =?utf-8?B?ZzZ1WkczMjhkT0NyemUwbzkwMDI0WUg0d0YyOXZvMWV4TE5JNDEyaWFMa1Rs?=
 =?utf-8?B?OHVTUXE3eUtrS1BzNXRSQmdCMFEzMGp5dzRGcWJEcmdXMml3cENLR3l0SFFJ?=
 =?utf-8?B?YUZPcFYxZUxDMVVxT1dmVXRyQjFaRFhvVmRuUGUwNmVCalhtY1FJTnRBbDh5?=
 =?utf-8?B?MmsyeVRqQytjUW4ramlkRUg4ZVlkZVQ3SFNUQmF3TFNlU3ZkVnp5cE5nN1Fh?=
 =?utf-8?B?TmdiTjE0MWp4bytnU2xCc0g0Nk1VWEdiZnc1ZTdoaHBVSkdRNkdYekJwVlk2?=
 =?utf-8?B?aFE3ckp1NDE2bTFoY2NqNXhEMGhqMytPRUhOOUk5MnV3emQ4dGlFWWtPei9T?=
 =?utf-8?B?aTIyS29hVzdTLzJiM3FsUm1COU91NmVZRWFxK2tuRk1OaVRHQjUzZDFqN1Fq?=
 =?utf-8?B?ZjI4dkVDOFQvWUlwaEtTRU1NajB6TDJzRWVsVWNnSlZ6NE9DdTV4QlhnNGEy?=
 =?utf-8?B?cWtGbnpKMk05cmNncXgxTnA0cXRmbDlhY2phMlBNbFpUd2RVSGtQbC9uVzNK?=
 =?utf-8?B?eEhvVXJuc240M1RPbmNqQVlkaDRkcVlvNDU5UjFOQ3BjanRzZzdpYmFDYS9u?=
 =?utf-8?B?UnFnNDRHOS95c1pxS0l5MGowWFJFY1QrZUpIc1kzQk0yWDJ0elpTNEZveDNu?=
 =?utf-8?B?djRhOWhkRkNYWWxZRy9qVzhyOG5BKzBvVDg0QVJkT1JKRnZGQ1NjTkMwZXJ6?=
 =?utf-8?B?a29lV2JER3Q0M2VmVFNkakVaS2ZOYy9VeXNlc2kzcm8yc25WUHRJNW56djJL?=
 =?utf-8?B?alFDeTlTaE8zVXNCYi9USGFnMkkxWWlTNHJCMmtkMjd3eFpxWDR5UW1abGlS?=
 =?utf-8?Q?n/l3lWv8V9PQExeM1QhnIbtT8?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qq+c9Nko5C1eCRBTBVNlk1gRQraQ7YSodzvrWij8eWEqKoupt3YdtJfkXbgwET3n+1MLmaqhSysNgsfj3NdbOYFJdPNPwnDKBjCNlNquIbHlmDGDx0Rl/KRstRVr0HNpFUxQpK2+eMvg8UWExuQXtEgfkYwgVVBtIX0ZctTXz/k3DacK2M6Wu47/1lwztONe3BRsnNcsCSAQPEgz5bCsQb5yZnvzRo/jsfl8ddmqbHO71u8LHNab5pMRbrc7oQDE1R24xYCqaskLIPJx9Q1duJabS9ECjvMdL7tWb1lui4DN1CDEEaAY7+5JrmpF7ZhDNguoAeXt4M4NFl2ejZL9V8NjOu9uF1TuM0EiTIqtsgAZXxfDtOehRNnlCxOGzT/5OPmu4h+WRGDiSEmOq7sBtSbeczncLKVUKDd3UKoyFegv73q78shD7bXXdNgUDDjMYDrjCuONe1HOE7q0JniLHbNKS/WHIQhCboUPvhjTr3YhhQybKXGirpI7vA4ljkPLF5PRil2huRMToihC5XRE7DKQu3SfDp5l4RLDoaAY0IxFRvq2gSacXAwXlWWiaWwVXK3gLGxusf1kSGeRH9ai6uZTevF2JeDf5oOdjJx5aYT7T3LxLn7LycToMZCKLs8RaTkIJ7BSMR4EZ5usaEhinlkV4NKgg3vF76pdiXndZpH3I6AKGFOTEeiwxErNzFneAmik739vDJwtAcdib5GKFGd5Of2wMlPalRqjIUPQGmzoESZabq1dClGFJTCL3KZ8CotVHMq8xgQn6PWradOdixT0KwRrjnhRvgmGT+6+ID7lC9xqIp2d3q6b+xRtd9SXkY+dEr+SbXV2HXbBavcafEnt1aqJ+hRAXokMIdkpJfA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7487aea2-b457-41dc-d980-08db796ce4b2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 13:21:20.6512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6je0EEcSIPWOuxYkQzRok4XKnBjkG1hXcezUIMP5o75N8fKPYXEFISAxQCTG4iuEoerUlHR9gbaLY206SjT4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4990

As specified on Errata 1474:

"A core will fail to exit CC6 after about 1044 days after the last
system reset. The time of failure may vary depending on the spread
spectrum and REFCLK frequency."

Detect when running on AMD Zen2 (family 17h models 30-3fh, 60-6fh or
70-7fh) and setup a timer to prevent entering C6 after 1000 days of
uptime.  Take into account the TSC value at boot in order to account
for any time elapsed before Xen has been booted.  Worst case we end
up disabling C6 before strictly necessary, but that would still be
safe, and it's better than not taking the TSC value into account and
hanging.

Disable C6 by updating the MSR listed in the revision guide, this
avoids applying workarounds in the CPU idle drivers, as the processor
won't be allowed to enter C6 by the hardware itself.

Print a message once C6 is disabled in order to let the user know.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
The current Revision Guide for Fam17h model 60-6Fh (Lucienne and
Renoir) hasn't been updated to reflect the MSR workaround, but the PPR
for those models lists the MSR and the bits as having the expected
meaning, so I assume it's safe to apply the same workaround there.

For all accounts this seems to affect all Zen2 models, and hence the
workaround should be the same.  Might also affect Hygon, albeit I
think Hygon is strictly limited to Zen1.
---
Changes since v1:
 - Apply the workaround listed by AMD: toggle some MSR bits.
 - Do not apply the workaround if virtualized.
 - Check for STIBP feature instead of listing specific models.
 - Implement the DAYS macro based on SECONDS.
---
 xen/arch/x86/cpu/amd.c               | 70 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/msr-index.h |  5 ++
 xen/include/xen/time.h               |  1 +
 3 files changed, 76 insertions(+)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 0eaef82e5145..bdf45f8387e8 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -51,6 +51,8 @@ bool __read_mostly amd_acpi_c1e_quirk;
 bool __ro_after_init amd_legacy_ssbd;
 bool __initdata amd_virt_spec_ctrl;
 
+static bool __read_mostly c6_disabled;
+
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
 {
@@ -905,6 +907,31 @@ void __init detect_zen2_null_seg_behaviour(void)
 
 }
 
+static void cf_check disable_c6(void *arg)
+{
+	uint64_t val;
+
+	if (!c6_disabled) {
+		printk(XENLOG_WARNING
+    "Disabling C6 after 1000 days apparent uptime due to AMD errata 1474\n");
+		c6_disabled = true;
+		smp_call_function(disable_c6, NULL, 0);
+	}
+
+	/* Update the MSR to disable C6, done on all threads. */
+	if (rdmsr_safe(MSR_AMD_CSTATE_CFG, val)) {
+error:
+		printk_once(XENLOG_ERR
+		"Unable to disable C6 on AMD system affected by errata 1474\n"
+		"Reboot recommended, otherwise system might hang\n");
+		return;
+	}
+	val &= ~(CSTATE_CFG_CCR0_CC6EN | CSTATE_CFG_CCR1_CC6EN |
+	         CSTATE_CFG_CCR2_CC6EN);
+	if (wrmsr_safe(MSR_AMD_CSTATE_CFG, val))
+		goto error;
+}
+
 static void cf_check init_amd(struct cpuinfo_x86 *c)
 {
 	u32 l, h;
@@ -1171,6 +1198,9 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	if ((smp_processor_id() == 1) && !cpu_has(c, X86_FEATURE_ITSC))
 		disable_c1_ramping();
 
+	if (c6_disabled)
+		disable_c6(NULL);
+
 	check_syscfg_dram_mod_en();
 
 	amd_log_freq(c);
@@ -1180,3 +1210,43 @@ const struct cpu_dev amd_cpu_dev = {
 	.c_early_init	= early_init_amd,
 	.c_init		= init_amd,
 };
+
+static int __init cf_check c6_errata_check(void)
+{
+	/*
+	 * Errata #1474: A Core May Hang After About 1044 Days
+	 * Set up a timer to disable C6 after 1000 days uptime.
+	 */
+	s_time_t delta;
+
+	/*
+	 * Apply to all Zen2 models.  According to AMD revision guides at least
+	 * Rome, Castle Peak, Renoir, Lucienne and Matisse are affected.
+	 */
+	if (cpu_has_hypervisor || !boot_cpu_has(X86_FEATURE_AMD_STIBP))
+		return 0;
+
+	/*
+	 * Deduct current TSC value, this would be relevant if kexec'ed for
+	 * example.  Might not be accurate, but worst case we end up disabling
+	 * C6 before strictly required, which would still be safe.
+	 *
+	 * NB: all affected models (Zen2) have invariant TSC and TSC adjust
+	 * MSR, so early_time_init() will have already cleared any TSC offset.
+	 */
+	delta = DAYS(1000) - tsc_ticks2ns(rdtsc());
+	if (delta > 0) {
+		static struct timer errata_c6;
+
+		init_timer(&errata_c6, disable_c6, NULL, 0);
+		set_timer(&errata_c6, NOW() + delta);
+	} else
+		disable_c6(NULL);
+
+	return 0;
+}
+/*
+ * Must be executed after early_time_init() for tsc_ticks2ns() to have been
+ * calibrated.  That prevents us doing the check in init_amd().
+ */
+presmp_initcall(c6_errata_check);
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 2749e433d2a7..5df090fba791 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -211,6 +211,11 @@
 
 #define MSR_VIRT_SPEC_CTRL                  0xc001011f /* Layout matches MSR_SPEC_CTRL */
 
+#define MSR_AMD_CSTATE_CFG                  0xc0010296
+#define  CSTATE_CFG_CCR0_CC6EN              (_AC(1, ULL) <<  6)
+#define  CSTATE_CFG_CCR1_CC6EN              (_AC(1, ULL) << 14)
+#define  CSTATE_CFG_CCR2_CC6EN              (_AC(1, ULL) << 22)
+
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
  */
diff --git a/xen/include/xen/time.h b/xen/include/xen/time.h
index b7427460dd13..9ceaec541f4d 100644
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -53,6 +53,7 @@ struct tm wallclock_time(uint64_t *ns);
 
 #define SYSTEM_TIME_HZ  1000000000ULL
 #define NOW()           ((s_time_t)get_s_time())
+#define DAYS(_d)        SECONDS((_d) * 86400ULL)
 #define SECONDS(_s)     ((s_time_t)((_s)  * 1000000000ULL))
 #define MILLISECS(_ms)  ((s_time_t)((_ms) * 1000000ULL))
 #define MICROSECS(_us)  ((s_time_t)((_us) * 1000ULL))
-- 
2.41.0


