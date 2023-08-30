Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F1078D3B2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 09:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592720.925525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbFsM-00007e-QL; Wed, 30 Aug 2023 07:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592720.925525; Wed, 30 Aug 2023 07:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbFsM-0008WN-N7; Wed, 30 Aug 2023 07:44:30 +0000
Received: by outflank-mailman (input) for mailman id 592720;
 Wed, 30 Aug 2023 07:44:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbFsK-0008WH-SF
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 07:44:28 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20626.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0be218b5-4709-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 09:44:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6779.eurprd04.prod.outlook.com (2603:10a6:10:11b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 30 Aug
 2023 07:44:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 07:44:25 +0000
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
X-Inumbo-ID: 0be218b5-4709-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrCKDHfDes07XkUo+NSSzT3bjs4AcAZRWslKm6WHs514uXN7vu3O0Mqk8DS/BJkxo7LL5sDvwHwWGtmxkvdYbbZiAl+THUZe7Xl8nAI8ilfGxivU44VtXKNQ3I0rdq3u2mo6VYX5Gf5L0KbC0XbxtF7dHZB8Or/dMhKt9t3DkSq/y3b6IvWLcoPdjq9igbNgkbIBv5g+Kf8LANX3hY+jWy3CGg9afTmNiUje0+XtEYoqhjNU98i5WCx80HdUy6X/D8vI4a21NI7yVLnRHxAQKFsQBdZxScCGqEgeqXufJd2+0oNF7nTyRM3RVTGPSdTyfw4KDVrtJxvKw05TMT8qQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYB+6+5zq3YnrihdJOMQ3ftbpSfoOGQXqm73uRINo3E=;
 b=gd4Uvw/A9da5QVNrtdqKO2jVVfVEJNE+duq1E3iW5Na/ZOr27gMPp7ltIxwh3/uhgchx4FfDPWzuJ0QrDNOkdETx3sO7HiArJ8JyrVPbttsCzKsYiiGYQrrRPBHU+2ofEroa7Zywd51Ytxgcc/2ctYbzAqVeg+YpSN+4Gh2ihNCJcpLJqGZ0jbr/cgcdGyNiym8qLgqCJ/zENKtBlvpD3nlK5eaOe6Wo8TLoQ6Y6gAP+vdFesBxn+hbfI0tR18b33kmXiSPAx6XJLAe+HF+zGMnP8W5lPoItMhYeNv9AP00cVEBpKPkR7bPcKVnpJoS6zsnzw+XyQ69hKb16LV/2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYB+6+5zq3YnrihdJOMQ3ftbpSfoOGQXqm73uRINo3E=;
 b=v5kyp2mNguvitPPPk6TXXnGWtLmODvon3ghiaAW64qh2yk7dQVOd9CybvxVselBCy5Ld5vif/jMoG0fpHXeCGVAJskzP5f0RI/oFp/7N6KU8onb4mMB2B+7nHMRU/rreKnxuq344smbjIYetguwht87RMnMK07zpBonj0mmUWj/MNmoFNsNgYu47H5dUPndyeXraoqTajFveWojfdeS9WC9whnHAGxiT4/5/Q4NKarUQRDSEtHlCvcZA7W8SbEoGq35ilkX6WtYYMmkJ9CtAIkkFtqsJm7Wt3Rj6dWj85r2grkpnDwegff3UawtgZ4oR/97adBW/u9dvVSKm45mn0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b15edd2a-9937-ae36-d84e-8dd134cea6b8@suse.com>
Date: Wed, 30 Aug 2023 09:44:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] docs/misra: add 14.3 and 14.4
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 nicola.vetrini@bugseng.com, roberto.bagnara@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230830005950.305085-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230830005950.305085-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba44244-55d1-4371-2e5e-08dba92ceeeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yil5IlLxiTQJrTQphQW2enKBzLAJtws7fjE0PhaqZLQURejFJs500E6oTS6HsAk44vpdQXuDKA+BsU4nlp4CAbKu9hM21hf3wFizaMhqn6BAWjWPHZqDjDYRzDeSSVjlM8/luHrLqJITaz31+YlCHr8OFYJoSoaiRZVwM2T0QlLElOswVOuQFRzgXS9sPqYgVajr+U0MHi90EEL7YWx7Rn4K8u6KylaofibwTPWMA1FjGj900Kx8NPwzPXPSGvVXR2WPnvrmaFDoavcSOrcmOb6mV0JPWcve4KmTXpXFbCg6Aj5mlB0vJwm6EOmJ7dDkyckV/vNK9/6uFH/Rgbod8NBYeltOUUqwLGKy6FMzgsecuPE8kXoLDGE9FMqpHtVpW93T8oQxodf+An9GOYpOWWzujKrCpUC/W3sUqTTs4K5POll/R/A9jds35AjWGcAY437gzHkeaMwBD4SBqVLYAfQ3llrQPGRNARg1U4P1x97h7HrGmerbcU1wOY4SkxxSaiCho0StU2dCrhTVbhZMeDApQuwDsT5ieARXjuw+2fidcXXor1NDxweJYlJhr3UKafz05maIkSvbQWdvlbc00mtBVW1kqnbDgiINO61fjJjvrVIW5EtRvq7ZMm38QrR41UrXkbeQYhPHETTHgdArTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(396003)(39860400002)(186009)(451199024)(1800799009)(2616005)(6486002)(6512007)(86362001)(6666004)(6506007)(38100700002)(53546011)(31696002)(478600001)(83380400001)(26005)(36756003)(66946007)(4326008)(66556008)(8676002)(8936002)(5660300002)(6916009)(316002)(66476007)(41300700001)(2906002)(7416002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDJaVlZwbFhQNmFPV2gxMXFGaGRXcTZGV0liYnZuaW1NWkRBZlZiamIwR0VB?=
 =?utf-8?B?N3VZZ3RKaEtFV0FEdkVRNkV1RFdtMy9CVnBBMk5CNHZVd0EzU1FoWEhSMU5V?=
 =?utf-8?B?Y1VoazNFbkErTXpxWnBjVnMzVVI1Y2FrZFpJU0Q3cTdMbzE4aExYK2RPNnBR?=
 =?utf-8?B?YjA5QjM2b2w5VXNXZTJBV2x2QkhRNzBDckNLWUExRTNITlE0K0NWNkpPK3Ez?=
 =?utf-8?B?bTgyK1BqL0c3ZXRwL2U4TDJrZTNzY2dQckFlcHBrNHBuM2lGYituV3Q5MUg0?=
 =?utf-8?B?RVZKcFFmSlltYS91ZXhYNVc5QmJLYUczQmdVdG9HVDQram5yNEJ4QmxWRFRM?=
 =?utf-8?B?eFpNMVRYSDE5RFNzZjZhdUl3NnVqbzdkNlNoM2pselFlN09HNFVmRXNMTlhI?=
 =?utf-8?B?SS90M1hHSEh5U2lNcTlwTFpocEtBaWFocTRqS2dlRTVoaHp4UUVLanRSM0g0?=
 =?utf-8?B?QXpzTnUvZ3hicXVpdy84YVJGVXBiNFU2dWlDbWJIMFdJYVlGUWxWS0xreDBY?=
 =?utf-8?B?bEd1V2cxaW5sbWV1U0NmSENlbm5JdTJnS2ZFRlJ5ZVc4NjN4WTlCUGt6M1U0?=
 =?utf-8?B?aEFoSGxPaFhPREh5VmJzdUliL1NueURGOU5GelNEbDYyR3RncTR1NDdhZU1m?=
 =?utf-8?B?MXFPdHhWTmZEeDI3SXYycG0xUlAxTGJ5dVh4ellpWHF2QUV2UzRiK0c0azZz?=
 =?utf-8?B?b3ZxMkJqaEUzakdHMEY3ZGVMUEQwZ1NReEcxSXllcDI0UVZNZXVRTmRoZGtF?=
 =?utf-8?B?VHBWYklKUzhjWEUyYlRBMGxvL1J3ZnpuMmlnZjJ5OFFqWlduYmZtRC9vYTZB?=
 =?utf-8?B?dDRmMDhRWTBoSkxTcnBlaDBQTDVFREZ2Z2FGNjNNaDVSU21qU0U0OXR4VE1v?=
 =?utf-8?B?NVptK2RxVFgyWVEwWHJ1Ny8yck0vRm11eDIzQWo1YlFRL1JHZndNdkZ1Y2lQ?=
 =?utf-8?B?aW9YaFgxZDdhYWpUaTM2SkV1bjVOSVlsU0lCb0tRd1ozWTYyK2VCSmlBVk05?=
 =?utf-8?B?U0hMd0VrOHF5SWpqS2RoM29WeWc2SFdEanRhQ2pzMlJaczNsZ3hHcGpvSVo0?=
 =?utf-8?B?Wjl5MzBSeDloaUF5aDBYM0plRktjVG56aS9Vekx2NWFWSElPZGFaYkVQRU5i?=
 =?utf-8?B?YWtyYnBWMk4wVXZOenBWbFo0UU5RS2E1NjJaNm95UEs0VGp0R2t5Z25yam5k?=
 =?utf-8?B?NFRSMy9oZnY4REhoajBKbFVtZmR5QkpRRnArc1Q4VDFWczVacHh0S0lRdmtJ?=
 =?utf-8?B?RHBMUy9qWU4rU1hNM0Jya0VFMUpGV2g1VUZVU3dnYmlmTTMwQXFIN2I5c2Y2?=
 =?utf-8?B?Tis5dXBxZkZsM1ZCbDU0ZG1wZFEzWEpNemkzWDZQMXROOC9MZVpseGZnZlVs?=
 =?utf-8?B?bk5mNkFQM04rTGYvaUswcFhSMXpjZCtZdHJaQkdVRFNjVi9TZGdpUTdJQ2JF?=
 =?utf-8?B?UW9MbjJ6NE5tTFFpU3A4eERxYWxNRjRoemczd0V3QVZ5Z1RRWTIzV1AyYkxY?=
 =?utf-8?B?b3JIN1B0SnZNNjNoZHhFMjVoNlZvSUE0U2ZwTlFkMXR0SU9EOTd6d0o4cGEw?=
 =?utf-8?B?YWVTZndPN2xucE40TkNNZ0JnN1FhSk5PZ2pEUklUbENnaEJNSGlra2cwVGdG?=
 =?utf-8?B?Q1R1NUNCTHZ2S1NDUFUwdDIzOHJjOWhyUm9zVjVHemRVL2I4NkdRQWdYZXVv?=
 =?utf-8?B?U3hUdFExNDlKQUNZaGtXaS9tdGdpSWQ2cmpyTnNleEp3b1VMa1AvK1FzZUZF?=
 =?utf-8?B?b256bmhZcHJLRktzd04raGxLSklYeGMyMktEMEk5aXpiWUxUVjV5Nm1ha0xN?=
 =?utf-8?B?ZjZ5M0JqVzVNaER1SFUxTUEwZW9zUzYyR2RGTUFLWGtQK0RST2Vxdll1alFs?=
 =?utf-8?B?SmpwelBjRXdRbUtQL2JmcTRPTlBINTROK3pKQWxzd2lhUTZEa00rdE1TYWNZ?=
 =?utf-8?B?UXpJNDlRS0VCMm5DMVlLaXNVUml1L0JjekVycDczc1V3b3FuRXg5YndDTFJB?=
 =?utf-8?B?c0gzMHpJMERKUGZHanZlMG52WjJRbytNdEE5a0d1eU83WDdTYmwxaFVFYXFQ?=
 =?utf-8?B?SlFYcDVYanlYeDcrTVV4ZG1pdmNsanBsY0hHdEl4c0RoaG1aZFloaTNreGxU?=
 =?utf-8?Q?kVT5/vKUOO2lLtb3PaUs2Id9y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba44244-55d1-4371-2e5e-08dba92ceeeb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 07:44:25.6229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AztmtFH+DhmqGFgveGMRXFdfB+z8IgYhYVICThGxkvYgqFX4e+ZLoludIqZBduTi6aKoB9ck2Qr4seREuamzLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6779

On 30.08.2023 02:59, Stefano Stabellini wrote:
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -234,7 +234,7 @@ maintainers if you want to suggest a change.
>     * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_02.c>`_
>       - Required
>       - Function types shall be in prototype form with named parameters
> -     -
> +     - Function pointer types shall have named parameters too.

This isn't an exception; do we really need to state such? I would have
expected something to appear here only if we intended to deviate certain
constructs.

> @@ -332,6 +332,24 @@ maintainers if you want to suggest a change.
>       - A loop counter shall not have essentially floating type
>       -
>  
> +   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
> +     - Required
> +     - Controlling expressions shall not be invariant
> +     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
> +       checks, and other constructs that are detected as errors by MISRA
> +       C scanners, managing the configuration of a MISRA C scanner for
> +       this rule would be unmanageable. Thus, this rule is adopted with
> +       a project-wide deviation on 'if' statements. The rule only
> +       applies to while, for, do ... while, ?:, and switch statements.

The sizeof() aspect mentioned particularly applies to switch() as well.
Furthermore ?: is really only shorthand for simple if(), so I don't see
treating it different from if() as helpful.

That said, I'd be a little hesitant to give an ack here anyway. If you'd
split 14.3 and 14.4, I'd be happy to ack 14.4's addition.

Jan

> +   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_04.c>`_
> +     - Required
> +     - The controlling expression of an if statement and the controlling
> +       expression of an iteration-statement shall have essentially
> +       Boolean type
> +     - Implicit conversions of integers, pointers, and chars to boolean
> +       are allowed
> +
>     * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
>       - Required
>       - A switch-expression shall not have essentially Boolean type


