Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C1D41D9E6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199860.354167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvHE-0002ER-Pf; Thu, 30 Sep 2021 12:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199860.354167; Thu, 30 Sep 2021 12:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvHE-0002BW-MJ; Thu, 30 Sep 2021 12:35:04 +0000
Received: by outflank-mailman (input) for mailman id 199860;
 Thu, 30 Sep 2021 12:35:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVvHD-0002BO-IT
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:35:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2449351a-2bed-44de-bdc3-aea2482869e4;
 Thu, 30 Sep 2021 12:35:02 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-BQHqtiwQPkGOwPYhZzIz8Q-1; Thu, 30 Sep 2021 14:35:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Thu, 30 Sep
 2021 12:34:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:34:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0226.eurprd06.prod.outlook.com (2603:10a6:20b:45e::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 12:34:58 +0000
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
X-Inumbo-ID: 2449351a-2bed-44de-bdc3-aea2482869e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633005301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbKi1v7uP9b6x4lBqFwjoXN28PwSTCvFjDe33pv1YU8=;
	b=cWg/DoKMo8jMX2NCzV96eNxXPTBYNuYyo75/jRK5qa0a3nlGrin6ohDQixzyZ4pkRCSXzg
	aPyBE1qjVxWnocWu0DAUkZHpQla64MxFBp6tJFNFy2w6vXq8i9+X7CuoIRSAQ9DLPVKU0z
	kL91O/lFYjv80aW7nVPiB6/5PHLBgQY=
X-MC-Unique: BQHqtiwQPkGOwPYhZzIz8Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V34JzRotiHrrRxaj62lpYZ6LyQ3MVAns8brGxGNFisP46zu+4Bm2gQlHGLyEaNO/mYdsKcps2/uKh53FHs1miNRKwNrotDJi0GKE25MeMCdi6EdDq+7bEXzwWmfCC8Vb1kNB12Y/ENAhsgdOo9/kBGb8A3SQi6CyQmtFGR2Cj7HDwFFsBBeBXkYWlRb1DWj8KV4OEqb/WmB7cJ0Kbr7cLj9rN+GXK8hzgdFgAKWWZTooUZXfHKjsfuxcaQeeSPGwcuMI2ymxJ6ThJi+/Gzo6yBGAPiXZbvdo1QyV3qp4O/MdGt2kicoZhgFD0IKSxP0aioVPgijZXbGVHGJjKq6hDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=PbKi1v7uP9b6x4lBqFwjoXN28PwSTCvFjDe33pv1YU8=;
 b=LQaWmTodXJtHB8gox1R4O2husN39gb5WzDaABpRF4C7J/bmNGmaUtNjN3+3uYIZlrm0TEcfDGg5efuFYPH0DjLu30OXUp0HuoaKrvvEqJHui0ziurBKC5SFDY60KnXVXaBnCrRqLsSANtshNj84G6U2C1yb3EKEqQScH+xdTgNXFKrhbKHmFPVYHpJyM6BxRNuqtatM1BaxVEjPKKBCCzgnCI9D44vVMtbiSIMZzOKAdX1fhrg4Dmb2Caf7A7m/sVMaLxIofNos202jjOEFm4Vipd2BP67XaiIixaqoCxh77L9jN3GVCsU8COWchafe185LNCAzRBGzWMi2JgsCKtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 1/6] xen/x86: streamline set_pte_mfn()
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Message-ID: <b39c08e8-4a53-8bca-e6e7-3684a6cab8d0@suse.com>
Date: Thu, 30 Sep 2021 14:34:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0226.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ceb9de9-bca4-4c85-34ae-08d9840eb73c
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB63839DD3C04C7A3272F8371BB3AA9@VE1PR04MB6383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TC1mRBq40fgQodWv/jlWln35z0/4GeyyPOSAzy0hKfoTPda6IsbItMlXTXqjk/zB/Feoal2zVIeqmTdFCH/Jyff8olq8/F49T61Lj67kzXz8lTrJCffUHgnAIf0Zq8Vyy/kM8HBIFgGGySYmxbxVw+Q0IxOvGFs1GlMwkoqbeUVMIgqcXQkIwUSWWTmXkmrdBb28JuYF0nSZVt1zVbseyf753N/gdjc0kjj1dcoAe1vwTZS1Vagiyv52uN+9p/yUbuX5+AiznQ6ow7yxu52Y0uP6abHkiLK5SID5DEoYcFb2+R9X7icu86PQ6KhSRPIiG6FwNW4uGj1W61FyL5ptn/hcYCW/hC92OwxhaX0FBMyEfhvlO0c1avZA6HjTqr9BGjzaVY8ICZCB6+nWokNhH50wVIi2bY9nn8NkIDCFZR3easZXxAiDg4rWNaZG0LcHKvam5b55uuW9C8idAYt8hC7dW8mn0qCWfSiwuAt39d7XyTXZuxWAJrv//idBCe2b0mEMp4elJPtsXfWRM+6ZThKaG+EwpaZcgbYuJHBwl8rwpxeMh2E0qRtoC0vksGK4mL0msprkka+OgNt2cC6l9Ozp8XW8lJcQdtJghpA9vxrteUXg6YWbzOTgVAum6yuPQsTN/zd+PiNpH8wvUUQ247WmeGdhEiLTmNqJzLcKm+hdDH03qSG6BkR8uOUWbHS1pyE7ntpSjw3DAS6TMAvTEloO7pvc/llKV5r+nE7BO2M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(2616005)(186003)(956004)(508600001)(31686004)(66946007)(83380400001)(8936002)(86362001)(2906002)(31696002)(16576012)(316002)(38100700002)(110136005)(8676002)(36756003)(6486002)(66556008)(66476007)(54906003)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFgzaXhGQkkrZHhQa2FhN1pXc0p6Yk8yRVBhNU1MaDRyVUJUUEsyWnZIdmxF?=
 =?utf-8?B?UkxYVnNwKythcGpMRld5b205U2hjd1JHc3JPZ25rdHhMZlJyT1dEOVl6ZzBr?=
 =?utf-8?B?MGVaNFprbDMxdFhBZmFkdzdrTjg1OXVjNHBaRjhUVklCTWRaejRDUll0UUlY?=
 =?utf-8?B?a3pqa2xraDE2TFBoUnhWRUpSdnVXcUNta1dKTzRkRllqN0t5TnZGanQ3Mlk5?=
 =?utf-8?B?Z1liTmp3NDhaRnRqNGlqZ0JEOElXRHVyelhISi9VLzBqY2VPUG9KRFJPK2ta?=
 =?utf-8?B?YU9KNnF1RFVKSXFGYlpSOTh3cVd5c3V2VWFoTFRGSHM0WUdiNWN5Ykw1Y21r?=
 =?utf-8?B?b3VKTTZtQUFMUzV4MmxuYlhZYjMxL3BqUDFpQ1ZmczB5M21wQ3Z4S1FyUzRR?=
 =?utf-8?B?K1BFV3hjL2Q3TVV5WUg5S1luQW9DQ2RDa3pOZnd6eWtzeEpaOXU4OWxXKzM4?=
 =?utf-8?B?U09peHgzM3FIZTVjejFsaFV3a0lOOFM2NUowcFdjZHpNMmhHaDlYaWNSWGpx?=
 =?utf-8?B?a1owemxEdnQ3Q01ML2VHRXMzUDBKRUFEUEpLY0cxWmdwKzJUMVg4cnRrUU9C?=
 =?utf-8?B?M24ycjQ4LytZQkR5MWV2b3lENjY2VGVSd0dzcnN5clZQYVJjYzZxVXRYMlg2?=
 =?utf-8?B?T1kwRmVreDB6TkNqRGhEMUtNQ1VaYTNlNE5TcGtOVGVRMmx3c2RiYXM0K25N?=
 =?utf-8?B?aEVzeTRRbWZVbFBLZHM0RVZSWlgxZTAyaUNRdEtqS0s4OWZ0Tm1HaWpRWUxl?=
 =?utf-8?B?ZHhoWFFzYjV3aUcxNklEa3VLaXNGUkhiM3c3c3R4ZmVaaWZwMWw0WkZVLy9W?=
 =?utf-8?B?M1haUmZJYnZMTHJleVhhd1ZmNFNYYlNLcXdCVVV0QUFBZXpjbnpZcWRvMHhL?=
 =?utf-8?B?WitxVlZrM2MrZjlWTXl2MXF6c21wZnlnVE0yMmUyd3FJOWhKc2JqSjNiNXU0?=
 =?utf-8?B?ZUs0STN5YWtlamxuSUhGcit4T0U5QjN1TnhGU1dmWTRoeTV3cDZ4QlpveGtm?=
 =?utf-8?B?MEdvNlI4MnprTlcxR0JONkZMQ2NhUEhTaElIaExoVUpZVTlEL0Jyb0JOY2lH?=
 =?utf-8?B?RUJPMXl3VlpqRmJzSkpBWVh0aklNU29DUkR6UTlMaTZTZ0ltNFlVTmlyWi9y?=
 =?utf-8?B?SXA0bldKdHIwTm8rYUlZUFo5bjR2RHVBU1FVbU1KY0RNYjlyRmQwSEdYWk93?=
 =?utf-8?B?ZnF3ekVkWk1UenU4Yk1heFQzUUpZbDZQbVBLaVd6ZHViNStwWkN1K1BOWkFI?=
 =?utf-8?B?aFJ6Ri9FV0dxZEh0ejNCRFRTWklnUytQS2tpc0phYjVnWEV2SGpMMmo1TGI5?=
 =?utf-8?B?NWVuamd4ZmJLNEl3cXRmdzRrMTFlaTVvQVUxczlqWE5CTlNGUDgvNzhXRTh5?=
 =?utf-8?B?UzZ3eEhwelQ3Q3RzOUdMeno0Z00vV2c4YzN5KzlDOXlBVnFrSkVtd2hPUi9a?=
 =?utf-8?B?QlZlczBodkVocVN6NldXWE01MkhwdUZFTC81SUY0RjkrOURKUzlMNWRKTUVB?=
 =?utf-8?B?ZVRsQ0txRHgrSzkwMjBoRHlvVnVDQis5NlpSTEtodW5YTXRPeGNRMWM4Nk14?=
 =?utf-8?B?QWM3UEpYWWZ3OVFoZXRUZWxyZmVXNDE5ZGlDQTJiY1dEVm91WFFYb0V1UVFu?=
 =?utf-8?B?N29nUm44eFYyZE1PSXNYRkt2QldrWlBac2ZNSllkemwzTTdhN3Y4NW45NUZp?=
 =?utf-8?B?QXZ4N2NUNDVlVERFcy9QTWd6TkFJWmxiKzF6TmhuZmRxcVZhY1U1emFMcUhy?=
 =?utf-8?Q?KYJhkcLgwFGmV7C9CzW/n+9xxUGCX9gQ6alpI6m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ceb9de9-bca4-4c85-34ae-08d9840eb73c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:34:58.9369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTCCM6GdL4RD5oKcxgFMrJJWni9iY3k6Cc66Fcm16BqN2uOyT8Q+giH0k25AdM9GSW7VfEOWDYcRVjjYFIxMLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383

In preparation for restoring xen_set_pte_init()'s original behavior of
avoiding hypercalls, make set_pte_mfn() no longer use the standard
set_pte() code path. That one is more complicated than the alternative
of simply using an available hypercall directly. This way we can avoid
introducing a fair number (2k on my test system) of cases where the
hypervisor would trap-and-emulate page table updates.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -241,9 +241,11 @@ static void xen_set_pmd(pmd_t *ptr, pmd_
  * Associate a virtual page frame with a given physical page frame
  * and protection flags for that frame.
  */
-void set_pte_mfn(unsigned long vaddr, unsigned long mfn, pgprot_t flags)
+void __init set_pte_mfn(unsigned long vaddr, unsigned long mfn, pgprot_t flags)
 {
-	set_pte_vaddr(vaddr, mfn_pte(mfn, flags));
+	if (HYPERVISOR_update_va_mapping(vaddr, mfn_pte(mfn, flags),
+					 UVMF_INVLPG))
+		BUG();
 }
 
 static bool xen_batched_set_pte(pte_t *ptep, pte_t pteval)


