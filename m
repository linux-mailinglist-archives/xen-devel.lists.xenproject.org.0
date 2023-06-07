Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBCC7259EB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:18:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544565.850443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pIq-0005mH-3U; Wed, 07 Jun 2023 09:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544565.850443; Wed, 07 Jun 2023 09:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pIp-0005js-Vq; Wed, 07 Jun 2023 09:18:03 +0000
Received: by outflank-mailman (input) for mailman id 544565;
 Wed, 07 Jun 2023 09:18:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVY=B3=citrix.com=prvs=5155b7726=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q6pIo-0005jm-Oi
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:18:02 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3257cfb7-0514-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 11:18:01 +0200 (CEST)
Received: from mail-bn1nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 05:17:57 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5048.namprd03.prod.outlook.com (2603:10b6:a03:1e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:17:52 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Wed, 7 Jun 2023
 09:17:52 +0000
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
X-Inumbo-ID: 3257cfb7-0514-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686129481;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XT5MIM0WjhTNdhd0vMd9vu1XL1cgiC9ffzabSjHAx+s=;
  b=EKXuFaS6L3pqHqxRmq9xWEpmtb2/OfoSEWvyFbetejKzx2XDrWQCZEx2
   2dMW4Fy5DfNIrwWXG2Nn9VL0y4Pf3/gudPEObAUH26ftcSamXM8ly6yXr
   G7YUPQlT9jxG/850KQXmgVcPPDEtf7K+E3wIEPonMjKnjpAAna14RkT6D
   o=;
X-IronPort-RemoteIP: 104.47.51.46
X-IronPort-MID: 112299620
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ui5Ye6tYye7SNxIc+PnONPInsOfnVMBfMUV32f8akzHdYApBsoF/q
 tZmKTqHOv7YYjChe9B2atjjo0IG7MfWnNIxTwU/+X0yRX5H+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGGyCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCxEGbReMiPKK6+iHFNVCxeVyFMLNI9ZK0p1g5Wmx4fcOZ7nmG/+Pz/kBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osif6xbrI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqiAthDRePirpaGhnW92mgzGgdRX2G6sOK8oVWGBeoYd
 BMtr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLP+BqQDGUASj9HafQludUwSDhs0
 UWG9/vrGDhuvbu9WX+bsLCOoluaMyUPMXULYyNCSAIf+sTiu6k6lBeJRdFmeIaLidnyFSD10
 iq9hiE0jLUOjuYGz6y+u1vAhlqEuZzhXgMzoALNUQqN7AxjbYqhT4Wt4Erc67BLK4PxZkmMu
 j0IltaT6MgKDIqRj2qdTeMVBrar6v2ZdjrGjjZS84IJ8j2s/zupe9lW6TQmfkNxaJ5YJ3nuf
 VPZvh5X6NlLJny2YKRrYoW3TcM30aznEtejXffRBjZTXqVMmMa81HkGTSatM6rFySDATYlX1
 U+nTPuR
IronPort-HdrOrdr: A9a23:Rcs5zqis90IA4g9+3ux2ZwRT0XBQX4113DAbv31ZSRFFG/FwWf
 re+sjzsiWE9Ar5PUtNpTnuAtj5fZrjz+843WB8B8bHYOEJ0FHYZL2Lw+PZsnfd8gfFh5hgPZ
 4JSdk0NDUbZWIKwPoSmTPIWurIo+P3jZxA+92utEuFFjsaHJ2Ihj0RYm3wfywGITWqHaBJa6
 Z0yfA36AZIEk5nF/hTaEN1ONQqZrXw5efbiFk9ZyLP7jPg40LKmdzH+mCjr20ju7wm+8ZXzU
 H11zbh7qGUu/unyhnavlWjnah+qZ/a09NGMseFkaEuW0XRozftXp1oX4uYsCkyu/zH0idYrP
 D85y04N8BE8XnWZW3dm2qd5yDQlAw243vV01WfmnfUocvlLQhKdfZ8uQ==
X-Talos-CUID: =?us-ascii?q?9a23=3A5Eg2G2uzOOO6/zkYwB9he8cC6IsGU3bey3jfM3O?=
 =?us-ascii?q?TU1o3dJPWaA6o84V7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ab5o8/w32VN0yJcSAGVkaM83ioTUjzbiqKFIX1p8?=
 =?us-ascii?q?8utifMAdrA2mly2voe9py?=
X-IronPort-AV: E=Sophos;i="6.00,223,1681185600"; 
   d="scan'208";a="112299620"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYy6lyXuPomyNkpZBT2LVpdICuKlizF/xHkrJFo+GXEbBMeXPKME81P4znNnkmDrSwJ8bITvLaOw2j9gBfJ8LKxh/Y3pXgGsouAT4P4h+6znvW6NaxKGWotpqKAL5AE4sWW0PpTRI8aEj9uibED4WQqFPDUwazpcHyDIbaM2t7mQiMX634kz2rBmB+faMdGk1jSmh3yed6iIWmcv4Iz1vhzP23CCv6XrXVRP1l6ovrHXvCk9eSx6uVDdHLMrjGahiqnm+MEtDnXxfBQKzLuc4rPQKrM4LTMRSjxDNOYUVXgv69iTdp3jqsMMtzhGXapP57wk+reynovmd8oqYOyfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3bIl+1C7USBtnM/LMd4oorYK5XHyI9s1ohMk+Xd9Kg=;
 b=fhOlRQX2kfN9sitGmWHcQl4BOhmTHt7B5GwEx75824y3Fas9YU62rV1JVDiMoNYqyOHS4nU3yu20Wtno5FtNBX/iHRCCXaWC4BD46LCXILOoU8jWWzi8Erizpv0f8f/fbKor9XMKAcF6SVu81xpKJj1PNc72lX7m8HgSfHVNJRMJBS/SeEtX1M7545/2AZYu7EWX+GVKBi6hTHSrYREHnAD9oYO0g9EsLGVbYKaaBYHRGWgtf9/pK7+9fVTCJUPrQDZXBh7URSuFLn0pbuFArRcuVpY1D8U/1Mh0CXqLbk+3HWTRhkUW3Ok5460tdbu8VrqIEfMHunUi/r17kOkg7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3bIl+1C7USBtnM/LMd4oorYK5XHyI9s1ohMk+Xd9Kg=;
 b=VejCiOmliKD0aowDKkRkn+kgPrWGXEEMA+oixnDaYMYIPVVNtIUebBgRMJiK6l5W7kYsWqCz3gBWgiFZ0PqZ8gj77yZjZR6GcQcsGwRoj6W372a+ObnU1J5S0S11EWfM5otYmq5QB+ADL3eXMCYc66tRxi3eYL+JT3apWxWVWgQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 7 Jun 2023 11:17:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] livepatch: apply_alternatives() is only used for
 livepatch
Message-ID: <ZIBLOYiAFE8gqUY0@Air-de-Roger>
References: <20230607090120.49597-1-roger.pau@citrix.com>
 <d8048c61-4b81-0527-444e-fdf6f38ccb3b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8048c61-4b81-0527-444e-fdf6f38ccb3b@suse.com>
X-ClientProxiedBy: LO4P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f01ca0d-e996-4a12-6483-08db673811be
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p7nNwMxXPd8bJsknIlEYUhX2ybgjMiRmqKLPGy/E55pcGOP2rL+SR8lZv9VAF+84B1XLffUVsIDDBMGh3fdjaxzKSAfVMkbabZE94JSuo8e731saTlQ4Q3uDDILVXO5bSc19grVQ6I14zKUXxlNOMOcOAHmS2yaJVkO95PbyGXGMFgmc1LhsqjpsWsnV78MfocighX5okDEcRBHAGQwFRxpRt5mpYyMuhr5CSkd40u+DWUf6axqCNpv5eFMHHMzeAvk3PyXTYbSliR6w6Hw20z2621sWBQHcCk8zXQ4ejQcqxFgkIjHu/BE9LyCofGxPD+PaWWFx9EC3G/sHKee2nJfxgO7URiYvKAReaPVRKIXC2Ct5mKO3wQ0AOwYOePTDV5AjoN4Sr5q2eRkgZFrzvLEGHK7yfp+gL7ZMOnA0PNCJTx/xPXqY9Kq7svNkEPOdSEs2KNIgQNnuHxk7SQnXgBAWatr8irREY5Ft9j1MEjQQEi4TOq2pK8XhRmvE4oQpPz6C41UL68BNlujaIjywY6d+Y195jnBMRa4p9hS4jaH+sZVHUIgMmZjgwA7m3cnN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199021)(2906002)(8936002)(5660300002)(8676002)(41300700001)(6916009)(66476007)(4326008)(66556008)(316002)(66946007)(54906003)(6666004)(6486002)(478600001)(6506007)(6512007)(9686003)(53546011)(33716001)(26005)(38100700002)(86362001)(85182001)(186003)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVFiNldmeWlVeVFBUDBuOEV6N09vTnU3UW5ZVlJxUllRUE1NS1pXOWdZa1RV?=
 =?utf-8?B?QUFMQ2JkRFdRL2l2a1VXb3kvZ0c0V3ZmYVJ2N0JSWjgvN0hYNW13YmNKZjBI?=
 =?utf-8?B?bG9pYnQzY1NMK2pVVXZWZHFPMERiR2wwMlhZU1ZHK0R1U1ZUNTZNNzQ5bUZw?=
 =?utf-8?B?Y254MjhZeGpyTVYvZllLNEo0NS8zVDd4WUk1T09BQW1CRFhzc2dvL2NLTExy?=
 =?utf-8?B?KzFVdnZnLzRSditTb29UMkRrTzh5clJITlBoYzhURUNIUVJ2M3JFUUdhalRH?=
 =?utf-8?B?YjNxK2s4ZGF2WU5BT2Z2WjF3Yk11TnVzcHlsRC9mMDdDcFRxYnhWK1NiZjRp?=
 =?utf-8?B?NkI5ZVdaMHVpRXhyZnFGYkhUSXNnSHdkS0JsRnZrSVZtTUtPb3ZTY3ZJZTRX?=
 =?utf-8?B?eUhYM2FyWGRjc1k3NDBpa1RUbyt4T0VZbE92LzlXa2kraE1mK2VXei9XQlpv?=
 =?utf-8?B?RjU3UUlscEpNRXBlanVlVC9OaUxpU2tJTjBnL1kxak1LaU80ZVNycXMrU0Fk?=
 =?utf-8?B?eUFvQk5qMW5OaFBla0NkYUNlRmxxMW14RnhYejdWWGw1aWtPYjZ5alY3ZVg4?=
 =?utf-8?B?MzVEYkhxSzVvTnNCelg1TGZTV3dqcmNVaXlNN3VkT1pubytLUjNKSTlhZ3hi?=
 =?utf-8?B?NFRXYUdGTzNPUzJGVHRzSm56VDdrdFNjUkl0WWtiOU1ERmJzdnNWU2FuZFJs?=
 =?utf-8?B?VHREL0M1K3V6eHJqaXhjT3pOTW5TZEhWZ3NjS1l1Y0U5d0tWT3NPaHcwSTFD?=
 =?utf-8?B?Zk16THVnNG52RnRLNTVmUDVIbUkwRlBVVm5DWnZKU0d6MHlBQVAxeExlMWdS?=
 =?utf-8?B?SElCSHdwMlhPeHdDUElVcUxpczhMcHQ4WXgvUVhlR1lVOVhzaHloU3hzbTlt?=
 =?utf-8?B?cFlTcmFDRHhXOEpBVWhlVUJjRjA2NDR4SEpYbTZZVWJITTBENFlaNkk2ajVH?=
 =?utf-8?B?QUpaVUNJdmxnbmVKVm9BYTk1S1J5clc4a0paVU9PZGx6Z3ptbEZZMjc0MDZC?=
 =?utf-8?B?ZmsvUHpxZDRBRTdWYU5WUHRlcm5veU1JR3grSUFWMUVLYTVLM1VlcGZiRzJC?=
 =?utf-8?B?MEYrRFdGSkVpdUhsQUFOZkIxQXB6a1p4aDZwTUw0OFVHcjlKcDdhM2lxUlhZ?=
 =?utf-8?B?U1FIT2V5dDY3THllQXRCWldodFZkN0VyYnhYVzByeHlJNjZzd2RKdDV3eWJq?=
 =?utf-8?B?SFQvaXV4T0daVzhPMUhDSFNsRjNKeW9pbTFUc0hwT1VScVE4bUNWckY2emlR?=
 =?utf-8?B?dDRsVUp4RVhpZU1wMnJOWXhBTEYyb3hDSERJeDhza3VaM1VyRTVROHlsKzZI?=
 =?utf-8?B?OEJWTkRRdFVrb2VaUWNNV3lCU2c0ZW1reVlpRFBTeVd4ZEViVmpmeTcrNXJs?=
 =?utf-8?B?MmgxMTNIaGtDcGxxMVRnK0d6dnhTU1ZOT2xBYjI3RjdzTHRXemhmaklBMkRH?=
 =?utf-8?B?alJ1QS9IT0hMa1JYR3FQT3ZQMC9Jd2hkcFpRUEpyVjRPNmQ4UU9rNmRvd2dO?=
 =?utf-8?B?L3dKYWt1L3dKYllHbFFaQlFxWWxBU1lkek45ODAxbWtEMWQwd2FFK1BuWFpI?=
 =?utf-8?B?dFV3V2J4dlNpRWRTMGxLSnArcWFSTG11ZlJHZGdCNWZ1YXpoZFRUOXMwRU0v?=
 =?utf-8?B?bGgxV0ZOSDMxcTdzMXhBTmZZaU9tMVVPYTM1czVJVDRqWFJMWTdmUmZ6SS8x?=
 =?utf-8?B?OHgyZkpKQ2x0djhOSXZmM2R4UDNjblZBZkpRUDN6dS93MnM2U05wRnFkWFMy?=
 =?utf-8?B?U0NJak85UCtDZDhPbUxhMUdMZW9GYTJZNTRmUVVFejJTblJ5RGZJV3JpVk5I?=
 =?utf-8?B?OGZMZ3pkY1ZKcXhXaldjU0RGL0dIYkVzQk5qZXN3THlGNU5VVG5ZdlozTUNY?=
 =?utf-8?B?SnV3aDJXWlI4VDhNRTFzSWk5dkczYVN5SzFRazhCR0pjNHN1VFBEd2x6TjJ2?=
 =?utf-8?B?RFRTYTN2T0xPNm1ORFRTdzZUQ2tVeldRajhzY2U2S3JCNWVUdXdHaXZUeVR1?=
 =?utf-8?B?VVY5a09CZS9qZ2JOanBEQVQvR29EcHpnakkwcW5ta2NzU3pMalQ3UkdFMURw?=
 =?utf-8?B?UXNaZkdXeUNQdWNXTDBuOURlWDR1QnFud01kUUNYYnZialBvTjlBT0RKb0Iy?=
 =?utf-8?B?V3FzNHlOb1hpU1dyR2JCVXRZRFJnYjEvS3d0UE9TMFBDdHBMcTBFVVQxOWNp?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BQPSF6ChjRtYd/T0vqJYBENVhf3owORGoUNjFp/EnA6fVJ/yo9Wnsqpn1nZRG4np0KOBuRGlKyJPTE0j6lpgj7RllnL9/B6rxT50yiCS7PQ+oflmUL/k2aSYSzAAQy2hYJ8mozes8x8NG+ux0IkAoXIHx6ppA16HuCat4crXFX0dumCto3H9K1UTQ6hj0SqurE/4t4iNPNVvQsm9DaRC3qgzAKbMqo93TtumfjYgtAUnelUvqlrzbuKJv8METG/OBH177Hp9tfpLuWnPqMzZWgkURuhK7mFl3JhJwgEMmgeVmcHSMO1SzN8QG7xRklJnfsgbXFQCEGpAiT+fFNxZ86u22smoggwdtWcNJqEbcKB4O3PvB5KPyI4CxPSxhgPWf4gj2vr9Ia+JlYSn04nj+8P6mopKN24/egxBT/eN/PJpfohcWvvtzR3YsGCuaMyhqiJ8Ox1v+pTZPXIM0OtazabzYX4UR6cL0Yqew/GVl+CygztPw6A/ULyYEx9IQyqSKawesph8e6RYs3EGzPHnfxAtBFFrVGcqmUMw9kqwJ0aS9Oy23knlKX7MIJrEyzmQ1/mw4fb7unuc6yNrSWpUx1RX6agupnOB/wJSBnVlRtTzSNXmU8KrJDcGG70N3EPhWKW/EKFM3PM7ylqEdO2GnlPsXszewOld6ipCB2NsZ2+aDSCe6MdQI8L8Bi6dAoyFUD1rF+qBIc1+FDIyfHnGgzHh3wwAzP7pc5/QQdLqEwq2RBRBtE7WSGPknhYRdZgWEAFHAQ1x4ZkhVz4vNiHo3LSNhJDwSYzlfzj9zozj1bbKlcvSjwB7D65xz8BdEiBsc5H+u/vXI+pYz+w/K8yS9Kxh16BxAWaaYAIMnVUVg3JsIu8AVYuahABT2IDfi+NW0G5NmFTqNfpkbb7PAS5DxFrY8kgIeYAGrPqYWDtIpp4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f01ca0d-e996-4a12-6483-08db673811be
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:17:52.0038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4rwG5sH9OmDWNOmUuFJXU4WnWaUGc+ocwSlDlcZ78JHRoGhmAmhAotPMDbgIGuJl77w63SGFBjq8e8BK1CV0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5048

On Wed, Jun 07, 2023 at 11:10:27AM +0200, Jan Beulich wrote:
> On 07.06.2023 11:01, Roger Pau Monne wrote:
> > Guard it with CONFIG_LIVEPATCH.  Note alternatives are applied at boot
> > using _apply_alternatives().
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit the implicit ack therein is only on the assumption that (apart
> from me) it is generally deemed better ...
> 
> > --- a/xen/arch/x86/alternative.c
> > +++ b/xen/arch/x86/alternative.c
> > @@ -358,11 +358,12 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
> >      }
> >  }
> >  
> > -void init_or_livepatch apply_alternatives(struct alt_instr *start,
> > -                                          struct alt_instr *end)
> > +#ifdef CONFIG_LIVEPATCH
> 
> ... to have the #ifdef than the init_or_livepatch attribute.

But the init_or_livepatch attribute doesn't remove the function when
!CONFIG_LIVEPATCH, so it's not a replacement for the ifdef.

IOW: it's my understanding that the purpose of init_or_livepatch is to
add the __init attribute if livepatch is not enabled, but
apply_alternatives() should never have the __init attribute because
it's solely used by livepatch, it's not used at boot.

Thanks, Roger.

