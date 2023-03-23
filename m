Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD41B6C6B87
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 15:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513929.795695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfMGE-0004q9-Dr; Thu, 23 Mar 2023 14:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513929.795695; Thu, 23 Mar 2023 14:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfMGE-0004mm-As; Thu, 23 Mar 2023 14:49:50 +0000
Received: by outflank-mailman (input) for mailman id 513929;
 Thu, 23 Mar 2023 14:49:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIVP=7P=citrix.com=prvs=439b2ffc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pfMGD-0004mg-2q
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 14:49:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeac6272-c989-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 15:49:40 +0100 (CET)
Received: from mail-bn8nam04lp2048.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 10:49:40 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB4923.namprd03.prod.outlook.com (2603:10b6:5:1e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 14:49:38 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 14:49:37 +0000
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
X-Inumbo-ID: eeac6272-c989-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679582985;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MPrf/K2qhzRTopXcuGZ3HC69cpHwwtFewaOREgoYeHM=;
  b=CKGKgleTtePdlGb+ogW/sNfWsNErdbk789NyaAzmj2v1S5Bwaruj8EeG
   uYFRD592ZGCr1GQ3vL77+e4fB85za7/+Jd6Vp2kj5dEU/vZnePLyNb1e/
   KS80opARyB5gTQZhjqi1rVg/5O+qcEPU8w6X+5ThV8t63zReuIVcFkgCq
   Q=;
X-IronPort-RemoteIP: 104.47.74.48
X-IronPort-MID: 102045079
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Kk658q2IaGFCYuIZgvbD5eZwkn2cJEfYwER7XKvMYLTBsI5bpzRRz
 TEdC2zQa/zcajahLt52aInkpxgEu5CEmNA3HlY5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdkPqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfG19N2
 9EcJzM2LTvbvsS4kZKQUrFcmZF2RCXrFNt3VnBI6xj8Vapja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxovy6PnGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03LeTwHukCer+EpX//NIzr3iY3lY8DUBKSkOG+/S+pU2hDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSRmrbm9WX+bsLCOoluaJiw9PWIEIygeQmM4D8LLpYgyilfFSIZlGavt0tntQ2msk
 3aNsTQ0gKgVgYgTzaKn8FvbgjWq4J/UUgoy4QaRVWWghu9kWLOYi0WTwQCzxZ59wEyxFzFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:D2fAha40l58if0xlvwPXwO3XdLJyesId70hD6qkRc3xom6mj/P
 xG88506faZskd1ZJhCo7+90cu7IE80nKQdieN9UYtKOjOWwVdARLsSircK7AeQeREWndQtsZ
 uIHZIOcuHYPBxXitv7/Rn9M/tI+qj7zEji7d2uqUuFNjsaCJ2INj0JcjpzxHcGPzV7OQ==
X-IronPort-AV: E=Sophos;i="5.98,285,1673931600"; 
   d="scan'208";a="102045079"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDhtW/8zpi8ZGJM9K2/UP5aZhLf1cdpcdCmsgGgRdkqVq+wwE38+NBowoR0E6UH4a8GpBHTXffbWheZVPG5A2ZGEaYH3ZE6xLtNhH0Q3gztolfxbU286NJyavMQB8YFX/q+YuYeM5SnNJnFmul9uw2NioYCchT2rkK52uSa46U8NDbCAnRjLNheP404bZGgPdjfclJJ/KeUBYg963MijwHpIvsec9ir2CSBKC8GkWO+GxwEtky0RekKM0SYy/a7ACZzcj304KPJyCgEivIWiZ0LTj99VTaQO4v0am4FEKMXL1gCR//nDlgnnvo4mMS/aIJMXtI+SWUxfzrHPy8tRrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoFpvhH6IDtv89EdyFVOeBn1QWqAvwdIeixa0fpPFyM=;
 b=FlTbmUcrLDAVw4Ajv1wJtzIMUZOKCFMcgseL+yAE1o3zAwuAlc8M5iexB0uYnny+rlM7m1l3n4KwriEW+9D0kSvL8hH4ObMvdaAc3luoE79KUeZGLfHWvMv4/hxesMnh7vVNXwJVR2AuQXLd+DAQblkHVGkOx3YF7Hr3UL5pGH2++TiHKRCOGX652cSdZnyPNd7xXtmTYIQtvxldYTWDdgHFrF6iRhTAqCnanpkNEvzhep+jHDSuSUDQuVvH7t7iUScUCx/jJKJ21h0dC39kDO8QBlVed8wT/37nA9RDV04mLtE0DI+4om6y11DyJ1QdpnahEWZbXJASoW+9Zzk4SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoFpvhH6IDtv89EdyFVOeBn1QWqAvwdIeixa0fpPFyM=;
 b=McW33MS8JK+e4OVjcboMrsxNtsyWUH0ybSLfjYKl6Z7dFgClk5Kv8gbu5/j7uuFEpYStbvhc33LzxwuCVi1gBiyVYlHUEcv2H7MjKDy17k82l2DXs9ThPXjqE8WgIccCWqbotNB4wXtCnjcLIMtUuH21mi7A/bq9K+Ea/yRWsBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 23 Mar 2023 15:49:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Message-ID: <ZBxm+7/ldyHclXwc@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <367d0223-d481-b7a3-3b79-a9bc6f00531e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <367d0223-d481-b7a3-3b79-a9bc6f00531e@suse.com>
X-ClientProxiedBy: LO4P123CA0582.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: 97fea8ef-67b1-4112-9387-08db2badd330
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dUMFnRO9gtvDUzi+Y3M7lRBLEbgv+jpyW7KAC6TxGiCQXaL0mHWIFCvxokS1h9nZ2OwWF2fe51/cVsArD1Hx658A+uVEjci+GVBddvPx9beCEDcRkKiKHlsOqAkL4SERrqJdaj5+X/4IJYY4djn/kzWUMmCarhKGbEl85xPbWiIuvuNtL/JQPaQQEh0k3M8QUW/0DereIR1IqY9TTovRK4vu5uW4EzunVJ1KeT7xRTeYmAJ3GQEsEB/ZrOLdrcyLHGetBJ4w3QMHBZUiiC+2MjuSQzxs85tjtcCTQ0ktpBAVAAh/mlEOMBIGvuOVfJyzk5ZKoTBwMGvik+ft7dMkQ99r+868/CYzIBqHESh8QOcBkKq47AkuirjGsCbwSEkWEd37SRjfpHFADbzI3dJfpbM8qjhSpFDY8zmYb92/l/Vt3Ic5VBymvHuX9fPxWWt7i/rsgkDJXA7hyaX/IUV5x+amx5Dxyys36jxUHLrZ1IDa0tBH87qD+Drk5puxlyQlJPJxTCGW6NDcXV0N/csNqi6x36RZpK3QlbvXtiRGF5KNFpDOTKkhtVl76HwWh+WcRrd5O2SrOI23scsVsusZP2GQSik7bBjEWb3IBqLLWV4zfCxUWtC779Kk+XBMGzc8exx9TNdBB00BWe5LFcZtBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199018)(8936002)(66946007)(66556008)(66476007)(41300700001)(6916009)(4326008)(8676002)(86362001)(85182001)(38100700002)(26005)(9686003)(6512007)(6506007)(83380400001)(186003)(6666004)(316002)(478600001)(6486002)(54906003)(33716001)(82960400001)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWdzUjZsSk94cFN4bEdzL0Z6NWs0Rmg2TUFmSi9uUEZrRFVobW4xQ0NhaHlD?=
 =?utf-8?B?emw0c2hDSVU1eTdoZlBCZ2dDOGxqNW1ya2JQVkd1NHo3Q3psbjNvM2xUQzUw?=
 =?utf-8?B?SnRpamVINnBFaEN6STgvakRlRUJFVGNTVVBub2UzdUlLZ1N0RlJyNHEvTmFx?=
 =?utf-8?B?T0NxUHdKV2wwbTdEUFdoOE1id0JmUmk1bHpraG1Dc0pHbkJYVGRMRFhmQlRR?=
 =?utf-8?B?NU8rcFltK0V0MWl6Zkhmd0ZPMnFBMXpzOGRlSzFwcnZmSkwzeW9kQ3JBRVJt?=
 =?utf-8?B?ODJKRzNvMlViMGdHcTNzODdvWVo0bVFFZG94U0N4QUwyV3NPR0JMcW9PZ21R?=
 =?utf-8?B?RG1NWEZJRGp4ckc5ZGNUTjJHZmorMExWdExyYjBzVXVkZFpMeUx6clloTHFL?=
 =?utf-8?B?MWtnWlVHMmc1SU84aUh3dElrL2hJakV4Z0pHN0xTQ2NnSlF5UTRMYlJUdlVj?=
 =?utf-8?B?WmlIK0IvVUtGcTVoaUpmN1p6RzF1SFpFS2xyK0pmL0lYaUhRNStpSmxaMVNQ?=
 =?utf-8?B?Zy9iOHVQbmticEpwem1IZFIrVVpUQnk0N3NtZVFEUlpsYmNwYkkvcXJYeTU3?=
 =?utf-8?B?cHZkaFlCbkttNVJDMWlRWnN0UUNLbHBqVytvZXNGbXBqbDBWTWNSMXRyTURF?=
 =?utf-8?B?QmFYTVlqZ1A3RC9wUmxZUmNBbE9XcUs5TVc4dGxRZGo3RVBCaHh1QVZCSU9J?=
 =?utf-8?B?UDBKRE44YmxZWEhjMG9Xb05adGk3NUEyaHFETnhqbGVrcmEvOG1PSEpEUmIz?=
 =?utf-8?B?TmZGV0VXWjhLYllhV1dZTGNNYUh6ejVFaGhHaC8xaGl5a2E3MFpibzI4c0Ur?=
 =?utf-8?B?Q1BlWEwvMHZlU1NtTWJtS2ptN3lLbm5IZ2pBNzhaRXhkRXhqczllam5ORFoy?=
 =?utf-8?B?T2JxczZ6N2l1WFdFaUJXd1RGWXFDTE9KUUdCQWhJNnVEanptWmdjYVhTZ1Jv?=
 =?utf-8?B?eWtyNVlwNTR3SkJ2akZiZjhTeWdXeUtuck1kWnZsV1A1Q2RpN01Ma09ML2FI?=
 =?utf-8?B?N0lrRVFEYXNUNkpzdTkxblp2T2NsTXJLM2NuSmxEWjlrbUloelY4Um1ZbVNh?=
 =?utf-8?B?eU4rVEdoN2tMT2pQcDRrbWRjWk5rM1JrSW9EZ2ZaZTdrNE5XcG5qalkxN1ZK?=
 =?utf-8?B?RlkzUEEvaUpjVlczQVVrVFhpazlJdUR4RTFsQVZxUFdJRXBJQTRadjV4RnhW?=
 =?utf-8?B?eHd1SDJHU0tLZE5HaFplbzQ0REJRODRuMGR3T3ZNdmVveDJNNGFVY2ZiODZl?=
 =?utf-8?B?bGxYbUc2RkJ6em12OUZLWVg4TExUanB0R0p1UnFsZGR4bE5XVXpHOExGdGhT?=
 =?utf-8?B?dW5aUFFQRjlLNllCRzZBMTVXb1k5dTd6SUVUYVg1czFWL2VZUjJCem5pS3RZ?=
 =?utf-8?B?M0pLZDEyaXhrTDloS3R6TEllemZnTzBJZStCSWpUbTRqNFplZ0kyRXkwc2tH?=
 =?utf-8?B?Q0xtd1hQMEpIRVBNWCt5UHhJVmxZaWsveFpyNmF5OGFSbFVoL1NJblc5Mld1?=
 =?utf-8?B?OUE3V2k2WnhvY2VocmRDZTlYVFkyOS9MR2R0L1N2UHFsMXh0ZXlHc2J2bTZ5?=
 =?utf-8?B?R1A1YVFkV3kvcEhJN0hFakNDK0U3QmcrMWw3dEo2cUQ5UFNGN2pyeFgwYU4v?=
 =?utf-8?B?MG9mdllZaTRzd0s3ckJaU1lQVTgraVhkd0o5VWxtVVJHR1JYeXZHdEVlOSs4?=
 =?utf-8?B?N3ZiUzg5eXZ4R1R6dlF4bm1lRTYwdE9KWDV3Z0RwYXdCOUpYZTQrU2FYOWhO?=
 =?utf-8?B?TzhGY01lRklNcVRXcXFHOFJHVUxKS2FlN0ZDd0JCRnh5WGk1a3lzellPbFYw?=
 =?utf-8?B?czVOUTdFWnFJN0gyQVpvQ0RRVnhDejFnTUhXYmlWbWU3SHBiMTJBejlqOU15?=
 =?utf-8?B?Q0lFekF1UGtVb0xBb2FSTHpramFoc2lMcUhOc0c3S1dVUTRDN3hKeEtPYXpw?=
 =?utf-8?B?NVo4TUZDeUtMMjNDL1JMMXhyQ0lIK0lxbGlSWGh5MVNVam5TejFudnMzVWxv?=
 =?utf-8?B?NXpwZFVzam5xY3ZOVFhqWlNVYitSZXE5eTNzaFUwNGNvckJWOTNmN0wzVUVU?=
 =?utf-8?B?bzFRZHVGSjdxdU1IdjRuaEorOE1ISXhSOFhOK2FVQlY0RXpyRDBaK01pYitk?=
 =?utf-8?B?SVFHYUpNVnJYbGp2b3ErTUo3cFJWQ0RMbk1MYjRhZE9Fb3VIN1VVNWhnbFJt?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mXmLlr3/3Dhr8lZzaHma4n+GERbayTywVzlVM4/wQtROV+v9x6gJ5rgMei7A1Ls2RpTNL0RER4PIdKbpaA8TWbE1RU+Cy/bylcgVrCUA2Mx02FXF0pnZjAla/q0WkSIrDW6RmVGGUVgnQ3kp+8G/yV7VWQVGHlO9TxjpTIB7ddOO6CikM08GQD7t7ImtpkVr9IYN0uVKgzD/fM2X2Y04NHx6/lZEXxwOql6R23k4x+WOyEL98MkDlQp4pFY3Kgb7N0Trw2Q+xFw0T8gO71WNpzjKJlWVsrcsRZ8kAJ3pYxAwXfYzN9sMh/E9KVhTrvnEFCJNUwvekM0IMuBMvSbBmXQ5co/TYRkO9hM2sChh8eR1uaQQxt1wkbd0g34IqYPP/RylulGT1T/OXwgBf7DbR2+G1cpo8io79crbEKdWY5CQZZWEZDO1uofV3rsEJjE2sLQDQFCsmWTWUeIbNO8iOlY8Cj27O+mULgbu7mYwQKY8y/zv0Hp3f5uwARut0RBuj81pNVLcGNKN0ZZ9Z4EPGqxn1r+YZ+SqLWEQV07G6wgCXXeBzEL1r/t1l0rxziMQqvEFIJLHr2lJiDlNIM8zi1j1yE99uBxTbClweR733/h9AsJm1NWw5Cj6X1n5A3a5OdOqBg9Ul6PtCkhPWrAAaxU8GcPJJpnpyTavi9l6eFOcZgnSPvkQ+RdCvNzDdGBZRI42p1UBzrNutgUHmxZvyziijMwsBtvaRVHdEpywbY3kmLG5MqDHkELJrk4+N8LOQhC8WjGSZsqhEYpjnrKaE+liSxQjtqTdPmyw5A8rL5LoNF4EYcHKfSD2ppfux5KN
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97fea8ef-67b1-4112-9387-08db2badd330
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 14:49:37.8225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzwvA5FDzgEawmKTBNAUlmEbLMNeKnbW32ZH5hOsOks4iIwmMmUELDK5iNqSw2JfpLxzltzqWyuUG1Q1btwrhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4923

On Mon, Mar 20, 2023 at 09:32:26AM +0100, Jan Beulich wrote:
> ... in order to also intercept Dom0 accesses through the alias ports.
> 
> Also stop intercepting accesses to the CMOS ports if we won't ourselves
> use the CMOS RTC.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v4: Also conditionally mask top bit for guest index port accesses. Add
>     missing adjustments to rtc_init(). Re-work to avoid recursive
>     read_lock(). Also adjust guest_io_{read,write}(). Re-base.
> v3: Re-base over change to earlier patch.
> v2: Re-base.
> 
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -27,7 +27,7 @@
>  #include <asm/hvm/vpt.h>
>  #include <asm/hvm/io.h>
>  #include <asm/hvm/save.h>
> -#include <asm/current.h>
> +#include <asm/iocap.h>
>  #include <xen/trace.h>
>  #include <public/hvm/params.h>
>  
> @@ -836,10 +836,18 @@ void rtc_init(struct domain *d)
>  
>      if ( !has_vrtc(d) )
>      {
> -        if ( is_hardware_domain(d) )
> -            /* Hardware domain gets mediated access to the physical RTC. */
> -            register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
> -        return;
> +        unsigned int port;
> +
> +        if ( !is_hardware_domain(d) )
> +            return;
> +
> +        /*
> +         * Hardware domain gets mediated access to the physical RTC/CMOS
> +         * (of course unless we don't use it ourselves).
> +         */
> +        for ( port = RTC_PORT(0); port < RTC_PORT(0) + 0x10; port += 2 )
> +            if ( is_cmos_port(port, 2, d) )
> +                register_portio_handler(d, port, 2, hw_rtc_io);
>      }
>  
>      spin_lock_init(&s->lock);
> --- a/xen/arch/x86/include/asm/mc146818rtc.h
> +++ b/xen/arch/x86/include/asm/mc146818rtc.h
> @@ -9,6 +9,10 @@
>  
>  extern spinlock_t rtc_lock;             /* serialize CMOS RAM access */
>  
> +struct domain;
> +bool is_cmos_port(unsigned int port, unsigned int bytes,
> +                  const struct domain *d);

We seem to usually name this rtc rather than cmos, any reason to use
cmos for the helper naming rather than rtc?

If not I would rather use is_rtc_port(), so that we can keep it in
sync with the existing RTC_PORT() macros and the handler names
rtc_guest_{read,write}, hw_rtc_io.

> +
>  /**********************************************************************
>   * register summary
>   **********************************************************************/
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -220,7 +220,7 @@ static bool admin_io_okay(unsigned int p
>          return false;
>  
>      /* We also never permit direct access to the RTC/CMOS registers. */
> -    if ( port <= RTC_PORT(1) && port + bytes > RTC_PORT(0) )
> +    if ( is_cmos_port(port, bytes, d) )
>          return false;
>  
>      return ioports_access_permitted(d, port, port + bytes - 1);
> @@ -290,7 +290,7 @@ static uint32_t guest_io_read(unsigned i
>          {
>              sub_data = pv_pit_handler(port, 0, 0);
>          }
> -        else if ( port == RTC_PORT(0) || port == RTC_PORT(1) )
> +        else if ( is_cmos_port(port, 1, currd) )
>          {
>              sub_data = rtc_guest_read(port);
>          }
> @@ -436,7 +436,7 @@ static void guest_io_write(unsigned int
>          {
>              pv_pit_handler(port, (uint8_t)data, 1);
>          }
> -        else if ( port == RTC_PORT(0) || port == RTC_PORT(1) )
> +        else if ( is_cmos_port(port, 1, currd) )
>          {
>              rtc_guest_write(port, data);
>          }
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2072,37 +2072,36 @@ int __hwdom_init xen_in_range(unsigned l
>  static int __hwdom_init cf_check io_bitmap_cb(
>      unsigned long s, unsigned long e, void *ctx)
>  {
> -    struct domain *d = ctx;
> +    const struct domain *d = ctx;
>      unsigned int i;
>  
>      ASSERT(e <= INT_MAX);
>      for ( i = s; i <= e; i++ )
> -        __clear_bit(i, d->arch.hvm.io_bitmap);
> +        /*
> +         * Accesses to RTC ports also need to be trapped in order to keep
> +         * consistency with PV.
> +         */

More than to keep consistency with PV, don't we need to trap accesses
to that concurrent accesses between dom0 and Xen (when also using the
device) don't overlap, as the RTC/CMOS space uses indirect indexing.

And likely to avoid dom0 from disabling NMIs.

I see that you copied the existing comment, but not sure it's fully
accurate?

> +        if ( !is_cmos_port(i, 1, d) )
> +            __clear_bit(i, d->arch.hvm.io_bitmap);
>  
>      return 0;
>  }
>  
>  void __hwdom_init setup_io_bitmap(struct domain *d)
>  {
> -    int rc;
> +    if ( !is_hvm_domain(d) )
> +        return;
>  
> -    if ( is_hvm_domain(d) )
> -    {
> -        bitmap_fill(d->arch.hvm.io_bitmap, 0x10000);
> -        rc = rangeset_report_ranges(d->arch.ioport_caps, 0, 0x10000,
> -                                    io_bitmap_cb, d);
> -        BUG_ON(rc);
> -        /*
> -         * NB: we need to trap accesses to 0xcf8 in order to intercept
> -         * 4 byte accesses, that need to be handled by Xen in order to
> -         * keep consistency.
> -         * Access to 1 byte RTC ports also needs to be trapped in order
> -         * to keep consistency with PV.
> -         */
> -        __set_bit(0xcf8, d->arch.hvm.io_bitmap);
> -        __set_bit(RTC_PORT(0), d->arch.hvm.io_bitmap);
> -        __set_bit(RTC_PORT(1), d->arch.hvm.io_bitmap);
> -    }
> +    bitmap_fill(d->arch.hvm.io_bitmap, 0x10000);
> +    if ( rangeset_report_ranges(d->arch.ioport_caps, 0, 0x10000,
> +                                io_bitmap_cb, d) )
> +        BUG();
> +
> +    /*
> +     * We need to trap 4-byte accesses to 0xcf8 (see admin_io_okay(),
> +     * guest_io_read(), and guest_io_write()).
> +     */
> +    __set_bit(0xcf8, d->arch.hvm.io_bitmap);
>  }
>  
>  /*
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1234,7 +1234,10 @@ static unsigned long get_cmos_time(void)
>          if ( seconds < 60 )
>          {
>              if ( rtc.sec != seconds )
> +            {
>                  cmos_rtc_probe = false;
> +                acpi_gbl_FADT.boot_flags &= ~ACPI_FADT_NO_CMOS_RTC;
> +            }
>              break;
>          }
>  
> @@ -1249,6 +1252,80 @@ static unsigned long get_cmos_time(void)
>      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
>  }
>  
> +static unsigned int __ro_after_init cmos_alias_mask;
> +
> +static int __init cf_check probe_cmos_alias(void)
> +{
> +    unsigned int i, offs;
> +
> +    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
> +        return 0;
> +
> +    for ( offs = 2; offs < 8; offs <<= 1 )
> +    {
> +        bool read = true;

You can limit the scope of i to the inner for loop.

> +
> +        for ( i = RTC_REG_D + 1; i < 0x80; ++i )
> +        {
> +            uint8_t normal, alt;
> +            unsigned long flags;
> +
> +            if ( i == acpi_gbl_FADT.century )
> +                continue;
> +
> +            spin_lock_irqsave(&rtc_lock, flags);
> +
> +            normal = CMOS_READ(i);
> +            if ( inb(RTC_PORT(offs)) != i )
> +                read = false;
> +
> +            alt = inb(RTC_PORT(offs + 1));
> +
> +            spin_unlock_irqrestore(&rtc_lock, flags);
> +
> +            if ( normal != alt )
> +                break;
> +
> +            process_pending_softirqs();

You adding a call to process pending softirqs for every loop
iteration makes me wonder how long is each of those accesses expected
to take, since we could be performing a lot of them (0x80 * 3).

I don't think so, but there can not be any side effects from reading
from the CMOS RAM I would assume, even for cases where the CMOS ports
are not aliases?

I would assume ports to be either aliased to the CMOS, or otherwise
reserved.  What makes me wonder if it wouldn't be simpler to just
passthough accesses to all the possible CMOS alias ports.

> +        }
> +        if ( i == 0x80 )
> +        {
> +            cmos_alias_mask |= offs;
> +            printk(XENLOG_INFO "CMOS aliased at %02x, index %s\n",
> +                   RTC_PORT(offs), read ? "r/w" : "w/o");
> +        }
> +    }
> +
> +    return 0;
> +}
> +__initcall(probe_cmos_alias);
> +
> +bool is_cmos_port(unsigned int port, unsigned int bytes, const struct domain *d)
> +{
> +    if ( !is_hardware_domain(d) )
> +        return port <= RTC_PORT(1) && port + bytes > RTC_PORT(0);
> +
> +    if ( !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) &&
> +         port <= RTC_PORT(cmos_alias_mask | 1) && port + bytes > RTC_PORT(0) )
> +    {
> +        unsigned int cmos = RTC_PORT(0), nr = 2, step;
> +
> +        while ( cmos_alias_mask & nr )
> +            nr <<= 1;
> +        for ( step = nr << 1;
> +              step < cmos_alias_mask && !(cmos_alias_mask & step); )
> +            step <<= 1;
> +        do {
> +            if ( !(cmos & ~RTC_PORT(cmos_alias_mask)) &&
> +                 port <= cmos + 1 && port + bytes > cmos )
> +                return true;
> +            cmos += step;
> +        } while ( cmos <= RTC_PORT(cmos_alias_mask) );

I would use a for loop similar to the one used in probe_cmos_alias()
to check for aliased accesses?

if ( port <= RTC_PORT(1) && port + bytes > RTC_PORT(0) )
    return true;

for ( offs = 2; offs < 8; offs <<= 1 )
{
    if ( !(offs & cmos_alias_mask) )
        continue;
    if ( port <= RTC_PORT(1 + off) && port + bytes > RTC_PORT(off) )
        return true;
}

return false;

So that you can also optimize for the more common case RTC_PORT(0) and
RTC_PORT(1) are used?

Or there's something I'm missing?

> +    }
> +
> +    return false;
> +}
> +
>  /* Helpers for guest accesses to the physical RTC. */
>  unsigned int rtc_guest_read(unsigned int port)
>  {
> @@ -1256,7 +1333,7 @@ unsigned int rtc_guest_read(unsigned int
>      unsigned long flags;
>      unsigned int data = ~0;
>  
> -    switch ( port )
> +    switch ( port & ~cmos_alias_mask )
>      {
>      case RTC_PORT(0):
>          /*
> @@ -1264,15 +1341,16 @@ unsigned int rtc_guest_read(unsigned int
>           * of the first RTC port, as there's no access to the physical IO
>           * ports.
>           */
> -        data = currd->arch.cmos_idx;
> +        data = currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(0)));

We do allow read access to alias ports even when the underling
hardware does do so, which I think is fine, but might be worth a
comment (since we already detect whether the RTC_PORT(0) alias is also
readable.

Thanks, Roger.

