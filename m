Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6EA66C2FD
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478783.742163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQvt-0007AZ-Ll; Mon, 16 Jan 2023 14:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478783.742163; Mon, 16 Jan 2023 14:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQvt-00077A-Ia; Mon, 16 Jan 2023 14:57:57 +0000
Received: by outflank-mailman (input) for mailman id 478783;
 Mon, 16 Jan 2023 14:57:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbzH=5N=citrix.com=prvs=37389537a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHQvr-000770-Hn
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:57:55 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 268c6591-95ae-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 15:57:53 +0100 (CET)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2023 09:57:46 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5450.namprd03.prod.outlook.com (2603:10b6:806:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 14:57:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.019; Mon, 16 Jan 2023
 14:57:44 +0000
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
X-Inumbo-ID: 268c6591-95ae-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673881073;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=U2AGuMg6cUCwe+vBWe3fYmDT+y7h+dacKF228U1LXwo=;
  b=gskvbUrfynUjakV+ntCXbghIIruNM0oMQh7Dj5obfu0WjZDwEbsdQL+5
   8dDlZInO05W3Xyi+3dxpdetVNrSK1PW0MwwxUBQx0ReLpgjGNwIhR03MI
   +ljmGrdW5LruTmBj8N7mJC+ISltqcxxvwzys2pxuYarvF/4Pvs3P6DHZc
   k=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 95294998
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ioIw0aujroBfOPK+GDcnCf2eJ+fnVG5fMUV32f8akzHdYApBsoF/q
 tZmKWmDP/7cM2Xwfdt+Od639R5VscLcyYdgT1E6qy40Qn5E+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AaHySFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwMAkwfwyDrd2MmPGEVM9v3JoHJuasM9ZK0p1g5Wmx4fcOZ7nmGvyPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/60b4S9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzlrK820QzDroAVIC9Oenuhr9O9sXbgUIgYJ
 EU3wAd/vadnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebT8ny
 F6P2c/oDDpHsbuJRHbb/bCRxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdJN3r6
 zWDrSx7i7BNi8cOjvy/5Qqe3GzqoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaLxl8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:s4Kzz6v4Qxfn95SioviPsiyd7skDq9V00zEX/kB9WHVpmwKj5q
 eTdZUgpGTJYVMqNE3I9urwWpVoLUmskKKdorNhQotKPzOWwFdATrsD0WK4+UydJ8SWzIc0vs
 0MHMYeNDSzNykCsS+Q2njfLz9P+qjizEnlv5a8815dCSVja6Rh6Ak8LwaADyRNNXd77IICZe
 ehD9R81kCdRUg=
X-IronPort-AV: E=Sophos;i="5.97,221,1669093200"; 
   d="scan'208";a="95294998"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RS4AYEAeRSMVcScJmQjQrcCVLV07LRomBfHteHxaD6c+f4ohjWn4+hTuDpoCDs6UYBzgn7Q0V+KkLNBPB4R/iH9o/0VAJI8AKZqLV/IDm26bpT3+/LJ+wWW2k7lGxZRuiF4NSxfNWFNZzjywYgCBhF30BEu2uqAIvQTnkE/AeZbYhtUsplE3EIOOIkSEixkMtzoqKSxjNEQ/mc4mGtpDa9Qvvt6CDCY1kFO0IDM4AZf1ADFwKpGjEc3NyZ3yNtxQabVoKLkUx4RZNK+bQ1XZSexfTOH1rDxnEcGthV0WVwMxUJsAV5JyzWY7tkh9+glrIZBfW9eZYMY/e95ihyfBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2AGuMg6cUCwe+vBWe3fYmDT+y7h+dacKF228U1LXwo=;
 b=fmdlQYCxTxz7xkEMk/XnQgAIJ7SPJ3Ry1Xpg1RjwQnQ9f1+JqD4E1K17quBjOX48IxVH9zYlMPTw1yTlw6XoZS9aZ40CJ2K0O0ygiE8noW4oSDWA1dj2O2J1F4/1kvSDWU8bvBTPxNUjyN1DU8If+7n/qhbXuJcvvRRUcuUVnO5uP3p69JsOr0dig+qlrmPUkfHkGGsTan2GRq5ryWjRqC/rZymSp7GvIzbhWKgZ0A41LDWgXKqsrahjxpJQkMquEUSJuVmnKj9NXuy+vVJB9lY0nNt56uERv0uy4N5fAV6NCdEKpBlwf3CuI/fk/diDYhm+dxcD1PGIpZGbbGqgCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2AGuMg6cUCwe+vBWe3fYmDT+y7h+dacKF228U1LXwo=;
 b=BChUJIDOzskM/f2FdhqovKNIevrYOqob1MxYEpw/smQ+akTmRYwctWYuhqRygK/vMVwM11h6nujIHMyaj6Q/Ao73rRBDgJc0wVwB/qxeeKMFOQk6JoVW660cS3f/jB88GuCMfCI4RFkD8ZhPb9YcdtoM10G0H2h/Wvav2TXLqzI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 5/8] x86/hvm: Context switch MSR_PKRS
Thread-Topic: [PATCH v2 5/8] x86/hvm: Context switch MSR_PKRS
Thread-Index: AQHZJRefeExwWeppzE65VXS63DgRAq6axG6AgAA9twCABgijAIAAFX4AgAALUQA=
Date: Mon, 16 Jan 2023 14:57:44 +0000
Message-ID: <a1ffc132-5343-c070-7bda-b3198a1ccc95@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-6-andrew.cooper3@citrix.com>
 <af2b74b2-8f37-223c-b830-c2bb3bc6d467@suse.com>
 <3ac6a4d6-44db-d248-4440-6e71aa14ad93@citrix.com>
 <adf6f951-a0e5-c167-9739-d8b0a2b4af38@citrix.com>
 <309925fd-1e7b-4541-693a-0296bd22e242@suse.com>
In-Reply-To: <309925fd-1e7b-4541-693a-0296bd22e242@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA0PR03MB5450:EE_
x-ms-office365-filtering-correlation-id: 839cdc77-e73e-4338-d81e-08daf7d2062a
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nvF3cvKk4DO4WA5m+IgFPjvwxwW8yq3+zqvh+dbO5L86uTOdpDF/6vMQ5FEUoZHSZnt8d6GZw3rxavWRcA5b7uJvG2Gb6/dVbyDlKVAQvDoIPqAPK0iKUpHbzfCDj1m0Twr2fpyme6f3XGD9yFVGkZE3/1ShCPV/PAufxaAWA7fufNGRhTJUnW+YDpkWkUh25fIPRPB+MZJUBlDtcxkc6QkPo15quYWC96qoH9TO4OsKdJL6Cr/2T/wOoAP3CQZxMrz7p5HddZ2P+jchnodDmq8dsHb8fEPIyD2lKDxA1HlJ83bQG/p6+Ay11jGE73BdHEtyNm7Wcav7jMIYWVETZwWjiYlMnFawPQWqwmsqT6+s53q0byaNKgtqevgZc9Ok5D37fgQFPo093aFqS3wqc1NPFqoIToMROnXuZjMXuj/Jsrl+5dcVOBgdRCUcDrsafzlS6+blo7olfL66c3RMl58NJjxwlS68daGvDiq017NM+DoS9/TsEfTLfQouiOWSgulkmu5sSP4YqmJ6SB4S6uyRGAdPLEIY5qGWSldWEaTl8Cc9PD6+2J4mivBNKaggE8PgHgWVA3iaSnd+BvCNeYNa4H5BDSPd2If6i3VffCLu8dr5VTHSO+/Q9GLx1881ML2OF5MDD6Hy4nRiHux7vb2MW0bah/SUutu9VVd/OZ1MF/hTOzgiePMKvRU+y0r3pB7tL8EklthKLsQL3q0U2PgVh11WiYLuUzAXzTyAjknmxHcLysvdCT23GFQvfCBzGH/tQasq7LCuueParT9qdw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199015)(31686004)(36756003)(86362001)(38070700005)(4326008)(76116006)(8936002)(66556008)(31696002)(64756008)(66946007)(66446008)(66476007)(8676002)(2906002)(6916009)(82960400001)(83380400001)(122000001)(5660300002)(38100700002)(71200400001)(316002)(54906003)(6486002)(41300700001)(478600001)(91956017)(2616005)(53546011)(6512007)(26005)(6506007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TXd4Z0x2V0ZZUGhKVWVDY0pwbUl2TlNHRGNSNnRIZ000TlhnWWcrNWFPaHVu?=
 =?utf-8?B?RDYwaytQaHI3enE4dE5seG0yUXlnblg2THFvUkRLcElPT0pHTFN2UVFhRHUz?=
 =?utf-8?B?bVFycnZVblBpb05CWEF0VlowU0lSUjN0cFRxaWROaDluWWdCL1YrSldOMExD?=
 =?utf-8?B?bEJtN280TCtmYUZ3RCtkK05JaUFCYTVwVkI0ajUxRnZTNzJWclBCMmxiZWFT?=
 =?utf-8?B?ampqUjJSeEZHb1QvUWU4QWcrSlJxR1kyU2NkRFkvcmxWTjA3MnZ6SnZCQkE2?=
 =?utf-8?B?bVllUEYzTStDYUFnYWh5MklpTTdVQnJlWjZHWWd0S3l1ZFNZUkp6M09WN0RX?=
 =?utf-8?B?TDA2anpNdEhDb3QyNHkxZ0RVU0gvcSs1UlJPZ0hWNGdzZ00wMXBSVTF5NVho?=
 =?utf-8?B?Tzh6N1NtcWVON1U4R21YdGRkK3I2cnI5NEdJcitrUmdESGNQYjhaVFl6Nktj?=
 =?utf-8?B?RGljZGFzMkhNQzhWb09vWStBMW5pZzJFMC9RREoyS3ZSZmtzWnlUUjFVRzVp?=
 =?utf-8?B?NzNrWkhiQ2ZFbkdEMDRtNU1ZV3dpT3RpRVdEWmliNFVRRStrWDBTc2crTVVZ?=
 =?utf-8?B?UlJNcFNiOWlYZnQ2U3ZhMFdqcnFMajVCaUNGL0tFRVQvaUJOVS93d3krZ1Fx?=
 =?utf-8?B?WkpLWW4vWVlCYnRaVzREL2tTMi9EanIxWmNiblp2bG9udEV3TklFQ0ZydDNv?=
 =?utf-8?B?cGxKSjRFMlVGb3hNZzVJRWdlSHM1MHp3bGJWWE1BVGtxd2Z2aWs3aDhvc3l0?=
 =?utf-8?B?b05wT1Vxb3lNOVQ4a1hmdHg0RStqQUhPd00ybS92VmlwRUVYZ2dmbnhzMSt0?=
 =?utf-8?B?aXh2Z1o3UmZFTTBmMWNma2oyNmxhTW9pUEtrbjlaOElNdXcwd2s2bVoxY1Fs?=
 =?utf-8?B?aFVuVGhDSjk3TmtzRk5TOThWQS9IN004Q0VvWTVWKzg5Y25kZXRJUDIwV3V6?=
 =?utf-8?B?cmxETUVTWlBEVHVKNW1oczNlYmxOcDBjeFpGRlJDdkMzcUpIdk8yRU5MR2Nr?=
 =?utf-8?B?VDduUXVvd1dMRU5sRzBFc0k0aGxWVGl0MlQyUXp4R2FHQi9XYWt2NWdQM1ZD?=
 =?utf-8?B?Yzc2emIrR1RFRmViNmxOenFvV2VacWdUbGh0YXFZeHBSSElidG1KdHpkc3ll?=
 =?utf-8?B?WktyUDZSRzJEWER5MEs4VXdiUE8vaWlhWUdHVnJjMEdJTDZzYWZzMFVtclpG?=
 =?utf-8?B?bndwWlczV0t1R1F5V1NicldsMURPREY5NU0xRVRaY0RTQWtSODhSYVBTVHZz?=
 =?utf-8?B?NDJMT2VzZjdlc2xqZlpSQ1NhZEdVWVhWUjRQV3RBcGNKLzduSGFSTG05WkhB?=
 =?utf-8?B?SG1ycnZIdTBjTEd0MnZ4Z1hBWmFsSWttSGIzNnpraHhzSHNHZXZUZXU2djgx?=
 =?utf-8?B?UGsxT1ZkSjZtb3graEJRbWJHMVZjL0lmakY3RDZVMS9VN1YrYnZCS2RqTWlF?=
 =?utf-8?B?a2thbWZzeldTVHBEbE1YR0Z0bG9aanltSGV3VEhHK0pjYjJTeEJLaGpiMGVQ?=
 =?utf-8?B?MHNObDNYNTUvN21JNDEydlFhNWFDWFNMYUVobThCNnBrd2ovTkpyTEV2N04r?=
 =?utf-8?B?VWJGR1cwY2ZTNmd1akV1TEpPUmJZeGV0YVBUQlQxZENVL053czgrU1F1THFq?=
 =?utf-8?B?cFlTRG1KLzlGZGtFWmhpUFNKWHI1Zm1iRUVIQVNaaTA4WmN3RlJPUHdCR2p3?=
 =?utf-8?B?UnZyWDJndUZuMFhIUkNPSjhmWG1oMkIxc0I4RjVJU2E5eTVaZnF5a2hXeFg4?=
 =?utf-8?B?OWdKb0VtUHVGU3VWQmV4VTlLN3NHcnlMR1YyUDAxdHhpTGxYa3UzdkJtY3Z3?=
 =?utf-8?B?dCtDQitrZWJRM3lueGg3SVU3N1R4d2dsZVlVbHVRWTBUaURDVnFPUnk0ZVcy?=
 =?utf-8?B?cnIrL0F1aEhta1RZeXYvQkZaU0Fnc1A3VTd3cWRjUWdSNE8wSTRYUFBZOE1Y?=
 =?utf-8?B?SW01UDFjSGYrMXVrSHZKUStGM0RVRVJFWmpjK3BseXRjMWNSYThTdVpRSFJK?=
 =?utf-8?B?V2hUTkhZVGxac0FaRHAxWnBSZ1J1U1pOZ3VPNXM2NStzSmJiOEdESHMwRVhl?=
 =?utf-8?B?MTdZamtXOFZLT3gvY1VFTHJ1NTl0bFlVT3NxWEVzc2RtRXJkeEZMbld0UEJF?=
 =?utf-8?Q?BVFg6GdeaBU+zqSwikY0/s3G7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD5E60FC067FDC41A18C5915CD123B46@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TP9heVOLauN3BbwfBPVUwEBCsMNQZxZxEi/iZIZRJXxLJnpF00AjzKIFvlv/IFVoUrA3ZkaTXlV7Rp8VAnTiOdMWXbSS1om/bEvjmPQ16rN26EONXcXPXH8IpeOZJ/lg6dQOkzlvczhmgkvT142XDErrurDGmitU0ycGDoMTUFo5AU70EgFoIq79DweUylxjrboGdgM6NgxLzMMt/+WA5Fs9qm+NA9kgJ9D+7zzgsoShX6xNUm1656TAmd2u8NfJUidlAmJwAA7WyTNPSdquDSpTxfRdOjm/LAC9PnLBj+4Nubufo2qOiyuNnd9DOvNPBymPzV9TcQv0oTn04QOamZalRf9bbdMxyOnYspTRJvyUlOGFu2CRvYrHEnrN+7P0u5Sn2xeJ+x4ypCsXRna2Q7/POwDtOTO0DIuOoYHXKO0THAGqrlCwckToJzrhFqTwMDMTmBaA5PmezXpvc8RNbcLz+dnXCo6IaoCPBFDdafMj/J+YJWL/3jL5WCiVaXSyzuiB82taEO92grVXce3HVFK9sXuaJ2jJe4+zUKfa54DBY2x4rdcrQ/xpx9KkR5IlbIPni/ryNIdxpVdygXKQLnQA2i18I7KhA4YsjJxwPVncSaTmj7BRYaAenQGRpgImJlKEwaP0Y5awLx+8ScoP2SlJxkNd+ET5HmmJVpC21gP5sRy0NAgphbSwvsUPwYQKwm2UMICZeM1fa+MYZp1uqCWkm75N9wfa4fDmzT/MvI9LKYtZ0su357mixPnRFknZ+qMiXPBJipVamdUmOOBDc1IKaLOVF/TMHj7B9GUDMwh+hvRSjrXhPaIuZhlWyH+ZXPh428BWQd7T7gMgi45lkH7ouEcyyPdqX68818chiI4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839cdc77-e73e-4338-d81e-08daf7d2062a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 14:57:44.4385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MHSXslb+Se7azvopQ56XHalSkzeL/IPnCSvdxWE8dIRZdu8yHZey6YFR9/FbMPZ/4qViIPJvaYo0jS3SdHPh47ICnyK9rcKcwFUiit+PyBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5450

T24gMTYvMDEvMjAyMyAyOjE3IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTYuMDEuMjAy
MyAxNDowMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDEyLzAxLzIwMjMgNDo1MSBwbSwg
QW5kcmV3IENvb3BlciB3cm90ZToNCj4+PiBPbiAxMi8wMS8yMDIzIDE6MTAgcG0sIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+PiBPbiAxMC4wMS4yMDIzIDE4OjE4LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Og0KPj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMNCj4+Pj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9zZXR1cC5jDQo+Pj4+PiBAQCAtNTQsNiArNTQsNyBAQA0KPj4+Pj4gICNpbmNsdWRlIDxh
c20vc3BlY19jdHJsLmg+DQo+Pj4+PiAgI2luY2x1ZGUgPGFzbS9ndWVzdC5oPg0KPj4+Pj4gICNp
bmNsdWRlIDxhc20vbWljcm9jb2RlLmg+DQo+Pj4+PiArI2luY2x1ZGUgPGFzbS9wcm90LWtleS5o
Pg0KPj4+Pj4gICNpbmNsdWRlIDxhc20vcHYvZG9tYWluLmg+DQo+Pj4+PiAgDQo+Pj4+PiAgLyog
b3B0X25vc21wOiBJZiB0cnVlLCBzZWNvbmRhcnkgcHJvY2Vzc29ycyBhcmUgaWdub3JlZC4gKi8N
Cj4+Pj4+IEBAIC0xODA0LDYgKzE4MDUsOSBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0
X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQ0KPj4+Pj4gICAgICBpZiAoIG9wdF9pbnZwY2lkICYm
IGNwdV9oYXNfaW52cGNpZCApDQo+Pj4+PiAgICAgICAgICB1c2VfaW52cGNpZCA9IHRydWU7DQo+
Pj4+PiAgDQo+Pj4+PiArICAgIGlmICggY3B1X2hhc19wa3MgKQ0KPj4+Pj4gKyAgICAgICAgd3Jw
a3JzX2FuZF9jYWNoZSgwKTsgLyogTXVzdCBiZSBiZWZvcmUgc2V0dGluZyBDUjQuUEtTICovDQo+
Pj4+IFNhbWUgcXVlc3Rpb24gaGVyZSBhcyBmb3IgUEtSVSB3cnQgdGhlIEJTUCBkdXJpbmcgUzMg
cmVzdW1lLg0KPj4+IEkgaGFkIHJlYXNvbmVkIG5vdCwgYnV0IGl0IHR1cm5zIG91dCB0aGF0IEkn
bSB3cm9uZy4NCj4+Pg0KPj4+IEl0J3MgaW1wb3J0YW50IHRvIHJlc2V0IHRoZSBjYWNoZSBiYWNr
IHRvIDAgaGVyZS7CoCAoSGFuZGxpbmcgUEtSVSBpcw0KPj4+IGRpZmZlcmVudCAtIEknbGwgZm9s
bG93IHVwIG9uIHRoZSBvdGhlciBlbWFpbC4uKQ0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9hY3BpL3Bvd2VyLmMgYi94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jDQo+PiBpbmRleCBkMjMz
MzUzOTFjNjcuLmRlOTMxN2U4YzU3MyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hY3Bp
L3Bvd2VyLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMNCj4+IEBAIC0yOTks
NiArMjk5LDEzIEBAIHN0YXRpYyBpbnQgZW50ZXJfc3RhdGUodTMyIHN0YXRlKQ0KPj4gwqANCj4+
IMKgwqDCoMKgIHVwZGF0ZV9tY3Vfb3B0X2N0cmwoKTsNCj4+IMKgDQo+PiArwqDCoMKgIC8qDQo+
PiArwqDCoMKgwqAgKiBTaG91bGQgYmUgYmVmb3JlIHJlc3RvcmluZyBDUjQsIGJ1dCB0aGF0IGlz
IGVhcmxpZXIgaW4gYXNtLsKgIFdlDQo+PiByZWx5IG9uDQo+PiArwqDCoMKgwqAgKiBNU1JfUEtS
UyBhY3R1YWxseSBiZWluZyAwIG91dCBvZiBTMyByZXN1bWUuDQo+PiArwqDCoMKgwqAgKi8NCj4+
ICvCoMKgwqAgaWYgKCBjcHVfaGFzX3BrcyApDQo+PiArwqDCoMKgwqDCoMKgwqAgd3Jwa3JzX2Fu
ZF9jYWNoZSgwKTsNCj4+ICsNCj4+IMKgwqDCoMKgIC8qIChyZSlpbml0aWFsaXNlIFNZU0NBTEwv
U1lTRU5URVIgc3RhdGUsIGFtb25nc3Qgb3RoZXIgdGhpbmdzLiAqLw0KPj4gwqDCoMKgwqAgcGVy
Y3B1X3RyYXBzX2luaXQoKTsNCj4+IMKgDQo+Pg0KPj4gSSd2ZSBmb2xkZWQgdGhpcyBodW5rLCB0
byBzb3J0IG91dCB0aGUgUzMgcmVzdW1lIHBhdGguDQo+IFRoZSBjb21tZW50IGlzIGEgbGl0dGxl
IG1pc2xlYWRpbmcgaW1vIC0gaXQgbG9va3MgdG8ganVzdGlmeSB0aGF0IG5vdGhpbmcNCj4gbmVl
ZHMgZG9pbmcuIENvdWxkIHlvdSBhZGQgIi4uLiwgYnV0IG91ciBjYWNoZSBuZWVkcyBjbGVhcmlu
ZyIgdG8gY2xhcmlmeQ0KPiB3aHksIGRlc3BpdGUgb3VyIHJlbHlpbmcgb24gemVybyBiZWluZyBp
biB0aGUgcmVnaXN0ZXIgKHdoaWNoIEkgZmluZA0KPiBwcm9ibGVtYXRpYywgY29uc2lkZXJpbmcg
dGhhdCB0aGUgZG9jIGRvZXNuJ3QgZXZlbiBzcGVsbCBvdXQgcmVzZXQgc3RhdGUpLA0KPiB0aGUg
d3JpdGUgaXMgbmVlZGVkPw0KDQpYZW4gZG9lc24ndCBhY3R1YWxseSBzZXQgQ1I0LlBLUyBhdCBh
bGwgKHlldCkuDQoNCkknbSBqdXN0IHRyeWluZyB0byBkbyBhIHJlYXNvbmFibGUgam9iIG9mIGxl
YXZpbmcgWGVuIGluIGEgcG9zaXRpb24NCndoZXJlIGl0IGRvZXNuJ3QgZXhwbG9kZSB0aGUgaW5z
dGFudCB3ZSB3YW50IHRvIHN0YXJ0IHVzaW5nIFBLUyBvdXJzZWx2ZXMuDQoNClMzIHJlc3VtZSBp
cyBvdXQgb2YgYSBmdWxsIGNvcmUgcG93ZXJvZmYuwqAgUmVnaXN0ZXJzICh3aGljaCBhcmVuJ3QN
Cm1vZGlmaWVkIGJ5IGZpcm13YXJlKSB3aWxsIGhhdmUgdGhlaXIgYXJjaGl0ZWN0dXJhbCByZXNl
dCB2YWx1ZXMsIGFuZA0KZm9yIE1TUl9QS1JTLCB0aGF0J3MgMC4NCg0KSSB3aWxsIGFkZCBhIGNv
bW1lbnQgYWJvdXQgcmVzZXR0aW5nIHRoZSBjYWNoZSwgYmVjYXVzZSB0aGF0IGlzIHRoZQ0KcG9p
bnQgb2YgZG9pbmcgdGhpcyBvcGVyYXRpb24uDQoNCklmIHdlIGRvIGZpbmQgZmlybXdhcmUgd2hp
Y2ggcmVhbGx5IGRvZXMgbWVzcyBhcm91bmQgd2l0aCBNU1JfUEtSUyAoYW5kDQppc24ndCByZXN0
b3JpbmcgdGhlIHByZS1TMyB2YWx1ZSksIHRoZW4gdGhpcyBjbGF1c2UgbmVlZHMgbW92aW5nIGRv
d24NCmludG8gYXNtIGJlZm9yZSB3ZSByZXN0b3JlICVjcjQgZnVsbHksIGJ1dCBUQkgsIEkgaG9w
ZSBJJ3ZlIGhhZCB0aW1lIHRvDQp0cnkgYW5kIHVuaWZ5IHRoZSBib290IGFuZCBTMyByZXN1bWUg
cGF0aHMgYSBiaXQgYmVmb3JlIHRoZW4uDQoNCj4+IEFzIGl0cyB0aGUgZmluYWwgaHVuayBiZWZv
cmUgdGhlIGVudGlyZSBzZXJpZXMgY2FuIGJlIGNvbW1pdHRlZCwgSQ0KPj4gc2hhbid0IGJvdGhl
ciBzZW5kaW5nIGEgdjMganVzdCBmb3IgdGhpcy4NCj4gSWYgeW91J3JlIHNlZWluZyByZWFzb25z
IG5vdCB0byBiZSBjb25jZXJuZWQgb2YgdGhlIHVuc3BlY2lmaWVkIHJlc2V0DQo+IHN0YXRlLCB0
aGVuIGZlZWwgZnJlZSB0byBhZGQgbXkgQS1iIChidXQgbm90IFItYikgaGVyZS4NCg0KVGhlcmUg
YXJlIHNldmVyYWwgcmVhc29ucyBub3QgdG8gYmUgY29uY2VybmVkLsKgIEkgZ3Vlc3MgSSdsbCB0
YWtlIHlvdXINCmFjayB0aGVuLsKgIFRoYW5rcy4NCg0KfkFuZHJldw0K

