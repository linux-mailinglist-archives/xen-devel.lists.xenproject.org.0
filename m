Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9761C4694F7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 12:24:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238808.413875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muC6m-0005kG-4L; Mon, 06 Dec 2021 11:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238808.413875; Mon, 06 Dec 2021 11:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muC6l-0005hB-Vt; Mon, 06 Dec 2021 11:24:35 +0000
Received: by outflank-mailman (input) for mailman id 238808;
 Mon, 06 Dec 2021 11:24:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muC6k-0005h1-HA
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 11:24:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1610f5a9-5687-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 12:24:33 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-UTOJ8Yr7PUO8XxEJsu4T0Q-1; Mon, 06 Dec 2021 12:24:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Mon, 6 Dec
 2021 11:24:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 11:24:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0103.eurprd06.prod.outlook.com (2603:10a6:20b:465::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 11:24:30 +0000
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
X-Inumbo-ID: 1610f5a9-5687-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638789873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ljyOQVJzhmY3HQCtr60ZGufz8NUz80QQWkVKU7vzOFM=;
	b=Zf6ncNf0QhfA6eqlK7FrBKeUt6hEUjRah+NYm/xq3I+xTjg00wpxgxY0hXOaUkhCMDxF3s
	Ul40ddYl9qEh+JQx1+X0lZnv50LccYHro/ODuk9lyWdlg3TUhAHRGaEhf805KLyVu3sNPM
	GsilLvEoRLL6sPBBI6z8Orz2e30LI6A=
X-MC-Unique: UTOJ8Yr7PUO8XxEJsu4T0Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hp4aODkgUHW3geLbfQ/UCv/7TjrhqaGsSfAjJRarj8uOmzc0LJceBl/Ea5kjHTx0a/F/1ftyshtm+27y/lWYdjGwOGttWk6kZzJ0O4JmATtgyIuL6tE/uP2nSCrMb5ZU0gaPS01M+5UqEFIqextoqLQTiRb8Q4jK3ohqDOsDnG4fk5TdtWix5RX3vCb7+Mhi7S8Ba3RtLJRo/FIT3Ear8iz89kq4sPBudUNxXRCwRzPbE7VKmssQcfLyl2r8cpclOUZvg8klrOq22W9aHHULJoHmc38/UoCuZHyx+yRPvKfepUgpVEiPW+0a1jqOc3hDShXivGZsq0KpPkERv31bkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljyOQVJzhmY3HQCtr60ZGufz8NUz80QQWkVKU7vzOFM=;
 b=ABV88f1hofmot+T6wvet85QG47U4OgEiwNDDBVQNmAAHJnV8mFhnXa23NOAWWn3zuUYbJ5oh9fNua/LNUxUjaG+WxnEgjYvS1S7E1nSdph9AC8QfCRJM+Y1nGfw510AKnjOXpzQuIB1+xGIc1gdAlsazx6CsMNWE7053Gas5eVkDoJdbdNA/5BaJA7eQmDmz9YnfHD7h/ReWA9qGHI62NtzWEo39qP/cyaZ92ukIAU+lsUBn8CBJBmw8w4kGu9P8/seLoOE8YMNl/wKldU4hf42ytG9z9ChipiEYf9ET300iZezuBQSSSwb/xXsj7JzO4LQ8QdC/d4QUWzsmSCgN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c9d73bf-c3f1-3bf7-de56-a41c298cd50d@suse.com>
Date: Mon, 6 Dec 2021 12:24:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 65/65] x86: Enable CET Indirect Branch Tracking
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-66-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-66-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0103.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf2d37a2-984e-4ea3-b46a-08d9b8aaf88c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3933A5842CC959EA560BE026B36D9@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F2Lu2f93AIHavtWVSEKBKo+e2ipBvOfBRe+UKYN5a+3Lj2R5x/BEx+k6u9N/5ZRqIX6nKHF1P46ydl7D+xppXKSqoInSHsJqDfmyFYmaDjknYh7/6yqnkgJOKoJjZ4JMB05hPXB2H+rPcLWPLgglk8XM+h7yHacwmWtB5lbhmdFFrE875ubHym17iMGOfC9Idno2cjF/Le0i68rxX/up7vvdz2zQ/Rokne5aNgIRnKcHnZBNQWdhFVRBgwMBYxNbioXKMwDiRX3MCEnqLjBSJ7oX8iRlFrK/8mMIePvfTW1kPAdMSXCO0UKdnVBgJZKNoJHL4NVgT4SsDCtp/6v70s4ypTDe3ap/UDvQmNP1c81LLnuHSwf53qKm2npBRe6hc8X8TqxCKsWNOCIST/ZuFZjMq67Y6EnTnQFN6t4ECFhXd6TkFS+A0qiwSjrme1Qkd4tkOviqcVG8ZRGt3buTe98WVLzt43Vz1EDBg/D7Mny74zdm2fr8ACOnVM4BuBodQxFQnk7MTFn32NQtg/CZ5a+MtqWFnzSixUPWV0gIu3mD6ihl7daDezBnQ6NqgcYbtRAma/Jjl347/3BKbAwFe3yrscmyVZLkc8vXGm0taducmJEON/c13h3Lzd/FcKp8T7dTGmKa3aQoJfkK5OVNfjIkyuE7sZCex15PwF9kl/7UkH7Pk20iju6rSa/vgM243m6ElzS+QJ2uvD13Xp+ZWF5bzi0PeXpHPFzYyNK9VCE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66946007)(36756003)(66556008)(26005)(316002)(16576012)(2906002)(186003)(31686004)(38100700002)(54906003)(53546011)(6486002)(6916009)(4326008)(31696002)(5660300002)(508600001)(86362001)(956004)(2616005)(83380400001)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czJhTlJQbmhCQlBqQUE2eWdHY3h0QUtSc2VKbm9hYlR5cjNOL256aUsxSDhx?=
 =?utf-8?B?dkpTc2srT0RzZ3V5TGlhSmVtdy9sRTF6RFRCU0E3TFZiMnNGRy9relZEQjVN?=
 =?utf-8?B?Z1hmaVJjS2o4NGZ1V1pZazR3dkNnMVF6b2xEaWFVUzNRdUU5MXcwWmIyd1c4?=
 =?utf-8?B?azAvQzRJK0ZKTG5Dc3lLd3hKMWYvbEV3TnlsdFY4c09JcGVZUnAvZjJMNStj?=
 =?utf-8?B?aFRLWHNMZDhzb3loU2ZzaTRxcDc1THdsNXp5WkdydmFQOUE5a0JJVWEvaU13?=
 =?utf-8?B?Tng0c0lzTWJickZhMXd1Ykt3Q2NVODlqdCtWRTRmU1MxQTF1MUtXbThVWTBj?=
 =?utf-8?B?Q3duU3R3WmxrN2Y0WHVmYU8yT3huYXF5LzN0RFVCdzR3N09tOWVqdGhLNVlZ?=
 =?utf-8?B?andGaVV1a0xySXZNdFRzOWpNMzZtejlveU9yUDN5YjUrUVd3TWdOQ0QyMVV6?=
 =?utf-8?B?S2t6SE95MWFlN3VKNDU1WFlld3RLQzd4Nndoa0RwUmtjNnBKVnYyUGxnWUFu?=
 =?utf-8?B?Z3ZNLytRTlBRYVhmVjUwN1dWb2dreDFUcWx3eGUyb1IySTNSNEpvYndwOThC?=
 =?utf-8?B?Mmw2ZHN3RnhtSW1LWXdFU2VSTytPTktHRkEvWFZGVCtVN1BLdUt4TDBENTNv?=
 =?utf-8?B?QWMvSVlkMU9uM2ovOTJQMUpUbFJBQkZKSlBxME15NTNJK2h1VzhvTWIxQTZr?=
 =?utf-8?B?SzNhMGdObnJRYVBnU0VnRnZLTW5hVFFhMXFTMHRVSjJqTlN6c0I4WE8xM1Rp?=
 =?utf-8?B?TnVpek9GTWg3TnVGNm1XeEo4bHUrZmFScHpkako5NU95a3dIM2JVY2ZvWm5K?=
 =?utf-8?B?b1JpVWdjVVJOTDRNMUl0cHlkTlprdTJFdlBreW9ZUjFWdUczZUZ3ekIyTGxj?=
 =?utf-8?B?THducGx2dUhlQkw5d0dGSlB0MlJ6Z0hqNXVHMlQ4Q0wvWHZkazA4MStnSkZv?=
 =?utf-8?B?WTFBWXJUcjhJb0w3dDU0U0xBNVBMUU1wNjhDdGZwT1luRVNaM1kzeHFubW12?=
 =?utf-8?B?cmZxRnFMNzE0a1JzRndPYno5RVZ0UEtlbEt3Kzd1bnVGeU5Qdmo5a1hUSjkr?=
 =?utf-8?B?UFoyQkVON0hMSkszSGZDNVBDeldpK3c3SjZnYURzT1padDh2VXVlV3JSOUxD?=
 =?utf-8?B?SE1EMnVDRWp2TWt2NWNhQWgzdVZyVDNyT1VtZ1RmeHJmbllxcHY5aHBlVGs4?=
 =?utf-8?B?KzAvLytQb2NaaWQ4b3djMHMySHpISzJpSkY5c2pBVkJpakRhamF1Vm1SZFVS?=
 =?utf-8?B?bEcrK1lYYVpaV1QvY1NmS1BFTlEvQ2M1ejZjS09ramxzUDRRL3RJc3RnejEv?=
 =?utf-8?B?cHBZMnRFVS9aQWIraWhmY2x5R0hwWmJZTWJQRmw3am9LbVFsRHRXaEhzWUdM?=
 =?utf-8?B?M2h1Y0c5TGY4TEl3N2N1clNEdnduZ3gybHRlZTlCZWNRdGcwM3pCd0pzU3hQ?=
 =?utf-8?B?UTBGK3N6TXY3ZTM4WTA0ZndJbysxaVBMcjFINW04SWRBUnFWZG9ZMVNTd3RI?=
 =?utf-8?B?elprTFFuZnlZTCtWb0MvU0lQWktKRUlWOXh0YkZDRDdHR3RLcjN4c2ZBejRx?=
 =?utf-8?B?by9USTd1a0dMa1kreFAwbXRlbHgwcXZIZzMya2lVMnFzM0VWeW9jU2h0WFd0?=
 =?utf-8?B?Y0lLbGVoZmdGNks1cVZiUzBVMXlYZ21wN3Q4WGxueFZrS3R2QkZGSk5sR3VR?=
 =?utf-8?B?dkU4T1VKUkkvMUJVUmpCYXdVM3BCN0pGU3NxOVFHTUV3RCttRlFQcVV4aHFx?=
 =?utf-8?B?NDlSZ0E3MXVQRTExRVRIZUZyNk1zbHl0MFV0VlN1TWNRZ3Y5V2tqckJ5dmVm?=
 =?utf-8?B?enFOQzlKZThubnFPQzZuTnVDS1JhdnV5RjBIVm9OL3lzY1ljSTdLSEZ4aG94?=
 =?utf-8?B?WjRpNXA2S0ZyTlk0K3NYWEN5b1R4UThTZHlRS21rVHY3TGVzQzR4TnlXYWsv?=
 =?utf-8?B?ZlhjVXVHRWkyNFVrNHBTT2NhSmF2YlE3TG5hazYyOTJSL21CZHRSTnJELzRr?=
 =?utf-8?B?dnhMbUV2RzZrWGJldG5kTGpsMWRpRzNHdDhNdHN5S2JBNlFwWGR2enROZ0Va?=
 =?utf-8?B?M3NlOU94Qk8zRm4xUDVWbDljcjdUZ3BaVFh3dW9HLzJlT2d0YjFzODh5Y1Zi?=
 =?utf-8?B?bHRqeC9GMUQ1QWpEaEtJL0FZbVFYQkZLd3NuN2VESC9zYmk3ZDJKVjFXR1Bt?=
 =?utf-8?Q?CJhxjfvNO3ZjNN6tciigV9A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2d37a2-984e-4ea3-b46a-08d9b8aaf88c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 11:24:30.6705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otr490mjsuSR4onkI2/pNkfYCftrgHYGGaGfTmSrn3FpBikciH3Vz1Td9aPhCvSZLwpUUKDz82HQGUB/3Yty+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

On 26.11.2021 13:34, Andrew Cooper wrote:
> With all the pieces now in place, turn CET-IBT on when available.
> 
> MSR_S_CET, like SMEP/SMAP, controls Ring1 meaning that ENDBR_EN can't be
> enabled for Xen independently of PV32 kernels.  As we already disable PV32 for
> CET-SS, extend this to all CET, adjusting the documentation/comments as
> appropriate.
> 
> Introduce a cet=no-ibt command line option to allow the admin to disable IBT
> even when everything else is configured correctly.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -1102,11 +1116,33 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>          printk("Enabling Supervisor Shadow Stacks\n");
>  
>          setup_force_cpu_cap(X86_FEATURE_XEN_SHSTK);
> +    }
> +
> +    if ( opt_xen_ibt && boot_cpu_has(X86_FEATURE_CET_IBT) )
> +    {
> +        printk("Enabling Indirect Branch Tracking\n");
> +
> +        setup_force_cpu_cap(X86_FEATURE_XEN_IBT);
> +
> +        if ( efi_no_cet_ibt )
> +            printk("  - UEFI Runtime Services not IBT safe\n");

Here it becomes clear why you need the variable also in efi/stub.c.

Jan


