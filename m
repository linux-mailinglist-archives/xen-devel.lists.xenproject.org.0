Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4F44980EF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 14:21:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259867.448579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBzHE-0004WZ-Nz; Mon, 24 Jan 2022 13:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259867.448579; Mon, 24 Jan 2022 13:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBzHE-0004Ti-Kb; Mon, 24 Jan 2022 13:20:56 +0000
Received: by outflank-mailman (input) for mailman id 259867;
 Mon, 24 Jan 2022 13:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nBzHD-0004Tc-03
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 13:20:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 748fd4ce-7d18-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 14:20:53 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-CE_DsYsDO2O2gQgMveSrPw-1; Mon, 24 Jan 2022 14:20:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5244.eurprd04.prod.outlook.com (2603:10a6:10:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 13:20:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 13:20:49 +0000
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
X-Inumbo-ID: 748fd4ce-7d18-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643030453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SJri2JJBNhtwi/mcM/e5cPT4Xx1ZW0/ELNEn+lzpNeU=;
	b=Y6Ae6rCLvfaerli892s/CMeHILXFHBLNkBNEW2XmhbPEZRy02zds2a1iJzFETVxBMbZ69K
	rb1hjT5e7P1diajsYIfVcJvDfl2dmfpH9M4JrRD3wxJu9VwEizogEDrhfYxyGpHn+5n+uJ
	9/gl7idLj4If5rENz0yY463aV7kCk+I=
X-MC-Unique: CE_DsYsDO2O2gQgMveSrPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFSIiOIANY+i7q3M26OLNdSRGCvhGQMlZc/+lKs5GI31dc3j5tFTJbeKFa1vbsi50Qg0aXSshlHdnHH5oInJjghAvn3sJD543keLfH9NuQxrVwPBAi3kkHhmNfMj7GHTQjfe8o52uhHfbyNCkzBe1A/5dx3reh73Ldo1YixfK6M8rroJnfFyWelVbKL5ol50qo8xI+ZiqU3auR+ke5OpjonozN9Heom4tiydvfvtTJ+D/2nZfDWomE+9ixMJuWDAB59SFuWnvKWdJEhDAdzrVWHEyyFLvZoIcuvO2syKfjIQonOTLjPKoPv9RzZIi5YzKmB2ZWuNynt6e8l03oX7ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJri2JJBNhtwi/mcM/e5cPT4Xx1ZW0/ELNEn+lzpNeU=;
 b=HBtzw6HV3CwabHFv/GDLvTBcky63F8MRCJwefFh+uFUfAxwxTTNpXtSjG709nzobMb8zQmx8YVxdf7CGkuxQWM5y+7yd08LDkdKbsXShaQPmiNhMr8+4jxpEyhQyvwElY3dq7XxBB+57sA6Op++MqGyjgIopC5cYGYTETQvjGWTOMr2OfLnLJBEzBHrp551ZbK6vAiLNSmUmhu1hHtvtS6gsBXs+z4Ucvm2YspTq3gtf31psAvhUejFWQwkQr9Xnn+sGPqk+ZmUzHy9YRwaZ3d9OjPPGkk1xQzQXVpMGr2/5/cgBUpjLuU4Q6y6kEQAcetdrhHllytlf4GX5K2MbDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f8d332d-1bc3-af71-27ba-a4ff7b6e9514@suse.com>
Date: Mon, 24 Jan 2022 14:20:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] xen/vioapic: add support for the extended destination
 ID field
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220120152319.7448-1-roger.pau@citrix.com>
 <20220120152319.7448-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220120152319.7448-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0170.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fea168e4-e87a-4165-3de0-08d9df3c5661
X-MS-TrafficTypeDiagnostic: DB7PR04MB5244:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB524461FD5EB75C93DB719F73B35E9@DB7PR04MB5244.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wt0J9puCfFGrRXBAJM41JF3Nkd+gOFJyuNG7afg74ZAfYMiqoe7EIIYeY/UyqTPfgCKvKQpfouOCiBPa+gfxihNMyiQLQJHinDWN++TH5bous+vGktmovgIahrN4lgivAJW3X8PF0E3znmDBQXVWlAuAIXqRYG6shy8DAkxkJ3yY+DcIud488dpXrGbO7DUkFELzqVIO3Ety6w9OQrt/We0ssoEy5NJD8sIcoFEGZK1HnbQPRx+lbwnpGz7MBmpPWPFQrqELzmR2NvvNU85cEn5UhdIr+eGdv3c/cNvryCGQsLQZzg1vaoGyV05jO5V6wblx45Q+mb1VFgQLxGlH1ArdPLAEZbblWm/Z/Glmtb/DcmjKOSyFslKbyNuahD9YyN17fIUVHMMWPR/8NKXFeqYCjTmXiGx7QLN0GzbRpXH2QA+LUAKPq6KOf6KtZqE+QKneEzl6i556ALVcAY4WKNRE9ZKT0dQpYgIUB8RvfL0iTFBKhL/wSHC3DS50f+QnsyM7aIVuIU1A1Xcno9p2b+27q2b4FcAmOKY8MPifgldg32mAIPts+xaON0Y9Yq+PD3FceAo8k+QnZ4UJH4PBjxkY/6qq0oqCX+zbqogVmFFlSUBsuHBUNX02PqG5Oe2DUqSUkkHDBT4bgXowdl7CCMbMKccpiLT4og7um66emheGbS+TwmBjwmA1mif0zEM+nzFtQ6Qg82PbiMrrZlt+iFhspY1Bl6npjzjFioQT2P1A7zK9OMQX8RpS4+3klPzf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(36756003)(508600001)(316002)(53546011)(54906003)(186003)(4326008)(6486002)(38100700002)(2616005)(6506007)(2906002)(8936002)(8676002)(6512007)(6916009)(66476007)(5660300002)(66556008)(31686004)(26005)(66946007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmgvVW11NEJ0VFErOThJZkZDakRISG5lREg3Wjl0OEtTTTd5SkUzOUJ5Ulpn?=
 =?utf-8?B?TGxiUE4rL3hScEhqTlRiRjJ0NWxYMjZXa3FmOEtCS3FhVmFqM1llZ0pXMEIv?=
 =?utf-8?B?amFqYWhEdElKNEdnbURZY0VVVGxPajRuSnJ6NmphWlFGdU9YcWYza0taOHJ2?=
 =?utf-8?B?WVJrSUpYNWNtMFRvYzlUbGhFU09iRFM5My9LeU1tQjh0aGhGN0ZtK1ZBQlVv?=
 =?utf-8?B?UjN5VDhIUDQwTTYreUtuWGFxRjhVMk56Z3czOTQ2bXFVSTRydzFMTWNmZ29T?=
 =?utf-8?B?R2U2ejNEaGZjV0Q4TTNSZDExb1lja2RYeUNya2YxcFFvUGs5UXNycmQ3UGQ1?=
 =?utf-8?B?TmZNM0dRdG9IQlZVc3hLcTl0VVZaVlRRMko2ZWNkZUhDZ3BWaWZFM3BIdk5p?=
 =?utf-8?B?a01XOWh2bUpiUzNOb0hGYXd4cjRIbldsbGt3anJyMWdBaXp1bUtQSXRMeUVH?=
 =?utf-8?B?YzE1aGhuWTdNTEtlbFordFdjdFArbC9sUVVtQUdYMG5NeXJGWXZpeW1rUkdG?=
 =?utf-8?B?d0hpeU5vOUJqTWlsTXlqa0VkY3FRL0tDVzZIdW5XREIyT0FoYzdORnBGbzc4?=
 =?utf-8?B?SzZTQm1nMnlxY1hMRW1JVVNzMDlTT3g5bzJ0Q2hXVUYzb1lybU5wUkZ5Tk9G?=
 =?utf-8?B?bjVHd09FM0h4S0JKK3VRcTZITTNBNTZQVTFGUG1ocFowSkdnM2MxR3Y2Ylcy?=
 =?utf-8?B?MnhPN2ZQcFVNNVE0aGR1WCs0a1pobklnZi8yRlpCQmpWMjBYSk9hL0FvUlNC?=
 =?utf-8?B?RTIzYVl2TloxelFhMWVyNmVyeitYekVMN0czc1d4ZGg0ZXFha0paUnIybi9K?=
 =?utf-8?B?dGRwKzJFZDF6YmdxNmFNaDRyVis1Q1NVeFhOcWhTMFdGcGRYSjRhazJPQVl4?=
 =?utf-8?B?cnlZcUUrYXIyVW53Q2RpS2wrUElHckxZYnpnL2RWS0lIeFcwM3B4ZFVzbmRM?=
 =?utf-8?B?Rmp6aUdDaS85dnA4Q0NFV0pCc3llYXVUTFc4akhERHU4OExTTUNhalR6M25x?=
 =?utf-8?B?WVQvRGJlRDBOejVTQVlkdVRmZFJXcTNaZ2ZrcnUwWno0V0pOYzRvTmlGYjRj?=
 =?utf-8?B?dmUrSmlQY05FMHVjMGlCQWJIQ3FDM2tCR014RFlKMWVkQlFiUllrRzBnUUQ4?=
 =?utf-8?B?UGpKaGtEU0diL0xJR0NTM3REbkJseU9DTG9jTURnWlVWZkRndXZTeThQUjdx?=
 =?utf-8?B?MmhjUUdsbERKQkRsK0JQcFBUUUw4NFlKOTlqUUQvcGx0ZFR0SGxrNTFJRU56?=
 =?utf-8?B?WXphdllpM1hNYzRmbmhVbVRiS1YrT0hPQ2RKRTFMS1laRURNVVh4MzRBRVQz?=
 =?utf-8?B?MzhmOU94Vit0MmtQd1hvOHVTQUxMdFlQQUJJUklHNjU4ZWtZWXdCYURmK0g5?=
 =?utf-8?B?U1ljOWI4eXB1dkJkbU1TK2xNdlZ5N05jYlFpcHp3dG1uUXZCcnFOUHM1US9x?=
 =?utf-8?B?MmxHUTArazZCYlhOVlBIdEw0WmlEUmRoZ2RwM2p2bGg0ejZrWWxCZHIzak5K?=
 =?utf-8?B?MXBGMHQrTjZoRmxyck9mVHZKMHBOUzZHWFdhZGczV3A0WHBHamExdFdHMm81?=
 =?utf-8?B?dGphd1hxbkljUkpPTkJiakNDcXR1L0FXMVh2eHBQZVN6Wm9QMzk0MXpxM1ZJ?=
 =?utf-8?B?bXEyY2d2dzdQcUprTVJ1bzBVV2U1VmlvVmptejBxUUsyNWpTOFhXclV6N0F0?=
 =?utf-8?B?Uk9rNnl4NzhmMFpNRTY4U2tHejRwaUNubmZnYi9JL0lRTmdJaWZmb1Z2WWV5?=
 =?utf-8?B?YmQ0R1VYaFZ1RzVpcmhMem42RXJoY0ZQYVZRYVZjTjdtRUlINmYyOWlnKzJR?=
 =?utf-8?B?YU1heDJLOVJzZkxBeDJad01udW9yRXNodnZsYjBrbmJDdmZoMVY1L3JSNkxl?=
 =?utf-8?B?WnpGNWRLWVdoZFJpOWVDWVk5aTAxa2VOMURrSEdtam1HeDRiQ2ZhazlBeE1G?=
 =?utf-8?B?dENXMG51RWdlaitCcFlvdzVzZVRBMS95Q2JHRDJTSi81b2p3LzI3MXhpVFV2?=
 =?utf-8?B?c2plNnpVeTJwWG9lOVI4YnRZTVNURnQ0bElPNCtsM2liVnlvZ29zRERHaG5E?=
 =?utf-8?B?d1R3ME9Dck9Vejc5bmxyUkV0Z2R6NThkc003MVF1NmN2cy9JNWd6Zll6alVs?=
 =?utf-8?B?Yk4yblhQbUk2bGkyOFEwNnk4RHgySlIxa20rYWlKc2tzNFFxOWF0Z291cnFS?=
 =?utf-8?Q?XI4gBVt7184M/k8De1fm97o=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea168e4-e87a-4165-3de0-08d9df3c5661
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 13:20:49.2869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPa1O3WW4g8CxIyOOvrjOtldHf96iQi3pWNxoXz56dLz4MhUC218jstCbbaCjmg0GfXeUdrziMHcICh+2b2uVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5244

On 20.01.2022 16:23, Roger Pau Monne wrote:
> Such field uses bits 55:48, but for the purposes the register will be
> used use bits 55:49 instead. Bit 48 is used to signal an RTE entry is
> in remappable format which is not supported by the vIO-APIC.

Neither here nor in the cover letter you point at a formal specification
of this mode of operation. What I'm aware of are vague indications of
this mode's existence in some of Intel's chipset data sheets. Yet that
leaves open, for example, whether indeed bit 48 cannot be used here.

> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -412,7 +412,8 @@ static void ioapic_inj_irq(
>  
>  static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
>  {
> -    uint16_t dest = vioapic->redirtbl[pin].fields.dest_id;
> +    uint16_t dest = vioapic->redirtbl[pin].fields.dest_id |
> +                    (vioapic->redirtbl[pin].fields.ext_dest_id << 8);

What if an existing guest has been writing non-zero in these bits? Can
you really use them here without any further indication by the guest?

Jan


