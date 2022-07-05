Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1AA5668BB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 12:57:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360771.590187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8gEr-0001XA-2v; Tue, 05 Jul 2022 10:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360771.590187; Tue, 05 Jul 2022 10:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8gEq-0001Um-Vu; Tue, 05 Jul 2022 10:57:04 +0000
Received: by outflank-mailman (input) for mailman id 360771;
 Tue, 05 Jul 2022 10:57:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8gEo-0001Ug-Q1
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 10:57:03 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150042.outbound.protection.outlook.com [40.107.15.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31e15cfd-fc51-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 12:57:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6553.eurprd04.prod.outlook.com (2603:10a6:10:10f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 10:56:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 10:56:57 +0000
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
X-Inumbo-ID: 31e15cfd-fc51-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsvTRT4lemodHtUSENUsxZKxgysVU9BW1qdQnwgfk4XrLOxiKL7TT6RCpEdLwTf1OadloSRQkkkrAs0w3i0IeEfrbTeXPh8jx9b05LZR32vCbJ4Y8DDIZKTRPRAuz0YAprOiFNg8ESbAxcW4kohPgO3yIsuPtA/0X5HWdskhQXK4lrHficFT/CTd6or4Jb9u/+PhjNG9Hfvxuom1L0b7QEcZm7V7REyMZHWq8OYCm1lQQZZjMwuXB1uA6G6SkXDkPfhhCZZ+oEyhWjOlenaxSsVOFXvrwhwdGoWyed4Nka6w1a7aNGcuwaKWewE6G9A+Ko2zVxkzg77gxfWNqROj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YsDQetN1expk9M0MJKOywrzAPpHOWaDrCoMJc3+6nU=;
 b=j3lB8+6y4vpaTKP47RelYqZ7RR+9ZQzAbfH8TfwE7WtLCjhp8dritWME5iX3TP62Hzux5D79tPNwK3D4ZsxN83b1d5iMH9zvjhxI4Dq2uGw9iZPvjxxXkSb5wj1aJat4aZ2v+6OLOf6XmubAVkXIrVQhjvQTR+fJI+BiPcdyM9yF++xWtF/rAtufzRq+W1+Xx7gt97ffoH9cQcaSmot5Bdq5xYFugupA0/86iSQq16sRgYR5BtGFqOFK0n1Mc42wbLHpgECU82v5Y372acAKA5BRs/vJ5MQTZWWXKN9zzIjHtrGYcJkXTo4G0D9zz1TNsvn6YKhsJam2VsW4gEUHQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YsDQetN1expk9M0MJKOywrzAPpHOWaDrCoMJc3+6nU=;
 b=sRJEEhdl198J73pE2PQDtAinK2zWS3ZNtpsd/U1khHi8SbCJBzqDltbsaEb0jUpByBRKHYpPGVFjSdPVjP7+mB44soAf18f/nDZilAM3nOSG8ajdgJ49vx4w6jPnxNnpVAv9cUPB+uaBNIeM3DZO5B+Ujg8PE0wj/6weLiBMRc4DqZyQLWGFXvFOiSABkMMiUBUP0pkXIPJZVQUUnSGTdbxfJNDj5gy+ZnFQ2iDXlIXRfz4M6lvR4i+5Ya5U2B4oJMER1iqpBI7yDGZioDBAcrCLkeoFcjDZf8ej0iM+GLMD3K3xmUA5NDaArtwN4W/n7U5Z21vrkrEe+A4KQZx/xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa9ec718-7ab1-9e58-0b02-9fa507206051@suse.com>
Date: Tue, 5 Jul 2022 12:56:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8] Preserve the EFI System Resource Table for dom0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
References: <7f773ea8d3967fc3dd2a485384a852c006fd82b9.1656093756.git.demi@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7f773ea8d3967fc3dd2a485384a852c006fd82b9.1656093756.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be42e38d-6de6-4c7b-397d-08da5e751486
X-MS-TrafficTypeDiagnostic: DB8PR04MB6553:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UNTNc/vvidKniOwHyTAEa5LTJLwbAojBc4s2G9fI/CJC+wvGyg4w4++bjdt8UXyZ5yvj+m33/PF0CW4U72YVfP3il5jsaDHxoFEjMMWJ3vuVC0t/wx5gLOKPG6H4qzHK30NG8YnWsZHioxM1KZkIfUq+1Z0XOQjyDVpeb+ynYmlF3GGXEgdOMQhtND6K94rfCpM3WqrFJYMexQBNKMDGvceGMLLBK6vazJtfSb0YF/rXIUySg+ZiI8GRYyELkaXL2MoX7OtBj9fkHcA0ZgShUIkzM3/U35q2lnAcOJ0p1h4iVitb9C5KJ9maUk+AwpFIZyt8vuoHKnp2vYZExvx7cwRqq3NrMo6rjqTJs9vS+gUOI1Ag1WGgOJ6UIZrFN7RwpbOnVOlUPwriV9K7LeK0H1SfKXK+WpO140XvXcTmO7ltyeFx89WTg8NvVXQdiCOIkP5FdEv5k9V43UugIo1nGdJp2/fFzhxvezBUHA5Cp0Za+rhs7ZtI451hGsHslESQbR/Xf42fXfUnhQAEO/0bVJYJ+L5n0sA5/vVczDW/o4HF+920fYV8XNvXFXPLr+01zmPDzjbs9rXfBYZUROkoFNUGXuoDOzomzW/0ZXOpQaXH1NfBE0+6MY65TBRSGuUmUMSxh8GnWq5u/2B/xtf91zvnM+l3j5TX3gKcNPdDg8AkqrzvH0EpLwnU1Tdqxq2AXq4Eb9fbSqEQmnkRgQmKoCF9g/2O3bFbyCxkzEffutnXq5k8cTX6Ilqf8Ja7G8OxTgLpUNUh4X1MQHy21C9Yz/vwVWNUSKcUadNyL7CASPhPMYSPCoc5bdCxCYb3EWIeGROSHoXcxU6jFJNgQJWPtAA0pj103sEKeQLZr0yiG9l/bTs9Itnya874tVxUuSx3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(39860400002)(366004)(396003)(136003)(6916009)(316002)(26005)(41300700001)(6512007)(6506007)(53546011)(478600001)(966005)(6486002)(2906002)(66476007)(66556008)(66946007)(4326008)(8676002)(5660300002)(8936002)(38100700002)(86362001)(31696002)(36756003)(31686004)(186003)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emJNS2d4UFpiNW9scktZRFNaRWNQNHFvbmxuMUQyWDdYbDlabHFjejNXbWdU?=
 =?utf-8?B?UXA1MnRKT0dMeTZIT1ZLYTViSXVVa0p0bTJsLy9rbC9LS0E5RHJSTGd1eUZQ?=
 =?utf-8?B?bmFIcmZnMVNKdmVpdk9LdWdicHhQeCtxMkV4eFN3VUExNmZNcTQ0Z2N3T3pU?=
 =?utf-8?B?NTJlQ2E4Wnd2L053MjZ3MDZYeWlZRndwdWhWWHljNVNpK3dxUmh3R3RZNmlN?=
 =?utf-8?B?MFAxbWd4L0JDUk8xeXFtMVphdlVWTXAyYWhjZ2d0djJOYk5VR0NlSzRuaVFO?=
 =?utf-8?B?bzF0M1V4NXkwMU12OXNnUUEvT0V3Z3Z6OUdLZXBnTHNYZG9YdUJTN0Fua3E3?=
 =?utf-8?B?MHpldmhDa0x0VDU2ZWhqMzZMMkhPV3JoNjkwTEFVTm1NR2xQeGxhZDNwaDJ3?=
 =?utf-8?B?TzhTSHk1bGdYVXZXUWJFM1lYRHVHaFlheGRYRUhIUlA1YkxoZUxjWllubXhq?=
 =?utf-8?B?RmFIVDhFZDJDYXorSXJrNDVpemt4NTB1RitNK0pYQjVHRit2MmJmQ1FkdEMy?=
 =?utf-8?B?dWlINmt4eDQyWjRVaGU0MTNUZTh4TWFMMVpUbzBCMHpyc0FnYmpJSzcvcEUy?=
 =?utf-8?B?Ui9lS3E2RVhrQzl4VCtaV29ZUDlhNHBPd0pEUGo0aXFzUnBobHZreWc3dkht?=
 =?utf-8?B?OVNvT2w1bkk4ZmZnQTR1SE9OeXhyQVFocFV0MVdCT0tEV3Q0VmJmdlBVTzNR?=
 =?utf-8?B?bjFEdDRnSms0cnFxanBEaFZOaDN3ZlB4YytPQVhKY2w2L0tFd1h1azQ5dkZD?=
 =?utf-8?B?RjFKM0NndXNWSktYT2hidGt6bWpONXJJUTlrZllxSExnWm1nd3ZUVlExN0ds?=
 =?utf-8?B?VFc4RDVOV0M3aGpsbllQdzJIcE5LblNPUEt4dXRsWTU0QklrdjdkY1puMUlH?=
 =?utf-8?B?R2ZvZi9FQjdHL1ZidHJncVlIa0VTSjVuOWMraVoybXNaWWIxU1NWaEJrQ1di?=
 =?utf-8?B?NXVxRXhMd2ZpNXY4WGRYNHBJUitkT0taR3F6Y1ZQUG1rd20rRUpONithT2Yy?=
 =?utf-8?B?dkFoR1d0YW1wZlA3Yy9GV3Zjeit1Z0hVZStEanZvSWdrMElSRm1VWHdzWGdz?=
 =?utf-8?B?eG9zcW5jaGRSSzVWLzVla1IyclZlK0xudVNWTk5YZXZDYlJNbDZ5ck1CY01U?=
 =?utf-8?B?SFQ0QnFYRXRpNEp1aVdmUmY5UVcrb2lYVlJhUU1lcytxYWdHM1dNR0ZvMUJj?=
 =?utf-8?B?MGNkMTNnQ0R3bVVSUXprSmJyaDBmVnp5eS81REVtSk94V20veEs3bmpCMjRX?=
 =?utf-8?B?UU50MVB3UFU4MmowT3VXRndHQ2JnRi9GVjdqdllWN1pwYWRjeXRVWjdNYUtP?=
 =?utf-8?B?dEdRSEpIUXBEa1NyTGRHQ0JEUDhDd2ROR3VFbklaZXUyY2pOMGxWUjQ3WWwv?=
 =?utf-8?B?WVJpN0ZQbnNIWlg1dWZNL0NMWkJiNUtMZG1sZVRKTVEwcjhQcW50aXcvVWw4?=
 =?utf-8?B?NkpXSzl1MVphMVhLMlRidVdFNi9Jd2p1ck12Q3p6dzNmc2daenMzRDg5cUsy?=
 =?utf-8?B?ejdIQTdHdk5YMzlPVkUyQ0xlYTlNOWZZK2ZQclE5Y3lKMUdIOUdwVytmZFdn?=
 =?utf-8?B?QmxSMzZMa3Ezb3QxMk1nQ21SV3dmN0NyaExKSmNJS3lZMTZSbmlScU9za3hh?=
 =?utf-8?B?bUlRYy8rU1NPR0RsNnNaWmV0V3BEL0lmVHF2QnBNQXR2TG5NUDBIQkFtelds?=
 =?utf-8?B?RWtBQnM5ait3aFovR2VoOXNXNkZwMC8wN2o5TzlxS2FoTXNDRU9mMTBaNzJU?=
 =?utf-8?B?cVFEcnlSY3ZaS3Z3RkFPQlRHZnZyZk1pNXUrTFh0NUIxMXAyMExXMDlTUFVl?=
 =?utf-8?B?SktyMWNuK1pYZjRXd3puZFFJbE43b0hpZkN0T25YQXdJdXJKWVRQd2dhM2VC?=
 =?utf-8?B?UUlrWE5pU29RTUZqd1duNVBJOUF1SnRNaHlkWmduY1I4OU83WG42U0kzU2dB?=
 =?utf-8?B?b2h0MWVra2VkMmswVnV2ODRuUUh3ay9FVEJ0RWtiektLRE4ydmgvZGlNNDVl?=
 =?utf-8?B?REdOTHZwUGpDbmVVenFiUWhEbmltSVpVZFkzVG1NMUd1aTFKakhvQ0dzc0x0?=
 =?utf-8?B?ZzdqeXVzNjZETWlMSWpBc3FZSTYrUCswWXJST1U3bGZ5YUgvMEdwOGNuT3g2?=
 =?utf-8?Q?ai2zRWHYnrbq345OSGfZjHIzz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be42e38d-6de6-4c7b-397d-08da5e751486
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 10:56:57.5809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYeA5M/BIuB/eI72RgTAkgc8vj1Oa/JhiwkBZyvwFkcmVsKFRMZdboT+YoZECrizGlB56bxV+jYleTFtB6KXWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6553

On 24.06.2022 20:17, Demi Marie Obenour wrote:
> The EFI System Resource Table (ESRT) is necessary for fwupd to identify
> firmware updates to install.  According to the UEFI specification §23.4,
> the ESRT shall be stored in memory of type EfiBootServicesData.  However,
> memory of type EfiBootServicesData is considered general-purpose memory
> by Xen, so the ESRT needs to be moved somewhere where Xen will not
> overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
> which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
> in memory of type EfiRuntimeServicesData.
> 
> Earlier versions of this patch reserved the memory in which the ESRT was
> located.  This created awkward alignment problems, and required either
> splitting the E820 table or wasting memory.  It also would have required
> a new platform op for dom0 to use to indicate if the ESRT is reserved.
> By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
> does not need to be modified, and dom0 can just check the type of the
> memory region containing the ESRT.  The copy is only done if the ESRT is
> not already in EfiRuntimeServicesData memory, avoiding memory leaks on
> repeated kexec.
> 
> See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
> for details.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one further adjustment:

> @@ -1051,6 +1110,70 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop
>  #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
>                                   (EFI_PAGE_SHIFT + BITS_PER_LONG - 32))
>  
> +static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
> +{
> +    EFI_STATUS status;
> +    UINTN info_size = 0, map_key, mdesc_size;
> +    void *memory_map = NULL;
> +    UINT32 ver;
> +    unsigned int i;
> +
> +    for ( ; ; ) {

In reply to v7 I said:

"Nit: Style:

    for ( ; ; )
    {
"

which you've dealt with just partly. This time I'll take care of this
while committing.

Also for future patches please remember that having brief per-revision
change notes are quite helpful to reviewers.

Jan

