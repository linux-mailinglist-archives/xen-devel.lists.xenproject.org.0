Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A872A5ACF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 00:56:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18752.43754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ka69Z-0001Qm-Rk; Tue, 03 Nov 2020 23:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18752.43754; Tue, 03 Nov 2020 23:55:53 +0000
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
	id 1ka69Z-0001QN-Oq; Tue, 03 Nov 2020 23:55:53 +0000
Received: by outflank-mailman (input) for mailman id 18752;
 Tue, 03 Nov 2020 23:55:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6cW=EJ=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1ka69X-0001QH-Iq
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 23:55:51 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (unknown
 [40.107.10.97]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1f7b570-775a-4d41-8338-aac8e921dc2b;
 Tue, 03 Nov 2020 23:55:47 +0000 (UTC)
Received: from LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:83::20)
 by LNXP265MB1562.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 3 Nov
 2020 23:55:45 +0000
Received: from LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM
 ([fe80::7956:7dd:b840:ac1b]) by LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM
 ([fe80::7956:7dd:b840:ac1b%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 23:55:44 +0000
Received: from broadband.bt.com (2a00:23c6:751d:7701:1f1a:39af:4235:7681) by
 LO2P265CA0468.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 23:55:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=T6cW=EJ=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
	id 1ka69X-0001QH-Iq
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 23:55:51 +0000
X-Inumbo-ID: a1f7b570-775a-4d41-8338-aac8e921dc2b
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (unknown [40.107.10.97])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a1f7b570-775a-4d41-8338-aac8e921dc2b;
	Tue, 03 Nov 2020 23:55:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acLiPmubFY7zTLVVRmqU8MbAafXqy45Xb+POs5cdb5+trxGF+crqKiuT/Infpum1xHhm5xlNwPkaxn7mcYSG1xHYgUZdb5D2CGlXthqyfaQS0zuGuGggmPUjmlAxtNEfx5AKcbpFtp8zupOmAMteWyyBLyZH+tXTyNQg0XI5Y50RZRtyPjPd+2qwr4iCBBrOL3VaALpfeihzr1G6tiwzWSzFZA4AIUdhgEI/EOnFtXW/vy5WNt3l41os1S2aKc3qz+QMFmiGcISMz1QPJ2E+6uvDZAG6Rpcf4hQ2EiEDFKDdznvRyZpcRzaG4CAhlyEXHpHJBpmtB1SnJ4qL1SqUOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJHnJ/3supNc9icQhZUh9ry+zzXOutWcNz2oojKU6mM=;
 b=UFVo/yyECTYQCSZy+oFSjk7gbfZnsq0AtxsRpvJqCCvIWcmmYOdTRxJ5E4qPTgB6sv4VKXLgpN9TfgDsSN6uA20TVZQJdpwUzpwCQTOPNl2WrVGhbng2JRTzHZNBCMzlB5IyBQaJcCFK/M+7VpiPB75oHV7rorN4pAMUI6aKB4uxr1/SMJqmVqaTJdgDYTTa5WfXe35eU8UwTTxVAxfoO75rlYPU4f+abimZV/SkghMoNz2MuLz2/ew8CPMWuXiW6mYBUoP/jl4QPmU4KrllFel1hu4kc677HBMaoFpAPKWx0UTSwU4VCihPkG3FCGyAwid3aIXvMSvmmgH/11H8XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJHnJ/3supNc9icQhZUh9ry+zzXOutWcNz2oojKU6mM=;
 b=CPIlJopdcOrXzdf8qGzK2rdbeSwyOXVbDmjWSl2FFJqEhBc+fJ48maY1+l+BlDhlthp+6Nfc6dGXuCy1YXT1XIKZU5fMoCjAViJL1dWul343NWDOqeErKbKTEfn2bo5nd6Q4oympC3XC4RKBQQTFlaBv7XXIyXtNArC7oajB6Xc=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=durham.ac.uk;
Received: from LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:83::20)
 by LNXP265MB1562.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 3 Nov
 2020 23:55:45 +0000
Received: from LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM
 ([fe80::7956:7dd:b840:ac1b]) by LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM
 ([fe80::7956:7dd:b840:ac1b%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 23:55:44 +0000
Date: Tue, 3 Nov 2020 23:55:41 +0000 (GMT)
From: Michael Young <m.a.young@durham.ac.uk>
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xen 4.13.2 released
In-Reply-To: <ed219f15-479b-5d06-c835-eb4f4c64db3a@suse.com>
Message-ID: <a391cfd1-be4a-add6-cd36-8bb254f9b43f@austen3.home>
References: <ed219f15-479b-5d06-c835-eb4f4c64db3a@suse.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Originating-IP: [2a00:23c6:751d:7701:1f1a:39af:4235:7681]
X-ClientProxiedBy: LO2P265CA0468.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::24) To LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:83::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from broadband.bt.com (2a00:23c6:751d:7701:1f1a:39af:4235:7681) by LO2P265CA0468.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 23:55:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 129c6593-d51d-45fe-a314-08d88053fa5e
X-MS-TrafficTypeDiagnostic: LNXP265MB1562:
X-Microsoft-Antispam-PRVS:
	<LNXP265MB15622DBFC3356A8696D235CB87110@LNXP265MB1562.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G2eoMTLJlR18mF+0ZEidJAL5thP5cm5n8Z+rPZ8y5Ch9yLXXOch4yfAPJYlUd5hRgiVRoL/7/dDOnm0KplJiXxw0xSenJ0owKs1ZJKXmCt8QuAf7uSHKF772SA+XRwcCNkKfoLC2PYXxbb5Vz31LVZHUG7W2hTt9Eog/8JOgy5rpJ9JWFpBYDqvc1xNXZ1B6s2gt5x8Au/3HnrpMH/yWVYT+RAN2+YUj3p/yk0816AwE4SwcMVPfC0OUvkfdm3xW6y6m5DlNXfsaDUXSzecpqxz76BSBKUd7bVmI7gpT5tfOSZT/I8MqSshz2hxbEU9PPAVHx7iSkDmLssnp8XFn6RBeCDyOazGKyYUueH2kRPnkqp6OIBsHroIOQlWIomuxbpgsJLrgx6rNh0uAE9HBSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(186003)(8936002)(6506007)(16526019)(52116002)(6666004)(2906002)(36756003)(31686004)(4744005)(6916009)(5660300002)(66476007)(83380400001)(31696002)(86362001)(966005)(6512007)(9686003)(66556008)(8676002)(478600001)(786003)(316002)(6486002)(7116003)(66946007)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData:
	kHjSdiGzHO+zKsgPm1HWhs5itvde9W+W0Wv9WntQGoIiVOMjPXP67p4Q8BLYMWm+p9SAppM2vliPlpfnYyeCd6NFVSwT7s5RK0poef+4GcG+dv9fedU9gvXd9OZajMQnSIfaU2HqENwE5/sSdMNPg0mByjvP+hwmkhBwyT0ckCjobkwFgrTtw6AJZspMkkS54TGHnjKL1hPFobuhwsTGHLkwHen+qUMJnYXRXcgfsPJ4wh8LXOc31rag8A6U5nXz69LSs+COIo3l/cFlfgSoPAuDAInH8aWJAyYudJN8bUAH2bco9qaeayjqnmP5KKVCNVDHsIT1ZYNnh5lzRZugg6O9kz4TmyJYHbAs9gwQnjtkQH3nlyvssZ/aGgGrE5QPq2J8ZYPD6w9Se0BGIYOMpZMgEFt5wh42Juzzz5UML6GsCa0/2aWc2pfMZhfN9DRXTEtUyC2E2nbojGXkZRMWsiWErw1I4M4JhNsZd+iqwA3GsESudKTCn3ibhto2i4hlBXUERfBP/BgrJv6zLVCgE5RE45rGANyCb3/hGk55F6rH/rPn43CDJ0CV2nF4Phbx1J1uaU0e11IvU9HiMwcMw6AdYyVcrbn8iyT7i7Aa/5Pm3L8r7ECWnlRDza9Zv8wWP0YcDbeTCFvGgamheHANkfJvWh2AAy3Ie0+s4rhdhr9FUv2k/HHa+94FPgXynmrIKVIqiqvPNQSs7a6LMDN4tQ==
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 129c6593-d51d-45fe-a314-08d88053fa5e
X-MS-Exchange-CrossTenant-AuthSource: LNXP265MB0924.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 23:55:44.8589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01gX0f4TP6wid9ajbk2dXH6wlHdSBT+CyBWfYZMxCWq0ddeWZaWsgJ13psl+nkmAJCC+LgYtY3fLcyrQGU4UHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB1562

On Tue, 3 Nov 2020, Jan Beulich wrote:

> All,
>
> I am pleased to announce the release of Xen 4.13.2. This is available
> immediately from its git repository
> http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.13
> (tag RELEASE-4.13.2) or from the XenProject download page
> https://xenproject.org/downloads/xen-project-archives/xen-project-4-13-series/xen-project-4-13-2/
> (where a list of changes can also be found).

Is the entry for XSA-335 correct on the download page? That was a qemu 
patch but I don't think it was included in 4.13.2.

 	Michael Young

