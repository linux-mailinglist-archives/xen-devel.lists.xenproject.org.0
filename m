Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9F940486D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 12:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182954.330834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOHIW-0006Pk-KO; Thu, 09 Sep 2021 10:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182954.330834; Thu, 09 Sep 2021 10:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOHIW-0006Nx-HM; Thu, 09 Sep 2021 10:28:48 +0000
Received: by outflank-mailman (input) for mailman id 182954;
 Thu, 09 Sep 2021 10:28:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sph1=N7=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1mOHIV-0006Np-9W
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 10:28:47 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1058e31a-77f1-4299-a739-163ad18ce41e;
 Thu, 09 Sep 2021 10:28:46 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-TWYTzTWWOT6YTQ70pewE1g-1; Thu, 09 Sep 2021 06:28:36 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23F751006AAA;
 Thu,  9 Sep 2021 10:28:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F2815B826;
 Thu,  9 Sep 2021 10:28:29 +0000 (UTC)
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
X-Inumbo-ID: 1058e31a-77f1-4299-a739-163ad18ce41e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631183326;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cc/jxy7+//DCARbQzXLT+htA7O/y961unhjav93Y0yg=;
	b=g8aD+Ta1higNz1Hklrk6oTe9F9LIckfGONwOZlBpyP043mZZWtktHqBWjeARtsXoiPKEgA
	Ci5E1/o9M4AMxFIKBe187Vo74BMW4NKJTYmqrUN604K2rVa00t2RarstZOcvHib49SWkcS
	samzV80/KbyIgwjwLuj7S5PTt/LK+UQ=
X-MC-Unique: TWYTzTWWOT6YTQ70pewE1g-1
Date: Thu, 9 Sep 2021 11:28:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 00/10] security: Introduce
 qemu_security_policy_taint() API
Message-ID: <YTnhy/Wo5M1qVs1k@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 09, 2021 at 01:20:14AM +0200, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series is experimental! The goal is to better limit the
> boundary of what code is considerated security critical, and
> what is less critical (but still important!).
> 
> This approach was quickly discussed few months ago with Markus
> then Daniel. Instead of classifying the code on a file path
> basis (see [1]), we insert (runtime) hints into the code
> (which survive code movement). Offending unsafe code can
> taint the global security policy. By default this policy
> is 'none': the current behavior. It can be changed on the
> command line to 'warn' to display warnings, and to 'strict'
> to prohibit QEMU running with a tainted policy.

Ok, so I infer that you based this idea on the "--compat-policy"
arg used to control behaviour wrt to deprecations.

With the deprecation support, the QAPI introspection data can
report deprecations for machines / CPUs (and in theory devices
later).  Libvirt records this deprecation info and can report
it to the user before even starting a guest, so they can avoid
using a deprecated device in the first place.  We also use this
info to mark a guest as tainted + deprecation at the libvirt
level and let mgmt apps query this status.

The --compat-policy support has been integrated into libvirt
but it is not something we expect real world deployments to
use - rather it is targeted as a testing framework.

Essentially I see the security reporting as needing to operate
in a pretty similar manner.

IOW, the reporting via QAPI introspetion is much more important
for libvirt and mgmt apps, than any custom cli arg / printfs
at the QEMU level.


In terms of QAPI design we currently have

   'deprecated': 'bool'

field against MachineInfo and CpuDefinitionInfo types.

it feels like we need

   'secure': 'bool'

field against the relevant types here too, though I think
maybe we might need to make it an optional field  to let
us distinguish lack of information, since it will take a
long time to annotate all areas. eg

   '*secure': 'bool'

 - not set  => no info available on security characteristics
 - true => device is considered secure wrt malicious guest
 - false => device is not considered secure wrt malicious guest


> As examples I started implementing unsafe code taint from
> 3 different pieces of code:
> - accelerators (KVM and Xen in allow-list)
> - block drivers (vvfat and parcial null-co in deny-list)
> - qdev (hobbyist devices regularly hit by fuzzer)
> 
> I don't want the security researchers to not fuzz QEMU unsafe
> areas, but I'd like to make it clearer what the community
> priority is (currently 47 opened issues on [3]).

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


