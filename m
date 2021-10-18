Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CE9431F20
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 16:14:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212337.370176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTOj-0005Dz-11; Mon, 18 Oct 2021 14:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212337.370176; Mon, 18 Oct 2021 14:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTOi-0005Bj-TH; Mon, 18 Oct 2021 14:13:52 +0000
Received: by outflank-mailman (input) for mailman id 212337;
 Mon, 18 Oct 2021 14:13:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tpC=PG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcTOh-0005Bc-JN
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 14:13:51 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d796cf1-301d-11ec-82d8-12813bfff9fa;
 Mon, 18 Oct 2021 14:13:50 +0000 (UTC)
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
X-Inumbo-ID: 9d796cf1-301d-11ec-82d8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634566430;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=l+dNsJUXdeVg3wkrf0EehxmowJ3Zk7Gz6kQPvsSe2bk=;
  b=hsOG6oFM+kf8I4zhqgnAQ4twmF/Oa1MTnt4cVlXN7V+Ezb9hvTUySw7C
   jrPb31JgQm8hxw6GNJpbU6+0Pod42/ce3PsNIWXItbKZ0bKd0Zw4ocCww
   q89ppSU1UT74725tnhZI4KOY3UYoMC4IgveubH7Gj28UNSq4L7b0cMuLv
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ML9E70PRLNv3PU8uRxbA7/TFLZ0wiKMdcD03IEpxLHLRbZJ7+LXgYqQ8XnQmzrJDQgBFReocJj
 ekWAkeEygZ91sFXFUt6HXb1JFOHT2SYg0lqLoae7TflIWyp+rmKY50BjMeKqxEY8PGy3AUUuMY
 BFR0Ul/SPl0KLc3MaB0kPWzKDIK0GOxVQWxCQqpGlx+F5wjg/SRzjP0tv9AzF3IQml4i8SGD2L
 I51TJzWUHlfif0agtK6C2tFehCC9F/GMRVHkbSSMIRH8L55y2aDK9jtpvqVTD2qFOTWHwNVZAK
 CRFvBfFcrO38cTt732Dm+HOq
X-SBRS: 5.1
X-MesageID: 55471918
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1/B3fa2YqSE9j1fn1vbD5Qh2kn2cJEfYwER7XKvMYLTBsI5bp2cOm
 2JJDGmGbv6NNzGheop2OYq/9U0BvMDdzd81QAdspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970Es7wr5h2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhg81R8
 O1V74OMZjwnPIaRpeNAXEFCDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIIEg25h35Am8fD2P
 sYeYBFAQzP5OxxVN1I1M9FlsNv1iSyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PL+y++NugVaT7ncOExBQXly+ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTWkvV68hgZGROZ/KOM4w1ywzffbuxyGUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P8mvsYXl9wXsqIHZeF1NcsoaLTJQb10qXFr5e/LiJYsoZ8N0a6
 wuBqzQinP0thMoP2rTTEbvv0m/0+MahouLY4GzqsoOZAuFROdbNi2+AswGzARN8wGCxFAjpU
 J8swJD20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4LvG0veRYzbppeKFcFh
 XM/XysLtfe/21PxNcdKj3+ZUZx2ncAM6/y0PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0EDLShP3WKqNNKRb3IRFBiba3LRwVsXrfrCiJtGX07Cu+XxrUkeod/mL9SmPuO9
 Xa4MnK0AnKk7ZEeAQnVOH1ldp31WpNz8SAyMSA2ZA760Hk/e4e/qqwYcsJvL7Ug8eViy99yT
 uUEJJrcUqgeFGyf9mRPd4T5oaxjaA+v2VCEMR26bWVtZJVnXQHIpIPpJ1O96CkUAyOrnsIiu
 Ln8hBjDSJ8OSl06XsbbYf6i1X2run0ZlL4gVkfEOIALKk7t7JJrO2r6ifpue5MALhDKxz270
 QeKAEhH+bmR8tFtqNSQ3PKKtYakFed6D3F2JWiD4ObkLzTe80qi3ZREDLSCcwfCWT6m466lf
 +hUka3xaaVVgFZQvoNgOL931qZitcD3rrpXwwk4TnXGa1OnVuFpLnWchJQds6RMwvlSuBesW
 1LJ8d5fYO3bNMTgGV8XBQwkcuXciq1ExmiMtaw4cBfg+St63LubSkEDbRCDhRtUIKZxLI54k
 /wqv9Qb6lDnhxcnWjpcYvu4K4hYwqQ8bpga
IronPort-HdrOrdr: A9a23:mPhO1K4uf+8oJq8OHAPXwMzXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1/73TJYVkqNE3I9eruBEDiexPhHPxOj7X5VI3KNGOKhILCFuBfxLqn7zr8GzDvss5xvJ
 0QFpSW0eeAbmSSW/yKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.85,382,1624334400"; 
   d="scan'208";a="55471918"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4YWzFN+kTupUBoAbvXhSOlYlAiGNQ2xod2Q8x6uk77MpIoudk5cpsbwQib14eGZNpYXG9Ep/NJexvVsC2g0J2e7pmOBQvJDEb7h72HPjUWgWe1FBYyu3Uuoes0X05HPrLhpnPOnMKToyEJZxkda4yAmWWzv61uJsSK7417dOj0uL3Z2PvWRG7B7AT6litTrZp6uPzsm1wf3+h7mCMq/o9fj6ZrA3RlZg66XmGzTLh4KOEnRdzNrZo4svz+yb8e/JProwUIbQ2ZLZlvfIsXxkoyL/Cy1gLzONk1kquh0eciRvniM8UFUPTJ161qwsZVQnIUSNc46aMYnkk4+HZAkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dc+qMydesX1h0EmgRj4Svje9E02+vYvUHM+dhZKnqMs=;
 b=SOFK5m92noehyCXnq4OG9tdhKvGu2hfsnPBoYaaqdxPIwBUmaNEzanWpQBjp7N0ufJ9MvuMTA5ua2Us+M/AacDLRJC0PCtv81xdUac7xJ6VFBjsOj/kEVTH1WCfa5g+bjiLLi6HvIIAUaf83lyxUVfqU9sl8IPL/w47Edd+O1/CAdYDO79rYs2kTBCLzT2y9dngYoNtl8ETOVshZD0bnsdzESQW/NPCSKrOrRCBMaG8D5ZwKDTp3Mww6j3QQ1YshIDgVKRt5/3wIcWUhs09lIJzB6DxsEhqctRRX4CZro/KXOHGzKT1RAxU6sx45hs7fW/PXPGdZfAaNeRBcYhuXLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dc+qMydesX1h0EmgRj4Svje9E02+vYvUHM+dhZKnqMs=;
 b=LL4LLHZSBKSdn4J3w3/V3Z8ikHPfW2dIocOGnUau9Ib23mDTmupXXYT6qmzQ/SGEnS+gZxfpGxmYo1JjTwSowrrkwPgKviPBxPFNnQLTM4wAnuXsXyZg2rteiRxt/8E0vhT0HD1qNLst2KmJEn+EiaIRXRZre0PupyJFaU53GLY=
Date: Mon, 18 Oct 2021 16:13:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] x86/PV: make '0' debug key dump Dom0's stacks again
Message-ID: <YW2BDQwPOJ2qL9mw@MacBook-Air-de-Roger.local>
References: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
 <268da650-1261-0ac6-9908-7916f0b4d2ec@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <268da650-1261-0ac6-9908-7916f0b4d2ec@suse.com>
X-ClientProxiedBy: LO4P123CA0187.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8561a73e-9e91-4908-eeef-08d992417b0d
X-MS-TrafficTypeDiagnostic: DM5PR03MB3210:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB32107B4481C145280F8501BA8FBC9@DM5PR03MB3210.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iTclhTq90kLqblPXFx22D5bNB4Z6pS4z1KWs73+2JDgsqPaQx869RKHBSzbRgA9YfcCl0gQKRDz7sbHKA8L0WwOsOofuzvlL7des80OqyUeEu4lToJc2ccIAtHZXnW/SbphkKnyQ++JiT6FMpYYdiq/aSWz8et1jw27cH9/46VXM2GXUO5Ju6oo61YwhCzkX/ZtfeYkhqqISa8869jj4GrOancEZeDGqUxFPryHNHjnh4QIlLxPrld876GH5Vl1zsFjvO/y8DJCHGHOFv1JWgdQX/IreZMT0JIMTurC4olzxpl/BzhTaFAvI4lb41123iDJyPBawLsfCTEPlNAX8zOEfR6r3yHNZLNFtUIBlU343wWc77vkVIYqNY6XMCjwDJU11SSBXNP13dbJE4IxdsZ47jFdgh+lG516nYzz4MnXjMaI+hEh3VXsaq4Muu5Gcr0mF4SKxjb6gsNr7QjVMejhymDD/Oo8xelGgqERmWUdVMMiNVZqDWg516ji1y8KQMQdPZbzvK9XCXIviGqt+R5X4DOcBmENgfI5pHhihftAQ2M0AADwa/lJuHQHz6Er6J0bzacE2DNQ8ED9pvuhvkmf9JrcfXkPRPaBvnqv5Pkd+8sljtnY28Ui5ErbXjfVcjm5LP/Crlx18G4bZto+AUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(85182001)(66556008)(66946007)(66476007)(5660300002)(6496006)(956004)(82960400001)(508600001)(186003)(86362001)(6916009)(2906002)(9686003)(26005)(316002)(54906003)(83380400001)(4326008)(38100700002)(6666004)(6486002)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE5Ob012QVgrb2x1cHBhQVZYaGFIKzRaeVJVcEVWbjNudU93VXRKZXhzWUx5?=
 =?utf-8?B?T0lGZnlzWEl2WjZjazk5cWxjSDZMd0F1eWlJUEZkMHJKRHpRZHpQcnMzajlM?=
 =?utf-8?B?Z1lobkxFamg3Ync3dlhtcTE2c1pCNTlyaFczVmtxYWpId1N2a3d5SkFyWE9V?=
 =?utf-8?B?MHo3NFNGZzU0UldmcmdvV3k0WWg3R2xYMVR1SUxtMzBLUTlVQ041amFJMnNG?=
 =?utf-8?B?dDN2c0FmTS9UbFdCY0o2N1pYd2JnZXJMclpadVQ2N0RNRDgrZ1M2ejJhOGtu?=
 =?utf-8?B?ZXBFU3NVNE5YNGtNYXhWV3hqYVZEQk5jSlFPRE1XWUgvZWZ5RnU0QmM1OUhm?=
 =?utf-8?B?d1ZIUEIxc1ZxZkdaLzRxY1hGY3RQcVlCRHdZcjdUZStBWXN1My9pTm45ejVE?=
 =?utf-8?B?Y0lSRHRlVkdjdVRwQTRkazcxWGVrMWlDelAxWDdsNDU5cGdOaW5NS2JtZlRm?=
 =?utf-8?B?NWlSWFZlajFGQVhkZlR4ejJNQzlNd3VrdkJjdEVxWW5UTVpoMnRHL21MM24r?=
 =?utf-8?B?NXpTTFdEWUcydXk1WVFZcWR6TW4weVcyRFQ1RnFzZ3FpV0lRUndZRWJQUDhp?=
 =?utf-8?B?Q0gxdnByazlDaTJheVQ2UVN5ZHBOQ0VQbHAwVmZ1ayttZW95c1dlV1ZYOTVE?=
 =?utf-8?B?aEx4TlJLVW4vK0RyK3AzRitiTEhkZlVxNU1yVmtvcW93V3haNjk3MkZFVFNP?=
 =?utf-8?B?U1M0dWZsZno0ZjdvcHA4WmgvNHBIZVpZemg0WVhSQ3l4S3ZOaTNCaE5oQVEv?=
 =?utf-8?B?TkRyTmllZVlmb1E2TnZOWmtuTkpPVGJZWllvUHdHZldnd0ZCT0VFbFRoNUJk?=
 =?utf-8?B?dWMwUko1V2h2Vm1hcTd6ZFJPZk55d2J0WlFGbEh0K1I2TWc2dGVPTSszTFlP?=
 =?utf-8?B?U1lPZ01DNTZucVo3ZFVnSEFjNERBRHh5SGFiM1RBMDlEOGI0N1JWSldSUUpX?=
 =?utf-8?B?eis4L2JYNWExV3VYLzhxd3B4ZFN2S3gyK3JjZVJwNUdoVUVFSkJFYXFSL0E5?=
 =?utf-8?B?SSszRFVNc3R0Tis3OGcvYWVKQ3NwN0JqTlJKNEJraVFTVkpsUUxCb2JwTCtG?=
 =?utf-8?B?b2VpTlMzcXVnVjVDWjRDbnltS0NveHdJM3dac1FXbnNQZFZPS09Nd2ErYVlm?=
 =?utf-8?B?MlU3dFVxV2xnb2RVdXk5TGpTUE1IWlFVVFBPalBlNnJ0MllBMmNjYXRmZE1L?=
 =?utf-8?B?MWdiTjJVaEFqWmdscDhpRTRHUi9waG5GL0tUaTBZRmhNSWhoMFkxZXAwWDhk?=
 =?utf-8?B?c0J0STkrNlRJV29na2NGNHJ5bnIvWUg3VDkrRWk0SjI0UFZnaFZDY2RaU3Fa?=
 =?utf-8?B?Um1EZlNJNDMyN2M2R2Z3dE1PdUdBYUpvdEZhRElsWHBRYWIrYkROOVI1endw?=
 =?utf-8?B?RGJhUzNVVVZVNE5taCtqUUdrWEdhYjlHcytTVmU5WXlic2E1eU5TN2RnVVE5?=
 =?utf-8?B?VUllWHRKL3JoQVBvRGZEa3ZXWngxODY0REltR1htSzZQZ0k2SisyRWVYMUxy?=
 =?utf-8?B?bk1HMmNvYUE3L3psTWxNSzE2OW1QQWtHMXVZeUFZRkkyc01NQmFLbWcxVVFC?=
 =?utf-8?B?bllCdUc4em9oK0VGUVlBaHNGS1R6RVdXK1puME56K3NTQWVzK3VCZEUwRm5G?=
 =?utf-8?B?VnBBQVRiZG1jR21uKzdwaDBGV2xTOUF4UUo4Qk00MUpqNWN5RUtpU204YjVl?=
 =?utf-8?B?S0hORkNWZFJ1NTA2aDNzTHoxWG1uUEpTaWJMaUZaMm1IUk9mbi9MZzJYUnQy?=
 =?utf-8?Q?YqtZeKtRaMwpUXjydV+ywIfse7hdQk9pnej9WQd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8561a73e-9e91-4908-eeef-08d992417b0d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 14:13:38.6816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FJIjIZP0LI1WgSnunRckaVe7KXgOETpXgaPyY+jC1H3qsgoqJZypIU1z76AUvP/gI/xqu693Rg0+n1J/7KO0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3210
X-OriginatorOrg: citrix.com

On Wed, Sep 29, 2021 at 11:42:34AM +0200, Jan Beulich wrote:
> The conversion to __get_guest() failed to account for the fact that for
> remote vCPU-s dumping gets done through a pointer obtained from
> map_domain_page(): __get_guest() arranges for (apparent) accesses to
> hypervisor space to cause #GP(0).
> 
> Fixes: 6a1d72d3739e ('x86: split __{get,put}_user() into "guest" and "unsafe" variants')
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Using get_unsafe() might be an option as well, instead of the added
> extra conditional.

A third option might be to place them in a non Xen private VA range,
like we do for the compat argument translation. That's however too
much IMO.

> 
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -275,7 +275,9 @@ static void compat_show_guest_stack(stru
>      {
>          if ( (((long)stack - 1) ^ ((long)(stack + 1) - 1)) & mask )
>              break;
> -        if ( __get_guest(addr, stack) )
> +        if ( stack_page )
> +            addr = *stack;
> +        else if ( __get_guest(addr, stack) )
>          {
>              if ( i != 0 )
>                  printk("\n    ");
> @@ -344,7 +346,9 @@ static void show_guest_stack(struct vcpu
>      {
>          if ( (((long)stack - 1) ^ ((long)(stack + 1) - 1)) & mask )
>              break;
> -        if ( __get_guest(addr, stack) )
> +        if ( stack_page )
> +            addr = *stack;

I don't really have a strong opinion regarding this or the usage of
get_unsafe. When v == current we have the extra protection of being
sure no private Xen mappings are accessed, but that's only for a
single vCPU at most, at which point we might just use get_unsafe
uniformly. I guess I have a slight preference for get_unsafe because
using get_guest doesn't really get us anything.

If you keep it in the current form, or decide to switch to
get_unsafe:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

