Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AFD3A42AD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 15:04:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140371.259379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrgpr-0000rd-17; Fri, 11 Jun 2021 13:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140371.259379; Fri, 11 Jun 2021 13:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrgpq-0000pm-U8; Fri, 11 Jun 2021 13:04:30 +0000
Received: by outflank-mailman (input) for mailman id 140371;
 Fri, 11 Jun 2021 13:04:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0bEB=LF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrgpp-0000pg-AK
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 13:04:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d143e79-4179-4fa9-86da-e0fecf4e644e;
 Fri, 11 Jun 2021 13:04:28 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-6ZGDkgUFPcuVh2sEyKoULA-1; Fri, 11 Jun 2021 15:04:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Fri, 11 Jun
 2021 13:04:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 13:04:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0030.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Fri, 11 Jun 2021 13:04:24 +0000
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
X-Inumbo-ID: 1d143e79-4179-4fa9-86da-e0fecf4e644e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623416667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VJz7WJrgdIu7Yqmi+3r6jyJnowYjSigtTjONlNknBI8=;
	b=gtjUX3CISnuQ2fTVG7UYOpvnxWJQcPfWmnQ/ixTrEFXG/B7kmFzy2YhhbwYwwyFeqFGz/4
	2DnScSW0iLPARVKQL0YDvHqKOjWLqMXaI8EeXCFXxduryCXaWhcvcx8GxoWTty2FagiSC3
	pKn4qk9rvrv87v3+RwCNY90LBPhNfLc=
X-MC-Unique: 6ZGDkgUFPcuVh2sEyKoULA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGg10AqhXHEfQP8m5wR+6flTYcReNqfTEbj2jNr8n75ZcFKu7iHfUewtyhzEngJIuSMjsHWxCNSsDL66LJUaQ8SwvFnUlbx6APDBS3P4UwTM0BJg1iolg/tiiCyhd//axNv3qy6B41/WPMqSBjeec9aKfZE8KT10VyBtUbmV9j9OpqePZMXX19YSOKNxiIqnRJ5pp62b8+zuk44dup5Rdu4DC9C2bZqFPX/8/IeQ+QYYBKD8AP/NDzM1XdaPSAv8FM2dfziNXFdk/mAk3qHl5GQEqTCsHBu0JY/Dy84fF0OBcbhSp+mmKl/xyPhrMKQnfLHonDFTvhd8qP1Cp/bF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJz7WJrgdIu7Yqmi+3r6jyJnowYjSigtTjONlNknBI8=;
 b=EgztL39ul5Gz9vMdI1kEQ8pynhDab82CRX6kNCEXVb57YkI2RjrAGsDm20YzNg7879jQfi5YZ0IU/SfwLgfTQ+RxkgXQ4vP4qdF1eCkicnMlj3viecYMcnDG3iyz56bVBvI8OYsJn0Y0AQIrEYL/Nxk/YanfVOwf/U+rNQlGh5OshY6lYzxmSrzpmXKpe9gQORZcGDav22aC2Xr98rY+2HiMslx97yfXdj19PXf7ps4QnfDJReEdI548cYXpOr4p/BGIsrJYj/aWzA2ShWvlTlmXMDFK5BkC3ujEfzzd4j47faShYe8fijisCo4hEe35KjW4KJWkdxc2FFtpk6B7+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] Arm32: MSR to SPSR needs qualification
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Message-ID: <2d0ac238-bf23-51ed-9ccf-6fd65fc6eec4@suse.com>
Date: Fri, 11 Jun 2021 15:04:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR1P264CA0030.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23b1ad84-5d1b-43b0-03ad-08d92cd97026
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7149626613848D9942A2883CB3349@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1q/TJE+uZKjo/oGWygKuGIjHPS2SBMKx6CI7IP+heHaiSj8BozcLBbi6zUkz2V9EYW4JVHXEz//mjulEK4TPjhgEY9R7fHrI2oN3LKaJfoZ2v6DNdtwhw4GsZeT7AvVkHjdohWHy75rTrwmo6Ic7KIdiGnUEDI1P4Eq2c0Nc0orxNRreJ8Uk9AWrCsqLKwQXCXEuknVy9kECl/2nT12f1PCV1HATwKp5V0EUHEoRwUXz/N/WVWOgYqfn8wUOMzGOgYE2ULOvCrthmmjd8XNe6K+H5PWs7jG6DoRkSjEk5sfYFWtkNX1438EyN+FlPS845HsbAft6pZyxwtCPKh9WVfvTCJP3mNIRJD5bEaY8hobxiiWGzgmNolXGWR5/w/1VzvmLbrO1OLfRwIpoAPPs+Ti2SU8RYUaSZGvGUxW9vYrk3oFVOJGMDOL4a2lxWUINaLDYkNa5xiNigcCqykuDfx1byPBh4BgUltguNDWwgKpYElRcAfBoC+P78Qfst7vsOcOJ8meaN1JotHd4ikz4IybDNAvklZrdtB6KV/PqGCOYjOf+sfxAYaMbSxsm6wOgYpfqvYXM0Ws+EemGjwE2oJ8wGo0pXCqVlWApla5kbmOkfHYYKq/kHf/Sb3DgybEYs4HEFESV/49K8TvR09Dse9bA52505bLC4We1bCuxt7WhzuwFLhCDjIV1R++M6Bkl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39860400002)(396003)(376002)(136003)(16576012)(4326008)(66476007)(478600001)(6486002)(54906003)(8936002)(316002)(66556008)(2906002)(31696002)(66946007)(5660300002)(31686004)(26005)(8676002)(16526019)(6916009)(186003)(2616005)(956004)(86362001)(4744005)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGx4ZVpldVpVT01oVTJoNnkwSzl3aFJqcnhiQTFnRU5uWmd5bVd3Qm8rVEY3?=
 =?utf-8?B?QTAzQlFsa3hYaEMyVkkxTHZmTkJFYUdDVFU1dzBOMEFTelROZjI4bFFVaWpF?=
 =?utf-8?B?ajNCT0hxZkl1L3BHYStZd0NUanFEWnBxV0huYkRpKzU4MXhZTGVRTVFRdmg5?=
 =?utf-8?B?b1RSUFpqMzQrbEdvSEtWcUFLUFYyTTJISEVnRTI1VWk1b2VFc0VjNVNNZnZr?=
 =?utf-8?B?NGdQNXAzeGo0VUUxdTZ6TTlWaXlaVWFlWUJBN1hxUEhXVVFraEVCS0tIYytr?=
 =?utf-8?B?SDFVRWZ3cTFLZWtONEtsRHpMdXV6cnFMNGI1UEI5ZkpaZWx2bTU0bHlDQ3NC?=
 =?utf-8?B?blJ6UDZMaGwyNDdkSlVZRUZyUGpsMkRXWFVsY2dsc1JlNkJBQUdsY3hiZFpm?=
 =?utf-8?B?cGpDbXJlb3M0Mnl4ZjBDZEgyVSswd0VlUEVKdWtUWEM1cmJaYWlKNFVjc0tY?=
 =?utf-8?B?U1psN2w1NDJKMjdPeUpsMko4d2JDZ2JjazRwVTA0RmJEK0lLWDh6NjB6NkhL?=
 =?utf-8?B?ck1NWFJwNjJFTHI1MVV2VTFHS21jVENxT2NYc0pGbTZzaGQ3MVRUcDFuQUU2?=
 =?utf-8?B?bHhKNGxFc3k1SGcxZldDNVd1bkV4WWhab09KT2hrUEFhL2Y2T2xLYjllbnVt?=
 =?utf-8?B?OU55aExCclVJeitlcnE4bHNhYktjVk0yaUQ4OEhhR1J2aUdXU3BXaFBZdkpK?=
 =?utf-8?B?am5pckpKOWQ5dSsvQnNBY0pIeVErQ0lodmtUZ0J2K1NsaUIyQWlvZGVQUXZs?=
 =?utf-8?B?M3haczFUNkVCaXY3VHZOc0xrZHpPRTd3TW1xM0dEQjA0UWtLbmJGQmpzWGU4?=
 =?utf-8?B?U1FRZFRZcTRiWkdMaXRWK0RVMmM0anBvbWVsLy81WFM2S2dCcjQ5M1pqbThU?=
 =?utf-8?B?dDJaaC9CNEpQQUswWGZ6WGcvK050WWhHalNlRHYyRC8ybG14QSs0TVRmRDFC?=
 =?utf-8?B?cGx3aU0yTXk2UG10eWZFa29BRHkrWHp5TU9sQndoWjVCck1hMHpEYWdyRndu?=
 =?utf-8?B?SWdVVHY5UjYyZTdHdjdWdnpDNGdPeDZ6ME0vTklOSXhYdFI0S0h1WDBLR3hD?=
 =?utf-8?B?eWpVcm5aalZRZnBvR25GUWVGS0RqeGtyWUxGYTNSMzFsbUhqK3FETWhzLzhZ?=
 =?utf-8?B?VktnVFBXbWVkUDVzRTBCY3FnVkEzWnFTS3VqTm91OEoxOUFOSFlOeHRJbDRB?=
 =?utf-8?B?eDJuK2xTYktvVnZPRnNFYlkwUk9mR0FSYmRTM254b0FoT1grd1hUUkJZcjBM?=
 =?utf-8?B?bkFDZGIwMzJOaXpTZ0grRFlqUXdCS3l4Zzl4WHcyS1RVeDZoZHY3bTcyM08v?=
 =?utf-8?B?aTVNazk0WWRYNzlIMWxoaU9mckZkSFZKdDdKZlZNSmRUK1pMVmU4ZXBIdGZq?=
 =?utf-8?B?OFptZ3N5SzlIeVprZlk1RFA4dEREeDhROURrSkY0dForN2xWL3EvY3VOWlcw?=
 =?utf-8?B?cHF5MFJnSE1yWUJvaURKTkJZR25lZ0VuQkNDTm13bnZhN1NkL0JIaEg5aS9n?=
 =?utf-8?B?WERoQWVXbDFRWjBDeUVYR2FFeld4a0l0TnVoM2dpWkdZaW5YZEFUdU9PcE5H?=
 =?utf-8?B?czhLckhJem15Uy9KMVJ2cWxieEpWVXlQT0dHOHVCQWk3NDM2VVlsOGZXckl5?=
 =?utf-8?B?UDkwUXJpTndCRkZsSWp5UUw0WG5HSlR2Z1ZyUTRXdGkxQk9OVDhMajdiWnh6?=
 =?utf-8?B?b1diOFJyOU5jSDJBOUVEUVkyeXBpZUdMY080dXBlRkFUU3AvZERmNDBNUlF5?=
 =?utf-8?Q?vPq3IXeMX1gBMoS55urYkTinUdVqdvV2d5dhkCa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b1ad84-5d1b-43b0-03ad-08d92cd97026
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 13:04:25.1570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPR8fvUfmOVHwW6DbMGBAfY7VTAzernjFunAgKVhGgvI8BJrDE+zR2ve1QdxWSg0PzS3Ch/ENFbiuyoRRQP4nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

The Arm ARM's description of MSR (ARM DDI 0406C.d section B9.3.12)
doesn't even allow for plain "SPSR" here, and while gas accepts this, it
takes it to mean SPSR_cf. Yet surely all of SPSR wants updating on this
path, not just the lowest and highest 8 bits.

Fixes: dfcffb128be4 ("xen/arm32: SPSR_hyp/SPSR")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Add doc ref.

--- a/xen/arch/arm/arm32/entry.S
+++ b/xen/arch/arm/arm32/entry.S
@@ -395,7 +395,7 @@ return_to_hypervisor:
         ldr r11, [sp, #UREGS_pc]
         msr ELR_hyp, r11
         ldr r11, [sp, #UREGS_cpsr]
-        msr SPSR, r11
+        msr SPSR_cxsf, r11
 #ifdef CONFIG_ARM32_HARDEN_BRANCH_PREDICTOR
         /*
          * Hardening branch predictor may require to setup a different


