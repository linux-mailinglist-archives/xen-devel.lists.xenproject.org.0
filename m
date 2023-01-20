Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19E9675685
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 15:11:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481805.746943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIs6e-0005cS-NG; Fri, 20 Jan 2023 14:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481805.746943; Fri, 20 Jan 2023 14:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIs6e-0005am-JM; Fri, 20 Jan 2023 14:11:00 +0000
Received: by outflank-mailman (input) for mailman id 481805;
 Fri, 20 Jan 2023 14:10:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIs6d-0005ae-GR
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 14:10:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42061bdd-98cc-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 15:10:58 +0100 (CET)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 09:10:42 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6806.namprd03.prod.outlook.com (2603:10b6:303:166::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 20 Jan
 2023 14:10:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 14:10:38 +0000
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
X-Inumbo-ID: 42061bdd-98cc-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674223858;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YCF5JYCTY1lZQy8QZBZuNbS+nNL1neUa/bFFIffrLEU=;
  b=dqaQJy8N9wkel0mQboAJBfgBSyLfEi+ZzpUMfcE3DsyUeQeVp5qhbPlL
   U2QxkZqJuNNGrEtAfvuV9Lgd7pFTho4dG8MwXaXRge5b4eXr+HFA4wnOd
   e7svtaCTPFnfdGkys6rMmHzESBgsDb3mkij/glG4uOyh/ZT5vkn7ExH6z
   g=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 92425885
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WHCF367HQET6zrrQxGIefwxRtAnGchMFZxGqfqrLsTDasY5as4F+v
 jAdXTyHb63fY2b2KtFwa9u0oUkGvZLSzINqQAc6r39kHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPakR5AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 6U0ChcEX0y6raGE+6KFdsBO2O4tFZy+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+KF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNISOflpq436LGV7lczGkUXf3S3mqOGtFKzGP5SF
 XIlojV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnNM3QBQ62
 1nPmMnmbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bs/7UZtNqEarwhNulHzj1m
 mqOtHJn2O9VitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5P2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:k9uoOKzKUUByodcmNgIKKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="92425885"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zn+wwwIlJjdZqKgVHsyezYFldOlqljPDRWHtUOH1+soVFanXeYY8I4Wa9aexSPexs+nulAh3FHg5SMj4HTZDl9px+Pm2tpiAA+DJ6v6AYniSsbLHn3MUvzrusHSsfVa2WX8AfTmNltxf03H28zr/eQPfaymtU2z0lvEOpgD8wJwk9zKSyzAfW0v7bO74hL+kHlG66AUS3zIWDAQm9D0gJlEtPG0nwYs68e7nDV8Mj+EZCjjt9h3w/HxdY0BqzlVL6hgFH64K0mFxS1ecDPseJZ7DSIZgPLVI0dR9bRxGiBlkZ3hXZf3VFBg6Z3Rt0FeSum4UUHWc671d8syGVNGuBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCF5JYCTY1lZQy8QZBZuNbS+nNL1neUa/bFFIffrLEU=;
 b=Isx3XUcavrUgxSuMfkrdH0Lhe657Cgo6ydwVo/fhwFpWqs+ZAmlmI4TiEVK60RoLKiBRyXZwXz9XwbdqFEjTCBIGWJyjrgixm8GkvUd+IcPqterl60/j2p1r+F2MWD0d5fKERJysWCyqyPtDi5xP64jLR/0Z0mpthGcevky+GCcD66WSu6dzTQXAGlKWKxLYH4uJv1xhUNazp+XSmrxI7T0YShBS6idDw4iaMgVTnIjNwXFHQRIICSE5sNWVz2rEVz6HtcSUh0lrmERmMCWXGUdKqtpXwfrpjvQ0rXVbZ+SL/o0g8O0N1TW10fr4H6tL/Oe10tCO4WLY2l76k87I6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCF5JYCTY1lZQy8QZBZuNbS+nNL1neUa/bFFIffrLEU=;
 b=By4Ax5TBehZQBXN+049v7BOoC2KLeZfrekCSALh5kdQhbUKsGxb91BZ7LMlT7I3qeYpb2iYhVDe51snAW/MvbymRbmQWPI3ElG11AaxDVj9Vg2m+mbHLr+6EhjGwndQr8ct0BW3c0bnqGkQS/65ipAGjJMWW7s5eTDNMTh5+1Qs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/shadow: Drop dubious lastpage diagnostic
Thread-Topic: [PATCH] x86/shadow: Drop dubious lastpage diagnostic
Thread-Index: AQHZLMTJYmmsHN9huU+OUU/Zg+9KvK6nR7kAgAAQrgA=
Date: Fri, 20 Jan 2023 14:10:38 +0000
Message-ID: <139c1d03-2cd8-a7c3-4f79-fbdd5e85c712@citrix.com>
References: <20230120114556.14003-1-andrew.cooper3@citrix.com>
 <f530ddfc-8f97-b913-e838-58cc352f6372@suse.com>
In-Reply-To: <f530ddfc-8f97-b913-e838-58cc352f6372@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO3PR03MB6806:EE_
x-ms-office365-filtering-correlation-id: 68d0b339-93b4-4e46-6115-08dafaf01b7f
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pTEaAAA8hxDTnL1fBODVVLtwle+YxwF7DS7px3gRzFvzj/bQmljaKErQ+E+9Ky2U4fRm5P1u3pb4cLRB+K2qXuA9qgqbQGqlQGEFvVSG7F/RFTfkVVGr9afT7GedzA6Xb6i7tsH/tHsDSObuILroTA4kZVa+V8Um7ztIoQ9cC9ATImIAAeg2Ubm0ija3v868pRtZKt8Q/wwQx4cID8F1Xrgzc0mOsejca1vjyKk3Av/KtzFsJGrsOLAbfntae6HXuHIf2vEX7haegmq0N18xb0/9Jns3lBIxbhDZe6FPkGLvDVmhU8cGFeqoSWzI6wM6mismKImsE3EsDVOFD6+DFltvtkPma54aRks3f9rPz8OmqSKOaNWPPz0Gy0mHtTBeZ50WQ8wTRwgjz0WLk8QhOyIjZUP05vvuP4HGBZBWrBRxT0rBw7SiXG/wkVvejxNo8V+oAtQ+LuLWrmvwI9uiCTkHQMpcTIh9J0fLw5CJOmIzIaeZdGGwK2aNFE7PDP9Z3a477GssWdqqvIs4q7iH29gfCNlkdarHvJnJtPECPleZsIlXW4vaQ3S7vtNGW6Q6q4a0whKv8ZrW2e5Kja/qXCCwtxOP4KNorSa+xWC1kHBXM0zTAX6zZvWk9wW8k19GlRh1hpK970MONoiyGzgNxEOprsBggiDzOgHFN5B8hnE0U73chV/2MXRUk+lNJyklL6JkLXKQb4QDSzMg344XGEi6K0Q+fAxsYB7iFtSrCS2wTGZbgCRd14BBKSzYb9gZ94NO+8icrD2XMcAF/XxTmw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199015)(38100700002)(66476007)(83380400001)(82960400001)(76116006)(91956017)(66556008)(86362001)(64756008)(8936002)(122000001)(2906002)(31696002)(66446008)(6916009)(5660300002)(478600001)(66946007)(4326008)(41300700001)(6512007)(26005)(2616005)(6506007)(186003)(53546011)(54906003)(6486002)(316002)(38070700005)(8676002)(71200400001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ME85cklrbWd6a1hhaEFQNHpFTmF3WlJLQjFuamkxZ2xnZ0oyNWlkd3ZMUFpZ?=
 =?utf-8?B?TjFxY1c1cUtIVEZid1Y4MDJNd3hmRFVOV1ZaNWxHd1JGWmdwQUI0OXBvLzNn?=
 =?utf-8?B?N2FxNnJWVzJnZDZwSm1rbTJhVlZHbkRBSU92VFlhdXIvNzVGRll4bmdTbXZC?=
 =?utf-8?B?STZ4c2IzRTRxenJOTHZlL3luUE5ZOW55aWNWNi9Eck1LRnczbFRUWUtYOFV5?=
 =?utf-8?B?Yk5wOWowRjVJK0VzTlRoS1duUHYyVnJsUGorTllkcjc0SWRJcmZSUmd5b3R0?=
 =?utf-8?B?V1hqc1BVY1pRWkdob2RtTEpJMTNDYW9LZkdoeUlTSU5uNW9VQU04amg1OEx4?=
 =?utf-8?B?cTY5RnU2ZVJHUU05YlBCTGt0am1MV0VESkZINWI2MStOcklHNnM3eVg3UEMr?=
 =?utf-8?B?dndrSy9ydThGa3IzRXRPZG5IL2lqbXBZRGZ1OTdxd1oyWU5QUUlRSG9JR2dY?=
 =?utf-8?B?Sk92OXJMNFdUVnpuakRNK041VlRUNnBudDhzOWJURW9pd1Vyams2dG40REJR?=
 =?utf-8?B?akZlWkphcXBIN0I4c0JpK2doc085ZGE3WmdOY21mYlVSNUpzMWtlYmZyb2sx?=
 =?utf-8?B?N01pTGdmRWwvd1p0Ymd0L0pRM3o3eWJZMThRcmd0R1VDbjZWRVVxcTNiR3hv?=
 =?utf-8?B?MVNiSjBvRkVZdmMzbVBBTS9TUVRGNk80MENKV1R2RDlBcVpoU2JWZm42SDNV?=
 =?utf-8?B?L2ZXWmlBZndmWnpIL1JERk9TRk5rNUI2Y3RHMUlHbDNYRk54SEJ2cmpHQWZH?=
 =?utf-8?B?d0xFYk82U3BNS2JjTHU3ZTdFaVFvVHJVVXE3K1hOQ2xGWkRhalg0d2JjbkZS?=
 =?utf-8?B?emF5Y25rbGhOVzJjUExlUStESGRhanMzczRDQnYxQnhXekVtbUsybnRlQXFH?=
 =?utf-8?B?aG41eFZTVS9KN2lGSzU0S3BaYmlmcVJCZnY2Z3d3QTlkWVh2UzZrT2Vod3BF?=
 =?utf-8?B?dCtsclRLNHkraVNZM1VvcVVMZnl3cjAvQ3lua1dBM1BYZ3FXY2lvZlBJQkxp?=
 =?utf-8?B?OU11Wkloa0JVcGhuRS91MXk0b2NDOTkyN1YwOVB3VUpoWFhMMVByelRDeENM?=
 =?utf-8?B?N0VtcWNyVTJwNFVXTmxsNEJjL25XK2dVdFVDSkZxTXdzWFdlZWlldjY0L2FU?=
 =?utf-8?B?NUlMTEZHZkhxN3JSSFVpbVZQeWNZVUhTeG5MR0dMOWIrdXNhbXBzL09uaHFr?=
 =?utf-8?B?WHpZT3NwQUFPR3NyK3ZPejIxcnNIc2VuNTNyaldoQnpsKzBTUEJqREo3TFY2?=
 =?utf-8?B?dXowRFhIN3dXOUJqcWh6eTh2bFlTM2hrRmtlUUxlVTFnL252aDNzL25JTmY4?=
 =?utf-8?B?elN6Ni8xcFJ3cVN0ZlhQL1UvSmQ4SGExSUVYVEgzSTh4UmRscWdHSkUrWWJm?=
 =?utf-8?B?dnAxRkJ3ekpseUhqbHJUQjE5enJkUXlZWk5LY0xJcHloNG5XekN5OENJUTVU?=
 =?utf-8?B?YWpiTU1vUVByMi91VTQwOHV2SjBMamRZdnV1NTYzTnNWNkJMbG5SWjc0WE5R?=
 =?utf-8?B?SHpJczZZNzJjbDlpYTBkSGtVN2ptQTViSHVkZ200ZTNYcm5NcHhYcGdxM2Ev?=
 =?utf-8?B?MHkwT0dySkZzQ0hYTjVGcHpjWEhIQTFkaUQ2ZURXcFBxdWJYQkVjQkpva2Qy?=
 =?utf-8?B?cElGKzNudXhiYTZwUXhqQWJIYzdHMFJKWkNNdTlkelg2Nzg1REgwaExOemVw?=
 =?utf-8?B?ZGFvWlFNbDZ3ajZiQnBSd3hHNTZTNkFFbmhyMk1KSXZJczRrUGhaejBpRnFw?=
 =?utf-8?B?VFEwL1F0MlFWWkNTd3B4aFVXSWNrYmZSTUUrczY0UVdMVEdObzFpdk9sakFl?=
 =?utf-8?B?TnpZVjNpNEZXVlVSWGpISEFmY3kyZ1lyZFFQc05TUHRISmJhR3VFWlZNbGMx?=
 =?utf-8?B?UWo3UUNkL3dmL3A1MmhzZjk0cFVYcGEvOGRnbDhkbTRKRjN3T09UbTBWbkhq?=
 =?utf-8?B?UXNidk10aVFOWERoNFdjR1h6cUdLb0lIcmVjZ3R4SnZ6cXlLSW5abDNETDNU?=
 =?utf-8?B?bXBsYlNycU1WeUdudDZTUFRNTEYxRndWcnA2VVdpc1FNQ0VpUEJQSERmRitC?=
 =?utf-8?B?Rjl4QUMzVkVjdFUwNnhUNmtTQytJNHBtZnp2RXJUVlFnREJOeW9XT2xmOUFD?=
 =?utf-8?Q?C6IH48rE7E9ldetpU8bUVaSmk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EF3E3B2935564439EC8419E11477965@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WHUM2Z0573CkkLGNhxPO6lCfgyPZzv8i3vqLM68nCUVjbvxEqlhvn47b32aFgKim+sz97/lyAwoDOdKNw4O7jFXU4D8Pi1Ki1K3DO3qNzdLV86rMx3kgPLfKr9kkL3WE2i1kLMw3qeL44Ud1cYYxl724WdDZdqnQoqg3uTc3kOZqGj2qHCw1UXvuTRiLjOyqUOryEPhTE70nYEebxz/5KAhlrYSSGjjFAsFuI8+bWDY7JsAvSzn0vpYMVB5L8y6RqRIxo2KEXrgwFdkvmFy7XzqymxPwESb2IUEjZLvc3vRd+L1fwrBT3VcTG0batV2LcIrivSk5DKJYFLMFl/Basrs2qTDQxYl0WdAFA+iQglXwx0zjIIErLQzDYQ62vRZO9zxhs6CzqhHXpo1ON0gALk5174td4/9iHxK58Genh3IqTN9EVCFCAWaqztNTprb9o4nXE2/KZ0LDXitwL6nttH8DgZCMzm3QkecrsZ85x24vLRbcfd1g0Ju3wuFVY0Mfuam97hut924TWgHqGPo/f/rMn+qTyHZ9AhffF/v9UN2rr9uHObGQ6z2yULzStaZbFvypTBmgKj8zZ9omm1+KQTT9vDnEFX+CX4+6do6xg1ML0ZbXa3hCMxcT7YfGiFs3vzNsj/YzVTwedMioLACvxmN7kH55B9RPdm3HZa5pRd6rtl25nQs1Vmb3KTSspcwrCqOG5qmfvHkCrMt38O1jJfMJx3zOUw9sgDHlx3IJU6AXYWD9Yq36hHbPQwppU4dPkvN5uZsZhEJ8a33TH6TBfSsnVjBxUIdTfvj41MLJOPHbyp9ct5R9d053bmJ06oJO
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d0b339-93b4-4e46-6115-08dafaf01b7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 14:10:38.6305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xHkhcrrfct347tc8pPokB501T6BWWIxbxojewTJ3rsFy5jFhYU3bUEdUFUOKVWYQQpxaTP212ZY1xocZ/pIz8pEnvBwDOzplUopqmwSrJwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6806

T24gMjAvMDEvMjAyMyAxOjEwIHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjAuMDEuMjAy
MyAxMjo0NSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IFRoaXMgaXMgYSBnbG9iYWwgdmFyaWFi
bGUgKGFjdHVhbGx5IDMsIG9uZSBwZXIgR1VFU1RfUEFHSU5HX0xFVkVMKSwgb3BlcmF0ZWQNCj4+
IG9uIHVzaW5nIGF0b21pY3Mgb25seSAod2l0aCBubyByZWdhcmQgdG8gd2hhdCBlbHNlIHNoYXJl
cyB0aGUgc2FtZSBjYWNoZWxpbmUpLA0KPj4gd2hpY2ggZW1pdHMgYSBkaWFnbm9zdGljIChpbiBk
ZWJ1ZyBidWlsZHMgb25seSkgd2l0aG91dCBjaGFuZ2luZyBhbnkgcHJvZ3JhbQ0KPj4gYmVoYXZp
b3VyLg0KPj4NCj4+IEJhc2VkIG9uIHJlYWQtb25seSBwMm0gdHlwZXMgaW5jbHVkaW5nIGxvZ2Rp
cnR5LCB0aGlzIGRpYWdub3N0aWMgY2FuIGJlDQo+PiB0cmlwcGVkIGJ5IGVudGlyZWx5IGxlZ2l0
aW1hdGUgZ3Vlc3QgYmVoYXZpb3VyLg0KPiBDYW4gaXQ/IEF0IHRoZSB2ZXJ5IGxlYXN0IHNoYWRv
dyBkb2Vzbid0IHVzZSBwMm1fcmFtX2xvZ2RpcnR5LCBidXQgImNvb2tzIg0KPiBsb2ctZGlydHkg
aGFuZGxpbmcgaXRzIG93biB3YXkuDQo+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KDQpUaGFua3MuDQoNCj4gd2l0aCB0aGUgbGFzdCBzZW50ZW5jZSBh
Ym92ZSBjb3JyZWN0ZWQgKGlmIG5lZWQgYmU6IHJlbW92ZWQpLg0KDQpJIGNhbiByZW1vdmUgaXQs
IGJ1dCBJIGZlZWwgYXMgaWYgdGhlcmUgb3VnaHQgdG8gYmUgc29tZXRoaW5nIHRoZXJlLg0KDQpU
aGUgb3RoZXIgUk8gdHlwZXMgYXJlIHJhbV9ybywgZ3JhbnRfbWFwX3JvIGFuZCByYW1fc2hhcmVk
LsKgIHNoYXJlZCBoYXMNCmhvcGVmdWxseSBiZWVuIHVuc2hhcmVkIGJlZm9yZSBnZXR0aW5nIHRv
IHRoaXMgcG9pbnQsIHdoaWxlIHRoZSBvdGhlcg0KdHdvIGhhdmUgdW5jbGVhciBzZW1hbnRpY3Mg
KGFzIG5laXRoZXIgZXhpc3QgaW4gcmVhbCBzeXN0ZW1zKS4NCg0KV3JpdGluZyB0byBzb21ldGhp
bmcgd2hpY2ggaXMgYWN0dWFsbHkgYSBST00gZWl0aGVyIGRvZXMgc2lsZW50IGRpc2NhcmQsDQpv
ciAjTUMuDQoNClJlYWQtb25seSBncmFudHMgcmVhbGx5IG91Z2h0IHRvICNQRiwgYnV0IEkgYmV0
IHRoaXMgQUJJIGNoYW5nZSBiZXR3ZWVuDQpQViBhbmQgSFZNIGd1ZXN0cyB3YXNuJ3Qgbm90aWNl
ZCBiZWNhdXNlIEknbSBub3QgYXdhcmUgb2YgYW55IGNvbW1vbg0KdXNlcyBvZiByZWFkLW9ubHkg
Z3JhbnRzLg0KDQp+QW5kcmV3DQo=

