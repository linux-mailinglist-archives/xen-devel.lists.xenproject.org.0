Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FC958F23A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 20:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383813.619014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLqJK-0004PR-VU; Wed, 10 Aug 2022 18:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383813.619014; Wed, 10 Aug 2022 18:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLqJK-0004Nf-R7; Wed, 10 Aug 2022 18:20:06 +0000
Received: by outflank-mailman (input) for mailman id 383813;
 Wed, 10 Aug 2022 18:20:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUq/=YO=citrix.com=prvs=214886735=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLqJJ-0004CC-FQ
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 18:20:05 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d0182b1-18d9-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 20:20:04 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 14:19:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6711.namprd03.prod.outlook.com (2603:10b6:303:17a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 10 Aug
 2022 18:19:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 18:19:51 +0000
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
X-Inumbo-ID: 0d0182b1-18d9-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660155603;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dpws7zw8wqyZAg5d0bOkx/+XIDZ2jqPvftyQCig4v6o=;
  b=N7FBy6GViVSYAwJpjWIr8qXglIxaVpeMdxbqSWO8BIQrdM+7LYcSuR/m
   ELGaxe+KhBIdEpcU0qwaYXDf0NLw08QG147ERJkJN6mxyxM42qsyZBN3W
   41h5TKvCGM27uZYMBKHwnBUmWjqgTlbpg3yENA0NMFYKd6hEInss3djPx
   A=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 77052955
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1nYdSKOTxcJvcB3vrR28lsFynXyQoLVcMsEvi/4bfWQNrUpx0zEEx
 2EbXGzUPazfZ2HxeNolYdvg/BkBvMSDzIRmGwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/vb8EgHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFOy2NFVAV8RZbZGuckpGCJW+
 +YEOg4CO0Xra+KemNpXS8FKr+F6dozHGd1avXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rr5wCChIlW0q3rMzUYzy0HVwBZ8z/7GN93Nd8bRbc5UglyZt
 iTN+GGR7hQya4PHlGDUry/EaunnvgT1QdxNLpqC2eMtn1+t3FYuMQUMbA7uyRW+ogvkMz5FE
 GQW8Cczqak59GSwU8LwGRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQ10
 neZktWvAiZg2IB5UlqY/7aQ6D+3Zy4cKDZYYTdeFFVUpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2JNo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:bd8i561AyELsp7WgUumtyQqjBZpxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LoSK05KX8Gx242A5bdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGpphe0aJ9nU7iiuilwhO208l4lnP
 TFvh9lFcVu7HH6eH2zvHLWqkfd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7nF6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklUqvoXRiKrbzPIt
 MeS/0018wmN29yqEqp51WH9ebcGkjb2C32GnTq9PbliAS+10oJsnfwjPZv4kvosqhNC6Wsrt
 60TJiB3tt1P7ArRLM4C+EbTcStDGvRBRrKLWKJOFziULoKInTXtvfMkfwIDcyRCes1JaEJ6e
 L8eUIdsXR3d1PlCMWI0pEO+hfRQH+lVTCozs1F/ZB2trD1WbKuaES4ORsTutrlp+9aDtzQWv
 61Np4TC/j/LXH2EYIM2wHlQZFdJXQXTcVQsNcmXFCFpN7NN+TRx6TmWeeWIKCoHScvW2v5DH
 dGVD/vJN9Y5kTuQXP8iAi5YQKYRqU+x+MELEH3xZli9GFWDPw8juE8syXL2uibbTtfr6cxYE
 xyZLv6j6LTnxjFwVr1
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="77052955"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0kWpULsVYNx+e8jZiW4DaBDklsBNh4WJxwu+t/x5FMDbQoqdnVTEP6JMFm74hVDmBU1exj1FwAjk3UgSkxnGDbPLR5vwTw27AzLzL1l3cNVqw899QbFuq/uDuiVGLQ2/Cxoa+B3/pjqzcpkwhUFOxND5mVWQ3KUsnP4yMf45rh01RMsurOY3KOq1Lq8wKm3ZijJAFeuMJ8hq6fnDgIB0a/LQecOOwoECd7pN3M0ZsGrMCTNvih6fwSk8JxwMOlfH8MtPnMoKdbH7iAYpfcD9XOezU+J3WgmmpneFj5nRIz0RuSAJXQle06JF6hEXMVWfAkcw+ZuhwV0kw4mNSWbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpws7zw8wqyZAg5d0bOkx/+XIDZ2jqPvftyQCig4v6o=;
 b=FUxuU8hFVB1VixkynWeiNigk3tYYy15iOobiFshLK7yiFVjFIOFK1KxyFkRe9dM3g3nIBULGvjvi8PieU0l76b/14EYRTBlb7XBc+UJj2w1eIn3aGZ75Z+wWznnfH+vknHvH7u4My9S30OrdGr7dasGTrU0Auk8cBLaftN8vstzZCzlbcR9V9IFvAdIF+sveSHcCGv87iU4nnnLs/wVzMTTAtJcVnRegSL41wrKC4qX4ZDCWyH5mWIS8dK79vh+2lByQf7gyLw1wMOIrr2mGARvzVmtYxBXQTQ77yKAhOD1PVKb6co7V/0D0PDEqSLjsd1U5A+/As0cqP9r5zs1QBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpws7zw8wqyZAg5d0bOkx/+XIDZ2jqPvftyQCig4v6o=;
 b=En40AEXp/rjKbD20aaQ+ALKAdvz2em9WBbXkbHnX70QrlVnovR81/HkGUvwUeLQvq3Bu/nn/o4Cz7/tqTHnoOUomZk/hczONIAeU4SbxgTbdbj6oeBPKxT7JDdOR5yES23+v5LRk2OwIVCKXCD4HlmqAQJQPGrPVPpfmmX/uHNM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 06/11] x86emul: handle AVX512-FP16 Map6 misc insns
Thread-Topic: [PATCH 06/11] x86emul: handle AVX512-FP16 Map6 misc insns
Thread-Index: AQHYgKLNcpy29FwOe0qp2fzlrLJoM62oykqA
Date: Wed, 10 Aug 2022 18:19:51 +0000
Message-ID: <6b9c7d2b-4711-882b-975e-d12d87d95ff2@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <ca49ed5d-d440-72da-6f56-664888c8b25c@suse.com>
In-Reply-To: <ca49ed5d-d440-72da-6f56-664888c8b25c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a55a9398-1bd6-4ef5-014e-08da7afceadc
x-ms-traffictypediagnostic: CO3PR03MB6711:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 iZjkgutZdep4bAILMBHgBQ/u+VhDeSzi18gFTVqkgXMsJBki8cTUZJ4f7188zVZncAHr38h0rePJAAcIH4hyIPuyvQQOQWL/LyK4LtsFI2lW5Q3+Y0x91X0v7otL1258gb4FgZL7C8mQALd1gdBg27DgjoBMKQwseKAeSfPS5sqtRuMc8WEbQkjdUDgWqagiYhUEOCk3iEghrRYHlfK0qF4d9SuV9JLPcmZISOVkTnp/jTRTxIJXAtJcuI8pzRvwU3w3vjO+DZRk0L9tDALdCv3GSsmgSx2vj18P5JKwnSimEQpXBP6oN2YOphkzmDpS6xO/5U25DyJd7CdOGisPEXKvICcWMgN9LU38iUzU5RjLzBDomQmM4SrtTvEpVpilF9BmoRW5J6nYVoJwcNZXMcSwxpML3d3jzPUfMA1jVUq55Fzyfib8s/B50K4J5+ITe7P2KY1DcsmF5JcjUnfaKFvzT5fojYs3PJYZeI0GRDHjxPHepWT27RQhgQVKePA9CB1qxMgl56azdfBjHN3lwebgYnSzmltVN4V8u1sgSGPs/0LABgqcFyxtIzg/62+QcFpTc892RrBIeUkoJMvZ2tFONlWuX9LbJY+9wZzSX4tiKRlACGpnNU2Z/bfOrXkFSXDiAQPnFJcDOOazJEDPW1uTM4rteYWj3JinNVW/K3MaKxAUG5IjW4kuaonTeGSwhknnJNn6OnefuJDxgaN62Ihft0gaFkUQe/00qh50pUYAJPEGNFs8M7NaVCyB35u0aa3sHsi4Koo8JfLx8ZRnQUg7R81kqjZ2NSZnNgK+WzHGwoJpjHhxw5OtKoRsHvDgWAO0wA2l/4ZwAkLXdJ4WTdITfvyAZsgwRoFBY0tzNbAJh8F0hv/n2t6JfPpRPV22
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(8676002)(6512007)(186003)(26005)(4326008)(64756008)(54906003)(316002)(66446008)(107886003)(6486002)(2616005)(66476007)(91956017)(66946007)(66556008)(478600001)(76116006)(36756003)(110136005)(31686004)(2906002)(6506007)(53546011)(41300700001)(8936002)(82960400001)(31696002)(86362001)(71200400001)(5660300002)(122000001)(38100700002)(4744005)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzVKMmw0ZUpkUFVGbFNMcHR1eFJHc2ZtS1M4VzFaU3R4b0p2czBvL0ZBcklx?=
 =?utf-8?B?KzVOdDlzTUtoT053Q3lvdUhQcm9CNi9udVFia3VHODl4UWN0MjY4bmxjUE5i?=
 =?utf-8?B?T1JXOWpTWW1icW1zTW83aUx1N2t6MVRiQ3U3aFNkcWNwempnTVFPSkJIMFVQ?=
 =?utf-8?B?eWZoVVlVNzJrSjROM3p6VGRYRjVLU0lSV0czdk9saG84MDBrNUppQnBZY1g1?=
 =?utf-8?B?V1R0TnB0bkd4bDFIUFFaaDExaDQyeGViSFJvVlFRRkRjWWxBVGZKV0JBQ25v?=
 =?utf-8?B?R3NkTDk5VCtQdlN0Y3A3WEl2LzZoUVhBZlBuUjY0WExaVm5sUE91Q1B3SmRR?=
 =?utf-8?B?OUp0b3JMNWFPSC9tR2xpWmVJbCtjdWpGMWt2VHZZUHhWbk5zUm5BWVFpK3hS?=
 =?utf-8?B?MXhZc2h1RlN5dnFjTDlneDFURFpZOWdRRWtvYTZNYUpWcUs2RmNwekJ3T29Q?=
 =?utf-8?B?SGIrSS8zd3JFWStOM1dqd0R0TFoyNzBBazI1OWJ6bHArbmYxcXVjalZxbld4?=
 =?utf-8?B?UjhVK3YxSHNYdnRGa2hCVE0rUjFDZ0M4ZW9LczJrQXBnbWZUMXdQR0tZVmZP?=
 =?utf-8?B?aGg5RnhyVHNvc05QZTdTckNsSTR5c2VLSUJNb3JyT3NKY2htTzFZTXhvTlhP?=
 =?utf-8?B?WWtyQlREc2tBcmtudUVPSXNYN0NEWDJ1enZJN2xTTlNPUjVDNWVFWkpxczFN?=
 =?utf-8?B?M1NhaXVZY3lyWUxkdzlzRkdWOVM0OUtWM2ZRS0F5Z0FuYUVCTXBzTTM2S2lp?=
 =?utf-8?B?K1d5dFNPWUpucHVYYm5BZ09wSlJseXg3ZXE4eitvL2tRNDFEMDgvbWtoRXY0?=
 =?utf-8?B?T1F1UVZ6OWxyamJDUFJjMGhtMkE2enRQZ0pVSlhWZnEzdHliby80SFBiM1Ez?=
 =?utf-8?B?Y0pLeS9icWdvT1JySWE2WkNGc0NEbHgwdEczdFZpdytlWGlFbmRBOG50WTRQ?=
 =?utf-8?B?SUpSekF6R3JtbERpd0d6YXVXdUFkYjhpTGhlWDRMMEdBbVZRNk1yWlBUUFVk?=
 =?utf-8?B?amdHWTJ3ZWZIeS9pMEpFaWJDdmF0aVF3czRLMGRoNlN0d20vYTI0c2oycThX?=
 =?utf-8?B?K1UvbHZ5aStlU0lHYlgxdGZKZlM1Yk9VOEdLcGRscVhlNmxCNldLUlhIQTFl?=
 =?utf-8?B?cG5rTDlHVlFUTXJHMG1BcjdpNU50cVZjM2h5RjVYNUY0WHczVnJmOUJPbTdU?=
 =?utf-8?B?RHFxSVNFbG53VjdicFdJenJSNHhKazVBQVRXajhBYkw1cUN1WlMxK1ZINTBJ?=
 =?utf-8?B?Vnh1djNrNmdlYVZJMTZSeGZPNklwK0RPTEIveVVIdXM3R04yTEhhZVhmYzcv?=
 =?utf-8?B?NWtYZVpUZERUVVZ6US9QZGMvL0Y3Q0pwSzliem5CbzRJNEQrOE0yM0tlcEU2?=
 =?utf-8?B?UFhXUURpOXZxNXA4alp5TGUrRTkrL3VMTFIxdmR0VnJhekhzMUladTIzVTRF?=
 =?utf-8?B?a3A4NU84SCtVSGdHUUFvdmNkV2o5QVQ3RHY2UUg4MERnM2ZyMXhiUEtvNURn?=
 =?utf-8?B?QTVKRHdtTXZld2VjQ3NLVzlhWnV4a2R1a3F3SkhuL3FmU0JKQWNJN0MzVlhH?=
 =?utf-8?B?QW5WVGJMaGpYZU8ydVlQY1FuUGMyWWtYYk5uUG5XM3RaNTI3WUJyeU5PRXZs?=
 =?utf-8?B?elRJYm16UXRiNEFIVFA2MVdGdWhWcnAxQmtCdE5VTzRNV2tFRkxoTnJyeDV4?=
 =?utf-8?B?eS9KamdHalNrZVNqbU5ONVpsYThBMjhGWlRJSW1VUkhMRFc3dGZvUEVtcmtO?=
 =?utf-8?B?ZHVtdm56VnM4OU5kWnc2K1o5VUtQcU8vSmovRFdZVVNSZnk4NzY0QitnQTJP?=
 =?utf-8?B?a3pKVDlaZWxqaFRIWnQzYTZmRjNJa2ZQdmR6LytuUjhySWtiVTZpQSttZUZa?=
 =?utf-8?B?eVpUSFlNb0pKMVlreEtscWd6aEdCU043VDJwRXkvZnVIa05oOGFubExudVlE?=
 =?utf-8?B?Qlh2V0FtcWgzUHlkRTE1Y1JPWGN2K05Ybmo2cVNjMXJhcjVCcmtYT3pEdWtQ?=
 =?utf-8?B?aTJzMmNHRWJFV0tMU0tzWkpWNCtLUVdLVDBRTWlFRXp5aVFlMFROT214K0Jp?=
 =?utf-8?B?dlBzekhxWFp3cDI4VEpuWlY4dVhUZThoQVUyZXZkTGZaMkxzWHltcEVUMFdn?=
 =?utf-8?Q?uoW+Ydvf8IBhyfFJhzShKROjZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D388493C5409564591C01C7FA439E3A8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KESETLBCtQFcPbL7s/P004x6lBSpF60YTFnwgNL8sn7IS9sAelZwrWVpQ8EUG/5siMhO84oY+S1g9TF+KZtm/iP3F25sJZSkdisze8Xk+zPADTYQJhK570/bs3Kt5Df++u2gZ39a0MaqaHFQ2aJGfi+Ol+S3OS2wDP7BrKL9RdqaokAxIMFFMaFkXdcqFy8f1iWWSLO9rX/4Xlez2ZcoA1Bu1R9besCk0MkiABE7m9Kw//oD4ZqSVqIpjEyCuZACOI6rFmPMJKUvLLKCEfcxhGT8sERcpUj3IGw8HZJgpoys9SoAYI/zd9SvqF1cRNxc26hzUjxXogAAMPvc1GE52cTwdu6RiXlhZUbse9frFp0MBnHj603FtuerZ+Pbl208RezjDfsGvVnMUdezb5oXmp3mUGNzsAEb+uyEXJ01QsIgyb0QRFMjGgqfpHyWPkEFj3jR0e0a6HUIst+JqdRvR4aC0GS0PwyzLmysvB16vVwqDhzdXLEi6cJrWgPqqI3pFIs3OopbBI3PbIVHykjQwF9WSr4j/WuPmRyOeTJd6gF5vfNg6xhtM58w0jjXMOQUYukQX/e5+va4Et4291/ryB39RDIWgztibX2zuIfNTGjZQLvK1AM6h/FlVNgxI3XuHT2t23laZ27ny3A7os+oKCBN7pA+SLvH31Mi2EsE3Qn+hCPT8U01BBRfT4ggfiaKXHJ8E293DABYLkJeSBkuS+pbf/5CGi77Bwip5H6XhlGUYyYjhjesb75bKIGagICjwOhgxXcEdxZ3OJ8mo77c2L+yjknd4EdZpHP1Xbcypw8dPYNBcgvgJO2Scs7boVmH
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55a9398-1bd6-4ef5-014e-08da7afceadc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 18:19:51.6511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ce5XyDXSTlsZfsFSyVKRQv9I5ch+HZOrfPM86Dzor1+3TyMffBR+ejEOj5PJ46cgwhIB0C364ct1HprPeXXauPPloz42Al4x8teE/Nq6kT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6711

T24gMTUvMDYvMjAyMiAxMToyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdoaWxlLCBhcyBiZWZv
cmUsIHRoaXMgbGV2ZXJhZ2VzIHRoYXQgdGhlIE1hcDYgZW5jb2Rpbmcgc3BhY2UgaXMgYSB2ZXJ5
DQo+IHNwYXJzZSBjbG9uZSBvZiB0aGUgIjBmMzgiIG9uZSwgc3dpdGNoIGFyb3VuZCB0aGUgc2lt
ZF9zaXplIG92ZXJyaWRpbmcNCj4gZm9yIG9wY29kZSAyRC4gVGhpcyB3YXkgbGVzcyBzZXBhcmF0
ZSBvdmVycmlkZXMgYXJlIG5lZWRlZC4NCg0KTWlub3IgZ3JhbW1hciBub3RlOiBmZXdlciwgbm90
IGxlc3MuDQoNCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KDQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4N
Cg==

