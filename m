Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF06E9221
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:08:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524023.814551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppS9P-0003HC-5e; Thu, 20 Apr 2023 11:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524023.814551; Thu, 20 Apr 2023 11:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppS9P-0003Ec-2q; Thu, 20 Apr 2023 11:08:31 +0000
Received: by outflank-mailman (input) for mailman id 524023;
 Thu, 20 Apr 2023 11:08:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JtFG=AL=citrix.com=prvs=4670f3580=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ppS9O-0003EW-5H
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:08:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acdfe25b-df6b-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 13:08:28 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2023 07:08:26 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5520.namprd03.prod.outlook.com (2603:10b6:a03:282::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 11:08:24 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Thu, 20 Apr 2023
 11:08:24 +0000
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
X-Inumbo-ID: acdfe25b-df6b-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681988908;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YgEzoChlIHWl5PCA8ukSD9zeZqs27v1RNPO4uWiJ/qQ=;
  b=EXwicNGAUn/VjYU9iQRbbMxv4PD0QgXez0MB+NzoevBvNDr1D3HooNi+
   Yl9JhvdXTpYfuyiGCHTWef7Ppl/hGSXvtVo0DcMsVw0HwPZ53Woxdr8FM
   KWfMcPtAYfTAppEodQBIb8QotCDQxITdol0lGgAmQUSO4iY3EWlUes5d9
   4=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 106264113
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4A4WZ6ClptqNVRVW/wviw5YqxClBgxIJ4kV8jS/XYbTApGsr3mECz
 mAeWWmCPamPYGOhLdF/O9ni/U9Su8LUnII1QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9C5gRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwx7gwCjpB1
 fkkDRczc0iYotKE34mrVbw57igjBJGD0II3nFhFlGmcKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+Oxuuzm7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqiz22LOWxHiTtIQ6DpS51fVvjVyp+y83VUAsTVKlmuLglRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/vrGDhuvbu9WX+bsLCOoluP1TM9KGYDYWoBUlED6ty6+IUr1EuXH5BkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPeRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:9L1Gu6/2Ke8JeG7/lpRuk+DnI+orL9Y04lQ7vn2ZhyYlC/Bw9v
 re5MjzsCWftN9/YgBEpTntAtjjfZqYz+8X3WBzB9aftWvdyQ+VxehZhOOI/9SjIU3DH4VmpM
 BdmsZFebvN5JtB4foSIjPULz/t+ra6GWmT69vj8w==
X-Talos-CUID: =?us-ascii?q?9a23=3AB1Rrw2nmKasU9bWa6Q5WmwSWQVrXOUCDi3yLLG+?=
 =?us-ascii?q?9NUNOdqDNUnqgyrxfg9U7zg=3D=3D?=
X-Talos-MUID: 9a23:okxf5AUE2GIMAzbq/CXFhRJpMcpp2ZntLB1Qq40PpfKfbDMlbg==
X-IronPort-AV: E=Sophos;i="5.99,212,1677560400"; 
   d="scan'208";a="106264113"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqF6gwSBTmvJl9eEWzeH2buzfUhhsL7oPgjxerSB4Y0pMaHv2BoUrRYwwEgnI81dv0FRWMA1Sq4/nTC4OZEQJTioXbEHfAB6FIvTR2/9WI3/FnMnYqEORle07rkSN4Rut11R/73DsGBjuq/hZrdnWzdv22+wDybpZHpIfktc9vLd/KfkOi8WmsXwo6R/kOAf3KpJG30y/mx0Mvmb0ZX1Jx8Flyt9t4gxW4HyE1xDW86sCQhjdiN86CrbvNbRjBMGIyZKooF9tULDlYGVMoJueN2FG/49csuOioLwb43CghbZ4WLqSmMBksKGmJp/n4Yzc+/wFAL106i6oC/BI2nsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRqCU4EAavlft/I/NT6IwiF4Ze+Fd1tEXZgv8kJkg38=;
 b=Qmw4uOgFUBnqHHv6Quiv0wblEnaSJXZlWLxSdLJQnw9lY8tTvqEMvyIErImK2Q8BJiTv00FgUr4xJKTYEFdAVUK0x5krNYKGaWjMD75JhujnH6AoM4EMRxckZ3qUH+27qxWUx9ofvrUyFQ8HYj2aVy7QoIjp0DcS1viPE2Q+XtOaJbZIjyY7Vk1gOIWUtI2qrfKyhOQAKtIsZj9Zr29tbGGAbnf5UOLy4SRrOjC/Cm1V3iU1r+uy7UhloVUlB6AJplBOqcCMOG55TX4XHTtZEWjLCAKzDJrEbaT/INJ1i61WTCkoOms6X+Q+MqtsBeJJj6m9DwA60e/nJJGmTQZMqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRqCU4EAavlft/I/NT6IwiF4Ze+Fd1tEXZgv8kJkg38=;
 b=CMYcPWlFF8r0MKpqozmwl8RKofg4nFyWJb3kDb+YZq06i53lrBtKMPC9Kxr8qpfjVpfGEHBQ+YTybUTMbwc8VBZzRGZQxL0J86bUqht5eauoYOuhjQIGeRDJVBYD+us7Mz8+puPwu6/PpLMnBbZghZwVDlukmau4fa6iwc4CeSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 20 Apr 2023 13:08:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: Re: Removing armhf boxes again (was: Re: HEADS UP: re-adding the
 armhf boxes to osstest)
Message-ID: <ZEEdIzlMLZEj2PEv@Air-de-Roger>
References: <ZDkmu0mgy23ypaL7@Air-de-Roger>
 <92e6ea3e-a381-a77e-f909-bf65d009647f@suse.com>
 <ZD0fbNMqT7tMZVAq@Air-de-Roger>
 <ZD/Vy1HAhvvr2tPM@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZD/Vy1HAhvvr2tPM@Air-de-Roger>
X-ClientProxiedBy: LO2P265CA0500.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5520:EE_
X-MS-Office365-Filtering-Correlation-Id: 434054d1-7636-401c-1593-08db418f8f33
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nowy3E2ht71UVSMY/O9ijB7Nm5nDxxjcB4ZCCvRfp0uVXkg/zq6SHO6DqBghvKoVQFiUgigfGZyGBcjnrjtQUdag5hHFEFfIocXBFiQG9pBs0Y7GgBIM0qx13IVdroSwj0pa92uOP5bkedTT2uo8CW/o46NArek0343A58h625T1MC57fkWOEGphxSOwDEGqO6svhzOMT8TZ1XsKAnWfArolpEKcXHri7zPDRtZEpDnm+kZQ+TXUPuVOdnqqGeF1kvq4wBXrs5cxYSKFFKWFat5f3jQE1QsnhjeUybgmwH6NcEb3PrZwjsVfwSKtJ91DiBXwgK0lFczVuJat+dVN1Ottsn+WNoFjsGZE6SF39KxmkvdL2M/c1vSrtaUgoGI5BnEvxYN+kbKzMZaigdGAofkh9knWxB/KzW7zSGHNtSGm9h1A0OTpRb1FtScaUJXwopQ01Lb+PIeXKipxMJq1CZ+fvm6+U2O6chfkcsoz8WayvFsEo1nwe7aqCh9F8Y2ZQmhbywipjYDz7cZI3QffAHcEsFuHWDhGtP5cxmNoGajeDS5pE6AkZPyw4Rsm8JfR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199021)(82960400001)(38100700002)(26005)(186003)(6506007)(6512007)(9686003)(5660300002)(2906002)(4744005)(8676002)(8936002)(85182001)(478600001)(54906003)(86362001)(6486002)(6666004)(66556008)(66946007)(66476007)(41300700001)(6916009)(316002)(4326008)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjVwQWR0OWppZ05veitzUEhUbEdUa0ZTcFgxMTRKeW12SEpOVWxBMU5NcDBW?=
 =?utf-8?B?Z3NQbC9ScUM3emtjSmxqYmJ0b0N1NnRKVWdORDhTM0dkcDAvOTh0WmtaSlJk?=
 =?utf-8?B?ampqMHptRjd5NTdtUTVXRHMveHk4UnJGL0NZL0llOXZtRWR4NXZOUUYzZ05k?=
 =?utf-8?B?N0Y4bEpsRkMxdXhxQm1GOWhRNnpFdDVScFBEaE44OE5uOWxNQmY4czVVM05i?=
 =?utf-8?B?Z25kODZISm9JbzJDekdQSGs3OXRkeWk1cE51bGlIYTErRGNSZWJ0eEhnZ3lj?=
 =?utf-8?B?eUhGQmlMQTFZUHhheCtvdFJoNUVtVDY2NVA3T093eStuVXJrZXlaZ2R3QmZj?=
 =?utf-8?B?Q2F5WCtWYVJ4L2JqTTViM3lXR2NYL3J1S0FxNzdCNUxQY0xZL2gzWGlzR2VV?=
 =?utf-8?B?UkJjRTA4emhDK2lNS216R0ZweHVNVVk5MmEycWlpT0wzZ0R1Rk9UaFZIM3ZF?=
 =?utf-8?B?MGsraGc3VHJQZEdwWkJsQUxKMWlqaEMrakhBRHlSbjVPSytDRjhuS2dVcWdu?=
 =?utf-8?B?YW40d2NydHpmWEdteFhYZGJuOFJaZ2h1Q01saWNlVERnWnhYMWtsZWdwQVZS?=
 =?utf-8?B?RG1acnFFRXBPU1BTRW9SemcrV2wzYzhSdHIweWt2aTNRWmNHVEtHVmF2K1o0?=
 =?utf-8?B?eGcyRnBrOGxTL2xibEIwOTg4Sk1JazErOVNZZVJyNVgyVEd2UlJicU9EQzBo?=
 =?utf-8?B?d25lNk9taW13bXJRQXdlWmRGTndRcGhXWUhRR05MU1hnR2I3Slo0SG5PV3J3?=
 =?utf-8?B?WTAxZEMwWkZIUnR3Vis1U1ZNTFBWa3FSZ216cFhqc2pTSVEzVVF1RTlwUHBy?=
 =?utf-8?B?cDNmM0VpUzJSVkI0aGR5Ykwxb2VCc1lnRENBeGRlOCt6OUZMcC9WZm9iRE5F?=
 =?utf-8?B?ZjdQSGdTMndmdmpNT29haVBDS05pc0pEYW9QNVBoQUtIZndXSW13c09GNkhO?=
 =?utf-8?B?NG5oUVlJZW1KcW1GWUorempRYzJPSW1ySnVyQjlNc3dHUW9EaEtpaGhURnIz?=
 =?utf-8?B?Z0xsNHhaS3dmNDEwM2FBRExSVEt5T2ozM2w0YjY5WUVIRWFoNlJrbUF4Tldk?=
 =?utf-8?B?Y0FDWG1EZHJSWGluTTlKRFBuQnYraFE3QmpBZUE4YlZabEF4K0VBckVOU09l?=
 =?utf-8?B?dWIwai9FUUdlWTdzdVhHdkZlcjZlYUcwWVQzS1Mxb2pKaERQOGNGYWxTdjJm?=
 =?utf-8?B?ZXBHZ0pxQ1FZd01GY0YybDRzSHd2dUhjc2FkSEo5Qi95bldHc2NmQkNVcGlm?=
 =?utf-8?B?ZDFwRU9HM3NUQ1llMTRKaVBuTWpKMGh0YzFCTkdYM3NqTHdGVXRDWTN3dDZT?=
 =?utf-8?B?dVVRZmVLUkNpZGZYU3NUeHlXbDdYdkwxU3dQemtUb0ltT0FJK2RuUERKT3du?=
 =?utf-8?B?a01vNS9mbUk4WGlyNVNnOEFJY3hXM3VRYVNsc1MyUmhmYTAwanhHbWRweGJE?=
 =?utf-8?B?TGNoMytEVHI4Rm5LM0ZMSWU2blRsZUM2S0VOQ3BUcm51eGlKS2FXdlcybDM5?=
 =?utf-8?B?aGVNdWRITWZQdU9NSlBScHJHcFIzUHVuYjRqVGdqb3NBbmRibzBESEpQMkxZ?=
 =?utf-8?B?eVJVMUIvTlRuQXlrcnRDazQwa1hxSVBLQTdBUkEvdTFUM2VsVW5iT1pSSEJj?=
 =?utf-8?B?M2dBRTdOMjFPdk1ZZ2Zza3VlRXhkWURJU2tETW9odGZsMjE2ZUlVZDFpZmpP?=
 =?utf-8?B?bHN0aDZBNlpLZjI1UHZzQTVYcXVCUVNMRUhFaEV4YlI3OGFXQmdnUEdpRkht?=
 =?utf-8?B?Q1AvUlhYcG5tMExTbmtHMENGMzBnYWJ5T3BKVlg5YTd4T1NVMm1SVFVES3ZH?=
 =?utf-8?B?di9rR3BPcWZoajMrZ1BvcG5SSjFSYW53bzNtVmZuOGs0T0c3MWZMdnh6c1ZO?=
 =?utf-8?B?NDJUY01majVGeE56S081ajZrQlVPQmMzaDc5YmZyaUVXVGlZbzlxZGdxd1ox?=
 =?utf-8?B?YVJ3c1N5R3IveGJmcGV1azBRbnoyNzBvems2QmxWOEVsVVREazFlYXFBcjlR?=
 =?utf-8?B?bm1NYlpoTkVRSEREaDNmWEtCMmZoblZzT0lUYkZPWEJicTlTcEE0M3R0czBY?=
 =?utf-8?B?dHdiZDI5N05LTlIzTGpudEJ5cEhPcm5oYWMvUXhndXo2d3luUmt5amlmbmp2?=
 =?utf-8?Q?upvaeA9SmvHsAwhX9iNfbfPWx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	djIYO5JN+AvoJLmcRNoCLyYqiexbkMctXDa5BWzZeIKVmiQd7aK2LUDAKEfqCgbBpLBAb8l7JvhOKjSbeY2PPE/LXk7VOSvgmD2F/gyzqFEKhWhVVjoQngfY2YNXOb5//0W1RYD0ueYO73+4d5icxIiDfIBWT+ehG8v3MEZwdn0xl09PGNA62ksYbDkmcRrEJ3/Ohf/fK9+P3QY7Y8fk85RCX/U6OAvxayyyCWmRSBNGPJuwAjuKWR8k1bbJfkmgJkGUiZcU1PdrN0HIzc1gNFTKXl8L7tFuzWshyIBasJ3sZ2e/U/FgPfZyNUb1X7tvT3WLx1QlX4nCF4bkMUNZaej88/a3ix+Or+7kRyeLLIaAJ7kbErDEjCkmoPhA0eNL81njyFwj5WhmMTg5Zu72ubSxh5vEpa/JLOL/onvQ1XvA+h8pqH23tTu4mAqNWPj1psPjYLJKGQWnVZ+z+xC1KMd2DAUyidYgY3yfmnGHiiUDOyiA4W/qLMp7gBSv0ldgGu29YvIrd6Wtw+X8XbXpm/YE6m1fPj/1mg0GJbuQgOR67Oxv9d3H98KlAS3O2w9Jsfiz/M2GV4XCvEDBSwcXimehuQLJryt1aThJ0xUYSr9qtwvaSzr8DxpplT9FE3JGQoBMo68Y8OOb4wX7hhw8OsV8dhV9Udn7TUSgp28tv1m1XaIA3aSOU+7tzVu+j1uCLmWJlUZu2PMZHYmN99+++NVUylC0mfPxq/Nxkd4kHVOVPfcn1ABpH5XD6BDdBufUzYsh9uPrLPBRPSbGPstdHTUAyenV41AVjllMEp3mYgV0tqbMA53fu/fBLYP2DKq0n0eWq/6hAtk8W2p1xhXXRQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434054d1-7636-401c-1593-08db418f8f33
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 11:08:24.4120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GC0RQVtpdN/ZApGaoH9Dsnu2gxJHBZAXTS68MKxhf+hpSQMhH4p/fWZfw1/7QrsowtsLbzi736nQPK7KsEfeqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5520

On Wed, Apr 19, 2023 at 01:51:39PM +0200, Roger Pau Monné wrote:
> I'm afraid the serial output doesn't work on any of the Cubietruck
> boxes, so I had to unbless all of them (because the arndales are not
> suitable builders).
> 
> Have already contacted Credativ to further investigate.

In the meantime I think we can workaround the issue by using the
cubietrucks only for builds: that should prevent them getting picked up
for examine flights also.

I've removed the purpose-test flag from the cubietrucks and blessed
then again.  That however leaves us with just 3 armhf boxes for
running the tests, because arndale-bluewater is busted.

Roger.

