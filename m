Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F10B31D78
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 17:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090301.1447626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upTNb-0005aA-Ul; Fri, 22 Aug 2025 15:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090301.1447626; Fri, 22 Aug 2025 15:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upTNb-0005Xn-Rg; Fri, 22 Aug 2025 15:08:35 +0000
Received: by outflank-mailman (input) for mailman id 1090301;
 Fri, 22 Aug 2025 15:08:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jNg=3C=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1upTNa-0005XU-46
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 15:08:34 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deca5678-7f69-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 17:08:33 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV2PR03MB10975.eurprd03.prod.outlook.com (2603:10a6:150:279::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 15:08:30 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 15:08:30 +0000
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
X-Inumbo-ID: deca5678-7f69-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMjptNbq3wDbfWN36aHU1UlSbcwKJ5iyAO7kUEoV0w5EWCbXaNM9s6Y+D1/eb78mYkG9B2Yl+0yT6/XjIYXUnc+yMPTHPAwBihgVmplXkCr4prP7N37fiN4O3XmgYbJR1585yjppq7fpNzf7sxQTMIH5K7AgxUXMU/UeS5OrlNQVV9CtbTGeOx0xhbsJz9MHPtVis8m6Q+O1JStWuheVv6c+f98R8S+Az5Hbwa1QaRI0n0sa5EMnq0GMnmmgU8GMwM8CKeUIZ1QDtIAHHlJET6ghgTTFqtxbkKfaxfj6fS1s+gAofcGvgVG5oeZMqAWW30wcEslPC4cDLoIMJlY72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6R7SmnxpZFERvOiZnG6EyWV1ADtMZ/7svn7kgc9XOg=;
 b=MNyVPzydQBxcY0vrfgqXEmx+y9VM560xNS2S6mlSZTVqCOxIz2BNSTYbdbtXPZ0yPkz9Xtf8z9AkUcfk0jRE2anr9SnSS7tF//v0Hw0rCNUsYUs3vmBpIVtfyhqKNruLaVSAMxjSaPAicvJ0+zQMpkC679aDstgWEQsx7m0meMOLhGTxqZN6KCdV38TAGkWV7TIMsJhp/fd7gMjIipwFnB6k5RqsW8q/TiuPmn/OPjS1tI6kZtd0wlejRg9FGa+t7eyO5vZBQNm4aE0Av8ln+nnrJKliQTpP6tUXA5iVmh2sgeJLiVyub+hHOVljUOHhExqRcH8M9Ve2/CXds9Z6UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6R7SmnxpZFERvOiZnG6EyWV1ADtMZ/7svn7kgc9XOg=;
 b=gqVdUhplg4h0RBhwHokRYqjcQuy/kRXULJK7+ULCQDJyxZePz1k4HgObuRyr1FCDbBD1LjSFG5f925ErnGrv5MUVSQJIwhil4vG/f51DV1IxK0NzN3QV05D2vO34lWiY+ZrpLV6M4pv5I8FItMxkLwoCeFHS7brGrf2BrP3qaMgemyvCeQksY2PlfuOirnRAO8LC9bLqbUf8HKtit4knYqYw+fobclyDc46IwQo+dqx16Tb9LXrslDrSbvAF/JasTiqGrCj2sc2qorNQifmJ/AcYugXhv0aAWSGftX5Cajg1XtB62y4kGTCeePyJyPR86wxb4KAq9HpdnjizvsJoqA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 03/10] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Topic: [PATCH v2 03/10] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Index: AQHcB5d76MRh/Swq2EGu624C+G/Fb7Ru3gyA
Date: Fri, 22 Aug 2025 15:08:30 +0000
Message-ID: <8c111099-df9f-412f-b7be-d1c519875600@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <f029f88411e816846d13aaf33d4ef703f95d1bb8.1754568795.git.leonid_komarianskyi@epam.com>
 <87y0rcekyo.fsf@epam.com> <7360fa14-2c55-4aa8-bbba-e355a47d2928@epam.com>
 <87sehjbkx4.fsf@epam.com>
In-Reply-To: <87sehjbkx4.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV2PR03MB10975:EE_
x-ms-office365-filtering-correlation-id: 507c8178-d9e3-47e8-0923-08dde18dc15b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TndMVnJkV1A0QWxhTG9KU1gyeERRbGpPdkQvd1lWb3ZlOTE3Q2pra2ZzMVZu?=
 =?utf-8?B?T0tzV3hqbmVlVDRRV3o3UzY2azA1ZFkrMVJBNjYrMDRmZ1NaSzIxdFhQaXFp?=
 =?utf-8?B?cWRVTmp1Mkhwa1dkK1NzeTdZMHRYc1RCTk9RZEwvNVpvV0d6RXM1b3U3Wjhw?=
 =?utf-8?B?V2dsRS9QZmhKRmJzSVZENGdDVEdTdXIzYmhyOGNiaWFMcEtiT0JoczNHN2Zn?=
 =?utf-8?B?QVZxOHMzRzdtZGE5dEkrc3ozaTFiVEpXZmh4U042eHkzWnQyWUk2dmw1clFJ?=
 =?utf-8?B?MnMyWkE1M0hBZHJQeWNwOUNDRWw2MUMvTzdRZ21Fd2NYbExWRWxaZE12c0hz?=
 =?utf-8?B?ZTBoU1ZaMk9nMkRPczExVCtzc25aSlE2NVVuTzI4SXFhTjIvcXdwV2ZBck5C?=
 =?utf-8?B?L0JIVnVXQ0grWExUSVN5SUx2VDduMjB6MVRwYmdFUmpYNnZ3cGR6WEo1UGdr?=
 =?utf-8?B?Q3k0SmpGK1hYeUg0TlNVNUZETllSN2VNaXFzYVFNdUNmaStyYXA2dHVmbUs4?=
 =?utf-8?B?NmZyRHVicDBTTzQ3T04zcmdOcHQxVjJucnpwSVpBbHJBb0VlTUJsZ0NuUEpV?=
 =?utf-8?B?WG44dXYvTnVBSllZWkd6cXc4WnRodVdsbjA3dnFnYmR2bVdrZk1Vd25ZYUg1?=
 =?utf-8?B?Z3pna2VYZ2FwM1lMc2ZDbDcwUFhuOWlxVUs0MG5ra1dyRnIzZ2J1OUZvRWw5?=
 =?utf-8?B?eldVVm1qd3d6ZWMvMHBWeFREY1l3RUZweVR5NWFwNWJibnpnaTcrUkNPd3Vm?=
 =?utf-8?B?bms3Nk5zRmlienZGREJ4WXV1NG1EQmJRdHRLbHVPMEpLMTYwQkN4M0lnUUZE?=
 =?utf-8?B?VEV3Mkx6c3piUkt0cForcVA2a0lERm82WE5VeVpQelNXV01EaUdlNWppd3VW?=
 =?utf-8?B?ZG9HQXhvTXhkZUFTYUlSMkpTOEhkdEoyYWFoVFpmYktYMUExdUEvR0NwUTRz?=
 =?utf-8?B?bXJwYnBrbEVhWEVXQU9NTWNiNnhjeW55MjluMEVQT0JmTk9aQ3oxK1FmcU5Y?=
 =?utf-8?B?YUJEeXgza1Zjcko0bDRyeFJ1S1lIT0VoS3JjRkdDTEpxZUVqREFBWG1GWXAw?=
 =?utf-8?B?TnMyQTJtN2phRlY0c2Ixekd4Q1VMVEtoNEJOMjZSTXdqVW5SeFBEV25FOStv?=
 =?utf-8?B?eGZoQ1lUekdPeTRsZ1Z2Vm1FOW9MN01Uc1pWelpValJLQ1l6YVpNTGlrQytZ?=
 =?utf-8?B?S1Y3VENwSiszS2lSRVVrNGhiTExHRnR6MTB3Q2RQaXlaTUdxRzdCKzA3RGor?=
 =?utf-8?B?UTJLdk5ITjdWYUU5ZWxuWU1objEwSlB4U01kZ3N3NHZtR2g5RllkWjl6VCt2?=
 =?utf-8?B?YmJPb2lzcEExQUxtMDNZdnV3S2x3MDR3VjZvdmV1eVJOSGl3c21uaHBYdTVH?=
 =?utf-8?B?c1h1QjB5L2ZMak5iNUJkQk5rWVhtUi9WVm11WVIrK1h6ZHUyRXF0SHdyRUNV?=
 =?utf-8?B?UmIwckRqemF5VHAxYm1raUJGNlhPTTd0VjJrTTgrbUZWdTJ0OHM0Y1N2aVA3?=
 =?utf-8?B?Z1ExOFQ3a01TR1NGRXBjeENWYTZsb1NyR2luZm1Ia3JGOUkwYXE1eVpxYlBz?=
 =?utf-8?B?UDBjN3ZLYzB4emkyRi9vc1FGQ1h3eGtKNWhEUUR4SW5UMWhCNE1kc3ZMOVRm?=
 =?utf-8?B?Q0pFMzdGcHFDQ2NRTzZYbU1sZjBEbHQ0aUZXcVN1dG1iOVh1clZwM1ZEeDhB?=
 =?utf-8?B?ZHNRNExDUlJOWlpxZytySGNSdnRueDFOYzBRME1mT3VUN0V0emJJSGNIaXIz?=
 =?utf-8?B?MmI5V0c4cVlKL2h1OFVNeVlyb1dDSzFYQzZaYzQ2ZzVrWCt5Zzc4UkZNQW1C?=
 =?utf-8?B?dWgzNngyK3djeHlMaGJxTnNPMGE0bEhKbVBMb2FnNVRiek5McnRrVlh4cnNV?=
 =?utf-8?B?Z3pwUEFhWVQ4WmFKbVdLazhYR2ZJWmRycjhUeXR6ZFhoeXdSeUdkVWV1Ukl6?=
 =?utf-8?B?ZVRqUHZhOGhCRGNWWVFVamVLSXFRRmNmbEhVSHE1TWF1WEN6bk1YYmcyU1Ir?=
 =?utf-8?B?NlA0MWFrOHJBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TTlkb3RMUytoZ2hWQiszUTlFWTA1N1QxY0JMcC93Q2Z4U05vclYwYWUvRytu?=
 =?utf-8?B?QVFocFFlOUg5VFFlUlgybHBsMjZrcVZWbEVKTUNoekVUejQrM0EwOWQyV2c5?=
 =?utf-8?B?a3FySXNwSE8wYTdXd0tpalhSY1FFVEhNYVkxRUl5ckNTVVkzT05ST0tYVVlv?=
 =?utf-8?B?S2Vpb1NTUFFzeERyK0tSR01hMmY4QllPZHd5TlJBQmpaQUhYMEQ0TXZGNkxD?=
 =?utf-8?B?RDAxczk5aXY4V2E3elljZzdCWm9EMGNkb3hieFNocXMzdlZwZElueUVITjNx?=
 =?utf-8?B?THAxMGt5VGVUc3JRcnBHNFZ3UkR6K1ZTVzA5VDNCSElUOFhBWHR2WmR5NnVX?=
 =?utf-8?B?Sm4wWGNXNCtVOXNXeUZzdjYzTmNJRDUwYlY1WFJqeEV4Nzd0Nnh4QWlyQXVa?=
 =?utf-8?B?SVlrUDZ3ZUxxM1BIUGdtOXBOVFRDWVdWOWk4QmpaZW9obExoWGJqNmgyOWtG?=
 =?utf-8?B?WEdpWU9xM3R5WTNwbENKK0dPSFpKNzVYVGR4L3F3YUlsRjA5aVlFMCtOajBL?=
 =?utf-8?B?STFqaWNnNStub3c4V08xNFl0NVVna2xaRU4rTG1jSkNlNDUxOVBkcU5UajZY?=
 =?utf-8?B?c0RmY1pzN29QZTlXeXZBdEEvZXY3SUF3eVJDeVlrekVRMUFnWVpQeU9JUzRP?=
 =?utf-8?B?RWVGSGVNTkN1MGtWamhPZm5lUFZIbTcyRmtCS2hNNENhbExld0k3VFFkNjN2?=
 =?utf-8?B?Ykd0WFVYU0toTUl4NkQvYXJRRG10UmJRVTAyK2VMVWZJaHlPOTRrK0dUM2xl?=
 =?utf-8?B?aEw1TUk3ekhYVnVVdlA4ZXRRUkNUWHVKWGQyci9pS2JwY2UrTUlQd203Slhs?=
 =?utf-8?B?OWpNenhMUUFxL1ArbVpnRkZERGpBaml1TGJRQWp4QnZ1V3puTFBYK3VkMGxa?=
 =?utf-8?B?N09sS1RNUUIvWlA1MGpCd0ZTNTN2ZEV1b2VnVXdwVDBFamtMcWNwSmhMNHo3?=
 =?utf-8?B?eEJnSkdaQW13c1ZVREpMUENiWGhIMFZkRVdOa3pNZUpiZU45dXo3VFkvMno0?=
 =?utf-8?B?aTdsWnBxWnVrZW9pM3NOaDdQbHkvSHU3RXNKd1laSWVEYVdKM2dMdnJvN29U?=
 =?utf-8?B?ZXNoRkpKQVBrRjhJNHpLRU52RjY2TFpuUm03bW1DMkdkeGdmUlRkc2hYNVJU?=
 =?utf-8?B?OS9WWUdEL0RBMzN1UGF4N2ZBMXc2RmUxZjBjZkIzSTFzNHBKa21hV2ZOOEpy?=
 =?utf-8?B?ZVA1Z1E0MTFJTXFZSXFUVUlKZy9mTEZReVNXYkFKQ0diWmYyN1h1T1hpMFhH?=
 =?utf-8?B?RjFJQy9RbENJWE1IUzFHY3pSL3RNMzhUSE1rbGVITG40d0ZiTis4Vy84aXVH?=
 =?utf-8?B?dEFUdnBLVk01ZTMyQ3p1YWY5S2ZobDFFQW1DYTJua0duNi84UVlxY0VQaTVJ?=
 =?utf-8?B?cHBMbmRaQ3lKcmJ2SVVPSnA0UXlMb1BHMFdpL0cyM09qZkxLVTBrNjNEZHY0?=
 =?utf-8?B?RmxsaklVTUFyUjZEcWViWkk5TUhYQjB6M2s0aWdjNTkrVVg4TUxyTEpoY2Nj?=
 =?utf-8?B?SVE5ZDE5dzFhL3Evc1J1YU1ZNzIrQldoWXhlb0Q2bzFnOXZmcG5TUG5MWHZ1?=
 =?utf-8?B?WnRWc280TE40Z0NhWSt5bS96cENIVWhIYXh6MFIrSHd1RVhMbmozRG5pMXBD?=
 =?utf-8?B?NUx0Ly9iMGl2eGh1WUkyNkJOcWFaMFVtNzllMWRJSFl4b0UyQ08rZytsOGU1?=
 =?utf-8?B?Y3BWdXRvREhqZ2lIeWlaWU1vVDV2bjRZSFZGdTVVUk1hK1crL3pIMXlFZUFp?=
 =?utf-8?B?Y3luSW9nY0czcmlKS3lXMFlRYWdCR1JKU1NKNXU0U2lRS1c1ZzJNTUxyRnRG?=
 =?utf-8?B?aDVnM0dmcGkwaUlTZnVjdmpEV0J5UmRnSFlyakVlRVorUU8zdnN5ZVgxL2RM?=
 =?utf-8?B?Q3pRMmZ4dWJ4WFBUY1d5b0FrUkpzeitYNHMxa0JmUW5TS0JWQmNrcTBwVmtx?=
 =?utf-8?B?eUZEbS9yanhoTWZMeG5PUHk2cVpIbWNPVE1naEVzTnlXbjZNRldvZ1JBVnE2?=
 =?utf-8?B?Q1BTMVl5SFg4ZmhjL3YrUUZvU0Q1NEYzMThYQ3E2UlBqd2ZjUlc3N2dBSGJV?=
 =?utf-8?B?WFpycXMwTHNrZHN5WXVZR0hZMVlMZHgxanpxci90L05EMHlQaEcxamhOQTB1?=
 =?utf-8?B?TDl3ZlJIeHZpWDE5Y0RoQkhGQzBnSjBUWGlEcmlLbjhIQzhnMHhyUS9lbHpT?=
 =?utf-8?Q?xuo9+lk1+dnIAHvVpPPIEFg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <695BF816C05A1A41A136636D02E4BF5F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507c8178-d9e3-47e8-0923-08dde18dc15b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 15:08:30.6542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BfGpQA8vKqcg1wHuUbk25jagxv6OZ04xFS8Fy9BnFYdcZLDCkBfYG9TmNA5Brseun1qhhyhwJNrJ3y9Ri7sjKQV1lTEhSYWmw3rW813FKsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10975

SGkgVm9sb2R5bXlyLA0KDQpPbiAyMi4wOC4yNSAxNToyOCwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6DQo+IA0KPiBMZW9uaWQsDQo+IA0KPiBMZW9uaWQgS29tYXJpYW5za3lpIDxMZW9uaWRfS29t
YXJpYW5za3lpQGVwYW0uY29tPiB3cml0ZXM6DQo+IA0KPj4gSGkgVm9sb2R5bXlyLA0KPj4NCj4+
IFRoYW5rIHlvdSBmb3IgeW91IGNvbW1lbnQuDQo+Pg0KPj4gT24gMjEuMDguMjUgMTg6NDYsIFZv
bG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPj4+DQo+Pj4gTGVvbmlkIEtvbWFyaWFuc2t5aSA8TGVv
bmlkX0tvbWFyaWFuc2t5aUBlcGFtLmNvbT4gd3JpdGVzOg0KPj4+DQo+Pj4+IEludHJvZHVjZWQg
dHdvIG5ldyBoZWxwZXIgZnVuY3Rpb25zIGZvciB2R0lDOiB2Z2ljX2lzX3ZhbGlkX2lycSBhbmQN
Cj4+Pj4gdmdpY19pc19zaGFyZWRfaXJxLiBUaGUgZnVuY3Rpb25zIGFyZSBzaW1pbGFyIHRvIHRo
ZSBuZXdseSBpbnRyb2R1Y2VkDQo+Pj4+IGdpY19pc192YWxpZF9pcnEgYW5kIGdpY19pc19zaGFy
ZWRfaXJxLCBidXQgdGhleSB2ZXJpZnkgd2hldGhlciBhIHZJUlENCj4+Pj4gaXMgYXZhaWxhYmxl
IGZvciBhIHNwZWNpZmljIGRvbWFpbiwgd2hpbGUgR0lDLXNwZWNpZmljIGZ1bmN0aW9ucw0KPj4+
PiB2YWxpZGF0ZSBJTlRJRHMgZm9yIHRoZSByZWFsIEdJQyBoYXJkd2FyZS4gRm9yIGV4YW1wbGUs
IHRoZSBHSUMgbWF5DQo+Pj4+IHN1cHBvcnQgYWxsIDk5MiBTUEkgbGluZXMsIGJ1dCB0aGUgZG9t
YWluIG1heSB1c2Ugb25seSBzb21lIHBhcnQgb2YgdGhlbQ0KPj4+PiAoZS5nLiwgNjQwKSwgZGVw
ZW5kaW5nIG9uIHRoZSBoaWdoZXN0IElSUSBudW1iZXIgZGVmaW5lZCBpbiB0aGUgZG9tYWluDQo+
Pj4+IGNvbmZpZ3VyYXRpb24uIFRoZXJlZm9yZSwgZm9yIHZHSUMtcmVsYXRlZCBjb2RlIGFuZCBj
aGVja3MsIHRoZQ0KPj4+PiBhcHByb3ByaWF0ZSBmdW5jdGlvbnMgc2hvdWxkIGJlIHVzZWQuIEFs
c28sIHVwZGF0ZWQgdGhlIGFwcHJvcHJpYXRlDQo+Pj4+IGNoZWNrcyB0byB1c2UgdGhlc2UgbmV3
IGhlbHBlciBmdW5jdGlvbnMuDQo+Pj4+DQo+Pj4+IFRoZSBwdXJwb3NlIG9mIGludHJvZHVjaW5n
IG5ldyBoZWxwZXIgZnVuY3Rpb25zIGZvciB2R0lDIGlzIGVzc2VudGlhbGx5DQo+Pj4+IHRoZSBz
YW1lIGFzIGZvciBHSUM6IHRvIGF2b2lkIHBvdGVudGlhbCBjb25mdXNpb24gd2l0aCBHSUMtcmVs
YXRlZA0KPj4+PiBjaGVja3MgYW5kIHRvIGNvbnNvbGlkYXRlIHNpbWlsYXIgY29kZSBpbnRvIHNl
cGFyYXRlIGZ1bmN0aW9ucywgd2hpY2gNCj4+Pj4gY2FuIGJlIG1vcmUgZWFzaWx5IGV4dGVuZGVk
IGJ5IGFkZGl0aW9uYWwgY29uZGl0aW9ucywgZS5nLiwgd2hlbg0KPj4+PiBpbXBsZW1lbnRpbmcg
ZXh0ZW5kZWQgU1BJIGludGVycnVwdHMuDQo+Pj4+DQo+Pj4+IE9ubHkgdGhlIHZhbGlkYXRpb24g
Y2hhbmdlIGluIHZnaWNfaW5qZWN0X2lycSBtYXkgYWZmZWN0IGV4aXN0aW5nDQo+Pj4+IGZ1bmN0
aW9uYWxpdHksIGFzIGl0IGN1cnJlbnRseSBjaGVja3Mgd2hldGhlciB0aGUgdklSUSBpcyBsZXNz
IHRoYW4gb3INCj4+Pj4gZXF1YWwgdG8gdmdpY19udW1faXJxcy4gU2luY2UgSVJRIGluZGV4ZXMg
c3RhcnQgZnJvbSAwICh3aGVyZSAzMiBpcyB0aGUNCj4+Pj4gZmlyc3QgU1BJKSwgdGhlIGNoZWNr
IHNob3VsZCBiZWhhdmUgY29uc2lzdGVudGx5IHdpdGggc2ltaWxhciBsb2dpYyBpbg0KPj4+PiBv
dGhlciBwbGFjZXMgYW5kIHNob3VsZCBjaGVjayBpZiB0aGUgdklSUSBudW1iZXIgaXMgbGVzcyB0
aGFuDQo+Pj4+IHZnaWNfbnVtX2lycXMuIFRoZSByZW1haW5pbmcgY2hhbmdlcywgd2hpY2ggcmVw
bGFjZSBvcGVuLWNvZGVkIGNoZWNrcw0KPj4+PiB3aXRoIHRoZSB1c2Ugb2YgdGhlc2UgbmV3IGhl
bHBlciBmdW5jdGlvbnMsIGRvIG5vdCBpbnRyb2R1Y2UgYW55DQo+Pj4+IGZ1bmN0aW9uYWwgY2hh
bmdlcywgYXMgdGhlIGhlbHBlciBmdW5jdGlvbnMgZm9sbG93IHRoZSBjdXJyZW50IHZJUlENCj4+
Pj4gaW5kZXggdmVyaWZpY2F0aW9uIGxvZ2ljLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBM
ZW9uaWQgS29tYXJpYW5za3lpIDxsZW9uaWRfa29tYXJpYW5za3lpQGVwYW0uY29tPg0KPj4+Pg0K
Pj4+PiAtLS0NCj4+Pj4gQ2hhbmdlcyBpbiBWMjoNCj4+Pj4gLSBpbnRyb2R1Y2VkIHRoaXMgcGF0
Y2gNCj4+Pj4gLS0tDQo+Pj4+ICAgIHhlbi9hcmNoL2FybS9naWMuYyAgICAgICAgICAgICAgfCAg
MyArLS0NCj4+Pj4gICAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3ZnaWMuaCB8ICA3ICsrKysr
KysNCj4+Pj4gICAgeGVuL2FyY2gvYXJtL2lycS5jICAgICAgICAgICAgICB8ICA0ICsrLS0NCj4+
Pj4gICAgeGVuL2FyY2gvYXJtL3ZnaWMuYyAgICAgICAgICAgICB8IDEwICsrKysrKysrLS0NCj4+
Pj4gICAgNCBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0K
Pj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy5jIGIveGVuL2FyY2gvYXJt
L2dpYy5jDQo+Pj4+IGluZGV4IGViMDM0NmE4OTguLjQ3ZmNjZjIxZDggMTAwNjQ0DQo+Pj4+IC0t
LSBhL3hlbi9hcmNoL2FybS9naWMuYw0KPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLmMNCj4+
Pj4gQEAgLTEzMyw4ICsxMzMsNyBAQCBpbnQgZ2ljX3JvdXRlX2lycV90b19ndWVzdChzdHJ1Y3Qg
ZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgdmlycSwNCj4+Pj4gICAgDQo+Pj4+ICAgICAgICBBU1NF
UlQoc3Bpbl9pc19sb2NrZWQoJmRlc2MtPmxvY2spKTsNCj4+Pj4gICAgICAgIC8qIENhbGxlciBo
YXMgYWxyZWFkeSBjaGVja2VkIHRoYXQgdGhlIElSUSBpcyBhbiBTUEkgKi8NCj4+Pj4gLSAgICBB
U1NFUlQodmlycSA+PSAzMik7DQo+Pj4+IC0gICAgQVNTRVJUKHZpcnEgPCB2Z2ljX251bV9pcnFz
KGQpKTsNCj4+Pj4gKyAgICBBU1NFUlQodmdpY19pc19zaGFyZWRfaXJxKGQsIHZpcnEpKTsNCj4+
Pj4gICAgICAgIEFTU0VSVCghaXNfbHBpKHZpcnEpKTsNCj4+Pj4gICAgDQo+Pj4+ICAgICAgICBy
ZXQgPSB2Z2ljX2Nvbm5lY3RfaHdfaXJxKGQsIE5VTEwsIHZpcnEsIGRlc2MsIHRydWUpOw0KPj4+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3ZnaWMuaCBiL3hlbi9hcmNo
L2FybS9pbmNsdWRlL2FzbS92Z2ljLmgNCj4+Pj4gaW5kZXggMzVjMGM2YThiMC4uNDUyMDFmNGNh
NSAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3ZnaWMuaA0KPj4+
PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vdmdpYy5oDQo+Pj4+IEBAIC0zMzUsNiAr
MzM1LDEzIEBAIGV4dGVybiB2b2lkIHZnaWNfY2hlY2tfaW5mbGlnaHRfaXJxc19wZW5kaW5nKHN0
cnVjdCB2Y3B1ICp2LA0KPj4+PiAgICAvKiBEZWZhdWx0IG51bWJlciBvZiB2R0lDIFNQSXMuIDMy
IGFyZSBzdWJzdHJhY3RlZCB0byBjb3ZlciBsb2NhbCBJUlFzLiAqLw0KPj4+PiAgICAjZGVmaW5l
IFZHSUNfREVGX05SX1NQSVMgKG1pbihnaWNfbnVtYmVyX2xpbmVzKCksIFZHSUNfTUFYX0lSUVMp
IC0gMzIpDQo+Pj4+ICAgIA0KPj4+PiArZXh0ZXJuIGJvb2wgdmdpY19pc192YWxpZF9pcnEoc3Ry
dWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHZpcnEpOw0KPj4+PiArDQo+Pj4+ICtzdGF0aWMg
aW5saW5lIGJvb2wgdmdpY19pc19zaGFyZWRfaXJxKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVk
IGludCB2aXJxKQ0KPj4+PiArew0KPj4+PiArICAgIHJldHVybiAodmlycSA+PSBOUl9MT0NBTF9J
UlFTICYmIHZnaWNfaXNfdmFsaWRfaXJxKGQsIHZpcnEpKTsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+
PiAgICAvKg0KPj4+PiAgICAgKiBBbGxvY2F0ZSBhIGd1ZXN0IFZJUlENCj4+Pj4gICAgICogIC0g
c3BpID09IDAgPT4gYWxsb2NhdGUgYSBQUEkuIEl0IHdpbGwgYmUgdGhlIHNhbWUgb24gZXZlcnkg
dkNQVQ0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2lycS5jIGIveGVuL2FyY2gvYXJt
L2lycS5jDQo+Pj4+IGluZGV4IDEyYzcwZDAyY2MuLjUwZTU3YWFlYTcgMTAwNjQ0DQo+Pj4+IC0t
LSBhL3hlbi9hcmNoL2FybS9pcnEuYw0KPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vaXJxLmMNCj4+
Pj4gQEAgLTQ0Miw3ICs0NDIsNyBAQCBpbnQgcm91dGVfaXJxX3RvX2d1ZXN0KHN0cnVjdCBkb21h
aW4gKmQsIHVuc2lnbmVkIGludCB2aXJxLA0KPj4+PiAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFn
czsNCj4+Pj4gICAgICAgIGludCByZXR2YWwgPSAwOw0KPj4+PiAgICANCj4+Pj4gLSAgICBpZiAo
IHZpcnEgPj0gdmdpY19udW1faXJxcyhkKSApDQo+Pj4+ICsgICAgaWYgKCAhdmdpY19pc192YWxp
ZF9pcnEoZCwgdmlycSkgKQ0KPj4+PiAgICAgICAgew0KPj4+PiAgICAgICAgICAgIHByaW50ayhY
RU5MT0dfR19FUlINCj4+Pj4gICAgICAgICAgICAgICAgICAgInRoZSB2SVJRIG51bWJlciAldSBp
cyB0b28gaGlnaCBmb3IgZG9tYWluICV1IChtYXggPSAldSlcbiIsDQo+Pj4+IEBAIC01NjAsNyAr
NTYwLDcgQEAgaW50IHJlbGVhc2VfZ3Vlc3RfaXJxKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVk
IGludCB2aXJxKQ0KPj4+PiAgICAgICAgaW50IHJldDsNCj4+Pj4gICAgDQo+Pj4+ICAgICAgICAv
KiBPbmx5IFNQSXMgYXJlIHN1cHBvcnRlZCAqLw0KPj4+PiAtICAgIGlmICggdmlycSA8IE5SX0xP
Q0FMX0lSUVMgfHwgdmlycSA+PSB2Z2ljX251bV9pcnFzKGQpICkNCj4+Pj4gKyAgICBpZiAoICF2
Z2ljX2lzX3NoYXJlZF9pcnEoZCwgdmlycSkgKQ0KPj4+PiAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPj4+PiAgICANCj4+Pj4gICAgICAgIGRlc2MgPSB2Z2ljX2dldF9od19pcnFfZGVzYyhk
LCBOVUxMLCB2aXJxKTsNCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92Z2ljLmMgYi94
ZW4vYXJjaC9hcm0vdmdpYy5jDQo+Pj4+IGluZGV4IGM1NjNiYTkzYWYuLjQ4ZmJhZjU2ZmIgMTAw
NjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS92Z2ljLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gv
YXJtL3ZnaWMuYw0KPj4+PiBAQCAtMjQsNiArMjQsMTIgQEANCj4+Pj4gICAgI2luY2x1ZGUgPGFz
bS9naWMuaD4NCj4+Pj4gICAgI2luY2x1ZGUgPGFzbS92Z2ljLmg+DQo+Pj4+ICAgIA0KPj4+PiAr
DQo+Pj4+ICtib29sIHZnaWNfaXNfdmFsaWRfaXJxKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVk
IGludCB2aXJxKQ0KPj4+DQo+Pj4gSSBoYXZlIHRoZSBzYW1lIGNvbW1lbnQgYXMgZm9yIHRoZSBw
cmV2aW91cyBwYXRjaC4gVGhpcyBmdW5jdGlvbg0KPj4+IGNvbXBsZXRlbHkgaWdub3JlcyBMUElz
IHByZXNlbmNlLCB3aGlsZSB5b3UgY2FuJ3QgYXJndWUgdGhhdCBMUElzIGFzDQo+Pj4gdmFsaWQu
IEFnYWluLCBmdW5jdGlvbiBjYWxsZXJzIGFyZSBleHBlY3RpbmcgdGhpcyBiZWhhdmlvciwgc28g
dGhpcyBpcw0KPj4+IGZpbmUsIGJ1dCBmdW5jdGlvbiBuYW1lIHNob3VsZCBiZXR0ZXIgcmVmbGVj
dCBpdHMgYmVoYXZpb3IuDQo+Pj4NCj4+PiBbLi4uXQ0KPj4+DQo+Pg0KPj4gV291bGQgaXQgYmUg
b2theSB0byByZW5hbWUgdGhlc2UgZnVuY3Rpb25zIGFzIHByb3Bvc2VkIGluIHRoZSBwcmV2aW91
cw0KPj4gcGF0Y2ggZGlzY3Vzc2lvbjoNCj4+IHZnaWNfaXNfdmFsaWRfaXJxIC0+IHZnaWNfaXNf
dmFsaWRfbGluZQ0KPj4gdmdpY19pc19zaGFyZWRfaXJxIC0+IHZnaWNfaXNfc3BpPw0KPj4NCj4+
IE9yLCBpbiB0aGUgY2FzZSBvZiB2Z2ljLCBpcyBpdCBub3QgYSBnb29kIGlkZWEgdG8gdXNlIHRo
ZSAibGluZSIgc3VmZml4DQo+PiBiZWNhdXNlIHZnaWMgZG9lcyBub3QgaGF2ZSBwaHlzaWNhbCBp
bnRlcnJ1cHQgbGluZXM/IFdvdWxkIGl0IGJlIGJldHRlcg0KPj4gdG8gcmVuYW1lIGl0IHRvIHZn
aWNfaXNfdmFsaWRfbm9uX2xwaSBpbnN0ZWFkPw0KPiANCj4gSSB0aGluayBpdCBpcyBiZXR0ZXIg
dG8gZm9sbG93IHRoZSBwR0lDIG5hbWluZyBjb252ZW50aW9uLiBXaGlsZSB0aGVyZQ0KPiBpcyBu
byBwaHlzaWNhbCBJUlEgbGluZXMgaW4gdkdJQywgaXQgZW11bGF0ZXMgcmVhbCBHSUMgYW55d2F5
cy4NCj4gDQoNCk9rYXksIGdvb2QgcG9pbnQuIEkgd2lsbCByZW5hbWUgdGhlIHZHSUMtcmVsYXRl
ZCBmdW5jdGlvbnMgaW4gdGhlIHBHSUMgDQptYW5uZXIgaW4gVjMuDQoNCkJlc3QgcmVnYXJkcywN
Ckxlb25pZA0K

