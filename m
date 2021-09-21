Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08374131E9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 12:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191647.341745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSdHQ-0000tK-TO; Tue, 21 Sep 2021 10:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191647.341745; Tue, 21 Sep 2021 10:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSdHQ-0000qZ-P8; Tue, 21 Sep 2021 10:45:40 +0000
Received: by outflank-mailman (input) for mailman id 191647;
 Tue, 21 Sep 2021 10:45:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s/tM=OL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSdHP-0000qT-DF
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 10:45:39 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e9bc0dc-1ac9-11ec-b8bb-12813bfff9fa;
 Tue, 21 Sep 2021 10:45:38 +0000 (UTC)
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
X-Inumbo-ID: 0e9bc0dc-1ac9-11ec-b8bb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632221138;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ynnlJo+YkYcBCozUKQbCY2q6mb4ySXXzjzM46igEHwQ=;
  b=ctcifkMJi8GB+9jElyXZ3RjD9jqOUvaQt8SZbfzG6zsM1Z8piQZALmO5
   H92Tsg7o64CPGDK0BCXGaK6162lVVSfMAC/XabUl3K2Q1Nmljxjxm27B1
   zfnA8t8b/IsXWqq0rloGc8L6jmbgGYcddLjO8TZ7YeyjCjCwpTbphkOhQ
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PORsFy2C0OWrR0iEk11lTFYMFXLA6mVPpzZEYxfIkw6pvjVpjOQLNpYEWPU92pCQdElDrdL3oT
 1aH2fKAOGlUah/KiaL+tRWte9sdVc0ZruzGRPok7xuIJR3lgpiAOejx3bdcIRLs8CLnebfijmv
 WH1Q/iUCs0bGw7KYrHOReltAg8tzR3gjTDvml/zkIOwAfPmoZhasOSh6kQXu2SlrWSRYOtXQ5J
 Cr0nKxq37filNxlZ26xFj7/dEjsIxNn84Ia2QfCbLfrJmkhgi1OroWaCdrb862rQIj5WoiQOMJ
 D1Dv273FzOYTzK1s/D7lXuk6
X-SBRS: 5.1
X-MesageID: 53199071
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mvwD4aJZMNH3E1XgFE+RP5IlxSXFcZb7ZxGr2PjKsXjdYENS0jEOm
 2oYWD+FM//bN2r3fNFyOdjk9xhQuMXQydZrHARlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM5wrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Vj/Rd+
 YhKpKDuQCYsEKvggekdXBJhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XvoYJjW9v36iiG97bR
 MchcxR2PS/iekNiE1I8LdUmsteR0yyXnzpw9wvO+PtfD3Lo5A5s1LngNvLFd9rMQt9a9m6Dv
 X7P9Wn9BhAcNfScxCCD/3bqgfXA9QvkXKoCGbv+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmM1aj88wufHnIDTDNKdJohrsBeeNAx/
 gbXxZWzX2Up6eDLDyLGnluJkd+sETQFCUMzOCgVcVUMwtzNpq0qgxLARe82RcZZkebJ9SHML
 yGi9XZl3uVI3J9Tjc1X7nic3Gn9/cGhohodo1yNBzP7tFsRiJuNOtTwgWU3+8qsO2pworOph
 3ECh8HWx+QHF5jleMelEbhVQe3BCxpoNlThbb9T83sJrG/FF52LJ9k4DNRCyKBBaJ1sRNMRS
 BWP0T69HbcKVJdQUUOSX25WI59wpZUM6Py/DqyEBjawSsEpKWdrAx2ClWbPhjuwwSDAYIkUO
 IuBcNbEMJrpIf08l1KLqxMm+eZznEgWnDqLLbiilkjP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhQfCBnWsip+5IIHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu1NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:nUWDfaA1x+GYHQnlHemo55DYdb4zR+YMi2TDgXoBLSC9E/b5qy
 nApp8mPHPP4gr5O0tApTnjAsa9qCjnhPtICOAqVN+ftW/d1VdAR7sN0WKN+VHd84KVzJ876U
 /NGZIOa+EZrDJB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.85,311,1624334400"; 
   d="scan'208";a="53199071"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCfV3RuOkIEfVXpUvswZGh9AsC6QHW3pNi8AQVQyx8x9p3o+RarByiAoGecXDjcFFW73ypOVA/BewUo0GKFf6SzEXgL6ni4PHNrSxvysJ4YEe/mwgGNbMSurjeJ5GAXltDdyM4DvDtRgfKcqlcDaoaN7PILRy8TC2/C/lN9mo2C8KpMZcWDsmUcrNRmV0BSG6FzBqJPljHFH1BgN9DJ8vDbuj00RavJX2F+4wK4ilDgGf0fHf9W+IHpC4gJS6tf7yoI4ZHbU87/ydi0FAgArkFXbbEHgSQRtJ4MQuvrmYEgKrwaKvEWazx8sbqR/kKr+sV48K5XGSs2i9vo9FQpfeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=E8xTm3XLLtFlLVUnoEW45dK7JTjoytq/BFVxDn9O/48=;
 b=SvbSFrKqk0h69lthlDaaF8JWZ8LWbbvyHlFYXblKokG4w1c3l4xuEd0kTAof2Np/PZai/JeyxQE0+NEvnDfV9RQ/D+m4bdlns9Rix/LYFdlIpW+r+1JnY2VK4wD3iW+sHonET+JOZFG/n5RMe7qSzTdWm13YnpG1JRRV1B9aTHE1xIe4GIknIGrHfl2hHdmjgNfpEJyooi1HSTKaRtmCGbWYdePuJnERXAxnHLgHayOP2dMU3au++5ayiW/cCJULFb4nIWGRpz1LNzD/gQvbNCNg1LhJNhburUAXQ9hqI6evDHW8eAtP5NiG3xsslMpgokQj0nhdndrrIVmlyLLUUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8xTm3XLLtFlLVUnoEW45dK7JTjoytq/BFVxDn9O/48=;
 b=Ue2TNXM7uRvm+S3nHk2ZjwDjJS7TTaVgea4dfh3bAcWrwaJ8VQfsel/x3Uhw73bEedkFpYM4VxYU8uJ7UewE5vPMTTrx9hIoUxxyAyySwfBJ4tVbOmDaeVb3Lh/SyDn1eCdvC9v/p4ZHcIr4fSKH3MpMMraJPmbV5VhCm0iEucc=
Date: Tue, 21 Sep 2021 12:45:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] common: guest_physmap_add_page()'s return value needs
 checking
Message-ID: <YUm3yLOfAfqrwgmH@MacBook-Air-de-Roger.local>
References: <ea5d1c22-967c-b11c-bc6f-9a8cac9a9823@suse.com>
 <YUmj3P3j6f5Gl/xh@MacBook-Air-de-Roger.local>
 <58e2e6e2-c154-f09f-193e-6bef2b42995f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58e2e6e2-c154-f09f-193e-6bef2b42995f@suse.com>
X-ClientProxiedBy: LO2P265CA0389.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67b169fb-77a0-4727-0864-08d97cecf031
X-MS-TrafficTypeDiagnostic: DM5PR03MB2555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB25551B7AA2CB1758176AC9AA8FA19@DM5PR03MB2555.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t6MexaBsTt+esdIJ0T6zaEp9k4Qem3TOqYV8czb6vR1jWwcg3N0OteHYrWi2GbK/ZWPq7og+83e1m3FejgJl9RrarGY+mUAn6pKV2F1er0QaoqXQE7Nwz0GYUy5inK8HL3nbYNsMw9BFLA36hNMlwsyg5p1t7IOTxeWfC91FjMfMMRYeB5oFkH0FdPyZ/XDVy6X28WWgzfnfsiap03wdYbRf3eXznFtxAZ/+CGiYm2TrpZG0T+VTIOx6v/igW50hlLIqyG1kJoMArcu2P9oH2OpVRiwPXno9MtuZDNZFaig7LABdodHsijZ2aE/7Kd5XrMORu34ns0jlWtYF/nst45+aAVde8GYD8w3kEln/cN8Sv03sZ3kg2Xlaay9R2WdNlHrn0e5f/t366jjqwDKbL70zde/S5T1pI/zO8EAkwjcnhHMVpkNLt4xzF0kjXZqjK3zVX05HhNNX9jBaiFWKro2SEMO3h43Pmke5eKhWfjYQHcj6qP+pOdMjgeDklLBMDltQTKspJeQtzttiB3UmVxAPUMF8WEhGTT8M+hf5fIPKI6pox/klk4DPdNroQux8r7DN9jJcgmEdHVsSE8nPWERsx6NVX+GIA1UAXwK1fpWyfW/wd5bq8YITrTIld/gWVpf0A4+4MF/W/YSKDY26AA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66946007)(54906003)(4326008)(53546011)(316002)(6916009)(508600001)(956004)(66476007)(86362001)(26005)(5660300002)(6486002)(186003)(4744005)(38100700002)(8676002)(6666004)(85182001)(6496006)(8936002)(9686003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2RQV1FJUUpnNHZVSThpWnlET2JMVUsxaTJGVXNSZktya3B2T2xlUlUyRmdP?=
 =?utf-8?B?aitFMWtFWkRKTTRHbGFuVFU0eWtvQjcvRDd1d1hValFhdFJxMEMyWUVNOHhT?=
 =?utf-8?B?RWdhNG1MTzNlQXpMaGZDa21saDZlaGhrYjB0c2RRd0dyZTNrV3Z4aFI3OVVC?=
 =?utf-8?B?N05la2lwQnA2VjZxV3NnVFpZSHhVVDFVMjdML3hQSFZFaDh3NFZJK0lpZDgv?=
 =?utf-8?B?a0FNSmVZQXpobWdoNjNBOE1uU3ZPeGhVampsSGxCWWJVVUtxbVdRWVo5Vk1q?=
 =?utf-8?B?Wldtdkl4NTJXTjJvNlNOcHI5NHpMbkw5ZWYra3l0NzNSbUdEdjAwcFJ2V3Ex?=
 =?utf-8?B?SHB6bmNySWluOUp3cGVMYVR5VlQ0QTJuQVp5S3VySC9IeW5IYzZDSWp6V0Uw?=
 =?utf-8?B?c3h5SVFmN3M5L1VxUno4eWZFK2NpWEErREhaOVpwa0JUK3d4SEZ4NEFsTXNN?=
 =?utf-8?B?OXVPYnZIdDdBWnpucGhjMHQ2L0NkcWJ2cTN1cDhYUGUvZ0hDVTZybysyWngy?=
 =?utf-8?B?VXRwWEFBcjFEZ3pOY240dExPMTVqaVpJTG0zTmxUVHdVNThpRysvWWZEeitI?=
 =?utf-8?B?YTl1UUEzdzA2WmNacG9VRFFyZldZK0lZZ1VoY1BNMDdzRFVIblg3ZWU1NGNa?=
 =?utf-8?B?bGFSd2xzSkYzSVFFMllOWDBnb0JxU2ZPekFaZy9RMS9qSGx6YS83aE54NDJL?=
 =?utf-8?B?ZmxNRGdvL2p1K281Yk5KZno1UXZOVm9hZmlFRWFESGR6KytRNFZQejFkT21m?=
 =?utf-8?B?SlhDQmFxaXNKU21iZkI3YUhRam9xSjNtNzllOE1JanB4cjBxSzhnazNaMWEx?=
 =?utf-8?B?dUlWTW1ub2U3T1Y2QWRYSDFXaURIaUJYZ3pzcEFLZFl2ZkdxdDFnK1JLc1dk?=
 =?utf-8?B?UHZBSzlVNzhMaUphRlhCcFdDc0VJbEh4b3NMY3gwRHdvbTJZcUxHcE9SdWU2?=
 =?utf-8?B?TTVWWlVTQ0tja2lNV2d1YXd5U1Zqc2cweE01MjM2RUcyWE9ZRUhXTGhrL3dM?=
 =?utf-8?B?UWkxRGloQVloeUJ3NUVkZjk3ejc3VXpYYzJlSnZvc2hOT2w1K2hQMlJCZERr?=
 =?utf-8?B?bm5seEdLSDEwLzZubStvOW1VckMxUXlncmQ3dnFla0JVZkdtcWE4VTY2RE9C?=
 =?utf-8?B?bkNIUnNtM2d5UEF5K0ZXZzhsVkFxVis1VWM4RVIrbHB0SGxjeXE5WDFGRXA1?=
 =?utf-8?B?bTJVSmh5a3hYMk00N3VHRk10Z0hLdjBOWGFHRWwwdnVKMUlhbkpuS0RYVVVh?=
 =?utf-8?B?a2lMdXRBSWhOdGxqaXJJRGgxWkZmb2NabGdoSXA3cXcxNStRY05LWVA1cmZR?=
 =?utf-8?B?WFpDVVNuQzRyQUJCNG9qME55b1o0MDZtT1ROZ2JTNEsvYldRVmhtRk5mQzNJ?=
 =?utf-8?B?WlBPSlhKT2VDNFcwVTZ1OXQrUWlyT29IcHdOeEpEajNVdmVOclpydHNtM1hx?=
 =?utf-8?B?WkJ5NmR5UDlrRnM0OFBEU3ZjSHpUVW9kTXhNUU1wclhxbWc0aWt1ancyMWVW?=
 =?utf-8?B?WmJ5MDV6aGowWTF1SGt1TGxpczFlY3FsWmNzV252TFp4bVYwWFA3cnVjdFZk?=
 =?utf-8?B?ZjJJRDM5QlVtNk1GQ2dIQlpLNERXN3lSMDZuNE5xcUZNMGx5Ni9qMjFrUlJX?=
 =?utf-8?B?dnhKSElWNXV1OWlSQS9jS0JLVlhNNXJiNi84bW5QNWc5Y3FSRkFqcUI4aUc0?=
 =?utf-8?B?SGtwRWhIRlNFUlhoSWVEVWV1c08rSTFMMzcwUDlpbTNrUm1PUHZYbkxtVWVn?=
 =?utf-8?Q?f49KFaOae/UWp+pHHw2CM+zVBIBl/wH3Jjle4II?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b169fb-77a0-4727-0864-08d97cecf031
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:45:33.4492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bII6LxbqigGKM9KDo2Eig3KXYraB48HuQMzc5GTs5nfjkZ+L2nkeTEV3+IEKejdqwAvZaxmCnmJJtqG92ndEOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2555
X-OriginatorOrg: citrix.com

On Tue, Sep 21, 2021 at 12:28:12PM +0200, Jan Beulich wrote:
> On 21.09.2021 11:20, Roger Pau Monné wrote:
> > On Wed, Sep 01, 2021 at 06:06:37PM +0200, Jan Beulich wrote:
> >> The function may fail; it is not correct to indicate "success" in this
> >> case up the call stack. Mark the function must-check to prove all
> >> cases have been caught (and no new ones will get introduced).
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks. Albeit strictly speaking an ack here isn't enough for the change
> to go in, it would need to be R-b or come from a REST maintainer.

Oh, FE:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

