Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E9A4026C1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 12:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180740.327526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY0u-0002K2-Ui; Tue, 07 Sep 2021 10:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180740.327526; Tue, 07 Sep 2021 10:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY0u-0002Hc-Re; Tue, 07 Sep 2021 10:07:36 +0000
Received: by outflank-mailman (input) for mailman id 180740;
 Tue, 07 Sep 2021 10:07:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNY0t-0002HU-EM
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 10:07:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43a92863-ce51-4304-ae2a-921d17555026;
 Tue, 07 Sep 2021 10:07:34 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-Cy3fR7TTMiqk8fr6zznO7w-2; Tue, 07 Sep 2021 12:07:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 10:07:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 10:07:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0027.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.21 via Frontend Transport; Tue, 7 Sep 2021 10:07:29 +0000
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
X-Inumbo-ID: 43a92863-ce51-4304-ae2a-921d17555026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631009253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VGr5KaKrPB+ECiV3mI7JH4ZubnK2Jw/FcM9+PIVCR9A=;
	b=hqRjfrkrRphKiA3n4lLVBEI4pTxvwCvUrlc7+mzk+krKLb60c4bY4mdJS1xathkrVrDikq
	6NbsCq7Lpk5eewybHy+osieBqobG/PR770sAgXbNzQO4l6osvoBz7aHfQJmL3D2lCFHhOt
	Fd2mFSwusz3B/UB0O0kgy7WHo7jo+Tw=
X-MC-Unique: Cy3fR7TTMiqk8fr6zznO7w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7w8LcHGWrntrIYAkeiSiGk55H9JXGxZWhzHMFppR/cRrQdSZv+/igXsqnHTmP0Db4BWfQ3SykDnf9DCNSlASWI78IYAYrGBxrUsI92qSlLC7WOiPER6Ot6kzhw90XiSweJmrg/Q5/zTEg9NkLFa6ZIskZhmAB/qwoykyhZvyZSNOxmDLzfvGmrTTZejD5lDZ0BpYAh/a1F6AEt6A8zJq/4c7vitO2JvcAZAc3Gei1wZCMmRbdnT6DHFc5xuEKUR1bPBy4EK8xK9Hh7P9qhyl7aFHqdZhmoj/YOkM2xOiHThcXDRxuwrPLlrxD5OwKJ1tzyQWIVkWznrpiCei+EsAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=VGr5KaKrPB+ECiV3mI7JH4ZubnK2Jw/FcM9+PIVCR9A=;
 b=fkAvpHWiBc9h1bqrhaK5I963N+DD6VmjRJlVSZiYOy6sj/8wPjtRuPllCh0S1I58WDZ+0EamhtXYH4+lgXm6+X8D6Vwk5l2f+bvvJC1eGKvv0hWEvotTrer/ve6ZdCEUkJ4bT2GKn9U47on+ZDsb4zzdSW1dC877irj87ABIrhBOJdGkEfDC2Y6aE9fnFKbDodlk+6qeAPOoB6EiM3IJlCVnwxLP80+C61HtcTkPokC7kkprSxBQ75aR+phEqm/5nIEX3WnyF2Z2cZu1znJVmCmYQx5+VbzY+tKrSrPPmV451fQaCEdRwFQkGnqvz3T+6HFszpEShKMzIeBlGBxtnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 1/9] xen/x86: prevent PVH type from getting clobbered
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Message-ID: <46ec0dab-8b5e-f20f-225b-3f4c57f34a61@suse.com>
Date: Tue, 7 Sep 2021 12:07:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0027.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f341c0ab-13c6-4607-4725-08d971e74d4e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61761A562A0E0F796CF94FC6B3D39@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mSGEp41nFGKSmsQ1+MLYGHCoH7IgpiKvEoU6D4xsANOmdp6UCOt/3I+nOU1vHoWalA6KkS+wA7wqDtHUZIRQBIehvDnx2GlF1+ZewAcb0ozqIt7ieq++7xCeyMIx5pjW55O6XF+fFgqh9bK44aP5DV1P0ntT0AjhQYYnEolvzc1xCQWdv5EmGJ3smF+SPQDZXktIL3GBCrO9Uku3m/OkGizM7S13IW8Tl531sGroXAIWHZRe9TuSm3StKoZBbxglJyHkgfeNrk9vFou7DLmhXlTSksp3e8jo8AMT0+QghHGwEZZf/c8TVBb8lmr4str+sRIYCcnrHKG/7S8TE8zfaP7Hwr45iDEmXBNTO5F+6r2YQ8GgVwnMhEc22HxlMnQV+Ec3cH8yk9Nr/y5q+q/INT4JNLNvpDy0aybhmVZCX0WRM2asjWFG/Gdda4XJf136N8sv1u14ten8vwPTe5Idor9TmvFLOBqv19L4jvEGuzYVLxDIWL32pp2gkfMu77iTTirxGQaV0Rk2EgMa1KmJQhtwEWUshxm/QoJqAdOFj6WiIIdN5amGvyOnZpWrEzPrsxbUSPRrKeihhrcgNv2la0Hi9XYvpK/7RcHrCQUR68EmHJQsVIFdyc0a6gOWCzfXi1o8oVsbP+FUOSNX1EhtFtWXWPhBgMMxhWCDifgVj/bKGAXoOxah13OmLA8enrsR23bHWeay2HdW/YJ5sxh16jGt8PYBFPRy7SnXnmFaSqE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(346002)(396003)(376002)(54906003)(66476007)(66556008)(2616005)(86362001)(8676002)(66946007)(31696002)(956004)(26005)(38100700002)(6486002)(4326008)(8936002)(186003)(31686004)(36756003)(110136005)(316002)(478600001)(16576012)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2dzMlRpR3RYckx2TFFiNFhLWUd2OGZraEd0dmJpUExudTV6b0ZOTThkTXNu?=
 =?utf-8?B?MVZQMzdCMUFCU3hFTnlucTd3aFhvRmkxUW12VnduWkNneWdmSCsxS3lsZXdK?=
 =?utf-8?B?Ymo0TVBDbWhLZEhPRW42cVk5YlhTRkJDK3orODlSTjhVeExmNlBVSUl1TDhU?=
 =?utf-8?B?ZEk3Y0hPYnBCNUkwK3VYcVp5MnRVVjZUYUxpOGZpNFdpUlRzYmtJaWlJdkpl?=
 =?utf-8?B?NFlwZ0pGcmd1b1dKSWd6RlhnRnhMUXVHT2FoOEgxTWZTRzlCRERCR3FVUncv?=
 =?utf-8?B?NXhWcGZxUFJQMHNJMmlsSzhDdStHcndiRFFyVnluMVdWdTFabDVvN3ViTWNC?=
 =?utf-8?B?bnZoTXI0SlMydWs0eXE4ajZOcGFnU3RDZ0NoR0hhcjZoMitoVm0zNzRVamNs?=
 =?utf-8?B?RmVxYUMzUGxwWDNxQzBMdlJOem1IS3dTWXRseWs5RmdMTEFGbnJoQnJWNUhY?=
 =?utf-8?B?RHQ5WTdmQlV2Tlp2VjBQeUhTMmlJdmY4ZXRRV3VHQ2phdDBzbTFVUzFjQmQ3?=
 =?utf-8?B?bDBIVkNKMVJoVVpCM3kvT1dhQmgzZDNpbHlNNGN3L2l0OEVxNlBOYzFUTkVL?=
 =?utf-8?B?MW1HYzNpWDZJb0RYYlBTY0FIaXRoTzNUdHNjWXBnc2ZwSXVpazgvVkxQV2pi?=
 =?utf-8?B?N1ZmQi9pK3BIWllzREZsd001cWQyLzhwTjhQOCs4cWVnRjlQa1Q3NnJ6RnpF?=
 =?utf-8?B?a0Z5bEtXdjFCejI2NlpXWWJIckpuRjVPWGdraURZczM0SHBxQmMzelpMdWRQ?=
 =?utf-8?B?ekJtSUUyOXQ2cjlTM2VlakhGeTBWQkR1bDE0alI0N1BSNnh0aDBUZjNLaExm?=
 =?utf-8?B?Y1dCa1JOd0J6OXpXVERaa1F0ZFJRTExCUG1TOUZtRFIxL3pwRnBnbnpPdXV3?=
 =?utf-8?B?SC81cVhKMSt0NXNuVVlsaTg4akd6eXJTbVN1MnVQKzZOMHhEZUljRXlSSExO?=
 =?utf-8?B?SlQrVnVZYnlFclJid2tVTTRDckhpMjVMN3BKdXI3dEN2YVROc0Nsc01YN05a?=
 =?utf-8?B?M05QR0Q4eW16aHV0SWlLQ2FtMUdpMTZFTG9IcUUycGJqVkNmMnYzRE9hNFNE?=
 =?utf-8?B?UmRXSzYrTFphTnJIOGViNEJDd3pZT0E2SGRObVlPVGc2TnlaUEFQU3gyTVA0?=
 =?utf-8?B?NkZtdkx4dUtES1RUUGdUazJGWVloUFhUWi9BTmlGRGkrSEdNVDlRUktwb2hV?=
 =?utf-8?B?aCtqQW9NSzFobEdKRUlTMUNvYkZuQk1UbUZkUVo5YlFRMHVDc1RoRkh6eU5D?=
 =?utf-8?B?bU5QTDRtLzZVV2FjVnpmenUzYk5ZTnlQbTJlWU1OUG1EaWVKUjZmTTVZOVFG?=
 =?utf-8?B?YkNDYUp6MmVoWDJ6cytiazVtRUtLSlpKRStlSStOM1ZZOW43RmFRcFdRM2ZG?=
 =?utf-8?B?emswc054N1dpNnp0dFdvNFZCcXU2cE0yTlBZTmtXMEtRcG1lbGNiWEJkeVgv?=
 =?utf-8?B?WVZJVi91eTlRV2VFMS9XdktNbVFadE1hcXF6T29vU0xqTWIwSUZob0luTGdo?=
 =?utf-8?B?ckNFTjRVZVpOeU5XMFBJVVZxenc1T096VGpTSkxBWTRCK0V3YzJkM0JZUUlE?=
 =?utf-8?B?L0dkcUlINUxkYStoYWc1Umc5cFV5Q1pUMjVBRW94bGdzbGliZFJRSCtHV1lq?=
 =?utf-8?B?czVHalpSWWRDWXdTaHFIUExrdS85dVB6UFJpanFVNG9Sd2N3Y3UvcVZ6cWNO?=
 =?utf-8?B?QVk2MWhpZjFuMEEyWndoSjNTdHBHODJEWFlIMkVZbFk4K0NTNmpGQUZ0VkJU?=
 =?utf-8?Q?HDMt7eyMsTxeoDgm20BozDq9gHtYRZ43Ot0vBJe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f341c0ab-13c6-4607-4725-08d971e74d4e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 10:07:29.9054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvS5/u6jIhA5YQ0631sjlbwiEn+yvGE77jAgeJqeSx60mKCJMyT7CZAKFxhZymyjUu4zRhQJG1MeuVMh54jebg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

Like xen_start_flags, xen_domain_type gets set before .bss gets cleared.
Hence this variable also needs to be prevented from getting put in .bss,
which is possible because XEN_NATIVE is an enumerator evaluating to
zero. Any use prior to init_hvm_pv_info() setting the variable again
would lead to wrong decisions; one such case is xenboot_console_setup()
when called as a result of "earlyprintk=xen".

Use __ro_after_init as more applicable than either __section(".data") or
__read_mostly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -52,9 +52,6 @@ DEFINE_PER_CPU(struct vcpu_info, xen_vcp
 DEFINE_PER_CPU(uint32_t, xen_vcpu_id);
 EXPORT_PER_CPU_SYMBOL(xen_vcpu_id);
 
-enum xen_domain_type xen_domain_type = XEN_NATIVE;
-EXPORT_SYMBOL_GPL(xen_domain_type);
-
 unsigned long *machine_to_phys_mapping = (void *)MACH2PHYS_VIRT_START;
 EXPORT_SYMBOL(machine_to_phys_mapping);
 unsigned long  machine_to_phys_nr;
@@ -69,9 +66,11 @@ __read_mostly int xen_have_vector_callba
 EXPORT_SYMBOL_GPL(xen_have_vector_callback);
 
 /*
- * NB: needs to live in .data because it's used by xen_prepare_pvh which runs
- * before clearing the bss.
+ * NB: These need to live in .data or alike because they're used by
+ * xen_prepare_pvh() which runs before clearing the bss.
  */
+enum xen_domain_type __ro_after_init xen_domain_type = XEN_NATIVE;
+EXPORT_SYMBOL_GPL(xen_domain_type);
 uint32_t xen_start_flags __section(".data") = 0;
 EXPORT_SYMBOL(xen_start_flags);
 


