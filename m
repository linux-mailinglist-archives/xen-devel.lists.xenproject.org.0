Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC38F7F11E1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 12:23:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636620.992208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52MZ-0007m5-JF; Mon, 20 Nov 2023 11:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636620.992208; Mon, 20 Nov 2023 11:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52MZ-0007jx-GE; Mon, 20 Nov 2023 11:22:47 +0000
Received: by outflank-mailman (input) for mailman id 636620;
 Mon, 20 Nov 2023 11:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r52MY-0007jr-Gy
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 11:22:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7d00::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fe5deca-8797-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 12:22:44 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB10009.eurprd04.prod.outlook.com (2603:10a6:10:4ec::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 11:22:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 11:22:41 +0000
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
X-Inumbo-ID: 1fe5deca-8797-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVSreEeAxilDC67dIN0DjCvI2QDDdsHaaGq7JX6HjuX37Y0joznEAVNCEuvmEQxxX6zXbh7+fWVe7a3Iue6UmApmBWtkengdfNEakqNpwrDQdzGXjxHVISZZrGAUwLdARnrCrGESvcYTwZiwA3Gy2YHmGXXAoR4na5whjngTzmUybXxLTlGJcDCAwcSfqzULNMEZoJiEi6SdavWJF3RUtg41RyGFB1123+kCd2tq4bXc3wBsiwsvoS3eozulz+8PPvPobIuiERCcjcsFmLUSvl8H9aXE7DKVLH5L9WdvTZblL1Jp1KN4xbtZuhpFsEOLgMmnKY1lkadYf5nxCdrysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52sV2VQ79iKPM9A+JcHwbMdcMtv3fjDnzRzXAz1uo+w=;
 b=RHE/4mS0BU+6/VmIjuQBuqiMvAIBbJZlfYPfMGg3m0XZvKR23CoTUS8GP/NzzZbgpQDZpEOrpaGHsBm0CaTGzfTimIsg7/gRu+JVPOek89DqgrqEuPTx+01crrk2QW06fozV0yvCfvqT/dD7vmq5P7dxWtzyI4KRoCGYfC5eLAHOo+9Ledbw1f2XAaVrPS/kUYPo57QkZ8zjX8DZpeLUB4SYNLxjesy4a/MMSS1qPO3YNmynknsoLOrH8X40ho/yu6urWqzKxIivpV/fdKCFLts8R/m2hQF0Z3/BcJut9jc/IVZaPXZzGjBF2DylBf9ZiIRp5OCPUrgic5GVjjKixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52sV2VQ79iKPM9A+JcHwbMdcMtv3fjDnzRzXAz1uo+w=;
 b=lzvTsV6bWrEjlWxzoSAS8whrcS3s/MlC0v07/Z2K6cKoRcBY4hWOD9fXfSa2BeLssUOKqetD2Tb0AmNlSijT1Z3DiWekQDglMe4IODrEkQzSK4TH+uKaHzluglITb4T37IQ5ZznuIekJrOtmq7aea8cSqRLyIR4Km1TilR6RJe0ncdPtqSLLUYXyJjCC0GppxLlUEtU/3lVrIlYJiFifMjuwzaDGafgxSmR1Q9Z+CYh5nZbv/MjL8WEcA2b17N8h0AiPOhw68+aj/0bwnrWesfH8gviH7wMRj/sLmxvKoMcBDfjLi6XYhmlKJkY4P4sc7jMhpmoECIbY9MNf3zp6Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <667125f7-f62d-4ff6-be89-f117f212d261@suse.com>
Date: Mon, 20 Nov 2023 12:22:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | cfb77779
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <655b3e044c94f_2c9ffc41124dc@gitlab-sidekiq-catchall-v2-7d448ff795-5mlg7.mail>
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
In-Reply-To: <655b3e044c94f_2c9ffc41124dc@gitlab-sidekiq-catchall-v2-7d448ff795-5mlg7.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0380.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c31935b-663a-440a-bcdc-08dbe9bb028a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7d5xJvXZDXYNSKwDnJ38jKbO9+825d1hOtIhUI2a24rMxXkUvzvcFaMkX4YYtyxijYOC8RAlPeNxPE7BZOpyzao+4yZH3NuxiZ7Kz3hjUQKEJ0kJpcY/Ow3VZk+edMZ5phPedJyHU+WQB2tL/3SAxywCpTgWqsuyOhAsqulIFaPaMLAg8yyvFRI2whVezjVAFMsJZeIj6dvVU3kUGGQg5WWmpsTQ7FTVn1QrzudWoqWc+5+Cu/5S4y4VFcl5103YyfwQEbu+XmIVgmYv4ZFGgY0ctg+bKSzktX/Ay5pyg+RTqJOXhUmRkXxe/cPRmdlmKrORlD5P/7wmj/AoO5bDst1ABjQfwIqnG4vDUh9R7bjhIe5eQ+Q2B2Iuqs02y9NjUL1ILVtGlJLuP0QOS+Bt2SOGeFuoabtQRr/GBo5We1LhnspCxIk3jFv1ZvXy/8niDVJb8FhnDQGkNhhN2I42mEqKmf4Ga8wYV4g7I0H8LQawed4E3TTorFsskLRWYVVpBEiPzJrRYDlpnUViB4t2mEvZJQRcGv50ydqKtxUoeNWFO/vIpbjY5QCBfcNEEe4ad7AcHRm/3OQ1ShGz35We52I75cirFaMTt/S+ZU3jup9Q7BbIYQSxh9DERUx/ms3sETcFrI0dqX97Nm0Mb5ywCMUrtLMi2RlB23DBlxi023FhhMiR8I8u7Add7xJk5i82
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(5660300002)(66476007)(66556008)(6916009)(8936002)(66946007)(8676002)(316002)(83380400001)(26005)(53546011)(6506007)(478600001)(6486002)(2616005)(966005)(6512007)(41300700001)(2906002)(36756003)(38100700002)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1JXUHJpK2tIMDhkZ21NUjA5ekZlOXZHRC9CVWRDbjBlOGtPYVhzL2Vsdk9C?=
 =?utf-8?B?NUVSZ2xJK25FNk0wWUdsSHloM2p0dGw3OVRveXFmQkJyNEE4bUtTdGhFazN2?=
 =?utf-8?B?OGFsN0YxMm5Leno3RmpndlhZZlBweUFxNU5IUUROVjlnUEdyN3UrZHcybXZu?=
 =?utf-8?B?NWRhSzlkZmtZdUR6QjI5VzVyRGlDZWw5VmxuKzFERHJuUFd2Z3VHUFBoOXRL?=
 =?utf-8?B?WkhaZDhGc0pjTG9iUk5NcXhvMDJvditjZUdveVVXMnhmRnNMUnkzcy9YdkpP?=
 =?utf-8?B?OVI1QzZCMHFFWXhuRXBZYWJQRzVKMW9WbHZ4aUk4VEtlR01lL2ZuQnlBQjI1?=
 =?utf-8?B?VW0xQy9IQUU3VXNidEpCNG5oSzFrY2p3cFFBcXFJakZXbnlncVV1eldGaHlR?=
 =?utf-8?B?ak5yUkkzam0xcUUvM2theVV6eTBWYlRsczNvdnRSRDhBWHRzTVdCV1E0TnV3?=
 =?utf-8?B?VTlDVVhrRkZjR09BSXVkSTlnbjMvbzc0Wk5GNEtRU2RPUHY3NnZYOW1uVDlI?=
 =?utf-8?B?ZTZWY1lrTWh2TmJqTWNlK2NHak5BVUMxN3BrdW84SkJDeXpDQWU4V2VIcVUx?=
 =?utf-8?B?QzQrNDJYL2wxRjBUbTI3YmNKWmEwRDBjZkNTVlJJVXJrUW1zMytmUVlsWk9t?=
 =?utf-8?B?WGJVcjJESDJVanJ3UGVsRnVNc3drRUNhM04rS21QRU9YOVVWS2RmZjdkZnlZ?=
 =?utf-8?B?U042REtwenY0T1ZSck5GSFM1Sm9vZzliNitKUlRReVdQdDUzSWhKY2VPcEEr?=
 =?utf-8?B?UUhRRHRUUmFsSlZpdUdEb00wYlpGSk9JWTJtMDU5Q1hlS1Y0OWxuZmhmU2Zl?=
 =?utf-8?B?K2NnYURiWWNwOFNxa09UOUJQdDhLdExza1JKa3VGVXY0dERjNFV1M2k4c1Ja?=
 =?utf-8?B?cElab2YvNEZrL2RmZldnYUtIdTI0SXMzZm1CNXFkZjNTc2ZraXczc0o4VEZs?=
 =?utf-8?B?NEdyY3NscTF6aHdQQ0taejlZODNEaXRwT0xWbGd4WGhqWUNEZTJCdmJPendw?=
 =?utf-8?B?OE9yYWxZMlRlaUdteGw5MzJ5eHhlMCs3MVkrWEV2Nk5GbGNQNjQ2aHpjZDdM?=
 =?utf-8?B?bkN0ZkVrMnl4RExTZFZrT0VVZnBDNGZxcVBLUXhDUk85eVZ5U2ZWZGM3dEJW?=
 =?utf-8?B?cnVtWlBUckJQRDR6NmFqVTl0Qm9JZ2hMbCs1SG05b3ZpSkhNZUYvRWh1QXoz?=
 =?utf-8?B?TE1Uekx2eGpvL0dTb1BpSFlFRHc5QzQ2eEpMREFqVm9wcHNRWklBYVRQTUha?=
 =?utf-8?B?dzJrYlUxS3o2NGd4OG8xOWttcFN5QmFVaHVoWk1UYzhETTcrenh3ODhuZDRE?=
 =?utf-8?B?LzFJQkVqMTVnamZtZ1d2U3c5dEpyaVFqS1lwQVR2L3BmTlV2WXVzQVFwMk1u?=
 =?utf-8?B?UEZISUI0QnFsUnRiRG5kR0oySUN5VFpnVlU1d1dIb2RkbTFxdkNULzUxNWpD?=
 =?utf-8?B?WDNTZVJiTmNSOWN6UG9IaHV1UXlqVWhsMXEyK3E5TWFPOXh3T2hCVUJvNEk3?=
 =?utf-8?B?OUE4RGdkMklzaTVvMnJ4SDkyQVlXTVEzRkdJelZLbGtFcFl4bk1maFBoenJy?=
 =?utf-8?B?dzQ4d3V1QVVWL0xCSmhqTDB6ZFYwelZLNTZBaDhtL3k2Y2JtOU04V1BHWjkw?=
 =?utf-8?B?dW85bERBeTU3eTRuYVdVei9pZ0VqMXFGL1A4d2pQOWcxeGs1ZWc2WlcrZndJ?=
 =?utf-8?B?dTc3SkJ1ZE9hMWE0T0U4T05SNHNJeko3VWJlYm5DMGJ6eEtIdlFoZEZUcU1H?=
 =?utf-8?B?ZHJoNnpUOWhJSnFOT2I2cjdhL2kvMUpoZURGU0o0cUtBRVJUNThHZ3FTYnJj?=
 =?utf-8?B?STljNC9Jb3RSbGd0eU9UWktZMWJ1NjBrZmZMbk9YbHUwWTJBMzdXVFJKcHdh?=
 =?utf-8?B?Q25KeG5PZFFlZDZZRC8zNThiNlRSK0dhM2FtYmk4a3ZWVWVRejl0dHptZXho?=
 =?utf-8?B?SXJLUjFXbWhuSDdxUWNnZkJ5TnNsdVorRlkvOU9Pem1Ub3NlNkVkQnYxRFJW?=
 =?utf-8?B?dDR3b042NnZscU1oZ0NUZ0RUSjd1dEtsNklSTXF2bzF6T2tZc1ZaRUV2Qk5S?=
 =?utf-8?B?QWNMcmxsbnBNbVJ3ZEZEK1pHRGg3NkxqaTV6NWZTMjJzVXhpWVlwSGRZaWlr?=
 =?utf-8?Q?16u6bRWAvlEuarMWjl+3jjDfq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c31935b-663a-440a-bcdc-08dbe9bb028a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 11:22:41.4925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ka01zhClYU8ssl7vyYA3CZK6zo0A+psrxhBbK5DCDXJ8+F6gAZBoA8g2LH+BO+qyh1KCA36qIiKqWtRH/l9ZWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10009

On 20.11.2023 12:07, GitLab wrote:
> 
> 
> Pipeline #1078515214 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
> 
> Commit: cfb77779 ( https://gitlab.com/xen-project/xen/-/commit/cfb777791d39e025cf625ba1fa080597d4defef6 )
> Commit Message: amd/iommu: fully initialize array in 'flush_com...
> Commit Author: Nicola Vetrini
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1078515214 ( https://gitlab.com/xen-project/xen/-/pipelines/1078515214 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 17 failed jobs.
> 
> Job #5574364088 ( https://gitlab.com/xen-project/xen/-/jobs/5574364088/raw )
> 
> Stage: test
> Name: qemu-xtf-dom0less-arm64-gcc-hyp-xen-version
> Job #5574364058 ( https://gitlab.com/xen-project/xen/-/jobs/5574364058/raw )
> 
> Stage: test
> Name: qemu-smoke-dom0less-arm64-gcc-staticmem
> Job #5574364125 ( https://gitlab.com/xen-project/xen/-/jobs/5574364125/raw )
> 
> Stage: test
> Name: qemu-smoke-dom0less-arm32-gcc-without-dom0
> Job #5574363677 ( https://gitlab.com/xen-project/xen/-/jobs/5574363677/raw )
> 
> Stage: analyze
> Name: eclair-ARM64
> Job #5574364078 ( https://gitlab.com/xen-project/xen/-/jobs/5574364078/raw )
> 
> Stage: test
> Name: qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem
> Job #5574364106 ( https://gitlab.com/xen-project/xen/-/jobs/5574364106/raw )
> 
> Stage: test
> Name: qemu-smoke-dom0less-arm32-gcc-staticmem
> Job #5574363795 ( https://gitlab.com/xen-project/xen/-/jobs/5574363795/raw )
> 
> Stage: build
> Name: debian-bookworm-gcc-arm64-randconfig
> Job #5574363827 ( https://gitlab.com/xen-project/xen/-/jobs/5574363827/raw )
> 
> Stage: build
> Name: alpine-3.18-gcc-arm64-boot-cpupools
> Job #5574364044 ( https://gitlab.com/xen-project/xen/-/jobs/5574364044/raw )
> 
> Stage: test
> Name: qemu-smoke-dom0-arm64-gcc-debug
> Job #5574364073 ( https://gitlab.com/xen-project/xen/-/jobs/5574364073/raw )
> 
> Stage: test
> Name: qemu-smoke-dom0less-arm64-gcc-debug-staticheap
> Job #5574364075 ( https://gitlab.com/xen-project/xen/-/jobs/5574364075/raw )
> 
> Stage: test
> Name: qemu-smoke-dom0less-arm64-gcc-static-shared-mem
> Job #5574364054 ( https://gitlab.com/xen-project/xen/-/jobs/5574364054/raw )
> 
> Stage: test
> Name: qemu-smoke-dom0less-arm64-gcc-debug
> Job #5574364130 ( https://gitlab.com/xen-project/xen/-/jobs/5574364130/raw )
> 
> Stage: test
> Name: qemu-smoke-dom0less-arm32-gcc-debug-without-dom0
> Job #5574364120 ( https://gitlab.com/xen-project/xen/-/jobs/5574364120/raw )
> 
> Stage: test
> Name: qemu-smoke-dom0less-arm32-gcc-debug-gzip
> Job #5574363788 ( https://gitlab.com/xen-project/xen/-/jobs/5574363788/raw )
> 
> Stage: build
> Name: debian-bookworm-gcc-arm64

Randomly picking this one:

fatal: unable to access 'https://gitlab.com/xen-project/xen.git/': Could not resolve host: gitlab.com

Jan

> Job #5574363779 ( https://gitlab.com/xen-project/xen/-/jobs/5574363779/raw )
> 
> Stage: build
> Name: debian-bookworm-gcc-arm32-debug-staticmem
> Job #5574363865 ( https://gitlab.com/xen-project/xen/-/jobs/5574363865/raw )
> 
> Stage: build
> Name: debian-bookworm-gcc-arm64-cppcheck
> 


