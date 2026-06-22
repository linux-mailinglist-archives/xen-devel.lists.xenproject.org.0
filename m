Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HKvFMRNSOWpAqgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:17:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766756B0A69
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:17:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=h2pc7K77;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343886.1603107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgOq-0004n9-U8; Mon, 22 Jun 2026 15:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343886.1603107; Mon, 22 Jun 2026 15:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgOq-0004jw-Qo; Mon, 22 Jun 2026 15:17:24 +0000
Received: by outflank-mailman (input) for mailman id 1343886;
 Mon, 22 Jun 2026 15:17:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1wbgOp-0004jQ-NZ
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:17:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbgOp-006hPz-4Q
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:17:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a3951f1-bab6-0a2a0a5309dd-0a2a45028a7e-32
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:17:23 +0200
Received: from [52.101.53.7]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a395201-fdf1-0a2a45020019-34653507170f-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:17:22 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH9PR03MB649383.namprd03.prod.outlook.com (2603:10b6:510:3e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 15:17:20 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 15:17:20 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPr0TAusxP7cvig3ycixIk8AJyYmILi06vEjoDJwbp8qryY02oVTht8bWrxhy64VbycKPWto9+7oZTSqrLLId0tmKlAJW37UvzzFJT7+61ezaFwKHo48KnSSZTFk/wAjRIg8wU0oK6xzEXHN5iQYEe965W2b7Y/uJWTDGjJBKpLE61pBq2c5asVWBEiGl0Xdr6kib35TI2XWQKmi7fwGfhV4BSczXmr3wr0bWVBRM1xMirOmvjD6cAsSJDtUJXV81bxn+MgSOxG9IlRVjMMPvbesMU8YCUGTT/+Jpc/MDmDVWiki1dQkCM43HHZ13g4iE63mtsLOrV/P+k43U3so/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhBWTpnyw2XmT+IZFDCCw+YPmi5DDkc8GEqwHJ16MNI=;
 b=dwWYUpDN7blaHrrZRXTBSDIzPup7zOEoFQPWDFwshep5y2WuDAPdv0LbQJEk8YDMjxFZTH7fd1AT6+T5/1RTXeqSWKDEHfNehjcczzbxab7b1S/4UofeA8HcyZtqJpPzrgHBPB7Nu/btdr7BroPaprLXn1efybJ9XZta/KjOkNgw+NIFVQnCSTFyUzrnwAD9jmhMibza3nSbd6aCHLo9Q9+YPNlbstyTOXm8C5UCl8kG5JUBP7xDpX4nbUTHBlvNJMbanrmBsvq4P1oZG3fPdISOsnKEfKwu2c2TALW/TLKq3U1ImYZNVoUpQG2jkjjhGOHwZWAgR9hm5l6lyIdbyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhBWTpnyw2XmT+IZFDCCw+YPmi5DDkc8GEqwHJ16MNI=;
 b=h2pc7K77FXs0nh5vsowEXpC5qiuphjkHHota2AyRk6xpwVUatttwjkxY7ks/GbTv5+nrPssaJu41Qw5EmyzdT7ZvECgBt5U7OzMeO4PUiqKuZ3zwc8VCoHd9aH/sz0pkugpooqUHagU9oqtPhLvYuoXyauoTsk6PJ0NdnpXi50Y=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	ross.lagerwall@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 1/7] x86/kexec: add digest checks
Date: Mon, 22 Jun 2026 16:18:27 +0100
Message-ID: <20260622151833.3397692-2-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260622151833.3397692-1-kevin.lampis@citrix.com>
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::14) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH9PR03MB649383:EE_
X-MS-Office365-Filtering-Correlation-Id: 979f2b24-7510-45a1-ff94-08ded0715a95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	oXVPYagOvPqxrNKJQQ82AzW8R0/QeDiXbbqW4sY2bjhbI1BFMWBsq2M7+BrNlPRMBEFgFa0GPHCRffdTaKSBLQplM7AExiUnOkRJ3jk2YAh5cIUjK2JqZb9CmDfapWMIELGp/R3PdckOypWoUA+fBc3AQm+zD1VRDJAuEdfPVvNsQREuPejgbJLP+7uJO6elUT5ETbZbQHo1Da9Bv2Z2H6EYE2taOfYQnUuSQ3VR7egQo3Y88bah/VQiYCcSJZwFh0m3mBa7vbutzOR9rpn1wy0j34bojKxV3OI0BbFGNsUttTZjMe1/GAG8Y7U2JSvuYnwVK1fnYnljV+8CBVDRV7qNbnvMKLxDakJsvWZmOSB9tmJJ4bVPIyN8W+EQp4tEVpmqbHwEuUi7PgkRsYDnjwA4ur2DDVJ+FtfEJw/NBbfBhcxN5QRGVZG8rcU7Eljat3eEHDklPy/Gp5ipWy6JvLCttU2W+gb7xfw4amPPajP37ud0n8ysojotnck/CQTBe/ta996bhyXoNZj23kGVML+pZZjuxiMhq2x++1xbOBQ9D0XuQnSU+twY/3BNSSuAJ0fI64jpBELlM4lNWpWVs/l18T4H5GCykznxemnSfUGfFOsag3JEPF/fYFoDCvR8Z2qxpyo04yKswj8+A46Wyb1H72IPAbKk79yQsVAQpYI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vkQZZBPEaErXMptj/ieezHmWS8kASRmq1Jmcey7KLJs4n5XBcok5Q74zR0Ly?=
 =?us-ascii?Q?PqmhFxOOU8gxiFqjX/9z24wCukEBHXSEMzwt7Iw51NHblpKziq5VET1v+I0J?=
 =?us-ascii?Q?GzBZR3FrFlVtiFxRGXeig4d2LW6zWDu2hAXfFUagc54njbnOQvTO4Bk3m0d/?=
 =?us-ascii?Q?2KBahxZ+KxQ5gJza3SCB3KtjAvk9pLXwY/LBEZ6QJiw5sbQ5zS2govaGLMVv?=
 =?us-ascii?Q?pFKdJn7eb+7xu+FUlgjIioGT/KwLUoxm7uC0L2HwvRfgN2gEu6VKuDUz7ygT?=
 =?us-ascii?Q?KCHiNdsurQbgvUBxy9plwABzatwXYZmpooyLhjWV+JZ6hQuaflZObdPPoZj0?=
 =?us-ascii?Q?Dz7x4BBjY9Qb/CKzYqwm1r+KZ8/xogLESIyQBz3yyx9/0/a1gJX2+gLX66Co?=
 =?us-ascii?Q?Rh/F8gwS+nWcd3oysiqTYNs1AueEEu19CupScQ0M/cf9VmSfbzCENFBkG8O4?=
 =?us-ascii?Q?guSWBdJfyR4tPYPFEZXZBDEb7cXOBN06OyGs7gyZyav+fRYZXWccWFPgOmzJ?=
 =?us-ascii?Q?yHVGkXzv43Ozwov81kPQN4psqcGE1SHlqHOivBz//gxCKEMHPiL3Dbaugjvj?=
 =?us-ascii?Q?dLftcLv17zNsaLC2D3Timoor6DWhUEQ5AqqraXlVvJsiosIlo0AHcRaQSr9l?=
 =?us-ascii?Q?ulS6byD+ghe0UDZDtGzl5YxRhUNhkHxEtEK2xAYQlzs4xYJWeL2z7rVwWjUD?=
 =?us-ascii?Q?7ejfaUAWKwxK+R/qQi6EeuvQZkKMMdP+zt1wiOhXDvI2syhpoyjooCaWY6Ik?=
 =?us-ascii?Q?7BhJfwaK6vqFW3xAGYvs5KXVpwCVLwY9T9OEkDX5Ll3nLUrDBSCKCeZc5YNm?=
 =?us-ascii?Q?CsmB8rbJUoU4aHH4O8tRZ79AzaAXCbE7eNeP0nGnAL3JMbx7lLW3Dph8c+qF?=
 =?us-ascii?Q?ldXzvA+FG9UfiIWdMYi61DmSG0c4sKJzXftS1rjG8DyuzT82IsxNGJcbiLBU?=
 =?us-ascii?Q?1y3h1yZHl/AupN0HSGdbBtsNMoprMTRpmOCNYDNWWtiGaCvxJIdinYFtsjCT?=
 =?us-ascii?Q?qHWXQLvQ0mkXf6vaz60A79rHt91I9MOhCAnn6XvzJSQqUK4KCpHi5xISHPDK?=
 =?us-ascii?Q?r3hDOtkN/JpZy4PPaVvYGhHJl3V/19+iPu/Zq+4GuELcRiJfEZgu0ctAcdZH?=
 =?us-ascii?Q?/+prNYldRnOHxe1zYlJyt3fLFSMVfbXjoAY1KXQeevIuIWz9Usiqdz6i/Hef?=
 =?us-ascii?Q?791H3/v2VaYZrvI5Ww5EbEr0VHZbg55cLb1YX1Fjgpq9kVqzwSYx2q8fLBcA?=
 =?us-ascii?Q?f5EAX5mj9TnT0fsIyAuaK0T0JhPHbtSdXgSXLJ9hGBUHE1rXW5S2OdOuCpXB?=
 =?us-ascii?Q?mMSfOIpf9zW/YZN07x+uBwZXBAG24jLiDVfikskimw0SPWzHF9quPeES1SLi?=
 =?us-ascii?Q?mjTMfClg4RbdJlrukq2TtJc3TaEmZ3uCJaHoWuIr/H7smmEQrrCS0yTKHsaY?=
 =?us-ascii?Q?o7bgS7amJW/FpCNQwYhz3wAo9E0IDe88nvIM6xYG/YYTz4HHPmiy7oiUxUQ+?=
 =?us-ascii?Q?Epl67w2wfFHCiM2PH/DtbTI9uU82HO1v48Z9b5glGK7QBoFwgnjG1Jc2kk9/?=
 =?us-ascii?Q?ZFiEGfjishYJW08abPsXTm9bDsysO7gW1n9h+QDm/AbB15yR2x7NduPbuQB9?=
 =?us-ascii?Q?+0L3q7RzCe0Jz8n22Xgwrr0jFnGlf84iQDV0tcUYLtJ8vsq9DDlHoHjmh+mO?=
 =?us-ascii?Q?vXegKmAAYxXdQuFzJgeWlvbQjmQ1Ttp0WAZe3rZc279d+t2yZKETvg66Kj0v?=
 =?us-ascii?Q?M4RLFr/Gzw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979f2b24-7510-45a1-ff94-08ded0715a95
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 15:17:20.3595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCJ1obZgaPwc3VOb1CdydW8brFiCkqYF7fPG6TrTncflKi3j+Avs3cY8Z8VP4sCfjKogIBhIsBvl/7ik2w2AQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB649383
X-purgate-ID: tlsNG-720697/1782141443-44C6E3F3-FFAB0E78/0/0
X-purgate-type: clean
X-purgate-size: 5529
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 766756B0A69

From: Ross Lagerwall <ross.lagerwall@citrix.com>

To support UEFI Secure Boot we must check that the kexec data has not
changed between signature verification and actual execution.
However, this is also a good check to perform generally.

During kexec load, calculate a digest over all the kexec segments. This
digest is stored and verified again later prior to entering the image.

For now, only kexec crash images are supported.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Reword the commit message
- Change the "kexec digest failed" error message
- Remove the `!= 0` from the call to kimage_verify_digest()
- Remove include sha2.h from kimage.h
- Remove error checking from kimage_calc_one_digest()
  because map_domain_page() doesn't fail
- Change kimage_calc_digest() to a void return too
- Remove references to KIMAGE_SHA256_REGIONS
  It was a purgatory thing which is not used anymore
- Fix style on `for ( s = 0; s < image->nr_segments; s++ ) {`
- Add newlines and indentation to digest check fail message
- Make kimage_verify_digest() a bool return value
---
 xen/common/kexec.c       |  8 +++++
 xen/common/kimage.c      | 73 ++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/kimage.h |  6 ++++
 3 files changed, 87 insertions(+)

diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 7535d269e8..f31ab3fa07 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -389,6 +389,12 @@ void kexec_crash(enum crash_reason reason)
     if ( !test_bit(KEXEC_IMAGE_CRASH_BASE + pos, &kexec_flags) )
         return;
 
+    if ( !kimage_verify_digest(kexec_image[KEXEC_IMAGE_CRASH_BASE + pos]) )
+    {
+        printk(XENLOG_ERR "kexec digest failed, aborting kexec crash transfer\n");
+        return;
+    }
+
     kexecing = true;
 
     if ( kexec_common_shutdown() != 0 )
@@ -943,6 +949,8 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
     if ( ret < 0 )
         goto error;
 
+    kimage_calc_digest(kimage, kimage->digest);
+
     ret = kexec_load_slot(kimage);
     if ( ret < 0 )
         goto error;
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index a0e4e67df7..6e009529ae 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -818,6 +818,79 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
     return result;
 }
 
+static void kimage_calc_one_digest(struct sha2_256_state *ctx,
+                                   xen_kexec_segment_t *segment)
+{
+    paddr_t dest;
+    unsigned long sbytes;
+
+    sbytes = segment->buf_size;
+    dest = segment->dest_maddr;
+
+    while ( sbytes )
+    {
+        unsigned long dest_mfn;
+        void *dest_va;
+        size_t schunk, dchunk;
+
+        dest_mfn = dest >> PAGE_SHIFT;
+
+        dchunk = PAGE_SIZE;
+        schunk = min(dchunk, sbytes);
+
+        dest_va = map_domain_page(_mfn(dest_mfn));
+        sha2_256_update(ctx, dest_va, schunk);
+        unmap_domain_page(dest_va);
+
+        sbytes -= schunk;
+        dest += dchunk;
+    }
+}
+
+void kimage_calc_digest(const struct kexec_image *image,
+                        uint8_t digest[SHA2_256_DIGEST_SIZE])
+{
+    struct sha2_256_state ctx;
+    unsigned int s;
+
+    if ( image->type == KEXEC_TYPE_DEFAULT )
+    {
+        /* TODO implement digest calculation for normal kexec */
+        return;
+    }
+
+    sha2_256_init(&ctx);
+
+    for ( s = 0; s < image->nr_segments; s++ )
+        kimage_calc_one_digest(&ctx, &image->segments[s]);
+
+    sha2_256_final(&ctx, digest);
+}
+
+bool kimage_verify_digest(const struct kexec_image *image)
+{
+    uint8_t digest[SHA2_256_DIGEST_SIZE];
+
+    if ( image->type == KEXEC_TYPE_DEFAULT )
+    {
+        /* TODO implement digest check for normal kexec */
+        return true;
+    }
+
+    kimage_calc_digest(image, digest);
+
+    if ( memcmp(digest, image->digest, sizeof(digest)) != 0 )
+    {
+        printk(XENLOG_WARNING "kexec digest mismatch:\n"
+               "  expected %" STR(SHA2_256_DIGEST_SIZE) "phN\n"
+               "       got %" STR(SHA2_256_DIGEST_SIZE) "phN\n",
+               image->digest, digest);
+        return false;
+    }
+
+    return true;
+}
+
 int kimage_load_segments(struct kexec_image *image)
 {
     int s;
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index fccba1d88d..8ed89d4fa3 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -11,6 +11,7 @@
 
 #include <xen/list.h>
 #include <xen/mm.h>
+#include <xen/sha2.h>
 #include <public/kexec.h>
 
 #define KEXEC_SEGMENT_MAX 16
@@ -37,6 +38,8 @@ struct kexec_image {
 
     /* Address of next control page to allocate for crash kernels. */
     paddr_t next_crash_page;
+
+    uint8_t digest[SHA2_256_DIGEST_SIZE];
 };
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
@@ -52,6 +55,9 @@ mfn_t kimage_entry_mfn(kimage_entry_t *entry, bool compat);
 unsigned long kimage_entry_ind(kimage_entry_t *entry, bool compat);
 int kimage_build_ind(struct kexec_image *image, mfn_t ind_mfn,
                      bool compat);
+bool kimage_verify_digest(const struct kexec_image *image);
+void kimage_calc_digest(const struct kexec_image *image,
+                        uint8_t digest[SHA2_256_DIGEST_SIZE]);
 
 #endif /* __ASSEMBLER__ */
 
-- 
2.52.0


