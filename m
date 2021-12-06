Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E329D469D32
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 16:27:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239261.414703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFtu-0007Xr-P4; Mon, 06 Dec 2021 15:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239261.414703; Mon, 06 Dec 2021 15:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFtu-0007Up-Ko; Mon, 06 Dec 2021 15:27:34 +0000
Received: by outflank-mailman (input) for mailman id 239261;
 Mon, 06 Dec 2021 15:27:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muFtt-0007TJ-M8
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:27:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0800910b-56a9-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 16:27:32 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-rF03TJFyOz644Z6HbyGtMA-1; Mon, 06 Dec 2021 16:27:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Mon, 6 Dec
 2021 15:27:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 15:27:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0017.eurprd06.prod.outlook.com (2603:10a6:20b:462::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend
 Transport; Mon, 6 Dec 2021 15:27:26 +0000
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
X-Inumbo-ID: 0800910b-56a9-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638804452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1BNddKplu6/hbDUq0SSdInku9dxv92u8Dvp6sZ+8eYg=;
	b=nHlpHUAewM9FXqffojyBteiv48uvUvRUNrKbDGO5cpSHqFcQI2zegsU1WAcE1TF7xW2Sz2
	o1neWmx7ijFNlYFbsUKvx9UF+D/jBjkrT1hTiTwqawwunTPGbwHg++TE/gGldBEuP9FS1d
	jHlWUKBSNvU2JDvqnb2bfMrS+Qya084=
X-MC-Unique: rF03TJFyOz644Z6HbyGtMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ao5Ewfm5gi0L3XIVRO68MjZb03Js4ejeb8MXWExKyxclWW4MMg+yrSIUP7gSjtKqIiqi9eT8AdNeQkDEVjhklv7JImydcOxbZPESSQqK0nJ/4AtuN7cCoyf8QtFhymAEs5/TtfllAPW+085UCpm3jKwr1LeudJreQZF2nJKa30PD6e/rdyfXUcZadabZqurXewUJ44lnn7cEu84RlT1jZLYJrzOj4ReejsF3EvvRDSoAGAr2buahQS5PfKQ58ZfILQi4S9EykbnUfzsp1UEiR6153V7ODwTbKw+XYcSDYOnb+0cUuiTsxMziMCVctOcZX0MTsB0QYNu2FZz9GSXH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BNddKplu6/hbDUq0SSdInku9dxv92u8Dvp6sZ+8eYg=;
 b=HcHalbZBaV5FqLXasUY2K5xiylQbZM78i9uW7y3VQvBIcCthaoJEGX5IMGOAO3605cRBHPsDgY4C83ODQ9gauBxBIwQUveJ8zDLoT/eSAell1sTXxlzsvtXBWxTK9hAQkCRYHf3z/CwZeoNCff/UXAa5lBpDVmBBH+aL2WFSC0vf8Xucu9FTLH2HoL1umxawD0CSM/eENMl6OjqtgPXj352zzCNOnBh/p397rjrMpPm2n4vo59LM633ocBIBl8JUvF6DPdjq554SKW9D0YlxpGsl2MDLW3uBz2NiK0YWNsEeRwMPTlzO8NZKIwkBfB1tG8j4r5JNw9P+u/3CXhcY7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7c427b9-2564-dc0a-d03d-411df83ba9c8@suse.com>
Date: Mon, 6 Dec 2021 16:27:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v5 05/12] libs/guest: allow fetching a specific MSR entry
 from a cpu policy
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20211129153355.60338-1-roger.pau@citrix.com>
 <20211129153355.60338-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211129153355.60338-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0017.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95f40b7f-c45c-482c-fd87-08d9b8cce8c0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB435284ADE062E3786BACBB57B36D9@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rjZ/dztHeom6tZCKZE6zIwbCVOn1u+o4VkOiu4DKmFt7aXaa6rI5kHcKjVL8KfGhQNlIsVH4AUvSbDRqcaD9Mx8a3GKMHf6HBgwfdmuUd5Nzels/i1xHESXFeixz6S+wE9SwbDW/GhIgSS+LHMvJqtOYC6MG23JaRmbuZ1XVtCpOThVuXxAwCk1kR5sJpdPv4G9KOug2OUYy72erjez6ND+ae2Hhz+JhCEZ+O4P1nuvfSv8//EJzvagPjOaVn2E8oz73xFy07D1xNwJP7S3CZj2rmhauojiSOPgZdgbJRjOsM1Eag0fxziVsF91HRQ7fDDvnjmhnfQ27qb/yhtFfnvJTS6ECWD1TeerYL8eQksgu8mKNFktQLPQCfLC579OCZOuC4LWeUOpoyjKYJLzj2Wl/xsYOyYeMdO4Gk8iYiJOFYeziwSknuF5vmihRDijXnwpLVwSbYsHteR6uBxFd+apOkcaNIaS0x7iEedtTGYHsh9QL+SeEcmHXhtjB8HYw/Kl4fnPoJBZbuhhOU1UHK+075DE9qHRuh04sOv2nKaqfc8AFToEVmaFZv/d4+xSKEBdyXLbN5Q7B6O/QR5vAD4HizUX7lOLW+mig8qkdj0UZSi3IhLa9QtlXmsyk16uWSPf4aBRkCi1jFGc+0e5IkUUbljXvQ885gfGVEKBNXdqh3kk9NYTRv33RJhSN4IjmRk++pmPxCpDJYG4EihxWOQO01wibZTx99c4am+M21WI9yx8dpr2WoRPm8aeEXhm6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(4744005)(316002)(16576012)(31686004)(8676002)(5660300002)(8936002)(54906003)(6486002)(66476007)(66556008)(66946007)(31696002)(36756003)(4326008)(6916009)(26005)(956004)(2616005)(38100700002)(2906002)(186003)(86362001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU0ySlpZYTQweUNJR0JsaHdXYXJkWlVqbVZFOVRGKzZrVnBvbHN4TWwxRjFp?=
 =?utf-8?B?TUJGdkJHMEkrNWRWaVNsY05EVlRMSFNOVWlzMmNHZGFRWldPN2pBN3BIYytZ?=
 =?utf-8?B?VDFTdVFPc2QvWHIrWG9IOG0vUGorMmRxcFlvZUdOQjVuLzZ3eFBFdkNBUXpN?=
 =?utf-8?B?YUNKWWI1aDZRT2o0WSs2Vit2REFqS09vUlllQUJXbWVQU2RnYUNBZ0ZIaXRX?=
 =?utf-8?B?dGsxNFVwamZ3NkRHRzk2R2FTNlJ2QTJsbEtmWm5DcUxxWC9RMUlWVjFNMU1F?=
 =?utf-8?B?ZTZYMzNCR1QvNitINEwyOVlUWG1RbFF2dHlwZzZNR2pHT0lqTHEvSnpYckxp?=
 =?utf-8?B?STFOcWRpbUNqTWorcTRrOWwrWVp4ZmJqVUNKRTVRRG4wdXJ5bjNKaHEwK1pv?=
 =?utf-8?B?QkVFVDF3Q2U5T0FnYzg0VXNwRDhtbmdZVDVqRnFCQk9HWExEaG5CbS9YTzds?=
 =?utf-8?B?OTJoRGlmTmozcFlGM2Y5dzRlQWo4alZZVUVhMDRoV0lVMGVYUzY0UVVHdDVK?=
 =?utf-8?B?ckJVZDdpWjYzOVZwVmdwVmF4Vlc5U3dBTS9rd1Y0M2VqUzlDdlFGbi9ud2Zp?=
 =?utf-8?B?ZU1aNWZMQlpRbEczaXBiWndvdTNoVE1VY1ZJSmxlTEgvK3pacm1KVFE0alFR?=
 =?utf-8?B?SkZCck9aU3VtdE9TWGF5azJnQjNJVHpyYzh3d25hWXRQd0ZIcG9iTG1keFFR?=
 =?utf-8?B?VU9oWlFPYzdCbElFOUVDQ0dzOGV1eVE1UXFKRC9TZGRZYzRhOUVkTThRaG81?=
 =?utf-8?B?ZXYvMnp1Q1lPUWN2dVJMeUxjTW11RlFLUG5HWEZsT2xGOHNiT0hIMmd0Slpv?=
 =?utf-8?B?WXRWOUliNVFDVklCSVVDUC9hWUl2VDNtRzdWS2UxTTlrVkFjRkx0L2F1dHdi?=
 =?utf-8?B?TU5UcC93bzlmTVFETmtPYjRwM1prbTE3ZFUvVWowY3Y3WGxXRWR2N3VxSzFM?=
 =?utf-8?B?cUROdFZQTGhsQ0RxV00yTk5JMjRiaFVPNUxId1NoWWQ5eUNpdGhMVDNUdEFQ?=
 =?utf-8?B?ODN2MXRZbFA3cmtubzMzVTREVFhNZlVTU0dSWUNYdmNrYi9KVDlzMmhrOXhr?=
 =?utf-8?B?dHUvMUNDTmtZZWdOamw3aG9pbmhUVVExT2N1SzNzQ2h2eXh6QUYrVlJaY1lW?=
 =?utf-8?B?OFFidUFMNlpTallLdkZYTVF5T0wybzJnMDU0UzA3K24rWnhZSndKVUkwdVU0?=
 =?utf-8?B?VmlDdkxheVdYcEh6M2FBUzJTTTJocGlZUHVnRUFmbDlzWFNnTUFvRi84TmIz?=
 =?utf-8?B?ODN1R2laOEE0UXhIV3VUZnJ3N242TGNPcEhzbEJDZyt2WEEzT2xiM3BIRWx4?=
 =?utf-8?B?dEdFRmNKUnRPYjhqeXYzNkZNdWovanY1Nm9neU9QYk9obnBUVDNJZ3RNY3JL?=
 =?utf-8?B?ZXczZGRJVFcycnhIdWFDc1pVbElyRjRoaTlpZjljYjE0dE1MQWlzLzMyQlhk?=
 =?utf-8?B?dEhNRG1DQTdKaHpmSS8xVzEzUkVEcmVGMExza3R4WGp3OWVTL0hwWHU1RzV1?=
 =?utf-8?B?c3BYVlFrUFh2bUVYenhvbnZHem1rLzIxQTNEb0h4UGNGV1lESFFrMUFiTHVD?=
 =?utf-8?B?R0t0VlBibGpuc2hXaTFGcVZKY2JoaFBvWktyWWN2cVc0TjhIREFXMGVmdnNV?=
 =?utf-8?B?aGJVSk9MMFVucWlyNnpOaEdlQi9WeTAyM3o3MVR0TmdLSEcxV29QSmg5ekI5?=
 =?utf-8?B?NSsyMy9VY0IxQTlxZ1MyMWtVUG9WUTY3aGFCY0NEeXgrRDNtUVVuSlM4M0Ro?=
 =?utf-8?B?RElwNWVtcmI2aUpBVE9kYVNxNEh1d1YrZDJnbmxXNzR3Z1hoZkQvRldtdUV1?=
 =?utf-8?B?aE12c041cTlzVmZSTHRnMzFpZDIrRjhxUGUrRUJyT2Q4V2R3ZXc0d3l3VFlQ?=
 =?utf-8?B?aXpUNGwyNGpJYjRHSGRDb0NCbkM1KzFiM2ZiTWNyem54NlBVRGpwTUYvUkha?=
 =?utf-8?B?RWg4T3Q1NmhyZ3l3b2JUSGVmbUVzYkNNenVEUlQxZ2JyNElEK3VNdmU1OUJJ?=
 =?utf-8?B?WVBjdWE3R2l4dGNoK2hjM3E1dS9OQWtpQjF0NWtENkxBbzBwcHlZeUNGWXZF?=
 =?utf-8?B?RWtoOWVybE54Y2pBS0NyUWkvZ2htZk00L01xWEEvT3RmQW4rYTA5Q2YwTzJm?=
 =?utf-8?B?N2tyclVHUDFIbmFSSkpvMXBMK2hzM3A4Z2ZzNmtTY0tZbGdoM2dCcXNZOEYr?=
 =?utf-8?Q?nxvrWADDI3AB36VbRt0l2N0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f40b7f-c45c-482c-fd87-08d9b8cce8c0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 15:27:26.9575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fruIy0SWNJYQ+hhvt5KCBqaoLh3ymNeWsXGdT6OfSjVbDFGzhW04yiBazAML77/5KRud24KGuCngXef6jE90Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

On 29.11.2021 16:33, Roger Pau Monne wrote:
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -878,6 +878,26 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
>      return 0;
>  }
>  
> +int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
> +                          uint32_t msr, xen_msr_entry_t *out)
> +{
> +    const uint64_t *val;
> +
> +    *out = (xen_msr_entry_t){};

Unless there's a specific reason for the divergence, this just-in-
case initialization should imo be consistently there (or absent)
in both the MSR and the CPUID function.

Jan


