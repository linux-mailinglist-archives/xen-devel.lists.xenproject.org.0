Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C712B7007
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 21:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29264.58584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf7Zc-0004Yy-GD; Tue, 17 Nov 2020 20:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29264.58584; Tue, 17 Nov 2020 20:27:32 +0000
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
	id 1kf7Zc-0004YZ-Ck; Tue, 17 Nov 2020 20:27:32 +0000
Received: by outflank-mailman (input) for mailman id 29264;
 Tue, 17 Nov 2020 20:27:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4XLr=EX=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1kf7Za-0004YU-Fc
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 20:27:30 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (unknown
 [40.107.10.108]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4229209f-766f-4036-b529-eebea0937aac;
 Tue, 17 Nov 2020 20:27:28 +0000 (UTC)
Received: from LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:83::20)
 by LNXP265MB0378.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 20:27:26 +0000
Received: from LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM
 ([fe80::7956:7dd:b840:ac1b]) by LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM
 ([fe80::7956:7dd:b840:ac1b%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 20:27:26 +0000
Received: from broadband.bt.com (2a00:23c6:751d:7701:1f1a:39af:4235:7681) by
 LO2P265CA0414.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 20:27:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4XLr=EX=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
	id 1kf7Za-0004YU-Fc
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 20:27:30 +0000
X-Inumbo-ID: 4229209f-766f-4036-b529-eebea0937aac
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (unknown [40.107.10.108])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4229209f-766f-4036-b529-eebea0937aac;
	Tue, 17 Nov 2020 20:27:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3V+ZZLr0AAq5aq8mIGk7XD5tT7Gvy3hsVTruEYk0pUl4Af7lQUU9buIhyc7/1jG8/EETwAqmNUjOWDFZ69Cm+u1EMjGCU+EDUNo7RCldEO1SIbxIjLdJ4Zw7RofBIH5sO9d9i0FcsvYetqzIFwb/seT+Y9NsbH0rZSZ48BSoducWe6f6rumMzyMGOKjR7hngweHXdQ/4+HKTEpPjeEu0vg0/LQIc8yQRZMDzRGbuoDMM6SXxMGK6t3SsAkJnUwx4e0ECz2JF7jfMKnj+NoKz30IhqnDTowlLgrmc3bO+AutyV9sc+MLy1wYi6NSym7/UWtc+Kt3gXbVnMefn8yK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PofDEF0cCDUe0oMaBguZb5Xe0KhAUnNy30dm8aDG9w=;
 b=fRe453KWmQ1Cpkqgs+1wYQjHxOnYdja4obO3t9wl0byL6uzBvlbuT/YfiVtD6NKsVfYi2kDRWA+H0ppTjLtUPZoArUz2nsq29afcFXTxIcFsj9AqVpTtCDTY69APJXUTBS2wB2tH8W1kFOJIii6/T2n8+CH3jLpoM25ajrMTPo+YTSJnQWLTbhZg27RZ0GK6Ll86kfJ/Qbc/OtC+W4lowHSJY+ASl7ITXEIqVvsLX4emSR1Uyj1/Jv6tt8QsPUzf0u+CP6JnHQQb86pnfltOY+YMGxqR2UBxofw6OwOw7SJpda59mCYqWxUxU+Uk52JvbvDbYP7kNCkITx6m/v2bvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PofDEF0cCDUe0oMaBguZb5Xe0KhAUnNy30dm8aDG9w=;
 b=I0d7PpoO8FXZXE8mAPZac09PqGbis0KsCvDdQTiGNDmYvAHMbsf7Jw8395ieXN4a8OAjmEhopgWtwR+ptq8YtqenbcVZ3+fCNBEfOQ2n1/0QJTgj0v7ANhAEQREaqld2QRnGKU8ZmFCSp1wJwBIBPM/8osDmltYGY4MrcZMhi2E=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=durham.ac.uk;
Received: from LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:83::20)
 by LNXP265MB0378.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 20:27:26 +0000
Received: from LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM
 ([fe80::7956:7dd:b840:ac1b]) by LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM
 ([fe80::7956:7dd:b840:ac1b%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 20:27:26 +0000
Date: Tue, 17 Nov 2020 20:27:24 +0000 (GMT)
From: Michael Young <m.a.young@durham.ac.uk>
To: xen-devel@lists.xenproject.org
Subject: zstd compressed kernels
Message-ID: <1abcd9d-428f-93d-b63d-996ef4592723@austen3.home>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Originating-IP: [2a00:23c6:751d:7701:1f1a:39af:4235:7681]
X-ClientProxiedBy: LO2P265CA0414.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::18) To LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:83::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from broadband.bt.com (2a00:23c6:751d:7701:1f1a:39af:4235:7681) by LO2P265CA0414.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a0::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 20:27:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22640c89-696b-4e88-f258-08d88b3732d2
X-MS-TrafficTypeDiagnostic: LNXP265MB0378:
X-Microsoft-Antispam-PRVS:
	<LNXP265MB03789003CDF442DB283216D187E20@LNXP265MB0378.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zMzPnfxjaoELZmcrzZ8t+U0ZISLB6VyMci+ba9VIALhcmuOady7yvIJNTsEglyvdMyj4ITcYFm5/x7Nj2094b4mytH0RMhWQSoJEdFJjEFMXl0++Ir7Ri4kceVrcdjlci1GM/vUU3fpQeX/eTCZuJ4pC0J/JPgU9DV9+ak8kqf85dtS2+6/ncrZRk8jVxIPtZ3ue+hx3i7NBW8ukH8AtY2bRDdCUDQFdpcuIs6fybWNT9ivk/j38LJF3JOVH/PdRpJYl8VEtKuQjkSdPEiQ+UCyX6pl+oAryjMJ+6CJEjm6lx8ILqTymf02ht42YggS8uIVic1bncuVHYQQpISRanMJFUDcCmOWuud+8KeS1rgkMral4P3QBxdjKH7DTCm2b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(7116003)(498600001)(558084003)(8676002)(8936002)(16526019)(186003)(6506007)(6512007)(6916009)(9686003)(2906002)(5660300002)(66556008)(52116002)(66476007)(66946007)(6486002)(36756003)(86362001)(3480700007)(133083001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData:
	4Ua41qPhLr0Cl88Z2VEa8TPHUUy90ycWtDB8sq0CCBqJvF6cHYkPy0Los2Rd5BRww/e0AJjBJX+0ELHf9OLlu3RJFnJZCgU77KKx00AXldiW/N7f+jYRKYmsTpAYiMgIzt6ny3xWbzGhJ6ajbdxFx68/9ueMW76ye2uDjqXj89bwHcArAAOh8FZsRRiYObGU+j4jiJKCHK5vVZrknbK4mUxYygu8jTJtsxnqfV5cakv9QqnKXVC9qaA6qtTC4VRhq5YHOy10Ide/LndtjHENyhl8hPWQ9lzdNjN+PUYcpZnOG74lGJGm9m+nnrNxCvp83cwLG8ZN0H38FSiThl2XakVwYqNpe+q7bJ9ugddI/AYnLBsW4B9I9yZP/atdZoJKVFXnuaE8BztxF4+Rl3Z++sdOPfmlSCu/CXOtaGLD4kkCJX/3IswFQ8miKlvTunaFhQn86huRS+6Wo4yf9BFuvuNABoeS1exsTsJl3N/grFR7T8rCZwG6jS6gFcrvFftqajtxnZdJH8ATMkfEnu28Wn4yAPswdjcyeKH9BNlYFaqE0oT4SlARFRgzqm6yyCtuxmsPZSKXInzE5qsZ4nRpeyVaGxsokwAZIdnglooO7cY8FAbu2phapExLr5EOtl1oVIPnUnu8ZGEqDn7OcUWvoWIAxNfD86EVw9p2HNjXfUw8z22gztIyqLz3tzn68ULNWbBPi5q4iXDnyk/xxZp9yg==
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 22640c89-696b-4e88-f258-08d88b3732d2
X-MS-Exchange-CrossTenant-AuthSource: LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 20:27:26.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNet9EPpO+p/lo1pGfol8/Qzw7JmbVRuBH8kFYqOzv2IcmAg2puoUzMA+XyzLKOB8Rlr2BviK0edcez9sMKx+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB0378

Is anyone else looking at vmlinuz files which use zstd compression? Fedora 
has started doing so with its 5.9 kernels.

 	Michael Young

