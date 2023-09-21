Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B2C7A94D3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 15:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606451.944365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjJle-0002sT-GJ; Thu, 21 Sep 2023 13:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606451.944365; Thu, 21 Sep 2023 13:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjJle-0002qn-DQ; Thu, 21 Sep 2023 13:30:54 +0000
Received: by outflank-mailman (input) for mailman id 606451;
 Thu, 21 Sep 2023 13:30:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wI4U=FF=citrix.com=prvs=62171ef32=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qjJld-0002qh-MX
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 13:30:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1408faee-5883-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 15:30:51 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Sep 2023 09:30:41 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5886.namprd03.prod.outlook.com (2603:10b6:a03:2dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 13:30:37 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 13:30:37 +0000
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
X-Inumbo-ID: 1408faee-5883-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695303051;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7BULMJjIrFC5GxgQbq4vLmjVpfNUXXGy0V7zwN7iQ0w=;
  b=hIXjyN7nQ4dLU4RGOxhKaFKUW8Y9PukZhK6AoghXR/3pR57GSJxPl9Gh
   /cpkSZ2NbCUxiQpqNqpuW/Zl+gmbKlOQz8fdSP6ZeNPlkRbQjdjuvkH3E
   GDIhVDBZDjIer05WJt9m4PsNRkjxm6g5GdPGQbMhyvLpAKa5t0mXoDd1z
   4=;
X-CSE-ConnectionGUID: J6FABxZiRjOtzecEw1uWsg==
X-CSE-MsgGUID: Bp8pP8l0QPqhYIlc2cQKuw==
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 126127843
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:FC9aaatTAwaOBP+QHgHXgZzwy+fnVI1fMUV32f8akzHdYApBsoF/q
 tZmKWqDbP2IYzbwKNwkadnk9U4B6pLQy9BnSwo6+X80FHlG+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5A6EziFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCm4jRzqTteOMwpWnWORnq9t6MfbwM9ZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIq9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAtxLTuLoqqUCbFu77HRDECVGUQOCmeC5u2+6UIhUE
 m8J5X97xUQ13AnxJjXnZDWGp3qDsg8ZSsBnOeQw4wGQyYLZ+w+cQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAOMWIdbDUYCwsE59Xuqps6iB7nR9NvVqWyi7XdPjX9w
 CuDqiQksJwVgdQWzKWw/V3BgDWEq4DAS0g+4QC/Y46+xgZwZYrgYpPy71HetK5ENNzAFgnHu
 2UYkc+D6uxIFYuKiCGGXOQKGveu+uqBNzrfx1VoGvHN6giQxpJqRqgIiBkWGaujGp9slePBC
 KMLhT5s2Q==
IronPort-HdrOrdr: A9a23:IY3gT67bnPBKKeipVAPXwDjXdLJyesId70hD6qkQc3Fom62j5q
 STdZEgvyMc5wx/ZJhNo7690cq7MBbhHPxOkOos1N6ZNWGLhILPFuBfBOPZqAEIcBeOlNK1u5
 0BT0EEMqyWMbB75/yKnDVREbwbsaa6GHbDv5ah859vJzsaGp2J921Ce2Cm+tUdfng9OXI+fq
 Dsn/Zvln6bVlk8SN+0PXUBV/irnay3qHq3CSR2fyLO8WO1/EiV1II=
X-Talos-CUID: 9a23:nVByrW+xKVroNdUleLmVv2xKNOkPYk/c9nX3P121Akt2EaCqUlDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AuT34wA/k7C0xuRsLrQE9fdaQf+1ws7yWWERVqK0?=
 =?us-ascii?q?fu/ilMScqMA6+kSviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,165,1694750400"; 
   d="scan'208";a="126127843"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLe8yZfRoljAaF2b/9v+jgETrrp4tQinNvPUbWjHhkiaOygqkSF7U5Uy0Zs3DvapyKes/AGFvEFook49qXeiKLwlI6UqLiJCzeWG6l2fVBf6lMXCSKdPIwZA9q63rCL12wnvUBdA3ILS4sUD8EqVSpHIm9nit0CXVuiimaR0BJyLJ+QhqXEoq7t4vP4VXkdqcaUMj/wnlBZxbtNLfvYpB1ae3Yv7Ep4mPWsK74qgfu+PPEXVG4HTDEpdYnAK62l9rrnvixuDVClvkwDTus1Qs+WNVHoOR4PDIKWGnW75JylTocK/OkGo+oZ78VhB2rxmck0MGX746Oc5iUBaA4rR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMpSe2qRFfSi4/R7e1GMan/Lz3FzGZSzjpoVHIDIN60=;
 b=TPtyrQaklVWBXM/ZjyZIhg/na31FTVUpD1GgpQDfwn9eCDdZvAkAVNYa+15s/DaUkyoob2VAqie4EfZk485sByNLBWXpS/JcCmc8F7cWoI1CasLTu5pmpI5kSLgqQf33TFpAfiTaKx2nCnr1hAUmaxiB6LRQ4Utt7UoagQe7qiiZhFyokKpJY345L1+vGHmV4HHZnHSyYYC6zASopjJZLnn0mOoKaf8JMpqb32hHoLOx3ERYgDaYxxeMMHGszq3CC1TTTCzUs42whknXtJD9QpZhHJ+qen85XGT2Sipeo09R8IkEbSRUYiA1x1XGK00f6GfpvlXPb+kAXPe91cQg5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMpSe2qRFfSi4/R7e1GMan/Lz3FzGZSzjpoVHIDIN60=;
 b=s0H5okiqjyGd+nH9GdptmRepqjlLw0dQ2I61Wl5n2cdO5VFtZscPBoEfP6FXXNIOOHpP98rJ1Jq9uMpkSkh3c849dzHvHnKzbs29gIgMmGVzQFqpNoeoEjM795aG8tfdI3Xw12QPCQIj9IZ8hA14ei9TEFXUC7ulDQ0Go9bfjwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 21 Sep 2023 15:30:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v9 11/16] vpci/header: reset the command register when
 adding devices
Message-ID: <ZQxFd6fcReaCdRI7@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-12-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230829231912.4091958-12-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: MR2P264CA0071.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::35) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 103e9484-6f49-46f3-624b-08dbbaa6f0c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jTTFmYTjrACCsz6jsImL9tjE4cfE7te2ziEaH79B7B0OgCGEIs6JyVIwxe1mNhHEUlaygumdwC4QfYJJaw+RtxOzgEtGEsXG+8Oah///coGxkKweUKMU4psRJs1loPubX6gPOEpa06adpgSr8Y/wxpsb5ofF7NIF/2PEs7WYF2BL2dWjFCGi3mP0lI6Q/djGWB7+YR6rd03M2N0bkUcJYRWy48GqghSbXJUlujFfGm3biirPZAYnWmPMfGU6aTH+lp1vtHgza/eQaXffN4jYvubYH3w4MakJRaLc2j6WOct0oo3KUWZ3qlGhs1nQTFhX9Auj5OBYGUtrtJ8ywF/v8bSwHHRPNskNDVkzKKrnXHuE++IZkpF6QVi7Eb6GbStY/H2t/igXMdRQtk2ckb05t6n4Yp/M8rWlCXBf54ieZPdhbBwX/KB1BSoTteee7dIlEcx5RFB5MyPqENjTf6+8DwI9/PKd5VVX/C9T9uQtUizlZbmGrUGWI3WvUobfiQM5tUu6MnvWWQzUHAbQxH+mBsVXwGdDDMHDq49seh6YhYSjT/lc2UhXrKfJ/15yZOG6tWAp7OmEFj1fZqR5zIH8ZZ/OURCW65lTu+tnY4iH14w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(346002)(396003)(136003)(376002)(366004)(186009)(451199024)(1800799009)(38100700002)(478600001)(26005)(6486002)(6506007)(6512007)(6666004)(9686003)(82960400001)(2906002)(54906003)(86362001)(66946007)(66476007)(66556008)(316002)(6916009)(83380400001)(33716001)(41300700001)(85182001)(5660300002)(4326008)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDVQemd0Y0VYSUZaaDlBYnFUeDRSMlFUb3U1VkwzaTVWMkhzaExqS09YaW51?=
 =?utf-8?B?eUEwejBOQTR3TzFRczBLeWkxSkh6U0RnVTNoMWtHNjZDU0hwR0M5bGV5QWxl?=
 =?utf-8?B?akZTMVhteFdnT0tYU3U5andQL0RaaXB2RUdjQWlXZ1JZR3g4Mk1RelVmMVVR?=
 =?utf-8?B?OEY2UlRYSXpoUXBTOHVKS1ptWXdQb0MvbXpNV1RIR3dnZVVwbkJLcGlKaDdG?=
 =?utf-8?B?VXJhSEZMNlVQc1J3eU0ySHpDVDlrWTZNTDZWSWFBZFBEbEltQTRCam8zeXdT?=
 =?utf-8?B?ditTQW8rUlRoT2NSZG5KZzQxNXBKcG96ajdiSHR3dkhnR3hYSUdQVjljYUNF?=
 =?utf-8?B?NUUwZnVxeUhtdHZlSFVxUUhzZzBIZjJ2RCtVNlVZazdrbUIxOUZoamNseUYz?=
 =?utf-8?B?SkJnd0podTFETDBWbERTM1QzN0VpcjR4Rm1hWWJ5NXgrOTdhK1ExdENGVEM3?=
 =?utf-8?B?YnpZblJSRTRtcFlHTjRMN3ZCZUdBYUxJMU9ReHVteE0zYUg2bktRQzZneVVp?=
 =?utf-8?B?ZmwwQklsK2l2N0Rid0VvN2RMMW1VamdGcFc0Qzlpa2JINnBYVUp6NmNiV3VJ?=
 =?utf-8?B?NmFXZGNSa0ZQaVRQQ01ESExrS2E1OXZZdmM3M1IvSGJPellhZDdQMERoaERl?=
 =?utf-8?B?Vk1pZkdrTlRndzdOMFNlYUdwTUF3Y1ZxcXpnNTNvN3FvbythcGFWSmk5bnNF?=
 =?utf-8?B?ZGlzV2JtOU9EYXdtVlh3aThPVDVDVXpBd0tnak1jdkZFR2I0d1p4cTh5Nzlp?=
 =?utf-8?B?SjlFdWhjdnhDN2tIbmc1ODdtWVpYdUN0OEFJeGdTeHBQYUc0WEJ3aGYzeFJx?=
 =?utf-8?B?Vzgwakg1Y0FQdFdhSllrbkNyWlBzOW9PbG5mVzd2d3ovOFM5RjczS0Q3aE51?=
 =?utf-8?B?MWFJaDAxRWN0MGxtcEUvWXhKc01KSEVmYitPMFFxbHU4TGJUNk5JWG1DMVBG?=
 =?utf-8?B?eGRUZzZzcUlnTk1INlFoR1lSQXRsMDhYQ2hzYWVrclBZQ0hSTTdYUnJSMDky?=
 =?utf-8?B?T1ZwUGpucmRNY2t3Ky9xZGhnQmNQc21TWEhNTm9mV2RCQU0vdXE3VlhvcVlX?=
 =?utf-8?B?c21kS1ZYRk1GeGlmakk0STZRL0lFRk85bzVJVXBZNW4yVm11c3RKMEx3R3pK?=
 =?utf-8?B?Zy93bXpKRXNRcHZGR3VROGVjajZ3Znd6NmdNTjVDV2UySURGQnlpck14Zys1?=
 =?utf-8?B?UGpwSVhSTi9pYS8yK24xb3VWMUMvZ0VISmxRZmZ6cGNnZWk5ZXpydVd1WDYz?=
 =?utf-8?B?YjZHWlY2OUhNeTVuQWEzVUFlWFhsWmF0OGJoUzhpVHlocnE2U1hSeEswalRh?=
 =?utf-8?B?V0lTL3hxR3l5TDJ3b2ZjOUR5ZWxkaFZ4VVhzMEc4eHdHWVZHNkZodHpJc21W?=
 =?utf-8?B?THN3em5XV3cvMlNCOGtSanVNOWVRNjI0R0J5WlJtanYzV0cwRVdyYk5zaHV6?=
 =?utf-8?B?NU0xRWlRcnJzNFBTcWVlVkdtYm5oZnNBQ2d3UWdWK1hkSXF3KzEvZHgvZUQw?=
 =?utf-8?B?OGlBZGowdmQ1aFFFc1I2Yjd2Q2UzR3NFN0lNWVN4elJFUm1xVFk5YkYrNk5U?=
 =?utf-8?B?eDBodFpITVJEVDRFdUNkamRUbmp4ZFRRVnRKQjFvUGovN21OVEZLNjNVVkVh?=
 =?utf-8?B?bDVOR21kWDFOc1RXZmJHSHc4dDNuNHRVcWJ1bENpeTJkMWwxb0c2QXlsRlp2?=
 =?utf-8?B?QVRKN0pXbkNBbjlKN0lUejdXL09OWUZqRmJDcDBjeWpQS2ZjMXdWSVNJN2Zj?=
 =?utf-8?B?YzRxcFkyRHB6Ync1cS9OVHpKK05IL1VWcmpFTVc4YjZYNFRNWEdJQlVrTURy?=
 =?utf-8?B?dnJzdlFTS1I0dDN6Wk9zOW91bzdQVEo4UEhWMU90dG5wN0dHdVFRa3pUdC9j?=
 =?utf-8?B?amNHU1drWXB5dXhiMFpLN3kraHl4VG1mYm1SSTgrYUl3bGN0eHlEWWowNllY?=
 =?utf-8?B?MzRKTllsc0E5L0k1bmphRlovK01SbENPSUhFSzNwNTNxTElMQitqTzkwKytE?=
 =?utf-8?B?ZC9FTWovbHI4YjZ4SWwrWVZ2eVM5UXFVbVNLWmQwQVprbWJTakZtUHpYdkRw?=
 =?utf-8?B?V0lkbTYrbWpzSDhEQ2huTEpvNTlUN0UvcmI2bEhQNG0zRUd4QlRNMHF4ejBt?=
 =?utf-8?Q?sCD4QuNxztWQXqBNDeHH4ejTL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iAigux415/q9BeA2qKCID3d3EgDVVM5epLCc2XbguRK3E9OwGwEEZY8GZOFQAId7jjBYjsRSQ3Ejqz8ayANVQFx46HOQhO6H1VzHe/WUK9tmkpHModKUdfaqPhFVniKEEjDDlsoTyuA6gjWSF4+QY40vSRjGot89NKtoAvJ7lzz3uoMBuk9e/f2FdkvAJ+Q1j+eHYa7SZk3RBIoRyVMb9CTwXtHX2z4HorZbzVIk+G946sJruRRwSqa74zL6OeZRKmYJhrw2CPicqc8oVp9C9YeUGmOJp2z6aXHqFFwL5B12Kxzoam/qTWwWYHmjL+qWgZ/An9nTBwhQsOjOiw2rStHb+LzjM7vMFoCNaUMownHUO1WAPxHye85unxGyOyg2Gt37RuvP6arysFWv3F1mCdjy5VoET0ABy0Wg/UtOCz9NiCH/mHJ1X71PAxs5KqMAPbbpEHV63045biZINZXOCFw2Rdve4EYbVJxkDYdXp9VrNaa39z/geyYGoAkqLNgkR7oMBwyy5OF2gX8bGBuEhvWcsK28iKbHGavEJGfnTRp0f+AcqPD2RA+8qcoAyrzDY0SgLEsZRIEyqtc7uVqikrpAKsCl2dH8HQ1zGe4yMYjNkCGv9TOnghGpUFGrObfdGdPC99pV91fD2eQijjd4HgQF+y8CINkMDb0LbWNQPsY3IAJ24C/WuSviZGfHeXV6Ot6dYpT88l/AL+CQN2qT7eJEnq6HgmDM4Z1WL0URJNA5eKCz2WSbQy3rHk24HAbx5ICgle1q71tk5KD4nByaRKWtiMxJoXhfx7chzg9DZVn7KLTRlZHNnNS+eE2bVLHU
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103e9484-6f49-46f3-624b-08dbbaa6f0c8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 13:30:37.3099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXzV+l14a4w1qReOJUBNiSmXZsPxwwbjmCdFIY+NKqCNEZTfJqagxhYdIbRDS9JNx6eRoeZVItey5KiUx/wFNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5886

On Tue, Aug 29, 2023 at 11:19:45PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Reset the command register when assigning a PCI device to a guest:
> according to the PCI spec the PCI_COMMAND register is typically all 0's
> after reset, but this might not be true for the guest as it needs
> to respect host's settings.
> For that reason, do not write 0 to the PCI_COMMAND register directly,
> but go through the corresponding emulation layer (cmd_write), which
> will take care about the actual bits written. Also, honor value of
> PCI_COMMAND_VGA_PALETTE value, which is set by firmware.

I think this is likely dangerous, it would be better IMO to simply
make sure the value presented to the guest is all zeros, and that the
vPCI cached state is consistent with that.

> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
> Since v9:
> - Honor PCI_COMMAND_VGA_PALETTE bit
> Since v6:
> - use cmd_write directly without introducing emulate_cmd_reg
> - update commit message with more description on all 0's in PCI_COMMAND
> Since v5:
> - updated commit message
> Since v1:
>  - do not write 0 to the command register, but respect host settings.
> ---
>  xen/drivers/vpci/header.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index e351db4620..1d243eeaf9 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -762,6 +762,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          return -EOPNOTSUPP;
>      }
>  
> +    /* Reset the command register for guests. We want to preserve only
> +     * PCI_COMMAND_VGA_PALETTE as it is configured by firmware */

Wrong comment style, and PCI_COMMAND_VGA_PALETTE is likely to be gone
anyway after we perform a FLR of the device anyway?

> +    cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> +    if ( !is_hwdom )
> +        cmd_write(pdev, PCI_COMMAND, cmd & PCI_COMMAND_VGA_PALETTE, header);

Such cmd_write() call might trigger an attempt to change the guest
physmap if you are toggling the Memory Enabled bit from 1 -> 0, and
that would fail because the guest doesn't have BAR p2m mappings setup
yet, those are done at the end of the function by the call to
modify_bars().

Thanks, Roger.

