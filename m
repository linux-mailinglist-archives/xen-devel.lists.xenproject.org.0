Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B9BA5C38F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 15:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908194.1315338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts0O1-0006Cx-UM; Tue, 11 Mar 2025 14:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908194.1315338; Tue, 11 Mar 2025 14:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts0O1-0006BI-RV; Tue, 11 Mar 2025 14:15:13 +0000
Received: by outflank-mailman (input) for mailman id 908194;
 Tue, 11 Mar 2025 14:15:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siat=V6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ts0O0-0006BC-Pk
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 14:15:12 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3df22a14-fe83-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 15:15:10 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5e5491eb379so9302575a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 07:15:10 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac2ab8298b0sm261932066b.89.2025.03.11.07.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 07:15:09 -0700 (PDT)
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
X-Inumbo-ID: 3df22a14-fe83-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741702510; x=1742307310; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uNnsAbmPD8b+15vtMIDn6Lm5/u5b5xODSC7AIl4Ti2g=;
        b=TKONsod4Rwfc2VJx+Vw3OVc7vA6DEAEECgNThH8m7a8LhgX/lIKH/uUzEtUXUMzC7D
         ejaEe7rAM2xOk33hSGfntMAoEiWPf0OyIjqdoW3NeY3b5DWeRx5C6cu38WHYG+z54g0I
         3Fa/mUW56FHPdI4pBW3+mJGqNZ3RkJmPtKG4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741702510; x=1742307310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNnsAbmPD8b+15vtMIDn6Lm5/u5b5xODSC7AIl4Ti2g=;
        b=V0nSoInxotMt8ErmH75dWQTrRH88k3RkPBupxdOUL0fNYDBKlPiUqPCsQ0MdsKwfTU
         EVbXEW+EcR+Fy667bMeJ5ZnBQJXW6I5RfobAeTLUB1Prd7KE02yw0FHT1UtpNGfWamQf
         AS4mHapFuilBmA0XSLZ4STVyifaTRrK55CbeilKYvnY74PnbdNUfAHGJp19oQymkC90D
         trjUN6EmRn07qVh0/ahl/GCWTpSo17jOSko4vzHSclblGWU4gt+BdA6pwxxYcQm8pOAC
         BcbJnDbeaE7ugAv2IJvIu0wnGRDTGgZWTnhQa8geZSi/0LHSi3WpLwQZ/pDtewbMYQui
         ua3g==
X-Forwarded-Encrypted: i=1; AJvYcCU60q+Csqjpkj5n78NuGJhOwU7gn9KABZulWRa8TqccbxgFvLD9kU0QykDe5+KhKVJMcwBWq4Avib8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxN9qQqnyUJI9ZsCFqlU2CqIw6uHzLTIxPT4oUTfRaUn5muecwy
	oILub2BmVoYOp44AxD+gK4iTwY4KAhVmu7Cb1V65w08FwNiOTK9w2hwnLaZ1FuQ=
X-Gm-Gg: ASbGncvmvVx02ourY5hdP+ub9PHN6xY6sHRmP5uZFku8skoMD06/QXepgdY7fOOzKJg
	EvXKFWDsbg7wCjfe0cOT6mV5WF7CZb873mIIVftGVKFvFUsPmBQPFN+PLNwEJVVRPVEbOXeQ7Rt
	hV7oPPfQv/49l/sQ5Pr8XywsEs8ZWw9mnMzFwxK+hB2FoEGHsS3IqcvRUpPgUftZ4eJ6qumKRNr
	pt01Pz7r4gViDiifOi5buJTRR40p2J14nsZgFr35Xw2meCHaVm1CZzo1DlKYcAHnD/PKd63iycO
	RNBW6ex92eCyMGy5XtA0Pkrx3aUHceEGxF/akkDoP4taMkB3Yw==
X-Google-Smtp-Source: AGHT+IEZ4zVFA42YCE9nVCJJNLHxpsLOmJ/1n216qF/fWaF9hZ+rLUMcq9FsR/kjdYnzKdr6wRfBbQ==
X-Received: by 2002:a17:907:72d5:b0:ac2:13f:338b with SMTP id a640c23a62f3a-ac252ef65e0mr1738195666b.55.1741702509975;
        Tue, 11 Mar 2025 07:15:09 -0700 (PDT)
Date: Tue, 11 Mar 2025 15:15:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 1/3] x86/vmx: fix posted interrupts usage of
 msi_desc->msg field
Message-ID: <Z9BFbFzOTq7AbE04@macbook.local>
References: <20250311120652.61366-1-roger.pau@citrix.com>
 <20250311120652.61366-2-roger.pau@citrix.com>
 <369daf2d-63de-4375-a11e-401135ede43b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <369daf2d-63de-4375-a11e-401135ede43b@suse.com>

On Tue, Mar 11, 2025 at 02:10:04PM +0100, Jan Beulich wrote:
> On 11.03.2025 13:06, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -396,6 +396,13 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
> >      const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
> >      struct irq_desc *desc;
> >      struct msi_desc *msi_desc;
> > +    /*
> > +     * vmx_pi_update_irte() relies on the IRTE already being setup, and just
> > +     * updates the guest vector, but not the other IRTE fields.  As such the
> > +     * contents of msg are not consumed by iommu_update_ire_from_msi().  Even
> > +     * if not consumed, zero the contents to avoid possible stack leaks.
> > +     */
> > +    struct msi_msg msg = {};
> 
> What the comment says is true only when pi_desc != NULL. As can be seen in
> context above, it can very well be NULL here, though (which isn't to say
> that I'm convinced the NULL case is handled correctly here). I'd view it as
> more safe anyway if you set msg from msi_desc->msg.

Indeed that's likely better.  I'm also unsure the teardown is correct
(or needed), but I didn't want to deal with that right now.

Thanks, Roger.

