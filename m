Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD812A7C83
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 12:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19711.45005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kad0D-0003tk-DQ; Thu, 05 Nov 2020 11:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19711.45005; Thu, 05 Nov 2020 11:00:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kad0D-0003tL-AD; Thu, 05 Nov 2020 11:00:25 +0000
Received: by outflank-mailman (input) for mailman id 19711;
 Thu, 05 Nov 2020 11:00:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj/r=EL=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kad0C-0003tF-96
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 11:00:24 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c0850875-fd4b-4733-a359-ea735ce08dd9;
 Thu, 05 Nov 2020 11:00:21 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-j8HSdQU9OQy-Ur9tqgDw7g-1; Thu, 05 Nov 2020 06:00:17 -0500
Received: by mail-wr1-f72.google.com with SMTP id w6so574645wrk.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 03:00:16 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id k18sm2066625wrx.96.2020.11.05.03.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 03:00:14 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gj/r=EL=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
	id 1kad0C-0003tF-96
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 11:00:24 +0000
X-Inumbo-ID: c0850875-fd4b-4733-a359-ea735ce08dd9
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id c0850875-fd4b-4733-a359-ea735ce08dd9;
	Thu, 05 Nov 2020 11:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604574021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X1UViqaY2dw2tJ/uiPRbcc3la6348uy0QyvJfmG6SVc=;
	b=JY49kP0ensAiR9pPkvJ55541OsCvgYqDnyBO/u3UaNaWRsMseBxRvnZC23CGTZqms/LBYI
	dTZHv1XoBQ6xXYzbbmFIm9gwl5ZLNmv/eC/RVG5l3XGXUnjs1AESGJA6RGsKbm5pGzCeJZ
	72vnqmCE+P7tBA8Wd1GmqMlSClCzMAY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-j8HSdQU9OQy-Ur9tqgDw7g-1; Thu, 05 Nov 2020 06:00:17 -0500
X-MC-Unique: j8HSdQU9OQy-Ur9tqgDw7g-1
Received: by mail-wr1-f72.google.com with SMTP id w6so574645wrk.1
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 03:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X1UViqaY2dw2tJ/uiPRbcc3la6348uy0QyvJfmG6SVc=;
        b=uUIg4liAOtHtF+RvP6nXFiBaaelKiP8k5SMDTbEgZirEQLW1rMbr1w7NkJDYewXhAq
         NIZzDUK3C023jiQQuYm/OcU49GDM8rneIwWIkL+iIby/loREhRg5GlM4uaUG63xBRn1U
         1+o3Azz+4K0lef7HY6uHbUwhfxMeL8KCsSVCAwC7Mx44aBz5sKEfYJKkvSBukJEt34BU
         HjJ0aWytdMCN/Dfdf9SYSWO7xbgqWVbiU1wvqnb3HFiwvh06/JgcaQXmPuO2pl+rbUgQ
         RVAJ56VsRvu+emnXJ54MkCWx8oj8TaSVHHLLNhECVqDOkB4WRUzvU2Hf4pjAkxNY1ac/
         mJIg==
X-Gm-Message-State: AOAM531KXd/DAwRT8GVgoMMwPnGfetM6UWBqc6vBt16VzmneUF83KMN5
	bVzyY2Li/MeBqN44p605bmIPWkyJEAkwj8Y3+iNWQ7d1E3BYXAVuzbTtHDBkdURmlPZW1NlBqgf
	bKgtKVHXH5g2okWDmuFDzhuo7D8o=
X-Received: by 2002:adf:cd0c:: with SMTP id w12mr2144968wrm.305.1604574015858;
        Thu, 05 Nov 2020 03:00:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybpmotyKASMAB+t7/PgRClyJnCN9SPeZuQ/cw9KvOuv0EQ8kS0mbpjFsUNU3T9k8SUs/TxWg==
X-Received: by 2002:adf:cd0c:: with SMTP id w12mr2144953wrm.305.1604574015658;
        Thu, 05 Nov 2020 03:00:15 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id k18sm2066625wrx.96.2020.11.05.03.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 03:00:14 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Fam Zheng <fam@euphon.net>, Richard Henderson <rth@twiddle.net>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20201103164604.2692357-1-philmd@redhat.com>
 <20201103164604.2692357-3-philmd@redhat.com>
 <20201103165247.GT205187@redhat.com>
 <7654e063-98d3-84e0-8116-5a1b41d14636@redhat.com>
 <21e90ddb-fe8a-c780-2741-9b7a2f7f1c9a@redhat.com>
 <alpine.DEB.2.21.2011031722100.3264@sstabellini-ThinkPad-T480s>
 <CABgObfaAH1fty0y0Z10GALnhy4kL_FqSxPZc2-=PwJgtSrOX0g@mail.gmail.com>
 <alpine.DEB.2.21.2011041742580.3264@sstabellini-ThinkPad-T480s>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH-for-5.2 2/3] gitlab-ci: Add a job to cover the
 --without-default-devices config
Message-ID: <462761e7-c466-bb61-1777-cf644c6ad615@redhat.com>
Date: Thu, 5 Nov 2020 12:00:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011041742580.3264@sstabellini-ThinkPad-T480s>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05/11/20 03:48, Stefano Stabellini wrote:
> I repeated all the steps to make sure. The first time I was using
> Samurai because Alpine Linux comes with it and not Ninja. Then, I
> removed Samurai and built and installed Ninja by hand from
> https://github.com/ninja-build/ninja and that actually works. Yesterday
> it was late and I was distracted by global events -- I must have failed
> to update Ninja appropriately. Sorry for the confusion.

FWIW I sent an Alpine merge request to support "ninja -t query".  We 
should add an Alpine container and pipeline once it's merged.

Paolo


