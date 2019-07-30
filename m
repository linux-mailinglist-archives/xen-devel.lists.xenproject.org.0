Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4AF7B103
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:59:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsWMU-00027C-K7; Tue, 30 Jul 2019 17:56:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M4Jx=V3=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hsWMS-00026x-N0
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:56:32 +0000
X-Inumbo-ID: 5ce4c3e8-b2f3-11e9-8980-bc764e045a96
Received: from mail-qk1-x72c.google.com (unknown [2607:f8b0:4864:20::72c])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5ce4c3e8-b2f3-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 17:56:31 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id t8so47248930qkt.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2019 10:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dOzaRbdF/PFkjzjPUxSG6QTppv4k44PDfLqF7CnmFnU=;
 b=fuZweog+jJo++01b2jGV2/aZnZsc+xo8Ll988vEkKeff0sMu2B1Qyo07br2JAsWtGP
 AumPmC8yHEZir7fAiVtO17KFJcqoqa/S20i9j6wjJmC7YJXbS7CxVwA7/xr6Kg/kfvQV
 ceZ0G5I8MROGB0PWKzT9PgqhDIq3uzryvFg+PfgDdM4j6U7wFfgp6wZ05iEX3bVru2Y/
 c9a3d7nACOe/ID+592eVY9ab0GNN2fbpnzm5mIEEzMl/o3oQs4sFVVvhNt8dPBvaOFjp
 D2KlpJ2Mo0qALfi9Fng6PFpM8PffyZSHACZbL0gMLX4q6FIDvfxWCuJX7lBn8+dR3jf7
 5hhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dOzaRbdF/PFkjzjPUxSG6QTppv4k44PDfLqF7CnmFnU=;
 b=LxaQuEHqFdwqQgYS9ug67DvzInzPBgxSUx3OkCea3Ig8Ix28PFCMwo8p/hFjECbyCd
 Hr0fXd7KntYAmVosj8ulB2t4nSg+/bywn9QB0Z2hhl0ggbjjhQH8daxVB2m/Zl0UfDX+
 ckkDlyHwWmIAw/cVvmcw7BFM/13W6FrwKsuRgFj6ZVwj8GdMhtyEzOXwbNIwzLEZmECM
 n5KgCcxTxrvxAdE9jmr6QHWGKbw6T19Ddy/WfevA5LSs5vH4//ZufzPqT8hn+/WOXNeN
 2rLhotuL/LLjoTdnOiFKs1XEey0HeENEb9fgJ6y4VWCIYWiji/gy6GuKbI49CKe6Ligm
 f8jw==
X-Gm-Message-State: APjAAAX+GSj81i/D5r/PTWv9ONeWARwmGdXwny2KJvuTzxDKIhUuO6eq
 EjMazIsczkkrsNt1R+Idu4QrKsX/8wSpfeEn66TnsQ==
X-Google-Smtp-Source: APXvYqxflLJ5lUQQAOOk38OJl+18p5Sg3fC+9E59x/TqHltFbkkCyv0dYVqrVxFCQn0KuyJ1SbNl8oY6u7zSjYCVFkw=
X-Received: by 2002:a37:a7d2:: with SMTP id
 q201mr49794262qke.403.1564509391365; 
 Tue, 30 Jul 2019 10:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <20190722114859.dtm4w5ff75uedu24@Air-de-Roger>
 <9238bf1a297c42f38dccc1cfb50bd144@AMSPEX02CL03.citrite.net>
 <20190722134813.c7fedaqtrbo6ojvo@Air-de-Roger>
 <81a7cdc728294e5ca05fd056a87cb21b@AMSPEX02CL03.citrite.net>
 <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
 <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
 <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <f2d4b51f-b2b1-abad-8040-ad5de26f5b5b@citrix.com>
 <CAMmSBy909uERFmH9=pMqpZkr=Bb7-TVMZiFRarvzV57+=QcK8w@mail.gmail.com>
 <bf7515bb-3c4c-59e1-557a-d3f0106c5609@citrix.com>
 <CAMmSBy_Jh_NHTn_VYkNL8FxcnfMkpiq94E+XqNK9wJWm7tH0pw@mail.gmail.com>
 <81416abc-e5f5-76de-a34a-87412e125e64@citrix.com>
 <CAMmSBy8kJbt8wdJ2u+nO+FXphtNrdikOeKtMJ6tu45hDv8OeQQ@mail.gmail.com>
 <4646f3e8-6291-7d98-2550-8ab207ac675e@suse.com>
In-Reply-To: <4646f3e8-6291-7d98-2550-8ab207ac675e@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 30 Jul 2019 10:56:20 -0700
Message-ID: <CAMmSBy9LTN8LjLGyfTO9g80OdP4ew0ZHj1GGFfAkt5oAKEHPKA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: Juergen Gross <JGross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTowNiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjMuMDcuMjAxOSAyMDoyNSwgUm9tYW4gU2hhcG9zaG5payB3
cm90ZToKPiA+IEludGVyZXN0aW5nbHkgZW5vdWdoLCBhZGRpbmcgaW9tbXVfaW5jbHVzaXZlX21h
cHBpbmc9MSBBTkQgaW9tbXU9ZGVidWcKPiA+IGJvb3RlZCB0aGUgc3lzdGVtIGp1c3QgZmluZS4K
Pgo+IEJ0dyAoSSd2ZSBub3RpY2VkIHRoaXMgb25seSBub3cpIC0gYXJlIHlvdSBzYXlpbmcgd2l0
aG91dCAiaW9tbXU9ZGVidWciCj4gdGhlIGJveCBkb2VzIF9ub3RfIGJvb3QgZmluZSwgZGVzcGl0
ZSB0aGUgb3RoZXIgb3B0aW9uPwoKWWVzLiBCdXQgaXQgbWFkZSBzZW5zZSB0byBtZSBzaW5jZSBp
b21tdT1kZWJ1ZyAoYXMgcGVyIHlvdXIKZXhwbGFuYXRpb24pIG92ZXJ3aGVsbXMgdGhlIENQVSBh
bmQgSSBndWVzcyBhZGRpbmcKaW9tbXVfaW5jbHVzaXZlX21hcHBpbmc9MSBhdm9pZHMgdGhlIGNv
ZGUgcGF0aCB0aGF0IGRvZXMgaXQ/CgpUaGFua3MsClJvbWFuLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
