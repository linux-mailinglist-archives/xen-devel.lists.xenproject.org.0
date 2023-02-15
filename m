Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4257697D27
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 14:26:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495982.766466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSHn4-0002op-WE; Wed, 15 Feb 2023 13:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495982.766466; Wed, 15 Feb 2023 13:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSHn4-0002mS-SF; Wed, 15 Feb 2023 13:25:42 +0000
Received: by outflank-mailman (input) for mailman id 495982;
 Wed, 15 Feb 2023 13:25:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCKc=6L=citrix.com=prvs=4036dcf8d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSHn3-0002mM-An
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 13:25:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a440081-ad34-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 14:25:36 +0100 (CET)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 08:25:33 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5175.namprd03.prod.outlook.com (2603:10b6:610:a1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 13:25:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 13:25:31 +0000
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
X-Inumbo-ID: 3a440081-ad34-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676467536;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GZZg7f+Ds8eA7h90zdUJ2z9W2h0pzBtjARPRyk3QaL0=;
  b=CaTp9evaNMiXtAoKi1w/FuSkz9ePdAIk+crGFeRwvs/26u1kgkzkWap4
   zT1mzX0FuqmkewITJMfdiY4PI4Mc/w351DVTaKlBmLaU6oJJdnDWCMQRP
   pwRy6iBfX4XQNzdkxOW98mjGQxgdgZi3yAaafCIC0aN9Cj+CgF/f3KxaO
   w=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 97147588
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZsuikKpAIxFzyTk/LhP4L8n9lk9eBmK1ZBIvgKrLsJaIsI4StFCzt
 garIBnVO/6OMWP9Lthyat/g9hsOuJ7WxoJkHAs4+30zRC9HopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEziRNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADkhcSuIneWE+pSiaO9mq99zMujxBapK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIu9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOznr6I13Q3DroAVIAEfaWSWs6PmsXCjWdJHa
 H5E9CEeobdnoSRHSfG4BXVUukWsvBEGXMFLO/Yn8wzLwa3Riy6bDGUZSj9KaPQ9qdQ7Azct0
 zehldTzBCcpt6aJU3WD7bSFhTSoMCMRICkJYipsZRtVvfHgrZs1gxaJScxseIapgdnlMTXxx
 S2Wti84hqVVgcNj/6C6+1/AqyihqpjAUkg+4QC/dmi9xgp9ZYOjN8qk5DDz4f9eIcCZR1+as
 X4sn8mY8fBIDJeRmSjLS+IIdJm56vDAPDDCjFpHG5g66y/r63OlZZpX4jx1OAFuKMlsRNPyS
 ErauAcU4YAJOnKvNPVze9jpV5VsyrX8H9P4UPySdsBJfpV6aA6A+mdpeFKU2Gfu1kMrlMnTJ
 KumTCplNl5CYYwP8dZ8b7x1PWMDrszm+V7ueA==
IronPort-HdrOrdr: A9a23:6uwwealru5tzy4gBI7Moe2uJVezpDfLk3DAbv31ZSRFFG/Fw9v
 re4cjzsCWetN9/Yh8dcLy7VZVoAkm9yXcN2/h2AV76ZniehILKFuBfBOnZskfd8kTFn4Y26U
 4HSdkENDSaNzdHZKjBjDVQXOxQo+WvweSEieLf0Ht3XWhRGsRdB2AQMHfiLqTafngjOXN8Lu
 v62uNX4z6tY24eYMiYCmltZZmgm+H2
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="97147588"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwjoeyuZ7Xdt4HVkp+fFlgcuqPAOwvgO9yMf4I1xGnj62kfflVYfADOphrPkMEPJ/zZVdOd15TFA1MQ8hsj/Ik7qgJvjegvAfYK5k0dUepfu1CHBh4BmhXt3wcXJs8+Tm79L7HeXLg5BpU2xpAldxtpKFyrlDgO5DCrJ5UQIaluDFFSy0J8uSB+b3JbGyUe6erMJ/j5yHTsFNPDyk9K49pXi2kXO3fTEzbizb5L/FHQF5eui+y8iM6dJdztbaUUPL4zUwGXtt3jCG7lSLxyN+Pr72vaVo7L8Ei1re/bLz2voYMopHqhQBxtQrrGU+V4NeweoEoVvMpiVs6vK8ZNZBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZZg7f+Ds8eA7h90zdUJ2z9W2h0pzBtjARPRyk3QaL0=;
 b=Le/e/s+ItMUxJH3Q4Tbd9mYjSwVX5bX7QhzhwUY0wiPWun9YGFj0yVpgKubx0Bw0IYq1vS4iKDCbKJ/4nzXFx9Ir3aSLywO1BSyn5scUTyfAE9qkdemY2z5AuveTgyIB3x4Nsqc74/gRDwx/HDlLwq51poi/LNAJlMsB3wZDqhcb66a34LTuZoKREnDqPzcde4wVwp+JCBhbjcn3Q8dhdHWitigzVxN+OM6ZZX19ne/2rJv+dxVLed93Wh6eD+xj6dUqhnrVkkgv4NZ0S0FQj62YS/ZL3wRQ3KTzosO4LFBIQ6r2RTyTjhOGSoRfS1zLBcdaLeD9FLWoAdL/Nov9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZZg7f+Ds8eA7h90zdUJ2z9W2h0pzBtjARPRyk3QaL0=;
 b=hKw6KcOlDzST+sM5tJQ+QOJUoeUsd00GPPhKT3DxT05BquL9OC8yr0BY9qIKLeWTamC+ET/R76Fm6ZaDkdPiKk323s+3KHWk2ItLqbExtFlCgRcthX7cZKQ9prE/PGIpXR3zek1Hr+X9WesVdchYpmpQ0ylJdYrCSdksZk7HHMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6b0b2163-a8fd-4eaa-2219-972c02aa6e49@citrix.com>
Date: Wed, 15 Feb 2023 13:25:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] x86/Xen: tidy xen-head.S
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <afb02f3e-3d69-07ca-c3ec-5bbeeceb5e55@suse.com>
 <28bd8aec-cd41-7b5c-0f32-12c79595134d@suse.com>
 <7b0ddd99-4093-b72d-ba5c-ea145c0bf2f4@suse.com>
 <6abdc32d-5a18-20dc-a300-754f2b164fb7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <6abdc32d-5a18-20dc-a300-754f2b164fb7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0394.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH2PR03MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: 67042ab8-ba85-41be-a142-08db0f581c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dz9bKiTECnuOIBPwzIxRVENMl0PDYojVNK5Fyv3gdoDyFyFx2Cn5QmG/bSPyqaG7H/iyH2aHREL4h/iOGk2hLe6BYwoa690fPwEktI196H6DU/sVU9K8iT4QMouIajsC438aJtuJA3WsnCdKp47eScZZdgOnNAWhKJs4SLFMGO7kCLuFwkUJoZLgjVjFPd7+vX7TBHHHbVMgWXNfcCXvPnGOMPVrLple+9jlYfXlyOT2uSf1P4FBvm/bwL4B4RLQTtEJtP5Er9hl+a/yJ1q/iKi6N48WmlJoQ9fNMOg3Fi3n7giQm40SwBqsl4hy4ds2DduZHWnY/JQdfxwEks7pi1E1TA5fXwamazlnKlqyF/fuJaE/wQBTFMZjkoOkf8JUv7fLN/R3le+e0f56s48DKYzpBBh8TF6EZo9wM3PLKj3BMiBEhf2/ljjQY2eIC8UlGJD48OftuwI7h3UWiJXgRFEBzkRHf/kmXkvmnG8ykSeq84bSuQfKQwPeice25gdqAr5N5R5WS3KG3oNWHRdZg4wHHFlMw5TUApFhsw1S8c16K7l/TN3hHMjrlNwAplHZ22Q628FMG3SiAZQhXVQl1d1qd0UHTF2YNDHeirrf2DaKjuluzUaFmWThAWTSjhit6jVaj3z3OjtVRFH333w36hu8lUCEHSWO+KuCg+jiSwxB5G1y30IUSEv9ro50Zo4eSWiUkagRG9cU7sBWsLGfpuNGvBRpiO7ikdFSCj1iqrg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199018)(38100700002)(6486002)(8936002)(5660300002)(478600001)(41300700001)(82960400001)(36756003)(2906002)(26005)(6506007)(2616005)(6666004)(186003)(6512007)(31686004)(53546011)(316002)(86362001)(4326008)(66946007)(66476007)(83380400001)(66556008)(8676002)(54906003)(31696002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z005ZE05ZU9YVVRHbnIvcXBWbGlaU3prSVdKNVkrUWR2Z0pjWXhXb1pJWTZo?=
 =?utf-8?B?cHhBWTRKZUthQ3k3SGFWWWRDTmZQZWkzaTVpMTE3enBPOWFjTzBsTks3RkE3?=
 =?utf-8?B?NkFOSmZCbXcyMUFhM1FPRWowRkpYT24yL1kyaE5vcS9OY1RjU3RvcmloeW1N?=
 =?utf-8?B?ZHhoM3FMbHY2dUFUcEx5QkhOODNSUFNwWS9mK1EvMk1xYVN4VFJXaEx6RlpV?=
 =?utf-8?B?NjNIL0ExWTBmcjcxNU43aUIyakR3MHpwNXkwUXVaS1djZVRVcXQxWWNYbGRj?=
 =?utf-8?B?UU5ndHpldmpKQTl2ZmdDTmJtTW5UQ3d6TzljbUE3Y09XcXRGaHBKWmk5ZTIr?=
 =?utf-8?B?V1hyRjhYWW5uSDhPY09QaFVVdGNUUzhBNnJrK1BzZ0ZpNjZWMEpkR3hwNVUw?=
 =?utf-8?B?djQ0aS9qL0o1cUdlQ0tYb2F1M01yVmN4MmRESGoxNWQ3L3UvU29sb1dyekt3?=
 =?utf-8?B?eTFjMWtLSGNmRkl6Q3JLQ0NMREo1YUdHbmRYZ1kydHF4b3lPZ01kdXl6UFhQ?=
 =?utf-8?B?eXJwN1RLdS9CTXZkUDZWbnUzakFrREJXQkNTdnNzMmdORmlvU3lDc0ZValgv?=
 =?utf-8?B?WWFPSGRPQXo2OW5FekFURkYrSlVWdmdoV2ZGZ1FTRU1LSTMwOE1kYU1GV3NV?=
 =?utf-8?B?RG80M3JaNzg3TGRxa2xPYjVHY1RTT0FQbmdZeHlGSnl6RmR3UDIwZTZGRytB?=
 =?utf-8?B?NFdZbk9SdHB4ZWp4ZllCcEtyTUJzZmRaenF3WU5aSjJsbkNTLzdLUTh0TnNH?=
 =?utf-8?B?blJpRnNQWWpiTzdHcTRHNjRmQXJTckVxUlNxWnh6THRrWFVSZmppYjlVbFQ4?=
 =?utf-8?B?V1V6TDFlTXlwOEhqRUdiTGNUYmp1UkNYTlFGVHMzWlFERmZCNXpBRHdaK2pV?=
 =?utf-8?B?bE1sSjg5b0d4Z0czUEdmNlhuTXZzQ2t2eGE5enpETXBDazZMUVo1alNDUkZU?=
 =?utf-8?B?SDJKd2dnd3BsWHQ4bUFjVE04WmY1TzBDN3U3ZDE2c2hwNnFPV0dYL1Q3YmJL?=
 =?utf-8?B?Q3YwdkdFUjZZa0JCMSt3US9iWWNYVjUweGo4M0FCUW5Ld3dIa21mNkJwT1Uw?=
 =?utf-8?B?RHQ4T0RMSDFCUUMyKzdhOW0rcDlFamlJWnovMGdLWHJCVDBaQXp2ZzBXU0gw?=
 =?utf-8?B?ZXl6aDEveFpzU0gvdmFNZDk4dXBvN0xDSXVyejdKc0doK01iYkpCZGlJbnlH?=
 =?utf-8?B?NWxvT3c5eERQTFV3VlZkZm1XZUhpNm5NZWNxeXVoTUpGMmJISDNYclJMQ0VH?=
 =?utf-8?B?T3UvY3JaRXBUVEFoZHl2cWsrbVdZc0JwK0hrRlJCd21SejV2aHQrMENsd1BY?=
 =?utf-8?B?UUs2Vm9ld0JEcTdRb0tXckZSbFFRUWd6SHR5NGpDRm5DNERmQUVKTjNtcDFx?=
 =?utf-8?B?bWZaQWttR1RQUytTb2xja0xhdmR5dSt2NWhwdnV6QWNQTDBUYThSR0tIMkZK?=
 =?utf-8?B?NFhIQ2MvSlhMSlpjeFJCcEx3TmpYbFBKckw0ZG0rSlJCQThkS0YveVhRd2JT?=
 =?utf-8?B?MUdTbGVwT1Y1SEFKSWlsVk9hUnEyc3hPVVhBMlJzaTV0VjluejBjU1B0RFZ0?=
 =?utf-8?B?M0VkZ0MxYW1oNGZ2UDJBQVRBOFdFUlRxOWRtTGk3SjJUNUtPa3ZpdnJHRUFT?=
 =?utf-8?B?UDl3TDhpSDc2RC9BNFllQXBpTDF0djR2ZlhOa2JzL2xnM0taOVlyM0V5NUMr?=
 =?utf-8?B?TTBITk9QSDJsRWJpZVlJWjNvSnM4czVSN0lKbHQ3NStLQ2w2M25qVXlyRnRw?=
 =?utf-8?B?Y3J0LzZPNDlyd0V4Y2NQSU04UHpKc1NGa3BjV3VSN0VVNDd4YWFuKzd0OFY3?=
 =?utf-8?B?VEJyQ0ZLRmhTcTRiZjBSd3ZuMzgzVm42TVBRRk1WR09COHlZeFkrTFc0K2Jx?=
 =?utf-8?B?MlF1U3l4RFc5MHJvK3h6QTBZcVdDQ0dYUHg4cjE0MnZsalhoVzZBSkw3cDFp?=
 =?utf-8?B?cFpsTlNsZ3JvOWRQSmQxeVpqSUMyMVVoVTVpbng1eHFFMm53eTdKTTRpZTJk?=
 =?utf-8?B?NWdRWk11Q3ovN29zdzJOeEdBSFYxSFFXamROa0t6MHFkVnNzZURWbUYyak9F?=
 =?utf-8?B?OGlFcnVpQ1hHSk9vMjE0QzE2enZKT2N1S2tqZmFMVjhpRTVxbTA5dkowaG1K?=
 =?utf-8?B?aUtobGVEVW0vN09XVHlpaEpmSGNGNEc5MWZ2RS9zd0xWSlRqdFlJWVV0azd1?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?OFFKS3A0cStpQk5rTFFLM3pETmNkaW1BT01UbklYbHo3aUdYOHdXQmQzYjg0?=
 =?utf-8?B?b3hJa3B1RXNQUTdLVVRVdDdJR3VwTXIyS29LRlBSQVZOeWNFZUpuZVN6WU92?=
 =?utf-8?B?TXlnR3h2R1NKS0FxUDhseDRZdjBpOG4ySTRYSk5YTUs0anZrTm16YWNJN2J3?=
 =?utf-8?B?a2NTWGYrbzhUTTZBOXpGczloNEZUM3V0c2ppNUc3Vngvb0xsMm5hVFA3NGJG?=
 =?utf-8?B?R2g2K1kxTk9sdnpjblZrOUV1ekMzNTdZRzd4WVJzTmlOM0pTOS9uaGMrWkhK?=
 =?utf-8?B?aVNJQVY2SWFRaEZyNUNsTXlETVU2eERUdm53R1FEK0JnTk4rNGI4REQxMEdL?=
 =?utf-8?B?SXhxTEovK2xuSFFuNGVNOStIOFBrODc3d3BiV2xITGJtTXZwY0ZVUHVTdXpJ?=
 =?utf-8?B?TmJ3WThDM2k0MFptLzllclNYUlVZQVZvVHdPY1l1OFY4UldnalZNL05ybFR6?=
 =?utf-8?B?NCsvNGQzbllsWFVkZFRLTzlQZmNEM3oreEZKbHorUHlxUHdhdHJNdjJ6Z1BL?=
 =?utf-8?B?Mk9uZVo3SXNwbG56ZU9oR0RIZW9KNGdVK05vZ3ZrcWs0SWxTL0k5eXY3MERF?=
 =?utf-8?B?dyt4Q05FMFhXenRWcEd2enNCTEdIaW4welpPOWNuK2EwYW9pNVFtNDVkRHV1?=
 =?utf-8?B?OWxxYzdHWE9wYy9lUWNIL3h1cktmcC9PRnBxRjA5UEg3ZitkZVZqWWl4S2h1?=
 =?utf-8?B?NTZXT0ZBQUZyYXV0M2c2Z2F1M25mazIySzY5UHc1cm5DeFlrWFdtY2lhWGZN?=
 =?utf-8?B?MldTMmZxcFVDUkpZclYzVnhFak90MnllSXNNMERta3RyZHJBYnU4aUFidnkw?=
 =?utf-8?B?QktkR1Bwb0V3TXI1L3RUUU1Sa0x5WGQ0MDhSYnZHVHMyYnJsWWJxZVNDQWVn?=
 =?utf-8?B?S0hiRVM4bk9scmFHMFFqZGhCa1pwZzFCTzJZbnlGcU93VHJ2MDg4SG9oYTY3?=
 =?utf-8?B?aVBqRjE4NVJaTHpsdzBKN0EzTDNFOStHc3d5RFBidnFQbDRjVlc4UVZ3UG9t?=
 =?utf-8?B?MWVzcGxDdHdUMkQycnJmVkx5T2VPeTJvcmdia1J0Um96Mm5PQ1NaTzg3aUpv?=
 =?utf-8?B?b0tMbHdDTSs4WGo5S2hNRGM1Z1Q5NS8zZnFoMHdQNC9ZMmFXc01Bd3lKaTcr?=
 =?utf-8?B?d0lJZDViSGhCcnZ5SE1UckRzVjVCNGtPQk5EeE15SjBJYnVXdFZFZkF1K3I2?=
 =?utf-8?B?RndWYWFNTXpBVldDTnJyK281WDRsYmdkblhmeFJwRVBhdUpCWEdZUDhSaHdi?=
 =?utf-8?B?VXV5dXdkUGgvaUpWM0R6VjNhME1qaENJV1ZkZjJ0SCtUcDFXV2wrZDZLMUtT?=
 =?utf-8?Q?i5C+DL03xSCOxxx5FS4dqANvf+3gsHMgXK?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67042ab8-ba85-41be-a142-08db0f581c62
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 13:25:31.2227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msge2i7v/ML9YCuxAjp2wf+yNIJDh8e3g46KxP90JJBUfUdY+bidKNB8+f1FYYUUC70hWoVBJE3uukShxothvM9c2kugjZKM6G0gHDyyNok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5175

On 15/02/2023 1:12 pm, Juergen Gross wrote:
> On 15.02.23 13:42, Jan Beulich wrote:
>> On 15.02.2023 13:05, Juergen Gross wrote:
>>> On 15.02.23 12:33, Jan Beulich wrote:
>>>> First of all drop 32-bit leftovers, including the inclusion of the
>>>> file
>>>> from head_32.S.
>>>
>>> I don't see why we would want to drop 32-bit HVM and PVH support.
>>
>> HVM doesn't use this, does it? But yes, the PVH aspect as well as ...
>
> hypercall_page is located in xen-head.S.
>
>>
>>>> --- a/arch/x86/kernel/head_32.S
>>>> +++ b/arch/x86/kernel/head_32.S
>>>> @@ -524,8 +524,6 @@ __INITRODATA
>>>>    int_msg:
>>>>        .asciz "Unknown interrupt or fault at: %p %p %p\n"
>>>>    -#include "../../x86/xen/xen-head.S"
>>>> -
>>>
>>> This is wrong for non-PV cases.
>>
>> ... this and ...
>>
>>>> --- a/arch/x86/xen/xen-head.S
>>>> +++ b/arch/x86/xen/xen-head.S
>>>> @@ -83,27 +83,33 @@ SYM_CODE_END(asm_cpu_bringup_and_idle)
>>>>        ELFNOTE(Xen, XEN_ELFNOTE_GUEST_OS,       .asciz "linux")
>>>>        ELFNOTE(Xen, XEN_ELFNOTE_GUEST_VERSION,  .asciz "2.6")
>>>>        ELFNOTE(Xen, XEN_ELFNOTE_XEN_VERSION,    .asciz "xen-3.0")
>>>> -#ifdef CONFIG_X86_32
>>>> -    ELFNOTE(Xen, XEN_ELFNOTE_VIRT_BASE,      _ASM_PTR __PAGE_OFFSET)
>>>> -#else
>>>>        ELFNOTE(Xen, XEN_ELFNOTE_VIRT_BASE,      _ASM_PTR
>>>> __START_KERNEL_map)
>>>
>>> This will be wrong for 32-bit guests now. I'm not sure the value is
>>> really
>>> used in Xen for non-PV guests, though.
>>>
>>>>        /* Map the p2m table to a 512GB-aligned user address. */
>>>>        ELFNOTE(Xen, XEN_ELFNOTE_INIT_P2M,       .quad (PUD_SIZE *
>>>> PTRS_PER_PUD))
>>>
>>> Move this under the CONFIG_PV umbrella?
>>
>> ... these occurred to me over lunch (and I was hoping to be able to
>> point
>> out my mistake before getting feedback). I'll check whether VIRT_BASE
>> can
>> also be moved into the PV-only section.
>
> Thanks.
>
>>
>>>> -#endif
>>>>    #ifdef CONFIG_XEN_PV
>>>>        ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          _ASM_PTR startup_xen)
>>>> +    ELFNOTE(Xen, XEN_ELFNOTE_FEATURES,       .ascii
>>>> "!writable_page_tables")
>>>> +    ELFNOTE(Xen, XEN_ELFNOTE_PAE_MODE,       .asciz "yes")
>>>> +    ELFNOTE(Xen, XEN_ELFNOTE_L1_MFN_VALID,
>>>> +        .quad _PAGE_PRESENT; .quad _PAGE_PRESENT)
>>>> +# define FEATURES_PV (1 << XENFEAT_writable_page_tables)
>>>> +#else
>>>> +# define FEATURES_PV 0
>>>> +#endif
>>>> +#ifdef CONFIG_XEN_PVH
>>>> +# define FEATURES_PVH (1 << XENFEAT_linux_rsdp_unrestricted)
>>>> +#else
>>>> +# define FEATURES_PVH 0
>>>> +#endif
>>>> +#ifdef CONFIG_XEN_DOM0
>>>> +# define FEATURES_DOM0 (1 << XENFEAT_dom0)
>>>> +#else
>>>> +# define FEATURES_DOM0 0
>>>>    #endif
>>>>        ELFNOTE(Xen, XEN_ELFNOTE_HYPERCALL_PAGE, _ASM_PTR
>>>> hypercall_page)
>>>> -    ELFNOTE(Xen, XEN_ELFNOTE_FEATURES,
>>>> -        .ascii "!writable_page_tables|pae_pgdir_above_4gb")
>>>>        ELFNOTE(Xen, XEN_ELFNOTE_SUPPORTED_FEATURES,
>>>> -        .long (1 << XENFEAT_writable_page_tables) |       \
>>>> -              (1 << XENFEAT_dom0) |                       \
>>>> -              (1 << XENFEAT_linux_rsdp_unrestricted))
>>>> -    ELFNOTE(Xen, XEN_ELFNOTE_PAE_MODE,       .asciz "yes")
>>>> +        .long FEATURES_PV | FEATURES_PVH | FEATURES_DOM0)
>>>>        ELFNOTE(Xen, XEN_ELFNOTE_LOADER,         .asciz "generic")
>>>> -    ELFNOTE(Xen, XEN_ELFNOTE_L1_MFN_VALID,
>>>> -        .quad _PAGE_PRESENT; .quad _PAGE_PRESENT)
>>>>        ELFNOTE(Xen, XEN_ELFNOTE_SUSPEND_CANCEL, .long 1)
>>>>        ELFNOTE(Xen, XEN_ELFNOTE_MOD_START_PFN,  .long 1)
>>>>        ELFNOTE(Xen, XEN_ELFNOTE_HV_START_LOW,   _ASM_PTR
>>>> __HYPERVISOR_VIRT_START)
>>>
>>> Are XEN_ELFNOTE_MOD_START_PFN and XEN_ELFNOTE_HV_START_LOW really
>>> relevant
>>> for the non-PV case? I don't think so (in theory
>>> XEN_ELFNOTE_MOD_START_PFN
>>> could be used, but the main reason for its introduction was PV
>>> guests IIRC).
>>
>> I wasn't sufficiently certain for MOD_START_PFN, so I'd prefer to
>> leave it
>> untouched for now. HV_START_LOW might be 32-bit PV only really; I'll
>> check
>> and then maybe drop (or move).
>
> Fine with me.

HV_START_LOW is PV32 only.  It's the negotiation for the virtual address
split with Xen, and was never implemented properly for PV64.

MOD_START_PFN is PV only.  It's not applicable for HVM/PVH.

For PVH guests, XEN_ELFNOTE_PHYS32_ENTRY really is the only necessary
note, and that's what XTF uses.

~Andrew

