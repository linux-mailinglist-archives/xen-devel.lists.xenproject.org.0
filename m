Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4C9637E11
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 18:12:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448009.704761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyFlR-0000fm-UM; Thu, 24 Nov 2022 17:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448009.704761; Thu, 24 Nov 2022 17:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyFlR-0000cq-Pp; Thu, 24 Nov 2022 17:11:53 +0000
Received: by outflank-mailman (input) for mailman id 448009;
 Thu, 24 Nov 2022 17:11:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MSTi=3Y=citrix.com=prvs=320cf85b7=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1oyFlP-0000ck-9g
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 17:11:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 140ab812-6c1b-11ed-8fd2-01056ac49cbb;
 Thu, 24 Nov 2022 18:11:49 +0100 (CET)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2022 12:11:39 -0500
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by SA2PR03MB5724.namprd03.prod.outlook.com (2603:10b6:806:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 17:11:37 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::5d4b:6b1d:efc2:20e5]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::5d4b:6b1d:efc2:20e5%9]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 17:11:37 +0000
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
X-Inumbo-ID: 140ab812-6c1b-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669309909;
  h=from:to:subject:date:message-id:mime-version;
  bh=SpauniP90bNGEERF77jx0JZxgJVR2pFyJSDj9YcX99M=;
  b=eDFrygr11ItDxKxGIvkfaASo8kZIfW9+bXDVjigMgg251ff7FQ95ba9Z
   Q+cuY8YGVGlEAWaSj2t0mvY0SluRiFlEL61kqBH+IeGlUUbi5qd45Fwzj
   CBaaioW0vUmXGZWJ2sh/6YqHdfT3gyE5C01lIkZ6pxomyf4t20/jvM/+z
   I=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 88043456
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23: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
 sXc4p5COvgwQFxwOSI5
IronPort-HdrOrdr: A9a23:892SR6/hOsHqYGs5aupuk+EGdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKRcdcKO7SdC9qBLnhNdICOwqUYtKMzOW3FdAQLsC0WKA+UypJ8SdzJ876U
 4IScEXZ7PN5DNB/KXHCXyDYrMdKa68gcKVbInlr0tFfEVPUeVN/g15AgGUHglfQxRHP4MwEN
 6x99dKvD2pfFUQd4CeCmMeV+bOitXXnNa+CCR2TSIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zoghH0/aKqttC801v523XI55pbtdP9wp8abfb8x/Q9G3HJsEKFdY5hU7qNsHQcp/yu0k8jlJ
 3hsgotJMN67lLWZyWQrQH20wft/T4y4zvJyEOeg1HkvcvlLQhKQPZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv6nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLVU5mZhBgv/DWfZAVxIv60eDlBhiVT6UkSoJlN9TpZ+CXYpAZFyHtycegC2w
 2OCNURqFgHdL5sUUs6PpZMfSL/MB2xfTvcdG2VOljpD6cBJjbErIP2+qw84KWwdIUP14Zaou
 W0bLvJ3VRCAX4GJPf+rqGjyCq9NVmVTHDo0IVT9pJ5srrzSP7iNjCCUkknl4+lr+8ECsPWVv
 6vMNYOasWTW1fGCMJMxUnzSpNSIX4RXIkcvcs6QUuHpobOJpfxvuLWff7PLP7mECoiWGn4Hn
 wfNQKDU/lo/wSuQDv1kRLRU3Tidgj2+o9xCrHT+6wJxI0EJuR3w3soYJSCl7G2wBF5w9ILlR
 FFUc/ae4uA1BaL1HeN6Xl1MRxACUsQ6Kn8Uhpx1H43D38=
X-IronPort-AV: E=Sophos;i="5.96,190,1665460800"; 
   d="asc'?scan'208";a="88043456"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X10qd/KreOGsySyDWH8v1PgvPPzpxW9CS+5VMOeqa41ee0SoCq+7LzFBbrNoiSkMqOHzuYeAkOBUo64OXStczJxFgKK1a4BQ1AQRJhiU0GqtFaQn+esP8gj2GVqR3JMwyPbvcKzRq2XQYTuSo5ycFOkSrivoTVkP8CQshdtD7x55+V/qP/Rc0FbZrDsBez6iKTQHWRdzsnqYZcw6/nOAiLZ17bKZWqh5Zq6FQi7kVfQbkhFYZllRcPDLoV2Uh4/lkO4K//GnBdPKkwl4yzzaVptLnO/S/CnS2Zu7XPvC8s/Fpk1fvog60a1KgXeaRVS5rphV3RWvljhrl1E5hXchZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XImXIQ4asoHg3TXnol27j2c0B7b9nSI0PRtzfKJWSDo=;
 b=Sw2pd1TTV4OnDodnr+4rqTnGe03pQRFEYlT4Y0/NGUhhDnvMtLS+7E8ZOhxGPA/mo1c6/PUbSh3r90QkPzvWw4ebET47ozQg2fgU8BJvKm9R1cD2UapgQudgEqH4+mEQW9ndZZ5+gPztDQd17ntp6BD9bxpSCpAG1G+d8dbCuW75mflb4T7Z48Prjgh2ITc4FubrG0g2rZFBa3gPhzw1TGONOArfi2uOlcN0IqluWStZAUTDcKKG7Qu0/tb+k3r7ZnmFikfJ7b32VM22Hgd/Bt2bbjQVaaB3Hb/hEzUK4dhKcA4u+FB9SDDTaKBts+Umimpck20SbJB0UqLl/m/fkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XImXIQ4asoHg3TXnol27j2c0B7b9nSI0PRtzfKJWSDo=;
 b=ZYwch3r8+92CJ7Zq7U9xgBUQ+md3R1jnFVWSc9H7f0rG1+GR6ZtuL6m4zOd5qSR8S1W0LbMRXv8uDicKQ5n///72C9wleHedbgrg9zeAT/2HGyd17GEMVD51Qgebxc4eU3/cyxsM83HhdsB8rEIKvdhdoUoosBY9HoV5BuODEbk=
From: George Dunlap <George.Dunlap@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel
	<tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>,
	"daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Christopher
 Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>,
	Kevin Pearson <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, Matt
 Spencer <Matt.Spencer@arm.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Rian Quinn
	<rianquinn@gmail.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, David
 Woodhouse <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Ash Wilding <ash.j.wilding@gmail.com>,
	Rahul Singh <Rahul.Singh@arm.com>, =?utf-8?B?UGlvdHIgS3LDs2w=?=
	<piotr.krol@3mdeb.com>, Brendan Kerrigan <brendank310@gmail.com>, "Thierry
 Laurion (Insurgo)" <insurgo@riseup.net>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Scott Davis <scottwd@gmail.com>, Ben Boyd
	<ben@exotanium.io>, Anthony Perard <anthony.perard@citrix.com>, Michal Orzel
	<michal.orzel@amd.com>, Marc Ungeschikts <marc.ungeschikts@vates.fr>, Zhiming
 Shen <zshen@exotanium.io>, Xenia Ragiadakou <burzalodowa@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLSGVucnkgV2FuZw==?= <Henry.Wang@arm.com>
Subject: [ANNOUNCE] Call for agenda items for 1 December Community Call @ 1600
 UTC 
Thread-Topic: [ANNOUNCE] Call for agenda items for 1 December Community Call @
 1600 UTC 
Thread-Index: AQHZACfPUq+rZUBm3UiPhFR0+p7ldg==
Date: Thu, 24 Nov 2022 17:11:36 +0000
Message-ID: <CDEE837E-887F-4386-9EF4-E57C2057C4EC@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|SA2PR03MB5724:EE_
x-ms-office365-filtering-correlation-id: c08161cb-8bae-4f3b-5233-08dace3ef201
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tM/myLAWfWB1p0F2WB6SdRn6+qj/4z3TuoyQJ+auDF0tQh5YhB0oKb+AyxmbmrgxcBXOWsDIx0FIpiPbdVLveTzQWppI6OIxjI8kB0zqMwxNX7lYcSU4NoYRgXH4qWMZIAqHYpp0yKguormshpwAjJcqX0upmNX7H3zNrJ0jDaeGisTIlfM+pt/f3Gdue5rNldek05baAYg1ztbnYJxLVqCLSdcPaB9BWNx2H/6XfFLHOvWX92k90Q5sArvy0bFnSHwKtphbjXGBBAwpti4qd08CVA4UE7Pi2Jv4UfnXawYfuf9kubz5PpOrq6K2/xbGWTfRxOi607R1AxUQTkiCYvEwFDXjkKiCRU2FLMJuGS+mWsoXJ2BZ+XwRjodQyAgT2ISSJdkeyVBlgQcXuiMYAkeYfDSjXTMwBWr+JCIUsNHWRLNwfxE1B6bQy+gbfJpjrpKwyoQP6QIhwknNgv6ZT5hhIluik2guAB7x/u3FMq0i+AKSN5CbJbpSUCZ/b7ax8FZ40Cb/zkucTgeIkApRqEoUKr3K20gUgfaotysZSZOXQfbSrj5h/Q5lZxrqATzCbNTmMUPNpZ1AXXG6JfpmStQIiQynk+OEYEBt5lP6BgPwx7Ts34oheKJ6rMRLLYRBs0UWfFfeiAuRmrpoQ5IKrESBXRmlRBi8tRvSMlJrkmHKDDK35OuRoAw772ppRjSbh6mcsac0jHNORiMblzLvxb6WRA+vv6IRdSw2A6alMpVSXFfctV+jjfdlqKxsU8CsTgGHaHxyzrvHX1uBSrsxcYbguANYtZ+dE6034+m8Icg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(122000001)(38100700002)(82960400001)(99936003)(38070700005)(921005)(6512007)(86362001)(91956017)(66946007)(71200400001)(76116006)(316002)(64756008)(66446008)(66476007)(8676002)(66556008)(110136005)(5660300002)(7416002)(7406005)(2906002)(41300700001)(186003)(8936002)(966005)(83380400001)(6486002)(6506007)(478600001)(2616005)(26005)(4743002)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXByS3Rsa1B6N2VROUcwTDdkUmFtaDZYNUo4RzNnT3JZTmVhTHhzbElpQWU0?=
 =?utf-8?B?ekhVb3luSnZBUmhURnhZOWErM1ljZ29TdXQycnVhY2MyTmFsNkRlaThpbExI?=
 =?utf-8?B?eGhCV2JnbDFHeGh4SGllOEd5R0E2ZmdQREptTzVxUGZmWVhLdWVtbVhRVmpN?=
 =?utf-8?B?Z0VIWXFLdnRNcjRZL2ppcnN2ZHpnM0FiYzNJNnZLcStnSjMzcmhmQ1hNK2M4?=
 =?utf-8?B?MVNWM0tuR2puNkRZUnN5YW1KbEhZS2UvWG10SkZYb2lxdlFYazRCdFd0dGRG?=
 =?utf-8?B?Tkx4WERsekhaL0NxK1lnUzNiTHkrdFA1T2d3bFJXdGJ2eXluOTlBUWVmVTA1?=
 =?utf-8?B?OFM4eU1GZ0VTa2krb2MwY1krVzFnYUdoTjBaWHc4eWZsRkw1Mzd5ck5xMW1B?=
 =?utf-8?B?SDNtdW9zamM4NnUzdlRUblo5YzhQQjhhbENZeHhYQzZpdHdoQVpwM0xKalJz?=
 =?utf-8?B?TXhDZmxIeEw5MFpVR1liZzJxRS9DVUJzT2NGMmhuNHhTc2QrQyt1djZCejI5?=
 =?utf-8?B?VUliZlIxb1NvZmdBWmpOdnlGNTFtQU0rbDJGOUo1UmVmOU1QVmxpTGtleE5B?=
 =?utf-8?B?eGxBVmM5MllqVzhZT3RmM2hQZUdKTGxBR09RSUJlM1AvMVVFRnA5VmZyREpM?=
 =?utf-8?B?bXMzZFEzQStCaGxxa1NWWUVzOGZqUlpjVHU3em8xUWdpdWpraldZVms1dWpq?=
 =?utf-8?B?bk0vOUtMd0lNQWtiMGhBT3NNNXVhMUl0RlJjTHJKeDlQQkp0TVdSaFg2eHA3?=
 =?utf-8?B?LzEySWlvTmtQdFZiTVlQVEFKZHRwSVJCaHFWVmk0YTlWRVhDamZoT2dzd1NM?=
 =?utf-8?B?WUxmOVVCcEl6RStGaWQzdXZHTHhMWmFES3VMY0Z1ZmVkT1BGMkF1Z1lZcGZS?=
 =?utf-8?B?M3hPNHhYNEd6eVpaeU41WE1RZTlwd3RPNGlhellnLzEydmZKSTk2QzM4VHpw?=
 =?utf-8?B?RXU5T3Y1cmdoNG05dWpGN0o1NTgySitCcUFOQWNETGUzSGlERGRpenlLcFFq?=
 =?utf-8?B?cnAzRWcvR0pOZjc0VmppREpjNmZuZGMyeENwWHJoY21hRTNKOCtzL3hOcGsx?=
 =?utf-8?B?NU1yQXI1R1hMa2JhYXROMlYrS0VaaHJ2TnBmUTd5SWU1K25tV1BWVXhmYXd0?=
 =?utf-8?B?WWJZVDM5VklTKzNRZzhTUjdhdG04QmRsOWdobFd1eFRTaExzRmdWN09CZFRu?=
 =?utf-8?B?TjVmVTlueVFXMlR0REdUOUYxN1VCNDA0L2VhTDEwdDhyUEFpbDZSNzRFUERz?=
 =?utf-8?B?UFZyd1VUMTVXdEwycXllTU5OZklhYW95THBqYzlqVi9XRmJjZXBkeEZKSml0?=
 =?utf-8?B?OGdSWUxQc1lZNWRLdG5WV0F5YjFxSzhscXZZUVdaMUpLRVYySGh2QmpFWUMw?=
 =?utf-8?B?dXFsOTRBWVNjMUZTMHJTWXBvTEU3eWFmZWZFR1lwdW1VVGNseXQ2MDd3UkFi?=
 =?utf-8?B?Vkl5WlNaT3c5NTFrL2xXbERwOTBiRG9VRmVtcW9yaGpUUUJHWC8rUzBCRktt?=
 =?utf-8?B?MVFrNWxOMFVRM2hLWTUrbG92MUhZZXpwd3JWY2JLSjhWdXBSWDlLa2ltVTNG?=
 =?utf-8?B?Q2FBWEdzK2VCTUxZamFwekpBc1RRZnUxQlFzbFVSdlgzNnU4YmRRVVl6blkr?=
 =?utf-8?B?b1RHUjgyaVVQNmFZekdsWjFDdWZFdmZ1THFJNmxTdUpheENKSzVGMGhkUEh1?=
 =?utf-8?B?V2R3STJ2TktVWGhsdTJjY0dtaEFrVDBvNmh5R2xxU1FkWHVIQmNnMXhnUlpu?=
 =?utf-8?B?N1pvUE5oaU5HVGxRdHhIN2xMWExZTmhKTnhTL29tTSt0MnZxRUtNWEI0eFdE?=
 =?utf-8?B?c0VvM3UyMittYXl5cDYyOVpQTmZFT0hMZ1RaRVg3eTJrbnBraDgyc3BQSWFa?=
 =?utf-8?B?NnRiSVF2T0JybVg1bUhSVEFJekNYa1ZPclkyQi93YjN4T25jYnFPTmQwMUtR?=
 =?utf-8?B?d1h6ZVBDZnMvQUwzRFVHQ1ZmbWk5SjR5N3pxN3BnQXZ1bFNHaDNYeVhETGtF?=
 =?utf-8?B?cEFMcUFtWXMySlBtbHR5Tzg2UTZYdU5BNVFIdUswSi93OFpsMTk3bndSbUxo?=
 =?utf-8?B?TksweENVSk5ldmhqY1JIR2JwaWNzdklkdm5UaGFLQkJjdFZvSVp5ekZVZUVO?=
 =?utf-8?B?WWs2MjRDSzZLdmZLcjZkUHFTcTJOTnloaDFMVlJpcG1YRGxzOTU4N3NBSmlY?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5CDAE7DC-8A03-4679-96C0-7C6E3BC1598E";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?us-ascii?Q?4noZzajqD3kOCcozo6JTedU3FC8qQI/ZgcVR7qlfZLf6i5mNyASOSpQ0ppxU?=
 =?us-ascii?Q?DOJ+uSx+DSeevxp6pbX1ZWU0wiM0kSLMS/NTo3msg4e8SRaOcbJKPYd9eL6i?=
 =?us-ascii?Q?l4wuj3W+K9B5AYvcGrT6dqkhjOm/iIhbZUwd1Y+ZofR8p/ZvvnWFcGNmNOet?=
 =?us-ascii?Q?iT9Q6w+5QZ75cz2nIXAhwbvCf7f1mHTStO4imqcssmaOHNV9waQxN9JXCkNy?=
 =?us-ascii?Q?fiyRACuSLCX+q5hnAcFz+6RJ0eEOIZdi466v+G3+3vbKWjGCpdRZGX6gqSqR?=
 =?us-ascii?Q?j5YrpU0fOJIwgvuTE6QHjQGSy4kYIKtmTg9jSNzvvxufJWh5xAK7goJLRAB4?=
 =?us-ascii?Q?ykxze6dEGVZQJLdOGCpctc6RnvidSmsunKWlqDtPlurmbhqIg5CiaIN0Vfvm?=
 =?us-ascii?Q?DCziHxUwbOr99zaFQ4Z1scIO5iLUhuuL5xmTcbtbR1S/LmBfI5ITH2vKlN1m?=
 =?us-ascii?Q?7W7MYEgfSnixZwR5b+iRNFBAtLGRqepgyJq3V8VUIHT9n3B+fK9n4d0f9KiN?=
 =?us-ascii?Q?1nTrXIh0lwH+SGdcL0Jt9+Lf2+IpVWQkanoryDyIo8uDr+w+C4nzQBSEMx/U?=
 =?us-ascii?Q?BhAm3BSr/Gdw+pPCUncDjobpJSPBHMEUh96PYoNA0BtD37rI1XM1RQQtpRNR?=
 =?us-ascii?Q?OaWR9TubkEip3+V7c1b0qs/wfjEbhxV5zqmdnS4nZ7xL0heSpxi/uMCeiKLZ?=
 =?us-ascii?Q?MHLGTaJa7qkWYUeWkaIphaQ+v4KST6DXHk8HxtTvtohN+KMDgv6IU+8cDHfS?=
 =?us-ascii?Q?XzhgHyyS2EvLCBMTkucU5cYuSe1t9SPXVZbmpVg8GqpOBJ/I/d5Oh5voDlGd?=
 =?us-ascii?Q?BSqD3Ytj87XyXjVhNUQfAiBaVCLaIUZgL4GWY4VYZZkMJnWdcacKoyMa4wUp?=
 =?us-ascii?Q?2HjGwePqfJDeowSFt81iEq/u1Y7BGmaht/CLlZkIYk5GQbshJbj3P+r4xdbB?=
 =?us-ascii?Q?/2aliH/vaXO99vwyMbR62c6ea0Doh7ZvmmEQRp7NCWcqsiVMts4obsfzWbDz?=
 =?us-ascii?Q?tPiGr1PI8/p5AgRClMe7AuInM4khATquD9wBmCrT7AHJ8l59JyMSUy8toeSC?=
 =?us-ascii?Q?gCcL6rCQrG6qM7/9gl3EA4vOLckHfm0Rlm6e+JiiRStTLK9sjwJs/+suAzCF?=
 =?us-ascii?Q?VOY3kFXo2j77yvhQ74xFj+ctTAaoGwP6CWu30qc1XkWKhEZp7Z2Y7Q48gPrI?=
 =?us-ascii?Q?5FxgxSYi9e7bajiZsn3zXCkriHN7RZ6pQEX4z+UJL0GFc5enjqKhZtr7/PnE?=
 =?us-ascii?Q?dSA3qDID4YXtE/hBZO+JwL+rDPYuBurr3AHtFLfENo3OF3og1X0Ol/X1MiIV?=
 =?us-ascii?Q?/w4aTgu8gWBp6aQA4JqmKQnHZ02uUKfsSzMk+2oi2V6fLPhlA14ggIDN92AX?=
 =?us-ascii?Q?J8wQTfYxZfZ8o4Gfpr+VFeaB3cRGYKUn5VnDeKj9eLou9Wmb8V7ePm20moyY?=
 =?us-ascii?Q?oeb7Qn4ZHP9DhauvP85ObK/xCBkwZJT5dBE7eKGBs/io8mL8RZV0tkCkropT?=
 =?us-ascii?Q?V0FIXW0Z7UNMMsJngoVnA1NBxv+epoOfl0QTP/Iawod3/waOnlmtzZZ7Fz7V?=
 =?us-ascii?Q?NL8G8lOcUT2PbncBlo/qmREla8ThpqPm6UFsePa0vKt1JJC6MbquSm+zialb?=
 =?us-ascii?Q?Rg6jZiuk3VLEi02CX1Cl2RDq2EAkp9UizTrRC4ZLH8eGLrvB6zVJ8xWqXUcW?=
 =?us-ascii?Q?Msh+vxCyIjkHqyUmtFBzNCOTtu1htm3iz3x75oa5z8sraqDu6AFXWs12haDQ?=
 =?us-ascii?Q?mIWJHIfGa3UCUFVWheTeL/z7LqpJinsVTzSgWdt3Uv9DOCWsflmKWFzEZWp7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1:
	TlIWba3vImJ1LzF+tebukS5DWBAXJLu9qMnXyk6iZI7vYoAY480JKXcJZpLaGNk5NpxPs8XUGhsneAhs7LvPcbyfF9x108DW29mFdvIO4Iu09q+CSq0WAcAUCX2UMpY+0v9uStozJKq6Ue8Ne9kkNG7nGa35NI8DC5XATWqMWqVPsbCcfSCsBsZkDZpFMEwpEReqtiIVo8wmEGjFO9ePxXBIJB/PJsbMMzQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08161cb-8bae-4f3b-5233-08dace3ef201
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 17:11:36.9176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: km2Hgd97FyA/vt70B2t7jDhkPvzL7kebvZDZ3o66+ztVzUhFHoDzPSegXkGjq0/8CR44inSiQDRF1OlciDiU3AZoPiMO8KwcscF1kTm6QOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5724

--Apple-Mail=_5CDAE7DC-8A03-4679-96C0-7C6E3BC1598E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Hi all,

The proposed agenda is in =
https://cryptpad.fr/pad/#/2/pad/edit/zh4Ya2wW19fSnZe8L31fGM3K/ and you =
can edit to add items.  Alternatively, you can reply to this mail =
directly.

Agenda items appreciated a few days before the call: please put your =
name besides items if you edit the document.

Note the following administrative conventions for the call:
* Unless, agreed in the pervious meeting otherwise, the call is on the =
1st Thursday of each month at 1600 British Time (either GMT or BST)
* I usually send out a meeting reminder a few days before with a =
provisional agenda

* To allow time to switch between meetings, we'll plan on starting the =
agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate =
time to sort out technical difficulties &c

* If you want to be CC'ed please add or remove yourself from the =
sign-up-sheet at =
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

Best Regards
George



=3D=3D Dial-in Information =3D=3D
## Meeting time
16:00 - 17:00 UTC
Further International meeting times: =
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2022&mon=
th=3D12&day=3D1&hour=3D16&min=3D0&sec=3D0&p1=3D1234&p2=3D37&p3=3D224&p4=3D=
179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall

--Apple-Mail=_5CDAE7DC-8A03-4679-96C0-7C6E3BC1598E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmN/pcIACgkQshXHp8eE
G+30kAf/eeC+PB68p+a+cxhTzhQt3jCIuSlTtqvPdev3do5VCrH9yqFlswbIspwy
Fv0XBjV0HukcsnTuRMR0f7n4IFL/lIwUUN6qMT6aPl1KgUUslRsi2EN5zyJqKb0i
CF9o07Q4+CdpH52h0cmYwNy59fJXp+YEmz/r7hvwppvNkCqaDGhWbkQS+WVualqv
3DnvVrc+SRKjAuFL9S3yeTlM1gYMwBN4wGRDpOstqnDmtGANGOvwdPCVky9uTmrf
zbCEyFb0YKPOKfVYbSuRaROEb5bLoixOUtBjI6Q3rQbMbNLy+ebcWETYClnZJSdg
ZA/2ppA70KaEhJR/ZpTynAc4cQ4hFg==
=bCNa
-----END PGP SIGNATURE-----

--Apple-Mail=_5CDAE7DC-8A03-4679-96C0-7C6E3BC1598E--

