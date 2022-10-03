Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D865F379B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 23:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415046.659524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofSsk-0008Tj-OD; Mon, 03 Oct 2022 21:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415046.659524; Mon, 03 Oct 2022 21:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofSsk-0008RJ-LQ; Mon, 03 Oct 2022 21:21:46 +0000
Received: by outflank-mailman (input) for mailman id 415046;
 Mon, 03 Oct 2022 21:21:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tjbh=2E=citrix.com=prvs=268c0e076=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ofSsj-0008RD-9M
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 21:21:45 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fa1dfc1-4361-11ed-964a-05401a9f4f97;
 Mon, 03 Oct 2022 23:21:43 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2022 17:21:39 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6201.namprd03.prod.outlook.com (2603:10b6:408:11e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 3 Oct
 2022 21:21:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c%4]) with mapi id 15.20.5676.023; Mon, 3 Oct 2022
 21:21:37 +0000
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
X-Inumbo-ID: 5fa1dfc1-4361-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664832103;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=tiHU+bIXklVqxNLUEra5VirIyiweR3h6T6rLIb9iM9k=;
  b=Sd55VbrWHwdH5dj76oxRB0VPPNJKjP0gfhsXrvjhRXpel5WHeRM+5znR
   K0q+FntoVpj48FHkVx4i5inaPElyRi4QYaHOWgqKd4uMg77T2R6y2BOGk
   35a8TD3EAT1q77AyHtkj7xSlJ8aBhDh3CylPZw9nkgKOeFj5rAr4epH+b
   c=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 81016703
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GlYKvaKdkUexlrjGFE+R45QlxSXFcZb7ZxGr2PjKsXjdYENSgTMDn
 zFLD2qAPfaONjHzetlwat+18EJV6paAyNdrG1FlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15q2q4GhA5TTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FaYCpvl8MW1Nz
 NoFdhEzZCDfncnsm4vuH4GAhux7RCXqFKU2nyg5iB38U7MhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9Q3T/PVvi4TQ5FUZPLzFGdzZYNGVA+5SmV6Vv
 Dnu9GXlGBAKcteYzFJp91r837eWw3yjA+r+EpWWythyon+x/VZQUhkaaHHiqtukg3CXDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBLSNrmK2YTzSa7Lj8hRO/PzIEa1ALYyAsRBEApdLkpekOYgnnS99iFOu5i4PzEDSpm
 jSS9nFh3/MUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswqByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:Cdwgo66XFqFkF8vjlQPXwX+BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhIU3Jmbi7Scq9qeu1z+8/3WBjB8bbYOCAghrjEGgC1/qr/9SEIUHDH4FmpM
 BdmsRFaeEYbmIKwPoSgjPIderIqePvmM/HuQ609QYOcegeUdAF0+4PMHf/LqQZfml7LKt8MK
 DZyttMpjKmd3hSRN+8HGM5U+/KoMCOvI76YDYdbiRXpzWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y78BnBzGXehq4m1ucJi+EzRfBkuPJlaQkEuTzYJriJnIfy+QzdldvfqGrCVu
 O85yvIcf4DrE85NVvF2icFkzOQqgrGrUWShWNwyEGT3fAQDlgBerd8rJMcfR3D50U6utZglK
 pNwmKCrpJSSQjNhSLn+rHzJmZXf2eP0A8feNQo/ghieJpbbKUUoZ0U/UtTHptFFCXm6Jo/GO
 0rCM3H/v5ZfV6Tcnic5wBUsZWRd2V2Gg3DTlkJu8ST3TQTlHdlz1EAzMhamnsb7poyR5RN+u
 yBOKV1k7NFSNMQcMtGdZE8aNryDnaITQPHMWqUL1iiHKYbO2jVo5qy+7kx7PHCQu178HLzou
 WzbLp1jx9CR6u1M7zw4HRiyGGyfEytGTLw18pZ+591/rXhWbuDC1zydGwT
X-IronPort-AV: E=Sophos;i="5.93,366,1654574400"; 
   d="scan'208";a="81016703"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aY7o3/5A0giTK2p70LBMco+oMwR5L25R9WwB5tRqWTmlW6hUa/p5Ag/kWNVMYyb6sILmX2JG2L3yHtV5vQOo9JyjeOG1mO+oOaPR/gPRKCmP2SOupW+CEN2z8X3jP/9Uq8j7WISfLMJO/sVW/2hc1KVAlX1ZljOBQNKfIwCY6UHfXxk0hWIvGJlNKNWxQ8xvktT1UvaFpn9IUqE5+84UyHcoswSKGqLrcY6S5iugON9xy7V7bScWKA660TZaW+RkDf1nmSnplvAyOK6w2r7DRBJ5AgrFDTwfLXOBkyAX46Q6bOAw0bPrJthfZCO1PJec3aQicj2uwgHdlYtATPZtzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiHU+bIXklVqxNLUEra5VirIyiweR3h6T6rLIb9iM9k=;
 b=BGkeo/GgM0fc9m9oOOXThND0p1uqlcI3H3JHEoFDKLp2G9SAYKz5eLk2cTaf46XWLxcAMkS2VgbpRAhu+szANbgYW7Hz3DTIfB6I9Jy8YKaiw3ZOwdmvhr+vex72Rp/hPmJDLfsB+s7ZVLDA1a/qopSPDeB2YnD/t+U7AzAW2kNBgarHO9iuLRX7Nhsl3SdnbsRE4RHtnrVhtndiiZAha9r9j9eEciEDfnL5kdepCpH+EHnztXqr4f0SNfgjMTmhc63VBWxrW8ARXag2QeScyxVfXlBh7hAGm0LjQODWVdD+er1Ebn/sTLqZ+MbGi95wmEnqEBmh1hJAvGzUdU7xdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiHU+bIXklVqxNLUEra5VirIyiweR3h6T6rLIb9iM9k=;
 b=K4oFzfwAD0ZGVReir9qRyujE9sGiOXd0pulgilYm/uzfKUvd/ffmS7A4nqtxoxsM8bONJw54oMTgoI6m9Eo6mrmHwlgHftQqqkJEqiPBru5MYhRxbKoxvCdXYS0kgvkjk5EGCjBZhJQJdC8xcYSCO9bxsTZDcM1lVyOfRmyUNkQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>
Subject: x86 NUMA error on OSSTest box
Thread-Topic: x86 NUMA error on OSSTest box
Thread-Index: AQHY124ffCJyPjQjLEmHNxgebZjhFA==
Date: Mon, 3 Oct 2022 21:21:37 +0000
Message-ID: <5dba58e7-491c-d396-ea1c-de03dc0053bd@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN9PR03MB6201:EE_
x-ms-office365-filtering-correlation-id: 351b61bd-2711-43f9-d819-08daa58541ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4Qg9xfXXloT31ZxWbY5C2Nx+Cplm0rn1yb/87RI6/HGnFc/rQoWdWg/s8DeX/ANSsR65QX0t8ddA1XEkDGWvK0mXyEi4dDFzCHBT0DhI4hC354rw1GswoT6erKY/HhbDoabwgH9ArGzdBzusLMOWrefbqF/X7m0GUsjQlfzvvPhAgu+XUDUzkTCaEZ6GQs1M+D6SGPdRXRvOlpHILLFFTupPrA7JFmhCUgQqtHibK5rvXbRyr76GeIrlf7NR27McRx2OfVaZbWU3Uz2a6EmPF7poWdc9KIz+sAclF8W67V7ySNcmQx94l2N9N0KmwMafcvCtfxiulpJiur0NKS81JNxWMxWlFz+23u5cUQH/xHYBQ/dj8wUZ0UVnYjCkjtKru88Ph+yJvYawV9n9mbvtCGickJlik3f1EILHDccbd3wMs9aHiFN/cmt/08yWCVdDMjXsej8+EQFxjm/1GLgHEgOH2PbyRA5mYkHsjcbp3k0LRbnfz+BbMUvocKe99WaUEQnR3nGbnbacx8jKcvsQhyQAirpW4RWPWP/D9l0Q9SyBNtNTksSBiSr8m56vfj5BBZk0FcDs3iysTuXgNrGeJv9glQw3bBOxyyxX9aUQeF1qr8f9Tpw5uEcjocO6lq7Sp5LbtMEKgW430H8rPPD0yDejjPeHQ7pK86rbMphnev7SLIuNy3ZH/eG4C9/i4u7BtWTAF9LmPPV1EN+tHDdlV60sSkYcolJNEP68bMNfQjA4TsIIN/Hv02dkIA11/tvt/XU3WRlgiX8tucObvfzKLlOK6WdywVRF/73z68qspdROjpskceOzvqSbtF30wGIuadKY7CynPkyNnvXRBkAaMA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199015)(4744005)(5660300002)(31686004)(71200400001)(122000001)(478600001)(8936002)(26005)(2906002)(31696002)(6512007)(316002)(110136005)(38100700002)(86362001)(41300700001)(82960400001)(6486002)(76116006)(2616005)(66946007)(66556008)(66446008)(186003)(66476007)(38070700005)(6506007)(4326008)(36756003)(8676002)(64756008)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?emZVakJ2TXpUdEM1enl5OE93UGRJSnN5NDIwNXR3bHZiS3VvZkFBUVhQLzl0?=
 =?utf-8?B?d1J6UXIzZy9OQjAzczhrSW5rTUwzanBEZmM5YnAyWVhvNU9EbVNNb2tqSmh2?=
 =?utf-8?B?ZkV3TWVUR2M1M2wxb1dnSUJWY0FFR0JTQkwrcXFGOXNxdjdnQTJvclpJZS9N?=
 =?utf-8?B?Zk5tS0xtcXBnYlFRZGJNaU50ZUZNNUFHTzFkd3hmM3VaYXBtTEI3MTVXallU?=
 =?utf-8?B?MDZqanRIb2xRN0ZjdWMyRVlUODJ2SkJOamlwUjh5SzBxSHFrSGFiSWUxTm1N?=
 =?utf-8?B?dWo4ZTRyQ3JXajAvZ0hvbVNJM05BK3JaS2txMkx0c3ZoSjBnZkx3SXRzV253?=
 =?utf-8?B?RytrQTZLVU14Wk1zTWVpMHgxS1pBZFBhV2VPTkxiRjFEdXRzcHdzRFZqSGdr?=
 =?utf-8?B?ZmMxdWNEdDdwRVRtTzBKalBJNHh6QU5oUW1SZEtLN0crT3I5dm9SckhhT0Fj?=
 =?utf-8?B?Vjd4VzVqTllFUzJZeUlFOTZXWlBHYjdKaEVNVmI4MU1WQnVpS3R2Ti8vWWlo?=
 =?utf-8?B?dk5rcU01VkQ3ckwrMjk1WEZDd25wSU5hZitpQTlBOVdncjJSTWd0bzc1RHV4?=
 =?utf-8?B?QStmRTBYUHNQNEg5ZEpzM2VDMXhyN2QxTUJBeWM1T2x0czJhZG1uamdUcS96?=
 =?utf-8?B?RW55eFhONmNabVg1R2pWRm14ZW5vSTJNaHpkY2Z2VUFncjFDOUg3ZGVwTkgx?=
 =?utf-8?B?RGMzY0FqcGFwbEZ1cTEydzdRc3dBbElNbExFRGhJaUpWY1VTZEpFcDQxV2h5?=
 =?utf-8?B?WUhPNHlIbW0yeWsrL2xlMGtXZ294SHpKdVlnZnRKMUQ3OEVBOXA2ZjhxT0Fl?=
 =?utf-8?B?N0xqMVk4dFBUUThoNlpPeGY1TGNQOWRCTnB3SGhGQ1p1YnR5ZHMxdUhpWStx?=
 =?utf-8?B?Z3BTUzlwMHAvSG1FMUJkYUlSaGlYOXBwV3pPRlI3SnZNKzM2M3RvTjRJRzcx?=
 =?utf-8?B?SjhYbkh3Yy85NVhlUWhORTJ0MlJQMVB5QXp0SC9uOWhOK2kwT2Y4SGpsUVVT?=
 =?utf-8?B?UGZoNDZFdHVYUGNydXlYd3RaaXd5dnRrelY2emgxdWl2RS9mRzFDTGc5T20x?=
 =?utf-8?B?RVUwMjhibTNOTFBnd2Znbk1IbTZ2anJ2MUNLTlhyQUZqemJvZTFaVjVxU1FE?=
 =?utf-8?B?cnR2cVNmdmtvUzJDT3lFUFpZVlRicDFOWXEwTG1TODRkVCtnYjhEV3h1a2dp?=
 =?utf-8?B?cjY3OHE1eHNSeWVWRzU4Sm9nODh3RzFRUXArRTUrNks4S2FNdWdUeUFXa1Fp?=
 =?utf-8?B?SkZJOVBoNmZ6a3ZuQjFQMzVoWmtkNTVTQi85c3hzNUtIQXJNclJrQjljZXRq?=
 =?utf-8?B?TUd4QmswbGRBdDdDNENIT2hHcTBqR3VQSWF5em9mSElIUmF5M25SQXU1UzlS?=
 =?utf-8?B?dlRtVzNNcDQ3YlJKQ2xrRjREQUpwdjVDSHJLeHpoS2FPNFcwYXVRWWFiem1t?=
 =?utf-8?B?cy9PY2hzVzBzbURBMHZwRnh2MEVJKzVoNlNxTVR6d3hXTzlFVjdFenNRd2ZC?=
 =?utf-8?B?WEwxWkxUSjFNOEQxeFNaU01IaldGYTJxODlXNHRyaFFid1Bqek1uS2tUQkly?=
 =?utf-8?B?NTRId01lemNubFhlTUJZMnJqSFZGK0h3cFUydS9tZ2pSeHo5TVdGUncyYWdG?=
 =?utf-8?B?bWMwbjVaTGliZ0JpRkJpZDNuVmpUN2lNVHlEWVhweW04YzJzWENCWTZyZlll?=
 =?utf-8?B?akVzODNFUEtOeTlEaVduNmdSNmxwdUpGN0RHa2ZraGJQb1ZBWEo3OFVQbDZB?=
 =?utf-8?B?MzVMSTBwNWxzYWEyaGw3NTFaWjVEdkRBV3F4aktCMVJ4UWU3MklnSGU4cHEw?=
 =?utf-8?B?V3pjRmpGMlNqZ2xtYi9seVRnSGEvQ0JuYTRIYlpJL2tQc09sTXlYMkpyb2FR?=
 =?utf-8?B?TStmb3NiNTZVVTRqQ0JwelEyQUhqMG1oNGdtNnlvcFFJZ0t2MFR2THYwZmR6?=
 =?utf-8?B?NVh5ZTcreE9NbFVkVkJTd2RWTU1YZCszMVkzZ3dZcDlBZTNGNERqaDhlVm5l?=
 =?utf-8?B?Q1NFYWJhSUFLT3RnR3c2VlFiREdMc0hBZTl5UkNNdFR3RUdad3MzL2dBTGJV?=
 =?utf-8?B?MmEzWjA1QzZKeXY4bXVIRng0Q2sxWWZJMUpaVXpnbjdJYjNhWXZGalN2SmRJ?=
 =?utf-8?Q?tw9aKdohWyF0EdDvnt+rjRime?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78C3AC9FD83B4049909AC6C71B22C86B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351b61bd-2711-43f9-d819-08daa58541ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 21:21:37.7401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vGgITgJFHPKhr/4ECyf/T0Sm1ZNVTitZ6YqczaTZ7MNiZTAfoFqksYnxPRO8C3Q7HSR2V4twGo7TTUbvCA+fd1uZS/udarr7bEFNBa6pDnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6201

V2hpbGUgd29ya2luZyBvbiBhbm90aGVyIGlzc3VlLCBJIHNwb3R0ZWQgdGhpczoNCg0KKFhFTikg
QUNQSTogRUlOSiA2Q0I5RDYzOCwgMDE1MCAocjEgT1JBQ0xFwqDCoMKgwqAgWDctMiA0MTA2MDMw
MCBJTlRMwqDCoMKgwqDCoMKgwqAgMSkNCihYRU4pIFN5c3RlbSBSQU06IDMyNDI5TUIgKDMzMjA4
MjA0a0IpDQooWEVOKSBTUkFUOiBOb2RlIDAgUFhNIDAgWzAwMDAwMDAwMDAwMDAwMDAsIDAwMDAw
MDAwN2ZmZmZmZmZdDQooWEVOKSBTUkFUOiBOb2RlIDAgUFhNIDAgWzAwMDAwMDAxMDAwMDAwMDAs
IDAwMDAwMDA0N2ZmZmZmZmZdDQooWEVOKSBTUkFUOiBOb2RlIDEgUFhNIDEgWzAwMDAwMDA0ODAw
MDAwMDAsIDAwMDAwMDA4N2ZmZmZmZmZdDQooWEVOKSBOVU1BOiBVc2luZyAxOSBmb3IgdGhlIGhh
c2ggc2hpZnQuDQooWEVOKSBZb3VyIG1lbW9yeSBpcyBub3QgYWxpZ25lZCB5b3UgbmVlZCB0byBy
ZWJ1aWxkIHlvdXIgaHlwZXJ2aXNvcg0Kd2l0aCBhIGJpZ2dlciBOT0RFTUFQU0laRSBzaGlmdD0x
OQ0KKFhFTikgU1JBVDogTm8gTlVNQSBub2RlIGhhc2ggZnVuY3Rpb24gZm91bmQuIENvbnRhY3Qg
bWFpbnRhaW5lcg0KKFhFTikgU1JBVDogU1JBVCBub3QgdXNlZC4NCihYRU4pIE5vIE5VTUEgY29u
ZmlndXJhdGlvbiBmb3VuZA0KKFhFTikgRmFraW5nIGEgbm9kZSBhdCAwMDAwMDAwMDAwMDAwMDAw
LTAwMDAwMDA4ODAwMDAwMDANCihYRU4pIERvbWFpbiBoZWFwIGluaXRpYWxpc2VkDQoNCm9uIHNh
YnJvMCBpbiBPU1NUZXN0IG9uIGN1cnJlbnQgc3RhZ2luZy7CoCBJIGRvIG5vdCBrbm93IGlmIGl0
J3MgYSByZWNlbnQNCnJlZ3Jlc3Npb24gb3Igbm90Lg0KDQpUaGUgU1JBVCBsb29rcyByZWFzb25h
YmxlIChpbiBmYWN0LCBmYXIgYmV0dGVyIHRoYW4gbW9zdCBJJ3ZlIHNlZW4pLsKgDQpHaXZlbiBu
byBsZWdpdGltYXRlIHJlcXVpcmVtZW50IGZvciBhbGlnbmVkIG1lbW9yeSB0aGF0IEknbSBhd2Fy
ZSBvZiwgSQ0KdGhpbmsgWGVuJ3MgYmVoYXZpb3VyIGhlcmUgaXMgYnVnZ3kgYW5kIHdhbnRzIHJl
c29sdmluZy4NCg0KfkFuZHJldw0K

