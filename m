Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FFA875110
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 14:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689924.1075416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riEEb-0008W6-Sr; Thu, 07 Mar 2024 13:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689924.1075416; Thu, 07 Mar 2024 13:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riEEb-0008TB-QG; Thu, 07 Mar 2024 13:56:33 +0000
Received: by outflank-mailman (input) for mailman id 689924;
 Thu, 07 Mar 2024 13:56:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xW6h=KN=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riEEZ-0008T0-Sv
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 13:56:31 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ecb0847-dc8a-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 14:56:29 +0100 (CET)
Received: from SJ0PR13CA0138.namprd13.prod.outlook.com (2603:10b6:a03:2c6::23)
 by CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 7 Mar
 2024 13:56:23 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::1c) by SJ0PR13CA0138.outlook.office365.com
 (2603:10b6:a03:2c6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.8 via Frontend
 Transport; Thu, 7 Mar 2024 13:56:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 13:56:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 07:56:21 -0600
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 07:56:20 -0600
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
X-Inumbo-ID: 7ecb0847-dc8a-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyQ4q3jfixL9gdKLG6NBP4HiurWtUXx2Bl5GbNvqXMcA0ktHPLL+CHfFGMSPzTHvuVpFrxPU/WO6FCt0KfbdFuDV5yJ44KWZBqC697SCxkRUN1gABQHJULSA9f5hbh/jSb2q66KcOxpr60XnhRo1wd23pAPw0tXAbS+7+K02mjkmdXMTK5Fu+ngussSyCqaZ5SaKiO9wg1sWWmAXkzJosY0SDBCyGVG6Z+IAJYzTodAPlXMr+WVmwaTv4ORXG3xHeOBV8REwnYaLQScER96E+2XathxgAyX6fwGyUR5FsEQcSY8EtJDaP3d2HUF43VRrjohk6k2BqluimXoM+LkJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwMVbPg4+WKCy5F7bQxVc2/fbCEkF426EOJxgKoiuOA=;
 b=XdWRjWtrSkRAA9T5zbTLZl6+HFlLAEnp7mcoCpS7oDYGnc34aI5SLaRp1rwiZzDM3p/04ZA7WR+rWhob31lAJSLO+pEkyc+HLZaw3wwB1CG6vdmrOqNinbB7IWOTONYl6EFV58AyJZMzgt9SAMQKXSs16CL/CCBLJjly6HkLQ7mZBrLYXwNaUksjF4b+n4eMlOM9v7ymqw37wctmsmgFyz8hvdRPvN88ZhsCI2xftwyJ5DvW6g1pYzS0XavKgX0LX6BgFZ287uQaM3qz2rFauA4pgk66hiaCUpI6FOtL7yTMt/odCiTm1PQLxdqQ5l7ZsYMzntMpbXVjlro3V8eKEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwMVbPg4+WKCy5F7bQxVc2/fbCEkF426EOJxgKoiuOA=;
 b=D1OgkKghrTa3m0J2mVy2X9Jbm6jLnJFXb9piCiuF9V+KL4UbYpqr+BDlELwuSOgmnLj21c1ZSsJfy9oz9s0jcJv0HGn8qkTcUeX+eMSjenAiKKTaQWfOG9NtO9bR8WsrvhePRmNwS6JJL6HxfzuBQm1JNW+0giiwAfAOauVIEhs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v3] tools/9pfsd: Fix build error caused by strerror_r
Date: Thu, 7 Mar 2024 21:56:16 +0800
Message-ID: <20240307135616.3953774-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|CH3PR12MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 9323798b-54aa-45ba-74f5-08dc3eae5f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jOToZOAqNWqYzVcLYojz+kHg3agXpGw0d6AvVwTwWl3lMwfwbjAL277fKgXKKLv5RYiq32At1neHsGVN5tTiqB5EJWCHuhCnVBYLTYJYiYYu1u2VVFuDhIaN5N4ELLSUhlirHCtqaY1Ku3cpspHuMlWCyB1XpX3LGwiknJbCiOi9GfXhM0Yiww/rj3pp1C6HDhZowZHEug5uTFaPtfBHQGYp/PofNcG/LFRpgVIJ0aLT6W76geJmOi1umKvNgworbo04s0+D0d5zxfBMWa1Mk9spV0LBWXe1vjll2U0AGEEM1WfMz0KBD7Lad6lDtWsRhonyNlG3cgQ/G0Z+wUVQJ4G1k2Vm5/jDXdf0C9XH3d5u+r99Nr1pXccgux8VrYog6Xac36qOPvZUmXlLkTpsawNjGYngaGUe1lXJ3N5/M8vyrHjEva8ajBFxM0d8b9KBB8isJpqJVki8q5XtYEiTHSObZQe7gozKkbKFcDUM4F8fevIRUWbUOtNj0JA4BeyxYOY/OYOxQQdTBepq4RO5H0/WuFsbKHCvODz2nZd2/en851j/+tB87x+Xx3Uc+k6WBkZOFgLX5fvBpjr+LugNN45tnAwCE/K9z1/pNdqKXfd3B4NtbTgQB8V7l9YnaCgGuBYcIH7sJenrKR23dCWNVkfGNIsSyFt6Tiu6rCFpazpZ1y28li/CF/MWsx7rCb7AjTWhdCxiuq442Nn/4cxxYuWW9vAjlwGmk1gyFykZCDC6jb0JUFPLPSfmYbwPmTrg
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 13:56:22.5217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9323798b-54aa-45ba-74f5-08dc3eae5f74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880

Below error can be seen when doing Yocto build of the toolstack:

| io.c: In function 'p9_error':
| io.c:684:5: error: ignoring return value of 'strerror_r' declared
  with attribute 'warn_unused_result' [-Werror=unused-result]
|   684 |     strerror_r(err, ring->buffer, ring->ring_size);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| cc1: all warnings being treated as errors

Using strerror_r() without special casing different build environments
is impossible due to the different return types (int vs char *)
depending on the environment. As p9_error() is not on a performance
critical path, using strerror() with a mutex ought to be fine. So,
fix the build by using strerror() to replace strerror_r(). The steps
would then become: Acquire the mutex first, invoke strerror(), copy
the string from strerror() to the designated buffer and then drop the
mutex.

Fixes: f4900d6d69b5 ("9pfsd: allow building with old glibc")
Signed-off-by: Henry Wang <xin.wang2@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v3:
- Add in-code comment and commit msg to explain why use strerror_r().
- Cosmetic and style changes about the logic.
- Add Jan's Reviewed-by tag.
- Add a "Fixes" tag.
- Use a macro-defined value for the maximum error string length.
---
 tools/9pfsd/io.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
index adb887c7d9..df1be3df7d 100644
--- a/tools/9pfsd/io.c
+++ b/tools/9pfsd/io.c
@@ -677,11 +677,28 @@ static bool name_ok(const char *str)
     return true;
 }
 
+/* Including the '\0' */
+#define MAX_ERRSTR_LEN 80
 static void p9_error(struct ring *ring, uint16_t tag, uint32_t err)
 {
     unsigned int erroff;
+    static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
+    char *str;
+    size_t len = 0;
+
+    /*
+     * While strerror_r() exists, it comes in a POSIX and a GNU flavor.
+     * Let's try to avoid trying to be clever with determining which
+     * one it is that the underlying C library offers, when really we
+     * don't expect this function to be called very often.
+     */
+    pthread_mutex_lock(&mutex);
+    str = strerror(err);
+    len = min(strlen(str), (size_t)(MAX_ERRSTR_LEN - 1));
+    memcpy(ring->buffer, str, len);
+    ((char *)ring->buffer)[len] = '\0';
+    pthread_mutex_unlock(&mutex);
 
-    strerror_r(err, ring->buffer, ring->ring_size);
     erroff = add_string(ring, ring->buffer, strlen(ring->buffer));
     fill_buffer(ring, P9_CMD_ERROR, tag, "SU",
                 erroff != ~0 ? ring->str + erroff : "cannot allocate memory",
-- 
2.34.1


