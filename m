Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F1E28DF7B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 12:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6562.17497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSeV3-0005nu-1l; Wed, 14 Oct 2020 10:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6562.17497; Wed, 14 Oct 2020 10:59:17 +0000
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
	id 1kSeV2-0005nU-Ua; Wed, 14 Oct 2020 10:59:16 +0000
Received: by outflank-mailman (input) for mailman id 6562;
 Wed, 14 Oct 2020 10:59:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kSeV2-0005nO-3l
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:59:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.80]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc56b1b1-cb3d-4835-a8f4-3c0478bf68d9;
 Wed, 14 Oct 2020 10:59:14 +0000 (UTC)
Received: from DB8PR03CA0006.eurprd03.prod.outlook.com (2603:10a6:10:be::19)
 by DB7PR08MB3308.eurprd08.prod.outlook.com (2603:10a6:5:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Wed, 14 Oct
 2020 10:59:13 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::59) by DB8PR03CA0006.outlook.office365.com
 (2603:10a6:10:be::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Wed, 14 Oct 2020 10:59:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 10:59:13 +0000
Received: ("Tessian outbound d5e343850048:v64");
 Wed, 14 Oct 2020 10:59:13 +0000
Received: from 9b878a7f834e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AA9487CA-3184-4B3D-A6CB-998640FFCFA1.1; 
 Wed, 14 Oct 2020 10:58:35 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b878a7f834e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Oct 2020 10:58:35 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4677.eurprd08.prod.outlook.com (2603:10a6:10:f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 10:58:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 10:58:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kSeV2-0005nO-3l
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:59:16 +0000
X-Inumbo-ID: bc56b1b1-cb3d-4835-a8f4-3c0478bf68d9
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [40.107.6.80])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bc56b1b1-cb3d-4835-a8f4-3c0478bf68d9;
	Wed, 14 Oct 2020 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/z+3GxGiuGnOI9OlFaRm6nlrVxjp/eazqjpMJaIMXI=;
 b=IYKyumXogtu3YRPi0Oxi4qVqB4IngWjA0MFb8u+LQ8XUDfmwHMJoCFXb903siJOV2aUN0XbjZZccFWsKJZY2Nso2BcFcXtRd2n7DpJB+Y74UGXPikv4yQg7SNIwVDICdpPS4u/O6NBsFJVgn/RRW+aKVhEdUDt5QlePBrJu57n8=
Received: from DB8PR03CA0006.eurprd03.prod.outlook.com (2603:10a6:10:be::19)
 by DB7PR08MB3308.eurprd08.prod.outlook.com (2603:10a6:5:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Wed, 14 Oct
 2020 10:59:13 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::59) by DB8PR03CA0006.outlook.office365.com
 (2603:10a6:10:be::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Wed, 14 Oct 2020 10:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 10:59:13 +0000
Received: ("Tessian outbound d5e343850048:v64"); Wed, 14 Oct 2020 10:59:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 65f3f47ce3aa927c
X-CR-MTA-TID: 64aa7808
Received: from 9b878a7f834e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AA9487CA-3184-4B3D-A6CB-998640FFCFA1.1;
	Wed, 14 Oct 2020 10:58:35 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b878a7f834e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Oct 2020 10:58:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtwDJWwZjFJXr/suui0z/3gPUsn5RZTlB94diPZOi44Q/aIg/D0j/L6lo0aQ4P/QbN47O7kNsC8/iZ8dS2vA5wDKRxdk8VzIY1KjYWWcwBW60Pi3ums24S/4xQ9hafFrXLdYwQUcKzt1gs+XpGscty3pu+qgsZ2rTbKv5Ds3eb2a2+ZRT5Uu8ze5Oi9y3joI408q3wThQ+zXm5fdCTBGBWAT5ORUeXabobzWhdceEctiB3MHsL2AxY/C3BGuy34bNfy3aSbS8+07RpYFP8oBi8e+06zbkzAT4kqxnZ6cl/rJFP3o6Z/2kUM3tAjSa/UkOtgMQPCVoSRMGxbzCMleQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/z+3GxGiuGnOI9OlFaRm6nlrVxjp/eazqjpMJaIMXI=;
 b=hZfdTvNv7jxT96uFhqRw9K4TaMwYxxGWVV/8NUzteM0qXe08RI2PxJyOX2zEm/TjCeVGfIFB75o4IxaDKQbS9vEuYBWldcIoJ/WZ8/vIPOKXrLtQBkhADflstLDPXDCV0sU1S/bNK7jy+VRMjhydzXYeiC79+1ONRz0d5K/HAZ2RYI6r1VUdZpGalaVgyNbva4y547rvMOogR45NiEIqqsQmxOEoiOHFrH9Y5mzSfEMu1sU1lw7yfTZyl180c+h4Whg0hO+tBc2YvsAdYdo73fqx2NcuLU+vv6j0EqgC2lybetH3aF/1N7g0GUrsfol6IypBITRp0TO8ng/88MdATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/z+3GxGiuGnOI9OlFaRm6nlrVxjp/eazqjpMJaIMXI=;
 b=IYKyumXogtu3YRPi0Oxi4qVqB4IngWjA0MFb8u+LQ8XUDfmwHMJoCFXb903siJOV2aUN0XbjZZccFWsKJZY2Nso2BcFcXtRd2n7DpJB+Y74UGXPikv4yQg7SNIwVDICdpPS4u/O6NBsFJVgn/RRW+aKVhEdUDt5QlePBrJu57n8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4677.eurprd08.prod.outlook.com (2603:10a6:10:f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 10:58:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 10:58:33 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "open list:X86" <xen-devel@lists.xenproject.org>
CC: "jgross@suse.com" <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/2] tools/libs/stat: use memcpy instead of strncpy in
 getBridge
Thread-Topic: [PATCH v3 1/2] tools/libs/stat: use memcpy instead of strncpy in
 getBridge
Thread-Index: AQHWnLHiDj1hArywQEGBhk10fWLXEamW+IUA
Date: Wed, 14 Oct 2020 10:58:33 +0000
Message-ID: <A6CDE62A-13F4-491B-BE0B-180657136504@arm.com>
References:
 <4ecb03b40b0da6d480e95af1da8289501a3ede0a.1602078276.git.bertrand.marquis@arm.com>
In-Reply-To:
 <4ecb03b40b0da6d480e95af1da8289501a3ede0a.1602078276.git.bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae34eac0-5660-4f27-8d7c-08d870302fa2
x-ms-traffictypediagnostic: DBBPR08MB4677:|DB7PR08MB3308:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3308B96D1EF4367DC6BEB2DC9D050@DB7PR08MB3308.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 t+TN0Yh4cSJCDod6g45Y1HREIPCR+69TckTwDNgNAAERE3i1jQthtszRsUgtilqfS34QZ9/Fj2exabPePVXoCwG40LXknpDMCoUYKcqKPrzGD6MNxKkszXbP0i0DIJe6gJYKzdIRRDUE4cqcf0c57YtCNEcHtyPTxv8Mu6cl/CmM6kD2/ATw+UN6U3wlANDjTHJUqmGjssXheQR9Z/kxhHM678t8+hGYbK6XoJwoa6MGvpbNqgHYc9X5/auZfPD3wOzUVzlUmItEG7ZewDt1HyNDda3N6wknEvO3yCVaBsgMNl4QXklG48BKRwjcwibKYyfXV1K8Jh1Pwoqs/9TQww==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(53546011)(6506007)(478600001)(5660300002)(2616005)(71200400001)(83380400001)(6486002)(86362001)(26005)(33656002)(186003)(4326008)(66446008)(64756008)(66556008)(66476007)(76116006)(91956017)(54906003)(6512007)(6916009)(36756003)(66946007)(2906002)(8676002)(316002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 SAbKU+Md948TSYfbzOhAZrHTnzokVYhgBA0DPdFY0HP1Cr8RUPD4/B9AzRzxTnNMnWExkgg8OFtTk2B0RWKZFJVYrFOQCFIsQ74IhpyGzN5A1xdhdhsy/PTuigsudR2E5dRjRHeFVoP33c8i2dRBurmTQLwEARimrNSpYFfDUcXQBp7KlAJUq+A+AXqe6j5w93YIqtf7Jmy07vEacDnJeIIGGsOhE29Gl+U9zcvRtGN1EOCQc6I9IZjTk3onnu6oGAiQGMUgV1dpJkJ4TB2EBojABh+EwpxaJCvq8Ro0UJmvSZrpNpupWrjfF0VYb4jrgE64KTq9mlT8n+CGvhkJjH9tEEEZ5u2JCYaxqSlNNUgpi+vSpr+PPoJ3jPSvPoVd0v+Sd4HN1gffYjCPn/8LthxcFQF3UKvSemiBxUawU1Ul0h66gTNzxRvRFSSRwkj7xKGvvZ4aSmSkNuuGX/yNgGzkeuFcMeAIPCr6ExGAIJZeU5x4HJ8uRpqj7ACsOnND0Y8zvj6mSH/tNHFfgu7Ow2uCvNOp7ZtaFtA2hthSQmLDhVlNouxZyT95cxLVSHaViLBUoHznNg4j4xxCrLLm5v+wsC9i0SnFQfCu3VRsnv92G2a21/C4s7+HzDAaLK4ssq0hGD+fw2hj3bgcc73qyg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <34709061F61871418DCC607D3ECE1BE5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4677
Original-Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	272fcb94-a5c8-486a-e4d6-08d870301806
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	twccvz65O4xMseWTk4C7T22uTsu7DyFdTThlEgDBM4kMLv6sZsZ7DKfrlXMPWx765LRrIO5czSIjMSyxdLj6dy8qhqClTw+cCJKrC2WsMpoW4BV4YOzm5MPYYjUV3wL/jewIOPv3ZnMGhG7wH8+XN3eu3A4iQQ5CBc7cNyyIjK8ojnKaduwHicz4Mnageda/zPXOUo3RcybIUaO7J6658guos2813NIhNyIGqTUMl2rQuRaqLe0pNkLVir5KBKDTj7CZB8mmKkF8Z7BCq+7TMvAPfCnE/gOnPrDH2xptprJ0W+x5LnGflv1h380noo6a1UaeMovCYk77RiYooOZ2WmFRLupvRaF6/OvbaDYs4hDDJL2309A3Xqb0TjkM1CfAls1+wgqxdTNn20hWRDk6PQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966005)(8676002)(70206006)(5660300002)(81166007)(70586007)(54906003)(6506007)(316002)(26005)(2906002)(336012)(53546011)(2616005)(83380400001)(4326008)(33656002)(186003)(6512007)(6486002)(8936002)(478600001)(36756003)(6916009)(86362001)(47076004)(82740400003)(82310400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 10:59:13.2778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae34eac0-5660-4f27-8d7c-08d870302fa2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3308

Hi,

Could this be reviewed so that gcc10 issues are fixed ?

Thanks
Bertrand

> On 7 Oct 2020, at 14:57, Bertrand Marquis <bertrand.marquis@arm.com> wrot=
e:
>=20
> Use memcpy in getBridge to prevent gcc warnings about truncated
> strings. We know that we might truncate it, so the gcc warning
> here is wrong.
> Revert previous change changing buffer sizes as bigger buffers
> are not needed.
>=20
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v3:
> Do a memset 0 on destination buffer and use MIN between string length
> and resultLen - 1.
> Changes in v2:
> Use MIN between string length of de->d_name and resultLen to copy only
> the minimum size required and prevent crossing to from an unallocated
> space.
> ---
> tools/libs/stat/xenstat_linux.c | 13 ++++++++++---
> 1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_li=
nux.c
> index d2ee6fda64..e0d242e1bc 100644
> --- a/tools/libs/stat/xenstat_linux.c
> +++ b/tools/libs/stat/xenstat_linux.c
> @@ -29,6 +29,7 @@
> #include <string.h>
> #include <unistd.h>
> #include <regex.h>
> +#include <xen-tools/libs.h>
>=20
> #include "xenstat_priv.h"
>=20
> @@ -78,8 +79,14 @@ static void getBridge(char *excludeName, char *result,=
 size_t resultLen)
> 				sprintf(tmp, "/sys/class/net/%s/bridge", de->d_name);
>=20
> 				if (access(tmp, F_OK) =3D=3D 0) {
> -					strncpy(result, de->d_name, resultLen);
> -					result[resultLen - 1] =3D 0;
> +					/*
> +					 * Do not use strncpy to prevent compiler warning with
> +					 * gcc >=3D 10.0
> +					 * If de->d_name is longer then resultLen we truncate it
> +					 */
> +					memset(result, 0, resultLen);
> +					memcpy(result, de->d_name, MIN(strnlen(de->d_name,
> +									NAME_MAX),resultLen - 1));
> 				}
> 		}
> 	}
> @@ -264,7 +271,7 @@ int xenstat_collect_networks(xenstat_node * node)
> {
> 	/* Helper variables for parseNetDevLine() function defined above */
> 	int i;
> -	char line[512] =3D { 0 }, iface[16] =3D { 0 }, devBridge[256] =3D { 0 }=
, devNoBridge[257] =3D { 0 };
> +	char line[512] =3D { 0 }, iface[16] =3D { 0 }, devBridge[16] =3D { 0 },=
 devNoBridge[17] =3D { 0 };
> 	unsigned long long rxBytes, rxPackets, rxErrs, rxDrops, txBytes, txPacke=
ts, txErrs, txDrops;
>=20
> 	struct priv_data *priv =3D get_priv_data(node->handle);
> --=20
> 2.17.1
>=20
>=20


