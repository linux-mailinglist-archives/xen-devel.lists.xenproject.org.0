Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3BB50BAA9
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 16:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311035.528015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhueP-000231-Be; Fri, 22 Apr 2022 14:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311035.528015; Fri, 22 Apr 2022 14:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhueP-000209-7p; Fri, 22 Apr 2022 14:52:49 +0000
Received: by outflank-mailman (input) for mailman id 311035;
 Fri, 22 Apr 2022 14:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+xj=VA=citrix.com=prvs=1042e1a12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhueN-000203-MR
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 14:52:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de477ece-c24b-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 16:52:46 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Apr 2022 10:52:39 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6151.namprd03.prod.outlook.com (2603:10b6:208:315::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 22 Apr
 2022 14:52:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 14:52:37 +0000
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
X-Inumbo-ID: de477ece-c24b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650639166;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bUjaUQsZ4QqG07Za/uRxFd4B76IfSDF4tXRoDPFEuYE=;
  b=ZSZmIOx9Z7+zrSBJAbgnbDVyht+5UW6de3bwGu1UIITOK+2OJLdC3O9L
   T1+GD8eqSs/FMgCfRwTuw4Vug7vZAkyLHa4F4RlC2WIciVIXJVOw5nU6W
   8rCcNK/JhlLut1nRk8O0oTjnu9KhoUnwERNNxtIWOdOdBKC024RnVQkSM
   o=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 70114302
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kGRe/K0hcC82YFxrqvbD5aNwkn2cJEfYwER7XKvMYLTBsI5bpzIFy
 TcaW27Qa62MMzfyL4x0bY+w9UIF6p6BmoVqGwc6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIy24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1EtI26EhksEpbiwucvWihFSTpSIPNvreqvzXiX6aR/zmXgWl61mrBCKR9zOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82cBfyVu7e03x9p7ixKNd/Ya
 9AUdnxEaxPYbgcUElwWFIg/jKGjgXyXnzhw9wrM/PZsuzK7IApZgeDEbOuJR5+2T8BOhB+Aj
 Ebk+m3rO0RPXDCY4X/fmp62vcfNkjn8Q5k6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVQBmQsHOC+BkGVLJt//YS7QiMzu/Y5lifD21dFzpZMoV56okxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLSvbdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:qhxUs6wIHMCwDzNJ8Ji1KrPxdegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMUs1MSZLXPbUQyTXc5fBOrZsnDd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadv/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZfbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESutu/oXvUiZ1SxhkFwnAid0idsrD
 AKmWZnAy1H0QKVQohym2q15+Cv6kd315ao8y7kvZKqm72EeNt9MbsBuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGbf2RYUh27D3xnklWavo3RiKmrwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJhXcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3cE7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rep2G9D2MRGAtBjWu7FjDsJCy8zBrZLQQF6+YUFrlde8qPMCBcCeU+
 qvOfttcoreEVc=
X-IronPort-AV: E=Sophos;i="5.90,282,1643691600"; 
   d="scan'208";a="70114302"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAhmuYcPYZSn+mXEindtgIYP7MrH4tcABcZkS6tyEZyyU/u/KPXUHsJ21ZXY8OtTbTSUIiJ7CIi9n4IqXZCYmdMkvZobFu/DH8AazfpSgf9yqhOYivjYtikvrAtrUqcUWFtnS7VEt+1M4HhhjY9A3J1bk+lYWQ1aJytUXm51pwfxIGs5QFDn5hY4diLhOptUfO/p2JZTb75Oazwxf+thn2mt4vuYpsGYCUdJCLIjxIKwPM8a2hN1RYZShaBF1dMQZ1Sq9DAKl6t3KlarJSN73bxOd1QCaZM8RepnLFbWBvkf3WXS7PHNO/JRxc1auIlEmdnJBSwBL8DbpX0UiRh03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUjaUQsZ4QqG07Za/uRxFd4B76IfSDF4tXRoDPFEuYE=;
 b=OJsRXJz5ABuuMQf+FsdyavC2EQ5I0EPOx94I7lTo5HYHIgg2T3mU+fN2nv6ntBZLIwLvzvep3sQ+nudV6lAyfg1ChGyAtuYN64ytpc6edV0PtvK90zRVSRBt8PdDLQkjD3V1nKxkQB/STy1uEORvm/kdD7Lxz8Z1egzY5GO2Co4dSnoKdL9PFRzjUFztA2lHa2ReRbPpolznF4+atPVNZcJJgJ3oXdvwUzkAZDOSEzLJyUPvIGTPChLmHgfOAErcYAV+QxGSCtVEgcZ3Cmk+3cFoxtOV4/ae61zJzKgDbLUW4VHCQJRrAyRiPahyQoBpBLF13kEOz45F6y+rgO5xZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUjaUQsZ4QqG07Za/uRxFd4B76IfSDF4tXRoDPFEuYE=;
 b=pqFt7BBCoOzXhTGcgFCKAGB32/BOBXlBqMZx4r9Jv0c0nOYK+RLQjRPZTqrg1/aE0CEsxL8SIlMK9FSWjlIh298ct9B5OvrarhmWT5APm+0rrhZCajXKk3pHofQ0GY//e4LTULy5ijVVJCzpWi//wDSwfg3Dsy6hXCCCHNKYIHY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 4/4] tools/libs/light: don't set errno to a negative value
Thread-Topic: [PATCH 4/4] tools/libs/light: don't set errno to a negative
 value
Thread-Index: AQHYVIin9iN+mLKty0OtvWT3B8JHOKz8CCWA
Date: Fri, 22 Apr 2022 14:52:37 +0000
Message-ID: <f2d73d68-b313-0f5b-7a42-ad6bef7f5620@citrix.com>
References: <20220420073119.16974-1-jgross@suse.com>
 <20220420073119.16974-5-jgross@suse.com>
In-Reply-To: <20220420073119.16974-5-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3def8e7a-f819-4f00-0b99-08da246fbe06
x-ms-traffictypediagnostic: BL1PR03MB6151:EE_
x-microsoft-antispam-prvs:
 <BL1PR03MB6151FE3D73704743AE384A5BBAF79@BL1PR03MB6151.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 J1DIAC9NOZ8ohS533XgBLkWRyOdvX35E5iiz/rz487d/Tvb5lGpMmZhx/9AQRhqQ4iRMogumd5GS8isqZNL6stS6zFHP7QEp7t0Yh1UIApNxaZMS919ycLkyTlmRwYv7358PjnxHAVLT4hONCQkWj1zCOl2HWmvFmHcmEJeO9kq2jgxJ+rhZ9sjADnqT1H+lsSI02IP/LRDLOIGQ7iPw7fDK5ksI+pKMPVl+K9qhOK6QisES/1A26tNTtigjUD+95ZcE8aDpAvs12dJ+asdWfr9WzF2JDIO0MlG1P72kzi5SVv/10yt+nNOfKxYWZGNuYzbI60e4/WAPkQ0plh9c1VQjQ9TyFbT9WtyBI16yKMfSHAnsXzz9SxwXSJubayfmJQ3KwMgSRMePcPc9pThWeZa+T/4x7ammU/t+TLFDHOHxLn3tdf52dxZGmUMF0nd3s1fR4jm+7NFsNgJ4VEL93uYb5pQ4bLsjEQ53JcxERxIrtMwENekFEkBl3lgYLMhuanNKmO/BmjMsWXnyYk1eiuMDPcNjuwikFdkADpmqUiS0kZmm16VGX4bSJ2hOajsyuYf7j7m3e8QZCFNzx+DJiedA/Ir8HnTJTTl1hkWvVfMsYq2b10LNuXlRVUO6mZqepzfuBpbWTejbrXeOjMMSJaOx6HquznEyN34tkTmGt3jA/9eGVUJcRMcI2IM7sFv9GYooDRM6EIra06fLm9JZ2QunMraAI2vxW2+p8etxStFhq/aoc5ffDhtHtL93DLg+TASuwkmABWSgP/sXl/mCog==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(5660300002)(38100700002)(2906002)(31696002)(316002)(91956017)(107886003)(53546011)(8936002)(76116006)(8676002)(66476007)(38070700005)(66556008)(66446008)(64756008)(4326008)(122000001)(82960400001)(66946007)(2616005)(6512007)(26005)(186003)(6506007)(71200400001)(54906003)(110136005)(508600001)(6486002)(558084003)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXpwTG1OUndvbitVeHg3YW9LdklnRmZSeFZGejVodXFPQnd3SFZPaWhFMGJv?=
 =?utf-8?B?bGZ6Szd1d2VIQlViSWJCY29NZWR4QlFLcDdIVEdheHh1eFVaakc3aFJ5ejlq?=
 =?utf-8?B?TnNWYUtWMXNZdlArOFRtN0QvZE9JYUVGTkNSVzdrREtTWlo0U1RySk9GU2th?=
 =?utf-8?B?T29vMUxlVGJaakNFMTlYOHFodXNnQ0IrTkpUbVF4VVRndTFEbjFSVnkwa0ZX?=
 =?utf-8?B?ZXNDLzFCdzF2ZmVKTmZNdlRlaWxId294TUtsMDJ1T2RSYnRxcUVCSCsweHZW?=
 =?utf-8?B?M0JkQ2Uvc1Fad2IxSFM0clVLSytXRlkrUWVQaE9RbWNjOFhYZzYwc3owZGxX?=
 =?utf-8?B?L0ZsdHRwRXk4S0pBWXY1T3Y2NmlZNVVYTXRPMyt1MHVHYU96YmFQdDJUVTdL?=
 =?utf-8?B?MkdIZWpQNithMDJ6TXF5Ynprei9Qb1R3UVdNVzFHYUVhWThNK0FoaUgzSEtO?=
 =?utf-8?B?RlJxcWhBVW05Uk95bVg5S2U2anRwdDk5UlUvdHgwUnVnT1hqY1VSampDbjlY?=
 =?utf-8?B?ZnFTd2hzWkNJVTBmakd3bFY0dXBROWJWbG90aDBiQ0x4eGo3Q1NyQUtHWFVQ?=
 =?utf-8?B?c1Fwbno0SXZIcm9ld1BJZXViNHNBWnduU1hRQ2RtemNSTUU3c3prcjdhTnNI?=
 =?utf-8?B?Mkw0WW4zZGpjSUN1N29Rd1RpZHZhUEl3VjRlWXBMQzFCdWd5MEM1QlI4cjJj?=
 =?utf-8?B?c3JDWTNTRWdUUlcyT21xNmFRMjM0N01TZW5RUUF4SS8zZ21NZjBJU29XaHp4?=
 =?utf-8?B?a21rY0YxQWVvZG9NWDRCZWtsdlBuYmFWaksvQzlwV1FGVm93OFZVQkJEYkdG?=
 =?utf-8?B?UitmdDU3VnEwYnB5MkI0WDcweWJFOXdxUzl1dm8zbFJHSjl2b3pMZ01wSUxx?=
 =?utf-8?B?RkdSOUwrTmlwZnA1dlowUGw1M0ZZZVkwb2lSUGxBWFpmSFN5ZitjdnpYNUdr?=
 =?utf-8?B?Z2hUWHU3QlMrTjZTaDRHaDFwbStnZnBQNldmdmIyOTV2dmJSYjFRM0t4TkVi?=
 =?utf-8?B?dTJMa21wV2FtVStiZ0tsZnFITys2ZXdNeWR5QW5IdC9TcmErRDNMT0ZQZ1pD?=
 =?utf-8?B?ajMxMkhUZzBMQ2ZEWUtSU0tTQ0tUV1hMSGtpTmNDaTM2RWFaZ2t2NmxoNEhD?=
 =?utf-8?B?a2szTjdqaTlkSjB1TFg1VnhGVWJzUlZNNnZpSjJuVy9JYVlhRVhTQnFXc0hj?=
 =?utf-8?B?eStWeDBaSzVHa1c1ejYrMG53aGczSzhXS0U5Q0FQdVUxcE1QUWkyaG52YVhC?=
 =?utf-8?B?cHMxcmU5SlVDdkRleTlKOFJRQlQ4WCtQRmYvQ2JJRW8rb1EwUUVtc1IzZDVP?=
 =?utf-8?B?UHBSVDZFQWk1SFlld0lYbTdQbzBQVTc0WCtnSGl5c09PcTladEVnaTdvSmYw?=
 =?utf-8?B?ZTNNL2hmMFhTQlRiY05oRXdqQU85emhZSW1sV0xKTFpScmFuSHhXRWhzUk41?=
 =?utf-8?B?SjVGbXBqMURWdXJVVDhEbStLK3Fpb2ZGRWZGYW1acU9lTWNKby9yWE51U1gr?=
 =?utf-8?B?N1RoY3lUMWwwY3k4TXZpejRvWE1YVm83dld1Ulhvd254YnNhdUhoQzIwcVFh?=
 =?utf-8?B?Q2ZRRkxQTkg5OEY3ZVNPVGhXMlNXQmlYRVBVakhnUWkrMkNIUktLL2FOZFph?=
 =?utf-8?B?aVluR1VZQTY3V1JKaCswTUh5bjRpMkpCaTVlUVI2RXA0Z2JUSENsQUJIb01P?=
 =?utf-8?B?WFBjTWJXM1ZaN3B2eUQ0SVZzNVFYejZHMXdvYUszZEVNbjNVaUlScGQvbGQr?=
 =?utf-8?B?NkJOQkNUVmlIT1JSYkwxZFZXYTB3MTFIZmRUbGViUkxzSnVobXJRV3lCM2tX?=
 =?utf-8?B?b1NMOHphazJIVlFVVW82YWl1d0xjSUsrb0NiREhQdmh4QmpMcDJ4YTY2c1Rl?=
 =?utf-8?B?em9rSWVpRGc0SFg5WitUeHk5Skc2S3V1bkNITUNXbE9uTFEyaDNJZlhaYkhh?=
 =?utf-8?B?RkRpVGVmYnlDcmF5eFJNakZMSU51RWlqRlN0cEhadTE2NHJkOFdIWVNFejlC?=
 =?utf-8?B?WVBFcmNCNEZWNWFPMjVleVdOc1hMNmpmaXhTcWdXODNlcngrSk50L0pYb2dN?=
 =?utf-8?B?bVR2aFh0Mk9YSmt1TXc3L2NVdk1sWXg3blh6cXBLYXdLYmE0RE1xTzg5cGR6?=
 =?utf-8?B?UTlyQ3FXZzZ2QVhHWWREbXBUTlBDcU9xTmJ4WDdqcUNQcEpLeHV0RHNxdDhE?=
 =?utf-8?B?eEt0b3o3dkJDLzZzcmQrdFdiZEFMWTZJcVhIOXllT2VUVDEwTzlUZWxuNUNn?=
 =?utf-8?B?SEJYNUlWSXdkM0xnVTJuZkVpeWxuWjZYK0JpS0phZzNEME13aW5EU04xTGY3?=
 =?utf-8?B?a2RXT2ZwTzl5NWhkSnZralk3VHZGenNzNFp4UDlrRDFDOHZkM1Iyd0hXVm9J?=
 =?utf-8?Q?2BrRzoFdbLzXdwOU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3B3A19E27CC414F853A5EF20E081062@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3def8e7a-f819-4f00-0b99-08da246fbe06
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 14:52:37.4071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qhi31dXjy+dvTdLfA4i3NEIH4/Yu5F/b1Koo1P4G1/bl0xeHxJ9MvBKjw7gNqD8DyS7fxODfkahqEqp47fwsg3RgR3hD2KVNCp6WSHXpOOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6151

T24gMjAvMDQvMjAyMiAwODozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gU2V0dGluZyBlcnJu
byB0byBhIG5lZ2F0aXZlIHZhbHVlIG1ha2VzIG5vIHNlbnNlLg0KDQpGaXhlczogZTc4ZThiOWJi
NjQ5Yg0KDQo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4N
Cg0KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

