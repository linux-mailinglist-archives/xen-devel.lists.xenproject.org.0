Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60974F5032
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 04:19:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299435.510127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbvGM-0006Ym-VM; Wed, 06 Apr 2022 02:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299435.510127; Wed, 06 Apr 2022 02:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbvGM-0006Wo-Qn; Wed, 06 Apr 2022 02:19:14 +0000
Received: by outflank-mailman (input) for mailman id 299435;
 Wed, 06 Apr 2022 02:19:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSLC=UQ=gmail.com=linmq006@srs-se1.protection.inumbo.net>)
 id 1nbvGL-0006Wi-6i
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 02:19:13 +0000
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [2607:f8b0:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2198a43-b54f-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 04:19:12 +0200 (CEST)
Received: by mail-pg1-x52f.google.com with SMTP id 66so965949pga.12
 for <xen-devel@lists.xenproject.org>; Tue, 05 Apr 2022 19:19:12 -0700 (PDT)
Received: from 8345e2a12d0c ([159.226.95.43]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00229000b004fabe756ba6sm18627715pfe.54.2022.04.05.19.19.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 05 Apr 2022 19:19:10 -0700 (PDT)
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
X-Inumbo-ID: f2198a43-b54f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XgjMEhLjRT4MPAMhsdcS0Ym9ucVGsbeQUnv8qRyOX2I=;
        b=GG33N9hgu+eD/ebEhy3Uqtw42T1KOy4AZNx8zMiQ8RNnMqDR3MrKJ0yJbDK9/zahZX
         XtmX82g9WyruU473qtdYCzzuJtiRU5bvSltOqdS8XpnjIMfFtqtndkOjetDeT6d5nICG
         ArTrqu2AeWHeYKaQse/8jm14/6N+2jzKs9HxS/F2IvH4VALeAE+SZsPvFjFWefv/ScOF
         ayWSL1CW+OxpZgkOU3exCbNpR1e+35NzKgm/gbzNwD10kDdU8yuS+TO6hIXiw7MLqE54
         kPh636J/zKiCfcJsVnKkcLXxcasLEiRxsOcCxgZ7jiYVfAOpTmBtoCYkwg2cNjdc/9fT
         mN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XgjMEhLjRT4MPAMhsdcS0Ym9ucVGsbeQUnv8qRyOX2I=;
        b=3ONFY0mpXZQ/s27JJSaw+895q0oFsU8qS1VBoL6HmEh3lIDj9mpZbS+O2cExK+X6qY
         LahwSxOcQEviBirsU5MNcRbY0b8uY8P0PSVBbJhOjT0JJJqSbftvUqD6b9FDJuGQ2V2T
         0TFZuuZenWk0Pcp3zO+lXW4GYDzT1qZEYO6cWGi77bwUAn8zn9DkNGe8ggwMtk4BRR64
         l6L9FVA6+uFscvPnK7PDG0IFOZdPwD+beJVlcjaK/oYC+42b2ErCexI9R6UE5hU90G+I
         PZVK/kEn6oXyAhQXYDxVteFNMRCCUCGFnPM395JkrW8SctiKgEkSp8GwD1qCPS3hwDzO
         FqkA==
X-Gm-Message-State: AOAM532RKkXLbCDlWwBvrv7OwxFi2YBn1RBfIODhuyr73uXU7j3lXgIf
	rK7194kHlp2lbSO0MMml74Y=
X-Google-Smtp-Source: ABdhPJy0fFKiZnX55XY/d/G2Ja2u/Qng8hE6zvoqwunWU73cDOoodFxoYjkYZp4ZogLD3xT/xr2xew==
X-Received: by 2002:a63:d454:0:b0:386:86:6aaa with SMTP id i20-20020a63d454000000b0038600866aaamr5248075pgj.60.1649211550460;
        Tue, 05 Apr 2022 19:19:10 -0700 (PDT)
Date: Wed, 6 Apr 2022 02:19:05 +0000
From: Miaoqian Lin <linmq006@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm/xen: Fix refcount leak in xen_dt_guest_init
Message-ID: <20220406021905.GA30436@8345e2a12d0c>
References: <20220309102442.14726-1-linmq006@gmail.com>
 <alpine.DEB.2.22.394.2203111756000.3497@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2203111756000.3497@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/1.9.4 (2018-02-28)

Hi,

On Fri, Mar 11, 2022 at 06:01:11PM -0800, Stefano Stabellini wrote:
> On Wed, 9 Mar 2022, Miaoqian Lin wrote:
> > The of_find_compatible_node() function returns a node pointer with
> > refcount incremented, We should use of_node_put() on it when done
> > Add the missing of_node_put() to release the refcount.
> > 
> > Fixes: 9b08aaa3199a ("ARM: XEN: Move xen_early_init() before efi_init()")
> > Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> 
> Thanks for the patch!
> 
> 
> > ---
> >  arch/arm/xen/enlighten.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> > index ec5b082f3de6..262f45f686b6 100644
> > --- a/arch/arm/xen/enlighten.c
> > +++ b/arch/arm/xen/enlighten.c
> > @@ -424,6 +424,7 @@ static void __init xen_dt_guest_init(void)
> >  
> >  	if (of_address_to_resource(xen_node, GRANT_TABLE_INDEX, &res)) {
> >  		pr_err("Xen grant table region is not found\n");
> > +		of_node_put(xen_node);
> >  		return;
> >  	}
> 
> This is adding a call to of_node_put on the error path. Shouldn't it
> be called also in the non-error path?

You're right. It should be called also in the non-error path.
I made a mistake.

> Also, there is another instance of of_address_to_resource being called
> in this file (in arch_xen_unpopulated_init), does it make sense to call
> of_node_put there too?

I think so, becase device node pointer np is a local variable.
So the reference it taken should be released in the scope.

I look into the whole codebase for this kind of usage pattern
($ret=of_find_compatible_node();of_address_to_resource($ret,_,_), 
$ret is a local variable), Most of them call of_node_put() when done. 
And document of of_find_compatible_node() also mentions
> Return: A node pointer with refcount incremented, use
> of_node_put() on it when done.

But I am not sure, Since I am unfamiliar with other code logic.
It better if the developers could double check. I found some 
similar cases in arch/arm. 

