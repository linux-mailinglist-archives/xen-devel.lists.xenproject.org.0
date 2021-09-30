Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DDC41D9EB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:36:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199876.354190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvI8-0003Qm-Gq; Thu, 30 Sep 2021 12:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199876.354190; Thu, 30 Sep 2021 12:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvI8-0003O4-Cd; Thu, 30 Sep 2021 12:36:00 +0000
Received: by outflank-mailman (input) for mailman id 199876;
 Thu, 30 Sep 2021 12:35:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVvI7-0003Nq-3v
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:35:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89c7f0a5-7e08-470c-8c32-c4657eb79df8;
 Thu, 30 Sep 2021 12:35:58 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-4iLhtgzoOE-IdxjPXrGF9g-2; Thu, 30 Sep 2021 14:35:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Thu, 30 Sep
 2021 12:35:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:35:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR01CA0058.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend
 Transport; Thu, 30 Sep 2021 12:35:54 +0000
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
X-Inumbo-ID: 89c7f0a5-7e08-470c-8c32-c4657eb79df8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633005357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csvwBDBtFGc48jg4jEJIdJUsqEpEZpnnkIuWC7zw3YQ=;
	b=bqvNY1Rp3+97atd0vJfMyGRPQbRJVrhbbEJspkM+hBJK/l9rNiqm327UbdbUsu26poYojI
	6eE0EeYH/9K1ilvbI0v2ZnLSS/iTudsMNpVMv8Rp8yXGfLtepBukGQW8+mgYRu5tMNTOC/
	/bvsBvfjtfgdlUfeEjMMtSLDdQSdIJo=
X-MC-Unique: 4iLhtgzoOE-IdxjPXrGF9g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEdWrKHzXgjyp7ZEHrbXCFH6f7gIoRdJxTJRaM5qejyIyVP5t8YLM941Ss03r005KvIpTh+w66LzNQo8+4TcfIxapaGDiFInA7duYaZxTud6TPt7AqSsaq8Lx/oBw2SY7/MSWiL3oqcEZHxY+MfIr1S3u8ziwIK4FxZwW7f/YhW4TicFf3V8h4RTZc8NnV89jE2+hKmcBsAC8d+pMXBi1ftcmD8889QrL77QN2WuW2iuo5fpZeT47XZ49P/XJKNjk24ptdlvh1LHsLyQ+FIcqls0cj0zvGazmq6HzY+gfv/ZyF7HQxcOMBB6yG3Zhwm9HrxotvovuDubrOz2VW0MXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=csvwBDBtFGc48jg4jEJIdJUsqEpEZpnnkIuWC7zw3YQ=;
 b=ZcvCV2pd5y9a99dHbgErSusWKYtrYYe1JVKdU+Fl6+9kfK/90vRoQVjEmE6q1n2811b5sAPf69SBxeBlVuYse7isclAJs956GlPonBVpu54oWs6/qOrGvzTspb3RTCrjLZUv29l2h3nNwrbGNmTQOsSRfxJtJ0kqmjKITl89pXZYdUhlG7TOB+wYPP4H9Xls4J8neNjCMOXvFPoxMmaxejYfnGmcadQxbUVmLXk9bWpYZ9CQig7KuNXy1POLCoqXJCWVuqZRm3XfZ9FAaKaki0fxxfrXcLzvJd40xyQPblcoonPQsQaNbg/468i4jNb7P3RrLy/nRP7E/sXv6GAdmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 3/6] xen/x86: adjust xen_set_fixmap()
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Message-ID: <11fcaea2-ec17-3edd-ecdf-4cdd2d472bd0@suse.com>
Date: Thu, 30 Sep 2021 14:35:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 733cb1a5-c54a-41c4-369a-08d9840ed853
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6383C21A54C6482E4DE9AB88B3AA9@VE1PR04MB6383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	myEIyzqFlWR0QrxdEpAZVC+kMgoa8VyQRPVsJvIIB/9mrT6ZOoOJ53sMJyck12R5nMTjIuRneA7fU3mZOtVPxF/IpUAJzxRcF4QrYKkWHyaCjM+GdrxkpwYjGkemq5LTUIFLuO9mq0vXkqk0Z1NgbPukI7GjnCaGoo4EZ7lTYPidPJzS4brADk8XIix+EYobpcg4xqbWE8DjJumuPHc2CNSUjThGyr95nBBwU1BwA7GkIOLycVw3De2qFb4AKl71yLsdAm+XFe89/K7vwFR/0zM1jKmWgOdbfxToPxb2a3Zk1zkqD9so+/Jp/cXyQYiIUXeSCywNWVfjWiznDpjAZNVQ7lHxNy4VBRQCwTnfnxUC9CZHtoqHf286Tb3SG7ZQEXQ8wVETXsrjNlOEkXeD0XN4RVGDyDhUzNijQinc09b1tkut+wv7i1yJcPysW9PX4K+rCy23Tjh+HJL8lizfMDAhtndXUi+Y0deQ5niOT87aK6fGOdnZKl3YR/L/t+NVdl7VrzJFlJt1+kHRD2EVW6XfxDB7F36dw0spF24JV/wHhGkJrlNJGtd9/CyoR5piWigIndnre1js/4hdlvGRBW4fKjSOpElHtaoEdOr71/3MgOaHy9LA7sqh4N/XCVOuqigSYFG4wGHK4yOzO5Csb6De8VJGJqf0Slog9wcfHLPertff7YBdUA02Sv+udubbmCI+UVR8TVPre9slX5rNfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(2616005)(186003)(956004)(508600001)(31686004)(66946007)(83380400001)(8936002)(86362001)(2906002)(31696002)(16576012)(316002)(38100700002)(110136005)(8676002)(36756003)(6486002)(66556008)(66476007)(54906003)(26005)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFB3UlR3YkVQSU5ic1M5TlFsT3BjMURKYjNCZEtTdjFDaDhMbjk1WFB4ZFIx?=
 =?utf-8?B?Q1FVNFNDVVRLQVdzNCtJRmduckJMcS9PSm9tUHBqNy9JMm5RZCsxQUFZM0ht?=
 =?utf-8?B?UkpHcUtUNGhtbi9uZHFteVpsTUovRHRqczZ2UzNuQ1pENlRwVms4TWZCaGtq?=
 =?utf-8?B?emxWOHQwZ1k0cHNmaHlqZ3F3cmRkdW5pUGs5MFd2NExlL01mbVdHNllxRmlE?=
 =?utf-8?B?ZjZsTzhtbUZyTGMzdzdOaFMyZ1ppWHV0N0c5d3ZXOWlSOGNWVjJGNjd0VWI1?=
 =?utf-8?B?OGU4b2hQOXhIbTNTZ211R3U5bTJ3OGo1NjhJdHJjY0QvQ1FaUHJlYlZkTkxW?=
 =?utf-8?B?cUVFMWhOVTl1MHVLaDQzaG51SGV0ck12akxSZDBtRGZrbHZER0RIWkFpdkhl?=
 =?utf-8?B?SEg1bDNzcnFRSU9uR3BKUzYyNy9YMTB1TE1vUmNWR2piTHJOblN3WnhZdEhI?=
 =?utf-8?B?b2c5eWkvRENQNEkxWllaanFUdkxjaktvcVgxY0oxSXdWVFF5M3BXa1V1eGhI?=
 =?utf-8?B?NUJIRXZtQkdMN1dXYnRzMXNmeG9ZQW5ua3ZsMThHd2tVMmlBb1YwOUNDTFNr?=
 =?utf-8?B?Tk1JQi93alF6VkIxL3RtTmtncWdwWVkvV1R1VWdmeGY1YzkzRDVheDE0c3M0?=
 =?utf-8?B?YnFaL0NBU2pNL0xwSTI2dXpFRktnNlo4L1AwNkh3c3lpVjFwUmFLVTB0MS81?=
 =?utf-8?B?ZG4ySTY3V3Y5djF3a0VkZzFUTWcvR2h4Ui85ajhWU2lPY1NLRlNOYVJ3K0wx?=
 =?utf-8?B?V21lSlptZk9mNmlLMTNTbXE3aHI2eVMzVkpyUWt2emxybXByNWdVTDRXSmpv?=
 =?utf-8?B?UlB6b1FKais1WkJNTlBKeml1RW1heW8xeWtxSWxrZHh6S1RGaHEyRTQ3Wm1F?=
 =?utf-8?B?dkxxc0dzV0xqZ0ZGTnBCWXlHWTRTWkJKUzhwNmgwcVAydDZWNldZL2FSclhG?=
 =?utf-8?B?VHhBRnZvSFdmQXk0MWNuMHozNEtQVUtFYWg5Vk9JSzBGSTNOWlA4TmpXMmRC?=
 =?utf-8?B?M1V5eStWS2VtL1Awa1QxQi80UTVCWE8yQlBPR2tCVEg1cG84cnl2WFhzUyt6?=
 =?utf-8?B?ODRaZG1ZdGd1aWxQSjIrUnFhYXViN29QRU5mMGZCWDM0UE9HZUwxeXRBemM1?=
 =?utf-8?B?ZnRFZ2JmREgyVlBRd0dwb2lDVWpIYjhZdVFaL1JDczJUZEsxUlNZL043WGtT?=
 =?utf-8?B?SmMrNS9YRDBSN1lYR3VvbWw1OUVGdXpwcXZuMERpRjRrNVBUN3ZKSlhZbzk4?=
 =?utf-8?B?RTdjeUR5cDhadWdsV3gySzR1VnlyTlR4RGpHVTlsZXNCQjFocFlrTStyVkNx?=
 =?utf-8?B?WEplR1FBYTVFc2hIUlhZS1hkU0I5ZGJLN09jMzFTbE9WQmE4VVRqQml2c1l1?=
 =?utf-8?B?Vmxid0UyVDAvN1NrbElQT2N1Nlk3dXlQdVdjMFFiS0dUeGx4LzY3a1l5U1VL?=
 =?utf-8?B?UkYyNWNxNjNKcXlyaEdWYXpnamRDTHNYc1lQY2N0T2o0aCtmUmwybVFDTUhl?=
 =?utf-8?B?OFZ3a0ZMZnFBTXJSK1NBWG44VFRHSnZMTEppaHhBczN4ek16eHQvdnZycWJZ?=
 =?utf-8?B?MzZKQ1NaMDBYSUprVmtvUGZ3b2M2VUcvNm5QdlhWeXIvSVprblc1QVp1SjYr?=
 =?utf-8?B?WjF0ZEJ3TnhLTnlaNWlndlNVNEZLa1ovdVYxN1VXVjB1MXcrdFlKbU9OQmJ2?=
 =?utf-8?B?NFRFNmg3ODlSdXkwUkp1d3planBYRUcvTXFPS0paaUQ1QW5OZzBxWWlscExm?=
 =?utf-8?Q?rX8YE4XHd/jpxBwtdja4KUYuj5kV+O7aAPytAvi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 733cb1a5-c54a-41c4-369a-08d9840ed853
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:35:54.4645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgL0mzeJ4pJiRZIPT79Ewr88HsQdIU/G/WhWCllKZd+ErP5iAy3MdUnMGElgEPiueK0J3e7on0LHxLRtAnkq2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383

Using __native_set_fixmap() here means guaranteed trap-and-emulate
instances the hypervisor has to deal with. Since the virtual address
covered by the to be adjusted page table entry is easy to determine (and
actually already gets obtained in a special case), simply use an
available, easy to invoke hypercall instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2010,6 +2010,7 @@ static unsigned char dummy_mapping[PAGE_
 static void xen_set_fixmap(unsigned idx, phys_addr_t phys, pgprot_t prot)
 {
 	pte_t pte;
+	unsigned long vaddr;
 
 	phys >>= PAGE_SHIFT;
 
@@ -2050,15 +2051,15 @@ static void xen_set_fixmap(unsigned idx,
 		break;
 	}
 
-	__native_set_fixmap(idx, pte);
+	vaddr = __fix_to_virt(idx);
+	if (HYPERVISOR_update_va_mapping(vaddr, pte, UVMF_INVLPG))
+		BUG();
 
 #ifdef CONFIG_X86_VSYSCALL_EMULATION
 	/* Replicate changes to map the vsyscall page into the user
 	   pagetable vsyscall mapping. */
-	if (idx == VSYSCALL_PAGE) {
-		unsigned long vaddr = __fix_to_virt(idx);
+	if (idx == VSYSCALL_PAGE)
 		set_pte_vaddr_pud(level3_user_vsyscall, vaddr, pte);
-	}
 #endif
 }
 


