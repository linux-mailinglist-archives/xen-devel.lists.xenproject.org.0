Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589E741D7C2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 12:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199755.354003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtLH-0006AW-Ng; Thu, 30 Sep 2021 10:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199755.354003; Thu, 30 Sep 2021 10:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtLH-00067H-K1; Thu, 30 Sep 2021 10:31:07 +0000
Received: by outflank-mailman (input) for mailman id 199755;
 Thu, 30 Sep 2021 10:31:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tgyX=OU=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1mVtLF-00066v-ES
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 10:31:05 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 82e5deac-21d9-11ec-bd43-12813bfff9fa;
 Thu, 30 Sep 2021 10:31:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-OXBYxjN3NhejJMUuaXLn1w-1; Thu, 30 Sep 2021 06:30:51 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 738C01006AA4;
 Thu, 30 Sep 2021 10:30:49 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 715E760BD8;
 Thu, 30 Sep 2021 10:30:30 +0000 (UTC)
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
X-Inumbo-ID: 82e5deac-21d9-11ec-bd43-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632997862;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1LdDo/aO4T4/u7SlfRZRwccYmDGejjKHpxqBAJClDwA=;
	b=WC3agA+blTMfyKXE3MxaLNLpbLAJjPknryrhFLwkXuBS0K4mRm/GpGUq3f+b2hER9Kg9NS
	SSyQvyE1xyhRYceMLiSajsIWJ5QpAi0ErfIQrIv49VEgwVdgHfXQqdZc/66GxyFm3lKXaT
	O6lTK9DpKvQ0RRdJbDXOelAsvlNlwKE=
X-MC-Unique: OXBYxjN3NhejJMUuaXLn1w-1
Date: Thu, 30 Sep 2021 11:30:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: P J P <pjp@fedoraproject.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Thomas Huth <thuth@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-block@nongnu.org" <qemu-block@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 00/10] security: Introduce
 qemu_security_policy_taint() API
Message-ID: <YVWRw0ZKq3G6P5YP@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <YTnhy/Wo5M1qVs1k@redhat.com>
 <798304472.4432617.1631626227208@mail.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <798304472.4432617.1631626227208@mail.yahoo.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Sep 14, 2021 at 01:30:27PM +0000, P J P wrote:
> Hello Philippe, all
> 
> >On Thursday, 9 September, 2021, 03:58:40 pm IST, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >On Thu, Sep 09, 2021 at 01:20:14AM +0200, Philippe Mathieu-Daudé wrote:
> >> This series is experimental! The goal is to better limit the
> >> boundary of what code is considerated security critical, and
> >> what is less critical (but still important!).
> >>
> >> This approach was quickly discussed few months ago with Markus
> >> then Daniel. Instead of classifying the code on a file path
> >> basis (see [1]), we insert (runtime) hints into the code
> >> (which survive code movement). Offending unsafe code can
> >> taint the global security policy. By default this policy
> >> is 'none': the current behavior. It can be changed on the
> >> command line to 'warn' to display warnings, and to 'strict'
> >> to prohibit QEMU running with a tainted policy.
> >
> 
> * Thanks so much for restarting this thread. I've been at it intermittently last few
>   months, thinking about how could we annotate the source/module objects.
> 
>    -> [*] https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg04642.html
> 
> * Last time we discussed about having both compile and run time options for users
>   to be able to select the qualified objects/backends/devices as desired.

Right, we have multiple different use cases here

 - People building QEMU who want to cut down what they ship to
   minimize the stuff they support, which is outside the security
   guarantee. This can be OS distros, but also any other consumer
   of QEMU
   
   eg. RHEL wants to cut out almost all non-virtualization stuff.
   There is a quirk here though, that RHEL still includes TCG
   which is considered outside the security guarantee. So a
   simple build time "--secure on|off" doesn't do the job on
   its own.

   We need something to let people understand the consequences
   of the build options they are enabling.

   NB, when I talk of build options, I include both configure/meson
   args, and also the CONFIG_* options set in configs/**/*.mak


 - Application developers want to check that they're not using
   stuff outside the security guarantee, even if the distro
   has enable it.  These need to be able to query whether the
   VM they've launched has undesirable configuration choices.


Some people fall into both groups, some people fall into neither
group.


> * To confirm: How/Where is the security policy defined? Is it
>   device/module specific OR QEMU project wide?

Currently our only definition is in the docs

  https://qemu-project.gitlab.io/qemu/system/security.html#security-requirements

Philippe's patch is proposing tagging against internal QEMU objects
of various types.  I further proposed that we expose this in QMP
so it is introspectable.

I think there's scope for doing stuff at build time with configure
args and *mak CONFIG_* options, but haven't thought what that might
look like.

> > IOW, the reporting via QAPI introspetion is much more important
> > for libvirt and mgmt apps, than any custom cli arg / printfs
> > at the QEMU level.
> >
> 
> * True, while it makes sense to have a solution that is conversant with
>   the management/libvirt layers, It'll be great if we could address qemu/cli
>   other use cases too.
> 
> >it feels like we need
> >  'secure': 'bool'
> 
> * Though we started the (above [*]) discussion with '--security' option in mind,
>   I wonder if 'secure' annotation is much specific. And if we could widen its scope.
> --- x ---
> 
> 
> Source annotations: I've been thinking over following approaches
> ===================
> 
> 1) Segregate the QEMU sources under
> 
>       ../staging/      <= devel/experimental, not for production usage
>       ../src/          <= good for production usage, hence security relevant
>       ../deprecated/   <= Bad for production usage, not security relevant 
> 
>    - This is similar to Linux staging drivers' tree.
>    - Staging drivers are not considered for production usage and hence CVE allocation.
>    - At build time by default we only build sources under ../src/ tree.
>    - But we can still have options to build /staging/ and /deprecated/ trees.  
>    - It's readily understandable to end users.

I don't think we should be working in terms of source files at all.
Some files contain multiple distinct bits of functionality that are
not easily separated, and will have distinct security levels. Also
IMHO it is unpleasant to be moving files around in git to when code
switches between levels.  Also there are distinct criteria here,
both security levels, and support levels - there can be stuff which
is fully supported but considered insecure, and stuff that is
deprecated but considered secure. 

> 2) pkgconfig(1) way:
>    - If we could define per device/backend a configuration (.pc) file which is then used
>      at build/run time to decide which sources are suitable for the build or usage.
> 
>    - I'm trying to experiment with this.

For build time configuration, we have a pretty clear set of
toggles between the configure/meson options, and the CONFIG_*
make options.  I don't think we need to complicate things by
trying to add pkg-config into the mix here.

> 3) We annotate QEMU devices/backends/modules with macros which define its status.
>    It can then be used at build/run times to decide if it's suitable for usage.

What is what Philippe's patches are doing in essence

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


