Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180801EE825
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 18:00:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgsHa-0007fk-24; Thu, 04 Jun 2020 15:59:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GEZq=7R=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1jgsHZ-0007ff-5p
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 15:59:53 +0000
X-Inumbo-ID: 6a040988-a67c-11ea-81bc-bc764e2007e4
Received: from m4a0072g.houston.softwaregrp.com (unknown [15.124.2.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a040988-a67c-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 15:59:50 +0000 (UTC)
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0072g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jun 2020 15:58:33 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jun 2020 15:57:27 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jun 2020 15:57:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bw24vyHk0Rn/HJNdsY9XVANEFLWcnLa0rrhq+ZhvpVefgDFrX6cHC83UhkQKFM6erMlSjmKNFKyHZijFwJdqUNyi/Jll2ZLvHdJnkqHHrQQPbzGbFfHpU/POVj8f07R/k1Qeu04ZQZGudk9jgvjZIZME27dXwDcpGbb1JY+Bk7FEPe6DavDI5DU59QI6DzsXCgdQVV/iw2WH6hJ9CPCbreo399nX34XTz+5BtubJPYWEExJrLnnJt4abZpn/2RRCNC9xYr7uriMu0lg4KRieyiDcGxifPuP1i1dHwz99dICnG7r7W7vwpAy/spcE1P3tasR4/d0TKnReufczrxQ7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/w+lXdLh32mZEP9wP3L7bFEMzEAM7IawwazQl/OO6I=;
 b=hUfKSCBX1PdI+TxG46FM8uttz0CtlKfPlvge2c9tN+DoxrdcK+jmbC83pb0dUgGqIS99AtkoZRZx7t3u03NXLAGaKQAqX7YrCBcndbFhSq3dJHIkMPG7QRhEEzvuH01uGqiPqyqsHtJeqz8xbulBvWHSxEZ4we5VqT4dk2jytjTxEcKJq51wrlwjCWi1fHvXGklb6GZXik778tCy6jobzYt0vtJz8kst7RpBR/G0OR/KHlUcLkK37Py4ccn5PqfnkS56eFP+BAh8FVYJq76TDximz461bb/lNOnhO+cjG3oWi2HHK5GNyoq4kHGcqPW7a9joAy9jSLMLfNk/9fsO0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Received: from CY4PR1801MB2071.namprd18.prod.outlook.com
 (2603:10b6:910:79::35) by CY4PR1801MB1958.namprd18.prod.outlook.com
 (2603:10b6:910:7b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Thu, 4 Jun
 2020 15:57:24 +0000
Received: from CY4PR1801MB2071.namprd18.prod.outlook.com
 ([fe80::412:7771:b22b:7f67]) by CY4PR1801MB2071.namprd18.prod.outlook.com
 ([fe80::412:7771:b22b:7f67%6]) with mapi id 15.20.3045.024; Thu, 4 Jun 2020
 15:57:24 +0000
Subject: Re: [libvirt test] 149773: regressions - FAIL
To: Ian Jackson <ian.jackson@citrix.com>
References: <osstest-149773-mainreport@xen.org>
 <7c47a937-551f-2c7a-edd3-8b172155a506@suse.com>
 <24280.60980.488961.267238@mariner.uk.xensource.com>
From: Jim Fehlig <jfehlig@suse.com>
Message-ID: <f803ba59-4f9d-f300-8335-9c8f0ce22757@suse.com>
Date: Thu, 4 Jun 2020 09:57:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <24280.60980.488961.267238@mariner.uk.xensource.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:301:1::25) To CY4PR1801MB2071.namprd18.prod.outlook.com
 (2603:10b6:910:79::35)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.55] (192.225.185.129) by
 MWHPR11CA0015.namprd11.prod.outlook.com (2603:10b6:301:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Thu, 4 Jun 2020 15:57:23 +0000
X-Originating-IP: [192.225.185.129]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ddefc06-5c08-4fd3-e3dc-08d8089ff902
X-MS-TrafficTypeDiagnostic: CY4PR1801MB1958:
X-Microsoft-Antispam-PRVS: <CY4PR1801MB195824B70E699FFA0F2413FEC6890@CY4PR1801MB1958.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 04244E0DC5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dWS6R1ls7GtiEFnKIXYDwr09k8JyAnXfPVTJMTSCylepiwMkTyeU7l5JgieDVU0D4weiklCdjm8kkBzVRaYRSEjQq+prUqYaIgXO5j3pgoim/ROTXaq7p/+mJ78pJb6Kt086YXQ2eMSxjf9X32vWZE/2IFr0F/TLxiMrFFP864Y+QaT3jKvN7S0a0I5ySkZwS/3CaO8JnY3vzB5w61RvoPkfIRlXWdf/s5xqUZALYIMCV+o7h5GekXqFeyYeceN5DkpxBJorxFXZMz3tPDlirbX57fAmoOD8aJz5yIUSTfC4j5WhwRcdIVaoMmdEd4TRIsDgF0wG58UD7LB173bm1bLk6lV+N2NM08sbWe1WxeCLGK281vSbjCmAh2lDiT3ch7+YfEl688JnsdNBkt3Gb3j+lU1NrzHcZ5SYAxKDdCzgdCFMyyYU5lhzzs4aFQ2zPqvb9g6bb9YCXXZVoWR5aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1801MB2071.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(316002)(16576012)(31696002)(86362001)(4326008)(6916009)(6486002)(36756003)(478600001)(83380400001)(31686004)(8676002)(2906002)(54906003)(66556008)(186003)(66946007)(8936002)(5660300002)(66476007)(26005)(16526019)(956004)(2616005)(52116002)(53546011)(966005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Y5wLnPE2D2IHh06f8tNl/q6hbMmFKM/L6dQ2nPKW10atAeFpDcHhehX2vZJqCl2xx966S5uervZM/CZi6E8guwfWufLiUpSiOBiQJd+Ov1WShONe0B989mUMJPM9ekeQAfI6Dn+WLyQANrHQ2iaEl6t3XVqR0ePsQ0yrcUGK8c7Q+DZB74iH8VOQGvKKjRiHquKZ0fCG4Zk9axFZgY3WKrkOuHMMrT5OMdQ7gnART/NF3Oie8V96VOWuMF1AXp0uqYp4zz4LxRdklFXhXZNViTCQF9hoNBysVkudJyiAj8qSz8kSoAWkGcRPGTHpKt0fsgLG7BJ9RidGU37ij111crZ63DWI7guMekYU3vQKFGOsCoMC0k9acK1NsfzLX7TiyRVgMoHmgr2k7zlTuOzuLOafjz3KkC4YEsYFyoTfW4g2r9CEzgED/owFJR4cQV3P7vsuSLfpiLK6zpizXRfVXAm9BQaCfZOxJRY3E5Q2fT0=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ddefc06-5c08-4fd3-e3dc-08d8089ff902
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2020 15:57:24.5062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQOUxS8p5VfjPDj7N3plOMtRIHDqlMMmCfBCtyVIKaC5Ey6/TOlNP++WZNJHrr8gorhXZS1Etlb++Qf0xRaYdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1801MB1958
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 osstest service owner <osstest-admin@xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/4/20 6:51 AM, Ian Jackson wrote:
> Jim Fehlig writes ("Re: [libvirt test] 149773: regressions - FAIL"):
>> On 4/24/20 3:53 AM, osstest service owner wrote:
>>> flight 149773 libvirt real [real]
>>> http://logs.test-lab.xenproject.org/osstest/logs/149773/
>>>
>>> Regressions :-(
>>>
>>> Tests which did not succeed and are blocking,
>>> including tests which could not be run:
>>>    build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 146182
>>>    build-i386-libvirt            6 libvirt-build            fail REGR. vs. 146182
>>>    build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 146182
>>>    build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 146182
>>
>> Probably best to disable these tests to avoid all the spam.
> 
> I have fixed the build bug now...

I saw your patch on the libvirt dev list, thanks! I'm a bit embarrassed for not 
considering a fix on the libvirt side while trying to address this a few months 
back :-/.

I suspect the upcoming move to meson will be a bit more disruptive and will 
likely require changes to osstest.

Regards,
Jim

