Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9997F352C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 18:47:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638101.994403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Upj-0003fA-Rb; Tue, 21 Nov 2023 17:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638101.994403; Tue, 21 Nov 2023 17:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Upj-0003cj-Ov; Tue, 21 Nov 2023 17:46:47 +0000
Received: by outflank-mailman (input) for mailman id 638101;
 Tue, 21 Nov 2023 17:46:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5Upj-0003bR-4g
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 17:46:47 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efdba605-8895-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 18:46:45 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-332ce3fa438so545000f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 09:46:45 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 dh18-20020a0560000a9200b00332cb1bcd01sm5241564wrb.86.2023.11.21.09.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 09:46:44 -0800 (PST)
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
X-Inumbo-ID: efdba605-8895-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700588804; x=1701193604; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5v0GsRSLbXtnzUX+/gz5SxkzE/xYlrq7LkIqrPSj1Oc=;
        b=SVwLugPDQK7Rb1d0+VDYj4J1+s0U2jelaFqiJxg92mlGgvsphKavKHwFibWQwFHwcN
         MnCxils1LhyRFptS64eIogl12ma8P7IxacWsK7Yu5gv00uJQcN1BqyNQ+fW4GITTnL0l
         35yHdQ5pHgBrWd/2dqvnV7zKLsSjrVd1Qb0eE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700588804; x=1701193604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5v0GsRSLbXtnzUX+/gz5SxkzE/xYlrq7LkIqrPSj1Oc=;
        b=TYmkJaFxemFCDpMDBHubrt0El/sSt1PdVTN0OCn5ixDTWHnM11UQ5F6TW3IafQllAc
         5j6roNLJ6brlPa9jHU+574RRTqzxpf/bi0SDIq7S0IvTB07w09y7+Jag88RLd4WZJyfw
         aLi7ItCyoWyXo+uewJm81mLmsswS08ZK7YTxrsaEtpPitBVJZ7QLc/CvOJOZuva98v5Z
         O0HyyJz3+y1pT84s5iH8kp4NO9I2pQIjtVGSFrl8bi+OASKH6sv7AFLmrazNWlQkNwIB
         e63qwO6InEyE8grwLBuYdfz2fmlmrtQMoNtzdlSt9YeTDgt3XWSi2OUM/nWdjsbFxNQy
         FQZw==
X-Gm-Message-State: AOJu0YwQXnv2wHTV2HgPTzlQkLCi9jwyc/ZkWsetvrdR5XFSv35D9wVB
	T0kOjN1r65y45o/LC1Q6cq21fg==
X-Google-Smtp-Source: AGHT+IHVVGSnwv3z+r+ZQ5313nZLltOwG7Ll1HYB/rBx+fiK/M9tZD5VFBG/KBmhIDNyeK9w11N/gQ==
X-Received: by 2002:a5d:5f4d:0:b0:32f:7ff9:b731 with SMTP id cm13-20020a5d5f4d000000b0032f7ff9b731mr7541wrb.1.1700588804602;
        Tue, 21 Nov 2023 09:46:44 -0800 (PST)
Date: Tue, 21 Nov 2023 18:46:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH 1/5] VMX: drop vmx_virt_exception and make vmx_vmfunc
 static
Message-ID: <ZVztAzdwDTnJuJE4@macbook.local>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <fd9d6043-4877-4156-97d9-4bdf7cc8fe04@suse.com>
 <ZVzROZu9Afs-mEah@macbook.local>
 <a058b837-82da-4b93-be5c-b616511d24f9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a058b837-82da-4b93-be5c-b616511d24f9@suse.com>

On Tue, Nov 21, 2023 at 06:22:37PM +0100, Jan Beulich wrote:
> On 21.11.2023 16:48, Roger Pau Monné wrote:
> > On Thu, Nov 16, 2023 at 02:30:41PM +0100, Jan Beulich wrote:
> >> The variable was introduced by 69b830e5ffb4 ("VMX: VMFUNC and #VE
> >> definitions and detection") without any use and - violating Misra C:2012
> >> rule 8.4 - without a declaration. Since no use has appeared, drop it.
> >>
> >> For vmx_vmfunc the situation is similar, but not identical: It at least
> >> has one use. Convert it to be static (and make style adjustments while
> >> there).
> > 
> > I think you could also remove the sole user of vmx_vmfunc, as it's
> > just a cap_check() usage (unless there are more hidden usages).
> 
> Well, perhaps (and hence my post-commit-message remark in the original
> submission). Yet then I thought we permitted vmfunc use for altp2m, at
> which point the cap_check() is meaningful.

Right, I see now that we do only enable VMFUNC if EPTP switching is
supported, and hence we need to assert it's present on any other
CPUs, so yes, we must keep vmx_vmfunc.

> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> ---
> >> In how far the sole vmx_vmfunc use is actually meaningful (on its own)
> >> I'm not really sure.
> 
> (Here ^^^)
> 
> >> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> >> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> >> @@ -167,8 +167,7 @@ u32 vmx_secondary_exec_control __read_mo
> >>  u32 vmx_vmexit_control __read_mostly;
> >>  u32 vmx_vmentry_control __read_mostly;
> >>  u64 vmx_ept_vpid_cap __read_mostly;
> >> -u64 vmx_vmfunc __read_mostly;
> >> -bool_t vmx_virt_exception __read_mostly;
> >> +static uint64_t __read_mostly vmx_vmfunc;
> > 
> > I'm quite sure this should be __ro_after_init, but I guess we cannot
> > be sure give the current code in vmx_init_vmcs_config().
> 
> I think we can be sure. But if we were to switch, I think all the
> related variables should also be switched at the same time.

OK, IIRC in the past we have switched those kind of attributes as we
changed the code for other reasons I think, but I won't insist.
Coherency of attributes might be more valuable here.

> 
> > Any CPU hot plugged that has a different set of VMX controls should
> > not be onlined, the more that migrating an already running VMCS to
> > such CPU will lead to failures if non-supported features are used.
> 
> That's the intention of that code, yes.

Hm, yes, since we do require PIN_BASED_EXT_INTR_MASK and
PIN_BASED_NMI_EXITING on pin_based_exec_control the setting of the
vmx_ fields is only done on the BSP, or else VMX is not enabled.  It
would be IMO clearer to do the initial setting of the vmx_ fields
based on the function `bsp` parameter.  Anyway, not for this patch.

Thanks, Roger.

