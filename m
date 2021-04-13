Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DEC35E0C9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:02:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109769.209532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcR-0004z2-A2; Tue, 13 Apr 2021 14:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109769.209532; Tue, 13 Apr 2021 14:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcR-0004yZ-6i; Tue, 13 Apr 2021 14:02:19 +0000
Received: by outflank-mailman (input) for mailman id 109769;
 Tue, 13 Apr 2021 14:02:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJcP-0004rK-9I
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:02:17 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b347eacb-f47b-491a-b78f-e06b12b7d42f;
 Tue, 13 Apr 2021 14:02:16 +0000 (UTC)
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
X-Inumbo-ID: b347eacb-f47b-491a-b78f-e06b12b7d42f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322536;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=mB4obio716LwGQbmmtPzikOtLnuYNlelD6BrKRg8sk0=;
  b=TPi/xwKM/R3lOCiAZgO4AXJI6IeT3BVy8uZgr0NiZpcU2wOb7Q4Q2mDU
   qr8tdslZkbBtnBZdZXuDatqenZS1yv8YAv8hK+qa9xjZGJNvnUa7mNla1
   C7xsJBR7TD7qqNs/Ng4Krb4I2wSw1EihWvlhoil139UIf4MCQEAPAgbCx
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NDbDpY8DBSNyLo8KErrFWsE7BS2gc3mmZsToRgTsST9nWEvtoJrbrgHJnu/IQLulH4eAgHb84k
 dx27Q6arg5IOdxoI4iFFqFLKUobTipHztRA/HUt3z3hg4Hqq4yaWFhrCwqHZ59fsR66vSj5LH0
 mk/F1aG42TLEcPiGxnZ5NPs3NNMV/HPjkPVGEgPKXtNQTOcp6WYHSGJ/BaGHPm7d94kVk6EBH4
 jE8shNYXuKTgmF1X4o8rJBFuDR0rsRB3IxjQ+wDcut8MA5Olb9VSnK6vNOvyzCKHQb2C8in/Dn
 0tM=
X-SBRS: 5.2
X-MesageID: 42955896
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:iDZwgKrpOz0K3Z/in5UjoKsaV5tgL9V00zAX/kB9WHVpW+afkN
 2jm+le8BfyhioYVn1Io6H4BICrR3TA+ZlppbQAJLvKZniDhEKEJJxvhLGSoAHINi3l7+hG1b
 phda87L9vsDVd7h87m4A++V+snqeP3i5yAqvzZyx5WIz1CT4FFw0NHBh2AEktwLTM2YKYRMJ
 aH/MJIq36BVB0sH6aGL0IIVeTCuNHH/aiOCXVtaCIP0hWEjj+j9dfBcySw4xYEXztDhZck/G
 TV+jaJgJmLjvfT8H7h/l6Wx4hKmdfn19tIDNGBh4woChiEsGqVTbUkf4fHgRcYj6WE7k0wnN
 zFvhE6Vv4Dk0/5TyWQqRvp1xKI6kdI11bSjWKzuEDOherFaBICYvAtub5k
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="42955896"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASAOl0eFExnNjB0xuoLpv+GwXwvyI+xqCLF/qEhzFfzW0drWZpXMn/vjX8v4pqfuDNyP0IzKSjsS+05elakml8SiN1kCaopCQFkpGaAny8p0aX4QSd2G0RN4I+gj14J9lr07vYWYOJr3U0+4lP8RPyQbZKbKEg4CJvmNmsB/sZmrXV0r5YY1mjlGlCWr7G0zbIzXOXD/5psd9QpExolv0bAuHhTeMiuLPGCCQNPGtrbY7YhbXtEfOnM7XKujEH5BAcCVlm8+Ar5UrOdgbyMNa16qkvlHw7h+RwqRe+1qb3IlOZStzq6QWviPRQd4mlf7Y7mMwOcOaDCdUsu3RnjCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNG8CdU1lDvF/vM3JRvweREahb/itHxFfxS+2tlcVlw=;
 b=mMrkboakucD4rTbRTYx/xEp4kDys9RM8yZbVmAsm9GTLgAZL4A4OJHzt1lfRUEsZBWETzbpnP36WYhQCr4MtQkqESjamGudTlq8nkFcTfid4G+47JHhW3ZUv6LifiCG6ipM8ttP5322TpUu0QyX/qlmaybmdpklU+RsuKAai9+6v8jmxCk2EEdlU1nXQHcOhN9YOb5QlFfXWWPP7dkAavT40NRU1u6Y3SatSEkAranwvwH3dYVNZGdp6G7ASXBkCB1TS76V99X56iiFMLd7HXCGcN+12eSBrJs30VQk4nYpcB/qrOg7eYdB2m/3R3DzYt6diA2JEsPHZNztaJnVFeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNG8CdU1lDvF/vM3JRvweREahb/itHxFfxS+2tlcVlw=;
 b=kSj7/KquCoH3eIcW8cFOntyBLOP9kU2axF95kXMTR1vgLqy+ZrCh/v1iJVx9QmeN81Y6NDD/cUe/bR+cZM9gsc2oJpN7NTvLA2sZbX0xjJksOCmCPxf7RQF3BN7745wTgVda78+uhr/yU4NhL/RAjBbrj0XdtpX470A/ekP95Cw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 03/21] libs/guest: introduce xc_cpu_policy_t
Date: Tue, 13 Apr 2021 16:01:21 +0200
Message-ID: <20210413140140.73690-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0016.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6193172f-8a0f-4590-7d0c-08d8fe84bd26
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB554243726BF8E9F67F90CFEE8F4F9@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: THCNHC3Qb1pEZ8hxvomoPX8bssJLx3MHz/qew1HspNkEtD0Wo8UN16nANoVb38WPXCU8wb9jTFldmrl06RCzez8NEf0T4GlxKWIca4Frp7JoEIYGej7/RBmO8B5rn78+mLDG8zkpmn6LJQXBIufId/McNn4ZJPq1snQC1dACK86qnjX9A9SXGE7p5yNaF/fOQxfu2G9I84vNeovEvnkZU2t7NDcUFvW6KP7roEpsk7LfwEhxCkdlygTIWqmYgZhZndf/EcxHcl+3ju8rvPtRVkSr12q6x7ozRBE4Ktk1AILHuE4S45GjuzkSOZXR7lJ4EBxbMq0FelVyTA3vExf7SFZmErI43IIKJrN1EcQTKzddYj8MjF4NFhcneL1FvEuTmWETfGERMjBwBo+vZrHSd5xFO7F+1JlffrtS0AVKvAiMnyejGoo3eKXZFujFwKw2IH77zF95BJYF2Urg49iKyIOtOOWmtqMyXt8PmVhD68arILFUfvLu4f6ExbAEN+0pepvBTvVxb0ZhAbznSb+DTh7DS3XEx+ZbOXOVUH3ZN2tQ2SPPjwn6gdmNAocTUbyef/60Rr/5Zf1blfRssh0O99ym1tUDTgHGar4wE/2EV/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39850400004)(346002)(376002)(2906002)(6916009)(6486002)(36756003)(66946007)(54906003)(1076003)(6666004)(5660300002)(66476007)(316002)(66556008)(8936002)(478600001)(186003)(2616005)(16526019)(86362001)(6496006)(26005)(38100700002)(8676002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SnlNUmd6YVVWckNrc2Vtb3l5bGwvSHNjcEczRWJneTlPekU4QWs0MVVuTVcx?=
 =?utf-8?B?Q0paanVNdDVsNnVHYWx1OTFQajdsblB6U2xkWlh0Y2ZESGMwcnpXaHk5d2hF?=
 =?utf-8?B?ZmY3N0xVTWFvUzRQMmcvUm43WnNwUldiZnNvZG12YlpQZXYvbWFxYllRMEpu?=
 =?utf-8?B?elpsWnVMZlUxeUtpK1lFVkdOendFNzd3SDQzbHV4RGR1ZFBkd3kybk8wRGdH?=
 =?utf-8?B?QWp4SEpHTG4rVGVya1FCVk11VnNqa1kvaGNqRThMUlF6KzJWeC9welJPZ2VM?=
 =?utf-8?B?aG1yQ3FORC9icW16UU8yQ2pSQXdLU2tMblMwbW84andQRnBVVzhhbTM1R3NV?=
 =?utf-8?B?WTEvWmxmWkpFWGZScTRFTDhKTWMyMUpsTDlyTk15NlJZY29Ic1ZURzNLZFUx?=
 =?utf-8?B?KzJqcDI1OXptbVVvWS8vaXNjNnVtVncwTnIxdjZSVEhVUDZ3WWtEMGE1TzAy?=
 =?utf-8?B?OGs1R2RDK0IvbWcydTZydmhUd0kxUDZVVEpoVGFOdVFPYm1ub0I5Z3dxNHZs?=
 =?utf-8?B?SlEwdmRRckp2M1RJY1c2RW15N1QxK2VZNUM1TDd0aFlaSHI2SUlOM3pmYi9j?=
 =?utf-8?B?REtteEZUQnB4VDE4MG5HQVNVUFBDWjRpMWcwSW1vQjFvd1ptc0RzR0RPMUha?=
 =?utf-8?B?dVFka25ERXpVVDVHMVBZUW1VUnorbFNJZVlJT0p5UUJMN0Iydkd0VHdPNEdE?=
 =?utf-8?B?Sk1nYm53aGFWR0tyaXlSY2twb1pZd1F5Zk1CcEFidml2d2ZyQWJIdXU4Mnps?=
 =?utf-8?B?Y3VSUEtZWEtMY2dvVDc3cmEyZHUxUGZGaDY5QVIybW1xU3BLaHgrN0ZPQVdw?=
 =?utf-8?B?YXRmWGxFYklHcWd2Z2NNQVV6UlFHcis5N050WU5CT0NQRjVZTVpiTk0rczlB?=
 =?utf-8?B?eWxHYlV6dUtvVEpXK0Q4dWJWMm8zNXFmUWNMQVM5anpXR3lvTG9HTURDRXBv?=
 =?utf-8?B?ek5xdzE3NEJBQ0EyWmkwMjJRNWNCdkI5K01POHM3OWVQTi9xcjF2NDg1MnBT?=
 =?utf-8?B?M1hza0dwV1VzME1Eb2RrV3VRTjF2RU8rNW5qKzA1L05BdHdQRldxcEtrL2k2?=
 =?utf-8?B?akVQZVI4L04vQlB0enNFd3I0T09hZnlyYzZSMVVPVk1iM0NDY3AwZ3IreUNk?=
 =?utf-8?B?bnJYUVZvN3ptSCt2YWN0eDZ5Zy80YW5CNk43Rkx6Ly9CNUVrQ1I4SGVieGpy?=
 =?utf-8?B?NlJLbUgvM0NIQUxFc2ZzQXB5S1BOMnh3Z1IyMVhRNEhvd282aGRvMVNZSVFC?=
 =?utf-8?B?VjhvczFJaDQyME9NWTZld3BvSElPYmRGdHJSM01EYUplWEJvS3dsWkFBblBz?=
 =?utf-8?B?TlJTVWx0SVdBdUxXM0J6MG5ESUgzZE54OWwxV0ZtYnRPMDc0MXBtMjNoSFBh?=
 =?utf-8?B?cFFSWWUvMHFlc3N4UkJKNU43ckk5dURrYWlnanh5ek5yTGlQbWxaUTc1ejBP?=
 =?utf-8?B?SHBLUWo5TWROSE5kcWFMakdBejdUOEFBVUl4MWIxUk9vcjdQM0kwMHVncWFa?=
 =?utf-8?B?MzkzVVY4c1VkVDF2SGlvd3l2a0lraVZKdnpnMkRKTEpxTWZaTnF5dzZBQlNu?=
 =?utf-8?B?VFZnTm04c0t0cHdnWTZibU9JVVlDOFgxeFhSa2locEErbmRMbitsaXp2MVNX?=
 =?utf-8?B?RzUrQjE0NjVKT1NoUjU0VlV6WE9NWTMwbXl0UGxESThNQXdNZkJRUDZ6c01k?=
 =?utf-8?B?blBXU2o3elNtbUhhUGpKSnVNdHJDU2d3eFlPU2xZNnNxYVZLWU9qSGhnMnhi?=
 =?utf-8?Q?1dH3fMU2SQL6yejA3+X7f279vSADSK3SPIsYBZI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6193172f-8a0f-4590-7d0c-08d8fe84bd26
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:02:13.7615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKs27sWmeiUOYRmUzxyqOuZ/c2MtVuOQzeqgAagUo/uFwawuHPUEwqRJgdoQVyB0c0SmnnzF270nnWO4nVsLUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
X-OriginatorOrg: citrix.com

Introduce an opaque type that is used to store the CPUID and MSRs
policies of a domain. Such type uses the existing {cpuid,msr}_policy
structures to store the data, but doesn't expose the type to the users
of the xenguest library. There are also two arrays to allow for easier
serialization without requiring an allocation each time.

Introduce an allocation (init) and freeing function (destroy) to
manage the type.

Note the type is not yet used anywhere.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Introduce two arrays to store serialized versions.
---
 tools/include/xenctrl.h         |  6 ++++++
 tools/libs/guest/xg_cpuid_x86.c | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index e91ff92b9b1..1aba814f01c 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2590,6 +2590,12 @@ int xc_psr_get_domain_data(xc_interface *xch, uint32_t domid,
 int xc_psr_get_hw_info(xc_interface *xch, uint32_t socket,
                        xc_psr_feat_type type, xc_psr_hw_info *hw_info);
 
+typedef struct xc_cpu_policy *xc_cpu_policy_t;
+
+/* Create and free a xc_cpu_policy object. */
+xc_cpu_policy_t xc_cpu_policy_init(void);
+void xc_cpu_policy_destroy(xc_cpu_policy_t policy);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index cc5cae95725..8e3a1a8cbf2 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -39,6 +39,13 @@ enum {
 #define bitmaskof(idx)      (1u << ((idx) & 31))
 #define featureword_of(idx) ((idx) >> 5)
 
+struct xc_cpu_policy {
+    struct cpuid_policy cpuid;
+    struct msr_policy msr;
+    xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
+    xen_msr_entry_t entries[MSR_MAX_SERIALISED_ENTRIES];
+};
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps)
 {
     DECLARE_SYSCTL;
@@ -660,3 +667,14 @@ out:
 
     return rc;
 }
+
+xc_cpu_policy_t xc_cpu_policy_init(void)
+{
+    return calloc(1, sizeof(struct xc_cpu_policy));
+}
+
+void xc_cpu_policy_destroy(xc_cpu_policy_t policy)
+{
+    if ( policy )
+        free(policy);
+}
-- 
2.30.1


