Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7418D885637
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 10:11:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696265.1087037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnERk-0006qD-PH; Thu, 21 Mar 2024 09:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696265.1087037; Thu, 21 Mar 2024 09:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnERk-0006of-LR; Thu, 21 Mar 2024 09:10:48 +0000
Received: by outflank-mailman (input) for mailman id 696265;
 Thu, 21 Mar 2024 09:10:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbdV=K3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rnERi-0006mF-Tm
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 09:10:46 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e61019c7-e762-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 10:10:44 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-414700cffd6so5633725e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 02:10:44 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 k4-20020adfe3c4000000b0033e48db23bdsm16685413wrm.100.2024.03.21.02.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 02:10:43 -0700 (PDT)
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
X-Inumbo-ID: e61019c7-e762-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711012244; x=1711617044; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dxyRfSAZc2eKJn/fIAN0WDRa0aI5LU+mk7Q5QdRfDfg=;
        b=fVWBFhnMn3SbV5Az2jfxUc74WqJRNppPz0ZqhWK6lf/LoZ/dI7xiQAP4gjemefG75Q
         8yNTKBrhEu6wNMnU+QYvRSBYb4v5lFcx9lhkpRdakOYTDLQiIEImuwww6iMRq/m0Abzw
         BoeQF+jbW2gmX4Eu0lP5gbs7W1W6RlweoswVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711012244; x=1711617044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dxyRfSAZc2eKJn/fIAN0WDRa0aI5LU+mk7Q5QdRfDfg=;
        b=IEjorjOTlEj3lxKP7R6hnmDsBIi6qrwVIYFINdXs4D9QIr+muTUYf/1vqnqBj6i3xl
         1QPtes34iYq6hF4FzmgH6S0mZlnHjM5BbyLZP9MDh31c46k4hEBE+/s0KrY8oMcuFW85
         br09z/7g0573wZqjMaRIcPkMYQWZ+czVQvinlABx6YLsgsnY7u/2UjHc8xF8Or9A9GAO
         PKohHIzQ95sLmsk60CJTSl6YIbSqgAQbvDFyWJGWlDWmJ9i5ZHPERCf74CEyVhft9fH4
         38w2DL8hCC56xzoR7dPSFSemdbCZIxuIlMLnDPnH3t94XnR/iIqKbdHDo0nIXn+ajrSl
         /7Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUj++8YR8zHJGzkpVDukKw88nJrJ5a1uLoRWdGH3uIOciYoGDicPDhTBFVLqmpmrp/tXFLF7M66mDeNgcCyI08diEmajY7Lj4czysGZQwA=
X-Gm-Message-State: AOJu0YxOmkiHdh58wq921gg+ooSFRl2xiQUWoy4AdXc2HaHqiJiHsE8O
	WLyTXTeolEd6g5/KYMP8W0oazVsBhxBELlak17HjXitoTnZie65yjahu7ymX6Dw=
X-Google-Smtp-Source: AGHT+IE+dWjIJYvCHxqO43kxoTmPDBNIVJCkdwZeePaMwRgq4zDfzgeNV7sJiS4wiRcBgkzcHQqMwQ==
X-Received: by 2002:a05:600c:548c:b0:413:ff06:83cd with SMTP id iv12-20020a05600c548c00b00413ff0683cdmr3359546wmb.3.1711012244261;
        Thu, 21 Mar 2024 02:10:44 -0700 (PDT)
Date: Thu, 21 Mar 2024 10:10:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Message-ID: <Zfv5k8jt0k7QHFxM@macbook>
References: <20240320135720.68894-1-roger.pau@citrix.com>
 <73314dc5-0145-4aa7-a3cd-23c943235392@suse.com>
 <ZfsPAj-ggY6unQef@macbook>
 <4cc5d746-a50c-4819-a56e-512abf797ef2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cc5d746-a50c-4819-a56e-512abf797ef2@suse.com>

On Thu, Mar 21, 2024 at 09:07:10AM +0100, Jan Beulich wrote:
> On 20.03.2024 17:29, Roger Pau Monné wrote:
> > On Wed, Mar 20, 2024 at 04:09:33PM +0100, Jan Beulich wrote:
> >> On 20.03.2024 14:57, Roger Pau Monne wrote:
> >>> There's no reason to force HVM guests to have a valid vcpu_info area when
> >>> initializing a vCPU, as the vCPU can also be brought online using the local
> >>> APIC, and on that path there's no requirement for vcpu_info to be setup ahead
> >>> of the bring up.  Note an HVM vCPU can operate normally without making use of
> >>> vcpu_info.
> >>
> >> While I'd agree if you started with "There's no real need to force ...", I
> >> still think there is a reason: If one wants to use paravirt interfaces (i.e.
> >> hypercalls), they would better do so consistently. After all there's also
> >> no need to use VCPUOP_initialise, yet you're not disabling its use.
> >>
> >> As said in reply to Andrew's reply, besides acting as a sentinel that
> >> structure instance also acts as a sink for Xen accesses to a vCPU's
> >> vcpu_info. By removing the check, you switch that from being a safeguard to
> >> being something that actually has to be expected to be accessed. Unless
> >> you've audited all uses to prove that no such access exists.
> > 
> > I'm kind of lost in this last paragraph, how is that different than
> > what currently happens when an HVM vCPU >= 32 is brought up using the
> > lapic and has no vpcu_info mapped?
> 
> I think this aspect was simply missed back at the time. And I think it
> wants mentioning explicitly to justify the change.

OK, I can add to the commit message:

"Note an HVM vCPU can operate normally without making use of
vcpu_info, and in fact does so when brought up from the local APIC."

> As said in reply to Andrew, I don't think the dummy structure can be got
> rid of. Nor can the checks here be (easily) removed altogether, i.e. your
> change cannot (easily) be extended to PV as well. Even conditional removal
> of the structure in !PV builds would first require all vcpu_info accesses
> to gain a suitable conditional. Which may be undesirable, as some of these
> may be deemed fast paths.

I didn't intended to do this here, as replied to Andrew.  If we want
to get rid of the check for PV also it needs to be done in a different
patch, and with a different justification and analysis.

> > Also, from a quick look it seems like sites do check whether vcpu_info
> > == dummy_vcpu_info, otherwise we would already be in trouble.
> 
> Such checks exist in code managing vcpu_info, but not - afaics - in places
> actually accessing it.

Quite possibly, I didn't look that close TBH, since my intention was
not to remove dummy_vcpu_info.  I've noticed however that
__update_vcpu_system_time() checks for v->vcpu_info_area.map == NULL,
which is fine, but shouldn't it also check for v->vcpu_info_area.map
== &dummy_vcpu_info, as it's pointless to update the vcpu system time
if pointing to the dummy_vcpu_info?

Thanks, Roger.

