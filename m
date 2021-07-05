Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394A63BBE30
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 16:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150266.277858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0PVR-00035E-BD; Mon, 05 Jul 2021 14:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150266.277858; Mon, 05 Jul 2021 14:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0PVR-000325-7b; Mon, 05 Jul 2021 14:23:29 +0000
Received: by outflank-mailman (input) for mailman id 150266;
 Mon, 05 Jul 2021 14:23:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bRm=L5=citrix.com=George.Dunlap@srs-us1.protection.inumbo.net>)
 id 1m0PVP-00031x-Tm
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 14:23:27 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fe5e1aa-dd9c-11eb-844a-12813bfff9fa;
 Mon, 05 Jul 2021 14:23:26 +0000 (UTC)
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
X-Inumbo-ID: 8fe5e1aa-dd9c-11eb-844a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625495006;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hLrIjVD9hwnQgGTXIaVWCXbEn+PIxbb/2ebcARy3W4o=;
  b=Mg2B8nknWAPJ70QWBlV+aG7f24fAKoerWYNUvXqEOOKEW/r91Dl9kwg7
   +jNvcKd34whAX+8j2w28Z+8uoG4TzhMjniOcjwLPiSuh7psqduh+u+BUD
   fE+IaSsFbCy0Bs4onrtpFw7guEO9IIvpeLYHfbPh9gWhbeC3PbL9cC3fx
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l5w1HpKpAO6EvJ3Pp+FG4mUjbJS1DDQaNJLgF4DE88uVZ8lALH5kBzN2CShVIscFDkjZGTG8NM
 EFcy3Veqy2M/dfkU0VsB4udZeK0WYFCbeW33LwAKHCLKNXhy0N2f7rCmkIovp8d1a9vqJSrngm
 nBWi37oRvC8gwl8NCGDhnuY/Qoybhz5J0/NTRW+nG6xZYDUuQPvLgc1fFRE2+splGozRaXGxkg
 xOqTu9pQgVMfosnL58K5xHHI/f5un4OfUs8Gn6gI2WSZdyCVYwfGA0cJrZd1Wx+0cq3DcKqvfq
 2xo=
X-SBRS: 5.1
X-MesageID: 47292293
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jW8hBqzQEwPGag8q2unTKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="47292293"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3/zQDnAQJpWP/dALVKhNwXmoBV2T+LIE1NYlwkjz6xWt0GUAR5stcWMN///Q9sO6qGpFkGN4cCoBTkrnWqcoM7REQH0FVwX6F1a0D2hc/8Cgg8puJvDwy129gdoLbKzkIsEFVGbPxQuLEXpfUP6QITHi0hpJIheYsRIzhLknemXcyyJ17IlZPfSMtxUXPok74JL1qVL75ZnW7fOkwYL8mUaPgVbvK/L93OWxaThBF+7ubPRf1NhQLunp5UavUk/dEuCdj515G1Sb63F4G34rR40rzjUbGyGZ8JIsd1Fo92u3oxpqxPql3QJ0PPK2vE391eP9vKXvj//Pdy0KsJA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLrIjVD9hwnQgGTXIaVWCXbEn+PIxbb/2ebcARy3W4o=;
 b=fG5Kps1nH1+bXHrPv3X9i2Nam8AdQurluCO+Dcj7YUS8wrM3Hvbq8R6ow5tWWUnbovArjPG1KvMIK4qDmKWmRN8Jdw7jkXYUNt1TmJs4j/hzo6+jsrtdK7Sg0YUBJqwn2V+TOheK8WdnyUKExJYEQOZB7VyKzMFwlfKZyyqhFY5/OM8C+A86bScbYNPIbNaRBUJ/TLtLryuXV6BAAci6nd6FrGgKVxyeqCg9PFA0vljHLTgP3PruhthNV4q5yhM2DMft85VdnOfrIigH3o2q3RMgoKyDVC5BKY/t7W2PfODrkzU5fZwtIN0elLSkpsu0udZT/E7cmajjhiErvZ4hzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLrIjVD9hwnQgGTXIaVWCXbEn+PIxbb/2ebcARy3W4o=;
 b=W4Av8KdNz0KfK2EDP9YfrO0P6DFzBHzxTY/EJbxkhzXoVkRCrBvkhSgxZ/bS7DeoyVjQOR1cQEHcjT47qM4Riw/+Pz2mmoiYDAgGc0rrYw+rKA4vP+ROf65j/7/nANmaO1+wmhS734HFmQIq/A2iJwlkAv42bHe8zo7iHSdZcl4=
From: George Dunlap <George.Dunlap@citrix.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com"
	<intel-xen@intel.com>, "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Sergey Dyasli
	<sergey.dyasli@citrix.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, "Kevin
 Pearson" <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, "Matt
 Spencer" <Matt.Spencer@arm.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, "mirela.simonovic@aggios.com"
	<mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dornerworks.com>,
	Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Ian Jackson
	<Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, "David
 Woodhouse" <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ash Wilding
	<ash.j.wilding@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>,
	=?utf-8?B?UGlvdHIgS3LDs2w=?= <piotr.krol@3mdeb.com>, Brendan Kerrigan
	<brendank310@gmail.com>, "Thierry Laurion (Insurgo)" <insurgo@riseup.net>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Deepthi <deepthi.m@ltts.com>,
	Scott Davis <scottwd@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Ashley Weltz
	<aweltz@linuxfoundation.org>
Subject: Re: [ANNOUNCE] Call for agenda items for July Community Call @ 1500
 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for July Community Call @ 1500
 UTC
Thread-Index: AQHXcaj4TGdNKvWHSkOxbJ2RPnVHi6s0b0iA
Date: Mon, 5 Jul 2021 14:23:20 +0000
Message-ID: <BCB410C4-F755-46F3-802B-8F88BE6FBA6A@citrix.com>
References: <9E80CEC4-1ABF-42A1-95DC-D48B4EA8BB42@citrix.com>
In-Reply-To: <9E80CEC4-1ABF-42A1-95DC-D48B4EA8BB42@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1835c9f7-a957-4cc8-9ae6-08d93fc07097
x-ms-traffictypediagnostic: PH0PR03MB5749:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5749E08F8D456AC44ECF8396991C9@PH0PR03MB5749.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HSXEPxXARWF9iWT5D7/mmLbsqBjaNC6Xv3KtNkiYRr6p6XSc4xDOcBEdb2mpt+VxuvJjYxFwOxnPbuMihqROstqau+Y1svM21kZPYgIlSm8GwFiLGJwMWUqCHzoTnW/8C8BFeG9cmMadWBwkd5mqRrS5OqDUqfTPL6ZTXJMiZ0qRXV7ZZkuXsOjxEEUW5Flqcsiy+ldEvlzKeto1gXofuB05MVvgQ8yHdcrgzDghGR133BPSENkqT+8x/qeomv9MNzWqdA01qkauUJwu4gSGbgfpRlzczCPdzCs4Uce9DkIR6nwnWgqyHCuYmn4TR132Ss0D8Bi9G7H/iwRssQSgEqqzf02YxD/R8YXaCdrgFmkKor7m0YiB5WSy9ClH3ZLmhBYHF5l2OHAGWca30OSgV4TLHYoV7RN/G16T7ZNnNGf1jLV8CFzFL6n1CwRNS+j8biaTHVDT94Aa6uYL9jQvrNsCIfgk/yxzr0iz0CiHgdlNeUMUTIYtF6NT4NzVEfmxUQK5/b4II8YjOo6DY5RY8LLgjeYjQbZ0t9lcM7IRRM2c+BSGzFaTHyXSDaZjonMkgy/XpDvJYxGk+S3zbFWUrPI+ehPQY3CUcAtapB6Ezl8y19LR7UO7Spph/nT5qVoQzBpAsi4MiOspUr8P42pMkdTG4SKqtcEhMsXKZfbG6dvtxbjJdnJjy2vJqS9wHQU2dbrzL/AQmyJicaYG446SNZymFx5jr24zLMqCqK/Zrdoq/tlxFYDaQdbTQLZrqT149USv6tkcCziKeDpSxRqZytAcpTe61HnEpBQnfcbDGAROejdhu9Nd5Gay8OUr+koZnC3+YS1sHWHp/i70beQ2gg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(316002)(122000001)(5660300002)(478600001)(8936002)(66946007)(66476007)(38100700002)(966005)(66556008)(8676002)(64756008)(66446008)(6506007)(91956017)(76116006)(53546011)(921005)(71200400001)(2616005)(83380400001)(7416002)(7406005)(4326008)(2906002)(26005)(33656002)(110136005)(54906003)(6486002)(186003)(36756003)(86362001)(6512007)(221023002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czdWTUFsNEZNZTVCOVNVSDFyWEZQZUZBRHZjc3pMOVZadHZqSGI1dE5qYnA4?=
 =?utf-8?B?cVc0NHUrOHJiV2srbGFlbVgraTZVTzladkxkNlZWUUdWUXBrZmNyTjZjMzZI?=
 =?utf-8?B?MklsL2w1SXFrdUVrdCt3QzBWb3Q4aUtvd0s1R2lTdUhxWVZpVG9LMG5TMktm?=
 =?utf-8?B?cjlJRDJxbFJncVJxbW1UNThmU0cvYm5PdXdhUUl5U3QrM29tb01ReEdLWnov?=
 =?utf-8?B?Tkt3eTRIRWpGWWhLdWJnMUphaWRDNlFEcVpLYlVqQmRLb0tGa2JaRWZhNGVm?=
 =?utf-8?B?VjNiZUV1WUFKT2lrQkxkTFE5NnFUYW5YWlBmYUI2S2dVeEwwSHM5bnowd25I?=
 =?utf-8?B?L011dDBybU93b1YrSm5oanMyQzlseG9PVGlySzBjM3hoUTZUV3hIMERTMFI2?=
 =?utf-8?B?R05JV0x2NjRBS0t1TW1vMmRoeUE4REpyc0ZvTElOU3ZhdWYzS3F1UXdsZWdE?=
 =?utf-8?B?K25EWXptWjJlRzljY0RhL2Z1RUxGcE5Vayt5RlRLRUpSblB1b0dLbFFPVVVI?=
 =?utf-8?B?SVJvQzgxaEhpcC9KYytZdjhCWmVJbU9PTXY3Nmt4emp3bUsrZjVhS2Y5NFh0?=
 =?utf-8?B?ejYyWmMxUVNUWW14WGRPNWlZU3pvMWIzaEpuUjNkeFZ0ZHV1L1EwaVZ3bzB2?=
 =?utf-8?B?b3VTU3hKSkFOYUpHYzdCS0JMd083QkJwSXhjNW94TjJvZ2FscFVrbVlhRUM2?=
 =?utf-8?B?a1RnR2pSKzhjeDhRS3JYZGRsTjh1cHR0SW9mMnZMUUZRODBWVlB6YTlybHdC?=
 =?utf-8?B?ZFhlYXVWSjlZNlJvK0RiM0JtWExvekoyclZuUGpVNklpVE5Wb1pKem5UY2o4?=
 =?utf-8?B?YWxWUXE5WkV2N2lEVENaUzZKOVZjcFBaTTY3SkJjTitHRUMxMzhEblBUUlZy?=
 =?utf-8?B?V2NNek9Rakx4TUxjOW5lWmZTamkzUUZtQ3NBTTVOT2UzazlEbTRiVlFrV2Fk?=
 =?utf-8?B?ZFBTSmNsRUlJVTBBeFRQUEtRanlnZ01ObVR3NC9kWjhtWGtpZWZUaUVucWZU?=
 =?utf-8?B?STBoQlRJeU5pZXV6NHBVaEI3VkdJaDBqTDlpcFRNN3g1Sjh3c1RJU0UwSmtG?=
 =?utf-8?B?K2FOWUlSN1VRWUJFQ0tlazdCZ0wreWJZSTFIRWRiS1kzSW1aVWVlRFg3VDRy?=
 =?utf-8?B?bnloVFVQYkxKV2Q4K2tyaUZlVDRVVDkwdnl0OW4zMWg5SEZ0NTNNMVBJUzRi?=
 =?utf-8?B?Qk1aTHkwWGdrZzEwM2ZmV21ibG9XRDNBY09zUURvdXgyOFhzQ3JPd0dqWVNm?=
 =?utf-8?B?OUVaSnFoNmJiellPY2JBb0RsNlJZL1Z2YUYvbDk4R2lBQnh6RjJYbjd4dnE5?=
 =?utf-8?B?MmtlbE1NaTBFbWZicllOR3Q1anZnWVdaZ2JwVG5lTnVGK3JBaWFSY0c3R2d1?=
 =?utf-8?B?UlNjaDdIRzA3aHkvNmkvTldPcGNCaXd0dmVZVUVtOGxkTks1NE5nMjNmZncv?=
 =?utf-8?B?bFU1OHZMdzB5NWFIakRhbkNmeGFZcncvbUN6Ump6SngrYkdkSStXR3ZjT29x?=
 =?utf-8?B?NFMxSFZ2T1E0ZHI1YTVVM01hQmZRaXpvZXBwcWQ2ZkNlOGNFMHk1a0k4eU9L?=
 =?utf-8?B?Tk1zRlRPSTJBL2ZCTjhqY2M2bkpWSm85SVdSekVWQ3diWGptUG5vNkRsNjRZ?=
 =?utf-8?B?SjZuYTF6Y05VOHVRR1JDaS8wUVpVQmVLK0JiL2pDWnBaRmxqSmVpZ3ZlVGNE?=
 =?utf-8?B?NVFQVG0vWmZFcjR6QjlMQ0NWRVdyRHp6cFBNTndMYVYySkFUOE5OVnBKTGNu?=
 =?utf-8?Q?QoQ5P2+OXmxNXe1SkWCdmtXD81v3NNaKsqARZsT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E260F35451443B448DD4893E9F208A93@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1835c9f7-a957-4cc8-9ae6-08d93fc07097
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2021 14:23:20.2431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRUSt/4f+3t9wfZs4Von52wKqArytxjvaXxXhkxdLdvpaPMAS6Ugcfr1r/Q4uevlM/gqdgvDtLQiIwC9rO+eHUPWKozOXHaAyQbLTgBENuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5749
X-OriginatorOrg: citrix.com

U29ycnksIHRoaXMgc2hvdWxkIHNheSA4IEp1bHk7IHRoaXMgY29taW5nIFRodXJzZGF5Lg0KDQog
LUdlb3JnZQ0KDQo+IE9uIEp1bCA1LCAyMDIxLCBhdCAzOjIwIFBNLCBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gSGkgYWxsLA0KPiANCj4gVGhl
IHByb3Bvc2VkIGFnZW5kYSBpcyBpbiBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFkL2Vk
aXQvaUNYUkxhTUxvTVk4dDZuOTRNWXl3dkx0LyBhbmQgeW91IGNhbiBlZGl0IHRvIGFkZCBpdGVt
cy4gIEFsdGVybmF0aXZlbHksIHlvdSBjYW4gcmVwbHkgdG8gdGhpcyBtYWlsIGRpcmVjdGx5Lg0K
PiANCj4gQWdlbmRhIGl0ZW1zIGFwcHJlY2lhdGVkIGEgZmV3IGRheXMgYmVmb3JlIHRoZSBjYWxs
OiBwbGVhc2UgcHV0IHlvdXIgbmFtZSBiZXNpZGVzIGl0ZW1zIGlmIHlvdSBlZGl0IHRoZSBkb2N1
bWVudC4NCj4gDQo+IE5vdGUgdGhhdCBhdCB0aGlzIGNhbGwgd2Ugd2lsbCBiZSBkaXNjdXNzaW5n
IGEgbmV3IG1vbnRobHkgdGltZSBmb3IgdGhlIGNhbGwuDQo+IA0KPiAqIFRvIGFsbG93IHRpbWUg
dG8gc3dpdGNoIGJldHdlZW4gbWVldGluZ3MsIHdlJ2xsIHBsYW4gb24gc3RhcnRpbmcgdGhlIGFn
ZW5kYSBhdCAxNjowNSBzaGFycC4gIEFpbSB0byBqb2luIGJ5IDE2OjAzIGlmIHBvc3NpYmxlIHRv
IGFsbG9jYXRlIHRpbWUgdG8gc29ydCBvdXQgdGVjaG5pY2FsIGRpZmZpY3VsdGllcyAmYw0KPiAN
Cj4gKiBJZiB5b3Ugd2FudCB0byBiZSBDQydlZCBwbGVhc2UgYWRkIG9yIHJlbW92ZSB5b3Vyc2Vs
ZiBmcm9tIHRoZSBzaWduLXVwLXNoZWV0IGF0IGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9w
YWQvZWRpdC9EOXZHemloUHh4QU9lNlJGUHowc1JDZisvDQo+IA0KPiBCZXN0IFJlZ2FyZHMNCj4g
R2VvcmdlDQo+IA0KPiANCj4gPT0gRGlhbC1pbiBJbmZvcm1hdGlvbiA9PQ0KPiAjIyBNZWV0aW5n
IHRpbWUNCj4gMTU6MDAgLSAxNjowMCBVVEMNCj4gRnVydGhlciBJbnRlcm5hdGlvbmFsIG1lZXRp
bmcgdGltZXM6IGh0dHBzOi8vd3d3LnRpbWVhbmRkYXRlLmNvbS93b3JsZGNsb2NrL21lZXRpbmdk
ZXRhaWxzLmh0bWw/eWVhcj0yMDIxJm1vbnRoPTA3JmRheT04JmhvdXI9MTUmbWluPTAmc2VjPTAm
cDE9MTIzNCZwMj0zNyZwMz0yMjQmcDQ9MTc5DQo+IA0KPiANCj4gIyMgRGlhbCBpbiBkZXRhaWxz
DQo+IFdlYjogaHR0cHM6Ly9tZWV0LmppdC5zaS9YZW5Qcm9qZWN0Q29tbXVuaXR5Q2FsbA0KPiAN
Cj4gRGlhbC1pbiBpbmZvIGFuZCBwaW4gY2FuIGJlIGZvdW5kIGhlcmU6DQo+IA0KPiBodHRwczov
L21lZXQuaml0LnNpL3N0YXRpYy9kaWFsSW5JbmZvLmh0bWw/cm9vbT1YZW5Qcm9qZWN0Q29tbXVu
aXR5Q2FsbA0KDQo=

