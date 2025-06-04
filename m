Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB35ACD8C4
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 09:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005155.1384672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMim4-0002bL-Ed; Wed, 04 Jun 2025 07:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005155.1384672; Wed, 04 Jun 2025 07:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMim4-0002Yx-Bv; Wed, 04 Jun 2025 07:43:00 +0000
Received: by outflank-mailman (input) for mailman id 1005155;
 Wed, 04 Jun 2025 07:42:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xa+O=YT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uMim2-0002Yr-QC
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 07:42:58 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87b26c52-4117-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 09:42:56 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a3798794d3so5403158f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 00:42:56 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-450d7fb09a3sm187134615e9.24.2025.06.04.00.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 00:42:55 -0700 (PDT)
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
X-Inumbo-ID: 87b26c52-4117-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749022976; x=1749627776; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NqGl+7cdkaDAGvPWjnVxDSCo1PzGXC4U6uc/+bIOygA=;
        b=SjuWPe8uz3vX72OffrYcnKD8GZ6I29aQFkGb0Q5/6PFpiN+b7eosUhEVEYPy/iMxqO
         yIqPmC6lRhRxhmqhenvTKZolt2L8Pwe/EChsI8DW7vm1F4Z7RxemJbYndo2TtHXUoKxS
         Gupgf1vvC1aT7FLcpVLZ2qRHhUyByjXr2irBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749022976; x=1749627776;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NqGl+7cdkaDAGvPWjnVxDSCo1PzGXC4U6uc/+bIOygA=;
        b=X4P9Q79gPphJp2GoXsWNp1HQKHPdWYDfDnFra0XJjtbTN7cbbYhPmmBH3WUxdOl/bS
         ol/NUcLIwLBwY9QuAvbl6EUjtdvIC8pzE5uome13bLQLuj/H7StfkXd+DwDG04XOPYXk
         b7TkPFBFMtAzQyguVR+Z5nv8ECYOJ7C1i6iwkmT9N3ABdC6r904HbP1NRX+SPQLhIG0P
         gZ6hAjRSiNoIipMRH4C+b1Nu3y7DN4KA49j4Q37YLjs8qtNbxA6nQTJ/p8ywAwmtt/0b
         yA0rJXm7w7MN9XuD1xvVZpJ8tM6JPg1N9KeZUZOlA8JeNifJ3EcdIgiD+M1sytydn4aF
         gIeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJRX54VLalcP71cPEZ9+wHMZx3Gl/3p6+L6V6K5tbvH5TxQpQidQYhSE7vIHQym73FLcbijzsbvEk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpChoXnvurGwADQiwkZxYoHhIkAY0MsraquP8nQVlkIs+vkRV5
	7b+IWBh1Y/wb0bxCoh26JpmEnxOeKs2CakZnVos2J5dV8TLDRlK5ep5cWPyMezhCEIk=
X-Gm-Gg: ASbGnct0TFdgIdX8R+z6qXktVNVhOtL0c94AvioM4D+9r3oF//54TRBaad1kK+/+eN+
	+mQux3Ck9X32ytPTG1fEl/QsBrlgvYG2MLVaBSTHUrKA6pKIgrwtXCaBsGNgEEv2z340wnmVjuO
	RBqneqVENIJZLj+np4M52CR0TXg6byKpGS8eLAov2Ppnwe1frVHJ0IPtfE0MkXNrh/RaGloll6d
	5YmTQ+dFTB4Hq7LrasMNWq1zTSKglFsNK/fwr61FWVvJMHnuluqKDSueIluspV7JpjB/2pVEo2v
	sQGVJGcSBNezUPV9MATJoWWB+5JbZHbrHG9UNQCUuTPfjGmPlnBj2qvaBmF40DUkA1Oye1wZf2M
	ysOb/ihXGtKm4QggvEj8=
X-Google-Smtp-Source: AGHT+IE3Dm4ReIuQ+TmscDOwKNZm6QncTxYw+InMS4zDFhruvWCbbdwz5sL6LSWk9esh79Dt54Idbw==
X-Received: by 2002:a05:6000:26c1:b0:3a3:727d:10e8 with SMTP id ffacd0b85a97d-3a51d968010mr1153991f8f.50.1749022976031;
        Wed, 04 Jun 2025 00:42:56 -0700 (PDT)
Date: Wed, 4 Jun 2025 09:42:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/vpci: refuse to map BARs at position 0
Message-ID: <aD_4_iY5xb7CPn18@macbook.local>
References: <20250522140356.5653-1-roger.pau@citrix.com>
 <20250522140356.5653-3-roger.pau@citrix.com>
 <3f274948-92bb-40c4-bcaf-7b538300140a@suse.com>
 <aa1105d7-758d-416e-84e7-c7492f4bd177@amd.com>
 <aC9P1T4hCKbAdTVB@macbook.local>
 <198b21fd-ec37-4edd-9419-37bde034149f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <198b21fd-ec37-4edd-9419-37bde034149f@amd.com>

On Tue, Jun 03, 2025 at 04:47:55PM -0400, Stewart Hildebrand wrote:
> On 5/22/25 12:24, Roger Pau Monné wrote:
> > On Thu, May 22, 2025 at 11:44:24AM -0400, Stewart Hildebrand wrote:
> >> On 5/22/25 10:59, Jan Beulich wrote:
> >>> On 22.05.2025 16:03, Roger Pau Monne wrote:
> >>>> diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
> >>>> index 26bb7f6a3c3a..39fd5a16a4aa 100644
> >>>> --- a/xen/arch/x86/pci.c
> >>>> +++ b/xen/arch/x86/pci.c
> >>>> @@ -101,6 +101,15 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
> >>>>  
> >>>>  bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
> >>>>  {
> >>>> +    /*
> >>>> +     * Refuse to map BARs at position 0, those are not initialized.  This might
> >>>> +     * be required by Linux, that can reposition BARs with memory decoding
> >>>> +     * enabled.  By returning false here bar->enabled will be set to false, and
> >>>> +     * bar_write() will work as expected.
> >>>> +     */
> >>>> +    if ( mfn_eq(start, _mfn(0)) )
> >>>> +        return false;
> >>>
> >>> Is this really x86-specific?
> >>
> >> No, I think Arm would benefit from this check too. I'm in favor of
> >> moving the check to common.
> > 
> > I think on ARM pci_check_bar() is more strict, and doesn't really need
> > this check since it explicitly checks whether the BAR falls inside of
> > a bridge window.
> > 
> > So unless you have a bridge window at mfn 0 this won't make a
> > difference.  And if you have a bridge window at mfn 0 you really want
> > to be able to position BARs at address 0.
> > 
> > Thanks, Roger.
> 
> True, but I was thinking more generally: if a BAR is not initialized,
> don't map it. On Arm, it seems to be hit or miss whether BARs have been
> initialized or not. I guess the difficulty lies in whether comparing to
> zero is a reliable test to determine if the BAR is uninitialized.

Indeed.  I think on ARM it is better to check whether the BAR position
matches the bridge window, if it does not match then the BAR is not
initialized, which is what the current check already does?

On x86 this is more complex, since Xen doesn't track bridge windows,
hence the sub-optimal solution of checking against 0.  Also on x86
while not impossible I think it's extremely unlikely to have a bridge
window starting at 0, given all the legacy stuff that resides in the
low 1MB, and the fact that the AP trampoline must be in the low 1MB.

Thanks, Roger.

