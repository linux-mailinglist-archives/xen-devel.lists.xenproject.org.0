Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E517FB902
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 12:08:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643042.1002914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vwd-0002Em-H7; Tue, 28 Nov 2023 11:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643042.1002914; Tue, 28 Nov 2023 11:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vwd-0002CQ-Bu; Tue, 28 Nov 2023 11:07:59 +0000
Received: by outflank-mailman (input) for mailman id 643042;
 Tue, 28 Nov 2023 11:07:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7vwc-0001rU-HH
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 11:07:58 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe13::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6213c583-8dde-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 12:07:56 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7517.eurprd04.prod.outlook.com (2603:10a6:102:e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 11:07:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 11:07:54 +0000
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
X-Inumbo-ID: 6213c583-8dde-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hu+jKUtKbdu636WkW4qPCi10ORHHGxIwd369FKxpoGlhFn5rLTN8Wwbz61QRpGoAVZYXSmNuYn63mwugKiHmaZD9t7HsTcjQAp8F/Pj/kXDl1DASqu51IFoM0UeM9gXdg1QmSIyYSaHPXCDL0GDopEFroofeHH5m93STe+KEaI3CjASZOjJwEi/TreTF5uGvb9fkzAkT1ahbxIKHdCCapj0mK2yfsok3Dq3tY6ZbCv4FTGqcbP4uIWYIhYUCK5edmpT5wiCQBnoH3Xr1VH+OoEnqqbiTgNQP1rsdV8h0jngpaJthzR1GvjXBMbXUHSKMLfDVY7KwrLOTXT+pLLih8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByNECU79BUFR7o98T7CHEi0Y4oha5ZLJzrxgRAuzdk4=;
 b=LzWqhOsOTVEUih+Bthf9x2Fm1oPEHdqRwzGkrw1cFi6R13gLZZ3ulFoFUQgpiQmd68rB2i1mZZc4HZE20f7HREO1+WahLI4E7TWmrJbqlvH3CELQzFij4ies/rLE2ArKkrnkJX5Orrj0TOSakfxXQNJEtI4RPju/iNjoJMXFsd+dLYap1NPiKeBvqbl/NrmXFXtriXc5XbguVgJ/QkgdG7rkkn2gBxfMjTXLQjDUdXVRSdxRTVjR+Ma1qcgIDnhBpqsVkJaeIB8dGonIwp4LRanAfuOju57/VnEG+XuyztiyEYxceLML2cSsNeol1MEljGWWWmy/TPEjE22qvqKEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByNECU79BUFR7o98T7CHEi0Y4oha5ZLJzrxgRAuzdk4=;
 b=Rz5KASvnKjTohtnupDT9FkJ2y4KUO/zwqvSCGGVLscg13SrvqW9P0hQm+ll1gxatrwmEVxB7NpXd2DugVjss++WtRXbQECOwOsJS1cDavDDklGpVAIwFqXRGRaZeH2vEdsFUGpxyYs7BHFnYjivs1WNgr8D8iN0PyYeW4/2CXFKf7S2GGXrVbYz//ysVnQ5sJbbg38tRrSTF1flZQdWZiNAjGntI1b3q/ptok5dnNOtnARD/759uq/bpJAXswE7GIzsJR9aG1efhrpTk6sRBKKJQ8P8o6qgrEc4d1S0Yg6gMkBQLgvPgxGKDDeGBsl3FGcADG89WyeBLX728f4OKsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eed96278-2b12-46f8-83ab-2c2aca7ee665@suse.com>
Date: Tue, 28 Nov 2023 12:07:53 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 4/6] x86emul+VMX: support {RD,WR}MSRLIST
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <e13004ac-22af-411e-a5d0-907a2a0301c5@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <e13004ac-22af-411e-a5d0-907a2a0301c5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: 6459cf29-0715-4a50-a752-08dbf00244ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2UpqnMROi8Bi5pramFd7KbcwHBMEjgHdbLCnJK5XMy3aLCjZZHbMqDUGdJhjOJkyz1NYrJbLsg0CDJnDRCf1adNBHHIeOTPAZJGww9UWe+49N0pC8+DWm4je8oXii9RneClgzEHDyklhnio8GalH7BlG6ckKjEaNTT8PjWrXiZy+Sc+Pdug252VruiG4k7HJwXWIzbJvoHZUy8eJ3pp58WRuH0OzNzXL1CMVNqntrmPLcc7T/+pBAwGqXVZD0UER9sM3DomvG+Hu+r/oYqjMKVThje0Bo7xfdawITeb5hZdlBq9eRCcw/2CvECSnC4aEezhQ9Sr6gu1nLjsMQojmdis62mZUP9/78MirjUUrDxGf/pgLMpJ3upl0FYTeSH2JgzpaW925SHjJ3QP10oZnFw/UyXKeFUsUlf+s9rOcm3zSA7gqLmToDRnD5V0i/M7wH2XWMneetLdE4kc+zAk5zTaZsH9j6457ndUePt2Fr/LE/38BvzUqAcpHXvnKUISOb50EzcpG/zopWvif9+EaymVhnUxZ7L4QOXaI1iifG0jZHSwLLVx/boy2ftATS6exQGXhtAxGhh2gqqqmBae7Y2SsZdpkNjdqy3p0+KDMuaUJoBrHgWFrQ7A/biHNWxnkFVAuuyNVFoCTbHZnIK2vXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(86362001)(31696002)(83380400001)(26005)(6506007)(6512007)(2616005)(31686004)(36756003)(38100700002)(478600001)(66556008)(66946007)(66476007)(6916009)(4326008)(6486002)(8936002)(8676002)(5660300002)(2906002)(30864003)(41300700001)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmZKWllzYURoTzk4ekhNUlVCa3lKL20rdThPbGxRcGs1UDZzeENKYkY4NHpz?=
 =?utf-8?B?aEp2dnpJcWpxWS9qbm9Fc3c0OVErbEVkdUtuRGNNL1FreVVVa3hSaUlzQ1hC?=
 =?utf-8?B?Ym5vRklUUTZtVFFGVlB0MkVhUXJQWEtYbkdPcWF3cVNWb25KQUM1RzZKR2FP?=
 =?utf-8?B?bWpPdlRDWXZVRTh5WHpRZmVvNmd6WEdjR1JWaGRmZ0hlZW0rNDFnejJuQWlD?=
 =?utf-8?B?d0FoYUprWjV0WDF2NTZpd1RzTWpTOERpTlp1d0djYng2ZlZZRE42QWw3NVpH?=
 =?utf-8?B?WmlXSkpkbGxHdWdLaFM3aGhFN1ZHQkxxUERrZWlscU0yNzBCVC91THpEaDRN?=
 =?utf-8?B?NUV6QVY3VzhuMnNOSE15SUdoZzNHT0dteTVRLzh1eHNKckUvRDlvdnRzSWsx?=
 =?utf-8?B?Q1VTaXJaL2hhWFdCSVgxWFE4bG4rN2Flb1hNSDVmQW1CZEZDVWc1WTJveUk3?=
 =?utf-8?B?ZGlCbzF5VGVRQlphQ053eG5lQmFUcDVTY0piTUsyaVdpb2E5aEEwSlVJanNr?=
 =?utf-8?B?RitxMS9BTGlNODRVcUhvLzlaUkJ5L1Y0MER2eVFpU3I2Ri9UcE80YmRHS0Vx?=
 =?utf-8?B?TGhzTmU3M2RhOHlZTWZUUmNUQ2JnK29ORXZpelVPL3g3aUsvb1phTndoV1Nz?=
 =?utf-8?B?UDQwV0syWTZ1UTd0TVQyT1VYUjN3b3N3ZDVNK1lHaWJnMm9wNE1GMW1hTko5?=
 =?utf-8?B?TjF0dWlxTTFod01oQ3d1SnFXa0x5VHQvMi95MGVqd3piTG5pL2tzKzY5VU42?=
 =?utf-8?B?a1VVY1lIS0xncXNqbnp2eU1QQzZlQm9yeHJvWGZaTEo1NEV2bU04VnhHOFBB?=
 =?utf-8?B?NDE4d0VOVzNpYlFlUVZPTmIyTHlqdVRjMlN0bTBYUGFqdGVWS0lNTmhhajN0?=
 =?utf-8?B?eC9ldVp2Z0Fhd3ArTDhneCtNa3BSYWNBekgzMEVEZm1STCtEcVpXdGx6V3ho?=
 =?utf-8?B?Ums0SVZ3aTJqVTNqcFRxNWFDelVMSkVWSkYwckRta01GUm1CZ3Nxd3BSdEFD?=
 =?utf-8?B?TUJuMHI2Y1RoZVBTQ2E3TzB4dmxaMHJGa0xGL3R2Y05JaVhkK3pQV2o4UG5w?=
 =?utf-8?B?NkQ0MVBJemVxZzBWVlZlYktKNUZ2d0U1VSt5Qzd6VEdUbmNVTDMzTlU2eThB?=
 =?utf-8?B?azMycDJWbjAwQUNvck9aejhNTzR2SFdpcGtxVGdIaWlsVXUrNzZoQ3VjZ1Ey?=
 =?utf-8?B?SERiUXMwV3VWN1NxT1pOejM1WVJmZmJXSzlOOC9KVDBnb3lJSHRiN3NtQm95?=
 =?utf-8?B?ck1Nc2lqN1M1ditwS1Y1dVc5ZXNBSHhPeHRJeW9XOGhCdUUzbWsxTGplM21I?=
 =?utf-8?B?YWJaM3NJQTF4NTFkcjNTaXFVb0xQemdoSWpKWVdKSEp0UnoyMmJnNDdLbVVv?=
 =?utf-8?B?YzlhNG8xdmZsOUN0OVdSZHlYNE1qcHZhbW5kOFJoTDNpYjg3eWRiNVg1aVdv?=
 =?utf-8?B?UlViTjI2b1JGS0pQazUxQ0lDVkJJOUhwcVA3U0lpZGZUVG0zbnZhOTdtR0lY?=
 =?utf-8?B?aU8zNmczMHVyK1QzVEF6RU8yZ09wSWpDaW84dVhqaHR1V2o4dWpuTDRuMHdF?=
 =?utf-8?B?ODlwbERHbWY4c1RVZG5ZeE5iRUZXZzIzUlJCZlJnYnNwUFNJK0NQalhXdkhR?=
 =?utf-8?B?WFg1Zkt3ZFRSRHVKSjc4SmhiSWRlQ2pjVU01MHIxRm5zcGlaMkhUTjhCVW00?=
 =?utf-8?B?YVQ1VC9LNldsazc5VCsvTUpWdWVIU2U2RmRhS09LMHJ6R3d0UXdIdUhBejVx?=
 =?utf-8?B?WjdJZnIrdWNtM0RZV1hpSXNoM0Joc0pEbU5ucUd3b2xEZ1lLQURPaW5rOXVY?=
 =?utf-8?B?RWMwSzJSTlNSQ1hlUE9ndWY3U2p1OFlVZG9EYnZCb0VDcVpTZ21iSUZtV1VH?=
 =?utf-8?B?dXN2UVR3MlpZM0ZiQUJFRHFNTmpkQ3ZqQXdrU0tmL0JJaHRReWdYSWlyWEpS?=
 =?utf-8?B?aDNsWWxxZ3cvL3dkSVpyR1J1ZzZORXpoY0pFYUpDNmxUejlXd3QrSGdFQkxr?=
 =?utf-8?B?S1g3cnhjQXlvdGF4K0o4N01XSVV2c2Q1LytvUzl1c0hmWXE5aENvNHJVQUpz?=
 =?utf-8?B?TVVLUldnTElXU29VNU92c1VjdXFPdzlvVGJMT0lIYmVCOTlOZ3hmWWprVFNS?=
 =?utf-8?Q?kl/4r3JqPtUTzPK1y3K6eSfec?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6459cf29-0715-4a50-a752-08dbf00244ee
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 11:07:54.0974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MnoS00iQLMS56GsQNV0P8rYT/W5vyew7YgSsLr/JZk0nljqqXE2VjPVxD/M14im/HpzFOoi8VMTaw02BJZ6Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7517

These are "compound" instructions to issue a series of RDMSR / WRMSR
respectively. In the emulator we can therefore implement them by using
the existing msr_{read,write}() hooks. The memory accesses utilize that
the HVM ->read() / ->write() hooks are already linear-address
(x86_seg_none) aware (by way of hvmemul_virtual_to_linear() handling
this case).

Preemption is being checked for in WRMSRLIST handling only, as only MSR
writes are expected to possibly take long.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: In vmx_vmexit_handler() handling is forwarded to the emulator
     blindly. Alternatively we could consult the exit qualification and
     process just a single MSR at a time (without involving the
     emulator), exiting back to the guest after every iteration. (I
     don't think a mix of both models makes a lot of sense.)

The precise behavior of MSR_BARRIER is still not spelled out in ISE 050,
so the (minimal) implementation continues to be a guess for now.
---
v3: Add dependency on LM. Limit exposure to HVM. Utilize new info from
    ISE 050. Re-base.
v2: Use X86_EXC_*. Add preemption checking to WRMSRLIST handling. Remove
    the feature from "max" when the VMX counterpart isn't available.

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -195,6 +195,8 @@ static const char *const str_7a1[32] =
     [18] = "lkgs",          [19] = "wrmsrns",
 
     /* 22 */                [23] = "avx-ifma",
+
+    /* 26 */                [27] = "msrlist",
 };
 
 static const char *const str_e21a[32] =
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -342,6 +342,8 @@ static const struct {
     { { 0x01, 0xc4 }, { 2, 2 }, F, N }, /* vmxoff */
     { { 0x01, 0xc5 }, { 2, 2 }, F, N }, /* pconfig */
     { { 0x01, 0xc6 }, { 2, 2 }, F, N }, /* wrmsrns */
+    { { 0x01, 0xc6 }, { 0, 2 }, F, W, pfx_f2 }, /* rdmsrlist */
+    { { 0x01, 0xc6 }, { 0, 2 }, F, R, pfx_f3 }, /* wrmsrlist */
     { { 0x01, 0xc8 }, { 2, 2 }, F, N }, /* monitor */
     { { 0x01, 0xc9 }, { 2, 2 }, F, N }, /* mwait */
     { { 0x01, 0xca }, { 2, 2 }, F, N }, /* clac */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -603,6 +603,7 @@ static int read(
     default:
         if ( !is_x86_user_segment(seg) )
             return X86EMUL_UNHANDLEABLE;
+    case x86_seg_none:
         bytes_read += bytes;
         break;
     }
@@ -633,7 +634,7 @@ static int write(
     if ( verbose )
         printf("** %s(%u, %p,, %u,)\n", __func__, seg, (void *)offset, bytes);
 
-    if ( !is_x86_user_segment(seg) )
+    if ( !is_x86_user_segment(seg) && seg != x86_seg_none )
         return X86EMUL_UNHANDLEABLE;
     memcpy((void *)offset, p_data, bytes);
     return X86EMUL_OKAY;
@@ -725,6 +726,10 @@ static int read_msr(
 {
     switch ( reg )
     {
+    case 0x0000002f: /* BARRIER */
+        *val = 0;
+        return X86EMUL_OKAY;
+
     case 0xc0000080: /* EFER */
         *val = ctxt->addr_size > 32 ? 0x500 /* LME|LMA */ : 0;
         return X86EMUL_OKAY;
@@ -1513,9 +1518,53 @@ int main(int argc, char **argv)
          (gs_base != 0x0000111122224444UL) ||
          gs_base_shadow )
         goto fail;
+    printf("okay\n");
 
     cp.extd.nscb = i;
     emulops.write_segment = NULL;
+
+    printf("%-40s", "Testing rdmsrlist...");
+    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x01; instr[3] = 0xc6;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = (unsigned long)(res + 0x80);
+    regs.rdi = (unsigned long)(res + 0x80 + 0x40 * 2);
+    regs.rcx = 0x0002000100008000UL;
+    gs_base_shadow = 0x0000222244446666UL;
+    memset(res + 0x80, ~0, 0x40 * 8 * 2);
+    res[0x80 + 0x0f * 2] = 0xc0000101; /* GS_BASE */
+    res[0x80 + 0x0f * 2 + 1] = 0;
+    res[0x80 + 0x20 * 2] = 0xc0000102; /* SHADOW_GS_BASE */
+    res[0x80 + 0x20 * 2 + 1] = 0;
+    res[0x80 + 0x31 * 2] = 0x2f; /* BARRIER */
+    res[0x80 + 0x31 * 2 + 1] = 0;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[4]) ||
+         regs.rcx ||
+         (res[0x80 + (0x40 + 0x0f) * 2] != (unsigned int)gs_base) ||
+         (res[0x80 + (0x40 + 0x0f) * 2 + 1] != (gs_base >> (8 * sizeof(int)))) ||
+         (res[0x80 + (0x40 + 0x20) * 2] != (unsigned int)gs_base_shadow) ||
+         (res[0x80 + (0x40 + 0x20) * 2 + 1] != (gs_base_shadow >> (8 * sizeof(int)))) ||
+         res[0x80 + (0x40 + 0x31) * 2] || res[0x80 + (0x40 + 0x31) * 2 + 1] )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing wrmsrlist...");
+    instr[0] = 0xf3; instr[1] = 0x0f; instr[2] = 0x01; instr[3] = 0xc6;
+    regs.eip = (unsigned long)&instr[0];
+    regs.rsi -= 0x11 * 8;
+    regs.rdi -= 0x11 * 8;
+    regs.rcx = 0x0002000100000000UL;
+    res[0x80 + 0x0f * 2] = 0xc0000102; /* SHADOW_GS_BASE */
+    res[0x80 + 0x20 * 2] = 0xc0000101; /* GS_BASE */
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[4]) ||
+         regs.rcx ||
+         (gs_base != 0x0000222244446666UL) ||
+         (gs_base_shadow != 0x0000111122224444UL) )
+        goto fail;
+
     emulops.write_msr     = NULL;
 #endif
     printf("okay\n");
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -88,6 +88,7 @@ bool emul_test_init(void)
     cp.feat.rdpid = true;
     cp.feat.lkgs = true;
     cp.feat.wrmsrns = true;
+    cp.feat.msrlist = true;
     cp.extd.clzero = true;
 
     if ( cpu_has_xsave )
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -666,6 +666,9 @@ static void __init calculate_hvm_max_pol
             __clear_bit(X86_FEATURE_XSAVES, fs);
     }
 
+    if ( !cpu_has_vmx_msrlist )
+        __clear_bit(X86_FEATURE_MSRLIST, fs);
+
     /*
      * Xen doesn't use PKS, so the guest support for it has opted to not use
      * the VMCS load/save controls for efficiency reasons.  This depends on
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -854,6 +854,20 @@ static void cf_check vmx_cpuid_policy_ch
     else
         vmx_set_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
 
+    if ( cp->feat.msrlist )
+    {
+        vmx_clear_msr_intercept(v, MSR_BARRIER, VMX_MSR_RW);
+        v->arch.hvm.vmx.tertiary_exec_control |= TERTIARY_EXEC_ENABLE_MSRLIST;
+        vmx_update_tertiary_exec_control(v);
+    }
+    else if ( v->arch.hvm.vmx.tertiary_exec_control &
+              TERTIARY_EXEC_ENABLE_MSRLIST )
+    {
+        vmx_set_msr_intercept(v, MSR_BARRIER, VMX_MSR_RW);
+        v->arch.hvm.vmx.tertiary_exec_control &= ~TERTIARY_EXEC_ENABLE_MSRLIST;
+        vmx_update_tertiary_exec_control(v);
+    }
+
  out:
     vmx_vmcs_exit(v);
 
@@ -3714,6 +3728,22 @@ gp_fault:
     return X86EMUL_EXCEPTION;
 }
 
+static bool cf_check is_msrlist(
+    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
+{
+
+    if ( ctxt->opcode == X86EMUL_OPC(0x0f, 0x01) )
+    {
+        unsigned int rm, reg;
+        int mode = x86_insn_modrm(state, &rm, &reg);
+
+        /* This also includes WRMSRNS; should be okay. */
+        return mode == 3 && rm == 6 && !reg;
+    }
+
+    return false;
+}
+
 static void vmx_do_extint(struct cpu_user_regs *regs)
 {
     unsigned long vector;
@@ -4521,6 +4551,17 @@ void asmlinkage vmx_vmexit_handler(struc
         }
         break;
 
+    case EXIT_REASON_RDMSRLIST:
+    case EXIT_REASON_WRMSRLIST:
+        if ( vmx_guest_x86_mode(v) != 8 || !currd->arch.cpuid->feat.msrlist )
+        {
+            ASSERT_UNREACHABLE();
+            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
+        }
+        else if ( !hvm_emulate_one_insn(is_msrlist, "MSR list") )
+            hvm_inject_hw_exception(X86_EXC_GP, 0);
+        break;
+
     case EXIT_REASON_VMXOFF:
     case EXIT_REASON_VMXON:
     case EXIT_REASON_VMCLEAR:
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -267,6 +267,7 @@ extern u32 vmx_secondary_exec_control;
 #define TERTIARY_EXEC_EPT_PAGING_WRITE          BIT(2, UL)
 #define TERTIARY_EXEC_GUEST_PAGING_VERIFY       BIT(3, UL)
 #define TERTIARY_EXEC_IPI_VIRT                  BIT(4, UL)
+#define TERTIARY_EXEC_ENABLE_MSRLIST            BIT(6, UL)
 extern uint64_t vmx_tertiary_exec_control;
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
@@ -356,6 +357,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
 #define cpu_has_vmx_notify_vm_exiting \
     (vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
+#define cpu_has_vmx_msrlist \
+    (vmx_tertiary_exec_control & TERTIARY_EXEC_ENABLE_MSRLIST)
 
 #define VMCS_RID_TYPE_MASK              0x80000000U
 
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -202,6 +202,8 @@ static inline void pi_clear_sn(struct pi
 #define EXIT_REASON_XRSTORS             64
 #define EXIT_REASON_BUS_LOCK            74
 #define EXIT_REASON_NOTIFY              75
+#define EXIT_REASON_RDMSRLIST           78
+#define EXIT_REASON_WRMSRLIST           79
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -24,6 +24,8 @@
 #define  APIC_BASE_ENABLE                   (_AC(1, ULL) << 11)
 #define  APIC_BASE_ADDR_MASK                _AC(0x000ffffffffff000, ULL)
 
+#define MSR_BARRIER                         0x0000002f
+
 #define MSR_TEST_CTRL                       0x00000033
 #define  TEST_CTRL_SPLITLOCK_DETECT         (_AC(1, ULL) << 29)
 #define  TEST_CTRL_SPLITLOCK_DISABLE        (_AC(1, ULL) << 31)
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 76
+#define VMX_PERF_EXIT_REASON_SIZE 80
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -72,6 +72,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t
     case MSR_AMD_PPIN:
         goto gp_fault;
 
+    case MSR_BARRIER:
+        if ( !cp->feat.msrlist )
+            goto gp_fault;
+        *val = 0;
+        break;
+
     case MSR_IA32_FEATURE_CONTROL:
         /*
          * Architecturally, availability of this MSR is enumerated by the
@@ -340,6 +346,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t
         uint64_t rsvd;
 
         /* Read-only */
+    case MSR_BARRIER:
     case MSR_IA32_PLATFORM_ID:
     case MSR_CORE_CAPABILITIES:
     case MSR_INTEL_CORE_THREAD_COUNT:
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -11,6 +11,7 @@
 #include "private.h"
 
 #ifdef __XEN__
+#include <xen/event.h>
 #include <asm/prot-key.h>
 #endif
 
@@ -28,6 +29,7 @@ int x86emul_0f01(struct x86_emulate_stat
     switch ( s->modrm )
     {
         unsigned long base, limit, cr0, cr0w, cr4;
+        unsigned int n;
         struct segment_register sreg;
         uint64_t msr_val;
 
@@ -42,6 +44,64 @@ int x86emul_0f01(struct x86_emulate_stat
                                 ((uint64_t)regs->r(dx) << 32) | regs->eax,
                                 ctxt);
             goto done;
+
+        case vex_f3: /* wrmsrlist */
+            vcpu_must_have(msrlist);
+            generate_exception_if(!mode_64bit(), X86_EXC_UD);
+            generate_exception_if(!mode_ring0() || (regs->r(si) & 7) ||
+                                  (regs->r(di) & 7),
+                                  X86_EXC_GP, 0);
+            fail_if(!ops->write_msr);
+            while ( regs->r(cx) )
+            {
+                n = __builtin_ffsl(regs->r(cx)) - 1;
+                if ( (rc = ops->read(x86_seg_none, regs->r(si) + n * 8,
+                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY )
+                    break;
+                generate_exception_if(msr_val != (uint32_t)msr_val,
+                                      X86_EXC_GP, 0);
+                base = msr_val;
+                if ( (rc = ops->read(x86_seg_none, regs->r(di) + n * 8,
+                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY ||
+                     (rc = ops->write_msr(base, msr_val, ctxt)) != X86EMUL_OKAY )
+                    break;
+                regs->r(cx) &= ~(1UL << n);
+
+#ifdef __XEN__
+                if ( regs->r(cx) && local_events_need_delivery() )
+                {
+                    rc = X86EMUL_RETRY;
+                    break;
+                }
+#endif
+            }
+            goto done;
+
+        case vex_f2: /* rdmsrlist */
+            vcpu_must_have(msrlist);
+            generate_exception_if(!mode_64bit(), X86_EXC_UD);
+            generate_exception_if(!mode_ring0() || (regs->r(si) & 7) ||
+                                  (regs->r(di) & 7),
+                                  X86_EXC_GP, 0);
+            fail_if(!ops->read_msr || !ops->write);
+            while ( regs->r(cx) )
+            {
+                n = __builtin_ffsl(regs->r(cx)) - 1;
+                if ( (rc = ops->read(x86_seg_none, regs->r(si) + n * 8,
+                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY )
+                    break;
+                generate_exception_if(msr_val != (uint32_t)msr_val,
+                                      X86_EXC_GP, 0);
+                if ( (rc = ops->read_msr(msr_val, &msr_val,
+                                         ctxt)) != X86EMUL_OKAY ||
+                     (rc = ops->write(x86_seg_none, regs->r(di) + n * 8,
+                                      &msr_val, 8, ctxt)) != X86EMUL_OKAY )
+                    break;
+                regs->r(cx) &= ~(1UL << n);
+            }
+            if ( rc != X86EMUL_OKAY )
+                ctxt->regs->r(cx) = regs->r(cx);
+            goto done;
         }
         generate_exception(X86_EXC_UD);
 
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -594,6 +594,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
+#define vcpu_has_msrlist()     (ctxt->cpuid->feat.msrlist)
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
 #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
 
--- a/xen/arch/x86/x86_emulate/util.c
+++ b/xen/arch/x86/x86_emulate/util.c
@@ -100,6 +100,9 @@ bool cf_check x86_insn_is_mem_access(con
         break;
 
     case X86EMUL_OPC(0x0f, 0x01):
+        /* {RD,WR}MSRLIST */
+        if ( mode_64bit() && s->modrm == 0xc6 )
+            return s->vex.pfx >= vex_f3;
         /* Cover CLZERO. */
         return (s->modrm_rm & 7) == 4 && (s->modrm_reg & 7) == 7;
     }
@@ -160,7 +163,11 @@ bool cf_check x86_insn_is_mem_write(cons
         case 0xff: /* Grp5 */
             break;
 
-        case X86EMUL_OPC(0x0f, 0x01): /* CLZERO is the odd one. */
+        case X86EMUL_OPC(0x0f, 0x01):
+            /* RDMSRLIST */
+            if ( mode_64bit() && s->modrm == 0xc6 )
+                return s->vex.pfx == vex_f2;
+            /* CLZERO is another odd one. */
             return (s->modrm_rm & 7) == 4 && (s->modrm_reg & 7) == 7;
 
         default:
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -287,6 +287,7 @@ XEN_CPUFEATURE(FRED,         10*32+17) /
 XEN_CPUFEATURE(LKGS,         10*32+18) /*S  Load Kernel GS Base */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
 XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
+XEN_CPUFEATURE(MSRLIST,      10*32+27) /*s  MSR list instructions */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -274,7 +274,8 @@ def crunch_numbers(state):
         # superpages, PCID and PKU are only available in 4 level paging.
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
-        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, LKGS, CMPCCXADD],
+        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, LKGS, CMPCCXADD,
+             MSRLIST],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.


