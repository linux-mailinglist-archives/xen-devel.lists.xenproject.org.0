Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BD25A7B80
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 12:40:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395619.635411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTL8g-0004oJ-2F; Wed, 31 Aug 2022 10:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395619.635411; Wed, 31 Aug 2022 10:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTL8f-0004kE-Ue; Wed, 31 Aug 2022 10:40:05 +0000
Received: by outflank-mailman (input) for mailman id 395619;
 Wed, 31 Aug 2022 10:40:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fS8T=ZD=citrix.com=prvs=23534f77e=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1oTL8e-0004T4-NE
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 10:40:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43a440d6-2919-11ed-a60c-1f1ba7de4fb0;
 Wed, 31 Aug 2022 12:40:03 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Aug 2022 06:39:55 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by CH0PR03MB6033.namprd03.prod.outlook.com (2603:10b6:610:bc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 10:39:53 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::50e5:dec2:1f40:9648]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::50e5:dec2:1f40:9648%6]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 10:39:53 +0000
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
X-Inumbo-ID: 43a440d6-2919-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661942403;
  h=from:to:subject:date:message-id:mime-version;
  bh=RbypfvSe/qwXhW5r8PNd/F0H0nVjEQbWpEmj+ZZBBFk=;
  b=Sy3BsUJLQDwF6hYLHJMV/HUxeE/S+6sgfzIYyyBj6If9bB/BzuuxvLz5
   8lWH7OjnJGKX1TDKMve+OMrDxx+OHPUkRyuW9oANMkvb7EaBDztN7D05W
   vekpubHK3NGlkZnoAcwq5sXEMdT0BOpf//nI4kznq85N8XgdzsOInIBxp
   M=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 79454469
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23: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
 uMok55CPuxlkbk=
IronPort-HdrOrdr: A9a23:HYap7a8woo3FBYjppTZuk+Fbdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKRcdcKO7SdC9qBLnhNdICOwqUYtKMzOW3FdAQLsC0WKA+UypJ8SdzJ876U
 4IScEXZ7PN5DNB/KXHCXyDYrMdKa68gcKVbInlr0tFfEVPUeVN/g15AgGUHgldXw9dH6c0E5
 Ka+45uuyegUW5/VLXwOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxYlVS9Vy7tKyx
 mJr+W53NTujxiI8G6T64bh1eUWpDIn8KoCOCW4sLlbFtwrsHfqWG0uYczBgNl/mpDW1L9jqq
 i2n/5nBbU515qZRBDJnTL9nwbnyzog8Hnk1BuRhmbiu9XwQHYgB9NGnp8xSGqs16Kx1OsMqp
 6j8ljpxaa/Nymw6RjV9pzNTVVnh0C0qX0tnaoaiGFeS5IXbPtUoZYE9E1YHZ8cFGaigbpXZt
 VGHYXZ/rJbYFmaZ3fWsi1mx8GtRG06GlODTlIZssKY3jBKlDRyzlcexsYYgnAcnahNPKVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijXTRfFIAupUCfa/WE8SgLwQrLMkcoIDbuRCeA1JbMJ6e
 r8eUIds3IucETzDsDL1IFX83n2MRSAYQg=
X-IronPort-AV: E=Sophos;i="5.93,277,1654574400"; 
   d="asc'?scan'208";a="79454469"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACzIFOrmhYvdTKXWXVJEPQL5BhtafBqZ9qIKdKBR2Qo9Tg5DOzYtkkX0ejnspbJayJjKneDM2GOoghHxS/sNqbW/48NqAUfyE2/UVzKtW2n/LA/7kAiNgLyNGKAO/YMtpzeyMH0pp9qbusaYOjrwD4sB/KfLgNXd1Dbhtu9Pf6KUNbAzp5L+G5WSbg3BT+mcVvxDyfT7rch5UIa+UQoHKVhljn5+HYyGxJRWCQXmG0h6K3FVyHAzPjs+Jwlcbn1PykoWV+CQCeUl2rEd+cFVt4yE0SB1/YkBEioIKzNf4LQtIPZ0n98SJWmcrLNs7YukmwntCLVLuLtFhUOY3P/9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAXDigcPKu7nO1L8SUx+9hS7tUwfxKgYboZotJ8hdUo=;
 b=Vq0ylY6qKlLE5mT5ezg0lSb4OC0iBz9DMo8Z4JBu2FgJi4wqfIklLwj5Hkm3GWLUVg/qTHc1LHiz6zyNIXbr+lYYvPQQS8fRm9I6B8jHhN+tTpdSNSV0EAynhyGPsjz4LGTh0skRWBFIltH1V7RJE8MkfiLGaYbzyYns6eVkfLOoiMWh0j3WCYMaf8k1ETHKckp9V3YN3SVcZPC4I6/vsAgQcW/+KLVxa+HDO2hpmu0bpKYJtSbJ52S2UdvUlmEqsXpjQzTn6gwYVNAt9UdaK+6Y7GsL6nHAlwY4kb7zPRE1OVLkeXuuWqNHTVYK8M0ucDvcTWTscIecwiNzQO91Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAXDigcPKu7nO1L8SUx+9hS7tUwfxKgYboZotJ8hdUo=;
 b=a/xuOIaD2uZ+AlLP2c77T+jRwacRGyF7AdTmrWdF0F7gW9NZJn5g+Nm/+skwq4e6EG8N/bou8b8/H3NoKxKx58i7IARu7Kf68cKwYReh+0mhbZoTR8LWqHvSdTqU2qjSvdr/MblnvpIXEE18NURaLV/uKrcRM+pI0PyzfedlKC4=
From: George Dunlap <George.Dunlap@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel
	<tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>,
	"daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Christopher
 Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>,
	Kevin Pearson <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, Matt
 Spencer <Matt.Spencer@arm.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, David
 Woodhouse <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Ash Wilding <ash.j.wilding@gmail.com>,
	Rahul Singh <Rahul.Singh@arm.com>, =?utf-8?B?UGlvdHIgS3LDs2w=?=
	<piotr.krol@3mdeb.com>, Brendan Kerrigan <brendank310@gmail.com>, "Thierry
 Laurion (Insurgo)" <insurgo@riseup.net>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Deepthi <deepthi.m@ltts.com>, Scott Davis
	<scottwd@gmail.com>, Ben Boyd <ben@exotanium.io>, Anthony Perard
	<anthony.perard@citrix.com>, Michal Orzel <michal.orzel@arm.com>, Zhiming
 Shen <zshen@exotanium.io>, Xenia Ragiadakou <burzalodowa@gmail.com>, Henry
 Wang <Henry.Wang@arm.com>
Subject: [ANNOUNCE] Call for agenda items for 1 September Community Call @
 1500 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 1 September Community Call
 @ 1500 UTC
Thread-Index: AQHYvSYAMes/qULhNUC+MY4JIaI2uw==
Date: Wed, 31 Aug 2022 10:39:52 +0000
Message-ID: <6E458E16-CC67-4D88-90E4-7AE553AE31B3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 503737b3-3d6f-4c09-cf3f-08da8b3d2365
x-ms-traffictypediagnostic: CH0PR03MB6033:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 C7OXNXQFolyXRphKA2FWjYAukK4b47ViaUuACN20SAk7gQzZZYwdto4/Hi+Y6J4LJo86Hw+AIRF9TvJdp4lKDuginacka45Oas4R1KDJzJOv5ztvyH3ZTpX3bHh0UAL+8YIKdi+gD8ne9DCxDAl/9VXqH7cC7dBx7uTtBw5GArtf7iX3ZXuthww8TzGDoRQBRJ/krMoiyXvgricsH55W4KrMQe/CKLLPZoXj4dBHULA6jIHANcdLiSKAbcjnRs3FAbUuMZgBkGrdYhMlReM9uqhGNB6l93UsDQdx1N4HdkGN2q5TFLWRS9Pldg6eiK0FJlJQe4t9uyJfBnATvPxTGP9Wilv7dSlm2ZN8ayQjI1Hr9LzqcX6LsUQG3VWWW/KI0cVcrWBIHvo/Kfy1/1iA+fuEpdXomfwd1rh5A29dZ3HEYUYLKM6//TpPJrEDPQsGcVtx46U0T50rGsclWJTW+rVW2HhzGfWovQnxnp76IlqeQ0DNaO7ZIkc1gFefX7OWknCNbjQuNY42c5XXJ7Yr2qhxUU1SEWVDA4TaW15aJ5WM0WdaoovinnBw+tddd/Yc/mKPCI6FNVOkIAN29M8hjDnHZvR/vMkGEjFhYZEE//3dmX3GtVGXyf0qw3rdTgcMqQFdt8iWmJaJVaOydCP+0WYkW9bjfkm1j2zV5QS1tCQ1K2K6qdv2QPfZBX8HPB9oKQvXBFI/FWlFiEO5NZeEBhUKVZPBCbksr2RLv0cTNkWAeVAvhaG4RJ56Qf0KjNWCQJFSheb/1hETVrZrFc5AyqkVp1uNW/n5qylA45vak7S3ddjQtX5g+LBncf+xEUZN6mCJskIqxF+yqIYXAUMdrXsJVDAfnBIagpdYQ6tRd06dnWbOc9O9MGEUx9e9PHIQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(186003)(6486002)(478600001)(2616005)(83380400001)(966005)(122000001)(2906002)(38100700002)(316002)(99936003)(921005)(36756003)(38070700005)(5660300002)(7416002)(8936002)(82960400001)(7406005)(6512007)(41300700001)(71200400001)(26005)(110136005)(66946007)(66556008)(66476007)(6506007)(8676002)(64756008)(91956017)(76116006)(33656002)(66446008)(86362001)(221023002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R082L3cyYm9yejNaREhKMzdEQmprME82bmpwQUhBUHhHbXBMYVF4bkNKYTJR?=
 =?utf-8?B?R3JmU0pHbGJ5VTIzeTFkb2QxUmZiT0NFZFNWZHNaNGg4OExTWVUxVllPd3dU?=
 =?utf-8?B?aktwUERlczkwcTk4K3YxanlHR0JGdk5oVGt2R2JkYUNuZFhPWjBMNUxVQjQv?=
 =?utf-8?B?NlhRYlgvYzFKMCtvSnFyR3E3MXBHbEsyelpNcFpVYytpdURQelpLMkpEc1hy?=
 =?utf-8?B?WTBkU3RGa3ZPakJNTGFsWFRLYjVXdTJMYVNlcHVUTUcrb3lTNWpld0phR2ZH?=
 =?utf-8?B?ZEdsL2pBUFBlMzNKS2tuN2R0YzhOc2QyNVhjcElHbXhpRjJZbU16d1dqUncv?=
 =?utf-8?B?bVhXUkl0dGRBeENGZFIxVnhUay9hWEltU0xqODM1T1JsT1VteGoxdkpuWUgz?=
 =?utf-8?B?c3ArN082ODl4NmoxUmdxdE5JRG1DRUxPdkxpa0VaTkZGem5lU1lwZURCNWw2?=
 =?utf-8?B?RlRCRVhRYTk0NDBsTjhsMXd5Njl1OGl1aGg3VzNnU0RUSUhpZHVnMDUwUmFz?=
 =?utf-8?B?SG9NdnhaOG1vSVdwM1BlbHMySUZkWVptZmR0Z0pHSmtqTGMrMFVSWEV2cXhj?=
 =?utf-8?B?YW9iRWFwbkpRUHcwS0s5ckhMbitRaDlxWHMzanVGUGl4L2NkVDhERXBONTZy?=
 =?utf-8?B?WEVSZldPeExoVXZNTllUUFR0T0VheUo5TUdwUzNPYW9USjhDQ0JDMjR1SEcv?=
 =?utf-8?B?eGtKTk85RGFuOUxHZEpZKzZ3N2svRzk4QTZFMVMrdGVOcUh6b3JVZzBWVkJL?=
 =?utf-8?B?RXUwRHFtRURRdi83YnVOU3BuVUxmeDI1TjRFTGVsQjd4bWZUMmhiMnBhQjk5?=
 =?utf-8?B?ZmMrMWpzajJvek1aem9SeUswajVweTJ1YVBqTm1sRXJDZnMzTjBxUUFNclkw?=
 =?utf-8?B?clBJeDdLTjFMZ3U3N0REN0hwN0txN2oyL0FHV0NxcmRDRjh1TENiMVQ2OFFr?=
 =?utf-8?B?bU8vWkhCOVdoQ1RGUkc4OUxqN3dnSUZWYno2QW9sbHJyNGgyWko0WWZpamxS?=
 =?utf-8?B?aTNhN2FqZ1gvQXV6SVFka2JobitvN2JZMUJYUFZJbVh2Y2dpUEhxYXozay85?=
 =?utf-8?B?dW5QbkxiQXcvMW90b240NnlDV0U1MUYwMzgwUkJPdnphMTI1UnZ5Ty92QUxs?=
 =?utf-8?B?OHY4SEg0VFNMVzloSFRERUxFZWN2M0x5STc4S3ZYTUw0RzBpN255U3FkL1py?=
 =?utf-8?B?YSswQ0JkS3RPbDBsZERMQjY2c1lYZFNpaXhOdmlHcVJhRGMzWGs2bE9mNFdX?=
 =?utf-8?B?OTlDNjR4VC9tOXpKaHVudU5hSzZQZWtQVVZNM1dFS29Sa0JlZ2syQy9aSTBo?=
 =?utf-8?B?YW9GdUlncVNyZFlZVkRRT05MYUV4WC9WdGorY09NSU1IcjFtcDk3RUJaa1Yr?=
 =?utf-8?B?TEdHNUpWYk5SSWx5NU1QWHJlL3JsblBhZnRXbW5kN2gwV1cxem84T2o1azY0?=
 =?utf-8?B?SHhtcGZiVmxiL0psb1lSRnN6OUV0OENJN0VpWVU1VEJHVzF6QjIvZVZSUGFo?=
 =?utf-8?B?Y1J2QTgrUUo2aS9rZmFmc1pnRnFTSTNqTEUyQ0VSY1dkYUdDZTBpejA1dTBS?=
 =?utf-8?B?ZWVQdVNOSVhnamZ0TkgyVENDVkRRdytPQXBaRmwyaU9kbXNubXUwU2NXN2lp?=
 =?utf-8?B?U3RualpqUlNSZXdVanptWFh1ekFRTjFLa1VjUkorZHIyV1BNVjcvMDdXTkxq?=
 =?utf-8?B?ZXo5TjRtT2F6WWFzbXUrZzdUL3NQMkh4Q2J2emp1VUFhc2F6ZERqcXRhL3Y2?=
 =?utf-8?B?aml3N29LcU1jMFRkOW5IOGlGRWlpajNsTldBZGI2WW9NYU5oSDlZOVp0UzlK?=
 =?utf-8?B?NTNQVGh5aWx0MEpiRWlLSnh1MXRXRW03ZS9zZVhOODVJNHBsUlJDOXI0eVJJ?=
 =?utf-8?B?OFNnQ2U4VmNlMXpsWmorUEF3a0ZoTnBud0dpa0NUak1CdmpwT0J1S3NoQ1ox?=
 =?utf-8?B?cjQ2cUNoY1lxZXFjb3F2SWJ0cUpzSlIyUWxEY1lCdmhwRmNiaU9Na3RlWjlX?=
 =?utf-8?B?RnM5a2NQci8rYXU1K1pqSGVDTis1NnNFa1N0d2xsT1JidUVpc2RiTWpUWXFk?=
 =?utf-8?B?TGJxYUczU1ltdUQ4bnFTMk42ak5MUEZDbkoyYXV5RnBFWFFOQ01JQ0FjeVAv?=
 =?utf-8?B?b1dQeWE2Zit3ZVQ0YllKeHV4eHJldHgxRy9ad0pIcmFFYWd2QXh5ekxRVG1M?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5909A141-7543-4009-AE8A-2AB2E5CB7961";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 503737b3-3d6f-4c09-cf3f-08da8b3d2365
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 10:39:52.8861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S51IwbIa05+F2qzLagdEGsVGo1NyFt1Ht/4jHb4IMZnvmqnzrmjqF9qFkJsPhBCdUyys1aNbOCa86glco/hs2a4wnc/0329fkLRAicCUdkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6033

--Apple-Mail=_5909A141-7543-4009-AE8A-2AB2E5CB7961
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi all,

Sorry for the slightly short notice on this one.  The proposed agenda is =
in https://cryptpad.fr/pad/#/2/pad/edit/K9haeEkKAwD86Oyyd9CcvsFD/ and =
you can edit to add items.  Alternatively, you can reply to this mail =
directly.

Agenda items appreciated a few days before the call: please put your =
name besides items if you edit the document.

Note the following administrative conventions for the call:
* Unless, agreed in the pervious meeting otherwise, the call is on the =
1st Thursday of each month at 1600 British Time (either GMT or BST)
* I usually send out a meeting reminder a few days before with a =
provisional agenda

* To allow time to switch between meetings, we'll plan on starting the =
agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate =
time to sort out technical difficulties &c

* If you want to be CC'ed please add or remove yourself from the =
sign-up-sheet at =
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

Best Regards
George



=3D=3D Dial-in Information =3D=3D
## Meeting time
15:00 - 16:00 UTC
Further International meeting times: =
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2022&mon=
th=3D09&day=3D1&hour=3D15&min=3D0&sec=3D0&p1=3D1234&p2=3D37&p3=3D224&p4=3D=
179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall

--Apple-Mail=_5909A141-7543-4009-AE8A-2AB2E5CB7961
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmMPOncACgkQshXHp8eE
G+1k1Af9Fw/5e2SlD6Rclb3XKoSbvuHmlqrYYhSruWYU3GAAjUMHBhhoAFDoTHvu
EWAl2CCB7GH14E5HieX3q7Wm8D0tzq8lj2dcwqcHF/UZBtkKQIf98EQB/pFH0mAw
seVSG78omtNyYEI9Bd3TtdP0a8PsQrlq7CstdfsqqKR90AlUz7EYpSyfKXt4GP9f
JT2GAvUSGePjWorPiFJK9hckmp8CB0ebPytUFEztokM4dXJlQg7O36RipMYQUECf
yadyOgKK5i0yzWY+5VBMs3RDSXjVz6NKeOCsueLenIwxpNF7u1fXAgMv6kWyxWYC
xWzhwC1SndsiR9YgJnlAitxI2bQq/Q==
=rPpe
-----END PGP SIGNATURE-----

--Apple-Mail=_5909A141-7543-4009-AE8A-2AB2E5CB7961--

