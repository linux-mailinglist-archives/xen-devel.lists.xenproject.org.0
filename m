Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143205B6B59
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 12:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406262.648652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY2ld-0002hN-PY; Tue, 13 Sep 2022 10:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406262.648652; Tue, 13 Sep 2022 10:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY2ld-0002eM-Kg; Tue, 13 Sep 2022 10:03:45 +0000
Received: by outflank-mailman (input) for mailman id 406262;
 Tue, 13 Sep 2022 10:03:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lgvl=ZQ=citrix.com=prvs=24889d1cb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oY2lb-0002eG-Tq
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 10:03:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9bf8100-334a-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 12:01:06 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Sep 2022 06:03:38 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN8PR03MB5139.namprd03.prod.outlook.com (2603:10b6:408:db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 10:03:36 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 10:03:36 +0000
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
X-Inumbo-ID: f9bf8100-334a-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663063422;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=btfGOdff9EapJKr9VJRX74+d5kCcGt2TG1OEK/1Z3SI=;
  b=DDzQ/evPVqli7zothPyLKSup8uMrJzK4eDqQrnV37YvK/bqFI/kQ/l9/
   O4iKlkuiw5IqMSjm+pxK8OWenLs4oXGlOeab6vNzciX0VWyxtw/wnQiRM
   iav3ibA+cwvGK9sGwsd7utybwyR6nR9OFoh3q9uusISmDOPis4hFPK4L/
   g=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 80373853
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AipPIsKqbCYSs4l2wigXcyH3dIi5eBgzWbkVVj?=
 =?us-ascii?q?Yv8NTMMsmFhBT8lAxcf/9W1sqUQdHbeeAXCVZk3hCVqO4JVvnTeZ44iYPQzR?=
 =?us-ascii?q?kmXdsxA6uyY7/rlrddsHXekj3hHxe+oNu1MEhH6EP2V2voesn31zbTKF3P5I?=
 =?us-ascii?q?pAmeetEFMGYNeowgvMo14yC6/eO4VRgyjIgKxGXwkDwJ8JjX0IEWMLX+aT3a?=
 =?us-ascii?q?Vg9QsCzAss/WWxo0/dRSFHuEcXFlUQgl1fNdJm2ezeRf981B2nJeFT9Apeaw?=
 =?us-ascii?q?9ZMonJRb4FiVk4Epcpx5YXqz70UFrqUadcky1Sp8KkhWR7l+kN8Sqzww3FKt?=
 =?us-ascii?q?Q676Yr5t4fBp8Wna2TOyNG+ESS+HA9fGNVYzUPWGNMNj5+OqBmmmC10ukFxa?=
 =?us-ascii?q?YbFAa5cFcxarQ7sFYOmZe/Mzu0zhNXPV7xEZywfk/gxSPFrOUYZOUuBo5g8p?=
 =?us-ascii?q?iRnbfaqnoXJ4/yTler/KMklzYIQ/uBDC/P70GhttVj0FGQq1Hdw9VlP9YS9S?=
 =?us-ascii?q?Fslw7Cste5pq433gXR5gCjTSFzWq9noXbdKMCPYj3R+w2vwMFXEasqPdPf37?=
 =?us-ascii?q?NEfKMeWIaAfT36JV1P9OkheVvtrdZ0xvQCOgl/7ZRDtmNLmc7Mo/bIzBywS4?=
 =?us-ascii?q?nOkc05QcTuiaCVt85pDA5k8VzKpPWR7K8nI6S8/ndL9EfyU947bxylvvZOm2?=
 =?us-ascii?q?r8AUnYrZHE7uDvyyeQhLZ0/ipF+CuxPPxtQrCf2w9lj2jmQOq4ci1nDN69pw?=
 =?us-ascii?q?1n8qwlCJg5JQ4zWv07mQIjQsN2KxWr2lsuSrUfTzv4zMgpxDVSIiZQNlH9/i?=
 =?us-ascii?q?fbI0NQtFe4cBjin65H4QVlYGSkfV3Hz/6m+KWOSG0m2LTaI+sBgioeZmsW4r?=
 =?us-ascii?q?R5qFyS93gVQXKRkRkREKZfQB1sJtJ70rPCk75d103tFiJUC/bCCNTw48IJzd?=
 =?us-ascii?q?BSlaycoro0vBiEnWzXmX0ZUz9VFGWRPwvRxZccmReUs7w/Nto42PaAF9dM2q?=
 =?us-ascii?q?0i5Krp2mO9gIDOiXqq4VLTu8M8U+NrNZKMsT6HMNySWSyk8NCR4/9ApJ/Hae?=
 =?us-ascii?q?1XO6AxBrD5S5c64Qj4mJSSpFG8Ha47NkteAEtaNBAyD1sLRo4ATA0KDC3mwM?=
 =?us-ascii?q?szQHBJ5vpSJQr+6eXyhBEsKU/JhiSeYM3e5FJU2Bry0j/pso80tKSVy6lr0n?=
 =?us-ascii?q?BAEyE30QETs0Sxpg2jXLgCW4CJo6843VfQjyWANsYCm7AK13/R5lrTKf3/AH?=
 =?us-ascii?q?GIi6LLJ+BS0lblroCMW6jf5GZvdCo3vxrOR5yux+No4KUl5IkwJoSuLEyWB3?=
 =?us-ascii?q?/2URykX9u5ZqRAW3JaFS06wmE9PP+zzGrw01F3Dx42E0io9Sk1VDn9mBvqFC?=
 =?us-ascii?q?gZpiVl5H4ISzgyDN1OFBxJSiKL9zhTdY97xBBLE0jz5sqdVNGIYzan+GdHMf?=
 =?us-ascii?q?984TnATiUH+hnT4dGECpLIv8HrUOJXrlyWD13gw2U+qRctMX+4qAWOTpxAFt?=
 =?us-ascii?q?MwuK7SiVcS6SRt5LasUVgMWf3m8aupcTv5+rVR734YXLiv4D1dYJOJbuPBqi?=
 =?us-ascii?q?SG/ihLUUq3FBOeQHUUv9sD55ElgDpzhr+r+jGsj59/SpU3/Gw34k/yHx2uEn?=
 =?us-ascii?q?P4/ssp4mUCsUk3scPOXuYPJh1J1HfAVBkAwv4YZdXl3w78XQcMcQv1SPNoMq?=
 =?us-ascii?q?g90DcALrMe+98gdjVbVysRpPW5ZYQrv/7ZREKEDZtE6Food+rElY9QQo1xvy?=
 =?us-ascii?q?7VO2CGEFiDELs6zu07JtX7G0xo5fcvrBf27TL+BAIdUmahKWUgOZKBYdSUPK?=
 =?us-ascii?q?EgGTAZwTwt3dgzrZxlWHjwn2lnpsBp+HFwYBCRXr1HA77MOtoyJit91dk+gC?=
 =?us-ascii?q?PZHN6iLkraiKa2nNgYfhFElHinkqDa0HDx88j5cokVH8WQDe8ll4b7r82Cod?=
 =?us-ascii?q?PB5rrbJbVdqRtRj/VfVUm1uN0MQ8eUFsmg6AEOwLfcsLzPYz35x48TCbTFB/?=
 =?us-ascii?q?juLwBYNlAEXXOiXQswtDlF3cwekgjS4ksDFlrfYbZRlO8116RkIl/KXnrwDJ?=
 =?us-ascii?q?0dBBQ2vtn3R+Q/9arbDaXI8mTWnAzJzn0a49Zmfz9nElk3OZqkjV3KiAFEkZ?=
 =?us-ascii?q?/OT5KENvrjsZj7QRgJcrVChrWqXjHQ+CFgsQfgUdmVBmtp4EEOns575exXgL?=
 =?us-ascii?q?gvzXgWCEX36ydaXy2OyX2w/Kh+HmKcsGuMy9MAcbcVW+BWzv7b+3JVuhiZ7x?=
 =?us-ascii?q?apUZtbtNwhHswhB5Z/ius0yI25NmMkFB+8NIyDqkq2btDOzCA3VRnjDEO1FG?=
 =?us-ascii?q?WNcvveMaSDlvcpB70DI/v9Fl2GCpL1jyBs+yMvAjD8BIhzFn1AtnC22f/mH/?=
 =?us-ascii?q?Zth2wKcEefqgG66gm5BvByQga6JIO9KOueuAKo7w5B8+mDR4XkW8taourIx2?=
 =?us-ascii?q?w=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,312,1654574400"; 
   d="scan'208";a="80373853"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLucxz4KE9olW9YbfDTh9f7zc8PQKmPokdxkdISvyxsijN/lZ1Ax3Bly8AystR5tLFsxktDw+E1doFYvk/26pSYA/WWgkq1g2bjStlAbeiL8+pzp9Rc8nDUnceKsl0QNwcSJcGJWFpy2RxOSosdng8HYVDCsuGI91T7Y5RtVbj/GbZmqm4rhUsDhbK5L+VYvZC2nFdge0toX7DP2DIB3M3QAqqMYq8m8U63QtNVTiw7RBltT3mqnSwKBXl46gTTyWXHeXR6gMTxYS0QLpgbQW2m4ZZHzZhQX4k69KP3TsKQaarVAYI0floJJY8JpC+bSDXM8IVINM34lB+UqWXQNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9t7MxQ7mEc0WCJ817FW3QRBgGmcgGnWH2jZL/6FOtyU=;
 b=UdEY/fRlNMBlM0nycJBismy8xdF+u1Vgh2uqN+/gyBRIo7cvtjNEu+IRe13d9QBhQSlRTG5s3WNSNoHDlRvdAgOSG/UcTN/37m1X2BMMf+oumm9qHZGVKxAuzCUBeO0B8hguxyLjqHb51G8TUGX7JFRCWlHdNGLUvqBE8wtVSZdoZLQsCoaETgtgn4SyOtpTw9Y0dgNDylC/LxUXCQB+JWV/oqdjuEpJTitRLKc3SllPHmO/rhFP+9KWrvTiAdHCet0l9hQfv1pAFLwnSgT7gz7wsGdQA4aGO3VjgKWdcVPLqvHzNBChOZywwdKQTHUEajS+iq3LtaREdWMUXRDrTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9t7MxQ7mEc0WCJ817FW3QRBgGmcgGnWH2jZL/6FOtyU=;
 b=xmak0Vcl6peaURW31cDLLwW0T/gfkIHTu/i6m4JlWgKejh/G11W84I0dtkWdraJaBBltQ0XknVO8zmnXZrPh0xlSxtS0iHZBljMiY3DGVzLeIiNXwsj0xN9gBTpzxBG7pjKN4URM6bo4GOVfBubfIFwIxeOEz/jEkv46cdRFXjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] libvirt: disable Werror for non-libvirt flights
Date: Tue, 13 Sep 2022 12:03:28 +0200
Message-Id: <20220913100328.27771-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|BN8PR03MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: 604c3b8a-e21c-4abb-1549-08da956f391f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wYB5AGrPhwBGcCqryajJr5yPpOQxO0zLvEqOk3yUCOYuNvkBHwuKtvMdUG4mk+RNOKYmye6Jz+SHsnAEtYzZKJOrD9ks/cNtp8V3lQqaVey4+OzfSj1BCAaOfPf8/5hhIX1WrJGLHG4ErGI0bW22EBeUHJJpYtAv3WQCTOZ43Sbqbvpna96EhrNvfr9aHk7vcuYSUCEqjWc6XZxVMhPKdwD/DwYDAz7H//L2rOkkU44ZQiYCClmYXQtVqUmSQ/9f438bIhBX80ND6uj8AxZlmyjXveGA6XnHldovBzseUSW2tjSY5MOztiw98w1klNkW0zA5FdDkZKNwupuIfkCKsJplrrEcNHAPF7jzwsrvGoDhM7JcqBxyIp3ixzWhawA6eK4J38t6JJ5t7QRDw4+KfZityhwd31pMeHwP0dYLuoGEG/k9nFNf7m8KxxBayU8cfk1f6sjZHWt+QKQvbi/YaAFM+7nPVpj5mO9/UaU/jOUML2VYMWKo49c2JkNJTiOomvAM78czReKXuPC324qnLd1gcMjNu+kLQdTGnzgGXncMInuxVcOUbSUPC44ynYTtteIlLFCR+RA6mOjU+HdFQK8Bpsr/npifXgandUwPxrqyoCx4ZFWiVVfGlVIyEXf0xlhwQxNdxIJS/nNCjj5eXNqRo1R6/Fa+BYd95aLbkgEig0BMj3+w38nFHzS6DYbnsN5Q6zpDIV5Vf0R4UL6K0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199015)(41300700001)(82960400001)(478600001)(2616005)(6916009)(36756003)(38100700002)(6512007)(1076003)(316002)(66476007)(66946007)(6506007)(54906003)(26005)(83380400001)(66556008)(6486002)(186003)(6666004)(8676002)(4326008)(2906002)(5660300002)(8936002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjJIQzZqQmxZbUZuZnl0d3VUNEdwTkE4WmtRNjFBWmRjemJaVVZxQ0JGbkl0?=
 =?utf-8?B?SWRJcG9yVTNpM2ZxR1AyamIra2ZzY2xMTzZuU1haTy9sUlhUQTF3Z28wNkZK?=
 =?utf-8?B?azhBY3V0QjV4ZjV5dVdKS0xnT2lIMjJMdTlJWWlxU0hEK3lOZ3JTc3Fjb3Mz?=
 =?utf-8?B?ZGhoWDJxbTZUdktsOVNoTXVUQXpHVXQ3VkxubU9ZR3FmenA1dzhncDR6S2ZF?=
 =?utf-8?B?dmRWRG1DYjZVMWhjTlpUaGZ6TzM4WkN2U2V4TXZPcVJPTG5QSk1vd0llQ1Fy?=
 =?utf-8?B?SU8yQW9oOEt0R1VLNFZoRkxrSnhHTXJyamQ3czVhL1BwUUQ0SGZjMC9QOE9w?=
 =?utf-8?B?SC9YQlk2VnRmWE5TekE3ejRGN0hYRExZWHVOc3FMZVhJZGlNTjRnZXZrUWV0?=
 =?utf-8?B?Qm1URkphclhOcXhSR0JvRVlMVkJGVTR3cXJFNVNGczl3ZE1ONkRVLzRxVzZa?=
 =?utf-8?B?a0lLMVBoV0FaMWFXTVgwZzh0cHA0L1pRNkwrZkdzVk1INWVtc1lQMWVWTnhX?=
 =?utf-8?B?ZGRHVHBFbElZbGNjVndqaTlLNjhkTXYyWE1YUktubjRuOTRJMjNPR0Z3QmtW?=
 =?utf-8?B?bVZneDNOVzIzYVNhbjBydUdkSTFjZTFabWgrUmwwQ1N4dFY5cCtHSHY0enZO?=
 =?utf-8?B?YTZiRUNaTVIyWlVJMWFLSUttUExScENsY3lxVVFORzRjSkZUbVdqQnNTc0dn?=
 =?utf-8?B?cHN0SXVWSzRzOXNOcmcxV3NxQWdjTVJiWUd2dWphQi9ROVFOVjlnQTdTL2t4?=
 =?utf-8?B?NnFLcDkxWERuZitpZzdOY2REUmpwdFNaZVc0SWRrS003cUZoc3M2eU5NYWFL?=
 =?utf-8?B?SlE0RjhwRGYwellOc2dXR3drSWdjR24ybytidFB1WktDMktDVmpFK0R1Yk9p?=
 =?utf-8?B?Ui9SWWw4aDZYU0MxVy9OamFiWk1jN0tOUUZjRGVZUy80bFE4VlVDZnRleVBw?=
 =?utf-8?B?RUlEQ014Ui9IdWxnZmgzZGgyR0JKeEVuNWs1K0kvZ01iOHpmMWRRaCtGaU1I?=
 =?utf-8?B?ZitvVlhsWkJtZTF5ZzdDQlNDTlZacDVHS2tId01QOHFvODR5bG5mUnlJMnlX?=
 =?utf-8?B?aVhxK1VjL1p1a0pnTlhCdVV5SXFneHZjdlJEeEUvMFRzSURGVVd3WDBzU3M5?=
 =?utf-8?B?cWhkZkNkVE1STUdiTDdaVzV0YzF1cFlseWRFTnltVEFrNmhiMUpNemlhMXlk?=
 =?utf-8?B?cElVcTZHMGR6N1lWQUxlVzRySy9GUjN1QkMreFk0ZURXTTQyWFVkeE1mcGpC?=
 =?utf-8?B?UGpzVmtGNUZKM2Z3MXNXVVN0S21tQUZkYzhIZ01WaUIyMDczSlc5ODB3cU10?=
 =?utf-8?B?eWU4dStROGo0eGJTOGlzSWNsWjN6UklGTDRmQTNpd0hLa2xFMUY0ck5yUUVz?=
 =?utf-8?B?NkgzMzJMS0lneDJXa0Zhc3lHdU5lOWpsR0s3ODZSK1BHdk5OQzlzb3c5ZHhV?=
 =?utf-8?B?N2w4cEwxMmxWcmlzc0J2czZ2aC9wWFZMTVN3bnZRZHE5UTNZWUFHQUdlN21Q?=
 =?utf-8?B?UVk5Q3NZOEZPcTI3U3JDL2ovTHN5Z2x4eVlIY1JyaWtKTkJXLzB6eCtxaHZS?=
 =?utf-8?B?dno0RUV3WFdJU3l0cmR6eGtyczZHSmZFQkFlbzkvUndqMmU4Wm5kVzRvTU9k?=
 =?utf-8?B?TVJlRnB4bUdlUHVqUDUrQlBBMkRCRUQyTTVoeitFczNqeXlZNUxPZ1lwYnhX?=
 =?utf-8?B?N1NHZmExc1U3Mm1UWUkydTJEakFxaFNmay9TcE15enhlUENGZ1NhZm0yUWxW?=
 =?utf-8?B?bU1TT3hsbmZETzdXZ2ZVZndIai9MZ2JsamtTcGFVTW5vV09ZcjNHaTNiNUli?=
 =?utf-8?B?R1VTS2RES1h1UFRnNXJ3ZkNBWGdoZUJpcytmTGU1akF0NFhicnQ4N3ZIVzVL?=
 =?utf-8?B?cUZwMVVHVkNQRmM4R1JCcnVsaU1Pa2xSOUFlVEZFaEZoMTFlZTBRZURjZmRI?=
 =?utf-8?B?SmdRMzFCNEJ1S2JMNkNsaUxOV25xWEF1Z3VPTE1ORnBRUUR4bWJkZ2pLK083?=
 =?utf-8?B?T01JSVF5a2ZwK21JdFh6R01wTHY3eUVDdkluc3owajBOamkxQS9SYkVYY1o0?=
 =?utf-8?B?eFZKVjArYnZrdXBTZ3YvOUVSb0h2S2lFVURubU9YZ2NNVUFvT0xzK2thaXVi?=
 =?utf-8?Q?DfNwxZwQk15AXGFoa5v1krRgL?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 604c3b8a-e21c-4abb-1549-08da956f391f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 10:03:36.0936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+X4NBCo6BCFYPIs4m3TDFaEBZgY0ZzwU3uANE13hxlOtiSMSIyjt1SuCXxDs4AimVzi0rDFYKLvMXEqkAosSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5139

Current usage of Werror=switch-enum by default for libvirt builds out
of the git tree causes issues when new items are added to libxl public
API enums if those are used in a switch statement in libvirt code.
This leads to libvirt build failures for seemingly unrelated libxl
changes.

In order to prevent those errors from blocking the push gate, disable
Werror for libvirt builds when not in a libvirt specific flight.

The errors will be reported on the libvirt flight, and block the
pushes there.  So the author of the changes in libxl is still expected
to send a fix to libvirt code.  This is no ideal, but the other option
is to just disable Werror for all libvirt builds and let libvirt
developers fix the breakage when they notice it.

runvar differences for a xen-unstable flight are:

--- /dev/fd/63  2022-09-13 09:53:58.044441678 +0000
+++ /dev/fd/62  2022-09-13 09:53:58.044441678 +0000
@@ -574,6 +574,10 @@
 test-xtf-amd64-amd64-3                                arch                            amd64
 test-xtf-amd64-amd64-4                                arch                            amd64
 test-xtf-amd64-amd64-5                                arch                            amd64
+build-amd64-libvirt                                   autogen_options                 --disable-werror
+build-arm64-libvirt                                   autogen_options                 --disable-werror
+build-armhf-libvirt                                   autogen_options                 --disable-werror
+build-i386-libvirt                                    autogen_options                 --disable-werror
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    bios                            seabios
 test-amd64-amd64-qemuu-nested-amd                     bios                            seabios
 test-amd64-amd64-qemuu-nested-intel                   bios                            seabios
@@ -1217,6 +1221,10 @@
 build-arm64-libvirt                                   make_njobs                      1
 build-armhf-libvirt                                   make_njobs                      1
 build-i386-libvirt                                    make_njobs                      1
+build-amd64-libvirt                                   meson_options                   -Dgit_werror=disabled
+build-arm64-libvirt                                   meson_options                   -Dgit_werror=disabled
+build-armhf-libvirt                                   meson_options                   -Dgit_werror=disabled
+build-i386-libvirt                                    meson_options                   -Dgit_werror=disabled
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict recipe_dmrestrict               true
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict  recipe_dmrestrict               true
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict recipe_nomigrate                true

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm unsure whether we want o disable Werror even for libvirt flights,
but this seems more conservative.

This does at least unblock the libvirt builds for both the
xen-unstable and the libvirt flights.
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Julien Grall <julien@xen.org>
---
 mfi-common       | 2 +-
 ts-libvirt-build | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/mfi-common b/mfi-common
index 59e712f4..450229e9 100644
--- a/mfi-common
+++ b/mfi-common
@@ -459,7 +459,7 @@ create_build_jobs () {
     libvirt_build_runvars=''
     case "$branch" in
     libvirt*) ;;
-    *)        libvirt_build_runvars+=" make_njobs=1";;
+    *)        libvirt_build_runvars+=" make_njobs=1 meson_options=-Dgit_werror=disabled autogen_options=--disable-werror";;
     esac
 
     job_create_build build-$arch-libvirt build-libvirt                       \
diff --git a/ts-libvirt-build b/ts-libvirt-build
index 16b45cfd..e4faa1d7 100755
--- a/ts-libvirt-build
+++ b/ts-libvirt-build
@@ -73,7 +73,7 @@ sub config() {
                              --with-libxl --without-xen --without-xenapi --without-selinux \\
                              --without-lxc --without-vbox --without-uml \\
                              --without-qemu --without-openvz --without-vmware \\
-                             --sysconfdir=/etc --localstatedir=/var #/
+                             --sysconfdir=/etc --localstatedir=/var $r{autogen_options} #/
 END
     } else {
         target_cmd_build($ho, 3600, $builddir, <<END);
@@ -87,6 +87,7 @@ END
                 -Ddriver_libvirtd=enabled \\
                 -Ddriver_remote=enabled \\
                 --sysconfdir=/etc --localstatedir=/var \\
+                $r{meson_options} \\
                 build
 END
     }
-- 
2.37.3


