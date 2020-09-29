Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E59127C483
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 13:14:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.56.193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDaC-0008NC-GM; Tue, 29 Sep 2020 11:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56.193; Tue, 29 Sep 2020 11:14:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDaC-0008Mm-CI; Tue, 29 Sep 2020 11:14:08 +0000
Received: by outflank-mailman (input) for mailman id 56;
 Tue, 29 Sep 2020 11:14:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQRb=DG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kNDaA-0008Mg-T0
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:14:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.83]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f94868be-c518-4833-98be-54a4c2cd3d7c;
 Tue, 29 Sep 2020 11:14:05 +0000 (UTC)
Received: from AM5PR0201CA0011.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::21) by DB7PR08MB3833.eurprd08.prod.outlook.com
 (2603:10a6:10:79::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Tue, 29 Sep
 2020 11:14:02 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::a3) by AM5PR0201CA0011.outlook.office365.com
 (2603:10a6:203:3d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Tue, 29 Sep 2020 11:14:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Tue, 29 Sep 2020 11:14:02 +0000
Received: ("Tessian outbound a0bffebca527:v64");
 Tue, 29 Sep 2020 11:14:02 +0000
Received: from 90ca9c3eef6f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FE7E19AE-6823-4E00-AF98-A67B191C0470.1; 
 Tue, 29 Sep 2020 11:13:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 90ca9c3eef6f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 29 Sep 2020 11:13:57 +0000
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com (2603:10a6:10:1a3::14)
 by DB7PR08MB3434.eurprd08.prod.outlook.com (2603:10a6:10:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.26; Tue, 29 Sep
 2020 11:13:54 +0000
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac]) by DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac%4]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 11:13:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MQRb=DG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kNDaA-0008Mg-T0
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:14:06 +0000
X-Inumbo-ID: f94868be-c518-4833-98be-54a4c2cd3d7c
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [40.107.7.83])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f94868be-c518-4833-98be-54a4c2cd3d7c;
	Tue, 29 Sep 2020 11:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KY64bThEoQ45wXpxRhVEap8LYQRwMReVDmAlFxeimoc=;
 b=r4lXL2iOJhjLIqR9xriUsy0TzcNL9RK0C4Gq+mByZZEjYCJIQZf04D4v1fsuCmWLuHJ3pXSdBPo7Bfa1AfAtbJWdlfOf2NIYC1M1j/qpr8+cFA6bmXCjLL2IMdlMG3kIAl1qy+yl9ddXHcCVqiC79l86P6HOQWRfDEvGskFeukQ=
Received: from AM5PR0201CA0011.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::21) by DB7PR08MB3833.eurprd08.prod.outlook.com
 (2603:10a6:10:79::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Tue, 29 Sep
 2020 11:14:02 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::a3) by AM5PR0201CA0011.outlook.office365.com
 (2603:10a6:203:3d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Tue, 29 Sep 2020 11:14:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Tue, 29 Sep 2020 11:14:02 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Tue, 29 Sep 2020 11:14:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8b6a227dc2e3f481
X-CR-MTA-TID: 64aa7808
Received: from 90ca9c3eef6f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FE7E19AE-6823-4E00-AF98-A67B191C0470.1;
	Tue, 29 Sep 2020 11:13:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 90ca9c3eef6f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 29 Sep 2020 11:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDNyAH8nsJUz/IqhdUJOJ19QzLOy2PSre6BouB5AqywnEgTByhMNjb4P/Z4khqNTeGqegZrfeWGhdnz2el3YBudDDPclvUV1mmpGyrqJPvVhvncglBOEg9TGQGJnD7dPA0CNbEUHLHaD2QX2OxM60Rutv0pH/HVs4hKnUBhnzhrV+RYDxDttwIaTjDi4YqIhzrl6nwZcs+PDzBiNfsW62urmYPUmaQrgE19XsWFCMZR8S5uGSOhyazru6n7odafa15nGL1fHYdjpHaFs5e/IIXAjwcbG/px3xX8xaAM1fijDhRsMfKgFmsLIWl9fzvgKTNQ3knEDHeth7Zp3+IJOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KY64bThEoQ45wXpxRhVEap8LYQRwMReVDmAlFxeimoc=;
 b=dBBrLyxITIpSikGj7kl49ona0rKluRq9y2jfttRwicLS2FvTeGdIaYFfj1y+7IVmc7SXgtTVm5nnAyWRfg7TYOLzgOTLIt5bJhvZjNqsX7MyVNvBN9hvJ762BWwj+5NtaRXAqc/QXC7cKQriI9hW4seK5WnjBH7c3LJvu2fSbols/Ay7PZwhto8FEesgYNzkLIjZixAOH8Wn8c5A/2GnUyev2yOTJF2gI1niUttEYpMIQb15KEsg7osUSczu7epQHqetj7O16hOwGURuoJIthCu1UURAHehVZ+UJ4BpX3gSQNz1TrfgBFKyw3fNu87B9NPd3XSSHA8/+ZYbNr6GrcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KY64bThEoQ45wXpxRhVEap8LYQRwMReVDmAlFxeimoc=;
 b=r4lXL2iOJhjLIqR9xriUsy0TzcNL9RK0C4Gq+mByZZEjYCJIQZf04D4v1fsuCmWLuHJ3pXSdBPo7Bfa1AfAtbJWdlfOf2NIYC1M1j/qpr8+cFA6bmXCjLL2IMdlMG3kIAl1qy+yl9ddXHcCVqiC79l86P6HOQWRfDEvGskFeukQ=
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com (2603:10a6:10:1a3::14)
 by DB7PR08MB3434.eurprd08.prod.outlook.com (2603:10a6:10:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.26; Tue, 29 Sep
 2020 11:13:54 +0000
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac]) by DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac%4]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 11:13:54 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"masami.hiramatsu@linaro.org" <masami.hiramatsu@linaro.org>,
	"ehem+xen@m5p.com" <ehem+xen@m5p.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH 2/4] xen/arm: acpi: The fixmap area should always be
 cleared during failure/unmap
Thread-Topic: [PATCH 2/4] xen/arm: acpi: The fixmap area should always be
 cleared during failure/unmap
Thread-Index: AQHWlEfKCl2/BWPbZ0mt0x0/DJ/LAql/equA
Date: Tue, 29 Sep 2020 11:13:54 +0000
Message-ID: <8605B284-1BD7-41C3-8232-E8453A4F0A57@arm.com>
References: <20200926205542.9261-1-julien@xen.org>
 <20200926205542.9261-3-julien@xen.org>
In-Reply-To: <20200926205542.9261-3-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 06ff5059-cb4a-4197-0d05-08d86468c591
x-ms-traffictypediagnostic: DB7PR08MB3434:|DB7PR08MB3833:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3833E60DC772550F314E64DFFC320@DB7PR08MB3833.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 U35QB7SjBzKG6wmqU/LbqMEllk3LBQnSZUI+8uvHlnLcJhAAppaQ0dfsFjYDDvwiV14LQT1NYkbDqmGisJIKeXsoV2pxUHHeouiRD7L6Ix6+ijdME8t2BPTp8FAm1zdbTpcnAEwgLtFVP2wPdIn+oEpouJjis7NUFXB4C5d16dUyuuq3aDh5QU2+XNWuhze/b/TVSFzimQauN1FVYL6sqPpNW1Gc2yZ2ijCJTAuPFLBgNrD3+AOHqRCNwdoa9t5KBpIWbOlL9PkM+XebCunAMqkdWj/bEznNiGzmfinuGa/jhpNbPHwSjx4a43YEB2/uiPgHtAMh3kXt7eBiWaimzzNDNVIZy81TN5IrC2bnAIFLeJN1iUJkv7z7J9r83MthMGTRc8cHBosI5z3JowyTsiRUib0DURyx7XFbUsQv3e9bWG5NRDF7jIxPuTx6vtaPObfy+7CTOqh6qs36hXMLKQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5702.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39840400004)(376002)(366004)(186003)(8936002)(316002)(36756003)(8676002)(54906003)(6506007)(83380400001)(2616005)(33656002)(6916009)(55236004)(53546011)(5660300002)(26005)(478600001)(86362001)(66946007)(76116006)(91956017)(66446008)(64756008)(66556008)(66476007)(71200400001)(6486002)(2906002)(4326008)(6512007)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 AfxJg/+nAJFWrL0gk5PKFtlqDP//0basYdC7JDH2Gtiu4b+XoTRpqCfhyq3ynZEktmAZhwah3bjvXNpgR6bRloP0ZHIQpbBUARTX5dfWzQfe6uGXQE1fA3e4Njs7TI/wV/VY6P2/1+x0C9/5yXLJZRYawmRvIBc1fJJtbBKc/cAT2tP02n7fFiaKUt+j6uJ8+rKhc2fy8DEXiuIQzRLMfKzF/0atpwlGj9IEilZ31RAv/1N2Rt6OPc3Hp4UhekUhjdh4oED7eaM3wDK/JTiIgd8PiWnM/opnQpoUwP4UXx7c5XDwtUho5b5S5oCY/o8UbpBp24vbM65E8+HhzBkIqrGMYij0j65peD7BVCegJS6YR8NkAcbD7yY4t9pVcehqKeiB8tM/Okl6pTKH7kYkjwVPn8S6w1w436c2Fw0cYLxRm1zBfocbxClGhk6/ZIXfUaOMrSglkw+DZCVxviFZTfQSGV/jmHanRLt7Fore1JklQqM2FIO6ra4ZE/EjhHi6kBve2rNHjM9kRoDPJbiOGKiDLEkLn9FV0d+/ZpiKSfuZUmxPVMKLxv4tCw5ot3I4DsNxGlLGtMnyIlmSiv7Z2drHt1YLXK/fyLirV+ZzKRFQdgP7z3Mk6aKMKjRLX0OQZlohHuzJCu/fb38aRSWV7A==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <65539CDB6D9092499E01B844B334D2FF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3434
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c64379fa-32b2-44ff-6bbc-08d86468c0ae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jsdWa4INND5X1CdqXqMKJHUjcFSer3gEs5nuRLg3f0dn2J7xRow8l/6P6EtdBj+SRxiknyIbaD2TrD+1PaeGv5T9icAwwvtDbu1i/crxdTln+WV62iFDoGebQhAOgIsIA+q1Khin90KEEBXd00m+RB1LYYCN3+6bbUkWaBmys7Pcbh8S5sT6+yGLmcSZs3Dl4kHtmvFIPa9+/JJTvJWauLS/FHcvrWu8i6wSVTHEVCLDvBY5yGIfD2UhZDTK/YbK2XBIZDBxMRKmn39ODFqmbG8zTtycKXfXWsLonDO5EZcrSN+ICiS4n5JMEmy9FoNFuiRtMoBralfAL2vEokv59rr43t7VtJaQVnPPGL31218MPjd5vZ0/spfIzGGlf5YH0JqitOvgid+rjUZLDLGCympZ54cJumcHspEUNpvdI7AaERe0OmkQ5jF67BWZnkUr+85AxsmnLi2FObNP392BnotBcH/E1w5UP47w2vNItb3VrWhbPHfDLSdm4E24j9HbVlFQ4TXeAITpThd+/a1fMw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39840400004)(136003)(46966005)(36756003)(6862004)(55236004)(81166007)(4326008)(5660300002)(8676002)(8936002)(107886003)(186003)(6506007)(53546011)(26005)(2616005)(356005)(6512007)(83380400001)(336012)(36906005)(478600001)(54906003)(316002)(33656002)(82310400003)(6486002)(966005)(2906002)(47076004)(70206006)(86362001)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 11:14:02.6369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ff5059-cb4a-4197-0d05-08d86468c591
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3833

Hello,

> On 26 Sep 2020, at 9:55 pm, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Commit 022387ee1ad3 "xen/arm: mm: Don't open-code Xen PT update in
> {set, clear}_fixmap()" enforced that each set_fixmap() should be
> paired with a clear_fixmap(). Any failure to follow the model would
> result to a platform crash.
>=20
> Unfortunately, the use of fixmap in the ACPI code was overlooked as it
> is calling set_fixmap() but not clear_fixmap().
>=20
> The function __acpi_os_map_table() is reworked so:
>    - We know before the mapping whether the fixmap region is big
>    enough for the mapping.
>    - It will fail if the fixmap is always inuse.
>=20
> The function __acpi_os_unmap_table() will now call clear_fixmap().
>=20
> Reported-by: Wei Xu <xuwei5@hisilicon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

>=20
> ---
>=20
> The discussion on the original thread [1] suggested to also zap it on
> x86. This is technically not necessary today, so it is left alone for
> now.
>=20
> I looked at making the fixmap code common but the index are inverted
> between Arm and x86.
>=20
> [1] https://lore.kernel.org/xen-devel/5E26C935.9080107@hisilicon.com/
> ---
> xen/arch/arm/acpi/lib.c | 75 +++++++++++++++++++++++++++++++----------
> 1 file changed, 58 insertions(+), 17 deletions(-)
>=20
> diff --git a/xen/arch/arm/acpi/lib.c b/xen/arch/arm/acpi/lib.c
> index 2192a5519171..eebaca695562 100644
> --- a/xen/arch/arm/acpi/lib.c
> +++ b/xen/arch/arm/acpi/lib.c
> @@ -25,38 +25,79 @@
> #include <xen/init.h>
> #include <xen/mm.h>
>=20
> +static bool fixmap_inuse;
> +
> char *__acpi_map_table(paddr_t phys, unsigned long size)
> {
> -    unsigned long base, offset, mapped_size;
> -    int idx;
> +    unsigned long base, offset;
> +    mfn_t mfn;
> +    unsigned int idx;
>=20
>     /* No arch specific implementation after early boot */
>     if ( system_state >=3D SYS_STATE_boot )
>         return NULL;
>=20
>     offset =3D phys & (PAGE_SIZE - 1);
> -    mapped_size =3D PAGE_SIZE - offset;
> -    set_fixmap(FIXMAP_ACPI_BEGIN, maddr_to_mfn(phys), PAGE_HYPERVISOR);
> -    base =3D FIXMAP_ADDR(FIXMAP_ACPI_BEGIN);
> +    base =3D FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) + offset;
> +
> +    /* Check the fixmap is big enough to map the region */
> +    if ( (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE - base) < size )
> +        return NULL;
> +
> +    /* With the fixmap, we can only map one region at the time */
> +    if ( fixmap_inuse )
> +        return NULL;
>=20
> -    /* Most cases can be covered by the below. */
> +    fixmap_inuse =3D true;
> +
> +    size +=3D offset;
> +    mfn =3D maddr_to_mfn(phys);
>     idx =3D FIXMAP_ACPI_BEGIN;
> -    while ( mapped_size < size )
> -    {
> -        if ( ++idx > FIXMAP_ACPI_END )
> -            return NULL;    /* cannot handle this */
> -        phys +=3D PAGE_SIZE;
> -        set_fixmap(idx, maddr_to_mfn(phys), PAGE_HYPERVISOR);
> -        mapped_size +=3D PAGE_SIZE;
> -    }
>=20
> -    return ((char *) base + offset);
> +    do {
> +        set_fixmap(idx, mfn, PAGE_HYPERVISOR);
> +        size -=3D min(size, (unsigned long)PAGE_SIZE);
> +        mfn =3D mfn_add(mfn, 1);
> +        idx++;
> +    } while ( size > 0 );
> +
> +    return (char *)base;
> }
>=20
> bool __acpi_unmap_table(void *ptr, unsigned long size)
> {
> -    return ( vaddr >=3D FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) &&
> -             vaddr < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE) );
> +    vaddr_t vaddr =3D (vaddr_t)ptr;
> +    unsigned int idx;
> +
> +    /* We are only handling fixmap address in the arch code */
> +    if ( vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) ||
> +         vaddr >=3D FIXMAP_ADDR(FIXMAP_ACPI_END) )
> +        return false;
> +
> +    /*
> +     * __acpi_map_table() will always return a pointer in the first page
> +     * for the ACPI fixmap region. The caller is expected to free with
> +     * the same address.
> +     */
> +    ASSERT((vaddr & PAGE_MASK) =3D=3D FIXMAP_ADDR(FIXMAP_ACPI_BEGIN));
> +
> +    /* The region allocated fit in the ACPI fixmap region. */
> +    ASSERT(size < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE - vaddr));
> +    ASSERT(fixmap_inuse);
> +
> +    fixmap_inuse =3D false;
> +
> +    size +=3D FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) - vaddr;
> +    idx =3D FIXMAP_ACPI_BEGIN;
> +
> +    do
> +    {
> +        clear_fixmap(idx);
> +        size -=3D min(size, (unsigned long)PAGE_SIZE);
> +        idx++;
> +    } while ( size > 0 );
> +
> +    return true;
> }
>=20
> /* True to indicate PSCI 0.2+ is implemented */
> --=20
> 2.17.1
>=20
>=20

Regards,
Rahul


