Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34E9666E62
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 10:37:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475932.737843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFu1i-0000qP-Vx; Thu, 12 Jan 2023 09:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475932.737843; Thu, 12 Jan 2023 09:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFu1i-0000oJ-Sg; Thu, 12 Jan 2023 09:37:38 +0000
Received: by outflank-mailman (input) for mailman id 475932;
 Thu, 12 Jan 2023 09:37:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFu1h-0000oD-CY
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 09:37:37 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2055.outbound.protection.outlook.com [40.107.14.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be8e1c19-925c-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 10:37:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9669.eurprd04.prod.outlook.com (2603:10a6:10:316::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 09:37:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 09:37:33 +0000
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
X-Inumbo-ID: be8e1c19-925c-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzR31wFCldoDt6e3WBOr51kRz2ZInlq8C/vsEUyEmkgxDSleoq5cVK+fh0qLFMMwPQg/xz+f9AbWJNXRnsgUz0btrZ92sh/dEVZSLtvKCbT8o1F2xDV/LLszwTBeqq//sAofccfmTqYjthtB4pNTpaYSo3E71bnAQZpykhN88xGZ103sgTwUDdG82mJaX805lNpLJaM0IM1Zoey/3CFX0SdOWBbeJzVmcqFKQ43+ASZPJDG9BDkyQszFQvkBRasVzmHTU8Y3wG1yjeAQCdRPTDqHzxGhDKnWMtlgeoaCsRyBbi36oC5Csk2U60RhRdEtt1h17iKbtbhICK/LwztDYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qval3siV5ZTKNWLhov1cDgk4NvpyHzDD1M+ttv7kF4=;
 b=gA7Gbjxf0pte2BFDicWtKQD9o6gAlgFet1bQWJhlvDTmICr2AXGaEQuBlr/168VGF7G/iasi8Wh6Nf5Od3Svty1YihnTW79xieCmAaZ9gQVaf7gAjKF1q3eV9l4y8Jva2JlMA9LB8O0dhcaWtvCIKWGxXOwudOqcXsZ+7S1jlhN7g6K18GXGhy5eb9ARXPKLnJEstXpH1DsuC3KZJVeRjq9z8IK8uQhFt7m0Gv+tFb7Snj5Z0CzHkwssF0rf+eS66hokUUaZVuG5gAbevUIPHPOorDth3G0ImtlN0iU3MzJyDxmL2hHxAv5CfY+CJYnyjwn+Z233vzf0R04O9iOX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qval3siV5ZTKNWLhov1cDgk4NvpyHzDD1M+ttv7kF4=;
 b=KSnrUmtf2TcXsM6WMWp2TZGsNlU+w5vjMbr+4jJ56Goj62w8qVEp33xTAtw0y1cU8kvQXsBeBZ0pmUD9lDlAcmbg3LNuxy7e0+H8pBadUqXp4Hlt6P8dsLQNR39/7nMPx4R9OZCvSSWT3Wghbur4WqzygTYKDuw/UGAuBVW5B4HrcK75zofGLUI5ghjjRV5kP9VLxjg1uvSyIGX3OWNYWdW1Uhhaai4oJwFOh49dl5n2DH9tlo7VpIpngdZ0RdrZeKOmEHRdRMPFHi4F9NuM2Wh+TAFYKdlMJwSBw0b1OhYLCUVqhFHd4Bv63v49bmdnx+V6TNQPqgk5L+8yxdgQZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <958e4f6e-9a2d-850b-3663-40c777932e03@suse.com>
Date: Thu, 12 Jan 2023 10:37:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 8/9] x86/shadow: call sh_detach_old_tables() directly
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <8ed7a628-f64e-5512-efdb-4116a7b88a1d@suse.com>
 <722642fa-4eb0-930a-9755-f7780da65eec@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <722642fa-4eb0-930a-9755-f7780da65eec@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9669:EE_
X-MS-Office365-Filtering-Correlation-Id: c49402e0-6ea5-4b96-c857-08daf480a176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VOS00CKJnur2deSa2gXQRQFQEa0vFl1bHXnzo8rox60it/3KzoA1dCkJJWrzx+tMrKCp0fY18jDzijIPuCSclFnJe4XuaWsNbfoXT/Mv3NSo0z2SUA68O++xwpsJU6TxN+b3F+YuS7DWWa3jrSXerE+9vf4FV5L1nGzgrXvrltbZguFfRJPbbiF9VqcEhuVTRsCqNKW1UUSk0V/VUUx7cOxBWZpqlRfxWVT82wQ9dok+UCHH9l9eM7J13T8DsN1PyZjzA858AomaojsfHsoE60l9TS2Wx0CaoHGjohU7Z8Ay045TAAtQB6v9HvuTgRjDXcvvMvgdaK7fBE6SUsL6yW7++5FdN9VzjO+JyIcHZZo2MEll0OgE72bgkIjfgNxkDUeMFHYgCvctqlzS8qKB5gjJxnQPCDurCZzq1UGqxqFiCE/mbeFig2WlxY7ilogUPMMde3tnOf1iPLatn4v2bHxbXagG3m9FWxL8aKLEyumRj+iEN8+SGtAC6N1oH1O/UYLj0j/SaQm0/u/D5Vdw3eaTCCfv7fEJykp9hVtIO7RzEtY67cxXAlFI68LW+3EAotQVvscewX1vKtcycwM+4N8SDIqMuCUWegRV0E/LWsPcp/bfipMU2XW7MrawFwf5l+hK9LbwXxIG5tRl1ipnOGh/SLVrtuSdY45aPFwbTJMuHpB/wxBhmifg+p9xo6XJGuI+pJ/Po6RCsAlo1ldgKIKaIphliKVT9efr5U3oN0Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199015)(8676002)(66946007)(31686004)(41300700001)(2906002)(8936002)(36756003)(5660300002)(6916009)(66476007)(316002)(66556008)(6512007)(54906003)(478600001)(6486002)(53546011)(6506007)(186003)(26005)(4326008)(2616005)(31696002)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3ZDcnNHY011ajJjeHZWTXR1eXBVMSs1akpEVmZyZkE2aGdJWFFSZFNjbW5W?=
 =?utf-8?B?eVpLZmpyUWUra2JtQjJxZkZmVElIQVk5bzIyRXRMYXhzdFlicFVxTGt2MlU0?=
 =?utf-8?B?TU10Z2xLVHZXdlpLZDlTVkFGVGNFQjhRcnc0ZnJCYXU2N3BzNU1oNXFNYlor?=
 =?utf-8?B?RVdoVk0zMlhzZEVCRjJ6SklGWGYrMGNvcHc5aG5FRXFrbThIZ1lTQ0tkWHZ4?=
 =?utf-8?B?U0RJOVA1V0dDT2xEVGF4Kyt2QkIySjFyblpBbDRreUYxeS95V0xOTXZhLy9w?=
 =?utf-8?B?YXRPMU91ZDVNb1Z1WjgvNjB0aFRRRVNHdTdDbFZXUnRxRVRJYUJMVXNxR0pu?=
 =?utf-8?B?cU5UcmhNaUR3Vy9LRVBneUhRd0VWUldzVUwzMkFnS2p0cjBUc2Q5TmZHa0l0?=
 =?utf-8?B?NU9rbCtCNTdvalVVYTFJbE93OElkNnBxcTRxaHNndTZWeHYxa3FZVGlFRnF5?=
 =?utf-8?B?dTd5UTVOU2dyK1JBRWwyaWZWTkowY3pPMVZVY0l3MlAvZm9id1A2eGtmdEo1?=
 =?utf-8?B?WVk3aThkbVNXT2NnaGtvRHl5RThTekNDdXBmN2RCY3VSNXdvWmJWNWxXK2xy?=
 =?utf-8?B?K1NRelVNU09lRS9icmVVOU52bStIejdtTHlqbDRCak1WV0ZWdHgvS1ZqVFRE?=
 =?utf-8?B?L2VQMzRySFJVa3M5QTR0ekJvemdVbTlBZTdYZTg1VFo0QW50aFBjb05qZ0Rh?=
 =?utf-8?B?UVpJSDZ5TWxEWlZsdnlTTU9mZkxPcy9jQ2FaODU3dHhCOUczYm1mcEdpWG1F?=
 =?utf-8?B?TC9IWVh3T0k3ZHBYUHREV3BINWVFYWFmSjJsQ2o2bUJSRDhPVU5BZSs3OEVQ?=
 =?utf-8?B?SVlkODhUVG0xeWoyb3FOaDlBQ2ZPeVVpb3g1Kzl2Nm8rbWRxcDNWYzdaSVlo?=
 =?utf-8?B?SFhSUVZldWdkLzkvTU5LUkhBQUFGa2dQTGlRdE9BdmJPS0ZPaWpzYUs0eG04?=
 =?utf-8?B?aWtBckhHaWZHMUJydkRPSnhtdWs5cEU3WjE0a2hZOThPRmhrVi9TdWpOcFpR?=
 =?utf-8?B?UEZiQkV0NlhRY3JVd1dQYUVXL25INHJsVEUzZGVKaXUwNmlOalFPR3dZb21B?=
 =?utf-8?B?YW1MN1JQWEI0Nnl5VDB0OFVNSzB2Mmo0M015ZThKSURVbUVXTFdXemNwNU1P?=
 =?utf-8?B?ZDcrdG9hd2JPZFRueUlZbWZNb0VxdlFoMUZxY1BKNHBOaHMzam9KL1RuK1BE?=
 =?utf-8?B?T0ExT29Gd2VhMnMvYU9aRVVVdXZpVVlUUElwa2RhUFAvVDRyQmhBaVh2cVF5?=
 =?utf-8?B?V0Z3VDNkSlYrRG8yOWhiNmZad21xOVZGenpzLzBoelc4MFAycU9MTENDc2Zo?=
 =?utf-8?B?QSs5c2dET3pQWGZ2QjdiZGxPK3lkdldNMUVoNzRJeVVXMm9oWEJQSzFyZDdu?=
 =?utf-8?B?L3REYmFPRDJkMUNSNkpEdG1FUXFOK0ZVK0RMRnc0STQ5bVUwRk5WVmdNeDdl?=
 =?utf-8?B?cU1BZ0MvdWxSTjJZaXlDVmozUTNoSklYMk00YlBMenZPeVlNdDBjay8vUGxU?=
 =?utf-8?B?aXQzb0JBMVJjSDZWL2dndGRCOHloczhmcjlZOXRldzVHTFVOY1IvbWZlekJj?=
 =?utf-8?B?MmJ4ekhwUnFkQUQ3QmhEU2VrWEROUEhQUTlTemxBNStXYzhab2JBU1c3aVJU?=
 =?utf-8?B?S01tcXZJZTk2SnYxRndCc1RFajdkemZWVVQweFpvZnhSaUM1dHhJbTVOQzB0?=
 =?utf-8?B?bjJjVUtuWDVDTnBQQkl1MUlJUExwS1VDRGVobitpSFN4ZGwvdDdrb3UvODdj?=
 =?utf-8?B?Q1JmMWh3VWkxVmc5Wk5TZS9tRzZNTE11aDF5dmV1c3h4U01EbGhBRDlHSFFW?=
 =?utf-8?B?Rm93blJHTzNRNVJqdUg2WGVMS1Vmc0QzbHgxSkMrZUhaSTF6dkRkQ2ZQV09t?=
 =?utf-8?B?eTNNdVQyanJRNWpvNHc4ekVvajdTMXFoL2FCcERhMmlYU3Vna0pOTHdpdWtp?=
 =?utf-8?B?YzExazI0dk5PUGlMbStzRVBmUnEzZzJQL0ptZmd1MGNQSC8xNzl0V2VzNXp1?=
 =?utf-8?B?WXZKaTRhVzdBSmhCWGsxOWZVbHZ1a3Q5SE05M3g4NzNRKzQ2OTF0TFU3dnlt?=
 =?utf-8?B?c2NFdjNtZGZMWGZubytmcTllNjBmYWMwK1JPdzNqYnpZSFV1WXNSbFRvalVs?=
 =?utf-8?Q?bsGwVEWhCHgleRaqbwJEPsP8u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c49402e0-6ea5-4b96-c857-08daf480a176
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 09:37:33.0597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gt2Fk5dCX8UWvoUsfz24FV6A4/u+hJ2pplwAT8S/oN7zrZ9o1jAAHlIla/O3NQrSAytz1qoEZJ62nCL2V+1XfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9669

On 12.01.2023 00:56, Andrew Cooper wrote:
> On 11/01/2023 1:57 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/mm/shadow/common.c
>> +++ b/xen/arch/x86/mm/shadow/common.c
>> @@ -2264,6 +2264,29 @@ void shadow_prepare_page_type_change(str
>>      shadow_remove_all_shadows(d, page_to_mfn(page));
>>  }
>>  
>> +/*
>> + * Removes v->arch.paging.shadow.shadow_table[].
>> + * Does all appropriate management/bookkeeping/refcounting/etc...
>> + */
>> +static void sh_detach_old_tables(struct vcpu *v)
>> +{
>> +    struct domain *d = v->domain;
>> +    unsigned int i;
>> +
>> +    ////
>> +    //// vcpu->arch.paging.shadow.shadow_table[]
>> +    ////
> 
> Honestly, I don't see what the point of this comment is at all.  I'd
> suggest just dropping it as you move the function, which avoids the need
> to debate over C++ comments.

As said in the remark, this style of comments is used elsewhere as well,
to indicate what data structure a certain piece of code in a function is
updating. Earlier on the function here also played with
vcpu->arch.paging.shadow.guest_vtable, at which point having such comments
was certainly not entirely useless.

> Preferably with this done, Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Thanks. I guess I'll drop it then; should the function become more
involved again, we could clearly resurrect comments in whatever shape is
then deemed best.

Jan

