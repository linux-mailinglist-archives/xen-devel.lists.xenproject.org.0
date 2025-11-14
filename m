Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727A4C5C33B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 10:17:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162350.1490026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJpvd-0003lh-BC; Fri, 14 Nov 2025 09:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162350.1490026; Fri, 14 Nov 2025 09:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJpvd-0003jB-8P; Fri, 14 Nov 2025 09:17:13 +0000
Received: by outflank-mailman (input) for mailman id 1162350;
 Fri, 14 Nov 2025 09:17:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=op6D=5W=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vJpvb-0003j4-0L
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 09:17:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1e98ab2-c13a-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 10:17:09 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-484-5Jb_QW3SMpOSOeJQrTTggg-1; Fri,
 14 Nov 2025 04:17:03 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 181C21956094; Fri, 14 Nov 2025 09:17:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2EA611955F1B; Fri, 14 Nov 2025 09:17:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 647BC21E6A27; Fri, 14 Nov 2025 10:16:58 +0100 (CET)
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
X-Inumbo-ID: b1e98ab2-c13a-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763111828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=0k9gE9OBnyE+OiyzVseSUkJqX807Y3xb0ASD5xFtiRg=;
	b=BMGcg9eJxE5WtJQppJ7/XpXEhcxThJgBjFGNxamWBbYEOQKget66iAsf7U1mfBpL8ST0Gw
	xrj906r59uAjCB8SO/5MEpFwQk/O48RDIE0muwm4B23tsYX/Z2I3cDFPJeLxYnF8dNZk3h
	XD6K/h1eK0+TXDARHiS9N8HjmYxtyf4=
X-MC-Unique: 5Jb_QW3SMpOSOeJQrTTggg-1
X-Mimecast-MFC-AGG-ID: 5Jb_QW3SMpOSOeJQrTTggg_1763111822
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, xen-devel@lists.xenproject.org, Vikram Garhwal
 <vikram.garhwal@amd.com>
Subject: Incorrect error handling in xen_enable_tpm()
Date: Fri, 14 Nov 2025 10:16:58 +0100
Message-ID: <87jyzt0y9h.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Consider xen_enable_tpm() in hw/xen/xen-pvh-common.c:

    static void xen_enable_tpm(XenPVHMachineState *s)
    {
        Error *errp = NULL;

Nitpick: confusing name; we use @errp for Error ** variables, not for
Error * variables.  Better: @err.

        DeviceState *dev;
        SysBusDevice *busdev;

        TPMBackend *be = qemu_find_tpm_be("tpm0");
        if (be == NULL) {
            error_report("Couldn't find tmp0 backend");
            return;
        }
        dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
        object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);

If this fails, @errp changes to non-null.

        object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);

If this then succeeds, @errp remains non-null.  Since we ignore it, we
leak the Error object.

If it also fails, we trip error_setv()'s assertion, because we violate
qapi/error.h rule

 * - You may pass NULL to not receive the error, &error_abort to abort
 *   on error, &error_fatal to exit(1) on error, or a pointer to a
 *   variable containing NULL to receive the error.

Taking a step back from the incorrect error handling: we're setting the
same property *twice*.  Why?

As far as I can tell, property "tpmdev" is not a link.  It's defined
with DEFINE_PROP_TPMBE(), i.e. setting it runs set_tpm() from
backends/tpm/tpm_util.c.  Passes the value to qemu_find_tpm_be(), which
appears to take a TPMBackend ID.

I suspect the object_property_set_link() always fails, and we leak the
Error object.

I'd verify this in a debugger, but I don't have a Xen box handy.

Code goes back to commit 733766cd373 (hw/arm: introduce xenpvh machine).

        busdev = SYS_BUS_DEVICE(dev);
        sysbus_realize_and_unref(busdev, &error_fatal);
        sysbus_mmio_map(busdev, 0, s->cfg.tpm.base);

        trace_xen_enable_tpm(s->cfg.tpm.base);
    }


