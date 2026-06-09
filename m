Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HGudE//9J2oU6wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 13:50:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC7A65FA81
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 13:50:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=broadcom.com header.s=google header.b=EbBCNdb+;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=broadcom.com
Received: from list by lists.xenproject.org with outflank-mailman.1332634.1595121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWuyD-0003H4-Ra; Tue, 09 Jun 2026 11:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332634.1595121; Tue, 09 Jun 2026 11:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWuyD-0003Ex-Nj; Tue, 09 Jun 2026 11:50:13 +0000
Received: by outflank-mailman (input) for mailman id 1332634;
 Tue, 09 Jun 2026 11:50:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sumit.saxena@broadcom.com>) id 1wWuyB-0003D7-JV
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 11:50:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWuyB-00GBDM-00
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 13:50:11 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sumit.saxena@broadcom.com>)
 id 6a27fde0-5cb7-0a2a0a5109dd-0a2a450cc5a0-40
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 13:50:10 +0200
Received: from [74.125.82.226] (helo=mail-dy1-f226.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sumit.saxena@broadcom.com>)
 id 6a27fdf1-62f1-0a2a450c0019-4a7d52e2d563-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 13:50:10 +0200
Received: by mail-dy1-f226.google.com with SMTP id
 5a478bee46e88-307d0405e07so865710eec.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 04:50:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 ([144.49.247.127]) by smtp-relay.gmail.com with ESMTPS id
 5a478bee46e88-3074db83e41sm850958eec.7.2026.06.09.04.50.07
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2026 04:50:08 -0700 (PDT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-36bc54005a7so7347350a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 04:50:06 -0700 (PDT)
Received: from sumit_ws.dhcp.broadcom.net ([192.19.234.250])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36f6bf903fasm18898075a91.2.2026.06.09.04.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 04:50:03 -0700 (PDT)
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
        d=1e100.net; s=20251104; t=1781005808; x=1781610608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLAZlEa/gpJjIgpIJ2e9Ooy6MTW++uhKEEc/j768mlo=;
        b=RhKtdSbHQx9uz9Js1KJsErTk/Q95N7tkAg/UH0Xt1xDMyR+OezBYcbsywGMmPaeVsi
         4ko+we2DbIX3FfIpOXqGx3vqAwKgow3FRm9fT8ngeA5IyG3Y2NAau1PVAaauhMlcFlWo
         K2lTfGQVVzxFtltpItCoWbHh0/QkfF9uFaLH+cfWNW+CNfWIhaUgrB49pEks4EnyEEyR
         EtbHIylVS4XyHls5/SVBhAwSnzA5cZlSwRYXqBzJY5dEPkQy9MpvGkvOr2qZF+eftIKY
         XVyGGVofzbeaYyEOapCC54JZYX0esk+TYy5xbtkRb9kPmIt1lqlCTkfC03Gz0qviGKNp
         CEnw==
X-Forwarded-Encrypted: i=1; AFNElJ85aH2Wn7bUcr8LbpubNWKNL9p960z5fbovvw4J8TDFWITrZoghvI231OPjMwlISRPQ54Nfs6y5ri8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWImezAfIh85boMsspKCD4YaVQxFLzfKGjF4d/tiQij21Km9wx
	Jk5eIpv5lLthW0c/2Lfu6cCpHx2Nc04ogoBQOXJmVwgbix+ZDnTk2r66hFqY1Z8bm30FGQNNn49
	jsk2lhcUP30eon8vQKLEzL89nTiaPu42F0kD/b4hb8ylGvOdHNAScvnLNR3Y6NzV79pPLoj8xC4
	PnZWcMqE8txO9PXy4hjX47wT9pwLioT6zBlAs8ex2D1meIJnxsaIXxK6kpfO8CX0Rg6Ip6rmL2K
	1fGdiwvgxKl+kqcJcUKkQ==
X-Gm-Gg: Acq92OG9I+mIJLi3rwctEgzYFsG58jjADYmeihdkrFyOEgLEl0LRBMlpH8xbnkAhRus
	3lSOyKJRh/0tDsEcocucJkf6UXCwe7Zo13vN8AcFPy/qQ5Q9B7itO2uI7EQ2o5JVboioZMmK7CO
	HDMliySBSiyeQatKaWMHbvzJVNmPkEg/yTvcmbhYQfSaogeDuhhrggwJVsJLLTyeZkAVBu1aTYB
	glR5snXDIW1wLpIa2hYoV7odZv1hhrNzBn0Q8p1wBlBcVq5A8nWit/hYGQ5Tpr3IV9gF/EwbBpn
	E0phu/yFinVvOyx+iDWE61O+1ynQ+nAm0EYjydqtVkxRAJdACDFTOpZL6udm9cst7PkR7vpPeqR
	CcDV8KlOuobxO8NL2OoupVSY8NGZDasYc0J2cSSeG1DV28AKS2b+VZAuFJWgtl/Plhud/VaQ7Kn
	m/WBT272kwvZJSIcY=
X-Received: by 2002:a05:7300:80ce:b0:2dd:6937:79d5 with SMTP id 5a478bee46e88-3077af681eamr11765237eec.8.1781005808158;
        Tue, 09 Jun 2026 04:50:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1781005806; x=1781610606; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLAZlEa/gpJjIgpIJ2e9Ooy6MTW++uhKEEc/j768mlo=;
        b=EbBCNdb+KlhUnARK/m/9qr6Uq3veHMn7NjosF96SB6tEd9TXyAnes/DjkSu/yGBjwZ
         aFPrmr+0HqrVEgXt6LnTIbdctVYzEhQNcVHsHa3CWpZatvdPDaLXbZXz1OVUdXVBnRrp
         5mtUTsMtKBTLrpiLWX97Ka6CCUnM3TGToE21U=
X-Forwarded-Encrypted: i=1; AFNElJ8i+zLQRovTrc4ey/++u4qeYnmNhSRXQ5/Cx5vah7J21inTSyA8fukDqLTPRtfvN71ab0sYX+OayEc=@lists.xenproject.org
X-Received: by 2002:a17:90b:57c4:b0:36b:75:6387 with SMTP id 98e67ed59e1d1-370eea202f0mr20609582a91.8.1781005805625;
        Tue, 09 Jun 2026 04:50:05 -0700 (PDT)
X-Received: by 2002:a17:90b:57c4:b0:36b:75:6387 with SMTP id 98e67ed59e1d1-370eea202f0mr20609495a91.8.1781005805070;
        Tue, 09 Jun 2026 04:50:05 -0700 (PDT)
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
	Sumit Saxena <sumit.saxena@broadcom.com>,
	John Garry <john.g.garry@oracle.com>
Subject: [PATCH v3 4/4] scsi: use percpu counters for iostat counters in struct scsi_device
Date: Tue,  9 Jun 2026 17:48:03 +0530
Message-ID: <20260609121806.2121755-5-sumit.saxena@broadcom.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260609121806.2121755-1-sumit.saxena@broadcom.com>
References: <20260609121806.2121755-1-sumit.saxena@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-purgate-ID: tlsNG-d25034/1781005810-E2F72CF5-921E1068/0/0
X-purgate-type: clean
X-purgate-size: 7433
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
 m,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:sumit.saxena@broadcom.com,m:john.g.garry@oracle.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[HansenPartnership.com,vger.kernel.org,gmail.com,gonehiking.org,microsemi.com,infradead.org,suse.com,norbit.de,armlinux.org.uk,lists.infradead.org,linux-m68k.org,qlogic.com,neukum.org,web.de,twibble.org,broadcom.com,attotech.com,cisco.com,h-partners.com,microchip.com,highpoint-tech.com,linux.ibm.com,ellerman.id.au,kernel.org,lists.ozlabs.org,us.ibm.com,redhat.com,oracle.com,googlegroups.com,thingy.jp,debian.or.jp,netlab.is.tsukuba.ac.jp,cloud.ionos.com,sgi.com,marvell.com,microsoft.com,lists.linux.dev,epam.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[sumit.saxena@broadcom.com,xen-devel-bounces@lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,broadcom.com:dkim,broadcom.com:email,broadcom.com:mid,broadcom.com:from_mime,oracle.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AC7A65FA81

iorequest_cnt and iodone_cnt are updated on every command dispatch and
completion, often from different CPUs on high queue depth workloads.
Using adjacent atomic_t fields causes cache line contention between the
submission and completion paths.

Extend the same treatment to ioerr_cnt and iotmo_cnt so all four iostat
counters in struct scsi_device use struct percpu_counter.

Suggested-by: John Garry <john.g.garry@oracle.com>
Signed-off-by: Sumit Saxena <sumit.saxena@broadcom.com>
---
 drivers/scsi/scsi_error.c  |  4 ++--
 drivers/scsi/scsi_lib.c    | 10 +++++-----
 drivers/scsi/scsi_scan.c   |  8 ++++++++
 drivers/scsi/scsi_sysfs.c  | 23 ++++++++++++++---------
 drivers/scsi/sd.c          |  2 +-
 include/scsi/scsi_device.h |  9 +++++----
 6 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/drivers/scsi/scsi_error.c b/drivers/scsi/scsi_error.c
index 147127fb4db9..b1aa7da2ba7c 100644
--- a/drivers/scsi/scsi_error.c
+++ b/drivers/scsi/scsi_error.c
@@ -349,7 +349,7 @@ enum blk_eh_timer_return scsi_timeout(struct request *req)
 	trace_scsi_dispatch_cmd_timeout(scmd);
 	scsi_log_completion(scmd, TIMEOUT_ERROR);
 
-	atomic_inc(&scmd->device->iotmo_cnt);
+	percpu_counter_inc(&scmd->device->iotmo_cnt);
 	if (host->eh_deadline != -1 && !host->last_reset)
 		host->last_reset = jiffies;
 
@@ -370,7 +370,7 @@ enum blk_eh_timer_return scsi_timeout(struct request *req)
 	 */
 	if (test_and_set_bit(SCMD_STATE_COMPLETE, &scmd->state))
 		return BLK_EH_DONE;
-	atomic_inc(&scmd->device->iodone_cnt);
+	percpu_counter_inc(&scmd->device->iodone_cnt);
 	if (scsi_abort_command(scmd) != SUCCESS) {
 		set_host_byte(scmd, DID_TIME_OUT);
 		scsi_eh_scmd_add(scmd);
diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 6e8c7a42603e..979fdace33ac 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -1554,9 +1554,9 @@ static void scsi_complete(struct request *rq)
 
 	INIT_LIST_HEAD(&cmd->eh_entry);
 
-	atomic_inc(&cmd->device->iodone_cnt);
+	percpu_counter_inc(&cmd->device->iodone_cnt);
 	if (cmd->result)
-		atomic_inc(&cmd->device->ioerr_cnt);
+		percpu_counter_inc(&cmd->device->ioerr_cnt);
 
 	disposition = scsi_decide_disposition(cmd);
 	if (disposition != SUCCESS && scsi_cmd_runtime_exceeced(cmd))
@@ -1592,7 +1592,7 @@ static enum scsi_qc_status scsi_dispatch_cmd(struct scsi_cmnd *cmd)
 	struct Scsi_Host *host = cmd->device->host;
 	int rtn = 0;
 
-	atomic_inc(&cmd->device->iorequest_cnt);
+	percpu_counter_inc(&cmd->device->iorequest_cnt);
 
 	/* check if the device is still usable */
 	if (unlikely(cmd->device->sdev_state == SDEV_DEL)) {
@@ -1614,7 +1614,7 @@ static enum scsi_qc_status scsi_dispatch_cmd(struct scsi_cmnd *cmd)
 		 */
 		SCSI_LOG_MLQUEUE(3, scmd_printk(KERN_INFO, cmd,
 			"queuecommand : device blocked\n"));
-		atomic_dec(&cmd->device->iorequest_cnt);
+		percpu_counter_dec(&cmd->device->iorequest_cnt);
 		return SCSI_MLQUEUE_DEVICE_BUSY;
 	}
 
@@ -1647,7 +1647,7 @@ static enum scsi_qc_status scsi_dispatch_cmd(struct scsi_cmnd *cmd)
 	trace_scsi_dispatch_cmd_start(cmd);
 	rtn = host->hostt->queuecommand(host, cmd);
 	if (rtn) {
-		atomic_dec(&cmd->device->iorequest_cnt);
+		percpu_counter_dec(&cmd->device->iorequest_cnt);
 		trace_scsi_dispatch_cmd_error(cmd, rtn);
 		if (rtn != SCSI_MLQUEUE_DEVICE_BUSY &&
 		    rtn != SCSI_MLQUEUE_TARGET_BUSY)
diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
index 121a14d5fdb8..bc885c72f01e 100644
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -350,6 +350,14 @@ static struct scsi_device *scsi_alloc_sdev(struct scsi_target *starget,
 
 	scsi_sysfs_device_initialize(sdev);
 
+	if (percpu_counter_init(&sdev->iorequest_cnt, 0, GFP_KERNEL) ||
+	    percpu_counter_init(&sdev->iodone_cnt, 0, GFP_KERNEL) ||
+	    percpu_counter_init(&sdev->ioerr_cnt, 0, GFP_KERNEL) ||
+	    percpu_counter_init(&sdev->iotmo_cnt, 0, GFP_KERNEL)) {
+		ret = -ENOMEM;
+		goto out_device_destroy;
+	}
+
 	if (scsi_device_is_pseudo_dev(sdev))
 		return sdev;
 
diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index dfc3559e7e04..f652edd16497 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -516,6 +516,10 @@ static void scsi_device_dev_release(struct device *dev)
 	if (vpd_pgb7)
 		kfree_rcu(vpd_pgb7, rcu);
 	kfree(sdev->inquiry);
+	percpu_counter_destroy(&sdev->iotmo_cnt);
+	percpu_counter_destroy(&sdev->ioerr_cnt);
+	percpu_counter_destroy(&sdev->iodone_cnt);
+	percpu_counter_destroy(&sdev->iorequest_cnt);
 	kfree(sdev);
 
 	if (parent)
@@ -936,26 +940,27 @@ static ssize_t
 show_iostat_counterbits(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
-	return snprintf(buf, 20, "%d\n", (int)sizeof(atomic_t) * 8);
+	/* iostat counters are per-CPU sums (s64).  Report width for tools. */
+	return sysfs_emit(buf, "%zu\n", sizeof(s64) * 8);
 }
 
 static DEVICE_ATTR(iocounterbits, S_IRUGO, show_iostat_counterbits, NULL);
 
-#define show_sdev_iostat(field)						\
+#define show_sdev_iostat_percpu(field)					\
 static ssize_t								\
 show_iostat_##field(struct device *dev, struct device_attribute *attr,	\
 		    char *buf)						\
 {									\
 	struct scsi_device *sdev = to_scsi_device(dev);			\
-	unsigned long long count = atomic_read(&sdev->field);		\
-	return snprintf(buf, 20, "0x%llx\n", count);			\
+	unsigned long long count = percpu_counter_sum(&sdev->field);	\
+	return sysfs_emit(buf, "0x%llx\n", count);			\
 }									\
-static DEVICE_ATTR(field, S_IRUGO, show_iostat_##field, NULL)
+static DEVICE_ATTR(field, 0444, show_iostat_##field, NULL)
 
-show_sdev_iostat(iorequest_cnt);
-show_sdev_iostat(iodone_cnt);
-show_sdev_iostat(ioerr_cnt);
-show_sdev_iostat(iotmo_cnt);
+show_sdev_iostat_percpu(iorequest_cnt);
+show_sdev_iostat_percpu(iodone_cnt);
+show_sdev_iostat_percpu(ioerr_cnt);
+show_sdev_iostat_percpu(iotmo_cnt);
 
 static ssize_t
 sdev_show_modalias(struct device *dev, struct device_attribute *attr, char *buf)
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index adc3fa55ca2c..b7ce01de17b3 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -4043,7 +4043,7 @@ static int sd_probe(struct scsi_device *sdp)
 	sdkp->index = index;
 	sdkp->max_retries = SD_MAX_RETRIES;
 	atomic_set(&sdkp->openers, 0);
-	atomic_set(&sdkp->device->ioerr_cnt, 0);
+	percpu_counter_set(&sdkp->device->ioerr_cnt, 0);
 
 	if (!sdp->request_queue->rq_timeout) {
 		if (sdp->type != TYPE_MOD)
diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
index 029f5115b2ea..4be36bf2a475 100644
--- a/include/scsi/scsi_device.h
+++ b/include/scsi/scsi_device.h
@@ -9,6 +9,7 @@
 #include <scsi/scsi.h>
 #include <scsi/scsi_common.h>
 #include <linux/atomic.h>
+#include <linux/percpu_counter.h>
 #include <linux/sbitmap.h>
 
 struct bsg_device;
@@ -272,10 +273,10 @@ struct scsi_device {
 	unsigned int max_device_blocked; /* what device_blocked counts down from  */
 #define SCSI_DEFAULT_DEVICE_BLOCKED	3
 
-	atomic_t iorequest_cnt;
-	atomic_t iodone_cnt;
-	atomic_t ioerr_cnt;
-	atomic_t iotmo_cnt;
+	struct percpu_counter iorequest_cnt;
+	struct percpu_counter iodone_cnt;
+	struct percpu_counter ioerr_cnt;
+	struct percpu_counter iotmo_cnt;
 
 	struct device		sdev_gendev,
 				sdev_dev;
-- 
2.43.7


