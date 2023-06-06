Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F8F724A23
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 19:24:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544129.849673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6aPE-0000GA-I6; Tue, 06 Jun 2023 17:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544129.849673; Tue, 06 Jun 2023 17:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6aPE-0000DD-Ez; Tue, 06 Jun 2023 17:23:40 +0000
Received: by outflank-mailman (input) for mailman id 544129;
 Tue, 06 Jun 2023 17:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tz0j=B2=citrix.com=prvs=514dea429=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q6aPC-0000D7-MF
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 17:23:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd36a737-048e-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 19:23:35 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jun 2023 13:23:31 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by SJ0PR03MB7101.namprd03.prod.outlook.com (2603:10b6:a03:4e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 17:23:26 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 17:23:26 +0000
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
X-Inumbo-ID: dd36a737-048e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686072215;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Gm0aCo4FEyMFJJgN2D8AQMZVYKTX7deBq3NtxXOZOCM=;
  b=edTZq8OOp4KVNJPhhfehOKosPY0j6FGRdqDIk9eGYxoSSKZB5FcEhZ65
   u5z4M1IBrpzqrYt0f2PYIU83tqWIfvrEmxl9gITQ+9EWtGmAaSTmA+EkF
   1Cp160SEiljrNhy0OjFW0zg+Gxwn9FfistQK8F6lxYZH858CkRS++8h/5
   Q=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 111820169
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PhsjE6O94mAME9XvrR0hlsFynXyQoLVcMsEvi/4bfWQNrUp03mQGn
 WsfWmqAM/ncYmD9ctFwOt+x8RwFsZOByoU2Tgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5gJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rhML0VW7
 +EgFAAqQDnenP2r6aLmdNA506zPLOGzVG8ekldJ6GiBSNwAHtXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vJxujCJpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyv11rWXxH2qMG4UPLKf+t0y21/J/HdQJT4GWVblkPaGkUHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAfVSJIYtEisM4wRBQp2
 0WPktevAiZg2JWXVHac+7G8vT60fy8PIgcqbyIeUREM5dWlpYgplw/OVf5qCqvzhdrwcRnOx
 DSNoDk7lq8kp8cB3KWm/njKmzup4JPOS2Yd5A/aQ2ak5QNRf5O+asqj7l2zxelEBJaUSB+Gp
 ndspiSFxOUHDJXInirSRuwIRemt/6zcaGeahkNzFZ488Tjr42SkYY1b/DB5IgFuL9oAfjjqJ
 kTUvGu9+aNuAZdjVocvC6rZNijg5fGI+QjNPhwMUudzXw==
IronPort-HdrOrdr: A9a23:UDX0VKzAbfeXwy3GUIGvKrPwKL1zdoMgy1knxilNoEpuA6ilfq
 GV/MjzuiWetN98YhsdcLO7WZVoI0myyXcv2/h1AV7KZmCPhILPFuxfBODZrQEIdReTygbzv5
 0QFJSXpLfLfDtHZWeR2njbL+od
X-Talos-CUID: 9a23:p9/ToG3oi9J1vGHofpxEsLxfRPsLVmXH0U/sE2iWIDtyV6C8WQKuwfYx
X-Talos-MUID: =?us-ascii?q?9a23=3A7unpjQypfDuPBR4HZHBt7y+sOxSaqKuJBGNVypd?=
 =?us-ascii?q?cgdLHGA9gNzrDvTuIWYByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,221,1681185600"; 
   d="scan'208";a="111820169"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZ0F4tVnTemy/nLdLvmUHrQ5cjxzY8uB8VFWNOUdSVougXxDZtl9vUubO7jB9DZq4lXUB5WyzxJDc65fS1Nl8aIFHiJ3eOyjFm+mUQQBNTiJyPUd6F1hm/VV6ko8RDRC8Pk7ZAGHGhoAfLRsahCNc1vBZ/T8Ir4BYwxpz4TebOcyD9HiX3xxzaU0Tl46Y1jmOmo/txL0kBleqVR/iTD+Y4k8swmLkOUNz4hPp2keDuwYDqywmqRXBJZyA/wMeHiJdUCP4u6z/rUtzeH2yPc90Vq8KzJ0oH9LrYpV6eL2A5WQUtlbl+kqY8+gLWmyqS0ORXEUxscBqJ7wz2zXpf9ajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=St7pZT571GTRV9ofAWN9hsWuPg375eC1313V2qCL3+I=;
 b=aqtouEBxeDfyQmmR8Qzv+E8wDRmifPfm4y7awydGjum3ULWdl9SNgbJpQjX1cCzUb0cPeNAXifx1+pYXD01J/VuYOShJ6U/E6HkZhsNsvVYpMxm3WqgCvEi8pTyzFgRB7q6jR/xGRi9Q9HsmHj2HSPCtR7d3HlpwmX69eXidqF4xsOD3nlb8UNM09H7FQs0uvjrZQT+05MY2t7M+zEFnH5DAKpviZiKI3G+fV0LLVWuekbYP6eA0g+f7GtbY3X7rZLAYwF/rrekH1//QbmOYZdoASor0JX5uRqac3Uwxd91bcy4EFCbZ1BZafdvdfSvT2Iu64GAcb9Vc2qpl+qVCSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=St7pZT571GTRV9ofAWN9hsWuPg375eC1313V2qCL3+I=;
 b=NdNNlQoPAZF4n9Nfs8DZkhSJrByvGxwyyrpdy6C6mzyJtySuQEyGquOMnnXg0YuvEkI0bB4KzzBuQTDywLMRQqUYs9YwQOXN9LXeJt1FgpkJ6BARK9cXXCZRRZ3BcI4QNU/ds0ldj0y3KYczpD2CvSzeEK1vO+GN18Q6MlYp3ug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] livepatch: apply_alternatives() is only used for livepatch
Date: Tue,  6 Jun 2023 19:23:07 +0200
Message-Id: <20230606172307.38857-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::21) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|SJ0PR03MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bdf4b8c-62f0-44e9-5535-08db66b2bd0b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wlNw8MbWXPpCwA8GM8zTuaABaZssOGNmc8OEL1c8N/2Zy8NBMerANapMAKhXUo4iLHXI0MQcbmvheRPZd1nTGFIe3gWaCzlW4Xs1XE5N5/np0aiMmaiA1NMS9rheSHuLUOGuJMC0mackY8n1cpZEECHKPCvxqk+Jt1vPxvUl42SxXWhGjyUBXu2IDnZuBkRwZmcEdm0Kq9y4dYuGg+sIwgZCMAM3V4cSG1GrY+xYvQEGWBIGQvnXOJVX0RLhYl5IGonbDCANiACm1WK/W30c8uRBeFo8pJd33VHchvjLmCAFZ0xlH9pCAiMd5hSc2g0cVHcfLDF1e4freimZRVo/6h4He7RJSXnhgA02ze9UGj2OU4bWGcAHFaNAGb0U/aVC/QOfDzOOGnJfBEBnBFAKMw3ZwbITGJvLo2a7db0N8K2oHxwO+26elkgfP15YK2+hKK/NDz5Sn7uAhHFZ+/jePceWQTdj0W4AczdqEhGQZ/osuqso5Pe4IyuRMZMGsm7jQ9wQwSp2Ek8t353T+0/k0c3TROyO7TGfNk0s/X2/xJAm+24s/6dXvSgd8Z1BsG+U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(6486002)(6666004)(82960400001)(2906002)(66946007)(66556008)(66476007)(36756003)(54906003)(38100700002)(8936002)(86362001)(8676002)(5660300002)(41300700001)(4326008)(6916009)(316002)(478600001)(2616005)(26005)(6512007)(6506007)(1076003)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVdJM0YzclN5SFE5THliZWRXN0s0clc0VVROUy9WanpUOUlUc0w1Q3JNT01T?=
 =?utf-8?B?aE9JZXRtbCtqTUpuTEVwd1cvRmpibjh5OTFTZG5MMFBmWngxUVZPOFFUajM0?=
 =?utf-8?B?YSt2QVBGcm5kNGRSSTVaK21pcGZWQytmNWtqMUVWUFpaaGRzdWx1WmVHblhB?=
 =?utf-8?B?TVdQTVZ0dU03aUdpWlRLSXlwYVdHaWFPVkVxY1V6aFpKdXdkTVBvb2lOYWJh?=
 =?utf-8?B?MkFIU1JIZDh2SFR3WEY2MlNwc1dMakRXUkNUemdzWThDR25hc3V2a0tWaG5H?=
 =?utf-8?B?anBpZlFKMHZyQTVnR3Fna1NadzFVR2hNcXkrWDJiWGkrVGdJRVdORmxkQ1Ri?=
 =?utf-8?B?SVJyQ29ldjhXRElJOFVSYnVzS2wrdHB5TWExOVl5Z3ZuZ3dIZENaVnN4bzZH?=
 =?utf-8?B?OW1lcGw5alI4VkhhUFhXSXNPaXh0MklJT0U1d09FNkxQZStaWDNSS0hVamwr?=
 =?utf-8?B?VTRZb0hJV2FXbHZTQUZUcElldnJ1aGtlUURuVTBrMXJLenpDMmM4WVZKQ1ZN?=
 =?utf-8?B?M0xuMGg5M1RSb2kybTRrZDR6Mk13Skc0T3NEa1o2dXZtQkREQlFFK1pLWjNJ?=
 =?utf-8?B?aGRRL1M0VlNKUkpsRXJDWGdkNnVhcmFlUlNLMFJZOWZRdm1DazJvRUs3VHRF?=
 =?utf-8?B?M0JqS2ZOL0ZobEpUYk10TGFkYUpFUUlhamdHRDNTSG5jUkJnVHY3WnNvSW82?=
 =?utf-8?B?N2x3aWR1MjF1MTUyZjNvaVA1OW9KMGZEUWlEME1oa0wzOVVPTHphMXVhQ2tn?=
 =?utf-8?B?ZUdMR1BzWFlmSVdGbGVLQnZtbXkrT0V0MGxJTE00T3RFMkNLRnZhWEVhYm11?=
 =?utf-8?B?RDRreFdmT1JCNFVsci92Y0gzb2g0cjFIcEtFMXZ1d3d6cDZqQk1zS0I2TCtv?=
 =?utf-8?B?ZEtFSzU3S1BpQnJQckZqTkRkTERGaXFBZ0pZRnVQeTRpTWFxemtXMUQ2M2Ru?=
 =?utf-8?B?VG1FRDBIK0lhQUtqa2k0V2V1WWNHbitucVJKVnVtc1Y1K0xZWXNKemxxZ2Nz?=
 =?utf-8?B?djVVZ1NuZ1FnTHhnTEFNaVFuWVNvcytLWWVMWFRHNjl1RXh2Q2I1MDhoeUFo?=
 =?utf-8?B?Q2ZMK1BuS201d01IZUZFWUdQUHpxMGhzclRIVlRmWGRCTm5kTWJFb3dndWsw?=
 =?utf-8?B?QjQwUTJnMkw1U05YbkM0SzVpRE8rS1ZKYk1ndGpHaXJSUjU1aFpDVGxZcVNn?=
 =?utf-8?B?YW9GaE42Z3hKVC9mS3hkREtGb3g4dmt0VW1XVFNlYVArKzRUMXQzcWFYTThv?=
 =?utf-8?B?T0ZLV1B6KzdHb0RLYm1YOU1ldlYrSWw0V0Y3VTJuWk40NGN6RUd4SDRMdmQx?=
 =?utf-8?B?U2I3THFldWdYUWVqQjJ1U0JsQkNIZWkySGxBNEVLRUMxeTc4N2F3TklGTzhO?=
 =?utf-8?B?Nk1qUkdhOFEwOC8xUTlXQXRxNHRjUE1rQjI1bnJ4bWwzQWdoSnRpY2I2S2Y5?=
 =?utf-8?B?ZGpwbnA4dUNhOXJjQzBQWHA1T3o1VVVwaXlTbWpSQ1V6SGhEa3lDZDhGZjhh?=
 =?utf-8?B?b3JPR3VjK25MaXlTeVU4dTk0ZW5MZERON3FSRnVjYy9MQVRPQWtVOEFjM3p3?=
 =?utf-8?B?WGtJMVdydStERnh5L05Od3RCUUpkZWdhRjB2RlVjZkJzYWtYSXZ4Ni91WDFX?=
 =?utf-8?B?bVBKZTdOZGp4MWZvRUEzc3BwdmJCZGJCUFBtMWpoa0pYMXFRMno1OEo5cE9q?=
 =?utf-8?B?QmZZZUg1T05uSXpqQWJ4bnZGNGFLOHpqbjlwcFRrbWg2V0drNkVTNzlpM2pL?=
 =?utf-8?B?L1FvZmV1eU00OVhDWVlHdzJOZjBEbXFnY2ZwamYwOUthUXZBRlUzeFlxUmpO?=
 =?utf-8?B?ck1hcWpNVklRYVRxTmlHY29WbDhyWW9tTEJyUXJQczdIS0lHKzF5UmQ4bmsx?=
 =?utf-8?B?azZsVjh2enR3alV3dzhzQnpBRDZNRGFvMmdvNHE1ZWVCRTJEd0lDUHpzYVdX?=
 =?utf-8?B?MWo3OXFqNE1MYjhweVhMOExQeWh5UjlvbGovR3V5VFlhd1R6ZnhrQ1BnV21k?=
 =?utf-8?B?QWxLY2hnZFJySnJBNWp6QndIUmMrRzNBQnNFRzZHUmg1czB4Vzh0Sk5QZWp6?=
 =?utf-8?B?b2JhQ3VhTk1NWlFOYW5aVlF2Q0FKODJFcU5qbU0zN0twT3NOWWtuUllvcEhS?=
 =?utf-8?B?NENEOVJZVVIzNVVwT0R3b2VJV0JBZ1FWbVpzZC9xS1lEQTNBNEI0ajVmaDdE?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7YnE+Dpey101xgM04SjPdKCMBE+mxtBW3T5NGA//Kbl8LmnWOA3KN3YbmsoIKgJpF6naVJXAwkNe3imiOwNipFyDmXI+8LL8S8/PR/UFVvyGNshEv3r2uItUTZjKVVzunj+fTqLKHLSjWSa/NYMJ42io7XDcP7h3l1JUYnvE4RG1MZvNklath8wKZwD13qpiI/vHP09JM6FUTTPqx4Wuwrdw3fcZkBxl85vPMM/TssTVuuvTTNA08VDgp2StURAZRfXHnJ4adJvBbUhiDU5ILryF7SmqhzggNVngQxl/KWOoqjrOZFWlR/hOt3+8XTxyGTGLNbuHa9s/2ejT3Sj8LjbcALITtERpg+WYEI5BzaUDaxuHqvnvq0CtMWjFLfyYwo5/CBKQshb666lKlsGAdOi3SskxlOdFTlgza7aOSZ8lZlmRayhdjrpnolX387JApkfNZFyjwrPYrzSuR0ATEmSHhuK0B9XqMLpbsoHFbzOtL00iCeIP8p470tG5/rPzdJX4upldUsk7wriWP6KnTRiquc5mK4RcRsXb15vwN2q574qQ5q7j1j93LRzMCfstXp86F6X4VuBy68sjFhgOQew8q9U1hQMlbUySnmEzleSffd0mBjJneH0D/wVfh8y8afhgnHICjWnDrg4qlVgsH0uCC238Ryyb6yII/QBVGR+qmRkuOhobFi6fd2a7luBcR1743pinm8OiNxvPKHMt6p38JuZFA2kURlKeL03gyHsS2bxuxfQ2Q61A5wm7toRSihR4eNfVbRvX+8wSqW8ipz61RymE/2ZGo11EQES6SCcxaV1S4T4ihDW/cS13EdVro6mdYui3IPObeQAAIziGFoQ/++MHip8f5MFv3ydUQQEjt9GqyDTdidMAnfpSJKOigIB7GOwJWT3AF/RVLH8A8w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdf4b8c-62f0-44e9-5535-08db66b2bd0b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 17:23:26.7382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QU6L/wGcHiMNpqvzhgFewYGT6eXZtn3PsdVbz/qhEzXGYlgikLWimgp5j5ebb7mEydqVzwzXQ9U6hyRqsNT0Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7101

Guard it with CONFIG_LIVEPATCH.  Note alternatives are applied at boot
using _apply_alternatives().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/arm/alternative.c             | 2 ++
 xen/arch/arm/include/asm/alternative.h | 2 ++
 xen/arch/x86/alternative.c             | 5 +++--
 xen/arch/x86/include/asm/alternative.h | 2 ++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index 7366af4ea646..016e66978b6d 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -223,6 +223,7 @@ void __init apply_alternatives_all(void)
     vunmap(xenmap);
 }
 
+#ifdef CONFIG_LIVEPATCH
 int apply_alternatives(const struct alt_instr *start, const struct alt_instr *end)
 {
     const struct alt_region region = {
@@ -232,6 +233,7 @@ int apply_alternatives(const struct alt_instr *start, const struct alt_instr *en
 
     return __apply_alternatives(&region, 0);
 }
+#endif
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/alternative.h b/xen/arch/arm/include/asm/alternative.h
index d3210e82f9e5..ce82dc1ca0d2 100644
--- a/xen/arch/arm/include/asm/alternative.h
+++ b/xen/arch/arm/include/asm/alternative.h
@@ -29,7 +29,9 @@ typedef void (*alternative_cb_t)(const struct alt_instr *alt,
 				 int nr_inst);
 
 void apply_alternatives_all(void);
+#ifdef CONFIG_LIVEPATCH
 int apply_alternatives(const struct alt_instr *start, const struct alt_instr *end);
+#endif
 
 #define ALTINSTR_ENTRY(feature, cb)					      \
 	" .word 661b - .\n"				/* label           */ \
diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 99482766b51f..21af0e825822 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -358,11 +358,12 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
     }
 }
 
-void init_or_livepatch apply_alternatives(struct alt_instr *start,
-                                          struct alt_instr *end)
+#ifdef CONFIG_LIVEPATCH
+void apply_alternatives(struct alt_instr *start, struct alt_instr *end)
 {
     _apply_alternatives(start, end, true);
 }
+#endif
 
 static unsigned int __initdata alt_todo;
 static unsigned int __initdata alt_done;
diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index a1cd6a9fe5b8..688b554099b3 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -24,7 +24,9 @@ struct __packed alt_instr {
 
 extern void add_nops(void *insns, unsigned int len);
 /* Similar to alternative_instructions except it can be run with IRQs enabled. */
+#ifdef CONFIG_LIVEPATCH
 extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end);
+#endif
 extern void alternative_instructions(void);
 extern void alternative_branches(void);
 
-- 
2.40.0


