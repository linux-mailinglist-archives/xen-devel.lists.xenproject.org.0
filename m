Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F43053A598
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 15:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340455.565494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwNx5-0007EX-2X; Wed, 01 Jun 2022 12:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340455.565494; Wed, 01 Jun 2022 12:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwNx4-0007CP-VH; Wed, 01 Jun 2022 12:59:54 +0000
Received: by outflank-mailman (input) for mailman id 340455;
 Wed, 01 Jun 2022 12:59:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s3TG=WI=citrix.com=prvs=1441e74d4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nwNx2-0007CJ-Ub
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 12:59:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7bea98d-e1aa-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 14:59:50 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2022 08:59:47 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB2605.namprd03.prod.outlook.com (2603:10b6:300:45::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 12:59:46 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 12:59:46 +0000
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
X-Inumbo-ID: b7bea98d-e1aa-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654088390;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XaA/2JXQEhqeOari9K2fkP7CDvveixfTMqwLMj7bDfw=;
  b=AsuxFfXylX4k3Fd9LynTTX0uhhzF6/VAqNuqF1vUTAmhJU6ISqJ7EMJc
   l8vP4sxbclEfvgzKu/wuQUQ5GrSk+6Yem32tEnJaOiHEaGVj2zjEwuEiQ
   nS00fMK1RkfBCS49Za/cF+cG1Ry4DizgzDaKIr66UhSgoTs6L1/rHtJiZ
   I=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 73016131
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rO/ZEa6qc4KV+cnOiyBi5wxRtE7GchMFZxGqfqrLsTDasY5as4F+v
 mBMCD3UaKmJM2qne9skOtu/9UhTsZKBmIRlQAdlryBkHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YbhWlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSrTAV3FaaXkt1BbChpSQ5gYaIX9+T+dC3XXcy7lyUqclPK6tA3VAQTAtdd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YAhV/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2ID8AvL/PFui4TV5DEq/7nhLIfoQd2XQNVNh1yVq
 Xvl9l2sV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVRxSlpFaUsxhaXMBfe9DW8ymIw6vQpgOGXG4NS2cZbMR87ZdvAzs3y
 lWOgtXlQyR1t6GYQm6c8bHSqi6uPS8SLikJYipsoRY53uQPabob1nrnJuuP2obs5jEpMVkcG
 wy3kRU=
IronPort-HdrOrdr: A9a23:Ls3T866QCYJ52TeMmwPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.91,268,1647316800"; 
   d="scan'208";a="73016131"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZpjufRkNgGIGdMpD86xdQQXouRInUawS4USN5lIzhbhbazmdNNxayND/qmKikFs/I+71kb29eTwxJixgntP6cB1G4r6ep3Wd0RHGTOF0V5KrOaZJRRIP5QVOnyWB14UuqffYccBNYoLWxT+CeDBAFaMeyjlip7OxQIEoyoojbaaFSfLI6rrvp1HTBz4u+oHBWQpG6ExA4bHtbF5blePOxZfHItr/aESa2H00Hq2I375nuCfN+YGp9VhCWx+3DxLemKmf792QCMmBS72pn9q9BUb9twVidtCEkbpWq5NZFt0hnOh5Xq+Kt/rHilWbedFKCqQD/oRrgv91q/PRsk2RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cViLunhqObzyKNJgTwhVg0ziWpgrhYPJVsTu9Ioa790=;
 b=i4ZSWsnai6R2KYFK1pCz/SL4HGKH8H9A4A37Sqepo0esKu1PXP5u3nkowbaSl0SF2ufjZt4DsbUbXHHwa11gA9CTbFdAiF7UyMH+0Iq84jIdQXu5gqFsG9wFFdkIsIm8G9JE6Khrx27fknwayQXhQyVmhOyfw7yLLISn7wuQx1RfBk5HRUokedcqkCIYzND9Y/dA0E9aPDQn8pxmqfHvB/V4CNzHGO6vLzficExk4hPYHQ4bZv0JDYm0fwcsWJVlETMUGT7/PoFG7LMVvuCF9JET/JJa+70SPd/7Aq6Lr0g0wKar8srmbTZ0Udl83E36LiZrRCqQAJqO6dODlGIIPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cViLunhqObzyKNJgTwhVg0ziWpgrhYPJVsTu9Ioa790=;
 b=A78anne/3oqgSuuNs71iFGceI02YjQprJY5TFvlVSxHBaFqzluxAfzwrq0mTuPcjUh0f57EI0sPtvxvH4M0utBSxqTgLuTer4iRHO0Cf9qXc9Rce4abzrZTzdFFfM2Z9DArLu2apAP5wU2GC4mKcnynnhWpOa8/pp9hE2CfODOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 1 Jun 2022 14:59:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 08/15] IOMMU/x86: prefill newly allocate page tables
Message-ID: <YpdivYC3MlpYPBLB@Air-de-Roger>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <1df469a9-ddf2-2036-105a-f303f0554f06@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1df469a9-ddf2-2036-105a-f303f0554f06@suse.com>
X-ClientProxiedBy: LO4P265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67b4752d-ca42-421c-806e-08da43ce9aac
X-MS-TrafficTypeDiagnostic: MWHPR03MB2605:EE_
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB2605CCB5DD2451A9CF4920D28FDF9@MWHPR03MB2605.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ASwMuSkBKv5v16HPGq2n7lYoZ7GdnYz2HvowqBzg2xQjRPCt8zW7MBw+4SjzEGavhyxx3j5FCoh/3lTdT6m40y8QADgoKwBudNpKEOffv4COTfVUe5qdRN4lBwrm0nd+ZZFDiRP0FXxnTZQjDddFTshJPPWscQ2gbjl7wR/HA6DOOW08GN+etsrTdu/64dms/jLk/noGSLwR5OlFdhi2XJxQPIaVGdqdJ83NSdOgphz6IkCXjAW6kUiwKRHtuU7WXVhRqE0Sv+VoFE1qm6oXP0J3B/EWFCnc8rTkGXF5IPpPASPpdv5eurPc565loGSGOhfpey9l3CdZjVX77ER9yPUjkVEcaOTcj8f4rlDOF5qhi4YPqbW7W97gwQ2cpG1r4d8o5srcNf8FsIKaLhv+35OF0nU6EAESTkD08vvFb+IY+HOqxaBan9HhDDp1lH722iizLS3i/XspkOx+TU9+DaRs12sWxt1nb0A1YYFFL61HNTGR4aG7JUiOq1jksFS+XvIzYQOItbAX2o/SD3XQH1OH2StX9Pt1KnZrdeYaN9J5nKu9ypp2SgwE0kezmNFO/pi5F/fp8xIuX29WkvIdSljIF73JICFm9Ho5zBE4SC5ASjzs5Cri7/XwbDVtF7cbLI9b6sKQHDB+1JIJHg9XjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6512007)(33716001)(9686003)(6486002)(66476007)(316002)(26005)(8676002)(82960400001)(4326008)(6666004)(54906003)(6506007)(6916009)(86362001)(83380400001)(186003)(66946007)(66556008)(508600001)(2906002)(8936002)(5660300002)(38100700002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXQydFZDTHJxQ2JTZ2NnTGRQaVNYcmtOSVpMVGNtU1dhWEkxcHZmNFdnazJh?=
 =?utf-8?B?U1NpelZRaFJoUExKU1dWZ3I2TjQyK0NyQ1lHU2ZDN3kyYkRabnNIR2cyb1Jm?=
 =?utf-8?B?K1QxaEkyVXBPNUszL2d6VTc2TTM1SVh4bHNhR2NQS3AzV0Z3TVYrWDNWUFBz?=
 =?utf-8?B?YWtpMFJjUS81SVYwZkw5V1Bxa01BT0wwZkoyems5UlR6WW5qTTBtRjlwUkVz?=
 =?utf-8?B?YWhKU0E5bDJ3ZzRIVFVSZ0psMytBdUVpUzN5c3Fyd0RiSzhlZ1I0SCtXOFhE?=
 =?utf-8?B?SWRTbUlTVFh0ZURLczV5RGVnSzRlRzZScXdWSnVRUmNsVm9iSFplVG0yRHpi?=
 =?utf-8?B?Y25NdDc5MzVlVEl5RlJvZHZJUklJM0pjWDIyOHlxMnFHZHVDNUFCSVlOU2k1?=
 =?utf-8?B?WXdaUFE3azJLNXRQUW12bmNtd1V3UTR5QWNNcUlBTzB6YisyRkpXZWdOWEx5?=
 =?utf-8?B?YVE2RjlkaTlKaTdRVm5ESGtPNGlPMUY0K2I1YjR2VE5Mc3lzdDVaVS9OTXVu?=
 =?utf-8?B?VnB5N29RYUdyMVR2SEJFZi9yV2xUWEtjUHo5bWdWaHhxZ3pPQzhNRytUTEQv?=
 =?utf-8?B?Y0VVOEdkS1BXN1ovUXBIeXRLVTlFYmlhOXJZU2lkZnpxUWJnSytiS29YSzFH?=
 =?utf-8?B?dXpCQlAxdXNhbDlqay84dytJNWJMOC90RUF0Smk5blBGYTdTUHllWHFvekR6?=
 =?utf-8?B?UFE0Ky9VdUdLWGNZWHdUUXgxanZwd0grQzBScEozcEllZkpWWHJrT2sybzhC?=
 =?utf-8?B?RVp1VlV3S1MzTS9lMHIwb0g2MWZ3aHNhNW9CVWU0eU0vSWJCT0Z5QXdUdVZC?=
 =?utf-8?B?VWlCenlFSktRRll6OUN2WTBRM2JnU2Jjd2pVMytmWlpNcE5XdG11MG1xYllq?=
 =?utf-8?B?TTF2WUJ5ZlpmbFM4TE40TjUwemdIWHRhU0Y5R0I4SklaWFB1L0dpVWJzaTNt?=
 =?utf-8?B?MFVLemtVcnl6Y0F2OXNvdlBGS3NiVVo5alBkK0VNLzUxZzdjODFBeUpLMkor?=
 =?utf-8?B?VWl3c0JzOXFraEVjalVQYkZjMUZXa3JFQ3RuUzlVRnpNK2lFMnpodmRCS2tu?=
 =?utf-8?B?S0l5akRMcGJmOUovUlNualNxSFR2QWFnZGpNRWN6OTFzMWt1NWlSRGlITlcv?=
 =?utf-8?B?U1B0NlJBM2hRUGpmNnJDMElISDFMUHhUSDhCOUJicGp6d2RZRjB2U3JrazQ0?=
 =?utf-8?B?Tnk2cktSbjRzWndVTFVGZnV6czEzcU9LRE5hUnc4SGVTbmRxM1I0aVBpL0xJ?=
 =?utf-8?B?bmV3WWVlR0cwOThzNmZiQ0RXQ0lnbzdXY1dKeVlUamRET3Z3OGxXanZTdzYx?=
 =?utf-8?B?c04vTnh1WDUxcUFNdnJLN2ppNXQyeG9GZVROWnhMakpVa3ByamNlUDFVeWFD?=
 =?utf-8?B?UUZ5ZXJmcWdVcG5wcmlDZ3B0YzFCcERMRzZPYmlmdmJteE9NeGYrcmN4NVBi?=
 =?utf-8?B?WVlIeGE1L2Y1b05mUjR6WjVjZ2FyZFRHMFVpL2x3UHg3MnoyYWM0RXJmUnJa?=
 =?utf-8?B?d3EreTdoOGRKNWZqQlRLeFpybWRiUlU5bkQ0TXBMcmdvWWs5QlorNk5GMGVR?=
 =?utf-8?B?SEsrTytPT3JMck5SSlBPaE96VXJnUm1xTUdrdTg1VmpzcjMvV0R3U1p0WDVJ?=
 =?utf-8?B?ejMvMW5uK3ltZDk2dHFHNDRtMC9zK2Y2YTJjN29GVUxyZGlkZVdYcmlaZms0?=
 =?utf-8?B?WHRZQm9oQjlKdGxOY21BeWpkMTluTTVQQUJ1eGRPYXJ4NGVBait6QWQ4SitZ?=
 =?utf-8?B?Um5GOFBnd3RLcGh0OUVwbUE2S2RGaVcrbS9sWTdjbXJNNjNoZlhwSC9KTW14?=
 =?utf-8?B?dHFEckFMamM0VHhmZG5BZkgwUmtxSWZ1QzZFM01YVUxlcnNSd3NtZzRTMFNN?=
 =?utf-8?B?RW5haDBjMHBaSmZqMllIcWtJSzk2QSs1SS90RDcrclB3VWNtd1I3SStOQU8y?=
 =?utf-8?B?QXN2N2c1NnRHdzlNQzNXMmtSK3VhYURiUlM3aWZXZzJrQXQ4TGNKVm43aGRj?=
 =?utf-8?B?WDhDeVRMVnRnUGdaRHhwejRpOXhDZWM3ZUdhc1VOM1RwbGJweEJ3Nk9xcGFh?=
 =?utf-8?B?NG9acDk5Qkdlbm5PdFRJMFhDM3BLOVpKMXFpUTV1YTBoVlFRWlpTeGNzZlJt?=
 =?utf-8?B?aVFoY0ZndjluckdpQ1Jsb3E2bVBRUWtXTzgxeDFKR1pUbWdKcXlpR0ZlMzhS?=
 =?utf-8?B?SStOay9taHlYNXpMYTZNYnM1OUVYUUJlb3FwaXNHWkFiVWFWTE1oeERFSTZL?=
 =?utf-8?B?am5MbGVNcXpNaVJ4MGpLMEJnMWRCcm1PT2c5aWhCWXBuWGF1Q2lWN3NZRTFZ?=
 =?utf-8?B?akhzRklQOURqYnE2eXN5QzRDQlNGR0dYeU9EcDA5a3RSVWU1ZElhbVRxRE5F?=
 =?utf-8?Q?FEadJqsWNtIs/gNo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b4752d-ca42-421c-806e-08da43ce9aac
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 12:59:46.4760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1uNBXv/TtOeRB146r0fl3WqBWfHeJXh8uo+MrNcnce019MD0Wsbq5dBOzZL5FixBBSYC2SBssrsBCyzREQ8LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2605

On Fri, May 27, 2022 at 01:17:35PM +0200, Jan Beulich wrote:
> Page tables are used for two purposes after allocation: They either
> start out all empty, or they are filled to replace a superpage.
> Subsequently, to replace all empty or fully contiguous page tables,
> contiguous sub-regions will be recorded within individual page tables.
> Install the initial set of markers immediately after allocation. Make
> sure to retain these markers when further populating a page table in
> preparation for it to replace a superpage.
> 
> The markers are simply 4-bit fields holding the order value of
> contiguous entries. To demonstrate this, if a page table had just 16
> entries, this would be the initial (fully contiguous) set of markers:
> 
> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
> 
> "Contiguous" here means not only present entries with successively
> increasing MFNs, each one suitably aligned for its slot, and identical
> attributes, but also a respective number of all non-present (zero except
> for the markers) entries.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -26,6 +26,7 @@
>  #include <asm/hvm/io.h>
>  #include <asm/io_apic.h>
>  #include <asm/mem_paging.h>
> +#include <asm/pt-contig-markers.h>
>  #include <asm/setup.h>
>  
>  const struct iommu_init_ops *__initdata iommu_init_ops;
> @@ -538,11 +539,12 @@ int iommu_free_pgtables(struct domain *d
>      return 0;
>  }
>  
> -struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd)
> +struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
> +                                      uint64_t contig_mask)
>  {
>      unsigned int memflags = 0;
>      struct page_info *pg;
> -    void *p;
> +    uint64_t *p;
>  
>  #ifdef CONFIG_NUMA
>      if ( hd->node != NUMA_NO_NODE )
> @@ -554,7 +556,29 @@ struct page_info *iommu_alloc_pgtable(st
>          return NULL;
>  
>      p = __map_domain_page(pg);
> -    clear_page(p);
> +
> +    if ( contig_mask )
> +    {
> +        /* See pt-contig-markers.h for a description of the marker scheme. */
> +        unsigned int i, shift = find_first_set_bit(contig_mask);
> +
> +        ASSERT((CONTIG_LEVEL_SHIFT & (contig_mask >> shift)) == CONTIG_LEVEL_SHIFT);
> +
> +        p[0] = (CONTIG_LEVEL_SHIFT + 0ull) << shift;
> +        p[1] = 0;
> +        p[2] = 1ull << shift;
> +        p[3] = 0;
> +
> +        for ( i = 4; i < PAGE_SIZE / 8; i += 4 )

FWIW, you could also use sizeof(*p) instead of hardcoding 8.

Thanks, Roger.

