Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DC150A24C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 16:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310269.527000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhXmb-00047j-3f; Thu, 21 Apr 2022 14:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310269.527000; Thu, 21 Apr 2022 14:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhXma-00045W-VK; Thu, 21 Apr 2022 14:27:44 +0000
Received: by outflank-mailman (input) for mailman id 310269;
 Thu, 21 Apr 2022 14:27:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhXmZ-00045H-2D
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 14:27:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33388cb4-c17f-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 16:27:40 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-nJMVboWaMnGkN5yYamz2JQ-1; Thu, 21 Apr 2022 16:27:39 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4212.eurprd04.prod.outlook.com (2603:10a6:208:61::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 14:27:36 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 14:27:36 +0000
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
X-Inumbo-ID: 33388cb4-c17f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650551260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWdwfKUrs9ihaFZt4+efMhrvLkEmtIW52vKm8ENeA7A=;
	b=Lg09KJe6fh5mryPnA/Tatobq2t1pHzNkN1VWMjJMQcSMObkbAfaYf6fVxI8+RusYKEtlo1
	8QY6VqVJ9TPslcfwH4Ccnfto/A6vCPdJ3HW4sz2c8bRVuB4VAjYCF40x3jtjMYl7Kf8Uz9
	FqZTxxHK4xrTyNycVzlXURpqUWx83wY=
X-MC-Unique: nJMVboWaMnGkN5yYamz2JQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IG+KugfvkBmUE4PC1uhw4q2OLY6gK83Tvdxuw6AmTRtnW4Oq8Vhm4ZP7gT9BufKTAXYPPTBwcyoA9Iyy36ujv2XXtPTtemTngOzEdUI6H77dW0ZfAEdRpfAA1oaZKhqJGTvKQ6oU0F9O529972kkcGORcQKIfrzgUyiChTQBbi9bGLoKZf+BuFq+Aau03kDyPU/a9v5uMseEw2/3s/uq5CNW/ibHYXUqWNDOZzo9sN3HFlZFwBNmOd7ZJ6hZ+1N+Id9iDr527HFs3qSEwm0CHyqTmHPBGWBeWEAho5FY0rXlyah0Mgh7fSUEMvq5OqE8mUnP2bEjSUHqbed0tJ0alA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/s+/HBY9mvZq6p2p3A8ING0ScEKZEB0bVsd3PcRhr6o=;
 b=Q1CD3YKrCiXT/Tup0akj3/d6XdNHRmHQZJg3k3WMm6paoEIjSyhkLGab4XgCDVlrf6XX0WUQHhD5iL6Paj5lGGe8WUpbNahksGWi0ZAFW/tNFsAkoh3s3ZILbXmMK8HUhEwoPe2kJhP4qCxQmnxjIO0RpjnBZGVdLF9R1Nwf9tNy2YkK2tVAP34WZ3F1S6LQO3k2bqiYmy437Finky6+JGjTQn8c3dyHzOTfGbhl6CHa7o0/xCqoAK2JSk4LYmvCiyZUAZ69ZYND7WI2zWZZyeVsuOAMcMYYdj0kpRIxA60GOPbmtsQuPfMcDz85yivO/1JkvGrcwtAlpK7QWIcGqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <609d222f-16db-52c1-1875-0843515a54d7@suse.com>
Date: Thu, 21 Apr 2022 16:27:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH v2 2/2] PCI: replace "secondary" flavors of
 PCI_{DEVFN,BDF,SBDF}()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <9a471a5f-497b-1015-8554-68117863f48a@suse.com>
In-Reply-To: <9a471a5f-497b-1015-8554-68117863f48a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0142.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::27) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0be1c450-5d12-4c69-6234-08da23a314f2
X-MS-TrafficTypeDiagnostic: AM0PR04MB4212:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4212B713F91E947E5FB7B089B3F49@AM0PR04MB4212.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KCDpx35zdcdGnp6ZkpZNFmd9j/u6dYw1kcBERfuof+lIP/Splha3Zff5Q3cVOK+Q/KMZMfJiSBXyokgl9IdfeaZ93n3o4fp1ZugIcwRp6r40d1kevbQTlkIPAFqUV8dIAdfwUB4wfrLS5QNlJqN7qUsBp/Gn7ZElAkMbafRvGNnrHY82ZSzBWVGkY0Qn/EnOGjRachxRdtmwEuvlZA6NnVtFD3JDQvnMK+d8ibH2/wdHyqvkd/2D9+2W6aJs3wnqIvNt10vkX9SM/459zlqBN21seybmCHZBmAuk0ke6+dcfbHZR1pCYZVZZJ5cGGdpDWNv2jJTRBp0WsXx7con2hEjrb9l81nIm5dEdsv2C2dQJbPKjJkWTHR23z6lWNmj4S2AH9zWeNsGtqjiyy1ghxwcfHJ9iYf7JowIbBG41wuLEoOzHj+BnthxewsXXdwKTb31ZHv4RTmpehFaPoD3UbJ3qklpuI5KaoxU7dSVVqQKeUxxZoQeIfUqj6dLpt9IZVxq1SUhmxL1W1gQPDQlJV2/dwK1dfD5ZE1mp5j5HJCNTaIGZanMRasFoSqvs+VwLdnFJSKR34FnlCvbJUFmlka3fpNOKUZiHLv5AfIWFUp6ZY4vN+cDiMpTsQ9RMjRH0+kKf/4cL6DFPZpbbkjpn0W+zeqsZFwvTNgdSP6CJURu90kOI4ndgAQhn5zlHJPlyeyw6ba5tpvLP6pwkrC7R+CpUi30YM6S2Rhvfb6Gb4bu3GJLE5AVphPw6mjuJjkQjuBE3dMyqiilgQde0nvBocw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(508600001)(6506007)(66946007)(6512007)(30864003)(8676002)(86362001)(8936002)(66556008)(38100700002)(66476007)(54906003)(6916009)(36756003)(4326008)(31686004)(83380400001)(5660300002)(2906002)(2616005)(186003)(316002)(26005)(31696002)(43740500002)(45980500001)(579004)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I0La3gjmj9vu3sCaOLfJM84dvgncUOA5SBNeM1EIB9BXbH/hlYH0yYlqtm0v?=
 =?us-ascii?Q?VAJLgKLgnwd8k6KRXsK45vnRgkclZY2GY2ia8PYYVSw+oyhvpLzwVEXmy1Ci?=
 =?us-ascii?Q?I2oA/kAnEqFbVwhiq54QOA7phrVdmj+EG6tbQO/EOX9nGqDpmYYpFkOwMnOI?=
 =?us-ascii?Q?3gzxx45QrVFzGr3Kkomx/DXEjLRF5YgHPLzhhAGikKd4WEaL9Nd7AOpLruqW?=
 =?us-ascii?Q?W0u1uVmJK7sn2fVo3i+shJ8whMRooDrZbKq83g+ZF7x53z2a9yHN7reo5On9?=
 =?us-ascii?Q?GZq1xYorQG1G0orq4TEszOYKmXfmnZsmA9IIuikSuZwtq/2H2+04YJx5BrSU?=
 =?us-ascii?Q?aohy/L8WNP0dsK5KEgEH07mFRkF6oe/P/cs34q2B5U0T20KHmfo+eebYAh+6?=
 =?us-ascii?Q?QBcydnJ5GG5+kd4UWvB9ei15UTnjf5yZhCBUb7fSXC5ChUUgH1+DNrrI9fyW?=
 =?us-ascii?Q?ygnuqZuRNA1MGdPNXcxB2PUIjYMxfR1Ih0IQ8c5qS7Qa6ifKbahtDTBPJCcC?=
 =?us-ascii?Q?Va92baEIhsV8cdpeOmwJ3e52j5+KFYLrjMnlCh4w/qVnCvIKzoU/WzGVFL58?=
 =?us-ascii?Q?PXZq8ptIXBgp26VrZl7oSusjyGFISXDB4Ht70WVm5mPBSFjq1kORIlWnnKfK?=
 =?us-ascii?Q?VEVObuQZcvpLgiFGqEYwT/HHtdexoz8ulduo+PkFARWJoWRlh3MqaHdFwpt6?=
 =?us-ascii?Q?ls13zxgBzD8BpD4iLQWa4C7g1zubjinkMAmszcInPrc8cQ0DvL4xZ7rmcb6W?=
 =?us-ascii?Q?9hvCg4/VTh6xWemcN+fKGzqk/Ed2laLlBcPzxReHL+x8R7QC2M8I+I/zHUsW?=
 =?us-ascii?Q?ht59/f/imKmwl2STKkWLAnmfiRKO+vAk/M1xsUAYJgf5eEAZkditl8gtjLAD?=
 =?us-ascii?Q?RaZqCNUT/cLaUmCDQrkKiOgcNcNXlEWUXbCOh2w8UjL62I4FVWE5Tvh6w3Ux?=
 =?us-ascii?Q?yK9LkOzTwax69JRlzngnWUJXGYW7IH+M1CjUTlklnqtYjuDH9GemAi6D2D44?=
 =?us-ascii?Q?0XU4X/aYlWIKg1XomQ71ZGQ6k9CXjMvTywZDPqTqT0PoiSaZXrztIJ/VhD3+?=
 =?us-ascii?Q?jXZkcizULzKXj+8ZW22gfoErL/gECErCx89YyRJOLZg6zfrM3j2fxcEheWXe?=
 =?us-ascii?Q?g3EKQAIWyxCxHTo2T66DnYWXPC8RbutgSUrq6rnn5K5mta/bmKA7l/AtASWQ?=
 =?us-ascii?Q?hUvDrhbjCNQIV7ZjKowk82ZXPRdmBXe7DIizdDuZVRwlqZUYQ0rqpkeMCtPO?=
 =?us-ascii?Q?VmIoMIymlzTbKHoYetuzIqbPtaWEJlyZd43emFu64So/rGKRYTLptPIxyiLP?=
 =?us-ascii?Q?Qg40JzRumEFGRFrO3mdY++PjgTWnTt8b0xw1pc7cM1TxRWWiYXvDFbG1DzPP?=
 =?us-ascii?Q?m6PgVqQvoxoGtkxWC1Eq6DZzcrv48JdLNDLIOpbeoNouJzCvQi53/QRhYXdx?=
 =?us-ascii?Q?RQx2t+NQwShcRu38i6/kFrwPICxkgHVMhqeHMR+RdVSYOuKtyZuYvfAs4Cct?=
 =?us-ascii?Q?Odpt4HETgopQqrO98mkpw1bUPYG2skllnIyRL3cGlBIU39Oh2MnkyLXjud4c?=
 =?us-ascii?Q?3Mk7s4LOVZzAGKoRoEbWA2uxxe2GAV3u60tPGleZzXlreeG6bAM4bUVPbz7j?=
 =?us-ascii?Q?ab+gvvFQUzwUaaO9k6c1gttXtjoLohbtDPTG3NtBPctLwH/FcAMVrWzryqlR?=
 =?us-ascii?Q?8d0pC8bTH6Hh+4ShodeabxRZuhaKH2IyDMRBcEKZBqP7szBLM0bKsm2Iu0Sg?=
 =?us-ascii?Q?dRof+hLZKw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be1c450-5d12-4c69-6234-08da23a314f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 14:27:36.5666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJJIzHrZouT23MafIL1SF/37nqNkyUTrgAR1fVKulKsZv39CtyrWdmrTl4Ti79ho0NJk+ubGJWjuv4KQnPmcsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4212

At their use sites the numeric suffixes are at least odd to read, first
and foremost for PCI_DEVFN2() where the suffix doesn't even match the
number of arguments. Make use of count_args() such that a single flavor
each suffices (leaving aside helper macros, which aren't supposed to be
used from the outside).

In parse_ppr_log_entry() take the opportunity and drop two local
variables and convert an assignment to an initializer.

In VT-d code fold a number of bus+devfn comparison pairs into a single
BDF comparison.

No change to generated code for the vast majority of the adjustments.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4902,7 +4902,7 @@ int cf_check mmcfg_intercept_write(
     if ( pci_conf_write_intercept(mmio_ctxt->seg, mmio_ctxt->bdf,
                                   offset, bytes, p_data) >=3D 0 )
         pci_mmcfg_write(mmio_ctxt->seg, PCI_BUS(mmio_ctxt->bdf),
-                        PCI_DEVFN2(mmio_ctxt->bdf), offset, bytes,
+                        PCI_DEVFN(mmio_ctxt->bdf), offset, bytes,
                         *(uint32_t *)p_data);
=20
     return X86EMUL_OKAY;
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -90,7 +90,7 @@ int pci_conf_write_intercept(unsigned in
=20
     pcidevs_lock();
=20
-    pdev =3D pci_get_pdev(seg, PCI_BUS(bdf), PCI_DEVFN2(bdf));
+    pdev =3D pci_get_pdev(seg, PCI_BUS(bdf), PCI_DEVFN(bdf));
     if ( pdev )
         rc =3D pci_msi_conf_write_intercept(pdev, reg, size, data);
=20
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -313,7 +313,7 @@ static int __init pci_mmcfg_check_hostbr
     for (i =3D 0; !name && i < ARRAY_SIZE(pci_mmcfg_probes); i++) {
         bus =3D  pci_mmcfg_probes[i].bus;
         devfn =3D pci_mmcfg_probes[i].devfn;
-        l =3D pci_conf_read32(PCI_SBDF3(0, bus, devfn), 0);
+        l =3D pci_conf_read32(PCI_SBDF(0, bus, devfn), 0);
         vendor =3D l & 0xffff;
         device =3D (l >> 16) & 0xffff;
=20
--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -27,8 +27,8 @@ static int cf_check get_reserved_device_
     xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt)
 {
     struct get_reserved_device_memory *grdm =3D ctxt;
-    uint32_t sbdf =3D PCI_SBDF3(grdm->map.dev.pci.seg, grdm->map.dev.pci.b=
us,
-                              grdm->map.dev.pci.devfn).sbdf;
+    uint32_t sbdf =3D PCI_SBDF(grdm->map.dev.pci.seg, grdm->map.dev.pci.bu=
s,
+                             grdm->map.dev.pci.devfn).sbdf;
=20
     if ( !(grdm->map.flags & XENMEM_RDM_ALL) && (sbdf !=3D id) )
         return 0;
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1055,8 +1055,8 @@ static int cf_check get_reserved_device_
     xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt)
 {
     struct get_reserved_device_memory *grdm =3D ctxt;
-    uint32_t sbdf =3D PCI_SBDF3(grdm->map.dev.pci.seg, grdm->map.dev.pci.b=
us,
-                              grdm->map.dev.pci.devfn).sbdf;
+    uint32_t sbdf =3D PCI_SBDF(grdm->map.dev.pci.seg, grdm->map.dev.pci.bu=
s,
+                             grdm->map.dev.pci.devfn).sbdf;
=20
     if ( !(grdm->map.flags & XENMEM_RDM_ALL) && (sbdf !=3D id) )
         return 0;
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -96,7 +96,7 @@ static void __init add_ivrs_mapping_entr
=20
             if ( !ivrs_mappings[alias_id].intremap_table )
                 panic("No memory for %pp's IRT\n",
-                      &PCI_SBDF2(iommu->seg, alias_id));
+                      &PCI_SBDF(iommu->seg, alias_id));
         }
     }
=20
@@ -790,7 +790,7 @@ static u16 __init parse_ivhd_device_spec
     }
=20
     AMD_IOMMU_DEBUG("IVHD Special: %pp variety %#x handle %#x\n",
-                    &PCI_SBDF2(seg, bdf), special->variety, special->handl=
e);
+                    &PCI_SBDF(seg, bdf), special->variety, special->handle=
);
     add_ivrs_mapping_entry(bdf, bdf, special->header.data_setting, 0, true=
,
                            iommu);
=20
@@ -816,7 +816,7 @@ static u16 __init parse_ivhd_device_spec
             AMD_IOMMU_DEBUG("IVHD: Command line override present for IO-AP=
IC %#x"
                             "(IVRS: %#x devID %pp)\n",
                             ioapic_sbdf[idx].id, special->handle,
-                            &PCI_SBDF2(seg, bdf));
+                            &PCI_SBDF(seg, bdf));
             break;
         }
=20
@@ -888,7 +888,7 @@ static u16 __init parse_ivhd_device_spec
             AMD_IOMMU_DEBUG("IVHD: Command line override present for HPET =
%#x "
                             "(IVRS: %#x devID %pp)\n",
                             hpet_sbdf.id, special->handle,
-                            &PCI_SBDF2(seg, bdf));
+                            &PCI_SBDF(seg, bdf));
             break;
         case HPET_NONE:
             /* set device id of hpet */
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -40,7 +40,7 @@ static void send_iommu_command(struct am
                      IOMMU_RING_BUFFER_PTR_MASK) )
     {
         printk_once(XENLOG_ERR "AMD IOMMU %pp: no cmd slot available\n",
-                    &PCI_SBDF2(iommu->seg, iommu->bdf));
+                    &PCI_SBDF(iommu->seg, iommu->bdf));
         cpu_relax();
     }
=20
@@ -84,7 +84,7 @@ static void flush_command_buffer(struct
             threshold |=3D threshold << 1;
             printk(XENLOG_WARNING
                    "AMD IOMMU %pp: %scompletion wait taking too long\n",
-                   &PCI_SBDF2(iommu->seg, iommu->bdf),
+                   &PCI_SBDF(iommu->seg, iommu->bdf),
                    timeout_base ? "iotlb " : "");
             timeout =3D 0;
         }
@@ -94,7 +94,7 @@ static void flush_command_buffer(struct
     if ( !timeout )
         printk(XENLOG_WARNING
                "AMD IOMMU %pp: %scompletion wait took %lums\n",
-               &PCI_SBDF2(iommu->seg, iommu->bdf),
+               &PCI_SBDF(iommu->seg, iommu->bdf),
                timeout_base ? "iotlb " : "",
                (NOW() - start) / 10000000);
 }
@@ -292,14 +292,14 @@ void amd_iommu_flush_iotlb(u8 devfn, con
     if ( !iommu )
     {
         AMD_IOMMU_WARN("can't find IOMMU for %pp\n",
-                       &PCI_SBDF3(pdev->seg, pdev->bus, devfn));
+                       &PCI_SBDF(pdev->seg, pdev->bus, devfn));
         return;
     }
=20
     if ( !iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
         return;
=20
-    req_id =3D get_dma_requestor_id(iommu->seg, PCI_BDF2(pdev->bus, devfn)=
);
+    req_id =3D get_dma_requestor_id(iommu->seg, PCI_BDF(pdev->bus, devfn))=
;
     queueid =3D req_id;
     maxpend =3D pdev->ats.queue_depth & 0xff;
=20
--- a/xen/drivers/passthrough/amd/iommu_detect.c
+++ b/xen/drivers/passthrough/amd/iommu_detect.c
@@ -231,7 +231,7 @@ int __init amd_iommu_detect_one_acpi(
     rt =3D pci_ro_device(iommu->seg, bus, PCI_DEVFN(dev, func));
     if ( rt )
         printk(XENLOG_ERR "Could not mark config space of %pp read-only (%=
d)\n",
-               &PCI_SBDF2(iommu->seg, iommu->bdf), rt);
+               &PCI_SBDF(iommu->seg, iommu->bdf), rt);
=20
     list_add_tail(&iommu->list, &amd_iommu_head);
     rt =3D 0;
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -562,7 +562,7 @@ static void cf_check parse_event_log_ent
=20
         printk(XENLOG_ERR "AMD-Vi: %s: %pp d%u addr %016"PRIx64
                " flags %#x%s%s%s%s%s%s%s%s%s%s\n",
-               code_str, &PCI_SBDF2(iommu->seg, device_id),
+               code_str, &PCI_SBDF(iommu->seg, device_id),
                domain_id, addr, flags,
                (flags & 0xe00) ? " ??" : "",
                (flags & 0x100) ? " TR" : "",
@@ -578,7 +578,7 @@ static void cf_check parse_event_log_ent
         for ( bdf =3D 0; bdf < ivrs_bdf_entries; bdf++ )
             if ( get_dma_requestor_id(iommu->seg, bdf) =3D=3D device_id )
                 pci_check_disable_device(iommu->seg, PCI_BUS(bdf),
-                                         PCI_DEVFN2(bdf));
+                                         PCI_DEVFN(bdf));
     }
     else
         printk(XENLOG_ERR "%s %08x %08x %08x %08x\n",
@@ -631,18 +631,13 @@ static void iommu_check_event_log(struct
=20
 static void cf_check parse_ppr_log_entry(struct amd_iommu *iommu, u32 entr=
y[])
 {
-
-    u16 device_id;
-    u8 bus, devfn;
-    struct pci_dev *pdev;
-
     /* here device_id is physical value */
-    device_id =3D iommu_get_devid_from_cmd(entry[0]);
-    bus =3D PCI_BUS(device_id);
-    devfn =3D PCI_DEVFN2(device_id);
+    uint16_t device_id =3D iommu_get_devid_from_cmd(entry[0]);
+    struct pci_dev *pdev;
=20
     pcidevs_lock();
-    pdev =3D pci_get_real_pdev(iommu->seg, bus, devfn);
+    pdev =3D pci_get_real_pdev(iommu->seg, PCI_BUS(device_id),
+                             PCI_DEVFN(device_id));
     pcidevs_unlock();
=20
     if ( pdev )
@@ -751,12 +746,12 @@ static bool_t __init set_iommu_interrupt
=20
     pcidevs_lock();
     iommu->msi.dev =3D pci_get_pdev(iommu->seg, PCI_BUS(iommu->bdf),
-                                  PCI_DEVFN2(iommu->bdf));
+                                  PCI_DEVFN(iommu->bdf));
     pcidevs_unlock();
     if ( !iommu->msi.dev )
     {
         AMD_IOMMU_WARN("no pdev for %pp\n",
-                       &PCI_SBDF2(iommu->seg, iommu->bdf));
+                       &PCI_SBDF(iommu->seg, iommu->bdf));
         return 0;
     }
=20
@@ -778,7 +773,7 @@ static bool_t __init set_iommu_interrupt
         hw_irq_controller *handler;
         u16 control;
=20
-        control =3D pci_conf_read16(PCI_SBDF2(iommu->seg, iommu->bdf),
+        control =3D pci_conf_read16(PCI_SBDF(iommu->seg, iommu->bdf),
                                   iommu->msi.msi_attrib.pos + PCI_MSI_FLAG=
S);
=20
         iommu->msi.msi.nvec =3D 1;
@@ -842,22 +837,22 @@ static void amd_iommu_erratum_746_workar
          (boot_cpu_data.x86_model > 0x1f) )
         return;
=20
-    pci_conf_write32(PCI_SBDF2(iommu->seg, iommu->bdf), 0xf0, 0x90);
-    value =3D pci_conf_read32(PCI_SBDF2(iommu->seg, iommu->bdf), 0xf4);
+    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90);
+    value =3D pci_conf_read32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf4);
=20
     if ( value & (1 << 2) )
         return;
=20
     /* Select NB indirect register 0x90 and enable writing */
-    pci_conf_write32(PCI_SBDF2(iommu->seg, iommu->bdf), 0xf0, 0x90 | (1 <<=
 8));
+    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90 | (1 << =
8));
=20
-    pci_conf_write32(PCI_SBDF2(iommu->seg, iommu->bdf), 0xf4, value | (1 <=
< 2));
+    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf4, value | (1 <<=
 2));
     printk(XENLOG_INFO
            "AMD-Vi: Applying erratum 746 workaround for IOMMU at %pp\n",
-           &PCI_SBDF2(iommu->seg, iommu->bdf));
+           &PCI_SBDF(iommu->seg, iommu->bdf));
=20
     /* Clear the enable writing bit */
-    pci_conf_write32(PCI_SBDF2(iommu->seg, iommu->bdf), 0xf0, 0x90);
+    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90);
 }
=20
 static void enable_iommu(struct amd_iommu *iommu)
@@ -1288,7 +1283,7 @@ static int __init cf_check amd_iommu_set
                 if ( !pci_init )
                     continue;
                 pcidevs_lock();
-                pdev =3D pci_get_pdev(seg, PCI_BUS(bdf), PCI_DEVFN2(bdf));
+                pdev =3D pci_get_pdev(seg, PCI_BUS(bdf), PCI_DEVFN(bdf));
                 pcidevs_unlock();
             }
=20
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -604,7 +604,7 @@ static struct amd_iommu *_find_iommu_for
     if ( iommu )
         return iommu;
=20
-    AMD_IOMMU_DEBUG("No IOMMU for MSI dev =3D %pp\n", &PCI_SBDF2(seg, bdf)=
);
+    AMD_IOMMU_DEBUG("No IOMMU for MSI dev =3D %pp\n", &PCI_SBDF(seg, bdf))=
;
     return ERR_PTR(-EINVAL);
 }
=20
@@ -814,7 +814,7 @@ static void dump_intremap_table(const st
         if ( ivrs_mapping )
         {
             printk("  %pp:\n",
-                   &PCI_SBDF2(iommu->seg, ivrs_mapping->dte_requestor_id))=
;
+                   &PCI_SBDF(iommu->seg, ivrs_mapping->dte_requestor_id));
             ivrs_mapping =3D NULL;
         }
=20
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -534,7 +534,7 @@ int cf_check amd_iommu_get_reserved_devi
=20
     for ( bdf =3D 0; bdf < ivrs_bdf_entries; ++bdf )
     {
-        pci_sbdf_t sbdf =3D PCI_SBDF2(seg, bdf);
+        pci_sbdf_t sbdf =3D PCI_SBDF(seg, bdf);
         const struct ivrs_unity_map *um =3D ivrs_mappings[bdf].unity_map;
         unsigned int req =3D ivrs_mappings[bdf].dte_requestor_id;
         const struct amd_iommu *iommu =3D ivrs_mappings[bdf].iommu;
@@ -563,7 +563,7 @@ int cf_check amd_iommu_get_reserved_devi
              * the same alias ID.
              */
             if ( bdf !=3D req && ivrs_mappings[req].iommu &&
-                 func(0, 0, PCI_SBDF2(seg, req).sbdf, ctxt) )
+                 func(0, 0, PCI_SBDF(seg, req).sbdf, ctxt) )
                 continue;
=20
             if ( global =3D=3D pending )
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -53,7 +53,7 @@ struct amd_iommu *find_iommu_for_device(
             ivrs_mappings[bdf] =3D tmp;
=20
             printk(XENLOG_WARNING "%pp not found in ACPI tables;"
-                   " using same IOMMU as function 0\n", &PCI_SBDF2(seg, bd=
f));
+                   " using same IOMMU as function 0\n", &PCI_SBDF(seg, bdf=
));
=20
             /* write iommu field last */
             ivrs_mappings[bdf].iommu =3D ivrs_mappings[bd0].iommu;
@@ -144,7 +144,7 @@ static int __must_check amd_iommu_setup_
                | (ivrs_dev->unity_map ? SET_ROOT_WITH_UNITY_MAP : 0);
=20
     /* get device-table entry */
-    req_id =3D get_dma_requestor_id(iommu->seg, PCI_BDF2(bus, devfn));
+    req_id =3D get_dma_requestor_id(iommu->seg, PCI_BDF(bus, devfn));
     table =3D iommu->dev_table.buffer;
     dte =3D &table[req_id];
     ivrs_dev =3D &get_ivrs_mappings(iommu->seg)[req_id];
@@ -202,7 +202,7 @@ static int __must_check amd_iommu_setup_
          * presence.  But let's deal with that case only if it is actually
          * found in the wild.
          */
-        if ( req_id !=3D PCI_BDF2(bus, devfn) &&
+        if ( req_id !=3D PCI_BDF(bus, devfn) &&
              (sr_flags & SET_ROOT_WITH_UNITY_MAP) )
             rc =3D -EOPNOTSUPP;
         else
@@ -231,7 +231,7 @@ static int __must_check amd_iommu_setup_
              (any_pdev_behind_iommu(pdev->domain, pdev, iommu) ||
               pdev->phantom_stride) )
             AMD_IOMMU_WARN(" %pp: reassignment may cause %pd data corrupti=
on\n",
-                           &PCI_SBDF3(pdev->seg, bus, devfn), pdev->domain=
);
+                           &PCI_SBDF(pdev->seg, bus, devfn), pdev->domain)=
;
=20
         /*
          * Check remaining settings are still in place from an earlier cal=
l
@@ -414,7 +414,7 @@ static void amd_iommu_disable_domain_dev
         disable_ats_device(pdev);
=20
     BUG_ON ( iommu->dev_table.buffer =3D=3D NULL );
-    req_id =3D get_dma_requestor_id(iommu->seg, PCI_BDF2(bus, devfn));
+    req_id =3D get_dma_requestor_id(iommu->seg, PCI_BDF(bus, devfn));
     table =3D iommu->dev_table.buffer;
     dte =3D &table[req_id];
=20
@@ -461,7 +461,7 @@ static int cf_check reassign_device(
     if ( !iommu )
     {
         AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be assigned to %p=
d\n",
-                       &PCI_SBDF3(pdev->seg, pdev->bus, devfn), target);
+                       &PCI_SBDF(pdev->seg, pdev->bus, devfn), target);
         return -ENODEV;
     }
=20
@@ -488,7 +488,7 @@ static int cf_check reassign_device(
     if ( !is_hardware_domain(source) )
     {
         const struct ivrs_mappings *ivrs_mappings =3D get_ivrs_mappings(pd=
ev->seg);
-        unsigned int bdf =3D PCI_BDF2(pdev->bus, devfn);
+        unsigned int bdf =3D PCI_BDF(pdev->bus, devfn);
=20
         rc =3D amd_iommu_reserve_domain_unity_unmap(
                  source,
@@ -498,7 +498,7 @@ static int cf_check reassign_device(
     }
=20
     AMD_IOMMU_DEBUG("Re-assign %pp from %pd to %pd\n",
-                    &PCI_SBDF3(pdev->seg, pdev->bus, devfn), source, targe=
t);
+                    &PCI_SBDF(pdev->seg, pdev->bus, devfn), source, target=
);
=20
     return 0;
 }
@@ -507,7 +507,7 @@ static int cf_check amd_iommu_assign_dev
     struct domain *d, u8 devfn, struct pci_dev *pdev, u32 flag)
 {
     struct ivrs_mappings *ivrs_mappings =3D get_ivrs_mappings(pdev->seg);
-    int bdf =3D PCI_BDF2(pdev->bus, devfn);
+    unsigned int bdf =3D PCI_BDF(pdev->bus, devfn);
     int req_id =3D get_dma_requestor_id(pdev->seg, bdf);
     int rc =3D amd_iommu_reserve_domain_unity_map(
                  d, ivrs_mappings[req_id].unity_map, flag);
@@ -575,12 +575,12 @@ static int cf_check amd_iommu_add_device
         }
=20
         AMD_IOMMU_WARN("no IOMMU for %pp; cannot be handed to %pd\n",
-                        &PCI_SBDF3(pdev->seg, pdev->bus, devfn), pdev->dom=
ain);
+                        &PCI_SBDF(pdev->seg, pdev->bus, devfn), pdev->doma=
in);
         return -ENODEV;
     }
=20
     ivrs_mappings =3D get_ivrs_mappings(pdev->seg);
-    bdf =3D PCI_BDF2(pdev->bus, devfn);
+    bdf =3D PCI_BDF(pdev->bus, devfn);
     if ( !ivrs_mappings ||
          !ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].valid )
         return -EPERM;
@@ -618,7 +618,7 @@ static int cf_check amd_iommu_add_device
              ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].unity_map,
              0) )
         AMD_IOMMU_WARN("%pd: unity mapping failed for %pp\n",
-                       pdev->domain, &PCI_SBDF2(pdev->seg, bdf));
+                       pdev->domain, &PCI_SBDF(pdev->seg, bdf));
=20
     if ( iommu_quarantine && pdev->arch.pseudo_domid =3D=3D DOMID_INVALID =
)
     {
@@ -651,20 +651,20 @@ static int cf_check amd_iommu_remove_dev
     if ( !iommu )
     {
         AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be removed from %=
pd\n",
-                        &PCI_SBDF3(pdev->seg, pdev->bus, devfn), pdev->dom=
ain);
+                        &PCI_SBDF(pdev->seg, pdev->bus, devfn), pdev->doma=
in);
         return -ENODEV;
     }
=20
     amd_iommu_disable_domain_device(pdev->domain, iommu, devfn, pdev);
=20
     ivrs_mappings =3D get_ivrs_mappings(pdev->seg);
-    bdf =3D PCI_BDF2(pdev->bus, devfn);
+    bdf =3D PCI_BDF(pdev->bus, devfn);
=20
     if ( amd_iommu_reserve_domain_unity_unmap(
              pdev->domain,
              ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].unity_map)=
 )
         AMD_IOMMU_WARN("%pd: unity unmapping failed for %pp\n",
-                       pdev->domain, &PCI_SBDF2(pdev->seg, bdf));
+                       pdev->domain, &PCI_SBDF(pdev->seg, bdf));
=20
     amd_iommu_quarantine_teardown(pdev);
=20
@@ -681,7 +681,7 @@ static int cf_check amd_iommu_remove_dev
=20
 static int cf_check amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 {
-    int bdf =3D PCI_BDF2(bus, devfn);
+    unsigned int bdf =3D PCI_BDF(bus, devfn);
=20
     return (bdf < ivrs_bdf_entries) ? get_dma_requestor_id(seg, bdf) : bdf=
;
 }
--- a/xen/drivers/passthrough/ats.h
+++ b/xen/drivers/passthrough/ats.h
@@ -35,7 +35,7 @@ static inline int pci_ats_enabled(int se
     pos =3D pci_find_ext_capability(seg, bus, devfn, PCI_EXT_CAP_ID_ATS);
     BUG_ON(!pos);
=20
-    value =3D pci_conf_read16(PCI_SBDF3(seg, bus, devfn), pos + ATS_REG_CT=
L);
+    value =3D pci_conf_read16(PCI_SBDF(seg, bus, devfn), pos + ATS_REG_CTL=
);
=20
     return value & ATS_ENABLE;
 }
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -553,7 +553,7 @@ int __init pci_ro_device(int seg, int bu
         memset(pseg->ro_map, 0, sz);
     }
=20
-    __set_bit(PCI_BDF2(bus, devfn), pseg->ro_map);
+    __set_bit(PCI_BDF(bus, devfn), pseg->ro_map);
     _pci_hide_device(pdev);
=20
     return 0;
@@ -957,7 +957,7 @@ static int deassign_device(struct domain
  out:
     if ( ret )
         printk(XENLOG_G_ERR "%pd: deassign (%pp) failed (%d)\n",
-               d, &PCI_SBDF3(seg, bus, devfn), ret);
+               d, &PCI_SBDF(seg, bus, devfn), ret);
=20
     return ret;
 }
@@ -1406,7 +1406,7 @@ static int iommu_add_device(struct pci_d
         rc =3D iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(=
pdev));
         if ( rc )
             printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
-                   &PCI_SBDF3(pdev->seg, pdev->bus, devfn), rc);
+                   &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
     }
 }
=20
@@ -1452,7 +1452,7 @@ static int iommu_remove_device(struct pc
             continue;
=20
         printk(XENLOG_ERR "IOMMU: remove %pp failed (%d)\n",
-               &PCI_SBDF3(pdev->seg, pdev->bus, devfn), rc);
+               &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
         return rc;
     }
=20
@@ -1536,7 +1536,7 @@ static int assign_device(struct domain *
  done:
     if ( rc )
         printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
-               d, &PCI_SBDF3(seg, bus, devfn), rc);
+               d, &PCI_SBDF(seg, bus, devfn), rc);
     /* The device is assigned to dom_io so mark it as quarantined */
     else if ( d =3D=3D dom_io )
         pdev->quarantine =3D true;
@@ -1647,7 +1647,7 @@ int iommu_do_pci_domctl(
=20
         seg =3D domctl->u.get_device_group.machine_sbdf >> 16;
         bus =3D PCI_BUS(domctl->u.get_device_group.machine_sbdf);
-        devfn =3D PCI_DEVFN2(domctl->u.get_device_group.machine_sbdf);
+        devfn =3D PCI_DEVFN(domctl->u.get_device_group.machine_sbdf);
         max_sdevs =3D domctl->u.get_device_group.max_sdevs;
         sdevs =3D domctl->u.get_device_group.sdev_array;
=20
@@ -1697,7 +1697,7 @@ int iommu_do_pci_domctl(
=20
         seg =3D machine_sbdf >> 16;
         bus =3D PCI_BUS(machine_sbdf);
-        devfn =3D PCI_DEVFN2(machine_sbdf);
+        devfn =3D PCI_DEVFN(machine_sbdf);
=20
         pcidevs_lock();
         ret =3D device_assigned(seg, bus, devfn);
@@ -1706,7 +1706,7 @@ int iommu_do_pci_domctl(
             if ( ret )
             {
                 printk(XENLOG_G_INFO "%pp already assigned, or non-existen=
t\n",
-                       &PCI_SBDF3(seg, bus, devfn));
+                       &PCI_SBDF(seg, bus, devfn));
                 ret =3D -EINVAL;
             }
         }
@@ -1742,7 +1742,7 @@ int iommu_do_pci_domctl(
=20
         seg =3D machine_sbdf >> 16;
         bus =3D PCI_BUS(machine_sbdf);
-        devfn =3D PCI_DEVFN2(machine_sbdf);
+        devfn =3D PCI_DEVFN(machine_sbdf);
=20
         pcidevs_lock();
         ret =3D deassign_device(d, seg, bus, devfn);
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -222,7 +222,7 @@ struct acpi_drhd_unit *acpi_find_matched
             continue;
=20
         for (i =3D 0; i < drhd->scope.devices_cnt; i++)
-            if ( drhd->scope.devices[i] =3D=3D PCI_BDF2(bus, devfn) )
+            if ( drhd->scope.devices[i] =3D=3D PCI_BDF(bus, devfn) )
                 return drhd;
=20
         if ( test_bit(bus, drhd->scope.buses) )
@@ -1062,7 +1062,7 @@ int cf_check intel_iommu_get_reserved_de
=20
         rc =3D func(PFN_DOWN(rmrr->base_address),
                   PFN_UP(rmrr->end_address) - PFN_DOWN(rmrr->base_address)=
,
-                  PCI_SBDF2(rmrr->segment, bdf).sbdf, ctxt);
+                  PCI_SBDF(rmrr->segment, bdf).sbdf, ctxt);
=20
         if ( unlikely(rc < 0) )
             return rc;
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -498,7 +498,7 @@ static void set_msi_source_id(struct pci
         case 4: sq =3D SQ_13_IGNORE_1; break;
         default: sq =3D SQ_ALL_16; break;
         }
-        set_ire_sid(ire, SVT_VERIFY_SID_SQ, sq, PCI_BDF2(bus, devfn));
+        set_ire_sid(ire, SVT_VERIFY_SID_SQ, sq, PCI_BDF(bus, devfn));
         break;
=20
     case DEV_TYPE_PCI:
@@ -508,7 +508,7 @@ static void set_msi_source_id(struct pci
         if ( ret =3D=3D 0 ) /* integrated PCI device */
         {
             set_ire_sid(ire, SVT_VERIFY_SID_SQ, SQ_ALL_16,
-                        PCI_BDF2(bus, devfn));
+                        PCI_BDF(bus, devfn));
         }
         else if ( ret =3D=3D 1 ) /* find upstream bridge */
         {
@@ -517,7 +517,7 @@ static void set_msi_source_id(struct pci
                             (bus << 8) | pdev->bus);
             else
                 set_ire_sid(ire, SVT_VERIFY_SID_SQ, SQ_ALL_16,
-                            PCI_BDF2(bus, devfn));
+                            PCI_BDF(bus, devfn));
         }
         else
             dprintk(XENLOG_WARNING VTDPREFIX,
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -938,21 +938,21 @@ static int iommu_page_fault_do_one(struc
                "DMAR:[%s] Request device [%pp] "
                "fault addr %"PRIx64"\n",
                (type ? "DMA Read" : "DMA Write"),
-               &PCI_SBDF2(seg, source_id), addr);
+               &PCI_SBDF(seg, source_id), addr);
         kind =3D "DMAR";
         break;
     case INTR_REMAP:
         printk(XENLOG_G_WARNING VTDPREFIX
                "INTR-REMAP: Request device [%pp] "
                "fault index %"PRIx64"\n",
-               &PCI_SBDF2(seg, source_id), addr >> 48);
+               &PCI_SBDF(seg, source_id), addr >> 48);
         kind =3D "INTR-REMAP";
         break;
     default:
         printk(XENLOG_G_WARNING VTDPREFIX
                "UNKNOWN: Request device [%pp] "
                "fault addr %"PRIx64"\n",
-               &PCI_SBDF2(seg, source_id), addr);
+               &PCI_SBDF(seg, source_id), addr);
         kind =3D "UNKNOWN";
         break;
     }
@@ -961,7 +961,7 @@ static int iommu_page_fault_do_one(struc
            kind, fault_reason, reason);
=20
     if ( iommu_verbose && fault_type =3D=3D DMA_REMAP )
-        print_vtd_entries(iommu, PCI_BUS(source_id), PCI_DEVFN2(source_id)=
,
+        print_vtd_entries(iommu, PCI_BUS(source_id), PCI_DEVFN(source_id),
                           addr >> PAGE_SHIFT);
=20
     return 0;
@@ -1039,7 +1039,7 @@ static void __do_iommu_page_fault(struct
                                 source_id, guest_addr);
=20
         pci_check_disable_device(iommu->drhd->segment,
-                                 PCI_BUS(source_id), PCI_DEVFN2(source_id)=
);
+                                 PCI_BUS(source_id), PCI_DEVFN(source_id))=
;
=20
         fault_index++;
         if ( fault_index > cap_num_fault_regs(iommu->cap) )
@@ -1541,7 +1541,7 @@ int domain_context_mapping_one(
                 check_cleanup_domid_map(domain, pdev, iommu);
             printk(XENLOG_ERR
                    "%pp: unexpected context entry %016lx_%016lx (expected =
%016lx_%016lx)\n",
-                   &PCI_SBDF3(seg, bus, devfn),
+                   &PCI_SBDF(seg, bus, devfn),
                    (uint64_t)(res >> 64), (uint64_t)res,
                    (uint64_t)(old >> 64), (uint64_t)old);
             rc =3D -EILSEQ;
@@ -1571,7 +1571,7 @@ int domain_context_mapping_one(
         if ( !(mode & (MAP_OWNER_DYING | MAP_SINGLE_DEVICE)) )
             printk(XENLOG_WARNING VTDPREFIX
                    " %pp: reassignment may cause %pd data corruption\n",
-                   &PCI_SBDF3(seg, bus, devfn), prev_dom);
+                   &PCI_SBDF(seg, bus, devfn), prev_dom);
=20
         write_atomic(&context->lo, lctxt.lo);
         /* No barrier should be needed between these two. */
@@ -1581,7 +1581,7 @@ int domain_context_mapping_one(
     iommu_sync_cache(context, sizeof(struct context_entry));
     spin_unlock(&iommu->lock);
=20
-    rc =3D iommu_flush_context_device(iommu, prev_did, PCI_BDF2(bus, devfn=
),
+    rc =3D iommu_flush_context_device(iommu, prev_did, PCI_BDF(bus, devfn)=
,
                                     DMA_CCMD_MASK_NOBIT, !prev_dom);
     flush_dev_iotlb =3D !!find_ats_dev_drhd(iommu);
     ret =3D iommu_flush_iotlb_dsi(iommu, prev_did, !prev_dom, flush_dev_io=
tlb);
@@ -1688,7 +1688,7 @@ static int domain_context_mapping(struct
     case DEV_TYPE_PCI_HOST_BRIDGE:
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:Hostbridge: skip %pp map\n",
-                   domain, &PCI_SBDF3(seg, bus, devfn));
+                   domain, &PCI_SBDF(seg, bus, devfn));
         if ( !is_hardware_domain(domain) )
             return -EPERM;
         break;
@@ -1712,7 +1712,7 @@ static int domain_context_mapping(struct
=20
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCIe: map %pp\n",
-                   domain, &PCI_SBDF3(seg, bus, devfn));
+                   domain, &PCI_SBDF(seg, bus, devfn));
         ret =3D domain_context_mapping_one(domain, drhd->iommu, bus, devfn=
, pdev,
                                          DEVICE_DOMID(domain, pdev), pgd_m=
addr,
                                          mode);
@@ -1737,7 +1737,7 @@ static int domain_context_mapping(struct
=20
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCI: map %pp\n",
-                   domain, &PCI_SBDF3(seg, bus, devfn));
+                   domain, &PCI_SBDF(seg, bus, devfn));
=20
         ret =3D domain_context_mapping_one(domain, drhd->iommu, bus, devfn=
,
                                          pdev, DEVICE_DOMID(domain, pdev),
@@ -1802,7 +1802,7 @@ static int domain_context_mapping(struct
=20
     default:
         dprintk(XENLOG_ERR VTDPREFIX, "%pd:unknown(%u): %pp\n",
-                domain, pdev->type, &PCI_SBDF3(seg, bus, devfn));
+                domain, pdev->type, &PCI_SBDF(seg, bus, devfn));
         ret =3D -EINVAL;
         break;
     }
@@ -1851,7 +1851,7 @@ int domain_context_unmap_one(
     iommu_sync_cache(context, sizeof(struct context_entry));
=20
     rc =3D iommu_flush_context_device(iommu, iommu_domid,
-                                    PCI_BDF2(bus, devfn),
+                                    PCI_BDF(bus, devfn),
                                     DMA_CCMD_MASK_NOBIT, 0);
=20
     flush_dev_iotlb =3D !!find_ats_dev_drhd(iommu);
@@ -1910,7 +1910,7 @@ static const struct acpi_drhd_unit *doma
     case DEV_TYPE_PCI_HOST_BRIDGE:
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:Hostbridge: skip %pp unmap\n",
-                   domain, &PCI_SBDF3(seg, bus, devfn));
+                   domain, &PCI_SBDF(seg, bus, devfn));
         return ERR_PTR(is_hardware_domain(domain) ? 0 : -EPERM);
=20
     case DEV_TYPE_PCIe_BRIDGE:
@@ -1924,7 +1924,7 @@ static const struct acpi_drhd_unit *doma
=20
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCIe: unmap %pp\n",
-                   domain, &PCI_SBDF3(seg, bus, devfn));
+                   domain, &PCI_SBDF(seg, bus, devfn));
         ret =3D domain_context_unmap_one(domain, iommu, bus, devfn);
         if ( !ret && devfn =3D=3D pdev->devfn && ats_device(pdev, drhd) > =
0 )
             disable_ats_device(pdev);
@@ -1937,7 +1937,7 @@ static const struct acpi_drhd_unit *doma
=20
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCI: unmap %pp\n",
-                   domain, &PCI_SBDF3(seg, bus, devfn));
+                   domain, &PCI_SBDF(seg, bus, devfn));
         ret =3D domain_context_unmap_one(domain, iommu, bus, devfn);
         if ( ret )
             break;
@@ -1970,7 +1970,7 @@ static const struct acpi_drhd_unit *doma
=20
     default:
         dprintk(XENLOG_ERR VTDPREFIX, "%pd:unknown(%u): %pp\n",
-                domain, pdev->type, &PCI_SBDF3(seg, bus, devfn));
+                domain, pdev->type, &PCI_SBDF(seg, bus, devfn));
         return ERR_PTR(-EINVAL);
     }
=20
@@ -2181,9 +2181,7 @@ static int cf_check intel_iommu_add_devi
=20
     for_each_rmrr_device ( rmrr, bdf, i )
     {
-        if ( rmrr->segment =3D=3D pdev->seg &&
-             PCI_BUS(bdf) =3D=3D pdev->bus &&
-             PCI_DEVFN2(bdf) =3D=3D devfn )
+        if ( rmrr->segment =3D=3D pdev->seg && bdf =3D=3D PCI_BDF(pdev->bu=
s, devfn) )
         {
             /*
              * iommu_add_device() is only called for the hardware
@@ -2239,9 +2237,7 @@ static int cf_check intel_iommu_remove_d
=20
     for_each_rmrr_device ( rmrr, bdf, i )
     {
-        if ( rmrr->segment !=3D pdev->seg ||
-             PCI_BUS(bdf) !=3D pdev->bus ||
-             PCI_DEVFN2(bdf) !=3D devfn )
+        if ( rmrr->segment !=3D pdev->seg || bdf !=3D PCI_BDF(pdev->bus, d=
evfn) )
             continue;
=20
         /*
@@ -2668,8 +2664,7 @@ static int cf_check reassign_device_owne
=20
         for_each_rmrr_device( rmrr, bdf, i )
             if ( rmrr->segment =3D=3D pdev->seg &&
-                 PCI_BUS(bdf) =3D=3D pdev->bus &&
-                 PCI_DEVFN2(bdf) =3D=3D devfn )
+                 bdf =3D=3D PCI_BDF(pdev->bus, devfn) )
             {
                 /*
                  * Any RMRR flag is always ignored when remove a device,
@@ -2713,9 +2708,7 @@ static int cf_check intel_iommu_assign_d
      */
     for_each_rmrr_device( rmrr, bdf, i )
     {
-        if ( rmrr->segment =3D=3D seg &&
-             PCI_BUS(bdf) =3D=3D bus &&
-             PCI_DEVFN2(bdf) =3D=3D devfn &&
+        if ( rmrr->segment =3D=3D seg && bdf =3D=3D PCI_BDF(bus, devfn) &&
              rmrr->scope.devices_cnt > 1 )
         {
             bool_t relaxed =3D !!(flag & XEN_DOMCTL_DEV_RDM_RELAXED);
@@ -2725,7 +2718,7 @@ static int cf_check intel_iommu_assign_d
                    " with shared RMRR at %"PRIx64" for %pd.\n",
                    relaxed ? XENLOG_WARNING : XENLOG_ERR,
                    relaxed ? "risky" : "disallowed",
-                   &PCI_SBDF3(seg, bus, devfn), rmrr->base_address, d);
+                   &PCI_SBDF(seg, bus, devfn), rmrr->base_address, d);
             if ( !relaxed )
                 return -EPERM;
         }
@@ -2737,9 +2730,7 @@ static int cf_check intel_iommu_assign_d
     /* Setup rmrr identity mapping */
     for_each_rmrr_device( rmrr, bdf, i )
     {
-        if ( rmrr->segment =3D=3D seg &&
-             PCI_BUS(bdf) =3D=3D bus &&
-             PCI_DEVFN2(bdf) =3D=3D devfn )
+        if ( rmrr->segment =3D=3D seg && bdf =3D=3D PCI_BDF(bus, devfn) )
         {
             ret =3D iommu_identity_mapping(d, p2m_access_rw, rmrr->base_ad=
dress,
                                          rmrr->end_address, flag);
@@ -2762,9 +2753,7 @@ static int cf_check intel_iommu_assign_d
=20
     for_each_rmrr_device( rmrr, bdf, i )
     {
-        if ( rmrr->segment =3D=3D seg &&
-             PCI_BUS(bdf) =3D=3D bus &&
-             PCI_DEVFN2(bdf) =3D=3D devfn )
+        if ( rmrr->segment =3D=3D seg && bdf =3D=3D PCI_BDF(bus, devfn) )
         {
             int rc =3D iommu_identity_mapping(d, p2m_access_x,
                                             rmrr->base_address,
@@ -2791,7 +2780,7 @@ static int cf_check intel_iommu_group_id
     if ( find_upstream_bridge(seg, &bus, &devfn, &secbus) < 0 )
         return -ENODEV;
=20
-    return PCI_BDF2(bus, devfn);
+    return PCI_BDF(bus, devfn);
 }
=20
 static int __must_check cf_check vtd_suspend(void)
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -115,7 +115,7 @@ bool is_azalia_tlb_enabled(const struct
         return true;
=20
     /* Check for the specific device. */
-    sbdf =3D PCI_SBDF2(drhd->segment, drhd->scope.devices[0]);
+    sbdf =3D PCI_SBDF(drhd->segment, drhd->scope.devices[0]);
     if ( pci_conf_read16(sbdf, PCI_VENDOR_ID) !=3D PCI_VENDOR_ID_INTEL ||
          pci_conf_read16(sbdf, PCI_DEVICE_ID) !=3D 0x3a3e )
         return true;
@@ -446,7 +446,7 @@ int me_wifi_quirk(struct domain *domain,
             return 0;
=20
         /* if device is WLAN device, map ME phantom device 0:3.7 */
-        id =3D pci_conf_read32(PCI_SBDF3(0, bus, devfn), 0);
+        id =3D pci_conf_read32(PCI_SBDF(0, bus, devfn), 0);
         switch (id)
         {
             case 0x42328086:
@@ -470,7 +470,7 @@ int me_wifi_quirk(struct domain *domain,
             return 0;
=20
         /* if device is WLAN device, map ME phantom device 0:22.7 */
-        id =3D pci_conf_read32(PCI_SBDF3(0, bus, devfn), 0);
+        id =3D pci_conf_read32(PCI_SBDF(0, bus, devfn), 0);
         switch (id)
         {
             case 0x00878086:        /* Kilmer Peak */
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -96,7 +96,7 @@ void print_vtd_entries(struct vtd_iommu
     u32 l_index, level;
=20
     printk("print_vtd_entries: iommu #%u dev %pp gmfn %"PRI_gfn"\n",
-           iommu->index, &PCI_SBDF3(iommu->drhd->segment, bus, devfn),
+           iommu->index, &PCI_SBDF(iommu->drhd->segment, bus, devfn),
            gmfn);
=20
     if ( iommu->root_maddr =3D=3D 0 )
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -46,12 +46,12 @@ int pci_find_next_cap(u16 seg, u8 bus, u
=20
     while ( ttl-- )
     {
-        pos =3D pci_conf_read8(PCI_SBDF3(seg, bus, devfn), pos);
+        pos =3D pci_conf_read8(PCI_SBDF(seg, bus, devfn), pos);
         if ( pos < 0x40 )
             break;
=20
         pos &=3D ~3;
-        id =3D pci_conf_read8(PCI_SBDF3(seg, bus, devfn), pos + PCI_CAP_LI=
ST_ID);
+        id =3D pci_conf_read8(PCI_SBDF(seg, bus, devfn), pos + PCI_CAP_LIS=
T_ID);
=20
         if ( id =3D=3D 0xff )
             break;
@@ -93,7 +93,7 @@ int pci_find_next_ext_capability(int seg
     int ttl =3D 480; /* 3840 bytes, minimum 8 bytes per capability */
     int pos =3D max(start, 0x100);
=20
-    header =3D pci_conf_read32(PCI_SBDF3(seg, bus, devfn), pos);
+    header =3D pci_conf_read32(PCI_SBDF(seg, bus, devfn), pos);
=20
     /*
      * If we have no capabilities, this is indicated by cap ID,
@@ -109,7 +109,7 @@ int pci_find_next_ext_capability(int seg
         pos =3D PCI_EXT_CAP_NEXT(header);
         if ( pos < 0x100 )
             break;
-        header =3D pci_conf_read32(PCI_SBDF3(seg, bus, devfn), pos);
+        header =3D pci_conf_read32(PCI_SBDF(seg, bus, devfn), pos);
     }
     return 0;
 }
@@ -162,7 +162,7 @@ const char *__init parse_pci_seg(const c
     else
         func =3D 0;
     if ( seg !=3D (seg_p ? (u16)seg : 0) ||
-         bus !=3D PCI_BUS(PCI_BDF2(bus, 0)) ||
+         bus !=3D PCI_BUS(PCI_BDF(bus, 0)) ||
          dev !=3D PCI_SLOT(PCI_DEVFN(dev, 0)) ||
          func !=3D PCI_FUNC(PCI_DEVFN(0, func)) )
         return NULL;
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -122,9 +122,9 @@ void __init video_endboot(void)
                 pcidevs_unlock();
=20
                 if ( !pdev ||
-                     pci_conf_read16(PCI_SBDF3(0, bus, devfn),
+                     pci_conf_read16(PCI_SBDF(0, bus, devfn),
                                      PCI_CLASS_DEVICE) !=3D 0x0300 ||
-                     !(pci_conf_read16(PCI_SBDF3(0, bus, devfn), PCI_COMMA=
ND) &
+                     !(pci_conf_read16(PCI_SBDF(0, bus, devfn), PCI_COMMAN=
D) &
                        (PCI_COMMAND_IO | PCI_COMMAND_MEMORY)) )
                     continue;
=20
@@ -136,12 +136,12 @@ void __init video_endboot(void)
                         b =3D 0;
                         break;
                     case 1:
-                        switch ( pci_conf_read8(PCI_SBDF3(0, b, df),
+                        switch ( pci_conf_read8(PCI_SBDF(0, b, df),
                                                 PCI_HEADER_TYPE) )
                         {
                         case PCI_HEADER_TYPE_BRIDGE:
                         case PCI_HEADER_TYPE_CARDBUS:
-                            if ( pci_conf_read16(PCI_SBDF3(0, b, df),
+                            if ( pci_conf_read16(PCI_SBDF(0, b, df),
                                                  PCI_BRIDGE_CONTROL) &
                                  PCI_BRIDGE_CTL_VGA )
                                 continue;
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -29,16 +29,21 @@
 #define PCI_BUS(bdf)    (((bdf) >> 8) & 0xff)
 #define PCI_SLOT(bdf)   (((bdf) >> 3) & 0x1f)
 #define PCI_FUNC(bdf)   ((bdf) & 0x07)
-#define PCI_DEVFN(d,f)  ((((d) & 0x1f) << 3) | ((f) & 0x07))
-#define PCI_DEVFN2(bdf) ((bdf) & 0xff)
-#define PCI_BDF(b,d,f)  ((((b) & 0xff) << 8) | PCI_DEVFN(d,f))
-#define PCI_BDF2(b,df)  ((((b) & 0xff) << 8) | ((df) & 0xff))
-#define PCI_SBDF(s,b,d,f) \
-    ((pci_sbdf_t){ .sbdf =3D (((s) & 0xffff) << 16) | PCI_BDF(b, d, f) })
-#define PCI_SBDF2(s,bdf) \
+
+#define PCI_DEVFN1_(df)   ((df) & 0xff)
+#define PCI_DEVFN2_(d, f) ((((d) & 0x1f) << 3) | ((f) & 7))
+#define PCI_SBDF4_(s, b, d, f...) \
+    ((pci_sbdf_t){ .sbdf =3D (((s) & 0xffff) << 16) | PCI_BDF(b, d, ##f) }=
)
+#define PCI_SBDF3_ PCI_SBDF4_
+#define PCI_SBDF2_(s, bdf) \
     ((pci_sbdf_t){ .sbdf =3D (((s) & 0xffff) << 16) | ((bdf) & 0xffff) })
-#define PCI_SBDF3(s,b,df) \
-    ((pci_sbdf_t){ .sbdf =3D (((s) & 0xffff) << 16) | PCI_BDF2(b, df) })
+
+#define PCI__(what, nr) PCI_##what##nr##_
+#define PCI_(what, nr)  PCI__(what, nr)
+
+#define PCI_DEVFN(d, f...)   PCI_(DEVFN, count_args(d, ##f))(d, ##f)
+#define PCI_BDF(b, d, f...)  ((((b) & 0xff) << 8) | PCI_DEVFN(d, ##f))
+#define PCI_SBDF(s, b, d...) PCI_(SBDF, count_args(s, b, ##d))(s, b, ##d)
=20
 #define ECAM_REG_OFFSET(addr)  ((addr) & 0x00000fff)
=20


