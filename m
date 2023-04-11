Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFE86DD949
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 13:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519629.806598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmC3r-0002Ia-3l; Tue, 11 Apr 2023 11:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519629.806598; Tue, 11 Apr 2023 11:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmC3r-0002GF-0C; Tue, 11 Apr 2023 11:21:19 +0000
Received: by outflank-mailman (input) for mailman id 519629;
 Tue, 11 Apr 2023 11:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mzh=AC=citrix.com=prvs=458d1a855=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pmC3o-0002G8-Oj
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 11:21:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f77e551e-d85a-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 13:21:14 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Apr 2023 07:21:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM8PR03MB6229.namprd03.prod.outlook.com (2603:10b6:8:24::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.34; Tue, 11 Apr 2023 11:21:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 11:21:08 +0000
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
X-Inumbo-ID: f77e551e-d85a-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681212074;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xv3mdbnecSply7SEWRhsOO1AtD/e1KmcibV1xhGs/Ho=;
  b=TVs12RONVfH/f6QThQ30ixMlr4zHUWWaLpJYAqtruPEqZTytrc0bt3O3
   y3IcB34ZQjs96UXs+sPcq6CY/qYc8Xyj3Zs7NkzCuGnVrsEq5z8h8cM1W
   ALhCdpgAQYfSS8Y/XVHQmGGZ3OXcOLYf7/lYtm4b1mKwfVkEhj6u/77Oq
   o=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 105088851
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GpgvPqkkyEbcy2VIO7nafd3o5gxMJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXWGBMquCNmr2ct1/adu19U0C68eBy4BhGwA4rSE3QiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgX5QaGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 d0CbzcRPzPdvt31zLbiTcNBqcpzIPC+aevzulk4pd3YJdAPZMmZBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkV03ieewWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTODgpq463QT7Kmo7ORwmcWCJoN+ArGGZVtRTK
 1EbpiQrhP1nnKCsZpynN/Gim1afvxsbXfJRFfM78wCHzqfI4wefCXMARzQHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTSoNVw4M+dTgiIA1kBPUT9xnHbK1j9v6AjX5y
 XaBqy1WulkIpcsC1qH+8VWZhTup/8LNVlRsuViRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGe0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:SaC0SqgUzNIaoS31RKTXaRtKvnBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.98,336,1673931600"; 
   d="scan'208";a="105088851"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECABTnGxn/BCHjXlOaT3EWISMacfPIgxb+i3A1QgYV8aA769SsNyobmuXPn5yTieO62GErYSTUPrgL7QipEEpIWaue5AF6znshNaWpBx6uT4CNuMvCdpNmSKdMHABjUmUAgssAZXYCsTfvZYw5IExzRMQUuO31zIoevNresstLXFT6+ABGehg/Cm78Os4hp8kWPqqIRChXe9Ky06T+4DMIXf1lHtywQkgEvquERMXmTthOdXYLrahBjDgVGwN+vXnnKaSs/Q6gR4tthftzox2TOQfuprnnIY7R4j5XtS04G7c/yjLETdJGxq67IKTJx0xLi0RmV1gmF13N12i0g9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mF6vPimqJVDHjhK2HcaQdB5HMWxQvcp8sa26GFl1IT8=;
 b=nwMpN3Vue2OrrBlrwiyHrx0tJzsSQNgy9H4dsdUll1u41EJ6JCIcDnpY+Ix5Q1O5kVEtT4xJ+CmBUIznLMG09IXc/aCLK3dX7SEdiSclP+MJew5YzpcxgGI7bLaBH9XxGL1LS107vy7v4zA8AqemFUStGz71WH3YszUdAFzqDm/c2BUcUNqhDisOyF7j2q9h1eEIKgxEAumAUh6TBi4tnjd6GXJRVYfvlOuCMFt5zDDe3OPb8WmaXZj+ycLnvM+Cdb5aN81e2sLzywI1ORXXJcJXaDwMbRhd6QatDtp3MZh+LgbtN6YAX6GG9GyKo0+3EZFy72YlzHC+HrRx5pxuXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mF6vPimqJVDHjhK2HcaQdB5HMWxQvcp8sa26GFl1IT8=;
 b=tTugQdwpMLyAP33XThmMHWOqaYkKhe36SGPnGeazXeagfU77f2WWTvDZ81FpnkQJyRvRiurPxTzIORpHj/O2zYLDW24WJOUifl0qT39NxOTlSL08S4VQ3poBS53oH2h+YOwmZykvF6QwRm+ZNC2eyleLaBJbDyy1UAWLIh2X/7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0ac3fce6-dcd2-4521-6207-ede4d90e656b@citrix.com>
Date: Tue, 11 Apr 2023 12:20:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: RFC: disable HPET legacy mode after timer check
Content-Language: en-GB
To: Simon Gaiser <simon@invisiblethingslab.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0680.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM8PR03MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: 03dd4f92-6424-4dd0-684e-08db3a7ed8cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SuzMyLDS4eHsXMH3BBSem+AyVe2EJ8Z73W3t6VTfFKixo8yGhQF1DEl/6NmoyQSj7HilNfTAxoatwHeYAMG1oXCfO0d3U8ufuECk72qjAFsnEe1xC304zoBqc4a0dk5LmdavHjRUS+Vqckd7YO/kBWxUhusHr+FPL/yc2Ue0uLWXhMgGqNkprXcdosL5uN0T5h74Ey3I/flMPW+Dn5BtviAUGuhpGN/AiYBUy8IWi0bb5GPORks1QvBQOhDM720/XZR7ryurHvV9f1/ULKoqPDJcjSpeQ9hRIyV98kv+h/ibK8gKRZyALt1I6p5+xyNvtgwT2CwMNEeXXNyIYm1KpvewEM4T9ql28jdy6CtZS6zc+fuEGpunXAwTvCgDqQoK7wvxUh0bms4y8B5PClbdhLtF56C5xROFgJZ1PVOvx6dmABMPkcjLpXQPTipTVn06wqEQ2NU+cWjx8TBt6ouAHFNMtrQzFl3IwhK0+txktn3+RRDFGSquwODCtl60gTkFFcAzzzK5tuBc3inlBHietX4CMe5BQriccb5HETCImQ94vDL5NwwNSIK/YkJHD+94ovmm6h/BrWcyFYO2EXV3R+cCXu3aDt5rRhQ+v4Vc7EYrC4raF7A4Tsm79tyo+bNvGLOVNCqt/w/ZsH5VrBS9Jg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199021)(86362001)(31696002)(36756003)(53546011)(6512007)(6506007)(26005)(186003)(6666004)(2906002)(2616005)(478600001)(4326008)(66476007)(316002)(6486002)(8676002)(66946007)(31686004)(110136005)(41300700001)(5660300002)(8936002)(83380400001)(66556008)(38100700002)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djRtWGdkQzR6U1RuVWJ0Vlpyc3RTWUJBWHh2WHcyZ05KUm9QNWRjL1RITG9k?=
 =?utf-8?B?dVlnanRhRzNmNXFjaUF4bnF4a1dlcVFoYk9qSWR0L2p0d1R5WXNhYjBUalBX?=
 =?utf-8?B?RzRnZDNtdFpEbnB6dWdpVFlxWkVLMjJIclRYVTFEMFgrMmE5S0t0aTVsM0x2?=
 =?utf-8?B?LzFycFBLVFU3c3FNelFsZlNQb3BVb2F3WGFPa3pSWGNjRjZjbWlscm5ucWlT?=
 =?utf-8?B?bmJpQ0JNUUprUnhldDYvUDRDUm9LSDcrOTIzMjh5ZzQ3OExZV2dwSDkrbEtC?=
 =?utf-8?B?NGQ0Y1BHcVFjNUlsVmVSRUZBWGZjTHJTR1A0bnNSeTAvVnNPNkcyaGxHbGdh?=
 =?utf-8?B?U2IzQ2pMVW9JYnNCT0pEbkc4SkNIUEwrVnEwSzJXeXlwcmo5SmZ1a1lUUm0v?=
 =?utf-8?B?d2EvS1FNWnE5dytFRXJQOGZMZTFKRXBHcnFHbG45dXVMRHhpdHN4elNBd3hC?=
 =?utf-8?B?N290SE1MQVQ2b2M4ZHlUNkZOQThNdDJ5dkVQUWF1RW5sWmRWMzNDbjg1TFZk?=
 =?utf-8?B?ZkZoc0xKeDlwdGE3NnlhMU5xZ1IvSWJ1eGc2ZVRoSEhrODREVjBNSEo0NWlE?=
 =?utf-8?B?d0hPc2FOaVl3RVlIMC9PN2djeXZrQjhtVy92ekFOd2UrUGxnZHNDOWowWUZo?=
 =?utf-8?B?dkZFN0xCQVgycTl1OUkxVUdWQ2VtdWljSkEzaXh4dWM2dHBibmVXeXYrenk1?=
 =?utf-8?B?UjBwcnU4ZHJQUFdQVHc4MXhRbVVYbyttVEtpZlA1bTZVUUlFTjMyY3hDM3g4?=
 =?utf-8?B?QzVIa2VrYUZYY0t0bEpEczBYM2tYSnUwaGhjZGtrQWZuQ1pCKzZhZEVsMVFh?=
 =?utf-8?B?VURBWXU4bUdGTlBSRWVydmpEeUJsbklCODZUbnQyVE5vc2xtM2JMNG8zZjNh?=
 =?utf-8?B?MENJelBxSXdvWWx1bTRLVHgvN1RXL0lLVG1HMGZJbmxOczVKNGZJQmx4c0ZV?=
 =?utf-8?B?VlE2MnUvMjQwcDc2ZTVkaVhBUEUyZ2lSbXBSYzhxaXVRaFVsWGwwbEFreHZC?=
 =?utf-8?B?czF4Zlg5bEdSazdHZG11RmlGZTV6WEE3RVcwT0xQSEk4UWMvdkFnejdjdHNH?=
 =?utf-8?B?bk5WZHlETFNyTEJBLzY1QlYzRGtkeXExZDk1WUJVUFJTQU41V3JpamhJV1dF?=
 =?utf-8?B?dXFvRzRtK3I1RFdYTlpxdzMvc0lwcitLeFZWSytNcWwwME13NjUxUFRQKzJF?=
 =?utf-8?B?UTdVcEduL0IrV0dUYlB6LzV6QVFiY1lkRTg4WVpjZlhRL1VrTFZEcVEwaWR6?=
 =?utf-8?B?blVWMGlGdDV4dkdhVGwxV2xPTlg0M05YVU45R2Z3VXpwaGc4SUZMb3gvWStH?=
 =?utf-8?B?SXhjVDI0OVRUL2h2K2xNaytOazZWbkFJWkRqMkRCWWtUQUVZZEpMSGhORVlo?=
 =?utf-8?B?RWg2Z2ZIUmRQMUNZdk4rdlB0NFdxY1RzdHkxRjJsbFp5bEhSNUU2U0JsRnZX?=
 =?utf-8?B?OXpuVUZUZUJpL01HRHY0a2RGRkIwNWp0YktlUmZSbHp6eEpVcG85SXdkcFQ4?=
 =?utf-8?B?cGg4T0VkL040L1drU010eDZkNk1zVjExUGYzdXg4MklBVzBCSy9BcWVzbnlz?=
 =?utf-8?B?WmYzQTRkNTd6OE8zMlVaVnJQU3NoaU1SeTBTa0dLNEtPQmxiZ3BVZERCbjRr?=
 =?utf-8?B?a0RxSnd3NDlRQXY4UnE2ZVp3aGhrbW15Z3hwU2JkeVNjbURramtzYmxYU1NO?=
 =?utf-8?B?TDUxUEtybUhwdEJVNzl6bDQ1Mm40OEtkNVcrakFlelBJRlcvTVpLdk1VSGkz?=
 =?utf-8?B?QldxUXdPdXpSVVNKRkhUNzFkMmdScW9sdk9VamRrTENVWmU2UGl2bWFER1Zn?=
 =?utf-8?B?cjRIZjBiay9WUjRaczJDd1d6Z1Z0UEhpWS9lRURJOFZGbkM4TVFSN1dPYk03?=
 =?utf-8?B?YlhoMTB5dXkrSG9PN0NRWVBjbVBybUlVN214V2N5bFQ5M1JhNjJVeEMveDNo?=
 =?utf-8?B?Y25ScTJUY3d4Q0R2cmZ0dXVLa1E0RWpBcjFWNHhFOWs1WE5TSmd1dlVBbFQz?=
 =?utf-8?B?czQ2QkVka1dibi9WNndQWWU4czJxZ3l5M2lvRGloMGV5T3dZM0IrWjFPQ2dI?=
 =?utf-8?B?L1Q3OVQrN3J4c0ZTK01pY3AyS0h6a2F2QW1ybnUzS0xqN0ZTU3lNaDNkdGRD?=
 =?utf-8?B?QzJsVEtWK0ZYS3dFZGU3WS9wWUR1QllLTTN5eEhnREdrRU5rUEVuc2F5UTJT?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K5pixMSOq2MOuqbrnZDyvBMa90SPZzvEhxnsalIHOaDMzi2RXTd4sRv1FUYu3NP97Te2M6BgV81WP8ApATdPGCoxbo0BNgFh62b8XoLDhWzjtKTBivy/rzz27HhyKRTJVh88hykUyw1SJtNSYE4OjZX8XRp6X+nTwTwVbpMcrjqX5biqnNZfr8HFSxnyKj8V5igCEJ/gOoD5h3haspwJxmQte2yOngUBN4ASYQp2zyElTU/CuCKJ18oUourkcWtovdewbedvOzkraw+4bSus8R7fwXvnXuRUF8N19w6OAL7Sshqm1IixCwk/asKPn+KQUFbiEd9v3Co1+YqkE8jhCwJ0rRxTXzEejsqooBQ9z59/FML7ZU6m2qFUQ+JfyIq3QOBH/oA3KJQbwFaKtFr6+6MUGFUUjbZsCINZb9m36yxF8Hwh59V76wGQ7hnK4nSLTtuRNbDRujUzRRByY4KIvfEddFSl7SwS3nFggsvshd5B77R1m9eKRVvFlQP/d/bDbQAO5u+WrJKJw86c+0OWyxZ8+XSkZThk/XQg21t492Weus0W1YmYi+soxWDMEbOMwZY1NzBiDj9ov/ZhSuTu3bJRNU0retbZleF7QPfAC9yGH8HZ8H6e+FbHJ4C8fRbkHxwIQIXQIg03l8me7nRAEQWeAMYj07XYeMrrnq1CUvE1fZrSRam6VLnBVhtafdyfGnURrAXw4JH4nuFXmNjM8LG8bnLNCgLL8PcjrLWRX6sHITc2D1pXeaoJ00Iz546oQfX4uw1SFH4qsNdpVQD5NgRVuVgvrshToL5v8o297MHzimrJ8zj7ENEVqzQDxvlLahfOWPo3qf9gEEDOPzgUGw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03dd4f92-6424-4dd0-684e-08db3a7ed8cc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 11:21:08.3674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXRyY/d1FOnC5J8q/+2tF6CwxMHpSnR9th5E1JS8mjs+z0QF5eTf2SoikSBmS6in4708SomZgh7Pu6kGx0B3t0Ifz1qR/W6E/bFNVh/i/6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6229

On 11/04/2023 11:30 am, Simon Gaiser wrote:
> Hi,
>
> I have been recently looking into getting S0ix working on Xen [1].
>
> Thanks to a tip from Andrew I found that the HPET legacy mode was
> preventing my test system from reaching a package C-state lower than PC7
> and thereby also preventing S0ix residency.
>
> For testing I simply modified check_timer() to disable it again after it
> checked the timer irq:
>
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1966,6 +1969,8 @@ static void __init check_timer(void)
>  
>              if ( timer_irq_works() )
>              {
> +                hpet_disable_legacy_replacement_mode();
>                  local_irq_restore(flags);
>                  return;
>              }
>
>
> With this [2] I'm able to reach S0ix residency for some time and for short
> periods the systems power consumption goes down to the same level as with
> native Linux!

Excellent progress!

> It reaches low power states only for a fraction of the suspend to idle
> time, so something still makes the CPU/chipset think it should leave the
> low power mode, but that's another topic.

Do you have any further info here?  There are a range of possibilities,
from excess timers in Xen (e.g. PV guests default to a 100Hz timer even
though no guests actually want it AFAICT), or the 1s TSC rendezvous
(which isn't actually needed on modern systems), all the way to the
platform devices not entering d3hot.

>
> I tried to understand how all the timer code interacts with disabling
> the legacy mode. I think it only would break cpuidle if X86_FEATURE_ARAT
> is not available (Which is available on my test system and indeed I
> didn't run into obvious breakage). 
>
> Is this (disabled PIT && !ARAT) a configuration that exists (and needs
> to be supported)?
>
> Did I miss something else? (Very much possible, given that this is way
> above my existing experience with X86 and Xen internals.)

Xen's code is a mess and needs an overhaul.

Right now, we're using the timer as "a source of interrupts" to try and
check that we've got things set up suitably.  But this doesn't need to
be the PIT, or a timer at all - it just needs to be "an interrupt coming
in from the platform".

Furthermore, there will soon be client platforms with no PIT/HPET/etc at
all.  (HPET is known broken in <PC7, and not used these days anyway in
order to get deeper sleep working), so this logic is going to explode on
us yet again.

AFAICT moving forwards, the expectation is to use TSCs as the
clocksource, and the deadline timer for interrupts.

~Andrew

