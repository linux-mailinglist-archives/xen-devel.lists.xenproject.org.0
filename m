Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70E2697DF0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 14:56:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496009.766510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSIGo-0000LE-Ct; Wed, 15 Feb 2023 13:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496009.766510; Wed, 15 Feb 2023 13:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSIGo-0000JC-9D; Wed, 15 Feb 2023 13:56:26 +0000
Received: by outflank-mailman (input) for mailman id 496009;
 Wed, 15 Feb 2023 13:56:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCKc=6L=citrix.com=prvs=4036dcf8d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSIGn-0000It-4z
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 13:56:25 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87095909-ad38-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 14:56:23 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 08:56:19 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5626.namprd03.prod.outlook.com (2603:10b6:806:ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Wed, 15 Feb
 2023 13:56:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 13:56:17 +0000
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
X-Inumbo-ID: 87095909-ad38-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676469383;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MeVFzpZy/LNP8iYP9g7DXTA8coJr3MPZzccw5aonJ9c=;
  b=bULCm1vhXumOVgAxOLoY/+mlLFypcfqgHsDR0DgUlhIlE+t+Zdju2dbW
   0U0EUsAhcDAak78i/Dja1A7zJjDO8t8/oogiXSd2oXXOtzhdmXDz76jjF
   2ChKperHnfBmUcB/dx2urbckmK8zYJxEGywQZQIVBTtwtnhvzYcnRJvVa
   Y=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 99563824
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DfFJYaBeLv+4ShVW/xniw5YqxClBgxIJ4kV8jS/XYbTApGkl1TMDy
 WVNXG+CO/uDYmP2fth/PN6x9kMCu5LSzd5lQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlB4wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw491pDjt23
 NIhGDUHfyyspMLmh7KiVbw57igjBJGD0II3nFhFlGicJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuvTi7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6ewH2gCNhOfFG+3rlsjFPC1EUBNCI5U0GH/PboixbhRvsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluaISEIKUcSaClCShEKi+QPu6k2hxPLC9xlQKi8i4SsHSmqm
 m7a6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHY1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:sTiMwa6mNL/OImhr3wPXwNnXdLJyesId70hD6qkRc3Fom6mj/K
 qTdZsgpHzJYUkqKRMdcLy7VpVoIkmxyXcW2+ks1N6ZNWHbUQCTQ72Kg7GC/9ToIVyaytJg
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="99563824"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLj4iyq0LBD4RAu+8LNFl4l7NjGEfJciWll92fhSEYJS4JuYKtH2vxAjT10XuWqitJKo2Zl5uS/0h/QCOY0jLr1cWjSgvdnVrV0fsbrP6RxcK0BxkyqtW/qLh+3AlCgTIW0JhbzFmeCu4VbSBuEr/nd7ZoALeHPxJz/Nm51nDX/OzpZYFAAqCmE28bfikFfxWzCqklzLhGYtXl9OdxAt5kA3RVXn7/gW6XkGYPnnDCIr02eJiOAob2l1V6D/LxjJdGzNE1Y4Z0MsJdPf1UVCV43zO37dq/jbvbf6hA1gZcsTzNOVIDyez25f/uC7AagDap4YsgJmKrWSwHsUgfVtbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeVFzpZy/LNP8iYP9g7DXTA8coJr3MPZzccw5aonJ9c=;
 b=kkjPwK2srJvlvTuFuKyDUo+az1NbFqr5KH//yZSjnN9I7rcl+u5oVMSFTvYD/EFmAi2MDLzYaCSqEyZ20ymRSE/kaR0ttvLNozFMxye4/MF+Ov1pgYOO24uKjhd7lPTqRzYXa5u6ANgytN8P9NiibXpwxuvAnYU23vZeovxgizv8p5fHTM+yuymrtVfM3syFV9H00DkjNPOwvudRAOIwZcsc+9KkowgokHsO/cLZvh81Qp3HIL8SNa1WUlByo5VpPULrflKCcOqm4eycv5gziD1y5Z5ivzagmTTe1y5x8TkdI5kLugg6M5VWEmKA38FW5KemW8uAZmzSDf/QHQkNFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeVFzpZy/LNP8iYP9g7DXTA8coJr3MPZzccw5aonJ9c=;
 b=vpXNqeu67RxEeMx3ACoTe2VfiFePWz6ubcA6sS9PTM7lQkFzRQulcPHj5BUn+CdTyAbJHDnHIDNiGaHAccDFCnDClpVAwaZuZpaqYXocd+T5miG/VNJbgHIgB+c3i8am+Ps6tydez/c5ByM2G9dcx+WqpxRDxqqq0Fg1/kg8dzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7da2e181-8d2c-acf6-0662-36d028cd098b@citrix.com>
Date: Wed, 15 Feb 2023 13:56:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/6] x86/Hyper-V: use standard C types in hyperv-tlfs.h
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
 <f62c157f-b4ed-6bb5-9862-992d8b881bff@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f62c157f-b4ed-6bb5-9862-992d8b881bff@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0346.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA0PR03MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: ad16d59a-32d6-42a5-758a-08db0f5c68a2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MSHwg/OXjayxQ84Y8nTTNCKM96+/TXYg3pUHw+49JFhwD957+EDW9DtcWVBAIbmt7m0PyrW6mmi7hTcu+pxRf5wEmJCTL9BcjLKfIwpNrQqiKQDYQpVGejdPYVi2ksGGhDsCh/6HJ070dRAzXvu6czYfId/Eg4OUlC6ulCJwicACChgw8IR2vdRemb0QCOwAZUWwrwBmUTrr4FrAmyYDR1e00T2t4cKHmH7YZeoRTp91mETKYdsO2Xjg1QcDSZkhD/BkqeneQXHrQ8X9S6pwrzaL6qdk/TLAHYDI4taYmeICZkA/vULL7xERRa0TWoDTcRGSaR4pUuHcJQN9OLBiC83l2271BFc3BYhkBwTI7GhfgSVTV3KPwmLfzDBGSNhGrKCq0COPgL35m0w5ZvLae5AF/XyWibGVCl/j5o9MgllsI079mGuL2DQ15B637noV2PFzGAGfbQkfJil2zLc4mvXf3PIGCHSfw4IC5LfLsy1Vt2HK1DYQsK0h7/L2ML0l2zZESoE7m38l44cCI2jzBJYXQ5oi1jEBSFNXamTBGMu8Wl85kH8NEBVVP9N3MGDqsHp6oSK2+Ch8e+NomF/PzBnOztZMawivFy791GrZf7k9HWbW2GMAttUretCu19b2GAdAVCIBMtCSnnucxbCy38QgOP44Jadls90lsgAROgddvBljS0kxxBoVbwp5xYo+RQAt9fZgTU4JEPv+rkYIsMoX+9tcBMTs8yId/dhZkuA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199018)(4744005)(5660300002)(36756003)(2906002)(186003)(82960400001)(66476007)(53546011)(6512007)(26005)(2616005)(8936002)(8676002)(4326008)(38100700002)(54906003)(316002)(66946007)(478600001)(31696002)(6666004)(6506007)(41300700001)(86362001)(31686004)(6486002)(66556008)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUdHZnBPcTJxdkxwbE9GdWhEV3kwQzVLL3RuM0RSZ2NJQmhObXNDV2lEN01i?=
 =?utf-8?B?TEs3dUc5VUVsNVFpb2F5MnNiWFJESjVsQkp4Q3JlNlhvMWljTnVGNjlBT2Fn?=
 =?utf-8?B?UHV2aFF3a21FT3Nueng2Mm56VGhKVUZ1dFZmL0J4YlUxbm1Hc0xPMTlYTVhy?=
 =?utf-8?B?QXdKMllQeWNNd3lHS0M3bDZWMkcyTUF3bDhoYThqSTFaczA0a1FEMEd5WmZL?=
 =?utf-8?B?ejFZYncvdWlyVWdzMkttWW93OVpvMElxeWt2VWRMNElJSnNSajBVSkVhalFk?=
 =?utf-8?B?dTBvRDNQZGtncXFMNHdCRkgvWkI3WlRSOVZkR0V4alYvSnJ3L2dSRVZFQmRC?=
 =?utf-8?B?Q0hBbUJZOHBTYm5kRk9VSG1QbXZkM1dUQmFUM2l1dGRhVmlra0laWUVMaGRE?=
 =?utf-8?B?L1dsTnZpNGVjTWhJMTR3NEphcjNObW9BVGZtU1ZtYXd6OWpvTnM1U0tpUmpN?=
 =?utf-8?B?U3JHRUV1blhiU3ZvL0tNMDAvUUUzeEU5RXBJQjcyQ2REelJBaFFWTGdHK29r?=
 =?utf-8?B?clJiVXRCdC9NWXJUUlAyT2MzRHNudzVXZnQrb1Z5eVdUWTlLVmdyaml3b3hQ?=
 =?utf-8?B?M0ZZMm9OWWZGb1RDK3JybFR5TzVEVmY2TjJOV3pKMyt0RHN4TU00ajRadGtW?=
 =?utf-8?B?bTZuVmRUbUcydXhkblZLRmQ0L1phbXUrMGlCcnBnK0dFMURvUzRlcnFhSTkw?=
 =?utf-8?B?SUc1WU9oUERLTmNDeW1jdkg4MEo2SVNJTVgwb1VDb1d3dUxPNWJ4b0Nuc2lm?=
 =?utf-8?B?RTUydEwvQ0JESGxlaGRJRHRqYUxaVldjdlA2OXo0ZTNFWjJENXpXWTBpSVhT?=
 =?utf-8?B?L05CQmZHdFB6R1A2Nld6VTFvZVVOZ0NEVHVSS2lxU1kvcDlyNVorZWdoMVhq?=
 =?utf-8?B?eTZCNytFZGV2UnNiOGFSQnBmVU9mR2h5SWFaVUpBR3BQaFZSZUZ3bFQrVm9T?=
 =?utf-8?B?eENQTlB2NUlHdXdsWjdOKzhacTFhNTZoaHRsWG5VTmo2VVNRdjZjS1J2YnFO?=
 =?utf-8?B?WnRpbTNOcEpJTmJjSGJvbHR0TCtmUmZva2JhZ1NYQmFuVFlBVlB5K2MrVk01?=
 =?utf-8?B?ekwzSEtYQjBhdjkxcGhaa2ViZ1FFY25ucWk0TTlZcjhteWt3TUFPM24wUHFn?=
 =?utf-8?B?SU1xczBGTXZwUGgvSS9pdUk0SEhKYndyN29Oc2JLMEZEcUVGN3R1d2dzc3Vn?=
 =?utf-8?B?VnZSa2kyVUVSSENkL2h1dHoxMVp5dUpTOUJTN1pYNzJqOGFzcHpEQVArRTlM?=
 =?utf-8?B?MU1KOCtXUldmSm45R3lsTTJpbDFlakRDOFpwZkdaalRpS1VWOHRTVmQxZStz?=
 =?utf-8?B?ZnltMEJ2TVI2ZWVRSGxLTmZzY25pd2M1VmcxejlFYU53VkxKWDFOdnM2V2or?=
 =?utf-8?B?enFzdXBWNlNXN2NGdWxud3hBamEreDVkSHUxeDJOYUNrZWdkc3BBM09ZU0Iw?=
 =?utf-8?B?S1N6VVUxTHFjL0IyQnRtVTlKUnVvUmltR0pPRVJIZ0tsSENJK3BHbzl5R0or?=
 =?utf-8?B?T3VVYWZWWVB1OFMvZzVSZGt4NXlncDVYQ3JVUVpZTW9JWDIrQ1M4SmZMTmd5?=
 =?utf-8?B?cmt5NElQcExEZkdYclRXN25sdHFJVTdjaHYxZVVNRXN4QzYwbGZVYXRCTmtl?=
 =?utf-8?B?TmF1ckxUd1dVNHFQVUhsd0w3TFdPdGlka1RlZE1sUUZQdGJPZWFHOXF3cE1K?=
 =?utf-8?B?WWpFSFlvYkhCZmlCYytJNTdQOGdrNFNhbHNVWmczenN5SXVTMzdHb0pWaUJH?=
 =?utf-8?B?QVdvZ0JUYVZQL3QvRXV4Y3d0dnRGSDBJeDJCQXZLTEtRRGU0QzVUdmhvOEx5?=
 =?utf-8?B?YkFZaUFvMGRqV0FTU3JuWEh0dGJFNGs5ejYzN1N0RXpmU1hPSWNDVitSM0Ez?=
 =?utf-8?B?Mk1DbzhyTlFjZEd1a0F2MmVzenFBTlp5RENSMHBpc00xcXovSkNHdHBTNHBU?=
 =?utf-8?B?WlkyUW5aYXd6RHh2a0NEcHZ6Zm40U2RibzV3QkVCaEhmYlBRdlIzSGMwbWI4?=
 =?utf-8?B?cFd2ZjM1VE9HQmY5ZTNTekRJNFlsTFZiTFM4K1I2SDdCMTZYcU9wSk9SaUdX?=
 =?utf-8?B?bnBDRHBhWGgweVNyNmNvNnpyM29RcURPNnhkL2xNVmZFYjg4RjBJTVEwYUpn?=
 =?utf-8?B?UTFPVFYrbVhUSStBdW1XVE44d0pyYzRENUxaOXJJOU1MMjgvdVVKdFNYTFlt?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8D061VQVOdiAr5IVneO35NEROsYRSYhxZYtE23eV+etlB5jIxtdd8QCk16KcfrJl2S8gOQWCn3AdJrxu51SEIFjRA4OHeIX8+tBmtXD3keFdNNdico6cPysr+8E0rLIAA6GQv996LvV3P/srwmHifFlY1fRv6x+LJV5TfKe+h/WlvOn1fu9k5aWc24Cxv2c5HQxzzhNXV3Avg6ly2UkIf++UHBRnXmQ3DALFsODg62OIJipMd4SK7+IHpimBNgAUxxrxsLB5Ngaf1nVrKNHMeKQfHUBG+2yc5CF6XDu2k6V/yoXTnsbYR4j9ARe1kWBpNhFOJr7MriKbjWzKQ9eWG0w6zQAI6F/PJWd3YWGe1wLaFUNRBgNEH2tMuldt5PeT3CrSr2FA8dwF2Vcjq3ke483rYMj32mIG7ynJjcJRjhVv7Fl9jXAQdBbQTAspBIuns2anAjmxb/dGNkoH5yyabi4oVTdFbMkXPj1CutOxJErGGg7QpGvhGVJYNDisZOc5uNsTNtVpPNtHECam829EHj4y+CEfI6TnsUtQ0FAXoDAT2CFMup6DuqW2miv8HFyUy0LW7FfPH8NBoZRg2j23l5xlB8bgKXcPk71S2GnM5sbQ0+8WMhS3tX7Vqzq+5JkEuFnTqS43L3syJ5+d4M8ZAvKIfh8pVInt6kxcAQivowQTfyc1a823+v6z/wO8HBcPSjekwJM+dZsEFyDwt/AL950bXw0wZfsEtp1MA6UO4oKZZp7uBDxBGHEaQxIRdtKiRz39nBOqjj7+auE0k42Ta8grQS4PpRQnj1iFtPSKT5aKnvrGvgajwril5FISXhW+
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad16d59a-32d6-42a5-758a-08db0f5c68a2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 13:56:17.3223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvD5NvJK0nPwY1s7OH3EWfjECqRMvSFg55xDuFWxNYQLoh+I95j+2mIM1Lehd6J7zMUSakgNJWprZsq1ltFcKxN5yX5dSbldVS3qXIsgP6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5626

On 09/02/2023 10:38 am, Jan Beulich wrote:
> This is the only file left with a use of an __s<N> type coming from
> Linux. Since the file has been using an apparently random mix of all
> three classes of fixed-width types (__{s,u}<N>, {s,u}<N>, and
> {,u}int<N>_t), consolidate this to use exclusively standard types.
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

