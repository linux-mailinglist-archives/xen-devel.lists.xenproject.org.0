Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 099147EE1DC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 14:48:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634240.989653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cj5-0006HX-TT; Thu, 16 Nov 2023 13:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634240.989653; Thu, 16 Nov 2023 13:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cj5-0006EQ-PK; Thu, 16 Nov 2023 13:48:11 +0000
Received: by outflank-mailman (input) for mailman id 634240;
 Thu, 16 Nov 2023 13:48:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3cj4-0003dG-Jr
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 13:48:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c68b3322-8486-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 14:48:09 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9443.eurprd04.prod.outlook.com (2603:10a6:10:35b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Thu, 16 Nov
 2023 13:48:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 13:48:06 +0000
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
X-Inumbo-ID: c68b3322-8486-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkBTUVfpTRISbuIuUJoH31KBkXyTRnzgUA4Zi8K/KE0uYAF9PDH7I0VQYV6mUb22xPp9DTSA60pBZx3mnLBBFRVmi9JkEWqvyjKqHVQLRKYJxVGshJku5nKNLWTXXHFrDAfBs+HtEYc64ypSEc5emWgwnwJBWRtwpDzmf3sXSZeiQ2M9Ut1099VKNKcnjrh7UmT3ingOjFMOGAXCpVU5m2quhEP0lpwo8kRnu2slhX4uCXiOUBzx/59C+vKV90Y/SMVjti9QdJ5F9ZPRU/GNZhqC3OHpkCVw51a78N41EOHlvKFP7fn3QCUaAPDQuMs69dW26WvVtYP8tJOerB0Vjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqohVIbaW1GFFTMipf5Ri+LEksZYdjyITV1mQl/ILng=;
 b=YUkj1lnk5ZOi0gmRVrP2GgKm0XxHrYmEHjsP30EEPWPrOyl1lGVA281XA0tI3odWkvGtQRNODRY2SejVLgyhnFzFMmkgz9dX5P6VLn8bzPLuuKxo/68z5I4/m/0pwr4Wjy+NT+d+m517MwZ4fJOA0LlEIwYb2S+1O4Vu0UDkMD68LMxusgJQcxx1t2dzMHluESDhFLxuSU+mB90BmvZr+PmJs5wNfZlEkXGDKpN5ign5Ru0VyNwzuBwADV0pZTUtG2CVa+PdfQdpHiBlozHH5YZNRvYXBoxdyU/6vXu4ockts6reCHw6KKfN4tkhZYeVys4DySLciF7BSFC5pjx50A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqohVIbaW1GFFTMipf5Ri+LEksZYdjyITV1mQl/ILng=;
 b=cG6Pat/5x8/3vo2xLiXp9eES4245OLJNP5oX1yUqXTG9ohZFYxfHi68veYmDNjBTAZjDHU1RHtFlE1lbPw8L7B1LASdGx0SmvD+1pXijfcWkSLkw5cG8/beS+MxmCe9AWHxf61MxC6Ol2cLL2yj5eMBjuvgJD5lIt6COcnzFwiZuq0JZWkMx/B9P5gRBqYi8cMIwwz8nQqryPWBmWrd7S1BhlLdtL8HdWU+cQlS0FmdtSVaW6GtnT5AjUCXM0iNx+6QX7/cCGZAPO8zL2TuNL5zp7Ocvz1WQG0ku18UOjH9d/mBHOTr34z62+37vK5mfol+DbLgkUFUcXRY6xR5JNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <976532e6-9514-4a46-8ca1-edf66f22659b@suse.com>
Date: Thu, 16 Nov 2023 14:48:05 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 5/5] x86/vPIC: check values loaded from state save record
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 22841434-97af-4b03-00d4-08dbe6aaa941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bMlNPW734KhZ90doakKgfjLrH2A0Q3G/o5kULoHNAiUxOV9SAVeY0ssYwiOijxjOlZvMWe0IXqZRw87hOtla5m9lVr4DBajfXd8144EmCQu6lLMpVtVdoepxUjfIJSF/+yeDyvbWP7k7kvxXU4RRJGcpvEURnsdkZdcYQaLm6ows4JPCCxvj7jvwIkK2wQ6pK4xqp93I8w2jIKZlBka1GeyshqfdFeMwqX+j9mxqzHdUquXLZVBJwp29lvMhTuEYtqrcteuf4sX0D5Th9pYxqmFCIhKpcp+eaKlrRabPAGoUkdCHBbpcxheApRzJ16XO08ZCLKVFWcqKmxDO/Pe54gxs4zjGPLAjrLpv653QYa0eXKWPXMzSqrocA+EI+xVMFUAFRaRIultXAT4r8xGwGo/imN6t3jkFengPa0qSQPUxx+csLrUEOoNqMkZM32yemqJI2nFJ8pxfdRKhQLBBW4RC13nAZmC2lmQIIzi0ZuyqtYWFz6INpnQNXoksD5GbuEZz1hYZ77EAybFa8Q5J925jzPEC8RyO4AwApz8PBBVGI75vHm3wHz3ATpqyKs7ixQ9g7otwrRifpRsJcJmZuyyuEsCOUaMpoiNCCTdQi2reiowTsAQ4kE2MuPAe99mhDekb2OxJOECy9Ixztaiwbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(39860400002)(136003)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(316002)(8676002)(66946007)(8936002)(6486002)(66556008)(54906003)(66476007)(38100700002)(6506007)(478600001)(26005)(5660300002)(83380400001)(4326008)(6512007)(6916009)(2616005)(31696002)(36756003)(41300700001)(2906002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnhGYVZlQ3BYVHNNWEgyalorcWlXTlIrMS8xeUtraG9ZSk9zUjVoZEtQZUFW?=
 =?utf-8?B?Q0VTc2I1S05rb2NBeE5keW85S3JHSVpjU3NUVGN2UytxK2hESUJKWjc4dEp2?=
 =?utf-8?B?bGkzTmJ5U09MYnZ0ajFKUUx4TDRqbjBnT0dJa0RtL0ZHVzNRZ1hqbnNNOWNL?=
 =?utf-8?B?aGwyN2RZL2JudWFTYmxpRnZXQTF5SDVCZjhITXNMUTUyRm54TWw1Zy8yUEdV?=
 =?utf-8?B?REEwUmNoREt0UWZQUDRvMktZTGptRzAvdTdENDQ4WGlwZDl6SzRjRGhpL0hy?=
 =?utf-8?B?SjBxYlNka3E3OGcrbUFGRWZDaXVEam94b0tUSS95UzNSdGcwNGpYTFBPa1Vs?=
 =?utf-8?B?dnpES0tUVmxVYktwN2pDcjFZV2h0NnRCS1hLbWpKdlVUdk5mVVR0bEFCdk9T?=
 =?utf-8?B?TWJUU3I1dWdSM1R1UWUzMndveWxpMFdzcmJDbXQzb2IyaEx6TG1SQkxaaGRv?=
 =?utf-8?B?Y1g3YXp2OTZ3aVc3d05mSDA5SUx4andBRDBZR1hCRHIrOTREOU95OHkxRDV0?=
 =?utf-8?B?d2ZoMkFzY2VaK09sMXp2SG00MU91RnVzbDhRUE9vbUlnUFdKbVlwVEpsamNG?=
 =?utf-8?B?b1hUSHNBVXY4YW4xaFI0eFBpYmRaaTNqeHFLLzBZWmxSSmEvY3IzU1J1SDdT?=
 =?utf-8?B?c0Ntb2MzeUJCcU9nTjRwUmJmYkhGbGJlbHRmME51dFhMM1pHai93YWZTS0Mw?=
 =?utf-8?B?eHJmdnI1VDdYRko5S0dKZkRQdzlpUVRNbmZQL1Iwa2RWQW54THlQRmpGbS9k?=
 =?utf-8?B?enM2eUlJVGFuTW16ZmVjSmM3SDdwYW1KeWhtWmEyZXJheXpBUDFBZzRWT2Yz?=
 =?utf-8?B?aisrcmlCa1I5bkZEbDZLcy81Qk83S3JwM0d4NUs0VUd3dFE2M0xIK1FSY3pF?=
 =?utf-8?B?ZTU3NW93aUZBdXkzQU13N1JDMHowRE8zdER6Q01SMGN5YVplTzJlTHZHd3Ja?=
 =?utf-8?B?dTl2QUxVdFNTbkhMdnRaQ0QzdnBTMjV1cCsyWXNvdnZzbzlUNXFJSlpoR0x4?=
 =?utf-8?B?VU5JR2FZcU9WQUVPSTFDTmRsOUo1SGlmRkdBc0F5WDh0VWVjUmhzVTZtNTRo?=
 =?utf-8?B?OWpzOEdmbUxkd3JESXhHRmRJLythSFZLTDVwUXZvUXA4dFlIdTUxWnFtdUNV?=
 =?utf-8?B?SmMwVlJBcEJWYk9iSVBCVEJ4WHdDTm9JSlBPZlk5TUxmN013djBCQzZMa1k4?=
 =?utf-8?B?dXFORUREc214dTBRa0IySkRWdmIvNU43V3FzSnppenkycVkzREtOaTRDSkZh?=
 =?utf-8?B?Y0xCRmlzdmdrZnh5bFEzM3FiWFpJeU5CNVE5VE5tOUpUQXc2eTJjNFhhbkpH?=
 =?utf-8?B?WjZwZk4wV0doUE1yMldRQStEZUIvaDIwME12eU5pSFpSSnNic1ZZLytVZGdD?=
 =?utf-8?B?OVhROExSa0JDelhmMmFqZ29LTEorUEtxWWtlWkFydmFRLzJvVU4xOTRKdkZj?=
 =?utf-8?B?RG1UUXlNQkh1NTJiQWpYcWVtam16SDR3QUJtQlE3NVI4ZmQrUXhpd3dNcWpP?=
 =?utf-8?B?TlBtMDBsNVZzcVdDZ0xGeUhmNXpRdEZmdS9IWjVEVno0UVlyQkd3SElNOFNp?=
 =?utf-8?B?aGlhUVl2R1RZVjg1ZWdjckRYcll1dHZ5Y0lhc2M3U2Rqd0swSlhQdEJwZnhL?=
 =?utf-8?B?c2djRCthMDkwMmtLSjBvcGpTYlJNV3BOWE9yeDhSL09aUnlkSlZhRmFhRlh1?=
 =?utf-8?B?RmJicGJWN2xuNFFHSzJ6VGJ2SGlESmR0NUJ1YlhacnlrOXFqSUlkUTBITFFR?=
 =?utf-8?B?TWk2NzAxMEloQTd1M01PNWpLeVliQ1BDWGg3NFprd3BJR2VDdXFaWWo2dVpq?=
 =?utf-8?B?V2FNZ3Y3MVE3ZUJFc25EV0dHaDgxQWozNWlZdXQyOXZ4SThXSzg5N0k5ZjNF?=
 =?utf-8?B?bWs4bEVib1N6WTdaaHYyd0tnZCtJWm5vbWtERkMzSDFNc3N5Y1NzSmliTVA3?=
 =?utf-8?B?aVFXRitXWXk1OGRZSUxkN1lsWjFOMGlXU2UvV1JGRjNVUHF6aG1Nc3ZSMWZM?=
 =?utf-8?B?UFNnQmdQeTJ3VHlSVDhrT0NlOEN0R2ttSXFnd0ViRGdpcTVSaWx0dUJzaFF4?=
 =?utf-8?B?ZUh1aFIzaTFXRTF2cUNIeWV0MVJPSlJkK0Z4b2U1YmVOOU9hK1NORWVxaEpn?=
 =?utf-8?Q?krxCA2SLcbxCwg7pZhc5h1Mme?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22841434-97af-4b03-00d4-08dbe6aaa941
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:48:06.2568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDddFW0K5sSwq200kGt9Re+w/qHBJQObuUPLHfeiXYxHto/TRkX41nNFVZRTRrrYkytFl1H8eotUYY9UDwty3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9443

Loading is_master from the state save record can lead to out-of-bounds
accesses via at least the two container_of() uses by vpic_domain() and
__vpic_lock(). Make sure the value is consistent with the instance being
loaded.

For ->int_output (which for whatever reason isn't a 1-bit bitfield),
besides bounds checking also take ->init_state into account.

For ELCR follow what vpic_intercept_elcr_io()'s write path and
vpic_reset() do, i.e. don't insist on the internal view of the value to
be saved. Adjust vpic_elcr_mask() to allow using it easily for the new
case, but still also especially in the 2nd of the uses by
vpic_intercept_elcr_io()).

Move the instance range check as well, leaving just an assertion in the
load handler.

While there also correct vpic_domain() itself, to use its parameter in
both places.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Introduce separate checking function; switch to refusing to load
    bogus values. Re-base.

--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -35,13 +35,13 @@
 #include <asm/hvm/save.h>
 
 #define vpic_domain(v) (container_of((v), struct domain, \
-                        arch.hvm.vpic[!vpic->is_master]))
+                                     arch.hvm.vpic[!(v)->is_master]))
 #define __vpic_lock(v) &container_of((v), struct hvm_domain, \
                                         vpic[!(v)->is_master])->irq_lock
 #define vpic_lock(v)   spin_lock(__vpic_lock(v))
 #define vpic_unlock(v) spin_unlock(__vpic_lock(v))
 #define vpic_is_locked(v) spin_is_locked(__vpic_lock(v))
-#define vpic_elcr_mask(v) ((v)->is_master ? 0xf8 : 0xde)
+#define vpic_elcr_mask(v, mb2) ((v)->is_master ? 0xf8 | ((mb2) << 2) : 0xde)
 
 /* Return the highest priority found in mask. Return 8 if none. */
 #define VPIC_PRIO_NONE 8
@@ -387,7 +387,7 @@ static int cf_check vpic_intercept_elcr_
         if ( dir == IOREQ_WRITE )
         {
             /* Some IRs are always edge trig. Slave IR is always level trig. */
-            data = (*val >> shift) & vpic_elcr_mask(vpic);
+            data = (*val >> shift) & vpic_elcr_mask(vpic, 1);
             if ( vpic->is_master )
                 data |= 1 << 2;
             vpic->elcr = data;
@@ -395,7 +395,7 @@ static int cf_check vpic_intercept_elcr_
         else
         {
             /* Reader should not see hardcoded level-triggered slave IR. */
-            data = vpic->elcr & vpic_elcr_mask(vpic);
+            data = vpic->elcr & vpic_elcr_mask(vpic, 0);
             if ( !shift )
                 *val = data;
             else
@@ -429,6 +429,38 @@ static int cf_check vpic_save(struct vcp
     return 0;
 }
 
+static int cf_check vpic_check(const struct domain *d, hvm_domain_context_t *h)
+{
+    unsigned int inst = hvm_load_instance(h);
+    const struct hvm_hw_vpic *s;
+
+    if ( !has_vpic(d) )
+        return -ENODEV;
+
+    /* Which PIC is this? */
+    if ( inst >= ARRAY_SIZE(d->arch.hvm.vpic) )
+        return -ENOENT;
+
+    s = hvm_point_entry(PIC, h);
+    if ( !s )
+        return -ENODATA;
+
+    /*
+     * Check to-be-loaded values are within valid range, for them to represent
+     * actually reachable state.  Uses of some of the values elsewhere assume
+     * this is the case.
+     */
+    if ( s->int_output > 1 )
+        return -EDOM;
+
+    if ( s->is_master != !inst ||
+         (s->int_output && s->init_state) ||
+         (s->elcr & ~vpic_elcr_mask(s, 1)) )
+        return -EINVAL;
+
+    return 0;
+}
+
 static int cf_check vpic_load(struct domain *d, hvm_domain_context_t *h)
 {
     struct hvm_hw_vpic *s;
@@ -438,18 +470,21 @@ static int cf_check vpic_load(struct dom
         return -ENODEV;
 
     /* Which PIC is this? */
-    if ( inst > 1 )
-        return -ENOENT;
+    ASSERT(inst < ARRAY_SIZE(d->arch.hvm.vpic));
     s = &d->arch.hvm.vpic[inst];
 
     /* Load the state */
     if ( hvm_load_entry(PIC, h, s) != 0 )
         return -EINVAL;
 
+    if ( s->is_master )
+        s->elcr |= 1 << 2;
+
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PIC, vpic_save, NULL, vpic_load, 2, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(PIC, vpic_save, vpic_check, vpic_load, 2,
+                          HVMSR_PER_DOM);
 
 void vpic_reset(struct domain *d)
 {


