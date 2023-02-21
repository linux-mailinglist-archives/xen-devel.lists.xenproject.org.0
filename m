Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D7569DE41
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 11:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498744.769639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQHg-00083Y-I5; Tue, 21 Feb 2023 10:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498744.769639; Tue, 21 Feb 2023 10:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQHg-00081n-Ef; Tue, 21 Feb 2023 10:54:08 +0000
Received: by outflank-mailman (input) for mailman id 498744;
 Tue, 21 Feb 2023 10:54:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUQHe-00081h-Ur
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 10:54:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f54f0cd-b1d6-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 11:54:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.18; Tue, 21 Feb
 2023 10:54:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 10:54:03 +0000
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
X-Inumbo-ID: 0f54f0cd-b1d6-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoeZMT5pdVWWhdCOCfDXOBHPG4mLSc21vRlzAxa/fvWnpTHQwV3fm226IgHzgETAL0Ya2r5zpdShrez6eqmgl5OaxtNmzxoACf7rFdKxPaS+2pOVobp2jq52mQSpC+p9XjTEnU/rNhdhoLXB3Z4HhGdK7IShSVSguHFQSveAqpnFPGVwqacq9e1cfk8WTbxYcun8jI53MB0nw4tM3YXAahdJpCSqrZRDC/ti1m9QvIReDoJDhrthhspdZ1FXQylRO7HRjYeWMP9g+ODxFQCp1QY1+mYC68MTfRLlLkYnqkOMgi5ZCRy8b3UlYw+cQjR17NmyC08a2MbpL/neZW/KQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmXT8biT7yqitiSgV4ZytugcbZRYwWDboWRvFMT3RYI=;
 b=Y1Nfd9AHBqPDbX9boltRV8tzCF54JjsvyWsjbyBbqHSewWOH8LGqDAuAqHV3kLumjaBGIPb7hb7ulcpoAM/LmUXnxb+37NAgOGpDsm12SUGJ2+f6DmhyW9aN+mGdgEaITyG+vY57VLxW1/nYKkyNkcZrf4BryHZ8HwOL+u0J3OSzAsu7DNFKAkDefHPUcR+lXjIcTppkkbG4L3Ewr9SltT2VlOlzHkHDv+HR0waGoqJ1rhpdkNzQYOVph6S6pvjJxON4DYkaQ3c5xTpkWVzJt3nFVJ7U0BJbML6S5K2kRVXCzfAI91gLKzwlmhfMcgiFTYEUUjOHbUnXtgplU/QZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmXT8biT7yqitiSgV4ZytugcbZRYwWDboWRvFMT3RYI=;
 b=2hBgoUWAawekn1KFaCvJhhusJOGzs0iUqixMBPBYYJaOVzydzaw0c5VcHLJEOtF5wLrSypcfL27BubiNnmPyXaaGmBlkdmQ9QmzyioRTSbvprqCWmSAE2rd3O8Q+M2/+TPBJIVayjQi/UEDThDrtQNG0h0p1zOuNzY8Hl0dd9zZeVafKnO/kWDQMH+qhx/XqUNbSLKKEf+ajdaV6YSCz1tulU+BtdXbSJTbqhSwa4r9Fyg5tTU9JAZwdEL4wBmvWNhIPZ6kGTuFIeFktuha23WZH9B7xkHa4aCNWVyQx5rjWXKPQV6l8pxKeFJBUrqKzRSByjl3sl8vnmvxuWV9dLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <588323ff-f8cd-5670-789f-65eeb99c495c@suse.com>
Date: Tue, 21 Feb 2023 11:54:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] x86/kexec: Annotate functions with ELF metadata
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230217174814.1006961-1-andrew.cooper3@citrix.com>
 <20230217174814.1006961-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230217174814.1006961-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cddb6c2-b2f2-4b22-c1ee-08db13f9f250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8VXl9ncaTrKaIsWI77LZAKjEqQUq5358YDZiy31LMDoFOEbPOCpen6ahS+rIlmQIxu215HMuADgoWvOWHGhcsq/ZAaAhJh7iVZATAzguJNNONgnoOb8Zt9XWIoyaOd1a3KRyMf+Kcc92Yr6HFNrQedIj7VPqhl4cAmlW8q47H7wafqxFOohgo+19+D9w/7ScXVznnI9Grc7VJ+ck8mlssdNdyX2Y38DX5DVPUS3BwZ7B8yo07LJl3yZ4397VcMpfT2BAw6bFEj99unm52rcR1cS2XsvXzjN9Y88wkpyx+YX2UJ0NkYYNYKWwzj02M4pTY0oHznGfXqb/MvRIB8EMb5dGmpAQ++/54X4b4asYi048h83vZFvr6uelGeFbN0RIcymeNXKzuN6dGcP4ZOSRyS133itbQ2Cu0uEgd/aGkuXKr4lAr/2LkRPyACUIPkIfNseRINbY5ALDj60+or2gCAhA6vJ2EoopzNCqByO78/DbZQALXVBKBGkqRsQOK4kjbiJyZ0NNy7hi0gjPV8+R0KYaNqY3oQeH/prySSoLJvi+fgbdil1mo7pof2269PjX9PNFKhj5KRnCNCaa2QdDWvuFnWW9XQeVOqV/qb4XgW0OcF5zzHyVroIZKSfU637AnisqW6zGsuMgmnQoArqI621rd1FbDKvnJcDiNdFbfDXiWyVARoP5BngKiKH6iVHRqmYUHkZCX962H4vLzsyB6BQQxRYccOeAyR7MbaYAlYw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199018)(8936002)(5660300002)(478600001)(6512007)(36756003)(38100700002)(53546011)(6506007)(2906002)(8676002)(4326008)(83380400001)(6486002)(66946007)(26005)(186003)(66476007)(66556008)(316002)(86362001)(6916009)(54906003)(31696002)(31686004)(2616005)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkhKZzdSWUU4YllNSVA5RjVYT0lrcE5Id1hwbUMvS2t3T0tzQTc1cm1MUVB3?=
 =?utf-8?B?N0hTellseFY5MjN6QW9jbTBOVE1xYUxhMmtmK1hZYkNlOWliNHpPeTNML05E?=
 =?utf-8?B?VGpaTDEzYTBMM2MxcnBLK3hzWnNPYUN0SUp0YkNEMWdiVXFyVmhnL3JDWjVm?=
 =?utf-8?B?S3B2OGRHSmRHR3RXdHJQYUhNNFRpeGZqRmhEU3FsdGdLMmtZWUFIeHdHc1Ny?=
 =?utf-8?B?UWNacldrMmcyUzJmVmt6QmdnalY3YWsrbi9SZ0pua0Q3OE04R0VkS01KOUhP?=
 =?utf-8?B?VmlYVEdkaDJQN1R1UzlvNnJ4ZlJqeXVMcmwvcU1mSWc4SmVrOGloTzFBNTcw?=
 =?utf-8?B?bXQ5R0lsODk5ankyRFBoU05rTHQ3bklON2dmck5UUTluUDIrVWg3R0FJVjVM?=
 =?utf-8?B?dHRVaDhjVDIvQUJmYkYwYzNpNm1RODlzRUFKTm96NVpZWkhrRUluOGJFNCtu?=
 =?utf-8?B?cmFSSWlBUE81TVBKTmM4bEhsdWhQV3MvTHpOL0taS2lZeU85QzdrVVhhSEs4?=
 =?utf-8?B?NHk4OEJTdk1mbm11SGszRWxQWXFHdCtuYituZXRDdG9WZitZMEhUeVNDcjVV?=
 =?utf-8?B?N2NzTWFUTDBFOTRRM01UbkJUT1VxcFRkSndQb3NReURRYm9NYVZjYTEwSUZG?=
 =?utf-8?B?UFg1aWdkZ3BhbGFGbEZGUFVobUhxbThib3dGZHJLc0dmQVZFTjlHZHpoanNX?=
 =?utf-8?B?L2FrTWdBMWkyeUI2dGQ0MWh6RGVjRENLSDBKSFlZdkdORmdEaGl1eUVubU1t?=
 =?utf-8?B?NUxRR0FUcnM1eFYwSmlHZVoxbjNwU0VjYWtuQ3IvUWR5RFJXbHFJYmlHMzR4?=
 =?utf-8?B?U0VWWktaVFhPeXhKVUUvU2wwZGZyS2dnbXlQUWx1RVhvMEpZZ3h0bFh0YWE0?=
 =?utf-8?B?OWMyVEt3LzRSSTAwNEhlQUVxbGNMWW9oSWRHNFRseTd0eitCaWFhOFU2Ry9k?=
 =?utf-8?B?U3ZMYXBUOHlFaWxNVTJNaWR1Q1FVaGszUGVMWTJiQ0ZvaHB0dDFDdkUwWm1a?=
 =?utf-8?B?TW5BSDhMOE9rckE4cm1oMGVxU3BSZVR6UTlHVU9iUVVPVEdBTW9LQnQvL2ht?=
 =?utf-8?B?b2RPeGhTZ2hHN2tZNDZJQmtGNUdUWUtXMTQ5clRHeFk5SW9pQmpOalorTC9G?=
 =?utf-8?B?QkpTVjU0YytMb2FDT21DeVRqTGgxblpSYk9UbmdNUVhkQy9qTUIyVjVqMzRK?=
 =?utf-8?B?WEEwTDRqdjZLZGlQVjIxdHV5ME1mc29RRVhJY3JxbnNMbXJlaFlOSnZXTisz?=
 =?utf-8?B?a0d6cDdLclFlZ0E2WGZKNHBsbktpWWc1K21aQkt4aXpaS3djTklJT25JU1F1?=
 =?utf-8?B?cDk5Ti9LcU9rditLZmtZZ293dTZMeGx4dTczdExpdVp1QWtDSGN5OGRwTjk3?=
 =?utf-8?B?UDNXMDY1UTIzSm1SZ3VLc1lwTWlFYVVWeCtRRCtMS2FuWjgzNGxTSkwvd3Nu?=
 =?utf-8?B?cHZaZVBRVm5odFNMOVZtYTl3Y2FYc2dDZ29IQVh0Y3ozWDJhaUtQU0VRa09I?=
 =?utf-8?B?Mkk5b3JzWW1NQ3ZEczJ1eExqYTVsbTR2QWltVWR0NXovRnNJUVRxaUFiUGVN?=
 =?utf-8?B?bUpZSTJNS3VRalh0OEpQOXJyU1ZTZkQxVHBNaXhxVStXSjYzYUhZUSt5NnJ4?=
 =?utf-8?B?LzlMZWo3OWZmMlovWlFkWjJyV3BHdlFFYjNWZ2NXVVFsOHhZQVBKd2lEbTdX?=
 =?utf-8?B?MnVmQXpxaUJPN2pwSVRrK3QrL213NHZVbjFIUFgzQXFDbERvQnpiT3N4RTVa?=
 =?utf-8?B?VDVWbDFDZnJCajFMTDBDK3NlYzQ4eTN3bHgyUUxzaHVVMERMckNraXVTWjFr?=
 =?utf-8?B?SERiSEdNb2ExZk9PMFNPb0V6cE1DL3BQc0hVL0hrdC83cVM2d2wrRmViZkpH?=
 =?utf-8?B?d3E0MWZxZXV2SENhZEVBbWpFM0JNa3dRQ1BDVHkwTWZrNCtiK1g1Qy9ZU2lU?=
 =?utf-8?B?OXoxc1c0YzhlaDY1dXUwMVArZ2VPSlZsM2d0TUZUUU8yQlRscTZxL09vUDl1?=
 =?utf-8?B?TENqcTlnZGlnWWcvOXh3UWVsdEpyeVBGdStBYXZZZFg5THVHa3lrZnZtMFpk?=
 =?utf-8?B?eENWcXZUb05YTklLM2Q0WUZrQi9hUVVQOW1MUUlvZERyQzQ5OGt0bDM1QmhJ?=
 =?utf-8?Q?er0ZDS5cb7FAQ6ZMfnx2uk/DU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cddb6c2-b2f2-4b22-c1ee-08db13f9f250
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 10:54:03.7626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZHOAEymcgrhTUQPJS50IfdBJ8DIp3cl3BNUpTJBXAEIEjEK1jUYX/43B9G4KKhnhg2PvycqbvodrvZfxvm7Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7821

On 17.02.2023 18:48, Andrew Cooper wrote:
> @@ -90,7 +91,10 @@ ENTRY(kexec_reloc)
>          push    %rax
>          lretq
>  
> -relocate_pages:
> +        .type kexec_reloc, @function
> +        .size kexec_reloc, . - kexec_reloc
> +
> +ENTRY(relocate_pages)
>          /* %rdi - indirection page maddr */
>          pushq   %rbx
>  
> @@ -137,9 +141,12 @@ relocate_pages:
>          popq    %rbx
>          ret
>  
> +        .type relocate_pages, @function
> +        .size relocate_pages, . - relocate_pages
> +
>          .code32
>  
> -compatibility_mode:
> +ENTRY(compatibility_mode)

Do you really mean to make both labels global, thus potentially risking
a link-time name collision down the road? In C files we try to move the
other direction after all, making symbols static which can be.

> @@ -167,7 +174,14 @@ compatibility_mode:
>          call    *%ebp
>          ud2
>  
> -        .align 4
> +        .type compatibility_mode, @function
> +        .size compatibility_mode, . - compatibility_mode
> +
> +        /*
> +         * Ensure data is in a different cache line to code.
> +         */

Nit (style): Strictly speaking this is a single-line comment.

Jan

> +        .align SMP_CACHE_BYTES, 0
> +
>  compat_mode_gdt_desc:
>          .word .Lcompat_mode_gdt_end - compat_mode_gdt -1
>          .quad . - kexec_reloc        /* Relocated before use */


