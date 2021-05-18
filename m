Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF21387BA5
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 16:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129308.242736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj11A-0000DA-Oq; Tue, 18 May 2021 14:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129308.242736; Tue, 18 May 2021 14:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj11A-00009z-Kz; Tue, 18 May 2021 14:48:20 +0000
Received: by outflank-mailman (input) for mailman id 129308;
 Tue, 18 May 2021 14:48:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9UfV=KN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lj119-00009q-0A
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 14:48:19 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bda15b62-f9ce-482e-a680-432ff0bc542a;
 Tue, 18 May 2021 14:48:17 +0000 (UTC)
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
X-Inumbo-ID: bda15b62-f9ce-482e-a680-432ff0bc542a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621349297;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=icYH55/ktMuKqJXIYQX+IxbyRvKiSotvh1pWmXo1AUE=;
  b=BA0uU+r6oyKBw0C/3P18v05UDHWurPp6HJ9EKpxYmPe5FXr03RB/j9Ib
   bRYmO+bU8CbRaSe2hbzbgQZZ7hJw6lW41iGUxjVN7FSThDZm57kti5tSL
   r3/utMOAiOrZXd4OOyFPF3rL9ASOOZhzqSsyJQwLKNjY1L4vdYdoxIrNM
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fCq3tYZm7UNpOJAzp37WcBhS62B6i3H9b6R35egD5k7fyg8ZTdz1VDp8O8vztBkVqcNj/vUbFu
 J+RHHSgaaPWXHiwPiArtDFCutdJ8GmG39SQ6dR1RYoOYUzq+ZC3Xg3q2Wae2HExdj2BBnRU4DS
 KPRFTfWkIrnoRNj20HDySkAgBvWU7gxC3apVQL45ucO/Yk0hOby9DfGI1EmHLvDd1BV4UtqFjY
 kob+ZiHxmfrI5Ea8v5fzSYoD0C7xBhrWu1hmnktq2nfwtJ2l3AMG6GCE5j7CslfKFcmycZ0Gr8
 xP8=
X-SBRS: 5.1
X-MesageID: 44432571
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:xQd3qKDwxxYYoQrlHeigsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6Le90c67MA7hHP9OkPMs1NKZPTUO11HYVb2KgbGSpgEIeBeOh9K1t5
 0QC5SWYeeYZTMR4LeYkWvIYOrIqOP3jpxA7t2uqUuFIzsaD52JuGxCe3mm+wBNNUR77fVTLu
 vR2uN34x6bPVgHZMWyAXcIG8LZocfQqZ7gaRkaQzY69Qinl1qTmf/HOind+i1bfyJEwL8k/2
 SAuRf+/L+fv/ayzQKZ/3PP7q5RhMDqxrJ4dYKxY/AuW3bRYzuTFcZcs+XohkFxnAjv0idkrD
 D0mWZhAywpgEmhOl1cyHDWqnndODVH0Q6r9bbXuwqlnSRVLAhKfPapvrgpBycx3XBQ9e2U4J
 g7rV5xiKAneS8o5B6NnOQgdysa3XZc8kBS29L6sRRkIP0jgehq3PAiFQVuYdE9IB4=
X-IronPort-AV: E=Sophos;i="5.82,310,1613451600"; 
   d="scan'208";a="44432571"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCBlc9rfjcmrun4jHuwGChf/deEMKkG6Wvqel6n9q8JBM/rBCLJ+23c8lQnD+jo6bPhiY2a316oa7qsEi6G6AMdLI2O6wRqrEBc7lcTYH7GYVw7Q1mUxiUBpUcgHMumU8ay3Bwr2KS0nGmuvUMvU5LxDKI9bOJZRzDTXUxzFZwOnvuRao9oYmddDKiI7pgwOY7JBtaEbQOkij79x47L8+KznuRZscbLKQiDw+MYi+PA6V0kwBcNRt8MUjXcUehFeK22rpL5/yompF+PW8MBtsrh6UfIhz8uGzEgnJxjMhPinXGzxaDVgk2NKRwiVGTwjo+IEueA+dJkKJklGiBBX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jNCC6vvRDBjjCCC/T2rCWhHpwqAyBSyU3L/nHcUPaM=;
 b=SIogAl207IfGUISjFqT/fe3wGx/mpiKIgs4eshiyfMOQJBkDHFToFUbvSPkKjIWT1/agyalVrMaGopGngvb/nVzmYnrnFdcSntRAmjxuCNKtwACiNbZyH2RdsuJ+1Jh9RekxtEhJ/DFcjJmP4YzIlYfnfMfd0aAVjAT1W3mvn+qnVJO3kmHBW64bH5AV+sUjdZuUBqc2b/XOX4Qmp4Cpz+8wlfjk/WSego3M4zBkesGkJjMq2vty6gNQV8Uh/H7AwtfoGFhAIJ1x9hNpSDGJkGdU1URD+hdGTVlJRxl8iVOM1RDUOnzttnTH/J4kkZFj1KQGPacInsepDxP4kUfABA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jNCC6vvRDBjjCCC/T2rCWhHpwqAyBSyU3L/nHcUPaM=;
 b=iE2jLzJPNFs8OM0VzVjePA0u7V2jaETCsxxnIZ6xWEkFjBOvM1T9VlnSxwQSh7CeHxMyCau9rTwKBEV8lXVGdd8konnrP8fc7YOdGxf6+GFMLwUYg+aDHYbF9ucUo/ic35d4AyNcryHGBuF5fEkFGdgloEVJrzV6B1J1hRLxlBQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] libelf: improve PVH elfnote parsing
Date: Tue, 18 May 2021 16:47:41 +0200
Message-ID: <20210518144741.44395-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0060.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cda54c9d-fcdf-49ed-f144-08d91a0be7e9
X-MS-TrafficTypeDiagnostic: DS7PR03MB5575:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5575A6E95E19E2263D432B3B8F2C9@DS7PR03MB5575.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXNuqSy4dUb++9ndfkAjOHd10Od3CGvjIf83NGC6I00jEGVYbaVkiBDZUZ3Z74XKXURupW5sI0/CUrltlFI+GUP9fXWFe+M0QgR1MN9Dp7TWc85Vc/6zpKZ5f9QLJSDFJCfJ9G4VLEKqtru3Nt1F74rbWQB/RfpWUTYr7/LM2v6b6pSaskfnTYzhQ6l09QN/CC3AD++/7j6VoTvOxKdaM5v2+yzOQojLycJw5o5bm7dBPEbjut/V+/k0/XfQK2IfeLmYEfFtpoImxrMg6llXmfvK0x+cAfh12E0IFsdav1P/OrYxenrjVh15qF5+RYJbCk/gREfDKnyR8lALiPiPz17vQMtTIoNqX+jWo5q42Xzwnj0LWUB9lsvsRjAQPEfJw2rx1BZK+tu9R5BU3JP3KFDU4LSCz03uwDLgX47HDD2aGcdRY+E/TzEb0AfZ+eVaUjK7+GLo7bRfr5/RVpfRWlX1rGEcFOBo0iCcvj9AbGF++64gKZwyHFOzQ4QGiN0RxD+wmdVlhrz1nZKyNuopOKXAXRyH4qd5HpQ10b7qVlbJ+MXNiLwZRzBfErSqOIcT3EvSDE0Ghbw6Y0m0VD+lmMwFUxnlFlWSNxWYnbQP5iI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(2616005)(956004)(6496006)(8936002)(316002)(5660300002)(6916009)(66556008)(26005)(8676002)(36756003)(2906002)(54906003)(66476007)(186003)(4326008)(16526019)(6666004)(66946007)(86362001)(6486002)(1076003)(38100700002)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dWFJV0NDeVAxUGgzS3ZoeE55Yi9QbUE5TnNVNmVxaWI3VkR2eXRSN3M4OUQr?=
 =?utf-8?B?b3QvK2VpL092Yyt0N2JCZHpCQnRVOXl1Mmo2dm5VL2tlQVYybHlmOUxyM21o?=
 =?utf-8?B?cHpvK0hWMWJuQ1Iyc1pITE15ZWdSYlJZV0c0ck5Jdk94N3hleU9yWjNLVTFW?=
 =?utf-8?B?ZDBKc3A4dE1IbmR1RE1keWh3citpcjlXK2M0T1UwYncwTTNoZHZYWTQxYUNK?=
 =?utf-8?B?N0ZTRjlaZDJwb1NZemRIOE1ESzFlQjlHQTE5WERuczRWc1hCalNuWlZVK0R1?=
 =?utf-8?B?U1AxaFFsZXE1dVZCUlV5djZHQjJuY2g2Q2tGN0Z3RC9RSU1BSG80alEyaVU1?=
 =?utf-8?B?V3VKRXdwZmQ4dFFWc3ZCODZqZVdEbnprdGd2RzJnaGgzVkRaZTd3blRmaTcz?=
 =?utf-8?B?ZHVMbGo2S3hodk1jTjhzcjJnMldLazIyUmQ2cWFhN0NQRkhtaW85YUVEWjY1?=
 =?utf-8?B?TXh5WXJQWE51SUkrUGVaRXFBQ3NyWnJ3aWh3d3FpV3dKUlc3N2R6WDdzMGNL?=
 =?utf-8?B?U0NEaVhxeHM5WFNPb0RITkxGUWJERUIxSEpoU1d1MEJWVXF6RmFNWis0a2tq?=
 =?utf-8?B?UGZ6MjZ5U3JVby9JL0ZzVnVESHdvTExQOGFtSzg1OGYxOWdSc3FmUjMvNm9s?=
 =?utf-8?B?bjN3K0REeHJSRStSSWlzKzFHQk5GVUExOWpjRm1mb2JzWG1oTzcyWlAxWm02?=
 =?utf-8?B?MFYvL0wyaHpERkk0WXBmK1EwL0VXRVU0anZkd09SN2FGcElrakZkRUpQQ3BS?=
 =?utf-8?B?UUhYSEtPakVLa1ZQZkE2TnNYQUpraG05L2QrajFKNmp5QmpNamtZNmo0ZVJG?=
 =?utf-8?B?QUJCY0F2Q3ZrOVFzZ0lSSG1Pemt5eFRSdnllN2xiYVlDejltU3doRVAvZWhP?=
 =?utf-8?B?elVoZVVpNG1GMHdXa3VrZ0pWOTlWV2NLeUFaSzVSTUxjVTJ4UldDWHFJdGUy?=
 =?utf-8?B?TmdYK1I0LzRTazlEcHFQRk12b2FLZGZBZVhhbEcvNFh2d25uUkVwUlI4dVI1?=
 =?utf-8?B?UnQ1Wjh2K0tFeEE2aW51T096SWJrOXREOStoYTcwVnpmU3J2NEM3MmthZi9P?=
 =?utf-8?B?cDlWRzB6TFRyUC9hZkZlNmV2VG9LUnpoeFIrMlVySnRJcmloVlZjaTZsZjF5?=
 =?utf-8?B?cXBuZFAyVG01Y21FcGZwQkxtYjFqSVFucktEWjViZjV5NE5yRVlvY1JyOGlJ?=
 =?utf-8?B?RlFkQk5wWjVsWnp0aVRKdXNSZEpaelBML3BBTzZnY2RFOUo1TEs1YmtZZFdQ?=
 =?utf-8?B?NTQrcFMrbVZOV05Xd2tyMzFNV0s1WmJqRjZrTWFFL2ZRU2JZcDdBQTdNbEtC?=
 =?utf-8?B?YjNCdFhzb2NhYnNIbHdVRTVCd2JjeTNlWlVTOHFrYThxbEhpYXEvYmNLMmZV?=
 =?utf-8?B?WmJsUXZJNGhEYTYvN01iS3lNYnVaQkw1WHg1bHJxODVPYzJ5REtxbFo4TXlE?=
 =?utf-8?B?cENibTNLUzNubXFhREZBWFpwR1p2aE40Skw3SmtnNXhyWXJaSXo3RTBBVm5m?=
 =?utf-8?B?L3dKK0tDSkUxTDIwb2ROZGlOQmFaZEs1bW9weEpBWE1TTHZ4b3lvbTNTakkx?=
 =?utf-8?B?Lzg3SHJrZ0dISjJSUTErZlNCcWJycktqcXpFNGVXbXIwdEZFb0V6TUhxOW5S?=
 =?utf-8?B?Q3l0eHRHNDF3OUgzczFWK29nVTNpNzlxK0krTXhnaWdKMU9kYUdPYkFQVDJG?=
 =?utf-8?B?aHZzZkFwYTBReTkwVHI1ZVFmcmpiZys3dzlicVhKd2d1N2gwRGhlbmcrTkdS?=
 =?utf-8?Q?80d9XoKYN5SMFoUPLN782KAP2HJDX8kRMj24vzw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cda54c9d-fcdf-49ed-f144-08d91a0be7e9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:47:48.8880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHnvk1bBf8x5Gg9zSrHvSIehzYyjR4pXo/yLJ/HKo6/lbB9ep6HsVpByhm/l1ZHEOTrddBeiVNzRl//Mll79Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5575
X-OriginatorOrg: citrix.com

Pass an hvm boolean parameter to the elf note parsing and checking
routines, so that better checking can be done in case libelf is
dealing with an hvm container.

elf_xen_note_check shouldn't return early unless PHYS32_ENTRY is set
and the container is of type HVM, or else the loader and version
checks would be avoided for kernels intended to be booted as PV but
that also have PHYS32_ENTRY set.

Adjust elf_xen_addr_calc_check so that the virtual addresses are
actually physical ones (by setting virt_base and elf_paddr_offset to
zero) when the container is of type HVM, as that container is always
started with paging disabled.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Expand comments.
 - Do not set virt_entry to phys_entry unless it's an HVM container.
---
 tools/fuzz/libelf/libelf-fuzzer.c   |  3 ++-
 tools/libs/guest/xg_dom_elfloader.c |  6 ++++--
 tools/libs/guest/xg_dom_hvmloader.c |  2 +-
 xen/arch/x86/hvm/dom0_build.c       |  2 +-
 xen/arch/x86/pv/dom0_build.c        |  2 +-
 xen/common/libelf/libelf-dominfo.c  | 32 +++++++++++++++++++----------
 xen/include/xen/libelf.h            |  2 +-
 7 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/tools/fuzz/libelf/libelf-fuzzer.c b/tools/fuzz/libelf/libelf-fuzzer.c
index 1ba85717114..84fb84720fa 100644
--- a/tools/fuzz/libelf/libelf-fuzzer.c
+++ b/tools/fuzz/libelf/libelf-fuzzer.c
@@ -17,7 +17,8 @@ int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size)
         return -1;
 
     elf_parse_binary(elf);
-    elf_xen_parse(elf, &parms);
+    elf_xen_parse(elf, &parms, false);
+    elf_xen_parse(elf, &parms, true);
 
     return 0;
 }
diff --git a/tools/libs/guest/xg_dom_elfloader.c b/tools/libs/guest/xg_dom_elfloader.c
index 06e713fe111..ad71163dd92 100644
--- a/tools/libs/guest/xg_dom_elfloader.c
+++ b/tools/libs/guest/xg_dom_elfloader.c
@@ -135,7 +135,8 @@ static elf_negerrnoval xc_dom_probe_elf_kernel(struct xc_dom_image *dom)
      * or else we might be trying to load a plain ELF.
      */
     elf_parse_binary(&elf);
-    rc = elf_xen_parse(&elf, dom->parms);
+    rc = elf_xen_parse(&elf, dom->parms,
+                       dom->container_type == XC_DOM_HVM_CONTAINER);
     if ( rc != 0 )
         return rc;
 
@@ -166,7 +167,8 @@ static elf_negerrnoval xc_dom_parse_elf_kernel(struct xc_dom_image *dom)
 
     /* parse binary and get xen meta info */
     elf_parse_binary(elf);
-    if ( elf_xen_parse(elf, dom->parms) != 0 )
+    if ( elf_xen_parse(elf, dom->parms,
+                       dom->container_type == XC_DOM_HVM_CONTAINER) != 0 )
     {
         rc = -EINVAL;
         goto out;
diff --git a/tools/libs/guest/xg_dom_hvmloader.c b/tools/libs/guest/xg_dom_hvmloader.c
index ec6ebad7fd5..3a63b23ba39 100644
--- a/tools/libs/guest/xg_dom_hvmloader.c
+++ b/tools/libs/guest/xg_dom_hvmloader.c
@@ -73,7 +73,7 @@ static elf_negerrnoval xc_dom_probe_hvm_kernel(struct xc_dom_image *dom)
      * else we might be trying to load a PV kernel.
      */
     elf_parse_binary(&elf);
-    rc = elf_xen_parse(&elf, dom->parms);
+    rc = elf_xen_parse(&elf, dom->parms, true);
     if ( rc == 0 )
         return -EINVAL;
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 878dc1d808e..c24b9efdb0a 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -561,7 +561,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     elf_set_verbose(&elf);
 #endif
     elf_parse_binary(&elf);
-    if ( (rc = elf_xen_parse(&elf, &parms)) != 0 )
+    if ( (rc = elf_xen_parse(&elf, &parms, true)) != 0 )
     {
         printk("Unable to parse kernel for ELFNOTES\n");
         return rc;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e0801a9e6d1..af47615b226 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -353,7 +353,7 @@ int __init dom0_construct_pv(struct domain *d,
         elf_set_verbose(&elf);
 
     elf_parse_binary(&elf);
-    if ( (rc = elf_xen_parse(&elf, &parms)) != 0 )
+    if ( (rc = elf_xen_parse(&elf, &parms, false)) != 0 )
         goto out;
 
     /* compatibility check */
diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index 69c94b6f3bb..5ad2832aa75 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -360,7 +360,7 @@ elf_errorstatus elf_xen_parse_guest_info(struct elf_binary *elf,
 /* sanity checks                                                            */
 
 static elf_errorstatus elf_xen_note_check(struct elf_binary *elf,
-                              struct elf_dom_parms *parms)
+                              struct elf_dom_parms *parms, bool hvm)
 {
     if ( (ELF_PTRVAL_INVALID(parms->elf_note_start)) &&
          (ELF_PTRVAL_INVALID(parms->guest_info)) )
@@ -382,7 +382,7 @@ static elf_errorstatus elf_xen_note_check(struct elf_binary *elf,
     }
 
     /* PVH only requires one ELF note to be set */
-    if ( parms->phys_entry != UNSET_ADDR32 )
+    if ( parms->phys_entry != UNSET_ADDR32 && hvm )
     {
         elf_msg(elf, "ELF: Found PVH image\n");
         return 0;
@@ -414,7 +414,7 @@ static elf_errorstatus elf_xen_note_check(struct elf_binary *elf,
 }
 
 static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
-                                   struct elf_dom_parms *parms)
+                                   struct elf_dom_parms *parms, bool hvm)
 {
     uint64_t virt_offset;
 
@@ -425,8 +425,11 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
         return -1;
     }
 
-    /* Initial guess for virt_base is 0 if it is not explicitly defined. */
-    if ( parms->virt_base == UNSET_ADDR )
+    /*
+     * Initial guess for virt_base is 0 if it is not explicitly defined in the
+     * PV case. For PVH virt_base is forced to 0 because paging is disabled.
+     */
+    if ( parms->virt_base == UNSET_ADDR || hvm )
     {
         parms->virt_base = 0;
         elf_msg(elf, "ELF: VIRT_BASE unset, using %#" PRIx64 "\n",
@@ -441,8 +444,10 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
      *
      * If we are using the modern ELF notes interface then the default
      * is 0.
+     *
+     * For PVH this is forced to 0, as it's already a legacy option for PV.
      */
-    if ( parms->elf_paddr_offset == UNSET_ADDR )
+    if ( parms->elf_paddr_offset == UNSET_ADDR || hvm )
     {
         if ( parms->elf_note_start )
             parms->elf_paddr_offset = 0;
@@ -456,8 +461,13 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
     parms->virt_kstart = elf->pstart + virt_offset;
     parms->virt_kend   = elf->pend   + virt_offset;
 
-    if ( parms->virt_entry == UNSET_ADDR )
-        parms->virt_entry = elf_uval(elf, elf->ehdr, e_entry);
+    if ( parms->virt_entry == UNSET_ADDR || hvm )
+    {
+        if ( parms->phys_entry != UNSET_ADDR32 && hvm )
+            parms->virt_entry = parms->phys_entry;
+        else
+            parms->virt_entry = elf_uval(elf, elf->ehdr, e_entry);
+    }
 
     if ( parms->bsd_symtab )
     {
@@ -499,7 +509,7 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
 /* glue it all together ...                                                 */
 
 elf_errorstatus elf_xen_parse(struct elf_binary *elf,
-                  struct elf_dom_parms *parms)
+                  struct elf_dom_parms *parms, bool hvm)
 {
     ELF_HANDLE_DECL(elf_shdr) shdr;
     ELF_HANDLE_DECL(elf_phdr) phdr;
@@ -594,9 +604,9 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
         }
     }
 
-    if ( elf_xen_note_check(elf, parms) != 0 )
+    if ( elf_xen_note_check(elf, parms, hvm) != 0 )
         return -1;
-    if ( elf_xen_addr_calc_check(elf, parms) != 0 )
+    if ( elf_xen_addr_calc_check(elf, parms, hvm) != 0 )
         return -1;
     return 0;
 }
diff --git a/xen/include/xen/libelf.h b/xen/include/xen/libelf.h
index b73998150fc..be47b0cc366 100644
--- a/xen/include/xen/libelf.h
+++ b/xen/include/xen/libelf.h
@@ -454,7 +454,7 @@ int elf_xen_parse_note(struct elf_binary *elf,
 int elf_xen_parse_guest_info(struct elf_binary *elf,
                              struct elf_dom_parms *parms);
 int elf_xen_parse(struct elf_binary *elf,
-                  struct elf_dom_parms *parms);
+                  struct elf_dom_parms *parms, bool hvm);
 
 static inline void *elf_memcpy_unchecked(void *dest, const void *src, size_t n)
     { return memcpy(dest, src, n); }
-- 
2.31.1


