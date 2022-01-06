Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B144865F4
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 15:21:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254063.435552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5TdF-0000D8-Qx; Thu, 06 Jan 2022 14:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254063.435552; Thu, 06 Jan 2022 14:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5TdF-0000AI-Nm; Thu, 06 Jan 2022 14:20:45 +0000
Received: by outflank-mailman (input) for mailman id 254063;
 Thu, 06 Jan 2022 14:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n5TdE-0000AC-5i
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 14:20:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4a96987-6efb-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 15:20:42 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-ouMYoUT-MH-ewPEPu1IEjA-1; Thu, 06 Jan 2022 15:20:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 14:20:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 14:20:39 +0000
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
X-Inumbo-ID: d4a96987-6efb-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641478842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJi+gbWtHJK6xC800PpzqXcAs2bBczYHZAsw2J0Nu30=;
	b=Ay1d1+U4M15+/K4oMyEwGliSyKa4JeIgHnSzuku7XL7wOZaN+lGTpmhoTHx+5AduMaLbbW
	c0G2Z2SOyx7gsG07WWIRfxNH/ALiMNyB0h/1aw8UDSx1uIOFbHVQmXP1Wm5f8smQPW0dzv
	/uWiiNKUtBA70JDbG2LTdOPLecL26Ek=
X-MC-Unique: ouMYoUT-MH-ewPEPu1IEjA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGfz9rcSw+BoNRJ2ZS4tD7LX0WTcSsxlai6Fmp4K+cJSWHm5UsxgLKaVWemPkdxmPbl7Sx6sPTi8cjCZeU8mrJ9tmrDMN2qUsPdJ+Kbn+eRsG1E5D0yN7UHlH72UBlDxY0Do0kXh9XSoMvQmN3jOxo8pBdlC4islXP2TgnhejSRdGiKfql2fNglPrd7KtTuXIVPBB5fGxoG7UbLP+Gm41yx8IO7eSFUu/1Q2Jgc2souY45fKb+cdc2bLlqtefFFaXRWDFrj9r59xgIaW9dIYarFau03QxaPdq3T+XRLCdjUOqrHCNUYeS/M2gFMNXoEcJgvTtdgRerppwPEcBc0Mdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJi+gbWtHJK6xC800PpzqXcAs2bBczYHZAsw2J0Nu30=;
 b=OBORfutVL+X4J84yvYo9Vad+eSsd+hSLueUfdIcOQ5vnp5XPU7P5+kNqjWDFUpjAEBqd04xU131bLry1Q8mpKWtADOoi9NfoYQ9epXRrzi/HbjReBNrGpX60cPpjacinhPYmSWVGwfT02Pposlt0X3SdGR/ax5L8giHYAC1ibm5PLMi8OxLWxtE/GnTvNL8PwRLrENMtZvjSZEylza21D1Tu67VXY67uT8BnIPuHzRd3C+tnNohwK8Derpxiin3tETLVGdK8/V7IQrWl6VnNQyQeV0G3a1Rw4nCQXPxodh75LqqntiaWHvW2w64tO2fK50phZXiu0RN3VIzxRwNmiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7a905fe-3feb-507a-7ce4-ed7dce78de86@suse.com>
Date: Thu, 6 Jan 2022 15:20:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0030.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dcb1e2a-ad67-4d05-81ac-08d9d11fb6e7
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB714952D2AEE0B2FA0DF9308CB34C9@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+/TOmvMtRZXLxXlKQEG6W1DCMym/3KxmqyXBy9vUfYZIKH+3tHpMNzAhXiTZYE+JpGHYBQnCvYrvkjZ+h3oHLNVFnnJeIPUMnlND2kuVGH04qy7swIiEDMi+2FLQJc97Qdhc776VaO9B7PVhhF1jqGo1/mQQFWDv5kXf4yPU+uWGd5On3iYfpdBJ6sDYj75H/LH9J2NI0V3dfFADpCA/vRQS7NkhU9VXzEsgK2W5XLAXySScL71ohkFgy6YKQr2mqjYPuisFZZ/CSwovsJS2v7xwiXlIFAzRz0gkTYVgumUXVaEGryC97wPQBTWDGRMqG35Ccv/vQZUDsHnJ2s/WZmjv4xSdI3T0kNwCAq6XYni0sKy4I6bJ9wuH1nXHrD4QnxKYd+3Y+XZAzamD+mfBcUIpQuaDaMsPPwEoT8cF3dlNiatWNO6oeiTxpN4FltWNohVLawrLhhnpOzhatm/TZfxw145byO3Tuacz/akap/uG/BFkwTP9TalV1DzDe9jIl3fDh7ER5rwqUOnnTCBGhLx0BAHa1Z3P4fihBh+15rn/zkuDYns96rruC3yPAgLZ7iH/Le2O0TxkwK2IbzmWNxyFNP1oqBbBHsUJqfgaJ+Td2tFMTlo+680xetXJQvr8LfI4RYnpgXRD8mv9IVKviyo/kE4di7yHg2P7Ihx7+6I33hNFM0jOYadOUcFMAgsOaFWsbjvSdzsLOdjuf5oaNvHO8iMTTJXPbwpqhLR4YcyHrdeeKZIdhG+f26strjfG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(2616005)(6916009)(2906002)(86362001)(4326008)(83380400001)(66556008)(26005)(186003)(8936002)(66946007)(66476007)(508600001)(54906003)(7416002)(8676002)(6506007)(53546011)(6486002)(36756003)(31696002)(6512007)(38100700002)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnZ3VlFDajJSc0hDWWFYa2l2L2s3RWpmdDFvZWJuc3BCa0Rja3puT1VmQkdF?=
 =?utf-8?B?UkdHQ3FtS2hiSGw3QWgrVUd2MnliTUsyN3NnM3llM1ZRdVJ6TjhJWUs5am9Z?=
 =?utf-8?B?NHJoZ1NJa2syalo2QXBkL1JRZXJSZkpTZ2hHYlhwbkFBcGRueUx1VjNIOE5D?=
 =?utf-8?B?aUI3RzNZUDV1bWltMTdDN1lkTjVzeURHdUFxeHZLK0RDMkFyY1BydnhjS1V0?=
 =?utf-8?B?UzVyVklRUVZLTnlzb3ZObi9GcFRBaEk0Z2xQd1h6NGZNVlNvMGlKU0V2UFBE?=
 =?utf-8?B?RGFpTC9KR01wRnNSd3RJa21QenZ1eTc1VndVd2F5VXZPclUrMmkzSGw4eExj?=
 =?utf-8?B?bVMyTHo0cEEraGJERXBRZmdRenVBM0gxSTJEZkRiaS9KVnR6bzNIc1dtOFJM?=
 =?utf-8?B?aloxK2x1UUpjMWJuQVlYODdWMXU2c2I0dEloRCt1S2RuTzdneVRmdzR4TVlL?=
 =?utf-8?B?cEJQN2kxL0dvUnFqWFhmYTl1TjNUbnZLQTN4Rk9uZGF5eFhjb1BZREhUUHhi?=
 =?utf-8?B?Y0pGakdxTkVtbHg4VS9JQ0F0cWNiR2RHQVVjb01DSmh1WXN3L2ZzNjhKNEg0?=
 =?utf-8?B?TXdHV2pCOCt1djZCbXFteFNySHBXZnFOT1BpUC82Y3ZMempNUjhuN1ZOS3o1?=
 =?utf-8?B?QmJRdmhKZGJaTW5abjl5VUU1MXZYR0pnR3hFeVZ6VXpJNC9RcElEWjdOb04v?=
 =?utf-8?B?QmpSbGRrMG5yRXkxVTZaL1c0bEJXSWYvMzRBWHlBTDBacHpIMktPUy93dUQw?=
 =?utf-8?B?bTJSQ0Q3QmtIN2ZGNUtQV04vTlp0MG5XcjM4THFNL0JiYTAwR0NPaXNQUXNL?=
 =?utf-8?B?RFpLRjhXQzNIQjVuaGZ4RFNkeHlaSG5qcmJvcHJOaUVrVXhjSjIzd3hUWHFH?=
 =?utf-8?B?WWx2NHZyMzdZU2hvVCtqb1B1YW1QVjlTYms3Z1pUd0ZHTTc2WVhJYnJRRmVq?=
 =?utf-8?B?OGJLWUxRTVpocnE2RzdkYlM2SzVsRThaeTlValdBUmgrenE5K2hGM295djVp?=
 =?utf-8?B?Y09yNUNVMEpaMFU3ZENCSXpEenJMMUJSTkwvclN5SXlYdXphK2NRa0h5VDdL?=
 =?utf-8?B?aHdGTFdhWmQxUjFJb015UFVDc3dNNSt3WmphcEoydHpYajZKQ1VGMFozYkF0?=
 =?utf-8?B?a0VwalBpQVB5ZzVSMFFjdFU2ZjBOejN6akxIemhDRE0rNXlZU2FBYUh1SFpN?=
 =?utf-8?B?c2ZDV01Bc2c1N1AvZFV3OXFSK1ExMXVRVUpURFhrMHV0TGkzUXFlZWs0QXl6?=
 =?utf-8?B?dUFvY25kV0pzZ1ZZK3dVdjBWYjBUVDNsYU1ZNnNVNWRpMWk1dno5QlZPWFdI?=
 =?utf-8?B?em5oWU5zOWdBK0ptbmhZMXJYUm1naEIza0g2dUtnbEs5cnhXSGtwUnczbjBM?=
 =?utf-8?B?SVh4WUJjQ3VXNEFkQXZDL09qTlpVdXFmSUhCWjZpL2luSGRsNGJCTG0xOTBV?=
 =?utf-8?B?Wit4VkNzKzh6MHpMN0poNUxRbjVZTDdJbmFva3NtTnZCM3NuNDZOdGRta0ZY?=
 =?utf-8?B?dGp1aHlLU3JXTVZwL1FCaWYwTWtKcnhRbm9MOFg5ME5qbVlQZkdHRlVSN3Zu?=
 =?utf-8?B?VTdRU2NFcU5ja0RVMXowK2JyT3IvV2FjUzVhRWdWZjdDMitPMUVQVXN3SWYw?=
 =?utf-8?B?WkpNTzR0SHNiaW5oTG9JbGJuOFh2MVZ5NmNZMXJLa09qTnRybVgvUjVjNy9K?=
 =?utf-8?B?bk1xNlpTN1NaelVNK1FpQjkzTkxuMVNFMkVVQWlRT3I0UzQvNWQzeHU2Z3pT?=
 =?utf-8?B?Q2hkaW1rVXlNdDg5RzZjem9PMUd2LzkxcjYycmtzNkhhQWZncEZ5UEVUQWcv?=
 =?utf-8?B?aHJnL0xYRE5mVnlvZGt2Y2pMYW5UTkcyVDJsbDlHYnNhL0phQ0JiMHptdmJu?=
 =?utf-8?B?OWR0WXpRNzFBODByM2VVQ0w0Nmc3eTdpRXRSVVFlczhvVlBQVzlPeDdZM1F0?=
 =?utf-8?B?Y1NYWWp2ckhhWmZsd1NLWldkTXJnY0JSVnI3L2ZqSjFOVEpFUG0ySDAzNHZ6?=
 =?utf-8?B?K3FOQ2t0bVVOanJkL0hMbFRpQWwxcDhzcnBKNkNYaEpCS01MS21PU1pYb0Nq?=
 =?utf-8?B?UWJRMXZCOGpIelJIMW1uOUcxdERRZERuMEFxYW9TWHFiWHpJeERZcHVDcGl3?=
 =?utf-8?B?WTIyY1lTMG9wM2d3bHJ3T3hpNlJPMlZRMU1KZ1hEbGdHL25yTTBpaFZuTGla?=
 =?utf-8?Q?GoaTb2jXhfmvOGpBASJAaBo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcb1e2a-ad67-4d05-81ac-08d9d11fb6e7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 14:20:39.3821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1o/4Bm5TMbsjBgMlkuyY8iEmx/CCSAK7lX7lOV/hheeVPaFsFWaAbBdzE3Fh/NsyvnF8IQiwBQxoTNxHj5Esw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 06.01.2022 00:11, Oleksandr Tyshchenko wrote:
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -57,6 +57,9 @@
>  #define PGT_count_width   PG_shift(8)
>  #define PGT_count_mask    ((1UL<<PGT_count_width)-1)
>  
> +/* No arch-specific initialization pattern is needed for the type_info field. */
> +#define PGT_TYPE_INFO_INIT_PATTERN   0

I think this should be inside an #ifndef in page_alloc.c.

Also the name suggests usage for all kinds of pages, as you did
outline on the v4 thread. Yet ...

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2159,6 +2159,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe)
>  void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>  {
>      struct page_info *pg;
> +    unsigned int i;
>  
>      ASSERT(!in_irq());
>  
> @@ -2167,6 +2168,9 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>      if ( unlikely(pg == NULL) )
>          return NULL;
>  
> +    for ( i = 0; i < (1u << order); i++ )
> +        pg[i].u.inuse.type_info |= PGT_TYPE_INFO_INIT_PATTERN;
> +
>      return page_to_virt(pg);
>  }
>  
> @@ -2214,7 +2218,10 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>          return NULL;
>  
>      for ( i = 0; i < (1u << order); i++ )
> +    {
>          pg[i].count_info |= PGC_xen_heap;
> +        pg[i].u.inuse.type_info |= PGT_TYPE_INFO_INIT_PATTERN;
> +    }
>  
>      return page_to_virt(pg);
>  }

... you now only use it in alloc_xenheap_pages().

Further, did you check that when the value is 0 the compiler would
fully eliminate the new code in both flavors of the function?

Finally, leaving aside the aspect of where the value should be used,
and also leaving aside the fact that the T in PGT is redundant with
TYPE_INFO, I think something like PGT_TYPE_INFO_INITIALIZER would be
better than having "pattern" in the name. But this may just be me ...

Jan


