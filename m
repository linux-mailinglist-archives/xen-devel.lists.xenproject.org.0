Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B364675CF
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 11:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237352.411670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6Gn-0000x7-Hq; Fri, 03 Dec 2021 10:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237352.411670; Fri, 03 Dec 2021 10:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6Gn-0000tl-Ds; Fri, 03 Dec 2021 10:58:25 +0000
Received: by outflank-mailman (input) for mailman id 237352;
 Fri, 03 Dec 2021 10:58:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt6Gm-0000nF-2H
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 10:58:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eede6215-5427-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 11:58:23 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-N0ogYuKWOOScXHG18jhiKw-1; Fri, 03 Dec 2021 11:58:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3391.eurprd04.prod.outlook.com (2603:10a6:803:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 10:58:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 10:58:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0033.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Fri, 3 Dec 2021 10:58:19 +0000
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
X-Inumbo-ID: eede6215-5427-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638529102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lyHpDq+f1Yn1Y+Nw40SlcTxVr78qVUTB+hT/e8DkD7A=;
	b=R81Az5JckaS5zU8uTGusKqQ2f1inQJvajCIT2ioQ6Bc061zEPHzAU2aZedR8difqr04KkC
	qpYCQc4E43AfKyf8GbfFB3A8lokx1FsI0u2PaAwqYE7u/+yoJcseRDZFMnHpkEHg9eszAG
	kJ1kI8/Qs3wnTeyjUPFQDB2H6XgvjTM=
X-MC-Unique: N0ogYuKWOOScXHG18jhiKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4cMBeRZRMNoZ/Nip+eSIwLTXwb/K69kihURpo+cxoh/+tpeOdcOPSouardHbSIvYbOuTkkiCmwRUGNwpP+K1XgUPghP8175/RPXnjlDkI8PQnTurYFw3NG/QNPgOLJHcGdBbCy8fJsS5fSQpYLmJjpmh0b8dcfQWIF4gHOPfrPJGCT0SKZHSyes4/Wq+AcQGm5sH/Ls/JmznqtXXfza1+rvbl33ndVluGTOK8fCZXRRTseUdTbaEFOfAzJpNMg+iqR0DpZuKOB77q5cMnx84hqIeMVT6KlyRaNkowCZB8GuuowZgjkhBEz84rAEEuU2P6KzHDflD1IEEfXeufRpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyHpDq+f1Yn1Y+Nw40SlcTxVr78qVUTB+hT/e8DkD7A=;
 b=WqG6OZAd/jLKfirDmd/v21p9vssEy+5msy/81qCn7XJuxPVThdlTViMWs3SVwEiSuFrKqQnMlpeEoazB1H7RlkwqSJqlVJX8MS9QDIVPUVnCuR8CtawpVerbmsQ+itRkPc4U9O0ZhjIwOSLF6yMeIvXxxSZoR9ub+8YMl3m9CYqDoWeDIXMTl/TTqn8gncwLxlrJJ//xzJEhM3xwtsp5rLsJ4OBzThTNnuc7BbWo4Y7aAup18xnoEgZxlTwTpEf8NOCrJwCKsWm2mUPsrfn/kaksj+oH7v83COXP8eK/xaWYzXhgAdynIVyKjK2lm2rI7NOcVT7+i7s7/9HXU6R44Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <edde87a3-beb3-c109-65ef-36e74df28e7a@suse.com>
Date: Fri, 3 Dec 2021 11:58:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 3/3] EFI: drop copy-in from QueryVariableInfo()'s OUT-only
 variable bouncing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
In-Reply-To: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0033.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f987c2f7-a0a0-4f3a-5914-08d9b64bd180
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3391:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33917D2C8D78A66A4B163680B36A9@VI1PR0402MB3391.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4U2wHwhL+ZtWppXaUosfUeeoLsrCidE862UBvFYyEmRikUh6808eDT6sKRtRokZUfw5y/D3XZMrEAU6Rz+V0teLnwMD8acoVR+HwP8bm/NBYeMwF8aOAah/FVQexziPz/Vp5jEV+L1KMCLE3QQbTAct3dp9fxksSWIZiJx1YlcnzWniH6V7FTae9h/zIZ0VJLW7vC+eruRU0+/uXqM167GXbj+6UecqvVi14HK7ATM8VUtdj2l2gVQvhOBngPfPdMFh7UExOlmM+drUUibu1VAEJTw5BWUMNQnIt90Q9bkr79xKybeQsG0/eZTawqswY7GSFrvWc2tE7lmJj35I9Q7xQViRRg8GULleED3dJFyVbqZAZrcw7j1+rydDkteT4gVwSjN+t07Ydzpq29Ucv6mYWepwfQ2cIA3tViNtNPUWLmBy87pv54Rv9mP94j4/UM8uyV2CD60SlSKhSDhpTBZ0Nn2iXvvrW3yza+cXSgSRCeUkJaFoiGNWtZNRs23Pehp6/8xq9mNdDH/52J18FCG2d1i17tFVp3CVTGPVTV3Yi2h1KFNCbpWIpaD+SxKY/WuoqZGOQjMVKuWOy74SCUy3Eu/8cY2JS1tyqW4WK2oF4YfBUJL9akEmxm9BYMFkAdq4qTCb92CDByPTnby0o6iQNFsrq7UGde9R7QIFukaD5aJ7/8sg7i1zV+8s5O9gsXpjjXaRKemONrAA+DgGmwljko+FBt8Crun2H8Llw6Hc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(4326008)(186003)(2906002)(54906003)(66476007)(5660300002)(66556008)(31696002)(2616005)(16576012)(6486002)(508600001)(66946007)(36756003)(86362001)(8936002)(316002)(26005)(956004)(8676002)(38100700002)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjhmeDNHT094SWY4OW1MOU9tMEdUNkd3N1BiSERvZUZVWkIzNHZQVWpmVEFj?=
 =?utf-8?B?SlNPclJPU1ExTHEyT00yV3JKK3B5WS8yeHYxYlFlTXVGbUhJbC9VdEZLVzV5?=
 =?utf-8?B?NzVidGp3V0xJU2dmYjRiVVZrR2IwODNiaFdJNEFZRDN1Tk1EUUxGWjlIZEVl?=
 =?utf-8?B?MWVnNHNndlVxSXFGK1dDOHpVd0Ztcng1c2Ewd3RBV0s1QzF0bmdpdWlUanRJ?=
 =?utf-8?B?RGJHakZJRi9BTXhmSE1GRlVUK3ZiRlZmNENuUm1pSkNzTFdtdHV4KzE2eWFz?=
 =?utf-8?B?cUhTM3loNW50NUJDeGthQmlrUnNGcEgvdThscUh3Nko1WUx6OFplbUJjU2Ns?=
 =?utf-8?B?YlJFRUpQeERhbUovTi9NNjUxempUcE84ZitaWkh5bHBYOVdnalNlaXlsc3Z6?=
 =?utf-8?B?YmFvbVA3STVOWjBkRjhUOUtMbHovUSt0Uzg2NElGWUpXdjdBT25Tbi9DN2VS?=
 =?utf-8?B?VWNudUFaTStETE0zVHVrUStLZXdlU1BUcE9KbVFUUkFKd2FoMC9VckphbmRs?=
 =?utf-8?B?bDdZMkpiejNRbGxGVU8vakIwaHdSUWdKVEU3SkxBMFpuTXdQQTlLQWNKdG5v?=
 =?utf-8?B?Z2Qxc1Q0UG1XbkloWVhBenozekw3SG5rQ0crWnJIb2JTVVpwUlAwK0lRNCsw?=
 =?utf-8?B?azNIVGNXdEk2T2Q5WndORWxONTRaMHZoMjFCVTdIUExSdnpBd0ZpTjFYK013?=
 =?utf-8?B?ZGVVQVJUL3k5ZGFVSitUUlpmQjJER2hYZEVwUitjVmZCOW5FWThvVnJJM2Np?=
 =?utf-8?B?MGhwVWFKd3h6SFU0SU9LbUdiSy9USGVSWUtNdHN5U0N2ZlhSWi83N0lSVnBt?=
 =?utf-8?B?ZS9NaEpvNVdXRW9yR3BsVG9OcDlRZ2MzV05BSEpzQytCTlcrYmRjMWd3ZlE3?=
 =?utf-8?B?VFBtOFNKZm1FK2VUNUdlNk0yYnhZQWxCaGYrYTIxL05wVnRkc0lxbC9KVVQ5?=
 =?utf-8?B?K0ZPQW5uaDBSOWZFVXI3SWxJMzZTV25HOEdMbDRaeTlYMnFndWRMZ3NUbTNl?=
 =?utf-8?B?OVpSVHNlV2Zqa1g5Ri85WDUwVnd6eW82RllaMGdXSW1KN1dPMnhCbHAxNkVl?=
 =?utf-8?B?SEtOc3g0S0Y5bXZBM0NwV0w1bEJSbTJ6cGE4VlQ4U2V4Q1o4WGRlSVpoS2p3?=
 =?utf-8?B?cGswejJDdzV1MWJMMUhuUWVsSkdUbHR6bG42OWFrVkhicDc5UGdXMHNxcjBJ?=
 =?utf-8?B?b2c2RHhaS0NsQXl6TTBmK3ZWRDJnZE5SU0ttQkdJS1VuQVJSa1k3T09Mckdn?=
 =?utf-8?B?Q01Qa3lnaFhVTnpaWDRlWHVSak5UajBZb3g1bWRPeCt1OHFibFFkOFNXcFp1?=
 =?utf-8?B?T24rdWcyR0tzWHUyZ0V4bzR6Q2pseUFvSXdCZUJoNnhTcVI4MVBnTTQwaEMx?=
 =?utf-8?B?VFJNRDRCOG1QQ3orb3ZoRG44MjNpazZ4VUZyaEt3UmtZR1hZZjdKNEFwQW5Y?=
 =?utf-8?B?RytSNHhkNHU1OG1SNzZsSis1M2YzdktWbE5yNFB5ZnAwK1ZWMEViazlqenJM?=
 =?utf-8?B?SmU0RWlCZDlYMDZ5Znl5VWN2dU9RMGFrZGdhQmwyZUROYmdneUFLUUcwQmgr?=
 =?utf-8?B?QnJ2eU1DRDhyN0YvbkFlNUtqYnNlV0hza3NqaFhLQ3BWMFRTdXZYQ0hkdDVL?=
 =?utf-8?B?Nngrckxzamt3SHc3R3BySkQ0b0lVMXI3M1Q4bFBaVUFHR2hSZDFpNkZrVXZt?=
 =?utf-8?B?TjR0ZnpER1JyYy8wNVhac3hBaXZmeVh0VHRZRUNtMkhpd2FwOGxxemtMQi8w?=
 =?utf-8?B?NE5tN3FBaElvVHVFdVVIcG9qUW9tMk00WFVTby9zaVhCWTgwdnVRSDFjZUph?=
 =?utf-8?B?cDFTOGc2MzNhVDJvcmFraDdpZmV0YWFlRDdlc1BrdmlmMFVwMU1SMnhJOXhK?=
 =?utf-8?B?UkNoN3dZM2I4cXhaYWQ0c0tsbFhOSmQ1VGNoQ1FrUGgwSkgvQmRnYVlnZkhT?=
 =?utf-8?B?dTVvUTBRem1BQmVjTEpyRUpnR1hZeWpPRW1maDhuNUFDaHVrNHpDMlhWcG84?=
 =?utf-8?B?RW83Sm5IV250L1ZMak9IUUtKdm1PMVpPSkVWZTA2QUVUZGE4anE2cDJqb0hm?=
 =?utf-8?B?elVadWNCUHNFMHo1dzRtdHZ1Y0JkMzVSUDlEZFR6d0lGYW9MVXp6ZDVjTHVB?=
 =?utf-8?B?MVlUdjZYK2JnNEtrbnQ3eEExaGlBUE4yazNhNHF2ZlNaejBiRG9wckZRZ0dE?=
 =?utf-8?Q?hle8/M2ueqxh2sPZCpxLrcc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f987c2f7-a0a0-4f3a-5914-08d9b64bd180
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 10:58:20.4886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8A1AYkIZEJtRPlwzGhfNzju25hkPMVVSF5+JHf5mZbeWZvjR6/g5DBt8EojKcH93xHMNExOpzu/j3NuGaYijA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3391

While be12fcca8b78 ("efi: fix alignment of function parameters in compat
mode") intentionally bounced them both ways to avoid any functional
change so close to the release of 4.16, the bouncing-in shouldn't really
be needed. In exchange the local variables need to gain initializers to
avoid copying back prior stack contents.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -608,7 +608,15 @@ int efi_runtime_call(struct xenpf_efi_ru
 
     case XEN_EFI_query_variable_info:
     {
-        uint64_t max_store_size, remain_store_size, max_size;
+        /*
+         * Put OUT variables on the stack to make them 8 byte aligned when
+         * called from the compat handler, as their placement in
+         * compat_pf_efi_runtime_call will make them 4 byte aligned instead
+         * and compilers may validly complain.  This is done regardless of
+         * whether called from the compat handler or not, as it's not worth
+         * the extra logic to differentiate.
+         */
+        uint64_t max_store_size = 0, remain_store_size = 0, max_size = 0;
 
         if ( op->misc & ~XEN_EFI_VARINFO_BOOT_SNAPSHOT )
             return -EINVAL;
@@ -642,21 +650,6 @@ int efi_runtime_call(struct xenpf_efi_ru
         if ( !efi_enabled(EFI_RS) || (efi_rs->Hdr.Revision >> 16) < 2 )
             return -EOPNOTSUPP;
 
-        /*
-         * Bounce the variables onto the stack to make them 8 byte aligned when
-         * called from the compat handler, as their placement in
-         * compat_pf_efi_runtime_call will make them 4 byte aligned instead and
-         * and compilers may validly complain.
-         *
-         * Note that while the function parameters are OUT only, copy the
-         * values here anyway just in case. This is done regardless of whether
-         * called from the compat handler or not, as it's not worth the extra
-         * logic to differentiate.
-         */
-        max_store_size = op->u.query_variable_info.max_store_size;
-        remain_store_size = op->u.query_variable_info.remain_store_size;
-        max_size = op->u.query_variable_info.max_size;
-
         state = efi_rs_enter();
         if ( !state.cr3 )
             return -EOPNOTSUPP;


