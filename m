Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EC27EDBEF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 08:26:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633994.989152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3WlJ-0001Lh-HI; Thu, 16 Nov 2023 07:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633994.989152; Thu, 16 Nov 2023 07:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3WlJ-0001J5-Dq; Thu, 16 Nov 2023 07:26:05 +0000
Received: by outflank-mailman (input) for mailman id 633994;
 Thu, 16 Nov 2023 07:26:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3WlH-0001Ix-AU
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 07:26:03 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6460d267-8451-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 08:26:01 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7521.eurprd04.prod.outlook.com (2603:10a6:20b:2df::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Thu, 16 Nov
 2023 07:25:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 07:25:58 +0000
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
X-Inumbo-ID: 6460d267-8451-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0d04pJp4M9oGUev5l69/qmwxolLbEIhzQ3BhC5MIAGsRQX3IdCXGOoGEOv5nFlayeliJyJtvafwyO04lLtICZgUM7dGhbetRbWGSGTHagQfIRt+VXzk6qae4ufTMwQl6yHggeoY6Hk0B9CmvKhPc13fLuPYWAymcbV8cUeEIY/SGElm7dMaXsojhwutQ8cNENn1U+pUx2mdOzLOwqUrELDaJzG6FZrbzHSQQU8XkpvEh8CU5uak+3HD/kinDua9IlfzfPJr2hvjamzkSzxFDzTYfCKuDXFXQTadLypzea7d+8bymh0EjSFPSqw/aQGblBWMAdBLo3fcSCvgDYCVvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQ0RW/G0szyCJFtQqxpP2+NNYAo9bUCDRxSa4S7Yw1k=;
 b=h1wdbukKAW6F6b5aDuDiUuf/S/l+oWLvHj18LeOVrb6xbk+OXNOPzZgrrerX+Jzb8FMNk34y1FDDe9nA8Of/KAiC+AgqwtN3BbS3XA/00cAwSb5cB7nH2twAlWS6NM3bAbutSonN2d9UfiLCUn37ySoscOHFabz7az3K5RzuoP13dOv1U6d7uq7dNfUU8BrfVrwSGLevMPLJQGew89s93UK8kTUJDqlwzAav7iEtcsGq6CBIZMWy15JQGb++Vk7IxZfIVkb0hHypYjnuFznuANYonzOtZWzo+q47owxwI/OsfFta+cXSEw146S8Aql4q32tHCDh4R36oxVv9R+t2bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ0RW/G0szyCJFtQqxpP2+NNYAo9bUCDRxSa4S7Yw1k=;
 b=HsnSZThAFepage3yjqwUXhfxJYVZ8hw92G2Wqymi8ttMsFBvznVsoptHSFxD+r3hzhiAPpoP1O+6hRQRoYLV6yHHQ+x34WH4AjQcevFgdYi625YG8wUpDvI5vBpce0ItOTvZffvze/SrAAazj7X2Y4xsMPUNcbxS2lUJf8nC3wmah9ETcwUrLEHu4mnbtC+Zrd0E3Pvh1f7pOTR0mJ59UIbAvnCpY0YkI6o0uf2zrJJkGmsgauapJPz7KgSrgBfjOlblR1YdwTtcomOuAwf73ssuKY5cO0f2LC+YE19VmNdONfbor7zxncSoZB4s+lJ3JSRvmRKKDS5GyU+4H51rSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46996b0a-f875-4310-8cc1-68fef0a1f66f@suse.com>
Date: Thu, 16 Nov 2023 08:25:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] xen/asm-generic: introduce stub header monitor.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <9b40493df82b99904b2e4f6cf9dc8888db4a2a49.1699633310.git.oleksii.kurochko@gmail.com>
 <0ec74ba0-895f-4642-ae83-fc2617435303@suse.com>
 <e1041215c28cd3582ed1b2ecc64a0e2ef3c11c54.camel@gmail.com>
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
In-Reply-To: <e1041215c28cd3582ed1b2ecc64a0e2ef3c11c54.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: fce8184e-b936-40be-6c56-08dbe6754762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KX9Le6mnTMNrKv5RqXgSmQh8ypHkU4aihUWO8pwxqj1d9/h9Ee5efmlb9r07cIb8SFWbN4rgJQGE97FW1cA+ZCQWfJKDjjlf+qhLqE5nz9mdb836XeYCdlBMONDq2k8X+jlDvYYsKL7Js4qieaH7WwrPNnzZVO5B47k/wHPeqlMSfV38KV6BBiN+A2kHLoioO6FFx95rDQNESefwKJT/snBYkqpTWBc9OeCWf7wGwb3LIoSesjsad66QBaTVqn+Tr3sG/YartJdQ7UaozdDQz7A2sSSK9WVdCkG5Fr5sTn7czl35XTAgz3mjwUQ8yiNbA4gNM7iMzccPWTtpM9ooeCqpz7R/XahtICTlaGz9N9GNYNjyr+6VSdF123zdD7kCdad0UdbnyvFfkZ2ETwXkh8VVx6+ywYvidSloNip7AhXTc9UYaQR9e6rblIuSGCT4Xsl6QVHZgYBUZnXjATuzUvP2invJ+DMYwhMBbT7eZZDl90xLmPiAspXdaYaYZHHsQ0eYmKnoZZx823B4RweRffDDOtknfv1dPkU/7CGDVbmJ462/gnnbIugIZ2WDzUU2ueoNvBf5JPjUPqZv79unkYSxTLlO3K2D6dAbLvYTKn7jZZv4xcsxgRDPHuOd79Dpsokp3/CXTbcvLBDIActnhlpbiDRQ7sWOfm5Rjny7dCY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(376002)(366004)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2906002)(478600001)(6486002)(6506007)(6512007)(53546011)(4001150100001)(86362001)(5660300002)(31696002)(66476007)(66946007)(54906003)(66556008)(4326008)(8676002)(6916009)(316002)(8936002)(41300700001)(2616005)(31686004)(38100700002)(36756003)(26005)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm1tT1k1VnRYcHhEamhNa0d1VlR5T2x6ek45Ym1Hb3h6RWdUNWRobWlCdU1H?=
 =?utf-8?B?S1FsSllJYnBQblVxaG12ajNqTWZhVEhjQndyaVd1UzFBOURjN2RXRlJSbWxV?=
 =?utf-8?B?dWFPUFdCakwxaE1FdTNTcGJoaEd5Y1VDNnpyM0dTQzZVdjVLTWZuQXRUMHhz?=
 =?utf-8?B?YzZLbEtxaE16WThXak9RT3VDam1pTERaMGdzUjNPSDlJZnVXZDczazZtc3NN?=
 =?utf-8?B?d1dUNGpXNWJYYTVxZCtYNkt2Ym8vSDA5OFdLbzJkM3ZXSXJudEgvZGVQb3cz?=
 =?utf-8?B?RHpFaHhkYitPZUJNZXZYVURDSHlvQ1FnTDJDeDluMDRVZWdTcE9lTGlWVm1F?=
 =?utf-8?B?Y3dwSXdKZnB4c3A0M3JWN1lycDNBM3p0M0U0MStjdDlpY0M3cmF2U3krcDg4?=
 =?utf-8?B?KzRwMVVrUm9laTAzdmhKVGIxTEdwRWlKZlBxOHNHaWozcjBIeHRMeDh2aGhx?=
 =?utf-8?B?bWlzUWo4ZWFneFdvNjd2V1FITlRWczdneU5GNCtZREpPeHBzS0lYTEJMUWRF?=
 =?utf-8?B?bmt3RnlFUmxuQy9zR3oxOGwrVUpId1BwengrdGo1S25jc3dsaHRIbnhEeDJs?=
 =?utf-8?B?RHNTdnVXT29IS3gxSEMzM1VxS2ZCRVc3Zm9iSFFjMHh2RzNORkxxVjBtb2tK?=
 =?utf-8?B?MllSZGcwSWUzOVF3Q2VqbjQwNmFCa0V6YThRaklBbVF4OHpIV0UrZnUwSzhn?=
 =?utf-8?B?Zmx4ZWV5RDBqUDNwS242TzN6WmxqeERiZVNXSUZnY3J0cXZ6dVZYR1FsUTk0?=
 =?utf-8?B?S2ZqUHNaZjBWV3R5QW1zRnNSQzFWZmpvOXRWRDE0anFWQmxMUnkyZ0NXODlt?=
 =?utf-8?B?TkNrT2M5cEh1VWJCTFYyM2QvSHJxUjQzWTVhM3ZFUDIzRU8zMjQveStKZTlW?=
 =?utf-8?B?VG1uTDlMaW5aM1A2WE5OVVNnbTd5bDBwNTU3Vno2WUF3MzRtd3RjTTg2ZHcz?=
 =?utf-8?B?MnRCd1hPVmFZQjN4YUEvd0ZEWm5jOEx2czAwZng3NHRqMThwZzluUHdwTzVI?=
 =?utf-8?B?OS9ScHBraUhiVjN0M1A1MWVSY3d4T05BZlhjMnZobVM1bEhPZGd2by8rcXdO?=
 =?utf-8?B?eVM3ckZhRW8vdkJQVkRabG43SWFNSlFzVHpCcndYWWlNRkJiaTB6K3c4bWVk?=
 =?utf-8?B?VDZJRG9qNlpneUQ5WVNtc05UaTB6RjZ4NUhwYkpWRE1vTmh2WFJjVllBK2Iw?=
 =?utf-8?B?N1lTMTJnVkZiUk1SM0FtQ1lQVlVia1kwMVltSDZrUiszWlVuL1VKUHFPeDhU?=
 =?utf-8?B?bFpoTG5OYldGMFU3bk5ZNVJNbGtOT2QwVi9jRG0xMFRobUg4MllTcHY3MlFK?=
 =?utf-8?B?Y0dVcDBHcUtrZ2tmOGltTzVuei80b1hvelRqenRoQzFVbHJYRlRBZHRnMVFm?=
 =?utf-8?B?SGJraWhiYnVZdGhBU2M4RE1zZG9BQTArMmZDSjFKaitsTXhTdGhPRDJyUjdr?=
 =?utf-8?B?M3lVem1tSFhFdHhRWDEyU2wxYVZpV2lxK2xuVUIzcUljemlQQnVONG9zejY0?=
 =?utf-8?B?NXhveXJZM3NrTzljTytGYlRpNVZrSnRSUWVoUmczb2VYL3NjYlpsa2RId1Ft?=
 =?utf-8?B?N2JpcUJvR3lSckVyenEvQk5lRDUxRVdnTERxMVFBRzRHTEhzaGhHZFFLTUY2?=
 =?utf-8?B?ckIzS0VsenJnVWtEVVltYmRFMkhnSnYvNEdUNkg0MGNoU1JQOHNrVEd5RHIv?=
 =?utf-8?B?OHlSZkRyaEQ4cWo4YWtRelA1aVRDNUNuWjZJM05UZERzU2p1eC9ycDNTL0pU?=
 =?utf-8?B?NytjekZ0VGNlNnNOZ3RjdjhiYTY3QnpWTzFsb3RXRWJmUnFBbTMwUXBOc0Fq?=
 =?utf-8?B?U1ZDbnFkQ2tDcmIyY1BEbndLeCtwTW4rckRKdU5OSGZTVm82bVA4QUxCSkw4?=
 =?utf-8?B?ZkJhR05GSVVmanZmRjdBMHdoOWhyWEROK0pLS3kwcHBWNG5nS1BucVBvNzgr?=
 =?utf-8?B?OENGcFMrZU5QMGlVMmpTN1paVTRYTzRtWjRGbjg2WkRIZS9ZVzUyMjBsclI2?=
 =?utf-8?B?U0wvRlF0SS9oUFVIanFDdElnVFQ2VGpJRjc5bEpReFBCRDVIVC9FaCtPRU1r?=
 =?utf-8?B?QTJxZTMyYkY0YlEyckEvTlc0MlNCMnVIakc3cm9qYjJFelFLNnhuVSs1bkZp?=
 =?utf-8?Q?zoYL5TFp4DIAJL9z3NGwjof5c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce8184e-b936-40be-6c56-08dbe6754762
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 07:25:58.7485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNwoDkzgYO6qalsQEnBHYFMEI/cJGcXylZR5ik2j4cHXLlPEqp7dZj4oP+w/ahQ0TBskcWPE8Hchlr1hTGZvfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7521

On 15.11.2023 13:54, Oleksii wrote:
> On Wed, 2023-11-15 at 11:00 +0100, Jan Beulich wrote:
>> On 10.11.2023 17:30, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/monitor.h
>>> @@ -0,0 +1,62 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * include/asm-GENERIC/monitor.h
>>> + *
>>> + * Arch-specific monitor_op domctl handler.
>>> + *
>>> + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
>>> + * Copyright (c) 2016, Bitdefender S.R.L.
>>> + *
>>> + */
>>> +
>>> +#ifndef __ASM_GENERIC_MONITOR_H__
>>> +#define __ASM_GENERIC_MONITOR_H__
>>> +
>>> +#include <xen/sched.h>
>>
>> What is this needed for? I expect ...
>>
>>> +struct xen_domctl_monitor_op;
>>> +
>>> +static inline
>>> +void arch_monitor_allow_userspace(struct domain *d, bool
>>> allow_userspace)
>>
>> ... struct domain, but since you never de-reference any such pointer,
>> forward-
>> declaring that (just like struct xen_domctl_monitor_op) would do
>> here. Which
>> would leave you with needing at most xen/types.h, but maybe as little
>> as
>> xen/stdbool.h and xen/stdint.h.
> Yes, the reason for " #include <xen/sched.h> " was ' struct domain '.
> Let's switch to forward-declaring.
> 
> Shouldn't it be included <xen/compiler.h> too for inline?

I'm actually not sure why we (still?) override "inline" there. It's a
normal keyword in C99. IOW I don't think xen/compiler.h would be
needed here (just for that).

Jan

