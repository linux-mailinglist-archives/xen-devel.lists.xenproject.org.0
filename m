Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB7E4DCAA1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 17:00:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291663.495192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUsYA-0006eb-5x; Thu, 17 Mar 2022 16:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291663.495192; Thu, 17 Mar 2022 16:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUsYA-0006cb-2u; Thu, 17 Mar 2022 16:00:30 +0000
Received: by outflank-mailman (input) for mailman id 291663;
 Thu, 17 Mar 2022 16:00:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gtxi=T4=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nUsY8-0006cV-Ny
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 16:00:28 +0000
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [2607:f8b0:4864:20::d29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ca3d799-a60b-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 17:00:27 +0100 (CET)
Received: by mail-io1-xd29.google.com with SMTP id e22so6349112ioe.11
 for <xen-devel@lists.xenproject.org>; Thu, 17 Mar 2022 09:00:27 -0700 (PDT)
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
X-Inumbo-ID: 5ca3d799-a60b-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=//OKJWG2XaERkrAXfntBbbaDnGwUSRW2XahGtEOy4N4=;
        b=O3tZebmCxjyIMClJvQgZQLpM5gT7QoWmf4BfCY+p4geVgKDk6g+OV78MflZwokCiqO
         8qsZTcMkpCb9YjuZ19p7zU4hOzcZcc1eAgpZ9B36yLtQxZDpzR1dmb7PabGgw9Gi3mNs
         hrL5lKbPfFrtkM88/Dpfnsof5s9YlPJ/JyfzkOm0gzcZz5pQP3RXPH23+VbRWRY45ewG
         zX6HH1mGIfIri1h7UTglusH9kJrvqruTNx50OmlhnUs1/kvRSdDYhZYItFefayuwivaG
         YYxKr1RmTxBsT/w+cAZvX+eu3u1XX/VRcw2Fw9na1NdfiHaW7IrasuG/YbiRe1CpXbmH
         c2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=//OKJWG2XaERkrAXfntBbbaDnGwUSRW2XahGtEOy4N4=;
        b=Dy2SIZO3T8XZJfCf+OviADa7g2ihbWyF0EG6Hs8axPRhtLsslOXiZcOMw9vROH0IWG
         ++R+NDncNjlVLzkZ7SsPC0GKI1cLP322ioogXfOehr07HgC/y737pswuOWaE75yLJ0NQ
         UP4tJBTzzk58+o4qK4MfgLwgPhDvp1jT+LPtyYyF2U63Wc113er4IjfryS4extWkCral
         DrwViia8hhE14ed8kWFvWVXQd8J/RRvs7x6dLjhD0xSyOJ5ZPzQzbtD+HFPxkjh5KakR
         ACutLdnD1QQByhD0CkdHJ1xER6TAqXMYe4NPY3O4fD1lH4iZHUh12Oi+TUt281To0hW/
         dYAw==
X-Gm-Message-State: AOAM531fP5eYSd81Wxv/5QhcGaaTUEU/17q8we9AcZ5+v+UCX+AOa8H5
	T61mCYPqVmkKPAqJkOie+6xT6MoEyyb8h1Gz6+o=
X-Google-Smtp-Source: ABdhPJwz0jn/5KjBXCuaHrqaEAX4qVnwPtRHmxdYtaXJxyjbD0CWUKnqjDiECwFyeCz6/m9DsVxy9LxFzAVPKK+R1ZQ=
X-Received: by 2002:a05:6638:2402:b0:317:b520:62ba with SMTP id
 z2-20020a056638240200b00317b52062bamr2425687jat.238.1647532826572; Thu, 17
 Mar 2022 09:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <05d0a5b5c18d667a5527e6f834347f54a10309da.1646937728.git.tamas.lengyel@intel.com>
 <28f869eb-c6f0-cc67-8d29-9751447d2ad3@suse.com> <CABfawhnsbqBOuTyB-C4sY23GY-4-AXd38TXqVMemVt_duwSZiQ@mail.gmail.com>
 <3dc898e4-b00b-2e85-eda9-a28da6737ab5@suse.com>
In-Reply-To: <3dc898e4-b00b-2e85-eda9-a28da6737ab5@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 17 Mar 2022 11:59:50 -0400
Message-ID: <CABfawh=FgBcLYgFr+4R7795bqKfeYyr5MF09__zDEpfk6hcmHg@mail.gmail.com>
Subject: Re: [PATCH] x86/hvm: Include interruptibility state in hvm_hw_cpu
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 11:06 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 17.03.2022 15:43, Tamas K Lengyel wrote:
> > On Thu, Mar 17, 2022 at 9:56 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 10.03.2022 19:44, Tamas K Lengyel wrote:
> >>> @@ -1155,6 +1154,8 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
> >>>      v->arch.dr6   = ctxt.dr6;
> >>>      v->arch.dr7   = ctxt.dr7;
> >>>
> >>> +    hvm_set_interrupt_shadow(v, ctxt.interruptibility_info);
> >>
> >> Setting reserved bits as well as certain combinations of bits will
> >> cause VM entry to fail. I think it would be nice to report this as
> >> an error here rather than waiting for the VM entry failure.
> >
> > Not sure if this would be the right spot to do that since that's all
> > VMX specific and this is the common hvm code.
>
> Well, it would be the VMX hook to do the checking, with an error
> propagated back here.

I'm actually against it because the overhead of that error-checking
during vm forking would be significant with really no benefit. We are
copying the state from the parent where it was running fine before, so
doing that sanity checking thousands of times per second when we
already know its fine is bad.

Tamas

