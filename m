Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 096A589FBC8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 17:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703376.1099040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rua0P-00087p-OY; Wed, 10 Apr 2024 15:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703376.1099040; Wed, 10 Apr 2024 15:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rua0P-00085V-KQ; Wed, 10 Apr 2024 15:36:57 +0000
Received: by outflank-mailman (input) for mailman id 703376;
 Wed, 10 Apr 2024 15:36:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRyK=LP=localhost=root@srs-se1.protection.inumbo.net>)
 id 1rua0N-0007oC-Q3
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 15:36:56 +0000
Received: from localhost (ip-201.net-81-220-136.rev.numericable.fr
 [81.220.136.201]) by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 278380bc-f750-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 17:36:52 +0200 (CEST)
Received: by localhost (Postfix, from userid 0)
 id A41B0E3204; Wed, 10 Apr 2024 17:36:52 +0200 (CEST)
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
X-Inumbo-ID: 278380bc-f750-11ee-94a3-07e782e9044d
From: Andrei Semenov <andrei.semenov@vates.fr>
To: xen-devel@lists.xenproject.org
Cc: Andrei Semenov <andrei.semenov@vates.fr>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/2] Implemented Amd Secure Processor device driver
Date: Wed, 10 Apr 2024 17:36:37 +0200
Message-Id: <8c9627ef69e8d809efcb93b50fc34474f2b0ba7f.1712759753.git.andrei.semenov@vates.fr>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1712759753.git.andrei.semenov@vates.fr>
References: <cover.1712759753.git.andrei.semenov@vates.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrei Semenov <andrei.semenov@vates.fr>
---
 xen/arch/x86/include/asm/psp-sev.h | 655 +++++++++++++++++++++++
 xen/drivers/Kconfig                |   2 +
 xen/drivers/Makefile               |   1 +
 xen/drivers/crypto/Kconfig         |  10 +
 xen/drivers/crypto/Makefile        |   1 +
 xen/drivers/crypto/asp.c           | 808 +++++++++++++++++++++++++++++
 xen/include/xen/types.h            |   2 +-
 7 files changed, 1478 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/x86/include/asm/psp-sev.h
 create mode 100644 xen/drivers/crypto/Kconfig
 create mode 100644 xen/drivers/crypto/Makefile
 create mode 100644 xen/drivers/crypto/asp.c

diff --git a/xen/arch/x86/include/asm/psp-sev.h b/xen/arch/x86/include/asm/psp-sev.h
new file mode 100644
index 0000000000..3413de41a9
--- /dev/null
+++ b/xen/arch/x86/include/asm/psp-sev.h
@@ -0,0 +1,655 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * AMD Secure Encrypted Virtualization (SEV) driver interface
+ *
+ * Copyright (C) 2016-2017 Advanced Micro Devices, Inc.
+ *
+ * Author: Brijesh Singh <brijesh.singh@amd.com>
+ *
+ * SEV API spec is available at https://developer.amd.com/sev
+ */
+
+#ifndef __PSP_SEV_H__
+#define __PSP_SEV_H__
+
+#include <xen/types.h>
+
+/**
+ * SEV platform and guest management commands
+ */
+enum sev_cmd {
+	/* platform commands */
+	SEV_CMD_INIT			= 0x001,
+	SEV_CMD_SHUTDOWN		= 0x002,
+	SEV_CMD_FACTORY_RESET		= 0x003,
+	SEV_CMD_PLATFORM_STATUS		= 0x004,
+	SEV_CMD_PEK_GEN			= 0x005,
+	SEV_CMD_PEK_CSR			= 0x006,
+	SEV_CMD_PEK_CERT_IMPORT		= 0x007,
+	SEV_CMD_PDH_CERT_EXPORT		= 0x008,
+	SEV_CMD_PDH_GEN			= 0x009,
+	SEV_CMD_DF_FLUSH		= 0x00A,
+	SEV_CMD_DOWNLOAD_FIRMWARE	= 0x00B,
+	SEV_CMD_GET_ID			= 0x00C,
+	SEV_CMD_INIT_EX                 = 0x00D,
+
+	/* Guest commands */
+	SEV_CMD_DECOMMISSION		= 0x020,
+	SEV_CMD_ACTIVATE		= 0x021,
+	SEV_CMD_DEACTIVATE		= 0x022,
+	SEV_CMD_GUEST_STATUS		= 0x023,
+
+	/* Guest launch commands */
+	SEV_CMD_LAUNCH_START		= 0x030,
+	SEV_CMD_LAUNCH_UPDATE_DATA	= 0x031,
+	SEV_CMD_LAUNCH_UPDATE_VMSA	= 0x032,
+	SEV_CMD_LAUNCH_MEASURE		= 0x033,
+	SEV_CMD_LAUNCH_UPDATE_SECRET	= 0x034,
+	SEV_CMD_LAUNCH_FINISH		= 0x035,
+	SEV_CMD_ATTESTATION_REPORT	= 0x036,
+
+	/* Guest migration commands (outgoing) */
+	SEV_CMD_SEND_START		= 0x040,
+	SEV_CMD_SEND_UPDATE_DATA	= 0x041,
+	SEV_CMD_SEND_UPDATE_VMSA	= 0x042,
+	SEV_CMD_SEND_FINISH		= 0x043,
+	SEV_CMD_SEND_CANCEL		= 0x044,
+
+	/* Guest migration commands (incoming) */
+	SEV_CMD_RECEIVE_START		= 0x050,
+	SEV_CMD_RECEIVE_UPDATE_DATA	= 0x051,
+	SEV_CMD_RECEIVE_UPDATE_VMSA	= 0x052,
+	SEV_CMD_RECEIVE_FINISH		= 0x053,
+
+	/* Guest debug commands */
+	SEV_CMD_DBG_DECRYPT		= 0x060,
+	SEV_CMD_DBG_ENCRYPT		= 0x061,
+
+	SEV_CMD_MAX,
+};
+
+/**
+ * struct sev_data_init - INIT command parameters
+ *
+ * @flags: processing flags
+ * @tmr_address: system physical address used for SEV-ES
+ * @tmr_len: len of tmr_address
+ */
+struct sev_data_init {
+	u32 flags;			/* In */
+	u32 reserved;			/* In */
+	u64 tmr_address;		/* In */
+	u32 tmr_len;			/* In */
+} __packed;
+
+/**
+ * struct sev_data_init_ex - INIT_EX command parameters
+ *
+ * @length: len of the command buffer read by the PSP
+ * @flags: processing flags
+ * @tmr_address: system physical address used for SEV-ES
+ * @tmr_len: len of tmr_address
+ * @nv_address: system physical address used for PSP NV storage
+ * @nv_len: len of nv_address
+ */
+struct sev_data_init_ex {
+	u32 length;                     /* In */
+	u32 flags;                      /* In */
+	u64 tmr_address;                /* In */
+	u32 tmr_len;                    /* In */
+	u32 reserved;                   /* In */
+	u64 nv_address;                 /* In/Out */
+	u32 nv_len;                     /* In */
+} __packed;
+
+#define SEV_INIT_FLAGS_SEV_ES	0x01
+
+/**
+ * struct sev_data_pek_csr - PEK_CSR command parameters
+ *
+ * @address: PEK certificate chain
+ * @len: len of certificate
+ */
+struct sev_data_pek_csr {
+	u64 address;				/* In */
+	u32 len;				/* In/Out */
+} __packed;
+
+/**
+ * struct sev_data_cert_import - PEK_CERT_IMPORT command parameters
+ *
+ * @pek_address: PEK certificate chain
+ * @pek_len: len of PEK certificate
+ * @oca_address: OCA certificate chain
+ * @oca_len: len of OCA certificate
+ */
+struct sev_data_pek_cert_import {
+	u64 pek_cert_address;			/* In */
+	u32 pek_cert_len;			/* In */
+	u32 reserved;				/* In */
+	u64 oca_cert_address;			/* In */
+	u32 oca_cert_len;			/* In */
+} __packed;
+
+/**
+ * struct sev_data_download_firmware - DOWNLOAD_FIRMWARE command parameters
+ *
+ * @address: physical address of firmware image
+ * @len: len of the firmware image
+ */
+struct sev_data_download_firmware {
+	u64 address;				/* In */
+	u32 len;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_get_id - GET_ID command parameters
+ *
+ * @address: physical address of region to place unique CPU ID(s)
+ * @len: len of the region
+ */
+struct sev_data_get_id {
+	u64 address;				/* In */
+	u32 len;				/* In/Out */
+} __packed;
+/**
+ * struct sev_data_pdh_cert_export - PDH_CERT_EXPORT command parameters
+ *
+ * @pdh_address: PDH certificate address
+ * @pdh_len: len of PDH certificate
+ * @cert_chain_address: PDH certificate chain
+ * @cert_chain_len: len of PDH certificate chain
+ */
+struct sev_data_pdh_cert_export {
+	u64 pdh_cert_address;			/* In */
+	u32 pdh_cert_len;			/* In/Out */
+	u32 reserved;				/* In */
+	u64 cert_chain_address;			/* In */
+	u32 cert_chain_len;			/* In/Out */
+} __packed;
+
+/**
+ * struct sev_data_decommission - DECOMMISSION command parameters
+ *
+ * @handle: handle of the VM to decommission
+ */
+struct sev_data_decommission {
+	u32 handle;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_activate - ACTIVATE command parameters
+ *
+ * @handle: handle of the VM to activate
+ * @asid: asid assigned to the VM
+ */
+struct sev_data_activate {
+	u32 handle;				/* In */
+	u32 asid;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_deactivate - DEACTIVATE command parameters
+ *
+ * @handle: handle of the VM to deactivate
+ */
+struct sev_data_deactivate {
+	u32 handle;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_guest_status - SEV GUEST_STATUS command parameters
+ *
+ * @handle: handle of the VM to retrieve status
+ * @policy: policy information for the VM
+ * @asid: current ASID of the VM
+ * @state: current state of the VM
+ */
+struct sev_data_guest_status {
+	u32 handle;				/* In */
+	u32 policy;				/* Out */
+	u32 asid;				/* Out */
+	u8 state;				/* Out */
+} __packed;
+
+/**
+ * struct sev_data_launch_start - LAUNCH_START command parameters
+ *
+ * @handle: handle assigned to the VM
+ * @policy: guest launch policy
+ * @dh_cert_address: physical address of DH certificate blob
+ * @dh_cert_len: len of DH certificate blob
+ * @session_address: physical address of session parameters
+ * @session_len: len of session parameters
+ */
+struct sev_data_launch_start {
+	u32 handle;				/* In/Out */
+	u32 policy;				/* In */
+	u64 dh_cert_address;			/* In */
+	u32 dh_cert_len;			/* In */
+	u32 reserved;				/* In */
+	u64 session_address;			/* In */
+	u32 session_len;			/* In */
+} __packed;
+
+/**
+ * struct sev_data_launch_update_data - LAUNCH_UPDATE_DATA command parameter
+ *
+ * @handle: handle of the VM to update
+ * @len: len of memory to be encrypted
+ * @address: physical address of memory region to encrypt
+ */
+struct sev_data_launch_update_data {
+	u32 handle;				/* In */
+	u32 reserved;
+	u64 address;				/* In */
+	u32 len;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_launch_update_vmsa - LAUNCH_UPDATE_VMSA command
+ *
+ * @handle: handle of the VM
+ * @address: physical address of memory region to encrypt
+ * @len: len of memory region to encrypt
+ */
+struct sev_data_launch_update_vmsa {
+	u32 handle;				/* In */
+	u32 reserved;
+	u64 address;				/* In */
+	u32 len;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_launch_measure - LAUNCH_MEASURE command parameters
+ *
+ * @handle: handle of the VM to process
+ * @address: physical address containing the measurement blob
+ * @len: len of measurement blob
+ */
+struct sev_data_launch_measure {
+	u32 handle;				/* In */
+	u32 reserved;
+	u64 address;				/* In */
+	u32 len;				/* In/Out */
+} __packed;
+
+/**
+ * struct sev_data_launch_secret - LAUNCH_SECRET command parameters
+ *
+ * @handle: handle of the VM to process
+ * @hdr_address: physical address containing the packet header
+ * @hdr_len: len of packet header
+ * @guest_address: system physical address of guest memory region
+ * @guest_len: len of guest_paddr
+ * @trans_address: physical address of transport memory buffer
+ * @trans_len: len of transport memory buffer
+ */
+struct sev_data_launch_secret {
+	u32 handle;				/* In */
+	u32 reserved1;
+	u64 hdr_address;			/* In */
+	u32 hdr_len;				/* In */
+	u32 reserved2;
+	u64 guest_address;			/* In */
+	u32 guest_len;				/* In */
+	u32 reserved3;
+	u64 trans_address;			/* In */
+	u32 trans_len;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_launch_finish - LAUNCH_FINISH command parameters
+ *
+ * @handle: handle of the VM to process
+ */
+struct sev_data_launch_finish {
+	u32 handle;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_send_start - SEND_START command parameters
+ *
+ * @handle: handle of the VM to process
+ * @policy: policy information for the VM
+ * @pdh_cert_address: physical address containing PDH certificate
+ * @pdh_cert_len: len of PDH certificate
+ * @plat_certs_address: physical address containing platform certificate
+ * @plat_certs_len: len of platform certificate
+ * @amd_certs_address: physical address containing AMD certificate
+ * @amd_certs_len: len of AMD certificate
+ * @session_address: physical address containing Session data
+ * @session_len: len of session data
+ */
+struct sev_data_send_start {
+	u32 handle;				/* In */
+	u32 policy;				/* Out */
+	u64 pdh_cert_address;			/* In */
+	u32 pdh_cert_len;			/* In */
+	u32 reserved1;
+	u64 plat_certs_address;			/* In */
+	u32 plat_certs_len;			/* In */
+	u32 reserved2;
+	u64 amd_certs_address;			/* In */
+	u32 amd_certs_len;			/* In */
+	u32 reserved3;
+	u64 session_address;			/* In */
+	u32 session_len;			/* In/Out */
+} __packed;
+
+/**
+ * struct sev_data_send_update - SEND_UPDATE_DATA command
+ *
+ * @handle: handle of the VM to process
+ * @hdr_address: physical address containing packet header
+ * @hdr_len: len of packet header
+ * @guest_address: physical address of guest memory region to send
+ * @guest_len: len of guest memory region to send
+ * @trans_address: physical address of host memory region
+ * @trans_len: len of host memory region
+ */
+struct sev_data_send_update_data {
+	u32 handle;				/* In */
+	u32 reserved1;
+	u64 hdr_address;			/* In */
+	u32 hdr_len;				/* In/Out */
+	u32 reserved2;
+	u64 guest_address;			/* In */
+	u32 guest_len;				/* In */
+	u32 reserved3;
+	u64 trans_address;			/* In */
+	u32 trans_len;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_send_update - SEND_UPDATE_VMSA command
+ *
+ * @handle: handle of the VM to process
+ * @hdr_address: physical address containing packet header
+ * @hdr_len: len of packet header
+ * @guest_address: physical address of guest memory region to send
+ * @guest_len: len of guest memory region to send
+ * @trans_address: physical address of host memory region
+ * @trans_len: len of host memory region
+ */
+struct sev_data_send_update_vmsa {
+	u32 handle;				/* In */
+	u64 hdr_address;			/* In */
+	u32 hdr_len;				/* In/Out */
+	u32 reserved2;
+	u64 guest_address;			/* In */
+	u32 guest_len;				/* In */
+	u32 reserved3;
+	u64 trans_address;			/* In */
+	u32 trans_len;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_send_finish - SEND_FINISH command parameters
+ *
+ * @handle: handle of the VM to process
+ */
+struct sev_data_send_finish {
+	u32 handle;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_send_cancel - SEND_CANCEL command parameters
+ *
+ * @handle: handle of the VM to process
+ */
+struct sev_data_send_cancel {
+	u32 handle;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_receive_start - RECEIVE_START command parameters
+ *
+ * @handle: handle of the VM to perform receive operation
+ * @pdh_cert_address: system physical address containing PDH certificate blob
+ * @pdh_cert_len: len of PDH certificate blob
+ * @session_address: system physical address containing session blob
+ * @session_len: len of session blob
+ */
+struct sev_data_receive_start {
+	u32 handle;				/* In/Out */
+	u32 policy;				/* In */
+	u64 pdh_cert_address;			/* In */
+	u32 pdh_cert_len;			/* In */
+	u32 reserved1;
+	u64 session_address;			/* In */
+	u32 session_len;			/* In */
+} __packed;
+
+/**
+ * struct sev_data_receive_update_data - RECEIVE_UPDATE_DATA command parameters
+ *
+ * @handle: handle of the VM to update
+ * @hdr_address: physical address containing packet header blob
+ * @hdr_len: len of packet header
+ * @guest_address: system physical address of guest memory region
+ * @guest_len: len of guest memory region
+ * @trans_address: system physical address of transport buffer
+ * @trans_len: len of transport buffer
+ */
+struct sev_data_receive_update_data {
+	u32 handle;				/* In */
+	u32 reserved1;
+	u64 hdr_address;			/* In */
+	u32 hdr_len;				/* In */
+	u32 reserved2;
+	u64 guest_address;			/* In */
+	u32 guest_len;				/* In */
+	u32 reserved3;
+	u64 trans_address;			/* In */
+	u32 trans_len;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_receive_update_vmsa - RECEIVE_UPDATE_VMSA command parameters
+ *
+ * @handle: handle of the VM to update
+ * @hdr_address: physical address containing packet header blob
+ * @hdr_len: len of packet header
+ * @guest_address: system physical address of guest memory region
+ * @guest_len: len of guest memory region
+ * @trans_address: system physical address of transport buffer
+ * @trans_len: len of transport buffer
+ */
+struct sev_data_receive_update_vmsa {
+	u32 handle;				/* In */
+	u32 reserved1;
+	u64 hdr_address;			/* In */
+	u32 hdr_len;				/* In */
+	u32 reserved2;
+	u64 guest_address;			/* In */
+	u32 guest_len;				/* In */
+	u32 reserved3;
+	u64 trans_address;			/* In */
+	u32 trans_len;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_receive_finish - RECEIVE_FINISH command parameters
+ *
+ * @handle: handle of the VM to finish
+ */
+struct sev_data_receive_finish {
+	u32 handle;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_dbg - DBG_ENCRYPT/DBG_DECRYPT command parameters
+ *
+ * @handle: handle of the VM to perform debug operation
+ * @src_addr: source address of data to operate on
+ * @dst_addr: destination address of data to operate on
+ * @len: len of data to operate on
+ */
+struct sev_data_dbg {
+	u32 handle;				/* In */
+	u32 reserved;
+	u64 src_addr;				/* In */
+	u64 dst_addr;				/* In */
+	u32 len;				/* In */
+} __packed;
+
+/**
+ * struct sev_data_attestation_report - SEV_ATTESTATION_REPORT command parameters
+ *
+ * @handle: handle of the VM
+ * @mnonce: a random nonce that will be included in the report.
+ * @address: physical address where the report will be copied.
+ * @len: length of the physical buffer.
+ */
+struct sev_data_attestation_report {
+	u32 handle;				/* In */
+	u32 reserved;
+	u64 address;				/* In */
+	u8 mnonce[16];				/* In */
+	u32 len;				/* In/Out */
+} __packed;
+
+
+/**
+ * SEV platform commands
+ */
+enum {
+	SEV_FACTORY_RESET = 0,
+	SEV_PLATFORM_STATUS,
+	SEV_PEK_GEN,
+	SEV_PEK_CSR,
+	SEV_PDH_GEN,
+	SEV_PDH_CERT_EXPORT,
+	SEV_PEK_CERT_IMPORT,
+	SEV_GET_ID,	/* This command is deprecated, use SEV_GET_ID2 */
+	SEV_GET_ID2,
+
+	SEV_MAX,
+};
+
+/**
+ * SEV Firmware status code
+ */
+typedef enum {
+	/*
+	 * This error code is not in the SEV spec. Its purpose is to convey that
+	 * there was an error that prevented the SEV firmware from being called.
+	 * The SEV API error codes are 16 bits, so the -1 value will not overlap
+	 * with possible values from the specification.
+	 */
+	SEV_RET_NO_FW_CALL = -1,
+	SEV_RET_SUCCESS = 0,
+	SEV_RET_INVALID_PLATFORM_STATE,
+	SEV_RET_INVALID_GUEST_STATE,
+	SEV_RET_INAVLID_CONFIG,
+	SEV_RET_INVALID_LEN,
+	SEV_RET_ALREADY_OWNED,
+	SEV_RET_INVALID_CERTIFICATE,
+	SEV_RET_POLICY_FAILURE,
+	SEV_RET_INACTIVE,
+	SEV_RET_INVALID_ADDRESS,
+	SEV_RET_BAD_SIGNATURE,
+	SEV_RET_BAD_MEASUREMENT,
+	SEV_RET_ASID_OWNED,
+	SEV_RET_INVALID_ASID,
+	SEV_RET_WBINVD_REQUIRED,
+	SEV_RET_DFFLUSH_REQUIRED,
+	SEV_RET_INVALID_GUEST,
+	SEV_RET_INVALID_COMMAND,
+	SEV_RET_ACTIVE,
+	SEV_RET_HWSEV_RET_PLATFORM,
+	SEV_RET_HWSEV_RET_UNSAFE,
+	SEV_RET_UNSUPPORTED,
+	SEV_RET_INVALID_PARAM,
+	SEV_RET_RESOURCE_LIMIT,
+	SEV_RET_SECURE_DATA_INVALID,
+	SEV_RET_MAX,
+} sev_ret_code;
+
+/**
+ * struct sev_user_data_status - PLATFORM_STATUS command parameters
+ *
+ * @major: major API version
+ * @minor: minor API version
+ * @state: platform state
+ * @flags: platform config flags
+ * @build: firmware build id for API version
+ * @guest_count: number of active guests
+ */
+struct sev_user_data_status {
+	__u8 api_major;				/* Out */
+	__u8 api_minor;				/* Out */
+	__u8 state;				/* Out */
+	__u32 flags;				/* Out */
+	__u8 build;				/* Out */
+	__u32 guest_count;			/* Out */
+} __packed;
+
+#define SEV_STATUS_FLAGS_CONFIG_ES	0x0100
+
+/**
+ * struct sev_user_data_pek_csr - PEK_CSR command parameters
+ *
+ * @address: PEK certificate chain
+ * @length: length of certificate
+ */
+struct sev_user_data_pek_csr {
+	__u64 address;				/* In */
+	__u32 length;				/* In/Out */
+} __packed;
+
+/**
+ * struct sev_user_data_cert_import - PEK_CERT_IMPORT command parameters
+ *
+ * @pek_address: PEK certificate chain
+ * @pek_len: length of PEK certificate
+ * @oca_address: OCA certificate chain
+ * @oca_len: length of OCA certificate
+ */
+struct sev_user_data_pek_cert_import {
+	__u64 pek_cert_address;			/* In */
+	__u32 pek_cert_len;			/* In */
+	__u64 oca_cert_address;			/* In */
+	__u32 oca_cert_len;			/* In */
+} __packed;
+
+/**
+ * struct sev_user_data_pdh_cert_export - PDH_CERT_EXPORT command parameters
+ *
+ * @pdh_address: PDH certificate address
+ * @pdh_len: length of PDH certificate
+ * @cert_chain_address: PDH certificate chain
+ * @cert_chain_len: length of PDH certificate chain
+ */
+struct sev_user_data_pdh_cert_export {
+	__u64 pdh_cert_address;			/* In */
+	__u32 pdh_cert_len;			/* In/Out */
+	__u64 cert_chain_address;		/* In */
+	__u32 cert_chain_len;			/* In/Out */
+} __packed;
+
+/**
+ * struct sev_user_data_get_id - GET_ID command parameters (deprecated)
+ *
+ * @socket1: Buffer to pass unique ID of first socket
+ * @socket2: Buffer to pass unique ID of second socket
+ */
+struct sev_user_data_get_id {
+	__u8 socket1[64];			/* Out */
+	__u8 socket2[64];			/* Out */
+} __packed;
+
+/**
+ * struct sev_user_data_get_id2 - GET_ID command parameters
+ * @address: Buffer to store unique ID
+ * @length: length of the unique ID
+ */
+struct sev_user_data_get_id2 {
+	__u64 address;				/* In */
+	__u32 length;				/* In/Out */
+} __packed;
+
+extern int sev_do_cmd(int cmd, void* data, int *psp_ret, bool poll);
+
+#endif	/* __PSP_SEV_H__ */
diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index db94393f47..190215b5f8 100644
--- a/xen/drivers/Kconfig
+++ b/xen/drivers/Kconfig
@@ -12,6 +12,8 @@ source "drivers/pci/Kconfig"
 
 source "drivers/video/Kconfig"
 
+source "drivers/crypto/Kconfig"
+
 config HAS_VPCI
 	bool
 
diff --git a/xen/drivers/Makefile b/xen/drivers/Makefile
index 2a1ae8ad13..08b70c2825 100644
--- a/xen/drivers/Makefile
+++ b/xen/drivers/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_HAS_VPCI) += vpci/
 obj-$(CONFIG_HAS_PASSTHROUGH) += passthrough/
 obj-$(CONFIG_ACPI) += acpi/
 obj-$(CONFIG_VIDEO) += video/
+obj-$(CONFIG_AMD_SP) += crypto/
diff --git a/xen/drivers/crypto/Kconfig b/xen/drivers/crypto/Kconfig
new file mode 100644
index 0000000000..b37cd50cd7
--- /dev/null
+++ b/xen/drivers/crypto/Kconfig
@@ -0,0 +1,10 @@
+config AMD_SP
+        bool "AMD Secure Processor" if EXPERT
+        depends on X86
+        default n
+        help
+          Enables AMD Secure Processor.
+
+          If your platform includes AMD Secure Processor devices and you are
+          intended to use AMD Secure Virtualization Technology, say Y.
+          If in doubt, say N.
diff --git a/xen/drivers/crypto/Makefile b/xen/drivers/crypto/Makefile
new file mode 100644
index 0000000000..1dda0cdfbb
--- /dev/null
+++ b/xen/drivers/crypto/Makefile
@@ -0,0 +1 @@
+obj-y += asp.o
diff --git a/xen/drivers/crypto/asp.c b/xen/drivers/crypto/asp.c
new file mode 100644
index 0000000000..eb104f342e
--- /dev/null
+++ b/xen/drivers/crypto/asp.c
@@ -0,0 +1,808 @@
+#include <xen/init.h>
+#include <xen/pci.h>
+#include <xen/list.h>
+#include <xen/tasklet.h>
+#include <xen/pci_ids.h>
+#include <xen/delay.h>
+#include <xen/timer.h>
+#include <xen/wait.h>
+#include <xen/smp.h>
+#include <asm/msi.h>
+#include <asm/system.h>
+#include <asm/psp-sev.h>
+
+/*
+TODO:
+-  GLOBAL:
+     - add command line params for tunables
+ - INTERRUPT MODE:
+    - CET shadow stack: adapt #CP handler???
+    - Serialization: must be done by the client? adapt spinlock?
+ */
+
+#define PSP_CAPABILITY_SEV                      (1 << 0)
+#define PSP_CAPABILITY_TEE                      (1 << 1)
+#define PSP_CAPABILITY_PSP_SECURITY_REPORTING   (1 << 7)
+#define PSP_CAPABILITY_PSP_SECURITY_OFFSET      8
+
+#define PSP_INTSTS_CMD_COMPLETE       (1 << 1)
+
+#define SEV_CMDRESP_CMD_MASK          0x7ff0000
+#define SEV_CMDRESP_CMD_SHIFT         16
+#define SEV_CMDRESP_CMD(cmd)          ((cmd) << SEV_CMDRESP_CMD_SHIFT)
+#define SEV_CMDRESP_STS_MASK          0xffff
+#define SEV_CMDRESP_STS(x)            ((x) & SEV_CMDRESP_STS_MASK)
+#define SEV_CMDRESP_RESP              (1 << 31)
+#define SEV_CMDRESP_IOC               (1 << 0)
+
+#define ASP_CMD_BUFF_SIZE    0x1000
+#define SEV_FW_BLOB_MAX_SIZE 0x4000
+
+/*
+ * SEV platform state
+ */
+enum sev_state {
+        SEV_STATE_UNINIT                = 0x0,
+        SEV_STATE_INIT                  = 0x1,
+        SEV_STATE_WORKING               = 0x2,
+        SEV_STATE_MAX
+};
+
+struct sev_vdata {
+    const unsigned int cmdresp_reg;
+    const unsigned int cmdbuff_addr_lo_reg;
+    const unsigned int cmdbuff_addr_hi_reg;
+};
+
+struct psp_vdata {
+    const unsigned short   base_offset;
+    const struct sev_vdata *sev;
+    const unsigned int feature_reg;
+    const unsigned int inten_reg;
+    const unsigned int intsts_reg;
+    const char* name;
+};
+
+static struct sev_vdata sevv1 = {
+    .cmdresp_reg         = 0x10580,     /* C2PMSG_32 */
+    .cmdbuff_addr_lo_reg = 0x105e0,     /* C2PMSG_56 */
+    .cmdbuff_addr_hi_reg = 0x105e4,     /* C2PMSG_57 */
+};
+
+static struct sev_vdata sevv2 = {
+    .cmdresp_reg         = 0x10980,     /* C2PMSG_32 */
+    .cmdbuff_addr_lo_reg = 0x109e0,     /* C2PMSG_56 */
+    .cmdbuff_addr_hi_reg = 0x109e4,     /* C2PMSG_57 */
+};
+
+static struct psp_vdata pspv1 = {
+    .base_offset = PCI_BASE_ADDRESS_2,
+    .sev         = &sevv1,
+    .feature_reg = 0x105fc,     /* C2PMSG_63 */
+    .inten_reg   = 0x10610,     /* P2CMSG_INTEN */
+    .intsts_reg  = 0x10614,     /* P2CMSG_INTSTS */
+    .name = "pspv1",
+};
+
+static struct psp_vdata pspv2 = {
+    .base_offset = PCI_BASE_ADDRESS_2,
+    .sev         = &sevv2,
+    .feature_reg = 0x109fc,     /* C2PMSG_63 */
+    .inten_reg   = 0x10690,     /* P2CMSG_INTEN */
+    .intsts_reg  = 0x10694,     /* P2CMSG_INTSTS */
+    .name = "pspv2",
+};
+
+static struct psp_vdata pspv4 = {
+    .base_offset = PCI_BASE_ADDRESS_2,
+    .sev         = &sevv2,
+    .feature_reg = 0x109fc,     /* C2PMSG_63 */
+    .inten_reg   = 0x10690,     /* P2CMSG_INTEN */
+    .intsts_reg  = 0x10694,     /* P2CMSG_INTSTS */
+    .name = "pspv4",
+};
+
+static struct psp_vdata pspv6 = {
+    .base_offset =  PCI_BASE_ADDRESS_2,
+    .sev         = &sevv2,
+    .feature_reg = 0x109fc,     /* C2PMSG_63 */
+    .inten_reg   = 0x10510,     /* P2CMSG_INTEN */
+    .intsts_reg  = 0x10514,     /* P2CMSG_INTSTS */
+    .name = "pspv6",
+};
+
+struct amd_sp_dev
+{
+    struct list_head list;
+    struct pci_dev   *pdev;
+    struct  psp_vdata *vdata;
+    void    *io_base;
+    paddr_t io_pbase;
+    size_t  io_size;
+    int     irq;
+    int     state;
+    void* cmd_buff;
+    uint32_t cbuff_pa_low;
+    uint32_t cbuff_pa_high;
+    unsigned int capability;
+    uint8_t api_major;
+    uint8_t api_minor;
+    uint8_t build;
+    int     intr_rcvd;
+    int     cmd_timeout;
+    struct timer cmd_timer;
+    struct waitqueue_head cmd_in_progress;
+};
+
+LIST_HEAD(amd_sp_units);
+#define for_each_sp_unit(sp) \
+    list_for_each_entry(sp, &amd_sp_units, list)
+
+static spinlock_t _sp_cmd_lock = SPIN_LOCK_UNLOCKED;
+
+static struct amd_sp_dev *amd_sp_master;
+
+static void do_sp_irq(void *data);
+static DECLARE_SOFTIRQ_TASKLET(sp_irq_tasklet, do_sp_irq, NULL);
+
+static bool force_sync = false;
+static unsigned int asp_timeout_val = 30000;
+static unsigned long long asp_sync_delay = 100ULL;
+static int asp_sync_tries = 10;
+
+static void sp_cmd_lock(void)
+{
+    spin_lock(&_sp_cmd_lock);
+}
+
+static void sp_cmd_unlock(void)
+{
+    spin_unlock(&_sp_cmd_lock);
+}
+
+static int sev_cmd_buffer_len(int cmd)
+{
+    switch (cmd) {
+        case SEV_CMD_INIT:                      return sizeof(struct sev_data_init);
+        case SEV_CMD_INIT_EX:                   return sizeof(struct sev_data_init_ex);
+        case SEV_CMD_PLATFORM_STATUS:           return sizeof(struct sev_user_data_status);
+        case SEV_CMD_PEK_CSR:                   return sizeof(struct sev_data_pek_csr);
+        case SEV_CMD_PEK_CERT_IMPORT:           return sizeof(struct sev_data_pek_cert_import);
+        case SEV_CMD_PDH_CERT_EXPORT:           return sizeof(struct sev_data_pdh_cert_export);
+        case SEV_CMD_LAUNCH_START:              return sizeof(struct sev_data_launch_start);
+        case SEV_CMD_LAUNCH_UPDATE_DATA:        return sizeof(struct sev_data_launch_update_data);
+        case SEV_CMD_LAUNCH_UPDATE_VMSA:        return sizeof(struct sev_data_launch_update_vmsa);
+        case SEV_CMD_LAUNCH_FINISH:             return sizeof(struct sev_data_launch_finish);
+        case SEV_CMD_LAUNCH_MEASURE:            return sizeof(struct sev_data_launch_measure);
+        case SEV_CMD_ACTIVATE:                  return sizeof(struct sev_data_activate);
+        case SEV_CMD_DEACTIVATE:                return sizeof(struct sev_data_deactivate);
+        case SEV_CMD_DECOMMISSION:              return sizeof(struct sev_data_decommission);
+        case SEV_CMD_GUEST_STATUS:              return sizeof(struct sev_data_guest_status);
+        case SEV_CMD_DBG_DECRYPT:               return sizeof(struct sev_data_dbg);
+        case SEV_CMD_DBG_ENCRYPT:               return sizeof(struct sev_data_dbg);
+        case SEV_CMD_SEND_START:                return sizeof(struct sev_data_send_start);
+        case SEV_CMD_SEND_UPDATE_DATA:          return sizeof(struct sev_data_send_update_data);
+        case SEV_CMD_SEND_UPDATE_VMSA:          return sizeof(struct sev_data_send_update_vmsa);
+        case SEV_CMD_SEND_FINISH:               return sizeof(struct sev_data_send_finish);
+        case SEV_CMD_RECEIVE_START:             return sizeof(struct sev_data_receive_start);
+        case SEV_CMD_RECEIVE_FINISH:            return sizeof(struct sev_data_receive_finish);
+        case SEV_CMD_RECEIVE_UPDATE_DATA:       return sizeof(struct sev_data_receive_update_data);
+        case SEV_CMD_RECEIVE_UPDATE_VMSA:       return sizeof(struct sev_data_receive_update_vmsa);
+        case SEV_CMD_LAUNCH_UPDATE_SECRET:      return sizeof(struct sev_data_launch_secret);
+        case SEV_CMD_DOWNLOAD_FIRMWARE:         return sizeof(struct sev_data_download_firmware);
+        case SEV_CMD_GET_ID:                    return sizeof(struct sev_data_get_id);
+        case SEV_CMD_ATTESTATION_REPORT:        return sizeof(struct sev_data_attestation_report);
+        case SEV_CMD_SEND_CANCEL:               return sizeof(struct sev_data_send_cancel);
+        default:                                return 0;
+    }
+
+    return 0;
+}
+
+static void invalidate_cache(void *unused)
+{
+    wbinvd();
+}
+
+int _sev_do_cmd(struct amd_sp_dev *sp, int cmd, void *data, int *psp_ret)
+{
+    unsigned int cbuff_pa_low, cbuff_pa_high, cmd_val;
+    int buf_len, cmdresp, rc;
+
+
+    buf_len = sev_cmd_buffer_len(cmd);
+
+
+    if ( data )
+        memcpy(sp->cmd_buff, data, buf_len);
+
+    cbuff_pa_low  = data ? sp->cbuff_pa_low : 0;
+    cbuff_pa_high = data ? sp->cbuff_pa_high : 0;
+
+    writel(cbuff_pa_low, sp->io_base + sp->vdata->sev->cmdbuff_addr_lo_reg);
+    writel(cbuff_pa_high, sp->io_base + sp->vdata->sev->cmdbuff_addr_hi_reg);
+
+    cmd_val = SEV_CMDRESP_CMD(cmd) | SEV_CMDRESP_IOC;
+
+    sp->cmd_timeout = 0;
+    sp->intr_rcvd = 0;
+
+    writel(cmd_val, sp->io_base + sp->vdata->sev->cmdresp_reg);
+
+    set_timer(&sp->cmd_timer,  NOW() + MILLISECS(asp_timeout_val));
+
+    /* FIXME: If the timer triggers here the device will be set offline */
+
+    wait_event(sp->cmd_in_progress, sp->cmd_timeout || sp->intr_rcvd);
+
+    stop_timer(&sp->cmd_timer);
+
+    if ( sp->intr_rcvd )
+    {
+        cmdresp = readl(sp->io_base + sp->vdata->sev->cmdresp_reg);
+
+	ASSERT(cmdresp & SEV_CMDRESP_RESP);
+
+        rc = SEV_CMDRESP_STS(cmdresp) ? -EFAULT : 0;
+
+	if ( rc && psp_ret )
+            *psp_ret = SEV_CMDRESP_STS(cmdresp);
+
+	if ( data && (!rc) )
+	    memcpy(data, sp->cmd_buff, buf_len);
+    }
+    else
+    {
+        ASSERT(sp->cmd_timeout);
+
+        sp->state = SEV_STATE_UNINIT;
+
+        writel(0, sp->io_base + sp->vdata->inten_reg);
+
+        rc = -EIO;
+    }
+    return rc;
+}
+
+static int _sev_do_cmd_sync(struct amd_sp_dev *sp, int cmd, void *data, int *psp_ret)
+{
+    unsigned int cbuff_pa_low, cbuff_pa_high, cmd_val;
+    int buf_len, cmdresp, rc, i;
+
+    buf_len = sev_cmd_buffer_len(cmd);
+
+    if ( data )
+        memcpy(sp->cmd_buff, data, buf_len);
+
+    cbuff_pa_low  = data ? sp->cbuff_pa_low : 0;
+    cbuff_pa_high = data ? sp->cbuff_pa_high : 0;
+
+    writel(cbuff_pa_low, sp->io_base + sp->vdata->sev->cmdbuff_addr_lo_reg);
+    writel(cbuff_pa_high, sp->io_base + sp->vdata->sev->cmdbuff_addr_hi_reg);
+
+    cmd_val = SEV_CMDRESP_CMD(cmd);
+
+    writel(cmd_val, sp->io_base + sp->vdata->sev->cmdresp_reg);
+
+    for (rc = -EIO, i = asp_sync_tries; i; i-- )
+    {
+
+	mdelay(asp_sync_delay);
+
+	cmdresp = readl(sp->io_base + sp->vdata->sev->cmdresp_reg);
+	if ( cmdresp & SEV_CMDRESP_RESP )
+	{
+	    rc = 0;
+	    break;
+	}
+    }
+
+    if ( !rc && SEV_CMDRESP_STS(cmdresp) )
+	rc = -EFAULT;
+
+    if ( rc &&  psp_ret )
+        *psp_ret = SEV_CMDRESP_STS(cmdresp);
+
+    if ( data && (!rc) )
+        memcpy(data, sp->cmd_buff, buf_len);
+
+    return rc;
+}
+
+int sev_do_cmd(int cmd, void *data, int *psp_ret, bool poll)
+{
+    struct amd_sp_dev *sp  = amd_sp_master;
+    int buf_len, rc;
+
+    if ( !sp )
+	return -ENODEV;
+
+    if ( sp->state < SEV_STATE_INIT )
+        return -ENODEV;
+
+    if ( cmd >= SEV_CMD_MAX )
+        return -EINVAL;
+
+    buf_len = sev_cmd_buffer_len(cmd);
+
+    if ( !data != !buf_len )
+        return -EINVAL;
+
+    if ( force_sync || poll )
+    {
+	sp_cmd_lock();
+	rc = _sev_do_cmd_sync(sp, cmd, data, psp_ret);
+	sp_cmd_unlock();
+    }
+    else
+    {
+	rc = _sev_do_cmd(sp, cmd, data, psp_ret);
+    }
+
+    return rc;
+}
+
+static void do_sp_cmd_timer(void *data)
+{
+    struct amd_sp_dev *sp = (struct amd_sp_dev*)data;
+
+    sp->cmd_timeout = 1;
+    wake_up_nr(&sp->cmd_in_progress, 1);
+}
+
+static void do_sp_irq(void *data)
+{
+    struct amd_sp_dev *sp;
+
+    for_each_sp_unit(sp) {
+	uint32_t cmdresp = readl(sp->io_base + sp->vdata->sev->cmdresp_reg);
+	if ( cmdresp & SEV_CMDRESP_RESP )
+	{
+	    sp->intr_rcvd = 1;
+	    wake_up_nr(&sp->cmd_in_progress, 1);
+	}
+    }
+}
+
+static void sp_interrupt_handler(int irq, void *dev_id)
+{
+    struct amd_sp_dev *sp = (struct amd_sp_dev*)dev_id;
+    uint32_t status;
+
+    status = readl(sp->io_base + sp->vdata->intsts_reg);
+    writel(status, sp->io_base + sp->vdata->intsts_reg);
+
+    if ( status & PSP_INTSTS_CMD_COMPLETE )
+	    tasklet_schedule(&sp_irq_tasklet);
+}
+
+static int __init sp_get_capability(struct amd_sp_dev *sp)
+{
+    uint32_t val = readl(sp->io_base + sp->vdata->feature_reg);
+
+    if ( (val == 0xffffffff) || (!(val & PSP_CAPABILITY_SEV)) )
+        return -ENODEV;
+
+    sp->capability = val;
+
+    return 0;
+}
+
+static int __init sp_get_state(struct amd_sp_dev *sp, int *state, int *err)
+{
+    struct sev_user_data_status status;
+    int rc;
+
+    rc = _sev_do_cmd_sync(sp, SEV_CMD_PLATFORM_STATUS, &status, err);
+    if ( rc )
+        return rc;
+
+    *state     = status.state;
+
+    return 0;
+}
+
+static int __init sp_get_api_version(struct amd_sp_dev *sp)
+{
+    struct sev_user_data_status status;
+    int err, rc;
+
+    rc = _sev_do_cmd_sync(sp, SEV_CMD_PLATFORM_STATUS, &status, &err);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "asp-%pp: can't get API version (%d 0x%x)\n",
+                &sp->pdev->sbdf, rc, err);
+        return rc;
+    }
+
+    sp->api_major = status.api_major;
+    sp->api_minor = status.api_minor;
+    sp->state     = status.state;
+
+    return 0;
+}
+
+static int __init sp_update_firmware(struct amd_sp_dev *sp)
+{
+        /*
+         * FIXME: nothing to do for now
+         */
+    return 0;
+}
+
+static int __init sp_alloc_special_regions(struct amd_sp_dev *sp)
+{
+        /*
+         * FIXME: allocate TMP memory area for SEV-ES
+         */
+    return 0;
+}
+
+static int __init sp_do_init(struct amd_sp_dev *sp)
+{
+    struct sev_data_init data;
+    int err, rc;
+
+    if ( sp->state == SEV_STATE_INIT )
+        return 0;
+
+    memset(&data, 0, sizeof(data));
+
+    rc = _sev_do_cmd_sync(sp, SEV_CMD_INIT, &data, &err);
+    if ( rc )
+        dprintk(XENLOG_ERR, "asp-%pp: can't init device: (%d 0x%x)\n", &sp->pdev->sbdf, rc, err);
+
+    return 0;
+}
+
+static int __init sp_df_flush(struct amd_sp_dev *sp)
+{
+    int rc, err;
+
+    rc = _sev_do_cmd_sync(sp, SEV_CMD_DF_FLUSH, NULL, &err);
+    if ( rc )
+        dprintk(XENLOG_ERR, "asp-%pp: can't flush device: (%d 0x%x)\n", &sp->pdev->sbdf, rc, err);
+
+    return 0;
+}
+
+static int __init sp_dev_init(struct amd_sp_dev *sp)
+{
+    int err, rc;
+
+    rc = sp_get_capability(sp);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "asp-%pp: capability is broken %d\n",
+		&sp->pdev->sbdf, rc);
+        return rc;
+    }
+
+    rc = sp_get_api_version(sp);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "asp-%pp: can't get API version %d\n",
+		&sp->pdev->sbdf, rc);
+        return rc;
+    }
+
+    rc = sp_update_firmware(sp);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "asp-%pp: can't update firmware %d\n",
+		&sp->pdev->sbdf, rc);
+        return rc;
+    }
+
+    rc = sp_alloc_special_regions(sp);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "asp-%pp: can't alloc special regions %d\n",
+		&sp->pdev->sbdf, rc);
+        return rc;
+    }
+
+    rc = sp_do_init(sp);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "asp-%pp: can't init device %d\n", &sp->pdev->sbdf,
+		rc);
+        return rc;
+    }
+
+    on_each_cpu(invalidate_cache, NULL, 1);
+
+    rc = sp_df_flush(sp);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "asp-%pp: can't flush %d\n", &sp->pdev->sbdf, rc);
+        return rc;
+    }
+
+    rc = sp_get_state(sp, &sp->state, &err);
+    if ( rc )
+        dprintk(XENLOG_ERR, "asp-%pp: can't get sate %d\n", &sp->pdev->sbdf,rc);
+
+
+    if ( sp->state != SEV_STATE_INIT )
+    {
+        dprintk(XENLOG_ERR, "asp-%pp: device is not inited 0x%x\n",
+		&sp->pdev->sbdf, sp->state);
+        return rc;
+    }
+
+    printk(XENLOG_INFO "inited asp-%pp device\n", &sp->pdev->sbdf);
+    return 0;
+}
+
+static int __init sp_init_irq(struct amd_sp_dev *sp)
+{
+    int irq, rc;
+    struct msi_info minfo;
+    struct msi_desc *mdesc;
+
+    /* Disable and clear interrupts until ready */
+    writel(0, sp->io_base + sp->vdata->inten_reg);
+    writel(-1, sp->io_base + sp->vdata->intsts_reg);
+
+    irq = create_irq(0, false);
+    if ( !irq )
+    {
+        dprintk(XENLOG_ERR, "asp-%pp: can't create interrupt\n", &sp->pdev->sbdf);
+        return -EBUSY;
+    }
+
+    minfo.sbdf = sp->pdev->sbdf;
+    minfo.irq  = irq;
+    minfo.entry_nr = 1;
+    if ( pci_find_cap_offset(sp->pdev->sbdf, PCI_CAP_ID_MSI) )
+        minfo.table_base = 0;
+    else {
+        dprintk(XENLOG_ERR, "asp-%pp: only MSI is handled\n", &sp->pdev->sbdf);
+        return -EINVAL;
+    }
+
+    mdesc = NULL;
+
+    pcidevs_lock();
+
+    rc = pci_enable_msi(sp->pdev, &minfo, &mdesc);
+    if ( !rc )
+    {
+        struct irq_desc *idesc = irq_to_desc(irq);
+        unsigned long flags;
+
+        spin_lock_irqsave(&idesc->lock, flags);
+        rc = setup_msi_irq(idesc, mdesc);
+        spin_unlock_irqrestore(&idesc->lock, flags);
+        if ( rc ) {
+            pci_disable_msi(mdesc);
+	    dprintk(XENLOG_ERR, "asp-%pp: can't setup msi %d\n", &sp->pdev->sbdf, rc);
+	}
+    }
+
+    pcidevs_unlock();
+
+    if ( rc)
+    {
+        if ( mdesc )
+            msi_free_irq(mdesc);
+	else
+            destroy_irq(irq);
+        return rc;
+
+    }
+
+    rc = request_irq(irq, 0, sp_interrupt_handler, "amd_sp", sp);
+
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "asp-%pp: can't request interrupt %d\n", &sp->pdev->sbdf, rc);
+        return rc;
+    }
+
+    sp->irq = irq;
+
+        /* Enable interrupts */
+    writel(-1, sp->io_base + sp->vdata->inten_reg);
+
+    return 0;
+}
+
+static int __init sp_map_iomem(struct amd_sp_dev *sp)
+{
+    uint32_t base_low;
+    uint32_t base_high;
+    uint16_t cmd;
+    size_t   size;
+    bool     high_space;
+
+    base_low = pci_conf_read32(sp->pdev->sbdf, sp->vdata->base_offset);
+
+    if ( (base_low & PCI_BASE_ADDRESS_SPACE) != PCI_BASE_ADDRESS_SPACE_MEMORY )
+        return -EINVAL;
+
+    if ( (base_low & PCI_BASE_ADDRESS_MEM_TYPE_MASK) == PCI_BASE_ADDRESS_MEM_TYPE_64 )
+    {
+        base_high = pci_conf_read32(sp->pdev->sbdf, sp->vdata->base_offset + 4);
+        high_space = true;
+    } else {
+        base_high = 0;
+        high_space = false;
+    }
+
+    sp->io_pbase = ((paddr_t)base_high << 32) | (base_low & PCI_BASE_ADDRESS_MEM_MASK);
+    ASSERT(sp->io_pbase);
+
+    pci_conf_write32(sp->pdev->sbdf, sp->vdata->base_offset, 0xFFFFFFFF);
+
+    if ( high_space ) {
+        pci_conf_write32(sp->pdev->sbdf, sp->vdata->base_offset + 4, 0xFFFFFFFF);
+        size = (size_t)pci_conf_read32(sp->pdev->sbdf, sp->vdata->base_offset + 4) << 32;
+    } else
+        size = ~0xffffffffUL;
+
+    size |= pci_conf_read32(sp->pdev->sbdf, sp->vdata->base_offset);
+    sp->io_size = ~(size & PCI_BASE_ADDRESS_MEM_MASK) + 1;
+
+    pci_conf_write32(sp->pdev->sbdf, sp->vdata->base_offset, base_low);
+
+    if ( high_space )
+          pci_conf_write32(sp->pdev->sbdf, sp->vdata->base_offset + 4, base_high);
+
+    cmd = pci_conf_read16(sp->pdev->sbdf, PCI_COMMAND);
+    pci_conf_write16(sp->pdev->sbdf, PCI_COMMAND, cmd | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
+
+    sp->io_base = ioremap(sp->io_pbase, sp->io_size);
+    if ( !sp->io_base )
+        return -EFAULT;
+
+    if ( pci_ro_device(0, sp->pdev->bus, sp->pdev->devfn) )
+    {
+	dprintk(XENLOG_ERR, "asp-%pp: can't hide PCI device\n",&sp->pdev->sbdf);
+	return -EFAULT;
+    }
+
+    return 0;
+}
+
+static int  __init sp_dev_create(struct pci_dev *pdev, struct psp_vdata *vdata)
+{
+    struct amd_sp_dev *sp;
+    int rc;
+
+    sp = xzalloc(struct amd_sp_dev);
+    if ( !sp )
+        return -ENOMEM;
+
+    sp->pdev = pdev;
+    sp->vdata = vdata;
+    sp->state = SEV_STATE_UNINIT;
+
+    init_timer(&sp->cmd_timer, do_sp_cmd_timer, (void*)sp, 0);
+
+    init_waitqueue_head(&sp->cmd_in_progress);
+
+    rc = sp_map_iomem(sp);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "asp-%pp: can't map iomem %d\n", &sp->pdev->sbdf, rc);
+        return rc;
+    }
+
+    rc = sp_init_irq(sp);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "asp-%pp: can't init irq %d\n", &sp->pdev->sbdf, rc);
+        return rc;
+    }
+
+    sp->cmd_buff = alloc_xenheap_pages(get_order_from_bytes(ASP_CMD_BUFF_SIZE), 0);
+    if ( !sp->cmd_buff )
+    {
+        dprintk(XENLOG_ERR, "asp-%pp: can't allocate cmd buffer\n", &sp->pdev->sbdf);
+        return -ENOMEM;
+    }
+
+    sp->cbuff_pa_low = (uint32_t)(__pa(sp->cmd_buff));
+    sp->cbuff_pa_high = (uint32_t)(__pa(sp->cmd_buff) >> 32);
+
+    list_add(&sp->list, &amd_sp_units);
+
+    amd_sp_master = sp;
+
+    printk(XENLOG_INFO "discovered asp-%pp device\n", &sp->pdev->sbdf);
+
+    return 0;
+}
+
+static void sp_dev_destroy(struct amd_sp_dev* sp)
+{
+    if( sp->io_base )
+	writel(0, sp->io_base + sp->vdata->inten_reg);
+
+    if ( sp->cmd_buff )
+	free_xenheap_pages(sp->cmd_buff, get_order_from_bytes(ASP_CMD_BUFF_SIZE));
+
+    xfree(sp);
+}
+
+static void sp_devs_destroy(void)
+{
+    struct amd_sp_dev *sp, *next;
+
+    list_for_each_entry_safe ( sp, next, &amd_sp_units, list)
+    {
+        list_del(&sp->list);
+        sp_dev_destroy(sp);
+    }
+}
+
+static int __init amd_sp_probe(void)
+{
+    int bus = 0, devfn = 0, rc;
+    struct  amd_sp_dev *sp;
+
+     if ( !boot_cpu_has(X86_FEATURE_SEV) )
+     {
+	 dprintk(XENLOG_INFO, "AMD SEV isn't supported on the platform\n");
+	 return 0;
+     }
+
+     if ( boot_cpu_has(X86_FEATURE_XEN_SHSTK) )
+     {
+	 force_sync = true;
+
+	 dprintk(XENLOG_INFO,"AMD SEV: CET-SS detected - sync mode forced\n");
+     }
+
+    for ( bus = 0; bus < 256; ++bus )
+        for ( devfn = 0; devfn < 256; ++devfn )
+        {
+            struct pci_dev *pdev;
+            pcidevs_lock();
+            pdev = pci_get_pdev(NULL, PCI_SBDF(0, bus, devfn));
+            pcidevs_unlock();
+
+            if ( !pdev || pci_conf_read16(pdev->sbdf, PCI_VENDOR_ID) !=
+                 PCI_VENDOR_ID_AMD )
+                continue;
+
+            switch ( pci_conf_read16(pdev->sbdf, PCI_DEVICE_ID) )
+            {
+            case 0x1456:
+                rc = sp_dev_create(pdev, &pspv1);
+                break;
+            case 0x1486:
+                rc = sp_dev_create(pdev, &pspv2);
+                break;
+            case 0x14CA:
+                rc = sp_dev_create(pdev, &pspv4);
+                break;
+            case 0x156E:
+                rc = sp_dev_create(pdev, &pspv6);
+                break;
+            default:
+                rc = 0;
+                break;
+            }
+            if ( rc ) {
+                goto err;
+            }
+        }
+
+    for_each_sp_unit(sp)
+    {
+        rc = sp_dev_init(sp);
+        if ( rc )
+            goto err;
+    }
+
+    return 0;
+
+  err:
+    sp_devs_destroy();
+    return rc;
+}
+
+__initcall(amd_sp_probe);
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 449947b353..f7599845fd 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -6,7 +6,7 @@
 
 /* Linux inherited types which are being phased out */
 typedef int8_t s8;
-typedef uint8_t u8;
+typedef uint8_t u8, __u8;
 typedef int16_t s16;
 typedef uint16_t u16, __u16;
 typedef int32_t s32;
-- 
2.35.3


