Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF3B3EFE48
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 09:53:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168126.306949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGGNg-0002N7-1p; Wed, 18 Aug 2021 07:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168126.306949; Wed, 18 Aug 2021 07:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGGNf-0002L5-Ur; Wed, 18 Aug 2021 07:52:59 +0000
Received: by outflank-mailman (input) for mailman id 168126;
 Wed, 18 Aug 2021 07:52:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGGNe-0002Kx-E8
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 07:52:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cca9c60-fff9-11eb-a53c-12813bfff9fa;
 Wed, 18 Aug 2021 07:52:57 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-w6_CqeriPYOAkl8x61cu_w-1; Wed, 18 Aug 2021 09:52:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Wed, 18 Aug
 2021 07:52:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 07:52:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0701CA0038.eurprd07.prod.outlook.com (2603:10a6:200:42::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.8 via Frontend
 Transport; Wed, 18 Aug 2021 07:52:53 +0000
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
X-Inumbo-ID: 4cca9c60-fff9-11eb-a53c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629273176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XCRmyBrdX7/L7yqddJOH3Y19YjXBN0ue5Y0rNRPoqFQ=;
	b=Ef+vJ2SICDCXlxZkDmdD0W+2Ml1T/c2ZFmLURv7O0XpC0uW1hL/qQPLlEeIUUpJ3uHK45X
	n3SDY2Xlw5FWTqKnYc0AQ2oHUX538IHHPWKb97E2UZE+M4C0XzYJsaNeaVqQw4vYqEVgiS
	m9F2fKNaBlauLGpMiOKLoFftP081+Jc=
X-MC-Unique: w6_CqeriPYOAkl8x61cu_w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNGdzk6JItRR7j5v2qs3//QnQM/x6soZxWDj/nze+0IZfRVqSPrzwILMFz08+cG0wnVOfOYgi/o/oQzOyHsElPXnhFzgx7MpqTgrkVCYcGxfzf7GlSQM13/LsCtQaZrOWgQoAMDC3hLcivHMYW3BOcRg7EpmM06gsYOG8FSfltOhXQJ4RQnqIWdrVPKEMMW0du+gNKXms1FiFfSUZbF7jenbS2qvXjZ4X0FsJjxdKgPSYkGqRcr55VI1lrTIcOWZUJVy+U+6xAwf/UjsLHro98HM9HkCVBGz07mXQqpWhhYgZzFCHrjMA36rM4hb/MGS/m3pk/k9gK+790jDAMjaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCRmyBrdX7/L7yqddJOH3Y19YjXBN0ue5Y0rNRPoqFQ=;
 b=DsS7beM1/PCJuoZbopEkcQWducrCKbR3RYmtP19id8CXocGocP023zHHt1IWUrOneLibMJCmpIjFnlxZq24Hc6zeoTD7nsYXbs1bnAPTidpMRymZwy6uZEyJor2ayoIdCdpQbXQWFso5VCeBgvVQIxEqbaFW7+TwvMu3tctKJtUTeBcnxYYxFcqeqTO8ulBtG8GyW5QM6yC0rFqy8WPnaZEgoHpoO0UeMeGlaqda3cWu/NJGSh1jDK7lJ/MZOV+cWccICbcyjuJlkTL0dYyBwqxuM+oIq5vl6wjFCvwI44B7ovywsNYjobgaeHiF6m9LjSze+Cfjs7Qm2ejc1jv2Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: relax iomem_access_permitted() check
Message-ID: <a26e91df-7c49-5903-6228-821d92c4902c@suse.com>
Date: Wed, 18 Aug 2021 09:52:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0701CA0038.eurprd07.prod.outlook.com
 (2603:10a6:200:42::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ed008e5-ac01-4f80-eb27-08d9621d2f7f
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3118325E9A5A5156FDD83E5BB3FF9@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kcOlTRcj0wA86IhZf9nq8sfNE3Z4mdOVuGHuNSNSxhy/AeFyAe1zSNkr5xTpWDiYlScKj9P6h0aDD6ODiCSj9khioY0u+OGTbshSYBV8G+jmB1I7lv78XUcQddGqYfkxvvyGlz//QbDAiz2ieQNJcq4rxs4L2vUpC9np5D1MXlMvQfvg2I5iUP8w2gpGTksneH8GYnP3ve6Qb+EsryxNJqDVDOO2/u7IwQ04tr6KNjjgElatEI9exhSz9U3o0rZPzKP4i7Ce22NKWMaxTjoDe5mZqjzN00dLvs6uT3RZ3TzzdWoObWWeJBG7k4cyphnQRvvvV5UYEpAUCOAs9KX9jrywOFLc4EP6FvBaUhFXk+EQP8hM8KRmku/Y4pNjVG676a3QYPn0fhszaL9+TQX7ZNdOSS7m1Lcms8EoySumXmDMSvGkbrXk18XwbnXbd/rcLVkNfUnQ49EO6Xd80zPHBaJOxvRZbe+e2OhPVibyfsKss3o19SkP5DbR086E01+DDkNtYwoSY4BWYyvetAS4Cislo39V6vMW8ZuCWjivmN4Of5K21PhH93/z4CNPua79cPHX2JT5+BIyB1Lys+rE+KxBcfWpf9RU+1Rp6H3BxT6m5md0onxPpcCRjxD8VLxUi4px0DxgTjYRQznnd8E+Hu0LQZvWTnylHtksVXkrKHi1fquchmwXokVoQF3YxJTQV885RB7+uR3Px50zEAqlstFxwcFo4cD2mrvhzsCY4NU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(346002)(39860400002)(366004)(396003)(31686004)(31696002)(54906003)(316002)(16576012)(66946007)(36756003)(2906002)(4744005)(66476007)(66556008)(4326008)(83380400001)(478600001)(6486002)(26005)(186003)(2616005)(956004)(86362001)(5660300002)(38100700002)(8676002)(8936002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE9BUlBUd1NsdE9uMVlNUm10QyswOURjcEo5ZmxGYmYvTkRSQVNhZHZwdGp4?=
 =?utf-8?B?c056eWcrVWYyeUF0ZUpmQWE1R0E1ZjRYUjg0Ymw4aTBKSVg2RVgwZVArdUxS?=
 =?utf-8?B?eW14SURTNHVuNENjelZjbEJSeXk3YWVYais5V2tCU0dlSEk0MFp0SWVMQ2lp?=
 =?utf-8?B?bXBTZXFxQnJ5TWdhdDI4eGh4S0x6Qjg3ODhXUjFtdmlNS0M4Z3ZPRk9FMTM2?=
 =?utf-8?B?QmV1dUlkZGF5UnBHbDlKRDVmRXhUUUFnYS9OT3hlRzdEd3dIZ1lmQjF5eXVq?=
 =?utf-8?B?N2M0WGRlVHFlY0F6VFkrQlhKVW5xMDBmd0hlR0k0VXdxZTRoY3N2YnI5cTlu?=
 =?utf-8?B?M1lnUGRjUmV4VFpEQm5VMkxaMm1RQ3lwMmduL2UwdnhjN1N0bmRKa2xrdlYz?=
 =?utf-8?B?b2NkMjI0blRqcWtXdmFjWS9xRjlxR0I0Y3Q5aDVqZ09CRW5wTG55bEU4REhG?=
 =?utf-8?B?ZUt6N1NLb2lJZ0FIbHNaYk1xbHY2bTJOSDA3bitGR0lyMDQ2Vkw1S3F3ZWtk?=
 =?utf-8?B?YXp0UGZoMDIrdUkyaFZpaEZ5Y3lvUkZNLy9YWjQxMGEzbnloL2UzdjBrR1lE?=
 =?utf-8?B?dnBOZzZGOTc5YVlMdlpoODhMTjFKS1VwSnpMTldMcmFNMTFQL1JobXJaRXZH?=
 =?utf-8?B?VDYvQUQ0OGR1N2JHVUdrbkdtYTJKMFg4S0xuVlRUWXM4UGdxR1lkbTNmL1Fr?=
 =?utf-8?B?TXp2YUYxbVhlVUZrNVZodVhvWjk3SjlidG5MTkM5ZjF4aW4wcEcwOU56K25H?=
 =?utf-8?B?cHVPRHl1RXNNNGdhU1VpdDFIOFNvU1B5c3h0WnlJMVdoUFFBa1NPTWREZVRh?=
 =?utf-8?B?S09xaVJQRDllVllpSnZtdnVDM3gzdGhiVHRXYm9wbjVnckw4SDlWVEpDMUpB?=
 =?utf-8?B?V1dtSU9CNFdMb1k0Z3ZWZjBRR0JTZzhodEp1NFhSSjJHOVdNUEFDazV5dFIx?=
 =?utf-8?B?eHZlM1NEL1FUM1pPQWtuaU1SNGRldkJYdE0vRzFLWU80SUxYTGNSV1RxZjJU?=
 =?utf-8?B?TzVqMGdGWGxrWWVaK0RYcVJOOGxzcVY2TWxmV0ZBMVBCcDlLaVRmRG9FOUQ2?=
 =?utf-8?B?NlVhMVkyYmlvVkZOWWdhNk1USHB1bG5ONDJ1a3ByRzN5UUM4UEI4cS8wTmpp?=
 =?utf-8?B?NllWT25xMUdidzMyNG93Z1FJNStkQ2E1RW5zZVRWQ05CUHJzVVlDVHBvWDJi?=
 =?utf-8?B?aWVnTnM0UG45N3hYQjBLWnJXQW9YQk1oakQxRTVjUFloSTQycERSa3dYenZF?=
 =?utf-8?B?Vi8xUWxxZENabGkzWXhOaUNENktPejA0cU9oN0Q5VDNJbTdPMWx0T0N5WERv?=
 =?utf-8?B?d1BBeGt0WFFJaGFNQ3BSbVFmcDlNVTlLcU0vdUhZaXNVMUFxVzU0U1FTNTNm?=
 =?utf-8?B?ak1EMmZsT2M5NzQ1WFYwMjcwZHRPWlpxRTlibXVkZThoVjBMT1NHNzE5YWJR?=
 =?utf-8?B?NlNibXkrOUx4MjA2NmMxcjJ5ZHdDUHBRVGdGdWloVDc3YTZmbTZaTnpCVUM5?=
 =?utf-8?B?MXcyYjJOVW5yZjhnUEVPYVBBKzFyeGZxUGduUUpreGNtaTNncWVMdVY4MXY4?=
 =?utf-8?B?alJ5elM1bWVISTVUZ1pIcGYvWEhESXNXOGlWVFVhSTJMMi9TaXY0VHozVEpD?=
 =?utf-8?B?NnhPZ1Bab2NZaWZnbXo2M2F2SHQ4ZzAxSnRCc3pWdXlSUE5FM0NJNnUrT0M5?=
 =?utf-8?B?WWtYVnlqcEE4d0lvSlYrcFJ1U1pmd3d6MHdWTGpQdnNVYWFpTFhZZi9sc1pk?=
 =?utf-8?Q?RFUq1Bl+lOJn5YNumSwQRI4fHv7iEIg6PZGz1Lp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed008e5-ac01-4f80-eb27-08d9621d2f7f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 07:52:54.0981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6XP7Mlr5nQ3Vknp79Iezsi0KNVr1SzclRaLFLZD+CJGUk07XcbfeOFc7c6GWYnZx9uR7nouFLIBuxw4G+CIBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

Ranges checked by iomem_access_permitted() are inclusive; to permit a
mapping there's no need for access to also have been granted for the
subsequent page.

Fixes: 80f9c3167084 ("xen/arm: acpi: Map MMIO on fault in stage-2 page table for the hardware domain")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1893,7 +1893,7 @@ static bool try_map_mmio(gfn_t gfn)
         return false;
 
     /* The hardware domain can only map permitted MMIO regions */
-    if ( !iomem_access_permitted(d, mfn_x(mfn), mfn_x(mfn) + 1) )
+    if ( !iomem_access_permitted(d, mfn_x(mfn), mfn_x(mfn)) )
         return false;
 
     return !map_regions_p2mt(d, gfn, 1, mfn, p2m_mmio_direct_c);


