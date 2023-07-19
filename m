Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A5F7592D2
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 12:24:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565744.884196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM4Lq-00044r-0u; Wed, 19 Jul 2023 10:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565744.884196; Wed, 19 Jul 2023 10:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM4Lp-00042I-UC; Wed, 19 Jul 2023 10:24:09 +0000
Received: by outflank-mailman (input) for mailman id 565744;
 Wed, 19 Jul 2023 10:24:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fyAl=DF=citrix.com=prvs=55726f7b7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qM4Lp-00042C-5g
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 10:24:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61f4f291-261e-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 12:24:06 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2023 06:23:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7164.namprd03.prod.outlook.com (2603:10b6:510:2bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 10:23:54 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 10:23:54 +0000
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
X-Inumbo-ID: 61f4f291-261e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689762246;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3+7lIY6lPCloV82GYmG0Htrh5lWSXMmWbCIu+4IUVcA=;
  b=eNfcb3+Tkw7xu1crec39SjIXwvrCjnonn1DlJYwi2lyg40IftaomIP37
   Q6IpS+YFXRB3YBATZIkSF5/hX69PMJoC7WEFr9FT/Q5yerDoZmZ4jWVnP
   liWtLuPiP0MyDz9UISGO0hYMQj0vLsSyI+3MkCkxL6vWEIrtsfJcl/LxC
   4=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 116735452
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Q1pDIa8/2JXYxps6+pi3DrUDx36TJUtcMsCJ2f8bNWPcYEJGY0x3m
 jNNXT/VaamJYWPxc9pwb4rk8EsGvJfQzYNhTwZv+ys8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqka5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkXx
 fs0JhQ9YSy/juaIxZ3gUe9HmPgseZyD0IM34hmMzBn/JNN/GNXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilUujNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtMS+blqqMw6LGV7l4DESUSWGCnnaSgq2+eAPlVK
 xE/0SV7+MDe82TuFLERRSaQrnOIswQdUN0WCOAg4Q+MzKv86RuWHWUCQXhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqbigCVhYB/9jlr6k5kx3UQ9BsVqWyi7XdGzv93
 jSLpygWnKgIgIgA0KDT1U/DqyKhoN7OVAFdzh7MQmuv4wd9ZYikT4+l817W6bBHNonxZlyAt
 3gNn46Z9vIDCbmEkSDLS+IIdJm56vCEOXvGiFFuFpUo9DOw03emccZb5zQWDE54O8BCeiLsa
 VWVuQpV6JJJFHKvYel8ZIfZNigx5a3pFNCgWvWKaNNLO8F1bFXeo30oYlOM1WfwlkRqibs4J
 ZqQbcerCzAdFLhjyz21Aewa1NfH2xwD+I8afrijpzzP7FZUTCP9pWstWLdWUt0E0Q==
IronPort-HdrOrdr: A9a23:00LNgaM+JEAoxsBcT9T255DYdb4zR+YMi2TDj3oBMCC8cqSj9v
 xG785rkiMc6QxhHk3I9urwXZVoLUmyyXcx2/h2AV7AZniRhILLFvAH0WKK+VSJcECTygce79
 YGT0EUMr3N5C1B/KTHCX6DYrUdKbe8npxBKIzlpUtFfEVPUeVN/g15AgGUHglfQxRHP4MwEN
 6x99dKvD2pfFUQd4CeCmMeV+bOitXXnNa+CCR2TyIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zoghH0/aKqttC801v523XI55pbtdP9wp9oBdCKiOISNjLw4zzYLbhJavmnhnQYseuv4FElnJ
 3nuBE7Jfl+7HvXYyWcvQbt8xOI6kdl11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 Nw2X6DvZY/N2KMoM293amFa/hZrDv7nZMQq59Ts5WZa/pfVFZll/1RwKqSKuZCIMu10vFkLA
 AkNrCl2B8fSyLgU5hf1VMfhOBFih8Ib1K7qw45y4eoOzQ6pgEC82IIgMMYhXsO75Q7Vt1N4P
 nFKL1hkPVUQtYRdr8VPpZ1fSIZMB2yffvgChPgHb3cLtB0B1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8Wo/YVjnB8GC1IBCtkmlehTLYR39jsVFo5RpsLz1Q7TmdSWFVVA1isOl5/ESGNfSVf
 q/MI9fR/XjMWztE4BU2BCWYegnFVAOFMkO/torUVOHpczGboXsq+zAaf7WYKHgFD41M1mPck
 frnAKDVfmownrbJUMQ2iKhJk8FUnaPga5NLA==
X-Talos-CUID: 9a23:t0Y+kWHMUI+EfIrNqmI+xEk4FOQVfUHhxXPuJmDjEmBCVoGaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A23wDvw6edZpEjNXJPk8AANiRxoxa872WDE02jal?=
 =?us-ascii?q?bouilFXdbMTfApx+4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,216,1684814400"; 
   d="scan'208";a="116735452"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSPo1oBFMs614CyfeLijD0mvGRX4gSjHT/5Qv+kPJRCLreSDnnGTUTCkncVkBcCJRdqaWBIztrnkV21qSdlz9aKF6+MQGT/axn1CpFGm2i1J7COUnE/i90yh4jV1jaOImFV0UM3nW5nfLbX0ig2I78xSX4KiuokrK8nka0CTtxuDqcljXzp7uydpAkG6Xx4xSPd3UqfVUZYzC3FxGL0u8CsMoR+EuoTR0QS6g8gKNuGp1mVoMSgLY36yyDHOIxiQBPFsUuGZ9uYEtLY5jyeMbdnk8M2jBMoFNQmtu21yZFPviZ/CmahKHQp/heOb3ptKwhakGwr+l9Xo9WJJ66J/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MaJNIasv1HZ9E3S6bYdCo+z4s9eakKt7nL2n+FEAts=;
 b=QCiFzZwnf4e2L779/rLcH5rvKFMnRNQPN0+A7sZDHKCUAAmRZ2AFmn2+Ix6qCqUTQ+hEysYz8K4sFqJm9NRtIv2EEd9RtfVRfPKHuywG53MNvjZ8oHsTIVcJXMwX7dYb8jucNVTd9mPiLXMB7sxtJCAeKHcZ771Nnbr5tp5KC7ssIJTuNORwRTOu8hJM4DagmShF6SddSvfXPXbuK6lj7R05vlgn2j4Yh4qXIzseE1OPYjZ6/CEWgKzsrvGmNJJ/m8jj9mpJTV8o7ARLJoTlmBz1KDiUMcNfVTpra8/Jfuf6BXPV2aVlEhN0sBQDsf+w16XLCHR6t6tftsNvv7ai1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MaJNIasv1HZ9E3S6bYdCo+z4s9eakKt7nL2n+FEAts=;
 b=rShKywXQCybLqyT1UzZNuYBznui2nWgh1sLIUwLxLu3iTHjEVr68zSM936XW5ffF7lKG2dBGnd9mrvmaXA5UjmiVdkxOHZCfK/dzPFqls8RoxtkBIz7DaZrgq172tggzt1Gcr6ofaC1jNXyJneSO1rW3asWX/uNzeaqFlZsN8DQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e0b03fd7-0487-3328-b532-2950c3b1e34b@citrix.com>
Date: Wed, 19 Jul 2023 11:23:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] x86/HVM: address violations of MISRA C:2012 Rules 8.2
 and 8.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <7c89ac0fe44dbd1ba1436a91024efebf2794db40.1689761143.git.federico.serafini@bugseng.com>
In-Reply-To: <7c89ac0fe44dbd1ba1436a91024efebf2794db40.1689761143.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0294.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7cbf67-3d96-4044-b17c-08db884240a1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EvvgLLAAeYezQGSJHzE6NUlwcye3nGTr57kJZLHSF8SrleK0w8IPdAbudc9xC7GMw2m0QE+BsBMVjD3l+vkXk5vqb58r2lLb79PdM7i6Zu4xLSrt5fg4/SqX7ieM097VKx6uzOIEJqplClaMv/JNizbxFeizDzrXftWuHMJWxGjehCY2LOWg9c8t/25Alm4NkIAS79VcQ/SobbmMyG5E/3LviPanNyz1A19NsyFfuWxHTXkdyC9sjb6IMjlzMjKOXBcEcAA6Dg/Ab7w9TaMe0+LJYEvMcjUOjRG+nx0ekMUGgI5qq5mJoff00gjThkCbP4+zCQv3DeyWLYqRoFO1tJ9ARu/ILzzn6i9lVKMYr0KF8GkwQ5EMoVmOLJqNUB7iDvxaixJaetPQ70RmMAc82b8dDJeRm6OkdM4viYbpIre7GOWI028zYItrVo6FCz4ZHj2kIIESLnH2AO7+IeVF1AdWKrqfMEciw72HE1zbPqldpIB6ZgspChyOmV6cyxSeXvehbBotSah5Jeg74d3Yww+4TnhjeqS91V8PYURNWWEhZG/FpVaU8D1Z+su1yr+Gi4NLHl7igoN8BCtph34qRDuQWNegxz0kFw/4VGLnhk5MpQ+ZR+7l2ciYmMMryLLBEQ6GyTHmmrCAF9XPmlFnkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199021)(31686004)(83380400001)(2616005)(66946007)(66556008)(41300700001)(7416002)(6666004)(5660300002)(8936002)(36756003)(86362001)(31696002)(84970400001)(8676002)(38100700002)(186003)(316002)(6486002)(54906003)(66476007)(4326008)(6506007)(2906002)(82960400001)(6512007)(478600001)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVBJdUJRNU12SXNuMkQ1WHo5L3VQUXlkeE5BTmFHbm91ZkoxNU4ycTVmSXBa?=
 =?utf-8?B?R0JTL2pnS0dqRW9JNzFkM2xJU3JXREJsWENDRXBTQ3loS3Q2VjhlK3ZTQWgw?=
 =?utf-8?B?UmZHMEQ3UUFmNDI4TkJublhLeTFlOXpjb1JWSzF5bW5jRGZoemg3N21aZHVK?=
 =?utf-8?B?Z2NBVnQvcStFVms2RFVBRGtENFFDcnZFVUlQTVczbEM1SFF5SzJXdHNyOXdS?=
 =?utf-8?B?Yk5QNE9wNnRXRE1KeE1HbVZWK0w3b1lDcmJmdW0zYSs3Zk80SnRVeFVYUVpw?=
 =?utf-8?B?cm16WjFINU9MT0tLWU1RSytsYmhzdWN5b0FZV28xamw3OG9lMmgvWDhxMGNO?=
 =?utf-8?B?VGdNR0pDQ0FpaGJuTHFwdXZrc2FsUUZZckZNTmNKdFB0OStoSzVyMVQwQ1JC?=
 =?utf-8?B?M3FLcG9iaUFHZGZwZGorbVVPYi9QVGhzcmdDL2dVU2IvVmFNa3RFanBaeWZt?=
 =?utf-8?B?ZndFbFhKSzVkejlYUjYvMXBIbUE1SVZjMjFFT2VQMVpVNXQwVWhBTGtYOU9V?=
 =?utf-8?B?Wkx5MHdSeUZwWndOb0Q2Q0g2THdJdk00SlRjWlRTWDhkeWcyM1d4dmtXZGhn?=
 =?utf-8?B?cGNMSzVqcStUY0kvcFlGSDBJczB1RVhPMDg5bzZnYUNDdDRySmRSZW8vT1I1?=
 =?utf-8?B?ZzlRcXNwTkRJQkFEU011YmQveUZuK1Z6MlF6ZHUyMWZaOHgxQmpCYko0YW1D?=
 =?utf-8?B?UEgxRjFodDVPYVY0bEVQemF4bVNrczZMSXRmWU9HMnNPYXdpVkxCWk5iODIx?=
 =?utf-8?B?VkNLM1VQZDRxYzB0OUlHY2pHTmdqcDd6eHNFbFF6WVBMZTJiM2JDSXlSbWls?=
 =?utf-8?B?ekl1VlAvSVI1ZlB6V212Z25nSkVBTEZVMTFBL09tL3RSWmZsT0czMnVibXVF?=
 =?utf-8?B?dUFxd3F1VitGVzR3T0JGa2NjTmJxV1VFYTIxZzVvR2FNNlhzMjV4M0w4eUw1?=
 =?utf-8?B?RHk1OEl1ZVBYQklDYmgvWkZSZk9BNFplb1ByVVlzbXI0cytiaGhHZzhicFBs?=
 =?utf-8?B?eWpwMVdtdDRaYVdJNmZaVnd6L0lpeGFtNWNmVldvTzVqUWcyYTBkdk1IanlN?=
 =?utf-8?B?ejVMQ1NMelNNMnpyQXBUMFp5M3FrZFFsdXVEWnJYM05EYTdQeVlSa1FFNWV2?=
 =?utf-8?B?Sk54TGoweDZiOW1WMGxmdlBlSnIrVTQ1eUtEVFVoY290VmppUkwxQlhCbkN1?=
 =?utf-8?B?Rk9GaW5mcEJpU2lRNUprSkMrSU5ySlprZkhkV2Jwa2xXREJCeDMvZFd3MVFN?=
 =?utf-8?B?Y3MyME5vOGhmY0txSUJ5Ky9JTGpqaWNBalVGS3kxbmEvczhFM3haaGc0bEUx?=
 =?utf-8?B?elVPelhlaDBpMEdxSmZ3MGlsOCsvaVRHVjZTOHBpL2E4Q1VFOGhvSTZxYkZH?=
 =?utf-8?B?Ynpvenkrbi9kV0tpZWIzYlhDSDhUaXNIWlVObnJTeEhpcmcrcXl6M3d3cVhO?=
 =?utf-8?B?MjhFclFxS0paYnJkTHdvZUVFWDRUZGxoczlUQXdSWFhuS2RWWXJ3ZkV5MWFO?=
 =?utf-8?B?dVYvUDFNM1ptQklPQWkwVEJDRW81ZzIycnZkZ1MwZWZiSnd1WnlTV1dxZTA5?=
 =?utf-8?B?cmNzalErZFNueWJQb0pnSFhPMTE1VG5PZDFQVnpKa2J6eFdocm1zWXZqajEw?=
 =?utf-8?B?UVE4a1VDTjVmM2hhcWpVcUlIenFCL3NReVF6c0E5OTZYdnpzMEE1WTRNbkNa?=
 =?utf-8?B?M1NpNGFCL0tSQkptRVZJbUIyTWx3Y0FDSFNNS0RCZ0VGbkhodFBqUzUzZ3pR?=
 =?utf-8?B?VHRlck1zTGNQYWRGRkRiZFpkL0JoeXZVK1dEK2t6TktGbndEZ3IwZEhTQlpV?=
 =?utf-8?B?UWNQWk9BNEZyckliY212aHppREhWcUloSS9GUkxpaVVjWkFuajgwYzl2Rnhi?=
 =?utf-8?B?a0hJdmRySjUzZGRuenJ1T1M3NFM0bWNDMmV4TW5hL2pIdmpEeHFKREorR1BZ?=
 =?utf-8?B?M2JSY2ZsSWR0amEyVFdvVDNIQmZCSGxIbGg2MUsyOFFTWURHeGR3Q0dtRU00?=
 =?utf-8?B?ZUVZalk4QXAxOGVreld4dkhtVFZOSHdxdWRJYTVXQnM0cXNnb0xzK0Y4VjhQ?=
 =?utf-8?B?VVhRUTh3ZUlCR21FOFk0MHIxaGRKTEVNa1RMcm9zRVpMS2MxYUZ1M0tGYmxj?=
 =?utf-8?B?MllKcHhtenpuemxMU0RmQllHRXY4U0pqcDIycmd6K24yTTdjbkRyejBsUmc0?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RMQp8FRpMnIVhiEdy5CwdcY+Ay/xXQ7m5Yxn3d5cDQ7ZtDuRrt7dUhnL0ESi0qzsWqZdVCnCpHrwZrb4wk3cmfPR4o4L+ac9tPFC/Muh5BYBQDlpKMmAIRUiF7tWLakaXSpkc3rFR0wkxWP+F/ovar5nJnbr/keu699/Le2/IW/C3bwGnPCrOs6YjB95bRs/JtFFYOlAyy9sJ5rZp6h6bUowOTMBZ9z+IoqN6LE9p8E1vOegSg1/kxMC++e4IdOoloHcGh+wYbcJ5g+Z1gfZcyUMho3XPfB/1/hJvN84qhgGPdRn5pOfbbNhhnQR9m33CbwblcuZN5b+o67aLGr7LVOBuxluXZ4FmwUQM2xDS0VU1OcT4QwaXJCNlsX+Ah0vtU5lu9jstWjifizoRHw5SshfAP6SW9UCk+pFVHNgHSfPV6XjJjX7bQCw0KcnPCCeTWIpQWEyQJIffkzxwRVRsOnrUF7ZGm6MM2ddpW+M0r85UtqKqJASY/4Vn+mfr/n0lnVGfVjgTqaAwzOymBsiraT/3eCIAWXFke5kjIlQd4aNiOni3EDqQgVHJ5c7tSentlYqlYFgYZllM0Gc4aqnX0eBP7d5c1JmQiPyzWwNcJXQ/RsS2z3xTwd1pFuJcOQKRdGxNUmpRYhBbiUxpfDBR/948VcGSagnGqEnToj5RzMTQW71qq7nNH3/W7OF2bFSYcyTuj5qkaODVDTvTue4iPvG+XMpkXgMFtY7JicOaKEefcbf2txtohjyO8hZfph4uhDw25uo5kBfrmxFuGASoZzJCAko+a6umw0doJvbxw5MzpuaNLxxWJE4zahQ25sViKzgXBlurVuJVdmGwFd6a7Dmw7U/qjJG/LFCutV8ahgb3psksmD80zdN/EgA0vnirYYus+urXyM+VLSerQ6yiQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7cbf67-3d96-4044-b17c-08db884240a1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 10:23:53.9323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8JJN3tIl4BybL2/hWsdyJsGOTH4Zkpsi9czoZhAIuwInlhDg1FfRoLEdb2HFgfNyvJKopOf+oOr8F+n7RS8HvWRNcMAotjFGFfmZPU2vNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7164

On 19/07/2023 11:07 am, Federico Serafini wrote:
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 57363c2ae1..8f19a79f6f 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -319,7 +319,7 @@ static bool pat_valid(uint64_t val)
>      return !(any_gt_7 | any_2_or_3);
>  }
>  
> -int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat)
> +int hvm_set_guest_pat(struct vcpu *v, u64 guest_pat)

If there's a u64 vs uint64_t mismatch (or others for that matter),
resolve in the way of the stdint types.  That way you're correcting in
the direction of the Xen coding style, rather than away from it.

> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
> index 43245e13de..eb9c416307 100644
> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> @@ -42,7 +42,7 @@ int cf_check nsvm_vcpu_initialise(struct vcpu *v);
>  int cf_check nsvm_vcpu_reset(struct vcpu *v);
>  int nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs);
>  int cf_check nsvm_vcpu_vmexit_event(struct vcpu *v,
> -                                    const struct x86_event *event);
> +                                    const struct x86_event *trap);

This needs to stay as event.  Trap is a related technical term, and
incorrect to use here.  (Yes, the implementation of
nsvm_vcpu_vmexit_event() is wrong.)

> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 3c37f522b9..7943e287cf 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>      int (*msr_write_intercept)(unsigned int msr, uint64_t msr_content);
>      void (*handle_cd)(struct vcpu *v, unsigned long value);
>      void (*set_info_guest)(struct vcpu *v);
> -    void (*set_rdtsc_exiting)(struct vcpu *v, bool_t);
> -    void (*set_descriptor_access_exiting)(struct vcpu *v, bool);
> +    void (*set_rdtsc_exiting)(struct vcpu *v, bool_t enable);

In this case, we want to swap to bool as well as giving a name in the
prototype.

xen.git/xen$ git grep -w bool_t | wc -l
441

I'm seriously tempted just to do a bulk fix of bool_t to get it over and
done with...

~Andrew

