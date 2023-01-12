Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D76687B9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 00:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476429.738598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG6cA-0005BL-1o; Thu, 12 Jan 2023 23:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476429.738598; Thu, 12 Jan 2023 23:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG6c9-00058g-UZ; Thu, 12 Jan 2023 23:04:05 +0000
Received: by outflank-mailman (input) for mailman id 476429;
 Thu, 12 Jan 2023 23:04:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qUmi=5J=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pG6c8-00058Y-TQ
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 23:04:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 675469a2-92cd-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 00:04:02 +0100 (CET)
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-wsG88cUzO5Oio2CBEv4omw-1; Thu, 12 Jan 2023 18:03:43 -0500
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-4c57d19de6fso183191337b3.20
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jan 2023 15:03:43 -0800 (PST)
Received: from redhat.com ([185.199.103.82]) by smtp.gmail.com with ESMTPSA id
 d7-20020a67c107000000b003cea834049dsm1901988vsj.29.2023.01.12.15.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 15:03:41 -0800 (PST)
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
X-Inumbo-ID: 675469a2-92cd-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673564641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qXbpa0euBExBaTO/Ebm60JXaGA3mQo8UBGk1nDl0J48=;
	b=W8IkQLb1Bz7lPbZe1L7G4LAGXN4PHVZWYQQCOUxSEerNhm8RnOkupTn8T16msFbiHVCGNc
	xYbLlZGJDDzlNUBwwEM3W728ZtjT88lzeeN5sOtMv1UIb6Ao3qo7ZZz7RTFSqhvm7kNw5u
	wu3vV5spJkr5loqv+SxjNs1Dn8apfmw=
X-MC-Unique: wsG88cUzO5Oio2CBEv4omw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXbpa0euBExBaTO/Ebm60JXaGA3mQo8UBGk1nDl0J48=;
        b=6g+8o2XkqpMABxfuHRDWCd9OZriLXWb6pQKjP0qIiEwUzQ5J94oyq7gt4C5gD3qJAO
         bnR1uAS+jUgNCphQHjW0TuyAB1eEFn9OG1P75cUec0kdQd3P1IcxdgYYEgno9ri2Vsu/
         ZQwfzkK1Nho319e+3KQ2bm8wrm3mF37zroKcdF50Z6Pmv3dUhgq6XUPU/gJwM4+z57xy
         ik7v7U5Mouzqi67KavUiEz24AUjdlFiE2T0MzDgNfbxeNkPIS0LpE6ug/16JO1W3KxFe
         zHWKMkEMqKa53B5Kicr/l1fGCUOK/LTfAx6Q59GZGZxt/fW07kIsroqZsKjUWPKWupvs
         WkJw==
X-Gm-Message-State: AFqh2kqvUsI0r8E6W0vodpehb5FTX8qWp0xILhSgwR/u5/jxx1bSsP7f
	apEvw+KC3+QrWUz5+P+CcyJqvtwJ/tuowN2AEvU67eB+I7e/m8V6Wstr+HZK3rgqRQzPFyeaEzW
	GfY1FGiIKxEP0ikyhsFdZiRihi6Q=
X-Received: by 2002:a25:3485:0:b0:7b2:2c34:7bfa with SMTP id b127-20020a253485000000b007b22c347bfamr30601131yba.13.1673564622821;
        Thu, 12 Jan 2023 15:03:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXve5xvOCSmtbGUXXlUsTJO6xAn094jfDpk6/0I1/Sq4yrg4uvAhGWuFoy1TISz3ntSn2UKEsg==
X-Received: by 2002:a25:3485:0:b0:7b2:2c34:7bfa with SMTP id b127-20020a253485000000b007b22c347bfamr30601107yba.13.1673564622570;
        Thu, 12 Jan 2023 15:03:42 -0800 (PST)
Date: Thu, 12 Jan 2023 18:03:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230112180314-mutt-send-email-mst@kernel.org>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>
 <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
 <20230110030331-mutt-send-email-mst@kernel.org>
 <a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
 <D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com>
 <9f63e7a6-e434-64b4-f082-7f5a0ab8d5bf@aol.com>
 <7208A064-2A25-4DBB-BF19-6797E96AB00C@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7208A064-2A25-4DBB-BF19-6797E96AB00C@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wrote:
> I think the change Michael suggests is very minimalistic: Move the if
> condition around xen_igd_reserve_slot() into the function itself and
> always call it there unconditionally -- basically turning three lines
> into one. Since xen_igd_reserve_slot() seems very problem specific,
> Michael further suggests to rename it to something more general. All
> in all no big changes required.

yes, exactly.

-- 
MST


