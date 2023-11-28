Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECFF7FBBB6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 14:37:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643178.1003132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7yHC-0007aQ-BO; Tue, 28 Nov 2023 13:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643178.1003132; Tue, 28 Nov 2023 13:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7yHC-0007Ym-8c; Tue, 28 Nov 2023 13:37:22 +0000
Received: by outflank-mailman (input) for mailman id 643178;
 Tue, 28 Nov 2023 13:37:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7yHB-0007Ye-1z
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 13:37:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40c4d65e-8df3-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 14:37:20 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8107.eurprd04.prod.outlook.com (2603:10a6:10:243::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 28 Nov
 2023 13:36:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 13:36:50 +0000
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
X-Inumbo-ID: 40c4d65e-8df3-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LubRkwu9Ril8fhnhhH3q0m4lQb9lVJOCytZ8wrz04LUVA6xdo2sjqskzRK5h+5sbe8Mt6uSX2+aduVD746x/U3bZdOxTh8cUlKVhwDXzTGSNcAKOQoc4vySavP6Pk5xNsOliQuzbx34fTDLQzZz5bLGGGBwbmrXvE3KXcJz53lx+jheHqy5G3+lq/VjtGHEvrhipRhGQAlMzH6Fe/f3DfAIPQ05ynHdlbK9vYwwaN8+bA/Jp6sCGdF5GUZ5iKZs/JmID1Lm8GE4GcpSrdQqIgfrsWOarxAeYgoA5EkZq3HUrhw1g18WD+5HojRzb4wrsud1HrkspEpIrb1zGa3peNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OY86zBBA9t4ojkkGr4da68pOgg67kFaqr6QjZ1cRupw=;
 b=G4k6gDBosZfXgl6q2RgMAMiwTElFIco3qyNx44lndfNVcZcTu9Vy3VmntBF67skMeZnNwWQHRPnIn/32v4lAJz4CYL2t6yMNp03GUQA1F/S7zuqFS51V+ug2+fyL+ZXmSF5AkdkuM7jUgZ8XdqudFRmfT/qRe0sTx5oF1qY9/T60JtxHn58LTqAl9H6nThToKV2tkyda9jaQBeFcUvld6JIOZW+tKeOg4SP0JV7P48kPn6dOtlrKVZy0bkcnM1jpt3BVxfHnRuApGSyh+nAn2nieXrLtya6fB/IT+hg5jKqYsvowWf5fnva/9XnIy/1W35BCw8AxxyqEsRna+FPgUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OY86zBBA9t4ojkkGr4da68pOgg67kFaqr6QjZ1cRupw=;
 b=gB6Ixihc4ZiU1uS/Q3S/+3sMzfBuJ8v+h+4nKPnW+bivQR2uUvGzQaNf4MychZ3rZgCFHCRW5afhAxbMcpTGKFWTtrSPCQp4EZgU48Lmz4dvWyj+WSxj0y2zn0y2V9G7RJSwR6LHSMOSzD50J7ghUQT73KYDykBVOQS3L+AO074T/3W+6dZrFoZktEnStBpBDind3n/aYjfytaRl3l9c528TKKOkVR223K6ed2amTr2nL9o7cpCYd9lcSg3rfrOcP8yg8COiT0DeE80gF2KHilKYp9uSMMOw0v9E3OXUr87lM7a145Z8ad7hRYiA+LavWNa+TPa7jUWlYut7Rur4aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c41d3c9a-170c-4578-9121-898758c451a7@suse.com>
Date: Tue, 28 Nov 2023 14:36:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] xen/spinlock: introduce new type for recursive
 spinlocks
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: javi.merino@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231120113842.5897-1-jgross@suse.com>
 <20231120113842.5897-5-jgross@suse.com>
 <e31f93a7-5270-4c09-8ada-c9bc24172c70@cloud.com>
 <9ce278bb-475e-4244-8332-fef1c55f0f73@suse.com>
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
In-Reply-To: <9ce278bb-475e-4244-8332-fef1c55f0f73@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: ea84fd73-f84a-414e-5814-08dbf0171386
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fOMsEw4tqEAERRUUGUx51nJvNFZXJSu+qAlaCXKzk/cycrUv52CORGDvyGrgVRjkq/shephf8u6MTm5PeTsP6HvAS6EpFVN3Ag9rBMeGCtvwP1tHF4wKdJtSO/fppnUvrrEwl9Fn9lBJR4dsXOypW+TfLHm6Km2oA2g/c4WIPPdc4V61MdXQ1+h2PnakHS/JBdkhLC/bJ2UAB89rKccELrED6X1KSXFqlX5Bw//KkhF5uybTzkSZTS7Zi5QVE0zmHyn05BkxxAO+fL7l1ojEo9CeyHMrJIH1ZtMkniwVycx58N5BVDeOe8uQzwtw7XUh8rG/O7ngZDLK+wxd1PdEIvjI/yWhGemUCNFI9lTjCpggkoX/r4mxl+zr9ueE2lB5VUh7IvUAeF1/ICSGudSFfVyz4yOzzZeGDXfYMsEnYyUcQ3ydd/Ilc4MGkpBBZ6Bg/EncJquj0S0ZnAxs41icGuSj0GVZsaQilI4kplJxOPZeOGlm9S3PlCuYTJpPEyh26aaiuDAFOkXDAeLaPAsh0QFnSbTotUG7LoAOXGC/ujLj12wYfFzoOut9AFBmG5vJ3GW6cgiX8p0hjiPC2fEOqEozxgDClPC9GEKW+qxMRI0YroBjm3SiLUmg5r5tUIdKNFzeY6PomkEAvP9z1OJjfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(31696002)(86362001)(2906002)(5660300002)(6512007)(31686004)(6506007)(8676002)(4326008)(7416002)(41300700001)(8936002)(83380400001)(316002)(54906003)(110136005)(38100700002)(36756003)(2616005)(478600001)(53546011)(6486002)(66476007)(66946007)(26005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGwwWXRRSThqRVdmYk5ROEIvRm5Sd1ZnM2tjRWdvTm9NdC9IelJtdVU2TU5z?=
 =?utf-8?B?UHVaNUYyTWRwRWFnYmNyVGRxbk9PQ0lCWlQxY1VlWnBWbTI2YUhnRlF6RUtr?=
 =?utf-8?B?S2hkMXgrSWNWQkxwV3dkZE5PT20yYmRpQVQyc0d3ZmpydlMxSVFxNFhsZ3JD?=
 =?utf-8?B?NlRkMVdXaXV5UDdIaWg4ZWhXQnRBZzRxeUp4emkrN3l1aGVqVkFlMlhnV09U?=
 =?utf-8?B?OHU5UEFKdmEzWW1ETmhNTGFrcEVjVk5FUHpLaUZxLzhPZU5qUm83R1ZmaUNt?=
 =?utf-8?B?Uzc5ZThRM012TzAxM2xOeFdNdlF2cFVlSWVLSUFuUWx2YjFSM0xNbWozdjlt?=
 =?utf-8?B?QkhGMVMvdCsyOUtLejFjWk5ZQitadk1FcmV0NElYSndKbWJSaGl6aTM1Z0lQ?=
 =?utf-8?B?QWdqL1k2Z2ZKVEc2VkEzczY0U0hkQmZUbktMeEt4WnlhTHhmVEd6RzlmYXZZ?=
 =?utf-8?B?emxsUFhoNmR4SmhOVGZWYzM4eW5VVnAvVjRlU2VuY2ZvR3h3ZTAvRFhIbUV4?=
 =?utf-8?B?d215ZWY1c3JOWFRvOEdWUG8yR0h2VUp4OHJpQUpTSkI2TW53b3BjNEd6WWRi?=
 =?utf-8?B?YWh5T0VOUkpyYzB1aGdzMlR6R2kzZlNDdjhZdlY0MXljbWpwa1hLSXZuekdP?=
 =?utf-8?B?NHBxUXhBTFpTSXFrbXdRRlViNzhhYzUycTBqc1pPMjBHMXFvcGVzUWN1cFhN?=
 =?utf-8?B?eHRUMzVESHo5VWlGcm9WVW5icENGTGtyT2lySU52Y2hZK0UzN293S3NodUkz?=
 =?utf-8?B?UU8wcHNuMFoyNDRHczZlbVRlYUxYYmNYYkh4WG9RUXBvT1o3L05OL3FyeStp?=
 =?utf-8?B?alU3aGhROTlkSjhtQW4wYUY0SElWb0hXMG84ei93eVNNL0dWMzZTK0Qxelor?=
 =?utf-8?B?RUpRL0R0dEdoelFBb1FzNGovSEpDZlhMRjBadFBrN3BIczdoZGZacE1KQ0Zs?=
 =?utf-8?B?OW5PdVNJbTJ2eDgyVkRGWElqRGZ4clhhemE3N1d3QmJFWGZGa0NCbmFwRDBt?=
 =?utf-8?B?RExzOTcxWUNsbUZTWVJFeUR2bVRhclJQbmZldFdYSDVFdk5xRktmUTRkOC9Y?=
 =?utf-8?B?dGdERGNqd0thVDJETnpDQlN2V0NhckM0N242dm1BdGE5WDl5ODZYamxUNjJB?=
 =?utf-8?B?ZVhQM1pxbHpNQnRRa1VRcWhBOXVlYjNIZG9aVkNZS0diYjZJcjRPdWZUclcv?=
 =?utf-8?B?K1cyVDRUL3dSNmFnbDk3UjBLMlkrY0xOeDBERXlKUUI4cWlyZk9iN3g1d3Jm?=
 =?utf-8?B?ZHFOOFJ4d1daQmhLei9xalN6aHk0Rmg1d0JFdmFPaVZXNmxsUUhidEIrRGFV?=
 =?utf-8?B?V0VRZm5VVnZGbXFjUVYxTERMTkU5QWxmeWs4aGp6T29pMXhBMUtVZ3Yxa3hB?=
 =?utf-8?B?bVhGSGx3d3BjK1J4czBMOVpMYmFoODFzTzE1bFFLT3ZoRkZSRmpRVzlzMGZI?=
 =?utf-8?B?TGJtaHQ1ZDRUVWdSczhPZTNPbUNVamI4T3dkR0FVSi9wVkRkTHcraXNldmp1?=
 =?utf-8?B?ME01RDh3UzBUcnYxNzREZUEzdnpEdG1NM1l5QlRUanZKakFtRlgwaFZSNGtC?=
 =?utf-8?B?ZXBYQld4dFZPTW9icVBkcEo2bVhiR3Bickswd3JVWE1lMjRHWVhiaVppcWhu?=
 =?utf-8?B?djZ2QURzRk5BUGp2VFMyZEZ4SEhRTFNuQ2VwMUN3TDk3UDFmZ3pZU2RieXZG?=
 =?utf-8?B?bVRBRStLNDZkSm5FK1k3SFlFZ3BMVktqOUtGM2lzUm5MRzFUTnFzWS9NUm4v?=
 =?utf-8?B?WU9iZGVhNktCTFVZR0N0dGVsUHVZY2hKQTdFZzFQVW5aNTlCUXI1UkNDSlJN?=
 =?utf-8?B?MlFUcWpOY0JwaEM5eTVYVUo1RUVUdTJKZURUQzNkbDA5QXAwWm04b1h1cys2?=
 =?utf-8?B?QUFZWU14QkNHMnlzOVBYNi9Sd1RyeS9uaGRxUHNpcHdmUXJpVTBYTFNzZ1VV?=
 =?utf-8?B?WWlKMWhBMWJLZnRYdW5taHNMa3pwOEpabGtmUmZLQWJvaXFvaVZMZEJsSDRU?=
 =?utf-8?B?M3ZEN1JIbGVRNEpVZEx6VU05dlgwUmRXdGxIWm5DYWhlN3FoZExIK1hscFRQ?=
 =?utf-8?B?NXdFcWg5WmV6T2JMTlRoVGIxYjlsc1B0dDBsVlhuK1p4T3Zlb1RNMlZjNTdx?=
 =?utf-8?Q?J5Vclgo1FvnfUPpCCbXwKdhmr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea84fd73-f84a-414e-5814-08dbf0171386
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 13:36:50.6581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWHpooU4VMdTjfmGyAafJJfPzUXbbOUjbwNvQ3tAu2C7/kGs1XGE1nSg3qJzqO8l+7jAEXkFKCCLHI7iAbzswg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8107

On 28.11.2023 14:16, Juergen Gross wrote:
> On 24.11.23 19:59, Alejandro Vallejo wrote:
>> On 20/11/2023 11:38, Juergen Gross wrote:
>>> --- a/xen/include/xen/spinlock.h
>>> +++ b/xen/include/xen/spinlock.h
>>  > [snip]
>>> @@ -182,8 +191,10 @@ typedef struct spinlock {
>>>   #endif
>>>   } spinlock_t;
>>> +typedef spinlock_t rspinlock_t;
>>>   #define spin_lock_init(l) (*(l) = (spinlock_t)SPIN_LOCK_UNLOCKED)
>>> +#define rspin_lock_init(l) (*(l) = (rspinlock_t)SPIN_LOCK_UNLOCKED)
>>
>> nit: Both variants of [r]spin_lock_init(l) could be inline functions
>> rather than macros.
> 
> I was following the spin_lock_init() example, and I guess that is following
> the Linux kernel example.
> 
> I don't mind either way, but maybe other maintainers have a preference?

While switching to inline functions would be nice, the new item should
imo be in line with the existing one (i.e. be a macro as long as that
other one also is a macro). And converting what has been there shouldn't
be a requirement for this series to land.

Jan

