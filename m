Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574002C50E2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 10:06:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38326.71070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiDE9-0006cl-6C; Thu, 26 Nov 2020 09:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38326.71070; Thu, 26 Nov 2020 09:06:09 +0000
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
	id 1kiDE9-0006cM-39; Thu, 26 Nov 2020 09:06:09 +0000
Received: by outflank-mailman (input) for mailman id 38326;
 Thu, 26 Nov 2020 09:06:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YrL6=FA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kiDE8-0006cH-3I
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 09:06:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6394dc6b-b505-4b1a-9eb9-d4554834b73d;
 Thu, 26 Nov 2020 09:06:05 +0000 (UTC)
Received: from DB7PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:10:36::26)
 by DB8PR08MB5420.eurprd08.prod.outlook.com (2603:10a6:10:11a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Thu, 26 Nov
 2020 09:06:02 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::ae) by DB7PR05CA0013.outlook.office365.com
 (2603:10a6:10:36::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Thu, 26 Nov 2020 09:06:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 26 Nov 2020 09:06:02 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71");
 Thu, 26 Nov 2020 09:06:02 +0000
Received: from 263d92b9c4c1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF22D542-F459-4E8D-B199-AD6813BF1D92.1; 
 Thu, 26 Nov 2020 09:05:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 263d92b9c4c1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Nov 2020 09:05:25 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5752.eurprd08.prod.outlook.com (2603:10a6:10:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 26 Nov
 2020 09:05:23 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Thu, 26 Nov 2020
 09:05:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YrL6=FA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kiDE8-0006cH-3I
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 09:06:08 +0000
X-Inumbo-ID: 6394dc6b-b505-4b1a-9eb9-d4554834b73d
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [40.107.8.84])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6394dc6b-b505-4b1a-9eb9-d4554834b73d;
	Thu, 26 Nov 2020 09:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSRjyHnXyIT9S45rnI/JgSQvqBdzuhnq3nM6vMo9T6w=;
 b=F9WHnFkTRgXgstDWzLVBAJ0iuVW30wgHOcvLjamAfVxbVkn2wVDU1k4TxRTblnHoKiH0JK1RzCUBVhNfkKOi4GKtgTMRHE7WtcS/XdrkD5U3ias1DDOK9wvctgLCqoBJumrQSoMdbctroQbrbDrKHJblsMFPNpoh+VUheoZPnaM=
Received: from DB7PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:10:36::26)
 by DB8PR08MB5420.eurprd08.prod.outlook.com (2603:10a6:10:11a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Thu, 26 Nov
 2020 09:06:02 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::ae) by DB7PR05CA0013.outlook.office365.com
 (2603:10a6:10:36::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Thu, 26 Nov 2020 09:06:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 26 Nov 2020 09:06:02 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Thu, 26 Nov 2020 09:06:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d493af7f5a0fa21
X-CR-MTA-TID: 64aa7808
Received: from 263d92b9c4c1.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DF22D542-F459-4E8D-B199-AD6813BF1D92.1;
	Thu, 26 Nov 2020 09:05:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 263d92b9c4c1.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 26 Nov 2020 09:05:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjDhftZzRStdlpwgVNv+ZYKkV6p1yjlA1IAaWDvHxYeuuH2JCYiL+1fAOqjVjkf26r2265tVnUccA3oeDWsdDxCSE5rAmgRE4b0UNkPHk8Ys0oelc5e61q3hVuybWFM1+cosR6Xa8vMMf+llz7LijUwvfV37yVLdqBPO6+wXedJ+w2YiRX+m2/fJ9S9nHEFyVg5p5PWCj1nBDz8LEVRa2X1RYxmb0jwqhC6fkECZF9rIgsAhMFoxFZ+CVWygApRHT2vxc0Mmvd1V/54CE7ZoAcaLL0v9kmyw1DgyX498OBDZVc1SiYqkWQplNeuKYrfDskY9AHxbhT+qI2ueenopZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSRjyHnXyIT9S45rnI/JgSQvqBdzuhnq3nM6vMo9T6w=;
 b=Q9rvL3SDEO512dWo5VsV3Nklps5hUPosYmUJUrH3EiT90+Dwk8otV6ZcaXal3ZWBv4gaBly6Fb2k8mOoS2J3Eov1aeSzPSKGcpUGz0Xd9dPUPJpxhJsQ+qc9vKrmhBNlTZPBBhtW9mrW4B/daz50zzzLVotqM3DZagdTU5RAAXhY6xdqqR9kZhBFiaAgZBZ0WhFrK/kcYMfwgtjRIIqMxY531v8eVrNrP4LJ4bZ7MEKARyxH7C4p7Wff93vmNCRD00WgpOpNHp+J+nW+boUcQvNFAtH4zb77/2MkcwS8siPAtCZCYZ+bM1UbljLVkYoAlNjHoi7Jd0Js0mmajhWgdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSRjyHnXyIT9S45rnI/JgSQvqBdzuhnq3nM6vMo9T6w=;
 b=F9WHnFkTRgXgstDWzLVBAJ0iuVW30wgHOcvLjamAfVxbVkn2wVDU1k4TxRTblnHoKiH0JK1RzCUBVhNfkKOi4GKtgTMRHE7WtcS/XdrkD5U3ias1DDOK9wvctgLCqoBJumrQSoMdbctroQbrbDrKHJblsMFPNpoh+VUheoZPnaM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5752.eurprd08.prod.outlook.com (2603:10a6:10:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 26 Nov
 2020 09:05:23 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Thu, 26 Nov 2020
 09:05:23 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 2/3] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled.
Thread-Topic: [PATCH v4 2/3] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled.
Thread-Index: AQHWw1cqKGlzLIMerka7j78FZA7vhanaH92A
Date: Thu, 26 Nov 2020 09:05:23 +0000
Message-ID: <AF56CBF8-CAE2-4296-BEE9-0DED2CD6A648@arm.com>
References: <cover.1606326929.git.rahul.singh@arm.com>
 <2ce402cfae6d90433626bcdc6314e5ee5dda103f.1606326929.git.rahul.singh@arm.com>
In-Reply-To:
 <2ce402cfae6d90433626bcdc6314e5ee5dda103f.1606326929.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56c3c183-d7b0-44e5-426d-08d891ea7ffc
x-ms-traffictypediagnostic: DBAPR08MB5752:|DB8PR08MB5420:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB54209DCDBC8BC31B1631DB389DF90@DB8PR08MB5420.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wpqn7tq7+NQ3WpuiHCmpse+xHn0Ffvw2VRCnFQfBKptc1zUAN2cT1V1L1nqCBJwfMYvHDNlbHg1Rjbo1rfm3EZKpPaU70CLIOkmF8FwsujKM81CHGuEMzKq6cb6r4Fc03rHgpJdrIprGC+NLrjXgLwKPOrF/rLYcoRgxKv/P1SFLZYgtPfLc4QHiHlZ4Y98TK/fS1q8Zs0Sm507tO/86ipKJgE8HpxFu6jAP42a3jxeOEKL675sNWLDTE4QJvugd4+PuVX1qQzg+sRRuTiB4LEUuxvcEbggtHXVDfDb55gf0rI9qTaazGDl/Hc5wuEI7qzkLA+kww4adxMZeIGAxhQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(6506007)(86362001)(6512007)(186003)(8936002)(6636002)(316002)(33656002)(53546011)(6862004)(26005)(37006003)(6486002)(2616005)(2906002)(5660300002)(8676002)(54906003)(76116006)(91956017)(4326008)(36756003)(66476007)(66556008)(66946007)(66446008)(83380400001)(71200400001)(478600001)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?mMJI+yrjiYoNnpblZ7mgxQR8u2ek7shtMOePl7KSBaVxkLPKzrw7bBRCPMfz?=
 =?us-ascii?Q?2w9olra1aVBmtOdqwxD4UlC12RG0Prx5ZPykXsA2E5HeJw30wHnix2qCH3TP?=
 =?us-ascii?Q?bL5qvPzzzDW61LEKlAZxchaQFrxEuLluUPGRMFJznHWBjR2/a54SBF8muJb4?=
 =?us-ascii?Q?uQ51mL4FdYOknR6XhFYtLKLXZwVCXH2icmAY0BSeFz99MsI8LqBfiSn2CsKt?=
 =?us-ascii?Q?N+AyGkIbmEZ/A3ODTbzUuv1yI196r+TxpVSLVJ+rf92zKKbYlwM4hGlSB798?=
 =?us-ascii?Q?fdWlMZXSXqvqRBowT9S4fhGsehoKlscBqA8Sg4rY13wehOkNuzsXI6rMmyxm?=
 =?us-ascii?Q?see58QlwUT8wousmYTzDspoe8Y/Uhy/tU+cwW+WoNNqamUkFsv4ksWzEWGBs?=
 =?us-ascii?Q?NfMNEeZ+9iQsHQvA06M2Z5Avw8s2/454/nid5y+mrYf4AoCg+pPqgSt1CO0o?=
 =?us-ascii?Q?+lf0Hm6Hrt5PHUvIzZC2AOo662rkqhed+8+KZfsR4Rzl+LbFkf6UFnDt9ZBp?=
 =?us-ascii?Q?FfcuBv+3CjPqDb01NyiboS0Rg8+e62k566a8yWKxOGtR5QFWREmT8ZPFe32R?=
 =?us-ascii?Q?ta5mBsGAjQpHoy3PyN7v8cR98o5yKIQOVBjBsCESw5Vs9GBGn3461qsCZoqP?=
 =?us-ascii?Q?Vught5jjyb8r1iICGfDqTpo+ghcq1/X9cLA84lXr944fD9Ifeqxk+8+619g3?=
 =?us-ascii?Q?gNlMjEBOhI4b7K0joShd/hVZpd6zQY2Of7n1TPvMlokNaYwLQeHBgx1ltKWj?=
 =?us-ascii?Q?r6JBjeGbK09WUqlxZaMO1bT/LPQyp3EY4oT9Ro7q6j1swiAdBgJj0cxo8ajH?=
 =?us-ascii?Q?M/XScTkvKl97wQwauJ4o0wpEFXXXnv3O6Mu/X2gjRsWUhucDoTZC/euDdanq?=
 =?us-ascii?Q?wxWoYhFqysaDO1bVpc8VcJf9NfC7FshqQaZ19P3ZW3lwr5JYL+sxUPZuyRIJ?=
 =?us-ascii?Q?3HKfKzjHvS+bNXOYXZZA3X4YoaFLKdVHN3UP8KMBD+sAFCcp55MgAqbbC9Zh?=
 =?us-ascii?Q?9nPM?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D1E794986DEACE4FBC1330722C8864B4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5752
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	649ee203-378e-43e9-8ba9-08d891ea689e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Rab5wsjrK6/fT8zoms2d9cTprr3bL8RP//OoQesHq5aFIQ+iIcDuEYEmlNby5VuHRlAJGSS6ggjw2nixvPyjihmPB0O37W+oHoFrNW16FjJsiFoyoEHb8C000m9tjoqJfnXMvK+BFiZy9GORBABzaCdulP3TCIaX1rPCfxkO5cea/Q6cXbt+V47rQD0e/jsyjqQn8Wopqy92ck+VhFZfkwDmtJR7DYalBgExDfE/SHUOdP4y1yfZfR9C+626NFQ4Y84D5hBx45wOzRo4gsKXzMTH1Bro68+WLlEklBBiCtq77L3rEDosm7iMWSjWz1KzM/FXjic/Wdw4wRxgGFxxzjUyJ/vTuCLhidNdQm05GdyB5qL53G8ERlWEYZMLPnNFzRUnWddO50LjrhSqCq/bA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966005)(336012)(6636002)(8676002)(356005)(5660300002)(81166007)(6486002)(26005)(478600001)(47076004)(2906002)(86362001)(2616005)(82740400003)(83380400001)(37006003)(8936002)(6506007)(4326008)(53546011)(33656002)(6862004)(54906003)(186003)(6512007)(36756003)(82310400003)(70586007)(316002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 09:06:02.8478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c3c183-d7b0-44e5-426d-08d891ea7ffc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5420



> On 25 Nov 2020, at 18:16, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> If mem-sharing, mem-paging, or log-dirty functionality is not enabled
> for architecture when HAS_PCI is enabled, the compiler will throw an
> error.
>=20
> Move code to x86 specific file to fix compilation error.
>=20
> Also, modify the code to use likely() in place of unlikley() for each
> condition to make code more optimized.
>=20
> No functional change intended.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I guess the small typo fix could be fixed by the commiter directly :-)

Cheers
Bertrand=20


> ---
>=20
> Changes in v4:
> - fixed minor comments
>=20
> ---
> xen/drivers/passthrough/pci.c       |  8 +-------
> xen/drivers/passthrough/x86/iommu.c | 13 +++++++++++++
> xen/include/xen/iommu.h             |  2 ++
> 3 files changed, 16 insertions(+), 7 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.=
c
> index 3c6ab1bcb6..4c21655b7d 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -20,7 +20,6 @@
> #include <xen/iommu.h>
> #include <xen/irq.h>
> #include <xen/param.h>
> -#include <xen/vm_event.h>
> #include <xen/delay.h>
> #include <xen/keyhandler.h>
> #include <xen/event.h>
> @@ -1418,12 +1417,7 @@ static int assign_device(struct domain *d, u16 seg=
, u8 bus, u8 devfn, u32 flag)
>     if ( !is_iommu_enabled(d) )
>         return 0;
>=20
> -    /* Prevent device assign if mem paging or mem sharing have been=20
> -     * enabled for this domain */
> -    if ( d !=3D dom_io &&
> -         unlikely(mem_sharing_enabled(d) ||
> -                  vm_event_check_ring(d->vm_event_paging) ||
> -                  p2m_get_hostp2m(d)->global_logdirty) )
> +    if( !arch_iommu_use_permitted(d) )
>         return -EXDEV;
>=20
>     /* device_assigned() should already have cleared the device for assig=
nment */
> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthroug=
h/x86/iommu.c
> index f17b1820f4..cea1032b3d 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -18,6 +18,7 @@
> #include <xen/guest_access.h>
> #include <xen/event.h>
> #include <xen/softirq.h>
> +#include <xen/vm_event.h>
> #include <xsm/xsm.h>
>=20
> #include <asm/hvm/io.h>
> @@ -308,6 +309,18 @@ struct page_info *iommu_alloc_pgtable(struct domain =
*d)
>     return pg;
> }
>=20
> +bool arch_iommu_use_permitted(const struct domain *d)
> +{
> +    /*
> +     * Prevent device assign if mem paging, mem sharing or log-dirty
> +     * have been enabled for this domain.
> +     */
> +    return d =3D=3D dom_io ||
> +           (likely(!mem_sharing_enabled(d)) &&
> +            likely(!vm_event_check_ring(d->vm_event_paging)) &&
> +            likely(!p2m_get_hostp2m(d)->global_logdirty));
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 191021870f..056eaa09fc 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -381,6 +381,8 @@ DECLARE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
> extern struct spinlock iommu_pt_cleanup_lock;
> extern struct page_list_head iommu_pt_cleanup_list;
>=20
> +bool arch_iommu_use_permitted(const struct domain *d);
> +
> #endif /* _IOMMU_H_ */
>=20
> /*
> --=20
> 2.17.1
>=20


