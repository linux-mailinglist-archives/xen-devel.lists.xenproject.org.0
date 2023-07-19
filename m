Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB15758D94
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 08:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565584.883837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM0Tz-0004rs-WB; Wed, 19 Jul 2023 06:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565584.883837; Wed, 19 Jul 2023 06:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM0Tz-0004q8-TS; Wed, 19 Jul 2023 06:16:19 +0000
Received: by outflank-mailman (input) for mailman id 565584;
 Wed, 19 Jul 2023 06:16:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM0Tz-0004q2-1C
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 06:16:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c595841c-25fb-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 08:16:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9571.eurprd04.prod.outlook.com (2603:10a6:102:24e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 06:16:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 06:16:13 +0000
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
X-Inumbo-ID: c595841c-25fb-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAgtHUzdvm1DFndV0n2b5NIUTwL/tpcMOrF5TaksPsfusTFjEpm3ZJLx3P5Sken3+8ZyKwZbcnQJyVibvK6LkojLRUyvMHlcANFFZL4xxLGjOE/k+eNcSkMKvgRfMGucHs2lkq/++867kwFtGxlrBhNoFSkwoilwlGruSeEySSQpbi3gUBrOqwmxtVQb2K2O+aeIkwskLw/jqzZQTTg92F2hrmvS2fR6Ykx2I953tuD1U83PD4yePbxwO7J0bQzdHnAvYvqGJxlOl4pmZVpkGK4seZpAPWJUd+Ww3l0ZxUBZRLKpo57i72haDuAuWB8oanf355WqXfse0IpZdbD2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnZqrkBNXtQN0UTDeaL7zdZ/zazlm+WVNy9KrPZqocw=;
 b=YkFNmNzrTiZlj/np4oN1OFxptH35Xh0PH7qGfWvpAoq1JF7NIbsf0zCqHl1dBk8qOvfqYCKsCX7fJwuzuZRwqXkKjYm35tKa4siiFyKYeuOdNJM2E8I2v1lTMy8sLk13B7CH5/M7tkdd4ueyNgrPJqiH5z8rKjBteU/weYQHBIL8NFy3L86MSxmYBOK6Txf9KKX9Cr2YvEDyeGWuM9iU3qSOEx/U0rDLPlMZo3dsAgKBVm6ZFFwWs0zwzKZWekCDwkWAXTKFBhKVf+vUArGQk/0dpXqkDDOKcsJ63QLiaw1OIMzaAM0HYR8wvrR2PxbvUX7UVq316WaNKLftgVuT9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnZqrkBNXtQN0UTDeaL7zdZ/zazlm+WVNy9KrPZqocw=;
 b=yO5Pgxrtra+OLmTrsrDjPL2AeLWsM4Z1ojnMgvm/qMWJKhyjZE9fsocRZJzX2/Ci4SgLSKi1DSVt5tTQ8wgHeq45RZgeS0+P/iPZU3n4gw609k/yVgQeRMYzp9hazL0alvVmRJAAZgzGKQDWtNWGF4KIvB22SuXFSc9cDSPd3W9J+gqZ8nwYEfYhTq5JL7peb+aA5yLhOQRF2SMJs287nvKZr4VZdfyWRC4CXt+K7GXbH/3OIVRI4ncu8FncMmu5JQVNIREE+mv58ZuEHYHP7hnz3G83PwrDWCMZBggCURdi/x0KPcksvEalXKUNQ48yafyKr4Q/fvdIka2IqfmQ3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d51c011-d2e2-100d-3097-aa086e7dc582@suse.com>
Date: Wed, 19 Jul 2023 08:16:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86/msr: Allow hardware domain to read package
 C-state residency counters
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Simon Gaiser <simon@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <946e5494801866c93332cc5d9ec0fa03a4df00d7.1689686046.git.simon@invisiblethingslab.com>
 <d512a592-24e7-2eca-16ce-7451dc110f64@suse.com>
 <9b53ef8b-7911-ed45-2160-60e6d553fc69@invisiblethingslab.com>
 <ZLc5woleABLgwY/M@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZLc5woleABLgwY/M@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9571:EE_
X-MS-Office365-Filtering-Correlation-Id: 058dee4f-ed9d-4561-4d5f-08db881fa6f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6AuJiDu/iEOL4stERd3bs63tyJWAz/v6s/neDgSJG72JWTP2EbEtLxsmnWCcp3H7t2Ik6bUpP8GG+B5n+HFa3HbTMvgz9NGfyEIgMRt1fMV1NUzrDT2Ac4vkqfn5z8fwq0gX3v/JHDrwRA18xReyej9Mwj13kcTonzt+7hzxHxsY6mv3FdRo2zCpCMN0oXZJqQ+EcXEHUK7wYR0a8RJJcHLeZPB6NXmEyI6yp92DAXwyBJHgqIVpJDAdJ7OuhU+mlCvZbt+JjlG3HXY1fW4Q837K2cQ6NcHCOW+sVcIQYp7TcLbo9ZjOn3nqyrDNqaQw+yc82rr/N0JyJ6e9pFoHJWLoeh3/dLFv2XUam4U7kmJ9Zbsx5wkF8akThc98QCmdHx66t3vCIGhphwDXh1QF/shVSNiteDI1D17iNQ/YaiUxvTo2zOZqZsi4vsRCoXtNAtnoOPq6JgSeNNXAGOBULcPd0bwb+AgQcP4sKjgnOfNEGMBox3/uSb2pMrE3CKgSr5qCh9X6CWneB9shnHzF9OEuST8huMMc3oKzHk/PUERd5AhcvIygk+6bBBmmIFHco8XpEOoWF4HpbYYl80Cuuokuyh8ObtppwpOS1x6UOqyZl3DGGL7VmiVy6K6MIaHMDecVCJMC3KfEy2Spzwcn0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199021)(31686004)(31696002)(86362001)(36756003)(2906002)(2616005)(186003)(6512007)(6506007)(26005)(53546011)(38100700002)(6486002)(110136005)(54906003)(66556008)(478600001)(316002)(5660300002)(66946007)(66476007)(4326008)(41300700001)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym1LUWhMcWFTWDdZbEZRNlpySmpKRFI0ZUljcC9RcXk1c3ovSTd4VUc1WmMr?=
 =?utf-8?B?c0hnZStwTmUyZThnR2xmOXArZXMrNzZaNCtQVm1TQmsyK0k2QThYdUFxSFhn?=
 =?utf-8?B?TVR1NTJqWVVmN0c5MFlxUjFpMFVHUWxoZFlVMVUxbEtPc1VuZHo0WnF0WFFX?=
 =?utf-8?B?WUNKeFJXcURMWXNjeFE3bEhhdVl2VHgwUjRMaGQvSCtKQy9oeGpDeCsxS3Ez?=
 =?utf-8?B?UVdkcVhObnlpNUZBOTF6VnZOdHY0WUh1S01UNXBwMGNJcDFET2ptei9kNWsy?=
 =?utf-8?B?UnZnT3UxU1lRcmhRN0FUTGU4ZE4zME1wZmdiVFJoZXExeVhHeE42SGU0amlF?=
 =?utf-8?B?WlFFQkRHZnZYaWVWaVd5ZEp3QzVVWTZpV1hVbGg1UzJSWTFZTExUNDRkWEpi?=
 =?utf-8?B?RWtnVXAxZmJrbTNwNWl5VnVnZHRmSWo0aGR0WUk3UmpESGNLNFR4TWl5eU1y?=
 =?utf-8?B?RGZOaVEvZitOWlZYSjltVXZKUlRpcGN3QVFwUS9haTltWmw5TXpxOUpnbjJV?=
 =?utf-8?B?YjZBU3ovZ3QwSkJlSUZZU0tRWlFIQnU1dlNTc0FhRmpoRmQ5T3pqVDcrV1Vq?=
 =?utf-8?B?NnBvQnNZUmF2TWdRaVJ3V1ZsMFdjeFI3bVh2THZSNSttRlVSQXl1YnVpN2Vx?=
 =?utf-8?B?SDBpYmcvdXZ1TnI4eVBLSkN3M21wMTVvUzVrSGV3aktJWVZWS3JGbXk2S1pC?=
 =?utf-8?B?RHdlN1RzK21OOWFZNVRmRWlqQTNQaXIwMEZ6ek5HTkVBUjFwVXZvQTlWY2sr?=
 =?utf-8?B?V1JvcDR2dHltd0ZYTC9sbGd6dEJZWVB5OWxKanpMbTNVV3VTMGplUGsrM3Na?=
 =?utf-8?B?dC9xeS9wbFNzc1pqb0ZBRjQxaFh4Q3QxRDM2Z1QraUVvR0cvbFhJUkhOTnow?=
 =?utf-8?B?NUhrVE84Vy9BU3hkTkZ5TzJOZGVVUW1lZXpoNHpobWZDQUsxU2FhWkUvbk4x?=
 =?utf-8?B?WUJjMjViTyt6cnlicFh5Lys2SkZadEk2MzF2ZG42b2RJSXRKWlhjaUo2K1ZK?=
 =?utf-8?B?Y3EybXBPd24yaG9VYTZpYmpsL0UrVXFVYWlNcXliSVNhWXI3Tk1uTzBhMVhE?=
 =?utf-8?B?dGEzQyt3VWJxMytheDZ5TlNWUEUxU1djVGk3M3NVNWMzZStvZjhLODRoaTUv?=
 =?utf-8?B?K1d0L0JuWFVwdUhRazVXNzl3Ung4czFsODBSWEZLR1ZiTC9RNWNwd0FvR1k3?=
 =?utf-8?B?eDJqSE0yaWFmd1NZWGNZbWlDcXNEOERpbmlXemtzbFNwc2FTVEZueklpSFZR?=
 =?utf-8?B?eEVvNmUzTVJGb2ZjNDhwckF2NTQxN29ERFpRYndEWUhrN01wMXh1ZlYrbFhX?=
 =?utf-8?B?OVBJeENHekU3MlJFczJJT1IvODVuN1ZFRHlRcWhwL0lwUE0rYW5CZnlVblhI?=
 =?utf-8?B?bmMxZVZLVXpyTXhVNnE2ekkvWXAwbzVEWjdnUkpSeDNXLy9yd0REdDFjMmlh?=
 =?utf-8?B?K0JQdEhLRjVIdEpoVmFFNTJTamhXblNzZ2JvcmVpUURJOW9GdmZIS1dhRE8y?=
 =?utf-8?B?TVlUQTk4bTNydk9FZHhlQmh4b2ZIUFlraDZxVWxhbVJpdkk5NnZZWTZUKysy?=
 =?utf-8?B?dmY0RnVSWERCRGVmbjJ4ZDBNR0s4QWtVSTRMb0hoQ2JEajUvYk5ZN1l3UU00?=
 =?utf-8?B?Mk1rUnJoTzFubmEyUHN3dTRmOStaeXI1djczbTkzVVU4RTdTQnRycGxTTURz?=
 =?utf-8?B?YVdVSUQxOTZRcWoyb1JyMVFxdzB0eWN4RzQybWh4a2JPWVpTUkw1a3RhajBw?=
 =?utf-8?B?TXJMS2JYQjF2S3Y4aW93ejVjUVRxQkkwUkZ2bGpzZUlEMFpFd245OXlLd25P?=
 =?utf-8?B?MkVEbjhma0tuNEdzS2twUUhsbUpQQk0xRFVIQ21KWHRaL3p0VVU1ZGdybkNq?=
 =?utf-8?B?STV4U0ZtanRqcWl3UDFuZk5tamMyU3l2UzNFRFZMcm52UG8rczJWTVJLcG1Y?=
 =?utf-8?B?RlplRXRVVURnWUR1a2lkM21nK2NNcnhFZ0FXMUFkWlVNZUNPeVZlUjBmSlFD?=
 =?utf-8?B?djBta1RIQjJPeWhBZWpiM1R1NStDeU5vWklwTDVQVTUxWko0SlR3eVhHVnVL?=
 =?utf-8?B?eVdGbVdhSHk2aUNueHo5Z1AvYkN4SzBGeXdMb2NOZ3VqMWJvWjA3SUd2WHpL?=
 =?utf-8?Q?g+DLfDJTENXOshvZqQ9MVNcLg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 058dee4f-ed9d-4561-4d5f-08db881fa6f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 06:16:13.0332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XrBg6+ptkIJTtMZflUf0X7/SUvu9P9MxwdYB4Nk2JIMbTTmohi4KJFpryjIhFP6OiMf/1eNU2Mx32lXLSsqTPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9571

On 19.07.2023 03:17, Marek Marczykowski-Górecki wrote:
> On Wed, Jul 19, 2023 at 12:38:39AM +0200, Simon Gaiser wrote:
>> Jan Beulich:
>>> On 18.07.2023 15:17, Simon Gaiser wrote:
>>>> --- a/xen/arch/x86/pv/emul-priv-op.c
>>>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>>>> @@ -965,6 +965,20 @@ static int cf_check read_msr(
>>>>          *val = 0;
>>>>          return X86EMUL_OKAY;
>>>>  
>>>> +    case MSR_PKG_C2_RESIDENCY:
>>>> +    case MSR_PKG_C3_RESIDENCY:
>>>> +    case MSR_PKG_C6_RESIDENCY:
>>>> +    case MSR_PKG_C7_RESIDENCY:
>>>> +    case MSR_PKG_C8_RESIDENCY:
>>>> +    case MSR_PKG_C9_RESIDENCY:
>>>> +    case MSR_PKG_C10_RESIDENCY:
>>>> +        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
>>>> +            break;
>>>> +        if ( is_hardware_domain(currd) )
>>>> +            goto normal;
>>>> +        *val = 0;
>>>> +        return X86EMUL_OKAY;
>>>
>>> In addition to what Andrew said: Why would we suddenly allow these
>>> reads to succeed for DomU-s?
>>
>> That patch wouldn't actually allow those reads, but fake a 0 response,
>> or do I miss something. If you mean that behavior: I just mirrored what
>> is done there in some of the other cases. If you prefer something else,
>> for example treating it as unimplemented, I can change that.
> 
> I think Jan meant exactly this difference - faking 0, instead of
> failing the read.

Indeed.

Jan


