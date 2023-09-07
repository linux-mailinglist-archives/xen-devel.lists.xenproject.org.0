Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580727972D3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 15:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597349.931577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeF1C-00058P-Eu; Thu, 07 Sep 2023 13:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597349.931577; Thu, 07 Sep 2023 13:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeF1C-00055F-Bx; Thu, 07 Sep 2023 13:25:58 +0000
Received: by outflank-mailman (input) for mailman id 597349;
 Thu, 07 Sep 2023 13:25:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeF1A-000557-Jb
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 13:25:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe02::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 121541ce-4d82-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 15:25:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9430.eurprd04.prod.outlook.com (2603:10a6:20b:4da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 13:25:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 13:25:52 +0000
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
X-Inumbo-ID: 121541ce-4d82-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmtc8UYGlzoXxVyanuhO9i0BPqusFzex+g4tQGmn2I55azU8k7SM5Cd2EW0QDtmCWJZTl2xhmR4yj7LsS4djwE5Nbd5zDN446vb7HRMfBxo26qkstE4LmEA7uV93nEkq+jOsVm4dF5mX6j+q/YItuKmuk3tXZk5VQOteb26QHQCpDiBYB0E2AN+FOIhZUZNSpqQFwWD27ngQc36UC7a7YNUXdvSf6Wa4J2+CWafFvaT4RX8/4gDxJvEW2xT1JL4oUmVDc2R/XbLwaqqS1lBJevRK4+/bubn6Qzrp3t0mFmQqj/a3G+Yjeb+p59ajuCw4RizZh6JY/El39PiLG3EKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FZugB0mO1M7qBpTO0zBEAPcktqdQR1g9ql3+RnlO2Q=;
 b=kVtv6HPfsyZihrHUU4BMjwAQGcL4zGE1khSvRYMV/uw8AIntGi/FFpK6lbCO/e6LYKiNktSB6jrPle0u2tgJY3uPurvfbg09N+k877sXn/1a7PJgqaxzgxi8Erotxc0aHc75QHGsTnCbJv4y2fKd4DMXNyanzvz9AzRY2M0XEgwcvaDJnZicJnLkkMnAHUgj6ITaJIOjUJ9GpH6kZoTk9YYtkmQ7c3Yek7rmYngiVC1Q5NzregTTeMykbIpPm3tNV3PZRJniujjdYtcToGbQqQkfCdEn1kJuMOSTP+UU7Tm0hPanMuJI+MfAi/MLfogdKsyznP8J9IkUG+JPg/DVGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FZugB0mO1M7qBpTO0zBEAPcktqdQR1g9ql3+RnlO2Q=;
 b=rzZuDod2O/1Pc28a2GHKTRrwHixW9wgWULmycQUVN6PmD7oPY+Dse5+ip6SAUBfqYfz6Yn6smCzuZP7hKUDVX/+Pu4w0+HeMs3DLPFSisi9oRkK4SmOovWZIg6HUPzSr6PSH3fWLUo5Eof/WvwpWxm0bgXj+UQ2ijRuGQutTdJ4DKB30WC34LC67BCv/hzjLeQyegooRhdaNZOTzIO6RkdhbC8XWwEdG6mlYnrMDQeLtF/szXtKwdOEI0gYXoQny+hsDAgeiU+7DEGgPZ6sxJCk6uU+I4w5xeP1jIC1KfgPOHbZZqi2GwaiZ2Br79CwFtjGA9fvo6fHKl5Pj1vjsFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c78bd33-5bb3-667e-e654-31a0e4c9022a@suse.com>
Date: Thu, 7 Sep 2023 15:25:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH 2/4] x86/io: address violations of MISRA C:2012 Rule
 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693990010.git.federico.serafini@bugseng.com>
 <f1be66565b6a1155ee25a840ed62474ca9bc08a4.1693990010.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f1be66565b6a1155ee25a840ed62474ca9bc08a4.1693990010.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0228.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: 7765c5eb-e076-4f18-5a74-08dbafa5f530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	653GFBK2kJrOUd7e/zoo0Q3vsonW1X9OTJngaRV3+pdwPYUsxqsT3+wKOnRz6O2sXHX50frPMKjliijS4hwMYVoPq57VHPbvtpd5BWjOpVkgbNYM/3kmFMMqB5UhY+JyD8ws6WkWEeYvMGGebw9pNQMdVl+DQREqDnv6qHndKNJ9GDCzC5UJpvNx/XZmOAEK1S+V2OLfUMubC3hLzBZgVKuUVAYVR7Mp8RLiv/03Y3EYbCzpFD7rjN3FNNmTjf0qvKuMTtv9TFlMV2d0ZxQ6GJG+cwfBx//NakhkYOmRF6MdxE6M+BnBBb/sTJRSu0lODtqZiG6vnMi2A7s9prY3lf2F0bx0445D4z/vWIw3TYZMXcg7tF+zBl4ZuQZ+72icyl0bETbnPa7pwKknT2hbexCAE7M37GSnH6XXcQ4NBtqR8WY50YvErCJxBdswXzJHIB7+FNozCCE6qcIKGy4mUh6zpI8RpHLx5q3auSMgQiEel8IrxBdp65fqJyImLQzBLRC3bh/y0Z16FoRk4fmshSMWc/D0FAETUQmn08yxJEAC9mBCbTKdMTlYQfnu3Iskwxfef4xkUXiqCBaSB6rng4aNwFg6ZfgAVK1GZgIl9dq0BK2lO+TDzSxURIi4nHltqFYoHaxjH4OfztcxDNkVNQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(39860400002)(396003)(186009)(1800799009)(451199024)(6916009)(36756003)(2906002)(66476007)(54906003)(316002)(66946007)(66556008)(4326008)(8936002)(8676002)(5660300002)(31686004)(41300700001)(26005)(6486002)(6506007)(53546011)(6512007)(558084003)(6666004)(478600001)(38100700002)(2616005)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGd5UmoydjcraUtYRlVBYUMwYndWQ2dOdTYyU0dWbDNoWmhrZ3lQdXZwNERh?=
 =?utf-8?B?c0lkSXhjbjBUZFp1M0EveWdaVTBDeGh1bG5vbHJYb2pKQnkvcTFxUGpzNXRC?=
 =?utf-8?B?ZGJzc3JaKy9Zenk3R3E4U1NXNGpFL2N5YUxkNjc5cW1tV1BhZjdtTzQwdVFQ?=
 =?utf-8?B?QUhyeFgrSVI1MU14bEQzMFFVcnlhbjVkT2JHdWJPMTg1QzBkMzZ5UWU4aS9x?=
 =?utf-8?B?OWlsOEtMVk4yTTdFakZPY3c0TlNmZWJIdmlPdnJSL2lCbEV0YmNzVjlkWXhC?=
 =?utf-8?B?bUp4Vmo2aWNJQ1RYSU04dGkxNTR6d0srTE44c2dzSFg1SGN3OFcxT2FZemk3?=
 =?utf-8?B?RXFXUTA4T2VlNVpoUnA3WW04Q294ZFlsRXBwSFhmOXpnc2NReFphWFhqL0w3?=
 =?utf-8?B?T2N1YXlYQVNETXZuRG41VkU4RWVkRjNmelhOUWtwSmRZd01vRWZEZVlyemJK?=
 =?utf-8?B?c2RpTGdJL2NaY3Z3Z0xHUkxkaGpLcXdncFRwU3ZIVTB6QXdYWGtIYzE0Z3lN?=
 =?utf-8?B?cHBTNEsxcldDYlVqQTh5dFh1NWtUWnN5cHhGOTJ6YVJIOTg1QzI5eGVwVmZv?=
 =?utf-8?B?RGVtWnh1TTFjZkk2bHJpSW5XVkFuU1RML3FRT3EwaThNYkF2MGtSR21Zem0y?=
 =?utf-8?B?bEJaU1I3NWxpOE1ZaU1SeGZZQjZnWGp0cHRlWDF0czZZVGZjSHRVZWNDZnpz?=
 =?utf-8?B?N2pJN09SeXBVZVBOb0RXZUhVMXdKUzZMMjdTTm9XOUhmWVZUWGI4bnBISFhv?=
 =?utf-8?B?YTZkb1c1b1FaSzYzeTFJMVcyOVBvM3FCN2RLemphV2YxTHBiV3JyaG05V1ZT?=
 =?utf-8?B?dVgxT2kzZVBvKzNkclVTRFdGM2xEM0RLMUZMYWl1c2NXc2trMUI4ejVIckdl?=
 =?utf-8?B?MjN3SHJOcDBveTAyTjM3UmI3MThKc2hQK1pXcWhCZEJOallVK0NiMHVXcGpQ?=
 =?utf-8?B?RmJiaDk0VE9KVHVoVmtiMi8vRWhJZDdwMWJMTVZ2aVMrMDl6K0diQ3E0UzlP?=
 =?utf-8?B?a3Vna2dvdEhweldnU1pQT3V0MGpTQ0pjcnBLMk5RRGp2VjdjVmp4Y1E3YXYr?=
 =?utf-8?B?Z0ora2RKdzRwQ29OQTVtU0o0ZHRGZEY2YVZJOFkxcThuZm5EcTVlMkNoZzYx?=
 =?utf-8?B?NUhBZWM1TDV4T0tycC8yZzVwS0JKN1JMWnV0bWtjSE95L2liZ2RtekptNnhP?=
 =?utf-8?B?cUZ4KzhsaTBYc285OFRVK0dqOW9mL0QyUGlUaXZVVkZqM0VJUlpqTHJWMTNC?=
 =?utf-8?B?ZGhqYUZEdUZGRWcvYlU2MmNjQWltZVFKYmNuUFVQZ0JpazlJaGdFdEJvTmIz?=
 =?utf-8?B?UXRQWWl3cEVZNnB5YVFPajVnSG44cUJmTTZtUUpwaTh3RGRlSWlkMXJ6VVJq?=
 =?utf-8?B?S2lOcTYxakN6elN6dTdQZE55TVV2Zk8vRzNJTW9jbFhud0RJTEIySVlBVjFH?=
 =?utf-8?B?WHBIZ2NIZDhEYWFFL3pvL0VxbGZUWFdJT2RiVzVPd2hvWWRYeVRoNENrM1Fs?=
 =?utf-8?B?ZTBJZ3hMUnpleG9tZ1hJK2dWYWdqRnhsamdGNEo4TjkvZWttYTYvVjl6UXpI?=
 =?utf-8?B?STIrOXNQcUE0RjJ1UUhHak1EeWg0WTlzanBBSkJnVlpxbWVJK21qT2R5dFR6?=
 =?utf-8?B?Wi9IWS9KZ2ozUUtuTi9KbncrU2NNMEhtSExZL2tJV0NweU5qNzM5UDVtRWYy?=
 =?utf-8?B?azB1ZFlDU3MrRVBHNXVXMjNCUHhhQ2tNNXVwWjUrWDRqU3VGWitUQXNXbFY3?=
 =?utf-8?B?Y2Y3NlJFMHRSelExRTFSZFhFQlFSRHVMNnV0eHFUdGsrR2s5aWhOTE5yeWNq?=
 =?utf-8?B?YmdFVmhvQW5CaHpRajZ5TlRpcllsajUveTQrTmFiMGVvSUJBeTZERUFRN3Fl?=
 =?utf-8?B?UE94MXRqVjNKaFY4ajY5MzU0MVUrMjdnWFAwNlpUOTRYd3k0bGtRZk5JcW1B?=
 =?utf-8?B?Sk9uSUttWWZMUjNXSmtDdG1VMVZxOE1RMUk3aExRUUtJUzduMGp0NEdnbDIv?=
 =?utf-8?B?TXdiaGh4VnkweDdwdW5ESVVKLzR4OTBqcVV1TXlUMHlUaUREcG5KUXJtYkJ0?=
 =?utf-8?B?QytLM3ZaV01zSE1jbnJZbGkwcnU4TlNJdUhRRTA2L05uWFN3MWdvYVJrNmdh?=
 =?utf-8?Q?RaxlHxC0jqKQqxghfslhbDcmA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7765c5eb-e076-4f18-5a74-08dbafa5f530
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 13:25:52.2719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGEgbI8iinH7C0to4g8K6h0r0T7xKradiXM/plTfoRXb7+iHMd8aC38/SPRZicnUJw5uXNxn/BAxW5El0Ihr0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9430

On 06.09.2023 10:57, Federico Serafini wrote:
> Make declarations consistent, no functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



