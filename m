Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 071B350A75B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 19:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310393.527220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhauC-0007K4-SL; Thu, 21 Apr 2022 17:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310393.527220; Thu, 21 Apr 2022 17:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhauC-0007He-P6; Thu, 21 Apr 2022 17:47:48 +0000
Received: by outflank-mailman (input) for mailman id 310393;
 Thu, 21 Apr 2022 17:47:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5Hx=U7=citrix.com=prvs=10361b9f4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhauA-0007HW-N0
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 17:47:46 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 251bf6fa-c19b-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 19:47:44 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 13:47:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB4880.namprd03.prod.outlook.com (2603:10b6:208:107::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 17:47:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 17:47:37 +0000
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
X-Inumbo-ID: 251bf6fa-c19b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650563264;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=H2Qy3iqHX58/KgxoTbYDY4twNI1kkfoN3krCB9RNYNc=;
  b=WmItmNcUnCrUSNusPRMhYRbCm6rb693qxfiX4NlZvcFp8gU6uM4yGw6A
   DncPb/3pi1afXblvniVkdkOHFzu1OyMGx4UppSY4PMpPpWpbHx2Br5LbP
   +cBk1Tt4bevek2Zvr5eJjnsc9CTxEtjFCmXmM9gru2rBfl4+2dAbh/XFI
   Y=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 69639601
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KiMbSa5qKgfKS7tcU5gbQQxRtM/GchMFZxGqfqrLsTDasY5as4F+v
 mAYXW/Xb/uPYzbyfYh3atmzoxkAvcPUzYdlTgtqryo2Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTjWlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurTpQw0LPO7tmd42eBIDNyFAE7Nlyo7IdC3XXcy7lyUqclPK6tA3VgQTAtdd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfuUo4MEtNszrpkm8fL2T
 swVczdwKj/HZAVCIAw/A5Mihua4wHL4dlW0rXrL9PRssjaLlWSd1pDWc4Pyc+yUW/lpuUGW+
 3zL1WHUWxoFYYn3JT2ttyjEavX0tSHxVZ8WFba43uV3m1DVzWsWYDUUWkG8uuKRkVOlVpRUL
 El80jE1saE4+UivT9/8dx61uniJulgbQdU4O+8n7ACAzILE7gDfAXILJhZLZcY6rsYwSXov3
 0WQgtLyLTV1tfueTnf13omTqTS+KC0EN1gobCUPTRYGy9T7qYR1hRXKJv58FIalg9uzHiv/q
 xiSpTU6r6Uei4gMzarT1UDKhXegq4bESiYx5x7LRSS14wVhfomnaoe0r1/B4p59wJ2xS1CAu
 D0BhJKY5eVXV5WVznTRHKMKAa2j4OuDPHvEm1lzEpI99jOrvXm+YYRX5zI4L0BsWioZRQLUj
 IbokVs5zPdu0LGCNMebv6rZ5xwW8JXd
IronPort-HdrOrdr: A9a23:NGv+GqlNjM+EVfv5VfNinaokfaHpDfN1iWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SEDUOy1HYVr2KirGSjAEIeheOu9K1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge6VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPcf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcdcsvy5zXIISdOUmRIXee
 r30lAd1gNImjXsl1SO0F7QMs/boW8TAjHZuAelaDDY0LHErXoBerZ8bMRiA1rkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4YkWUzxjIiLH47JlOy1GnnKp
 gdMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Uol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+93JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9N1lVnQ6dvv22y6IJyoEUHoCbQBFrYGpe4PeIsrEYHtDRXe
 q1NdZfH+LjRFGebLp04w==
X-IronPort-AV: E=Sophos;i="5.90,279,1643691600"; 
   d="scan'208";a="69639601"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2iOjDXtmHJoVDOLMraNLgDBrwr3L7a0BjFetHk9ea2j57biSyiZaoX673Zb2Nlm1REdckGMFDK/okhWymUl9V9IEwkbCxlDIPpHoxD7FNz39Ud/NiuxnVgBqn6Zj0DTHjW0P37rrL/RHc07j3lHpGlggsd7DQrmxKTR7skrS4jZ95lQqMWAOa5L+1qA7kvSt26pRpZbII0BMTzk0cqyhWsIuIZ2V/HTckk2nlk3oBPeXQcOblv7RnmBGTf58SH3tXjoslfp+0Qrtamk3KPTwhrk4oJ7Y4gph/gpBlUz00cQFDKySbXGciNsEjniZPDNofZgp0IQUgbJyiQ6e9C8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2Qy3iqHX58/KgxoTbYDY4twNI1kkfoN3krCB9RNYNc=;
 b=L2IlsobNDiJfbwWM4kDgEg2jGoD4R87vO4vHj07W/Fd3nUcmwudimY5LfXw6hJH2wLIwCc4Y8nNq88BSqtvuDcQiPIYJ2hV7haxdrUcEcsD5Jd5UhSW/0+CXFtBkagq5pRJahEQzeNtamSoF0cCb+eZnIPGFvJOgKk0uzmOLmJxhykYwTTwVoze8xefxyq4o+tJhJpV2O0gWOPyhRzrEd9uWaWZNcSPs0h2hTWiZKxBk+2dPpsjQfwzOZ4R29sWwIvoecSp+O8r5H+cPXfB5LxlFheb2QvFzF6YufOL9AaFDG+v20i0wfVSkY3GOuW/G7kcummAeaSbwgl+Ov4Hbew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2Qy3iqHX58/KgxoTbYDY4twNI1kkfoN3krCB9RNYNc=;
 b=n19x1AB3VsqMki6c+tOnR6zwk09P2m1fMl5mD8r0rV87G7VSEnWfPlxGDOA+aa3aezgkSBIvcxbMzPdg3+w3F80ev0anLiUZfa2WWNXNfp8r3eVYLq4SsEGAv7/zHLDHePCJdTYSxu3YJ+8oW2wufGGXqyMvcX7zgZm6QAxzTCY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
	<George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] xen/iommu: cleanup iommu related domctl handling
Thread-Topic: [PATCH v4] xen/iommu: cleanup iommu related domctl handling
Thread-Index: AQHYVHuOvzYJLKPprEuLadRqUVZq9az4UhqAgAAC1gCAAAFpgIACUHUA
Date: Thu, 21 Apr 2022 17:47:37 +0000
Message-ID: <7f55e68c-17ed-c682-9ba7-4835d8e1a79b@citrix.com>
References: <20220420055736.27901-1-jgross@suse.com>
 <927d3bbd-64db-15dc-9bec-270711b9c1a8@suse.com>
 <a2489d58-883e-01e7-1b7d-0413b4006fbe@suse.com>
 <74f6105d-d3a3-6508-3c6f-3aac53285c5f@suse.com>
In-Reply-To: <74f6105d-d3a3-6508-3c6f-3aac53285c5f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b40f6f8a-d34f-450a-7042-08da23bf0634
x-ms-traffictypediagnostic: MN2PR03MB4880:EE_
x-microsoft-antispam-prvs:
 <MN2PR03MB4880CB82740F916D305343F2BAF49@MN2PR03MB4880.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7YgJ3FmqRV+gf1Nhq61Pu8YcHxWZYgbKTLIIX/ThR5Yvt/4EJL0nnZT7ySy6pAGoBnMk1MMx0qKs0ebeHGC7p8O1SMIwKy4+I5PTHkApTg8655u7jvP7oZW0Lss2elJp2xBvoN0ZvE6GZmV87g6JLisz1IPKt+JLwQbzroqCrApGFidErEsfXqnEac5GTDuI0jy5x7qp+LCKtG6kfcf6IrEw1lGly3XuesGOB4OrMDevdO37xIl+GpIT1rl4zsxGPovYCzQfxHbFRSHLXqV4UwfwpDXWMWbh93a5DEpIoIsqvQmM/3tAo40fAX6Xr2IjEE5Pzdq6FNERBmc8r+JiutvdoxMC40rfJ8uqDZec9/3l/COEU/x49KRkVJKpppRNzK49K/H0oTfdFdS9zABg7lMfXrTMUebGqb/y8BdrHUqQ6R+zpwCnkv3aYADTdkZIqc12nsLxMens7a639kQV4Fg6YoFevJIk9d3f4xXeynwYQxJe9vPaK1kukZhwBgWgSMXS+YMqSSZXzS1ZwOR68TERUTeWK4Ges3r9OPNBp+qO8fKPzgl22jtFjcU+dHHr+0LTRqky63TKjikrcKOmcjZrIGISvyRlvJR1XDOQibUyNdbJO65JBA+v65WFdursYc6JCM6eA8Iyp1oKREObs7ymY+OjTL1DZi4yPh7JU3dAmC1/gGa9uSIjmi0Biw5pcHux5TLoUQZc5OkHVErcUJDzbFqlwE41SuC41yo8ljwDOkz31csjcw2+7ZIE/i82uS4pcEM8NcKzMiaGRXksRQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(66476007)(38070700005)(6506007)(316002)(53546011)(508600001)(8676002)(66446008)(66556008)(2906002)(66946007)(76116006)(91956017)(4326008)(6486002)(6512007)(71200400001)(31696002)(86362001)(5660300002)(8936002)(36756003)(2616005)(110136005)(31686004)(54906003)(186003)(26005)(82960400001)(38100700002)(122000001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q3RvRzd6ZGJ2eUljbTdsZ05HSmhOVDRDWDkybFk1ZjFjNXZwNnZ3Tk02OG5n?=
 =?utf-8?B?TEVGelI5eVFsdng5ZEdBOHc0RktkYkFpbFZNZEthcSs5bmdhL2lkck85NkRk?=
 =?utf-8?B?My9CUFhmL2JNNkFZL3Nsdk9uMS8zU09VZUdFcDdQRkEyUTB6TU9kYksrRHo5?=
 =?utf-8?B?NHltbmk0K3YwRXAxVW9uNFk3eXZVNUlTZFlKUkZaQW5mRlA2QmM2S1haYmM3?=
 =?utf-8?B?RHNvWEpHNTlVN3hvKytlRkJ5VFR0a3BqRE16MGh2aE1KaDZUWjI0LzVPUFZY?=
 =?utf-8?B?NDBHVTVyR29hdnlnNVpCNmZoblpHT0ZXNGR0OU44NjZKazNqWUtmOGFtRWVX?=
 =?utf-8?B?b3VBdGdRREw0ZVM4ZnJ2SGNzeG43M0owRGNTcDk4RXA0MDZHdnYySmtDYkVE?=
 =?utf-8?B?M0Q2aGVlUVh2elJGMnEyVkFOOU0xcEFCb0hUSHVPaU1zakdmcWtWR3VtNUd6?=
 =?utf-8?B?QzhqSGh0N283QnVqVHN5cnFwZGZkNmJaVU91MExuc2o3SDBmcnBNbEZPQ0gw?=
 =?utf-8?B?b2c4R3ZPZkVuOTRXdEkxZytySFJZaE1Qb3Q3R1N2SHkvMDl4dk92NEczSmhp?=
 =?utf-8?B?dTJQMGEvU1FWczNzL1hRMEJodmRqKzRIRGx0SG5yN2tIWTdRSkczN2xZRGVK?=
 =?utf-8?B?MFF3Q2pITHp4eks3ak5yeFphSk9qTFJUUzd6TU5WQjllZ0Q1WS9xa0dMTEdH?=
 =?utf-8?B?QlNDTFYrMXN3V2ZudjI3VlZnQS9ZQjFWdGFnajBoeGFCOGFWVGxRS2lGNERm?=
 =?utf-8?B?M20wWEdLbEV5d1VkaHZHTFZVMHl6cVdaYXVxcjFaeEtkN0tpa3o2d0FqWm53?=
 =?utf-8?B?SG9qaVoyZ20yR3VnTGJGb3BUTnlSa0FtTTJiYWQ1SjFZSmw2VnR1RWRHMVkx?=
 =?utf-8?B?YURhQ0M1eFdGZnRiQTBtSE1xaGxxdk4rS2NxckpYOERFNUdFWVp2UkZybnFB?=
 =?utf-8?B?RHJ0bkhyWHVmenVWZ05HTTA1QTRDWVFnQ1E0U3NKamFITlRhTE84Y0lLVS8w?=
 =?utf-8?B?cjEvK2Y4U1BXSm05UmM5dEhDbGd6NDkwT0Z1QU5FMXpmNHl0SjhZS28wanpG?=
 =?utf-8?B?U0ZPUEd1RzY5Mm0rclNzTnJuMXpPaGw1Q3IydThzT3dyVTJtQUhYSXBaQWR1?=
 =?utf-8?B?Mld1N1VIdEd2ZFAzWHRleXVsM0g0cDdzL0l2MEFwUVREOUd4cGpMaXpMckx3?=
 =?utf-8?B?SHF5NUU1TEdXVW9TRENCKzBLS0xwOVViVFBlTUtEMUIxRFhMN1gzbjBEM1dr?=
 =?utf-8?B?NmY0NS9VTU1LWXNyR3JNOW1GL0E3Wld3allaUExXOTdSMjNPemQvNWhyMHZW?=
 =?utf-8?B?ckM2bjFsdUJ2Mm5FZk5hUkRXMDhxODl1QVVsa2p2K0pXdFNNTW5nWXdCZTI4?=
 =?utf-8?B?dmpsMVNvNmovem02OUtESmV4dVlXNVVUMWpZTUt5d1BnRExlV3pkd2o1SEVG?=
 =?utf-8?B?NDlacGpMV3VJR0ZGa3Irc3F1bVRGWWdrV3R4ZGNzTy9vU0tvWXVOcEp3N3dI?=
 =?utf-8?B?c1N4ZEFoZ1lnZkFtRlZWczhPems0MFE0a1VBTnpYRWNZOGRQcFZEMm9HV255?=
 =?utf-8?B?YWdEdlJYYXN2YVFNM2YwVlpXYzhPR1FkWnhHM2xmYTRZMXBNcUdNYm9Tai90?=
 =?utf-8?B?Q3lubi9GZUw2SFJseDhkdkFKMUcvUjYxMUs1WFdCZUNFTXRmMFdvV0FBTEJ6?=
 =?utf-8?B?SlRYMlprekl2MmplWm5RbTltRzdPckMxd1UrOW15R1F4UHZNYWgrVUd2MG0z?=
 =?utf-8?B?SmwzajhQR0d2dVFiREx3enZyOWtVVDcrVmJ0dnAveXVsa2Ntd1pjMC9KQzhI?=
 =?utf-8?B?UlU5SXZQNTl5aWdINWVhSnFKc0dPajUzek1iMVBqM2FiWW5WVkdHM1NrTmZr?=
 =?utf-8?B?dHFhdkdycTBWZ0JRek4wWlA1MDBSOGtBYWRNMCttVmZoWUlYbUtmOGRXc3NS?=
 =?utf-8?B?RExkWEt5eHRJSmNGMzZxZGFmSUwrWUVWMWdxVS9NOE1rcjhnQWZlNW1aRTM0?=
 =?utf-8?B?eVhZOUpLYlJRY1p1RE92eXNIWWh2MktSeU9wZ043RjVROUF6NHdzNThGcWhh?=
 =?utf-8?B?dU10dzc5QjZ5QThVZWdpaWNaYjc2M1J4NkNIbkoxQVdWdDBRNGRJTDlSY0x5?=
 =?utf-8?B?RjkwcnlCYXhtK0c2M2txbm9SY0JqTGFpdmxqUjFLbkdISVYydVVRa0J5Qllx?=
 =?utf-8?B?YmhjSThzZTlWMGJpWWhJYUhtbEl3RzExaDdrM3IzYzFQUEJFeXNoczNNbkI4?=
 =?utf-8?B?Y1g2dEpWWmhCVEgrMWd1YVRVSExpMS9VaFRRM1dLSU1TN3pwUUNsaC9CQjQ4?=
 =?utf-8?B?ckpQNDRJNEVuOG1aNkhUbmZWZDdaNVZOZWcvRXBWZmxSaml1N01Bdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47BF34459900234DA33E57D39444DD23@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40f6f8a-d34f-450a-7042-08da23bf0634
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 17:47:37.5859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VbvDlPfgnveJSyNAqgj6L9Pdlp7AL8btLjV8HXvsDZ3SIu/Mk+mEVPTe7DSOHTRoABOooJy/Fy/rIQrKTROe0TDd1zfbDfy1hijudlT5ikE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4880

T24gMjAvMDQvMjAyMiAwNzoyNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIwLjA0LjIwMjIg
MDg6MjIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBPbiAyMC4wNC4yMiAwODoxMSwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4gT24gMjAuMDQuMjAyMiAwNzo1NywgSnVlcmdlbiBHcm9zcyB3cm90
ZToNCj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4+Pj4gKysrIGIveGVuL2lu
Y2x1ZGUveGVuL2lvbW11LmgNCj4+Pj4gQEAgLTM0MSw4ICszNDEsMTcgQEAgc3RydWN0IGRvbWFp
bl9pb21tdSB7DQo+Pj4+ICAgLyogRG9lcyB0aGUgSU9NTVUgcGFnZXRhYmxlIG5lZWQgdG8gYmUg
a2VwdCBzeW5jaHJvbml6ZWQgd2l0aCB0aGUgUDJNICovDQo+Pj4+ICAgI2lmZGVmIENPTkZJR19I
QVNfUEFTU1RIUk9VR0gNCj4+Pj4gICAjZGVmaW5lIG5lZWRfaW9tbXVfcHRfc3luYyhkKSAgICAg
KGRvbV9pb21tdShkKS0+bmVlZF9zeW5jKQ0KPj4+PiArDQo+Pj4+ICtpbnQgaW9tbXVfZG9fZG9t
Y3RsKHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwsIHN0cnVjdCBkb21haW4gKmQsDQo+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1
X2RvbWN0bCk7DQo+Pj4+ICAgI2Vsc2UNCj4+Pj4gICAjZGVmaW5lIG5lZWRfaW9tbXVfcHRfc3lu
YyhkKSAgICAgKHsgKHZvaWQpKGQpOyBmYWxzZTsgfSkNCj4+Pj4gKw0KPj4+PiArc3RhdGljIGlu
bGluZSBpbnQgaW9tbXVfZG9fZG9tY3RsKHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwsIHN0cnVj
dCBkb21haW4gKmQsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWEVO
X0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQ0KPj4+PiArew0KPj4+
PiArICAgIHJldHVybiAtRU5PU1lTOw0KPj4+PiArfQ0KPj4+IEFzIHNhaWQgaW4gcmVwbHkgdG8g
QW5kcmV3IGFzIHdlbGwgYXMgaW4gYSBudW1iZXIgb3IgZWFybGllciBvY2Nhc2lvbnMsDQo+Pj4g
SSBmaXJtbHkgdGhpbmsgdGhhdCB0aGlzIHdhbnRzIHRvIGJlIC1FT1BOT1RTVVBQLCBub3QgLUVO
T1NZUy4gVmlld3MNCj4+IEluIGxpYnhsIHRoZXJlIGlzIGFuIGV4cGxpY2l0IGNoZWNrIGZvciBF
Tk9TWVMgYmVpbmcgcmV0dXJuZWQgZm9yDQo+PiBhc3NpZ25pbmcvZGVhc3NpZ25pbmcgYSBkZXZp
Y2UsIHNhbWUgaW4gdGhlIHhjIHB5dGhvbiBiaW5kaW5ncy4NCj4gVXJnaC4NCg0KSG9uZXN0bHks
IEkgd2Fzbid0IHBhcnRpY3VsYXJseSBoYXBweSB3aXRoIHlvdXIgcHVzaCB0byBzd2FwIEVOT1NZ
UyBvdXQNCmZvciBFT1BOT1RTVVBQLsKgIFRoaXMgc2hvd3MgcGxhaW5seSB3aHkgaXQncyBhIGJh
ZCBtb3ZlLg0KDQpBbiBlbmQgdXNlciBkb2Vzbid0IGdpdmUgdHdvIGhvb3RzIGFib3V0IHRoZSBk
aXN0aW5jdGlvbiBiZXR3ZWVuDQpoeXBlcmNhbGwgbm90IHN1cHBvcnRlZCBhbmQgc3Vib3BzIG5v
dCBzdXBwb3J0ZWQ7IHRoZXkgY2FyZSBhYm91dA0Kd2hldGhlciBYZW4gY2FuIHBlcmZvcm0gdGhl
IHJlcXVlc3RlZCBhY3Rpb24gb3Igbm90LsKgIEVOT1NZUyBpcyB0aGUgbW9yZQ0KY29tbW9uIHdh
eSBvZiBzaWduYWxsaW5nIHRoaXMsIGFuZCBoYXZpbmcgb25seSBvbmUgZXJybm8gdmFsdWUgdG8g
Y2hlY2sNCmlzIGJldHRlciBmb3IgZXZlcnlvbmUgaW52b2x2ZWQuDQoNCn5BbmRyZXcNCg==

