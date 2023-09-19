Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 590597A5A6D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 09:03:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604421.941793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUlB-0006iv-RB; Tue, 19 Sep 2023 07:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604421.941793; Tue, 19 Sep 2023 07:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUlB-0006hC-OQ; Tue, 19 Sep 2023 07:03:01 +0000
Received: by outflank-mailman (input) for mailman id 604421;
 Tue, 19 Sep 2023 07:03:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezs9=FD=citrix.com=prvs=619432e5c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qiUl9-0006gq-Tt
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 07:03:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e9287a1-56ba-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 09:02:57 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Sep 2023 03:02:48 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB7540.namprd03.prod.outlook.com (2603:10b6:5:2cd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Tue, 19 Sep
 2023 07:02:47 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 07:02:47 +0000
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
X-Inumbo-ID: 8e9287a1-56ba-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695106977;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=AZrG1anf1SRwNRzD1jIE9lXsVXZrYNPwBRRqYP5zM14=;
  b=UPZO7PLUNlnYX0msQd5wadF5w/7j88fZ/WqqMf7zo8s0uKsTyd/wXtKV
   GjcNTck75RA+4++IFCGep6VIdduJwnMAhigja98sShkWJHeiKTQwC6aSK
   kHeseH7F3Loe7KQXzbmYowGzX3Qxp6c5BkEv2QVgr0EAntuMrofFSw1ze
   8=;
X-CSE-ConnectionGUID: V6hdm/5NRNqsA1duXbSmcg==
X-CSE-MsgGUID: 1vA1av0tSz+Vpe3TkNYxog==
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 121702369
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:td2u0qsR88XT/WEdUkVaXT4KDOfnVHhfMUV32f8akzHdYApBsoF/q
 tZmKWyPP/qDNDP2Ltl3O4Tk9BxS7JfTx4IwGVZtrHw2QiIV+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A6HxiFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFm4NYhXE2sSM5qugY7Bgm/QpF8zgM9ZK0p1g5Wmx4fcOZ7nmGvyPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/60b4K9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAttNTOfjqK8CbFu7n3I6URQIDUeAs7qHkkPlZ9F5G
 lwT9X97xUQ13AnxJjXnZDW6vXqFsxg0S9dWVeog52mlwLDf4xuSBXosSDNdc9cvrMJwQzE2v
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRt3jX4iIQ6jxaKQtM9Fqew14TxAWupn
 GjMqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgDpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:zcXkqaBmwLVmvmPlHel/55DYdb4zR+YMi2TDtnoBMCC9F/bzqy
 nAppQmPHPP+VEssRIb9+xoWpPwJE80nKQdieIs1NyZLW3bUQWTXedfBEjZrwEI2ReSygeQ78
 hdWpk7L9vsDVd7h87m4A++Cb8bsbq62ZHtouHCz3hsRwl2a6dm9UNTDBqdGEEzZA5IA/MCZf
 ihDwN8xgadRQ==
X-Talos-CUID: =?us-ascii?q?9a23=3Aa+Ip42owKLGTYbVXVF1O7jbmUf57cnHYiyr2GWm?=
 =?us-ascii?q?hEk8wRKClQ2SV86wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A2l77gg/5uFicR484BF4gN9SQf552yv2nFhgRqod?=
 =?us-ascii?q?FhdGJbhBzHQaNizviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,158,1688443200"; 
   d="scan'208";a="121702369"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1lB7WyrD4RspAKGZlsia/nmBOJZczFnSiiap/26NQDs/+XKJYGdV+GH39TJ4I+Nhl9iS1Zy6BVmP/HnwY52x/aoFQKkzFmM8GXghMnArSpiKnyz0rfB1ppE44yEwZp6+8ajzFuKeDLb/3I7MT28hlfABWOHktOlCq2O+QQT2OeXNCGSLJTJseaAgLw3DgLpP72n9dv4gq/qNCBrQ8Nmt6tqnsdqcuwDtpSZD9fVS8C1Y+lJrNGFisg/nuqyCYnWjD27LtiRbFIZBiNvjUz5uTphkkUlEgARJiUSfbofG1yMWXTKOWV6eYbajnGIIJhWqtVoWg6PE3gMJwGmb7uMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPisFVdhO2HGopvLpB0Hry/neJdRmM/hWa6wto5vS4I=;
 b=Npws00C2lVz25iaNYO+mLyleELlLUj0grJkKAQHIK3Wz5HHlRCNhddHFk+IHOe1cn2WwCZ0XlBY0hS/9ex01QRY9JH6kaJrpmEybvWydscZ3RlZRVXGv1TjeY29X7TnhTbf063t0oucsXwweo5K+qmT+tATPxpbs5aTKt7u6EK/bFA1RnxgCZ6O/99XzK3OmIO+aQCtBKPxk8vqedgzaYDH03wHRwLV2mQoh24imna8mYwVa6UoUf2jP22hI4841gZ1fAlYrlg4AyU1szUIx6TkyWODLCKFsQ6oBd/8klY6j80pxiOQOcUwWrChCnH6mTRijhyvces9CVPUy4f03yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPisFVdhO2HGopvLpB0Hry/neJdRmM/hWa6wto5vS4I=;
 b=oQsG3/GGEe2RqPbPorxzL6n1KDOyFWIHsg3VD0Qj8LZC6UK1XBVfc2lo1fpVjpNfq1ml10TaiH0yNrwnuGxxaGkH8NAlKdGXqEsFQerQNQVaIfji68uML8+yWbPnSZCejwG3QDU9ZyIJZ2F8RE/cgNL3drpAlVGjuwfGFTjFSEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 19 Sep 2023 09:02:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Chuck Zmudzinski <brchuckz@netscape.net>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: xl dmesg buffer too small for Xen 4.18?
Message-ID: <ZQlHj5rjMaYj8Z4e@MacBookPdeRoger>
References: <b20bdc7e-4c07-4bde-b206-4142310211d4.ref@netscape.net>
 <b20bdc7e-4c07-4bde-b206-4142310211d4@netscape.net>
 <9baf6bec-49c6-474b-a5e3-5f0473aaffc7@netscape.net>
 <640f5a9d-913e-494b-b2c6-c9b3694f7cd3@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <640f5a9d-913e-494b-b2c6-c9b3694f7cd3@xen.org>
X-ClientProxiedBy: PAZP264CA0152.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f9::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 63470de6-dd62-4d0f-21f5-08dbb8de6dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PJFDOGBQwcnLqhw/1FG/9ZdYjDrsEWHrRn3xIGjrCTqlT5liNXrTrKRc3ypFNGYckAKfVwKr4GMRPOiUFCXrxMjFPCCGWJYv6sNSRrA1dVoEDYQNuIplOV/4mLD7S1JmMxQ8JusBh4JQa4mRYj4VvkYHTcT/tpxQI3+d/S/WDjUFnZYTB2DW50z2O6kyl8Gb8Rd5xF3hL+cJBY4trzKg91pdfeUHB4UklQ6QHoxhkJZRmrOGJABiBn9h+CFCMpV7wzjwcUWtHmdbWvrlYchmsFeujyCgA/n9uCow4BcB8qXkkCfLH+Pr0YAbfaK389veRSfj4RxNLTSxrInUrROx7WdLcm10qsM9F338D2GwnTmIlmvvCIcalKZOSzTijNu4oaeo6H8JISKRfkHIjNrYwnQePZDy8Y7Ci2bXjLTgGZKym3+CM2tuu1YGlS8FEGf4MTVpYA6yFt8fmOvDUpg5zXA6xGdhpizZtcZf8LeIR7FvM5YWz2oGLD5piPcpbIyVK72wOkOEXuTd9tOM2uCdJIYa8ZnZiRiGmeVdi7vGPEb5mbjySGf/5fa4/3rjAgDv5iETbu/hjJsNHdwHkuhzcqVJkzNA8yxmjY93SSk0U3+jeTFz1voJzZoerARma+Tt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199024)(186009)(1800799009)(53546011)(41300700001)(82960400001)(38100700002)(6486002)(33716001)(6666004)(6506007)(85182001)(2906002)(478600001)(86362001)(966005)(6512007)(26005)(83380400001)(9686003)(316002)(6916009)(66556008)(66476007)(54906003)(66946007)(8676002)(8936002)(4326008)(5660300002)(160913001)(15963001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGxRM3JpU1BGK0JPdkNPOXpTTTlEYTNuZDZSQUhMQWcySkRmZ3VEUjRpN1B4?=
 =?utf-8?B?L2xMSVQ5WkdFcVkwVEdYQWdIZnBBRkxJMFk5ZmtEdnRIWEZXekZZR2NWWGM2?=
 =?utf-8?B?eUpRUjM0SjZQUjU4N25Tb3VBV3lPUFFLWVdFL3Ixc3RNOGlEbUtRWWx3aTFp?=
 =?utf-8?B?ZWdHcmVtQjRYZHFpU29zSWwyWUFiNXNGV0NIRTc0eHFubTRod3o4RmdOS3Ru?=
 =?utf-8?B?Q3VmdVBmenFpdXdVdk1waDVDMU9jdFJIaENpUmxSa0xxT0YwbjRaMVc4NWFm?=
 =?utf-8?B?TmVkWE5QMllRaTBtMG5xandTaWl3MmljL2t3anp5bDJyTWdBTXZDOEluejdP?=
 =?utf-8?B?Y2tFUTIxRUhyc2k1T09ydk9EbFBqSzBSamRPZkN5MmdMazFLQWdZWXpLa0V6?=
 =?utf-8?B?a0toVGV4NEt5QnN0dzVzbndDUkJPK3d6cEtOeFBaY1VwK25zNEJWcit6aFJQ?=
 =?utf-8?B?Uk1pSVg0ODhCaFpjTW1YdTBtSTB6VXFNQXBHNnZBcTNCMWVSNElKWCtHZ1B1?=
 =?utf-8?B?clRFeWM4czRqTVRrRW5rOGY2cUFCdnFoMXBNL3J5NXo0TDlrMlhZVU5BUTM1?=
 =?utf-8?B?SU5JQk1nN3pyRDV4NytBSWhwRTBDeCtJU21NR09LMkoranVQeWY2SU1lZExG?=
 =?utf-8?B?UU5meXIvQSs0TDh5aFRpd0FWMCtlbVZGTktTL3NVVEU4SXpxOXpSZFU0R1E2?=
 =?utf-8?B?Ykl1RE84NUlRNE9FUTJkVmdoM0VVdTFiWGVxdks5RTNveldTbHlLRmFvUndY?=
 =?utf-8?B?S0E2ZzVGN2hFOGNkV3BEcC9WdzlLVHBFK2NVMTI2ZzFLVU02SDIySDdkZWFD?=
 =?utf-8?B?OFFabnk0MU1uOHR1M2NXa1Y3aFFrOVlQcXBvdDJvSENUcEdXYjhiZkhJTFRx?=
 =?utf-8?B?Si85U3hha1NjcWRxdWliQ1REQmpPVXlyTGp6WkYva2V3WWcvbWFsMWZ4aG9P?=
 =?utf-8?B?Tm5aMU9sbWdHY1ppbHJnMWFtRVQxRUNlMTlRMldYQmpxRjF6MXhadlhETVRJ?=
 =?utf-8?B?UHRCLzJmNGJiS2FraElRMUt2MVBCQkVGbEdvdjloZTdYSHVJMkx0NkdVUXdn?=
 =?utf-8?B?Wk9ISGZPR0cwTm91NUtwc3dTbnJKSHM0TTN3b2sxZy9rSUNhbnBhVVpEVFAz?=
 =?utf-8?B?dVVKcUYyVXByUVNybVR1K1pMYlVSRm51cFlaY0s1M3I1WHl2Y1ZQRk8yR1Va?=
 =?utf-8?B?TVdJemQzbkdENVFuYkYzMEsrNUVHQlZLSVN3eVUrUWlxU2IyYjNxZ01sRTAw?=
 =?utf-8?B?czFYKzQ1UGRNYkNCVnJHamRQbnJDQmJGdUYxaDZ2MGlBOW90M2VEazkxT1Rk?=
 =?utf-8?B?ZE9NMVhDWVVXNGR6dkcwQU1GQkhENHdtOEZCZmlpU05IQkdHcll3WEE3c1h0?=
 =?utf-8?B?djJtZTgyYzZ0NlpxR0pqMnpHOWtrMTRIdUYvUFNldHk2dWNQVHBGNG5xYjdx?=
 =?utf-8?B?SnZYV1MyWkRYSENiOTlOQ1YvMGhRMGlhY09tSkJuaFNsaHl0eWozTGVGQVk0?=
 =?utf-8?B?SFZLZzNBUFljT0lGT2JSdFFpS2hMWk9tNnVqSGU1WFp5a1JRWHNsSlhueHVG?=
 =?utf-8?B?eVdDNGxEV1hnZUFydmVaeFJHTlRxdUNzeUNVajFQckpyNEN0bWdWNnJvSDFX?=
 =?utf-8?B?S0w0MmVQTGNxdFF2WndvUWJrQ2NSOHRrWnFWTHYvenNCMlZWMGRNT3A3WkRY?=
 =?utf-8?B?OWpuTzcyajE0RElJa1RUckVwdndGU0xtZHV6YWVtY2Q2UG5adjRiekswM1Zv?=
 =?utf-8?B?ZUVvWW9UaUlCUWhjUGpDT0ZCZkJQajhVV0VQTEZ6QlNVWS8xTDV6dmpLOU83?=
 =?utf-8?B?cmlJRm9GS3FFejlOMTByNUxVbjlwZ0lVQkM1MzBkeDAvb3NpQ1FjRnpOakJu?=
 =?utf-8?B?dFppaEk4ZGphT29XWXMvakJnQUxSN09LU0NJWVV1OXhMdUhjeG5YMDIwYlBr?=
 =?utf-8?B?QVY4S092a1BhRUpZMGJrVmtNMkVyUDRWQ05KT0R3UXlVZVVkWnpwRU04c3RM?=
 =?utf-8?B?akV5WUxLQURyVlptS2wxZGNnN1E2SllLdkFQRFQ4KzdKVFVSbEFlSFlFMmM3?=
 =?utf-8?B?aHd0cTlGdlNWSk1wWjNjSHZOUGNUMG1jV2hpWHRJbzRPRXNESGdSSU1HMFg5?=
 =?utf-8?Q?SDcljPqKkXWqripfTQ8nwZjn4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	31TWZJLgGO559JY27/CtP+SDJIBK9xgdAGdYu2+fTtRHgAwkrmFLl/F7YBTCR8CKfxQzvOCrQ5NNTKvy1PWwQOw90SjiMzOO9Fdv+B5rwGHrZR4KXNlv1HD79dH7Z5PLuP/WW1TSouJU3uZLThX5MgwvvDsUcfRXEJ3GH/e95Fw/5HThC5mYZ3kUHdQf7EMMAdbvq9QT/l+5MnpEcEzFHpOxu/YUpzrhAlrjn85hvZyoTE1lh6JGhyTYxMxNs7nKAEqsFFcq1VtXjDji11bNs2It5k++bYj9SUQYtwfYlplnvI3DDGbaF7P6SvGJyH84gmzxAXJu/M699QEjacngtkW61sL65g/m9Ux0UMNFNGN66+64U0PZomTq8ft78KNitplW/OAlqFFdy4mp93+NN3bcMj1ijhYPUf2CZKLZVDWUDvgXmbrLYCDe5NSw0UorrXOvoEPxJYLT9JoW1iFcnozRaVNiMt6+QxRFgaIeMZEXM0tQoyxykUn4Mu66Eem1nph30n9V9S7qu52mTEHoCs5cmvbv/0+rtTNQqlJ0gB1OUJh+/gmC04QkwrN6YuXpTMyNmO3VmkfXmRbYjJQg9EsYh2PhCRbjmjyY42Jh+5qIFRP6PjVNdoO+ozc0DZVdYNBeBt98lg+4jyEtVxcac1OWL5onjMTG6sshsYGW3m/wzeYudQ9pYubY2TMOmotKI0ykAfDUqglfTYfXs2XegdHzbKsNHNVZ9ZGu3McWuVGrlJhHqJZa/xpdyHw4q5yEm1uO/Mwyp6uYNjgqSD3KvsYdwuEXHOwET+R9vE4uBBEuPoa4s6pD6Y582E5PM+LxbUKwSrwg3CVPA3T6eFffog==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63470de6-dd62-4d0f-21f5-08dbb8de6dc9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 07:02:47.0209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rr6Rfv6Apvy9s8w691eA/MZZXfgIeuOzyhz84k39A8Oz35WoEQZDwQW0K/pNJ4h+anAC+bcBCSCwZUhqKGbVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB7540

On Mon, Sep 18, 2023 at 07:49:26PM +0100, Julien Grall wrote:
> (+Roger and moving to xen-devel)
> 
> Hi,
> 
> On 18/09/2023 19:17, Chuck Zmudzinski wrote:
> > On 9/18/2023 9:00 AM, Chuck Zmudzinski wrote:
> > > Hello,
> > > 
> > > I tested Xen 4.18~rc0 on Alma Linux 9 and my first tests indicate it works fine for starting the guests I manage but I notice that immediately after boot and with only dom0 running on the system, I get:
> > > 
> > > [user@Malmalinux ~]$ sudo xl dmesg
> > > 00bee72000-00000bee72fff type=7 attr=000000000000000f
> > > (XEN)  00000bee73000-00000bef49fff type=4 attr=000000000000000f
> > > (XEN)  00000bef4a000-00000bef4bfff type=7 attr=000000000000000f
> > > (XEN)  00000bef4c000-00000befbafff type=4 attr=000000000000000f
> > > (XEN)  00000befbb000-00000befbbfff type=7 attr=000000000000000f
> > > ...
> > > 
> > > I have noticed the buffer fills up quickly on earlier Xen versions, but never have I seen it fill up during boot and with only dom0 running.
> > > 
> > > Can increasing the buffer fix this? How would one do that?
> > > 
> > > Thanks
> > > 
> > 
> > I see the setting is the command line option conring_size:
> > 
> > https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#conring_size
> > 
> > The default is 16k, I tried 48k and that was big enough to capture all the messages at boot for 4.18 rc0. This is probably not an issue if the release candidate is being more verbose than the actual release will be. But if the release is still this verbose, maybe the default of 16k should be increased.
> 
> Thanks for the report. This remind me the series [1] from Roger which tries
> to increase the default size to 32K. @Roger, I am wondering if we should
> revive it?

I think the relevant patch (2/2) will still apply as-is, it's just a
Kconfig one line change.  I'm however thinking it might be better to
bump it even further, to 128K.  From a system point of view it's still
a very small amount of memory.

I'm happy to repost with an increased buffer size, but only if there's
someone willing to Ack it, otherwise it's not worth spending time on
it.

Thanks, Roger.

