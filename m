Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD76D7FB7F0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:33:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642938.1002760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vPS-0000NF-Js; Tue, 28 Nov 2023 10:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642938.1002760; Tue, 28 Nov 2023 10:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vPS-0000Jz-GF; Tue, 28 Nov 2023 10:33:42 +0000
Received: by outflank-mailman (input) for mailman id 642938;
 Tue, 28 Nov 2023 10:33:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7vPR-0000IL-El
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:33:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97bf8e0d-8dd9-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 11:33:39 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 28 Nov
 2023 10:33:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 10:33:36 +0000
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
X-Inumbo-ID: 97bf8e0d-8dd9-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GisvrSPD0mju/nxXhRJpMFezXoI8D3iAoyEooZmR7NhoNpShHAoEkWP7+PJ8PFAeJlCQa1L6KLDmDgBsct/CKL3c4kVGe8hDLp+MDjo2n2HAHUSC3moxyseGmm8kgIszYzudnN4tP4cGFJWHgSU61FiyGe6WF45LwOylUcyjxaEVyTgU2LXedbzNazBtZSwGylqw0xKsVx6H1XdJHDg74uj0ECs/vid/wGJcLeGQEMXlwst4YPINDosxAthMlUG7+4ItwzHld1MobPPjOm6d6d4MziJ5hW5M9mH7w1foEk7q+6GdETqTl1AH9STjCAl8yb8rTU5abO/wfY+l9LiZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZprIUxrlQ9pKLtqLP+Mf4qwZU5HLEL5NJRnyyEOBfjE=;
 b=AjIJ0ZLenNC6VLgDmyydWCNFbj4LGF7aEg1vdZB73Sxccof7TzUqDFkUzaABQ548qz61Q2kiLDpEhlM9oGoYCJZ8u3srnji+/BIcKs5kjBZDrW8YURKrJP32adfodUf6wxpzXIEPj8buuGTD7TrYkXel72eT6BD9l+8yj2is7UPtPFNoSB1pZjt80ysIp6R6D2yM2mhgsGtjp4dAysCx2w/3ruJkJqwsvpsc/5vOyXOXfiX6HLINrzNjvGSYQlbN9qx6ZbF2zjyEZjEr5gY4TgY8vDlp0lcbAit+YPljz7zp4GIy+6+BUZmer9pRkogAPAjaO56P3ljmw2To1EPnww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZprIUxrlQ9pKLtqLP+Mf4qwZU5HLEL5NJRnyyEOBfjE=;
 b=geq83vgh25rZJ+2teVQ060OPqtI4NnpAoiLygEkaRCVpZegeW/csa5t2+tnhQJqoVcRRua2VSJN6x5P1suFMYOugtNJ8Zkou9s+1bah9RKFmafk63ppKcX2ASVUNP9g+HkIgSz+Z0MbvH7+T2vv41O0UldoDfmv8Yz6b5PUA/46Lt8+f5hCQfgd2OLyavMQ4APTcmpE69ys/jDi1izb+XeAjs4fZFY9w4ud+hWor+J0SAQjGI80qPIiotc6vui+5egJmxGl4uSYSvKl1P6lNc6DDB/yEUgVzxiloU0S9EkW+LyP/2S6qpkK1f/hthXqloRiLML1mAlZt/5HhUYgV5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b068aaed-5bcf-4d4d-90ba-81f5e296b2d2@suse.com>
Date: Tue, 28 Nov 2023 11:33:35 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/6] x86/HVM: introduce hvm_get_entry()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
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
In-Reply-To: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0444.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 24254803-e8db-42be-4afa-08dbeffd7a67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2uYHqOTsBhL/xGq8wD+FDCxY7sl8jnoDJeU4z+KBhGrY7Zc/GOyQoFLjEetHue0GDFW82L+a2jTMWEIGKkqpCUPB/f+88p1JoWaMDaKDPhMxtDEAkqFjLgiUC900/WVtG8ymHk21yAunMN/yTY/AnBg9jNzbKmmuWt585wLB5MlDKw6EkJ4zmBNi4Sze3c98T5uiwnVxulOyDt/B+U8dl2cmkRKC45L6eft2N/o4zH4NaPCRUSxIKLrIEY5P+RnphPyDYez43dyDnfuJ5TZ8oFWYoNTmnQAq6ag6cxiE/FcEC1oWN3lJ4S0xKYri2XXjPzprXGQiusp3WuJ0P5xKBv6ObbyzmJRntC/9r5kOXf3VqiLPJsPZRRAhjQ6DijU7AijTPRhZmcjiezdU7OXqDAtRge4NxRu0d8Cl6WiWsYw1KH5sH5ALgI3D9Uzb3TH9FByTqm2wpuH6anK9rQOiA71K0r7fshAcZB5+T4nXUQ5r0110qhSfjB5kThhAWBiDRopA3sTUVZK4/0NA+UKXAzgCfG1Pu6jRfUdHCpm6T6ccM4YoAmyGIDN+iTfkb10ivVQ3DVN/fo0kqZpA8MnlwQ6eS99JBbf7F3nzRFkeNBb9KPhCO0EqUVHmB8X7uRl5sKECA0+PrNY+jb0Pam/jGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(31696002)(86362001)(2906002)(5660300002)(6512007)(31686004)(6506007)(8676002)(4326008)(41300700001)(8936002)(83380400001)(316002)(54906003)(38100700002)(36756003)(2616005)(478600001)(6486002)(66476007)(66946007)(6916009)(26005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWVPL1hPTmN3QkxNZkpuTUdUZFRjOTM0T0hOdmFBOGRSbGF6V0M4YmswbjdO?=
 =?utf-8?B?MGdCQlpPZWZyWk1NTmpFV3ZOczdjKytaNk1FMnBNejlEMlRYTjRFcDdZSm1t?=
 =?utf-8?B?b2FWWlRnUUdZUWcwU09Ubm9jRFQ2LzZZYXR4YXFwQ2ZUVFZHUk5YTDhLUnZX?=
 =?utf-8?B?QlppcWxwZUhLSTI0dHBlNTR0cW4xdXVKVitkaDkrZ0lWcnY1VVp6WWlTR2tw?=
 =?utf-8?B?TmQyRWdyVFdBcHJVbDdoUFcybG5mOW56MjA4Vmk1a0VkVzVRblo2MlNTb2JZ?=
 =?utf-8?B?NFdOdjJrN1NTYzhrTUpQTUlqajFuc28yTmN2a1kwcGF1Z1hVcmdpM2RpQTl4?=
 =?utf-8?B?RTFlL1JsbmNnMG5HU0FUL3k5SHRReFRYbnRzWHVKaklISWFkZXJaVlBtdEhx?=
 =?utf-8?B?WVpMbHR4SWZhb3VGb0ZReGlCaFdhNXhsU1FEUWpKNml6c0JlUTBzZCtiV3Fa?=
 =?utf-8?B?RDk1eVBzeTBac1YwbWV0Nll2cDBSRHhZVkJJdHBKM242c0ZiVUJYVFNGWUVE?=
 =?utf-8?B?Y3RlWGRDTVI0dDZqWmNTeG1GNVVScTBOUHFPOGxGZEJveldpWWNXdzZyWHha?=
 =?utf-8?B?cHVwNDdndFRENU1FSUZzVnJNRjhMSmREL3pOaUF3TEJxTGlmemlrOS9IMzVS?=
 =?utf-8?B?bVd3Nll3b0U3R05IdHNFdlNwSXFUTWUwM1l6ME54V3F1WExNSmhyeWRJaVJl?=
 =?utf-8?B?emVxN0ZFczJ2NzBzTWxZNlJJOHFtT29HZENpandIakk4QzR0ampaR1Ixd0da?=
 =?utf-8?B?NkFhUDVBZFdsc21UbURSK3hUbzJiMGJGVm1ETWVEQnA1RElwVk9xY3dOZHlx?=
 =?utf-8?B?K3I3OTFvTDlPWGExdEZHbGpOQmo3eC9xOWwzN0FZMjU5UHU4b2N6M2lod0Vu?=
 =?utf-8?B?S1ppUjFYbUo3ejhCRkkzd09Vc0V6ZFNrZWY2bDlJTWdtMDVkTnRJVDhPNEg3?=
 =?utf-8?B?ejFDQ293cU5sdVBsTlZLcWwzbTVuYTdKbC9IZHZHM1ptZlhjNnkxZnd4N0ha?=
 =?utf-8?B?N0lkL2Jxa2lST055TmdFZ091ajVDOW0yU2JBQmcvNkUwN1FDbUtFWHRmb3BY?=
 =?utf-8?B?cHorMFhSdlNHc0dXVlhvQ1FyUWhMR3hZZjdiSHo1ekhtZjA0K2VYeTl3N1RU?=
 =?utf-8?B?SU15VlF2b3QyNnlqS3U1OFpwZ0lOZ0xvVEw2YVRnS2ZlVDZnV0RSSU1KdnZU?=
 =?utf-8?B?Mi9KVDJDVGRVSGY0TVB4K0tDUjhvTXFESnp6aGJ0bWZtUlVsckxhN1BManpE?=
 =?utf-8?B?cEx1czFSdVRLWmVPRzhWMGtJMjNBSjR3eVExWWZjdzRPa0RTejI2cnA5VzVN?=
 =?utf-8?B?WXQyNjJRMlNsYis4NUJxRFNRRm9sRnR6ekcwemZUSVladXlMWVNVeks0Umkx?=
 =?utf-8?B?RXVYcXhvd3lwQ3VMTmlHRXY0ZE0vb0loNXVWT0l1SmJvR2RnaGIvOWxtMjNm?=
 =?utf-8?B?L3duQTlrYmdCR3pxWGI3clczUTA5ODUvWG9TdU5sRTFYREdWRkUwM1A4WHYw?=
 =?utf-8?B?Qm4xK0VPdVROc3NpWHVnQmtRbHBEb2psWDVaZ0pNNmNrVm9zc2JPKzBJd1E1?=
 =?utf-8?B?amxGY0hIQ0Z4WXpQb1RrVTVpdU1FRkNPU3NmWklMa3QwalBTUjNqZ05MaStm?=
 =?utf-8?B?ZEVwR29hbUpLNXgwMXpING1EeHF3Wm9lZjdMQmp5VS9wZVcwcUR0TmJhczBT?=
 =?utf-8?B?UW00NEFiTjZXRE1xNUdyMndmc2dMbXFSbE5FdWxIRTRUOE5KT0w5ZmpkM3BK?=
 =?utf-8?B?K3Q0Ym15djBUUFlHTHgwc0doZDlYU1FnRzYvNERDcG81aWtsaFB3Z2tDVUVX?=
 =?utf-8?B?NkU5WjBIdkV0MWMyNUU1YysrcGNGaHE0UG5qZ05hNDEwSGVDcmpVSHEwSWUz?=
 =?utf-8?B?bE44NUhUeDU5SEhPckpKWm9keVBmbzZycGxWNVg0Zm1WUTJHcEplVVB5V2Qz?=
 =?utf-8?B?aFRBNDVpaXNjdnpNK284OEd4NDlTalRiM1crdzh3K0xNZjNBczFLSGt3SHNv?=
 =?utf-8?B?NFJ6ZGE1VStPQUZXUjBqenJPME5sZVRlR1VTQUppMzRnWlN0Q3lBVm1rY1NL?=
 =?utf-8?B?RnhkTTl1L3BzdWEzcVdFcGhNMFQvRWlDUDNDUzUvblJEYmVGMVZ3OTJSMHl3?=
 =?utf-8?Q?pp+pEBQvziO4SBKeOah+KWFA9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24254803-e8db-42be-4afa-08dbeffd7a67
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 10:33:36.3445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSomdg0tBYMx8qmPP3mXeTooeqQhQ7z/vKVjA6z1LXguqHVbsf0Tg7WfUJJfGQDJzhtrwTAMY4wW5nsosd/Jzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844

... to accompany hvm_read_entry() when actual copying isn't desirable.
This allows to remove open-coded stream accesses from hpet_load(),
along with using the helper in hvm_load() itself.

Since arch_hvm_load()'s declaration would need changing, and since the
function is not used from elsewhere, purge the declaration. With that it
makes little sense to keep arch_hvm_save()'s around; convert that
function to static then at the same time.

In hpet_load() simplify the specific case of error return that's in
context anyway: There's no need to hold the lock when only updating a
local variable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v3: Rename to hvm_get_entry().
v2: New.

--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -637,7 +637,7 @@ static int cf_check hpet_save(struct vcp
 static int cf_check hpet_load(struct domain *d, hvm_domain_context_t *h)
 {
     HPETState *hp = domain_vhpet(d);
-    struct hvm_hw_hpet *rec;
+    const struct hvm_hw_hpet *rec;
     uint64_t cmp;
     uint64_t guest_time;
     int i;
@@ -645,17 +645,12 @@ static int cf_check hpet_load(struct dom
     if ( !has_vhpet(d) )
         return -ENODEV;
 
-    write_lock(&hp->lock);
-
     /* Reload the HPET registers */
-    if ( _hvm_check_entry(h, HVM_SAVE_CODE(HPET), HVM_SAVE_LENGTH(HPET), 1) )
-    {
-        write_unlock(&hp->lock);
+    rec = hvm_get_entry(HPET, h);
+    if ( !rec )
         return -EINVAL;
-    }
 
-    rec = (struct hvm_hw_hpet *)&h->data[h->cur];
-    h->cur += HVM_SAVE_LENGTH(HPET);
+    write_lock(&hp->lock);
 
 #define C(x) hp->hpet.x = rec->x
     C(capability);
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -15,7 +15,7 @@
 
 #include <public/hvm/save.h>
 
-void arch_hvm_save(struct domain *d, struct hvm_save_header *hdr)
+static void arch_hvm_save(struct domain *d, struct hvm_save_header *hdr)
 {
     uint32_t eax, ebx, ecx, edx;
 
@@ -30,7 +30,7 @@ void arch_hvm_save(struct domain *d, str
     d->arch.hvm.sync_tsc = rdtsc();
 }
 
-int arch_hvm_load(struct domain *d, struct hvm_save_header *hdr)
+static int arch_hvm_load(struct domain *d, const struct hvm_save_header *hdr)
 {
     uint32_t eax, ebx, ecx, edx;
 
@@ -277,7 +277,7 @@ int hvm_save(struct domain *d, hvm_domai
 
 int hvm_load(struct domain *d, hvm_domain_context_t *h)
 {
-    struct hvm_save_header hdr;
+    const struct hvm_save_header *hdr;
     struct hvm_save_descriptor *desc;
     hvm_load_handler handler;
     struct vcpu *v;
@@ -286,11 +286,12 @@ int hvm_load(struct domain *d, hvm_domai
     if ( d->is_dying )
         return -EINVAL;
 
-    /* Read the save header, which must be first */
-    if ( hvm_load_entry(HEADER, h, &hdr) != 0 )
+    /* Get at the save header, which must be first */
+    hdr = hvm_get_entry(HEADER, h);
+    if ( !hdr )
         return -ENODATA;
 
-    rc = arch_hvm_load(d, &hdr);
+    rc = arch_hvm_load(d, hdr);
     if ( rc )
         return rc;
 
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -39,6 +39,21 @@ void _hvm_write_entry(struct hvm_domain_
 int _hvm_check_entry(struct hvm_domain_context *h,
                      uint16_t type, uint32_t len, bool strict_length);
 
+/*
+ * Unmarshalling: check, then return pointer. Evaluates to non-NULL on success.
+ * This macro requires the save entry to be the same size as the dest structure.
+ */
+#define hvm_get_entry(x, h) ({                                  \
+    const void *ptr = NULL;                                     \
+    BUILD_BUG_ON(HVM_SAVE_HAS_COMPAT(x));                       \
+    if ( _hvm_check_entry(h, HVM_SAVE_CODE(x),                  \
+                          HVM_SAVE_LENGTH(x), true) == 0 )      \
+    {                                                           \
+        ptr = &(h)->data[(h)->cur];                             \
+        h->cur += HVM_SAVE_LENGTH(x);                           \
+    }                                                           \
+    ptr; })
+
 /* Unmarshalling: copy the contents in a type-safe way */
 void _hvm_read_entry(struct hvm_domain_context *h,
                      void *dest, uint32_t dest_len);
@@ -127,9 +142,4 @@ int hvm_save_one(struct domain *d, unsig
                  XEN_GUEST_HANDLE_64(uint8) handle, uint64_t *bufsz);
 int hvm_load(struct domain *d, hvm_domain_context_t *h);
 
-/* Arch-specific definitions. */
-struct hvm_save_header;
-void arch_hvm_save(struct domain *d, struct hvm_save_header *hdr);
-int arch_hvm_load(struct domain *d, struct hvm_save_header *hdr);
-
 #endif /* __XEN_HVM_SAVE_H__ */


