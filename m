Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2407A62C4C0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 17:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444345.699447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovLPR-0006sh-Qs; Wed, 16 Nov 2022 16:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444345.699447; Wed, 16 Nov 2022 16:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovLPR-0006qb-Nx; Wed, 16 Nov 2022 16:37:09 +0000
Received: by outflank-mailman (input) for mailman id 444345;
 Wed, 16 Nov 2022 16:37:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JCFo=3Q=citrix.com=prvs=3126b6494=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovLPQ-0006qV-ME
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 16:37:08 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e70143f9-65cc-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 17:37:06 +0100 (CET)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Nov 2022 11:37:00 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SN4PR03MB6687.namprd03.prod.outlook.com (2603:10b6:806:21e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 16:36:58 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860%5]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 16:36:58 +0000
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
X-Inumbo-ID: e70143f9-65cc-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668616626;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zbw9Px42LxjFB4IqGWtiqW+qJGi0zpfiyeXbEKAjx2Q=;
  b=SlO4UO8UGe9qeiLRJt/HxmEB7TTY8ZoFmurvcdfflf+tO1Sg2hs+H/FR
   q/5OJrCPlJiaSJ/Y9kKXMlPGevN6CAHwg43QlkOm/3mirnAls2DLcZN1v
   D7fNxecqWGXQMAYB3jAJUNISUwo4T30HLA2nhIeaN1+hMHyNJZdyw/ZHz
   A=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 87496799
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BDmO8Kh4PTam8HJ2Y81px0BKX161hhEKZh0ujC45NGQN5FlHY01je
 htvWmrVM/mOMDT3f4p/aN+z8RgB6pLcnYQ2TQQ5qnhgE3wb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QaAzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQxcw0SVEymhd6/+7GkYNB018YOcZLCadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGyabI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ROLkp6A10Qz7Kmo7BBkrBXzlptiC0FePVcMFK
 hc9o3oCsv1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebSMu/
 k+EmZXuHzMHmKaOVXuX+7OQrDWzESsYN2kPYWkDVwRty9v+pIA+iDrfQ9AlF7S65vX3Ezztx
 zGBrAAlmq4ey8UM0s2T3V3BmSPqmZHPQSY8/ACRVWWghj6Vf6agbo2srFLdvfBJKd/DSkHb5
 Sdd3c+D8OoJEJeB0jSXR/kAF62o4PDDNyDAhVloHN8q8DHFF2OfQL28KQpWfC9BWvvosxezC
 KMPkWu9PKNuAUY=
IronPort-HdrOrdr: A9a23:UuenOK2Igaw3kW0RAW3o6wqjBZpxeYIsimQD101hICG9Lfb0qy
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
 dGVD/vJN9Y5kTuQXP8iAi5YQKYRqU+x+MELEH3xZlh9GFWDPw8juE8syXI2uibbTtfr6cxYE
 xyZLv6j6LTnxjFwVr1
X-IronPort-AV: E=Sophos;i="5.96,169,1665460800"; 
   d="scan'208";a="87496799"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9rBgKCfCFdUjZi/gFEJyejaidmzp8GzKiV5foPdCLSM2GvfTA7Z7jAJGlFY1NnHcH/0oEfCzX2erpOd4Xs3VF5wREhBeWvkNbwUzHC43snq8Mu/3G019UW9Ci8cxztV0uiljpcJCw74IbWjug1DjOTRSOGkH+bKbvVSZWfmaohrVb3qxC0QZ6UGle9C07p3/8EbkwoauCfCKsBIUy6ggk0rZqV4z7qlhhvCsfHUf5SY09qs/lOIl6IS64aXCWhZ95upkzS6zfs2kUW7KZCqIqs/P/6GNWHc/e7G7J1hXS1QJ8cLL7+zWQeWVp+Dwsey/waEzcsZ9PvAvUneYud9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbw9Px42LxjFB4IqGWtiqW+qJGi0zpfiyeXbEKAjx2Q=;
 b=Qktq5Q0G9QN9N3eaCJy+MDE/2p9JsbKPGgaDfUt46+RdNl09gFd0x2HHbdlfif9c9p0tUhkwHoci1QDoD1aNJQGqFd6MWuQsuNMBP5CkthgXSIVXPj7ZFzlG82HK0bM1Rff5QQHgseCqADchpaDt3P3An7teS7cPexn6gmaL5JB/62692dWPWEru7ZWq2f9XZFDkM05eDl5SKt7n+cC/tHXmStogyZG5UznIWc7PQo+Msnnj2aPdwLONVpz64eHwVsi658uTCDMGV9subYkMUB6P8QjH2Fz/ScVMTRZpMJK0iSzR8/g4JyXHmwJxNDM2wgWBmY9sBdqB0vMkNA0s6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbw9Px42LxjFB4IqGWtiqW+qJGi0zpfiyeXbEKAjx2Q=;
 b=rXmZ3tFIovNo8hEVK80bc/CuUetGDObmHl5i6gDep4A5S1gAY/QgdfU8EL71++EN18efKamShIFMB12w8rtb33ADE1wPNhIOBq4T9FTbqc+xXy3kmuXaf0C8xhrbCtBplRY5VEUB/OjoiE0iZ0mBRRQjYptXzMchb717Bw85R4Q=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, George
 Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH for-4.17 v2 5/6] Rework COPYING installed in
 /usr/include/xen/, due to several licences
Thread-Topic: [XEN PATCH for-4.17 v2 5/6] Rework COPYING installed in
 /usr/include/xen/, due to several licences
Thread-Index: AQHY73rOgdQ+1dfJGU6Fms0w6mCdf65BwLkAgAATmoA=
Date: Wed, 16 Nov 2022 16:36:58 +0000
Message-ID: <80e6cfe8-1089-15f2-b294-11c9c3af763a@citrix.com>
References: <20221103115204.49610-1-anthony.perard@citrix.com>
 <20221103115204.49610-6-anthony.perard@citrix.com>
 <fb59dc5e-74fe-15fb-0899-d2f5bfd8343c@citrix.com>
In-Reply-To: <fb59dc5e-74fe-15fb-0899-d2f5bfd8343c@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|SN4PR03MB6687:EE_
x-ms-office365-filtering-correlation-id: 45b635df-1ddd-43ef-d97c-08dac7f0c796
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xrjSlvVOKYOnucb5aP1Y+hn6ahp8jCw0U5OwOUr4z4H8M/1/BZx8cFBM7BAi1tg0a6+4WuI5oBBgEg3UYQNo2EOyqm68+b5CAxf68OZ9Ps5mUOgTcKWlbftWb+DqxEDPnC7sT/enmXholk/khWcKVygazgXTe5f1FnHLED5/t/xqedQTWyUg9eHfB4qPHcVBG3w2Z/ObAO1RCiUf18PR9/eZPUIoC9svmidmxTuNWeXmUtgzZJwfnXXYwh8B/4DUxkQplOsa0JapvHwnsuxM2aZ5cCfwGI7ZNuHP6/tKbnvJDl0Uqq3Ah+Yv5SNpVFtP/ZBSBoOFRKTSfWWHipBCB9Pzch4rE/6/giZbeIUscuxooELmaTv4jJKG2nALIEzaBGwqGljvjssIbVhmflQzn3MMPy+BVxUd6XFEHWDy5VDZaDW8RKpFoKleFtYP9v6rUqUnAOVwdzSac8h68zMZlFuxaZvBL1M5q4Nwe7EQFW7bq5cTh+Z1Dj07Xv4iw51FiTZeIvQIRhVp4FsViJ6oSQJcKZcV+NpG2KazfhYwsaFCI1KCjTMD4MEyvSsdAHKYI/KA/5BRMgLt4FtVYNiKwO+jELyI9vfuyqzYklLjtzjZcRqD2nUfab5kfkUYRuVc9Q8+CpxBuGYvrWvoJB6m85VWJay34ZLFQQHWCcb9kzDf0TlGrWUVumpl38Dyi5Bj7vKXz5Dc74aJpoZolyiNOTyLV40i/G20xJl4Dyzt/xhp+CNwPzRBhwssH45B7xKqPKToxNxM9uWGDJVCt8k+bGzMjNPLpy84dhUJr+iXaT3dy+YrBQvTChkjMnSq5AZj09MpysSmHUI8xHQpIUc2Rw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199015)(36756003)(31686004)(122000001)(38070700005)(38100700002)(4744005)(2906002)(41300700001)(83380400001)(31696002)(86362001)(66476007)(64756008)(8676002)(316002)(66446008)(71200400001)(91956017)(76116006)(4326008)(6512007)(26005)(66946007)(66556008)(110136005)(6486002)(54906003)(186003)(82960400001)(8936002)(5660300002)(478600001)(53546011)(6506007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q3lQcllOZk9qN2lSUHpabHU0TElGOFRLVlBSbEdnVXRKY2t1Z0x5dDIwa0h4?=
 =?utf-8?B?UW5xOFRjVG1xQ3A2cHJMcXBaY2hlTitGZzl6ekNwbzFtVitBa2NBc2Z3UnRp?=
 =?utf-8?B?NHNzeE9Hb2o4aEdyd2JNK2RGakdrSzYyalNEZkVwSkM5aXZ3NUxLL1h4a0JT?=
 =?utf-8?B?bFhpSk5LeXVvcDNGVFAzZ2ZVM1MxaTFNWkw0MHYzVkJrcEFsR2VadTh0RjFY?=
 =?utf-8?B?QnFpbmhsRHlZZnNGVkdHWlZXSVhaSUpDenBmWDdYWHQ1emNYRU5jYjVMLzUw?=
 =?utf-8?B?cUtweVh1SzRNQndDblVWQmVHbVBFQTFwaGhBVVFobUZLSmhuZWNDZGhKT1li?=
 =?utf-8?B?VThtMWhVajg3T1VnUk9USnMwMGhJQzM0K1BOUktncWpMMVUwV0MrbVQ3Y1Ey?=
 =?utf-8?B?T05NSWxQQWppS2NjNWNkT0VTRXRjYm9QQUpicGR0Qis2L1ZYZkR1S3YvWTNt?=
 =?utf-8?B?eVNheW12cEVlejQ4L2V0WHFrMWJRZUdtN3Q4UGJCR0JNT2JnSGJ1NXFWQWk4?=
 =?utf-8?B?ZkI0Z24rVWFCanc5SFBCbXQ2Yy8wWERVdmdGb2hHUDdnYURsMUhLTWQ3Q0dy?=
 =?utf-8?B?eUZkYWJHb0tDM1duWFpJNmViczM4OUt0NkVHdkhvVzEranFjQzN3U3d1R1pX?=
 =?utf-8?B?RnZLd2ZaRXZBZjdzRlczclFOSG9XQW9ZSFFheFpZZ0VzSHJkcGEvVDIxQ2ho?=
 =?utf-8?B?TEZCelBtS2lGMU5jbW1VYUQ4S3ppRjRVV3QvamxmdDY4T1E1Y1l0YWh3NVBY?=
 =?utf-8?B?VU5ubzZTVDBaaFBPSW5KVmMxb1ZJajhIaHliRzNlWEdOOE1XM1dncDR0NytI?=
 =?utf-8?B?djM2VmhMOWdmM01mU2NMajUxMHQzV3ZvTWJJRG55Y2MrMU5hZTM0cEQ5VzVF?=
 =?utf-8?B?RXFyamtBbnYvRjlVdGV4cUFueGh6aUJzU0RwTjZlYUlLV0NFSVN1bEl4Z2Jk?=
 =?utf-8?B?MDVlc0svaFMzc1RhdHp0Q0dWdlNRT2Z1eTllcGhnMlllQXRadnlIS1k1aHFT?=
 =?utf-8?B?K21jUWJCeGpGOW1JVXg0K213VFJZNkZtSzQ2c3JHRkF4dHFPUG9hRXBIWXkr?=
 =?utf-8?B?UkdPZHJNNFltVFJYV0NhVVAveHpJd3BRaGppV0gvRmxndzh6TStid3FEN25R?=
 =?utf-8?B?a1VUOEdQbG83YnU4SmlxSCtBVCtLY2ZROWJsSGl0TlhFV01vT2lZWmg2aHVW?=
 =?utf-8?B?b2xOdVVDNm1OdVZWa3YyOUYxVHlCZVYvUFJwRmE5MG9kMHh3QUkxZnRQOWx4?=
 =?utf-8?B?NVR6REt3d3RYajUzb0dMN1JtMDNwYm9jdVhnRldZQlZkNnRYdStJUDc0aEha?=
 =?utf-8?B?bTJkYVF4d1hLcno5VVZ6eVhzTkRIN0s2dmpwM1dPSWtrbGQ5RDZxQXkwREt6?=
 =?utf-8?B?RkVONkQrSlJidHlPMFVTaVJvY08rR1JJU1UzSXJjNStEZzQ2WWFVNmZpRUR2?=
 =?utf-8?B?NmREYXp0T3BzOEZ5bG04WEQ1UFE5bFVrK0ZBVWV2Wmt6UHJ5enZOS1VBVHJo?=
 =?utf-8?B?cnJhTlJ6S2xtZUJFaWpIbGlPdEN0SjM4NkRJZDQ3cUloY2J6ckkyUU1Damtz?=
 =?utf-8?B?TFJINWFEd0MvcGJ1OUxobTdMcHcyeWl3TGplL3V4ZU5nbUlIUDhQMnZqWGJ5?=
 =?utf-8?B?RFBIRjFSL0FKUXo4YXI5ZjlJWXJQYm42TW1iTFp4cnlEbGJkKzVCL1JlNWdt?=
 =?utf-8?B?Y3hDUmU5R1FJWXVQTkZCM0Y3WU1SSFRSeXlBclAxMlhFd05LZVFIRkVscjdn?=
 =?utf-8?B?aDZQVm1lVGs1UUpNRmY5QmZ2K2ZsUWQ0QVhQeE5YMkpacW9vYjBvMnVyTEpL?=
 =?utf-8?B?VnphdEZabkdBOEJHc1RiUkE0K1ZHSFpEdGFnOFQzUEFDZVllZ1NUbWN0bHFM?=
 =?utf-8?B?SWlZUXFJdGlFbTZnUTBRZFdMcWNwdU0xV1NxNzdJcWhEeFFGUWJWK2tXdlRj?=
 =?utf-8?B?VzZCVDRSNklMdlBtRnlqRDlWVkd5VTRGUjI2SFRrLzZvNTJtVDg2d09pZmo4?=
 =?utf-8?B?RTAxQXNDTGpicXFMZUdPN2xpMHRiVUtDL2ptVGR4K3FDWXBldGx3S3VSaW9p?=
 =?utf-8?B?NW1YaEZqNzkvSFJsS2FER1ZRTVQvVHBobVBBS21WbE04emw1SjVHWDRDbS9J?=
 =?utf-8?Q?YgwcU1aEY5hpzLtMwK2gHfUWT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D17B32DE421F2F419F56D2BC58BBED78@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iOV3wOElaMaLIGmS5Lm6hXF4JB01zM+CNtq1LV+mZDNtW9MBjskjXlE12h/nsRn0KI/9Ctr/QMvNbAeTwLaCKccEOFdtx9J1SrJ3Bt4d6v2tjsDqNN2JQi+0tr+XkXURNwIKKRrCw2kcLDko3k2KnQ0zhm8jixkjWpr2uwS3KtSpSCiQuQTS65MckkcGIdi2GrKgLwgo+4oc35zBmPPIu7I8pUx0mit70JRIR9TiTQAW7XuJ4zdzOvh+DBt5OGTYQ266mA9KEk77BuPzpPmZTvdhgaWPnzPLdNii6PeVjLF8acrEHL1yDkDylaGyZFalkre9yiIaHpmsXXEWhrrW40gCEiXHSZbU+m9eZTdhKA3mCD50piqmIJdyDAxiAnGJH+VSNK1xVqoGabThtx2Xks5DZ3OeEaWcpIDI/CTyY9VnzKGaZpdm4r4DRl6v1SvEVeA44b3wpEW3rPWxGaPMSidMg4T9w/VHnA7lATZlOJXQj/0Ag8JRBzSijylE5J9+t5aiIS7Cm13Zz6ZP9MWKwsqjnT3f4D83J6XetHMyh7BydMUb2gG6ZMzn7BObBYxkhO3nDTprYM9FVYj5fKTDSE7K9Fh3TU8UFAjiWm6qddTJqofsdxbdAuvBmP+sffa+XfxWg/Px1QzEJHxm9/dcg8GvgyhSXUuw0zCOL94T3mMThO/nDMwP9u+F+0rXd5mBdR1NtzaLnQ/b96gYETppJj7AaG3MNKdBDRhsA88R0hBZvXZM7mfOC+7+NcJOie15YuLsqLxqekgLZ1tkbyTCPAlFsADVK2x4H83Kmd6T2XFPOI60SdJeUdgyqGewlh/e+jm3RRgR00ryS5zM7sSAwBccsdLBlhET+cs16bNOxWvDGcejpWbhxlZNARZ7je8Gdb5jBOGdBoOkF5CFthbJ9w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b635df-1ddd-43ef-d97c-08dac7f0c796
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 16:36:58.0664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fQIj79TxMc9A2GRVw7sFDhftb/0E/gwSJffyD3AZt0l5HXWwTMXdVHgwXRkGmS9Ct/6MV04MB+x7/Tu9R+RsTo3/idV34tRxuPSIAr/u7LI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6687

T24gMTYvMTEvMjAyMiAxNToyNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDMvMTEvMjAy
MiAxMTo1MiwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvaW5j
bHVkZS94ZW4vQ09QWUlORyBiL3Rvb2xzL2luY2x1ZGUveGVuL0NPUFlJTkcNCj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwLi5mZTNmOWI3NTU3DQo+PiAtLS0gL2Rl
di9udWxsDQo+PiArKysgYi90b29scy9pbmNsdWRlL3hlbi9DT1BZSU5HDQo+PiBAQCAtMCwwICsx
LDI2IEBADQo+PiArWEVOIE5PVElDRQ0KPj4gKz09PT09PT09PT0NCj4+ICsNCj4+ICtUaGlzIGxp
Y2VuY2UgYXBwbGllcyB0byBhbGwgZmlsZXMgd2l0aGluIHRoaXMgc3ViZGlyZWN0b3J5ICgiL3Vz
ci9pbmNsdWRlL3hlbiIpDQo+IFRoaXMgd2FudHMgdG8gYmUgJGluY2x1ZGVkaXIsIHdoaWNoIG1l
YW5zIHRoZSBmaWxlIG5lZWRzIHRvIGJlDQo+IENPUFlJTkcuaW4gYW5kIHByb2Nlc3NlZCBieSAu
L2NvbmZpZ3VyZQ0KPg0KPiBJJ2xsIHNlZSBhYm91dCBzcGlubmluZyBhIG5ldyBwYXRjaC4NCg0K
RkFPRCwgSSd2ZSBkaXNjYXJkZWQgdGhpcyBwbGFuLsKgIEFudGhvbnkgcG9pbnRzIG91dCB0aGF0
ICRpbmNsdWRlZGlyDQp1c2VzIGEgc2hlbGwgdmFyaWFibGUgc28gY2FuJ3QgYmUgcHJvY2Vzc2Vk
IGJ5IC4vY29uZmlndXJlLg0KDQpJZiBhbnlvbmUgYWN0dWFsbHkgbm90aWNlcywgd2UgY2FuIHJl
dmlzaXQgZml4aW5nIGl0IHdoZW4gd2UncmUgbm90IGluDQpzZXZlcmUgY29kZSBmcmVlemUuDQoN
Cn5BbmRyZXcNCg==

