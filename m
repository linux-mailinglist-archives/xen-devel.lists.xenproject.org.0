Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D034F76EC14
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 16:14:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576409.902515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZ5V-0003u8-0a; Thu, 03 Aug 2023 14:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576409.902515; Thu, 03 Aug 2023 14:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZ5U-0003sF-Tt; Thu, 03 Aug 2023 14:14:00 +0000
Received: by outflank-mailman (input) for mailman id 576409;
 Thu, 03 Aug 2023 14:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRZ5U-0002oj-0j
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 14:14:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc79d45c-3207-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 16:13:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7728.eurprd04.prod.outlook.com (2603:10a6:102:e8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 14:13:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 14:13:40 +0000
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
X-Inumbo-ID: fc79d45c-3207-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLXTgIzBsoLcmZt7rW+wu/iPCIyUeJdy8BuJnyx8rmvH7xnlzYrwbaWnrQZbqV+hmRfd3FuJHSm7ivuUdCUyyg85KIBGR6JTT2lkClbyy5WqEeSfWfKyIlZHYsboOMcfjAqOE8f9fLoxAxusIwBwaQNdXeqeUhlgQ9cf2dRY3c/dsb1tzP0LfyxzxPfdZRrgxH3p/ZGAeLFKjWDdfPqW/aC1NXS9sPbky1QCV3zzOkbNbhf0DSIL8SeVccBokh6ER+NZcJvPYhkAscmRz0cJEPVxeyMsfzJOcuu5+xJ9XlTLF2X9BwMxSlALN3ae8dRF4JHVxZ+I3aBaOu9vh56ZhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NsEMr+SmwoWPb2iqiSjroBMiSElrK3/QVNBH7KDaf0=;
 b=knIDQY27A4an+8ZB8PvR+F4F9e8XPVibeJYXUKWQleIH6zBCEMJyBwVbqk6EbO+/Ict+wE9Y6YoWiFxmmDqKjwvuuXOi8ve0Zfm4eI4xGVNgzfGPyT7qF0YWf0dUdNpw4CtGD+ztY5ZKhZrZYh1Zihkp0ITMjLKnKNWd9ZWvyIVbyRq4VIDBFYNgp1VLKHP7AirwE9jWt32yYDiuvCX+0JVktOkw+KJVvtuHgWboh+mS79CEjVrrN5onGrlkkV1Fww8N5XRf1EbEhL9PX+ucYFptC+K9qkIXTfOAqtHO1l0IQTVrLhdTiAGmSl88G10Ltrp4XqLtLcRoc/debdf8dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NsEMr+SmwoWPb2iqiSjroBMiSElrK3/QVNBH7KDaf0=;
 b=LeASbGVGkheh+IMXy0veaOE0hl7qmaUbImKYD5VceKVi16wvAdF8hN/4NX7aOYscCLM8byc+KvNONDOtEOaUgbZqzh76rj5yDeCP/pdjN29p7YpfuwLK0meBZ96772/MRsdT57FJbs0ZGRrsNzgkwYeFEvZCGaNN7S5StJPjWF5BWuWvg+j19PK9wmkt9RhQyPcNImQXGqtzfxqIjSNqmrHfMztqSKnEy2sjSpJou7fFt/usY1YyQve6BV5fhIwq9ZSDlrGjR1FLBMTpLgWEH4tZ62hwev7gdrAgXCe1AqyaKWcJ4gcZcFcnfLliLxcJEdVtiEvAtqx+Gk8+xnyVsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <226f087d-34b1-1a27-4048-f9c6ce3d2d76@suse.com>
Date: Thu, 3 Aug 2023 16:13:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] libxl: build fixes for recent CPUID work
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: 148290da-a9a8-43b2-4af0-08db942bd601
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Neru8GpTiXQhTBClxggpEhDKaE87bbaTF3MDW4o+EMTEXyPyoJt0AMy/qio0HdfCaGAd6g/6AnJHOaVKfevrSLpIXO08ldxsLrAXq6GyYRwMarKeadqQuLZ8RxtMvdEH3cmBd781uokWncK1RhTTnsBDaIbGKrxX4VfbgHh+jG5XiHqvtOSpKeXbzkDHGMpnXGfk5y4zUr+RfJJ8D/CbrM2ajBXymHdraIt2keagw6lV6QzdorWTdZEFpuXkF3QvFUBLq4iJSEF2VIC0TuHhD9VomldP4crv/g5x/pARIyOUTJ2unCoF8oHWNzQ1lZSdwVE31TMt8PArchPS6YLcXM2snNuaAKsLRbnOCiwjiAX02fB6e/f4W+lAddTQUzyx0ZS+9AaE85da68r72ONqwFa07hJ4//Dccskn9RIKltZbX1STW0f2hYdcuLmthVhQMgY4SziYABGwZWjeffI2+XUXm8RVuD8F7/dMPgMmHRI/FTsfwveX3tlf6gv1tr7CVfbppyvgku6SJzA/YgEvEwBBZ2eYzGCGPgJx+ZZ6FMvYPFrPXDd106Q4pt7cOpOseZQWUA5lvRptS1Bw6+MwdPNWmZHtxPoH+vMHxVPnzVspCJKN4Q8IQ+ZaG91T+7X0s0YdAfCO/WFaDJYUKFAuBg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(558084003)(36756003)(86362001)(31696002)(31686004)(54906003)(478600001)(38100700002)(2616005)(6506007)(186003)(26005)(107886003)(8676002)(8936002)(41300700001)(6512007)(6486002)(6666004)(316002)(66476007)(66556008)(5660300002)(6916009)(2906002)(4326008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTVmTTZ1aVkxdmVvNDVEMURHK0pRQnRrRDRTQ3VZaU01cDc1bDlnOC9JWGh0?=
 =?utf-8?B?YVVJYVlYUDZLaVhSMzVjOS9pUEEvbExnOWRxanIydXd1WU5kRytZakF0M1Ro?=
 =?utf-8?B?YXU4MTk5YmJsMjYzTmljTE5SSksrWGhHaVVManlTUDVpL1NJL0luU2dNWCtl?=
 =?utf-8?B?OHNQWjF5ZHF2Uzl4WmI1eFBMSk5Tc2VDZitMOVVlUDQ1MHpTU2N6a1FJcWd3?=
 =?utf-8?B?ZXBXNHFaS1RGamtoTTYyZURvbHk2THBUOE1nWGNiWDk2aGtzS0ZmekVGQ0I2?=
 =?utf-8?B?ek9SdGM4SjlpQkZDOEdVa2JOS3M3Z0dwMEdjSjJ2TCtZREhRSSsxQmxMUHZj?=
 =?utf-8?B?ZVRzbHNQR254N1hMTkZ1S2w3VzBkcEJYQUZSU29teGNBT09qWkcvUzRhRWlX?=
 =?utf-8?B?ZnRpTllSYjFmUkc5UjhJcVY5VEdrMjg4REk3bnY1M096REorTXBWMVNKVmt3?=
 =?utf-8?B?Q0xaaHI1ckcvL1JLY3pYMG9NOXBrcUloV2JnZzhHbjUrZDAySlRSUndUNE45?=
 =?utf-8?B?N3NiTm9FSS9vOWxTeVRTZ0tvbHAxVUh1V1p0MWlybitjUGpiTGsxM1ZLWG1x?=
 =?utf-8?B?b3I1UUc4VXBoL2Mrbm1jaU5mQUhuZlBRU3lHdWM4MG9KUE1WazM0NE93a3ZC?=
 =?utf-8?B?T290dEEyTVBLclNlRVZsNElYR1lYeTV2dlpwRnJGTXIvcktiZ2FTMWp5NWpq?=
 =?utf-8?B?SFNWMWtQTE5SME5Fb25EVGtRZktRNTFOWUUybjZkSzFqd0Y5elVTbEZWbTdX?=
 =?utf-8?B?dnZHSndOSjdaNWM3UDRMT0hPWElKQWpxbEVIQW1KYnFCTXI1MUlYK1JRUTA3?=
 =?utf-8?B?UmZoalp4eHV0ZTR3UDVESFhBNVE3dmEyTkxtS0NleGFRZXdocmhBS3E2bGwv?=
 =?utf-8?B?dVNXOTlOaXF3VlRXZG9JVWFEUHUvNlVmUWNsTXpmbCtjcUFaZUNhclNRNDIv?=
 =?utf-8?B?OTNDR2RReDlNQkV5b2VNSTJXRGFRclVPdkFGQ0IxMmtIQnlOUHZVNGNMcHdU?=
 =?utf-8?B?S2VqRmJoc0JDOHJNKzhoY0hhZ2xMV1p0Vnp4WlJDenlOd0ZGMlJ3V2pDZWxL?=
 =?utf-8?B?VTRTVjJqWWNBbjNacnRWWmtvK3B0ZWd2OFNEZXJMQjZyNmcxSlUydXJEUytU?=
 =?utf-8?B?RXZmUVN1OTcwdmx1T1lhUzU5cjFIdklBWmxnci9ZTDZ1eEwvdDk3VlBSK0VS?=
 =?utf-8?B?dkFRc3hpUlF5S3BtQ2NEaDZ4dVJDSVVFMFRITlMvd1VIVm1FcW9xdm94ZURq?=
 =?utf-8?B?NzdzZ1lxSnJwMngwOHZMNlpHYXg5WE52VzA3UEVCMjdqT05zeTZ1dFBINXNj?=
 =?utf-8?B?ZVZ6WE1HeC9xRHVEZFQrK0tHTmxFQ0w2aEJxS2UvcGl5Nk9MNjA2c3pXUlJ4?=
 =?utf-8?B?SElaSGM2dmJMT0VvREo1MTUyTlBFait5QmZDM2MyOEoyNEVHeDA5dnBQb2tv?=
 =?utf-8?B?aFVqRmxvUU5MTTdraVJQb1FlV25ZeWgzUzh6aWpmZzU1UkprdXJmbXlOVC9E?=
 =?utf-8?B?MkJLSnVBSE04M00rZ1cybzZPa1FlVFZJZ0hxQ2lwVi9HSXdYSmNKcllWcUM3?=
 =?utf-8?B?RXhSdmMyaTNTaXVFaGUydHU3WXYzM013VFV0QldEdHVDRGE3b0FiTVZnbUhu?=
 =?utf-8?B?QWwvZU5HQkk3OTI2MUZSUk1UTnpGaDRrRWRTNWpKZXZNT1JGYTdURkFJY25k?=
 =?utf-8?B?VmxQZjl5b252VFBhZFhaWVVpU2lrUVhFY2tKYlpQWHFTcmE3dE40UWhaT1px?=
 =?utf-8?B?Y3dVZXd3bUdsbkJzQ1kvQTJsSTVSNlBRRHFWZWd4KzZwMmtqZk42SnhkSE9J?=
 =?utf-8?B?eWJoSEltdjlhZVM2aWVOTjdSVkR5eFc2QU8wU3QzcVIzTjcwK3F5ZFhWdkFR?=
 =?utf-8?B?R3QxdWswVFNzRGN1blAxUXpNaXIxK01RWFVJZ2xlZlEyTVUxZ2EvdXNOVjJB?=
 =?utf-8?B?R1Z0ejh5dE1aUEZqd29ZTlVvRmRPR3lPOWhHeC96ZzhVMFFOdlUxWjhlMS90?=
 =?utf-8?B?bUJjdmZwb1o2QkxFNU13RmhzaUlaTFhjdVFFUVU0eG8wQjR4SkRFR0N0SzlR?=
 =?utf-8?B?TFZjN1hWWVM0Si9ETklFeUw3ZGE5a1pFODVvMHlNZWkwU2ZPTGpuNXJVdm9K?=
 =?utf-8?Q?HY1MW3XcONjxJvAdMrsq1cWT7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 148290da-a9a8-43b2-4af0-08db942bd601
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 14:13:39.9713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wmk45oSFtDEwRnSLO8SmAn+rpX6tbUomDENbYFGO7n8sziE4Euep0t+AStUlJkFcGhNV5t/4jUGFD5CVbgi9xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7728

1: avoid shadowing of index()
2: allow building with old gcc again

Jan

