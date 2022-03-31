Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D637F4ED8A0
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 13:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296891.505536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZt9S-0003tT-70; Thu, 31 Mar 2022 11:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296891.505536; Thu, 31 Mar 2022 11:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZt9S-0003qL-3U; Thu, 31 Mar 2022 11:39:42 +0000
Received: by outflank-mailman (input) for mailman id 296891;
 Thu, 31 Mar 2022 11:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdXs=UK=citrix.com=prvs=082181b9c=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nZt9Q-0003qF-Fh
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 11:39:40 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d609343-b0e7-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 13:39:37 +0200 (CEST)
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
X-Inumbo-ID: 3d609343-b0e7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648726778;
  h=from:to:subject:date:message-id:mime-version;
  bh=tgJ+nNkaRMmdBgpXKKRi4IiWolk3I4K0cHDH6RaUTn8=;
  b=AvTcTegXuoknbucX4Q+wuBs2fUVeo2lnaoFR8IyTd3X+83H8mez0dqk5
   MWrkP85eNNVhAGDoB4aOZy/1bpDDR8IYRetxBdLIQKl02+hDELYQnW1BN
   sel7sSM1edk43ldHl89RugSylKdxHAHpVbQXUWDtz1wPp1bBIQcluz8mp
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 70033702
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:etxYlqFAuAA0wzCfpLqFaJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526fatskdrZJhSo6H7BEDgewKXyXcR2+gs1NiZLXDbUQeTXeNfBOjZsnDd8k/Fh5ZgPM
 5bGsAUYrCRfDtHZK7BkU6F+r0bsb26GdWT9IHjJgBWPGZXgs9bnmJEIzfeNnczaBhNBJI/Gp
 bZzNFAvSCcdXMeadn+LmUZXsDYzue72K7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFqQrk/a+u2svLhSM0llWjoai+quGRiuerN/b8yfT97Q+cyDpAUb4RGoFqegpF5d1Hpmxa1O
 Uk6C1QQvibo0mhAl1d5yGdnTUImQxelUPK2BuWh2Durtf+Qy9/A81dhZhBeh+c8EY4uspguZ
 g7ll5wJ/JsfGz9dQnGlq/1vitR5zyJSLsZ4Jwupm0aVZFbZK5arIQZ8k8QGJAcHDji4IRiFO
 V1FsnT6PtfbFvfNhnizyJS6c3pWm52EgaNQ0AEtMDQ2z9KnGphx09dwMAEhH8P+J80VpEB7e
 XZNaZjkq1IU6YtHOpALfZERdHyBn3GQBrKPm7XKVP7FLsfM3aIsJLz6KVd3pDfRHXJ9upGpH
 3saiIpiYdpQTOeNSSn5uw5zizw
X-IronPort-AV: E=Sophos;i="5.90,225,1643691600"; 
   d="asc'?scan'208";a="70033702"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibBakypQNPB5E73fvKa+Rqcgspmal73u1yCAuaNn9filSOyrsd8K11GrGsZA9ZJ/F2xYflgWCvWOzs2U9Y4QT6ztpjPQXXER8BIrlWfD0AXzV0oxZbNM2IDb7NUrRsUTBgOpsHAY9j0fLC6ikCH2T1bzNz0CSvvrnaZUJwNtkIODR/YRNYoMiHFaptepm3hADSzXpAug1z7gEIejnWOEhkVHmJw7PLNMiwjYMi+60an8YjzRDqq73rGgVNuPkLoXeExnsOru1k7z5w76cjruIjGajQ+6vfEjCWPlj94BkvgyDslx0vGH4wVf2yEZNBDqhOyCPZLP1wp0PWsApKm2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ve7KOx61KXyOPV/iqoCIcA+DgWloZQoAQINkjlxJtk4=;
 b=VR7XPD1sDTPUSXBJAm1D0AsinqFfTj1ThEpqjLkKi+tPLRkj/130Lrf4FQ39apZZTYDDU0d1iL2U76lzHIJ90ColWyCKNRX9TnK7gX37QO2zTzTVS3RP4fwAnDWgh+mvrbj/sQXbvzGtlxmHNNcT40CTcgwoMaBNsabpyMboef6dFf9x1P1nYMSSqTD4ouegJgADYS+ngHfvTrKW14kd/TrfMfpde7lPlu2ovPF+UK97ndSnz6wiDkdhtRP24TfftX3W2Cqixoff0ugghXXUvQo0h4pxCFdFTl603aQ7VFhlc7V0y5V2ZzWeTvqhexkoQAEXXHOzcProbiG8vKvosQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ve7KOx61KXyOPV/iqoCIcA+DgWloZQoAQINkjlxJtk4=;
 b=IrVCEufxWly4507Xf+Xouz7GKfh3WOXHHZSfzI+4TTu7E5Z5/9ddqkQlHgYpv46CqxyQhDokwPqnYHuM76/CW1DX4Ppym0g+km2DybgAIQeeCg4EFCWzIoOWSsbWSWmpZtAF3ZuPGViLoVYHILvF+tN/WyKb1aGiDJN9TZ9Mojs=
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
Subject: [ANNOUNCE] Call for agenda items for 5 April Community Call @ 1500
 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 5 April Community Call @
 1500 UTC
Thread-Index: AQHYRPPtp6N7a18DXEmosZ+du6qfkw==
Date: Thu, 31 Mar 2022 11:39:06 +0000
Message-ID: <142FFB61-B491-4B27-973B-6AD09345CAE6@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb3fab13-d3ff-4879-0697-08da130b103a
x-ms-traffictypediagnostic: DS7PR03MB5638:EE_
x-microsoft-antispam-prvs: <DS7PR03MB5638050676DF56F7DFD619DD99E19@DS7PR03MB5638.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P4SnCfuM7OaVnLSgmgPLy3LTIvYr3rcDqXzJPLklKm998yhcgSQZZPT/A3cQATfike5HYDMLx82ATSkx5kFGhpzCfYvdg/JzqDg2gxypa7xDIn/2E6gi9JZ8fD8QmzlOiebnQeBb9FkSLVWKdpGS3A6Cv4h46VC+lETOLMt0MvY6rOQWoSwFUopeKImFjy2Fo+LEMrtHto/wqYKisdNlxbY88DEycD5OmhEol+8Qm1eymQnaGTIh7vlZKjA5PVpa4WGh/T+KXuVoBoixsUT6IZUeF2+5W+u+IgtyqL3ANcVfYv9/g8ba0fl7iXzqQZ0iA9KraKxxl5Bs1ws+Oo6XUwMMXmqRVt+uWoQ74HB/8KpZ8R7ec5nmhbz69XP1eybx0XLKBo4gH3FDYCyrduMESB/Z4UjvLpBq2x1dseqiHIRbdBqiQrYpYMDwZsGBgivpr9aoAGzkBo9QxLfD/vuoCfU8jXpcWmVGgHhOlNfDdv1daevG4LrBZHWueusT8EdfWlJISglw6koS2LMDBdrJLFrdXVT1TVlPHNg2edpp9pAWUxqNcd+t7D7X2LUZeZs3viEGgLOEKRCkXQtZzXIxRM9Qj0/elUG00M0gtFgldo8GTBT+XxFdTdPykCwMX8DL7+9OQ7GCtIkK2uzYa2CHrhV15IB0Dbwmvyn/pP1Fes7dPzOIIu3rNAXqwWjzYNQnZl2tVqr5VfF5g4pSb/biNKOhta6ucBMB/CmgYIM58LQTNbslzelaRPOjMnGN5gclIwkCSz40X2PjFfr/2mBnFCHlvgPZP2j/3y80YSOEj2yK7M0qvwWLfN06QN6LIEBrt0KUYh8qSEkk7lsIg/3DoGSzmyHQmIkVinkrwp3fEzE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(921005)(6506007)(6512007)(82960400001)(508600001)(38070700005)(38100700002)(5660300002)(2616005)(8936002)(7406005)(26005)(186003)(7416002)(33656002)(2906002)(122000001)(36756003)(91956017)(8676002)(64756008)(99936003)(66946007)(76116006)(66556008)(71200400001)(66476007)(66446008)(316002)(86362001)(83380400001)(110136005)(6486002)(966005)(221023002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sm5BWTQrdzZ3L3NkQkhxRmVXcUJRbDg5Ujl3MjRZeHoyTWV1YWhPM0szNGMw?=
 =?utf-8?B?REl4MFQ2THZUVExyZ0RVaUY5L3pMM1FUOUVQNXY5dUoxUkQvYXJCSFBtY1lV?=
 =?utf-8?B?YThiWHp6ekQxNm1CN2k4SEpHdS9HQVI4ckU4NHErd3BDV0ROQWh5OFpOWHh6?=
 =?utf-8?B?bHI3T3E1b1lxWi9jUHI2M2JqRGEzcS9vMlJ5SVlpQjZNaWxOY2tpVkZKY0dT?=
 =?utf-8?B?eEdFWVo0NndCSXA3NngzVSs3ZDh5K2NJdys3cy9tRHlON0RXRVY5aWk3MXdn?=
 =?utf-8?B?UnRaRVRUSzA2R1pHT1VkSGlxbDRBaUNraTJnVU5jbHZncTFXQ3pNdmZqNkVV?=
 =?utf-8?B?WVpldHZwUU81MnNQQ2hna05OUW1FS1lDdk1JSlBXckdzSE9MM0xoRHVLTHR3?=
 =?utf-8?B?U2Q3RFVIQTZObHgvMHB1T0VoT1pLdGpPWG9CMGpxUTFBT0gvNnZQWjBuZjFU?=
 =?utf-8?B?OW0vOUtaZDVCV2thQUxiajYvbWppWm11eHpxOFpUNzNGMUUrWU9QZVdIT1Vx?=
 =?utf-8?B?OGg1Z25HeEZveTJES0NQVnFVa2ZtMlpzSzFZaU1tVlBuUVJpVnBla3lsSGFL?=
 =?utf-8?B?OG41d1FLY1VVbFA5ZktUOVorc1BXSFdJWnJlbW1oMnRVTW81TTBQZFExRHpM?=
 =?utf-8?B?L0hhUnZhWTdmcml0U2lNcWFQcVhnQmhrR0J1VGFWcXU2ZDhvamw0WFpyazR0?=
 =?utf-8?B?eHJsSFUwTWlPbUNyWjJhK3VvSFJVc0E5ZWpsaFp1bkNrNjVYQXNYd01HWEdT?=
 =?utf-8?B?Ny8wWmEyeUcvd1k1aWJRcXZrTG16STVrSENaQ0NCOTZ1d0tjRTFQcGVPdUsr?=
 =?utf-8?B?NlVIRHE3NmN3NnZJcTVwS2t6a2c3VUhUc0pLbHJvOWx3YW1TblFvbFFLMkZi?=
 =?utf-8?B?NHlWMkNXeVpNaktiNHIzdm1BUC9vQnQ3V2RLelUrN1JoY1RZWXozVi9JNVJz?=
 =?utf-8?B?c00reHJiQVFIaVZRUzA1TkRVSDJ1UytNNXU4NDl3b21RWUdTVkJjN3hnTzlC?=
 =?utf-8?B?dWRTQytORXRhWi95bkhnbG9xZVUrSi9CWnp5MlJxUXFLSkoxN25WRE9mNXVS?=
 =?utf-8?B?THdmWTk4T3l4UVA4eWh5WGdLVy9LOFRQZUxpemhrTmNMNjBZeSsyc2pWcjVM?=
 =?utf-8?B?SkNpQm1mMlZrZFVSNTI3eHE4RUZrYnlIL2llVFNPd3hxR3RQZGJuWDlOeVR5?=
 =?utf-8?B?VmcvNUp1ZU9mQmZsUXoydVZPZTJxamR3UUg2SVdNSG1Xemw2ZXkrc2diejhD?=
 =?utf-8?B?aVhJZTh2NXdPVk9WUEJqa09BN1FLTkdNd0svMzFPZzF1R2FsY0VucDc0eDVY?=
 =?utf-8?B?Y2ZyTnZZL2hTNCtNa24xaHh6MnhKUDNLditLOEpmVDNBenlZT0k1MTd2YjEv?=
 =?utf-8?B?aWw5dzZvSE9TTEhPRVFIaVBsd3hiY2xTRmVaYjYrUlpLRW5OMW4zYjBmVWhJ?=
 =?utf-8?B?dmY0bnVxZXBCU3ZvNTV4UXljVDBFQ1VTZ0hDNHhjVkdyNGJpRENoa3RyMTNK?=
 =?utf-8?B?V0hWSE5aVkRkUmpPT0QrMk44WjJOd1JQSTV2bGk0ZGdEYzFCbTZ5ZU02RktO?=
 =?utf-8?B?eFpXMVRzdCtNQ2pEeHZBTkNOanlKNk9pS1FreVZXM2NyTW84Q1ZMVE5uMm5S?=
 =?utf-8?B?c1RXbngwYTBPTWQvQlo1N2REZ1AwUGNQTDlCTlMzeU1oTi8zNFFreldZbzBr?=
 =?utf-8?B?OFoxSCtiVFlPU3ZqQ3VZRjBnbU80cVpuT3RsOVJpOXdxbGZNVW5UQktPbW93?=
 =?utf-8?B?YXFIdVNORHZpVGV2bmNpQmF4aVg4YklnYklPekxCcDZOeFFDam1WRmo5eFBF?=
 =?utf-8?B?TmhNR0lFUkdKaDNPc21PZXZmdmUyMHBGSFBnakJ0TnU2TlhCSEE0U1pNTCtS?=
 =?utf-8?B?WDRhdWtqbjM0SGxHU0ZIWDZNNE9Qa1VBNEI5SjhvRkh5NW1YalZ1dFpNRXpZ?=
 =?utf-8?B?bEtIK0pmbU84dmJXNlR5KzJTOGNBaGgrWTd0eUFlTDMyYzYzUWFucnBGMld0?=
 =?utf-8?B?bHh4VUltb0U2UVRWak5oNnhpR2F1UEdVWmFxeFNYSVpoK0tHbHpjSzFuL28w?=
 =?utf-8?B?Rzl5b21WZW9mSzlrN0EvWnlkNWhieTVVczRJZXlXbDVKOURnbG5acWswWXU1?=
 =?utf-8?B?aW9QVURlVTIrNGptOFdOaCtIRS9PSjF0SktJVXR1WkNSOU1TUDNkK1dwWURk?=
 =?utf-8?B?dnB4emFXNzhjcytzc3pqeFZpMC9qcG91bnhUaTFiLzhDZjJNVW52WXlXZllF?=
 =?utf-8?B?K29CMzhkOXpRWkVHTlJjelYraUt6WHJqZUlLWnZzQW15QzdRY2hucjVna2xD?=
 =?utf-8?B?STU5Q0pwTXoxZ0VpMW5BTXlQVlhlWFV5M2FnbW1iVEFXQklYRGdGWFdNM3VW?=
 =?utf-8?Q?XW2sSV7HdTfsCyTo=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C219D192-E35E-48BC-BEB7-3EF0C8657064";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3fab13-d3ff-4879-0697-08da130b103a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 11:39:06.1965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wFRguPyT6iKm2pEL8Dque7Zn9eDjy1i0oyM+sSwLHbVH5SgciScBYYSJNSUpiC3WRiL4vQ710Er1AYpxvD3XtyOMkDftiDFlQoL4j87AvOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5638
X-OriginatorOrg: citrix.com

--Apple-Mail=_C219D192-E35E-48BC-BEB7-3EF0C8657064
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Hi all,

The proposed agenda is in =
https://cryptpad.fr/pad/#/2/pad/edit/LX1iwUFsMmBkyttPZuN5SvRE/ and you =
can edit to add items.  Alternatively, you can reply to this mail =
directly.

Agenda items appreciated a few days before the call: please put your =
name besides items if you edit the document.

Note the following administrative conventions for the call:
* Unless, agreed in the pervious meeting otherwise, the call is on the =
1st Tuesday of each month at 1600 British Time (either GMT or BST)

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
th=3D04&day=3D5&hour=3D15&min=3D0&sec=3D0&p1=3D1234&p2=3D37&p3=3D224&p4=3D=
179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall

--Apple-Mail=_C219D192-E35E-48BC-BEB7-3EF0C8657064
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmJFksMACgkQshXHp8eE
G+1Q+Af/bLQjzdkzaKsD8zCe6eDtRBwyG6xhCWI1SUPiJYeZU/wkKjhBpVEh6esF
7GnhpYe9IPt/Q1RZxOhc9/UGL8DvEBz5YyjBMa7twszDveu3V3vWyUdqsrGfj8y+
7AHvaVPADMUDpDX8U4QHWjQAsx5z+urhwUT1LrgofmPoJOSyQBi60FR09lStrku0
7y+PmQEjfxtVYWCXxhgUqBvog646RcvUYSwcnJBydUKIrKPo/staFFkb/xUy1RiX
kW/x2C/F9uR6NLDnyH2S2UmDoH7OYBAqD9eL7RKKAMFT6QfwVjW/vcP22CM4Y1WP
GrSuSZt/PIwS9+eB4iBqY5uhcOgIpA==
=SvjH
-----END PGP SIGNATURE-----

--Apple-Mail=_C219D192-E35E-48BC-BEB7-3EF0C8657064--

