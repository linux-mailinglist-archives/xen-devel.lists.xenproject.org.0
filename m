Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7131E2EA8AA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 11:30:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61786.108851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwjbI-0007Zc-E4; Tue, 05 Jan 2021 10:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61786.108851; Tue, 05 Jan 2021 10:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwjbI-0007Ww-9X; Tue, 05 Jan 2021 10:30:04 +0000
Received: by outflank-mailman (input) for mailman id 61786;
 Tue, 05 Jan 2021 10:30:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onuC=GI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwjbG-0007Ju-PQ
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 10:30:02 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ade8597-f800-487b-91a5-7200571fcae2;
 Tue, 05 Jan 2021 10:30:00 +0000 (UTC)
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
X-Inumbo-ID: 2ade8597-f800-487b-91a5-7200571fcae2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609842600;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=FJu63OG18aHAckstuSp2KOaCMT2Ay5JhUaC8eG9KkS8=;
  b=XW50Lsl39Ud9kbV8Qvsttoy5EFSRSqA2+tm0jvSbv4rl9OM39/AbKHWP
   wNYvIoiHvDH6fuxeyP1jd6OlmOg/YMIb8S3Q5jYjbkHb9cXHN0PgJpAsm
   cA2r9GzGJQqAL2umt+gaMOiC4Z1mfgKI5+KAvLaRj0vMe3fjK1VkdbBKm
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jwD+1rUDWwkebDl13cSUoLm8PsZ3KrklF6hzdC1Y8IF7CT3R04n8uOHbA2K3JahrtMVDxD4Oax
 YVwZ0t5px5TW/aRJ152jdQv2xkga6lYV2IZNJLEFTOf9nrWGxCr4Uij/OcWOgUA+fXn6SGkWf0
 SgeaQOTww4lpqZgUPM/beNdtTxvpdsVd42XaCTMMsOaYxj7XLbgkEeipazWzXNyGwrT4zNnhlL
 HXO6Lrg6A7dLxmkjPjb5RXdWWpDPoTSRfQqAXZyCUqb+JB/OUDBWxJ1RPQocFpapakVXfNX2mR
 MhY=
X-SBRS: 5.2
X-MesageID: 34403725
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,476,1599537600"; 
   d="scan'208";a="34403725"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcJQqBoAyzsOM7l4Cqf26BsVyC+Tmljr5NLBbq4AAV7p3rCXu9mD+Wzx2B8b+p9G6+sa6712J8yTY2L5b9oJewKu7608Tv2lOcetl2LuuLX8C733CRNUNy5ZbbQlvmQEG6FTqNTw2OAjth/QmDUtnz9Ag8ktzc3npUg/31HkJRa1Tsyfm4U5kG/RiPV/K4vJglUYcltickgzGBmzjL/sRsR+rLtYV+svldi84vogncIFJD4JOIGGVXyR3Mfi/ouRCwIcaSd5YTyC8ifpp+PtzbAoPBjrjIiWyXt7QfygiMowbuPOkoh4XtZt6mIQkSwyZdM1XdCGG8bGZGGPUFXbDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMEZP4C+IxP09H0PSYuAz/LURUqWwnKgCKWBqQ8xn4A=;
 b=jjJDZoVRrFpxECt3bjufCCAmbkvqcCkG+B04rNQ7OvWK79sOP1q7Pd9AfMGhg9pAZY4tHJrSMRyCJSeMxWUg9aYUckcEDuEHCx3d37spb8qm31ViiOhTuMzeFH1GugYX6Q1p/L+QPf1wMSVDOUWsPjK14gIjvGHlTAJYi7MtJ01UGmSAxdnTwWz+QaK4yJ5cGKcju+niNHW6ZEyg9UEKqRbO1ItTZUKnAU3t72PG2qOAO1LbVutXK4a+6hnRaWp3AqKXEUXhPVd+cOLMuCnzeUqVxOGQu4MTpSQYnMTcxAf6OBYHxe7pWjso7vBx2MJeeaocv2gZjFRyxH6fguFyzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMEZP4C+IxP09H0PSYuAz/LURUqWwnKgCKWBqQ8xn4A=;
 b=LXkl5rsAzK7nc7E8MP+rkkHfCn2h3TR7ZyNIqVsJ80BQ2E7HufesnV3I2u98Wv/Ja2HeW/F9ySkt77u79J1fbrwo2S6CYL10ok84MWc0ZA4UYYmrhzBwvCOeh7Dk1IIuaN3fLMDDp3ZsynywhTBgaT+Q6x4yLxllbPvoOCgd3rw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] libs/devicemodel: add dm_op support for FreeBSD
Date: Tue,  5 Jan 2021 11:25:46 +0100
Message-ID: <20210105102546.88462-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210105102546.88462-1-roger.pau@citrix.com>
References: <20210105102546.88462-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0169.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57bd063c-7532-40f1-52e8-08d8b164d916
X-MS-TrafficTypeDiagnostic: DS7PR03MB5525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB55255CC4C68A9A5AE4EDFCA98FD10@DS7PR03MB5525.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /V3poC5ZGw/Z1ZTgMoxr5VnHbDBiDokF2A4q1DSf/JxkC1isrUPtsHMNVx3e2UXvvq27x2lrU08oXZTQ4WxmHvKZ10LsXNfy2TwhLriIG9nNBDttjqPg+aWutfmwco82QCYgT+xV4Tj75uLlJdipRIKmG+tZLkWu9a9Zb34ZEZWbPr5/DlhY8SXx7At8+z6dZqMAVSYqQRYNgvn08/nvGqM09xpfuIgqK4mLrQ/G7hm9ft38owdErHUwdD9KobGCGk39Iy5AADIJDdks/nMDxjehu1A9tLOL/TEKpRqUc7dfhhRiJdnRWaFjf3px2Xp0+HjkU2DR7ylVSjWxyj0TBEslgpkFXedaRIp3OUOMPPFHg3ZProe8zXmCHJXjOKi2Tb/wfgeQ7r4QkJoiekc6fQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(66476007)(8676002)(16526019)(478600001)(6916009)(186003)(26005)(4326008)(2906002)(1076003)(6666004)(66946007)(5660300002)(66556008)(956004)(2616005)(36756003)(6496006)(8936002)(316002)(83380400001)(54906003)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QndmdWR6Kyt1L1JyV3pYbnp2NWZTbFk1ck5IL1V5L0ZHS0c4K2s5eCs1aGxY?=
 =?utf-8?B?blFxeTExREdIV3EvWkJCSzJpRzd3WkxUUnVCeUw5eEI0R2U5ZEM3anhVMTZ5?=
 =?utf-8?B?dU5GbVh6ZVNYT3RWbDFPdTZGTVlpZHd4UmoyQWJ2NzhBbVRXaWhYYnprSith?=
 =?utf-8?B?ZDhCODNNZkd3Tk1KZ3ZtSGFKYXBseHJjVEVwK1VPaThKU3dBcllFVGc3S09P?=
 =?utf-8?B?YXBjU1NMZDlWY0VKVGFxd2NpV0w1eTlMWklUZ1lMVG1NeUwrNldmQ2JiREEw?=
 =?utf-8?B?T3FOcSsrZGhBMlBnWW1mSG5YV3dUNXRPd3cySURkM1Npdm9IQ2NGajRpNXpw?=
 =?utf-8?B?ZVVQanY1SSs0VkJoeWFDQTFNMGdEQ3hSNy9iUWtyVG16VjdJMmExQ0pDcUI5?=
 =?utf-8?B?S21aRjJkQzZ1bFg3WG5lMW11cHF5c0EyTmwwZUlhb2dFQnpEWk56QlplOUFi?=
 =?utf-8?B?L0JZQjlzUS9YSC82SkF1TkZncHBNNkppWDBPTC9Bb25pb1RwZ21SMjRMVlJt?=
 =?utf-8?B?bi9vU2tZNU5zRG9XYWhtQ2ZaVHlMUmpFU3ROTUhwZUNKTWtWQVR2Q3R4YUh1?=
 =?utf-8?B?OHFnM0EvOFNlRVdCTXlmVXRsZ25KNTBhWWp4ZWNySXVBM2VZVFhPU0dqMDA1?=
 =?utf-8?B?ZldaMHdtb2ZwOVFJVHoxem5FS3daZWdEeVpIL0NvL0FQUWxUaS9RTzg5bWhl?=
 =?utf-8?B?cGd3WDBuQ2RycFR5TTRwemE2MXdzUWEyOTFsQTFMdlNFaTZqeHMrVVROd2N1?=
 =?utf-8?B?SFl4VDhIYnNLQnpkU1llMHpjbEJLOUtPcjNyQUErYnREcmRCVlh4aDNReHZm?=
 =?utf-8?B?Y1VnSXdUTnFTVkN5QnRRekF2Z2dXWXc0bnRNdmhVUnpsVHRiVE5ERDRTc3Zr?=
 =?utf-8?B?cHpEb1FVZGdXR2lJdGJxaTIraWJqTk5iSUhvci9VV3k2Qy8zdW9TWitrRlhU?=
 =?utf-8?B?bjZVUXU1d0R6azRjdGlHU2ZLc3FyZlY5ckJMVldwc0ZNTFg4OFlMRE1xS3NE?=
 =?utf-8?B?dzJRMnRGL3BVSFhBalFtVHhnYWc4aFRCQXd0bVdYdEtGT3VRQi9sVzJPT28z?=
 =?utf-8?B?dFc0eFVkVmZ3L3crZnRVb09WUXNGY1lOTW1HSUg3dlpyOWpMblN3b2N6M1Q0?=
 =?utf-8?B?VW9FU3Y3WFRkdldWQTdkemI3VDJVS2ZZa3gwK2lBcm83bi9TZzFvcklJaDZ3?=
 =?utf-8?B?dFpUQVpldGI0NWIwMktwUS9FenJacEtjWlhlTmpIQTYwa3BXVXBVTWFZREJx?=
 =?utf-8?B?czhQM3BNVnB4VSthYndLN3ZoRlZXMldxeUErL2doWWFVaDgrWFBXOXVVWHpG?=
 =?utf-8?Q?0JJr9O79eC9hH/EWoLjp4XB3N4UPUQlJJI?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 10:29:56.9561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 57bd063c-7532-40f1-52e8-08d8b164d916
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90wSnJ74Rg4yiVv/Zry9Rx8bsLoN0GvT8b2cfw5iZESIvX4dT5z2IQfxWZ93hEHXYhVayidn3oWAHeksj4leGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525
X-OriginatorOrg: citrix.com

The FreeBSD ioctls have the same fields has the Linux ones, so the
same file can be shared between both OSes.

No functional change for OSes different than FreeBSD.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xen-sys/FreeBSD/privcmd.h      | 15 +++++++++++++++
 tools/libs/devicemodel/Makefile              |  4 ++--
 tools/libs/devicemodel/{linux.c => common.c} |  0
 3 files changed, 17 insertions(+), 2 deletions(-)
 rename tools/libs/devicemodel/{linux.c => common.c} (100%)

diff --git a/tools/include/xen-sys/FreeBSD/privcmd.h b/tools/include/xen-sys/FreeBSD/privcmd.h
index 603aad67d5..649ad443c7 100644
--- a/tools/include/xen-sys/FreeBSD/privcmd.h
+++ b/tools/include/xen-sys/FreeBSD/privcmd.h
@@ -66,12 +66,27 @@ struct ioctl_privcmd_mmapresource {
 };
 typedef struct ioctl_privcmd_mmapresource privcmd_mmap_resource_t;
 
+struct privcmd_dmop_buf {
+	void *uptr; /* pointer to memory (in calling process) */
+	size_t size; /* size of the buffer */
+};
+typedef struct privcmd_dmop_buf privcmd_dm_op_buf_t;
+
+struct ioctl_privcmd_dmop {
+	domid_t dom; /* target domain */
+	unsigned int num; /* num of buffers */
+	const struct privcmd_dmop_buf *ubufs; /* array of buffers */
+};
+typedef struct ioctl_privcmd_dmop privcmd_dm_op_t;
+
 #define IOCTL_PRIVCMD_HYPERCALL					\
 	_IOWR('E', 0, struct ioctl_privcmd_hypercall)
 #define IOCTL_PRIVCMD_MMAPBATCH					\
 	_IOWR('E', 1, struct ioctl_privcmd_mmapbatch)
 #define IOCTL_PRIVCMD_MMAP_RESOURCE				\
 	_IOW('E', 2, struct ioctl_privcmd_mmapresource)
+#define IOCTL_PRIVCMD_DM_OP					\
+	_IOW('E', 3, struct ioctl_privcmd_dmop)
 #define IOCTL_PRIVCMD_RESTRICT					\
 	_IOW('E', 4, domid_t)
 
diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Makefile
index b67fc0fac1..500de7adc5 100644
--- a/tools/libs/devicemodel/Makefile
+++ b/tools/libs/devicemodel/Makefile
@@ -5,8 +5,8 @@ MAJOR    = 1
 MINOR    = 3
 
 SRCS-y                 += core.c
-SRCS-$(CONFIG_Linux)   += linux.c
-SRCS-$(CONFIG_FreeBSD) += compat.c
+SRCS-$(CONFIG_Linux)   += common.c
+SRCS-$(CONFIG_FreeBSD) += common.c
 SRCS-$(CONFIG_SunOS)   += compat.c
 SRCS-$(CONFIG_NetBSD)  += compat.c
 SRCS-$(CONFIG_MiniOS)  += compat.c
diff --git a/tools/libs/devicemodel/linux.c b/tools/libs/devicemodel/common.c
similarity index 100%
rename from tools/libs/devicemodel/linux.c
rename to tools/libs/devicemodel/common.c
-- 
2.29.2


