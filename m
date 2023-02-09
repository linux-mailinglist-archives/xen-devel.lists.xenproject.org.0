Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83320690B3F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 15:04:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492490.762042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7WZ-000552-2D; Thu, 09 Feb 2023 14:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492490.762042; Thu, 09 Feb 2023 14:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7WY-00052V-VB; Thu, 09 Feb 2023 14:03:42 +0000
Received: by outflank-mailman (input) for mailman id 492490;
 Thu, 09 Feb 2023 14:03:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3QCz=6F=citrix.com=prvs=397b6fb01=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pQ7WW-0004zr-GJ
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 14:03:40 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b68595e-a882-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 15:03:38 +0100 (CET)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Feb 2023 09:03:33 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5368.namprd03.prod.outlook.com (2603:10b6:610:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 14:03:28 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 14:03:28 +0000
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
X-Inumbo-ID: 8b68595e-a882-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675951418;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HwyilBnRdDbuxMM6JJ4sSuRfOgu/7IiLLvWlt4iDtZ8=;
  b=YlWNZzX5qBlezjbVVD4cG+Rmifod3mjC8l7jVmD4xpkMqzHaCsXgr+q7
   9KrFhTU29Xl53v5mb5hgMlFwy45TeyYL8xoAmkz+3s67LG/L2EgFdXL+V
   U8v3YMA05R3+sAt/E25ZD/cMppbMI+GiSNQYltTOiW3+8A4G01fPM2Dnt
   8=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 96365029
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lUhara9IJ7e5Gz/ecRBUDrUDoH+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 DQZWD+BaKneNGT2e4p3OdvjoxkFsJeEmodmGwY4+SA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmP6ga5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklWz
 domdGEsQyqjqOjtwJWgY6ow2eQ8eZyD0IM34hmMzBn/JNN/G9XmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTaNilAvuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqBtlMSeXip5aGhnWzmF1IUg1HRGLmqLqA1We8XtZ5I
 hALr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOq8seVTEsk
 FiTkLvBBzN1t6aOYWmA7brSpjS3URX5NkcHbC4ACA4aud/qpdhpigqVFoo9VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxtDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:gy7Kxqpc24DVHbcLZDTJCaoaV5oveYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qH/xTQXwH46+5Bxe
 NBXsFFebrN5IFB/KTHCd+DYrMd/OU=
X-IronPort-AV: E=Sophos;i="5.97,283,1669093200"; 
   d="scan'208";a="96365029"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ep5JwyqbLKrPS6VR+FHfA94mASTVVCSOp2GuAfEG3yU7mk0Kjd8Dt62l/2w7+KfqUmG+bxIYuUR9qhj/bxnK3SMeObo/pi6C8l9iAvm72/Vhbl2ETK7H2h3UnB/T4JAXUe0PWuIpa7Dxr1ZxJ3XYMLKzC/15hKiKAaacxNzFph2/HRY3fVb32Uz3DTP7rCXi6WZI1mwA1cbleqCckLmX7dUwWO+3n7uJI+9siCn9sFieLl7j8/peFLvC2NnRqT1dOuLED4bI4dLY8HYw1HtScbpSDymazYu7mR/xhm36x8lkimFm2gk93O1GToNZgI/0b/4NyZKx9xgv61+AXmZRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwyilBnRdDbuxMM6JJ4sSuRfOgu/7IiLLvWlt4iDtZ8=;
 b=kN+yL8cfuIqHSz6OKNCiZcDrUSGLFVQSiv+i3PH3ge0wJpUJZKtEWFkHZ27z1l+HptQck1COsv4UwrMoKu1weBSj9VuzFvLBapaOhlAs2xhiZ/H3GYae9lA+YMq9tMUzLEALXiZgaqNlIJ1k0Nnq2kKOy0h1D32OXyTzBVKk+TpBjRJ9bgb4NVErFBRTy7lk7cxPIBXpBP3KI7282naVdKtWqJWQex2BpaqVkYunmlWlwkjt++zE48+5LQuBXb4DMz3crDfxVV0mU9i/Qzhc3ExTEZEtQLcfQy6Wy90CQRuAiiappDN42qqCiNsKprqZePYAqjwHPKSr1jAMEqwLCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwyilBnRdDbuxMM6JJ4sSuRfOgu/7IiLLvWlt4iDtZ8=;
 b=LoT2GRMWRHXMt1MCPPuFIT7ilwLYiEE4Ch0fHlcpTO6WORT/qs3maeUlvz0ASK+uJyYKwcimAY8eaZ59lOZt0CZz5JEfoqjTB5+xT4xJfVN00pkg2JVEL7hHg/4p+aRq5J5lqO9S6HqVFuy+78rrmh3Xm573/GnOrmpFdXgM52M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <de0b6981-4c9a-34f7-e311-3dd360f31d6c@citrix.com>
Date: Thu, 9 Feb 2023 14:03:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [XEN PATCH] libs/util: Fix parallel build between flex/bison and
 CC rules
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20230209121156.11040-1-anthony.perard@citrix.com>
In-Reply-To: <20230209121156.11040-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0150.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH2PR03MB5368:EE_
X-MS-Office365-Filtering-Correlation-Id: 07fb5ce1-5402-432d-76b9-08db0aa66adc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	luYDRHtvqRVKR4AL3fA/GuGPFXwrdcRyeKc7Ldey9yqr7g2dfj19uedOwV9OGO2mOEImRGABPKPL+1ubSMD7V5NgnucuHpZCrIwsJmgn+3M+3CIwtge/pT7rsgsqLXEY7jU+BWK8hPAgan3gD+fH3q0YLYXfkYaJ64lkOcQYj4zlRJ+d4ZwSgpiiHqymZ2DIJYL+kw7tpgMLmy6S9LHD4Q9Kcdjj2yNT3nUJ7qtrQZmB4dqU0+CTdEcCNvpIoKZ6h5da8GjXJHMtSsAJ2zM0EV8CqzWSPhVSIvj6WgML/24yDfo7MC/nTtx46RZAO+yyL1w4RUa52t7Oxd8tslRA/HTuzGzBV5PbbIfgH4sh9dASsl4e+5W8T2G0vCYPInV10+5DSMvHWBkb9TCDYpMw0nGKCGOXzE1KiLPipwklvFsezg5upgKiOgLEU7RqObyFCaEjktS4FKSIhzf06knJdDThy1Z5lFcoS8z90pfw3DxodBU7op+Qa88F9EhlqWNrhvOlb4WeEew+qCNjTNVTCAKuvrdovdkiAgKFhyNl+Z2EXlnCpu5l/+Umo5fX4NMoXjk5jNypdM6DKNaBxyfrMAiuNe7FiJnrRhv00WvGf5X4fmk4s9nUguwS+roKzB+GEhcX5kPNP/Swjf6YW2ZFZAEmSGuqeMWjGAeJo3cC2V6zou+lo4PZj3e2YGVg/6wmJK4CJbQb7DR4EDoazSTTN/tFypdhMLJrW4WIOD5dRl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199018)(8936002)(41300700001)(8676002)(186003)(26005)(6512007)(82960400001)(38100700002)(2906002)(66946007)(66556008)(66476007)(4326008)(2616005)(54906003)(31686004)(31696002)(4744005)(5660300002)(316002)(86362001)(478600001)(6486002)(6666004)(53546011)(6506007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vjc0NlhYdnArdkJoZXRHYkwzcytyZjlmMzBRQmtlMUdXaDBDbUZRdnp5cUhJ?=
 =?utf-8?B?VnVybTI1ZFZsU01UQm1zclZmdzc1bHVmVC9ZdG4wUHhQV0paK2lMeE4waHhp?=
 =?utf-8?B?eTZhcU9rT1UzZHdvTlBlTVZ2WGJHQ0hTWGNwTkRDT01XTXgrZit2Sjdvck4y?=
 =?utf-8?B?SGlIWStPeDVrVnhoK3dXdlk1eEdncTBPZ3hoQWFMNGtYYllLV1JJZHR2aEhO?=
 =?utf-8?B?by9pUzV0NlZHTjNuTjh4TE5RZ1diTEk0VHE1M3hRRHBMVDRvb2ppcHhvYUhS?=
 =?utf-8?B?WWg3bEp0eGJSYmk3cm1BUXpkR2V5RUxEa2tyU2oyOEFSY0d5TDhPM3FqQ0Ft?=
 =?utf-8?B?aFJJdW4xbFdwTjk4OWZHV3h1ZVFIWWpxaVpHcWpSUHRqc053dFBsSC83WnJu?=
 =?utf-8?B?MzJYUEdLeWZoMXdhRjhsZDEyanYrbjVyNk1lWTY0MlZQQXd4NWZKSFZnSDJz?=
 =?utf-8?B?U3haMHUxTkd4L2NYSEM1b21HUUlmSVZOcTM4dm80dXh1dGVTbjZNbkxRbHpY?=
 =?utf-8?B?eWtQak1ESjM0TzZFTXRsWVMvTEZhQ3JrelJuVnhhS0JXVDRCbXFsWlRZOXZ3?=
 =?utf-8?B?NnBEc0hhb0NBWlRkZnpoK3B1bkVuNjIyTGNoYXl4T3ptZGZVN2hyam16bmxY?=
 =?utf-8?B?eUZMUlpEc1ZZYWJycDdPelVJTVk3WkkvNUxRbDNLNnF2eGVwVEFrVGVQUVRV?=
 =?utf-8?B?dElRWW1zbGFyQ2NZOHpaVktVQkt5Q3pKL1Zxd2tTSWxCc2VPb1RTS1laR2Jx?=
 =?utf-8?B?UmR0U3N3TktVTEJZTTAwamdna3hRNEErYStTYVFjc1ZLMjdGamd4cVpZR2h3?=
 =?utf-8?B?S0lsV1FoeXhFazBJeWFid1RYMisrZUpINjh2Z04wWHBtMEkvQzZpcGkzeTV4?=
 =?utf-8?B?U3VNWUIvQ2pRMlN0QmV1Wm1qQXZ3MXhsdktBM0wrN0R6U3FBaHNMaXB6WVZN?=
 =?utf-8?B?V1NMYVFqd0prUXRLdlZpU2swUnhJdlRENm1neHVFQm9BTjUxb2tFNnVTdkpK?=
 =?utf-8?B?ci8wVFQ0WTZmazFwbm9aKzZ0VXc0WVZIQ0QyaUovZHp4djdwaUNxWC90QzNw?=
 =?utf-8?B?WDJUcTJZSEhqbFJoRjZsL1c3aXV2Yy9lYitRTDhCMFdLMUhiV3g1MGxQNEJJ?=
 =?utf-8?B?bmFNejl0Y2FqZm9TZTcrVGNKUzFMYXRvYi9yZEtIZUdDSVpQUW5SUGNQcS9Q?=
 =?utf-8?B?QU03Q3NLdzNrelp1amo0VmlKWC8zVmdYeVRtSlM5dVVvZzVFZU5HMFRHdEpW?=
 =?utf-8?B?N1NCS05IM2p2b3hZTjZqN0xzQndhTFhSWWY0dDd1eERsRmlTZFBwV2MyT0Jo?=
 =?utf-8?B?RXJKeVdFSzZrcFVsbDYzUERRNTZLTlFMTlJCdGRuYlBDbVpxNmFkL1BJcXIx?=
 =?utf-8?B?OHVPOWVEcjRYMXNybjBDQXhiS1pBcVJTTzhzdTdpSjBuNWhQTzJXMURRb3Ja?=
 =?utf-8?B?a0FlTXBqMDl2THJ3MmoxLzZWdDYzd2tWV1ZkY3dNc3VHdjFMbUZiUjAxYWdu?=
 =?utf-8?B?NlNJNWRiQk5vUlllTlp6NmpOR0xZQU5rTGNFTzZMSHpkSk5GZklPL1I4WGZz?=
 =?utf-8?B?U3N2QUtZMWl2RXN3Rm1oeThzNHlocjhucFlkZ1REaEpaaHZMdmJyRVV2UWRs?=
 =?utf-8?B?U1ZoSGVaOHhiNlE3RW90VVZVcnNzRTNiTkRPYlhHU3BYWk14TEtmcVdhVVl1?=
 =?utf-8?B?Y3pNSHRsVnFDQjVQVGNSRmx1SHVxWk1hSHNRZzFuUFdLOStXMlllTWFKdW45?=
 =?utf-8?B?RlROUW8xc2UzT2hzSm91YWRLdFh3NDhpK1d1bnZGcVdGM2xUUHVHUURlTWE0?=
 =?utf-8?B?bjF3V2JUTGd2Mk5qVlF2bWlvSFF6VmMwb05Dc3ZjZ1dmY0FkeEZDNWlKdXNB?=
 =?utf-8?B?V1NmcUJTbUJ2YmlGR3JBbnRnK0VOdjN5QURnMmlwQXdiZW1rdzM3VlFvYnNz?=
 =?utf-8?B?K1M3OTRVcjZZTUkvOU8wUFBhWVc1UTFvazFRdXUvaU52cDJlQ3BVbG9aMTha?=
 =?utf-8?B?dFBsdjNleTJQWW5uaWpMeTdpOWdkZ0FmTU5UOUI2MFEyQy80bTZpS0ZOSnc5?=
 =?utf-8?B?SnZlUjBFSFE3UXc2RWp1WFovdEFkamh0YmNYeXF0VmIvUFBURitGbFh2L0RL?=
 =?utf-8?B?TURZQzZRZ2kvSDQrMnBSYThJWXYxOU9Lc3NMNWhXTDJVNGVUTGo0elVHUjRi?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wkP0enxLkFbbYbaNNCwmf7rEgjzlmyiD72sZuSrMxN5wBc6RwZRN2zwyY48LR9bto1kyzkJhAMHYtICKmmenbQpIn81z1bI2aO6w6tDDF5IHIQqkLytvrxd3pECxvF2Eut4762bFfT/SIpPp/cns27VEkIVLmAkHD5yTho139/mvf1q5Mel9tKnFl6z2XjeBH1e9sMJlo2Icq56x9q04bXSbJcJNZwXgGHzZGA+7+btcUSQG+G4heDRr7HLSClBe9mnJCkunfUuq8d4q3JoorKxhgv8NHahvpfqRnVY1XruW5F9viDZYWIGhl4NDTOzEW6H+W38AkyHoNC0HAps/TATW8/LaCyZMbPie2V4IpTDOiFZ/v6C6eeTOKfJJGMggfq+LL1nNRc472tsuqzcIr7t5iz6z8PjdgpginA7gkroY4CMFG0GAb7XC1UmUmiUisnySiuNhvfM9etuqhB4RZoi4NK7y+K2W3oeJiZKkvxSzFZZ3gLOrLgxl/lWFcNjPzaRRMd50j9x+sngH7HjYnW7g8Vs/1BplTPnKyA6fXNLuMTl8ghMa2uH7LjpuKRpGfcrMviRqrAD0jdNWX4WJuezDBBGk/vuPoW4jKKCg3g7CnbXCxHQuDetZClkS0K4eocDYc0kzlnxhvRLr1pG89K9tKYLp+8jDy0v+MUGVF+e1bxAIT4F0G8UFffYQcTTv0YvtsSSNho/paQnfgT5utdMw6VSOKQpPSthpj5R9UFeuZPl3NNySh8bc6NkQlEuPS2ksc16884PCs5NuxCpP1nXdI55FwnIOCrVo29V5a7weky4kjwH6usWkjmmP3Ghj
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fb5ce1-5402-432d-76b9-08db0aa66adc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 14:03:27.9239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGup5Axn4wZ5iD8r0QmtCOJ+l4y8U5hWrQITMifALj+2szWvVtKTUmm8z32FxfnOSEXdnDRbXD7amgYDyF0qyH5BdLxbJU7ck9g8QMcMNIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5368

On 09/02/2023 12:11 pm, Anthony PERARD wrote:
> flex/bison generate two targets, and when those targets are
> prerequisite of other rules they are considered independently by make.
>
> We can have a situation where the .c file is out-of-date but not the
> .h, git checkout for example. In this case, if a rule only have the .h

Nit.  s/have/has/

(Can fix on commit.)

> file as prerequiste, make will procced and start to build the object.
> In parallel, another target can have the .c file as prerequisite and
> make will find out it need re-generating and do so, changing the .h at
> the same time. This parallel task breaks the first one.
>
> To avoid this scenario, we put both the header and the source as
> prerequisite for all object even if they only need the header.
>
> Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is a very subtle corner case.

~Andrew

