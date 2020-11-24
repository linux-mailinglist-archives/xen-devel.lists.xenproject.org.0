Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5221B2C2588
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 13:20:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35871.67524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khXIf-0001aV-Lj; Tue, 24 Nov 2020 12:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35871.67524; Tue, 24 Nov 2020 12:20:01 +0000
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
	id 1khXIf-0001Z6-GY; Tue, 24 Nov 2020 12:20:01 +0000
Received: by outflank-mailman (input) for mailman id 35871;
 Tue, 24 Nov 2020 12:19:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tuHM=E6=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1khXId-0001W3-6q
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 12:19:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.80]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab6357f3-f3c9-4f74-a78e-b8fd3044c125;
 Tue, 24 Nov 2020 12:19:58 +0000 (UTC)
Received: from DB6PR0601CA0046.eurprd06.prod.outlook.com (2603:10a6:4:17::32)
 by DB6PR0801MB1894.eurprd08.prod.outlook.com (2603:10a6:4:72::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Tue, 24 Nov
 2020 12:19:55 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::7f) by DB6PR0601CA0046.outlook.office365.com
 (2603:10a6:4:17::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 24 Nov 2020 12:19:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 12:19:55 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71");
 Tue, 24 Nov 2020 12:19:55 +0000
Received: from 0951a5ada50c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11E58ACC-864A-46CD-8122-9E99350E9045.1; 
 Tue, 24 Nov 2020 12:19:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0951a5ada50c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Nov 2020 12:19:41 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6220.eurprd08.prod.outlook.com (2603:10a6:10:205::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Tue, 24 Nov
 2020 12:19:40 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 12:19:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tuHM=E6=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1khXId-0001W3-6q
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 12:19:59 +0000
X-Inumbo-ID: ab6357f3-f3c9-4f74-a78e-b8fd3044c125
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [40.107.8.80])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ab6357f3-f3c9-4f74-a78e-b8fd3044c125;
	Tue, 24 Nov 2020 12:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lPurmAyxjBr8vvqzQC466c9CBWgu4SVW3fNteI5ru4=;
 b=I//jMKKCqWidDa6eikEFXS1LGz3YrIo5UW3egmeyNKu4pn6l4MEn/rs372TWmmDa7m76jB1IyY2h24EnJveYP7OyU6q3JrNCeY+GWqD1YDCDP0Kc5FtFRbJmgolkrneLWv47NvbREr2YJuT4roWs4yGp5O9NiR90Uin1m2cZ3H4=
Received: from DB6PR0601CA0046.eurprd06.prod.outlook.com (2603:10a6:4:17::32)
 by DB6PR0801MB1894.eurprd08.prod.outlook.com (2603:10a6:4:72::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Tue, 24 Nov
 2020 12:19:55 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::7f) by DB6PR0601CA0046.outlook.office365.com
 (2603:10a6:4:17::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 24 Nov 2020 12:19:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 12:19:55 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Tue, 24 Nov 2020 12:19:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e504c5c1d9bc8e27
X-CR-MTA-TID: 64aa7808
Received: from 0951a5ada50c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 11E58ACC-864A-46CD-8122-9E99350E9045.1;
	Tue, 24 Nov 2020 12:19:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0951a5ada50c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Nov 2020 12:19:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAgOW6gzhDn+wMwnQmLZkCBGRbp4MDuGIPy69Vkojjmzv30NRqNIsgEJcb5dI7Amhq4/1CyYUQR0pvFCPOnel8i/gi4heOMgrkL16W5Nmq0wGOSsJJP0bHiKdzMgWhuTAq5Miki36jprWknBU+0GujYM+YAMjJv/7zyDoYP/IAEeFn2/Dd6GjSqPKlmrShtFE4oHQwx0WYgm8RSlM+e/vKybAwV8v4NWWNNMy3eSa7FtYXYBqrKKq979ExOD/xNcNQY4o+hyIRhO0Ktsg1dpOwWKHv648x1maS4fiuWPxviQPiERkz2ZLhYW4eAqzENHMlqg7vBIEg9j2kEcDWdZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lPurmAyxjBr8vvqzQC466c9CBWgu4SVW3fNteI5ru4=;
 b=gpd0zQ3kb/DYKEKZS9LlKTQDlhDFLp1E5UPXD5JbclZsQueORuPB6wVpKC7zziQK4GMC+rN/PKPL8b2RitpR6mFJZnJbfPz8XcYT2W+N9l4ImkAb71cusPZkFi1qDJMXzU/HZ24jyEUwQewBDUkR8ackhLmZ5kkMYhCWjDrhaB85q+OOJT37rC1TLS9s8zXaDidrpjN+xvFw8OAODqBusvxqtbSjCNNubDiKQgq3nKLNg7UcDlbwv4u89pktrSpSZ4lMnOll8h4HhQk5aqml7uFdwCKJislGgvUaZpgRNsZvzE9X0WKvXEYTPUCSNfDAdArrvaBBFHk8mjSNs4nZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lPurmAyxjBr8vvqzQC466c9CBWgu4SVW3fNteI5ru4=;
 b=I//jMKKCqWidDa6eikEFXS1LGz3YrIo5UW3egmeyNKu4pn6l4MEn/rs372TWmmDa7m76jB1IyY2h24EnJveYP7OyU6q3JrNCeY+GWqD1YDCDP0Kc5FtFRbJmgolkrneLWv47NvbREr2YJuT4roWs4yGp5O9NiR90Uin1m2cZ3H4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6220.eurprd08.prod.outlook.com (2603:10a6:10:205::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Tue, 24 Nov
 2020 12:19:40 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 12:19:40 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFC 2/6] xen/arm: mm: Remove ; at the end of mm_printk()
Thread-Topic: [PATCH RFC 2/6] xen/arm: mm: Remove ; at the end of mm_printk()
Thread-Index: AQHWvqdY1rahTHlLkUqbsCGy2n+E1qnXOtqA
Date: Tue, 24 Nov 2020 12:19:40 +0000
Message-ID: <6D9F19C7-DAC2-4B29-93D8-B7F47DC90AB4@arm.com>
References: <20201119190751.22345-1-julien@xen.org>
 <20201119190751.22345-3-julien@xen.org>
In-Reply-To: <20201119190751.22345-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3befa256-49ff-4b83-fde3-08d890734094
x-ms-traffictypediagnostic: DBBPR08MB6220:|DB6PR0801MB1894:
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB18943DAEFFB9BBFD5D5AF9BA9DFB0@DB6PR0801MB1894.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PcNS2Q0oXvgO9OFRh476eq7x2RxKm2+gesLfrPA4yqVVHVQu6H9hhmvuOVwXr3a7XKGpJ2fLVObxjMR/u5fCuFulaDL24OAl6dE/YUZZeggKQFPvLQ0L9EPf7e2zmED2BRug4amvts5ZI4MfgdHTnK32fv+W5roVnZxwwoXflgXcbAQtJR9ReGufShGwJfFPoTAoiJS22TKRZ+zSpSyir/JoJhS1LjY+crin9QLalYt2OFh3zEZw3Rh1vFoxxzUW6gXxk4Q6ryoFKIsKW+qzQnu17d+aOM7GeRCULJnKU1g1kgQKqeG/loAvwfXmcscptetOMiF1j2pA+3LxlsgDKg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(66946007)(6506007)(2906002)(8936002)(36756003)(54906003)(86362001)(91956017)(8676002)(76116006)(53546011)(186003)(26005)(6916009)(478600001)(66556008)(6486002)(4326008)(4744005)(64756008)(316002)(33656002)(83380400001)(66476007)(66446008)(5660300002)(6512007)(71200400001)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 lipM6hV0cdJ7L37NHNSGvZtCU8ygsqZu9ZjZXi9GyrDLpZi8Rg9yQfaZeiXlOZ62lLTJczjPsmUm25NDIwmWzQbgy82VTMjYw4JSFJ25PFi72e7Dl/29bHN4TU1I3jeL3BhxGTRAN3sF5pqqVWKH9hrTJuFKy1MwzBkSJxrkmS6kv/1w0WapTDy8w/W3fsFNa0msBCOF4C2MqKq2iDOj4nM9hFCZYiDvK6Qj3Ubbnt24VrFTcmMelh7+V6uyWMtO3EaEStUDpFIP1ByZ1AZIOLTNbMl+lLJD5AeXGfTkTArpo3YmL0b48CbFJoz0ZXm0drA8n4Pem3fKjH0TdT5UKtjCRcDjndrubrTY85FwXy6s8NgR2h7CuDbt9WerowR9/38Pm4lJWraV2+YuCLHvo8lNk//0QyLLNvI/7HtuHNMkCNto+WxNiCudR1aqbW7c+sIlR7bmdBiF6GADicGCzMRg/7TAN8gBHX4XPo98bu2uyPbD19fOfPu3FflQQCTawwxozs7StqkNTclAjnOS5d6NbWma+vtp0wA/HEmllBwbg+9C0IJXmuj5uGw9K5a2dJQqtunPUKfISKHebeGq6HMSjI5BMs3n9RCLqrtY9sK609eRqNum/01HShcTa4esRGeGeGDDj9gXqcO4fa7yBpgh5XrDr+jLl0lxfEhgrnavMk0uBgGWuooUWWbd2MEo3DtSTDMu798DxJXpezGNyzCcsfdmarfBq6nSsmotfuA/L3dFqaTNLbULSlqMG8nYUpW/Uvccm4qXnLdjjIcrYEdSOpDLM/76wm3ijpGZSeC1rr82D40d5ix9AZlMp23T2ub2tXEyzRecIVLA95SsuHO9Q+EXHKfuwaFQ6Qu9vg+tApLQbblZ/iimgj6bBA/aQafq+TtG7cWCO4kTXYjJCQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4142C9E21973E3408B1FC811E4ADF684@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6220
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	071b888d-b6d5-49df-b05a-08d8907337bc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sx726/Ajflwrv866XOq1LDMAeosjHUl0aXxW5/4M8EZj5OZAk22BtdJ4NQlm8J+7Lxy5k+1WK8GdtqTo+6nLpUtuMtL86A9tjFUY3SHZvmxnNUgNvwqz8mo7YR5sroCBmwqnW81iw5aLd6Y5AD7bhp/hCrV2bqgvZJyoCuhiYeml9Oymjd3Jump2nrOV85f3RRl181sdTY7g46jOX0HQBg18m9A7o2dxkYiV2gXoKPXOxDeProvCByLLGV4PHgOA9oLUTeuxUkkkuNq3DMtTsjtn0Z6El2ksmvMDPJBzCJ1gOlDZXU1vppFlyoRWJLn07VqMdMYjNf4dFiipkRv/KkB7ukESu9+4DxIsZwS5sefyXTn4TkDeeVmoPfZLvlY7d3p17M0uB9D9WC7OfKYUwQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966005)(70586007)(336012)(2616005)(70206006)(6862004)(54906003)(107886003)(6512007)(4326008)(8676002)(2906002)(8936002)(316002)(82310400003)(6486002)(4744005)(356005)(83380400001)(53546011)(47076004)(478600001)(33656002)(86362001)(186003)(36756003)(81166007)(5660300002)(26005)(82740400003)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 12:19:55.2000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3befa256-49ff-4b83-fde3-08d890734094
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1894

Hi Julien,

> On 19 Nov 2020, at 19:07, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The ; at the end of mm_printk() means the following code will not build
> correctly:
>=20
> if ( ... )
>    mm_printk(...);
> else
>    ...
>=20
> As we treat the macro as a function, we want to remove the ; at the end
> of it.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> xen/arch/arm/mm.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 4dd886f7c80d..59f8a3f15fd1 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -59,7 +59,7 @@ mm_printk(const char *fmt, ...) {}
>     {                                       \
>         dprintk(XENLOG_ERR, fmt, ## args);  \
>         WARN();                             \
> -    } while (0);
> +    } while (0)
> #endif
>=20
> /*
> --=20
> 2.17.1
>=20
>=20


