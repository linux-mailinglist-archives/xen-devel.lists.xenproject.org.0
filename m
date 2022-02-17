Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601EF4BA36D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 15:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274820.470424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKi4t-0004s1-GO; Thu, 17 Feb 2022 14:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274820.470424; Thu, 17 Feb 2022 14:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKi4t-0004ox-DA; Thu, 17 Feb 2022 14:48:15 +0000
Received: by outflank-mailman (input) for mailman id 274820;
 Thu, 17 Feb 2022 14:48:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKi4s-0004nc-0y
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 14:48:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a12f85b0-9000-11ec-8723-dd0c611c5f35;
 Thu, 17 Feb 2022 15:48:12 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-oOHM5BbPMASfYgp9SdqD5g-1; Thu, 17 Feb 2022 15:48:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8864.eurprd04.prod.outlook.com (2603:10a6:102:20f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Thu, 17 Feb
 2022 14:48:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 14:48:09 +0000
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
X-Inumbo-ID: a12f85b0-9000-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645109291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yLRlS1TQ/0HLnf7Aekd8PRj8perQ1WT6n8g4YRBzASA=;
	b=lEU04fmds/8+lOhbYOWKtnk99kZCFphT8JCEYFh5BJMTvBaMywSzmRAl3/lGF86CFC6czH
	ll++uWgp/LdPVFk64vQRjLT6HVOQIv70To5eUTQ+jpl+M+Gjjy+NlIL0lNXHcbx/VvwQg9
	U+99VmfgH6ZeAoXQF/slZ8vXQ3RjyRc=
X-MC-Unique: oOHM5BbPMASfYgp9SdqD5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bjw/wy57SjEIbTvYppBghIGPETI4q14qMZu/zigGF/per/AsPHBTky8eqnXvJBU4Vtj4tMcrESVP64XlTrL3jL5BF738kjy3PbENkwqhkL/fdllm6LIDQnceJL8NpX78qb1I5GFcjQa+dOhJhTc5UI/y6XDcQSpA20lZguSS1V85fWHuHZNR7EvZRjZWDW2vQZ258csMLuCH5kcV63BclbN43gM12QNOynRSXhzUO8cUFkB8HQZ+uXHia26kxunEiNRJKp/S7doa56Bjo8WMZTrber1FXh9RBV7LVeLK6XMtpce2rUtPiaqj2DhvixuN45NXyfu01Vu+6CzH9ifA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxmVAe6CICoHSnm34+hYUvosoelqWzQoX4FB/ctSxTY=;
 b=Ci6sqnX4w78JKnCi+Nv2plAyQQqUtXbKSKclyA+OZua8n280AlGlDIix/S6AJafDxa83R3ZuiEQw/pxInxIQpUU+NQ9LCQHaegY4BImW/PArpoZLlwWct9VkWN+zp6HeIl+agGGV6q7XZhRX3//9W3+JxFrTsnfWoWBWeCoN4NDfa374We6tLDNssWcHQNS+JiuzWtYBGJbApWfU2YZOmffJqgnbgbDdnyr+BpGd0tVfPVg2qjPclCT8tKjJdHqCTYDFhHgNvrGeGMMVvazX+rikZY3Rj6sHtiriFtMcy0ZF/Nk/ET8yDVil3HgGnRKMU2jcMqY6jcF7tRjALQJUkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e35ca83f-12ad-0c28-075b-82ff08b2bf1d@suse.com>
Date: Thu, 17 Feb 2022 15:48:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2.1 6.5/70] x86/kexec: Annotate embedded data with ELF
 metadata
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220217100158.22402-1-andrew.cooper3@citrix.com>
 <4e9924f7-fdfa-c3c3-7b6c-e5cbe77ff9ac@suse.com>
 <826c97dd-dda9-b6c2-37bf-451354fcfde2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <826c97dd-dda9-b6c2-37bf-451354fcfde2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0117.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbf6056b-db0c-4b88-16cc-08d9f2248386
X-MS-TrafficTypeDiagnostic: PAXPR04MB8864:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8864A8D244A916A799D2C890B3369@PAXPR04MB8864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QFiMW8CncciIJzKdZ7WcQAcCBVYG5nnm+dVggR5dn8bz7jdS+7XndFAhFrDoYU758nZDRz7uhdFyqPB6BlM2xrUvdli2rdEvCdb72ntqNzPaiQM1lMxRFaUQdzr1330D5+8BgPnLuhW3tP4CYgoIU8jCtn46mPopoJCqQmf9aUSw7TKynE1hL40VqeRFIGylimURg6oxJwQ4Sq6ak01cq9zfD/IihmKFkmxhTDomKEnF0pLci1oS3PpVtulpnxQT2lCIp4SfONsvjASilxwsWAoKFDFrms6qdL9t49MGDEiq1AArpJP00F7XlfZ7ObtJEzroH+2QExMPGSCDFzc3Nq8CB769TVXYgOaD79OednKhu4WZqLF6sLGKh5eZOd4FBZ1mG96Fi2wH49LeMOMT6x7D6nBllfLC/uNDHVjHGhPRaYlF4vgTkHTFdHHawKGkeVnVaJzPFze+RqMZK2ft2Solrmv+XuicpKKQI2Qu2bjKnz94siYyqpS2j9EhFHLVVVqpBWZ60GfVd51eeNsX8EGbjCAK68grUVvpB2pYL4zlBNp9MHEaJyERSLdTDk5iin5nXzs/mE9IoaqhandOz3MIV4ENAkiB0AsWeOas7BLoGALXyOJEu2szw//lYhPg04qSevIhTCFy+mj8nbR1i4KHqSasx4IBAQjp7kfQu4LlyJkLj3P8T5zE1HnLQAdRCueze3ARA79epZYbYfPF+OvVITOo6TGZYGzq4MaaglLBwz9I+23quuSGzkqiUavS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(36756003)(2906002)(54906003)(6916009)(5660300002)(8936002)(86362001)(66476007)(31696002)(66556008)(4326008)(83380400001)(8676002)(31686004)(66946007)(186003)(53546011)(6506007)(2616005)(26005)(38100700002)(6512007)(508600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6IoAarlnzAolgv+Mddguy5sWhIEYIL10Lg2SJmIUjdaQk8IniwfzWQOiK24l?=
 =?us-ascii?Q?jaGv5HaCNLLxT8rRqRh6uN4E9zqa2NHEivYS+4WgoeiMLG/JauheTiatoiL9?=
 =?us-ascii?Q?iguxhuntX499OswBZM6wsHfQi86cVjMv0taK57xAwIKgrJFGDebyVgYC+Ajx?=
 =?us-ascii?Q?9LhEBN7RzExMDyg1ja0awNO4dBDRgnZbCGvXD93GqOlFvFvFcY+6uGUMhULA?=
 =?us-ascii?Q?Mc7KHP6dIw0PIYxAklqFPyI2kmgdUjl32RYA23yz3NhJGja3U+1sn1RkkgJE?=
 =?us-ascii?Q?x6qGtS1L+p5qZoMSAXM9ARqSm5PWV0ykbR0NwXm6gX+5deaexg3tfaKJ0wrX?=
 =?us-ascii?Q?XsdAPDvmIY+WhflkOPYYHp5Yyn/4blRGBBYNfLJVaJyNWwxXeJShnOlx1BYT?=
 =?us-ascii?Q?ApB5Z3vEJlfrxDKcYe37ey1ODICVBkhwDaclJvVI9XE9cqrDT1CixNw/dQEc?=
 =?us-ascii?Q?7eGDZDjEaYj836rlEfOmNmfA/5FTT+x5PmQ2gXct84rm0SjUrA0VLPDdFF8m?=
 =?us-ascii?Q?daHAkANIEnlB+5Tc3ykaIe0ngyjYx1TF6x7J1sUeI1wsK7GgxAEoqdqW4Us6?=
 =?us-ascii?Q?8+QnyIhmeZpgaVxfKK63Ip/R3ZqCZghFxpjgCxdt7csunxivgHvQ6iNPeawN?=
 =?us-ascii?Q?280H30eXlHowzF2Q/IKRsexUmGOpkF6bbhsZGiTGfJsKKmPR8apT0Ela93Yg?=
 =?us-ascii?Q?FJKS+j5o0iWgC/eWLFUKEkEvJ9Dn7GqiP/LejMYjZ3yH0T8m2gU9pk5SY1+C?=
 =?us-ascii?Q?CISTMsP/Zrpf8Zp7XQU2W60/i3yN7TnoRmRFfMVp0Xk26Q6CW98u5BIPuwtS?=
 =?us-ascii?Q?7jBIvvUsX4oYUQKORzuPBKiEtL8fKh5C0sUvAifn+trdfUQduFH7jH5wzEiA?=
 =?us-ascii?Q?T7AEJGnimYSRQUUvOZIRj0UQsVDmh6jFz+POr70xMUbBIa1cKHo2Fo0egNy+?=
 =?us-ascii?Q?lZQipWqWUt/mSfWKcNlhF+gXP/cLKB86qiCn8UgOHzNLK1oe8kqVlBgHFDIm?=
 =?us-ascii?Q?NHJwKomiMK6MeSwbzno/4FxwLaLJkdec3+zEuYt1PAz1K7tcVRnxvgbHB6Zq?=
 =?us-ascii?Q?WO/yG27zJsxzlztB/IuCI+zO5ebhPFcXT8etDfdt+miQX3bMSBMnxxsRTAHC?=
 =?us-ascii?Q?PEN5UDlY2yDK7uLdlB/kKWSxezGYPmPDoUk+jH9k9+cR+7r65qWpTJYVJglQ?=
 =?us-ascii?Q?kIH+FeT0tJih4RCSrvDncjKlntNJCoyi+RA792Hc8yAvhkZhkicGQ6+/Q746?=
 =?us-ascii?Q?07/0EnOaCghb/TuRJfxj4canTsA6COpiulaWAi84xmyAGyxT3u+yGanJyl2Q?=
 =?us-ascii?Q?4fFr5wGo1Kbm5o4HUohh3tnrMMTlZ5RWouyOJLkSoMdzJRDbeiYxvWrikbtG?=
 =?us-ascii?Q?9szfK2WLH0El9t0oKmzPVlWSbw+wip8XxhQyIeevdrx6KLQ0Q0z6CdfGPRYF?=
 =?us-ascii?Q?h6RSdBD4wtNVWThEibglVah1iCurPPuEMHtOJ1SJoyS+G0IKhJGyVr74NwSI?=
 =?us-ascii?Q?vpJj3bDNTF8/JO95/IrvDWKgip9UJfF4+hGVj3PPFcmCtXwMbmwKC/2DdOLU?=
 =?us-ascii?Q?Cgt910dZmyC0yhnnyCeOMSi3+y0kTOw6xZGhD64mYNMVFuUmgkSBdNZkub5d?=
 =?us-ascii?Q?VHtGTfJovyE6PilOZQq09W8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf6056b-db0c-4b88-16cc-08d9f2248386
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 14:48:09.0389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYxaMOXNCQOZrXYofmZOPBGAJAbRhMuMMM7pMRiRk2vPmNKcGepodGNB68CF/UtgUPxEHSrOw1FcVEEpkNa5qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8864

On 17.02.2022 13:06, Andrew Cooper wrote:
> On 17/02/2022 10:42, Jan Beulich wrote:
>> On 17.02.2022 11:01, Andrew Cooper wrote:
>>> Scanning for embedded endbranch instructions involves parsing the .text
>>> disassembly.  Data in the kexec trampoline has no ELF metadata, so objd=
ump
>>> treats it as instructions and tries to disassemble.  Convert:
>>>
>>>   ffff82d040396108 <compatibility_mode_far>:
>> What about the (possible) padding ahead of this? Should the .align
>> there perhaps specify a filler character?
>=20
> What about it?=C2=A0 It's just long nops like all other padding in .text
>=20
> ffff82d040396101:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff d5=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 call=C2=A0=C2=A0 *%ebp
> ffff82d040396103:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0f 0b=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ud2=C2=A0=C2=A0 =C2=A0
> ffff82d040396105:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0f 1f 00=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 nopl=C2=A0=C2=A0 (%eax)
>=20
> ffff82d040396108 <compatibility_mode_far>:
> ffff82d040396108:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00 00 00 00 10
> 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ......
>=20
> And for this problem, we don't need to care about the behaviour of any
> pre-CET version of binutils.

I was about to ask, but yes - this is a good point.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

>>>   ffff82d040396108:       00 00                   add    %al,(%rax)
>>>   ffff82d04039610a:       00 00                   add    %al,(%rax)
>>>   ffff82d04039610c:       10 00                   adc    %al,(%rax)
>>>
>>>   ffff82d04039610e <compat_mode_gdt_desc>:
>>>   ffff82d04039610e:       17                      (bad)
>>>           ...
>>>
>>>   ffff82d040396118 <compat_mode_gdt>:
>>>           ...
>>>   ffff82d040396120:       ff                      (bad)
>>>   ffff82d040396121:       ff 00                   incl   (%rax)
>>>   ffff82d040396123:       00 00                   add    %al,(%rax)
>>>   ffff82d040396125:       93                      xchg   %eax,%ebx
>>>   ffff82d040396126:       cf                      iret
>>>   ffff82d040396127:       00 ff                   add    %bh,%bh
>>>   ffff82d040396129:       ff 00                   incl   (%rax)
>>>   ffff82d04039612b:       00 00                   add    %al,(%rax)
>>>   ffff82d04039612d:       9b                      fwait
>>>   ffff82d04039612e:       cf                      iret
>>>           ...
>>>
>>>   ffff82d040396130 <compat_mode_idt>:
>>>           ...
>>>
>>>   ffff82d0403961b6 <kexec_reloc_size>:
>>>   ffff82d0403961b6:       b6 01                   mov    $0x1,%dh
>>>           ...
>>>
>>> to:
>>>
>>>   ffff82d040396108 <compatibility_mode_far>:
>>>   ffff82d040396108:       00 00 00 00 10 00                            =
   ......
>>>
>>>   ffff82d04039610e <compat_mode_gdt_desc>:
>>>   ffff82d04039610e:       17 00 00 00 00 00 00 00 00 00                =
   ..........
>>>
>>>   ffff82d040396118 <compat_mode_gdt>:
>>>           ...
>>>   ffff82d040396120:       ff ff 00 00 00 93 cf 00 ff ff 00 00 00 9b cf =
00 ................
>>>
>>>   ffff82d040396130 <compat_mode_idt>:
>>>   ffff82d040396130:       00 00 00 00 00 00                            =
   ......
>> With the .size directives added, can we rely on consistent (past,
>> present, and future) objcopy behavior for padding gaps?
>=20
> Of course not.=C2=A0 We don't know how things will develop in the future.=
=C2=A0
> The best we can do is hope that it doesn't change too much.
>=20
> But on that note, the way this would go wrong is the binary scan finding
> an endbr that wasn't disassembled properly here, for whatever reason.

True; it'll "just" be a false positive build failure.

>>  It just so
>> happens that there's no 4-byte gap between compat_mode_gdt_desc and
>> compat_mode_gdt. Changing the .align ahead of compatibility_mode_far
>> would eliminate the risk of padding appearing if the code further up
>> changed.
>=20
> Gaps will be formed of long nops because we're in .text, and they merge
> with the previous data blob (see below).
>=20
>>
>>>   ffff82d040396136 <reloc_stack>:
>>>           ...
>> Now this is particularly puzzling: Us setting %rsp to an unaligned
>> address is clearly not ABI-conforming. Since you're fiddling with
>> all of this already anyway, how about fixing this at the same time?
>> Of course there would then appear padding ahead of the stack, unless
>> the stack was moved up some.
>=20
> Oh - I'd not even noticed that.=C2=A0 Luckily there is no ABI which matte=
rs,
> because it's the call/push/pop's in this file alone.

And the entity transitioned to is forbidden to make use of our stack?

> With an align 8, we get:
>=20
> ffff82d0403a7138 <compat_mode_idt>:
> ffff82d0403a7138:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00 00 00 00 00 00 6=
6
> 90=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ......f.
>=20
> ffff82d0403a7140 <reloc_stack>:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
>=20
> where the 66 90 in compat_mode_idt is the padding.=C2=A0 Recall c/s 9fd18=
1540c7e6
>=20
>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -87,6 +87,7 @@ SECTIONS
>>>         *(.text.unlikely)
>>>         *(.fixup)
>>>         *(.text.kexec)
>>> +       kexec_reloc_end =3D .;
>> Does this maybe want aligning on a 4- or even 8-byte boundary? If
>> so, imo preferably not here, but by adding a trailing .align in the
>> .S file.
>=20
> There's no special need for it to be aligned, and it is anyway as the
> stack is the last object in it.

You mean it anyway would be, if the stack was aligned? Or am I to imply
that you've amended the patch to add alignment there?

Jan


