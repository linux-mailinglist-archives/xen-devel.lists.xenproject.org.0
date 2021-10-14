Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69BC42D574
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 10:52:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209098.365444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawSt-00025c-KN; Thu, 14 Oct 2021 08:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209098.365444; Thu, 14 Oct 2021 08:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawSt-00023p-Gk; Thu, 14 Oct 2021 08:51:51 +0000
Received: by outflank-mailman (input) for mailman id 209098;
 Thu, 14 Oct 2021 08:51:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mawSs-00023j-Ng
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 08:51:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7d09b1a-2ccb-11ec-81b5-12813bfff9fa;
 Thu, 14 Oct 2021 08:51:49 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-vlg5aydsNQGqIDPBc3EvlQ-1; Thu, 14 Oct 2021 10:51:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4943.eurprd04.prod.outlook.com (2603:10a6:803:51::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Thu, 14 Oct
 2021 08:51:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 08:51:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0008.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 08:51:45 +0000
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
X-Inumbo-ID: f7d09b1a-2ccb-11ec-81b5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634201508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ad7+q8AoTrQdO1jeRZH1euZa6JslHRFbQaEbpMjJv8=;
	b=bnBuLu5eRMMulkP4CTAizqrXOxIWVq0aNF2IRKqhVszv7XVGopqB6Byy1AtMo6RZBZbMSq
	H4xbWIruMAQGuP6UhhwaFtgZsHSVWU6uRRHNiAhwOdmF8RMI2t9DakohPfSjpgOz6H6RWW
	fy6g1uUpSFFyANragGzzSB3RaEvYNH0=
X-MC-Unique: vlg5aydsNQGqIDPBc3EvlQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aemzji6Rph7MEUM8U4OsAk5LNYivHUUhD0yJBizK9n5Ng3r9/gf1gsnEMfeGY92PAxckmrfqbJRKyYEtoqtl4aIOCFy52+e2ZzBGzXzb/3RVdkGF1RAws5mZYdsVC9TTtzi3pvTSOr/GvPzVTVEA0FF94Qxx7K59fs5CmSEsHJqck78XliK+ANLbwg6wHLGZr9Y5HToHNiMFV/zv+7OmDWL5h3sgdZuFhmAA78Acj+vFx2XUtsyerdZcSjKLOzmRyAhi405+h/F/H/Ssnu2sLwckHqNW5aCoI1GYJ2hiFggUBuBEekR4Rm+xgPXk3Trs41GSCXNmia1g3ph/KQW8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ad7+q8AoTrQdO1jeRZH1euZa6JslHRFbQaEbpMjJv8=;
 b=WT7cwjIxYcRB3mMeT87revGmckVQV8n3YDlPJG2jRM8nGYyzwDs1MK9zt7JF50UJ6QqTgcJp+SYG+N9YDgpqbE6LVaBwrDukQF1qWVtgo6emT1FP4EWojRMJ+0kd8yLnDQJBjzkosu7H3C9OHCuDpsdFL6If5vWlyMqpOJ3j9q8LmEePtyZsO0Gwju9fWNvNu9Db6i2vdqxszX4kGgf4QFcsR4P5+ZkP9ScBwFvr+s5hxQCRbI/4GX6/oqw03OexbuSOxXEqYYCQDNE1DncQZ6A8e/ag19ZnnE7vKmBR1tZ8srexTtzQwsQv1YOYFiLkh8oPvZ9DMQn7ZzeXiggQ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 42/51] build: grab common EFI source files in arch
 specific dir
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-43-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <43684fcc-f6ca-86f2-9fb1-d3d5d9dbc20d@suse.com>
Date: Thu, 14 Oct 2021 10:51:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-43-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0008.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc336640-e6f1-4aef-d5a9-08d98eefda73
X-MS-TrafficTypeDiagnostic: VI1PR04MB4943:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4943D18708E8C1545980DF51B3B89@VI1PR04MB4943.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1jL9rctlLwnzAbt6cgibnivqTAvbUME9LvdLNHaNesngGPdYxDvFGH0l0pnYu1G/ZYtdKflYLMNTAZDBjdtXuN8fXzsq3j2/oXpxYhJftkoUMY3ln/CgT3wj/QSYyDpRPZB7pp6qsNyw9q7fPdxfu1SnxIus5l8Pu7/rb3irHFMbholexG/EKvf1sU/rCrr5c21gLHGfoIZR4hPmEyWumhmOcokv8qM6X0c9wmDZc7vaqGsBWOjVEtn+Vy67h68NNnn+5qLdgDwdB8W6uVYNcFTUUGf4FBn46q3U2flU8v0tpu106x863V2plpx/xPk2BdJ2kahIg63lP2JbHhme0225imFGjdUTV0H2ezQFWi1u6+2CnJMRogSar/Bjuw6oMtcqwwZP3SgVGwFLAYuwRKD29rCI4gSRLKjODC8WVj61F7Oj968gmZ8RFLN43acsUQv/sojHnMNEfgqtuTwB30ppFt9l7rjDHl3FEz5N286f32OOO6qSKCz1q2W1FgfUPNVv/DFkkdS+7TsljlIva5F/jwiTVtXr8808YHPIcl2SnDSTCFGX9v1omUkvJjzxUM7voEGAOK/Ma3nNsSS5eN+FxIL2BusdXMf2NZCbArTdEiyAtAJvgf787OF5nHRIHFvhjTDe/AVCgQpjV9EaO+StZI4zfrI2yn55SL/QKOYvWvIa92dgaLixL2NT/WGa9c0msODo/mg5kklFzk97Gcm09i72tgbdsIUVOzjsa4d3NqiwmG/lhoMAKmrcmUv9Qwz6BhSPDm9KeDFX7ORHCdCHsbeYJJRMHmJkzgCZaEEXcOnGtKPLiGq0zBGPMB6G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(8936002)(7416002)(6916009)(2906002)(966005)(6486002)(186003)(66476007)(66556008)(54906003)(2616005)(956004)(66946007)(8676002)(53546011)(5660300002)(4326008)(36756003)(16576012)(26005)(508600001)(31696002)(86362001)(31686004)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVVtNVMvTGNGSCt3Y2NtTWg2ZTFpSStobEFyVHJFMm9FTHBWOCtqTys5Y1RN?=
 =?utf-8?B?SEtBKzZpaEhld2xKNjd0N1hWNDVmeG9ES1o0bVppQk96bStOYlJxb3Y1R3BC?=
 =?utf-8?B?dVMzWUEyUnhnSW9VQ0hoUUsyQ09tSWphelNYVWRNQ0p6RE12bVdXUU10T0hY?=
 =?utf-8?B?SEJSMXpPME55SjNtSUJoMGZjemFEV0JhUUpWcUlIT01PRjFWY3NUb0U3Ympz?=
 =?utf-8?B?V0VqUEJJVGhUWmVoTlJnT0xPVmVHRHg5R0JQL1ViOW9XTGwvTFg1ekF0aTVW?=
 =?utf-8?B?ajZ4MjAyeC9haGdxa1BCdmFHak5BdHY4TFBjcW9qWmlCL3pNWTZSck5NMEZO?=
 =?utf-8?B?SG5KclVXbktLN2lxMFRzNHZnVzlCQjBldTlKN1htSUdZcVBPaWhucDN6MWNR?=
 =?utf-8?B?SEVYbnoxREptd25xV1NSMDFUQ21uZmxnSmc2ekJ2VUtNMHB4VzZCWktGSzZO?=
 =?utf-8?B?bEtJa3BsZDBTV2RzUG16c3p5R3ZFVXp1Z1EvakE2cVhlL0RWWVdqSU5xM0h1?=
 =?utf-8?B?eU1oNXVsaHpYTERSZlRRajUrTlc4aE1rbVcwNFh4WTFTWktTSForNVkzQVdZ?=
 =?utf-8?B?RHhPLzRFVzhvTC9rZmxyTWFGYXpIazVza2lxbi9jcGc2MlRXY3lvd3FvV0lD?=
 =?utf-8?B?eUIwTVlHZk9wMzVzbkdaV2dmaUoybXpMZFZySU9TTmtiZ3JkdW9nZkdrdjZL?=
 =?utf-8?B?M2VSVTFxUDZlWmxiaDVQeDhQdnhjUyt0RXNHTzdEM2duWkVRUTdIU2xMdXNr?=
 =?utf-8?B?ZEE1OFV4c1F0ZkU0TS9kRWNQajFEVlFCN1hMOC9BK3hDcnJMOGhhaXhJaWFn?=
 =?utf-8?B?MWtVdXMySlo2Q0lnazVkR000OG80V1ZJOG5URUNicGpWU1lRTW1SV29rZDZp?=
 =?utf-8?B?UDkzUGlMajlBLy9PZ2EzWG1NYXYyQjJHcUN2eHRaeU55bG91Z2tsN21CcjhV?=
 =?utf-8?B?SW5IdG9EbGhrbnJzNzdFV0hHNnhKc2kwYzJUMGYvSEhObzBaeXY4Y3dqejFj?=
 =?utf-8?B?Q20zOEZuQnQ1ZXdCZG0xZ3VReDZzTGtaMlR4dDVsMTRpam11bFpoRTJ1em80?=
 =?utf-8?B?RHdIWmwxS1pFVVFlZHh3ckM3QzZUVStZMUhOOHZBTEp1Q01CRndLMVZJcWJQ?=
 =?utf-8?B?dS9aMnRIZkM0b2JIUlQzZXB0TUNsOEsrSjhEV3M4QUdPNlY1ZVhuRU1JbW9y?=
 =?utf-8?B?TEpUZWRMK3JzVWVtVWxDTzNpQTNyWU41SVZETHNnYy9Hb0ZZSlZGZDVveExs?=
 =?utf-8?B?TndReStCZkYydlN4RVN1SmZ4RjVzd2pOYkttMTRkZW9DeWt4RjJZMktYL3lK?=
 =?utf-8?B?ZmYwQ2FlMTdPUWZuMEN3bkdFMUNvSW82ZlJVd1BTSkErbG9UZ3Y3b01ORERp?=
 =?utf-8?B?dzc4RndIbGNKTU9PY09yQjBBRDIySXJnOEZla0hIYThoZk1mUnBGUWphVmVj?=
 =?utf-8?B?YVE3SFdUbEdJY2JaUHlUUW9zWlR6azBuUUcvb2lyRk9mVTQ5MHdxSmJ6UTJi?=
 =?utf-8?B?QVFmQnh1Tnp6cnBlWHBoL0F3Nm40aHR3QlBSa2lHRmM5bThzeTZmM1BpOWQ5?=
 =?utf-8?B?Rlk2WTlnMm5zamhoblFPbHhwQzRBVXVtZEd2S0RabldxbkFxc3VubWlKTHdN?=
 =?utf-8?B?dTdNSG5rdFczR3FGZTFsNlN6elhvNXFJelZ4blF4bFZVSGR4SWlZRm4yZE8y?=
 =?utf-8?B?Q0p3SGw5cE9nRWYyOXlKRGVDeFFnSHJUR2RYemY3M3BBMGpJM0pyeUQ5TVR3?=
 =?utf-8?Q?U7ABw0qJ8FTAE7UBj0q82Hlo5FFVmB7DG8w5ShI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc336640-e6f1-4aef-d5a9-08d98eefda73
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 08:51:46.4447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2U5BfY4JfHpB26l8xzm9RGesFQVbzQ8/l435CYyFvviPaQipbpGP0RX2e/FjZtdZceYJnW+98GU3IX+xGeoZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4943

On 24.08.2021 12:50, Anthony PERARD wrote:
> Rather than preparing the efi source file, we will copy them as needed
> from the build location.
> 
> Avoid the links as they seems fragile in out-of-tree builds. Also by
> making a copy, we don't need to figure out the relative path or we
> don't need to use absolute path.

I agree that symlinks wouldn't be nice for the out-of-tree build case.
Otoh please see
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=8c6740616cd244e5763e974cb737affbe71db385
albeit I'll admit the situation was a little different there because
it's pre-built files which get populated into the build tree.

> --- a/xen/arch/arm/efi/Makefile
> +++ b/xen/arch/arm/efi/Makefile
> @@ -1,4 +1,10 @@
>  CFLAGS-y += -fshort-wchar
> +CFLAGS-y += -I$(srctree)/common/efi

Perhaps another opportunity for -iquote?

>  obj-y += boot.init.o pe.init.o ebmalloc.o runtime.o
>  obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
> +
> +$(obj)/%.c: common/efi/%.c
> +	$(Q)cp -f $< $@

In case both trees are on the same file system, trying to hardlink first
would seem desirable. When copying, I think you should also pass -p.

> --- a/xen/arch/x86/efi/Makefile
> +++ b/xen/arch/x86/efi/Makefile
> @@ -1,4 +1,5 @@
>  CFLAGS-y += -fshort-wchar
> +CFLAGS-y += -I$(srctree)/common/efi
>  
>  quiet_cmd_objcopy_o_ihex = OBJCOPY $@
>  cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
> @@ -19,3 +20,8 @@ obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
>  obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
>  extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o
>  nocov-$(XEN_BUILD_EFI) += stub.o
> +
> +$(obj)/%.c: common/efi/%.c
> +	$(Q)cp -f $< $@
> +
> +.PRECIOUS: $(obj)/%.c

Seeing you repeat everything here, despite it not being all this much I
wonder if there wouldn't better be a makefile fragment in common/efi/
which all interested architectures' arch/<arch>/efi/Makefile would then
include. This could then also subsume -fshort-wchar.

Jan


