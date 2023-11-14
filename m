Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A21F7EB574
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 18:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633038.987575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2x8C-0004wh-8G; Tue, 14 Nov 2023 17:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633038.987575; Tue, 14 Nov 2023 17:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2x8C-0004v0-5B; Tue, 14 Nov 2023 17:23:20 +0000
Received: by outflank-mailman (input) for mailman id 633038;
 Tue, 14 Nov 2023 17:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ZB8=G3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2x8A-0004qz-1y
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 17:23:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e24f533-8312-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 18:23:14 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7680.eurprd04.prod.outlook.com (2603:10a6:102:f3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.16; Tue, 14 Nov
 2023 17:23:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 17:23:12 +0000
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
X-Inumbo-ID: 7e24f533-8312-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9PSr8EAt91c+XVbYkR5SB46/NE9lP99oG0S2WBIRIkgJDRB2qhR63Rh8woARjm9dzmZAAC7bWSAmpRGo/ri/ISK6o1whme45mcYIYUZRQagtjYTBPUKv6BRicr+WxDsh1DLEgSJEmiswOLVZdSJCS6dXWAk9r83uABchw8GkthCIwCTy/oAqz907qj7LbrcPOnJwutLYRg7y5V7nAGjYaRYdfpNFyMNAu1xjbrm/jRBcoNxds+1nJSdLKr2KPue1KNhWtx96xoQjnLG2rgs8CrsruFcc04z9Sbes8P/BVPA1hCTr4bnVm/5ZpCUcpqIFi64C4OQohQJzDXJsGIhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIQhSt8tZK1ojQ9oEq/mHPJEijvqb5jyyk7KsMIiFPU=;
 b=lEALhBJHBDESvxojDSz4GWIWWZuDoX1Z/X3mpzxXRc/isjnVCfjqPFohjbkKbvLGXx4LflhPF4KGa9ZV0bYju6gNkP4LoQtPNNuIIFa85BAec8LFtroYx6KuEMZwQJ7CsE/zJeuq+2cNaLSjFm4tfmYbWNQdo0Gta8mFDof59wRGIi7zq8Miv34cnmRcW1tZ6PFUCIvCPwX0XLptxhTz+CrHE29G4FO3yjnIkwxh6GbMCZuizKBA7kuUfim/V266ZFlGm007v0Us6W5/qptwDJgTLQUeHmRsDhqqqrID/DDtEHQnWUuCMGlSoDuj09HRuTEdv1JI31fJYdANr4X/tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIQhSt8tZK1ojQ9oEq/mHPJEijvqb5jyyk7KsMIiFPU=;
 b=oi412hZOoeUL67xiO43ys1Kdn0blXFMy7pbvQArNqlHhlgOYSoj9ZTA5u59g0/7P/8cDvJ8WPyeT1hzuCBhcl0Fjjoa+z0kTJZm1i6wsn2tCEdYJKs7KgGlmgN3i2ueHvfOgADNqbnvcbpw5QISh1uffgMnkdEQo1nEwXy/kbKq3jO6BikojBMxMdWs3hlOqY4ac2yb3hgVLgaehubqZ07iliyGOwa8ze5vMdoiYnP3MYSlUS0cLURgtB3mrkB5ALTa6T/H3xxCj/vEZjewbYn2RP2mGiB6zbiyu4qxFhohKdC3RRSGbJ4yMunBDKa6e0FQQoSOF5rXbraDKFGLZpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5958bd25-195a-4098-b03a-6c6f62b978a0@suse.com>
Date: Tue, 14 Nov 2023 18:23:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <feee97db556b5b38adb11877c4a37f1d0a09fc92.1699974909.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <feee97db556b5b38adb11877c4a37f1d0a09fc92.1699974909.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd123a8-73f6-4e1c-1434-08dbe53660d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/pQtxC84AX1L8lamzXHZYA6v/fAUvfMk8rZ5ATaNMyvwwRsaZEmzxIiwOP09aGFvH+Fpp8MV+g5Ybws9tMYLMIGlNF2Xa/5lifTxDf6efgy/jDDjegwlmscbaT53BCqMYfguIHAakkfwZXnpLeN7nVH6YOM7M1rb4lAzVBh7f1WB8BUOpzZdtDLPmBFSwIsXhWC4nlkCkwdrAX82YGKrj3NAfvgTN9tUFDQlT/GauJXPPbUizC0T1jdiJXRLaf1COM5rYB32/VVKBAo89FQ+9OdsMN8sVqywuLih8/nXwK0fetLK4s7G5lTbGYQyh0Gg99l3rK1aM2n8AAEMzHNPbPtSmwZ3qHos9Ync7wWZt2aMWJL7UDFzE/gcA4TwIGDrAMW4By9uixH4Uvmue1ObHYmNpvms3UFUCox8JigrtbdXiHTesxHGbzvNzLUA4ZbCfPzhNDUT9sLJoadzW8lNJw0veW/tD0lMUAvExqZRK4PJw/9yCJBjkBdsahXozFpQXldbA0Gd35b3Zef27M+2ppLX2L7cVBdtEFvJcbM6lOqmicqgIMFCIX/Rh7YYahZpyvaX6jt1+2LNc7H1RzYIYsy1TQgO+vRKx4oNvqOkOoiJ93NdeUkxH+UyuOAEOwxworFtG9yQqE9QYjsyuG+Cng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(38100700002)(83380400001)(86362001)(7416002)(5660300002)(2616005)(31686004)(6512007)(6506007)(53546011)(31696002)(478600001)(6486002)(36756003)(6666004)(66946007)(316002)(54906003)(66556008)(6916009)(66476007)(2906002)(8676002)(8936002)(4326008)(4744005)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUhZR2pka0tQVmp1azFUVlBUZHRkczJHeUNKTDZxOHVsd0hnOStMS3FvL3Ax?=
 =?utf-8?B?c3dyWWdvZ0N3SVFLZUZCd0RMU0NYZ0NRbXN6dUJ0Q3ZaOVF2cEExWFFhaUR0?=
 =?utf-8?B?ckpqZnFtT3FBUmE5TzhkaXVZbUxNNm12Qm13dlA2eG5rZ0t0WjZJdVFpVXQv?=
 =?utf-8?B?U0NDV2ExZ2MyTW5WOGM0UG02V0VYRCtGejdyNjZObG9xaGg2ZTVEclZHalNU?=
 =?utf-8?B?MmZEWlJRS0tuVkFnKzNncElFSEZvejRtOEtyQm4va25NaWtQY3BkVDBhZG9O?=
 =?utf-8?B?WHhrbzRWVmZzaW11VmxrS0U5TU5mQzRuS3EwenpwQzhuY1NqTVYyMHE3SUtC?=
 =?utf-8?B?Rmtyd1NXcm5CQms4UE5BQjFKWDlGMGZBZmora1RsenpGUE0vVldTZk90c0VB?=
 =?utf-8?B?UVVEMmhGenc5K3RvczU0T0pmT2ViS29nYnFzZzBCd1NhNVBIU2UzTlRORWRa?=
 =?utf-8?B?TUlyRWtxZWNnSGpXMGRiQjBFK1F3YXI4aVk2am1SMlZQbXlsWlduR0xtNGRm?=
 =?utf-8?B?c3Jra2svb1JEZWhRTUNwWWdMb0dhaUVRMWJTSnR2OG9wZVpBQVJoNndPdzhq?=
 =?utf-8?B?bXdwQXRocElqbkFZckNBTGM1V0lMQ05UazFBTVhvZERhSUFuMlpZN3VsLzNU?=
 =?utf-8?B?cDdCRGJKZGJ1bHdEaGRpWFo1T1Y5VWNZczFpZnVwbkVnQVppZzNoYjk1eUhv?=
 =?utf-8?B?dVNhbzJLZ1hXdnJlUzdNV3BNa3cxamJBSGVha1l1TnFlbmpURnNGSTgyODRM?=
 =?utf-8?B?MTJ4STlSOHZXVGhHNTVVVUtuRmZQVzM0Tzl4TTZMdHFxWFhPYndaeVFtVmow?=
 =?utf-8?B?SzRqNmpFVGl2TGJ3ZGpsUjNaV0VzdSsrcFdraXJCYUtGLzVHV2ZYWk4va1Ew?=
 =?utf-8?B?MkpRRkwwVy95R2xkK0gwY3AwOGpTRHhhVkowMS96Tm4zcCtkY0VjdktsS2sw?=
 =?utf-8?B?bnpCdnVrcDByTlBPRXJTWjBDMW80amF2R25xTThHVGM0bVVQWDYvanZ4Umwx?=
 =?utf-8?B?L2xMbUtyN3ovS0FJd1dwd0grQlFWbWJQU2l5eCtLdVRXU2FBZHJ5WDN1VTRj?=
 =?utf-8?B?ekdrRkFUUk96a2NoanRNNHV4UVJVcGQvZ2l6MzVLNmlPRTl6MWo0Ym5ZbCt2?=
 =?utf-8?B?TmVYenpzWkxTSFpDalMwN3F6Qzk2S2U2ZjdlYUVhOGRqNTVBaEduRmg1Sk1z?=
 =?utf-8?B?cEUrMUVvZTVUcG43MkhBMXluUVZLL1ByRkc0c3NzdUNSSW9rWFljbFdGaE4x?=
 =?utf-8?B?bVZLT2k4d2ZLdVVEbE0rTVkzVkYzeFE2cWlVSldJc1ljejhRZFRxWHZwYVY1?=
 =?utf-8?B?eTAzRVEvZXFFN052YlJSNysyWnE4WWtCbEdHQWh6U25yQjZ3WkRHTW81MS9z?=
 =?utf-8?B?aW1meFYvRWJ3NmpTa1BlVU9wNVE1RkEwTnNBd1Iybk9Bd0JORHJzWEZnZGVK?=
 =?utf-8?B?N0pBelQ4SkgvSEFIMWkxdmFpalcyaWk3OGtkWFJZbmNQVzJDdVNKQW5WZ0Vl?=
 =?utf-8?B?VFZTSHhkZ3hDTWlnSXI0ZUV1eTJ4S2FJdjZYTGVzVHFtd0t3ZGpRMU5QNDVY?=
 =?utf-8?B?Q0JZWHZock4za0ROUHVxUWRVRFA3QWljN05yMGlGbzJMNkxUNEE1TEloK3Vo?=
 =?utf-8?B?QVdaaWppcTY0WEVBMUpiL0lteWx6S0lkZThMRm1qc2tyZFFnNmIwa0JvczQ2?=
 =?utf-8?B?aDhpWERQVnFXK0VESHdEV2RsblQwbzlFd2YraEwyUEM4RFNmbGJxTlpzVS9S?=
 =?utf-8?B?OUNheis3RmVFNzI3TjJzVWUvMHRvOTBIU2Q4akVESHl0a2JtSHhhTmxXM3F6?=
 =?utf-8?B?T3I2L2RlVlcyVFBUU0JpYW1GaW1qa04vVGV5V015WU05aWxGOFppaWR6dDll?=
 =?utf-8?B?Z1FHc04zckFQY1AzSUdyTVFRNDN1OFdIdE5UVWEyZWowdDE1MTR3a2F5WFBa?=
 =?utf-8?B?OTdWQWk5QTZnRHI1cXZpb084SFhrZ3F1T1lZSmF4Zll0eDNFTm5zUXg0d2VK?=
 =?utf-8?B?dHFrbjVRZEtma3crOVN2aG1DTTRsZmRFTzMzYmZ3NG5BaGpweTZRWEp6aFN0?=
 =?utf-8?B?WFY1Yk4vVzR0TE5MVUhmUEgzdGh5MlJ5UXdFTHgzQmJmUEVhUUlMTTA3SENw?=
 =?utf-8?Q?wFqOToZisBE+I6IwppvLoNjKk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd123a8-73f6-4e1c-1434-08dbe53660d0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 17:23:11.9663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6a+1PNmskMn9M8ZzR+YNGsy5CsqUKiPrc/HGUdN2UUxyNRXRwRLGjR/JxsTQPvU2QeFjDdKBWOG7Sgb4qxChw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7680

On 14.11.2023 16:16, Oleksii Kurochko wrote:
> Ifdef-ing inclusion of <asm/grant_table.h> allows to avoid
> generation of empty <asm/grant_table.h> for cases when
> CONFIG_GRANT_TABLE is not enabled.
> 
> The following changes were done for Arm:
> <asm/grant_table.h> should be included directly because it contains
> gnttab_dom0_frames() macros which is unique for Arm and is used in
> arch/arm/domain_build.c.
> <asm/grant_table.h> is #ifdef-ed with CONFIG_GRANT_TABLE in
> <xen/grant_table.h> so in case of !CONFIG_GRANT_TABLE gnttab_dom0_frames
> won't be available for use in arch/arm/domain_build.c.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Same two comments here as for the mem_access.h patch.

Jan

