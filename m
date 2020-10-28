Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00EF29D0D3
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 16:47:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13720.34465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXnfQ-0007dC-MQ; Wed, 28 Oct 2020 15:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13720.34465; Wed, 28 Oct 2020 15:47:16 +0000
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
	id 1kXnfQ-0007cn-Ip; Wed, 28 Oct 2020 15:47:16 +0000
Received: by outflank-mailman (input) for mailman id 13720;
 Wed, 28 Oct 2020 15:47:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zZT=ED=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kXnfP-0007c2-0j
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:47:15 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.86]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fef1665c-0f4a-4d58-b0e9-e6d5cbf33373;
 Wed, 28 Oct 2020 15:47:12 +0000 (UTC)
Received: from MR2P264CA0102.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::18)
 by PA4PR08MB6125.eurprd08.prod.outlook.com (2603:10a6:102:e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 28 Oct
 2020 15:47:10 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::5c) by MR2P264CA0102.outlook.office365.com
 (2603:10a6:500:33::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 28 Oct 2020 15:47:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 15:47:10 +0000
Received: ("Tessian outbound ba2270a55485:v64");
 Wed, 28 Oct 2020 15:47:10 +0000
Received: from 9f720d99b88f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 35AA86EF-810A-4123-98AD-A8F072817690.1; 
 Wed, 28 Oct 2020 15:47:04 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f720d99b88f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Oct 2020 15:47:04 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM0PR08MB4051.eurprd08.prod.outlook.com (2603:10a6:208:125::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 28 Oct
 2020 15:47:03 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:47:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7zZT=ED=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kXnfP-0007c2-0j
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:47:15 +0000
X-Inumbo-ID: fef1665c-0f4a-4d58-b0e9-e6d5cbf33373
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown [40.107.5.86])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fef1665c-0f4a-4d58-b0e9-e6d5cbf33373;
	Wed, 28 Oct 2020 15:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py2ONcKrlKEu5txZ1tzonQ1wYAZkRDAFdKmbS88XHA8=;
 b=h4h1HU3zOIfeEhvrbvxma/VwSx7T+N11bVQjOyoQD/G04ccNcAdBHTXuqcAFvVSOGUh/9LxnqfIle78/kmKA338ZHa1PkpHEnje7siFAzUqY7PFjy3EQNEnG0UWerU9Lg0Ncqof01CE6hy/+QyEzKo3EZ+Q2iELXNmCV1Yv/Xe4=
Received: from MR2P264CA0102.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::18)
 by PA4PR08MB6125.eurprd08.prod.outlook.com (2603:10a6:102:e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 28 Oct
 2020 15:47:10 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::5c) by MR2P264CA0102.outlook.office365.com
 (2603:10a6:500:33::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 28 Oct 2020 15:47:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 15:47:10 +0000
Received: ("Tessian outbound ba2270a55485:v64"); Wed, 28 Oct 2020 15:47:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 47206cb18c4b53a7
X-CR-MTA-TID: 64aa7808
Received: from 9f720d99b88f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 35AA86EF-810A-4123-98AD-A8F072817690.1;
	Wed, 28 Oct 2020 15:47:04 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f720d99b88f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Oct 2020 15:47:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RY0eEEHRGL3ma0HcjlUy3nDjUnjjnv7sVjgfcOUagKR7P1t5aGCEicQESw2u1dXsOtRYEF1BB/BgfHpsh5JgrfJJcP/kFpH4s3AzemdDAkc5wOQ471TTHL/PcvFuhKCBKuPl92z/K5O8Xt0cPiF6fFLFUtwlogy8oQeyp1FmsJOl0E+YnOWlRl9JJR7X2RrbRuXFo1ygssO62wlnwaBo45InSNWHl+bhSWg6z9ZfI4PXgK6JkFCz4JAqhpj5wPdHTyItz0PmleSVDORV71hfQd2sFSqFzNCKPVkfVN3reBRbW3JBgIXkj/34UD8g8StNtnRMCsNnFuKyYVwAm/8gjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py2ONcKrlKEu5txZ1tzonQ1wYAZkRDAFdKmbS88XHA8=;
 b=RMFAik49+zP6mZqeNSGH7vNH0BZ+rIhzcs/1NkVxlmTAGpDSiQ/vPyo4Isz6yRcyVbXtYEh0dyC4Cg6I5qkI01AxqJt4jp3SibuWUiV65dlmXppR6j3gxA12J/Q6I4UMcTr9FXG2rix1E0QzRqCCCYQP6sMtRdrQRwHm306nDHGaWIgPxZO7LIvYC0GMQCAXy3hiHPfHgaohhxQV4jrrCZMCo3OU3Y1R52vqtgQ48E8ny6EjldkzyhQe6vIVem96QoYXxlY24PvCOHrFhOVOHjUhRz8k1DilDFh1WU5vFJhBaGWSTsSmw4lowV5i0ivfX9hz3ewnCMRonjairx/Tow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py2ONcKrlKEu5txZ1tzonQ1wYAZkRDAFdKmbS88XHA8=;
 b=h4h1HU3zOIfeEhvrbvxma/VwSx7T+N11bVQjOyoQD/G04ccNcAdBHTXuqcAFvVSOGUh/9LxnqfIle78/kmKA338ZHa1PkpHEnje7siFAzUqY7PFjy3EQNEnG0UWerU9Lg0Ncqof01CE6hy/+QyEzKo3EZ+Q2iELXNmCV1Yv/Xe4=
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM0PR08MB4051.eurprd08.prod.outlook.com (2603:10a6:208:125::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 28 Oct
 2020 15:47:03 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:47:03 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v1 1/4] xen/ns16550: solve compilation error on ARM with
 CONFIG_HAS_PCI enabled.
Thread-Topic: [PATCH v1 1/4] xen/ns16550: solve compilation error on ARM with
 CONFIG_HAS_PCI enabled.
Thread-Index: AQHWq7waQtOOhLtUwkWCA6LhLv3lTamsG2AAgACCJwCAADjrgIAADiIAgABHGoA=
Date: Wed, 28 Oct 2020 15:47:03 +0000
Message-ID: <752F9365-EB91-46AC-A2AD-060A630D8404@arm.com>
References: <cover.1603731279.git.rahul.singh@arm.com>
 <d1df24d48508c0c01c0b1130ed22f2b4585d04db.1603731279.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2010271621480.12247@sstabellini-ThinkPad-T480s>
 <95b72e09-246b-dcbe-6254-86b3e25081c6@suse.com>
 <53C69BD9-716C-4ECF-8287-75C435C561CE@arm.com>
 <749813e0-0b04-0ecf-5dc6-96cfe53c786b@xen.org>
In-Reply-To: <749813e0-0b04-0ecf-5dc6-96cfe53c786b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5a8aaacd-c248-423e-8f7e-08d87b58bb86
x-ms-traffictypediagnostic: AM0PR08MB4051:|PA4PR08MB6125:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6125CA0807E32A64F07A075FFC170@PA4PR08MB6125.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 n/zEu25UQOEGX6bc3ltMf8Ia3/sID7MGNmFNQHxJW0HDsD0QcV1fUWfXDoZEEvdE5osQmJR1SoCIOPm87ZcXNdKGRonoCp5NhzHVBq4zqM4Rci2G6azngrKC0E26UgogVxCsKxqsq08Yzih8mgJWUBXe/rNqI2wQfK4j85+xqwBD+Mhw4oJrzubSzWZfL6povjPsLN8TcGi2s3w3VsuGs5jkQpESm3TjkWlAk7dQ70RYQOCPeoaYQivYinWXvY+uLMEDebQoeX4STP7blCtukokBUCUb6ppGv/wtUFmdvTqcji3801q+zlkpSEM0TdCYEhSq1+hMtfAZrbVwLgXPeA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3490.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(53546011)(6506007)(8676002)(8936002)(4326008)(54906003)(55236004)(71200400001)(33656002)(66946007)(66556008)(2616005)(66476007)(66446008)(76116006)(64756008)(91956017)(2906002)(478600001)(5660300002)(186003)(316002)(86362001)(26005)(6512007)(6486002)(6916009)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 B+i0iLeBk3vGVLztjDe9XDhYm9gCKsZXshoSmtgwWFv2tG0aozgE+OIFFuW65uAsp76M6StTrZS3shLyWt8RzZMe4E/aINTXuh8Nz+zhYcwcJgfsyGzMdbHpjWpT/Hy2cjnyN/LhUVzK3JyUqIiqFPdmYmtvjC32YYyy4te7dyAZIpJsmcP+PhkT4yCtxOPLo7JrtIbWrJhDrECjE4ykpd1KjUPjuR59SIBMmjB++1nuv5b7jF1YLjiovs9GzvN3PtTg0qHdC2JclV+yPmwXHDaKHKQpJehh6AFzp2G16nUbtgO3fbgs58DTY2jpI1Ls4+31L8vdjbqp/tVM2qECkL8KblGzIhmGiDy7VBWdYedtKQZPRyxlDwfTA3JIFlP5WLXql4kpMT3obrAF/KUktira5IKueeM0MwkXY7gdWgRxdwr6Vp/ud5kigYXaz3s83Eb2WGkZr1Ugimly2f913dysyD1TqedZOswoFSQ0B4rIi4ColfOrH3TaWBZbyBT0oVy2A/dwjhh3/VyURRpHtmc0m7T5cWVG2rUcMgERqvJLH7TX5i9wayDhPb0PWkYTt42KYJWKDVRpHaeEFrJMjRPcf+rjznYdhVlzV7LP24u1DarpqLYXvIbKJGrZ6Y5NrY7X43gWtr7fmPg/ZYDJdQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CB8D54BC02FB6246B7FC2902FDE70BCE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4051
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e3eaa156-4ac3-4cbc-d3e6-08d87b58b77a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WF2czqo0UZUvAZ7zm29Pgqvv8SJnoU3Ls7jhNibLMhsoo8KrN0y3AVW8FoB4aM/29Fzd+9hSljZR6Pfyst1jOK/oiC8C//QEaOor98ZqsX5TGZT3Tsd0VegnrliOIc0MqYxs3/HbbOzZ+XjH2hxuthXrYi/RTNOACqSl6PRwjr69C5AfcW9C9ufHMrEHpg5DwTiir314fiUh8NMXKE9gvt8GWfLoI/QIq/tPueMagKgiDSrcmXm5C3i1kqHzvCA7bTIRioAeWqJJY23bLiFz/UqxWAtiO8075KAmxPKuOncZgQ8YplTXqIKQTnyfE9u78anjPdVUUyuP0A5NCPwOHL2LmmAFYvCcf2t8Jfkea1H28khiE/tlnfAgiUasuhvJla/YIsjl6oc+pK6kqmXELA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(136003)(46966005)(86362001)(4326008)(6862004)(8936002)(478600001)(2906002)(5660300002)(33656002)(356005)(8676002)(82310400003)(47076004)(54906003)(81166007)(36906005)(316002)(6486002)(6512007)(82740400003)(70206006)(26005)(186003)(6506007)(336012)(55236004)(2616005)(36756003)(53546011)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:47:10.5002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8aaacd-c248-423e-8f7e-08d87b58bb86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6125

Hello Julen,

> On 28 Oct 2020, at 11:32 am, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 28/10/2020 10:41, Rahul Singh wrote:
>>> On 28 Oct 2020, at 7:18 am, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 28.10.2020 00:32, Stefano Stabellini wrote:
>>>> On Mon, 26 Oct 2020, Rahul Singh wrote:
>>>>> --- a/xen/drivers/char/Kconfig
>>>>> +++ b/xen/drivers/char/Kconfig
>>>>> @@ -4,6 +4,13 @@ config HAS_NS16550
>>>>> 	help
>>>>> 	  This selects the 16550-series UART support. For most systems, say =
Y.
>>>>>=20
>>>>> +config HAS_NS16550_PCI
>>>>> +	bool "NS16550 UART PCI support" if X86
>>>>> +	default y
>>>>> +	depends on X86 && HAS_NS16550 && HAS_PCI
>>>>> +	help
>>>>> +	  This selects the 16550-series UART PCI support. For most systems,=
 say Y.
>>>>=20
>>>> I think that this should be a silent option:
>>>> if HAS_NS16550 && HAS_PCI && X86 -> automatically enable
>>>> otherwise -> automatically disable
>>>>=20
>>>> No need to show it to the user.
>>>=20
>>> I agree in principle, but I don't see why an X86 dependency gets
>>> added here. HAS_PCI really should be all that's needed.
>>>=20
>> Yes you are right . I will remove the X86 and make HAS_NS16550_PCI depen=
d on "HAS_NS16550 && HAS_PCI"
>=20
> There are quite a bit of work to make the PCI part of the implementation =
build on Arm because the code refer to x86 functions.
>=20
> While in theory, an NS16550 PCI card could be used on Arm, there is only =
a slim chance for an actual users. So I am not convinced the effort is wort=
h it here.
>=20
> Cheers,

Ok. I will enable by default HAS_NS16550_PCI on X86 only. Once we have prop=
er support for NS16550 PCI on ARM we can enable it at that time.
I will modify as follows:

config HAS_NS16550_PCI                                                     =
    =20
    bool                                                                   =
    =20
    default y                                                              =
    =20
    depends on X86 && HAS_NS16550 && HAS_PCI                               =
    =20
    help                                                                   =
    =20
      This selects the 16550-series UART PCI support. For most systems, say=
 Y.


>=20
> --=20
> Julien Grall

Thanks,
Rahul


