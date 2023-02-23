Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DE56A0A98
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 14:35:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500393.771747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVBkE-0004Ot-Ri; Thu, 23 Feb 2023 13:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500393.771747; Thu, 23 Feb 2023 13:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVBkE-0004Mb-Om; Thu, 23 Feb 2023 13:34:46 +0000
Received: by outflank-mailman (input) for mailman id 500393;
 Thu, 23 Feb 2023 13:34:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVBkD-0004MV-1G
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 13:34:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d47e3adb-b37e-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 14:34:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 13:34:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 13:34:42 +0000
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
X-Inumbo-ID: d47e3adb-b37e-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1OEcZZhRQOA/CSPFPuN8awYR62qRa4pgZw4qA38O6/4UFY/qUh37pygGW6u+cILbh8YqI2q3OsrVRGCe9MIWM8tScQnAvk375wfCLXlXrB+bnnFKX17GnnPchv4hJJDQV/oD8/xM31zJRP/eMyWQLfgxV1A6aGSrIwWJesW/s7GgV96dyC22VSTnZk59b/ZQ2Vf3migCztVI8Au1LmnrUZkvwsL20dcEzhMM2mHIIw/taW51s8EsYQ4cZ8g02tglSoRaNeCrdKW54ZipNHUZV78Ld5r9wyJvsnvnkA59/3KxTqlfEFF4sOQb2wE1d/Bdi505IrGLvM2oQyMh1Epgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDBEww+vtmrqli7kvOKODqkWWhCUTlM6b6MUXjIficI=;
 b=G3AQetg3wX1AANPEi7BoS6ufz0yLayHM06E9+kOztmVgpCTaXr2BjVALwJpzfV3yVk7jlBwfUPJBGLZ0Fnjx4Unz17dvjpqwxfLofaGCRM5NErP92dKt7DcW0et/XRA8TUZvimPgm3Y1Jpzxl0eFUx4rKGlvrT5Hs6oJHNIiQwCw8MPUnwPVQmTZr2uHsWiqBOgeawaIV4DuZgWQY+LFIY+Bhe8wErlBIFnY82MLxEskXMxeQng+hycTAk1h6b+0NpwJm9mtOszCaSRZQsZmRLfIGGyQxMTMeZG9lGkBOA0KQfkvIFz8L5DYy2I2iNyHlXLKJTm0mww024ED+NqXXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDBEww+vtmrqli7kvOKODqkWWhCUTlM6b6MUXjIficI=;
 b=pu6eJqIUGAnqjIA0fdKOdU37+3W0boRLaOn2TkHgCk0x7KCfDk+uU8HueXEtDGGHkytgaHzxqXykTguAgh8s2kwJeI8FBOaNiZ9WXJklLYaIm9b3MmFgZPrVrbTsBPkYIKXgBhgheUY4+6cCGln85Z/YlAe6Bimj7+7h32t6FwnLQUb6sk+JSb+dokXVvTcp//BzVtBaozlSegySBxEZtBp6bTMrvsMGXhxdILj8N0hiIptDabtdbD+OPIsb4tjepKY4tizm0elA0zWYw+81B7J8FpZQrL8DzCX8S1ugh7U9+5Ksed1jrhIHASdtiIvx9VnNZ457t5aV4N4Ah0nhdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de552beb-9fcc-a0b6-ac87-b7c1c0dd06b9@suse.com>
Date: Thu, 23 Feb 2023 14:34:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] xen: change <asm/bug.h> to <xen/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1676909088.git.oleksii.kurochko@gmail.com>
 <e21f8b59f22cc8bdb425a5002ed6e1473090b16f.1676909088.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e21f8b59f22cc8bdb425a5002ed6e1473090b16f.1676909088.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 343ad9ca-428b-45f5-b63a-08db15a2b7d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rT1tbVV1Trn/BJKWyjQUeBKCsGNC8a4itJaaYkGhhyHoJcW3PTcQvKrZNwXY3VCAcRJwAihL5MVoJBZQhPF2gtLYGzP+jEPTsBtPxAKl7s3wpFPkYPB7YPzcC8LKttaqd4/ZXNi/5G5gQS9PV2RbM0TQrt+iFn5tquMQJ4k4RbtkQhlDGDU2OEL32xDgOTL22wfopeE08sqrcXKwdCYfWfNmrS0d5FwMaUsJ8u0locM7ZwEbNY4NSB+9w5Xp1zM0xES43H4IK+ve9qrWzHw65gqQF2QyvmENUDRXz0/fMkUwFcHZ/TlwP57rBdfPIRZNqpl85XcKdCzOCEkAq5dWA4+3C+/090Piv0Rx0d9VJdc7y+Z1wRtm8QmMqxEyRbuY1xgzxd3Gnti4tzLuB/LHQKRnB2S5vjuKgTtw0TJqhL+NX1jEm7V1BCvNSr+WDP9CeBx7Td6lWEl6WzsaTs+uGm6kN9/yIAtMuMfQfD2TuTLfVpHgmLIubxINmzoKiJuXwMgeH9XKtxwn7kn8Zv23pNJajNHwS0fOnWrkv/lDKC6Q1C4cwLln8ioyZ5OAd6iLxG/RNO9ltRv3OLUdSBWlYNItVrm1jvNKsBmcAtyfjc59kNd1s3sHAhylQK5t1WobzeW31P2sp9ml6tP53ClY8B4Gpf0YJl9ph3u41D8fFNBXW3MfnBYbe8aTgqFbo8X4rTSONWtPzhcrUMiA82XR3J4enIbGijX4V/9ML+PmSl0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199018)(86362001)(31696002)(36756003)(2616005)(54906003)(31686004)(316002)(66556008)(41300700001)(66946007)(66476007)(4326008)(8676002)(6916009)(53546011)(6486002)(6506007)(6666004)(6512007)(478600001)(186003)(26005)(38100700002)(7416002)(5660300002)(4744005)(8936002)(83380400001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVQzV2E2R0E3SmRsd2JhdXUwdk8rQjROcS9zQXBjU1E2djdheVQxL05ZNEJt?=
 =?utf-8?B?SGF2a2puQ3cxUHI0WGpxVUd4VTNLTzJGNEtOWlhkSkdGVWEyZWpPKzFZNXhz?=
 =?utf-8?B?WFAwaEdyR0pPeDFLaWJwdk9iZ09XbzJ2SlFKWU44cXkzQTRadUJnbHd0N053?=
 =?utf-8?B?anVqWVQzSGNYajNxTmphSDFBUkRIaXE0UTUyUGE1ZUV1cmFlZ2dDNFpVcTMx?=
 =?utf-8?B?K2FISkVrL3NlTlcyTEd0dno3VWQ4cTJkUHlqanlmdm9SeDNKMDRtVDhZNzJ0?=
 =?utf-8?B?cyt0SFBnamJkUnBEY2ZRQUlCN1Y1b2JBQ0pPYnpBNjQ1K1BTaTFhbkIyVWdn?=
 =?utf-8?B?VE51QWQrcUNDUHd2N25xa3lOQi9PSGYvOHR1YVdESVpuTlgxNjRiRnFWcUhs?=
 =?utf-8?B?OWtLMVB0b09pU0NxNy9EcDVaNDlHd0V2Z3FlMEgvNkRrdlpKd0ZHYVBsZFVy?=
 =?utf-8?B?VjBPekgwNUI5ZzBraGtIQ0JRbWVsYjF0Y083SXhYcjZadFVSTGpVVHlIZDZn?=
 =?utf-8?B?U25naVBuNDZ6N3VLaGo2aUFaVWs0RXE5ckZ2d3JockpNanQrd29sMWh6TDlM?=
 =?utf-8?B?VG1CS0tMZis4R3hzOGhuUGczM0h0NUliSm5mcGFDY3RIN1VuTlVTU284Smlv?=
 =?utf-8?B?VWFSV0ZrM2dSUHcyNTZtbU1pbHl1UDRUSnE5aFB1L0dyQndteEhzUDBLWUNj?=
 =?utf-8?B?eFlrRXluV2NxRXdjMmk2aFdBV3pDMGxmZnppK3c0Kzk5UUFoVUZTWFJ4L0c1?=
 =?utf-8?B?cW9HaVkvSCtvcUJMT0dKTEJ6WTg1TW5leCtEN1VCREk4Z1NMa1Y0dDdOSmMr?=
 =?utf-8?B?TlEzaTZPOG8rWEtPZUYrUFdFM2xYTnZIR3h2QnBDVzVVUzMvTlE4WGF3a1B4?=
 =?utf-8?B?VGlsQkEwbUx1dUh5ZFZ0V1BML0FpOU1BV3FSWE9RakpISXB5aGkxcDdNTTFE?=
 =?utf-8?B?NmRycVFpWU9QV1ZyOFZ3QzN4NU1xbmRGZmx5eGlkUFBhbDJhTG5JUGxkSk40?=
 =?utf-8?B?eUhacE4wc3doMUovZUxzN1cwa0RlK3c2ckR2eU1KQlZZUlFVMnFqSEFHL3hl?=
 =?utf-8?B?b1FDcVVnVEVWZThsTnJEMmlydkVQWWpUUzFiZGtyZ1BjVWYxR2FReDl4MnpP?=
 =?utf-8?B?ckJUbmpnaW9RRHFLdTZNTEVLNTJxampnWEovU2FQTnYrbUxXcUl5ZDBhOXc0?=
 =?utf-8?B?VUkvcmg4YVBKRFpIazZKUVQwSm1sRFRaVWFxUEdjTXYvblIvN1ExOTFOUFZ0?=
 =?utf-8?B?di9HcGFYdW92OGVsditLeFI3VU5lbG9ESVhqMU5YbUdMTTR0NzNadHpVNG4w?=
 =?utf-8?B?SVJOSFZWd2pKWU1JQjRHMXgvT3k4c0F1WlQ4OXlLaG50SXBSZ1F6Y2wzcFYz?=
 =?utf-8?B?Y0NMdE5mNUpVaXZvdzNnVHFMbkE2bGNXczh5aWxnS2pFS2ZSNk9FK21DcURS?=
 =?utf-8?B?NGtoYmRuaStITHRzajNkMkQ5MXpMODlKNENzR2tXOXFOZjZIUC9Yc0VUZ2FV?=
 =?utf-8?B?VnBLZm1vUllSWXRCT3dqTkZTUFV3TFdyd2d6M04zNmh0WFViSXZscDdvUTl2?=
 =?utf-8?B?WjdXNHJMRW4rVGRhbWg2YS9ZNDJVaG9TeDJrUTZnZDBOYlpGQ3dLWnF3a3Na?=
 =?utf-8?B?eGE4Ykp3SEFTTDlIVEgzdTlFY21UWHdBOGRSaDF6M2Fld1E0VE16N1dDamp6?=
 =?utf-8?B?OWhER0lDR1NoMGhNb2RGc3VWMG5hT3dkb1RFQTlzUGI5Vlp6bncyVnBJdnRv?=
 =?utf-8?B?S0dRSjUzVVhpTGdSanZuMFAySnFPcGJlZnQ3MEU2cG80MlUxblNkdkMrRWVt?=
 =?utf-8?B?K1NZSjdQWVlTSmlxMmRIVVl4cjJIUjFHR09kcE53ak1lN0IxbXpiZDgvREdq?=
 =?utf-8?B?M05NT2pWYS9GclhLZ1gyc1hqeUtyMkVLaEhzOE9OQ1hwS0k5dDFiSEFLVE5u?=
 =?utf-8?B?elJkTWE5bVNiK0pnaldZK2RIbjNDQ1FZem4vczc0SjRtYWVxQm43T0VQSVkw?=
 =?utf-8?B?QWNEU0FOdFRXYURwbi80WTRTa1dCeFdhOTFXRUxPajd6dkNtd3VybW8xUUxv?=
 =?utf-8?B?eW05TVVBcWFBTXVmNEtiYlVhS09ObzJzWVRqRE4rOGRZbnJ1cnZ1OThlNzlM?=
 =?utf-8?Q?0U6eqfGnm8fzlh64zFs5cM7mw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 343ad9ca-428b-45f5-b63a-08db15a2b7d0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 13:34:41.7100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zt21DOZbJasUtUbWRebQYwy9LwdcCGxt0BEh2GIxzkXCulUH66ChPMlQ7u9a1jXzXIzvyZrazTTeCF1qsUF9UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

On 20.02.2023 17:40, Oleksii Kurochko wrote:
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -24,12 +24,12 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +#include <xen/bug.h>
>  #include <xen/inttypes.h>
>  #include <xen/stdarg.h>
>  #include <xen/types.h>
>  #include <xen/xmalloc.h>
>  #include <xen/string.h>
> -#include <asm/bug.h>
>  
>  #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
>  #define WARN_ON(p)  ({                  \

As just said in reply to patch 1 - I can't see how this would build
at this point. There looks to be an ordering problem; you first need
to remove from asm/bug.h what's now also available from xen/bug.h.
Possibly parts of patches 3 and 4 need to move here.

Jan

