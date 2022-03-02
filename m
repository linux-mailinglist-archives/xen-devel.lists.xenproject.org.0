Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50D44C9EF1
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 09:10:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282030.480580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPK4O-0000yS-S5; Wed, 02 Mar 2022 08:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282030.480580; Wed, 02 Mar 2022 08:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPK4O-0000vn-OI; Wed, 02 Mar 2022 08:10:48 +0000
Received: by outflank-mailman (input) for mailman id 282030;
 Wed, 02 Mar 2022 08:10:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPK4N-0000vh-CI
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 08:10:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4297d0a7-9a00-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 09:10:45 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-dneQYi25NdGpaypgy7WPXg-1; Wed, 02 Mar 2022 09:10:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6444.eurprd04.prod.outlook.com (2603:10a6:10:102::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 08:10:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 08:10:42 +0000
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
X-Inumbo-ID: 4297d0a7-9a00-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646208644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YxYYx4qSTYeI5IcFW5GReI7x1E1NMhFusMjW6vzmXSE=;
	b=KJnnCFr06QfgHbtHtfkuxgsrmtf4Za5kLnY578XpdrxljA+Csq3jkiHHNCJcHglXaNhoK4
	LUIjiI4YKKL/4tdmaRmDpVLTKEK77jPRxUg0AakAE95GxxNuvVOoCpUuQgxQYcRn1NiMhe
	4h4CrPXDvzRz9JSq3Sa/Wdk9bQMhiD4=
X-MC-Unique: dneQYi25NdGpaypgy7WPXg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHpnm1KTGSWq6AYPuy9F9SMhI+NwGszJpXpVoyOjNZISkvQsdK4l6goM4JFp5hcj4Tkx8hj7CXiTBZuN78SjUCD6tbrAE1/sZPGNiygXkCC6BRYvWvi1GZxIk1JnyO8LFXvrxEQBGkv5YKV78qtzrfQEQAkZzesmm7QtkkHlEN+EqZHkfJhhUtt1Hwax7sCBP93grNBAR/ajWX1HFUX2TUy+zOi8/zePdWD/nfzJPQgk1VZToGdqxEZiHlPO17AsbRqNhhf/JkppvePAUiYMibFAarornrBfBorY1a0PcmCCyI3KhWV2IJg1dscAMZPp1cP//xUF22DKQk2PcEl5JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxYYx4qSTYeI5IcFW5GReI7x1E1NMhFusMjW6vzmXSE=;
 b=XpIxGTpTJ5o0GSrVeThD4+7625JzfxmPcN/MmYiLLiB04nkZPa/yf/qOzJSRfh0H/suWttE/bQJBIUu8N8T3slD2Lk7kepui8FPZwCnQ+dNUtjQ3wEpAXhSd84S13EUTNM6syTUmdvZk1IeARyXjnXKc9AbKqublK7+B/jAbv4AWXJzcl0zvp3Y6u/CqeXoOn1qjG7jVo6YfvbjXO3bBbICQMGRt4kKuv/yOmbb76zXDKdRmryBL/ldKdKsT9SKVhV3hAdysxXrzZDpaDE9KyvJj06guXCWaFDtNZnKaQXiNHY0YDJ0yf3mpJ8yiS6CIhONz6BuA9OA8tpGlONatLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60f3c942-3822-87dd-df6e-8b64ed4d17c4@suse.com>
Date: Wed, 2 Mar 2022 09:10:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2.2 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220222114711.19209-1-andrew.cooper3@citrix.com>
 <e8b71b3a-55a0-31a2-b2ab-3b2470680709@suse.com>
 <5fae516a-17c1-0ce4-c46e-909a83c0e273@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5fae516a-17c1-0ce4-c46e-909a83c0e273@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0037.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ff42c47-9d7e-4d48-0f90-08d9fc2424f1
X-MS-TrafficTypeDiagnostic: DB8PR04MB6444:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB64443F2EC0087BE0978364C5B3039@DB8PR04MB6444.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8asC/Dke2BAyD2jRZmFKdvO51D3C+y0jW/7+WTLgP05WSk+LPC4VWCsPhkvf5kyHoTHdpBmUHXP7+wWmvK6hSHZE0dZzujHdVRBOv7PlpARXUtQXxqWkYYFJWlSzlbtDttOyfDvddNKXR1rGDfp5GdQjoGXW69FZ+v/8mng1aJ+qOOCHmxjGEHbcxC/cPHjq8z+SfqWjPQMjt+g3AhlSO6c+jGRmMt9PFfDIhwpIPRKK75eDT5DKM78z0vyxkjf/Pj/UPWkHgHCTqI4xu6xGHC45MeLMUr2jLWcSoCAXBl5hVjFD0JNaafswIlqOyNPn8NLoHf+Viy+ohipciYjpiJH9puQ7wPlOz0RIWrkqJ9Yk8rWgLKTB8O5N9D/zwRdjM28Brk8KYCdUQHHFPmiJwn+rckjb9/BHJ5j9OT82kxmB2LCUTd6WFwaqAoI3SPEhcWALfcrEMaqAvaBZR7ASI0FRyy5s6JhNyqTk4yQnRgaosY0GJNipMPsg2oV68GCoKiKS3b962wMREOROP/mVAagMWrlRBZVmkcoWCiduFjWInxg386QpeisHcQrS7nR18u3bowNdmuXBx34T6ucmLNB6YZCxutUzASVMEWuIO4ouZbaGPQ9rlfdD5h0Meu55pX321PR/7zZ491BYASAmENugX1WSib4vLH27ZWVIyheqJDIdBijDOCAvuoYRO9HVGrzJlIcJSn0V5Y0YZzXPjakRz11r2VjIbQ7LdxaZ8iw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(86362001)(66476007)(66556008)(8676002)(66946007)(36756003)(5660300002)(4326008)(316002)(6916009)(54906003)(31686004)(2906002)(8936002)(2616005)(186003)(26005)(53546011)(31696002)(83380400001)(508600001)(6486002)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enMwMDNyNkFRd1NWSUlpK1RaZkkwWFE2Z01reVFPYjBCUUFBcWxzbEdVVVM4?=
 =?utf-8?B?SGkrZlNBejlJSmtlTjBwdEVVTjlSbjY3bytsL2pDWDVDc1BmQWdTTXAzUFhY?=
 =?utf-8?B?N3pwem15MHE2djJiVis5YmY3dDN2eDQ3cmlMdEtreHNHczdNemJjQWs0S2w2?=
 =?utf-8?B?cVRORWdqRDVqWW95ekt0ZmpHd0RyeE9sWVRpVHFkQmZJMHVoVklnOWJPK21l?=
 =?utf-8?B?RE1zTXovcVEzTDF4bWdVSEl0VktpYWgrdk9aNnJ5QVRaNTg4WGdRdmJUaEZT?=
 =?utf-8?B?NkxNTDJjZFlyR0RHU2R6cGZkbkZFSURQeFBHdVlGczJXaDd4b0ZZYVNHVHR2?=
 =?utf-8?B?R3pwaUNacngyTjZORnhDa0tKNDhYUUNrUHJaWjdlRmVhdTltZDFYT09BNmls?=
 =?utf-8?B?M3FQNlRPcDZKakZVVlJ6NVVtaHYrNC9MNUF1UVZTeFMrT3JsK0FnSDM3TkNp?=
 =?utf-8?B?dy84NnFpQjVMdnFha2lLRDQxS0IrMk1SYzIrYkJDMWdkdTREa0JpNlhTQ00y?=
 =?utf-8?B?aU1oU1lETXhKMWd1VXpXSEFqdmpxdHJ5VzduV1VIYUlYQnEzUkdVQlpoR1lZ?=
 =?utf-8?B?TVA1ZkVyNVNBaWxsTTliWnhMV08xWFFGSi8rY0hzL1Vhb0FSb1FwL1MxVE95?=
 =?utf-8?B?U1ZkUmdYSU9aWGJyWjhMUnRaL1NaNWZsMkx5ZVNUV1l4U05hRFJjUkxFY2Jo?=
 =?utf-8?B?ZnNtcXA4c3pQV1h3S0tmSkY5dlJyK0taeVlZRGJKWFg5RHVhWCt3OGNKOGVJ?=
 =?utf-8?B?UWdjeGREUWlqakQ0VFczNnZkT3NDZFhVYnNzcFVmblRZaEc5emZqRlpwZnBW?=
 =?utf-8?B?Wko5RXR1TTZSR3kxMkYveGtxQWlQSnZpOVlQbFRZbjEwZ01iOHN4NkwzTjNL?=
 =?utf-8?B?ZzU0V2ozblNGbExGdy9yb2RjVzdrZGNFWjM5T3UwTmdXbFZQUkJWVmNyeEM2?=
 =?utf-8?B?UWtvTHBKeEJyQWRtM0V2ejV4U1JucVBkMmIrQVVSVXBCRUd2RVhsMXFGczB0?=
 =?utf-8?B?TWx6UFdpRzdCSjNJRkRadU04b3VleGd4blhXU0dvU3F3djUrdkxuS3B1cXRh?=
 =?utf-8?B?aldhQXJjMmJIS2paaWZPUW04cFR6clJ2ZnJzbmNxY2djS1ZaVlU0dytocWs4?=
 =?utf-8?B?M0ZRSm1vOEVZR1U4Tlk3WkpPV1ZQakhrNzQzRDRFT2tEZ21mblNpYlo3bEYv?=
 =?utf-8?B?bDNzcndFNlFvdGRmbGhSMTRkUDk4eTJSMVhldmZ3MlJjVGpMMFA0VEtIY1l1?=
 =?utf-8?B?bHRlTkJva2IycGlTQ2x3TXR5Wm4vMkxZRDlVK2g1c3dCa0duTmwyYTZuZVdX?=
 =?utf-8?B?TGNPL1Yrc2pxZGhHQUpWa2E1RENxbWFoNzNJZlgvSlNkOXAyenIzOFZSQ1ho?=
 =?utf-8?B?Z0Zmb3RGNkYxMjkyRjJvQjhDQlFESFk1T25Bd3hUVVZYUVh4TmJNL2oxaU9r?=
 =?utf-8?B?cFg5RFl3UGNVSHpoTS9Ed1B2Y0t2YTArcERqM1lOeDFoTnJSZDdadFE3Z014?=
 =?utf-8?B?K1FaMXpwUU4vbmdOMjIzTW1xYTh3S3NrV3FEK2dCcUM5ajVvM05Gak1hdms3?=
 =?utf-8?B?TzMrU2ZBd25tYVpzcWh5aTJHaVhmT2tXa0l6NE9SWFY5SHhOeUloKzhaZ0Fn?=
 =?utf-8?B?Zkc2V1ppK0VERURNWDBadFR5Q1VBelFzc3dFeUZDNXhpYXBhYXJ4RTVzck1Z?=
 =?utf-8?B?bC85cFczb2RSWC9Qekh6c1htQ3BJc1pvcXpldjBuZGN6OExXODJaeVVYY1Ba?=
 =?utf-8?B?TlF1VjJsU0NMbFowdjZVMXd5OGJJY3hYZFZRQTI0amNUckJvNktGR1BBYm9G?=
 =?utf-8?B?Z1JscTVWZ08rL2lRdWRQVzhaMmZQaks0OGlPemRrYXdGZHNlMkNoN3BkOGxv?=
 =?utf-8?B?UFExUVNKRm9RSFZDeFo0NWh4OVMrb0JnYmJWS0U4TE9LS01JM1JtQWQxbm4x?=
 =?utf-8?B?SmJkckFOdjlCZVd4UC9UeGtVWlFieTh4a1V3UWlNeFdrcTRLZVdkWGZMODQ5?=
 =?utf-8?B?T3YvWFExamlxTDcyN0ZZUWNoeHBoYndPNUY0NWhpeVNYcmVqRkFLMnZSVEFS?=
 =?utf-8?B?SlBkaVYrSi9xSysxVDc1MjJ2a25ja0h1ZVR6cjBnK2p3aVlzWTNOdTF5MzJp?=
 =?utf-8?B?MlBVY0VRbjgyN2lEUlkxakxjT0lhQU5BcmE0YzVkdFJTUXNGbi9pZjlMZGhS?=
 =?utf-8?Q?InD/gLOuK0IBvKBpnMB0Saw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff42c47-9d7e-4d48-0f90-08d9fc2424f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 08:10:42.1873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FN91kbL4ZCZlkafdZJYiNuY6IdhF4nlOoeVYJRroazkymhm2HyVXq2ZX0cW2PqbJEDQg5Yn3nnY8Ine2/Ac0cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6444

On 01.03.2022 15:58, Andrew Cooper wrote:
> On 25/02/2022 08:24, Jan Beulich wrote:
>> On 22.02.2022 12:47, Andrew Cooper wrote:
>>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>>> @@ -628,7 +628,7 @@ static void cf_check amd_dump_page_tables(struct domain *d)
>>>                                hd->arch.amd.paging_mode, 0, 0);
>>>  }
>>>  
>>> -static const struct iommu_ops __initconstrel _iommu_ops = {
>>> +static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
>> Following my initcall related remark on x86'es time.c I'm afraid I don't
>> see how this and ...
>>
>>> @@ -2794,7 +2793,7 @@ static int __init cf_check intel_iommu_quarantine_init(struct domain *d)
>>>      return rc;
>>>  }
>>>  
>>> -static struct iommu_ops __initdata vtd_ops = {
>>> +static const struct iommu_ops __initconst_cf_clobber vtd_ops = {
>> ... this actually works. But I guess I must be overlooking something, as
>> I'm sure that you did test the change.
>>
>> Both ops structures reference a function, through .adjust_irq_affinities,
>> which isn't __init but which is used (besides here) for an initcall. With
>> the ENDBR removed by the time initcalls are run, these should cause #CP.
> 
> This doesn't explode because the indirect calls are resolved to direct
> calls before the ENDBR's are clobbered to NOP4.

I'm afraid I don't understand: The problematic call is in do_initcalls():

    for ( call = __presmp_initcall_end; call < __initcall_end; call++ )
        (*call)();

I don't see how this could be converted to a direct call.

Afaics only pre-SMP initcalls are safe in this regard: do_presmp_initcalls()
is called immediately ahead of alternative_branches().

Isn't this (previously?) working related to your "x86/spec-ctrl: Disable
retpolines with CET-IBT"? With full retpoline, there wouldn't be an
indirect branch, but RET. But with JMP or LFENCE thunks this ought to
fault (already before depending on thunk selection, but unconditionally
now that your change was committed), I would think.

Jan


