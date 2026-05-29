Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENaKNG+yGWrJyQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:36:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74196604D93
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322624.1588909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSzFg-0003u9-Pu; Fri, 29 May 2026 15:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322624.1588909; Fri, 29 May 2026 15:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSzFg-0003rq-M5; Fri, 29 May 2026 15:36:00 +0000
Received: by outflank-mailman (input) for mailman id 1322624;
 Fri, 29 May 2026 15:35:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wSzFf-0003rk-UX
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:35:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSzFf-002zYi-7g
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:35:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a19b25d-2eae-0a2a0a5409dd-0a2a4507bef8-6
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:35:59 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a19b25f-229c-0a2a45070019-d155dd2da5fb-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:35:59 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-441209fb77eso8698619f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:35:59 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34b834esm4196196f8f.11.2026.05.29.08.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:35:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780068959; x=1780673759; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yrSwzGwxjcZmImXqqlT3Ta76skB/MLRy+XKTWiwt9jM=;
        b=Y07/ER3+q+uuqYhrDMuHpihwqlZJg5S+N/oacdgSKHc9Rbp3uppO9Kk35eUhf4bVbI
         6AIOA/2P3QRIxIM1xarYGIKKC2FbPk3uNhMJpNUcQgwgkokAtj7iEcuogZ7jOSl0W6m5
         fz4CTtmUmuYaZCavUFFL7gTcBfZ3BebSFMLtGeFdKTn/uJVTXo5mxS4PF9zSE7d3V537
         +3KBOw+A0OQW8qt5XSNzypX5ITHpQitTjvHraCc+vqQZM/WvPdCipPFuGXHin15fWS2b
         me65cyKVvLCn8kKbHRtOeQcmk/k43kcVWHlrJnTAoixtM96oMBJ/KCM8yQNJ+420Z5fO
         cnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780068959; x=1780673759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrSwzGwxjcZmImXqqlT3Ta76skB/MLRy+XKTWiwt9jM=;
        b=hqggnCKy5Lk7UIWENTWmqxB3p7ko+ystJSYQX0nXFUzZZf/5C4dqo6IcjuVw5LT856
         XFp56OQDfl80xB767WZKnyaHm22wbNvzSDxSvivmCgxbtAZTQq1i0WOsZM6CFL2uW/jU
         FGhuM0bCtcx3M/GrQEtUJfjEBylWwY6SPaRkXMuK69lSALjlMYFzW9LVhYt22JfemCSB
         XCd0qhQ5YqUlPcI1uK9PRvDumrZ5m7L0njskiJXPm4ITYFwnBk5tbse6qP+j6/CIsytD
         NO0HFx069r9rjaBqstpNsg/hVpuxq5V6wM7ZL67vjFJQjGsMAfdn+WG8OQGOAQMdq91a
         84RA==
X-Gm-Message-State: AOJu0Yy5a5Pp0O0GOG0BgdqiktsJctprR1IKDMwbcUf3tjbWllKz7pxi
	woU6FZWmzeAE5PJM7+yravoLALT5e+08deAL+yl8N1teteLugq30ovK65zs8ufIo
X-Gm-Gg: Acq92OEivTPc6gsQXL2SiqSbLX13+F+Bv/hi/G28AQFtdpFUi7TaP2wI/VQ7wmp0hUv
	MOB86hsEJ7xtHToZOvczuwgc/Y+uuy4KXFUW/f80m8Y8UFLBNZGcDz++6KTgPS/9Q3b7aJH0vwb
	NcwvbXhFeCCPUnyqpXpPjWHaiP+EscUQj2Jcdu/FYuxyCSAk2EygR3tKDOI9eedih4PSuN5IcFJ
	N67QOUo5PzXrhroQODAfr2X4pGEEmt1Bp86rmYusISYVzElkLyFITy6FJKh7sidu8G/bwnTRIze
	cr1HoxCya295SQD89ur/jiFOinJ1uYVv+t6bKvsbHkKpjQ8chdk495tCt4JOrw9cYRDxN4Ljy+F
	fUrniZ1e9PlNmAwLsVN0x0ht+Ow++bfIPo+EAYmSXSYb9h/mWCsoCWp6FLRBJFEzBW2ULThQhGF
	J9po8vXyLG9B64C1a9F5MaNA8T5nceeZ8JfUoCL3CjFgkY+RdpW3wQyJN5Tbe2Ex+ZK6zUkrAUa
	JnLlVTEnIK9H5ovP7Epm1gIUobhMngj2lKx
X-Received: by 2002:a05:6000:1869:b0:45e:8ad3:86a9 with SMTP id ffacd0b85a97d-45ef13397a5mr5690037f8f.8.1780068958346;
        Fri, 29 May 2026 08:35:58 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/6] Various patches to improve Secure Boot support
Date: Fri, 29 May 2026 16:35:25 +0100
Message-ID: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780068959-08F66C48-68961E01/0/0
X-purgate-type: clean
X-purgate-size: 983
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 74196604D93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These patches improve support for Secure boot.
UEFI CA memory mitigation requires memory pages to be not executable and
writable at the same time. So changing permissions and splitting some section
is required.
SBAT is the preferred way to revocate executables.
Remove multiboot pieces from EFI executable.

Frediano Ziglio (2):
  Align all sections to 4KB
  x86: Split .init section to satisfy UEFI CA memory mitigation

Gerald Elder-Vass (1):
  Add SBAT section to the PE binary

Roger Pau Monné (3):
  x86/efi: discard .text.header for PE binary
  x86/efi: discard multiboot related entry code for PE binary
  x86/efi: avoid a relocation in efi_arch_post_exit_boot()

 xen/arch/x86/Makefile       |  4 ++++
 xen/arch/x86/boot/head.S    |  3 ++-
 xen/arch/x86/efi/efi-boot.h |  7 +++++--
 xen/arch/x86/xen.lds.S      | 25 +++++++++++++++----------
 xen/include/xen/xen.lds.h   |  3 ++-
 5 files changed, 28 insertions(+), 14 deletions(-)

-- 
2.43.0


