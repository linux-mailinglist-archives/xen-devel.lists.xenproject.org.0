Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1780A19FB2F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 19:17:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLVN6-0007fO-LP; Mon, 06 Apr 2020 17:17:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t1eN=5W=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jLVN5-0007fC-6v
 for xen-devel@lists.xen.org; Mon, 06 Apr 2020 17:17:15 +0000
X-Inumbo-ID: 751441f6-782a-11ea-9e09-bc764e2007e4
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 751441f6-782a-11ea-9e09-bc764e2007e4;
 Mon, 06 Apr 2020 17:17:14 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k1so406132wrm.3
 for <xen-devel@lists.xen.org>; Mon, 06 Apr 2020 10:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+OPct1KjAk/W161QAuAlNNDHiF+Nzw97Vme4IELTBuY=;
 b=o50vP1igvMSUBQMBAI4BWO4cYHpBsdOT/Og4hXof4QhvwTzec27TrARs97W68yC9Vu
 cJ6twbYJzm9vpQu5CsvnsGjoBS8KjKSTer4sXUVm+WEDgJfeQIxaeEIBIY/PO46YafDx
 aDEYehdPM2gs9Pi/YRB9gTsZbjozvADjqYVw7GAp73nVsEGmTkiN9JLk7QyJHRRsVUlw
 U2ZdHuRaC8w/gIl85OTBPGEKekJkU20bIbVbjzvyS9oCG4Y+XW7FiJQV9sRc/q53pQ4Y
 N71bDXoOMR4Nb+QyJyWYAhtjSUXvGpSzrq2NLIgishnRAwHgAos0W1ZGkhpwzGe3Zfvr
 qraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+OPct1KjAk/W161QAuAlNNDHiF+Nzw97Vme4IELTBuY=;
 b=OK/v9DfiSv3vxwvgvIZLkitoUKoZqfHT6Wtbwj21wGysLw9ifTOv+TRYCtiT0uyp41
 w9nrgyeM4CqMEHKBwG7l5F1HpQADYq6wLaT9qgBaf3TSWg+sPDpQBR7taFnJYUiW1WvC
 APHVIWeqiIxqJadube5/sz7onuU1prXFgqLtTaIh9hdnEWNxSZ33ddGIicwG4ZOuMKWT
 FSXuzPbe8I6CbRLk+tygNNmlDw+gemBN6b1VGoq7rgJt8DNEW9eBS5daTUr44Sf+4NfO
 cjNbH4Gilz5jAJ+LlV9IDW3t8j0xQRF0QIJh1FpGB2WQiGhakM9w3HblWLtLPKzw11JP
 drxQ==
X-Gm-Message-State: AGi0PuaeMJvaRD8XLjRenHueYHX/8zXTAB3PV1ANYSZH55UAys0MG27+
 bc6MP6UdKgrMETxW9Hl6WddUEDPZBLt0W6zCGxw=
X-Google-Smtp-Source: APiQypKwPzHgkZj6LDS8jxtDhjQ+kuOWpthELdhABhYX1QzMnN2Pfjo6rXfY/79DEnGxUKpGW2pp9j4xv9unmejenuk=
X-Received: by 2002:adf:eac1:: with SMTP id o1mr261145wrn.182.1586193433261;
 Mon, 06 Apr 2020 10:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <CABB6KG-UCdPTa3yM57JB13G=Yebe8chuQKvKkNbtoGRSZ9Ypsw@mail.gmail.com>
 <a8c56ab0-bc51-fa1c-c63f-cb9ada8a1823@citrix.com>
In-Reply-To: <a8c56ab0-bc51-fa1c-c63f-cb9ada8a1823@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 6 Apr 2020 11:16:36 -0600
Message-ID: <CABfawhn_hw=o5j+G9VfqPK6opytqt=q2-cz4GjNgCTA5zBvNrA@mail.gmail.com>
Subject: Re: Live migration and PV device handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xen.org>,
 Anastassios Nanos <anastassios.nanos@sunlight.io>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 3, 2020 at 6:44 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 03/04/2020 13:32, Anastassios Nanos wrote:
> > Hi all,
> >
> > I am trying to understand how live-migration happens in xen. I am
> > looking in the HVM guest case and I have dug into the relevant parts
> > of the toolstack and the hypervisor regarding memory, vCPU context
> > etc.
> >
> > In particular, I am interested in how PV device migration happens. I
> > assume that the guest is not aware of any suspend/resume operations
> > being done
>
> Sadly, this assumption is not correct.  HVM guests with PV drivers
> currently have to be aware in exactly the same way as PV guests.
>
> Work is in progress to try and address this.  See
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=775a02452ddf3a6889690de90b1a94eb29c3c732
> (sorry - for some reason that doc isn't being rendered properly in
> https://xenbits.xen.org/docs/ )

That proposal is very interesting - first time it came across my radar
- but I dislike the idea that domain IDs need to be preserved for
uncooperative migration to work. Ideally I would be able to take
advantage of the same plumbing to perform forking of VMs with PV
drivers where preserving the domain id is impossible since its still
in use.

Tamas

