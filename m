Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E274C873D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 09:58:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281008.479143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOyL7-0001iu-BA; Tue, 01 Mar 2022 08:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281008.479143; Tue, 01 Mar 2022 08:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOyL7-0001h4-7t; Tue, 01 Mar 2022 08:58:37 +0000
Received: by outflank-mailman (input) for mailman id 281008;
 Tue, 01 Mar 2022 08:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOyL5-0001gu-IZ
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 08:58:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6340794-993d-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 09:58:34 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-ZA2Rdo9OP5qZtTan0tyZCA-1; Tue, 01 Mar 2022 09:58:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3232.eurprd04.prod.outlook.com (2603:10a6:802:8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 08:58:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 08:58:30 +0000
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
X-Inumbo-ID: c6340794-993d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646125113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ft3AVtcvWbuURUPNZKVThsgE7AXGBdHKxZGrm8f1zgk=;
	b=K2MQrowGe6Z1fr+txVI7g32Ex2VdiXSIGB6grnYnzNjYo47DqzcjhhT/S1/4/nV4iWSC3I
	WUtfP6MTfoHQxgh14baNNq6nM+QtQfN3IpscvtLOv3QxkOe6gMejhocByylFPOG+BN/YFm
	QzUYMewW0Bpj05a/y3CSuNoSeeBtGv4=
X-MC-Unique: ZA2Rdo9OP5qZtTan0tyZCA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlffrs5h6ZqgxVPq4NFD14z2h+xH8A0bJpz2H3wbi7lwPuP5yeoGYUJ4GUVDoaRmm4i1R+BPodBrWrDTwTon6efrwBHbvsw8bFiyiBVfQg4L6uH3yC/m1Xg6qaLOY0USkugAfr/OaFXFji/lrxTEKHIQSpoJAwguf4QhWuuEl4QTzwqLm0qDr81ARGmqnHJYsB7ZRMEN8LSiWcHbiqh7Eg3JW5dtlJvHZJyWPdyFhvpzO+UbJhUk+TZ47z0Q2B37OeztJsLoNN6/NDv78XeJs/GdYmIZsH/oXdUS2DxLHAru5kYy/OWA3i1dT+q+1nhE8uoxrrTQz02/2wNHKbIOng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ft3AVtcvWbuURUPNZKVThsgE7AXGBdHKxZGrm8f1zgk=;
 b=CLPJBMJuGGteCMX4SAQQPFL0GLZ02zgrFWBLf0lGViGOR+6jU9Dyo7zgDans8fs1ALLFkcrWfe66D373FH561FnIwO0W5wyaoFX8SiOMPX0VYbpzTqQW+kZVBqAUMPcU5z49LyjimVO4I1na/pitVQZhMp6ZEPQfG8WZFAihVPeiBNsWPs4x4yrJybGp6j6b7GouD9mI1s3/2Np4f+KU53ONqna34nwz68cYxHS3ZX08IZpZg7wcXGeUS74uZEpnb8ed13n8ZFWVAg8gCfGXxHrqRlbpo9RHvXrwuaWjxCcga5FiVYft1NuZqIDAntyFyvyLUOTqHN1JyYhIFyW6jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1a4bef81-d29e-97ae-098b-d1e582e5af28@suse.com>
Date: Tue, 1 Mar 2022 09:58:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86: fold sections in final binaries
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
In-Reply-To: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0011.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ff4e34c-82d1-41a5-1301-08d9fb61a884
X-MS-TrafficTypeDiagnostic: VI1PR04MB3232:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3232D5A8609D459FDB879D65B3029@VI1PR04MB3232.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g/cZ0HNSHXdyf/ip8OIHLeiyzZ1wuRowM6ZZAHFABlRlZu7RVxvT5KjEbOGwiVaOBTh6g7+7VtqgXhiilS0oAJogCNLtY9ZCSuJq9Htbx+syeh5f2FBdfgmAV7pqHMt1ahmbWUCiJ2xvTXJZHEOvdETb1U4gb9GwScXTl34ZN3ceDVYUFbcwtPyLeg7X5hKkBFDvDDdyDjqhtE3OkuYY1eUQY9UYUqDjmwyq8GHnGwo/1/bbxP/4YSC+fpyiyJzjU+Uz/wPGmb5NIPwkTRVfZBrz2LwoxMvhgIFJZS5LRCYtzyGRtEgOpL8ZoKn53U/fIAruYeauiVtiIGw5WMfKE7upPZO7ZbKwVmwThGXWV+okyseG7vHWbVMMO+bzqeQpj4CannH/g9oGCvzF/shAxQxEDMiDme3DbOXpQJ2f+7bP3n8gyKfoosjvi3lz/jQceELCn/h1y/58DBjBW3GUhSKZhWjmahp67whPVMu58afKyfJ1nh61n0NYSLYH2wUMfh2HavIJYIeEYajs3MO1sIufLiA1DNbmXpNFBsho5j6TC3iWJT56jSlAARzf1fzdCWBvC271dqAqU9IdFPcGk/f7S3NrXktBnKvbP4mMC5ZgHIwOEgNAVfGnqc1AFYW1HxawwLoc5E2D789Kj1oX+Skhsi7X8lTbc2IgquHzryjS42Q99vfqeAVQOK+ng8veOcmQ1xTf1UwRmWXlNsUeQ+2+xGSkm+y2AdoDOzZBxN2LqG+s5pUvvZquUSHweWb3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(66476007)(66556008)(8676002)(38100700002)(2616005)(66946007)(186003)(26005)(6506007)(6512007)(53546011)(31696002)(83380400001)(508600001)(54906003)(6486002)(316002)(110136005)(86362001)(36756003)(5660300002)(2906002)(31686004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXJWMTZIMDE1SndlUUdvTXdWUDdNb0hrajdKT3BlM2VvYkxhUXpTQ1hIazJC?=
 =?utf-8?B?U0Z3L2t1elZZZDcySENrRENaZmZURFdzbGR2cGY5NGdFcEREdWo3dFJyQVFa?=
 =?utf-8?B?WUo2V0pzdUc5dnpaNUYzcU5Nd0Q4UW1iRWluNnZNWUJOdHVlMW1UVlZVK2lp?=
 =?utf-8?B?ZVNHRHVRSWVwU1M1eko0czFBV2xDN1Z2MytVUUxOL24zMno4Sk5KWjZIUHd0?=
 =?utf-8?B?d004aTU1M3g0RkI0aTVkT0Iwa25wOUZHeFdzaXFVekhtQmNTNERkNlYwZ2ti?=
 =?utf-8?B?Yk41RExnVERSd1pTak9uU2M5V1BHUk92MHpNV1oxaVJWc05IYjFJQWN0Tk1I?=
 =?utf-8?B?U2tmRmdtdmhpeElVUUlCcUJJVE9XaHJpYi9LS1hOekxkeXVka2xPYjFOcUkx?=
 =?utf-8?B?NGZBa1MySTdYVFE2bVEwUEtuVXZZblRRL3BIZmQyVlhmbmUwaUxsbUd2VERU?=
 =?utf-8?B?RWtYYWZtcm5LOHI4VmU2WU1MTFdnbThmcEdNSWdLakZqWThBUkNzZkFER2hX?=
 =?utf-8?B?OFhieE85azRIblhWMlJSWVIrZi9tTFkyUHZCUUZsU3JYaVQrWTI3VW5Gay9E?=
 =?utf-8?B?MHJvdFFjc3Mxc253Y3V1TVpnR0J3MCtIdWE2R2hGMElCRWFkVXBSbVkyNlF4?=
 =?utf-8?B?Mlo4N05UcnlKTk5wSnluUUNJSnlycVdGZ2tTeVYxMU9Ha2NGNFFyZHhJY0tQ?=
 =?utf-8?B?bzg0cnpFUnhxTE85bGZRb2VMQnhvdjhKbXdpck9VQTczcnM3UmxmTFcyOWF3?=
 =?utf-8?B?ZGJTTXlKWWNoYlFpVUYvUFdleW1RbGM3aHRUbWluMHJ3M21VRDFxWjhWZWxa?=
 =?utf-8?B?N0M3cXAwUjE3YjlJQ1ordDRnR05CT0VDZkdneWovakx0UnZDUHMwRS9Ydnlp?=
 =?utf-8?B?aUs1RStFYmg5UnV0ZmIrb0FxS2ZTVk03N24rNXY4RlQyK2ZCU0ZkRlJXMGxU?=
 =?utf-8?B?WUNvRHVyTW9QaDdjVFh4TE5oMUo5VHNiSzcrbko1Q0VMV0xMb2hGa0VvTmpM?=
 =?utf-8?B?U1NzcVVmRW85enRqQW11b3dmSzVRSzBuL3FWV0U3bE94b3JWWk1Pd21vTEJJ?=
 =?utf-8?B?Vmx6TVg3Ulh6V3NtemQ1TktaMDFvQzY2a3RMbWhCNE9WVmxyMWVLSTFQcUFi?=
 =?utf-8?B?SityNGpnNzkxUHlBeERFcGloZThRbHlHSVE3TWhJTlVvcE5kVTRRbzNKczBn?=
 =?utf-8?B?b2FoMGpUYlI3L3JmSVpCajdSbW80NEVoaUlwaUR4UGx3ei9PeExBcENDTFlZ?=
 =?utf-8?B?UVExZ1NjQ3J3b2xHTzljNFVUZThjM0FaR1JYOXRrUHVQdWlnNFhuaFdOUExn?=
 =?utf-8?B?U0dCWEJhMUZnOUkwaEJQaFY5bWFILzBBTEJuWHdsTk0wT21FckpwYzhsdGtr?=
 =?utf-8?B?VDJZVTZ2ZFJUdWlmdnFqcmtQVVExdkdXZHBST0s0QVBZcjZvd0dmWWU3YWlV?=
 =?utf-8?B?VHlLOWY2VlpCbDd5TjhLL2c3M0FKTWVJSlh2eWE0TnNwbjVtNHYveEp0Yzdi?=
 =?utf-8?B?U0lJKzg4czQ0MUN0a05jVjlseG92VUxnQkdnVlJRbmk4T3dBSzVYVkpadWhu?=
 =?utf-8?B?QkhBeVlkQU94UHBVNi9ZZzdZOEtiTndFOGpOV2VWNlJtMVJqZHV4Z2VLZ01z?=
 =?utf-8?B?VE1vTFdKUmNVMk5wamYrdVVGUVI4ZDFzTmpteFBzYzFUNlBOamJTVkludmdF?=
 =?utf-8?B?Nm82ZS9uRXNvWGpXWWhYbW9mSVFrazJPQUVabkNFUW1kam9qYTR6b0RBdEZD?=
 =?utf-8?B?c05jWnFZL09kOFczbFdnT25MOWxiQ0VBcmJDWUh2T2VvQ0czalNEejZEaW1V?=
 =?utf-8?B?cnpjelFXeStMN3hRZGltMEN3RmJlQkJUNmIrVmJ0eXFuZzRjclRzSFZtYmVp?=
 =?utf-8?B?R1BQUGlVS2pvNDRucDhBZy9RcVZaUU00SGh0MHREbTZmd1NnQStPbDlEdjdm?=
 =?utf-8?B?ZWJiZ25KODc4OUlNNFd1aWNORENUMGJPR0RoSzFsdHRLYXVTMGxhWUthbXY4?=
 =?utf-8?B?UTdiTjluY2pXQkpad1BDTlNWRGpyaitUZFpJK1k0ZVdKYVRYcHd6dHQxNk1a?=
 =?utf-8?B?R2tNUldhcGNIdnA2cEpRdkxXMVBMaWJYM2tIbXpuSUdPNUovb2F1WDN4THNG?=
 =?utf-8?B?Y3R2clVBVU1hYXVYbWU4NnM4QUxjY2dxakxBZHVVT3JiVzJNZXRndDRTazVX?=
 =?utf-8?Q?mAbh7knCSvXZr4o9/t/yQMo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff4e34c-82d1-41a5-1301-08d9fb61a884
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 08:58:30.8200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skxtxGh7Vnb8vXk+hn6Bv6T8Tw9y4A/HG04B+DRJKvXmsz/xHw5G2W+HHpp/BI3GKocvtfj5ls6l3NHBIlTQ2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3232

On 01.03.2022 09:55, Jan Beulich wrote:
> Especially when linking a PE binary (xen.efi), standalone output
> sections are expensive: Often the linker will align the subsequent one
> on the section alignment boundary (2Mb) when the linker script doesn't
> otherwise place it. (I haven't been able to derive from observed
> behavior under what conditions it would not do so.)
> 
> With gcov enabled (and with gcc11) I'm observing enough sections that,
> as of quite recently, the resulting image doesn't fit in 16Mb anymore,
> failing the final ASSERT() in the linker script. (That assertion is
> slated to go away, but that's a separate change.)
> 
> Any destructor related sections can be discarded, as we never "exit"
> the hypervisor. This includes .text.exit, which is referenced from
> .dtors.*. Constructor related sections need to all be taken care of, not
> just those with historically used names: .ctors.* and .text.startup is
> what gcc11 populates. While there re-arrange ordering / sorting to match
> that used by the linker provided scripts.
> 
> Finally, for xen.efi only, also discard .note.gnu.*. These are
> meaningless in a PE binary. Quite likely, while not meaningless there,
> the section is also of no use in ELF, but keep it there for now.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Some of this will likely want mirroring to Arm as well, even if xen.efi
there isn't produced by the linker. Sections are better properly folded
even for ELF, and constructors not ending up in [__ctors_start,__ctors_end)
can surely not do any good.

Jan

> ---
> TBD: We also use CONSTRUCTORS for an unknown reason. Documentation for
>      ld is quite clear that this is an a.out-only construct.
>      Implementation doesn't look to fully match this for ELF, but I'd
>      nevertheless be inclined to remove its use.
> 
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -194,6 +194,7 @@ SECTIONS
>  #endif
>         _sinittext = .;
>         *(.init.text)
> +       *(.text.startup)
>         _einittext = .;
>         /*
>          * Here are the replacement instructions. The linker sticks them
> @@ -258,9 +259,10 @@ SECTIONS
>  
>         . = ALIGN(8);
>         __ctors_start = .;
> -       *(.ctors)
> +       *(SORT_BY_INIT_PRIORITY(.init_array.*))
> +       *(SORT_BY_INIT_PRIORITY(.ctors.*))
>         *(.init_array)
> -       *(SORT(.init_array.*))
> +       *(.ctors)
>         __ctors_end = .;
>    } PHDR(text)
>  
> @@ -404,16 +406,20 @@ SECTIONS
>  
>    /* Sections to be discarded */
>    /DISCARD/ : {
> +       *(.text.exit)
>         *(.exit.text)
>         *(.exit.data)
>         *(.exitcall.exit)
>         *(.discard)
>         *(.discard.*)
>         *(.eh_frame)
> +       *(.dtors)
> +       *(.dtors.*)
>  #ifdef EFI
>         *(.comment)
>         *(.comment.*)
>         *(.note.Xen)
> +       *(.note.gnu.*)
>  #endif
>    }
>  
> 
> 


