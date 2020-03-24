Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739EB190AEC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 11:28:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGglg-0002NP-Kq; Tue, 24 Mar 2020 10:26:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7Zuv=5J=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jGglf-0002NJ-Cb
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 10:26:43 +0000
X-Inumbo-ID: f4435d2a-6db9-11ea-b34e-bc764e2007e4
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4435d2a-6db9-11ea-b34e-bc764e2007e4;
 Tue, 24 Mar 2020 10:26:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u10so341068wro.7
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2020 03:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=bo3AxSKhmBh5wvsBBq0L/URyl9eO4j/GrbkhPkrwGdQ=;
 b=qDiq5j/rV/dCOvqApxTg+qQxq5nkDmZns/PwMrL9G5qZvMFCJbjJZ9xkjUVqc3bRsI
 Or11Xc+N29Y4ShJF69VSM2TsVXOxC3vLSpq8tRBZT5joJ+9/5c+Bro+um5RydGteoVB2
 EMGnhCcO0+ljp8gnc0nngITxSduAxkt+2fmH8rCk7te4lhyudBG6UyGvQHKXRy/HZY6v
 jvEH5Cly2b64xTbAqN1+M4nWVgzGBNrLVcOLYnUbzMtMjTS0DMVQ5fRUVeERQNhYwjqZ
 qkL1pJj8ecrbVpLiSmX3Yvo7svGs6MxJ8PxlmsAclVUGx1hUrGKelEPGCp5EzkCRZDjf
 bzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=bo3AxSKhmBh5wvsBBq0L/URyl9eO4j/GrbkhPkrwGdQ=;
 b=KWSyOilSr9OQgWjxGCrx372DqKSXisIsUpTuKpBiKPhKARUJ+4m3iya41FlyXdltrR
 YzUvOV9yhPs/f4GUFtGemoBHwQUP2L5klJz2Mnw/e1jDf0+lL0kKo60U4D/eRugAI7hL
 leCIZ4DbtaR2c4YzlBsYFS5Ny/s/Yu3oNznoMH4vCKSJb9iBoLWVGXtdZA/pH5A44EJK
 lWbV7K8aZ3nDUBaaeyP5XL9XtiSt6Yt0nZzTgpfGiS2fC+HBBTvg5JvvA9Lv/jQHWMlR
 Fdvx4UP58oVQEkwDqZ9KhS82GLu47IvZkv8qvEDBp4NTpYmughmqb/4MZ8V0YeJIjH9t
 HAIQ==
X-Gm-Message-State: ANhLgQ38MtsUl5P19HGH878Lg6asvNMnISEhR0ugW+hnIXqI8BWXunEQ
 FLNKv+qUyce3xhrRljuFIfA=
X-Google-Smtp-Source: ADFU+vucOnQ1+N30W2JII6u7SBjm/WMvbItpn8sxUGqPnHe1SWSUf2+90NgHjsjhYjHVvo87vutMdg==
X-Received: by 2002:a5d:5687:: with SMTP id f7mr14136717wrv.425.1585045601869; 
 Tue, 24 Mar 2020 03:26:41 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id o16sm28936590wrs.44.2020.03.24.03.26.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Mar 2020 03:26:41 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200318173243.29183-1-paul@xen.org>
 <945a52df-777b-9756-edf4-d0ab3474d231@suse.com>
In-Reply-To: <945a52df-777b-9756-edf4-d0ab3474d231@suse.com>
Date: Tue, 24 Mar 2020 10:26:39 -0000
Message-ID: <008401d601c6$b56f9730$204ec590$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJlTs0dhQvM1i5FZ5AeDRaq5MSczgG98d3tpyr/VRA=
Subject: Re: [Xen-devel] [PATCH v4 0/3] make sure PGC_extra pages are dealt
 with properly
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 xen-devel@lists.xenproject.org,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 24 March 2020 09:39
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Andrew Cooper =
<andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; =
Julien Grall <julien@xen.org>;
> Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Stefano
> Stabellini <sstabellini@kernel.org>; Tim Deegan <tim@xen.org>; Wei Liu =
<wl@xen.org>
> Subject: Re: [PATCH v4 0/3] make sure PGC_extra pages are dealt with =
properly
>=20
> On 18.03.2020 18:32, Paul Durrant wrote:
> > This series was formerly called "remove one more shared xenheap =
page:
> > shared_info" but I have dropped the patches actually changing =
shared_info
> > and just left the PGC_extra clean-up that was previously =
intertwined.
> >
> > Paul Durrant (3):
> >   mm: keep PGC_extra pages on a separate list
> >   x86 / ioreq: use a MEMF_no_refcount allocation for server pages...
> >   mm: add 'is_special_page' inline function...
>=20
> So I'm confused - I had just replied twice to v6 patch 5/5. This
> series calls itself v4 and consists of the middle three patches
> of what v6 was. What's the deal? Is this really v7, and the two
> patches have been dropped / postponed?

Sorry, I clearly got confused with numbering against one of my other =
series. Yes, this should be v7.

I wanted to send the patches that clear up use of PGC_extra, separating =
from the change to shared_info since I'm pressed for time to complete =
all the other conversions from xenheap pages such that I can send them =
as a single series.

  Paul

>=20
> Jan


