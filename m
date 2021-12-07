Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE43546BAA4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 13:04:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241018.417833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muZCI-0004D3-EU; Tue, 07 Dec 2021 12:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241018.417833; Tue, 07 Dec 2021 12:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muZCI-0004BG-BI; Tue, 07 Dec 2021 12:03:50 +0000
Received: by outflank-mailman (input) for mailman id 241018;
 Tue, 07 Dec 2021 12:03:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muZCH-0004BA-0R
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 12:03:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbcd711b-5755-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 13:03:48 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-XQWZ4olBMqidMtXExXlMnQ-1; Tue, 07 Dec 2021 13:03:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Tue, 7 Dec
 2021 12:03:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 12:03:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0411.eurprd06.prod.outlook.com (2603:10a6:20b:461::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21 via Frontend
 Transport; Tue, 7 Dec 2021 12:03:43 +0000
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
X-Inumbo-ID: bbcd711b-5755-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638878627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xHUAhCeK1kL/kJdsZid52HlaARWOovktGdg7hB6Bpto=;
	b=c9xWQv1oKjrjPPWhwg0ZGDY321r+/iWKStpf8f1+SQF9cBNovEh56ylVCTWylVL1xMBxW0
	91UQdB8fBxHqGwZ0LbZFn6bcyVWJ/seWnvk+CXRO6F2AZ4uw6tUAFeZzNY9Ryu51j40a9C
	7fzgjicuGEABXAVYe7a01stt3OkBL40=
X-MC-Unique: XQWZ4olBMqidMtXExXlMnQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtqV/VXmU9ObNoycZeqJVmZpGAcHkpxPAkM9uNb0FzKm5DwZLT2VBlm9cCOcBwa1x5BvNj8KOJjKT3Llirvb4Nmya/9y9cp7IiQwcI9zUKQETpzIbmXRDN9QHVyMKMJKsrV8h8o9+8tACningpfO1IPJSw04wPtDKby6pwYbw3/6SYkCfk35sh4nKi1uZCoaPUws1lkF36PGAMEsQgFErPW8oqJKM0Mv/TmSQygehsAj4XFVnlzBVP8YlJLhp0tfkEwN8rXkKb6qPGqJzQ6lEGFysnckIq1rnHEzD9+h3veQ5PL67aopT+W/3YlMM2ME4NbXNawp+qiQspXNOUejQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHUAhCeK1kL/kJdsZid52HlaARWOovktGdg7hB6Bpto=;
 b=nJfNNnzyGRaDlwhjB/dox+Md1i0ix9UEhidcPdVsP3RgeiNFUTypwb65L+x8nlAH6D03rFDxDdttwMJByf2iPVaY/yx+BwnQcFk0jfcdt6dnhKTcjtOQuir9M9C8L6XW/fBCvTN6xggp/RgPFoyi0FoKAxUlUE8kEjI1yNTGc2jCR9mjsjNBUEnHwnHgR40VI6ChtFm6EOfccdNIErOj237EojjKr/DSKEOp/WrOU1Ej5rGRt4Zh1TDSMuJBuhL4UJZ+L16RJ2wxTTWdvsIbD3dyGCIKN9dl4pHz/JqZBEED3ZUOX4Y6WpHCfwcfdR4tLtPyayWlN9gCud0VYJzA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81893ccf-6b94-ddc7-d92b-f254861fe994@suse.com>
Date: Tue, 7 Dec 2021 13:03:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/3] x86/boot: Drop move_memory() and use memcpy()
 directly
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
 <20211207105339.28440-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211207105339.28440-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0411.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09974890-79e8-43ae-318c-08d9b9799dec
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5901E3E7EF3968D9430EA865B36E9@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zwQmS2E2+lKWU3vJsbHHnIN3eliGSagsdgBeZdYgkxDLebPEydroEFD3XcrEYB/PQN1cpZaMxyKHcbeRwtnXSNefriBnNohXRztQm409k7Ik1HpKtS2Wa3rXbpzSVvr8plwUbnrQCc/lFnFNsT6Q+4VCqQgwQhKNZ7r474k4TSQkFCnoO/hupjQ2nHcAESDkulplGqafbEOjNiXeolq0bsrKIdqWD0HaupRO4vLH2ekXHwCuez88si2dq8wlmagvUzJ/RRixyWMe0m2NB8Pbi9/s8DbUjaEEVdBEfXW0YzUfzCqIRonH4wyR0DzA6bApU4FIGK5ENKB3J6XcIXiiYpvodx5U9znzixJFWG2teW38h1yOXBDaUBryrvZVyu787cHp6jVWVpHS09FH8085N9T97KptRrcxhOu/aQ+xL7HtxVdadjiItEcqeXCKmFbfQhbYzKSP1HwBWwe2yKa2pChP3j2hjt67DWUDrLW7UYyD17Qq4rLIHlXvmcNJI3khSfwUh3mJFiebHeO7F5rWJ1oVko06OnjuqaJXCS0AlCcz9YYvQ6bJ0zBtjODaqhjLysE63/v2Oyf87T+vu+ptVP4woHrhNln3owdqcN4gKdUsNGdYamsDNlyKDo2jVV4tdNpDZmh8tEv9OgC+GUjp/7AIy1iKvQQqcKca8wZBifgd1mJZpDyV0iAX2z1Jw2olERTu55Io4TdPOgnyc24CLZKXrw0eP4znV45U4gFutEQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(54906003)(8676002)(2906002)(66556008)(8936002)(86362001)(186003)(31696002)(38100700002)(508600001)(956004)(66476007)(16576012)(316002)(2616005)(4326008)(26005)(6916009)(53546011)(83380400001)(31686004)(6486002)(36756003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vy9zcDF3Z2pGdjRVWVBxL004MXVGYXcrcStxY3lTYWMxcEIzeEdrcXA4UEFq?=
 =?utf-8?B?TExXUHF2VkNBY1ord1lqa1JPdUdaYTJMV1pSS0pYMlVpQktCKzF0cGtKVEMw?=
 =?utf-8?B?YmJVSGdFbWtNVG1xVFN2N0UwV0FCamtTT0U5eGtGUGZQUmYrOTgxNnA5MHdO?=
 =?utf-8?B?eVJFTk05UzIwNnVJV0RTY0NWNU1rMUlZandHNWlkcE5kYWp3VDY3cG5nSEhs?=
 =?utf-8?B?YkNSNmFEMVRpLzhsRzZ3OCtRVG9BTUVId2lhZC9VVUhMOTFlbFYvVkVXRHM0?=
 =?utf-8?B?RDFiMXRYMHlla3I1Z0piWmp6TWNYbkhEVFdwMzgweW9oVkVpUlZMUzgzUVZS?=
 =?utf-8?B?NHJuSTU0eE5DSFN4aDNpcG9jVVV0MmM3UEF5VzltaVg4OGNMZ09JNE9qUEd3?=
 =?utf-8?B?QVlsK3FjUm1EQTNRUnN6cFBDeE00azZNS2JHcC9GcjlTMVB0OUF5cU1HVHBY?=
 =?utf-8?B?ZEErdVJrcmdNbDNwcjJ3OXRuRFpUcFVDa3RpbU5uUUsyT05mMk5GQ1g5dFNt?=
 =?utf-8?B?SGFYKy9Rd2hvTXdaTmpjZncwck9ibVdkanFxVW5pck1WRFFhUDhIejFteHJP?=
 =?utf-8?B?Q3AwN25OMmdhaEsrdW9ScVpWemFxczdOUnRBY1ZTUm1PSFErdzVMVTlMNWVO?=
 =?utf-8?B?TGtiSjV0akw3ZWtOY01vbXRXb0FsTHI0L3UwZ2ptZ1E3YWZVWkVpY2haSlc1?=
 =?utf-8?B?OU1ZcjVuSWRXcFhKVjllaGZyVkdGMnJPZ1ozTnhvTWhIY3NVQzkrQ0lnZGFX?=
 =?utf-8?B?RHVaMStyMzljMnRTaGtUeWxLSXN5d0lNTFcwZC9ZOG4wZTVGcFVTMktSZWds?=
 =?utf-8?B?RnpReHdpYUJ6M3QvNSszd2l4RVZVRG1EUFI2Nzhzd2ZxcjE2aGxJQXAwQVhU?=
 =?utf-8?B?R3lNWFRNTi9IUmtmcVN5b3MxamZPNTc3R2NyNStsZTNGSEhacitKb1g3WjlW?=
 =?utf-8?B?UHl3UkEvd2xUVDZpWkp1bnVDMnNWbm1lTFJxcjRaRnF5U1ZrNDk1MDJ1eHlZ?=
 =?utf-8?B?UWRqSTdjQ1VUcmF5ZVZQaVJQZDVSMkVxR3Z6c2hEYlFTZlBURHZHRGNPRXd5?=
 =?utf-8?B?alFsdnZqYjVmYk4rcEZFamdoVzRPU0dqUDliRk5NQTgzVmVka0NFRTdDeExC?=
 =?utf-8?B?VkZjTG04N1ZlWDRFQTd0NWZHQTk4WTFtR0hRdnlBY1VRZXEvZytLaytMTWhP?=
 =?utf-8?B?dmJQWnUrcEliZmhpb3NuQk5YVUk2bkw0dFdQSkFaZFlZUFFmMldiTVJsSXVC?=
 =?utf-8?B?anhyejYwR2w2SlZ3eTFaZHhGZkRTZlh2c3VBNUxkWFI3dklHYndoaUJGYWEw?=
 =?utf-8?B?bzBIV1VVWVdZNkFXNmQ3RGkrNXN4RERhMUdidDhrSWJTaTlaRVcxdnJ5eG9h?=
 =?utf-8?B?RWhjUzZ3c2F2cHp1c1BIOGI4Vy8xWkhKWTVrYzlBYjNqSmpnWGxXc1BPaC9k?=
 =?utf-8?B?Z1ZhQzRlYVl6TjVsV25relBYL1Q2ZnRpZldjY3dwU3ZBbTRBdCtyZ1dvSCtK?=
 =?utf-8?B?djRMaHNodWhyQkJFcmFlUWFkb0grcFZCam4yRFN6ZWV5YmtOd2w5OEZBMTZV?=
 =?utf-8?B?d0VXYnRuSlp4czk4RlZuQ1ZUSGpLUk9LOXB6Nno2NW5ZOU41ZmxKcUdWQy8z?=
 =?utf-8?B?Z2pXeEFUclRqMGxROFZLb2M4VXBKTWRQY01xSmdRbEpweExTYURyZ21BN2lW?=
 =?utf-8?B?UE5VNWEvMEMxMktrU0lxVlJGRndSNnA1SFNxNlYxK3M2RzJrZGNHTERpZEtJ?=
 =?utf-8?B?MnRMVnlYaFQraHNJa0N0TWhmN1Nwckh2b0hWUVpxV2NTTEx5MWdIbmVBd2lY?=
 =?utf-8?B?YTBJNEFUM2xJK0tjbFlkYzB5MXQ3d0FTeUNZeE5XazJkVDNNZ3NQWHoxNUEz?=
 =?utf-8?B?d0R2SlN2cjczMmNmSVBTazEyZUt0Z0tML2Z5YWozQ09XUVdiTlZVZ2I0ZG5u?=
 =?utf-8?B?ckZkVnAyM0cveXFPanZxVERnRGFjRU5mQzExZmt5SUp0MXNQUkkrSU5SUGNh?=
 =?utf-8?B?RUNvTmtkK3VUWkg5U09INy9lZHA0Zllnd2ZybnprdTNHeVlMOW1Lbnk4MmNq?=
 =?utf-8?B?NWs2VzdHQTVqaXVsYlFoVGtPREhoVmo0ZjEwazRoejNibHZrV3RicmppZDR0?=
 =?utf-8?B?WVZ6dUwwNitqZ09JYlh4MlQxTWZnZ2tBM2FJelpNWkVINVVyeHNETE9zdmVK?=
 =?utf-8?Q?PdIdvxS8XCfbPuHEH6hbzfs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09974890-79e8-43ae-318c-08d9b9799dec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 12:03:44.2888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FnOfnZWB85ugvzin4EVivBOMUjCjzzhIzXVfkGoBW/i31eIHmfnFqisUPgKu2bfyYEWwkJSiAhxXphwIo19vUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

On 07.12.2021 11:53, Andrew Cooper wrote:
> @@ -1243,7 +1196,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>               * data until after we have switched to the relocated pagetables!
>               */
>              barrier();
> -            move_memory(e, XEN_IMG_OFFSET, _end - _start, 1);
> +            memcpy(__va(__pa(_start)), _start, _end - _start);
>  
>              /* Walk idle_pg_table, relocating non-leaf entries. */
>              pl4e = __va(__pa(idle_pg_table));
> @@ -1300,8 +1253,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>                     "1" (__va(__pa(cpu0_stack))), "2" (STACK_SIZE / 8)
>                  : "memory" );
>  
> -            bootstrap_map(NULL);
> -
>              printk("New Xen image base address: %#lx\n", xen_phys_start);
>          }

This bootstrap_map() must have been dead code already before, except
for the "keep" argument above needlessly having got passed as 1? Afaict
passing 1 was pointless without using the function's return value.

> @@ -1325,9 +1276,10 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>                   (headroom ||
>                    ((end - size) >> PAGE_SHIFT) > mod[j].mod_start) )
>              {
> -                move_memory(end - size + headroom,
> -                            (uint64_t)mod[j].mod_start << PAGE_SHIFT,
> -                            mod[j].mod_end, 0);
> +                memcpy(__va(end - size + headroom),
> +                       __va((uint64_t)mod[j].mod_start << PAGE_SHIFT),
> +                       mod[j].mod_end);

I'm not convinced this can be memcpy() - consider_modules() specifically
allows for the current module's source and destination areas to overlap.
See also the comment ahead of its invocation a few lines up from here.

I'm also not convinced we have the source range (fully) direct-mapped at
this point. Only full superpages have been mapped so far, and only those
for the current or higher address E820 entries (plus of course the pre-
built mappings of the space below 1Gb [PREBUILT_MAP_LIMIT]) located
below 4Gb.

As to the 2nd argument - if this can indeed be converted in the first
place, may I suggest to also switch to using pfn_to_paddr()?

Jan


