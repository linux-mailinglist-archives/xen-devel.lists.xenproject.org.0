Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FE07F2831
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 09:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637583.993509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5MZ5-00005s-Mw; Tue, 21 Nov 2023 08:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637583.993509; Tue, 21 Nov 2023 08:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5MZ5-0008Vg-Jp; Tue, 21 Nov 2023 08:57:03 +0000
Received: by outflank-mailman (input) for mailman id 637583;
 Tue, 21 Nov 2023 08:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5MZ4-0008Tq-4y
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 08:57:02 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed41268b-884b-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 09:56:58 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8666.eurprd04.prod.outlook.com (2603:10a6:20b:43d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 08:56:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 08:56:56 +0000
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
X-Inumbo-ID: ed41268b-884b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAAT85VsDpZ+9aQPvmhzP32aASVbDrelogK8ovG0UPDgYSk8fw8UGqGpsr7K1aC9bSRKvUbfGNG7l8KtqsvipQ+EXOVVUzfTEltrHuuJmf1VY3LbXnlOEH3fMBb9P/2KOMPumiK26D8g+6p8t5/VgkSBMOYJPDj5duP9Gq7nrkGr5ZXFGsDTSj0xRQG8Tj34lOV2ZSww5sFH5DNHnLKcKiV65q52j2fVNnNKpryBUgioavr1mqH9hcjZyV84vlNzwZpwZVvvOeKlNyHIEUPqbaWl52bjjhob12dO6rBVTMBYvzIzi3UizYtV1o9IV+JqjZhzgaDneUWPnrrVs0ijcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnlC8UA23/ciCSqNa6QeI7CuWezKAUNAbchrvMk+qnA=;
 b=hDCazU/9NoYMkxxLmCJc9NCIrLR4UgzeZFyvzCxBgQusQt5a/lG82N4nzBXcAKYeHj59NhemShgzOsQhfMPmxHPlSgBXbxUgBXRx4Od4dDRN/Np67qBq2GIqvSQQc0UAtrEhHt3pEue3TzN3AzCgzrOV6vSmISKlVwDuR7VulcLKkvN1dyVs8xZCleqGFxDvuiKlkBUasTXHdjSLXtph/8JVSl2mjaEkFzfHJaNi0YSlf2t+ZnUkqQ9LCeHaiZpzwq5fRP4l64bRlF7TRq6sCIA3m4GFtBQSKjqtlnEF3ef9zJ6++PmIIX+iUo6nRAg2KqOFRgnNFV7wzezoV/amNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnlC8UA23/ciCSqNa6QeI7CuWezKAUNAbchrvMk+qnA=;
 b=XL4o18IxgUO44QCWfCpTKIO5DDAIOsNyxNHr7Yh24hUp3xd2do6yq5Y49pGPji/OCSkpF9daNGgT9cpa1tlAJyaaoQBg1HR1KzXfX/v17Q1eIu2DAev3ws3/ZdSJRgHeHJMYD+tFEDl+F6baZ0uJ3jWI3ztMS5dI0TCgugmaUV06yyBKMkehewsY3UlPY7OQA5b+iZg55Yt0tnI0WGzzGcmzEzVnZpntXJJxaOC+E60hkDz484nYvDaW50CpSFRIOSy14zfB72gbNvrUnn97cp2lMeA45LP1y9CRmeYz0CK3IEUMQUaJLlQ+0gubyZT/t1la2icJyFrcLG9J+uGL8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <28128f10-1381-462f-9eeb-7c43aec6abb9@suse.com>
Date: Tue, 21 Nov 2023 09:56:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/entry: Use 32bit XOR in handle_ist_exception
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120195742.1343677-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20231120195742.1343677-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8666:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f66a69-b1d6-4f6b-2078-08dbea6fd09a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EsyCdG6avpps2q9vE5BLw+m1qhYxFQIHTR/jGns8PLLf7HcY6nplOhBlN4DG0+wBk4ogaHLuEnWwih/F/0uqwtEYUB6p30jXtZJt70AYAIyukTp+ocJk+jLHqrgMv21JnqWignqYOlHvC5lAUVR3Cw8u30y4jGAzAHgxkQp3C3R1GG3swRrg9Jj00KfHWuRUu+w/o02w9/7IuQU43d7m0D1HIaFqry/4e5odVebNelXH55eXsLVpXEn6gle+HIneRJxyEaUOr5JmDz5aqJSZnouyfHnpd81x3lAaS5v2vfu6R29EyGekaA6+f0dSproqusOrALB7hMSDKjJZUETzPRwOpsbahLhZAQ7UJufEjMH69hvJ3mGb3XORrTWreEIlpZ3DX14UQ/HC03ReuOk9jY1ezP8B6XQJjLIRMOokHN/w7lA3SCVEobmDgY64YwakH2AIoomGifN34onmVpBueR5nEb2pg9jDZYbR1aoZgO0gow/v2XwcfAKYSQW5wvpldLMv+nkFQyO+ML52Yy4273RziIoQBQf1rKY1q0/oN4JBEkjDjXF37LNij1SR6td65V0YO8fbfhd2iDUmYmGR/Wxp25RTklMyBBf9CzcNbAgXoZdLnW8Nt44TZD35WRYLZL8WWaEkXSTy3sFe5A2ZKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(136003)(396003)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(36756003)(86362001)(5660300002)(31696002)(2906002)(2616005)(6512007)(6506007)(53546011)(6486002)(83380400001)(478600001)(26005)(38100700002)(66476007)(66556008)(31686004)(66946007)(6916009)(316002)(54906003)(4326008)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmV4M1pFZ0ZxbGptbnU4M1NzT3czSm51YmVxYXA0RmVpOVpnWk55WDBvYUJk?=
 =?utf-8?B?allrUHpVOXo5a2tIaHZWK1lxdEI0eEIxV0M4aFUxektEaDNyTmxjNmdOVnUy?=
 =?utf-8?B?QW9SanJFMkVNU3pYL21pZ3RiU0lzdkhpVEppc2t6WFlGTHlXcHRjenlBVHd2?=
 =?utf-8?B?dGxjU2JQNjBtZ2YvMU9ONW5vWGpjcHNOOUtiSHFVbjh3YzBCeHA0UVY0OS9Q?=
 =?utf-8?B?R0RwcTEwcEpHb3pEYnIyamdHcHRPSFlTN1MwRlFTbzMrOStkZDBlYjAwQmlI?=
 =?utf-8?B?YUlkYzRJSFVNZnk3V2lnWGlrMUtZSzRwcmtRb3g2Z0d4eklKb3BiOFY0VjRL?=
 =?utf-8?B?dGJ3WVBIamYwZ0E5SmdsNjdndFB3TEIzelpDUlQ5SWFqVDFXOTlDUzU2cFF0?=
 =?utf-8?B?Tkl4NnhWd0NoeHhtbm9XOWI0ZSt2RDZmUWpPM2drRko1TVhtdktsd1VTQ2N5?=
 =?utf-8?B?REF5ZXRZbVhPTVNCTENRL3hwaUNvK1BVRGRDTWovcmlJaUx4USttSEplQita?=
 =?utf-8?B?QnVwemhxQmRJMGNZOUZ5VmpEZ2VRcmp6ck1hVENlZlluNXhLOTF0YUlqYVUv?=
 =?utf-8?B?YlF1VkU0cFVuYmRqL2gxS2pDakJlakZYWldTMUp4K3RNZFZWN0tMcWYzbXpM?=
 =?utf-8?B?Tm9VUHZkcXR1bnZDS25SMElSd1RucWZUMGJ3V2RGdU9YMjg0dVh3M0pVS0Mx?=
 =?utf-8?B?Ym5VbjU1SklNdHZXejN1b1NRVDk0aTB0TDh1WFJvSS91Tk5oMWdKeFBYNHZH?=
 =?utf-8?B?aDRmK2d6dUV3SUJGS3AvL2ZUcUY2N2JGVWNlWWNEdVZoM2FIRVNNZml6bkZY?=
 =?utf-8?B?cTUxL0hESStZTmt0RWZ4UmFBZTgwN05nVXZueGY1UTIzMUZSR1BhMXNBcmFO?=
 =?utf-8?B?ZEZHb0xXYlpveUFYN2o0YVpQS3Y3c25QRVlJRmZhQVlTaURJMmhwKzZuam9D?=
 =?utf-8?B?RjBYZGJGVmJtT0dKUGNYWXFiNGFWc0phRzR5SjZtdXRGejdSbExBRGR5Sk1h?=
 =?utf-8?B?a2Rka3Y3V3R5b2ZlcmFTWFdZSk43OXZlSjJGanFCVXREU0hlUGtkWkI5Vnl4?=
 =?utf-8?B?ektYemZxcGRvWTRNTkJhNmJMaVFFVGtmWnhmMDFvYVhlNWlXbzNUL0d5YkVv?=
 =?utf-8?B?MExiY3dQVi9SRWtKWFdNbzZvaFJ6Y2h0cXVqR3BTUU9GeC8xTTR2V0p3MU5z?=
 =?utf-8?B?ZlZPc2FlOG5tSWtsRm5SK3gydWJZTitEM1dlOVdXRENVVWU1dXhlQW1qR3ho?=
 =?utf-8?B?c1d1VWtUMUw5N0VpNXoxUmx0bCtTU1dhQUtoeTl6Y0MvNTY5N0xMZFZFQXlJ?=
 =?utf-8?B?a291T3RyU3dYS1M1RTNWSndSSXdkdVV1cTdBTSttVDNBLzZ6MXUwQVU5ZmJx?=
 =?utf-8?B?MzF3eUJNZTRRNzBHMjNtVGRSay9mZkQxUHdDY1kxei9UUGorR2lqNmszRUE1?=
 =?utf-8?B?aXo3djNab2VJYTE4amNTSGdvL2Q5NldnYnIydzBGdmM1c21UdytKZ21zbzl5?=
 =?utf-8?B?eERTdnJFa3hUY2VqZ3FlMkY4RGdERU8xcEJzcGhQMnlwRjhJMmxUME9VRGNr?=
 =?utf-8?B?K0FBdmZRRmtGRmUwYlY5eXRjdzZkNVpVNy9GeWFwWFA3NWswMXVuL3hIOU5T?=
 =?utf-8?B?aVc1akVURDI2cm8vNGl1TEVrNEFPeDBZTGF3MjJvM3puN0tNUnJoa1lBVTQ3?=
 =?utf-8?B?cDkzOFJteE1uN3pNSUc0TVVVRm1vVHdnSEVDaE1jTkVSODBmNG5oUDgzQU1a?=
 =?utf-8?B?ejA5QW5SeHk5dkllNFBxdUUrbytqUTJia2QrbEtjZFNyR05VTFZCbThOaXNY?=
 =?utf-8?B?ejdDU2hyb2VWbTRycVRDOG9lenA3QmthU2NlTTdkSStzWXJFQ1ppVFV0UFFM?=
 =?utf-8?B?Y0RhcWR5TUFjNE5TeE1iaWN2bU9iWEFMZ3E3djUzUnp3THdRdFAzMWhlLzBz?=
 =?utf-8?B?bkxDd25sdE5Cck90RHhYYUJqWjEwZ0Y4eEQ5aGc5RXBhKzhKRkdsRnJxVUVj?=
 =?utf-8?B?TitOUDMvaEtsRVB2enNpdDJ1TmR4dWdKRmNseFpJOTZCR3ZCTG9IaDJTR1dF?=
 =?utf-8?B?eVZMaVlTUHZOMXpNT2JTaXpkY1FlUzR3ZDltamdFcWhJcjBLNm4zd0tsTyt6?=
 =?utf-8?Q?1W/JB+4aDktUmL+FQW2xKJyNG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f66a69-b1d6-4f6b-2078-08dbea6fd09a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 08:56:56.6709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hA/JcIp5n7ABAd8vkc0lXhhlcnsVzQIS8G8wMoGPTQoiWUz1hiollC9oXyp7xEd2BnlWSb61YpzcvihVNivfsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8666

On 20.11.2023 20:57, Andrew Cooper wrote:
> This is a micro-optimsiation for Silvermont microarchitectures, which don't
> recognise the 64bit form as a zeroing idiom.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

For my education, ...

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -1027,7 +1027,7 @@ handle_ist_exception:
>           * Interrupted guest context. Clear the restore value for xen_cr3
>           * and copy the context to stack bottom.
>           */
> -        xor   %r15, %r15
> +        xor   %r15d, %r15d
>          xor   %ebx, %ebx
>          GET_CPUINFO_FIELD(guest_cpu_user_regs,di)
>          movq  %rsp,%rsi
> 
> base-commit: fa2da5bce90b3777aa7a323e1cf201c97b56d278

... while I understand this, what ...

> prerequisite-patch-id: a9e4e1e34d08e876d1fcb3299c6d563086768722
> prerequisite-patch-id: 703590f2c99382f6509c94bb5955f47ab2d7c57d

... are these about? They look like they would be naming prereq changes
which aren't committed yet, but (a) base-commit names the tip of the
staging branch and (b) the hashes would be meaningless without a repo
reference if they pointed at something that wasn't committed yet.

Jan

