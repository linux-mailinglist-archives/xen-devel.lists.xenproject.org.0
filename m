Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5657752305
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 15:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563152.880184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJw49-0004H1-Hm; Thu, 13 Jul 2023 13:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563152.880184; Thu, 13 Jul 2023 13:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJw49-0004EW-Er; Thu, 13 Jul 2023 13:09:05 +0000
Received: by outflank-mailman (input) for mailman id 563152;
 Thu, 13 Jul 2023 13:09:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJw47-0004EP-Gp
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 13:09:03 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f691731-217e-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 15:09:01 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM7PR04MB6933.eurprd04.prod.outlook.com (2603:10a6:20b:10d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Thu, 13 Jul
 2023 13:08:59 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 13:08:59 +0000
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
X-Inumbo-ID: 6f691731-217e-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgMW0twK4Kmt7AK5PYyrDX5/Js0krtQ5U55SKrpY3p0WjKoVLnP8oeYbxdHxbsyLLu5Ivicsvk2VdSu5rH/zpNhOCAloJrUfbJk+/Nh6OwHRJkSxKnGImRfs5siZtFu13i3q6sp1xpixyXaKjYj3E0LE86wAc8HJMgJ7tmH+o1WwoQ9/fddbI6DOTrUsGSNF4au0TA/R2nl9P1VXzV4XR95NNVXXfXYmaalFlXaVt50pEDFxSLpfcci5IrNZH4glL3EcTnWhWguuLwsOoQWARS3SROHcMByzwJrDfdd6f3XWfgoorbTIEodXEFmOKLJeWTm3wR4zaU5OT43NG3XAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRGt5nOPXknVEwGQlNXG3ZB3qCaI9fOSOZb+oc2CknQ=;
 b=ghu0LQPwrfRKrYy24FeoaiIqzrPV3WQ/eR23RTihHY3zpPMex788ppZFknCcLNbZib06K1BVcbps0zQ971G7MiiHw7PskIeyA5b7rjzhUDmO4ac4YVz4HduJKEw4O+WU05t8q5A39OoPD7yv7pmpj0gG8afKzQPts1gJw6JFnFyVaFbZI26ZQncdRolkTx3qCVYThIUAVEyPnvi6GEUIbhYMbeXsp6gORxIiH0bS1VCcr3DjhcO+LD56zjR9ezpAAQvbLatnN8XHD16SV3NtTLD7cWq14F67d03Q5F2uuc6j7hXVyR6hJyqM2NHG+m8zHFMZR0try4sWhOFkdstb7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRGt5nOPXknVEwGQlNXG3ZB3qCaI9fOSOZb+oc2CknQ=;
 b=AbtwiNeuRI3qc8F6A3Qkkm+HdkLEl6xjvojbfSeGYzdDOR9ZLc1grgXzfhz9ApvM2qiNI2AYgM7P4xrcj39S3yVFfcigj2Lb544oe5+34iirjA7EkFSdIsLlpUaI7Erh3IFT1excKdOvgbjDyKrdSTZOqwCasQKB7kjAwzxsZ5c8I5wqB1FS0TJyRyWQFBMrj6HFNHtH6ZhZq6uKJAcy8yzbEJi2J4yGW21gvVVhZEPZG7vhNnE7XfN9hn0NCYx7NyBsrxTNg6MI8YTs00ss+KjrQpRUwJeDq8vwblrBssbNy8qYv/yqui13/wxJtm9dJTK7/QJ4MFLttzjcJceYgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a3664ef-6b58-cefd-ba42-f4b70da348b0@suse.com>
Date: Thu, 13 Jul 2023 15:08:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] x86/APIC: include full string with
 error_interrupt() error messages
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1689191941.git.ehem+xen@m5p.com>
 <062ed51e7529d282b6e336c8b62734afaf21979f.1689191941.git.ehem+xen@m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <062ed51e7529d282b6e336c8b62734afaf21979f.1689191941.git.ehem+xen@m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM7PR04MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 34201bfc-6831-4f6b-3c9f-08db83a25222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4EPrmHdeRKNJ9amwglQL8hK1KhIGFBesNNc3Q/pjttb1BnWP92wHD3joVDyW7aJpmRqKc3WVNAR0F/xArI4p+4ijp1XnGExr3j/mJBbI4Xk5LAqyerjXtZws6p8ZNUh8vDxrpLweZZljVFBp6Z711Aeay6rhmyUow1sR2DExkgzY5oCIT323vHht3kG3OlNAUvF+hqPDi3dvrDcq6vHuhrATDjeiIQWXoYBNfYZPrvz0V28bv2TW4izmI00TPXqL5FeNM8OvnyIKZnbSWEbOSKej2jcyevD64GKbXtamQHsXvbB1n1TFzpbfTy92HTZGaEXh8LvcDEd0w6PgBXC6+CCrfYBWgsY03mJbsHBsYP52T+lyirX57btr22ZwO4DfnMrkcO/HDBtsh6C6Rp1H+SZnm8bGCKi/cnQec4HcKMo3OnYyLsyshlDIwL1gZMFJNDL7CSQlFT1PU4kEk15WOXVkbVWf2FEOq+m1YgF2Z5IQUrrSG43Rkc9EHBbppYIIrM3/RAiZyJka5IOsNuvOqd3ZY++4vUpBb4sgA3uOwrySIOchNISTiPLGPIm6ulflGgG20A86CVJrsywoBcJeHC/6JvE2j19iZZzG2Br6jLGYDE82CcDZTxR4E/4TUwDQRiPaWWUKKpJ2jPA0uML7UQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199021)(54906003)(31686004)(41300700001)(2616005)(2906002)(5660300002)(186003)(36756003)(26005)(8676002)(8936002)(53546011)(316002)(6506007)(66556008)(66476007)(38100700002)(4326008)(66946007)(31696002)(6486002)(86362001)(6512007)(478600001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjdkTERrMWxKcGVxVHdZQXpBaXdxQnJUUXAreFVBd2NmcFp5d0o2emZBU0Rk?=
 =?utf-8?B?b3Z0VldTZHc2VTFLbi83NGorRTRZQ2t1a25RMGQyVWN5SktUWFlIdHNROUIy?=
 =?utf-8?B?MXczajcvWGRkTkJuZWptcTBTeXo1a3Q2bUh3cUJpTXFpNjczTDQ0LzZrRHh5?=
 =?utf-8?B?WEZadXNIOTFUZzkyeGhlWjgvYS9IRFIxUzVIZXJ4dXQ4MUZnOEF0dlByRFM4?=
 =?utf-8?B?MFNkUmEzcTJvQWlqc2hoQWZ5SGtmWEZUeklUS2d3S2dLOWFZWEVsdnZ0dXFi?=
 =?utf-8?B?bXp5a1o4VjV3VHNJZHRkWFQvYjZ0Ny9zVWRNTm8ycEtYS3dhTFo3dk9zRGdh?=
 =?utf-8?B?RjZ6U0JabythZDFNY1pCaHRjMUl0QnVXbXhGaGRPUGduZW9WZEpNUVliNEI5?=
 =?utf-8?B?V2V2YkVpUlFkeHAwYjRySGpLRmNROGc1L2paQm9JWlVzbk4vY2lhQnA0dUxZ?=
 =?utf-8?B?a0txc1RrWU9zUzM4MUtNbVl0aUVnM2xhaGh0anpmbkpjZHl5NUkzaFJOOCtu?=
 =?utf-8?B?bE1IcXZYSlQ1TGZvMmJCbXBBVG1xdkcrcWhQaHNUZ3pIY0tTZ2Npc2RKSVpl?=
 =?utf-8?B?ZzBkVFE0S2hKYWp0dmpFVFhaMHRIcXd4c0g2RVd5aU95WjNUdFpWUUE4VUFZ?=
 =?utf-8?B?YS9ud3hHSS9TWVRtVk00ZDNnK2g1K1cyV3JYcjNFWGxIY1lJRTlTYW9GRFJ4?=
 =?utf-8?B?cGdkS0xYZUxTalpvQTZIRnlybkxTUk9nUHVCLzBlVXR0Vlhja2tBV1hXR3Zx?=
 =?utf-8?B?elZvNFdDdDFoYjBTNXpKc3F6ekI1dk5tVnUvbDhGQzI0WnZTSExMcmd3emlU?=
 =?utf-8?B?MFZEL0FjcTRqUWJEMmQrTStxT2ZsdEE0L2JUdWF4V1VoL3djSlVYVG4xRWlv?=
 =?utf-8?B?eFFYelArQklHT1NxZXBPTXk0ZWxsWUVjUFEyR1JFUkRGSWxnVXFlWHY5RWRP?=
 =?utf-8?B?ZWVCbXF5SURkTWxmZHgzSnB6T1ppWGRubWhic1FLUm5Dd0cybTJGQnVNNWxs?=
 =?utf-8?B?UUx1eXl5TUJPRExOcUk5UEFERVBKVW9RMXRDdnJCQktsSndmN01xYXVBSjVr?=
 =?utf-8?B?K3V0bjBQMmxLblN0dXR4RThhdng4SlU2cmVJdFVOWHJ3RXFUcnlxZlFKSHJx?=
 =?utf-8?B?blJySEdBZVNFZzFFMnRjVlF5aGx6QmltV0hSM0QwZ1dyY3JDb2FCMlVLZzhK?=
 =?utf-8?B?L1YyMkN5dnVTTVNFT2w4MndRWTlxNW1hV2RUNXRGaDV4UFdhb3JNSjQ5dlJj?=
 =?utf-8?B?T3c1c1drcnkrZ0JvK1dvaWRORDVIYVVlS0l0dTNndWdwcTlPSlppTm54NUtC?=
 =?utf-8?B?TVZHS1BSeEVwUkQ0bTR6MzRyRjlaaCtCeDd2dU5OVWd4YTBKWW9TSWJhdnZG?=
 =?utf-8?B?Q0Y5UGoxQkJNQ3FpUDBramVPcGo5bE9zbGRDMFpVTlF6M3Jzc0lhVTQ0cnB1?=
 =?utf-8?B?QkJQbkJPdlVpNjVpcnFVMHZiQWNhWTNzNG1sbUpYU1FzbHRKTk5kbHdYQlRX?=
 =?utf-8?B?M3VWVHVZaUFDRXRvaU9wZ0U5cnRCY0NhTER0SzRTSVlKMUxYeWlnbDBvZURv?=
 =?utf-8?B?eElBZDZyMjA1MXh6bTAyYlM4WHpDUkhpRnZ4dzdPSHRYVVRXclQxWUJENjRt?=
 =?utf-8?B?elcwaThoTlF1QldKbW8wWlVLM1pyb1hrb0s1V053dHBHQnAzUXFLU0l6MlI5?=
 =?utf-8?B?Zk81NGxvOE8rSkZ4cHFNY2ZwMG5IODMreDAxZ1hMcTJtZkxwSnc5bnJNdVdJ?=
 =?utf-8?B?Si96WVJvSzN1dTNGQVRrYmVBb2VMRXN1MXY0a1ZJY1pYZDJFeWNhc0NZSWZR?=
 =?utf-8?B?d2piWFhkMzQ0L2M0VkRwVk9PeW1pVGJDT0hkMHNPdTB4T2E1MDJpVUt4dGVy?=
 =?utf-8?B?WDZXemlzUnpVRjFaZTRyamFDSXFiNDdNL2lJS0J1d3hYQTh0SWxTbHlJSGVn?=
 =?utf-8?B?ZWVyYTE3eE5pUlEwR25LSHFKb0FtQndEZTFtcG9ua0txbXI4YzJwV2tidU5J?=
 =?utf-8?B?T3BIcUJCcnVOK1JMNUhWZGdIOVFDOEVJMzltcFh3VmJzZmxWTkpVRDlWV1VO?=
 =?utf-8?B?ZEdaZGZDOGF5amhBL0VLZ0FrZzhuc2ZsS1d1RDdwRDNIaHc1N1lkQytUekxu?=
 =?utf-8?Q?Qr3nXGPdORnqk9K63K62Zx7Z3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34201bfc-6831-4f6b-3c9f-08db83a25222
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 13:08:58.9900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SOsjkaxaVvYI8IHE8nX3IbRL7b2miv7UdYRKOmgGueX8MaFeK91EFFAmzP/tUOsVoDyzVfOk0k2yQLK3/DtEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6933

On 17.03.2023 20:45, Elliott Mitchell wrote:
> Rather than adding ", " with each printf(), simply include them in the
> string initially.  This allows converting to strlcat() or other methods
> which strictly concatenate, rather than formatting.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Nevertheless I wonder ...

> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -1401,14 +1401,14 @@ static void cf_check spurious_interrupt(struct cpu_user_regs *regs)
>  static void cf_check error_interrupt(struct cpu_user_regs *regs)
>  {
>      static const char *const esr_fields[] = {
> -        "Send CS error",
> -        "Receive CS error",
> -        "Send accept error",
> -        "Receive accept error",
> -        "Redirectable IPI",
> -        "Send illegal vector",
> -        "Received illegal vector",
> -        "Illegal register address",
> +        ", Send CS error",
> +        ", Receive CS error",
> +        ", Send accept error",
> +        ", Receive accept error",
> +        ", Redirectable IPI",
> +        ", Send illegal vector",
> +        ", Received illegal vector",
> +        ", Illegal register address",
>      };
>      unsigned int v, v1;
>      int i;
> @@ -1423,7 +1423,7 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
>              smp_processor_id(), v , v1);
>      for ( i = 7; i >= 0; --i )
>          if ( v1 & (1 << i) )
> -            printk(", %s", esr_fields[i]);
> +            printk("%s", esr_fields[i]);

... whether the extra level of indirection (by using %s) is then still
necessary: There are no % characters in any of the individual strings.
Then again iirc this goes away anyway in the next patch ...

Jan

