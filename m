Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EB37EDD4C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 10:03:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634044.989273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3YGo-0000co-M8; Thu, 16 Nov 2023 09:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634044.989273; Thu, 16 Nov 2023 09:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3YGo-0000ZW-Iv; Thu, 16 Nov 2023 09:02:42 +0000
Received: by outflank-mailman (input) for mailman id 634044;
 Thu, 16 Nov 2023 09:02:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3YGm-0000ZQ-Nn
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 09:02:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e38e7632-845e-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 10:02:37 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8603.eurprd04.prod.outlook.com (2603:10a6:20b:43a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Thu, 16 Nov
 2023 09:02:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 09:02:35 +0000
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
X-Inumbo-ID: e38e7632-845e-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpRF7xTn2y031mRkvKH41Um75HOPJL8EgV1uVnZCKRPtdSZOHdevykEzfc1e6O04p3QU02rfCrd/YAyVxFxOYRqoip3LzYQRT6UNLujxGFkMc547iRPxmtvnpY+bZwUf3+r2tPYe12NLea9UwZag3ZPkIh+zCS/uO+ndVOA6QOGrWCT/27ZMYFawaIwYYTtH8/djRdn75UEtoswfG5QaVf807b/6nIYi9N/GYROuEjjz6D8L5uIVCPrPx72tpYMcnKj9Az8oUaz/BDx0TvEfmJL0Sm9ySE5kzQiecKqSakrFdpI7CJZ0Hns1wNva/dnoJR9rURNCJjFvNQlXv6IwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1TlKT31mJg1IgSmqjAkHVidRj94x4a7+YgkZYt3M2g=;
 b=PD6qR6ZUt79HdvITv4po8Hy0f9HfSxPN72wiw2JKLzA7WBOw33vhaIJK8rqm2gt/PySJ4Ec4Gms8x1Ysk7PdoL5boFp/KA1vDd/5pbn8Y7Z7M/espcXDx2pJmyLyvd7EXqLEwEYHUGMDxeArqZtHoyhGCF5Ho9rnZC3HTDvMe8PMS3dKlx4VrPXI1Jg1u1lP6Icj0Egpk/2Fkg0uNqg1LECCrnBsUnelRITSLRVWL7tORxZrjOvDSh1ZExoKVOeSLDx2soExMmyMzXs/P0HXZTUOwdwTk8SaZPbYdR8c4whowgVgbVBFEXck2BkqLehO5TdtEiDuBbd2UFSRVNvc4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1TlKT31mJg1IgSmqjAkHVidRj94x4a7+YgkZYt3M2g=;
 b=YXx1X3Wzy/nkLWb3cFNn25+D21c/eo8vZHqK6ZxLVQCPy4UocFhMmU2AQW7TJ10e540CI3ylBzLehNJjA1RS+pgJiVCzdcXtzzdxitt7OygSOL59p1RvhMLvlbsuG9mMpAsl7UlrrmDFpIb7Sal4+G4OqNR7G5nWfZT+i3L7YtIZZlVjvxD6GTLhAWtQ7wkx4PH6m0uFEGicNW14YsvRtlZyf/GXuAWXr0J6X/N2TbUBWRTjgys7knreN38lZ7Gx92dtjgMGnX21Y01KOhW/VQ+04qiCBjobUlPPiAoboPQ6UUqEWmuIrr8ZpMO0hM2tl+felgrhKuc81L7YGzj8EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f9772e8-0c30-4d9e-92af-2ad66f28857f@suse.com>
Date: Thu, 16 Nov 2023 10:02:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 1/2] automation/eclair: make the docs for MISRA
 C:2012 Dir 4.1 visible to ECLAIR
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Julien Grall <julien@xen.org>
References: <cover.1699975581.git.nicola.vetrini@bugseng.com>
 <f14b266f18089f5951a3e390a5ebfe713beb8dbb.1699975581.git.nicola.vetrini@bugseng.com>
 <f63fa9b5-a821-49d4-88f6-7d991ab6c644@xen.org>
 <1689d4b47d708098c43601a58e867f1c@bugseng.com>
 <ecbfa46d-2e0a-4685-9695-f7de37e7b6ce@xen.org>
 <fd6f51afebb9fd90531e30289eb99d8c@bugseng.com>
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
In-Reply-To: <fd6f51afebb9fd90531e30289eb99d8c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8880a1-090f-4b7a-1f38-08dbe682c687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gux1tJT/NYP9EbenW6s28asNrvdT+HYAENtES9O46S85xUE0gxGLXPSb5B4AaEP5la4/ZUTYCA36riF3pJKDrJSZBi2KpdbYDVv9XaHpq6csO0cIx/HsViLahrjY4G6vMhcq1pr5NL4dgi1P0XexSEfjiJx7i7kU+sINWZjb1YG9QovtR1XlYA/idZNKau8Fqm/Ez59Rea6VmMUcFFtYIZ/9v5wEVhc337Kvv3RBDyemZ+DdhEBZhV4Lftmeg+OSPjyDUCB5tZMByjJ/8LydzPOZTx9+IQEofjyC/jIq1k6wNPL3aUz2/NtP1wy/zXo3CTi/VJRGLBcKlOHmba5b11FGKpYVxuLe7qaiuBrj8fZo9QF9xiWVwWBe9qb6NqDpqubKFWVTBmT2aXPMr+JhuFmfwB4PXhWr80BqT7EoSBCc5j7jjs4Z4HF0/FQPzunUqGVOC3Fr03Ok8Rm9y2JtDMoKv8frP8zitjknjKt8O1O5xn1V+EtSiYQgZ4RKColPkfmI/M7z4v4qTFc1f06ltHS9F4inH/Kh1jGxbgnqOkqRXlMGpPB+/t64skbYZQ8hZlPHHmbZ0UjPZZR9tY61GLi5xGAG3Mgs//H5LGGXJnvHcNaY94kv/0vRB3wnBNFfNiVUnBJuPcovTjM4EZCVyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(86362001)(6666004)(2616005)(26005)(6512007)(4001150100001)(31696002)(6506007)(53546011)(4744005)(66556008)(66899024)(66946007)(66476007)(316002)(54906003)(478600001)(6486002)(4326008)(2906002)(8676002)(8936002)(36756003)(5660300002)(31686004)(41300700001)(38100700002)(83380400001)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ditBOWdsRzFMZWpLb0dwRm16eFlBc1FmeGUrd0d3Nlo4OE9zcmN4WUMyeVVt?=
 =?utf-8?B?K0dpTjBScWxHd0czZWc2Y0tPNFNpakN1V2J5L2VyZU5nUSsydWZPOWhLMStz?=
 =?utf-8?B?OXNiRXArdUpHVnYxZkxGRWdRMzFTUUx3bnNPdDFlWlorNDlYWmxpVzQwaXVj?=
 =?utf-8?B?d2g0aVAxZGdjZHdMNzMwTnN3cTdMZlB0d0JSYjdydWJnV3FrZ1hURkZZSjdn?=
 =?utf-8?B?emtOSHdKcHNENTE1NDRuejZrNFIrWUoxOHd1K3Ywb3MrMEhHaWliRDI1UmVV?=
 =?utf-8?B?ZUlod2ZVbElNYXFaU1g0eDIvYit3R3FaT1ovbUEvRTFyYlgxNnhwUGtSdERk?=
 =?utf-8?B?TlVVL2FqYU51QnBjS3pDQnpwMFpXZ1VoeEFCZk5vTE1UVldKejBkTk14U25X?=
 =?utf-8?B?cUt0K2hJckxBdGhTTmYwMSttazR5bTIzQk1DcStkWDNXa1B2MVRTSFVTYnUx?=
 =?utf-8?B?QkpCYkNtRnpFNTBEbVFvSnVXRDhFYU4rQWh0RFNudUVRaHBlMUNJbmJaTEZB?=
 =?utf-8?B?UnNESzNDNmphdmZJQjVHUXhBbHk0eVgzTmE2VTM5dXNSSURCTU5OdG40ajBx?=
 =?utf-8?B?K1FiZ2M5YklNNWh1anl0VzA5dXdqck9ucVB3WVFGUFpRcEYrWkcwbEVPcDEv?=
 =?utf-8?B?MFRJNXFOUmZjSE1LcmRWWDdFZ2d4bkZjcUttamtRV3ExSmdtTzJoemJVNUtM?=
 =?utf-8?B?UXhrZDdIem53Z2l2eEY5TWtvb1VsNlhFVFNET01JV0J0blFlMjg3MWdrR3or?=
 =?utf-8?B?MlJFbm00L0VxRjhHMFUwV1hQM2l2UFVTTEJnb1dZUjhxTHdWL1dsdmtHLzdv?=
 =?utf-8?B?SHhabStPdVo2bk9OazlENVh0SUJPQXFyVStjRXd0L0krVGNCREFwZUdzNVhx?=
 =?utf-8?B?WjV3QWVQSW5CKzNidnRhdU5odWlUT2hNYkp6bFBzZi9CdFpNbUJhOWJKS1Fl?=
 =?utf-8?B?RTlTS2tibWQzWUt4aFpodjlHK01NeGhyamFqWmxVeXR3TVVhWU5KV014MU9h?=
 =?utf-8?B?UzRZb1QwRTdzY1pxd3NxVGQ0dnFIaWE5cXdtRk5CMnJ4M3dDMGgyeGVHTTdx?=
 =?utf-8?B?aXFVQm5JNW1nRzk2MWxlVmRKTUp5RGRtc3h2bC9pSmZzRGxreWpIUnFjenlC?=
 =?utf-8?B?ajlVMmdPdU5oWENVakRWNzFmMk0xbzNLRndyb2JhdE9JckwzSnhrVmJDb2Ji?=
 =?utf-8?B?b3IwZlRxQlkvUTdPY3gyUEUzUGwwcnArNFpqVytqUUZhRTllYjlaSkFRZ21n?=
 =?utf-8?B?UTczelJlOFpyTVhYdlhGMTl6ejNzOU1vQ2tmVW1PWjUwRkhmOUdHaTNzaGF5?=
 =?utf-8?B?bkplMllGWkdyUVNQN0FQUk42cnU0amtzcWU4Zm05Ui9YN2Zic1FYS1Y0TVo5?=
 =?utf-8?B?cnpZWEtRZHoyN1QyTGdEWUpITjlNbks4VlZLMmE5a0poc1AyNFVZQ2dZdGZn?=
 =?utf-8?B?bmNtRDJSZGNUSjAxYy94MEZqS1ljWmZNcFdyZ1h6cTVNUzBhWVlCMlk2YjBs?=
 =?utf-8?B?MmFWaEFnVno1ZGkvZEhiYWZYeVlGd2Vxa0RFeGFRZnh0VjhPZCtDQTR3T0JI?=
 =?utf-8?B?enVKR20rVWZtWnFzVkVnTkpjVHZhc09ickhSd0FHeVNkQXVkMkZXamdaMlNy?=
 =?utf-8?B?aHdWUFZJUU9UcjVSYzZnTTdiei9xd0xLd2RzT3pjN2JkVy9nY2NBdG1UVjky?=
 =?utf-8?B?UEFhaEdCSW52MFczYzdkTjllWTE3MTlaRnVha0xmUGpVQ0ZmOWdMMXlkTHJB?=
 =?utf-8?B?bzF2dUs4ZjdqbnArb1p2ZmZMeUhHVW8rZXhRMzJ1RFVkcCtpOEtYcy9iS0Q0?=
 =?utf-8?B?b21UeUNCVUpyS2JsUzIraU96dE9yQ3QvRkNMRlRJUUhnVnp5blBlMkhFbjBr?=
 =?utf-8?B?WlYrTC9JSGRyWFRWQnlRZ3p2aG5Oc0R5UmtyaXpETXE1UXdWNlF4eExGNS9i?=
 =?utf-8?B?a2Z3TkRJTDdZQlE2VWhGOGJKemVIaFMzaUQ5ZU5yc3hBSHhhTGxyMVV6cDNC?=
 =?utf-8?B?Z2FvSGdtRjczV3RtTXRBRlRVTnZXZ01oQi8rV1pzaXJYRFJnODhTQ0pUTTNy?=
 =?utf-8?B?K2VpbmhZWk4vKzNIQ29ycGJTSlg4ajc3Mk1VcjQ3T0ZpZHFjNkVlVlF2bjA4?=
 =?utf-8?Q?DP1c+XTiHjX7H/D4l4ffbeuVT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8880a1-090f-4b7a-1f38-08dbe682c687
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 09:02:35.7408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILln0jZnKDfH0QdcI/hU5lK7T/yphJqRR+h375/Cs4306vZ8JMHL/ROaD7S1T5nzmGfh+cIUNAQY2CS2/lk+Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8603

On 16.11.2023 09:45, Nicola Vetrini wrote:
> On 2023-11-15 12:22, Julien Grall wrote:
>> But I noticed you were using gcc-12 and originally thought it was a 
>> mistake until I saw the second use.
>>
>> The advantage of a variable CC (and CXX) is you can add a comment on 
>> top why you are specifically requestion gcc-12? IOW, why is gcc not 
>> fine?
>>
> 
> The assumptions in C-language-toolchain.rst (which are reflected in the 
> analysis config) are using gcc-12 explicitly; that's just easier from a 
> certification perspective to have a fixed version.

I'm wondering: Upstream Xen isn't going to undergo any certification
effort, aiui. Downstreams who want to do so may have good reasons to
choose a specific compiler version, which may well not be gcc12. How
are we meaning to deal with that?

Jan

