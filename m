Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E445EC7BB
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 17:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412776.656221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCX9-0001db-N7; Tue, 27 Sep 2022 15:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412776.656221; Tue, 27 Sep 2022 15:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCX9-0001Ye-Jc; Tue, 27 Sep 2022 15:30:07 +0000
Received: by outflank-mailman (input) for mailman id 412776;
 Tue, 27 Sep 2022 15:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0TW=Z6=citrix.com=prvs=262f03aef=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1odCX8-0001X1-5v
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 15:30:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4107f47d-3e79-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 17:30:04 +0200 (CEST)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 11:29:54 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5470.namprd03.prod.outlook.com (2603:10b6:a03:287::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 15:29:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028%6]) with mapi id 15.20.5654.027; Tue, 27 Sep 2022
 15:29:48 +0000
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
X-Inumbo-ID: 4107f47d-3e79-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664292604;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uMXi0bGHAb5W7L4hm1OHdo6mSZbqBsXexQEA570BK+8=;
  b=G+TSnULIzmh3ZKD387PW5+lzv7kuhEbn67QesU2lzyXKXxE2q8l/6hd/
   xKqaWIY2vc/Mn5y+bXSq5iNF78eAHG+00l4DbwPVJQwq3Hlu+4Dn5vdmo
   jS+tIiJLeEgfueoKQwEHDCXKDrK183BkP7uRt4OSHIjJ0S2mLbDY3LFHb
   g=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 81107865
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QPDup6q5lAr5EA+ijGib/jfN3k9eBmIoZBIvgKrLsJaIsI4StFCzt
 garIBnQPv/ZMTfxeNB1aoy29U0HvZTcmoU2HgRvpSE0F3tGpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+55wehBtC5gZkPaER4weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mx
 ewVOm8rRUC/pN2zz4qhadFOl8goI5y+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+eF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJLTeXnpqA36LGV7kIVDEwpXlu2mtnniEemfc9gb
 HJL8yV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgcqfiIPUBEE/8jLsIw1yBXVQb5e/LWdi9T0HXT6x
 WCMpS1n3bEL15dUiOO84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComVvlhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:iYVGa60WamEiWUEJW/WH9QqjBRFyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEg9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyjpAJb4RGIFqjgpF5d1H22xa1O
 UkZC1QePib3kmhPF1dZyGdnTUIngxeskMKgmXo/EcL6faJOA7STfAxy76xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMIjgZJq3PsiFXluYeE9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonNrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUBzaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTObNSRP5uw/zvngehTPYd228LAu23FQgMyNeJP7dSueVVspj8ys5/0CH8yzYY
 fABK5r
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="81107865"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRYzW2xIQeoOI35tQ6kOFViTmewqJuzWs0xqyHa7ocL9qRnnE1yajfGiYDEvO2FYHzw8gi8z3wqEHuDB4xsDD9BzvQnuK3xBSBOzTrvhBd/IUYmDGWskovh/a9yKx37BYAx+tvplPqqU1K4Xmx9+ZE/wzlebYoRAoba2qJQZehZGiz3SB0R08SgSVIfGPDZTIUMfi+P9VYSDAKOzspjAEmARDybexN1HheHR1TbhyfyhL2ANreDXjZSyiPMLAD/Oh0NkOKvJm50Y+EX93uIILDkAJupG20tGOo+iSpNpmBA1K5iLnEwztjjuQMm+hrkWYQ7yBl96eA29oufUbAAcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMXi0bGHAb5W7L4hm1OHdo6mSZbqBsXexQEA570BK+8=;
 b=bayZzdYg9n6K0PzV/dp50eLXMEk7EdutD2ekldYou/pbQ4glWpTF8nZuK/VndHDNJvqFo9uHX88uy85XmL+6LxNM1Qtl8M9hg5mSOfzJ5rtaHaGdlsql+UlyQbCy33Y5lXdgjhVc6Deh+mrAI0j0UjD6EKpojC1WG9mRYLg2bVRsCYWxeh5vMxcjtLnKcsu1pTpfokk9i/+nlhynMRbVgu6VlCcAh/Nw4j6HVbQMPSNk24K2ISojo8R3KpQTiV5fjAsV0YtSOZaKSrzQZ26t2Z9HYj+uVl/+c12+QmAX0o3mESe2L8bHCSC7uVn6sHg9d7wGYNFIV895Fa2m1NM9BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMXi0bGHAb5W7L4hm1OHdo6mSZbqBsXexQEA570BK+8=;
 b=hkxgm1LdEXdTK/z7T06+E3D2/LECccr4034+hqwB2rdlN7k2kCTpWXqX6WH8LouMachw+WAXGbeHBQN4Pa81YNm4H4eLyC158RY0Wazbb+hZ8up1Ie4BS3DiYU/f5UdVYQ3GF/WaRDbRagIQA7xKsVPLZ+eq85Kqi5tsToOZG+4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Xen Security <security@xen.org>
Subject: Re: [PATCH v2] x86/PVH: restore VMX APIC assist for Dom0
Thread-Topic: [PATCH v2] x86/PVH: restore VMX APIC assist for Dom0
Thread-Index: AQHY0Y6R2RqP3BeGlUSjwNPrepH9Hq3zWOSAgAABmwCAAA5YAA==
Date: Tue, 27 Sep 2022 15:29:48 +0000
Message-ID: <71166f75-d44c-775b-58da-f5a8b7223839@citrix.com>
References: <59767cf0-8b1b-4418-db31-6b711518c044@suse.com>
 <YzMJi3q7fNIiWL8P@MacBook-Air-de-Roger.local>
 <ed906c15-692b-ca28-5b41-5c40ae9d1131@suse.com>
In-Reply-To: <ed906c15-692b-ca28-5b41-5c40ae9d1131@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5470:EE_
x-ms-office365-filtering-correlation-id: 904e55f5-013f-4926-3452-08daa09d1d58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 N9dPjAmPZoJoAGs4ZtixvDAxbDm+j+Brk6tkc4qlBQVjksd4tuvkslokK0m29HZDrdRt36W8Y57heQk4ZtRLJ6b9t9D0g/dD/pj+HAPaInK2HtZ1qtdv0YA6BVPsbUHsHiBuC1Qa24Fjj3qRHsPpPtW0jmYwnfWO7jPRaVho5Iyo3/8705hL86GZILATQTX9fT9SS6xExSRBodzuQFdN+AONh1SMs4SjdwFbLJuiXdTzmXYHHPYK2+Yslwc0m6525LwPEaLOp/TV0f9nqxmX/nvZ/QV6H6GhvuDe7a/1eZ8udubV963vGcTarvh3xO3D9wYmsvlqUu0xtb6wrnZdkcosGlwaiMwLcPnQ/jypD9IRiyQffxYPVgs7jFagxEd+gKpdxBbUaRUs8YRbfJpI5RsLECbkyOcUbKtyoPvZR/EKYsX7JzxtLhqPb1F1cIYkU7Ok4EwcLXwG8JWaVU4sMTX2jBXEaFLmoR2/j5I8UmFbzjenp9pu1Kex8HaZSQ3X0z1c2t1fpwm5z/RBjCMg5PvuIaRR7Xg6bjX7gY7rghdFtseBejRTzv9r3n4Ib0mmMPY0WBWsV/uesSkEbyiOLdOOi30YrNY+JrqrjQ2GvEskFqrNQLNAa8L7anEzg5bhHEb40L+53MlK7+BBSu+FwNDZQI0wrNeIKpLBK+VmmqZVPdKpJndyY/E/N7dDuD4cOEfh0Ol1IVSypr9Ovo/UfhGjXyg0jQ6xmvVlKiHIJe5ajUrm3mRUKvGlPeAoCSs+Pw1Ui1aK1o/memBQu4njSZroDCN5Bq+0kxPeUkTlwaRgDSpngK39H1mdhpSkaiOUgdQUgkkYmJY4njHs1b1Z9w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199015)(83380400001)(71200400001)(186003)(2616005)(31686004)(6506007)(110136005)(2906002)(54906003)(122000001)(6636002)(53546011)(6486002)(38100700002)(36756003)(26005)(478600001)(8936002)(5660300002)(6512007)(82960400001)(38070700005)(66556008)(8676002)(4744005)(91956017)(41300700001)(66446008)(316002)(66476007)(66946007)(86362001)(64756008)(4326008)(31696002)(76116006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUd3MTBhRjcvZmMzalppcDhsQUp2WHIrUDNUTjlkanRLQzQrb2FUQUhpZU90?=
 =?utf-8?B?SmNKRVNLVXNaN0pnaVE0eExlemN3emFVdVp3eUZWSGF0eW9CMzhJY3VwWENy?=
 =?utf-8?B?ZlJMVDN6M0hrQ2w3R3U2aFJyd2VVWHd0ZDRPWURKaUMxWkJqcktGckd3UE00?=
 =?utf-8?B?TmJqSjQ4YWxEYjVPU1doaHpsTTZhcGFzdXk5b2JQR1pYNWRMd3JtTzIvMjd1?=
 =?utf-8?B?N21DazlDUDQwZ3ZyVWoyQnZMTnk1SDl4NWZRVjU0Lzh2RnRpZURSK0tXOUlJ?=
 =?utf-8?B?Zy9aMFZFN2lYaVZRWktNdS9RTEtNRW02c2F2WGxLYU55TzhJNkFmMkxlY0M0?=
 =?utf-8?B?eGZmRXdmM2dUTi9va2pzWVFFcWcydUdaYTFYeURwYXdKZm8veXlnRnR2OVly?=
 =?utf-8?B?S1cyaWxMV0lXNXpXdmNyeGQyc0NodGdlcEhzK1VvK080VkVsdjdybXNsV2tn?=
 =?utf-8?B?dG9Wakl1a0pHTFpUL1Y0eEFURE0wS2tJREl3eHc1OVVZWFZKc2lJNm5ZZWRl?=
 =?utf-8?B?MnRIQld1cjNvVDY2elFUc1k0SnJRamwvUC8wZVRxMUZ5cG40VjhEV0VDbTg1?=
 =?utf-8?B?L29HbVMwY010YzIzWWxNOGFacTBCVUpoNS9aaTYxc2dZaW1VSVlXbzE2N3N0?=
 =?utf-8?B?K0NpRWZlYy9pWlV2aktXbkowQ0l1ZXVTUTNmOWp3UmR1SHR5ZklZcngvTmpY?=
 =?utf-8?B?dmE4bFU4ZEpqdnN5S3ltTkFpNERhTVVqUCtXS2ZxNmxySjVoL3pWK3lnakQ0?=
 =?utf-8?B?bi8xeDlMY2VVMG0yZUg1UGFTVlJwN1l0VFVlbTEzWi9zeTBPT2JiVDR1cTdO?=
 =?utf-8?B?KzNHckRvd3lRb0tuUnA4TzhONHBFcVlVS0hMQmJpajQ0U0F4SXBSZVFDV3B3?=
 =?utf-8?B?cXZvNDVtWURkTlB6N2kxbkRlTEx1djk1bzhjOUdnK29uYVF5QWZyKzNDUVJ1?=
 =?utf-8?B?a1o1WjFOMkl2Yi9rVUJ1U0JLY3d1RjJwOEVZSVFnWEZLcUZYbGppdUkvcUtN?=
 =?utf-8?B?WHpYSk80cWJ6SUdLc21HR1ZjejhDbjliN0YwVXdGdkFyM3grRm05VC90SXpw?=
 =?utf-8?B?aWFKeWdGdVFoN09nK2NObnJ4a25JUkdia1lBZUlvMXlxdWpOdHpkbE0zV1BW?=
 =?utf-8?B?NEZRWnZLSmhMSEJ2YitkYUdTUnJjZmpXMWkwSm5jWXhya1FZeDBCeXFGR3M2?=
 =?utf-8?B?R3hUZnpsWis5bzQ2cUhqM3VGaXlwTnVFS216REo1TGFRclExcXQ2dzA3Tzcx?=
 =?utf-8?B?MWVRWFpFVGJkWWVmeTBtbnJYUU1wODViMkFhMmpDdlM1VTRMYVBoYklUbmlv?=
 =?utf-8?B?RENBY0hnbktoUjVoK0d4SXNsdjUvdW1IVmVNQXlucEZ3YjgwWXMrMEpjaVVi?=
 =?utf-8?B?NStLVTRrTXMyb1pta3VPcDBqbktmellVclpvQXBsMEM1cndvV1laNURtVVlP?=
 =?utf-8?B?QkVuTEZDQXZWWnNpejd5cjJHb2hBbllJSTlianJsZmwwUkpwRTRjRVJVdm5F?=
 =?utf-8?B?bnpvYXg5cE5oaW0wMzlrb3NOZll1Qmxxb1NrZDhXWUpRYkpjUzhiZHVtc2ho?=
 =?utf-8?B?TmtFdUtmWWJJdG9FZ0FQM0NBS1UvYkRNMTVwZVNaK2p3ZFJJb2lwTlJ6ZFF3?=
 =?utf-8?B?bmRYbWRCcGhIOUNqRXkzd2V5OUpDVkxUZGdSbmRjeVB6cVdueDNvek9BK2R2?=
 =?utf-8?B?Y3ZNckRwR1A3a21SYnNLVC9kamVmRm45UmJhTjA5bjA1cGg0Vy9lYm1JYkFG?=
 =?utf-8?B?Sk1zS2tLUjE0djExRXkvOTlpMFV3OHp2OW9VR3V4TW9PWXR5WkJ2SnB5Z255?=
 =?utf-8?B?aDUrSW9pd2tCNFpxaG9xdFFtRERQd3d1ODZpdlVJOElFT0RQaTMzS2QxNSs0?=
 =?utf-8?B?aVdWczVYRGJ2OFNjVGN4cmxseGs0OWhMUXk3MExsVlRpSUZ6WUVSV3JyeWxO?=
 =?utf-8?B?ckhHcWhzUHpIZFpDZlpTaGMvZG4xREdxTm9jWEJ0MlpCam1jZHFDbnNWbTQx?=
 =?utf-8?B?ckxIYmNTQVZaVFB4TE9JOUk4VHZHOTRPZTdaL05kYmM2MnJGMmp3VTBid1lW?=
 =?utf-8?B?WGhDdWN0THE3SEZtK3dCVHlwMXo4MHBaN0NkcEFuQ3NFOW5lYlp0US9aTDYw?=
 =?utf-8?Q?yCQ+LuUJs4xzBI8uVD0WnKLmc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34DE960CC63A66428DE3C1F71FCD2131@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904e55f5-013f-4926-3452-08daa09d1d58
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 15:29:48.8351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y3T/KKJCiSJVkO7r4bgxHD5VXaNT2jgJw6B07YhXl+Jr7Hfv7nE5hVEkU62j8uHh1w043e/G6yMzX8V55AbvqiYCHgjhXUepMHJOJNQCG3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5470

T24gMjcvMDkvMjAyMiAxNTozOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI3LjA5LjIwMjIg
MTY6MzIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+PiBPbiBNb24sIFNlcCAyNiwgMjAyMiBh
dCAxMTo1ODozNEFNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBJIGRvbid0IGV4cGVj
dCBpdCB3YXMgaW50ZW5kZWQgdG8gZGVmYXVsdCBQVkggRG9tMCB0byAibm8gYXNzaXN0IiBtb2Rl
Lg0KPj4+IEludHJvZHVjZSBjb21tYW5kIGxpbmUgKHN1Yi0pb3B0aW9ucyBhbGxvd2luZyB0byBz
dXBwcmVzcyBlbmFibGluZyBvZg0KPj4+IHRoZSBhc3Npc3RzLCBwYXJhbGxlbGluZyB0aGUgZ3Vl
c3QgY29uZmlnIHNldHRpbmdzIGZvciBEb21VLCBidXQgcmVzdG9yZQ0KPj4+IHRoZSBkZWZhdWx0
aW5nIHRvICJlbmFibGVkIi4NCj4+Pg0KPj4+IEZpeGVzOiAyY2UxMWNlMjQ5YTMgKCJ4ODYvSFZN
OiBhbGxvdyBwZXItZG9tYWluIHVzYWdlIG9mIGhhcmR3YXJlIHZpcnR1YWxpemVkIEFQSUMiKQ0K
Pj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+IFJl
dmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCg0KTkFD
Sy4NCg0KWW91J3JlIGJvdGggb24gdGhlIHNlY3VyaXR5IHRlYW0gLSBzdG9wIGNodXJuaW5nIGNv
ZGUgeW91IGtub3cgcGVyZmVjdGx5DQp3ZWxsIGlzIGluIGZsdXguDQoNClRoaXMgcGF0Y2ggZ29l
cyBub3doZXJlIHVudGlsIHRoZSBpc3N1ZXMgYXJlIHJlc29sdmVkLCBhbmQgdGhlIEFCSSBpcw0K
dW5icm9rZW4uwqAgVGhlbiBhbmQgb25seSB0aGVuICptaWdodCogdGhlcmUgbmVlZCB0byBiZSBh
biBhZGp1c3RtZW50IGZvcg0KZG9tMC4NCg0KfkFuZHJldw0K

