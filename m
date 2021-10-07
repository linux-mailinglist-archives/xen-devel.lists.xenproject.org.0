Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBD4424F4A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 10:28:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203409.358532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOkT-00014M-QF; Thu, 07 Oct 2021 08:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203409.358532; Thu, 07 Oct 2021 08:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOkT-00012Y-Mt; Thu, 07 Oct 2021 08:27:29 +0000
Received: by outflank-mailman (input) for mailman id 203409;
 Thu, 07 Oct 2021 08:27:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYOkS-00012S-OJ
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 08:27:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6119ade-18b5-43d2-ae7a-9722a00a2510;
 Thu, 07 Oct 2021 08:27:27 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-Vw3euRCPMSuFMC_1npTdDw-1; Thu, 07 Oct 2021 10:27:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4846.eurprd04.prod.outlook.com (2603:10a6:803:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Thu, 7 Oct
 2021 08:27:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 08:27:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0037.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Thu, 7 Oct 2021 08:27:21 +0000
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
X-Inumbo-ID: f6119ade-18b5-43d2-ae7a-9722a00a2510
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633595246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHQtsnoxVcPL8S1M5A3650zhCe4HCafrDqal0UWMqJo=;
	b=UZJz0s1XKTBDIiCr+bOpiKiJWwt1I9OQ+kTvXF5++NP9S6vlI4fuC3TipYD8T+/hCKzGwk
	ppUadOqRNHGvtNRSpbvwHTDQRVtCDIjMehPH/JcVwZPnfDPWbs8DQCGFFqsIT3DPFyzBNx
	oRAkNJYODsABaqFVNXOnFQ09/lSc5MY=
X-MC-Unique: Vw3euRCPMSuFMC_1npTdDw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+LCAXKds6UVit3xZV9vLRAMzasOkjNG+MLUu38OX7YjV7r8+BnUKVcAuDmiIFcAm2n8q5xDcz4JTC+9XwhN0FjvX0/LmE61rc6SY901bzytXf4iVMoGt1FP5xoEXtEeOm3gxzHADHdZz50IRzy570GLzhgpqOd43nYEKAVQMjW5uQtcpGI2zChdCh9RFn4M8BLRv0LfkHYqpRlzdjoKXtAucI91dXT1toK1U7ap5h/5I4QdzkgZ2cscaFNU5mivojj35ptEJrLb+sRPTz50zZS9x1Tuvt/kQMPkxP9qIj1evF0GTjkiUZxFVEPN+yOd3kRHQYKBU7ULqcW+p4ACgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHQtsnoxVcPL8S1M5A3650zhCe4HCafrDqal0UWMqJo=;
 b=XPjzW3hQXEYmLCdjeKP1HT6QA+OF0UE1sAPJ7VR4KjXX8Cbh2aWLl2Wk1ev0qrvTaZup1yylU5VdBtpoKpCpq87epWganszDxDZXCXh9EKqk5Y2zGlVaNyFvSVTRsW8p0oK4HnvCHm8U+SlZs7scgfPHBn0kQKR5lSrrIUFI4yHNCtYoEMmOF6QDex7urx2e9UHEN2VIHNaEWm+SpZ10WxE2aAs2vtWKJR2QlrFSRXa0TtU1SCe9LD1ekTksU0AVo87rYmWGs23f2A/fsGGzzBr92dC2hAGPZZJh5hRX/GSCCUlzx1Fk4AQJiUG1Rz68gZGcl1Z6oWtY64IYdGq0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 03/11] xen/arm: Add cmdline boot option
 "pci-passthrough = <boolean>"
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andre.Przywara@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1633540842.git.rahul.singh@arm.com>
 <e7d91ded71816d07f559b98027e5be1ff172dcab.1633540842.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c32a39c-e155-588f-775f-e040013166d8@suse.com>
Date: Thu, 7 Oct 2021 10:27:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e7d91ded71816d07f559b98027e5be1ff172dcab.1633540842.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0037.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab3723e8-ad0c-4d50-6325-08d9896c48cc
X-MS-TrafficTypeDiagnostic: VI1PR04MB4846:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4846F84E145F5B82BADECCDEB3B19@VI1PR04MB4846.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XiqxE4Vc+rnCNmF631CR0NFvLT8NIw6d0BfcKBvaelsEpLEF9RMJIVh4vQHOMXKILdFNx1LmpOpkipiYDMux719v6fa8uPbC7vgOIKAmCJ5nRCtcadAxTkgP/FgXF8Hh6oqNlenEw7MR0gUYPktJZvYOHOo4FsA+KWb1eMFQmb5aumwx9OKsuCqae1OrnY5192lF2WmTQ+LPeBhZLHcLu8j7XIrO+OMBw17vnTDOX2IpaUW1Z1vX1dzJjq5Ix0pVGMpmuWtvlk6k+ZtWN+aqEar/8UxTsZEnUSAMz4QeNj4CQwdnrEY6Q0xAPoJ10BqW6pcGUdlcUVE51Gv0JFkiRxCYVxRKKtwu1FIOdrfrYWVwvPGwqm0kjRKGcMK2lMGUvXTQ8Rnz7SDezlU1I0DpyWitESA2WuLnAG0vLCcVEtiEQJpZJOTTvE0T+YLboNEGahmTGgTnKAlk3LPh26QRkOwQWJIrS9zx9/YUNA33ApzjtPCAIX1tQbvCsoMXIBkjGrlocxzhR6wlIEMCNlp9W4kX2hHwMYjdcWsjMRtHTv1AFcTQqoB6ZUXy0Jm6xOeRXFaegwEZIf8hYg2yTq6FgUzQ25DpFdFrRBBomPG/Tr9USFM5EldFRVPEW3pPUcgBnNM5nb6AVavLAdh4/XmWTo8IRQPmeQELEStWX4CObb4l+dKdF0r9YVR3kc5RpldHi/D3ToJkEZ9kwe3LAUwsZmidNL+zMnIanNFLBY3V/kE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(8936002)(186003)(16576012)(4326008)(6486002)(7416002)(508600001)(31696002)(8676002)(5660300002)(2906002)(26005)(54906003)(83380400001)(956004)(36756003)(2616005)(53546011)(31686004)(66476007)(66946007)(6916009)(66556008)(38100700002)(316002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajRCTnNDNFdlWmgrb2dpNjVIWVhOcldHVytkODBNNlg3ZjlVVkQvTVQzYi82?=
 =?utf-8?B?cDZMTWQyVHFHaXRGZzJqRDZONHdQZEFiSWdPOW5lYW9JbGJxYS9PM09naTJG?=
 =?utf-8?B?eDdCWEJKUCtmTlpmM2tVS3lNVGdvZHQxWU9UZkpnMzVnSEFnelBFNUlUQThN?=
 =?utf-8?B?bXJuWk1tUGp0UzF0WEhGdUF3MHJsRE9vTUdGZjRKTXYrZUtPZmF6bzN5dm1q?=
 =?utf-8?B?Y1hia3hXalUwVytwKzZTUHZzUUR6bFdIV2dNeTJ5cXlmNWwzdVBkbFdxaksv?=
 =?utf-8?B?bFdYUkRIK2FZLzUxTVE0am9iTVQ0dGJSY2RzeHZVRjBGbTJEUWVtNHcvT0Ey?=
 =?utf-8?B?M2xDbFVKenJJWjZlaVdVdHk2MUZpQTd1T1luVHhHbXZSOWYvYkpCQkUwVXZi?=
 =?utf-8?B?NmpuUG1pOEoxMTZVLzdheE55TThLT2VOUUdvMnJHdXVBTm9mTGdrMkFhU0dp?=
 =?utf-8?B?TjJpVnptdkc2MFJjaUZsY04reHNlREFDVEZTRnlMTWxrSGt3VHI0WHZjRDZQ?=
 =?utf-8?B?VXdHYXdkcnVSOFpEZ3NlZkxmQ2dQTDIzUURweXNaR0h3OEhwWjh0OW5kQnBq?=
 =?utf-8?B?dUtIa1hjcko2cERVUGl0U0M0MEszanBWRWxIdHhQVVBpaXJMVWRmUHZta3F0?=
 =?utf-8?B?ZDBBQUVSaXBETG1jdmRpMy92bDJRTlplVjBYWHMyNkxlY0o1VHdkcE4vbWE3?=
 =?utf-8?B?ZHp6QjQyZDh6L2g3K202dEYrYTBUb3FtbGl1S3RoTzZIVHRVbGJ4TXpQWThE?=
 =?utf-8?B?L1NrV0RyajBrVG5ydzc0akhNVmY5RTVtMGtpa2F6anBRQmRjcXNEYWpOVmNG?=
 =?utf-8?B?WXZQQWdBc0tmdC9RYklnKzFnK1FBNHhxWVVzSytpcVI0N2ZuSjVYdmNmNS9h?=
 =?utf-8?B?UkFzdWxvUlg5eDRZVjhDeHhyemcxb2xYVWN2bmd4ZjRNYVhZTlEwU3FxRmNF?=
 =?utf-8?B?REFCYnc1UUc0WDlua3oyQlYvN0QwRjU3Z3d4T1N3Y3RBSDdxTENkbUl0cnBZ?=
 =?utf-8?B?YWpXZTJFajQ1UnM1Tk9SUndrUG8vRzdudXhPODNkSXl1cVp3OHpWOGM5UURt?=
 =?utf-8?B?LzdtSnZacmsycitHOGRXOFJSZzh0VGptNFhpUDAwQ2pxY1NSYmZBeDN3Z1Fo?=
 =?utf-8?B?RnVqLzVHdURDcUt4QXFYcEtyUVB5U0hKN25KSlNRMUp3YjVzY1BlU3ZsR1Ar?=
 =?utf-8?B?VW9kK3hmMHRMOTJKbjhWcHNVNDlvQUlpaXI2a1RNdTZhaTkreUhXNFM5TU1m?=
 =?utf-8?B?T0t1WnFuQkV6aUFVRFk1aU9SNkM3bkZQQ0doOURMUHdqY0JYUGwyK1krZXVR?=
 =?utf-8?B?Nk5nMDNZSFpad3c5cGRRWjBNWDJPdEZWakZFVkYrMU8yUUdraDhDMEdESFFt?=
 =?utf-8?B?eHV1eGJqN3htL3Z0MGRrT21hSTFQNXRmUkRpMnczYXdKNGFOV3kwVmE0Kzdw?=
 =?utf-8?B?VnhsK0ZpL2hmVU5HU3ZzYmQreHFYRVlpUGVmdTN6Smc2TWZjQkw4Qnkya2ZO?=
 =?utf-8?B?Szk1bTJFT3R3UncwQlgxS0llVHR2bDUxY1NaajlvTTNMa1QwckpoSXNpTFc4?=
 =?utf-8?B?VGlMV21RWFoxVjFmMWtEc3J1TmViRjdsckdtM2tINDlJRysyVmdKZ1pxckJI?=
 =?utf-8?B?a0ZkUU9mbXF1QWo0RC9wMGZna3dYaU1WemdOK0JFRE14MXNyZmlRNmYvMFkz?=
 =?utf-8?B?ZTQ0N043cWJjR3NwWFgxZXBFM2lSMXV3WDhnaVNINDk5RnJvVHBrTTI3OFFF?=
 =?utf-8?Q?VnBX2vLeQpWoKZz0Ios5CHc6QrQoSIFCJqr1wuL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3723e8-ad0c-4d50-6325-08d9896c48cc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 08:27:22.1242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPRZY6ct6knHcnJ6vGpvjypd6pIUGsEjsxAIQ7VpuAZLbLcb4iHFCzFsf+B+i/d9Dom1HMJ4evg8Gjzpq0O9tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4846

On 06.10.2021 19:40, Rahul Singh wrote:
> @@ -62,8 +63,19 @@ static int __init acpi_pci_init(void)
>  }
>  #endif
>  
> +/* By default pci passthrough is disabled. */
> +bool __read_mostly pci_passthrough_enabled;

You properly use "bool " here. Why ...

> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -19,14 +19,25 @@
>  
>  #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>  
> +extern bool_t pci_passthrough_enabled;

... the being phased out "bool_t" here?

Jan


