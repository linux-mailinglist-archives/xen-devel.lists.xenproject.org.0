Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7583C52A747
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331192.554671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzOh-0004gR-GE; Tue, 17 May 2022 15:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331192.554671; Tue, 17 May 2022 15:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzOh-0004e5-Cs; Tue, 17 May 2022 15:46:07 +0000
Received: by outflank-mailman (input) for mailman id 331192;
 Tue, 17 May 2022 15:46:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqzOf-0004dx-Ou
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:46:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75b167c6-d5f8-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 17:46:04 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-C864V_8sMnGumE97sr-BCA-1; Tue, 17 May 2022 17:46:03 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7036.eurprd04.prod.outlook.com (2603:10a6:10:12f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 15:46:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 15:46:01 +0000
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
X-Inumbo-ID: 75b167c6-d5f8-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652802364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CsmQSkKbLh+KEol/VAm90uxvVIsKuGgi/wDazmntGNw=;
	b=G6ndxgpbNFYtBDA7c1MPT7hCB/iNRCnBoOqmJiLsWjGK56IK26DOkCLphKbxz1miqz6HAp
	8NTFg4KhaZTDnJdQlRXhi6p72oK1EFfdrkaWVuDp/cFSLK/smEU132d9UW4w8XTy0PFGE5
	bN1D/F2ZY2SemufOA5R5qFsVpLzXYdA=
X-MC-Unique: C864V_8sMnGumE97sr-BCA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXsWAgJa0wHI517yM66Yc+GHZ28ooorWpnCsFBqwswqnQcdDTsAkCAMEjA8nbmqgI3phmE5hiV1UBJ27M5RM1TYEUG129Bdxb8sIZOKqBWaDizLfsW67qWNrg9beyahIcgVZ/o+wC32Byl4r/7J8CJThBVKSZJ3ljsBWa3aepBh+w2/yFzOoarHBaLCKlojENZirHp7UaJFPz6t32J9ZQe2mEo8XFYCe6MlZmfqpW+XTdh7cdT7PCs5a6+soIAiOeotKiuA039PEA9NSkpmbjIxZ73axqUCKZPFz+dvuqXpzc4ctdUuYOjLqFAXgQ5L0/id0pE9wt+rl3jFhQsMeSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxU+XQIN+20RPe0OAAG0AXWfFvbd33EKNiuLv7QbyXQ=;
 b=AOBeI2br7DC4+AuuDKbEz5j2fNPELVPEqsLT00MXZ/9CvZR3qvPErZX/gDzGxOTkPGPrNaSHPMhrKQqzJR6TLhQ4sVEGxiiBnh5q/xS6sStMAzBWMjOzh2DbnLCiL7Eu6hAruyhJSgQvWivb+TIeZdC6wiMVjAwkIDLqUtA81NlKbgE3nOGqPTMDUeiOxmFdidhoPxRuH36MKQKWS31M/eOxT8kTp6U+mWFf5Pexin6x2e7qkgfJ8OuBBBPQBQT8go6VJQEiWxRtov9u/FlBsh9dVHKJJVtZo/npzpovOdlih0vOJUvygQd8D6659gKi2wwNYgt2DSTF8EtlLW90Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12c5e743-0d7a-4866-ec92-03081b127619@suse.com>
Date: Tue, 17 May 2022 17:46:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220511143059.1826794-1-marmarek@invisiblethingslab.com>
 <c8f95032-1417-adfe-3170-62b39ec0f6ca@suse.com>
 <YoO1wt6Wq1+XOXsK@Air-de-Roger>
 <9ad924ae-1a40-6ac4-55ec-a468dadf5dcf@suse.com>
 <YoPCkMah/Wv5KBj9@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YoPCkMah/Wv5KBj9@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0750.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc42cc66-6fc4-4a98-c7dd-08da381c57e4
X-MS-TrafficTypeDiagnostic: DB8PR04MB7036:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB70366E6CA86C2497885AA7A6B3CE9@DB8PR04MB7036.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Me0RQ0NODhGXULfQOPMEHy2byrVaVMIGB9kNJxsb/0H0fKiiRoNDFvnZWQM9WfC21gPdArvRjCIVOWfaxf5W+/s/AFN6s7vCNpFSi6x9YOjRDhNoUAQPvub0HzEgZbw6p3G1pR2NDg3pnzIFRSpvWcTguieaGw03CRtuDKMtnQYxHhF9yJBGxVpeYTbmnjrj9QfVHYKzOhHAs+9mua1EifU9N/52exN3Hi7wQ9CX+dhFFxcDwpzudCQ3Ft4YCKBRuVnaQttGOmSpOdzRb5j5jIL2cRVvUfAOHO4hr0+sDnaP1LKgFZouBayBOSlstv5DS4+Q1zxVNDWyNSc8mW3Pamf79UwV76+TRmQcXz6bI2RHsmB9Dv8+6ytr1KIvygjhg7+uZ1Mgk9XOmd1a6+T+NjR9KokYjIBpb8Wo9CkBxVekdvi78kJ4bg6QUdx+LMtFS6gHCm9hct6i3lKw8+Xz/wHLq6FJMBNMnE4Jz0SWnaFmFPktNzq5M8smFpOC9/1oZqWtNJzqb9FtzS4UebB3RlMUMHuQyRYV4Z52yL3u5ax6odN2muQDZC8cZ8rQXzP6ic+D8VWqPjuxKYFkwnQJ5EP6cE3D1p2fmOavRSiRKmRzIxcRhR5mi9XQ+jYcvYDFQ/N2obVRjv6klCETy/lAOEP3kuZzqOc181F/HSIQP6meAyudHtyloISNUibgrD+U7nwmR77KVSXEj+Y0V6FoHIGyALhf1bHVvPJIG8dqw30bJSK6il1pPzEnMUvXPTZZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66476007)(8676002)(4326008)(66556008)(2616005)(31696002)(316002)(86362001)(38100700002)(83380400001)(8936002)(5660300002)(53546011)(186003)(36756003)(31686004)(6506007)(6486002)(26005)(6512007)(2906002)(508600001)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u9DtHFl+nmtLNncjKQzyulMyWTpLDQSHekiQCPzNgDffnOY21PTVqkh3png6?=
 =?us-ascii?Q?EoAkwD3uqZFOpJOuJs5UZrZz6WY7pvKVAJxeNrqXgaVOES3DnqmDH2rnxMis?=
 =?us-ascii?Q?lmCqHpkjcvWQ4UNWNZ6SMs3KclpzpoDz+RVjkVlSzDCmzRKh6ldjipWHqUgL?=
 =?us-ascii?Q?/QTioXLMoe1AU7grNyfARIYpEYKvenP8KotbdsJB7tz2FEw4vjPLLkwfJzk4?=
 =?us-ascii?Q?5GtQQi3U/fBo1Vt5RRsK8zT8goyb4L5/B4cLoyxW02jF4GaldrFyliuSqjcL?=
 =?us-ascii?Q?aL5avZjglKGayGSNaxxIYSepuCB0s3S1XoeREffe6lbq1ZYgkD47UAeVydTK?=
 =?us-ascii?Q?Ot7zPacVb+o+WVQ1tbbupQxTMjs9t2gmwT4VstTJDRUcoNit2xvSWomRbZjh?=
 =?us-ascii?Q?ResMdQ3Gr96MD5k6/cR4FmiDSgcmGmlis1Jj431SUJ9ziof5PLEb4m21RxO4?=
 =?us-ascii?Q?BpDs2i3fNjU5jbvKeR6bJVZGGW2YRENd8lNK4qC35BEV7tf+0YQYLBYGo+jv?=
 =?us-ascii?Q?ePkcbjyoOR9pKXabM8WTh1ptlr2MA+C+nwzl3zL2uyaJbq4eBr0pEJxh+w2+?=
 =?us-ascii?Q?gQrrqka0Qub5co7aLPSW1MSSC+h+cr8TJ3sftcFR4PTaiGlwrVQcB4OcApow?=
 =?us-ascii?Q?HlqL47tEXH1vwyIaCsrkjeI8j7AtCNGGAJGqVubq7Xb56YbP/f4MakEZy6Du?=
 =?us-ascii?Q?i6nckvDRlSLp+8SHBUwdky/j2P8Zlphrw6V8Rsmgqeldn+Dyo6/PQ7+bopQ6?=
 =?us-ascii?Q?GUvjSf4Mv/aFSpFklysyzo1CK1g4pvkwlo6II2c7LjXyodaj0HPjNDL89W+W?=
 =?us-ascii?Q?7sCoZA4Kz2dgfTARiRlNuQJXMtfXPbA0AfDHAyADtzGJRYbJZIsASEuPUOuM?=
 =?us-ascii?Q?aR5RAhgLK4LuJThZIndWsQK8I70VjIy69CuGDh3X5EHg4+tdg/zNdRGmUKgm?=
 =?us-ascii?Q?OtRtNtvbE5MwzS5K2DmVwMN9FmQVWA99nFw6p7NqFswnt48lR1WtWxmKxEbN?=
 =?us-ascii?Q?fC6mEb+XkFDwG1a+lG5GnhifoMVJvA/11s523i1UYrQN2wXjvNkB8fBFl/am?=
 =?us-ascii?Q?Pxw0xHL6cwzxebPihAXLcdJTzPloWNb716Drz1QStfHMr6+/nMeRcHXy3q+p?=
 =?us-ascii?Q?L4mFjb711vV6/7C7uMuWwMqGw0o7uInqcyfgl7n0gx4Xkj8QdC5RxOsngfnu?=
 =?us-ascii?Q?Pji+WWBCWb9nCOBy6z/o0ognhQIg7/8WxtN5zmMZeVzSIzvnUFVpzyY3gkm7?=
 =?us-ascii?Q?6RSKlhEHmbw7Q3neVZvyuTl1RwhRQ3Hb4Q/WkV2ZcE7b0kuzwyxuj4BeoRZ0?=
 =?us-ascii?Q?Skm1enV/tERxOXMI7/aaBJJcouAq2u8vClKV8slaL7PQC4V7uVbOH3m7/Maz?=
 =?us-ascii?Q?sOa/WiZZk+wSoUW9/CU98tmk+Mxr1WSOdMPxWfVWIATU9zFVv2wumFuEmClM?=
 =?us-ascii?Q?geA4wji5rj9SmxcCep3rt/ABCeXdS5P0D1sPab8mB5xVPYB1iVBM9KicDLOx?=
 =?us-ascii?Q?QJ1++0xECHZsVb9HVomCw2KfZ+M8KMu36Qbq4LcipFxJmQCdfvRMuaOYs74g?=
 =?us-ascii?Q?F4B0JaNFsgVWwwcwbswEvlCnHZJVqVAUaKiW0r9d4xVnGtp+GSHRJLtS7e0O?=
 =?us-ascii?Q?BSxluBYSHBTBdhmuEDe6Ruwls66jc6mq5wo+Tu9wT1Pn62ta7PM4yr3KlNos?=
 =?us-ascii?Q?GC18/hFqmFjAy73mr3a9uTTElyYN4/CEMvH47GljMeecLc1uL3DPyG3562WO?=
 =?us-ascii?Q?xGuYmCrLLQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc42cc66-6fc4-4a98-c7dd-08da381c57e4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 15:46:01.8071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TyV81MfUqRnUOl5LOrsWldq7+n5XwPqacx6vW5xWiXxNH5CX39nvsQk9BkFgm7WgiWiIqAI9nK4yPN3uKlWPlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7036

On 17.05.2022 17:43, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 17, 2022 at 05:13:46PM +0200, Jan Beulich wrote:
>> On 17.05.2022 16:48, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, May 17, 2022 at 04:41:31PM +0200, Jan Beulich wrote:
>>>> On 11.05.2022 16:30, Marek Marczykowski-G=C3=B3recki wrote:
>>>>> --- a/xen/drivers/char/ns16550.c
>>>>> +++ b/xen/drivers/char/ns16550.c
>>>>> @@ -1238,6 +1238,13 @@ pci_uart_config(struct ns16550 *uart, bool_t s=
kip_amt, unsigned int idx)
>>>>>                              pci_conf_read8(PCI_SBDF(0, b, d, f),
>>>>>                                             PCI_INTERRUPT_LINE) : 0;
>>>>> =20
>>>>> +                if ( uart->irq =3D=3D 0xff )
>>>>> +                    uart->irq =3D 0;
>>>>> +                if ( !uart->irq )
>>>>> +                    printk(XENLOG_INFO
>>>>> +                           "ns16550: %pp no legacy IRQ, using poll m=
ode\n",
>>>>> +                           &PCI_SBDF(0, b, d, f));
>>>>> +
>>>>>                  return 0;
>>>>>              }
>>>>>          }
>>>>
>>>> While this code is inside a CONFIG_HAS_PCI conditional, I still
>>>> think - as was previously suggested - that the 1st if() should be
>>>> inside a CONFIG_X86 conditional, to not leave a trap for other
>>>> architectures to fall into.
>>>
>>> The CONFIG_HAS_PCI region is itself inside of a (bigger) CONFIG_X86
>>> region already.
>>
>> But that's likely to change sooner or later, I expect. I'd rather see
>> the surrounding region be shrunk in scope. Already when that
>> CONFIG_X86 was introduced I had reservations, as I don't think all of
>> the enclosed code really is x86-specific.
>=20
> My though was that anyone removing the CONFIG_X86 guard will already
> have to deal with setting ->irq properly, as I expect this will differ
> between arches, at which point the check are likely to diverge anyway.

Hmm, true. What I would really like (and what I should have spelled out)
is that the build would fail if this code was enabled for no-x86, such
that it ends up very obvious that something needs doing there. Hence ...

> In any case, I don't see an issue with adding an extra guard, albeit a
> comment would also be acceptable IMO.

... maybe

#ifdef CONFIG_X86
    ...
#else
# error
#endif

?

Jan


