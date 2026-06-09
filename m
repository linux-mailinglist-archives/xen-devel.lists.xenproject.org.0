Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YePhNuj9J2oQ6wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 13:50:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF3965FA74
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 13:50:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=broadcom.com header.s=google header.b=bV0AnVoU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=broadcom.com
Received: from list by lists.xenproject.org with outflank-mailman.1332626.1595111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWuxq-0001hA-Hy; Tue, 09 Jun 2026 11:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332626.1595111; Tue, 09 Jun 2026 11:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWuxq-0001fO-F0; Tue, 09 Jun 2026 11:49:50 +0000
Received: by outflank-mailman (input) for mailman id 1332626;
 Tue, 09 Jun 2026 11:49:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sumit.saxena@broadcom.com>) id 1wWuxo-0001dZ-Vz
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 11:49:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWuxo-00CX3M-5M
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 13:49:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sumit.saxena@broadcom.com>)
 id 6a27fdd1-2eae-0a2a0a5409dd-0a2a4501c886-30
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 13:49:47 +0200
Received: from [209.85.214.226] (helo=mail-pl1-f226.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sumit.saxena@broadcom.com>)
 id 6a27fdda-c1f2-0a2a45010019-d155d6e2cc2d-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 13:49:47 +0200
Received: by mail-pl1-f226.google.com with SMTP id
 d9443c01a7336-2c0c20f0c0aso40978215ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 04:49:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-2c165f9ffecsm19311815ad.32.2026.06.09.04.49.44
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2026 04:49:45 -0700 (PDT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-36b9d265308so4111662a91.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 04:49:44 -0700 (PDT)
Received: from sumit_ws.dhcp.broadcom.net ([192.19.234.250])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36f6bf903fasm18898075a91.2.2026.06.09.04.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 04:49:41 -0700 (PDT)
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
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005786; x=1781610586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7jf3E3dEVwQVNqBXvyK4i7zv9F+advmarrjrg+nD7g=;
        b=DzQFpLvubK4z9kkY9HAekwQG/9yF86Zhes0wFFgKSZaEugaY6u2W0dvMAqxx8q1KNx
         Echp6D7KbnH+ZJf5iJM7O14x5tvQ4TcMYlbsZYjpIGR1/e0u3kB71LoGjX9DFw8Its3I
         52LK8ANQO90ov0fFsXYBWeIWfNLCigFBR5hnUX1t9TCZJQmCutOm3xG+zqC7r0h8qWd4
         Xzt0yhyrCRy3JqwhBZBJz6NDctOl8iTTN8XaoAdJRTyhpv9j80usXRiCD7M9xOgv//mp
         SOfsNJ/aFNVm3XVocL9a2XMOF+aCIIFdwDKcJ9il49p0OT8rW/JVl7myKHvzCVKZ9dBw
         /3Hw==
X-Forwarded-Encrypted: i=1; AFNElJ+GpFaFGKcEMOUWXMKKQr++fRan9qJw9bzkaBpbVtrFzZI6x6RB0phhRIYqAhr/Vxt3/uhk5/wf+hw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8ObSbbn1CvWd2uTOzH36RV9wM87aBO5cOUsEbVFgGvXSXq/ub
	upcllSOtBwlW9gvrgaj9fUNk6iTHg/lKff9QTedFBNO/Licqy2tf8tAVmMrEBjCaszvU+HCeRK2
	eCL8uC0ihLGosQpDzfmxFpZ3vDgVAps/IddnrdqsGPeyTtlPYC61y6OkmmhgC9mK4ndJmVjxr4A
	MKxPO1gxF3LuYk7msKK9/Q4LvcRWPeQpMF0mllTSgZJP+EF0X2inZkwdiHpSPmv64fvfuZBapWE
	lEyAVl96xCerQ9q+7Kt4g==
X-Gm-Gg: Acq92OHrjlVLIgj+wQeUlYLBCn4rO+3/ezS15u8+LJCtHKmSiG+gNX3ItX61hJ+sBcp
	thBYcHtRwFlha32T9672rn4j9MzpXm/Xk8bCgAPvlsQy/mcMZCmw48UjO9kkdY4L5W0mwOwxLXF
	vyvNpix/0TD8CFtSR61psnXPWB8j2mTPOxQtgY5hHmE+s6G3xZnX/QCJDCdQ3Eb7VjO7DA6vXs3
	69xg/Wt/c6/YgCkPMb06T/bNhaSME34U2iKp+h9ywkvktpW9Fm5p1StshoI7s6v6Zgh+S/TuMFl
	EliFJKLQmRjQpDxv++dVtPLMLPpluSUTn4qq6ligiiJED3zSET9P+V5Cbc/fjCqNyawGMugutFQ
	YEvHGrIXoYQhK+U7bySZ9sOBLAEutWtzxpLv5xDWEbOQGSAwbOZrrCiZwio0W72eX7ymB9QFTuF
	uw44ilg+hwuwIKsBjv/fdKzYT94/SZCv2wJbkGGdqbe61RdXsVM4MuaV55k/dXeFZE3zr/SQ==
X-Received: by 2002:a17:903:41d2:b0:2c2:1982:5270 with SMTP id d9443c01a7336-2c219825471mr177775805ad.21.1781005785513;
        Tue, 09 Jun 2026 04:49:45 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1781005784; x=1781610584; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7jf3E3dEVwQVNqBXvyK4i7zv9F+advmarrjrg+nD7g=;
        b=bV0AnVoUFK1zVgdFHbP+NnPXr8c9KzlxCSc2MRY8LrHXj8v66nYYmb1gqvjqu1iMZl
         Crw9TUpYi+bUcT70NQjJTej3uxg1qsqFCwMIGcSF546wyPzH7hi74zT3/o+9YeJWF1Fy
         QII3MpBtp/Vf+0JXdNEAwq4AAEpSIdd4rGIo0=
X-Forwarded-Encrypted: i=1; AFNElJ/2CCXsJdI1+4PaIT0kFBHBjH4LNErvk6a5xu98YmCA+QYHIj0VikoPEzjJv4rgFAFbWqOmyKuEfbY=@lists.xenproject.org
X-Received: by 2002:a17:90b:3503:b0:369:7f25:cec0 with SMTP id 98e67ed59e1d1-370ebff34bcmr20900092a91.0.1781005783465;
        Tue, 09 Jun 2026 04:49:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3503:b0:369:7f25:cec0 with SMTP id 98e67ed59e1d1-370ebff34bcmr20900004a91.0.1781005782876;
        Tue, 09 Jun 2026 04:49:42 -0700 (PDT)
From: Sumit Saxena <sumit.saxena@broadcom.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	linux-scsi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Adam Radford <aradford@gmail.com>,
	Khalid Aziz <khalid@gonehiking.org>,
	Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
	Matthew Wilcox <willy@infradead.org>,
	Hannes Reinecke <hare@suse.com>,
	"Juergen E . Fischer" <fischer@norbit.de>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Finn Thain <fthain@linux-m68k.org>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>,
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>,
	Oliver Neukum <oliver@neukum.org>,
	Ali Akcaagac <aliakc@web.de>,
	Jamie Lenehan <lenehan@twibble.org>,
	Ram Vegesna <ram.vegesna@broadcom.com>,
	target-devel@vger.kernel.org,
	Bradley Grove <linuxdrivers@attotech.com>,
	Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	Yihang Li <liyihang9@h-partners.com>,
	Don Brace <don.brace@microchip.com>,
	storagedev@microchip.com,
	HighPoint Linux Team <linux@highpoint-tech.com>,
	Tyrel Datwyler <tyreld@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	Brian King <brking@us.ibm.com>,
	Lee Duncan <lduncan@suse.com>,
	Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>,
	open-iscsi@googlegroups.com,
	Justin Tee <justin.tee@broadcom.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Kashyap Desai <kashyap.desai@broadcom.com>,
	Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
	Chandrakanth Patil <chandrakanth.patil@broadcom.com>,
	megaraidlinux.pdl@broadcom.com,
	Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	mpi3mr-linuxdrv.pdl@broadcom.com,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>,
	MPT-FusionLinux.pdl@broadcom.com,
	Daniel Palmer <daniel@thingy.jp>,
	GOTO Masanori <gotom@debian.or.jp>,
	YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Geoff Levand <geoff@infradead.org>,
	Michael Reed <mdr@sgi.com>,
	Nilesh Javali <njavali@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	Narsimhulu Musini <nmusini@cisco.com>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	linux-hyperv@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio Perez <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	Vishal Bhakta <vishal.bhakta@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	Bart Van Assche <bvanassche@acm.org>,
	Sumit Saxena <sumit.saxena@broadcom.com>
Subject: [PATCH v3 3/4] block: drop shared-tag fairness throttling
Date: Tue,  9 Jun 2026 17:48:02 +0530
Message-ID: <20260609121806.2121755-4-sumit.saxena@broadcom.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260609121806.2121755-1-sumit.saxena@broadcom.com>
References: <20260609121806.2121755-1-sumit.saxena@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-purgate-ID: tlsNG-d62444/1781005787-B5D41FF4-CECA9E83/0/0
X-purgate-type: clean
X-purgate-size: 10271
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:martin.petersen@oracle.com,m:axboe@kernel.dk,m:James.Bottomley@HansenPartnership.com,m:linux-scsi@vger.kernel.org,m:linux-block@vger.kernel.org,m:aradford@gmail.com,m:khalid@gonehiking.org,m:aacraid@microsemi.com,m:willy@infradead.org,m:hare@suse.com,m:fischer@norbit.de,m:linux@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:fthain@linux-m68k.org,m:schmitzmic@gmail.com,m:anil.gurumurthy@qlogic.com,m:sudarsana.kalluru@qlogic.com,m:oliver@neukum.org,m:aliakc@web.de,m:lenehan@twibble.org,m:ram.vegesna@broadcom.com,m:target-devel@vger.kernel.org,m:linuxdrivers@attotech.com,m:satishkh@cisco.com,m:sebaddel@cisco.com,m:kartilak@cisco.com,m:liyihang9@h-partners.com,m:don.brace@microchip.com,m:storagedev@microchip.com,m:linux@highpoint-tech.com,m:tyreld@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:brking@us.ibm.com,m:lduncan@suse.com,m:cleech@redhat.com,m:michael.christie
 @oracle.com,m:open-iscsi@googlegroups.com,m:justin.tee@broadcom.com,m:paul.ely@broadcom.com,m:kashyap.desai@broadcom.com,m:shivasharan.srikanteshwara@broadcom.com,m:chandrakanth.patil@broadcom.com,m:megaraidlinux.pdl@broadcom.com,m:sathya.prakash@broadcom.com,m:sreekanth.reddy@broadcom.com,m:mpi3mr-linuxdrv.pdl@broadcom.com,m:suganath-prabu.subramani@broadcom.com,m:ranjan.kumar@broadcom.com,m:MPT-FusionLinux.pdl@broadcom.com,m:daniel@thingy.jp,m:gotom@debian.or.jp,m:yokota@netlab.is.tsukuba.ac.jp,m:jinpu.wang@cloud.ionos.com,m:geoff@infradead.org,m:mdr@sgi.com,m:njavali@marvell.com,m:GR-QLogic-Storage-Upstream@marvell.com,m:nmusini@cisco.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:linux-hyperv@vger.kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:pbonzini@redhat.com,m:stefanha@redhat.com,m:eperezma@redhat.com,m:virtualization@lists.linux.dev,m:vishal.bhakta@broadcom.com,m:bcm-kernel-feedback-list@broadcom.co
 m,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:bvanassche@acm.org,m:sumit.saxena@broadcom.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[HansenPartnership.com,vger.kernel.org,gmail.com,gonehiking.org,microsemi.com,infradead.org,suse.com,norbit.de,armlinux.org.uk,lists.infradead.org,linux-m68k.org,qlogic.com,neukum.org,web.de,twibble.org,broadcom.com,attotech.com,cisco.com,h-partners.com,microchip.com,highpoint-tech.com,linux.ibm.com,ellerman.id.au,kernel.org,lists.ozlabs.org,us.ibm.com,redhat.com,oracle.com,googlegroups.com,thingy.jp,debian.or.jp,netlab.is.tsukuba.ac.jp,cloud.ionos.com,sgi.com,marvell.com,microsoft.com,lists.linux.dev,epam.com,lists.xenproject.org,acm.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sumit.saxena@broadcom.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[sumit.saxena@broadcom.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_GT_50(0.00)[82];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DF3965FA74

From: Bart Van Assche <bvanassche@acm.org>

Original patch [1] by Bart Van Assche; this version is rebased onto the
current tree.  In testing it improves IOPS by roughly 16-18% by removing
the fair-sharing throttle on shared tag queues.

This patch removes the following code and structure members:
- The function hctx_may_queue().
- blk_mq_hw_ctx.nr_active and request_queue.nr_active_requests_shared_tags
  and also all the code that modifies these two member variables.

[1]: https://lore.kernel.org/linux-block/20240529213921.3166462-1-bvanassche@acm.org/

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Sumit Saxena <sumit.saxena@broadcom.com>
---
 block/blk-core.c       |   2 -
 block/blk-mq-debugfs.c |  22 ++++++++-
 block/blk-mq-tag.c     |   4 --
 block/blk-mq.c         |  17 +------
 block/blk-mq.h         | 100 -----------------------------------------
 include/linux/blk-mq.h |   6 ---
 include/linux/blkdev.h |   2 -
 7 files changed, 22 insertions(+), 131 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 17450058ea6d..129acc1b27e5 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -421,8 +421,6 @@ struct request_queue *blk_alloc_queue(struct queue_limits *lim, int node_id)
 
 	q->node = node_id;
 
-	atomic_set(&q->nr_active_requests_shared_tags, 0);
-
 	timer_setup(&q->timeout, blk_rq_timed_out_timer, 0);
 	INIT_WORK(&q->timeout_work, blk_timeout_work);
 	INIT_LIST_HEAD(&q->icq_list);
diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 047ec887456b..8b85a7f8e987 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -468,11 +468,31 @@ static int hctx_sched_tags_bitmap_show(void *data, struct seq_file *m)
 	return 0;
 }
 
+struct count_active_params {
+	struct blk_mq_hw_ctx	*hctx;
+	int			*active;
+};
+
+static bool hctx_count_active(struct request *rq, void *data)
+{
+	const struct count_active_params *params = data;
+
+	if (rq->mq_hctx == params->hctx)
+		(*params->active)++;
+
+	return true;
+}
+
 static int hctx_active_show(void *data, struct seq_file *m)
 {
 	struct blk_mq_hw_ctx *hctx = data;
+	int active = 0;
+	struct count_active_params params = { .hctx = hctx, .active = &active };
+
+	blk_mq_all_tag_iter(hctx->sched_tags ?: hctx->tags, hctx_count_active,
+			    &params);
 
-	seq_printf(m, "%d\n", __blk_mq_active_requests(hctx));
+	seq_printf(m, "%d\n", active);
 	return 0;
 }
 
diff --git a/block/blk-mq-tag.c b/block/blk-mq-tag.c
index 33946cdb5716..bfd27cc6249b 100644
--- a/block/blk-mq-tag.c
+++ b/block/blk-mq-tag.c
@@ -109,10 +109,6 @@ void __blk_mq_tag_idle(struct blk_mq_hw_ctx *hctx)
 static int __blk_mq_get_tag(struct blk_mq_alloc_data *data,
 			    struct sbitmap_queue *bt)
 {
-	if (!data->q->elevator && !(data->flags & BLK_MQ_REQ_RESERVED) &&
-			!hctx_may_queue(data->hctx, bt))
-		return BLK_MQ_NO_TAG;
-
 	if (data->shallow_depth)
 		return sbitmap_queue_get_shallow(bt, data->shallow_depth);
 	else
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 4c5c16cce4f8..bbac59a06044 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -489,8 +489,6 @@ __blk_mq_alloc_requests_batch(struct blk_mq_alloc_data *data)
 		}
 	} while (data->nr_tags > nr);
 
-	if (!(data->rq_flags & RQF_SCHED_TAGS))
-		blk_mq_add_active_requests(data->hctx, nr);
 	/* caller already holds a reference, add for remainder */
 	percpu_ref_get_many(&data->q->q_usage_counter, nr - 1);
 	data->nr_tags -= nr;
@@ -587,8 +585,6 @@ static struct request *__blk_mq_alloc_requests(struct blk_mq_alloc_data *data)
 		goto retry;
 	}
 
-	if (!(data->rq_flags & RQF_SCHED_TAGS))
-		blk_mq_inc_active_requests(data->hctx);
 	rq = blk_mq_rq_ctx_init(data, blk_mq_tags_from_data(data), tag);
 	blk_mq_rq_time_init(rq, alloc_time_ns);
 	return rq;
@@ -763,8 +759,6 @@ struct request *blk_mq_alloc_request_hctx(struct request_queue *q,
 	tag = blk_mq_get_tag(&data);
 	if (tag == BLK_MQ_NO_TAG)
 		goto out_queue_exit;
-	if (!(data.rq_flags & RQF_SCHED_TAGS))
-		blk_mq_inc_active_requests(data.hctx);
 	rq = blk_mq_rq_ctx_init(&data, blk_mq_tags_from_data(&data), tag);
 	blk_mq_rq_time_init(rq, alloc_time_ns);
 	rq->__data_len = 0;
@@ -807,10 +801,8 @@ static void __blk_mq_free_request(struct request *rq)
 	blk_pm_mark_last_busy(rq);
 	rq->mq_hctx = NULL;
 
-	if (rq->tag != BLK_MQ_NO_TAG) {
-		blk_mq_dec_active_requests(hctx);
+	if (rq->tag != BLK_MQ_NO_TAG)
 		blk_mq_put_tag(hctx->tags, ctx, rq->tag);
-	}
 	if (sched_tag != BLK_MQ_NO_TAG)
 		blk_mq_put_tag(hctx->sched_tags, ctx, sched_tag);
 	blk_mq_sched_restart(hctx);
@@ -1188,8 +1180,6 @@ static inline void blk_mq_flush_tag_batch(struct blk_mq_hw_ctx *hctx,
 {
 	struct request_queue *q = hctx->queue;
 
-	blk_mq_sub_active_requests(hctx, nr_tags);
-
 	blk_mq_put_tags(hctx->tags, tag_array, nr_tags);
 	percpu_ref_put_many(&q->q_usage_counter, nr_tags);
 }
@@ -1875,9 +1865,6 @@ bool __blk_mq_alloc_driver_tag(struct request *rq)
 	if (blk_mq_tag_is_reserved(rq->mq_hctx->sched_tags, rq->internal_tag)) {
 		bt = &rq->mq_hctx->tags->breserved_tags;
 		tag_offset = 0;
-	} else {
-		if (!hctx_may_queue(rq->mq_hctx, bt))
-			return false;
 	}
 
 	tag = __sbitmap_queue_get(bt);
@@ -1885,7 +1872,6 @@ bool __blk_mq_alloc_driver_tag(struct request *rq)
 		return false;
 
 	rq->tag = tag + tag_offset;
-	blk_mq_inc_active_requests(rq->mq_hctx);
 	return true;
 }
 
@@ -4058,7 +4044,6 @@ blk_mq_alloc_hctx(struct request_queue *q, struct blk_mq_tag_set *set,
 	if (!zalloc_cpumask_var_node(&hctx->cpumask, gfp, node))
 		goto free_hctx;
 
-	atomic_set(&hctx->nr_active, 0);
 	if (node == NUMA_NO_NODE)
 		node = set->numa_node;
 	hctx->numa_node = node;
diff --git a/block/blk-mq.h b/block/blk-mq.h
index aa15d31aaae9..8dfb67c55f5d 100644
--- a/block/blk-mq.h
+++ b/block/blk-mq.h
@@ -291,70 +291,9 @@ static inline int blk_mq_get_rq_budget_token(struct request *rq)
 	return -1;
 }
 
-static inline void __blk_mq_add_active_requests(struct blk_mq_hw_ctx *hctx,
-						int val)
-{
-	if (blk_mq_is_shared_tags(hctx->flags))
-		atomic_add(val, &hctx->queue->nr_active_requests_shared_tags);
-	else
-		atomic_add(val, &hctx->nr_active);
-}
-
-static inline void __blk_mq_inc_active_requests(struct blk_mq_hw_ctx *hctx)
-{
-	__blk_mq_add_active_requests(hctx, 1);
-}
-
-static inline void __blk_mq_sub_active_requests(struct blk_mq_hw_ctx *hctx,
-		int val)
-{
-	if (blk_mq_is_shared_tags(hctx->flags))
-		atomic_sub(val, &hctx->queue->nr_active_requests_shared_tags);
-	else
-		atomic_sub(val, &hctx->nr_active);
-}
-
-static inline void __blk_mq_dec_active_requests(struct blk_mq_hw_ctx *hctx)
-{
-	__blk_mq_sub_active_requests(hctx, 1);
-}
-
-static inline void blk_mq_add_active_requests(struct blk_mq_hw_ctx *hctx,
-					      int val)
-{
-	if (hctx->flags & BLK_MQ_F_TAG_QUEUE_SHARED)
-		__blk_mq_add_active_requests(hctx, val);
-}
-
-static inline void blk_mq_inc_active_requests(struct blk_mq_hw_ctx *hctx)
-{
-	if (hctx->flags & BLK_MQ_F_TAG_QUEUE_SHARED)
-		__blk_mq_inc_active_requests(hctx);
-}
-
-static inline void blk_mq_sub_active_requests(struct blk_mq_hw_ctx *hctx,
-					      int val)
-{
-	if (hctx->flags & BLK_MQ_F_TAG_QUEUE_SHARED)
-		__blk_mq_sub_active_requests(hctx, val);
-}
-
-static inline void blk_mq_dec_active_requests(struct blk_mq_hw_ctx *hctx)
-{
-	if (hctx->flags & BLK_MQ_F_TAG_QUEUE_SHARED)
-		__blk_mq_dec_active_requests(hctx);
-}
-
-static inline int __blk_mq_active_requests(struct blk_mq_hw_ctx *hctx)
-{
-	if (blk_mq_is_shared_tags(hctx->flags))
-		return atomic_read(&hctx->queue->nr_active_requests_shared_tags);
-	return atomic_read(&hctx->nr_active);
-}
 static inline void __blk_mq_put_driver_tag(struct blk_mq_hw_ctx *hctx,
 					   struct request *rq)
 {
-	blk_mq_dec_active_requests(hctx);
 	blk_mq_put_tag(hctx->tags, rq->mq_ctx, rq->tag);
 	rq->tag = BLK_MQ_NO_TAG;
 }
@@ -396,45 +335,6 @@ static inline void blk_mq_free_requests(struct list_head *list)
 	}
 }
 
-/*
- * For shared tag users, we track the number of currently active users
- * and attempt to provide a fair share of the tag depth for each of them.
- */
-static inline bool hctx_may_queue(struct blk_mq_hw_ctx *hctx,
-				  struct sbitmap_queue *bt)
-{
-	unsigned int depth, users;
-
-	if (!hctx || !(hctx->flags & BLK_MQ_F_TAG_QUEUE_SHARED))
-		return true;
-
-	/*
-	 * Don't try dividing an ant
-	 */
-	if (bt->sb.depth == 1)
-		return true;
-
-	if (blk_mq_is_shared_tags(hctx->flags)) {
-		struct request_queue *q = hctx->queue;
-
-		if (!test_bit(QUEUE_FLAG_HCTX_ACTIVE, &q->queue_flags))
-			return true;
-	} else {
-		if (!test_bit(BLK_MQ_S_TAG_ACTIVE, &hctx->state))
-			return true;
-	}
-
-	users = READ_ONCE(hctx->tags->active_queues);
-	if (!users)
-		return true;
-
-	/*
-	 * Allow at least some tags
-	 */
-	depth = max((bt->sb.depth + users - 1) / users, 4U);
-	return __blk_mq_active_requests(hctx) < depth;
-}
-
 /* run the code block in @dispatch_ops with rcu/srcu read lock held */
 #define __blk_mq_run_dispatch_ops(q, check_sleep, dispatch_ops)	\
 do {								\
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 18a2388ba581..ccbb07559402 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -432,12 +432,6 @@ struct blk_mq_hw_ctx {
 	/** @queue_num: Index of this hardware queue. */
 	unsigned int		queue_num;
 
-	/**
-	 * @nr_active: Number of active requests. Only used when a tag set is
-	 * shared across request queues.
-	 */
-	atomic_t		nr_active;
-
 	/** @cpuhp_online: List to store request if CPU is going to die */
 	struct hlist_node	cpuhp_online;
 	/** @cpuhp_dead: List to store request if some CPU die. */
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 890128cdea1c..95525b1d7b74 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -567,8 +567,6 @@ struct request_queue {
 	struct timer_list	timeout;
 	struct work_struct	timeout_work;
 
-	atomic_t		nr_active_requests_shared_tags;
-
 	struct blk_mq_tags	*sched_shared_tags;
 
 	struct list_head	icq_list;
-- 
2.43.7


