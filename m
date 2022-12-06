Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE064455B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 15:11:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454942.712539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YfY-0003oS-Sr; Tue, 06 Dec 2022 14:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454942.712539; Tue, 06 Dec 2022 14:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YfY-0003md-P6; Tue, 06 Dec 2022 14:11:36 +0000
Received: by outflank-mailman (input) for mailman id 454942;
 Tue, 06 Dec 2022 14:11:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XkKw=4E=citrix.com=prvs=332b12f58=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p2YfX-0003mO-2b
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 14:11:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d854e778-756f-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 15:11:17 +0100 (CET)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Dec 2022 09:11:28 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5326.namprd03.prod.outlook.com (2603:10b6:208:1f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 14:11:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 14:11:25 +0000
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
X-Inumbo-ID: d854e778-756f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670335892;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=c+m0npt4QPyeDUEqio/9UYts7YZIW4XOwko6on8dO3o=;
  b=V3Wb//LGaxJLqpFj9D51bulQzHYKnjUJ8JcYhrVKvYG6GznvpSzZkuDy
   zA7i+8lUhY+CSKEpkHSRFVdxXt5IEfQSYWfUa9qMHRsTcorrUkEVgMbE8
   K/h0OEw1TYYvvNIb4DlTT5td/i+ardDrY+Om1X9HZnjuw9Eq28+yEG3Ev
   g=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 86834801
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cRZ6a6siAEh3q6o40Ecp7Ot+LOfnVHRfMUV32f8akzHdYApBsoF/q
 tZmKW7VM/aOamryfI8gao3i8kIO7JCBx9IxGgpsrH82Qi0a+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWGySFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwOTIDKQu7gciP0LuLWPRIqskZAtjJFdZK0p1g5Wmx4fcOZ7nmGvyPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/60b4S9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPO3mpqU20AXKroAVIBNGW3ufvKWBs02/GI5fD
 U5K+DIripFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakc5oRAt5tDipMQ/i0zJR9M6Saqt1ISqR3f33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:tP1+5qg1lTwVl7hPvN0yBYGM3nBQX/R23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8bvYOCUghrTEGgE1/qs/9SAIVyyygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3vpxA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu1/h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboXcTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp9aZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wWR4SqbpXVN
 WGPvusosq+QmnqNkwxeVMfmOBEa05DWStuhHJy4fB9nQImxkyRhHFoufD31k1wiK7VDaM0pN
 gse54Y6o2nBKUtHN1ALfZETs2tBmPXRxXQdGqUPFT8DakCf2nAspjt/dwOlamXkTMzvekPcb
 n6ISVlXFQJCgvTINzL2IcO/gHGQW27UziowsZC54Jhsrm5QLbwKyWMRF0njsPl+pwkc4fmcu
 f2PIgTD+7oLGPoF4oM1wriW4NKIX1bVMEOoN40V1+Hv8qOIIz3se7QdurVOdPWYH0Zc3K6Bm
 FGUCn4Jc1G4EzuUnjkgALJU3eoYUD79YIYKtmswwHS8vl4CmRhiHlntb3i3LD7FdRriN1HQG
 JuZLX6j6i8uW66uW7V8mQBAGspMnpo
X-IronPort-AV: E=Sophos;i="5.96,222,1665460800"; 
   d="scan'208";a="86834801"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTYG5Cm91ZvTLvdn82F5BH/1Hm3VoL9iTSrsCJfNXuQgi6mOlUmSQG9KnKuKBAwJHuFEJfzUP53Ho4sUxa0AWPkRUhKJOcA6EfL8S/W4cWMPmcGg4EHhDqQc6hOVrKenTu5x5+LGnCNaLYk2uXEiJEGHF7IK8pbaingCOCsBIGN57e/N/hKFblTuxQQuUl/e5b/bY3rc4i+uTkthK5yR2C64cFYisDMdBlew1/sak9cwW97PQC0CF23OGZKxxUVFgFsiKIhLNz95pwJRnVQ48Rs83nqvffKCQBypc+dsAq7QDEoAOjSI5Tt9ljYD/9efE0036MzWW1XmPRDQDwD48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+m0npt4QPyeDUEqio/9UYts7YZIW4XOwko6on8dO3o=;
 b=nrEYylHZRTiD4nLmE3AJJVYoAAXp3yTHVa56Njwy0X8EUBr/JuxBCnzJ03lAqQ6XFnf0Wquvd/IlCEjHPbcwP/ILAeyIf1qNJrkkpJ2dsRiuQHnrsfP9l4atzS4uxMZMUFP2hphALuf3cLw2cNuEUxeoyfxT2bVNN2s/MpF6hrpjSArC5Ch9cmqS9uK3ui2PhGufSfcfpZcoUMcuLmhLrFmhVshgAlgL0dawqGcGT7tTr4HYqobmyJsPW87v+aZbn4wJ5hHhi/SmwWpbXo/cMrdjFUAyf98500BH5PUu+5CNxXHvfaUIBT8s1SiEGqLxdxJ2cfbKgFAZP0lZRzxykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+m0npt4QPyeDUEqio/9UYts7YZIW4XOwko6on8dO3o=;
 b=hmkFZKgmpvHdjpaX4AVsXSJpBoKKnml7IsimlBoLLnUOdYiU7DU0YyQeQrgvZXz1E3bosmHt/Ub+bHjmERZWF0jS6WLD1yYUz1BUDRfAY/4i+c95l1dYZM4knpopr7xjmM57TaQ6FdxSCqXkh79Eooh8fbP5at3iY3uvOkDsors=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v2] x86/HVM: drop stale check from hvm_load_cpu_msrs()
Thread-Topic: [PATCH v2] x86/HVM: drop stale check from hvm_load_cpu_msrs()
Thread-Index: AQHZCXKwXDE1jnevJUKUK9JuHADt765g5lqA
Date: Tue, 6 Dec 2022 14:11:25 +0000
Message-ID: <38c1b465-c2ef-ebf7-151d-3de32453df5d@citrix.com>
References: <8462a401-17db-1b34-de7c-d0407ffd92e1@suse.com>
In-Reply-To: <8462a401-17db-1b34-de7c-d0407ffd92e1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5326:EE_
x-ms-office365-filtering-correlation-id: dffe43f6-0cdf-42ac-4c1d-08dad793c2c4
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +Aj+gwTOuC0O+/3tMcEiKLIUXO9frvSGGiGOBvQhBye+pefOYZciL6XuD4leoF51rffmDprfNTo7Zm/v7Ornb+hhMooOTQWIZpBh94yNxqMW1PtLzgwZ4IK6koS06h6T11jJpYeI74zT5Blbks+SqTmi1TvBXsp6f8M+aQs/hV+canxrzHLlrqEPgfUcv0LlhP8V5XrnoDkHKYg8MPL1/AOHg9CtSFkpxwmWMBEBV4e3PSjsaRW8XGGgzSGLezhCPUQi6Vn7XifcxsUjyA/a/z0GDz++eFB0Bml6YCP6kokQdHE6LOhPuBmZyKlBys9fxGeJ8xhOUhdZxuiyiYBJTXBpx3074DrLjX2GHUXHXrsKsdkMMp6IKYXqxkhKPt43xmr19VI1drnFw61RZCfZr2N0/xxCh+W8keGfW+nQaq+yuKkzcdeFrUyB0vwTs+5XBF9fXGIUgYZwyyd7FX7RH1VqoKMRvOIjivEWKv49B8wxuA/IhIzy67nrgQ4FACsxes/EEkVLe4/CzhGGcS1fOSa+oLkdUsRpru3IKDrLYHLtMGvgi+QFILwvp1K7FeHu6hwt3ZyjvTh+JBgsRmibYM4OqMeIagUfLpg/d++jf5Df/s5KpTMFvsslsniTjuFMEJhqme1GAloL0DgEAtzg16Rd0NrYwX8DnTb1Fs4o91q7ShTJVS1Kf25dtghl2OFoa0XXwymzSj8xH9qrFKoP4S2vU5R8H5dEJyFV0U9ox4pbykR/Z0QXLsTNBLKgZ+Jx+w15b+InkoE2btDIwdXPkA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199015)(66946007)(71200400001)(6486002)(53546011)(31686004)(6506007)(91956017)(6512007)(26005)(316002)(110136005)(54906003)(4326008)(31696002)(86362001)(66556008)(76116006)(8676002)(64756008)(66476007)(66446008)(38070700005)(82960400001)(2906002)(38100700002)(41300700001)(2616005)(4744005)(186003)(478600001)(107886003)(8936002)(36756003)(122000001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aHErcGJ4dVdybEEzTjRhQ0VkOEl5UGV4SzlicVdjOEhTZkVKZEpITWpmL05i?=
 =?utf-8?B?K0tXVm1XQUlyUkNzNEJDNjlvb01DSHhRcWNtQUtjbnNMMXlhN1VZQ1cxVlEy?=
 =?utf-8?B?L21LT2VuSHpFSjlqbnBoOHFKZ3psb3lvWDNmMzJwczA5dHJpb2ZDVzhTb3l1?=
 =?utf-8?B?WEFZM1RrSzQ1bG9iL2lLcjdUU0Y2Z3RFdm9VQytVTW9aQ1BGdEdjQXIzd0Mw?=
 =?utf-8?B?enduU3FDd0ZBSVNSNG9aR1pmcnYrNFp1S3hZUEtqbVRyMGFVNmpwcy81YXF0?=
 =?utf-8?B?dGZYdDdMdjVGZVR3dG90MFdzMDh0TU8vRTIxemZRektrZzlIdHJQR29Rd3BV?=
 =?utf-8?B?dVJhWTNOZElBRFF3bjNkTVo0OU5SaW5XOUY4OWFLTDFjUFJsSFRBQjlFcitN?=
 =?utf-8?B?L2xrTnNiRk9YbzREWEJVcmMvQ3ppZ2gwVUlLU1F6Tk9RN0NQZVo3eThVZzZ4?=
 =?utf-8?B?N1c3NnJoQUtBcjR5WVNhZ3lTTEFzVjkxNjAzY2l0MTlQbkh5YmlyTlJZWnBx?=
 =?utf-8?B?Y0J2dDZ2ZHo0LzlnM3ZQZWthMzZCSm96VDRlRWgzRzhUWm5oVUVuOEt1RnNG?=
 =?utf-8?B?RU9vd0NTZnJDdGhTU3RPMEhiZ3dMalBqZmUwZGNxZWVsejBncUd1MzdiOFBo?=
 =?utf-8?B?NHphY1M3L2hFYWQ1NDAzaTJZV3NweGc1bHRWWmkwZU0xSW5JRGNsTnRjeHRW?=
 =?utf-8?B?NEczVnhQbDRFN3ZzQXFGUmhFWmJTQXN1Y0ZrV1pna3hETmQydHFncjhFdUVT?=
 =?utf-8?B?NjlHL0VJYmVvT1pmUVNoZXdCamxFZkJnUmxsTDkyRzJjM01KSGxLaWUyTGNP?=
 =?utf-8?B?bk11VFZoeTFTSHIwU1BHVDBjMUhpZGFvWFdZb2RDSXltZnl6dmkrVXRWUUU0?=
 =?utf-8?B?ejlQUUdwQ2l0Y3RyOXdJU2lyRnhxbk5IR3dYaUNnRW1MYnZYaWc5TndDdWZH?=
 =?utf-8?B?MnE0VVRSdy95REVkV1o1cCtwYTJtUzk3WUZmYTI2Mk1xL1g4R1BwcHhMZEJV?=
 =?utf-8?B?ZElCQVhweFlUc3dzKzRNTXZjOXdLQWU3WUloNEd3T0wvaXlwTWEwWDlwRjM2?=
 =?utf-8?B?cm9ROHVqQ3I1aEx6Sm5pODVUcGFXNTdUQWZPM2RxQ2YzWHkzckFDMGRFOTAz?=
 =?utf-8?B?eHJFdVUrMldWMU8yUGJ2Y29kRmtIRkxoUFF6VTBrRXAxYmE1Snc5bjN2VE50?=
 =?utf-8?B?R0FjQjhITks1OVNNLzk2RHM2d3l0QlBEeHJLSkNqcWJKMDJPVUZ4b1VMNS9k?=
 =?utf-8?B?WHRUSHV0bmdjaVBRWjRGaGZxbXlTWmJXanhTVGdFYkU1a2U1MnpKSVpWTDc1?=
 =?utf-8?B?eklabWhBNWErKzZTd2huT050cVI5ekxseUlYNmVCbHVPaEUzaE1YMVFpVWlS?=
 =?utf-8?B?N0QxTmZZV09aQ2xiMEE3RGlkOENxM0tQQjhkbUVORG5FR1hDTzBIM2NyaW9F?=
 =?utf-8?B?emhXNnhGeE1qcWs0MHNRRDhrS3hUTEJTL2ZrcFdQVm9xY1pmdkt6ZFdoMWVo?=
 =?utf-8?B?bnIwbFZxMGdRNzZPMVJaZ2tkRm5PL0R4cVZmb0ZRSm51L3g4UjUyUnFNK3p0?=
 =?utf-8?B?c3RhVWwzWnpxV3FFRi84dUVOc2dVVzlQaXNmRkJrZG1saGFqdjVkSEhZTWxl?=
 =?utf-8?B?WWdZSGNOZGc2SXp5TzVEdUNLY3RncTFZOWlwdk9qYXhnL3puY0JnNHRiMU14?=
 =?utf-8?B?aXd3MGFxbUZ0R1hidHc5Z2d3SjdQY04wVHE5Ny9Ga0RNM2R3bjdGNEI0bmRz?=
 =?utf-8?B?eVZzbnI4MnVGaWk1WmxVNkJNekJZRDZ4Qk9IeHZBTWhZYnlLM2Z1TmNqeEhV?=
 =?utf-8?B?TGtwRnVvTUhHWm5EajBDeDNtNlYweDJVZXAzVFlUbnBUTExDYWpHT3k2bE56?=
 =?utf-8?B?cTQzbE1EL2F2Tkxsa2xZd2VUYUtBVDlMeXhSSWR4a3VHZnhVNXEvOE1IZ29Y?=
 =?utf-8?B?dnV5L3RXRGRONDBHc3VKZmt4N05BTlROdXJ3blM1ZnhrbUg2NnVBZmF3ZldZ?=
 =?utf-8?B?ZEFyUXVxQ1dKcVNGcmdjVWFCa2FJbWY2aU56K2ZyMTArdkR1aFl4VEFlaUJY?=
 =?utf-8?B?ZjJXNmdLWS9MSWlCQVF4RG83dXFXeFRWaHdnWDl4OHJ6dXdlT3p1Q095RC9R?=
 =?utf-8?Q?TRGxjqGokToaHSq25z0fVW5HU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CF94C420286A84EA7D5E554D6A61AE4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4kbK8KRP6u8LS8WSj/YXb39gzMioW9ZF0WxlBXVX0YwsRyEbOtz2I/rka7aJJKkNVTgHa70h8S9eDBDMyf+YDC3gLzk1whysCNUlQ+OlzJB247WzBz7PKmPYan9/KcxSaRcvLRPOUkGyAXkKJtU2vRZn8dgk7ERrDLRChjJc7bRcB8Kc+Ak0UyEai5OLu3fnQm7iXe1W0kCAMA6R2sIeW//xKg8qwbsTav1VuIjzYOhYDARcPMXnmL9F3xsznnPd8EVLswn5P0IpqVeRZsgn59MVnpEXAzE64wPoaYiaunPZ5eUECcjs3FucuHZHEzfwClb2FcqVDnFDIdpIR09qjmkbGPlTq4Sn41pgabVtIqh8qb0HwXqn7EfM18MollwIdq4QTXtj/BykD+sIitf0jE3H736f3VDYvn7ZkvcdEiU/OEpvfLRQbHQUPq/K1IHwMl21OlCfH9o+D0OATX0/Je8/RJ5amZxzk4CgKz16/rp6qtbMOiL4lSC51dTaHiU1KnkrIeThn3YXKDdnXJIwtAXRcXArklue552MGUSXEiNOCZkB/n4bg7L1heSiwWPBoIHrM6BQUnm/a1aKJvsJvHrirMd1SjtpyP7AjGpI0/XXSRuQKkGhEbgmEGmPaAN4xIjjGK+9NLpHNv7MtW3QTxuVGJ1Ihztq1IU/5k0HA8Pvr4Ca+JZTvjHPLJcqMKN3lmmoTisArGAR79MMZGiv1WVDRLm7ZLkJxxf7EbtBX6dX2Gc3SFb45AuISJIw0USVgXWbuJ/SeMrBsJ2hQT2SdO8jxqw7lOG5ejZrLhh1sTz1pQbRKoNvwyMSFbEXW4Bg
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dffe43f6-0cdf-42ac-4c1d-08dad793c2c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 14:11:25.3686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yZlcmFXuwAvpGoLv/TIyLMgojpj4OwLCLsqpohI0tFr/vQG8iSKVXiayoGRsJqvvr8SoIBRxZ05o4A8o8tDGVljDMf+6ThDZqjDJppS58Vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5326

T24gMDYvMTIvMjAyMiAxMzowMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFVwIHVudGlsIGY2MTY4
NWE2NjkwMyAoIng4NjogcmVtb3ZlIGRlZnVuY3QgaW5pdC9sb2FkL3NhdmVfbXNyKCkNCj4gaHZt
X2Z1bmNzIikgdGhlIGNoZWNrIG9mIHRoZSBfcnN2ZCBmaWVsZCBzZXJ2ZWQgYXMgYW4gZXJyb3Ig
Y2hlY2sgZm9yDQo+IHRoZSBlYXJsaWVyIGh2bV9mdW5jcy5zYXZlX21zcigpIGludm9jYXRpb24u
IFdpdGggdGhhdCBpbnZvY2F0aW9uIGdvbmUNCj4gdGhlIGNoZWNrIG1ha2VzIG5vIHNlbnNlIGFu
eW1vcmU6IEl0IGlzIGVmZmVjdGl2ZWx5IGRlYWQgY29kZSBkdWUgdG8gdGhlDQo+IGNoZWNraW5n
IG9mIHRoZSBmaWVsZCBpbiB0aGUgZWFybGllciBsb29wLg0KPg0KPiBXaGlsZSBkcm9wcGluZyB0
aGUgY29uZGl0aW9uYWwgYWxzbyBlbGltaW5hdGUgdGhlICJlcnIiIGxvY2FsIHZhcmlhYmxlDQo+
ICh1c2luZyBhIG5vbi1zdGFuZGFyZCBuYW1lIGFueXdheSksIHJlcGxhY2VkIGJ5IHN1aXRhYmxl
IG5ldy9hZGp1c3RlZA0KPiAicmV0dXJuIiBzdGF0ZW1lbnRzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

