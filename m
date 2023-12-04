Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957E2802C9A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 09:03:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646565.1008935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3vH-0004KQ-L4; Mon, 04 Dec 2023 08:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646565.1008935; Mon, 04 Dec 2023 08:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3vH-0004Ik-HF; Mon, 04 Dec 2023 08:03:23 +0000
Received: by outflank-mailman (input) for mailman id 646565;
 Mon, 04 Dec 2023 08:03:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA3vG-0004Ie-IK
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 08:03:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 975e0bc3-927b-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 09:03:21 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8259.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 08:03:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 08:03:19 +0000
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
X-Inumbo-ID: 975e0bc3-927b-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdaY+k89VGEZUCjav9/5O/bdAHz446NkYNOS1jsKcYd39SySgAEzkl5Ekc0R+jvTd2GSr6s7DqB/bh4wXz7vZXmHsxi6Z9bzY61kFqkJxoh59asZGFg3CpJDBsZugbH4z4NEdk2fwKhKXO6+IgvmVerf+STyb5twfvPRdwBcqnYqVJxEEuYWPqtM/qJAYtOnHUb0M5gEhW8CGLXUArn+yiUT8lWxYvk5C0l4SEPLoJB0Wxn4+asniqRr3//WtnRJPC9HhbB13OzLlMunBYtNZjn7o+4aYSCt74N9sC4KARu3x+U1LWKGkLff/fS8YPRv3h7gAJhBztU4RAoIkWd8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08Ls0TiyUmgUodOxmm4SjyuL+PjFViyeAaX51+q0Jbw=;
 b=VaKMbIEREAH1FJ5UejInwrmhDrydtkwpnQIaeCseZKgz8BesAzxfX7RQNhT7MZw3G+QccNnvPzjux4YVGvl2PYiwZFs4OD1XAHO8Sz/5zizOEkUBTwzENccp7U7nWRZD8Iokod5ppPMmpPp4Y7M4itNq4isOizFNA1L+C7e2CIYviVCb9v4GMHxv14JQRIobijGPTWDfCLUROS9j2hCizIwhbPTx1obXsAiumFs4qKes6543ZmVJqK0v9zA321EhfqI5wWu8mz2eYCAf1NDaO5JUB+DCIBTlM3ka/lNfT63BtQnsjfOsQfwPesvyEeYhqKW1GWN5yBPb8ShQDvUXVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08Ls0TiyUmgUodOxmm4SjyuL+PjFViyeAaX51+q0Jbw=;
 b=3uMf22bxRfAWJkf5D2W/05lM4NFR3vWC6EGBIQuuDVmaphavVQfmHbFSnXASMPajYZx7bGP2dh3+ZB96oLlg+R6CbN/xBTilB/HPq1ToGR/6OETJCQmhxLq0I7da57/KT2ErwQ6z6ma6B48ru06urPij9ENzYkYSxFZ3bcMv0dkCik2lKYeNxWixWk2Rvvj/0AcIMwdRyvHKrg9b79bJuClIPVLLhrm/cx0WCfrd+QP68nFTEYoOG1AkjjKhWwg2/QGJla6wHMBWoKip2xTFFaxVab6AjeQ9z4qaFUgvykr0kZPWK0nHwvKF28li1v/pDq54D7MvC6ih7xDz8uNa5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60e56769-653c-4489-92df-dae52bb03194@suse.com>
Date: Mon, 4 Dec 2023 09:03:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang
 <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Neowutran <xen@neowutran.ovh>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <ZT/Cs+MsBPibcc9D@mattapan.m5p.com> <ZT_LWjKgQxOE9lpj@macbook>
 <ZUqRfgAmzJRImW4O@mattapan.m5p.com>
 <hqj6xjxb7r5lb52biejbzzue2jth3rcth3bouadya4jwarll4l@oswerq2ejbli>
 <ZVgp0wshHg3ZQ/Md@mattapan.m5p.com>
 <81f6bbd5-0487-461a-af1a-dbb6ead47cab@citrix.com>
 <ZV1Rz+FmmyWFHiM9@mattapan.m5p.com> <ZV8d2ZiiiBBNySgc@macbook>
 <ZWFKtrBl2kpdvjBC@mattapan.m5p.com> <ZWRS5qUTjkoD22MF@macbook>
 <ZW0lDEso5c+GUAQr@mattapan.m5p.com>
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
In-Reply-To: <ZW0lDEso5c+GUAQr@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: fda3554c-76bb-49a2-43a5-08dbf49f7a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JeRZmS0HXOTxwM9zAVXVS6Nvt93TEpvr3+TWCqF5eQwjQcaLNoHJ1TPXp6BEZbZt81Qm9uawxdQRtE5byqJ1BINITGOy0a4scTBPHY2KrzUwo/idtEvCS+0OP9xn/7s0xH1obhXKlbT1Pu/VGlmx8fg5yn0wiiXRmJPkj12svjcvkQUUTcl0ObbDu0jSBvz279wxJGue7k2nMGFULT51Jkk2a3PUxl+58Pd/Vyq6GgPNNDOQuIWV7OKqSe9q95DyO5D0rK7ijFbT644yLfSvZQlADo9sBFr815OKtPBWpdLyG1dFxOeEKEr6D8RBplu+DD+L5G5OwnvMm/oAZJRyOYce2QBiArALP70bWj0XpmI4IeCWTTHMfzLn5/otkoN7nmK8ThAostBCyxs0R5DkPiee+37nKe1qOPqzcDZZ6xEUz7K4JSrCcCO4zTu+RdvyVKTjBw90/eo8vbyh6Un0zskbs+cDf96OEYbcMOWM7cRh3pEpc1ORSeoeV7PO2zES+JqggT3hdumODUFCAIOB2VOUCKwGOiBtdE5m+9qaf1EJxtWcIvdbjaNN3mtNTHy98kw51ke32um9qtPyw5R4QMH6Yovm6RR1NfvTx1oqUzO+HO3OTMxvmDEJg/xhzP5yrDoCniItrW66NZu79X/RZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31696002)(5660300002)(7416002)(86362001)(4326008)(8676002)(8936002)(2906002)(41300700001)(36756003)(2616005)(6512007)(6506007)(53546011)(83380400001)(6486002)(478600001)(26005)(6666004)(38100700002)(31686004)(316002)(54906003)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTlWb3p5cFlRY1ppa0w1RTZuRURDd2t5YU5TZUJyeDZwRlloK1VBdVBCZkZq?=
 =?utf-8?B?VWhrR1VreFFvcE1CMk1YWTdpMkN3NkRJNXhXYVJ3UHZVa3hXRDVLZ1JRclcw?=
 =?utf-8?B?VFkrbERMY050MkRrSldMdis5dEdaWDFNaDk4SWlSTnRnWnY4ajB0M1ZJZWN0?=
 =?utf-8?B?ZFJJSCtDd1M3Z2w2VlJIUVJlZ0YvTi91NzFuWjlOYXJTRG1Nc2pvd0FqTVdz?=
 =?utf-8?B?UG9rZWtDYXltRnFlMWxKbi8rZlMyVFQ5OG9YZVV0RkwzaGJXQ3hpRFdVbnFF?=
 =?utf-8?B?TTdGRi9rNWNXT21PZVNzTnoxM3hjWlVHRWVnZERWRk9jQmhFVzluVTRCQ1B2?=
 =?utf-8?B?WEJLZHQ1RFV0ZkFIdjJJV2ZibGZSSWIrSVlQQldCN2N4MkV3YmhNOWIzSzNz?=
 =?utf-8?B?c1JMQy9CazNTY1NpZEpkNzVBY2UvbzZNMFlFMXhFYjV5R1Vmdm5JWHVSeHpQ?=
 =?utf-8?B?RkNHN0R5c2dLTUx2c3FpdXVzbjdQcENIMVBBa2c5UC9abFZIaDhjUW53M2U3?=
 =?utf-8?B?b0J1amtXWEptWmVZczN2QWhnYjRQazBiWEs0Tmp3OHFhQ2VqM0ZSRWFnUjFu?=
 =?utf-8?B?eFhNZ1hLb2F6aUQwMEVsS3paOU1MTzJ1OU1aRGRzSWxkRmJYeXA4bnhiN09P?=
 =?utf-8?B?MTIraWF1ZGNrMzVWTThKMWNnaldUaUNxRGI2cnY0eURYYVFHWTV4R0pzQVor?=
 =?utf-8?B?VEpGL2JnQlY5NGlsRnUwbytOY1gvSWxEdTh0N3ZwL2JrTXNVSEVIV3M4alRm?=
 =?utf-8?B?MjRiRmY5ckxEQVNDSC9TUXpETk44VzZWUmdNUHhodnZqUkhaQTV3MVowY1hV?=
 =?utf-8?B?QmhWTEJGb1oxK2ZGeTNHU2FYK3hUQU1XR2lMUmU3bHJEaFFTMWpvNXIwRWlC?=
 =?utf-8?B?WkEzL2NIQ21pTERMKzBjT1h5RHdrVTh3THRJK3R5OVhDZUNRUFhEYjBKcVFp?=
 =?utf-8?B?VWJOaGtES0VHVFRaajlueUk3VjNmS1ZUcFMxaTBnRDMwbXJrY2NPUTNBSzVQ?=
 =?utf-8?B?OC9sdDdwOHNTSDA3a1huWXZWS0dSV1FLQzZ2bU5ocmJIOFJhZEI1SzZIekEv?=
 =?utf-8?B?RXVMNFlOL0ZSMlNscmwzWnMrVlZUbDFhR2E1VDk2SU9WdlZpMWRQK0JoeTNT?=
 =?utf-8?B?WU93QktKMitTMGpNbzdYRzA1MDh1S2lKWUp1ZWgrR1NOSGV1ZXlJb0loM0FZ?=
 =?utf-8?B?cjQ1ZEMrZVBwai9OOUo4eGF2UEt5UlBENnJ0N2FUdVdOMnVmNncwQ0F5WnJm?=
 =?utf-8?B?c1BRL203YW5ZS1FXSWNmTzR2UE5JODEzNURqb0h0Sm14bm1HcDJ6THgvbytn?=
 =?utf-8?B?a1RYTUt1Z0MwYkxPMXpvMlhGRzhXbjB3ZmlNa2lDUnJ6SXBEVmpFMzh4d3VH?=
 =?utf-8?B?RmplRTgvdHF2OWJVWldTUXZNNHBBcmdac3N3eWtXb3N1Si8wNE5TU0dNTXp3?=
 =?utf-8?B?eUpSYXI2QnNFdHIxV3V5UTFEQ21UdzNZVXBabUpNL1psOW9reFVDN2FEU3Bn?=
 =?utf-8?B?amdSWUhVWENZaWZ6Y21CdThPU2lWTW5keHd4WEFpZWhpK2pEN0Z0NzRZVDIr?=
 =?utf-8?B?Yjg4cG16NWErU05XaTBYMWlZVnF5Y0xZdWdReC9MajJaL1pvS0lnNC9WalFY?=
 =?utf-8?B?VUV1ajdKT1diYWN1dHIzbkpMc25hdktyYmo5Y3NRSzVDOTRMTE8vVFdxeDNY?=
 =?utf-8?B?QWxaV2dnRUJsQ0hDUTJyRFNkNlcvRHJNWXlxN2s5RjBQUnNFc1lhN3dJTTEz?=
 =?utf-8?B?aWllVDgrWE5UbkVFbGpSei9KQlhob2JBNCsrQ2RsOTRzaTAwcEdlVXZkQkZO?=
 =?utf-8?B?czhJT3Z4d2lCYUFieTNPRjRPVG1pbDUrTXVNdVBwelEzUkI4TnM2c2ZZSFRF?=
 =?utf-8?B?QldEci85eTMyeVdsYWJ6UmtiWVp5ZS9Db2NqUHN3U3E1TFBzaEw3bk5zYVpE?=
 =?utf-8?B?R3czeXVNRTRNU3U2NHdEVHE0OTdBZmdtY083QnUvOG5ZSUw3YnFJanlwOFFv?=
 =?utf-8?B?VkJLRzM3U3RxeElmTXh1TmJTWStJc2lzQ1RxMHE4VXVYZFhEeVpxY0MwdVFv?=
 =?utf-8?B?MEo1V296ayt5QnZRQlBuTVRkd25oYnpSWmlJVjBvZGVvZVc4UjBRL3NjVHBy?=
 =?utf-8?Q?76ax5Id523woXmwHjA/o6m7pn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda3554c-76bb-49a2-43a5-08dbf49f7a29
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 08:03:19.3447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDduTrBL3OVzgJWx6qigxUwBGHJhZl70JiFgvnNVQ/WnccKapAYTs1dpIF1bl8SwXneZfpodkD2SCj14ne43qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8259

On 04.12.2023 02:02, Elliott Mitchell wrote:
> On Mon, Nov 27, 2023 at 09:27:18AM +0100, Roger Pau Monn
>> On Fri, Nov 24, 2023 at 05:15:34PM -0800, Elliott Mitchell wrote:
>>> On Thu, Nov 23, 2023 at 10:39:37AM +0100, Roger Pau Monn
>>>> On Tue, Nov 21, 2023 at 04:56:47PM -0800, Elliott Mitchell wrote:
>>>>> It was insisted that full logs be sent to xen-devel.  Perhaps I am
>>>>> paranoid, but I doubt I would have been successful at scrubbing all
>>>>> hardware serial numbers.  As such, I was willing to post substantial
>>>>> sections, but not everything.
>>>>
>>>> Can you please point out which hardware serial numbers are you
>>>> referring to, and where are they printed in Xen dmesg?
>>>
>>> I didn't confirm the presence of hardware serial numbers getting into
>>> Xen's dmesg, but there was a lot of data and many hexadecimal numbers.
>>> With 4000 lines of output, checking for concerning data is troublesome.
>>
>> 4000 lines of output from Xen dmesg seems quite suspicious.  Xen dmesg
>> on a fully booted box is ~400 lines on my local box.  That might get
>> quite longer if you have a box with a lot of memory region, or a lot
>> of CPUs.
> 
> That was from 4 boots with differing settings.  Since it was full console
> log, it also had the initial Linux kernel boot messages.  Each log was
> ~1000 lines.
> 
>>> There was enough for alarms to trigger.
>>
>> That's fine, but without pointing out which information is sensitive,
>> it's very unlikely such concerns will ever get fixed.
>>
>> Could you at least go over the log and point out the first instance of
>> such line that you consider contains sensitive information?
> 
> I would have been more comfortable with getting some guidance on which
> portions were desired or which could be left out.  No need for Linux's
> boot messages, what would cut things down by half.  No need for the
> memory map, lots more goes.

I didn't think "xl dmesg" spit out any Dom0 kernel messages by default.

Jan

> It is easier to be comfortable with 40 line sections than 1000 line
> sections.
> 
> 


