Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806165F0D4A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 16:19:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414255.658439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeGqT-0007nB-SD; Fri, 30 Sep 2022 14:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414255.658439; Fri, 30 Sep 2022 14:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeGqT-0007kd-P2; Fri, 30 Sep 2022 14:18:29 +0000
Received: by outflank-mailman (input) for mailman id 414255;
 Fri, 30 Sep 2022 14:18:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6brQ=2B=citrix.com=prvs=265c464c6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oeGqR-0007kW-MM
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 14:18:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd23ca75-40ca-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 16:18:23 +0200 (CEST)
Received: from mail-sn1anam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Sep 2022 10:18:07 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6426.namprd03.prod.outlook.com (2603:10b6:303:121::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Fri, 30 Sep
 2022 14:18:02 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.020; Fri, 30 Sep 2022
 14:17:56 +0000
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
X-Inumbo-ID: bd23ca75-40ca-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664547503;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=oVBivcDr06qSaBZ5ml9C89E83mR/cBbKZM2vlB7zlwo=;
  b=VLpgt/Tp+9vkWo3Uencg0Opl+lKDdJ3mMr0u1P0ffu5T5bRYFbNDTRot
   Ns09SjNWJuDco1nQUQeLFGquvN9nIwdbLSk0iiPKGiz7Om+4/4K5aDtsP
   Duir25Y6Z0lty9xdVQSEDPnOaZjWGPhOIdS12hkC+Rt+j4uDsmOIsLHSv
   A=;
X-IronPort-RemoteIP: 104.47.57.41
X-IronPort-MID: 84231282
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hWokVK14EVjRqnVx9PbD5chwkn2cJEfYwER7XKvMYLTBsI5bp2dVn
 2VMXWzSbqyDNzH2fY92Oou18R9QusTRx4VnSAJtpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6WhA5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqVB3vtMGmIN2
 8UbDzsJKRWnq7Kk64u0H7wEasQLdKEHPas5k1Q4l3TiK69jRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/K4/Zui4TQ5FUZPLzFKt3ad8bMXcxItk2Zu
 njH7yLyBRRy2Nm3mWbfqSv21rWncSXTYpI8OYei3eRW3geBwExCEhQbTX2Hvqzs4qK5c5cFQ
 6AOwQI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8ywSTC3UATzVBQMc7r8JwTjsvv
 neWm/v5CDopt6eaIU9x7Z+RpDK2fDMTdGYEbCpcFw8duYG/+cc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNs2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:tN/7MKnf60JbDsVOtGH7ZWbOxezpDfPDimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msl6KdhrNhRYtKPTOWwVdASbsP0WKM+UyFJ8STzI5gPM
 RbAtVD4aPLfD9HZK/BiWHXcurIqOP3ipxA7t2uqkuFIzsaCJ2JuGxCe32m+wBNNX17LKt8MK
 DZyttMpjKmd3hSRsOnBkMdV+yGg9HQjprpbTMPGhZisWC1/EWVwY+/NyLd8gYVUjtJz7tn2W
 /Zkzbh7qHml/2g0BfT20La8pwTstr8zdloAtCKl6EuW0LRozftQL4kd6yJvTgzru3qwFE2kO
 PUqxNlBMh342O5RBDHnTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzZtB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3MciFXtuYds99R/Bmc8a+L
 EENrCT2B8WSyLTU5nhhBgj/DT2NU5DXytvQSA5y7yoOnZt7TBEJnAjtbIid0c7he4AoqZ/lp
 v529xT5ddzp+8tHNBA7bQ6ML6KI12IZy7wG0SvBnmiPJ07Ghv22u/KCfMOlaiXRKA=
X-IronPort-AV: E=Sophos;i="5.93,358,1654574400"; 
   d="scan'208";a="84231282"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMYiRb0O5Zn71KJz/eIohqSr0RY+a+NJkIeU8kgLK2gbpWx4wEYuga140uLED4BbhJPI5Z+4NigNWwOQc429G4d2iMuSytRUChkK904ShKvwK2nWsPy+62Q810nRIpY7sMhh12g/TFkeA+azfZJyxao8bkYo4fULyKishDgfgvCfJLJMKJK56pAT4VEzueT/1Zf7wH+71b0f8r+0LeUiN4k8NpOz/LhZausIK1R2PODMjKRSAMklrxYmmTcA7dKfW1X+AaVrBtpQZKNJOX+7ykIqJxBxgLSqBXONXYt1/HrkdozZxFC3JG7bUxH615N9i4A6aE9jBq0WnxE6MW5uPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4P5LOK2FjEE0nC05OzIne4cDkC1S7mT9I06GQuHXkk=;
 b=HKCW9PdC2i40ul2g/XM9sNKGl+O/hWgGG0oE3JFL1DMk/7eHrlGmokX/hkqtuKCEvjjj0+ydujWjHiuCykbpEzROrWiPZ217yGZIDxNondSu4qH6g4QyTAuInEHmTQ7Orxiayq/05ELeQKp1BZNizPEWzZzNsWhclg3qHyikg++BdWGkLbhd4RKsEYlwSyYDRJnOy0LATkZWYpj/XOjVY4+GGMIzjq8GPzSatORM/xnH55c2dWNskRHyAOGtCya+HAOh6JuhAqG2Rsqlr93F6A9bToarC47UEr0DXlvsS45F0Qjm4MjOZwxDmaTY8sJMyjEdQrtMDbilW8hYddEv/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4P5LOK2FjEE0nC05OzIne4cDkC1S7mT9I06GQuHXkk=;
 b=DamFVzewKgQKBqvHaRauCT4FFcr9m/xULubJWpPwO+ECKhtwJwUwmdd86YaLYLdF6sNEUABj3d0jyy9bQkcIrr0mk5d8jBID1KgFXd6stjPWhnJBtKSI03aVD3gdvyb5/Ny7HRRTMPZQiGWs1GTjoYLSyKVHTwhOD4zdRSRRZYs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17] x86/efi: don't translate EFI memory map MMIO regions to e820 RESERVED
Date: Fri, 30 Sep 2022 16:17:37 +0200
Message-Id: <20220930141737.67574-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 0645b985-7297-4f63-f5c3-08daa2ee913b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TWLayYEPdSXq4AV27btDCGKj4GgQ06OqZIYAiAFmCYbPGbd6/BnDLLQHIagSD4ndI8F4OcyKJ67Um2cIZvB6p9zgSIj1WE6zE8OmGqUiz5BHSt3raP9yJV8Th89/lGC1r0GZWicNlTh4/99Tbqw5Xy5sQJLWUV7Cs5AH406asGJDI0oMiYAWv3ym6RueRfLIXb1L1iS8SDTphROB2KX7voCU/qU9ViS42evDFiMNm5Dx4DD1dQl2ntBvLL9Me7f6Az0rr9pBZ3pO3uNsA1ixIWzp+EFSTxZ2qXzy/+Y7vE2NjG6k+NeLCGtn2HPsw3uzd60eiirw163pGiImLFkKwbxr3n5wdOIvA4fksLfIFXC56GFdqLDAEtumLJyF/wDtDlYfmFTKo7ZTXkFLiqa8IC6MvnR7t8mzcLNeniGL/hWZDMK/jWXFHGS0jpgBF6AyEGxPRNQrmRyoYuwjJ8XLM55EeV2t5tu7UHAz0jNQGuQgWdMB7+GIJfO3LIuPJrhMJ2l54tdtn0Wz148TeV1ry3KmN58lzuHGYs/WAB9DX/vPqcmG1QB+QqDUjHYdKYneKvywLGe5fo/upL79pEpoqXXs+PfRXiit36isNFIt4NkOSQ/N98fEOwujZ6f1yE02qNLc9MHt6j74OLdWVP8HwTJxx786MvcOgV1wwX5U6p2jH8Qp01VTo+XxBPiqnM6BGcSxZXD+2H33WGwAAqmwDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199015)(6486002)(6916009)(478600001)(6512007)(26005)(186003)(6506007)(1076003)(2616005)(54906003)(86362001)(83380400001)(66946007)(82960400001)(4326008)(38100700002)(8676002)(66556008)(316002)(66476007)(6666004)(36756003)(8936002)(5660300002)(41300700001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVR6bCtvNUVyL1FLZDVya2FBQkR4QlhUcGk4b3E3Tm9nWnhuWEpZYnFvMUF0?=
 =?utf-8?B?NW1sVEd3Y1d0djQ2SndUemJwbTlGZFBpTk9WTVFHZlVVMmVRYUFRYWxxcWFX?=
 =?utf-8?B?QVJ3WWUvTnZmdGs4WHRZOWJKREpGUndrRFZDWXMrenNkM3pIR3JmMW5TRXdP?=
 =?utf-8?B?U1Z5TEk1K3pqRjFXNEQvYVNCZ3B0YzU4YTdQOEhqVEphUk9NTGFyS0VET0ha?=
 =?utf-8?B?ZmgwOU45VnZRT0IxMEZZa1AyaThlQXdIcUNrVXhDUDF4bi8vVDA1anZxTnhl?=
 =?utf-8?B?bVNPZElNUHVlNS9kL0w1c2o4Q05DNzBhbzNpKzdxYWtPeVIzQ3Zid25pN2ZY?=
 =?utf-8?B?ODFpZnh0RVFGVk9QTHZZOG1BOVlCUUFsR3Fmb1JTSjRMY0kxdENwd29LZ3c3?=
 =?utf-8?B?TmV4SzE3cVhTQ2RQQ0tEUlRjRGVDY1kycG9oYjRLYmlVVXZxVUFMcVppWXkz?=
 =?utf-8?B?aXdkWk9mbjdpN0MrSU9nSHN2cnc3RFhyYzhDcEE0Ui9sRSs2SHg3L09CZlZq?=
 =?utf-8?B?bGxGMnJ1bW13bzJFeWFDWEZ0RU14c3lwdnVVcEpFT2dyWjVxTW5NVHp4ZWVq?=
 =?utf-8?B?Nm1JN1BqV1kzaXkrYVVYd0xBRU5Vc1JEKzN5NEZLZXdvM1N2T2xZNFdCZW5G?=
 =?utf-8?B?aHpXL1JXZitCencvK014cnZBbFU3dmJHUUFEa2YvQ2pRUmh3ZTJXQkczYVMr?=
 =?utf-8?B?THJNb2I3Q3lRQWYyeWh6OTcwSUY0bTVUN1djQmpTZVUvd3J1RndQWjVxemUy?=
 =?utf-8?B?WUd2bjZYRWc2UTd3aG9hNG9CbklBYkxMK2xpSGJEZFdzUUZ2bXVvUmI5VDhh?=
 =?utf-8?B?KzZHNzZEaFdvWFFGQkozTzVNN3dXYlRwQ3ZhUitjZ05kVnFHbXVVZXd4M3F4?=
 =?utf-8?B?Skpjc3E2S0pYY2o4Z2JUbVdWTE9ubllLbi94UGJKbWR6eVlWbGZ3a1UzVWtw?=
 =?utf-8?B?UXM1aUJaQXVxVDdjWXQ4WjlaOS95cXdTRHVqbUl1am5IczBvSlVpYXB0dEpS?=
 =?utf-8?B?UWhXL3l3RUZrWk4yaDhQYVRucVl6ZUxiT3RaK3M4bVYvajVrblY1L1NjblhS?=
 =?utf-8?B?RzRFVFdSemt4OG0zamJSVDZMQUhoNjRKR3Zsek10K1lSQXF0dU90a21ENExY?=
 =?utf-8?B?ZkhpMlVac2xOV3Evbk03bjV2a1Q4RjVsQ01iVjVBMitIa2FkakNFcEdMWElB?=
 =?utf-8?B?NWsyTUgwVG8zdWR4NUVzRDc3WVljaG84Z1p0RCswdmhkb25lT2J0ekVKNkF0?=
 =?utf-8?B?RGxUcDUrNDBvdEwwbm04a2hsOFJmV2tqMFJBWU0rRCtldFp6bnQ0b0pscXV0?=
 =?utf-8?B?SXRnRi9RY3RtTnk3cjZDRzlEUTRkVU9KSWt4WWFsQi9iYnVuaEJ0SUQrWktU?=
 =?utf-8?B?WnNFQXp3YmNlZ0ZMQ0xwMFV4SzdTZlVNc1FTdWg5NEM5bW93RStrbXNhYUsx?=
 =?utf-8?B?Z2V5cVFCN29NRUJqcjVxUlExZGQ3STN6ZzhlUlZOSzNYZk81SlAyb085V3lK?=
 =?utf-8?B?aldOZXVDY284NWU3LzlkN0g5Q2ROYUJSS1NQeGxNN1hBNTQzRDFKbmJqelJU?=
 =?utf-8?B?UGNkVlk0ZE04U1F6NnNyNWZqZU1DQ1RCL0haQWZZLy9MVGhiOWJpOUUrR2Ro?=
 =?utf-8?B?THN2YitjVmhucTh4YnJ4dU1BbjZ2Mk9lMkt6LzVGNVZhUURHTmJSYWVhNnU3?=
 =?utf-8?B?WkNseEtLeS9ndkVTMWttVUl6OEZrb05aUXdVTVZKZVBPcjJ1dXVuTEthTkc4?=
 =?utf-8?B?YnBKQWxPTk5hRkVLUEJyck40a0o2TUdKYmtGMkxUdElnbWFNYzh1cXVNdWdk?=
 =?utf-8?B?N2pCTTBhd0FUOWhUN1FYSWNFZmZyWFRQcmpTN29UaHNoYzh4S1lnaFR0dkJ0?=
 =?utf-8?B?WHd6Vm1LcWNFcGlveURyd3FiL1l4UjZqQm9ZWm5NNUFkaldsUEJYZ05tdE9E?=
 =?utf-8?B?L25vNnBIeEdPVUQvVnAzd2MvWDQyWHpCcHFRUWF4R3BGb2ZYVExMUjgxTC9W?=
 =?utf-8?B?OUw1TDlRN1E5amZpRk8yZUt4TGV5a3RBRTUxUUt1cjZhK2lPNGlFbnIvV2pq?=
 =?utf-8?B?VVI1clhxOThhRDA0OXFXVWcrTmU1L0V2VjBUeXk0MHpUd29CaE5rUDBXR2hY?=
 =?utf-8?Q?sXJYCNt1qhTwXbmFeHIv2aK4x?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0645b985-7297-4f63-f5c3-08daa2ee913b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 14:17:56.2792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Av1mww0o+RvYKGOMSN+nrCWAHBZAzS8xVCi8lpU+YcPpdi3VDKYFyQ55kqm0owYLCmfrhFtrpnQ0YCutsxpbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6426

The EFI memory map contains two memory types (EfiMemoryMappedIO and
EfiMemoryMappedIOPortSpace) used to describe IO memory areas of
devices used by EFI.

The current parsing of the EFI memory map was translating
EfiMemoryMappedIO and EfiMemoryMappedIOPortSpace to E820_RESERVED on
x86.  This is an issue because device MMIO regions (BARs) should not
be positioned on reserved regions.  Any BARs positioned on non-hole
areas of the memory map will cause is_memory_hole() to return false,
which would then cause memory decoding to be disabled for such device.
This leads to EFI firmware malfunctions when using runtime services.

The system under which this was observed has:

EFI memory map:
[...]
 00000fd000000-00000fe7fffff type=11 attr=800000000000100d
[...]
0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map

The device behind this BAR is:

00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
	Subsystem: Super Micro Computer Inc Device 091c
	Flags: fast devsel
	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well

For the record, the symptom observed in that machine was a hard freeze
when attempting to set an EFI variable (XEN_EFI_set_variable).

Fix by not adding regions with type EfiMemoryMappedIO or
EfiMemoryMappedIOPortSpace to the e820 memory map, that allows BARs to
be positioned there.

Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I don't understand the definition of EfiMemoryMappedIOPortSpace:

"System memory-mapped IO region that is used to translate memory
cycles to IO cycles by the processor."

But given its name I would assume it's also likely used to mark ranges
in use by PCI device BARs.

It would also be interesting to forward this information to dom0, so
it doesn't attempt to move the BARs of this device(s) around, or else
issues will arise.

And of course the device must not be passed through to domUs, as
disabling memory decoding on it can lead to a host DoS.  Not that it
makes much sense to pass devices like the one above to guests.

It also makes me wonder whether this playing with the decoding bit
that we do in Xen is safe.  It might be more resilient to only disable
memory decoding when the BARs overlap a RAM region, as that would
indeed cause issues.

We should also consider moving away from the e820 and instead using
the EFI memory map for things like is_memory_hole(), but that would
involve translating e820 memory maps into EFI format, which might be
easier and more reliable than the other way around which we currently
do.
---
 xen/arch/x86/efi/efi-boot.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 836e8c2ba1..12ad94cd71 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -169,6 +169,14 @@ static void __init efi_arch_process_memory_map(EFI_SYSTEM_TABLE *SystemTable,
 
         switch ( desc->Type )
         {
+        case EfiMemoryMappedIO:
+        case EfiMemoryMappedIOPortSpace:
+            /*
+             * There no suitable e820 memory type to represent a MMIO area
+             * except a hole.
+             */
+            continue;
+
         case EfiBootServicesCode:
         case EfiBootServicesData:
             if ( map_bs )
-- 
2.37.3


