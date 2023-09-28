Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F87B1A0F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 13:08:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609501.948602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlosJ-00075I-NI; Thu, 28 Sep 2023 11:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609501.948602; Thu, 28 Sep 2023 11:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlosJ-00072N-K8; Thu, 28 Sep 2023 11:08:07 +0000
Received: by outflank-mailman (input) for mailman id 609501;
 Thu, 28 Sep 2023 11:08:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJIK=FM=citrix.com=prvs=6283bbd10=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlosH-00070k-KK
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 11:08:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aa5b833-5def-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 13:08:04 +0200 (CEST)
Received: from mail-bn1nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2023 07:08:00 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6367.namprd03.prod.outlook.com (2603:10b6:510:a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 28 Sep
 2023 11:07:58 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Thu, 28 Sep 2023
 11:07:58 +0000
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
X-Inumbo-ID: 4aa5b833-5def-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695899284;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1x78ZHXLdUf9UVvhR9CzPKnsXCvoHGNsIZWegIB4w6o=;
  b=GdDWiIlSpvkuwIkLXkTV37mVs5DYJ8jStIRIssN1Y3Dr239x/op8yre7
   qwrA09aisa7CMqbqMyte9h4Pzv1s5P3+vAv11nPfH9me2QyoDNDpNG9PJ
   XkkEd1gtbfq6ivQy4DEyxtvoXShUerLTd9NaTef8FUSHb0hWsAint17h5
   A=;
X-CSE-ConnectionGUID: qP5D8ReGQjiEoBc3JXl3Lw==
X-CSE-MsgGUID: PJGEJ01sRdWMhcvh9JGjzw==
X-IronPort-RemoteIP: 104.47.51.40
X-IronPort-MID: 124060896
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:8qa3LavnfxX5vYemm9VY/n+qtOfnVKBfMUV32f8akzHdYApBsoF/q
 tZmKTyGO63bM2L9KtAgbI2+9kkD65LXzN82TlZt/i9jEnxH+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5A6ExyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwMQhQQkC5is2PwrOWTcNn3eYTKJLPI9ZK0p1g5Wmx4fcOZ7nmG/+Pz/kBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osif6xaLI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqhBNpMTO3pqJaGhnWr5EM+KkVPTmG3nty5gVC+CvBwK
 V4Lr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLI6gOQHUAYTTpMbtM3uctwTjsvv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty9v+pIA+iDrfQ9AlF7S65vXuAi35y
 T2OqCk4hp0QgNQN2qH9+krI6xqzorDZQwhz4R/YNkqF4wVjdciaboqnwVHB6LBLK4Pxc7Wal
 H0Nmszb5uZXC5iIzHaJWL9VQOnv4OuZOjrBh1IpB4Mm6zmm53+ke8ZX/S16I0BqdM0DfFcFf
 XPuhO+Y37cLVFPCUEO9S9vZ5xgCpUQ4KenYaw==
IronPort-HdrOrdr: A9a23:nbJlB6wq2y9rQO3SOveCKrPwCb1zdoMgy1knxilNoH1uEvBw8v
 rEoB1173HJYVoqKRQdcLO7V5VoI0m8yXcd2+B4V9rPYOCBghrQEGgL1/qE/9TOIVydygc379
 YFT0ERMqyLMXFKyer8/QmkA5IB7bC8gd2Vbay39QYKcegQUdAC0+6hMHfiLqShfng8OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3A/BrBL2sCrnWxrbuxKhWOb/he6Is8SiDxnE3dDHa?=
 =?us-ascii?q?6CEtuYrbOa2+Uo4d7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AqZLozg9LzTZYESR2RTpwApGQf/9KzImMUBkWq5k?=
 =?us-ascii?q?5nsmPKywhGRifniviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,183,1694750400"; 
   d="scan'208";a="124060896"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbiHZrvQC6Fo7lOgCBEKzMssG5TMNNa1Mrk4yOicTDtzeTOADnwPdYXX1W0okrFs4AddAZsXtRajFSapEyVn8eAkAUt1J+sfXh04G8FxmlQQ3s9+EywxgCknVd2g8fniECfEXUwkNzLm5WhjNfjXGmuWtnPsnmEWI4CLrZNgU04HUE6XJnJZFuwhXbgZ9P65LSi69B2SOymhxXcDGnn2VugcDehJhmj16u6vgsqNfqYFhvBEeZi5mzjA7nSNVKhxya0EBPbkPRhvPmdtrZwuGs8W5n4o2PR6O51ii12I6X/oCl1zdhMWmalvwspWBj8xaXFqIdoXqKahFuWCArjo7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+k8Gqw7WTNJMkFZiBUjDxI20/SI9o9Eq5dWC5QRyy0g=;
 b=YFjKEUAnH8RBdWiS8Pp9nsUYB33y7n+0BzIEgsmQSA4fEEhIkQmklTyXxDQ4tNbZotELMrvH4Nr+8eebOlgd8FQK4hWRqmN+9b1RwxD2cjqjk31XoWoJJeKbzLotZBpbrEbR7dw6uYI4k4rx5gP9YhEh5jpeSTBjmDP4xb3kS9bYPT1jLgfHB1c1A1Lh6JIH1+5QsGOQ/qw4RroL/ZNA3b624osuyx2ELbvJQOzvTPv/Sy9pVVcitVA5BIod5KHrT7WPp66c1SlLwo7zs1BRZNF7ibUgM/vxRMEByDsbW4K+Dod9NIqh7cWFjRm32jXuLHSSJ3lyKSwjd7d/+I9v/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+k8Gqw7WTNJMkFZiBUjDxI20/SI9o9Eq5dWC5QRyy0g=;
 b=tZJpX9lpNZSQMgEtKKlnzmzB30hH9YbelRZJu2Fc/hX03mEbYpCp+tneY4tGx2Sic4+W6L1iyhR/+/TKKbyEsZt0g6os3jjm2+XwkvBBRakUCsVzxCZZMO3ogoAGaSIzXjTJf8k7XdIBIru2ER4Vp88lTNhrrhIOlcuZzXRg9Zo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Sep 2023 13:07:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 5/9] x86/mem-sharing: copy GADDR based shared guest
 areas
Message-ID: <ZRVeiAFlyf1LJ2qR@MacBookPdeRoger>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
 <6047c192-0f37-e4ff-5980-fd137b3f1869@suse.com>
 <ZRVMhdyI8s4chr7b@MacBookPdeRoger>
 <d285a456-307a-0a36-0910-cb80f419627d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d285a456-307a-0a36-0910-cb80f419627d@suse.com>
X-ClientProxiedBy: LO4P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1dc528-ecce-4c1a-f6b3-08dbc0132c27
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iCNzq8K+8nltELO3oOyn4uozvz4A2JwNPNoi0gzZtLBHtwVKpI9d9MT68KxRh/Y6DKpYOFvtwDKUzcjMXTTV+nYPaBHVYomyiQhFu6B6r2BiGEMbNg8xn7JrxHQpKUIdO/PU3OtbQ5ZRoUgDCPRW62OjJwNdNlE4hIyiDlPR6xBVZqN1I67dMfYmbwWJA6A6uXhhqbrC9Nu7wSnL42mVy1BTz+po8EHLsEwKKv7LSJasZ/G7O9EM1SvbpKIJ7hiTV3J9Xd/RAdLIQj8/uE4rDQiChwk9cAyR1HwDdmyc147XpKeOSWJW7EtZu0dRz4h84AUPjEOp32NEo9TvLRaSZCEm23nV4LdL2UG3/29LVNIsdDhC1SlduLKp+JwW7izh/uJlnlcighEJ5xabVtjmlx7rwfLaxcl657IctHXoKvdbFkgz89faRCLeZH/g+gcounnC18JLL444mIYEcKhw1WRFJSkJVE3dGoxpE7wku9T07awkohxemXIGRpzKdFwpi4SLVxu+scmL5eV3gjfm3ocN+Q3J00hGPWO+rnx4XwCurtddtVpViX3UjqkBLxoX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(396003)(376002)(136003)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6916009)(4326008)(41300700001)(85182001)(38100700002)(6486002)(86362001)(6506007)(53546011)(83380400001)(8936002)(316002)(66476007)(66556008)(8676002)(5660300002)(54906003)(66946007)(33716001)(26005)(478600001)(9686003)(66899024)(6512007)(6666004)(82960400001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHJ3ZWZvSXVOSmJpT25mbTZ1cDdlbWR4SU15b3E3bmlVdHBld3pmOVJNMnJQ?=
 =?utf-8?B?VjlzcXpQUy9jdU9BdjdqcVA4b3g3QUlFU1huVEtUWU5xRXMxaCtzK1N5QU1l?=
 =?utf-8?B?K0g2UGJTdTYzQmR1aTJIa2VvUWJmd3I0Rzd2TDFCRnVUZjgwSllkSzZ6NVRy?=
 =?utf-8?B?aUxpbDRTd0Z4clFtMGRscEFyV1ZKaTZaWUVNc1VaSGpuM1U5VGsvUnFmOE9h?=
 =?utf-8?B?TitvajhIUHREZ2c4MGNRK3NEWjJTZE5uclpMa3J5QXhnb1VUd0NJTkZjSU00?=
 =?utf-8?B?VlI3TmY1WlRJYllWY3Rud1JlV20yV1d3YXM3TXZFWUtqSTJkMSsyRFZQdjM1?=
 =?utf-8?B?dzM1K2RXWXlteXBoS00xMUpnS0ZLSTlmVDRWUkZIWUJRQmRCVDBWT21NbXdI?=
 =?utf-8?B?SmFwUzEwbmhNM2ZZdjN1S1RIY1cwTXlxazNmaGRVQ1hFYXFvN1FUWFREWWVq?=
 =?utf-8?B?alQwai9JSFJkVnBOR05lUUYwSm82a0dQUHdINkQrOWtWT0FRdUY0TUR1MWpk?=
 =?utf-8?B?WkE0ZWdSNXBJbEp5a0Q2ODNMZDZvU2t2RHZJR1d5OTFlT1RieEJSU2dreGZl?=
 =?utf-8?B?ZU5Sb01qSkJDRlpqazhTT3E0ckNxRWhYa3JUMWwvd1NodUN6TmZ5V1NnSXds?=
 =?utf-8?B?dEduQkl0dFN4SFN0NUE3VmVvMDBOTWRMOS93d0J1UzJ2STBQTlpzMExyMlhy?=
 =?utf-8?B?YXp3YjFkd1k4MG9NNEt3MHpNQUN5ckZzUnlvVm9KNjk1OUtXc1phNzdiaWxL?=
 =?utf-8?B?U2k3Uk1ETXJYcGdnZU54bHg3ejVZeURwWUxiSUY5bDFPVE5GSWdoZnZKZWQy?=
 =?utf-8?B?VXJ0Mi9xZmFQbndicXdJZUV5SXREbmhkVHgyZ2pzemhoYWtHODJGaGZYTjNJ?=
 =?utf-8?B?bzFsWkIwNS9rSFRMU2tvSFd4QWJ2K2lPeDFaSGFuUmE5TmFBMTBsVURnbXNF?=
 =?utf-8?B?TG5PYzViZ1EyK3FqRlIvWXg1THdod1YrZ3BUZDgrbGVnOWRVNFFJSmUvbFdH?=
 =?utf-8?B?QVRJU1NiU3dOL3QyMis2dnFQVHhLV2FZbkdLMmt5WnRiT2pBQ3ViRC9uaGlG?=
 =?utf-8?B?UjJpSk1PNXR1UHdyNHE5cW9kdHVtVTBnb0RyTzhjekErWHhkSEo5MXd3eVVF?=
 =?utf-8?B?MTJqNGZmWERPWk9LRVNnU1haVjk1d0hwaHF6UHB3UUpyM3RsYUJ4TlRkbC82?=
 =?utf-8?B?VjVIY2wwNFJLTlpCV0VUaGZRd0FCdFdCeUl1azRtRDh1bDJuZTAxcDhzaFhS?=
 =?utf-8?B?K0FrSndBQ1NyZkJLMHFrLzJqVHczQUNrUGxsbExWYXpVY3VpSi8rUVlsZUdH?=
 =?utf-8?B?M1FRWHFCL2NqZmVWVTVZY015N1FYZVR3ZEt2RSt0d01vTXFEcXlTN1FxTnFn?=
 =?utf-8?B?bFJpakJNZWlabEZvQUlOb0M0QWpLUTgySzl0ci9aNThUb3M1N3U3b3N6Sjkr?=
 =?utf-8?B?Vy9DNG5IRGdCck5DdU5tVHV6RkFkTjgwcTVjMmYvUE55M2srYnJmVkxsZkU2?=
 =?utf-8?B?UFNTRTJDK1VLb2ZDVjJMZWduV0xlNEI4WVJZMzcycEdjaUxWZVhKampQZmhY?=
 =?utf-8?B?emgvM2FtV1hiZEZkMVVaMENnSkkxa05EcXpjdmZGSzBVK29UYS9kSlBqSHU2?=
 =?utf-8?B?b3RIRmJEa0ZXS2YrcStPdTc2bVZUMUNmczN1Zi9QUE9WSXFtSFRuQVBhUHJv?=
 =?utf-8?B?Q3pvUWZ1REV5aGVrR0htUCtscnZyRzhUL3FrODk2SlE1U3Jzb2hMNkV4ckhG?=
 =?utf-8?B?bU5ISWNPREpBSHA0czdnRE0zeE56YWtaT25mQjVaVzlJRGlYVEo3MGZiYXBn?=
 =?utf-8?B?bGU3aXJJdlYwSlljZTcyZHBLTGRHek9nQ2U5M3V6VmIxM2xMQ0xHYnBoc2hH?=
 =?utf-8?B?V3Q0Nk83aytZeUIvQUpFWXRUdzNjNWh1RXlNS2VRcWs1RHp0MngzaythRUhK?=
 =?utf-8?B?bjJFNitUN3hMdWFmeTJIRUU5VUVFcEIvUFNoOVFBZUpJVHlLTWgya0RBeXh4?=
 =?utf-8?B?WnJyZ09iVTB1cEszdUFRaWExT2FKLzk5Wnp0NWNiZW55MnI2TFRCNGFIRGx6?=
 =?utf-8?B?dHlwWUVzTWVqZnh6bEUzVzdIYVpPUXNNekZ2czlHZk8zWTlIU3hERlJ1NWRZ?=
 =?utf-8?B?Y0ZvRGUzUnhVcTdyRjA5S21Yb3F4eFVSZm4xdU04N3lPR1JWZ25kZUdOa2hU?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	h+tUZ3hndgLl1axsbviAoy6PVM/JnQcm9c8G3RYIDC/a3HrNO8pokH+AGVBS424oowtvSlhFZiUmRm+fodrxyf/3ZNnITnw7jDX09vizhVOyxb1KTKyciEk35lFKAvRHcimE9zaLcEYssjaz96KBhxmoTOO3xVjQjYXZdiL3OF0vbwMDa+hGQQ0uxwqOf1a1yAD5rZ/8wcAJchNCnbYWQ4/JizDl5cXCdGJUA+hJtfbDtXmX9XBpBEnm3+He9uvyQ8wWoXAlAQ+uVSTahkF9Rx1QiApT8085P4RLpfVnLSBuxUbZiaK9kmPPteqX2DiAv8x7ePiF+U8WGcW4pVYwjtRTddVJ7uTZmJCR/zxBjRjvnQEhrmszV5TKnlssFBgjLYL+AtJZWza/oWvwa1KCOlrYAluIz/tH/duAMNgCIUzrmaNAV196jjDiJ8eGP/mcS8IWwAh48Y/qEuS1nf4OXSG1tPap1/2svLZ5bjtbsh5t7eYDSQk5NxseOc8oLDfRtOHBxNDhQ9gg0a8pCxjfwvjtwghAGupSe7oXLUC4G2k3Ylc95pV2tTm3/1b63J2VJZPv9QM9HiblxNSjEFA13c/adPzgY21/Gwvi4kg0lN5PXwBTRTn3NKMND+ytM+mIyIQlKzBqiVw1y5jcj9D66dWw9nWyc0sfxn9Z4S/1ffBDnljZrXz2rWjgg8iK3L27Xe/LcEEPl1O3zvFZjRUjYqBpV9UO5/IGRvui/beIBkVuEyuztC3Hv6qum/PeBzAVWFDlvIj1nwxOMNUlFeYXQgp9YYQ2qSTS2nrHCzXLvafHWKjpxMR9F2ICIqZG/FEivttGTBukgRAr0/oQDq6SnX4i9tt5EmozpvwHoKgiu7zcpJryH6cJjIbqIc3Ah71hsklbm3lbF8fLECMqSAM4bf+s/ygJWyLKIvZJvWu8SCw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1dc528-ecce-4c1a-f6b3-08dbc0132c27
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 11:07:58.3528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pg0jdU9Rg6O5+iu6F6Ej9gXbgkKJxITv5tNNTCAwkfXaGvvdnjWLZhgIAlFzlnMtn5FUHtCmrF+X7f1YPdCl6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6367

On Thu, Sep 28, 2023 at 12:11:02PM +0200, Jan Beulich wrote:
> On 28.09.2023 11:51, Roger Pau Monné wrote:
> > On Thu, Sep 28, 2023 at 09:16:20AM +0200, Jan Beulich wrote:
> >> --- a/xen/arch/x86/mm/mem_sharing.c
> >> +++ b/xen/arch/x86/mm/mem_sharing.c
> >> @@ -1641,6 +1641,68 @@ static void copy_vcpu_nonreg_state(struc
> >>      hvm_set_nonreg_state(cd_vcpu, &nrs);
> >>  }
> >>  
> >> +static int copy_guest_area(struct guest_area *cd_area,
> >> +                           const struct guest_area *d_area,
> >> +                           struct vcpu *cd_vcpu,
> >> +                           const struct domain *d)
> >> +{
> >> +    mfn_t d_mfn, cd_mfn;
> >> +
> >> +    if ( !d_area->pg )
> >> +        return 0;
> >> +
> >> +    d_mfn = page_to_mfn(d_area->pg);
> >> +
> >> +    /* Allocate & map a page for the area if it hasn't been already. */
> >> +    if ( !cd_area->pg )
> >> +    {
> >> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
> >> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
> >> +        p2m_type_t p2mt;
> >> +        p2m_access_t p2ma;
> >> +        unsigned int offset;
> >> +        int ret;
> >> +
> >> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL, NULL);
> >> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
> >> +        {
> >> +            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain, 0);
> >> +
> >> +            if ( !pg )
> >> +                return -ENOMEM;
> >> +
> >> +            cd_mfn = page_to_mfn(pg);
> >> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
> >> +
> >> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K, p2m_ram_rw,
> >> +                                 p2m->default_access, -1);
> >> +            if ( ret )
> >> +                return ret;
> >> +        }
> > 
> > I'm still unsure why map_guest_area() shouldn't be able to deal with a
> > forked child needing the page to be mapped.  What happens when a
> > forked child executes the hypercall to map such areas against not yet
> > populated gfns?
> > 
> > Shouldn't map_guest_area() be capable of handling those calls and
> > populating on demand?
> 
> Funny you should use this wording: P2M_ALLOC will deal with populating
> PoD slots, yes, but aiui forks don't fill their p2m with all PoD slots,
> but rather leave them empty. Yet again I need to leave it to Tamas to
> confirm or prove me wrong.

If the child p2m populating is only triggered by guest accesses then a
lot of hypercalls are likely to not work correctly on childs.

> 
> >> +        else if ( p2mt != p2m_ram_rw )
> >> +            return -EBUSY;
> >> +
> >> +        /*
> >> +         * Map the area into the guest. For simplicity specify the entire range
> >> +         * up to the end of the page: All the function uses it for is to check
> >> +         * that the range doesn't cross page boundaries. Having the area mapped
> >> +         * in the original domain implies that it fits there and therefore will
> >> +         * also fit in the clone.
> >> +         */
> >> +        offset = PAGE_OFFSET(d_area->map);
> >> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
> >> +                             PAGE_SIZE - offset, cd_area, NULL);
> >> +        if ( ret )
> >> +            return ret;
> >> +    }
> >> +    else
> >> +        cd_mfn = page_to_mfn(cd_area->pg);
> >> +
> >> +    copy_domain_page(cd_mfn, d_mfn);
> > 
> > I think the page copy should be done only once, when the page is
> > populated on the child p2m.  Otherwise areas smaller than a page size
> > (like vpcu_time_info_t) that share the same page will get multiple
> > copies of the same data for no reason.
> 
> I think you're right, but this would then be another issue in the original
> code that I merely didn't spot (and it's not just "copy for no reason",
> we'd actually corrupt what was put there before). IOW the copying needs to
> move ahead of map_guest_area() (or yet more precisely after the error
> checking for p2m->set_entry()), and in the original code it would have
> needed to live ahead of map_vcpu_info(). Once again I'd like Tamas to
> confirm (or otherwise) before making that change, though.

Yes, it's already an issue in the current code.  I wonder whether
logic in the guest or Xen could malfunctions due to the fact that
map_vcpu_info() unconditionally sets evtchn_upcall_pending and injects
an event channel upcall, but the later call to copy_domain_page()
might unset evtchn_upcall_pending while the vector is already injected.

Thanks, Roger.

