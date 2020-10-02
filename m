Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B1228181A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 18:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2259.6732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOO4w-0004ci-QZ; Fri, 02 Oct 2020 16:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2259.6732; Fri, 02 Oct 2020 16:38:42 +0000
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
	id 1kOO4w-0004cJ-MF; Fri, 02 Oct 2020 16:38:42 +0000
Received: by outflank-mailman (input) for mailman id 2259;
 Fri, 02 Oct 2020 16:38:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jYI3=DJ=nxp.com=laurentiu.tudor@srs-us1.protection.inumbo.net>)
 id 1kOO4u-0004cD-QE
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 16:38:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.60]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c00ff61-f01a-4993-b7cb-bd9becdfc7ee;
 Fri, 02 Oct 2020 16:38:39 +0000 (UTC)
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR0402MB3422.eurprd04.prod.outlook.com (2603:10a6:803:6::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Fri, 2 Oct
 2020 16:38:37 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 16:38:37 +0000
Received: from [192.168.1.106] (86.123.62.1) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Fri, 2 Oct 2020 16:38:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jYI3=DJ=nxp.com=laurentiu.tudor@srs-us1.protection.inumbo.net>)
	id 1kOO4u-0004cD-QE
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 16:38:41 +0000
X-Inumbo-ID: 2c00ff61-f01a-4993-b7cb-bd9becdfc7ee
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [40.107.21.60])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2c00ff61-f01a-4993-b7cb-bd9becdfc7ee;
	Fri, 02 Oct 2020 16:38:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wc1cgADXlo22tBLRuaCLGpGhncQwEZcRZNz9jS9XlKjK4LJd0H573zPktcue/KJcigv0iRmnO/fMgadKa9z20l7lZC+3/W4Z9/4ABeRRqBLilsGR6KFwMcmSRnVPQK3Oxkvtj0xU0itaJ+InfH6tXnL89G7JkV8GpCfmwhmjF2mklE/hu4G2m0inxhyCcs51OLDj2FkdIWwrTOtMwWFB2a4Cvi37POykEHCaunOU8OLn8NQxSM+ykFxjBhf6St/6l0FJwkN1qaf3v4pMIlAfkZT5teNk3e6GC9oOR+d6sYJW9vLblXeZOplNqDcZHoPsTwit3uGalu+7czZ8VCo4Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTHHU8JHyLqSMsxY5XKoXaIlmoeMNz1VJwB0pfiKP0A=;
 b=Ci3XbvQF05tYe61B0BIwqBvqqYyBq0+40JWSZewGo5RIGVMCxKUw54Ua0EpvNat5l1UAWxJHNHuwir+XGzVTlcSs02CT0d/JteqHzPn94bKVhjoXmc59N0f4AGPqYHyB7AKdwTp4iQ+zXfAGk926nPaz4Xh7ZnDpx3CHanCe+VWPRLNlHOw3vYhrXiQK87vdLzFgh58f8bLhZ+iUiQ4QuGdFrQFOmOfQGOsOvAcDnWmkOnLJcyr5xAn5uGNpTVCAoFgI1hXbnu1uQ2wqnHGVQZgjcbV3R8x7SxhIu7C5zgsSbB2B0Hi2J87ghFUdegfbkakNM8g+ROU8eI+RAL8jng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTHHU8JHyLqSMsxY5XKoXaIlmoeMNz1VJwB0pfiKP0A=;
 b=Y3HBvxTL+BUDXDEU1WcK7BAcgvpu+M1T6CYcTccpYIBfC3HR2fNd7z3sf9oll6z4J+JBBI08AJDVfMKv4WMnIA+OpzesZU3Zo3UFVhr3cHOYkKU4VcQ3Lam5Z7tibdxo9oz9ZxRITU5WKYJDA45WjgFjDeJqRmirhyR5CRpVIS4=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR0402MB3422.eurprd04.prod.outlook.com (2603:10a6:803:6::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Fri, 2 Oct
 2020 16:38:37 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 16:38:37 +0000
Subject: Re: [PATCH v3] arm,smmu: match start level of page table walk with
 P2M
To: Julien Grall <julien@xen.org>, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com, will@kernel.org
Cc: diana.craciun@nxp.com, anda-alexandra.dorneanu@nxp.com
References: <20201002103344.13015-1-laurentiu.tudor@nxp.com>
 <5e64ee7a-436f-03ba-9516-f4d5639b93ba@xen.org>
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <7aa85c5d-2853-deda-3929-cf6e65ea4d1b@nxp.com>
Date: Fri, 2 Oct 2020 19:38:33 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <5e64ee7a-436f-03ba-9516-f4d5639b93ba@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.106] (86.123.62.1) by AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend Transport; Fri, 2 Oct 2020 16:38:35 +0000
X-Originating-IP: [86.123.62.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c87482d6-c5a7-4a0a-4e00-08d866f19c44
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3422:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3422D5287939999D388FF318EC310@VI1PR0402MB3422.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NuMq/uAe2kN2INZvykWPpVUQUsY1C0VRyr3b4BGMkajVR9umuc3RXp9/WhM1BOt7Ac8hYsU4chAOKfbSQwwMOwmqiNGIEppiKJrLV6cWwdEUJVhlaDklUKrCm9Vgw8dwAqR0P9PLijh6TIpRdYM8qtO1Occ16uE5PCBqdeylu67vAnRs5JCVrP1ECi/L+Fkb5A+4wPu3WZEdzMqYHwxCFr58gIh3aytzK3De9O+FV6MZ29JGbGyKaTjWIfa7uPvbSSgBM7xqrWhk4Zup2mf0V6VYcio/zRqae7E8DMyuinGWq/ayVPtmJwSTFfUoYLbMRWUyxQBjydFIZPq1zyYSMMw2fpBhZmFxZLT2sGhY06d+0N/Oe7jWyjdcTS3g6ReTH3owLw/1KZ3oRbsheYlH48NV3CRfHLx5gAO/CI/4CrBIQdk39lsJ2fK0jqytYD08
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3405.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(8676002)(53546011)(86362001)(4744005)(26005)(66476007)(4326008)(478600001)(316002)(16576012)(31686004)(66556008)(8936002)(6486002)(83380400001)(31696002)(5660300002)(44832011)(52116002)(36756003)(956004)(186003)(2906002)(66946007)(16526019)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	hSBXJMaHvNelOLgxUzVP/7dPbilCYfjauzXReE/bwyOCexFQfMKQ1xXCoQaVGgxXZxUBHF30WqRJ2Bu3mHfkJjlqobmCDnM5g//3nxMUZyhba+f0j3vh9Li3D4dzikkx0Syk8xQC2+9EiGF/Vjm/qfGkKn+N2JPIl8pcOBPCSA/UcF4zUjyEbCwpK+xRbNVZlq1Qnn0wc9+liErmj3CRyGLXLML/qL1e/UA01PN6gTWMlFfE4odf2vxZTSYPGoDPZcCQFQWbDFssd2oMkG0fOJTg+IWhEckhYhNX9bnimyUZ1Z+D/AqMG6y7mP9Tlpb3VCmJLPXU//nTVCYD40w6tNHToC93TPwTlYYHJHMj1Y5QDl2qtyqZN6cmEodLAget9cGJ9lWa1rkfQhPIs7PZeCtBlfmO3Siehx1DFLg0RlYPGdudXlg4NbjKvAgBbyGcnF2j0g3prljMYRllGN53Sw7yNBeQ+HgCbZYsHb4FSOXbz+2nxGOBcbpsBrCm9+GnfPMeA4eNVI+WTyOOLKmF1hAANO+IDGLcuP810nRjAX7/LJdlgWvqPxH3dfOyd9cUvhNsd1D4abcsYgS3IhHvnY9aS/zXieNZN56NBgzzt4zA1KKzE+7tWT0ZcwJB1TDjKtOEZQybqPi7iEWHI0cHQQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c87482d6-c5a7-4a0a-4e00-08d866f19c44
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 16:38:37.0007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Em9+gfekvWrqnBR4act4vZhV1ug9BVSB1h9A5yKHI9xHLr1Soph/YoFzZpmgXDohyyZsEMDN1MM91Xeztem6xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3422



On 10/2/2020 7:36 PM, Julien Grall wrote:
> Hi,
> 
> On 02/10/2020 11:33, laurentiu.tudor@nxp.com wrote:
>> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
>>
>> Don't hardcode the lookup start level of the page table walk to 1
>> and instead match the one used in P2M. This should fix scenarios
>> involving SMMU where the start level is different than 1.
>> In order for the SMMU driver to also compile on arm32 move the
>> P2M_ROOT_LEVEL in the p2m header file (while at it, for
>> consistency also P2M_ROOT_ORDER) and use the macro in the smmu
>> driver.
>>
>> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 

Thanks, Julien!

--
Best Regards, Laurentiu

