Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E242EA8AB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 11:30:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61783.108828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwjb8-00071w-Ke; Tue, 05 Jan 2021 10:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61783.108828; Tue, 05 Jan 2021 10:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwjb8-00071W-Gj; Tue, 05 Jan 2021 10:29:54 +0000
Received: by outflank-mailman (input) for mailman id 61783;
 Tue, 05 Jan 2021 10:29:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onuC=GI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwjb6-00071R-Hf
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 10:29:52 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f6c2668-fa53-438b-9fe4-42c21a8dfbd6;
 Tue, 05 Jan 2021 10:29:50 +0000 (UTC)
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
X-Inumbo-ID: 6f6c2668-fa53-438b-9fe4-42c21a8dfbd6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609842590;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=oiq0Y04XSA48CdvM2ysKuhNZkReIrXAxt4DmAb00lYQ=;
  b=KBVkhLVABEy/qhKG52dEnozeiZZfRYKH1ST7Jy056bWdxNCzCvtjPz6S
   J4HZJivTYPr6lC3sp/rm8bF5AZ0IhE+d8i+Ru6Yvb7Z2uYKZGruQL5STw
   ab3EStdDEyLB89w9JY2Y0VNrzy+EZZub0PzfOam09Xng9IKRCes4VTMbu
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3uyvJ9LSFiXmcs7+UByhPZvbF9f53bmBl7/ly47ZAHMIPNS0xI+exsFzNa+ozYTiz1V8e2Qz+2
 Nq3n8zU2GjaMd7eSUNPp+Lch9Q04aufkiiRKhEMrFxIlJAg8TcGRrVm0g58EKs6Z7inHsgeJ7A
 BxL0KvtLAzSv5tQkxh5NSgAdzVxad3UMiojkAkE0TkCjG+iFkJKMD3xf6E2o0z3GXN3aDQtdAV
 HLYK/8ZxcP+xa3tJtC7HbZkXL4Axzy4agwa+S7t906KAcYKdMSrUOeBhd4ubBs+HbPRx8PcNBA
 69I=
X-SBRS: 5.2
X-MesageID: 34406880
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,476,1599537600"; 
   d="scan'208";a="34406880"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSgot4/Egr3Kk12xXpYE8YDulKqP6OFiruz4+KuMRCT9cXREFYiMLiiVNmxezpyTdievdyRdKnHYywnskb7eakDbH3nvhf0px1MVqqFQcWW6rkntX1eATR5oinkuhk9oJgc/wEIgZsYF+gw/MwEy2YZvNMHaFJrw08dJ5sKLXpcxlkp/wAXKw57w+pYgk1vruDOAtPgcH/vGhRtZcEsALSxzYpLoh1pmH69WRy33EjdYDzw0BpVF9GcZcem4Tf20ToPeBzqqXAaMsS88L+HMbrFp7JmJYQufMBVvsBqPb1DHy7k4v5GmXB2v45vcyQY4aznqHBbu84xNu8h8k8DoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFXoNaq2dTYBsSVsY5lJov+Cr8onpUzzgEmqOSveGmc=;
 b=NiZfjzE2x+ALiOLjEjU0blczDVgXKBUZzq85pt92AGZXKITXc8Zb7gj1NWMx7+ggjONzmy+nlOCQgKuV28yzbdvOKTnZ0Td9Kr5ZMwBYOqKwuwmfcn2xuD15AK7cyCmsmRc3+27E1K+s7XK+yfuguidOSLshR4p4uTsxBTEhqs/p33qJN0VWjQCR+6isDQqwFMCOouIKvV9M+CQPVXSaDyUSfePCrGYLCGxqNP9Ai+7GCpXGXkFs/dCQ9p0NlOIhLUXrHdgDZB5NMvCRSlJYwuH2ezNnVTz2J5SB8nHKhm7NvWSvHBPCGUUhFxAn6vtrBFqzXCmqmFrN4m/70Mk35A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFXoNaq2dTYBsSVsY5lJov+Cr8onpUzzgEmqOSveGmc=;
 b=xeUjOhcifX+rjNw7i36gIbN9Dqvmnhh6gGty8oNJxVMF1SaDKt7lUO68NHBKDplZ+wSDNHNSn1gmEZhLtKrL60Eb9ybMSAzyJFwnwqIHO1or09K8NDers5hCBO9O8a6OvnOWRAmwdZdNBHR1ngld+8zqZTTHU7RQdoscj8//neE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] libs: implement some missing functions on FreeBSD
Date: Tue,  5 Jan 2021 11:25:44 +0100
Message-ID: <20210105102546.88462-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3PR09CA0028.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef0cef86-8e79-4bdf-1271-08d8b164d2ef
X-MS-TrafficTypeDiagnostic: DS7PR03MB5525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB55252699B2E7ABDBDE5C1D128FD10@DS7PR03MB5525.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V9M77rr1xQGmXTMTST73ZAg5ysbW83OZ/JCEdghVdNAOVKAs+eUCrfSplOGwQ86Btg2tcw2qlM8Ljtg6NzhGPD6YLuiAdYPAjH6P/1p9CSPxOdbav8W4+BYLdXtw8BqwD+GTy5vboyGUlvbS0nW8Dg4MpBvsku5YzXybt6LI6rDf/pBuyU8akpCr6HpyZbEjL3yAd50iTBssgo2cx6ujAJIm+CsI8XykkXK2Bnzm4lZd8krkRjAlIvyfaZxIs5Dst2qzPY8l4WDeDRWDhgQe/vW+E8Ve9hE1KkzMVBb/bwv5TkaHF87+8CBMUefmzrjwyiTj9m1lyVO8ZKh49cli510r+4yMeLzDjqYsaiBb8Sb2AVRkc5TxBWXQ1Ac+xXBAcRO7GT8l73zo2ZbQPxw3pA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(66476007)(8676002)(16526019)(478600001)(6916009)(4744005)(186003)(26005)(4326008)(2906002)(1076003)(66946007)(5660300002)(66556008)(956004)(2616005)(36756003)(6496006)(8936002)(316002)(83380400001)(54906003)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TjFjcnJTY2RPNnUweGVpdzBXTzE5MCtiWmZVWmoxM3FiWkdXbFZ3NDI3c1hG?=
 =?utf-8?B?UURPYm5nb2svL2pHNWpITk1JaGhwVk5ORmNRTmh4d3BYd3YxNWZ2LzJsOWxx?=
 =?utf-8?B?OWNaZzRRVlhFMGkzUzJXL255R21sb0NLd1JyZWZKUlZma1VuaUR6MHJkQTFK?=
 =?utf-8?B?TWRjZHBmNVVKV1hRVWpMQ1ZDcmZMbFFjYjlDZTB5VVVLdVZQWlIrWkxRQlV3?=
 =?utf-8?B?dEp3MkFrWERWK2Y2bHc3UXZNYWtQc1p4bFZoQ0FWeElSYlpXZnkyemw1bWVR?=
 =?utf-8?B?TDZVS0M4Vk9PQjFQN0V0cFdvSkcrVW9ibGVYbUNucjAwT1VXalFLS1BETll0?=
 =?utf-8?B?REV3OE5KRDFVcEpKMUNpdU1QOGVWTm5TdTNBR0NoQjJ3WmY5RlhYOEJhUWZw?=
 =?utf-8?B?Q1o4USt3ZzdCSmRYYUE2ZWRMaExTR2ltb3lJOE9rZ3JrbEdINWNiNEhNRHht?=
 =?utf-8?B?VFp1bW1aaWdHRUxyeFNZTVRJSGFOTWgvd2FKazVPZmhiWkpKRnJwN2ZMV2Nk?=
 =?utf-8?B?MjdiTmliWS9NL3hqV0NpU29BNE15SzZJZWFmUmF2VWo3THkzU3ErQ0x2dU5N?=
 =?utf-8?B?RUhDczE1ZWp2NkpQN2JLYUJnOVM4c2RwTERnMTYreVE3enZoOHRwOXRPajkz?=
 =?utf-8?B?UUVVYjVMd1VJUE5mbVdEckM2Mkp5RTA1blo5VXV4WnBmRHhDWk9uL05KVGdS?=
 =?utf-8?B?aVNZaklJWHpXSzZzQkcyeCt0TGhlTkdJNHJSL2MvemFORmNac1dSazlVYkpv?=
 =?utf-8?B?QTdMNjFKQkN2WEhvTEFYSUtQTjNtMmlxcFNKdW92OFR1QVJvWWJTaFJRdHlX?=
 =?utf-8?B?Q21FcHFQVnByeHdkaExkOEJUU0VlUFpLRzhPQ05VYkY3QWVVVmNLT2VsNTRz?=
 =?utf-8?B?V3dJSmI0ckNrSndoWUdMaSswTlh5Zm5yc054VkVTNjJGWkhOQnJ4NnNLMVgz?=
 =?utf-8?B?aUV2c3JTUjNHOVpJNlN5WmM4R3YwUHNXVFNLS0thV1dDU2NvRXZwcFFQK3Fo?=
 =?utf-8?B?WFRxeGZ3SHpjQjVkUS9KdnBsTUJVOVdLQzkzcjhGRk45TklybVFaa1ZxZ2Mz?=
 =?utf-8?B?djdnZmk2VW9MOWROK1kzc0kra282VjJaa3hhYkdxM0xGR3RFY3A4a1ErTEJ5?=
 =?utf-8?B?NEkvNGttUnNXTERhdzdmM2pnNDRiN0VwNFFENWs1ZXhBNXFxQjJlNEpmUG9l?=
 =?utf-8?B?OUJaT0t5NzNoSjU5cTN2bXRDRjFNYzN3eWRCQ2dQVE9JNzVSQUJFK0dWNlcy?=
 =?utf-8?B?M2ZZeUgrZnh0bTNBNVJBdWtBUS9hVGNsSXQvSnVqMUdDQzA4K0svbTZid1Ax?=
 =?utf-8?Q?kubFSYo03XeeDCGFVe4Gs0ZIy6AKttm9Nk?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 10:29:46.5917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0cef86-8e79-4bdf-1271-08d8b164d2ef
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 36u95d/pWjGi3IHp8S2FuYRqroSBOSf5S996BQ5Mxa4HunMK+0zQ8PyEW7ABEPej0DJPe8pETGzquhtCRNvRzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525
X-OriginatorOrg: citrix.com

Add support for dm_op, restrict and map resource ioctls on FreeBSD.

Roger Pau Monne (2):
  libs/foreignmemory: implement the missing functions on FreeBSD
  libs/devicemodel: add dm_op support for FreeBSD

 tools/include/xen-sys/FreeBSD/privcmd.h      | 29 +++++++++++
 tools/libs/devicemodel/Makefile              |  4 +-
 tools/libs/devicemodel/{linux.c => common.c} |  0
 tools/libs/foreignmemory/freebsd.c           | 51 ++++++++++++++++++++
 tools/libs/foreignmemory/private.h           |  2 +-
 5 files changed, 83 insertions(+), 3 deletions(-)
 rename tools/libs/devicemodel/{linux.c => common.c} (100%)

-- 
2.29.2


