Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102309E17C9
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847658.1262731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPKB-0004Rx-BM; Tue, 03 Dec 2024 09:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847658.1262731; Tue, 03 Dec 2024 09:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPKB-0004QG-8h; Tue, 03 Dec 2024 09:36:07 +0000
Received: by outflank-mailman (input) for mailman id 847658;
 Tue, 03 Dec 2024 09:36:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L6AI=S4=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1tIPK9-0004QA-V2
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:36:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02f9948f-b15a-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:36:03 +0100 (CET)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-183-EJopHmXxOcyvUwsuY-hNew-1; Tue,
 03 Dec 2024 04:36:01 -0500
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F1FBD19560AA; Tue,  3 Dec 2024 09:35:59 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DF25A1956054; Tue,  3 Dec 2024 09:35:57 +0000 (UTC)
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
X-Inumbo-ID: 02f9948f-b15a-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733218562;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQBKPg7kKSDKtUpdcDIPkN150R6XVQZ1n4vXmPnwve0=;
	b=eUItAPBbXLt8SlAuXdDX+z++LhZOHgFZt9ZZ5BCzX9HfWGUISgLacWzk2qMwb7VoPkfuHE
	xYe5gtrcx5tqxubI9tfOp8tbf3IInK1KktrdE8I0T4b1bgCkwRZieTdlYhcHwgb+NZ5ILN
	zZYw0pSEBMRLblUqPkPt2tS6LQKjDUs=
X-MC-Unique: EJopHmXxOcyvUwsuY-hNew-1
X-Mimecast-MFC-AGG-ID: EJopHmXxOcyvUwsuY-hNew
Date: Tue, 3 Dec 2024 09:35:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/7] tests/qtest/fuzz: Remove legacy '-machine
 foo,accel=bar'
Message-ID: <Z07Q-vB8Ia6Aypee@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203092153.60590-4-philmd@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On Tue, Dec 03, 2024 at 10:21:49AM +0100, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> Replace '-machine foo,accel=bar' -> '-machine foo -accel bar' in
> fuzzer scripts and tests.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  tests/qtest/fuzz/generic_fuzz.c                | 2 +-
>  tests/qtest/fuzz/i440fx_fuzz.c                 | 2 +-
>  tests/qtest/fuzz/qos_fuzz.c                    | 2 +-
>  scripts/oss-fuzz/output_reproducer.py          | 2 --
>  scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py | 6 +++---
>  5 files changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


