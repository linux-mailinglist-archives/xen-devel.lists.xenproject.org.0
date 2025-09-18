Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A205B8668D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 20:24:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126411.1467986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzJIY-0000ZT-VT; Thu, 18 Sep 2025 18:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126411.1467986; Thu, 18 Sep 2025 18:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzJIY-0000Xj-SV; Thu, 18 Sep 2025 18:24:02 +0000
Received: by outflank-mailman (input) for mailman id 1126411;
 Thu, 18 Sep 2025 18:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j8y1=35=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1uzJIW-0000Xd-Ur
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 18:24:01 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a32decb5-94bc-11f0-9809-7dc792cee155;
 Thu, 18 Sep 2025 20:23:57 +0200 (CEST)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-CYFV9PqfN5aC21xg0NEZig-1; Thu, 18 Sep 2025 14:23:52 -0400
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-81678866c0cso220576685a.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Sep 2025 11:23:52 -0700 (PDT)
Received: from x1.local
 (bras-base-aurron9134w-grc-11-174-89-135-121.dsl.bell.ca. [174.89.135.121])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8363344e970sm204144985a.61.2025.09.18.11.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 11:23:50 -0700 (PDT)
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
X-Inumbo-ID: a32decb5-94bc-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758219835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lNsw5JLeKY9uVflrGldSh1MSaksI/KlXGOcdfAP4dVg=;
	b=UJOlndqJOFQlrNaz4YKnqu+Q7YMYNrBPKseq2SGSRGhTV4NPUDPn5TyQytIWaj3q8/Q/dG
	CaU6ug0i+qg2rlqBMD6Qyh1q3uabYp/enttrehC/fKbn0HAINFuJx8yJrcWQ2OHR+6o238
	k1fvMTtjhqHxP+7qNrf/8wnjQYeLSZI=
X-MC-Unique: CYFV9PqfN5aC21xg0NEZig-1
X-Mimecast-MFC-AGG-ID: CYFV9PqfN5aC21xg0NEZig_1758219832
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758219832; x=1758824632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNsw5JLeKY9uVflrGldSh1MSaksI/KlXGOcdfAP4dVg=;
        b=WOrOAdwTq+xTrEdwfStd3SqfRz2AeukqWYowCKFiBvz9G+Y1u5BVvYpDVlVJ/5Asl8
         QY9E0TEjldcGfqr1xABxDcOw5OZ7+ZEqEMPox2wFyjFfZYFnbeEa6p+dDKrxoZXZ2rpF
         Ra0QfdHT00Hmh27id30Jv92CJTQy9mgLyjv3b4hapFMMdBWV8YFJycG0AZoUHqb9ntkt
         IchIGXhvTTLhGSRh4blLQ/2IIvG/4rsvKKdOetmSfjygyKR8YmFFyFCOOjmIEM7Tm/5p
         73XfNjqVQifL+ceekswxScbnOA5KdlkxfoO+PW5qbEnFMElHF4qw8EJLBqSnekI1nf0O
         yZQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY5GZBC6cQv/alytxukxOSCHgFwL7/cPlE8ISba5SJ66gjmx/qENfADmXtQOp/Q5+MDecNDQZPIck=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGDuY9vWZhKQMTwqPudxylz8ek1AC0S9GG4aimgYaCEa2KVqJW
	urQqUbcACvA9L6qMY3fYCfidQmB0XvjxW5/D8+imTcU0zB5ZPmemHtxrx7jMmC8KhlSgLDUtBwC
	ndPzuIuQHvsGqSzEAhPwk+4mxROq7/RjLUVgBhi/ZPtkU2e7f4iMvs/KBcJkvXbF252Kd
X-Gm-Gg: ASbGnctyjrpQ6BbRauwdkhgVQ+WWiVtFHov158ovYWdlSmL+lK8bsRuZ6HctlilW7Gw
	c+uVn8tbHHQetb7w6lmT9/EBRIko6OAdVTkF5D3PRlj/cYAt68q2VwUlyJ6QJtfLxvEXY8Yae2F
	VQNLG0FZ17kejCrQ8pxgjEA261QIEAhwvY3Yn5ECdeos1nDEsZNL3z4hLmi2fIxuvB7xRqtWCAV
	t9lf4NV0p2E1h9gIdOhSSCqso4DOdmGuVYanRC617nodCBYDsCNU50AdBUQ6pOOGYI8wC4rGYio
	SiqV+Um9IGV16YGfftbFb0JWX5B14NRfTGUGWADD9wIye3z6dbhIzuv3soZm+cn/jxW3VVYSzcy
	g3hIPH/CkDmod8IkorHoUuA==
X-Received: by 2002:a05:620a:1a8c:b0:80d:a8d5:9857 with SMTP id af79cd13be357-83bab74d395mr64509485a.43.1758219831748;
        Thu, 18 Sep 2025 11:23:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUpTtF0CBpm8iaj0vzODs7Wm2HXXsF9gB4ig///X5jqMVyDsGMScgSe8thOnLAxmi8d11Yfg==
X-Received: by 2002:a05:620a:1a8c:b0:80d:a8d5:9857 with SMTP id af79cd13be357-83bab74d395mr64504285a.43.1758219831243;
        Thu, 18 Sep 2025 11:23:51 -0700 (PDT)
Date: Thu, 18 Sep 2025 14:23:47 -0400
From: Peter Xu <peterx@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org,
	Alex Williamson <alex.williamson@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Helge Deller <deller@gmx.de>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
	Klaus Jensen <its@irrelevant.dk>,
	Jesper Devantier <foss@defmacro.it>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org,
	John Levon <john.levon@nutanix.com>,
	Thanos Makatos <thanos.makatos@nutanix.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 0/7] Do not unparent in instance_finalize()
Message-ID: <aMxOM-XCamf2y8ke@x1.local>
References: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
 <aMwRSpezxmIwIHrU@x1.local>
 <f536fc18-73ab-676c-bdec-59e94a3e5408@eik.bme.hu>
 <aMwxYY9E3QghD10K@x1.local>
MIME-Version: 1.0
In-Reply-To: <aMwxYY9E3QghD10K@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: htwpcfRabXNpU05NIZKC441DLI9SpNnh4462It_tVWo_1758219832
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Sep 18, 2025 at 12:20:49PM -0400, Peter Xu wrote:
> On Thu, Sep 18, 2025 at 05:29:34PM +0200, BALATON Zoltan wrote:
> > On Thu, 18 Sep 2025, Peter Xu wrote:
> > > On Wed, Sep 17, 2025 at 07:13:25PM +0900, Akihiko Odaki wrote:
> > > > Based-on: <cover.1751493467.git.balaton@eik.bme.hu>
> > > > ("[PATCH v2 00/14] hw/pci-host/raven clean ups")
> > > 
> > > Could I ask why this is a dependency?
> > 
> > It removes an address_space usage from raven so this series does not have to
> > change that and I don't have to rebase that series. Otherwise these are not
> > related. I'll check the problem reported about my series and send an updated
> > one.
> 
> This series should be a split of a previous mixed up series that may
> contain address space changes while this one doesn't.  It also doesn't
> touch raven.c and ppc/.
> 
> Can I then understand it as the dependency is simply not needed?

I meant, it seems we don't need to wait for the other series to merge this
one, hence the there is no real dependency.

I didn't mean to drop that series for sure.. if it was confusing before..

Thanks,

-- 
Peter Xu


