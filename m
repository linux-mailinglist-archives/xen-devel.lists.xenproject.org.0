Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6285565F872
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 02:01:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472235.732390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDb6M-0005j8-7F; Fri, 06 Jan 2023 01:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472235.732390; Fri, 06 Jan 2023 01:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDb6M-0005eI-3x; Fri, 06 Jan 2023 01:00:54 +0000
Received: by outflank-mailman (input) for mailman id 472235;
 Fri, 06 Jan 2023 01:00:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sfve=5D=citrix.com=prvs=363380921=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDb6L-00058x-71
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 01:00:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f088e50-8d5d-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 02:00:50 +0100 (CET)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 20:00:47 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5191.namprd03.prod.outlook.com (2603:10b6:610:93::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 01:00:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 01:00:45 +0000
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
X-Inumbo-ID: 8f088e50-8d5d-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672966850;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7R5caMStUTAOv6xs/IolzeChzCMqWnsnP5dG+yqWnRY=;
  b=AXzwh3cWaZFbKUeg7k6lVc1GH74tuZcRyaFycI0GIqT5Fif9e/0H/Yw0
   y9vtrjaHMtU26/HosfTMi7Kms7UAuBOH3W2q14UXzfDn3lJLiRUOkCquH
   xpaDvFD7Bb3XGRvifQ908KUaXNL/1MOfwzDE/O7ZZyQx3RVnmQVktAjCl
   k=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 91441917
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ze01W66kd+ezYDiZXq7GbQxRtAnGchMFZxGqfqrLsTDasY5as4F+v
 mYeCDuGPauNYjPyft1xPtmw/RhTscOGyoBlQQo+rS00Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZlPakT4QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 s0xBz4XVTC6vM2x/LTiVcZBqc4JBZy+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOSF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNLSOHhp6c16LGV7m8iBgRIBXz8m77nq3KGY89bB
 kgQ+QN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgcqeS4BZRsI5Z/kuo5bs/7UZtNqEarwhNuqHzj1m
 miOtHJn3+lVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5H2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:WkNGP6s3DjLwdJm1/91fD+sa7skDgNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd2ZJhEo7q90ca7Lk80maQa3WBVB8bBYOCEghrOEGgB1/qA/9SIIUSXmtK1l5
 0QFpSWYOeaMbEQt7ef3ODXKbcdKNnsytHWuQ/dpU0dMz2DvctbnnZE4gXwKDwHeOFfb6BJba
 Z1fqB81kedkXJ8VLXCOlA1G9Ltivfsj5zcbRsPF3ccmXWzZWPB0s+AL/CAtC1uKQ9y/Q==
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="91441917"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGzl9qiPkUbUV4gsp02fCM4xZS9Nlqw88rI49597S3lBd3Lg5EK1fzu3YegUHa/8gJktu5lO2bksRCl6tm3LZc3sxGqnBSSE+vqQbliu9qLHsh54zFodQjNLrYNSssbD9D7qSynm4kp+2z3wD4ShChwjEPjZuR+e4BlE6z2G6JQsGHH+tWA4wBMCVJGM/UGfzGVvLG5iRRMArkUXseHCN7c1XTcFs9HcBBe7bSMlgV/uxx9NJ/pz5DBXScMpPOSMXGqDf5c2amE/K8RFzDuoULEdHOjbwJ09Jx3GQDQ02HbWgtFFtLi7eCqmP/kV2mnGn2VZxaamQa8gJ6x3OANNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7R5caMStUTAOv6xs/IolzeChzCMqWnsnP5dG+yqWnRY=;
 b=dI8Xo5bm2EGFKGt8yPfsMMJB/UGEjOCOzNGwSnMYyPORa4zyqFFHz3T0sJnWbAGjx0xGaYgc93OMxZx1ehg4k089ZlZz0NJ2kYESvIvIEZP8Eiode7FEz7YNWBaxveE5ZdhA8a66BBW8egJxjUTaW9t9Ui2XWgPMLDFmGx2c9tsc7wiMrc/MdHtNquamLnETG+UKFcwMtSZ6c2NkPApgsJjnLDJOVKpqSq4x+CCCj9B9NTOGujLzF0ef5u8XV5vrmxzt8ec0SdI6G40k2GOP/V7iCqodNpvK9DsesbsR6bTdKcuNAlSZTKbuDUJbcUBbSMJbie5KwSL1hDmACzIodg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7R5caMStUTAOv6xs/IolzeChzCMqWnsnP5dG+yqWnRY=;
 b=UndqmyDVTo7AbT6A85r1bWNTpjnhCzpSqVLfurhIPdX7h8cXXyz9jrBcEXL06OCyDh3dh3S5vc/3CcM+GvM/thcIoyqn+2qqI4GTE5Wh2Z7y/L8XrTR6UsmZQBWsh9ojfN298i/ePevj1pacosBEBCEOHGU37zrtOIW7mu86Hpw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 05/11] x86/shadow: move bogus HVM checks in
 sh_pagetable_dying()
Thread-Topic: [PATCH 05/11] x86/shadow: move bogus HVM checks in
 sh_pagetable_dying()
Thread-Index: AQHZIR9eJqf2NVsSC0qgmrUFbi0j7K6QklwA
Date: Fri, 6 Jan 2023 01:00:44 +0000
Message-ID: <37bfe65b-d989-7c34-5e14-171a23df37f8@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
 <76cc0b4a-27ca-21b7-841f-315f31833762@suse.com>
In-Reply-To: <76cc0b4a-27ca-21b7-841f-315f31833762@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH2PR03MB5191:EE_
x-ms-office365-filtering-correlation-id: 875d8298-c7f6-4c92-727a-08daef8170d9
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6NuPmKg82/S8Q4P+kltjf/Teo2AJgJCNabqDBG/x6u2bgmU0TJpcGB3YRmso4Skj5KaflbpmPerk5EJ3QL4Dj+3yXEd3r6/uBlSS9CD5KSrcMo0evkXbmZUSlbNCsaCeBKWx5n1ljqW6QjLDIejO22LZWKHvS86DoFT0x+6EYAVFE08qFz/DSztgNNVOQZNcsDJvlgSM2bqNJANd5CpgtrGs1Uk25sKGj/yPWBtel3m5oPSykPHgLQBPzNFhJ0MUqrrjqrSYg3aSyeBlHHdLwGLN3gY1MV19/JcUFrW23EMTjfBcLSvAdHV30Y3eaBFRNtA70zMk964UQU9mVIDoEtG2DHxKujKOeJUIqOQMNVynrmce52BqswRKmxmdHCrmBp+BMkDLHd3ZME3VZp+bd5mEMTyzvwWE+rsZR+LVD03RsIsfWU3Rj9m7ivsUAcdiUenEi9oNXVWO8BzgjkN39yfXSdmKj2eUuPfl8rcujROPF79pv9jAdHd9hiJ3G9FOMBBU8sv9Bi9rcgNzfoRJuxQAN5qhe1+InDHJI4hGajKwCTrgkunMuJp2XRWLSzdApiL+WNEGczxqomM0J+BTefpctdw63xdIrL2juaZoaZreDY4gYYGyVmpaRkFBrus0ka+0ttgiVZ/sOXFN5ez0nyT67ZHY4N5PsHO73rnPOHkBeDmwY86EPnzFEVlJJe6Qm0FQBO6M2xloZEVKvMvEd9NrIQ/IpxnINASwf/ZKDRunBbp2w35bbcLYwLnG05lsQLYXiLke4RsG9VidPESvpg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199015)(83380400001)(6512007)(26005)(107886003)(6506007)(38070700005)(86362001)(36756003)(31696002)(122000001)(186003)(82960400001)(53546011)(38100700002)(2616005)(316002)(4326008)(478600001)(41300700001)(8676002)(4744005)(2906002)(5660300002)(8936002)(71200400001)(31686004)(6486002)(76116006)(66476007)(66556008)(66946007)(91956017)(54906003)(66446008)(110136005)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cUdzNnBSM2ZKYXZHRSsyMnlkM0dJS01WUkMxMTdLR3ZId24rbm5ja2d2bzdC?=
 =?utf-8?B?S04xbHFKTUtPN2dCNkhiQkJpNjZjWkdBaENxdDVzWXZqdnl5a01WcU10dDAv?=
 =?utf-8?B?WWwra0NmeW81bGhWOXA1OWVndzlGWG5mNGFNc2QxVVhzUUZ6ZnpIaUczaDc0?=
 =?utf-8?B?aW4xZ09UQUZBc0VYZno1WGZUR3dkUHZvNWlyUzBWWGc2MjB0eVdtNEFxNmx2?=
 =?utf-8?B?UFlMQU1venphSkpyOXYvbFdqbmVieExidVY3K1ZIZEVHYUZzeU9hREgwOXpy?=
 =?utf-8?B?ZUhad1VRdnc1cHUySFk0ZVcxRVF1bkt6L2k5aDFKMnBNVmZvSVRCaWhBTkhB?=
 =?utf-8?B?QnNIZGJNMkw1NmxudWlneTduN3R0OUo0Z2c0T2UwcmIrMElOYldQR2llWVBP?=
 =?utf-8?B?aDl5eDFST3ZBakdBWXhoY2xTWitTVkdhNkNUM2NQZjJWS05uMFNSZStSbFcv?=
 =?utf-8?B?VlFpR0Y0Z29keitSWGJkR2dLVE5EejJxZXdrVjdGR1hhaHRBVmdtMkQ3Viti?=
 =?utf-8?B?M2s2dUhoWlQxYTNmYVkrNXRvdCtMSVBnZENBZEtHaFVGcVRpVkNQaVo4YWJu?=
 =?utf-8?B?MXRRMXBFaU02ZkVBeS9hT3VnTG9acjZxSVY2emR1a2FtY3QvaVYyTTdocHND?=
 =?utf-8?B?dUdGNjhhRGl0R0VYU0pWVEwzK3JOZG03TnFSQjFsZWdBbC9PNXlnMXZQUUlV?=
 =?utf-8?B?ME9CNTh5clpNNzBEdXE1Snpjbk9sTEE1SE9aTURTNmF0L1h2WHFZdER1VUND?=
 =?utf-8?B?eFVnUnlWNTRqUlNsQkZySzdYVXAvRGg2bTNST0lFQStkUWhHWFluWmRqSkcr?=
 =?utf-8?B?dW5rZmxpeEhhZzZOTjF4ZEtYZUJQckF0eERrY2ZFN0FPd25INzRINTdNeXli?=
 =?utf-8?B?T1N4VzV3ak9acUJMUnpiOEFDZXZGQ281NHNxMVdQWUdXdzdDSE1qQVVFMDBS?=
 =?utf-8?B?OUR6NlRuMnBEZmFLNEtLU1o1RUNQY2lPMFJXc21sVFhRay9ic3dDT1NDTnhW?=
 =?utf-8?B?TXpINXZvWlBLUGpVY2J1MkZveGQzVFdXRGRWVXl0eE9CTUdFTjNHL0VGMldI?=
 =?utf-8?B?VVVqdUxKeXBQNWlVbzg3d3Urb056Y1hFZmswUWo2NUI4NXp0b0lmRUo0SGNP?=
 =?utf-8?B?YXRzalQvaHJ4NW1xUFNRMEhiNEZaTTFkVlY5ZFJCQTJxZk1WanEwYzk3N1pX?=
 =?utf-8?B?WjVNT1I5QTFzQU9DSVlHVTFIWlFYZjRLMUN3eG94bThLQ3pDdU8vVVR6MDlD?=
 =?utf-8?B?czU4QzJBckc4a3RRMHQxbkNGQlhhc1JkN0tUaFhnL1E0RzBHYjgzUkVVUTlW?=
 =?utf-8?B?YUhqUkR0cDZOekZOanFYcElKM1IzdVNTaGgrQW4zK0dxeEd5eFBVVTk3TnMx?=
 =?utf-8?B?VEVRTkROM2Y5aWNPRG9OQmlmQkY1eGFNQzgxSG05bFF2TXdGb1o3ZHZBMWJR?=
 =?utf-8?B?aXd2cXdoQTZZMEFKZEx6Yjk0b2NOYUcwc0NmR3BiNzl4R3VCYmdyWUl2ampt?=
 =?utf-8?B?SnNEdlEzaWhSNVhEUENQUFZBVkVyaFdzQUtOZEpSUWMxcnd5WjI1dFRyRnpT?=
 =?utf-8?B?QWQyWHZ4TDVsL01hdkI4QTRqeURGTFFpVElLeHVNNDJpU0RGM3R0K2NBc0Zo?=
 =?utf-8?B?d1haK2hiWmJzNDUzTEhmb2VMdytwME4zRWtiZjVndTNYZXpPMldPZmYydjFI?=
 =?utf-8?B?RWMxaUltNGtTRkgvN0hyYWcrM1dKRnJQdHlsUTg3YnYxSnFBeXE4WStMMHQz?=
 =?utf-8?B?bkZxcUU5eE84c2dRbVhpdnBpWmcwLzRteWd6NTZadDNuK2ZiVUxqU2lWN3ZG?=
 =?utf-8?B?bmNVdkNCLzRLQkM0OGdadDVvVUg1MC9seVhQQWMrZi9nelh4UmtUSjFIOUVV?=
 =?utf-8?B?Um9CcURjY29raThtSjQrRFcwWkVLQmxLQ3FXMUp1VXh0MVB6Mi9LMDlQTngr?=
 =?utf-8?B?QjdlWXZWZndpNkxVOEFCcUlZZ0RpYnR6R3grN0VabWdmMTE3VUFSTDkwSTBv?=
 =?utf-8?B?emVVNnFUZlQyalR1ejFNMkxFSmd0MnR2VXBaeWlMVllqcVp2SXRQNGJ2SWpl?=
 =?utf-8?B?QlBocmJyc2x6TkEwaUtGSVBGOVZPQ2ozZDk0aXZZOURUYzNtOVFiVkY4R2ZD?=
 =?utf-8?Q?vqSGp5qhMwZeHtZ8+cmGbj5Ks?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BF7B6676F02A54E8C464CE41FF9C8A4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+CYBpSjTgnwIA2FDTgwFuhPgUn2gitImkxRvVJLj+4UD9WlL0bIMjBn7iKAiUHlLjlvHDEYjabyQ6651tmYJDQN6d5buVJcgNUJbYEu+OshwQkQdMlf4xu+CQC1gu1vDQpdeT8GZmRjGzhPcEUwhtQAerN+xfsiM2zo6f/aI2BN5uiqg3SX2MstG4/f0DeI4hKyGpbt0wwTxMuAcnVQf30yNolyHnlwb8b6yrUy6tbiH50LthRl/tt6LotelJMCcDLv38Za+avmBQ+KNv+OBCE+nsIO3hsuNdpHzNMYI+yt/6Zz2KGkXMwsjYkF0fYV8KMtXvX4haB/NhR7zTBhcDnkvwwUo0O8mzdz2AmUKOLF/EYUPiC/5hV5UfHs5efg9eR04J2UHdPGqtE3Q75E15TkrKq6VWi+gtpekspee/ivagtLsyVFsyfz80iB94FFnfK5SkfzLJCvUkHrMelI4cNPq8llqYNXbwupKkROw88NJl4iqAdi2rbSG9nGMyPWsG/2yZRqpfc425/KYjwY5jmFOfiiJ6W9aKZb3Xl0J0R2la9m6ZgGLNeBBgoRgexIvYSRqjpJ/sdK7tFIJIkaX2yfg9vBp0vM1j0FqjdiLAPRTRi2O0S2sHoly3utG+I/vgv6+oOfNWaDWe5uRyTfDQtR1UPmeFqmVFeOlBLhk/Ln05jAQDprL/nRWjidy+2aKvVyo2j+7j4S47P8O4H/nAc3/UuDy9Gjw2yp1Zh5yQgwNZnX12KmVxb+piNXuULbQFJGYRNIR31oJKH7Gqu1+Gpc4mXjjdtYGjQulULk8M4i8FRfO1MFdUgCyPUwYLcvN+ZEvZGJzpIjKHxjNgAjRLQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 875d8298-c7f6-4c92-727a-08daef8170d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 01:00:44.9308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hjtYzlm4f5VuXWYdXqQ9HAt1A1cMPZ4nDu4LhjrM2Y/PMNi8lkr+J7nDXQkxx5T/XBondEPSaBFRbRkBs9GVe6WjvwHMsn7ZuNEB/iF65OM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5191

T24gMDUvMDEvMjAyMyA0OjA0IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gUGVyaGFwcyB0aGVz
ZSBzaG91bGQgaGF2ZSBiZWVuIGRyb3BwZWQgcmlnaHQgaW4gMmZiMmRlZTFhYzYyICgieDg2L21t
Og0KPiBwYWdldGFibGVfZHlpbmcoKSBpcyBIVk0tb25seSIpLiBDb252ZXJ0IGJvdGggdG8gYXNz
ZXJ0aW9ucywgbm90aW5nIHRoYXQNCj4gaW4gcGFydGljdWxhciB0aGUgb25lIGluIHRoZSAzLWxl
dmVsIHZhcmlhbnQgb2YgdGhlIGZ1bmN0aW9uIGNvbWVzIHRvbw0KDQoiY2FtZSB0b28gbGF0ZSI/
DQoNCkl0IGRvZXNuJ3QgYW55IG1vcmUgd2l0aCB0aGlzIGNoYW5nZSBpbiBwbGFjZS4NCg0KPiBs
YXRlIGFueXdheSAtIGZpcnN0IHRoaW5nIHRoZXJlIHdlIGFjY2VzcyB0aGUgSFZNIHBhcnQgb2Yg
YSB1bmlvbi4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KDQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4NCg==

