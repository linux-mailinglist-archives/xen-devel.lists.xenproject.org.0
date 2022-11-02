Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3E4615EC0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 10:03:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435678.689350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9eI-0003ld-4x; Wed, 02 Nov 2022 09:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435678.689350; Wed, 02 Nov 2022 09:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9eI-0003iw-1e; Wed, 02 Nov 2022 09:03:02 +0000
Received: by outflank-mailman (input) for mailman id 435678;
 Wed, 02 Nov 2022 09:03:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bvJN=3C=citrix.com=prvs=2987bd48d=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1oq9eG-0003e7-Bp
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 09:03:00 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24dd199d-5a8d-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 10:02:59 +0100 (CET)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Nov 2022 05:02:52 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by BL1PR03MB6166.namprd03.prod.outlook.com (2603:10b6:208:31e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 09:02:50 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::5d4b:6b1d:efc2:20e5]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::5d4b:6b1d:efc2:20e5%9]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 09:02:49 +0000
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
X-Inumbo-ID: 24dd199d-5a8d-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667379779;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=4aYDivTRPAbk6PDnD/fkTW2cfLOl47POntFVChhrmQs=;
  b=FVt+ZXazpXRzU8e6HLAid8HwO8+g/4zGfhSMIApw4vV7pfIy8DODW2EL
   WAfWvzY7fhldGdt1nmv0V8zUqiAexxbAFNpEjgkpDCrGdrCeO1o/Yolim
   smbU1fL0XYvVZCdsTgHi38J+V2zqK0usd2TNsm/0EaxdrMr4iGw1QHTXS
   g=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 84414840
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:1KY6m6ovOtzjRHK3xtcNKKUaV5uUL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ki90dq7MAjhHP9OkMIs1NKZMDUO11HYSL2KgbGC/9SkIVyGygc/79
 YrT0EdMqyWMbESt6+Tj2eF+pQbsb+6GcuT9ITjJgJWPGRXgtZbnmVE42igcnFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29LOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6d030Woqqu9jJwPr3NtiEnEESutu9uXvUiZ1S2hkF1nAho0idurD
 CDmWZlAy050QKqQoj8m2qR5+Cn6kdi15aq8y7mvVLz5cP+Xz40EMxHmMZQdQbY8VMpuJVm3L
 tMxH/xjesgMftR9B6Nm+Qgeisa4nZcm0BS5tI7njhaS88TebVRpYsQ8AdcF4oBBjvz7MQiHP
 N1BM/R6f5KeRfCBkqp9lVH0ZipRDA+Dx2GSk8Ntoic1CVXhmlwyw8dyNYElnkN+ZohQ91P5v
 jCMK5viLZSJ/VmJJ5VFaMEW4+6G2bNSRXDPCabJknmDrgOPzbXp5v+8NwOlZSXkVwzvekPcb
 j6ISNlXDQJCjzT4OW1rex22wGIRnmhVjLwzcwb74Rlu9THNcnWDRE=
X-IronPort-AV: E=Sophos;i="5.95,232,1661832000"; 
   d="asc'?scan'208";a="84414840"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDMGAvojmdgX72qR29asaUdRNmJRrxeINN6641oUO3e+erDJAzk9k/qWu+AlXaZ9Zr/1WMln9FuLOc8sZdvR+hmlSS0ZMM4xe7hZIhuHMw6O9PogKnfMYFHUnBsv1/v9cHwH/lrC0O7D2+UUmeQi3KlXFCUFNzwYAk5EI137I/90ZEjtIO2owMQQvhadyBuQzQh7UXna3KE7zZ1ZnWeKCaoZpkqkMXGUlFO7X5e+liTM158A45Pen2E5p2XYdMIzokXjAnI9sCmVE4Yka6+B3H5uo/3+PKaauWGvEbHX8kGLXw9hr9CWHkP4n68xt0YmCVsfSZ1nuRFPaqe8BqthRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUoo3aV58qz30ZStXzkApNbS2D+lvMOpJ+QPFHfoTlw=;
 b=dtmp9N5RlcCrBskI6Uy6w+hFDQRcxR2jooSY/gTEwMqfkMXXJid0HPqictjRpJbwxakwWZ/JyW8eOF02COEs9OAiLsELgnllHv5zNC7ILse0cTwVeWehKiQM6mCAk1JF66ic+7icG+KTlfgAm1dwHlq7P5bFmS7qW4jbB0U4pdl3QOnQbGizKVSL5b5PZjsrvor57bkT6EKDDzO2aLg5GjjiKQp1pQIrhiUa1t33DCkKOuUzIw9BA1cBbuM8dX7zKFq2tQyLu6AFMSDWHEtsxXl26wAu2N1Q/UWz4M/0p0A1+4oho7v7l+JVz/eYAOFi/UKcW4EotI9M6vlFXKLg8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUoo3aV58qz30ZStXzkApNbS2D+lvMOpJ+QPFHfoTlw=;
 b=AdGWxRSDoCxWfO8EOuD6swXkOEWc/AFPy6oK7OMk3nNmzdiVcuEDmj5EujYW++i2lOO6h5ESNioCgYOMis3k3NbtPeuTH/FrkbrzfqAzIfLrhHGrDYIvbE/80BH6uvzM3gZtg8OHMkoo2WFhzTkxeCaTA94l0DLf0cud4x7/1yM=
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
	<Stewart.Hildebrand@amd.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Rian Quinn
	<rianquinn@gmail.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
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
	<anthony.perard@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Marc
 Ungeschikts <marc.ungeschikts@vates.fr>, Zhiming Shen <zshen@exotanium.io>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLSGVucnkgV2FuZw==?= <Henry.Wang@arm.com>
Subject: Re: [ANNOUNCE] Call for agenda items for 3 November Community Call @
 1600 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 3 November Community Call @
 1600 UTC
Thread-Index: AQHY7pniZwSJPFR0zUarBtD9c84HRA==
Date: Wed, 2 Nov 2022 09:02:49 +0000
Message-ID: <4C373461-D464-4414-9DE0-97D95554D76C@citrix.com>
References: <75B69D18-27F3-4DC6-9308-CD2548967154@citrix.com>
In-Reply-To: <75B69D18-27F3-4DC6-9308-CD2548967154@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|BL1PR03MB6166:EE_
x-ms-office365-filtering-correlation-id: 22dfbc61-4200-4d87-8bd3-08dabcb10490
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MMi9GhSbKOQXHBzpp69pEV1QfgqMca/Aws1JlI6dk2n0vyBlqP6ZSKHR1OvBVNKQUpwERtoM9GPKFI85LfAl4Az5o78Kp0XVfu8Pvqz1G2xDCRulhSfdKz2TgnPIIqoJMLLG4hqEFHFPgXcvux+vHcaZgRpH4Q4cDv9h5K/e5nceNKIkBO1mEqf6uwoK+1+aQZPikHC9ujh7C+HQ2RetjllIQGHlUDAngx+jJrtlyVPpoCGtN3auf8+VUqJJYg1+Ad9z+MpnoStM4xHBrVghy8GO4AQCv0G6IrdyxJUhsb1fioKXKJHtN78oif5uJpx6UB+N5Qyb8ip/r79nD6JnuSiaX5whc0TpliGKpAVpa0dnYVJRrWNBdHOLOo+0q+cO5Ptcf2zOlDwAqkuMldbg93ndNbo3tP//DyPCJQGJXN0zYt8wBn0fBtMpc+Om6SaSskda3H2Da6Ae7Mt9eBszb4Ormn9trW8lvO126qWPOtC+bmcOE07Q9IE02JyTwE8xDdb5wKS1EsDx6I1ymMomtToWfQcV21NGxiRU1NZP1ocxHKdPIgryo4KaT2WhOH7md4DRoIBuOdwlbE7eoM41kSmdassCA/Rs8Ji03sC4HObMOn4Fms5JlgnzBjZK+qa0QNaFLp0Hfwo6l7Twef4WiZDdwPUL8X56FqZkSXJnimEECDg7d819xhvsCntalu7XwclbCPXA3s9tIF9g9G0F/XvbqNF5f6FzeqJz+kVDokDTGejFVzNmeQnlIng4mi11MTk4IHbEZgXsbx5TATsHn7k0HXy+pvvAokRtDY2oaqKkYpc2ugN+tAY1zQjqsTrn6NtANhH+CD45kkK12sLfghdhdFvXDzbGZoWLw92Aip8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199015)(33656002)(36756003)(1191002)(316002)(7406005)(7416002)(478600001)(5660300002)(8936002)(38070700005)(83380400001)(921005)(66446008)(71200400001)(66946007)(41300700001)(91956017)(66476007)(64756008)(76116006)(966005)(8676002)(2906002)(6486002)(66556008)(110136005)(122000001)(6512007)(26005)(2616005)(186003)(86362001)(82960400001)(99936003)(6506007)(38100700002)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXh4M3dscGwzbSt2UkVjdkl1eWFoZXBTc0JEZU94WWZjc1hyR001ZXh3SVM3?=
 =?utf-8?B?enBWSm1kcjJhM1RIWUpEblFCOTdXZDFIcjlETFB5VURDaWFSQzkxRVlCcEJF?=
 =?utf-8?B?ekJubVBaNVRNczZZNHFqVEVQMEptREtFUFBlS3psUHVyTkNiWmtzVlhpajdE?=
 =?utf-8?B?dlExVWc5OUZrY0tjMXFkRTVEdUt6UE80Qlk2ZGREc01UeFcwblhYdUtqaTE2?=
 =?utf-8?B?Ulo4V29QZ0J3ekdTSDVmc2Eza1kvSWRTZTNMUm0zNFlmbC81VDhxMzQ3MEt5?=
 =?utf-8?B?bTFrWG4wZGJCa3FucERuUGRWZ2c1OEpRbzdMVmxhSnM2Y3NlQUx6bmwrZitz?=
 =?utf-8?B?Vmg2azdNRzdGbE1GdVVyKzdma2tCZkdIQk1oY3lpcUJjdDlwUVI3YVhodmgv?=
 =?utf-8?B?RlZFUTV2K1J4bzJVdVJycnR2azNUdDVIaDRXV1diRmlMTmUxaXNORENJMkFx?=
 =?utf-8?B?VWVEQXRlYkVQUThLcW1Vb05oL0JuZ2cvMTBoRW1hT1czUTF4SzVZaTJob2Rm?=
 =?utf-8?B?bWh3czRNU1lXcnhySVVKVzIzdFlSSU5GZXVDeWlZeFFRTmRyam5UMHAzQzMv?=
 =?utf-8?B?MW1iQUhlWTByaXlpMkpUWmE4aGw5Q2VqZ3EzS3BQV2VDY2h3YXE3eEZaNU5G?=
 =?utf-8?B?VzVaZmlpZGRmWDZjS0l0YXdoQkJBUjNxbnMzOTMxcXl6TXVhZSsxZ1ZiOFhJ?=
 =?utf-8?B?YnlnSlZxb1VSUGRhWXphVDVacEl1TFNrb3M5QUwvb2QrUWFuVFFKNXFkZ2Fr?=
 =?utf-8?B?QVBiQTFRUGJ0VEttNGwzL3Y3OVgxNitPL2M4V2Foa3llbnQ2R0xLcHRycGh6?=
 =?utf-8?B?T3pDbHh3TVpLeGlzYlZTUklFdEZzZXZkZVJiTlRNVE1LUHNtWmdMcFpZT3NK?=
 =?utf-8?B?d3ZHcGdlSVRnQ0pndzEwNEdDM1IzQ2o2VUJZd09iWUM3MGVkOWJsVXFEMDBo?=
 =?utf-8?B?Q1orRUdzRHF4U2t6a2dpTGwvT1pMWFFrVEpxYkhCS3Z6MFlIakdHZlNFRnF4?=
 =?utf-8?B?ZVU3WjB4Rk5qSm5Bc3pJVU1wTk1qNkxzU2dsRWFOc0x3Zm1PWGttYkR4aGFx?=
 =?utf-8?B?QXRPRmU4SXZCU3QzVGlDWHMxSEtDOTUvTFJ0NlRBTVp1ZXNWOGJFNm5kTlJz?=
 =?utf-8?B?OUNENzZXcVZuRm5rb0hLNjA5N1lRc29XMmtjZXR5MFpRNHZNSkl2anQ2WFhj?=
 =?utf-8?B?U1FrbTNFSmRpbTA2QWJSdE51d1VBUm91OXJJY0dlRjdLQ3NNYWZXbVdqYlor?=
 =?utf-8?B?dzlZNUhka0I3UG5mc1FLRlZZcHdPOVA1SVNvblBGMjQ3WGl2bHhqMVVybXpN?=
 =?utf-8?B?WXdpV1pabHVwaHQwOWtBNFMxRm1ZM2FManV6QldyU3ZQK2w4QWNWbEFwYThK?=
 =?utf-8?B?NFMrL3l4dGN4cVhKOG5pQXZnQUVCekVMaEFiWHYwRFJrazBnd1VCUWlWOExv?=
 =?utf-8?B?d2JsN3dzcHlvNzVlS09TdjduSHlCR2Fxd3RCN05TT3EwTjArclBoMTBHRE8x?=
 =?utf-8?B?c1BuMkxKV0RYOHF5UlVOOGtSTzFWTVpCWGszZkEyNXZtNkdkeEoyNkF1ZkVh?=
 =?utf-8?B?UTkxZUhKMGVjR0dxWnhMb3REWVhhYXFlYzZ5aXJDWGRIWExsQWcwM1JEZHN2?=
 =?utf-8?B?eVUvZUpMSk9LUjAwSDdSdk1OcEdWRkoyMjFIREcra1REQmNJSEdCZ3BMT2lZ?=
 =?utf-8?B?VWl2bTlIN2FSeUV6QjVEYlNVeGdLS29XS2l3RVhlcmx5eVRkNFVzSWVKQUFE?=
 =?utf-8?B?NCs2cmo3NUtsS2xuREVSR0xwZWkzL0NGUmV5bTVzRGhFdEdOTVZmb3BXQmU3?=
 =?utf-8?B?NTBSRnQ0dFRWUGFBbHl4TGpVSTVsU29KM3RIZGFIMjdzWFBCWTRjMjFHS1FY?=
 =?utf-8?B?LzRETDRLZXR1aStjbHR4dmZ3aGhEQmFlQXhVeGVCaGtWaWdETlA0ekpscVAw?=
 =?utf-8?B?MXBBd2pqSHNlcGlSVzlYNVdxbGhlRDl1b0pwenNpaXJlSzBjUDJsRmFqNENK?=
 =?utf-8?B?ZERIOGpCS3ZaWXlpZW5LRXN0ZDNMdDJPQ1pFcDR3SmtCZEpJbHptaU9sQ0hQ?=
 =?utf-8?B?R05YYkxxZTYyZ3ExMmNDMnQ3WFlEUVhtWCsvR0Vhb2xDVTM1TWI2V1NuanVR?=
 =?utf-8?B?dHpnMjV0QlpGcyszcEl4QnF4YWZ4VS9wem1vcEZOTWFpYS9GOXg2YTFyZFJN?=
 =?utf-8?B?dmc9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_620AD4AA-2FA6-4D92-A02E-4FB46E4748E9";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22dfbc61-4200-4d87-8bd3-08dabcb10490
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 09:02:49.8005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yx3kI3+beqEAPLTAu2v0MzaLDcHfLRNiKZtaaaY9vFlXrpH/JLYtk59y1GBTnNt7fIGiLW8ngvxc2lassWY8AhYPTxgwDX28IhxPbubUdwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6166

--Apple-Mail=_620AD4AA-2FA6-4D92-A02E-4FB46E4748E9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Sorry all,

It=E2=80=99s been pointed out that this should be the *third* of =
November (tomorrow), not the 5th of November.

 -George

> On 28 Oct 2022, at 15:08, George Dunlap <George.Dunlap@citrix.com> =
wrote:
>=20
>=20
> Hi all,
>=20
> The proposed agenda is in =
https://cryptpad.fr/pad/#/2/pad/edit/5YUquBkUpmg-XuzK8cyvUQ8+/ and you =
can edit to add items.  Alternatively, you can reply to this mail =
directly.
>=20
> Agenda items appreciated a few days before the call: please put your =
name besides items if you edit the document.
>=20
> Note the following administrative conventions for the call:
> * Unless, agreed in the pervious meeting otherwise, the call is on the =
1st Thursday of each month at 1600 British Time (either GMT or BST)
> * I usually send out a meeting reminder a few days before with a =
provisional agenda
>=20
> * To allow time to switch between meetings, we'll plan on starting the =
agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate =
time to sort out technical difficulties &c
>=20
> * If you want to be CC'ed please add or remove yourself from the =
sign-up-sheet at =
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/
>=20
> Best Regards
> George
>=20
>=20
>=20
> =3D=3D Dial-in Information =3D=3D
> ## Meeting time
> 16:00 - 17:00 UTC
> Further International meeting times: =
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2022&mon=
th=3D11&day=3D3&hour=3D16&min=3D0&sec=3D0&p1=3D1234&p2=3D37&p3=3D224&p4=3D=
179
>=20
>=20
> ## Dial in details
> Web: https://meet.jit.si/XenProjectCommunityCall
>=20
> Dial-in info and pin can be found here:
>=20
> =
https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall


--Apple-Mail=_620AD4AA-2FA6-4D92-A02E-4FB46E4748E9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmNiMjIACgkQshXHp8eE
G+0pLwf/ZK0Qlqq05x0b/FMCKB6adNEdnKpyK34tO9Hc5EanHBdHHtkCtoGDqbN5
dFzcRftZqU6eJ2GoXOVSb9345cnkEtr5E5TFl9egLHDVeBACmNCv+984nI93FG1D
uRFSKwefeyUQouhABfJAY9xdCBmv3LBjHf5dcf+vACxYXFPhMCKHVsTvnBUOHpnK
6J7d7DSQB4/Ev6uD9bgGMVSyryxwDohMvzRbTNTGr8OtKahQl6WFi+pYVrK+RvZK
FGZ0UZ8om4SFb1b1G3PxlBN/r12qriSdGwJomZFs3+RlEIR7R5/XhVv3iIoxsh9X
w/fxPLjR4Q7Sw3Qzp0eTuZ0M1cmA1w==
=zHbW
-----END PGP SIGNATURE-----

--Apple-Mail=_620AD4AA-2FA6-4D92-A02E-4FB46E4748E9--

