Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B877FA2FC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:36:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642176.1001486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ciT-00009C-D3; Mon, 27 Nov 2023 14:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642176.1001486; Mon, 27 Nov 2023 14:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ciT-000074-8Y; Mon, 27 Nov 2023 14:36:05 +0000
Received: by outflank-mailman (input) for mailman id 642176;
 Mon, 27 Nov 2023 14:36:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7ciR-00006q-IH
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:36:03 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe13::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49de6c90-8d32-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 15:36:02 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9761.eurprd04.prod.outlook.com (2603:10a6:800:1df::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 14:36:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 14:36:00 +0000
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
X-Inumbo-ID: 49de6c90-8d32-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXpKopBefJ0P6KZghsqYizwomuHJPDmKPf90ja/1JwI3is6z8dEAnAk1eVWg5SmuW8sMx0Xq1TaJApWQ+aJ2vCfMBg8V0+oWP6dy2ouaazgzBvy94a6winTpd+hHJAuiNHPkX0EMtNl2jtaaeZd+QJzwUv0DXNA8S3i9Z4R+qxLfZh8pKhDpwkvel0ugij4NQGVA10ojwmFY/uvR3cWw0aI0dElYYAnpN1gyqcvxLdKX0UT/DJUq8XnKOnoMqXwxI99Q41HnXH0v49boQUxoFB70mxvM88evoDyH6GnkHJRuQIkiwRycu7P0mdxrQhxxHwpqT7EvcWgubJCksg/6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IRX83pTyzxXPzG1cRo8Wgcd/HnH1iuGKnBg0sicY94=;
 b=BCOhTbzjKkCEs9U1resmvRPIDwNKBKJONq4YwZrUsiJ7PZCTDByzv2FM44NyAM3LpiMcI+iDZEsN5VvSTIyBVhRwg+naYw5I7XBp1jMfVfYD3qqqyqPB8iltMXZomRMb8QJqXv6mkshjvxC4+HJ4GloYtdOr/Ckmy/uhiBQr8dmXM+itrdW1FcDnDV8NmNS5Mrn+V546K9lpkqguv6BaGLz5Z4N+tL73y617L62pHdMvt/f6weG36OuZ3aZU48/+GpjBYgRWippYujcgqVhw5m0RKl3icDLV877zgOxIYUW/Y1nozTz6YCRlesu9gp5jTJbOI39SzmcyAy1KmTdsew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IRX83pTyzxXPzG1cRo8Wgcd/HnH1iuGKnBg0sicY94=;
 b=YLIF8ano1ky+toBRWELKHlGl11aJBvh1RwOFRu4tgqTzvnwZBOB+06bRvyncJprYKBV/oqaPWWPODvvqwFmOAWun0KUL/QZuUjqDBcslNsFD0Cy9yLTOLu81nhLXMYgIrGA7dyKvw8s0liQqRdUF5sW2tOeM+86oup5pNkik40XmuRGRrEhmIsqDA/c7GYHGNE/tsCXfmdasBQfhUPETUT1t+snIxH3wJyzlcYZXAdKAXtTFjl/seoq7lbM2eEgczL6K3seuV5KBFFS8Xh+23GArbjOh47roRuGsPz41tAV6r4yYdktYgTTRefxpbss9jeQsTJUTtXwS7MFX8KmhKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45515791-e538-4c8c-9275-338e6ae06640@suse.com>
Date: Mon, 27 Nov 2023 15:35:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/14] xen/asm-generic: introduce stub header numa.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <44bb374738ad0cae041a0164812dfd33d091d954.1701093907.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <44bb374738ad0cae041a0164812dfd33d091d954.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9761:EE_
X-MS-Office365-Filtering-Correlation-Id: 073a8b81-107a-4f2e-1e6c-08dbef562ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DvBBw2T6rd7G9tsFyhmDdLTQi9iwcEQqob7Uny+uxJwvHElx4C2rrnaBqpPzHNx4s1dabNaAWVpbpHANTG77paV/+6WcEznjyBcdifKyP7D9gvO8fYB0xaqmCCLEjlM6eXiyMqg3obn+loVoUlgZI7ylCXV3RoSWByc9GfRCT5q0XwcXldWHgLTP8KjHrfO19AovHoKWm8PkoDKXurIp62P6yzAc/ZoJmFnMHiSqpqqRC+FH4UqRet5xV5PpEakN2Iu4qyWfv9mQ+662+ghdt9bsfc43PiA1AjLTki4sMx5U0IKmymbUKROMuLCHBfY73QcdqOyAfW2Bs3DwjdTxdgDowky7sFiie3NlRosbmFGO5cUEFXzkXjZ/eBIZ/FmXt37n7NrMp1qwe8nJsa8KlVcwF6Nh0jvM3mWetNNRiYaqutNUQ9rr95T+uqYQVPLruiu2/QNE/sltEH7G1IPXoTiPXdplCnseI7n+HxBUaShyYxzbjPDYLQ0zRo5Z+eY5i+EoWtytaPw3uMudl9xatgfGbLS2kUNidDpnEBUpeHQPVINmdIzGlJFnMZbjKOojuijjIUW5UGlFsJIsBkFnx71YR4RTsxziyAOeyCiLcdvPdsvi5rFPMoyCS2XHeBsZZXZGnjvZh6FHKAWj+2QnegmyW5AtLAj86Map7ZkyZ9o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(136003)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(26005)(6666004)(6506007)(6512007)(53546011)(4326008)(8676002)(8936002)(5660300002)(6486002)(7416002)(31696002)(86362001)(478600001)(316002)(66946007)(66556008)(6916009)(54906003)(66476007)(38100700002)(31686004)(558084003)(41300700001)(36756003)(2906002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1hYVG5La0J5UlNRTHMwQ1hNT29oK3dMdUVudmI3QVA3ZUEvSklUVnpXaXBJ?=
 =?utf-8?B?dEQ4Mm1aL3pFQ1FLUk5jcXhjRHh6Y0xwRnFDZytyNktCTVF6ZXhxQ0dYZzJJ?=
 =?utf-8?B?Z0k1WHB0bHFXT1Vpeityck5TS2x3TTBhQ0NBa0NodzFPS1RWbzByM3VFMldJ?=
 =?utf-8?B?czMwZG5BZDI3WTdWalZhWXRPMXJ2YVQzVlFPNmg2QlBwcnIwK1NFcVpsdWRh?=
 =?utf-8?B?WWthdmVNeFE3dGFaUUZpRnNRenBiRlhvL3dobXFid1JXVGZQSEhUVFpsWGxW?=
 =?utf-8?B?aFRGVjNTcHpCdmNLMzRkTE5lUzdKaG90YzNISy8xa0N0a000VjI3ZXNkbUxn?=
 =?utf-8?B?UnRlSHYvNFpJVmFZU1FYVGFLWnVTNlg3RzFVSzc4aEJRQ3JyVHdITWUvWHpB?=
 =?utf-8?B?eHVoZHJEcUJETU1sb2w5R0JBaE5lMHlhcGRtSFF1U09Odk9aVVA5dC9NNzZ0?=
 =?utf-8?B?RzYvR1lUVmc0YnNETnRUTEdUTmYrdkxxb3RUaWFScko3MFRiYm1sN01QbzlR?=
 =?utf-8?B?bXMwVnN3RWFadkxldmxsNjBRaG1IdnNVeG5XcDdHS3NqVTN4cGQyZmNtaHBN?=
 =?utf-8?B?THduNENGUUFRbEgwZnc3enF4MWFlSFNZNElwYWNjRUJnM0M4Z055RTJVQzdp?=
 =?utf-8?B?bkFVMUo1cHFFUlBqYmNiNm5yanU4UDRRa3hTVk9tbFBwZSsyYmlDV09oNmZu?=
 =?utf-8?B?dld5bVEzNjc5QmtNV0tPbVl1T2h2U01zbEV2bU5zTlN1Tmh6T3FmRHlrV2xq?=
 =?utf-8?B?b1lLWVFYQi9jTWtUaGxDS05SNnV5ZFZRNXkvd1p2R2dRSXhsQ0xUWmNhelhK?=
 =?utf-8?B?UkR3akZZYTdFNVZvM25RaXpBakFtR3QyUis0QmRNY1hLR0RaS1ozM2JqN2tx?=
 =?utf-8?B?UXVjY0cya2tMbno5WldPN29XbElUZStkaDF1ODZndnVIU0JBdktkUzFFL3dJ?=
 =?utf-8?B?L2huTlgzL1NIWTNtYXpuS0JaWXVYOWN4cDVMQlVmY1JscU5YcSs2RkxVY0hi?=
 =?utf-8?B?a0ZRMW5JRlJ6VEtvcTVSYUVqODNEK21BdDRrZmd6UFg3a1RuaHE1OWdGeDJ2?=
 =?utf-8?B?OHFGcGdWWnh0ZWM0cWRDbU10RVF3MElpdGxOWHFlNEpSRG1TTXZ1bjRRaFMv?=
 =?utf-8?B?VnVKcmk1ZmtaRFNldWU2WUVEdS9IS01JdEl1ejQzRUpDYmRjQ0gxd2hVMEti?=
 =?utf-8?B?M2FweVF6TEM3a0xQS1dqRTF3SzlLQ09PSUxJNDFkSlVQeUxoTWtmYUNlZU0r?=
 =?utf-8?B?bFZ0RHdlZFIzeFp0OGVHT1I2NlZYMHBsMlBHdlJTaVNZNThZelB1T0tydkIw?=
 =?utf-8?B?dGNIalpqUHltdGdnUHhOWkNJR0pnbk9kM1g0dWNUNnNVNGU0MUpJL0REWjlR?=
 =?utf-8?B?WnBpQ2p4ZWdTVUZvbnptaVJ3emtMc2lFcVlRWmN5UVlLRXpReDRIMGF1TFQ4?=
 =?utf-8?B?aWNjcThhZ3dMTzJHbFdYeEIvdVpXV0ZmUTF4c3l2OFQ0b1ZyWEpaNzZPUVNQ?=
 =?utf-8?B?UXZIUXd3SzluekZHRmZpRzZCd3p0N1QzbHZFYzl1NTRYMk5XdG1VZXJWVTZ2?=
 =?utf-8?B?Z2RRenB4MDVoc2RBNFZud1hlRHFmUHlNRnJlMFBDaWtJSDNPNVBVeHhXWVov?=
 =?utf-8?B?MUM5dGdOTDBqSkFEbUZ1WnRSVXorVHpFY1liT2dlQmJXaytwY2JnMVVGQ3di?=
 =?utf-8?B?Tlh4enNqbzdjUWZEcG1qRGpnTWpaeklsUlJ5ZDVaOVFMQ2dRaHRIVFR1UmdH?=
 =?utf-8?B?VmFrYVVWWjB4YW9nczVsQzdzRGRoTkJZd1YzQzBlZDhMRGsxVWZJUWtPcnVp?=
 =?utf-8?B?N2pTai95NlZKZCtjK0VQeVVmTmdWbzlnMHNncDRjQ1JQSEZjR2diMHQ0ZDRs?=
 =?utf-8?B?VXB4My9iSloxMDZVOExOZ0JqM2FXRHhnU2xuaTRWV3EzQU1oUGVxTWp6Zkk4?=
 =?utf-8?B?K2pPQ3JwM0JpZWRHSndsYTJkclRRSGJNMm16QW4zdXNtUFREMnhUaE9IcVhU?=
 =?utf-8?B?dDJEYXVmaERkdkkycVBsd21JL3NkZzVkd0c2OXRyYnhURmFSdHMrUDZvWkln?=
 =?utf-8?B?blJMZml1enNMd3NmOXdxNk4wTUZuaCt6REZrOFVJVWlDaEROOXhEbG1LYUN0?=
 =?utf-8?Q?Qa7h3JackTJLD/BOcQ9fxDkZE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073a8b81-107a-4f2e-1e6c-08dbef562ccb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 14:36:00.1967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9x78g1v5kn+LWTjJAN8S0CKIisPPX8ZHbNWT9Yi6nvI60VUGNtw0PBuAhJynS6RbYvk7CbxboGe47OPQhlmrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9761

On 27.11.2023 15:13, Oleksii Kurochko wrote:
> <asm/numa.h> is common through some archs so it is moved
> to asm-generic.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



