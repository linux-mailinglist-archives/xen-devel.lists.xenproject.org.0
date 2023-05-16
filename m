Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D50A704CD6
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 13:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535135.832758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyt9K-0002aK-RV; Tue, 16 May 2023 11:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535135.832758; Tue, 16 May 2023 11:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyt9K-0002XD-N3; Tue, 16 May 2023 11:47:26 +0000
Received: by outflank-mailman (input) for mailman id 535135;
 Tue, 16 May 2023 11:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pyt9I-0002X4-Pn
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 11:47:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c1bfb8a-f3df-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 13:47:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 11:47:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 11:47:21 +0000
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
X-Inumbo-ID: 6c1bfb8a-f3df-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5DW2ykdH9B1FKtuEWwxfaKiUIVVA54QfEnAbwsDMwyVR9cEQp95QFgQDi/sLn+NjrsdGpe1EuYXvtCOK/ZyhJuHMJzOUKdE66FttGovE4fchR0CawbdmRTAwVTOWql2YKA6tEWOzrna++iarXylvTB82RZ6QOsNfwIHFdkEIbyokNMjm6elFwoBouJBpUQsoJQtgVMmJ+MlNnwKcQUTRuODbDUbLI8LdMo59ujYdURrWuPFbcC+VZuokv7CfV5VYSuinMqtO9dPk4vKi8BT8wK+UCsj0/T3BtnspdNjoBTr8t9ZV8iJGD5UMBUnu7L/osF2W9pI/ruS+3mqjURDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntFgvsi7fESsY3d6UJGHVwwDUUmBEPxVNBJ8W6AJWB8=;
 b=mZJDQ6tsrWWCfPBald12ViR8OMJpq2IZuWssZ3OiBEs/TgbfDVraTFYEkBsk4Hk7qfEq2W87dfXvrhUDSbZiIaWqzSNgqqn05l0ZtdnNbducse3h9a0WmvHOLezR9Co70WcacQ45sezhJU+7cTHDZJCO6oi/angl87bm9U3eMU9fSdrFS75yjilSutWxRTiQcishQNP3tSAPaeibXsTy0My6fkr5yH69++KhXg5ktN+J7U6z92P8KxUYvM/0GL4iNYd/AJrulCaXCqxDMUVgdapTePtvh9ocOuGdw5gaEonoYJijUoeG1z6EmVqRWIyKwSeiOWIKbLAXr413nEaMkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntFgvsi7fESsY3d6UJGHVwwDUUmBEPxVNBJ8W6AJWB8=;
 b=YBI9Y1s5LUTuIKquqqgXmK4vUQjcCQ9r1nj/MMmunBahpgBDzlo1VJiVlN9YGtkvwjjCNQb0w49xkdgHZs/mn6FVbgAPK+pDVo6bGFWpD8g7ji8ywelyl6ZdvQWMFo9WaW2mAqmOuv4VUZAjAku4a19Dxm4DRreo725DYqJKhVDuG5vgE9NwRZwuYj/8RwnGvJyd+1tNMyy455QuqxzmomWZUGmrPBobkJMtFNa/TyxOcXGYEVwPVFgwwfJqPYqewn8A1rGRY3TBNeH3L5TqxBSyDdK357D1I+V1ayL/k8hT5ziXGRyzSYlrF4Al2DdurtR8eoIUGHUkeLzUUh+D1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b969f26f-9ae9-ad1d-0daf-9248be8e929e@suse.com>
Date: Tue, 16 May 2023 13:47:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/6] x86/boot: Adjust MSR_ARCH_CAPS handling for the Host
 policy
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230515144259.1009245-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: 32635353-9676-4c10-d56b-08db56034f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tUO/C29B1xQ6G/ibE6h9I1tVva+SBQsVXRb5IsJUdrVOxHkpWiAQfyz8uajzFyLPraEfuj9ate3RkhguO9nneEfUDv/idc2LTFLQl54de21bVFLudSeY/idneLcJ9n4Z34ZNAgqzyPSlJhM2blBNDZGVMWnESYttvq6yXN9yGn0Qbqv3w3uOI7EQSxMDmGh7W2uMkMcQkLB/I3a58SxJ0dCtrQka2cb9tT6pDufbAeF5X9ASSXUX4sbi+NZihj/3Q+t2IQ9F9jGdlG9LMNdosS3s6fp8HkAo2CLq4rjDalafgr73Wk3kceC6PUEKSSojpUgu0c1XFPn906ErLrv8KKIdKxiZIRLOMTnQQ0UeLClwdF4nTu1MZyCVz9ODLG+iu/YXwqGsu9/C3EUWVcc55CzIXm+OLmTViuWNZ9oaiTacfkIZHv1Qtqxn4M7q0rlVFdX5ymhCN5hGmIJlop3CTFqjYjH4h/QcY8UoHeC0tDxMJwSkB9OpCIQ7+NNOEXU6spvf13MB+aEoDkAWJCvKlNbkr/RaC3JUPPDsJLEt37euVX6TZqZb6H4bkjZ183e+OqugY3IzxbWcUkxh2efiWx4XC37nUTK75+0pkIHhPAx+j0vwS6UmsERYw7HBBpOO52mxZUeWWOR13IKCyeqY/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(376002)(136003)(346002)(396003)(451199021)(86362001)(36756003)(31696002)(6486002)(54906003)(316002)(66946007)(66556008)(6916009)(4326008)(66476007)(478600001)(8676002)(5660300002)(2906002)(8936002)(4744005)(41300700001)(38100700002)(6512007)(6506007)(2616005)(53546011)(186003)(83380400001)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzlRNSs4RWpRVHhCRlJybXdYNkowNWlMTUVHOEttb3FRaEROUzNDdDNHeXBO?=
 =?utf-8?B?RHZOME9BZ0JkMFp5WHVDR2ZSVVcxaVExa3E5Ukw2YXdBWm02SVFRcFFmNDVD?=
 =?utf-8?B?bEVPL2hqZS9QeUhHL0N6dy9mL0Z3ZVlrSmxLc3VZbTJHYXlTM0dMMGNmdEJY?=
 =?utf-8?B?NEFnL1o3Q1R1YW51bHhNTHhIZWc5VkJ5aWNSdG1xcVQ3NnhRMENwemxVQnNK?=
 =?utf-8?B?YzkwSEJwSExwUGNld083VlZ6V04xODRvWlpSTTVYUFlNRGE5T28yWFV2YXN6?=
 =?utf-8?B?WVpuU3lnUEFNL2JXUktiTVB4dm1ac1VuNzUxSndvWGFJOEdnc3hERko0Q09Q?=
 =?utf-8?B?ZVptMDZ4Qlgya2JBV2ZFQldpOVVqTkJYN3pDalNuZ0NEUWZ1dTduUkkzcy9S?=
 =?utf-8?B?V1F5L05ta3grbXlVamN6eDlvc2RZQXhnQTBRdncvMUdURzBXYjhUZVlNTDRy?=
 =?utf-8?B?a3lKNTZZMmM4RnpZNTM5d0pDLzU2YXRSZDR0VnZjbW5vVFpwZDAyb1ljKzZz?=
 =?utf-8?B?aVBFbi9mWDU0VlRUeVl6YWxJWVpZdWRabVl2bWUxSkZINFQyWDNoaktyV1J3?=
 =?utf-8?B?MGFNc2Niblp5VUFocWwyQjBhdUFpTld1czVKRjI4VHVKSGc0ZWJXVzRPNkl3?=
 =?utf-8?B?eDZMcmhtOHhoMmwzMkVucEZUSEN2eGNIR2I1NDZEWi9tRk4zS1duQlFIT0Q0?=
 =?utf-8?B?K0lGb0VWbkQ0eDdYSEozSUkvRStSVEp1YWNFM1Q3cDkxLzI4KzZyRndlQUgr?=
 =?utf-8?B?S3RTVDErRDIwTGt1OVk5Q1BObS9VZDhwVlhVYVI4RTJCbWE0NGZoc0VRMnJj?=
 =?utf-8?B?Z1k4cStpMFVNR0NXbUN0eVNZZFQyQ3JlTi9PUENTbjdWVGJBT0twUlJQd1RH?=
 =?utf-8?B?NXRmZkJOUng4ZE5VU0ErbDNxQU16dU5TQmVxY2h3WVlWL3RiVlM0dHVJdXRU?=
 =?utf-8?B?d0lmRE1BR1FqN1lLUURXcTloTDlwZ1dkS21xeGRaSGFiOWlvTkV4VjNPWmJK?=
 =?utf-8?B?M0FTYVJOMmY3MjRNRUhGTTBPTVRVZ3V3T3RKem5KR3Nvb2p2QURSZjVuTGMv?=
 =?utf-8?B?WTVQYlZ5VU0rT0ZXTFVGSjdHeVV1VDhVcndBNkg3TmZLQ0Y2aVY5K3FWc3Yr?=
 =?utf-8?B?Zkh5L0hkTTBDR0d4UmVHeG16UnlIOC9CK2NLT20zZ1gwcWpLd3hSN2V1WkpM?=
 =?utf-8?B?RTJReXU2S0Q3NHBxVGtubEYwaE90WDBIdWoyd1VsUGREYWRudnBNMk1jL2lK?=
 =?utf-8?B?am9LbElka01iczdDRkw5emxhTmJxaVE5V0Foa0NvcUc1aklqWm5KcUwzaUZV?=
 =?utf-8?B?UDhtOXBVTWVrZjNTTU5LRU8rWjBiRWFhNzRZT1BVam8yRGJlYUJBNmtoWlBP?=
 =?utf-8?B?K1FrU2JTVURNMmVhMVY5QmYwODRObk5GOC9iTFcwUjBmVlkxeVBIUUVGRmJL?=
 =?utf-8?B?eWt2cEhEQjRPSTRnM1VKWTNkTmlmQUpFZUcvTHY2eEEzQmFISHM3dzRFaVV2?=
 =?utf-8?B?dE1EcVkyRTg0ZE5OVDZocnZjaFhaaTc0OVdLODVuMjNEaEd5YnFpeXJxZGMw?=
 =?utf-8?B?RFJYODJrUVBIQnJQc1VyN05yeEtOYVdYaUo1cVhna1pxeGlTMmpKNDNZZVR5?=
 =?utf-8?B?aVk2SW4xdlZZaVB3SGFWUytpK05HdDFjN3E5OGVmL2ZMTlVpMmpXcXJ4Qlhl?=
 =?utf-8?B?d20wdHpxbnp2SVlNNEpXRUZRL2JaM0p4WmhkU0ZaS0RtWGZDa1VuS3pET1di?=
 =?utf-8?B?Z0FVcHdlSnE2VngrYVFPa09KUkJhKzl0MVJTbXJKaDdUUFphUlp5bHIyMTF4?=
 =?utf-8?B?WlJHdytnclFDcXRWU1J5ekVvSzAvNlBoQjF0RGdVM1lhOWFsV1hMZG1PTnJE?=
 =?utf-8?B?YkU2MXNBKzRjM3VpUTYzTzJGSDBCakdIZGVNd0d0Z21wRVpOY0dBcDA5Si8r?=
 =?utf-8?B?Z3Nndi9uaXNJSVlqeGUxUEpCalVPMkxwRy95MnhKR3N3VjlLaGZHUVB2M3ox?=
 =?utf-8?B?Nml6WnliQ2t4TWp1em1TZHV6YUs4eHlkVC9OaTYxMjNVb1MrSDE1VHVOdWlk?=
 =?utf-8?B?a1psaGQreXcwRFNEOXJPcUVBcFdNRG4rQ0Z4MEU3THlvRzFsaDlmaXdhZUdJ?=
 =?utf-8?Q?/rcDlrTm1uxhrQhPWxRm72Fd3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32635353-9676-4c10-d56b-08db56034f09
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 11:47:21.6329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8CbA5VxCme+DisFkvUscoQOwYePKK/MsmxKHHmPrzD6Uw2WxoAf7dlta3TCw/A2eSVvZrMNmcTQ/xSF7zXnrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077

On 15.05.2023 16:42, Andrew Cooper wrote:
> We are about to move MSR_ARCH_CAPS into featureset, but the order of
> operations (copy raw policy, then copy x86_capabilitiles[] in) will end up
> clobbering the ARCH_CAPS value currently visible in the Host policy.
> 
> To avoid this transient breakage, read from raw_cpu_policy rather than
> modifying it in place.  This logic will be removed entirely in due course.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



