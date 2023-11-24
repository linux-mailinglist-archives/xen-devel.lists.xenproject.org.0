Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA0E7F6EA5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640248.998235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rl9-0001xx-AE; Fri, 24 Nov 2023 08:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640248.998235; Fri, 24 Nov 2023 08:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rl9-0001vT-6g; Fri, 24 Nov 2023 08:41:59 +0000
Received: by outflank-mailman (input) for mailman id 640248;
 Fri, 24 Nov 2023 08:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6Rl7-0001P4-Fo
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:41:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52c92db0-8aa5-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 09:41:55 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8326.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 08:41:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:41:46 +0000
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
X-Inumbo-ID: 52c92db0-8aa5-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXdgE19PPtwNK00DKfOe0tEBFGkHf4saI403QUhU8EArbow5rS/VG6V8cjWVWJtCDtMlPwLXON0GTEPii5fnQqt4PsvaJ0FitWRXXJTPydQoPYVjc6fo5fflJikg5FL3Ap4+M3iKnh7yVWAlKktVTrDZXcWlttN0jnNdF63EFtGv5hpBkOO9KIZ7TCCpXyk5yyUPjpUTEaHmfug+NClA6OudviXi2PXZJY+apjggdlD8Psm/wxnXaa9b34OstjJes3cWmzBwDjkGUZduobxoSiLk/Px/MlqEERijBCqgqGnTB7aRlAZXCkSg5xEne+a7nQKAQdMeOop2Hz5tzn5izQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5lXav2XkZNNALmwvDKfV3gih8J86FdHybiKziaUjVo=;
 b=kPNSxCyfHotYacIeredoL2gVjTezHZDEppwcKADM1E1MaDq+SBJIlrUYn4QcSLqRLtGCqTERhiA7sI8RafKeILl5ORMUqUu3wYvj6PJLMkhNcATpfbtPXMlvE6Ufw3V5dyM42d1+3uENeiZgEr4KDP7xjHLAmLGM36S+haGGalIicy3hanUgBlfyQfb+mSs6lNhPZ+2BbhimFE2syKObvfziWWd3a4DmPVuyZKByzZFd+8imS8RgeihKiLYgwWEkaS6Oy7VkSJn6ffjj5la9pndZQIH01LKQ4KMLc9tPXqV7FFfM5P1VwnnOBWyOutgPQSBrlUqPVEphTyf1k7sbqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5lXav2XkZNNALmwvDKfV3gih8J86FdHybiKziaUjVo=;
 b=qDffSD9TL6sdVEooP7Udt9PLSFmhQAAlijqoAScUlKOUxydtUUZcEZWxv5hjN7ysil+kDhKpFfESmrsNBhmkZ3KobK0pyyRVOfWoVb+OhIInJN70/Vi8lNvAo2za/x0+iA/zgYFs3Bu9wyYNCNH8cj5bysymsIf/lXUsFQqIZl6wsjLacitvy1lC1+O3YBmQmY2eM3ibQCAU0lXFE7c0euB5lthdIgsYGRS/9QSvqciwyoCTEFarPWdBR49A+OPCmSdQFKW6yDAgg/JvuqIxv07m7VUX0gAy1kiBOBEQmd+t1iazZAvXB6DbqrLc8/G+fhCdsrlbxLVRjunHCi77cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15d8e4cf-449f-4792-b235-f5ee218e2e0e@suse.com>
Date: Fri, 24 Nov 2023 09:41:45 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 10/15] VMX: convert vmx_cpu_based_exec_control
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
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
In-Reply-To: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ce5cf1e-d9d3-472c-243a-08dbecc93113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OyVrJgLCrKFOhug8zkHqNLBUaBLJrBpF852Jb/+6l5yP9ual3DoxK+5k8O1dn/fKi5NxYEQsCf2F664h2dBbzHyDmV2dQ3t8YDTgu32O9NWXF5YMzmIrPTfBZALhqGzsZNRNHj/AO8ZenFTNEYLYZC5YWB5treo/1p7VBY1vBVZzuSzaDKGeT5hiV3Vxtebwp5ny9TwBGG5ugMHAr58lJ+O6jxWte8hBd+zUc/DCfvbuJQzAm4Do5aLizEUU0E650oT12uIHehAfRGNOnUzyADVL6ymz7q/KJ5M691g89QHtidj6hfG+T0vnsGXmMbyDVXZll7tK58slkac9yAc2gyWIt0JrmOXkGRNtRVqWSIXJpPDlCU6RoJbhjJemFDMOisreJGcagz5fsWG05Y2hJGo2AMbV2x6QvstiWOCDLipoK1eHV8G8utRObI7/AotmCa2BWKK9lXQtm1Dkvx5RgAf+XdJe7B1CNFUVibwtE6GgNKe2beILSXRn2C1bAs3m7rCEd0pv9NNfqkrDxCNPK04YpVOYBXYaBToCeJ0aRyQ84pixClsBtk4nEYVkPI/fcylCmnrVxM9c5IBOq10OrviactG75G+JWDZs3O+kBlx0CtONIFAJB3hzeq0A5nBMh59htaTpoOaRbu9eB74Lag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31686004)(26005)(66946007)(6916009)(66476007)(66556008)(54906003)(38100700002)(36756003)(31696002)(86362001)(6486002)(83380400001)(2616005)(6512007)(6506007)(478600001)(4326008)(2906002)(316002)(8676002)(8936002)(5660300002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHBuNUVmb1NFYlJCendFeFVKMjZuQmpKdjhtdHpLSTlJbU96T1BHNDVENi9y?=
 =?utf-8?B?RnRzOHd0K0o2cjNtY3JpZTFaNnVVcjV1cVovckFrYzRzQXBBM3VHYlV1WjRh?=
 =?utf-8?B?QUpFOVJrM3dSblhRKzcwWWVpczhjRXltcjB5bkw4WW8wUzdETXFXNzBBVktG?=
 =?utf-8?B?VSsyQlU3bTYyeGwrbndQcFJpNDc2b211aEkxUjVyb3dRVnd4QVB5THZCVVJr?=
 =?utf-8?B?OUhYQjFldm1vM3Y5SlVRT1pabXpSN0YzdjRDNy9EWEN5SFRXbUg0VjRPTVU0?=
 =?utf-8?B?aWpTK0RPYVgwZU1yWHMzZmdTSmd5V0FRZlVtZm14MjlWbGszRkpZZDJkOTR0?=
 =?utf-8?B?bmloMU81VkM2bWpFQVB1RWpud0VjOUt2elk2cmM1Qk5WcGd4UXRDOXpMRCt5?=
 =?utf-8?B?WmtVaGdQY2JKNWJtVlZLWGRibW5SL0lVL2JTVXZDbTRzSDRteFFkT2ZBSHVD?=
 =?utf-8?B?UFlqcmNRWEtQblhXM3Q4VCttWjQ4c2tSTlFLMkRQOG92YjYzNkMvNHMyblNK?=
 =?utf-8?B?YSsyN1ZDdFgra3lqN1h6SjNJbzFOY1VqVCtERVpQRFcreVZVSzZKUXh4eXRZ?=
 =?utf-8?B?S1E5QzJYZUZCSVdhUWVvZmFPVmZLZG9vd1lrNExxRFVJclFoT3gxUDYzTm5O?=
 =?utf-8?B?OEVMUWhDNUR4VGN2VUR3czhZQmxFVDd3dk1DcUxmc3gzdEVzdEk4emM1R2xO?=
 =?utf-8?B?dUwrejg1RVNMSXpjbTBHQXhSenA1NDhUMWpjSERzV0F4enlyUUhYL3RSNWow?=
 =?utf-8?B?a2ZFZU1nUS9vTjV6K2RYTnFtNWdDNTRBZnJidTRndXBuZ1AyU01ETzBRWUg0?=
 =?utf-8?B?Znk3Vy9wV0dJOHBPRWxOTnBXdUM4U1o1bFRrTi9iTUVkK2Qva3pwaHNwZ25z?=
 =?utf-8?B?K3ZnZFlsTzdBTWxIN1lDTHl3cEFNaVR1QWp5VkNUc20zUnFhL1dQVXpxS1Zp?=
 =?utf-8?B?S1dTWWVDNElLMkJFNjFqeGg0cG9GRlRJVHc0RlZpbTF5QnZLQVU0ZmxKQVJa?=
 =?utf-8?B?UnlxZ0dkMjM4NHpMMWczVnJvM2hBMlp6UU5rNHR1U0NRbG4xQWZNQWk3ME1h?=
 =?utf-8?B?ZDBFSlFMZW9TcVNoOVZWelcvZkQrMVY3eGpmalQ2Zm9xMnczYlhXWWNyY1J1?=
 =?utf-8?B?MzRVcGxFay9rVGtNd3R1MzhuV3RRbi9wYlVJRWs2N0U5OXZoaTBSdUorTDBO?=
 =?utf-8?B?cXZuY3U3YUFBWmJnN0ptaGk2Njl5ZGltV0VvY3lMLzFkc1M0SkRCQVVDZjVh?=
 =?utf-8?B?d0NESVpJMFZwcktjWXQ5SjJqZ3ZWTk03KzZOUWxnaUZibGl6QXVxcWN4ajhZ?=
 =?utf-8?B?N3lwbGFDR1VhRGtZWnpHRWRUT2FZcFVEbEdnT1B4Zll5eWdPMXdOdzBOb1hN?=
 =?utf-8?B?UjY4M1ZDVDhpRG02dDBTYWt5YzZuYUtLdXVxWHNvWVpFNncvTWNnT3NiZnRj?=
 =?utf-8?B?ZWtTY0FGblQ5eGhEZC90ZjRadW16b29icFFtZGpnS1RSUXlydGxrUkZWVjlk?=
 =?utf-8?B?L09MNkdxcnlzSDh3L3F2aDRickFnMGdzR1RTa2wzcUVnU2pUV2dtT1VxR3Qr?=
 =?utf-8?B?bHlSSXNGZngwU0RZVHQyVWZLRHJkaUcwYy9yRkFacldGRGsrcnNJdG16SGti?=
 =?utf-8?B?MHBPMHVtbUgyVnlITHRHeUI1VEhYZ2xsckFvRzFUNWJJMTVaSFBMSmV0TXIx?=
 =?utf-8?B?WnJCdTFYaS96UGxRM3h1R2M3Y2RkNnByc1NlRTFUcmorZmY1NGkxMmJmYlBm?=
 =?utf-8?B?c2cySnhOVlNzbDNEeTZBaEhwbThNRFhYYjlwcm0vNEdGRkRxRVVObHFhR01X?=
 =?utf-8?B?Sm9hL2wxa2RRMlNFdGlVczN6bVBoUzl6Qk03THZ0OTlUWUdlZWlzSWNNOVJJ?=
 =?utf-8?B?dVZvczBXSWR6SFF1d2dYYVo3TkZrMDRDTlFvcG5ycE1qNzBrblZHOWQvdEZX?=
 =?utf-8?B?Sm44Y2Z0YVZHWEwwTjBpeXVGLzFHeTNYSkFhOXg2ekowNnpuS0tsa3FJVUxt?=
 =?utf-8?B?aFhjTGxSV2owRnMwZzBINHFnSlRuRWl6TFc3eFhLS2VjR0xMam1ScEZwUnFm?=
 =?utf-8?B?MWEzTm5BMmVvNWh6b2grOVF2cGhwVUhVSHVndjRiK1p0b3NmRDlTZDdyV3BV?=
 =?utf-8?Q?zTRTYAUdDt8r1nCt1jshXgZc0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce5cf1e-d9d3-472c-243a-08dbecc93113
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:41:46.0110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVIgkohcqWNmemg5gKQaWvH/WaOKiusXHjQwRDxm8ByIf9CKXWApkQNYxXYCVwDQSSB6xiZzVsD9QxU750xr/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8326

... to a field in the capability/controls struct.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-u32 vmx_cpu_based_exec_control __read_mostly;
 u32 vmx_secondary_exec_control __read_mostly;
 u32 vmx_vmexit_control __read_mostly;
 u32 vmx_vmentry_control __read_mostly;
@@ -238,7 +237,6 @@ static int vmx_init_vmcs_config(bool bsp
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
     struct vmx_caps caps;
-    u32 _vmx_cpu_based_exec_control;
     u32 _vmx_secondary_exec_control = 0;
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
@@ -274,12 +272,12 @@ static int vmx_init_vmcs_config(bool bsp
            CPU_BASED_TPR_SHADOW |
            CPU_BASED_MONITOR_TRAP_FLAG |
            CPU_BASED_ACTIVATE_SECONDARY_CONTROLS);
-    _vmx_cpu_based_exec_control = adjust_vmx_controls(
+    caps.cpu_based_exec_control = adjust_vmx_controls(
         "CPU-Based Exec Control", min, opt,
         MSR_IA32_VMX_PROCBASED_CTLS, &mismatch);
-    _vmx_cpu_based_exec_control &= ~CPU_BASED_RDTSC_EXITING;
-    if ( _vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW )
-        _vmx_cpu_based_exec_control &=
+    caps.cpu_based_exec_control &= ~CPU_BASED_RDTSC_EXITING;
+    if ( caps.cpu_based_exec_control & CPU_BASED_TPR_SHADOW )
+        caps.cpu_based_exec_control &=
             ~(CPU_BASED_CR8_LOAD_EXITING | CPU_BASED_CR8_STORE_EXITING);
 
     rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
@@ -296,7 +294,7 @@ static int vmx_init_vmcs_config(bool bsp
         return -EINVAL;
     }
 
-    if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS )
+    if ( caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS )
     {
         min = 0;
         opt = (SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES |
@@ -326,7 +324,7 @@ static int vmx_init_vmcs_config(bool bsp
          * "APIC Register Virtualization" and "Virtual Interrupt Delivery"
          * can be set only when "use TPR shadow" is set
          */
-        if ( (_vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW) &&
+        if ( (caps.cpu_based_exec_control & CPU_BASED_TPR_SHADOW) &&
              opt_apicv_enabled )
             opt |= SECONDARY_EXEC_APIC_REGISTER_VIRT |
                    SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY |
@@ -464,7 +462,6 @@ static int vmx_init_vmcs_config(bool bsp
     {
         /* First time through. */
         vmx_caps = caps;
-        vmx_cpu_based_exec_control = _vmx_cpu_based_exec_control;
         vmx_secondary_exec_control = _vmx_secondary_exec_control;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
         vmx_vmexit_control         = _vmx_vmexit_control;
@@ -496,7 +493,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmx_caps.pin_based_exec_control, caps.pin_based_exec_control);
         mismatch |= cap_check(
             "CPU-Based Exec Control",
-            vmx_cpu_based_exec_control, _vmx_cpu_based_exec_control);
+            vmx_caps.cpu_based_exec_control, caps.cpu_based_exec_control);
         mismatch |= cap_check(
             "Secondary Exec Control",
             vmx_secondary_exec_control, _vmx_secondary_exec_control);
@@ -1073,7 +1070,7 @@ static int construct_vmcs(struct vcpu *v
     /* VMCS controls. */
     __vmwrite(PIN_BASED_VM_EXEC_CONTROL, vmx_caps.pin_based_exec_control);
 
-    v->arch.hvm.vmx.exec_control = vmx_cpu_based_exec_control;
+    v->arch.hvm.vmx.exec_control = vmx_caps.cpu_based_exec_control;
     if ( d->arch.vtsc && !cpu_has_vmx_tsc_scaling )
         v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
 
@@ -2169,7 +2166,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_cpu_based_exec_control = 0;
         vmx_secondary_exec_control = 0;
         vmx_vmexit_control         = 0;
         vmx_vmentry_control        = 0;
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -208,7 +208,6 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define CPU_BASED_MONITOR_EXITING             0x20000000U
 #define CPU_BASED_PAUSE_EXITING               0x40000000U
 #define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000U
-extern u32 vmx_cpu_based_exec_control;
 
 #define PIN_BASED_EXT_INTR_MASK         0x00000001
 #define PIN_BASED_NMI_EXITING           0x00000008
@@ -286,6 +285,7 @@ extern u64 vmx_ept_vpid_cap;
 struct vmx_caps {
     uint64_t basic_msr;
     uint32_t pin_based_exec_control;
+    uint32_t cpu_based_exec_control;
 };
 extern struct vmx_caps vmx_caps;
 
@@ -294,13 +294,13 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_virtualize_apic_accesses \
     (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)
 #define cpu_has_vmx_tpr_shadow \
-    (vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW)
+    (vmx_caps.cpu_based_exec_control & CPU_BASED_TPR_SHADOW)
 #define cpu_has_vmx_vnmi \
     (vmx_caps.pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
 #define cpu_has_vmx_msr_bitmap \
-    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
+    (vmx_caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
 #define cpu_has_vmx_secondary_exec_control \
-    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
+    (vmx_caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
 #define cpu_has_vmx_ept \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
 #define cpu_has_vmx_dt_exiting \
@@ -310,7 +310,7 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_vmx_vpid \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
 #define cpu_has_monitor_trap_flag \
-    (vmx_cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG)
+    (vmx_caps.cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG)
 #define cpu_has_vmx_pat \
     (vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_PAT)
 #define cpu_has_vmx_efer \


