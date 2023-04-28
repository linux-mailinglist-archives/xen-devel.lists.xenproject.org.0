Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBE76F1B66
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 17:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527354.819928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psPvk-00035w-G1; Fri, 28 Apr 2023 15:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527354.819928; Fri, 28 Apr 2023 15:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psPvk-00034F-D0; Fri, 28 Apr 2023 15:22:40 +0000
Received: by outflank-mailman (input) for mailman id 527354;
 Fri, 28 Apr 2023 15:22:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzbF=AT=citrix.com=prvs=4752babc1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1psPvi-000349-Ql
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 15:22:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fbb83eb-e5d8-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 17:22:35 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2023 11:22:32 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6078.namprd03.prod.outlook.com (2603:10b6:5:391::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 15:22:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.024; Fri, 28 Apr 2023
 15:22:30 +0000
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
X-Inumbo-ID: 7fbb83eb-e5d8-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682695355;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RUiVyvfJjpvdivuD7I+aDU4+0VWMoKV3foRZe1OOZv0=;
  b=ZUULZPCneMQUqx0CuMfWCrIMS74TXcIBbsZWVPtSXjuwgWwkLeDYEjM0
   uEZpLDRmdgVdR1NhXPmt8e6/WVR74KqcYiT5VnF4sg08AYNHy7xcAsNme
   35UgxNprsov9IJMJF4CtDo/M8BkEP0aTKrolIDHL2pP/JSQgGh9eVlfvX
   M=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 107643009
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:55hbYau7xEdyMEUs4+XnRf6+W+fnVJBfMUV32f8akzHdYApBsoF/q
 tZmKT2PM/uONjCmLo8lb4+xoRgDsZPWnd9hTwc/riA2EioV+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOExyFJZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwMzJOfE6917+Kw7ecReAv3d8ccJHhI9ZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60b4a9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqaA22wXLlwT/DjUbRRySm9WFknS3cP19J
 xQuwRc+8IYtoRnDot7VGkfQTGS/lhcYVthZFeEg70eTw67Q7gSeLmMASSNNLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcbSSMV7t+lp5s85jrNQcxkC7WdlcDuFHf7x
 DXikcQlr7AajMpO26Dl+1nC2miovsKQEVJz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6zt3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:25TXOaxbNjpZA4i7RifbKrPwEr1zdoMgy1knxilNoH1uA7Wlfq
 WV954mPHDP+VUssU8b6Le90cW7IU80jKQFh7X5Xo3NYOCFghrREGgK1+KLrgEIfReOk9K1vp
 0AT0ERMqyTMbD75vyKhDVRkb0brOVuq8iT6tvj8w==
X-Talos-CUID: 9a23:m98mUWAWX3KXEZr6EzJlt1xKJJB4Tn7Y63jZYBSjNjoxQqLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AUrv2zgzrmhBejj1YTgIJQONl+X6aqKm+T2k3vak?=
 =?us-ascii?q?egcCvGg58Yw2msSTqbJByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,234,1677560400"; 
   d="scan'208";a="107643009"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHxWobuNQQKqXDHqlkEQtqhMToQj/bc7FRdcmE843mMqTeAK3TXS7UAibBxsvnwWyADd8LtmrDrZc+KBU++c77iRKt39uFXGlnEowAT8ThwWUw7szXxVthATDNxl92Rcq5qojXtBByvaVcVnliSIm28dPM6Zx8QUzDqPyNiV3FVUT4Qp0DP7oO3mvznkrgygOvmdkIkIZjcVOOlb2dGMs/oWTDILw8SvXwA2OYUrNpmrQ7mRd/yJ0rZ48Qk5chhlxsiICTCmRSgRPnqhPDgy5OwblG2y6YgqAyC9Zhy1eQTHxsUOopLALY71bY05izNc798bSSSvmQta17vC0pJb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSdch7VJ9CsOzzeQi4IbtZS6Bu3WNkTNR1mj+fvzyaQ=;
 b=AHrhwsQEkO0RR0QL7Nh9cXIyAxaOn7TztT/a0yy6HN61cvOlpgiAI/ndOgZmwuZt6IfCCGon90n0wKbQQjqL2gGMghbdV7+ko+1l3lt+mFyHoE8VLHdmXNwiu9OIH4rfpwdp8bXFo8uHmjGSqd67vRAHZ9jZXEfVxFxes0FmfM4lNxRmIyQAAc7ttyHof0DrwkXydQovakvUVbQ2k81bmvGmZKp+QNR83psAVqyAdw3rka6yJ0hPbdW4s89OREaPgXLWaVYo046lOVCDKGVsEs0t6r8hRNL7rTN9QLQXM8IVozKLJhZprDzr5/q6f9llQ+9nWHB+dLnGLnY6ID/ynA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSdch7VJ9CsOzzeQi4IbtZS6Bu3WNkTNR1mj+fvzyaQ=;
 b=A9fy3EFixf7hZdEBgvi5LO2ki+ddKXqSFwIA6QqQoD4lVpH89RqmBrT/T+3rIDiTewOt94e2LICsK5TIRfAJOn/IJXvUSHl7m0lyDD6oEVJwmb6uhPstSp8qLF5LkrEF4LtGWsnLAAzswUgfjip/8J0IG3buXysXTcpKeZevf+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <aaf6d2c4-b01b-ff26-104c-0b3689c0e076@citrix.com>
Date: Fri, 28 Apr 2023 16:22:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 5/7] tools: Modify single-domid callers of
 xc_domain_getinfolist()
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
 <20230428104124.1044-6-alejandro.vallejo@cloud.com>
In-Reply-To: <20230428104124.1044-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0635.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a64e46a-9d4e-4d6b-24a7-08db47fc6148
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vi343JGhL46wSQR2VbQ4F29k0zM6ojXFxR0HZhW3QDvsRGuaZooTSfP5ZP3bQykC5Uos2DhKE4Rilx/aay+3v3I7+6QaN0oNywF3CNenC8CsZFU9k1+6mNz5vxbEN27J9VWndhun0B6WvU/6enbP7HWBAnOjoOA1d8LhEi4HApUQ93BsJXg+ykd5/59jXOqdKhfBpftnsuCZ/V+OWDg05Nwu9Y+HadnlKZyKzgpwbFzWxV5u4PmbEOKonttfaax4RzL2IPLD1UzPsc5eRovbXO1uwMKE89zcxt35PjmGwGhgFq3aR1Mhd6a7yJlWnDU8aHskm+PBCkzk+hUN6ApsGU+jsocoPFU82sUDXt0beKlwKJxWOtLOBun5ZxQD8kDRCr8Ldt7MO8FaEM6dqfhoO4I2HZEr0v1/8PSA5SkLaFZM9qvOml+eRFcSuX9jMqBr4UsWViyfi/QVEQjrzZQOvfkhJO6Kavl7VnyVZPm/4sDkIhgK/3oAG1i2/hySQJwieiIl4iFWIKXXQHzstgEx2TzF/GeUXGTmbU32i0LtJgK92cbpusHup2Xct835g5ijZL/Nhs+1IA/L+Ld2riRH93C3ppX2mEGWBFeINfKeTmVhfTandSuZS9IYSoKI7FPZ7CK+AUq8jKkQrd5+E6Hf7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199021)(53546011)(186003)(6506007)(26005)(6512007)(2616005)(31686004)(83380400001)(5660300002)(66476007)(66946007)(66556008)(38100700002)(82960400001)(110136005)(41300700001)(316002)(2906002)(4326008)(31696002)(86362001)(478600001)(54906003)(8936002)(8676002)(6486002)(6666004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXFaVE1oejZzcldObXRNdFNvWEMzcmhST3hmQ2Q0cDBoQWFHeXVWUVhIMndI?=
 =?utf-8?B?R201anZSWU5xd1l0NnlieTdFb1pKcE1GS1BIZmRVdzNVdUtoYnFuNXRGV1F3?=
 =?utf-8?B?eko1TGN4cHpvbkV2U3VZSUJsaERhU0ttbG1EVU1mVTNnRGdLbWxzekM1L1Ft?=
 =?utf-8?B?amdlWURjZEttMUNLbXRmOG0xdWYxSVloS3Y3dUJNTFNFRkNmNmFBUkFMSGYz?=
 =?utf-8?B?czB1aVBoNDN4R1FLSjVMWnJWRmVDK1Y2TmdOdnZIcU4rYlBEMnphMGdMQzk5?=
 =?utf-8?B?TjE5eHU0RkNyai9VL0tKdU9RV25rcVh2dEpad1B2QmFaSGxieklrc0c3MXpj?=
 =?utf-8?B?b1NOdzZ5VTkyU0w5NmlGUnVKbDlPeGl5UzBsT1VzcmQ2dkdiempYRW1GL3gv?=
 =?utf-8?B?WHBJRzlXZ3lDYWgwbE94MnVvd01OeGQ4RHFHZFF2aEdqa1IxT3g0Z2dRVUxI?=
 =?utf-8?B?RDc3VWhLQjNQNTdkWVM0RzBUeEJpMWc0M3VnMlBXTXA5NHFMMmRWTnlqNGF3?=
 =?utf-8?B?UE5DYnFZYmdmWEpGR3NDZHhqSjNVeWZIVGVka0pnZUZIQzg5eVNiNEtFdTEz?=
 =?utf-8?B?dHp0bE5oRTNyY1VFc1p6SDVzSUdNTnNPajByUG1FVksvNUJycFJEN2FlckJw?=
 =?utf-8?B?VTJtUnVOL2pPbE9KTkZGMnJYRzdEMmNZdk1UN0gyVXM2Qjk3eVpWVkxSNlZa?=
 =?utf-8?B?bjA4bzVuMGErMWFXMU15TkhlRUMxVlNYdFRVdlhRVXY5TVBlaGJpNVhLT0JD?=
 =?utf-8?B?bTl6eUMvbko5eDRpaUErU3VyZG5wYWszcFo2VWFjaFEzNnJOZ2JTcjM2TDFv?=
 =?utf-8?B?bE1ySzUwaWVFd1UzK05Ualllb0FBMlA0R2FKcnllOGhtWGVOU2VyeUtzNW1U?=
 =?utf-8?B?RitVckoxcmcybFdHL3dwOEdrZmNEQ3JVcjZJb01RR3NEbDhNS2NxVkk1ajNx?=
 =?utf-8?B?THpLTDhVVTN1LzBoQzZTeThoMmhxbk0wTzNIZGs2L2xuZVZIV2hWekwrNVpD?=
 =?utf-8?B?NFdhSGgxMlJyMmNnc0FmMUNPcVJpOHlxMTNTWkxVQW9RWmVKSk1zVVY2WVVn?=
 =?utf-8?B?K2c5eWlkaU9CV1BOUzZ3ZW9DcWZTd0pGd1ZJTTkxME5FaXRlcGVRT2pXZGNN?=
 =?utf-8?B?QlVSMjJPQkJvMkJBblBrbUx0Y1MzL1dzMFNjdWN3dWEvaEJqclVHeWYya212?=
 =?utf-8?B?aS9mbUVIRDU2VWJoanpWWVdwSlcrT3ZVRit4cG41QlQ5aTVpT1BmaGFoWGdM?=
 =?utf-8?B?TVZmeEtOWXlhVFF6cXhqUFdVODJZU0wzQmh2UnFkUFcwYko0NmI4T0RaSTRt?=
 =?utf-8?B?QzdTdUxUdFRINVJxNDh2RUpLTWgxOGZXcDVjME55QnA0ejBmd0IycEFtZnR2?=
 =?utf-8?B?M254STR0Tmt5NW92SkhwZ2o2QzRkSk8rWjA5L3o2Mm5ydzJJa1dWN1JXVmJr?=
 =?utf-8?B?aTR6SGpqR3piY3FweWRicFZmeVVmWWwvM0gzcXVNcUJQMnlVbTRtRy9KZ21G?=
 =?utf-8?B?bnUrUno3R0VvRmxnMXN3dUtSbmZjbGZQSllLM0ZtQXZIRG5JUTlPczkvbktl?=
 =?utf-8?B?WDV0bFJ6Sm1UT0syUzhuSXRRN2RHNlMzMlE3akJ5M2J5cDAwV2lFeTRqMExI?=
 =?utf-8?B?SEg2eEJHT2FoN2Y1Nm9GSWxXQ3lYajZSMHlFR2Q0TXp3aEdYZUsvNUpEVDl3?=
 =?utf-8?B?VUJ0Qm9oTzkzV3JLcFoxdGNlOWxlOHd4N1dicHBqTEZORmtMVXo5elNCdWtR?=
 =?utf-8?B?eDFHK1lZUHplRDBsb09ybHJ5RGlsY2RZbm4rSFRaczJHaUpsYzM5UDFITDdL?=
 =?utf-8?B?WU9aQTBXbjl3S08vTk1RZCtJV3BIeDZOOC9QOXh3Q3ZoRXBwNG1uVWJwVElT?=
 =?utf-8?B?R3QrNXhaTGRBSGxwOWhnZ3M5VDZMTnpXbUZMZE1IdC8zdW43WU56bGlYbjBY?=
 =?utf-8?B?SnlqZ1Y4S1JlU3hCMCt6SW1jV0NJN0dpbUNGek0vUUlXSEhQamcwWHdKUDkv?=
 =?utf-8?B?MVZzbnNRdjl3ZjQ0b0QrSytseXJSa0E0Y2Z2bU1vV3J3V09jM1lPMlBmTjBi?=
 =?utf-8?B?TUxFWFAyWm12YVZKbHNVWDgreHV3TXBrT0xNNXpXK0FKbXBBVFVrLzByZ0tn?=
 =?utf-8?B?MlJkZ0hmNTNieURQWTNrVWNRRFVlazZyd0RaSEFoNjVBaVFJK01oTnFTSUZo?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4Qyszt4LuzLrJiELToiEwzIwOqAhjsoSIdZ4vPsq5ckDUfwh6FSpEl/8d44p9fpBGE0lxHLQH7TByalWrafdck4pHZAYj0J/GMrVZ0AdUHfhOb7o61VodKvPLtsyLU/ZPVwvRZiPkaPreP0z2kx1pcDXRY93pnlGwI8bfsEbH8A0bN54eRzbDYLlojvvB4zEi0ckmzHLtb2yA4uyBppRB7/LwF14YDvlhg0qPDTUuUhxd/S7fvkW4bsWZY97UDYRp6dYu6dATOXxsWsqvSueZ3rEFBj4kl1oBDycLQHREYuL5B68cHzj1Gq6+xSF6fL1aHPl5+Ojns+j11t/ARL1JUHCWAze9xV2efAfk6spZ6qeaYnhAk/sIPw6t7u+ZfIAFOfolj9VTAfLzoWn3u744XhpVR4eOByWEmsbd/patXuQNqVG3qkNRO7U7FYvpT9NWTrQmuPRSWk9VcFzE8KnsqTJXvX1MIBPJhI3j8mdbUUsnDv62SUjQR9x+2l/vophwU6A5vf+xsgppFCslQg1e0n2kIb5lVH+7PcZjKp1moyU/hZ0/XnYWCllhnuP7GR4sbosQkD/bgiGoQOIzymhpovtkBal0RIGw7/b9NKo7qFvmeuYdGhotZG4hMJR9w5F0R8PVSdmMU20cgSnw22qGWjeeqE+kYGA0Gle437nrl8J3pC8hhr3iH5Tvcd8MAz8QAjPKTu/JfPc7lLMoNczmH3/GjLYYNo7boiBBo5O5OwO4e1fAg1ohJ3MqSWnJr25YlNyZsxKUuumzUsyLaHdQH6W2C7QxnmHeM+QRfDWPKECY0CIAOv/o7gRbfMVyCFkxBLgRNteoG/91ivVs6zHolE0AJbKzZxSWvvKlaUgYk8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a64e46a-9d4e-4d6b-24a7-08db47fc6148
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 15:22:29.5662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ym2o3PDj0WyWSwPPaLZJ0b3oXTP02IQrKPUjFItqVzKQz556oT4+OFqa1mUyf1bJGAgn+fNL1Xo+diqa9ZMxWtowFxql5vmA+HtNZ3qKjoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6078

On 28/04/2023 11:41 am, Alejandro Vallejo wrote:
> xc_domain_getinfolist() internally relies on a sysctl that performs
> a linear search for the domids. Many callers of xc_domain_getinfolist()
> who require information about a precise domid are much better off calling
> xc_domain_getinfo_single() instead, that will use the getdomaininfo domctl
> instead and ensure the returned domid matches the requested one. The domtctl
> will find the domid faster too, because that uses hashed lists.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> Cc: Juergen Gross <jgross@suse.com>
> ---
>  tools/libs/light/libxl_dom.c         | 15 +++++----------
>  tools/libs/light/libxl_dom_suspend.c |  7 +------
>  tools/libs/light/libxl_domain.c      | 13 +++++--------
>  tools/libs/light/libxl_mem.c         |  4 ++--
>  tools/libs/light/libxl_sched.c       | 12 ++++--------
>  tools/xenpaging/xenpaging.c          | 10 +++++-----
>  6 files changed, 22 insertions(+), 39 deletions(-)
>
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 25fb716084..bd5d823581 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -32,8 +32,8 @@ libxl_domain_type libxl__domain_type(libxl__gc *gc, uint32_t domid)
>      xc_domaininfo_t info;
>      int ret;
>  
> -    ret = xc_domain_getinfolist(ctx->xch, domid, 1, &info);
> -    if (ret != 1 || info.domain != domid) {
> +    ret = xc_domain_getinfo_single(ctx->xch, domid, &info);
> +    if (ret < 0) {
>          LOG(ERROR, "unable to get domain type for domid=%"PRIu32, domid);

I think this LOG() would benefit from turning into a LOGED() like the
others.

Otherwise, everything LGTM.  I'm happy to adjust on commit.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

