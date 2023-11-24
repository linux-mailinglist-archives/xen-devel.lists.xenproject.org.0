Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3847F74E2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 14:26:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640702.999315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WCD-00015Z-AG; Fri, 24 Nov 2023 13:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640702.999315; Fri, 24 Nov 2023 13:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WCD-00012D-5r; Fri, 24 Nov 2023 13:26:13 +0000
Received: by outflank-mailman (input) for mailman id 640702;
 Fri, 24 Nov 2023 13:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6WCB-000126-KY
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 13:26:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7d00::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 081f6b70-8acd-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 14:26:10 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8375.eurprd04.prod.outlook.com (2603:10a6:102:1be::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 13:26:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 13:26:07 +0000
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
X-Inumbo-ID: 081f6b70-8acd-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MptBarYaHncmdVeG/0ea95dS00eDUVwllWQQk/r3ZZxVK2QnIHFej++uFmq2CcrmMyjA1OQ9F4o9DePLHKTeT2QBNoOADprREYJrFqr39uGF+dbXO/Zme+9X+Cd1MyPnieMlfTSR2IucutBbm+K5102ruqowI0QxvDRN5/R2y6KO9WMm0Vb6CW5qkwqTIWBMZR/ita+8+cMNLHNUpeVnprjgdByawoDGKIoZzROuV3EyQ45kOcnl4Le8veNBqDgLQD/1kW5N7wGZfNE3V3c3YM6fxKFaHLb/yX/cB9zZaSivCpeLCFIcu3UthgtZFS3ZEASI4lxFI1BF2cchiDRohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhBrRoXSxSPmX3jliiXK9WUeRpBl/EtLSGFKchjY44M=;
 b=SUHSz/0vb3g2oK1OyBiHf3qVOIBtTFjyn3NfAp9Ihmo7PAMXgo6yaQMS7B1HS9IoJ+Gyi6DbAOlOEiniLBQBSDlJaZhlIHfY9PpVlWB96koiC1DmPCpzr8K+1k2RjPEqga14NIc87SyDdTTUq6jKGQnbCm834kexXi+CI20ffHn9kQ0MC8Dz+KhH62u8A3x6knTwgh7ZqA45DW1u2044KYGUsifJgvNvDAzIuuC7KEhJnfrYNkJNcPkCaQbmYVqhMJITdRZzLvCo2M5dprHDnktnBjjvS9oz6GIAOAya5autQ8eg2I06zSEXdklH+jSRCCdHpz8k05ujgo1Uoj84Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhBrRoXSxSPmX3jliiXK9WUeRpBl/EtLSGFKchjY44M=;
 b=CXB2GkVFdJnUJs8lLO3ZjqrgyEh11A6dDKt0kkud2n1Cz+TodnvFGnlR2G0JL/YT48tMv2b7da/FYQaBLxOef9c78qUwwMKYiGn6Foi5A2+154ohTDpD34VqT7wtQSFFcdJoAWztmHE4Ynz+dRC6TRPVy4Un+qo8XMIYvM+JFUeFPfvXmSBFdz5PtSAulNLkohOrN2I8g38bZt6Vw21ubgxQ6mZbOY0Hc4pgECVbIx4/Qc4LPfkfemGwSyIMP7iPGFgZxFruFAFUk0i7DxmsAi10AHuY1oLmZDAvtHN71oPNEuJJyy/mXWNVFPtlD1qE2DrTToLW3EIkd3rtY78bWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de24866c-a18c-4951-8f74-a0b1004d36f5@suse.com>
Date: Fri, 24 Nov 2023 14:26:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] xen/asm-generic: introduce generic header
 altp2m.h
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
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <efb6b1864de36d9990a2d2a84308f4bdebebb66a.1700221559.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <efb6b1864de36d9990a2d2a84308f4bdebebb66a.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0233.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 15478f6c-6eb7-48c7-a331-08dbecf0eaba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VLYwT7eZduvzi75yYnyEp0AK5jcR4WdzBmHpHglfm2ZqLeqj9aQdDK2WGdbgsMaD54PfsNv050CEU85RMiY2FAtYEri4QucZdLe8PW464IwIAcsrvULty8O2zZNmhNQm+KDEsIUdhGmR6QrrDpVvHadfHMoPTkwi4OYJnHIOTngMrSTeK65jTPjRK0p8P+hdX6tr2u9XvOkzZDHpKAAARn+sf5ENbaBjvbRBnGj0J3yOeOQbn5pCR9VKHTHKk0bkDl8jcce2ZTanAieETn4ECl5y5UlsA9UvAQvrkpDm/khRtDs5tYyZC821Uk1NW1COWCphLMF6OdfkIYpEZkImB8iVeUSD2JI7i7pfUAuTspYUEPvcJCYNwXhwcMWQdk0Z0eQT0kP+NDle3K34ZLgiGhwd+lSnykzFQaE0omVuObJ2enIqr4g7vKoOUg1PkCOPy9ybqQn83tCQJJ5uf0AIHzCiaW4zzEPjFpyRWXWJDUsuFjZ9s2uTfFVO/TNVyYejYx8aTPgpnvBv4dRYgRrvQKYyYWXC2UVfVv3RV8XWs8QkKrBqBlNGeAw9f7LMD+pvlsI4hMkvtLKXmsamWAYFv662A/8Y21r0XGrif8kIhOGhuVCkR/qD0DwV28ZdiBHwuvd8BC0HB0ViwS9Rcr7WkF572oq/GfSM776YFbUeWYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(478600001)(6486002)(6512007)(31696002)(53546011)(6506007)(316002)(6916009)(66476007)(54906003)(66946007)(66556008)(8936002)(4326008)(8676002)(4744005)(2906002)(36756003)(41300700001)(38100700002)(31686004)(86362001)(2616005)(7416002)(26005)(5660300002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mnkyc3AzSGNLQkpmVDJKVkluMnl0U1BDUjFjYmo5OXRrdkw2NVh6S05ZZUJn?=
 =?utf-8?B?YU4vQU1Fd2FVMUNQd01SQ1cwZW56Z2NDMnhhdEtCTzlkVWFsTCt0YXhpL0lX?=
 =?utf-8?B?cUlCa0JRL1YzU01rSjdhQUhNWlZQeTdyYk1za2pScmZGMTEzc2c3eG5uZGpL?=
 =?utf-8?B?UFI0NkpwdWpnQVFQZVBiNGtkT1R4bmQ0MDRHRVFXN0FzSXp4cVNFQ0RKSU0v?=
 =?utf-8?B?eGI5QWs0ZHN0U0FBa0EyYmVjMzJxQS9mM1ZiZUZYSldCVm51NFpJdEpxbEQ1?=
 =?utf-8?B?bURRZXNMRWhUc2F1TjUvZlN4NFhZSkpqR3N5dmZScU1MREZxaVc3eHpkK3hY?=
 =?utf-8?B?dkFBSW0xb0JscWFwQ3BzYUJJTWxzcEJEM1pqQll2V3JHRjBRSEFUNlFOZDAz?=
 =?utf-8?B?UTRtQ3pnSGFsK0lWajNNdlZET2pENXF1eXJwaWpRL3BlemsvVkh5eXZwYzVI?=
 =?utf-8?B?dEo1UFIxU1NuUENzVXNvM3NrcnNtSTVtclpsOHZacWNrQ1duVThmZmVrbjk4?=
 =?utf-8?B?U1NoclM5Q2Jjd1QwT21qcFlvTDQ1M1RLYVV1RGpiblhrTVJWci9WLzVSWjFq?=
 =?utf-8?B?S3RGaUd3ZmNCaUhCZmJyaHB2enRkZVNDNDZFbkRQdU1ENnVKNm83SW1MWE5P?=
 =?utf-8?B?bmxrT2VpcnNZZlhhR1pLNDBBZGhQY3IzYVJmaFpaR3FiQTVDZ09JaUpscWpt?=
 =?utf-8?B?NW1TMzZOTjhnMHBzUy93dVhEc0FGV2JmcUVMZ0JqQzZTMFpkUlgraDVEQ2JZ?=
 =?utf-8?B?ZmlKb0lJUmZSNTBKMWdWUG1tYkVpbXhGRWRaYzE2K3pYb0JJTmRsVWlYSXpP?=
 =?utf-8?B?eGVpMU5IbU9kMVVkWU5vN2pzOTRScVJ5Y1RZV1FxYzErbklDcHRvd05yM2dK?=
 =?utf-8?B?dnlkYjBnSWRiYVVMQVF3OVVIRWdjeWhScjdURGh6YmdRNGJKd0xadmFXNmll?=
 =?utf-8?B?MXFUemZWMElEK2J2alR4T0NJSUdsaG55N1l4ZlJQRlNUenJ5ZlNpZW9OeWFT?=
 =?utf-8?B?YlpRMmxkMFEzVlFCMEluZVo3cmg2SjhRMGFMQVdMcmNwRE5SYmdkaWpkUU5j?=
 =?utf-8?B?SytocEoxS1J3SzJxVFp4dE1VNWdSd0grNjJFdkk4dGdQSmdNOGx4TndRV05X?=
 =?utf-8?B?UjMwNWJXODh1dy9jaUN0RmxvTlhSZzkvbDExTFo4ZzdWKzMwejZwSTFGTkxY?=
 =?utf-8?B?aHUvYnNFZTNmOHVuV1FjRmJDNUp0RnJPeThBVzc4YThTYTg3ZTl3dktxVVNE?=
 =?utf-8?B?cDY5RUFSWThOaDRsdnlMcWlaeFc5dGhwbzdWdmMzQ0dHZDZlRytSOURhQUtk?=
 =?utf-8?B?aXhmYUx6Qk9EVlE3cTcxWW5sbVpJM2pqZERna0Y0NUxKMSt6RUlMelZKQ2Zx?=
 =?utf-8?B?WnBHNmp3UGJKT3YxQXMrdFJDazRNOEhrbXlsMU9QcGwrK2R6MFpNZVR6QW42?=
 =?utf-8?B?a1NoMTdGTTVHQ0lpZ1RpQnkrem8zKzZiSTNOWGZoRTlxMitGb1IyN0tFRDFn?=
 =?utf-8?B?QVJnUEYyNnBjUkxDNGJ0bmZISW43NVEwb2dlczVaM0RxNWY5YmI5R0xvZE1X?=
 =?utf-8?B?SmVZWmdydkRteUxWOHl6blNRU0x6cTZWMFVZbkgvUXpRY0RZbWpibjlPVXA0?=
 =?utf-8?B?WmVDWHNUWEdOV2VvWkxpOWxpcy9nRjRnRTlOTjNFaW00SG0rdmRrcWhJQVgr?=
 =?utf-8?B?Q1BydU5nY2JrRVRwdWlFV2hBelROeCsrMitTWjQ5L3lSaGZsYTFISUR2Y0hp?=
 =?utf-8?B?R2tXMmJoN1g5b1lVU2RXU2NySjNjcm5pTVFnaDV0WnE0M2hobFpkOFFCSTNB?=
 =?utf-8?B?Q1dkeE1iTkl5djZlaUxKVjRqVG5nbGlsdkJHeDFmNVFWU1E1M20yVDQ5TW83?=
 =?utf-8?B?SVRPWHcvYno0ekx3UEpPSkJOSGR2MFZ4c3VocUQrZnFHVHBsTHJ4ZHdPb0Y4?=
 =?utf-8?B?dGZhMnZqamRWeGJ3KzhpRVZ5S1U2YVF3OXc4RFRlSGZGNzd0Vkh1MGJRYzRk?=
 =?utf-8?B?dVo2alJyOXFWOVZiL2xjeTdyazh5b2dsUm5SY09tSVYxbTk2UlBlYzVpSlNU?=
 =?utf-8?B?WFdrYUZYZGNqN0c3RFpUM21tTWJnRGJOS3F0VmJNZkFiOWpYQ2pueVVWdlZY?=
 =?utf-8?Q?zs08bRhFgNnVvTxhN5O6V2EfW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15478f6c-6eb7-48c7-a331-08dbecf0eaba
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 13:26:07.8527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GH3p9jLfqSJzo/TlQayItgifnP1EChqRGi1Hc2IQ3F8FxOCQDBi3o/xZyQ1bsJC/PlyQdX0MIu8e0LoCsfSi/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8375

On 17.11.2023 13:24, Oleksii Kurochko wrote:
> <asm/alt2pm.h> is common between archs so it is moved to
> asm-generic.

Here and elsewhere: The statement above can be read that the same applies
to all arch-s (in which case the header would better move to include/xen/).
Since this isn't true for x86, may I suggest to insert "several" or "some"?
Then (here)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

