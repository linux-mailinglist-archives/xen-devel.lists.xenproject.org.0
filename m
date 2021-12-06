Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7806E4694BD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 12:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238793.413850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muBps-0002dV-8t; Mon, 06 Dec 2021 11:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238793.413850; Mon, 06 Dec 2021 11:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muBps-0002b4-54; Mon, 06 Dec 2021 11:07:08 +0000
Received: by outflank-mailman (input) for mailman id 238793;
 Mon, 06 Dec 2021 11:07:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muBpr-0002aw-0C
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 11:07:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a58a00b8-5684-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 12:07:05 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-IM1ohmDZP5C4gf4y4Ijf2g-2; Mon, 06 Dec 2021 12:07:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5904.eurprd04.prod.outlook.com (2603:10a6:803:e6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19; Mon, 6 Dec
 2021 11:07:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 11:07:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0069.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Mon, 6 Dec 2021 11:07:01 +0000
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
X-Inumbo-ID: a58a00b8-5684-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638788825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elz+xgbj7jJUe9dM4ZRSPj7epxPvJ1nvaPRQGhIGOSU=;
	b=OtLWJaK7bShSsoRlE93u+iJKNoiT4OF8IEFihTONp16KBCGi5AZrgpuBQKFbAFVxP57w3t
	LgRWbOFdDu4Si2gHDhWnDRIVKYif+1Q3bV1nOhJ6Bc4oKvaeQZzwND75X8+1mVbIG+TdAr
	LHCYANpfX24rjHEbI8NVQDL4K4PC5ZQ=
X-MC-Unique: IM1ohmDZP5C4gf4y4Ijf2g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiSO7baha5GGNJ1GZFr1DSqfRUjzUP8+7zc1/SwCVKd6ILUVuydUQBSoQnCQ98rZ9JAp4ZkgT9Hm2ALIIiGGew8CV9+jLeGYkMH9//cS92Lw8c0GX5Ca1cwoa4XiZ7eD7RnfiI+D4SQOkk1H3G1B8EHYZBOM53ey1Q4bai0sMCxYJiPJpt8fI11mVkZyDWoIUFQll5frwBWFGMA5o70XsW1lV+cIuiURk2KE0CnBedH/mfzhE7+9J9Xex5uCzWadZnWLNac8wtDsvGdL+VUIEiifPS7XwpGDxQLIi9sRUNwm1Lhiy+h0zySRf6+zjIRrDK2CfQFxtCRhGtqdqzbxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elz+xgbj7jJUe9dM4ZRSPj7epxPvJ1nvaPRQGhIGOSU=;
 b=EJqjBOS8JguYAtSqy5TwwsBFU2kDKBC+DJYyUIrx9By/RlUm7gVpcChQrenCdNGBbDXwN5/hYOBuezLxwHic1z+kxMKanlegqM4UhIIMDPVFHZTSLIV6dCcQB9K1zSL2Vvdpi1e3y3QXqxpi7v/T7yNIHsvDHfxSFWCLK6bd3DcVUCoGECgROlXCkL3G1TW7nLOB63yC3EgNJNIhVAzOjLUbRxFUZCxLGx40KoweBEZ3ROegoTPAZEXz2lEAGPId53RXj7ovwmjwdI98OGmBulDzMrC4Fva02uDQLoHSSH0dBx21mEj/lxz3xJ97r3MPqM0KZdwL863jT7JkCD2SPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f3a94e22-5136-8cb8-6df5-58899a8bc4a7@suse.com>
Date: Mon, 6 Dec 2021 12:06:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v1.1 64/65] x86/efi: Disable CET-IBT around Runtime
 Services calls
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126163830.30151-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126163830.30151-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0069.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e218d5bd-767c-4817-d325-08d9b8a88759
X-MS-TrafficTypeDiagnostic: VI1PR04MB5904:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59047FF2BEA2CA0D9ED3759EB36D9@VI1PR04MB5904.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	80qAvamlf2D32MHk7j8mv7BFK3IUU7MKVlyEHy1lmURB/Y0GA88j0pLhXRca4740ZGfpr//GAlfV/1L7MYq+1OGLPrFb9sRBAW74ELsqNBMmQAiB6QtyxyV2Jpy2BPFEb5HF6kI4Y3EFvA8B77gBt+mqRfAXa6jMfVIZLC6Gc/RcfRDrqtsmphPtG4w/5HpPBlVKQHe6NNcguGgtuB3fG7W0yAvvKzaZBUsYAVjNIFU1TQjFtwxqKcOzFBABzlS6Qs4FwV+Hd81uNFaDsSyDLkoeb35Mbhhc0xhT9W+1D5ewIbHUI5B8wrl9i9Q259F3SShRiXNFtN+n8vJ6mSZyL62LggqcTcMG6eqAp416V9Tn+stcYBilqKaHnf2BUDkcVi4o2ED/8BE2jLQqSsbe/5vjR2cwrwrp0vGb1R82ftM+6RwYYrYRlNg/FAdjdA0OG2yDhj1/D5ffXhLJtXLeKnzdmg8EYMmIrBAPIyv/GVrnmM4bKew3gGuo1Oea0b2TiXQen7jw46CTVCFG0RiBqsueHPbRLfJ/siFTwF69y7UFOCVv2bs+gUkJSzoPEPgifPyrDYsgpIbHev+aisTiCXxVcl72y6F97zvYJS83PeFklHRCYFeTypgliTbGCN0QxS9rOO82h3ziddl95+zYm2xMAcfYJQg3hymeoi+SAxfxQJEbbWKt69Dq3LaQuS0Exm/4GkhoqksPoLxvqworvIgPbzNbVMHtVgtD+FiRL3c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(6916009)(956004)(316002)(16576012)(4326008)(508600001)(86362001)(6486002)(54906003)(5660300002)(38100700002)(2616005)(36756003)(53546011)(66476007)(66946007)(66556008)(8936002)(31686004)(8676002)(26005)(2906002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUJiYUdFVWp1N3RLQW9rem8ySXZyUTc0cmRwUGtoMDluVy9nYjZmUWx6MEFx?=
 =?utf-8?B?Sk5zZGRzUzBabmRUZ2U4VU9BNGhxQkRoY1lDWnMzcjV4eW8zQVNoZHRvZjZh?=
 =?utf-8?B?VGhmcm8xQmdTRnl6QW9VRytjMkNoN2VMNysyM2NJK1REVUw1ek5BNjNiditG?=
 =?utf-8?B?N094MVIwRFVFTm41dG1ML0ZTd3RJMEIxVENmOVg1UGFNY0Zla3FOc2VwcXlU?=
 =?utf-8?B?dkZQL01ibzJ4WUMyaWg5MGFvN1B3RmludnNBKzM2MDM3c0NWdnM2YUhPd1Iw?=
 =?utf-8?B?K0hJRGFNTDVKbms5L3VmL0M4emFjYjFaUktIRG4zQzBRZlBtaVhrTGoybGFj?=
 =?utf-8?B?QzZ1QjVjRHFleWh2SHhEY3ZlUFBQODNXY0xSNE9mY1N6blhuQUduVXUxa21K?=
 =?utf-8?B?bU1UOFA5QzdJeUJPZGw3R3gzSE5hNlVKTVNVazFub2lMNmVvUVFQL1g0d3Yv?=
 =?utf-8?B?VjJQU2RzQ2RvczA0cDdTNTljYXZJcDlVWDUya1o5MmxjeUsrSjJRQ2lYOWxm?=
 =?utf-8?B?SGRqUi9Eb0J5a2dyai9WbGxoWkYwSVduK2ZqOHVBZko4RndNaDBQK2dZUkY1?=
 =?utf-8?B?NjJocVJZMG0yV2RhSmY3MXVqK05vM3Rha3krNGliS2trM0xMdCsxcjc0clBS?=
 =?utf-8?B?Z2pvRlhvWStNQWlOMWZXQUZkTk9BWnBkb3QwRURLVjZaSVYrSGJMT3QyZzNI?=
 =?utf-8?B?Tk5oVUlka2pmc2NSQ3FaU2FFdXcrUUtXdlhNMU0vL3F5ejV4U0hMc1FBbHBJ?=
 =?utf-8?B?cys4emd1THhwWnFrY2VIZUt1S082RktXZkp6Z1RpNE1sL3JnM1d6bVJJcW5N?=
 =?utf-8?B?V3FLU29IMTlYOWdnRlFOWWpVRjhjVmlWNkF1YVFoTmhlZ0J0Nm0rcFRzb0Yv?=
 =?utf-8?B?V3EzVXJTb2dBcnVTSjFOWUE2TG9DdndrSmErbzl5WFV2cGVCd3d3NkVzN1Z1?=
 =?utf-8?B?S25XazdLSDJDKzR5MU5aOU1DYTB4V2ZxOU9LN3dvYWl1QmlzbWlPN2NCUFpv?=
 =?utf-8?B?UnBjL1dzYkhJWmVlckU1RlBDckp3RWxGeFAxRElKNGpocE12WmxObVNuYmVT?=
 =?utf-8?B?VnpaRlZZL2t6MjhISGhhYjhDRVgzT1E4Q2F4cm1aOFJXU0xGanNDQllLL28v?=
 =?utf-8?B?YVd0SXhTamU3dHBiZFZCOUpZM1p6ZjhndHJNNm5jdDA1YkFKTit3MzJEdkJl?=
 =?utf-8?B?RWhtT3BlWU5NMnAvdW45ZFRLbWJrUjFPRWpXakhpOTdYeFN0a1RZRk1zWjJh?=
 =?utf-8?B?ZzhLUkpKQmMxMnFuT0pHeHNuRllHT2ZXa0Zod2lvTjlHN0lzUWVmc1Bla0ti?=
 =?utf-8?B?Vjl4dW0rVE1Rb2NINUVPSEZ3NFlhU0k1VTNjN2JnTmpuYTNPWGUxRGxRODJM?=
 =?utf-8?B?SEVNUytSYmJYUTI1WVltZ2lBeHhwbG11b2ZpcUkyU3BhZW1kU0FCWTE4R1RV?=
 =?utf-8?B?MmhwcWpPdlFnajZjUG1rU2JYcTYza1A2TzBBeE1TZlhFak5JQ3I0TkZlTHps?=
 =?utf-8?B?VlNHWUhSQnlaMTN3V3loQjIwcjRpMGpvcXdFZHh2WGRPQXdKRW55NUpKWG5W?=
 =?utf-8?B?SmxHY0ZmaUJFU2FaQkR0V3QwMGtpMllFYTAyT1UvbDZvRWlublEvSE5uRVNB?=
 =?utf-8?B?bHpzVTZKcGZER2QwbVpCU2VTTU56b0NVV1l6NGhodXdQbTF5QXJ6V0VGOTVa?=
 =?utf-8?B?cmNpeDJMZFZiS1BOam1PZjFiV0U2U0crTHdWeG00NHJDZkEzcVFMWjhtR1Ro?=
 =?utf-8?B?dHo2T1BRMU5LU2J0cmFNQkIwYTF1UmhBN2pCZm5vdUlDSFpHOWlXQXpiQ3Fo?=
 =?utf-8?B?cmRWaUFEWFZrelg3TWtyaktBTGM3N09DN3UvMmJXTnRDV0kwK0x4eTNmNHVW?=
 =?utf-8?B?WFh3eC9WcXRTZ3JpakNTMTltRmp5ZVZ5aG9tTlRrcHlxbWtlOHJQOWtMc3li?=
 =?utf-8?B?dFhmNnkveFhXMlNZRlgwUEwxMlZLMVJOKzNkeEtoNzZSTHEyZzR3RVhDb0N3?=
 =?utf-8?B?S1NwQUN0V3huc0dsU0tYaXZiUm14eG1jOVFpMm1TcjJ2ZEg3YTFuaWhWbzZ1?=
 =?utf-8?B?alA4Q1JVbVBxVlFJSVBlYXdySTVSQ0ZlS05xUmpmcnJjdnVmUFZ3YXVkMFVJ?=
 =?utf-8?B?WU53ZjQyUHJpWUptYnRwU3BYQW5LMGQrV09qb3B6RlY5NEw3QnJ5UWY3L0NE?=
 =?utf-8?Q?t9rz6Spmwj8DOb+6h3AUwU0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e218d5bd-767c-4817-d325-08d9b8a88759
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 11:07:02.0489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huUg6tLfVygyA5TM4vUpW2z93SKz5xvfDguOq7NNUh1LevfJXEiz8h39pUcomHdxlefyxCtd8VyymhgE9n1opQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5904

On 26.11.2021 17:38, Andrew Cooper wrote:
> --- a/xen/arch/x86/efi/stub.c
> +++ b/xen/arch/x86/efi/stub.c
> @@ -11,6 +11,8 @@
>  #include <efi/efidevp.h>
>  #include <efi/efiapi.h>
>  
> +bool __initdata efi_no_cet_ibt;

I'm having trouble seeing what this is needed for - when this file gets
built, neither boot.c nor runtime.c will get compiled, and hence there
should not be any reference to the symbol that needs satisfying.

> @@ -735,6 +736,14 @@ static void __init efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTabl
>  
>      StdOut = SystemTable->ConOut;
>      StdErr = SystemTable->StdErr ?: StdOut;
> +
> +#ifdef CONFIG_X86

CONFIG_XEN_IBT?

> +    /*
> +     * Heuristic.  Look under an arbitrary function pointer to see if UEFI was
> +     * compiled with CET-IBT support.  Experimentally some are not.
> +     */
> +    efi_no_cet_ibt = !is_endbr64(efi_rs->GetTime);

I'm afraid I consider this insufficient. Even if the core EFI was built
with IBT support, some driver may not have been. Hence I think there
needs to be a command line control to force turning off IBT. The only
question is whether we want to also honor its positive form - that
would, afaict, be a recipe for a guaranteed crash if used wrongly (and
it would be meaningless when used on IBT-aware firmware).

Not only in context of such a command line option I'm also inclined to
suggest to invert the polarity of the variable, naming it "efi_cet_ibt"
(and the command line sub-option "no-ibt" or "no-cet-ibt").

Jan


