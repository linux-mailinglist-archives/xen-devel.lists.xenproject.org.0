Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D71C217899
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 22:11:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jstwO-0003AC-30; Tue, 07 Jul 2020 20:11:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gwtg=AS=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jstwL-0003A6-Rb
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 20:11:41 +0000
X-Inumbo-ID: 11f0c746-c08e-11ea-8dea-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 11f0c746-c08e-11ea-8dea-12813bfff9fa;
 Tue, 07 Jul 2020 20:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594152700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FA94CubuNsJD3dhRwMuG/cH+l9RtDN/Na7ZHN23jtV8=;
 b=MMAt3OnjEjJuRUNue7Ocn11rB53cy+ns0ldW28IZPhYmlI95n22CyT0sZ+dP0/15v6sr0D
 u1k0ySvklAd7K5txdn1GylKlZvNKSx1e3Xdj8Sg/gpYxPyGMqk2gwLNN6NfU53uGsk6fn1
 xDohjD5HLNb9KeXQhr2aMNvT13oNlL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-lsdgI-V3MtukxB0PW3T76A-1; Tue, 07 Jul 2020 16:11:39 -0400
X-MC-Unique: lsdgI-V3MtukxB0PW3T76A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D941107ACCA;
 Tue,  7 Jul 2020 20:11:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7A1073FEA;
 Tue,  7 Jul 2020 20:11:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3451A1132FD2; Tue,  7 Jul 2020 22:11:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v12 2/8] scripts: Coccinelle script to use
 ERRP_AUTO_PROPAGATE()
References: <20200707165037.1026246-1-armbru@redhat.com>
 <20200707165037.1026246-3-armbru@redhat.com>
 <764387d7-0d42-a291-d720-60df303c15e4@redhat.com>
Date: Tue, 07 Jul 2020 22:11:28 +0200
In-Reply-To: <764387d7-0d42-a291-d720-60df303c15e4@redhat.com> (Eric Blake's
 message of "Tue, 7 Jul 2020 14:36:02 -0500")
Message-ID: <87y2nv5bm7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, groug@kaod.org,
 Stefano Stabellini <sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Eric Blake <eblake@redhat.com> writes:

> On 7/7/20 11:50 AM, Markus Armbruster wrote:
>> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
>> Script adds ERRP_AUTO_PROPAGATE macro invocation where appropriate and
>> does corresponding changes in code (look for details in
>> include/qapi/error.h)
>>
>> Usage example:
>> spatch --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
>>   --macro-file scripts/cocci-macro-file.h --in-place --no-show-diff \
>>   --max-width 80 FILES...
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   scripts/coccinelle/auto-propagated-errp.cocci | 337 ++++++++++++++++++
>>   include/qapi/error.h                          |   3 +
>>   MAINTAINERS                                   |   1 +
>>   3 files changed, 341 insertions(+)
>>   create mode 100644 scripts/coccinelle/auto-propagated-errp.cocci
>
> Needs a tweak if we go with ERRP_GUARD.  But that's easy.
>
>> +
>> +// Convert special case with goto separately.
>> +// I tried merging this into the following rule the obvious way, but
>> +// it made Coccinelle hang on block.c
>> +//
>> +// Note interesting thing: if we don't do it here, and try to fixup
>> +// "out: }" things later after all transformations (the rule will be
>> +// the same, just without error_propagate() call), coccinelle fails to
>> +// match this "out: }".
>
> "out: }" is not valid C; would referring to "out: ; }" fare any better?

We can try for the next batch.

>> +@ disable optional_qualifier@
>> +identifier rule1.fn, rule1.local_err, out;
>> +symbol errp;
>> +@@
>> +
>> + fn(..., Error ** ____, ...)
>> + {
>> +     <...
>> +-    goto out;
>> ++    return;
>> +     ...>
>> +- out:
>> +-    error_propagate(errp, local_err);
>> + }
>> +
>> +// Convert most of local_err related stuff.
>> +//
>> +// Note, that we inherit rule1.fn and rule1.local_err names, not
>> +// objects themselves. We may match something not related to the
>> +// pattern matched by rule1. For example, local_err may be defined with
>> +// the same name in different blocks inside one function, and in one
>> +// block follow the propagation pattern and in other block doesn't.
>> +//
>> +// Note also that errp-cleaning functions
>> +//   error_free_errp
>> +//   error_report_errp
>> +//   error_reportf_errp
>> +//   warn_report_errp
>> +//   warn_reportf_errp
>> +// are not yet implemented. They must call corresponding Error* -
>> +// freeing function and then set *errp to NULL, to avoid further
>> +// propagation to original errp (consider ERRP_AUTO_PROPAGATE in use).
>> +// For example, error_free_errp may look like this:
>> +//
>> +//    void error_free_errp(Error **errp)
>> +//    {
>> +//        error_free(*errp);
>> +//        *errp = NULL;
>> +//    }
>
> I guess we can still decide later if we want these additional
> functions, or if they will even help after the number of places we
> have already improved after applying this script as-is and with
> Markus' cleanups in place.

Yes.

> While I won't call myself a Coccinelle expert, it at least looks sane
> enough that I'm comfortable if you add:
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


