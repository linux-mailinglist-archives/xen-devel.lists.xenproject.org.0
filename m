Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E1556157B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 10:56:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358338.587495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pyG-0006yi-4X; Thu, 30 Jun 2022 08:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358338.587495; Thu, 30 Jun 2022 08:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pyG-0006vz-1T; Thu, 30 Jun 2022 08:56:20 +0000
Received: by outflank-mailman (input) for mailman id 358338;
 Thu, 30 Jun 2022 08:56:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6pyE-0006vt-BN
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 08:56:18 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fa928a8-f852-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 10:56:17 +0200 (CEST)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 04:56:14 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6977.namprd03.prod.outlook.com (2603:10b6:510:163::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 08:56:13 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 08:56:13 +0000
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
X-Inumbo-ID: 7fa928a8-f852-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656579376;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=IdmikN7OmtdVVz1Uu7ycTraepP81sXp5bfMMqtggKcQ=;
  b=Yvo8DTZRvCr5CDUM6lpSG3jrkJl9NBAa0rgnqPgkBGKE6gRVCZ9NoU/D
   zndtl9/npWdpVrZkOOMT+iyx2Yn7dleSm8KJuSfXxEAL2mGbJKOZ0MFsM
   DPwx+i3IfLBti7zZzJW/3uDKazd/xS8ZU28ZvluJgUJXuIGCAl8suKIUN
   M=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 74794287
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:V7C85KNROtPM22TvrR3QlsFynXyQoLVcMsEvi/4bfWQNrUor0DRUn
 2JNWm2FM/qPamunLo8kO9mw/UtX6p/cmt5qSwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFUMpBsJ00o5wbZn2dYw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z6
 ZZKiZWaZiwTFaDOxcQ8Ax9SGCdUFPgTkFPHCSDXXc276WTjKiGp5so0SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB4H9afGM0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLj02SijKW0HwL6Tje1w4W2NlzV46orKMOjQedWrSZtSuFnN8
 woq+Ey8WHn2Lue32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXO5q/Skjk+1W/pEN
 lcZvCEpqMAa60iDXtT7GRqirxa5UgU0XtNRF6g/91uLw6+NuQKBXDBYFXhGdcAss9IwSXoyz
 FiVktj1BDtp9rqIVXaa8bTSpjS3UcQIEVI/ieY/ZVNty7HeTEsb1Hojkv4L/HaJs+DI
IronPort-HdrOrdr: A9a23:t6iuV6xxp7eV/NUAWiDTKrPxt+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scu9qBTnhORICOgqTMyftWzd1FdAQ7sSibcKrweBJ8S6zJ8l6U
 4CSdkANDSPNykcsS+S2mDRfbcdKZu8gdiVbI/lvgtQpGpRGsRdBmlCe2Wm+hocfng6OXN1Lu
 vr2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnR4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUpZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpQoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPUi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZMIMvD0vFoLA
 BSNrCc2B4PGmnqL0wx/1MfiuBEZ05DUStvGSM5y4+oOzs/pgEK86JX/r1cop46zuNNd3B13Z
 W7Dk1WrsA/ciZvV9MaOA4ge7rCNoWfe2O6DEuiZXLaKYogB1Xh77bK3ZRd3pDYRHVP9up4pK
 j8
X-IronPort-AV: E=Sophos;i="5.92,233,1650945600"; 
   d="scan'208";a="74794287"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faCHUyW6Ex6BHCVBx/6+KQzRX9eCQtlk3Svw9YaE+9Wt2snyXckez2bWOs3CnfjxrwIVtThH4d70HVFhmGv5HsYCB1R+zjQtGfPuQg2PVPu6ZU+TrCsx7wm3TZvSJxVvTdF3rEGy3ehLQnn5ZLzY+ZC0w954ChYeeOiWCXT8bDSoegXwYM2q7DKKARN5XTDWHdLTTPMzmTXNH3VYGkXw6/cG6lPGjB7Gb3IOoIwcc3q2k0HiM7DZu6gTlI5R+5CnKYQpKmoDO5mBaEbSDM4Y3XguimEqodKyy7BXxe30DuCO9053uyJQYtHK+tJBZAmL3dDGLvCzOkIdp+VCVEfPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osL7U4plyZ9pS0plcC349zQYohginb6VmByznZxF5hs=;
 b=al2IBqAu6elKG4WiSKNG5mTPjoa+joigRNuZxDg0LmsbIKAN9ekSZjfxTzmDaIlWxRvWSee5TVBRoa27VPRuQj6j6rne+sQdAFd4LZXnnpYyODpbOKR6TWZsHLuV9Ljfl331kbrp7DGLCh9v10Z3j/dVBR6qWMB6cXBtsC+sihtixAkkJ0uiJ2Ja7uFn96NDtAaBcwrIbrt3uP/sppzDllkprtR32DP4ltH0NxhR3/xOQi8SV9TSkMlO6y4D2tlJVq5xbTBlERsDSwXOMubZ2A6EcDNuVYRegsJPMtW+cDJnedzBWPgT6JDwKoF4qEmLqgiTx19klLg3QA+TNkujBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osL7U4plyZ9pS0plcC349zQYohginb6VmByznZxF5hs=;
 b=sc8TQ7xK5tGjC2XVspC55JEv31SjWIitUc88+/4jD1uGNKpS0NAmo8WVqe3GT0pJEsE3XWLt7T7MxjiX2/4DP/O5vC1KqGKCyz61CMl9IsmgsGipTiAadINSM+DjTqt371B7twXMjfSh+/UsTJGXVSgaIxuwygBG7AgKIVHZhZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/6] x86/Kconfig: add option for default x2APIC destination mode
Date: Thu, 30 Jun 2022 10:54:34 +0200
Message-Id: <20220630085439.83193-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630085439.83193-1-roger.pau@citrix.com>
References: <20220630085439.83193-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a2fdf11-ad61-4206-112f-08da5a76625b
X-MS-TrafficTypeDiagnostic: PH0PR03MB6977:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mLs32beiMDc08RdhAoM7m3HCJ8Xdtn1ZHG9+vyQey/bmzSQFTp66SWtb0ixqfaOA+jvtX5f9RuARQsTt2ukyfXYtG74+VR5ephPNFIDWwUjxNf3nOaVTYDzOXhQvfScO7UUQZ+Wxk2Y5rd4YAFpdzqgJuWornS+K2QbIKB7z9yJtqzItXqTyvFJbhXlUAcporMKWD3wvrWrzriS0IRusLqmUj3/aXYT1aDIkB40EgbjBQwGiYfps370oaQgA8OwEZSxfhxb1IFj9f9yxh88ZCjhmMDqowGZRcODobFzaTmzFMnG4R9kJGXgrLcyROgZlw1oUJmNeykm+wbXbv/53mfiC3LNC9ofRawdJHtLMLXCyc3ChYW5lNEhHt2kHMZ9scd/1ua4VNwp1zDiZjUM8CMgVlCJkom+nSeTfp12g45y+mO28/4KiOskCYuoevYy8RzunPcNA4V2Tgeo3mFhlQGARKCTN8asyfFRXP9wsDgD/150XsCoeLrKm6Qefox1/p7BOSElS4kSOSxnxzpAG0SuynTMA/QFGw9MUE6NFmc1X5RVBOwinKa0FSMzbhFJYcg2qMO6CRDCvh6Z+swifv9JS9fMYFzNKLkmQQNpZfWrWbbf/E4ecMpflEwo8kBQE7W+9YstI/EvOSHR1herv21jh2M9P6FVr3+VrgdUo46xw772ws4zi0i9utudPIaaWWHKBDkvjsmauK4bYArrks7BrSdDeIIeVWq72dSv2bffLOtMzBfzf4h5v/FwNfihiRSn/6iNwZoO0obsYOSkEIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(316002)(38100700002)(66556008)(66476007)(8676002)(4326008)(66946007)(478600001)(2616005)(186003)(6486002)(1076003)(6666004)(41300700001)(6506007)(26005)(6512007)(82960400001)(54906003)(6916009)(83380400001)(2906002)(5660300002)(86362001)(8936002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akp0VUVkNTcwOFl2KzhLdzBJa3ROaktwZFY5MkoxSEFTbFkyb3JFTUtRRllp?=
 =?utf-8?B?aExEbXFvbCtXVktMWW5hRUVVYmVIRGozU09acG05WW5RdnA5akh5WDYrNGhj?=
 =?utf-8?B?clVxeGllWWY1M0d6MmlDdmxrRVJ4a1RpYVQwanlBMWZHcCsyOFUxczBOQ2lu?=
 =?utf-8?B?VFEwR1BIZGZ0N0xBT1dSaFdlaHdvTDJVNG85eEdlcVBoQ2ttazZVYmtRRStt?=
 =?utf-8?B?R2RoMXVvRklLQ1pvMVpjamtwa1ovYWhuKzgvTGpZSkhPWTNCUHRRNldGT0Nr?=
 =?utf-8?B?M256TGtTbTgycjFUUVk4dG5YYTMyVUxpUGVZOTZlSGhrbHNNSUFSV2Zqb1Vu?=
 =?utf-8?B?OHZoL0NQWWxab0JPS1hyVU1PZnp2Mmt1UDZlcUUyVTJ5eGUwT2ZPMkRnVDZ5?=
 =?utf-8?B?Ykh5VGJMMkplT1FrK25aL2ZTOTNGc2dFa2h5eTNjSXpVcmRobDlQaUoxNUdD?=
 =?utf-8?B?RWpDaktneWZHYi9FRlNUeTlGWU53QnA0U0dsVmtrdnprTUs4MHQvbjhGOUh1?=
 =?utf-8?B?UkNaR1BvTFVZUE0rNjkvMkJaMVFxUDV3RUkyMzR6Q0FseWJmbWowOWcvZDB5?=
 =?utf-8?B?a0lZL1kybUs2NjkrTmQ0RXdFMXVXaWhVOTVTTDFOSTFWWHMvOWd2cFBHZFJI?=
 =?utf-8?B?aDROME5OWHZOczNjYnFrN3VJUENxN1VoZEFIYURHQTNjUWZwcWZlajdaNGVj?=
 =?utf-8?B?RjN1RWdHTUJnRGdYbjRMb3E4dGlNT3g0ak43SzdjUVE5YStmcm9LOE9TYm5S?=
 =?utf-8?B?T1NLd0xqUHQvUldjcmRNc2VIdkJPaXhXY3RocHBJMmVWUTlmL1RCWURzV2hF?=
 =?utf-8?B?Y2xOMnV5cit0OXIwaHVyeXBtbk83QWFUcmFLcm9uRlNoeEIwcUNDUHpLUjZh?=
 =?utf-8?B?Nk11dmJWd3QvK2NhWXYxZmRFUjBienF1VDB4d2ZzT3FSaFFWS1F6S0ZqVFVx?=
 =?utf-8?B?YWd6RjBPTllZcDZlWjJwM09WaXlLa0lQQkVISGVkQXBsZW1yMlU4RDcvMHNo?=
 =?utf-8?B?dFMzMFdYNHdCWDFHaEdlNStmM0pwck9LUmtUK0lYa0daaXhBSGFoLzVxamxS?=
 =?utf-8?B?VjV6dzlVRUtHbkFuMWNDZ2gwRjJJbkxWWEZ2d3kyem5xZi9JRGIzWUphOEZX?=
 =?utf-8?B?ZUt5QVBFNGlzZk1hTXViMCt3ZmJpS1hreUsyWjQxZHhDZTBMNzR5NUFnN2ZG?=
 =?utf-8?B?eDcvWkszMThzdW50MlIyRlE5KzJLZFlmeVArT1h2RXJZWk9BQ1B5eEZ4cXRD?=
 =?utf-8?B?UEVldm9qQVI1UlFFTm1oZUYyNzFHS3VTQ012dTVoMU9hM0t6aTZuNnZiTkdn?=
 =?utf-8?B?L3M2QWI3UEtlVytDazRpUURCU2ZLeHR1bVhTcFlmUWxlVEpBYlJINkw3aUJU?=
 =?utf-8?B?TzBGY3k0QVJDdzJPYnJEOGExTHI4TFozQUxHRkdoTldicWV1Y2swR3R1WVV1?=
 =?utf-8?B?dUIrTzJxTTB0bVAvYlNhNVVyT3NzRytnZW9RRzJvMEVZaDNFdnBhckxpSGpM?=
 =?utf-8?B?b2JXSUpldWZIWFFrcmIvNUwyaUVwSmh3bTZyWWMvditjZjEvTmtaeEtFMVVH?=
 =?utf-8?B?S25WWVUwRjU4RWRUc1grc0NKNnZyNDlEU1IwYVJwNzFzMDZ4ZE8yMjF4Zlpi?=
 =?utf-8?B?REJhUi8xL2t5S0NkakxsdytrVm5FSlV1SW1ZTXQvWG1Fdm82S1lSTnRaMkk2?=
 =?utf-8?B?bEJnYlBLTkZTeVoxc3ZCaUJVZFdjSUdpaU9QU1NDcERkZjdmNG9KSkhnY1J5?=
 =?utf-8?B?N1FtTEZaTzhJZXZnR0JBdloxT29GYzdkSTlBSlhsZjVJam9GNGYram5XNG84?=
 =?utf-8?B?QmlSZUJpY1UrZkdTNVErb0Q1cTlVZUw2SXprV21Xb0ZXZnd6RGZPMDVyUzc5?=
 =?utf-8?B?R1dhTEdjcUFuVEpGZnVvUmpoN2RaTVJJT2t0T1B3Qnd2MkJOcEVxL3JLQXR4?=
 =?utf-8?B?UFNUOHpxWWxFMVdSU3Rwa1c3ZWRla2ZhV3J1RkpFbWNDOG1kdmVZT21GS3NL?=
 =?utf-8?B?c0NaakxIYUtNc2lpZ1Q3N1lCelI3NlFvMDNSRml5WEl1SUFibjlhZHZHOEgw?=
 =?utf-8?B?WnF2WjdIZnBLdmdqVEg4L3RCWndBVWl5RWdjTTZHekp2cjk2VlpBdXJhTFNY?=
 =?utf-8?B?KzJtUlZ4VHdPWDVlOUVIMEpsY3J5SEtiZHNONURUYlQwd1Bka0ZMb24zelJS?=
 =?utf-8?B?cUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2fdf11-ad61-4206-112f-08da5a76625b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:56:13.0684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxYOTaPtBXqB/84alqeyH4SCvvMGO/jtsytUJpFXUut1oiaCb798Yh0HbVuHigGu1H6/CDzUlygPcofZM7Wfwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6977

Allow setting the default x2APIC destination mode from Kconfig to
Physical.

Note the default destination mode is still Logical (Cluster) mode.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use a boolean rather than a choice.
 - Expand to X2APIC_PHYSICAL.
---
TBH I wasn't sure whether to keep X2APIC_PHYSICAL or X2APIC_LOGICAL as
the Kconfig option, went with X2APIC_PHYSICAL because that's the
define the code was already using.
---
 xen/arch/x86/Kconfig          | 18 ++++++++++++++++++
 xen/arch/x86/genapic/x2apic.c |  6 ++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 1e31edc99f..6bed72b791 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -226,6 +226,24 @@ config XEN_ALIGN_2M
 
 endchoice
 
+config X2APIC_PHYSICAL
+	bool "x2APIC Physical Destination mode"
+	help
+	  Use x2APIC Physical Destination mode by default when available.
+
+	  When using this mode APICs are addressed using the Physical
+	  Destination mode, which allows using all dynamic vectors on each
+	  CPU independently.
+
+	  Physical Destination has the benefit of having more vectors available
+	  for external interrupts, but it also makes the delivery of multi
+	  destination inter processor interrupts (IPIs) slightly slower than
+	  Logical Destination mode.
+
+	  The mode when this option is not selected is Logical Destination.
+
+	  If unsure, say N.
+
 config GUEST
 	bool
 
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index de5032f202..7dfc793514 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -228,7 +228,7 @@ static struct notifier_block x2apic_cpu_nfb = {
    .notifier_call = update_clusterinfo
 };
 
-static s8 __initdata x2apic_phys = -1; /* By default we use logical cluster mode. */
+static int8_t __initdata x2apic_phys = -1;
 boolean_param("x2apic_phys", x2apic_phys);
 
 const struct genapic *__init apic_x2apic_probe(void)
@@ -241,7 +241,9 @@ const struct genapic *__init apic_x2apic_probe(void)
          * the usage of the high 16 bits to hold the cluster ID.
          */
         x2apic_phys = !iommu_intremap ||
-                      (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL);
+                      (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL) ||
+                      (IS_ENABLED(CONFIG_X2APIC_PHYSICAL) &&
+                       !(acpi_gbl_FADT.flags & ACPI_FADT_APIC_CLUSTER));
     }
     else if ( !x2apic_phys )
         switch ( iommu_intremap )
-- 
2.36.1


