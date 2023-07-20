Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A32675A93B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 10:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566467.885324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMP0F-0002ry-0N; Thu, 20 Jul 2023 08:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566467.885324; Thu, 20 Jul 2023 08:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMP0E-0002pU-T1; Thu, 20 Jul 2023 08:27:14 +0000
Received: by outflank-mailman (input) for mailman id 566467;
 Thu, 20 Jul 2023 08:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMP0D-0001wC-1W
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 08:27:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37ecb9dd-26d7-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 10:27:10 +0200 (CEST)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 04:27:08 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5760.namprd03.prod.outlook.com (2603:10b6:a03:2d3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 08:27:06 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 08:27:06 +0000
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
X-Inumbo-ID: 37ecb9dd-26d7-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689841630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=z60meDtNx5jYvrY40BCNAM50IKsscj3nDQMwXvAX/mA=;
  b=cgr0S3a3lVFKsggm+jCO+CsRJfpIEIqeWmDkDNJMSxgQzCnz1TasDm9V
   ba5XReiP6di1n0u/mnpxK3qbisuTXxeMjf2klOklgG8AG53PEJqHFC9nD
   XDXjWeN5uwCGn0JyiN5LUyx7pFp+pE07SqMLXc0x5Z1qiQgCC5VoVqlWU
   g=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 117268389
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bgTMGK+xD0RiahemH4MiDrUDpH+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WcbXm+FbKneamP3LdByO4XipBlXucPTnYUwTwVuqSA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqoT5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkly0
 fsRKB8IVSnArOjx6au6R+BPitwaeZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUuj9ABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWwnmlCNlCRdVU8NZx0We842oMJSQoFhi5+9+mpXGVeOpmf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpd9gOpMIwAzsw2
 TehndzzAid0mKaIUn/b/bCRxQ5eIgAQJG4GICQDFA0M5oC6pJlp102QCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:nBjeYq2BMe/74PLoEs3yUgqjBLEkLtp133Aq2lEZdPWaSL3+qy
 nOpoV86faQslwssR4b6LO90cW7IU80lqQV3WByB8bBYOCOggLBR72KhrGSpgEIdReOktK1Fp
 0NT0G9MrDN5JRB4voSKTPXL+od
X-Talos-CUID: 9a23:OguAtWxLYquZAFr0Eul9BgUoPscsclLY906TCEX/IH9oRbS2RUeprfY=
X-Talos-MUID: 9a23:ymgbAQSmvgrALLRcRXT31QtNEcF3zp2QSwMPy7MZlPavFhRJbmI=
X-IronPort-AV: E=Sophos;i="6.01,218,1684814400"; 
   d="scan'208";a="117268389"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuvGwHQlA5KWywFZDsOTo8OIOgG+1uQR8+iS/1C60frKPgdsrVL6KipGBr6dvxPYLriufKBfA98QS07p962U1BFT9PhfHVqVbc2eD6+NhVsw3u/NYIL3WjZzfhY/kLVVwHX7wUo1abNmnhuUUBHbC0/CAOxvWMNOeSeepCWSsM1iyhVjjfmEYW+E+9BAzM16MrHhBNmTChoq/DapjhrxUZm7jOLwgp3F6++e7z5XKqSc9PTrk8vlY07J4RL3TecmYzCilnrmw7tMh6TYDbrD3qts15aapuz+20Z4L71DDrI+5pljUJGF6L7fDVXJ0L8jQb02dry5PVbm3S8ac9X/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHmNVAJhwJyrZMNRZ2DJFQDWxfGyOuELk3JbP/xrT3Q=;
 b=FUvZcNT5+HPslFHGsngP2St3wqOGHowKZwVyDibpXsG5GechAYFk5zmDWRXbKdktnXQM/KTuXyzZuV+k5AqcaH2DR9dV7H+/vau4UMQFb6kkOyWfI4xE6vZv4FLHk1Qq+Frft/XBW0BnCPK2BxFqyP3rDR7l32CDwHhcS8ty8FeKkDgu4rE7ZWqwTCmLAW07WQlupITP6M5+5kKKaUa0f8pwX3wwL0J+NGyUH/FFGNWmHJcrAt4yjxqrww1Lv5uh9bI03aK8a4JhbonQrr1mHC06+ljy/cMg+7NgETx9Eeea9K+H/qWC+ZXGKoH/Q3HbZsF4YHKQ2QIRKE4V8VcL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHmNVAJhwJyrZMNRZ2DJFQDWxfGyOuELk3JbP/xrT3Q=;
 b=sTJ2TlGasGqAilrAbMvGvMwSoRTuTY2LocyqtrqvqUETnH9m2Lke48NTLsgo5Dvq+zh3Ve8buhhJrm92UGKeeXz5qLU0Zfs/UYzrRJ3+E2hDjxFYcqEH0ssUXtZYkii1J8rcIjQmS86e49n+Cdzof2uhS2ABM1miAy2JqrJjZC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 4/6] libxl: split logic to parse user provided CPUID features
Date: Thu, 20 Jul 2023 10:25:38 +0200
Message-ID: <20230720082540.69444-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720082540.69444-1-roger.pau@citrix.com>
References: <20230720082540.69444-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0048.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::36) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: 93afaddc-7181-46a9-ed88-08db88fb19fa
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5A0nSjhlQ7AMcdRVHyK6Qpdp0UUN8UQ9ES0nmA0UJybYx6+QKMDf1MMAxpxUupONFu+soZbTekvdifVpftQ9qjbbxcjtlwgdoROzFR2Dq29iGZd+O3AgNMDHqZ4/ZlR60pDHVpt6LLve9ZiirgU7kqIJKn9qBWiiT/GgfYhDpkzYcV4GHWqQ0DsakSIMB2rBWJEa0HK+nndkFKZ/qcsazMgoBa1MKuztF/3sAjzcuDpcQNmQtJVuCWv1fibG7jqPP/41oY92kgQExdCNS165fDHKkBbIWZy21+6K3ubbDJ/IxGk0wfjTmLOzFlIS80h/eli54uAuv6y89afJYtvcwxTU2RaggxLAmpx7HOgMrhvKa0e8hTxns8b6xWfyp+ezQJ6g6+kJSPPDKNMXZFaSqituBF4R5bp9QNd8AA+00el3Bo2fPGTw3Gb8JR2EsfeBXMVyb+Luhh+cdp5VAk2ukifDQPe8Sxup3Dwy1Gt1NxXFPo6KtryYrnaHZoBwW5r8d3SckZ+wW55S8g+zHsz1bDIu3dvDGmfA141VapEKgZ2HvwUNqok9nSVKa/4ObR/i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(86362001)(478600001)(83380400001)(1076003)(186003)(38100700002)(41300700001)(26005)(54906003)(6916009)(8676002)(8936002)(316002)(2906002)(4326008)(6512007)(66556008)(66946007)(6666004)(66476007)(6486002)(6506007)(82960400001)(2616005)(36756003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk9RNjkrR1AxNGJDZEVIOGhPek5wRGljQ3ZJa1NVbjI4M0p4NHdZeVJrWUNZ?=
 =?utf-8?B?STY0dEtkRlZUWEpSR0JOQi9Ra1BMZlBuMEFYbmhwNmhGRXdPejlnQlNiTXhB?=
 =?utf-8?B?TGFyakZMLzhoYjIrYjNieVQ0YUhNdW1xZWxTK1FCUEdGU0RtUGFJdmZLNGZ5?=
 =?utf-8?B?blZsakQ2RGFxVW5aMVM5WnRhc1pMT2c5Q2ljT0hYdElFWUg5ZFRmSEZ5V2NN?=
 =?utf-8?B?N3FTeUlPYnhLbHJrSWR3dWRzdGlhNTc3RUY4RWN3ZFB2SWFEcWRhWWdxdkJl?=
 =?utf-8?B?MlpVNDBhU0Nab3dvYnoxdEQyWDJsMWxXV2c1dlFITmdLeXBVTTA4S2RQcmlu?=
 =?utf-8?B?NmhLWlZ2ZkpYanAwQ2NnSmFkWExqMGVqbGRpVG9hM0tJR04rL0JzZXdheVF3?=
 =?utf-8?B?ZEx0YSs0U0hNNzBnWTlSYlVvNmVHbHdCQTNJZFJQcmtxTUFVdFZydllZRmlz?=
 =?utf-8?B?c0g5VEhIVytvTnBZQ05FNEpaNElYN3NVRHVWamJZdXdCTkgwV1ZUV1ZVMzMx?=
 =?utf-8?B?dGRPeXZLTXV3d3dZNzBrSU05eVVSMVlmZGJtMFdjc0NTVkZtZy9sSFFrMk1M?=
 =?utf-8?B?Nm83ZTBJMThVSWErVmN0QTJrN1puQVphTUZyczhxVklPUzVuSFFXUHFjWlVV?=
 =?utf-8?B?MjBGTk9NQ0p5SnJucnpOQWZ6UFlxYk02VzBHRTJwVm9HRjlKbnIwOVJqVHdu?=
 =?utf-8?B?bWkyeDkxVjVBbkFmNzlMNTZ5Q3VSWEhTNnc5SjJQdVhROEFCMWlDTzMvaHA3?=
 =?utf-8?B?eVRkTVhMTXhOOXI5VGM4Ly9RbzNod3N0alk2RVRhMEpySGNMRklqNWVodHVV?=
 =?utf-8?B?cXJqTFdUcjdtUXpvRG54Q3dKYTV2ZHppR3pSQ3BkSmtLTFFCOG5HWEdRb0JU?=
 =?utf-8?B?Vm9mSGZkR1ZPS0V5Vk8rWVBOTGJrWnRtMEozUW9sOGZncEVrVkp3VjlNNkRh?=
 =?utf-8?B?RXk3SGFvVkpPWlpXbmJPL0E1UUhDMHJKd05RZkZUUFdnMGhUL0psa0ZzR3Za?=
 =?utf-8?B?SGkyTzhvMm9DT0tHenF6dml0VTdVcFRSMTlrdnFJVjVIazV1cGJ5N3hhdVQy?=
 =?utf-8?B?cCtqa2pHa01OMlZjZWNyaTFocUhxVjVKUy8xaGQySGlzNVMzYUsxV3pXRldK?=
 =?utf-8?B?bHFrblFEb25DQmpjYUJzZGw3U2VOb1BhMTdNeFZjSS8vU2JENlJ1aklkNW5Q?=
 =?utf-8?B?S0wzTCtzbWRGY2wzbGsyaTY0WWtyemZ6V1lPYVZsazlHNUtUZ3NwSVhUR3Zi?=
 =?utf-8?B?emJwc2VmZ2Fsc3FySWRYODdlN2QrQWtFL2pxN1phS0ZleWhkSTBmMU9IRCsy?=
 =?utf-8?B?Tyt2T0FoUkhtdDZwNHZNNG1JdmkrZ2ozTEFKUFg0Ty8zb2gweGxPWkVReDE2?=
 =?utf-8?B?RkJJVFhxY01kTDZXNzQ1Qlg5dFBJazM1dWRlZ2pCckJaL3dFOEY2ZTk0U0Ns?=
 =?utf-8?B?bmNCVE5Ga3NTWFA3enlsaE1SN28zV0tHZDJXbkxTZnZkOEU4QmxHTTZLTTkr?=
 =?utf-8?B?aEcybStRclU1OW5xM0xaKzlySERjdE5tWmRqSjBaOFY5ajRtMitMd2tRYVdr?=
 =?utf-8?B?Tit0YzVNZDRMb1pHK2JtTG1rNWdJclZ1QTFOa0tyV1dGWnliYTV6dk0yS21C?=
 =?utf-8?B?NXVEUi9uSE5PbGlES2FYY2wyNjVNYURVaDhaMWhrL211S3FKcmRVSitUZEZS?=
 =?utf-8?B?QUFrSzFnM3VVYW1nV3FRV2pBeDRaTlpLUUFwUFFDcjF1TkNQYTZmZ1p4MEl6?=
 =?utf-8?B?Sk15czJnVHU4SHdhb2Urd2JNU1VPT3NnYWZIRDdkZ3NnNVlyRkQ3MWRTd2NE?=
 =?utf-8?B?aTJ3SnVEc25uUEFrY0l0Wis3SjU3VHdyZXBTZFU2aHVraEMzb0hiUkdEaGxU?=
 =?utf-8?B?VVZoMC9NYUdqL09IMU9mTTFpMksvVmgvR1ZDYmwwak9pRzV4MEdIdWlTemRY?=
 =?utf-8?B?QlpmZGVIWnZpZHZ1SC9qUThxYzNEMU43dGJlVzdWdmxJZUJEcGFRQktvSjJO?=
 =?utf-8?B?cU9nUTNCZjQ1RzdCZWs3OWJMVHJ2Y1pmR2hBK0h1blVaRXpway8xTVNteDNR?=
 =?utf-8?B?ZFZ6Y2k5Y3lvOVN2YVhXSld2UldoWDNBZTNjOHNqMVFETWJUQ3c5U3AxSjJY?=
 =?utf-8?B?TlIzM2hoemx4U0NraURkOGNxeWpzaUJId0NBcmNzYmxzbnhYeTY1Z2hpM0kw?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jnrrVzdqlcr/So8/tOn8WEMREA6GqylsE3twnmMtIrnY8n333pjYO1N3IRM5tFefM/X8iIWTH6jo0rpwlm4ok+l8sMTjUuWxQhwX3J3hNpLcb43N14S/UYWuB7SNmqxbIkhR61sNm93WQJ2fFIDFnJvmWCMMyvv7k9EfpXKlWlHcttbHyrvno2BM5W3M4Jo5hIm51Ir/43/5pIAB18yuFp5R/Ghz6e8GuubeUOc/3Y/Mn70qqLTygOm7hPVmYyyPn9/Ve+NZQQbr9dTlm3Nf9jIdXCnzA360TB7/kAMA5ZDFVbv+pDZJ0dUVr/dJ1wsW8IXYF07bcIP1mPyWqR2q7hfDAebeCJruO7zlWzy5x5ZUtLGHwktjmVfuCKgNWfgaEPl9OsG6M+O/f9eP2L8z5rB0gtUs3nOFfY1e+hl1jlOWu6tZRx8XhH7AZSCMKO7iGJ7085d7CgMGM+qGXgAGTUL9jZGblpwyQ10EaR4AKILTRZBXtLiEWo00+jReySHqwKKr2BRZdNH4dHmVvqGxzB3gK090XE9ICuaGUMFvHtTmCsfXFjHHXGWAsIcsZSqEe2qmK6HZAD1y+sHvcHtJmUojVA57BpQCztbHV9LEiRopfppVtI9JvdTdiEO1i9WP4UrYJ+hijMvgKjoY7ve7KOA2zF4fsjTs8sP2DhM3A/4so86fSmxy8xEM7X/uo99WQRLyfsT2zUm/A9NMdZ4mgP5cP28+VgC0IVCUTWpbAOZg8H/G9mU3JV/uuztFkrYXHIWoERgWhQ4l8pZRbK6MVHCrWW2WQtcKpwHt4kiJfYiSS8xeuoYjtdOC0/8YDw9p
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93afaddc-7181-46a9-ed88-08db88fb19fa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 08:27:06.3522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acJ6znnuepME0E9GuGQTcsgDUqaYu88GxjdOHvCSBOixQGCbml74V6VRJnnVtSHTj3Akz65uaxNOP/4dM5UwLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5760

Move the CPUID value parsers out of libxl_cpuid_parse_config() into a
newly created cpuid_add() local helper.  This is in preparation for
also adding MSR feature parsing support.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_cpuid.c | 120 +++++++++++++++++----------------
 1 file changed, 63 insertions(+), 57 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 68b797886642..c62247f9bda7 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -96,6 +96,66 @@ static struct xc_xend_cpuid *cpuid_find_match(libxl_cpuid_policy_list *pl,
     return *list + i;
 }
 
+static int cpuid_add(libxl_cpuid_policy_list *policy,
+                     const struct cpuid_flags *flag, const char *val)
+{
+    struct xc_xend_cpuid *entry = cpuid_find_match(policy, flag->leaf,
+                                                   flag->subleaf);
+    unsigned long num;
+    char flags[33], *resstr, *endptr;
+    unsigned int i;
+
+    resstr = entry->policy[flag->reg - 1];
+    num = strtoull(val, &endptr, 0);
+    flags[flag->length] = 0;
+    if (endptr != val) {
+        /* if this was a valid number, write the binary form into the string */
+        for (i = 0; i < flag->length; i++) {
+            flags[flag->length - 1 - i] = "01"[!!(num & (1 << i))];
+        }
+    } else {
+        switch(val[0]) {
+        case 'x': case 'k': case 's':
+            memset(flags, val[0], flag->length);
+            break;
+        default:
+            return 3;
+        }
+    }
+
+    if (resstr == NULL) {
+        resstr = strdup("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
+    }
+
+    /* the family and model entry is potentially split up across
+     * two fields in Fn0000_0001_EAX, so handle them here separately.
+     */
+    if (!strcmp(flag->name, "family")) {
+        if (num < 16) {
+            memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
+            memcpy(resstr + (32 - 8) - 20, "00000000", 8);
+        } else {
+            num -= 15;
+            memcpy(resstr + (32 - 4) - flag->bit, "1111", 4);
+            for (i = 0; i < 7; i++) {
+                flags[7 - i] = "01"[num & 1];
+                num >>= 1;
+            }
+            memcpy(resstr + (32 - 8) - 20, flags, 8);
+        }
+    } else if (!strcmp(flag->name, "model")) {
+        memcpy(resstr + (32 - 4) - 16, flags, 4);
+        memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
+    } else {
+        memcpy(resstr + (32 - flag->length) - flag->bit, flags,
+               flag->length);
+    }
+    entry->policy[flag->reg - 1] = resstr;
+
+    return 0;
+
+}
+
 /* parse a single key=value pair and translate it into the libxc
  * used interface using 32-characters strings for each register.
  * Will overwrite earlier entries and thus can be called multiple
@@ -340,12 +400,8 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
         {NULL, 0, NA, CPUID_REG_INV, 0, 0}
     };
 #undef NA
-    char *sep, *val, *endptr;
-    int i;
+    const char *sep, *val;
     const struct cpuid_flags *flag;
-    struct xc_xend_cpuid *entry;
-    unsigned long num;
-    char flags[33], *resstr;
 
     sep = strchr(str, '=');
     if (sep == NULL) {
@@ -355,60 +411,10 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
     }
     for (flag = cpuid_flags; flag->name != NULL; flag++) {
         if(!strncmp(str, flag->name, sep - str) && flag->name[sep - str] == 0)
-            break;
-    }
-    if (flag->name == NULL) {
-        return 2;
-    }
-    entry = cpuid_find_match(policy, flag->leaf, flag->subleaf);
-    resstr = entry->policy[flag->reg - 1];
-    num = strtoull(val, &endptr, 0);
-    flags[flag->length] = 0;
-    if (endptr != val) {
-        /* if this was a valid number, write the binary form into the string */
-        for (i = 0; i < flag->length; i++) {
-            flags[flag->length - 1 - i] = "01"[!!(num & (1 << i))];
-        }
-    } else {
-        switch(val[0]) {
-        case 'x': case 'k': case 's':
-            memset(flags, val[0], flag->length);
-            break;
-        default:
-            return 3;
-        }
-    }
-
-    if (resstr == NULL) {
-        resstr = strdup("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
+            return cpuid_add(policy, flag, val);
     }
 
-    /* the family and model entry is potentially split up across
-     * two fields in Fn0000_0001_EAX, so handle them here separately.
-     */
-    if (!strncmp(str, "family", sep - str)) {
-        if (num < 16) {
-            memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
-            memcpy(resstr + (32 - 8) - 20, "00000000", 8);
-        } else {
-            num -= 15;
-            memcpy(resstr + (32 - 4) - flag->bit, "1111", 4);
-            for (i = 0; i < 7; i++) {
-                flags[7 - i] = "01"[num & 1];
-                num >>= 1;
-            }
-            memcpy(resstr + (32 - 8) - 20, flags, 8);
-        }
-    } else if (!strncmp(str, "model", sep - str)) {
-        memcpy(resstr + (32 - 4) - 16, flags, 4);
-        memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
-    } else {
-        memcpy(resstr + (32 - flag->length) - flag->bit, flags,
-               flag->length);
-    }
-    entry->policy[flag->reg - 1] = resstr;
-
-    return 0;
+    return 2;
 }
 
 /* parse a single list item from the legacy Python xend syntax, where
-- 
2.41.0


