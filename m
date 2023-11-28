Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915897FBDDD
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 16:15:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643281.1003306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7znY-0003O3-7j; Tue, 28 Nov 2023 15:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643281.1003306; Tue, 28 Nov 2023 15:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7znY-0003MO-50; Tue, 28 Nov 2023 15:14:52 +0000
Received: by outflank-mailman (input) for mailman id 643281;
 Tue, 28 Nov 2023 15:14:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7znX-0003MI-9L
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 15:14:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df190ea2-8e00-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 16:14:49 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7176.eurprd04.prod.outlook.com (2603:10a6:20b:11c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 15:14:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 15:14:46 +0000
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
X-Inumbo-ID: df190ea2-8e00-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5BGp2AxAtPVFJYBj3ODLYjPc4Kkd394h68PDbCKy6jUxdqLg9jdCHn7r7NP1bgP14/6eVXBe/e+QMiM21Sv8PxdI/KC8vH/a9RO1+gH9ISmt4iWxmMrxYj0a7e6dDhfzGFIxugULr491bABxvoIBVWLyx9R+oF80iy+aiT2qLgfbp7NA1blR6YKZ21QwKteowLcjO0Ovas9rgkeGzQbd51VlWdphLZVuDOWAI6CusBfdb/2wBhixVPhuH8NqyNLFKeAysH0IyBnkwGh6/mtQrWE1W5+gTeQwl+nw96JEPAUQzbzprabzwjCVNj/oZgdhXB5sl5vbCmU9WcuHtRBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIesb6o3VI3gC6kU+gpWaIufDfjYm3ssFzuUvLO+K28=;
 b=j1D5RlPYwr3j9902a99sv0PzDWbJIgcD4oIDwfFAEgHPPDwc/7GyRvyHCjmxQDnExKRPGws/h8faJRHTQgYTAcFFg15iJtuzFGxsVi0QSVxq6FWCbzM8RS/rd3SvOxi1bEYNR91wqew3xFDqVMtRrcEXBOXkNbPQztM1AbJekQ9zmXukvMNT1fJRMtfA3yMCz9fVIj+gMzJHVnHNEgEusVRqY6w879xO7ERp7BxA7fCsZyFPt/tA2NZyH9kSFFDS97+JabcnJShZSd1aOpJrgdWcxrazyekxVsQZ/g06KtG3C9kgrttUUFkWxDtoOmFKo2EG3xv3j9nGMI9k3uxRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIesb6o3VI3gC6kU+gpWaIufDfjYm3ssFzuUvLO+K28=;
 b=RiRcM9Ou2yso4/SPjGDwF/GGAWBuJyEAgAasi/4lriwh7eQgW5udkasjMBfmqpCA6/VLpBmLNV4qDIKLKCbpbgwDOTFzj24L9NUSQ8OhYeaC+qvsi2I5oh2bxKWmKwOcMFQpFtGqlMUbhpitHC2qNPJV6rXMUoZVyck2vI2McsfzJpxYGoo+sObhD2iX4BxFZUQwl0yt15rsloD3HaDEXGHyYFiHOZRaW/bIfvOxzUeUsZPy33lGONa9BpRk2IqeLPF/9AnqUA9AjB4lBSIabJe/CwkQfIXsZekgES285WTuvR5ZjW+5Jgc77X+brxJ1fu4BAmzGA4tUNBau2GTjoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe8ee91c-7272-4cb9-b7a6-cb6ec7945bc1@suse.com>
Date: Tue, 28 Nov 2023 16:14:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v2 2/3] x86/pvh: Open PHYSDEVOP_map_pirq for PVH
 dom0
Content-Language: en-US
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>,
 Julia Zhang <Julia.Zhang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-3-Jiqian.Chen@amd.com>
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
In-Reply-To: <20231124104136.3263722-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0396.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a2c90c-daca-4434-a6d3-08dbf024c1cb
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jpfDtcPephlCFBPtLfHv8vYJM93HDGs5Lv+0BL6mQmv9hfCK9LC4KPFa3hhWXYF2HIF8F1s/ZgirTX20lI6tuDb9NRxyXM2GI6GWmBvgo6/ELKS227S8fHus3UvIYugnQC7M3QKbmXnCiJSe76lPHw6KiDlkeQSbUVzAMgl8bpjpjIS9Vz/N2HfiGhOIK0neXsTaFgKLmTDy5X3Q6nM63eoHz07k9f4RQunkBjBKtP8Cj2IIMwp/8ee2g5qchbWdJVrerGf7Jy/n7ZW6ebRNIzkjfBakTGuDh0gYUdv6rwOVkwq4USJLlx9Scvtzm8X11Aw7GyoLnmufHEXR1NFRUbD0FG1MDHRmR6u8EF3O3QdHROHgdcF3VQsiyM5BEXCc5TNTrPl7fjicw4NJbdE2s6ouJTV98zZ78iWGFNoghF6exerkJIhOITW7KWnphnPpZqIdbXnYLAe0b0BJ2nCbCIFKH/kfsXx2RTT/7+Cg8a/r5sjSWPhUVsfWEklYLKTGRwSa9+Z/ymKcRhQz9tCuD7YAb8kGJSec2Ca5AZxdUAcEdqbKBRWa0t/V4KwFjeN/t82Ph5KT/N8YFZ8QsanrEwTXFkR4AZPFnXgomZG2wbVKt0BCc3ZmZKTpcwGq5r2qz/vYCSJa4eBqDPZH6nsZJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(38100700002)(83380400001)(36756003)(86362001)(31696002)(54906003)(316002)(66476007)(4326008)(66946007)(66556008)(41300700001)(8936002)(8676002)(7416002)(5660300002)(2906002)(4744005)(31686004)(6512007)(6506007)(6916009)(53546011)(2616005)(26005)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFc1bW5JL2F5V1BkbXlsYjBZZDNGeUFDcU5KZi9iTUtBN09wUlZOVXFPY1p2?=
 =?utf-8?B?SDN5Q1pxWFFBbEwxY3JKdjVIdnlYMUROYjgzekQyRy9OWnJvbXMvWHNCcUhX?=
 =?utf-8?B?bndyaG03SlI5djBadkZ0Z2RhaDJIL0xEaGtNbVlmTGVXK0JnVW9KRGtzV2ta?=
 =?utf-8?B?RDY1aWVQTmszWmJvVE5PQWVRM0orVkw3SFdMbjMvR1dYcXZxblVIMm5hb2JB?=
 =?utf-8?B?emlrOE1wUFBSNTRSWVlJMWc3UWRaN3JtcXNad3JWNE5ONWZFS1V4KysyTzFV?=
 =?utf-8?B?YUV1MWtTMWJRR2Q2S0h6eTFocDNuaFB6ekdqWVJJNkRPazdSajRFUTFjZkJk?=
 =?utf-8?B?T3kyNWlyVVBzWVhQYUswQlNyQ1ZXSmZoaUJyYzlmc29IS2JieTJuK1J4M2pa?=
 =?utf-8?B?NGh0Z1ArV3B6M2RtWWovSE5YVmpyb2YzU3F3c0ZMMGhOV2lHNGtHdkJjYXc5?=
 =?utf-8?B?NUlKQzhRa3M3RUxDUjdUejFwOHFoSFBQb2t0YkR0Sldubm9JTENPdWNOTTdX?=
 =?utf-8?B?dDUvMllGN2JidkliRW5qMTdIKzlHait5TDA0UFU5RWJyMSt3QWx4UUNlVUp4?=
 =?utf-8?B?Y3piQmtUZVlCOHBGS24wYVhkTXRxc0NzZkFBZXI1QjBJUmNCem43RUZySm5y?=
 =?utf-8?B?L2QwaFIrMXFnQXFOaXVYVHZPUTZRSk54bkFjSkY4VmhVYTlzM0ZIRmFPZHgz?=
 =?utf-8?B?Yi81aG52WElxMUtIbVl4alh5amxRVVJpeDBvY0V5QlZFbmlGdlIybFc0SjZ4?=
 =?utf-8?B?UHZHYjIwd0czTHM3NGRYS0xoSENLZFJWTzN6TXpLZ2kxZHlwakVIQ0F6MU1C?=
 =?utf-8?B?QUV6MzlicHNRZ2tYaFYvamxOWjFxeGpBZ0NqeENXREs4c3h4alI4VVFpZEhy?=
 =?utf-8?B?a0llMnorb3pPWXRsZEhCYzNQNDFPQ05JbmxrVTgvMTFFVlpLbjlQNS9HYk1M?=
 =?utf-8?B?NmNaUGRDa3lWK24wRllRc1NGQ0NCa0QxbWR4TlFOREZWNDYyV2pRSXhqZWJM?=
 =?utf-8?B?OUgyMFpKeDZZQUI1SnJvYkk5ZkN2bktiZmJPVzloWXRlV3lUQmYyL1RnaVJ0?=
 =?utf-8?B?M3hmbXZYSHYxRXVGYUpsems1VW9RNGowZHkxUDJ3VU5PbnFyL3pTWGQ0OEJ1?=
 =?utf-8?B?azRCenFQN3dmV2dKSFMwT0QrMXdQNCs3Y3JxQXp4OFJGR2x4L214NWs1a3VL?=
 =?utf-8?B?eS9kM09sTnJ4TDlYQlFPL2JZaDlCbkFTSm9SRWd5KzA1bldNaUhpanZoT0ZE?=
 =?utf-8?B?OEdMYnlIbkFQcmtSNG00V1I5OWNUZEdWeHkxMHZGd2VZd05VOW1PYk92ZDFv?=
 =?utf-8?B?RDhzOU4zR2o1Q3BoeGJYVlEzMXBrSFZwVkxmRVhHODNqdmpweFlReG03Z2Vz?=
 =?utf-8?B?djA5M0hDMlpyUyswd25zRjEzblRBSXhHTWpTWWZibDNwdHo1ZXFWaDU3dW54?=
 =?utf-8?B?ZDR3MXFQenBYakNvOG9oMFB2eERoNllpdVVhallTbmpMNzQzV2lTUFc5RlNx?=
 =?utf-8?B?ZFdISTJvV3llVjQrSExHQWZ5NjhiakcrdldYVmpoZXdwRUM5TFB2dHZJMk5Y?=
 =?utf-8?B?NkFtL1pDSEpOeHA4bkpHY2wrUHdYWjNHQnk3eS8zVHEvWWg1OFpYaVpXU3NR?=
 =?utf-8?B?SlpINmlMc2VlQW5aY0ZaZGxpNWlRZVVvd1M1cFZOZ3diUFdGUGpVdEZHYmN4?=
 =?utf-8?B?dXhtWmhiR28xSGErd2NVci8zNWFMYjczck0vVDJvZDBVVEpRQVZ5SkRYQzdT?=
 =?utf-8?B?SlpHeG0vM09vZWxLT2t3SFlJVFEreDlWVXo0bzBBaXFzN1dDam5WaFNsS1VM?=
 =?utf-8?B?RUQzbDFyaUVnM09hMnVYUTRXVitrRERpS21adVpyMVJSMzdsdkt3N1FybG9D?=
 =?utf-8?B?NTZuZmJCcmh6YU1YZndCRlhDcWpaWUdlVFlhM2V2UUdUQW04RHhCWmYvdVFn?=
 =?utf-8?B?OUtxUnk4NlJqRzNsQnhhWkFaNWVrTnc4UXZlTEZGN0ZTTjhNSC81alJCUUxU?=
 =?utf-8?B?OVNmNFNzMEJQUjhsWE8rdFMraDQrUFc5YVZRR013TFl6NGM5QVFLQWFLMy9X?=
 =?utf-8?B?UHVuQkVjeFdFMy9kU2pVaWFOblVUbzBZU0hwOHhEQU94MVFFanloODZiSDdv?=
 =?utf-8?Q?kwsXXfZsmltws45CCUTu+KW7x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a2c90c-daca-4434-a6d3-08dbf024c1cb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 15:14:46.5105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFmaZSmhD42Ouo0PeaoRVvhcRMph3tsYcZ+G5tzDh+rjmU9Wv8v69O/GIXFCaTtcds2t9JTB8dnn0DmFAV4K4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7176

On 24.11.2023 11:41, Jiqian Chen wrote:
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -74,6 +74,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      {
>      case PHYSDEVOP_map_pirq:
>      case PHYSDEVOP_unmap_pirq:
> +        if (is_hardware_domain(currd))
> +            break;
>      case PHYSDEVOP_eoi:
>      case PHYSDEVOP_irq_status_query:
>      case PHYSDEVOP_get_free_pirq:

If you wouldn't go the route suggested by Roger, I think you will need
to deny self-mapping requests here.

Also note that both here and in patch 1 you will want to adjust a number
of style violations.

Jan

