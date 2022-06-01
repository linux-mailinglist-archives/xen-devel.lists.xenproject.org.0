Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1826539D4D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 08:38:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340243.565225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwHzF-0002xf-2z; Wed, 01 Jun 2022 06:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340243.565225; Wed, 01 Jun 2022 06:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwHzE-0002uN-Vm; Wed, 01 Jun 2022 06:37:44 +0000
Received: by outflank-mailman (input) for mailman id 340243;
 Wed, 01 Jun 2022 06:37:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwHzE-0002uH-1l
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 06:37:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56c3404d-e175-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 08:37:42 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-vzrmx1faNX-3ogzMxevZnw-1; Wed, 01 Jun 2022 08:37:41 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3952.eurprd04.prod.outlook.com (2603:10a6:803:1c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Wed, 1 Jun
 2022 06:37:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 06:37:38 +0000
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
X-Inumbo-ID: 56c3404d-e175-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654065462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qlp3TaauqFQczu+72cAPOsSh/Z9upua5oV5Z+S8Lczc=;
	b=bd2qRB6fe8dyt97YRr+NaEeP54qWwR+MRDB/ttEQDnJo6NNfQz8FP9m+3p94AEaThxKeAf
	uZFcocEOAY7YJww7HWn6K+DJbh7sTVfE5hQmLONXgwV1jOOcEBjjDacxm5JKi9RyOjuiHf
	ZWAfi6v8zzL9Y9sPH4b+f0vJj2z0pvA=
X-MC-Unique: vzrmx1faNX-3ogzMxevZnw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jv0zS+stuwUCXEz5Kgt8zNtvmlU3x3c4Pkb9Z6AD2Mj54PI86USzcYB29USy/vIPjy9rzu3bERNkrlD0oI6+SmGAbcTqqLap3fDiuKQw7Uupc14Fjdj1juQiaAAiFzH+TFJrvffzNKYLojzJ2n/TBU/JAvAQuyOWzYW5dV8hLzMNZ+r25HDHS5o6SXPt0M3n5eti6YU6Fhf1ldKlSnFY6mFU7B0y3LA4c4yXsFnltribG9XUQmr97R/L8Hp5W/E0QFhm7n7swFqMk0hS4gz4ESHAxMXHfnrVIxmyVi7e7/NwBSUeU6zX2EfkHKzPOthxlY8hjSUEqOQf+DSG4mR2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qlp3TaauqFQczu+72cAPOsSh/Z9upua5oV5Z+S8Lczc=;
 b=G6Hv9Hg/N1ul/XgsAClCxSehwayrLJ8DcXG0aXen1kNVsEyyKaqInNwqpb/heTB6oJpjU4oCi3puq0eBokH1QyL3gjkcyHd/BGFt1S1FwRTzQrMnobhPSPnGUWpD3thiSudiapImuyvv97kPvWKzzXOgs0jNRkASlhA8ne2YEUnJG5ev5cQiO+KRf8V8rVvuUvarD88JE+7BDGq8zrdkdUguD/oZ+hBNjCZwTPy/eX4pGEERXRMzXdX8cLfB4Xy9Ew3V5Bi8KDuWVXF7V1tfx1MHN4uzmewBj37ZLTaN4zqu6Q0R9VblSQurDJpsHD1eTSsAoPzHyfOle6xMAR6UAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <239d1e45-7094-42b5-027c-6697d0e23f0e@suse.com>
Date: Wed, 1 Jun 2022 08:37:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 5/6] xen/riscv: Add early_printk
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>, Xie Xun <xiexun162534@gmail.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1653977696.git.xiexun162534@gmail.com>
 <016c56548eee75c2b713ef90e4069690c0ae11cb.1653977696.git.xiexun162534@gmail.com>
 <CAKmqyKNQJsUSLAgsMB0arkT3zAXzzm6QF46ZpwDN1GdpvRQMSw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKmqyKNQJsUSLAgsMB0arkT3zAXzzm6QF46ZpwDN1GdpvRQMSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0067.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::44) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e6b8a28-fe4f-4181-446b-08da43993872
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3952:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39524F40790E8AD157257591B3DF9@VI1PR0402MB3952.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NslA2FLEY/y4eygMlAvIDLA8J2ok3/wmcQ5EqA64p86xPHNgpWB3byfQ1whSv/mR+kvteOYci3AbgY/hVI2DTRjXl0c/Xg3k8EJS58jfVg6VkPpLmFGBpKqx8lvH5UX/Ohm0/6pyxUp18acgSdeQ2OFyA7vvczbbYCfYXZNMWw0uFZLyRZGAqFcHzW6Lni4Tkj/arkmggG/CgRMJ9RHN/EhirYCSTFMoQqKN6oAzOjk4em3rq5xsR9q4wXZoce8kK63JAAT9gekfOGHXJLtD+mSZhtJBEcQFswNF9Rnel0ZoizY4b0Paj/zJsV6ME0MrDVyR6O0i+3BgNV6iPVlT7i5lkakNKf0zKneRG0JHytyMk2YjdHhXouSUCl5DQEwc1fsSHD4FusSlNfUNAAbeQwRzn2E6CHNymYO2gA/+jBzNd1JI+MYrIhkhPOa79HXNuCt5PZMhn2p4jOvh6s5EEBPWYMueY6KUt0O6kwz8xHNP8Byrfh30M02NN7P+HJDqBUHMfZpIYM2FL1rSwW2jK/GTRyz0CZeNjmQCjFvH8b0cVopj1UqrFoZh9k1+c0wIzJrXYtOiRrUX93fIzhLfPtzyB/DtrwoGgLwDeGpaKyw1yMQLdAMdcx9qSNzrMjIUN7gNmkzVdZF/h1bIyM4r+qLtnvovn+UwZArLiAc+TB5lbhKxWe97nHm0Rrehe9kc8EMH/H2N+Vg6iNXjLMvKycr9ad22/c5rPvXKU43Ppwm1afa/bZw9/FnC2ZmteFtjkEhdXwUo9J7rV1ujb0N1izXNWRh1KBTWZs7IZjIKSeRS32OcuUHOnzzulxAhNQ1S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(8676002)(508600001)(5660300002)(8936002)(4326008)(31696002)(36756003)(38100700002)(316002)(31686004)(966005)(66946007)(54906003)(66556008)(6486002)(110136005)(66476007)(26005)(6506007)(2906002)(53546011)(186003)(2616005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlBMdVNya0xvSGFKaXNFeXE1VGRDdjB3Y1k1ZnVCSjdhZHNxQVMxMTdxdEh0?=
 =?utf-8?B?eWlhelU2czJnV0pTQTFiWWJtWXJBMmxlK3UzdVVmZjArMzVsbm5PTUl3SkJV?=
 =?utf-8?B?b1VLQXAvWjVIazA0Q2xmUk9XSmt2a0gvMm9sRk5DNkp4RjA0VS93cStpem1H?=
 =?utf-8?B?bW80Q0hKaFlRUVhWZ0Y2Nk80TW5ndEtMRTdES1JUTkVwSk1GQkpVSDhGajRP?=
 =?utf-8?B?R0pvT1hud1doTzg3eUIrUy91ZFg3MllWc2tLTnpMR3NIUjBVRnBRWXhwek9h?=
 =?utf-8?B?T0hTYkNZQVIxazVFQTF4TEx1WEhqZE5TRnJQOHc2dC9TUHgvZm5LK2QvbHdX?=
 =?utf-8?B?Ulh1cUhBYXBsb3VFM1pwSzRVQVF1UEZjaGN1MWIvcm5kVEY5YmxIeUM4a01L?=
 =?utf-8?B?N1IyckhBNUZTMWdRNE5RVHRNVHVXc05QWlE2TU80dkVjZnZnN3hiTm9BaGdx?=
 =?utf-8?B?SlFOTzZ6QWlLMERsUDNLVy81V1RyWUNITjM2MGpHMS95SHA5MWplQVBLei9H?=
 =?utf-8?B?ZlRZWlBnVEZMdUNXYStTbXo2WEJWZmxOTGJ0NVJNajBMelhxUUloUmczR3VT?=
 =?utf-8?B?WEhlQ0xIektOVnc3L1ZYMkFRZmI4OEcvT0t6bUFmUXFUckxNSjl2WTlnV3hi?=
 =?utf-8?B?QndHaHdKaXB3SEFNSlhLWnQ4bWN6UmpLK0J2SGpZU2pHVXNmR3FJTjVzTFR0?=
 =?utf-8?B?YUFJR0RPV1VkSmpaNVFDTkJSTlJ5ejdHZUNnLzY0TEFhd1RhWDIzTnNVTUVL?=
 =?utf-8?B?UWhwMi9ZWW9rZVpHdDArUHhXMDNHZkUzcnh0c0hweE5PM2pEYkRjQmRyMHF2?=
 =?utf-8?B?VHRYM2tGa1JMUDZuZWNTUnA3WVh1WjFDOHk1L2U0S01FSGFObXlZVGFBdnd0?=
 =?utf-8?B?ZXNFZXVQK2hSU0V6SXFCdzlGNS9pcVBpZmpQL1Q4UjNaaHA4NXJGTURNK214?=
 =?utf-8?B?eWZ3VzhLZ3Y4OExMYnlTb3lZWm0yazVIZ0w4dzR3eWduNHJtUGd3R3pINXN0?=
 =?utf-8?B?UGVkRG53eVV4YUxueTBHa1QvS3djUEdaU2FBdDJIRFpvelNpeVZ2TUFvMHBk?=
 =?utf-8?B?ZkhhYVh4QXlld3lVbE8zdEw3Vm5WaUdWV1Bxd1hkZ3JTa3d1OHlnTXVMRll2?=
 =?utf-8?B?d3JJN3RMMVlERC90bG9paXNkaDlGRDYwWktJcnZmQmFrc3R3bHM2V3JFWGxX?=
 =?utf-8?B?Z1FReUd2ZFhWZi92NVEzN3JJUk9UQUV0eFBLVDloOC9mN0QyckVWUHBZUFFR?=
 =?utf-8?B?M1BqVjdQbGpEb2NTeVNnd1djTkdvSTQrNUhUeENDRWJwVDFHQm55cUQrNzE2?=
 =?utf-8?B?ZyswTWxZNnhtUFNEKzduTkVyTjRSLzRZWUtLVzZGSXZDYzJraEhFMS82LzNW?=
 =?utf-8?B?WjYwajFMem1ub2FTUWNKSEFaZmNERFNub1hvcUZkWFowVDlyYmlvMlVxVCth?=
 =?utf-8?B?aGc0dE9tbjhNcTQycERvTThuMXh3aDM0T0gvQXlQaTFNckEwOGloRWluNzVK?=
 =?utf-8?B?N3VzM1d3V3phc3BLTXllNkFwRW1hdFJyelFCNkZ5Z0x1VlhQdW5ITFpRYnBQ?=
 =?utf-8?B?SC9rNlRrUHhrNkpLUndQSUpDUHZwcHFqUktiQ0REQ29jTkpZR0hpbGdQbzdr?=
 =?utf-8?B?bFVsTmFJRGdQR2xNdUhNb1g5OHFWd2VPRWJ4bnpOZUh0OEVpVHQxVS9jNlJk?=
 =?utf-8?B?bHRoU1NSbnZVN2NLUW51T0lsYmdydGlQL1pwYlFSdjU0VXZxaWpPTkdpUkd1?=
 =?utf-8?B?dnFicy8yQlJXaHovS0ZaVzlCcVpQN1drTXViWjJ2L21xU2cvOFFXejEzc216?=
 =?utf-8?B?TWp2WFQ4UnFDNTlTTlpTRzFsVktNY0FLRlBEMk1vaitVOXhtbUhuWEgzQVFz?=
 =?utf-8?B?cFNpR3EzQTc2UWxPYUo2V3ZabmdWWEJ6d2xMWlh2bUdyMU12ZTJaRGZ5TDBB?=
 =?utf-8?B?UFRiR2F2N05FcWdDRXRVR3loOGJpdTZXZk4rdkhBUFlROUtSd2JWQzhpc3dY?=
 =?utf-8?B?SkFMZUwyTjIvRWY1bHZhU0czREtERGdOOGlpRk51c3pnVkE2Q05PVWt1QnU0?=
 =?utf-8?B?M0Y1eXEzNGhpYi9jT0hIWXdlSXlwc09JTlBlMXlGYmlId2tvaXBvUzVxUUlv?=
 =?utf-8?B?WDJaTmlNMFdFdWNyTEpmRTF1UzRrWGZxU3VQdTVkbDhCNnpadk96eG9DQmlX?=
 =?utf-8?B?MVZOdDV4Ym1lalVyY3FkeGxHME8zSlpIdXpjeUVpbFlOYXVEQTVRVjhMTWJw?=
 =?utf-8?B?U1NjcWRLR0F2OUFzMDJhYXprd1BxeVl1UjJwaDI2bExvamp4Mys5WjBsK0pY?=
 =?utf-8?B?cXp3bDJTQ21hbSs4NVJsRU5FVmlVc0lwOEs5dHJPejk4eWJ2bjIydz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6b8a28-fe4f-4181-446b-08da43993872
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 06:37:38.8197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlT5bGHNAhzu7iWvGRJvOqkUQR430ATgTsgRp1pDy61KL2j1b6+fN/0NGzh8fQl5MKgqNutBA2UScQjnxN1Atg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3952

On 01.06.2022 05:59, Alistair Francis wrote:
> On Tue, May 31, 2022 at 5:09 PM Xie Xun <xiexun162534@gmail.com> wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/early_printk.c
> 
> This should be named differently. This file should be called
> `sbi_console_early_printk.c` to better indicate that it's using the
> sbi_console

To not go overboard with file name length, perhaps sbi-earlyprintk.c
or sbi-early-printk.c would suffice? Or, if other variants are to
appear, *-sbi.c?

> The SBI print functions are useful, but they have been marked as
> deprecated with no future replacement (see
> https://github.com/riscv-non-isa/riscv-sbi-doc/blob/659950dc57f9840cf8242c1cff138c2ee67634bb/riscv-sbi.adoc#5-legacy-extensions-eids-0x00---0x0f)
> 
> For the initial port I think it's ok to use these, but this isn't a
> long term solution, we should aim to migrate to using the standard
> hardware UART.
> 
> I'm sure Xen already has a driver for the ns16550 UART so it might be
> worth just using that directly and not worrying with the sbi_console.

Of course we have a driver for that, but depending on the device flavors
in use on RISC-V it may require touching.

Jan


