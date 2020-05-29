Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434BD1E7870
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 10:33:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeaRq-0004eU-N4; Fri, 29 May 2020 08:33:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYAP=7L=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jeaRo-0004eN-Hy
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 08:33:00 +0000
X-Inumbo-ID: 00946000-a187-11ea-a87e-12813bfff9fa
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.67]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00946000-a187-11ea-a87e-12813bfff9fa;
 Fri, 29 May 2020 08:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5BzPPSFQvc9wW4UV/9/2D3DsN+5dgsKOAgzDAHFIdA=;
 b=MC51E3rqi2LPZrDsX0VbgNGvpxdONRSp9CyE6oe3O8q91dvfi76rRNzFz82qkapx5IRxFDJw7lg0n7F6Ki5fa/F7LwFTEEfGryKmAIFfWZ2KZDq5qrx3CKEKLQLDRTGPWGiPzEZyb5v0oPLg7WmAeEvoQrEa9e+ncpU4BSJYJFw=
Received: from DB6PR07CA0001.eurprd07.prod.outlook.com (2603:10a6:6:2d::11) by
 DB6PR0801MB1880.eurprd08.prod.outlook.com (2603:10a6:4:74::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.27; Fri, 29 May 2020 08:32:58 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::4a) by DB6PR07CA0001.outlook.office365.com
 (2603:10a6:6:2d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.8 via Frontend
 Transport; Fri, 29 May 2020 08:32:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 29 May 2020 08:32:58 +0000
Received: ("Tessian outbound cff7dd4de28a:v57");
 Fri, 29 May 2020 08:32:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f3c6309428053c17
X-CR-MTA-TID: 64aa7808
Received: from e24b14a90549.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF3941F9-8BD8-46F4-9CEF-2D2F93F0FBBF.1; 
 Fri, 29 May 2020 08:32:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e24b14a90549.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 May 2020 08:32:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guxG7GS7TkFTAWC5cq4tOx3PNhRbUOPs2Z/USwmY9flzS+Y6dpHtJywWLokeH7RSEsCY67SBwLvWSbQqeJ9iIoI4EMIQlCQD8N9J4o5GylM6O3325jjDIhIt4ZpI/SbwWDeO0yy6j0jlLA519TkkVej52LMZ87BxScuANSFNnSRjN88MPduLQgpDztlAb7wHGYuGw50OU5WvS+p2zaUFo9khxgxMdgk3B/+utFny2UDc9rKQ1FsTVbEk8xi5KjAKvvkX01kCFNH+1NfOVowja75B6pOdLXUNV2PJqegWLxjXCkRekKh2s02rx1Nk+VKYD+7NzG9m+FbH8YuTgVY7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5BzPPSFQvc9wW4UV/9/2D3DsN+5dgsKOAgzDAHFIdA=;
 b=IE+4P1akeTTPtOjlRmWiDPPEcNQhniWYLW4Av8h+DCUAwqUrTpv88jyety5HD1MTWiloLZpcU6uZbnGbkTe+2GS0EeWiJ+MJ56bMqZTrYIZZElvMbD//Vv6MD1RXzI1DfbPZVaIgX5PSzcxyM2k0TmQBzjwuKNZKU/uGoXllqa/gFvE5rYovet+XSFBeRSFofCUVfvYb7EtP4W9Www4znaDCMfs6usuKnZHqbdYKxLtdPj30EHWZJf3JwB7VbHoRr8rdfVS6J5NTTOiy8fXSdHrfBXud29yOdFgTYNr5R5Hfcb2F9FBq41XuKjW/F1S5E1YSL5eIWwvX6dJO+ac8gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5BzPPSFQvc9wW4UV/9/2D3DsN+5dgsKOAgzDAHFIdA=;
 b=MC51E3rqi2LPZrDsX0VbgNGvpxdONRSp9CyE6oe3O8q91dvfi76rRNzFz82qkapx5IRxFDJw7lg0n7F6Ki5fa/F7LwFTEEfGryKmAIFfWZ2KZDq5qrx3CKEKLQLDRTGPWGiPzEZyb5v0oPLg7WmAeEvoQrEa9e+ncpU4BSJYJFw=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3020.eurprd08.prod.outlook.com (2603:10a6:5:1d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 29 May
 2020 08:32:51 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 08:32:51 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Topic: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Index: AQHWNP6nIxIB/r3XC025DLnqIbmaJai92N6AgADUiwCAABAUgA==
Date: Fri, 29 May 2020 08:32:51 +0000
Message-ID: <B5889544-3EB5-41ED-8428-8BCA05269371@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <dcfbca54-4773-9f43-1826-f5137a41bd9f@suse.com>
In-Reply-To: <dcfbca54-4773-9f43-1826-f5137a41bd9f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 50044696-2ab6-4014-ece8-08d803aae437
x-ms-traffictypediagnostic: DB7PR08MB3020:|DB6PR0801MB1880:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1880CEED50294EA422DF91609D8F0@DB6PR0801MB1880.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: UyLy3c5UST3h0ONVJOd2Iw/Sdf8PouRsMweJIjEC86ZlB+tC9+CarntmIePaPvzRLmy+EGFWOUPqhna/iYdUzjXv+1cJO/06dz988L9FgkBJGErbF9oU5axBkzJ4voYZY8aabLN6tYdqF9Iv5kUmyMf8mVr2I4kIj2k7F+PBJ9P40C5C0RR4ogdv+AEIGKM31j3GkLHgoiNPYF2FzZh5X2DCEtjJDuJT2NgbzMCtXWEX7SmLhM5FuFFKU4FmBrWW/9iD5to5h4JoF/Rt4VzXZxRPYKajdsrK1pwGH5KyeYAJiXsN+P7yI7JTcgKMfnYi1mHnTOhYf2KFidq9Rt50Cw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(7416002)(2616005)(478600001)(71200400001)(316002)(54906003)(66556008)(33656002)(66476007)(91956017)(6916009)(66946007)(86362001)(76116006)(66446008)(83380400001)(6486002)(64756008)(8936002)(8676002)(4326008)(6506007)(5660300002)(2906002)(36756003)(53546011)(186003)(26005)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 7bdANW2kYBP30KEoh23A1HU/wBMXCQvITVTDfBxgLX02PO+BjeTbDyNrcyJW8mRKV2B2RmP3ACXDl24MIqexXhxo40Dp7gVvGc4AsTagnsEthNfFJflItMZ3k61A97Y8teWe8JhYPTZldfGtCIdi3ssnxw4lHoUBrLR9QgnNSpoSAkMd3okY29Pz2EI5lxcPceLbBkO+5l1NQ2wrwfn7qUnYtlCiWtqRocoglZMWQPp+MwPxEPe/QWGzJFek0OXr4VcwkzDfUQlNzi39mjAwBlzbCUllvAq6m8EMxtIkvRtagHzQWiV9gat0HqDTxs/5bXmm9F/LeEn7HdNc8Vs/HC5GIUGgloRQeRUWJPH+1kMxgAsF1ruJQfVGnkKhOcL62dohG7/fGcJIYbqjv8lP2NU7+g0gzmuacDbiUi7Dmf9x4JSdFNQuCDPnVUOKsLEBBR5BmOX55VIiNqqBHqE18e+ms/cRJgJcjZ5UQt7lmH5RM5THj83QV3QO15y7mHGd
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <40A53B9510EABF4C9A65849D63CC6B34@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3020
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(70206006)(70586007)(336012)(478600001)(2616005)(6862004)(4326008)(8676002)(6512007)(8936002)(2906002)(6486002)(316002)(54906003)(36756003)(82740400003)(82310400002)(81166007)(356005)(33656002)(47076004)(5660300002)(83380400001)(6506007)(53546011)(86362001)(186003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8ce062ff-6440-458a-d74b-08d803aae087
X-Forefront-PRVS: 04180B6720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1muwqaRvUbsvnbzEE7ud7br8lYHaMbAajF4ryqI2K+5zOHI/eYcSjGyVmA2e2c9XRthMLB6GmdUnFTtqanOK5yzlvKVGEJLh6xfHSLAMgyMFtMPUz4M8bpdPA/M3ET4tZ6fhZYQmJAOl7BKVag5eS+wmoecr2z9VsUk9stX0KehofIY5LXNjEo0eHbCDPVHgvo6VFdUhqeOcfAIbpr8XyPhoLlf7kBOMWFL7G9htfWPwt+ICYT+I/Z7Xpx9Y4Jcf69tsUOR6lcZxvie9StQDx34VH82mQHALRYe+gXudgE/miAhrYN2pFZeYGL/Yapur2SI67mMQu9lf2jlPbnvGoV76dxuTaA7gCnuPp6Py+KOPfLmUnqv25kEphvrE4hMh5kEOixOn7d2gDAffNZo57A==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 08:32:58.1049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50044696-2ab6-4014-ece8-08d803aae437
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1880
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, "paul@xen.org" <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan

> On 29 May 2020, at 08:35, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 28.05.2020 20:54, Julien Grall wrote:
>> On 28/05/2020 16:25, Bertrand Marquis wrote:
>>> At the moment on Arm, a Linux guest running with KTPI enabled will
>>> cause the following error when a context switch happens in user mode:
>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>>>=20
>>> This patch is modifying runstate handling to map the area given by the
>>> guest inside Xen during the hypercall.
>>> This is removing the guest virtual to physical conversion during contex=
t
>>> switches which removes the bug
>>=20
>> It would be good to spell out that a virtual address is not stable. So=20
>> relying on it is wrong.
>=20
> Guests at present are permitted to change the mapping underneath the
> virtual address provided (this may not be the best idea, but the
> interface is like it is). Therefore I don't think the present
> interface can be changed like this. Instead a new interface will need
> adding which takes a guest physical address instead. (Which, in the
> end, will merely be one tiny step towards making the hypercall
> interfaces use guest physical addresses. And it would be nice if an
> overall concept was hashed out first how that conversion should
> occur, such that the change here could at least be made fit that
> planned model. For example, an option might be to retain all present
> hypercall numbering and simply dedicate a bit in the top level
> hypercall numbers indicating whether _all_ involved addresses for
> that operation are physical vs virtual ones.)

I definitely fully agree that moving to interfaces using physical addresses
would definitely be better but would need new hypercall numbers (or the
bit system you suggest) to keep backward compatibility.

Regarding the change of virtual address, even though this is theoretically
possible with the current interface I do not really see how this could be
handled cleanly with KPTI or even without it as this would not be an atomic
change on the guest side so the only way to cleanly do this would be to
do an hypercall to remove the address in xen and then recall the hypercall
to register the new address.

So the only way to solve the KPTI issue would actually be to create a new
hypercall and keep the current bug/problem ?

Bertrand


