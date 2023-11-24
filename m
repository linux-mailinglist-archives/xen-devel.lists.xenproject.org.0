Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D29E7F73BB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 13:25:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640629.999095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VEl-00032d-AP; Fri, 24 Nov 2023 12:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640629.999095; Fri, 24 Nov 2023 12:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VEl-0002zq-7j; Fri, 24 Nov 2023 12:24:47 +0000
Received: by outflank-mailman (input) for mailman id 640629;
 Fri, 24 Nov 2023 12:24:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6VEj-0002zk-QJ
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 12:24:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 732bfd11-8ac4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 13:24:44 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 12:24:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 12:24:42 +0000
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
X-Inumbo-ID: 732bfd11-8ac4-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4WaIXiC0opEe28L5Jo86l0Kcp+hpkesA+JyEPLzkI1v67x152TwhQl9JGfst3Q8dYXSf+HC0Ciywel3Y0AOuSfE0dgBxqqeiCwRRgBzK0Gsvphc+UQ/y236/VJYXQtQRiRagbngnUarvSUneZqDzkmTlfKsONwk2+859LSbmue5uL1qjaf9UX0D55XUARyi2B6o7wcXqrWLhwXMv+2pulndhf853b3/ToOGGxvnQRSQJ6inf8t97bWdoA5ZEBe9H6Ds/PQA2oaSmFlg7iEfNWTldB3N2YBf1y1+v7ImJHvCBLKu0YZwXSY6v8q/XgV/LhG1BqfgQNvuAFX82PlTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSxjC4ym79N1JhD4sLaOhJd9vToL+iUqkkHWaWMarBQ=;
 b=HUTIDxGG2FJD6S4VoqegHfjnmR0KIBh98xQNAYigXCY5Xp4XAmjWHxItP+2UIetwBWEB8aBbcS8n8HB5oBy4ltC1b+Z83pMMh6LTR36MJ4fw1i2ct5oY6daQAUplEhiJKMMlW6Ec56LBEYHyW1PYf5qKytwWyAogla4AjTaGRoZhZonN1CbYP0lUZGfTjMYJGgYZ5xA14LPP8CazOJfYLzb2b7SVuN/wMVxAzIeUJ+VslTRkDR7oXpp8D+usWuNhJ3QN6hnK+O922LoaNSF4rBZi/DFyv/BYdrKEDPzP3tGFcWwukKsBFB6Cd9Q5ZmhqVLJn4hxzMJ9ySxQQPP1k4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSxjC4ym79N1JhD4sLaOhJd9vToL+iUqkkHWaWMarBQ=;
 b=teLxYfZVbxIayZ3A8KXpSryYV9usGUT+jM7UFA/ow18EeWf/ARyzWFxp4mJxXmjudyWZOeShR8bJe0V5NfnckOq13SYOxP1y2hwDH8hrRpPBk1chkpg2+2RSA4Dijl8r5JUUn5DjDpeg0E8iC30hAo2CNu0PapCWWCAXl4hzvPdpZUZba+VFgfQamqz139x5z5mg0zB2Hy0jK7BqpgBlxLg6XvbRWas5zxuYqWvSMPJvKHgwOQiz4sDSEf2AiH8nqxvbDEIgsW4RgA/eTIfV8/rSPxknE2G2bRrVOg//YYCG/tME1Imr4Xt72NVgP+4m8KuDJaKx/aSDcELw0UWd4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ced05080-ef2b-4288-93be-74535a7a3982@suse.com>
Date: Fri, 24 Nov 2023 13:24:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Clang-format configuration discussion - pt 2
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@cloud.com>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <CA+zSX=YL0fjM+ZTEoXNpzQ9iFKFwzdZRR-QsyQAZCQVeOGdj6A@mail.gmail.com>
 <DE78DF95-3E57-4283-8252-01A0BA2219F8@arm.com>
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
In-Reply-To: <DE78DF95-3E57-4283-8252-01A0BA2219F8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffc66af-f4fb-45ec-6be0-08dbece855e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dwy2ZeZcFQoC/CLfqM0tDddDY6B7jSVguVQZjpT/RwmmOMrvZK68Rkq4sHTgm23WqxwsPuMDi0/bfxCLz1npFqjkKgbU8kelNMzCPTNwyqyy1u9oUPRl9aGli+4btvVFMRtWnsICIr9Xv5N8n4qO5KFMUD1dRMap5h5cwID/6dwzS8+CYX5UuTjwAmmBc0DFZByPXoKFoSCqR50tXSN5JBRxllsS8MSWRip0MMIpN4Cf7zJJ0O9dCfSF82Ba/s88q9s1dGGDMqDlDJTz0XybJIkW+YHhqMlFkRsbCkntIWpZBlEzddnDiB9ie948FcUlbNfgZINvM0kmI0lAOh9I2P0nt064nZ3hMT1Wa1fXCY9v0BDZSLn9A81vyVgm7mo/VTG6ffNEeAw9zvIU4dOMCyL8fy0JHhSbIMAcYT+TLV1/d9FmoW/XVVSapno89Mi35NYaPinwnRxP/dPeqQjsDw3XnPSEPn+CcdInBAjeKV2Ugo/h2A49xXjVDPsfHnFwDf5UlLegYeUd9w9BWomuw+kKenbtNSim/r/YzF9Zl1vwKIwgH98qyidHYQNFAMIul8tgioOTrjuRGmIPLWK6ErfDB0yye5DIvSJJNr91DWwp0oV6s4mTJLyL1AaKwEmxpt2sHxf+PVVZENmnDC3cLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(39860400002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(2906002)(31686004)(7416002)(5660300002)(6666004)(36756003)(6512007)(478600001)(86362001)(41300700001)(4326008)(8676002)(8936002)(966005)(6486002)(38100700002)(6506007)(2616005)(53546011)(83380400001)(66476007)(316002)(31696002)(66556008)(6916009)(54906003)(66946007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3g5YkR1b1JPZnk4c1pqVHEyUUVkK3diRVZ1a0RieUIwRUtVdi85ZzJxMml3?=
 =?utf-8?B?TjlCM2ZTaWFCb1BzaXBReTB1cFI2NkkxZ1RqNHZDRFNuWEoxOUZ3NHFvZDNS?=
 =?utf-8?B?VTZqcE94a2JQR0UzTEVUY3VwYW5rS3RzWW1mZWhQbXNCT2VDNlJBMlJ6cVdM?=
 =?utf-8?B?TzVlVkFnb2RVdmJzaDlUT1ZIWWdhR1VERjFEM0pYRmRTY1JkRU85NnlhazRp?=
 =?utf-8?B?VjhOUlJmUm5ya3prcmU4WUJnQmFQdzIwdDErYUdCeGpROUJtVTNRVEVQVStl?=
 =?utf-8?B?WGJ6THhPSUxNQklGK08wNExZSFd1OHdlUGRCVmVRZmhVSDRwWUdnb0N2cm1C?=
 =?utf-8?B?SXRTeFROUnkyK1htT3V1VVllL2dBVEdtV2gxZlRNcjZiMkJEVlMrMVY1UVpo?=
 =?utf-8?B?bWNyODFMSXNqeWJnRDA2QjdtMW41aHdqUzRMdkpROXF2dTNrRSs5SVdBUTVv?=
 =?utf-8?B?YWUybFE0SFNWeDlMd1ZwbHROdU1ONGRqVGgxRWcrVjJuU0hqWGJVTVRQTFFs?=
 =?utf-8?B?cW9YMnlKRDNnWTNmcE5TaUg4TEczbFJVRkt1a0d3Y25haVNmOE1pYU1nQ2JV?=
 =?utf-8?B?QmNGSVprTWhKS1ZWVCtNclBTdW5UZlduaU5GRTNVM21nbnAzQzlrREQ4Skt1?=
 =?utf-8?B?UzBERlp6Q1k2a3BuSHhJNjQzY1lOZXV6OFNHMUttNEk4OUdUM204bHhoU3pI?=
 =?utf-8?B?c0MvNXV4bVUzaXJvUGo2M2VXWVRwZlBpMU9OU0MyaStwRXh5Y3B4dWhnRThw?=
 =?utf-8?B?LzQwNEQ2ekxyajVDejRIbVg5MzJYdCtLc2dxbkdXOHlyc0hFb1ZnZVltTkQr?=
 =?utf-8?B?NlgvR2Jyb2xuWGRycENnOFR1NUJaRldMSUlSampXN2ZRQUtVVnZyZUFWdUMz?=
 =?utf-8?B?QktGZE54bWJPejZNU3NaMkQrVVArOXVWd2hMS2p0aVlIY3FjU3NUY0RDamtL?=
 =?utf-8?B?d0R0c2ppbXVIbHVqVHNPbjByd2ZsR2tkYlJ5OU53a2k3Ylc4UmlacGxyQWRD?=
 =?utf-8?B?bnFiakM4bEpGYTZUaGp2RGcxQlFienluMlgxWHRzVnd2bDFuSmRMRjdRQURU?=
 =?utf-8?B?cTBwUnBpSkVSSml2d3gxODAzUE9ZRDJRRWdmaGMweEZQR3NmWkxhQnc3d0dr?=
 =?utf-8?B?Um1kanlrSnEzKzU2ZmNGUzhUUVB2SHpQSlY4V2UrWGtNcnEyU0pWWlJ0cm0v?=
 =?utf-8?B?SktQclg2RU10Z3cyVFVDdnl5V1U5U0QvWHRHbXZ4WnhNM2tCTjhYQ3ZQR3RV?=
 =?utf-8?B?QU5BRHowYWxrWUlEZ1E4UVprWDF5aUpiK2VTZklEQituc295Wmp5cFdia1lt?=
 =?utf-8?B?elRRWU5EZTRzQUtQcHg1WHdydEtudXVSYjRqOGw0amo4RDJUTlR0bUlNM1BG?=
 =?utf-8?B?aTZvWnZPSi82K29xZG05RldGOHRZMm5qWTBxUVFJSVd4cFZPcEpkRkZIbTRv?=
 =?utf-8?B?VmljMWQ0bEMwRlArMzY5RFR1VEtENkVQSzFyTFduQk5aeG5vY01pZTB6SmZC?=
 =?utf-8?B?SXg2TlU2ZlZDOTN6M0syRXJ2YTBrRnNKMmIvYUxVcDlTSksxMGFjR3RlcFRR?=
 =?utf-8?B?bWpUTUpZelZqeFBBTGZQMUtoZ1NwK1N6UzlLZDRWOXJHVlg5M3VLd20wSHhH?=
 =?utf-8?B?eSszb3pteVRlS2M5bXFmUzN4WGZyZncwZjZOSHBzR2JyNDZlelp2aVpJWExh?=
 =?utf-8?B?cGg3dnBsNUpKbk11OW1pNnF4U1hzV3VtTXNmbmZXSTJqMVF1bVFEYVlkZnVV?=
 =?utf-8?B?cUVIWWpaSWRob2xMM245ekhYZUNPdjBQc1hGQVVEVk1odi9FeWRTQzNRRUdV?=
 =?utf-8?B?c2VEeHpqUkxleW1pVHhPaUp3SEZrTDRPcEhpOHZEVTRqb3R2Q09uUnlzYXJG?=
 =?utf-8?B?K3UzUFNTaFl3WTFkRjI3aGlQVGRRMlJ2Snlja3p5YTBUVTNaOHJNaERja0hT?=
 =?utf-8?B?N1JaNzBLYVh5YklYTmxQM1NmcFJ1bnp1ZThQcmk0WjNpRTV5L1hiSEdlZ0hC?=
 =?utf-8?B?MkZrMytjQk1NMmllbWlKOTBvQ0Y3VlA2MzB6eXRyQ2JQZ0tMLzgxWmduQ0dY?=
 =?utf-8?B?cHJkSUs5eWt3b2hmWjU0WVQrREwxTnRnNlJHanVFeU02VzVSWkxCbnZnZ2Fa?=
 =?utf-8?Q?FAR5bz0vT1tfhmyTrJHhia/jE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffc66af-f4fb-45ec-6be0-08dbece855e0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 12:24:42.1652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4Ct17twHz0Q4BQ2Fs28SR+DsJgniFsSSQDO5ndf3MDFCWU/7UpMtNIt+xpf4S1j//uYL0PLXdR4dJe1Th1DAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075

On 24.11.2023 12:59, Luca Fancellu wrote:
> @@ -3333,19 +3318,18 @@ static int __init alloc_domain_evtchn(struct dt_device_node *node)
> rc = evtchn_alloc_unbound(&alloc_unbound, domU1_port);
> if ( rc < 0 )
> {
> - printk(XENLOG_ERR
> - "evtchn_alloc_unbound() failure (Error %d) \n", rc);
> + printk(XENLOG_ERR "evtchn_alloc_unbound() failure (Error %d) \n", rc);
> return rc;
> }
> - bind_interdomain.remote_dom = d1->domain_id;
> + bind_interdomain.remote_dom = d1->domain_id;
> bind_interdomain.remote_port = domU1_port;
> rc = evtchn_bind_interdomain(&bind_interdomain, d2, domU2_port);
> if ( rc < 0 )
> {
> 
> Assignment of bind_interdomain.remote_dom was aligned with the following line, but since the value
> of this configurable is “None”, clang-format is modifying that to use only one space before the assignment
> operator.

Neither here nor ...

> One example related to macros can be found on line 1663:
> 
> diff --git a/xen/arch/arm/arm32/insn.c b/xen/arch/arm/arm32/insn.c
> index 49953a042a..1635c4b6d1 100644
> --- a/xen/arch/arm/arm32/insn.c
> +++ b/xen/arch/arm/arm32/insn.c
> @@ -19,9 +19,9 @@
> #include <asm/insn.h>
> /* Mask of branch instructions' immediate. */
> -#define BRANCH_INSN_IMM_MASK GENMASK(23, 0)
> +#define BRANCH_INSN_IMM_MASK GENMASK(23, 0)
> /* Shift of branch instructions' immediate. */
> -#define BRANCH_INSN_IMM_SHIFT 0
> +#define BRANCH_INSN_IMM_SHIFT 0
> 
> Clang format sees the comment between BRANCH_INSN_IMM_MASK and BRANCH_INSN_IMM_SHIFT and
> even if before the value of the macros were aligned, it applies the rule of one space between the macro name
> and the value.

... here there is any change in the formatting on the lines in question.
I was first suspecting a possible issue with my mail UI, but
https://lists.xen.org/archives/html/xen-devel/2023-11/msg02132.html
looks to confirm the issue to more likely be on your end (apparently also
resulting in leading whitespace having been dropped).

Jan

