Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9E965BECB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 12:18:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470577.730123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCfIt-0003RT-IV; Tue, 03 Jan 2023 11:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470577.730123; Tue, 03 Jan 2023 11:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCfIt-0003Pf-E1; Tue, 03 Jan 2023 11:17:59 +0000
Received: by outflank-mailman (input) for mailman id 470577;
 Tue, 03 Jan 2023 11:17:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oadl=5A=citrix.com=prvs=36087fe06=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pCfIr-0003PZ-5C
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 11:17:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 443a6bd5-8b58-11ed-91b6-6bf2151ebd3b;
 Tue, 03 Jan 2023 12:17:55 +0100 (CET)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Jan 2023 06:17:35 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5414.namprd03.prod.outlook.com (2603:10b6:5:2c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 11:17:33 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 11:17:33 +0000
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
X-Inumbo-ID: 443a6bd5-8b58-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672744675;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=loQ1+D7roScKs3lPYDTnaMxLHTA/ehvWJiM110hZ2Zo=;
  b=F8BWpFI6LmIORtA2/SHrrMR8SV0UqVlui9B6yC3jfJR7FfBbLZgaue45
   g1/qSR2NkQHMJx4YWrauKw35buAsHovrKac1I3SijqYr7XWI2iViIGMQ1
   PxD4upPCumLeEVPIK4ilxtzD+KultIzH16Bxd01i8j0YvGbE5rwksICpN
   k=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 89900496
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UGrBGq7QBOyaeQHbyqLH1AxRtPXGchMFZxGqfqrLsTDasY5as4F+v
 jAfWDqHa/mKM2qgL9tzbo+3ph4GvMeGztQ3GwNr/Cg9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZlPakT5weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m9
 tgIED5dMle/u8mI5+KBZvhVudYPM5y+VG8fkikIITDxK98DGMmGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0ooj+KF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJDReXgqq806LGV7kc9VzAqalGJm6mkkm3iasNkD
 WM56BN7+MDe82TuFLERRSaQpXeeuxcGVtl4Eusk6RqMwK7Z/waYAGcfSjdLLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcmZwYY59jooKkokwnCCN1kFcadkdndCTz2h
 TeQo0ADa647iMcK0+C3+A7Bijf1/5zRFFdqvEPQQ36v6R5/aMi9fYu05FPH7PFGaoGEUl2Gu
 3tCkM+bhAwTMayweOW2aL1lNNmUCzytYVUwXXYH80EdygmQ
IronPort-HdrOrdr: A9a23:rovTC62V3ljUhsoG425UlQqjBZxxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hcAV7QZnidhILOFvAs0WKC+UysJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQjuVvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LoSK05KX8Gx242A5bdz9U278t/U
 XMjgS8v8yYwrGG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGpphe0aJ9nU7iiuilwhO208l4lnP
 TFvh9lFcVu7HH6eH2zvHLWqkjd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7nV6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklVavoXRiKrLzPIt
 MeSv0018wmKG9yqEqp5lWH9ebcGUjb2C32GXTq9PbliQS+10oJsnfwjPZv4kvosqhNCKWsrt
 60TJiB3tt1P7ArRLM4C+EbTcStDGvRBRrKLWKJOFziULoKInTXtvfMkf0IDU6RCe41JbYJ6e
 L8uWljxCcPUlOrDdfL0IxA8xjLTmn4VTPxyttG75w8vrHnXrLkPSCKVVhryqKb0r8iK9yeX+
 z2NINdAvflI2erEYFV3xfmU50XLXUFSsUattsyRlrLqMPWLY/hsPDdbZ/oVfHQOCdhXnm6Dm
 oIXTD1KskF5ke3WmXgiByUQH/pclyXx+MGLEEbxZlm9GEgDPw+juFOsyXJ2iiiE0wzjoUmOE
 1jPbjgjqS34WGr4Geg1RQdBiZg
X-IronPort-AV: E=Sophos;i="5.96,296,1665460800"; 
   d="scan'208";a="89900496"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkR7GoBglnFwdLrezXZPSkC+Aj7NpdeoUb+CsbPZ6yIOa55dtSiM+Db8rwpNJA856Q4GdL2XUJSJwGZ+pLMy8gf/t7tkLzCSJHd9B/e56N8ODORXRpfytZ94SB6AI+3i2YLCQNdMnSS+hWnR9PUKSVb892Ig7dfA+dwEnDdU+0/6fi9epnh3UcyaRXlCz84THrP3XPpAkx7/AA5BywNaqTO42DJ8R+81EVZc7KBTzpRUDYwCai885DdPhD0Ku/5ZaDObig83jZXKyA5qAmNIhl4qNUosr5xY0cUfXYWygDo9AG9v5SapdmB3vXoWHADdn2GXn8XWYNyiSHXNLJOVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loQ1+D7roScKs3lPYDTnaMxLHTA/ehvWJiM110hZ2Zo=;
 b=VhG6bOkBmFYHGpm7nceKkNGJd7nht7Ta2Iogu3PB25TH57tNPvZcfY/OTKzTq5SAiyVZ66Q2IOSS/JfIPA8p98Ogju2peMD5mW03KsLqi9kDCZHpqSAUvTjogWzPnYIUsDCj9hR7OxFuUqqIE+3e1vLwlob44Q4suvt052DXeNUeAV+1CA0dsY3G2v1ilXv1yWoP907jTvNoI6rld0hm5eM0TO/JcSJoDG4MASWlYWaufehKBzZFS41EzpFAv7q6i74PWGH6e0uInLmxqKp4lz7hji4gu5pRixd9+s3xGNV02NANzcKfzyvKTiB0+X3IE6UVBvfoQVd8f917rnv/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loQ1+D7roScKs3lPYDTnaMxLHTA/ehvWJiM110hZ2Zo=;
 b=jjT+6Qk+9AfJldODV5rOv5g9SgXCoNwZnAqJoWDeofWMviDdWsikgcJBXJogjU0IOJ408kkYVIfm2YMAbr2slsE49tL7KLUGKIDfH54Gtum3cZzJCWXqEHIJQhP7RQDhxeV7rhFIdwr/B1b5GPLJ4jkwl9t5nMCXXm60rtHb3po=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 2/2] x86/shskt: Disable CET-SS on parts succeptable to
 fractured updates
Thread-Topic: [PATCH 2/2] x86/shskt: Disable CET-SS on parts succeptable to
 fractured updates
Thread-Index: AQHZHK8Tc134ZZkfC0SbNIFFZQXGXq6JrR4AgALjd4A=
Date: Tue, 3 Jan 2023 11:17:33 +0000
Message-ID: <d4850283-26f6-895d-4677-a3c1043a68ce@citrix.com>
References: <20221231003007.26916-1-andrew.cooper3@citrix.com>
 <20221231003007.26916-3-andrew.cooper3@citrix.com>
 <Y7GifofUaQ8u8ugr@mail-itl>
In-Reply-To: <Y7GifofUaQ8u8ugr@mail-itl>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DS7PR03MB5414:EE_
x-ms-office365-filtering-correlation-id: d5f58551-5bd6-4906-a271-08daed7c1c76
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 urFOqW4+7Rw8yYtZFNVE6Y23iUhgAAaea0FqjFNBTNPEVcroEOPMhdP4GOdNAzA9MkndhlhBO/S/JBxBt4yqL9FvVVZYx9+pOzOxCog6Rgo+3P3xAqKt+67qYRvfDEZjPFr0t7A2W/mmdAts5P1eYWLGd8ud1Fs91NNuW+UGSvOmAOUY2GHqikAu6C1wbEJjrz/xzVdVVe5yJYiJ0MeT3plgRo9IkBT/PMZ8/pgH0HkDYEzH5ZE8Nz81NPNaLINV3pjbxGRTn99eU7ymtNJNfq5FUjOwI9D76DH+gk/hrViIZpl6orAS17uUTYJUg9MSrSmx9z3Wq4JypRN+C6IHThCHFmpevRcDkpfaFjeAkJyr8CDkaCJZsu6XxubdHxCeu2isOS0foIU8fiGN8fFlxlmj0VNqdi6NMhz8atD98S52zgeuwzzlTmWhi2H9t/GFCQFAcABOXvp2eYgMlaOsrszpM35EIGkPghOSia2kfjZ5jXbKwrc0D9fO7ticwdH19e8fdQpLgTvi+5yrqtPx4vse8q9Y2NImIhP81RTyMAh7+B46vOc7Nub3V3uRFalS9wAyUAK6WukP2U3retE7vOVauNH31TSv0p084oy6qJuQ37i6j8ZlRWSkahAKbfZcxzHoaCvxsXUvmQoY/lkXrZcOdnwU+C4o0gJPUBKIhfZ4pqm7fy1rgNamHWU99AFuyIa1r49rZPynKIDgWxrvca216LZzkT81H8Bk0ejLsO+REkvsZ+b8Tgl2EeaTLFhylEAPbrISbn3M0YaAKcNFZS0UeEJi5071YGaZumkM+1g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199015)(38070700005)(53546011)(76116006)(31686004)(64756008)(66446008)(66556008)(66476007)(66946007)(6506007)(4326008)(41300700001)(91956017)(8676002)(316002)(6916009)(2906002)(86362001)(26005)(54906003)(186003)(31696002)(478600001)(6486002)(6512007)(82960400001)(122000001)(38100700002)(4744005)(8936002)(5660300002)(2616005)(71200400001)(36756003)(22166006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXUwSmZ6ZkNvZVVLVW5EZWZ1WWR2cWt2RFd5RmllL08xM2w4eWt0MVVxTXJY?=
 =?utf-8?B?MExiUUFZMTk2K2FJNG9RblllKzIwSjVPcjVSUk9TVldnREJxUVBibWIxUmR3?=
 =?utf-8?B?cC9BRDVVTXAyeVdZR0U4K09aOWg0SDF3TmNFc0MxMEhoWUVKNHZ5WEFValZL?=
 =?utf-8?B?SWhmcHZ1eGViSnY1dWt4cHppakRLeUJ3NEFaN05mVCtpdlMveDlQeXhFaHZG?=
 =?utf-8?B?VlYrTVJxem5YQnJsTGt6aytUMEFwZWxxanFZSnI4ZmRVandmS3JVT0hMbEdw?=
 =?utf-8?B?WTFLbEo2WHlWQnprc2x6dURsZmlReVNaR0NUbWFUekp0ZFNWZ1J5WHNxMS8w?=
 =?utf-8?B?TXVmcS8vVGdweSswNTNYU0wyZE5jcGt4cm13N1ZsSWp1cUE1STA2SXVvUENW?=
 =?utf-8?B?bzZpYWF1aTdLUGY2eTRUK21qZGdlOC8wR2UrUEszalFUSUVKYU5PU1BRYzVo?=
 =?utf-8?B?cjVYZDVPejkwVWR4d0tPL05yRGRMSHZvZUd5R0pqYThHNWI5Zk41ZzdnNFdl?=
 =?utf-8?B?R040R1FnSHQrVlp2YU5YNHlORGNFYlhyNzRhZXd1YWRKWGxhc3FBdkxQK2M1?=
 =?utf-8?B?Z1BMK1JCSmdhdjdPaGFyT2hRZG9xVDlRTmtzRms2dFIwTlNNaW5IZCtMaW51?=
 =?utf-8?B?Sys5dk5CbzdjakIxKzlROHgybmtYcDQwTG1LazV0NXhuUTBRdGpZbS9hL2Uy?=
 =?utf-8?B?VDBEdlZzWC9KdGFodlpUbFB0ZW43bnZuN1FQN0k3dHNwaHNXRDJmL1dxYis1?=
 =?utf-8?B?KzlvaEtxejU0ZTJobWFyVUhCemF3eG5uWDdLU1Y1RFIyK3pidHJHWEY0VGQv?=
 =?utf-8?B?ODhhMzFUMVRRM1BEYVlQaWxTWnJwRzBoWGFXc0E1NDAzRkt5UEIxUjN5QXhW?=
 =?utf-8?B?WkQ2cmk0ZVc2WmNtZmZGMFBQU3NkSW5ZU3M0Z1piRmg1RTFNSXBKZ0ZPRzYr?=
 =?utf-8?B?UUNHZEpDaS9NZDhxcEpBdDEvb2N1dXRiQWR1M1RSM1dydnVZYTV1RlBoVUt2?=
 =?utf-8?B?Syt2RkJ2dnZWWXFCT3JPZHVhVzBaZkoyU2p1Tk9ieDQzSnlkUElUTnRqRVpt?=
 =?utf-8?B?VWFmVGFQdngrSnRPblNkb1JCM1hFUlB4eWxVL01tOVVXcE9IdW13QkY3L3N4?=
 =?utf-8?B?enZNYkVPSUNYSlpNYjJsNEQ1a0JXN05ZK1ZtN0lzNWJzY1A2ZGJKQkFjUGFx?=
 =?utf-8?B?TDRRbWtCeTJlLzdiQ1RmckU2NU9KZTM5bDIzc0h1S1JWZmZ2bWN2M1RQNG14?=
 =?utf-8?B?eFhwc05kOFVwa3FueU9OWXB4c3ZDUmIwRGFzQ09qVWF3U2JiUkNjVmNNLzlE?=
 =?utf-8?B?V3VNcXlwR2x3aVhVSXBuc1p2dUR6L3RCOEN4dXdCb0MzdUlyS25sNG9aVUts?=
 =?utf-8?B?d09uVnhlY0wvSTQyMU9ONU5qUTJYVTdVRkJlNkdyQXl4WnZnMTFOOUhRQkV4?=
 =?utf-8?B?d0pyUTJSY3QvK1hKelZqcldTajBuR1liZWtqUHcrT0I0RHAzVTJuRkNpU1pr?=
 =?utf-8?B?Z3BYd00wdnMxUXFzU3BPZmR1T2tyWkpFdWRjK3M3RzJXdTVmMm1FbVRLa3Bi?=
 =?utf-8?B?ZHBlTmU4ODRUQWw0NFNVOHhDbFRuZmVKbURHRFk5TmhEam9WYXJ0Q0IrUmpW?=
 =?utf-8?B?OEJIeGtBVVp1UTFPZlhGaEF0WlQyL2pCZmFqVEViUmxRcGZSQkYrcUpJbFNt?=
 =?utf-8?B?RCt6RytqMHV2QmlyUzBqSXczYkl2ZzJYWWpzdzU3UlRVOGl4bUVuOUFTdko4?=
 =?utf-8?B?NEVEa3JFd1lYS1VWWlJ5cUV6Q1A3WnUrdFlIOGtXbVBVUk5KU2ZuOEZBQ2FI?=
 =?utf-8?B?azNlNnRnQ1V1R3BZQnoyS1VHM3Q4UmpoQk55bGlZNE4xcFB1VkYwYVpXbjR1?=
 =?utf-8?B?K201UkpYOFJ6MEFqbEp1U0dXbW5KZlB3SmZDQ3djamFoSVRPTEUzTGxVM2xJ?=
 =?utf-8?B?cm5GbS9uQ3ZGN2xXekRJeVdKOWhEY1NnUjRLR3M3bXdpTHFMcFJkelFUOHpy?=
 =?utf-8?B?ZXZMQ1FPSTYwcXpvb0pVL1IxUUVhcGhvY2JsYjFidFdjNUY0RG91TnEvVmJL?=
 =?utf-8?B?V1l5OElJQVNMczRSN2pMVEtFOG5rdkNES0hjeDI4dzU0cUFhM2tPSHp6OElp?=
 =?utf-8?Q?ZD9an9vwhc6iQ4o7O7sdLPcfS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48F5AA714F8BAE4F8386F60BF328D80E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9n1vybJ40N9m7G2ZMje5H/85HT+PSDUW/oYQdjhAIeBqu5lC3D2213sSOMbW/lFSFC3KDcLL2BnVo8mo6YLl8knT7VwrKMiIm5G7pCDfLV3Jqd9rg4jdjsiFTP6TTQlg8lx/loOBMftKaLGDw8aWxNeWGbZpt/Gtw1jbgoyWm1uR19BDjTl1x8dpTI1JHiC6/Lg71jdgm53aAtN/dAk79TpOMJ0uMCofl70X/ACV01Qc5hUj3eULc9tfESVPi9NsKPViJAv6xQS2wKIABQx9Q9po+6RS1OF2kMVsBE2456oVRUv7/ahcYEkw+H7F5yjgPAvFNq1D4DzVrj5QNfiSOBalMajgsXuBO7teFPfSKocvxLp5bY/Opxe9x6rTKv3YH/bjEmxfOoU17tqjRUTxiOsp5POKZz+bl54fbMEty75aPp0oGru7Jk5Adgmhk+/Zi0U+vV1hxq12K5aPTByhlafrcp//TatykzMBokCXSUsjCZ2pFhGtNSplXuOuPXrpy8DXHNAlX2n39KGDmpLE/au/aHNowI9vbd5Zp/lJgWfIOUaQH9HKEv7xBtNw90NDbUsGP4BVRjllFPVlbhpz4eWekDFyZKfey3d7YDxPvCOjhzNfnFEN/IeUcPs8DspJTdDWqV/M0TDdmhPIIJLRV2Zeo408zUUPp9zta6hrFVak+z3oQ13FugheTq8t4vJK03h1UbqAmo7DnpNRX3k9AwvsUCPcHyoVinJs7ZL53/SAkiJ6Ei+7+XFrfRUqgTaH8rutn7HWrUfXe0GlLcVdslas3x5vuX+QGdHRnSR7LIMgEmT+MfM6jasOT544sX6PIIvoI2fynq0DxXuX8PK3Dh9sSAaalEAdI+VqseoOpDUXSeo6jWzA+Hob7mq22V7u
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f58551-5bd6-4906-a271-08daed7c1c76
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2023 11:17:33.5454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xxgWUWNmWak2zgmNtbKYzkxQgFX1vJj1NxCItAISKkIlji4CITVaPEIDqYl1Zq8rzW5irqyCQBfsqXeLgRbuyh779uYgAy4aD88qaKeMfSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5414

T24gMDEvMDEvMjAyMyAzOjEwIHBtLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6
DQo+IE9uIFNhdCwgRGVjIDMxLCAyMDIyIGF0IDEyOjMwOjA3QU0gKzAwMDAsIEFuZHJldyBDb29w
ZXIgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYyBiL3hl
bi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMNCj4+IGluZGV4IGIzZmNmNDY4MGYzYS4uZDk2MmYzODRh
OTk1IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYw0KPj4gKysrIGIv
eGVuL2FyY2gveDg2L2NwdS9jb21tb24uYw0KPj4gQEAgLTM0NiwxMSArMzQ2LDE4IEBAIHZvaWQg
X19pbml0IGVhcmx5X2NwdV9pbml0KHZvaWQpDQo+PiAgCSAgICAgICB4ODZfY3B1aWRfdmVuZG9y
X3RvX3N0cihjLT54ODZfdmVuZG9yKSwgYy0+eDg2LCBjLT54ODYsDQo+PiAgCSAgICAgICBjLT54
ODZfbW9kZWwsIGMtPng4Nl9tb2RlbCwgYy0+eDg2X21hc2ssIGVheCk7DQo+PiAgDQo+PiAtCWlm
IChjLT5jcHVpZF9sZXZlbCA+PSA3KQ0KPj4gLQkJY3B1aWRfY291bnQoNywgMCwgJmVheCwgJmVi
eCwNCj4+ICsJaWYgKGMtPmNwdWlkX2xldmVsID49IDcpIHsNCj4+ICsJCXVpbnQzMl90IG1heF9z
dWJsZWFmOw0KPj4gKw0KPj4gKwkJY3B1aWRfY291bnQoNywgMCwgJm1heF9zdWJsZWFmLCAmZWJ4
LA0KPj4gIAkJCSAgICAmYy0+eDg2X2NhcGFiaWxpdHlbRkVBVFVSRVNFVF83YzBdLA0KPj4gIAkJ
CSAgICAmYy0+eDg2X2NhcGFiaWxpdHlbRkVBVFVSRVNFVF83ZDBdKTsNCj4+ICANCj4+ICsgICAg
ICAgICAgICAgICAgaWYgKG1heF9zdWJsZWFmID49IDEpDQo+IHRhYnMgdnMgc3BhY2VzIC4uLg0K
DQpGaXhlZC4NCg0KPg0KPiBJcyB0aGlzIGZpbGUgaW1wb3J0ZWQgZnJvbSBMaW51eD8gSXQgdXNl
cyB0YWJzIGZvciBpbmRlbnRhdGlvbiwgY29udHJhcnkNCj4gdG8gdGhlIHJlc3Qgb2YgdGhlIFhl
biBjb2RlIGJhc2UuDQoNCkl0IGlzIGEgZmlsZSB3aGljaCBvcmlnaW5hbGx5IGluaGVyaXRzIGZy
b20gTGludXgsIGJ1dCBpdCBwcm9iYWJseSBoYXMNCn4wJSBpbiBjb21tb24gYW55IG1vcmUuLi4N
Cg0KfkFuZHJldw0K

