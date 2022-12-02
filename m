Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 965C46403B8
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 10:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451732.709505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p12fZ-0006x7-HK; Fri, 02 Dec 2022 09:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451732.709505; Fri, 02 Dec 2022 09:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p12fZ-0006uf-EN; Fri, 02 Dec 2022 09:49:21 +0000
Received: by outflank-mailman (input) for mailman id 451732;
 Fri, 02 Dec 2022 09:49:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeCl=4A=citrix.com=prvs=328e240bc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p12fY-0006js-5M
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 09:49:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 917c7b60-7226-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 10:49:11 +0100 (CET)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Dec 2022 04:49:15 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6321.namprd03.prod.outlook.com (2603:10b6:806:1b4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 09:49:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 09:49:12 +0000
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
X-Inumbo-ID: 917c7b60-7226-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669974558;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cGyQ/0foqTCQoixkdiWHAFmnQvg8QPJxUvQtU0Av6oU=;
  b=iI+tlEtPStXLl/m9fsy0XuqDIYFgcJ24Gv0E10cgq5JXMrDB1MsgIBzh
   r/ZwSRIGrK+PImBrwB43plJfib0k61S0ss7yMnLHdRtXojmVgcXLSzd7o
   NOyL2EOPUP4U0pnh22neAxTQleOgtVMROnw3xfO89jwT5zyW80Pw3hCxJ
   0=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 86230594
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wXOZlahPiv8j094nRnMwPoL8X161fBEKZh0ujC45NGQN5FlHY01je
 htvUDqGafreYWT2Kd5wbI2z9RtUvZfVx4JrTQVk/CA0EHwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5geEzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQEKi8CUhHcid7nxZ+cGudzxeMfcPXCadZ3VnFIlVk1DN4AaLWaGuDhwoYd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluGya7I5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ROPiraY30QH7Kmo7FzgnZX6w8KOAoU+UYuh+G
 3JJpio1lP1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebTAjy
 FKhhd7iAj1r9rqPRhqgGqy8qDqzPW0eKjYEbCpdFA8duYC8+8c0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNt2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:Gn41ZqApSSeKDz/lHema55DYdb4zR+YMi2TDtnoBLyC9F/byqy
 nAppomPHPP5Qr5O0tQ/uxoWpPgfZq0z/cci7X5Vo3MYOCJggeVBbAn14fkzj3mFWnM8OlQvJ
 0QEZSWo+eRMbE/t7ef3OGjeOxQo+Wv4eS2lI7lvhJQcT0=
X-IronPort-AV: E=Sophos;i="5.96,210,1665460800"; 
   d="scan'208";a="86230594"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHKZEy7HWpkXYvlw7tbriD0YNaSdJN0V+4D2vrce/244un6T4Zp+FvMXaA1ntzT6VdQzMvkr0OiaqZsszS4ci5fa9GHIaRUhONFIfjz6N2OK6lo/KsKUIuQcpR/Wi30jsmYDQ7VdO3EnQKpOHyiVS1vKqBzpohlsmW9vYYJjAPZqf0ggRx2WfFYSDGiNdp1DA3sBfzTWn5KXMOOvp3HB4P2CtyEkh8iPXXJZEK8eDlN+SxJh3JRyZszFHOq+z/0oulY5u4KfxE3SnU64+DgmR1nO7/dWEeFXaJjMHT85nfUa350OiFYrN6vZ3pZzWb9Gze5OHF2no1NC6fRaG1Rx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGyQ/0foqTCQoixkdiWHAFmnQvg8QPJxUvQtU0Av6oU=;
 b=DpUJ7xrGGz1YXl27clezO45KNzcGVKvM1B7ui5iPifVZk0BPIvUwtPfxOTusQ6+UKq23vUvgXHE8bKF752wrGzeF7L2bBF/mor5IPHlGVt1f9E3rsdS5ybP9yLUCCWB+xazFU84kYiCwlrsMfZLtY3r0oh04M7DG3ln2hlN7iUQz/PzouG4s+M63Nfkaa5d1E+h8iLVXViyMa41A07U1hJLfvUpNRQRsCXlWAg0HNQRgWsU1ZNm7jl5nzpWo1p2VE39kcgRwP5MeJHIQ6uboTtTC/AI6aqBSq8VvuouGWKd5SEAlvMXDak7NzEUdnsjPY/T2moELhMS2YNZfDc1b4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGyQ/0foqTCQoixkdiWHAFmnQvg8QPJxUvQtU0Av6oU=;
 b=KDwVHn42EtMWiHMdmnTzpkRLEFILoqBXKacpHgHLm1Xv7CqI5m+lYV6NDthw/iPYJGHEkcyaOFz6Vfyff1pmGccvkgAiGAU4Uc153ATFybpTR3h5moiYiKUqMVGx/dAxjsk6koSiz/u8smEa6tApQWXGURTp7nZHcV5b21rBgPk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Edwin Torok <edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: Re: [PATCH] tools/oxenstored: Render backtraces more nicely in Syslog
Thread-Topic: [PATCH] tools/oxenstored: Render backtraces more nicely in
 Syslog
Thread-Index: AQHZBcqVkKRzz2J21UqyxRAvPfqWaK5aUVgAgAAJugA=
Date: Fri, 2 Dec 2022 09:49:12 +0000
Message-ID: <71962c99-8d79-f177-e77b-9ab53f81a549@citrix.com>
References: <20221201211906.5214-1-andrew.cooper3@citrix.com>
 <646125C9-5AC5-4494-BC9E-B89E6B8440EC@citrix.com>
In-Reply-To: <646125C9-5AC5-4494-BC9E-B89E6B8440EC@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA1PR03MB6321:EE_
x-ms-office365-filtering-correlation-id: f7023cee-08ee-4633-6d77-08dad44a7780
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 63AtK41BtR7Lgwz8M4yumBhreRvHlZAPNTKwN+SRByf+nrmunniRe49QKLyFXpt5VRGG4wP/AVaDq+oF9XvE2sHkYEKYhzJHOI6T//kdJT2akYnribYrMY6jeYakSCnVjV95b4pZtICia3/0F0SqjjoNALa0W9fUE4+6mZU5esn5Q4cC8/jwlwT51KfwRpRTroez+OVo6jDR6c+ZNIKu8TJyQOj7Yx72XTrVfBXHDTVChhiSxZkuHpnAT9CZ+apDLGXZfnsun7OD0udr3RKNuMnF+oTd82rvMyMBVYum9bz4yzvNfzN2WJC1jYwLs7x8ySBxpgTpcxPOlD9/HqEbOnqG88tBUpVbCZMIn8knnXaQY1W5epMdguZxKUFW9eyWseQwFNoh5YrNCf7/ys0p3dDHoohMiRYqS+ZcDx+ugNVDCMyIbFyFjjZ5jjOXi37zcQvYl8ieU0EuJouk358YjEmze8lJpYtpzSXxZ6TbYYyOBLxlMKYlydkIubdCiJwk8xhWXX1D20HV6odObw9BZSYvixFuylChkp7lftD4449BfDzTM3G5llIkTdJO27jokCJ2i/mfzjA4Avmfqa4GY8xECzd40rB1nFZUGTWLnOeKCfslCrNmeBPUVBlq8IP+4itVbeY+M3D/XAdY4Jq1bwcdQPPSXNr6fQywJTy6otmQvZC53bvV20nqTVznUX1VHYowLbpKyDuDIxnZewFUJYcNIaPer6YMu0b9CKnA+o+IReCEqhFcRaLCFFisSFawKB7LHsBCacBIHjd4odl9VQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199015)(82960400001)(38100700002)(36756003)(122000001)(86362001)(31696002)(6636002)(54906003)(316002)(38070700005)(31686004)(66556008)(37006003)(64756008)(66446008)(66476007)(478600001)(91956017)(6486002)(71200400001)(76116006)(107886003)(66946007)(6512007)(26005)(6506007)(53546011)(2906002)(8676002)(83380400001)(4326008)(2616005)(41300700001)(186003)(5660300002)(8936002)(6862004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VG1UNlQ5QlhVencxbEwwVW1ySlNqeHVjTk5HN0lNN1JpQjd2QXlRNVRVa3o5?=
 =?utf-8?B?Q3Vabis4Wko2b0sydlVEUDR2eWJwa015NEpBTEJJRHplUFJwSmhCSjYrcjdT?=
 =?utf-8?B?N2tVT1RmRWxMc1p1UmZPMWxvbkNxMXhIRVhtT0M4c2xqZmpuK3EzeFhMVTJM?=
 =?utf-8?B?SUthbm9adkRXNlF6SmwvN05CZGxWa1ZwQlU3Y3E1QnhHaTlWc21iZ3EyOFRv?=
 =?utf-8?B?YXQ3RUY5NWxTa3RVOStZY2xxWFFqellzRmlvWXZXUW55WlpLaEc1ZWkrYWJT?=
 =?utf-8?B?eEc4RW8zMTZZcXF6UG9Pb2pYYjl5d0kvU1NoSGhwZEd0bUFBS0ZmdHdUNyts?=
 =?utf-8?B?dHdweTR1QWwrYUJEbUNXV09iaHBaMVl6T3c0Z0xDd2VUUWkxZFdKazBrZ1ZG?=
 =?utf-8?B?cWI1WGZ2U3NtRkZ3WElkVzE2YVZWWTBkcU9VNXM3Zy9rbjQ5dEdsQ2psTEVG?=
 =?utf-8?B?TnQ2QWJwRk9YelgySUxsWTF3akxENjE2WmhJNk1abUpqbEwwbFNzNk81ZzBs?=
 =?utf-8?B?ZEFrQThDdEt4a0FEM2VlVzF6S2NhUWhGRlR5Y2xVUFFYMW1zeWRlSkRQcGRF?=
 =?utf-8?B?VkwvUG1SUTNqYk9VNFZmd0dmQ256LzlTUmErYUZQWVMxTXhZUWZ4MXIzN3p6?=
 =?utf-8?B?bWttenVlSGthSWZOL2VQMnk1bElzbmFVSE5XbjNyYTBFUk9wczhBWVpmalEw?=
 =?utf-8?B?cDNsMnZIaElSVW9ubmI3NmIzMmEybkhnK0NPUktEcXZQNGNuNHJmVUdIN1Y2?=
 =?utf-8?B?TnQ3bUsrdkV6OHdJYkJmV2Uyc2RORUNsRzhuaEgvK2JDaFhOVEpzc2NkZmQv?=
 =?utf-8?B?OFhFUE9LQVM2Q3hkWWlVTGpwYmplOWlGTC9VQzRjWG9lUm1YRFp4UkQ1bHZI?=
 =?utf-8?B?MVBIREtPeEVvZ1hBMTFSOUxVWjYzZTg5emozZVR3UnM5amR5Qlp1enNSN091?=
 =?utf-8?B?YmdJN2lvM093SnpNMDl0RWIydnN1bXlQajJZcHdaTFNSMGZjNzJtV3VrZzBQ?=
 =?utf-8?B?TlhOaEtmb1lDOUl4L0hUS0t0MGthSitTYkQ5VmhTYjV4NnU3cWI2cUx6QVNY?=
 =?utf-8?B?SVZIWU96bEt0Y3R5RjR3TEg4VFlUOG5CMU16Mm5qQm1tWmdhT3lZY2ZLdjV1?=
 =?utf-8?B?SmU3SXVWN2l2UDk3RTNVeDhYSHltWnB6cDFIQjlkM3dJeVovRndON1d3MlNv?=
 =?utf-8?B?SnVNbERNNzZyekFyT1ZXU3ZzVnZsMEk3allLMHBqWDN0VVl0K21nNXlKbUNW?=
 =?utf-8?B?MTJ2OHd5QWVKQWhGckpTZEF3SjYxRk9pbjVFMXl2MEE0K1k1ZTlIWUN6WDA0?=
 =?utf-8?B?TkgwbjFlV2pzQ0JxS1JmTmkzNlNzKzBuMjM2OEwvaFUxSXdPMkNJaDJWMlA0?=
 =?utf-8?B?WjVpTXM3Y2NMY3Q2R0tyZWRyK1Bid1FWYVdPTzlpN05iU3p0NFY5TG9Ebksv?=
 =?utf-8?B?bDRZT2hqdmlHWFh6dHJLN2hqbGkxbzZDeGlTeGQyNzVpN05HYXZ4TUdySUVD?=
 =?utf-8?B?d1loaCtTZUhQV01ENnBtSnhQSTZiMFF0ck1mVU84WHFaWkRhOHI2NUM1Y2xz?=
 =?utf-8?B?aU9wU25aMWd6RGFKeElhV0pOZHRQK2RhTWI2amdqbk1OTGsxZll5dlB1ajJF?=
 =?utf-8?B?R1BsYVp1Tk5hdGZ0cXNUaVFkN3oxR1FIZEh0UXloc2o0RlU0Wi9ENHQ2MC9r?=
 =?utf-8?B?RGYwSldrYllOZW9ZaHlkb2dYYzZZYlJQUU5GcVpMSU04MEFoRmc5K1BLcjZh?=
 =?utf-8?B?SE40elFmYWpvNTlKMmhia0hjcGcyUzJ5MHdteGd5MGwzOGJDemQ5Z3VqOHRC?=
 =?utf-8?B?ZUo3Q1lDeDVSWUd3c2tRRGxycW5RR1kwV3VVSHNzR1lkaDY1dkJXY3lVcld5?=
 =?utf-8?B?SVpySXJndWZjT2ZZWTV5THRmcjJGQWh1c0ZLRFdYUlNTMXVrakZmSDcrTG84?=
 =?utf-8?B?WWd2a2RERWtGOUx4N3N2UVg4d0lzN0U1SnhxQ09PNFk0RE05RkhubitxRk5l?=
 =?utf-8?B?RmM3RjRiUUlZRXhLQlo2M3NaTEIxZmE5MmlaS3ZrcDFEZVZCNDlLeUhyS09F?=
 =?utf-8?B?dzJqYkIvQ1BoaTlsRGF0OEtDSHZCbFRRdlU4V1J4WVpielhsaTQ2RGF2c2tC?=
 =?utf-8?Q?lg5HbDeOoOrpj3SnqnXqA76D9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31EB20398A225446AE62EB0B0D1C6739@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pMsfco8LdOAGPwLKWZzUYBruXosLluRy0CiurDObS7vOvyt2L/e90z2nRpyMaU9x0EcMx81kGAGGnUnN5GgrlzoUT/ueRkQRQk/4AsoZNBCFvfdyGv8r9xC6vvbHmJ2tJ8SYw0Knnm70t96Jhqw7abhWsJePGt3izmq4d07z8d4HwjM6goGTcfktvVD6zw8tZlZpmoNTF/FZ3U9XcwuvK9U+kyFnfE/JzBNIc/EqjT61fXbB5IQVHyjhWFuG9OYVoaBAVRZI1sBedEk0t/3tv3ZCsNBCBuilqP1siuzuffG/cK0fji5JwT52sbgK6U84MSghNhrCq8aoMTpn+2JiTHe8Ra41czI5rOsXbt7BlDdiSKQO1xhlDvA7yFTEFMVLmYgOuSqo/7Cwp2D9NhZL/V6wkUxflmgIirxA+owFD7IbxOS1abfnqHtEegL/5sP0460cqvqErOA3egCSRdNGtjyLvRn/4ZBK05TymjCDCgDNT2GHdimikPkCePgQnTkGQvNRTxADHy5fPtKPWB+gxVMy7bXmMB6KDvKBRchG5IPRPXZhSyOgZpptcxkJdlvMbE+SEzJ13pC/3BqjVmBC1bqMdy+U3IWBMU4FFQWIrn3o1JE6YUirhRpTIVChdOpSGAZ+amDc8Pxtqew08u+1zAztQzNT3rfm7aeNfrquQlaAA18gh4i6PtqEKIBwTzbZNUQc/wTyCaZ+X69+X2GUhJOtcalprSfBFbptgTBLyUsY/CUUEJC33eNip6tu9+Dmhj6yZSWPFwSjDc2j1zElss0PlvnN6nS97yA+kc0a1cWmrGp9COVYuwTYHYAzqbzA
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7023cee-08ee-4633-6d77-08dad44a7780
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 09:49:12.3764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g3CTAHaOmj4t5z+tGKYxG5iTenKmcHz/hY+St8tnXnIaAwG6UExvb2G2+TM/n2WCVjNbQQygaIPFCb6spb9QjyOge+eJTVCadJkO5yOM3pY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6321

T24gMDIvMTIvMjAyMiAwOToxNCwgQ2hyaXN0aWFuIExpbmRpZyB3cm90ZToNCj4+IE9uIDEgRGVj
IDIwMjIsIGF0IDIxOjE5LCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PiB3cm90ZToNCj4+DQo+PiBmYWxsYmFja19leGNlcHRpb25faGFuZGxlciBmZWVkcyBhIHN0cmlu
ZyB3aXRoIGVtYmVkZGVkIG5ld2xpbmVzIGRpcmVjdGx5IGludG8NCj4+IHN5c2xvZygpLiAgV2hp
bGUgdGhpcyBpcyBhbiBpbXByb3ZlbWVudCBvbiBnZXR0aW5nIG5vdGhpbmcsIHN5c2xvZ2QgZXNj
YXBlcw0KPj4gYWxsIGNvbnRyb2wgY2hhcmFjdGVycyBpdCBnZXRzLCBhbmQgZW1pdHMgb25lIChs
b25nKSBsaW5lIGludG8gdGhlIGxvZy4NCj4+DQo+PiBGaXggdGhlIHByb2JsZW0gZ2VuZXJhbGx5
IGluIHRoZSBzeXNsb2cgc3R1Yi4gIEFzIHdlIGFscmVhZHkgaGF2ZSBhIGxvY2FsIGNvcHkNCj4+
IG9mIHRoZSBzdHJpbmcsIHNwbGl0IGl0IGluIHBsYWNlIGFuZCBlbWl0IG9uZSBzeXNsb2coKSBj
YWxsIHBlciBsaW5lLg0KPj4NCj4+IEFsc28gdHdlYWsgTG9nZ2luZy5tc2dfb2YgdG8gYXZvaWQg
cHV0dGluZyBhbiBleHRyYSBuZXdsaW5lIG9uIGEgc3RyaW5nIHdoaWNoDQo+PiBhbHJlYWR5IGVu
ZHMgd2l0aCBvbmUuDQo+Pg0KPj4gRml4ZXM6IGVlNzgxNWY0OWZhZiAoInRvb2xzL294ZW5zdG9y
ZWQ6IFNldCB1bmNhdWdodCBleGNlcHRpb24gaGFuZGxlciIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4gLS0tDQo+PiBDQzog
Q2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPg0KPj4gQ0M6IERh
dmlkIFNjb3R0IDxkYXZlQHJlY29pbC5vcmc+DQo+PiBDQzogRWR3aW4gVG9yb2sgPGVkdmluLnRv
cm9rQGNpdHJpeC5jb20+DQo+PiBDQzogUm9iIEhvZXMgPFJvYi5Ib2VzQGNpdHJpeC5jb20+DQo+
IEFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+
DQoNClRoYW5rcy4NCg0KPg0KPj4gLS0tDQo+PiB0b29scy9vY2FtbC94ZW5zdG9yZWQvbG9nZ2lu
Zy5tbCAgICAgfCAgMiArLQ0KPj4gdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N5c2xvZ19zdHVicy5j
IHwgMjYgKysrKysrKysrKysrKysrKysrKysrKystLS0NCj4+IDIgZmlsZXMgY2hhbmdlZCwgMjQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMv
b2NhbWwveGVuc3RvcmVkL2xvZ2dpbmcubWwgYi90b29scy9vY2FtbC94ZW5zdG9yZWQvbG9nZ2lu
Zy5tbA0KPj4gaW5kZXggMjU1MDUxNDM3ZDYwLi5mMjMzYmM5YTM5NTYgMTAwNjQ0DQo+PiAtLS0g
YS90b29scy9vY2FtbC94ZW5zdG9yZWQvbG9nZ2luZy5tbA0KPj4gKysrIGIvdG9vbHMvb2NhbWwv
eGVuc3RvcmVkL2xvZ2dpbmcubWwNCj4+IEBAIC0zNDQsNyArMzQ0LDcgQEAgbGV0IHdhdGNoX25v
dF9maXJlZCB+Y29uIHBlcm1zIHBhdGggPQ0KPj4gCWFjY2Vzc19sb2dnaW5nIH50aWQ6MCB+Y29u
IH5kYXRhIFdhdGNoX25vdF9maXJlZCB+bGV2ZWw6SW5mbw0KPj4NCj4+IGxldCBtc2dfb2YgZXhu
IGJ0ID0NCj4+IC0JUHJpbnRmLnNwcmludGYgIkZhdGFsIGV4Y2VwdGlvbjogJXNcbiVzXG4iIChQ
cmludGV4Yy50b19zdHJpbmcgZXhuKQ0KPj4gKwlQcmludGYuc3ByaW50ZiAiRmF0YWwgZXhjZXB0
aW9uOiAlc1xuJXMiIChQcmludGV4Yy50b19zdHJpbmcgZXhuKQ0KPj4gCQkoUHJpbnRleGMucmF3
X2JhY2t0cmFjZV90b19zdHJpbmcgYnQpDQo+Pg0KPj4gbGV0IGZhbGxiYWNrX2V4Y2VwdGlvbl9o
YW5kbGVyIGV4biBidCA9DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N5
c2xvZ19zdHVicy5jIGIvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N5c2xvZ19zdHVicy5jDQo+PiBp
bmRleCBlMTZjM2E5NDkxZDAuLjc2MGU3OGZmNzNkYyAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL29j
YW1sL3hlbnN0b3JlZC9zeXNsb2dfc3R1YnMuYw0KPj4gKysrIGIvdG9vbHMvb2NhbWwveGVuc3Rv
cmVkL3N5c2xvZ19zdHVicy5jDQo+PiBAQCAtMzcsMTQgKzM3LDM0IEBAIHZhbHVlIHN0dWJfc3lz
bG9nKHZhbHVlIGZhY2lsaXR5LCB2YWx1ZSBsZXZlbCwgdmFsdWUgbXNnKQ0KPj4gew0KPj4gCUNB
TUxwYXJhbTMoZmFjaWxpdHksIGxldmVsLCBtc2cpOw0KPj4gCWNoYXIgKmNfbXNnID0gc3RyZHVw
KFN0cmluZ192YWwobXNnKSk7DQo+IElzIHRoaXMgd29ya2luZyBhcyBleHBlY3RlZD8gQW4gT0Nh
bWwgc3RyaW5nIG1heSBjb250YWluIGVtYmVkZGVkIG51bGwgYnl0ZXMuDQoNCkkgd29uZGVyZWQg
dGhlIHNhbWUsIGJ1dCB0aGVyZSdzIHJlYWxseSBub3RoaW5nIHNhbmUgdG8gYmUgZG9uZS4NCg0K
VGhpcyBpcyBmb3IgaGFuZGxpbmcgaHVtYW4gcmVhZGFibGUgc3RyaW5ncywgYW5kIGF0dGVtcHRp
bmcgdG8gZm9yY2UNCk5VTHMgb3V0IHZpYSBzeXNsb2coKSBjYW4ndCBiZSBkb25lIChiZWNhdXNl
IG9mIHN5c2xvZygpJ3MgQVBJKS4NCg0KfkFuZHJldw0K

