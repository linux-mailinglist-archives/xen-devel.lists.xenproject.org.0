Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443E04D203C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 19:27:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287387.487407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nReXq-0000fg-18; Tue, 08 Mar 2022 18:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287387.487407; Tue, 08 Mar 2022 18:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nReXp-0000cq-UE; Tue, 08 Mar 2022 18:26:49 +0000
Received: by outflank-mailman (input) for mailman id 287387;
 Tue, 08 Mar 2022 18:26:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xpw2=TT=gmail.com=this.is.a0lson@srs-se1.protection.inumbo.net>)
 id 1nReR3-0006RJ-TD
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 18:19:50 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56c711b4-9f0c-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 19:19:49 +0100 (CET)
Received: by mail-qk1-x731.google.com with SMTP id r127so4559190qke.13
 for <xen-devel@lists.xenproject.org>; Tue, 08 Mar 2022 10:19:49 -0800 (PST)
Received: from development (c-73-166-253-254.hsd1.tx.comcast.net.
 [73.166.253.254]) by smtp.gmail.com with ESMTPSA id
 h10-20020a05620a10aa00b0067b117eba82sm4230550qkk.124.2022.03.08.10.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 10:19:47 -0800 (PST)
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
X-Inumbo-ID: 56c711b4-9f0c-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=s7HWQFOc18zq/O7uEQF7Z6moCg95Ml6WM+p6yiwaXqI=;
        b=oXJlqkI44MmKT9aHPPUfT9lAlZHQm3zuiGzX9kslGzvFMW+JlCcIld+l+aFtR9RpG+
         Ui8vVuV6+eSNmKq0JK0CpXO1bzrw27iUuNIzoVxsg3rkty6DXSRoI9J83un55jryfU4/
         kaMsopQ6eUkD3NHtezf4iwYgx5VRvO+W7vUVX/HZglH1037ZqgUx/EUwhGbpdKkHu+XP
         QWC3w+Wpd7euyvmqrpzoidYcm8mxaPXtmviBSMR07V7WwTtwXYdUs9k3Ms8IjbCqpYwY
         /441weuUU5xxgPD9N1f6ojwfWAE4z22dJAG4zbDXYgyfl+LMFI5mH6Vqbk1ega+kBJ00
         Au0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=s7HWQFOc18zq/O7uEQF7Z6moCg95Ml6WM+p6yiwaXqI=;
        b=cT+YUiu5FRgfKct61MWl6E4N4E0WxZQzVcyNmmAnkTb8/ieQPICIKj0Hua3ARSN6Nc
         xgzChhNwM5Vbb9bwLZMUhzQS07UpUAwzTK/8GkcpwCrFmxUVRo0Ra1Gp9u0lv5d3TBqN
         JE4IxyHZFzDrCIsASeN2zny7J01crldG7tC0yUgNZeesneKoipRPLKu4MEK8NggghPFq
         V4cbzdE3gvmocASwn+rRLac6Gbd321I8YvbSRWIyg/0tvw1brU2xY8+2GM5lNufMj94x
         T0WyudS4KZpPzyeOQwCvbYAufDDLUxhOq/ypeHUVvVC381SQDk7GdlyGhS1OHfLnlZ4B
         +ixQ==
X-Gm-Message-State: AOAM530IvFL+ANmS5G94GHdWVdaBgVuTEOJIJfQ26EpSU1C6p37GqbaI
	AQxDlhqHTscbQhx9JrtNczE=
X-Google-Smtp-Source: ABdhPJx9CNVZdKgczTol7V2Gw+3miaU4v2NUbgnX5BRGOqBiI3vNJBvzN+9qSZnusTu+Q7460VvwSA==
X-Received: by 2002:a05:620a:1426:b0:67b:467e:a626 with SMTP id k6-20020a05620a142600b0067b467ea626mr5300879qkj.261.1646763588133;
        Tue, 08 Mar 2022 10:19:48 -0800 (PST)
Message-ID: <5460431ac2cba237f95dfef8890381767d2242ae.camel@gmail.com>
Subject: Re: [PATCH v4] vpci/msix: fix PBA accesses
From: Alex Olson <this.is.a0lson@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Date: Tue, 08 Mar 2022 12:19:46 -0600
In-Reply-To: <fbc1388e-8211-f498-b134-4df5b1ccd003@suse.com>
References: <20220307163744.74030-1-roger.pau@citrix.com>
	 <fbc1388e-8211-f498-b134-4df5b1ccd003@suse.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2022-03-08 at 09:31 +0100, Jan Beulich wrote:
> On 07.03.2022 17:37, Roger Pau Monne wrote:
> > Map the PBA in order to access it from the MSI-X read and write
> > handlers. Note that previously the handlers would pass the physical
> > host address into the {read,write}{l,q} handlers, which is wrong as
> > those expect a linear address.
> > 
> > Map the PBA using ioremap when the first access is performed. Note
> > that 32bit arches might want to abstract the call to ioremap into a
> > vPCI arch handler, so they can use a fixmap range to map the PBA.
> > 
> > Reported-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> > Cc: Alex Olson <this.is.a0lson@gmail.com>
> 
> I'll wait a little with committing, in the hope for Alex to re-provide
> a Tested-by.

It works fine for me, you can add "Tested-by: Alex.Olson@starlab.io" to the
commit.

> 
> > --- a/xen/drivers/vpci/msix.c
> > +++ b/xen/drivers/vpci/msix.c
> > @@ -182,6 +182,38 @@ static struct vpci_msix_entry *get_entry(struct
> > vpci_msix *msix,
> >      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
> >  }
> >  
> > +static void __iomem *get_pba(struct vpci *vpci)
> > +{
> > +    struct vpci_msix *msix = vpci->msix;
> > +    /*
> > +     * PBA will only be unmapped when the device is deassigned, so access
> > it
> > +     * without holding the vpci lock.
> > +     */
> > +    void __iomem *pba = read_atomic(&msix->pba);
> > +
> > +    if ( likely(pba) )
> > +        return pba;
> > +
> > +    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
> > +                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
> > +    if ( !pba )
> > +        return read_atomic(&msix->pba);
> > +
> > +    spin_lock(&vpci->lock);
> > +    if ( !msix->pba )
> > +    {
> > +        write_atomic(&msix->pba, pba);
> > +        spin_unlock(&vpci->lock);
> > +    }
> > +    else
> > +    {
> > +        spin_unlock(&vpci->lock);
> > +        iounmap(pba);
> > +    }
> 
> TBH I had been hoping for just a single spin_unlock(), but you're
> the maintainer of this code ...
> 
> Jan
> 
Thanks

-Alex


