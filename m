Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC094D9CF6
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 15:03:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290809.493307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU7lb-0007Je-UK; Tue, 15 Mar 2022 14:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290809.493307; Tue, 15 Mar 2022 14:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU7lb-0007Gw-QW; Tue, 15 Mar 2022 14:03:15 +0000
Received: by outflank-mailman (input) for mailman id 290809;
 Tue, 15 Mar 2022 14:03:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1u5x=T2=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1nU7la-0007GI-H2
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 14:03:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a715c491-a468-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 15:03:13 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-LExbIUHVMB2k-e1e--Crmg-1; Tue, 15 Mar 2022 10:03:10 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7419380390A;
 Tue, 15 Mar 2022 14:03:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CC1AC53741;
 Tue, 15 Mar 2022 14:03:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 32B4B21E6821; Tue, 15 Mar 2022 15:03:02 +0100 (CET)
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
X-Inumbo-ID: a715c491-a468-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647352992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MKik6AtmKkZjLoAeTfrbKw62PODykM0Fa40qjwa00Cw=;
	b=ZrZAqGVau8Sxjhc1470Ore8CqkcIMd+pDFtNFQrHlYA42vbX1e7hHa8W7U2QUY7hPrtHZH
	p8VOrwdl4jo398nH1DmNDop5BScXTBFMPBnxmIfxolAmQyPAixvwYsBHAtxWgS3CNsu14r
	U582pLsrl2QE/sa2sxl76NEESQgtWWs=
X-MC-Unique: LExbIUHVMB2k-e1e--Crmg-1
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Christian Schoenebeck <qemu_oss@crudebyte.com>,
  "Gonglei (Arei)" <arei.gonglei@huawei.com>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
  Igor Mammedov <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>,
  Laurent Vivier <lvivier@redhat.com>,  Amit Shah <amit@kernel.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Anthony Perard <anthony.perard@citrix.com>,
  Paul Durrant <paul@xen.org>,  =?utf-8?Q?Herv=C3=A9?= Poussineau
 <hpoussin@reactos.org>,
  Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,  Corey Minyard
 <cminyard@mvista.com>,  Patrick Venture <venture@google.com>,  Eduardo
 Habkost <eduardo@habkost.net>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Peter Xu <peterx@redhat.com>,  Jason Wang
 <jasowang@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
  Daniel Henrique
 Barboza <danielhb413@gmail.com>,  David Gibson
 <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Jean-Christophe Dubois
 <jcd@tribudubois.net>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Yuval Shaia <yuval.shaia.ml@gmail.com>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Magnus Damm <magnus.damm@gmail.com>,
  Fabien Chouteau <chouteau@adacore.com>,  KONRAD Frederic
 <frederic.konrad@adacore.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Artyom Tarasenko <atar4qemu@gmail.com>,
  Alex Williamson <alex.williamson@redhat.com>,  Eric Auger
 <eric.auger@redhat.com>,  Max Filippov <jcmvbkbc@gmail.com>,  Juan
 Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Michael
 Roth <michael.roth@amd.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  David Hildenbrand <david@redhat.com>,  Wenchao
 Wang <wenchao.wang@intel.com>,  Colin Xu <colin.xu@intel.com>,  Kamil
 Rytarowski <kamil@netbsd.org>,  Reinoud Zandijk <reinoud@netbsd.org>,
  Sunil Muthuswamy <sunilmut@microsoft.com>,  Cornelia Huck
 <cohuck@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,  John Snow
 <jsnow@redhat.com>,  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  xen-devel@lists.xenproject.org,  qemu-ppc@nongnu.org,
  qemu-block@nongnu.org,  haxm-team@intel.com,  qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
References: <20220314160108.1440470-1-armbru@redhat.com>
	<20220314160108.1440470-4-armbru@redhat.com>
	<20220315090748.acju5mjbe4tax272@redhat.com>
Date: Tue, 15 Mar 2022 15:03:02 +0100
In-Reply-To: <20220315090748.acju5mjbe4tax272@redhat.com> (Eric Blake's
	message of "Tue, 15 Mar 2022 04:07:48 -0500")
Message-ID: <87zglrjotl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Eric Blake <eblake@redhat.com> writes:

> On Mon, Mar 14, 2022 at 05:01:08PM +0100, Markus Armbruster wrote:
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
>> 	     --macro-file scripts/cocci-macro-file.h FILES...
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
> I agree that this is mechanical, but...
>
> <snip>
>>  qga/commands-win32.c                     |  8 ++---
>>  qga/commands.c                           |  2 +-
>>  qom/qom-qmp-cmds.c                       |  2 +-
>>  replay/replay-char.c                     |  4 +--
>>  replay/replay-events.c                   | 10 +++---
>>  scripts/coverity-scan/model.c            |  2 +-
>
> ...are we sure we want to touch this particular file?

Good catch!

>> diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
>> index 9d4fba53d9..30bea672e1 100644
>> --- a/scripts/coverity-scan/model.c
>> +++ b/scripts/coverity-scan/model.c
>> @@ -356,7 +356,7 @@ int g_poll (GPollFD *fds, unsigned nfds, int timeout)
>>  typedef struct _GIOChannel GIOChannel;
>>  GIOChannel *g_io_channel_unix_new(int fd)
>>  {
>> -    GIOChannel *c = g_malloc0(sizeof(GIOChannel));
>> +    GIOChannel *c = g_new0(GIOChannel, 1);
>>      __coverity_escape__(fd);
>>      return c;
>>  }
>
> Our model has a definition of g_malloc0(), but I'm not sure whether
> Coverity picks up the macro g_new0() in the same manner.

I believe it does, by parsing the macro definition from the header.

Regardless, I'd prefer to keep model.c self-contained.  I'll drop this
hunk.

Thanks!


