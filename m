Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910006E4503
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 12:18:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521922.810918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poLwF-00018V-Q1; Mon, 17 Apr 2023 10:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521922.810918; Mon, 17 Apr 2023 10:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poLwF-00016P-N1; Mon, 17 Apr 2023 10:18:23 +0000
Received: by outflank-mailman (input) for mailman id 521922;
 Mon, 17 Apr 2023 10:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLV6=AI=citrix.com=prvs=464b9e9d0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1poLwE-00016J-AX
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 10:18:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a47e397-dd09-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 12:18:17 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 06:17:54 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5792.namprd03.prod.outlook.com (2603:10b6:a03:2d5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 10:17:51 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 10:17:51 +0000
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
X-Inumbo-ID: 2a47e397-dd09-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681726697;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xgYB6m8H4+2JzUGAMrR5jV4AES1k4uICgrIo8QMwoV0=;
  b=bcNY1AQ5th4LGS0JEewjQWJSJ80qcysdEx7cyV9RyvpDLs+L8a84z8Jd
   63VuHHu9HwQyuip2TiolsP5+aYJ7TZb75FznKJKHq6JN4etcJsIWlJe3K
   MZrgusK00TiJBQV8jP04xyr8XkH8/Sl6f94kI15pRSsZ3UMGHCXNmH20P
   0=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 104567625
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BW0Jm6uVYPo4tBFLNaP0+SxNpOfnVN9fMUV32f8akzHdYApBsoF/q
 tZmKWmHP6vYZ2bxfN90O47goEgE7ZODytFmHVA4/ChgFCNE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOHySFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBjAQbyumpe+M+42dZddhoOcBF/KwI9ZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIK9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAN5PSuLmrKMCbFu7+nEBVAAwelyH/NriikKXBv5Qd
 RYO9X97xUQ13AnxJjXnZDWGp3qDsg8ZSsBnOeQw4wGQyYLZ+w+cQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAXJ2IfYS4PTSMe/sLu5oo0i3rnUdJLAKOzyNrvFlnYw
 S2OrSU4r6Uei4gMzarT1Uvcnzumq5zNTwg0zgbaRGSo6kV+foHNT5Sh9Fzz/ftGaoGDQTGpv
 3Uams7Y8OEHC7mMkjCARKMGG7TB2hqeGDjVgFoqGoZ78T2ooianZdoJuGk4I1p1OMEZfzOve
 FXUpQ5a+J5UOj2tcLNzZIWyTc8tyMAMCOjYaxwdVfIWCrAZSeNN1HgxDaJM9wgBSHQRrJw=
IronPort-HdrOrdr: A9a23:1PMRDayo1cX7rijREMgaKrPxS+gkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvoRZxRBf7LdUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrXAgWVxRAXVhJI2PMH/X
 LemwL0y62/u7XjoyWsmlP73tBzop/M29FDDMuDhow8LSjtsB+hYMBMSqCPpzc8pcCo8RIPnM
 PXqxktEsxv4zf6f32zozHqxw78uQxeoUPK+Bu9uz/OsMb5TDU1B45ogp9YSALQ7w4FsMtn2K
 xG8mqFv94PZCmw1xjV1pztbVVHh0C0qX0tnao6iGFea5IXbPt0oZYE9E1YPZ8cFGbR6ZwhEs
 NpEMbAjcwmOW+yXjT8hC1C0dasVnM8ElOvRVUDgNWc13xskHVw3yIjtbgit0ZF0Kh4Z4hP5u
 zCPKgtvqpJVNUqYaV0A/pEaderC0TWKCi8cV66EBDCLuUqKnjNo5n47PEe/+exYqEFy5M0hd
 DoTE5Yj2gvYEjjYPf+kqGjyiq9A1lVYA6diP23v/NCy/jBrfvQQGK+oWkV4oudS651OLyeZx
 6xUKgmdsMLY1GeXrqh5DeOK6W6GUNuLvH9hexLKm5mgvi7XbEC5darBsr7Ff7KLQsOfF/ZLz
 8qYAXTTf8wnHxDHEWIzCTsZw==
X-Talos-CUID: =?us-ascii?q?9a23=3A5J3DPGlKN1+1MZKyitIN5KwCyELXOVPd0XbrBm2?=
 =?us-ascii?q?1M11WbpKrRHmz2phfyNU7zg=3D=3D?=
X-Talos-MUID: 9a23:Hfy2qAnAZ1MCi5YoBmnrdnpeKdU0/oKBD3xQss4Gt+DZGSMuYS2S2WE=
X-IronPort-AV: E=Sophos;i="5.99,203,1677560400"; 
   d="scan'208";a="104567625"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Re/kqYardcP4t35yqfmpdIIbwWYeDyQsvk8dMaVAByeOQGYErOsYuvSoHGwR34knm2nMuL3pIEnHO4mSgTzCPIZreLTCf2qpnL6LoeZMjLbf1Je9dpRsHAqdp4FLFQFnmDIhFYwfLTKr0COxva6aDccrr/gSeCzQN6MC8EjgFYiTdUb4pD4ntusAZHmxDJzX93KIu8b02FQyCziloM8X1NrL60nN3OHesUdO0KMfRHV1hc7is5P/oLJ3SU0VEXIC1V/Ulf+RkywZM6a8bt9iXb5RJ6ja5ifh23eZKYxqaHp/FwH0NDp+R8cms770ZezgWcwfnnHcRqoUf4TBXEmhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFFlwTFJ9kF38nuMLMUhPcUJPXsGC/YFQ6fd9bJYm3w=;
 b=Nsej6oODp6AlKsWEhxCcaxoXvJK/kMHKFv4/qJuUZRd9OidZMfeMfuheIXylLwp329tzh3JgXPsIlR1DgIq4tNXoBHkE1pVnwMR5A101kz+gkXoyDXihdgWkhLvElHamsE+YPul4GgC8MYdo3hg3fsUeTuoO5AQCnjkTCRwUdmLGtWFhdESZSnmT1WXsWhqKQSa+RMlx+ruFxxVnceEOM9oMF6T2cpsuPGh81CiiWVwHgRQe0/FeAX4k3bgqjfCMi4YauaOgb1SV/FHRmB8biBkxICdagvC9LeIi+jIFWS1y8huq+uqgDzd3z5p4AC9rK848b+OaAtvUb+7dkuR8Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFFlwTFJ9kF38nuMLMUhPcUJPXsGC/YFQ6fd9bJYm3w=;
 b=TUeRijnrtkmiYLcBj0faKSqJUfGjyVXowdE12Nd5qjZ6DOKBaoBiLnI72g4XJvLdXl1GZALDLzrB6Y15kTy2In+JPDoW/5ol8VPkSDQsN8jB4Q80a/YEJUwAjqlOKDUvemhq2VVCXSmUkyNppuYcWWaQa8ba+x2pf5T+/sggz1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 17 Apr 2023 12:17:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Message-ID: <ZD0cyXLt1knXyUzA@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
 <ZBNA9q5DXJYG3KVp@Air-de-Roger>
 <873556xa0g.fsf@epam.com>
 <ZDZ2S4OxP2e12oSX@Air-de-Roger>
 <87v8i0wyv0.fsf@epam.com>
 <ZDgZEZIG89oW6rEw@Air-de-Roger>
 <87leivw8qp.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87leivw8qp.fsf@epam.com>
X-ClientProxiedBy: LO2P265CA0101.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b0a7b4-e790-4ea8-357e-08db3f2d0007
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VmL0TcFWejjq+/K/WU9yb+BXP/+EWYdtmXX0zlpwYJVlxfv8RdCjyJgUdQx1Deu5w/pzROyPVhXG6X4ejPSkgdaGvETMRdfhVMH7ZeWepamZ67kBuTGfvPT2pMdaMQB76eh8Yf/3iAVDOwHfGLaLpMue3SDiKQ8WuuYL7LiM1qs44Ng5lpx6oUWoWgRtnGwSk2Px7ddHVUDlGQWqFCSUa6Iesz3NxkqLo2LOQ7mMMDEleKOZ7sbnuPOP+AtrGiCb9yJWh6YaSDNfW9vjWGBlZCcX9QiI5f/2KDwPVVS/h3JWQqNqxTysHGQm6dsAn/k053JiOPcmUAWTSyLE7QuxJIJbeWKU2GoKxMbLDF+QdTJL7gigE3Ne075492KiN/jrQHHU37XYGhHDXDFVshIUyw2vaaTv9fBIKvOkzeECKg+Z6jNKZtf90i534MBV9HNOxilUmjBOp+TYtBe0AprNU7TCTPT1wTG1bKed+kx7/0VWZelIKWpUmFPvZLkIc9IRbTx5ZL7pp2VpNJ13dsV7QPHetg1KiqA945yQi+5AAdiZHJDXQdQ7rdpbdEJaxdnR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199021)(26005)(66946007)(186003)(9686003)(6512007)(6506007)(85182001)(41300700001)(54906003)(86362001)(66899021)(83380400001)(6916009)(4326008)(316002)(66476007)(66556008)(2906002)(30864003)(7416002)(8676002)(8936002)(6486002)(6666004)(82960400001)(38100700002)(33716001)(5660300002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHRMQm4zQUtLdDFjWUtCWGNUQjlNaElUQjl3bGdOUWswVEpTcngzNUpIcmFG?=
 =?utf-8?B?WTA3dmdabjRkdmljOGpBYnNNMDMvWlROeDUzejdPOGJnVlIxZkEzZ0R3K01l?=
 =?utf-8?B?MnBneEpOR1haR3FLYVpNQkJKN1AzZndzYlcxK1Y3dW5aUWM5SytvbFpqSzJm?=
 =?utf-8?B?eXIzYzFjUUt3Q2VWZmM1ZlNiNU5xT25DVC9IMklsMGcxRTJYWXJ1Z2crRXcx?=
 =?utf-8?B?SXpLZUZaVU9nd1B1SExTMVhYMHZWdmROUXR1d2pxeUUwMHBXSTcyMndMSmFu?=
 =?utf-8?B?aEZSbVJGdzJCeXdDVTVBKzNaVU5MNFFEWVUvU1IyR0RrYmRaam9jQW9Yd3hm?=
 =?utf-8?B?SDlaSm9qRUJ0RmFQdVYrREJvdVAvWlhOOFRZM25xc0lzSFArc01VWk5yVFBV?=
 =?utf-8?B?eGVRVllVQkQ1YjNpY0NkMnJJRWNRbjRIVElSTU9zWW40QmxaUkZsWlhvWSts?=
 =?utf-8?B?TzZTbjBWVDl3eWtyMmlTb3diWXQvNitSSWhhdzQ4SC9NUHNHREFwUTFQZGdJ?=
 =?utf-8?B?N3piZFNRR2U4LytnZHNMaWhsZmVNYWtHL01yQWFqc2lhQm1TQ2M4Z0hEMGJs?=
 =?utf-8?B?T0MycnFReEMrVTlNb0g2TFBsMUNWUUZMbWNaVGg1MzVJM2NyTmpYcVFCeEVD?=
 =?utf-8?B?UkM2M3JvVi9qUnRRQXVZblhER0FyaGdvRGx4ZTBqbW1hTjZxVWZGMjhFSFUw?=
 =?utf-8?B?RjRCdWswS3hZWk1RWW43Y1dMTGxTK0ViTFlYR1JCYThDY0VRZStXZ3Y1cGIx?=
 =?utf-8?B?OWhGclFtSytYZi8rWGIyb3AwdjFPN2xvU08xUmtnaGxnMmUvUlBTM3Q2OFkr?=
 =?utf-8?B?bUkvaWhuWVU2ZGNXTlZSUWdwbk1RSndMMFU1T1V2cTl2UUtSOHp6SkdFM0Mw?=
 =?utf-8?B?TkZDSGRHbXNxSmt0RVBMTTdac09CV21rV21FT3ZUMnZlSG9OdkNIeGVBYU1m?=
 =?utf-8?B?NlF1Z2d2NmhqSTN1b1ljR2dwUkRMbnVTRlAydGxJUFQ2QWxONWpPNzNGSEZX?=
 =?utf-8?B?T0tBaG5nTVZkYjNjZ0FhOWxWb1hJUVFiV0d0eGxWV3FGQ0dUbUtOWGhxUWJW?=
 =?utf-8?B?d25Wb1VaTjQvNVE2a1Jtak1kVGZ1dElKeXI0N0xyVXNRS1Q1UHp2V3NoRWhP?=
 =?utf-8?B?c3hjUW9oWkpva3pKR1lIL01VRWhncGxWbmtUbkw2ZFo4aXhnTjZ2UHVaakRJ?=
 =?utf-8?B?WHhRaVZXOGtuaDF3cGllc0oyaHQxZ1ZpVGRWNWQxbzlKSng1MzBTbmp3SmRU?=
 =?utf-8?B?d1NDWFJiRmZnajRRd0xuTGhyMVhFbjFoSTVHSWFLTDlNZjhEL0xkK0RyWGN3?=
 =?utf-8?B?SDBDZW9HVnNIRTFYZnlYSmUyL3ZnYTNhSzNSaTlKaDRDMFBtTHZyZHBka3hq?=
 =?utf-8?B?SzZYb0lCa0hJdzVNdU9DT01kVWhuaWZsZU5xMG53YmRPbXIrZHlyNEZVSUhG?=
 =?utf-8?B?aGwyckJGSmVXaVcyYnlaL01EK00zb3Z2bmFiL1RlVURVTW1uOG1YelA4UUVz?=
 =?utf-8?B?VFJGN1BaY0lKSlVTNGY5MlRWOE0yT0ZyVGlTVU1iTnc3dTZKTFRCdFlwa0xL?=
 =?utf-8?B?cmovWlVBR0V6RHhCQnRONldIaXgvVzVKWVVCWjhDNzdrKzJBVDlFY0szbnZC?=
 =?utf-8?B?T0haZ2dld0FiWE1mdXVLN0MwQklGenRmNHRFenpHOENvRE42ZGpxWURnZlE0?=
 =?utf-8?B?QnZnYksvTkJlRndoenZERWh0SW5wY3lUSm5vbi96QWQrOFhOZXFRZ3h5Z2Rm?=
 =?utf-8?B?dlp6Y3AzejU0Q0FaQWtBa1JGNERoOG5MZGx3ME95K3ZBYjNmdHQzNURJTm5J?=
 =?utf-8?B?QUtQS0VSZndyNmdDYnVQbFBjZnIxMGNYVkh6UjFxOHF0N2k1SGdNeFRUTEpD?=
 =?utf-8?B?QlIvQjkxTzJYa3Zpc25vQUFOT2tEbkxtdTMzMUE3MElneEZFWURnYlNaQ1pi?=
 =?utf-8?B?NlI0SzdKNmJZSVFoMmFKSENONmNjNm1NRFY3NTlOOUlYUTNKeUx0Zy96RDhM?=
 =?utf-8?B?WXpVL0RkQVF5V3JRYmZ3ZVlzMmYzZE4rUUhUa2tsQWZPakZyNXY5RDZ3M0o3?=
 =?utf-8?B?TkduVGJzUk5zQW52QThYaHhZSm9kOFVLZGVhWlYrTTVkMlcrVHJnYUo3VVBq?=
 =?utf-8?Q?wz7O27IIoz0uw+KZwGNw4temU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oy3yfYN8ns2iALyLTB3IuBxA9AzblWqmR1uBPU8tLr2CBCArHpV9u9NJMYB3Cbafxs27IN2zxriKyWJA8kwr1cXYqBb7rAs8yxPJjjZy4PevBakq31tffW7m4oTxWNTyvWhy6Rjzf4PA3BQ12WlDN8B81wmL5fxgz1iXgoAnMygvgjpWlmCoTSgKoYj2wfit42hSAD3Ie2Rpp9z5B0creCRPfuppFTfE6zFDtNuZg7Hk7539pvrcuCW6XTNMdgQclz/WSLBQ2rs+Gkh+pZ3J9a6HrJTrsqDr1pFoeZ86zFm4fKwfdzmgzSx5OIZCOh7hox1ZDjw+W1x+L+ODw5ZgGYPLwvf4ExAx8h3LlqVmVo+oqA46RS6hHpWfgYuZ3v91arPJbVrrH1uEEPrllftH0xJMmIvKT8va7Iy7bSqQ5JjScZs/KbYqmASTUXXq52vbYULPX9dQY7RSLXE2nrxGVlkDm+OZednJIKneRCr+7It9vMEYC9cRKqvHQbYvTDiXlOk9gh59B6dskLUffXajUJbq0Z4caRHXo+PYPLUdTSVBhdHQs382wJWfzcn3NYZU/zpXAxrRperi9YaPPPj0Sm6BuoUS9JhQkZVmxI5hd2k9E81Qr0QmwUax6LFXgE3rquy70zCDZhZuRuKYlHOQsjZPWKUtcgu/SQjzOqVijvpQ983BU1vUCWHo5Zqo16hA+j35PHxQEOjoBQPpeT1hRh7v/34LatWFYPewgNlvq5FrIsUr3iAIGxuXkcvxwt9/KhwZaw81oMs8eAIj2+S7CwRoJcgC8Um6i/sQ/m0nax59FDRx0uBFdFHA/f+a3fM0y3ajfggkezZB4heDYuZlPTtDsxXPJyte1Ad0uTgZKvLxOQfMi5FT0LoDqSXyeih+CL+xAkwU9S4PH9qiT4bPPw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b0a7b4-e790-4ea8-357e-08db3f2d0007
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 10:17:51.3334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrifzIEP2+3rx0iBqpRogWKZvgX6ZWejfHLlOMNmihnqHeCzTrqf/4tbj8Xf+0ibsi/MntUEs5BuNzZYUxbEjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5792

On Fri, Apr 14, 2023 at 01:30:39AM +0000, Volodymyr Babchuk wrote:
> 
> Hi Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Wed, Apr 12, 2023 at 09:54:12PM +0000, Volodymyr Babchuk wrote:
> >> 
> >> Hi Roger,
> >> 
> >> First of all, I want to provide link [1] to the RFC series where I tried
> >> total PCI locking rework. After discussing with Jan, it became clear for
> >> me, that task is much harder, than I anticipated. So, it was decided to
> >> move with a smaller steps. First step is to make vPCI code independed
> >> from the global PCI lock. Actually, this is not the first try.
> >> Oleksandr Andrushchenko tried to use r/w lock for this: [2]. But,
> >> Jan suggested to use refcounting instead of r/w locks, and I liked the
> >> idea. So, this is why you are seeing this patch series.
> >
> > Thanks, I've been on leave for long periods recently and I've missed
> > some of the series.
> >
> 
> Did you checked this RFC series? I am not asking you to review it, I am
> just curious about your opinion on the selected approach

I've just taken a look, it seems sensible (locking is complicated).
Splitting a big lock like the pci devs one can lead to all kind of
unexpected races because it was applying serialization to a lot of
operations which would no longer be serialized on the global lock.

Overall it's time we kill pci_devs lock, inevitably this will likely
result in some fallout.  It's important however that we give some
thought to what mode we switch too, as to try to avoid finding
ourselves in a similar situation to where we are now.

> >> 
> >> 
> >> Roger Pau Monné <roger.pau@citrix.com> writes:
> >> 
> >> > On Tue, Apr 11, 2023 at 11:41:04PM +0000, Volodymyr Babchuk wrote:
> >> >> 
> >> >> Hi Roger,
> >> >> 
> >> >> Roger Pau Monné <roger.pau@citrix.com> writes:
> >> >> 
> >> >> > On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
> >> >> >> Prior to this change, lifetime of pci_dev objects was protected by global
> >> >> >> pcidevs_lock(). Long-term plan is to remove this log, so we need some
> >> >> >                                                    ^ lock
> >> >> >
> >> >> > I wouldn't say remove, as one way or another we need a lock to protect
> >> >> > concurrent accesses.
> >> >> >
> >> >> 
> >> >> I'll write "replace this global lock with couple of more granular
> >> >> locking devices"
> >> >> if this is okay for you.
> >> >> 
> >> >> >> other mechanism to ensure that those objects will not disappear under
> >> >> >> feet of code that access them. Reference counting is a good choice as
> >> >> >> it provides easy to comprehend way to control object lifetime.
> >> >> >> 
> >> >> >> This patch adds two new helper functions: pcidev_get() and
> >> >> >> pcidev_put(). pcidev_get() will increase reference counter, while
> >> >> >> pcidev_put() will decrease it, destroying object when counter reaches
> >> >> >> zero.
> >> >> >> 
> >> >> >> pcidev_get() should be used only when you already have a valid pointer
> >> >> >> to the object or you are holding lock that protects one of the
> >> >> >> lists (domain, pseg or ats) that store pci_dev structs.
> >> >> >> 
> >> >> >> pcidev_get() is rarely used directly, because there already are
> >> >> >> functions that will provide valid pointer to pci_dev struct:
> >> >> >> pci_get_pdev(), pci_get_real_pdev(). They will lock appropriate list,
> >> >> >> find needed object and increase its reference counter before returning
> >> >> >> to the caller.
> >> >> >> 
> >> >> >> Naturally, pci_put() should be called after finishing working with a
> >> >> >> received object. This is the reason why this patch have so many
> >> >> >> pcidev_put()s and so little pcidev_get()s: existing calls to
> >> >> >> pci_get_*() functions now will increase reference counter
> >> >> >> automatically, we just need to decrease it back when we finished.
> >> >> >
> >> >> > After looking a bit into this, I would like to ask whether it's been
> >> >> > considered the need to increase the refcount for each use of a pdev.
> >> >> >
> >> >> 
> >> >> This is how Linux uses reference locking. It decreases cognitive load
> >> >> and chance for an error, as there is a simple set of rules, which you
> >> >> follow.
> >> >> 
> >> >> > For example I would consider the initial alloc_pdev() to take a
> >> >> > refcount, and then pci_remove_device() _must_ be the function that
> >> >> > removes the last refcount, so that it can return -EBUSY otherwise (see
> >> >> > my comment below).
> >> >> 
> >> >> I tend to disagree there, as this ruins the very idea of reference
> >> >> counting. We can't know who else holds reference right now. Okay, we
> >> >> might know, but this requires additional lock to serialize
> >> >> accesses. Which, in turn, makes refcount un-needed.
> >> >
> >> > In principle pci_remove_device() must report whether the device is
> >> > ready to be physically removed from the system, so it must return
> >> > -EBUSY if there are still users accessing the device.
> >> >
> >> > A user would use PHYSDEVOP_manage_pci_remove to signal Xen it's trying
> >> > to physically remove a PCI device from a system, so we must ensure
> >> > that when the hypervisor returns success the device is ready to be
> >> > physically removed.
> >> >
> >> > Or at least that's my understanding of how this should work.
> >> >
> >> 
> >> As I can see, this is not how it is implemented right
> >> now. pci_remove_device() is not checking if device is not assigned to a
> >> domain. Id does not check if there are still users accessing the
> >> device. It just relies on a the global PCI lock to ensure that device is
> >> removed in an orderly manner.
> >
> > Right, the expectation is that any path inside of the hypervisor using
> > the device will hold the pcidevs lock, and thus bny holding it while
> > removing we assert that no users (inside the hypervisor) are left.
> >
> 
> May I proposed a bit relaxed assertion? "We assert that no users that
> access the device are left". What I am trying is say there, that no one
> will try to access, say, device's config space. Because the device
> already may be physically removed and any access to the device itself
> will cause a fault. But there may be users that can access struct pdev
> that corresponds to this device.

Isn't holding a reference to the pdev a sign that it's PCI config
space might be accessed?

> > I don't think we have been very consistent about the usage of the
> > pcidevs lock, and hence most of this is likely broken.  Hopefully
> > removing a PCI device from a system is a very uncommon operation.
> >
> >> My patch series has no intention to change this behavior. All what I
> >> want to achieve - is to allow vpci code access struct pdev objects
> >> without holding the global PCI lock. 
> >
> > That's all fine, but we need to make sure it doesn't make things worse
> > and what they currently are, and ideally it should make things easier.
> >
> > That's why I would like to understand exactly what's the purpose of
> > the refcount, and how it should be used.  The usage of the refcount
> > should be compatible with the intended behaviour of
> > pci_remove_device(), regardless of whether the current implementation
> > is not correct.  We don't want to be piling up more broken stuff on
> > top of an already broken implementation.
> >
> 
> I agree with you. I'll fix the issue with vPCI, that you mentioned below
> and prepare more comprehensive commit description in the next version.
> 
> >> >> >
> >> >> > That makes me wonder if for example callers of pci_get_pdev(d, sbdf)
> >> >> > do need to take an extra refcount, because such access is already
> >> >> > protected from the pdev going away by the fact that the device is
> >> >> > assigned to a guest.  But maybe it's too much work to separate users
> >> >> > of pci_get_pdev(d, ...); vs pci_get_pdev(NULL, ...);.
> >> >> >
> >> >> > There's also a window when the refcount is dropped to 0, and the
> >> >> > destruction function is called, but at the same time a concurrent
> >> >> > thread could attempt to take a reference to the pdev still?
> >> >> 
> >> >> Last pcidev_put() would be called by pci_remove_device(), after removing
> >> >> it from all lists. This should prevent other threads from obtaining a valid
> >> >> reference to the pdev.
> >> >
> >> > What if a concurrent user has taken a reference to the object before
> >> > pci_remove_device() has removed the device from the lists, and still
> >> > holds it when pci_remove_device() performs the supposedly last
> >> > pcidev_put() call?
> >> 
> >> Well, let's consider VPCI code as this concurrent user, for
> >> example. First, it will try to take vpci->lock. Depending on where in
> >> pci_remov_device() there will be three cases:
> >> 
> >> 1. Lock is taken before vpci_remove_device() takes the lock. In this
> >> case vpci code works as always
> >> 
> >> 2. It tries to take the lock when vpci_remove_device() is already locked
> >> this. In this case we are falling to the next case:
> >> 
> >> 3. Lock is taken after vpci_remove_device() had finished it's work. In this
> >> case vPCI code sees that it was called for a device in an invalid state
> >> and exits.
> >
> > For 2) and 3) you will hit a dereference, as the lock (vpci->lock)
> > would have been freed by vpci_remove_device() while a concurrent user
> > is waiting on pci_remov_device() to release the lock.
> >
> > I'm not sure how the user sees the device is in an invalid state,
> > because it was waiting on a lock (vpci->lock) that has been removed
> > under it's feet.
> >
> > This is an existing issue not made worse by the refcounting, but it's
> > not a great example.
> >
> 
> Yes, agree. I am going to move vpci->lock to the upper level
> (pdev->vpci_lock) and rework vPCI code so it will gracefully handle
>  pdev->vpci == NULL.

We likely need to so something along this lines.

> >> 
> >> As you can see, there is no case where vPCI code is running on an device
> >> which was removed.
> >> 
> >> After vPCI code drops refcounter, pdev object will be freed once and for
> >> all. Please node, that I am talking about pdev object there, not about
> >> PCI device, because PCI device (as a high-level entity) was destroyed by
> >> pci_remove_device(). refcount is needed just for the last clean-up
> >> operations.
> >
> > Right, but pci_remove_device() will return success even when there are
> > some users holding a refcount to the device, which is IMO undesirable.
> >
> > As I understand it the purpose of pci_remove_device() is that once it
> > returns success the device can be physically removed from the system.
> >
> 
> Yes, I totally agree with you. By saying "the device can physically removed
> from the system" we are asserting that no one will try to access this
> device via PCI bus. But this is not the same as "no one shall access
> struct pdev fields as it should be freed immediately".

I kind of view those two linked together, a user holding a ref to a
pdev might access it's pci config space.  It's still possible for some
callers to access the PCI condig space of a device as long as the SBDF
is known, but still it feels wrong to return from pci_remove_device()
while the pdev hasn't been fully purged from the hypervisor.

The more complex we make this handling the more likely to introduce
errors in the long term. IMO I think it's easier to reason about
device state if we make pci_remove_device() authoritative wrt any uses
of the related pdev inside the hypervisor.

> >> >
> >> >> >
> >> >> >>          sbdf.devfn &= ~stride;
> >> >> >>          pdev = pci_get_pdev(NULL, sbdf);
> >> >> >>          if ( pdev && stride != pdev->phantom_stride )
> >> >> >> +        {
> >> >> >> +            pcidev_put(pdev);
> >> >> >>              pdev = NULL;
> >> >> >> +        }
> >> >> >>      }
> >> >> >>  
> >> >> >>      return pdev;
> >> >> >> @@ -548,13 +526,18 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
> >> >> >>          list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> >> >> >>              if ( pdev->sbdf.bdf == sbdf.bdf &&
> >> >> >>                   (!d || pdev->domain == d) )
> >> >> >> +            {
> >> >> >> +                pcidev_get(pdev);
> >> >> >>                  return pdev;
> >> >> >> +            }
> >> >> >>      }
> >> >> >>      else
> >> >> >>          list_for_each_entry ( pdev, &d->pdev_list, domain_list )
> >> >> >>              if ( pdev->sbdf.bdf == sbdf.bdf )
> >> >> >> +            {
> >> >> >> +                pcidev_get(pdev);
> >> >> >>                  return pdev;
> >> >> >> -
> >> >> >> +            }
> >> >> >>      return NULL;
> >> >> >>  }
> >> >> >>  
> >> >> >> @@ -663,7 +646,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> >> >> >>                              PCI_SBDF(seg, info->physfn.bus,
> >> >> >>                                       info->physfn.devfn));
> >> >> >>          if ( pdev )
> >> >> >> +        {
> >> >> >>              pf_is_extfn = pdev->info.is_extfn;
> >> >> >> +            pcidev_put(pdev);
> >> >> >> +        }
> >> >> >>          pcidevs_unlock();
> >> >> >>          if ( !pdev )
> >> >> >>              pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
> >> >> >> @@ -818,7 +804,9 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
> >> >> >>              if ( pdev->domain )
> >> >> >>                  list_del(&pdev->domain_list);
> >> >> >>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
> >> >> >> -            free_pdev(pseg, pdev);
> >> >> >> +            list_del(&pdev->alldevs_list);
> >> >> >> +            pdev_msi_deinit(pdev);
> >> >> >> +            pcidev_put(pdev);
> >> >> >
> >> >> > Hm, I think here we want to make sure that the device has been freed,
> >> >> > or else you would have to return -EBUSY to the calls to notify that
> >> >> > the device is still in use.
> >> >> 
> >> >> Why? As I can see, pdev object is still may potentially be accessed by
> >> >> some other CPU right now. So pdev object will be freed after last
> >> >> reference is dropped. As it is already removed from all the lists,
> >> >> pci_dev_get() will not find it anymore.
> >> >> 
> >> >> Actually, I can't see how this can happen in reality, as VPCI, MSI and
> >> >> IOMMU are already deactivated for this device. So, no one would touch it.
> >> >
> >> > Wouldn't it be possible for a concurrent user to hold a reference from
> >> > befoe the device has been 'deactivated'?
> >> >
> >> 
> >> Yes, it can hold a reference. This is why we need additional locking to
> >> ensure that, say, pci_cleanup_msi() does not races with rest of the MSI
> >> code. Right now this is ensured by then global PCI lock.
> >> 
> >> >> >
> >> >> > I think we need an extra pcidev_put_final() or similar that can be
> >> >> > used in pci_remove_device() to assert that the device has been
> >> >> > actually removed.
> >> >> 
> >> >> Will something break if we don't do this? I can't see how this can
> >> >> happen.
> >> >
> >> > As mentioned above, once pci_remove_device() returns 0 the admin
> >> > should be capable of physically removing the device from the system.
> >> >
> >> 
> >> This patch series does not alter this requirement. Admin is still
> >> capable of physically removing the device from the system. After
> >> successful call to the pci_remove_device()
> >
> > Indeed, but there might be users in the hypervisor still holding a
> > reference to the pdev.
> >
> 
> reference counting alone can't protect you from this
> situation. Additional locking is required in this case. And right now we
> have the global PCI lock that protects us. Actually, almost all the code
> takes and drops references while holding the global PCI lock. Only one
> exception, as far as I know, is the vPCI code. Which I am going to fix
> in the next version.

But it would IMO be fine to just return -EBUSY if pci_remove_device()
doesn't drop the last reference (and thus the pdev is not yet
removed).

I'm not saying that pci_remove_device() must unconditionally remove
the pdev, but that whe nnot doing so it should return -EBUSY and the
caller will have to try.

I'm not the maintainer, so maybe Jan has other opinions about this, I
will let him comment, as I don't want to enforce something without
having agreement.

> Also, I'll double check that only vPCI code obtains references while not
> holding the global lock. My reasoning is the following:
> 
> 1. Right now (i.e. on staging branch) all accesses to pdevs are
> in consistent state. This basically means that all code that access
> pdevs is doing this while holding an appropriate lock. Global PCI lock,
> in most cases.

The only appropriate lock should be the pci_devs lock if we want to
prevent device removal.

> This means the following: pdev can't disappear under our
> feet, no one racing with us while accessing the pdev, no new pdev can be
> created while we are holding the global PCI lock.
> 
> 2. Adding reference counting alone changes nothing in this
> regard. Actually, PCI code will needlessly increase/decrease an atomic
> while holding the global lock.
> 
> 3. As all work with PCI devices is done while holding the lock, we can
> assert that reference count at the beginning of a critical section will
> be equal to reference count at the end of a critical section, because
> my patch add _put to the every _get all across the hypervisor, with a
> few notable exceptions:
> 
> 3.1. pci_add_device() will initialize a device and set reference count
> to 1
> 
> 3.2. pci_remove_device() will de-initialize a device and decrease
> reference count by 1. I can assert, that if p.1 is true and I didn't
> messed up with balancing _gets/_puts in other parts of the code, then
> pci_remove_device() will always remove the last reference. This may (and
> will) change in the future.
> 
> 3.3. MSI code holds long-term pointers to pdev, so
> msi[x]_capability_init() does additional _get() and then
> `msi_free_irq()` does corresponding _put(). Luckily for us,
> pci_remove_device() calls pci_cleanup_msi() so we can be sure that does
> not break assertion in p.3.2

Doesn't by the same logic assign device to a domain also take an extra
reference because it's adding the pdev to a domain private list?  (ie:
much like MSI storing the pointer to the pdev).

And then for MSI-X it feels like we should be taken a reference for
each msi_desc entry in use, since each one contains a pointer to the
pdev.

> 4. Now, we want vPCI code to be able to access PCI devices without
> holding the global PCI lock the whole time. This is where we can
> leverage reference counting. Here are the assertions:
> 
> 4.1. vPCI code gets pdev pointer only via pci_get_pdev() function, which
> reads from a list while holding the global PCI lock. That means that
> pci_get_pdev() will return NULL after pci_remove_device() deletes the
> device from all lists. Also, that means that vPCI code can't get pdev
> while pci_remove_device() is running, because pci_remove_device() is
> holding the global PCI lock.

What if it gets the pointer just before pci_remove_device() runs?

It can't get the pointer while pci_remove_device() is running, but
could get it just before.

> 4.2. vPCI code will always acquire pdev->vpci_lock before accessing
> pdev->vpci
> 
> 4.3. pci_remove_device() will de-init vpci state while holding
> pdev->vpci_lock
> 
> 4.4. vPCI code will not try to access PCI device if pdev->vpci == NULL
> 
> 4.5. vPCI code will access only vpci-related fields in struct pdev

That's not currently true, vPCI does make extensive use of pdev->sbdf
for example.  It does also cause changes in the MSI(-X) state, albeit
not directly but through helpers.

> 
> 4.6. vPCI does not depends and does not alter non-vPCI-related state of a PCI
> device. This is the most tricky part, because most of the remaining state is
> protected by the global PCI lock, which we are not holding. That means,
> that we need to disable vPCI while re-assigning the PCI device to
> another domain. As I can see, this is the only place where vPCI depends
> on more broader PCI device state.

Device re-assigning should cause all previous vPCI state to be torn
down and re-created when assigned to a different domain.  For once we
need to do this in order to clear any internal state, but we also must
do so because the initial setup (as done by init_bars for example) can
be different depending on whether the owner domain is a domU or dom0.

> This approach will not interfere with pci_remove_device() obligations,
> because we can be sure that right now vPCI is the only user that can
> hold reference counter past pci_remove_device() call and that vPCI code
> will not attempt to access to PCI device after end of , thus, allowing admin to
> physically remote the device.
> 
> In the future, we can gradually remove other parts of the PCI code from under
> the global PCI lock, providing we can give the same guarantees as p 4.1-4.6

I appreciate you doing all this analysis and reasoning. IMO having to
write a page long justification should really get us worried about the
locking scheme we are using being far too complex and difficult to
follow.  Again not your fault, it's just how things currently are.

> >> >> >> -static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
> >> >> >> +static int assign_device(struct domain *d, struct pci_dev *pdev, u32 flag)
> >> >> >>  {
> >> >> >>      const struct domain_iommu *hd = dom_iommu(d);
> >> >> >> -    struct pci_dev *pdev;
> >> >> >> +    uint8_t devfn;
> >> >> >>      int rc = 0;
> >> >> >>  
> >> >> >>      if ( !is_iommu_enabled(d) )
> >> >> >> @@ -1422,10 +1412,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
> >> >> >>  
> >> >> >>      /* device_assigned() should already have cleared the device for assignment */
> >> >> >>      ASSERT(pcidevs_locked());
> >> >> >> -    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
> >> >> >>      ASSERT(pdev && (pdev->domain == hardware_domain ||
> >> >> >>                      pdev->domain == dom_io));
> >> >> >>  
> >> >> >> +    devfn = pdev->devfn;
> >> >> >> +
> >> >> >>      /* Do not allow broken devices to be assigned to guests. */
> >> >> >>      rc = -EBADF;
> >> >> >>      if ( pdev->broken && d != hardware_domain && d != dom_io )
> >> >> >> @@ -1460,7 +1451,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
> >> >> >>   done:
> >> >> >>      if ( rc )
> >> >> >>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
> >> >> >> -               d, &PCI_SBDF(seg, bus, devfn), rc);
> >> >> >> +               d, &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
> >> >> >>      /* The device is assigned to dom_io so mark it as quarantined */
> >> >> >>      else if ( d == dom_io )
> >> >> >>          pdev->quarantine = true;
> >> >> >> @@ -1595,6 +1586,9 @@ int iommu_do_pci_domctl(
> >> >> >>          ASSERT(d);
> >> >> >>          /* fall through */
> >> >> >>      case XEN_DOMCTL_test_assign_device:
> >> >> >> +    {
> >> >> >> +        struct pci_dev *pdev;
> >> >> >> +
> >> >> >>          /* Don't support self-assignment of devices. */
> >> >> >>          if ( d == current->domain )
> >> >> >>          {
> >> >> >> @@ -1622,26 +1616,36 @@ int iommu_do_pci_domctl(
> >> >> >>          seg = machine_sbdf >> 16;
> >> >> >>          bus = PCI_BUS(machine_sbdf);
> >> >> >>          devfn = PCI_DEVFN(machine_sbdf);
> >> >> >> -
> >> >> >>          pcidevs_lock();
> >> >> >> -        ret = device_assigned(seg, bus, devfn);
> >> >> >> +        pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
> >> >> >> +        if ( !pdev )
> >> >> >> +        {
> >> >> >> +            printk(XENLOG_G_INFO "%pp non-existent\n",
> >> >> >> +                   &PCI_SBDF(seg, bus, devfn));
> >> >> >> +            ret = -EINVAL;
> >> >> >> +            break;
> >> >> >> +        }
> >> >> >> +
> >> >> >> +        ret = device_assigned(pdev);
> >> >> >>          if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
> >> >> >>          {
> >> >> >>              if ( ret )
> >> >> >>              {
> >> >> >> -                printk(XENLOG_G_INFO "%pp already assigned, or non-existent\n",
> >> >> >> +                printk(XENLOG_G_INFO "%pp already assigned\n",
> >> >> >>                         &PCI_SBDF(seg, bus, devfn));
> >> >> >>                  ret = -EINVAL;
> >> >> >>              }
> >> >> >>          }
> >> >> >>          else if ( !ret )
> >> >> >> -            ret = assign_device(d, seg, bus, devfn, flags);
> >> >> >> +            ret = assign_device(d, pdev, flags);
> >> >> >> +
> >> >> >> +        pcidev_put(pdev);
> >> >> >
> >> >> > I would think you need to keep the refcount here if ret == 0, so that
> >> >> > the device cannot be removed while assigned to a domain?
> >> >> 
> >> >> Looks like we are perceiving function of refcnt in a different
> >> >> ways. For me, this is the mechanism to guarantee that if we have a valid
> >> >> pointer to an object, this object will not disappear under our
> >> >> feet. This is the main function of krefs in the linux kernel: if your
> >> >> code holds a reference to an object, you can be sure that this object is
> >> >> exists in memory.
> >> >> 
> >> >> On other hand, it seems that you are considering this refcnt as an usage
> >> >> counter for an actual PCI device, not "struct pdev" that represent
> >> >> it. Those are two related things, but not the same. So, I can see why
> >> >> you are suggesting to get additional reference there. But for me, this
> >> >> looks unnecessary: the very first refcount is obtained in
> >> >> pci_add_device() and there is the corresponding function
> >> >> pci_remove_device() that will drop this refcount. So, for me, if admin
> >> >> wants to remove a PCI device which is assigned to a domain, they can do
> >> >> this as they were able to do this prior this patches.
> >> >
> >> > This is all fine, but needs to be stated in the commit message.
> >> >
> >> 
> >> Sure, I will add this.
> >> 
> >> >> The main value of introducing refcnt is to be able to access pdev objects
> >> >> without holding the global pcidevs_lock(). This does not mean that you
> >> >> don't need locking at all. But this allows you to use pdev->lock (which
> >> >> does not exists in this series, but was introduced in a RFC earlier), or
> >> >> vpci->lock, or any other subsystem->lock.
> >> >
> >> > I guess I was missing this other bit about introducing a
> >> > per-device lock, would it be possible to bundle all this together into
> >> > a single patch series?
> >> 
> >> As I said at the top of this email, it was tried. You can check RFC at [1].
> >> 
> >> >
> >> > It would be good to place this change together with any other locking
> >> > related change that you have pending.
> >> 
> >> Honestly, my main goal is to fix the current issues with vPCI, so ARM
> >> can move forward on adding PCI support for the platform. So, I am
> >> focusing on this right now.
> >
> > Thanks, we need to be careful however as to not accumulate more
> > bandaids on top just to workaround the fact that the locking we have
> > regarding the pci devices is not suitable.
> >
> > I think it's important to keep all the usages of the pci_dev struct in
> > mind when designing a solution.
> >
> > Overall it seems like might help vPCI on Arm, I think the only major
> > request I have is the one related to pci_remove_device() only
> > returning success when there are not refcounts left.
> 
> Above I have proposed another view on this. I hope, it will work for
> you. Just to reiterate, idea is to allow "harmless" refcounts to be left
> after returning from pci_remove_device(). By "harmless" I mean that
> owners of those refcounts will not try to access the physical PCI
> device if pci_remove_device() is already finished.

I'm not strictly a maintainer of this piece code, albeit I have an
opinion.  I will like to also hear Jans opinion, since he is the
maintainer.

Thanks, Roger.

