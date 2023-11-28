Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC827FBAA7
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 14:00:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643135.1003052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xhE-0001sg-PX; Tue, 28 Nov 2023 13:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643135.1003052; Tue, 28 Nov 2023 13:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xhE-0001qO-Li; Tue, 28 Nov 2023 13:00:12 +0000
Received: by outflank-mailman (input) for mailman id 643135;
 Tue, 28 Nov 2023 13:00:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7xhD-0001qI-OD
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 13:00:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f41780a-8dee-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 14:00:09 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8414.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 28 Nov
 2023 13:00:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 13:00:06 +0000
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
X-Inumbo-ID: 0f41780a-8dee-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amLVEtOOZR8pVVgZ643e2KajQhDsOGGqx+iausJARnHgThXhZNyTAWKEdHNqK2oYIdFIK7+dyPgRIztcU9n1GVtk/kHKScCuoViTKJiatc3Vzyx8pNkKwL52ygaula2lvQf5i7zhH9qFApOe/n2N6aO2zI9g9c01yX6xJlygZMTDQz+MRXOerMy/4luK0TloVAO4nzvPfvZb3cMO/65nRbNe/vrImkagVSwLPXDhPt7CPb0Dgb6j7nCIpitwmkS7G6ucm4EN2oIGo8YTm/1fF1+6D6PZ32tBnRWqJ/0brGpglPMWOCxeY4asQvOxhK34znOsr3Z2DZcPIm3M+9z1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfapMZGC0ldvaZD2FsFFwfN4SpGFQQ6bhBNwcbppQ7g=;
 b=dS3snC4CNMJOXQtkbrlIn7GcwkS0kLu4sJOZ3Fmf9zsMn+OieG5p2Go/MorJ8iuZNEksBJjGamYb91MzWGJ6aijlPbu1fKs/vWmagfwRhAUDFOnmPTCpIm/bG/LQ5JD3y4L8D5SzGPvzSY6LlI5PpBveZWOvY2VM4biYBDnMpyBdvvG5M3IK0UGUYx5Gabmxeb2u/7wFcmojGVi9WwvNNBw2PjV1CsGbbZRMlznFIpbQ+gdkWrJJ6fsKsBkAE04lDWr9qBcGQevh+5lIskvw2We92TCOmZgyOEkaluPa4Xrqlz32osAktkRNyO0d8RbbRZaw6SKbPnN09dWjNcr/jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfapMZGC0ldvaZD2FsFFwfN4SpGFQQ6bhBNwcbppQ7g=;
 b=SbgPhdirUs2vZuwDvepy5nSd7ktP5rXZm8SCYCajwKghEARsBnqagmXpx8eoLz3r+K1qhfAWVVc/jrp2jI8iahDqKGc8Mu/xl2UqQAh64Gh6aPH85CiWiL9o6Nv1nDSrJ+tRVpk+BxBYg71JDyt7RNYFm9lS4GN+sIELoHINRFZIpZEtQcpJyocLt+NSUH8uot7aRR2dY2h2x8rdkdFFGUTQugzOHskuVsTBiJZW4y/lbFSFmNxFtzW3Zp+MEzf/Kp2SjyFd7i6xp6rQgDHbH2CSAL3ugiom9IciIbewNjAcoOyClKbTJGJ6ajHWQBjL5onLRxPgV4dN24tfpURX4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <320b5d4c-73c0-45de-92d5-953bcae59e4a@suse.com>
Date: Tue, 28 Nov 2023 14:00:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/guest_walk: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <e0422c0127ebb402bb4f593d41571caf36b0864b.1701164432.git.federico.serafini@bugseng.com>
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
In-Reply-To: <e0422c0127ebb402bb4f593d41571caf36b0864b.1701164432.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b87e74b-d546-4914-7d3e-08dbf011f1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oJ7+E1kwBoBVHKbuRPBYd7JOkSR3g5fQkTSLwjTn+tGhF2NP4qka/6NDBHCcEEOlOeo74X3U5Y180BmrbXb9HNgIugaO2nXVZ2vylSVRcvMDzUmc2fmJod/SHJgB8ai6hhIxywtsr8kn2VUo7XRdPPCvkEiu3FIKPSZ70sS/c0cROXiZ+ZvfNIstTcIDzSK/Ad/FeMAmUpYv2GoChte2ZrkDJz6On0cE72OGx5RilTklpkkXpiGHUO+pUnhRGAPaVXTSWdsiiL6iw/B6XqStsO0dlCzGeE40EVFSO0JvrcZoO/8VR27YnKx3TmY3rbbvLh/r6sfix3DnfTQPYAZxoh5La4+S/o/aX4xtxkjyHM2eHK/vxLvRX9rF+376ophY9DKIcfD0jSaClW5smEQa0flipt73PbVZKQvOX44is7QkCgY5gntrdA2GzUwHYx2UVVxSNNbzxT4XRQfwinW3VJYHjFyCjWrWsrFEUN/9DZhRHj+uCVaJ9GsUCVJnpmYdV9Jy2bCtEHnpyHssFZuukutqVX/FlRtdCwcO0GZRXJZ9OSEGpqP5Ho7byidaZibxzeX2U+UMN28vndFDj5xPVjDmjMnnhLRQ/f81Wg+ZAywMQfbMy7P1UGXNRNn2TKfpbfPLRefM4SjfPzUsDZpX/iQ9pjUlrdVD423l8/fxXahXpM+LkpfwGX5uuIDUmFyunCgxvZO2+LKghz10WIptjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(31696002)(86362001)(2906002)(5660300002)(6512007)(31686004)(6506007)(8676002)(4326008)(41300700001)(8936002)(83380400001)(316002)(54906003)(38100700002)(36756003)(2616005)(478600001)(53546011)(6486002)(66476007)(66946007)(6916009)(26005)(66556008)(43740500002)(45980500001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW1Ba3pnUCtYclE3OUEvMHRJc0hROUJyanhTeFRvZmRhdjhsVkRmZm9sNFk0?=
 =?utf-8?B?ZzhqVXA4dzdiL3k3RHJuaUpHQWRWSmQ5TmxZdnVURTRxaFJOdDN0TUw4NXg5?=
 =?utf-8?B?K3UralFYUkx3bVpFaTkwNEJvcXUxRm9BYzl5NzduTVlPRFFGS2lFSDN6dW1x?=
 =?utf-8?B?L3h0MWJwYmZobTJDdHdEMW9qRXR0UHJBYlhmOTJWNmc0Nkp2Y01LU3VLZW5i?=
 =?utf-8?B?TXRFdW54VWl3TmFFVjBEa3FqVFR4aGVTUzYrQjBEVng1dUhSWE9vak13Sk5H?=
 =?utf-8?B?U1cvUktnd0F2ZmRBa05KVzRPbDdkNjVPdTQzeGZIaXFLVkprQUZPQlhZelNa?=
 =?utf-8?B?NVpyamZKMXZtdXlRNHJNeDZmYmJ4T2pWemFTNDZveDE1Tit1MGNYYkJQbzBY?=
 =?utf-8?B?cGtQT1JDN09zV0RMUUFrNGFQcG9TVGprWmdWUmdhSWZkaGlTczF1TS9rTXg3?=
 =?utf-8?B?WjNwYytkZzdVOUM4L2VEV3hlcDZqZFk1NC96TEpMVEx1VzIxbVE1MksvRDNU?=
 =?utf-8?B?VGpzUDdFeENidElLUmNiM3hZb2FoWHgzQkNTVUdOM0xMVTNlMHUwTDB3bWJu?=
 =?utf-8?B?RnFZK0hmV0FERCtMcjFCWjh3UTZwUjNsbmR3Y3BxVjJpMzlvODFqa29UckZx?=
 =?utf-8?B?MlpZd0hjdzJkUzFkdGo2dmhIQjR2dXZTV3JSVTJhczJFd1EvWGw2WEtVaXFv?=
 =?utf-8?B?dmp4cUQ2UE8wQ1plNFpTWVBZekY3MFd0NjgxZ1BGMVB3Y2cwWU9kQTdTb0pQ?=
 =?utf-8?B?Z1R2ODdnL0VhWkEwVVVrZ3RscEJ2WlpDcjdBc0RZcFZGMU5BUXB5VmR0TXNR?=
 =?utf-8?B?N1Y4YkRTUDZwMjdmeTNTSmdwM0dyL3IyaTBIbmZWNWw0QktoZkJGT0ZYSHAw?=
 =?utf-8?B?N0U2dzYxaGY5ak5iNWxaNWJ4UCtHZzBOZTBmVkx5MmVJeGFVV2w0dlhwU3U5?=
 =?utf-8?B?ZkZWb3BYQk55cWlscjVUaUcweGFyQ2xGM3ljY1k2cElGVzRDM2JHVTM2Yll5?=
 =?utf-8?B?ZlF6UmVPU1gwU1doWStyWk5FUmRyUGYwMWRPUDBFcXlyNnk3NWdaUCsrUldh?=
 =?utf-8?B?YmRsL0t0T1piNEpEYjdBdWFUOVgrc1JQbU43V3ZVbXRsTlJSaGFrZE9iZmVz?=
 =?utf-8?B?TXlOcFNSTk45YWtOcjV4SUQ5YmNKWjBWZGRkTDFmR0NrbHdUWERyVmR2b014?=
 =?utf-8?B?R0dSWXJvc2tINjZ0cnRFOUNDSlZWbHZMSlhha0NjQnp5eHFZaHE4Ly9naXdB?=
 =?utf-8?B?Vy9kcDRKSGJaTEpxbEhqVFJBV0ZRdXh2dEc2MGdvd0UwRmRnV09xQnA3UXdS?=
 =?utf-8?B?dmVUenA0Q1VySG1HM2xMdzRSM0dXVVJ0L2lQbnBld0xha1dNRTdhTlQ5VkJa?=
 =?utf-8?B?ZzBnbWZVTVc0NHl0L2NwbGFMWWdrOTgvY01zMGk1SjFUNWp2SGdPR0oyMWdH?=
 =?utf-8?B?Y1hjWi9tWUZ5S1NsNUt0VlQrVVM2cGdXL2VnRlphTzR6cHhERzVXVkw4M2ZQ?=
 =?utf-8?B?NUttN0x6WmhzYkFvTjg0V3BIT2l3UWF2U3RtcXgra0JsL2NiLzlwSUk0WkFS?=
 =?utf-8?B?S1RxdTdnVWsxRUx2dzNBQkJqMG50NVFCaVRCUHhQWHFjRllqRHR6c3FsS2xz?=
 =?utf-8?B?Q2xrN1FjaFNmQ0VmZURvaVdRdFhCdmZLVmNndCtWWllDOXg1Y1p5UlQ0ODFT?=
 =?utf-8?B?U2MzSGZ5cm9USVR0YUg4Z0FRYUJXK1ZxbHlwMnRzSDBZNlF2cmdDZTJmT1hW?=
 =?utf-8?B?dWJxeWlpa3lBY2lIKzJsY2lXU0pubHZTUjRyT1N3bWl0dnVOR3VFd2hWQTBH?=
 =?utf-8?B?c2s2SlFldDNGYldRQVlJcGdvR3JaejcyNG0rWllkOVdwYnVzS09DZzlramV6?=
 =?utf-8?B?R3ZyWDFYbVRHTlJNQW14aTFWMmRtWW90b3cvUlRoSGhXSmRrTEtaUkpRYTlo?=
 =?utf-8?B?SUhCaUs5Vk93WXhMb0ZsMEV6R1IyTWFqUFk2SjRzeHltS1ArWFM4ZHpEUTdo?=
 =?utf-8?B?Rk5UOHNld0RMdm5KcVZxK2ViK3cybDFUdytFUndpN2xURmhMTHE1dU5yRGVi?=
 =?utf-8?B?UllHSyt0cGh3MWcwMFZZMGtLeFRUc1dlM1YvNS96RGE5V21MRW5xMTNQMXBN?=
 =?utf-8?Q?utmWaIwigGMWHn46Flj/yX8QQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b87e74b-d546-4914-7d3e-08dbf011f1d3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 13:00:06.6815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ChIN4mA1Zmh5GcXvN+joddZHuipQlCOLyJbOGL80EPQb25Imjk9XmAFZUTH5i/Ks/MrgKzZNikH/kKPlnRdTew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8414

On 28.11.2023 10:46, Federico Serafini wrote:
> Uniform declaration and definition of guest_walk_tables() using
> parameter name "pfec_walk":
> this name highlights the connection with PFEC_* constants and it is
> consistent with the use of the parameter within function body.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

I'm curious what other x86 maintainers think. I for one don't like this,
but not enough to object if others are happy. That said, there was earlier
discussion (and perhaps even a patch), yet without a reference I don't
think I can locate this among all the Misra bits and pieces.

Jan

> --- a/xen/arch/x86/include/asm/guest_pt.h
> +++ b/xen/arch/x86/include/asm/guest_pt.h
> @@ -422,7 +422,7 @@ static inline unsigned int guest_walk_to_page_order(const walk_t *gw)
>  
>  bool
>  guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
> -                  unsigned long va, walk_t *gw, uint32_t pfec,
> +                  unsigned long va, walk_t *gw, uint32_t pfec_walk,
>                    gfn_t top_gfn, mfn_t top_mfn, void *top_map);
>  
>  /* Pretty-print the contents of a guest-walk */
> --- a/xen/arch/x86/mm/guest_walk.c
> +++ b/xen/arch/x86/mm/guest_walk.c
> @@ -69,7 +69,7 @@ static bool set_ad_bits(guest_intpte_t *guest_p, guest_intpte_t *walk_p,
>   */
>  bool
>  guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
> -                  unsigned long va, walk_t *gw, uint32_t walk,
> +                  unsigned long va, walk_t *gw, uint32_t pfec_walk,
>                    gfn_t top_gfn, mfn_t top_mfn, void *top_map)
>  {
>      struct domain *d = v->domain;
> @@ -100,16 +100,17 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>       * inputs to a guest walk, but a whole load of code currently passes in
>       * other PFEC_ constants.
>       */
> -    walk &= (PFEC_implicit | PFEC_insn_fetch | PFEC_user_mode | PFEC_write_access);
> +    pfec_walk &= (PFEC_implicit | PFEC_insn_fetch | PFEC_user_mode |
> +                  PFEC_write_access);
>  
>      /* Only implicit supervisor data accesses exist. */
> -    ASSERT(!(walk & PFEC_implicit) ||
> -           !(walk & (PFEC_insn_fetch | PFEC_user_mode)));
> +    ASSERT(!(pfec_walk & PFEC_implicit) ||
> +           !(pfec_walk & (PFEC_insn_fetch | PFEC_user_mode)));
>  
>      perfc_incr(guest_walk);
>      memset(gw, 0, sizeof(*gw));
>      gw->va = va;
> -    gw->pfec = walk & (PFEC_user_mode | PFEC_write_access);
> +    gw->pfec = pfec_walk & (PFEC_user_mode | PFEC_write_access);
>  
>      /*
>       * PFEC_insn_fetch is only reported if NX or SMEP are enabled.  Hardware
> @@ -117,7 +118,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>       * rights.
>       */
>      if ( guest_nx_enabled(v) || guest_smep_enabled(v) )
> -        gw->pfec |= (walk & PFEC_insn_fetch);
> +        gw->pfec |= (pfec_walk & PFEC_insn_fetch);
>  
>  #if GUEST_PAGING_LEVELS >= 3 /* PAE or 64... */
>  #if GUEST_PAGING_LEVELS >= 4 /* 64-bit only... */
> @@ -399,7 +400,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>       * N.B. In the case that the walk ended with a superpage, the fabricated
>       * gw->l1e contains the appropriate leaf pkey.
>       */
> -    if ( !(walk & PFEC_insn_fetch) &&
> +    if ( !(pfec_walk & PFEC_insn_fetch) &&
>           ((ar & _PAGE_USER) ? guest_pku_enabled(v)
>                              : guest_pks_enabled(v)) )
>      {
> @@ -408,8 +409,8 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>          unsigned int pk_ar = (pkr >> (pkey * PKEY_WIDTH)) & (PKEY_AD | PKEY_WD);
>  
>          if ( (pk_ar & PKEY_AD) ||
> -             ((walk & PFEC_write_access) && (pk_ar & PKEY_WD) &&
> -              ((walk & PFEC_user_mode) || guest_wp_enabled(v))) )
> +             ((pfec_walk & PFEC_write_access) && (pk_ar & PKEY_WD) &&
> +              ((pfec_walk & PFEC_user_mode) || guest_wp_enabled(v))) )
>          {
>              gw->pfec |= PFEC_prot_key;
>              goto out;
> @@ -417,17 +418,17 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>      }
>  #endif
>  
> -    if ( (walk & PFEC_insn_fetch) && (ar & _PAGE_NX_BIT) )
> +    if ( (pfec_walk & PFEC_insn_fetch) && (ar & _PAGE_NX_BIT) )
>          /* Requested an instruction fetch and found NX? Fail. */
>          goto out;
>  
> -    if ( walk & PFEC_user_mode ) /* Requested a user acess. */
> +    if ( pfec_walk & PFEC_user_mode ) /* Requested a user acess. */
>      {
>          if ( !(ar & _PAGE_USER) )
>              /* Got a supervisor walk?  Unconditional fail. */
>              goto out;
>  
> -        if ( (walk & PFEC_write_access) && !(ar & _PAGE_RW) )
> +        if ( (pfec_walk & PFEC_write_access) && !(ar & _PAGE_RW) )
>              /* Requested a write and only got a read? Fail. */
>              goto out;
>      }
> @@ -435,18 +436,18 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>      {
>          if ( ar & _PAGE_USER ) /* Got a user walk. */
>          {
> -            if ( (walk & PFEC_insn_fetch) && guest_smep_enabled(v) )
> +            if ( (pfec_walk & PFEC_insn_fetch) && guest_smep_enabled(v) )
>                  /* User insn fetch and smep? Fail. */
>                  goto out;
>  
> -            if ( !(walk & PFEC_insn_fetch) && guest_smap_enabled(v) &&
> -                 ((walk & PFEC_implicit) ||
> +            if ( !(pfec_walk & PFEC_insn_fetch) && guest_smap_enabled(v) &&
> +                 ((pfec_walk & PFEC_implicit) ||
>                    !(guest_cpu_user_regs()->eflags & X86_EFLAGS_AC)) )
>                  /* User data access and smap? Fail. */
>                  goto out;
>          }
>  
> -        if ( (walk & PFEC_write_access) && !(ar & _PAGE_RW) &&
> +        if ( (pfec_walk & PFEC_write_access) && !(ar & _PAGE_RW) &&
>               guest_wp_enabled(v) )
>              /* Requested a write, got a read, and CR0.WP is set? Fail. */
>              goto out;
> @@ -468,7 +469,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>  
>      case 1:
>          if ( set_ad_bits(&l1p[guest_l1_table_offset(va)].l1, &gw->l1e.l1,
> -                         (walk & PFEC_write_access)) )
> +                         (pfec_walk & PFEC_write_access)) )
>          {
>              paging_mark_dirty(d, gw->l1mfn);
>              hvmemul_write_cache(v, l1gpa, &gw->l1e, sizeof(gw->l1e));
> @@ -476,7 +477,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>          /* Fallthrough */
>      case 2:
>          if ( set_ad_bits(&l2p[guest_l2_table_offset(va)].l2, &gw->l2e.l2,
> -                         (walk & PFEC_write_access) && leaf_level == 2) )
> +                         (pfec_walk & PFEC_write_access) && leaf_level == 2) )
>          {
>              paging_mark_dirty(d, gw->l2mfn);
>              hvmemul_write_cache(v, l2gpa, &gw->l2e, sizeof(gw->l2e));
> @@ -485,7 +486,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>  #if GUEST_PAGING_LEVELS == 4 /* 64-bit only... */
>      case 3:
>          if ( set_ad_bits(&l3p[guest_l3_table_offset(va)].l3, &gw->l3e.l3,
> -                         (walk & PFEC_write_access) && leaf_level == 3) )
> +                         (pfec_walk & PFEC_write_access) && leaf_level == 3) )
>          {
>              paging_mark_dirty(d, gw->l3mfn);
>              hvmemul_write_cache(v, l3gpa, &gw->l3e, sizeof(gw->l3e));


