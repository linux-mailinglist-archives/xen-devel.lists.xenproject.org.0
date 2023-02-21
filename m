Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD4969E64E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 18:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499119.770145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWmL-0004fQ-Pm; Tue, 21 Feb 2023 17:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499119.770145; Tue, 21 Feb 2023 17:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWmL-0004dF-Mg; Tue, 21 Feb 2023 17:50:13 +0000
Received: by outflank-mailman (input) for mailman id 499119;
 Tue, 21 Feb 2023 17:50:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMCI=6R=citrix.com=prvs=409bf5b25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUWmJ-0004cL-BS
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 17:50:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dcdfa78-b210-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 18:50:09 +0100 (CET)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Feb 2023 12:50:05 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6357.namprd03.prod.outlook.com (2603:10b6:a03:38c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Tue, 21 Feb
 2023 17:50:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 17:50:03 +0000
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
X-Inumbo-ID: 2dcdfa78-b210-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677001809;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GMN6LHchYXPg04l7Sv0xrPy91abE6HYskkMDgI03Hgw=;
  b=M2XbUgqZyStJph7BF5ZkkLsa+DzyYTRM6NMbbgdUt+hE37QS7ownwUkJ
   sy1Fp7rtSqZQO27lAc/t6HJHYXEvEakYLRKA1L1jdTpeO6a4JUp8zCe9A
   LRdJam9EkBB7QPpKts3TI9ioy2sjhMYGcnDPGi/+wUajDKzLa9yEhBteF
   U=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 97324379
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ITEoY673phvkX0VKeid+TgxRtA7GchMFZxGqfqrLsTDasY5as4F+v
 jZKWG3XO/eCa2OhfIh/a9uwpx8P68SAx9FjTwZqqypnHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoR5QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 vM/eWAtMTm4je+Mg+3jCblhpcsZBZy+VG8fkikIITDxK98DGMmGaIKToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Okkooj+SF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNNT+fkraE76LGV7m8qLSwLeQO6mr6grkCMY/xcd
 GkSxCV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc9TCYm0
 VKhlNrzCTti9raSTBq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kOYgnnS99iFOu+iYTzEDSpm
 jSS9nFh2/MUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswqByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:Aeh/36Cz6KW4+O7lHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="97324379"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/6QSn6ve6w/qRvpvROddLcm4f1TxKmlE0Gk1xZZupJCPg3pMRU7de9EGaL3N7x7LI5xMkVGZ3FgbfJld+bRTGgUqLc7v0MBxSPERl1FNdeMyaydJG5cqNZGjDcNEg02mekAHTsmViQuppxWoA9igJ2kYBPvFGjq0QcB4aulzq8EzZxMu371VahUpNXL1tJZ6aDOx1f9nNkw8rNAZSANmwikZyr4pbDE+7vx1uux3wZyI2ubOo/KqkWtkTXlejbSNxBVDuw6Z3VWhHC/CyJZoVFYDIY24uGt480egPLN7Ztc+kkyiLwQA9OSu6AJaRpNsIKSvby2/jvgFbgQhJqE5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMN6LHchYXPg04l7Sv0xrPy91abE6HYskkMDgI03Hgw=;
 b=ITVrHhrd7jIAMFPagyn+us+mU8fsPnik+vS6B/VPhS7ZrU5DPZes8YMyyfdFW3H6TSSm3b8JpZw0QVkF3bXpxyxjAlb5W1rUsql71KVw6ZzC0s8sx5Sbp/boZbGxx0jJIuYPglxsoQmisSEHvqYCFpcf85IY+38qaV6L02+7gxEIiOuU+oy8NQk58S4K+oAAP0zpEDSeNIo/N5aAVGFxAZsVOdB/RWq31lEqbzxcomOHwvT6jYKmepJ9Ya4xayyGProuZTM5Bp+08kNBeUdabUqN1XcNwxIjOq1UMGKAARqArc4OjwP1W2RD7EgGBoU054A+z0vTH9Phd/GY19dXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMN6LHchYXPg04l7Sv0xrPy91abE6HYskkMDgI03Hgw=;
 b=Ag+qMQOacoHwisC6Tgxvn+om//rDBT9dQgLFLKK8Llk2CSizB5FxjatpLFTa9+Un5FsSGeNTmd/zQRs5OHtmmpORd4+3CMJP76yJ4L78VykMRR+zU5P2sXfGRIcHZm6NgPbVSf/ppBK1iFZYsJOzy6f6ZgRJwI6Bxipb31MMSZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6ae598df-b200-d20d-85a4-183200048313@citrix.com>
Date: Tue, 21 Feb 2023 17:49:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 1/7] automation: Remove CentOS 7.2 containers and
 builds
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
 <20230221165542.7642-2-anthony.perard@citrix.com>
In-Reply-To: <20230221165542.7642-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0131.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: a00e4692-c434-4a9a-3b4d-08db14340f3d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HCzXT5tEesZN9CpestJTVK7jidZeGta8Ey7Y80AASviHi/Uj137P/9LqJmCUG6SK9/7VHGDaIUPkp+/oy7cT3TB+8qf4kALtvxdjEebsg40hmwiRrI4g1iFXW6j27mtTNl0sCrnocxIMNYWCPqje5OsMe4cEEuxy62YSOZ7hza6HRosDyWEpZEbyU/dt5y4IHrFoM43MnaVdhqshk8zt7Ej6Dmwf6OF2Ck2l2BBG8yWH2HMhTkdgZdElLDkKEntrwaa/cgEH+gE2izmdPQufy1LpmIvMdR9iuxbQHaR4maiuUaoR5ccyEK+YdFbXwMFW3nmt4PyCNV7+qROYcPulamaFcdLc8kenQ/VSIzwCbhYyrO9TennWwR15nPayVgQ/psRlpoF8oZMxgxUxWujCwm6ho7usMrRPa1s0uDIlyQ56yDS0eBHsl/OLkY196Nqy9W6TQ5nmPUeO72OJ3cfe/rWr/sCsiUvypmwgjgEsdNyvDQFjQnzI0Q0dMZA7Uep+A6lqFd0pAOS9SBzPHn4jR3jd0dF2+DDQ0tPJaL8qXdPuMBiLobPkOtf5g7hAvg1jcogDVdr3xUaJEYSTaRhtTQ5aBcT4VzWn9m1utTWZJo73t+KgJPeFN5/1tsQLHWk/Cys9Ua1NZs6zoVDN6viKaCDkr4BoajHpQILmLRUT6T2OlmzM03PbkKNSLAzD6IiQkvCCRzP/B+iplCDaRvNbD3geGwHzQdYX3GO13Ab59Tc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199018)(66556008)(8676002)(66946007)(66476007)(5660300002)(31696002)(316002)(41300700001)(4326008)(31686004)(2616005)(86362001)(186003)(26005)(6506007)(6512007)(6666004)(6486002)(54906003)(53546011)(2906002)(38100700002)(82960400001)(36756003)(4744005)(478600001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZCtienlHQisxUUdDYm44NHd2cFQyZTJKTklpZ3NPeE9USWU0dlVFckdtYzFq?=
 =?utf-8?B?UFFmUVp6TG0rTm9oVEo3Um94SGwraUJhUGNRSnFUeE8wTFJFbmpMOHZNQTFG?=
 =?utf-8?B?ZS8rVHErUjdua3ZDZG0vYm96My9oZXNGcWhuaHQ4RmhodFdVWXVtMmZKVUNr?=
 =?utf-8?B?RmF1NzdVRjlNdXUyKzJvRnd0d05TNmlBWkRxK0ZiTCtGYml2cm9aYjk2T0Nn?=
 =?utf-8?B?Z2Q4TjNFbEZ2NlBmbUVHaFFsOGVrcmVTWlpzdG5wYXd6L2tkRGFoSnJKS1U5?=
 =?utf-8?B?cDRKeHJETDBubEtzdmNmVEVMeXpodXhEL2JyclBHOHBJUngyK0RWQkFsOVpN?=
 =?utf-8?B?b3RGTXhkak9OQmtIbEQ5aWRjaVp2TDFhYk8xQU9wNlZPaTU5VW5LRDdKY1Fo?=
 =?utf-8?B?U3VpRUlFUDJud0pWZDUvL2krcDFzUzZwdFdSN1ZTV3FaRmlGaTlvNHFUSTZ5?=
 =?utf-8?B?TUNUazVsbDE3RXNWQjQ1amRlakZYbURxSUpGNHpaVFJ4TFIyQ3o3ejZabWxh?=
 =?utf-8?B?VU45d0ZHa1habTdnSGtKa29xWU1JYzVmMEI3MTBKZmZsazBXaWYvWE5ub2d2?=
 =?utf-8?B?eDQyK1k4SGRLbjZqOFJGcG5yTDlmR1R2VFY2Vm8zejBobkptQmZJM2tsYXlV?=
 =?utf-8?B?QkdrRGFBdGxBa29xN09FaW5jM2xMOXlpT0xvZnZpK2pIeTFHTTc4bFcwZ3gv?=
 =?utf-8?B?NGtIWkVXamIrL2R0d0kxdkpXV1dWVU1nU3F0WXZSVXUvdkRPQlhoTDh2VmJx?=
 =?utf-8?B?VHFhQWVubVlxRkxMTU1raFltRnNUQnBMdWlqMW1GdGUvazZ1NGpoQ21NUGtW?=
 =?utf-8?B?ZzVmNmFzbE03S0hjb3cxanh5Q2tVYzFnM3JrOXgyejJjcjZmWll5ZVlhcERn?=
 =?utf-8?B?YUZYdUlzd1NFTmFzbWE4QjlQdXpkTGZ4ZUxrWFlEQnZMU2c4U21xbFM1dW4r?=
 =?utf-8?B?WU1MRGpYL1pEUW1tcXdGOC9kck5Yc1RpZWNUQk9YcWdQN2dVV0JpcUdTR2pl?=
 =?utf-8?B?NWhBVkJDb1NKemgwN0RLRzVDdTFXL3Z2THlZUVU2akVvOUhJTnhheVJyOWRR?=
 =?utf-8?B?MlhwRjdlZEI2U3BsRU0xM2pML0h5QWwwTlEzK2lvRmNZQjhzZUplMlE1WFB5?=
 =?utf-8?B?Rm4wdkNORU1jZzlwci9zd1dNUmRtUlR2WmpzZUlxOFI1VjBmNVZ2Z3BWMlBw?=
 =?utf-8?B?cm9zK3NTT2krNGtDZlh2cnNpZmFpSmVvemRaSGhhZUZLV0NBQ2NXK3JxbENj?=
 =?utf-8?B?NFFhUE5WRXVwUUN2OHRoRXNublZvSTVBWGttbEIwR041UFlsV1Nub0pJQ21n?=
 =?utf-8?B?YllvdjNuMm1RdjJmWkFMSWRjZ1pZMlhqMTBaQlREdElWTmgvby9ON05jaTZl?=
 =?utf-8?B?TjlIRjZtR3NzTFdWRDZQRXE0am5kKzF0a2Z3ZDdiM2grNVFQUFVTd3ZHeXQ1?=
 =?utf-8?B?Zms0aXFmVkpEMUtpZVdCYm9pdC9xQVNLS2MybmtURFdPeFJNNmo3OTk1NjBF?=
 =?utf-8?B?cjFqZWVTSUhHcWFldXNTeXRNUkU0K0hPYnJJK2RLQ2xNeFNjNEw2T01BbFpu?=
 =?utf-8?B?bTJjTXoyRGNqRTQ4ZTkrM1Zaa3pQMGVob05sTGRzWThMNWtiN2o1ZDJlK1VQ?=
 =?utf-8?B?U0V5V2VHZDZHWGt1V3luZVBNYXlLcVlWR2FYaDJpaGRsQUk2MnZxS1dvMS9N?=
 =?utf-8?B?NXlLSUlSTkJRUUdpakJmb2haQmwwQTNiUVBWK2xkcGFFSm9PRnlYMHFrY2tj?=
 =?utf-8?B?alQ5ZmFhZ1VVSk44TG1vVDZVUXUvaXM1aXh2dURYVnZNdEJnc2ZaQUpmckZX?=
 =?utf-8?B?Wit2OTdjSnc1OWVHMHJhV3hSaENBWmZIUjlDSlBMclZQYzVwWnRSSVhBc1Y2?=
 =?utf-8?B?YmtvN3U4djZidjNWdjluamg4OFBiSW81bEE1M3lBb1BaWjFzM1g1OEdPVDNl?=
 =?utf-8?B?dFd3UlRHM2JkdCt1b1BFSTVGWTRUYjN2LzNsc0RETmJ5U1IxYVhTZVpRUDlO?=
 =?utf-8?B?ckNwVmRaTjJPVXAwdStBR3o2YUpteXllMkZnMTFBZDlPbkJFUzFZYlhxZ0ZD?=
 =?utf-8?B?aytVcDRtN1lLMGUvcnoxbFFwV0ZHMk1KMjd4Ym5Wbmc0RjF4bFBHUDhXQUdE?=
 =?utf-8?B?TDdmaWhnQ2pvZjVmYStidnl4VXhRYmJ4Ukx4d016a0V6a29RbWl4VEEyMDla?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	khnlGZcgSOUt7wkSftMdQPmw2ZZy2KlxpNLLhOCoHW1aiZvXQF4G5Dr2Sx+Bs0aGkZ3vQBk3BB6OCxJwNl/zf927ichPeqyLnKaquw+m6OfumHA15n7DD88lxybqCbsow/nLav30U7F7vm7N2PgercLz5WvlH+DSEYH1DfwicHEzLGpq6rXop3GRDzfWIgPaV8ec4xl3UqvqwAwSQJ0ynPCImf/R/53NUvozylm4b2MRKjFjuHYZ4OQBBxcEiQyk/iWOs3RhI3vvVV9GPqrLt205hCc5kl+kpCahOtauM0aLYc6hOb5NffbWEY6+vpLBbwFFpyc20unqG2A6k6OXJnx1iW7i+y0DmRBX3ZOGXZb0c5rW8sRxSnEWIygPftiUEGL53YNN6U4NC50p4af9H1EIZOd+oFMv6AbnSYH8vQuIrIkTGwJhDLcRQxjgQtDxfZuHehh+7wlbCPkZte+z8BON1srmKoKRHJxDnUMWXJKGPZ4hYkh/Btva5HJKZ4m+hgRrGoVYrA6S8b08IfVFfLZ/U6t6n7iMpx+OFKv1tK4o/z0KdC6SqdBQ5LooTPCvVi6Z/ppzlH7TnMMrvci+Ak7DTowG/o3oHWmbZzkJyXoE0MK+wIsl2cTwG1G5LBfoLwpz1D3uYXvg+gxrzD1BDKGDj+kyqb2FT50HVy/Mte/J5cxaAp/pq48fcZ2xg04173ITeqfWEU3fC3JSX15a2AbrZrH5tNGZlRKQNC17ZqIQCZWLUKklSpuO+OKYYMeFTkBXQcrURdXC2OorvE57H0/0GcrOdR20D6C0cD+TKPm5KHXZEH24a/3XTRAhRDtW9o84DefJrgspuafDlPkEhw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a00e4692-c434-4a9a-3b4d-08db14340f3d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 17:50:03.2864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsG6EZyRcJfHl3NjdEwsWU5t7irfOwDYVEk/svTFO1rLSl9pn6ecdSTunIvQlH3ziNEKfJ0rucucdfEPhtuB8SQXcUjPhbaj0AeN9Igl7nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6357

On 21/02/2023 4:55 pm, Anthony PERARD wrote:
> We already have a container which track the latest CentOS 7, no need
> for this one as well.
>
> Also, 7.2 have outdated root certificate which prevent connection to
> website which use Let's Encrypt.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

For posterity, this container exists because Doug wanted something which
was roughly a XenServer build environment, but we've long since moved on.

~Andrew

