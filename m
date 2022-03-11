Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F4C4D5C6C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 08:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288801.489842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSZo6-0000FQ-Bg; Fri, 11 Mar 2022 07:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288801.489842; Fri, 11 Mar 2022 07:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSZo6-0000DV-79; Fri, 11 Mar 2022 07:35:26 +0000
Received: by outflank-mailman (input) for mailman id 288801;
 Fri, 11 Mar 2022 07:35:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSZo4-0000DL-L9
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 07:35:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf57bbbe-a10d-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 08:35:23 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-yJOsBPFsP5qubBwdLd2-mA-1; Fri, 11 Mar 2022 08:35:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8304.eurprd04.prod.outlook.com (2603:10a6:102:1bc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 11 Mar
 2022 07:35:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 07:35:20 +0000
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
X-Inumbo-ID: cf57bbbe-a10d-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646984123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XYS4+Swr/XxYiIs+qZs2wMjAfnDUFisBVZmUV9uOFpQ=;
	b=VVZnYEnlTVl7ryPBdU3mhTNCJEkEmH0xw+JpHq2TQqVVH3zOW5N/qvwK3zepbtOsQpyIn5
	cjiZukLa/fRcvXKVR8BKXQlbCTDfKZxKHy0PdZN1K+qN6Vf04R45OvchS2m4Pf81R6o3jg
	hQrQaXRdOaSb2to83XO/dGpdJd3fId8=
X-MC-Unique: yJOsBPFsP5qubBwdLd2-mA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8D1N1LL/i5hL9Lv3Ie1s9jNXB59whwtzUsOYopU6kdUzKKHaJDCMsGEmwN5vFMbLu0n5AAJsj7d9Salcj6Bj7G+sCy38y9cKXi4FZ7T7w4cn8oteHuDxlMpVXxj2jrAMSyvGvOiSq6d7Lv+znE2dAbrKUWbvxeVRJb3YCq44XPG/+zNrxRHUYsFsyocFFFB/HPtGd71aF0yO3ogw7TPHGWSBxaTfcB5LC6QKK3Dd3zqBegWrKJxtsbW54k3Ze/cGCRRa56GEtliQejBNNt+95ss/0b51T4wCKfqpikYVRqfm50q8ygwRmFUn+4H08GTN+2+Wz1SG2IWf4dLAhKn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYS4+Swr/XxYiIs+qZs2wMjAfnDUFisBVZmUV9uOFpQ=;
 b=GgNFy6zjit+NvX53X+zj3kCZHvwr/XhgGT9bX57ebN8bnxGg9aGqA7aX9yKfJxA4W1lJwNodYhsjiMg1xwslS322Fwe1HbItmUqkzrKH3VxiNfOFGVLE0PATgib4nhttMduYLBryriHIgd22YdAgvB09mI48h9mPkqCG7Qc0jTjdLlBlJFk5roZpsCfMs4kOPMajsvW7kG+VQXbTJlfQ6MrgD7ezYXroV/S2B6ugsaGp4wHDeGDuVJfDzk7Mo1vxC+9Onq+nnEcFDneZ6I5vUc8EjT3CjfGk3tUz322pnM6rGndQIGOlFrGfgj3zJ1sBpuMS4T0vtTuZeJZrGBzF6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e2781eb-2c62-1c93-ef8e-75054a213fb8@suse.com>
Date: Fri, 11 Mar 2022 08:35:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 3/3] livepatch: correctly handle altinstruction sections
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, doebel@amazon.de,
 xen-devel@lists.xenproject.org
References: <20220310150834.98815-1-roger.pau@citrix.com>
 <20220310150834.98815-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220310150834.98815-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0020.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03458774-860d-405a-4fd8-08da0331b222
X-MS-TrafficTypeDiagnostic: PAXPR04MB8304:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB83048D566632BAD3538A5E5DB30C9@PAXPR04MB8304.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7WgHTDAbyA71IQiNxJ59hcTzhBPHm40wGFZujxUxn8Y0i5I7gxkUzl0qRsNS+5jgbVPyeZzZi7sm5QCEj8x3zwH/8pf6JRQ4npftUwyIVAgTKi440uGc/1qSdcJlL0A6e7cFX21mssD1+QRUzffb2ELimbDEa7G+cJtT16nlTg6dvj22zwL4fzRGCe0ViX4ypYqQCzhz1YgbhlZt6WB0khf1FmKvLv1L066VWdcZIQmRy0VT0mdITBpXJDyQyAnI6bsUhgQjRTRrK/2yVsOAgr4bjzQvbHh4FbqJ9T1zedSyiawtNug3Um/G9D9VbAqYDSHMVG9ZAEZjs9OKlKL8Aw8mF1JPGeCDN0K5YELxI8UeKw4Uobe7U91DtOUbTaJiRGHje5jlofzgcxSBWt29Ix9SU9ZrVuf/yT7l+77b+RrES+MR/tiUXsNDfB7vkBZg+1SiXhRWMvbgZhh0lTi+Y78/Bsc29d2qioqx8N1ldrZJ7LGk2UFh2uBS1qhyYvWkmgAFw/wVB/N/NEdixi8c/h4I6VPQRjpI30BX0GAJemE0iOmpawudEEeAfTZjhki05iPW6uM71/HGoL0FYdEOHRj/oe1x4qzVQsrjfGW9XIROVv/Gceyppfu0ZH09eNrFxkv/PQfNpyh7492NBoqIw8QZ/uPSExuLGU7Mt3AHgqw1ZZTFPonAgFEuRe0ta2iol6ORR41oTXEzJ5C2mWsPxUSAvfHb4p5KmrOZM4hQ4B9AhcCskFgeb/b3bODQx4GG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6512007)(53546011)(6506007)(66946007)(66476007)(8676002)(66556008)(6486002)(508600001)(26005)(38100700002)(4326008)(316002)(86362001)(54906003)(6916009)(83380400001)(186003)(31686004)(2616005)(5660300002)(36756003)(31696002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UW1yWWgxMVlRd0xvKzJJamNkS1c0bEEwL0Q4dmVWcFp2bENxakt1eURwUC9u?=
 =?utf-8?B?Y0htaE1WQmRGZCtGLzJTTGZCVG5Fa1Fza3U1MEZrcmU1YzJPaDAvenhNYTFw?=
 =?utf-8?B?NWdvZUJWU1VWdktDREVEeFozdFg0MnhwM1FiTUI5emZYMzMrRHYxMjhIc0oz?=
 =?utf-8?B?cWNUcHBrbEdibGUyL0NjcEJkNEtXVW84Mm9UQy9zeVh5LzJrbjBPUjQ2cktV?=
 =?utf-8?B?NEZWUDcwalNiS21GNVNnZUNzQXNnbmZqZ1RmcXhZTGNLcG5UODVEMjFrdmFt?=
 =?utf-8?B?d2kzSnE4bkJRY1JaS2ZwOVZLem1WdldWK25nVnYza1hISG0ydDFpME1jVk54?=
 =?utf-8?B?NjFFY0NvZEhaLzhVY09hWWNwYmoyM3AvcHRHWWxIR0dYWFBUdzJ4Z09aQzZ6?=
 =?utf-8?B?VXpIcUtzMFZLSEk1S1EyclhQUzRXS2JwdkV5SEVmb3hzbUd3ZDR1d3RkUmxx?=
 =?utf-8?B?WXIzUnZWWXpjZkp1TG5meE9idmxITXJTM3lUM1Y2S2QwNExPZE0vOTNPZVk4?=
 =?utf-8?B?dG9ISXhPZVk1cmNJYzFKV3dJVTBLcXRLWHpOeHBRVlJZNkl6OFMzd0JwRVdp?=
 =?utf-8?B?THdoeFFEeGRWaWgrRks1aXdFSkJ4V2ZtblFKa3gralJpQlBkYmtRUmN0ak93?=
 =?utf-8?B?d0ZpRFVyOEh2UVlWZ1R3QmM0b3paZEtQSE94SGRuZnpjZEFidVlIbGpEdGY4?=
 =?utf-8?B?WWx4ZUZHZ3ZIaHI2TXA2SGRVUzNReGFjTkZGdnFxc0VLS3JtbzlHRUlsaXR5?=
 =?utf-8?B?RXUvd0k3ZWFVdmJQZ05OZXgwS2I1Y2ExMkthamk0enVrNWk3bVRFalNVQ0ha?=
 =?utf-8?B?WnVCSlZvK3RTVnh4L1kxdWpETkY2Z0pMOHB3cjVIS0Z6NVFQMDMvaktqWEFV?=
 =?utf-8?B?OUJ4VEV3RCtIVlQ2NnRLQ0w1aWJJeXZuVktzbThiTWpvb2ErUm5EcDY1SjZu?=
 =?utf-8?B?YStPRkNVeWRTWmtQWHZ4cmp1cHp1U01OQzV0VEVUNHExWTNKbHRYL3drMnFm?=
 =?utf-8?B?RzBHdXRGQXFJSGM2UmZ5NU92MDErcXNNU2hibFhhUWwwaTltbFUvWkpyVTRt?=
 =?utf-8?B?YTIzbFRvTW1lclNzdWRKUUFDRXVZVTErcTdrRkJoRWZkN0pLRjZDeUN3QmxJ?=
 =?utf-8?B?blV6NlRSNDY4YmRlS1FkWG1KVDIvVEtkZU50bmlTbUFSZ21NbEQzNTNOS3cz?=
 =?utf-8?B?M3VDUnpMR09adkZCOHRXY3pZaGdzVnJQeGxtZjNOcEp1TWtkbjh2bzJDSU1j?=
 =?utf-8?B?aVBoU0cxMGNCRlp3TWlwMHNxVjlEeEtUa2cxUlc1SnpZKzJBaEhIR1ZaS0JD?=
 =?utf-8?B?TThLWlp2d3I5VGtqM1ZaL0lOeHE5QjIySkVNblJvRWcyNEw0YVVjbGJxTWZL?=
 =?utf-8?B?K1M2SXFUdmJSS0Y1cUs4M0w5NjUwQkZyZkpJb3ZBMjZiQTJrbEhGa0x1d1NQ?=
 =?utf-8?B?QUUvN01NSnZwMXU4QUkzOUtzWmlCeEg3NEdzNlMxbjRiY0VZeFV6QkZaemtn?=
 =?utf-8?B?bWpEL0NXdktvS2w4Rm5qU05EQ3FGcWtmKzR3NDFGSzRabDJqQkhTMFVjaDVP?=
 =?utf-8?B?L3FFWWw5UnMwbHVQVGZoL1IzT08vK0FPdVBhM1VmMnlFdGxMN2V6ckZmR3NX?=
 =?utf-8?B?TEZ0TlY0cUQ0NzlyQ0RCZ2c0OWQ5N0M4Rkt0TXovTHFxTVpSYllPWVA4bzRC?=
 =?utf-8?B?WTZnV1YzOE1mRzJ3SlBlWlFud1N3cXhQa1hEalFOaWhxQldQbk0xR1M0VEpY?=
 =?utf-8?B?UWFpNGZYYlkycVozVjVpdVBTVkRwWWhRQXJtcXU1Z3BDOWJQVDdDS2FjYmY3?=
 =?utf-8?B?bjNSVTFFSGFJNndXWG9PK1NFU05CMkk1c2wzS0JOenpqdmp5MTQ5azRsY1g0?=
 =?utf-8?B?NlBrcy9jRHJFNVpuZUxvU2ZQcmpJYWFJRVFZWFBvbDFFVHp3OUh4WExrYVJ1?=
 =?utf-8?B?aEhPb3NIcnZJVXdZRkdDMkl3b2szdm5RM2dWNm1tZlY3SVFEbm5weC9taHJK?=
 =?utf-8?B?Sm4vdElYNWZWSlRXZDRTR0prOXlLNGtiV0RoOG5iR05xM3ZHZ0dBVHU2ZlRM?=
 =?utf-8?B?YUVaMmxLYVFrMkVHalB5N25VZTlXbWtoaHZpWVBRRFJHdjVQbVFkdzEwUDdh?=
 =?utf-8?B?RmQrVFNOa1ZuTUpvdFNFYjZJTWJHRW1ZY2JweEphTUNNVXg5WU1yTmlZVk1x?=
 =?utf-8?Q?6HrM6K4Y1BPfjAyhSHTEO4s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03458774-860d-405a-4fd8-08da0331b222
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 07:35:20.5251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z03PqUVVuU8b1b5uUav8X3F8tBwC6Ue5VUQBMar6uxq1mT9cSYYSYObVUh0a7LXVMeDeWyzPayrqGrjShIhAHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8304

On 10.03.2022 16:08, Roger Pau Monne wrote:
> --- a/common.c
> +++ b/common.c
> @@ -249,19 +249,22 @@ int is_text_section(struct section *sec)
>  		(sec->sh.sh_flags & SHF_EXECINSTR));
>  }
>  
> +#define SEC_MATCH(n) !strncmp(sec->name, n, strlen(n) - 1)
>  int is_rodata_section(struct section *sec)
>  {
>  	return sec->sh.sh_type == SHT_PROGBITS &&
>  	       !(sec->sh.sh_flags & (SHF_EXECINSTR | SHF_WRITE)) &&
> -	       !strncmp(sec->name, ".rodata", 7);
> +	       (SEC_MATCH(".rodata") || SEC_MATCH(".data.ro_after_init"));
>  }
>  
>  int is_init_section(struct section *sec)
>  {
>  	return sec->sh.sh_type == SHT_PROGBITS &&
>  	       (sec->sh.sh_flags & SHF_ALLOC) &&
> -	       !strncmp(sec->name, ".init", 5);
> +	       (SEC_MATCH(".init") || SEC_MATCH(".text.startup") ||
> +	        SEC_MATCH(".altinstr") || SEC_MATCH(".ctors"));

Having dealt with this recently - what about .init_array? Modern gcc
prefers that over .ctors. Of course the question is whether either
really needs dealing with here - these sections, to my knowledge,
appear only with gcov support enabled. Not sure that's a case where
livepatching is actually expected to be used.

Jan


