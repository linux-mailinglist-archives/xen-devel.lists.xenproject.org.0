Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4348F4FB7ED
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 11:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302803.516595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqYo-0003UH-Od; Mon, 11 Apr 2022 09:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302803.516595; Mon, 11 Apr 2022 09:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqYo-0003Rv-Kk; Mon, 11 Apr 2022 09:42:14 +0000
Received: by outflank-mailman (input) for mailman id 302803;
 Mon, 11 Apr 2022 09:42:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndqYn-0003RQ-Bq
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 09:42:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8cf1c46-b97b-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 11:42:10 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-M7Rhd22AM-Sav96TeFIefA-1; Mon, 11 Apr 2022 11:42:08 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB7200.eurprd04.prod.outlook.com (2603:10a6:800:12d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 09:42:07 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 09:42:07 +0000
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
X-Inumbo-ID: a8cf1c46-b97b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649670130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Py/JyO0vBJGMqJ1hK6JAceWT1qoE+ikG7idy1ZPeUKY=;
	b=NYub578PPk5wapht32R3PQA981h+Puak3kqwoYMmP1bbzfY8wQA458HQwDucDlKp4cEU0l
	9H8A0hX+TZKPL7FO4BZa+DBw4mVscMLNYhpPbkvETBmf3WjhcREIOnpgGkMGSjrLNfy6aq
	fmZA0R1PudVV+BCGgxeKVyhqsASKyOM=
X-MC-Unique: M7Rhd22AM-Sav96TeFIefA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4oO1TU9cLr9A1SzCLek/somh+uMZmcGvyc95S4sCb6gmCUwigxrZLaignKG18SLpgHNARii8IujxIkGdaTegdr358i+Ythqd1KffDuTaDlETMFfRZ6/WnaUbw7YDpJutTWneExBd5V9ZowJOtZ0ifgean0Ovf/o9T0zjCrCdHVKzYVcpvO7Ji6kyHcvNDLYbsfI68RbvmzPCh0GC1+sRW036S4n8ozUFYIKLYiJnGG0vFMa4ITeVP/GHexJlEbrtg1yMqvkmnDKKk5UI5jd893tc9DBE58IIU5FEw9l0v7+t5YTjTnNKD2IsT7h4h4+FJLwnFzGapqZvAbbiMs9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Py/JyO0vBJGMqJ1hK6JAceWT1qoE+ikG7idy1ZPeUKY=;
 b=DVxHwhDQSfZMCLztif2w++TgoXsl1rYhjlGStbGpvTQbzakUS4AT6vb47bWH9vDlrtz3ayCl3cCG2QFRDiMpWRLsh5k8yN3aSg8BFUTvWVoxoDK4DDQr2tAva7k0na/cPRkF/c4dAbUa/KqhInOkVedIXsWjr84Pncp+PEOI0Eycm4OROs1pjieihMNWqzFrB9DV7X8J6WtiHBJ4DLodT39se9lufSBq2xmu7tkz7Kma7XQ9iXk59ehD0dXPvf035YYSkWshF3fC0OfpcttCzGHSUeSwJqRnC0JtgqYBlOvJ9RdiFITFTiwrZzShCe9J8xPTeS1gd+fmGq6jRjP7Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75623ef8-5aa1-b864-7398-b7980accaf32@suse.com>
Date: Mon, 11 Apr 2022 11:42:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 8/8] PCI: replace "secondary" flavors of
 PCI_{DEVFN,BDF,SBDF}()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
In-Reply-To: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0014.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::24) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 006a9268-5c50-435b-e8e7-08da1b9f8ad2
X-MS-TrafficTypeDiagnostic: VI1PR04MB7200:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB72006DD2032D114FBBDCDB70B3EA9@VI1PR04MB7200.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qzmvTXfiWQn48xzDWlxhu0x3gMKygw4pXKaEyJOlfLwQHotRVGNClmV1XoLBscS9RO5qBui1Gis5x/ao+w0ADQsMH9RQjYvlNrmsLw6MVCFfb0OqspNZMKpPGAkRDesAId0+R1kmbJrXm/v9MLezxK+3Txow8I1I1HARVfo543SxpqDO0I8iERhcFuEMruKKS7pRnNSMRA55jG+8YDJmDsnPdPJwBTh9CkRP4UrzgEXnqiQOmj93GzqU24ZtGavWedM7f/E7OfdmOS4LOxhBdWU6wrrhi8Lhz0BvhcarKukUpfOXCJDk8K8ljByJ7FAM2uBb5h9u7M1CcVDvWvCFEzyCI0FbFP60g3MWdVCv5vDIWUo0GirUNMun0TVYb10GLSmdWcbm0CoV69RNE7VWDSINe0o2fphZVwinwbbHns1dvcg6JrSg0hdo4E+xr1DhMYgUzaVqQOvixzxnxoDEwYzSz2AwJmUQRenuLS/YMMB6FoesnMs3lhziCV3eootoHAg3B2eABB3MjulEkleonyhwh3fZg/SYuqrIY/RojTQHzd3K2eMVhedE1VGkpSZ9L2j84fd8CCTW3hL0aFSBU7UHUXuA1jmQoPSrm4/FazvZL3tJOL9qflfKASEy3Y7xNIA8DfzbnjDlI60jUMgPNIJFVr5CAKYOdtFoJ1aDpPaWzKGkx/HQ15CBNEuT+T1ADRUs5sKBzZz8bYiFa0qExCKKshyUoFq8av4MUrXufyxxJzXOBObud9w+NGmUVYyfWUvmvpbjY6XuZuPbdVjFSw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(4326008)(8676002)(66946007)(6512007)(66556008)(186003)(31696002)(86362001)(38100700002)(2906002)(8936002)(5660300002)(30864003)(83380400001)(26005)(2616005)(6506007)(54906003)(6916009)(316002)(508600001)(31686004)(36756003)(6486002)(43740500002)(45980500001)(579004)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk9Cc3ltWmFpYXJSRDVvcjJRZWZZZGtENGlCRTNQMzFCSGkxZDN3ZmVSZVdt?=
 =?utf-8?B?ek1QOVFRYmhsQTRCVWZxcUdLZ2NlZktabGF3SSsxM1ZnYWpraUdsaExUMFda?=
 =?utf-8?B?TTg0ckJQR0hKY2lJa2hLNDYxcUZUcTVBL1pXMzd3ZTRnNzIzT2VvYUlGd0N1?=
 =?utf-8?B?TkJseFdWcTAxKzNadlp5ZUNwa1hYTVlVUm5rN1Zncit4T1F5ZUxIRW9vSmlh?=
 =?utf-8?B?M2d6aVVBUHNXSWFaYWZQcElTNHJOSFVvNXIra3FxaktESXRyTWtoS1pSVjBp?=
 =?utf-8?B?cmh3RjhjNnFiNEpWM1hWemJLbEVHaEJ1Q0ppdFpoTTJ5Zk82b1NGMEhFR3Zs?=
 =?utf-8?B?eTBnN3ptTWNEdWNSOFROTnNzVm5YWXhvbU4xeThJMWFsbldPR3V6cmQ2TWtR?=
 =?utf-8?B?KytXYVhJcm9tSmxRQjdEa2ZpSUJoVFJnc1FCTEtQZ3hpUENKUWc0bnFycEJj?=
 =?utf-8?B?amlId3ZqSEgxYWtlSGFHMm54dFFNZVBsYnpPZ2YyMEE3V01JbFpiOXhFZnc4?=
 =?utf-8?B?L0Nyc1pYbzJXVWhVU2tyUTgvZU0wRlNjQjBOOTgwNVdZcUEvMmN1bHNJQzZN?=
 =?utf-8?B?NU50ejB4RW1CSzFUSkoxNkZFSXB4Zm01aVpUSFoxV00rMG0way9zcCt5UTFh?=
 =?utf-8?B?bDd4NTdiS3NVME1LeURMZmdnTGNzSXZoNUpLN2ZOZ0x0RkJzbzlyVHlVbEFh?=
 =?utf-8?B?dm1tS2hIUkR4cDZVeEJCeGpEWlhTZnJkTUxmZmIwTmppVXljNHNLZmIxaWhr?=
 =?utf-8?B?VmNvVCtwMFpxeE5XcjBLOTRUeEF3T0p5WklFMlVDb21LNHAwOXIzWi9LNFNn?=
 =?utf-8?B?bnVuS3NkNG9NUmZYTlBRcCtSZmwzU3RLd2ZDcHRpOXJaQTlpL3owNWFCOXBW?=
 =?utf-8?B?TnJtd05DamxXcGdldFRDZHhBQkwvSjJhVVlhcmI1MWd2VFRMdTZibm5Wa3ZM?=
 =?utf-8?B?cXZsVHJLRHBaM1FSNzliMTdXMW9PNUlRSGM0dW9Sa0RCRWE3clAyU0pXRGUv?=
 =?utf-8?B?bjZPVmFhWCtFcUs3TU5BcHpmSW5VejZzSlphaFpjWW5SWVJlVURzYjBEbG5U?=
 =?utf-8?B?cEFKMEhRdzgwd1U5RTZMOWNESUZrTVNBZDVDMFg3NTZ1aVFtaU9xSFNGTTFl?=
 =?utf-8?B?K3FXWGtnbythK2hPMlR5WjRZdmtLbGVtb093UFhOZlNzRkx3VEx1b1lEalY2?=
 =?utf-8?B?amJlRnphamg3ZW1COHBFZWhjbjlnSEVrTU5YNjJaODlmNnBTVVJJM3Z5NW9Q?=
 =?utf-8?B?QzBhbjJScE5wcUQ0aU1wMEhuUFBLZFhEQ0JoOTlkUHhtY1l4OE1IOTZlMUl3?=
 =?utf-8?B?YXlTUmJNNlZaNkc0R1NaTVZvK3lKTXpKZEw0dnF4M0FsZ1ZlT3E0NGlFazJJ?=
 =?utf-8?B?NzYvbnZjN01oQURnSUcvdnN2NldacGRyalcrVlNvQmE5WVJkRVM4alFuQ0t2?=
 =?utf-8?B?c0FFZzAxTVJ3Wjd5disrdjd3QzVxWWZXWS8wbXJsL3JQSU16bWNvTXBlaFU3?=
 =?utf-8?B?VVdZeThTZStHOFBUM2lPWFZ4ZUh6MGRYOUI2ZHljMVlQM3pWaHpLdmJJQmN0?=
 =?utf-8?B?dVhhL0NZT3J1WkhZeGxndXRkVW1URmVNNnlmY2JPNzlnbHlVbGEvaWxqdUNa?=
 =?utf-8?B?TjRGSWRQa0dTMzJyTzNtR09IUk04VEJjQXgxK1YzSzQ4SFlvVHFFWUhRQURk?=
 =?utf-8?B?akNYUlIxazh5dS8xeWVkcXFYMUtKdUsxT2E1cXhPK1F0MzBxSURreHBXTVRa?=
 =?utf-8?B?UG4rOXlUK1FhMmVjeU5SOW5zdEJPZFlNWk9TQ04xOUVYcVdJcStBZ2ladG5t?=
 =?utf-8?B?VDcxd3ZiaEFmSldMNHdLNENNNHF2RU9qcWxpTkVMVDlFNUdReGpaMXdNMWdZ?=
 =?utf-8?B?eUF4UWZ6NjMvdnZnTW9WekJTR010S3lnWXBZWXVNeHNERERaZ2xVRTZBSk5s?=
 =?utf-8?B?VWNrSXE0VW1BWEIycDd2V2hLeVFDV0w1OWxQN0srWW9Ba0dLZDMyRlI5M1Q1?=
 =?utf-8?B?SkVtL25ZczZCM1Q3QTloNSszdmFLU1BkcFU2RCtlazZseEs2Z3RycVFaRDRE?=
 =?utf-8?B?VTNTWW52WVN6ZW9COXlDSXRaS05aVFdyVzlXZnk4eVJJMFFtbG00bXBnWTNo?=
 =?utf-8?B?Qk9mOHU4S2NCZWczZ1BRNTIxRTl6YjZ1a1NIaHF4REdPT1h5ZVVuRlYzc2RS?=
 =?utf-8?B?TkFBVnR0WklIdS85M3ExUHBNbldKWU56c3c0OTJySUswNzhkRjEzZFBDa0dS?=
 =?utf-8?B?d3VQNU81akFPRFlqZ1ZrdEZBSUI2cDBDdG94QWxHbkhYL0JtUWZFMEpGNFBS?=
 =?utf-8?B?SWhsa1F5UURJT3hXT0k0QnRKc3M5WUhXdTVDWHc1enNQQkt1T2NtUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006a9268-5c50-435b-e8e7-08da1b9f8ad2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 09:42:07.0268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7L8Snq/6eXwDOnsaZId8uQXJ1CMnsRbuJVuaBtuFGgQbuT5FBZCRScykeaHFNvX7VjK4xW7D0wiLXLizCcLZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7200

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

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4902,7 +4902,7 @@ int cf_check mmcfg_intercept_write(
     if ( pci_conf_write_intercept(mmio_ctxt->seg, mmio_ctxt->bdf,
                                   offset, bytes, p_data) >= 0 )
         pci_mmcfg_write(mmio_ctxt->seg, PCI_BUS(mmio_ctxt->bdf),
-                        PCI_DEVFN2(mmio_ctxt->bdf), offset, bytes,
+                        PCI_DEVFN(mmio_ctxt->bdf), offset, bytes,
                         *(uint32_t *)p_data);
 
     return X86EMUL_OKAY;
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -90,7 +90,7 @@ int pci_conf_write_intercept(unsigned in
 
     pcidevs_lock();
 
-    pdev = pci_get_pdev(seg, PCI_BUS(bdf), PCI_DEVFN2(bdf));
+    pdev = pci_get_pdev(seg, PCI_BUS(bdf), PCI_DEVFN(bdf));
     if ( pdev )
         rc = pci_msi_conf_write_intercept(pdev, reg, size, data);
 
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -313,7 +313,7 @@ static int __init pci_mmcfg_check_hostbr
     for (i = 0; !name && i < ARRAY_SIZE(pci_mmcfg_probes); i++) {
         bus =  pci_mmcfg_probes[i].bus;
         devfn = pci_mmcfg_probes[i].devfn;
-        l = pci_conf_read32(PCI_SBDF3(0, bus, devfn), 0);
+        l = pci_conf_read32(PCI_SBDF(0, bus, devfn), 0);
         vendor = l & 0xffff;
         device = (l >> 16) & 0xffff;
 
--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -27,8 +27,8 @@ static int cf_check get_reserved_device_
     xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt)
 {
     struct get_reserved_device_memory *grdm = ctxt;
-    uint32_t sbdf = PCI_SBDF3(grdm->map.dev.pci.seg, grdm->map.dev.pci.bus,
-                              grdm->map.dev.pci.devfn).sbdf;
+    uint32_t sbdf = PCI_SBDF(grdm->map.dev.pci.seg, grdm->map.dev.pci.bus,
+                             grdm->map.dev.pci.devfn).sbdf;
 
     if ( !(grdm->map.flags & XENMEM_RDM_ALL) && (sbdf != id) )
         return 0;
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1055,8 +1055,8 @@ static int cf_check get_reserved_device_
     xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt)
 {
     struct get_reserved_device_memory *grdm = ctxt;
-    uint32_t sbdf = PCI_SBDF3(grdm->map.dev.pci.seg, grdm->map.dev.pci.bus,
-                              grdm->map.dev.pci.devfn).sbdf;
+    uint32_t sbdf = PCI_SBDF(grdm->map.dev.pci.seg, grdm->map.dev.pci.bus,
+                             grdm->map.dev.pci.devfn).sbdf;
 
     if ( !(grdm->map.flags & XENMEM_RDM_ALL) && (sbdf != id) )
         return 0;
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -96,7 +96,7 @@ static void __init add_ivrs_mapping_entr
 
             if ( !ivrs_mappings[alias_id].intremap_table )
                 panic("No memory for %pp's IRT\n",
-                      &PCI_SBDF2(iommu->seg, alias_id));
+                      &PCI_SBDF(iommu->seg, alias_id));
         }
     }
 
@@ -790,7 +790,7 @@ static u16 __init parse_ivhd_device_spec
     }
 
     AMD_IOMMU_DEBUG("IVHD Special: %pp variety %#x handle %#x\n",
-                    &PCI_SBDF2(seg, bdf), special->variety, special->handle);
+                    &PCI_SBDF(seg, bdf), special->variety, special->handle);
     add_ivrs_mapping_entry(bdf, bdf, special->header.data_setting, 0, true,
                            iommu);
 
@@ -816,7 +816,7 @@ static u16 __init parse_ivhd_device_spec
             AMD_IOMMU_DEBUG("IVHD: Command line override present for IO-APIC %#x"
                             "(IVRS: %#x devID %pp)\n",
                             ioapic_sbdf[idx].id, special->handle,
-                            &PCI_SBDF2(seg, bdf));
+                            &PCI_SBDF(seg, bdf));
             break;
         }
 
@@ -888,7 +888,7 @@ static u16 __init parse_ivhd_device_spec
             AMD_IOMMU_DEBUG("IVHD: Command line override present for HPET %#x "
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
 
@@ -84,7 +84,7 @@ static void flush_command_buffer(struct
             threshold |= threshold << 1;
             printk(XENLOG_WARNING
                    "AMD IOMMU %pp: %scompletion wait taking too long\n",
-                   &PCI_SBDF2(iommu->seg, iommu->bdf),
+                   &PCI_SBDF(iommu->seg, iommu->bdf),
                    timeout_base ? "iotlb " : "");
             timeout = 0;
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
 
     if ( !iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
         return;
 
-    req_id = get_dma_requestor_id(iommu->seg, PCI_BDF2(pdev->bus, devfn));
+    req_id = get_dma_requestor_id(iommu->seg, PCI_BDF(pdev->bus, devfn));
     queueid = req_id;
     maxpend = pdev->ats.queue_depth & 0xff;
 
--- a/xen/drivers/passthrough/amd/iommu_detect.c
+++ b/xen/drivers/passthrough/amd/iommu_detect.c
@@ -231,7 +231,7 @@ int __init amd_iommu_detect_one_acpi(
     rt = pci_ro_device(iommu->seg, bus, PCI_DEVFN(dev, func));
     if ( rt )
         printk(XENLOG_ERR "Could not mark config space of %pp read-only (%d)\n",
-               &PCI_SBDF2(iommu->seg, iommu->bdf), rt);
+               &PCI_SBDF(iommu->seg, iommu->bdf), rt);
 
     list_add_tail(&iommu->list, &amd_iommu_head);
     rt = 0;
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -562,7 +562,7 @@ static void cf_check parse_event_log_ent
 
         printk(XENLOG_ERR "AMD-Vi: %s: %pp d%u addr %016"PRIx64
                " flags %#x%s%s%s%s%s%s%s%s%s%s\n",
-               code_str, &PCI_SBDF2(iommu->seg, device_id),
+               code_str, &PCI_SBDF(iommu->seg, device_id),
                domain_id, addr, flags,
                (flags & 0xe00) ? " ??" : "",
                (flags & 0x100) ? " TR" : "",
@@ -578,7 +578,7 @@ static void cf_check parse_event_log_ent
         for ( bdf = 0; bdf < ivrs_bdf_entries; bdf++ )
             if ( get_dma_requestor_id(iommu->seg, bdf) == device_id )
                 pci_check_disable_device(iommu->seg, PCI_BUS(bdf),
-                                         PCI_DEVFN2(bdf));
+                                         PCI_DEVFN(bdf));
     }
     else
         printk(XENLOG_ERR "%s %08x %08x %08x %08x\n",
@@ -631,18 +631,13 @@ static void iommu_check_event_log(struct
 
 static void cf_check parse_ppr_log_entry(struct amd_iommu *iommu, u32 entry[])
 {
-
-    u16 device_id;
-    u8 bus, devfn;
-    struct pci_dev *pdev;
-
     /* here device_id is physical value */
-    device_id = iommu_get_devid_from_cmd(entry[0]);
-    bus = PCI_BUS(device_id);
-    devfn = PCI_DEVFN2(device_id);
+    uint16_t device_id = iommu_get_devid_from_cmd(entry[0]);
+    struct pci_dev *pdev;
 
     pcidevs_lock();
-    pdev = pci_get_real_pdev(iommu->seg, bus, devfn);
+    pdev = pci_get_real_pdev(iommu->seg, PCI_BUS(device_id),
+                             PCI_DEVFN(device_id));
     pcidevs_unlock();
 
     if ( pdev )
@@ -751,12 +746,12 @@ static bool_t __init set_iommu_interrupt
 
     pcidevs_lock();
     iommu->msi.dev = pci_get_pdev(iommu->seg, PCI_BUS(iommu->bdf),
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
 
@@ -778,7 +773,7 @@ static bool_t __init set_iommu_interrupt
         hw_irq_controller *handler;
         u16 control;
 
-        control = pci_conf_read16(PCI_SBDF2(iommu->seg, iommu->bdf),
+        control = pci_conf_read16(PCI_SBDF(iommu->seg, iommu->bdf),
                                   iommu->msi.msi_attrib.pos + PCI_MSI_FLAGS);
 
         iommu->msi.msi.nvec = 1;
@@ -842,22 +837,22 @@ static void amd_iommu_erratum_746_workar
          (boot_cpu_data.x86_model > 0x1f) )
         return;
 
-    pci_conf_write32(PCI_SBDF2(iommu->seg, iommu->bdf), 0xf0, 0x90);
-    value = pci_conf_read32(PCI_SBDF2(iommu->seg, iommu->bdf), 0xf4);
+    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90);
+    value = pci_conf_read32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf4);
 
     if ( value & (1 << 2) )
         return;
 
     /* Select NB indirect register 0x90 and enable writing */
-    pci_conf_write32(PCI_SBDF2(iommu->seg, iommu->bdf), 0xf0, 0x90 | (1 << 8));
+    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90 | (1 << 8));
 
-    pci_conf_write32(PCI_SBDF2(iommu->seg, iommu->bdf), 0xf4, value | (1 << 2));
+    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf4, value | (1 << 2));
     printk(XENLOG_INFO
            "AMD-Vi: Applying erratum 746 workaround for IOMMU at %pp\n",
-           &PCI_SBDF2(iommu->seg, iommu->bdf));
+           &PCI_SBDF(iommu->seg, iommu->bdf));
 
     /* Clear the enable writing bit */
-    pci_conf_write32(PCI_SBDF2(iommu->seg, iommu->bdf), 0xf0, 0x90);
+    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90);
 }
 
 static void enable_iommu(struct amd_iommu *iommu)
@@ -1288,7 +1283,7 @@ static int __init cf_check amd_iommu_set
                 if ( !pci_init )
                     continue;
                 pcidevs_lock();
-                pdev = pci_get_pdev(seg, PCI_BUS(bdf), PCI_DEVFN2(bdf));
+                pdev = pci_get_pdev(seg, PCI_BUS(bdf), PCI_DEVFN(bdf));
                 pcidevs_unlock();
             }
 
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -604,7 +604,7 @@ static struct amd_iommu *_find_iommu_for
     if ( iommu )
         return iommu;
 
-    AMD_IOMMU_DEBUG("No IOMMU for MSI dev = %pp\n", &PCI_SBDF2(seg, bdf));
+    AMD_IOMMU_DEBUG("No IOMMU for MSI dev = %pp\n", &PCI_SBDF(seg, bdf));
     return ERR_PTR(-EINVAL);
 }
 
@@ -814,7 +814,7 @@ static void dump_intremap_table(const st
         if ( ivrs_mapping )
         {
             printk("  %pp:\n",
-                   &PCI_SBDF2(iommu->seg, ivrs_mapping->dte_requestor_id));
+                   &PCI_SBDF(iommu->seg, ivrs_mapping->dte_requestor_id));
             ivrs_mapping = NULL;
         }
 
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -534,7 +534,7 @@ int cf_check amd_iommu_get_reserved_devi
 
     for ( bdf = 0; bdf < ivrs_bdf_entries; ++bdf )
     {
-        pci_sbdf_t sbdf = PCI_SBDF2(seg, bdf);
+        pci_sbdf_t sbdf = PCI_SBDF(seg, bdf);
         const struct ivrs_unity_map *um = ivrs_mappings[bdf].unity_map;
         unsigned int req = ivrs_mappings[bdf].dte_requestor_id;
         const struct amd_iommu *iommu = ivrs_mappings[bdf].iommu;
@@ -563,7 +563,7 @@ int cf_check amd_iommu_get_reserved_devi
              * the same alias ID.
              */
             if ( bdf != req && ivrs_mappings[req].iommu &&
-                 func(0, 0, PCI_SBDF2(seg, req).sbdf, ctxt) )
+                 func(0, 0, PCI_SBDF(seg, req).sbdf, ctxt) )
                 continue;
 
             if ( global == pending )
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -53,7 +53,7 @@ struct amd_iommu *find_iommu_for_device(
             ivrs_mappings[bdf] = tmp;
 
             printk(XENLOG_WARNING "%pp not found in ACPI tables;"
-                   " using same IOMMU as function 0\n", &PCI_SBDF2(seg, bdf));
+                   " using same IOMMU as function 0\n", &PCI_SBDF(seg, bdf));
 
             /* write iommu field last */
             ivrs_mappings[bdf].iommu = ivrs_mappings[bd0].iommu;
@@ -144,7 +144,7 @@ static int __must_check amd_iommu_setup_
                | (ivrs_dev->unity_map ? SET_ROOT_WITH_UNITY_MAP : 0);
 
     /* get device-table entry */
-    req_id = get_dma_requestor_id(iommu->seg, PCI_BDF2(bus, devfn));
+    req_id = get_dma_requestor_id(iommu->seg, PCI_BDF(bus, devfn));
     table = iommu->dev_table.buffer;
     dte = &table[req_id];
     ivrs_dev = &get_ivrs_mappings(iommu->seg)[req_id];
@@ -202,7 +202,7 @@ static int __must_check amd_iommu_setup_
          * presence.  But let's deal with that case only if it is actually
          * found in the wild.
          */
-        if ( req_id != PCI_BDF2(bus, devfn) &&
+        if ( req_id != PCI_BDF(bus, devfn) &&
              (sr_flags & SET_ROOT_WITH_UNITY_MAP) )
             rc = -EOPNOTSUPP;
         else
@@ -231,7 +231,7 @@ static int __must_check amd_iommu_setup_
              (any_pdev_behind_iommu(pdev->domain, pdev, iommu) ||
               pdev->phantom_stride) )
             AMD_IOMMU_WARN(" %pp: reassignment may cause %pd data corruption\n",
-                           &PCI_SBDF3(pdev->seg, bus, devfn), pdev->domain);
+                           &PCI_SBDF(pdev->seg, bus, devfn), pdev->domain);
 
         /*
          * Check remaining settings are still in place from an earlier call
@@ -414,7 +414,7 @@ static void amd_iommu_disable_domain_dev
         disable_ats_device(pdev);
 
     BUG_ON ( iommu->dev_table.buffer == NULL );
-    req_id = get_dma_requestor_id(iommu->seg, PCI_BDF2(bus, devfn));
+    req_id = get_dma_requestor_id(iommu->seg, PCI_BDF(bus, devfn));
     table = iommu->dev_table.buffer;
     dte = &table[req_id];
 
@@ -461,7 +461,7 @@ static int cf_check reassign_device(
     if ( !iommu )
     {
         AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be assigned to %pd\n",
-                       &PCI_SBDF3(pdev->seg, pdev->bus, devfn), target);
+                       &PCI_SBDF(pdev->seg, pdev->bus, devfn), target);
         return -ENODEV;
     }
 
@@ -488,7 +488,7 @@ static int cf_check reassign_device(
     if ( !is_hardware_domain(source) )
     {
         const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(pdev->seg);
-        unsigned int bdf = PCI_BDF2(pdev->bus, devfn);
+        unsigned int bdf = PCI_BDF(pdev->bus, devfn);
 
         rc = amd_iommu_reserve_domain_unity_unmap(
                  source,
@@ -498,7 +498,7 @@ static int cf_check reassign_device(
     }
 
     AMD_IOMMU_DEBUG("Re-assign %pp from %pd to %pd\n",
-                    &PCI_SBDF3(pdev->seg, pdev->bus, devfn), source, target);
+                    &PCI_SBDF(pdev->seg, pdev->bus, devfn), source, target);
 
     return 0;
 }
@@ -507,7 +507,7 @@ static int cf_check amd_iommu_assign_dev
     struct domain *d, u8 devfn, struct pci_dev *pdev, u32 flag)
 {
     struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(pdev->seg);
-    int bdf = PCI_BDF2(pdev->bus, devfn);
+    unsigned int bdf = PCI_BDF(pdev->bus, devfn);
     int req_id = get_dma_requestor_id(pdev->seg, bdf);
     int rc = amd_iommu_reserve_domain_unity_map(
                  d, ivrs_mappings[req_id].unity_map, flag);
@@ -575,12 +575,12 @@ static int cf_check amd_iommu_add_device
         }
 
         AMD_IOMMU_WARN("no IOMMU for %pp; cannot be handed to %pd\n",
-                        &PCI_SBDF3(pdev->seg, pdev->bus, devfn), pdev->domain);
+                        &PCI_SBDF(pdev->seg, pdev->bus, devfn), pdev->domain);
         return -ENODEV;
     }
 
     ivrs_mappings = get_ivrs_mappings(pdev->seg);
-    bdf = PCI_BDF2(pdev->bus, devfn);
+    bdf = PCI_BDF(pdev->bus, devfn);
     if ( !ivrs_mappings ||
          !ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].valid )
         return -EPERM;
@@ -618,7 +618,7 @@ static int cf_check amd_iommu_add_device
              ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].unity_map,
              0) )
         AMD_IOMMU_WARN("%pd: unity mapping failed for %pp\n",
-                       pdev->domain, &PCI_SBDF2(pdev->seg, bdf));
+                       pdev->domain, &PCI_SBDF(pdev->seg, bdf));
 
     if ( iommu_quarantine && pdev->arch.pseudo_domid == DOMID_INVALID )
     {
@@ -651,20 +651,20 @@ static int cf_check amd_iommu_remove_dev
     if ( !iommu )
     {
         AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be removed from %pd\n",
-                        &PCI_SBDF3(pdev->seg, pdev->bus, devfn), pdev->domain);
+                        &PCI_SBDF(pdev->seg, pdev->bus, devfn), pdev->domain);
         return -ENODEV;
     }
 
     amd_iommu_disable_domain_device(pdev->domain, iommu, devfn, pdev);
 
     ivrs_mappings = get_ivrs_mappings(pdev->seg);
-    bdf = PCI_BDF2(pdev->bus, devfn);
+    bdf = PCI_BDF(pdev->bus, devfn);
 
     if ( amd_iommu_reserve_domain_unity_unmap(
              pdev->domain,
              ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].unity_map) )
         AMD_IOMMU_WARN("%pd: unity unmapping failed for %pp\n",
-                       pdev->domain, &PCI_SBDF2(pdev->seg, bdf));
+                       pdev->domain, &PCI_SBDF(pdev->seg, bdf));
 
     amd_iommu_quarantine_teardown(pdev);
 
@@ -681,7 +681,7 @@ static int cf_check amd_iommu_remove_dev
 
 static int cf_check amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 {
-    int bdf = PCI_BDF2(bus, devfn);
+    unsigned int bdf = PCI_BDF(bus, devfn);
 
     return (bdf < ivrs_bdf_entries) ? get_dma_requestor_id(seg, bdf) : bdf;
 }
--- a/xen/drivers/passthrough/ats.h
+++ b/xen/drivers/passthrough/ats.h
@@ -35,7 +35,7 @@ static inline int pci_ats_enabled(int se
     pos = pci_find_ext_capability(seg, bus, devfn, PCI_EXT_CAP_ID_ATS);
     BUG_ON(!pos);
 
-    value = pci_conf_read16(PCI_SBDF3(seg, bus, devfn), pos + ATS_REG_CTL);
+    value = pci_conf_read16(PCI_SBDF(seg, bus, devfn), pos + ATS_REG_CTL);
 
     return value & ATS_ENABLE;
 }
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -553,7 +553,7 @@ int __init pci_ro_device(int seg, int bu
         memset(pseg->ro_map, 0, sz);
     }
 
-    __set_bit(PCI_BDF2(bus, devfn), pseg->ro_map);
+    __set_bit(PCI_BDF(bus, devfn), pseg->ro_map);
     _pci_hide_device(pdev);
 
     return 0;
@@ -957,7 +957,7 @@ static int deassign_device(struct domain
  out:
     if ( ret )
         printk(XENLOG_G_ERR "%pd: deassign (%pp) failed (%d)\n",
-               d, &PCI_SBDF3(seg, bus, devfn), ret);
+               d, &PCI_SBDF(seg, bus, devfn), ret);
 
     return ret;
 }
@@ -1406,7 +1406,7 @@ static int iommu_add_device(struct pci_d
         rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
         if ( rc )
             printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
-                   &PCI_SBDF3(pdev->seg, pdev->bus, devfn), rc);
+                   &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
     }
 }
 
@@ -1452,7 +1452,7 @@ static int iommu_remove_device(struct pc
             continue;
 
         printk(XENLOG_ERR "IOMMU: remove %pp failed (%d)\n",
-               &PCI_SBDF3(pdev->seg, pdev->bus, devfn), rc);
+               &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
         return rc;
     }
 
@@ -1536,7 +1536,7 @@ static int assign_device(struct domain *
  done:
     if ( rc )
         printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
-               d, &PCI_SBDF3(seg, bus, devfn), rc);
+               d, &PCI_SBDF(seg, bus, devfn), rc);
     /* The device is assigned to dom_io so mark it as quarantined */
     else if ( d == dom_io )
         pdev->quarantine = true;
@@ -1647,7 +1647,7 @@ int iommu_do_pci_domctl(
 
         seg = domctl->u.get_device_group.machine_sbdf >> 16;
         bus = PCI_BUS(domctl->u.get_device_group.machine_sbdf);
-        devfn = PCI_DEVFN2(domctl->u.get_device_group.machine_sbdf);
+        devfn = PCI_DEVFN(domctl->u.get_device_group.machine_sbdf);
         max_sdevs = domctl->u.get_device_group.max_sdevs;
         sdevs = domctl->u.get_device_group.sdev_array;
 
@@ -1697,7 +1697,7 @@ int iommu_do_pci_domctl(
 
         seg = machine_sbdf >> 16;
         bus = PCI_BUS(machine_sbdf);
-        devfn = PCI_DEVFN2(machine_sbdf);
+        devfn = PCI_DEVFN(machine_sbdf);
 
         pcidevs_lock();
         ret = device_assigned(seg, bus, devfn);
@@ -1706,7 +1706,7 @@ int iommu_do_pci_domctl(
             if ( ret )
             {
                 printk(XENLOG_G_INFO "%pp already assigned, or non-existent\n",
-                       &PCI_SBDF3(seg, bus, devfn));
+                       &PCI_SBDF(seg, bus, devfn));
                 ret = -EINVAL;
             }
         }
@@ -1742,7 +1742,7 @@ int iommu_do_pci_domctl(
 
         seg = machine_sbdf >> 16;
         bus = PCI_BUS(machine_sbdf);
-        devfn = PCI_DEVFN2(machine_sbdf);
+        devfn = PCI_DEVFN(machine_sbdf);
 
         pcidevs_lock();
         ret = deassign_device(d, seg, bus, devfn);
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -222,7 +222,7 @@ struct acpi_drhd_unit *acpi_find_matched
             continue;
 
         for (i = 0; i < drhd->scope.devices_cnt; i++)
-            if ( drhd->scope.devices[i] == PCI_BDF2(bus, devfn) )
+            if ( drhd->scope.devices[i] == PCI_BDF(bus, devfn) )
                 return drhd;
 
         if ( test_bit(bus, drhd->scope.buses) )
@@ -1062,7 +1062,7 @@ int cf_check intel_iommu_get_reserved_de
 
         rc = func(PFN_DOWN(rmrr->base_address),
                   PFN_UP(rmrr->end_address) - PFN_DOWN(rmrr->base_address),
-                  PCI_SBDF2(rmrr->segment, bdf).sbdf, ctxt);
+                  PCI_SBDF(rmrr->segment, bdf).sbdf, ctxt);
 
         if ( unlikely(rc < 0) )
             return rc;
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -498,7 +498,7 @@ static void set_msi_source_id(struct pci
         case 4: sq = SQ_13_IGNORE_1; break;
         default: sq = SQ_ALL_16; break;
         }
-        set_ire_sid(ire, SVT_VERIFY_SID_SQ, sq, PCI_BDF2(bus, devfn));
+        set_ire_sid(ire, SVT_VERIFY_SID_SQ, sq, PCI_BDF(bus, devfn));
         break;
 
     case DEV_TYPE_PCI:
@@ -508,7 +508,7 @@ static void set_msi_source_id(struct pci
         if ( ret == 0 ) /* integrated PCI device */
         {
             set_ire_sid(ire, SVT_VERIFY_SID_SQ, SQ_ALL_16,
-                        PCI_BDF2(bus, devfn));
+                        PCI_BDF(bus, devfn));
         }
         else if ( ret == 1 ) /* find upstream bridge */
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
         kind = "DMAR";
         break;
     case INTR_REMAP:
         printk(XENLOG_G_WARNING VTDPREFIX
                "INTR-REMAP: Request device [%pp] "
                "fault index %"PRIx64"\n",
-               &PCI_SBDF2(seg, source_id), addr >> 48);
+               &PCI_SBDF(seg, source_id), addr >> 48);
         kind = "INTR-REMAP";
         break;
     default:
         printk(XENLOG_G_WARNING VTDPREFIX
                "UNKNOWN: Request device [%pp] "
                "fault addr %"PRIx64"\n",
-               &PCI_SBDF2(seg, source_id), addr);
+               &PCI_SBDF(seg, source_id), addr);
         kind = "UNKNOWN";
         break;
     }
@@ -961,7 +961,7 @@ static int iommu_page_fault_do_one(struc
            kind, fault_reason, reason);
 
     if ( iommu_verbose && fault_type == DMA_REMAP )
-        print_vtd_entries(iommu, PCI_BUS(source_id), PCI_DEVFN2(source_id),
+        print_vtd_entries(iommu, PCI_BUS(source_id), PCI_DEVFN(source_id),
                           addr >> PAGE_SHIFT);
 
     return 0;
@@ -1039,7 +1039,7 @@ static void __do_iommu_page_fault(struct
                                 source_id, guest_addr);
 
         pci_check_disable_device(iommu->drhd->segment,
-                                 PCI_BUS(source_id), PCI_DEVFN2(source_id));
+                                 PCI_BUS(source_id), PCI_DEVFN(source_id));
 
         fault_index++;
         if ( fault_index > cap_num_fault_regs(iommu->cap) )
@@ -1541,7 +1541,7 @@ int domain_context_mapping_one(
                 check_cleanup_domid_map(domain, pdev, iommu);
             printk(XENLOG_ERR
                    "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
-                   &PCI_SBDF3(seg, bus, devfn),
+                   &PCI_SBDF(seg, bus, devfn),
                    (uint64_t)(res >> 64), (uint64_t)res,
                    (uint64_t)(old >> 64), (uint64_t)old);
             rc = -EILSEQ;
@@ -1571,7 +1571,7 @@ int domain_context_mapping_one(
         if ( !(mode & (MAP_OWNER_DYING | MAP_SINGLE_DEVICE)) )
             printk(XENLOG_WARNING VTDPREFIX
                    " %pp: reassignment may cause %pd data corruption\n",
-                   &PCI_SBDF3(seg, bus, devfn), prev_dom);
+                   &PCI_SBDF(seg, bus, devfn), prev_dom);
 
         write_atomic(&context->lo, lctxt.lo);
         /* No barrier should be needed between these two. */
@@ -1581,7 +1581,7 @@ int domain_context_mapping_one(
     iommu_sync_cache(context, sizeof(struct context_entry));
     spin_unlock(&iommu->lock);
 
-    rc = iommu_flush_context_device(iommu, prev_did, PCI_BDF2(bus, devfn),
+    rc = iommu_flush_context_device(iommu, prev_did, PCI_BDF(bus, devfn),
                                     DMA_CCMD_MASK_NOBIT, !prev_dom);
     flush_dev_iotlb = !!find_ats_dev_drhd(iommu);
     ret = iommu_flush_iotlb_dsi(iommu, prev_did, !prev_dom, flush_dev_iotlb);
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
 
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCIe: map %pp\n",
-                   domain, &PCI_SBDF3(seg, bus, devfn));
+                   domain, &PCI_SBDF(seg, bus, devfn));
         ret = domain_context_mapping_one(domain, drhd->iommu, bus, devfn, pdev,
                                          DEVICE_DOMID(domain, pdev), pgd_maddr,
                                          mode);
@@ -1737,7 +1737,7 @@ static int domain_context_mapping(struct
 
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCI: map %pp\n",
-                   domain, &PCI_SBDF3(seg, bus, devfn));
+                   domain, &PCI_SBDF(seg, bus, devfn));
 
         ret = domain_context_mapping_one(domain, drhd->iommu, bus, devfn,
                                          pdev, DEVICE_DOMID(domain, pdev),
@@ -1802,7 +1802,7 @@ static int domain_context_mapping(struct
 
     default:
         dprintk(XENLOG_ERR VTDPREFIX, "%pd:unknown(%u): %pp\n",
-                domain, pdev->type, &PCI_SBDF3(seg, bus, devfn));
+                domain, pdev->type, &PCI_SBDF(seg, bus, devfn));
         ret = -EINVAL;
         break;
     }
@@ -1851,7 +1851,7 @@ int domain_context_unmap_one(
     iommu_sync_cache(context, sizeof(struct context_entry));
 
     rc = iommu_flush_context_device(iommu, iommu_domid,
-                                    PCI_BDF2(bus, devfn),
+                                    PCI_BDF(bus, devfn),
                                     DMA_CCMD_MASK_NOBIT, 0);
 
     flush_dev_iotlb = !!find_ats_dev_drhd(iommu);
@@ -1910,7 +1910,7 @@ static const struct acpi_drhd_unit *doma
     case DEV_TYPE_PCI_HOST_BRIDGE:
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:Hostbridge: skip %pp unmap\n",
-                   domain, &PCI_SBDF3(seg, bus, devfn));
+                   domain, &PCI_SBDF(seg, bus, devfn));
         return ERR_PTR(is_hardware_domain(domain) ? 0 : -EPERM);
 
     case DEV_TYPE_PCIe_BRIDGE:
@@ -1924,7 +1924,7 @@ static const struct acpi_drhd_unit *doma
 
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCIe: unmap %pp\n",
-                   domain, &PCI_SBDF3(seg, bus, devfn));
+                   domain, &PCI_SBDF(seg, bus, devfn));
         ret = domain_context_unmap_one(domain, iommu, bus, devfn);
         if ( !ret && devfn == pdev->devfn && ats_device(pdev, drhd) > 0 )
             disable_ats_device(pdev);
@@ -1937,7 +1937,7 @@ static const struct acpi_drhd_unit *doma
 
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCI: unmap %pp\n",
-                   domain, &PCI_SBDF3(seg, bus, devfn));
+                   domain, &PCI_SBDF(seg, bus, devfn));
         ret = domain_context_unmap_one(domain, iommu, bus, devfn);
         if ( ret )
             break;
@@ -1970,7 +1970,7 @@ static const struct acpi_drhd_unit *doma
 
     default:
         dprintk(XENLOG_ERR VTDPREFIX, "%pd:unknown(%u): %pp\n",
-                domain, pdev->type, &PCI_SBDF3(seg, bus, devfn));
+                domain, pdev->type, &PCI_SBDF(seg, bus, devfn));
         return ERR_PTR(-EINVAL);
     }
 
@@ -2181,9 +2181,7 @@ static int cf_check intel_iommu_add_devi
 
     for_each_rmrr_device ( rmrr, bdf, i )
     {
-        if ( rmrr->segment == pdev->seg &&
-             PCI_BUS(bdf) == pdev->bus &&
-             PCI_DEVFN2(bdf) == devfn )
+        if ( rmrr->segment == pdev->seg && bdf == PCI_BDF(pdev->bus, devfn) )
         {
             /*
              * iommu_add_device() is only called for the hardware
@@ -2239,9 +2237,7 @@ static int cf_check intel_iommu_remove_d
 
     for_each_rmrr_device ( rmrr, bdf, i )
     {
-        if ( rmrr->segment != pdev->seg ||
-             PCI_BUS(bdf) != pdev->bus ||
-             PCI_DEVFN2(bdf) != devfn )
+        if ( rmrr->segment != pdev->seg || bdf != PCI_BDF(pdev->bus, devfn) )
             continue;
 
         /*
@@ -2668,8 +2664,7 @@ static int cf_check reassign_device_owne
 
         for_each_rmrr_device( rmrr, bdf, i )
             if ( rmrr->segment == pdev->seg &&
-                 PCI_BUS(bdf) == pdev->bus &&
-                 PCI_DEVFN2(bdf) == devfn )
+                 bdf == PCI_BDF(pdev->bus, devfn) )
             {
                 /*
                  * Any RMRR flag is always ignored when remove a device,
@@ -2713,9 +2708,7 @@ static int cf_check intel_iommu_assign_d
      */
     for_each_rmrr_device( rmrr, bdf, i )
     {
-        if ( rmrr->segment == seg &&
-             PCI_BUS(bdf) == bus &&
-             PCI_DEVFN2(bdf) == devfn &&
+        if ( rmrr->segment == seg && bdf == PCI_BDF(bus, devfn) &&
              rmrr->scope.devices_cnt > 1 )
         {
             bool_t relaxed = !!(flag & XEN_DOMCTL_DEV_RDM_RELAXED);
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
-        if ( rmrr->segment == seg &&
-             PCI_BUS(bdf) == bus &&
-             PCI_DEVFN2(bdf) == devfn )
+        if ( rmrr->segment == seg && bdf == PCI_BDF(bus, devfn) )
         {
             ret = iommu_identity_mapping(d, p2m_access_rw, rmrr->base_address,
                                          rmrr->end_address, flag);
@@ -2762,9 +2753,7 @@ static int cf_check intel_iommu_assign_d
 
     for_each_rmrr_device( rmrr, bdf, i )
     {
-        if ( rmrr->segment == seg &&
-             PCI_BUS(bdf) == bus &&
-             PCI_DEVFN2(bdf) == devfn )
+        if ( rmrr->segment == seg && bdf == PCI_BDF(bus, devfn) )
         {
             int rc = iommu_identity_mapping(d, p2m_access_x,
                                             rmrr->base_address,
@@ -2791,7 +2780,7 @@ static int cf_check intel_iommu_group_id
     if ( find_upstream_bridge(seg, &bus, &devfn, &secbus) < 0 )
         return -ENODEV;
 
-    return PCI_BDF2(bus, devfn);
+    return PCI_BDF(bus, devfn);
 }
 
 static int __must_check cf_check vtd_suspend(void)
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -115,7 +115,7 @@ bool is_azalia_tlb_enabled(const struct
         return true;
 
     /* Check for the specific device. */
-    sbdf = PCI_SBDF2(drhd->segment, drhd->scope.devices[0]);
+    sbdf = PCI_SBDF(drhd->segment, drhd->scope.devices[0]);
     if ( pci_conf_read16(sbdf, PCI_VENDOR_ID) != PCI_VENDOR_ID_INTEL ||
          pci_conf_read16(sbdf, PCI_DEVICE_ID) != 0x3a3e )
         return true;
@@ -446,7 +446,7 @@ int me_wifi_quirk(struct domain *domain,
             return 0;
 
         /* if device is WLAN device, map ME phantom device 0:3.7 */
-        id = pci_conf_read32(PCI_SBDF3(0, bus, devfn), 0);
+        id = pci_conf_read32(PCI_SBDF(0, bus, devfn), 0);
         switch (id)
         {
             case 0x42328086:
@@ -470,7 +470,7 @@ int me_wifi_quirk(struct domain *domain,
             return 0;
 
         /* if device is WLAN device, map ME phantom device 0:22.7 */
-        id = pci_conf_read32(PCI_SBDF3(0, bus, devfn), 0);
+        id = pci_conf_read32(PCI_SBDF(0, bus, devfn), 0);
         switch (id)
         {
             case 0x00878086:        /* Kilmer Peak */
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -96,7 +96,7 @@ void print_vtd_entries(struct vtd_iommu
     u32 l_index, level;
 
     printk("print_vtd_entries: iommu #%u dev %pp gmfn %"PRI_gfn"\n",
-           iommu->index, &PCI_SBDF3(iommu->drhd->segment, bus, devfn),
+           iommu->index, &PCI_SBDF(iommu->drhd->segment, bus, devfn),
            gmfn);
 
     if ( iommu->root_maddr == 0 )
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -46,12 +46,12 @@ int pci_find_next_cap(u16 seg, u8 bus, u
 
     while ( ttl-- )
     {
-        pos = pci_conf_read8(PCI_SBDF3(seg, bus, devfn), pos);
+        pos = pci_conf_read8(PCI_SBDF(seg, bus, devfn), pos);
         if ( pos < 0x40 )
             break;
 
         pos &= ~3;
-        id = pci_conf_read8(PCI_SBDF3(seg, bus, devfn), pos + PCI_CAP_LIST_ID);
+        id = pci_conf_read8(PCI_SBDF(seg, bus, devfn), pos + PCI_CAP_LIST_ID);
 
         if ( id == 0xff )
             break;
@@ -93,7 +93,7 @@ int pci_find_next_ext_capability(int seg
     int ttl = 480; /* 3840 bytes, minimum 8 bytes per capability */
     int pos = max(start, 0x100);
 
-    header = pci_conf_read32(PCI_SBDF3(seg, bus, devfn), pos);
+    header = pci_conf_read32(PCI_SBDF(seg, bus, devfn), pos);
 
     /*
      * If we have no capabilities, this is indicated by cap ID,
@@ -109,7 +109,7 @@ int pci_find_next_ext_capability(int seg
         pos = PCI_EXT_CAP_NEXT(header);
         if ( pos < 0x100 )
             break;
-        header = pci_conf_read32(PCI_SBDF3(seg, bus, devfn), pos);
+        header = pci_conf_read32(PCI_SBDF(seg, bus, devfn), pos);
     }
     return 0;
 }
@@ -162,7 +162,7 @@ const char *__init parse_pci_seg(const c
     else
         func = 0;
     if ( seg != (seg_p ? (u16)seg : 0) ||
-         bus != PCI_BUS(PCI_BDF2(bus, 0)) ||
+         bus != PCI_BUS(PCI_BDF(bus, 0)) ||
          dev != PCI_SLOT(PCI_DEVFN(dev, 0)) ||
          func != PCI_FUNC(PCI_DEVFN(0, func)) )
         return NULL;
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -122,9 +122,9 @@ void __init video_endboot(void)
                 pcidevs_unlock();
 
                 if ( !pdev ||
-                     pci_conf_read16(PCI_SBDF3(0, bus, devfn),
+                     pci_conf_read16(PCI_SBDF(0, bus, devfn),
                                      PCI_CLASS_DEVICE) != 0x0300 ||
-                     !(pci_conf_read16(PCI_SBDF3(0, bus, devfn), PCI_COMMAND) &
+                     !(pci_conf_read16(PCI_SBDF(0, bus, devfn), PCI_COMMAND) &
                        (PCI_COMMAND_IO | PCI_COMMAND_MEMORY)) )
                     continue;
 
@@ -136,12 +136,12 @@ void __init video_endboot(void)
                         b = 0;
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
-    ((pci_sbdf_t){ .sbdf = (((s) & 0xffff) << 16) | PCI_BDF(b, d, f) })
-#define PCI_SBDF2(s,bdf) \
+
+#define PCI_DEVFN1_(df)   ((df) & 0xff)
+#define PCI_DEVFN2_(d, f) ((((d) & 0x1f) << 3) | ((f) & 7))
+#define PCI_SBDF4_(s, b, d, f...) \
+    ((pci_sbdf_t){ .sbdf = (((s) & 0xffff) << 16) | PCI_BDF(b, d, ##f) })
+#define PCI_SBDF3_ PCI_SBDF4_
+#define PCI_SBDF2_(s, bdf) \
     ((pci_sbdf_t){ .sbdf = (((s) & 0xffff) << 16) | ((bdf) & 0xffff) })
-#define PCI_SBDF3(s,b,df) \
-    ((pci_sbdf_t){ .sbdf = (((s) & 0xffff) << 16) | PCI_BDF2(b, df) })
+
+#define PCI__(what, nr) PCI_##what##nr##_
+#define PCI_(what, nr)  PCI__(what, nr)
+
+#define PCI_DEVFN(d, f...)   PCI_(DEVFN, count_args(d, ##f))(d, ##f)
+#define PCI_BDF(b, d, f...)  ((((b) & 0xff) << 8) | PCI_DEVFN(d, ##f))
+#define PCI_SBDF(s, b, d...) PCI_(SBDF, count_args(s, b, ##d))(s, b, ##d)
 
 #define ECAM_REG_OFFSET(addr)  ((addr) & 0x00000fff)
 


