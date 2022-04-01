Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD5C4EED4F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 14:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297363.506524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naGWU-0001dX-Lk; Fri, 01 Apr 2022 12:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297363.506524; Fri, 01 Apr 2022 12:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naGWU-0001a6-Gl; Fri, 01 Apr 2022 12:37:02 +0000
Received: by outflank-mailman (input) for mailman id 297363;
 Fri, 01 Apr 2022 12:37:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MEhg=UL=citrix.com=prvs=083735472=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1naGWS-0001Zx-Bz
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 12:37:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ae6b21b-b1b8-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 14:36:58 +0200 (CEST)
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
X-Inumbo-ID: 6ae6b21b-b1b8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648816618;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=yZut03FqU3B/VwwAEiP8ClV/cH7IpgEfW721g+jE1MM=;
  b=YoVOmfgg0rVinU36rszxU24TGe1NAdBDrpfD6yTYD2ur2//YF15CaSiO
   iF1kdC8C/Dm2HGcp3HiUAwQ7mDkeTFEvPI05Lou6zpQEJzzS76zssnVUo
   ZYkRUu830R8i0dqMYSeVvwJdXrMC3slMD1HLOQUqKPsw2KUhXyAQbtc+C
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67776620
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DQK8YapTtRBEg4o8j+B+qsPyN5VeBmKbZRIvgKrLsJaIsI4StFGz/
 9cnaN20SrzTNTykP5w0PZPnthk2DaWlxtZrTQVv/CE0QysboprIXYyTfxuvNi6fdsebF048t
 c5GO4jLdpg9Ey7SqB3xP+e9p3QshauDSuelA7GbY3EvFGeIJMtZZTdLwobV1aY00YjR73qxh
 O7PT+3j1H6NizMla2gY5avfohk2tamv42kUtFZnaaoS4wTVnSAeU8hOea3pI3XGGYQFReTSq
 8QvbV2aEsE12z93V7tJR56iKhVirob6ZFTI0jwMM0SbqkAqShYai87XD9JBLxYP49m1t4opk
 o8V6cTpEV1B0pDkw4zxbTEJS0mSAoUekFP3CSDXXRu7lhCun9PEmp2CPWluVWEq0r8f7VJmr
 JT0HAslfBGb799a9ZrgIgVaambPG+GwVG8XkikIITg0lp/KS7ibK0nBzYcwMDvdGqmitBsRD
 iYUQWMHUfjOX/FAEkctAc4Dg8mhvUbATzF28VSqu5MoymeGmWSd0JC1WDbUUtmDRMETlUeEv
 GPWuW/+B3n2NvTGl2DDqCj1wLaSw2WrA+r+F5XhnhJuqHKewXYcBVs6SF2/qOGRgU+iQdNPb
 UcT/0LCqIBsqxP0EIenB3VUpla2lCAFRsEJGtd57Vzd4ajQ3CerInk9G2sphNsO65ZtGG1CO
 kWyt8ztLSxitvuSU3313qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8adrPf4BDXxy
 DCitzUlivMYistj6kmg1QmZ2XT2/MGPF1NroFWMNo640u9nTJ6fbtCV9nbS1sl/EIq3F1++o
 kEbssfLuYjiEqqxvCCKRewMGpSg6PCELCDQjDZTInUxy9i+0yX9JN4NuVmSMG8sa59ZImGxP
 Cc/rCsLvPdu0G2Wgbibim5bI+Aj1uDeGNvsTZg4hfIeM8EqJGdrEMyDDHN8PlwBcmBxycnT2
 r/BKK5A6Er274w9k1JaoM9HjdcWKtgWnz+7eHwC503PPUCiTHCUU6wZF1CFc/o06qiJyC2Mr
 YoPaJbQkU0OAbCjCsUyzWL1BQpVRZTcLcqrw/G7i8bZelY2cI3fI6G5LUwdl3xNwP0Oy7agE
 oCVUU5E0lvv7UAr2i3RAk2PnIjHBM4lxVpiZHREFQ/xhxALPNb+hI9CJsBfVeR2q4ReIQtcE
 qBtlzOoWa8UFFwqOl01MPHAkWCVXE/13VjXZXr0PWBXklwJb1Whx+IItzDHqUEmJiG2qdE/s
 /un0AbaSoAEXANsEIDdb/fH8r97lSF1dD5aN6cQHuRuRQ==
IronPort-HdrOrdr: A9a23:jVpQQK3t/77EqvcMZcWnBAqjBQNyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHO1OkPUs1NaZLUXbUQ6TQr2KgrGSugEIdxeOldK1kJ
 0QCZSWa+eAQmSS7/yKmDVQeuxIqLLskcCVbKXlvgxQpGlRGvhdBmxCe2Km+zhNNW977O0CZf
 2hD6R81lidUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLokCs2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlawkEyzzYJLiJaYfy/gzdk9vfrWrCV+
 O85yvICv4DqE85uFvF5icFlTOQlgrGoEWStmNwyUGT3/ARAghKU/apzLgpAifx+g4uuspx37
 lM2H/cv51LDQnYlCC4/NTQUQp2/3DE6kbLAYYo/g1iuKYlGfZsRLYkjQto+VY7bVbHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7T1E5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZes6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z54HSKyGG7fIyQZ0We9igF3ekLhlTVfsufDRG+
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="asc'?scan'208";a="67776620"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNMI5GAfqONg0CLaQr8ogQ8vbY3JgrxLeAep2T3PbfyBFGo+l1HGQHDkJM4IaybOmLjckYhmyRCqw8CbdllDCktDeae03EoRSZWUjByBO9fXefjKfpvjyNommW9pJt1TzMhafB3OE2QbBIO6F7w0UPY2+TAvf9veK1pywqT8mwkPnb+LD4g3VGyylhNLRsMtL++Rx+ZKAbKMaNJf/1J0eCBj+J4YLV0mgRAW3lJq09DV14zlMU3v3ZQXxRaIQ8PzSFgEjVwUCIYOVqdmaNapBpmyair8g++L99oYfkbw5pnQk7Bs3QgW5qmYEgAcUoEJ3GHONYeuJ2Sqjoi6+TPL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TN6dZ/g5nNvt7Qoz9gXC0DWYwPGm35dx6bIkM5j2DhI=;
 b=K0M5iaFp0AJ4kb2tIhR+3dJZDPvQviakmShMRQ/gFQDNe2wxM7nSNDlQstJdS2hU37xRRcbMtwi9R2kyzBlWV1lRhxgucvtlXt28+DTGe0JejXORcGXBOEH13FtGBKhKAzUwiPMqnYRFxasWgXhcc5ad+TuFPeFLEyEf6Xz3iyffNcXaojGup37/ycYcWnixiNT/vtKaSmlOSf1cGS+f9cuA/0rJO9KZd+1a4Watj1ddCBv1rjW1FCTgmE5t9qyN/Pf76+ZdgtWlkB0P9bclE6ThDyR1bKfOxSCFKfjnKUbpbSzu3TJ4P7fFOQCE+icZ8ZNRRZA7NnFjV9hHFNoQJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TN6dZ/g5nNvt7Qoz9gXC0DWYwPGm35dx6bIkM5j2DhI=;
 b=ak1AwIVY+/Mi29l+QBd4LKfywNqVoVfnETPUQUZMqS4b0ugLZ3tqQp70bliorxUNrdZrBujmeYLBkc39iZ/gHufW9JyaOulCHXlGIsX/aGY+KUI0cWmhL4hjcE+U3u/S11t+T3ieZnchpPWSq/1OYNjsIqNJPNUtiJxWp0MvZWg=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH v2 06/14] x86/P2M: PoD, altp2m, and nested-p2m are
 HVM-only
Thread-Topic: [PATCH v2 06/14] x86/P2M: PoD, altp2m, and nested-p2m are
 HVM-only
Thread-Index: AQHYKM6kfiQ1SdoPe0C+8EGNLnrHw6zbOLKA
Date: Fri, 1 Apr 2022 12:36:51 +0000
Message-ID: <2716C226-F777-40D0-B7FB-85E4FECFE884@citrix.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
 <556f793f-e4c2-8f05-44e9-edf8b300777d@suse.com>
In-Reply-To: <556f793f-e4c2-8f05-44e9-edf8b300777d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f9f91f6-27fe-4ec1-3fcc-08da13dc4bfc
x-ms-traffictypediagnostic: BLAPR03MB5522:EE_
x-microsoft-antispam-prvs: <BLAPR03MB5522142182625571CCD61B0999E09@BLAPR03MB5522.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8YP2DUiWq+laADIcgUfJeJGAjaZjv2SHgz6x07snn6oeg4WNidkjwlm2rs+LDsmPfk7M5akeOcYbDrQ5UZXCK8mOGT9XiLQa75tmjM7J5Xv49b8n4OI7sVeWbfWmayqdOouRfdBs22sCFRlteRThnKERkoFas70U9TTnLl0p6XRK/JkZjLqoU0HRb8fvuF4k3eA4KH8EFPMWNU7bK9/ahXPV4Xq22w6vBqqi84QPpWASkXzhlt47TOpnJivM7Gcfe0AqQWEHo/mAHrWRPZrkwmUMZ1bKajmaGTkZz8pisXwcOD4OjIN0dZKqkfRGjqYnirzenEQZ/ypjaffHMesAUbtcOMsw7s7JteNv4CHpPv2IzGjsYiFZPMmbCXzYI4Scqq6JqElsoA1phOiI1RWiCqUsnXjew7GhxdB1aer5RNoIqY3gJ8HdCMfWUqSMlRNnWvPgDXcsNaHK7JSNjbD/Bogxt0QxDTWu8ta5gswFGCtKmo84dT5jkbKXI8vF7QDwSCJNVzzTwWnw2+YWGeXCqPMeUtH6P7+AnpzJBGatjYwTX1tS+cKUl8yoyPBfgSb9ZKOzrvyY2zVRRsoKlNU7dutCD9QUtANbfkRtNEYUR4UAaJ6WC4FACJ44aJPqLrAwfJQQvB5NI0sitYfSt/5raDpzv6ZVYjCTbgVhcIAIRp55I74Ka613za9IIM04y3nTLKDAZEBXKJGlurdpRKNQzQrhsU4+G6MpPqNpSDahw8L4ltuWxGiZO4d+OdpqsFwB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(316002)(53546011)(54906003)(6916009)(36756003)(99936003)(122000001)(82960400001)(508600001)(6486002)(5660300002)(38070700005)(91956017)(2906002)(66556008)(66446008)(66946007)(66476007)(64756008)(8936002)(4326008)(8676002)(26005)(33656002)(71200400001)(186003)(86362001)(2616005)(76116006)(107886003)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmlna1R2Z1h3Ymw1K0NIUmxzNWFDM2JJQi9YM2JGOXFZc1lBS3ZJVUk4VWNs?=
 =?utf-8?B?T3hqVUQ3eUo3S0RtRzZwMjREWFRGR1NHSWNINitUOUxMR0R3UVlzUjBtUjBT?=
 =?utf-8?B?MTAyUzFnZkgvMTZyaDQyRjh3ckRveDgzbmtGMVdwWVBXZFY0YTBRUGhqSTBF?=
 =?utf-8?B?bm9uSDdNbTlBNkZRZ2VFY3dyQ043K1VHUTBWYjRvK0tZdWcwcEtHYnVaK1Zk?=
 =?utf-8?B?RlZWR2hUZ3M0ZEtWSm5Ma2FUdzUydUdSY2ZXSlBYbHR4eG93RE84QTQwd0JN?=
 =?utf-8?B?RVU3TG9JbkNCZlN6QjdZUWtFa2dpZkhpSjUxVDlNRGpwaDBGWllyZDJLSXZt?=
 =?utf-8?B?cVJYekU5Z2Nybk94OSttSHd6bkU1S2E5QU41N3pObTFKbDJwMW9HaGVlS08w?=
 =?utf-8?B?eWF5ME5LdFFEbVYvL2FRTkMyODJLOThic3AxRTMySm9DclVNZHRFK2JMY1dr?=
 =?utf-8?B?cTBrdDNFUWRpci9zbmw0L04xajcvY0xHR0JMMC9zZzF0dHZQRzRQb3FCUmpQ?=
 =?utf-8?B?OUI3VlUyMkpPcnpKYjR6MFJmaWFQNGVXYjJYM01TVnQxNTluOHk1cGIxeVI1?=
 =?utf-8?B?UjJhNkkwK2lBNFgzUWgvaFZrdC9PSStlcmVENnVUV0dDeFFSU3c0M2NpTGVO?=
 =?utf-8?B?RWdMdW5HWlE0RktZbDNIS1E0MXg2dFZ3WWlVYzRxckQ1UjFMTUhFamxBYXdH?=
 =?utf-8?B?Ynh0b0Q3NllJYjFIWXlPRjBubmNFMitXUHNZTC9pQkErelJkNUVOckllVytS?=
 =?utf-8?B?eXJVYXhjdmdjelE0ckd4WVM3cktRTmxSanlWMDFGQ3p5aWcwVkxkeG5aWDA5?=
 =?utf-8?B?WmNVZE5ZZGVSeEdBK1lwdWR4ME9pV2NLMVN3Tk02U0ZyNmZSOGJqalNIcFFD?=
 =?utf-8?B?Z1Y0V09md2tHSW5pK21tSFNqVmVWQlJsSWd1ellNVVdBZGhueTNjMUdDRVYv?=
 =?utf-8?B?bzYwMUFVMzBSQWx5Tm1uV2o4b1VJVHBnOVBPRHI0Y3JsMlpvRk0yNTcycmdv?=
 =?utf-8?B?UDB4dlFVNGQxMStTWmxoTmdPdDU4YjJUcSthWDNaVm1IOXdwRDRTVXJYa3Zx?=
 =?utf-8?B?TCtJNE5GVXdjLzN0VFNMZWxvTStlWWI3QnAwYTlBK05BTzhRc0NVaFo3R2Qr?=
 =?utf-8?B?VVdZZGxLVDB4TmZ3eEFqTUpDVzEya0ZmRXNKQlpwVlJibXorbHBVcGEyV1JJ?=
 =?utf-8?B?LzNLZTcxa0VwYjBPWmNhQzVTNnpwc1J4L25wUi9oSjM0eHFpbU5pRnkvSXVI?=
 =?utf-8?B?TkxLN2JRSnFKaXlMZ2U4VFFIMWN3anJMUGsyam56WmpxbzNwK1hseVRyR0or?=
 =?utf-8?B?eXFSMDd4cHdtQlFielE1WVpDOGk1RWc0SG9tUzBuM0RUbkFIcnFKQUNzT1Vm?=
 =?utf-8?B?SXJXK0RRdkcvLzVhNGNiWFNLRXpVanRPeWdBNTFtY0t0T3BENWQzemtMUjZ0?=
 =?utf-8?B?dmd6aE5tVlNqMUhDUGQ1UHVhbE1US1lZZ2hVUitYc2dqbmtZMzBlRnpWQkcv?=
 =?utf-8?B?R3F4eHZEeGxDTjFPMTFudWh2WEhvd1h5UENzUWlOZnhYdktJb0pCc29lSHQx?=
 =?utf-8?B?eC9COUJ3SkFFM0h4dkRWMTYxZTZPbUUyeWcxNjR5K2JGRkR2bWhaWnI2Z1cy?=
 =?utf-8?B?QjQzRnpVS3JmSlBaekJqTVhDY0NKUUpVZEhyblNQekdrRHNBWDBxR3dFWVgy?=
 =?utf-8?B?c2ZBUktZeUd3U20zL21mUmc2Qmd3WTFQRW43cjN0alN1TzZrNFh5NTVEZzcw?=
 =?utf-8?B?c2o0WGhQVVc0RUlxYzFZR091OFVpVm9tb3dOMEQ5aDVZR09jd24wVkR1NWIv?=
 =?utf-8?B?NEducWUyemRQdlljYTVZS283L2pWcWQxV0lqOFAxdm0zS3RkRUxpV3p1R1dK?=
 =?utf-8?B?UHRkNUxGNW9pN2FBK1g4dnAyaVo0YllFK0N4cnNOa3lsVklJWk1ZRHoyY2lD?=
 =?utf-8?B?cTJpYnluY1lQaUpvSHhxbXFHcmtxdmFqL0RUMThvRTlnOFM0c1pCSFpHSkph?=
 =?utf-8?B?Y0xxWTJSdHlVaGpQRTBYS1RpamxsZm8xcVVlc29EL3dFdU5nN2pDZ3ZEcUhv?=
 =?utf-8?B?OVc4eWVEQ0FJejBBOVJVTExpNW9UOUZIZ0pzVTF1Tnd3aTFGVzBMMUxpS0hz?=
 =?utf-8?B?QXdPMHNRb1BBaFJSdU9uMG15Y1UvTE9HV2FjRjZNQlRsSyszaWU3cWZNa3NR?=
 =?utf-8?B?ZHJSSHczTXJOdUJ2UFRJa2dlUzBvRmkrVTd6V1RIOXBTTm0rRFpwakFDYmxT?=
 =?utf-8?B?VDh1WVBOdy9sdk5qTjliMGY0a091NDJtd0ZWVCtvalBjSERxTmFGaElKWEpx?=
 =?utf-8?B?REMwbzJUdFBvdUpxdFEzUEhMUG1oOFEzd1MySERMNVJyeWhiVjVaai8vMk1L?=
 =?utf-8?Q?YM+bS22gYXwebeyS362SGd5aS170o2E4D5K4q?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_AAC25DB9-F22B-402D-A36A-20165589E55E";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9f91f6-27fe-4ec1-3fcc-08da13dc4bfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 12:36:51.3652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nEAPSzEhtzrsEUXJXMSgNvFHNihZ8RcNhgHvdMTGlzBe1lWBfjtefmvhFsLM5ZQNXofRMa8rqukTNAP3fR8dpykrPIQ5KQpeWlVgWYc3NEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5522
X-OriginatorOrg: citrix.com

--Apple-Mail=_AAC25DB9-F22B-402D-A36A-20165589E55E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Feb 23, 2022, at 4:01 PM, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> There's no need to initialize respective data for PV domains. Note =
that
> p2m_teardown_{alt,nested}p2m() will handle the lack-of-initialization
> case fine.
>=20
> As a result, despite PV domains having a host P2M associated with them
> and hence using XENMEM_get_pod_target on such may not be a real =
problem,
> calling p2m_pod_set_mem_target() for a PV domain is surely wrong, even
> if benign at present. Add a guard there as well.
>=20
> In p2m_pod_demand_populate() the situation is a little different: This
> function is reachable only for HVM domains anyway, but following from
> other PoD functions only ever acting on the host P2M (and hence PoD
> entries only ever existing in host P2Ms), assert and bail from there =
for
> non-host-P2Ms.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Thanks,

Reviewed-by: George Dunlap <george.dunlap@citrix.com>

> Perhaps p2m_pod_init() could be invoked from p2m_init_hostp2m(), =
leaving
> all other p2m's PoD state uninitialized. Of course at that point the
> question would be whether the PoD pieces of struct p2m_domain wouldn't
> better move into a separate structure, present only for host P2Ms.
> Together with the p2m_pod_demand_populate() adjustment this might then
> better be a separate change ...

I=E2=80=99d certainly be tempted to do that kind of clean-up.

I would just check this patch in as-is, but if you really want to pull =
the p2m_pod_demand_populate() adjustment into a separate patch to keep =
everything in the same place, feel free to drop that while retaining my =
R-b.

 -George


--Apple-Mail=_AAC25DB9-F22B-402D-A36A-20165589E55E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmJG8eEACgkQshXHp8eE
G+28IAf+NBdmhEywP32CHHC9vrxrEr9fEOz/l2znG/ufxTJC/rX/b8DImF+Sfz1h
UuU+XvvsTpLYdqaYY3PlUseJFwtmIC24AvLIsOI2X+2d7YqaSugaNlE/Kp55oKrK
6H58J4aI1oWJyMFTpbbpNyRgWGcTu1oxohdIb+/nA8rJJhx3JsDo1wWqQDLkdNCg
E0MMDnxEfsFWoWsfZ7nTW1nXvTgaiXGytie2R77ZLJ9Z2j8tG+9nJT3lOv0QP1M0
mUr+quUmgsfszCbxk391LWPeXQyVir9+hSYT3A2foTX3yBAE9q25j4LM0R4gehBj
3yAxIsQbzuhhEnrwwctbyLyGz7ow9Q==
=kU+f
-----END PGP SIGNATURE-----

--Apple-Mail=_AAC25DB9-F22B-402D-A36A-20165589E55E--

