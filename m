Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA124F7C1B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300598.512832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOjN-0005b8-Jg; Thu, 07 Apr 2022 09:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300598.512832; Thu, 07 Apr 2022 09:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOjN-0005Xz-GQ; Thu, 07 Apr 2022 09:47:09 +0000
Received: by outflank-mailman (input) for mailman id 300598;
 Thu, 07 Apr 2022 09:47:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qRyv=UR=citrix.com=prvs=08953f4ff=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1ncOjL-0005V6-Ek
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:47:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae627908-b657-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 11:47:06 +0200 (CEST)
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
X-Inumbo-ID: ae627908-b657-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649324826;
  h=from:to:subject:date:message-id:mime-version;
  bh=P8w9wCw3Z+Rdnf0zFn5NGbSsJv1PG4q1IOZhGUUEFdM=;
  b=CVLCQubYrWQT3ixl/VAGpL0pzrNaDc4yxn2KfUM36MvhFAkulMFz8hWL
   w7rvb7h9lOlVcR9PBjwa+/7IirArw5OLj/168Gat7UMOGzzxarPIK8NKk
   AE/Iour/ikMY5LmrQITSBRbQUkZnnbSoZwgkZ/1RmaZE3oQCvWDaoIkza
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67664484
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:NgG+b6H6PBr8xAlYpLqFaJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526fatskdrZJhSo6H7BEDgewKXyXcR2+gs1NiZLXDbUQeTXeNfBOjZsnDd8k/Fh5ZgPM
 5bGsAUYrCRfDtHZK7BkU6F+r0bsb26GdWT9IHjJgBWPGZXgs9bnmJEIzfeNnczaBhNBJI/Gp
 bZzNFAvSCcdXMeadn+LmUZXsDYzue72K7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFqQrk/a+u2svLhSM0llWjoai+quGRiuerN/b8yfT97Q+cyDpAUb4RGoFqegpF5d1Hpmxa1O
 Uk6C1QQvibo0mhAl1d5yGdnTUImQxelUPK2BuWh2Durtf+Qy9/A81dhZhBeh+c8EY4uspguZ
 g7ll5wJ/JsfGz9dQnGlq/1vitR5zyJSLsZ4Jwupm0aVZFbZK5arIQZ8k8QGJAcHDji4IRiFO
 V1FsnT6PtfbFvfNhnizyJS6c3pWm52EgaNQ0AEtMDQ2z9KnGphx09dwMAEhH8P+J80VpEB7e
 XZNaZjkq1IU6YtHOpALfZERdHyBn3GQBrKPm7XKVP7FLsfM3aIsJLz6KVd3pDfRHXJ9upGpH
 3saiIpiYdpQTOeNSSn5uw5zizw
X-IronPort-AV: E=Sophos;i="5.90,241,1643691600"; 
   d="asc'?scan'208";a="67664484"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhb9xowAHt0AP9m9BHxrWKIXXUTxJMLSFcDm6KezD61tsqdtdicB4M9OPDl1n4/33ZCv9Qs/+qJ0PU+yjav83vatdLwWBJpwO4MzYAcSCSgE8aV/um234ys5x9VhcKT58oHR0V/lQVKJ4p7fGJOBBp93mlOndjrngC7z66MjZIs6YgY7eelFfFu43/tceHgeBdDPr4xjLWyu6nm0JMjzd4HMxMtfIzPNbX4Ji0yfa8l6KobyQpSg+Jju2BZsYYs6+S+pdgk4ndbOOYu+UPM200mD9WQjQY6ondA86cXF/WLca9atZbcHjxm2KONcetl51lgtwcdqeoUOzYp5/Tm+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3jSzJ5z1popMJaWZZaG/YO3bI8OYCUmFP8XE1cNoS4=;
 b=kT98GR9yeoBZbDcnTvkqqgJljpfW8oh1i5qKecUfj0JIjyzae6EUP5CPLc6EzMwd84diC4s5m1ee1hUDKEVKU9ogYou3aJAi2uiGrsbjDwgv1RYFWJHuo+w4s8k153UjTjlJgvgRT/nU3kEcCK+GI9kaamrh8s0I8R6L3hDqJy6ZoHtFKuyjJTmv6mqRQgemtG+kDsmnC7RpmczQmeVMElyY2tdz1pKScS7q/uX8pJ2D5rHaKnvPkLk24KFxSjXLjStiZNxb/6PAJEzPbjmeMa5eiEUb4OvWRNAzOp69FlHzvQ3N4XMQXqKRJQskd25ot4IHWAUr7Yz/HqDD2Qa7rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3jSzJ5z1popMJaWZZaG/YO3bI8OYCUmFP8XE1cNoS4=;
 b=uck5hhTq6iOW1Dwf8LExBz24dz7Ef5/+ZZHdjphE74o3kUXaQMr6mbW8AFLl6Uk471ylrbLr/uUDKWPh4ADdikkfDLioR4Lg75rXOwXuRr6BJxzAMsPYGMad+vVZVljEBdx50R00NgqwrfNTX13G8gEAXyen/9dOm1hlKqPAFw8=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel
	<tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>,
	"daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Christopher
 Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>,
	Kevin Pearson <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, Matt
 Spencer <Matt.Spencer@arm.com>, "Stewart Hildebrand"
	<Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, "David
 Woodhouse" <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Ash Wilding <ash.j.wilding@gmail.com>,
	Rahul Singh <Rahul.Singh@arm.com>, =?utf-8?B?UGlvdHIgS3LDs2w=?=
	<piotr.krol@3mdeb.com>, Brendan Kerrigan <brendank310@gmail.com>, "Thierry
 Laurion (Insurgo)" <insurgo@riseup.net>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Deepthi <deepthi.m@ltts.com>, Scott Davis
	<scottwd@gmail.com>, Ben Boyd <ben@exotanium.io>, Anthony Perard
	<anthony.perard@citrix.com>, Michal Orzel <michal.orzel@arm.com>
Subject: Poll for new Community Call time
Thread-Topic: Poll for new Community Call time
Thread-Index: AQHYSmRs/5/iWGInM0OnERQ/FcJ0qg==
Date: Thu, 7 Apr 2022 09:46:59 +0000
Message-ID: <A4C455B8-C7DF-4287-9DB3-BCFBDBCAFA12@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ceaf4f86-44ee-407b-6248-08da187b8f97
x-ms-traffictypediagnostic: DM6PR03MB4923:EE_
x-microsoft-antispam-prvs: <DM6PR03MB49238AEDE8A6F418CDE20E3699E69@DM6PR03MB4923.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4zpQ2Xc6VrP1Mkz+z3cEEnh5yXLMUr+Om+2VkOZmggOf6mOuQel5JVDTJ22Wkw5gcbmp+lY0cQqxAj+GdBDdaSPC75Ejvev5cFrpwGox3g2SJ2V98mOdDRo3rnwr7BqThQQd5ql7gUCWcreoqBC679UJUa8V0njDTTPhkVblaHNTP8EIDoaBSLnEN4xs9XKhuMTxhXY/Fqj18qpZ8OoJkmCTsArBaIAo2dbRIx7Obv3FB0LvpSdYEyTDSJGGdbR+2PTN/QiBt9dgnlxVOP5M1+wh+X1CGoEB12kGhewi4u2Mal7EkAPzDlDwMgunbX6rE6mUMejYE9FsTqbtUHHIoGMrLoTLhBR5MFEhahGL3Dgk2j2QbJ6P55VP2aX1H749eEUiv6Hb55zYvSlBt6kkFQNGIbjTvxQBrzY+OCqj7cd+Kp9gYU5vyYXuAeiWFsndr9z161OLxian20JbxYYx/YHsGpjmIK+87etWMVOGR1oBm8DY9c1o4fCokeR0IOUVK58hRqo8tlf4dBkuVolp68E1phwMGKnzTrFF/e8t2LOfhJ8GBgCIjoCBiQSwYz2JC0Tm1t3LZoFt97PvzvJaFxeLv0q/78qBVNQxM6DP1sNZ8lXHQa76r4YMti5yXk6ZIfu9+nOAkPkvO9StSxBK0RhgC5C395kbh7fi1VZBApX6WUWbP4STgAg7M3ZESwgtYVKF7gY6kywQbSVSvQp3rCyrx5WE+YvRE428dK9PQ1VDgokj6FBXTCMoVU/n1Vy9tBRfWI/YlkjR0tN26VKlnWBM9EOP4ZQMHJn/yuRekjuqzyyhm71B1Jy5sfHKNb4AWYfoCe3oDf1rWn2SKgNepGYkVp57TLSbaisTAMhsFcs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(508600001)(99936003)(6486002)(7416002)(6512007)(966005)(7406005)(8936002)(110136005)(2906002)(122000001)(921005)(82960400001)(4744005)(91956017)(33656002)(316002)(38100700002)(66446008)(2616005)(6506007)(66946007)(186003)(86362001)(8676002)(38070700005)(36756003)(76116006)(26005)(64756008)(66556008)(66476007)(71200400001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHBSYW5Qc0JGRmNRZjVIYlBkcW9VK3o5QVBCQjY5ck0wV1d0dGZRc2dLZGZa?=
 =?utf-8?B?K2k5Nk40RGZvV3lEeDFKcVFHcThUWm5WWVFzeXZ5dnY5dHh4V2ZGeFg3eGs2?=
 =?utf-8?B?dE1FRHFOQmZBY043eldLdTFMWnJLWjFqeEgxOUNOQXVXWUxrK3BUOUVLR282?=
 =?utf-8?B?UWdYaXd0SGI1Wno0SUlvV0VWMUJScWxWcG5YbVNDakUybGx0M1Fuc1FYdUtF?=
 =?utf-8?B?MkpxK2NKZlg4RFFaTXBUOStrS3JodWErZVVJUGp4dUV6aEhpa056UmJacnM1?=
 =?utf-8?B?T1NiYW1wcENabklDcE5ybGlKamxOazRlRGJTM1JndlpERkd6NVZvaTlyclA1?=
 =?utf-8?B?eXl0OExHU3gyR1c2NjZKN3dMdnZ6eEtGamc4TUxWNUt2SnlKaG1FQkdvaU9H?=
 =?utf-8?B?S0htRndoZGZLa1NySDljekQraW8rbkJiYnFERk9JRkxZazdtQVZSeTJPVkhn?=
 =?utf-8?B?V0VKbUtKWTZQVzg3Mjh0MlBmZTRYdXNIVkVxRTVMaHl3MVdWTG9WTUJHVTlP?=
 =?utf-8?B?WHBsQW4rd2ErNjdzMlh2VGJ2emF6eEVDNDB4THZGaVVmSzkvZGRaQVBoc2x1?=
 =?utf-8?B?dWVtQ1QrS0tzMktEMlJxY28zQjdQYVJRdjVRT200VmRrY1J3dEM5c2U1WFo1?=
 =?utf-8?B?NGxaRklsUExsdUYzRGIrVmh0K05xN1AzVkhQWjB4SVJQZzBseElmSWswclBk?=
 =?utf-8?B?R1JsUWxpQS92cGJPRUdjTkMyMjV2U1AxOWNYdmJFZnozMFpqMWxnRjA5L2xi?=
 =?utf-8?B?U00zUEVkZitQRmNoQmlSM2krU2ZmQ0l1bUFlN2crRUdTUVcvR0hXUW9BaDVy?=
 =?utf-8?B?WEJqTUJZU3puRURHVjk5VTZjOXVlanJsOHJOVFVoQWlWMWE5TURjanJDSTRE?=
 =?utf-8?B?YW84NzRJOVNTa0p1SUVmcmJ2dFdzRWc5QTZKZWNvckR6MkkvVFozRm1mRFB1?=
 =?utf-8?B?WllrNDQ2UEVXbDcvRW52YlBpc3BGZkJHN2FRb2U3TkJrK0dCS3ErVXJ4OW1r?=
 =?utf-8?B?Uk51VmhOTHI4T0lQUFhld1ZNYzUrb0tEYkhNUnVGQStLRWp2di9GVEZoMTdz?=
 =?utf-8?B?YThraWwyaFZOMTdoeE1rSzkwTWI0S09MUFZpREtRMjk3alNsTzJPU0k1aEFL?=
 =?utf-8?B?UVR0TXhvS0dwUDRVU1hicU56UHhpSEtYaDh1NTVQWHhXU0Q3S0QrSDM5S3Jm?=
 =?utf-8?B?TVFzaTlvamhERUZWRmRuYUdMNGtQcVFaSUNXSGFoTDNuWFplMnZaK252aEJ2?=
 =?utf-8?B?TEEwSGkzVStveXVoYzM3SzFaMWxhT3d0NE9LVGNBemtxcjRqNG15VjY0V21l?=
 =?utf-8?B?SzNpWFJ1ZlNud3RXZytIeURnUFUxU2F2cUdNcUNjaXVPYXpoYUlpK3grWDgw?=
 =?utf-8?B?cGJ1TVdsbTdDMlVoZU9NSVJyblI3ZFNiT0tXZzY1dE1qaytlcC83L2tZa0Nu?=
 =?utf-8?B?WGVzaXkvUTk5OVJ2RzlHR25YUW0zSEdYYzZTd2NUb3hyUGQzdThXQWY1K25Q?=
 =?utf-8?B?a2s1Zis3VVl1K0JrVjM5UUFzbzYyOVlWSm9OZmVVcktTRWh4NGkzTTMvcUE5?=
 =?utf-8?B?YUZRSGNWN21kZkVYQWlXY1UrSjI0bFc3bzJpUUpybS95dFZxdmgyZzAya1ZC?=
 =?utf-8?B?RVFmeG1xbUxBbzJyTW9zaWw3OWNsclNzK0V2SmV2eGRpa0NFTER0WmNYYzBN?=
 =?utf-8?B?VUJtckM4RGRqN01CbHhPd0ZTd21uN0JQU0ZoWEtXVXNrWkE4eWw5ZUpNZ2JV?=
 =?utf-8?B?V25RZ2phTEtVaXoyRmxxUnpwYm93d1RHbXdsZlNsUmEzYUE3eDJtcWhheVpY?=
 =?utf-8?B?eHJvS1VyYmY4ZWFpMTBJd1BrUFp3WURpR2x6b3NoRkhXRWcyQ214dnVjTkx4?=
 =?utf-8?B?SE0yaTVuOUFyN2ExM25EYjBudDY0eUY1blhGOS81UXdKL0R5MWM5M2pOZ0Z0?=
 =?utf-8?B?bkdtUG1UWHdYL2ROaVFCcnprUGJ1RXVqbG1iWkE3cC84eXgvK2hYMzFPd2k4?=
 =?utf-8?B?aFRZSnZVRFh2amVmVHhaSE1abkl6eUxZYU1WQ2tabG0xVnRreVNzMFNLK0dm?=
 =?utf-8?B?a1FUU1JRUTFzL1VxblRUcGZreGxCeTIzZG1ob1lpWW16dTlKWEpFb0xBb0ta?=
 =?utf-8?B?bkpqc014OTVnSGtvUXJTWEFuNThQTE5CRXMrWVZ5RWFrUTZHRVRMSXhZQldH?=
 =?utf-8?B?K003MnE2QXFtU2d6ZkpFQW9lbjlDem8xeTBobk5CTjFHVDJ4OWs2aURWMzhn?=
 =?utf-8?B?Yk02eS93MFEvaUx0a2EzT2x3Q1BjQ0tGZXpmUDJieTBTanJxWEhEMGpKOWJY?=
 =?utf-8?B?S3Y0UUVsUzBuY1h3R0ZVeDAwVVJQRG96aUI5OGR5UmFpbnVnOElFK0RPSWtT?=
 =?utf-8?Q?E9uum8NHsYCBCF18=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DF980058-62CB-47AA-A541-3E459976C741";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceaf4f86-44ee-407b-6248-08da187b8f97
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 09:46:59.3110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nTZS4JNu4jo9arBCCI5iZaBhJGGqDAiDMPyqRUxl+E3EzUkvvtT7qC/CDN1rIDFEZdAHFW6mYC38qC/9KhPL2D8Xw+IDsaLRmMeK/34HbNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4923
X-OriginatorOrg: citrix.com

--Apple-Mail=_DF980058-62CB-47AA-A541-3E459976C741
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

As discussed in the community call on Tuesday, here=E2=80=99s the poll =
for the new community call time.  If we don=E2=80=99t find a good time, =
we may just move back to 4pm BST Thursday, which is what it was before =
we moved it to Tuesday so that Ashley could run the meetings.

I=E2=80=99ll close the poll and announce the new date after 2 weeks.

https://doodle.com/meeting/participate/id/e1wwl5mb

Thanks,
 -George

--Apple-Mail=_DF980058-62CB-47AA-A541-3E459976C741
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmJOsw4ACgkQshXHp8eE
G+2KJQgAt6jSw69V0xzZGTsKmbukpEclB2qxPWUHN5rxOhlLPw75roTakfX5po0N
7SDOq/9S17sQPRpARCK0aawNe7yrYXjW478zjc56+9vPF6EDSjVQBLTo3Nkriuo/
uDy2S+1/jiYxpRNsMlobNmI0M3cA/HrpCPBZuD3Ri2ORmHT5wVe9RubrQpczWVzJ
CYzmeZ+OSTKqUfinyjX7/sjFqE9beabvQG6ZOG9OzLnAMewiyLoQEPWaSZmlhoTQ
zJRydMJI9TqCg2/bDdQJrsLG7gM6UJ+kwP1vIg64PHW31tYcpMJKfk87UmaNxUUz
d4mvjJT4oilJGTYgyYiT0kUr3CKnpg==
=mYDm
-----END PGP SIGNATURE-----

--Apple-Mail=_DF980058-62CB-47AA-A541-3E459976C741--

