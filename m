Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E7853E4B0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 15:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342500.567543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyCdI-0004Hz-KO; Mon, 06 Jun 2022 13:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342500.567543; Mon, 06 Jun 2022 13:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyCdI-0004Ez-GU; Mon, 06 Jun 2022 13:19:00 +0000
Received: by outflank-mailman (input) for mailman id 342500;
 Mon, 06 Jun 2022 13:18:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oh0U=WN=citrix.com=prvs=149ed92ed=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nyCdH-0003zN-EF
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 13:18:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 375e1b3e-e59b-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 15:18:57 +0200 (CEST)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jun 2022 09:18:47 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4962.namprd03.prod.outlook.com (2603:10b6:408:7b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 13:18:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 13:18:45 +0000
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
X-Inumbo-ID: 375e1b3e-e59b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654521537;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HoN4d8nMMn+mRNEtlPcCAAQtSQmw+GmljetBKUYnKPs=;
  b=ZzkMBaoClbNSC9OMdxlzBmN0c+2PBs1LCGeed8h/N45hqzCn1/qNqT/K
   TZHoQR4k+V67pA+WaVf96OsMzsSknFq/wFNrpbnK/z8NsZu4/asD9V+nw
   jM0WPXkwJ6fvwRBBEDP9fqsj8xvhUKalwwU6sAcr4H/oiwKLRKlP/YH5F
   c=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 72292677
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EtfUDqxLoS32tP4DVPt6t+fIxyrEfRIJ4+MujC+fZmUNrF6WrkUPx
 2MaUG3XMqmMNDf2f9F3Po7j9EgB7ZXXyYUwGQZuqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY22YXhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npll5idUwEyGLD1ussxQTZ4Nn5EBYlL9+qSSZS/mZT7I0zuVVLJmq0rJmdpeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtacG+OTvYAwMDQY36iiGd73Y
 cYDZCUpRxPHexBVYX8cCY4knffujX76G9FdgA3P//ttvTeMpOB3+Ir1PtiJINWwf4YLwV+U9
 mnjzk/DJChPYbRzzhLAqBpAnNTnmCrhXYsIGb6Q9/h0gUaSzGgeFB0XU1SgpfCzzEW5Xrp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmPwKfJ5weSBkAfUyVMLtchsaceRyEu1
 1KPt8PkA3poqrL9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLiJ43pgLCSJBkCqHdpsX8BDXY0
 z2M6i8kiN07jsMV1qP94VHOhRqtoITESkg+4QC/dmmi6AV+ZoKseY2zwVfe5PdEao2eSzG8U
 GMsnsGf6KUEC86LnSnUGOEVRujxuLCCLSHWhkNpE9857TOx9nW/fIdWpjZjOENuNcVCcjjsC
 KPOhT5sCFZoFCPCRcdKj0iZUazGEYCI+QzZa83p
IronPort-HdrOrdr: A9a23:v6szGqjCT9HmMYSNB0lqtAH753BQX4V23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8bsYOCUghrTEGgE1/qt/9SAIVyzygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3sZxA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gosKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJriJGofy+Qzdktvfr2rCo+
 O85SvI+P4Dsk85S1vF5ScFHTOQiArGpUWSkmNwykGT3PARDAhKd/apw7gpMicxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfRsRCMkjTFo+bo7bWvHAbocYa
 FT5QDnlYNrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd8AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOlauXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO6RzJSHXVZ0Wa9iif3ekPhlTRfsuaDcTYciFeryKJmYRtPuTLH/
 CuJZlRH/jvaWPzBIch5XyLZ6Vv
X-IronPort-AV: E=Sophos;i="5.91,280,1647316800"; 
   d="scan'208";a="72292677"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blSG7GesJIm5gHtS3GhmP8gf84T8tlPqhIgOdcUEnt3jbOhaKbb6wh+pWesVqcfWFYyLPwk3S9p0rT5apmbebya+pbPdYOf5uP+CEvjjs4WafoYwapek4r+NGN+qJm4H1x2QWEHMQ8hCCIcSugFMvqKNbQETdlPTF8V4pbxvB2//+63DsrfGEfozppqiGNOcr7NyTy8aIH/ey2lTP+w2oe1TW2K7pcVoKi83Tt56QJq9OukXtc2jERBxaGzQ53xGpXz8RChaM+A2nVBpEzyOBovW/6V+czxzyxQAz8wTSotmi91SPWR6q/QvAsMpnUNA075p4mMqMVCa8tTAfIx/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoN4d8nMMn+mRNEtlPcCAAQtSQmw+GmljetBKUYnKPs=;
 b=F/G747CHGteW6x+OsTnJ5s08WWFAajcCflr+qdp4GAOri8WEHcFFv0l1l7sLavIe+fNswJUWO8o4lbYDD0ifDI85J6zH8aMbplU+60SV9dUCwaHwiwKs3eQaniAO6N2HEYqn46hIGkBmDTZi7qTf4c5zGRZzli43L0k3LCXcXQttp1OJwuX6lMlsUaY0l9gDtWlybYlIp3Oxsl2yTulooUjcJBkH4LuxtJwPr/1RvaSMf/1TXvVCSHwFScdbhrM6lESzpGKfu/R+mHML35Tg/lSTNa/USlCIRvWfhZegdvgqHGUga16Kay3tYckpOkK51sZz/goO2JJXEs5qLBltwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoN4d8nMMn+mRNEtlPcCAAQtSQmw+GmljetBKUYnKPs=;
 b=aFZ2+SZCO+vK+EghtSJhlr+1m/8DlW3pG45G7GUrepY/aXKhrh5czdtzEvdiCkV2vcZS/AE2vo8XNfxuNCN+aDBDLio3TFn5O/cez2ZW/ueveBBN//xPHJpUkVhjebEssAsJLGX8d4LuwhEfi8f2o/MjaiLGMDlzHKC4iShPhJo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>, Connor Davis
	<connojdavis@gmail.com>
Subject: Re: [RFC PATCH 00/12] Add Xue - console over USB 3 Debug Capability
Thread-Topic: [RFC PATCH 00/12] Add Xue - console over USB 3 Debug Capability
Thread-Index: AQHYeVc0shRplu45PUy7PQfpSV53Bq1CXTeA
Date: Mon, 6 Jun 2022 13:18:45 +0000
Message-ID: <d1de82b2-333d-9c7f-0b82-4bf18b4ec469@citrix.com>
References:
 <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
In-Reply-To:
 <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72fd6dec-ce95-41c7-52cc-08da47bf15f5
x-ms-traffictypediagnostic: BN8PR03MB4962:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs:
 <BN8PR03MB49620C04ECA22052E7B0FA58BAA29@BN8PR03MB4962.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WDTWyQLz9RiwmEvf6ILYtdfxw7BAGsZ3/CIuFKSvly6D5uwULyPjsm3+x+cG6Z1UeIdUHgcpxD/iXCqwA27WqYQ3g4SLG6sP+pGWp5uoed1roYRbZAq3xWi9duzQ1284eVky0UXqByWxVAonSUiWrkzL+y13uQhfx/i/iumuNLBE3sallBgBryB2sB3xFsNsIJrqdp64Jt7Q/cqVMAerm2LIOMak9jBtz8PWfeEU/oeeZILSr4Z1IXJn4OlvUSxdoxC27Kbm5m251vj01ZsvFSDVMqDkP/PCEevIpLaIgAvKuFQhbMQqqu+KWHKuqiNjB6XdUWXIBTT4t/bub2zesMYy2yq5h1/LNT7dONToCwd+Gd1wTOQdnszZJc9irLDQY6Q8mOTnTCGHMAdK8lJH8OHRBjtAYgykCPyCaFZA80OrbNI+D+2N+VI7Vl1oKXXa7MzsgYEDsGl172qRbdFO+v9wbt+YTS1MhEVvzCUU41lRvpgNaJRw6VfG9IHjppkdC3Cb9BeWsKtD7Sf2Ve+1XX5+5JcpFCIrzw0otgTvLvKlK+SXkrxEy8p7CpxaQ2T7lUSGJ8itWvWuGKMdIJq4/AcId6ajaJlvau669G9aqkmejgk/0XQBlCx+manLFRXWVtYQ+bTPjZY0lPr1Dsx/rMLqUaRo0lfF+GG5VY2ArufU81voT6LLs8mRsgoq1LIFveKlSLpbOAOKyYPUcmpF49vwh64Y3xY8rRAqChcYhZz7H0mhA4T8Jgc/ZmV03to0nFHXsF1nR4Z3BavXu/dluSCrwFHnOxicSQbEBnnirI+dPzSbjaN5V907YS0SvT27h1iMeYMQwNJCrteBd8rxuWZRER/HlLQAT0GCtTEFIuY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(122000001)(82960400001)(38070700005)(110136005)(66476007)(66556008)(64756008)(54906003)(91956017)(66446008)(5660300002)(76116006)(2906002)(31696002)(86362001)(316002)(4326008)(508600001)(71200400001)(8676002)(38100700002)(186003)(6486002)(966005)(2616005)(31686004)(36756003)(66574015)(66946007)(6506007)(53546011)(6512007)(26005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHZyNFFpelh0ck4zZjVEeDM5Qmhaamd0aEpQQXRDWUZJYklJRW9LUWNwNkt0?=
 =?utf-8?B?OC9KSjYzczNvMUtHTkFCMkJJL3YyOTRLamJiRFdCUFk4NFRmY2NJWnJlWEF4?=
 =?utf-8?B?Y2h4WVVBZW10WDlKWXU2OExjOGhyeE5BMDl5RUZwK25DaFlGV1lyZjQyUmxm?=
 =?utf-8?B?UlZIZ2x1Y2NQNlBWbFBZWml3TzE4eUIwallpRy9pN3Z6RnhaUmQyaWpCalZX?=
 =?utf-8?B?aXBDVVo0VTdYV2gvS3VxcW5PdU50cmxPOXJzWUt5WWh6ajV2UU1IUzdGV0p4?=
 =?utf-8?B?OXN3RWRxT0RCT0RKQkdwYkhwMGtDVjRreVRKMXl1QTBDNEFKSXVhd2RhUGFy?=
 =?utf-8?B?MUhZUGJ6Q2FnQUxFcERhbjU3SkhOQW0yRVRCTzZjNVF5RFU3bGkvcmQyNm9r?=
 =?utf-8?B?Rk1pM2xkSThpaXVOTWh6LzJ2aHpMNzJXK00ycStKa0x2YjRRcWZSUXVEd2ds?=
 =?utf-8?B?YmFIVEJheWZxWi9jdUVpUUxkQUVHckRKcUN6a3pnYWhiaDRuTHArNG9CNmRh?=
 =?utf-8?B?Y01scDBHTGJRRWdHMjNzRzVncC9VdjRyNTFScEs5VnRUcTF3SVc3aXl1YnBD?=
 =?utf-8?B?bGN4bk9hOUlycW4wdllmdEsvSi8vMmNVdjJFVnA4UGhmTmV0TTZsWFE4QlA4?=
 =?utf-8?B?SHNmWFE2UlQ1alRIbUJDaHVIOTlrRDVwMWFYd1lkckNuMzJQeWZpYjFXNWxX?=
 =?utf-8?B?dS9KaDNnU0dPWGtZVlluemJZZU9lZEVtTGlKdmEvWE0vanZ5WCtWRU1FY0Iw?=
 =?utf-8?B?T2E5Sk9Uc2pIY3oydC9sZ0NjSzBNa0RCWmcyMGxXNWs4bmVUTHNxM2RjYW45?=
 =?utf-8?B?VTZIRGNQMnpQUlpxaXdwSkQ1MENQbFZkREtPODFHZUs1WkRObDI0M0Y0VkM0?=
 =?utf-8?B?M08yYmg2cjhVdlBWeElSU3NDc2RGNlhWU2x3NW1oWGtQZDJpcVQ5ZW5CYk4r?=
 =?utf-8?B?dWx6aUtzVUpDSWxnZU1BQWowZnhKRitUNWFlUEtyMHF4Sld1YVZSUkhGMzR3?=
 =?utf-8?B?RHd3bWJ5eVZUS1BtN0dyd2YxNmZEUW0yT1d6MHcwVmYzQjVWMmRTanFsbm4x?=
 =?utf-8?B?aXhuNDZ1ekN0M0NFS2NIcWZOeFRXZnVPZFFxcStSM2hvS1lGR0JVbXRtZjJC?=
 =?utf-8?B?dG82SWkxcitTcy9MakVKbWpMTE56MUViNUpPVmpsVW1CU0s0TTBCRWVOblBh?=
 =?utf-8?B?TnkzRHg1REZoQVJGS1VSajdqdytFNFdMV3NNcmlhQ3VUcnZwMVp2em0wR3pr?=
 =?utf-8?B?L2ZNNlREMDhhMk9nUjNYNTVOTHVobENZT1ZZczV2OCtKbVI1bDY3SXB1WGFv?=
 =?utf-8?B?OEE2Z1JuVmFoT3owS1pjZk84WnNhRm5DVStJTUJ5Wk5ZZjJDUS9HbC9wNmg1?=
 =?utf-8?B?Y09QbzRIVE9INlhCMktZZVBDMzJvOGFnTVAxNDdCWHRmclFZNjlyQ2hUUXRh?=
 =?utf-8?B?MERPdzFlKzYzbjlaQ2IzUlhydm1yc1BRbjBlSjNtSzEzU0RQK2YrWDFrN3FR?=
 =?utf-8?B?OFptT1k5NUxOVVpoR2tyT0pxSVR4ZWlpV0UyTUdxMjlsNkpYMmtLcExzTnE1?=
 =?utf-8?B?d2NNZGMvY3I3ajFHejVQTlhLZFMvTVdyWUVGcU5EK3VManIwQ28vcXQvK0cr?=
 =?utf-8?B?UmtFN1V1bHd4WTE4Z0xiQjFKV0pFQTVIWUFOL2dHM29GdHl5ckx2eE9kUmNY?=
 =?utf-8?B?T0VONWNmeFVhWHN2WGNGTWpoRjgzZWU3djJNYUZocDZQSGhsY0o0R3RhTUt3?=
 =?utf-8?B?bE1WUm0xQ2I3aGs2OUJUaUIwSGI5UHVXSktla2J3UTdTakFId2ZRWjI3SEVU?=
 =?utf-8?B?R3BHcHFWZklmZEovMnNCUFprL2xnRHJTMmFIS042RitrTTBGdUJrNnF1bWg2?=
 =?utf-8?B?dkI4ZGF1Q3BrZlVGSGVycXdJVnR4a242TkM5OWVWQnJGZ0V6RElCTC9SQmdp?=
 =?utf-8?B?SzhxYU9qUmdYeTNqcUNaelNEVm9xSHRaTXlJclp0TGVUdU51S2tIUVZ5bGJI?=
 =?utf-8?B?L2dWOFRuTGxVMytkc240bU5jL3RMVzBiOGQzVGhPTGN2NUQzOXlMMnJpdWd6?=
 =?utf-8?B?b0xLS3ZmVC9ici9QVXo3OGVFQWVBNmY1Z3BUWndjZFBxWkRFWHlLSlg1aWor?=
 =?utf-8?B?VDl4RGwxaGVmSWtjeGEwSDlJYi84RG12QUJibnBPZk9WbEQvT3JxYzk2S3VP?=
 =?utf-8?B?TitqRnVWYWNrTFlrdm14TUMvcEJhQmNUNU1PWkRpSUVLWnhuVVNmcUVvczF5?=
 =?utf-8?B?QmV2SE13VTdxRG9KMUtsMDJHa1FOVkNUeVlkanYzaDRzdUVVYUY5ZkJ6blVW?=
 =?utf-8?B?MkhKL0VaNVdLbUF0MTdWM0hBaGR0VFI4dGdFZUNuMlI3TklsMWlzRXFHWnhM?=
 =?utf-8?Q?1iWP4HsddmZAQSdw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8021ABEE55601B40BDB7B190903324B8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72fd6dec-ce95-41c7-52cc-08da47bf15f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 13:18:45.8758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +nDoQrw6Q/6cunJFYc0jveHQN2dr0j1G0AHkZX7Nvh5PzjfWlEBawXYmt1Cr/4DZpFuilJofzeHr/9ESBrCKGELUBU28IwZJcosl/hu4V7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4962

T24gMDYvMDYvMjAyMiAwNDo0MCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOg0K
PiBUaGlzIGlzIGludGVncmF0aW9uIG9mIGh0dHBzOi8vZ2l0aHViLmNvbS9jb25ub2pkL3h1ZSBp
bnRvIG1haW5saW5lIFhlbi4NCj4gVGhpcyBwYXRjaCBzZXJpZXMgaW5jbHVkZXMgc2V2ZXJhbCBw
YXRjaGVzIHRoYXQgSSBtYWRlIGluIHRoZSBwcm9jZXNzLCBzb21lIGFyZQ0KPiB2ZXJ5IGxvb3Nl
bHkgcmVsYXRlZC4NCg0KVGhhbmtzIGZvciBsb29raW5nIGludG8gdGhpcy7CoCBDQydpbmcgQ29u
bm9yIGp1c3Qgc28gaGUncyBhd2FyZS4NCg0KPg0KPiBUaGUgUkZDIHN0YXR1cyBpcyB0byBjb2xs
ZWN0IGZlZWRiYWNrIG9uIHRoZSBzaGFwZSBvZiB0aGlzIHNlcmllcywgc3BlY2lmaWNhbGx5Og0K
Pg0KPiAxLiBUaGUgYWN0dWFsIFh1ZSBkcml2ZXIgaXMgYSBoZWFkZXItb25seSBsaWJyYXJ5LiBN
b3N0IG9mIHRoZSBjb2RlIGlzIGluIGENCj4gc2VyaWVzIG9mIGlubGluZSBmdW5jdGlvbnMgaW4g
eHVlLmguIEkga2VwdCBpdCB0aGlzIHdheSwgdG8gZWFzZSBpbnRlZ3JhdGluZw0KPiBYdWUgdXBk
YXRlcy4gVGhhdCdzIGFsc28gd2h5IEkgcHJlc2VydmVkIGl0cyBvcmlnaW5hbCBjb2RlIHN0eWxl
LiBJcyBpdCBva2F5LA0KPiBvciBzaG91bGQgSSBtb3ZlIHRoZSBjb2RlIHRvIGEgLmMgZmlsZT8N
Cg0KSXQgZG9lc24ndCBtYXR0ZXIgbXVjaCBpZiBpdCdzIGEgLmggb3IgLmMgZmlsZS7CoCBJdCBj
b3VsZCBwZXJmZWN0bHkNCmVhc2lseSBsaXZlIGFzIHhlbi9kcml2ZXJzL2NoYXIveHVlLmggYW5k
IGluY2x1ZGVkIG9ubHkgYnkgeHVlLmMuwqAgKE1vcmUNCnNwZWNpZmljYWxseSwgaXQgZG9lc24n
dCB3YW50IHRvIGxpdmUgYXMgeGVuL2luY2x1ZGUveHVlLmgpDQoNClRoYXQgc2FpZCwgYXMgc29v
biBhcyB5b3UgZ2V0IHRvIHBhdGNoIDIsIGl0J3Mgbm8gbG9uZ2VyIHVubW9kaWZpZWQgZnJvbQ0K
dXBzdHJlYW0sIGFuZCB3aXRoIHBhdGNoIDMsIHdlJ3JlIGdhaW5pbmcgY29uY3JldGUgZnVuY3Rp
b25hbGl0eSB0aGF0DQp1cHN0cmVhbSBkb2Vzbid0IGhhdmUuDQoNCj4NCj4gMi4gVGhlIHh1ZS5o
IGZpbGUgaW5jbHVkZXMgYmluZGluZ3MgZm9yIHNldmVyYWwgb3RoZXIgZW52aXJvbm1lbnRzIHRv
byAoRUZJLA0KPiBMaW51eCwgLi4uKS4gVGhpcyBpcyB1bnVzZWQgY29kZSwgYmVoaW5kICNpZmRl
Zi4gQWdhaW4sIEkga2VwdCBpdCB0byBlYXNlDQo+IHVwZGF0aW5nLiBTaG91bGQgSSByZW1vdmUg
aXQ/DQoNCkRyb3AgcGxlYXNlLsKgIFhlbiBpcyBhbiBlbWJlZGRlZCBlbnZpcm9ubWVudCwgYW5k
IHN1cHBvcnQgb3RoZXINCmVudmlyb25tZW50cyBpcyBhIHdhc3RlIG9mIHNwYWNlIGFuZCB0aW1l
Lg0KDQpJJ20gc2xvd2x5IHJpcHBpbmcgb3V0IG90aGVyIGV4YW1wbGVzLg0KDQo+IDMuIFRoZSBh
ZGRpbmcgb2YgSU9NTVUgcmVzZXJ2ZXJkIG1lbW9yeSBpcyBuZWNlc3NhcnkgZXZlbiBpZiAiaGlk
aW5nIiBkZXZpY2UNCj4gZnJvbSBkb20wLiBPdGhlcndpc2UsIFZULWQgd2lsbCBkZW55IERNQS4g
VGhhdCdzIHByb2JhYmx5IG5vdCB0aGUgbW9zdCBlbGVnYW50DQo+IHNvbHV0aW9uLCBidXQgWGVu
IGRvZXNuJ3QgaGF2ZSBzZWVtIHRvIGhhdmUgcHJvdmlzaW9ucyBmb3IgZGV2aWNlcyBkb2luZyBE
TUENCj4gaW50byBYZW4ncyBtZW1vcnkuDQoNCkkgdGhpbmsgdGhhdCdzIHRvIGJlIGV4cGVjdGVk
LCBhcyB0aGUgZGV2aWNlIHNob3VsZCBlbmQgdXAgaW4gcXVhcmFudGluZS4NCg0KVGhhdCBzYWlk
LCB0aGUgbW9kZWwgaXMgYnJva2VuIGZvciBkZXZpY2VzIHRoYXQgWGVuIGV4Y2x1c2l2ZWx5IHVz
ZXMsDQp3aGljaCBpbmNsdWRlcyBJT01NVSBkZXZpY2VzLsKgIElPTU1VcyBkb24ndCBoYXZlIGFu
eSBraW5kIG9mIGFwcGxpY2FibGUNCklPTU1VIGNvbnRleHQsIGFuZCB0aGluZ3MgdXNlZCBleGNs
dXNpdmVseSBieSBYZW4gZG9uJ3Qgd2FudCB0byBiZSBpbg0KdGhlIGdlbmVyYWwgcXVhcmFudGlu
ZSBwb29sLCBiZWNhdXNlIHRoZW4gYWxsIG1hbGljaW91cyBkZXZpY2VzIGNhbg0KaW50ZXJmZXJl
IHdpdGggdGhlIHJpbmdidWZmZXIuDQoNCj4gNC4gVG8gcHJlc2VydmUgYXV0aG9yc2hpcCwgSSBp
bmNsdWRlZCB1bm1vZGlmaWVkICJkcml2ZXJzL2NoYXI6IEFkZCBzdXBwb3J0IGZvcg0KPiBYdWUg
VVNCMyBkZWJ1Z2dlciIgY29tbWl0IGZyb20gQ29ubm9yLCBhbmQgb25seSBhZGRlZCBteSBjaGFu
Z2VzIG9uIHRvcC4gVGhpcw0KPiBtZWFucywgd2l0aCB0aGF0IHRoaXMgY29tbWl0LCB0aGUgZHJp
dmVyIGRvZXNuJ3Qgd29yayB5ZXQgKGJ1dCBpdCBkb2VzDQo+IGNvbXBpbGUpLiBJcyBpdCBva2F5
LCBvciBzaG91bGQgSSBjb21iaW5lIGZpeGVzIGludG8gdGhhdCBjb21taXQgYW5kIHNvbWVob3cN
Cj4gbWFyayBhdXRob3JzaGlwIGluIHRoZSBjb21taXQgbWVzc2FnZT8NCg0KVGhhdCBkZXBlbmRz
IG9uIGhvdyBtdWNoIGNoYW5nZXMuwqAgT3RoZXIgb3B0aW9ucyBhcmUgYSBkdWFsIFNvQiB3aXRo
DQpDb25ub3Igc3RpbGwgYXMgdGhlIGF1dGhvciAoSSB0eXBpY2FsbHkgZG8gdGhpcyBmb3Igc3Vi
c3RhbnRpYWwgY29kZQ0KbW92ZW1lbnQsIHByb2dyYW1tYXRpYyBjaGFuZ2VzLCBldGMpLCBvciBm
b3IgYSBtYWpvciByZXdyaXRlLCBjaGFuZ2luZw0KYXV0aG9yc2hpcCBhbmQgYmVpbmcgdmVyeSBj
bGVhciBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2hlcmUgdGhlIGNvZGUNCm9yaWdpbmF0ZWQuDQoN
Cj4gNS4gVGhlIGxhc3QgcGF0Y2goZXMpIGVuYWJsZSB1c2luZyB0aGUgY29udHJvbGxlciBieSBk
b20wLCBldmVuIHdoZW4gWGVuDQo+IHVzZXMgRGJDIHBhcnQuIFRoYXQncyBwb3NzaWJsZSwgYmVj
YXVzZSB0aGUgY2FwYWJpbGl0eSB3YXMgZGVzaWduZWQNCj4gc3BlY2lmaWNhbGx5IHRvIGFsbG93
IHNlcGFyYXRlIGRyaXZlciBoYW5kbGUgaXQsIGluIHBhcmFsbGVsIHRvIHVubW9kaWZpZWQgeGhj
aQ0KPiBkcml2ZXIgKHNlcGFyYXRlIHNldCBvZiByZWdpc3RlcnMsIHByZXRlbmRpbmcgdGhlIHBv
cnQgaXMgImRpc2Nvbm5lY3RlZCIgZm9yDQo+IHRoZSBtYWluIHhoY2kgZHJpdmVyIGV0YykuIEl0
IHdvcmtzIHdpdGggTGludXggZG9tMCwgYWx0aG91Z2ggcmVxdWlyZXMgYW4gYXdmdWwNCj4gaGFj
ayAtIHJlLWVuYWJsaW5nIGJ1cyBtYXN0ZXJpbmcgYmVoaW5kIGRvbTAncyBiYWNrcy4gSXMgaXQg
b2theSB0byBsZWF2ZSB0aGlzDQo+IGZ1bmN0aW9uYWxpdHkgYXMgaXMsIG9yIGd1YXJkIGl0IGJl
aGluZCBzb21lIGNtZGxpbmUgb3B0aW9uLCBvciBtYXliZSByZW1vdmUNCj4gY29tcGxldGVseT8N
Cg0KIlhlbiBpcyBjb25maWd1cmVkIHRvIHVzZSBVU0IzIGRlYnVnZ2luZyIgaXMgdGhlIG9ubHkg
cmVsZXZhbnQgc2lnbmFsLsKgDQpXZSBkbyBub3Qgd2FudCBhbnl0aGluZyBlbHNlLsKgIElmIHRo
aXMgdHJpZ2dlcnMgaGFja3MgZm9yIGRvbTAsIHRoZW4gZmluZS4NCg0KT09JLCBob3cgZG9lcyB0
aGUgZHVhbCBkcml2ZXIgc3RhY2sgd29yayBpbiBMaW51eD/CoCBBdCBhIG1pbmltdW0gdGhleSd2
ZQ0Kc3VyZWx5IGdvdCB0byBjb29yZGluYXRlIGRldmljZSByZXNldHMuDQoNCkluIGFuIGlkZWFs
IHdvcmxkLCBkb20wIHdvdWxkIGJlIGZ1bGx5IHVuYXdhcmUuwqAgV2UgaGlkZSB0aGUgRGJDDQpj
b250cm9scyAoc28gZG9tMCBkb2Vzbid0IGdldCBhbnkgY2xldmVyIGlkZWFzKSwgYnV0IHdlIGRv
IG5lZWQgdG8ga2VlcA0KdGhlIGRldmljZSBhY3RpdmUgd2hlbiBkb20wIHdhbnRzIHRvIHJlc2V0
ICh3aGljaCB3aWxsIHByb2JhYmx5IHJlcXVpcmUNCmEgZmFpciBjaHVuayBvZiBlbXVsYXRpb24p
Lg0KDQpDb25ub3IgZGlkIHVwc3RyZWFtIGNvZGUgaW50byBMaW51eCB0byBjYXVzZSBpdCB0byBp
Z25vcmUgYW4NCmFscmVhZHktYWN0aXZlIERiQyBzZXNzaW9uLsKgIEkgaG9wZSB0aGlzIHdpbGwg
Y2F1c2UgTGludXggdG8gYmUgZHVseQ0KY2FyZWZ1bCB3aXRoIHJlc2V0cywgYW5kIGlzIHByb2Jh
Ymx5IHRoZSBlYXNpZXN0IHdheSBmb3J3YXJkLg0KDQp+QW5kcmV3DQo=

