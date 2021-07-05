Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD203BC152
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:04:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150421.278118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R4q-0000kz-0w; Mon, 05 Jul 2021 16:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150421.278118; Mon, 05 Jul 2021 16:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R4p-0000j0-TC; Mon, 05 Jul 2021 16:04:07 +0000
Received: by outflank-mailman (input) for mailman id 150421;
 Mon, 05 Jul 2021 16:04:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0R4o-0000iu-LU
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:04:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e9c086a-ddaa-11eb-844d-12813bfff9fa;
 Mon, 05 Jul 2021 16:04:04 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-T5HHFSckM6eaWkUkXFMvtw-1;
 Mon, 05 Jul 2021 18:04:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4941.eurprd04.prod.outlook.com (2603:10a6:803:5a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Mon, 5 Jul
 2021 16:04:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:04:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.7 via Frontend Transport; Mon, 5 Jul 2021 16:04:00 +0000
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
X-Inumbo-ID: 9e9c086a-ddaa-11eb-844d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M3Ld5qWJYrn3TBkJ6YztOyq6WZrcRebFYQO4d/wCnrg=;
	b=HUApSqK4NMDwlmCZeVscT1Ai9LKJVlllCLKnAiJB6pX0VEK1FAkRqKXGblIel7EKRu0nek
	1a/2xpFRnbHfyiKuoy6p69SrE877o7AHnkcn1Y2pezjVoz8dkOBmhuHsuyEryo/rwAmwWz
	Bo73bV+sgGu2JIB00KoccEdFSpF2qt0=
X-MC-Unique: T5HHFSckM6eaWkUkXFMvtw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=medWGvEGuXDEwZ/ko0sb8NqLayJ1NLtVjoIyexdXPKcVZBoiTMJX+KDRrnUb9C4+7KiVz/IYEhwNOAloSrJFAJIEYU3hdtZ9+8ZBKPpS0hrmYMP4l5oezwO2j2lyJvBPyNin3E1BvMBefBRjlC8H5/byKk55RRviUm4Lr8TXW1/PaLXv92HjF/58X4yy6XmlG3AN/85bxX/+oV2gsHveVB/8bq8ZT1hapOJ4HxBO9M3LMXYvY8r25pE2Wg+Hrsv2YHtBs/3ACMP/d63rMqGjLhq7Bb+Eg0mKEPZxKS8oohmumqpqPGhbU6dLT/EUgT47coQJLlGSb64TlIkMohKtMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3Ld5qWJYrn3TBkJ6YztOyq6WZrcRebFYQO4d/wCnrg=;
 b=eouPJaA9JOTfzHT/+Zbky8jqEFMRH59qoBsQ4CZk6IMumNM0OtRqBJ9mxwJ7lVll9m9dbmrAtmu5YvvFXHRF/cifmJ+XN0vBsWGxuSgpsak3NDlYEpfCLoWEppKKG+wB9j2bJliWAxU8tu07hO/92v4KWA9D7y5Y/oLjTvniE731BvqGejuVvbLrzpaZvFZC7P3Anc/vDKqf9ZnJxlImij7fZhwIN6L1qkRot8ythHNatLBbZA48yE3z9bJ/0d6N7OsPcRiQc5usyv9J7y8d8zRbDtt1Zucrp2MNnW5Ht/BQEpxMEYPAHZpbDMjByO2My/1qyjanoo5nhhDjwGTDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/16] x86/mm: large parts of P2M code and struct p2m_domain
 are HVM-only
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Date: Mon, 5 Jul 2021 18:03:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28d3e679-1d67-465e-7495-08d93fce8102
X-MS-TrafficTypeDiagnostic: VI1PR04MB4941:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB494143290B87F338AF3C3706B31C9@VI1PR04MB4941.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0fsdkfOVpFlGrtjq+C0fo3NPMhqlNmQrD+60+yQ8gIjDOWtbFTAz1apoWvXgC+MYwaqMQ56mYGZCC49Rwxo7C0719qM7wR3IheCZJrOALkJX9OTDRv7lTTMBubvliZKhpW5qmojiriV4K4Jns4M7fF4d+UPUfb/IHqtlTW8+xRk6q3LnSMeOfIwOHbJDIkdyq6xCvvPsQvp56vbp8ZwMsiL+qoHLsakncPMYOlNI3agWIYvWtXUzjHzqLTcjw3+HudccXoibKOM/BXFeSOFPeLupjb/1nmQKegYWFze4/VAIS9LtsRX28vo1Hc3AxU7O0WrRmhXia16p0Ak+vdU0+szxUgXddI+YzPCzsFNfmDgFKzbBmLWwJp06xNeuhoxGEgs/2k+Jo/8D54sKeBrS+thMxo9HMJkyLuzC9UcrIldDw5cX5kLh72/EPqjd1aCB7TIGImy4MqYxgv5q24S4hAJoW298XV9GqHmOQiRYDqaPqtK8fySB66pZw+bW6hKbi2PcElKYcYbFQ1hs4B3ivhCU8OBM5yIaGNjNBeuPisrVllVW7KUJt9t+j54GW/UWS2KamKuzhFK0M+w6h3UbjF9evRTFGIK5qvaADRWBhICp0XWtA5Pc7OZkbaWoPPLAdVyo1wA7MPT1FpuRivOguivKZ67+C6wCg5WCBjNPUMkUrOCvHifAJgnO+Oc11pyLWaXxtjvEh7ENalKYC6aGq4kgZnjvJK4WnmusJ903mNY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(346002)(376002)(366004)(39860400002)(8676002)(6916009)(86362001)(38100700002)(5660300002)(83380400001)(66556008)(66946007)(31696002)(8936002)(66476007)(4326008)(478600001)(6486002)(16576012)(16526019)(2906002)(31686004)(36756003)(54906003)(2616005)(186003)(26005)(956004)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkhWWlVpajB1UGlCOHhlM3RLTXhJcUlzSHhNc3lUR29IeVhFQWkxNktTd0pB?=
 =?utf-8?B?dlpQRUJsV1UyUC9qbGlneXJSQmVJMEZDem11WmZhV2ZhU2VaY050YnZHSjlo?=
 =?utf-8?B?VUpaUTNGU2R2R0pUQnBmanV5NzZaR0pJRGpwQkRpU09oUWZ3K1Y4QnQ1dGQr?=
 =?utf-8?B?c2hPSlR4RHBOQWYwV1lOVG1GVkNTMXVzMVVobTY0Yk9mamV2UW9BSFMvZnpi?=
 =?utf-8?B?Q1J3V2dpeHFJUkIvbUhsM29uVmd2OXlsMTFFVUloaG1KbG41dCttVHRSQ29D?=
 =?utf-8?B?RFdRKzFjK0kzK010TlhIT21IT0NEY3BMREpuM1JFczhYeVpaOHg4ajdQVno5?=
 =?utf-8?B?MEVLaFFYc1RvS01wclBCczVYamFyUURrMXIyWXJDWlRmVTdoVnBmakhtYVpl?=
 =?utf-8?B?RE81YUtLTXdncjFoeWtlNG5nenB1TmxXVGhQTkFvTUNFdUdlYXlkV3dmWDRQ?=
 =?utf-8?B?emRSTE10aWZzNC9UelplZkFEbzFyMFFoM2V2K2EwRjFPYTZsVyttODZBRVdN?=
 =?utf-8?B?WFM5Mzhpb1d4N0NObXByc2U4YWtHMWE5eUdQVDR1TzQ4RFU2dmN0SUpKUnBq?=
 =?utf-8?B?Z1FnbDJOMUdqV1lnRndCQWt0SGVjaW5XNDdDR1lDL3dwb1RoZC8rMWd3LzRj?=
 =?utf-8?B?eHdIWFc5dzV4VC9oV2pwSnd3cWVuUk95dFFRQjdaSjFsd0dqaFJjSGorRmd6?=
 =?utf-8?B?UHd3b24wL0VnTitDTzdzQ0hBckdEQnVmWWxPRUthbWZTZ1lEdldNV0QvWkYr?=
 =?utf-8?B?aHd4alBReWRUckQwd3NRL3VaY0FQZkJva0cyQkoxKzQzbWErbWxucmxoS0xU?=
 =?utf-8?B?WEtDMXVkS05xalBYVExLYklPYzYxbjU3MGgxdVFlNUt2WVUwanFjUjU0Zis1?=
 =?utf-8?B?bms3RWkzTE5TZDB1VTJuQzZyeTJZMTU3YW03OTFXbndPczI0Rm5Cdmpmdi9F?=
 =?utf-8?B?RW90ekNtWnlheWIzbHVMMHhGdmRTazcxSGZtTEtqNXQ3Z3NqRDNOTjRRQzFY?=
 =?utf-8?B?aUdHQXdEZXJPb2ZmSmdyV01yMUlQMk1kczZFZnRQSTYxRUtQQ1lPWVVVeGNQ?=
 =?utf-8?B?c2tUSmEzcHBYSzZmSkZvaG5FeE9lNGptc2NSRE9rMzE1cHBBK1pTR2FGY3E1?=
 =?utf-8?B?alplYjl4YXRVTkdySUdIb0pTK2k5RFVmSE5JWUpVbzVYQWhwQVhJN1NXSzhr?=
 =?utf-8?B?UGNJSnFqUmU2N2VMUzdGRFdHVERSOTV0Vko3eTFraUFOblVYby82SG9TVjFn?=
 =?utf-8?B?VjY5NDFoMDU4aHQvUUhuL0czbmZuY3QrQ1lINkpSM2d6cS9rSkhQdHRRSllt?=
 =?utf-8?B?Z3RxdUVMMnRqWDk0cjg0UGdTbFNxUTlWQXZZZ2REaDlDRmFPaTR1Vythanpp?=
 =?utf-8?B?NHVZYm00SnNuL2tEd2MvZGVpYXpIa3hTQmF2NmMya1Z3YUxYVW1DeWRSc3ZO?=
 =?utf-8?B?TE5WcTViOGRTdExndjZXYzdDeTA1VjRZVnp4ZnhBUVFTaW1TdHpSUzUwcWJq?=
 =?utf-8?B?U2gwTmt3dG5ESmFSeDUwSEEzdHVHWU9FYnpOclhUKy9GcnczZjFvSzVPQjgv?=
 =?utf-8?B?bVpnUHdhMjZ5bXhINWRiMUNBdTRzRmVjdVRyZVZyU2huZldZalhHK1ZqTEJJ?=
 =?utf-8?B?TENnT0tNRDJyNEZuQ01rRU01NTdvVEUyc3FJVkJ0bkk5cXhhNEVCeDJKUVFT?=
 =?utf-8?B?LzVBUmx5QnBtTXF5NjI4TVNwZlcvdUp4SGdLUTZtSml0QlpWSytCVjRlZUVi?=
 =?utf-8?Q?27NdcIYM+zeBhpnP6nsf+N2JMlJiakX6dobDk5W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d3e679-1d67-465e-7495-08d93fce8102
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:04:01.1089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/UnYyytdcCPRqW0WL61De/7gdBnFYMelpp/M6BHXmYxTkhxvhAJyjhq4jAotVM6FAftYi1/YqY0s2MV0r3UPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4941

The primary goal of this series is to leave p2m.c with, as its leading
comment suggests, just code for "physical-to-machine mappings for
automatically-translated domains". This requires splitting a few
functions, with their non-HVM parts moved elsewhere.

01: x86/P2M: rename p2m_remove_page()
02: x86/P2M: introduce p2m_{add,remove}_page()
03: x86/P2M: drop a few CONFIG_HVM
04: x86/P2M: move map_domain_gfn() (again)
05: x86/mm: move guest_physmap_{add,remove}_page()
06: x86/mm: split set_identity_p2m_entry() into PV and HVM parts
07: x86/P2M: p2m_{alloc,free}_ptp() and p2m_alloc_table() are HVM-only
08: x86/P2M: PoD, altp2m, and nested-p2m are HVM-only
09: x86/P2M: split out init/teardown functions
10: x86/P2M: p2m_get_page_from_gfn() is HVM-only
11: x86/P2M: derive a HVM-only variant from __get_gfn_type_access()
12: x86/p2m: re-arrange {,__}put_gfn()
13: shr_pages field is MEM_SHARING-only
14: paged_pages field is MEM_PAGING-only
15: x86/P2M: p2m.c is HVM-only
16: x86/P2M: the majority for struct p2m_domain's fields are HVM-only

Jan


