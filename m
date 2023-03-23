Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648F46C6857
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 13:31:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513828.795434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfK5O-0007Ci-ER; Thu, 23 Mar 2023 12:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513828.795434; Thu, 23 Mar 2023 12:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfK5O-0007Ao-BR; Thu, 23 Mar 2023 12:30:30 +0000
Received: by outflank-mailman (input) for mailman id 513828;
 Thu, 23 Mar 2023 12:30:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIVP=7P=citrix.com=prvs=439b2ffc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pfK5L-0007Af-Su
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 12:30:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 781d6b63-c976-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 13:30:23 +0100 (CET)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 08:30:08 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH7PR03MB6969.namprd03.prod.outlook.com (2603:10b6:510:12c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 12:30:05 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 12:30:04 +0000
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
X-Inumbo-ID: 781d6b63-c976-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679574623;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=E2reIyzYOYAeyeo0N+tFEsxB9vscHn2FommH2PT4cGw=;
  b=HEUPxlkpOIUExHB65Dq7f+Z25q4Oj2XoNYv1enwQXLKya07TO4VSSJce
   hVKL8Y9JLip+2fC+lrQXpkVz0bGT7it5Ar0OJPs5JCXY7UiWAbmYrD+Wv
   qNG58MgX8MQTG3B0i5Ks3hTDMIu5b3GwXwu9Tg+bzhV3XIE/7OF+5go4m
   4=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 100814832
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YyAyOKuMTozPoAp7TUkygbEeKOfnVGJfMUV32f8akzHdYApBsoF/q
 tZmKWmAPPnZZGP0c9wla9vn9BsOucfSn9VlSgRqpS5mQ3gR+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASEzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFW4pREiequiN+7+cV/FeiMsNFfH2M9ZK0p1g5Wmx4fcOZ7nmGv2PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60aIO9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiANpCTeHoraQCbFu7/2BKBUcmR0mBhPS3rBSDWst9d
 Q9E5X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqF/6qQhSO/P24SN2BqTTAAZRsI5Z/kuo5bs/7UZtNqEarwgtirHzj1m
 miOtHJn3+xVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5L2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:RMluk66WH7dpFEv1mQPXwdWCI+orL9Y04lQ7vn2ZFiY5TiXIra
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
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; 
   d="scan'208";a="100814832"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSH6RD9jfyAMxamk6VvjcYVLvCjwDvm3C7RsueDYd1nOjRk9NCxUHsg2iKC68oKDyglmav6z3hrJ09gLm4fZ7DWmb7JeTyDvmWd5dU2OqtEC0OVlHwDLxfsiqQk5X1fIUDHXmLcgY4SxjnEmofPPiJWrg+e8AeYR8StEqotEr4xOceBuKF2yriicpDfJYh252Y7CCo5VOTmQvPwzhojYVuus73p6q9xvToGW+ifrRBi6nda2kUaFEZ6OGP0qPhz9P25VjITl9ry3S74AdOPIV1M5lDJI0Nv90Dt81XoaXaQd/d4hTOaaKGfvdnSYC8GHGEKdLV+Od2QAdqPj+z3LPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPZNYpOHH6qEu/dMbY21FiK/fmLQ5FXTD27CeN+mPBw=;
 b=HbDU+Y/eNDMG2PT0BdjdT5RnQJ0ioMo6XneYMISPY7+paSZvr4ARH4bXWV3rH8gN01hgg9mjkRXHA6v4Rf9gxzxDM73APfi7k7Op7x3HTVXR5vw+P+L2m9yVJv8mAcGWiFoX8S4MSA1gQPu/AQr2NazeKV6go3vtlFKFvbVXlNjYdR3amKb7N0umaezuagkhclyl6YngCrflTdTEX9V0l4nT/6bqT6BEWPQK8RQ5DNuFZgBUKlC8Zkg6h8NSzLUMTk4+/VKxmXRyVj3ua1Gov9vdR+ral5FbfDX8eDJsMl6ZfB1i/c3yuVP+86Q3k6J2fziOKtDY1BuqYpKeH/2OJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPZNYpOHH6qEu/dMbY21FiK/fmLQ5FXTD27CeN+mPBw=;
 b=YRo/+REIC+z/C7Ilynt6tAs//zYhKw8UXMvxg8chhV3Ym1ZcjjmYCgeTrxeqOw0uItPdcJOu94PkgnRhe5Egtr1RDqtKP16xTsdvJN51T6fEfG75yMoRqKeoduiIHGa4oXQ2QiyTI258+pMK8y6iQqYgN4gWe7SkR6Y7ce28JjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 23 Mar 2023 13:29:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Message-ID: <ZBxGR2j1dnvLgy/A@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <367d0223-d481-b7a3-3b79-a9bc6f00531e@suse.com>
 <ZBm7N7oEDPlPmZ87@Air-de-Roger>
 <51ee4bf5-fd96-4fb2-c91e-36780b0f7ad9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51ee4bf5-fd96-4fb2-c91e-36780b0f7ad9@suse.com>
X-ClientProxiedBy: LO4P265CA0128.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH7PR03MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 612f761b-9881-4b4f-50a1-08db2b9a5473
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3hpetGDH305JavKmlaAFLLthnV2hWuUTYc/YkWo+75/IKXtHDT/ZCVWbrKnb2UYJ1eb0rThXvjVZKnVa0MDOp1mpQlCKCF6Sc0FrckVzz185AcZCiQ850btBnDqVs7g22DL0g9vSEd5Kc+cslfR2MuOWic4cLz+vxDZFVyM1Icim05S/8IiP502HBS+IwJZXN46K7Px9YrGOJhrk8fSRK3/8L/blpwsVXMEzdeoMgakduXHrXBNpDAJj7h8gebxSJJV6mh7Qeby11BdS60WGKT19Kmye0MzYFNwJIUabczrtm/g6kcwmQNi15PVOhk7vdZo2v+0NfphUoQZDVDw0FkCrJ0fMjGldKNgMKQys5Kj/hEUhEXZ+TNrvE/xs09DVGrdUmKeFs/pdCoR919pvqxEQXn6a7uxsYq2VDB/RdBjXaVb265U3Te9oCj1r7Kga9s7Z2uxrV0UnBJb0a5YFStx6thPx3Xqizne4I4RW9YS5+15ekBwrQFjBhs77zSo7dFKbTDJxiehGvGKf+07Z5yjvGerbChhbJf7olJJf708GgGontPkU/JkDg11H1WoYkH8Y9GQsy5lrigEmUlCMs0ztumVrP/g0Q/iqXqmTvy7t5rBkWmJDV/Yca4frymSjkstvWyeeZSzjADOT5nZmqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199018)(38100700002)(2906002)(478600001)(83380400001)(6486002)(9686003)(186003)(86362001)(33716001)(85182001)(316002)(54906003)(66476007)(8676002)(66946007)(66556008)(4326008)(6916009)(8936002)(6666004)(53546011)(26005)(6512007)(6506007)(5660300002)(41300700001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm5OOU1BRkZSbG42UXNwNW9PMlhNQWxaQThqRWlDanZZZjZjTUFNK2N5NmNh?=
 =?utf-8?B?SGorSDF0UDdOQ1BYZDltc1c2bU5sMllMMFlsa3ErVXUrTitKeXZiMUNZT0pT?=
 =?utf-8?B?M3N5NVMxNTNEQUtJTUdjUmJWUmpTbGllSERxRjVZR2w2TjZoazJtRVZMYmZs?=
 =?utf-8?B?S1dmMWZFTXRtT1ZrRk5aL2dEeWtoMHprTDUvOGphdDVpSWN3NzRPNlk1NFN3?=
 =?utf-8?B?MnNOL29uc3ViUUtuRmNWQWMzSlNFMXRBM0xsWTI5NTRzTFBvRFZUVDJlaVFr?=
 =?utf-8?B?eVRnSCtlRXZxbXgwVi9mZ3ZPNklHelg0aHZ3eGw5TC84QXVleDJBdzZTUlZM?=
 =?utf-8?B?SWxhSTNSSVI5UTB6bGFnbHpzSU9YZm1uMDN0d0NxOGpLU25MMDUrNGQvNms4?=
 =?utf-8?B?K3ZFZXkwQ24xd2hHZTQ4bjJxWVBLWEt0ZVQ0cEtUWDgzU2V2WE5WQ1Q3bGNp?=
 =?utf-8?B?ZGVpSHBGYzQ2VU1DL1dkazRFenpBa3I2Tm5OaGJvWnRsMk16RXBrMnh2T3Jn?=
 =?utf-8?B?dDRuVHZHQkNjRE1TUDh4bHBnNmVJalMwRmJiS0swUk1tb3B0RThFWUgyd2JZ?=
 =?utf-8?B?dGtXaUlQRGJQdStrTng3M3BVR1BjVnVYQmQ5T1o3M28xcDd1V21EOU5ZYnNW?=
 =?utf-8?B?Yng5UnBMUm1MOTZlc29pRmdIWm9hd0hCMERiVlhnaDE2N1hFM2FUTmUrV00r?=
 =?utf-8?B?RVJhbXRML3BuNTNFbjVQUUpycEFpSFFTdUx0SzMxQzhlQnMvaERqY012ZnR0?=
 =?utf-8?B?c2Jwenk3V3FpSDl4V3I5K3kxeVE4azFIdUpYQTRVWTdoN3BCWFJlY0l4OHZ2?=
 =?utf-8?B?SFVPT0FnVlFSVkRJSmxyZ3Y0cUJNbGhMVDlsQ25kSkNNd1FlcEd0aURIQTdS?=
 =?utf-8?B?R0JTVi9EMXI5QUs5d2xEN3IzZGZaMTFZYXRtSXBSekh2Zk92cEpXTVZ0ZVRx?=
 =?utf-8?B?OENPMUcwbk1MdGovZVVhVld6d0VmbCtPY3EwdUVhVDB5OXNKTXcyQlN1a3RM?=
 =?utf-8?B?OTNLaU9oN2Yrd1czNVJNNUxFcnUyU25Gd2NuUXQ0d21ubjNnYzZZRDRuMndn?=
 =?utf-8?B?ais4ekNSL2E1SSt2R1J2bmc3T0E2Q2VJclljOGdLTW14SkVHNnU4NjAweTRm?=
 =?utf-8?B?OC9uZmFaZFBVVFIzWDRBMGVBV3pYTGpnNEhQMUN2TytMTnV6TmkvOVlXcmpJ?=
 =?utf-8?B?aWsvUmNJeU1IUUhaaGVLOW9hb0FGVTVickZ6aUpNUU81cG5GeVJXYnZBNU5V?=
 =?utf-8?B?UFlsNHRKTSt1aG10ZDV2S2xiWUxQakV5bWJ4OEVrN0QzM1c5bW5BTzByb004?=
 =?utf-8?B?Z29RUk50N3dHd0o4bUhRNk9mUXhqTFE5TER4NnVLODg5RjBWS1ZmYjJTTThp?=
 =?utf-8?B?TDhtTGM4RXBWWjNOd2RCdVc4VXpIdVhkT1pGMXdMNExwTHdqYkZ5VU05bjBj?=
 =?utf-8?B?eHNkS0JHOEc1QlNXQnc5YVE3SFhoV0x6MFNwVXZ4QUt5aGFlS09VME00UlM0?=
 =?utf-8?B?ZVNUZHI0SWExZ3ZySkRvUUNYbFVqaGtGeUlMUzVnMitzZmJDeTQ5RE5lRTdW?=
 =?utf-8?B?QWZaRWlUOHFtcElnNnJ4QlZYcFJJa3N5aXVFNjBlVkRaY1VTZTFZVWJHY2NQ?=
 =?utf-8?B?VTVraVlTQVhlQVczRXVGRFlqQnJRa3g3NXBLWTFmandpeDVBRU9sZHRaaEtC?=
 =?utf-8?B?MGJkQnVNVFhqZm1jME9SUnBTdkpyVFpZa3FxSVJZVVY0RUZVNjVRUnovdGNY?=
 =?utf-8?B?K0tMa1piUkRDVTJJcnVFQ2R6WFpSSFE2Skl1SEFsOFNmTEIxSFkvWHEzWmt2?=
 =?utf-8?B?ZXE1VUJNTVFqRSs0K2F0TVlKZkFtbmF3Y2NWMy85QjVrcXNLa0lQeDNjTGpp?=
 =?utf-8?B?L0RJZFhCbmhuUWYzSzRDWVczL0RRYWNyM2NEaEk3L2pBQ0JxNTdiMXFhd0dR?=
 =?utf-8?B?WVlUUVYxdXZDMlZSeFFjV2FvUWcwdC9TVGtBWFVLcDZGd0pWR0RONk8xNU1v?=
 =?utf-8?B?VjA0dU4xZjlIL0xXSmlnKzVuVGY2SG1GRmN5NUpNUllSb3NoMDNZaXV6eFcv?=
 =?utf-8?B?YWt1ZytxSU1VSkhyWWdJb0RIdVp1ZFNUQWZ4TFR1UTR1K3drRW1nQlQyN0hV?=
 =?utf-8?B?N01DM0JPRnY2WXJhRUh6Y3VhSlBRNkQ2Y0RpZktyQ09DMFRaRFVvRkJoUWUy?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xkc6lRjcOG72AKa+IDd3fD8xc5nLx2L09UetJVHpIefk2CFAjT/X87kYMdkjuaKx+sOeKKw4gDJAwZb8uMJRs1hoCkkSYSK7rCKOEwNYBs74Vgyu28kgtKifn/+HyxUiJjkf5efyalrujqM8NG4nbD+xF2sDhZKGv3dxHSVv5Udl36xBsz5529eWHozmU+eBY1uXeAfIhpMDShwuHP7BXeVqJKWU4sVoDvGkbHteQsV1gE2IpuYxSbmLsvF72+eCRnHAtFzQVjZ5/0yVNoABcuOpevOZK4XYytVNbdVvP5fPsh5Fp7sWbOwiUut4Ozy8zmFvp25ltHvUIqLftg/AGP6/mOv93AUxfFZLMK6Y/XEu8BSzRQizns8hA7uOHzCSTxSXL9/uPfr9m2XV1A0yPaykNxLOKJRtqC0AUJBhF/izhSPQ+Sl99l09KpgRDyVwT3uYOBXo8oSCjpJJQO/K2wb8gdv6asIBvD1a4xgCIa3BmFpMdH3+SWKU46M9Z5LPpNdk3TTjq1OpnHEWN1bGIzSs3pMoeFzh9JyGYpjDqBpS51ZUSxOsUXcufenraBup9AdRvHfFoEnVRVCPcO4XGNJSyLBn9+4/X0COe7pEJMgac8CtVoBotG/uR9u6NfyjzDTuaQMi/oI4EZIZZZBHF7eDThLNXmN4yMx2EWXwsl4EAdZem7UQLHikSDghZTh5St0uW/ZeqtjBHOOnwS+l7vk0gb+7rjz6XqizHpLOmzR6OttpL56O5gSRb0bu2NGueuh3h1If4p0trp399X1p5w0RTc3vZxju+862VeEoBPlBVfbof5HEY6Y/D8N9K34JmhWLoJmCo6S+x5+AEnpoqQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612f761b-9881-4b4f-50a1-08db2b9a5473
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 12:30:04.8451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zp06ArKaHpxbfM+YpNF2OJ572ts/KI8XsyXKOeRt3BBNy4FfJf/k9lMyp75EhHQsitq+ES67/jfAuQWU4azZBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6969

On Wed, Mar 22, 2023 at 10:55:42AM +0100, Jan Beulich wrote:
> On 21.03.2023 15:12, Roger Pau Monné wrote:
> > On Mon, Mar 20, 2023 at 09:32:26AM +0100, Jan Beulich wrote:
> >> ... in order to also intercept Dom0 accesses through the alias ports.
> > 
> > I'm trying to get some documentation about this aliasing, but so far I
> > haven't been able to find any.  Do you have any references of where I
> > might be able to find it?
> 
> I think several ICH datasheet documents mention this. Right now I'm
> looking at the ICH10 one (319973-003), section 13.6.1 ("I/O Register
> Address Map" under "Real Time Clock Registers").

Thanks, I had to fetch this from elsewhere as I haven't been able to
find it on the Intel documentation site, maybe it's too old?

> But such aliasing (really: lack of decoding) has been present on
> various of the low 1024 ports from the very early days of x86. So we
> may want to take care of such elsewhere as well, e.g. for the PIC
> (where aforementioned doc also explicitly mentions the aliases).

I wonder how relevant those aliases are for OSes, do we know of any OS
that uses them?

For example we don't seem to provide them to HVM guests at all, and we
seem to get away with it.

> >> Also stop intercepting accesses to the CMOS ports if we won't ourselves
> >> use the CMOS RTC.
> > 
> > Could this create any concerns with the ability to disable NMIs if we
> > no longer filter accesses to the RTC?
> 
> Hmm, that's a valid concern, but I'm not sure in how far we need to
> be worried about giving Dom0 this level of control. As long as we
> don't use it ourselves of course (I'm unaware of us using this
> anywhere). If we're worried, we could continue to intercept port
> 0x70 alone, just to mask off the top bit for writes.

I would be mostly worried about dom0 disabling NMI and thus causing
the Xen watchdog to trigger for example.  I don't think we should
allow dom0 to disable NMIs at all.

Thanks, Roger.

