Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A961A55341A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 16:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353270.580193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3eRm-0003xL-VG; Tue, 21 Jun 2022 14:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353270.580193; Tue, 21 Jun 2022 14:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3eRm-0003uc-S6; Tue, 21 Jun 2022 14:01:38 +0000
Received: by outflank-mailman (input) for mailman id 353270;
 Tue, 21 Jun 2022 14:01:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ORL=W4=citrix.com=prvs=164d1f6c5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o3eRm-0003uW-29
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 14:01:38 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a919ab5d-f16a-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 16:01:36 +0200 (CEST)
Received: from mail-sn1anam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jun 2022 10:01:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5059.namprd03.prod.outlook.com (2603:10b6:408:d9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Tue, 21 Jun
 2022 14:01:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 14:01:24 +0000
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
X-Inumbo-ID: a919ab5d-f16a-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655820096;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Yta9BEyH8+hwyBurT2yw57GJo+fTM3zHvJT7jvCa2Bo=;
  b=f95t1icOH2BFgl2D4AdZI+bH3dRA7GfaxyXxUh3gMFTBFb7a2RGi9RPW
   D4slj0wb+HCLiWCp67V8doNPG/aD87PFfHnseZ+txf9bgT3UgekaKC95K
   2tbCW5uAjVSV5sJjd5UbdlrAoEPdXwllKrztRWOE/WzhiG3i7L5lB1Mlf
   I=;
X-IronPort-RemoteIP: 104.47.57.49
X-IronPort-MID: 76638111
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GtPJea1CREv2QPF/jPbD5aRwkn2cJEfYwER7XKvMYLTBsI5bpzNSn
 zcZXT2OM/+Ma2Lzc41/PI2//E8G7JLTn4VjHQdupC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1Ek/NtTo5w7Rj2tAy2IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1fpLKPcyMnMJTQhe8YYR4IFXFVOupZreqvzXiX6aR/zmXgWl60mbBVKhhzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82cBfmbjTNb9G5YasRmNPDSf
 ccGLxFoawzNeUZnMVYLEpMu2uyvgxETdhUH9gzO9fNuugA/yiR4z7roEMrJSuCYROhWwkyni
 mvX5DjQV0Ry2Nu3jGDtHmiXrv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWUNVaL
 k0I5ic0toAi+UqzVN7/Uhak5nmesXYht8F4FuQ77ESWzPPd5Q+cXjIAVmQZNI1gs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZo8L/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:SnYcza29aEQBkB2o4ICH3wqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.92,209,1650945600"; 
   d="scan'208";a="76638111"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pgzw4b5vTRdvb/qS4XVBdQGFtvI2q23Ajho+QGSibG6J+SrzyhiT79XEklUnhJuumDn+wQnSf82K2sb+R5NXz0WhtqZ7SII8Z046uheEKnPRaX0Q0qS+bE8qKscb8h8X6OUEeV93hCwXFCb2Ce5G1PnbKQBf5Vdvy2IDNE3QuBi4oOC6sNDl929RqI81hI/xJczlD68LpCS9ZPTtYyLlpmipyGT4I4YLP9EuWp3ERJ20J4aox7h1pAeoGWZprgX4ekiaYRAWESEvOO9NtozeAcetDXHqurSVQk165pcLKX2zKJBOv2ZPs5aUeeSXC7Xj8M3QJWawxvEDYwLc83BA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yta9BEyH8+hwyBurT2yw57GJo+fTM3zHvJT7jvCa2Bo=;
 b=Vu7ajkoqOX//yWQZA1NnxlNQmE5RUbnW+WWj0iaQGDgpYHUwZTHHJdsdGjnweKVLzOn8g0ta4TIWltbPmqITk88dizGOcXkzFTK+JhcRIOKxdftXIs6JwSUz8LNHHlo3Sxl7oKiPLONRn90vZIBOv60g5qw4JZkyGe4iiG0GfKouyPzr8/DgkcFOyUndB8oXB5vMjnW8JNkSBNGegV2SD0nATA+uGrjXlC3njjRhacU6gOpLfOfIfcdBL5lpOG/yPDNZyZC6dSgQUlpDgTLNAHxcTeb9ibBA7Xx1KtkWXCTvJdvecrqgKCAnrNVFm1siT+4vbLk30Tn1MKZOoXQUSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yta9BEyH8+hwyBurT2yw57GJo+fTM3zHvJT7jvCa2Bo=;
 b=bCcMys6SeCvceBjkV8gDIIeQfD1pV1ujhytPS227b34/c6ejbbQvQkKHWtrUNmcEC2kKv6bLSfdgPJDf30NYWcm2A8cInq5GFuZRgOfZH0CuAxG16ZkvslXhFEFgKpgIdQt48e5d3ShQsLd+9x5FUuaoTPAD7OfKXJC/CSS1OFE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "committers@xenproject.org" <committers@xenproject.org>
Subject: Re: disabling mercurial repositories
Thread-Topic: disabling mercurial repositories
Thread-Index: AQHYhXXQrdr64fwrwEqfZHy5KYkmJq1Z49yA
Date: Tue, 21 Jun 2022 14:01:24 +0000
Message-ID: <925e715d-df9f-4bb8-616c-389c5c58f479@citrix.com>
References: <YrHMSJg6Rx9ULvr6@Air-de-Roger>
In-Reply-To: <YrHMSJg6Rx9ULvr6@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2186810d-58ee-49f2-f9db-08da538e86fc
x-ms-traffictypediagnostic: BN8PR03MB5059:EE_
x-microsoft-antispam-prvs:
 <BN8PR03MB5059433BC7D4A26504A332C5BAB39@BN8PR03MB5059.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lRcfYD+kuvcAlCZ9VH30YZxi6mH3e195egagnqPYXxM9IUBYRTegRd3e9qYLh2JREpttxR0yGw7CksHrXXNwTnkM3h/hGG0CfPEkctLkdsArayj1Nft8P3DTcaLS8criULexG38AwdGTD90H20WnPb2XUhPBe1wEXz/ix8or6wQcyOGbXx9Rvx8VhxBM2lMzUwrmhmYb+E6eioZ1y7XYQCXQ2nxnpMZvHCD4qDkZWmTc+JbE/Y2qD23yWzVk6uT3ku99d76xQfQs8JhR4QaulrfBZTGJf9vDJYx0iEX0JP0xytusrPbdXPFX/xyydWhc392OWqrsxusH3m5x6Yk0vIUh7BHTWszR5gslQ7N1S3GtdMVG4RCmsG0vTrL+7JBeR5pninBmrrnApz5vPPRajC78A5zFBd4A2azTMpBDVdgQM0oms2HQzHQZzzvfTSz/hIRF8IWYvkSrt/R1BlXa5BwrZV2s8rBbNG07wbEFPcfFVHnkYdX5OoQRapGiRalkKx5uCyFzoOPkKcmqYYa3S62QSaeaztCaR4C3EMi9XsTMQPT4mLHkazHMHZbc+NlkImfn1nG6tdidUIUPzSp5HVvEeAzPgN2+f9bFnLSPlH6H+Mqd/MMEz6G/0LcGo9nG0fhuN3CMmWyE8anvk1HDRr10QgRQqlvzrKDPtBMq0LxAX7pV5RzJfg38FTLSg2q26OyM/i5rTmTGbIq9CubvnhNvaPNUW02a4kVTJqt+2pHAhJD6gUpYtEo57TP9QgWle5Rh0Jq/+/dvLLfmRO0y4A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(91956017)(31686004)(76116006)(66946007)(36756003)(66556008)(7116003)(66476007)(478600001)(2906002)(83380400001)(8676002)(6486002)(38070700005)(4326008)(3480700007)(186003)(64756008)(110136005)(66446008)(71200400001)(8936002)(316002)(82960400001)(5660300002)(86362001)(122000001)(41300700001)(6512007)(38100700002)(53546011)(26005)(2616005)(31696002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHE1M2tqbVBLMXdvZ0s3d2pkSExPaDVnV0NDaGV0dHRCems5TDNBOGgxMzBL?=
 =?utf-8?B?S05TbXVReEw1ZkFZcVhXYWVvdW90czlwZTZ6aWRxdFlkZTRNVmE1Z0ZaMmcv?=
 =?utf-8?B?K3EvVlZMZEJzaDdUM3I2TjZ3WEN1bXZ3MktBUCtTRnhlY21UeXZWQVFKbGkr?=
 =?utf-8?B?dXlzbXBtUlcwckY0TmNtRjZCTXVCNi9xR1FRdXI2OU4zeWpJSGdiWGZ3YnR1?=
 =?utf-8?B?STBSUHl4VDd4QUljaTlmL0o2WlZ0b0RUQllDSVcyaFBPM3ZVT1RwTDZJQWpD?=
 =?utf-8?B?NWdLZ2NYTnpEcXhXdG1SL2VWbmd6Wi93bUM2MklDQWk5WnlIUUZFYzNaWGYz?=
 =?utf-8?B?VFhkM0UzczJ0aHltWjNjZ2JPWW1lbmwwY0svSGR1S3NEU3FVT2p4c0I4cGVC?=
 =?utf-8?B?WlJEbzBPSCtYdVhDNXVVbW9sVjk3ZFloSHZUdXFodS95a0pDZEFjamVSVCsy?=
 =?utf-8?B?NVdoZVhmNWwrZHVqM1dFeWFLZDFPNXdOWXhlL1liL0VwVGZUd1pMWDh3b3lQ?=
 =?utf-8?B?S2p4N1RUZTY3NmphOVoweThtUzlBWFVZd2c1c2wybzdMUFpTQWlJUG1TbjNK?=
 =?utf-8?B?ZS9nT01ML3gwSkhtYnJkOEpYMVIyV1BvUnhKU1IrRXF0TCsxbHU0M0U0NkJU?=
 =?utf-8?B?VG1sV2hFeDlTY25lSTVrZmhIcXQ0U294b0JnUTdQUFdOblNYK28zL2QzTi9S?=
 =?utf-8?B?a1NzdXJFaTdsaVQ1NURzb1FzbHBCcTJZcU9XZUFqMXNmTW54QXBvUUs1NEVS?=
 =?utf-8?B?NW00OE1mdGxDM284cTJWb0JzMjZ1UWtWVHlSTmJzOXB0M3doNTNqZjBqSW40?=
 =?utf-8?B?Ym9SS3lxMzNxZGFlU1plUUwxeis0bjREWm5rMmwwdElBMWpkanpoaXlVV3R0?=
 =?utf-8?B?TGZjM3pSY0hzbzhQTjNuUThUeEEzeiszOXBjWWlMSUJuOXVxK01wYUNqTUtR?=
 =?utf-8?B?OTBhSmU3S1VQdVVuZU9aZUhVb0hHZEkrWkJYRzAyRm1DWExDNU1rN2l3MmJP?=
 =?utf-8?B?d1BhZVVtRkZ5VDlKeEYwa0tYR0Z0aERiaHRxOUJYR2pzVjF1SlFsYUE2UjdK?=
 =?utf-8?B?NGd6SFNTN1RscVJiNWlHZi9lcktLWHRzWFl1RFp6U2RmRzB0OTBWZ01wM3FQ?=
 =?utf-8?B?Q09LZHgySU1qMjA0VkdQOFk1Y0J6Skl4VHQ3MGx2dHdIVVVtY1lSd0s5aE56?=
 =?utf-8?B?VXhWYWZBSGNuTkpqU0t6blloWHQ3ZVQ1dXZiVDMzU2pIRTZGMFl2Unl3OUhJ?=
 =?utf-8?B?eTNpWUQrRzFNd2JuRnYvelpsSi90NFhyY0JUYXB2bXp0QlJnNDZWSVdMVWhr?=
 =?utf-8?B?RFB6TStyczkrdXFBTSs5dlhjMUxlU0lTMmtEQW00NG9TNzFSRmdKY2x2MGdG?=
 =?utf-8?B?QXFyWjUza3g1QmlNaFA2YVZsbHpCTmxkelZrQmpQOU53UHRrTEVIa2xqcDJT?=
 =?utf-8?B?Uzg4VGVxSEprbmxkV05sMHN0ZHpQa2lCWlZFWTVOSkE4ZVhtWE1OUklkNjcr?=
 =?utf-8?B?UWZhOFJOd0c1WHpzd1lMKzFuekk5T2hoV1pkZDZKYnVTMjRGYXVOV0Z3VGxj?=
 =?utf-8?B?LzNGMEM3QlNjWFN3dkNLY3hHMS9QQUxGcmdhOGdmTVBDVm55bndMazNKRWZo?=
 =?utf-8?B?WEZKc2o2bW9YQ0U4WUZQWnF6ZnQ1TCtyVHZTMUpVek5tcStIMXFiVUlacjVY?=
 =?utf-8?B?M1RKZ0JrdEs2bmV5WjNYejV0M1Mwd0tqeXkvU1Q3cHVnTGxoZnBPQzlOZTZu?=
 =?utf-8?B?RE14ZjZTWUJ1eU1mT1JQTjFmMW9GbnpmclVNRjZqR0ZHN0Y1MStJbHJFTEc1?=
 =?utf-8?B?L3VRczJVVTRYUzhWd2VBekZackpkQUJ2bHRhMTh5SkNzRzd4enQyL3YzNkhU?=
 =?utf-8?B?dG9UVFNHSHd2ck95c055UEtnbnFXcktvUCs0MEY3NXBCRTZHcG8xRTdWbE4v?=
 =?utf-8?B?bEZpMDhHQkJKdEY5ZjhFYStZZDlUaHNCbFU3NlRaeXFpclE3RnhmblhBK3JQ?=
 =?utf-8?B?L3lxRWpVMHlMNDZ4RnF2TUF2a1R5NXJPZGdQYlRtaGN5eGFRclRjbVNFY3Jn?=
 =?utf-8?B?dGxLMVZEQnd0djEwU2ptVU5obUpvZXJCWlNqaUlHRUdFc21hSnZCT3F2cHlT?=
 =?utf-8?B?UWFBRmhldXZlVWY3QlRZVk1LSTQ2enZLVkJUMW41ZDMzZVF1RlZ6Q2VnRlNN?=
 =?utf-8?B?bCswZEVaVHBzcEtNVjlJRWtzYWJZaFpKalVrRXlVT2J4TEs3NUR2YlRMYmdm?=
 =?utf-8?B?NjJwTjVCMVhtODh1Mkk0aXoySTJyVGxrZDVTS2syWFN4OU9WcDJBUC9nZ2Yz?=
 =?utf-8?B?Qi8rTkhLRFJqaTZnWDRGR2F2dWpFZ0JMTnlReWdFZHNiZEZIMHRreG9EcE9L?=
 =?utf-8?Q?XLwTs7XyW5GZiRnM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AF80604B63C944C9E67A037633D5E9D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2186810d-58ee-49f2-f9db-08da538e86fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 14:01:24.1221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: COHiJKBBZprEmNQiK4B2RcA3VCYp2+Z9lzLSS/nZUYl+6yPtC+JhJeMIDbBHFcZr4W/S0isb6lY4uyjSkM3n7/444M/iBnIbpmy/w25FuBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5059

T24gMjEvMDYvMjAyMiAxNDo0OCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gSGVsbG8sDQo+
DQo+IExhc3Qgd2VlayB3ZSBoYWQgYSBiaXQgb2YgYW4gZW1lcmdlbmN5IHdoZW4gYSB3ZWIgY3Jh
d2xlciBzdGFydGVkDQo+IGluZGV4aW5nIGFsbCBvdXIgbWVyY3VyaWFsIHJlcG9zaXRvcmllcyBv
biB4ZW5iaXRzLCBhcyBjYXVzZWQgdGhlIGxvYWQNCj4gb24geGVuYml0cyB0byBnbyBiZXlvbmQg
d2hhdCBpdCBjYW4gaGFuZGxlLg0KPg0KPiBBcyBhIHRlbXBvcmFyeSBzb2x1dGlvbiB3ZSBkZWNp
ZGVkIHRvIHJlbW92ZSBhY2Nlc3MgdG8gbWVyY3VyaWFsDQo+IHJlcG9zaXRvcmllcywgYnV0IHRo
ZSBjb250ZW50cyB0aGVyZSBhcmUgQUZBSUsgb25seSBmb3IgaGlzdG9yaWNhbA0KPiByZXBvc2l0
b3JpZXMsIHNvIHdlIG1pZ2h0IGNvbnNpZGVyIGNvbXBsZXRlbHkgcmVtb3ZpbmcgYWNjZXNzIHRv
DQo+IG1lcmN1cmlhbCByZXBvc2l0b3JpZXMuICBUaGlzIHdvdWxkIGhvd2V2ZXIgcmVxdWlyZSBt
aWdyYXRpbmcgYW55DQo+IHJlcG9zaXRvcnkgd2UgY2FyZSBhYm91dCB0byBnaXQuDQo+DQo+IEkg
d291bGQgbGlrZSBhbiBvcGluaW9uIGZyb20gY29tbWl0dGVycyBhcyB3ZWxsIGFzIHRoZSBicm9h
ZCBjb21tdW5pdHkNCj4gd2hldGhlciBzaHV0dGluZyBkb3duIG1lcmN1cmlhbCByZXBvc2l0b3Jp
ZXMgYW5kIG1pZ3JhdGluZyB3aGF0ZXZlciB3ZQ0KPiBjYXJlIGFib3V0IGlzIGFwcHJvcHJpYXRl
LiAgT3RoZXJ3aXNlIHdlIHdpbGwgbmVlZCB0byBpbXBsZW1lbnQgc29tZQ0KPiB0aHJvdHRsaW5n
IHRvIG1lcmN1cmlhbCBhY2Nlc3NlcyBpbiBvcmRlciB0byBhdm9pZCBvdmVybG9hZGluZw0KPiB4
ZW5iaXRzLg0KDQpJSVJDLCB3ZSdkIG1vc3RseSBtb3ZlZCBvZmYgaGcgb250byBnaXQgYmVmb3Jl
IG1vdmluZyB0byB0aGUgTGludXgNCkZvdW5kYXRpb24sIHdoZXJlIGdpdCBiZWNhbWUgbWFuZGF0
b3J5LsKgIEhnIGhhc24ndCBiZWVuIHRoZSBwcmltYXJ5IGRldg0KdG9vbCBmb3IgYWdlcywgYW5k
IGdpdCBoYXMgb25seSBnb3QgbW9yZSB1YmlxdWl0b3VzIGluIHRoZSBtZWFudGltZS4NCg0KSSdk
IHN1Z2dlc3Qga2VlcGluZyBoZ3dlYiBkaXNhYmxlZCBmb3Igbm93IGFuZCBzZWUgaWYgYW55b25l
IGNvbXBsYWlucy4NCg0KfkFuZHJldw0K

