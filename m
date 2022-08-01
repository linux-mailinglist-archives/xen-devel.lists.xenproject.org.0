Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0DC58664B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 10:24:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378545.611766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIQiU-0003yQ-Uf; Mon, 01 Aug 2022 08:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378545.611766; Mon, 01 Aug 2022 08:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIQiU-0003vB-Rl; Mon, 01 Aug 2022 08:23:58 +0000
Received: by outflank-mailman (input) for mailman id 378545;
 Mon, 01 Aug 2022 08:23:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=omD9=YF=citrix.com=prvs=20515f1b2=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1oIQiT-0003v5-H9
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 08:23:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 435e0a42-1173-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 10:23:52 +0200 (CEST)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Aug 2022 04:23:26 -0400
Received: from MW4PR03MB6539.namprd03.prod.outlook.com (2603:10b6:303:126::9)
 by SA0PR03MB5465.namprd03.prod.outlook.com (2603:10b6:806:b5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Mon, 1 Aug
 2022 08:23:25 +0000
Received: from MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::6502:2d3b:397c:f409]) by MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::6502:2d3b:397c:f409%5]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 08:23:24 +0000
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
X-Inumbo-ID: 435e0a42-1173-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659342232;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=NrMYq7DMY+Zy8LSRs6C6WJ98HlGn4/5BPWSOUyKYaSM=;
  b=DOtSTLr6Cdxsy6mshFL8jtz+SrbsqDmvbbXL1gWz1pn4gqMoqd/iu4Dk
   4227lszX+A4pXal7cXh8DoOxpU12v0lD2HD9N1aTVqmQumv8NawUmUcY1
   LWZlzdepZFAPuc3x9aJnyKV5Rot58kodJL1JNjKwyROiYAsSIdKGpOL4O
   0=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 77064148
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ns6v/qkfQCUfusa2Ha9oFtro5gyZJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJXTzUPfiCMGTyeopwbY2/pEwC6pLXy9FmQAVu+3xmHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk346+r4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2ktOJIf98BvWF1c8
 KIzEC1dMh/ZgOCPlefTpulE3qzPLeHNFaZG4jRM6G+cCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAI7gvN+sLb4ECKpOB1+LPtKtvOZt2DQ4NRn0CUp
 23u9GXlGBAKcteYzFJp91rz2beRwXqnCOr+EpW51vFBoXvDmVATJ0FIDFuLmsSZh06HDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsQjdfZfQ8ucQxRDhs0
 UWG9/v2ARR/vbvTTmiSnop4thu3MCkRaGMHOykNSFJd58G5+dlsyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsiOOZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:YK0DDqBM2wzE/KblHegasceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEDyewKnyXcV2/haAV7GZmXbUQSTXeZfBOfZogEIXheOjtK1tp
 0QPpSWaueAa2SS5PySiGbXLz9j+qj/zEnCv5a9854Zd3APV0gW1XYdNu/0KC1LbTgDIaB8OI
 uX58JBqTblU28QdN6HCn4MWPWGj8HXlbr9CCR2SCIP2U2rt3eF+bT6Gx+X0lM1SDVU24ov9m
 DDjkjQ+rijifem0RXRvlWjoai+2eGRi+erNvb8yfT9GQ+cyDpAo74RHoFqiQpF4N1HLmxa1O
 Uk7S1QePiboEmhA11d6SGdpzUIlgxep0MKgGXo/0fLsIj3Qik3BNFGgp8cehzF61A4tNU5y6
 5T2XmF3qAnRC8pDEzGlqf1vjxR5z2JSEAZ4Jgupm0aVZFbZK5arIQZ8k8QGJAcHDji4IRiFO
 V1FsnT6PtfbFvfNhnizyJS6c3pWm52EgaNQ0AEtMDQ2z9KnGphx09dwMAEhH8P+J80VpEB7e
 XZNaZjkq1IU6YtHOpALfZERdHyBn3GQBrKPm7XKVP7FLsfM3aIsJLz6KVd3pDfRHXJ9upGpH
 3saiIpiYdpQTOeNSSn5uw5zjndBGOgQD/q1sZSo5Bkp7yUfsuYDRG+
X-IronPort-AV: E=Sophos;i="5.93,206,1654574400"; 
   d="scan'208,217";a="77064148"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEJCNstKUafGsWo+1NufiWt+nccxd+0bGNKnKZ2yvdEWto9L2+//ZwTZI8iYW6hVIIs9aEgqQPPumchJGlxVgZdPlqhR4GC4Pv/f9gYlFa7CwhKux+NQFvmffPedugUHIzybNhR4yhEyitgvRkUBsKY19aGWOjbDImEnh8gDR186YKYqISFucL5+N3nBgjUSh/hPdZCPRA2QLI1jNBT15JzLHusmPDxLsGy+wOmd+aRUS5Hrre6GTRqDETJJDHl89LdhhrN9Nl3B+DUZaKJ2Z4InJf1rrJS60gd9gWIEHO9gfXdxC9QOlD9T2PgJYGtUw85YlxRi2KP0w9EnK6603g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrMYq7DMY+Zy8LSRs6C6WJ98HlGn4/5BPWSOUyKYaSM=;
 b=QUP6CIUj/C9DNh3PjvCJUBp9ymw5pHxvexLuDDF3OjtKWfcQ1L6Z9xKMrWCOpmR3Tql1H7/coXos4Bc7NUBs4IDhCoBtJST9XpmVfMMqcZSoiJNvayWpe6CCEuMIPELoIx82Bj4GohcA9BJYZd7Q04WH8C408pLDTu176IJow71UoGUs64Mjr9uiTWeZVnErhX9zKhrpFjD/aAlDHMTG6mJsr3HJ5VQAcG1ILDigHucfp1kGxp6X33gcs8KQJByiCvf1At2GCMC00FXV9vEJPFlnal9gbW9qmkImKEV8INEu8OGNiyXhpwJKY3RxGmvyWCUm30ZcKxR5E8BpiTudbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrMYq7DMY+Zy8LSRs6C6WJ98HlGn4/5BPWSOUyKYaSM=;
 b=U4wUz8i3qEpeloUWq1Y5t6eBzskI5ozC/vDZxxOpYENAsHoWfRKLtBnQvs5O5vvtuY/hgYiIUt88wugq4Z8nGmYxqu98DN2s9gLyHlSqEENiaES9jSAA6We7nTA+jbneXJPShoTTU9zu4SZcI8cUyhR/UsjO30cpioiObL11kP8=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v1 5/7] tools/ocaml: fix compiler warnings
Thread-Topic: [PATCH v1 5/7] tools/ocaml: fix compiler warnings
Thread-Index: AQHYo3Q92aLfQ5z7jEOjsQTVnpAyA62ZuQYA
Date: Mon, 1 Aug 2022 08:23:24 +0000
Message-ID: <67CB37DA-6751-4C31-B576-5674AACFE317@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <23dcc916bff25d0545c167833d99aa73b8a4c8da.1659116941.git.edvin.torok@citrix.com>
In-Reply-To:
 <23dcc916bff25d0545c167833d99aa73b8a4c8da.1659116941.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b779940-af30-44d1-d769-08da73971a8e
x-ms-traffictypediagnostic: SA0PR03MB5465:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Qn2Acjrit0ZW95qqMFoDz+J4gCfcmMx1Emt8PaOpMEoBmMOW95sP51HuNUYDAnI0waTuXNns9x0fjDzRS3ETq4+Q9ABisHY/IP5a0BAsQoWhQ1pBhqZyCjQsGYdv7oUo84FICjhVv2BV2Km4G2F84OYA0DLYqiEqNq9SbLVjpgbOEMe6V/drvyaPlhulBYIYzopJCi6KRlbiCXlOS/oj3TpeocI/HtgBJYd/khZwsu7FdvDsKgZuTkSoZNIQG4GXIelDsjVS4rtLerMcekNolJOMp/45sSrl/9fbVbOeDrhoAjNYuJLRI5oiJxMUUeEuNbFWc9pmt5Vaa27ozA5HVoyabRLAZbIQQtkBI7euDcgCh/SDw4yCdaBlEMjw3ZVwDWy0iUOHG69Xcp2YzCcRQV5yoVmr/LZA8yxahjzE2nopWlBqLb80Ot6xTmgBlwQuI+dqGnA5+UMU6HTaXns+P0jPe/5U4B4P5wWG+PXQ1IAYdgsIUI4sjNzEnv4x4A2rFgdXwYaqhgCSBFh1Fj95BcKWEJlZQDFFuZLcXTSwLhktUfuXqPcoqVd/Nlxljgf9lgIDDbQNX2ben/kZQyBcTbIX3kE8NagFD2UCm+hIZ2bCcYvfAofGTHmjCxErlR81Sba8HpR8dtp3AA7boU4qrc4XF+p4cVaXc4esEDOPmLy9YP9V0g9uW3PWEaor9GJ7/GYoh4RuKZDALFj0A3mnF3s/fSCBmO1kMcGgzcra3iB//OlwUpE1Uzxo2cyr9nTkJvTdFVnGY63jFPVKdsKbPyC3IkkLPoO+YGl+Al0t/f2mFCBHr9jLqUdLAakMysHhSQ+8rYBXMbHDm4rRhi9ILw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6539.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(82960400001)(66446008)(38070700005)(64756008)(66556008)(66476007)(76116006)(66946007)(478600001)(8676002)(4326008)(107886003)(2906002)(91956017)(558084003)(6486002)(41300700001)(6862004)(71200400001)(5660300002)(8936002)(33656002)(38100700002)(122000001)(86362001)(37006003)(6636002)(54906003)(44832011)(53546011)(6506007)(66574015)(6512007)(26005)(186003)(36756003)(2616005)(83380400001)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzBjTUZibG5SazdtRkFTdGpyMU5iSWsweDd2c09sYkl5TUhOR3lULzdNN1NC?=
 =?utf-8?B?WlhKSTdrOEoySnlYZjNXSmRvak1HNzhNSk1STW0zMzhrTzl6MXhWV0FwcVJs?=
 =?utf-8?B?aDVQWmYrUWErZS9FdTM3SFhDTGVjRjFzd3pFRUViN3k0eVFMVlZNaWF6bzlN?=
 =?utf-8?B?S2VlY1pXRGMrT1BuMWZVVm0vUlhFaVpuWDZoWnpOZHdjTnYwdXZSeGZ0Y0Zp?=
 =?utf-8?B?U0s5elVIVnNuN1B5TEZCMnVZRzlQdmZiQjZib2t0WUJoSytzVWJXVDgxWHdp?=
 =?utf-8?B?N1BORk9RQ2lFTmZXLzEzRStudGtUUDIxbWZ6NHp1WVJOTkdPRHJhNU1rNkgw?=
 =?utf-8?B?V01jZi9zeHVZZHFwNk4wWWVaSVVScGpOZkZrM3ZmYlNraHArOGZYVlc1cHRD?=
 =?utf-8?B?d0VzU1ZrZmVMdUlhYzNOc2ROM3ZsSjlWQ0VkUnpoUmhjMmF1c1JTYkNMVWlj?=
 =?utf-8?B?QlgyTTEzWFdXNHY1aXc4L2JYNEZjbExLZlVzcHJJREQrWjFXQm44cWRsUHI3?=
 =?utf-8?B?T0ZCTThFTkZ0VitUR0JCT01vUXd6bFZ3c0dvTDhuVGRsK0UxbjlqT0tTZHNv?=
 =?utf-8?B?WmhYY1NhWTN4MndXanVON0FkWkZtdTl3OWprK3NLK2ZXMVdCSkJLWUJwYmlF?=
 =?utf-8?B?aEQwMjRhVXBkQjVWVm9rbTdEcnUvMWtPU04yc1MzV2JER1VhdG84Z1hqUFpP?=
 =?utf-8?B?NWhrb1lKeEsxZDNjZ1RYU2FzV1ZiaUgreHlGSmZvYTdYTkJLM1pUaFdWN3No?=
 =?utf-8?B?K1lyelAvQ0cwaUdhclNtV2g5MzhuU016M0twQ0dvdDVCTCtZZ0VBc0Qybmdr?=
 =?utf-8?B?MStyaHBEYW5VajBZREJGRG9GdGdnSU1ab3M4MHRDSVY0R0ZBck8vYnp0MGd5?=
 =?utf-8?B?UGYzRit6cnZFWlFOeXoxRUtPUjc0aFg2YWRZQWZybWQvM0MwSHNZTTBhOUJh?=
 =?utf-8?B?aXI1ZjNseE5oYk8xaXQ1VzRhZVg1SStnNjNlTUlkdlF1eWhCUnlJbnlkM3NL?=
 =?utf-8?B?dUJzOWZRMmF0YXRHL2VEd0NydDllbjcxcjZWazNpaXE0YllXNkp6Wll2NEFI?=
 =?utf-8?B?UGc4bk80NU9WTmR4bFdDUkd5U3doVnc3UFljeDkyM2hLUFN6UVpOZHZHTy9F?=
 =?utf-8?B?T2szZUdoQ1I2cmY2SnNxbUNMWXc0aFZCZlRnNU1IWFN3a29IdkdDUjBYZmY3?=
 =?utf-8?B?SWtvVHhhMStEODNLTHZETExpM28rekVtc1MxeExVamJ0Nks4ZG01M0FNRFI3?=
 =?utf-8?B?S0RzZ0VEWlZPWW5GOGUwZ1d1MERwRXh2eVZXTm9Tc1FkWWFsQ2RTczg1VGhC?=
 =?utf-8?B?dTBMRG5SODFVSk1NS0FCeFo2eHhRenNFems3enpTNGNMZ0dyTktZS2xPRSt6?=
 =?utf-8?B?VzZvOFg3WUlGVldyeE90cTVZeUpQMjJIM0s4eXpqVy9LOUZpRmg1T0hnWms1?=
 =?utf-8?B?UUVaWGw3eWE2Q0RlSDdUYjduRGdDa2hvWDc4R3pFa1lhaHZINTZndmhzODVP?=
 =?utf-8?B?SGZSUllrOEY3dFRnc3hQcEViZ0Z4NHh0R3FkREF6QThGa21tLy9xT3dzNE9Z?=
 =?utf-8?B?eXlQTTU0SWtsYkxCQTc1dWExWHdKcXhIL2IvZmNWdEFPemhPSmxGNW9jN1JV?=
 =?utf-8?B?dzc1a1R3dXVUaytGeVpoOHY1bXNBMncrcDZ6VFlEVjZCczFpaXI5OUMreGpM?=
 =?utf-8?B?Q3AyeUo5TVJVa3BMVndmbWFvOVdNSzVVZkJLUVJYdk1xZXdrYkFJTDRSc3Uv?=
 =?utf-8?B?UHNhazVFOEtQK3hoMHV1NTJ1N01PaG4rbDRaa1NPeDQvOVNtbzFVWDdnVS9v?=
 =?utf-8?B?cUlCekM3TVdNeFBvVy9BZnBqak05ZDd0UHBRRjQzaWlxaHZIL0xpajhibTJq?=
 =?utf-8?B?ZUlFT0EvNXk3TW1FTXRpYkpTSERuakx4T0FSWkdnUlNmUmJ5TTQ0UlhWV0F6?=
 =?utf-8?B?bkhtcEFvUStSOXhyK1hxUW50UzNHdUIyTGxUU3psamhUUWEvMUc3L3EyY1U2?=
 =?utf-8?B?dUQ4SVV0ZDV2dE14bkl5TktqOVJEcXppaWpWNHpRWFlWQ1ptT1RERmxESW45?=
 =?utf-8?B?MDFTZ1VTMkFwVVlkUFNvQjB4WjRQMmg0LzgwTnFSYjlWQ3cyV3ltTjBCdXNT?=
 =?utf-8?B?WHBKUThYNmRuRHQxRWNqYXF5cEFQWEZSZlRGTGxvKzdPekV4NHhkNFFsUVdD?=
 =?utf-8?Q?CJ72Esa4uVSUk2avUoaONsU=3D?=
Content-Type: multipart/alternative;
	boundary="_000_67CB37DA67514C31B5765674AACFE317citrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6539.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b779940-af30-44d1-d769-08da73971a8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2022 08:23:24.8858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rK50Z7GbFZz6Z6jQYt3ihxzTdSTEwrcR7BJeigpP+2QhRQ8dFgjU0EgQ+1nNzjTjz7hqjdiUlXg/9UIUTVdkreih9cvC6nRtjBHUdS8DW4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5465

--_000_67CB37DA67514C31B5765674AACFE317citrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDI5IEp1bCAyMDIyLCBhdCAxODo1MywgRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tA
Y2l0cml4LmNvbTxtYWlsdG86ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4+IHdyb3RlOg0KDQpGaXgg
Y29tcGlsZXIgd2FybmluZyBhYm91dDoNCiogdW51c2VkIHZhbHVlDQoqIGFtYmlndW91cyBkb2N1
bWVudGF0aW9uIGNvbW1lbnQNCiogbm9uLXByaW5jaXBhbCB0eXBlIGluZmVyZW5jZSAoY29tcGls
ZXIgdmVyc2lvbiBkZXBlbmRlbnQpDQoNCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KDQpBY2tlZC1i
eTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPG1haWx0bzpj
aHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+Pg0KDQo=

--_000_67CB37DA67514C31B5765674AACFE317citrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <70A4929C2FFC62468FBD7166FE9457BF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IDI5IEp1bCAyMDIyLCBhdCAxODo1MywgRWR3aW4gVMO2csO2ayAmbHQ7PGEgaHJlZj0ibWFpbHRv
OmVkdmluLnRvcm9rQGNpdHJpeC5jb20iIGNsYXNzPSIiPmVkdmluLnRvcm9rQGNpdHJpeC5jb208
L2E+Jmd0OyB3cm90ZTo8L2Rpdj4NCjxiciBjbGFzcz0iQXBwbGUtaW50ZXJjaGFuZ2UtbmV3bGlu
ZSI+DQo8ZGl2IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDAp
OyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5v
cm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVy
LXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRl
eHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBw
eDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7
IGZsb2F0OiBub25lOyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsiIGNsYXNzPSIiPkZpeA0K
IGNvbXBpbGVyIHdhcm5pbmcgYWJvdXQ6PC9zcGFuPjxiciBzdHlsZT0iY2FyZXQtY29sb3I6IHJn
YigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250
LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0
MDA7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVu
dDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1z
cGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0
aW9uOiBub25lOyIgY2xhc3M9IiI+DQo8c3BhbiBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAw
LCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxl
OiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxl
dHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4
OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5n
OiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBu
b25lOyBmbG9hdDogbm9uZTsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IiBjbGFzcz0iIj4q
DQogdW51c2VkIHZhbHVlPC9zcGFuPjxiciBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAw
KTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBu
b3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRl
ci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0
ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAw
cHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25l
OyIgY2xhc3M9IiI+DQo8c3BhbiBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9u
dC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7
IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFj
aW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRy
YW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13
ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyBmbG9h
dDogbm9uZTsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IiBjbGFzcz0iIj4qDQogYW1iaWd1
b3VzIGRvY3VtZW50YXRpb24gY29tbWVudDwvc3Bhbj48YnIgc3R5bGU9ImNhcmV0LWNvbG9yOiBy
Z2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9u
dC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDog
NDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRl
bnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQt
c3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3Jh
dGlvbjogbm9uZTsiIGNsYXNzPSIiPg0KPHNwYW4gc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwg
MCwgMCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHls
ZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBs
ZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBw
eDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2lu
ZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjog
bm9uZTsgZmxvYXQ6IG5vbmU7IGRpc3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyIgY2xhc3M9IiI+
Kg0KIG5vbi1wcmluY2lwYWwgdHlwZSBpbmZlcmVuY2UgKGNvbXBpbGVyIHZlcnNpb24gZGVwZW5k
ZW50KTwvc3Bhbj48YnIgc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFt
aWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250
LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzog
bm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zv
cm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0
LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsiIGNsYXNzPSIi
Pg0KPGJyIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVs
dmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50
LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsg
dGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25l
OyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0
cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IiBjbGFzcz0iIj4NCjxzcGFu
IHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNh
OyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6
IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1h
bGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0
ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13
aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IGZsb2F0OiBub25lOyBkaXNwbGF5OiBp
bmxpbmUgIWltcG9ydGFudDsiIGNsYXNzPSIiPk5vDQogZnVuY3Rpb25hbCBjaGFuZ2UuPC9zcGFu
PjxiciBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZl
dGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1j
YXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRl
eHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsg
d2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJv
a2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyIgY2xhc3M9IiI+DQo8L2Rpdj4N
CjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPGJyIGNsYXNzPSIiPg0KPGRpdiBjbGFzcz0iIj4NCjxk
aXYgY2xhc3M9IiI+QWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgJmx0OzxhIGhyZWY9Im1haWx0
bzpjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20iIGNsYXNzPSIiPmNocmlzdGlhbi5saW5kaWdA
Y2l0cml4LmNvbTwvYT4mZ3Q7PC9kaXY+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNz
PSIiPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_67CB37DA67514C31B5765674AACFE317citrixcom_--

