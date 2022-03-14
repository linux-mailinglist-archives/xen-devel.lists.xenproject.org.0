Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F18AE4D86AB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 15:17:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290256.492213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTlUz-0003xP-An; Mon, 14 Mar 2022 14:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290256.492213; Mon, 14 Mar 2022 14:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTlUz-0003uW-6l; Mon, 14 Mar 2022 14:16:37 +0000
Received: by outflank-mailman (input) for mailman id 290256;
 Mon, 14 Mar 2022 14:16:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29fN=TZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nTlUy-0003uQ-D7
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 14:16:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a34426c-a3a1-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 15:16:34 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-BwRe6lNQMYGeUGr60DaZ0w-1; Mon, 14 Mar 2022 15:16:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5995.eurprd04.prod.outlook.com (2603:10a6:10:8e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Mon, 14 Mar
 2022 14:16:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 14:16:30 +0000
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
X-Inumbo-ID: 5a34426c-a3a1-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647267393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lKy9kjb4F95P5+EZuYqqtKU6trViXlEUaxZ/EqpPj8w=;
	b=OUjxjJmOUAsz4ZD4e+2wisrV8T39qdZ8St3GeQRRuCE58FBiExAxmL7kXNaAwdTpdgHGsW
	2zw0N7w2Cjvovz+pj9R/F28IfTe3sP19qj1at0qd48ANHoOf4mnBFtr/Ot/6AyO/zLdAiA
	S8C/Bw8zOAQDD7nfpWE/HThhzXhoxjc=
X-MC-Unique: BwRe6lNQMYGeUGr60DaZ0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFA3uquhWfE4LI1miSKfSBGXaKbU2bhNcRvHJCtL+zYetv1rL+kQ1u+u0QSi+XHuriQdtaA0rQmAGZrAO/JUN5NV9uw3Nnx6QEFQsBv4EeDe3eLVc86naf1E6ZRoGei8rdLhhJOokjXsNOyZ1ReUrIpEqjaCk1dvJrc+npm9aORdEYl4eknmAPQa1MMONCcH4zYWbqYv1fWdF8YATdKL7qvhDzC2eEaFtMu1zM4gXh/Q5c0PwObspr/+xnNHAthlk1cD/CXi2xRLIPigZNKUbOVf5GZN9bFdf48jMJ1mAl8yhbjGkaFbDRa2eZVtO/umWFyEnW+pe6kUMO0JEX7x9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKy9kjb4F95P5+EZuYqqtKU6trViXlEUaxZ/EqpPj8w=;
 b=mRKwymn8j0wT/0hlEk+C+lqTl4XR7LCkFV4tCnWsRO+oKO0TBCKI0jEO/XO8Kkgz+HrUSLNTMTpWMKjaZ9t0YkwHChOUwQRoA9EqH7WnQZwNQqTjSIGZLaRAvj56QR69CkAaZuP3pb0ljONzqQmb0pP+YSpIgoz1VW2XeJL16iJ7IzqMjcboH9MdyDndlVrLk/YUxJrnE6kY8jF4WAVO4KyhDbpFJsm59vZ9wiKxoY02pOlRWJ7Yfv+jSP6ypQS8aX7H99YGrhpNY/kNTulV4WLnb0tE6FPG1rB0oAYd/DRXzxKVJ0nLtWpfhjg4l7HioJ1oA+2wJsRgm3J2Nca+Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c542fbe6-8910-4dd3-aa6b-41af647c728e@suse.com>
Date: Mon, 14 Mar 2022 15:16:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/cet: Clear IST supervisor token busy bits on S3
 resume
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220314110034.28498-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220314110034.28498-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0021.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5761c702-5dd7-4e64-3895-08da05c53c0d
X-MS-TrafficTypeDiagnostic: DB7PR04MB5995:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB599571433E8005C9F359AEDBB30F9@DB7PR04MB5995.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wOwMUEz4+niUTXYfdOSSPVKUNXSyMjC67iSiqgcuaY2YdUYxG/zk03Xf1gpUT1fXgYXXgOMHqHZK27HppRdGfEJox40XujKpo93d0HVx3nF7SqqNPxqzVgvZO8wBPDnP7LKmyQ+FVCDDqjG6oytodOoUJEIGaLn5dek3GeQrH2XzBrdPfRbSMaZFHc1bJYoeQILc9sM2yGRQofZXGeuBTbiD6QBq3cvfBeBTp0RvZKQiZEe362jSZRbC6aQpR9o+UR70DrpHX5op5Tt2hxLYcQb6ZCqqamIx2emrzT6uUdvDdvvPpUaRJbv/eEnibQyjU1aVpVcRPuS0g7jawX90ov3FhzvX3FvZPBRxAlABxsiFOUoC3AO1WOZB6L0OwbHCP+vCULnUr4mjQ69CiJxVDS5e2DnIX/CJG4NGushsoCWipHt2F+sCIbzgvMIy7EDMkRzi13PTMX4GcWWeXOKz9lSWoZ/+2YW8S4T95USfYRtUOI6SYszzVXtNFyvAH61qfdLbx8nVsqGSSrr/IBxEiWTP2krQ6RfbDNuuUb8uYUumAf2v1kFCD4hbUrs/tfFrDWfMHTI23pzUfqgbUIGGA2hJGrqQ6OZZ0Thf+VrMZRHh5Po9WGAQ9qIM4Fcj0A4VjKUa5Gbf7JIVQfhojT6CpvN6fvMViXz8P5nP9hPLzMwadONNmo39W3mhhd9QfP5YQQnpDPEKHVCiO2PQmDDKF2Y8gMVFxGEufFmTgJLWCUw0dqW8yEl8RsLMjW//uCDb5srnVOwkBHFSNXspWMllplXFpaRdNGC7Bn9HsxAapQYU0b6jh5taBLi+891IhiOUFeH57lWyona0Uk0JncRzqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(86362001)(38100700002)(31696002)(6486002)(6916009)(54906003)(5660300002)(8936002)(2906002)(66946007)(4326008)(8676002)(66556008)(66476007)(36756003)(83380400001)(2616005)(508600001)(6506007)(6512007)(186003)(26005)(53546011)(31686004)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEppWFVCSzdaaU44cjZxMUtvOEdnUTRmakorcUpiUGJNTVdTLy9lc1RvQmRP?=
 =?utf-8?B?TVUvaEJxbkJkSWtKSHJ0WWFXWUxUS3MySC9KS213MXhMcEMrT052c0N6MWYw?=
 =?utf-8?B?YVA0SWhha0dhanViU1J0SFBzS0ZYczNBVy9qcndaeit4QWRER2J0RzhvQ3Rp?=
 =?utf-8?B?dStCU3pLcDhJVWM3Z0JDSkloTktwSXVwbncwVHE4b2gyb29wOWdBeXpieGRk?=
 =?utf-8?B?NHgvTzVFL0RRKzVBTlg4ajVzZmMwWEJETDJRV1ZmTDhockRYSjdQVElldVpE?=
 =?utf-8?B?c0NKUlR5eEw1Y0ZoSVV0TVR3UVRHKzZrNzdMckQyZEVNVnpOcVZZM0JRWm5z?=
 =?utf-8?B?bHN2bEFydzFqZFpzOWs5NmZVRk5vaDVkY2g3VnBiYkM2bFFRRFFKWVA0QnFk?=
 =?utf-8?B?OXVCT0ZkM2xvUEUyc3hzWFVmbUN2djdwakt1UXFlQXZ1dlNheU5hOEwyMENo?=
 =?utf-8?B?ejBEWEJXek9jVVp3UWV2SFVHRnY0ZzhCanc5R0J4VWEvQ1FWNmJkZGdFWi91?=
 =?utf-8?B?ZzM0VDE2QlA5Mm1ZR2NDWkpPSjZRR0k1QWs0Y1FqYWtuRmg3bGk1VkNNcjVj?=
 =?utf-8?B?WTVOV2tGWUh6L3NpdnZ2N21XdHFyRXpvSEN3RG5JdjM0TFFZZmlWejlsbTlx?=
 =?utf-8?B?ak9LcEJMTnVrbjBqZFhYVHZUOEVaWWNPMElyWE9NdGp5N0hGQ3NyWW5yMkEy?=
 =?utf-8?B?VHQ1SHRMOVkrVS9LS2VGdGltcmd0WmszU1A0R2owR2JiSzc1TytZMVhtSjNR?=
 =?utf-8?B?K3psYUxOK2NRRkNDa1RQZFpyQjRVcGFFS1BUM3BHUTQwdDNyZkVlTStVQXZI?=
 =?utf-8?B?MUFPL2ZFT1A1TVp0dmZnaTJMMVBycTByS1NoL1JpM1g4K2xocWpiMUFtVXI3?=
 =?utf-8?B?RE5lcGZuOW5KUyt4UEN1NGF3Uzh6R2cxTkZBUGhnczNINmpxY3FBdllBV3Fi?=
 =?utf-8?B?K1hNQlBhNkNHckQvZnJ3RXdybTZSUDEwNHRnbUVIS1cyN0tQb0pxUyt3ZGND?=
 =?utf-8?B?RU41b3FKYm44VUpWSTJZcGRVdnZrcStXWVdSRHlKSXljbVdRVktaT3ZnaHdl?=
 =?utf-8?B?ZkZwZHFWZEhESTJCV3BuaEFPSnVSSnd5MTR1cGxWTEJmTU8vTzkxMzZqWDZK?=
 =?utf-8?B?UjVXdDFqeW00dGVDRWdwUnc1VDBjUm5RZHVaNlVocWZxN3A1L1ZqOFBJcHA3?=
 =?utf-8?B?anVJK0xMT1dHNU81N0RUaGZsdUJseEUyNXVRRjYvY25GM1JIRUtBNlZvUEJv?=
 =?utf-8?B?b2NacDJhWVplL0djeE1aTDh2b0trSkVRK1pkeFJDWFJpQmFJLzlTRXFJRys5?=
 =?utf-8?B?NW9FMG4yRnJVVlNxK2VBM1oveW1OK0ZTRFVRVEZnNDQ4aENsK0FFMVBIbDM1?=
 =?utf-8?B?QTEycWR4NlJ4dGV5aVpJR3dYSVhKQTlHV0hLemhaQmQ3anRLLzVBZUdlU2Vh?=
 =?utf-8?B?aGV5UnlVcG8zZ29aSmxzalRzVlVybUF0SW9wRVMrWlJkOC9MSFRNZjdiaTRZ?=
 =?utf-8?B?MS82M0pINXlSTWhOVGt6MXpScU85SHF1a24wYVdmbGp0K0I2MXZCeCtoRlJv?=
 =?utf-8?B?L2ZkL0lLdnZQVjMvUTNJaHdlb1FaVFU1Y1lNYmhkVmZSU3d0V3VMUjRXNmNi?=
 =?utf-8?B?aWVxbHlaTjVNTVMzQmVqMit5VVE3cVk5a0hYUjVjbFphMmtUNFdaTEJPT2o2?=
 =?utf-8?B?RjNRUysrMGxRYWdzMlhyUTgwSGwycnJ4ZEcvOEhJNWsrWXVuS0JHdE1kWlVD?=
 =?utf-8?B?cHNMd0pVc0pNZTBtbktYRXJtYTZvN3krcDc1RFBuNU9zVjhxU1Y0OG1BUkg4?=
 =?utf-8?B?QVNmb2dSQllkYkE5dklEUUZYWUdXQllBYVpwc3BORnZLNGI2ZlpVNFFuc3FD?=
 =?utf-8?B?UDR6N0hqdTkva2FOU3ppdEtKUktSbXJ6VGlZb1lMT2VrU3E0R29jcnc2M2Ra?=
 =?utf-8?Q?Q8vC16g9H5vZ9FZ/eWNv3OQ7hWh7ykw+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5761c702-5dd7-4e64-3895-08da05c53c0d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 14:16:30.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qP75UEEd3bc5V0uGqaFPIeo56sgp+BfsplwSb1bkuwq6o7iCxdwtUMZ4nQSNIw/gmIpD6nJKGEtB3izzsMJ2/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5995

On 14.03.2022 12:00, Andrew Cooper wrote:
> Stacks are not freed across S3.  Execution just stops, leaving supervisor
> token busy bits active.  Fixing this for the primary shadow stack was done
> previously, but there is a (rare) risk that an IST token is left busy too.
> This will manifest as #DF next time the IST vector gets used.

Under what (rare) condition would this happen? The only scenario I could
come up with (which wouldn't result in a crash anyway) is the NMI watchdog
hitting after a CPU was already taken offline, and the handler not
managing to complete before power is cut. I think it would help to mention
one such specific case.

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/shstk.h
> @@ -0,0 +1,46 @@
> +/******************************************************************************
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
> + *
> + * Copyright (c) 2022 Citrix Systems Ltd.
> + */
> +#ifndef XEN_ASM_SHSTK_H
> +#define XEN_ASM_SHSTK_H
> +
> +/*
> + * RDSSP is a nop when shadow stacks are active.

I guess there's a "not" missing here, supported by ...

>  Also, SSP has a minimum
> + * alignment of 4 which enforced by hardware.
> + *
> + * We load 1 into a register, then RDSSP.  If shadow stacks are not active,
> + * RDSSP is a nop, and the 1 is preserved.

... this. As an alternative I wouldn't mind if you removed the redundancy.
Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


