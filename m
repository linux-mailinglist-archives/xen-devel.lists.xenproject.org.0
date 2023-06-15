Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59B673158E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 12:38:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549531.858115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9kMb-0002a9-K6; Thu, 15 Jun 2023 10:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549531.858115; Thu, 15 Jun 2023 10:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9kMb-0002XE-GP; Thu, 15 Jun 2023 10:38:01 +0000
Received: by outflank-mailman (input) for mailman id 549531;
 Thu, 15 Jun 2023 10:37:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DnOU=CD=citrix.com=prvs=523455384=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q9kMZ-0002X8-Bc
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 10:37:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afcb6b9c-0b68-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 12:37:56 +0200 (CEST)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Jun 2023 06:37:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB6917.namprd03.prod.outlook.com (2603:10b6:510:12c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 10:37:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 10:37:50 +0000
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
X-Inumbo-ID: afcb6b9c-0b68-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686825476;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=s374c79AP8kCXdnnKeb7u25zQ2L7Zev1mKjMSQPK5FQ=;
  b=Wt2gYxKv6shbCFf72gu1JsYiMWV8A8mijtiPdOiR/HMpGmP1OqFDg3MB
   S5in13F4JC48oofbXVt/g/SjEv+Vsa4Uqmeg0V4KUkzR9tZWPoGCaj3wF
   QtT+miiEaumgM2ndXaV/N9JOIkmpZBWrukWNjZmovKGDnCHwvjh73keQJ
   I=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 113310389
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:F2k6GahuOJUUdLH+V0jyFDk2X1614REKZh0ujC45NGQN5FlHY01je
 htvUDuFOvneZDb1etB/Pdzg/R5X6pLdyNFqTgA++HszRHkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4gaDzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQZGhUkP0jTp9mRnoihTfVTq+t7MOn0adZ3VnFIlVk1DN4AaLWaGuDhwoYd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluGybLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTjracy2w3CroAVIB4wXnme+vyUs3KzcYhvD
 1dJ1ywC9ZFnoSRHSfG4BXVUukWsuB8XXN5ZVfM39BuMzKv86RuWHWUCQXhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqbigCVhYB/9jlr6k5kx3UQ9BsVqWyi7XdGzv93
 jSLpygWnKgIgIgA0KDT1VLahzOhoLDZQwhz4R/YNkq+9R9wboOhY42u6HDY4OxGIYLfSUOO1
 FAbn+CO4eZICouC/BFhW80IFbCtov2CaTvVhAc2G4F7rmvxvXm+YYpX/TdyYl9zNdoJciPoZ
 0mVvh5N4JhUPz2haqofj5+NNvnGBJPITbzNPs04pPIXCnStXGdrJB1TWHM=
IronPort-HdrOrdr: A9a23:jU3H1655awN1jxLg6QPXwdWCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6H4BEDyewK6yXcT2/htAV7CZnidhILMFu1fBOTZsl7d8kHFh4tgPO
 JbAtND4b7LfCZHZKTBgDVQeuxIqLfnzEnrv5an854Ed3AUV0gK1XYcNu/0KDwReOALP+taKH
 LKjfA32wZINE5nJvhSQRI+Lpr+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd8gYCXyhJybIC93
 GAtwDi/K2sv9yy1xeZjgbonthrseqk7uEGKN2Hi8ATJDmpogG0ZL55U7nHkCEprPqp4FMKls
 CJhxs7Jcx8517YY2nwixrw3AvL1ioo9hbZuBKlqEqmhfa8aCMxCsJHi44cWhzF63A4tNU59K
 5QxWqWu7deEBuFxU3GlpL1fiAvsnDxjWspkOYVgXAaeYwCaIVJpYha2E9OCp8PEA/z9YhiOu
 hzC8P34upQbDqhHjvkl1gq5ObpcmU4Hx+ATERHksuJ0wJOlHQ89EcczNx3pAZ2yLsND71/o8
 jUOKVhk79DCuUMa7hmOesHScyrTkTQXBPlKgupUBTaPZBCH0iIh4/84b0z6u3vUocP1oEOlJ
 PIV04dnXIuenjpFdaF0PRwg1HwqV2GLHbQI/xllt1EUuWWfsuuDcTDciFhryKYmYRdPiWBMM
 zDf66/AJfYXB/T8MhyrkvDsqJpWAojuf0uy6cGsm2107L2w63Rx5rmmaXoVfPQOAdhfF/DKV
 0+exW2DPl8zymQKwrFaV7qKjzQRnA=
X-Talos-CUID: 9a23:TmkxmGxV+pnIYRkm7c66BgUVKOUMIyWN7Ez3fXWiDnpWZZLNVX+PrfY=
X-Talos-MUID: 9a23:wF3gbQkNvtWyWvcpDcXGdnphEsxKxv+rJXkxnL9ci+2faAF2F2+k2WE=
X-IronPort-AV: E=Sophos;i="6.00,244,1681185600"; 
   d="scan'208";a="113310389"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6PVIVFy5huHUuqv8zsqmyzNd0zVpJwkAgFkECySoFCqBjUwvzJkdwIhcTgPaQa1uD/E85xfjgXgwYv3G6PQXxOK+18CeS9puJH0xntwVo3eLV0LbHKD+qZCttPr/LKgDzrd3HBPSmpZ738XpPUBlWNo8ga0AuiSsduWiugQMfd7CbSk8zG695S4HMXM31xhyyvJlnFVGTTNyLeicJCLGH5mkhI/AaT9NMZp8WTDJWkMz+0PYYOecmoVUBY+isYj+nyVC3D1qJF0DP/6IrRP8e3H1z8l/18tbBR+m+vZikjwbMXyg58eV+hauq7oImgmw235RIOwIB4Q/9DItMLQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csWPI2a8l2nrLLK3Guftw/MEB5zQkVpYlI4F+L8ePQ0=;
 b=Il4hXSM+Fn3cV7S1rhJzr49rbmw1lnwzr/W7f2I7pENKPE1fo3JnLTfPsrh5A5uiVuPiPWPq3mZAj1tgzml8ASdLPrh7XlWWHPlqJdOc5oNd8eDbBv5wKyLAZ7tTzE2UrwaQeeG76OVzg1aXn2qu4EkE6LljLGYLdTkywJW8tUF/1+o7qbwogXO11sZpo2z6LGpGharn0oxvLbMi3u0XIbmb0FB11m1Q9LKsGD/S3k122oS6BKEtZQRazzHHGK7Q5d2AqqeuipyQgU3XwD0NTA06DXF7msl16t2Rbf1CcEKHoZxenPKpFuDxk6WH3uBTxgOMHpnYo48Tr/rydj8a1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csWPI2a8l2nrLLK3Guftw/MEB5zQkVpYlI4F+L8ePQ0=;
 b=t5a8/KchuwqJ2q31Y/TMyn5SM0e4HiaNvVksNhPv6LH51TJpalDWrzfiDV9w7hHPaHtzuyrYpn0kciw50ChvpHcuwGmyrWBTlh+F4W527OYLudKsZLBi2I4cUfNWAH12By9mzAnzmFLaE4g8XlhMs6Ndmipf3Aby79zqEeQsAgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <33090fef-c72f-3232-93d2-bea0822fbbae@citrix.com>
Date: Thu, 15 Jun 2023 11:37:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen/include/xen/lib.h: avoid undefined behavior.
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e8e56dc4e45ec79f3e5380544b56c3e0b3b2bcb9.1686824437.git.nicola.vetrini@bugseng.com>
In-Reply-To: <e8e56dc4e45ec79f3e5380544b56c3e0b3b2bcb9.1686824437.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0550.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: d70315e8-88e1-4632-08fd-08db6d8c9168
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GxgTcUWtiflz670qmb0jS5lM0VZU6uV6hV4bVsLJw3/G5/KIFqxt/XN/zGvCZCR6/So0uXI1VNn13r3A9l3tjOCBXHap09epUJd9p81mBa+LkreSJSng9o1NQp5mdwr7Ri/3gyYfReDRFE4Y37ZG7zh7o/gQYab4QcF7t9/eTT+/kYTXjInF2afMsB48DvOVOw9thpDNa7YkQOEZgG+kP0EN2OjajHmOKU9py1nPrFFCgDiw56Vfh4jE/m7q0TrlJZ/2MujqnyVGAUClzlhcdAOAgTkjEsKjkvnmhgMvfL6DnXXNHNjtHkhT7uviIg7w9APg3nm3LiT/oE37qK0S8acpbT7i+0MnhL639mPB6hq5DB/+B1eHwMlxYUmcoazFubcTkacYoJfcAmx+3zLvT96MrD6s0AYe5lfASByMTcSpGIf2PkZTP7kUao5+6DZJej0OjDsMOJT/cvz0teM8mEKc0zomfBDTBYD6C4sGE/KkjntvVCGhYkhvnGQkHhp56XMsA3KdwQ2BDcSwTtOHmNT1YpoHjkpxOkEBk+6sevWAncRBH5Ztqj9RKvRI62OQJzCOPrBxer3dM21rYiQxL45Wzf0nwEk7XLYUZq0j3HtfApME434OTIUrW179sP6jXqwZ06DXVgExbHClKmomzuBpg5oNQyE9moVzwweq5u59o20LNUMRzJXLwIattDmKLOgEzDhKy1d3ZLc8MURNGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(4326008)(66556008)(6666004)(66946007)(316002)(66476007)(6486002)(36756003)(8676002)(5660300002)(31686004)(8936002)(41300700001)(478600001)(54906003)(31696002)(53546011)(86362001)(186003)(2906002)(38100700002)(82960400001)(83380400001)(6512007)(26005)(6506007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEE2WjJyckNuYXd1Zy9Lbnd0bWJQUmlUUGgvbjdiTFoyNVNSaWtNUVE0Q3VM?=
 =?utf-8?B?WXZxV3p6ckJ0NjVBTjlKM0FacHBFcGtpWXQ3VlRmT293UUtvcE5DTG92bk1z?=
 =?utf-8?B?Mk9jSTMwT3M2VTA4WjByOG1FYjRINXFiR0owL3ZOR1BKWUJkamdrbWRYTVhE?=
 =?utf-8?B?VjY5L0svOWdpcjAzaEhMNEtuOVRRZmFUZ3ZUUGZIajlSOHFlYnlhZC9lbVJt?=
 =?utf-8?B?czlEeGlMQ08xRURMMVBKSE5IWnBTMVMvVExWaWF0dXBTSnNjVjhWa0tOUlNG?=
 =?utf-8?B?WFlSZDYyZ2FnODA1YUdTcUw2RHZRS2lHQVVWL1psOGNtTko3VmxnSER6MVZi?=
 =?utf-8?B?WGdMcjE1WGFWS3lwT0NUZEEwRVpZa2V0eExUMWtCK1E0TVkwN0RyK0dlVndR?=
 =?utf-8?B?YVpuMW1iWGdHTnQ2UStmZEFQOXRNRmtkSTFDSGlqY2lrWnB2cmxsV1dCTUl3?=
 =?utf-8?B?a2lnN2s3N0gvUFpuUmFlRlVUclFJcWpYb0RuaHdpbDdIRmVBZGFIbDNoUTJj?=
 =?utf-8?B?aUdNeHc2V085dWg0Y3E3VjVaSTZaVHhyTWxVZ2EvM1h4aGEzMlpXUFcyUWt2?=
 =?utf-8?B?dTlJU3lVb3dRK1J6Yy8zZm1FTE5OTmVmVVFjSDlnNVhLVlpuSHpKOWRTYmxp?=
 =?utf-8?B?OHUvck9pN3UwQ1J3VHpMejlaMTR0U0N3MVJ6ZlpUYnExQ1BFR2pPU0poNTY2?=
 =?utf-8?B?eHRxYmxuQXpwWjRWcHVlZ2JOdFB4Wk14K2czaFV2RUp5OXBnclI0WWVDbm1L?=
 =?utf-8?B?WGVNbHhnSVVMN01qSThLYzZsb1ZZc3V4eTNRVXg3dzdlOGNBbUloT1d0KzZX?=
 =?utf-8?B?UFpyU1c5TUlkdng4UW5jRHIwRUVnMEtNVzdLNHk5L09xSFRQMkZEaWRMb2ky?=
 =?utf-8?B?WVo1amVNVVpNM29lTFlnVGkxS3BlVFczUXA2QjJycCtFMzkvMGtWU0JWWENB?=
 =?utf-8?B?U0d6eFBsdW4rb3VyVGd0VHlkSTMyUFpGaVVvaEJtaE1UVUZDREJLOUpQdTkw?=
 =?utf-8?B?RlJxTHlsSWpVTWdYU0ZrdWFkajZ1eXhsWWlpNkhEOEdEb2Ryb2dpLzZyNE1E?=
 =?utf-8?B?ek5sYjNvWHpRVlZkcDBWWjM5NmRIK09Eb3Rvd0JMT2o2b2FqRkVUN3dsSkpO?=
 =?utf-8?B?M2RZaU1qR2lqL3A1NFozWHk5ekZjZURWdU5FdjdMUE9qRWtub1FXb05qbFdN?=
 =?utf-8?B?WGlYZjFHYlRPRkE5SFRRS2toaUxxWm9DNU50ME1LNHh1K2plZTlOY0E5dlJP?=
 =?utf-8?B?blpqRmU0SjJrY0lacXJrbzlySjJ2emVQcjlUWjBiaU5LTS9xRWw5czNmeW5X?=
 =?utf-8?B?LzJWZWl6akZqNzFVblRJUW9oR0w5MFZlWFhyVjFhQXhURU55Q0ZCaE5WeEUr?=
 =?utf-8?B?Y3g1ZkovdlpGanQzNTRvbU96Umphb08xakRkZ1U0TmxjTjhYTWJEVlFPRDBz?=
 =?utf-8?B?cmFCa0p6dThvY1NnUHR1b3ZJTGgrdTMvcTVXUVNsQW80eVdLV01aZldGWE1n?=
 =?utf-8?B?VURRT3JEMGxCUitwaTdxTnhJYlZoYmxjQ0pjK2dyRDhpaHp5YUpCT3ZHZGlV?=
 =?utf-8?B?SUlKZ0xTaU1ueEpoVHZrUWhJRlRyTTl2cnhvWGV1Vlp3T0FwUVJZNGdHdDlq?=
 =?utf-8?B?Vzh3WkZ0UElZd001VFdJTFUxTDAyYUc5dzFFaEpIN3pTM1plc0N4TXN3V2NF?=
 =?utf-8?B?c1lTSkJKd29nWU1reG5mUmg3a2tPcnd2dTZmcFVXYUN1R2NBZjVnUXdRTW9O?=
 =?utf-8?B?MEFoSEQvYU9wSVFTb1IxMmpwMGJRM0FxYWpJb1E0c3dxOEdLNHpkeU9iRzZu?=
 =?utf-8?B?cC9uR2o3SjQ0NFRNWVpzVHpVZEJpY3JMcllUNUFodzZ0L1VyUTBCTjVNYTlk?=
 =?utf-8?B?eXEvUmk1OWVZbzJUYjhyYjdjMWtqQTdicEwwUjJidGdXcHhzckhUd0gwS0tp?=
 =?utf-8?B?R1EwR0o1eGp0S2ZDa3pxVHVyS3NGV1Q2NlNMVDZiaSsrZkliYXcwdnlvb1pu?=
 =?utf-8?B?OEwyMC9KL2tRSkdleWp6MTcrcU5QWUR2ekFiZFZ4NENpZkg0VWhGdHpTYTVm?=
 =?utf-8?B?NCtZblViS1pnN01lRGJXVStsd3Z6MFR2NGlzRml4L0xORzlGZTVZRDBjWkR2?=
 =?utf-8?B?dVJYY2NmL3NweEF1NEpaeWZCd2l0bVl6WEw4VzI3a1JNSmZVbXZzd0tLVGg1?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	R/NskfYbws13pQOU574dZcC7iNuFbZsS6BX1lA/izyW33Ek/5e7Cxn0aaaxRvWhwctIz+ws7vrRvemIKhIkWALpEgpTwQcE/5l5EZSFlIILcscn5846ywcd176dySHwgjXELMG0BiDbPb+tFDrdiKPSt6ABq7xdxjuOuhRQflXKdo+bIrjgAhWGKtde5NfhpfC2Gi6j6gBtYjCeMdp8gVti/vbF0Wv4cY+gqLnVOjjZDHwpdFIEks5B2K9wOIIi4EIjiuOplwypbqmg68T6dQTyY1BRfWwguJzBEHyEPxcROAvrQCJ+aRnusgN9H7XqrBDBwQYb1VhZWzVMOr9OfjfxGjzXoKL+Ei1zA+qieHH5SaxzKjXIVQNn2kuaTgHiozzYHWBeqFzylyFZy0GesqgHww/HSrwKIOG9DpXotEhJezvb6kvIU3X/w2pRI5s7vNIOcxyyYcb+PF+gAJn9F3t7eKsmlv00LeMNpJ7H2SasbggPoVgiVVDuk21iLOVJwC6LyewjuCMwTnK9rPAUWPqNeqNbMlOJBWnFxZ+Q0zPCRT0kp0U+1kVWzTT3IaZnC1DSb7+er0Q6AgqdQoGDWfUvxgjAjsgMawXSh4wJNoxUzDPhTQSSkAsRNetmMFGzO9sBQoaYprxrvXYqRQaC10jeEwmH/P+YfT/5RFFUOHX43lw1cjavl//p16l0eZ69IbdgUgk4HR8Z04WPGSBeks4cWkDRwTHtGda/KzAabcBcyFmUqjr9DloUxOUXButLzfx8H1XZZW6kd3IJ3AKh9XqHUoE9Jl8BO9eYq2XdjMf9PRGzTV5RJdT4+cUbqOAgSTaiSr/63lAmUxoo3WgzH9edAFSRNWoIaRWoETKz1krtIBncybV1noggCv/JZCy1g
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70315e8-88e1-4632-08fd-08db6d8c9168
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 10:37:50.8267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ZYDn77GnOPT2IYvNsFHr6S+ZmCY5sho5FDhlDUGHcl0VlO4BcRL+/SLROfll6/tn70FEVcCSzgTChjcYGbdGxyx4rqpHYPcV3q6MQE6prw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6917

On 15/06/2023 11:30 am, Nicola Vetrini wrote:
> Redefine BUILD_BUG_ON_ZERO to fully comply with C99 avoiding
> undefined behavior 58 ("A structure or union is defined as
> containing no named members (6.7.2.1)."
> This also avoids a dependency on the compiler and its version.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/include/xen/lib.h | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
>
> diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
> index 67fc7c1d7e..a266159b9f 100644
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -40,22 +40,8 @@
>      unlikely(ret_warn_on_);             \
>  })
>  
> -/* All clang versions supported by Xen have _Static_assert. */
> -#if defined(__clang__) || \
> -    (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6))
> -/* Force a compilation error if condition is true */
> -#define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); })
> -
> -/* Force a compilation error if condition is true, but also produce a
> -   result (of value 0 and type size_t), so the expression can be used
> -   e.g. in a structure initializer (or where-ever else comma expressions
> -   aren't permitted). */
> -#define BUILD_BUG_ON_ZERO(cond) \
> -    sizeof(struct { _Static_assert(!(cond), "!(" #cond ")"); })
> -#else
> -#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
> +#define BUILD_BUG_ON_ZERO(cond) (sizeof(char[(cond)? -1 : 1]) - 1U)
>  #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
> -#endif

Getting rid of memberless structs is fine.  Getting rid of
_Static_assert() is absolutely not, because this change massively
obfuscates build time error messages.

The MISRA work can do whatever is necessary to get _Static_assert()
permitted for use globally across Xen.

~Andrew

