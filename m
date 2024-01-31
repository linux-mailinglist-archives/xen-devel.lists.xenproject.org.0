Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E628442DC
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 16:19:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674073.1048753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVCMR-0002c0-Is; Wed, 31 Jan 2024 15:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674073.1048753; Wed, 31 Jan 2024 15:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVCMR-0002Yo-El; Wed, 31 Jan 2024 15:18:47 +0000
Received: by outflank-mailman (input) for mailman id 674073;
 Wed, 31 Jan 2024 15:18:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oSjc=JJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rVCMQ-0002Yi-84
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 15:18:46 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 061e7cb4-c04c-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 16:18:45 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 673F022020;
 Wed, 31 Jan 2024 15:18:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2637E1347F;
 Wed, 31 Jan 2024 15:18:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ASmJB9RkumV7IAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 31 Jan 2024 15:18:44 +0000
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
X-Inumbo-ID: 061e7cb4-c04c-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706714324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=da7q3omMJZdg7zQAbipKjTn0BkqeSkCKqBqcjkiOk0Y=;
	b=XMiOIyawMxg1uzYHEkP3LN2WgdXQImhzTh0mv+cwSvIoSt+Z8Zg2Flooc0Ho/RGVY0kPRD
	qxzEOb0NFwSC4/p1sxuSvgwXMUw4O7idGnM2tZNTJxHBIDTIgAdb54jyDkG6JBiaKGGTTu
	9PQlls4rNvjkoqdLtLW8vlgKZz0fHUs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706714324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=da7q3omMJZdg7zQAbipKjTn0BkqeSkCKqBqcjkiOk0Y=;
	b=XMiOIyawMxg1uzYHEkP3LN2WgdXQImhzTh0mv+cwSvIoSt+Z8Zg2Flooc0Ho/RGVY0kPRD
	qxzEOb0NFwSC4/p1sxuSvgwXMUw4O7idGnM2tZNTJxHBIDTIgAdb54jyDkG6JBiaKGGTTu
	9PQlls4rNvjkoqdLtLW8vlgKZz0fHUs=
Message-ID: <b44e2775-c396-428f-91d2-427691509a37@suse.com>
Date: Wed, 31 Jan 2024 16:18:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/33] tools/libs/light: add backend type for 9pfs PV
 devices
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-17-jgross@suse.com>
 <2a2f50d3-f065-4b03-b75d-401a40fcb6fd@perard>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <2a2f50d3-f065-4b03-b75d-401a40fcb6fd@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.70
X-Spamd-Result: default: False [-3.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 BAYES_HAM(-3.00)[100.00%];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.59)[subject];
	 FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,gmail.com,xen.org];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 12.01.24 17:55, Anthony PERARD wrote:
> On Thu, Jan 04, 2024 at 10:00:38AM +0100, Juergen Gross wrote:
>> diff --git a/tools/libs/light/libxl_9pfs.c b/tools/libs/light/libxl_9pfs.c
>> index 5ab0d3aa21..486bc4326e 100644
>> --- a/tools/libs/light/libxl_9pfs.c
>> +++ b/tools/libs/light/libxl_9pfs.c
>> @@ -33,20 +33,159 @@ static int libxl__set_xenstore_p9(libxl__gc *gc, uint32_t domid,
>>   
>>       flexarray_append_pair(front, "tag", p9->tag);
>>   
>> +    if (p9->type == LIBXL_P9_TYPE_XEN_9PFSD) {
>> +        flexarray_append_pair(back, "max-space",
>> +                              GCSPRINTF("%u", p9->max_space));
>> +        flexarray_append_pair(back, "max-files",
>> +                              GCSPRINTF("%u", p9->max_files));
>> +        flexarray_append_pair(back, "max-open-files",
>> +                              GCSPRINTF("%u", p9->max_open_files));
>> +        flexarray_append_pair(back, "auto-delete",
>> +                              p9->auto_delete ? "1" : "0");
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int libxl__device_from_p9(libxl__gc *gc, uint32_t domid,
>> +                                 libxl_device_p9 *type, libxl__device *device)
>> +{
>> +    device->backend_devid   = type->devid;
>> +    device->backend_domid   = type->backend_domid;
>> +    device->backend_kind    = type->type == LIBXL_P9_TYPE_QEMU
>> +                              ? LIBXL__DEVICE_KIND_9PFS
>> +                              : LIBXL__DEVICE_KIND_XEN_9PFS;
>> +    device->devid           = type->devid;
>> +    device->domid           = domid;
>> +    device->kind            = LIBXL__DEVICE_KIND_9PFS;
>> +
>>       return 0;
>>   }
>>   
>> -#define libxl__add_p9s NULL
>> +static int libxl_device_p9_dm_needed(void *e, unsigned domid)
> 
> Prefix of the function should be "libxl__" as it's only internal to
> libxl.

Okay.

> 
>> +{
>> +    libxl_device_p9 *elem = e;
>> +
>> +    return elem->type == LIBXL_P9_TYPE_QEMU && elem->backend_domid == domid;
>> +}
>> +
>> +typedef struct libxl__aop9_state libxl__aop9_state;
>> +
>> +struct libxl__aop9_state {
>> +    libxl__spawn_state spawn;
>> +    libxl__ao_device *aodev;
>> +    libxl_device_p9 *p9;
>> +    uint32_t domid;
>> +    void (*callback)(libxl__egc *, libxl__aop9_state *, int);
>> +};
>> +
>> +static void xen9pfsd_spawn_outcome(libxl__egc *egc, libxl__aop9_state *aop9,
>> +                                   int rc)
>> +{
>> +    aop9->aodev->rc = rc;
>> +    if (rc)
>> +        aop9->aodev->callback(egc, aop9->aodev);
>> +    else
>> +        libxl__device_add_async(egc, aop9->domid, &libxl__p9_devtype,
>> +                                aop9->p9, aop9->aodev);
>> +}
>> +
>> +static void xen9pfsd_confirm(libxl__egc *egc, libxl__spawn_state *spawn,
>> +                             const char *xsdata)
>> +{
>> +    STATE_AO_GC(spawn->ao);
>> +
>> +    if (!xsdata)
>> +        return;
>> +
>> +    if (strcmp(xsdata, "running"))
>> +        return;
>> +
>> +    libxl__spawn_initiate_detach(gc, spawn);
>> +}
>> +
>> +static void xen9pfsd_failed(libxl__egc *egc, libxl__spawn_state *spawn, int rc)
>> +{
>> +    libxl__aop9_state *aop9 = CONTAINER_OF(spawn, *aop9, spawn);
>> +
>> +    xen9pfsd_spawn_outcome(egc, aop9, rc);
>> +}
>> +
>> +static void xen9pfsd_detached(libxl__egc *egc, libxl__spawn_state *spawn)
>> +{
>> +    libxl__aop9_state *aop9 = CONTAINER_OF(spawn, *aop9, spawn);
>> +
>> +    xen9pfsd_spawn_outcome(egc, aop9, 0);
>> +}
>> +
>> +static int xen9pfsd_spawn(libxl__egc *egc, uint32_t domid, libxl_device_p9 *p9,
>> +                         libxl__ao_device *aodev)
>> +{
>> +    STATE_AO_GC(aodev->ao);
>> +    struct libxl__aop9_state *aop9;
>> +    int rc;
>> +    char *args[] = { "xen-9pfsd", NULL };
>> +    char *path = GCSPRINTF("/local/domain/%u/libxl/xen-9pfs",
>> +                           p9->backend_domid);
>> +
>> +    if (p9->type != LIBXL_P9_TYPE_XEN_9PFSD ||
>> +        libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/state", path)))
> 
> I feel like this check and this function might not work as expected.
> What happen if we try to add more than one 9pfs "device"? libxl I think
> is going to try to start several xen-9pfs daemon before the first one
> have had time to write the "*/state" path.

I don't think so. The path is specific for the _backend_ domid.

> What about two different libxl process trying to spawn that daemon? Is
> xen-9pfs going to behave well and have one giveup? But that would
> probably mean that libxl is going to have an error due to the process
> exiting early, maybe.

I think I need to handle this case gracefully in the daemon by exiting with
a 0 exit code.

> 
>> +        return 0;
>> +
>> +    GCNEW(aop9);
>> +    aop9->aodev = aodev;
>> +    aop9->p9 = p9;
>> +    aop9->domid = domid;
>> +    aop9->callback = xen9pfsd_spawn_outcome;
>> +
>> +    aop9->spawn.ao = aodev->ao;
>> +    aop9->spawn.what = "xen-9pfs daemon";
>> +    aop9->spawn.xspath = GCSPRINTF("%s/state", path);
>> +    aop9->spawn.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
>> +    aop9->spawn.pidpath = GCSPRINTF("%s/pid", path);
>> +    aop9->spawn.midproc_cb = libxl__spawn_record_pid;
>> +    aop9->spawn.confirm_cb = xen9pfsd_confirm;
>> +    aop9->spawn.failure_cb = xen9pfsd_failed;
>> +    aop9->spawn.detached_cb = xen9pfsd_detached;
>> +    rc = libxl__spawn_spawn(egc, &aop9->spawn);
>> +    if (rc < 0)
>> +        return rc;
>> +    if (!rc) {
>> +        setsid();
>> +        libxl__exec(gc, -1, -1, -1, LIBEXEC_BIN "/xen-9pfsd", args, NULL);
>> +    }
>> +
>> +    return 1;
>> +}
> 
> Could you reorder the file, to make it easier to follow the code of
> the async style? "xen9pfsd_spawn()" should be first, followed by
> _confirm() _failed and _detached() and finally xen9pfsd_spawn_outcome().

This would need to add some forward declarations. If you really are fine with
that, I can do the reordering.

> 
>> +
>> +static void libxl__device_p9_add(libxl__egc *egc, uint32_t domid,
>> +                                 libxl_device_p9 *p9,
>> +                                 libxl__ao_device *aodev)
>> +{
>> +    int rc;
>> +
>> +    rc = xen9pfsd_spawn(egc, domid, p9, aodev);
>> +    if (rc == 1)
> 
> I'd like a comment about what's different about rc==1 vs rc==0, here or
> in the function xen9pfsd_spawn. These functions that sometime setup a
> callback (or actually call it) and sometime don't, make things harder to
> follow.

Okay.

> 
> Or maybe we could rewrite things a bit so that there's only one function
> that calls libxl__device_add_async(). But the current
> libxl__device_p9_add() is kind of ok, with additional comments.
> 
>> +        return;
>> +
>> +    if (rc == 0)
>> +        libxl__device_add_async(egc, domid, &libxl__p9_devtype, p9, aodev);
>> +
>> +    aodev->rc = rc;
>> +    if (rc)
>> +        aodev->callback(egc, aodev);
>> +}
>> +
>>   #define libxl_device_p9_list NULL
>>   #define libxl_device_p9_compare NULL
>>   
>>   static LIBXL_DEFINE_UPDATE_DEVID(p9)
>> -static LIBXL_DEFINE_DEVICE_FROM_TYPE(p9)
>> +static LIBXL_DEFINE_DEVICES_ADD(p9)
>>   
>>   LIBXL_DEFINE_DEVICE_REMOVE(p9)
>>   
>>   DEFINE_DEVICE_TYPE_STRUCT(p9, 9PFS, p9s,
>> -    .skip_attach = 1,
>>       .set_xenstore_config = (device_set_xenstore_config_fn_t)
>>                              libxl__set_xenstore_p9,
>> +    .dm_needed = libxl_device_p9_dm_needed,
>>   );
>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
>> index 7d8bd5d216..82565c4c10 100644
>> --- a/tools/libs/light/libxl_types.idl
>> +++ b/tools/libs/light/libxl_types.idl
>> @@ -150,6 +150,12 @@ libxl_nic_type = Enumeration("nic_type", [
>>       (2, "VIF"),
>>       ])
>>   
>> +libxl_p9_type = Enumeration("p9_type", [
>> +    (0, "unknown"),
>> +    (1, "qemu"),
>> +    (2, "xen_9pfsd"),
>> +    ])
>> +
>>   libxl_action_on_shutdown = Enumeration("action_on_shutdown", [
>>       (1, "DESTROY"),
>>   
>> @@ -942,6 +948,11 @@ libxl_device_p9 = Struct("device_p9", [
>>       ("path",             string),
>>       ("security_model",   string),
>>       ("devid",            libxl_devid),
>> +    ("type",             libxl_p9_type),
>> +    ("max_space",        integer),
>> +    ("max_files",        integer),
>> +    ("max_open_files",   integer),
>> +    ("auto_delete",      bool),
> 
> These additional fields and options probably a
> LIBXL_HAVE_XEN_9PFS macro in libxl.h.

Okay, I'll add it.


Juergen

