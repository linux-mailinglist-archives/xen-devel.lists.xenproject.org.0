Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4666EA6752B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 14:32:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919132.1323657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuX2e-00035X-8Y; Tue, 18 Mar 2025 13:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919132.1323657; Tue, 18 Mar 2025 13:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuX2e-00032T-5l; Tue, 18 Mar 2025 13:31:36 +0000
Received: by outflank-mailman (input) for mailman id 919132;
 Tue, 18 Mar 2025 13:31:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gWK=WF=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tuX2c-0002zl-FY
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 13:31:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2612::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d317239-03fd-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 14:31:32 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA1PR03MB10673.eurprd03.prod.outlook.com
 (2603:10a6:102:482::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 13:31:28 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 13:31:28 +0000
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
X-Inumbo-ID: 4d317239-03fd-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJR0rSo3GVt7wpXFVviep1r0GfdrWTvbpuxxRlGoecHOq7vRbGbrCvksQw0cTp9RfuG/oIhdCFqGTjf6d2Vit3SOzW/45ih39fWzvuBkB+JbXQmJXhGqzrz4JjtETCDf+aWwYE/z2x48xBnaqEdFRaiPEKNgSE7LHABFyZpFiu2AtDs/DjCTmLzM5qkpyU7ZKhrEnlfJsAp12kDOcOperU+Cv+OnjxCv6qJGesIBG1SfY2NpiCObbdjhr3Pttjyc9OwHNfdmTVoOnfW6ISocbmvmt3wQmQQ3p2/dnnR3CtbT6uxyWZZaKHYn7DH+bLRAKrYMGdOI8jm9NbRGguX/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkoS9a3BnX3WBREwtiqaOFvb5KB6h0VO18cxksEOqYY=;
 b=wwDMIFe3/pPsJxoo9W4voujLdOp2HAwrLvNOMNiEfE2mXpDhRHtmT7/lLInsz1XvWAujrXo6W/EReV+rXNDSpAmNxBc2fzvY9D6duouCb272bWyKsRBkdp+nCMWvog1A923zVGWQ8tL2Ms/0n66UvXM827B9cS2SUK1A8zxvZfie/4Bcq5LsbVyC1NJ4WCXggSti4kMayOEQao6Eh7pwfOqZZersBkMm0qGLVKQhLJIyrSn7BsAM3aOcrwPo6CDVHk/J1zkH0mpyDGzDpXrUoMbz5r2HqqtgZmiRQ0sNVIEnRJjSoVD9JwbvySJKsmmENLqxzlz7VzZBiNOc3pcE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkoS9a3BnX3WBREwtiqaOFvb5KB6h0VO18cxksEOqYY=;
 b=oypENAhU8JBz8EOPfP0RRPPi8DqGLFMvLfJ6rZ+HdghXgg+wZ91EH9ukX+tx1okiUoLZJCUtZ5rYQfJftlQeVsOSXVVvi6E8YN8AtHkj2S5As6ztjVVxePMx8d8nEeCqd3jJRWVVvb1W2fZsy8oqSAZ5Cl7AB/NaDy6zzykJExN6LQg6BxC57cStLG2WnuNHf+2LuNpwA+K3mPu5D8orRoQIRcDUk9yIG3pKgQ2bhlJAc/h5pTsC3/hKXhViZrrT7jDQ7TfH4IPgM7IEVnpC+mv89YwEhmdMGvZeQT2PxBc3KZraNzPXFuXh7ExNYAu3c++a/qD56c3YKb9Rv3ldVA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Thread-Topic: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Thread-Index: AQHaRWELmXttIq3ydUeKyfZPAZRMh7DaobyAgqCezQCAABD4AIAAN9aA
Date: Tue, 18 Mar 2025 13:31:28 +0000
Message-ID: <7b3a5232-c17e-49d8-8719-a42745144338@epam.com>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
 <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
 <1793f158-ed83-46f9-be12-68c5ce86e4c4@suse.com>
 <495906c3-9937-4b54-ae3a-8e8ad2b9814f@epam.com>
 <a738e3d9-bfd3-46be-8f66-cbbe4353f93a@suse.com>
In-Reply-To: <a738e3d9-bfd3-46be-8f66-cbbe4353f93a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA1PR03MB10673:EE_
x-ms-office365-filtering-correlation-id: 6925db1f-1254-4fa4-7ef8-08dd66213034
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MUViVE1NdnZkY0NGZmU4SkpIMGowOHMyNzlxaEg2ZXlROHROY212MjJMdWpC?=
 =?utf-8?B?TWl3ZTRlWnVzcjR3NE9hQ09PbGl6czdmNkptY1dyT1J2ckVyVmtSdFpRRGxM?=
 =?utf-8?B?clBhQ1VnMWswb005YXplMnF1ZTFtazZLSVo4Z21OUnl5U2lRT2pxcEVVdE9u?=
 =?utf-8?B?UjB5MmcyTEs4S0h4SDdyRm9MZmx6Y2dxakpaMEhIMnRwQk1GSDVpdzZjT241?=
 =?utf-8?B?ZkhYMzI2c1FaSUxzTDdKcklWUWRQbkNQVkxOVW54UVRJZDZFVjRXYjFwRTIx?=
 =?utf-8?B?WXNOS3Iyd0tLTlZlRWd6c3FtOFRNSU5GQUZIVCs2U09LZ0NOU3FWM0YxemU5?=
 =?utf-8?B?SjBzMkR6SmR5S2JvTkxRRjhENGJWUDFlUFlQTnNubEdpY0pkc0VnOVdWZ0JU?=
 =?utf-8?B?YWFBZHFaQTBsa0JQMlZIY1V3S0VwcnYzSXQ0Mk8xL3ZaOG1DZ2FsdTAxMlQv?=
 =?utf-8?B?T2RQQmVpemhGdGVjTVJOb0MxYjhxQ203Vm1ubUhxMzBoeUpvazBheFRUL1pv?=
 =?utf-8?B?NjZxKzQzSGtDRXN3ZkpnN2RPbFV2Y1dzaDkrMm9IUnZxUnJHd3AySHpIcW5o?=
 =?utf-8?B?TkYybHBxQlRLZjRzcEI5Nk4vRDZkUXA2aGJ2b0FTZXE5Vnhvakl6cGJvMS9W?=
 =?utf-8?B?RXI5TFJqSFhueDhBSHJXdDhHN3NFRC9leVJFTDdONjhYcE9naG5KNExsTHNs?=
 =?utf-8?B?Y0lmUWdQdVh0L0p0elJuM2xnNnpjL2srS2UxNGlnMFF6K1pkZHRKMFRHQVdV?=
 =?utf-8?B?ZjRhcUNFQ3hVOURpN2xCMitDc3dqcWZzaFVMK3RvOE9PY3ZxVDVKalNuQkJR?=
 =?utf-8?B?anRpQlFmYm1GV1FyZ1JXZG84OHRrdjM4RmN0UGw2bU8wWHNGL3lHaTZVZ0xW?=
 =?utf-8?B?NktOSTNTcEJnTmtjd2ZHbjZ3T2hiN2VOZlE4UmtRV2lQZnFmLytPWXQ0S2Ur?=
 =?utf-8?B?YjVyM1FDaXJuc0hOQnlzdHVjUjdha0c5NWJPbjNWNGs3dEY2T1k2aU1mZVR5?=
 =?utf-8?B?WlEreEtwLzB5SWZ4eGtJY0ZhZjBnNTV6UXRYUUE1andaR09wQ1N6ak5uZ04z?=
 =?utf-8?B?ZEo0Tk85MWhKNytFa0NRMzZTcUhqTmRzS2NoOHBMZVR2QXFmM2wwK3VMaW9H?=
 =?utf-8?B?QnVYd0RKSm56ek56b2wxZHYxeHhBVm9YSGF5dXFGYkNqSkVLSkJxT2JhYlMx?=
 =?utf-8?B?bkhlL2UvY0FERFFQM0lGNlRKSkhGbXJQUTV2NG9KaEJnVnJHWTNFZkY0NHRi?=
 =?utf-8?B?bXRodXJ0MGw2dDVEeUN2RzdFWUJzTDNab0Q1Wk43dGdhM0F1OGdrS041OVNE?=
 =?utf-8?B?SVVIVVZPUjVJdzJ1WFFpdCtsSnRCTklZaUJxYy9mNDNPVmdzb2lWZzh4bU1j?=
 =?utf-8?B?VE1QdmhRMUJrM2Y1UmMwM3dIamJSL0tDdzRlSkw3VWdmY1ZLOEt3TW1uL1Jo?=
 =?utf-8?B?NXI0TDR0Vmo4aW9talJacmIwYUtOZ0RuT1ZZUTZuYjh5cVFNUVZBOTRlRVFp?=
 =?utf-8?B?bEUzczFjT2xiZTJZNEpzcEhseWJ5TlNOcTZJaWtCTzVObXZCU3FKbnJHQU50?=
 =?utf-8?B?SlNUL3VQT1hoNmgvRlNlWTVQamlkQlVJcXpxL1BOWmhMMVQwNnYvWU9YaWpT?=
 =?utf-8?B?S1U2dDNqN0FodGM4Y01lYWVPLytGWVcrNHhGT3ZYWGtRNGhGK054elZIOGJx?=
 =?utf-8?B?VFFWZjhvM3Q5OUhLT0hGR1BTTHZ0a2VrTEhFVS90VFNoN0U3aGRCWjg3bDZq?=
 =?utf-8?B?WitMOXVKM2FoWVNLc0lTcC9tSlFoekJnNEpPVEtLZXdVM2VBOG1IOHVVRUs1?=
 =?utf-8?B?R3NtNmg4ZGhmNXg1bVZNR1o2b3FpSjczR1p4Ly95VFhEbVNtR0RJWEVaMGti?=
 =?utf-8?B?UEQ1VStHUlFSZkpkUVljYjRPbGR5M3BpbnRIRkVQL2NXN0E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?REpNQno1QSt6ZTROZnBXV2xWcGdkV29vb3NXL2QvZjhWWURrcnNVb3B3ZlVl?=
 =?utf-8?B?YUNBZVhnWFVtY0hZaWJPak91R1lxZFRLangrUkFJak52SkZFdjZ3N0I1R2xl?=
 =?utf-8?B?R3k1Y0NlZnVXcXdYdkVsQlV5R3BxOTh6dXMxS20yVklZeG5KZExla0wydFo1?=
 =?utf-8?B?aWFIRWNJemlKVWtWVkZjSWN1cFltbXRhWERFOTFybE8vQ281YU0rU1grZm5F?=
 =?utf-8?B?Q2hmN2NBcklvUFQ4NUkzVm51K2JMTlNJRkZza2E5dCtzVWdGUXc4ZmJrZC9C?=
 =?utf-8?B?djBMenNFZ1QydVovRndzeUp1ZGRsdnZrTk9uOEV1dklZZGpEeUJMc3RqNXB6?=
 =?utf-8?B?c2RwTTFna3gwYkVkQ0IxcGFoM092R2RabXAvbE9IS0hveHl5QitlOVNHdWFy?=
 =?utf-8?B?VjhLNEY5aVhJZlBuNEJxZ2xCVVgxRjEwWmd4bkZvRy9FdFU5eXZ2OTlKZHYv?=
 =?utf-8?B?SlBBeVNnZzg4SHhQNWM5T29nUkVtdytkWHdHVjFQNzQzYjlrWURpRXNtT1Q4?=
 =?utf-8?B?SWVWTklBT1ZVUUNFRGhYSTd2Y001YVJMaStBcTNqaiszQWJ6ZXpya2hZK0ZJ?=
 =?utf-8?B?cHBQRlFzaHkycXF5NW9Tdk9DZWhtWi9YOFpZZk9QNFlKQWl5bVNmTDlnVWQ4?=
 =?utf-8?B?a21Qd3RRTXZDVjJSMDNWdmJHbHRteUpGV3hnMHEyNURQaHRwSTN4NFk3Rnp6?=
 =?utf-8?B?cjVPREczYjc4d0w1SG1MOWQ3WjVsVDMvNFlsNFZyWWphUGg0OVVQR1ZhcTdR?=
 =?utf-8?B?bDZzcVJEcWJPS2U5VUNjaHFha0hXeklBaUVtSzdJNzNNSUtaU0N1QlQ3aE9T?=
 =?utf-8?B?Zm9Ha3pQZGNLWSswc1FzWHd2WGRBZUYrT1ZzY01yRzllYjdOcDMxWnIrcHVl?=
 =?utf-8?B?Zit1SmM4enR3aXJYZE9xeFU5WjZheGtTSHZCUVJLQys3VjZQOHNSbUVzU21s?=
 =?utf-8?B?WVhFV0dMV0pkSEhFYWNFRGxEaW1uNUdjNXpudkhhMFBZdktPWlhzU0hpSkNn?=
 =?utf-8?B?aWVObXlWUHgxWUxCa2MzVTM5WUtpNC9nRi9QeDJzdDBOSUZRY0lpOVVCM2xs?=
 =?utf-8?B?RGM5bU1kSFN2ejNSRkFPSU1XdzJPMmhQQ0diMHQydmh1bUM4WVJNY2dGL1Iv?=
 =?utf-8?B?b0N4ejZ0WjBXM0gxZDY1b2cvaEFHMS9ZVkpQTHVoV3JvVDV2eVVwV0VRMVpE?=
 =?utf-8?B?OW1LajNEUUh5cG1uTXRMM1VvaERwK0s0bm9qTmpjNlkxL2lrSXdQSGRSZ2tp?=
 =?utf-8?B?VWUzSEFyU25lVXJ3NmJkR2xsNldKSzQ0YjZ4dWsrZEd5Z0pmMzRlcllTb3dF?=
 =?utf-8?B?NCtnR2NHSEFjaVRRL293ZWRZWmo2aHR4bVVQb1R4c2g4MjlXTC9VNHlMWFMy?=
 =?utf-8?B?VmNoTU5IRVMxV01Xa0VNL2VqQ0dRTWhOZlJSaGVJWkQ0QytYOHJJTXR3Y0Rh?=
 =?utf-8?B?ZlJLam9rWWNITE5MdWxoYU9NUmIyRVo5SzB1Nk9sY3R4TDNSVDUzY05ad2RM?=
 =?utf-8?B?bnpoRlFqaU51Uzlla0dFbXlOQ3c0MVQ1bktqVUJ6YWpEMkxDS2hCSUpua2lr?=
 =?utf-8?B?L3BOQURzK0hzZldtVFQyclNFYUwvaVBJWVFKWDc4aFUrTUgydEFhVVVnak4r?=
 =?utf-8?B?SjdWeUdxNzFteENJbStwOVc2L2l0a2hJWFc4NU54bGg1VDJUUWFqb1RRRStT?=
 =?utf-8?B?amp2R0lHcDlUMEI5VlNPaUdtK25iYnhiU21PY0xLS0kraGNtYUdyRWt1YXNh?=
 =?utf-8?B?ejFKdEdxTVE1bEdxMnUzRXdkTDY2YWNXOE53bFBEdFBpaE1BQm5mcG5WOVUx?=
 =?utf-8?B?L0RYakIvWmJReFFBaVUzMk9EMFk0NzRQT3VkTWppbExpSSs4bEpzbW95VGNX?=
 =?utf-8?B?M0tiaXR0ZUk2bTNiaGw0NlJTQXpJNkdJdEJWaE1jUDhqMXVsM1BYN0NJYUFT?=
 =?utf-8?B?cTVDbi9BWDBNUFZEam9MaFphcS9RVm1XMk9vN1JYSmczR0ZLMHplMTVPblV3?=
 =?utf-8?B?Q24wSGtNeUpRVVFKNW1xS0NxbU1QZldKUlNqUDQ5Rlh6ckl5eXY0RmQ2cVJV?=
 =?utf-8?B?NmJkYXZ6bWliMGF5dXJRZTMrcWVORXVOcXFvVjdYQkNOTEViTUd4UGNGZ0xM?=
 =?utf-8?B?MklZYi9oc2tCRWx0ZTd2bzFybERNWFJlSkVrdmJtT3lVaEgzNlN1VmRYelor?=
 =?utf-8?B?c3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF3FCAED90E864409ED27BDCE5E26C36@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6925db1f-1254-4fa4-7ef8-08dd66213034
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 13:31:28.4694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /B8gkttGpahYFAqf+i9fZD5X9+voavtsiA1UT2c1SrrY1Z8Tkl2xup+wNhVDKoesPP8MjfKs9bHVzlgwI8O7bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10673

T24gMTguMDMuMjUgMTI6MTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOC4wMy4yMDI1IDEw
OjEwLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IE9uIDE1LjAxLjI0IDExOjM1LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxNC4wMS4yMDI0IDExOjAxLCBNeWt5dGEgUG90dXJhaSB3cm90
ZToNCj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9kbV9vcC5oDQo+Pj4+ICsrKyBi
L3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vZG1fb3AuaA0KPj4+PiBAQCAtNDQ0LDYgKzQ0NCwxNyBA
QCBzdHJ1Y3QgeGVuX2RtX29wX25yX3ZjcHVzIHsNCj4+Pj4gICAgfTsNCj4+Pj4gICAgdHlwZWRl
ZiBzdHJ1Y3QgeGVuX2RtX29wX25yX3ZjcHVzIHhlbl9kbV9vcF9ucl92Y3B1c190Ow0KPj4+Pg0K
Pj4+PiArI2RlZmluZSBYRU5fRE1PUF9pbmplY3RfbXNpMiAyMQ0KPj4+PiArI2RlZmluZSBYRU5f
RE1PUF9NU0lfU09VUkNFX0lEX1ZBTElEICgxdSA8PCAwKQ0KPj4+PiArDQo+Pj4+ICtzdHJ1Y3Qg
eGVuX2RtX29wX2luamVjdF9tc2kyIHsNCj4+Pj4gKyAgICB1aW50NjRfYWxpZ25lZF90IGFkZHI7
DQo+Pj4+ICsgICAgdWludDMyX3QgZGF0YTsNCj4+Pj4gKyAgICB1aW50MzJfdCBzb3VyY2VfaWQ7
IC8qIFBDSSBTQkRGICovDQo+Pj4NCj4+PiBTaW5jZSB0aGUgY29tbWVudCBzYXlzIFNCREYgKG5v
dCBCREYpLCBob3cgYXJlIG11bHRpcGxlIHNlZ21lbnRzIGhhbmRsZWQNCj4+PiBoZXJlPyBBdCBs
ZWFzdCBvbiB4ODYgKFZULWQgYW5kIFYtaSkgc291cmNlIElEcyBhcmUgb25seSAxNiBiaXRzIGlp
cmMsDQo+Pj4gYW5kIGFyZSBsb2NhbCB0byB0aGUgcmVzcGVjdGl2ZSBzZWdtZW50LiBJdCB3b3Vs
ZCBmZWVsIHdyb25nIHRvIHVzZSBhDQo+Pj4gMzItYml0IHF1YW50aXR5IHRoZXJlOyBJT1cgSSdk
IHJhdGhlciBzZWUgdGhpcyBhcyBiZWluZyB0d28gMTYtYml0IGZpZWxkcw0KPj4+IChzZWdtZW50
IGFuZCBzb3VyY2VfaWQpLg0KPj4NCj4+IEknbSBwbGFubmluZyBvbiByZXN1bWluZyB0aGlzIHNl
cmllcyBpbiB0aGUgbmVhciBmdXR1cmUgYW5kIHdhbnQgdG8NCj4+IGNsYXJpZnkgdGhlIERNIG9w
IGludGVyZmFjZS4NCj4+DQo+PiBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8ga2VlcCB0aGluZ3Mg
Y29uc2lzdGVudCBhbmQgdXNlDQo+PiBYRU5fRE1PUF9QQ0lfU0JERiBhcyBpdCdzIGRvbmUgaW4g
eGVuX2RtX29wX2lvcmVxX3NlcnZlcl9yYW5nZT8gQWxzbw0KPj4gd2l0aCB0aGlzLCB0aGUgdmFs
dWUgY2FuIGJlIGVhc2lseSBjYXN0ZWQgdG8gcGNpX3NiZGZfdCBsYXRlciBhbmQgc3BsaXQNCj4+
IHRvIHNlZ21lbnQgYW5kIEJERiBpZiBuZWVkZWQuDQo+DQo+IFRoZSBlc3NlbmNlIG9mIG15IGVh
cmxpZXIgY29tbWVudCBpczogTmFtaW5nLCBjb250ZW50cywgYW5kIGNvbW1lbnRzIG5lZWQNCj4g
dG8gYmUgaW4gc3luYy4NCj4NCj4gSSBxdWVzdGlvbiB0aG91Z2ggdGhhdCAiY2FzdGluZyB0byBw
Y2lfc2JkZl90IiBpcyB0ZWNobmljYWxseSBwb3NzaWJsZS4NCj4gTm9yIGFtIEkgY29udmluY2Vk
IHRoYXQgaXQgd291bGQgYmUgZGVzaXJhYmxlIHRvIGRvIHNvIGlmIGl0IHdhcyBwb3NzaWJsZQ0K
PiAob3IgaWYgImNhc3RpbmciIHdhcyBpbnRlbmRlZCB0byBtZWFuIHNvbWV0aGluZyBlbHNlIHRo
YW4gd2hhdCB0aGlzIGlzIGluDQo+IEMpLiBTZWUgbXkgcmVjZW50IGNvbW1lbnRzIG9uIHNvbWUg
b2YgQW5kcmlpJ3MgcGF0Y2hlcyBbMV1bMl0uDQo+DQo+IEphbg0KPg0KPiBbMV0gaHR0cHM6Ly9s
aXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjUtMDMvbXNnMDEyOTQuaHRt
bA0KPiBbMl0gaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIw
MjUtMDMvbXNnMDEzMDEuaHRtbA0KDQpXb3VsZCBzb21ldGhpbmcgbGlrZSB0aGlzIGJlIG9rYXkg
dGhlbj8NCg0Kc3RydWN0IHhlbl9kbV9vcF9pbmplY3RfbXNpMiB7DQogICAgIC8qIElOIC0gTVNJ
IGRhdGEgKGxvd2VyIDMyIGJpdHMpICovDQogICAgIHVpbnQzMl90IGRhdGE7DQogICAgIC8qIElO
IC0gSVRTIGRldmlkIG9mIHRoZSBkZXZpY2UgdHJpZ2dlcmluZyB0aGUgaW50ZXJydXB0ICovDQog
ICAgIHVpbnQzMl90IHNvdXJjZV9pZDsNCiAgICAgdWludDMyX3QgZmxhZ3M7DQogICAgIHVpbnQz
Ml90IHBhZDsNCiAgICAgLyogSU4gLSBNU0kgYWRkcmVzcyAqLw0KICAgICB1aW50NjRfYWxpZ25l
ZF90IGFkZHI7DQp9Ow0KDQpBZGRlZCBwYWRkaW5nIGFuZCBleHBsYWluZWQgc291cmNlX2lkIHB1
cnBvc2UgYmV0dGVyLg0KLS0NCk15a3l0YQ0K

