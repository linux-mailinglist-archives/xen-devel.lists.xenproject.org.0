Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FD74664E6
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 15:07:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236591.410434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmjm-0007sZ-Di; Thu, 02 Dec 2021 14:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236591.410434; Thu, 02 Dec 2021 14:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmjm-0007me-8r; Thu, 02 Dec 2021 14:07:02 +0000
Received: by outflank-mailman (input) for mailman id 236591;
 Thu, 02 Dec 2021 14:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msmjk-0007ka-SN
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 14:07:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d76894f-5379-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 15:06:59 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-5PeQi1vRO62b713-GbafiQ-1; Thu, 02 Dec 2021 15:06:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 14:06:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 14:06:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.9 via Frontend Transport; Thu, 2 Dec 2021 14:06:55 +0000
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
X-Inumbo-ID: 1d76894f-5379-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638454019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nGnkOGvYO08FfNFCjHhmmEEdazHHlQ1MTnjO4bmB+wk=;
	b=TNzLXLKAmK6zeQJDK9a0DBWprs9wQ1zHsOjxYUOwfEt7go/wRFO6/Groshy1UUOiyz9aUF
	0sNVIChqvS/yJoIbyrcq8uXzVzn+zRjDc8UvfhhnQrlyy3L3O4+PCEYY83Uxo5hDItBVr+
	W/hBVSi94kufKfX5tW0EvA3IaDvkOm0=
X-MC-Unique: 5PeQi1vRO62b713-GbafiQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeUGkpKM2MnR6a4CorqIBPHM0TuPrAKyJzO1VtYZdxOa6bQOWqx+B/Zn8SN5zl/r2lSjyZiqAUZ6NutfSZX2gL3CR6+zdxe9fqCqel0ozw43P1OrwU2yeKViUQZB3eOhXSBnFDanS3lAdnfcUhJn85l7uxML42syuhm6UZptqXgLuP6VFJhg0RbDm/o5G0IqBgFwlSp4sAKlm3Pr+2EVe4hRP1EVlhH6xw/b3Sw7SSvBuJ4sXN/mweZo0GjCDm3yPczHgxSpsSQmtN7A0jR0B2cs29KPDvuQP8VVZS6kDGB+4w4oT+77ogGtqpT2c5M8HSRzyC8DOyQmrCby10FI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGnkOGvYO08FfNFCjHhmmEEdazHHlQ1MTnjO4bmB+wk=;
 b=VdhI8Zsf+FcS7+sASLmu0bfMZEnn0fDK39d7YmCzCmtlYRj3clnW6JOaEV4WigVhGlIOb+dlLZT+UhQLmnHcG2d+yjRWJbcH9zPoloxR/YxtzsBgF1BVThvNChm5FyopBzhedEGX01KkQpSF5lzIEtdchXQjj8Jv7/u2WZZGYr7D2ZMsMH4bilf5DpOZchlljhWRzgcIpSzGKIabvKZBYJzFK3M9ZfNrdQJGw1KETEyKL3nnXrDrd8GCPER052YXSDnao11ScbYLzYS7pK7a76yyRPcNYEur8N2SBKIb0BMmhMqr+H93X+9YfzRIPOYzQXtFeWVi7gpY3ycAan/k/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2bffd73c-ce1b-40cf-73b7-f988e69c4f07@suse.com>
Date: Thu, 2 Dec 2021 15:06:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN PATCH v8 04/47] build: set XEN_BUILD_EFI earlier
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-5-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-5-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2469220d-5424-4530-1449-08d9b59cffc0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48486F55030B9D478A727712B3699@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	If4MB/SGGkUltHEJQAhWR/EedRQ/+sFhPOAHJIU5cgJqMHkNyaJdCrMlQxGa63VA06B6xo/lq5kAvDh0JEsOB6xnckk3eUGXQPDmtTgkMxekX8ZTN8gd5UBzHXdLSyfjzaVpTSq6fFrrM/lkSt+9lKQbMJRzlonQAskqDXPoRiESWpDfUnavHWRCzsodZfmoMTb8WnhIB05Udlm7dk0gUZsrb+HbY5LDOceoqGMcC9zSowH0HixBaoezN/Cgw9WRA9eKkKhmxvaDGMMpGakobSUTe+1pLBTkllHJtyTH29DSxdTltihgkvXZPTmx7c7TxnJg3ZRDBxbXQPe7aeJPsUob6kwVV15uzKN+CQTL29AZOcb66o2wy5oK45hivQDn9ktEgca4MT3INMZBlj/VFqxcYTMQliPTMEAUoN5XbjWG1L0BCbIPlZFN4D42EumP+g7GsUqE9kVnvDviQdk/342yIE1N/QD0BeoAUejfSysYf3KCsbUar1syWB24ZMi9X464829wH5UVic3gTgAaxgJFygDTg4HFAeHq+YN7GlWIh1LadpKIoiqgtB8mqV0mjOD5GI17fhyBriABlQcxq+BycSznjlICj//3gh2CoSVgzYgwnP6TE0dqw8NAV6Fq2ks8BkjE26aHKljVRjsdRKkulXaT2hXP2+dCSK07812YDgpg8zsmaNrAeHhM+sKIcDsTbkhJls6J6G91LH4L/FZokkMYy9nLpaMpMCG7pvHKQx3+kHexWTarUV7ks6DU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(956004)(16576012)(31686004)(54906003)(6486002)(316002)(2616005)(86362001)(8676002)(508600001)(4326008)(83380400001)(66476007)(6916009)(186003)(38100700002)(53546011)(2906002)(26005)(5660300002)(8936002)(31696002)(36756003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXJLcGx0RVZQU21XcE42ZXRXZUhhV1Nwd0JOcHdLTWRYb25Ib295Zk55bmNw?=
 =?utf-8?B?bTd5YkhpY1YzeVhKUVgwTFVlWjNPZmZQVWxQNEFQa1hPSjh3N1ozcHRFWWdq?=
 =?utf-8?B?WTdyN0dQNzZFODRmbGk1RGppTkI4L1pQVWNwWGRuRDl4TjBSTzVGSmpVNmJ0?=
 =?utf-8?B?S21lb3FWaUh1Rld5YldpOWRHc3ZYa0I4d1JPRk14bW15UHJVa0hZWDdGVW5q?=
 =?utf-8?B?ZXBlaHpqT3dPZVk4ZjBJMHNQRzVZWnl2TnZmZmVidTVKbGhoWHlXVm1sUVpx?=
 =?utf-8?B?UTBFQ3hvZk9sWTE1dVdEN2lBd0sybGhWZ3REWmVQbkhxWVlNR0Y4amszL0JZ?=
 =?utf-8?B?YnVpTHlteHNZK1VyeC83aTRheGFmS3FqWTViYXc1RzJxSmtpaURjaTQybWpL?=
 =?utf-8?B?RTM0cGtLY0laSDByY0QzbStrSHllVGs5M3RnMzhFRWhLRjlhYVNqY0lJUGlh?=
 =?utf-8?B?bXBPdUo0b1JzRG9PSVBhN3loNWNjM2FzaWNiVytYWWo5dmNINzhMaUhqWlRj?=
 =?utf-8?B?OW5ZUExFRXQ0d3BvaXlpVUF3Ym95MDhURFp2dWNxNlQ4NWJsM28vd0dyaTBT?=
 =?utf-8?B?TWtXVlNmQzVIVCtGRG1wVmZXOG9BdFA2bnlqMWdYY2RoVW5NZ1JsN1hFVGZ2?=
 =?utf-8?B?TGhFaTFBUkRNQURhSGg1YnhVdkUrMGdOM2E1SGV0YUhlMDZtRHArZjBrWk4z?=
 =?utf-8?B?TDR1QVI3LzhiUjNvQVlYMzJZZjY0QXJWeUlVTGloZnMyR0RDc2V3NjFXT2Fh?=
 =?utf-8?B?NFVuZGZ4dUN2UW8ySGRKaWF1OWFISXBXNlAxYXpjT05DMGd2VWZFcThJVTRE?=
 =?utf-8?B?YitjL3VEcWlrOXl0a0hpS3hFY3Y3bmxicEZpMkozRW1CclNJcHpVWnJqc3dW?=
 =?utf-8?B?M29WSGJHK0FhTjBOT1AxeGtwN2R6bCtDZkRpOENRb0RtWUtZNXZKYkFLZE9n?=
 =?utf-8?B?Q0p1Ym80VFlyTmwvQVJFS05GY1NNODgwWW83bVRhdStwZnVyYVNINEJWQzUr?=
 =?utf-8?B?NU8wOEVVVExuMlMyNVdrcTRsZnh0My91YTFhdlp0MWF6REFLZFBJNi9BZTd6?=
 =?utf-8?B?ZlVoc2xDOWxpaFRzS1B6bVBDOEdhU1FNbU1yWUtXQ3BkSEVSQnlyejhhMjhL?=
 =?utf-8?B?MHVuWkhCeUhIR2ppR3o2NzBCZ0I1Y01iUVdIWDRKRTVJbnoydk5VaXYxdHZH?=
 =?utf-8?B?Z2ZUeUxMRXlsay9qZ0xmUXlZb0ZSZENXUDFYdVJoMTVlRHkwdTEvOGNnNnlG?=
 =?utf-8?B?QW1BR2RONVZVNDNZVFZhT0hCSW5SQ2E2QVdnVXZkc3NQYWpaeExJeXVlWnVG?=
 =?utf-8?B?cGpMemkzV2YvMkxLc3EyQVJERTVzSGFaYWltYks1RGhHQkg5SVZtZlU1bmZ4?=
 =?utf-8?B?MGl2VmFCV2cxeGNPMjB3WWtPNGZQSE5qS3BMTlJYenpJRkpSNG1KRzRJZnE0?=
 =?utf-8?B?ZjliQ2xNMzFqbmlMZy9HZktoSGIvUkQ4S1RwWC9FbnJhRzlMVUFnQUE4N25G?=
 =?utf-8?B?ajM1TkF6WWJrWE5iZmlGYzJLRHBFZGVvOUl3YTk4NDl5M1NjSW5RcktQa3ls?=
 =?utf-8?B?ejNxc3gzUHR1L2c4MUd0ZEx4eWo4SmM2dE1ZcE1RVFZDVzdOWGJQQ2tyVEov?=
 =?utf-8?B?OTRiRjJqc3BDNEsrc0ZQdnkzUHU1WUJCMVF4WE1lbW1LeXNramNRY0Ftdi9Z?=
 =?utf-8?B?ZjZtVG5Ib0t5Z0dYNTcydCtjenp3NmtidzBIeGc4VGNVL21QT1M2VTlBZU9w?=
 =?utf-8?B?TnF4NXYzdWVPNUhpZm95VDd5OE5ZL1lyNmdMQmVNYW80MW1wcEJnTm5NVVd4?=
 =?utf-8?B?MGwvbTRXVlNqb3hlejZoYmJOMGlnTFI0di96OWhiNEVoNW5aODhLOUtBVXEw?=
 =?utf-8?B?YUl1OFZZOFFSdFhlbWVVZGJxdlh5dGJ5LytlL2NMMUZkUllWSXgyeE1PUXFm?=
 =?utf-8?B?bDY4MWM3WGxwaEVqTzBuM2duR3BYSEsrSVJncFJBUlExb1pxOWN3MkJmV1Nz?=
 =?utf-8?B?Znd3bXdTWWkrN0JMbWg0OTRzL05PMytYY0lEQXVCQVlhNWZES0JxdC9pNllT?=
 =?utf-8?B?VGllbm5TSGtIWnNQTHpVT2xqK251YzR3OVI1SCtnaWs1c3EvaEx2cGxKTlhm?=
 =?utf-8?B?RDVaZDJGSHIzRGVIN1lOZGo0MlBZamFLV1RIQ2dIa0ZpQ3I4WjZoVUoxREt4?=
 =?utf-8?Q?V5WfHc0ucOSZPGrEhbtOpDg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2469220d-5424-4530-1449-08d9b59cffc0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 14:06:56.1308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7174HsgIDXD5EJ5iluFafXrpxPzmFPPYRbRyYx25anl3QsEuCoglpdtdMSA0b4Ow/fuiAMUpdI9yjLI2kSbiTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 25.11.2021 14:39, Anthony PERARD wrote:
> We are going to need the variable XEN_BUILD_EFI earlier.
> 
> But a side effect of calculating the value of $(XEN_BUILD_EFI) is to
> also to generate "efi/check.o" which is used for further checks.
> Thus the whole chain that check for EFI support is moved to
> "arch.mk".
> 
> Some other changes are made to avoid too much duplication:
>     - $(efi-check-o): Used to avoid repeating "efi/check.*". We don't
>       set it to the path to the source as it would be wrong as soon
>       as we support out-of-tree build.
>     - $(LD_PE_check_cmd): As it is called twice, with an updated
>       $(EFI_LDFLAGS).
> 
> $(nr-fixups) is renamed to $(efi-nr-fixups) as the former might be
> a bit too generic.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Technically
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nevertheless a suggestion and a remark:

> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -60,5 +60,47 @@ ifeq ($(CONFIG_UBSAN),y)
>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
>  endif
>  
> +ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> +
> +efi-check-o := arch/x86/efi/check.o

How about making this

efi-check := arch/x86/efi/check

That way you wouldn't need to replace the extension in a number of places,
but simply append the respective one in every place using this.

> +# Check if the compiler supports the MS ABI.
> +XEN_BUILD_EFI := $(call if-success,$(CC) $(CFLAGS) -c $(efi-check-o:.o=.c) -o $(efi-check-o),y)
> +
> +# Check if the linker supports PE.
> +EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10
> +LD_PE_check_cmd = $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o $(efi-check-o:.o=.efi) $(efi-check-o))
> +XEN_BUILD_PE := $(LD_PE_check_cmd)
> +
> +# If the above failed, it may be merely because of the linker not dealing well
> +# with debug info. Try again with stripping it.
> +ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
> +EFI_LDFLAGS += --strip-debug
> +XEN_BUILD_PE := $(LD_PE_check_cmd)
> +endif
> +
> +ifeq ($(XEN_BUILD_PE),y)
> +
> +# Check if the linker produces fixups in PE by default
> +efi-nr-fixups := $(shell $(OBJDUMP) -p $(efi-check-o:.o=.efi) | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
> +
> +ifeq ($(efi-nr-fixups),2)
> +MKRELOC := :
> +else
> +MKRELOC := efi/mkreloc
> +# If the linker produced fixups but not precisely two of them, we need to
> +# disable it doing so.  But if it didn't produce any fixups, it also wouldn't
> +# recognize the option.
> +ifneq ($(efi-nr-fixups),0)
> +EFI_LDFLAGS += --disable-reloc-section
> +endif
> +endif
> +
> +endif # $(XEN_BUILD_PE)
> +
> +export XEN_BUILD_EFI XEN_BUILD_PE MKRELOC
> +export EFI_LDFLAGS
> +endif

Exporting MKRELOC in particular isn't very nice. I wonder whether there
wouldn't be a way to keep it local to xen/Makefile.

Jan


