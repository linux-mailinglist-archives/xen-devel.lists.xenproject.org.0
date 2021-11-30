Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DCA462E11
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 08:58:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234893.407602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mry0s-0007xt-E3; Tue, 30 Nov 2021 07:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234893.407602; Tue, 30 Nov 2021 07:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mry0s-0007vs-Aj; Tue, 30 Nov 2021 07:57:18 +0000
Received: by outflank-mailman (input) for mailman id 234893;
 Tue, 30 Nov 2021 07:57:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mry0q-0007vm-RW
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 07:57:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21620951-51b3-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 08:57:14 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-QIw2wq2YNmKVvxB3qAKj9g-1; Tue, 30 Nov 2021 08:57:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5597.eurprd04.prod.outlook.com (2603:10a6:803:dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 07:57:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 07:57:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR05CA0031.eurprd05.prod.outlook.com (2603:10a6:20b:2e::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.21 via Frontend Transport; Tue, 30 Nov 2021 07:57:09 +0000
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
X-Inumbo-ID: 21620951-51b3-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638259034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ApdZiVQqyuQXmeXu334eYxPkml/F76HUNqpOD2xqb28=;
	b=gOkTxPUr9vwquhuo7WCvFccaJVN+BkqPUdVhjUTSTjnbtKPRT8UUQYh//qc0/risnTlYja
	Gd8TpE2801qei/ENBMjWUY1TF9wFh7B7ueRdA/Ton4i4mE8RN6JHdXzyisD8ACHLjYJ+Xw
	NZqDeTVaLnk80UyytjVwbOYYUpX9ePQ=
X-MC-Unique: QIw2wq2YNmKVvxB3qAKj9g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9JRaTpembfwycHRyPbTSFBd0Oh//c5hEx7qXgQRbIGj1b/cAV/AZYTOj+2vVNeD6ZKHwRAnAe6p6I4pVkYr4vqHFTmSxpyq/rOZEGVh80Z2cL5rw1L0EjZ2PvPko8Jf4WD+SjHkFZ7HeCHzbjj5eXRUyxrxoX61HsKxztck06NczmqkDLemToRqmUBSVecSfpp9Lj+I/ldEvy/s+n7Kr1tv+VWdGpmGw19zRv2+3JOgWp35WjNRVEbM18ESs0iAYW8hWSimLm2nQ1nmus59RO5BcJ0FsQP6rFwJDgV0xe/gEp+luf1Hfn0GsMv/eQj2E+poUmbSCBFDuePVfTNzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApdZiVQqyuQXmeXu334eYxPkml/F76HUNqpOD2xqb28=;
 b=f9V2V+waRr6qaoWlF+OwfmNF83ZC8DrZmodOIX1+EtZ4J3+ZQlw7KXT2482ySUUOkdKXRdWObsJkzKNJdUAAp6uvBj2x0+KsuuIaiGjC9pkJl4suPa8k1OiQUzIxCgFVwF3T1YDXBPvh1cDItd4L2iqKPt8uCwqvTKeumiz7OFlzTVlqFt1BxLhY2PUtt7hHuLQdavnF8lmtVjdRa8sLYe0E+z7aQt79Ywth5X7NkPKW+Btw0cPZBftRhP7syJfXquqZbokf0qWywrbVj8945zDUxTW1nMqbPaJ9kJD4/GsTWKXwHfjnMgqBAqL/EP5p74ywWckS0xCgFLNrmTFlgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7224343c-0af9-6610-a58b-291778183a53@suse.com>
Date: Tue, 30 Nov 2021 08:57:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN v2] xen/arm64: io: Decode 32-bit ldr/str post-indexing
 instructions
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Ayan Kumar Halder <ayankuma@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20211129191638.19877-1-ayankuma@xilinx.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211129191638.19877-1-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0031.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88a38c15-90e8-4461-e3df-08d9b3d70324
X-MS-TrafficTypeDiagnostic: VI1PR04MB5597:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5597B56C05FF35269CFD8227B3679@VI1PR04MB5597.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nn/fQS+TeypAt2RLaDwsOMEWBBbtcFJRVCISiK7bRtfKgGgxP3rRypZ3bPgxp/ig9qjYLRh2GVtloL6L35AsCcZ9vA5ihUIZbRkrYYl98PZ/y/ASbrkeWAlOEz1WMujC4Rk3yZWwDFHsrsdFDY+HHRtKKETlySRzOcKACrD6v5us9y+a6u0PKPlxJ2qHgSojxRX2LxHYORJNX/D25m0OJs4nnDlW2NTUZb39f6KOGrIDD5sbNRdorQ93fctkBeS4IFcRbpLBcCWG/zkyeiP+E372mVETK9Q+cm/aUCsRxLJIE22Is7OSH3B9KTUsiWFwUfUBUrMhNMx0rztmCUSQV6XasNxs9/ynHIwuWVk1fBV5OgL3x9dAwEeqm+M7UAaVhVapQDMptbz8oD0f8+3GFiFSJQVRpOMh8SJUpzyXD7MqjTqkFOptGcGHpaT6qtB/Qk91bNclnTfD+d5dzq7g+y5GFAwu1IrHMoY8m6D/VvzgNCmzcU+xxdoGkAmzcBzXM7KhEg9jsFhD+h4DknY8LPzUnEZnTmbQCN7JbWnk/XrGDlFPzrwkGH1NMPQz/fFOoRdxmdPBY0/h086C8B1WlZj6Q1mNFRtCB6080SsdxWxxvGJl8GXO46EzGF5lyQVZIDLw9frPQbqSIhqcFwQdGeYvE2MXp9/2fJOVav9sHeUM59LdCtaYSUuopIvo/mAcjLjW4vofgBYz+vO2Qf2U67iHTiSFPQ4Nnv6GKHSX6D94xgv6mT91A7gbvFmOhTef
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66946007)(66476007)(38100700002)(6486002)(316002)(36756003)(2906002)(5660300002)(16576012)(4326008)(6916009)(31696002)(508600001)(26005)(8676002)(186003)(8936002)(86362001)(83380400001)(31686004)(53546011)(956004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dER1WnRDY0thM3krWkpzZEVYLzlYbjhmWUlEdFluQnUzYkF5UmFYOG5QNXNC?=
 =?utf-8?B?Y1d0VU9CeUQvUXZrNi9PWGJVTW9hVWdzbTgwZGgyRzY0MW5WMzRBaHJPTzll?=
 =?utf-8?B?Zmw4OFk0V2dGZWxLOWJtaXJqdHQ2QllmMlVzOTdXNkZwWVJQb1orQitwTjNY?=
 =?utf-8?B?TWRwNWtCTE96dGxRc1FHTU9vMkxYd2xtdG15bDE3ZkUyb0o1bGR5L2dTeGtG?=
 =?utf-8?B?MEhTdFpQL3JEcWdSYng3OXZzcFhueWdYOW5Pd2xjZXdGWm1ySnhPT01scFU3?=
 =?utf-8?B?N2hRRlM4N1JTVGZvT1hNRGJoT3pkM3hWVGIvOEtyKzRRdGFUaStIbUxvN0xq?=
 =?utf-8?B?WjNvVHVVYVFOQUVYbXpzN3FIQjl3K0VLVTBSL3R3THAydVQ0SEVadUxMRVll?=
 =?utf-8?B?NWFZb3hHZlg0QUNmNm9NeHZlT3JEeXdibnQ2T2NhOFdxdHRSYnoyTzUrVFZY?=
 =?utf-8?B?OU4vdmorSi9pZHY4SHZTODZ2Smk5VTNpMkhORGpLWTV2NExmVjVyeFd2dmFQ?=
 =?utf-8?B?eDZCdXVrWnR4NGEwUTVVcGJTSnFUZFVpdnVMY1d4ZURQM1BIdjJBU3phY091?=
 =?utf-8?B?NXVXL3Jmc0Ixa3VnUkJ6alNheDhlTjdyTVF3WENFc3JCSjlHN0J1N0lENm4y?=
 =?utf-8?B?L2ZxRjhETW5GSWphNzl3YllSc1ZaZzlMZnI1d0RXSlJwMkIrQllRekdkMjhj?=
 =?utf-8?B?bk1oRDVCL25leDNELzlFbXpyV1hPSzJDa3p1Sy9rWDArOWRlVVFKZnB1enlC?=
 =?utf-8?B?UDdVNnVvTjVYQWVrSkJ5RXRtTG9aTkhTeWRkSlROZ0hTeGluUHpYMjlzQ3FU?=
 =?utf-8?B?bGxpeUF6Z2o4MXZ3c014bGxZcllMMlFPR3M2dVFDQ1lKK1hjRnc0ejJSYllK?=
 =?utf-8?B?dWVNd2tEQVc5WDJVSzk4c1VyYzhFNTIxZEhBUFpnWElldFBsL0lGYStCNnNm?=
 =?utf-8?B?L2t1SENoeXR3b2poTGs2b3l5RExvK3hhOStDWmZDZis5YzFOR0JtdWYxU09u?=
 =?utf-8?B?WkVFUE1oOVNRcDJYWGV1MU9aWGdPVE9RcWF4VzM5dkZnYVhMcDFNeW1SZHJa?=
 =?utf-8?B?OTJTOW1EMmhybXFRUFpTNFFpTTUxT3hxK0JsUkpCS0tmTExOdzJUeDFPQUJu?=
 =?utf-8?B?RXFaK3N2YVBibmZmcC9DaXc0M3V1dStBOWFuZWNNT0V5N2tCMTEzMUlBY1Uy?=
 =?utf-8?B?SFoydXczZzVIL0FDN0hsUm4yNHRwdTRUTXRnZHhkanpnSEkwdVdtTTVXMTNi?=
 =?utf-8?B?Sm9FcHUrZFZBL3I4ZjZHQ0VPdndZSjIrSUN3OFpRYklic2JST1ZPbHVkNXRO?=
 =?utf-8?B?eGQyVEI3N0pJUVZVTnJDOEVlZVhGTGtleG9PK09aRE5CNDRLa2pkaUV3SHFL?=
 =?utf-8?B?MXpKSkNJOGhwd3ljVnBXSDZZRU8yNTNDUENDVG8wc1RuczN4K2tROFRPMkRx?=
 =?utf-8?B?cXUwTFY5RHNVVVVwTnFZeHVla2RGUUxSbytSQVRQa3cxWkV3dGU5NldRSUdm?=
 =?utf-8?B?UjF6NkoyZ0ljdHJacjNKZU5TZlFaSFJYMTlVaVo5UVZ5VmNQUm5jeG5RU0NM?=
 =?utf-8?B?TU82RlY1VzRaZFJINnNTZHpVR1R6SVJGSWEwWjc4Wk1kUEYzVE53ZjRybEl6?=
 =?utf-8?B?WEc3aGt5ZU4rYVExUVNXUE1JMnhXRDZkcmtuVmY3cTJDM01JOHBqWEQyU2xp?=
 =?utf-8?B?OHpxRkY2RmxFOWY5aUwzUURiTWUyZnN3RkhaYXhkdjFudCtHOGhncVZ6THRT?=
 =?utf-8?B?UG1OUHJRam5RYW1ZMW5uM3RvY1doWEpqOXZ1WEpKRFl6NitRdWtON2JXYUx2?=
 =?utf-8?B?Wm04MXc1YTlLYndNOGoxTmRDTkhmdkZuOGJnK0NEcXpYaFJSdmtUNE1ieHpu?=
 =?utf-8?B?NTMxMWg3YVVXTTdlY2ltcyswZnNGMkE4eEwzRXZtNFRLWXIrakRKWEFvVmJL?=
 =?utf-8?B?T3pqeTNZaHo3ZW80WUZzb05UbUpNUG0wR04zV1l4Und1MjJ6OWR3ZVQwZmZB?=
 =?utf-8?B?V1FxSXMvQzFaTDhFUzlUdXhjYTVtbk50RnZhcVJZYytMNDRaK2xwcllTTGlH?=
 =?utf-8?B?ZVNSQnZpcDdzUE9sdmFoeEsxR3dDRllOcGJTVDllVk11OWx3dmNwNWYzUEZQ?=
 =?utf-8?B?WTMrVWVGV1dCM1pTbHhDL1dqcGIrQVI5YW9pQUN2dVRoNWtUV1cwZ0NGeHNY?=
 =?utf-8?Q?ShQEQLcYE6SQkOI0AqvqejI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a38c15-90e8-4461-e3df-08d9b3d70324
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 07:57:10.2974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQTkSwpLsmQOl/PdFkdHDYQRLfFgVAJ1U+baSfT7ZOPRDhMlAZekcqJxE3ntbYbHmNSahkZHVMdrvDnIXRk8Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5597

On 29.11.2021 20:16, Ayan Kumar Halder wrote:
> At the moment, Xen is only handling data abort with valid syndrome (i.e.
> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
> could use to access MMIO regions.
> 
> For instance, Xilinx baremetal OS will use:
> 
>         volatile u32 *LocalAddr = (volatile u32 *)Addr;
>         *LocalAddr = Value;
> 
> This leave the compiler to decide which store instructions to use. This
> may be a post-index store instruction where the HW will not provide a
> valid syndrome.
> 
> In order to handle post-indexing store/load instructions, Xen will need
> to fetch and decode the instruction.
> 
> This patch only cover post-index store/load instructions from AArch64 mode.
> For now, this is left unimplemented for trap from AArch32 mode.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>

Just a couple of general remarks, with no judgement towards its use
in the codebase, and leaving out several obvious style issues.

> Changelog :-
> 
> v2 :- 1. Updated the rn register after reading from it. (Pointed by Julien,
>  Stefano)
> 2. Used a union to represent the instruction opcode (Suggestd by Bertrand)
> 3. Fixed coding style issues (Pointed by Julien)
> 4. In the previous patch, I was updating dabt->sign based on the signedness of
> imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI 0487G.b, Page 3221,
> SSE indicates the signedness of the data item loaded. In our case, the data item
> loaded is always unsigned.
> 
> This has been tested for the following cases :-
> ldr x2, [x1], #4

DYM "ldr w2, [x1], #4" or "ldr x2, [x1], #8" here?

> ldr w2, [x1], #-4
> 
> str x2, [x1], #4

Similar aspect here.

> str w2, [x1], #-4
> 
> The reason being  I am testing on 32bit MMIO registers only. I don't see a 8bit
> or 16bit MMIO register.

As per this, perhaps the former of the two.

> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -84,6 +84,66 @@ bad_thumb2:
>      return 1;
>  }
>  
> +static int decode_32bit_loadstore_postindexing(register_t pc,
> +                                               struct hsr_dabt *dabt,
> +                                               union ldr_str_instr_class *instr)
> +{
> +    if ( raw_copy_from_guest(&instr->value, (void * __user)pc, sizeof (instr)) )
> +        return -EFAULT;
> +
> +    /* First, let's check for the fixed values */
> +    if ( !((instr->code.fixed1 == 1) && (instr->code.fixed2 == 0) &&
> +         (instr->code.fixed3 == 0) && (instr->code.fixed4 == 7)) )
> +    {
> +        gprintk(XENLOG_ERR, "Decoding not supported for instructions other than"
> +            " ldr/str post indexing\n");
> +        goto bad_32bit_loadstore;
> +    }
> +
> +    if ( instr->code.size != 2 )
> +    {
> +        gprintk(XENLOG_ERR,
> +            "ldr/str post indexing is supported for 32 bit variant only\n");
> +        goto bad_32bit_loadstore;
> +    }
> +
> +    if ( instr->code.v != 0 )
> +    {
> +        gprintk(XENLOG_ERR,
> +            "ldr/str post indexing for vector types are not supported\n");
> +        goto bad_32bit_loadstore;
> +    }
> +
> +    /* Check for STR (immediate) - 32 bit variant */
> +    if ( instr->code.opc == 0 )
> +    {
> +        dabt->write = 1;
> +    }
> +    /* Check for LDR (immediate) - 32 bit variant */
> +    else if ( instr->code.opc == 1 )
> +    {
> +        dabt->write = 0;
> +    }
> +    else
> +    {
> +        gprintk(XENLOG_ERR,
> +            "Decoding ldr/str post indexing is not supported for this variant\n");
> +        goto bad_32bit_loadstore;
> +    }
> +
> +    gprintk(XENLOG_INFO,
> +        "instr->code.rt = 0x%x, instr->code.size = 0x%x, instr->code.imm9 = %d\n",
> +        instr->code.rt, instr->code.size, instr->code.imm9);
> +
> +    update_dabt(dabt, instr->code.rt, instr->code.size, false);
> +    dabt->valid = 1;
> +
> +    return 0;
> +bad_32bit_loadstore:

Please indent labels by at least a blank. I also think this would
benefit from a preceding blank line.

> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -65,6 +65,16 @@ static enum io_state handle_write(const struct mmio_handler *handler,
>      return ret ? IO_HANDLED : IO_ABORT;
>  }
>  
> +static void post_incremenet_register(union ldr_str_instr_class *instr)

I think you mean post_increment_register()?

> +{
> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
> +    unsigned int val;
> +
> +    val = get_user_reg(regs, instr->code.rn);
> +    val += instr->code.imm9;
> +    set_user_reg(regs, instr->code.rn, val);

I don't think this handles the SP case correctly, and I also don't see
that case getting rejected elsewhere.

> --- a/xen/include/asm-arm/hsr.h
> +++ b/xen/include/asm-arm/hsr.h
> @@ -15,6 +15,32 @@ enum dabt_size {
>      DABT_DOUBLE_WORD = 3,
>  };
>  
> +/*
> + * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
> + * Page 318 specifies the following bit pattern for
> + * "load/store register (immediate post-indexed)".
> + *
> + * 31 30 29  27 26 25  23   21 20              11   9         4       0
> + * ___________________________________________________________________
> + * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
> + * |____|______|__|____|____|__|_______________|____|_________|_______|
> + */
> +union ldr_str_instr_class {
> +    uint32_t value;
> +    struct ldr_str {
> +        unsigned int rt:5;     /* Rt register */
> +        unsigned int rn:5;     /* Rn register */
> +        unsigned int fixed1:2; /* value == 01b */
> +        int imm9:9;            /* imm9 */

Plain int bitfields are, iirc, signed or unsigned at the compiler's
discretion. Hence I think you mean explicitly "signed int" here.

> +        unsigned int fixed2:1; /* value == 0b */
> +        unsigned int opc:2;    /* opc */
> +        unsigned int fixed3:2; /* value == 00b */
> +        unsigned int v:1;      /* vector */
> +        unsigned int fixed4:3; /* value == 111b */
> +        unsigned int size:2;   /* size */
> +    } code;
> +};

I'd recommend types needed in just one CU to live there, rather than
getting exposed to every source file including this header (even more
so when - aiui - this is entirely unrelated to HSR). When used in
just a single function, it might even want to live here (i.e. as
close as possible to the [only] use).

Jan


