Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B28A302B63
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74357.133719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47PC-0002Sj-55; Mon, 25 Jan 2021 19:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74357.133719; Mon, 25 Jan 2021 19:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47PB-0002Pq-Tm; Mon, 25 Jan 2021 19:20:05 +0000
Received: by outflank-mailman (input) for mailman id 74357;
 Mon, 25 Jan 2021 19:20:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l47Gx-0008N7-Kc
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:11:35 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c39aae58-0178-4772-89ab-225e65b6513f;
 Mon, 25 Jan 2021 19:11:16 +0000 (UTC)
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
X-Inumbo-ID: c39aae58-0178-4772-89ab-225e65b6513f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611601876;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+xarVX88N/9gxfQhDUp3p1emgE2C6saVBoGu1pG3SyA=;
  b=BNZWBVWeNrJBO+DHWvNhE7TL0ohd+tppVGRm4QZDR388AnUk5lXMQOAN
   GoqYYROXXHJOxbx08+J14QipcX/ZtDknmZMj9BhDpy/ShwDRI1+dHmb4b
   pWiMvj0InEKtxjnvJHB4Tez5Mt2EjzOuhPCuuwP7TGGE6XXl5qSj5W9BM
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BWGP3Smq33DlwPUp3/vqeoxVdI14ToXfBd6+F9kvU7iJQrSUqRGh8Y2oiuGDhXADb+poiUmpB+
 4VcYB7UPy46SZvAsTJuKvZELhsPhfOrr5zjR6VluFzHxX+rJH7pIsxCjFww2kELDjUKHPH2qTL
 kOsccdWf/J2594aLg6+9JFtAYmol7/XfI6wH82kuZDqfJvmvMrBFOo29tZjo2mM9GDcGmd7VFr
 QcfsWFhhU8YHMtcX6vyC1ZV5IpXYk+85jKMPwmbYj6a+X7E0a/muNi+OhQOA9dpJqBd8WPohZq
 YFU=
X-SBRS: 5.2
X-MesageID: 36189576
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,374,1602561600"; 
   d="scan'208";a="36189576"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAAc8W2ZoAtOjPRwqFPKXisliyL7/a3uwk4RLP8edyX709UUODBRiQV9FFZEOXpZ5ZIH633T/KfZeproUbN/G7Vdi+A9i7nZSUu208H6SLQEQzWPh1DFJsR1aZE+2s8rDoBVXxP0uAlyfYrk9POWB7IEqmjMWBcphUk8vDl/hb8UMk7FIZpdGWjn9yJwWMhSry5bbI5R22SrfW0dKn9UfZJW6XdO2O/isqA4pWTtRY3tyyMWNPi+QUx4OqqCciUTzJ2TwsJHHgVfTusAfkfiNfrgTTGjIYjQkvrVTiKhEh85tGKqg8uEHSePt6Vg2YqJQ4xWqjyyrs//RF6VyPsuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QUAOw31YyV1vKvMnvkcT6FgfD3T/lkhQbFGYsLrHGM=;
 b=Oj3FW9OnXvwyxbehcwVvUyoEZYph7NN0X3wYneqQo8c8EtzuCswEym52xZnaeypRAXF/H2N88YWoUkry/v+Mlykg1aUl1xW6qzLT0llEcU7z1buON/9B04MpYMnsZYi37QbSf8rta3ntE7kbMNvs41LmMajdBhi7ITl75tZE/7+xAiShIdweQFiVY+VmrAZHFhSc4BiY/hKESdufG833ERSMOekDsmuFsauN81Tq7MoHPPC/qldnTLs9DiENJ6CQ7TieUS1bzLj+Oxrf/164A7hXIvvjk1tSJZ3V6DPcgCi6jhCWKoWW/Fq/fs2zvQn/P6daPEoCQEUdasJOW0d9Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QUAOw31YyV1vKvMnvkcT6FgfD3T/lkhQbFGYsLrHGM=;
 b=js1WaH/qnqTLAi+LfF7ar3URB9zsO0mrExbaQelCTw8Bw+xW/DrUjyMQw80yFdhHhrphvdzxQtngM7hVpuG0fZLRQvV9pSJOHLQZgQ6OknoMeArvFC5f3Tca61sFD4IRhceaU14PxjM81QeMbYsDO9cH0w+uXY20jGRzocvUEyM=
Subject: Re: [PATCH v10 05/11] common/domain: add a domain context record for
 shared_info...
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-6-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <83f0543a-99ea-3d9f-0372-67283ad44625@citrix.com>
Date: Mon, 25 Jan 2021 19:11:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20201008185735.29875-6-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0505.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::12) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b426004-64ae-478b-f23f-08d8c164fb3d
X-MS-TrafficTypeDiagnostic: BY5PR03MB5111:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB51118C8D95BF00B0DCFAB841BABD9@BY5PR03MB5111.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E6rJUE01+wq7Ds0oV4ftkD5VvCxwlMm0vSP55Eagk+EkWpulZxgnnpJReopmoCOT0BiN/AcvSgvo8Na7DM1ebnDsY5NUJMwknctbYk8BIhtD5IbroTPMlykBs6ObiSNG2lWfAzPf+gZZezj5t/HrEoqCp+qN08FJHpZBTDKbS9FAEn/tGb7Hg6uN4LsFxNMGXBGrUs2X69H2uagg/W/OSUTfH/zIv/esSm7xLseRSyy/d6mW/cejWXpMPolQPdOBrdQrNpvQITUdzKXNdVreILNzs9bQeABMjm+xEqTb4IpbNo0cEqMLrR21MRF0BhLdqIFUjP6UZ5/3TgaGr+INzfQbz3/bE67RiHKL8kauhkOi7f1CleBt2EjkeZT1FkwV2BsKeEc5FoaFuXMiQh64MnioKvmV1TZNrJpDNdbMY8bd+mu2S86xt04vdT/FAD2Ct7B/9iWWzNxfqfjjdi+9dj9Qe7Ux6Rt7N0mlqBDrHIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(16526019)(86362001)(478600001)(6486002)(2616005)(316002)(66556008)(186003)(16576012)(5660300002)(2906002)(66476007)(26005)(54906003)(956004)(8676002)(4326008)(31686004)(8936002)(66946007)(4744005)(31696002)(36756003)(53546011)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ODhZclJ1SDNNbHZ5OWM3M0FIckwxSFBoK3M0c0pGbFl6dUdtcDhBdGZmaTND?=
 =?utf-8?B?bFRhWTRjQk5uNDY4NUtRWExWMEFtaHlzUUtNUmJtUVZuYlEya084WGdhb0ZJ?=
 =?utf-8?B?dHZvSFhZS0hUTkloOGd6YkZMOVVBMlRYdkxTU0FCYTU5VGhVa0ZxVFpHTjJm?=
 =?utf-8?B?dEhtQTNHZC9SVUIzVzBvZ205M3l5VTdzVWduMEdFOVUxQ1NySjVidEZWaitr?=
 =?utf-8?B?czVZbVBOdjlhckJSb1JmQkhCck5TK1FzVnR3OGlzY3VWS2JOTE5ybkZsSnlq?=
 =?utf-8?B?YnJIdEZOUDFWNzh1NGkrUjZQYk5XWHlqaG5GZzVLTEU0azczc3hjVHpiZVVJ?=
 =?utf-8?B?UzdwSlJYTFQ0SGFVdXAxZ1FrM2Vudm41T1lUWWYrWlN6c1drSDFXRzIrRXkr?=
 =?utf-8?B?NU5sYUovVC9BUnlBMkt1ZDlqclFldzJxeVZhU3lzZ1dkcTZqVWtzZTlXZmdi?=
 =?utf-8?B?aEtkTkpUM2NxMFlGZlkyOUtRZkgvRFkrTlhMdm9Hb2hhaHJRYmtLVGlxYlJV?=
 =?utf-8?B?TXJqSEFOUjhueVdMK0FoL2gycm5PT0dleWRqQmdxT3NXTnA2TVJMRHZlMEVU?=
 =?utf-8?B?TS9vaXozL0FCL1ZVUjh2QTIwL2RuVWtNWVE4L2cyRU1TUzJIZGQyQlhjQVNs?=
 =?utf-8?B?cTVZS0RFd1JqYVpGWnB0M0IrajZlWXhSYTlMRjhhMEM2V1ZQRXZKQkNlaW5U?=
 =?utf-8?B?Qnd2VC8wSFNTalNXZW9LRnVabFgzRW8yazJMM2hEQWc1ZGFiQ0lzRnhIVjdB?=
 =?utf-8?B?N2IwSyt6N0FXNWphUm5sM1Q0SFJvdFBrWGpQKzY3MStQUVd2TVNRTkFHQmpa?=
 =?utf-8?B?Uk5MUTZSek9YUDAwL0dkSnBPTmdnZFZnekpCYnI0WDBmbXZDU2FyMjQ2aEdS?=
 =?utf-8?B?MGFCdGV6UC8wbnZJUzlXL2xDWDJoQWtLN3RaZGc1STlCc3piRjhTamRSUk5L?=
 =?utf-8?B?dzA4YS8wNi9KL01KMFdrbkhKT0Z3WHhzd1F1MTFZU2ttMkpwY09XY2VsVVZJ?=
 =?utf-8?B?L1VaaW0wWkhUSXlJNFJmcUtFZDRUVU85U0cvamEyb08xUzB0V3l1WnJJbi9F?=
 =?utf-8?B?aWhsUnN0d2hGYVhZbkh3Qk96VTkzUmhLSnozVUUzY1Z1TVV6dnNpNVhFcmRn?=
 =?utf-8?B?TkVHUEhLMTFaaXhXNmprZHhkUERrY254UzdNcThkYU9VcDRmVUlSZkVWbHRi?=
 =?utf-8?B?OG9CQVlnamNGWUtaK1RqaytGRDdab3VQaFZMREF5OTBKemRCNklpMFBvOGVD?=
 =?utf-8?B?Y29VT0RleWptb1dESWMwcElNbVJEUFptV29iRGRlMjROZ2NFWHN0U3p0RVRH?=
 =?utf-8?B?cmprUlptWUYvUEVZVEI4NVVMYnVHVkVsMXlxTTdGVERqRWpWTkdoQ2p5aFBW?=
 =?utf-8?B?TCt0OWpPbXlrVlZCcVJjdXhWWnZGSkUxU3cveGJPY2t1bXV6SlE1dTRPcWJE?=
 =?utf-8?B?R1BaRDNXbHh1MzJjOVJicHBhOFg3K1R0SXNZZFN3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b426004-64ae-478b-f23f-08d8c164fb3d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 19:11:13.0575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPXOUD/cz7Wzye0SOlI2W8KnNn2Am8gaCQu7twlX7VS0hfobNGb3Awy2FVo5ytJrAFGv2kHM6ORWNw87i/O/Zh3/fHWRKjd/u3T9Z3guiDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5111
X-OriginatorOrg: citrix.com

On 08/10/2020 19:57, Paul Durrant wrote:
> diff --git a/xen/include/public/save.h b/xen/include/public/save.h
> index c4be9f570c..bccbaadd0b 100644
> --- a/xen/include/public/save.h
> +++ b/xen/include/public/save.h
> @@ -58,6 +59,16 @@ struct domain_context_start {
>      uint32_t xen_major, xen_minor;
>  };
>  
> +struct domain_context_shared_info {
> +    uint32_t flags;
> +
> +#define _DOMAIN_CONTEXT_32BIT_SHARED_INFO 0
> +#define DOMAIN_CONTEXT_32BIT_SHARED_INFO \
> +    (1U << _DOMAIN_CONTEXT_32BIT_SHARED_INFO)

There is no need for the logarithm version of this constant.

You do however want an explicit uint32_t _rsvd; so buffer[] doesn't
start at the wrong alignment for an efficient memcpy() in 64bit builds
of Xen.

~Andrew

