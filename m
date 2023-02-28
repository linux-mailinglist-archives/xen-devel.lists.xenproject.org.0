Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17026A5ADB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 15:32:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503405.775681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX11S-0001VO-Af; Tue, 28 Feb 2023 14:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503405.775681; Tue, 28 Feb 2023 14:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX11S-0001TQ-6n; Tue, 28 Feb 2023 14:32:06 +0000
Received: by outflank-mailman (input) for mailman id 503405;
 Tue, 28 Feb 2023 14:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pX11R-0001TK-3e
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 14:32:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa1a9817-b774-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 15:32:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8575.eurprd04.prod.outlook.com (2603:10a6:102:216::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Tue, 28 Feb
 2023 14:31:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 14:31:33 +0000
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
X-Inumbo-ID: aa1a9817-b774-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kY+XqersIbuYaYW81vcZpdQPnHfUeZNF6dM+mYggICYIAskaCpWKIlv4f9kUparAAYdDoDrO+t3gpAd/+6udMpfyK8JXXVCkcaMGZ3mRjW2rF/uBLapT0b0Fe54nDFJqmg+MI1WJXa3ZIINsyv9bC99OO29PRKkL5r32/UCbjEf7ClMQDHht1g9JJgF34rPKQVBVqWBRyGap2YDTMThvIcQSlH50t04A+LFlWgzJc0f0E65OxqEKf/ceyx8CzHrWPqqDz5d50adXc9IDC2D1WxHeZytyrJzg0jsXBKv72fpWmS3f2wDlO5apzAdU4Ps2dWb/gb0Q11gYu1bmWTnt4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pv4EdgUVDSm0rESOZB0VKrF8/u6rEpZrieWIiEu8SUE=;
 b=fgtUVxmu8AFTsvDOx7OHWsCENDaM80yNQ3qffNVeoBIBZgGlPpSJcQ3LXhf8WpFbTXeiOYgCT1D72ALvlMLnqQ9+Zb8yX3jrzyS7xb7tLxoKncxA6Vf9x8j2olYriXO8DowfdEI4JpKHir8nb+sWzDqhx0L8eDf5Z/xZ9Ous79IYhs9X+/HDtKVPjfEC5q9X0YH8dd+uSqB1fQZ5FJIKYgajBrwNCHrdiUum8F/XM7W3mbteFTdnC3VLyMwBBS7ppi1gPiu8kQOPKenmpGczy8q30Vqyeqq0EUWEmzIySNB0ODfaJAHU5uurG1Oyzsz6u3bZ/7Dtuib8nKaF1SrpoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pv4EdgUVDSm0rESOZB0VKrF8/u6rEpZrieWIiEu8SUE=;
 b=JJj9/fkLuhYU9gBuWcJbTliPRcKAWL8UC7iFU17GNDKA3YgFaEb2yPbwaEJah/DUzurcfSB/3LoyUPKKLYqCklTPWEKuIDP4duJYE2gLIhOvDs2BkDGPO2jk1LOOQ3V1nVARwUaT9XADDaKUQhEYhmDhdicI7gYDGlLeY31kiiqTBVHfShuJ+VWWueP59J/WD7HOua+BivDanKVVq4qzHREWSnWRxFFkMT30TUDb02UOx1r3fcaaoR3pREPcAHQd4BXR+txPqwBh3CoiaDwEhdA7j9xZARM2oBEtJdmp45KukZcO1wsgHF/NApJSpyKsipE3Fm5wPZ1ZTl/PDFrXfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9c6b915-fd3f-22d9-ebf9-5497eb6aa578@suse.com>
Date: Tue, 28 Feb 2023 15:31:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] x86/vmx: replace enum vmx_msr_intercept_type with the
 msr access flags
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
 <20230227075652.3782973-4-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230227075652.3782973-4-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: fbae1fb7-5dba-4667-d98b-08db19987d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W4pw0bwi6fDZJ+Fk6tNCwAbWItE0V5Pn+yk1gGJQUkIxF1E67gAaxK4OpLGJjhiR1pNI5VK7BUSsvSXSPztfcQLkKGB+LbjAmxK7FyvZNo/n9ThXtulT+iWdVj+j4vUal2bsY3jAI+OjR/Pg+TymNhbIicdeHW2sGqSWF79exOPeYYLCRRKjKFTO83PhFI++WWhyYUEily7mJG1QbJu4kdL3Tgjmx2vqJAzAYpv+UC5a8L+d2BgmLg+PrpFveggrJuPjHZ+AX0UMk9cDIhIrn7qQgT+DgJkWe8D1x6murUNgAUZ45VWoieb12U9P1REhtAUk02+37QafpFTTLxW+AkDUuCFBPyTzc5A6FdjTY99J8vTn6RlF6HFz354uVX3XaUB5HOI16P80ykg9G8YePVepE7XR4cUDe980GYnZhQwx23fnKAUfPJcETjPumWqq10+gS2Jca0i8SorjjbQWzhdDNIOwxBRqH+0a+h4mRwwvIUl8GZZcPM4Hqf4lyOh2rAaUHgg4RhbFVn5w6XPW+RfFtbIIKxbSGDvxamH+bawQ9OwlxdleAV79o1G2o3nLjEy3yOslHu4jwjqLL9pkoG7uXfFpRv3yASMcmMzOWp22U4ltcjBcdHsXIz8z3hzLhTvQi0S0fOOQaKizkIhVWqV7YZhf6PVxsTWh41CKzyb8f8qoxVeIjDYzu7QpCWqpNpNICe+Thseo+RAEOG1CgDN6xEiRnOpJkv8kslknInk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199018)(31686004)(316002)(36756003)(54906003)(86362001)(31696002)(186003)(38100700002)(26005)(6506007)(53546011)(6512007)(2616005)(2906002)(8936002)(478600001)(6486002)(41300700001)(4326008)(6916009)(5660300002)(4744005)(66556008)(8676002)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L01xUWJMa01RTUV1RHN2b1BRS2o0YkFtU0FvMjk1ZkdGZ1loZ1NtNGgxcFVS?=
 =?utf-8?B?TURQTDNwb3RQb3JwSllDL2JoSmQ1c0lyQmJZZ0dBbmhvUkJ4bnFkVmRBREwy?=
 =?utf-8?B?Y2Q3SVprbGFabmhhbVcvLy9GSHY0eXF3eE54V1NjT1h0UjV3OE5waHpDaW9N?=
 =?utf-8?B?c0dTZkhlNWNpVnRFemZiN1JlUjF0Y2d4NUxkMDN1LzZmY3BMK1YrVVlaVG9X?=
 =?utf-8?B?R1lhRE96YmFqWFBIVmp5VDYrMmJxbklrSzlMSEZLREpacTVRak1zUi9sSUFY?=
 =?utf-8?B?OU9vL090YnVud1ZkcWloRk1uN0s2YzNnc2dhSkVickdYUnl0TFNMVzNNRitZ?=
 =?utf-8?B?N0JEcFpQRTFOWHFmNTNobE80QjVrcHZGaW9yRmY3eERlZExhaGRnUVRJVDVa?=
 =?utf-8?B?cUxzT2pUQ0hJekg1SHRnemZJakc0bVFFMWgzMFE0TmdVWGVHOUF4WVVDNDg2?=
 =?utf-8?B?U3VPbzd5T2FjNDU1azA3akVFQmdJeGJibzIyZXREUzlRL2J2b1BaenBWVzQ3?=
 =?utf-8?B?TWh4R1VGVUNvbVFQSHo0TlNCdm1pOEcwdWhFcWhEUU44enNmS1E0U1E2MDlJ?=
 =?utf-8?B?SDVMR1I5Z1hscEpNczdMbG5zL0xYanByN0QxcFg5M05Ba3p1Wk5tOWo0SHJw?=
 =?utf-8?B?K2dkcVRwRjQ3VjZHczFSZzlIejA1VDRSMmtwVzI2SWJvZHIyZ05wODZWUElL?=
 =?utf-8?B?VjI3d1IrajdhS1RlWjlxSGlsc204SGFQdERwMzA4bWZVam1BbitUV3F4eFdC?=
 =?utf-8?B?dk9sMFBsMytqbGJic3B1S1NxWDFXK0RvL1drZ20rVlZxRWMyejlDd0Jrb2F5?=
 =?utf-8?B?YkVjeWRyZzlON2xLUHRPeTFMbEpZa0NyN2xIeGlXYktjM1c2WnVJOEp6RlQ4?=
 =?utf-8?B?bWVTRlUvNldpOS8xRHVIUHl1RlJ1bzJ4M0YvblpldHNQSDUyZWx4dDF6NlB5?=
 =?utf-8?B?ekRTelBYVjE0VHNYN2V5azRrcEx5bHJOTFhUN3BSSWhVdE12ZTJzdUVqcXQ2?=
 =?utf-8?B?YlFES1YyanE4bzZTMlRhQnVQTkJEQTJRRUEzV0Nqa3YyQW0xVnkydTg1bDlo?=
 =?utf-8?B?OWtIYUhzeUUzeEIyZXRsVGdVaEMxcHArRmlyOTVPbXM0by9CRjB6NkRTMXlx?=
 =?utf-8?B?T1N5aXZPM1QvdEpUNlhoYmhXcGtjYVRpa0dvMDB2VktoanlBMWx6dUptTkZZ?=
 =?utf-8?B?cVpiNlEzSUFuQlZaSUxyOVBNRnFJRkhCa1Ryb0d3R3RQQ1Q0QzU0dXA5N2xZ?=
 =?utf-8?B?cVRPeng5MDNEekdXVlpDNDBpMnJwQnhhWHBuRzkvNUlNNGUzTlZSNnM5bjZn?=
 =?utf-8?B?QU1BVzhuZlRnc1Y1eUNVM2ViZjFYY2dSc3lLdkR4WVJ5QkRNS2V2SXM3cUNp?=
 =?utf-8?B?Y3NDeGdqeU16TU5QbU16RUlNOUNRZWtRSnV2K1MvQXFtMkNBbEQ2cHY1ZVBj?=
 =?utf-8?B?NklicVU5WFN0R3ZHWDZPQyt2Y2ZOSDRVYW9kbDM4NnFDWmZIcXFFMjdsNmhj?=
 =?utf-8?B?ZUM3NUE2czZmVVJXRDdnS0NhM0JHSlc0YVd3WFJWbzNrWGJIYVpIVngwN0xE?=
 =?utf-8?B?Q05oSUNjaDYzQnpiQzQrdWc5QmRvd0VreFN1UWFiWS85b0tMVDdram8rWDVs?=
 =?utf-8?B?ZjhoZDdUSTI2N3VSZWVObjZoRTVOT1ZFQ1JQNE00Sk1OV2xhVEJZYU5OUllN?=
 =?utf-8?B?ZzVOUnVDZFlWN1JRRnNHai8zaUNkMExWUU5tZkpyRkhPb0k4T1JOYnlCZXhk?=
 =?utf-8?B?ZkJMUnZmQWtjblUyK29HWGhGcmc3NzVXNUFMTkxncjVkdTVweVpYM3lKVjR3?=
 =?utf-8?B?eHRDYlRIaWV2OHp1RVMxNWlaaXpVREFhZmpZcHh3TlFmTHdzZGxMazl2S3M0?=
 =?utf-8?B?WjQ0TVlEOXdlaG9kaE1lVlRFR2hTZkNrMWk0SFRXd1R2TXlJZzdRWCtSUHpR?=
 =?utf-8?B?UHVkVXZZTEVtUDAyRDdvR0JHZWN3OTJiL2ltTTJEaEpxNTJCMHpObG9tQmFv?=
 =?utf-8?B?MURYNlMzT2ZnSzZNa2Q1RzBKN2JhWWFrTEV3TnB4OUpQbmJsNTZ1NU9yVUlN?=
 =?utf-8?B?ZWlqdmhGTG5YUXZ2RlRjaC9lVWdFK3htMjdDVDltRVdLVllxS1NkZ3BERUFw?=
 =?utf-8?Q?+wg3jr8hakfREhsPLVTZ61c+h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbae1fb7-5dba-4667-d98b-08db19987d34
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 14:31:33.0489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PINDKjx/eFuy9c19U6Bt7d+E9EKoXoA/YtGWukw+LBjFpi0PDEf70wEesP+vHznwEzSvid9ovzN8fIp8V1tDUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8575

On 27.02.2023 08:56, Xenia Ragiadakou wrote:
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -644,18 +644,8 @@ static inline int vmx_write_guest_msr(struct vcpu *v, uint32_t msr,
>      return 0;
>  }
>  
> -
> -/* MSR intercept bitmap infrastructure. */
> -enum vmx_msr_intercept_type {
> -    VMX_MSR_R  = 1,
> -    VMX_MSR_W  = 2,
> -    VMX_MSR_RW = VMX_MSR_R | VMX_MSR_W,
> -};
> -
> -void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
> -                             enum vmx_msr_intercept_type type);
> -void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
> -                           enum vmx_msr_intercept_type type);
> +void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr, int type);
> +void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr, int type);

unsigned int please again for the last parameter each.

Jan

