Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914726E5E99
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 12:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522733.812286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poiTf-00051i-QA; Tue, 18 Apr 2023 10:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522733.812286; Tue, 18 Apr 2023 10:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poiTf-0004zD-NR; Tue, 18 Apr 2023 10:22:23 +0000
Received: by outflank-mailman (input) for mailman id 522733;
 Tue, 18 Apr 2023 10:22:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poiTe-0004z7-J4
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 10:22:22 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6ebbda8-ddd2-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 12:22:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9206.eurprd04.prod.outlook.com (2603:10a6:20b:44d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 10:22:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 10:22:18 +0000
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
X-Inumbo-ID: e6ebbda8-ddd2-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOsi0yy7lOhmxstAYj3fg49KJ9Fbaq8ekvTHFXEdMbPSgkCu768OkNfT46IbCCI5+HAMCufGZWlr+fzCBq+I2hY9KcCfmcdatvRVYSezXUjniY52mYFWLHggZe6MidxWTwv8ybLvxOQawt6lKCEa6SAH+dkldsCNlp6Eduo7F60cT7Lzk0SCqgQ86fHd1cT8gnbx5yWBpXjJ7/HltPm/aBqNHI2UdJjZk6Gm+sGKDk+/hZc5HC2foLYxbO9BsPQ66dKLGltItXUrJXS5Pb8Vqq6fz+zTJLCJBWkzaV82BjVWlme5UnXejJnDP7YSMl2WlVg4CeKjbB6yWINB+5xjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fdHGOELZfMAL7Kk0jxADdmkjbHVsTQAjBTablrwl60=;
 b=Mzd8Lzq81GTkiHs8J7qfTj/LKYkukeCnIpR87Ufeez4dyBJbitMbVRC93/IMGKAG0vOet5HSIRC7y4N9y2NwNrp9jVCaRpKlYFzeZ/0ll2lXadJgIORmubzHn4gOU82cnrmEQbm83q4epzK1jzm8RQ7NrLRvRovYb5qHVWQLRDHKQQYIANA2vq+uu7OxdRYxFRKPw05XfVrkmY+U49+uRD8N6STsVAFUFi0aFgsB9n8/ML1w4oz92zYc4s/mFLl87Zwx+GEM88BolzzqWvy3vr5fEdaRMcooIZ97caEF7zbARrLqE0VrxI4PkfLqL0ZriJ5wC1YnEPTDnpcFqRHLJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fdHGOELZfMAL7Kk0jxADdmkjbHVsTQAjBTablrwl60=;
 b=yK77VDnGg7cg22BmX4TrMytszpFxwbD/8K7Xjc/yeuZX09olNKa5jGylAD4nURtqPlCPxEcEEXQx33mlTSuQjs165attmq+WFnHFx7/9aJbcWdDbuRO7WoThL8NeR8unzqa89B3+KZUPYDwyJHzaIGmELkslt85a0FuR176VgqCHQAQNgala1TQJ25q294u5X8da1Ah/22ql3a+GuvYo2DOYXsDSD3J5QEulr6g6CWyjCTw6siCn9uxD3aGqO14gMvFQqhdrnGGtGZ3BD1DIc/Y0gR/HQVcgROVBfr1CVoE140EykIQAw7bPOXsVZPk8WIjLmttdwV8a5WwMt54l8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cdd717b4-dd70-fff5-eef9-33376de4baa9@suse.com>
Date: Tue, 18 Apr 2023 12:22:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86: cpu{id,}_policy_updated() can be static
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <a24ace58-2ac5-6152-c42b-0037355ce9c4@suse.com>
 <ZD5l/y15PkJS8jbw@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZD5l/y15PkJS8jbw@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9206:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c3c0b4-8006-4b62-977f-08db3ff6c9b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jokw9IfdvP+i6uVssG84jnJA2ws98xa622YV4fwnMI7nWpUe7ESaJu6mVXJi+t63QaEo7g30A3sMiv/phthCa53ku4+afRd0JG+BuHFGbLVa3fajPegIjD42Uvd1xKOOItWuwFdnKqiaKgFkUgBo2kwEOvldwQCUAi/sGK46sjcD/kaA7UjFfntXataHaiJvnXcXJVBTP9eqdsOM3wtkFkqD1bTsL8JRxbrJ1f8XUih6nQ5wIndRNgrhJn8i0q0s1z/bGYhEIv0dJE/AY77mfwsyT9LBzwlH9YBq+oXrtSDTksfjbNdICCwZifP2C9BP0eL8140KKfM+2mQsvUn//nVFDwYZcBefqKOe1y5lmuWvpEvb64ZQSJ2ct5y7bwr7WYD0bDz7jnT+gO2rGAoXrsLwKdqiFxZ7TJM1UTNKC2TtAQLjaEr2hkQQGZU6sVnyu0iinW0+6N2gZkm8fkn2Qv1y9Tbhko/1qOphnrYrOOnea1LncQeXRzPFbujdfmTx9kBww7pZJ5PLATr58PYTvhXqmO1EL3oAsOk4Yx6Yn/AMSX/Mup+bXzPH67598kx68dZQdIN9hcmpYsRjRcFx3FHRm+w6ZMALo99xsfrY8lYV3PHSJbddKhj1ErJ9Udh9galn2lo8P+Z8XGK3O2XA2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(5660300002)(86362001)(2616005)(6512007)(31696002)(83380400001)(186003)(53546011)(26005)(6506007)(38100700002)(8676002)(8936002)(478600001)(54906003)(6486002)(316002)(41300700001)(36756003)(66476007)(66556008)(4326008)(6916009)(66946007)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3F5d0c5N1dxeWJNRmd0UXdSbmU3Y1J1alFhaU1JUUhrd2pyMklBSWxaUmRV?=
 =?utf-8?B?U01UdUZVbXlkcGlXSnpoNDlaYkYrS1FKS2tVaHBYemJGUndzR0k5NElOWnZm?=
 =?utf-8?B?YTFJSkcvbjN1emoybzNacVBSbVFLeXQzc05HZ29tQnI5aDdiNFFIYnFxWWJO?=
 =?utf-8?B?YWVNdUpCK1V5WS9qZjVGcE5RUDZvczgzRUVIOERCekpLcy83Rndia1U2dFFK?=
 =?utf-8?B?ZEU2eEh1QzNMeDZzNHh5alBVa1NaRytTcHEwcXgrRnRSQk1DWDljWU9WYyto?=
 =?utf-8?B?d3JpOWxsQlRVQWxoT0x1YmRkbHdTRXAwZjZYRjRhdEtOVUhSZkFHRDlTdXRV?=
 =?utf-8?B?TmVGYlZpaVMycVpCaHhzQkJPVThKUFRDbC84cTlQL0NnQktMM2Q0ajdudEI5?=
 =?utf-8?B?TWFMOGV2N1g1WEVmTzIzOEdMdTJVSGNDUEEvMG1TdG9ZQzNDMStxamE3UU9J?=
 =?utf-8?B?dHQ1dElPRVdnTThYLzJVRDZQUDVkNWdpSUhaTktNMm1BL25JZ0JVZzRDeitK?=
 =?utf-8?B?c01WT1gvbko0NjY1bU5NdEk5ckZPVE1vTjNkdFJiZXUxZ29rT0pISE45VXZu?=
 =?utf-8?B?dXBzbVRiKzUwTXF1YnRPcENFTTVvMmFZdkVPUWU1TWVHY2RjZEE4SS8vV0tL?=
 =?utf-8?B?TVA0UGVrenZnTnRLa2kwd3FoVmtkcytzd3B1Y2RBc0trRVVKRmw4eUc2RFVM?=
 =?utf-8?B?SkVLVGticTBjT2w4akVEQ3BwSnpnYjVBUWtiR1o0RkFxSmxTZ2NsbTl2RjlO?=
 =?utf-8?B?K2U3TWljWjExazQxZzZOWFViajZ0bVZkRHU3T0NQWUZPQ29iWHhFdGdxaFFE?=
 =?utf-8?B?cFE0bnRGQ1I0Wko5Z3oyK0RFL2hJOEdkTkJaanVEaUhVbVNweWFBN1ArdDY2?=
 =?utf-8?B?dEp2MmJ1NTQzK0xDc2VyMGsxMWRoRlZtL2VUaWNkWkZvakRGbVVubEplYmpX?=
 =?utf-8?B?a0paaTRhWDVWZzY5Uk5FaFR0M01iSUo5WDAzNmtxU2Y3TGp5QW1QYzVHNTls?=
 =?utf-8?B?bTVsS1R6WlVoaWlsVjBQTWpVZUJoTW9sQS9OQjExR21SMXlpQ2VHeGJISFNW?=
 =?utf-8?B?dldzVnRibjhEd1FyM3ZKWUcyRlh1WW4wOFdBNXRPeklCMGJxZUEvNUxJZCtV?=
 =?utf-8?B?bmRpZ0FoMHVPb3lJakE4WXdUQ25WaTEzOXdlOWNSeDA0dDQzZkVXZjRtUkRv?=
 =?utf-8?B?c3lWem9VN05qdDJ6RVBNVkgyUW9udEN0a2NlY29yOCtUYytHNE8zaGVXdWtW?=
 =?utf-8?B?a0s3dE00ZTJoWGdFRUN5K2plL0U2cCtlblJvZXpHWCtzMklxSmp2T0pSOGo5?=
 =?utf-8?B?RlFKREh5ZFovUjFyN0JDWXBUbmlxT0kzZTkwaGd0T3pWUzlNMlZLcm9YUWk2?=
 =?utf-8?B?QjdFL1FSMzcxejJrMmFWN0dhTlNvVVl6SG9IVmtiSEZtTEdFSVUreWZQaS81?=
 =?utf-8?B?YWlWSzNPQk9KWVUzSGhJOEtNZWdydWJBa2dPcTlwblhoZldkZEJoZ1dZWjM2?=
 =?utf-8?B?eTlET2ZCV0t1QlZtM3RWcUFISEVYL3hWY2dCeXZ0bGZoekJHdnAxZ0U5aUJC?=
 =?utf-8?B?MnIzOFdZMEJvYzd6cTZickZkL2F3RnVQWjY3KzQ2SmRtdzlXZi9kNG52eHZv?=
 =?utf-8?B?MTlzMFg5VmUrNHJiRXBacDQydENRYnJRWHBMWWF0VXJBYVlNdzE0cUJIazM5?=
 =?utf-8?B?UVNoWDhhUzQ1Ky9FeUJMSjduSm1WZGllYks5UWFwd2g1ZkF6UVFyS0JYZGt6?=
 =?utf-8?B?TGN1eFkvL0t3UkVUWXcyWjl3dnRmOU1ybHhGbkVvRWVsTU5hcDRLbUlDOVRR?=
 =?utf-8?B?aE1NUnlyMG9LbEFuMkd3NVZmcllFc21IYVQ3VnJjclo0c3FPV3cyOTQxWVB2?=
 =?utf-8?B?bGZSZ2I3SFJLVTdwbU8wK1NpMnpBZkpkM251UDFjN1pBR25yUEFHMTNaNG02?=
 =?utf-8?B?VFExWXZjczQrblJGT21OeXBCY2M1Sm1WcnlmV09ZaGJjU2RsMFU4YkZnUFFu?=
 =?utf-8?B?UGViNHFudWhvSGpNa3BEbEk0WGJlU1FMd3lSbVFMNDR2NUhWNWhRd3YwZGdk?=
 =?utf-8?B?anI0bXBIeE9scGRyL0RjWUJyZ1FGRXp3Ly9UWGJ0bGFNZXBRNVlQVmNlSFBU?=
 =?utf-8?Q?k8XCEZDM8fgTn5zf7+JylCVSa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c3c0b4-8006-4b62-977f-08db3ff6c9b8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 10:22:18.3242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UY9ffsUo9SIkBBMsDmfZD5CV31tdgc2giMJgst9JWyoeYjG2L/dD02Y3VEkUtUZWCg/tY0e1avtqty4ZweW8PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9206

On 18.04.2023 11:42, Roger Pau Monné wrote:
> On Tue, Apr 18, 2023 at 11:35:41AM +0200, Jan Beulich wrote:
>> The function merely needs moving earlier in the file to avoid the need
>> for a forward declaration. While moving it, also rename it following the
>> recent folding of CPUID and MSR policies.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> We might also want to rename the hvm_function_table hook.

I did notice this, but it seemed orthogonal enough to not do it right here.

> One minor comment below.
> 
>>
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -288,6 +288,16 @@ void update_guest_memory_policy(struct v
>>      }
>>  }
>>  
>> +/*
>> + * Called during vcpu construction, and each time the toolstack changes the
>> + * CPUID configuration for the domain.
> 
> The comment also needs to be updated to contain CPUID/MSR or some
> such now.

This isn't the case just yet aiui, but will be soon. Saying something
like "MSR configuration" would read misleading to me, so I'd prefer "CPUID
etc configuration", if that's okay with you (and Andrew).

Jan

