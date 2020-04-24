Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DEE1B8103
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 22:37:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jS54g-0004Lm-DW; Fri, 24 Apr 2020 20:37:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zk0B=6I=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1jS54e-0004Lh-Tj
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 20:37:24 +0000
X-Inumbo-ID: 658fb50e-866b-11ea-b4f4-bc764e2007e4
Received: from m9a0014g.houston.softwaregrp.com (unknown [15.124.64.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 658fb50e-866b-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 20:37:24 +0000 (UTC)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0014g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 24 Apr 2020 20:36:29 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 24 Apr 2020 20:37:16 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 24 Apr 2020 20:37:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dv65ClBvRVPbfwnOFHiRTuD1DPOX2fEIgdTx2JxpzopkqUa/KZu7X7i4Tdd2F3AP0EuOMAZclc8mN2Ot/oT7qLHjPZKsntUjK84NMagJ6wXJ796yGyxmuDICP+6Fy7W2HNa0CbCetBxxEAQl9wxkcER4dMn9kpyOxOxipm7zVAsWfXmGqYigLHt9CRQBpLIBuHsaHWBmCzgZ2uv0/fHB7HKqb8GWavRbYE+ktQivnRBu/Gi9a6Cbs5lGmQJsu1L2QQ1TY20WmGkqZHZ71bDHmQ1CuRAI0NTo5Fq/79dkxBYvpTzd5l3dh465JcRiQsCdYMSLi81dWtqTVtuEnPsv/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Sx4FsPplWsCnWRaZwT5Pqt/CZZDfcbsmIRjpKSjkYk=;
 b=P+LDps1Y5qCq2NR+pwqCyKfTR+7KP/aYvE8Rh/hMhnj5EskRPP3IyCcntRX36hrwBm7Wnlog8jwQA8GFQgT8ghkV4P27hly6GuvQcbwn18BzmX1WAkkOyITJkl5cVQcCDV5E1jjSn3lSBNsFHuvy8WcvrJNQ+7Rc7/j8Xop65HWkZfrGBqd5yXY7cLUzLn87FmpCMkZBx7EVA+ZRVwHKwMsuU3yUwrcfOci48GN3c5gFkNSkcedQHcM2z1N0e+FR6MZtdTZOZNw1Jwb82cFYmdCK9ov5gFZ2w2TqCP4SMXFUU8tWSCD9Ekgz734UjT4rso8dcre89iZsau2pxspLMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jfehlig@suse.com; 
Received: from CY4PR1801MB2071.namprd18.prod.outlook.com
 (2603:10b6:910:79::35) by CY4PR1801MB2055.namprd18.prod.outlook.com
 (2603:10b6:910:7a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Fri, 24 Apr
 2020 20:37:15 +0000
Received: from CY4PR1801MB2071.namprd18.prod.outlook.com
 ([fe80::b97c:cfbd:e2df:c5eb]) by CY4PR1801MB2071.namprd18.prod.outlook.com
 ([fe80::b97c:cfbd:e2df:c5eb%7]) with mapi id 15.20.2921.033; Fri, 24 Apr 2020
 20:37:15 +0000
Subject: Re: [libvirt test] 149773: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 <xen-devel@lists.xenproject.org>
References: <osstest-149773-mainreport@xen.org>
From: Jim Fehlig <jfehlig@suse.com>
Message-ID: <7c47a937-551f-2c7a-edd3-8b172155a506@suse.com>
Date: Fri, 24 Apr 2020 14:37:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <osstest-149773-mainreport@xen.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0201CA0070.namprd02.prod.outlook.com
 (2603:10b6:803:20::32) To CY4PR1801MB2071.namprd18.prod.outlook.com
 (2603:10b6:910:79::35)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.4] (75.169.7.53) by
 SN4PR0201CA0070.namprd02.prod.outlook.com (2603:10b6:803:20::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Fri, 24 Apr 2020 20:37:15 +0000
X-Originating-IP: [75.169.7.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18f5674d-09ba-40f5-61ff-08d7e88f4670
X-MS-TrafficTypeDiagnostic: CY4PR1801MB2055:
X-Microsoft-Antispam-PRVS: <CY4PR1801MB2055CF78ED5A70FDF42A3C42C6D00@CY4PR1801MB2055.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-Forefront-PRVS: 03838E948C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1801MB2071.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(4744005)(26005)(53546011)(5660300002)(66556008)(66476007)(6666004)(31686004)(66946007)(316002)(966005)(16576012)(81156014)(8936002)(31696002)(86362001)(956004)(186003)(16526019)(2616005)(2906002)(6486002)(8676002)(478600001)(52116002)(36756003);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vgH0T+8bTFQBeBkYOFyrwJHiDxOM+aDCK2017z7gCw5U3sG3xgTs4nCYtPmeN4Z+1G0FTUw1dDtlfbgInHj8ugxCqJhlriLlDswmZdmcJEsDp/pxf/Pn83O9gy6/bxeq5WBCMOjVq2lpDYEZ+tfvuh46G6Z2vmQC2uVRRyrOOQgSKtCqJjptCN6ZbOiNmEpeakYC8F4KLHbNrIxoCxK7Z9XO3+i7NKqGON+In9FZs+kSI6aVZczzBAwT1yijUsmxisYC9CTQC5wvoGZgftHRjV4fMq0/6tv/305Ph+OAmyFBHPROix3CES6usEmTJSUF7QQYkCr6zcLkefge+hdb3DSUQAy2D9bi2n1xsU2b0jxksA4wMh1uIjAe9fEqG5aZ22si9tiFS+P/HrqZop2sGY7fp/QqB4VoKc/epfbA47zOoGOVwZNeVVw609cnhiy4HutcEETRCzj/VfshuM56adRX0dbY/q9qRg9/51sg9AX96wndaWJerfih/8zhuja870uTzM7EcHXAjAJsP3FgEA==
X-MS-Exchange-AntiSpam-MessageData: jQZcnezY1M3E4uTveFXEL+/J5hiC3kDV+8sw3Q1Fz02asBt+0HIyP/NZ14IExNsu7VPDBN8nqHhMEGzjyRrAdNxAhhgUbEgxNNDqab4LAUU4Cqaiqj3vlRK6Nh2/anfSkVLdL8qmGrAaee49x3VtFbCjIcaiGtnU0L3VufHOQZGw5UZpSMULg/RABF0f5lV98NNDoPseDLlTpwnPsd6y5SOWHuu9qlbB0ARvZFekjvPuFg6ZZgnHY2it5nQ1cz15Mustnq/ZIqlpZs9fheWk/i+WYrKDYG79v72CMK4j+7Jbv+F/SQDwXMKOuPaZnfhoosaq5M1p5ESmzRyInlnniHc1Pcyh75L6pDSf73Luchme+LEQd6o4hHQEIVKqHbhteyRFHrekwxaXwg9+2aG1E1nVMz6aWo2V+W/if80Wwml640UkHIDwAG3d13flTw0Ppju1J2LyA9M/ZkLpkh+C3F2uCEr3nCWCK9CuMYtCzM2Muaf2GMk33lxgQMOkBGusJwtpeJMB9cZo0PywmJovYZiJt9IIcUoRgMGfqgNbmwr2vBPagpwF7CkwdW8G+UURLxinX77fhWGXGEjQ9IYNvxxUAYnsZc3vigJTzHK2SGDuCWc5y5QMI+JJSbvPedkbZvpmzUSNjKrgYH6WuJHuG9Orm6l1eu8UrzXT/ZTmYV5+WnercV+1geJNLO9FwRYd+b9qdUDBSisRz5euvkeH5aeixvn5VWY+stWbBhOW/Br23mZQLbVwlFRhNIAn5MM/taQZSSq33q+X/y7sKmc96K4H0UO8tAA15xwnehe/cPw=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f5674d-09ba-40f5-61ff-08d7e88f4670
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 20:37:15.7571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWcQIZL3WEeVLlQbuQMDKphn4KdlZ5UdsC+vyBf3nqrlLNC2U4R6omXUYApcZKM4nalapnYULOxNfbW/YLJGQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1801MB2055
X-OriginatorOrg: suse.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 4/24/20 3:53 AM, osstest service owner wrote:
> flight 149773 libvirt real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/149773/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>   build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 146182
>   build-i386-libvirt            6 libvirt-build            fail REGR. vs. 146182
>   build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 146182
>   build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 146182

Probably best to disable these tests to avoid all the spam.

Regards,
Jim

