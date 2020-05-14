Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E599E1D364A
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:19:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGZE-00045f-Is; Thu, 14 May 2020 16:18:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a33M=64=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jZGZC-00045U-FC
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:18:38 +0000
X-Inumbo-ID: 90cf4a02-95fe-11ea-a4b1-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.72]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90cf4a02-95fe-11ea-a4b1-12813bfff9fa;
 Thu, 14 May 2020 16:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89N85O5fAQXzsbCHBGrMAcoD6BAuvn5jSOH7dT0hUDQ=;
 b=wrMYX2C1+yWnKmzgLf7RoOwYjSpGGbgih2K+Yl8tqT8a0P8ppt61BmmY2OVmUP+yZ5nsrksPLwheNwobrvxROmQZQYUK2TIaV/rRDuaayBCFBfxKBHrjgGAxYu3VpfzwKlShNkS6SdGjv260YrvhqAvRVObN+7fqeVjHBJ4Kaog=
Received: from AM5PR1001CA0042.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::19) by AM0PR08MB5105.eurprd08.prod.outlook.com
 (2603:10a6:208:15b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Thu, 14 May
 2020 16:18:35 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::ce) by AM5PR1001CA0042.outlook.office365.com
 (2603:10a6:206:15::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Thu, 14 May 2020 16:18:35 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Thu, 14 May 2020 16:18:34 +0000
Received: ("Tessian outbound 11763d234d54:v54");
 Thu, 14 May 2020 16:18:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: caa49ff583a150a7
X-CR-MTA-TID: 64aa7808
Received: from d6ca09abcc5e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D2C22D94-D772-4181-ADD6-8B7FA9F8568C.1; 
 Thu, 14 May 2020 16:18:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d6ca09abcc5e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 May 2020 16:18:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SN6wGkX0M7LPPbZdUVxcyhOjvmoiY1JaPdrAe5+p/6kYsafCyC+PtFp1SIXfGCmnVkfURJzXWwyZjwXepmvBxMhdocJjsTp2vYRbxx+cgUW0k0PN+V+GD07B1q9L7rMLNHx2b9SSArwcPW7hSJB4teXYbFh5eeXPpt7fxXrLb00MwWbC7TdjfVNfa+puuuZySkif2alNvRTFSgfLGvI/+fJQx+DxTYQ9LiWQOoBFRQHuNYzT6x6KZunhwaT9CkfCfWOQ9gLxQ8yVjhbhUK3BXBJZi8/2eoP9sb6ByoKxKHPmdx4ACUVSJa1HK3ilqOxvSCbILebTOHEgvR387aNhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89N85O5fAQXzsbCHBGrMAcoD6BAuvn5jSOH7dT0hUDQ=;
 b=ZDr65+t5UKUo7nZqp99M9N7AyfmRXWER+HxyllzoxYV0LzARhtp+nfXirxEKY5McbY9FNw1VNpS4WknIRIA/Y6igFDkSr4EDZQHoCc4oqRuZsYMB6QS1qcla4iac7aOJKnPKfP4OK9XDlhBCIP1XcsIPle6UBHL1ZcLFOZ/9/EugdfJ8P0ZIrJqN0vA25IXYm59gPG77OITOZYYVDkzqFeY5N7FL6JHs3PWpH6P/lTdiY4GsLx/aWtkrhLtLsbv227aK93l+ikf6hFGqbku2xeEIU08561IEv+QYkO/w/WNEzwjWz+RaA4a8N4nNhIQ5Zp6cIg7wlrVa4n025Omlaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89N85O5fAQXzsbCHBGrMAcoD6BAuvn5jSOH7dT0hUDQ=;
 b=wrMYX2C1+yWnKmzgLf7RoOwYjSpGGbgih2K+Yl8tqT8a0P8ppt61BmmY2OVmUP+yZ5nsrksPLwheNwobrvxROmQZQYUK2TIaV/rRDuaayBCFBfxKBHrjgGAxYu3VpfzwKlShNkS6SdGjv260YrvhqAvRVObN+7fqeVjHBJ4Kaog=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3866.eurprd08.prod.outlook.com (2603:10a6:10:7b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Thu, 14 May
 2020 16:18:26 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3000.022; Thu, 14 May 2020
 16:18:26 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: Error during update_runstate_area with KPTI activated
Thread-Topic: Error during update_runstate_area with KPTI activated
Thread-Index: AQHWKfvm5I6PbMAmoUakTwbdgqMBQqinvLCAgAAF7oA=
Date: Thu, 14 May 2020 16:18:26 +0000
Message-ID: <2E95C767-FFE1-4A48-B56D-F858A8CEE5D7@arm.com>
References: <C6B0E24F-60E6-4621-8448-C8DBAE3277A9@arm.com>
 <2c4437e9-d513-3e3c-7fec-13ffadc17df2@xen.org>
In-Reply-To: <2c4437e9-d513-3e3c-7fec-13ffadc17df2@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c3eb7d23-65b7-4de3-d687-08d7f822737b
x-ms-traffictypediagnostic: DB7PR08MB3866:|AM0PR08MB5105:
X-Microsoft-Antispam-PRVS: <AM0PR08MB5105474C9DFCDC037D3AE2209DBC0@AM0PR08MB5105.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 040359335D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 7z7Umg/kC3kLSfBGEqGOcapWLpNZcyI+oPLN7NWxz4UFHU+QKZ5zEmkDUGWudZp6MgYWnMsTCtfRgSVy4VInKpi46vHXCLix0hK/6A+vJDFGcyRnWM9Eo1X17Kt4/wAqRgclVWIhAJuXxqmdEHP/MQSJ2gaQi8dBhzW29S3P5k+bj7+bqfpxSN0yl2TeBxhC9XHWGHeUZ80pAAHdRstOvjVPbjcizfFoZ9bUFB4RjcIq6f+7uzzqiogI/eeKPxTvDWCKZevG1iYF0acZ7WdQAb9nEfz3bWVWLSEJqjl0iBtnrSHf7N717rrMkhC5i5diFojfEy80D2rtl/PrS+XAegJT5Zd4kEZ8az/bNgN6jmJpIoOA5Y2MgP86+t2K5A9kIw0nxZ3VduH+ZFatu4J5mVVftXRIDzeqNJUvpCtbxm2+mZcPoqYVhwDhT1ZtVhqfJ0LV4kZMpmp0+zu92EHAquGe/Tr9O29sJ/xXwH2hMKYkyqgTjztZzq4QeIj7YbgW5lvnEFzqZQtJranYBzVdPA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(26005)(76116006)(91956017)(66476007)(6486002)(33656002)(64756008)(6512007)(966005)(54906003)(478600001)(2616005)(6916009)(66446008)(66946007)(66556008)(53546011)(6506007)(86362001)(186003)(71200400001)(5660300002)(36756003)(2906002)(4326008)(8936002)(8676002)(15650500001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: fL8gD2At0zHq2tM/IW0AnyKTDiGyZtVWYCQicBHne2QH60T+31mJNw+/WoilU6y6SPBxUEs6pEZaUMZKZKhU5Q0/IluqQc/LChigivfp/WSaW6fKVY+W1tSloaADW/YFwr1SNe4nr3tl3mSjYN52+2spT/JVTrC1Q7cew/gYvZkKpymW2F3sM9ag6nX/I2enkp5jsGUyljWdtIHZ1H5aF0J9WQCpkP4fhB0qD3Uo9Hmr5ZdlGlWZJIcEW/YB5M4Jus2+krheQqGGFnrWXX7yM01k2tKtw1OBV3Bb2yWa5bCPAAipvR7yhYD7O5dP6R14O3j0PQNAO3c8mSgouU2JGEBY7XLhuBcuFyNla3y1SH/xgukv7/84YqADGoztIimR4/+UAK877DBkg848M3CzhxNogek5C9/FA1JYDWvDjf2cztnb7SX4BJjKZ51QrvPSHIPBhKXuJZiUxIboy0yu0SsYn8AU/2HxSAUYOG+eUED0wGJxcyzLwwoPeOCMTycY
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <23F2A5A326571B499E346972F2169E5F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3866
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966005)(86362001)(36756003)(478600001)(47076004)(6486002)(336012)(70586007)(70206006)(356005)(82310400002)(2906002)(966005)(6512007)(4326008)(82740400003)(81166007)(15650500001)(316002)(8676002)(8936002)(54906003)(53546011)(107886003)(186003)(6506007)(36906005)(5660300002)(6862004)(33656002)(2616005)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: cad724d4-292d-40dc-c866-08d7f8226ed6
X-Forefront-PRVS: 040359335D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ld3hdmgegWdDpTZ8oy6MGW3kLS02wMNiKEpzSuv8n1539WGxwQjk+vd3Et7tF1h91OBjF5tsTydlAHTB8/pkkrsr85GqFDTJBksDzDZB/iscz2vrcLclRFf8v/dQpB/5xGDkLxQ/Ukory41b4ACI5GQPsi2xKJXfvwhF7afjOdQrzFuIPOR3qGtFfE34HKcWbicQ8xMPvtyauV9dPjxo190MoXX1q6dFiv8ncRIrhU4xhCddyi99Ka+VrX/Fu90MCpzTSOxa49cFbMeRZyWGrA9Q+Afx2n/X8nHtMIqqAbk8he0+/MtfIKh+6yOZqHXieEv75xK6ND10ff0qltAmOOUN5kkjy089qtrBtFOB41INn9Kup8q2se1wqQNNWyi6HFPwxnVBWFeAY2AwY8AmYd20lnmD3jz1A5RTT2QjF2eXnIrpo1wssYFvjBSPomUwlqYLZspsz0wOCx0By2OwAgFY/uMWHw+/HZeFFaNUXdY3sORfk9F975iYAS0pveqtLJcuWpi+nmTSEW4Wd0nTbuQinTD4RJDlEVtOAHedq861U9xMMdKBarbG7qbTPJ2CTjqVP3JmQ7mXuPHPZC2A7mohadCwDv0SylC42lSuAds=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2020 16:18:34.4867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3eb7d23-65b7-4de3-d687-08d7f822737b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5105
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 14 May 2020, at 16:57, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 14/05/2020 15:28, Bertrand Marquis wrote:
>> Hi,
>=20
> Hi,
>=20
>> When executing linux on arm64 with KPTI activated (in Dom0 or in a DomU)=
, I have a lot of walk page table errors like this:
>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>> After implementing a call trace, I found that the problem was coming fro=
m the update_runstate_area when linux has KPTI activated.
>> I have the following call trace:
>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>> (XEN) backtrace.c:29: Stacktrace start at 0x8007638efbb0 depth 10
>> (XEN)    [<000000000027780c>] get_page_from_gva+0x180/0x35c
>> (XEN)    [<00000000002700c8>] guestcopy.c#copy_guest+0x1b0/0x2e4
>> (XEN)    [<0000000000270228>] raw_copy_to_guest+0x2c/0x34
>> (XEN)    [<0000000000268dd0>] domain.c#update_runstate_area+0x90/0xc8
>> (XEN)    [<000000000026909c>] domain.c#schedule_tail+0x294/0x2d8
>> (XEN)    [<0000000000269524>] context_switch+0x58/0x70
>> (XEN)    [<00000000002479c4>] core.c#sched_context_switch+0x88/0x1e4
>> (XEN)    [<000000000024845c>] core.c#schedule+0x224/0x2ec
>> (XEN)    [<0000000000224018>] softirq.c#__do_softirq+0xe4/0x128
>> (XEN)    [<00000000002240d4>] do_softirq+0x14/0x1c
>> Discussing this subject with Stefano, he pointed me to a discussion star=
ted a year ago on this subject here:
>> https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg03053.ht=
ml
>> And a patch was submitted:
>> https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg02320.ht=
ml
>> I rebased this patch on current master and it is solving the problem I h=
ave seen.
>> It sounds to me like a good solution to introduce a VCPUOP_register_runs=
tate_phys_memory_area to not depend on the area actually being mapped in th=
e guest when a context switch is being done (which is actually the problem =
happening when a context switch is trigger while a guest is running in EL0)=
.
>> Is there any reason why this was not merged at the end ?
>=20
> I just skimmed through the thread to remind myself the state. AFAICT, thi=
s is blocked on the contributor to clarify the intended interaction and pro=
vide a new version.

What do you mean here by intended interaction ? How the new hyper call shou=
ld be used by the guest OS ?

>=20
> I am still in favor of the new hypercall (and still in my todo list) but =
I haven't yet found time to revive the series.
>=20
> Would you be willing to take over the series? I would be happy to bring y=
ou up to speed and provide review.

Sure I can take it over.

I ported it to master version of xen and I tested it on a board.
I still need to do a deep review of the code myself but I have an understan=
ding of the problem and what is the idea.

Any help to get on speed would be more then welcome :-)

Cheers
Bertrand


