Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACF85135D6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 15:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316561.535492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk4ce-0005jH-Ae; Thu, 28 Apr 2022 13:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316561.535492; Thu, 28 Apr 2022 13:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk4ce-0005hL-6z; Thu, 28 Apr 2022 13:55:56 +0000
Received: by outflank-mailman (input) for mailman id 316561;
 Thu, 28 Apr 2022 13:55:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/gZ=VG=citrix.com=prvs=110729f0c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nk4cc-0005hC-L2
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 13:55:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9f02385-c6fa-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 15:55:52 +0200 (CEST)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 09:55:48 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB2524.namprd03.prod.outlook.com (2603:10b6:3:74::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Thu, 28 Apr
 2022 13:55:46 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.023; Thu, 28 Apr 2022
 13:55:46 +0000
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
X-Inumbo-ID: e9f02385-c6fa-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651154152;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ZKfrRMDGfehBxx8jdH+CW02p0Zwoxh+fzEBPnPCTDI0=;
  b=b1XeqUaaTunAmcFdBYrt1OSADQpxKt3j/TkPFnGIegCsJwaclgJXo4Th
   Nr+iTM75r1/4pELzSYse7wLjteiU7V+WomUXy9hBzsE+Q/HKNaNSjbBO+
   IAsafC5ldM3CTxazG2CQvhy4+IsFAHYzVhK2kuUGVi2qRoHoyZ8FEprxr
   o=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 70141024
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gpNeXqDkMof0DxVW/5fiw5YqxClBgxIJ4kV8jS/XYbTApGlz0mBUm
 zBMWmvVPv2LNGvze9gjPYzg9htX6pfTm9M3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Jj0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhLz
 c9i6L6WTzwpFZ3x274bbhVTLj9HaPguFL/veRBTsOS15mifKz7G5aorC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6l+B8mbE80m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjw3yWmK2cEwL6TjfYI7TfI3DBO6YPsa4vVdeSKGtcPk1nN8
 woq+Ey8WHn2Lue31TOA+2nqguLJkjL2XKoTEqG18rhhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVQBmQsHOC+BkGVLJ4EeIg7xqW4rHJ+AvfDW8BJhZDYtE7sM49RRQxy
 0SE2djuAFRHsqCRSH+b3qeZq3W1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsH8HDjr6
 yyJqCU4iKQeiYgA0KDT1VnGmDutopHhRA8p6gjZU2Sp4xk/b4mgD6Sw8VnB5v9EJYyEZlOAo
 HQJlcWY4O0US5qKkUSlQvgLWreg5P+HMTjVqV9pA5QlsT+q/haLfo1O4Tc4OEZgNO4FfyPkZ
 AnYvgY52XNIFH6jbKsyaYTuDc0vlPDkDY68DqCSacdSaJ9scgPB5DtpeUObw2Hqlg4rjL07P
 pCYN82rCB72FJha8dZ/fM9FuZdD+8z07Tq7qUzTp/h/7YejWQ==
IronPort-HdrOrdr: A9a23:NUKg4aFalbjIIkW1pLqFYZHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsOm9LmEk5nHfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wgK7VBaM0o9
 gsCZ4Y5Y2mfvVmE56VO91xMfdfKla9Ny4kY1jiaGgOKsk8SgDwgq+yxokJz8eXX7FN5KcOuf
 36ISZlXCgJCg/TNfE=
X-IronPort-AV: E=Sophos;i="5.91,295,1647316800"; 
   d="scan'208";a="70141024"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2h/cxzUS/6rY2fO03OR8yODD+z0Ctg7He74iyD6yIo8mUHjOhug4H30AIWCDq521PmFF22bMv0pqBRYUP/mbynR1+qms+pF9gR2iQL8gVdC48yyyG4CD4N7brJA1w3g64dJhSSVpTEbiwq4MQRtVefoGQ5/XOdDVWhs+0moVh9xxAHb0u7Nq655xv1EmdZwhi88lTT6ev14opaA6tyabtQDO915yY5v8fI5/lca5QQ9SZDK9l1TNV4ClrxSfEQMCvuaomNwGtloJ2/uAQwzSv4Hgr59ieiAtV7CIcYlpYa75aGaT8j1VFANKRTLRpe6gJNhLPp/cN8bJXq2xxethw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=831BCFKGRs77SzyJAQwsYxavlgU7q1opZXsFukVE0JY=;
 b=kmZ3U+7IqQDukWr1sxmmiq1x7qsXqSjS7j2TjTlrYi9OIZpkWH63De+/yCeDNLrkabqzVE72HQ10N6JvAc9Piaw4S4I1q33wKTQZTulWRSlUGURbYmlPiZxc2+erWMw9SNd1bnhFkYrYv0s4Ob3GFuYoOfjPqeWXYzxJOECobZ+4s4rUI6eRQkMLDZw4g70G5mBg+eWkKRAH1VqjrR7jZOtqT/fQFvfd6Lgl3R89IBJGMX//ATJYU8lKcuffVPXhc6u5J8KnejInH06JXng/f9IfP0VGpqC7/Sn3tZaPyUqJjHu4Pe+hbzu2NmEz3DM22WM9prep3qrcvtwtNWw+5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=831BCFKGRs77SzyJAQwsYxavlgU7q1opZXsFukVE0JY=;
 b=CsD/qD8TV7aT/ISRtr1n+stCIbi76RiNKQ05315Sx341Axb/p2uZ4Uw2lkaWBex442uiUBIk4kxbaxg2U8pUemLsUBgRUQz0tYWzrf5Z6gorBliOeQNDDnw2QVHTPZ7EabYD9UkJPgomP7awk6nLKq9C4DT/7MaJv8P5zi62JRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Apr 2022 15:55:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 3/3] x86/monitor: Add new monitor event to catch all
 vmexits
Message-ID: <Ymqc3dtLq4yTxmg5@Air-de-Roger>
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
 <65645a9d2ada525c9ffc07dce594eeff5891b5a7.1651073086.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65645a9d2ada525c9ffc07dce594eeff5891b5a7.1651073086.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: LO4P123CA0472.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d087c89-fb8f-40ef-d800-08da291ecaef
X-MS-TrafficTypeDiagnostic: DM5PR03MB2524:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB2524A24F43528A0DE13572368FFD9@DM5PR03MB2524.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	81YNlq40R7fX/2EXkQh2R6UbKIDi0r4Nf/3fW6ro6M0LuGDWgNr6stWLGDEwageDBlF31uGAr62F4xSeehdMr2UUICS9Kk3V7D9yw5odf5wO+8KXfla5xUND9SRdhDqdlHaYiuR/U+kL6XIdSDS+5Z9c8e4+2CupGkxcDPopm1ClkVR9jwp1joHaWLrsZzSPC2fYRMvU1Pd4qIMOcZ7oJQ/5Yfqd8P6xn4zbGKicquozduaoAIaqxWL2blgokR9i+7AzEKvv5Myl08njeHLqC8q6KQu6afyYPq7CyAIX38qmlSY1MYYxm8fv7nyEoyWdR6a5Hh3PnXVDh/vyqZkKV4N37snTdi/GWkAZWWL9qByXEj4lU+Bx9fllLIzBoPftfmIqif+mjQxQEOjG2RWgkkYbn+Uv5igGH1VRyshkLIY9EmYWnKFKc68teOwmH0ftlYSPIZI0IAE1sCTqWq/bz6CRh1H2UdUgaY+dA8SekzRbML0UIbq8Bd5qmTfP1h8t5KcmczqYI29Obsfj6gIjsr7xMsQKEHTzvUTGh6om84cwxD8kq+mSvm7AuFgEwoHcF6OcuGodfemo/6K7qys+gkjGE6JzrFEQK4yTnaKhgIq7mYufraAVCkrfh5vFhAwOmAkZMv+47V3nrLZdC7Ow0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6666004)(2906002)(9686003)(66476007)(66556008)(508600001)(6486002)(86362001)(38100700002)(85182001)(26005)(33716001)(6512007)(186003)(4326008)(8676002)(66946007)(82960400001)(6506007)(54906003)(6916009)(8936002)(316002)(5660300002)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVh2cEV4aS9mMmQxakxkU01VNzVkcDFONEVhTXczSEg0d0xCN3BnamVwbTV1?=
 =?utf-8?B?a1ZMV0lSK00wRUdGczBXLzdWb1kxUHdEYkplM1k3YS9SV2FRUHZLNi8wM3Zp?=
 =?utf-8?B?NXF2T1N2enVkKyt3N3oveENwN1J4ODI5RWlaODdENW1ZSXBnWFFiMGNocnlM?=
 =?utf-8?B?cms4T3JVRGNXaHNOQzg1enlRYTVLNHlBei9tVVZ5YWpiamgwc1NCVG5jSm1J?=
 =?utf-8?B?RWt6Mi9SemRZUHpuOXkwRUszaFZzd0drb0U4bGhpZDZHNGdkdEJ0WUd4U1dr?=
 =?utf-8?B?YVIweXhuQlR4UnJWZXNFVTIzRSt3c1N0UzBmc3hRQ2VNWkkvdHdNYjRTRFlC?=
 =?utf-8?B?U0x3dGxaOEllVjBOS0FjejFlZEcyNWRZY3JWVVd4em5RTFphWGp0UVAyYXFV?=
 =?utf-8?B?SXVaMXpxRnFkNjZnT1lFc3pocGpwSlJrdVBEMGtXZ3Zmb1N5RkRGTnJEVlB4?=
 =?utf-8?B?SUR6SDZxQzF6Q0FKT0FkT0x0eFFkb3pTbHBEblJaMjkxVVBKR2ZGenZUUmd1?=
 =?utf-8?B?b3VPTGVMQzZDMTJaNnYwbmVhWDZPTm9DVUE3L2hmdW10c3ZPV3dkYmRxdUZm?=
 =?utf-8?B?YlQ0dDZ1ZmhnV0R4eG1VQTNlNkZCQ25sOG9BME81M2VFS2hRWnloQVpxNVJ0?=
 =?utf-8?B?MEZpaUh3ZFpNNlZleE1VN0h5SzB1MUZjM3RhNnJ1WmY5V3JyWVdza2dLcnpL?=
 =?utf-8?B?RGl2SEs5cm84NjBKZ24zK2JvVUFsWE5rclJtUWZPdzl3bWFjVi9wNlhmTWQ5?=
 =?utf-8?B?azk3ODluUHBvZGV5S2tmV0prZStoaCtPRjE4cmoxN0tpNXVSRTZXTUJucDdT?=
 =?utf-8?B?a3JwQ2lPUVZiOUwwMW5QRHhtSzkybmt2S0E3eWN0V0NxMG0wRkdBOWFoMm51?=
 =?utf-8?B?M1lWTmxwMG5HanNEZTJQbFNYeE5uczBSOGp2K3FzTmJLQ1R4NkdNVmxmZ29L?=
 =?utf-8?B?NlY1amVnMnZjVzJXcTljY3VkcEJNUXJhZThrZ0QyWlBWZXVaMFV6ZEdCaUtp?=
 =?utf-8?B?NGFEVDd4ZDNRbnVzalB3TTVPRVgxQ2F4Zm5Sc0twSUF3aDZQb0pETiszSk1a?=
 =?utf-8?B?aUNsQjhoQTgvOXpzRnFWUURaKzhQTlRGSkdsc1pxa2htL3NrcWkvUExmdDVE?=
 =?utf-8?B?MjUwVTFtUHZZRHNjZFp0TVd1cEo1TVF3eDRjdEdrNURQYTdJcUVpM3NZKzdB?=
 =?utf-8?B?a2d4RjZvVWhvSE9FYWdqN25vNkkyOHpuVXRGMENpbjBGdTh2S1N6Tlh2amla?=
 =?utf-8?B?RzlXcnhrQTVqZndWR2pmdmRVaHV5dDg3NVF0V3F4WXZZUjQ2QlZiQU11UWVh?=
 =?utf-8?B?YVhyUUp0TGF3dzJML1pGVDdhdnpxTXJvQzJUcVdWT1J1NzY5cUFqUS9CaERt?=
 =?utf-8?B?cTJQbXIxYWxqbjNxM0hIRThwTC9HR0p0YWpHRzJ0UTJOdjZmL2xVaVZpanVw?=
 =?utf-8?B?UXhoL2RlU2RSUXcvdWVDU3Y1VC9taXliYkJEL2hMZW15SGh2SDNoZjlyZHBZ?=
 =?utf-8?B?OGZXNEkwd0lJczI4SEhLUnlXWmoyaFhycGFRTVVGK1FmUm1qZi9MY1VkSVdr?=
 =?utf-8?B?Vjl6NEdHNWQyd1pZVzI2SFVDekdGNjdMZlNsVGFLdDB0Ynp6NmNVRUZQSGx3?=
 =?utf-8?B?c3Vma3AvVVR5ekFSbkNRRWI4RUI3ZXlUaFJYNS9EVnBnNzhKYTErTjgvQm1z?=
 =?utf-8?B?TXE5VHlJSmhTVkJFTjJnRVlsZmtWU1FPWTYrbmFXd2hsN0VqTkJJMVVkbFRs?=
 =?utf-8?B?TlNScG85dkNTWTdTQmJ2VlRRMzlsaEpqVkhueTZ6WHphUWEyczQ3QVVMbzBP?=
 =?utf-8?B?MGpxNGFCaFBWWUtSZkFET3dyRGgzQytiNXpqZENQNDhhZWtCRnVtcTdrd1pN?=
 =?utf-8?B?MEtFM1NGeEJ5dnNzcEJDSE5YVTZLdFZaeHlBNy85cS8wRXB5bURPWC83akNS?=
 =?utf-8?B?bjNWUTRXdlVHWTQ2ZjM0b3l1bWlWbFZRRUxJcEZwaWdQRHpTVExlOW5RWmFY?=
 =?utf-8?B?bW95eEo0RmNwNGdRUmtIRjMwenE0UFBiaENLOHczaUNKSXBldWZHdUh2eXZO?=
 =?utf-8?B?c0dVTjdxQ3YweHJGbllwWE1nYmx4KzZRbWs3L0IrdkJQMFdqZzRHNXZvSmJI?=
 =?utf-8?B?Z0l6SlVJbVpKY1BxK01qTVpGVmdyMWQ1L1hHV2xCaS9JSWJSUnFXbklqeENO?=
 =?utf-8?B?ZGtGVDRFUDgvL0ZIRHJRdW5JUExIV01rUGZ4M3ExdUFHZWVLYmZ3Q2ZnSkpl?=
 =?utf-8?B?TlNieVcyWFlxd0hGTDdmTUxqcW53QXoydjVxTFg4OGIrYURQSFFJZ2xkZzBD?=
 =?utf-8?B?NWxkSVZnNlpoMld4VDBaWEpYZXU3NzhUQ3FiOE9tOXFMdEc4Sjl0RG12VUdC?=
 =?utf-8?Q?Ff4qeeSiNirGk9k8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d087c89-fb8f-40ef-d800-08da291ecaef
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 13:55:45.9319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNkylKSOEdR+E7MyHg2ZXsp1+PdAHaBP3QoaaAFfiux67v8mHGzIcAsBbVy+8ejyj0F/aepiykZ05vQUdJ5hCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2524

On Wed, Apr 27, 2022 at 11:34:20AM -0400, Tamas K Lengyel wrote:
> Add monitor event that hooks the vmexit handler allowing for both sync and
> async monitoring of events. With async monitoring an event is placed on the
> monitor ring for each exit and the rest of the vmexit handler resumes normally.
> If there are additional monitor events configured those will also place their
> respective events on the monitor ring.
> 
> With the sync version an event is placed on the monitor ring but the handler
> does not get resumed, thus the sync version is only useful when the VM is not
> expected to resume normally after the vmexit. Our use-case is primarily with
> the sync version with VM forks where the fork gets reset after sync vmexit
> event, thus the rest of the vmexit handler can be safely skipped. This is
> very useful when we want to avoid Xen crashing the VM under any circumstance,
> for example during fuzzing. Collecting all vmexit information regardless of
> the root cause makes it easier to reason about the state of the VM on the
> monitor side, hence we opt to receive all events, even for external interrupt
> and NMI exits and let the monitor agent decide how to proceed.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

