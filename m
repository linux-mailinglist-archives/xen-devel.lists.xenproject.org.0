Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9784D8AF2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 18:40:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290390.492448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTofg-0003Oo-Ln; Mon, 14 Mar 2022 17:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290390.492448; Mon, 14 Mar 2022 17:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTofg-0003Mz-If; Mon, 14 Mar 2022 17:39:52 +0000
Received: by outflank-mailman (input) for mailman id 290390;
 Mon, 14 Mar 2022 17:39:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hER8=TZ=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1nToff-0003Mt-GN
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 17:39:51 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf180a91-a3bd-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 18:39:50 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-5i1UFKH3MraiAoloP0STSQ-1; Mon, 14 Mar 2022 13:39:47 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CE36180139E;
 Mon, 14 Mar 2022 17:39:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D155F140EBFE;
 Mon, 14 Mar 2022 17:39:32 +0000 (UTC)
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
X-Inumbo-ID: bf180a91-a3bd-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647279589;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=FuV+LXYAzCN8GlqarfyjrOMJEbdlSdj/IkmrSiaMB84=;
	b=El1/ONl2inauvOAIAvIeGtqHlhujr6thnWgq4rqNVIhQ/xPECvvhCYjnt0x++mzPqKXKbq
	Ovg13P+U0zEtL1nURITgDKHjdaTpB6puPUlOb1grUspKzz9oN7Z+acVf7LtSQL2Oz5YTQ2
	2ojURgn+LjNdOkd86+8fHnb8/SmOlBk=
X-MC-Unique: 5i1UFKH3MraiAoloP0STSQ-1
Date: Mon, 14 Mar 2022 17:39:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
	Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Corey Minyard <cminyard@mvista.com>,
	Patrick Venture <venture@google.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Wenchao Wang <wenchao.wang@intel.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	John Snow <jsnow@redhat.com>, kvm@vger.kernel.org,
	qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org, qemu-block@nongnu.org, haxm-team@intel.com,
	qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
Message-ID: <Yi990ucCF/ZWeDbU@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com>
 <CAFEAcA8Tb7e+mJGaietc5si7_xZWxbTixcTSvNpB9wH_LQJ7kQ@mail.gmail.com>
 <87k0cwqxwv.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87k0cwqxwv.fsf@pond.sub.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7

On Mon, Mar 14, 2022 at 05:52:32PM +0100, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On Mon, 14 Mar 2022 at 16:01, Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> >> for two reasons.  One, it catches multiplication overflowing size_t.
> >> Two, it returns T * rather than void *, which lets the compiler catch
> >> more type errors.
> >>
> >> This commit only touches allocations with size arguments of the form
> >> sizeof(T).
> >>
> >> Patch created mechanically with:
> >>
> >>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> >>              --macro-file scripts/cocci-macro-file.h FILES...
> >>
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >
> >>  104 files changed, 197 insertions(+), 202 deletions(-)
> >
> > I'm not going to say you must split this patch up. I'm just going to
> > say that I personally am not looking at it, because it's too big
> > for me to deal with.
> 
> As with all big but trivial Coccinelle patches, reviewing the Coccinelle
> script and a reasonably representative sample of its output is almost
> certainly a better use of reviewer time than attempting to get all the
> patches reviewed.  They are mind-numbingly dull!
> 
> For what it's worth, we've used this script several times before.  Last
> in commit bdd81addf4.

This Coccinelle is simple enough to understand, that I'd suggest that
once we merge the Coccinelle script itself, then for ongoing usage,
its output can be considered effectively pre-reviewed.

The reviewer can just re-run the Coccinelle script themselves to prove
it has the same output as the submitter claims, to validate no manual
changes are hidden in the middle of the automated patch.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


