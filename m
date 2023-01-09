Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AC3662DB3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 18:53:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473942.734797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEwKe-0004GK-Bc; Mon, 09 Jan 2023 17:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473942.734797; Mon, 09 Jan 2023 17:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEwKe-0004DC-8o; Mon, 09 Jan 2023 17:53:12 +0000
Received: by outflank-mailman (input) for mailman id 473942;
 Mon, 09 Jan 2023 17:53:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPNl=5G=citrix.com=prvs=36677a302=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pEwKc-0004D6-Cu
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 17:53:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78b69883-9046-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 18:53:08 +0100 (CET)
Received: from mail-mw2nam04lp2172.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jan 2023 12:53:05 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5394.namprd03.prod.outlook.com (2603:10b6:208:294::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 17:53:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 17:53:03 +0000
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
X-Inumbo-ID: 78b69883-9046-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673286788;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kgC5ZqTfr1fu+DVV7X2WRGv6Vbzidx9rgyxhFEl4Ccc=;
  b=hTfd++tqjjak7HRcffvGsCB708/NvnighnSknIU+9b5GlDpMcO7R2eMY
   5U1aF2pzevnEkwULE/IXPnSjPJmjbJuiRsFMXc8HSgdFYeLH5FCMonqdP
   l4vFOL6CTrHnhZaOb+kD6ba/B7kTveHcBOo35XtMxomgcjLojy46aIrBp
   0=;
X-IronPort-RemoteIP: 104.47.73.172
X-IronPort-MID: 92216088
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BW2HBanPy56B5i6uARHeWino5gxiJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfC2qOMq3cNjD8Ldpza4nn9U0FusfTyoBjGQVoqCo0RiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkPqgS5A6GzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aQIKxoKVAGnvO2r8OKkeuRRt8oIF+C+aevzulk4pd3YJdAPZMifBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1c3iee3WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDTufhqKY60DV/wEQMDywyd3G0vMOSqXDjae5Wc
 HFT4AYH+P1aGEuDC4OVsweDiHmAsx0HWtsWEPAg7wqNya387AOQB2xCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdptL0EDf03
 juDhDI/mbIIjMgAka68+DjviDu2qp/EZgU8/AnQUySu6QYRWWK+T4mh6Fye6OkaKo+cFgWFp
 CJdxJLY6/0SB5aQkiDLWP8KALyi+/eCNnvbnEJrGJ4isT+q/hZPYLxt3d23H28xWu5sRNMjS
 Ba7Vd95jHOLAEaXUA==
IronPort-HdrOrdr: A9a23:RGwWD6p+XaPBUQS4NcJo5LwaV5oteYIsimQD101hICG9E/bo8f
 xG+c5x6faaslkssR0b9+xoW5PwIk80l6QV3WB5B97LNmSLhILPFvAB0WKI+V3d8kPFh4pg/J
 YlX69iCMDhSXhW5PyKhzVQyuxQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.96,311,1665460800"; 
   d="scan'208";a="92216088"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AG/2JUCQ0GqhD2S+brMhc0rqSXpNscDO3P4gXZCQJXlKKtHFLB2Q+1ROmwMrubvJ+KM6F0tdkdEz34eeT/ahp+FNVtsi01MPkhuLjy5RQ/EWfr3OwBz8V9k4acRatpmcH9JLDnb0opacxPiw0bJBJ6rsyH5l2DPcVKe7maeV4F9XCLHLYkATsVk2owsF63DtenDTeQPBw7/cUtyghReglz+6egdZBheAX7KZx0pDCZva4s+BOtIPX7KC/WWK7aCPC/2o/IUQBCH85BZzZGQ3CqEmA6dhP1Lzwwho/V4z0RQ/HKRd9rjclkQQOfZXfhS0ZNJ7EayWeagjF7+Yh6sJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgC5ZqTfr1fu+DVV7X2WRGv6Vbzidx9rgyxhFEl4Ccc=;
 b=LBna5Lxd+LE8D5yGlRXS72XTW2v2QorV9oBpxBqwfVrgTxmYGFE1DKsbOMlDjW5YiNyWCpCeIBEu7h3x7p0XhfEzBhX37vnN7SqziyCZmu8OLJTwtMOttOP8wkDmQ2TARz2VRXOj0LUq65nXqGp5z6g+tAkbtkpopvrxuOmfpMCsof+29vs4tlS4GbsjPxtDvlW8VwZj0vPL15hu/7kTBq+8gqu1hYxR5st2o219KNy0XmsTBUplhVkbOtR/budYwkQGCI8pmA7jwle65HcRkpRFaqoO5jAdfZZQbjIDRuGL/ABYqDmbcXWDs2Yy8kZ+Zcjf1uukcsKixsEeVbL2Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgC5ZqTfr1fu+DVV7X2WRGv6Vbzidx9rgyxhFEl4Ccc=;
 b=uRinbe7OT1DOIDcki2zlFg0nMI3yPKx06V54usdO5wFlXPzpWT8Uz5LZtspggmUKjOsem9VsFxh5XBpcAR5N7X8+EdigJNi3KPA02Ign/T2wL6F+6iQmBXrwZhigL3y2gfQl5FwHvZnD4e+hdkA28eGo4pv/BK48lXI1263K/ms=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation: add qemu-system-riscv to riscv64.dockerfile
Thread-Topic: [PATCH] automation: add qemu-system-riscv to riscv64.dockerfile
Thread-Index: AQHZJA/Xy2J+QEhgpUWfMMxFgz4kLK6WXk8A
Date: Mon, 9 Jan 2023 17:53:03 +0000
Message-ID: <a089f748-bd2c-a286-935e-78fa6b66a4f9@citrix.com>
References:
 <8badde729e97ef6508204c5229199b7247c7a3da.1673257832.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <8badde729e97ef6508204c5229199b7247c7a3da.1673257832.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5394:EE_
x-ms-office365-filtering-correlation-id: e496bc68-4bed-42af-19f5-08daf26a5ae0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QBMAxYpgf9J58EOfTSfI9i7s5MmEZL4RQjGo2zHZ/D/Yg9PFyjQlPhzFL1urIk0UVaDRjco9R6Z5gKvCJPH3AfE3Ycx1te1WaMSnmUgHn9jagfCrk5RR9I/kyPfvYazJf74MQblnBxGYZpVBVGSm0622kO+uQCL/brTi7Aq7Z4bUrCH4i2UzyfuGPSqdNRRqn2SKoGk61mlvVUnxRbskUcVCqGsSfQU8+bG+sL5lxKUFJs4b1ejiMiqLGg7EaOoNiMQ1iraViHhhsbF9Hi97xP7HhChaFzrsALoeHRpjgPL5Dx5aUoFHWbwpjbZROSCXOKAWXe7MaXPfHj+YRdT25R0dRDrroKiqxNiiRbq5R34UqpzqwHgPaMWU63Rp9/yddDe2d4y2QBF33xCoIloHvWJqC+Rc0pkMfOHE8ytGIPof099cvoui/I0Y2ubpr9cI6sn6o2hMgDrvNJdXtoJJXOJdvxvtN0pHX/zxbjk9yFWjHWIsj19ncjGTEx9qagjz5fJkJKmXpUbpnkR0Ifv0DmxTvQqO5Oq/r3OwkKWOv5783vFyPlpn2ikynwpoKtICYpFD4VJE9TQM9MQGDgfAvIopJCvi+wTzAk+PDzw5U8+nqRsm2mQCjkq0wokey41ZaQDfXpS2Br2jgem/fhoH4suG8qvuEAEsVEe71j5liTMF9oBTb7RLE6Yc7MPz2KIUPMNOug0l9I/W+4SSinLfWwPlNdvCuupOG8bblsPCycRJs1fwJe3x2d4Ux83YxVXu1nDcS85VMUjnnxAACa97/Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199015)(66446008)(76116006)(4326008)(8676002)(66556008)(66476007)(66946007)(316002)(64756008)(91956017)(54906003)(110136005)(4744005)(38070700005)(71200400001)(2906002)(5660300002)(8936002)(41300700001)(86362001)(478600001)(31696002)(6486002)(53546011)(82960400001)(6506007)(122000001)(2616005)(26005)(38100700002)(186003)(31686004)(6512007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3IzdE16ZVdVOGhVZ3hDSjlXVVRCSVpnUE1Ra0xjNGV2d08xSDZrZngvM1Rq?=
 =?utf-8?B?TGRETUZ1YkNWb2Mvb2dKZ3pObmNIcW1MMTROWG5EYW5mNllXYzJmSkhveWJB?=
 =?utf-8?B?QWpEOVYwc0lZSHh3Qi9ydEFadExnbmEvWFFFcERoU250OXlHaitzYVVZK2Ew?=
 =?utf-8?B?dDdoMDVVMENSMG1oajlYYWtKMitpQU9xK0xQZlN5M1MvODJab0gyN0NVM2Nl?=
 =?utf-8?B?cjVOMVhHd3JDYVRvbHBES0FuQzdHN01kU3AxUXZtKzZwZEdzRW5WR1RQUzl0?=
 =?utf-8?B?QldhUE1pVW5pNGlLemdmUDRVdkN6YkI4Mzl6c2h1T24walkxdHAvQWY2VExR?=
 =?utf-8?B?aExRSS9RREV5RGZqR1VhRWJSbzMzTnA2SExmRFBsanpHcS9iRFYxWXJvMHkw?=
 =?utf-8?B?TXA5ZWgxMDN3SVovcmhVWjJBazRoK2YxZzNrYWNtbnJGSW1NQThtT3Y0cndk?=
 =?utf-8?B?MnNPdmZqeWhpL3dMa2hBVW82TGNxanJuSnFtU1NMblNJVWVLd3JwaCtPdlFR?=
 =?utf-8?B?RVR2WUNxU0VKcGFjMDNTMUEvamZISDBwN1lsQ1UvQXppYy9ocXFON2RZZnRM?=
 =?utf-8?B?THNDR21Pb3ZONlZ5MWdCWEF2NnIyWFViQSt5YnJYMk5XMVJudzRFSDdHZHZN?=
 =?utf-8?B?NXk1bnlHUWlhdXRGQ0x5UGFvbTZTWmdhaGxhZzhuOVFXaEJCK1dDa3J3QXFS?=
 =?utf-8?B?UmJ2a2tDbC9PUmM1bnovY0dyS3Vmdk11bDhUUTNoNWhONWN6eFMrK1k3dVpL?=
 =?utf-8?B?REo2dFl0dzkrbWRvZWtOaG5OYk9KZ3o5NU8yT2hFb0d2aVQ4THcrTW8vZXFU?=
 =?utf-8?B?OXdUU1F6aTBVMm43c0RDYW93NHBMTXQxZ0RmYXdBWlJLU08rdnRzeFEwZ0l4?=
 =?utf-8?B?MkF6ZHVocXp0aThPaExOK3oreUR6VHpMbnVzWmtHdUI5dGcvVkROSmxpQXVO?=
 =?utf-8?B?MHBWb1o4anFBS2g1YzF1K2ZHMk40ZkQ4TDFrMllMUzIycTVPeXI4bFF4T2lu?=
 =?utf-8?B?NDlpZTB5bWc1QXY4cVYvcm0zdXlxV2dUemdobHNXY0lMbjdYcWN4YnZIa0N0?=
 =?utf-8?B?aVNyQ2NUWHdOQld5QXhaSlBFaEo1Y2FEQlJnaGlkejlYTHRKeU4xcXNpbVcv?=
 =?utf-8?B?cC9tRmFmdTZ5RHlRUEx5d2luYmF1QmtDVW9qT2hRS1Y1L1RxZXhyd3ZqOFBp?=
 =?utf-8?B?MjJINnJMYlBSZUZPVUNkU0N1emhZeEhlSTlMdmdKekZDSVJob0FDRDRvK1I0?=
 =?utf-8?B?eGQvYWpZRlZBYjlDMGdvU1FORWtYNExveXljV2RDN3VDZHZpcnpXaXFZYnNs?=
 =?utf-8?B?U1FaUXBHbFZueEtYeUxxMDQxbFJLQWNrNE9HNk9LSXdBQUgzWFJDV2Q2VHBY?=
 =?utf-8?B?ZlR5R2N4dGdNeWtFbWVMeU5GMmlNYzgyWnpoeEcxOVBtUDdRbEhpazVlMXkx?=
 =?utf-8?B?R01IN2w2YzRZaXNsVUFWSXRvQUVmRzYwRGRZRnpjUTJwT0VKcTFNc2JhaFR0?=
 =?utf-8?B?eUk5MmxwbWtBMlM3dmZiZGVDWEU4d1Q2OXVuOGtORTVyR200UStHcGtnbS8y?=
 =?utf-8?B?WnZaNjJnZFliclRyK0t4dEhXd2VvOUpRZWY0eWpXcWcwa0ZjV0NXZmpGMUpJ?=
 =?utf-8?B?NmthR2hTcW9ZV3JqZjRMTGQ2VlhsWjQ0ZTlOSy9vTXA3RHJ5TWZhZXdHa3lC?=
 =?utf-8?B?N2tpcUREMlZZUTlyMWZ6VEdhTi9FOUZYbXpWWVlSc0xHQVQ0bTB3cFpvQ0Jy?=
 =?utf-8?B?Qm4xcDc2dVBFcE1rR21kTVo1RzJkV2RRa3NvSEozTTY3cEc3WnNSc09GVUpt?=
 =?utf-8?B?cS9XT0tSS1FFMjBlWXJ5eWVvRjg5bDN0bnhiZDVkTEVtd2xENTFzWjFNTmVI?=
 =?utf-8?B?bit1VGdia3EwMEFjVWtIMGlvZkdURlJHeDM3aDdhMFlmTlFvaEJjbnFxU01K?=
 =?utf-8?B?QVJQK0huaHBnU2syQTFKRkdtYW9OSVhISkRyc2Fad0ROeDBYeXVsOGtzK1JJ?=
 =?utf-8?B?U1FKeWo0K3o0T1NyeVlLTTVwbC9jN3owK2ZxdGUrY0NsMUZNMExpczFxQ2s0?=
 =?utf-8?B?Ylh0VTZNN3V1TGt5bURXQytCOC9nb3k0NUV5U0dxMjNDZEM0MVZteGFTd0FY?=
 =?utf-8?Q?HDq48pq+mtuu/SNEjjdwgehCJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4AD1B6A81B17D4E9955E33ADC59B5E8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XZMxGzQI8NQmnK7LwzxCUwK5q59Ql30oorCKVjbi9alsm6Qvy/Rzx7jCtSqEIy2oLSIXsi++9U0BAlaq2oi6WIJ4Gbok1p/M+BJ90s10bZ5qPNMs/2O48Ak/OZdMFJwXClfKazrKVwCFfKcsQaef5oyjgYMBtSiF2WxjrWtBjgEgARw9TLU70+UOEvs0eo+2uCEc1W+EAuUkmS/tqRt/KYy4gSS6vQUvb9VsjCyS7t1HmO/wHGM/FrE5Fj08ce+9W4OScEyUI517ol0Ca/+aTZOkxL5wedpitICBhqkRIToL1XDHgxnZ6JihHRk8C2cfsgPZeIWNUtmLdrM9vWRAn5Q3v5GqbG/5GReOLapIlA2LGylOTvXNiTtFjOO24Xjd42fvoOwHVjtUFzyMvk6L+AJmV70Buycrz62uT/sDAz26/3X8Jam9Afb01SKrV13Y8epCi6c4tCv5wtbdIvNGT5ysU+FHfAC62e1hAJT67JOjuf0a6e/B0g9snpB9rdjAFjbuGyO3WSVQZpyvQxB7yBZoyK4VWWhUOoAso4lv8AHNN53fBu14F/hpYopRs0ZAA4fPzDtOJ8Yc1wBSU+RETaWbDQHlwh5rdXCcZA7f8E4vnk3jh7ahP5G64gddV9+hJWRWc+FLMkvOKSXw9R723vyU+t9zWhOmRVB8gtEd1WfO4a3yiu4AlND6w6s1e4PFCvTYApdHylXa+OdCxZyMFmJgiRD58hFUCqW6WFwN7od4r9F7bkFTLfn4WnA6UAGDncUTGb5Qoh+AxneQUM3/eKbbEpxUcAr/nAFYvjSIvDe8amqWS7sEz8qZfc4N2pUOQVUjxBKozBbBlC34wA7KAETvqg0MZEQgcqkxYU0iTGngMR8x7c981XXnRzi6emGlrN7ehm5V7C6FumLPH5QrPg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e496bc68-4bed-42af-19f5-08daf26a5ae0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 17:53:03.0969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IJTDlVSU1dmV9OslntvwEtTWD/1etGH0ydN5M9AKkj2dUTaKl1eBqWtb3ihtvlmliS7pnMSCyAMjGss++TVs7Y780CncQ6JmY1AuL6btrJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5394

T24gMDkvMDEvMjAyMyA5OjUwIGFtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBxZW11LXN5
c3RlbS1yaXNjdiB3aWxsIGJlIHVzZWQgdG8gcnVuIFJJU0MtViBYZW4gYmluYXJ5IGFuZA0KPiBn
YXRoZXIgbG9ncyBmb3Igc21va2UgdGVzdHMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWkg
S3Vyb2Noa28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPg0KDQpJJ3ZlIGNvbW1pdHRlZCB0
aGlzLCBhbmQgcmVidWlsdCB0aGUgY29udGFpbmVyLsKgIFN1YnNlcXVlbnQgR2l0bGFiLUNJDQpy
dW5zIHNob3VsZCBiZSBhYmxlIHRvIHJ1biB0aGUgUklTQy1WIHNtb2tlIHRlc3RzLg0KDQp+QW5k
cmV3DQo=

