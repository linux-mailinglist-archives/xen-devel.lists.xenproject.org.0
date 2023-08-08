Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E2C773994
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 12:18:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579566.907595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJnW-00037D-8K; Tue, 08 Aug 2023 10:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579566.907595; Tue, 08 Aug 2023 10:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJnW-00034A-4b; Tue, 08 Aug 2023 10:18:42 +0000
Received: by outflank-mailman (input) for mailman id 579566;
 Tue, 08 Aug 2023 10:18:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCDA=DZ=citrix.com=prvs=577c1445c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qTJnT-000342-RK
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 10:18:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef067c26-35d4-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 12:18:36 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Aug 2023 06:18:33 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6139.namprd03.prod.outlook.com (2603:10b6:408:11c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:18:28 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 10:18:28 +0000
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
X-Inumbo-ID: ef067c26-35d4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691489917;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Y48+mdA12KlhD2wOqIeA0SVsEUh5pXtbmmkGEanAYtI=;
  b=PbDDz0INbvR7h939H6fBCAloI3rUHra9/SEoxMB9Eu+pARROXeFDHR6w
   w7KDi0wUL4a7SDdDjTmkYFw/hPzwWuX0mL9YBW4frSoAn2ZOPGQw52XXG
   54SCSSuzZMA4bfQL2lsREp3SEXEWk15iHc0URym6lbh7+Kizca/X/mh+E
   U=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 118712592
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ItPIy68vMaNyXtJ8KQWnDrUDLX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2cfX2CEPv7fZ2ehKoxzYYWyp0hV7JCAm9UxTlNoqXw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmNagU5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklz9
 fwZMjUcbCm7xLuxmo7iGvllhvs8eZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpiNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtCS+Tiq68w6LGV7jVDJhcHUWKdmtnjoXWFeYJbe
 1JTyiV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19KqQrD60ETgYKykFfyBsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y6
 y+OhDgzgfMUl8Fj/6+250zdijSg4J3AVBco5x7/V3igqAh+YeaNeYus7lTK6OdaG4yQRFKBo
 XssltCX6aYFCpTlvDeERuwWALiy5vGtKjTEnVl1Ep8u9jKg9mSie48W6zZ7THqFKe4BcD7tJ
 UPW5wVY4cYLOGPwNPcvJYWsF84t0K7sU8z/UezZZcZPZZ43cxKb+CZpZgib2GWFfFUQrJzT8
 KyzKa6EZUv2w4w+pNZqb4/xCYMW+x0=
IronPort-HdrOrdr: A9a23:0ixsUqAUFNOCj9TlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: =?us-ascii?q?9a23=3AdCU922rZSZNynnWytqPMBsXmUf0lcnzHyWbSGnf?=
 =?us-ascii?q?7UGEzdOTFWVaQx7wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ai/dHxA5aplDLLAZdht8Vpmutxowxs4qkGUQ0t64?=
 =?us-ascii?q?m4eK/Dg4gP2eDywS4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,263,1684814400"; 
   d="scan'208";a="118712592"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+PQxvJaK4YP062TEM/FXAJBZwmOaMlse9CxhpIbvVBiBA+PWXUnIV8yHk4bwsNHv0vL2iFe5VMn3shI2j37FI9KT4C4K3zTAqSOfCWH7K3kQtRM58qIlcCDUO4MQmgHxsg52P8TYQdq/SgpvmnujDnFsoDb6EQ5ZW+IY7E7J7ulOTI9PXSUgcUaiWu0ANdzxsSh8BZHSUC62Dw4fG6eggP5hx6oWWOfeFqcsl/s/wIGHTct8i9VIuYPdduHIEuCqjGyQ3mC1Plx5xjhZqTc7YFgqbRjBFtWEJ3Hb/pgtT1HEqBPlaWTf80kWwH2ulhRLEyJWZ5b7jcUSMP2J+SQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y48+mdA12KlhD2wOqIeA0SVsEUh5pXtbmmkGEanAYtI=;
 b=IpRRpYdDUrURu0848MF7qceY1xX3YEeRUH1fsM3PiJttVyd5OilME/VKyqyOpAcEQCltIOrPwUGJG/3KHDieKEI+zacXS+wBwkVXJEJhFGMVrdJC+fxnSCm1oytpzKaVg42aOR5UkqGbUDicQFHxVNMPLlf4cyF/uZhssIVgbnVAo0ZXhKZXupND1cDf2oT9jM4iqGdzEWeL0990cstuBl7PHXPvyl0pZ1MNJhNwiJ/4J7pXFWGGarfKmzfJgZL1x9XoVA+lcIgovIXKK7ONn7X4MprB1tl/Vw7gJ3fmpKAslMQ578O27OgrPdWMtczWqBdVdZtvORt7/eQd3WX1xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y48+mdA12KlhD2wOqIeA0SVsEUh5pXtbmmkGEanAYtI=;
 b=TxLtu7cMEudzvDS3OPu7FT24C9sScLUVJUPj9qFHMO5zVPox6qKO6HqFSLGK6s8/YxB20i2nQAyW3hlIZ8K5isIwK8Q8qoygxQ5o/T/QR7gqSDObEVUkAqtTblBh7mOKth/5dMt3zg6u3vylakFxz5oaLQvUqY78g3zc02olPQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b49777c7-c677-826f-01da-c6b5b67f5b85@citrix.com>
Date: Tue, 8 Aug 2023 11:18:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] move __read_mostly to xen/cache.h
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com>
In-Reply-To: <f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0075.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6139:EE_
X-MS-Office365-Filtering-Correlation-Id: eb87309a-f392-42bd-f15c-08db97f8ced8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0sYf5t2qeF2NAlIUIHwNfR5zsJk1h5HkhoTnziUnkgxjgRQWFQ7rHU38/6HqLQSFAfhQEU5ZVU73kU5aXILRqchgF6mfdf1G0HDEANi987FGveAXedQAlJirV35O6fz0OnP6ka0Lx2lfAj/zEF36DgczzvalzULLSALsRft3omlXeDG0jJDIzXYvaqpJTrMdMEYyqxPm5Y/r9yZaeYNoFxsIDTa7ySCDIGKHaqBIs2bt2BRtzVCZk6wkwiv3MS6oROp//EuwFbExDV0aEKw7oz722L6vyMdEc6L7BMNfoLedrHGhVhdmUZGptACpjtsEnS37IES5A8fkaOvZ7ROGfLlNgRB+FUVaMC5wt5Qx+nkA0WBXu6qz5Qt0CH3h09N+LuBVGWUXuBTnvtxzjg83y+hp0edyGHQXAxFo+UIH0eJkr/gax0OxR4j2/ZLn37xE9n2kORBA4bmwNw2inasds73nipiSc+CzjEKWNIrjpQIRGdiKPtAr5WKJDUhqpY1wNI+eVs0qp5My4NTJ0cJCf5wUaUdJY4XIXf7W3AMwfCyOVh753ouYNs2ogWQssDDeDcrFsVrQUWjCmghpFe1gfloYmYJIdR+5vYZhTX/HUh9Y3XS03qLGciRSu9peb3GyYSFaevmGFmxqniYAsD8Gsg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(186006)(1800799003)(451199021)(2616005)(36756003)(6506007)(26005)(53546011)(6486002)(6512007)(6666004)(478600001)(31686004)(82960400001)(54906003)(38100700002)(110136005)(66946007)(66476007)(66556008)(4326008)(316002)(41300700001)(8936002)(8676002)(5660300002)(7416002)(4744005)(2906002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnJoSVpsK3VpUk53dFMxMEEvcDhEYUdVQm80Y1ZQTmp1NzZCczdVZzlpZ0JB?=
 =?utf-8?B?SVBJWkZjeGh1TVEreC9XSkI2cC9NWnVLM0s4UU1pa2E5eiszb214Q3NXK1hI?=
 =?utf-8?B?RVpXYkVtOXR4R2VyV3dEeVp4MlYxUmR5aEpON29rUjhxaUd5TlRZTlUvcUU5?=
 =?utf-8?B?c2svZ0ZKakFiMktrMUZmSGJsS1cyVlBiQm9OeDFSRm9Mc3RHRnhtck96R1Y2?=
 =?utf-8?B?Z0NoTmxEdng2cVNWNG5Wa1lKMHQ2RGcxdEpwb0ZuMmJiYmZRWkNFdDR4eEdQ?=
 =?utf-8?B?dUNDN29wRmxsWnRwYmpMR3dkaW5lY1ViSDZFdmoyN1J2cGF6RHVlWlA0Zmxj?=
 =?utf-8?B?RFErYjdKZGNiZU95T21EbllwdXJNVzZkamovVC82aituYWgwVEhVM3NKOEcx?=
 =?utf-8?B?V2ZYU2RCQ3BHUEFrcWVPd3p2N1lRalZTeXpYTklleURkd3h1TXlmd2lzbFQv?=
 =?utf-8?B?eUdJai9sdmhNd1lKajJiaC9aaEhqVFZvZzVNT0dmclBnRWFlRUNHWmtyVEkx?=
 =?utf-8?B?dDBtTlhwbWNMRlFwbEUwb0RJZGhiSjY5cEhUbmlXQU0zdjFQVUFzSm1rNnVv?=
 =?utf-8?B?Y1lyWE1ROWx1WHdGRE1idmJ1MnIwYUU3dElYdmRTRlcrTTNyOUJrUjZjQkxy?=
 =?utf-8?B?aUt6aFZQQTVEQjN2ZEZPL0lSbGpINDg1NmhnZjZibWZ3cTRzdmo1aXovb05M?=
 =?utf-8?B?blZ2OTNLQlRZU2ExcVBFWGJuZW4wUEFIaGRUY2Z5c3Zxa3prcGFERld5RHlK?=
 =?utf-8?B?ZlY2SVpIUi8waU9hMUEwc1VCZWJIS3BIRHpjYUF2cEh2VE8vVWFycGxzeEps?=
 =?utf-8?B?cFE4TVcvdnRVYm5BeEdzZGtPeDFDQlliMmxkVWU3V21odHNoUEJiNi9JQ0pE?=
 =?utf-8?B?MlF0MVc4OEJDWmVtcitmcGx2Y3dKcFBCengvdEF4S3pvVzdaM0JpaGx3MFdC?=
 =?utf-8?B?ZDF1amcvSFM4eFFscWJhTzhkckdnVjB3ck5uemd0NkpsMUdJcGNyK05DVExD?=
 =?utf-8?B?Tmw4WmVRY1d6TUN2Rk96MVUxWFlUdUQvdW9VdkFSNXdnK1BmRHR0L1RUUExq?=
 =?utf-8?B?MnljMEhJZUE3SGFqU1phV3ZHT010UUE1TjB3WWNvRDRld09pSHM4Q284Q1d6?=
 =?utf-8?B?UzFzWFpLTys5VTArQ1Y4cEZXSVdVaUYrRStob3hhb3V3QVErNTBiSzhNMCt6?=
 =?utf-8?B?TGg0N2VFNG1PNEp6ZjFoUno4L0VsSUtFc2FPbmhxRlJFTXArbEZQVEVFdktV?=
 =?utf-8?B?ck85S0lEQmNjSGRkN3g1M1NHM3ZxVitBOFFnLzd4M3I5L3V5UmFOelU3VjlF?=
 =?utf-8?B?dnl2eGdKbllDdFhCZ04vWWVtR29VQkZlOFJ3K2VYYVhWL0VvT0U1UTJXN2Ft?=
 =?utf-8?B?SjVlRCtMYmtzZHBXQzdZQmJZM0xja2NRRVlVMW15Wm9PcEM4YlZnVk5aY3d0?=
 =?utf-8?B?NDdSRmh2eEl4bjEvQ3drWjBEWUZ5SkZzRlFKZGNPREVtbU5RNWZZYzcvS3FG?=
 =?utf-8?B?ZnUzQXpPRFl6Y25DZEpJTUN4bWM1RVNVU2JVNW1wMVZKZXlWT3QzZ3JsbTNE?=
 =?utf-8?B?aHFnamZBREVuOHVSeHN4OHNSNHZhdGFwZ2x1U3VMa3llOEI1MnVaSmZGaHJN?=
 =?utf-8?B?YmJXQlhVMHdtYmJSUkNWVVhuaEpDc1dCS0h1dFNDUC9ESUZEZnJLVWVzc3pZ?=
 =?utf-8?B?U3FXWmF1V0s5SVBiRW1kSXlMWDdoak00bDJ6aitjUFY0U0VXb2FZdXZKWTBj?=
 =?utf-8?B?MG5tb01lM3kyMXhINlNsWExrL0R6ZUxHM09OdloyRjNZSW9rWndUWi9ici9X?=
 =?utf-8?B?b1prZm5DK3FlTFVLaUc4TlRyckVoNHAwbThkMUE1ZzB3dmtXNXZ3N3lBMGRN?=
 =?utf-8?B?WXpHbXpYK2xNclBVajRWQnpJdERGQmQ1TVg5eUpsRjMzR1RuTFFYaGJNQnpw?=
 =?utf-8?B?Z3lhTjlINno1NDE1WHFtMXd6YkZGNjJwT3ZLWU40b0FvUkJKZHRnSkl3b21R?=
 =?utf-8?B?ckl2TW0rOUVzNHRkUEg0R1d2UWhPUElNM2ZOMWtzQ1IyS2xOVEs0aXIzK1h2?=
 =?utf-8?B?cytqK3phU1lNczFEeTJOZEpuR0M0TlBueXVjQ3dHR0NCa25XZDFPTXhnMkZE?=
 =?utf-8?B?K3ovL1l6Z01maTVITEMvUjRQa1IraVFpeXpxenlXdGJkVEh0UFdHTHBDbTN3?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?TVVoT0NGa2wrSmpVUkliUFNQaW4zdDhsTDRCSzdCU3RsaEhPSEY3VExWWCto?=
 =?utf-8?B?ZEV3OHlyL0lITXBvTWl4dUpEcHVseit5SEdLNEhkbFc0ZEtMZkZ5czUvTm9J?=
 =?utf-8?B?S1BuMHByM3RkYkR3bGhCakdGbEh1M3R1dTQwcDBTWTd6eEVFcjdQUVJUclUz?=
 =?utf-8?B?MWlFRURpQVQ2S3QyZzB1SHN1ZjlFRDNPQUVUaFpsT1NqaWl2Uk8xbldBZHZR?=
 =?utf-8?B?cS94L0p5b3Y4ejVObUlrbjhlMXhEbVFhYkZMaUlPUnFaMURJLzgwME5KamJm?=
 =?utf-8?B?NFdVcXY1SDBVQkw2NzZleVAvUmVDcDRQTXZwR1prOTNZWUhRaW5RUkkxUnZa?=
 =?utf-8?B?S1hmVGcyNnJsQjNmTkZjUGYwdlN0L2VPVFV2emtRSFRXd1RqMjEzSVRBQ3Fa?=
 =?utf-8?B?bEw4ZE9lRDl3cHNCbUNqMmJBMmZzQzdYblowa1pBUzljUjdjWk9uK2VPWXBa?=
 =?utf-8?B?T2YraEQ1cTY0Qzk4cC8xTlhaR1Z3b3JIcmgxNmJza1gxY01JdENNaG9yOUl0?=
 =?utf-8?B?YWZMeENPSjFRdFlsV1d1OE1EZUVNQUdlM3EzQU9wdFBlNXRwalNUZVc0dHM0?=
 =?utf-8?B?d3QwbUFETW55SHE0ckNDWmlwc3JKbTB2b3hPOGFZeU92RTB2Z3ZrN0pTMEw1?=
 =?utf-8?B?dzh5UTNxZjJBaWxTdVIwSjNRc0tFQXJPNnNFOGdxTStLMU1YWldTRlJEYktV?=
 =?utf-8?B?V3dFaEVsSzY3dW05d0VEa0gzZ3BpNU5GaW54U0tXMkdWS2pZOS9nNm1vKy9a?=
 =?utf-8?B?SjA0STdKQUNFYVdCRlNvei9xOUZxT2kyRUtBcWxYUHlGYVVMMldBei8rWXJr?=
 =?utf-8?B?clhpdkUyUmhqeVVLMXFoYmNPMGJ0b2tzS1A5U0s2S3pLN3BJTFVzdlFCVm9E?=
 =?utf-8?B?N2JqemFiRGc5TXIyMTBlRzYxSnJlL1VscEV6YklwMENobXhsSHlOT2dHNTZa?=
 =?utf-8?B?L1lnTjVSWXpZT29QODZIS3dNRVFwSm1nQTlDTlRlM21BYjNlTzlnUUY3clRC?=
 =?utf-8?B?QXFxa3hLUkhVN3V3TlljdE9VSUpaTnBaMnlEcVhzWWdaMXk4MEZnSCtYVUNT?=
 =?utf-8?B?cjFydjAyVGtpUkpUNEkzM2doZURPOVlhUDhZd1d5MUxXZWN3a1VZOUpJL3pB?=
 =?utf-8?B?aTN1M1k0d2dHbkplZHpkK1Z4Z0RZaE5VVnlQdXAxZTVDbHZ2RFgxZnVINEFI?=
 =?utf-8?B?NUkzRlhnNFUyaWpYNFZKWFFRSUNKdEZ5d28rdFBlTEg1aGZidkVmL3RGTFFK?=
 =?utf-8?B?ZzhkWWxhdHJKV0Q0UW9rV3h6TUdvOXQ4UDJhRXQzMWtNM1I5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb87309a-f392-42bd-f15c-08db97f8ced8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:18:28.4423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXxXMSIWgLmAYk9F/ZgvrnpU37ucWfpgxoudnwSncBgQWevwJXSLgS2t+aNWtNW54gmys+h0sui26/HotymGYDJF1uscyMFvfkczlQCsWQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6139

On 08/08/2023 10:46 am, Jan Beulich wrote:
> There's no need for every arch to define its own identical copy. If down
> the road an arch needs to customize it, we can add #ifndef around the
> common #define.
>
> To be on the safe side build-breakage-wise, change a couple of #include
> <asm/cache.h> to the xen/ equivalent.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Could we find a better place to put this?

__read_mostly is just a section.  It's relationship to the cache is only
microarchitectural, and is not the same kind of information as the rest
of cache.h

__ro_after_init is only here because __read_mostly is here, but has
absolutely nothing to do with caches whatsoever.

If we're cleaning them up, they ought to live elsewhere.

~Andre

