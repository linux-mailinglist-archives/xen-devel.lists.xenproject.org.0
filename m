Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31611757C12
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 14:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565178.883114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLk3p-00036O-QZ; Tue, 18 Jul 2023 12:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565178.883114; Tue, 18 Jul 2023 12:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLk3p-00033I-NB; Tue, 18 Jul 2023 12:44:13 +0000
Received: by outflank-mailman (input) for mailman id 565178;
 Tue, 18 Jul 2023 12:44:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9jt=DE=citrix.com=prvs=5561f9d71=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLk3o-0002IO-0N
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 12:44:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9f6ce7c-2568-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 14:44:10 +0200 (CEST)
Received: from mail-mw2nam04lp2170.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2023 08:44:08 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH2PR03MB5317.namprd03.prod.outlook.com (2603:10b6:610:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 12:44:06 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 12:44:06 +0000
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
X-Inumbo-ID: c9f6ce7c-2568-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689684250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=bh4Z8vh88aCCNmW7xSNaFT+TLYRAGdh+7EtGhKnpcyM=;
  b=T3+eCNkH1KA8sO28YAwi2QJL9Mrd1NOZ40LeUjQrzVfQZGzX/TojYIQ5
   MZzJ91c1/TAPAzlLfSra4n72OneajZaxXmRmMRiLWsFDzaRLMiXUew6Ty
   RjYVcOgEBcEB0TiJw6o2EXJLQE8D3uFjmZLKvJfVXbOZeiwmrKtWdzKED
   M=;
X-IronPort-RemoteIP: 104.47.73.170
X-IronPort-MID: 116607369
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pkF6K60OGAyN9HQq8fbD5cxwkn2cJEfYwER7XKvMYLTBsI5bpz1Rz
 GEYDTzUOvmNZWTwc9pyaoXg8RgFsJ7TzIViGgtupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNnNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfOWhoq
 fkzC242ck6kuu+q8JakRdAwr5F2RCXrFNt3VnBI6xj8VapjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6Kk1QZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137GRxXygBtN6+LuQqfwwvGCQ+GYpWD4WcEO5r8awr1WjYocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZj1Mdt0g8tM3TDoC1
 1mVktevDjtq2IB5UlqY/7aQ6DatYy4cKDdeYTdeFFRdpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2ONo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:qpuOCa8CXdWPjoAzL3Ruk+A7I+orL9Y04lQ7vn2ZLiYlDfBw9v
 re4MjzsCWetN9/Yh4dcK+7Scu9qB/nm6KdmLNhRYtKPzOHhILLFu1fBNDZsl7d8kTFn4ZgPM
 9bEpSWY+ecMbEVt6zHCObRKadY/DFrmJrY/ts3Dx9WPHxXggpbnmJEIzfeA1dTTAlCBZ02NJ
 f03Ls8mxOQPWUMSsigHHEKU8jPzue78q7OcFoGCxYr5BK5iS6h6LOSKWn+4j4OFylSyrcumF
 K19zDE2g==
X-Talos-CUID: 9a23:k4Dmh2w9DlyY/ehwUsnwBgUsE+Z5d1b+kkzMfWiFBHpZbKKacAO5rfY=
X-Talos-MUID: 9a23:4xVB5gmqAJthI0I8KJ54dno9Np1U3qeQAnpdspUjo8uKCiVVICqk2WE=
X-IronPort-AV: E=Sophos;i="6.01,214,1684814400"; 
   d="scan'208";a="116607369"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frMre0DkL8Z2df4GtYAhzvLnCvUb0L6IvV6p/crGziD9vBgZfwCrL5Nhz4TE2OfJdF3PCj33YM2i1ewPLXN9RR7i5jUu5KgxWzLjcHfoYUaQAxbWzV9faYTwc50zkrtwr4UV1XkXSU8d8sALtU/Ii5WB+g7IgZKKKT6fpn9gt00n5YDFUKREjHfMN0P+d++OxEVIQQguSgad7o+xnObLNEceKZyHgMhldWrMa7b2V2pFgasQnFHY8ZzFO1TKCgCL+eZD+E6BwWF/qGXdRkzZFvtoJkRGJL/xLzZJ+g9NbMDhwqXb2DAGQTvn0ci7+MjTFJf0Z2v2t3Tf/H9CHwEyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCnIUZuAFwbePOekwR0bgT5Rjf2c+Q+JJrHWHdx6kO0=;
 b=IrDALT/XZpG2n/fvfNo5ZxW7JijijjUt7j075TR7+926W7h51577+K7nkwq0hd8tXS12qOP4+iQC6PfeavFi9bHOsyf5uQM6sAcFZMYDP41um49kBBOiXXEnYELN7RfQwrgDkRXdrj94neecCSz6R+MAvl9gleUPIFPHoVaz2iQaVEt6aqWBd+DvRHbd2x6QhiVuh4O/A5i5CM3ggLBYLPVsG9KVhEzWNJqVv4rzUuBsGz/73uu4TxNdd92MEcQ32QVFDdGfzePjb5WT3X/akVULeukgYhMENoxfjR/kGybIZO4kbIRnBnlQozZnCcw6nEO+lpXjPA57cahXlHgbJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCnIUZuAFwbePOekwR0bgT5Rjf2c+Q+JJrHWHdx6kO0=;
 b=uGGPEAjrHXznKiE0oPw1THGDb4yVeOLWcqPY2nAX7YFK73OzMMNG0Vyh1i9/JgtbFHqRaqI82r3PtVVfZkIXf7T6sDnmzFswdV3ZSTZB7Y+lEBITuic2iTRjiQu2b3K/C+V95Hl9zGz0scf4IJQn4enxiC7uue2OasF3THaol+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 3/5] iommu/vtd: rename io_apic_read_remap_rte() local variable
Date: Tue, 18 Jul 2023 14:43:32 +0200
Message-ID: <20230718124334.36548-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718124334.36548-1-roger.pau@citrix.com>
References: <20230718124334.36548-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0492.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH2PR03MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: 2213edac-1ba4-4ced-8998-08db878cac42
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KTkk4fFLWFl0JTz0fL28sVhatrjvHho3OszrtnhhdUnQMovRASaBJNn7o3ObzknWANNFOpM0VybsOpnRqE2g+E6H/zF+BpzBnwQ7kXQtWgTDMSAJRK2f1KKCjxPUSOb9jlh/9IENxxIRSTJk0z0t7ljH8AHTInNSg9PIz9EZvZnV0By5xadmXETk+cDRIojwT+vYJ8P9CAslbwM6cLnxDwsDLMgdimcvlLXCH8QnyqSkbMIDkFwcWU7/jCKdy6+ajxCNFGxbOKxNEvS8eKogDSGQPCXrdOu/ZA7RSHW0Ic9rQr5dWdJgH2g0xSERYK/SKMEfnuNI/ETzXGjynn2uFEH8+5IvFaztFYkqgclZeaW1WkakI/9RnISvjdoQ2hv9volKFmtuQTE7dnXfOA+czXGdhJOtDQpvkjnq+LGuIUiSzl6jIGGaIsUBd2tDLsWoNqh9OvSnHJHeEv7DpjsHA89AEISwFdeyWxgGxNlWDS9gP7MOo81MEdinT8juM4glb4y4MZGBb0O8how36j98eSiu1tJ3AbXl2Aq5I0NGCoxUaKNGq2aHjTP7TpINsidI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199021)(86362001)(2906002)(36756003)(186003)(6512007)(38100700002)(83380400001)(6506007)(1076003)(26005)(54906003)(82960400001)(6486002)(6666004)(4326008)(6916009)(66556008)(66476007)(2616005)(66946007)(316002)(8676002)(478600001)(8936002)(5660300002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1JhQkJkUmpyTjRURXFOTjlScjUvdTdRUDlQTDN1b1JMSFFva005c3daSHJn?=
 =?utf-8?B?WHgrSGRpV3p4MGE3SnE3RFlqNUtEVHo0YW81WGZmM2dmcVhMRWs1ak5CZlQ4?=
 =?utf-8?B?K3ZuU1M4QldGaWUyNWlmM1czVFdBdCs3Q1FDVTdxNjd6SklYKzYvWTl0WThZ?=
 =?utf-8?B?d01jYzdLc3d1aXEzUnBjZTNTTHlMenA2bnZHci9wdkFoYldkb3dsd3FqaVNk?=
 =?utf-8?B?VkJRZkZXUWNXcFR5QVR1dFVKRUE2VmdHMVVLTE1keEpaOHdPd0oxQzdjV0Qw?=
 =?utf-8?B?WVZ0SXEwcXpOVS9WbElBRHZOTzhaYjAxZkdOTE5TekVXWnNudHNOMGZtSDIz?=
 =?utf-8?B?WUFMMUd5N2h6ckNyODZxeWNibHUvVTZEK0d2YkE4NE93VktmbklsWmJnN2cw?=
 =?utf-8?B?eFgrVkJlcDc0R0R4Ymg1QkkyM0FhOFRQNDRNMHFNdEFid3lnMjRYVWo4UUVG?=
 =?utf-8?B?WTZOTWJmZHU1aVJKWS9mamdvelpJVVdUVVBJQ0w5aU11bk01VzF1Q0FEbkhG?=
 =?utf-8?B?REgvaTIzbjlEZnJ4OXRlNncwSEFETEpWZThrUGlObE1YVVBlZ0xhd2trNGJt?=
 =?utf-8?B?bVlrcnJVMkx1MTN6RFdZUExlQ1c0K3pzMGFVT3cwOG5TU2RDblFqcEpJOTg5?=
 =?utf-8?B?OVZYczJLSzF2dE9jZ1JBcHB3QzlSUmJoRW9IR2pHSW84c2R2Y3pSVGpCaWRR?=
 =?utf-8?B?ZVBWa0pBSzJLZ3ljaVhadmJkTmdqSE1RdnN0OG1QV09lNFZqY0wxR0s0R0hV?=
 =?utf-8?B?T3E2TTVNMzBEM2FZZmI1ZUxxQmk1YjZkMWJaSXZIeWdWRmF5UFc5RVg0bTJH?=
 =?utf-8?B?WGw0TkdheExaQjgrNTdsTXU4MXFIWFZWaW91WVJ0NnM2ZDlnSkR6NnplMHMv?=
 =?utf-8?B?a3I1SkJBLzRQZnNzQzZFLzdaNTBuR3piZ0Rmcm1BTzllZTQ0czZNSVpyMmRT?=
 =?utf-8?B?VnFlRlhMSmNmazByYXEyNzFzSE1mMVE2TzdXOUloMzVpcEZvU0lUMGVRZGZz?=
 =?utf-8?B?RGR4VkZtSE1lYWRRTUUzUHdPOGZVdjNFQWtacnFrVHVNdkJURHdLalVYU3Bk?=
 =?utf-8?B?SWp5WjBtMmJsWWhIT3FKQmdFTElnZnpCUTVnaDNEblYweS8zRm9IT3loS2dq?=
 =?utf-8?B?SVVyTlp2TnMvSFAzQ0N0REpma3lqVGk5My9LK1RhWE5SaG9PV3lSNVM3bUYz?=
 =?utf-8?B?RUlLNm5jTlc4eUlZSjJVOEZleGVhV1JtOEVoNGhNcDFBa0U5RFNDOWlhOUVI?=
 =?utf-8?B?MG82ZWpPSmtQMWVNZEQwQVJxMjV1WCtybTVxQ242WGt3aklWdXBmSVBFc05I?=
 =?utf-8?B?aHo0SGxSUjQzZ3FmSnk2bWp6NHFyeWxrNitXVSt0VDhQanY5L1YrZE9NZHpW?=
 =?utf-8?B?WXc0eUdzS1ZvcmxZZUxFZlg0MXZhVVZzUnFHUWZqUGNVS3lPMGsrSThrOFBz?=
 =?utf-8?B?ZXJONExiYUlRZjNTL1EvZllER1VES1o5UmFGTDFQTzBncVRDdlpIMmxwcnZR?=
 =?utf-8?B?cTJlTTBtU2tqd3hpWk5VT2tzdzgxSFYyOU0yZi84SzByVkxXTVYzc3hLbkJK?=
 =?utf-8?B?aDM4ZDFnZ0hERDNzaUNVNzlod3dkNlZnREI0aHlydFFVTTJ6dForRlVDbEwx?=
 =?utf-8?B?K1haYzVheGpPS0h0SXVLVE1ZZXRvOUI2RVMvR3ZFR2EvVW9uUncyelRaUDNa?=
 =?utf-8?B?OGlNTWpQTWZUa3dUSGFQbkF0UFNBTTE4RUVjbG95ZUlzWC85SkNkOFBhc1dQ?=
 =?utf-8?B?Q3RSbHVHZUlqc1J3bDdKR0F1MUtzK0FERVM0dThaUDVEaVFMTGJaaGkxQ3ZP?=
 =?utf-8?B?MUhUdFdoRDVKbnpub3k2OVprVExoN2N1ZC8wZU5oVGRrd21OZ3pkZ3BvSEZS?=
 =?utf-8?B?T1RDV3ZlbW5KbjA5RXEzczdKVDhDTDRiNnZyRm5jRUFqQVNTbUx6d3d4SFZq?=
 =?utf-8?B?TURDUTlwR1JCUHlWdnFTTjV2V2JnZGl2YlUxME0ySVI3VHRnSCs2MlRST1A4?=
 =?utf-8?B?cjkrNjNlNG9IYWtpbDRUVkF0ZW5kMXpxLzIzUU5sT1A1ZURGNEdsT1ZKNmk5?=
 =?utf-8?B?TEY3WWJIeDdEdWJPYVNGQnNUUFpPWXpNQkRwd01TTXR0N2pFNkV2VkJwb1JT?=
 =?utf-8?B?aEVjWlhJbDB0bkdSdUNRWGxGakZJM3NCWHRORUY0anJRVGFLSndXVVd4WE1x?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jA+XSp/yT37D2eeCUE3D3JB+JXJwTBtPQB5l0+E63++Y7DTV6Z5h2q1qez7uIB195NuLNiMiuRgZxl49tFbjEtInCqbD68VNTao0qrznAUb9zPmB/rxC78efXs9huTPO0qzohebSJPQGw9MZ7Afied47U3VK67Tf/LdmsMmf0w6iuQy8/Czq+r9Q7Txen+Mlff1qqacVWXtpH0+WjZRp612Z5NSmZQ9fDtnJmB2SMASavugCPLx6q2Rq1jkzdBelZekJjyEYxkDZuOCw76hTQHEubhn3fG0DxySGtjPGC0osxz3wiallF36QHl3dMsnfBE5RpTuE7t3amveDOi7H93iIJUOYsmewUzIJBIzEPQjXOpGcPo8rn591/xhCaHjTbhDe2r46aWYugm9kwj3sxriKGhtYIuVZUudI1atHAol+VR5AuAKZ9GjcvmmqrCMuKJtuMUj3xZJ2iMQMCWuRD+GpKpnc8O5b4xYMnscXTtJdMsMAA7f9VOJtYG/6zaeIkqc3sWeHEp18XV2LJAMI08t+xA6irL9bUagGmEPgNK7M6sNxwUFiW/m8mGOjlvELqlQmobE/kZu6f/T28+bjBHcF6MbeRE4At7tXCkXm9vpO6lesh/JL9nLhKNKR8SydJZWkpB2aTTrD5hr+NwEPCISlyVeO3H0zl8pm1UiVtKNCPY0nt+lhCkZbTd4Zbl52cOosM6Qp0xc01JU4mSkVpstkYXXnWnLgNHIsy9AKZy/h2klJtgDaNqzHofbTqBWN4SKHP4Rfzs4aCN5GAPhxObM5KI+Jex/ZX5AgyBqIgiv190j8cADxcVgqT8CK191w
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2213edac-1ba4-4ced-8998-08db878cac42
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 12:44:06.0689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CX60RyCCa96JW+b/Qz0SjWi7VHBv3y5BE/j2zN5BhoKTYXw+ZS+eQiY011nNQwUYaBKZJXKEyhC9fHC1os6PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5317

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


