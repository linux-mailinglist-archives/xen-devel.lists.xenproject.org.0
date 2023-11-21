Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408897F34E0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 18:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638068.994343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5USx-0002SG-Mt; Tue, 21 Nov 2023 17:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638068.994343; Tue, 21 Nov 2023 17:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5USx-0002OC-KE; Tue, 21 Nov 2023 17:23:15 +0000
Received: by outflank-mailman (input) for mailman id 638068;
 Tue, 21 Nov 2023 17:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5USv-0002O3-DC
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 17:23:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a444877e-8892-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 18:23:10 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9454.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 17:22:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 17:22:39 +0000
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
X-Inumbo-ID: a444877e-8892-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enNS52afnS63SxlDWovPieDeDz6wQ2l7WDMKZO1l+Xb8zwICgxJG5Xq23SykSLSGHq767Mr5Abf1loM7USAxL77Z2DXvyVJZi8Cltf05Ach7kxcLsaPxqvxsgiuQLONqNK01LcCd2IP8g0XFFRimiKnPIMdPZbYQk2s3idrOd/oDTat0WHM1T6hwFXrvvJMhtefhWauGIVl+pJiRrWAmqZ+v9dRV9S2bZgm6blneKcy4lELv8FWALZTWiumKxj2TDmqe54YXR8d4+8+5/qIKMWatKvPNLvRLYsGcBaY8NCLoKuqNpP/LE+X+/598HzLAXz2vXEmYxYdfsXF9/WN7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGevIx+P3bFvuUAu1cGXEWumND3x1C29q42wN6RmLEY=;
 b=PWU7UPzO2pvTKYtSypi+BLCZwprojgGPfrb9q+UfFmOoou0MZMQZkjSfZChlOVxB/T921HeC7x6HIJuyf4wYt0G8zcfpJPuJmRkHRI5f2qTgCzvOnbS7zmgtf+HvGC6Ky1OynsbaEwTaYXZljII0Fo7v62TQocbKv5uEs0Ni2VHZB20S0lf/WyIqqcnLPz+DTfd3vLJNF+5v9OvQYgwyxr0lasgSVArCaRFvjb3koYo+6/QLj1l86adpuBeDHCdkFXjmmu5cYDbgAV3h9MYv2Q37ySmpTmF1qvA0NMopSURKeDSvfkdWmit2vN5FIcid5MFXQ1BHOXYGLX4GR3wauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGevIx+P3bFvuUAu1cGXEWumND3x1C29q42wN6RmLEY=;
 b=ZfCMcOsVuq0A7dDlpzGKyMZp35fqreFPDq3HojZOW837ZXiUyytnMl76Z/GMcOxC7yVSmyogo/6y5dwaM2DaQUKqZ7YwF7U+LeXeIEZnzLqcmPZMhLSQFqR0uY+ORqN5b1zH9bj7HnkeXQoMOmBvJBfc/Thibf561IOn6HRyKNg+RKgC/j5JqJ0EHumJgcFBW1wWNS8yJxa/e2O6OxAC3F6QOmu+D4pA28/sia/6c7p/+YNFK9S4jFxeG0RqSmRG2hEyvS3ntOtRWwzk4WjI/VQpgUdu0Mbh46RmIWGkJouFpDs+yvb3E0MULBfpAtfzF6vft5p8QdcQPGZhr0YTAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a058b837-82da-4b93-be5c-b616511d24f9@suse.com>
Date: Tue, 21 Nov 2023 18:22:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] VMX: drop vmx_virt_exception and make vmx_vmfunc
 static
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <fd9d6043-4877-4156-97d9-4bdf7cc8fe04@suse.com>
 <ZVzROZu9Afs-mEah@macbook.local>
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
In-Reply-To: <ZVzROZu9Afs-mEah@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c4d462-62f3-4c4b-9cc4-08dbeab6766c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DLIu3Pko/I5azU32VjfHJi7hlX/TslOjp8q4lCQwA5EH4Bcl1lZscxQK8Jn418xrRD6YAQwPFbmPNbP2kwd6fpHkNJtaInUj9nOhry1TJnTie41ztapUg5Vv7Llbu3cWJHadtLOGmUodU1CF1i8I9/sHPaid/0szod6mYIz1VLftTPmzpQksEdc+cXZfOydzf5zSU/69glgrIWmie9OL7SfAmaMUXkgolK4TbLZXw7I0LG3ZtZ5xWspL8ghjQmfwzEpocoTtXJ6fqls/S8gzuvHDtcFY8TMypUWXnaulX/yo/Y9z+3NqlUoeukZTrSSgnBrUVwDyAKCG/7KiLRb7XzjQgPiE17VROXIuYa2Pa5VY71qUljhwKW2BIKFSCpcvUofPnvRpTo3F2rOWhUJMuOLvrv1yiq601GY3ORjF9VR1pNRrS/hr4Nj1Gtr+EYwC4YM8SK4Zj3wYgy3lfaY3nnQNl7+t/AmLQo4qqDud5v1/WL+QJxblNDBe9ARBLJIzUCXGFzDEMUSHsz0TPv6kG13mWVl/fA0WUsOJQiGArgxO+KD/R87kaGpWDcvf6S1atvijzlf+DvOdDili1ibMoSYVeLfhB+eY2qE/Y+ichJrRp0YwKk06LhHgsyQu+jprsYtDkBkZy3BYvy3/2RduDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(39860400002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(86362001)(83380400001)(6512007)(53546011)(26005)(41300700001)(4326008)(8676002)(38100700002)(8936002)(2906002)(5660300002)(478600001)(6486002)(6506007)(66946007)(66476007)(6916009)(66556008)(54906003)(316002)(36756003)(31696002)(31686004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFZyOUR1SFJESEVHZlJFamhWZHhWc1p3YjFGc0JYbXREcFB0SmxUU2QxYmh3?=
 =?utf-8?B?Y2hMYWdUSlQ4b0JQcGhZL0Nrc0UvbHJPQzk0Qis4TUtnaUJZRlY1UHBZYmhK?=
 =?utf-8?B?K0R3Uzkza0RPbE5RbWF4Yy83SUo2cExxcmEyaWVVeHd3MHJiNnJVMnpJNjN1?=
 =?utf-8?B?dm1ZSGNwdEFyS251Q0JhQm5SRkJybi9JS3F6cWNja2NWdXFkSG10MVFsMXhu?=
 =?utf-8?B?MWlSY3FDeWxZTUlQS3NaZjBENnE2QkpvalE3NlEyYUpldEszY05XQVVkWTlG?=
 =?utf-8?B?blBlUExIa0tGSWRadDl0YUNmRndLMHpTbkwyenJwL0ZpQlh6aEhndnNiUGt1?=
 =?utf-8?B?MVJvK3JHZ0VwOFQraEpOL2tZVVV1OWxnc3RhSDQzWUdiNUlCQnFkTzV3cTJC?=
 =?utf-8?B?dXI1dGJDWjRId0tING8wdWhmY0kwdm05ZkZpWDZqSVNoVUxqVVlBM0NjT2Rw?=
 =?utf-8?B?VmNnOEJocFpPSUtOanlRVEJjRjBvMk9nR2Q5c1d1M0VVQmZsRVBoVStUTGJ1?=
 =?utf-8?B?b281U3VYQkFqT1NqMFczditabGloMnlpemxIeForcEtuVk1JbDBIRkthWGlm?=
 =?utf-8?B?NHgxOVRuU1pTQmJRMG5CdEllYTl2RlMwV0d0MjR2VUtrUW8rK0xvbGxYaHZK?=
 =?utf-8?B?U29ZZjM1a0lFQlM1MFRQV0o1YmFGWlhIZWdIcjd2WXJrbk1aYmNkUmtXVTYv?=
 =?utf-8?B?SzZ3a0VyaDQ2aXJVUmFURG9tZUlOSFpqMi9GM01OVFlCTTFBSWlNb2ZUbnhJ?=
 =?utf-8?B?SGgxL3Z5MlZDZ21xUGYzUFJ6aXFIalpuYzhJeGJJcXZYQko3SzZobm4yWFdz?=
 =?utf-8?B?RXkvZncwcWN4U2JPSUVYd2hybzBkbitBRk5YbnUwRUdWelRqbThUMUtkeVpF?=
 =?utf-8?B?bGpxVGFIdFo4RjRVM2kwM2tLa0YvTEdEMjRpRnNFbHZuTW5EN0FCUFJ2dFVT?=
 =?utf-8?B?SUJnUGVkWEJLQ0FkalZQMXlMU3Y2N0RQRWxNbGRXelhsOFVFcHlPc3V6MmY3?=
 =?utf-8?B?VVdKTmFlMDdzclhBelFvM2MzRHUxNTcvMWNweWgrUFM0NGV4cWtDWGN3Vk9W?=
 =?utf-8?B?UkQ0NUNhQnBGREQrekhSTDBnemlqVG9GVFk3azBObWUwY3dsYzF2cDZraTFi?=
 =?utf-8?B?dWhUWkVoUlpqcS9jMjJhTnZwRENETDRLeDV2OWZuTnZvYjhCb3BQcWl6OWdB?=
 =?utf-8?B?NDBlQjFmdTljSzE5Sm5pWkFBUGZJbWVTMVdwN1V2dnF3VmZEbVdyQmtrcWxG?=
 =?utf-8?B?RkNXUENaWW1ROVg3RVJlZm8wWjFXY0JodHdVNXdoWkE1WXRGT1hZbVV2VXBN?=
 =?utf-8?B?aHNQWmFZSmZUbmlTSjhXdzlsK09kSmlraGpxUVQzZnhGYndqZ2hWQzhQS2xT?=
 =?utf-8?B?SGp4aUU4RVdndkdURHFUS0F5QlplR2R2L0gzQXZkcnNBWVZWU1E5V3ltekZC?=
 =?utf-8?B?WmQzMzBLMWZDUjJOV1FkcklyR1VBYlg1cDBxaEViR0g0am5xU2s0cU53RzZa?=
 =?utf-8?B?eXR3Wm9FMW5NNTdXb2pNK2V1amZSNTNPTUFteWxMTVhZNVhtdGtrbmpCM09C?=
 =?utf-8?B?SDViaC9uc0F3TEZja0R0ajZyUHFkMWpRcWwwMmJ1OCs2Skx5SGttMmg4aW9R?=
 =?utf-8?B?Q25tbDVBMTg3MS9rb0FCRk9WYjhOanMwREt5MDlBbmc0MXc4bnlIWGlEVE1H?=
 =?utf-8?B?VXdPS0laU0RqdXM5QVFnSWhBWjUrcHFjUjhNWk12VXZLbkJ4dVgwOHVMUCtl?=
 =?utf-8?B?UFQ0RG1ZYWM2WmZpYkZBUEw3UDNSNElxQlp5akhJdGVmUWlzMmhCekp4Z2E2?=
 =?utf-8?B?UU00NXRMZjNFbFpOeHQzT3UyWGRyWWhUWDhQaXQ5eWZ4UjFMTFJrYmtNMWVo?=
 =?utf-8?B?UjVQSjBaYjAyZkFFdUFpRU5RSUdsUytENS9jY1dwd2IxcEY0a1dZM0hZUWdt?=
 =?utf-8?B?VlNSdkp3WjJORHQ4bDlYUUFWb1A0T0k5M1E0NzV2dmU2MndOOWNZTHBrb3E3?=
 =?utf-8?B?bUZCNHpUZ1hadHlnRVVJRXJweE5WOEhKZFNRM1BzS21VT3dKZWxkUnQwM0pL?=
 =?utf-8?B?WHhBNmM3MXVLS2JyZVBtbTdsODBvckk0TzNMN3FxNDJxTTR3cmNjaEZoTFd3?=
 =?utf-8?Q?LkeXeRuula8sTym3XOozWVK17?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c4d462-62f3-4c4b-9cc4-08dbeab6766c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 17:22:39.7969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsDx7V98qIHLqveu506p2LNXlLACWlo+k7N6Mb2UWYAgNpfnSJiTWuxWoahVbZRqmDM1M8mAwPuVAzr28KJT2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9454

On 21.11.2023 16:48, Roger Pau Monné wrote:
> On Thu, Nov 16, 2023 at 02:30:41PM +0100, Jan Beulich wrote:
>> The variable was introduced by 69b830e5ffb4 ("VMX: VMFUNC and #VE
>> definitions and detection") without any use and - violating Misra C:2012
>> rule 8.4 - without a declaration. Since no use has appeared, drop it.
>>
>> For vmx_vmfunc the situation is similar, but not identical: It at least
>> has one use. Convert it to be static (and make style adjustments while
>> there).
> 
> I think you could also remove the sole user of vmx_vmfunc, as it's
> just a cap_check() usage (unless there are more hidden usages).

Well, perhaps (and hence my post-commit-message remark in the original
submission). Yet then I thought we permitted vmfunc use for altp2m, at
which point the cap_check() is meaningful.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> In how far the sole vmx_vmfunc use is actually meaningful (on its own)
>> I'm not really sure.

(Here ^^^)

>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -167,8 +167,7 @@ u32 vmx_secondary_exec_control __read_mo
>>  u32 vmx_vmexit_control __read_mostly;
>>  u32 vmx_vmentry_control __read_mostly;
>>  u64 vmx_ept_vpid_cap __read_mostly;
>> -u64 vmx_vmfunc __read_mostly;
>> -bool_t vmx_virt_exception __read_mostly;
>> +static uint64_t __read_mostly vmx_vmfunc;
> 
> I'm quite sure this should be __ro_after_init, but I guess we cannot
> be sure give the current code in vmx_init_vmcs_config().

I think we can be sure. But if we were to switch, I think all the
related variables should also be switched at the same time.

> Any CPU hot plugged that has a different set of VMX controls should
> not be onlined, the more that migrating an already running VMCS to
> such CPU will lead to failures if non-supported features are used.

That's the intention of that code, yes.

Jan

