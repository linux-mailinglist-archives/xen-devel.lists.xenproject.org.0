Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A89A46B9D7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 12:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240923.417706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYMt-0006WR-73; Tue, 07 Dec 2021 11:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240923.417706; Tue, 07 Dec 2021 11:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYMt-0006UY-3P; Tue, 07 Dec 2021 11:10:43 +0000
Received: by outflank-mailman (input) for mailman id 240923;
 Tue, 07 Dec 2021 11:10:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muYMs-0006UR-HF
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 11:10:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5039772b-574e-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 12:10:40 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-ZbzYjggmO5qJV8I_J3Rb_g-1; Tue, 07 Dec 2021 12:10:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3534.eurprd04.prod.outlook.com (2603:10a6:803:8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 7 Dec
 2021 11:10:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 11:10:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Tue, 7 Dec 2021 11:10:35 +0000
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
X-Inumbo-ID: 5039772b-574e-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638875440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UkGzC1LW1LA9UOGe7ajsRQ7HLHHe0kpj8Wpyyc5+5pM=;
	b=EB4dZy6J6D6x7/UDUaR+wv4Wl/KzmgvWgHa2hGBmGsSXkLYPepNeumZGWlOoOrwl2oFsCW
	e9RDWWQDuIh/BbF2ygUP79p47WM1ZiLP0GWBLXTv3A09yww06Vmdrr0Opvq7RvRexEnwnn
	9f46km9qq90dgAabjWV8hzITOqq/VWM=
X-MC-Unique: ZbzYjggmO5qJV8I_J3Rb_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBxRv/QA2rnHruMoIJfz7I9jeVoSp0c+jJiy6CBPrrN9Q3pVyU7t5U6vE5rOs1L3ML1xmJjopfGJi3m+khoKKIUhKxge38figIcQmVmtemw4Y6xm30jbW9svXEmQxe9OOkoSnz3/v+DqEMdUzJxwcUhbnw+auCDKtMZlay0IB2H2FTuJflnDuoqZnwCK+jvRvGmZ52K29u2OORsiqynfgXtloIIWfllRfATX1OBYZJyk/zKjO0d0HzqMbEkFKtyMGhECrRn7SB2tLqf1/AL//xivUS7eoqIV+WSN7R+EUAbsUef5Mwsz+NwwUav3De/ECF53JEvlbwShMi2Bf28odg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkGzC1LW1LA9UOGe7ajsRQ7HLHHe0kpj8Wpyyc5+5pM=;
 b=gCon0ntCMvqJf9j3BfdkY2XZDShVuCC/RbhR9o4RNgwffAuq68cISSZMP9Db5orFBFphILUhk4YZwtbKcs98I4ICUPFfJSvS7+CoOHnhyBGEUDTn95Ky5830jzNplHMD9ALfl1S/Fyn2cImrRvMbsFajWWaR3WlCqeveI2JlIE5xzgHj8qWk2IerIgVDZqty461H59vtgyOc+h8/Td5iomrgOapz5aN6LmWEp60isW2yppsRhawFgtTmdLRWiVByBd/poxpS0JtnYVgiB03+I9jtopMBPGy6zJzwazeA7M9NHPvDRtiO4mHMeIV9mQEhCujQQa7L3wy/OTNaaBtwSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b2eb0e2-a07f-6ba2-8f59-b7c207ed30da@suse.com>
Date: Tue, 7 Dec 2021 12:10:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN PATCH v8 12/47] build: build everything from the root dir,
 use obj=$subdir
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-13-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-13-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2556f73-f6d5-433e-e589-08d9b972323e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3534:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3534F68EEBA96FDCC6AB1D20B36E9@VI1PR0402MB3534.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bRhl8Yg3N1uGKWIJWQyw75wVbhE47dA0PdiNLXTAmmdAG4h6B6Q6OnPoqLHjqHXw7OQL0NUadmGpfDqixLZ3YqUCTye5cRTmuFyac0ya/HooE4r1/+BTatZkCjoh1JvaOi+7nVfdoDyxgA0CUfl5sqkfLZC0vMY2cuSXRDd6fNZgZHuG9P6jVVlCGcH+GqqqrFtDlbwz3/+kcj5TyQLoGp+yXeHqA5+VX4rfSuAii2myXw/vwR53aPf+36/gr+0JqtL5+oB5PsanUonK5C5+qJ5URVqjZdjqkeESCco9md7r3ka9miP3drz41ov9F0UWkaqv4rARkK8jtLE3UM7AtW+KtXPU0OhyzNKqPvByrR1esy4k1crpxWKvNMaZ0+ejhUCzwlTmOzb8Jx8S2C/ztvtmkpOJFlzhhUdJUzOELL6QUXR3GX5HnAdTfpthdOh2Y2zHEXl90XWr/JnrK22Wtqog+EOS8J/MzHTODBCkyYBNSFZKEDFn8TkMLWqhCFp7KFOkL/NCw/ngHlBixMJspnWwgzEEnb1c/6YV2lApoWq5YEdXaVFPByoVbWQ347sK7XeiG3/3z2U8mas/cjvx6dOMz0OpyG08lggol6E1EIZznT1VSGbsDlzrpMdEiMCiFYzsZcxjNiPKh7kZZOsp2h7n4mvfi5/frTj8jUdJBMNLtL/HYpT/j86QMtx+xceyJNfrPVhsPwil0S7+bWzUZgKE3vIEfBha+KRR6k9xfZBzRSYqnKpbzmdKdY0hKZsz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(54906003)(6916009)(66946007)(31696002)(36756003)(16576012)(316002)(2906002)(31686004)(4326008)(66556008)(66476007)(53546011)(2616005)(86362001)(6486002)(26005)(8936002)(38100700002)(8676002)(7416002)(508600001)(5660300002)(186003)(956004)(155303001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzVsUjFKK3lEa2NZbkRTYXJCczFFNlpXT3lCVWhzbGNhdGY0VXcyUGNXTElv?=
 =?utf-8?B?U3pHaHZHeVdPT0JDWGxPcjlSUlhkUEptd00vUU9mRVNldlFSRTVRWEk3TlN4?=
 =?utf-8?B?bzVHSEZTSkJSUTR2bnF0QlM2bnFBcEdLZm52WW93bzRTd3A3UmkxYzVFa01v?=
 =?utf-8?B?TGJPSnp4L3lJQ0tHelVaOHB2SEpzR3J1QmFleGs1aTdORU9OOVZJMWp5Nmxw?=
 =?utf-8?B?VXJ1MEdta0F2UWVsaWp0dUhVVVZlb1BxbUpHU3lDbEc2TmNBekJPL3ByaTUv?=
 =?utf-8?B?bG5FVCtYbEJ6QnNXL0M3ZkxaMUdvSnBpQnMrMnlSUTgwclVlM1BkQmppNjcx?=
 =?utf-8?B?dFA0MGljSndObEhkblROaUR2Zzc1ZnZIeGlHYWZUKzY0dFNwWEg1ZUYvcm80?=
 =?utf-8?B?SmlQTGR2eG9Wem1XaS9oOHROTHBxQzlQTm1xNjViSGN5MVBqdDVpK1JQK1g0?=
 =?utf-8?B?RjNvR2xxSDk4ZTRXeFRweVNSbS9tbjkrSEdpZGhmWEdTVmYrUDNZRlBKZnlu?=
 =?utf-8?B?NFAxOVB4cTZzTVlPcTZZRVpiNUpRdnd3aXV5Rk5nVlZkSDltUGdZL0NSQTM3?=
 =?utf-8?B?SmZjalNZQXNGZ214QTJtVk9zcmFic3Q5THJDMndRb091eE9xY0dwRFNzZUgz?=
 =?utf-8?B?ZmhpRjZ3RHhuQUwyMlZkWTh2elVvUzBCZFM2OFNvN2hVZHE4QXVzdm5YRGI4?=
 =?utf-8?B?SHB1YjdDR1RwZ0hVelBsRUwrTGxGTjhxYjVCMldYNXRHRHBVdjA3QXE0dE1s?=
 =?utf-8?B?Y21nTk5ZMkFOa2FXdmVqWk5aKys0TDRvYjU0aVI1NXJRbWNucFAxS043NTlw?=
 =?utf-8?B?UldHOHdHT29iVlJHQk94Ti9LWDEzYmtBNDhZRG84WnN0UVRwYzlXNk1zVER0?=
 =?utf-8?B?WmNLbDdOY0dQdFNzampPY1JTb2ZGK0Z3MUxqbTEwRXE0dWlLdVBLR2tHQUVV?=
 =?utf-8?B?VTNDUTJqRExHVS9QYXlhdDd2dEQ3aG5nRnF5SytSOGpndWIveWhZK3NyVVRy?=
 =?utf-8?B?T2tVOVdhcEUvVWdhbGRBb0xITGFwNE83ckIxSGd6TmRGOGRONFVqclBURmFY?=
 =?utf-8?B?Nk4wS0dZTklmUlh6ekJVa1FtYjFGSW1Fd2kwS1ZlbWpPd3ZKWjVHWndPMXdq?=
 =?utf-8?B?b0JudUxFd2tTckRSUUkyMnNaejUvYVBwUHNsaENsTXVmMHdGb2FZWFBlbCtE?=
 =?utf-8?B?VEhvR3UxcWQ2MmRiMkY3RWlYc2U0ZVRSQmg1bTQwSkJWcU56Ynp1QXZ5RFhJ?=
 =?utf-8?B?ckNNcVNvZnlsMmljQ1drTlVvY2liLzBZQk1IUUxDS2MyVjhqRGJVZmN2NDVp?=
 =?utf-8?B?dTNWcTM0eXpDYTVEMk8yUU5vREkvN2h2OVV3V0ZDRU5LcUh4SzhxQnBoZjdK?=
 =?utf-8?B?RVNhK21kSHJWb2RLZ0dBcWZLUU1BWFRDUTV3NzdPeGVKNU1xV251R3B5TGpN?=
 =?utf-8?B?S21SOGFML04rbWlFZXRRdnR6eTB3dnJUT0hHbEcwRUYvUHFMOGJQendFekZz?=
 =?utf-8?B?ZVRHZkx3NFRVQVRab2Mvakd4QVo5S1ZINjJ5Vk9kemU5a0F5d3FzODJGZUF3?=
 =?utf-8?B?bjU4TncyaElJRGRCWlV3ZnptWnJ0RFU5VkFKSjBSTnFpTnFDTmpzRkRLTzQr?=
 =?utf-8?B?YnFyT0UyUnVHajAzTnI5V2NURHdkd1NwSTcydWJIQTJQYnNMYXgwUDhTeG5v?=
 =?utf-8?B?bUVhUVRuR0hpbEVLbGpZSzE5Wlh5c3pYdGU5VmdlVm9LWkhqYmFPUlNuOWMv?=
 =?utf-8?B?SzBsRzB3SnBoNkMvbFdjL0xSR2E0RnU2L0RXT0dEdy9VZXprVGF4WDhmYW5l?=
 =?utf-8?B?OEVCY09scGFqY0NMRGsxa2c3RWk1TUNDdGRRYkk2K0RqclZGUFBFZDBBNmJ6?=
 =?utf-8?B?bFVsUWp2d2JWYWxBa201RlU2V25ySWY3QVVSVTBGM2hxS0hXMjdIRHJlQ3VC?=
 =?utf-8?B?eVcrdEJLVmZ6YlhTR20rMHNRb1hsVUYyUmlodERKYmRxY0pzYldjTlVUZkQv?=
 =?utf-8?B?THJvNEVMTkR2KytqNUJhaVZUY1BPdzJEMTV6dnRvM1dQU3pPek1RazBUQzYv?=
 =?utf-8?B?bG1KUTVrVXYrcVY2aXBSV01BTnVWYW85N1F5SngzbHgxd0NneFFjQWF5blM0?=
 =?utf-8?B?VzIwNXpSbEk5UWVqbkZBUUkwTVpMZ2h5S0l5bFhCVE5uRW5qSnoxeWx2cTFV?=
 =?utf-8?Q?OPsySBM4THL5GdD2wHW4snQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2556f73-f6d5-433e-e589-08d9b972323e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 11:10:37.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oyw6rnTlU+ETsLM/nGaQ3tWN+8iJSciF35jZn75LhK73nKvmdJcECnkAX08eOQIHK8XsMriUatAfW9DuS8F87w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3534

On 25.11.2021 14:39, Anthony PERARD wrote:
> A subdirectory is now built by setting "$(obj)" instead of changing
> directory. "$(obj)" should always be set when using "Rules.mk" and
> thus a shortcut "$(build)" is introduced and should be used.
> 
> A new variable "$(need-builtin)" is introduce. It is to be used
> whenever a "built_in.o" is wanted from a subdirectory. "built_in.o"
> isn't the main target anymore, and thus only needs to depends on the
> objects that should be part of "built_in.o".
> 
> Introduce $(srctree) and $(objtree) to replace $(BASEDIR) in cases a
> relative path is better, and $(abs_srctree) and $(abs_objtree) which
> have an absolute path.
> 
> DEPS is updated as the existing macro to deal with it doesn't know
> about $(obj).
> 
> There's some changes in "Rules.mk" which in addition to deal with
> "$(obj)" also make it's looks more like "Makefile.build" from Linux
> v5.12.
> 
> test/Makefile doesn't need special handling in order to build
> everything under test/, Rules.mk will visit test/livepatch via
> $(subdir-y), thus "tests" "all" and "build" target are removed.
> "subtree-force-update" target isn't useful so it is removed as well.
> 
> test/livepatch/Makefile doesn't need default target anymore, Rules.mk
> will build everything in $(extra-y) and thus all *.livepatch.
> 
> Adjust cloc recipe: dependency files generated by CC will now have the
> full path to the source file, so we don't need to prepend the
> subdirectory. This fix some issue with source not been parsed by cloc
> before. Also source from tools/kconfig would be listed with changes in
> this patch so adjust the find command to stop listing the "tools"
> directory and thus kconfig. With a default build of Xen on X86, they
> are a few new files parsed by cloc:
>     arch/x86/x86_64/compat/mm.c
>     arch/x86/x86_64/mm.c
>     common/compat/domain.c
>     common/compat/memory.c
>     common/compat/xlat.c
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Bob Eshleman <bobbyeshleman@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit and a remark:

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -22,6 +22,15 @@ export CHECKPOLICY	?= checkpolicy
>  export BASEDIR := $(CURDIR)
>  export XEN_ROOT := $(BASEDIR)/..
>  
> +abs_objtree := $(CURDIR)
> +abs_srctree := $(CURDIR)

Nit: In line with e.g. obj-y I think these would better be abs-srctree and
abs-objtree.

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -80,6 +80,9 @@ endif
>  extra-y += asm-macros.i
>  extra-y += xen.lds
>  
> +# Allows usercopy.c to include itself
> +$(obj)/usercopy.o: CFLAGS-y += -iquote .
> +
>  ifneq ($(CONFIG_HVM),y)
>  $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
>  endif
> @@ -129,13 +132,13 @@ $(TARGET)-syms: $(BASEDIR)/prelink.o $(obj)/xen.lds
>  	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
>  		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort \
>  		>$(@D)/.$(@F).0.S
> -	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).0.o
> +	$(MAKE) $(build)=$(@D) efi-y= $(@D)/.$(@F).0.o

Hmm, hasn't the efi-y= become unnecessary already by patch 6?

Jan


