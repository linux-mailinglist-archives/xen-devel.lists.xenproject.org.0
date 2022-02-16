Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FE54B8CF0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 16:54:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274266.469681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKMdH-0007rj-0c; Wed, 16 Feb 2022 15:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274266.469681; Wed, 16 Feb 2022 15:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKMdG-0007pn-Ta; Wed, 16 Feb 2022 15:54:18 +0000
Received: by outflank-mailman (input) for mailman id 274266;
 Wed, 16 Feb 2022 15:54:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKMdF-0007ph-8U
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 15:54:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b12a9bdb-8f40-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 16:54:15 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-8ky15_9ZMLq2OK1Sq2CsdQ-1; Wed, 16 Feb 2022 16:54:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB8777.eurprd04.prod.outlook.com (2603:10a6:20b:408::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Wed, 16 Feb
 2022 15:54:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 15:54:12 +0000
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
X-Inumbo-ID: b12a9bdb-8f40-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645026855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9//Ze51g2rWtuH/+mWD56wUakSQCmxjrzIMfoLr+5P4=;
	b=b7JDmns4fZgq4LB+QAw95foSsYyn0mjQZeqIl0lgLYfelkGt7o5UV8pFZ+dXqg3YJbhxm0
	8KQaiLrfVj1gRcAnDaRaFvS1N4Wml+bGXUBwYgfrV0q9LnmkQslGdStjzoPxDXZ4/2bzzu
	c4809YnuJLUmN1Wj63E8Rmssplh50G8=
X-MC-Unique: 8ky15_9ZMLq2OK1Sq2CsdQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVN8kyt2RRsnLRejM8X3wBzqY+XOH181au5PhNARb2KwNLnLhbZ/+cWrQJEjN/WcdiPpAV3o3e1QC3bCir9gi/t3yK8M8DqM1OxPjxR0LMO74UpzrdEUi2btZR0LSjeGKS+QyeydZPhm2FveHyln1CVgxtMhNX1suWL3bZLYz2lrF28G3pFi0ANsYq4NEkWincq+6zJrZI+I8wKFUCKHOjmRKy3QEt7jlJ4VHUZyt+piIsA8Ard615jhYXtMSbrocDj4eqiQaoPpppB+ceDvr/W5qseTvwsW2F0Dpp7w23TKF/gE3LG6dd0IJLJ5wckMuWZJG7Akwh/4vLeG9OoQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9//Ze51g2rWtuH/+mWD56wUakSQCmxjrzIMfoLr+5P4=;
 b=A3C2bp3MWSKRTUSFG61cjhRq+ORt1+02escdLYEDF8CwwGVwAsLndtSYbXWG/sNOUXnabqaTXdkjFRme5hXHEhTK0Mi2bh832SxtJPNNk5Ai602eRqx4HJMOWxfnr3Rb21hOKLqTDimfsqoxhkXfDCgPW4OmQVk2ThoFhXzkl1/0J4KWxdMLaSfWrH64PwU5/tatk6myM8a6teIE0gnuCm0dud0ZyYN0GgfTLS1fRzjcjIOJ69VIg94WEzb0K6XAlK6Xp3Fb81W40C2gtEo3A4G5DVbs0dgijNzCt8uAaPG9fQEfdWXJHnttrIHOPswEw+6K0wl5gbjy67fuXZGZ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <559ec172-c1e3-19ab-c0e4-64c8f0991e9f@suse.com>
Date: Wed, 16 Feb 2022 16:54:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 2/5] xen/vioapic: add support for the extended
 destination ID field
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: dwmw2@infradead.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20220216103026.11533-1-roger.pau@citrix.com>
 <20220216103026.11533-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220216103026.11533-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0021.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bee8727-0000-415c-5ec4-08d9f1649392
X-MS-TrafficTypeDiagnostic: AM9PR04MB8777:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8777C667181A966B86353918B3359@AM9PR04MB8777.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z8SPoCkRurqxFeqh7E2rze5BhlZWwR3rS6qWSHbivLSbXchGCeVpuwmSMJ0R1hFyUplgfjosOYBULFwPZ1wbYBw8jBGn1KwZK7NmKBf1s2z12bnihwA83XllhPNhYgLqfb73R9lwV/PPbajK5oGXjVB/nlGLJDvOWLBVi+mYpiQOHpkgLCC3yrtw9bqSQC2uFzXbs26Tk2wuvhNeFVkO2XZgW7T0uLxdw5td1CG+ew/Ow5SoxO/C/6r7Uv4fIpLA0U6cgb/+ZxImDT8m3cu1A6nbCyvDfIgdqwS5RVBL0B+DiG5lywxJGwSYg46Hc1lJBg93eQoK+JThr6jW+IS8t+3LiArRZ5uwyqeUnfi9O0MIDhKt1NQ11tIg3EpzoHGROUKQfeMqr/4GaweRL8xqrxWD0qvNEerReKBGG9YNXf15xakzZTjob6I/l0A7W4LUi6qlFq9B2YTK/02rG6/SP+RHFyPQztw83v4/C2xbgKV1BF7xUCN09plr+SZlbbUDlNeB+Z/eQyBuKEUXEqbd6Myf0YikGUqp473xIa/Cbn5iKksLAHIPBNAsyzN+/ogiEHq4CvtzlyjrRgD92i/8LDnag+aaMN7aIku/OItXULbhj5teSYz8seYoIruxtInrfltOpFs68C5y00jZogtG3XgJq4kYmuapIe1AsqZwv6lmiSBGW4nryz2SAjHsAJjvYFUpbdUCsjja2LsdJ8qmCLCquREFcH18rAZ7nZA7cc5sJ7mXinfoSd0OecESGJh/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(6506007)(53546011)(86362001)(66946007)(8676002)(36756003)(4326008)(31696002)(6486002)(508600001)(8936002)(66476007)(6512007)(66556008)(5660300002)(2906002)(83380400001)(316002)(2616005)(6916009)(186003)(38100700002)(54906003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djZlcGpkUm1OdFYvbzRNeEpEN0RHVkpoTjM4TE1xQ2NFYkUxbmlSN3J2SDFU?=
 =?utf-8?B?MGlyeWpCTktLL2VxTmZjUzdOeVUzUjVvaW5PV01OY2FKT3FXYUxndzJSS0hK?=
 =?utf-8?B?Qi9lajRKZXNJeEJLK0V1Z05LR3VFWXo4dHlRN3diOHRRK1VOQVdNbm1NTWlo?=
 =?utf-8?B?bW1HOW9NTStVMlUraXpIcWlhcDZhV3ZoZmVPRjcvTXFqcXE2QU9tYXNLMjZJ?=
 =?utf-8?B?MmZZR1l5aDlNUEdjakVPdkN0RmFEbWdna2JxamxUZnBJQjVLU3lOdTBpd2l3?=
 =?utf-8?B?UWVjMW8yeklhQlFZUlRjMGZmZzdqMVM2R0Jocmp6cEc2SU1SOXFiQzZZbzhH?=
 =?utf-8?B?UjNkTU5pbmt1NkZEa096Y0kvaCtYQnE3cVRyelZ0dmpDcy9aNHJzODNCbWdk?=
 =?utf-8?B?Vk5SVXZuQkt4d2hDWWNuQ0ljZlRtNFEzZ3VtUFRrS1o4Tm80c1grSnJyR0M5?=
 =?utf-8?B?OVl5SitEdTljWHV6Rlo3c244WTRBNnBnNmwxZ2Z6bmhLVkt4QnFhYUpac09w?=
 =?utf-8?B?dUt3all6Q0Z5RFRWZDZxQnRmTktTWXJLUktnVVhUcnNoZ2EyL2NIejNnRFh1?=
 =?utf-8?B?M05RU1JoRzZDR3ExeWZ2ajhKNUZoYk4yOW9IajdidzJHMFE3bGo0SkIvRytV?=
 =?utf-8?B?VUQvT2VXZkFEd0FrWmdERkZzV25uWGtJUnNnNUtXazlrdGg1bVlWSTIvMCtR?=
 =?utf-8?B?WEdVRmxHVWZyUGtTMXpZQjErRU5sbmFaZFhDM3VGSllZOFlYVWZpQm05dERQ?=
 =?utf-8?B?TEkrcTRkS05RR3BaZWZDUERVL0NHUndlNnA0a2ZPOWZhanhFZDRkdmFEU2Fj?=
 =?utf-8?B?VDJ1VDNSa3dwQzRZNlhRSmhwVWg0Q3hZaDVPZDQ2YXVDcmR4clh3K0lzc09F?=
 =?utf-8?B?eHQ3bDREbEsrMjZlSnVKNjRveVhVbWtjd1FIWVhjYWxuUTVxNUp0Qm9zRTNk?=
 =?utf-8?B?RUxkSUlic1NYYTdsUzY5ZUw3SXl0TlB4cDRYeXJFeGFVTVc4d0FQNFlqSGk3?=
 =?utf-8?B?QndjK04ydWlrN25NUDNDY01zVTAwM1BydkUwVkdvYVA1eWFaaXlEL3NOM1JM?=
 =?utf-8?B?N3NlV2FLK3ViVWU2L0N0ZEtrN3EzVXRMQTZZZ2lNRnFCQS9vRGRBTmo3dE1O?=
 =?utf-8?B?U0hkeWJuR3JpOVlOSVRXam9XNE0rcUp5MG9qZkdETG80T2dIVGNyT1VuTFZo?=
 =?utf-8?B?Y29wNW5XQ0NIallZMHdFL0lxSDcxZEtiWHBDVTJhNWdabFUwSkdNOVF3bFM4?=
 =?utf-8?B?VHBUMTdEaGdxZXIvOHNjL2Z4aGFyNFFISnBybGpWTTcyN0Z4b0kzNXQ5ZHBa?=
 =?utf-8?B?UERKUU0rZUY2aVFxNi9zYlRzQ2YrZlNTa2IyZ0JWa1V0OGFXcmsrUU5tWWZv?=
 =?utf-8?B?ZVlySjkwUzgyU0IzZS9QSHcwMUlHL0V0VXFEWXZSRHhMaHpKWnVTNWZmQTJB?=
 =?utf-8?B?UnNpTXRqYnRrcHNKZzhGNTkwNXVpKzBRZnNQWEVrT2kzaUtTOFZkR2hpNnRD?=
 =?utf-8?B?aGlkNDc3MEowMlB1VjJyUWlUb0JLcHZ1Vjk3RFJTQlpzbzZoeDFxeUIxL1pE?=
 =?utf-8?B?R2k5by8rMjg0bU9rem1mNWFyakkyZmU1OTdkVitZUEk5czIrcWZvMVVBT2pH?=
 =?utf-8?B?dEFPZFNlZmZQRUNXWmdLZ0E4T094MjVkVm9WWnpNVUtmSi8yN3ZwektBT3dS?=
 =?utf-8?B?Wk5CSHhKY2dTL1lSa3N5TTBEVjJLVGg4MEp3OWR1ZTkxdEkxR3l1djMzNUpr?=
 =?utf-8?B?cjVuMGNkWFQ4QU4wUzlKMkw2TS9HRG9rTGV3cTdjdmVzTUJiM2UwQmdPdW1H?=
 =?utf-8?B?a25IeEp4MEhmN055b2I5YUVyNm1RZCtrL1cxNGN6YjFCKzBpV1FQQjlhc3hI?=
 =?utf-8?B?VHpteXNZSmJDNEp5M0pMNXVTRTNtRER3Y3hlM1Q0L3FmZENpam1WT3BCZWhG?=
 =?utf-8?B?cnFsVGpCcnhOY1Y5WDdsc21uWitDdXRkTDJxK21kWlNhYlc5c1Z0R3JkY1dw?=
 =?utf-8?B?L1B1Q3B5dUpjWldwcW04SUZTMmp3WkxzUmdHVTAvTTlJUDVId2ZmZnJmdnk3?=
 =?utf-8?B?Q0lScTZJaStFMGl6bkxGVDY3czB3ZFhQdysrcTRibkdFdm0zSGNhOWhFK2RN?=
 =?utf-8?B?ajJ1UytIYWFPYWpxUXVVZi9LbWR1R2lodDA2WGIyY2s3UUR0R2xVbVFpT0x0?=
 =?utf-8?Q?V9O2kBZWc53DadI+sbwJo4c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bee8727-0000-415c-5ec4-08d9f1649392
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 15:54:12.5908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5HtIjsWu3l1dnkjf3oL8HGIUMBUVBytzhin/LvV2LUXR/saleHM539A3AvQ5+WaZNSBaSGCmPgQbAhvrPaTNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8777

On 16.02.2022 11:30, Roger Pau Monne wrote:
> Such field uses bits 55:48, but for the purposes the register will be
> used use bits 55:49 instead. Bit 48 is used to signal an RTE entry is
> in remappable format which is not supported by the vIO-APIC.

Nit: The first sentence looks to have some stray words.

> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -527,6 +527,14 @@
>   */
>  #define LIBXL_HAVE_MAX_GRANT_VERSION 1
>  
> +/*
> + * LIBXL_HAVE_X86_EXT_DEST_ID indicates the toolstack can signal to the
> + * hypervisor whether the domain wants to use the extended destination ID mode
> + * for interrupt messages. This is done by setting the libxl_domain_build_info
> + * arch_x86.ext_dest_id field.
> + */
> +#define LIBXL_HAVE_X86_EST_DEST_ID 1

Did you mean LIBXL_HAVE_X86_EXT_DEST_ID, as the comment has it?

> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -648,6 +648,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>                                 ("vuart", libxl_vuart_type),
>                                ])),
>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
> +                               ("ext_dest_id", libxl_defbool),

Let's hope there's not going to appear any other meaning of "dest ID".
I would have suggested to add "apic" to the name, but this would get
it a little longish for my taste.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -782,6 +782,7 @@ static struct domain *__init create_dom0(const module_t *image,
>  
>          dom0_cfg.arch.emulation_flags |=
>              XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
> +        dom0_cfg.arch.misc_flags |= XEN_X86_EXT_DEST_ID;
>      }

Without any way to suppress this?

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -38,7 +38,7 @@
>  #include "hvm/save.h"
>  #include "memory.h"
>  
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015

I'm struggling to figure which binary incompatible change in here
requires this bumping. Does this perhaps belong in a later patch?

Jan


