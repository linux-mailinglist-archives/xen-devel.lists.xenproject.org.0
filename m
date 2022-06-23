Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C644A557721
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:51:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354759.582036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JUB-0003gi-Ih; Thu, 23 Jun 2022 09:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354759.582036; Thu, 23 Jun 2022 09:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JUB-0003eF-F3; Thu, 23 Jun 2022 09:50:51 +0000
Received: by outflank-mailman (input) for mailman id 354759;
 Thu, 23 Jun 2022 09:50:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vof+=W6=citrix.com=prvs=166aae13d=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o4JU8-0003e5-Ui
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:50:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3141ebe-f2d9-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 11:50:46 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 05:50:38 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by MN2PR03MB5200.namprd03.prod.outlook.com (2603:10b6:208:1e6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 09:50:34 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::99b:8d7c:620d:d795]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::99b:8d7c:620d:d795%7]) with mapi id 15.20.5373.016; Thu, 23 Jun 2022
 09:50:34 +0000
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
X-Inumbo-ID: f3141ebe-f2d9-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655977846;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=nlMqpglbr3OF3/e6PmbsNJnzeSJxiehm1nXlZ/4lS3M=;
  b=D/mldHESV66wIY6EWjJvoBLu9p2ttQoalmZYtjwV8B+mIJFdTnk+Bi/6
   2Y9ubJuNPMef3SmFn8ss+vmO+2LcGTkvAN8WLbEx3d+xjR0CNaUXPWeLi
   faHnItrYZuCx+kjF6JoraYcajOk6vMSHcv+mUqOEAJlE8mQ9LtPKr2E1c
   c=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 73585102
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iDmDb6ABY5qWjBVW/1vjw5YqxClBgxIJ4kV8jC+esDiIYAhSlGxQk
 DNbHCvTJK7JMVJBSKkkO97koExTsZ+And8wSgpk+CxhFiwb85TIXNmTJBesMn7If53OQBs24
 clGNoDKJc44FifW/RmkYumx8CZwivDSLlaQ5JYoHwgoLeMzYHtx2XqP4tIEv7OEoeRVIivX6
 Niq+ceDZAT7gzR+PDhI4f7Y8Bk/46j/4GsUsFE0bqEXsAfSmUdOAcNEL8ldDZdZrqq4vAKeb
 7yepF1s1jqBp3/BMvv8zvCjNBdirof6ZWBisFIPM0SZqkUE93ZaPpoTbqJGMx8J0W/Rw7id9
 f0W3XCOYVZxVkHzsLx1vylwS0mS6oUfpdcriVDm2SCi5xWun0nEmp2CP2lvVWEswc5lAHkmy
 BAtAGtlgiZvJQ6B6OnTpuFE3qzPJSRwVW8VkikIITrxVZ7KTX1fKkljCBAxMDoY36hz8fjii
 8UxRhYxdErKXBB0G0YVCJsEvb2mjyGubGgNwL6VjfJfD2n76iVUieKoGvyFP9uASINSg1qSo
 X/A8yLhGBYGOdeDyD2DtHWxmuvImiC9U4UXfFG63qcy3BvPmSpOVVtPCwrTTfqR0yZSX/pwJ
 ksO9SdogbU08EWzZtL8Qwe5sDiPuRt0t994TLZnuFzUkvC8DwCxCU1dFiBuQvgdvt4TdA4K2
 mDXwPLxCmk62FGSYTfHnluOlhuYNDIJN2YEaWkhRBEc/tj4iIgpi1TESdMLOKW1lNzuBTbow
 z2Q6jd4jLEal80j2KCy/FSBiDWpzrDLUwo06wP/Tm+jqARja+aNd4GurFTW8/tEBIKYVUWa+
 mgJndCE6+IDBo3LkzaCKM0oHbqp7vLDFyfOjFpHFoMksT+q/haLZptM6TtzIENoNMcsejLzZ
 kLX/wRL6/d7AnyuaqNmZpOrPO4jx6PgCNfNW+jda5xFZZ0ZXAOf5yRveU641njgilQxiro4P
 YqHcMGqFjARDqEP8datb+IU0LtuzCZuw2rWHMr/107+j+vYY2OJQ7AYNlfIdvo+8K6PvATS9
 ZBYKteOzBJcFub5Z0E77LIuELzDFlBjbbieliCdXrXrztZOcI35N8Ls/A==
IronPort-HdrOrdr: A9a23:86TsgKAjRPJlo9vlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="asc'?scan'208,217";a="73585102"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OloKGVicAWWmisu0HmZJkmPkZN/N/JZCJRP5uBXqCnSD51Qsq6fCOXgQHCZ8ebhCcg1Ss4fU7KQ0RKpLP9PCuXqLPyWjsdqdY8k+vwTuQ1nad4r7hZi6HQqMKPVvAC0JlAjJY8bMC8xM06Edulz4LcWYBC2m9OGX0JqoYnWsEtsYaY7J8Z280kKIvNOoHBdJrq82XXgISWNonT9yXuBz2PHONQ2QD0yDDQovwyQLa/95JNkfXyMxB0AMCDEFREyuLrrdD+cNIvWyE008CjKYVYMfTq6l8brWBDMk5+bXw9tmJE8gM1Q0Cz/G3TWQPCX/u4r0qoQ4fACBWDhd1RBfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcFepjAnGM+27vJO7r60GIwIxz63RjDXqvPur/tpukY=;
 b=KUdezUeTR7sq6xhVzHFRWfVk7IugS22F4CgeGUqK+zLu7JZpdJZS+Mjj2VQ74GJuPQQy0TwT9byF2QzPN+M1ri1FoZcXX2XcyxGxKje0Q2GtC9Tw+jnIwr+rXF8a491OYYE+mbASkxdPXG5DTay9uuzuzhaJ84U2ugu/OAAYt6gSuyutaw5JtC/Ww4/Q/p8s2wcxqYuRli8QEy1515yJYNAfyQq1P1gbGjxpJSxQAZ2JjOoW4RIWbI51A0jYWoplzZIiXjtKbJo8Mt9zy+z3wT1YAbSP8GUXJmqKWpg2KMiqVYr97SuC2sjBfGIwhknPfnU4ycDdsn8oBECCB35GrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcFepjAnGM+27vJO7r60GIwIxz63RjDXqvPur/tpukY=;
 b=CaVAJ9s5hVUpdfbDUc6jUGN87pw7IAfgZ6quGCUqqUcUCiCynfIHZLzZjzk80OYXCyr8zBAOzXXG63iyDRzOSkGOaZ8V7rp9wWBEncpCugh2HKHbj1g+yvGlHj1l6VOEV4hvuxkN6B/iTDQj+d5fSbdIPJpfW9hI1mUrnpOvbE4=
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Julien Grall <julien@xen.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Michal Orzel <Michal.Orzel@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Daniel Smith <dpsmith@apertussolutions.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: XTF-on-ARM: Bugs
Thread-Topic: XTF-on-ARM: Bugs
Thread-Index:
 AQHYhWH1+fjNtvukV0adEqGEdTB7sq1ZxCsAgAAXIgCAAAnTAIAAf4aAgAD4xwCAAEImgIABIvEA
Date: Thu, 23 Jun 2022 09:50:34 +0000
Message-ID: <4A1C629B-4842-4047-A180-435BD5972091@citrix.com>
References: <7f490d75-153d-7e1d-b3c0-5418ff7fdf8f@citrix.com>
 <b8f05e22-c30d-d4b2-b725-9db91ee7a09d@xen.org>
 <fd30be68-d1ac-b1bc-b3f1-cff589f338ee@citrix.com>
 <c97de57c-4812-cdfc-f329-cc2e1d950dc7@xen.org>
 <CACMJ4GY+H7P733_-UNgSd7P8+Z4ryeJwVy3QfekMJskkmh9btQ@mail.gmail.com>
 <30BB31A7-F49C-4908-8053-74E31D03BD33@arm.com>
 <36854512-23fe-57dc-3c47-5f996927872b@citrix.com>
In-Reply-To: <36854512-23fe-57dc-3c47-5f996927872b@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd100f95-e7b2-4ed0-c2a1-08da54fdd163
x-ms-traffictypediagnostic: MN2PR03MB5200:EE_
x-microsoft-antispam-prvs:
 <MN2PR03MB52004E424520B0EC58A88B1E99B59@MN2PR03MB5200.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sUjfxvCtzFrcIcqZMrNkgD4Zomju6X0VZQR38KgsJY7meFKpXrHpsdvejXQYUDCiTN6F2NPdmHCwYLHZlmBfiW8PZVxd7IsKiKHG733QDiPnxwZ8RN9MWm60y8lm2wuqhKwGrnRKGKGt+jn5JaqXQzpGBwpNPU5/q8xEKTMI0nER4jyD3/QAHZ5yhCNS5Rlk9F7pPhZQxgZFXv4kEuILsoGV7I+bVbmCY4i3+1dJXsWy0Dmm3VNNCHVhvntIrEGa189aKuI6vSNEJlROh4jcqv7mjV9Ei1aVfKSCNu+JF6veuPYzhez53YV8wwJ7Ezebq8AKz7cdFZ4oXERbOjeeWtHEOvfZLgUMqga19lny13nRb/n+ZJm/YPz41sI80iDvAtT7pg5iFQlSOB1kD/0WhaGs11seYtTzd1mgJAz2O4Zv/96JeYybqojvHU3gaJOfwykZp+r8E+p7aXQj8xZQWoeUqojJ0HvsxxvDSICg0njgzIC6FBdQlksr+T2iOIiwXC6qwXwxQIvf82kBwjPr5JKK4jpQyq1l8NirupLEG7KwhPhorVpFjmM62A7TlaOlIZybDDPoyv2xlnX4gHIljftFwiSRxqdkVsWx6YbCf/vdMAiKNSVbGkRZnPdYzdwx3ZWxG/fdSJMlUolquqjpwHIR3ahifNmAJXskdq1rSOEJ1/jFyMv5tjHMdqKFhUh2jaEfCpqJLVdhN+O2B/QkMxAs/rWDsmL8+cYb133aEKWzTX6vHhyvOak9S/OCPhyehCQgcHDzA8IEbZvokr8PAcxat6ixWTKiMP5n6VNe+A5v66fRpnnqKedYx2icRpUxIPz6pVWUtViYUV/+kisOoQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(2616005)(83380400001)(478600001)(966005)(86362001)(2906002)(71200400001)(6486002)(82960400001)(6506007)(107886003)(316002)(8676002)(66556008)(53546011)(26005)(66476007)(76116006)(66446008)(64756008)(4326008)(99936003)(36756003)(6512007)(166002)(91956017)(38100700002)(41300700001)(37006003)(66946007)(38070700005)(33656002)(6636002)(54906003)(8936002)(186003)(5660300002)(122000001)(6862004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTdzWEtJT2VZSGJwcHR3bFVQV2Zkeno5RDZZbU01eW5uUXhsbjVUSmpxS2t4?=
 =?utf-8?B?L1U3ak1OdUVNRElITjE3cGZjZEVwaE5sV0lCV3RiUVNRMllWQW93OVRvYjVu?=
 =?utf-8?B?bnd3NUJGaDR4QUlicXVuS2ZlYmtOVnR6SlVZT3VIbklTTFhWbFQ5ZlJWVUFO?=
 =?utf-8?B?azhoMjhaV201d0hyVFZJbExQMXVobmQ5d3l1MnJzSFBkc0l6MTF0L1hXM0do?=
 =?utf-8?B?QnJyNEU5amJVNmRIYjRLZ1p0NFowanMrQzRqaFF2WWY5UVZ4eWRVOU13bmJj?=
 =?utf-8?B?UEJOdC9BVFBQZ3dHTUZwbENid3JOc0kyRmN6WHNtV1daQzE2a3kwSUtTQ0hi?=
 =?utf-8?B?dlhqVFl1QjJpMGsvTzZtb3hyRHNUOXl2ZC82STExSzhtaUF6MGtjTml2RUV6?=
 =?utf-8?B?TmI1VXB3UWlSNU5sV2lvcmZtOU4rNFljaDI5bWV5RVc4SHlwa2RaOFpyU1VO?=
 =?utf-8?B?Q05YRDhZbDgwdjJxRVZHS1FYcml4NEhWOGkzcWpqUUEzeTlzazI5d1pPaWdU?=
 =?utf-8?B?ai9rOWJRK2NiaXBUQXR2SFdEZFJwd0VhaWhGMDBFaXd3dkR5a2ZhQ0lWYm5M?=
 =?utf-8?B?dnJxU05JWGIrQ3hwWi9qTGM4T3FNbnNNbUV0L1h5bFUvZkcyY3FZNGVHa1JO?=
 =?utf-8?B?dncwanBPNzhTU3hycGUrUWpyT2N1MllTQnViS0lQbmczNGJYS0V6bEVJbkV0?=
 =?utf-8?B?Rm1HaE9MOVRHcnJBZWtuaWw3VUhIR2VjdFlDdkhSSk9TVHFFRnpSNWZCRURp?=
 =?utf-8?B?UXdrR1ZpUFcvZ0xWclZaSnVHWGhHdHBUR2g0Sm9aYmZ2OUdLOWtRR2NsMjl3?=
 =?utf-8?B?alh1Y0JCV1B1TFNXNDFQbkpwcGZGaE0vWXlESmdZVlFkbnN4Umd2STZjSC9F?=
 =?utf-8?B?WktlalVXYmp6TGZ6V0ZTZ3AzSEZXT3l2bGM5YlplZjVNSWdyZFllWWl6NVpS?=
 =?utf-8?B?SndLeVJ1QlFud2pNdlJHR3hrUWp4bFFkSnkzV2EzaUU1dzJWdHA2UDRMSkln?=
 =?utf-8?B?cCtzQ3hnc3lIVFV1VU1UUXZjYjc1VE9CQmtKMllFb0Evb01LM2ZJQTREdEti?=
 =?utf-8?B?OGk3d3BjOHB0TTVHTzNOZ0dLemdXU1FHWTdVQjYwWG5EaWJoMW8yOVNXR3N1?=
 =?utf-8?B?TUJuZHNwTFk3ZytEd1dSN0oxR0VYT0IvS05kQmluSkkwU1RaMnhKU3VFelFF?=
 =?utf-8?B?eUF1ZHUrVmhnd1Y4L1M4eXk4YnhBLy9mSGt1RWVlUXFyMnhLaWsyUzF6MktX?=
 =?utf-8?B?U3NoanF0bC9lY081THUweFFneitLM2gvMjI0UWp5cVJWWjZuVDVkUUg2bWNY?=
 =?utf-8?B?eHRwWE5vWlo2MFlqTjF6MjRDMllkNy8zeDhCWnJ3aUt3MCs0dHRzWDNHRi9D?=
 =?utf-8?B?WktDVWEwOCt4S1QxeWQrMjRsYmhWYnpSS0RtaDdwUW1wVmVvTzJ4TktJT1kr?=
 =?utf-8?B?bnRXWk56OGkrTU1COFlBcnY0bjY3NC9iY1pNZ1ZvS2c1Q20rZlh2S3BLRnZq?=
 =?utf-8?B?RURLdmpibTRFdkZWK2s5UGJOKzZFL05rcEpDb0xLU3UwTjM2cDU1SktYR1lB?=
 =?utf-8?B?WjhDbExFa0Z2SFpLdTExOHNZeThIajl5SW9wUDRvOHBqSlE3L1J2eXBvcjJv?=
 =?utf-8?B?OTEwVU1JUWZwcStpK3hZbzRVSHo3SFIzSTQvOUJxTnluNEh2TjdpYjZXSHZl?=
 =?utf-8?B?L1N1SFRteXNQZzZCby94eVJQQXZmRFlhcGRidUZsSExCdHhncDE5dEhlRDIr?=
 =?utf-8?B?Nm14U2dBdUFJdEk1c3lTQ3dFblpZT0hnVFRkb0JXYVFjYW9hWjRIMllsb2FI?=
 =?utf-8?B?bU5hVWVhODFaRHhtWW4rdGhGak9RNDJ0WXpTamVRSjAzaUI4czV0MGVZZ1kr?=
 =?utf-8?B?Z3lRZHFpb3c1cnhuekQzRG5UcGRMN1pBZEtzZDJkQVU3LzZtcGU3YmFtTzZ3?=
 =?utf-8?B?L09sVTlRV2pINDBCRTZmcjlxMVJ1VzVPNnF6dE9JK3RVYzg4N05yWXcwd1hJ?=
 =?utf-8?B?ckh1MFFsTUVnWkQ2ZVNrTE0xeDNvQTlzNGUrZXRrWWxXalVFaWY2VVZnVWxK?=
 =?utf-8?B?cjY1cGk3a1ZyWW5iak9ZbTFxTEo2STliUFV1cmJaR3ZEM2V6dVprbk1OeGRX?=
 =?utf-8?B?bHlBVDlLeDZINmVPeHhzOWNHMXlSYzJ0ckpvYW5PUU9mQ0ZRSDgwNThmb0F1?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_43D8713C-5875-4BC9-B7DF-70111C69E8DC";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd100f95-e7b2-4ed0-c2a1-08da54fdd163
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 09:50:34.2469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lc1mPtlMQNcirzH7v7TvP3wme1TqcVDFCYFCUousqv30ytIC08YRFjLuFeEWlhmUoFXol/XbhE+TMPoB2orDFmkew7/yi99WMYbgjsL/tKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5200

--Apple-Mail=_43D8713C-5875-4BC9-B7DF-70111C69E8DC
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_1FF60EFC-FE68-420F-8A8C-75314AAC8E11"


--Apple-Mail=_1FF60EFC-FE68-420F-8A8C-75314AAC8E11
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 22 Jun 2022, at 17:28, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 22/06/2022 13:32, Bertrand Marquis wrote:
>> Hi Andrew and Christopher,
>>=20
>> I will not dig into the details of the issues you currently have
>> but it seems you are trying to re-do the work we already did
>> and have been using for quite a while.
>>=20
>> Currently we maintain the xtf on arm code in gitlab and we
>> recently rebased it on the latest xtf master:
>> https://gitlab.com/xen-project/people/bmarquis/xtf
>>=20
>> If possible I would suggest to start from there.
>=20
> Sorry to be blunt, but no.  I've requested several times for that =
series
> to be broken down into something which is actually reviewable, and
> because that has not been done, I'm doing it at the fastest pace my
> other priorities allow.
>=20
> Notice how 2/3 of the patches in the past year have been bits
> specifically carved out of the ARM series, or improvements to prevent
> the ARM series introducing technical debt.  Furthermore, you've not
> taken the "build ARM in CI" patch that I wrote specifically for you to
> be part of the series, and you've got breakages to x86 from rebasing.
>=20
> At this point, I am not interested in seeing any work which is not
> morphing (and mostly pruning) the arm-wip branch down into a set of
> clean build system modifications that can bootstrap the
> as-minimal-as-I-can-make-it stub.

Andy,

You are not in a position to dictate to anyone else what work they will =
be doing; particularly if that dictation means, =E2=80=9CDo nothing =
until I can get a chance to get around to it.=E2=80=9D

Bertrand and his team have their own goals and priorities they need to =
accomplish, just like you do: they need to get additional XTF tests =
working, and they need to be able to share those with partners.  They =
already put off that work for over a year waiting for you to get around =
to the architectural re-work you had in mind.  It=E2=80=99s not =
reasonable to expect them to put off indefinitely their own needs and =
priorities, any more than it=E2=80=99s reasonable for them to expect you =
to drop your security work and other things you=E2=80=99ve been working =
on instead of refactoring the XTF architecture.

Bertrand knew when he made the branch that the more work done on the =
branch, the more effort it would take to eventually merge it upstream.  =
You were told that they were going to create a branch and continue =
working on it; and you knew that the longer you delayed the =
architectural re-work you had in mind, the further Bertrand=E2=80=99s =
branch would drift.  It was more important for you to work on security =
issues; it was more important for Bertrand to get additional =
functionality implemented and shared.   You and Bertrand have both made =
your decisions with the full knowledge of the implications of your =
choices; there=E2=80=99s no point in complaining now that the natural =
consequences of your choices have in fact come to pass.  And it=E2=80=99s =
hypocritical to be angry at Bertrand for having priorities higher than =
easy merging, when you did exactly the same thing.

Bertrands response to this thread =E2=80=94 suggesting that you begin by =
testing his branch to see whether the bugs you=E2=80=99re looking at =
have already been fixed there =E2=80=94 was reasonable, polite, and =
cooperative.  Yours has not been; and this kind of response isn=E2=80=99t =
likely to encourage him to be cooperative in the future.

The sooner you accept that Bertrand's branch is going to continue to =
develop, gain more features and bugfixes, the more effectively you=E2=80=99=
ll be able to begin reducing the diff between the two, such that things =
can eventually be merged.

 -George


--Apple-Mail=_1FF60EFC-FE68-420F-8A8C-75314AAC8E11
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 22 Jun 2022, at 17:28, Andrew Cooper &lt;<a =
href=3D"mailto:Andrew.Cooper3@citrix.com" =
class=3D"">Andrew.Cooper3@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On 22/06/2022 13:32, Bertrand Marquis wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: JetBrainsMonoRoman-Thin; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">Hi =
Andrew and Christopher,<br class=3D""><br class=3D"">I will not dig into =
the details of the issues you currently have<br class=3D"">but it seems =
you are trying to re-do the work we already did<br class=3D"">and have =
been using for quite a while.<br class=3D""><br class=3D"">Currently we =
maintain the xtf on arm code in gitlab and we<br class=3D"">recently =
rebased it on the latest xtf master:<br class=3D""><a =
href=3D"https://gitlab.com/xen-project/people/bmarquis/xtf" =
class=3D"">https://gitlab.com/xen-project/people/bmarquis/xtf</a><br =
class=3D""><br class=3D"">If possible I would suggest to start from =
there.<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Sorry to be blunt, but no.&nbsp; I've requested several times =
for that series</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">to be broken down into something which is actually =
reviewable, and</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">because that has not been done, I'm doing it at the fastest =
pace my</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">other priorities allow.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Notice how 2/3 of the patches in the past year have been =
bits</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">specifically carved out of the ARM series, or improvements to =
prevent</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">the ARM series introducing technical debt.&nbsp; Furthermore, =
you've not</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">taken the "build ARM in CI" patch that I wrote specifically =
for you to</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">be part of the series, and you've got breakages to x86 from =
rebasing.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">At this point, I am not interested in seeing any work which =
is not</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">morphing (and mostly pruning) the arm-wip branch down into a =
set of</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">clean build system modifications that can bootstrap =
the</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">as-minimal-as-I-can-make-it stub.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>Andy,</div><div><br class=3D""></div><div>You are =
not in a position to dictate to anyone else what work they will be =
doing; particularly if that dictation means, =E2=80=9CDo nothing until I =
can get a chance to get around to it.=E2=80=9D</div><div><br =
class=3D""></div><div>Bertrand and his team have their own goals and =
priorities they need to accomplish, just like you do: they need to get =
additional XTF tests working, and they need to be able to share those =
with partners. &nbsp;They already put off that work for over a year =
waiting for you to get around to the architectural re-work you had in =
mind. &nbsp;It=E2=80=99s not reasonable to expect them to put off =
indefinitely their own needs and priorities, any more than it=E2=80=99s =
reasonable for them to expect you to drop your security work and other =
things you=E2=80=99ve been working on instead of refactoring the XTF =
architecture.</div><div><br class=3D""></div><div>Bertrand knew when he =
made the branch that the more work done on the branch, the more effort =
it would take to eventually merge it upstream. &nbsp;<font =
color=3D"#000000" class=3D"">You were told that they were going to =
create a branch and continue working on it; and you knew that the longer =
you delayed the architectural re-work you had in mind, the further =
Bertrand=E2=80=99s branch would drift. &nbsp;It was more important for =
you to work on security issues; it was more important for Bertrand to =
get additional functionality implemented and shared. =
&nbsp;&nbsp;</font><span style=3D"color: rgb(0, 0, 0);" class=3D"">You =
and Bertrand have both made your decisions with the full knowledge of =
the implications of your choices; there=E2=80=99s no point in =
complaining now that the natural consequences of your choices have in =
fact come to pass. &nbsp;And it=E2=80=99s hypocritical to be angry at =
Bertrand for having priorities higher than easy merging, when you did =
exactly the same thing.</span></div><div><br =
class=3D""></div><div>Bertrands response to this thread =E2=80=94 =
suggesting that you begin by testing his branch to see whether the bugs =
you=E2=80=99re looking at have already been fixed there =E2=80=94 was =
reasonable, polite, and cooperative. &nbsp;Yours has not been; and this =
kind of response isn=E2=80=99t likely to encourage him to be cooperative =
in the future.</div><div><br class=3D""></div><div>The sooner you accept =
that Bertrand's branch is going to continue to develop, gain more =
features and bugfixes, the more effectively you=E2=80=99ll be able to =
begin reducing the diff between the two, such that things can eventually =
be merged.</div><div><br class=3D""></div><div>&nbsp;-George</div><div><br=
 class=3D""></div></div></body></html>=

--Apple-Mail=_1FF60EFC-FE68-420F-8A8C-75314AAC8E11--

--Apple-Mail=_43D8713C-5875-4BC9-B7DF-70111C69E8DC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmK0N1gACgkQshXHp8eE
G+3bLAgAug4opJ5Uon+mEzoyGvnRuTOfwFWGLsU5wkuLHdCaZYx6rnSSOtZTrviN
8vgYeScP4okouYMaC82oUY23aDs6TYyr5BDMWcwlh4AiC1hTX4tXIV5B5hq/azGf
N76cvE3h0NEZoIzCi9Jz9FS/ogjKIYz+FWPsDHTzuYEdMlV4UbQEgI51wF5KyiNO
oRVYLNZhqbxUOzrPJPi9p8m8G9XKkcekNlbNggs9mE9c0fB3x2fqoEq4r72WMYD2
Yfykel7i1irVm4Rh3CWgwEKLWzWaLN6eEytVrMBDkEohJ6V4NYZqv+09NN8+l/ID
rLpnta9v56U+oKH6b04GI1uRPWa5pQ==
=VfW9
-----END PGP SIGNATURE-----

--Apple-Mail=_43D8713C-5875-4BC9-B7DF-70111C69E8DC--

