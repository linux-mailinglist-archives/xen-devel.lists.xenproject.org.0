Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896047FEB01
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 09:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644457.1005487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cbI-00057u-1E; Thu, 30 Nov 2023 08:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644457.1005487; Thu, 30 Nov 2023 08:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cbH-000558-Ty; Thu, 30 Nov 2023 08:40:47 +0000
Received: by outflank-mailman (input) for mailman id 644457;
 Thu, 30 Nov 2023 08:40:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8cbG-000550-Lp
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 08:40:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2740e5a6-8f5c-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 09:40:45 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8564.eurprd04.prod.outlook.com (2603:10a6:20b:423::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Thu, 30 Nov
 2023 08:40:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 08:40:16 +0000
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
X-Inumbo-ID: 2740e5a6-8f5c-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=baIkOXm/4HxVZXgguijQxxhGsop5SB0t13JLS8wgOcvBX1fD285l50dIkGtm3gMUhlk6HVIuc2IM6QStBuLhQye099vmcZyP0FEBtH3zgCYv2CXQNMAOVgflZWpxts2/xhnDHaltq4GwH4CtBptD60LdBOqY8n+77uOFng52YI4qEcsY6Ct2bhg5Sp9XOkipR7RK3Jci59EUGEgYv/Kw64Ve7K+NrXvK4nhaZUZH+BjNwehLbZ/56WmtI7RDOPjeJZi8ZUPk8isXuHt2N0lyVTDLm4DXYBdFiO045UKgqylOpP7qWQPskmv1xueXNT+Fi+Y9pGU24ymLwqka6C8uiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/k76Xhu57VzYt18+m03qUPAj5zCm2s8X0C+1He+pFY=;
 b=iE1b29yrdlmpdLroZsv8LSqeeIVv+mgqKSJ33hcaApsLKk8PJsksg8R/Qh3vqwL1Y3LtUbey2VuWjnpNJ61WLkY6hJ0tYnDQ+oRgN8WcRGKa5cbfEGe6iqM068Zzd8KLC9/m2h5NDmKbvEWjtksDKszuKA6AsE5qGSZozt/tOq6Eq0mqPUfdMZoBsWUYes2LH7aEW0sMXtkPmdPFBjOdPRAiitM/2gppKssJUyPr3En/tdxGWsG6mRy7EBSGay85ZnWLXi8Gmu2OE5P5lO/PEhEmMdAIVa/LFFxHZlWBTDk7zHkYzUX8qP00sZD9vlWmyQUdmSRGZGdPnGoY2J9d8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/k76Xhu57VzYt18+m03qUPAj5zCm2s8X0C+1He+pFY=;
 b=2aQLcCLn17SUUnDONf3t39C+3A2FHHEuw9bpbG1DyZOwwsnx8v/GOS0c2j2M576jjw72bbJCvCbPk1dBvg1tfyxGJq4XpUZd0ESboCCulISZ6tBCO8BBu/g23+JqbxvBvMWQVGym2dh3oxBOx3z0/h/lKu7UIp52WW2IN9wWLgzd6LUYdY9L2BQKTTCK8IsHovRY+a1XDBzMMziWZAan7hZgouG2TQXTL1cZ0QK6g/5+q2iTa9SqauAu48oxERN1tSNQkhUcOuDAB8beM+iugcNfD3MgnkzuzoIoZbNz0Rlq/jQK2uqWyUMj06gnTSzQw078M5368PznaogOpsvyZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9cd622b2-f283-476a-916a-1eb5a1171754@suse.com>
Date: Thu, 30 Nov 2023 09:40:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] xen/vpci: header: status register handler
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231128194427.2513249-1-stewart.hildebrand@amd.com>
 <20231128194427.2513249-2-stewart.hildebrand@amd.com>
 <ZWcaiqrg9ZMn6JFC@macbook> <d493f9e3-ab17-4662-9e7c-d313f4ede033@amd.com>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <d493f9e3-ab17-4662-9e7c-d313f4ede033@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8aa041-b493-41d1-08d6-08dbf17ffa39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GoLumxfxa4/OWYrzWnAB7FDcIyZb/iMgswXjPz/wnwNt7RjsoN1gtgTxbAwJhCQ6mmEYPNiI55sOfiUx+5Luq8XDVajWsdZ+nW1TVI67Am/9AuTMPg16CRxWZoUOUiMtocdiaLapIAT1OjE3RS11vivw2MGrk5XLUUrwiQo44P1Kmhq3Qt4Rsj9pSZNsHB+drKxheRgHyHGwAUmiKTCyHDKgyQioqGEyP1jSYFxuh52UzYCmTjHL2K1T30lt62+satxPbKYv8hTsae3d3wE24MPCANGSOmsx61+kG884y9kN0cuF2SZUrjg0JW+/5fuTB+DifOdSDj0+Jr6sQFdCRlg5715G3AD1KJUlyOykj0QQV8gycSEeAVm+aUfnp/irKjxCC5IjOX/EE81lC2uZ+QMj5HT+9xmwfiR2fVplBbAnGGHo427/R0Nol2VNxAB1LPeqZYa80E3lJedOstKI4MzzWU2zkB17FPqK/Uk+FztEf0TNrx8mKBlNUuUwVbG0aG77VBeJD5TktJ7lO6DsziWFikd84Fxw/+8lnyc1JE8KIvKPXj2Qq2HZDSHNXtmcArCSBpwDW66qpJxVEt+hAxJIlSEk2puGE8hn29eJIDm/QZAS3ruc6TaHRDqhBf9nzINqClkA1bUarTMQ1k2VhD1W0BMrnzNZFcvNiDykMdOhlesweXlxOhZ0lg0MRtibBacPxrQSF0enswc+iy8Qtg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(376002)(396003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6506007)(26005)(83380400001)(53546011)(2616005)(6512007)(5660300002)(4326008)(8676002)(8936002)(41300700001)(478600001)(2906002)(6486002)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(202311291699003)(86362001)(31696002)(36756003)(38100700002)(31686004)(66899024)(43740500002)(45980500001)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2wyWTk3QnMyK25LOWtvejRlWTdJWERlMTFoZFgyTVVhK2FodlovdmdveEFO?=
 =?utf-8?B?cisvenRKaC81ejJ4dEkxamtjVGlVbzZxeStOcjF1TGM4Y0xDb1lFaklFQmts?=
 =?utf-8?B?Z1lxVFgxcHY1WXBJVk9TZGRTZUZ4TmVDMldlQkswcmVFQVJGWXVOSW1SNDV1?=
 =?utf-8?B?YTFvM3lBbDYzYUt3ZVdtUk5qN09xK09HZHJONlM5ek5NbDJaYzBTeldTSk43?=
 =?utf-8?B?dG1wSGc2d0RQenJzWWplV01ZaW5RZTZCeEVFM1RtMXpiT3lTK0pLZS9BK3Q4?=
 =?utf-8?B?UTVEdTBXMkI3Tmp5RzJvM3NDNVJXb0V3ekhQbHVxZDJkWXlFaXBVWkNzVUZr?=
 =?utf-8?B?SW9DOG91bCtKdTdISHljMEp3MFE5ZUJlU1AyNWF5MDQ2VnBoakJWcjZvOS9q?=
 =?utf-8?B?RnFVL2IwVHJLc0RkS0UzQy96N1V1ZHgyTTRrMkpaQ0RMSVNzci9DMmVJa1ND?=
 =?utf-8?B?RFdvdGJUd3dZaC9FZVZHc0xKb3BvVlBLRk96dFZtMHpxT21SQTc0SWs2a0hW?=
 =?utf-8?B?VWVaNTRjcnJnWU14SEY1VWJ1SWsraFVzcGxBb216T1pYam1jRytMbmpjb1o5?=
 =?utf-8?B?YjVrRjdzS1NnaW1YNFlyTnFvMzFicXdvSHJZTER1L2hBYzlRTnpkVG5BUkhB?=
 =?utf-8?B?ck9lQ1NLMGFZY1R2TitpcTRxTGRmSGRPV1RYNm1SakE4RnhoNFRtOFovdHlk?=
 =?utf-8?B?Zml6Smx2WnMwVE1CS3lPWjAxNkJ1dlZvdHF5cFZOTVJGYWkrZXREZkZhUGUx?=
 =?utf-8?B?bjRTZWJ6ZEQzWDVoTUJXbEYyYVQ5MkN3TVdTd2FFbUhxQzRKMHZldVhmVnJR?=
 =?utf-8?B?WHlIOXRPaWVVM2dpZzM1ekZkZUJ3MWNzT01CY0QvOVpmamlxY292bzljaEZu?=
 =?utf-8?B?Zm40SlhEOHBlaHc3QUs0OUF0Y2dkTnREQlBtUUpyTTBBbXRvdmUrZWRTdkJo?=
 =?utf-8?B?N1JreU13cE81dDZ3eUszMThydDY3dHU5YjA1QTJnNW5hbWJEeFc4S0paTDdB?=
 =?utf-8?B?Rkw3SG1XOE1DWUZZcFBnQ090U0hhNUNkWTJpbnNvZ3dZWXN4WmN3N3RwNzFV?=
 =?utf-8?B?Z3hsYkNqNmJWTG5hZ0pWUjVTZ0Q2OHNyc0lYaFlReHFWbUpPZ2ZNa0V4di9G?=
 =?utf-8?B?ZXVpRVRucGw2R3N4Y1IxV2VFaVBoLzl2aFZLa3FsZUpSSWY0U014QlRaK2Fj?=
 =?utf-8?B?dTJRRVIxWTdUbG1jL0NnejhWUDNjQWdjdUd3ZjR5b29YenRiWm5pSDNEeG9y?=
 =?utf-8?B?WHpqbmVETjFqYWNLa3BPOHN3MGwrcmU4MEZ3MG5zL0gxWHJzbHRqRjV0SkRX?=
 =?utf-8?B?R3B0T3NQaHd6OXJ0QnhHVXRrOHg5ampLNXQ1eXhwbEpQQ2gvclRDU2ljbG1V?=
 =?utf-8?B?TTVEc1JhSW44bnZnWmZrb1RVeThwSldNNmJmYVlQZUw1cmYxMXNlUUJTaURl?=
 =?utf-8?B?Yy9JMEthSkVkTlZMS2JyUmFWZDJxdHNySTYyeG96WGxWTklvWU5QOW44ZmhX?=
 =?utf-8?B?ajZ5M2hFRVRyQ25nZkczM0UyT1N2TFB5SkdmY1dYN0h1RVJadHJWWUh5QzFt?=
 =?utf-8?B?bUlvV1JkUjY4dWJGakNQYUtmaVFXR2FTcnVKUlJFcE5qMzNHWmVtSXV3dWRQ?=
 =?utf-8?B?Rk5rM09QdDgrcDlaeHRTN3EvR2llY1h4Z211R3JYSkpvK1NUbnlJZEQ0OVc2?=
 =?utf-8?B?aXdKN1lUbUxpOXY0YVhOc2tKMFNheW8xdjZOTG5oRktFaUZIVFMvMG82Wlds?=
 =?utf-8?B?L3JUby9IZmRqYUVxSncyNHo0UUFFZDRmTVVFYlJiUjNMSkNPb1dNaDB4YkdV?=
 =?utf-8?B?QXllRDMyYUljSGtYT25QNkZCaUZNUEcrZFc1bXFkTFAvTGw4WExnbThETFZV?=
 =?utf-8?B?dkp2dWJFR1JVOHJsZEtFV3VYQkgrWFhGQmZicXZoWEVveU5XZ1RMYzVteDlG?=
 =?utf-8?B?VHdLSWdIM2dhd1JoY1hOdlIrMjZ6RGYvYWpkUDd1TjAvcld5MmZzbFJFRzV2?=
 =?utf-8?B?djVRRlpIbkpXU0J3amhDRmNzeDBmN1Q5VlRQdlBFNWJqWTFuaERVUTZMZURs?=
 =?utf-8?B?b3RIODYwMStjUytib1pkdFJjcnNFcDU4YnRCZ0xxL1BUNEM0NVFoaHlYMTBI?=
 =?utf-8?Q?o/LeLz7Xhjt+kcHnfyLJF1/cQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8aa041-b493-41d1-08d6-08dbf17ffa39
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 08:40:16.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66CtNsbVML0hY7Dg2/JZ+ymmSyvmN3kbn7LyqMrsk9fDhnLq/8perW4nW3SYnkdR4blNSIoTbv66X8RgkgAOow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8564

On 29.11.2023 16:18, Stewart Hildebrand wrote:
> On 11/29/23 06:03, Roger Pau Monné wrote:
>> On Tue, Nov 28, 2023 at 02:44:24PM -0500, Stewart Hildebrand wrote:
>>> @@ -407,26 +445,26 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>>  
>>>  /*
>>>   * Perform a maybe partial write to a register.
>>> - *
>>> - * Note that this will only work for simple registers, if Xen needs to
>>> - * trap accesses to rw1c registers (like the status PCI header register)
>>> - * the logic in vpci_write will have to be expanded in order to correctly
>>> - * deal with them.
>>>   */
>>>  static void vpci_write_helper(const struct pci_dev *pdev,
>>>                                const struct vpci_register *r, unsigned int size,
>>>                                unsigned int offset, uint32_t data)
>>>  {
>>> +    uint32_t val = 0;
>>
>> Nit: might be clearer to name this 'current': it's easy to get
>> confused whether val or data holds the user-provided input.
> 
> The name 'current' shadows an existing global variable/macro. How about current_val?

Or curval? Or just cur (to not collide with our common use of curr)?

Jan

