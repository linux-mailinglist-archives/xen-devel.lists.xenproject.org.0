Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A1A5469CA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 17:50:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346524.572350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzgt8-0006mR-6a; Fri, 10 Jun 2022 15:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346524.572350; Fri, 10 Jun 2022 15:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzgt8-0006jl-3J; Fri, 10 Jun 2022 15:49:30 +0000
Received: by outflank-mailman (input) for mailman id 346524;
 Fri, 10 Jun 2022 15:49:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0XP=WR=citrix.com=prvs=1532263ae=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nzgt7-0006jf-9N
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 15:49:29 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7cddce9-e8d4-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 17:49:27 +0200 (CEST)
Received: from mail-dm6nam04lp2049.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jun 2022 11:49:25 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM4PR03MB5998.namprd03.prod.outlook.com (2603:10b6:5:389::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 15:49:23 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%6]) with mapi id 15.20.5332.014; Fri, 10 Jun 2022
 15:49:23 +0000
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
X-Inumbo-ID: e7cddce9-e8d4-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654876167;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bNXaUmpJHk6Otpx1bJFK7v0Vl3VMIHYbaxa5i5lJN1Q=;
  b=CEUzHUjcnw1WGEBGRPUAJEkBTkbrb6XVS+joqnhTEXUUMwVMw0qLlOzj
   3U8zjD/3D+WhoIsFrfis2TxrjxIa6SuyunZ7eE0k0rVUtgFMpiybU+QDd
   JjRKIdHi5UbGP6eSbPgOUX/TB4UkvwuzG2yGbv5DyHG45LVU0j+DbK8Aj
   Q=;
X-IronPort-RemoteIP: 104.47.73.49
X-IronPort-MID: 73340195
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:g+TicqvLuAkQrU0Thu+6Yc61U+fnVCNfMUV32f8akzHdYApBsoF/q
 tZmKWGBP/vfY2f0Ktp1aYy+8EsHucTTn4dqSQBlqik8Ey8W+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW13U4
 YuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8oGYjwqfUjVyVAHnxuN592x7/KAFqw5Jn7I03uKxMAwt1IJWRuYcg037gyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4ADmmth7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wnO+fJusjW7IApZ4uLBK/TLRPm2T8RWlxeHl
 D/K3V3YK0RPXDCY4X/fmp62vcffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9BVJ
 lEQ+yEuhbMv70HtRd74NzWnpFaUsxhaXMBfe9DW8ymIw6vQpgqcWG4NS2YdbMR87JNnAzs3y
 lWOgtXlQyR1t6GYQm6c8bHSqi6uPS8SLikJYipsoRY53uQPabob1nrnJuuP2obs5jEpMVkcG
 wy3kRU=
IronPort-HdrOrdr: A9a23:DOsZvaBVqPix1PjlHeg+sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4N6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1wjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvW/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdb11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj4lLYIk7zI9HakGOuh5Dt
 T/Q9pVfY51P78rhIJGdZA8qJiMexrwqSylChPgHX3XUIc6Blnql7nbpJ0I2cDCQu178HJ1ou
 WKbG9l
X-IronPort-AV: E=Sophos;i="5.91,290,1647316800"; 
   d="scan'208";a="73340195"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvBlsBIp7ZiDYmA1wlZ1Im0Tok3kFfGa2zcvZiwQgXY9ierNvFhodcx462uTyY9UuWxOJGtWgOOcTiYQrm8gS1agy4M+5n9ZW+nPq5TSItikjtVR3Xgr6V3KWguolSParOWhJca7lEJxDPEecdmywN1h9ghsQqfWZm5SO09ObEiGOfTdo0LqjBzdh1p2i3s+qqxdHIZraGjsZXwVA2OMXmFUK+D/9eRt12NUkvc5YszPi6vWIbmnFfx9dVq1Y7pDBLNkHbLKsbkkkYLHCaRa9iHXWue4c00ayfsbQGRf6n5hEaE4cCBLe/Lns5/GyPbN9bEl1eOSdGU0GGEs7nqitA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WK/EBB/WkeUGGPPya+wMX8gD82aPsuxbyLsNpof2Mds=;
 b=BX0Tl5RMo9zY2bFpkUHKRSt3zPLHomYaDxrq6XyomcwK7BIVRBvVf2hA6H4EhjPSBx14dR2Qxg3QiLxjY8C67ivGfHmas1lYLf2PZV2nxNqjUYRQyJ/H/Ls0RlmoNoT9jWB6InD1d6g5UlnHP6SlRvzEVLKOYR68wj9n/NeJggW+AZ1LNV89DSxzJNhc7zueO3x33+PcEZiZ4sGcbyaE8jgHOYtqjg9Kx/dr5wI4VOviCvww6agmoHPrr5OJi82DNlEBhfbxtLF9qUx2OIuEzZM2hBOG91CSs67DZfJGW0v3/6fdg5hhi5REUYaFY1EVgXt4EFWPyF5spjsE+5Pkkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK/EBB/WkeUGGPPya+wMX8gD82aPsuxbyLsNpof2Mds=;
 b=GTj+DqGYuc03Gz7ut1Xgnk9xh0d7zSAlBcuWC2THlup+hsTxTSkhRkgo58iqL9rX4h2iuyRwJzrgfLT7xswpLjAua3Dw+bHW7/DMgfELFe8io5mfy1V9QfPt8uPc55goHPYw/GmW6CRhzMs9HFu+ls/zZuGcoFUYMJ9H0hdHkmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 10 Jun 2022 17:49:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4] x86/hvm: Widen condition for
 is_hvm_pv_evtchn_domain() and report fix in CPUID
Message-ID: <YqNn/hVUYZyrN8o2@Air-de-Roger>
References: <20220610110704.29039-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220610110704.29039-1-jane.malalane@citrix.com>
X-ClientProxiedBy: LO4P123CA0371.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0b723f3-efdb-4154-efa3-08da4af8ca56
X-MS-TrafficTypeDiagnostic: DM4PR03MB5998:EE_
X-Microsoft-Antispam-PRVS:
	<DM4PR03MB59985D6B80D155B4F0F2073D8FA69@DM4PR03MB5998.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J2rAk6dGac2+gVKXqKJlSYP4KXPXiZDkfJyj3+vUZRemDu2LdBVfRmZ1BA314mhO4M8R23tPpOsbdfhUCeLqrQ9qHoHE8CDjm8/34YwsWTfcd3c1gYOHQhn2IKofTWFNBas6arzwQy6R3toJqM44piLJ82U9cmWyyc0aB7dEVe5S7zMxgRDwI+qeEnLPyfJt1WZ5oqY50FtxyC9kmjfk0GWZgjD2a7hOeZWemIwmmtLXyvWSzi0ZtmNGiScPafSuwjm4IPuNPR09pR0zrEOK1ngfalpraABIP9lLoANDG5yuAGGANop7MM+muzqjpA7OKApo+PmIBB1Lf5PbkwPPORPubZOpU4r2iS0s11hExHrMxSZsrlN+1bWuPX6TELMS9l3q5y7H0puVeiSp0347BsfqjzunfSzJaLvfSmf20HeGCitlKXa+Ta7Iamjgo2hpcty2hibT7B+gP2opxf68OwTrJ5ByMXovqWEGzlhnjMKFZ+UAn5kdocXY2W/ti11Z5k0VKCvILte9PcIu9/waH2ekCryB1mpYQaB3wMNpbIVA2EVlDUUVFuMvnRsCPcfNJf107A4UIjdjtMm7B+NIaN9IGXEMZNzXnPhdS0pqt+U6hbUcNAyAq9ypfrzpT4JIua/C8COsdmX4n1lLt3vytg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(33716001)(8936002)(66946007)(66556008)(6862004)(85182001)(82960400001)(5660300002)(4326008)(8676002)(66476007)(6636002)(54906003)(316002)(38100700002)(508600001)(6486002)(26005)(6666004)(86362001)(6506007)(9686003)(186003)(2906002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjlJSHFkN3hQUG1hV2owMWs2ZGtOZG5hdURydmZvbUUwZDc5czZlZEVML1lp?=
 =?utf-8?B?cTdrSzg2UURRL1Z1N2dVQXdpN05GYjU0NHkvYlIvcEsxN04wMU5Qa0Q3bnFj?=
 =?utf-8?B?c2QxS1ErTGVYaXdXQnkvcnppYUR3WU9pUHFTamVtSXd0MXFMMm56M29rOXk2?=
 =?utf-8?B?Z2Z4WTEwT1NqNEx6SG91aWMrTnVsTmM1ZkNRRi9yZzFsSyszY3pXQzhnYjRt?=
 =?utf-8?B?TW5SUnZBNlY2ZWxNUWtlZzF5dmtqV3pndDZQTzBpSG5XS1Q5ZExMbHRRQmwy?=
 =?utf-8?B?bExnNGhFcWtBTVYvT3VtNHFJU1BKWjdtV01ubGJ6NkxaRjBoemNabWhZS3Zk?=
 =?utf-8?B?VXBDbVZaS3NqSFg0bGlWVUJhQXBRRVVVQytabG9hd2ZFbW9wNU9yUnV0U2FW?=
 =?utf-8?B?TlBpL0tvY2dzc0tBcmZjd0pnRXA1dmNDd0ZFTnRSN2I3ak0vTE5nenFqczlR?=
 =?utf-8?B?dmJzTHBNVUVaRjdLdWZCRDhiTzdjVDZtTEZ3T0poNEZEWjkyeUVidTdaTVMy?=
 =?utf-8?B?b09vN2l2ZGxNUU9ubHdHcmFaMmFXekdsejViODFNd0Q0NXo5eEVEZHhXTlFX?=
 =?utf-8?B?V2FmaVJEOWZMT3BhL2FJWkxYZUVrS0VXSi9BYWlXZGxWNW5lQnFRamVVak5W?=
 =?utf-8?B?N1pBN05DTGh0cGlhME9ublRTOHhJTkRKWFBrMGJWRlRZbmJ1TnBDR1F3cTBF?=
 =?utf-8?B?MTR4YkRNUHdJSVZ4OS9NbXREVFprMTFOV0JNbDBOWnNIYTYrRUhxdTUwWHVQ?=
 =?utf-8?B?WG5hZk5OVzVEYTduWTFwRlh5Yzk1R1BJZEpWU1ZjWVpxSkR6ck0yRkI3QkM4?=
 =?utf-8?B?VWVWbWJUM3ZHZGY2UjdCRU1wUElsNW0zMTNvOHc2d3BXekR0eWJzOWoxVko5?=
 =?utf-8?B?K280NGN0alRuRnA2cEdnY1ZMRGhmdkJsY3Rzayt4V0QzME16NkRwQ3FoV3hy?=
 =?utf-8?B?MjArWUxGZDZMci9iRVlFWEJibXlYOVR2M2NRekZWSGVzcjZwMWZKdjJEbzF2?=
 =?utf-8?B?MDdkUW5Rc3Vjc0R1MUpSWm5LY1czTU5PalM0dTJOQ2ZuVW83ckMrRkZ0aDJ1?=
 =?utf-8?B?L2hTbmg2bFJCMzcySEh4elhyVi8rcUdxamg0eGhNcWtxOFVRWkFsOElOWVpL?=
 =?utf-8?B?U0xycjN1ZTFiZm9Xc0s2dEZaNDYwaHJrSTIvdE1WV2xKTUo5ZFZOSDJEQUVo?=
 =?utf-8?B?T0h6UnQ5NHZLMXh1Tk5YazBDMzh3aGVQYmp3YmU2dWlVV0pGY0NMZGNscTJL?=
 =?utf-8?B?VFNQOGl3NllmajhXUWZSWUpsaDdzVWxBWlVwQlRTbTB0cEpEencxSDFJUFR0?=
 =?utf-8?B?Q2VqYnhXYlpHZTlEdHkwUU0vSG4xMUpwcTI5RlNObEk5bXh4S0d0QkNvdXZ0?=
 =?utf-8?B?VWdUaTMzdG8rL1JSM0JkZUhIbTNDN2laOVRHdGtVcjZhY1FZb2JWZjBLMU54?=
 =?utf-8?B?V2o0RWJOa3F1dmRkQ2t6SzZpWEZQRWpTMUs3YkVzNk1JVnlJdWhVTStiSGNF?=
 =?utf-8?B?UEwyTmhGMm04UFE0amVSUUpWRDB3RkR0NVJrNEFQajlObFU5R01RNGM3SXpT?=
 =?utf-8?B?WG52V1RueTlNM2t4WWk0VnFweW1QY09QMVpreC9DbWh6bkVUMkM3Ymw5N1Vv?=
 =?utf-8?B?cTdEU2VBRCt4VVl3b2UvRFNyTHNiREUwbmZKa3AxWlJYRTNvWnVNQU5VOU1a?=
 =?utf-8?B?UUdEQzdmSFBIeDRuajMzYlZtem9McytjbS93dGZsdlFSczdVbVhudy9BZmlF?=
 =?utf-8?B?MHJGSUovS3dwanJSaTl4S1lFWDBzdDZ0VFVwM0hWZ3M4OEtObTBqQ004WHpq?=
 =?utf-8?B?ZXYrWnc5NThmOHF0R20zMThFR0ppZVZyOS95Unowa0RzdWg0QVdXRGtGTXZD?=
 =?utf-8?B?elViMGhFZ1VDTUsxVkFhc3ZaMk15aXF4Ti8vQithcVJvc2RRZXlCMy9PVEJl?=
 =?utf-8?B?c2RaeUtKUjNFTzk1cmxvc0o5UUhoMDhZTDFVdit4b2xPc0craTBnbW54cDE2?=
 =?utf-8?B?ejhaTkRVODdPRjFWbWFaNWZlUjY3SEdjRHdzalpoMWlJTGJ5dFpsZU5rUWhZ?=
 =?utf-8?B?VDFvSi9zY2krSmpISmRDZFo2cGZBVUJkeHZxdHB1UHhheml5eDFmNDU2R3pX?=
 =?utf-8?B?RWcxK3B0Mk1wQnB6WjhiSWF3QzZNcHp6bFhheHFrRmlJVXNJTWoydk9PSVo1?=
 =?utf-8?B?T3Jic29qa2R1Snl1SktScTViVDlUazJCUnlkc1JsamJrVGZqcFROaUl1Wkgv?=
 =?utf-8?B?Q0lBb2pqRVZBWGJNWEZUc0VvbDdDUE9JdFNKbVlnSCtaSWEvTVdDTHdDMWN6?=
 =?utf-8?B?SXpRcmdOYWZIRWh0NllYQzJ6ZVlEY3JrUWV4dGJ6b1BzVVRKWERNVDF5R0pr?=
 =?utf-8?Q?t7GyYyUkdUyDJriI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b723f3-efdb-4154-efa3-08da4af8ca56
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 15:49:23.6042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmVj8yoexPUn1Wh1yXFDSPVkTEZ5JqzqX9TGHc92iUQNhKESWGkqFpMr2Aqyak08IzY68BAItDa1JHG8xM1OQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5998

On Fri, Jun 10, 2022 at 12:07:04PM +0100, Jane Malalane wrote:
> Have is_hvm_pv_evtchn_domain() return true for vector callbacks for
> evtchn delivery set up on a per-vCPU basis via
> HVMOP_set_evtchn_upcall_vector.
> 
> Assume that if vCPU0 uses HVMOP_set_evtchn_upcall_vector, all
> remaining vCPUs will too and thus remove is_hvm_pv_evtchn_vcpu() and
> replace sole caller with is_hvm_pv_evtchn_domain().
> 
> is_hvm_pv_evtchn_domain() returning true is a condition for setting up
> physical IRQ to event channel mappings. Therefore, also add a CPUID
> bit so that guests know whether the check in is_hvm_pv_evtchn_domain()
> will fail when using HVMOP_set_evtchn_upcall_vector. This matters for
> guests that route PIRQs over event channels since
> is_hvm_pv_evtchn_domain() is a condition in physdev_map_pirq().
> 
> The naming of the CPUID bit is quite generic about upcall support
> being available. That's done so that the define name doesn't become
> overly long.
> 
> A guest that doesn't care about physical interrupts routed over event
> channels can just test for the availability of the hypercall directly
> (HVMOP_set_evtchn_upcall_vector) without checking the CPUID bit.
> 
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

