Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2B94B8459
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 10:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273869.469166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGiB-0006Df-4A; Wed, 16 Feb 2022 09:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273869.469166; Wed, 16 Feb 2022 09:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGiB-00069r-0g; Wed, 16 Feb 2022 09:34:59 +0000
Received: by outflank-mailman (input) for mailman id 273869;
 Wed, 16 Feb 2022 09:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKGi9-00069Q-8Y
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 09:34:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b399bc47-8f0b-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 10:34:56 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-C82M_xz-MTeTFliy3zoMeQ-1; Wed, 16 Feb 2022 10:34:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6418.eurprd04.prod.outlook.com (2603:10a6:208:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Wed, 16 Feb
 2022 09:34:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 09:34:53 +0000
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
X-Inumbo-ID: b399bc47-8f0b-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645004096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uxH9nhv4gQR4MVu7ewiPz80iqv8Z/8i7K11ftTcI0Xw=;
	b=I7jVfk3f+AqxWoMAdXP8K56BCSlKYFhODKUw7TxtF6/EN77lSzvtKD1i5CuEdLc7iF0Fhi
	e94aX3OlA6arr/3q7/8PesIMsZA0RFuQxl2ezt5ynMWxlaRjj9ySb65nXwmjPRTM4pkmxX
	LSWrOth5FT9qPXXj0OUHl6TOJGzV+Pk=
X-MC-Unique: C82M_xz-MTeTFliy3zoMeQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kj3w35qcXL47DYErlKBzSQstTFskAT/BPwyefhmoEIebfND7zcXqLnMh77aa8PDaoJE5ruyxdLzlhh0tTmV+n3/prXGkW2gRh6dNnhhFoz/y1NurTzexe3V5M9yeUbC2RjNvRrr97aFx24FRf5rn4Tf15iwnJhpkgG2MP/PWcxoxGpfC+z+8BmP2ho1v6lSkOKHm9QI/q3dwJBQbO1DpoV2umCpBH43Bj6s5YX0fISHVFKrUls3LyByKyUfvoXwR0DhWp7lVShurXt7LD0mRfcgKyCXHOuVhul/DB5Ox6l9EY0aItrJk3k0NuvirmcZtu1NMci33r2ij1xerPLC2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxH9nhv4gQR4MVu7ewiPz80iqv8Z/8i7K11ftTcI0Xw=;
 b=OsoVgAVa87+MWBq6BrqlOulWTcYL6nKN0XppiVPGq0FUTIIbeaynnONyj6nVHBq+zSxzv3YN7rjWz8lu4bwuIB84WZk3thOrO++3b7YAVohG6JHfYy4eT3s5kziv9Kz3kdMLRXxNLJSKGuNrTwXT3q7+ZJ9XS5Wey28jUfnIa2jRNIVIqdBGV3BYtckQbbVWxsfoe+h1UB9v4NCPgs+eTS6PP8fhv0OmQ3VclgsE0r6QapP7eFENkwV00BILJstfR3ah+wG7Y0d423OJax6lkDfQXQEu8fJoX+Yw8d8XDPFyDF5AGvkqGWFOmjYLOCdAUIbg8yeTzwho+UWKswMoxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cdaf49b1-e64a-c104-3b79-a1633a67ee07@suse.com>
Date: Wed, 16 Feb 2022 10:34:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v6 02/11] xen: introduce CDF_directmap
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
References: <20220214031956.3726764-1-penny.zheng@arm.com>
 <20220214031956.3726764-3-penny.zheng@arm.com>
 <eb39c5a6-f5b1-ccf3-8d2b-802ae7da68d0@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <eb39c5a6-f5b1-ccf3-8d2b-802ae7da68d0@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0035.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4125413e-3630-4b8f-dfed-08d9f12f95e4
X-MS-TrafficTypeDiagnostic: AM0PR04MB6418:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6418A40BE16A22264D7526C6B3359@AM0PR04MB6418.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dgQv+8TpcionHmJqI6q+ySA6On3sJ9Mpa2s6BH6ivlzxjLgVOzXO0iSSl5ewT02u71GLXO+O0K0nym4L5JKyqzUQ5jDoi2VAYpEuiS76aro7flLCDLGappcFopOag7lxBc0G0PZnKAd98GLDqOhwMiNbncEDn+j8KNnsRGUu9zrBaSjR3Mhki/xXyWrko0IgfJzY8ZsQ3KoTErZE1LoHV9O3KVnTdQO+bzVT9BpRLYaHAIRXE9cA9IfQDu0Xj+mBYVGKYDYxZE4+b9NKiDP8+7lchazeBfdNYuOI2G+gVmZD4CeiNh5YUWdAvIl3igPZjdFtmuMUTuaIUjuMuV2aDNDpt1Icc9OHZMljSLfIwDnodHCHP2ZnJB3BF6RtdLgiZj5gpAzaYYwVmOIACFwslEm45cJ3UlnUqu3iKHerZv7qkvVfPqeTwpFSqQP+2O9lQKeI6Jrq5AF0d7Q5O7jlXOBUhJLvFbrREjth9UWbCCLGUHh9LyIoqAxUa7BQmx15UJGngtusQJ+Tky7n6lKvapCCDsWPezgCLjAMKj1Pr3cEvqSV7RyyFiY20QyXgWtwOEbu5h99zLCn5mxjO4dZHpp0Aeo9HrF0xtrhldUSHcYtnsutC6o1pMLvfJuWNdnLZPDKOGHNAdEk9P38REL42O9/jR2myhBoczw+4MfJgW/G5HzVyFPT329smvDAzP+3pZWFjaFijq1zGA2cP5uNNLMML+Ap3AGxPNf7WKexSon5RM6Ba06v6vSTxaPeRLqi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(31686004)(86362001)(66476007)(31696002)(36756003)(38100700002)(2616005)(26005)(4326008)(4744005)(6506007)(66946007)(6512007)(8936002)(5660300002)(316002)(110136005)(8676002)(2906002)(66556008)(508600001)(6486002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2V0dGVCaTREM2UwR2Z2elVWZUx5bVpuU0FsUUFQajZuVk5YazQ3aVVpWHBw?=
 =?utf-8?B?cnQyUHdtRG1PeWYxQW1uc0JTamZQd1FhV0RGVnNRVlNIQ25XdUZ1TCsrZmlL?=
 =?utf-8?B?N3hOc3RBR09RcDIyb2x1NFN3cmUrMG5yMGFnVmVzT2hPUzJmVnZRUmFLQUJ6?=
 =?utf-8?B?WVpSUm42bXIvYXBka1EzMU9jYWQzVlFHRjltdnVVT0FvSlFmeUo4SUhXYmRS?=
 =?utf-8?B?U3NRWHV1dXJ2ZFdyZUZNNWR1M1FKWHM4czMzN2F4QVFtbjNRT1g5QlA1QWhP?=
 =?utf-8?B?L09WcW5zNUtZL3ZZbGhNZ3ZCM1RPS3piS0FNRFN3WC9LbXdtbDM3U3VuRHR1?=
 =?utf-8?B?MFlPOFFHcGdkVHZSa0p2eWVBTlZPZzZvRXhDOFRDQVY0QjJvUzVISVRzOWxw?=
 =?utf-8?B?RXVacW1GTVRPUUNOTG5WU1IvaFlVN2FnWjNMMTgvdVFJeXlmQklUU28wKzBR?=
 =?utf-8?B?TEtud1NVL0RiN25zY1FQR0kxVTBINWp3bGFoSXVha1F6Y0dtalRvV2tDQis5?=
 =?utf-8?B?Q1pkZkFNa09mZGgwdTE2ZGtlZUJCREsxSVp3UE04SDB3QlZqQlZQMGswQlNU?=
 =?utf-8?B?NmlyVmRVU1Q0Q2o3eWgyT2RTV3lidXJuYllHc1JaMzByL0VEaDZJeXlabnVG?=
 =?utf-8?B?TUswSnk2eTVEMnVqSmNNSFZRTHk5dVZzMUtVT0VWNFkrbC9ETy9QR1Q3dlN4?=
 =?utf-8?B?MkJhU1I4Y1FUb09tckVGeVdTNTdoNHpLamV0dEJTU0IyaktrVTdOQ2NCZmlB?=
 =?utf-8?B?aE4vd3ZNUDZEY1BBOHdGVGdqcFo0b2F4Y0NSV3RtcHBtYmtmNmpybVZIWm13?=
 =?utf-8?B?QlZOUTdyUERjUk5wNC9iSG5VWXZvRk8zS1JjSURhdjR1d3Zydncwc3lmY3BX?=
 =?utf-8?B?T2JZcEVIZUQycU9SYkJnQzUxVmVDekUvZHJQc21mLy9rU2RNL2tIQ3dvYUhU?=
 =?utf-8?B?UXZnbFZ0UEIwdkpKS0Y4WVdoSjV2OWRBWGdVNTQ1WWlYT3Bsc29uU1hPRFAw?=
 =?utf-8?B?QlR6NXBpOG5ZeS9jOTBNZTV6aGRCT2JXK3VqNDBNU0UzZUwxTG51QTJOcEhO?=
 =?utf-8?B?QjlmOGlSMHc1WHRCUGF5SmJNRThMc1h0VGpubmtaVzBjSmpNMVFIT3hZdmxP?=
 =?utf-8?B?R3kyb2NZUWxnKzBadjliZWpITGJVZUgyNjVWdlR6VE1DaENCWHdLY0pjd3Br?=
 =?utf-8?B?THNldTZQdjBrNU5BRUpUV01Fd1QrUWkzUk1NUUROMlpJTUhwMytBYW5tU2lL?=
 =?utf-8?B?NDg2cG9LeGV4VW5hK3J6a2s5QmpCYlY4N1R1cy9FTkdXdStYVmYxN0J4alpn?=
 =?utf-8?B?ZUswRWU1Qk1kTEVmOElLZUJsUU45U0VUWTJqMkRDdHZDVFltMmwrTDExNHI3?=
 =?utf-8?B?OVJRb1Y1d2I2YTJ1aTJhTmtld2J4QnZuR05DKzBXY3V2QUhOdGF2amt5dUtG?=
 =?utf-8?B?ZW9jcnlJdjdLUTJucHNWRkxubDN5WU50c3BEVkZ6NVdvQ2RjQXpoWmlNZFVl?=
 =?utf-8?B?blg0TkdTcHRuSFE1S3hwMWJBMlBHNitIWXJiL0I1dXQ0SnJNdGxRcGZuZlpr?=
 =?utf-8?B?akt3cDgydkhYTi8vWVVDZ3IwWEthRVN1ZlNNRDRSeElFU2IvUkgzcEh0VURJ?=
 =?utf-8?B?VmVERWI0akpVeXdJRW5YdW13NTVONzNOeVZwcUgzNXNaS21Ha1BxYmpUYUZz?=
 =?utf-8?B?SFdKOHhBRjllOTh5OU1PdEpuSVFEWmRwNFlrbHFBLy9pOTZtY0Nua0dXYXhu?=
 =?utf-8?B?M0dkQmZhUXlHN2FTa0M5UEx0cGN0R3RrYkQrTnVZVXg2RlVMaElCdC93QjJN?=
 =?utf-8?B?cER0cFRGUys0RXNwb05mZE9oOW9ydFpLZUtXYXQwYzlyTFArSkFETXl1aVJY?=
 =?utf-8?B?S20vZllkdEgxcDk3UHVnOWY0N3hNUVRGT1ZOSzE3STAzeFAxTE1EeWZmak1l?=
 =?utf-8?B?VzdXSEVPM2twUzlURXV1c1NCbU1WZkRxZmlTQ29JNDZ3RXlZM3ozWnh3aDhM?=
 =?utf-8?B?T3NCSzlxNkpUOE5iUXpkb1NtRmF3LzA1bU0yNmd1eE1lK200K1VqTTdtcklw?=
 =?utf-8?B?dW1PYU5nN2YyS21JUkdrejI0dVZnT3MzZmNBbnRSNHhqcFYrS0k4eEszQTg4?=
 =?utf-8?B?Ri9sZHQyVmowQU03WmdRazlSVlRsSUNLaU1jb212M1BiRUJjS2NLRTh4eVZ3?=
 =?utf-8?Q?rT3hAh1XI6MElZnJLnpNlog=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4125413e-3630-4b8f-dfed-08d9f12f95e4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:34:53.1603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifLw2aEoDuKJBdECIBIRqgEp2JjkS5Nc2b/ft+oLzx7MUZMprFbGoWZOi30i3J9gVsIRYa+/NC9/Iw1riGJY6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6418

On 15.02.2022 21:26, Julien Grall wrote:
> (+ Jan)
> 
> Hi Penny,
> 
> I am CCing Jan to give him a chance to...

Thanks, but ...

> On 14/02/2022 03:19, Penny Zheng wrote:
>> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
>> index cfb0b47f13..24eb4cc7d3 100644
>> --- a/xen/include/xen/domain.h
>> +++ b/xen/include/xen/domain.h
>> @@ -31,6 +31,10 @@ void arch_get_domain_info(const struct domain *d,
>>   /* CDF_* constant. Internal flags for domain creation. */
>>   /* Is this a privileged domain? */
>>   #define CDF_privileged           (1U << 0)
>> +#ifdef CONFIG_ARM
>> +/* Should domain memory be directly mapped? */
>> +#define CDF_directmap            (1U << 1)
>> +#endif
> 
> ... comment on this approach. I would be happy to switch to an ASSERT() 
> if that's preferred.

... I think I did signal agreement with this approach beforehand.
It leaves the option to use the same bit for something x86-specific
down the road.

Jan


