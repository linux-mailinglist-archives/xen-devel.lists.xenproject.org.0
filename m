Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106341D9F6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199896.354222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvJa-0005S5-EM; Thu, 30 Sep 2021 12:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199896.354222; Thu, 30 Sep 2021 12:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvJa-0005Px-Am; Thu, 30 Sep 2021 12:37:30 +0000
Received: by outflank-mailman (input) for mailman id 199896;
 Thu, 30 Sep 2021 12:37:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVvJY-0005OJ-JQ
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:37:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1aa5581e-a0bd-4b30-9dfa-2e87ad04a3e8;
 Thu, 30 Sep 2021 12:37:27 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-xfIf_bZcPQyeHCkSQiq7nA-2; Thu, 30 Sep 2021 14:37:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Thu, 30 Sep
 2021 12:37:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:37:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0044.eurprd04.prod.outlook.com (2603:10a6:20b:312::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend
 Transport; Thu, 30 Sep 2021 12:37:21 +0000
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
X-Inumbo-ID: 1aa5581e-a0bd-4b30-9dfa-2e87ad04a3e8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633005446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kPPXxxwugPBH+beN9q4uizgqAq1OKQYB05wUlCmlLlM=;
	b=KE1jczkPjRiGYi1Af8INeMw6vNy/tRNOAmuF7RjGtwuJStzm7pFbWblctRGKbNnzGbFmHm
	6+5D/2lvjvsACUAoH5cR/ca3Ns670cFhFGo4MwCdyQg3lwSzraeqD7E4FtoIF6KQfG9DVK
	Lr9SWQhCsvs89C7bOEGCZex+b84Hbpo=
X-MC-Unique: xfIf_bZcPQyeHCkSQiq7nA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XilTaAxqeBZWIJGbAE5s+aGyJxwBTKSk8JJIcQrGqZ56NngxDJh9hPmPvxM+fRJQTOOB8UH7l9TvHBP2yjvJNk2u7t5ZIXVOBZZ2pgHd2OUxBbsavaHT65oINnSGheq2AgnETqceJNhs8rRDrLvf2Mwn2fwG+z8yPgwpQ0X5wvFKQ6800h8iOyqyeGAtYYPQKIKTfP8YRaq8U+JObZf6Zc87ncHz9vA/3KQPwS8BTst102uFq1izpVMFUAglboi19KA1Le00aggzRFcl4Kz2GhsUCqQ3RoeahTcOaD0p8VzszyCWvwdBYEYwT25OcSHBfoi6/AJnFOskedlbBRqHgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=kPPXxxwugPBH+beN9q4uizgqAq1OKQYB05wUlCmlLlM=;
 b=L81yw8xq8kuaHu8deo1awIB9H4n/kFDii481Ozwug91sYMLO9KNforOxYqXeAE6KaYblcI6PkfRJkyuE0vNEbiKRemO9hHxneo51pjXTovhT0QgvlLRa3LoeEqVFyMTvLE8U0LwTwlzxbPVDsGpGfmycn48kUh1rwFCe/NG8SAZlhUocJtmcsqlJTfcuS8WQspEXM4XC2lZUIo8u27f6nEkyXYGPJwmU+p6/kqDEjKwZ0r8Z3BoblFLH0U9wXHh3Z7VCfMDJLFVg/+82qREaMopTNDrv7a8rQ3galWv6Dx1Fo5LuWX3RDraRs+KnxISelYZ3+zZEFD06EkxqCJ6VYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 6/6] xen/x86: restrict PV Dom0 identity mapping
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Message-ID: <038b8c02-3621-d66a-63ae-982ccf67ae88@suse.com>
Date: Thu, 30 Sep 2021 14:37:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0044.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cfb7984-2657-4317-0ae4-08d9840f0c60
X-MS-TrafficTypeDiagnostic: VI1PR04MB5600:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB56009F302F81D72F5CA19C83B3AA9@VI1PR04MB5600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XvmdscEd9rEdQFfFcHzHE1yUzmCA78KefJFiaS7tFz7cTJRHRuJb5OVAubYJ/hJnDKcaueTs421LujF3q2Gq74K6EKMuda/8MmLMK15SeKvZ3iB+HEliVw3Vpkat8CpnlVaIWdyk8tBxSJs7E94elR/+7cS7aRfU3aJYV+fLwULbQSA471/n+h7e1H/Fq0AWl0TE/sVeGnAznw1QpzpaNU52beKmxKjL8DyTUSFpGt3U6ZaZ++2osWQekH0GlOyQ3VoPJXLiVnEPM+5E1k9uet3VlQdAY6j8zFRIM6B3FfkD+ojsMqME2UNz7+tFnjAQwfc/2BQafiOv6ElT7GUygYdOry4RH4o61ClJMhKGmCSsJI3mpsT+VMaYgxNOZvx1OwvTfH3K1CjFez0uYtKGWZQPegnhcRIB+co5wZB8Oac16+v19khbEap0d/Qi3CFgMLDotqVe5PRInBTTm2a0LxGvsgD84nD/a9igeJ9A7hjSiIPJ4+SUo4Uo1NMb/OLRohHufORSrIfFmfoPsCvx/DcEo8LAS9YbCSZX/nlBrkKnCONLsaGbmdnOWRGko1e7bfaBV/9UnPr+wsNs0Q/EPvzTFdbOtXAKIdfm4yH99c9aNpR7+25fXkiX2/JpwT2h2Pxjd5u92hxxQdMwtWRagqyiWt/0jC/YuBrtHUF89CQ5h+6NWmJ69+0oQYKrKgdDib07cB7P5+rAvc2CtRDwAyNDVfI2ThBQT8SVCYhhjaXbMBDOlMJ912X64JEspchd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(2906002)(316002)(5660300002)(83380400001)(38100700002)(66556008)(66476007)(66946007)(16576012)(110136005)(54906003)(8676002)(31696002)(8936002)(31686004)(4744005)(186003)(6486002)(956004)(4326008)(2616005)(36756003)(86362001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2p2R1N1S3czTkRsYXdxQ2MwZjdXdlAzVlYrVkRFWmNXVzhveTlQWlo4cWpE?=
 =?utf-8?B?dE1tNmNZUEcrU244WGl0c2Q5eWhhMXQ2WHQ5ck9qVDlEb1VCZnNaS0RCT0Vt?=
 =?utf-8?B?K2dXWWtLMm1DYWF4cjd4NDA1MEEvWXlnaU9jY0NkME9iTzFVbk01c2o0b2lW?=
 =?utf-8?B?MlJrK3R5d2Z0Y0kvTW1yck1PWHhEM3lIeUVmdVFscjZnZXFPMHJUcVFDV3kw?=
 =?utf-8?B?cjM4K0V5dEQrajhZT2dWMzhPdWNUWVZsUU9OSTlQTzNNL2tENlhMcld3NWRF?=
 =?utf-8?B?VWRaVCtKdnBrdmo3NkE3SWRQeUhURy9tV0YwcjlLYmdxZkVGTm9hTGdCdkFn?=
 =?utf-8?B?WUwwQmFpZDE3RUlDck8rdW53QWRERzJuRm51YVI3QTk0WlNGTWZWMFE3VXJY?=
 =?utf-8?B?aWRTdnBwWE9oZFhvLy9aMitGRUxUZENJcVhSRnhscC9pZUM5aVRZdlRyaWZU?=
 =?utf-8?B?cnYyUFVCS2NIcmxnNm05L2diNUVhaTN4NnFUeng4OWlpSGpjem9hcjI0MXhL?=
 =?utf-8?B?ZHp3MWRMQXc2QmhwK21XUVBHTHAxS2dwZ2Znc1pEbWY5eHdkYm9icmJFa09I?=
 =?utf-8?B?aU01ZGF0Qm13K3VsQnJYUHlQRSt5bENUeDRHcGFyNDg3WEZvd0M2V05oTk1W?=
 =?utf-8?B?STd3T1c1ZkcvSjdrSmJxRjFkNVBqZm5vdjVvWTFWRlRpNXpaakJ4NnlJTFdJ?=
 =?utf-8?B?dTlsMjV1N1JTQ01NWllUZW0wbUJZZ3NucnBzYno4a2dpT2JneVRFTURaQnZm?=
 =?utf-8?B?Ym9pbXdwUURvL0VvcEkxNEVIRHJDQWRIbmIzbXZseDNIZURDZ1FtaTNDUUh6?=
 =?utf-8?B?RjlGUGJKK1RYLzZGN29TYSs2eUg3dHhYNkJwR2pPeTZjRDhNM0Jsc2FFUTVt?=
 =?utf-8?B?Um9kRUxGU0E5c0QrRDBadis0VkVoa1Vqc3VzK0plMFE1R2UzNGJxZlZWZjd6?=
 =?utf-8?B?UWVrTVY1SS9nQmtTYkF6N1hFUW5iSVIxK0xxWWZwYmMrbnlxNlZ6c3g4ajNm?=
 =?utf-8?B?dzJsWGlYemxKWVhTRjhnVWhqVEJ2M3B2QmJoR0toNXZxNy9mdUNZZlhmRzlG?=
 =?utf-8?B?cjB1NTFEaklGcU1rTWQrc3dod2pEanpybWVhTzI3WEZEY1phQU9vbW9vT3dL?=
 =?utf-8?B?UGhCSFNIWU1JcDRPbnhmV05OYkNRRFRjY1R1Z2xRVHFSdHBCNXM3RWRWV3pk?=
 =?utf-8?B?UXYwL2prWnJ2R2VxZ055bXp5cGxzZVlKaFFrZTZWUXpEeCsrbUxtN3NRNVN3?=
 =?utf-8?B?d1ZMbEk1NTIzL2ZFalJ4Tm5vVmZBV1RPWUlOQWR6NXlkNFg5OGFIN1FsVlE5?=
 =?utf-8?B?WklRckQvRVV4aEJXUUdjQjJhSDJlc00xVmpvUW9Ba2pwSS95dzVtL3JlNm82?=
 =?utf-8?B?S3NNL0kwVDA5azBYOXNZdlVld1RuY0dnN2I2ZDkvYmRUY01FWVN3OExYUHAr?=
 =?utf-8?B?TkJpbk1XdXZEZVVheXh6UW45VFdqQUJQT0VjczYyNlVsTmlCVmozd21FMzJB?=
 =?utf-8?B?cmtkYzBrRCttcXlOK0h4eEo0aFIzZldyajA0UWN1WkxiRXBiMkgwZXdHWG9G?=
 =?utf-8?B?RkpnZWh2QXhTdHJPRnlJbEhkM1o4ZnJKczVMYmNwd1Vldk5GYWJ3TExIZ2xh?=
 =?utf-8?B?SUx1aC94eXIvTGNlWEhlNERJeEpyYVRuN3c0eWtweU5XYjI5TW5ZL0pzemY4?=
 =?utf-8?B?WFBEYXlEZFVqRmFHclJQRndWNzBpUEU0NFM4bEpRM0xaVWVCQ3ZzMGgySXgx?=
 =?utf-8?Q?93ZKV8oWsM+vckc/XhkCzli11oCJHU6m/B8ieBu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfb7984-2657-4317-0ae4-08d9840f0c60
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:37:21.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+68ucEy+pC2zMfLvWa3YBirMpv4MDFLr5fQVKEKl3arg/Yr/kg/vljVeeZ6LHuxaQ1Uv2OjsEoU6X25wHf1UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5600

When moving away RAM pages, there having been a mapping of those is not
a proper indication that instead MMIO should be mapped there. At the
point in time this effectively covers the low megabyte only. Mapping of
that is, however, the job of init_mem_mapping(). Comparing the two one
can also spot that we've been wrongly (or at least inconsistently) using
PAGE_KERNEL_IO here.

Simply zap any such mappings instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -425,13 +425,13 @@ static unsigned long __init xen_set_iden
 	}
 
 	/*
-	 * If the PFNs are currently mapped, the VA mapping also needs
-	 * to be updated to be 1:1.
+	 * If the PFNs are currently mapped, their VA mappings need to be
+	 * zapped.
 	 */
 	for (pfn = start_pfn; pfn <= max_pfn_mapped && pfn < end_pfn; pfn++)
 		(void)HYPERVISOR_update_va_mapping(
 			(unsigned long)__va(pfn << PAGE_SHIFT),
-			mfn_pte(pfn, PAGE_KERNEL_IO), 0);
+			native_make_pte(0), 0);
 
 	return remap_pfn;
 }


