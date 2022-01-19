Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31950493B19
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 14:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258852.446273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAB0t-0004DD-Db; Wed, 19 Jan 2022 13:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258852.446273; Wed, 19 Jan 2022 13:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAB0t-0004B3-AU; Wed, 19 Jan 2022 13:28:35 +0000
Received: by outflank-mailman (input) for mailman id 258852;
 Wed, 19 Jan 2022 13:28:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAB0r-0004Ar-UF
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 13:28:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b260bcb5-792b-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 14:28:32 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-sXMnF_WNMi64L7j1bWK0lQ-1; Wed, 19 Jan 2022 14:28:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6443.eurprd04.prod.outlook.com (2603:10a6:10:107::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 13:28:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 13:28:29 +0000
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
X-Inumbo-ID: b260bcb5-792b-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642598912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zEMX9WE0p4zqIthayNM4ih2MCHjWwIm14mOVjDOi5nw=;
	b=hr1BkQUMvKgSrIgSOXFa2aGtc3SmdmYwxMDTuWEmJOn10qyDaKsaz3uJwfIR875OUEgvjB
	3+KATVtoIpEZ33gpbNpV/bQ1OXRfPSBiPMBnKTs/Rogk21qxLDQd9oubqvukqwrQdoY0J7
	aJrSlIXCBiC0/AxrEiOEsdDjy9/4Da8=
X-MC-Unique: sXMnF_WNMi64L7j1bWK0lQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fqf352TyQ4vKqBbT1SbM4cwEdvpz5iDoRYLYchBoUj6TbxcZ+GAxuYtzqTlTB3S+sksXznwFo3uqU6d5S+8pOMAiZQBAcKVLVBCMBz/l6jrjRlCObX9AVMDIku4nqdjVaAlee4sCaKSV0BRYBYzWbAorj5ZvHQmfDaglymS76/PE4RbBnBD19rjQw3G79tzQt0YKsvwM6/mdMgAZXjCPwnM4725T4g6A1iY6ksaTLERKvcSviV7LYgHOWpcoKYwohHLx/7AmA7+YiCShiL+daBfwidmwRCUNkRf1V9ZkvlZspENHktcHbqpvkck81h0sc9ObCntvJm1S3N3wjsKxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEMX9WE0p4zqIthayNM4ih2MCHjWwIm14mOVjDOi5nw=;
 b=hgi3C/Y9sHoXkc+uYwSSO3RBwsuTfAvdjrsIbQ24b8qF1yTfw/Qu3y4MofEhxJuZEZJYihOZzcATRluhyj545Zl8biH3cCaKj3jvkVfV/1HVvgpA9DAh1IUSDq62VUAsB8YuFs2RW0YZs1s32Le+9CQvWZg8wLH0GLM/R4VpmmlBOt9CrfFshB3bJPtMQ8bXn+j0I9r6BupIzIjtLl7rqHH+B3YisVHMQ1+2DwPVfsTEEuC/1eZi5kqNU6lo8QzJrYQ6MZMgLIkgV5rtjw8jKXS5PXbWgMrqla83FVN5mGgBzAM5yAXbiNCAj205ZIjpLbp4+4Xt0f6jfHGIF2TBIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <752485db-deec-1011-f65a-d277fc3e404a@suse.com>
Date: Wed, 19 Jan 2022 14:28:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] x86/guest: Introduce {get,set}_reg()
 infrastructure
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
 <20220117183415.11150-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220117183415.11150-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0020.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4d64103-e658-4105-5e98-08d9db4f94b0
X-MS-TrafficTypeDiagnostic: DB8PR04MB6443:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6443B301F438F9386C39900FB3599@DB8PR04MB6443.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lkNruGkUg0KKoTLqwMOSw6OLhkrvqqNSC8R6EI84/m1qevIBv+lmDp3lkKXPUzfqz1v92d2963q+YbEzV3Q5VAEHq84Bhzdq01PYQEfavyvpHfRyDjPHkC9BD8gR/cQryBKvuUrQxdDZYqDZ/MXu0tNYgim4b/GfJ+ZXLoJai9YbU3uGrEe9y7Nl4jNZq3H06F7Dk5HauW/Qz6vrfToy3B0Lio/HautZJBWWeqjrvhPo3Dsx+N/3nKAHc74ugLzoWvVqq/UZPN3JxkZDtlG41ndqUIFqUEunupAp2WCg6uxfxRiqJKSWR3OGpB13QMNVPmVA1TBAbR/ct7EV4rGqjQknILLGipoxoeclStoAWSyUcliawct6X0CGgsrLvErpM2rt+Iay8x0GBiHj3qfC28fJEx/d2urwtmNd8cn+FA9fC0W6ze7yTMhg44Nwt/28U0m/7DGJc5I9sXWpsDuhYwpGNTPzuI+kH7zNMBnjegThUF+RFy731DDqmWI8tTAlyU6a/UsWLavEZD20FJzu952iBZk/RMDYxbKd/tPDlp61zn5vKoFGX3vA4B1cUlok9zKX101olt7ZyQnSI9Zvaz2GR5R1TF8W7YfGXUca4k27/87VVsTIAKkD981TWuOv/tKadwgfx5MraW0pz+u6xjFyWG7+4ZPiJ8JL/U6pJBveXkIft785bpEVjjyurYL3QOqq0d2rBV6n/bVmwLuRUc2f8wTRPfmZt9ZqXacSeHE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(2616005)(31686004)(86362001)(316002)(54906003)(8936002)(31696002)(4326008)(6512007)(508600001)(26005)(6486002)(6916009)(6506007)(53546011)(8676002)(2906002)(5660300002)(36756003)(38100700002)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1c1WDBUd1c5QUZ5U2FkM2dBQVdOVGwzby9CNi9EZHltTzV2dGNhYXZ0bDdT?=
 =?utf-8?B?c3RiQ2NnczQyMnJFTEU5MGNJQ2ZMcFVGaUYwcjljRCtieSt5RFlrc0pUeWdZ?=
 =?utf-8?B?eWI5dzBJTktrdkwvUzUya3ZwMnNoK2FPM3p2UnhmaHBKbmxuR25pTVZuUFlw?=
 =?utf-8?B?Y2dRRzNXZlM5S0gwVDRtUGlHQ1FkeXJsdkk3M2JNMUVjb2NaTGp0Uk5LOGM5?=
 =?utf-8?B?VnJubHVUMDVMSmxvR09mekpYdHdZNFl1TDY1QmtoVW9NMGM4QktIWFdDUlNQ?=
 =?utf-8?B?TWF0Vng0SHdkYkg2aG1DNGVEeDFyS0pVZ0JXaEdYdTEzQjErYStCSmdpaWF2?=
 =?utf-8?B?UXg3Tkx3WFNIT2orcUJCbmJpN2FmQXhUL3dKdmt0czJ2RHZRM2hqK1Q5SDk2?=
 =?utf-8?B?ejRFNDBJMDdXK1dEVS9Jb2ZyY0I1dFRCajI3SzEvK1NZYzhYNXc4bGo5TlBn?=
 =?utf-8?B?Y3F4MnpqVlF0U1hLVTdsZnYzVkNpMk91R1pEcFc3Y0toR1pPem1YbzFNRVZJ?=
 =?utf-8?B?RGVSOFhlRG9YaWVNalJLVEhoTFlxQmUyanFOS3g1UWRlTXVGQnZPNzRwTHVO?=
 =?utf-8?B?QVV3OHNPOUhib2x6cjNnTjdWY0w0Y05KeDNpM3NVSG9mYnltMUhJVmovMTNt?=
 =?utf-8?B?SGdBVy9kL2NaTTFsT2xQa3ZFOGI2bEJ3UnVTeS95TnhmNllCRXRWYUhHYVRa?=
 =?utf-8?B?dW5aZWt1MTFkendqaXFtVEZQNXd3WWlmZHRTdVBoVTZlMHpUeWU2cnlCbkUy?=
 =?utf-8?B?dkZ5eUE4ZjBNQVp0NUc4RGhvZ29mNU14Y1RDSzBCTkdvZmNEU0lnWDZWNDRi?=
 =?utf-8?B?UnlHWGdva3ppNEVvYkxjaElLODJiWG1ISTg3LzBqWGgvZlRQVUppcCtQei9j?=
 =?utf-8?B?QTQrRm9WdVhOdCt0Szk2WTdkdEJHQ1RHV3lBRWZCR1hXb1dROEFDUENPOUh4?=
 =?utf-8?B?ckp6TXhhcWsranVFRnhWdUVqZnBlTjhSSW9hM3R2MkNZcm54NGtlWUl6cm8y?=
 =?utf-8?B?QVZvSXVtaGpNOW9hUk1iSCtQVzNTc1VOODVvNjFnaVk3bktDK083Z3hoOUhp?=
 =?utf-8?B?MlR0Q2plVFVmVS9LL0g4L1djM3BxT1pYMHlKaW53ZE1VOXBrT0YvTTJoQ1NB?=
 =?utf-8?B?azE1RlpiWW9QRVN1Y0greUczc3B1TjlLdzdIWXRvSVZqVXRSZitRdXlHaFow?=
 =?utf-8?B?OXpKL1lJdlNlSDh1eVBOU1ZYZ3BxWnZxTWxOOGZra3Z5QitpUS9na3cveHBZ?=
 =?utf-8?B?bGl6elhzZ095SmtWM1o4c3Qxemt0Y1hVQWxKVEsrVnBrdEJudTFEdG8zcVJ3?=
 =?utf-8?B?RjV3bW5TQjdvUzljY0lhVnZxTW5IL1VWVXlMMzE4VTdGMDhHT0NNVlFyWUw4?=
 =?utf-8?B?Vzl0STRDVDFJS01weWtDeFA5NG5NN0tSN0x5ZXZzVGxld0h1eWZhMkxVMEx4?=
 =?utf-8?B?dUNwWHgwemtKcG92MmZZTUI3S3NOTU9RVEhhZGo3enQxNVR4Nk9kM1Y0RXA4?=
 =?utf-8?B?M3hBTzBJRXh2Q0p6aS9FRWpRNjNpZDRTRHRQVmV2a3pjcXAvd1hBb0lXYTNn?=
 =?utf-8?B?YjljYnNBQ25hQVhMMFd0emtzMXU3VlU3UHI3R3ZGM1psalIyQW5EZzFvS1lp?=
 =?utf-8?B?STFQeGh5QVhHQW8wM3k4WXhPdnkwaEZ6K2RTU3Y5VlNtSURWMkhQOUNZcVJO?=
 =?utf-8?B?V0tlVmlBeFV1ZDhzbVFQYVdoaHFRMFhPVFBhSnV4UkY3Q0VOQ1djSjhERW9i?=
 =?utf-8?B?TmcwcUdzdDVzSWVWYTg2YUNnc1YxRFkvUXlJVkRiaXloQmJTRXZpWFcwbmlZ?=
 =?utf-8?B?c1d4a2pkb0lqNEZSVGd5YmttQkRFZHordzBCemdheGVTcWlPMFp6ZnFqSGI4?=
 =?utf-8?B?TWdZM1E1YTRrTmxaay9VVElJNk9IM2VDdDA3TFZzQmROY05nT0NoSXZ1Y2d6?=
 =?utf-8?B?emtqTS9jVlFkdjh4R0MzSU15bG5WUUZXQUZGRVFVejg1MzA5VWNld1lXR256?=
 =?utf-8?B?OFI3RXBNWGtoWGRtaWVVYjlmZUlJUzhhYi9nRnBsVkUydmI5R1hsU2lJVm9m?=
 =?utf-8?B?TWlDSitWaHJLallEVzdRL3hCK1cxaGkvV3hMZDkvNFJFTlY1TXo1QlNkM0RW?=
 =?utf-8?B?Yk9OcngrcUhRa0pmbEZ0OGk5dkd0R2VtYWMzUUh2Qm1jYWFiZkJ6eGZ4QTh0?=
 =?utf-8?Q?Bo5v/2XPlmdw97QxdvAfcL0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d64103-e658-4105-5e98-08d9db4f94b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 13:28:29.5910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7td2Zfh3X7JjwdBZ02FgtbNKO8C9xBSFAU4dpOPInICc2omMxz4q4dvnyWKPtdJDknGfxgDN9/LsM0Cwx+S5xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6443

On 17.01.2022 19:34, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3744,6 +3744,28 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
>      return X86EMUL_EXCEPTION;
>  }
>  
> +uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
> +{
> +    ASSERT(v == current || !vcpu_runnable(v));
> +
> +    switch ( reg )
> +    {
> +    default:
> +        return alternative_call(hvm_funcs.get_reg, v, reg);
> +    }
> +}
> +
> +void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
> +{
> +    ASSERT(v == current || !vcpu_runnable(v));
> +
> +    switch ( reg )
> +    {
> +    default:
> +        return alternative_vcall(hvm_funcs.set_reg, v, reg, val);

I'm inclined to ask to drop "return" from here.

Also, for both functions, without it being clear for what kind of
registers beyond MSRs this may want using down the road, I wonder
whether uint64_t is actually wide enough.

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2469,6 +2469,33 @@ static bool svm_get_pending_event(struct vcpu *v, struct x86_event *info)
>      return true;
>  }
>  
> +static uint64_t svm_get_reg(struct vcpu *v, unsigned int reg)
> +{
> +    struct domain *d = v->domain;
> +
> +    switch ( reg )
> +    {
> +    default:
> +        printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
> +               __func__, v, reg);

Is __func__ actually of much use here and in similar further places?

> @@ -852,6 +867,15 @@ static inline int hvm_vmtrace_get_option(
>      return -EOPNOTSUPP;
>  }
>  
> +static inline uint64_t pv_get_reg(struct vcpu *v, unsigned int reg)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
> +{
> +    ASSERT_UNREACHABLE();
> +}

Were these meant to have hvm_ prefixes?

With at least this last aspect addressed
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


