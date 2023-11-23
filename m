Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD1D7F5AAF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 09:59:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639448.996834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r65YS-0004DW-Fa; Thu, 23 Nov 2023 08:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639448.996834; Thu, 23 Nov 2023 08:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r65YS-0004Am-CW; Thu, 23 Nov 2023 08:59:24 +0000
Received: by outflank-mailman (input) for mailman id 639448;
 Thu, 23 Nov 2023 08:59:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r65YR-0004Ac-Nr
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 08:59:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97b21237-89de-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 09:59:21 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7491.eurprd04.prod.outlook.com (2603:10a6:20b:283::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.12; Thu, 23 Nov
 2023 08:59:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 08:59:18 +0000
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
X-Inumbo-ID: 97b21237-89de-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuuJ5dkGfalmi4/yY3WKYkFM6yh2/tHZCi2eK4uf2C1k5xrWRpqt7l9g9Dn6oMJm+lhignct4jFP5p/z2gkWhPnQOkh0hkuSFKxEgp22jUyNHnJQ9wgABvtsAm+2BAyfw4I8QMNGttoQSbSo7YhAt/wBdV2gSfSZIYfrqzyA1IZVEzwaF2P7ARwTuqPwNXsca6EWrUbgWpxVMvlu4YDX7MDuT3gl+qCB6sfpytm91FtrjeZiViXfUi7Rb/Un325gSXEM+7R73ZJ7r9WhfSZp9AP8/zZ70DzzsoGqS6OBWdmIieTHRw2Dm3UU0eqZnmsufHfwZHwhvpWwklYj4FFDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUwS8YtdcKR3ZozL4x8+P03QzR7X367404VRUQDFq/4=;
 b=TPRKSol8SXXpoXTBe2sbozkw6ARtPiRekYEEhBOo9q3jOypI+35df79w77rksIF+fBZ0+9Rra0FxZDjOJ5lE/pGqwnPLJp2qu1iuEHF02tvTlATu8DKgP84OkPldJU4vDTMymCJg1N5WRaq3ZjVX0sZGEQWK5CKHWBfDEpQO7S3OWswu6YfPB8Y8j9MXuJulykpNiyZ5kFKCQux5yl9p4U2E8vD8oYUo9fV31D7Yle6R6C4vVGvNvBYYitsPUrVcubeZjsquN4vh8C4Xe/R5tUbStThiTL7m6a/g/hPbqWyvWALMPtKp5YGqJ7ljRflr5/TethlCoa6tHrCg2tbEtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUwS8YtdcKR3ZozL4x8+P03QzR7X367404VRUQDFq/4=;
 b=l1c6FfamB2A3fz/DuE2K2/biTI0skD4mi5X997PRbmNArYw+s0Sh7MA8T0xFv5BXSkI02O3LE+VuKC3zH6jUKEoU6rPZUzzOuAWoiNgYVKP4/H3svBH6KN2hGgvIxuuvEsLf1tctNdUBaEXHowQp6O7juChgAMgt8339cbD2FflTNslrQiathfkxJHhv96L1K5GeXgXTrHz67FMFWWxBhc6Z2E2Jgo0uJ5xHVOZNycivGxXd25sCSjoMy6yL49LaqHVt/FlQRjWK16zB4ChyUTf+IJV9gr4Sqdk0Fjp/13doMIgLUPlgiV6T7g3zvgP2Pd5WwFogF38vmHAfd6ATfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b700af5-52d3-4014-94b4-af8700c73465@suse.com>
Date: Thu, 23 Nov 2023 09:59:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/5] xen/common: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1700209834.git.federico.serafini@bugseng.com>
 <ccc8b4bea515360e448f1975dadb326ad2e6c918.1700209834.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2311171851260.773207@ubuntu-linux-20-04-desktop>
 <a03a8d60-5e46-4ef2-9e35-cc6892d229ee@bugseng.com>
 <alpine.DEB.2.22.394.2311201602500.773207@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2311201602500.773207@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVYP280CA0028.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 47cc92b1-897e-4d3d-7746-08dbec0279dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0mvDzybyZNGjmzdYUML9crtodeDYp0SCzODy/DxSCxLwIo9wuzd3d94XoQrkPPHetOIbU5mejh8KPK175tePkPxtKmkMPNgRcF5PFHOGAKvFjO4x3B8+f10Hnb8AkctjkbLdZOVEfuuqO3IRO904n01zhVf9ytaXgms8WHBBKTa46JXtURMLIUzrcqv4kNdPwK79awzDmtnKM6kWwRHUurbqIALPrPSttaYsoTP5r5aMoLKN882aheX4f/yf0f3eXWY0RPgdrjOElVnyITN4DZrUOKTwj7FP3IJrGeadVsWgMi+5/3ot/rjpBfCVAWYpDdkObgRpRRtBqoaH7fSqv1W/anLmQTuuC2sPuPXAsODvpqZQSDQlvV8gC1jJseLsgJ/9OwF/0YnjW5WaJpFr3iGp16N4DQOWeBNx1/WARQiUfT9xnfaokcF668OWsbykXIEI9SZUkBUc/pE2f24AW/FRtES6W6XlJD7nSWjQPU3UchRwUVxeODF79Yqza12I0CjyeBbAWpK1DZvun/LipfKwgqFXBdjsfdPGVTvdgCfAOvBljSR5EWIWnPtrGQUI8Pjz3CEvcy1whN226Z5falrfPrECleeyrwyjWLvB5AfP+9MbnJyjhM7j5vX/QRvCmK/U5qj3l66eZRW+WWIprg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(26005)(83380400001)(6666004)(6512007)(6506007)(2616005)(53546011)(5660300002)(8676002)(4326008)(41300700001)(8936002)(2906002)(6486002)(478600001)(316002)(6916009)(66946007)(66556008)(54906003)(66476007)(86362001)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enI3TVRoRjZpVlluVkxJeDhCckpQZXczSkN4dU4zeG5CZ3V3dDFJbWs5Mndn?=
 =?utf-8?B?UFBIQlRTaVBPUnY0YzJSL0d4TjlpZkZZcFpKSWd4akVUOCtJS0o3Sm5zYjA1?=
 =?utf-8?B?NzZCQ2FiS1RKSWFJUTE5MzRHS3VScHl6bEt3bXBpb2l5alFHOE9CMHNZMjFW?=
 =?utf-8?B?VDE0SzBTRTNMWXQ0emF5cklsWVlRMFpMa2VtVHFMbW1xcis0ZktpaDV6N1JS?=
 =?utf-8?B?V1FNRnloTEdUMnJqNHk2b0QzcGZYN0FXU0dka1p0dFZZeE4xWTVPRlJYcGNF?=
 =?utf-8?B?WEFWU0lnN2xnaXE1T1ErR01Yc0U5Z1Y5L1FycGxuemFNbWZOZEIweEx2c25a?=
 =?utf-8?B?NXZUV25HWVJOamJGVmhqWkdva2YvRjNzcWpkOTJMdnR0alVBdnNpOHRTN1Za?=
 =?utf-8?B?UDdPRHA2bCtCRU9VK1AwOFhKQ2xxZS93MCttbVF0MWFTRFVQbGhzUHlMNlY1?=
 =?utf-8?B?dlgrV0liMm5ueURESzB6WURxOGpxRVNidVZpaE50K1h1TWtOb0FVOTBTYU1K?=
 =?utf-8?B?SHhSaWRXLytiYnlRUVVJQ3I2ZitXakhlNVRyd0J5TENTQXlJMUc4RDkyVmIr?=
 =?utf-8?B?dVNRNGhBNFBQeWxJNkJPTGpYK3ljWlB5a0VrK2VXdE9qK3Q2UG5vZThqUWsx?=
 =?utf-8?B?Wmc0WGJxOStGMFl2NVZmNklCMGNzczZyZnVaTkFVUFJpeWE3VTJ3ZmNwMGx3?=
 =?utf-8?B?M01JLzNRc0VtR3BGSHMwVVFhWUkwMzNuNGg0SnIzTDd6LzVPSlFnZU5HSHlQ?=
 =?utf-8?B?TzlJVFZ1RHNjY3BLcWNjRDBTMVlPMkJLNFBLU0MwMDBTWWZFWWNJZENXOVpo?=
 =?utf-8?B?alpDSTRKV1JLZ2YxcW41dDFNZG0rNGV0UGIyUTc0bjJZTUI4bDFHaWRMby9J?=
 =?utf-8?B?UExvTGk3TUNNUHdKUEF0MnNXUkxnRlAxMVdNZ0RaQTR5TElqcU9GUFFpSldJ?=
 =?utf-8?B?WGRFc0xhZTRTN1NzWUFCMTRCQnVLQ3U0K1NYeFNKSzhqSnNEQys4WDNsWk9o?=
 =?utf-8?B?ZmhjTGN4NTFDWExzWnJ2ckxONDlWWmtIK0FVVHNQTnlPNTNJOTdxMjN5ekM0?=
 =?utf-8?B?bzA4am1GYStJdHJ5SkZJRWY4ZWxvZFdHQWJlNXRlY1p2amdUUXhwZFdaemdV?=
 =?utf-8?B?VDZWNnRhMlBTVXhtUlRhZUNMTGJ5aEhkejZtTCtqdytOaldIWmpmWk5VL0dV?=
 =?utf-8?B?ZDZvU1NlWktRb0x0ZjZBeUtjcytaZmNZMmd2OWh4cUFITGNVSjg1eVBLRlRx?=
 =?utf-8?B?aXFES05Fb2xjdXVlMFRNMTdHT0JHM3NLMDYzTHJ6WVNwSUZTMi8zRzg2M1p0?=
 =?utf-8?B?TndDSE91NzNtelpSRnorZ3Z3RERUSGMyTXhtb2JDVllPMlRuU00vbVkrT3d6?=
 =?utf-8?B?a3JaY1lQRGgyOTdTYnlJUVEvTjBSb0psL1phdTZLOG5uQ0xWUGlYZ2V5Z1U0?=
 =?utf-8?B?RVVyeWNuMStTanNMODVUajRoaU54YzBHQkszZVhmeTdzTmlPT3l1RkI2OVM4?=
 =?utf-8?B?UkxkMks0NXBqSXBRTVNacWVCay9lUkhPcERhUUFab0xEaGtMZllGd0RVT2w0?=
 =?utf-8?B?Rkl2bi9DcW5PalFORHFZazFIQ2dIdVVEbGFpYXhUYVIzQTUyVDRjYVE2MjU3?=
 =?utf-8?B?bFNLMW8zbFR3cHhyTXZIdFFqblI2TmFBa29URWJTSllvWDlNVEFyVVRza1pn?=
 =?utf-8?B?RXI4aE0yV1F5cmI4bC9xWVFrT2hvcTl4SDVQQ1oxU3VJbVV4QkNPT1gwRklY?=
 =?utf-8?B?d3RJd1Nhb1Awa042QWx1QktjdFlLRitTVGs0by84ZGVVZFZyZUd0aGlSZmtU?=
 =?utf-8?B?OEg1OXpHUWJuQkVZclZJcWhxU2Y0dktYYkFCdU9xczJWdS9DKzVDN3g3elVN?=
 =?utf-8?B?UlNDTkJweS9GR3Y2bm1FdHQ4c01KWGNLeFJiS2hpUC9TU0RkQjVtZjNicnV1?=
 =?utf-8?B?YnBzNkxWWWFlUzc0MnFXejUwZE05VHFNY3ZXb3RXMDFwOWhzY3hVVUYxUWV5?=
 =?utf-8?B?Mmd2TzhDZ0RVWCtzNnRWZXNFaDdEbmZvY0xPWXhvU09YNm1DQzEzWHlXNFFH?=
 =?utf-8?B?YUZtS004c2FNRHJIUkVlNjNaMlgwR1RMM21sT1lwYlRRQ21nRDdrb0xMZzNr?=
 =?utf-8?Q?x/S7ZIoF8aXktKnoClDsmV2eQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47cc92b1-897e-4d3d-7746-08dbec0279dd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 08:59:18.3215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Yi7vGNQXS+5vH0A+5CDlD2PpGxTACR2zPiCp7FcKtMTcbNiLESlHhJI2ivDIyTeuqpeDU/mmoKQF2DWZDVi0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7491

On 21.11.2023 01:02, Stefano Stabellini wrote:
> On Mon, 19 Nov 2023, Federico Serafini wrote:
>> On 18/11/23 03:59, Stefano Stabellini wrote:
>>> On Fri, 17 Nov 2023, Federico Serafini wrote:
>>>> diff --git a/xen/common/stop_machine.c b/xen/common/stop_machine.c
>>>> index 3adbe380de..398cfd507c 100644
>>>> --- a/xen/common/stop_machine.c
>>>> +++ b/xen/common/stop_machine.c
>>>> @@ -46,7 +46,7 @@ struct stopmachine_data {
>>>>         unsigned int fn_cpu;
>>>>       int fn_result;
>>>> -    int (*fn)(void *);
>>>> +    int (*fn)(void *data);
>>>>       void *fn_data;
>>>>   };
>>>
>>> At least one of the possible function used here calls the parameter
>>> "arg", see take_cpu_down. But I don't think it is a MISRA requirement to
>>> also harmonize those?
>>>
>>>
>>>> @@ -73,7 +73,7 @@ static void stopmachine_wait_state(void)
>>>>    * mandatory to be called only on an idle vcpu, as otherwise active core
>>>>    * scheduling might hang.
>>>>    */
>>>> -int stop_machine_run(int (*fn)(void *), void *data, unsigned int cpu)
>>>> +int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
>>>>   {
>>>>       unsigned int i, nr_cpus;
>>>>       unsigned int this = smp_processor_id();
>>>> diff --git a/xen/common/tasklet.c b/xen/common/tasklet.c
>>>> index 3ad67b5c24..3649798e6b 100644
>>>> --- a/xen/common/tasklet.c
>>>> +++ b/xen/common/tasklet.c
>>>> @@ -199,7 +199,7 @@ static void migrate_tasklets_from_cpu(unsigned int
>>>> cpu, struct list_head *list)
>>>>       spin_unlock_irqrestore(&tasklet_lock, flags);
>>>>   }
>>>>   -void tasklet_init(struct tasklet *t, void (*func)(void *), void *data)
>>>> +void tasklet_init(struct tasklet *t, void (*func)(void *data), void
>>>> *data)
>>>>   {
>>>>       memset(t, 0, sizeof(*t));
>>>>       INIT_LIST_HEAD(&t->list);
>>>> @@ -208,7 +208,8 @@ void tasklet_init(struct tasklet *t, void (*func)(void
>>>> *), void *data)
>>>>       t->data = data;
>>>>   }
>>>>   -void softirq_tasklet_init(struct tasklet *t, void (*func)(void *), void
>>>> *data)
>>>> +void softirq_tasklet_init(struct tasklet *t,
>>>> +                          void (*func)(void *data), void *data)
>>>>   {
>>>>       tasklet_init(t, func, data);
>>>>       t->is_softirq = 1;
>>>> diff --git a/xen/common/timer.c b/xen/common/timer.c
>>>> index 0fddfa7487..bf7792dcb3 100644
>>>> --- a/xen/common/timer.c
>>>> +++ b/xen/common/timer.c
>>>> @@ -291,7 +291,7 @@ static bool active_timer(const struct timer *timer)
>>>>     void init_timer(
>>>>       struct timer *timer,
>>>> -    void        (*function)(void *),
>>>> +    void        (*function)(void *data),
>>>>       void         *data,
>>>>       unsigned int  cpu)
>>>>   {
>>>> @@ -441,7 +441,7 @@ void kill_timer(struct timer *timer)
>>>>     static void execute_timer(struct timers *ts, struct timer *t)
>>>>   {
>>>> -    void (*fn)(void *) = t->function;
>>>> +    void (*fn)(void *data) = t->function;
>>>>       void *data = t->data;
>>>>         t->status = TIMER_STATUS_inactive;
>>>> diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
>>>> index 135f33f606..390f7b6082 100644
>>>> --- a/xen/include/xen/rangeset.h
>>>> +++ b/xen/include/xen/rangeset.h
>>>> @@ -68,7 +68,7 @@ bool_t __must_check rangeset_overlaps_range(
>>>>       struct rangeset *r, unsigned long s, unsigned long e);
>>>>   int rangeset_report_ranges(
>>>>       struct rangeset *r, unsigned long s, unsigned long e,
>>>> -    int (*cb)(unsigned long s, unsigned long e, void *), void *ctxt);
>>>> +    int (*cb)(unsigned long s, unsigned long e, void *data), void *ctxt);
>>>
>>> Also here some of the functions use "arg" instead of ctxt
>>>
>>>
>>>>   /*
>>>>    * Note that the consume function can return an error value apart from
>>>> @@ -77,7 +77,7 @@ int rangeset_report_ranges(
>>>>    */
>>>>   int rangeset_consume_ranges(struct rangeset *r,
>>>>                               int (*cb)(unsigned long s, unsigned long e,
>>>> -                                      void *, unsigned long *c),
>>>> +                                      void *ctxt, unsigned long *c),
>>>>                               void *ctxt);
>>>
>>> Also here some of the functions use "dom" like irq_remove_cb.
>>>
>>>
>>> But I actually like the patch as is, so if that's OK from a MISRA point
>>> of view then I would give my reviewed-by.
>>
>> Yes, this is OK for MISRA.
> 
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

To cover EFI:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

