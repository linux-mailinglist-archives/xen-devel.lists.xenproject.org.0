Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F512452C3F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 08:55:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226173.390781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmtIp-0003Gl-3u; Tue, 16 Nov 2021 07:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226173.390781; Tue, 16 Nov 2021 07:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmtIp-0003EL-0k; Tue, 16 Nov 2021 07:54:51 +0000
Received: by outflank-mailman (input) for mailman id 226173;
 Tue, 16 Nov 2021 07:54:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmtIn-0003EF-NH
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 07:54:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78ca1552-46b2-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 08:54:48 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-1gusafHSM3uRlMYDYA147g-2; Tue, 16 Nov 2021 08:54:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 07:54:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 07:54:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.16 via Frontend Transport; Tue, 16 Nov 2021 07:54:46 +0000
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
X-Inumbo-ID: 78ca1552-46b2-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637049288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=plJNxoA/+o8gch4VcesZ86LbSaLbOkEwz3bpd399iM8=;
	b=kRhvRSXJ4nRdXMowoKECZcuF9FN6LBAHu3z4fC0ieMwYe7D9F7T8OlT85o+J8BbwxrmZlH
	tcqEyG+tIpQVTFSXaT0t4BrhAt+y2PXSIh2atYZh9Hy5tc7rPEjp3fVo1TpAvTC2HMmISW
	0B6BeFpPLJUpKWMVCDohz2OISHLq/aA=
X-MC-Unique: 1gusafHSM3uRlMYDYA147g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c74VqnYO2Qo1IKQv2vVV0RZv3xacAM02pVOF8YtCTQ4aepdoz65KP4tiiIM0ykXjucaZdANuJm57zmNZgfwxGMLtaiHfuKIb3bwtdD4AsrFLfTJYGjV10QkBQBrcAwuEpr3Uo0x0XKNSo8GxyK8LJZ53ypGzV11I/VLFPQqpDTDkr9RV97Q7y9q7uW296gJZkCfi+OVE5hhib/ZgJRMfBKPWdRouqjpkr/gpy2Ia3O/N2J2s0kGwF0EkpN01MiTOZgXZ9oMfAKYigmAt0VJm2p2Qjk0FHeZTsIBiuylWcx/n9Hsbgsx3BT/TD/GkrD7l1bjdsuDr0johitAOxX2tIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plJNxoA/+o8gch4VcesZ86LbSaLbOkEwz3bpd399iM8=;
 b=LQMj4KSAMLamsUR00i21WJuSyQCyQXdNzqS/DTwzP1pfDrB3rvQnf4gdOuCDB2oDiG9VMbURSwl+2DGwHYlGLEnoul67eyhs+wPbanIUFlq2DGqBnt3mfaBgQ5gz+s2wfrPAftHaOP+2Ho9cp3dBYxLN9nbR3RWhF41Guh5imYZsmN4hr58FAnjkiAAOP/9gAVb/txDvX3Avd1ttIkgWKo+uK6Q3toiUtQgo19gxUsuxhWfMslRHGpHD53h/nplVcckNexcHAZHMd8ZrHhA/hVfiLCCdee3HFRGNbwK/hZkPAn8z+yuHEsH6/U/4DIZtgb/GWNp6xHuPlbuxTDXhgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ca5a669-2c91-276a-b81a-34731f326934@suse.com>
Date: Tue, 16 Nov 2021 08:54:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 01/10] xen: introduce XEN_DOMCTL_CDF_INTERNAL_directmap
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20211116063155.901183-1-penny.zheng@arm.com>
 <20211116063155.901183-2-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211116063155.901183-2-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0014.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc8aa23e-f182-4b72-7267-08d9a8d65bc3
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB377424C8D8B04BB95443AA14B3999@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sxvevJzZnRAtkMUw8RfnLgu8h3c/XNpielEIrQvcVsnA7IzQG3xH0HdnSaOx73TfzOXOBAzeyOCK8FNIXAK9h0bJ2xNxlyTVVaCXJIDH3/9RfHJgtvIJplpt00NDyZhYb9F16JfaSY1CMRPQhGwDXYozV+JXViyAnDyyTca+9bpbEiBzhDZ6MO8YC2w9mlCoIjidu3off7CrUhF2ABSSiaxxuvyZb/NLrD6Z8kgAH+0rt1PCMhoL1AMAQ9hSZMzZr/xpuwXMTXOmOzFNUQqeLmhQvWP3VsSsf5IDPlYs5hf+L4R2GL7EjsqwZxKxcrBaFU699Rrhvbjs4G7KBne0x7i2D/HLLmQ2HxLlyYKtTfKeWDwDPFONsVCh0N9FFnNImRCbVl6oVk1jON+nqT9w6NirW5+zVgMN+rjGMH/JO58wkkrFHpCeWoN6xuqRGcX8GxeJLC/kupTEZDeyXA5fZLZBgsfpEv1scNJu/WkhAfEKqP/N9byzlm0UpF6F4LWn5U9lhAn7ct2cO8pYa9nmtopkUsxNpN7WGU4gmtY4T1UABhAPTb1N8Vz+HYTu7mdnkXNjab8QnAmgRsvetw4RBEAcc42iEcK/j2i4JcuMu7g3YUevcGD4xOnfHhjrmtVQ/Pz0Y+Sx7Q97WYafrVvA8GLKaXQFAU/xB0fZTj/uFJQ1rWR+3p/QbJzPvI+X7evhw6kcBC31viP55773QiodlI4WEaWB6PacNc0xUH+7eJASYU3hpdC/lShVHWZBfHpg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(38100700002)(36756003)(31686004)(6916009)(31696002)(86362001)(2616005)(956004)(4744005)(186003)(6486002)(2906002)(508600001)(53546011)(26005)(8936002)(16576012)(5660300002)(8676002)(316002)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OERBU3JuUHZHK3BkZDMwVnlGUGQ3N1dNS3lXbThKeWsyVHF6U2VkYUJvcFZp?=
 =?utf-8?B?NlpkM2JpbUwxbXovSjV6WitMRmdtb3cwVStOaFJyZGFwZ21SUjhzVjVsWTBh?=
 =?utf-8?B?ckR1RWNUbTNEc1NaYlE3UFVSWkhvMytBbGV5dFp4OFJrV0U3ODZhb3RxcEJU?=
 =?utf-8?B?RCtXTENwTnJsb3UxYm96UC9tQkU2aWZ3dDc3ZHVuQ0l5M1RoeVQ3aXBvWVM0?=
 =?utf-8?B?c3B5OFZTVW55aW1RWnh1Sm5pR0dWY295b1RKdG91VjVGTFJ2ckdORkFSb241?=
 =?utf-8?B?TnVEWVNWb0JOam11Vm9FbzNPSmd1WUl3OTIxdXh0YUVMNXVwVGpxTU9Ua2dG?=
 =?utf-8?B?WGxiaHlSNExYaVFYNWNrdTFHZEtVcmJqM2dVTFFUSWgvbFcxSWF0dXF5cUYw?=
 =?utf-8?B?MXBqWHhiWEs0bE5CZlFGQU8zNTh6aG5Sc2UyY1RjT2Z0NzJlRjNqQmtodWJC?=
 =?utf-8?B?MktQWDhCODljN0cwUDA1TlVSTWR4bzZLSlB6WlJaeW8zNUFLaHhIa2JLbXZk?=
 =?utf-8?B?bzljcTZLd1JrbEtPRHVZUXpNR29FcUpuZDJ5Z3BudGVoV2V5UXovWlhyVkxW?=
 =?utf-8?B?bzFHQVBXSW5xUkMrSVJDbmVlL1JBdGl0c0tKRFFzcXVaMkM1V092cGp5cWJ2?=
 =?utf-8?B?ZXFQQlhtbWMxWFJJcGprTFZvUGpMQ3NyZzY1cEZlTUxYRWdWeXc2MERXQ1kz?=
 =?utf-8?B?MjhCZHp5cld3K0VuVktXY2pyUnQ5aVRISDhHdVk3Z0F5ZFkveXlhNmJDNFU0?=
 =?utf-8?B?NjBRblUyQ3BCd2t2MUc3OUpRUnFlVkhicyt1UXJSOU0vRGw2OFJOWWR5UFF6?=
 =?utf-8?B?UUpDblkxUDM4eUZjNXJOdll5ejF3SWpmUEIvb0dCYnRHRmFheDNLdCtKMWVo?=
 =?utf-8?B?eVZNSlRhcjZZNWIvbUdxaVZXNlFBWEtLRDRVZDkwTVFPa3JweDZRa2Z0N0tk?=
 =?utf-8?B?ZkVWbmlzVml6WVAyYU1wM2h1ZGFFYlRPYVl6ck1uK3V3TjVZb1RXcnFibHJV?=
 =?utf-8?B?MXRBbmticHFJNXBpR2xNS3V1Wnhob3B2U2FZMSsvcEVEeGoyVXJmcElVMGVa?=
 =?utf-8?B?aEZMQy9kZ1FNejZuRDlKaTFaQ0Y4bzRzdGxWSUh4bktTbS9QcWJzR1pxT1o5?=
 =?utf-8?B?VkE1ZnUwdGtqSHhvMzhTNHd0Sm5wOVFoRzE4eVNxY053VWpJTkduTldJekNu?=
 =?utf-8?B?b1RCMlJla0VOeVE4dUlVRk9nVjlXei9RWitOUEVrdFZxVnVWNkVTd1AreDdZ?=
 =?utf-8?B?WWkxU0hzL29YS1dXK0hvV09BSS9NS0NtTEpGSitOMXdnanNmb2tQYkU0enhi?=
 =?utf-8?B?bDlNVUk1TXR5WWw1NHB6aUdiZm1YWDdIYkNCMWg3VjdHR3RhYzdUaHpCQ1Z0?=
 =?utf-8?B?OEt1dWhFQ3ZzaXVGOFB6enl6cjlsakNzU21LOHNyWWlSZVdJVzF0VDhIbkZR?=
 =?utf-8?B?djhpblFXK3ZEM3M0YkdJdndQRTJoT0tpT3pGOFVuMmRwWjFuSlMyM2VrbHc4?=
 =?utf-8?B?VFZEempyVVYzNkJGQXVUN08yNnZVRGMzSHdDTzY0L1dQVGFDWU5BWDBaVHZT?=
 =?utf-8?B?SkdUTGkvS2h3aDV3aUd0TmZSV3dzd2puQXk5TmNBTjNzK0JVRzFDWU5hazJY?=
 =?utf-8?B?Z2g3OGlWUFdTd0lWTWE2UUFKUkprUlBSVmVSMzhJKzVlSkZ6Z2Q5clcyNDNF?=
 =?utf-8?B?K3EvVktmMjNlb0VvOG12b0pBNCtvMkViNjI0ZE5SS2ViZE54cVliRGFLbVZF?=
 =?utf-8?B?RStCR2NnN1FTcWxFTDFkYlExUlVsYTZyTVdEeE12YjhrZSt3NC9VMEJlT2xx?=
 =?utf-8?B?Q1d5NlpoaXdQdE1RcWdnLzlEMmxsbktFZ0kwWW9Zc2ZWNnJ4R01GSWJqY3VB?=
 =?utf-8?B?QU8wZzhVNEs2OGlmNElMblk1Qm5pRlYxUkdNSGJNbnA5UVdRdEhRUGM4L29U?=
 =?utf-8?B?OGNqQUhiVHl3Q2RjY1lqdm1PZFFCQVR6QzdLdDRqT2RSZ3hLbWZGb1BGY1Jj?=
 =?utf-8?B?Qi9ubFdwRFphcmJOaWptbWIrS1FuZTRYNWVmWUxVb0NYSE9yNkY5UTQyU0pM?=
 =?utf-8?B?b3lrNlJId3MyQWtFZEJqRm5Sc2ZtN01PK2lwTmZ5OS9kSk9LY3IwbXdXYWZQ?=
 =?utf-8?B?L1lLcHV0SE5KdldkNmN6bXVYb01yamxYNERjUDYyUmgwbGp2akZkckFDSy9R?=
 =?utf-8?Q?5L+4PLfP7U+rFY4q4ymKREg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8aa23e-f182-4b72-7267-08d9a8d65bc3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 07:54:46.6848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbX8gdBmXsZouY/YMIrLcd0nh6jFcvieq2xoy3t59jKbEotb5pQg1Cv5rBMN1e6Ac2ZBXXf/rRvNjRtLHF8sxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

On 16.11.2021 07:31, Penny Zheng wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -692,6 +692,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    if ( config->flags & XEN_DOMCTL_CDF_INTERNAL_directmap )
> +    {
> +        dprintk(XENLOG_INFO, "direct-map cannot be enabled yet\n");
> +        return -EINVAL;
> +    }

If this flag is to be retained in its present shape, then besides
rejecting it here (or perhaps instead of, with the check here simply
becoming ASSERT()) you want to reject it in the handling of
XEN_DOMCTL_createdomain, before calling domain_create(). Only then
would the flag become truly internal.

Jan


