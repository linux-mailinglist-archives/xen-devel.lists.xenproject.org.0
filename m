Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD62347E7
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 16:37:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1W9l-0005QK-3W; Fri, 31 Jul 2020 14:37:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy6+=BK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k1W9j-0005QF-Ib
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:37:07 +0000
X-Inumbo-ID: 4e37c76d-d33b-11ea-8e4c-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.80]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e37c76d-d33b-11ea-8e4c-bc764e2007e4;
 Fri, 31 Jul 2020 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4fP4MDk9m2b6laCbcsqr8wMhisUSTZRFuFt5iuwl18=;
 b=sDHyhaG4SckR2SyJLhkuXvlSkXXf7RNkOaEODfYtXDgAf61zyIEMc7I/PIgn92K0sr3iFEWS0SFvIFClePwvVJJu9WWohIOHYJNWASqfknSeRHcycCk4qlItSnQ0+OUV0ymd6dE4i9DF/LmUk4n/MVSltyBRFASma3VIAF714a0=
Received: from AM6PR01CA0065.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::42) by DB8PR08MB5482.eurprd08.prod.outlook.com
 (2603:10a6:10:116::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 14:37:03 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::23) by AM6PR01CA0065.outlook.office365.com
 (2603:10a6:20b:e0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 14:37:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 14:37:03 +0000
Received: ("Tessian outbound 73b502bf693a:v62");
 Fri, 31 Jul 2020 14:37:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9209c0734e0e4dd7
X-CR-MTA-TID: 64aa7808
Received: from cba7433004ee.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 994671D5-6954-4B08-BA14-EF4A2A9CB728.1; 
 Fri, 31 Jul 2020 14:36:57 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cba7433004ee.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 Jul 2020 14:36:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofpeGe0t87w08m7G/fzwMFHLzVF4swy85L9sHnNdyCfOL1MxQD0FP99A5Q0RVT1eyK6p9l0e1GpQz3QM3iTtg1TQ76G/tIX+B/aylgs+flkLNGpna3GKA2s3NrbNFvClPofVpDuKLUcZtZHm9HtDqnbeLbKkabuHAVuo5T3i/5gB7WUhiqfyDF7fF5B3CYM1xtF0lbgBMXiJMJAIjiNmMFJjFIEpZ3pvnXCmTXQsWjIZPj5p5ErjS7Vga+MO+peOMHxlwGt3S6H9c8RcrvWCzaU+ivWVsXGMaXJ/Uu3DTB7/nCbdcP1IHe7SsUDp2weP9+fCloAEJRQ/rgsmV0SErQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4fP4MDk9m2b6laCbcsqr8wMhisUSTZRFuFt5iuwl18=;
 b=e1jcC5b/KXPx5B0HwapU8jN+3/EKKEI5k5FEec5Ddrl8Jb4Z1w4s/0h8CCJ8X/pQKjSkJWzrbOJhTbAp2ePh4yEomDjRVw8Ec6VsbgSRodLyjgUNV17Kor+oG6W/R555ibce2Vs8gammBODUWs0IVLfN4DP7xnZDn73GuS4EPq07PFLtxcmnmdQY3l3mLDvoEvaRlk3kdlWq2UWlJxQ8+pO9WUEGxyZK2GUoz8r09WddMqQTOt7TUacLJRDKpUxiAN683RnqhYTP/6LJOUrJnuUiKwPEx1ARvW1HSV4bdNETX4KHnITGVDp3I8fNgj+X0z4hcDGrSYv0/Sc+tQ5VlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4fP4MDk9m2b6laCbcsqr8wMhisUSTZRFuFt5iuwl18=;
 b=sDHyhaG4SckR2SyJLhkuXvlSkXXf7RNkOaEODfYtXDgAf61zyIEMc7I/PIgn92K0sr3iFEWS0SFvIFClePwvVJJu9WWohIOHYJNWASqfknSeRHcycCk4qlItSnQ0+OUV0ymd6dE4i9DF/LmUk4n/MVSltyBRFASma3VIAF714a0=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5323.eurprd08.prod.outlook.com (2603:10a6:10:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Fri, 31 Jul
 2020 14:36:56 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 14:36:56 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH v2] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWZPcpcJdIAbXhcEqLxJ7JubPXUKkdZ+eAgAC8aQCAAMFpAIAAcn6AgAHoeQCAADumgIAAAacAgABIKQA=
Date: Fri, 31 Jul 2020 14:36:56 +0000
Message-ID: <E39531EE-0265-4387-813D-22A57CD3F67B@arm.com>
References: <4647a019c7b42d40d3c2f5b0a3685954bea7f982.1595948219.git.bertrand.marquis@arm.com>
 <8d2d7f03-450c-d50c-630b-8608c6d42bb9@suse.com>
 <FCAB700B-4617-4323-BE1E-B80DDA1806C1@arm.com>
 <1b046f2c-05c8-9276-a91e-fd55ec098bed@suse.com>
 <alpine.DEB.2.21.2007291356060.1767@sstabellini-ThinkPad-T480s>
 <1a8bbcc7-9d0c-9669-db7b-e837af279027@suse.com>
 <73c8ade5-36a3-cc13-80b6-bda89e175cbb@xen.org>
 <6066b507-f956-8e7a-89f3-b21428b66d65@suse.com>
In-Reply-To: <6066b507-f956-8e7a-89f3-b21428b66d65@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.126.203.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c0c3a65c-2c61-483d-18cb-08d8355f30db
x-ms-traffictypediagnostic: DB8PR08MB5323:|DB8PR08MB5482:
X-Microsoft-Antispam-PRVS: <DB8PR08MB5482DF6EE199251199BA60239D4E0@DB8PR08MB5482.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uTDLqnf4S6y3uOhB7oxMWosXXyFuH8IJkZLYqECLeV2fTeDuJpIPkiht41ik31sLpr6UtxS80FhwNFMKrdmw3BJGRYed/IcrzXheAeKV++tYf/KC0ItBTgY9k4LFqI3U325p8RpUS0hdBkUAkWIVae4P5BVPf6bxUtvAGedjl5msoONQ17Uesu2bnTXlduRS376CSAT3dgHtsVPYFWaNcAch3pa7KFeGMcql5wDlYGkkIGMa/tjhh71fwxTKJharGMVOMWav5biGJia0eFovjNHb/+teA8FAoCNff5wnfatANqHmAddoVG/zE1+Jp6LQQj7LlrNzKRD+tZjsGT0C3g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(6486002)(54906003)(478600001)(71200400001)(66946007)(76116006)(316002)(6506007)(53546011)(91956017)(36756003)(8936002)(7416002)(86362001)(8676002)(6512007)(83380400001)(2616005)(2906002)(33656002)(5660300002)(66476007)(66556008)(66446008)(64756008)(26005)(186003)(4326008)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: WtMOLnzM2IgstopKRYf9b1ZvfuCrfodmvBguiHAv9JdQKbr2+EtXZE8Y/Z75e2KGY6FfcuIzVg6T7cDu1mC3rQ/JYjfC6Sgdr/6TBhfNxqr805BqmdcqqZFBCR+pgGI1ZzxL4V262YOQ1PAXTvUdb1mba+gOKfd4pao9ZFhj4mGmiXSqU0UI29jyi9AtinUR7mKs9v3U5V0udPGArlRztof1OFEHheBQHn3jRplPSCfjXtrfCrqQIU+AQdgZNi43UlPxCtw3WhMj/CvlgQvBJKfTDLks0nWeRmlOirRFDNMkORPaBtQYFhUy39TAuxN2E3XRfbe7xel/mZ9vAPusyp5i+TsmhTXBRWqmCRshxKfaffN3AkSUyBg9CBQNnYYbvcmoX6BmSibZzM2twB/uovkT35FkTbLbIGI1hYMmyxSfD6GXmbZLKgoW9Y3pQegKMVzBGZyvzeJBOYMVsQ1yBWiBMzVptrH8IWVA0/Dpnpo6gCzI/PBO/3DkPXagki17G22fb6m9vt5Ba3ruHi8+W2DtQGFQEPZcg6Xo5ZDUVjCmWGlCYLqZYNh1UOej/Et0VhPoflNEVPmWAmcwKnjRez3TnL/Q/aVOJU7WAP2L3F7SSlFilfGceDxBvUfOQlCxbu/vpxMluQXi8N8fTgfTwg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <63D1AC863BF10C4F87D27D91394B0B7A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5323
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: a1128fd1-5154-407a-a558-08d8355f2d2c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TIOrp19BxsTfPDJZ43ACT9GWe/PaAt65EvoblZINoKW5j6WKAFQztwLoJZCChPVWhCL8iU0jgv4kO7y2G1jnMB74zt1+Sy2EuRzS0QU5V7BkFBMsgn9kBPxidrQ0ZSviTcdy69A7G7b70QLVpNe5j76uSuE6fUh2AidPK5e6aeMq7qPFl57Nwqmj74vHY+3kgHWvOXTBN7cdrdIW4RlV5HLy3xEZ+7hl5SiS+ZEBUsTV+I7X4U0cS4PVwBQ+qbaYWlEpjHXM8RdAlqXjMRzWDiF/mb1b1eBBB2HsZhdaxaYaujB+gnaukOM8BMAiTYdA0IHe3ZBnXGMU7e4wZiQm08o95gAw0PpBc5u2F9Ru21EPjoJeM0hd43jaN3YByMRRLl+gDDSYWZ6etAjwg5XLCA==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(46966005)(6512007)(53546011)(4326008)(2906002)(83380400001)(54906003)(6506007)(5660300002)(6486002)(82310400002)(26005)(82740400003)(8676002)(6862004)(70206006)(478600001)(356005)(47076004)(70586007)(316002)(336012)(36906005)(81166007)(186003)(2616005)(107886003)(36756003)(86362001)(33656002)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 14:37:03.0125 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c3a65c-2c61-483d-18cb-08d8355f30db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5482
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 31 Jul 2020, at 12:18, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 31.07.2020 12:12, Julien Grall wrote:
>> On 31/07/2020 07:39, Jan Beulich wrote:
>>> We're fixing other issues without breaking the ABI. Where's the
>>> problem of backporting the kernel side change (which I anticipate
>>> to not be overly involved)?
>> This means you can't take advantage of the runstage on existing Linux=20
>> without any modification.
>>=20
>>> If the plan remains to be to make an ABI breaking change,
>>=20
>> For a theoritical PoV, this is a ABI breakage. However, I fail to see=20
>> how the restrictions added would affect OSes at least on Arm.
>=20
> "OSes" covering what? Just Linux?
>=20
>> In particular, you can't change the VA -> PA on Arm without going=20
>> through an invalid mapping. So I wouldn't expect this to happen for the=
=20
>> runstate.
>>=20
>> The only part that *may* be an issue is if the guest is registering the=
=20
>> runstate with an initially invalid VA. Although, I have yet to see that=
=20
>> in practice. Maybe you know?
>=20
> I'm unaware of any such use, but this means close to nothing.
>=20
>>> then I
>>> think this will need an explicit vote.
>>=20
>> I was under the impression that the two Arm maintainers (Stefano and I)=
=20
>> already agreed with the approach here. Therefore, given the ABI breakage=
=20
>> is only affecting Arm, why would we need a vote?
>=20
> The problem here is of conceptual nature: You're planning to
> make the behavior of a common hypercall diverge between
> architectures, and in a retroactive fashion. Imo that's nothing
> we should do even for new hypercalls, if _at all_ avoidable. If
> we allow this here, we'll have a precedent that people later
> may (and based on my experience will, sooner or later) reference,
> to get their own change justified.

After a discussion with Jan, he is proposing to have a guest config setting=
 to
turn on or off the translation of the address during the hypercall and add =
a
global Xen command line parameter to set the global default behaviour.=20
With this was done on arm could be done on x86 and the current behaviour
would be kept by default but possible to modify by configuration.

@Jan: please correct me if i said something wrong
@others: what is your view on this solution ?

Bertrand


