Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 013535670BD
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 16:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361350.590823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8jLW-0005dx-6l; Tue, 05 Jul 2022 14:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361350.590823; Tue, 05 Jul 2022 14:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8jLW-0005bA-2o; Tue, 05 Jul 2022 14:16:10 +0000
Received: by outflank-mailman (input) for mailman id 361350;
 Tue, 05 Jul 2022 14:16:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8jLV-0005b4-9R
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 14:16:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffbbc66e-fc6c-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 16:16:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB3008.eurprd04.prod.outlook.com (2603:10a6:802:f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 14:15:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 14:15:59 +0000
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
X-Inumbo-ID: ffbbc66e-fc6c-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XL4//Ci6Ac70HvYrvWAU2zK6G0I2QqxxmKgSYd0GfpJ2Ib/le83RBGGq7Kw6BAgZOyXgFvChpi1S7IJWvAKegEk/Ha2nns3c95YC23aqI+tUfZoVOaNl0mUnOT/DLOyRhvcVVLwaSKgcqaoiIf6Bo+WMUhbgsDCVoVa0GVTu+hQbCJbEGgfmytLAg8xi1Gfl6LwZF6lfqnHtE3Lc1uCKS7gCOrRKKmSbFDgQLRHuv48nQpL1MnvkPikcEuFt4lRaE1cuvq3H7y0S1502vuqrZTAIVkJjpVo/bgGME4CvxeDB89uKl9zNxsWkluwpPaVKb8hAxJTWpUrFHWtmKeC25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJRaAqWCSZDbFVRg2qdHGs4kdr5lV147tVg0bYJvx+8=;
 b=FRJPmLeHNHlssPOKZ/mr9naXoo/IeDVQyNxRCMU11jI+4LW5KiLTwQ/p3YCXNgF36Z5nQshi0ZlTAk3/h5y0UjQfkR0FnfOUQc0ONaKv6nGbtdxR2PVzqa6HGcOn/2c8m8SSOQ3owc7xxqhMUXb0XRFVah8iFh2xLMkXku/fmfRYHEGz6EcbPk96uERVuf8oCGJAzHLv3z0bTFep+J2l/sSz69etB2amMxkebjCs5VC1/2iSwqHSCHMajLtAfvVbgN/CbWgtRxy7MNgTNkgxsYVwkVvzksJiRPr/9njl72tyY5OsPqwrdJIe+1MNIiBcS/QEuynVouz9zPHC9IG8wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJRaAqWCSZDbFVRg2qdHGs4kdr5lV147tVg0bYJvx+8=;
 b=3ptJsql4kFK4uxfoHAkRBt6d9ydNNuNjeBBf4h04cwc0lFKIKVUsn+7zOFRzI2jhJ2TnlSvVnKeUN2B6Jvvov9cqhmPzqU5k9Mt4VLDwMMrghR/jBEYd1gO9koeYs8x+325cUIcmMgy5e+btZhrdpCoRGciCQ0Xbi5eJO7RmsrzkUWhBZTH2nDZnrCMVwo0C4WAnT5AoMxgbbN+yTxR23yCUjXyBKQPMRvjcqKdiFZvNOmhm2qd+voZqap3jvLia10J3h3d//La6F5/PU0Tse3cpgqXImD9ZSQZapWh5id/Ydw0Qd8tE4iO9CePi6G3myGpdlJSBcYQlEtmpr0ZSOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1378d0a8-3001-3ab0-896d-cb38dcfc4c65@suse.com>
Date: Tue, 5 Jul 2022 16:15:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/6] x86/irq: print nr_irqs as limit on the number of
 MSI(-X) interrupts
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220630085439.83193-1-roger.pau@citrix.com>
 <20220630085439.83193-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220630085439.83193-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6eb8c84a-cb5a-4981-0d8a-08da5e90e24d
X-MS-TrafficTypeDiagnostic: VI1PR04MB3008:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pOh8AVMWAinhM5TXkoNRwKnG8qOH7MKDm5vV5A+tSGWGcK17bhrwgPqOWCUxGf+7RF6jEFPJi6B7zGr52GkdTudhiC5lMvhsFThWaGTBC3E1i23Af67X7BTUDUaw84UsarCxdjl4atj6IOVjwqReP/Spm8P5mBa/uaRDouoO09lXG3+eyUgRD+MEgPDSxK/kp48UCjJS1SRnv16vt4dB5T8I0TCuB0TpoSl3Jl9ZSa0Jn28GFMK1QHwZi/1+GaNuIYMR7OKg0VZGvAxlMrTDK0v92FqGkpLpMYQ8CRyJw8DRwoa8dp/k2h1g3zP00kuOL4H5DdfZVlMjbSos3Ev1pSTrUyo6+7C+FvjiuZJopLI0ZktZ6+Zrzbs5GCk+ORL9S/hGe+tmgMwYTaorKEwxaM2IflyESlXZofx/JabP5SfLYmHydoXX7sCVTpE6wTV9uug3Yt7exiZCWL04snUviTJciyAyXYT4MEnCDQLtXgRdQQTFzGtFS6dLh3sd6SU9dKC2Gnvi9x0AWZNZfjuu3DmXGE39X7ZpoC5i25EOS56gjxT04jHt228iJ4IcHXAemHoaDM+eWPh5wX8KobnuYT6BtxQLzCrzXjzi/faNuMIvEGxz9lybP2Ur9XLGIB+KzkeFUHkKaFBB8GIrSQHQdSq+vsd572AIL+AnoJPLzf7oq/ohJdTHDHwEEjgoty7/32dyPvlf3A76hbEcbtwABTmVES57P2oqRt9HWQMbAr8+LgKQT+PJke/FV0YoxkXKT7q5UphbAHhUg0Uh0f29EcD6aRF5MSS04UC9tOSeipO1PENlYb78nR9yktbq5/Lt43UdZwAfEvXts6e5qPrm9jOYiAC/aOSq5oyeQ/zpd70=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(376002)(346002)(396003)(8936002)(5660300002)(54906003)(4326008)(8676002)(66476007)(66556008)(66946007)(86362001)(41300700001)(31696002)(6916009)(316002)(4744005)(186003)(26005)(36756003)(6512007)(2616005)(6506007)(6486002)(2906002)(53546011)(38100700002)(31686004)(83380400001)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWJ2YzFlUVBraWpBdmkwcFp0emRNOE8vcm5LS0tIaEs0RG9iQlV2TnViMFFi?=
 =?utf-8?B?dmQ2b1RwQTJTU0xsalZnWTVmdFNyU3pPMGFkbVVBRVhabUppbnhpa2tiallZ?=
 =?utf-8?B?NkFRYkJzcmEyM0wvcDlwOEw4czlySVh3S29TRWdnVEc4dFgrY1lncm5BOW9x?=
 =?utf-8?B?Q2Z0dkhTTUN2UXFNSnk2eWNNNDFXVTlDWjB3RUc5VzFJYmF6Q2xneFd2VDRX?=
 =?utf-8?B?V0pZdmtrTUwwWmFpZmRGS2xXaW92cGtLNWNTSUpsUHdzQURXMWp4OStTS2or?=
 =?utf-8?B?Q3VHbWs0Mm5IMTZVRmNVbHRxYWxMNE5XZzFqSU5sTHZXTWNRUjBsQmU5Wm81?=
 =?utf-8?B?RHFJeE92RVFJb0lkTHQ4VzhkcllyMTBPaXRieEhDRmZxTVoweTYya1JqQjJq?=
 =?utf-8?B?R1dwdkdXOTdDRDJacTFUS1M1cDJUb2wzY3BjZXFKRS9XNHU2QXpCSVdPNWpl?=
 =?utf-8?B?VVpETnpsaXE5eEE3N1Y3Y2xvdUtTdm93aWRRNHh0dHdQZ2c3RUhRbE5xNUJH?=
 =?utf-8?B?Q3FrczdTdC9ObTZTT2ZscmxuTm5pMy9KTnI0SkFadXh4OGZaajNMRzlYZktK?=
 =?utf-8?B?cnlZRjE0WXdRYzM1RlhmUkF3TWh0bW9XSEkyeTA3cGFJK2h2TlBMWW1Bc1BP?=
 =?utf-8?B?aSsrbzl4Um9iVC9DYVg0Z2NRMzg3SWN4TFZhaEF6RHZjYnpWeXMrZ2pTYVYr?=
 =?utf-8?B?Vll5cnVIVjRSelFOclpCVTJBRGt3Tjh4SVpkRUFMYVlLOHNrK1F2ajVVOWR4?=
 =?utf-8?B?cUFjS2VtdXpYVVRsc1k1dzhaODRWRGhDQnR4V2dCWHNSZGtIZ0QwT2pwb2Ew?=
 =?utf-8?B?c1NrZkR4NXY0aDBJbjF1MzRSQ09SaytXa2h0RjJ4enNXaERzUUxuM05GUDNL?=
 =?utf-8?B?Qktub0dVUHZnU1BOQzRMNU1KOFdwZTFDQkJURG1RbVJoMHozblVQTEpKTDJW?=
 =?utf-8?B?SVpTdmkraE5GOHJuTFZzZlRPNzhMU3dyUlpKNk5TaVNlU2JwaHI2T2hubFpT?=
 =?utf-8?B?VDV4cFNQaFlMcjc0d055RUhjbDB6MW50ZjlTTGVTQXUxUjVXL2RuTjZUV3lo?=
 =?utf-8?B?Tllac08ybkdzYVpHVnZIUldBZUhlUlNjWmZvNW1iT2FtU21Kd2hKMnZzNTNX?=
 =?utf-8?B?V0dBS3RoZkZwbTlwK2YrTDFTTlNnUkc2UEFZWEp2djhuYkJ1MHZETWlNNzBO?=
 =?utf-8?B?N3ZQMFBDRWsrZjlIUjdTcHJMc0tVM3FIdjRjdS9uVzQxN09SM2J0UTJjWTJs?=
 =?utf-8?B?TUNNbndiZ3krQXQ5TGpURnBybk52bjJWMlNWUTQ2c2RyT1dZeHlka21KSzVw?=
 =?utf-8?B?ekp0dk5Tck5qU1BUVDRPcEJnV2Q2M1NZbk8wdEFiVUg4NmpRZjlMOHRsUGtL?=
 =?utf-8?B?UmNXN1gyTkh6MFZnTk92ZmF2NHUvekxZdmtDcnlKd00wRkVhMkVYdUIxVnJG?=
 =?utf-8?B?NXIzOCtZb2IzSzVYckNoclhKaG00VjFxRmR0bHhlKy9DcHNtemNpNXJTN3ds?=
 =?utf-8?B?MG9tRkhXcXVUVEluWHRFcnI0bVhHZTlqdHQzL2hXaW9CMisyQll1V2hHU1lH?=
 =?utf-8?B?Q25zbm9WSnlWT1FxQjVxY25oeWFiaFFDN0d1aU5RVjBOeUExOS96ZjFYU21X?=
 =?utf-8?B?MDMvZkQ1Szc3NFdqZlgyNWlMV1BxSjVNb3RsZlJ4ZzFEOVhPMStGZVUrYmlT?=
 =?utf-8?B?YVFha1NpNWdQKzRxN3kxNmthYkhxdnZidkNrK21PZXIxNUYwQ2RyR0I5QW0w?=
 =?utf-8?B?UkFKVFN1RXB5a0pjT0dPOFRLUjJaZ0o2NUU5NnFBQ1hoYUcwOStJY2IxSW1p?=
 =?utf-8?B?TjVFWDlweERLazg2UUpYZUk1aUpGOEozRUczQm01anlFTFVzMzNCZk1maXg2?=
 =?utf-8?B?ZW9lSFV2Wi8rT21wUlBNZGZGL29qWDBpQUcvUldxalFYbHZYYndaNVdMUUhV?=
 =?utf-8?B?citVRkxPZGp2TmZERTBUQ1lJZkRkZ2xyR2gxU2FzTW9taGhOUmNpVXpEYWlx?=
 =?utf-8?B?THVMM0ZHcDlWcnV0Y3NFd2o3aXMvQWpLL0VWMHZDS29zamd1K3ljaTYvOHAv?=
 =?utf-8?B?eDJSbnBvTlk0VTZNZUpjbjZVWEhWOFBZQ2k2TEVuVTQ1SU5ZVnFRa0FpM2hP?=
 =?utf-8?Q?e1ixoohGwMzUz/txWorEgHpIa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb8c84a-cb5a-4981-0d8a-08da5e90e24d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 14:15:59.2598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ewm89coPf103KvLeqfPWR6Sd37IyGQN2CNeiHVnhVCiOuOL73dhYM/gdhg4/TPQQ/4x5b+c+l/ovaAc8S+VqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3008

On 30.06.2022 10:54, Roger Pau Monne wrote:
> Using nr_irqs minus nr_irqs_gsi is misleading, as GSI interrupts are
> not allocated unless requested by the hardware domain, so a hardware
> domain could not use any GSI (or just one for the ACPI SCI), and hence
> (almost) all nr_irqs will be available for MSI(-X) usage.

Looking at create_irq() I find a loop going from nr_irqs_gsi to nr_irqs.
Similar in get_free_pirq(). All lower numbers aren't eligible for use by
MSI/MSI-X. We can't allow the lower ones to be used for other than GSI
purposes because we can't know whether any device will become enabled
(perhaps long after boot) which wants to use a specific GSI.

Jan

