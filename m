Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5EE450449
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 13:18:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225846.390123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmawC-0004Jg-BC; Mon, 15 Nov 2021 12:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225846.390123; Mon, 15 Nov 2021 12:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmawC-0004Gr-75; Mon, 15 Nov 2021 12:18:16 +0000
Received: by outflank-mailman (input) for mailman id 225846;
 Mon, 15 Nov 2021 12:18:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+jS=QC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mmawB-0003Jk-EC
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:18:15 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a7846fe-460e-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 13:18:14 +0100 (CET)
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
X-Inumbo-ID: 1a7846fe-460e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636978694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=suHg7mkFa4hyoE+Z6M7v1KbxlgOFi+JsFBNf9hv3fM0=;
  b=MXus21wVJh+Bvb+c5gTl2VPiCMDoXGnnJXF0gmk16CDzFXaYPN1+ZHcc
   IEOHFqn5Q6FWwdmoxKei9DY3p3yrO0FNYNiHM5TSAvRwC0eMtArIYrpE4
   CwNapZ7pj5cfIReujQhDQIZ6a3BH/ldHfc2Z4wIgrXTt3Zp4QKOW5DqVS
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: c/+/w4s3FQ/ny9hkrHVRZgrKu/ox0s28fF5IYRR/QZIomRFo9WstfT/JB0bMpt+dJ9DFwwPCvr
 KXoA+nfGY/VIb2f98IjQEwYmu48kI11E6t3hqW9ik7Ls9qoMQ9VZe5n5t5m177rwN8ZHbZlLOm
 zba59gMAMSFS6hUnPXYlg8VpZJZbDU2fI5E37ktamQCGeO2GhpNUIRaNWHd3B7E301EUwO3r0s
 e0iqoZ5EPvkEU3m6Dl4KyJMGr4N1u9oRldcdCLE4vJsNYszZ1CfNMcdyxBMOdM+1557N8h9qlY
 hAtRSpYc3hz40d2/AhAx/xY+
X-SBRS: 5.1
X-MesageID: 58216534
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gGDzOaIvCHr1pU1XFE+RPJIlxSXFcZb7ZxGr2PjKsXjdYENSgzMFy
 zMXC2DVPfiLa2H2c4p1YIu0oU1UvZHTn9U3SlNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es6xrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2VpuF77
 txRi6DqClYRJI7UvM8yShNHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XtYUBgmpr2qiiG97OW
 uAZeBNCYS2HfjNxC3U9LqwgxN+R0yyXnzpw9wvO+PtfD3Lo5A573aXpMdHVUseXXsgTlUGdz
 krH4GbREhwcLMaYyzeO7jSrnOCntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3N
 Eg86ico668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT8/z+oDE4NUgB9Mp93jNUVXRgB+
 UaDgIa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+99q0E+WJjp3OOvs14CuR2msq
 9yfhHFm3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEwHpU
 JsswZH2AAUy4XalznPlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hfJ26wP
 BGO5V0NuPe/2UdGi4ctOepd7OxwksDd+SnNDKiIPrKinLAsHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZPdw1XdiZiWsitwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg6AF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:AOKkt6in/e7ydl4GNsco6CuCf3BQX0Z13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmskqKdhrNhQotKPTOWxFdASbsC0WKM+UyYJ8STzJ856U
 4kSdkFNDSSNykLsS+Z2njBLz9I+rDum8rE9ISurQYfcegpUdAc0+4QMHfrLqQcfnghOXNWLu
 v52iIRzADQB0j/I/7LS0UtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13DDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3O
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0ITEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fy1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfuspcq+SWnqLUwxg1MfheBFBh8Ib1O7qwk5y4KoOgFt7TNEJxBy/r1Zop8CnKhNAqWsqd
 60dJiAr4s+O/P+W5gNctvpcfHHeFAlfii8RF56WW6Xb53vG0i94KIfs49Frt1DRvQzvewPcd
 L6IQpliVI=
X-IronPort-AV: E=Sophos;i="5.87,236,1631592000"; 
   d="scan'208";a="58216534"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYxhnhFDWA12yggWS5zoqqnmkFH/XJOgQCOPZHZVDTv3wcDvZNYVHnsVgY+HH31BwQI+oBCWZoO76U3WS1b8dmN7eYhB9NscGY/qlXQgT6pZYnuWnZB9nLJ8bZp4gDJY0uIikX1n34RHqP4GFUORDf1zr7yKrwQSrUrCSZ7lSoKCr2gA+zwfZIXlHU7jA7R407rvdWWbKtuHEVgZ43S+1xTcpcfvM1m8bcIZ9kyFeWQfHlQS9uG/0qyNGDKaJoUQ0JXI2Rqib3abt4fuDq08QAMxqkawGEZPPKT1NpPdkthQ2oJF9gDHb1vFhwJDAdxnEiVbtvHBVnPR0/mU0SWXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NO9jNqMFfmWpzrIg87oupc00Q1GXXnQECMilJBuxT6A=;
 b=AFNSAdCpcjellDRpeg2ZAyQw0kWvkLzBc+IWvj5siLGK/TIaSeD6tQyWGXs6+smfEM9k5xYOtprt1jNVfdfWeRJsQzLcaXoA8/ieFPQyzJFR6OuxjwUA3VWKKTh1u/OoDVSgQkqG0PRCNh8Cr1cK4o28hnevth8vGoNfuc6yZ8XwjrzXekwc1pj8guDLGHRRRE6idEuvhOARzPMM8XE6nS/M0BzOd6rkYI6aYHAnqollKm6E7NW+/VY4kihWSMTneM/GPL2vDHyxt1V4mFM+DWYlQ46T3eYA6jnP67+QL9DdSDdit4SMGOnPLXW2Nd8Epg1GuKqnUYxBkAu8Hn4dtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NO9jNqMFfmWpzrIg87oupc00Q1GXXnQECMilJBuxT6A=;
 b=XvpuHybPfQON09wZRrdDFdWUwGKdrTX4f/CsOfX1RetSIKQjVA1TLWhufN355bRDS2No8WW90z18x/bZ7Hc483kzi/WQ/yvweU2ga57pImzjOGxITXaKx4ifLzPkK/UCBQorNcJSQdTIbIuRueyHRhl2WMRIBvFUlm6a+ANstyg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.16 3/4] test/tsx: set grant version for created domains
Date: Mon, 15 Nov 2021 13:17:40 +0100
Message-ID: <20211115121741.3719-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211115121741.3719-1-roger.pau@citrix.com>
References: <20211115121741.3719-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0050.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fdbdca4-a3a9-4701-6ae1-08d9a831fc8b
X-MS-TrafficTypeDiagnostic: DM6PR03MB3483:
X-Microsoft-Antispam-PRVS: <DM6PR03MB34831A80A6AB80C25D96A9338F989@DM6PR03MB3483.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p5VknUob/mcNfYGcC5Qf0FiZwbIKQMYHRVJnDurm8vqovHPVy7B2AHJ8B7sDeZqDu7s36KF/n2xvT+lgjYbXNMc/DOkB/DmK9F4LXJ92BXSzHfNLWEzEzfvCavYmHM795iSHcGvGs1qbI/Q/RV3i/xybvC8L2U/1IYiCxQl2iMbdTF3cEaF90KCD7SxkmUNNKKo64ntuvcAuKlhMaTB3JqAFYJnfJaxFFoPnlZ62hijlY/GbCgh3jPNXk7pAG9KZ8itxy9c0Tfd2ONCw+3qFjQ4pE819IDs9KsYi6eQXzmwUylh+nyw92HHbMp/Sbaghhf8ZhE5PhgaVnBX/EG+0aXf9H9+C+ZzEHnWFSGToTGsObkf6qUkgxMYgeUyAZZ5mHtIDUiramVRrK2gmmEipRxarOC/9GzWC2U8cqwptWF5W89b7VvCo861wLXGkKvxCyjkzwp+gPU128vdUXKzRsCECmHnew4z9AVWdR645gw7oJFQvkiDMp/UKe7UDprG8wRRXi03EZ9Y1ywtla/3SML/VjAgbT7wAwT3xBGzEdt1oQqHE4Z7AZC/W3i/bLkUrRFvZ2mGupDqYF1gKlTXXUsk8KR3VeBiCNwODWe/pFXWUZYOiSL53EOyL+jrzS2ojBXlYhzmoOVMlhqzqqXOIOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(26005)(82960400001)(86362001)(38100700002)(66946007)(66556008)(66476007)(186003)(2906002)(508600001)(5660300002)(6666004)(4326008)(6486002)(8936002)(36756003)(2616005)(956004)(54906003)(6916009)(6496006)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGdLYWU1UkdseHhkWnFUMHVTMUxzK2U1SGtXZlBmZm1WK0piQUhYb2JBTzVY?=
 =?utf-8?B?SE80UHFKc2k5bzFKOUNLZEVodGhQZThqSWpCZG9DNE11aEIxek95dVBlMFE5?=
 =?utf-8?B?b3FMQWRsMFgxREdPd1VBZkdlMGhLTEdKUFdBZFlPajI0L0tJSmpUcnNoRW9s?=
 =?utf-8?B?d1dlNU1GcSttTGNuMjgwYTBJcTNSdnZ3WDRRRzc0emE4eHRCNXVSczlOaDdj?=
 =?utf-8?B?cTJydiszcHJKOThQZTJhVUtYUldWcEtYTFNWbnY4QVhZY3M0UU0rY016RG1j?=
 =?utf-8?B?SHRCMURVQTVBRTNneUI1SkE3WmVQZ0xTN3JlODJVVFpSR1NYWmExdFJoMVA4?=
 =?utf-8?B?OFNFQWNGaGpiMkpkbFJ5dDhKZStGVE5TN3NtZVk3ZjJlRjI1aEVScjdRUE1O?=
 =?utf-8?B?V0swRi9sdFhSL0d2TDcxakNkalA0WDJ0R1pYQ2cxdWVPaFJUWXM5UFB5eXo5?=
 =?utf-8?B?ckZJeTZrZmNrenBXeWlOMjlMaU9aTkRMaWoxNjFSalYzOGVpVUt6a01sN0d5?=
 =?utf-8?B?ZVZoazFtbENldlJmQjRWUlU4VlUzY0Uwb25mY1NqRW9MSUFJNlBFWU41bjdJ?=
 =?utf-8?B?ZDFLd1hOSFkwMTA0WGRiM1JaQjE5Z09FQWFxdWZiaTIzZk1lR20vc1lhNjNa?=
 =?utf-8?B?OWlwSzVkQjNGeXRsMEdXSWRJbm9EZFJGa29yUHJDOVp4VUFyMm5HL1RrMFdB?=
 =?utf-8?B?QUF5d3VRNkUvRExnMG9sQkdGOUdEL2gvc0I2RkFjdmIrK1crcEsxQzc5QUpt?=
 =?utf-8?B?ZENydmsrWVRHVWEyaTQ3Z3ErU2Zya2l3QmpSSmZsaEVBNnhURVRlZW9ySXBO?=
 =?utf-8?B?MGtrQThENDBGaGwzcytCTWlUMDA1VlFJOVBQUlJyOUpxVnNJMWIyZ1c4S2or?=
 =?utf-8?B?b2NMT2JCUmtuT0huTDRCakl2V1dvU3c5RUwvek91citwWU5CUVltOFhKZTJp?=
 =?utf-8?B?N1BSUHkrQ1RVWWY5RWdjRXM2eHhpYXBiajVONnc3a0tjT1NuQjg4dzJ6dmNs?=
 =?utf-8?B?djc2YjJQTDJWU2N6clZQNTUrckhwbWFxY2Q1c2tZTlUvTWduazdvOFRCT2E0?=
 =?utf-8?B?SEJWc1RiYVZzWkFvM0Z2TzVpa1NYZnUxTEJUcjRXWXR2OTd6aVZoUVBKTit1?=
 =?utf-8?B?RTE0d2hpYXZrbXl1YmUvOUdRdjh5cnBNb010eE5DVG5JdUl5bVk4NmM2QnVC?=
 =?utf-8?B?VmRkc1ZpRFpUZmd3RWNHREVsaXJpd0xtS2FmQ2l2T0llbktVUWlxaXJwZWVV?=
 =?utf-8?B?SURuNmllZFROZ29PaXF0N3gwbytNbkREQ3VPcXI2VzN6ejFrSE82MzFsOVR0?=
 =?utf-8?B?a292Mm13K1lBcWtLdTNDTWhqdzYwUWhNd0M4TGZsVWJySEc3eElMY1o4Yyti?=
 =?utf-8?B?SElMQ09CNkE2ZTRrRzUvSDIvd2hRQnowWXJ5SFR4REdickJldTJrMWYxUEFj?=
 =?utf-8?B?WHpnTFFzMEYwNTNGRjNNZTZTa2czS25QWjBvMTNFMTdCcjgzc1JtdmNRc2do?=
 =?utf-8?B?ODh6allYSVJudFdtR2RXWWw3dWtIc1lJbzhDYXNSOGloc0F5VWJKRXFNQnY1?=
 =?utf-8?B?WnpISmg2NHJGSVI0S3Z6cW1TQlpOTzgxWGNkUlAvclBpYVNOakRKTXFXWTJ5?=
 =?utf-8?B?MVNzaTRCMm9qQlAyeVJ6MHJZK0xkbitia1BCK1VKVHE2KzJXd3o2MVM1MUhz?=
 =?utf-8?B?MkZtcXBRRzYyU0RPUWhRVTZkRVhrYkphbUtNNUhEQmo3Vk8vekZYcW16d25l?=
 =?utf-8?B?VERPU3luZFdVQ3VVZU5kb0xIR1dHcXJkWWxCdEUxRTZQOWxlUnVFcUtxWVM5?=
 =?utf-8?B?dFZNMS90d0JWUXBteTJEajJpenFwMjFKb1dUYWdXT0tqeW1oem5NRXVDemlU?=
 =?utf-8?B?aHp4YUx2WWd3WHJvVzBaUEpNKzdycDVJR2txMDNQMXd0NFNqMUcxTGFPZTdu?=
 =?utf-8?B?TWNQd1VOY1ZPN2VTeXZia24rNVpaa2N0R2JTV0tzNUw1a29lZVV3b25EYVQv?=
 =?utf-8?B?RmZxL2QvdUE5MmtSbHFoQ1dvMnBzanpEb2txR05vUWNBcGFHbG13WHQ1QkZz?=
 =?utf-8?B?Y1pNS1puZmF5U3VxcDB2YW45VEczTjRsOVlERWI3QjFGdWlpSzNVekZZVjR0?=
 =?utf-8?B?VlpZd0tRNXV4cnBaaEYvWjBSaW50ZXp3bVREOFBqMzVEL2lMUUFESzR1d2Rz?=
 =?utf-8?Q?ugSaVfZko/5Ru0EShMtQguI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fdbdca4-a3a9-4701-6ae1-08d9a831fc8b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 12:18:09.5376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWMTA3idPS51wOyaHBcqC2Y1HlD44nO2xEQ1Hsnhjg8Fp/0O7Lj5RSAHdfWb+cbvI+zaawNCgHdWpdVcRxjMng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3483
X-OriginatorOrg: citrix.com

Set the grant table version for the created domains to use version 1,
as such tests domains don't require the usage of the grant table at
all. A TODO note is added to switch those dummy domains to not have a
grant table at all when possible. Without setting the grant version
the domains for the tests cannot be created.

Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>

This patch only modifies a test, so it should be safe to commit as
it's not going to cause any changes to the hypervisor or the tools.
Worse that could happen is it makes the test even more broken, but
it's already unusable.
---
 tools/tests/tsx/test-tsx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
index fab99c135e..f1dcff4c30 100644
--- a/tools/tests/tsx/test-tsx.c
+++ b/tools/tests/tsx/test-tsx.c
@@ -444,6 +444,8 @@ static void test_guests(void)
         struct xen_domctl_createdomain c = {
             .max_vcpus = 1,
             .max_grant_frames = 1,
+            /* TODO: switch to 0 once support for no grant table is added. */
+            .grant_opts = XEN_DOMCTL_GRANT_version(1),
         };
 
         printf("Testing PV guest\n");
@@ -456,6 +458,8 @@ static void test_guests(void)
             .flags = XEN_DOMCTL_CDF_hvm,
             .max_vcpus = 1,
             .max_grant_frames = 1,
+            /* TODO: switch to 0 once support for no grant table is added. */
+            .grant_opts = XEN_DOMCTL_GRANT_version(1),
             .arch = {
                 .emulation_flags = XEN_X86_EMU_LAPIC,
             },
-- 
2.33.0


