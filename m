Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DCA509EC8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 13:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310070.526698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhV8z-00024z-1u; Thu, 21 Apr 2022 11:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310070.526698; Thu, 21 Apr 2022 11:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhV8y-000238-UM; Thu, 21 Apr 2022 11:38:40 +0000
Received: by outflank-mailman (input) for mailman id 310070;
 Thu, 21 Apr 2022 11:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhV8x-000232-BF
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 11:38:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95d09612-c167-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 13:38:38 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-DlZo_wojMYaBVkoGLZc97A-1; Thu, 21 Apr 2022 13:38:34 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB2924.eurprd04.prod.outlook.com (2603:10a6:3:d4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 11:38:31 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 11:38:31 +0000
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
X-Inumbo-ID: 95d09612-c167-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650541118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jr6ZU9kFlnV3p/SkrDxixPwzoRQ4FltgIQce8A5gICY=;
	b=ipmnTc1Bl0dzOAra4XYPJwMoY9eerwlc5gK9dA0xZOn82sq8JjfQOOkEKQvWT3mywbxsjr
	dZRfN+UBFgVRxslIgSxxj7C6Jyu+6l6yE1ftKAgcsuylkh88LLIiTfqbCeZ3lvkYRM8KUU
	nEEN+qC5mjKHNRkkEqiE/K/IA5tnXOk=
X-MC-Unique: DlZo_wojMYaBVkoGLZc97A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VC/1Ddv9YcmgjUA9tB8nxQvm43GMiEPYIsODQxsMzV8UiiAYSiVnSJISWkixLrENaWPDk5Vd3hYgIw0CPrmEAKOuYl+Xi3CEMeHqEB6SBHIhOokC/mNeCj+j4lnG3pRzXKufkSxNy7AYP+qqmiNOSutuLMyHaPIm+7jm1YHGlZSl398PfLSlj+Q2Gkzvz07fGjJvfEdZ6txWaUzwLo9ArzjZUc5If+7Hh+0PvF+hjSu3uc5waOvYK51iLX8lN5RxIXU8k/i+W56XCBMcDNnfJTFQMyghirfrVP1gNXPRmUZnYaCtaWdPAvWpjanQYicPlmopl/aiiEZDf2QWhDzNCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jr6ZU9kFlnV3p/SkrDxixPwzoRQ4FltgIQce8A5gICY=;
 b=Hcseiq7l6wWpsuAN5GOhSFvhwaIo5MOa/+baHpJbDi93FRhF0fEluLlZchDfj1aCW4MaS24GaCN6i8QNJa4zCLqm7BDrwiKxgb7hAWtd43YpSXdbhG1Vc9gKH1Hn8PXhsifrjGVsL/9pSKeLcMTFnkCe/jhGapqzjIEMB9D50yP+g1AeZ6tyrRW2GnCH5TFMNZDqUdlrEIlHjMQCmCVgKzjy2VkSQBjGDNG6wrPD9ijjVu7NQxS5EETdvFcbdT0dFLt+fgvhaF4r//Vw/JzoMuxNCrX1LUfx7Af9Dn911KippHHvYYK972Bb8Dv/xaWtuu+yZSRVCRrPPxh+rg4zEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <34c410b1-969d-8b18-6b46-fbec72effc95@suse.com>
Date: Thu, 21 Apr 2022 13:38:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] page_alloc: assert IRQs are enabled in heap alloc/free
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220421104305.878204-1-dvrabel@cantab.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220421104305.878204-1-dvrabel@cantab.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0163.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::24) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ab87787-fe8a-4f31-97fe-08da238b7610
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2924:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB2924530073E0CF7CD2943C96B3F49@HE1PR0402MB2924.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2k2uQv082sKI3c/uDy949xk8+hHR5KVweDQy4ixM8ITwXedfCUGz31YZomoHVovj5a+uu8HB3ueDZ8kb5T+QWw5GyGVKWoBtpBVXwc0h8uc8E/y3/jZFZLarBfE9LEGOagQv2tLPIH2PcrlSUn/XXKPE6ZouHKNL6oFWU5Z6BJYyk95gOGJlXW1GLfghbODu1c/3zCz/xwd3FijC52TvVYOage2wBZrJvTIItvh/9tWt7izSC6xwgowfekH6d0zfrfkR8k9WxUk74+PnV5Q7JLYjKG52jiHjJkQIS8RJyoeLsAvIAIB99aLYuKLjaUYQzFzMUtWRnkULuOMy1wICv8OvtWi/hJ5Lj9RI01H+ksRazwZWeKkEJ1902u749dJC5muuf6eRGL9c41E0mLw0/cIyPNk/MMdrc4dQCSFOqQy8b+ydsGH2i0Ijj3Dq/IDf5weS6WMY7sGklZD9eUH0u5Wo70UCpyEQr3c2S659BngtDSwbHV3fDogAZ5VDeLnOEwaPHxtlDF5dNDuaqiAhJQkmLdBsHvzKAoabfZBP3gxPD4ELxSRxQ1zQnpKhmTl6KwmmTjsxOwI4RU5NUMMJ8vq81Y+d5VbSMgvTaCL2q0qJxOfVU3BXuOaa1MzkMYQcpklYjHhWhpqOSYHQpzEuEPubqB8n2B/zEDOLbBk8oIDVFJbG8N4/HHz1IO03jmtmbsmD3YrcDB7XZMz1QpfKqMrNhZ25Xlezq1te5FD23lJ6sDXCmMX/mwQztyCRmNIC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(508600001)(2906002)(5660300002)(6486002)(6512007)(186003)(26005)(6506007)(53546011)(38100700002)(31696002)(86362001)(83380400001)(31686004)(8936002)(54906003)(316002)(6916009)(4326008)(66476007)(66556008)(8676002)(66946007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVNVWGVVanVpNStzTVdONytkRFpzdFdTNmMzeWUrWmNPQ0R6VndCQmpaOFQ1?=
 =?utf-8?B?NEVER3ZnZ1N1c2dLQmYvdmgxQjVKUUZFRWpabjQxSlhJVE42MkRuS3Fmbnkz?=
 =?utf-8?B?Y0poaXNOWWhrSUkwMkFzNk5OV0NwbTI3Qm8xRE1ENWZYaThsL05VZEllaGNx?=
 =?utf-8?B?b0ZFZC8yQ2o5b0hhUFlUT25vZndta3Z5VS9VU3kzSzRJSVRVdUVweThtZ0lr?=
 =?utf-8?B?eXRhcHBDdm1rWWcySW5LWEt0TXdueC9jVVFmUkZRTi9EUXJUaC8wUzJLcjZK?=
 =?utf-8?B?dEZZVjF1TFBkTjZCdXEwWFRGTFF3dGRQeFRVNUpmM280ZlNlYmxYdUZxdWI4?=
 =?utf-8?B?Um9qN3ByQ3FEa1ExeEt5YStkSjNjSVFMcVkwMU4yRUpoMUVRNjhKOFA4THA1?=
 =?utf-8?B?bitqdG1JTFhMQUQzWGJUendYZ3E0U0V6R2gwNStHWTduelpTYnZiWXd6VUZ0?=
 =?utf-8?B?OWJvQm8vb1U5ZGpYbE0ydU5PdEhpN3YwTWlWbmVLeFk5Rm81Ty9sWjJ2M3Fz?=
 =?utf-8?B?UjRRMHpqbThWdWlVWE8vdFdyQkpwYS9STXlvN0JiYjVnTVM3elBBN1FtRWxy?=
 =?utf-8?B?QmJscWI0YlpycXlWT2k2N1ZGeDJRcjBHMmFxUHBFUUduTFBhVjQvSGExYlkw?=
 =?utf-8?B?akhHUGcyaHFxKzc2Ym1kK21QYlhhbS9QUi8xQnNXRHd5TXdxWUpmV3lUcmdJ?=
 =?utf-8?B?eHJoWm1Da2FXcWVuOGw0VzB5eWZiblVVOTkyV0E4WWhXVDE0UDVtaVMrdXpI?=
 =?utf-8?B?eURoVFlTNmNtazlMSTY4b1huSWZPTDJVRzNWR2JtcGR2Z0FaY292ODd2NG1P?=
 =?utf-8?B?YzhIM0NWK0JwL2RRY0ZGN0lkZEdScGk4QkVUb0VDQTlVVkxYY3F0WTdmOWZi?=
 =?utf-8?B?MmcreTNwdlZQSlRoTEx5V3R4Q0pCeXd6bzcwaEVHM044dVRTRE1UTm51ZnhV?=
 =?utf-8?B?MW1DME1nVVAvb1VLdW9TWi8vQXd3U2pROHpXcU9Eb3dFYjZzdWdVU2g1RG5F?=
 =?utf-8?B?dlVaV0ZWNm1Ic3VRWENtWDBIcTJzNVh3SEE1VE5abEk1YmRYZDhxZkxrd2pB?=
 =?utf-8?B?cHBMQWY3dUZXRXZ2ZUZnYjU3MExaVTVEU1J2THhhZWs2d2dwaWFlbDFUdkJW?=
 =?utf-8?B?RkE0bzNPdTZIN0FHYlc3ZWVVMUoyOWwyOHIvSkx3STdOZWR0NS81OGpPTFV5?=
 =?utf-8?B?NmlNVGRBWVIvb01xNi81QjE2WVNBenJsNW4yU1U2SkxKS0Q1TG9WaVdENnhF?=
 =?utf-8?B?VzBWUUwxc2taOEFPWjNwSUEveEtGQnQzMkNTd1A4RVRjUVhjeDR0QkNRblkr?=
 =?utf-8?B?NjhMeTRNc0tiQ25vVnhDK0d1VXdOZE95Z01rZDRkbGwreHVsT0doMFdMaWYr?=
 =?utf-8?B?dkgwb2NYMnBkV25ZVmpETHgzQUxCdzJteS9PdE1hZC95TWlmSjBGMDI4eHZ1?=
 =?utf-8?B?SGtYM2VqWFFKb1dxWThCclpyZE5hcnp6V2VMRmpBbUpTeTNtVUZCNG1wRWc0?=
 =?utf-8?B?ODlWRjhHSG0rN3dTS2YraDJnbS82NG5NR29qZjFOQjhLUlNDcVp2NmxNOGph?=
 =?utf-8?B?aVhLdUQ0ZUwyUm95Ty83eHZqK3Y3c2NHTzkrdi91NWdVY0REZWpqWkFOZjNr?=
 =?utf-8?B?TXdzVTV3SUgvM1NsYzBPRDlTQm5wQ1JibDNrcHBVZlZ0eGk1UVdZd1UrdTBh?=
 =?utf-8?B?RUNGQkF4dG9FMkJBTUJHMktibnU0VE9WcGduaFVNUUxXUzRaQ0ljTXdQenEz?=
 =?utf-8?B?T08vRmJNMVYyM1Zsb1c3bXFQU285NHdZMHlraElScTdJYUNzQzNYRUxTWW9G?=
 =?utf-8?B?c0JaN2V1b05ha3RBVHJJRkhHRndJT1RteksyQWZnR3kxcm9FQ0g1STIrNU82?=
 =?utf-8?B?MFZ0MkVKMVNScFV1elJSa1lYT0NkNWF4ai9xMEdUQ1pIUWtqdDZ4WU8xNXlB?=
 =?utf-8?B?OUdHaUVhdHNSMmhoa1Z2Z0xzWnMydGVuT014L1paQWtDcW1YOWtnUjVZTWcy?=
 =?utf-8?B?WFd5RVhYTmlZS3dkSzUwL3ZJQVJMYytPM1djVVB1WFZVeFFsT2kybWNKREVw?=
 =?utf-8?B?OTBqQVl3aWQ2dUs3UUtmMnREUUVUOVFCWkJSTEJCS2VDVDIyWW96N2c0N0s3?=
 =?utf-8?B?dlJiai8wN0xIQS95RVdFeUlFNG5tM1ZSUXB6Mk52SVBjUmFYRXZTaXVBMWJu?=
 =?utf-8?B?ZmVsOEFZQzVoY0dPUUJmZ29IcU5TQm5HTmZJV0h6K2c5ZkF0eTYwS2JIK2hS?=
 =?utf-8?B?dnV5aWdaSyszRGxJdFo1TWcvSEtNUi9LQTNremlIbE9aZEQ0VDU3a3FxTy81?=
 =?utf-8?B?WE91SkNVSGpmUFkxRDVpVDBCTHpneG9Gc2MxakFjSWFVMzYzK2RtUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab87787-fe8a-4f31-97fe-08da238b7610
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 11:38:31.5977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5I7P8x8CJKccWVpczu+ixg496h6H5NrEnJzdVtu5G5rBK6Txt/LQeYrARAs1+aFfvLmDcDXFBXU+TRe5pxlvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2924

On 21.04.2022 12:43, David Vrabel wrote:
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -984,6 +984,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>  
>      console_init_postirq();
>  
> +    system_state = SYS_STATE_smp_boot
> +
>      do_presmp_initcalls();
>  
>      for_each_present_cpu ( i )

I'm afraid it's not this simple: There are two
"ASSERT(system_state != SYS_STATE_boot)" in Arm-specific code. While
both could in principle be left as is, I think both want modifying to
">= SYS_STATE_active", such that they would also trigger when in this
newly set state (in case registration of the notifiers was altered).

It also wants at least mentioning that setting this state is okay with
all uses of system_state in common code (where it's not impossible
that x86-isms still exist, having gone unnoticed so far), just to
indicate that all of these were actually inspected (there's just one
where it looks to be unobvious when simply looking at grep output, the
one in keyhandler.c). As a result this may want to be a separate,
prereq patch. At which point it will want considering whether to put
the setting of the state _in_ do_presmp_initcalls() instead of ahead
of its invocation.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -162,6 +162,14 @@
>  static char __initdata opt_badpage[100] = "";
>  string_param("badpage", opt_badpage);
>  
> +/*
> + * Heap allocations may need TLB flushes which require IRQs to be
> + * enabled (except during early boot when only 1 PCPU is online).
> + */
> +#define ASSERT_ALLOC_CONTEXT()                                          \
> +    ASSERT(!in_irq() && (local_irq_is_enabled()                         \
> +                         || system_state < SYS_STATE_smp_boot))

Upon further consideration: In principle IRQs would be okay to be off
whenever we're in UP mode (and hence flush IPIs don't need sending).
Provided of course spin debug is off as well and no other IRQs-on
checks get in the way (like that in flush_area_mask()). This might be
more robust overall than depending on system_state, but I'm not going
to exclude there may also be arguments against doing so.

In any event, looking back at my v1 comment, it would have been nice
if the spinlock related aspect was at least also mentioned here, even
if - as you did say in reply - the uses of the new macro aren't fully
redundant with check_lock().

Also, nit: The || belongs on the earlier line as per our coding style.

Jan


