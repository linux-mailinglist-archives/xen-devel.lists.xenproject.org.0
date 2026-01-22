Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE2DM/9gcmnfjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:40:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 872CB6B853
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:40:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211702.1523198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyf5-0007nY-UT; Thu, 22 Jan 2026 17:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211702.1523198; Thu, 22 Jan 2026 17:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyf5-0007jS-Qh; Thu, 22 Jan 2026 17:40:03 +0000
Received: by outflank-mailman (input) for mailman id 1211702;
 Thu, 22 Jan 2026 17:40:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viyf4-0007E8-FC
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:40:02 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 605d0bc0-f7b9-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 18:40:00 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6512.namprd03.prod.outlook.com (2603:10b6:510:be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Thu, 22 Jan
 2026 17:39:55 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 17:39:55 +0000
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
X-Inumbo-ID: 605d0bc0-f7b9-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swhnMtp4mBd9MOYp/a39kPIOyNHhMCriNcKmjQdn1AEBOpuMqccq4/AQcdjG+m49tzcYUxdQ7ANuK+EcROEZhDsS/Xd/ZT+aikZ8/tqPiR/5S3YRZjDUtdCytIAt4/xKBNpsvweA5yoc4DdeJC7NPJ1424vZGxylLPZedAEb4FOXHJAb0lIGBvsB6K3Rdh6oO5Plcx2IaiDEwVJxYEgsxpnN6L7//vLOx82ONGjJOpb6Q8nZfztA07Ni4tmMlIxKg8bVhWJB5mpfqeOe2OKSDHKU1Vga36mVOiCKLbx1quMDHNXo4dJjFv5DVIfJARdd54KkNsE9jxyR+i0NZH5TRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGFKVF0i2wWigbiwR7BNTdhzq53D/kNouGUmcPEvNic=;
 b=Upsp+ljRvQ+oAjL9NUGwha5e+cpVcgrqL4bocXjwjNoRJQa5HKXU+BL4jacOMT6dPeflLZ7zP7Sm3pJbrtekAQ0kzEEKZdR1qUDp3B4KOAWy7ZOJ3csMQh/jNciD14ZNW5NK7RDCPCL3XZQk8jRT9tB+QIb0WvGeBEjtqUeIM3IAN2Fc6XzfSko9/JjLQGJUVh6NDwAylz5h6/c0ekWJDktsHls740DGSGF6lK5W1NJhtIJKhlaKKhTLPdeEJvBX3FFtsjLyyN6IW3AOc0iGEdxE6sj30zTRnMTMG+dwEzki8M+iSHLdgYb6uGnokeAbGtzwj93p1cL6LGfQDCdaHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGFKVF0i2wWigbiwR7BNTdhzq53D/kNouGUmcPEvNic=;
 b=NrAN2psc+kT5sVu+01xBLxbiraciIe5OffCTCWgL9aKzpHbsGdSWd9eABcyqWWrMXM40kV1VchrvGbhvJGa2RSZonRlEcw+EbDXO9hXYDl3KiEiCg5qrBLShlLfU2ZGWZGEo216o6EZZgjjxYEpQeNyPoYvs3DkpGr5U2FnWa08=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/3] xen/mm: enforce SCRUB_DEBUG checks for MEMF_no_scrub allocations
Date: Thu, 22 Jan 2026 18:38:55 +0100
Message-ID: <20260122173857.83860-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122173857.83860-1-roger.pau@citrix.com>
References: <20260122173857.83860-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0068.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b369b9-4ddd-47cd-dd81-08de59dd4180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVBBaFphS1VJVGNDN1Q5VnBMOERiaHZVMUQ0aytJSHNwRDRPeStQTnBYZ0tm?=
 =?utf-8?B?eGpra0I4S2RXZXRLTmlrak1oSEdjVkVDN2lxUTkrSnRkWkpIK0ZOMWRMR3dT?=
 =?utf-8?B?QlcraGxhZ1hESlpsTGhZeWljTC9ReDNVRlRXT05zNGtJUzNpWVhvTHhTWVMv?=
 =?utf-8?B?ektodGQ1N0tlbEVBTFRaUGFVUllpTDBFNnErNGhOTnMxekEzcEZqSTNhZUFC?=
 =?utf-8?B?Q1Z3RUF0ckNCZTQvOXp0R3Q0dWI4RmNUQXdCcDFHT1JmcWhDdjZEaG1kUm5o?=
 =?utf-8?B?Q2VYTnVXMUIwS3ZuVVN2ck5Sa2tBaXBxZXpJb2lBSERkUTlKR1llL2VxR01o?=
 =?utf-8?B?SzZOdFF5N1dHejNrWllSRERZUExTM1E1dHJQblo3SEpYTzR0dW45ckRiOXVt?=
 =?utf-8?B?b1BkWDhDMmMrL1FFa3RBM1c4UU54eFEzL2hCbnhZYkM5cGJnREUybk5VYm1G?=
 =?utf-8?B?UmJkNk0rT0lFZ3l0enBaUnNrUGlMUkg0SSs4UHU5YjJmdjZ6SFhtQ3lBQnRK?=
 =?utf-8?B?dFd0WG1tWW04aFVvSEtTNW93SXBBWjFvNFNKWTByMndHZjdzdUkraDU5ejk1?=
 =?utf-8?B?ZWRKSmZyTHdKNHZ0Mnp2NExYYWFxbzYzUnVhMVFhSG92OW0zTllLZU9IcTkw?=
 =?utf-8?B?Q3JVZWlrQU9TeHMrRkJtYnZEY0d4SEpqTXRDNkNzU1o2MHdYRUJBdE5BemlU?=
 =?utf-8?B?NFkxWnVPcFoxUEErT0RmV1FRQkVEUnZ5MTlWeWw2aVkyNXRvMzdkaTVxMGVJ?=
 =?utf-8?B?ZXpQM2UxTm4zQWxOUnd2QUxhU3dFbDZnQkxhcnhRMGNoWU1LRGk3RjU1azdm?=
 =?utf-8?B?OEsvT3J2YmUxbU95bmxWWEQzeXFUbitwTzFpa2lQVzV5UUpxSVpoR1BCQ2Z4?=
 =?utf-8?B?T3BDSUpMV0h4ZGh6OGEyRVY0Q2NVemFZQStLY2ZIS1Y3aWRmYzZCWU13am5s?=
 =?utf-8?B?TEJrZjhsSzluOGs4d2EvMzNLUGd4Ykg0bC9YeHR4dEUwZUdtcjBRc3NPUHNZ?=
 =?utf-8?B?bVdVWEVnWTlkM3dJZ2VvaTUwK1NzYVVZc2ZlRDRyNVd4akN3dTB6RXh5RFl1?=
 =?utf-8?B?bmlwWGJEVngzNDNEWGpyZ0JqYklHU0owT21JR2tVVVZ1NEFPNEF0S2xaL3lQ?=
 =?utf-8?B?ZmNxSHZOYUZJL0U3NWZqam4vR01jUVB5V2dZOUZRL1c1UStMcFczQ0w1cWhj?=
 =?utf-8?B?T3BnYUIzNmJIZ0N2L0NGd0R2azlVb0RWNWlmdWtNb3lVbzhoTk52c3R2Z0Vm?=
 =?utf-8?B?UnVhaUdpblRNZlNLRG1rYmQybms4WS94S3lqalY5MHV0QVgrR3lpczdObGQ3?=
 =?utf-8?B?NnowemZ3SzVCTzZ4Vm8rUkp2M3ZhVGhrNzR6dk1YQlQzUE4zb3hUdGFyZ0sz?=
 =?utf-8?B?U01WanMyM09uc2V0bjlPeEgrRTdETDBjVXM0c1ZEMmpEUXQzdWNVcjdUazhr?=
 =?utf-8?B?MWNna3VEdFlaTWdJZWs1UmNYZ0ltbGNUK2l5OHNyVkpvT3BQaExiVnAyY0p0?=
 =?utf-8?B?NkdLeTJ0N2lKK0g1N0paa1lYbkhpSmEwVkQ5L1JyQll4Ny8xR3lMZW96WEtr?=
 =?utf-8?B?MDlOcFdNWnJRNEhRSkN4WHc5d2tndXh5bWEzNW5Cc3BGVW5GZVlNWElHU3Vh?=
 =?utf-8?B?aUQybzlPaFoxbEdES1ZkWjd6UDB5Z1NDa1V0OEJXYjN2QjZoSGlzQThxVzdY?=
 =?utf-8?B?aytwZ1FFbzcrZUwwQTNkSk9mTVFYcjA1OXphbmRrbWRHdmVTdTYxYTlHT3Fk?=
 =?utf-8?B?aDI3ZlFIb2V6amN5L0VFQ3ZsOHpVb3I0c0dsOENWeVltQmE4ODZwUUdEM21Y?=
 =?utf-8?B?anRGTi9VRjh3NGM2bGdQMVpnZVN2NUtoSHdWdW5waUtCUFpDL0RUcmVoR08z?=
 =?utf-8?B?SmJWcGNGV2JMZ2gxSHVoS1NBeGNDMnUrMW1TaDhDS1pTNGpSaVZVc2F5ZFA1?=
 =?utf-8?B?ZnorRkZxd1NxZXFmT0N1VndZaHl2QzhXM0pXNnczVXFyNlhSeFY5Tm9EV3Zm?=
 =?utf-8?B?cHc4K3RZY2VMN2RGcEFUQlZ1bjJyRExIdzhhN2lrR2MxZkpyQU56WnVHZG8z?=
 =?utf-8?B?QnhtaER0Z1RWVlF6Q1VVUDVZek02aW9uQ1I4Mm1tcTV1WnZkanR6dDBtQjZh?=
 =?utf-8?Q?T63E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTlSbXVpbUZka0cwWE1aVzhUdXhpbHhxQzVZZHF0SkFCOEhhV2FhNVR3Ni9E?=
 =?utf-8?B?aFFJenJDdnAwZlAzY3AxNUxENXovbTE4NVhlZEd6T2FuZE5QWjdtK0piUmll?=
 =?utf-8?B?UXFCaExHVy9uUVMyUWpiWnYxRGovODFnQkMvaCt3K2RRaWMwSGdGNnhTRndV?=
 =?utf-8?B?QkM1aWZLYnEzOGlwa2ZWZkVobHorNFZHSzNtdWExcVg2Y1o1aVBQU20zemJN?=
 =?utf-8?B?WlNOTzBmMGpObndwdkpmV1R6dmxGOElpYWd1ckNNT3Jod0FzZE1QOWFkVkR3?=
 =?utf-8?B?bWFnK1VGMUEvVVh0U0lzZVRQUnhwQ2xjUjhmdmo3cG1uemxvVlZxTWdJcTgy?=
 =?utf-8?B?QldFc3hudmk0NFZFY3A3U3RhVXYvVU1mL3VNT2ZlcXZyNURYb1dzbHFwVmlj?=
 =?utf-8?B?bnFWb2FVUUg1TWVTT2lXN1hQOEFEeGRZME4wUnpZSWpCdnVFREdVcGVRa1ZT?=
 =?utf-8?B?MUZZMk1TOVBSeWJwYkxDQ3hjWUxMbEVYS0FENHpyZUtUeWdYNzEzait1eGgz?=
 =?utf-8?B?ZDd3YVA5U01SRVlacVpEUStPNGdaQmt1RTB0Z1ZVRWIrNmo4RVlGOVBiakda?=
 =?utf-8?B?czgrMjFiRTBVa0dHQzZHeEpGZVVZSkpuTis0cVlFVHUybExyUi9Mam50TUVv?=
 =?utf-8?B?VzEwNHRJRUFvbzlhdzI1K3hkYWRkMkRoR3lkM0lvNXNoUXRMdDBNSlR4Q2pU?=
 =?utf-8?B?bzVEbVVxeDZKZ3JIY0paUS80T3Y1Zlk4WHBCYmk0SkdFVEVQMUpOTlYyTkdP?=
 =?utf-8?B?RFlPQ1E3Q2VYWWVQZDA3ZUVIL1Z2Zm9tSmJGZzkybHRuMUZ1cUtGTUxBWi83?=
 =?utf-8?B?UG84RFI0Z0xoLzZueVNRZEZ4U0RTWHJkVXhOS2lDdzdDZ09RVDNaK3NYSTNj?=
 =?utf-8?B?THpIMkZZYzljUVlnbkh0NXI5bkFTamk0VUFLam9IZlZSLzdsaFE2VWdNdVNC?=
 =?utf-8?B?MjQ3cHRGN3V1OE02bjF6dXozbkJweVQrcThaS2ZydERMaU5TVzBnWFFmblM2?=
 =?utf-8?B?Y2xtRlJ2SENjcDlOdWJyUENIY0RJT1R5R3FlS1JpY01NYzhLUllLMTh2akpE?=
 =?utf-8?B?ODlKemhBRFV1bGVmQlFEK2pIU21sQlRBWEJKZzZua2N3WStiVThsT3RudlUv?=
 =?utf-8?B?dTh5bWF3UFdmVlVKWENaNXFldFhxL0FkTDArTXpuQVlEZVlVKzVzUkVSekFO?=
 =?utf-8?B?TUhsNnEwOEo5N3ZrQXNJZ0FqaDNiY2NKajNWOXZMMmtpb3l5eW02VHRoZ2Q1?=
 =?utf-8?B?QnhJS2kzQVBva2JrSmdDMkEzWGNJb3Rqb0pFZmxseWpoSlpHd2RNS0g3VmtX?=
 =?utf-8?B?eWFJaUt6dkpDOUFrY3JNZUk2aWtVcUM2OWJuUU1jNHNYeEJBS2c3RGYwbjEx?=
 =?utf-8?B?bUxHNTZUUk5EbTVkZ00zODZudGNIZ3MxbUpzcCtJK2xMSElBMjFVN015SnA2?=
 =?utf-8?B?QmJ4b3ZxQytiT1ZPL1EzOFNGOXc1dDB3WHI0RzVOcm9YeGo0NlQ1UkVBam9X?=
 =?utf-8?B?eFpINGIxS3VpMHBFUExBUktwbnF2NWIyNFlpVndyT3FlTVRXbmc4b2VOb2Ny?=
 =?utf-8?B?V3liTHNNRGMyaFJNWDJ4T1E4ZkhOM1luSGJpSWpCZ3oxNjlEaDU0N3hnR3Z2?=
 =?utf-8?B?SjJhYmx6MmsvZlNDK3ova0c3SEhCeG1PNmxCNFdVREhvTmVtK0xGSmNrSDlP?=
 =?utf-8?B?cWh4enNsc2J4Z2VNeC95UHdRM3c4M1B0U2pwY0pjTWFSVjB6OThJRE9DM2NN?=
 =?utf-8?B?Uk9SWkFQd0pZblJDNE5tUUM0MlhPM1FCODdsRVh5WHA1UWVMNmc0aDIvOWll?=
 =?utf-8?B?OFJFTlVDMkZiRC9ZZEQvM2FEQ0FEbmJ3SjN4cFJIUmpTd0hzbzM1K2VxU3Jk?=
 =?utf-8?B?WktkVlZyOGpXVzI5SUZwY09ETmpUemd2czVzWW1KVmJRRXdzSTEzTk82QmJL?=
 =?utf-8?B?M3F6YmxodXM0M2prMGpxZ0M2dEpPL0hOR2crcmthc3BjL1RGQ3ZBMFhBWmhS?=
 =?utf-8?B?WUhDL3cyVDY1R0o5a3lySUZlakIzaTNacTh0V1pTMzZhejBlcW4wRytWTnZR?=
 =?utf-8?B?ZUE2VU1mWjR6Q0IrVkVWNlR3eGJ0RWVISm9qRktGOTB1RW5LNlZreEY5VWFn?=
 =?utf-8?B?Yms2YUxKV1NPSHRGSHE1WldLa2d0MnVOc05HcTVtTytxOXBXZGdmdVdLSDl5?=
 =?utf-8?B?Z1RkcFByeTBrWVEweTJHWE9wckNhb2d1alJFR29ZVllUSWp5dlR6VHFzSjVO?=
 =?utf-8?B?T3lYMGtCYmJGVzNSWTlsSEV0TFUvYW9tK2RLeWNmUk0rMkxRV014VUhtak5Z?=
 =?utf-8?B?M0VJMXVWYTBFZ0Z4eGNpekFpY0ZNblc0TWpKNUtQdndBTzVwNGhudz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b369b9-4ddd-47cd-dd81-08de59dd4180
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:39:55.5796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IcdtF5OxMusp9lE9Kl32pvbM/XO1PBXCwMUJQnl5SsOt0XUCyCoLARd/DPyIMluFQmrdka9lWDV6icBZQNcdmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6512
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.884];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 872CB6B853
X-Rspamd-Action: no action

The logic in alloc_heap_pages() only checks for scrubbing pattern
correctness when the caller doesn't pass MEMF_no_scrub in memflags.
However already scrubbed pages can be checked for correctness, regardless
of the caller having requested MEMF_no_scrub.

Relax the checking around the check_one_page() call, to allow for calls
with MEMF_no_scrub to also check the correctness of pages marked as already
scrubbed when allocated.  This widens the checking of scrubbing
correctness, so it would also check the scrubbing correctness of
MEMF_no_scrub allocations.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
After discussing with Jan I've deliberately omitted the tag:

Fixes: 0c5f2f9cefac ("mm: Make sure pages are scrubbed")

The intended approach might have been to ensure the caller of
alloc_heap_pages() gets properly scrubbed pages, rather than asserting the
internal state of free pages is as expected.
---
 xen/common/page_alloc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2efc11ce095f..de1480316f05 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1105,8 +1105,7 @@ static struct page_info *alloc_heap_pages(
 
     spin_unlock(&heap_lock);
 
-    if ( first_dirty != INVALID_DIRTY_IDX ||
-         (scrub_debug && !(memflags & MEMF_no_scrub)) )
+    if ( first_dirty != INVALID_DIRTY_IDX || scrub_debug )
     {
         bool cold = d && d != current->domain;
 
@@ -1119,7 +1118,7 @@ static struct page_info *alloc_heap_pages(
 
                 dirty_cnt++;
             }
-            else if ( !(memflags & MEMF_no_scrub) )
+            else
                 check_one_page(&pg[i]);
         }
 
-- 
2.51.0


