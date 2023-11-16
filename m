Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F13B7EE1D7
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 14:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634236.989642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cig-0005Um-Ee; Thu, 16 Nov 2023 13:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634236.989642; Thu, 16 Nov 2023 13:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cig-0005SJ-BZ; Thu, 16 Nov 2023 13:47:46 +0000
Received: by outflank-mailman (input) for mailman id 634236;
 Thu, 16 Nov 2023 13:47:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3cie-0003dG-EJ
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 13:47:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6f67cc8-8486-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 14:47:42 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.7; Thu, 16 Nov
 2023 13:47:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 13:47:40 +0000
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
X-Inumbo-ID: b6f67cc8-8486-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkH7Qef6wZuvUH5Z/H+VX7O2ES6Wapzdx9D1Ki2hR3wD5xZ5uUlI55mqMewxYAzF4EziuORLdA+tAVwkuhxbsSb8lNsKsPTBKSNVff89SsO61+TMPa+bkRjASt+haLB8AKuLNcs5Q/Syx6zT/Vgk239/RaH5AI67YUeoCXhR6V8nw6ViqCtN6xKJJ4AL8kfhkimuHpol2eO4mt9E/WVtTS4+WqJyo643Ld3S2Dd/H/3HNYizUwHJJnelpjkYSwTtYilYh6vJdqZrbxtehZ4J76psAbpnpuXW9BqwzZLvbuskI8kpA2jkb17LUieJ3vqhuzY2kZj+rBOjmjv8bNPXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFoksZlHmjUHcpacPzoQIHgByDW8pTeI436EQErY+x8=;
 b=I2UwZ7ojL9hWVeVkbyeCZGB5JAv1ghskKnIu4Mw2YaAj/HZ7Z+mgIQSmTRa9JsHPn7eDS8jd65toNo3cZ9AU5aUHPY/gSSPwrdm/GA+0mm3gxfWC01G5SGNPPTH4r3c+Aj0yMLpHVxno7boPNrPiQ9wXuYZS1+ssHLH9ptJbi2VfgrGs7/DS5N3x7R3NdF3GI0ut2nD+rDtSxNonfIddml+tKJDYC/0FPcrPBuK0wN1FBCVzgSs1i4XUvxdFiQWwcz6LApgoG8yZ7DgVe32NMUrS/DE908et7+qOx2Ov/IrRgEbHxVf1l8gvi6/zTVkyD9tBtO1UzMD59DDp5jdrXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFoksZlHmjUHcpacPzoQIHgByDW8pTeI436EQErY+x8=;
 b=iyX3xRRkhYaqiJ4lMOHmoCTzpgmkCee7L10fUDtu3WSRhvAff6stRAh+3Oz3jWuF+ePY0+KdMXusyjyK3OMhlW8s2iSBoLN+4JsWoZAsiOdfiDpqrZE3t9WUl63TSxk4A5Yl+PPITTMH1KUHME+bfutPGGIFI1h6v4UUIyVMPFMUaPrVZqV7J8tkiBeWIeRh6TRMiWoBekj80YOZnVRwC4tMHpJLoi3acFnT7Ygu8z2cxxXG9wVHaNzKa5svXyaw4jxLKzXI8V1+NWe6ol+lWTun5JJYEGG+gmw9BGJEyBDmkyKQwKv7oug/XXtuPU022DaRxnX2uZin5BWp9v9YyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <584f566f-a0c9-49b5-b592-89ac4f1ecd05@suse.com>
Date: Thu, 16 Nov 2023 14:47:39 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/5] x86/vPIT: check values loaded from state save record
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
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
In-Reply-To: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ded0cd-c276-4366-97a1-08dbe6aa9a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yet2sjyEsyIQNpVZ0tinFxYlZaLLfG8BRPThH8G5O5aSeVa/RzzgR9wO+55vUjhz9exBkjV2jJN+/fgXrL1LoKRY0jxQJTJcCiPcZELvy/l/zzRb8kr19NXbs4PfT6MjGpNUNP0LC6B3uUVp4QorsQCTaX4HiXUcQdLZ52J578qeHBsVpEQj24UE87LKo1VduD1VP7liFNyd0mRVeFfWwWiWez4dbAXz7CPbF/RoAEwb7IIfyVJm2sdKDUbuTkzsrQHa9SmNeLgIGr84GBcCSvxjWcdhzfJaBvhVK6aSsmjeNKETO01fRtmtA962izR57Z9Eu/zW+5Ll9/uV+tMVAymkwnShP+9KY8VYKdgZL33AR+oRSYE6V5a+fimc9gu5ybnrvogW4tKrR9a+rG9G8SaoeGPeypDW1XlA2SkkC3JHGPF9QBNhHkolBuMPnujIGUDaZxwcgoi33bPTlUcCMFGxvg5grZLCjnmDTmaXkAK0QdAU0FcfW6G4gT/oToO9rXrO2tkKIO2NzUqMmdWGqPKB1Mp+GFCkclNxTwecIJ2UAO2nZwup+v/ujoWhTOqTBOTNOrJ0XVjWX5sE06iOxZcFQsoHYMuLLKx55BbpQjRHI8Te4TNnVoJD+kSVh7LbNY8BSlIUQLcqEIGpWH8TAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(366004)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(31696002)(36756003)(86362001)(8676002)(2906002)(8936002)(4326008)(5660300002)(66476007)(66556008)(54906003)(316002)(66946007)(6916009)(478600001)(6486002)(38100700002)(31686004)(6506007)(26005)(2616005)(41300700001)(83380400001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djAxWWpVSnkxd1ZBUlZzcXF2YjRYRDZqeGlKcmRaVTlRYVZtb0xTR1BGNFJl?=
 =?utf-8?B?RDM2UWVJbDZ0MUFqS3dUN1ZmQkVQR05Kdmt5RmYzbDJScXhtNnFlZzFOQmI0?=
 =?utf-8?B?TzF6blBDR1BuOUZNajhmOGsxUHQ0ZFFBWEcxc2p4cUtkbDJmL2QrNEdsOXVK?=
 =?utf-8?B?VzEwemtEUUlqNXRMd2lySFBvaDZEZWRBUkNLeTZUdFZZdVJhWkhqa0hTZGVj?=
 =?utf-8?B?OG1RT1Q0UnRhWUFHN1dydDFjSzlOVGFOY0Q1TzZkQlZOQTloaE9YMTVvTyt1?=
 =?utf-8?B?a2xYS29KZDZIaTVzQ3REbFB2VHJKbG8xdTkwaDRnTVlRTldBSnUxL25ZdmtW?=
 =?utf-8?B?RzJHZUJmZzR4dE8yb0VpOHkyVGZ0SDVSZFRCMWV2aGIxVjlJMkI0NTZweHA0?=
 =?utf-8?B?OWhHeEIyc3kwUnVIeFBINS90MlRQWFhINWk3aTZKRWtGK081MC9uUFhDMDAr?=
 =?utf-8?B?elhaWGFDY1RRZFNpMitCcmdIbGdlbVJ0SmNWdjY3NVhDYzlQQjJxZC9qeFpt?=
 =?utf-8?B?Z2cya1J6NUd6YTFoQWU2NFUvVENrQXR3alRFOGJwb04wMStKSTk0U1lXNk9a?=
 =?utf-8?B?MXZleXJEWEdIVEFNUEFZb1FXK2FBOFBrZU9qY0I2RmNFdDA2Yktvbk8rY3FV?=
 =?utf-8?B?QlRieEJWOWU1WU1SRTM0YVZVeHVXTnVqQnptKy9FS0RibGJiaEVFaCt4aVB5?=
 =?utf-8?B?WUhkMHUvOGtMcEdSQmt3bzVJVW1JVG5YWktzSVpHSXBzNVdWVFFXMTJuYk91?=
 =?utf-8?B?NnYvUW5mYmUyMy9Yc0dqbFdFbHBWTm1VMnY1NkdJUG1ENkpNMWp4VWRyRjNE?=
 =?utf-8?B?QmlFZlRyM3ZGVlZNNWllRXJxUzRnbi85blRXV1lpVTJqR1I0cnAzZUd0UWw4?=
 =?utf-8?B?cE9DOExUcGNwdm1jeXBQV3ZiVW00dnBDampiVkJzY203RkJma0ZWWUFkcjZh?=
 =?utf-8?B?TUpCN09BWW9nbTdFeUVlczM5dnlZaE5YaiszVERNYUNaNVV1VVJqM1lCQ0hX?=
 =?utf-8?B?K2VyUkVwSEFyTkoweVk1NW5DNkFBUEZOZDE1cEZibHJjUTBNYXB5UEpMeU5y?=
 =?utf-8?B?MEJtOHFEbjJFR0FuNDRWQitPMXZkNEZ0WmdLVEhKdUwzK3BVbW5QOEFNTUlB?=
 =?utf-8?B?Qy96L25LNVdjT0hpd2pJTVZMZDZTUEViN3VtWUFNTFhCSkdtdTMyUUFjbnlP?=
 =?utf-8?B?NERDM2VjWllSdzF4WEdkOVcrZFRnSkxycnFpQ3dJcG80RmNrV2xYTlo3cWd3?=
 =?utf-8?B?VXFhS2JXd3NQbitxV2dIZmthREZoTStnazRURElzcXNWeG9YbWswNCtkMUFl?=
 =?utf-8?B?Sm4rUFcrc3A5ZGQyNXZTYzAyMTc0SU8wMENyMFpkOG5qM1ZPTmZaRHVHUG9Z?=
 =?utf-8?B?clMzVERhcGl2OVF3QXhJUFhvSGFKa2xZanVBM3N4TUdUQUQ0TlIyd3VMaUs4?=
 =?utf-8?B?Y0NFR1BBaHcyT3lTNW5DNkpTM2NLdGpRTFhRZ0ZRYjA1RVQ0Vm9SNjRyQ1ZE?=
 =?utf-8?B?WXFPMkFkcHB1dkROYk40K0xhM0ttSXFxOXBZVXVLTS9PVXNKTlJMSDNnTWl2?=
 =?utf-8?B?MVlBRmhKaE9YR1pOQUV4TXlDcW03VEI2ODgzYWh3REVORmkrYllaVWZ2T2dx?=
 =?utf-8?B?N0d4dkNSMVRRS0VqMzY1b3h2NWQwMHM5T2RSL3hlYTBNZVE3NkE3RFZKR2ZX?=
 =?utf-8?B?T21yU0Q0ZExPSlpnZXAwSE81ZWdJRDNoWUVYSnVDRVFYdGYxSDBvbnljb0hX?=
 =?utf-8?B?TUZDUUl2SWpzbTRLbGVhT2FzK0tZczFnOUsvMVhWa2kwRERKcU9jeVJWbnZ5?=
 =?utf-8?B?Nm1JaVAxNFpNOXp2NmJqdExTclFzTmVUNVhRMkM2UVhTM3FxN1E4L3BrZEVU?=
 =?utf-8?B?alVtQzNYSFdTc1pBM3c0UGEyUUc2WTFpZElMNHZDUlNrL0kyWWhnOVRVSkFQ?=
 =?utf-8?B?UnFESjVtTHJUaUliVVBMNXZBWEdGMENBbmlrUzBqVjdVUHdLZUxJdHhLV2sx?=
 =?utf-8?B?OElseSsyTFFRV3JtaGVzd0M3M1hOSzFqOStXTEtRS2Q0S1gzMHpndXlucEFz?=
 =?utf-8?B?anQ2QjVWamkzMERYbVZEaVZVU2VzMUkzVVkrZlF3Z012NXN6UVdETFJoSWtz?=
 =?utf-8?Q?17GsIN6PiimoeQLM/Haqiiy4A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ded0cd-c276-4366-97a1-08dbe6aa9a25
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:47:40.9218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVafaRlbeitlIjNt+2eThCm0qhnm81BZKTSryPaVR6gaIgf1tzqpd3PJCWdEFSR1xOrrlpqd/DjBLs00div52w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181

In particular pit_latch_status() and speaker_ioport_read() perform
calculations which assume in-bounds values. Several of the state save
record fields can hold wider ranges, though. Refuse to load values which
cannot result from normal operation, except mode, the init state of
which (see also below) cannot otherwise be reached.

Note that ->gate should only be possible to be zero for channel 2;
enforce that as well.

Adjust pit_reset()'s writing of ->mode as well, to not unduly affect
the value pit_latch_status() may calculate. The chosen mode of 7 is
still one which cannot be established by writing the control word. Note
that with or without this adjustment effectively all switch() statements
using mode as the control expression aren't quite right when the PIT is
still in that init state; there is an apparent assumption that before
these can sensibly be invoked, the guest would init the PIT (i.e. in
particular set the mode).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
For mode we could refuse to load values in the [0x08,0xfe] range; I'm
not certain that's going to be overly helpful.

For count I was considering to clip the saved value to 16 bits (i.e. to
convert the internally used 0x10000 back to the architectural 0x0000),
but pit_save() doesn't easily lend itself to such a "fixup". If desired
perhaps better a separate change anyway.
---
v2: Introduce separate checking function; switch to refusing to load
    bogus values. Re-base.

--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -47,6 +47,7 @@
 #define RW_STATE_MSB 2
 #define RW_STATE_WORD0 3
 #define RW_STATE_WORD1 4
+#define RW_STATE_NUM 5
 
 #define get_guest_time(v) \
    (is_hvm_vcpu(v) ? hvm_get_guest_time(v) : (u64)get_s_time())
@@ -427,6 +428,47 @@ static int cf_check pit_save(struct vcpu
     return rc;
 }
 
+static int cf_check pit_check(const struct domain *d, hvm_domain_context_t *h)
+{
+    const struct hvm_hw_pit *hw;
+    unsigned int i;
+
+    if ( !has_vpit(d) )
+        return -ENODEV;
+
+    hw = hvm_point_entry(PIT, h);
+    if ( !hw )
+        return -ENODATA;
+
+    /*
+     * Check to-be-loaded values are within valid range, for them to represent
+     * actually reachable state.  Uses of some of the values elsewhere assume
+     * this is the case.  Note that the channels' mode fields aren't checked;
+     * older Xen might save them as 0xff.
+     */
+    if ( hw->speaker_data_on > 1 || hw->pad0 )
+        return -EDOM;
+
+    for ( i = 0; i < ARRAY_SIZE(hw->channels); ++i )
+    {
+        const struct hvm_hw_pit_channel *ch = &hw->channels[i];
+
+        if ( ch->count > 0x10000 ||
+             ch->count_latched >= RW_STATE_NUM ||
+             ch->read_state >= RW_STATE_NUM ||
+             ch->write_state >= RW_STATE_NUM ||
+             ch->rw_mode > RW_STATE_WORD0 ||
+             ch->gate > 1 ||
+             ch->bcd > 1 )
+            return -EDOM;
+
+        if ( i != 2 && !ch->gate )
+            return -EINVAL;
+    }
+
+    return 0;
+}
+
 static int cf_check pit_load(struct domain *d, hvm_domain_context_t *h)
 {
     PITState *pit = domain_vpit(d);
@@ -443,6 +485,14 @@ static int cf_check pit_load(struct doma
         goto out;
     }
     
+    for ( i = 0; i < ARRAY_SIZE(pit->hw.channels); ++i )
+    {
+        struct hvm_hw_pit_channel *ch = &pit->hw.channels[i];
+
+        if ( (ch->mode &= 7) > 5 )
+            ch->mode -= 4;
+    }
+
     /*
      * Recreate platform timers from hardware state.  There will be some 
      * time jitter here, but the wall-clock will have jumped massively, so 
@@ -458,7 +508,7 @@ static int cf_check pit_load(struct doma
     return rc;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, NULL, pit_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, pit_check, pit_load, 1, HVMSR_PER_DOM);
 #endif
 
 /* The intercept action for PIT DM retval: 0--not handled; 1--handled. */
@@ -575,7 +625,7 @@ void pit_reset(struct domain *d)
     for ( i = 0; i < 3; i++ )
     {
         s = &pit->hw.channels[i];
-        s->mode = 0xff; /* the init mode */
+        s->mode = 7; /* the init mode */
         s->gate = (i != 2);
         pit_load_count(pit, i, 0);
     }


