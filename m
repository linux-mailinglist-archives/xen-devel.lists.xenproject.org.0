Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA4D644596
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 15:26:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454969.712561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Ytq-0006kp-G5; Tue, 06 Dec 2022 14:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454969.712561; Tue, 06 Dec 2022 14:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Ytq-0006iE-D1; Tue, 06 Dec 2022 14:26:22 +0000
Received: by outflank-mailman (input) for mailman id 454969;
 Tue, 06 Dec 2022 14:26:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2Ytp-0006i8-6Y
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 14:26:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f34d8e50-7571-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 15:26:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8464.eurprd04.prod.outlook.com (2603:10a6:10:2c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Tue, 6 Dec
 2022 14:26:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 14:26:18 +0000
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
X-Inumbo-ID: f34d8e50-7571-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWHYAddB+mfpN2LEiD279u5cRnHhYoRPI7Tp2TEzLNtMPcoGcdabd9AXFoF5rDy9d6AuWAwqbZHj2wq212cnYahJyIEgBiF5GqqxOgqVGpmUKQLvGUv9wcP1NgKL72FHXdvv1L09CQC3YEBeZawA912TxkIxKa5XBqu8JZD9+xLE26Kvneu7uAnTkxyQKaVaEVgTaO0gkVwdvwPIb0a7nEReuUMPy6F9q0dFHhFfz42eW6wYYHh3F/VsEdXoKgMA8tKF8xDg0Yt0Z747kOK6HT8uVLRE2Dnx0bQSfzb19N6dgN/7XXml4CJbxCecxGb+9nhAbHCS4BhylhwSfnVHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSlEmWA38sY0/etdzhn0OHg7z6XftIae09vFRbgZHKw=;
 b=V2CXan0Z7COxjgCsU5amH7YqhQoDIzWRlcTpNZ6Klbr0nHqJY2T0r+dUi0ArapCk4g8pnqd7CJGEqIo5Rc96E2z+Fc68dONyf2A/7m19NWn4xlBKo/04F1Yvrn62Q3rPmLxaa+B+5lRDIB0lg7PiGkqKSa3O/9QppGDPaEKT0vfHRaHQ0qhYyDQOPkQeE0AmytL0hXx5n4+hVkwLgK+/o6CI44e/HT3jGU2vUwOi3c0gD15o5o43GwvM/072cJpvyVrnmTyD1NysLTGrSJB3bSjVWS/TqKjaw2SA3QiMqn1DeCVwfYgALNHp9WQeOavyn21aeolm/4oQTQiYQjU4ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSlEmWA38sY0/etdzhn0OHg7z6XftIae09vFRbgZHKw=;
 b=e8o4sdUVWrF421dfGheEd+asxreGjdViE6TP+5YELBEM4yGwnIKjTS7wOkz8pHvwqmf7echSFVWqfoC0gLzUiZR/3szxM5wPAlpo0ARztze8TiuatOUn/4PVZwBqDDqv/AotDdDWGKg0q4e/YBBR7K5Gx3+80gxZqs/7osnhMvmcvYkccIAejEqenwXXUGLCMop5LKY7R2m6oTGV1IFCpeNrX3l9wzDepa5YkqvYOv+VGmpJDaK1wj90ZspJCcvLg1QOCG810rEPQGu+Lh8TNd7bX6W0LtIsWpmta8VBy7K1h+ihcG/Cz75/13s9nrzJsDCLgd02x1jy08c0ho3ukA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5833b09-0ce3-b991-111e-07e64dfcc85a@suse.com>
Date: Tue, 6 Dec 2022 15:26:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86/pv-shim: configuring / building re-arrangements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8a5bed-26a5-4d4e-aa0a-08dad795d701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	148gELDYsCciq/cpsp+JsR2Lcs8VY4jFjbi4LeB62+IG/HKaqsUYGaBjfGTY3jjJH76dE9PzZGEkrtI90y45V14K1cZVv6uqid1ALFCiDBf74hujq3qber3td2qo5iu7uNgaaRrjl9xuQ4Tpv7cRhKxpo/KMPhoPJbUm8dko1tVOpj5Lm5sp66qP5ZMkqgCoGcT4IYbvUSThR1tNFyqf2wrRUhAwy98qQ8ig/LGgLAG3zlAQCT5mGPi4FzQueAzxY61BlyIC6rsLvhEoh8XTDj3CSCGZ6Hhzxf6I7aH0lCQthZcYWcdR4L47x44e939HwrMUITN22ULKBAibf0klB3/wO4FG8Tz/KTRDxoXqrHCXF3qsDA7n3gVw/U94Cojklw2RpBMABsQkgljj4VCKLCuIS6Hool7mWr6luM4DjPUj0bpBfEKkvB+LrNTvwDk7kGh9uj/GSqjiVDOUE922Ze6YXrIzay5Sf92QKaHq6vBjmi4dcg8GEMKxR6tIaCt2BibsnJWoZTYptNzPlV/pkpa8IgbUFCkfrVY1wuyqCLR7HQ8+YCMAPr2gbRFMalYEhPnFA4FLn3Fo/+2omTLHuPoPndp5LcQXpLSIKdOQZyrwBh15E/b37o3leKpC9IIHPbUvKvZUuEce+G1ECSeEAGLc5CeDsoF4jzFcQJ+pLGbfxBfhfUM+Ub7K1mlulu+WrTtnaTa9j+m/dmDoz7nuYrAU2sRyFXnXsqDsXTsCjm4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(38100700002)(36756003)(86362001)(31696002)(2906002)(41300700001)(5660300002)(4326008)(4744005)(8936002)(83380400001)(8676002)(6486002)(66556008)(478600001)(54906003)(316002)(2616005)(66946007)(66476007)(31686004)(6916009)(6512007)(186003)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2Jybk8vL2lDcmtYUk0reGZMcUhaemRZQStJVjlTRnllUHhBaEltN3F4aDlv?=
 =?utf-8?B?VFBJUlRFVnFZRDhOSW9rQkpWR2N6MitPVDVtV0R6ZWJIYkR4b2pXRkhhNUVo?=
 =?utf-8?B?OVNQTG5ncFE2MjJPdFVzNVJJakx4eUVOM2s1YllWL3ZpdHFPcTYvZE9PUDlK?=
 =?utf-8?B?T0JEL2NHbXRhbWMxYmRWVkRZQzVuK0dDOUFKRE1QU29oZXVzdkVTNUVIODFp?=
 =?utf-8?B?QU5DUy8zbkZrN3ZFNmxnRys2YytkZ01SbUhOdHZOOUkxbmdWeTU1K2xJTk44?=
 =?utf-8?B?M2V5NjhqRXV2SFRTZzM4Vi8wQ0FBdThieXZrVlMzL3BDVDNVMG15NngvVlhs?=
 =?utf-8?B?ZHVqVng3YUhJS096WnppL0ZQeERPa3VMSm5FbTh3ckdHU0dTWEY0R2tFTjZM?=
 =?utf-8?B?b3ZJMFJzRnlZdDR4MnJjS3FQY2Q1UXFlczh4cUpNWGpNTzQ1bFRQNEJLR0RR?=
 =?utf-8?B?MSt4c1VxM0UvQkdFWllLOEhGWWxlL3VzVzhMKzd0TzF0R0JWVlhUSzN2NFNT?=
 =?utf-8?B?UWZuZEhaK1c2bDlVN09GeGFJYXk4WXNBM05aUWNobDErTzRPdEJjT1IrQmpn?=
 =?utf-8?B?SXlIWCtvamk5TTFGaGhpTUdqUzVXaUJhQmZQKzZGajZCbngveDRZSzlLRWt4?=
 =?utf-8?B?UElQVmZ0Z0JBakhTbFI3UXBEK1dUZEZrcVF6aUdzNjVWKzlNN3JpWHdJaDhT?=
 =?utf-8?B?d0dia0F4NmwxWnVDc1RVYmx2eGhLcXlNRjlQRWU5M3JZTlVBNHpoeHdKRFYw?=
 =?utf-8?B?UDliWW1HeklFeWRBRzBGamN6aDJQdEtuSnBKeUtjZG00SVJCQVZJYlMySWps?=
 =?utf-8?B?aURLUGlldDcvNGtTdnI0OXA3SFRBcHBJak1kRXN3eFkwTlg2Wit5T3h3TmZW?=
 =?utf-8?B?QWdacHRNNVkra1hFWFljRlFXNWtYbTZJWXRteDkxU1dzLzlXdTFLNXpZd0l0?=
 =?utf-8?B?bzlJeUJjN1FnTGlVR0dJVmV4VWgrb2U4VlhFcXBDTHgwdFNDcHVTcTVJZGE1?=
 =?utf-8?B?ZVZyTjUwQUdWcm00bnVEbVUxRWdzNlVWVndxcHMxb0pCanQ2RDJGdGlGLzFm?=
 =?utf-8?B?d2FJUmdZZklnemx6Rk1XRXA0RGJEQkljWm1HRFAxT2lTY0ZjOWtwSUwwN3hQ?=
 =?utf-8?B?RWtlUWtjT3dtSnB0b0poNDdORzM3ZFRlaVVlaDVLMTQyaDJUVUt0WmdQdElH?=
 =?utf-8?B?TkQ4aDFVa091VnNRcFR2Q0tmVlNUMVNQZFE3QkdCOU96UDZ6S1U4bGNnN3FI?=
 =?utf-8?B?c1ZRak8xUzVRTVo0d2RoTVZOUEhKOTRLZmJIWHJwK1VyT2J0Q2hycUdOeHRJ?=
 =?utf-8?B?S3kwdnVnUDVZdkdTYWZ5UFNGSmJwcHVGRW92SmNuNklxMkxUYk9RV1Y4NURn?=
 =?utf-8?B?MEIrWG1URklVbzJYbUV1cEVadlp5K3FQaHF1aXlsL1FSV1hYRDhaQmVNRy8x?=
 =?utf-8?B?ekJpTEpuZmIwazE1TWxmU2Znc2VTMXI3Qm1NUUd1bCsyVzZ2K2oyek5nSzJx?=
 =?utf-8?B?WURkd3JUaFU2d3pDZjU4WGc1U0k1T25XUTA2VU1pSGNhQlRMYXFZSHEzc0Uz?=
 =?utf-8?B?SzhhMDFKZzhVd3R6OHdZM2Y5eVFuK24wRjdpd0pOVmR6WG95UHBjK3podTM1?=
 =?utf-8?B?clRpeUNDTlhjdGRUZVN1eVh4Vm5RWnR4R3M4ZUJBZnFDcFNpTVplM0JJdHQy?=
 =?utf-8?B?TEdPZThzeTBtSmgvQVc2YnRFcDZ1cEFsRFlReGNOMUR0SEdzTkRLVUhScXZh?=
 =?utf-8?B?eTlHYmgwM1g0WENSU0V6SWY5cDBZaXB5V1Y5U25uV1AyOXgyTXhzOXlUZFUw?=
 =?utf-8?B?Mm9jUnFjM2Vxd2RUOXB5NjlBWW40UEh3V3F5Wi96ZlBkenNyTmJuTUUydG9m?=
 =?utf-8?B?TTFEWjMzemVudURLaHZvcFliSTIyb1Z0TDl4ZG1iL2NUWHVwV2w3OXRKWE9D?=
 =?utf-8?B?V2tSc2lMZ29ZcW51V0p0UlluYmZLRTRXcTNQMjJuMHJlWC9GTk4yZGNGNFZZ?=
 =?utf-8?B?b2ZyUWQzbzFCajlZa3ZwLzVyZmMwLy9hR2JwZlVTOXFneW1rWnZTK3Z6NTBF?=
 =?utf-8?B?TUVEZlNScCtiTDQyMnFXT0NEaGZPaWluaTJ5WXd5ZVRvRFJMdmJWdUJHZTdL?=
 =?utf-8?Q?CYfeInMI4IbDyKaTnP5g9irGv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8a5bed-26a5-4d4e-aa0a-08dad795d701
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 14:26:18.4905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdCKlLuNkOd9/r2I11dJo/ZHDacMeSTKBG/kVaJcrkpRVQyAn+rbc4PJw52n5gjqNqehuJl8DGk6V+rLzvdzaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8464

The first patch, while being the main piece here, and while fixing a
bug kind of as a side effect, is partly RFC; see there. The other two
changes are really minor adjustments for aspects noticed while putting
together the main change.

1: common: reduce PV shim footprint
2: don't even allow enabling GRANT_TABLE
3: suppress core-parking logic

Jan

