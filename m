Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797DB7EBFE9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 11:01:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633540.988423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Chb-00016U-40; Wed, 15 Nov 2023 10:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633540.988423; Wed, 15 Nov 2023 10:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Chb-000140-1N; Wed, 15 Nov 2023 10:00:55 +0000
Received: by outflank-mailman (input) for mailman id 633540;
 Wed, 15 Nov 2023 10:00:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3ChZ-00013n-Nw
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 10:00:53 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dba74769-839d-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 11:00:51 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9047.eurprd04.prod.outlook.com (2603:10a6:20b:442::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Wed, 15 Nov
 2023 10:00:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Wed, 15 Nov 2023
 10:00:48 +0000
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
X-Inumbo-ID: dba74769-839d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWAnlJPR3aJ9haj7itTOYAoO177YpScZar39zQvm8Dees+TAhTktoSbCxwyR1las6LMe6X/L8SmAcrevKSeDm79cUiwOTvzCyGiU17PF5VPE8GAY19H7EwdJ5lKTANufJ97vS017CmW3Cg0f39IbPu96eh7KTk1Cil86cBcSgGWVdOKKYa7DPe+kewT+qXyCNKb16Ggxh7mqq9xh7fnzoO1epFZJqz+BSnLzi3GQic2oQkwYxodGIOz7/SNyJQllxdjg1aMuAvKaU3zw+7AE9tPcP2esEuc7bG+9Wih+nrdqJnETD/jXlO83NKhZrDXSECtw1EQV28xNE9D2FxZWhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGT+GEecgj0AIV2qRbHLdv9QkSKlQt3IVRSBHpSHc5k=;
 b=RB1YCZWSMNljsu7UmxrtRbT4YDQ1pPn7EdKS3cwpX+yXf0iMlPmWeD6UGF0xf5TLH/805MyKVYbDyvC4VbMrUHgOMbgLtlBgHIG4hpf8FLPtT09A/hDOevk9V2Ue80BrvkzPft9z1Kdo2u/+0GHCMX8KDoUTbGKiXg/DO4A/SSKPfpVz+XQuNHhvfQbuZxKUWrWxrCJB+Hrbmj/sHYlP1sFJnYPk1YJhAWDTQDQDIIhYhvhW2Iju8fBz2TQciiaf+/ufowRIKwYgFaOJzId5gZbvwHLt8EseTT13YQ6jPwYziwyq09PaVCJpvgg2BQbNysRN9Y+oea0fXQmkMdBL7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGT+GEecgj0AIV2qRbHLdv9QkSKlQt3IVRSBHpSHc5k=;
 b=y8lq0AvM+8WuNUFI+XD0rBummhqEJzMZN4S2JFrONT80T9E1aZ6nbGXEBHMh4u2oE5OtkSTvWSnZW8GkNQq3OGN7+WwTxPLM0VPN6pcJst/UVN3crJ1yETXRR1+A4Bl2qJEES91SqCbzpXnLtJbfZYIV0Q21LVmVg7FSR55ypVWdpprbLfinwa1QeETnmQlOrapS2TpJm4fUtbLXox/uKLZa9nXv5KSPdzRiut+uYoIPVrymPmHsH6YFzd5yjXacANMn8ILb6YZ+0dNfRaqzd6kMZwqNiNURx7GAqmCRkBlP15hAhV7TOm+4qw6EYBSBRwVfSJ2DU3jBF0AMLu1qCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ec74ba0-895f-4642-ae83-fc2617435303@suse.com>
Date: Wed, 15 Nov 2023 11:00:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] xen/asm-generic: introduce stub header monitor.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <9b40493df82b99904b2e4f6cf9dc8888db4a2a49.1699633310.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9b40493df82b99904b2e4f6cf9dc8888db4a2a49.1699633310.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: 48038a86-0ca3-445c-ca69-08dbe5c1bdf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ged4H9I5ieCBfZk5kwhWNMtWnSvbh0EGrKCP/6Sd4lvoy5L6AP6WEmTcv17dNuR8KIbKfRG0WnZhjp3dn34IHsZppZ4sXRAW7OQb26yS616dBWtR6cPEJKEhXQmkCuCOOPoU8weYJ40CQqmFf6arUxTFqhzT180yJxEQOYdmVD9UFpTdq3xFprdRdYXIOQlO2Tj56OFqiRcp/yjCOgkm+AKnsVd3dWCWiJpt52rI+EFiXBAyRoYbk9EsRGVrbsfGz5zSQZjlP/GiCOhD/eeCDkl8mhW6OvQzLKMkXjGgIXQOnP3guBec/yCqT+gYVLtKCzQNVFxcz3ecYSpVa6KJt2k8IWuFbgFm2ctFkVQO7GSrRVGWWqqu3lU/fuAgXGT5hq/MZeknEJYAbsPTDOAfus4MNGnGRR1mHJiO5/gntqgYjVy/d47xgm4F+7EcfG8Z7PSoJ/uq7qnJxAqL//HzFmXSGVLJ7KZ98rwV2biSo5Ea4Fpm8ud+WSkq//kQWf3rQbsMuXw7rzDLjmRGT89IgQOtne8oeNl0tnTFSl6ryfP+seHGhiGocJbMVM3u8EsI3jSA6xQ5daLjVs+AHb27oNlZzUvzV7JUR4/e1YGLxO5nRTt0T/uv52wCnu1Wtru5EqvlV6BMy/TJZXqHFdG/6RJSrxjL4mZHwApVJs1OyLo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(31686004)(26005)(6916009)(66476007)(66556008)(54906003)(66946007)(38100700002)(86362001)(31696002)(6512007)(2616005)(36756003)(6506007)(53546011)(2906002)(478600001)(316002)(6486002)(5660300002)(41300700001)(4326008)(8936002)(8676002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkd6NlBady9YK3JwUmV2eXJTeHd3MTM5QUpyY0ZpeWRiS3YzK3dhOHEvMmFR?=
 =?utf-8?B?OUpJOUJ1d1I5VEdaandjazVLSWpMRXd3QisvcUtnWHZUcjA2aG4zR1REVnNP?=
 =?utf-8?B?M1BCeEs5SjM4VitWZ3pNLzlsV2dZdGxBU0JsZmdFR25qNjZqOTFvOGRJci9w?=
 =?utf-8?B?bTIyaGJRRlYxWkNRNlBCajhZc25GN0k2WVFDVFZwRUplS1J1ek5lSGtWS1Fl?=
 =?utf-8?B?QmZQWFluOUxPc21aTEdZVW4zdE1RMFhtcUU2K1lZeVZSbC9odXh0eHFhcGM4?=
 =?utf-8?B?YkNheENHcGp6aG1oOVZaaVpyRzBLZGFXVXNYUjMzdWUvR0ovMXgzM0JlVFdm?=
 =?utf-8?B?dVZjNmhlU2hPZ1FUcDBueHQ4UHkyYzZoRWZJY3FLTFp3ZFRMNXNwVEwvejk3?=
 =?utf-8?B?RGNyanZtaXE0WDlvK2lVdDQyRUM1VDFKYXhyMXpOeEN2OGM0NnBVQVlsRkd4?=
 =?utf-8?B?NjFKSmIvc2dHR1hHR1hrckFtMldoeXI1bTRHWTh3SnVmN0RoMzR4eWEybHFz?=
 =?utf-8?B?SjNXQjR6ZmhlM2dtaWVZOVlNTkgvbGdWc0tUSWhGemFpWW5DaXFpNXdTYjNL?=
 =?utf-8?B?VDlydjFXa0p2NzZKZE9IVXlmTnp2ckJkTHJyM3ZGK3V2UEsrd200OHc1YXZE?=
 =?utf-8?B?bzZtUmp6TEpEeENUVjZTb2hMWFFrTWpDbnJoeHQvSGNFeFpISThjVUpYQ3Jx?=
 =?utf-8?B?TkZHWXZRZlhhOStLVUlZczJMZ1U5N24yeURycjR1anpkd3dlc1NBR056WUlO?=
 =?utf-8?B?K3NIdDM1blJ3Tk5wMkNJR2diTEVVTEN5cmcyOUFMRDBzbnZnQzRQT0doYkFF?=
 =?utf-8?B?Qml2WUhXNDd2VFJBR3VOeHFXei85SWJwaE0wZXhWcUF5a0lEWk10R2l3Q25l?=
 =?utf-8?B?TFMzMFVmMFhuYk13UXVaa0lZazgzMXFqZDk4UkFDd0t1c0ZWWDVGdjVVbUxx?=
 =?utf-8?B?RVAxbGlKZ0pUYXBmbUNlRWpFTG94S2hoa0ZCWFlUeDl5b2JCSVFaRmRCVVVi?=
 =?utf-8?B?M0QyeG1vSGZaWTArek9veHJDdkZzUHdLaE9kK0NKbGJEQjM2L09LMjM3bUVs?=
 =?utf-8?B?Ylh3RkVEcWVCRzJCbzFoQ3kwNjMxMExuN3h3NXJtejlPL1VBRjVBeHB5SjVE?=
 =?utf-8?B?TWk2REJraGpBUm1ubDZqbTZwdXplNkQ4UkpKc2tuN0tsdXRUS3FGakRUaml3?=
 =?utf-8?B?cFNkWHJyMGFqcTdLUzFLR2VWcGl3bHczTVBzcjAzNDREaUQwckVqMFV3dlVS?=
 =?utf-8?B?emJwVmJWUEYyWGxXMHpJRXhnS2ZHa3BpdUZPR2JoUVIwT0hIWktrVStMeVlu?=
 =?utf-8?B?amJLL29CYUZ1dnVYRnhBMFZZajUyUmhtd09XN3FjRXkrelEweFhwWUhacEd4?=
 =?utf-8?B?YkNLSjFwOERqTW52bFowL05FdUwzaTV0Ym11cUJrMVF5ZE5VdDFZVUU2VUY3?=
 =?utf-8?B?bStqaTk1aW9oUmNMYSt3TDhnK3pXTjY4NVloMUhVWGlrYiswUmdYYlc1K0tE?=
 =?utf-8?B?dXRpZ0pHZHdvMDc4ZmZONkxYVXJEcjFiM0d5V2JlK20xRVRwcEdORnZaNEdL?=
 =?utf-8?B?OGYzUnFkQnlVdksrT3FIN3RiODZqODdPRzlEZnMvamh3ZytOc29vTUF5RGdj?=
 =?utf-8?B?MTVqTlNuclovTk9DSkg5NWgvVVdSaHRJdm1xb0ZTMmN2RlVjMFNRbG9LSVFz?=
 =?utf-8?B?QjNtbFd0a0NpcjNOTzRpRVBCME9NNnVDNEIvQU8rS0VGMlp2U3FMaGd0T2dQ?=
 =?utf-8?B?Y1RIVkx5S2tJb1VCVjFyRXFNdHFKczhaOGovalI5RHlGS2JsYzZwNHgwaFBu?=
 =?utf-8?B?djBnT2hzSENNa21UNVdweG5tODlKZitBeGFDazRpeGgxb1cyNW5DaTNxMHpK?=
 =?utf-8?B?NkF5VGExeHpxRXJpRkFuTjBSS2I0OXpBbzZ0WjUrWVBzcUFabnhYM0picjZy?=
 =?utf-8?B?TXhJbDN3Z3FKZXRxak00QkJrUlVhQzQ2MHhNYWRqNTJXY0lyZkd4NDlIZ0Fr?=
 =?utf-8?B?bUFMdXZVRXpFNXpBWWxMaVVzV0lKTFV1ZHFBb0FZcmFjemczamRBeEJyQnlW?=
 =?utf-8?B?NjlOVjBKU2RhQkM3TGhtM3I2SktyelpUaUE2ejNWNEtKY2ZQSXVRZ2RKZzVG?=
 =?utf-8?Q?RmWDyVgDU5WxFA0sutoxS9Eot?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48038a86-0ca3-445c-ca69-08dbe5c1bdf9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 10:00:48.3085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HuhjVLbm1tI1X5tj2KUlXFDqnmZfhqC5ffH8/tOLv+eA049QZ1yizXVyfMSyNPpjfiYgUc6C15zy9JR8mO1HgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9047

On 10.11.2023 17:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/monitor.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * include/asm-GENERIC/monitor.h
> + *
> + * Arch-specific monitor_op domctl handler.
> + *
> + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> + * Copyright (c) 2016, Bitdefender S.R.L.
> + *
> + */
> +
> +#ifndef __ASM_GENERIC_MONITOR_H__
> +#define __ASM_GENERIC_MONITOR_H__
> +
> +#include <xen/sched.h>

What is this needed for? I expect ...

> +struct xen_domctl_monitor_op;
> +
> +static inline
> +void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)

... struct domain, but since you never de-reference any such pointer, forward-
declaring that (just like struct xen_domctl_monitor_op) would do here. Which
would leave you with needing at most xen/types.h, but maybe as little as
xen/stdbool.h and xen/stdint.h.

Jan

> +{
> +}
> +
> +static inline
> +int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
> +{
> +    /* No arch-specific monitor ops on GENERIC. */
> +    return -EOPNOTSUPP;
> +}
> +
> +int arch_monitor_domctl_event(struct domain *d,
> +                              struct xen_domctl_monitor_op *mop);
> +
> +static inline
> +int arch_monitor_init_domain(struct domain *d)
> +{
> +    /* No arch-specific domain initialization on GENERIC. */
> +    return 0;
> +}
> +
> +static inline
> +void arch_monitor_cleanup_domain(struct domain *d)
> +{
> +    /* No arch-specific domain cleanup on GENERIC. */
> +}
> +
> +static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +#endif /* __ASM_GENERIC_MONITOR_H__ */
> +
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: BSD
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */


