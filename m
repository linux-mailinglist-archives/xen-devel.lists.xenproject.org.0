Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A0A3B16D5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jun 2021 11:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146182.268932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvzBJ-0003Td-EA; Wed, 23 Jun 2021 09:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146182.268932; Wed, 23 Jun 2021 09:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvzBJ-0003Qf-9A; Wed, 23 Jun 2021 09:28:25 +0000
Received: by outflank-mailman (input) for mailman id 146182;
 Wed, 23 Jun 2021 09:28:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iC25=LR=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lvzBH-0003QZ-NP
 for xen-devel@lists.xenproject.org; Wed, 23 Jun 2021 09:28:23 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0285806-922a-485d-a98a-3f33f56d5de1;
 Wed, 23 Jun 2021 09:28:22 +0000 (UTC)
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
X-Inumbo-ID: a0285806-922a-485d-a98a-3f33f56d5de1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624440502;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=pFOPDETfwZJaOe7twdax4Wn6oS+JjDQ67+7lVx9wUS0=;
  b=C4f/cPrUdKQ+pPr9o3pJaSFzN8CSvfGczd5/tAwU97IxyDyI6JHTEI6E
   roz8V4KeIttrZNbY5DDl4lgL3COO8kry2uEYZswNMxDRspSkHtAm8PYSk
   iYKvXJ1r2FCgIffYavYVwxJ4suVE3ksMY2dq0p8GOjemBxq4vcxgtF3UT
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WH/Lz7hrvgI13fnDyYImTb7tJfmXYAiKr8YnBB46L3HxSQGErwqgXfw2oPsDUiU3t0NTIfiS32
 4uTPWM1ITSMNSnk83CY+XJRaYIzi+01BVZz8nB9Rh2NuJ1ZsrVcAhiA/fDo9Kn+6ws/DWMINns
 s9xcOfkDwPAZr8PS6DgdEi0IH7Q/6jA4OijZs0BrPKub32KriwVhS+P2hUJLYVxZ/Inu2TShdG
 lqmeH2gNsYHuXONCY9B6lmvzlMaJep7UV2SFgQSovOt4ArpeY9G/fyMk/GbkYT5t1e5Sliqe25
 kv0=
X-SBRS: 5.1
X-MesageID: 46826513
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gWp3+atRqv1pZ60exPaDnkgj7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.83,293,1616472000"; 
   d="scan'208";a="46826513"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2qDzptXCAn5S/zI+UUKJvxLWS3xVjr8VigqOXz3URndS0hYdr29/J/byyIk5gfX9ljBSx8bIXPkPeqfU4hUUJjMIb1wLxn9n6MrTS5/RmGvQkdPho68w2vx2dN2jqBY3ZKhV99KZehcVVNBiYnzHhhuxDuV7KqjScmv8YO9YXrv1ALuzEJ+x4ayibyJSmgISZYW73qxf5SIDwgNV8KFSxLGV7VvTqq5jsglNMBqwtvD6Q4AvbKL0tW+XGJIKwpThwlrXxvwi9GLeNNjHr1DCta3raZ27u0zwJsgJiI6/0EeD9uYZLMxCc1Fd6mA2PcR5YTuKfohpBqfpsOw2xheqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFOPDETfwZJaOe7twdax4Wn6oS+JjDQ67+7lVx9wUS0=;
 b=Ukkt7yL6q0Ya3libRsq/n8qpNVNzQzzJhWvmHs7IRwIv3Si2UH+G8f8pNR+Je54cDo2wFwGQrbtzdP9DwVvtZ9nMxDldia8ocpDBMMJ1XUR1ZBHovNOIOEiglwukDxfulPode3bG2fpeNJ5ztBCZ4u/qOnVEhPVIwpi9Y47FU5Rnc77T3FNVcxuE5CXDxjeA19Kf5dPNwE0KCYrCzwNrOZX1DID2nKC6lYEjUYM/B3SDCTaHuT06H7hX5FFL7nJr3kwDzQdhWDo1c82cV1gIR4fRtts3HiocO8ECKy9ti1/kNi2wxQDCtrD5c7BbJu5bHlIVpdYARXVOw/zTYTuACw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFOPDETfwZJaOe7twdax4Wn6oS+JjDQ67+7lVx9wUS0=;
 b=IFyD+6v47OAhcX4psPNcDKAnmbyLkCriptHHddpk72MryLmpKgaaBze9p9D+ymtI2qC2YTlJtn1i5J15QSt9bA9OBcHvvmw9vR4uf26nz1Cg5Kym/evqXhfxd5q1Gj1A52gpN1XIVf1wMYp8WeZP4e2cfie1tKgwbgIXfV7+n2I=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
CC: Ashley Weltz <aweltz@linuxfoundation.org>
Subject: Welcome Ashley Weltz, the new XenProject Project Coordinator 
Thread-Topic: Welcome Ashley Weltz, the new XenProject Project Coordinator 
Thread-Index: AQHXaBIa0kQCTROEFUGBiYmQ/zZkBQ==
Date: Wed, 23 Jun 2021 09:28:19 +0000
Message-ID: <C148BD69-9717-4B94-A11A-5C96C12CAFD4@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58a1b014-08d8-4b2f-5ce0-08d936293d02
x-ms-traffictypediagnostic: PH0PR03MB5896:
x-microsoft-antispam-prvs: <PH0PR03MB589645BE8E217AF48BD529BE99089@PH0PR03MB5896.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RXIlwT7OFzr9PscOsVhmYmRhprmn3VIBwn1RMyidpGTpxjjFP8hWrO3zqLeokUdK223zSDBg/IisPqMaSAvspfR0zYdf4cJvTW60K6H+T4wqBtTpPdQl31B5c2Oo9AnG0TVLI9m/ln2M4REoT3SHvuwQUhIym9QAMoGxyUzW0pCT9wYmLWab3i+HcAerrmBgfLC2Vqvs/TN9xb1iaV55gH0q29SyKELIycjvsYeszBmAFR62/5Uh1JIGm23vJQl+ZwSRKEv1ZmL+T1ACYiZu8/3bmRmXAspbq3+aCAD61uIHNQ/CZ5R7MInUGF6Ghc077VnFgCXlNNGE2YZcSxD9lBdk3RVC2H5I/N8Fzx9jPBYm1MOlwQqevgBERkz75f7zE+o7XyrpxmVRwzZtmXziWFKG/bTNBVeeGYcdnC/R+hR51i21dEGnYs+9VFr5PteyUTy+JKOIM1nYhHOnSB9Hn4W0CxCgKdzhmJZW1Lhvid7JYrRdHVeGnnaReZasCflnzWjckrEpm8JRiWp8UUXqqMyxLm3ChDO1p6UyXjJUBmZvP5LnUg2BWnl1cZho+7K9ti2EPpPNSXnGAAgPPpD8fapEnjYi0e5kz0j6SXfgrjVPpYW45PFJV95Fp1BiaFjumoat1ubJ7Hst3tPHBsIOkBafqlqLyrHCYQKMnALnJ/Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(396003)(346002)(136003)(86362001)(71200400001)(4744005)(122000001)(6916009)(8676002)(316002)(5660300002)(4326008)(2616005)(36756003)(6512007)(2906002)(76116006)(8936002)(6506007)(478600001)(91956017)(64756008)(26005)(33656002)(66446008)(66556008)(66476007)(186003)(66946007)(38100700002)(6486002)(4743002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjArTFlhaUhJeEJ0VFZWeXA5NlkxRUZDWmRXMWJlRVpzNmtLT0g2OGM3ZFJw?=
 =?utf-8?B?TkpuUTBkajBUVWlJdHBLYmIvWlB2UjRlTUsvMTVxTkFVdFlENVlOcDAvL0Uz?=
 =?utf-8?B?azJCMExnSzVQamFQNUkvclBOYWlBdVNwZDluUXh1UjY5eFBYOEhZL2tLOTRK?=
 =?utf-8?B?N2ZNRC9qNk5teTBXaS9XUW1OSTIzOFlRSFZZSGduOERFRDJ1cFVlWXpUclZq?=
 =?utf-8?B?c0ZUU25jVzNDYXZXNzAxcjRYRVdFbmRTK3lOVThmTHlGOEpKRzF1aW44S0JV?=
 =?utf-8?B?WkFJa1FWMUU3Y2cxVlNCNU1KckdDWjFKWHpIcjBnNXNzdm9hbVZrRVNvd1U0?=
 =?utf-8?B?SXhuOWQ4SFM2b0lDdlFIWXd4ZDFPL0I5b0tqdlEvYm1CaUI3QUFMc1lqeHIv?=
 =?utf-8?B?cTdtRjc1MlFMaEZVNkRNbUlrZFdCcHh0TmNqUW1zcXNsVnVyY3V6WUhDZEpX?=
 =?utf-8?B?V2doM0FYUm9lSHBrOVRoajVqYWtERjltRmtPODJhNTRPV2lxZ2NaZEo1TUo2?=
 =?utf-8?B?azBVTmlXS2FTWlNFbDNIeEhCekNJc2VxZjRqWDBtdHlScG1uaWZBTk9ZWUl0?=
 =?utf-8?B?Q1cvTXVENnpvb2Z0c2ZpdzdCQXBMbWpzTUpPS3U1MUxkUEtwMk93NHUvSnJn?=
 =?utf-8?B?SkhlbExOZkpMU01iajdRZG0rT3lnbDFDbEdqaXU5T1ZhaVRrdUIwY1FwOWxT?=
 =?utf-8?B?SjcxWDVOZUYzYTQ3OHFPU1VtVmpMajNUaEZGaFBVdkRxT2ZDdjBYMUlXTk1J?=
 =?utf-8?B?Zjc3QUxJdGNyVnlnV0lKZDNIRmpTWXdHdFJjYnVNaTlkc25BWUdTa25FU25z?=
 =?utf-8?B?UWFxbnlLb2hhYlN6NXFNeG1BNTlzYTdGSmJSelh1N0ZUOGZVclJIdmpVODRj?=
 =?utf-8?B?eU9SaDk0VzhOVjBaMTNWVEFhQmhmRXNUWUE2bGtKVTJRdHlWa2xiSXBjOFJX?=
 =?utf-8?B?aFg3ak1PS2FxTjYrR1ZmV0hERndMU083WmNYQW8xYzBSY0FXbnJuTHh4SVBM?=
 =?utf-8?B?S0xUa2dHcitSNloxd1hoTW9GWkRmUHBaQXJOeWxqZjVCSTFpbGUyQVlRTHlJ?=
 =?utf-8?B?YS9qdEtsTmtoaUVIK0dZNzh6VDRsSTNZMGpEajJ5VHFGR0xKU2lWRFpwSGZ6?=
 =?utf-8?B?RmVadXNlWXhWY0tMdUNtMTUyT2xvSEhOVFQxT1A0SkVEbHUraEQrUml0YTN1?=
 =?utf-8?B?OTM4WnNNcy9xcm5aSmNZYTUxV29EUGl6T3V2L0FwYzlSYnd1UXVVVFVRYjZ2?=
 =?utf-8?B?MzJvajNkdHBoWDBOeVJqNzVEM0QyOWh4TlZXcmhUL1BJSUVnQWlzdHdwbTJH?=
 =?utf-8?B?TjUxRk1kam1CTVZ4T3NDNFJUTzRNNWxaRnIzNXpOUlllNGlXTkR5aThIbSsv?=
 =?utf-8?B?bi8xMEpwbTFMY01BOUtaelovSVYwOFlnVGpOSUg1YXlPUGZiWDFVSmZ5Z3Zw?=
 =?utf-8?B?YjFXSlNmdCtjSWtmclRERnFudXpkT2tZRkpKc09uRDcvdjZqaUJOeDhmcHFO?=
 =?utf-8?B?SWNudWxXeFZ4cUduZ3RTdmI0djdYUWUySGZuejlFamVNb0JjcGkva2JCcklY?=
 =?utf-8?B?TXNqcXRwK09vWWtETitweUlKMm5VcUdjTGpUMjV3aWV0aDJMd0lWTFdMZG5v?=
 =?utf-8?B?SUdOdjBOUVNSQXFVYVRpaENvaXVzUGxHVUxkdW92bllYeDFBNDhsUC9vZkNK?=
 =?utf-8?B?MUFGR0hiczBPVHM1TTY1TG4rNlJqVnU0aEhDelY5QmpWUGV6bC9tS21iYVEz?=
 =?utf-8?Q?j8BRreG4T6Xk3c//abXvnRTo3JsttvJmkVh4AhE?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1637D843BB5FF74281DF6E0BAFB6A349@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a1b014-08d8-4b2f-5ce0-08d936293d02
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 09:28:19.3256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wu+fSLPlOTovZK5PsjUzaWUUhsnZc0M/bNN7Um+QahZwaEoRqfODgV+aT4wh4pOqvOWAY4Q99dI9sRpljA3TVDTIi74Ab3o6TMTvX+S6hMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5896
X-OriginatorOrg: citrix.com

SGVsbG8gZXZlcnlvbmUhDQoNClBsZWFzZSB3ZWxjb21lIEFzaGxleSBXZWx0eiwgb3VyIG5ldyBQ
cm9qZWN0IENvb3JkaW5hdG9yIGZyb20gdGhlIExpbnV4IEZvdW5kYXRpb24uICBBcyB0aGUgam9i
IHRpdGxlIGltcGxpZXMsIEFzaGxleSB3aWxsIGJlIGhlbHBpbmcgb3V0IHdpdGggdmFyaW91cyBw
cm9qZWN0IGNvb3JkaW5hdGlvbiBhY3Rpdml0aWVzLCBpbmNsdWRpbmcgY2hhaXJpbmcgdGhlIG1v
bnRobHkgY29tbXVuaXR5IGNhbGwgYW5kIHJ1bm5pbmcgdGhlIGpvYnMgcGFnZS4gIFNvIGRvbuKA
mXQgYmUgc3VycHJpc2VkIGlmIHlvdSBzdGFydCByZWNlaXZpbmcgZW1haWxzIGZyb20gaGVyIGZv
ciBYZW5Qcm9qZWN0LXJlbGF0ZWQgdGhpbmdzLiA6LSkNCg0KUGVhY2UsDQogLUdlb3JnZSBEdW5s
YXA=

