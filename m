Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F1920323E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 10:39:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnHzA-0005gb-RS; Mon, 22 Jun 2020 08:39:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnHz9-0005gP-CD
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 08:39:23 +0000
X-Inumbo-ID: deb3d674-b463-11ea-bb8b-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id deb3d674-b463-11ea-bb8b-bc764e2007e4;
 Mon, 22 Jun 2020 08:39:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrJ9lFXKEGkDVfO/DlY7YW78zPyuf7fQBIlfWRmkpW/WUuz0Pa198M2ndi7xbiIAhmr0EXyN2szlTl+GKzodteinCSqeweVU5ZTF/LromOy3K3NQKUzoiF2quM3G50pmTd7ghnN4kc5Tjeu8vMSv/KYHHSKNdvUvB9mnoSjXPb6eJXTqt/qth++UUKnQ0Cah3WyuZ5wytRAWQapFEOu1AHd2/M1SQjLI8hDwUQXBrsUaklONNA9XEsqYyZRdGIBAJfwvEbwv0Gt4B0+hGH1M8tbQA1umnNF70o+LX++EUN/cWk6DrLJgiof0bkqkyy+hv+C++dKM1xfiTIDsDBxR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzLQgpaLcUta3sDI7R2cn8rDxD/Tgo+eeo3raKNb6gA=;
 b=bgBdYawOjgbyzQ5NiYi+e62Fcmf+VB+O6ZwXYUd0xmTfiQhnS/JAmNHSnQIxIB0izVORS7HTgqC/bdNGvwX0G4Yt2EynmBYMPanFcclnxlEerLXyEN4vOLPcrx2aVKw0ROn0m7BqqB0WRl/q8EfWwrlEHe6iCLpzZcxIEo22E5NNOyrwZuZI3DHmhw5ldY4qpWB9H6Jv+a1QOWPy9LCGhzIXDwXhuBZaVI7GF0SIwnlLbDALyD0UQdru/X4K6RGYvgIKjNT5oNaT6IQEylBreqCzui4pEi6Mf/tGJhQPI9ztxvg9IKMkFYiWmz+RxLoUWrSybln/BzGiLmY7+ipZsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzLQgpaLcUta3sDI7R2cn8rDxD/Tgo+eeo3raKNb6gA=;
 b=miWSyBvzRysT87Bz0+Fj7k8YHR6084Ze0g80hjlJ/7/2k8f9BakRafy4z+12NAyOGuTH0AJmmcZTDyOTXY1/ZdYD8k587wBsv7Ni0tI4cVmgwwpMmKhjogB57klNnU56rTaAU0yNG8FyWxJuDMCWEsX87tpMq1GBae9KZoBqq4RMRJVRqDGB2igZksjK3vtXTLcKr5kfugqPD9g6rP+oLW29Slq7yFibruTxgu1iL/SEAlJwiiRdM2vQKmiezR1T7EtVPMkbP9cfcOLDs6hF9JIv0PUxtjkrNdzu966z8brLQX24fA7Jng4q4ZDlfe66UpI3luD5bPCKBzIdGAntLQ==
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4015.eurprd04.prod.outlook.com (2603:10a6:803:48::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Mon, 22 Jun
 2020 08:39:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 08:39:20 +0000
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <227951948.10901979.1592794601349.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c2ed1d8e-d8d4-52aa-1d62-fbb6182e3a6d@suse.com>
Date: Mon, 22 Jun 2020 10:39:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <227951948.10901979.1592794601349.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0097.eurprd03.prod.outlook.com
 (2603:10a6:208:69::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 AM0PR03CA0097.eurprd03.prod.outlook.com (2603:10a6:208:69::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.21 via Frontend Transport; Mon, 22 Jun 2020 08:39:19 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3048bad-85cd-496b-0a60-08d81687c1b4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4015:
X-Microsoft-Antispam-PRVS: <VI1PR04MB4015F912F546BF7E6A235C16B3970@VI1PR04MB4015.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kNhQGzRXQp1UJwhzIR+wE+KbYxWE0cnTa8TeGHoJH9N1FN9spEfmGikfx8/DREae2j89CS2UgI+F88aRYrk/xrzSkkCOPBhGfFD+7cUFqqh8y2QNM3MfhU2ae+GTzA3kMSOp/7bq4UTZ/WdTOY9FS0NMPyQvy45saJf4NnQCTmu5T8zN2CxMI3AoVPYqXTdpjNoID7c/EOPTyc9WC8I9TbEWmMyQG9zWD3BLMwvX/g20HkmDC6Wojt6LWmCwxmSYcUBAVs1GGFNafc82p5YQoSsd3Xh5oXJ0669Yu7oRDJhXwVmgPkOtBrG73kI+WrGSgYPMrwgpit03tuyap2ClamnHjS4gOmcHBSSGaB5Ubl0hkY3MOg92OFgwK1ahbv+j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(136003)(39860400002)(376002)(396003)(366004)(31686004)(316002)(478600001)(2906002)(53546011)(16576012)(52116002)(6916009)(6486002)(7416002)(26005)(66574015)(83380400001)(956004)(2616005)(186003)(16526019)(31696002)(86362001)(8936002)(8676002)(5660300002)(54906003)(66946007)(4326008)(36756003)(66556008)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: CukqWp9b/euGxQ/91FjiDWHxM71rqQvogfROyns3YEYNoHw0mENeqG2addOolATPhamBhocnu7EW9qDKArDNGOZAGiqH1k0HBpQBjoQFqcM97qeEWldaZa/UBK/zP0DsoyYvrWB5cWtjfRyfPZzIvjkc1B8wuY436Zs16YZypeNuiUiEnUtZvSp6x0p0SasBM/3UR3rTv/T4TqPW2SA4DVWlXyfER6Yge+hAwSrj+R5OQ7HCs+fswYaalZyRnSCzG357IEsZswXLwPEhux9YcYPoij1eGJfaqbl4bfjUliPl7E5XXWsuY0TKgd8XTcAM6eQaMJCMXXbZKHC4QvgveHkbE/UelWvW13qQx9QSf3sNjdtbfYM6qlNfWA2uQCox6r4l0fqo3SYy5C6JQMpVwkMB1847740xAr+UFc2xOqRfwy6HOLzcmL3e8YcktfXZKbUC8YhKKLTVSPGMl4iqgu6hTMTTdVWdsbOQ0fcdXcI=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3048bad-85cd-496b-0a60-08d81687c1b4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 08:39:20.0472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+SoFnaClzlHRZieZspBlBxlSbXtyEG4lOFV5My4m3qugoG1aVP7qU6F3QZRYYVmLnIid2cTMoLwOiOczJm2DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4015
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.06.2020 04:56, Michał Leszczyński wrote:
> ----- 19 cze 2020 o 1:41, Michał Leszczyński michal.leszczynski@cert.pl napisał(a):
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -508,11 +508,25 @@ static void vmx_restore_host_msrs(void)
>>
>> static void vmx_save_guest_msrs(struct vcpu *v)
>> {
>> +    uint64_t rtit_ctl;
>> +
>>     /*
>>      * We cannot cache SHADOW_GS_BASE while the VCPU runs, as it can
>>      * be updated at any time via SWAPGS, which we cannot trap.
>>      */
>>     v->arch.hvm.vmx.shadow_gs = rdgsshadow();
>> +
>> +    if ( unlikely(v->arch.hvm.vmx.ipt_state &&
>> v->arch.hvm.vmx.ipt_state->active) )
>> +    {
>> +        smp_rmb();
>> +        rdmsrl(MSR_RTIT_CTL, rtit_ctl);
>> +
>> +        if ( rtit_ctl & RTIT_CTL_TRACEEN )
>> +            BUG();
>> +
>> +        rdmsrl(MSR_RTIT_STATUS, v->arch.hvm.vmx.ipt_state->status);
>> +        rdmsrl(MSR_RTIT_OUTPUT_MASK,
>> v->arch.hvm.vmx.ipt_state->output_mask.raw);
>> +    }
>> }
> 
> 
> It was suggested to move this piece of code from vm-entry/vm-exit handling to
> vmx_save_guest_msrs/vmx_restore_guest_msrs functions.
> 
> Please note that we do need to periodically read MSR_RTIT_OUTPUT_MASK in order
> to know how much data was written into the buffer by the processor. During tests,
> I've spotted that in some cases vCPUs get out of scope very rarely.
> 
> For instance: when IPT gets enabled, xc_vmtrace_ipt_get_offset() is returning zero
> value for the first few seconds, because it's relying on the value of
> v->arch.hvm.vmx.ipt_state->output_mask which we only read in vmx_save_guest_msrs()
> and in some cases this occurs very rarely.
> 
> Could you guys suggest some solution to the problem? If we would leave this value
> dirty in hardware, AFAIK we have no possibility to directly access it,
> but observing this particular value is very important in the runtime.

Much depends on what state the vCPU in question is in when you need
to "periodically read" the value. If it's paused, you may need to
invoke sync_vcpu_execstate(). If it's actively running you can't
get at the value anyway except when you're on the CPU that this vCPU
is running on (and then you can RDMSR it quite easily). Any
intermediate state between paused and running is prone to change
immediately after you've established it anyway, so you need to get
the vCPU into one of the two "stable" states in order to get at
the register.

Also (and I think I said so before) - please trim your replies.

Jan

