Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19DD574C1E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 13:30:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367411.598689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBx3C-0002LA-EP; Thu, 14 Jul 2022 11:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367411.598689; Thu, 14 Jul 2022 11:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBx3C-0002J0-BU; Thu, 14 Jul 2022 11:30:34 +0000
Received: by outflank-mailman (input) for mailman id 367411;
 Thu, 14 Jul 2022 10:37:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J3x0=XT=redhat.com=pabeni@srs-se1.protection.inumbo.net>)
 id 1oBwE9-0000sT-KS
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 10:37:49 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 005b1819-0361-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 12:37:48 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-Feqbb9jJOOGBsmIhHqyL7w-1; Thu, 14 Jul 2022 06:37:45 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 a6-20020a05600c348600b003a2d72b7a15so2447015wmq.9
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jul 2022 03:37:45 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-97-238.dyn.eolo.it.
 [146.241.97.238]) by smtp.gmail.com with ESMTPSA id
 y18-20020a05600c365200b003a2c67aa6c0sm1744360wmq.23.2022.07.14.03.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 03:37:43 -0700 (PDT)
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
X-Inumbo-ID: 005b1819-0361-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657795066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4aMq9d6XOL2BYD5DztJ4VTiy/FnmnCeD5N5a+nINSVM=;
	b=TfOJe27aUqpExY64HMllRYd3rLsto1wK/MSUUQjm4GQcgX3V3uDyTu0YX47UKrb1DbxhZL
	4FAgHIi6+aA/gAuEmNxgIl7o8HLeOQYgr0RvVdfCoGeMLOqXmXntqFLvCFyK9mtj7DVDdT
	vatDJfLnezvkLRzgwsvcr16cjSouN4c=
X-MC-Unique: Feqbb9jJOOGBsmIhHqyL7w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4aMq9d6XOL2BYD5DztJ4VTiy/FnmnCeD5N5a+nINSVM=;
        b=h42oZ1mSS/tJVGE7IEzEg7PJ1IARyDVAdwyDpkhVsjXDNXAnDnw193zO3N+3iiPCO9
         /47fYZV8N3j4jX+0kCyKEb5LmHlcdMaXpc8IqMh0SwE+31v/kkkedFRVueCSTIrN47FI
         rf3TM8lVFZQbxcwLP/tENxEKYmfZYD1R3vvTgTQi4cSI2i+MC95aZNpW9sqcj5nOkLZU
         E044V3nPb6oCHXs7okAkaHnxEF0GGzelj2ZvW23fog88rY92WTFb4/375DBDqXfO1jTA
         VcSWd2V/y/h5JHmZPLZEKtxMDzVcVNFsDR2nCW62xdRTX3I6r5MUMpt8QJqK8kQd3Fq8
         090Q==
X-Gm-Message-State: AJIora+7LR2yTsIx/U36Tv1zIasIlSDv1aEtvnTAXtS6/u3bXaRkZknc
	iXkv6yAPOy7fGtqH2sWipNRXxar0PNdoGU5OfS+xwJBhKMT2pA0ul632xwAITyjVhIZ6b8oJgXl
	vd/oVzg1dZYfensYTNoVnth5IsnA=
X-Received: by 2002:a5d:5268:0:b0:21d:6c45:fe6 with SMTP id l8-20020a5d5268000000b0021d6c450fe6mr7908393wrc.380.1657795064437;
        Thu, 14 Jul 2022 03:37:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tnjBGgvWE3ovLJfa/IOyiITy8LVVfr+LAvxJzgOIn3iB+Jjr4weNUd9JZmrQbt3acfbGY+ng==
X-Received: by 2002:a5d:5268:0:b0:21d:6c45:fe6 with SMTP id l8-20020a5d5268000000b0021d6c450fe6mr7908378wrc.380.1657795064245;
        Thu, 14 Jul 2022 03:37:44 -0700 (PDT)
Message-ID: <9582eec95583412e51484092e13d7a773c338f34.camel@redhat.com>
Subject: Re: [PATCH net-next 2/2] xen-netfront: re-order error checks in
 xennet_get_responses()
From: Paolo Abeni <pabeni@redhat.com>
To: Jan Beulich <jbeulich@suse.com>, "netdev@vger.kernel.org"
	 <netdev@vger.kernel.org>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <stefano@stabellini.net>,  Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>
Date: Thu, 14 Jul 2022 12:37:42 +0200
In-Reply-To: <743b3ff3-896c-bfc9-e187-6d50da88f103@suse.com>
References: <7fca0e44-43b5-8448-3653-249d117dc084@suse.com>
	 <743b3ff3-896c-bfc9-e187-6d50da88f103@suse.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2022-07-13 at 11:19 +0200, Jan Beulich wrote:
> Check the retrieved grant reference first; there's no point trying to
> have xennet_move_rx_slot() move invalid data (and further defer
> recognition of the issue, likely making diagnosis yet more difficult).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I question the log message claiming a bad ID (which is how I read its
> wording): rx->id isn't involved in determining ref. I don't see what
> else to usefully log, though, yet making the message just "Bad rx
> response" also doesn't look very useful.

For the records, I (mis-)read that log message differently, claiming
there is a bad RX response, and specifying the ID of such response,
which may or may be not useful to diagnose where/when the problem
happens.

Cheers,

Paolo


