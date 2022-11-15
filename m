Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D2962AFBF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 00:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444085.698907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov5l3-0005ur-A3; Tue, 15 Nov 2022 23:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444085.698907; Tue, 15 Nov 2022 23:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov5l3-0005t0-6c; Tue, 15 Nov 2022 23:54:25 +0000
Received: by outflank-mailman (input) for mailman id 444085;
 Tue, 15 Nov 2022 23:54:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7AFj=3P=citrix.com=prvs=311e0f190=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ov5l1-0005su-EU
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 23:54:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1e56e3c-6540-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 00:54:21 +0100 (CET)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2022 18:54:12 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SJ0PR03MB6390.namprd03.prod.outlook.com (2603:10b6:a03:396::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 23:54:07 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 23:54:07 +0000
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
X-Inumbo-ID: d1e56e3c-6540-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668556461;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=f89u73OvTwvTvcI1Ez66c6lS5QgQuggKCFI6/Nh4TrU=;
  b=FSvhlr2CsTKJnoxnkhJctK39XoRhqaAPkxsm/jiMDJThFHeq4pvDTTdv
   XPYm15ESKGhrJzpAWNsABBszEiv+yrA0lyhXBDX4YQFlrdZWobNiqa2aH
   tPr302Hk+2OUAU0pH1yaiVnnBw/jwleEF1/fYVzR3Cp3SAr6AbcTKm/Lr
   A=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 83965834
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FTmhwK7CekOVVkCZJwEQ5QxRtAbGchMFZxGqfqrLsTDasY5as4F+v
 mMZXT/SPP6KMTT3e4xybY6y9R9QuJGHmoAwSVY4ryFjHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkS4QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 eQXdRwKaR26qqG22bmqdMtGvsAjBZy+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+GF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJJRePlpqU26LGV7kw4Mh8GUAa2m+njkF+jReMAB
 VZT6jV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yyaUAHIVCAFIbtMOvdUzAzct0
 zehgNfBFTFp9rqPRhq15rqS6D+/JyURBWsDfjMfCxsI5cH5p4M+hQ6JScxseJNZlfXwEDD0h
 jqM/C43guxJidZRjvriu1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nU/MBRaI3hxI2U2ss=
IronPort-HdrOrdr: A9a23:dEvzBK/Q37JMOKCDvUxuk+Hwdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NTjj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qi5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 F29lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQFo+dY7bWfHAbIcYa
 5T5fLnlbBrmJShHinkV1xUsZiRt7IIb0+7qwY5y5eoOnNt7Q1EJgMjtbAidzE7hdIAotB/lp
 r52u4DrsAwcuYGKa16H+sPWs2xFyjERg/NKnubJRD9GLgAIG+lke+/3FwZ3pDcRHUz9upFpL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GTDg0NtX6ZR1sqD1AOODC1zJdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXYJExRf3VZVeIWQXFMcVptE4UVSTpd+jEPyjisXLNPLIYLb9GzctXW3yRn
 MFQTjoPc1FqlumX3fp6SKhL08FunaPiK6YPJKqjNT7krJ9R7GkmjJl+WiR94WMNSBItLAwcQ
 93PK7n+5nL11WLwQ==
X-IronPort-AV: E=Sophos;i="5.96,167,1665460800"; 
   d="scan'208";a="83965834"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7E0rd+qmoQOVCC1srx5183XbLc+hZ4iaY5R/GJ+NnMB8Q2RzFmQaWgVHbV0I8Tf5sxDzLuHzQXT1A5BNtZ0qeaaw1buRO+dAQf0uXNhyLVlUvftzN75yjQpxG11POp4we551pMnGGKb2QOey3YaZzmRr88x3UbEQCDcUANR3ycTA6+gexDmffXYUNsiC7doFa+3CEO0VF4i4XTB9Kiq7WKkAkIGUEJffBLvUYuaQJnAcFJRIF/u5Lt/xUR9aB0rovP4bI0Z8MtvtXYAsVmV7dfoUUWvxvfBl22laDIBJ0k7fIfBTo27T7h4bHZSWZuLtoyt6D8/J0Ycze1SAMuUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f89u73OvTwvTvcI1Ez66c6lS5QgQuggKCFI6/Nh4TrU=;
 b=mqaj5bYZeVjcFzzo5N/YarVfvjwfY6h7Zso4F/oi2lFN+QMTsQ9mvJk45Hooy+msz79theiUrWuB0QWFP8pb6+9X3lG+o9Fy6kt42pKCSnZkFO5lQoA2Eu/0lQ8YI1vjA+9r/taJmmRGEUnv5q4BNhVKGYQbE3OTTgRVgn6JiAv0e7H/GHf8FLHbUKv06VLaFDC9xsf/j4fIJdQney87MPs45+jm/NjEF3c1wpAW7WdF/hWU02f+Jtj4ivjzL8c7/paNt4mduWJAEb/e5rylDLG4WzkF4Hz0YNdzcJFVR9Y3YLnSoLyjSK5mjm4Q+UNVC+qmQUZRWNpOlN8hxQ4pFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f89u73OvTwvTvcI1Ez66c6lS5QgQuggKCFI6/Nh4TrU=;
 b=v/gKdiCK//0tPjSsukY1KTTiYryZ0VYUqifqcTnljxQdTDOjoODrsRQ2nKLKSv5h2Md3cIkHkwcDqGz87gFaxg7SPDVfY2XJGqRysOTdqxFqxPg3Bw6nGEUTfI/4ZZ/aqNnQdqatKPRUUlncRTJY0qjT9PCAG5sSzs/IXsuHSJg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17 v4 2/2] amd: remove VIRT_SC_MSR_HVM synthetic
 feature
Thread-Topic: [PATCH for-4.17 v4 2/2] amd: remove VIRT_SC_MSR_HVM synthetic
 feature
Thread-Index: AQHY+PYG7JqnYiwdr0usZ0w09l5ina5AKpoAgAAGqQCAAHfpgA==
Date: Tue, 15 Nov 2022 23:54:07 +0000
Message-ID: <51e9dd3f-59fb-a112-baf7-f96c07800ee1@citrix.com>
References: <20221115132657.97864-1-roger.pau@citrix.com>
 <20221115132657.97864-3-roger.pau@citrix.com>
 <c698b1e2-c047-1197-9c26-2239ea56c30a@citrix.com>
 <5caf3930-ea8f-6e68-326f-93cca1fa210a@suse.com>
In-Reply-To: <5caf3930-ea8f-6e68-326f-93cca1fa210a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|SJ0PR03MB6390:EE_
x-ms-office365-filtering-correlation-id: f4dce970-fbe0-4b92-8c7d-08dac764af24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Ia4gcyYZvhHdTY+0ztqJ9WMPAcBfNPzqRTxtWO32nKXeLaq35Zy2qBniJPmi8aIDVDDvAPl99jYcXtwHxWTIKYoczoBTyeGIO2Aum/MdyLt1mITLDMkicNkdL5Csg+vXAD0OQxk8jDCoJCbGWp9bW2I+KiM4X+rjp3epjRq/06WDV4rUX6YxawB+/owg8l72C/TAvizLg6ZTi13j8JnwV6ToHRBC93mV3Ku58hCwVSY//znoTCyU7cTp9H1SLQCZxB1bRxHTvXzYkzrvxkyr8CgEYFf36iFT+xZEqE5N9X/OFtzGpCrS2l9Nuk+30qiyUlPBoVFVHCXmRxPfm+2OubN4eDrvzIxwhlI+KEpx5uiCBHk0rc27RaeRtCmT8tH1pr692MVZoKXHktrc4STN7tj9oaDKvkzPm0Mdn004hrEXgKNRDBgVkf1VLsi3BoNn9ySkRx5aXpI0vVMIa5TMk+O52HSFKUOQ5ZIbtaTi3r2DM/roakuY1jg4zifs20vo+osSPmX1GUEjzaMzZ3X/oPCN37wFUbEun+Onvo46Lj5dvgx1J7EL40V0Eaxpazn8jbk/XLFY871DPHU6TiAiMSZNpHO9ehzQDHrVO6/bRPTwotthqw633lujHYmZpzB0DaWA1mUh+hMg3eCtGLs5uKD/B772zpgCaLuPtJTtuI9HngD+645zW4QYY3UKO1yDemETl+JlGRMqU1DOkkxAQFnBjnAM1cutoWkEzztmf7lNDnrUX6THqHKac/h+rR6AxPrVQ/sZJtennnn00GIynXwcru2y2DfnV5J6/uCixMkiHJjysP2ONZSqYf8GqhQ8S9TOxn8B+/dYnHDMIS5OXA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199015)(31686004)(86362001)(31696002)(36756003)(2906002)(478600001)(122000001)(82960400001)(8936002)(38100700002)(38070700005)(186003)(2616005)(54906003)(6916009)(316002)(91956017)(5660300002)(6486002)(64756008)(76116006)(53546011)(66446008)(4326008)(41300700001)(8676002)(66946007)(26005)(6512007)(6506007)(66476007)(71200400001)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?clFibGdET2M0T3B6SkJlb3hIZWNxVTNsSUJXamhtZ2sySjRQNDRKQW9xeEls?=
 =?utf-8?B?dXZ4aDU5dlNGOE5GYUltMS9mbytmMXZhUllJVzYxcFlYTWFPUXp4UkN1b0VF?=
 =?utf-8?B?WXVYZVEvNGR6RWVpMi82TGdtelVWWm1FUnZlejE3Zys0RldFRVZwWlBvMC9K?=
 =?utf-8?B?SnlTYVhaNkY1aVpCN3BLcW9ZUThVR01wVnJhbi9ORkMrTGRSelVzd0tSMXlk?=
 =?utf-8?B?RTlXUERieTJIbTg5WTdMZG9pRHQvQk5JVHZRa3g3Kzdab2VaaDhHOG41SVAw?=
 =?utf-8?B?SzFIcllNM1NIR0RWemNYS1hvODIwMVViTW1PSXpyeXVtcXBaUU1wOUVEOWVH?=
 =?utf-8?B?Yi9lOUZNQVJCWWdkc3AzTWtxRjhDRVE0eXQvRDVndGVKczIzYlVucGNuZFBH?=
 =?utf-8?B?aVlUSmUxMk85Q1ZzZ082TWY3empPVmpsTVp2aGNlOE9ndUkxeHZtVmFmazAw?=
 =?utf-8?B?WjkyZm9OeXcrVFRNaEhPK1JneTJ5VDROT0VUMzF5bVBuc1VHeDdRdGp0ZDFO?=
 =?utf-8?B?bXhtVCtPY3FkUEFORG41ZUloWkk5cE1DY2xaU0Y2b1JNK0tiRGJibHo2M2xJ?=
 =?utf-8?B?Ri9mMHFXMWk1WnhpSmVqcTJKcHZzcUFHcHk5UkhXQkd4TzFMYjR2azh2d1NO?=
 =?utf-8?B?M3JEWkJ0M1F3bGdTbHpVRlhaS3duVFptTnYvcFpZaUxNUk1xcFFaMkF1UEp6?=
 =?utf-8?B?N1RybEE0Wk4zYmhpRG5MdzZrS3pOWjZpYi9UTzErTDY2R2ZRSTdJdEowQm1F?=
 =?utf-8?B?bkR5UVlQWUpiR1lsVzdGOVYzdU9aY2lWaG9NcUwrcC9tcTR4YjNXYVJBdVZj?=
 =?utf-8?B?RTVwQk5BRFF0Wk9yVXpVemR6NWhiU1ZKYmlaVUpFMW5YaWkwdGxaVCtkOHJU?=
 =?utf-8?B?NnEvKzNNVlRBQ3ZIenV6aGhWdUx6eXVtYVY5SmVZOHRkb1FDZzdjY2NaR3Ji?=
 =?utf-8?B?VVR5cWNKVml0N3VPVFl2QTdUeExFUnBpTERkemV6ZjY0Z2xiNUh6ZDI0Q1BV?=
 =?utf-8?B?UVdTNVdmVGt0NzhWdlRvS05CbG9ZRk54YkFvWUpLV2dQRFg3UWhKb0g1eEdl?=
 =?utf-8?B?Y21lb0N5cUhjU2loMTF5M09UVmZMY0ZIZTkxNTh4dUN6Q0NmdnZDSXhzTmVB?=
 =?utf-8?B?WFY4M1lTMGVvQ0FPQlAycHkrMURpR1dPaG1QVUpUZFpQazNQT0Rmdk5NRzFI?=
 =?utf-8?B?K1VWL25WcUhRWlp6UTZFVWpIdDBwaUt2bWhBcDkvOWtZblovME51a1lGL1o4?=
 =?utf-8?B?TlZSMG1ERHgvV3N4RnNZQWpjL1NsZmtCcDI3OWs3bGJNU2tOOGJwK3BlY0dV?=
 =?utf-8?B?VWlxam5FR1J6MGw5dWhiMkJYc0x3NCt3cmhUaSsrbklRMHF0VURyYi8wc2pF?=
 =?utf-8?B?T094c2xOaHFENzluM2pObW12VWJxMm5kbXV3bkhnakxEeTNzUlhwbTVjOFBT?=
 =?utf-8?B?bjBiRTFRcUNEcjdBdFhPbTFvUGVsRy8yNEZtcVVkOXBuZjh4ME42UGZ0eExN?=
 =?utf-8?B?a1k3bjZOTnJ1RHgyNlBLcXF5UEpsdFhUUi9iRnhRSlZYaWdreU5RcHFLaTVO?=
 =?utf-8?B?VklITklNYjlleEU2ZW4wYXdXZnhLTHQxQmhxYUx1bnNNVVJwVzU0WTBhSEg0?=
 =?utf-8?B?MHphV1lIZ250MUU0cnVFZkM3ZTBrR1l1SlJybEErUW1SOUJCNE4zTG53eEpY?=
 =?utf-8?B?TkYrVWRVN1FwcEM3MklFdXdob1RmUGxLOGlYT3JxcFJqeGY3cytTVTNIWUFS?=
 =?utf-8?B?UWUvTGlaMUs1OFZ5YWkwci9aejBqWXFZczlaaStFZDhUK0JnRmdYWnlkVUVW?=
 =?utf-8?B?WEV0ODJ0M0xOWURrZFUwQTloNzh2L2c0a0VBbW1adDg4Z2tVTDVXRWJ5b2Jh?=
 =?utf-8?B?TEkrT2I0TmpPRnREVGxPSktDc09NMEp3dy9iYnNVUlRibCtmYVpTaTU4bThS?=
 =?utf-8?B?NWR2RWl1OHdoMmd1MDVxWmFpeFpBd3ljMDJ0TWsrL1l3MUtDeEh1RnBORzJ1?=
 =?utf-8?B?Y3R6VDJMTVE5cU8reVJRcFdaQnIxTkoxMW0wZFVzMWh0Rk9wM0FwbXlnM2Ji?=
 =?utf-8?B?S3pDTVBZMVlCR1FyT2c2bkppR05SYTlrcVlXVUJIVWJJQUtNM3RraVRWQm02?=
 =?utf-8?Q?rZbmZEKCqQNlZ50513T7sxb4j?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEF99CEE8C620A43AB055D5B4F6CA75E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LkxOnc7y3QAH5e/XOOYoTUBJJ9LwZ6OMqWDOOEFq8MhfIoRuhzBYrl7x4lxIURue8NpyA0Wdbc6oIjDAj9zERpq0tSn/cgc5SL6pzmSb5cOXJRjMfgqc+bkgraW24REDY2+y1oBeakQyFc6FIY6OxytpG/slRI2DiJo/a4Y4B/nEXEB10OoLLK7Bqik26YnRn9bmtiHmhG70dxTuSrUh5ZG4VAU0kY5ckGRsuxIGY4nRWlyRWuZomB3r6jKnGxBmsN69A/AGgGG9g5f596/hdO7XP4Wso1+UvpLsksft1ZYvp9E2X4HlDCU1uuLKXb5Fyz5jnxBKVkBXt5uXVE/D2AxKkuPuM0kQBIo2U/u9R9gcTOD+Hmzj91qFdrOk7c+RFuFkf5LWpDxAEEYc583SxzQHO22nfn7n+NaQJSyfFA8zVmY6lMoD/5IMtW0t/76xzN/POXYQOih89tfx2HhaiTy7EZgf0SzuRQIAG9ZsI2/tTslfILCs8ztDzScebJvG279TSKZCCyY742xjtMVKo1qob4h05+aOqX31CbLyEzqC8vEAJAJdZuQLKJ5zl3x+gwHtcWGZAQ04KkHxzcBiGRwOjMJ4xEgdmjy5zaoD49KgBmNwrvXkf4GMdUxo3gTPA/G8kc5CcLmFhRtAX5lqZM86dgiThrfZRo7qXbGSWvoGXiTjj9NARTpBZe61axLFNCZplPiIw0ZR3OLQ3q+M07VVmmJNJgNnF571HQ3xICW/diK8Wxhoxsg9aaI1MGAJmLvq9ELcm15nw3pWMUlfIsL9IFZXt0+37vtzRmpjNfpCw4uQ/lURXmlGk547KYKxfsQpmQGSXTVbBpRaKF341qNE9upw4ezDWO4cAMb748o=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4dce970-fbe0-4b92-8c7d-08dac764af24
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 23:54:07.5255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a72Em5XTVBYW21xWfGHXWcSa5lphix9WDtnUGOHbd2nHAsM2+vmNa5wzMD+BLDlKpmPHPpZRTBU5G4plKFjSzCaUx5QTuJ73WMO75+XbPAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6390

T24gMTUvMTEvMjAyMiAxNjo0NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE1LjExLjIwMjIg
MTc6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNS8xMS8yMDIyIDEzOjI2LCBSb2dl
ciBQYXUgTW9ubmUgd3JvdGU6DQo+Pj4gU2luY2UgdGhlIFZJUlRfU1BFQ19DVFJMLlNTQkQgc2Vs
ZWN0aW9uIGlzIG5vIGxvbmdlciBjb250ZXh0IHN3aXRjaGVkDQo+Pj4gb24gdm17ZW50cnksZXhp
dH0gdGhlcmUncyBubyBuZWVkIHRvIHVzZSBhIHN5bnRoZXRpYyBmZWF0dXJlIGJpdCBmb3INCj4+
PiBpdCBhbnltb3JlLg0KPj4+DQo+Pj4gUmVtb3ZlIHRoZSBiaXQgYW5kIGluc3RlYWQgdXNlIGEg
Z2xvYmFsIHZhcmlhYmxlLg0KPj4+DQo+Pj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQu
DQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4NCj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KPj4+IFJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4N
Cj4+IFRoaXMgaXMgZGVmaW5pdGVseSBub3QgYXBwcm9wcmlhdGUgZm9yIDQuMTcsIGJ1dCBpdCdz
IGEgcGVyZm9ybWFuY2UNCj4+IHJlZ3Jlc3Npb24gaW4gZ2VuZXJhbCwgaGVuY2UgbXkgZmlybSBh
bmQgcmVwZWF0ZWQgb2JqZWN0aW9uIHRvIHRoaXMNCj4+IHN0eWxlIG9mIHBhdGNoLg0KPj4NCj4+
IEdlbmVyYWwgc3ludGhldGljIGJpdHMgaGF2ZSBleGlzdGVkIGZvciBzZXZlcmFsIGRlY2FkZXMg
bG9uZ2VyIHRoYW4NCj4+IGFsdGVybmF0aXZlcy7CoCBJdCBoYXMgbmV2ZXIgZXZlciBiZWVuIGEg
cnVsZSwgb3IgZXZlbiBhIHJlY29tbWVuZGF0aW9uLA0KPj4gdG8gYWdncmVzc2l2ZWx5IHB1cmdl
IHRoZSBub24tYWx0ZXJuYXRpdmUgYml0cywgYmVjYXVzZSBpdCdzIGEgcHJvdmFibHkNCj4+IGJh
ZCB0aGluZyB0byBkby4NCj4gVGhlcmUgd2UgYXJlIGFnYWluIC0geW91IHN0YXRlIHNvbWV0aGlu
ZyBhcyBiYWQgd2l0aG91dCByZWFsbHkgc2F5aW5nDQo+IHdoeSBpdCBpcyBiYWQuDQoNCllvdSBt
YXkgbm90IGFncmVlIHdpdGggdGhlIHJlYXNvbmluZywgYnV0IHlvdSBhcmUgbHlpbmcgdG8geW91
cnNlbGYsIGlmDQpuby1vbmUgZWxzZSwgYnkgY2xhaW1pbmcgdGhhdCBubyBqdXN0aWZpY2F0aW9u
IHdhcyBwcmVzZW50ZWQuDQoNCg0KPiBNeSB2aWV3IGlzIHRoYXQgc3ludGhldGljIGJpdHMgd2Vy
ZSB3cm9uZyB0byBpbnRyb2R1Y2UNCj4gd2hlbiB0aGV5IGRvbid0IHN0YW5kIGEgY2hhbmNlIG9m
IGJlaW5nIHVzZWQgaW4gYW4gYWx0ZXJuYXRpdmUuDQoNCllvdXIgdmlldyBpcyBpbmNvbXBhdGli
bGUgd2l0aCBhIGxpbmVhciBpbnRlcnByZXRhdGlvbiBvZiBoaXN0b3J5LCBhcw0KaGFzIGJlZW4g
cG9pbnRlZCByZXBlYXRlZGx5IGJlZm9yZSBieSB0aGUgZmFjdCB0aGF0IDEvMyBvZiBYZW4ncw0K
c3ludGhldGljIGZlYXR1cmVzIGZ1bGwgcHJlZGF0ZSB0aGUgaW50cm9kdWN0aW9uIG9mIGFsdGVy
bmF0aXZlcy4NCg0KIkkgZG9uJ3QgbGlrZSB1c2luZyBzeW50aGV0aWMgYml0cyBpbiB0aGlzIHdh
eSIgaXMgYSBwb2ludCBvZiB2aWV3LCBidXQNCmlzIG5vdCBzb21ldGhpbmcgdGhhdCBjb3VudGVy
cyB0ZWNobmljYWwgcmVhc29uaW5nIGFib3V0IHRoZSB0cmFkZW9mZiBpbg0KcXVlc3Rpb24uDQoN
Cj4NCj4gSSBhZ3JlZSB0aG91Z2ggdGhhdCB0aGVyZSdzIG5vIHN0cm9uZyBuZWVkIGZvciB0aGlz
IHRvIG1ha2UgNC4xNy4gSXQNCj4gbWF5IGVuZCB1cCBtYWtpbmcgYmFja3BvcnRzIHNsaWdodGx5
IGVhc2llciwgYXMgbm8gc3VjaCBiaXQgZXhpc3RlZA0KPiBpbiA0LjE2Lg0KDQoqVGhpcyogaXMg
YSBnb29kIGp1c3RpZmljYXRpb24gdG8gdGFrZSB0aGUgY2hhbmdlLg0KDQpFcXVhbGx5LCBSb2dl
cidzIHN1YnNlcXVlbnQgb2JzZXJ2YXRpb24gdGhhdCBpdCBjYW4gYWN0dWFsbHkgbGl2ZSBpbg0K
X19pbml0ZGF0YS4NCg0KPj4gWW91IGFyZSBhdHRlbXB0aW5nIGEgbWljcm8tb3B0aW1pc2F0aW9u
LCB0aGF0IHdvbid0IHByb2R1Y2UgYW55DQo+PiBpbXByb3ZlbWVudCBhdCBhbGwgaW4gY2VudHVy
aWVzLCB3aGlsZS4uLg0KPj4NCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9hbWQu
YyBiL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMNCj4+PiBpbmRleCBhMzMyMDg3NjA0Li45ZTNiOTA5
NGQzIDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMNCj4+PiArKysgYi94
ZW4vYXJjaC94ODYvY3B1L2FtZC5jDQo+Pj4gQEAgLTQ5LDYgKzQ5LDcgQEAgYm9vbGVhbl9wYXJh
bSgiYWxsb3dfdW5zYWZlIiwgb3B0X2FsbG93X3Vuc2FmZSk7DQo+Pj4gIC8qIFNpZ25hbCB3aGV0
aGVyIHRoZSBBQ1BJIEMxRSBxdWlyayBpcyByZXF1aXJlZC4gKi8NCj4+PiAgYm9vbCBfX3JlYWRf
bW9zdGx5IGFtZF9hY3BpX2MxZV9xdWlyazsNCj4+PiAgYm9vbCBfX3JvX2FmdGVyX2luaXQgYW1k
X2xlZ2FjeV9zc2JkOw0KPj4+ICtib29sIF9fcm9fYWZ0ZXJfaW5pdCBhbWRfdmlydF9zcGVjX2N0
cmw7DQo+PiAuLi4gYWN0dWFsbHkgZXhwZW5kaW5nIC5yb2RhdGEgd2l0aCBzb21ldGhpbmcgOCB0
aW1lcyBsZXNzIGVmZmljaWVudGx5DQo+PiBwYWNrZWQsIGFuZCAuLi4NCj4gLi4uIGFzIGxvbmcg
YXMgeW91J3JlIHRhbGtpbmcgb2YganVzdCBhIHNpbmdsZSBDUFUuIFRoZSBicmVhay1ldmVuIGlz
DQo+IGF0IDggQ1BVcyAoOCBiaXRzIHVzZWQgZWl0aGVyIHdheSkuDQoNCkFuZCBzdGlsbCBpcnJl
bGV2YW50IHdoZW4gdGhlIHNpemUgb2YgdGhlIHBlci1jcHUgZGF0YSBhcmVhIGRvZXNuJ3QNCmNo
YW5nZSBmb3Igc2V2ZXJhbCBjZW50dXJpZXMgaW4gdGhlIGFyZ3VlZCBjYXNlLg0KDQo+IEkgdGhp
bmsgd2UgbmVlZCB0byBzZXR0bGUgb24gYXQgbGVhc3QgaGFsZndheSBmaXJtIHJ1bGVzIG9uIHdo
ZW4gdG8gdXNlDQo+IHN5bnRoZXRpYyBmZWF0dXJlIGJpdHMgYW5kIHdoZW4gdG8gdXNlIHBsYWlu
IGdsb2JhbCBib29sZWFucy4gV2l0aG91dA0KPiB0aGF0IHRoZSB0YXN0ZXMgb2YgdGhlIHRocmVl
IG9mIHVzIGFyZSBnb2luZyB0byBjb2xsaWRlIGFnYWluIGV2ZXJ5IG9uY2UNCj4gaW4gYSB3aGls
ZS4NCg0KSXRzIHZlcnkgZWFzeS7CoCBBbGwgb3RoZXIgdGhpbmdzIGJlaW5nIGVxdWFsLCBzeW50
aGV0aWMgZmVhdHVyZXMgYXJlIHRoZQ0KbW9zdCBlZmZpY2llbnQgb3B0aW9uLg0KDQpJbiBtb3N0
IGNhc2VzLCB0aGluZ3MgYXJlbid0IGFsbCBlcXVhbCwgYW5kIGxpdGVyYWxseSBhbnkNCnRlY2hu
aWNhbGx5LWNyZWRpYmxlIGp1c3RpZmljYXRpb24gd2lsbCBkby4NCg0KDQpJZiBhIHRyYWRlb2Zm
IGRvZXNuJ3QgcGxhdXNpYmx5IHdvcmsgd2l0aGluIGEgZGVjYWRlLCB0aGVuIGl0J3MgcHJvYmFi
bHkNCmEgd2FzdGUgb2YgdGltZSByYWlzaW5nLCBhbmQgZGVmaW5pdGVseSBub3QgYSBwb2ludCB0
byBsZWdpdGltYXRlbHkNCm9iamVjdCB3aXRoLsKgIEVzcGVjaWFsbHkgYXMgaW4gdGhlIHBhc3Qs
IEkndmUgYWxyZWFkeSBnaXZlbiB5b3UgYW4NCmFsdGVybmF0aXZlIGNvdXJzZSBvZiBhY3Rpb24g
d2hlcmUgdGhlIHN5bnRoZXRpYyBmZWF0dXJlcyBhcmVuJ3QgcGVyLWNwdS4uLg0KDQp+QW5kcmV3
DQo=

