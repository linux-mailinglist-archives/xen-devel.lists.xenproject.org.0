Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC9D669637
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 12:56:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477235.739852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGIeT-0003BK-Cd; Fri, 13 Jan 2023 11:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477235.739852; Fri, 13 Jan 2023 11:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGIeT-00038l-9m; Fri, 13 Jan 2023 11:55:17 +0000
Received: by outflank-mailman (input) for mailman id 477235;
 Fri, 13 Jan 2023 11:55:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bX0/=5K=citrix.com=prvs=37021d3d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pGIeR-00038f-KI
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 11:55:15 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21975da1-9339-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 12:55:12 +0100 (CET)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jan 2023 06:55:09 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5360.namprd03.prod.outlook.com (2603:10b6:208:1e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 11:55:05 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.019; Fri, 13 Jan 2023
 11:55:05 +0000
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
X-Inumbo-ID: 21975da1-9339-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673610912;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7Qz8tI34H2+ukCB5uzp/ISWQQFOVurHXR+A8+ylwlXk=;
  b=VJhnsAxcV55Ec3bHo1vqHFxpWjdxA4lVgg5MpWIksiRhrRtDjVo+1L2r
   QYH+0RzG278d/dmrJJFY2ZFrIuIDIw2TQw9Nson8GAjL2KTaIyTfRqHjj
   fxhrbfc3VZPAeWoeJIvPwHnIxbI58zuiVZ3ZiEWPW8Zb5484NibU4hjPp
   Y=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 92462271
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gcgaQ64dak7iEjjFP+4NnwxRtPbGchMFZxGqfqrLsTDasY5as4F+v
 jcdCzuAPv3YamCjLtgjb4W2o0kPvJ7WxtBmQAJu/iA3Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPakS5weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m/
 PoRbzcgQDy4oe+P3JWUQeZJgdUBFZy+VG8fkikIITDxK98DGMmGaIKToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Okkooj+OF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNISOPirKEz6LGV7mYcKixNS3ycm9S8h0OFGMxlD
 xczuTV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgcqeS4BZRsI5Z/kuo5bphjSVMRqFKm5icL8MT71y
 jGO6iM5gt0uYdUj0qy6+RXMhGuqr52QFwotvFyIBSSi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02DaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:8V+sDaCPcQsdzkHlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.97,213,1669093200"; 
   d="scan'208";a="92462271"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1dD1UrxKS1+uGE6Bfj+jvelwwTjtacnzAg549SG0IwfSi58bLsX0fxQlNGJ8AZlPAfuSY0hahkP7xbfgXY9bcYnb7xeebTgs0APRdZqjLpWCbfgZxJHE4tAGNXVqj6f1t4XY4mIkicJLh1FiLyJIKAWOWRhblLEtar/zyeUhoQXx+zsEU/AE/WWAHASYpY+DkP/jEdYwXFfsfqM8J8m3AQG5DjRtM5HS7GrBb9/P+aj7o/wxBxyrcXJ8dvLV0lF8WL9F5weWjrjLGGUihqisOqApDQ9GFQu3tZNK7kQ7KGtEySLlsfUmp+vyqUVHveQ2wDNygIENfntOQCG0cIziQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Qz8tI34H2+ukCB5uzp/ISWQQFOVurHXR+A8+ylwlXk=;
 b=ROTe+Ykr2ax0xkWar8CjS4CjR+e5xchtUOY1op43tnh/vNFWzSo3G1xM49vwnPoqWPtOwQC7JdKGFWW6s2RGUqccRK6YXL8fBwva6JzNvDnFd9Jv/S8QHJXtaVtsKLnaKzlkR7LF0+SI3JiLGnxW4jHPVvwnkYC3GHvt8Eaf/KiH6qjfdPY5SOj7d2nptyvrSAJMMq0dV/Y3U9A+T4KaPP+DZ5eUE8up9rFoojuW0jQRMBXqHEG6iCc6JwrxhzLYaiRNWQlN10f4p9Ks1+O/XJQJFPnrTFGuvO7oWckj3QsbjUX+VTETPRcMSImYFGeTyVviM/Hy7RzlUB+VP1m16w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Qz8tI34H2+ukCB5uzp/ISWQQFOVurHXR+A8+ylwlXk=;
 b=IfLdk5rqZFjSttHVPorSshyIHcuTRAWj5ygEYadv11dXwgXMNr6HdVvPZ5E6BFN12Y8AQGaRK1noF+RxHl/vD58fs/wC1wof1tJO0sivcuOQOqRaDGavTzC6aJ9gJpHLsV4hBNxDPbRBdLjKCvt1WtGguPYUbhqYtDLSlBb3My4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>, George
 Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 1/2] x86/shadow: sanitize iommu_snoop usage
Thread-Topic: [PATCH 1/2] x86/shadow: sanitize iommu_snoop usage
Thread-Index: AQHZJyu6jkZvmiKMqEGYr+zksqnvb66cPWcA
Date: Fri, 13 Jan 2023 11:55:05 +0000
Message-ID: <f24da4a8-4df8-0ec3-32f9-41f134b87d67@citrix.com>
References: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
 <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
In-Reply-To: <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5360:EE_
x-ms-office365-filtering-correlation-id: f21f55f4-267c-4241-fcc5-08daf55d029e
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 j1HwCcgYR4KzB0xxnDZnCycosxWPbEUHfB6gSl1DyjLCbnWTKKLkv8Gr8xStl1uzz4PxZ4VaJb97S5H1BbAQdEUJFFUYiOIMoyqxks3mXF+Dyp80A4LSk3RKdsMzFh8zeHZarSwFpYLW7ggh7FD8q0/A9jqGMprSFBcZgUsl9bDdYEgWQ3NeO+hvQtgKoXJOuCTLgks1qLom6IMu++tQlUewOkh3eJRCKCX++4mjnSsXopym41SUg6Xc/eD+RphabeGUcIUu6naGWtZUYdpg0L9L+3cH43eOl8FYmq98FoMo8D21h2UavPXlFruCTylzLVKXQWgGp02ambt8P5ATHusOeWPFiiEEdBQywK9K7hD9KBCvfK9S5ftURFImMKBI8n6kCFXllRw9ZeMBfgtJo1yw1lzUV2vNO+hyw4HikG2E4UOMVXlcT5KkZpGexnSG6+jGMTpdeUJLAUkZWRyG0O2W3RGZPtxAv4TQHdCGstTKjqZLcm2JvwsDdFBTofvBHl4F83CPFx/MJxnNqlJMyIEO/CA6s+rkz6mIyFxRMt1Yl0LYJLoW6ZvmbioQUhXj3h6gV7OWLkSS4q7PCItGZyht+vyHMDONJGt9oeswhEdtGYT9kCx0pTUimS4UFh5S3saYGe/BZZtU3eSeOjgkcTWe+SHSF83FRdfMdcfOufVHIbBYZRmeNtOdf5aJ0N+jbGLgj24NdgI5AMTVXgxJT+9UwNwthJECmeaIZbh0bwwN3ugLNm6mYbIssEy8gTyDjNZECCZYJI+1sznTRaiug0G3p/dUrc+Bce0KdMwvS2Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199015)(66946007)(8676002)(31686004)(41300700001)(2906002)(8936002)(36756003)(5660300002)(316002)(64756008)(6512007)(71200400001)(966005)(107886003)(54906003)(110136005)(66556008)(76116006)(478600001)(6486002)(53546011)(6506007)(2616005)(66476007)(4326008)(186003)(26005)(31696002)(66446008)(83380400001)(91956017)(122000001)(38070700005)(82960400001)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZWxubGQ5MHlWbzZTRTlvMkM5L2NhSlhwaFNDWlZMN25VT3Ewb08zMmM2MVNx?=
 =?utf-8?B?MmZlcmMwYTI4KzUySEoyOG8vdXMrVmNrZldzS3dpTFpubGRaTi9JYlRYd1N1?=
 =?utf-8?B?dVZvM0JvRit3WkhNQyt0enRqdzU5MnlEdGJsU0todEkyU2d4bkU3R09MbmV0?=
 =?utf-8?B?ZUZMNjlxZzB4bTduZ3M2MXdUdTdOTVc5cGdhbVhSdFRMSlRnb0lSdGZWbFJu?=
 =?utf-8?B?ZDNmeUw5MktGTTBmR2FoWkVVdENCSEp5Zk9sTDYwSDFvaWZIRTZqV0ZrOGVU?=
 =?utf-8?B?N2xPWUlNY090ME1ESjNZR2g2YW5KaGFBcVVzSDk1UDhjT3pXeFNZb1NlbmVU?=
 =?utf-8?B?VTRDdFV4ekhTTElnWEd6OERRYzYwUENYQXJCeE9rWmM2cW1CdzVVWVBPSzl1?=
 =?utf-8?B?bVhSUUxRUnF3WU4yODdlSUZNdFRaZ2M5L0xyaFRXdUNmT01pVUZNTWdZZHhT?=
 =?utf-8?B?eUc3QkxQejZnTTBQS2F5ODBIdmhGa0dtanowV01hcGlJYjh1Z2UvQ1JyU3Fu?=
 =?utf-8?B?aC9FTzBPeEV0a3g4ZHRoV3pQdGZhMGhzSmZkOUp0UVgxT294a3B3RTZWTmsr?=
 =?utf-8?B?d2ZmNzd4NjNNUWUvbjQ0TXVmdHJwUG95bFVFWWFrZDBKelQ1bFJuL1dLOFY4?=
 =?utf-8?B?ZXIxZ2FzUkRmUHBUZ2lXdlhaS0NLOHdsYVhaOWQ4cUxkcHFBMEJ6ZTBNVkta?=
 =?utf-8?B?TkJzeUxOUlJIaDJIMm5jZXJXQkpKb04xbFo1UlRQbW8yUldpcE1RZkd0dUJ3?=
 =?utf-8?B?ZW5QM1VpTWZHbE1vcm1nWU4wTnBNZlRDWnZCdEIzaGJHcmVpN0c5bXlLaE1s?=
 =?utf-8?B?dGY4M2tLNDA1WjRFSnlTYW5VUk9sbHZxN2F3K1ZxWURENm9oNjZERVpKQ0E2?=
 =?utf-8?B?eHBseHZSRGdGYU15dmxQck9DZFFsQmkxMVE4T3QrVzVmdFUwZXoya0N1VFdh?=
 =?utf-8?B?NmtvMTIvMFZwK1FmemRkQkQyNTFOenFUbjJHWnc1SC9xUW1wOVFmcEdkTGxF?=
 =?utf-8?B?THEwUXp0NzEvaHlRYldlZDVicGtEV1l0M1FtbDBWcCt3dGZtZGJmd1JCQ0lq?=
 =?utf-8?B?MHBhNUNWOG0wVDQ0cERUYVFxZjdRVWczbElHbXo3eGJuMUlFWFNFb295anU3?=
 =?utf-8?B?enpWbDJveHB4TE5WdGI2Nm9rNkFQemJTeTV2OGZscjc0ZjdKZytYcXBCOUZw?=
 =?utf-8?B?U0F1MXU3VHg4TU0zNUxXMmc4NmFtTzZRUExSTnVSaHQ4VDdHcHRUbWpqblI4?=
 =?utf-8?B?N3Z6cGMzUTdKTXQxbENaOWY5b1ByeTFQdWpqVGc0UnRXRXpYSU02Ti92dDgx?=
 =?utf-8?B?L0ptQ1FOcXp4NkVkRTVOem1HeERwdmR0aThTVkZteVV2SW9kbnZRMEIzc1BQ?=
 =?utf-8?B?eHozWlVwcHdyM1gvNjBsRXV3RUd0aWdtTmUyaGVOdGJWdWlHekZvMlFKZG9G?=
 =?utf-8?B?NVIxeDE2NTBtNHdSYVgzZVBkRmc2ckVYV3NweTJsQUVoNjVad2ZITGg5SXkw?=
 =?utf-8?B?Q1M2MnhBVS95ZjlZOHhWR0JEdjhxMm9KSnVWeksyOFhsbDF0Rzlxc1NFUFZT?=
 =?utf-8?B?YXB6M25ldDJ5MlBDL3V2QTJ4YUcwZjFsR1VBYUlaUXI0WFpTYWtQNnZrelpH?=
 =?utf-8?B?ZGg0VHVQQUZUeDN3dU9FaFhza0Q1Y2U5WUF3OHVmSDR6R1NQK2ppSHVqdUJo?=
 =?utf-8?B?TDRxTmozTTNWb3Q5Skw2UkhxQ3NHNkhmb2F0U0s0d3Q1RnhEN0VseFl4WlFn?=
 =?utf-8?B?d1NJc0hYSXBEUXNLZDRkR28xSkdScXFiYTNKRWh6SWxaL1VNRmJzWW4rMnFO?=
 =?utf-8?B?UkxCR1kvaGo4VnlGeSsvT2ZJWlNYb1FrTk1qMU9WRllFTTZ1N1hSUnF0bndm?=
 =?utf-8?B?LzNvUzY0OUplTzNNeWNJQmZoRkpFckRKOEZ2Um80ZjRKSktDcmRsaXR4M3Fy?=
 =?utf-8?B?M1FnRHVpNiszVG1uSTVZakNNcWFMUTNLL1crUGs4WXl5aEJEQzh4VzBteFpX?=
 =?utf-8?B?Y3l5aktzQzVJTTZmWWp5ZWoxOUQyaW9mMFVyKzZ1amxtenc5RHVjVzhPV3Vy?=
 =?utf-8?B?RjdpTTVBMHR2ZXZiYUdMU1lvN3VsVWxvTkdHb1FHbmJFekt4amxNbkFFa0dF?=
 =?utf-8?Q?EVhigK9wuwjpuy8HRoN8NImuT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F49FB4F90B26444A34358D0AEB41A28@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1jDFMH39zJebKcszwGbiTk6NmQxPFeuN5Zx8geHnJ5wDzb2FLhNLSeRFKreLcEcBiGmwpA0QOjaA4uUAdw7dBLptjM2sWnVLCV2AWEDqg8Q3hhAYb+TjG77A+UHNG96o12ApCsllMWjMyesHZk0j0pcsUMTlLaDEQnFB8ZphGsooeDU7c4rZZw7FYjidHw3RWN5KcNvwBmWkTnHfwg8QPL7Im3HW95g/5WOBFcTXY+ZBIlSZD5/Iu3/i0eCAVMde8PRmdR9wjnHnn2BMpFJAcoqf58RX3dLLFPqtkZLl1KSWKU3N3ceG3KHGqG/ZW7XLxLv6xyeZ2LdPd1nq6eMeQZmHOCHPRAVRVtlGE4RIYFPLRFVP2d6wWUBX1u1kSyvbKR+yMidlqZ4bQlTwcqNz5GlaHOr6YTqgGAHnfINwzOgQFNbV/vMyf/Or2IUn6RYI2GmozLbE6La2wIHZqI4tKPiwKcjrkLgNNnTMBOhBBF1Qv5TUyQxPofhoUCTezSuQPdkFTtaeDBJD0njKHiQGESWNEJudJVnNbz9J0rZnGU3tp4ZHdV5lQnpYmTwEexQnyygYt6EPT1Zllu87JzJ18Z96SqaAI5dRzCyChUVvA3hjRl8slXCvTiBDEfqT6sPSsd0PjjkH1b0RRDzfiPBoe/Vwe3lht4YV61TLjuoJqJ3fruLeBw+8dlIE3WW13wJH0E01Wr+uGAcOVxMsjhNBIJ59wPaoaY68eBG2z98YJy6EmETpGt2B1/ur0EGvAKlaxmmZHvsxkORvoLK4YgnjMikyRXnCIJmHu0rYNCq5SzSe3lpViV70YMcZvrpKh/gng69aOF+kFx2DEKaHSJRNScKy77vToAZgf1VlqkLoL1g=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21f55f4-267c-4241-fcc5-08daf55d029e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 11:55:05.0771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GcJ4O4QzKAr1MisB++ucHJDOWx1gYI8p0ScF6rQ18NjgTCWzKwObENZ4gBTBZoYuSd+brFefzEfjICMtgK9xm3o/DH2DNeqhXT5m/oQO59E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5360

T24gMTMvMDEvMjAyMyA4OjQ3IGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCg0KDQpBcyBmYXIgYXMg
dGhlIHN1YmplY3QgZ29lcywgSSByZWFsbHkgd291bGRuJ3QgY2FsbCB0aGlzICJzYW5pdGlzZSIu
wqAgVGhlDQpiZWhhdmlvdXIgaXMgY3JhenksIGFuZCBicm9rZW4uDQoNCiJNYWtlIHNoYWRvdyBj
b25zaXN0ZW50IHdpdGggaG93IEhBUCB3b3JrcyIgZmVlbHMgc29tZXdoYXQgYmV0dGVyLg0KDQoN
Cj4gRmlyc3Qgb2YgYWxsIHRoZSB2YXJpYWJsZSBpcyBtZWFuaW5nZnVsIG9ubHkgd2hlbiBhbiBJ
T01NVSBpcyBpbiB1c2UgZm9yDQo+IGEgZ3Vlc3QuIFF1YWxpZnkgdGhlIGNoZWNrIGFjY29yZGlu
Z2x5LCBsaWtlIGRvbmUgZWxzZXdoZXJlLiBGdXJ0aGVybW9yZQ0KPiB0aGUgY29udHJvbGxpbmcg
Y29tbWFuZCBsaW5lIG9wdGlvbiBpcyBzdXBwb3NlZCB0byB0YWtlIGVmZmVjdCBvbiBWVC1kDQo+
IG9ubHkuIFNpbmNlIGNvbW1hbmQgbGluZSBwYXJzaW5nIGhhcHBlbnMgYmVmb3JlIHdlIGtub3cg
d2hldGhlciB3ZSdyZQ0KPiBnb2luZyB0byB1c2UgVlQtZCwgZm9yY2UgdGhlIHZhcmlhYmxlIGJh
Y2sgdG8gc2V0IHdoZW4gaW5zdGVhZCBydW5uaW5nDQo+IHdpdGggQU1EIElPTU1VKHMpLg0KPg0K
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IC0tLQ0K
PiBJIHdhcyBmaXJzdCBjb25zaWRlcmluZyB0byBhZGQgdGhlIGV4dHJhIGNoZWNrIHRvIHRoZSBv
dXRlcm1vc3QNCj4gZW5jbG9zaW5nIGlmKCksIGJ1dCBJIGd1ZXNzIHRoYXQgd291bGQgYnJlYWsg
dGhlIChxdWVzdGlvbmFibGUpIGNhc2Ugb2YNCj4gYXNzaWduaW5nIE1NSU8gcmFuZ2VzIGRpcmVj
dGx5IGJ5IGFkZHJlc3MuIFRoZSB3YXkgaXQncyBkb25lIG5vdyBhbHNvDQo+IGJldHRlciBmaXRz
IHRoZSBleGlzdGluZyBjaGVja3MsIGluIHBhcnRpY3VsYXIgdGhlIG9uZXMgaW4gcDJtLWVwdC5j
Lg0KPg0KPiBOb3RlIHRoYXQgdGhlICNpZm5kZWYgaXMgcHV0IHRoZXJlIGluIGFudGljaXBhdGlv
biBvZiBpb21tdV9zbm9vcA0KPiBiZWNvbWluZyBhICNkZWZpbmUgd2hlbiAhSU9NTVVfSU5URUwg
KHNlZQ0KPiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAy
My0wMS9tc2cwMDEwMy5odG1sDQo+IGFuZCByZXBsaWVzKS4NCj4NCj4gSW4gX3NoX3Byb3BhZ2F0
ZSgpIEknbSBmdXJ0aGVyIHB1enpsZWQ6IFRoZSBpb21lbV9hY2Nlc3NfcGVybWl0dGVkKCkNCj4g
Y2VydGFpbmx5IHN1Z2dlc3RzIHZlcnkgYmFkIHRoaW5ncyBjb3VsZCBoYXBwZW4gaWYgaXQgcmV0
dXJuZWQgZmFsc2UNCj4gKGkuZS4gaW4gdGhlIGltcGxpY2l0ICJlbHNlIiBjYXNlKS4gVGhlIGFz
c3VtcHRpb24gbG9va3MgdG8gYmUgdGhhdCBubw0KPiBiYWQgInRhcmdldF9tZm4iIGNhbiBtYWtl
IGl0IHRoZXJlLiBCdXQgb3ZlcmFsbCB0aGluZ3MgbWlnaHQgZW5kIHVwDQo+IGxvb2tpbmcgbW9y
ZSBzYW5lIChhbmQgYmVpbmcgY2hlYXBlcikgd2hlbiBzaW1wbHkgdXNpbmcgIm1taW9fbWZuIg0K
PiBpbnN0ZWFkLg0KDQpUaGF0IGVudGlyZSBibG9jayBsb29rcyBzdXNwZWN0LsKgIEZvciBvbmUs
IEkgY2FuJ3Qgc2VlIHdoeSB0aGUgQVNTRVJUKCkNCmlzIGNvcnJlY3Q7IHdlIGhhdmUgbGl0ZXJh
bGx5IGp1c3QgKGNvbmRpdGlvbmFsbHkpIGFkZGVkIENBQ0hFX0FUVFIgdG8NCnBhc3NfdGhydV9m
bGFncyBhbmQgcHVsbGVkIGV2ZXJ5dGhpbmcgYWNyb3NzIGZyb20gZ2ZsYWdzIGludG8gc2ZsYWdz
Lg0KDQpJdCBjYW4gYWxzbyBoYWxmIGl0cyBudW1iZXIgb2YgZXh0ZXJuYWwgY2FsbHMgYnkgcmVh
cnJhbmdpbmcgdGhlIGlmL2Vsc2UNCmNoYWluIGFuZCBtYWtpbmcgYmV0dGVyIHVzZSBvZiB0aGUg
dHlwZSB2YXJpYWJsZS4NCg0KPg0KPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRp
LmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9tdWx0aS5jDQoNCkp1c3Qgb3V0IG9m
IGNvbnRleHQgaGVyZSBpcyBhIGNvbW1lbnQgd2hpY2ggc2F5cyBWVC1kIGJ1dCByZWFsbHkgbWVh
bnMNCklPTU1VLsKgIEl0IHByb2JhYmx5IHdhbnRzIGFkanVzdGluZyBpbiB0aGUgY29udGV4dCBv
ZiB0aGlzIGNoYW5nZS4NCg0KPiBAQCAtNTcxLDcgKzU3MSw3IEBAIF9zaF9wcm9wYWdhdGUoc3Ry
dWN0IHZjcHUgKnYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3RvX3BhZGRy
KHRhcmdldF9nZm4pLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1mbl90b19tYWRk
cih0YXJnZXRfbWZuKSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYODZfTVRfVUMp
Ow0KPiAtICAgICAgICAgICAgICAgIGVsc2UgaWYgKCBpb21tdV9zbm9vcCApDQo+ICsgICAgICAg
ICAgICAgICAgZWxzZSBpZiAoIGlzX2lvbW11X2VuYWJsZWQoZCkgJiYgaW9tbXVfc25vb3AgKQ0K
PiAgICAgICAgICAgICAgICAgICAgICBzZmxhZ3MgfD0gcGF0X3R5cGVfMl9wdGVfZmxhZ3MoWDg2
X01UX1dCKTsNCg0KSG1tLi4uwqAgVGhpcyBpcyBzdGlsbCBvbmUgcmVhc29uYWJseSBleHBlbnNp
dmUgbm9wOyB0aGUgUFRFIEZsYWdzIGZvciBXQg0KYXJlIDAuDQoNCj4gICAgICAgICAgICAgICAg
ICBlbHNlDQo+ICAgICAgICAgICAgICAgICAgICAgIHNmbGFncyB8PSBnZXRfcGF0X2ZsYWdzKHYs
DQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jDQo+ICsrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jDQo+IEBAIC01Niw2ICs1NiwxMyBAQCB2
b2lkIF9faW5pdCBhY3BpX2lvbW11X2luaXQodm9pZCkNCj4gICAgICBpZiAoICFhY3BpX2Rpc2Fi
bGVkICkNCj4gICAgICB7DQo+ICAgICAgICAgIHJldCA9IGFjcGlfZG1hcl9pbml0KCk7DQo+ICsN
Cj4gKyNpZm5kZWYgaW9tbXVfc25vb3ANCj4gKyAgICAgICAgLyogQSBjb21tYW5kIGxpbmUgb3Zl
cnJpZGUgZm9yIHNub29wIGNvbnRyb2wgYWZmZWN0cyBWVC1kIG9ubHkuICovDQo+ICsgICAgICAg
IGlmICggcmV0ICkNCj4gKyAgICAgICAgICAgIGlvbW11X3Nub29wID0gdHJ1ZTsNCj4gKyNlbmRp
Zg0KDQpJIHJlYWxseSBkb24ndCB0aGluayB0aGlzIGlzIGEgZ29vZCBpZGVhLsKgIElmIG5vdGhp
bmcgZWxzZSwgeW91J3JlDQpyZWluZm9yY2luZyB0aGUgbm90aW9uIHRoYXQgdGhpcyBsb2dpYyBp
cyBzb21laG93IGFjY2VwdGFibGUuDQoNCklmIGluc3RlYWQgdGhlIGNvbW1lbnQgcmVhZCBzb21l
dGhpbmcgbGlrZToNCg0KLyogVGhpcyBsb2dpYyBpcyBwcmV0dHkgYm9ndXMsIGJ1dCBuZWNlc3Nh
cnkgZm9yIG5vdy7CoCBpb21tdV9zbm9vcCBhcyBhDQpjb250cm9sIGlzIG9ubHkgd2lyZWQgdXAg
Zm9yIFZULWQgKHdoaWNoIG1heSBiZSBjb25kaXRpb25hbGx5IGNvbXBpbGVkDQpvdXQpLCBhbmQg
d2hpbGUgQU1EIGNhbiBjb250cm9sIGNvaGVyZW5jeSwgWGVuIGZvcmNlcyBjb2hlcmVudCBhY2Nl
c3Nlcw0KdW5pbGF0ZXJhbGx5IHNvIGlvbW11X3Nub29wIG5lZWRzIHRvIHJlcG9ydCB0cnVlIG9u
IGFsbCBBTUQgc3lzdGVtcyBmb3INCmxvZ2ljIGVsc2V3aGVyZSBpbiBYZW4gdG8gYmVoYXZlIGNv
cnJlY3RseS4gKi8NCg0KVGhhdCBhdCBsZWFzdCBoaWdobGlnaHRzIHRoYXQgaXQgaXMgYSBnaWFu
dCBib2RnZS4NCg0KfkFuZHJldw0K

