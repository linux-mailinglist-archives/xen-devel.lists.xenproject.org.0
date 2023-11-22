Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06197F43A4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 11:23:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638661.995479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kNv-0005Sn-Oe; Wed, 22 Nov 2023 10:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638661.995479; Wed, 22 Nov 2023 10:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kNv-0005Q7-Km; Wed, 22 Nov 2023 10:23:07 +0000
Received: by outflank-mailman (input) for mailman id 638661;
 Wed, 22 Nov 2023 10:23:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5kNt-0005Oo-ML
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 10:23:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e81f983-8921-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 11:23:03 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7290.eurprd04.prod.outlook.com (2603:10a6:102:82::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 10:23:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 10:23:00 +0000
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
X-Inumbo-ID: 1e81f983-8921-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCWfh/DFNxSQocyRbxstjejBCDV6TwYMKTHh+QO2YMbUAm8y3WuFqm8JUVPELrV5QttQnlFeZ0laQOmLd+vHK8dJybWZA9qom/JK+2p4PwlJ/00KGOoTRZeSu3280+Csp8jEhOHW9XvkrP8XV08K6XcEe7EKasBYC8z9ibH6NQxZuYDBR1a8SvTIsC7uAAoPUguYCNMsCpC7TsghKt50ncAIAQb0oNA4Bx6LweroVrO0QR7BmuIUnzeOkrfAYO9/1oOBp5+aNCnO0+Vqty7A6emoOkP0uTfInER290/RHhrHAEzIA9/UskkgY16kCWzddRjzsccbyDc92ZrzThezvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dt+eH6WhvJViIB34I4PFCE4faK683QNMVq2grwObIPo=;
 b=kx+ZXSpFayPYfCr1l0RrZitmZJVVIeadOK8yezoAoqlTGy+ffxfjJqCkQpjKLz1U7XG5VlumN+c/IjIcuTz4Uxj5+9G4THuMQV+qp7DNvqLSiFcEI51f7FmnuoVjtBWU17f/n5Rtq6pP9sDvSPaNTIAd1Ya2q4l7y2QfhAnuu27O9qoXUj9n+7aol9ReSStFMCOPOEwTch2OHZEvMSd9DBEgx8UOjB5PFc2dSstVtWNPNSJanS3CASZnkwIgiqpxmamrFG0zEQmnepXgvlrWBjcOya3dbVcE5k63DLDHOoER7cVy3Pacze4KWAe/yEmA8GLC1PjycQZYOY+K3b9M3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dt+eH6WhvJViIB34I4PFCE4faK683QNMVq2grwObIPo=;
 b=puvNwTIGZFKdTIwC32yfMgtBsX1m172tFMTp0XJRhiTdiV1r+VjVxqzLUddh7Pl9Jjuo2DDLSgxs0jQM4ELm4zvorK8sBpOBC4p+OznLanJvJGi3kOUPb5eYOlXXfhDK1xoRDNflv+TE52m1y6CP3wAS80PNi/o2WU/oYsPCruH40VpZv9qrHUMhqAQ3OdY14u/0LigQ32BT8UZG2S4+ZDhhpRpZwM2SRnrHAXWoWom76B+gJMSOVhnHPpsS2d19GY2Yb7mhYybQf/OzkBxXbGdX+tNiGaTSXaPDI9xIudYzXcYGqiahC9eHgXlXwz1nHF4JQmoYPqKBVEgROoOP2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fee36c33-e6dd-4573-9173-0bb93231f90f@suse.com>
Date: Wed, 22 Nov 2023 11:22:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] x86/vPIC: check values loaded from state save
 record
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
 <976532e6-9514-4a46-8ca1-edf66f22659b@suse.com>
 <52ec938a-053f-4f73-b4d9-984547497e16@citrix.com>
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
In-Reply-To: <52ec938a-053f-4f73-b4d9-984547497e16@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e7d0fb-d381-44a6-d01a-08dbeb4500c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HU0pxCBZfCypsnGcUTdyfl0oJhsc8s8/vxwKUYBiRWXnruOnnRHQuB9cwoc4u3xfjSauk2nXc0T16rmbTadzl8NTE+H3j51UlB8u4fGisrI2ZY0c3Q3/odEzKNcQ07/Uo9roCmFBNOOAjM4WcLhHZH/+buSAZQ+mgS8jMbB5MfIapSqCBJeggB1f5gQU6B6zTcv+HsDa/rB6bystAB/TNp33HAFMP+nS6MlVjoAMF4zGCME7rDA+Jb54bbuGfG8cfb/UADsaZ7DjggAc/23ROi3fKI5qMro1VqmBjVilRSTu5HUe85WCf99zDU40H9BjAmYBwm/weD7vqdEEe0ffR1ZR3Pg+I3psymR6MfJAUC6agm4Ks7gm/9lJleW3tBh9uqj+B0IbXMgz/yyyToHHd7z4zKzDyeTlXAeSIZshTV9vTh0c+u28ZIqbk+G5MpRX/41l7Pfg5mkvkfQ2w5oj39HnmfT2iKO3S6j1w3dBu/XXGiLgjcIPe/xR6XUCtQqQgwsh5xZ6uKoC3mOzgAQATr0WmmiWgMwoH3EMHc3PB5ds55y4QHSz7ER9C1CJ15BwwEdO3V39CWfIXqDyzdIIuyE3dmJvS01ZcTurZebGqJ1XUkYaPuuLMnzPiXvUptVpWI4IAsb0dKmQr0tlB7l4ew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(366004)(396003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(66899024)(36756003)(8936002)(8676002)(4326008)(2906002)(38100700002)(5660300002)(6486002)(478600001)(26005)(2616005)(83380400001)(54906003)(66476007)(66556008)(31686004)(66946007)(6916009)(316002)(86362001)(31696002)(6506007)(53546011)(6512007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk84ekxHTUpMdkpBMjQ5OU92eC9OYzkwOVJHNnM2Y3dEWWI4Q0RhU3g3dnlO?=
 =?utf-8?B?RDlWOXUvSTBubjl2VmN3Mzd3dXIwV1dSNS9vNkU1TjNUMzZGK1ZHSS9NNllY?=
 =?utf-8?B?L29zUTk0Z3JjY2pPS2l0emxWU3MxSGpjNGc1NW5udFBBalY5S3VoYXF6NGtN?=
 =?utf-8?B?dlRYTjJuTzRiNzY4dlNWL0t0RllkdkpzOGg1dU9hUERoVFliWEE1eWloNmtu?=
 =?utf-8?B?RDhvSkd0UktVanpWczVVYWpsTDVMbmpZN2VGbzZiNXkyUGlKNndsQ2hHNVI4?=
 =?utf-8?B?YzJralR5NlZod1pOQ3liZ29KcXZUWG14V2pFamt1UnBtcldvMWZNeTFpSVJs?=
 =?utf-8?B?RnRkaWl4dlRhcE9lK0NKZ1cxUE5DL3pqNTU2K1RkdzBBeEhha3h1MytuMnNn?=
 =?utf-8?B?NldPSG13SnhvYXlUdS9CMERHcDRRQVYvWExGMExKRWpwV3NJelVUZE1sY2xS?=
 =?utf-8?B?WllVY3BNekJHcHRCNXM3Q3V6eDJSbzhVME9Vb1ZvUjZIKzNpY01oSHo0bmdP?=
 =?utf-8?B?STJEL0pCVE0wdjdZeGxvTnFTWjB5Tml1UUVDNTlidWtmdVBPZ3F2b3VXdmx6?=
 =?utf-8?B?SkZMRHVzcVhKdGN1SFNyZnRkaVEzbHpMK05SK3RoYXVTMzVTeHpjSGhhUlk3?=
 =?utf-8?B?ViszZEZ4YnVNeHMvaG95OXY1ZmdMWWh5ci9KYWlzY3Zydno0Mzk5ZS9mVkJS?=
 =?utf-8?B?MTdXUDkrUCs0MXNVSlMzbWRUdlVURS83dHdPaTFiT000WU9OeEhweTNyd2xY?=
 =?utf-8?B?dDY2UDZvNHpVZC9RYVdVYnNMUXllQXBoZUNSbGxHSEEwc2FDQyttTDRoWXRS?=
 =?utf-8?B?RERBenEwRkE5UFNtMnY5cmpweVpiUFZ6ZFRjc3hxQmVLMG1UVU5ldWp6ZGlw?=
 =?utf-8?B?NElmSENOSHpxL25PYWRuUlpldmxwakpuQ1RhTC84NDdXYXNXeXB0RitsTnR6?=
 =?utf-8?B?ZndvSVNzdG5nTGd2VjUvMjZoa2lPN1V4UjRVbUZtVTRob0F3UWZGbUFNUGFZ?=
 =?utf-8?B?eXJRTUVkeVdjSlVwUkhRZm5iM2NlUnNWOWtUSHZ4c1ZwUDlvc3pxS2xzUENw?=
 =?utf-8?B?S2VzdWpMMnYvMUVNS0w5dmZUY3gyRzBLTVVySXZrNjViRm9UNGdWUm9oMXJN?=
 =?utf-8?B?RmF3KzR6QjAyZUxTY3ZQOHNYM2l1cGxEKzUvRFRRNDRLRXdWSnlFVUpRZ3d6?=
 =?utf-8?B?a2JZZVRHNDhxei95bVQ1TnlrQTRSQ1Jlak9SNDBTM0JGaXNzZ0pmaWpqRkJL?=
 =?utf-8?B?Ni8rZmF0VGFpeTlGWnlwRzMwQS93YWE1TnNVeUlIOXc3RkQ5ZHlWWk5wd3h1?=
 =?utf-8?B?NDA5TjNXbmdvbjBBS0F0SGJuN21TU0pzSzRVRmtOcVdkMU1pZ2JNOHNEVW1H?=
 =?utf-8?B?TWhTeU5TMDFFclR0ZDlaN1VvU2l0bnl1d0tCR25mSkZGRnJDZ3ZNYTl1bzFh?=
 =?utf-8?B?NHdHbjZpRzlJWnFNZ2hyckJjVmRmT1VtRUo0MUtBS3pVTnBVWTFTRWpUUkVp?=
 =?utf-8?B?czJLZm5tRGttL1BqVmVoMmdZdDBjLzdxanBCalRKeFhDNG8vUFdhTFo0RDBJ?=
 =?utf-8?B?UUFVZG9uMlJITEpONUtkRG9LMVlOanhTblFxTWVDYWgvRXpzUTdXWEpVWitu?=
 =?utf-8?B?Ri81SGtORjNiSmlpdWR6NU5SOGFia2s5emNRdVB4cythbVBSOUhvTmVaVnVD?=
 =?utf-8?B?VVBLcXptbmNhKzBiK0V2K2MzWGF2Q0FFK1hWWko3UlJLMk5MSWkwajU3UDRx?=
 =?utf-8?B?NEVnUEdJZEdyQkJjZ01FeXZaaEV2Q3BTNUhTQU5rRVdpdEJyeW4xWjc4ZjdM?=
 =?utf-8?B?T2xHQzIzMVFVV0ZnbTU4Y1dRRUovRFpVcFFDeU9lVTZHcGdsU211VWJkS1o3?=
 =?utf-8?B?Mmlpc3RuQlFwRGlFWHZ2eFpPYUR0d1IwVTZZOTByZEhQaTBXbWc2cEtpcGRP?=
 =?utf-8?B?amtuZnJTRVMyL1RSeklEN3M2NFNFQUlLMXcxOWJ2dXNuVXhScWphclRka282?=
 =?utf-8?B?bEJLRVIvMU5iOS9xRE1TQnJJRlU2Q3ZQR3B5OWk1VUlVZmh1cTdaU0JVUXBD?=
 =?utf-8?B?L3ZyMFhUZmdxZHh0dXcxWWxLeHlJck9mZ3pSYXNzblFHRVNuOTVCa1owcTJB?=
 =?utf-8?Q?9d84xUlpgE/O+dT4mdwY/xXPg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e7d0fb-d381-44a6-d01a-08dbeb4500c9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 10:23:00.2712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhJn8tSl7cGiHpApWLIZkOK2CDGPJzU0GNKD4FHrx7i5D+uJFu6hVXXUDbCW0vt+aD6iLip0wkd1nomuHvW0SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7290

On 22.11.2023 02:26, Andrew Cooper wrote:
> On 16/11/2023 1:48 pm, Jan Beulich wrote:
>> Loading is_master from the state save record can lead to out-of-bounds
>> accesses via at least the two container_of() uses by vpic_domain() and
>> __vpic_lock(). Make sure the value is consistent with the instance being
>> loaded.
>>
>> For ->int_output (which for whatever reason isn't a 1-bit bitfield),
>> besides bounds checking also take ->init_state into account.
>>
>> For ELCR follow what vpic_intercept_elcr_io()'s write path and
>> vpic_reset() do, i.e. don't insist on the internal view of the value to
>> be saved. Adjust vpic_elcr_mask() to allow using it easily for the new
>> case, but still also especially in the 2nd of the uses by
>> vpic_intercept_elcr_io()).
> 
> I'm afraid I'm totally lost trying to follow this change.
> 
> What is mb2 and why is it variable?

Master bit 2 (i.e. the value for bit 2 iff dealing with the master PIC).
I'm afraid I couldn't think of anything better that wouldn't be unduly
long.

> This does look like a logically unrelated change (the only overlap is
> using the new vpic_elcr_mask() form to audit the incoming data), so I
> think it needs breaking out simply for review-ability.

I can split it out, but I'm afraid it makes little sense when split. So
I'd first like to double check with you that with the naming choice
clarified, you still think you'd see this making sense as a change on
its own.

>> --- a/xen/arch/x86/hvm/vpic.c
>> +++ b/xen/arch/x86/hvm/vpic.c
>> @@ -35,13 +35,13 @@
>>  #include <asm/hvm/save.h>
>>  
>>  #define vpic_domain(v) (container_of((v), struct domain, \
>> -                        arch.hvm.vpic[!vpic->is_master]))
>> +                                     arch.hvm.vpic[!(v)->is_master]))
> 
> This appears to have only compiled before because both callers have vpic
> as their parameter.

Indeed.

> I think this is worthy of breaking out into a separate change, because
> it wants backporting further than I expect you're likely to want to
> backport this patch in general.

Can do. Since there's no breakage from this, I wouldn't have thought of
backporting the change, though. Hence also why I folded it into here.

Jan

