Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336AB6AC38D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 15:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506985.780218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZC1F-0006Ao-R7; Mon, 06 Mar 2023 14:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506985.780218; Mon, 06 Mar 2023 14:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZC1F-00067z-NR; Mon, 06 Mar 2023 14:40:53 +0000
Received: by outflank-mailman (input) for mailman id 506985;
 Mon, 06 Mar 2023 14:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnE+=66=citrix.com=prvs=4220c523c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pZC1E-00067t-RA
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 14:40:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e209d77e-bc2c-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 15:40:50 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Mar 2023 09:40:40 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5924.namprd03.prod.outlook.com (2603:10b6:303:9a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 14:40:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6156.021; Mon, 6 Mar 2023
 14:40:37 +0000
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
X-Inumbo-ID: e209d77e-bc2c-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678113650;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uqrRXM5v1oGuAk0rGYx1QEqHrxzyWuFRlFZFAWmvISc=;
  b=Jk2IMpp1FU2ZYt8kpioTDUfVBw+fPk9eS+qSWjHARgTXNq+hiXCFW5tv
   E00kXZ7QFVlLlDYOrT3eETC8cWxDTy9wn9TUXIgBDrgO3V/JlIVZVHghU
   JIN+vCJNON6EEbYVAoDEYiOpzsrKNjkdGEcDQJoUOzZA2+qBqk1KjVjts
   I=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 99066451
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:W8Yx46gkoOu0P5yH7WIfPUHMX161eREKZh0ujC45NGQN5FlHY01je
 htvWm+FOvfcZmP8KNwgbIWxoBhU7JDXm9dmGVE/rig9EX8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5weAzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ1LRpXYyKGwN6y2aCYS7Ux2ekaC9vkadZ3VnFIlVk1DN4AaLWaGuDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluGzYLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6RezgqKA23QT7Kmo7JTQTU2ei/f2ChmH9VclVL
 hUu9Cwuov1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebT011
 HeZktXxHzttvbaJD3WH+d+pQSiaPCEUKSoIY38CRA5cut37+tht3lTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:PX26IK7TdMhJ2tWV5gPXwdWCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HnBEDyewK5yXcT2/htAV7CZnidhILMFu1fBOTZsl7d8kHFh5ZgPO
 JbAtND4b7LfCZHZKTBgDVQeuxIqLfnzEnrv5am854Ed3AUV0gK1XYdNu/0KDwQeOALP+taKH
 LKjfA32wZINE5nJvhSQRI+Lpr+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd8gYCXyhJybIC93
 GAtwDi/K2sv9yy1xeZjgbonthrseqk7uEGKN2Hi8ATJDmpogG0ZL55U7nHkCEprPqp4FMKls
 CJhxs7Jcx8517YY2nwixrw3AvL1ioo9hbZuBKlqEqmhfa8aCMxCsJHi44cWhzF63A4tNU59K
 5QxWqWu7deEBuFxU3GlpL1fiAvsnDxjWspkOYVgXAaeYwCaIVJpYha2E9OCp8PEA/z9YhiOu
 hzC8P34upQbDqhHjvkl1gq5ObpcmU4Hx+ATERHksuJ0wJOlHQ89EcczNx3pAZ2yLsND71/o8
 jUOKVhk79DCuUMa7hmOesHScyrTkTQXBPlKgupUBTaPZBCH0iIh4/84b0z6u3vUocP1oEOlJ
 PIV04dnXIuenjpFdaF0PRwg1HwqV2GLHbQI/xllt1EUuWWfsuuDcTDciFhryKYmYRdPiWBMM
 zDf66/AJfYXB/T8MhyrkvDsqJpWAojuf0uy6cGsm2107L2w63Rx5rmmaXoVfPQOAdhfF/DKV
 0+exW2DPl8zymQKwrFaV7qKjzQRnA=
X-IronPort-AV: E=Sophos;i="5.98,238,1673931600"; 
   d="scan'208";a="99066451"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGl/Q4sGqb1YWiOIEtm4cRH/6XWsTuwG3w1KAiRUkV2Q8bAXqTithlkfey8XMP7TA+76sT4UL/15B9B20Xoz3F9W3Mk4rt5bXhHrosddvUBRdV2XoYCIr8wtTL3wdX1X1ROMh9xhjQVDopT36bOqgDxL0rwgUDMcWXlR4MrYVkstQDVy1bLLVYRxCrNSkiYM9WyrJjv0ewHsYyqOTHD9IgouIALOkZvd/HDbqkZsA1UVxpgPGWvhvuKUk/uXGGYwdPPQ6IV8eLK5uKDhTNpLmNtbR87g+nT/s1Mkl9PkYztHQGXmVmG5zAO+u5L1gLp2yNIA8EFZ/tXosbOxNj4I7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqrRXM5v1oGuAk0rGYx1QEqHrxzyWuFRlFZFAWmvISc=;
 b=kg2eHCPTB/nQQDlLqPlR/VT/bx19fzpQHpZnibYMxY/FLEiKx3aLk4LmcmVDsJrqPbrtxsaCQSwOt6QLc+3ur2wqcCbzvGIgHyX8ZHEpJDiEiU/X1RgV8cDsgt8hYIH9GQIPEaCKCbk6NAaOKb0BOGBrCDw/AmJt0BCk3A2UVx06kZg4eQNfqEI+rTnU0Gwa/npjgx1vAL5/Xjr7rqp75N5rFYAb5lWYt6olKg4+rtmF6ihUtmjYg6LoWIhhsCO9dXVl6PySiGu6Pobdtc62LwW9bAsmdW7gsefeow0LUBahHDpGlf+eSmgVuAs4/LxOy0D7rLF4q4LkZMhKZp6/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqrRXM5v1oGuAk0rGYx1QEqHrxzyWuFRlFZFAWmvISc=;
 b=STHRWk9VZ+j+vVbRWIUOue1rw2rfDhJKu5ARqAMcik22p+QaXOd+RUQ4GbURTQDAL33wnyw8IU4HrbQ9Lkq7/zIYoa6p8d2T56mZtr2XBVTAmc10nUqcwtMpa9NYoO98mhFoyQm1kUnn+jgj5yEXgVHGUqu+aFQIaXseWfPs2t4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8b21128c-4d48-0834-ffe6-452dc395e5c9@citrix.com>
Date: Mon, 6 Mar 2023 14:40:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OSSTEST PATCH] ap-common: Fix qemu.git URL
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
References: <20230306135731.43329-1-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230306135731.43329-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b814c74-c365-4add-506e-08db1e50bfc5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2Bqj6oopAxwQno+Xiau/FV2ah7IhWxgMYOBzU81h5ppgoha8aR0rYPt4aDs4vn3fKPDxB4iHPvsBa5McP5jYbqJw8cyESVvBoelZFf3qTgCJFxjFDthZrMG184u+jA9hoo8+DGA8ZXFPKncGFkwAtk7/u6khX/14+/8MJHFxqzHG7zFRHgSk8ZJ5y+7syuCQzwsjY6iL3KwiJvBB+Oers67TBQ1+XCLW7bvrTh5gwWDXvLitPl851yOHG24SIHI0twd//QdZ2ap55Z6Pndc2AZNFlMS5trtWDjpV1+18qnw/UgMK7ccEKi8EXu22do8R80RldmyuxDcadrYPV3ZL0KXC34gUr42QWXqop3WYBuWflaBwKz6mySHK1ixF9QAfqxWiGLUN35WdLYZYH3evaDMEzLVFNzTxJbQf0lY78S+Ln46ntRCmBMXctsaIKRmIGU/hHmRGzLqzeon1iW6vv8lOuubzGOmabBbahqeGIpVaBJM0zvD9VyBar2IzQsQtYaiPL+sLttxhjXLOGvJMQt6PJYvP5wTTnnSL/gkjP0VMBysWV3eiIzC1wm5AAVlYrR9Tv+hdV5FTxEQLhZAWCLtlMLHVtlP08TAiOZAnkTq1ZzdZJy07N6ZP6XRXsQG9wek5ChxngOY5pSpIfI5IzMvPoeI8Wn8y02a1ZwqO1BPYU6qa3cqg/v2pP0D4HJkDFz8A/fUuA2NjAujwEQxYwq0kDzLFlcvCu1XYxpG3JIY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199018)(6506007)(6512007)(53546011)(6486002)(107886003)(6666004)(36756003)(86362001)(31696002)(82960400001)(38100700002)(186003)(2616005)(26005)(41300700001)(66946007)(66556008)(66476007)(8676002)(4326008)(2906002)(31686004)(4744005)(8936002)(5660300002)(478600001)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTY1OUc3ekR5SlI3emtrdlBlbzllV2lwbW5rL2xsNGhpSlZWZnMrSitYSFds?=
 =?utf-8?B?enFQOFM4U1lSSkdWcFNqYkpzc0RNaUVqMDZFblVJM0V4UnkvUHlpY0lBcW5K?=
 =?utf-8?B?WDI0TlR2OHJTRmdhS05RUWFrdEVxdHQxR241VjZReVh0a3VmcUtvWlVyZHVj?=
 =?utf-8?B?dUxQdk5hNWFXSGV2YmxQNExwYnF6enlIckpmWm0rSlAwTjNkYjA4bnQvV1Aw?=
 =?utf-8?B?bk9PWVBMeEdUSWZ5NTJ6YmNLUVpBRGtQbnVvV2QvWWhkUGZMZERwZkpIdk1R?=
 =?utf-8?B?V01tTjc3YWNHV3dubVRLYjI1dUUweTE1SHhvRGsxcVd5VERKRnBNRmhPVGk5?=
 =?utf-8?B?M0xBMzB0L1Z6RXBNdEpDTjNWai9UVW8waVZsb1B3SEFEb0I3aENDdXFzUitN?=
 =?utf-8?B?ZzdKdEN5OGpBL1BYZ3RFNGJlamk0TXdMVEJEZzlQRXI0ZmJkUEh4SzRuR1V2?=
 =?utf-8?B?YU5reCszZFMwb2NWWllyTDJPRVlINE1WWjNiWE5tdnFvTW1Gc1dJR0pHRitO?=
 =?utf-8?B?QW9iUmRnWmZqc05sbEJUdmVOT3p1YzUrcGQ0enBqZUl0OHhKNTN5LzBvTm5u?=
 =?utf-8?B?RjF6QmhlVm1zL2FwZlVIc1RMTjZsOGJHZVB3c2s3dGN5bWRoSkloTUZTVUNH?=
 =?utf-8?B?Unhjc2QvRTlNbUpkYXhKMW1MRWwvanFTTjQvTHZxYmhjdkx0ZmNHaUhEcGNM?=
 =?utf-8?B?ZkZGVTYvb0laeDhiWXlEN0NWUnRpWlNqSDNyT0RjajdsRWlSOXVhUU10ejZN?=
 =?utf-8?B?NTJqd3JhM1VhL2V3UW1VcEFrWkN4WGdyRXNEZlVlanRaVml1Q214NDFRT3Bw?=
 =?utf-8?B?OVh2NkFONTVDbldRR2QxOXNKQk90a0Y3STBvd1BaM1pheVBqazR0NkZqbkFO?=
 =?utf-8?B?a01CWkg1b3hZeEFmSFJxck9Ha0pIb3ordmg3eWgvTng5NUp0Z3dHc2VkMlE3?=
 =?utf-8?B?aGcvRUpRT3RTdXBVaXNDM0dXdElwcjM2VEJEeHF4T3dwazZzRDRqVmFkMEJR?=
 =?utf-8?B?R1NqaEllNmlYNGhGOHdCNCttcStYaXY3eXNzNFIzMWY2L2RHcnBLMzROMFl0?=
 =?utf-8?B?MkxlelRkNjFkNFE3RGpSb29QN3J5WUd3eG5tTER5Ui9yUVFFZ0lzZDNjOEhW?=
 =?utf-8?B?QzdsNkh2T0NqS20ybDdPclc3dW1FSFFUTzl0YzhuSDZtNVR6aUVCOGptOHVC?=
 =?utf-8?B?aWlMV0x5MmRUaTN0QjNCZTZRVDhlRWJLNUNMU0xNZUVDMzFFblJublpDYU5u?=
 =?utf-8?B?TktzNFN4QmMybnNJNWxLYldWN3IxWDUrWWVJL3ZITzNuTDRFSXE1VXRibFVQ?=
 =?utf-8?B?N2JoZ25qbnJqblBYV1g2VVlMMjRkNitkY0tFTTN0N2hsKy9DUmRId01pblFE?=
 =?utf-8?B?MXFNNWZlczVUMHZrMWNJZ3M4VGN0YzViLzZmR3J1eGF2Z1hDenVRM3lmMXNy?=
 =?utf-8?B?OThCUko0SU5FZldnb2FhQmF5VlBwZkkwRGY2ZG0zTndKK1hZRCtZWnBQMVBN?=
 =?utf-8?B?dUVhbkJXOXdxYzZUNHY4V1hMY1M1Unl2MkJCVExxeXNDeUg1bThqR3BUcTIz?=
 =?utf-8?B?bittbDBBNGZjTmRLUG85UUtycXdXbzVtUE9CQmx5WW9UU3dNVytDWEtYUnY1?=
 =?utf-8?B?dU9CUDdvTnY3ZUV1QzFLMi9SMk5pS2ExdExHSTBWbzF4c2wvemhoMGZRSXo1?=
 =?utf-8?B?bE1XR3E4MGk0WXhNa2lhd2lSbzRKd0g3THJLb1lEek42Ty9CUDR0eVNDdTJq?=
 =?utf-8?B?UlE4R05FZ2dvZ3hIZTJ1ZEtPaWxTaVlLZkhiUXN4elAxMm5vK0hzNFpKTHhi?=
 =?utf-8?B?VHNrclYrdnBxLzROTFE3c2dKdWJzYW5uYnR4cXJVc09LcGllWGxtQkF6d0kw?=
 =?utf-8?B?aEFSNWUrcmxjNGFYTkFWV29Pc2VKaGoxeVlsZHhMSExIdXQ1VXBiKzhEQ3A4?=
 =?utf-8?B?U0ZvYWxzVVQ3MlBmcDRpaG5nd25nYXJyVGJJRWM1UXplTGhpOFE2QnIzWVgx?=
 =?utf-8?B?MXVSNlo0d0lwdEw3SHFhMEZxR21nZXczQkhRVjcwdUhaSTVKMVBPQ1BXTzFt?=
 =?utf-8?B?dzVpaVZjUG4yY0RTclZsdVlHQ3M5T2oxelBkUkFFd1FPa1NldHVmSEJqR3NY?=
 =?utf-8?B?MUpPZVRUSXpiYXNnekpvTm5OVmxaMjFmcGZ3S2w5RWZQbkIvME5Nc3JFUFFm?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T36SlsivWG/d19/rR//0Ge65OmFElbUnCjmiWuRIRPGAuty0vkTQkfqpAP3/oS7BNaTawZfE+2jswQh12zT6nSx50xYhkG7M9nCEH9+dfOdaYn0+SQsSS31wKvw1XQbQI6c8l/stQxEQ9K/MAMbTeRhj9aJtfgquDZ+dv6+5Hql2DhdGAFrYHxTT0SPAkcpqTwqpkNFULIb6zdoe9JZ9SBoDIUcXoKgOISeX1kAYTVII+RWSo3oWudhcGoQ5LqCghJvafQmmDRMpM4qdbUDiWQwPfMC+Jpp96ICccbGjAjy7lwfxP4VC8eiyHcVBtlVnMveBDk0SZ8E6D6h+vwJeIRcsaZj2EOZT5RD8eaKfuOFl2184GPNXqLtVEOmGaL9z6phzuvYTWnspgQl3nhqXDMwfIof1jiyzIm9eaBq8V9PBzdRXPDgMMWc95V1QFK9hrDn6h9khGvHxM5FBXZu1/2GAd1RZC1sAy2Y7tebKHY1hZjXTw8JtbAPNa+NQ8JyAOXjEkmIKQ8u7U+NQPQN4tQIEfoVyXrQGICSSzcsGUyB4ZU/fFzxGb5uldYa00pdpYPwN07P39ONGdq0x0pus9hfSKZL3I8v52YXwBaYEF4ZnKsmYxiFfMwypW4RQB1jrfHs3GgYyUbbQn4MeU4DGXJolwItSPHJcWzIIYNnyjoJ4m5h37/vEWg0e5jcsjkPR/gnXLIYTOEg+h5U74hx6pKoL4KWzAxtF4japJBafT97llevbOS4vbWXYH8eXzK67pEhO+xKXbrEnXin3BNYL4d9ToutpFnBQyXbY94D/45HxdHopH1NeK8G8pVebqjaM
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b814c74-c365-4add-506e-08db1e50bfc5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 14:40:37.1340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mT+JU8U1t/TixlbPmtEJNU55RKbNzWtOFftycjz2w1jAYaDWMx3/8E3/3XqiLvJICa/BYx01cjLHKVQ+XV8NdjR49X96FVt4F8j2yCgNYco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5924

On 06/03/2023 1:57 pm, Anthony PERARD wrote:
> Cloning from "git://git.qemu.org/qemu.git" haven't work for maybe a
> month.
>
> While "https://git.qemu.org/qemu.git" seems to work, it only redirects
> to gitlab.com.
>
> qemu.org website point to a repo hosted by gitlab.com.
>
> So, switch to "https://gitlab.com/qemu-project/qemu.git".
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

