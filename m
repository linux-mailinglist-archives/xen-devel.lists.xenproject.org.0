Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8923FC7604E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 20:14:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167748.1494057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMA6W-0001Ei-U2; Thu, 20 Nov 2025 19:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167748.1494057; Thu, 20 Nov 2025 19:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMA6W-00015B-LL; Thu, 20 Nov 2025 19:14:04 +0000
Received: by outflank-mailman (input) for mailman id 1167748;
 Thu, 20 Nov 2025 19:14:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r49+=54=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMA6U-0006n7-4o
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 19:14:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10ef0766-c645-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 20:13:59 +0100 (CET)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-182-ME6oTu6fO--Wx6qmpcJOoA-1; Thu,
 20 Nov 2025 14:13:53 -0500
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A4FD119560AD; Thu, 20 Nov 2025 19:13:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 95B8C30044DC; Thu, 20 Nov 2025 19:13:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 40B4921E6A27; Thu, 20 Nov 2025 20:13:39 +0100 (CET)
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
X-Inumbo-ID: 10ef0766-c645-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763666038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8GWkD4F3bUuv8Q1P0X31rBekH0EimGqSmOdrumSZaFU=;
	b=SjNrM7ByFKDgbHPpKoGEnEeY/IXXjEr1hsGRWpzp9dHN342zy6u3T16WqInL8TWNQLXHkJ
	glQIzQcbfnYKgH6fyjVaRwmrPSVXXHCIUrvVy+GZWVrZcV3wk812uJqplxJAiM03zOvJbH
	XXrBDwHjuAAHApDZIsJhhOHSLRMw97s=
X-MC-Unique: ME6oTu6fO--Wx6qmpcJOoA-1
X-Mimecast-MFC-AGG-ID: ME6oTu6fO--Wx6qmpcJOoA_1763666024
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com,
	pizhenwei@bytedance.com,
	alistair.francis@wdc.com,
	stefanb@linux.vnet.ibm.com,
	kwolf@redhat.com,
	hreitz@redhat.com,
	sw@weilnetz.de,
	qemu_oss@crudebyte.com,
	groug@kaod.org,
	mst@redhat.com,
	imammedo@redhat.com,
	anisinha@redhat.com,
	kraxel@redhat.com,
	shentey@gmail.com,
	npiggin@gmail.com,
	harshpb@linux.ibm.com,
	sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	edgar.iglesias@gmail.com,
	elena.ufimtseva@oracle.com,
	jag.raman@oracle.com,
	sgarzare@redhat.com,
	pbonzini@redhat.com,
	fam@euphon.net,
	philmd@linaro.org,
	alex@shazbot.org,
	clg@redhat.com,
	peterx@redhat.com,
	farosas@suse.de,
	lizhijian@fujitsu.com,
	dave@treblig.org,
	jasowang@redhat.com,
	samuel.thibault@ens-lyon.org,
	michael.roth@amd.com,
	kkostiuk@redhat.com,
	zhao1.liu@intel.com,
	mtosatti@redhat.com,
	rathc@linux.ibm.com,
	palmer@dabbelt.com,
	liwei1518@gmail.com,
	dbarboza@ventanamicro.com,
	zhiwei_liu@linux.alibaba.com,
	marcandre.lureau@redhat.com,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 00/14] Error message improvements
Date: Thu, 20 Nov 2025 20:13:25 +0100
Message-ID: <20251120191339.756429-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Markus Armbruster (14):
  error: Strip trailing '\n' from error string arguments (again)
  hw/usb: Use error_setg_file_open() for a better error message
  tap-solaris: Use error_setg_file_open() for better error messages
  qga: Use error_setg_file_open() for better error messages
  hw/scsi: Use error_setg_file_open() for a better error message
  hw/virtio: Use error_setg_file_open() for a better error message
  net/tap: Use error_setg_file_open() for a better error message
  blkdebug: Use error_setg_file_open() for a better error message
  error: Use error_setg_file_open() for simplicity and consistency
  net/slirp: Improve file open error message
  error: Use error_setg_errno() to improve error messages
  error: Use error_setg_errno() for simplicity and consistency
  qga/commands-win32: Use error_setg_win32() for better error messages
  block/file-win32: Improve an error message

 backends/cryptodev-lkcf.c   |  2 +-
 backends/spdm-socket.c      |  4 ++--
 backends/tpm/tpm_emulator.c | 13 +++++--------
 block/blkdebug.c            |  2 +-
 block/file-win32.c          |  2 +-
 hw/9pfs/9p-local.c          |  2 +-
 hw/9pfs/9p.c                |  3 +--
 hw/acpi/core.c              |  5 ++---
 hw/audio/es1370.c           |  2 +-
 hw/core/loader.c            |  2 +-
 hw/intc/openpic_kvm.c       |  3 +--
 hw/intc/xics_kvm.c          |  5 +++--
 hw/pci-host/xen_igd_pt.c    |  2 +-
 hw/ppc/spapr.c              |  6 +++---
 hw/remote/vfio-user-obj.c   | 18 +++++++++---------
 hw/scsi/vhost-scsi.c        |  3 +--
 hw/sensor/emc141x.c         |  4 ++--
 hw/sensor/tmp421.c          |  4 ++--
 hw/smbios/smbios.c          |  4 ++--
 hw/usb/bus.c                |  2 +-
 hw/vfio/migration-multifd.c |  5 +++--
 hw/virtio/vdpa-dev.c        |  4 ++--
 hw/virtio/vhost-vsock.c     |  3 +--
 migration/postcopy-ram.c    | 10 +++++-----
 migration/rdma.c            |  3 +--
 monitor/hmp-cmds-target.c   |  2 +-
 net/dump.c                  |  2 +-
 net/l2tpv3.c                |  6 ++----
 net/slirp.c                 |  9 ++++++---
 net/tap-bsd.c               |  6 +++---
 net/tap-linux.c             |  2 +-
 net/tap-solaris.c           |  6 +++---
 net/tap.c                   |  3 +--
 qga/commands-linux.c        | 11 ++++++-----
 qga/commands-posix-ssh.c    | 23 +++++++++++++----------
 qga/commands-win32.c        | 16 ++++++++--------
 system/vl.c                 |  2 +-
 target/i386/sev.c           |  6 ++----
 target/ppc/kvm.c            |  5 ++---
 target/riscv/kvm/kvm-cpu.c  | 11 ++++++-----
 ui/gtk.c                    |  2 +-
 ui/ui-qmp-cmds.c            |  3 +--
 util/vfio-helpers.c         |  5 ++---
 43 files changed, 113 insertions(+), 120 deletions(-)

-- 
2.49.0


