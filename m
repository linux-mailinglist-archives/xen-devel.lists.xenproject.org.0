Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F65218836
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 14:57:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jt9c6-0004lw-2A; Wed, 08 Jul 2020 12:55:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfZR=AT=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jt9c4-0004lr-7x
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 12:55:48 +0000
X-Inumbo-ID: 57269b88-c11a-11ea-8e35-12813bfff9fa
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.57]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57269b88-c11a-11ea-8e35-12813bfff9fa;
 Wed, 08 Jul 2020 12:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7O0pWyJHPvi8nQWXoAC5491PgIgYx6Koi38WUGnJONA=;
 b=PY/NIA7P+mGZ/MYsbtHOS0FwgVsWjCxdSRYpEZ64oGQzufRH5Kmks37X3hH0yDx9RXELDx1DZNOr5gcEbdh6lOzyVeUrIJ50kidc8kEuXdmbK5WGcoTx10szKDyKxw4SGWkk6PnCpnqmDTwB5N7a7oDQkmsCKG9VjlY3/a1JgwE=
Received: from AM5PR0201CA0024.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::34) by AM5PR0801MB2017.eurprd08.prod.outlook.com
 (2603:10a6:203:42::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Wed, 8 Jul
 2020 12:55:45 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::47) by AM5PR0201CA0024.outlook.office365.com
 (2603:10a6:203:3d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Wed, 8 Jul 2020 12:55:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 12:55:44 +0000
Received: ("Tessian outbound f7489b7e84a7:v62");
 Wed, 08 Jul 2020 12:55:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a6a04dc7f605275
X-CR-MTA-TID: 64aa7808
Received: from 9283b3c3f04b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0FD76029-7820-4A82-9E8B-6428A928BDE8.1; 
 Wed, 08 Jul 2020 12:55:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9283b3c3f04b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Jul 2020 12:55:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpNeAywT9SXiqyv8+hUA+CUOPetR+aF8BY6FJ7yca8nu5c0JLoXMZ/zaiKiChjbMUxFW+Vvt+jqrWgXAcDGhCLGdPaUFeJdiSmXW+wJD1C5C+LNv62VoLUGsvZObUlHpMOCm4ppGOvFgm6XeipghISOtpUhpXNkY/tLG3wfJtHW9am3uHAYO0DZK3LTitYEr+Bo0IG9IBWsMYlIpbQPTLYwHSeDYEk+JBUCrPtlCJy0sWMaP8R1U3sj5iiM8x0hG+yVz8UPdYo+5muYrinzW3G81l2nip53x5Wz5iNsjMmHH2l/suMPMKBkV9ZwLiuRRuZVpuxbYB55BMR/CYSbfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7O0pWyJHPvi8nQWXoAC5491PgIgYx6Koi38WUGnJONA=;
 b=eHQD7tbX6ONuBkzDVGblzBi6c1xKKRZXLO6iQ4qUw99Qw2XMl3UnSFnnhSHrVr0+YOb2hdt6whfyW3UTSIKOmbC2EAyVxWHyup+ugrY2TuPWHh4d82BD/3JpHp4P7qlbk2VQ9WhT+1tOcZA574CwQtgqACjEZABdnPm8A6cjhGT+vgxLJxMVkX8SLBoy9FRaMkQq7rl0x++SuMn5PjM8iAuXZnJqs8TF71CtdcV7DHjU7lnXQuMsejX9C/KMrNKANhhAv4SgWjYrL2LdcRYMQseJB2vMrQzUB6RHFAnyK9hPBj3OZ5YPQN6rzqVEA7QA7gW3CJLBuqLimYT/SgkKyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7O0pWyJHPvi8nQWXoAC5491PgIgYx6Koi38WUGnJONA=;
 b=PY/NIA7P+mGZ/MYsbtHOS0FwgVsWjCxdSRYpEZ64oGQzufRH5Kmks37X3hH0yDx9RXELDx1DZNOr5gcEbdh6lOzyVeUrIJ50kidc8kEuXdmbK5WGcoTx10szKDyKxw4SGWkk6PnCpnqmDTwB5N7a7oDQkmsCKG9VjlY3/a1JgwE=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5370.eurprd08.prod.outlook.com (2603:10a6:10:112::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Wed, 8 Jul
 2020 12:55:36 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 12:55:36 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: PCI passthrough on arm Design Session MoM
Thread-Topic: PCI passthrough on arm Design Session MoM
Thread-Index: AQHWVScSyjWrTj065kev9PFLOqlwvQ==
Date: Wed, 8 Jul 2020 12:55:36 +0000
Message-ID: <4E0A40D3-2979-4A91-9376-C2B19B9F582E@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1f7caf64-a57a-483a-8cd9-08d8233e3a5b
x-ms-traffictypediagnostic: DB8PR08MB5370:|AM5PR0801MB2017:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2017AF39344CBDEC061F77AB9D670@AM5PR0801MB2017.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04583CED1A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ODSgBwEy0l3nzBWqW/PoizaqQ0RO9Pvzei2iLsvz9Mbd1o9DPT4sb/iQCRQCkqK3/9lta0spmBXrMrKYIdgD5bW/ZTcp6G4Q1YxDt1dqH0bWJTaTa4dS0FFzmxXClzIr/XwuLS2c2xUJIAZLnJ45X3HaZlJ2/gVuRdnixHCfI/5eJlv+uAILKO6ZfIxae/Zp16zg33BQ0SNu3gVw5c90PHvqdByKprN6fo0lW9sMDWkcCJwUaEYWSvb7fC0Pvw8Qal5hSOZAHFGgh56RQ55CBwLhOG40O2nw51RSxYb/UpDlYE1CG/n7Rd8KCYLyvew0knpFyuOmUAh3mIWSORbcug==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(8936002)(4326008)(54906003)(186003)(66476007)(66556008)(64756008)(66446008)(66946007)(6916009)(2906002)(83380400001)(6512007)(33656002)(36756003)(8676002)(71200400001)(76116006)(91956017)(5660300002)(6486002)(478600001)(86362001)(6506007)(316002)(26005)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: IX59vcc3iPOtqpalKUwXUO+DwRZ/YyZf9PRTPRNioNPzc04/lZXCn6JyUPHycQSKbtRottCWvFCrC2kGM9IAvCHWEV7gqbcsPwziO2UU/b5GR9qPRdsjDm2N56TUbznrlG9kvo+C6sDWk+GWvm/uTi5uVbSV/5dscwEI8IQ5e3wV02QiRqmc0r4LGIW+5kLh9gQ51LoIPPGx+P1gmWzxino5L/N8mMsichkAy0ozZup/N7oEd3SWEdnmIfEGEnBVlpIrGqKxJMQSppyZfHKKgXE78L7TmcFpc7ttN0dd4uihI89GMQPODrlw7jdsubqJU/M1whE37/RqH8YVb3WdwScyZAhr1OBqh54LkMlXw77QjsJhsEGRbRQIMonBFp5WwB0mc7fEYX4waKj+FtwZAw34zehAC6gbbuApAPA7PW1xbhdKRfWGW6hueHtmJ+eY2J//fKqXWg6Y5O0maq6NChT7JcAJiEVyvCQz1kjvAoG2nN+F/CoPeQa7Bl8wlSyN
Content-Type: text/plain; charset="us-ascii"
Content-ID: <950234224D229F41A0B42F0ACBF90DE4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5370
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(47076004)(2616005)(86362001)(33656002)(36906005)(336012)(316002)(6512007)(54906003)(6916009)(81166007)(6486002)(5660300002)(36756003)(82310400002)(83380400001)(356005)(82740400003)(8936002)(186003)(2906002)(478600001)(70586007)(8676002)(6506007)(70206006)(4326008)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 48ddfc76-7c25-4d88-6524-08d8233e354d
X-Forefront-PRVS: 04583CED1A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZnhuUCrcf3z5RnJprp6y4ZsMXmaIVehadzUf6CoTVaAMYkSQMHPY5iwnuXZhf/wupPBNlaEXXBlH2v+8+9uycZwXpby7qElK63Ukbf3LERkhSgr0Ww4r/xYfdN0mK6WfOIXWfqr35io1vl4aA4Kh2/9bntaasbLiK2Om3Q7NRJfOu6s6Y4/947/LUypompAw2pw2UXcfGFtNpigVxwtUOOjHTtpsFM9u7tYbMQCVWT8SQbGSHagV37/ZPhKtGwaAbEdkzyMMHv1tNgYGfz5LuQSTJ9Dtpdw18EK08B8L+WT/clcBmFpnMkiabGmrAH4Llc+v+5Hgl0oHVNpue6V+qUpbtfatflh1quISoSy3rZRm31DjVnmJ1Z5f7XDWFGPBbi7/w2ZCJRIUUdd8tppAqw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 12:55:44.6358 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7caf64-a57a-483a-8cd9-08d8233e3a5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2017
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
Cc: nd <nd@arm.com>, Rahul Singh <Rahul.Singh@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

Here are the notes we took during the design session around PCI devices pas=
sthrough on Arm.
Feel free to comment or add anything :-)

Bertrand

PCI devices passthrough on Arm Design Session
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Date: 7/7/2020

- X86 VPCI support  is for the PVH guest .
- X86 PCI devices discovery code should be checked and maybe used on Arm as=
 it is not very complex
	- Remark from Julien: This might not work in number of cases
- Sanitation of each the PCI access for each guest in XEN is required
- MSI trap is not required for gicv3 but it required for gicv2m
	- We do not plan to support non ITS GIC
- Check possibility to add some specifications in EBBR for PCI enumeration =
(address assignment part)
- PCI enumeration support should not depend on DOM0 for safety reasons
- PCI enumeration could be done in several places
	- DTB, with some entries giving values to be applied by Xen
	- In XEN (complex, not wanted out of devices discovery)
	- In Firmware and then xen device discovery
- As per Julien it is difficult to tell the XEN on which segment PCI device=
 is present
	- Current test implementation is done on Juno where there is only one segm=
ent
	- This should be investigated with an other hardware in the next months
- Julien mentioned that clocks issues will be complex to solve and most har=
dware are not following the ECAM standard
- Julien mentioned that Linux and Xen could do the enumeration in a differe=
nt way, making it complex to have linux doing an enumeration after Xen
- We should push the code we have ASAP on the mailing list for a review and=
 discussion on the design
	- Arm will try to do that before end of July
- It would be good to push some PCI support in Xen even though it would not=
 be compatible with all hardware



