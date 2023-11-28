Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E91A97FB907
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 12:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643049.1002929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vxc-0003R0-2P; Tue, 28 Nov 2023 11:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643049.1002929; Tue, 28 Nov 2023 11:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vxb-0003KR-VQ; Tue, 28 Nov 2023 11:08:59 +0000
Received: by outflank-mailman (input) for mailman id 643049;
 Tue, 28 Nov 2023 11:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7vxa-0003H2-7w
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 11:08:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 856ea8eb-8dde-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 12:08:55 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8276.eurprd04.prod.outlook.com (2603:10a6:20b:3e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 11:08:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 11:08:53 +0000
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
X-Inumbo-ID: 856ea8eb-8dde-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lixExJ2+jZw2/E6prdflagAK6FhwxZvOKKO0SfgS0Bj5sgZYjAwbfCePf3GOJK0y9PhrgpU6UHTXrYvQGMf38nTES+4mr0wF9Z8KL8jQg3pG+qDLl6tzXrncj1z8ZepkZgkloZwGpzjwDfQJKThg5er5PLgeWEFTV44Xopk6qRqiBe+ZHt86IfkBER1s1KYSDf6ugS1vTJK1csrimv9SdofB/7UOe7eybPdc+Ld1Prbl+3gkmOui3dEhAFHQIv+kO6xB4ghmOV+AMd7BlGI2wRK8SGOViUsWuMhn/KaBLkw02gHP1QE/RD+nYNMtYFgrS/kjqIE7yiGLOcTpyT6PSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwrCA2CBrXdPl43QS9iokM9F6epYCSa2vyZSt+7U2aA=;
 b=aOPghqRxBsVC6C4WWeedcF0DX3unupQj6IZdFwzJVIRjo9g4P/w8N+OfUIoKAJpyPg+BCQZVAIK9IUlL5REXkQ4UaTo8Si9ccAgG4atTwIzgOgoDFKp2nERn5f1prbA5yl9P2G6HwOF4jHLl1yccYd0wFueVPqf8jIp1sWw5U5fCu7eQ6NV1BVevWwejYxuC9W7MhpV5BJ/SyVk0kHh+Ixy2s1F99XsWDmWK4M0C2dSMbtElLXWCldgklNYXUVu26HYcKvKpEQRnN22+VcWITb/lQguTpeqWSnBi4BEcpk7iLjf2GDf14fyOvhnx7psXATdq1OFePSPo5kqgMIqOiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwrCA2CBrXdPl43QS9iokM9F6epYCSa2vyZSt+7U2aA=;
 b=kHnXY6GxomzkwSZbC/4F6cMxoo13eWrX/jdzgexUV93H3IfAuwbhqdYYwP79wuxKqETWUiV4hKUYREuDoM8vTluc8jJ126eAjXXB7ZpfzN9diNOCIq85mdJEinoCwxYUhsE58gsuHuZpmCxO4CNWdEchnUbzUOiC6zfTxZSpi9lY2W5DuyYyemy6HLat6oyTMrLadAqgsyInf8LPl40mIFq4MSIR9mFkmf2R0qHJbs3uKsk/98RUDZ6XMIuOItnkyuCEAbELLbh/9T2p7okU1xaGmzAlXx4JbFviLcQc0thot4Sk2KfmL3M6S/lr1cLsGilpUfklaAQ90+auO3hAMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <407bb556-3951-4274-b304-413938ac7d76@suse.com>
Date: Tue, 28 Nov 2023 12:08:53 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 6/6] x86emul: support USER_MSR instructions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <e13004ac-22af-411e-a5d0-907a2a0301c5@suse.com>
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
In-Reply-To: <e13004ac-22af-411e-a5d0-907a2a0301c5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ded75e-4ad5-4ead-d9a5-08dbf002688b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	geFgr7nXrbUUaV8xT3QAD47EXCERWKh/DbzRVVrXF+SIPwWRwY2TXZExBNniSmforZOPhW1duX9zMoNqOaPSQgOaTzG1UxoKicTEOQpWgGtUQCzIxG32rjaoL66qyIwpl7FNgWiMaQ9CGxGIFA5egwaLkrsVItUOHa+jYY0ysRM+OZuWoWVV2fhcyqgqbZ6kR2tG38g+OpQivRygWhztYOE4MZwjtQXY+FqSRXF6w8pOufqRDeFMW+XNjVPZ4WaN019q6mLLUCCgdofe6WufvPuiEuT4pyySe90428yp0rjmLKtTS8peLi0bmeZBCReTafxDyYEcJEunQpJmZDYdwbmqv6ln10t2GRme/ygoQuxucWyOi56qa8VBDooYZu/I2cLomAVogLH2XJ8ZS2H3cScB/d4NA6nnR/AbcCpTpF05ZJTFEoo7xlNrgMhFwxRvkWjAIPu9B5fjOgE5Rd6MeFDEWmh/aOpphpTZJSc1XN52dOWAi7MrwofWeLyWAEFEZLOewPnyoKw7mcJCqB3ZN96beEENsKYfJ9E1usq8Abj1G4XM93P8EFi+Oyt5kH7WNvA+i4+ZSdbxeBrUgFgR9X9DJPDRS8ZLCkEBHks6I5zQ59pNNAwSIdpYYqcUjP09c9mtMjHnMoXoM8rbkzZOaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(31686004)(26005)(2616005)(478600001)(6486002)(6506007)(6512007)(38100700002)(86362001)(5660300002)(31696002)(36756003)(41300700001)(2906002)(66946007)(83380400001)(30864003)(66476007)(66556008)(316002)(8676002)(6916009)(54906003)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czA2bHBTYnplRThRZHFSMGQ5dit4blF2Y2NzMnBmdGdsUGRuaGMreVAxcmMx?=
 =?utf-8?B?bjhUMUFVak5HV1BKdm1kZE8zR09ZV3lQTHB2dlNRZ1VqRC9Pb3dJTGVkV1dL?=
 =?utf-8?B?SGI2ZE9yZ1B0OEZmRCsyOTAzSW1RMjRTNm9pMEJNZUNKbUtpcmw4aXhsTzZK?=
 =?utf-8?B?ZVBIclFFYjl0RU05SkJKTzVOVjFFakFaS0JSTmhPUUh6WTk3bis5emluNDN3?=
 =?utf-8?B?SXAvRVY5OTRuMmxaOXgxUHJRdms2UFNpdHRRYWk2b2dTVks1aDMwdVh3dEYv?=
 =?utf-8?B?YVZmWGZmNVc0NXNvR1I1Tkc2SlBQQU1oUEZXdGlRTnNTOHZwZm5nMXJQSVFO?=
 =?utf-8?B?QmlTeFFFWVRMU3ZUWTNKbW5ldFh6d1Y4a0xxbWhDVmtOa1JkNTIwKzdaenpS?=
 =?utf-8?B?TjNqSkRZb0txLy9DV0dYb0kxRjVJWXYvTkZWdTdwL21UbjQvemJPSGFkQmw1?=
 =?utf-8?B?Ui9UTW4zVUtTeFRQU2o0SGUwSXFmYUFDTU5rM1JZRUVyRXJ1VmtPdTUvbkFT?=
 =?utf-8?B?anp2bzVZS3krUjZjbS82cTFoVUw5ZDA5d1hqNVYrZWpCTmVDeUdHVGtWNkJV?=
 =?utf-8?B?MzZsaVlhZUUzUHNMeTJLcTN5Z09BWHlOVG5DREFuakUzS0lqSk1RZi9ZbDBF?=
 =?utf-8?B?OFhhUjZJMkpDa0FNTTJXSlF3WitrY3I3Y1RlWTZXc0FuWTJHSE5idDVzaHM4?=
 =?utf-8?B?RVl5clhVNXFDWVZKTkxEUkJMUyt6RUN4blV6UFVFMWtKd21hMzc3Q0lXSTNB?=
 =?utf-8?B?dDNJT1FKak9KMVNtMzQ2NGhTSGF1SHJkUS9Nc0hEeERpRkdvWUxOMTMrcFhn?=
 =?utf-8?B?Y0hKa2ROakpoZDBwM3NpTWozK2xpV1hwZ29pVWp0eWgyLzYrdElrVEpxbDNx?=
 =?utf-8?B?QVQ1N0ZrQjJMWVd2UCs1N0ZEYkVmdzBxSGF6MkFnY0pnMWp6K1FlTDFlaVhM?=
 =?utf-8?B?UHVyWDl6OGNlUHpxQUpQeFQzcThBbFNQTFJZdkVsL3NTSEhBaDFMVS9IeXNl?=
 =?utf-8?B?WGJ4L0tObklmVEtMaVVIdWtkcHhWdGJaVzlLSTJFMlk2NkR2aVZXSmVrV1c0?=
 =?utf-8?B?WldaT2p3SHhWTDZWNFBaa1FTeGl2RU5aNkltZEpoQm9HV0RHcFhRQUtZRkVK?=
 =?utf-8?B?MDRTUUtMaFRRY0FLM21vYXFHaE0yZkxBYXdSRUVZZnBuK1BXNGlxVXAyakp0?=
 =?utf-8?B?TmtnVDZMVDVESWhPRkh2dXZMenV3bUh3RnNoK0VCdGI5OWVhYzhremtCa0Y2?=
 =?utf-8?B?c0NXT1FKUll2M2N6RzVuWDVrMGJTeVlGTmhUTlNJc3hxeGNTb1c0bTZNVjNP?=
 =?utf-8?B?b2UyZDQxUkxxdCtwZXdqcWE0UTA2VEM2bGdLUXB2bmV1ckpEcktaMVhoZHNu?=
 =?utf-8?B?Sm54M0VRTk9IY0ZjQUlESG5hVExlN0t4M0NiREJkd1N5bFVxMXZ2eHV3SlFh?=
 =?utf-8?B?aDRnMTZtRVZjdFpnczFLQ0lqMDUzYVZMRkZSZjNqQVpiT1Y5TDBTV0xiOGxS?=
 =?utf-8?B?QjhBMTNwSkZTalBvTzhad3RHRDl6Tzk2TFpROFA5alpTYUdHSWgzRUdocTBq?=
 =?utf-8?B?RWZwcExtb3JCS3pBanV3RUhpQmJoUlErYU04dmJDZDk5RHQra1poaGVwQkFZ?=
 =?utf-8?B?RnNrN3AxMGNPMzdDeXg1bkYzcjVHTVBOYnlEWEdnOW9kdjRvNVl5OGN5bzdu?=
 =?utf-8?B?dFRLdmp6R1VBTHFoamhnaUtmR2VRKzdvZktvenFYbWJYenZld2sza1ZnU3Er?=
 =?utf-8?B?d2hRZlA0Q1JiekE0cDRrVGVoeXpBb1lGR1BTZFkwK0Zjb0t6T1BhamdhUStz?=
 =?utf-8?B?V0VBVC8rSCszTHEwVTcvNXRHQjNmR3FnSTZ3RENFRlJTNi9WZDZtdkxTUGFj?=
 =?utf-8?B?L3RsZHVJYmNZeGtzRS9HOHAwVTE1ak12d0orUTVVa3lmaVJ4RFRjNVlMN205?=
 =?utf-8?B?NUhkcU9sRnpwQkxXemR1QjdOakhKdDZjOFk2Q1RPcEh1VEVWTnNURllBeTFQ?=
 =?utf-8?B?dW95bWRPWjZ6SEVEemxOanlHbkJkVkZqaU9GK1dHaU1pdGVWZk5DaFl1SEd5?=
 =?utf-8?B?NHpicE9pNDZtYnIweHZUUTFHa1JPWnZyaTlrM2hvNkg4MnNJbVA4WTJUM1FB?=
 =?utf-8?Q?nYylsSRKQPGgyYu7v1Pi5j4/d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ded75e-4ad5-4ead-d9a5-08dbf002688b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 11:08:53.8758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYZITt69cRQdiw/UA2X6v6lTZV5ji3t8sWaTs6PZ111q1u1G6LKn0VOczsiggzkFyBhP29ApIbp9lbTRCsczSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8276

While UWRMSR probably isn't of much use as long as we don't support
UINTR, URDMSR may well be useful to guests even without that (depending
on what OSes are willing to permit access to).

Since the two VEX encodings introduce a lonely opcode point in map 7,
for now don't bother introducing a full 256-entry table.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The retaining of (possible) #PF from the bitmap access is "speculative"
(the spec doesn't mention #PF as a possible exception; conceivably this
might also need converting to #GP).

I'm a little wary of the "MSRs Writeable by UWRMSR" table that the spec
has, and that our code thus also enforces: As new MSRs are added to that
table, we'll need piecemeal updates to that switch() statement.

The choice of using APERF in the test harness is connected to the also
pending RDPRU patch, where the register needs handling anyway.
---
v3: New.

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -224,7 +224,7 @@ static const char *const str_7d1[32] =
 {
     [ 4] = "avx-vnni-int8",       [ 5] = "avx-ne-convert",
 
-    [14] = "prefetchi",
+    [14] = "prefetchi",           [15] = "user-msr",
 
     [18] = "cet-sss",
 };
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -864,7 +864,9 @@ static const struct {
     { { 0xf6 }, { 2, 2 }, T, R, pfx_66 }, /* adcx */
     { { 0xf6 }, { 2, 2 }, T, R, pfx_f3 }, /* adox */
     { { 0xf8 }, { 2, 2 }, F, W, pfx_66 }, /* movdir64b */
+    { { 0xf8, 0xc0 }, { 0, 2 }, F, N, pfx_f3 }, /* uwrmsr */
     { { 0xf8 }, { 2, 2 }, F, W, pfx_f3 }, /* enqcmds */
+    { { 0xf8, 0xc0 }, { 0, 2 }, F, N, pfx_f2 }, /* urdmsr */
     { { 0xf8 }, { 2, 2 }, F, W, pfx_f2 }, /* enqcmd */
     { { 0xf9 }, { 2, 2 }, F, W }, /* movdiri */
 };
@@ -1502,6 +1504,9 @@ static const struct vex {
     { { 0xcf }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineinvqb */
     { { 0xdf }, 3, T, R, pfx_66, WIG, Ln }, /* vaeskeygenassist */
     { { 0xf0 }, 3, T, R, pfx_f2, Wn, L0 }, /* rorx */
+}, vex_map7[] = {
+    { { 0xf8, 0xc0 }, 6, F, N, pfx_f3, W0, L0 }, /* uwrmsr */
+    { { 0xf8, 0xc0 }, 6, F, N, pfx_f2, W0, L0 }, /* urdmsr */
 };
 
 static const struct {
@@ -1511,6 +1516,10 @@ static const struct {
     { vex_0f,   ARRAY_SIZE(vex_0f) },
     { vex_0f38, ARRAY_SIZE(vex_0f38) },
     { vex_0f3a, ARRAY_SIZE(vex_0f3a) },
+    { NULL,     0 }, /* map 4 */
+    { NULL,     0 }, /* map 5 */
+    { NULL,     0 }, /* map 6 */
+    { vex_map7, ARRAY_SIZE(vex_map7) },
 };
 
 static const struct xop {
@@ -2411,7 +2420,8 @@ void predicates_test(void *instr, struct
 
                 if ( vex[x].tbl[t].w == WIG || (vex[x].tbl[t].w & W0) )
                 {
-                    memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+                    memcpy(ptr, vex[x].tbl[t].opc,
+                           MIN(vex[x].tbl[t].len, ARRAY_SIZE(vex->tbl->opc)));
 
                     if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L0) )
                         do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
@@ -2421,7 +2431,8 @@ void predicates_test(void *instr, struct
                     if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L1) )
                     {
                         ptr[-1] |= 4;
-                        memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+                        memcpy(ptr, vex[x].tbl[t].opc,
+                               MIN(vex[x].tbl[t].len, ARRAY_SIZE(vex->tbl->opc)));
 
                         do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
                                 vex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
@@ -2432,7 +2443,8 @@ void predicates_test(void *instr, struct
                 if ( vex[x].tbl[t].w == WIG || (vex[x].tbl[t].w & W1) )
                 {
                     ptr[-1] = 0xf8 | vex[x].tbl[t].pfx;
-                    memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+                    memcpy(ptr, vex[x].tbl[t].opc,
+                           MIN(vex[x].tbl[t].len, ARRAY_SIZE(vex->tbl->opc)));
 
                     if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L0) )
                         do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
@@ -2442,7 +2454,8 @@ void predicates_test(void *instr, struct
                     if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L1) )
                     {
                         ptr[-1] |= 4;
-                        memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+                        memcpy(ptr, vex[x].tbl[t].opc,
+                               MIN(vex[x].tbl[t].len, ARRAY_SIZE(vex->tbl->opc)));
 
                         do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
                                 vex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -684,6 +684,7 @@ static int blk(
 
 #ifdef __x86_64__
 static unsigned long gs_base, gs_base_shadow;
+static unsigned long uintr_timer;
 #endif
 
 static int read_segment(
@@ -718,6 +719,15 @@ static int write_segment(
 
     return X86EMUL_OKAY;
 }
+
+static const uint8_t __attribute__((aligned(0x1000))) umsr_bitmap[0x1000] = {
+#define RD(msr) [(msr) >> 3] = 1 << ((msr) & 7)
+#define WR(msr) [0x800 + ((msr) >> 3)] = 1 << ((msr) & 7)
+    RD(0x000000e8), /* APERF */
+    WR(0x00001b00), /* UINTR_TIMER */
+#undef WR
+#undef RD
+};
 #endif
 
 static int read_msr(
@@ -727,10 +737,22 @@ static int read_msr(
 {
     switch ( reg )
     {
+#ifdef __x86_64__
+    case 0x0000001c: /* USER_MSR_CTL */
+        *val = (unsigned long)umsr_bitmap | 1;
+        return X86EMUL_OKAY;
+#endif
+
     case 0x0000002f: /* BARRIER */
         *val = 0;
         return X86EMUL_OKAY;
 
+    case 0x000000e8: /* APERF */
+#define APERF_LO_VALUE 0xAEAEAEAE
+#define APERF_HI_VALUE 0xEAEAEAEA
+        *val = ((uint64_t)APERF_HI_VALUE << 32) | APERF_LO_VALUE;
+        return X86EMUL_OKAY;
+
     case 0xc0000080: /* EFER */
         *val = ctxt->addr_size > 32 ? 0x500 /* LME|LMA */ : 0;
         return X86EMUL_OKAY;
@@ -766,6 +788,12 @@ static int write_msr(
 {
     switch ( reg )
     {
+    case 0x00001b00: /* UINTR_TIMER */
+        if ( ctxt->addr_size < 64 )
+            break;
+        uintr_timer = val;
+        return X86EMUL_OKAY;
+
     case 0xc0000101: /* GS_BASE */
         if ( ctxt->addr_size < 64 || !is_canonical_address(val) )
             break;
@@ -1565,6 +1593,62 @@ int main(int argc, char **argv)
          (gs_base != 0x0000222244446666UL) ||
          (gs_base_shadow != 0x0000111122224444UL) )
         goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing urdmsr %edx,%rcx...");
+    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x38; instr[3] = 0xf8; instr[4] = 0xd1;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rdx = 0x12345678000000e8UL; /* APERF; high half to be ignored */
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[5]) ||
+         (regs.rcx != (((uint64_t)APERF_HI_VALUE << 32) | APERF_LO_VALUE)) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing urdmsr $0xe8,%rdx...");
+    instr[0] = 0xc4; instr[1] = 0xe7; instr[2] = 0x7b; instr[3] = 0xf8; instr[4] = 0xc2;
+    instr[5] = 0xe8; instr[6] = 0; instr[7] = 0; instr[8] = 0;
+    regs.rip = (unsigned long)&instr[0];
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[9]) ||
+         (regs.rdx != (((uint64_t)APERF_HI_VALUE << 32) | APERF_LO_VALUE)) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing uwrmsr %rdi,%esi...");
+    instr[0] = 0xf3; instr[1] = 0x0f; instr[2] = 0x38; instr[3] = 0xf8; instr[4] = 0xf7;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = 0x4433221100001b00UL; /* UINTR_TIMER; high half to be ignored */
+    regs.rdi = 0x0011223344556677UL;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[5]) ||
+         (uintr_timer != 0x0011223344556677UL) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing uwrmsr %rsi,$0x1b00...");
+    instr[0] = 0xc4; instr[1] = 0xe7; instr[2] = 0x7a; instr[3] = 0xf8; instr[4] = 0xc6;
+    instr[5] = 0x00; instr[6] = 0x1b; instr[7] = 0; instr[8] = 0;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = 0x8877665544332211UL;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[9]) ||
+         (uintr_timer != 0x8877665544332211UL) )
+        goto fail;
+
+    printf("%-40s", "Testing uwrmsr %rsi,$0x1b01...");
+    instr[5] = 0x01; /* UARCH_MISC_CTL (derived from UINTR_TIMER) */
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = 0;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_EXCEPTION) ||
+         (regs.rip != (unsigned long)&instr[0]) ||
+         (uintr_timer != 0x8877665544332211UL) )
+        goto fail;
 
     emulops.write_msr     = NULL;
 #endif
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -24,6 +24,10 @@
 #define  APIC_BASE_ENABLE                   (_AC(1, ULL) << 11)
 #define  APIC_BASE_ADDR_MASK                _AC(0x000ffffffffff000, ULL)
 
+#define MSR_USER_MSR_CTL                    0x0000001c
+#define  USER_MSR_ENABLE                    (_AC(1, ULL) <<  0)
+#define  USER_MSR_ADDR_MASK                 0xfffffffffffff000ULL
+
 #define MSR_BARRIER                         0x0000002f
 
 #define MSR_TEST_CTRL                       0x00000033
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -901,7 +901,7 @@ decode_0f38(struct x86_emulate_state *s,
     {
     case 0x00 ... 0xef:
     case 0xf2 ... 0xf5:
-    case 0xf7 ... 0xf8:
+    case 0xf7:
     case 0xfa ... 0xff:
         s->op_bytes = 0;
         /* fall through */
@@ -946,6 +946,18 @@ decode_0f38(struct x86_emulate_state *s,
     case X86EMUL_OPC_VEX_F2(0, 0xf7): /* shrx */
         break;
 
+    case 0xf8:
+        if ( s->modrm_mod == 3 ) /* u{rd,wr}msr */
+        {
+            s->desc = DstMem | SrcReg | Mov;
+            s->op_bytes = 4; /* Describes the MSR index. */
+            s->simd_size = simd_none;
+        }
+        else /* movdir64b / enqcmd{,s} */
+            s->op_bytes = 0;
+        ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+        break;
+
     default:
         s->op_bytes = 0;
         break;
@@ -1251,6 +1263,16 @@ int x86emul_decode(struct x86_emulate_st
                          */
                         d = twobyte_table[0x38].desc;
                         break;
+
+                    case vex_map7:
+                        opcode |= MASK_INSR(7, X86EMUL_OPC_EXT_MASK);
+                        /*
+                         * No table lookup here for now, as there's only a single
+                         * opcode point populated in map 7.
+                         */
+                        if ( b == 0xf8 )
+                            d = DstMem | SrcImm | ModRM | Mov;
+                        break;
                     }
                 }
                 else if ( s->ext < ext_8f08 + ARRAY_SIZE(xop_table) )
@@ -1619,6 +1641,7 @@ int x86emul_decode(struct x86_emulate_st
             s->simd_size = ext8f09_table[b].simd_size;
             break;
 
+        case ext_map7:
         case ext_8f08:
         case ext_8f0a:
             /*
@@ -1833,6 +1856,7 @@ int x86emul_decode(struct x86_emulate_st
 
     case ext_map5:
     case ext_map6:
+    case ext_map7:
     case ext_8f09:
     case ext_8f0a:
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -185,6 +185,7 @@ enum vex_opcx {
     vex_0f3a,
     evex_map5 = 5,
     evex_map6,
+    vex_map7,
 };
 
 enum vex_pfx {
@@ -241,6 +242,7 @@ struct x86_emulate_state {
         ext_0f3a = vex_0f3a,
         ext_map5 = evex_map5,
         ext_map6 = evex_map6,
+        ext_map7 = vex_map7,
         /*
          * For XOP use values such that the respective instruction field
          * can be used without adjustment.
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7109,10 +7109,68 @@ x86_emulate(
         state->simd_size = simd_none;
         break;
 
-    case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 */
-    case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 */
+    case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 / urdmsr r32,r64 */
+    case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 / uwrmsr r64,r32 */
+        if ( ea.type == OP_MEM )
+            goto enqcmd;
+        imm1 = src.val;
+        /* fall through */
+    case X86EMUL_OPC_VEX_F2(7, 0xf8): /* urdmsr imm32,r64 */
+    case X86EMUL_OPC_VEX_F3(7, 0xf8): /* uwrmsr r64,imm32 */
+        generate_exception_if(!mode_64bit() || ea.type != OP_REG, X86_EXC_UD);
+        generate_exception_if(vex.l || vex.w, X86_EXC_UD);
+        generate_exception_if(vex.opcx && (modrm_reg || vex.reg != 0xf),
+                              X86_EXC_UD);
+        fail_if(!ops->read_msr);
+        if ( ops->read_msr(MSR_USER_MSR_CTL, &msr_val, ctxt) != X86EMUL_OKAY )
+        {
+            x86_emul_reset_event(ctxt);
+            msr_val = 0;
+        }
+        generate_exception_if(!(msr_val & USER_MSR_ENABLE), X86_EXC_UD);
+        generate_exception_if(imm1 & ~0x3fff, X86_EXC_GP, 0);
+
+        /* Check the corresponding bitmap. */
+        ea.mem.off = msr_val & ~0xfff;
+        if ( vex.pfx != vex_f2 )
+            ea.mem.off += 0x800;
+        ea.mem.off += imm1 >> 3;
+        if ( (rc = ops->read(x86_seg_sys, ea.mem.off, &b, 1,
+                             ctxt)) != X86EMUL_OKAY )
+            goto done;
+        generate_exception_if(!(b & (1 << (imm1 & 7))), X86_EXC_GP, 0);
+
+        /* Carry out the actual MSR access. */
+        if ( vex.pfx == vex_f2 )
+        {
+            /* urdmsr */
+            if ( (rc = ops->read_msr(imm1, &msr_val, ctxt)) != X86EMUL_OKAY )
+                goto done;
+            dst.val = msr_val;
+            ASSERT(dst.type == OP_REG);
+            dst.bytes = 8;
+        }
+        else
+        {
+            /* uwrmsr */
+            switch ( imm1 )
+            {
+            case 0x1b00: /* UINTR_TIMER */
+            case 0x1b01: /* UARCH_MISC_CTL */
+                break;
+            default:
+                generate_exception(X86_EXC_GP, 0);
+            }
+            fail_if(!ops->write_msr);
+            /* NB: Cannot use dst.val here, as op_bytes was set to 4. */
+            if ( (rc = ops->write_msr(imm1, *dst.reg, ctxt)) != X86EMUL_OKAY )
+                goto done;
+            dst.type = OP_NONE;
+        }
+        break;
+
+    enqcmd:
         host_and_vcpu_must_have(enqcmd);
-        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         generate_exception_if(vex.pfx != vex_f2 && !mode_ring0(), X86_EXC_GP, 0);
         src.val = truncate_ea(*dst.reg);
         generate_exception_if(!is_aligned(x86_seg_es, src.val, 64, ctxt, ops),
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -315,6 +315,7 @@ XEN_CPUFEATURE(MCDT_NO,            13*32
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
 XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
 XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
+XEN_CPUFEATURE(USER_MSR,           15*32+15) /*   U{RD,WR}MSR Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -275,7 +275,7 @@ def crunch_numbers(state):
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
         LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, LKGS, CMPCCXADD,
-             MSRLIST],
+             MSRLIST, USER_MSR],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.


