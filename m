Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704867F43F6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 11:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638671.995499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kXP-0001S4-TZ; Wed, 22 Nov 2023 10:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638671.995499; Wed, 22 Nov 2023 10:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kXP-0001Q8-Qb; Wed, 22 Nov 2023 10:32:55 +0000
Received: by outflank-mailman (input) for mailman id 638671;
 Wed, 22 Nov 2023 10:32:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5kXN-0001Q2-W6
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 10:32:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7d00::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d393191-8922-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 11:32:52 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7631.eurprd04.prod.outlook.com (2603:10a6:102:e1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Wed, 22 Nov
 2023 10:32:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 10:32:50 +0000
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
X-Inumbo-ID: 7d393191-8922-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOS7jaC9qZNVi8cwRJaQsCKSUNwxIS5aBcSUjyAL4JKEqB+8ihekG06Y39+2OP+d+Ehy2cBxX4WLYdzcbF8p1tOkH1fwaRrNWtOGyFLihvvV2L8dfOp63ymieK0n8mKD5aD9j+R4OaAIUDqtEPJAnHbW6OEN7Ox11q8/XAPM1yPVovm9G/PHZ4aZgfhlGxJ98eZ7UhXhWz4t3JTFao1nHBIClP+gqbtfZ9lpfCXmij29O30D+SWAviVpaOt7uac0lij4WfIkBMQTlETxLErpDGCoYOhp2/gqvEbWMpfHmQURNVOBgzEzwMWftepWTijBLRrbDRPHYrVoyZqXteKZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9+A5HezxqoVt3BMHeafxyyG7D7uXnaNSh+dpjuUhYc=;
 b=W5wAw7YePYq6vgTqB1PI7wHC6y/pTMHYmpDnbzJ0b0SX9B+zbDqf5Lp04iOXz6Lp4PU2eTIOzenxFAJyo9CFJXKWsNRhSohIqp9gXb4GQH6YFMqwguNU0wjw4xk5Ykg+9d0pFaG8k1mvSDuWvL+ZDoAMNb93c3eHaTvqOFy3HKANroIAtvh/PrCELUart4FHrF/qz60t2nt5r853u4IzTsXVeGnaQpbnm+i0Djn3oBqkbXGLXmD6DmvDINaJcI2JYk+bbuPacLzdOXas8aQKr51Jf5ZRW2MRqugo0aqLkLsqe+E0Dqe/o5qCOzE3OOo2yJ/I0F8AecmJJCkLRwk3YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9+A5HezxqoVt3BMHeafxyyG7D7uXnaNSh+dpjuUhYc=;
 b=Q04J0Oh7VL/0R9OoejW9yQ4LFIblJjIsiYM/fwsRFtfEHObR1A7bPACKRUGsL3cTx9NMtJ6uHJ/InFkPzLKHZerhAjYNQ/rfphROaNRGTRtk5qAkwmEwQXHRo1JVvo9OHm5RoK4lHHDd5MPyTehTwQIkhXx26wlZ/QdyGphVqtbJLhjW+XWGWPKZXhockC5zgpoFwjnDIQ+dUp4fmWzyNeeHhLFiRlBjV7c27L8w+6Mdjz26MBMe8GhwLvwS6rKUappwQN7q596zK6jFicnnJYVMP5pTH1scd/6txCmjcEDMPlftnzO/YYh5mDDCC2UQD/e++2hnMZSBybiRylOX9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ff99250-ca6e-464a-b8e0-b46c20764d3e@suse.com>
Date: Wed, 22 Nov 2023 11:32:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: Fix up bad bool conversion in ept_set_entry()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231122102808.1763303-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20231122102808.1763303-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc6d5bf-db66-4ca3-f9e7-08dbeb466057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6E0JS90/uf4Uf2QmAv4TWOt3+muXQbL8e84FPoVaBDEmrRfd2VdYWmQl0oljDplDjeh43kF7cOyPRluGDJWdmIV61FNT5lksDZ9nQTyqV9kqYLgfxGwoPEF7XIX6jzOpmX7rBIE67MOVVPvqqX6WaL4WobIwUjGe+2TlL7nL5Ua4AKXn2U+OsGoEcu2Ac4JTvIz7L4dKhiBzXNV43diKrFaFnHhcAdN9nkEmTGstMDdRqTTyyB29Hb8i4VWw6iHne2+3ncj1IC5Ye1iCYlt4HwXK57uZTCfwaUjVxsWEYcmejW8B0Vrc09aIzGjEibJ5/r/bePZwFTgTmp2u1rFOwHq0KpigMzwt9Fmp88cK0ldFKcT9GgVg/tl9Fl7dtC7NW4izVH2ZFLHsC2Nj6gOObwNG87glsDiOytQUxF+GTqnXHckZMgm1fjZxdJQ3Jfooq4yih9iyqNc/WwNQfiGciPI82f8J/48VSyAUC2tzzKvz7GnF5zqdZ7iPCHqGhYhtkBc+Ijf3aHPpW/fIF+VbgyAgPq9ydhcA5mXKxPvZKaEPKLiVjo6n074rEFkuyWIIKIsQz16U7KQZ2rxnK+XZgLp4VUM5UmbSoJr2ULTpBqgdowDYIlutjRvIah6Vl5t6eOT9NBAeX4jWxinIOGQLHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(5660300002)(86362001)(31696002)(2906002)(4744005)(66476007)(66946007)(316002)(66556008)(6916009)(54906003)(4326008)(8676002)(8936002)(36756003)(41300700001)(6512007)(6486002)(83380400001)(478600001)(6506007)(53546011)(2616005)(26005)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW95Y3pRQitvTnpJSUZvWmZaeXBrdTg2TEN2YWt2Nk5zaElvSEE4Q2N0WTBI?=
 =?utf-8?B?YnVvQzFOdWxKUm8yRmlWeTlZa1JPWDB6YnlWc3lVOWU3VWh1TWF4Y0Y2eWs4?=
 =?utf-8?B?YWZxcjQxTDFVUlk5MEJRaHBhTUYvZXBCcG90V1NJOUVRSjVVVVhTaUYvYmhB?=
 =?utf-8?B?cUd5TXUwemlua1F1U0VCa2t2a0ZTNSs0Qk85bXdmcGd6TTR0K3VQQlJjZjE4?=
 =?utf-8?B?aXZMaDhIYWRWQzRRUllTU3YxdiszVmEwTjg5SHBFSCtzWXRQVUdGOU9sNXVl?=
 =?utf-8?B?akswcHFLOG9acXVieUVwRmI5UjFCSGFITmhnaVJacjM0RjNFKzZsRitJeUZU?=
 =?utf-8?B?VWJ3NG8zcTNEUjhOYlFRZFppd3pBcmZ2UHo3dVViU1FtOUh1RXBxeTBhUTE2?=
 =?utf-8?B?OGhDS3FSbU1XYnZmMlc1eUxkNk9vZ2dYRlhGbldrOElSMmE3b1hxWU1jcEt3?=
 =?utf-8?B?dGpNc1dKMVk5RlNWRndTSGRkZWV0dFozRDlscXlWOTBsRzJzYXpTWm5MVUtM?=
 =?utf-8?B?RmlTWDNPczdONlZHSkU3RW14SU9Bb0w2OW5WMkxFeW91Qy9ZNmF6Tm8vSTND?=
 =?utf-8?B?MFlJMS9GTGJPRjloMmVZbDhrOUtQZlNLZkkzMFFsNnN6cDF5dWx4NlcrSlph?=
 =?utf-8?B?ZmNXa3A3RW5IYWdCR2d2T0k5L3cxS2E3MVA4OStRYkFZZXBqY0dLb0FJa3Er?=
 =?utf-8?B?TS9IbUd3QXZVZ1VXVXA1a09CV1cxcFFEbEZoTENqOGdFL1plT3MyYlptcy9r?=
 =?utf-8?B?RXpCaklwZVhKUkpLd0ZlTVFUZEtEWSs1UlBESHdyUzRoLy9nekdVQ09UcUps?=
 =?utf-8?B?dUQvSFdTWE4ySDVVUVJ2YnJDenpRUm5hVllXQnJsRjFsSWo4dkhWNUwwb3RP?=
 =?utf-8?B?QUozcnFyMlM5WmR6QnZFNFhZTDV2cEY0OUkwNlhqRGFyc0h4aUo2aUxTWW45?=
 =?utf-8?B?aHdibDcvWEFkSVRxNDFiUmNHOVo2aTk2UzJHYzMwemU3djEvV1FTc1RhUDVM?=
 =?utf-8?B?NU8yZHdrUno2bFc4UTF2Mmp0NGcxR2R4M3Z3ZzZHRkhCZFA0RThtQVAvQ0J5?=
 =?utf-8?B?ZWdDK3ErR1dITll3ZldGN3ZXWnVUYmQ1eW96RWpsd1ZWbXRjZndvbVhWRng5?=
 =?utf-8?B?L0M3K0dUc285OFFCdUlVdUVUeVpiZEQ5SU5MRDVTekhIVGdPZWdsUjlqSEVj?=
 =?utf-8?B?bzQyMlBTNTIrOUZDOTNXY0RHbEhQVzQyUytxSFJiZnpkMkZBWDVYR1V0WVB1?=
 =?utf-8?B?WEhUNVJEZUY4bU1adGUrQkwrRUd4NjRBdE51ckZ5MWRkK1c3M0Q1c3U2NTBW?=
 =?utf-8?B?UXVac1dXQUx1aGlhaVZQRG9YMUo5emVhd3BKR0I5UUdUWEN3WldSQmxEU3lU?=
 =?utf-8?B?cG9aSTJhWXFQbXZaUGkxR1NuUlZiVEFmVEUyeWlXalBObmpzamYwbEdqQU84?=
 =?utf-8?B?YWJmU01LejFTSXJLUUxFckQ5UnF6OXpHdG9oOE5yaDRma0ZEaGp2emFrdjc2?=
 =?utf-8?B?cWswd2I2a25WclZqRm5Cckh5ZlBNUW51emtCTDNDVXB5QWRXenJFQ0FEeThn?=
 =?utf-8?B?N3ZrbWx2SlBkYWFKTXpCTWgyUXF4MDhCeTEzdVRGTmwrR28yTzJPQjl4RHNC?=
 =?utf-8?B?VHdPdWNFNGduODFGUm9Tb01kZm1YaU5RZkxzdGpiU1ZKY2VYSkhjZk1JYnNG?=
 =?utf-8?B?cEMweDNvZ1ZENTRZUHdWcnlWT1BxMzhGMjEvSm9raisxQzIwaGx2Y3prOTFB?=
 =?utf-8?B?MFFicmVmbCsvWE1VQkVCbkZKZStobG16L3N6ZnQxSlF1djNtR2twVHp0cmth?=
 =?utf-8?B?NkNLaGtudVdxTXFnV2xIVjhFbmRRWE1TVGhsVERYbHBqY1VjdlpLL1lSemVu?=
 =?utf-8?B?SlRGOHpoeWM1L09HbFdXUFYwbmdTNkY2aWcwQ1Aza1VsekRHNzNRT09QTFkr?=
 =?utf-8?B?ZU0zdkxwa0lLczlqRHE4a0ZPSjN0YlBBdkFOWUVEaGxwTUZCYVFJcDJMVURL?=
 =?utf-8?B?alkyeERsaGtrU1hzMjQ2Ymd2RFIzd0ZqTVdlNXA4bCtoYzh5RHZqeUdPUWhQ?=
 =?utf-8?B?SmZ1a0dDQTRIY0JCWWxzREdyZTh2bUd1NnRIdTQyRmRKSis0bXAxTG5WTHU0?=
 =?utf-8?Q?aesd/SV9sNvwb+a2RZyAsuIN+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc6d5bf-db66-4ca3-f9e7-08dbeb466057
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 10:32:50.1369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEyHgS4Mgm/OpEzpqvhWwQ5UHLRIHM5G5KuCNABYIdl3+XtaifWwFCGPpnGP82f8S2uCefZufLCtRoVj77Y2lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7631

On 22.11.2023 11:28, Andrew Cooper wrote:
> This accidentally turned a 1 into false.
> 
> Noticed by Coverity.
> 
> Reported-by: Jan Beulich <JBeulich@suse.com>
> Fixes: de577618c285 ("x86/treewide: Switch bool_t to bool")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



