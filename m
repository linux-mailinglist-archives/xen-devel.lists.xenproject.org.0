Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829AA7F402C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:33:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638518.995145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ifq-00033V-93; Wed, 22 Nov 2023 08:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638518.995145; Wed, 22 Nov 2023 08:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ifq-00031S-6Q; Wed, 22 Nov 2023 08:33:30 +0000
Received: by outflank-mailman (input) for mailman id 638518;
 Wed, 22 Nov 2023 08:33:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5ifo-00031M-Ui
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:33:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf0a8e90-8911-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 09:33:28 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9670.eurprd04.prod.outlook.com (2603:10a6:10:31e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 08:33:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 08:33:24 +0000
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
X-Inumbo-ID: cf0a8e90-8911-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUAwvzyr/iSRCSQX+Ucc9WUSJ8XZ9/t/iMTvq2hLtxkAbXzGjBm8rup9O1ujcC8sYyiEloOi3Jiu2Rax6anLTPzrjWvHsW/j5LfjYTJgLiQ8KtjEX3q+hSVHG/Ddb07p8QkJkGGTQ4da7j5sgp5zdsaTPziFrMXrqbVLP2Oc4DHdT57K5ROS29+ydWPkaYQVn6cdUjC8d4BMJp8sHlE1d2r93P9neU4rvhEj8Xh+hSRYA/RlkV8uz0cgDsk2eoT543fRuHR4Q7v8fyI8wFNA4WXhsVZZEvcUXdz2UTvDj8CRn2kgveNz+0oU44eFx6WjMh653h3CQAoRboc5bQMYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLIAZg9r66lCTnyGSE2qu1/31wYlJ+YC4zCllUzgVhc=;
 b=bcrs2zkKCLFiDy4fl8jzZnPTzj/bWX8WDWsB61bG+eam/v0NOmh/XndCDkiV/MlUW0D2g1D+mTwJ6RNkqTalrNztoPZZEk4BmA9o0PnWMsVJJWBhIInw2OoAOjeIpIOfJh28OPQJUslcxJgRxDBn69Mts2e3yxx6ybLpaiT/pjT+1PLJj7YoxOoWxqoibiKECWz0EyF5VuEP9jgggrUQ2QUAlkf1LkX6AaxzGrJNi3rgLh1fMUYIsAmuhqBZzn1ozSLuEkj2f0DUyS+8V0o+tKe8CpU4lXTyUWFc7pEftNUjtj7Jl69TgK8jHSZ0IYtt1wnBBTzYns00uneQ0lQeKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLIAZg9r66lCTnyGSE2qu1/31wYlJ+YC4zCllUzgVhc=;
 b=JIqPZHQG2n5TcmkRb4I55b8zMsogHsXHR6+i9txwVkWDEo99nS7Ckf4TD5V9jXREUl0LOSJI0mSyi+hTaYKiGK3UatkNibOfa9AjAZ7g3+xNQB9xaSySXUdWIZbj0S6dWgfKbUCO/TY4ERszngbqHZlkH/mCRjZthkC9g1teMTc3l7IqXYmcwJAz41n6S1W0iAlmruQZYCPDmlThjV4YioXpxB6Jhk0p9peA5AuP8rbRuVaoQeQikyqs9h7CGa+torj76v+CkJkE2k0HigkoAa1pW7VTSlKvMNar6kF+k8d958bmXeRxAH2S55VozS/vfAeoqF9PBJZhl1Np4v2c9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c1720be-e0f6-46c2-a99f-97cf1bc747d0@suse.com>
Date: Wed, 22 Nov 2023 09:33:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/HVM: hide SVM/VMX when their enabling is
 prohibited by firmware
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <b16802f5-13ae-47a0-b12d-604928f4cf7e@suse.com>
 <ZVzZy-KYgdAsqRE3@macbook.local>
 <d63dfc54-cf89-44b7-ab7e-983037892833@suse.com>
 <ZV26VGxA6ZZS7LAZ@macbook.local>
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
In-Reply-To: <ZV26VGxA6ZZS7LAZ@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0281.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9670:EE_
X-MS-Office365-Filtering-Correlation-Id: e93296ec-628a-4215-ec2c-08dbeb35b13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VsVImtXTHGITtmALXHSjWfX/zmBEM0MNL2VoTPV6b0P+GeZxcMaEX0xzHw99RZs76wLjPm3jIo8loH2pI2h1aqPR4zfwi2ymnFppOlUP6d8e1jfut2eEaVzb8IKxsbSOw4YStSfX7I8xzu16bOh+jjs47nqOOv9+zH3KOxr1FpjL5gC09oqTyWmQa+aiCoRK7Lm1bOF/ZSNLqGRwP0NgXTsP+5Yfeyowg8JiQ5/hH/XMlwWEGrP4o2SKk+UBqSBPlj6VENM7TFJRROUD/2afvY4SAw1RCd/VPYXSdbE3OOJinyVOpBArNozV/xu9kH6frRqCUw/ZfBTCP4v0Mn7opaN5lR7/XTbAcIi4lKklrGEgS9x760QbTvxmeMKsGQp1F+fYAtUodKIfgHh9CnoREDzCjaOlvNd16blopq5NOoGd4o46t9a8EXglIgXbU88oW7JyUBrSc3INdhVIDykeYfs6cZ0uD87ZlXmBR7YJQvEKVngZa/eqfkEEdJ4lzVMrrPoruKi4CCyYHTnsMvwkTart9noYDXC7bQ7wZIb+iHwprpI/qFIvnvC60WTA4ZpD5BtErf0GPnGSgC6XFR0bhbSSWXK0kybNQ1xyOpKNi87FiBDtKRJ0dfw8ROvAigv+5MZJcpNG+EO+21vIugImgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(66899024)(31686004)(2616005)(6512007)(53546011)(6506007)(966005)(478600001)(6486002)(38100700002)(36756003)(31696002)(86362001)(5660300002)(2906002)(41300700001)(66946007)(66556008)(26005)(83380400001)(66476007)(6916009)(4326008)(54906003)(8676002)(8936002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFg2aVY0RDZjSkQ2enhYRmszR1hGaldzL2R1eGthK1pZNkwvZVYzY1FLZzdS?=
 =?utf-8?B?N0VxelVSNTZmbWhlem9icUFSa2RhNDFZSUg2R2pleFlNcnZLSll3aXVBTHhM?=
 =?utf-8?B?MHVINFo4cTMvVVBud1g4OE52THVtc3lWQkVYb1BNcnFla2I1cWxkclVJbllG?=
 =?utf-8?B?dVRWckZQT2dKendGbnd3M0syb3VCR1ltczBXQXFuQjl1ZTg0Q1ZTMVIrWWZp?=
 =?utf-8?B?L1IwOTQ2UEFUci9paEJ4ZUd1MWsvcVZSaDJRQzdUZnZlOVB1UlZqZ25FcHRE?=
 =?utf-8?B?b2l1aFJ2MTFMRXNCWTdGbzRrS1lYTnBQVnVlRVRYL2hOMUJtc0s5eUN2RE5k?=
 =?utf-8?B?YmYvaWdsYkxIeEFvYzVubXJIOHAydFc0dlAwNm04MEwvZHBSMldNS0pFOURJ?=
 =?utf-8?B?NFdGbEljMExXbFRQME0wQ0ZrTjNTaC9jSytoMDI2cEtCSFJVa0hVMFovc21H?=
 =?utf-8?B?bGw1QnZuVTVTNHJ0T01ZbmtLREtNS05tc29vV25pZnVOeWpQc0ZvdGlWMkFn?=
 =?utf-8?B?OEV1dEZnV1E3SEtxclR5U2FUeXY2VnBNYXVQWUE4TFdMMEh1RlgrWEROSU8y?=
 =?utf-8?B?ODNJQTJ5QWcwRkI4dGlEd2ZmMk02TkIxaFpSRWhrWU1uTXZwV0RlbG5pc25K?=
 =?utf-8?B?Lyt5S3plVUdnQ1lUSk5RZUxyczhqVUtpem54eVUvZzhtRDk3ZEpwbXVDZzl2?=
 =?utf-8?B?eGZ1VmtlbHkzc1FyQmZPTjhzQ01VektTc3MxZkZyZXlYOTYzalAzRG1wcWpO?=
 =?utf-8?B?ZHpEbEdvc2Q3c3c4VHp5WHdPQ3Z3NnA4enNUTENJQWdCdTlIUTZIMVFyTFVP?=
 =?utf-8?B?MzEySi8wcUpUcGhnTUcwYTMxR2krMFB3TWJWUzMzcDlVdURZTXFXZFlucXJG?=
 =?utf-8?B?WmM0dzNibmsvYm04a1BtSjVGMDBTMlRIL1cyQ3lwampqajVjS1VYS3J5cmpO?=
 =?utf-8?B?VkhDZzd5WlY1SW5HalBscFZPcjZFM01Ib1RKTGJtT2hUeTByUGQvK1lLdGZw?=
 =?utf-8?B?UVc5bnRCMG4wN1FEWEMxb2Nqa0ZmVWxlUjdKNEhNeTZwVTZ2V1VCWU90SmpH?=
 =?utf-8?B?dGs5V2x5YWpJWlFFbmVsdXkwUGJZV2hUT2hIWDEvWE1Mb2F1OE5WSjQ0Mm1v?=
 =?utf-8?B?SjhEVFZxdEpyclZucUc1b1ZaeFBmMENRd1BPRU1hRGhxUlR4b2NxN3UvZkYv?=
 =?utf-8?B?REhOUHpybU4xZzNzdlc3cE13MnlyRU5iWERMdVBoZzRBZXFTNzRXdG1rWlJJ?=
 =?utf-8?B?QUV4ajdaS0ZCWHQ3am55RjIxbVp2QnB3MFhleVVuTjhvQU1xVUxrd1d0YUsr?=
 =?utf-8?B?dWprT296UGF6ZkVnN3llN0hSM3NwNlcwelJXY2RLdU1WOVpMa0NrTUg4Y1Rz?=
 =?utf-8?B?VjQyUGVvYkpSNjlYWm1XN2hoVElyREN1U2pOem1Rc1V1ZXZ5Qk41cCtCQm8x?=
 =?utf-8?B?QlVsQVUrNUhrc0x3eEs0Qy9RQWR6bGZxUWYxUk5qMk1qUk5qdTJUd3RXZTVw?=
 =?utf-8?B?Tm90bTN2cTNDQ3o2bjViL1F1czNtMnR6aXRWREpxM3JPL0dNY2cwWXc3cTBx?=
 =?utf-8?B?RmNGb24wMzJHZEZrQXFTcjJicXZtYUZUTlBIYmNxelFyQUhaTUZPTnUrNlA1?=
 =?utf-8?B?aDRpdkRJUUJpZU9ueURONXpFZG0yaDhuYjNqSXhNdXIyMFFWNUYwVzFsNnR6?=
 =?utf-8?B?bHZuSnRWVldTejJsQmZGUmZtWEVSaUZkVFBNeC8zUHc5K1N5bUFUZk5YcnVr?=
 =?utf-8?B?N2cvZkF1Y2g5SXZLZHcwWDIvWURZd2NXRVdtVWk4bkplOEtnSTZ2amVMeTlk?=
 =?utf-8?B?NEJiWkpxZzUyeGVMaHE2Q0o4S1Awa1l1R1h3S2FMaU9RV3ZVL0NXRFpBVGpu?=
 =?utf-8?B?Unh1NldPckZaOWVvQm1rY0hiZGpOQVJtZ0xkaGV0c1VtRmVDcEhMYWJjd1Er?=
 =?utf-8?B?ajAzS0hXdk5oZHlQTTU5SmxzS015YkgweGxaaE5Qc3RZSjVCKy95cjVWdEwx?=
 =?utf-8?B?SGsxaWl2RG1wSk9oOXF4azFjbHpwQUE3YWlPRWJuV1ZqbFRuYnRzREk5OEJp?=
 =?utf-8?B?SkRRblB2bXN4dnVvQjNpdkpnREgzL2pXVDBmVmFRNkdRNlA1ZERiMWw1SHpB?=
 =?utf-8?Q?uTX3qLRTwudstXlhkbYaaSvKX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93296ec-628a-4215-ec2c-08dbeb35b13c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 08:33:24.5650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XH1o+/V58vHHSEZMfdZMxs4Et8TW45Lv4Ckv+fH+0UV21Vlb2TWYGnXpi+uL2Vhqwck1zL5uaifDlQK1MSFZKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9670

On 22.11.2023 09:22, Roger Pau Monné wrote:
> On Tue, Nov 21, 2023 at 06:27:02PM +0100, Jan Beulich wrote:
>> On 21.11.2023 17:24, Roger Pau Monné wrote:
>>> On Thu, Nov 16, 2023 at 02:31:05PM +0100, Jan Beulich wrote:
>>>> ... or we fail to enable the functionality on the BSP for other reasons.
>>>> The only place where hardware announcing the feature is recorded is the
>>>> raw CPU policy/featureset.
>>>>
>>>> Inspired by https://lore.kernel.org/all/20230921114940.957141-1-pbonzini@redhat.com/.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Thanks.
>>
>>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>>> @@ -2163,6 +2163,23 @@ int __init vmx_vmcs_init(void)
>>>>  
>>>>      if ( !ret )
>>>>          register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
>>>> +    else
>>>> +    {
>>>> +        setup_clear_cpu_cap(X86_FEATURE_VMX);
>>>> +
>>>> +        /*
>>>> +         * _vmx_vcpu_up() may have made it past feature identification.
>>>> +         * Make sure all dependent features are off as well.
>>>> +         */
>>>> +        vmx_basic_msr              = 0;
>>>> +        vmx_pin_based_exec_control = 0;
>>>> +        vmx_cpu_based_exec_control = 0;
>>>> +        vmx_secondary_exec_control = 0;
>>>> +        vmx_vmexit_control         = 0;
>>>> +        vmx_vmentry_control        = 0;
>>>> +        vmx_ept_vpid_cap           = 0;
>>>> +        vmx_vmfunc                 = 0;
>>>
>>> Are there really any usages of those variables if VMX is disabled in
>>> CPUID?
>>
>> I wanted to be on the safe side, as to me the question was "Are there really
>> _no_ uses anywhere of those variables if VMX is disabled in CPUID?" And I
>> couldn't easily convince myself of this being the case, seeing how all of
>> vmcs.h's cpu_has_* are defined (and I'm pretty sure we have uses outside of
>> arch/x86/hvm/vmx/).
> 
> Wouldn't that have exploded already if initialization of _vmx_cpu_up()
> failed? (regardless of whether the CPUID flag is cleared or not)

Quite likely, or in other words the clearing added here likely was missing
before already.

> My main concern is that it's very easy for the variables here getting
> out of sync with the ones used by vmx_init_vmcs_config().
> 
> It might have been nice to place all those fields in an array that we
> could just zero here without having to account for each individual
> variable.

Yeah, that might (have been) better. Indeed I already need to remember to
correctly deal with vmx_tertiary_exec_control either here or in the patch
introducing it. I guess I should make a follow-on patch converting to a
struct and at the same time moving to __ro_after_init.

Jan

