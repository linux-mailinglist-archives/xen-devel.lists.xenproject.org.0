Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44BD5A2B80
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 17:45:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393977.633209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRbW0-0000Ku-Dr; Fri, 26 Aug 2022 15:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393977.633209; Fri, 26 Aug 2022 15:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRbW0-0000Ie-AI; Fri, 26 Aug 2022 15:45:00 +0000
Received: by outflank-mailman (input) for mailman id 393977;
 Fri, 26 Aug 2022 15:44:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vie8=Y6=citrix.com=prvs=230ac0225=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oRbVy-0000IY-V1
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 15:44:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0749a04b-2556-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 17:44:56 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Aug 2022 11:44:47 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6490.namprd03.prod.outlook.com (2603:10b6:303:121::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 15:44:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 15:44:45 +0000
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
X-Inumbo-ID: 0749a04b-2556-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661528696;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=byebvgocJ0SMH0ecrkrZWg/Wg9uIkCbiymzNClGtrJs=;
  b=cnFxXQj8w7VsTV820v4EoJU1mXcBo7GJMUycCNfC3UF/RdFUq1j7mbxH
   YOYzqaGSgyFQ1F6U1EqYZEHZ83h7pjTalXbPkitYq0iZ88kzLq9m1uaqq
   uf/ItQVfgJBd7x08jUzfx/5kMwE5jOtRFKMdH6ExNINigwMGqMdjgRsky
   o=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 78278439
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HxaCT6nmDbBEDNZMm/DV99no5gxhJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfWTvTO63bY2b0e9knPtjgpB8CuZ6Dm98yGwY5/Hg9HiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37K6s4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kZY6NFpehFHltA5
 KNBJD09TSmjnuSflefTpulE3qzPLeHNFaZG4zRM6G+cCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAH7gvL9MLb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+trSL22b+TxnKTtIQ6NuG0x/1wrVyp+jINIiQmTWG0kMLmsxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4FuQg7QiXx6n84gCHB3MFRDpMdNwnssAtQTUgk
 FSOmrvBByFrsbCTYWKQ8PGTtzzaETMOMWYIaCsATA0Ey9ruuoc+ilTIVNkLOLGxps34H3f32
 T/ihDgzgfAfgNAG042//EvbmHS8q57RVAk36w7LGGW/4WtEiJWNYoWp7R3X6KhGJYPAF12Z5
 iFayo6Z8fwECoyLmGqVWuIREbq15vGDdjrBnVpoGJpn/DOok5K+Qb1tDPhFDB8BGq45lfXBO
 yc/ZSs5CEdvAUaX
IronPort-HdrOrdr: A9a23:EqPHfqPL6jQ5jMBcT2L155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KcuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw6zvmWehTNYd3E8LAs27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.93,265,1654574400"; 
   d="scan'208";a="78278439"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNy1GaIGB0hxzeEmdUGbYLwyQDPzs161ddwPczIofomhsVUQctO3Lgtif9aYlYLq0IeDOoH+7DGfQGkyQdsI9dTR6pmb3fnAsjk0HlXdx6VsXGu1zDXwf4jJ0P/6XUWje0Ua+AlgnviV5NjYyz+QQqpsJ5yYNg3x+i1ZOM2c+CshnQBKPAGV9N3T06/FhbI6t5lbPNWy+z1zHNlajt4A7+eroABTvZTM/qt2qJErkTwmPM5fi0aihoFESCsWoCo8UjlwRvKiYkZwGLzTZUP3y4JYU8kgZDxdblntgu2IyM7nnQdGLvF8ISi0fSKZKY2X0ncu6w7OuCTWlMFZ2IUzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byebvgocJ0SMH0ecrkrZWg/Wg9uIkCbiymzNClGtrJs=;
 b=GOBdW1tMi3qF0xEppuOSyN51AN4UzYR5/TeTW0R4poolfV7xYkiPjNt4wDhEfdk/LPJfeucgYchz/0cOVfSoVwWeQnTNN8beA6RPkfW9F2RWnqUy0Zce60JWuMjX+C5d7B3/wvmBNOMk/qN9pqx7sZuuNaXwDy+SiX/fYQasHvfmyGJvvgX6R9Tbu0vJVcDV+yLhA1LZdtvIHbI0zqSqvLHiw+bTzVUcDdnZ/bfODv0odCQBHPB4+poURuIyWetI1LpFE5brTf72FCItHywN46d+q+7OsUf7/aLpbrK23PcbQe0xeloY03gqADXo6roHe6ezEogLQUD24jUs9jxjlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byebvgocJ0SMH0ecrkrZWg/Wg9uIkCbiymzNClGtrJs=;
 b=NADJO0LPDzAopnsIxxolGwoN2OrJQ/j1NtIRBMvvC3mMKQdot4Jwra3Kgw3DWgvgKxOOt0B8lNMq7wvpZxXBNCrE25AS2vgiAl6OvcmUzTof3zq3ctHdGIELjwRavhR5L6TZblcjQ7N32VrX9fONT88mnBkHATAFtYD5sSHO+Xg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 9/9] drivers/char: fix handling cable re-plug in XHCI
 console driver
Thread-Topic: [PATCH v5 9/9] drivers/char: fix handling cable re-plug in XHCI
 console driver
Thread-Index: AQHYtju+MGvvHxrE+0SJmR6WoIYDR63BSeoAgAAPJAA=
Date: Fri, 26 Aug 2022 15:44:44 +0000
Message-ID: <6ab5ac63-becb-3635-20f5-dd0f03188003@citrix.com>
References:
 <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
 <bf26655295d0d85b1718d60f2e4390da7ec62b93.1661181584.git-series.marmarek@invisiblethingslab.com>
 <cdbe1100-0a28-cb4d-6a89-5efc5838f4c4@suse.com>
In-Reply-To: <cdbe1100-0a28-cb4d-6a89-5efc5838f4c4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: daa774e4-f0d0-47da-ec6e-08da8779e634
x-ms-traffictypediagnostic: MW4PR03MB6490:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VEAchxnsHVYMFX9s6kQs5wEzvX2ZXBvgJUykCtYFx2xAMGLvg49nljHLlkKt8Q8IJ4GjV9rWMi8Nk4b9YbFZKBM+4OInsCDac/eNJIP5Zu9kHq4kKnZoawn5uHDkQz1utEQOgXdXWZn0915C8W+u+D1/+wUYcGvYOwZU/B0Kd7y8t8pspys6jEeQL0dlb7cF9Xkrm9p9e4lrLUgOm8ReJkNjlGa8fXd4CSD4TlgE5YvK+PcfkWobR3Ix7cRF5EMT+UA+FUGFX4gFRWPcLvNRPMf2OKc3HzXRJGwjxFyEeArKDJtU5XkNO11tEKw24DYgTKmCTT2ylVx+tBReD2/J9ikg5y8qlsE93/6BlcTwxjjEuTbrDJ28GPXL/XLJ5C0dhuLKJ9MvF8rHEeYrjCNT5oCTjVsJ4NQXpbIFI7omtBuAc/63j2Ev9cvwzkom9zbd40V2hIa9MXRxe9vwIZve0s8hYJ85WjwAXZpEafZxt6+B+UQHmH3swwf9OpiqL5c831msLohRdPSbL+GUhTCzJt/AUXiGmNtDU+L4r6J9+PAkETY7TyWd7A/sNhOklkWRKjbRNTLf6lgRmmoaZXOZlXe8bjQwkSD6/AwISwbAtILxgqNM/H0Jjtb/GMyfeBxPRx/1k8AB1S+cz2CPmn2BF4gelZxLwThkphV3EfHN/jo4Srj9Hj/xtrAn+QIUPnHFKAmSzGV1QN1gxOeb+ea0EXEGS/7KueZD8Y0WydXDv3QT3rePqmZqGoOskWK7izIuQSQLU2Bej+BWrxOwMKrvf6fHyx0my/0dyhvAFAoRWNbpp1IPeRllU2ZLlvLfw+dVQjyPvxpbPvXc5FUaFBHgaQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(66946007)(91956017)(38100700002)(122000001)(38070700005)(82960400001)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(31696002)(86362001)(31686004)(36756003)(83380400001)(6512007)(478600001)(6486002)(6506007)(53546011)(71200400001)(41300700001)(54906003)(110136005)(316002)(76116006)(2616005)(2906002)(186003)(4744005)(5660300002)(26005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YS9hUzZoWDZUM3dJUStOTHZFWXV1U3cyOGt0WHBBOEMrS2U2M0pUREFLeWNB?=
 =?utf-8?B?aHdMNklxaFF6bkJiQ0oxVEd6YzZ1VFN2VHlDcUJCS2xzbXR3WURITmFCNlQ3?=
 =?utf-8?B?RVZHZ3d1QlcrRGkvL3ZUNk1SQWora1VLUnc4aHFnWnk4SlFlcGdtc1JrcnU3?=
 =?utf-8?B?RTVkWlpYK1ZkWmc2MmY5MXBlMWVBR0hwZWhaZGVtUUcySnJXeE1rZXd0TmJD?=
 =?utf-8?B?Q2Z1OU03RlkySGR2cFJLR1l1VmFlbmNwVVBhU0VLRkpTY295YWJFMld3VFow?=
 =?utf-8?B?OWg3a3dCeEZQcjRpWjJIZ2FKSlZEc1BsRFY4aHlmUFkzV3RUTklyOFFnN3B5?=
 =?utf-8?B?Z1dzajRVajlSOEhnMWh6d3BucUpRUU0xcmhPQVBNT0NWTTBaUlphOUl2WHkr?=
 =?utf-8?B?N1NWeUJyOEdnbE5ZQmZ1T1ZtRCtqcXZOWXZpdG5POXZTeUd0dmFsQnVJbExY?=
 =?utf-8?B?eVVEc3Z2R0JTQ0NqV3FTVnVsdzNSejRoT1pqYWlqTm85ZWFrMW5QY2s0UUUy?=
 =?utf-8?B?RU1NK1VtVFU5N1ZWNlFsYWxhbzArMldiMUd4TXh0MitFYzdFU29Dbk9kdStR?=
 =?utf-8?B?QStlUlJlVkZPVXBPRGx4MFpobFBTTFJxdXBrS0hnZWRsZDRrVUdRd1hrLzg0?=
 =?utf-8?B?Vnp6bkdrNGY4WDVvdUxlQTdTd1QvYzVQd2t5U2RxWVg2THpaTU5CU3lBQW5o?=
 =?utf-8?B?MEtpRURMQ0gyYzg3ZXBQTDlLYk1Dc1ZDUmozeTgvbk9nRWdMK1h6RC82a1pM?=
 =?utf-8?B?SURpTHFkL1pTOXcxVkkvbHZvUi9LWGtPS2Y4dk1TN3lidDFySmh4dXlRSkRH?=
 =?utf-8?B?U2FXaExrcExmNittM1l0Rmd5R3oxdlRWaFEvVUsyT2FQdHRlR09mTWExQkE4?=
 =?utf-8?B?RjNwOVp0Y1BMcFQwZGlKek5jWUJJajFuektWa2hyd2FDdFNlQi9wOHpucVpi?=
 =?utf-8?B?dmhhS1RuOGNNWDUwMHJ5dTVJTmc2dHA1V3laMUJDTUIxcDlvWkQ2QUUxRTBy?=
 =?utf-8?B?MTRaY1EzRnA0NnhpcGxjbjJJVm1MVFJuNFBEblBhNlVsUjF6eDROMEo2NTdV?=
 =?utf-8?B?TW1NVkNZdUhUV3NRQXhyTUsycE1Ua3NIcGI3dlMzc1M4VXltUzVoZzVDSFJN?=
 =?utf-8?B?cjdiRFMzckVmbDJVV1NHY3gxYysrS2kyYmp5Ync3cU52VEROWlRUejBUdEpm?=
 =?utf-8?B?dG1TbG03c0ExTE5oMy9TZ3RxaVdrd3hZMWs2Qjg4VWt6REliSXowSFJTN3pt?=
 =?utf-8?B?Mnk5MmtUd3pKSFl1VWpybFYvRlJSMHM4SEpvZk4wWmF4Mm9YL0FhWXB0TW9G?=
 =?utf-8?B?Qzd2bEVQU2QreW1yZ2hpRVhQeXVxNXdLdE0yaW0xbUNWOEtWYVJjVTk5ODRW?=
 =?utf-8?B?Y1VKeC81MGIvaFg1TzNLOU9Ga0Vha1ZhWHJHb3c1RXdXcFBUOVNBVElXcDFr?=
 =?utf-8?B?Q2U0YnRDT3hLZU95emNJWmIvdWlld00zZWovRVNsKzN6UDl1aWl6U1ZUQ1pV?=
 =?utf-8?B?TXZxTlBmR2FleFllRnpuTG9LZHcxUzlXSWRwM3gzUThFdGlqeW40dFVlUlp1?=
 =?utf-8?B?VDNRRzdBdFhGVXNOeVlDV2x3K1V5emdRYUJNbjlINGVsNHplWDVkYmk5VlRC?=
 =?utf-8?B?Vkh1OEdLZjd4WFgvUjROU29VQzgraTRWMklsTFJZTFk5eXRDS1JsQ21QVEhZ?=
 =?utf-8?B?aGZUVnJNTzE1eDFOZ1dNRG5Kd0NPWHVaQjhYM0VUemQwYzhvYmdmTDgxMm5V?=
 =?utf-8?B?cnFPb05XL3pJV2M0RGdiNUZ5b3QzMWUzVkFhUWh2VDgyME1MUUYvMTcvQXE4?=
 =?utf-8?B?YSt6Z0NJMFl6dTliUXRBK00xcTVWOHRDQXhTaG9LMlNESGEwK091cTB5MUxS?=
 =?utf-8?B?cnZWRHcxMWh6YW1qRkpSSThIVEtrYXZHeS9tcjVsNHE1ditFeng3NW1yOCs5?=
 =?utf-8?B?anhKN2IyYlhPay9rUUpCcythbHlsaHk0T0FONWE0VFNnTml0VzJ0b3hnMzJj?=
 =?utf-8?B?T0FYclhNNjY1SEhpNER6TEg3TEx5OXlNTXhQdDBlZEtZODVlS2JHc1VOK2Vs?=
 =?utf-8?B?NTFUVmFDQk5LeFkrSGhVbHk5RWxEMkVONklCRGtqUHJwcmNuc0d1VTZFb21D?=
 =?utf-8?Q?vFL+8U8jNGXAAd1aN8srJQU0p?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DFB37839C502F4CBCB62E829965F49C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daa774e4-f0d0-47da-ec6e-08da8779e634
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 15:44:44.9210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0CHn8r6I79wqDN5TCt89eUtlnZdN4hqLCY/o2vpo2D9XdhPUWCDMTpl7w76r8Cio3PCkKyr6iG2dx830+p1NFqKVQDOdEeR6oSQoS6KGfJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6490

T24gMjYvMDgvMjAyMiAxNTo1MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIyLjA4LjIwMjIg
MTc6MjcsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4+IEBAIC0xMDIzLDYg
KzEwMzIsOCBAQCBzdGF0aWMgYm9vbCBkYmNfZW5zdXJlX3J1bm5pbmcoc3RydWN0IGRiYyAqZGJj
KQ0KPj4gICAgICAgICAgd3JpdGVsKGN0cmwgfCAoMVUgPDwgREJDX0NUUkxfRFJDKSwgJnJlZy0+
Y3RybCk7DQo+PiAgICAgICAgICB3cml0ZWwocmVhZGwoJnJlZy0+cG9ydHNjKSB8ICgxVSA8PCBE
QkNfUFNDX1BFRCksICZyZWctPnBvcnRzYyk7DQo+PiAgICAgICAgICB3bWIoKTsNCj4+ICsgICAg
ICAgIGRiY19yaW5nX2Rvb3JiZWxsKGRiYywgZGJjLT5kYmNfaXJpbmcuZGIpOw0KPj4gKyAgICAg
ICAgZGJjX3JpbmdfZG9vcmJlbGwoZGJjLCBkYmMtPmRiY19vcmluZy5kYik7DQo+PiAgICAgIH0N
Cj4gWW91IHJldGFpbiB0aGUgd21iKCkgaGVyZSwgYnV0IC4uLg0KPg0KPj4gQEAgLTEwNjYsOCAr
MTA3Myw3IEBAIHN0YXRpYyB2b2lkIGRiY19mbHVzaChzdHJ1Y3QgZGJjICpkYmMsIHN0cnVjdCB4
aGNpX3RyYl9yaW5nICp0cmIsDQo+PiAgICAgICAgICB9DQo+PiAgICAgIH0NCj4+ICANCj4+IC0g
ICAgd21iKCk7DQo+PiAtICAgIHdyaXRlbChkYiwgJnJlZy0+ZGIpOw0KPj4gKyAgICBkYmNfcmlu
Z19kb29yYmVsbChkYmMsIHRyYi0+ZGIpOw0KPj4gIH0NCj4gLi4uIHlvdSBkcm9wIGl0IGhlcmUu
IFdoeSB0aGUgZGlmZmVyZW5jZT8NCg0KQXMgYSB0YW5nZW50LCBldmVyeSBzaW5nbGUgYmFycmll
ciBpbiB0aGlzIGZpbGUgaXMgYnVnZ3kuwqAgU2hvdWxkIGJlDQpzbXBfKigpIHZhcmlhbnRzLCBu
b3QgbWFuZGF0b3J5IHZhcmlhbnRzLg0KDQpBbGwgKGludGVyZXN0aW5nKSBkYXRhIGlzIGluIHBs
YWluIFdCIGNhY2hlZCBtZW1vcnksIGFuZCB0aGUgZmV3IEJBUg0KcmVnaXN0ZXJzIHdoaWNoIGFy
ZSBjb25maWd1cmVkIGhhdmUgYSBVQyBtYXBwaW5nIHdoaWNoIG9yZGVycyBwcm9wZXJseQ0KV1JU
IG90aGVyIHdyaXRlcyBvbiB4ODYuDQoNCn5BbmRyZXcNCg==

