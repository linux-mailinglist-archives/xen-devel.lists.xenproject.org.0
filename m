Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BAC1CA8DC
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 12:59:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX0iC-0002Dn-PS; Fri, 08 May 2020 10:58:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lkD8=6W=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1jX0iA-0002Di-L9
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 10:58:34 +0000
X-Inumbo-ID: dc3a9053-911a-11ea-9fde-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id dc3a9053-911a-11ea-9fde-12813bfff9fa;
 Fri, 08 May 2020 10:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588935513;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyCZiIMXk1Y28WNZr1AkdRRZAp+HQiTOsMdv91zL4Pg=;
 b=QQUbzO+JSdcsqbIaOv1SvSM/3F0mcMFySX5iuq5vOO1ij3aSYiBZkTYyyxlezd3gshmEIv
 3nQZc5JQrtMAdH00wUh4HclE3j7YC4sYzF+aEuDVlBhBAO7DP0kSB3tMQGsI/Ct1SQ1aTD
 ODG6VmNC+2CTLdcif4XGpRYtcRyG2Ps=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-xhbTINf7PuWx1-meMsQw0g-1; Fri, 08 May 2020 06:58:29 -0400
X-MC-Unique: xhbTINf7PuWx1-meMsQw0g-1
Received: by mail-wr1-f69.google.com with SMTP id d1so698010wru.6
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2020 03:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cyCZiIMXk1Y28WNZr1AkdRRZAp+HQiTOsMdv91zL4Pg=;
 b=I2M23CMEW8TaDKB8kXnEFzZPiGote1KDyK/cyKc88K7OYy6uL0tjRmeqUjEd2BPUSx
 ahO5xu5yuPgplt6YhqWanyNcR4aJhYyrBA4SrsG5Tn0ppGcYqGlpufkq/4YdhY1m3wWY
 DteN9kkNCkbdiTgMWUVShvT0Smv/XMGvP9xDms5LepYPoMYBT8RoYSy0H1XY8oYAiPb+
 CF+E0NrWCMpv+1LoaBR72VTvD1k7d1GQfvQl+V9yFWAk336knNR7DuxJzecamlViNKnX
 7gxOcvJZ5xstXWTAuvaYYQC8GNSw7GF2MNL3oBbnI4CrEn4uNHtV1s/KCZERapBGKSpC
 7z3Q==
X-Gm-Message-State: AGi0PuawHNyYWTGEBRSoloaX+OpET5ti4KBaM50/uUzKSclxB7bcxhhb
 /MVPb5OyXoseddUXyrGOdr7hIOW3ud0dJlCTgrnhP9eOPMk3mjunj0MmlQw9E0nuNNktjpL0h7g
 l7dpYUtygpz3nX0M5Ehhe/Hy0FMc=
X-Received: by 2002:a05:600c:24cf:: with SMTP id
 15mr14926199wmu.94.1588935508552; 
 Fri, 08 May 2020 03:58:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypL77NI34TbDDfERPCrxkNpOhsGcev4KtdXrtLP6r59dCngh8fw4wlAQoNf/ixkyz3h4JhDTQA==
X-Received: by 2002:a05:600c:24cf:: with SMTP id
 15mr14926177wmu.94.1588935508281; 
 Fri, 08 May 2020 03:58:28 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id r11sm1265076wrv.14.2020.05.08.03.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 03:58:27 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3] accel: Move Xen accelerator code under accel/xen/
In-Reply-To: <20200508100222.7112-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 8 May 2020 12:02:22
 +0200")
References: <20200508100222.7112-1-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Fri, 08 May 2020 12:58:26 +0200
Message-ID: <87368ad771.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> This code is not related to hardware emulation.
> Move it under accel/ with the other hypervisors.
>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


