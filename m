Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B98C2A6633
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 15:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19196.44434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaJad-0002t3-D0; Wed, 04 Nov 2020 14:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19196.44434; Wed, 04 Nov 2020 14:16:43 +0000
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
	id 1kaJad-0002sX-8n; Wed, 04 Nov 2020 14:16:43 +0000
Received: by outflank-mailman (input) for mailman id 19196;
 Wed, 04 Nov 2020 14:16:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osUd=EK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kaJac-0002s9-5l
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 14:16:42 +0000
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (unknown
 [40.107.9.42]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34733ece-f0bd-43fc-8926-f30151d0c5a7;
 Wed, 04 Nov 2020 14:16:41 +0000 (UTC)
Received: from AM5PR1001CA0054.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::31) by PR2PR08MB4794.eurprd08.prod.outlook.com
 (2603:10a6:101:24::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Wed, 4 Nov
 2020 14:16:38 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::30) by AM5PR1001CA0054.outlook.office365.com
 (2603:10a6:206:15::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27 via Frontend
 Transport; Wed, 4 Nov 2020 14:16:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 14:16:38 +0000
Received: ("Tessian outbound c579d876a324:v64");
 Wed, 04 Nov 2020 14:16:37 +0000
Received: from 739ac3104fd4.4
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BE82C032-2769-4D5A-9ECC-23EE2B0B8D13.1; 
 Wed, 04 Nov 2020 14:16:14 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 739ac3104fd4.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Nov 2020 14:16:14 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB2963.eurprd08.prod.outlook.com (2603:10a6:208:56::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:16:10 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:16:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=osUd=EK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kaJac-0002s9-5l
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 14:16:42 +0000
X-Inumbo-ID: 34733ece-f0bd-43fc-8926-f30151d0c5a7
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (unknown [40.107.9.42])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 34733ece-f0bd-43fc-8926-f30151d0c5a7;
	Wed, 04 Nov 2020 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdZV61D42+JzDO6v5TD8Ky4gogrHQlvrlqdfGNG1gxU=;
 b=acjpS2y3Fkui9c5dZpHLsTDHOr+/QVCzYY0oSOnBDXomffMEWi/QrSsBdph+BE7nIuC0olWJTqWX3NGCVrlQvLVW8hOe/myzEXRqECmAWfjRsp/IHXmdUKUTY98JBgY76BKdyXjEUTgshmum4R89RTkHa9zuIMdXq2GyUYEdw3o=
Received: from AM5PR1001CA0054.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::31) by PR2PR08MB4794.eurprd08.prod.outlook.com
 (2603:10a6:101:24::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Wed, 4 Nov
 2020 14:16:38 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::30) by AM5PR1001CA0054.outlook.office365.com
 (2603:10a6:206:15::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27 via Frontend
 Transport; Wed, 4 Nov 2020 14:16:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 14:16:38 +0000
Received: ("Tessian outbound c579d876a324:v64"); Wed, 04 Nov 2020 14:16:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 192d4b6739c3a187
X-CR-MTA-TID: 64aa7808
Received: from 739ac3104fd4.4
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BE82C032-2769-4D5A-9ECC-23EE2B0B8D13.1;
	Wed, 04 Nov 2020 14:16:14 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 739ac3104fd4.4
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 04 Nov 2020 14:16:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGfDi2kS/85oXy7IUIGwy98d3aHlaSXapth/4e9PAGB4TZG/VKbxTt7Qz5n4HpMdaK5IFCCTCsXHcovIWtXdIbtkJKymcXmp3ZVv5yabJKqYCj7VepabFsmAtx0sAQkBzG11GSJi780ADJ8TPNLOrciULWL159v3biP7swi+8d0FvI36Wjx9CPSTYvZsoVqq0BKEiLcGHTCkEeGySwAbGOXbW1t2uQ02UfqYi7Q4aWCbrR20K/A0geZTP4l5WbShrvZ2YCJg40jhJrwCKDwdtPBmxVT2ktIHLjEzjokhV97iZK7DfVuzTFzW3fnoTnvpVaRIVihm5Y9Oqfxl2kFzeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdZV61D42+JzDO6v5TD8Ky4gogrHQlvrlqdfGNG1gxU=;
 b=k63VxCrZslhrZOo3Dzea+lFcLr1CjwaBxi6ikkON5VaAlOy0dyPKvn5beHyIh0ytL9+4cOhkHgv/e6mr1+FKo3mRbf4XqZYerSe753TRJYAH6GY0bfNCTP3MB6F3CYvFudRteGxVz5OB1/5r+mj7mjDInXX67pZsOPON9ry7iTzmiDDvz92lFjPqhcnTClhdBXUSj5gvUIcG9fo8L+ZsXRoAJbB21Yjj3SASnAibjDZvy8I1crKhhsmi1kpHnnnG9NdFJUGcLvFgueusNzkdognviOBhCisKUS3y6ssciZjSKc7F9fNOdnM0XILEgPh2oxEz7RTm6PoJpbuoiSUV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdZV61D42+JzDO6v5TD8Ky4gogrHQlvrlqdfGNG1gxU=;
 b=acjpS2y3Fkui9c5dZpHLsTDHOr+/QVCzYY0oSOnBDXomffMEWi/QrSsBdph+BE7nIuC0olWJTqWX3NGCVrlQvLVW8hOe/myzEXRqECmAWfjRsp/IHXmdUKUTY98JBgY76BKdyXjEUTgshmum4R89RTkHa9zuIMdXq2GyUYEdw3o=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB2963.eurprd08.prod.outlook.com (2603:10a6:208:56::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:16:10 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:16:10 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/4] xen/pci: Introduce new CONFIG_PCI_ATS flag for PCI
 ATS functionality.
Thread-Topic: [PATCH v2 2/4] xen/pci: Introduce new CONFIG_PCI_ATS flag for
 PCI ATS functionality.
Thread-Index: AQHWsfp0TD99XuDgWkm6r9S7pNFSjKm4BiEA
Date: Wed, 4 Nov 2020 14:16:10 +0000
Message-ID: <2A5F6B03-4408-4D1A-BBE7-1A72C0EEECC4@arm.com>
References: <cover.1604417224.git.rahul.singh@arm.com>
 <27814e614618c413ac61a9f7a48d795c557bfe5c.1604417224.git.rahul.singh@arm.com>
In-Reply-To:
 <27814e614618c413ac61a9f7a48d795c557bfe5c.1604417224.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2d34b534-81b4-44a3-0c35-08d880cc3ebf
x-ms-traffictypediagnostic: AM0PR08MB2963:|PR2PR08MB4794:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB4794C0C664805D9974DC24569DEF0@PR2PR08MB4794.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OxSKjvV55d0ALzPqVakVvNBOdf4mj/yCTrTwhsAp9kd+W0fqRKzCqWLJKJ+gT0A84gA5VnP6rfH7wfL7iG6t4xLN+JjTM3VyyesXnwZTE4ajh8LIf8ZjYo/OQbr5IZHQYHSWdundinntiDki28jp0Fi1gcpy70qMPFGwro5+bKeOZFTs+UvuNlFnPAt1PycYf1fQ7tYww8j1FgyfSnBYS+EKFc4owrEo7t8EJh9ap2xoSYqyyhSRE9W7G3wjIFnpHvk/wdahBBxEyrgsjZkuYgRw66jRqnxo+t0Mha7StrIxEf3Rfb3CzmQJdOr8A50fRlRGig6qRfkAJ+Y24WDG4g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3682.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(4326008)(36756003)(76116006)(66476007)(66556008)(26005)(2906002)(66946007)(6862004)(83380400001)(71200400001)(66446008)(91956017)(64756008)(5660300002)(6486002)(33656002)(86362001)(53546011)(186003)(6636002)(37006003)(6506007)(8676002)(54906003)(6512007)(2616005)(478600001)(316002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 bFkmHiKTyE9izybp9voFjWVZIufX0Oze8XkGmv8hP8+tVlgAONEMwVwKcI4AiPhe+74ykWToYT9jhdtBCD1MhB7Nnkqu3S4R5bl2N9ckndb4kklF2BcDPyPmkwFmj8PaTXUVbc9FvsuwNXQn2dUZM6ZrOKRpWPg9wTHOVhmmESo5PEbJZ2l746ThIXOowBpOYTqivA1sW4h+PnVej+NR09xDonjKpCnhTZLcnriZnsP4eSJ772tQUJYg4UOazzqQn7dKBOuaOtt5JuBfAMtEETqYkb437fFHgha9OFl1QEZOFQTiPXZolxkuVHXsJJVgGYcgAb9758JqNyXpuJzUgCeyd8e38QH6b8V1Wh0yku4Ldxs7l+QHTBxulXCkzoFzCEcHH7ICtnPNTgvq6JKxEAJxOmV7cX7TmoyC/+kJwLZrrGyTujUraPM3YjNbxpbDqWjxhvOP02brQyCm5OgAT1Fb3kwfAA7wpppa4ZT3LJHXap2AtwBkozdUDEnFSBXJDLaqEnnsLkKjZQuz1UJwg+/pnsYQ8OwVK9oCTUVYlI67mk02l7vNuPsB9QW6ehXyh/zewJSr55cqU3RIAWeZnKNFyUOhDfuGSf9OhQXnVEOO3pws9VAnrZluWx6fr0BZbZ57rtyuszYJV+B3/UPTTQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C9F3106C0E5BB74886373EF93ADF0C36@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2963
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	929c9537-011d-4b95-5653-08d880cc2dfa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RTwhkoL6TZ81MUjINLkMakR7prRAOERWq82HjY6DC6uotP6U7UW/8cRlG45bNiF7wr19cl1F1qHSTJoFEJDemecTntEeObnQIYGWk5qwGUlphlY5IGhy6PPxfEXLyu+/EW4mgzvnlKbo7NI3WgjUpguSXhQsurKCB0m3zT3OkX3bPlH4nADFUQqX/sSj6wdozFfoVu86sUBE/8JFHQTVz47AmRY4Uel+SWI/dYSFQa3rW5KBizXysqUXQzeiP87BgCxNdDOa8NzrnuV+O4yWcJIVoayu2jMcc9vCJ3llbuiDEt6SVcg42bnagtox8E82ms8V0gI8FIVshmbb8M+uBsM0OW3q8WIhjYObJrY7h1E/mOkO3zAEbCS3b8cB+OdHiPfZ/oaHJorymv4alO4RaQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(46966005)(82740400003)(316002)(36906005)(83380400001)(33656002)(6862004)(4326008)(478600001)(54906003)(37006003)(6512007)(70586007)(70206006)(47076004)(6486002)(5660300002)(26005)(36756003)(82310400003)(186003)(6636002)(81166007)(8676002)(356005)(2616005)(336012)(8936002)(86362001)(2906002)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:16:38.6737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d34b534-81b4-44a3-0c35-08d880cc3ebf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4794



> On 3 Nov 2020, at 15:59, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> PCI ATS functionality is not enabled and tested for ARM architecture
> but it is enabled for x86 and referenced in common passthrough/pci.c
> code.
>=20
> Therefore introducing the new flag to enable the ATS functionality for
> x86 only to avoid issues for ARM architecture.
>=20
> No functional change.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
>=20
> Changes in v2:
> - Fixed return value of PCI ATS related functions when PCI_ATS is not ena=
bled.
> - Make PCI_ATS user selectable kconfig option.
>=20
> ---
> xen/drivers/passthrough/ats.h        | 26 ++++++++++++++++++++++++++
> xen/drivers/passthrough/x86/Makefile |  2 +-
> xen/drivers/pci/Kconfig              |  9 +++++++++
> 3 files changed, 36 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/drivers/passthrough/ats.h b/xen/drivers/passthrough/ats.=
h
> index 22ae209b37..3a71fedcb4 100644
> --- a/xen/drivers/passthrough/ats.h
> +++ b/xen/drivers/passthrough/ats.h
> @@ -17,6 +17,8 @@
>=20
> #include <xen/pci_regs.h>
>=20
> +#ifdef CONFIG_PCI_ATS
> +
> #define ATS_REG_CAP    4
> #define ATS_REG_CTL    6
> #define ATS_QUEUE_DEPTH_MASK     0x1f
> @@ -48,5 +50,29 @@ static inline int pci_ats_device(int seg, int bus, int=
 devfn)
>     return pci_find_ext_capability(seg, bus, devfn, PCI_EXT_CAP_ID_ATS);
> }
>=20
> +#else
> +
> +#define ats_enabled (false)
> +
> +static inline int enable_ats_device(struct pci_dev *pdev,
> +                                    struct list_head *ats_list)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline void disable_ats_device(struct pci_dev *pdev) { }
> +
> +static inline int pci_ats_enabled(int seg, int bus, int devfn)
> +{
> +    return 0;
> +}
> +
> +static inline int pci_ats_device(int seg, int bus, int devfn)
> +{
> +    return 0;
> +}
> +
> +#endif /* CONFIG_PCI_ATS */
> +
> #endif /* _ATS_H_ */
>=20
> diff --git a/xen/drivers/passthrough/x86/Makefile b/xen/drivers/passthrou=
gh/x86/Makefile
> index a70cf9460d..aa515c680d 100644
> --- a/xen/drivers/passthrough/x86/Makefile
> +++ b/xen/drivers/passthrough/x86/Makefile
> @@ -1,2 +1,2 @@
> -obj-y +=3D ats.o
> +obj-$(CONFIG_PCI_ATS) +=3D ats.o
> obj-y +=3D iommu.o
> diff --git a/xen/drivers/pci/Kconfig b/xen/drivers/pci/Kconfig
> index 7da03fa13b..3cb79ea954 100644
> --- a/xen/drivers/pci/Kconfig
> +++ b/xen/drivers/pci/Kconfig
> @@ -1,3 +1,12 @@
>=20
> config HAS_PCI
> 	bool
> +
> +config PCI_ATS
> +	bool "PCI ATS support"
> +	default y
> +	depends on X86 && HAS_PCI
> +	---help---
> +	 Enable PCI Address Translation Services.
> +
> +	 If unsure, say Y.
> --=20
> 2.17.1
>=20


