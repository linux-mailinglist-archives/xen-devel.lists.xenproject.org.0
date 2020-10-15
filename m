Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A2D28EFE2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 12:10:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7203.18855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT0DZ-0003pB-BY; Thu, 15 Oct 2020 10:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7203.18855; Thu, 15 Oct 2020 10:10:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT0DZ-0003oe-6P; Thu, 15 Oct 2020 10:10:41 +0000
Received: by outflank-mailman (input) for mailman id 7203;
 Thu, 15 Oct 2020 10:10:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehY9=DW=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kT0DX-0003oY-AM
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 10:10:39 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.41]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0818378f-7a76-412f-ae2d-703fd6e6ca35;
 Thu, 15 Oct 2020 10:10:35 +0000 (UTC)
Received: from AM6PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:20b:6e::39)
 by VI1PR08MB5487.eurprd08.prod.outlook.com (2603:10a6:803:13c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Thu, 15 Oct
 2020 10:10:29 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::63) by AM6PR02CA0026.outlook.office365.com
 (2603:10a6:20b:6e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Thu, 15 Oct 2020 10:10:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Thu, 15 Oct 2020 10:10:28 +0000
Received: ("Tessian outbound d5e343850048:v64");
 Thu, 15 Oct 2020 10:10:28 +0000
Received: from 652f2affa5c7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5E79CEDE-EF31-45F5-87D5-5C4807657F24.1; 
 Thu, 15 Oct 2020 10:10:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 652f2affa5c7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Oct 2020 10:10:22 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5179.eurprd08.prod.outlook.com (2603:10a6:10:e7::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Thu, 15 Oct
 2020 10:10:20 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 10:10:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ehY9=DW=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kT0DX-0003oY-AM
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 10:10:39 +0000
X-Inumbo-ID: 0818378f-7a76-412f-ae2d-703fd6e6ca35
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [40.107.8.41])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0818378f-7a76-412f-ae2d-703fd6e6ca35;
	Thu, 15 Oct 2020 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87f1sDpD7lWh4y7tN2tMTa1VeMTQwJBRmueQcvu7nlk=;
 b=08GY0XFSUuDyBzI7wJRorm1/VgkJl0rsVzmUaF9ByOmEYZDw6eptuffdYkc5ZUyxqAncgoTQSH/ybL9kDnXD78ERmsAGt9M4DcbX3S0ZYqEnWzpiSrQtMX5ksok6md6TmZTmpLR7riKn6+WZved4GsXPlZHNk4cHEw+4X6nCfuc=
Received: from AM6PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:20b:6e::39)
 by VI1PR08MB5487.eurprd08.prod.outlook.com (2603:10a6:803:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Thu, 15 Oct
 2020 10:10:29 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::63) by AM6PR02CA0026.outlook.office365.com
 (2603:10a6:20b:6e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Thu, 15 Oct 2020 10:10:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Thu, 15 Oct 2020 10:10:28 +0000
Received: ("Tessian outbound d5e343850048:v64"); Thu, 15 Oct 2020 10:10:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 04537f219bf83984
X-CR-MTA-TID: 64aa7808
Received: from 652f2affa5c7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5E79CEDE-EF31-45F5-87D5-5C4807657F24.1;
	Thu, 15 Oct 2020 10:10:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 652f2affa5c7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Oct 2020 10:10:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8XrDjm9vYwr2C/6siwhOeoFto4iTmFAywpPMBEJUhUOg6rOtaVB6MW2l1u97q83z6bi5IYI29pSY0DMTnPdu2G0UKIa8tLx0Un5eWGq4FrhQI3SqqKrT8XTehmxkClDmumPbyUlV7E0cazviugb+JDsz+OLMKuOKEqmKBwPk5sD3W+Od3SzvMRxV5OH2urfNDNnpF3gbadFz1HDKuavfD0mZSNQt6DiL7Cn0lCGF/8YXwZP52PJso3iTCkCqla6hhDiMZb7ZRWcy+DFwEBvCWI7SR88RQ9WDnW+dPBgwg/FjsU0jzn9a0FcPPUH7iNFzRc69ytRYNQMarsWKHMjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87f1sDpD7lWh4y7tN2tMTa1VeMTQwJBRmueQcvu7nlk=;
 b=Kzb56zhkc8sZ1rpaeFlLzt04VFNvSezjOqIWn38t/fUBtdXakZYAr7ahzyDeNAY+2KmiZwUOGq/bXU5DkOcwLEqRV/9WTCJ3T2XlNzp7mxcWnFFPNzuSvPXPoVP8rkFKxNKcR1TP/7c/GA9rNhKgq/gcjufL4+vJXZcuYPr5okBDMi3+C1+VthWQgsW8S3/OXUHfx/kW4C7qyyi1/hJ9BclhzFkjhBeAwFI01RgWlAv/iylahHMc2BtLaYOTg062fVsEnFjT/RVa7IyUxoS6IiEM4EF/o6svWKQ02RPK/mPn/K47qT9l6XXwuOtXVl6ttvE9snne89pGdF1AqyTt+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87f1sDpD7lWh4y7tN2tMTa1VeMTQwJBRmueQcvu7nlk=;
 b=08GY0XFSUuDyBzI7wJRorm1/VgkJl0rsVzmUaF9ByOmEYZDw6eptuffdYkc5ZUyxqAncgoTQSH/ybL9kDnXD78ERmsAGt9M4DcbX3S0ZYqEnWzpiSrQtMX5ksok6md6TmZTmpLR7riKn6+WZved4GsXPlZHNk4cHEw+4X6nCfuc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5179.eurprd08.prod.outlook.com (2603:10a6:10:e7::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Thu, 15 Oct
 2020 10:10:20 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 10:10:20 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Warn user on cpu errata 832075
Thread-Topic: [PATCH] xen/arm: Warn user on cpu errata 832075
Thread-Index: AQHWohbM+uoR14U9oEmwJFjy+kmnIqmW9/2AgABK1ACAABYOAIAAQVGAgADYZ4A=
Date: Thu, 15 Oct 2020 10:10:20 +0000
Message-ID: <C07DA84A-6527-4480-99CC-F6B26553E3FE@arm.com>
References:
 <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com>
 <26742825-25fc-0f82-2b20-d536e8380b2a@citrix.com>
 <90BC5355-EB52-469F-B0A6-ACAAB9AD9EF5@arm.com>
 <f49d478f-4efe-955e-c378-f2fa5fbc6a71@xen.org>
 <alpine.DEB.2.21.2010141350170.10386@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2010141350170.10386@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: be303455-a152-48e0-8cff-08d870f28b1b
x-ms-traffictypediagnostic: DB8PR08MB5179:|VI1PR08MB5487:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB54879CA93289985E0AFFC0379D020@VI1PR08MB5487.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UiOsnH0fhfcJK8p6cmDdkWX6o1IYpPiqEGHntdDHAgVuDh9wQMrxFU7hEv8m0qJKQugzaZSBSUfA3p76VEhLaaxuCULMosh9ltsLFk221JT1D/s0iW4M5iyODXboW06dN59khi2h6EVOtPr7dsvy3dQGwAGJbqu+sgoqO/VvJXzEjVy0oJwtrWLLHBGugdCosMyYI/hD1/JT/CtOsQJ72Ks/9l1Wy7cHFuWyhtFC7VHm82Mbo5bqH2wZDt6kmayasdl8L1+UomTAae0t8e4i85ZlXRlW2flIfmsvYGSGNgUXBHv/NphteYorYRMVlcfuoPCvtBciUSZ95MD9oHi4ew==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(83380400001)(8676002)(186003)(36756003)(71200400001)(66946007)(86362001)(26005)(76116006)(64756008)(316002)(8936002)(5660300002)(6512007)(66476007)(66446008)(33656002)(66556008)(6506007)(478600001)(2616005)(54906003)(2906002)(4326008)(6486002)(91956017)(6916009)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 XmvNaFEPtY3TmeB4cnbWtyK2yOK5UDiuTLfVdnXJ1sVNzSmi5p5ZYVvXh8pzu/NXYQ1RTe0z3/b2hIZXgVGXVRC8FT5Q3A33U8197k8fSqWBefZgphAJY4YCps5vVkEL2WgcPP/Zj5AzXnoZqx822OCfYHHMT+vWon8OxxHXg0Umw7R+2dcJx1f3csF36DeVKWqCocUI44zw6vnKm/jtEr2g+AVT/NeSbSer0WQWvpyLCXQRWE+rDOh6ekrmoyqDfumR6kwC4YXueruqlba4ooqSDB8ah7kiOrz0pcJs/2TPGi9QVeQypyvK/0PYy5f3FR6N5eMPQANQocEkXql9Msvc2V6REnx/JZeit7nAqpA+0DzFwUOawPHNYaLAv0lXBbSCUlpdBU2ro7H3gaeaxqJhrKAKxjusJ09pQXifeZNJOYjTv5gYlDGjsuQI9YBaxg4YJjL/tBN/OpcNv/WAQh3yiB/DijrmZsazvAQHBZvUpNTHzf4ZmZZAFO6blHf/R92zGRlvtwm+qkwjltBBBYRgOipvbm62ALgkWiKR112MVZnKG6zB1RmCn1JeEl7snVxiF3LDRozCKy6z/SWS073vthd7+l+mbbC/tZxu/RDDVV3C0lYdfziuWeSxPDcmkeOJnpC5g1ziZ+xbfcBwZg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <412B582677BE464E8C326BA3A04557FC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5179
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc034169-ca9e-4ba4-93f3-08d870f285d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bqcp62YEFY7tAY7TJp+UvHcURYZbRi79bcB5+TNS2ILzYH0SsAs+ro6UKrHTStFUvMCBMmSA1X4JkfIB3t8JgFnCmg0CwRr5L/xZDmGPiX9Nw0LYps1o5X1RzcDRBsvyPzRxfO67sWfOhqYRR6Lcc+RAKWeJ2nUhn3nrOBI4Cp8sCs8hKn4S01dqf+YWTiEIzbfcx3ZkjmgidI2T1U48E+chp0Taa3bp9T+6KFhdAs6f+3vTLHySC6bvOCLbHmFpFrEwORY23P+YwFAId06fEmsDcs5ZUwIJiPi3/ZpmUgATT05yV6f1nnqHNuuvO0VJaOhB4bSdkFCrgUZlwUjbmTOsIguInh2abkLn5fC14yj5YyteXCHqGgEAaF3nojc4HJKZQqVJRbi+VfhiVFIYiw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966005)(6862004)(47076004)(107886003)(36906005)(6486002)(36756003)(336012)(54906003)(2616005)(86362001)(4326008)(6512007)(8676002)(33656002)(8936002)(26005)(316002)(356005)(70206006)(186003)(82310400003)(5660300002)(478600001)(82740400003)(83380400001)(6506007)(53546011)(70586007)(81166007)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 10:10:28.9680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be303455-a152-48e0-8cff-08d870f28b1b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5487

SGksDQoNCj4gT24gMTQgT2N0IDIwMjAsIGF0IDIyOjE1LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gV2VkLCAxNCBPY3QgMjAyMCwg
SnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gT24gMTQvMTAvMjAyMCAxNzowMywgQmVydHJhbmQgTWFy
cXVpcyB3cm90ZToNCj4+Pj4gT24gMTQgT2N0IDIwMjAsIGF0IDEyOjM1LCBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IE9uIDE0LzEw
LzIwMjAgMTE6NDEsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+PiBXaGVuIGEgQ29ydGV4
IEE1NyBwcm9jZXNzb3IgaXMgYWZmZWN0ZWQgYnkgQ1BVIGVycmF0YSA4MzIwNzUsIGEgZ3Vlc3QN
Cj4+Pj4+IG5vdCBpbXBsZW1lbnRpbmcgdGhlIHdvcmthcm91bmQgZm9yIGl0IGNvdWxkIGRlYWRs
b2NrIHRoZSBzeXN0ZW0uDQo+Pj4+PiBBZGQgYSB3YXJuaW5nIGR1cmluZyBib290IGluZm9ybWlu
ZyB0aGUgdXNlciB0aGF0IG9ubHkgdHJ1c3RlZCBndWVzdHMNCj4+Pj4+IHNob3VsZCBiZSBleGVj
dXRlZCBvbiB0aGUgc3lzdGVtLg0KPj4+Pj4gQW4gZXF1aXZhbGVudCB3YXJuaW5nIGlzIGFscmVh
ZHkgZ2l2ZW4gdG8gdGhlIHVzZXIgYnkgS1ZNIG9uIGNvcmVzDQo+Pj4+PiBhZmZlY3RlZCBieSB0
aGlzIGVycmF0YS4NCj4+Pj4+IA0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVp
cyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4+Pj4gLS0tDQo+Pj4+PiB4ZW4vYXJjaC9h
cm0vY3B1ZXJyYXRhLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysNCj4+Pj4+IDEgZmlsZSBj
aGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspDQo+Pj4+PiANCj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vY3B1ZXJyYXRhLmMgYi94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMNCj4+Pj4+IGlu
ZGV4IDZjMDkwMTc1MTUuLjhmOWFiNmRkZTEgMTAwNjQ0DQo+Pj4+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vY3B1ZXJyYXRhLmMNCj4+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYw0KPj4+
Pj4gQEAgLTI0MCw2ICsyNDAsMjYgQEAgc3RhdGljIGludCBlbmFibGVfaWNfaW52X2hhcmRlbmlu
Zyh2b2lkICpkYXRhKQ0KPj4+Pj4gDQo+Pj4+PiAjZW5kaWYNCj4+Pj4+IA0KPj4+Pj4gKyNpZmRl
ZiBDT05GSUdfQVJNNjRfRVJSQVRVTV84MzIwNzUNCj4+Pj4+ICsNCj4+Pj4+ICtzdGF0aWMgaW50
IHdhcm5fZGV2aWNlX2xvYWRfYWNxdWlyZV9lcnJhdGEodm9pZCAqZGF0YSkNCj4+Pj4+ICt7DQo+
Pj4+PiArICAgIHN0YXRpYyBib29sIHdhcm5lZCA9IGZhbHNlOw0KPj4+Pj4gKw0KPj4+Pj4gKyAg
ICBpZiAoICF3YXJuZWQgKQ0KPj4+Pj4gKyAgICB7DQo+Pj4+PiArICAgICAgICB3YXJuaW5nX2Fk
ZCgiVGhpcyBDUFUgaXMgYWZmZWN0ZWQgYnkgdGhlIGVycmF0YSA4MzIwNzUuXG4iDQo+Pj4+PiAr
ICAgICAgICAgICAgICAgICAgICAiR3Vlc3RzIHdpdGhvdXQgcmVxdWlyZWQgQ1BVIGVycmF0dW0g
d29ya2Fyb3VuZHNcbiINCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICJjYW4gZGVhZGxvY2sg
dGhlIHN5c3RlbSFcbiINCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICJPbmx5IHRydXN0ZWQg
Z3Vlc3RzIHNob3VsZCBiZSB1c2VkIG9uIHRoaXMNCj4+Pj4+IHN5c3RlbS5cbiIpOw0KPj4+Pj4g
KyAgICAgICAgd2FybmVkID0gdHJ1ZTsNCj4+Pj4gDQo+Pj4+IFRoaXMgaXMgYW4gYW50aXBhdHRl
cm4sIHdoaWNoIHByb2JhYmx5IHdhbnRzIGZpeGluZyBlbHNld2hlcmUgYXMgd2VsbC4NCj4+Pj4g
DQo+Pj4+IHdhcm5pbmdfYWRkKCkgaXMgX19pbml0LiAgSXQncyBub3QgbGVnaXRpbWF0ZSB0byBj
YWxsIGZyb20gYSBub24taW5pdA0KPj4+PiBmdW5jdGlvbiwgYW5kIGEgbGVzcyB1c2VsZXNzIGJ1
aWxkIHN5c3RlbSB3b3VsZCBoYXZlIG1vZHBvc3QgdG8gb2JqZWN0Lg0KPj4+PiANCj4+Pj4gVGhl
IEFSTV9TTUNDQ19BUkNIX1dPUktBUk9VTkRfMSBpbnN0YW5jZSBhc3NlcnRzIGJhc2VkIG9uIHN5
c3RlbSBzdGF0ZSwNCj4+Pj4gYnV0IHRoaXMgcHJvdmlkZXMgbm8gc2FmZXR5IGF0IGFsbC4NCj4+
Pj4gDQo+Pj4+IA0KPj4+PiBXaGF0IHdhcm5pbmdfYWRkKCkgYWN0dWFsbHkgZG9lcyBpcyBxdWV1
ZSBtZXNzYWdlcyBmb3Igc29tZSBwb2ludCBuZWFyDQo+Pj4+IHRoZSBlbmQgb2YgYm9vdC4gIEl0
J3Mgbm90IGNsZWFyIHRoYXQgdGhpcyBpcyBldmVuIGEgY2xldmVyIHRoaW5nIHRvIGRvLg0KPj4+
PiANCj4+Pj4gSSdtIHZlcnkgdGVtcHRlZCB0byBzdWdnZXN0IGEgYmxhbmtldCBjaGFuZ2UgdG8g
cHJpbnRrX29uY2UoKS4NCj4+PiANCj4+PiBJZiB0aGlzIGlzIG5lZWRlZCB0aGVuIHRoaXMgY291
bGQgYmUgZG9uZSBpbiBhbiBvdGhlciBzZXJpZSA/DQo+PiANCj4+IFRoZSBjYWxsYmFjayAtPmVu
YWJsZSgpIHdpbGwgYmUgY2FsbGVkIHdoZW4gYSBDUFUgaXMgb25saW5lZC9vZmZsaW5lZC4gU28g
dGhpcw0KPj4gaXMgZ29pbmcgdG8gcmVxdWlyZSBpZiB5b3UgcGxhbiB0byBzdXBwb3J0IENQVSBo
b3RwbHVncyBvciBzdXNwZW5kIHJlc3VtZS4NCj4+IA0KPj4+IFdvdWxkIGJlIGdvb2QgdG8ga2Vl
cCB0aGlzIHBhdGNoIGFzIHB1cmVseSBoYW5kbGluZyB0aGUgZXJyYXRhLg0KPiANCj4gTXkgcHJl
ZmVyZW5jZSB3b3VsZCBiZSB0byBrZWVwIHRoaXMgcGF0Y2ggc21hbGwgd2l0aCBqdXN0IHRoZSBl
cnJhdGEsDQo+IG1heWJlIHVzaW5nIGEgc2ltcGxlIHByaW50a19vbmNlIGFzIEFuZHJldyBhbmQg
SnVsaWVuIGRpc2N1c3NlZC4NCj4gDQo+IFRoZXJlIGlzIGFub3RoZXIgaW5zdGFuY2Ugb2Ygd2Fy
bmluZ19hZGQgcG90ZW50aWFsbHkgYmVpbmcgY2FsbGVkDQo+IG91dHNpZGUgX19pbml0IGluIHhl
bi9hcmNoL2FybS9jcHVlcnJhdGEuYzoNCj4gZW5hYmxlX3NtY2NjX2FyY2hfd29ya2Fyb3VuZF8x
LiBTbyBpZiB5b3UgYXJlIHVwIGZvciBpdCwgaXQgd291bGQgYmUNCj4gZ29vZCB0byBwcm9kdWNl
IGEgcGF0Y2ggdG8gZml4IHRoYXQgdG9vLg0KPiANCj4gDQo+PiBJbiB0aGUgY2FzZSBvZiB0aGlz
IHBhdGNoLCBob3cgYWJvdXQgbW92aW5nIHRoZSB3YXJuaW5nX2FkZCgpIGluDQo+PiBlbmFibGVf
ZXJyYXRhX3dvcmthcm91bmRzKCk/DQo+PiANCj4+IEJ5IHRoZW4gd2Ugc2hvdWxkIG5vdyBhbGwg
dGhlIGVycmF0YSBwcmVzZW50IG9uIHlvdXIgcGxhdGZvcm0uIEFsbCBDUFVzDQo+PiBvbmxpbmVk
IGFmdGVyd2FyZHMgKGkuZS4gcnVudGltZSkgc2hvdWxkIGFsd2F5cyBhYmlkZSB0byB0aGUgc2V0
IGRpc2NvdmVyDQo+PiBkdXJpbmcgYm9vdC4NCj4gDQo+IElmIEkgdW5kZXJzdGFuZCB5b3VyIHN1
Z2dlc3Rpb24gY29ycmVjdGx5LCBpdCB3b3VsZCB3b3JrIGZvcg0KPiB3YXJuX2RldmljZV9sb2Fk
X2FjcXVpcmVfZXJyYXRhLCBiZWNhdXNlIGl0IGlzIGp1c3QgYSB3YXJuaW5nLCBidXQgaXQNCj4g
d291bGQgbm90IHdvcmsgZm9yIGVuYWJsZV9zbWNjY19hcmNoX3dvcmthcm91bmRfMSwgYmVjYXVz
ZSB0aGVyZSBpcw0KPiBhY3R1YWxseSBhIGNhbGwgdG8gYmUgbWFkZSB0aGVyZS4NCj4gDQo+IE1h
eWJlIGl0IHdvdWxkIGJlIHNpbXBsZXIgdG8gdXNlIHByaW50a19vbmNlIGluIGJvdGggY2FzZXM/
IEkgZG9uJ3QgaGF2ZQ0KPiBhIHN0cm9uZyBwcmVmZXJlbmNlIGVpdGhlciB3YXkuDQoNCkkgY291
bGQgZG8gdGhlIGZvbGxvd2luZyAoaW4gYSBzZXJpZSBvZiAyIHBhdGNoZXMpOg0KLSBtb2RpZnkg
ZW5hYmxlX3NtY2NjX2FyY2hfd29ya2Fyb3VuZF8xIHRvIHVzZSBwcmludGtfb25jZSB3aXRoIGEg
DQogIHByZWZpeC9zdWZmaXgg4oCcKioqKuKAnSBvbiBlYWNoIGxpbmUgcHJpbnRlZCAoYW5kIG1h
eWJlIGFkYXB0aW5nIHByaW50IHRvIGZpdCBhIA0KICBsaW5lIGxlbmd0aCBvZiA4MCkNCi0gbW9k
aWZ5IG15IHBhdGNoIHRvIGRvIHRoZSBwcmludCBpbiBlbmFibGVfZXJyYXRhX3dvcmthcm91bmRz
IHVzaW5nIGFsc28NCiAgdGhlIHByZWZpeC9zdWZmaXggYW5kIHByaW50a19vbmNlDQoNClBsZWFz
ZSBjb25maXJtIHRoYXQgdGhpcyBzdHJhdGVneSB3b3VsZCBmaXQgZXZlcnlvbmUuDQoNCkNoZWVy
cw0KQmVydHJhbmQNCg0KDQoNCg==

