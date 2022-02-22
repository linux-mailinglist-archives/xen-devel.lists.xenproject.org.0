Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0194BFBFE
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:11:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276830.473141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMWoN-0003Sm-MN; Tue, 22 Feb 2022 15:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276830.473141; Tue, 22 Feb 2022 15:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMWoN-0003R8-Ib; Tue, 22 Feb 2022 15:10:43 +0000
Received: by outflank-mailman (input) for mailman id 276830;
 Tue, 22 Feb 2022 15:10:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMWoM-0003R0-BP
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:10:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9966822f-93f1-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 16:10:41 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-K9TkBNYLOr66SrwZN1FCBg-1; Tue, 22 Feb 2022 16:10:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6424.eurprd04.prod.outlook.com (2603:10a6:20b:fc::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Tue, 22 Feb
 2022 15:10:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 15:10:38 +0000
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
X-Inumbo-ID: 9966822f-93f1-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645542641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dwle2ZXWZAzJEDnA7YWLNnVgGg/0YIgqZybk8TMRx34=;
	b=Hjnuw92iTGLbjaQDKMRsmH+J1adm8Y/iQJAGG7YCKRvisFwdcn6hj/AoEeQXpzdXJR16nn
	5tRrcNGx9B2orozqydD03CeGfUBiBs3rOuQb9eQ2SbRxBFBiWcv8ntEYVY7mccHB4wetpD
	RmEWEhbG+lj/qfocPRmqJ+88eRC69PU=
X-MC-Unique: K9TkBNYLOr66SrwZN1FCBg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wcrb5epgzK70DlCDNDtPEiBK612Yl5zYa6x7Sg4Tm+UGmBWRuiWMUdX4IKJzF31YCwDp3knGX0Ze5sfrVdUeOJambsIDm/uMVDTPZ+G8pHA5SCGRvipkXw72Vc+tvIh9OS8Yl7Cu+rngompvmczl7O5wTTzZBRKX59y1x7PpTjlsL89W78SwVq+e6wuEODiOSA77mfyKemXlbRwOoFgzPGcsAZKq4Ey84J8YV88QK37ImP4MPuqJzJxD+u+ta/4BXSimJpboshAw3h3NaqOObS95YZ633OMR08YjsCUbqOmJnWmOq8A8PqLu8PELlCoU98fMAXAxNdhX4oD1fko3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwle2ZXWZAzJEDnA7YWLNnVgGg/0YIgqZybk8TMRx34=;
 b=T8O4JwnlNPGaGG6F5ldExyTGN9zZdlUCwA2ZA07dqjvJg3h83g1aT+QI9Uq8rGsCHgDO4ww2XhnRYooL/eB3BXE7iSEC8KIElh2ygyc8DdvkO+ynJvZ/fgFbTxSiqpPD55HwuOhBKgc9mYOaZ68c60yFGuEjTMqNyLCvbopNSL+xe23ggfEbGvDCaYqzKRh5yTQ1nm+ixQfLIK7DRCXWmvErre7Hit2yd3b9Et3QhNa5gXB3YdOpfnCebSNAHMOBQ+yM0+g71+nXIVDQeP+x/PLIELsHzNHPdBY5zHIWiw75EaGMzNmnZodVyH6tO2OWaMnz/U2T2J1xPCwp1jkClA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33dcff1c-ef64-952e-ef4d-b270b2f1d724@suse.com>
Date: Tue, 22 Feb 2022 16:10:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 13/19] xen/arm: Move fixmap definitions in a separate
 header
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-14-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220221102218.33785-14-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0012.eurprd04.prod.outlook.com
 (2603:10a6:206:1::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed36a2ae-521a-42b2-190f-08d9f6157bde
X-MS-TrafficTypeDiagnostic: AM6PR04MB6424:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB64244E0A5A7F53E39B9CD836B33B9@AM6PR04MB6424.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m/JrhKy6CIiqvnAyro8raE7rmfSD/vbGMHSOUu1ZnKezs42WyMV2woH+iwLohr1atIkPxAfq8XTIgS+av66pd80L79PrM5LZPu9/DPUVEW5U706TUnWrTXnlbROKtLxDiwORfP0JwwE9gwPayz8dOjyDP0ZvOC5dnjmMgGH2My9iZbMk97RoawQzlviD3qAZbH9GerIJrmXsdghnYbR+2xnluc8FjmYpasnrZjkXuWoJTOmf7ZQIZcDiSeosSXesHiN3sz4Auw6bQUgIgMcpcWbKxGLZa/xsAaZMjDUbSqifIaWxkJuGurdIHE56NM+nzfrlSWJfHRtTHQ2flU2uDBly+Gs12JiMjgczQHS94W/c15uXGeqeq+kq0guTOK/9sVwtKHKYmUsRCYPP9cirUyDYgwCAIB/wv6kX79fLVWkXJoqy8EnoWhQSghIJWQRqPNvP9jXmOFXykCjpFct3hlIgB0KWl4+gVBnFr+iozI6v+ovMw5YLMUg5s2600i78UM4SAe5F7GXb5vYApiI8cDlD4a0AugpIAOUo0nukRpuilrf3Xl0VDbK+e7I/BLtyt+J7VDwx5ohdYJamQPOlhv2P4BmdUwDcv/lpBDfGhxBHVSflKLVTu33nt+YEbrQBlj/KxtMGjP8LqT0ZP3H+Gy2ZYuXSXkcQTF43UfrZNcZdt9bTNEKbO3RGNsWZKbKUbszC5sD+rgiff3cwWEXlFc2AFKDT2wO+qwWoyYOAVUKqn9XZW6bVe5XIAM7uZXGy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(36756003)(6506007)(2616005)(66946007)(5660300002)(66556008)(6512007)(66476007)(508600001)(6916009)(6486002)(316002)(31686004)(4744005)(8676002)(8936002)(186003)(26005)(38100700002)(2906002)(31696002)(53546011)(54906003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azhYb2tKd05jV2cvYmRkeElVU0VlZUM4bzhqQ3ZSVkIzMFU4QjhhMTRWaWJ4?=
 =?utf-8?B?cmwvZ0pROXRkTzVBTFluRFA5MXlrTHBYQWFxN21KQkIzV3B1ZW0xSytuRjRT?=
 =?utf-8?B?eTk4ekVZY0pRdmNpeU1adldJMEc5NTBVOGtUZ3JrWi9uaDErbW9LTFdOUENn?=
 =?utf-8?B?MVo3Z0NLb1c3YlkxU3RhTVZueCtVeWdtVWFOTGsrU1ZpZTZCVVlJWHozdmF5?=
 =?utf-8?B?dzJ0eXg4Y1I3NTRyNEtDVzhCQ2p5RjlXSTZpdDdYWWt2WUd3dUJWS0NhS3Bi?=
 =?utf-8?B?azNLOFMvRWlVbDVzVXdpWFZCWVMwYjJyakNQL244eWtWZk00YXNnTnpzK0JI?=
 =?utf-8?B?N0I0WEo5VHU3TGpFcHB3cHAzelVMZ1U5Vm1ZMGhLTzVGWVFpV05WQzVONURM?=
 =?utf-8?B?QTJQM1E2WUV6NlczK0doS2dNdnF0OWpZZ1B2SGdxSStDQjYrcjBKaVhQZmJU?=
 =?utf-8?B?Wlc2VHgrNzBGYnh2Z21wVUEzNytHMHFra1A2YUU0VFdkdmlLU0VyTnltUThO?=
 =?utf-8?B?ZHNxdWwwdzRQcGlzYjZtZmxWdFkrNHVlazEwdmlXL3hObHFML0hZNG5IakFU?=
 =?utf-8?B?ZlRHbVpoYkN1ZlBaNzJoYjFjdVFPL0pZcGEzVmRVUzRPWHdmc1Fkbi8rdXdZ?=
 =?utf-8?B?bzNGaU1DVGFjM3Z3dlZ5b0twQUJnTmFFTDdIWmo1R2p6Y3hMZEg2OUVGdDF5?=
 =?utf-8?B?YlQvL2RRVTQvZWsyWGNlK3YvTFgzMzNWaUkzSUIzUllkcjlTcFZ3S1hBcURi?=
 =?utf-8?B?Z1FQb2FqcDhPTUNDYXNZcmdLQUhkZEhCa3puQ2lBN1hiQkVLcGE4eW1zQURl?=
 =?utf-8?B?Y1FqL0F4aG5yd3E0RjFyMGlmTzZickNvWUF5V2lPb2VVOXUvdnpGZGZlZkFU?=
 =?utf-8?B?Y3l3WGtKYmtBZ3FQTmp1T1FpMW9OUEpTOUF5c1QyV0xFS1EvcHFseW1wajVH?=
 =?utf-8?B?d09mVmxlVmVmcWxuMVFDNXl5cmlrSXlGTjQ2SlRpbWNubVA3NXdCaGVDS3gz?=
 =?utf-8?B?TDMrdm9oUmg3eE9OL2VLMVlrWkp6a0lLZ2xEeEx5aEthczNGbFZrQlZ5S3Mz?=
 =?utf-8?B?aHFmQXNrL3dxTEcwZHcrMndHYzRsRTExWDhPbU9jdFZnSjIwVGRRZFVacUVR?=
 =?utf-8?B?aGJUNzN6Nk1sUUN3MC9VaGJHT1RUczdXV0VzWCtFUjFXWkdJdHU1elFxU2s3?=
 =?utf-8?B?OFhGYUJRSXNodkpydWRPdVliZHMzbGgxY0R3TFBZQTRlcndta2liZm14NjBC?=
 =?utf-8?B?L0dRbUloZWE1U2pqNHl4d0lCeUl6UXJGWmkxNWRCZ3B5eGNMcGhFaVF1aVBH?=
 =?utf-8?B?NndrRGhLNlorRVBFRllWdDlnZWZYN21veDVLaHpNSDZaSEtZcHpSOHdUd3lB?=
 =?utf-8?B?NXBXT0RTR0pYNWtteVdscFF3bmpOL1pyU3FaaUtBU1dOUkNGempab2xqVUJZ?=
 =?utf-8?B?K1JjbGRDTUlDZHczdVhnYzlXZ01YTk9uSXcweElFSmRJN1gxS0o2QVJERloz?=
 =?utf-8?B?bnZFSklINjRUVzgvSnlSanVBSWhYdGduS3FpcGdrNW1adElIWEMxMld2QTdH?=
 =?utf-8?B?MVNOcWRNK2pBTy9nWW10VkdzR3gyZEdXUm9ET0s4aGRDVEdMUjJxWHY3VXlH?=
 =?utf-8?B?bVMrOHpYU1RsK2RRRjBDZ0VzYkE4TitNRmVFWmRWU1hvS3pOMEpaOWcxVmdp?=
 =?utf-8?B?Q1VvRzF1c3RiTEVvbHNRTDE3UWw5azBINlBqZUFpYm9lQTc4alFMaCtVbXFj?=
 =?utf-8?B?Ulg1UHp2c3BNYnlhNUhWdUx6Ung4NlhhRXFvU25LeEhHYWN4R0JZbWU1RFlv?=
 =?utf-8?B?aEpDTVljdy9qVWNKOHh4QTdFM1JhSWp3QXkraytIQVZ1VlVSWGVzK2dhamMz?=
 =?utf-8?B?RjhXV01nTHF5NmRqNlhTNWNxN2t3cllkN2FrVHY2dytuV01NK1NjNEc0aUU4?=
 =?utf-8?B?WDlROVNwUnliNkNLNWpPUXgzOTlYdjg3eGV1SU05U2EzaHRxQWxwUWI5ZTJa?=
 =?utf-8?B?elByNFJLQThsYTBBNGg3TlpQMEVLcGhNL0lQU0ZMWGYvcTI1SUpwNHh1eHZN?=
 =?utf-8?B?UVR2Y3F2TDVlVDN3b09vMjNjbUwzZ2RUM3YrZjhQczMrNlNFN0I5MUkvYllr?=
 =?utf-8?B?aUVlUDhrTnplSnFaQUFJeEg1QU5Ycm5EVlpwQUJ5TmpuWGFOZEVUNEtZNU41?=
 =?utf-8?Q?y8NldhVgrzU7DNRpyWtZS/c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed36a2ae-521a-42b2-190f-08d9f6157bde
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 15:10:38.4253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPSb/PNfh1CydVZXcFSRnolOxZNUaRZ6CsmT+dCvbFWY0TMh13VrWhlUWUArvqHvkTwcAMA9/0Ymr42MCcL5qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6424

On 21.02.2022 11:22, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> To use properly the fixmap definitions, their user would need
> also new to include <xen/acpi.h>. This is not very great when
> the user itself is not meant to directly use ACPI definitions.
> 
> Including <xen/acpi.h> in <asm/config.h> is not option because
> the latter header is included by everyone. So move out the fixmap
> entries definition in a new header.
> 
> Take the opportunity to also move {set, clear}_fixmap() prototypes
> in the new header.
> 
> Note that most of the definitions in <xen/acpi.h> now need to be
> surrounded with #ifndef __ASSEMBLY__ because <asm/fixmap.h> will
> be used in assembly (see EARLY_UART_VIRTUAL_ADDRESS).
> 
> The split will become more helpful in a follow-up patch where new
> fixmap entries will be defined.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


