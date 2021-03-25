Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25BE348C6C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 10:14:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101335.193743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPM4b-0007ZC-Ua; Thu, 25 Mar 2021 09:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101335.193743; Thu, 25 Mar 2021 09:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPM4b-0007Yn-RV; Thu, 25 Mar 2021 09:14:37 +0000
Received: by outflank-mailman (input) for mailman id 101335;
 Thu, 25 Mar 2021 09:14:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXFl=IX=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lPM4a-0007Ye-DZ
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 09:14:36 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02a5984d-1d48-488a-be75-3f6b3c6ad62c;
 Thu, 25 Mar 2021 09:14:35 +0000 (UTC)
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
X-Inumbo-ID: 02a5984d-1d48-488a-be75-3f6b3c6ad62c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616663675;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rLIKBBioLf7x5SjjYKKD5IbVaMLdlqwToPEyKUGm9tY=;
  b=UGKV7qN9mtF93uM9+87g8slrx3AYvdJFsRB69eLsYh7n4obFKyC+Snr5
   TjVk2MsCMAE9kzTPRGsMMzQzl/PCFDDSeRm5GCI0UZef2aRsS370cg6Up
   VzkeSzMTEuvSAUyoZPMQUauoii3iZXEv/8UiA/aSfsZATxKrwKRYw8uK3
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Id0aexlHtZMM0+xLgthiWCuyppnPAtZvBwRrJp09tMcdoJIFHGVtvjTFadSbE9VYS2FTowi4pf
 spbTxOb4hXmzZUkYhKdVpsfXVYS7NGrsEvAwY2hC/YUZza2zWDkjPauk8i8jyfYliaLkBPyefD
 ublEf5aawBjFnyl5bKlMKJ/8WS42skC9gD4aJU2kXZQRgQgrwCAgmuGA1HGNUuiU6W7Hq7V97D
 iwYvromvgunZEx09cs04oHirvkxBWgdi0/Co1YbIc4adfhwUNWTW0PpiD3u7yE2kASKlewOPH0
 aRo=
X-SBRS: 5.2
X-MesageID: 40103647
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+BS3Ma/JX2a6RVUcLkpuk+Gjcb1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTh8z3+RT9Nt4mzsWO/qzAv5ai815GZ2hRGsRdxi1+DRuWFVAzZCQuP+t2KL
 O34M1bqz28PVEeacqmDncINtKz2+HjvpTgfBIAGlob8wGIlzyl8/rXFBKf0xcYXVp0sPYf2E
 LClBH04bjmjuGjxnbnpiDuxrl1uP+k8NtMA8SQltMYQw+Dti+EbJlsMofyxQwdj/qo7D8R4b
 rxijcme/9+8nbAOlyyyCGdoTXI9BYLxzvcxUSDgX3lyPaJBA4SL8Zan4pWfl/4xiMbzalB+Z
 lG1W6YqJZbZCmo9E+Whrj1fipnmUaurX0pnfR7tQ0lbaIkZKJMtotaxUtJEf47bXjHwbo6G+
 pjBty03oczTXqmbmvUtmQq4NugUmVbJGbhfmE+u9eY2zUToXZhz0Fw/r15ol488vsGOvt5zt
 WBFp4tuKBFT8cQY644LvwGW9GLBmvERg+JGH6OIHz8fZt3eE7lmtrS2vEY9euqcJsHwN8Zg5
 LaSm5VsmY0ZgbHFdCO5ptW6RrAKV/NHwjF+4V73dxUq7f8TL3kPWmoU1Y1ifatpP0ZH4n9V+
 usPolVR9vuN3HnF4oM/wCWYegWFVAuFOku/vorUVOHpczGbqfwsPbATfrVLL3xVTk+XGfyBW
 YCQSjzKM1M4lvDYA6+vDHhH1fWPmDv95N5F6bXu8IJzpIWC4FKug8JzVS1j/v7bwFqg+gTRg
 9TMbnnmqS0qS2d5mDT9VhkPRJbEwJQ6LXkWHVauB8SPyrPAO8+kuTaXVoX8GqMJxd5Qc+TOh
 VYvU5L9aW+KIHVwzsjBdKhOmeTlGASu3qOUpcZlsS4lIPYU6J9KqxjdL16FA3NGRAwsx1tsn
 1/ZAgNQVKaCinjkry/jJsfBPjWct51hAvDG78NlVvv8WGn4e0/THoSWDCjFfONiQE1XjxOmx
 la6KkEmoeNnj6pNEoyiOk1K0d3dWySGb5KZT71P7l8q/TOQkVQRX3PrSGGgxszE1CaiHk6ty
 jEF2moXt3lRnBaoWtV16729kgcTBTiQ2tALlZgsYN8EmzavG1UyuHjXNvv70KYdkYCzuYBMD
 vMfDsVJUd0y8qq0QOO8QzyZUkO19EgOPfQA68kdKyW0nSxKJeQnaVDBPNM+o15Xeqe/9MjQK
 aacw+RICiQMZJZ5yWF4nIkMjJzsn8qjLfh3wDk9nGx2BcEcLHvCUUjQ7EQONeH6Wf4A/6OzZ
 VilNow+e+9KH/4ZNLDyabZaVd4W1nuiH/zS+EjspZPu60u8LN1ApnASDPNkGhdww9WFraDqG
 oOBKBgpLzRMI5meMIfPypf41oyjdyKaE8mqBb/DOMydUwk5kWrc++h8v7Ns/4iE0eBrAz/NR
 2E/ypR8+zMUiGD2bQZYphAaVh+eQw58jBv7emCf4rfBEG2bOlF5kO9KWL4f7lHSqSJcI9g2S
 pS8pWNhauQeCX50gyL4mc+LaJK7mq9QcS9RAiLAvVF9tSmOVKKxqumifTD+QvfWH++cQAfg4
 YAaEkbKsJEgTMmhJcs0iezRrfsy3hV2md28HVijBr1xoOi4G3HBklIPg3Sn4VOUVBoQwq1pN
 WA9fLdyW/07zdE04TSDUtcftlBHN4LU4j8Rh0eXfQ4rfqv5KoggiNKfRcoASo9kVnGrpBb4Y
 s=
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="40103647"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpVE1/2GThA4i8YIqzK56AiYweBoL5x6f0E3Sal3UZ58EAKjjaq8dpd7qreVnMuzUjhMp7Z9jlhauor3pQkHwPVgMynCw12zjjrRMw0C0FwMjFw/GXj7cs66raDNoMPCe/wXM2047gPvrU/5YJCF8HWAMtbi2y3NZqvyhzTZ0lSYQ6ukPRIm0aht8p9r10c33BSwtvDKGgR2P9HVYCDCt5IT3piLFq0lQnKmPNdJhKWVKrdchYp0mMomafojQ3ZBTSRtdB2rk7V/GRHyyqMECVMf36e+z3w3DJyBPwo2Wn14VqF9CmXSuZNel9oxoieKp8PuUtxEp/kINIeuKQim1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLIKBBioLf7x5SjjYKKD5IbVaMLdlqwToPEyKUGm9tY=;
 b=KeXNvpKWYESHQMQjF7+mr1CR6j2GhJWdRBTmJE94Jq6lAmA9EtOKWEJmg249fxTSKReI3IGj/5o20yRFSOxKhHYjQLJ2j1MJhoB2GIaOms8Mn2zVX81jg6H2TpD/BxZSAlc4Cfwa72z+pVaShJ+3aeZkTjGuFVw0UpNxpdG37bR635KkAiso6h6zGqwvq9ZG6eiqgGaQ2VI0E/YFqQrW85M5w5p2Nzu5QV1+H50HZANtAFiAr2UAgiwtZThcFSy3qiLnNMPBTTbxDuiA+UljpULGwuT/NLxjswFcL5KoIUNxTLWi+dODO6dxPcKiy+jZWatt8IA3/R5yw3ACHLHxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLIKBBioLf7x5SjjYKKD5IbVaMLdlqwToPEyKUGm9tY=;
 b=GpstlmSkkds65oaU8hM8vQFX29/ygl9uOeGNTLelvgLnTu7CI21bpOyJcdCmppez2MOf8Pu2odPszOO1bxrw1WRcYTAcKEQMp5O2ochtkKubpzfw9Sg4teBz6EK9gYS/ajKa0HEi3NBPY2vj8+eTrr78s2zaDLAKp6TT03lB7wE=
From: George Dunlap <George.Dunlap@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Julien Grall <jgrall@amazon.com>, "Julien
 Grall" <Julien.grall.oss@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Rich Persaud
	<persaur@gmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"luca.fancellu@arm.com" <luca.fancellu@arm.com>, "paul@xen.org"
	<paul@xen.org>, Adam Schwalm <adam.schwalm@starlab.io>
Subject: Re: [PATCH 1/2] docs/designs/launch: hyperlaunch design document
Thread-Topic: [PATCH 1/2] docs/designs/launch: hyperlaunch design document
Thread-Index: AQHXGhIm6lUem5Agw0SwTR0/wys6MqqJ94wAgAfrX4CAAPCuAIAAUZ8AgAFJWYCAAAvQAA==
Date: Thu, 25 Mar 2021 09:14:31 +0000
Message-ID: <FA42F3EC-AD7B-485A-9B50-8D8F8210C9F6@citrix.com>
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
 <20210316031814.10311-2-dpsmith@apertussolutions.com>
 <YFODOnQRAntdETY7@Air-de-Roger>
 <CACMJ4GaWtSWAyqbgqDa-DuLy1bYCBx8E6PucxtGfVeiraAy5cA@mail.gmail.com>
 <YFrxznV1kXeXsRCa@Air-de-Roger>
 <CACMJ4GZMNfbCjTKR5ngQBMwwAfUnSOptP+UJV8BcNqKAUy9Row@mail.gmail.com>
 <YFxKjeGGTG5naH/I@Air-de-Roger>
In-Reply-To: <YFxKjeGGTG5naH/I@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fec5ee5e-5712-4d65-fdbc-08d8ef6e665e
x-ms-traffictypediagnostic: PH0PR03MB5800:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB58009CAB8C5C126D5C1D4FAE99629@PH0PR03MB5800.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o/kMpV0ea1iopjP1y4tp8yDUWHGv7p8g2zH/5O/sU7g4e4ka9tLJr5NO0J+5i6qYk6IZZ2RQv51ytDZbSLcFvWHJBb31xGfhMVI1T6svEL/3oriPh5RcbBRPT1YpuOXJxjRSbnXFsLC5RHmfQl7Qh7QzNKypDpLQcnHFXqdKaDKApieFmvbCjNzhUEE1ddSe5VPxZeFtrQO3r7bjkiLAY31mFbaGsZ1amgK8CHFhvwqlyQgS4k7V0WV1JkGBqNKyYlskSF9GTpB03diZIn0hgktd6iWKA69uEIbvs0weKaZGH/AplGxfJlE80RanaAZ5QrR9Qwju5FwSedm6UMvMMaJjKs0vs1eY8Mge1Na+vrR/aA+pLwOlo99Q9RkAHp8Rh4haXXCXnUiNKH4iRsQv2OQIk7RcJHzpHmGV3ojFZYlxjLF2wUTp3MXWwe3YQrHAP/K+FXklhKspMIBb5n44ijia9L9fQN+IO1qV8mxWyACIRVAhINUTLZeAhAXSd5wz266qoX9LigTRUllfCdM2Wyk4n6SBgMf3/w/xGM3I57ZN1cOeu8YpY63mJJktOf5NWqL1h8/JDHNJlalMVuKIjC70YSSvB7MqXloWQBXqBqJoGHJGMhaNnrdWxcBddbLyWHpYxjGGJw7nnqwOt5eXYHBfcccR18EcQROpGq4gcSfoxNXj0TxU6ulqWPWWel0E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(6636002)(36756003)(38100700001)(316002)(91956017)(66946007)(66476007)(33656002)(76116006)(86362001)(66446008)(66556008)(64756008)(5660300002)(6486002)(6512007)(54906003)(2616005)(37006003)(2906002)(6862004)(4326008)(8676002)(6506007)(71200400001)(7416002)(53546011)(186003)(8936002)(26005)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?YjZ6N2VMdzdZbGhKaHkzOU02cEdZbTdnTnJIbjlkMHVIUFg3dzJyaHJTcnNp?=
 =?utf-8?B?T1lJTEFRclBoMWRMbGZzNmI4akxvay9NL3BZaVNIZGlkUmwxR0JrU214Nlpr?=
 =?utf-8?B?K2RjTFdKc05rVEM5emxTZXprWVRZTVlsaVZwQnJhQTE3elVzbkNCK0sxYTF4?=
 =?utf-8?B?UExZbFVMc3FLbC9CNXBwMnhuTlpvU25xbStxa1c0a292c1VDQ1NDc2lDNjBo?=
 =?utf-8?B?a1FHNm9VSS80MElOZ0NZUERQaXpuTjhSd1Q3bXRxQjZPM0d5UFdoSTJEd25t?=
 =?utf-8?B?V1FydmprakxDVXA0ZTV4M1M4TE02YWxxVGdPVUJraERzSzN2VnR6SWNaL1NN?=
 =?utf-8?B?eVlWVkFoTzhCMDNqNUVtdmdWVUttSXNnQzhYQmNOWkwvNWxGTEJLdUtQUkEz?=
 =?utf-8?B?Y2hmVWpTdDFneThmQm5lOFdKM2hBaHlscUg2Y1R6ejRiNnI1ajJPNlFjbTlC?=
 =?utf-8?B?Qi8zK3dFVU9Ob010NTJrU2NQc1Y5YStsdGZqUVdIUVpyZ0FDWGp6S2dXNWJU?=
 =?utf-8?B?QVlUcVdKYStGT0ZTaXMvTXd6MW5NakdORzBPYWZUdCtVTGgwVXBCSG8xM1NP?=
 =?utf-8?B?OUgyeFVia3FWZGZvYjIxdTR0eWNpN3VjeHlMREwvbVdWTkxHeElLU203eGFs?=
 =?utf-8?B?WVgwdHUzZVR2NVByUy81U0t3T0tXT2cyRllFMVpxdmNMSC8zcVBxTGYrT2ov?=
 =?utf-8?B?bWVockl4VnRtVVM2NXAxVGg3TmFhWms4TkF3UzJsK1pYZitQbGRlVjk2WEFp?=
 =?utf-8?B?MllGSFYzbkVLeTljSXF6MzFvaGpLYXl5K2lxNFdpdUNJOEY3RGdrUHZLQWpx?=
 =?utf-8?B?UjVmaUczVDArUGNLSnJZUzY0ek54NVlqSGRacmxjWUVKMFF1OS9MRTJCUXhk?=
 =?utf-8?B?ZGhtc09CbXl6dWFlamplTERucW5IeURHVG5QMzJsSmt1LzNzYTBTOUVXWXFt?=
 =?utf-8?B?cjZOY1J5bXZObjBzWHhYS040QjViUVNVdDNDQVg3MERkL3h0NklYQ0FFNGly?=
 =?utf-8?B?YjhoUnoyZmxzMnJOVXI0OUt0K3phMVphRk1HVUpMaDhDejlmT2ppdWlQMThN?=
 =?utf-8?B?bzRnQTRLNDNIbEtYWWE4aEljaEZTV0N1UjJ5OWhaN1o4M3Qyb0oxRkJ0UnN5?=
 =?utf-8?B?UUFLUC9IejZwVVdxZnF1QTRCWVlVMWRadGp4MFA4MzhSRHFoMXpVU3RZaFow?=
 =?utf-8?B?NW53dW5zR25Fc3ZqcVlZZzZaclljT2lQbVF4NjRDTVkyZC9TZEEyQnFaNEd4?=
 =?utf-8?B?Y0RYSjdJbEZpaVlGcUUzaE1LN3J3dVVzcXJQMjA5RVhuaVdMN05nM3FEZDBj?=
 =?utf-8?B?SEhQdjBwcGtjd1VCR25LaWEyekUvK2ZHOGFhZDExRW1TYmt2VC9iUk5xcndR?=
 =?utf-8?B?NWxRSmQ4ZVpzajQvd0ZOTWFnYnNqQkdQM2hpMVJvbjhCekxYalRZSysvSmpE?=
 =?utf-8?B?MXplcUtzNXJ4UWxDZ08ra0lIYm9ZME4yblBQakRWQi9ic0hzZVpsMDJlcTNP?=
 =?utf-8?B?K1VFL1BSSW9DenIwSVU0dFF6cHR0QVBYUjNmWnF5REMrNzBKTXdZR0hBSjRX?=
 =?utf-8?B?TmNWdWYrQlNzTHBlZTVRZEdDUCtReUtnNk4wQlVQMWVEb2NpdC9WSXp1T01a?=
 =?utf-8?B?UUxIbjVRUVg2MGhpMklaSG1Gcld2M2JBRTRSb3drQ0hNZENITWcvNzlJcXBs?=
 =?utf-8?B?REFVSlpRSkZjZUN4VXZVNHBHQTI4WmgxNlVYVzFlNHhOUmxRSWdCUmZMT0JT?=
 =?utf-8?B?b0lYdm54YnJERGxJMG5PQ2dDajZTYWtWbm1PQ2lPWE1iMXRwcFEyNEZuYWZ2?=
 =?utf-8?B?c0IrOFFBVTZqM3hzT2w5QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D13CE119A382454D8F606FF033579473@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec5ee5e-5712-4d65-fdbc-08d8ef6e665e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 09:14:31.4384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RF8Cz/5l0E5GilduqoSr6eS30b93srWoye5U6VPt5tQNH630EEiROgASA0yOwer8wnybTnaQ+Zc4620LUtwmOFOyhoBtUVq9sxVNYRaaO8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5800
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWFyIDI1LCAyMDIxLCBhdCA4OjMyIEFNLCBSb2dlciBQYXUgTW9ubmUgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgTWFyIDI0LCAyMDIxIGF0IDA1
OjUzOjI2QU0gLTA3MDAsIENocmlzdG9waGVyIENsYXJrIHdyb3RlOg0KPj4gT24gV2VkLCBNYXIg
MjQsIDIwMjEgYXQgMTowMSBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gVHVlLCBNYXIgMjMsIDIwMjEgYXQgMTA6Mzk6NTNBTSAt
MDcwMCwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6DQo+Pj4+IE9uIFRodSwgTWFyIDE4LCAyMDIx
IGF0IDk6NDMgQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3Rl
Og0KPj4+IElmIHlvdSBvZmZsb2FkIGRvbWFpbiBjcmVhdGlvbiBvZiBndWVzdHMgd2l0aA0KPj4+
IHBjaS1wYXNzdGhyb3VnaCBkZXZpY2VzIHRvIGEgY29udHJvbCBkb21haW4gYW5kL29yIGhhcmR3
YXJlIGRvbWFpbiwNCj4+PiBJJ20gbm90IHN1cmUgSSBzZWUgdGhlIGRpZmZlcmVuY2UgZnJvbSBu
b3JtYWwgZG9tYWluIGNyZWF0aW9uLCBpZToNCj4+PiBpdCdzIG5vIGxvbmdlciBzb21ldGhpbmcg
c3BlY2lmaWMgdG8gaHlwZXJsYXVuY2gsIGFzIEkgY291bGQgYWNoaWV2ZQ0KPj4+IHRoZSBzYW1l
IGJ5IHVzaW5nIHRoZSBleGlzdGluZyB4ZW5kb21haW5zIGluaXQgc2NyaXB0Lg0KPj4gDQo+PiBT
byB0aGF0J3Mgbm90IHdoYXQgd2UndmUgcHJvcG9zZWQsIGFuZCBob3BlZnVsbHkgbm90IHdoYXQg
d2UnbGwgbmVlZCB0byBkby4NCj4+IA0KPj4gRG8geW91IGtub3cgaWYgdGhlcmUgaXMgYSBuZWVk
IHRvIHBlcmZvcm0gd29yayB0byBzdXBwb3J0IHRoZQ0KPj4gYXNzaWdubWVudCBvZiBQQ0kgZGV2
aWNlcyBhdCB0aGUgcG9pbnQgb2YgZG9tYWluIGNyZWF0aW9uIChpZS4gaW4NCj4+IGRvbWFpbl9j
cmVhdGUpLCByYXRoZXIgdGhhbiBoYW5kbGluZyBpdCBpbiBhIGxhdGVyIHN0ZXAgb2YgZG9tYWlu
DQo+PiBjb25maWd1cmF0aW9uLCBwcmlvciB0byB0aGUgZG9tYWluIGJlaW5nIHN0YXJ0ZWQ/DQo+
IA0KPiBTbyB3aGlsZSBJIHRoaW5rIHlvdSBjb3VsZCBpbmRlZWQgY3JlYXRlIGEgZG9tYWluIGZy
b20gdGhlIGh5cGVydmlzb3INCj4gaW4gYSBwYXVzZWQgc3RhdGUgYW5kIGF0dGFjaCB0aGUgcGNp
IGRldmljZXMgbGF0ZXIgZnJvbSBhDQo+IGNvbnRyb2wvaGFyZHdhcmUgZG9tYWluLCBJIGRvbid0
IHNlZSBtdWNoIGJlbmVmaXQgaW4gZG9pbmcgaXQuIElmIHlvdQ0KPiBuZWVkIHRvIGVuZCB1cCB3
YWl0aW5nIGZvciBhIGNvbnRyb2wvaGFyZHdhcmUgZG9tYWluIHRvIGF0dGFjaCB0aGUNCj4gZGV2
aWNlcyBhbmQgdW5wYXVzZSB5b3UgbWlnaHQgYXMgd2VsbCBkbyB0aGUgd2hvbGUgZG9tYWluIGNy
ZWF0aW9uDQo+IGZyb20gc3VjaCBjb250cm9sL2hhcmR3YXJlIGRvbWFpbi4NCg0KTXkgdW5kZXJz
dGFuZGluZyB3YXMgdGhhdCBvbmUgb2YgdGhlIHByaW1hcnkgYWR2YW50YWdlcyBvZiBkb21CIHdh
cyB0aGF0IHlvdSBjb3VsZCBjb21waWxlIGFuZCBydW4gYXJiaXRyYXJ5IGNvZGUgaW4gd2hhdGV2
ZXIgbGFuZ3VhZ2UgeW91IHdhbnRlZCB0bywgdXNpbmcgYWxyZWFkeSBrbm93biB0b29scy4gIElm
ICphbGwqIHdlIHdhbnQgdG8gZG8gaXMgdG8gYXNzaWduIHNvbWUgcHJlLWRlZmluZWQgc3BlY2lm
aWMgQkRGcyB0byBzcGVjaWZpYyBkb21haW5zLCB0aGVuIHN1cmUsIHdlIGNvdWxkIGFkZCB0aGF0
IGNhcGFiaWxpdHkgdG8gWGVuLiAgQnV0IHN1cHBvc2UgeW91IHdhbnRlZCB0byBoYXZlIHRoZSBm
bGV4aWJpbGl0eSB0byBoYW5kbGUgY2hhbmdlcyBpbiBoYXJkd2FyZSBhdCBib290IHRpbWU/ICDi
gJxTY2FuIHRocm91Z2ggdGhlIFBDSSBidXMgYW5kIGFzc2lnbiBhbnl0aGluZyB0aGF0IGxvb2tz
IGxpa2UgYSBuZXR3b3JrIGNhcmQgdG8gZG9tTmV0LCBhbmQgYW55dGhpbmcgdGhhdCBsb29rcyBs
aWtlIGEgVVNCIGNvbnRyb2xsZXIgdG8gZG9tVVNC4oCdIGlzIHNvbWV0aGluZyB5b3UgY291bGQg
ZWFzaWx5IGRvIGluIGRvbUIsIGJ1dCB3b3VsZCBiZSB3YXkgdG9vIGNvbXBsaWNhdGVkIHRvIGFk
ZCB0byBYZW4uDQoNCiAtR2VvcmdlDQoNCg==

