Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B1C4D8A2B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 17:53:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290344.492395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTnw1-00052X-2L; Mon, 14 Mar 2022 16:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290344.492395; Mon, 14 Mar 2022 16:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTnw0-0004zN-Ug; Mon, 14 Mar 2022 16:52:40 +0000
Received: by outflank-mailman (input) for mailman id 290344;
 Mon, 14 Mar 2022 16:52:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QtFe=TZ=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1nTnw0-0004zH-25
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 16:52:40 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2769e280-a3b7-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 17:52:38 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-N1xO-bcsMhWHXGmr0LX6PA-1; Mon, 14 Mar 2022 12:52:36 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E815801585;
 Mon, 14 Mar 2022 16:52:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D70AC50942;
 Mon, 14 Mar 2022 16:52:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 30A6821E66C8; Mon, 14 Mar 2022 17:52:32 +0100 (CET)
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
X-Inumbo-ID: 2769e280-a3b7-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647276757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hoVbdS414dD8S5HvfKlVfGNq0xYQ8aEfO5LCXtdVxms=;
	b=XG3499nnTatsMPDMTbFpCMpbjY6G1YBx3fWhZiqGJjID5p4RAhr4oXTc4kG9yTtNOwGtMK
	3HbiGiVANS4sFip//5DAS7mPICDz1EyJ3ZtLdAtJwqzGGXq6TLvrqIxequ5aEgcOaLJ0dt
	3IzzmQziLHa/oyRXAMD/iEQYw9I6DAg=
X-MC-Unique: N1xO-bcsMhWHXGmr0LX6PA-1
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,  Paolo
 Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Gerd Hoffmann <kraxel@redhat.com>,
  Christian Schoenebeck <qemu_oss@crudebyte.com>,  "Gonglei (Arei)"
 <arei.gonglei@huawei.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
  Igor Mammedov <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>,
  Laurent Vivier <lvivier@redhat.com>,  Amit Shah <amit@kernel.org>,
  Stefano Stabellini <sstabellini@kernel.org>,  Anthony Perard
 <anthony.perard@citrix.com>,  Paul Durrant <paul@xen.org>,  =?utf-8?Q?Her?=
 =?utf-8?Q?v=C3=A9?=
 Poussineau <hpoussin@reactos.org>,  Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>,  Corey Minyard <cminyard@mvista.com>,
  Patrick Venture <venture@google.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Peter Xu <peterx@redhat.com>,  Jason Wang <jasowang@redhat.com>,
  =?utf-8?Q?C=C3=A9dric?=
 Le Goater <clg@kaod.org>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  David Gibson <david@gibson.dropbear.id.au>,
  Greg Kurz <groug@kaod.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
  Jean-Christophe Dubois <jcd@tribudubois.net>,  Keith Busch
 <kbusch@kernel.org>,  Klaus Jensen <its@irrelevant.dk>,  Yuval Shaia
 <yuval.shaia.ml@gmail.com>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
  Magnus Damm <magnus.damm@gmail.com>,  Fabien Chouteau
 <chouteau@adacore.com>,  KONRAD Frederic <frederic.konrad@adacore.com>,
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  Artyom Tarasenko
 <atar4qemu@gmail.com>,  Alex Williamson <alex.williamson@redhat.com>,
  Eric Auger <eric.auger@redhat.com>,  Max Filippov <jcmvbkbc@gmail.com>,
  Juan Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Michael
 Roth <michael.roth@amd.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  David Hildenbrand <david@redhat.com>,  Wenchao
 Wang <wenchao.wang@intel.com>,  Kamil Rytarowski <kamil@netbsd.org>,
  Reinoud Zandijk <reinoud@netbsd.org>,  Sunil Muthuswamy
 <sunilmut@microsoft.com>,  Cornelia Huck <cohuck@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Eric Blake <eblake@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,  John Snow
 <jsnow@redhat.com>,  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  xen-devel@lists.xenproject.org,  qemu-ppc@nongnu.org,
  qemu-block@nongnu.org,  haxm-team@intel.com,  qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
References: <20220314160108.1440470-1-armbru@redhat.com>
	<20220314160108.1440470-4-armbru@redhat.com>
	<CAFEAcA8Tb7e+mJGaietc5si7_xZWxbTixcTSvNpB9wH_LQJ7kQ@mail.gmail.com>
Date: Mon, 14 Mar 2022 17:52:32 +0100
In-Reply-To: <CAFEAcA8Tb7e+mJGaietc5si7_xZWxbTixcTSvNpB9wH_LQJ7kQ@mail.gmail.com>
	(Peter Maydell's message of "Mon, 14 Mar 2022 16:08:15 +0000")
Message-ID: <87k0cwqxwv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 14 Mar 2022 at 16:01, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>> for two reasons.  One, it catches multiplication overflowing size_t.
>> Two, it returns T * rather than void *, which lets the compiler catch
>> more type errors.
>>
>> This commit only touches allocations with size arguments of the form
>> sizeof(T).
>>
>> Patch created mechanically with:
>>
>>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
>>              --macro-file scripts/cocci-macro-file.h FILES...
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
>>  104 files changed, 197 insertions(+), 202 deletions(-)
>
> I'm not going to say you must split this patch up. I'm just going to
> say that I personally am not looking at it, because it's too big
> for me to deal with.

As with all big but trivial Coccinelle patches, reviewing the Coccinelle
script and a reasonably representative sample of its output is almost
certainly a better use of reviewer time than attempting to get all the
patches reviewed.  They are mind-numbingly dull!

For what it's worth, we've used this script several times before.  Last
in commit bdd81addf4.


