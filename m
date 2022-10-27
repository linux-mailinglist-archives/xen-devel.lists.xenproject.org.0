Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A18860F252
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 10:29:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430925.683226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onyG5-00072Y-C3; Thu, 27 Oct 2022 08:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430925.683226; Thu, 27 Oct 2022 08:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onyG5-00070b-90; Thu, 27 Oct 2022 08:29:01 +0000
Received: by outflank-mailman (input) for mailman id 430925;
 Thu, 27 Oct 2022 08:28:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i/85=24=citrix.com=prvs=2922bd7c1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onyG3-00070V-RY
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 08:28:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6603bbc1-55d1-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 10:28:58 +0200 (CEST)
Received: from mail-dm6nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Oct 2022 04:28:50 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BY5PR03MB5155.namprd03.prod.outlook.com (2603:10b6:a03:218::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Thu, 27 Oct
 2022 08:28:47 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 08:28:47 +0000
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
X-Inumbo-ID: 6603bbc1-55d1-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666859338;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1al4V9aql58lLJ4BEv43wMhhUd4KxPGWNzwiTheZMYY=;
  b=JZICqK2kBRk+FxBcU6uES3NAxXsdFVf2qsoxqpscFRufDAhUIf/VkYAG
   LrdZGmHZFppGFuvdEgVu0VxLiJ/TbhKrKgY/KFT396JQgSQ62R9KSx4ga
   xDpausyGD3qoeRhuXfUoWYKxMN0IvzPkdjhez90Y/r4eX4re8Nq34y0dZ
   I=;
X-IronPort-RemoteIP: 104.47.73.43
X-IronPort-MID: 86142609
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TKofxq3Ukz+E7hja8vbD5cxwkn2cJEfYwER7XKvMYLTBsI5bp2cFx
 jRKXGCFOf+MYWv8e4glaYvkoEwOvZPRy4BkHgFqpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GlH5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUxoOR4Qkpi+
 8BCazc0UwqDvN+42OqkH7wEasQLdKEHPas5k1Q4kXT1KKhjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g3O4/Zsi4TQ5FUZPLzFKt3ad8bMXcxItk2Zu
 njH7yLyBRRy2Nm3mWTcrijy3r6ncSXTR7kZT6OG1eVWsFytwFMCFzIOWEOGmKzs4qK5c5cFQ
 6AOwQIQqqw1+F2uX8PKdRSyq36ZvTYRQ9NVVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2IB5UlqY/7aQ6D+3Zy4cKDdeYTdeFVdepd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2NNo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:Lgu1pqtCjrc9CLFEmJBdtRtr7skC7YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVgUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZrzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDn1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9EfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWw2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 giMCjl3ocZTbqmVQGZgoE2q+bcHkjbXy32CHTqg/blnAS/xxtCvgglLM92pAZzyHtycegH2w
 3+CNUZqFh/dL5pUUtDPpZxfSKWMB24ffueChPkHX3XUIc6Blnql7nbpJ0I2cDCQu168HJ1ou
 WLbG9l
X-IronPort-AV: E=Sophos;i="5.95,217,1661832000"; 
   d="scan'208";a="86142609"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDsVVMcQetVsfrfId0rGXnEz6rRWuIEWsJ4QSZC6lmLltrbVI592wwpCuRb4MWBTXZOuRqjUbslKXAgGcCyVsX6pqKgASVzfQ6fcgKd4K/g+f41JPqR2Ya6x8b7es+UwV7fc4kdldGQ6ADRg7fWdvCUDhvGOScJAjhqK6OXaU6GdV4MFaqq9mfbGvCbUDfuu0p6lFPwbjGz68JYdQIzijWtQOK8n8a4EaWfUsRqh0MZksrEGo+Ov7lnTKYZ8uy+GaZ7yIViuI2SxpeNCjcPPc9XoPXsKPw7W2E9FGnqhqrc7hF4GRunwuTI4CTiNuLkL+q0xNa+tDdQwtQvXgrEJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihzRX2EHOxsWK9NFlyRyNHT1aB0apNihdVZIYBismeE=;
 b=F+UzD3YPtZvYEPZgLdkhVeXLM/+uVXPMhmsCfIEnIE+dmwGqBltTm08PGrRm5EbWzeMb0tBH+VIlyOn8/CWEzLhnzS6iqqntX74pivmpHQ4XHHfb4Lv77jDmWD0J0n8Ffrs2onIXCpMf9lp7wFs/igUZLuRTc85FzB9LViMMyxopSRVgyDnVgJUze5DWAgwmaLwX6j+IwP3LCsKeDnngCYyEZQFipMtgHxQJst/Gm/woqcOsMafPzfwACyKr8xiPChnpXcbI2YltWPFpmZg6MD21i+HtdchqerLPpLifAIMxWlfFD7Nq1BVmtiBZ2iRgvcCa1ePU4azmBpKmccRWZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihzRX2EHOxsWK9NFlyRyNHT1aB0apNihdVZIYBismeE=;
 b=WgnfQGmShtOqoSYc2Ztzc7UAtMGKksA5jlfY7vRBokGuTBkZVfUb84TH5Q6jREprOvxW2yaEZVDiBxYmWOBoSgCi83DgXUmPfwolHS9EHN0RsVIZH93WH5W+uCNrSt/I5GA0YKjuUFROv5JWdq3a8Xvn8uI0RIdx+8YcwWyglog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 27 Oct 2022 10:28:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
Message-ID: <Y1pBOZjzJ9JhUc+c@Air-de-Roger>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
 <20220718211521.664729-5-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220718211521.664729-5-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P123CA0525.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::8) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BY5PR03MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: baa23697-e7cb-4f1b-d425-08dab7f54463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vgI6asxjahYK5eD/qlbbupAcsOgF5lFL6NWc9lF3azuIcOWLg64hXCYJbNMHXG5x3ozbFYbfm0k9oApRDGtHBVNdUUYWCGcIbFabCAlcLiJuByQWbnTLkEqPwkVj8MbBaTumxSZixSKO7so1JB89/V0WY4MLd95TnLUmt6i4nbysXQ+YQ7L8NArFWz/+raT5c3RLgqL13wIBGNETE2nvZvXbUsnydDfpJaeGjHH1vqHob3wixbQucgw3gnBBkLlmhzNPRw3u/01WvRQ9dxuTj14BZp4249OZ0JoYNspZ/fl14cqUCDTKll4PtmGvui3vhJ/ooDOpBG+6xpr/CYV0qCLh4St1FK9PvEyjJG89AC7BTuolFCQ2KE2wSxw1yzfFzxow+Y4NXhYFYsaawlrXylMiXyoMcTWVDBSVt1L2gvnJGO/C6PT2HoRohJadu3n09gDACmvwcfQMbKy/y7YxZJKEiinBm0uOAlSJH3axo3AgO9gQmgirYMFUU2GgNmQkIlienJAws9cz5cy6R87FbPfoogteMIZQKRtgxcJ7ybnJnKXZEJ7w7FOUCRXOTbqZ4tj9quTVv2jXNznf6zwG0QfZsE2jRkuuOfbUFD0P294oVkQQ9LDswIVAP8kFWJJeZn60Af6NiwHT6lyl6/UsMTEey5VLd2Up7f+rb4wVGHdmgcc2cZbZibOkh7HaLL7cIvcZ/GD5kqBOmupAPMXkb7PyY2khUuPqXAN0FnBlff9D9OMDuWBKNgY9d68xrSFV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199015)(6486002)(38100700002)(5660300002)(478600001)(4744005)(66946007)(41300700001)(66556008)(4326008)(8676002)(66476007)(86362001)(8936002)(82960400001)(85182001)(6916009)(316002)(33716001)(186003)(6506007)(2906002)(9686003)(6512007)(6666004)(83380400001)(26005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWhQREV1bXRCa1IxcXdsWEhGOWVWOVFreU5WcU5MWVFBUDVjS25mblZOOGFS?=
 =?utf-8?B?b0JYVWMwZDJNZ3dORm9scWEyOGxQTUxrRnJNQi9uK1hHWTJnWnZCaWs5Mmtx?=
 =?utf-8?B?SnkyV2dDdnZoTUQvblpsNWREeDZvMHcxRFpBZnJRU1VjK0lBQ2U4bW5VaFpK?=
 =?utf-8?B?d2FZZENlMW1uTFcvUVJyOHc1b0VlTGx1OWdsNzBxdy9xVWJSWG41ZFJTZnc4?=
 =?utf-8?B?bmhXNDVYS0pGVFliZ2ZwNXZKUXlaQXF0eG02VC9iMEp1RlVQTXc5VUxhZkE0?=
 =?utf-8?B?UnRsTk40RjFWRXkyZmV4RnUra1lTbmtvazJWa2g5THVwOThlbm9IVTlVek1C?=
 =?utf-8?B?UjNCNERjR3lEbXZvQTdzaUVGYVdKdGZqK3RZSWoweUo1ZGtWNnJ1MGFpMHhZ?=
 =?utf-8?B?cURlU3FrWWl5a0lqa2MyTUsvSk1BM3BCSitUclJOaTBBakRSejNLMDNjM2E0?=
 =?utf-8?B?Vk5udUZNZ2k0TlBTTk9RZGJabjdsN0FYMFZCVndPdnJYQUtrYy9nZ0xBUU8x?=
 =?utf-8?B?eHduUVRGK05JengzSG80SU5ubjZhRVBleDlUclNjaCtTUUFReWovRjJSU0V3?=
 =?utf-8?B?MXE0MGRKRUVQclBwUjcxVVN6Sm5McjNnejltWmJHT09HZGJ0TzhtMHdkei9v?=
 =?utf-8?B?S0RIYlpXYjNiZzdpQWd0Q1hpSDZHMkFRZDhkY0lrb01LelZOa0JiT3llVmxJ?=
 =?utf-8?B?cDFsOHI4MnpTQ2FlSzF1cDBzblZLZnkrVCtwSmJadFhQR1lWL3ZOSnNnbFJk?=
 =?utf-8?B?VWw1Slh0STMxOTRER2I1T3MrQTR2aGxOZ3FFU05ObGs0eTBydzBPSFU0OUVP?=
 =?utf-8?B?TFloUVpnN1RxR3AyUkR3VHdteGtvNE5iUHU0KzY3eGFxZ0JUU0FYWXgxajdl?=
 =?utf-8?B?SWFVMHNBN3JOUUdiNjQ3WU9nUkZZdDFOZkpmdUdWbDFlclZnOEd1WUI1R1RP?=
 =?utf-8?B?b1NaWkZjdmJXWjdPeVpFenFDdXZjbE5PYWJWUnpabHpPOEFyUDFYWlgxSi9O?=
 =?utf-8?B?OUFGU3I2bVRKWXpZRXp0Y0JJcDR3cUtqU3ZhaUZ2SnE1c0RjQ0dDMytJU2xN?=
 =?utf-8?B?WFU0aW1NZzhvc2lXRExVaUNGSEpVK0VEcWMyLzZjd2FZNUVzZUpjb2pJRjZD?=
 =?utf-8?B?RjRnVUk1TTJqTVh6ZU9UdGxRckxsZFdFeHdwRmcrMThVcDJrSDZlZ0l4WGp6?=
 =?utf-8?B?dUZXbWpETGppcnVWYzVqVzhjSmZleFJtbFpYaTBGaklXVXNFTWZKWXlXTnM4?=
 =?utf-8?B?dmkvclBhbE8vZ3FYcC9oSmdJVmRLYUp0QjQvYThHSDduL05hL3JqdFlNMUJT?=
 =?utf-8?B?cG5XeXVnT1REL3RsMXhoTEF4cmlXOHp0LzZuVjR5SDY1S01tc1RrZHN3MFZh?=
 =?utf-8?B?eit6eEJFdUFwa0MwY1lBTWVnakltS3NSaTZKcENHUlNhL2VXcEdjNGVQYjVa?=
 =?utf-8?B?Vk4zVk94ZDBmSU1LUFdyYVUwb0ZlNFN0aUtHZzFYc0diU1JaQ3R3NGNVaVNu?=
 =?utf-8?B?Q1hVb1B3Szk5YzhlOFQralZHOVVTRHVITU9HSTR0Sy9RKzZURktWV3lHOUd1?=
 =?utf-8?B?UGdwbUFLZldrazhTTnZBRUhJSm9jVXhkdkhGQ25oRFZ3VUpPRGhsYmNZOCtu?=
 =?utf-8?B?UXEvbUhmdkxWN3c1RGdQMGRXTVF6STI4SnlXd3lHT0dpQkRsckdpc3VTbGkr?=
 =?utf-8?B?cFV4NEppY3NHOTE0cUxEbStFZERURDZiMXk2OTZuNUcrOUZCNmVOY0VCcmg0?=
 =?utf-8?B?Z2dGUEl6NDRNS2JpeWJlRlZud1F2TE5jdnMySmFuSWUzUklWNXNqNzNCVHBO?=
 =?utf-8?B?cWtKSFRDWU1Pc1VvaUxkaloyZUxMRlVzRGEvVlVlemdMMDRveElPZjlnOHNl?=
 =?utf-8?B?ZktmeTkyVXBKQmZBL3Z1MEtDZ2lyT1o2dDNLM1p6WnhhTGcwSFY4OWtpVE9H?=
 =?utf-8?B?Zkw1NHFOd3I2T000Z1RDRjI0a1Rpa3hSK3phaWY5blN0Q0VjR2tDYkV4MWxa?=
 =?utf-8?B?NzQycHhneFBjTGU1b0FXN1JpY2dCeGg0Ny96RUoxWmZtWHh2REhrY1YxYkNy?=
 =?utf-8?B?SHB4NUlUc3FOdkRVa1huT3lNSHVrUDRXaERVWFVzc0ZPbytlUUpmcXNsZmor?=
 =?utf-8?Q?+VTPEcvlKZb0jaolf9jdGxJ+3?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa23697-e7cb-4f1b-d425-08dab7f54463
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 08:28:47.0172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrZJdYoR+k5hbyHaqoBi0ZZyW/rpYERZP4mPs+eajsRBaPtd/kNWH0ORHUOfMqcKXky/hbRvFeZJO0KqlTcTuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5155

On Mon, Jul 18, 2022 at 09:15:43PM +0000, Volodymyr Babchuk wrote:
> Patch b4f211606011 ("vpci/msix: fix PBA accesses") introduced call to
> iounmap(), but not added corresponding include.
> 
> Fixes: b4f211606011 ("vpci/msix: fix PBA accesses")
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

