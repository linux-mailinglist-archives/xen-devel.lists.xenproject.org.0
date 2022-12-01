Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED9263F21F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 14:58:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450744.708168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0k4V-0003NK-Um; Thu, 01 Dec 2022 13:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450744.708168; Thu, 01 Dec 2022 13:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0k4V-0003KV-RQ; Thu, 01 Dec 2022 13:57:51 +0000
Received: by outflank-mailman (input) for mailman id 450744;
 Thu, 01 Dec 2022 13:57:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/wf=37=citrix.com=prvs=32775c42f=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1p0k4U-0003KJ-2K
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 13:57:50 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 224a04e7-7180-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 14:57:48 +0100 (CET)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 08:57:45 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 DM6PR03MB5177.namprd03.prod.outlook.com (2603:10b6:5:22b::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Thu, 1 Dec 2022 13:57:43 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 13:57:43 +0000
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
X-Inumbo-ID: 224a04e7-7180-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669903068;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RV+JNU/gHzSJQQ+0iMhkngH7g2i4uOA0QTyuuV6BWzs=;
  b=hpkhgWSO8LXBcwxmtH640r3PtjXk1yygCf8kvJABb3djj0jLPRdjmW7m
   Qtd9Q8sYglL81vAXIlUFFlBRjU3wbHrfm6PU4IGJhqVEeMLs5q+QtFl4Q
   kxwZ8dLOeC1ZCoOBVVL6qFRD57GfGtERdEy5BjiZc98lvuRgyZi3c1Myh
   s=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 86056998
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:D6GliKD6d1zUnBVW/wviw5YqxClBgxIJ4kV8jS/XYbTApDpzgWZUy
 zNNXDqDOPnZYzOjKN1wPI21pxwC65PQy983QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlA5wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxt5sUUte/
 60kOikfaDHS2sK8kKicc7w57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvTm7IA9ZidABNPLeesaLXtlUl0Deo
 mPA82X2KhobKMae2XyO9XfEaurnzX2jBdxDRe3QGvhCnFae3U4DCAIqU16ZuP3n2mibUP9cA
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQNAvqsIeXzEh0
 V6N2dTzClRHr7m9WX+bsLCOoluP1TM9KGYDYWoISFUD6ty6+YUr1EuRH5BkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:jJN0MaBaAE/1whPlHem755DYdb4zR+YMi2TDsHoQdfU1SK2lfq
 WV954mPHDP+VQssQ4b6LW90cW7LE80lqQa3WByB8bAYOCOggLBEGgI1+TfKlPbdxEW/9QtsZ
 tdTw==
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="86056998"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBAW0UWiYBPGkkjJVMo+lfBc9jA4LSLLFjDxNArSFkXFoZBS7B86Wkl8Rn6wBD1LJ9itQCc/zdqNkYNN2JDgfOVz5OF1bs75npJXwu4PYw1jL6zjS6PLUx20mBgB2L6SK5CvNER7864YqvWUo89ZPVXv1NPjiHvTdNd2r/SpgKPStJ7z7bw14KdN9jqDOSbsQfXLS6gTLpi631VZD09e7Mg/PiWi5XxBof/v2rRgw1NAMhCC2KdZ3f4wRxhJzlqRnqL6IsQmepgPAIdWogQUcYsKp91bL75c8wcKDisvyMZg8xHuNWWRvyQccWRYUf93CR3CzXITumFDOAsQ1ubNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RV+JNU/gHzSJQQ+0iMhkngH7g2i4uOA0QTyuuV6BWzs=;
 b=h54ZLyv6HeYIRM6ASaX6JYmMVWNuBxb7ztrKRiule56X/LRlwMYjJACelXKFEZBj33UebUH5p85GXz9dazPzAosAX/lIe5y/5o51X0l44hkwc642dJlw5X1Hd3gsWNrguJM5vKBUO4b/zYynSM8bDTlw/JYMFEKOK6JB1EqTFLRTmock4IMFpKhhwHkNf2XS4iVF+mVA2MWZCQ6q8qjDF5kru5m7RzifO33Lv8MNvirAzeXXohkgW447Z964S5a+BBlYq3nlwmesHO5L2jywZIYgopllHojcRQuO+QH7EslABOnvbTfHcQjhRbAdJt0RhFCPU0cc35/EstKOqAxiOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RV+JNU/gHzSJQQ+0iMhkngH7g2i4uOA0QTyuuV6BWzs=;
 b=kRRwibrpP7kwKu33r3q3SSzh/IF9/t8u85yU62hFKo62GT5wtUCIM43VQ/BhwbFDE8Rd949P76SaUch8GB80//wcnbDdj0qjRX9qiunZu+PfwUfZctMEBsr+Fxbe/cYExJ5mjxWgaLLHgeIrF8dxW+dU44nonFaM1M0xKjDE248=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, David
 Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v1 3/5] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Topic: [PATCH v1 3/5] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Index: AQHZBOHXzyNRueXKzkCvv/VJ69wZtK5Y7MWAgAAhHACAAAIeAA==
Date: Thu, 1 Dec 2022 13:57:43 +0000
Message-ID: <08D59C99-A8F8-44B1-A081-FFB0CCA8A8C5@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <63240681327af995df64b773945406b097a31d4b.1669829264.git.edvin.torok@citrix.com>
 <4ba26b93-a7b0-ee6d-f71f-6e0d78314697@citrix.com>
 <A1F15A81-492C-42AF-B11E-43EFE3FF8BB3@citrix.com>
In-Reply-To: <A1F15A81-492C-42AF-B11E-43EFE3FF8BB3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|DM6PR03MB5177:EE_
x-ms-office365-filtering-correlation-id: da7a5c93-3b8f-4b1f-d4ba-08dad3a404d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FFoOKtWxitzWU6QcefID/2GXzbfrxFExdXuIkzUTOvyv/WDGCZEeYeKRGnP1eVkFAkVQU829XOWpfm156r1cXXS5VUq0J2IJeaovS5MgjD83ncIhQWe9juAny/k4deKgemmBlYJm4FzHO+DD+OdMDgOEht9635qLPwmHNBU8NDyLlIE8JpCzEhqiW5P8z5XzTjMsTMCcVT+/Z0DM3D3FzLFqydHYEbtZoxmLEXZfIfAzfxrEK+pjm8Xmj9cTb846NWQQAOGY9vC7kNyBUmrUBJnz0aTbrd7QgswLsBi15lrs1AAY/+3Cc75Nu8wJccp1nK2zzV2lQUr2ECzalGRKlq2kEU/OhseZsVptUj2COsirP6ILevp5HHMCgj0ag7oEInRWORmengTjWqLArOxdQJv8pt8t1Yz+d+m5exnXRVtYgY09eyguLG81oXXj+x+WhkRc04XGXBtBaKviwIeUBnC4JLCdiTHgKdNOYbQCRKTHKEKW8BhapMr8PFhNpuqUVFmrzNpON1mmRO1BueRyw28tZl7lYPXPy0QWmOs6wLMuFJnkl3SQmTYDPzMJvRtxOyP70Ar6cCKRekEdXefsbWIr39Vj5p6R23cwM1b8s5CuuE8yGN6P4T82HPvMesCSjlrdtxaZfw/Sr42jxrblOgi2SUBcn2IPUUzCIQvI31vr96Le7Gcabl4oAUZPKuB0mHWB/s+Vktn7S7z3TXE+UZwnk9y6k728xaFyfBkMKvdHckWXTCLqM/88aLfJ+z+8SNkGsFBerimlnehgImwHMQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199015)(2906002)(478600001)(316002)(76116006)(36756003)(71200400001)(6486002)(6636002)(91956017)(54906003)(26005)(83380400001)(53546011)(122000001)(82960400001)(38100700002)(107886003)(38070700005)(6512007)(2616005)(6506007)(966005)(37006003)(66946007)(86362001)(186003)(33656002)(44832011)(6862004)(4744005)(5660300002)(8676002)(8936002)(41300700001)(4326008)(66446008)(66476007)(66556008)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2ZTUC9WQ3NrKytkekFyL0wxMWc5NzFFMnkybDVKd3piOVFZRGZrT3l5bW5J?=
 =?utf-8?B?cjVkRTlnaFlUYmYrMjNVWXpWTTZ4WldIT2d5Q3RhdUNkdnJNT25HYVZyaTF4?=
 =?utf-8?B?MFJQQXdZQy9jaXJrclh5ZnZGZUU3R2QvTEt2MVQ0c2RqWWVlNjRTRGFIOWdC?=
 =?utf-8?B?QmlraFhUWG1od3pDSUJmMlgvTHZvMTRxbk41d2Vscy9nVzNFVGgxaFZrUjll?=
 =?utf-8?B?eHozc3VWcUxaNldBcEd2OWtSSDIvNHp1bVI0YWNtMldvUUYzTE5TUDJGWjA0?=
 =?utf-8?B?N1lsWFcwdmtnN3d6cFlmYXhkaFIySTVkczlYanJwQnk5S01McDVUQnhWY2lJ?=
 =?utf-8?B?b1lRT0JscWJEQ1lnOExleGdiTW91SHc3L1NwOWIvSE0weFZudnZNcGlWejll?=
 =?utf-8?B?a0kySjJwOHNRenQ3QmJMa1lRR2lqZEd5eGk4cERmKzY0S1FqdG4yRmVJOTZk?=
 =?utf-8?B?WWFTbnpIY3Zxc3hkR3BBb1pmemdNYXpyUHJ2eHcreC95MC9nUkxXcHBsbFl2?=
 =?utf-8?B?QmJBQzJTaUdxZ1VHZ25HbUE2akw3MlRzSHJHMHROWEx2a0xIN3JDR0hyVFR4?=
 =?utf-8?B?Yk1aWnBST0psTUFscEZaZXd5VnUxK1RWMGpncTNBU1BJWUJTczQyVzVPK0k0?=
 =?utf-8?B?ZzE2aklnd09jWnRNZTZoeTJydXk0RXJnRFp2ZkZMNVJUNlczKzh1T0Y0R3Zx?=
 =?utf-8?B?MldFdVZDejVPZTBSNnFaZmxIVm9yMWdQR1ZSZk5CREM3QzN1SkpSR0FIMUNT?=
 =?utf-8?B?cUJDdmFIcW80aDhVTnJMc1d2eWpQM0VSbHNDbkhJUDhhdlhmdTVYeEtCekMv?=
 =?utf-8?B?bjRCWlNIME5FcXhMN1hlQkNkUFNJOFg5OFYzQ0JZOVB3MDcwNytGWVdpNThh?=
 =?utf-8?B?OVNkSTZrTElOOVFnM3AwUjg5QkU1d29rbzFwTGx5MlhuczdmT3ozc3dDb0l4?=
 =?utf-8?B?WkhoSFpZRVNoY2Qrc1A3MVp0OW4wUzYzTkRuMEVZTURuS243bk5ab2owanVL?=
 =?utf-8?B?NlNua0ZPYVdkZUd4SU1iS0xLWkFNY08wUHQ5Vmo5L0VoY1YxaklnNEhtQVBH?=
 =?utf-8?B?MTlaRjBWR3krdUxFQ0VLV0x6LzBKSldIQkhTYndqQ214eWdUcDFyRDhBRUpS?=
 =?utf-8?B?VVZKdWxWak1CYktSZCsvaDF4ZUN4b3BBYTRvWWdMTUFLQWQzbUttU2h3ZUdO?=
 =?utf-8?B?bmsrSFlFcTFiMEczM0l2TzVQMTJZWWdac0FBNzNiR0JQdFIvTm9tMWxoODJS?=
 =?utf-8?B?am9ObEtrd3QwaDExMzBzbHd4Y1MrVWRFNEhSTFRMYi95VU1YRGZ6L1ExZFgv?=
 =?utf-8?B?citRQkUwSVNIeWlGNDNwbjhHY3BJSk5HSlNIRk5ZNnE1cnhnK08vZ1g4VTNB?=
 =?utf-8?B?TW93cmNkU1JoclgweDUxdng4TE53ZXF4Y2c4T1hGUEQvZ2VDbUoyTnJCdHJi?=
 =?utf-8?B?SGM4T3JCQ1l3VUp1NmpYdDVMWk1vN1VkQnpZL1IzdnhKTUpnTEs4NC9wTUF2?=
 =?utf-8?B?bUVLeGppN21EVnQ1WVN6Z05ZUjd0c1R4c0w3ODUyWkhkVHdxWjc2MlBCMTd2?=
 =?utf-8?B?VHBlMWp2T0JNNzlLZlpGSEl2Ui9KcExHdUNiSTd2cU9QWkdDUlVRTTFzQlNW?=
 =?utf-8?B?SGNtSjFJb3k3T2ZHNTBmZVF6bjlKb2Q4SkxDakFkUU03SU80b2hiWmdIZll1?=
 =?utf-8?B?RmpJL1cwUk9rSXdVMTZ1YXIyRkF5WExuRkZtdEJyWjM4eWprcG8rMG81ZFRN?=
 =?utf-8?B?WFlGbGJ0eXhBYmdOYW8yNVpZTDFKRy9xOTBBSTZ0alVhcjV0OXdKN2dFdTc2?=
 =?utf-8?B?MWlTc3QySSs1cTZseFhBOGw2S0pZUDNJWTluRkVQUHZhMk9CNEVlaWhRNjR4?=
 =?utf-8?B?ZlhuZ3BwbzJvcGFTZ0FXaFFoYWtVTTM0bFRJMndyUnJsMFVyR0xEQy9TUWZ0?=
 =?utf-8?B?SDZlaEY1TTJoRC82anRZWEtFUlJNZzFJbGMvTmhLVmJQRnAxMldwT21adDJi?=
 =?utf-8?B?QjY1RkhmRThYMDRyTjlDdHRObjEyRnJabmtGai9SdlVhc3NjUE5lN3RWSkR1?=
 =?utf-8?B?cWJjYzYyUzlObUdhM0ZXSG12ZWZWc203Ny9JQVJQdXNsYnNNTmVUeVh2T0Vq?=
 =?utf-8?B?RFNkTHFRUFpueVk2dVRWQjk1SFRsWldNSEphMFhabnU1d3BSSE16YlFyU0x5?=
 =?utf-8?Q?nH1ivk/XzmmCfmRNLFTuUzk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C1F88AF7B9A8E4995C350806F706D8A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uI1PJKIgjw3CJAOZGbw298hFlI2oFGjxkr7oka8YnvNOxpUstMUh/NHq5MSn9KHZDh6J48dxpBZwTNmwNYg9Y93bhTVDk99K7U6adQBQAA6ECb3t0AQ9CCFeetpRqJNWWTDcnsIOaJVU/rSx3t43YjsVfF+a1dU4I/HggJLKnborHIx91+ZnRdPEdzj1dqoNeQS2CR6LD7XO4Yl2mwJ8CPX9gGspH8ffEdlQdZ1T2wZtVYvOfwWuSI0l7QYHUJBNhNojDA0Ox1PCQW/Gsd+dNA5PKIrc7zuTQUzBEwQchj8zUmayEVOeOz8yF0zLnV08UsDiABlWtptQ5P0AVmsyvPb+mDE83MruZZg2y2wHdS52KAn4f8wiyOEycAIgFwhFTMW583TEXZvHoi5kp9fCoFsbFqheGlxVwaafU3F4tb4Aa7M90mRM3Oc0xYE5MrpE91zeTPc/zPDScuNgcrsfixPVpgZVANLsEF9LUhucVfqKAukP8/ZepVEl1iLB2H15vflJ0VxGGXD34MAg9AQlhw9NS2mdZQWfQajmY6/nu1KdOnzbH3NhtUPtPmDGRCPcX6wNOYJ+eSQh0IroqrCsapE0CPidfVGCPfw7e/GUiHADBNADQRbv4skJAyxEuRwRdUUIFYUnpLqZVERXlw4KeC8Ts+QWzERpLY1eiuNI2G7ZZk4zIDlHflFygEkB+RnSJ9pTMwsFk16op2o5mPRB24cfHKUxzq7U4PUkV2E0MgFKwgsCSgHBIK+jZLqa0pQsJLwXRXI0WRCK6LumsK1gt7IpJpyl7jJyeoP3WgQdy+Yguba+ItAX+Z7QlFBoVlS/d3d3n4aVgw7rsL3HUl/dTQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da7a5c93-3b8f-4b1f-d4ba-08dad3a404d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 13:57:43.4769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: di0s218I1dBAEp56grI/W6uYTAKeM1no/pLey/nPXckZLkfXGWoCl2z/9fGtiwi43cU0fTG/vl0wyfHh85ToKXEK6pfp48S7CtgYx7W4Fhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5177

DQoNCj4gT24gMSBEZWMgMjAyMiwgYXQgMTM6NTAsIEVkd2luIFRvcm9rIDxlZHZpbi50b3Jva0Bj
aXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFNob3VsZCB3ZSBpbnN0ZWFkIHN3aXRjaCB0byB1c2lu
ZyBjdHlwZXMgdG8gZ2VuZXJhdGUgdGhlc2UgY29uc3RhbnRzPw0KDQpJIHdvdWxkIG5vdCBhZHZv
Y2F0ZSB0aGlzLiBDdHlwZXMgaXMgdGhlIGtpbmQgb2YgbWV0YSBwcm9ncmFtbWluZyB0aGF0IGlz
IGdyZWF0IHdoZW4gaXQgd29ya3MgYnV0IGhlbGwgaWYgaXQgZG9lcyBub3QgYW5kIGl0IGFkZHMg
bW9yZSBkZXBlbmRlbmNpZXMuIA0KDQpJIGp1c3QgaGFkIGEgZGlzY3Vzc2lvbiB3aXRoIEFuZHJl
dyBhYm91dCBvdGhlciB0cmlja3MgaG93IHRvIGJyaW5nIEMgY29uc3RhbnRzIHRvIHRoZSBNTCBz
aWRlIGluIG9yZGVyIHRvIGRlY291cGxlIHRoZW0uIEnigJltIHVzaW5nIGl0IGluIG15IFBvbGx5
IGxpYnJhcnkgLSBpdCBtaWdodCBub3QgYmUgdGhlIHNvbHV0aW9uIGZvciBYZW4gYnV0IHdvcnRo
IGtub3dpbmcuDQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9saW5kaWcvcG9sbHkvYmxvYi9tYXN0ZXIv
bGliL3BvbGx5X3N0dWJzLmMjTDIzLUwzOQ0KDQrigJQgQw==

