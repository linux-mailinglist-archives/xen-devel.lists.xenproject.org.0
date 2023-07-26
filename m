Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378F87636DE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 14:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570455.892261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOe3V-0002cv-LU; Wed, 26 Jul 2023 12:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570455.892261; Wed, 26 Jul 2023 12:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOe3V-0002Zy-HZ; Wed, 26 Jul 2023 12:55:53 +0000
Received: by outflank-mailman (input) for mailman id 570455;
 Wed, 26 Jul 2023 12:55:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CD/9=DM=citrix.com=prvs=564dce665=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOe3T-0001CQ-IK
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 12:55:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bce348e0-2bb3-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 14:55:48 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2023 08:55:37 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN8PR03MB4964.namprd03.prod.outlook.com (2603:10b6:408:7d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 12:55:35 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 12:55:35 +0000
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
X-Inumbo-ID: bce348e0-2bb3-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690376148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=bh4Z8vh88aCCNmW7xSNaFT+TLYRAGdh+7EtGhKnpcyM=;
  b=EIYkI08XCQtk2+uGXGFwdj5SDDvpoEoBp8mb+sMb4Td+0whFu5r/Ypda
   w4CtuPwnM5dIH/IVpsEXHZJmBi4EdOoQn4hfzs23yK1umkxAwrgvY34Jc
   Usnbbbe4L3dUvEIqNsQ5HuyaNcnLZduaNvPY7APrCFL5Yb3zRyZqi/NSq
   g=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 117378940
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5udgSqPq1WUma2fvrR27lsFynXyQoLVcMsEvi/4bfWQNrUoj0jAPy
 TQfDW+PO/beYDD2ftt/PNvnoR9Vup6BxocyHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5AJmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uIuM0B03
 KUWER4mUCjTgO3mzL+JEfY506zPLOGzVG8ekldJ6GiASNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujaDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyvz3bCfzH+jMG4UPLv/pvo33Hq3/V0SFkcLR2a8i9KViGfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAHQyBAbpo6tcYwbT0sy
 lKN2djuAFRSXKa9THuc8vKeq2O0MC1MdGsaP3ZaHU0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdu16/sr6Nhu+hWLOYWg==
IronPort-HdrOrdr: A9a23:pWsKB6zbMbPZqUSYyHNdKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-Talos-CUID: 9a23:OX4WQ2+T/rJcUyo3TzSVv0pNKOEfWyTT9Vn7HXfoDmk5RLCnEkDFrQ==
X-Talos-MUID: 9a23:b+v9hQtuAhnIoneC382ngnYyMJo0xICVOUETy4gUhs6uHgByEmLI
X-IronPort-AV: E=Sophos;i="6.01,232,1684814400"; 
   d="scan'208";a="117378940"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDasyB5TZgPHZAM+mPeZ1c0ukBDqzSeBJhJHkrJvpSXDVqLljJsE6cy+Xh7MxhjVl+hjeFxC8ccRnXiolC25MlSqOMMiYtUB6GF+EOUdACb/YYZnz7o1TnrQLbOq9hJLym5eQ84TK7xRqIAbi6YbdV6tSyz3siQNQHvVJ6szLJ0oPMkNyK7UCCJpEb9xG7k6iP4Hb2vu0LWqTGI3FYMi8sp5DcyD9j89nkXqZE9nTcWNg+F5QwQK43IDhk+JXwxTrCC8aSqKZ/gKHIPXOnOv3eh6yuX6Pu6+8O6c/63OItIMcCa7JVszNjpBVHrEsWkIM+tQ9YW7Y64aW7p3SL4bew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCnIUZuAFwbePOekwR0bgT5Rjf2c+Q+JJrHWHdx6kO0=;
 b=WeXUSrpOzQm6l6Z01xn/C+5GLtfIyKnM/niSa4I7yhBjnc4SkuEZMIrUSoNaMKADx0jYNzMNvFvTJi0baSmgNu+C/3AH+IgbTDYj7bVdEqVlUndtGvW7j8t3bAGVhK7SIjtpx0uLOqA4uxpJzv89QfAyMYxc//tjZPDVXVMJTmI/EH++dcvmhEmEYK5wG1ajJrd7JZRzAgw0GKyCKkSYHn9Yxcqrz+eIBG1OIz/IwCdT2pMBInl6ZcT7yvQ+DUy+mE+paWnA66M2tCuoV5hQR/c0gl4HdmUt8/2+fDWK71Xw5aIt/fWqgCNPpG/DDVb0KR4lgSYSSnTmYwc/R+fp8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCnIUZuAFwbePOekwR0bgT5Rjf2c+Q+JJrHWHdx6kO0=;
 b=aw2pxS4DvHy55c2vqFEBqqoUPFbhtfrRkJwIBy5t1CHLdBCAtiH5MgZU23FdkgEQzACgEn4SifltjXhHZLRvxstGGE2uvsmbC4pFv+27+na3peo9yzgI6XaEoMNW+ZGypmpcO2HxYQ1xkxPUHiltGgn4XvHui7eVgQ/1OlVG9Mg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3 3/4] iommu/vtd: rename io_apic_read_remap_rte() local variable
Date: Wed, 26 Jul 2023 14:55:07 +0200
Message-ID: <20230726125508.78704-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726125508.78704-1-roger.pau@citrix.com>
References: <20230726125508.78704-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN8PR03MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: 05c993ae-b706-4df8-95b6-08db8dd79a64
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rsuX25YaLgty21Zgp56Twt61XV7LWbzdklqs/i8fD1PXS2ra2jxaZFMa4+gTRNKAeKgot4DLL29uF6Ne7SlEZwNUkMP0E7ZZ5G3B/gH8YBugGFU77DC+L6EmE4bH+0CnYVMMKwRVSTFZEGi0lyFh6LvVmHwmrI57Fj68ko00//aFAQB2XwJguNh9CTIKiu4RpxukUPaYsWEGZbMVicsNAwKhiLudRAJ6qBcUObix+FqFGSaZ5UykqUazrUj4TYAucHqWxz7epI8oJj5CKolcf9IvCS/yDPYeHEMP0AYnd3+HMI8DjfuNSejpM7Cx75t9nLmW5/1En/DM9eBbDlQndj9oBLOVIuXI6NROOkQNt7F20tMvFk6VLDabcTvytktR1eYeGmAQUSykgbFCLmmFops/jgpOQN6f1vEgr4dDj3lfZz3G/9OHRGDi4DC/5dVS+9xf1ahznzJ961JIEDs/vX2hpSBvIiRJ1gYGLyHAKFpAEiOJvpRXP+dOtW6wuo7pC5bpr++DyEZbY1aemRV3lQFo7HNwgY/bZP3v9k7h09h652xC0EBzJQEVbOn/Sfoc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(41300700001)(26005)(6506007)(478600001)(38100700002)(6512007)(86362001)(36756003)(6916009)(4326008)(8676002)(8936002)(186003)(316002)(66946007)(66476007)(66556008)(5660300002)(2906002)(2616005)(83380400001)(54906003)(82960400001)(6486002)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sy84R01aQkJGRVRwR21KNGVYdlRlcFhKN1J5dWFZM1ZMem5yUWZrNVNVTHJJ?=
 =?utf-8?B?YUQzOUhLVEhJeWNWa0dJeXZYSVZwM0l0OVppMXlYY3BVcWVVcEx3RFJtUndw?=
 =?utf-8?B?cVFMNnpWL1kvQnFsZjNpRllXMEV3TlRNR0J6UFAzaW9CYUl4alFWRmg2T3FD?=
 =?utf-8?B?NUZwaERYU3NaNFBPK0RWUlVMc0xvQmpWaVVVVXJOcllVQnlNaXN3U2N2d1Av?=
 =?utf-8?B?M0kvTDVoSTJ1dThXMzc4TUVoanRxN0xvamt4TWtpeWlsR2laNG1KcmdpYVFV?=
 =?utf-8?B?OHQrb0hyKzBYdWFDeHc4bFhWcjB5VUZxb0VxaHFFWmRob1pYOXE4RmpnSm4z?=
 =?utf-8?B?dUdwekppTUNYY1prTVpCZFREV3pHSnk3aVZwak1DUzBwSnpjeVBiaTFOSTky?=
 =?utf-8?B?M1RheWFvTjduNi9RZzlIMVhwbzdaT0N0UTQwRnpmcFlwVDNaeGF4UWpFSTZv?=
 =?utf-8?B?TGY0NFdiVkNmTVpzOWtVeW9MWTEwRWRLMkd3VE80ekMvZXA4dkVYZU1OTmQr?=
 =?utf-8?B?NlhTWmtRU2ZXK0MzOTVnNEwybjQwRTZSeHp5c3poTmtRdGRVeDVuT3ZYMFIx?=
 =?utf-8?B?aEQ2MWF2Q3huL3ZONHVxV3BMNXh5eU4raEN5dXZoRm00dExnUTFZR1F0ZGkr?=
 =?utf-8?B?R0oycWtTV2JlajZxM3loS3FFSWxuQmZyQktkVVpBdUdmQzZEZFZUZmZXZysr?=
 =?utf-8?B?QjhzK1FObXU3a0RCUExxVjhyb3E4NUdZQWRtYzNUMmQvS2JLUjJtTFJaQWNp?=
 =?utf-8?B?c3VCVDkvUXNQNjZSSURUdXk0OVRPa0xWYnV1aDZaUW5ScFRIOHp3eERBdVlL?=
 =?utf-8?B?UUVxd3V0SUtCemRYNTFhMEVEbC9UUnRQZW9VNzl2a3JDYnIyYk85V0tDT3ht?=
 =?utf-8?B?ZmNNYzUxbEY2TzhyYXJmcHMxZi9NWExoNjV2aUFOcmFxR1FmKzFhOGdVWnB4?=
 =?utf-8?B?VjhNTVB5Tld3dkl0N3RFUURza29IZVVNeHVmTk5RT1cyVnZma2RGeUVnQys5?=
 =?utf-8?B?dEVuc1BaaTliYnUyVktNNlpuR0pLZXhRbFFRWFBzSzFDK0pvRXk3Q2p1bjNs?=
 =?utf-8?B?a2RSbzlTK0p1S0NTdU45ZnlEakVTZXFCVkZXcWY4bW9JTW1PeVNaOXlXdGF4?=
 =?utf-8?B?S0YwQXU5YnRTVkltcW9TN3U3bkJaMWhLQ3ozUFFSRWxKUjRmY1lGVXZLZU92?=
 =?utf-8?B?SktPZDVNUUVDdDVkV1RZOUd4WWc5U1E0bUtlbDNKbzdmZWlhbGVhaHdTQkZP?=
 =?utf-8?B?dThYaGh5U2lEWGpIOXZpaUtCMXpCbnowRzhrKzJKWVBtZFZEMWYxL1hDT0Rv?=
 =?utf-8?B?NGR6Tk1MdFBYcTZMaC82QTNiRUZzZTFkMklFNXBHdVoxZFZNbS9wZ2JXbE9T?=
 =?utf-8?B?N1VMQjA3N3hOTjhiM2U5bm8rR05lZjhBdEg1MHlsZXg4Y1dDMUtST3JxR2NE?=
 =?utf-8?B?Tzdac3RkK2R0YlZ5SmdVSytocG5LcmNaZ3JKNUJ5UnA0ZHhGNExVSkV4NTkw?=
 =?utf-8?B?NGtTV3Z3d0VGZVk3Z2VFankvRFJiejNOMTJpcGROVzNKYXNGOHc2RTVOd3lj?=
 =?utf-8?B?d01YYWREK1poT3BJVU1RQ0VZTzFIaUhSREZiNWwwU0VQUGJROUJvNys5Qlc2?=
 =?utf-8?B?dVN4T0dXU2tKSU9JMENZRmsrS0ZFTzRENXZ0OG12TmVXZDJEdVVQRXdsenln?=
 =?utf-8?B?UzlWVE0zRzMvMjJ4cktrbHBjWTBpNEE3bkhyOWgxdytxVWtFR0dXTGRNKzhR?=
 =?utf-8?B?bmdjYWxDc2EzQ051U05yQWpGWFZYN1UzdDJXbXFxb2dGRTJET0xXaUdrdkxN?=
 =?utf-8?B?bjR0dEVjOGk0TGJxRjA3KzcxS1d4YzRYSnM5TjJhOEd0b0QyZno2WDRvTmNN?=
 =?utf-8?B?NkcwRVhsVGROOVNId3Bvd3YzNVRESHB5WldyM1NORVZJb1VsbG5uL25LOFp4?=
 =?utf-8?B?OEMzbkZHQiszUjc2UHRpQUVnbTRDZ3E0Z1BFMkhkNXVyc1NpMnRBbjhSQXVG?=
 =?utf-8?B?N0Q2bzJFSzIvSC8ycm9SbHp2alpIeG9UV2puMWRQY0ZldmdwM1hyRFAva0lp?=
 =?utf-8?B?SGt2REVCbThTLzhUK3lIeVBVK2liYUl1VkdZRDROVi9URXhOZFlFaThUbUdV?=
 =?utf-8?B?ODJCYmtPRUpsd1QwRDZTdXNjSE04UUxVL2hFMVNEd1JWZEE2NS9mMHUxS0hL?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e1g6GqvkPuUZeeawYrh/AKJDcGGlaQXCq0WJhFbjDnutEsED4ugsMM1GBt96swju/SkDElV871AGU5DRZg0uhJ5tOJdJQq/+bGMFYt715P1n9XakgDjDCw3FFbCjgb3bsobAkIIhP6hv7z7gKm27QOU5iFy7/G2g7WMVx2LuaqEeU9q50LYzHPBaOU2f1+wlRDzWiLCrlsA6rdoJkN0wOVpygyMzzx4ZzDVTrrcIs5qCgU4esIkzrRJWVzMpSJMslwSZN979EGo8FLL5wrLNB4GY/J6v1DSHjXoRWY0TIC+dTwwlGT9ZrbwOvH/wnyRco8zQMji714cxJ3kR0G5OyWyrW9d/EgvSL8TaTim4v6yxYkLaDWlJThmtqRnXBjldqNGEEFAAJnaxD4H9vvpVbM09+BR4wRRu7uDTeuC3NNH4xGAw/utAKSznz07c2hJyuenrQsulDAfiw/anFMy349KsolVg1UGT8ksCDvFb5BrQZj83rDF/s2t7qt6WDmXqLlYPS3fXmMPZrfXkA+N6EtQfLh9VXutrJmp8d+n7eaRR/sFlciyWJroC70kdGyKgaz9zC4kaw71X+E1nr10WdfM2YCbHL1rMs25w9IedCrwN6oYITkNO9bsN1cNgl0Kz1F1vCw64kZPEP9wPjlr2aRgbNagZggiT7hchXl3IOoiOk4jlauzcTKUkvnys8x+K8cqzf21cmJ9YviJJCr8+og9PgiBCwapNEcebeN1BsIzFXr+ieYrP7AIVruqzzHPjnFqrklwW0VX8PPaWWYaKZUkAiqKsSoCB/5/ZoROezzkyaoHVbcfrMgCzTTRWF/co
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c993ae-b706-4df8-95b6-08db8dd79a64
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 12:55:35.3066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjQADlq0io1FZS6S7/+T7vvnOwwJgEwIvz5ujzl5HX+ySKJbPxMLz7ECB7btYP7FafmoEB9sNT4m9GgGysyMrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4964

Preparatory change to unify the IO-APIC pin variable name between
io_apic_read_remap_rte() and amd_iommu_ioapic_update_ire(), so that
the local variable can be made a function parameter with the same name
across vendors.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/drivers/passthrough/vtd/intremap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 786388b4d9c7..05df6d5759b1 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -441,14 +441,14 @@ unsigned int cf_check io_apic_read_remap_rte(
 void cf_check io_apic_write_remap_rte(
     unsigned int apic, unsigned int reg, unsigned int value)
 {
-    unsigned int ioapic_pin = (reg - 0x10) / 2;
+    unsigned int pin = (reg - 0x10) / 2;
     struct IO_xAPIC_route_entry old_rte = { };
     struct IO_APIC_route_remap_entry *remap_rte;
     unsigned int rte_upper = (reg & 1) ? 1 : 0;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
     int saved_mask;
 
-    old_rte = __ioapic_read_entry(apic, ioapic_pin, true);
+    old_rte = __ioapic_read_entry(apic, pin, true);
 
     remap_rte = (struct IO_APIC_route_remap_entry *) &old_rte;
 
@@ -458,7 +458,7 @@ void cf_check io_apic_write_remap_rte(
     __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
     remap_rte->mask = saved_mask;
 
-    if ( ioapic_rte_to_remap_entry(iommu, apic, ioapic_pin,
+    if ( ioapic_rte_to_remap_entry(iommu, apic, pin,
                                    &old_rte, rte_upper, value) )
     {
         __io_apic_write(apic, reg, value);
@@ -468,7 +468,7 @@ void cf_check io_apic_write_remap_rte(
             __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
     }
     else
-        __ioapic_write_entry(apic, ioapic_pin, true, old_rte);
+        __ioapic_write_entry(apic, pin, true, old_rte);
 }
 
 static void set_msi_source_id(struct pci_dev *pdev, struct iremap_entry *ire)
-- 
2.41.0


