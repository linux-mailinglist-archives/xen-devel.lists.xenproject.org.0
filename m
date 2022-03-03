Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855264CBD42
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 13:00:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283248.482217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPk7x-0004hp-CN; Thu, 03 Mar 2022 12:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283248.482217; Thu, 03 Mar 2022 12:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPk7x-0004g0-92; Thu, 03 Mar 2022 12:00:13 +0000
Received: by outflank-mailman (input) for mailman id 283248;
 Thu, 03 Mar 2022 12:00:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPk7v-0004fl-Gr
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 12:00:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 798253d2-9ae9-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 13:00:10 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-R2oUpeIbMUG_ErM0WkBsWQ-1; Thu, 03 Mar 2022 13:00:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR0401MB2643.eurprd04.prod.outlook.com (2603:10a6:203:34::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Thu, 3 Mar
 2022 12:00:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 12:00:07 +0000
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
X-Inumbo-ID: 798253d2-9ae9-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646308809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RPCtJp6SsAfzXa1EA1nDQxtaENxARcwoIX5QSmtNeNw=;
	b=LWoYM7iprwqW7c4G0Anwwh9wg9bI2cMOhkndYVaX09klqepuPnBbCX3lPuPmZxc6Wdv42T
	z5S+yaW7Xc6gejQP32FTBeyZfUO+E75O/AhfIPdQiGmQrBvtZv6Tuj1649NxREEpxUxmB5
	Zl/09PWvlYHx7hX+YZR7+HW93o5kBWE=
X-MC-Unique: R2oUpeIbMUG_ErM0WkBsWQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoWUkZfdz00MVBQ+0bsUejQpLsOeZ5BWUMaWnibAU0wVSDXQq+uP4ODcd6pE8Kyoaicej6lRlEICy3U+kZ9EXkhg6Y2zuj8ZbWVS6Ltbokbczcmim+noKyuwUIRB0OxEDHemnzfplScGeu++eS57Ndtu/xB/avd92dD4d4ksY/1FtDHShvt0OM0Hu0OUN6kHfGNfES3q9FTxfTtFi0LmhaZ7G1L8u2yXpQiNZxJZxlDEBAfixE8pBnM3aBHVL5kYbZNN52iB89fMEhXT0MsBNm4XxokjXLtfT0SONJ9FhZpUJoUhfzAzoVZHtjuRPhPH8EvAXljJAvtzlxs2yvmmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPCtJp6SsAfzXa1EA1nDQxtaENxARcwoIX5QSmtNeNw=;
 b=MnljNddUwDbDqWaD0RT+ILYuelkB4yjrScs1PiDOx53yvryG+FfGOJV52E02P2fOlzs8yyC2DI5cZs5bdA6wMtwmWlz4mhuRdPyHbgM6on1HGeghsMeiS3xwTb7Gz6y6fVUGR5SCc5zBCME65FrROX6ws0FYUEqcFKjoYgtkn8aJn8hC+Szsyj9z8sKweoyF1wJMx2mYSX5Mixp2hzox46jyl21+y0aTLxKeCJ7mc/4cab2uUaBP+8ABR9v6PuFUeLDDOoJabdzCATOSLGxN+xwcOz+CjjZh0jj8PCX0shprHGaoVJx2UrQ8OBMie7zc9vTX+pX7iS6lXNOFZUfQEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ac6d953-df29-3941-c5a1-89464cd0f27e@suse.com>
Date: Thu, 3 Mar 2022 13:00:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220302150056.14381-1-jane.malalane@citrix.com>
 <20220302150056.14381-3-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220302150056.14381-3-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 503b4a64-fcd4-499b-f2e5-08d9fd0d5c18
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2643:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM5PR0401MB2643DC31207210DBEA6AC8D3B3049@AM5PR0401MB2643.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pruh0OreBhUBpKHZT+Z7/cd3M4FGfNaNFPtvTsqFw4KD7xCjgSvpFh79F1zK0wV5u0tP5JvBeS6TUlZ06re+PPCrCsTOof749B6LsesbapoJRfIrvfjHzItAsRVv2ddnjljGJKzuHG5VKLhBZDCEUY0dbQ1Dp19/p/oAGe6ArYDnpQX1hfFdXtd0+2kEZ1xUclby3gKjLtjt6DVDR6ktJBIPtVA1XjHelnd6rqNU1MseMU71ItyE2300lyP1gYINrNwqpaHwQVks4zCSY23W2CijC2/LnjVZeL6VQzC+MigbpEVkjC0HdJvjdi6infvNRT30N6Nb7bKuhX4IBev/xzzgmJDYgjE49Y3SblPi7TL1bF+80CIg1CjYIKGF/IsJzfOpMPDmTZ7oIgRDdpjPtp5aFTBWggHUaEp4wdE5uwXJ0VibHWP4UvF8vkqJycztE9Dj4y5f/7s6dLjh/VUCT/NJ942os2TUpuMc62GeCBYkjMN7MVJJEtHHka6WAObNANxVMgPbS+anZUKoKG31vN5KyKuUckB+3wrVBDiHJpDYuZ2Kf9N2i/vxqks6kkoyvTAHpUkorcmtZHuEmKjHszM0KjJPis90X/YBGEOcWDIGXmkEblcdZNuiLD3bLW5qGTnP+Ptp6GVjOk+mKJcRdCCHY01XrH0c/sKMl9PA3zoBLPfZ4Yso74yE/hzFaGuZT/dqvwrzMXsxpuFLY7T6BfcSymMI41NCrLKK7u8kh3Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(31686004)(5660300002)(2906002)(7416002)(36756003)(2616005)(54906003)(26005)(53546011)(186003)(6506007)(6512007)(8936002)(66556008)(66476007)(316002)(38100700002)(86362001)(31696002)(508600001)(6486002)(66946007)(8676002)(4326008)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVFzRWhLd05TMG1ENzJOZFZxejhkOWhQNm1LUjZua0lLQjZXbWVxd0x2bG80?=
 =?utf-8?B?UXNoK2cweTQrV09wYzZHMisybkh1SlZTSHJHc2ljcXpKKzh1b2UxMWJUb3Zi?=
 =?utf-8?B?QmFUSnVkUTVTNjU2V0xPeTl1U01URkNQUndPNlQwSXZ5ZDhCUklqQy9XdmRU?=
 =?utf-8?B?UHVtTmNrOW5ic3dGTlVWS2RNaVI0SVd6bFFiRHFKemJabHpJNWIrQmpPOEFl?=
 =?utf-8?B?TnlzSlBsV1V2cURqQVJXMUNESUhGVWw2UGhPci9wVjluN3NycWZIdVdqZnl2?=
 =?utf-8?B?R2VLekhxNzNMcTVYMG9zUWtvZWJwVFV5UTd3TjNzaytKNVl0Tm4xOW1VTmxz?=
 =?utf-8?B?bzNFZEtvYjVudjQ3UDNBWmp3OW9QZ2RwaFQ3Z29EK2FWZ2pzczg1L05yUDRi?=
 =?utf-8?B?WFBrYkxkcjBwM2I3OEtyZU9vaUpMbDdUVmFnM3hsd2FjUm8vZmtLWmtlWEVu?=
 =?utf-8?B?WDZ3NmpwdVh2RzBUNkJHMEZwQ2lieElrTElSWmliUmJRRUZ0THpMZmh2cFk2?=
 =?utf-8?B?c0tkK3dzTGpJTG5WVk9HeENMbUJ1QWliTk91Ui85R3VOZlhGOUpKVXZMVVJL?=
 =?utf-8?B?eFFMTXB5c0tiWk42b3BKT2s1OXlQQjlKQmp6aE9FZlRQUzFObE0zUlhNUmtw?=
 =?utf-8?B?TEVxNk5UL1lneUxoV3ZZY0UxOHZOSnJncWhpamhrZWMzWHJKS2JueXFwenlC?=
 =?utf-8?B?RlZXcndmdDJqZUdxMnRmYTIvMlJUYjNFcjFNdW1ESUVrNkVsTS96VmZVSGFj?=
 =?utf-8?B?TlNkQlZZZ1FZZS9vOEJXQVY3R1Bpa2NvSS9INGlxZ2JncGZzeDBHS1NBMHhx?=
 =?utf-8?B?TzhIeU9SdWw0SkEybTNqVFlRNTVEaUkvcWN0SU5XTkFCL1M5a0Q4dEdyemVM?=
 =?utf-8?B?ZTllL3JBbEpsOWQ3NFQ5LytXcjY2aTh3Sk94aTdNZG9LZ2ZuR3hFUW1tTWY1?=
 =?utf-8?B?WlpjSlpjMWtFcTJDMVRoZUU5UW9jaHFlbXI3YTdhVEpPZUllWXVGdkFzNzgy?=
 =?utf-8?B?ZXJSSGxnOVFyUkRQdFk2VlRiY09XS0ZVVysybkhRWjFabnI1SVV4RzZXam5D?=
 =?utf-8?B?bytVUlA5ams3am9VUElkY3g3bUlDVzkvQlRQZ0lhR3hjSTNPZVloU1Z5ZXh0?=
 =?utf-8?B?VHBIQk0rdVNoQ3FsckFRVmovYjNSNUlrZVA4VVVpelA1MnlpZVpHemw3bldz?=
 =?utf-8?B?UXBxODdiekZOQW5GUEFDYnd6WDdEZjEwNmhMcExnYVZONml0UXYrRWJML2dj?=
 =?utf-8?B?MmhjNGxWS0d0SDZHY21yR0Uxak1mQU9jYjJJWXN3eENDR0hwZEZwYVRCcjFh?=
 =?utf-8?B?SFdXZ1N1SUF4UFFjRzZEUWt4a013S3lqK0ZjU1ZVNi9nejVuZlpPTE45cHg0?=
 =?utf-8?B?eTU3YXhRYVNSNEVYSVZ6MkNJWExrZTM0QjBjZm9SalNZMGIrSC8xK3pWSG0w?=
 =?utf-8?B?UjNZWHVLNklTRWpoOVFQT3Bwb1FPU3ZkNUprSXI2OTJkTzZzSUNZU0pXWExF?=
 =?utf-8?B?SmtFSzJQU0kyZ2hwMDhrMXlwekhkNEx6TEtEYTBUSm05VWU3ek9uSS9KSHpy?=
 =?utf-8?B?aGJhYjZtVWFYODlrWDZrdGV6QmdEN0VWVGZUTjVlZHhIOERRTDY0ZzJ5RmNh?=
 =?utf-8?B?KzBBTE1DbUVZWVh1V2J3UVhXUFJQRWViMDZQYk9KOTlpYlBaUkJRMkF3d2k1?=
 =?utf-8?B?dWpFR1hpTG8wQWVINXo2enB0UGRaVEVGbkNTOStycHZKdU1IUDN3a0tjTzRF?=
 =?utf-8?B?Mk5NdWdwcVNDaVNzUDRxZ0hJUkNhL0dZbzhVRGVWdlhsZkd5REQ2YklTUEds?=
 =?utf-8?B?MVlzdmlVZ3orT2pMZ2JvRHIraDRLZ1hIK3pQYzJmbkhqSkNLK3J5UmFzSTY3?=
 =?utf-8?B?YXFoRm5UOWwyRDJXamNVeWFUWXFQL1BuUE0xT3pSbi9ZOVN3aElDd0tJTkxo?=
 =?utf-8?B?ckNILzJVYk9CWS9wU1hGZXBhTmxlZ0xscGFQdWM2WmM5WnNzSlBpV09ram1x?=
 =?utf-8?B?dTlEZnV1VWtYOTNaTjdRSGJac0hHSitsaU8rZ3REZnpCdkxQU2s2LzZSUVhP?=
 =?utf-8?B?cUZOeFhNVVFROFNBcGY4ZjF6ZWxaT1MxOHhsa2d2TnMyZ3pvb0dUNllZVlBy?=
 =?utf-8?B?TTZHUUE4QWVnZE5aaGRVb015RG9wNzkyNmFNQnZsUnEzQTBRR0hUZHRFOHM1?=
 =?utf-8?Q?jBIPdt/XVgXeQ5KRWj+RtPc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 503b4a64-fcd4-499b-f2e5-08d9fd0d5c18
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 12:00:07.2270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4A3n4tScMN0K1RERxRBygpL/ULtw5adHiCkvK0L8nIs3AJ8UhUW259Tklt2kuqrRfvA4VorUlREbEkDqReELWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2643

On 02.03.2022 16:00, Jane Malalane wrote:
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3344,16 +3344,11 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
>  
>  void vmx_vlapic_msr_changed(struct vcpu *v)
>  {
> -    int virtualize_x2apic_mode;
>      struct vlapic *vlapic = vcpu_vlapic(v);
>      unsigned int msr;
>  
> -    virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
> -                                cpu_has_vmx_virtual_intr_delivery) &&
> -                               cpu_has_vmx_virtualize_x2apic_mode );
> -
> -    if ( !cpu_has_vmx_virtualize_apic_accesses &&
> -         !virtualize_x2apic_mode )
> +    if ( !has_assisted_xapic(v->domain) &&
> +         !has_assisted_x2apic(v->domain) )
>          return;

This is not an equivalent replacement: The earlier condition was not the
AND of all three sub-features. This is the reason for ...

> @@ -3363,28 +3358,24 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
>      if ( !vlapic_hw_disabled(vlapic) &&
>           (vlapic_base_address(vlapic) == APIC_DEFAULT_PHYS_BASE) )
>      {
> -        if ( virtualize_x2apic_mode && vlapic_x2apic_mode(vlapic) )
> +        if ( has_assisted_x2apic(v->domain) && vlapic_x2apic_mode(vlapic) )
>          {
>              v->arch.hvm.vmx.secondary_exec_control |=
>                  SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE;
> -            if ( cpu_has_vmx_apic_reg_virt )
> -            {
> -                for ( msr = MSR_X2APIC_FIRST;
> -                      msr <= MSR_X2APIC_FIRST + 0xff; msr++ )
> -                    vmx_clear_msr_intercept(v, msr, VMX_MSR_R);
>  
> -                vmx_set_msr_intercept(v, MSR_X2APIC_PPR, VMX_MSR_R);
> -                vmx_set_msr_intercept(v, MSR_X2APIC_TMICT, VMX_MSR_R);
> -                vmx_set_msr_intercept(v, MSR_X2APIC_TMCCT, VMX_MSR_R);
> -            }
> -            if ( cpu_has_vmx_virtual_intr_delivery )
> -            {
> -                vmx_clear_msr_intercept(v, MSR_X2APIC_TPR, VMX_MSR_W);
> -                vmx_clear_msr_intercept(v, MSR_X2APIC_EOI, VMX_MSR_W);
> -                vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, VMX_MSR_W);
> -            }
> +            for ( msr = MSR_X2APIC_FIRST;
> +                  msr <= MSR_X2APIC_FIRST + 0xff; msr++ )
> +                vmx_clear_msr_intercept(v, msr, VMX_MSR_R);
> +
> +            vmx_set_msr_intercept(v, MSR_X2APIC_PPR, VMX_MSR_R);
> +            vmx_set_msr_intercept(v, MSR_X2APIC_TMICT, VMX_MSR_R);
> +            vmx_set_msr_intercept(v, MSR_X2APIC_TMCCT, VMX_MSR_R);
> +
> +            vmx_clear_msr_intercept(v, MSR_X2APIC_TPR, VMX_MSR_W);
> +            vmx_clear_msr_intercept(v, MSR_X2APIC_EOI, VMX_MSR_W);
> +            vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, VMX_MSR_W);
>          }

... you wanting to make these adjustments, but at the same time it means
with certain feature combinations we would now intercept all x2APIC MSR
accesses when some don't need intercepting, which may slow things down
for guests.

Just to be clear - the main part of the discussion imo continues to be
needed on patch 1, to sort what dependencies on features we want where.
One that's clear, what's wanted here should be mostly straightforward.

Jan


