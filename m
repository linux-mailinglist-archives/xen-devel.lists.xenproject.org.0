Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6454F5E68
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 14:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299862.511119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5DQ-00052E-C2; Wed, 06 Apr 2022 12:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299862.511119; Wed, 06 Apr 2022 12:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5DQ-00050O-7e; Wed, 06 Apr 2022 12:56:52 +0000
Received: by outflank-mailman (input) for mailman id 299862;
 Wed, 06 Apr 2022 12:56:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc5DO-0004mu-M2
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 12:56:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06066c50-b5a9-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 14:56:49 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-KCe3q4fLPc27D_uWnphhKQ-1; Wed, 06 Apr 2022 14:56:48 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5327.eurprd04.prod.outlook.com (2603:10a6:803:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 12:56:46 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 12:56:46 +0000
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
X-Inumbo-ID: 06066c50-b5a9-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649249809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLkZDsAwAZkFeGlkbrVjRJB9bEjwOf8d9cZYowO6s/0=;
	b=SAzEa0en4CeZTi88woBoQjdCUepGyFrBUx3KDuVQAFuczA14CM/y9EesuoOhpbCy7k7kgi
	q/nOo7Qf51Cn25dqCHEFQfw4DMgWEmewqyDwC2fTtnOeGVv1s04Lrw/gJs4R7JeWFHLhG6
	gupeK0yVFL/pEqXtIJ1UXOxO8vU4atw=
X-MC-Unique: KCe3q4fLPc27D_uWnphhKQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTk9up4YJVFKwCqMWECxrYkoEfR/8hdF5/GBSqopwxegMNK0a4zbqZTjAKJ7xv3W+oFbuNkGiwCsKPDvWmpxrA7wMu4K6GfyoFXJkgECEmHbXVsJPGme20WcqAJw8A//ZLt3vk+/vdrM4bEdFrCIK8mVK+EvY5UDmKC5OberOw4rT0G5LkMWIhHoGX8dzcKkUj10oUX1hcmaeoGmX8DmK15XRRZY9CphR0y/3c2UcHJyLcXHX6Vtw+AnXcjMvOYNE2WrnA6K0emnZMgqIDlJkBz2qtxEEg51KJ+RRllGedEJuCTj/7vLXWmmpvCI6oPDrMKHWU8sOPyeneiS1ifBig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLkZDsAwAZkFeGlkbrVjRJB9bEjwOf8d9cZYowO6s/0=;
 b=Bo+x6oxmSF3yoPBRhSqLBIgNU2LiHsNhTN53XnytulbSAh/rUaMkidq+lawnOqY076Vq9OLWF0UQKtfIttZPtIWQFQj66tttv01ZWuvKVL+3E1yBXdRyuNFLSS7BDN21cL+K6a3mWBUbKWqJu1xBjhdwCp17CRtcrQIVTTR/1EaPz2B5YbcUnXKe8AiXzIS+umDmSnKmeN+AW03J6eq10u9oDKKdrgT8USsrshi3A7QrMEyMRoskw3W65wQXzFBVjIWaULCb0EbBuA7S1ksPwci0gt2IGA2jMy6kfuubaQlOvq0T1jsDVKz8VCjqu6O6P2ybMu6scFcHxW0vzGZUlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6aa3e42b-e8a8-c925-8f2d-0bc681d842cd@suse.com>
Date: Wed, 6 Apr 2022 14:56:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220401104713.22291-1-jane.malalane@citrix.com>
 <20220401104713.22291-2-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220401104713.22291-2-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0003.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef62dd0e-4c01-4001-ac7e-08da17cce777
X-MS-TrafficTypeDiagnostic: VI1PR04MB5327:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5327282372378D334514D71EB3E79@VI1PR04MB5327.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MsdPEn7YywDoaF3LjY3b2aYvHXGXNK3ps2hzwORZSxOCp7HVHC+fdMYTjE/KztU2V9wH6qtO7vnD7jD6yhpEnvw2KjR8OpnM7qQrPM2tbIYgGqcPORz2i//UJ0GTk1rbiJvtrwgoZY66cOVWIBd1ap8SAq92VK8sT8S9TJO/IjHR9M96E8BJjmlooZh8LXAWeEQaPbJI91hUCoxxDlsIUqXB8OoJq/SH2Os4z7DCU67f8+19puL8YBWMefRzyd/jgEqsvtt4SJGdSPNoqUDS5YW3tyabS8ULmJCc7VwPvQWyc7oda90dAjgA6ejEjS9l1DX5ZaWs3Ko22tQnaZ07XHxJcy/pVWhzyjxDRPkTtR3gTXi5OhCmkPyj/JS3NJfEOsYKbOcr9/rtkJvFPJ4RXUTRkh4O5BTqEGQBGB2fYHDqUpRecwIwyWGbcrzu/SDyMjjE30eIOYyraJ0yh4n5+4GhuoCXcC644LjfKkeprdhU5sBlxAa4DVRq/r5tF1GQSrapfx5OP54zhcZ8dJlZNPCspL3P5E6aNVR/jVapOxpln0Cw9G9f0r5yyEWPdxDQx6Qh2DAIQvMu3VQL++oVWaw70DF+Wxhzan3fnlDLOQ3Od0D/tBktJI8x63jRLqOdNQeMXT77kHVw93XnNZXoDGYEXgJxXymz160flfdS3YSaj92sbo7WLcz0SgxJ/W2+IH9VzIl9fTlwg04FC3Ox47Ltlq0ksaMRPRaKxcGQVcU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(66946007)(6506007)(6666004)(8676002)(66476007)(6512007)(66556008)(6486002)(83380400001)(54906003)(316002)(86362001)(53546011)(6916009)(31696002)(4326008)(38100700002)(7416002)(36756003)(31686004)(26005)(186003)(8936002)(5660300002)(2906002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGZMWnFkNW5FYVpaOFVtMnMyR1pXaHBJeDNyYkZrb1kzM1dvSk5aWnNaQWRT?=
 =?utf-8?B?VjJzcU4yU0ZxakpZYi9kYlI5ZWdsTjczS3lycmlmU2hVYldDZ3hkbC9zaEJV?=
 =?utf-8?B?TjhUMTNLZVNraWhpYTk3RXdoVXltRjFCQlpMOXN6VENWUnhwRnlXK0svZmVM?=
 =?utf-8?B?QW8xM1J2MUJCaHdYdzZ6ZWtzdWhXYWluZW1EMGk2aTBBR3AzUkc3aHBqQVdK?=
 =?utf-8?B?TW5sTExNQ2ZPUUxFbzdwTlVYUWNXZmRuY25MOGQ4Q1RKenVNb3FKenkvc2JH?=
 =?utf-8?B?MXhLVktEZWdKc2F3UmlQOGVDSmJxS3gydGo1SWxKcXBsWHRnczVZejM4c1FP?=
 =?utf-8?B?OXpFRkRaQzJFaGowM0lTcEl3aEVHMU5XRlpIcGc5M2wzUnByRzdwdWlkZTRL?=
 =?utf-8?B?OVdISS9LcnFlaDlUczJLT3piaHdPWDZTeHlXejJUUXR4RVZUanJUVnVNZXJ1?=
 =?utf-8?B?R3BUMDN5YUNmSlJUZXZ1TlkvcWFBcko3S3Y2VkJ5Yi85Y2pZbitBOTQrbURF?=
 =?utf-8?B?M3FNNzlEZ0hJRDF1NVcwelNlZzVmaUxGUHhubXUvcllTMHZUYUhkb2pLc05K?=
 =?utf-8?B?VTd5djB2ZkRzdTl1anRJM1NvS28vRmFXbk5NRjNObDBYNVE2U1VpRitwZmNH?=
 =?utf-8?B?eE5jYnoyZmUzb2Nadm1QZ0NheWMrN2RzelpqaEtrd293WktmelR5MEJqQ01r?=
 =?utf-8?B?S1ZFUklwZGRFdmF6U2VSNU83c1d6TTZQZFlDbUIwWTF2eVJVK01tVm91eGVO?=
 =?utf-8?B?N3pjSHdxRnpVencyVnJ4NTlSWWNOMC9kRFcyVUhFRm5PYkNuSG9WWUZuZEVt?=
 =?utf-8?B?a3ZDSWVmY21vRXljd2NPUU1nWkZyd2x6V0c2b0N3dWhLRjErWTNRSERpUCsx?=
 =?utf-8?B?RkhQR3pQdy8xMEdheElvZDdEMUlDN3NuSnNuUS9uUTErbEgySCt3MU1aYTVL?=
 =?utf-8?B?dTFkbHFoY05KVHRVcWx1Z3hwUXFoL3lFMDBZL2dWOXRCM0RqdXliQU95Y1ZX?=
 =?utf-8?B?V2JsU04zNmJKYVMwbUI2czUzODlmekZBYmVDNHBwUGJCQWgzM3pPNHo5RU5R?=
 =?utf-8?B?S2xXT2huUFZlMkt5cGdrTFNrRUt4bXhiK0R0azNQaTNGQjUreWUvRHRwYjNo?=
 =?utf-8?B?RHdyWHpwcTNrcHphK1hzVWZwTmx5emRYMjZtd0NOb05KeEczaS9qOFBKRmZs?=
 =?utf-8?B?WjNtREtzd2M1V1k5WU9CZjRZbkJnQXQ4aEhiNVY5elUzV1BuM2V2SEp3SG4w?=
 =?utf-8?B?NlVOZ3NyRHlBN3pCVDhwNG9MK09VMGxvRlVWUmhmYjBZYlJpSzVPaHlJRnZT?=
 =?utf-8?B?bEJWYXh2V0RFSnVydHZuUGVqcU9ob3NSQjN0Q05saU55RVppQzRxMkdwemVa?=
 =?utf-8?B?NHVoc0Jnd09oOWpBdng3Ykk0R3dnSzAvK0IyVGFpS01wUzQ1L0xJZGMwSm45?=
 =?utf-8?B?eHVXV2RBcllZUUsyc3l4bWhsaFZJeVdwcVJCMklsTG11US9TS2xpZjQ2MStO?=
 =?utf-8?B?QVlYYkxZNXNialowN0RDUnhacUJWckZHeDcxb2RpTVNTRHhwaE1mY0VyWEp0?=
 =?utf-8?B?ZXRkTmUraFRMN0o1d2dLOW1OYmo2YzNjL0lnaFZndHFWcjJMVkg2Z0YrZy83?=
 =?utf-8?B?Zmk0SHl6d0FRYlhGQm5GSVhkYzlnQ01LelpVRkZvWWd6N09salE2NU16OFMw?=
 =?utf-8?B?QWFtUThnc1ZBL0sxcnprUXdCZEN6dWFSbkh4Z3YycFdEYXE1ay9nZ24rdmV3?=
 =?utf-8?B?UXJUNkNJc1I2MnN0ZTJyMzRjZ0FTTStOQUJPbVVudmZDcFJ2VzlQT3hBbUxC?=
 =?utf-8?B?M292K21kTGxGRmRqclU5THhYTFRRQ0pISncwS3dhNkFCK1E0SE15ZDI3VXE3?=
 =?utf-8?B?MmxIMmlZZm5QMmhmdDVSZU5PdXRyYkh2K0NNemxqSTVLMlVKSEw5STcyVUpI?=
 =?utf-8?B?Y1pvbC81WHFBSllZazVNRFhHcFNvR0FjNWt5enRKMWI1NFNRQTlxaEIrbCtn?=
 =?utf-8?B?Y0RXbkE4T256NWd4TTNrWVVJRUsyWGV4ZzFpSHlxSVVNaUdRSXMxYjhyMjJa?=
 =?utf-8?B?MEpDK3V2U293U0RDcmpvNHV3bUoxdlp3ZEtRZXdXeFZnbkhMRW5CdGhGME44?=
 =?utf-8?B?T09OWUsya0ZoM3BYaXRzQWFrUXN1UjFUbmovZ1BkTTJ2VlFIWFNJWG16U3lL?=
 =?utf-8?B?WXAxbFZvMEJyWGFiUVgza0cza0ZPKytsZUh2c25INWd0dndCQmNiY2N6UHZw?=
 =?utf-8?B?ekNQcGxqV1k4VjMwWDlGTzFGT3BMTE51QWhPRHdTTWs1Ujg5K08wSlJSWUsr?=
 =?utf-8?B?MTcxRkZrM3pEM0F0QTdiUTh5UXRhS0IrdWhPcjQwNUV6azJzamFoQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef62dd0e-4c01-4001-ac7e-08da17cce777
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 12:56:46.3473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygFtWHWEx+MJpJGs+PgY70pCppMvtmAKea/lL572IPJiRPJwknw0cuKq4w6xoEIcGsqvAoo8mqGTrDd0XiaGkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5327

On 01.04.2022 12:47, Jane Malalane wrote:
> Add XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC and
> XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC to report accelerated xAPIC and
> x2APIC, on x86 hardware. This is so that xAPIC and x2APIC virtualization
> can subsequently be enabled on a per-domain basis.
> No such features are currently implemented on AMD hardware.
> 
> HW assisted xAPIC virtualization will be reported if HW, at the
> minimum, supports virtualize_apic_accesses as this feature alone means
> that an access to the APIC page will cause an APIC-access VM exit. An
> APIC-access VM exit provides a VMM with information about the access
> causing the VM exit, unlike a regular EPT fault, thus simplifying some
> internal handling.
> 
> HW assisted x2APIC virtualization will be reported if HW supports
> virtualize_x2apic_mode and, at least, either apic_reg_virt or
> virtual_intr_delivery. This also means that
> sysctl follows the conditionals in vmx_vlapic_msr_changed().
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Note that this interface is intended to be compatible with AMD so that
> AVIC support can be introduced in a future patch. Unlike Intel that
> has multiple controls for APIC Virtualization, AMD has one global
> 'AVIC Enable' control bit, so fine-graining of APIC virtualization
> control cannot be done on a common interface.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor


