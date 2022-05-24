Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 068AB53241E
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336167.560506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntP1p-0002cl-Pi; Tue, 24 May 2022 07:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336167.560506; Tue, 24 May 2022 07:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntP1p-0002a7-MJ; Tue, 24 May 2022 07:32:29 +0000
Received: by outflank-mailman (input) for mailman id 336167;
 Tue, 24 May 2022 07:32:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpOU=WA=citrix.com=prvs=1362cb858=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ntP1n-0002a1-Rc
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:32:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a783321a-db33-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 09:32:26 +0200 (CEST)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 03:32:22 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Tue, 24 May
 2022 07:32:19 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 07:32:18 +0000
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
X-Inumbo-ID: a783321a-db33-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653377545;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=DJPI6nT9lNiSBOnsC/zslK8lor/L3YsvuIrjuGviS4M=;
  b=EwJcV35UNOKZ347RZWm/qISH8Ukdm6f3vQZAqBKrCmnYQJJSbUPjC71I
   udgjvAr/ZqeDqyqJOrrcwoToCOZKjlv3aMJ4gd3XIVkoVY/Y9j+IkrYhS
   FyRiaI/biwc6TxTyO+EzzU3Uusi0URXkzmYVEWBpOv5cvZ4dJNFmf/8/u
   o=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 72029938
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hHB8ka6avmWM+cGsUXi/VQxRtEzGchMFZxGqfqrLsTDasY5as4F+v
 jccDWCPOqqONDDyfYx+O4Tj9U0Hup7RyYRiSVQ//yw0Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXjX1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSWcyACJLTXkdgceCNSKRtuB40Z/rL+dC3XXcy7lyUqclPK6tA3VQQdGtRd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiUo4YGjF/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IC8AjE9PFni4TV5AZ82ZLXHvzMRt2Xd9tcnGaBi
 3nB9k2sV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nMXIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YS7QiMzu/f5F+fD21dFzpZMoV45IkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLSsZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:qfk6CaBPf5rkdQ7lHeg+sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4N6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1wjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvW/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdb11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj4lLYIk7zI9HakGOuh5Dt
 T/Q9pVfY51P78rhIJGdZA8qJiMexrwqSylChPgHX3XUIc6Blnql7nbpJ0I2cDCQu178HJ1ou
 WKbG9l
X-IronPort-AV: E=Sophos;i="5.91,248,1647316800"; 
   d="scan'208";a="72029938"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2b/ws60VaLYFRTi4EnELJXWRC4/wbuMWHXsVqCZtC0/dlgZ6HaNDKOLKN4snL5U2LqbmYUN2/XwXfWgSct/FHSKjLglnOlBreUrWkN3vrBa2M4CGEcMHKCcRLMaPBD8CSGIclKsu+8XfnpqMqRxFSuHp0PiVSxKjiXCXAhjEToGFkJf1UmZUrVfGJns0Cp1plTTJjYuZi3m+aMwjRM9ADyfPhBp8jgVC9VUxuZ3KtI60B2lsBTKyKDECwyPeKqAK6DyDtKR7eCCGxI//TpRMyE9oDIqvHAgHlIz0HS60UGf8wzqrjR0Wclrab0PG/gCP4x6E+5iK3U30LQpZfrnGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snC/EjOA4P7q5xYAAD3bWY+4o6HvQJRs6ynm7sTmHtQ=;
 b=FyGcO1UKsxQ4nGw8lQwIW4duhdBai5PKr038jDwjoj55vKhxQi2cKBb3Z5E+jO6QHjYwOQ67oCGiCIdkpGkQNuNpvODlmgZqx7y8LkxuYqN9VGWV5BlAVnoJnRUfqYStckzHIH2hNxVM2EiOawLoxbrunvo3I/nEGmbWtYIQYuO6eRy9U6gwV/ZPSikvAuI17s6637vNJ4rJaxDV93tsx+S5e7AuhzwMj/eRB7l5GhSESa3Fd2ALVy4BbB3tWvROoK6emMT5C02cYvE2U2ycoLqn8qizXAaREmpyeTvD1wp68hQc1qYR9eI3MDreQ83N2QvZ3UD8MRN918xQ29QOXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snC/EjOA4P7q5xYAAD3bWY+4o6HvQJRs6ynm7sTmHtQ=;
 b=KZTN2NOedSjIm1nA6ytl9sXENIDvHpqwGgSqQ2QU5vReCwhbI49XOTCWcAbXG/BGa0nCkcE44S8Y4IXHSuo/dbgFrWvOBM3zsNPEGraEecJBLdwmuJIESTaz33TxFJfjUFuAXi7eyY1W9id+b+6N99ZvSpVJjfbbe1Gpws5ufCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 May 2022 09:32:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/flushtlb: remove flush_area check on system state
Message-ID: <YoyJ/UadvdDVWehY@Air-de-Roger>
References: <20220516143116.28602-1-roger.pau@citrix.com>
 <c7878c92-41e7-4628-34b1-1cb409335bf1@suse.com>
 <YoucK13m0y3CqDl1@Air-de-Roger>
 <4b025fee-8f7e-1849-184e-1be8fb99442b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b025fee-8f7e-1849-184e-1be8fb99442b@suse.com>
X-ClientProxiedBy: MR2P264CA0130.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8bba2a1-d217-48b3-e133-08da3d578876
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB5328EA332763579D201652218FD79@MN2PR03MB5328.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3EggFfT1fgbzQx4TUhJnK6NrC920jZNosNq9tfAB8AWGw7at8SPv54qBRiadM6V4QK846Uq6XxGT1M1ZCM+/kUjnsJpc19JttdNpPgStyjIw6EwK3fPj/5FXdUHoUlCKCk91uod38iRc7vY8ClYdK3Eial/+TAXOPtZhfnB02E1Bi8/GLobtvefkvsThN0yMmv0bGiFr/9YHGtdc+zWMuq31CfnceGKkoAl1VaU4wefdxzJZMmbyxX9CH8gfAf09llKdBbH79sztFHCfivGE5Yvw1QYTpyZaTxiMHMLQ8iOxm09bf3qVTO/B3gnho8kPQunvydSHtGfFsmr76r3JIqmNvFx4qyGKorc1vIEySKFaJzyOy2uGF/8+oii3SJNV4bCedBLmjK853ICtc+3k5lDZ+8OsoTfhU5GjIkDDyJhk9GaxG9gNd2WeX6VDcm/7R6v1c0c7E51MOf4cLdu4U60DkTd0ZqT+yJyovU41Lm3xSLCGgymnefu3mTeEIWHFQT7EUFWMAeN0KNu3bTqS8xmckR98g3d9yMWzCbY8NIQGOH9qm/JsHMn30g/cqN6IGeAg4K+XFFHE02LdDd598x5A4VoJAr4d5HBJRGhCOIDGzFo/vgSL9l3lsIbjGhb79KNhdSfAUIVXkZLdjT3n2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(6916009)(316002)(54906003)(82960400001)(5660300002)(85182001)(8676002)(4326008)(83380400001)(186003)(66476007)(66946007)(66556008)(86362001)(6486002)(508600001)(26005)(6512007)(9686003)(33716001)(6666004)(8936002)(6506007)(53546011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDZDNTZqTFR3Z2RMSGtBdE5mV1c0akRCY3BOUG56Q2ozc0NLRjVJNFE4Y1hY?=
 =?utf-8?B?aG45WXRKd0d3Z2hGUTVPYVlEOXZCb0lSaUpmYk10OTlJVjk4QXhzZHpRV2xT?=
 =?utf-8?B?RytnVjJ4a0k4YWNIZnF1TFhPRngzWmd1YTJlUHRvenViREt6aHBZK1VVUVZX?=
 =?utf-8?B?ZG5TSktPdUhjY3N5dktHc2Q0ajY2VFdMb2V4VlJGTVQzNEkranpYYThrRTkw?=
 =?utf-8?B?eGtNb1RIK25NUXk0ckVYdER5ZWZPek1uR3pNR0I5ZmxiUUFUY3NTYXhac3Rj?=
 =?utf-8?B?UTBvdTUyQ2FIcC9DQW9QU3p4cG9ybFZwalFnOEJLWStWdmhVcktzSCthazlk?=
 =?utf-8?B?Ynd3T3RGOG94MklLNUJmUDBvbjd0M0p1WWhZNVBNKzJZOUNteDZTWnN6N3V0?=
 =?utf-8?B?dm9XUENFM2RzeEwrOXhpelZPNXhyNXJFZ0s2MXJETHBaUzROMVlaUEpwL3cy?=
 =?utf-8?B?Y3ZkTUtOcysraStjTURoUDBDOXQrQkYrMlQ3cm9RQ3hXUG54S29NUnhUSUVp?=
 =?utf-8?B?WStCSWdEZlk0S1R3NDFzNkdNa0VrUm9TYVF1ZkJJUFlhZyt6bm5sRUt5R2Ns?=
 =?utf-8?B?SXBiYXFwVDBNd1BtNzVOVUNWNW9IeDk1Q1NMbzZrKzRsVloyZE94YnFvVzcz?=
 =?utf-8?B?VEVFMXJUbmxnRE9ZTzlVUEpsOXpGOFBLUGFocFcrUzdEMCtlbEVyZkJrcCt1?=
 =?utf-8?B?bFBJNTN3Mk52OFM2WkJzQ3pldXdYaUtBdDhRTTBUM1pqRWJaWExDSFh2Nzlp?=
 =?utf-8?B?T0d1d2wzME5Nb2Voc2pHdDdOWEJ0bTRKU0FmMVNJd3hlQlkrRnNNaDkzSElY?=
 =?utf-8?B?cnR0ZDUvNml3ZitjaDl4OHNIeW9EeDFvNU1GK1RTK29OdURrQTN4R0Y1OEpK?=
 =?utf-8?B?c0ZPUkZzVmt0SVZJNkh3UU1IVzNkQ0Vtc0RwYXJISWpLOUhEd21kWEFpN09L?=
 =?utf-8?B?ZXYyTjhscDlWd3dORnlmYVF0TS9Sb0lOYnZOMEI0TnNPY2c0cFluZVkzdjlm?=
 =?utf-8?B?VDMrbExVV3RKSm1nNUxnLzBzcy9Vc1U0TTVwZlFST3ZPUTRBLyt5U3Rsakc4?=
 =?utf-8?B?NEtNRzRzcVgyK3dwaTBlM1FGdFUyc0UvWWdWcDlvd1ZDQzhPblpZSk9YeTFD?=
 =?utf-8?B?eUVVbkdxYVM1cCtZcmFsbWpXTERiVWpTeTVtK0JKNGJGVUUrREJHV21lK003?=
 =?utf-8?B?cHFsWUhaWlFpWGxxVzVQTHNYSEh4cmNhbEY1SWZZclRjKzBpbjA1cllyR1Yw?=
 =?utf-8?B?V1Z2Mnh3Rk1YSW5sazFqYVpaMjZCQVR6VWJWa1VzZEZ2R0kwUXRjcDZMMklU?=
 =?utf-8?B?aG9jeGVDb2NxRTZEa3lMdmYwcEgwRU9YRVZhNUk5R1ZpSGg5VUxFTTZlOElN?=
 =?utf-8?B?aExPbXJuSVpxZjBYVXB5ak9mUDJLUjdWcU5OQnNYUWNlN1lNN1NMcGs5KzY5?=
 =?utf-8?B?eVIrS0Z3b0dlZjk0Z0VRNTl0bVpnRUhvRGFScWNrT1ZtaXBBV3pkM2pqeXRV?=
 =?utf-8?B?eUN1OS81QklZSFBRUUZLdWltUy9ML2hQeGZyQ0pMQldRZFRpMHZlcHRMVDJo?=
 =?utf-8?B?WGxUenRyU3hFbXNmbVB6YmlsajNnVElKV3k4V0FaRk5ib1hIOXVoc3FFOGV3?=
 =?utf-8?B?QXRmQUVieTVUVXR1a2pzVXdPQW5aVDkzelU3M3VObFhLVnh5OW1sbTJTTXhL?=
 =?utf-8?B?VFk4Vnk3dENNTk9jOVFLUjFsUE02T1ZTc2lSYXlHSEwyZjRNd1YrNk1JV2Fr?=
 =?utf-8?B?YUpwaDdSZk5WMlVCL0tzOXN3aHc0Vk1rbWh2a0REV0FEcDBNNUYzeVNiTHMz?=
 =?utf-8?B?dzVFaW5CVHNsT3Y4ckhrUk5OWjFvZ2FnMnpDMGVyM2lVQVhpNU9wcnYzR0Vu?=
 =?utf-8?B?Vkdpb1BmWUNOOERFRGQ3UFZFeFVPQ3RmaEFtbHlWa09haHJQUWRVWk5ja0Iz?=
 =?utf-8?B?Z3dpLy93ZXFuOGgwb1ZoU1llaUJaODdNdWZnNWF3Q3dJNWJzUFlBN2VZMTQ1?=
 =?utf-8?B?RFZOTWNIS09OSC8ySmlGTnQyVFRHSGtjMzBpdkNRcTgxdkdNcjhub0Y0eUVt?=
 =?utf-8?B?TkV3bVJxRFRkOWYvbjdYbmxRVWNTRndIYWhTWm9QQ045K0FKeW4xYzBYRG45?=
 =?utf-8?B?Zkg3cGdGVFpJV0c2YXZ4L1lUNWwxc0ViSDBtZ2VCcUpRREtabFppdmROakJN?=
 =?utf-8?B?dm5UcThHcWZjZ25MSkJhRDNJVTBCTms3Qk5XRkZoRXNsTDZrenpSTDRxSXNH?=
 =?utf-8?B?djJpR3ZVQ3cvVHY1UWFuaWZnSUdiN0FoWU1hWHM0MnZaejAyd2x1d1Uwa2RQ?=
 =?utf-8?B?MmkxZ0pzaEo3c295eEp0L29ycUZLZndyVlFSZWxjRGVtWGZhckVoNkZSRlN3?=
 =?utf-8?Q?bwqMvMgGtE6gDA0M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8bba2a1-d217-48b3-e133-08da3d578876
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 07:32:18.9162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITnMa6DB2W/ct4VKiDYxlRuVQoLFL3UgfcYRXLejD39zPRJLXUWAnLX63U4SOEs8piyMGInkiBFcoqM6Z8CQ4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5328

(trying to send again, as I've replied yesterday but the email never
reached xen-devel).

On Mon, May 23, 2022 at 05:13:43PM +0200, Jan Beulich wrote:
> On 23.05.2022 16:37, Roger Pau Monné wrote:
> > On Wed, May 18, 2022 at 10:49:22AM +0200, Jan Beulich wrote:
> >> On 16.05.2022 16:31, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/include/asm/flushtlb.h
> >>> +++ b/xen/arch/x86/include/asm/flushtlb.h
> >>> @@ -146,7 +146,8 @@ void flush_area_mask(const cpumask_t *, const void *va, unsigned int flags);
> >>>  #define flush_mask(mask, flags) flush_area_mask(mask, NULL, flags)
> >>>  
> >>>  /* Flush all CPUs' TLBs/caches */
> >>> -#define flush_area_all(va, flags) flush_area_mask(&cpu_online_map, va, flags)
> >>> +#define flush_area(va, flags) \
> >>> +    flush_area_mask(&cpu_online_map, (const void *)(va), flags)
> >>
> >> I have to admit that I would prefer if we kept the "_all" name suffix,
> >> to continue to clearly express the scope of the flush. I'm also not
> >> really happy to see the cast being added globally now.
> > 
> > But there where no direct callers of flush_area_all(), so the name was
> > just relevant for it's use in flush_area().  With that now gone I
> > don't see a need for a flush_area_all(), as flush_area_mask() is more
> > appropriate.
> 
> And flush_area_all() is shorthand for flush_area_mask(&cpu_online_map, ...).
> That's more clearly distinguished from flush_area_local() than simply
> flush_area(); the latter was okay-ish with its mm.c-only exposure, but imo
> isn't anymore when put in a header.

OK, so you would prefer to replace callers to use flush_area_all() and
drop flush_area() altogether.  I can do that.

> >>> --- a/xen/arch/x86/smp.c
> >>> +++ b/xen/arch/x86/smp.c
> >>> @@ -262,7 +262,8 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
> >>>  {
> >>>      unsigned int cpu = smp_processor_id();
> >>>  
> >>> -    ASSERT(local_irq_is_enabled());
> >>> +    /* Local flushes can be performed with interrupts disabled. */
> >>> +    ASSERT(local_irq_is_enabled() || cpumask_equal(mask, cpumask_of(cpu)));
> >>
> >> Further down we use cpumask_subset(mask, cpumask_of(cpu)),
> >> apparently to also cover the case where mask is empty. I think
> >> you want to do so here as well.
> > 
> > Hm, yes.  I guess that's cheaper than adding an extra:
> > 
> > if ( cpumask_empty() )
> >     return;
> > 
> > check at the start of the function.
> > 
> >>>      if ( (flags & ~(FLUSH_VCPU_STATE | FLUSH_ORDER_MASK)) &&
> >>>           cpumask_test_cpu(cpu, mask) )
> >>
> >> I suppose we want a further precaution here: Despite the
> >> !cpumask_subset(mask, cpumask_of(cpu)) below I think we want to
> >> extend what c64bf2d2a625 ("x86: make CPU state flush requests
> >> explicit") and later changes (isolating uses of FLUSH_VCPU_STATE
> >> from other FLUSH_*) did and exclude the use of FLUSH_VCPU_STATE
> >> for the local CPU altogether.
> > 
> > If we really want to exclude the use of FLUSH_VCPU_STATE for the local
> > CPU, we might wish to add this as a separate ASSERT, so that such
> > checking doesn't depend on !local_irq_is_enabled():
> > 
> > ASSERT(local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu));
> > ASSERT(!cpumask_subset(mask, cpumask_of(cpu)) || !(flags & FLUSH_VCPU_STATE));
> > 
> > 
> >> That's because if such somehow made
> >> it into the conditional below here, it would still involve an IPI.
> > 
> > Sorry, I'm confused by this: if the mask is empty there should be no
> > IPI involved at all?  And we shouldn't even get into the second
> > conditional on the function.
> 
> Should perhaps have made more explicit that "somehow" means a hypothetical
> way, perhaps even as a result of some further breakage somewhere.

Oh, OK, then I wasn't so confused after all :).  Given your lack of
comments I assume you are fine with the addition of a separate ASSERT
to cover the usage of FLUSH_VCPU_STATE.

Thanks, Roger.

