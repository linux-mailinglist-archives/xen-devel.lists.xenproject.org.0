Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20756BAC77
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 10:45:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510001.786882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNhA-0002hm-BI; Wed, 15 Mar 2023 09:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510001.786882; Wed, 15 Mar 2023 09:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNhA-0002fJ-8T; Wed, 15 Mar 2023 09:45:20 +0000
Received: by outflank-mailman (input) for mailman id 510001;
 Wed, 15 Mar 2023 09:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DN/u=7H=citrix.com=prvs=431ad58dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pcNh8-0002f6-Jg
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 09:45:18 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1532999a-c316-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 10:45:15 +0100 (CET)
Received: from mail-dm3nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 05:45:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5655.namprd03.prod.outlook.com (2603:10b6:5:2c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 09:45:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 09:45:08 +0000
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
X-Inumbo-ID: 1532999a-c316-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678873515;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SBxIoWzt8NIVTLrvW4KLHqb/vkRmEjiCqV7Czk28Eqo=;
  b=X7g7YgW4kHWK/UU08IbfqF7+yfXpNng4CrkmegBZ5Wt5QNn9dY9Mjc4z
   xVUTTb5fqg3PyLrwBm2vdGDQqPvicOWKMsySt3eM4ov/q9cEwb1wmMea8
   5MzwD/UhZ+0GVBi36+SW1FYCx32P5DkJWurfsl1boIGK0baoxHnX/p7S4
   k=;
X-IronPort-RemoteIP: 104.47.56.46
X-IronPort-MID: 100926176
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:F3IHQaCJd3eSNRVW/+Piw5YqxClBgxIJ4kV8jS/XYbTApDgj0WAFz
 GRKCD/Qb67Zazf2Ld4lPIvgp0tSuMfWzYAyQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhB4wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwvaFNOEhq1
 +4iMBsBZxOqm+CJzry3Y7w57igjBJGD0II3nFhFlWucIdN9BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xrvQA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37eXzHmlAd1MfFG+3sIy2nmvxF4MMjxMaHmQjf+UrnCbevsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsqCRSH+b3qeZq3W1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWulkIpcsC1qH+8VWchTup/sLNVlRtuluRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGS0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:Kf+ita/GAxx4inV8ePFuk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="100926176"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ix8RW+jBelINGae1odD5mUp7K5Y9Hq5dhTnMt66YiEwkzsfmrRKqn5UhDuj2N/qLNfiIGq+id3Fp5vUASm+i93JDSibpYOZoxf8fTOTjozQfPzoYOgVueGCth5AOur0B85JxFcqCiFMVJg3pAE2fyy524piKQrQkUPxlVdwEWQkpmEKcs3S3aWpAGs7EWYKqKrtXgyGsYnpSE78GIqmU/GOWLe5VDPH/IM2+JqrKdgJ4OFw9d12x724FI4zNMpzacgZsgzmSf8nzfkXsDqUqe1N5nuA7XT6h1gl2Tm71S2f0Z7i1h7spPoJtL+UFCllxNdwK41+WKoWpUEcJP32P7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBxIoWzt8NIVTLrvW4KLHqb/vkRmEjiCqV7Czk28Eqo=;
 b=nCrCNqYpfkxMRV38kExFXRdQWQu4L0xS3qCZ2hHmuiM8MxJY7f92utbVaSHctN1qbL9Hp6X9WC0MBLNMZ3Q9yVjWcsHTqgQZtfIYNjm4U1lO871cLYOykjWz9zYYfbwsETEmxwiBoemN1DNOJa8xjL1gc/t+wzFDJjtz8Vm6yp+9AFeNFngQAHJzP03g/HrLwAVWr8vUiEfRotrCcrY/BFBgyA4TUOu438kLS5TKAgrvdPToktYBig9aCFo5vz66Pg/KOfEORXKlgwBNHI7GdcARWaPVTaneOYggQYITo3a2gttJOJzTxQNZI0QWytsDtZZbS+LdSqgSNd669Kp1Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBxIoWzt8NIVTLrvW4KLHqb/vkRmEjiCqV7Czk28Eqo=;
 b=dzH4QpbohsHPSZghuf8QE6mEurhturgLfxpaHrco2m8RfEcvSJOZz9ORygTgFE8Zgam7NoNa6vQEvJ3LPynyH45xq/iHRW+/j33XGaHq1Tbt+fWzMeTIc9TFFT/NMYG5ddS21MJHpGxqRQcSsZYD8N0jEBylMvXo54MJR6ccU5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c1d4822d-ff74-e12b-82bb-13ffbe6a6122@citrix.com>
Date: Wed, 15 Mar 2023 09:45:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] console: use more appropriate domain RCU-locking function
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <c5aab97e-08d8-c5fb-0898-6f414fdd7a25@suse.com>
In-Reply-To: <c5aab97e-08d8-c5fb-0898-6f414fdd7a25@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5655:EE_
X-MS-Office365-Filtering-Correlation-Id: 827a8de3-85ca-4e9b-929c-08db2539f671
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cK+jnXGlPvR8Iw4fix99DAi9V54QtVYSmc5VlybA6B8TW4B2F/h4EPaPGhDULMjkZb6saZhHMwEMBjdUZbUPMaMfQnqJVG+aErPKnXOrmaeCby9JANtvcHbzZtiWtpsCbIsSm5thh2xFCMKOdyBUgyT2gH1l+5re/+oDhsEmP/sEuPJhrBBCaMkRyul9BXPq2XQpnNTjcRoeffTwqtKRKm9QP6w19HwzN/fMStYLXrjgIbIPq9RRd7g01XtUeWSRFNBbOtREnCLChgACGd6rQ2gaM70HqHslvLA2wI9tZy3wNFKTdQT7j4K00Ra5tcVQ0uIVFI4J84gVG/DkHmhbbly6nChdDWwqHuAVVeju2GWYb0wDM6OfA0J2pfR+ByZStBXxH8Vc00MT0ez4NwPEmg0dPAs9M2HnoyHEENxMasVmb167qPdaSLF/ymU7Du90adzJ13VICNVun7IqxInkQOaQF5ev6rE7CljwVNWy/qUVQbcr60JGoncuQHIr42OnqYptvloQZl55dkhPBKJ58U6VXhjK2vfvo6cgxDBctDhxnMzbtSimuq8nI8m4UJvvvtCw1Luq843Tdv9MbTSJGO3Kr/CsUJ729j/zj6GHrDUPN8WLGNuGKbUXx6TguFCBjx4wqVHC44/FAcOm7XwE5g1ZgNiFN06323MWeh4KLrniQ8SWfQtS3lVJ7+uEFeX5WO77S4U4LSYYzs8ui5uWuz11zcGJjPs5iOrjbcnIUOk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199018)(478600001)(83380400001)(186003)(6666004)(6486002)(8676002)(2616005)(6512007)(6506007)(53546011)(110136005)(54906003)(66946007)(316002)(31686004)(26005)(66899018)(66476007)(66556008)(4326008)(41300700001)(8936002)(4744005)(5660300002)(38100700002)(82960400001)(2906002)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnB2SnBxeUpQZkdDbGRrWHNWTkxGWENTM2c1UmxxUnE5NGEycVNlYmVFWGMx?=
 =?utf-8?B?UUw0djdMcDJBM2E1dTYrUVVHQVJOY0NXbFF5VU8wUFpINFZ3T0lNYm1NSHY3?=
 =?utf-8?B?bkhGdHJTeG1ZTzRwd1lPVEdSMDRlY1VXajN6TnBsTFVJTUplMDVSdGZCWlBQ?=
 =?utf-8?B?MnlCVEg1WWhXT1BxUWlGV2I1VjFiK3ZHNDc4bElyWmxyNDMvOEhqaEJVQm00?=
 =?utf-8?B?NHlVV09HbUhGMXZmZzhMSUpjS1hVanlBSGFjaWw3UmF5aGtxNnRtMUthUWVS?=
 =?utf-8?B?dXk3YmgyV0hyc1dlYWFBTUFOcTliTHcwNndxRVA1R3NnOUNSMHJCbWJxOUlS?=
 =?utf-8?B?bTVVQk1WZWpwcGs2N0gwVnd3b2NGTWt0T2lYS2RWZzcyOFlFTW1FQS9tcmRt?=
 =?utf-8?B?RTd0VTNPMHFvZTJtNE9LZ3ZoK0hscGpVem5wOTBibGRab1lsQldBeXRaVm1O?=
 =?utf-8?B?NEplRkRBc0thclV1UTIwL2hzWFBRdmRVNG1SamhSdjdQQmxWeGFHb3k3NXBW?=
 =?utf-8?B?RzJFVlFZWC95c3NRZ0gzS0NCbHNrZ2tDVk0xM2c4bjBndERQU29PZjFQeFly?=
 =?utf-8?B?UGg4cm5iV2pzU0VRbUZwWmU5ck16MHF1NGF3Q2UvZTVaMlk4RGpqRzMyMjJO?=
 =?utf-8?B?SkJDZnVzWGV2UXY1cWptR0ZReS9DUmc0b2VZMElQd1BqVDF0eHhtQ3VwK2Er?=
 =?utf-8?B?azF2OGI3dzdrVmNmYVlMMHV2SVRjUmVjTVNBaXN3M2g4RWpCWk5SV3dNaW95?=
 =?utf-8?B?OFZrcGVDZDJhLy9ZZlpQU2xVVDZYM2hLMGdCYWlOUVVzRFZVM2hnc0FyZTJI?=
 =?utf-8?B?aXFoMFpNVXp2L1ZaSHFRaGE2R3E4dXIvQ2N0R3Mxd0xMRlFTaXpzL0V1Tm9O?=
 =?utf-8?B?SGR1T2l2RnMyMTFQbUc5cTdRR28xZHdpcWd1SEhZK01HYXBpUlFFVDR5MlZ0?=
 =?utf-8?B?aDRXTDdobnA4YjVEOTRhVWExLzNBdnB5WnhvY0dERUszenMwdFNrZXNZL25Y?=
 =?utf-8?B?UDFIYlRGWFAvY21scUI4aDlDdnBmS3lJSXcxeHJGcDYvdGVRaXhhMUhUd3JU?=
 =?utf-8?B?K2dxeElYcktaK0FHZGVSK2ZEdGZYaTcyWWFPaEFJdEd1NXhNSlFvZ1ZzTGhX?=
 =?utf-8?B?NmNJOE5oRmpWcVlGTnVzZ3ArNVdDTGNROXlERlZMRzZiT0JHOWtqWS93TUtv?=
 =?utf-8?B?aDc2SVlaNTJEQnhlc09YK2liY3RLNTJNWGNjSy9BcStld2RMdDlrSmdIUU5j?=
 =?utf-8?B?aXhtNHhMZXM2bUR5QUtuZWlGMlFtUlYybTEzcnZTbnZuMzYvdnpFL2JqSW5S?=
 =?utf-8?B?K1VNSlpJK1JOdUk2ajAwT0JaWHJMSSszVHVJTm93azhyaTF1emljcFVnZnVK?=
 =?utf-8?B?ZGJzUEJVWXdUQWpYRlFMR2NXbHN2U3BSdm5XODlrNGxidG5RL05IQmpkTEUz?=
 =?utf-8?B?ZGgveDdPY1o4STZJZXBsdWlaNlY5VmN0eW14MStoYVA0bW1MM3NFQnhleTY0?=
 =?utf-8?B?NjdJS3R0Sk55dTJIRzBaWEZiSGhaZllKeUJRaFVsRWlzZTh3SFhtL3VmdllI?=
 =?utf-8?B?d0YzamRKRXBOaDlYZmpULy9lUGU4T2hzQ1p2WkNPVk5aTW1NazZYQitEUUE0?=
 =?utf-8?B?cmxldnlveU0vN0RNSVZ4ZFZTS3F2MkduTHJwUUJCb1NwbWZCQ2Q4VjE4NkRk?=
 =?utf-8?B?bzVFRmJnRlFZN1ZaZ1I1N3dwcTIySXFzVi90TUcvSTEvVmZVcTJ3aVZVT1Vh?=
 =?utf-8?B?UFM1KzZKMGJmM1NOcm81dENjb2RDR25KQXF6Qy84VnlybjkvQUlma1hDRWFD?=
 =?utf-8?B?bXI4WU5HQVhqUDVlbHlKbENhTG11aGxmSUk2UDFOSzZUVmlsU1FhWVdNVUNE?=
 =?utf-8?B?MVAvMDdBMXpMZmRZMlRIbEFKSG83a2ZHVXZ5elZJd2txbnBBY2RNZ1hHeUpl?=
 =?utf-8?B?bVdHYWczcXp1dlZ1MkkybnpjUVhaTklnRW5FRmNBWS95L2hkdGhvRmJZQnNI?=
 =?utf-8?B?bWl5SlRnai8xT1A3RG1OU05aVWwwSmQ2QUVmUlQxRStUY215aDVGTW9kSFYr?=
 =?utf-8?B?WU51VUVBWWpKUTIxbFNYY0MxMG1IZFZGZWFNWHBVTXZTRGZiUm0vTkQvcDhR?=
 =?utf-8?B?NDRkbHk5WjFpZWxzcXNITGM3QldCTlIrekdjbkV0MVU3UlVibDlvSC95QjF4?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	N+NyhkJlIcoAI3fZQRsx9BzVcQQuUvSJHMDOpwAV6O5Zea4qL2hwy1OTuUTjrSdytDCHoor1v1kXSMcuJNkx8Hlp/I3obolqeHJXM5sxhVJcX4pGmylVBjvLA1XKEMmt4keqCA73Vkz9uBu2QYu2prfKgBNXhKdCHPI5iCCzY4E2UZPDXzwvkjJOQ0RcB71NVDFwlRFVBVQGIBs9wKpwCxb9muwMi8ha3KOgrroJLwlHVjb/xEWg/DlEjnFrThlBNFOdXLY8E6gxXjxXtZvAv5Y4anSAbW/QXp007SXe5rkXdy/G1ZRm3irjJH2UCsZ1KH10hOOOMvIdMAF/e5LjIqZGHPpNi9kg8bL5wKKMDhYQsdj21n2xBVA9JOgGG/SW6eyYzsa16Vz4jrb9ZhOWLELsZwBLo87hMHlAKI9udk5XYSl7HcIQbl8Xe+CEHAujDCJ0ODNCgizm+IH24YPdJLDXT9SHqS3ruprbMtrNUYVB95Ee+CWg9tgJKY5/RmMEmbZWrMrQXUv6I/XSF1GjD2YiBfaTSvms2WAGB+eoNXaK5ltdKLEMioWTClGDBGPFIbUEAAJd037B3IpO+JbXn8qTVGbpy5y5dRa9V+WLwxyeWuI7W0gT5QSqKd1Yn9tO5hSzr3eazQELIOkOdvyKISdUpdTKnV9DuAe4NdlZSd0oI/l4WIXNs/aML++w/xXBgroX6zq90JMuIfkdQEFxkVepOdU7OsG4EsveQvORIL6r2EKtSOUmDHGUZwpzNkMqwb3mMCRCfOpQv5Hcppmy1TXorSMD0q42wA31Tca96OZy3g8wMCXGZG/pI75l7BEBSDm3ZOTJuHa+63iTVNlEVngL1vbeaImHaCcgbQwgKKc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827a8de3-85ca-4e9b-929c-08db2539f671
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 09:45:08.3715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIYI+SVC/KKzUgW1val8JK+JGnTlBgTWcu/R42YzjtmTpehl9WSS31qkQLkd4fmhnkG0k40ki2+vWxBIYu579wib7HXEXwhkd8y3oiax8Ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5655

On 15/03/2023 7:24 am, Jan Beulich wrote:
> While both 19afff14b4cb ("xen: support console_switching between Dom0
> and DomUs on ARM") and 1ee1e4b0d1ff ("xen/arm: Allow vpl011 to be used
> by DomU") were part of the same series (iirc), the latter correctly used
> rcu_lock_domain_by_id() in console_input_domain(), whereas the former
> for some reason used rcu_lock_domain_by_any_id() instead, despite that
> code only kind of open-coding console_input_domain(). There's no point
> here to deal with DOMID_SELF, which is the sole difference between the
> two functions.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

