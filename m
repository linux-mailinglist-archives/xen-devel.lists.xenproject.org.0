Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 708B7429002
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206053.361519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvsu-0006is-SP; Mon, 11 Oct 2021 14:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206053.361519; Mon, 11 Oct 2021 14:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvsu-0006gy-O8; Mon, 11 Oct 2021 14:02:32 +0000
Received: by outflank-mailman (input) for mailman id 206053;
 Mon, 11 Oct 2021 14:02:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZvst-0006gs-VF
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:02:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b24f3af0-7f15-4f41-8a70-efeb4bf8a786;
 Mon, 11 Oct 2021 14:02:30 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-1WmZarAUOJe4AhYIf4Sgog-1; Mon, 11 Oct 2021 16:02:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3117.eurprd04.prod.outlook.com (2603:10a6:802:6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 11 Oct
 2021 14:02:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 14:02:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0701CA0057.eurprd07.prod.outlook.com (2603:10a6:203:2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Mon, 11 Oct 2021 14:02:24 +0000
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
X-Inumbo-ID: b24f3af0-7f15-4f41-8a70-efeb4bf8a786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633960949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbjm/insLpSAtnftwykU3DoT0k9nscyGQ6ldLJaxOA0=;
	b=PwEP1u+vxs7oPY5VXuOtX46k9H43V32mzEo4u0Jreo0iq1k8cCbLfu4TSw+5m0bDvLnBPC
	tAgbOVRu0Tz2CiTPkI/MvzcRmtND4F3gM4+eulpb8mU4GH85TxQsKC5+rVsLOu0Kd7uuOv
	kHvdEUZUWPEds3lLj0OqQyjpCHjKhJ4=
X-MC-Unique: 1WmZarAUOJe4AhYIf4Sgog-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWYOlAYZPRYjlrqvhtsZ2GLlrP6FhbsUfVb4S9LwElgJB/vq9LbRkJNzCHDRH7zklyjkQ0CLRXcNfo4sI1BmKipBXcErrmnal4bigqgepZ7BPEZEY3HXCnA1PbCmln53lBrbhlBtvf0gMIcmUOp16+NHcp7G2BdlS7U2jo3QVZvfQXK09KWacoT0Z3M4jSKtqL2UejFGpVpFRHm9Xc6939oyySwpEZmkRQbrJ1Qzh+We5b8MpozE0fsdB7bv3IJXkPFwgXyWEzm5s4Y210k8hFBEjeCcYJMPxXXU6MyRW+YUGED70YmTft6L8jPaU1zIgYtzmQ/H7NGaOE9RfzH6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbjm/insLpSAtnftwykU3DoT0k9nscyGQ6ldLJaxOA0=;
 b=dJlpeqlmd13Qpc7v7ofpZDqzGvFV2bs0DDitRHDKhJSiWQHLCkrUn9O47ZWDsVQico1Mr+E77d0k1fDJpNxGF9OcyB2lOapBrd+SBOdBl0GKGD/Z0AXC38UHl1H6uFlNb0G2So6Ls0NFiauRr5qQNaBlC4xxaVGxBn0goOj9fmRUkw11DPiN/gzkFrI7DpI8iLRqnJcpPn2NNBXOH6r9P+g2og1YC/CyxGB2mV6+D9Sn2FziTF2uaosbdI/cCe3JZYfHXEgQOphqwShnTu5U25N6Gl7P9+HzjnVsS28korK/Dci3NcaRA85XpZC/ffSMgBeYw5dHed3Fz4boRoxXSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 26/51] build: build everything from the root dir,
 use obj=$subdir
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-27-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eca3f533-9841-e4a8-dfde-840451ed8aef@suse.com>
Date: Mon, 11 Oct 2021 16:02:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-27-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0057.eurprd07.prod.outlook.com
 (2603:10a6:203:2::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4665c29d-1808-4574-3b0f-08d98cbfc0ef
X-MS-TrafficTypeDiagnostic: VI1PR04MB3117:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31173D1FA58C430C487C1BCAB3B59@VI1PR04MB3117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/VacpLWM/mBIxv1igtBswNYpa6fTEdeuY3BTIwIJMn8BKfmwY79OYO5S6ldCm4Bb1IoAXRa+i+RzGAABxc3vl1Z2rD+BFY4dwjBtFZyOS8pyMojRgPwFwXHGGxABrCAlnv1EWzXVawsoRIXOabg7diRt6TVPO74jAPfu3VnNE1Z6R1CB1XjPRctzHQrFxfskpVWGnDCH4yanJAVUHAJxZwbIs7kXiN29KTLRD3NFblgO2n/+Za9f+jZ45bQoce1Blt2Oat78x4uUeomkaqeVpNnkzbJAUqNxeY9VSzbqNfLi1geS0bxEnVjMnaXVrRTIpJYyo0+TEOOsyntxoFUvOt/St66K704Jb3fZlTjVoIWiDRAknGM/qvyCx1LNK5sqZW0/eEFjUvkENl60NBU4oyuQmSpH5hbmkwmj3XQmXPKlRisbZWs2h6tKbGM0fKmClXXcUGq4xU9wlO6JTvMOtIV9MvmOG3jaVFp1TVNyMVvHNDzThk+/f+KaKbvTq2nvHdd/zSxsLWOG8RlHngOe7ZGkOuSla+xSfAnWodot6fUjrm/pieIle2Se4nGcyIfoU3YuW3K8DiNG1dczAwM/cuuVbR2mLFMqXniepQi5ai06VZU4nDjbAk6GAPqfE/lKeo9ZGp9dHfkcWyJdulFSHBeFZeSYVA3RgpJt7dJLAuOMHRBmLRli2RlTd5MJV36QKvMxUpU5ZjrXFe8KEU/9gCHp/mXqzx57yKyA6vPzVtq5LwPn60+rRkBf/8R7RC+NWVMo9agMiOkxml5jbYrZoA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(86362001)(31696002)(53546011)(186003)(4326008)(36756003)(316002)(8936002)(16576012)(5660300002)(26005)(956004)(2616005)(6916009)(508600001)(54906003)(31686004)(83380400001)(38100700002)(66556008)(66476007)(66946007)(6486002)(2906002)(8676002)(155303001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXhDRG1KdG01WnM3dEtmeGs4ZnJxRlNrYkRmZHprMUR3b2k1ZFVaNTNZMXpj?=
 =?utf-8?B?ZXFqc2xHR0N1WlZnUk5mSG8wWFkvU0F4NWdUR2pFWFg4K1NIUUoyNjBObzB1?=
 =?utf-8?B?czYxaVBoYTI5Nm1kV0UwVWN4ZjdNWDQ1dE80R0VPd3ZGVmdNdFpUQVh6bjkw?=
 =?utf-8?B?SjgzeW1BL3N6SlBzVHI5TW5qWGRiamJuMmtZejhxdFpvQTBBQ2RIRjNXZzFZ?=
 =?utf-8?B?UXRWMDB1aktaRTMrMVFXZUs1VDBSaGh0emxvM2FxejY4YzZBcUhuZzFQdE1j?=
 =?utf-8?B?U2szN29Pc1JoSUJFUk5YZ1hCMGo1b1lOZHdCU3BlVXZpb28xeHpObWhodXNL?=
 =?utf-8?B?d1NVSG1DSWxzT2RRWVBHNnI2am5GUFRZSWtQcG02dzJsRm1FbE4zaXhUU3Z3?=
 =?utf-8?B?dEV6cFFBMHp5WmpCRlNNSkdNMUZFaW9RSStUSm5rZnR6ZEprNEdEck4ycUdV?=
 =?utf-8?B?S0xvL2FUR1A1QjZLNWw1NFJXS3NuUnVLRVR4TlRLN2kyZUprQ2tYWmJKS05N?=
 =?utf-8?B?RWJ2NDU1aEpHZG5GVU4yKzR6S0Fiekl6QnNrTlIvRE9kRjhuZnlLcE9WTmd6?=
 =?utf-8?B?d29PN0ZXNE1Sa01zUFlpUUNic2dXaXJRK0ZUTTZNL3BkaFpJRllHVE1vdXA2?=
 =?utf-8?B?MGp0ZnFkMzVKc1FNME1kaFNDWHBFeG1JbUFjN2xyTWlJdHp2Wis1SHNrQ2Uy?=
 =?utf-8?B?b1RTcUpxL1pISDgxUjQ5anVxQi8ydWVlSExqUEdvL2U3UHVmdlR1K1pWanRi?=
 =?utf-8?B?K1BrV1g5V0NFQ3F2YmJrdUxKZlc4MFdkWGVLNUxwK1dUUGdEYVlIVW53cEF4?=
 =?utf-8?B?K0FJc1VpTm9pMnorMldZeFlYUlkrSEpsOFRRbmUvcVJUbmszQ1JvMlk3b0Vv?=
 =?utf-8?B?M2thMzBFa1FzaXZkWlpoYTUzL3VYSWYzT1E2d3c2dllubStHcTEvd2hCVTAw?=
 =?utf-8?B?NHZtelFQZHB1WitORnNrZVQwWW0vdHlFVlZMWkV0K213em5vSUtuc05hUHYv?=
 =?utf-8?B?a0F4ODZkQTJkaWFQcE9EMTdKSlFOZ1l4Wk93cmVOeStEQmJBVXpkQWE5SFVY?=
 =?utf-8?B?N05NM0lLNlRyUTdNZXVCZFV4MFBLaG9nQmJIL25PclVMSkJ1WFhBRE91dktn?=
 =?utf-8?B?bGxKTmxXbkZrSFJRUTlYaWQyUjV2SnR6dWlUMWNERmdRN1licHFYWTVOd1FP?=
 =?utf-8?B?TjhyVHNwclc5OG5xUnozMU9Jd3liNHhqYUJkell0TStZNjBoNUVja2ptWjQz?=
 =?utf-8?B?NStabEd0VkNyRkd4UlFLemkzM0VnendXZTNqclVidGVVWWtlaXV1dk5MeFNu?=
 =?utf-8?B?bkRTcTRBQVBLbTR1WkFVNVFKRHhFaGo5c1QzNE9tWHJuL0JYUmlUY09rb2Jt?=
 =?utf-8?B?RXhiZHZNdEZRQkVtNjBwRnpGMHdkUUVjUlBNYUdMT2xOS085ZGpnZHVKY05k?=
 =?utf-8?B?dUo0elhERVNicEQ2ZTRrV051MnhXQTVldG5vN2lDVzRaUk9aL2YrTXFCekdJ?=
 =?utf-8?B?YW5oNGRHMGJGT09xWHBMMnZ4RWlMZmlvd0JUelF4UzhTUUtDTGRyVmZaaExC?=
 =?utf-8?B?RGY1V3I0V3g0WUVrUkRtaE82Ykx5RnZyRnl1U25lRGN4WEhsZ2xmNlA2NjhQ?=
 =?utf-8?B?ZFhSbWh6ZnM3a08yTnM4aU1nN1lrUStJakl5bjBBb0MrY043bEFZSlVyZE5k?=
 =?utf-8?B?UVg4bmE4ZGlQbDlLcFZKSXp4TkF0OXc5QTNYME5vcHptMDBrblprQmkrQWI2?=
 =?utf-8?Q?5+v6ubNNUfn/CKYaPY77vfYgziK8TxpChz38wp7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4665c29d-1808-4574-3b0f-08d98cbfc0ef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 14:02:25.4890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NV/xcwibR8nlBSYAT3mVkWzryd/LuepJLuOjkaMXUGE3XkAxgnvmsHrskMQrOiqohlai5CgjzkpaDD/9ib5JUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3117

On 24.08.2021 12:50, Anthony PERARD wrote:
> A subdirectory is now built by setting "$(obj)" instead of changing
> directory. "$(obj)" should always be set when using "Rules.mk" and
> thus a shortcut "$(build)" is introduced and should be used.
> 
> A new variable "$(need-builtin)" is introduce. It is to be used
> whenever a "built_in.o" is wanted from a subdirectory. "built_in.o"
> isn't the main target anymore, and thus only needs to depends on the
> objects that should be part of "built_in.o".

How "good" are our chances that we hit a need-builtin variable from
the environment? Its uses are simply using "ifdef".

> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -3,19 +3,29 @@
>  # Makefile and are consumed by Rules.mk
>  #
>  
> -obj := .
>  src := $(obj)
>  
> +PHONY := __build
> +__build:
> +
>  -include $(BASEDIR)/include/config/auto.conf
>  
>  include $(XEN_ROOT)/Config.mk
>  include $(BASEDIR)/scripts/Kbuild.include
>  
> +ifndef obj
> +$(warning kbuild: Rules.mk is included improperly)
> +endif

Is there a particular reason for this to come only here, rather than
before the include-s (e.g. right at where the assignment to the
variable lived)?

> @@ -51,27 +61,54 @@ cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $< $@
>  quiet_cmd_binfile = BINFILE $@
>  cmd_binfile = $(SHELL) $(BASEDIR)/tools/binfile $(BINFILE_FLAGS) $@ $(2)
>  
> -define gendep
> -    ifneq ($(1),$(subst /,:,$(1)))
> -        DEPS += $(dir $(1)).$(notdir $(1)).d
> -    endif
> -endef
> -$(foreach o,$(filter-out %/,$(obj-y) $(obj-bin-y) $(extra-y)),$(eval $(call gendep,$(o))))
> +# Figure out what we need to build from the various variables
> +# ===========================================================================
> +
> +# Libraries are always collected in one lib file.
> +# Filter out objects already built-in
> +lib-y := $(filter-out $(obj-y), $(sort $(lib-y)))
> +
> +# Subdirectories we need to descend into
> +subdir-y := $(subdir-y) $(patsubst %/,%,$(filter %/, $(obj-y)))

Deliberately or accidentally not += ?

> @@ -156,21 +192,13 @@ endif
>  PHONY += FORCE
>  FORCE:
>  
> -%/built_in.o %/lib.a: FORCE
> -	$(MAKE) -f $(BASEDIR)/Rules.mk -C $* built_in.o
> -
> -%/built_in_bin.o: FORCE
> -	$(MAKE) -f $(BASEDIR)/Rules.mk -C $* built_in_bin.o
> -
> -SRCPATH := $(patsubst $(BASEDIR)/%,%,$(CURDIR))
> -
>  quiet_cmd_cc_o_c = CC      $@
>  ifeq ($(CONFIG_ENFORCE_UNIQUE_SYMBOLS),y)
>      cmd_cc_o_c = $(CC) $(c_flags) -c $< -o $(dot-target).tmp -MQ $@
>      ifeq ($(CONFIG_CC_IS_CLANG),y)
> -        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $<=$(SRCPATH)/$< $(dot-target).tmp $@
> +        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$< $(dot-target).tmp $@

Are you sure about the $< => $(<F) transformation here? Previoiusly it
was present only ...

>      else
> -        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$(SRCPATH)/$< $(dot-target).tmp $@
> +        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$< $(dot-target).tmp $@

... here.

> @@ -251,6 +292,9 @@ existing-targets := $(wildcard $(sort $(targets)))
>  
>  -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
>  
> +DEPS:= $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).d)

Nit: Preferably blanks on both sides of := or none at all, please.

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -81,6 +81,9 @@ endif
>  extra-y += asm-macros.i
>  extra-y += xen.lds
>  
> +# Allows usercopy.c to includes itself

Nit: include

> +$(obj)/usercopy.o: CFLAGS-y += -I.

This is ugly, but presumably unavoidable. Preferably I would see us
the more specific -iquote though, assuming clang also supports it.

> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,8 +1,8 @@
>  obj-bin-y += head.o
>  
> -DEFS_H_DEPS = $(src)/defs.h $(BASEDIR)/include/xen/stdbool.h
> +DEFS_H_DEPS = $(BASEDIR)/$(src)/defs.h $(BASEDIR)/include/xen/stdbool.h
>  
> -CMDLINE_DEPS = $(DEFS_H_DEPS) $(src)/video.h
> +CMDLINE_DEPS = $(DEFS_H_DEPS) $(BASEDIR)/$(src)/video.h

Hmm, new uses of $(BASEDIR) (a few more further down). Why not
$(srctree)?

Jan


