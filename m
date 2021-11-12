Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27EC44E59C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 12:31:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225160.388854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlUmQ-0008ES-MC; Fri, 12 Nov 2021 11:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225160.388854; Fri, 12 Nov 2021 11:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlUmQ-0008Bw-J8; Fri, 12 Nov 2021 11:31:38 +0000
Received: by outflank-mailman (input) for mailman id 225160;
 Fri, 12 Nov 2021 11:31:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UwsT=P7=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1mlUmO-0008Bm-BY
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 11:31:36 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 168ddd2f-43ac-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 12:31:35 +0100 (CET)
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
X-Inumbo-ID: 168ddd2f-43ac-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636716695;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=EoBVp6sZXnmTwvng/WSjHakALTfE+R/qtmLzrdVJxDw=;
  b=XP2lXV5hWf+Yca0Y4D9hcLpDGjZ97BHENOm/5Yg107mxq2tbo9Iqz9Md
   xHcQnEmnoMPeemUKGLdYFDbH0w03RCBfQ+agBWfUd0RYu39gtolvv7I3i
   UX7yL0/JJybXiEZrDnbfdIw/YbmS/5hUBtF7y57ahySLGY241mUI1amyX
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: b9tCzjmmMWqSwFA+QMXoT0GkF6RB77TcEvnRKlE7HgeC0CMEkrTOaDyDy+i4roruHEZYqy0M+M
 XmmE4j4kzYGO7qjih7Ee7VFzgHs1y4/Zytdbh1OAfcis/VH4w1NbYsg24lFQDwTdicLGAho9sO
 ZZ6kHyAFZsakAOj58CWRN1cyREpTl/xONCSB4fIxVv+9QBs9knswa1BefKeV4H0F7IK0hA0wH9
 yUYDDRq9KbX7apqFeAFcvaER6RB+ZGhDYD+2CWYxPccT41WJZiMO8RbAAiqHdq7wxXnPtZzEhn
 7/9Bu+fiI7Ubhu2S5HU39GSP
X-SBRS: 5.1
X-MesageID: 59642327
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YrfOsq4VlHH3wPOfxXAIdwxRtNvAchMFZxGqfqrLsTDasY5as4F+v
 mYYWDqCOKyLYWf2LYolYI/i9EIEvcfQmNQ2QQo9pC02Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg29Qw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 s126baTeT4VfayTmM4mDh1DDxEjFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALDsDtMcU6s3VpyTjfAN4tQIzZQrWM7thdtNs1rp0fQ6qEP
 JBGAdZpRBPfcjkMNnkaM8MjpOCKr3r2UD1ciXvA8MLb5ECMlVcsgdABKuH9eNaHWMFUlUawv
 X/d8iLyBRRyHMySz3+J/2yhgsfLnDjnQ8QCGbug7PlojVaPgGsJB3U+VES5iem0jFakXNBSI
 FBS/TAhxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9im/0pGIySWpP1RHT2FBQud7sNQqdWEDg
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EVLudRPoXiNevYC9/dhbYgbnC486TfXr1oGd9STYm
 mjS9EADa6MvYdnnPklR1XTOmHqSq5fAVWbZDS2HDzv+vmuViGNIDrFECGQ3D94cc+51rXHb5
 RDofvRyCshUUPlhcwTXEI0w8EmBvartDdElqQcH82Md3zqs4WW/Wotb/StzIkxkWu5dJ2S3P
 hKN41gKtcIJVJdPUUORS9jsYyjN5fKwfekJq9iONoYeCnSPXFPvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUv2+ow8pAdas9w1iOdxrghnnDu7bcmik3yPjOrPDFbIGOxtGAbfMYgEAFas/Vy9H
 yB3bJDRlX2ykYTWP0HqzGLkBQxQcCVgW8mp85c/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQOmHsU9XoS1pMCoyE0yv3nR/M4+j4L1GL8k8fKU99fwlxvlxF
 qFXd8KFC/VJazLG5zVCMsWt8N08LEym1VCUIi6oQDkjZJo8FQbHzcDpI1n0/y4UAyvp6cZn+
 ++81hnWSIYoThh5CJqEc+qmyl685CBPmO97U0bSDMNUfUHgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExMDTWfB7LuwOS3LxUaZwNdNALSSYDTQdGLo46H+N
 +9b+O7xba8cl1FQvosiT7sylfAi58HirqNxxxh/GCmZdEyiD75tLyXU3cRLsaERlLZVtRHvB
 xCK89hef76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgCbQORjCF9LaduNNJ3y
 Ogsj8ca9gijh0d4Kd2BlC1VqzyBI3Fov3/LbX3G7FsHUjYW92w=
IronPort-HdrOrdr: A9a23:8q/iY6rnN7yAykDCmsRUWQUaV5ubL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6K290KnpewK4yXcH2/hsAV7CZnirhILMFu9fBOTZskTd8kHFh41gPO
 JbAtJD4b7LfBdHZKTBkXGF+r8bqbHtmsHJuQ6d9QYXcegDUdA40+4TMHf+LqQCfnghOXNPLu
 v62iMonUvDRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1kjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3TRY0eTFcRcso+5zXIISdKUmRMXeR
 730lMd1vFImjDsl6eO0FzQMkfboXATAjTZuCClaDPY0LLErXQBepJ8bMtiA2rkwltls9dm3K
 1R2WWF85JREBPbhSz4o8PFThdwiyOP0DEfeMMo/jViuLElGfdsRE0kjTZoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4Go+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSivCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9FR6svM7z44HRmyGG/fIyNZ0WY9igF3ekIhlTVfsuYDRG+
X-IronPort-AV: E=Sophos;i="5.87,229,1631592000"; 
   d="scan'208,217";a="59642327"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVMYKT16ALS+DyjSOW9FwD43JPvb2ri9zwRfaVn4p7LBJBqyVQNoYqka12wsr72CMVNrPIZozQbeN8LgGO58biOufqJuldupemPWUNGq09Oz7KI74tyDUg5jVX9UGWL0shR+pZwYAZgL5EhqaFh3B82N1QwphylrxCG3RxjJmnrl4i5dDXpcBWg/SoC0Hiqrsmmk/I//j6EH7/szMxuZgp9Y/AuB6C9lLjLJVkwLj8ZFJdcrPIIQ408D+ll2ZJ2ZB6qRUht0Zc1A5NSvMOo3hvoA8mXPRfpnF8akksP8Oyief/aNQviBKbdlRbzpE6UdAAXgtzLj4mIq3wyyvcTG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoBVp6sZXnmTwvng/WSjHakALTfE+R/qtmLzrdVJxDw=;
 b=Ht2J2T2nHjzS4f0KpT4TcM7wm3plu9XNCAvt9woVDfytRRZNg4qHzy9Ph2EL4RALYKkdG5EK+NDBi2upgKn9l7ThvfZ+ASuIkfo5v1TnKyCQWYNahIXk6ghvvKuOARjIPWIDqwqQ0o+kq09av2ue8pVAYT4RoKOS9zwozBLTHVBhIf4X8iXn36u91fvUFVwflRQaA0DDOpsRnV9soM/OBbC/XxeOKU8PX8Lj4DoIDbsMKvHiBh+e+ALdPn6gP/4y0HXZIcS2+S3TGmGjFg3GEe2ltw1nmGj241GDurOs7uHTc8HO3YQDdi93yPTwsKIQ4Lbx0IjRQGLqa2nBR4iDMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoBVp6sZXnmTwvng/WSjHakALTfE+R/qtmLzrdVJxDw=;
 b=kmpS2GC7IhT7V4wG3ZTr9G2+6FtHmW50UH/s1pVtaVuN2pvWod9BU+Eb15MMFx/QTmW0O/Me2e2bxZs6afh0azN72Mvr0JZtVS4ThHnsUOpVgGbfc4WpZtgplUm4gbxaIqicZvHHbGqtDQTN+MyJI0XlOwNm8Im3OGOc6aRoIEA=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH] xen/cpufreq: Reset policy after enabling/disabling turbo
 status
Thread-Topic: [PATCH] xen/cpufreq: Reset policy after enabling/disabling turbo
 status
Thread-Index: AQHX1hROHogEO/4RQ0eCoyAnBihvQKv8pa6AgAMfxoA=
Date: Fri, 12 Nov 2021 11:31:30 +0000
Message-ID: <c9f80b8d-f411-dd15-fad3-f0a3a740f276@citrix.com>
References: <20211110091935.16906-1-jane.malalane@citrix.com>
 <24971.45471.990917.651108@mariner.uk.xensource.com>
In-Reply-To: <24971.45471.990917.651108@mariner.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e62e401-2b3f-41b5-d3c4-08d9a5cff938
x-ms-traffictypediagnostic: SJ0PR03MB5662:
x-microsoft-antispam-prvs: <SJ0PR03MB5662AAFC731BBC7FB9D9908F81959@SJ0PR03MB5662.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WYqkbu5A6Xelp5YpGmvbuJbSxkuBnHU2C+cdVOida4Ku/laSLR6i8RSmH5nXtGaZGYeEsTw5K1TLulxEA2YmykG5QtwXGGRjLVOpBOHkGUj+otPDJ+9GWnRKKUUstVGjwTK4DAWNDb5eerxpwnVQcOBIFZMDWiyYYC2PwIyj1t460kIVpEf8Ahqnihcog6CsBpm1YK9SC3Zb2UpgXkHaSPX8nm4QnXKOokiNk8PFNGvYYm8BHd/I3c3rQYp9Ab2hNvlUeaB0s+xbOPkKQng9Aa8Nj28kbLGPqU80ojwoJlGgeWlrfTAb5ADR5Nn3sPsa9oOC4g2tV3YDTZTqIC26XpYLQsYxd5tm+JygUnCGFmTIYYxJTMONxvEVhA5coGx2OAWZiFw4HTQy9K4L1ezCBaEG34J3v9sxKLGv5H5j/e8C/5vUVk8otBs8oTrJ9Pn4LCjaXGEdGhxO+EAkgFp8PIlEJCia4aJ/p5k2lI6RFuUr4rkxr9i1vW5Vagf2cO8+ezHVBJXeBU7xK/gA8GuAp6KwyITz2Uo4XHe63+cd3zJZR+wnQvJ+kTtmQS9fkiOmFBqwV8IbDJ3RlFJLejKdWNtk0w/dEehEKqzllSAj32y+4P7ZLsGhXGUwzoxo7vxljIsP60RARsy2E/n0J2/hixp5S7YaYsP+BaUaWF7Lg6D3Ce1Wz+ujTGzO5Fkk7IaBq52H7viRYHa9qcOaJ6rh6zLed8kI8d0XQ5tW0HLap8o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6325.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(76116006)(6512007)(91956017)(66476007)(26005)(36756003)(66556008)(8676002)(66946007)(66446008)(6486002)(53546011)(55236004)(64756008)(31696002)(508600001)(38100700002)(8936002)(5660300002)(6506007)(186003)(38070700005)(6916009)(4326008)(31686004)(2906002)(82960400001)(316002)(71200400001)(2616005)(86362001)(54906003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkpaNk5TM0srNTFrcGg1bE5jTm5rTHhtYkwrVnpwWnJaR2QrNW8wekoyaXBv?=
 =?utf-8?B?RFl6bEhmTWxGOEtLNEVyMUdlT1ZMUWJQT1BGSktvNGwrU0NsUHNhUWEvSzZy?=
 =?utf-8?B?Q1JMKzJKQlRXSmVtcnJ2RWJTTGxXd0FUN3hnREw5aDdiUU8rdGpWa1JhY0l1?=
 =?utf-8?B?MVZqWXE3OEhVZmVVREJMTGV3RVhzY2YvdDQ0WFpZbkpqYlprckRwTjdTMXRn?=
 =?utf-8?B?NzF1UVJFNUNrTDJLMnBEc1d1SzRxNEhEaDFzRWU0K3FQemltdFFtcEhiSHVY?=
 =?utf-8?B?UGY3ZlVoWlVRMEtUQVE3SGlaOXhkWmRYTlRKNW0xUWV5bmtqR3EvMWhMTWVx?=
 =?utf-8?B?YlJtOTVZRkVUNjlsYitCNXRzem4zVTlZOHNMSFd0a3dJdHQ5RjZpNW5RZ3VK?=
 =?utf-8?B?cWFYWDdJS2RpUXN4dXNTekxQTlkwWUJKYUhTYWsxME92ZGJyL2NBWEsrbGFa?=
 =?utf-8?B?dVVrMHBCU016ZVFuZTFyRWg1WktoOUFmK3hYQzBzTVBpbk5vclp2UXFpSURN?=
 =?utf-8?B?dmJycVdVT3R6WXU0aXlnSENNSU0yQVdvcHZ4WDFYU3J0eVQzWk42MUg4VTUw?=
 =?utf-8?B?b2IrWEtZeE9RWDF6elBFMmRnUWlQNnhOeXRzeWpZdFd4ZGlYcEw5dzBEeFY1?=
 =?utf-8?B?ZFNGOWgvRlZSbU5yUkxqWkg2bjdKUm5FbENURUh3cVY2THloaXZHamRKYU5j?=
 =?utf-8?B?U1Q5VkcxNlZ0STJZdjI1NysyU0ovZG9kbklrM2NnRlVEVFM4UG4wOGMwVjNy?=
 =?utf-8?B?THdkdTNJNnlrTlRCT0toR3ZZaXU2TmpEUEJFYVhidy8rbHRvLzlSM3pLQWls?=
 =?utf-8?B?R0FMM1JRQVJCcncxeXNyYTQ4bHB4SCtWSzBwS1l5ZXgxZUI4ZXcvODE1MFFF?=
 =?utf-8?B?RVZSTDNCdUMrL250WmRBeTZ3UXhZK3FaSU90L0NYUGdDM1RQMlliczJVY3Rt?=
 =?utf-8?B?YmdYdkNLMS9VUmlaSmNVVjlMNnlXYXNSMHkzczZxWnZySWF1MlhOdit0L2d6?=
 =?utf-8?B?NWdFSVpkWmEwaXh0Q2NxRW5XOEhzOC9ZTTdnNk5yN0QxVGNLTndobktBS1lQ?=
 =?utf-8?B?SlVoQncwL1lrOENYT1U2ZjJVdE9GNW9jVWNjU2c1bjZlR0tCRGtFd0t5a2M0?=
 =?utf-8?B?SnVTUUx4aGpEM1hhTUdqQ3J0QjZDVEZrYTIraXd5eGJrWi90UWtwNWdReXVu?=
 =?utf-8?B?Q0Q2czlpUGdIb3dORDJ3TWV2OWkyWkhIZWRiS1hOc0lyWmRodTA0aEgyelFv?=
 =?utf-8?B?Qm9Ody9Pam9ndHJDSUtSN2tNZVBTVmlDWGx3N3BTdXZXRG45bVRTK0o2Wmh5?=
 =?utf-8?B?dU9uaDcwaWdFeU1FU2xTVVRMOWxtamUxdlNXTTlKd0dhREp5NXIvM3VMWWV2?=
 =?utf-8?B?QnltRlJFaFV6dVMyeldNQlh3WjlTZE1PSVdEZkJNZ1JOQjBIL3ZXS3V2OGFF?=
 =?utf-8?B?VnlTQW1zRVNxZXE4QkJuT0JyV1l3dVluMGpEN1FoYUNjMUJlV1Rvd1BvdExt?=
 =?utf-8?B?eXMrZS8zb2x1TkZsT2NXRU84QmJEWUQzNjRTcmNKRWRTak83MmZZNzdvVFZs?=
 =?utf-8?B?ZDU0dzgzQ0FLaTl5ckJpL2xiUEM5VUZncHYySitCeWNDRlFFNmQ2bHJhK1dm?=
 =?utf-8?B?bXFWVmtCZmdCOTg0TUJxL0YxbVc4eFdOSm45QWpmcE9samdJSkw4N3IwQjF3?=
 =?utf-8?B?V0Rud3dPVGx6WjJhMmsrQVRXN3hXQlZ2c1JkQWVkSC9tSm1Ua2ZaWHZkaWZt?=
 =?utf-8?B?d0hrYjFnTVJNbXBwaW5VeEpQSi9BVk85QVdzbHR2MDZ2eFB0Ulp6dzZBays2?=
 =?utf-8?B?NkMyUUszdzVzaEtZU3NpSFBuNHArc2dsaWQzSmF0d0NYYXp4YkNyOVFEclRS?=
 =?utf-8?B?THEyWU0rNkdVOXRORWZ0Q1Q1bDkxUEp1a2o4V0xhUnlNN25UMTVPLy91TnFL?=
 =?utf-8?B?ZXREY3QxNFA3NUU3QTZaVktvc20xSmtyS0ZhTGhoOWN6TzNwVXpmNDB3cDdR?=
 =?utf-8?B?UzNUNGhCT2VjbmlNZXByVHk3TUhRMFJ2ZnVtd05VNmhYY3lKSE1lelZMbGFm?=
 =?utf-8?B?QzNMTDNIbkt0cnpkaWMySC81ZGVtNDZaOW5MVmp3WGMzRG94QUo1a3lMSTgw?=
 =?utf-8?B?L2lDVG43VmlOa010L25OcjhaWFE5OCtjcW1uYzhiV3A5OUtVdzBtT0toZzMx?=
 =?utf-8?B?VUVQRTdpNE1HMTZITVVQaUU3b2NlWitqUmhtOVJMbjU1VG1ibDZ3M1BVenlj?=
 =?utf-8?Q?fnPnfqzsixoEutmsv7wEBKbqZd7k8jmBaEHTfXaeRg=3D?=
Content-Type: multipart/alternative;
	boundary="_000_c9f80b8df411dd15fad3f0a3a740f276citrixcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e62e401-2b3f-41b5-d3c4-08d9a5cff938
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2021 11:31:30.7112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1Y+eoK/0cn/DwzRaEMeiLFxENkcpHRkeWPNH7FQr15yVjiVQNBbQI2ID6lzLEAcv18LEWd1SkTR/vRs7S+JMVj07yCN0ROcJPrIztvujEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5662
X-OriginatorOrg: citrix.com

--_000_c9f80b8df411dd15fad3f0a3a740f276citrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpPbiAxMC8xMS8yMDIxIDExOjQ4LCBJYW4gSmFja3NvbiB3cm90ZToNCg0KW0NBVVRJT04gLSBF
WFRFUk5BTCBFTUFJTF0gRE8gTk9UIHJlcGx5LCBjbGljayBsaW5rcywgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bmxlc3MgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29u
dGVudCBpcyBzYWZlLg0KDQpKYW5lIE1hbGFsYW5lIHdyaXRlcyAoIltQQVRDSF0geGVuL2NwdWZy
ZXE6IFJlc2V0IHBvbGljeSBhZnRlciBlbmFibGluZy9kaXNhYmxpbmcgdHVyYm8gc3RhdHVzIik6
DQoNCg0KQmVmb3JlLCB1c2VyIHdvdWxkIGNoYW5nZSB0dXJibyBzdGF0dXMgYnV0IHRoaXMgaGFk
IG5vIGVmZmVjdDogYm9vbGVhbg0Kd2FzIHNldCBidXQgcG9saWN5IHdhc24ndCByZWV2YWx1YXRl
ZC4gIFBvbGljeSBtdXN0IGJlIHJlZXZhbHVhdGVkIHNvDQp0aGF0IENQVSBmcmVxdWVuY3kgaXMg
Y2hvc2VuIGFjY29yZGluZyB0byB0aGUgdHVyYm8gc3RhdHVzIGFuZCB0aGUNCmN1cnJlbnQgZ292
ZXJub3IuDQoNClRoZXJlZm9yZSwgYWRkIF9fY3B1ZnJlcV9nb3Zlcm5vcigpIGluIGNwdWZyZXFf
dXBkYXRlX3R1cmJvKCkuDQoNCg0KLi4uDQoNCg0KTm90IHRha2luZyB0aGlzIHBhdGNoIG1lYW5z
IHRoYXQgdHVyYm8gc3RhdHVzIGlzIG1pc2xlYWRpbmcuDQoNClRha2luZyB0aGlzIHBhdGNoIGlz
IGxvdy1yaXNrIGFzIGl0IG9ubHkgdXNlcyBhIGZ1bmN0aW9uIHRoYXQgYWxyZWFkeQ0KZXhpc3Rz
IGFuZCBpcyBhbHJlYWR5IHVzZWQgZm9yIHNldHRpbmcgdGhlIGNob3NlbiBzY2FsaW5nIGdvdmVy
bm9yLg0KRXNzZW50aWFsbHksIHRoaXMgY2hhbmdlIGlzIGVxdWl2YWxlbnQgdG8gcnVubmluZyAn
eGVucG0NCmVuL2Rpc2FibGUtdHVyYm8tbW9kZScgYW5kLCBzdWJzZXF1ZW50bHksIHJ1bm5pbmcg
J3hlbnBtDQpzZXQtc2NhbGluZy1nb3Zlcm5vciA8Y3VycmVudCBnb3Zlcm5vcj4nLg0KDQoNCg0K
VGhhbmtzLiAgSSBhbSBwb3NpdGl2ZWx5IGluY2xpbmVkLiAgQnV0IEkgaGF2ZSBvbmUgcXVlcnkg
YWJvdXQgdGhpcw0KcmF0aW9uYWxlLiAgQWRkaW5nIGEgbmV3IGNhbGwgdG8gYW4gZXhpc3Rpbmcg
ZnVuY3Rpb24gaXMgT0sgaWYgY2FsbGluZw0KX19jcHVmcmVxX2dvdmVybm9yIGlzIHBlcm1pdHRl
ZCBoZXJlLiAgQXJlIHRoZXJlIGxvY2tpbmcgb3IgcmVlbnRyYW5jeQ0KaGF6YXJkcyA/ICBQZXJo
YXBzIHRoZXNlIGlzc3VlIGhhdmUgYmVlbiBjb25zaWRlcmVkIGJ1dCBJIHdvdWxkIGxpa2UNCnRv
IHNlZSBzb21ldGhpbmcgZXhwbGljaXQgYWJvdXQgdGhhdC4NCg0KVGhhbmtzLA0KDQoNCkhpIElh
biwNCg0KDQpJIHRoaW5rIHRoYXQncyBub3QgYSBjb25jZXJuIGhlcmUgYmVjYXVzZSB0aGUgb25s
eSBvdGhlcg0KY2FsbGVycyBvZiBfX2NwdWZyZXFfZ292ZXJub3IgYXJlIF9fY3B1ZnJlcV9zZXRf
cG9saWN5KCksIHdoaWNoIGlzIHVuZGVyIHRoZQ0Kc2FtZSBzeXNjdGxfbG9jaywgYW5kIGNwdWZy
ZXFfZGVsX2NwdSwgd2hpY2ggc2hvdWxkbid0IGJlIGFuIGlzc3VlIGJlY2F1c2Ugbm8NCmZ1cnRo
ZXIgYWN0aW9uIGNhbiBiZSBwZXJmb3JtZWQgYWdhaW5zdCB0aGUgY3B1IHdoZW4gdGhhdCBmdW5j
dGlvbiBpcyBjYWxsZWQuDQoNCg0KSSB3aWxsIGhhdmUgdG8gc3VibWl0IGEgdjIgb2YgdGhpcyBw
YXRjaCwgc28gSSBjYW4gYWRkDQp0aGVzZSBjb25zaWRlcmF0aW9ucyB0byB0aGUgcmVsZWFzZSBy
YXRpb25hbGUgc2VjdGlvbj8NCg0KDQoNClRoYW5rcywNCg0KSmFuZS4NCg0KDQo=

--_000_c9f80b8df411dd15fad3f0a3a740f276citrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <58B9918AE855C741A3E270EB8E409721@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPHA+PGJyPg0KPC9w
Pg0KPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAxMC8xMS8yMDIxIDExOjQ4LCBJYW4g
SmFja3NvbiB3cm90ZTo8YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9
Im1pZDoyNDk3MS40NTQ3MS45OTA5MTcuNjUxMTA4QG1hcmluZXIudWsueGVuc291cmNlLmNvbSI+
DQo8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPltDQVVUSU9OIC0gRVhURVJOQUwg
RU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVudHMgdW5s
ZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMg
c2FmZS4NCg0KSmFuZSBNYWxhbGFuZSB3cml0ZXMgKCZxdW90O1tQQVRDSF0geGVuL2NwdWZyZXE6
IFJlc2V0IHBvbGljeSBhZnRlciBlbmFibGluZy9kaXNhYmxpbmcgdHVyYm8gc3RhdHVzJnF1b3Q7
KToNCjwvcHJlPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+DQo8cHJlIGNsYXNzPSJtb3otcXVv
dGUtcHJlIiB3cmFwPSIiPkJlZm9yZSwgdXNlciB3b3VsZCBjaGFuZ2UgdHVyYm8gc3RhdHVzIGJ1
dCB0aGlzIGhhZCBubyBlZmZlY3Q6IGJvb2xlYW4NCndhcyBzZXQgYnV0IHBvbGljeSB3YXNuJ3Qg
cmVldmFsdWF0ZWQuICBQb2xpY3kgbXVzdCBiZSByZWV2YWx1YXRlZCBzbw0KdGhhdCBDUFUgZnJl
cXVlbmN5IGlzIGNob3NlbiBhY2NvcmRpbmcgdG8gdGhlIHR1cmJvIHN0YXR1cyBhbmQgdGhlDQpj
dXJyZW50IGdvdmVybm9yLg0KDQpUaGVyZWZvcmUsIGFkZCBfX2NwdWZyZXFfZ292ZXJub3IoKSBp
biBjcHVmcmVxX3VwZGF0ZV90dXJibygpLg0KPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cHJlIGNs
YXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPi4uLg0KPC9wcmU+DQo8YmxvY2txdW90ZSB0eXBl
PSJjaXRlIj4NCjxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+Tm90IHRha2luZyB0
aGlzIHBhdGNoIG1lYW5zIHRoYXQgdHVyYm8gc3RhdHVzIGlzIG1pc2xlYWRpbmcuDQoNClRha2lu
ZyB0aGlzIHBhdGNoIGlzIGxvdy1yaXNrIGFzIGl0IG9ubHkgdXNlcyBhIGZ1bmN0aW9uIHRoYXQg
YWxyZWFkeQ0KZXhpc3RzIGFuZCBpcyBhbHJlYWR5IHVzZWQgZm9yIHNldHRpbmcgdGhlIGNob3Nl
biBzY2FsaW5nIGdvdmVybm9yLg0KRXNzZW50aWFsbHksIHRoaXMgY2hhbmdlIGlzIGVxdWl2YWxl
bnQgdG8gcnVubmluZyAneGVucG0NCmVuL2Rpc2FibGUtdHVyYm8tbW9kZScgYW5kLCBzdWJzZXF1
ZW50bHksIHJ1bm5pbmcgJ3hlbnBtDQpzZXQtc2NhbGluZy1nb3Zlcm5vciAmbHQ7Y3VycmVudCBn
b3Zlcm5vciZndDsnLg0KPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cHJlIGNsYXNzPSJtb3otcXVv
dGUtcHJlIiB3cmFwPSIiPg0KVGhhbmtzLiAgSSBhbSBwb3NpdGl2ZWx5IGluY2xpbmVkLiAgQnV0
IEkgaGF2ZSBvbmUgcXVlcnkgYWJvdXQgdGhpcw0KcmF0aW9uYWxlLiAgQWRkaW5nIGEgbmV3IGNh
bGwgdG8gYW4gZXhpc3RpbmcgZnVuY3Rpb24gaXMgT0sgaWYgY2FsbGluZw0KX19jcHVmcmVxX2dv
dmVybm9yIGlzIHBlcm1pdHRlZCBoZXJlLiAgQXJlIHRoZXJlIGxvY2tpbmcgb3IgcmVlbnRyYW5j
eQ0KaGF6YXJkcyA/ICBQZXJoYXBzIHRoZXNlIGlzc3VlIGhhdmUgYmVlbiBjb25zaWRlcmVkIGJ1
dCBJIHdvdWxkIGxpa2UNCnRvIHNlZSBzb21ldGhpbmcgZXhwbGljaXQgYWJvdXQgdGhhdC4NCg0K
VGhhbmtzLA0KPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cHJlPkhpIElhbiwNCjwvcHJlPg0KPHBy
ZT5JIHRoaW5rIHRoYXQncyBub3QgYSBjb25jZXJuIGhlcmUgYmVjYXVzZSB0aGUgb25seSBvdGhl
cg0KY2FsbGVycyBvZiBfX2NwdWZyZXFfZ292ZXJub3IgYXJlIF9fY3B1ZnJlcV9zZXRfcG9saWN5
KCksIHdoaWNoIGlzIHVuZGVyIHRoZQ0Kc2FtZSBzeXNjdGxfbG9jaywgYW5kIGNwdWZyZXFfZGVs
X2NwdSwgd2hpY2ggc2hvdWxkbid0IGJlIGFuIGlzc3VlIGJlY2F1c2Ugbm8NCmZ1cnRoZXIgYWN0
aW9uIGNhbiBiZSBwZXJmb3JtZWQgYWdhaW5zdCB0aGUgY3B1IHdoZW4gdGhhdCBmdW5jdGlvbiBp
cyBjYWxsZWQuDQo8L3ByZT4NCjxwcmU+SSB3aWxsIGhhdmUgdG8gc3VibWl0IGEgdjIgb2YgdGhp
cyBwYXRjaCwgc28gSSBjYW4gYWRkDQp0aGVzZSBjb25zaWRlcmF0aW9ucyB0byB0aGUgcmVsZWFz
ZSByYXRpb25hbGUgc2VjdGlvbj8NCjxmb250IGZhY2U9Im1vbm9zcGFjZSI+DQo8L2ZvbnQ+PC9w
cmU+DQo8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPjxwcmU+VGhhbmtzLDwvcHJl
PjxwcmU+SmFuZS4NCg0KPC9wcmU+PC9wcmU+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjaXRl
PSJtaWQ6MjQ5NzEuNDU0NzEuOTkwOTE3LjY1MTEwOEBtYXJpbmVyLnVrLnhlbnNvdXJjZS5jb20i
Pg0KPC9ibG9ja3F1b3RlPg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_c9f80b8df411dd15fad3f0a3a740f276citrixcom_--

