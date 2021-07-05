Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C673BBE1C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 16:21:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150257.277846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0PTG-000282-Ox; Mon, 05 Jul 2021 14:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150257.277846; Mon, 05 Jul 2021 14:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0PTG-00024K-Kp; Mon, 05 Jul 2021 14:21:14 +0000
Received: by outflank-mailman (input) for mailman id 150257;
 Mon, 05 Jul 2021 14:21:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bRm=L5=citrix.com=George.Dunlap@srs-us1.protection.inumbo.net>)
 id 1m0PTF-000217-7s
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 14:21:13 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebb51a58-6efa-418f-bf28-19362d9aad3e;
 Mon, 05 Jul 2021 14:21:10 +0000 (UTC)
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
X-Inumbo-ID: ebb51a58-6efa-418f-bf28-19362d9aad3e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625494870;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=fF5T+tLu+xPkIyBAm3iYlQXEgN/axmZ24IlqflwaYVg=;
  b=IFH0WGbFP6fHFBJymAaEh1PbYxiLzDZ8Tir+Y6I1coN3CLwhfCf3S8EP
   y/+xJ0e2dexsI/LLCsxKzsa42dsMDo8zpdPiL+orfWGg6V0bal6Ov6a45
   Nanpd/UxKeP7xlyWWnf9pUQH8vej+aNKz/iywsflckITqK4MxFsj36igJ
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: M4wo4WP2aSVUHB/ErWn5Pjway5OI4zwsbhSM0SpYvOT+JepNLPRKXq/bc077eCXt8eZyikG18r
 9cfwDRa60zdH2PLSCZOVEOSLMJ8ctwk5h05rMybiFQIdvtXdHYV8ceR5tsh9Tf3BEbWiTkjijK
 yP7hKbOm1wM2uz41QiCHnPLDlKBalzTVlMwMTJvvmY4ZYnYFfsPGtvgUmVUzGsqS8JWS5BjZOm
 945Ia+GPBE0y2LCqTJIExQiqh1sIzekErXXQj5cej63MoplxN6fS8Q7xlsg2qmZwi5Ht0FVOAn
 jxI=
X-SBRS: 5.1
X-MesageID: 47650666
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:f2F+KqMEwUJdNMBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="47650666"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGE4il6luaWv3lFajJxZ6a6bK8VZw2tCEsHB4x65xrOqBrws+QUQvBX+Z3IjocGTLTiA9KNvv34bufKBAQkipmUI0jugsGUGCojIL6QdVrUKbXWQrk0uzM9Xsqovm0SG9YUbairq4JECaQmg3WE6cxuxKxSO8VBkfOCJO4OhZkRYPSTu9lvuwnzlqUkrdg34kSoRmuICP4meDOQKKV0qPzk/b1EPUvhcfilMHwnoKsMtUiS5PKWBrTRbcf9Sf+/WnESZHboE2tf3ZUS/NcK55mGJeBtVvG55EB+xHzuKdtL1PBeSugXTmcNaMgExopezl2PHNkCAVekJEZj1QhLfxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fF5T+tLu+xPkIyBAm3iYlQXEgN/axmZ24IlqflwaYVg=;
 b=dBehuqNt10+XY5Bxkv8SUPO1x8F8iP5mUSIn7oCchbxQZ0Xv5T2vQkDF2LAoXx3skklJr88cooRRt3KQ2Q+7jlOb5oI6KA1UNvCrzqyoBNeW+4uXYR1metLc29SBCpyQngEdFAb8G6cAhysTipC1tRDCC2ZngM61tpY01jXlbnVmuBklrOVd5sNYY+VyH3+PdNbku9t1X0eWHgnglsj6JzNmAcqtQGRkpdkk/yqAVmfxlWH+gJa0m9xbWHDoXrvJxWIogtuo5GZj4Ye69sJG8lC0yhjqnBo3dZ/tQoJL1MQ8vkJWjpT0pAJ9QOkyresclmWeTc+63wOKEb8JG6uGMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fF5T+tLu+xPkIyBAm3iYlQXEgN/axmZ24IlqflwaYVg=;
 b=CGt6fxk7xp/UcFdWOmctxBiMQV7XIOudntdVCZKg1STxlV4bmdrLwQvtSos1ixViQw0phKQZC9bs92enn5rs8O/zFGQWBwnxsy8vlKZ9LjbhTqLOoH8fUBP4L8mnDJKSYtboxEZdVFIAOMAWy87N3KaO3g3sS/QDYfIhPdi5Dy0=
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
Subject: [ANNOUNCE] Call for agenda items for July Community Call @ 1500 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for July Community Call @ 1500
 UTC
Thread-Index: AQHXcaj4czUEKXGSw0SGvgMlUUgZsw==
Date: Mon, 5 Jul 2021 14:20:57 +0000
Message-ID: <9E80CEC4-1ABF-42A1-95DC-D48B4EA8BB42@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc069903-328f-4ac3-9b7f-08d93fc01b4e
x-ms-traffictypediagnostic: PH0PR03MB5736:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5736BF80F8F5DC6581B3020A991C9@PH0PR03MB5736.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pjufyFs//rQzmK5yQ3zMu9dTNzFvJZmqFTVGnW6+tayFR7xmfZQEIB47hmJvoyeVSi27zx5QQYVVsxcxUs0AKwpy1VdWYdY1RY3wSk/owyf3bvASrn7omRjghpIwIL+QnarjOXFYYTiGD2TZKBKNgqW26Ay+ndLyl/qhEhp3EpWiKYmFqQ2J2XiE8bPT6JXQLkS3EiyzxgG95fJk+ys5SOA4Pa6bKEdtPku+17G9KWgP1SDh8Obw8xIdHOrIoto5+SDKBYskNanwoumlT+9L771aIS3vNHXJXJBUJYi+93Ka2vFgaMUKOcWjnjSFCj7QW8EEx9JAQIpg9+/jvu2DaXON4F82fIMO7kTvpz5PmVHxjnw6FbjT0uO3DnLnCONAa0Zxu9pNnHkMri1ek3HsDBjL5Ww3RjtkMS46SnDvIudkyzzxxZM89X2XSAGcYUxwDAAvp/Q3gpnVY98g13OHUDMzi9/GKG8/wsfyeS58ExzU5VIIeOZcwid74RobKNU6TEcUXyY4UFpblzxu4OS0rPJllvZBcvIkZW/n481bsr8AY3tdqDWv2MIfkLYV0gQqaqnKgWVlIWiO9Bi/B32Hc5rBE2LMBe/yRV9iX9ZBH8vS7sKR91Cc86Ex9z+V5Y/YfiPg7SVF4SBw7pwLo71c0ZRrPXGchRn31/gZ86/vvKYcRgsf7SMeE+R1E/quk12dDOcZ0zIHIM3lSgVesskTE06u+rlK1g5NAW3pGK6YHjppIgQmVdU+9UPuKaGZkW8yp944PoGx9x7L1TJYsrH4vVWec8TxE/tyNs1xFYWbqvLGI8E5QiUuBG0rnNM8ixqbhTT2Dh24BI9QgQdb+ITzwQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(71200400001)(86362001)(36756003)(33656002)(83380400001)(6486002)(5660300002)(921005)(7406005)(6506007)(186003)(478600001)(54906003)(2616005)(110136005)(76116006)(91956017)(64756008)(66446008)(8936002)(4326008)(66946007)(66556008)(66476007)(316002)(966005)(2906002)(6512007)(26005)(7416002)(38100700002)(8676002)(122000001)(221023002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGdGRHRHenY1Q2hjdzd5aFN0VVR3WStweGQvQXdGQktDMTdDWERCN2NaR0ZX?=
 =?utf-8?B?NXAveXh3cmJyb3FoYnFWS013ME54WkkxWlBzV1B0VmRzaHN3SE1CNDdBM0hT?=
 =?utf-8?B?bm9YWjdESmt4aFFoajZ1MXlxemJzaTVWUnp3Z3JiSktPZEZMeUtnTUY2ZC83?=
 =?utf-8?B?ejRBN0pzNUpNSkNpb0lnZDk4N2NSNlVrVUg5Z0VKRVlmT3NDWjBqaVN3UDJV?=
 =?utf-8?B?bTRyMmVvT2RkdVVleFA3R0xUVjVMU3lHZ0FHN3NVNEdvWmIycU9VcGVNWDZ1?=
 =?utf-8?B?T1NrY0ZBbWVpU3VSaXhBa3VqL2ptLzhuaEF1SlowMHZFeXVweXBxWFl1ZGgz?=
 =?utf-8?B?UGdBK2FkNFRPQ0JYTGRHalBkMTZCK0ZJSjFPYmd2VXdMdzRhMzArU2RBUVJL?=
 =?utf-8?B?bG96N2d0Z2V6WU0rU3ptS21SRTdoVFFJUXV2c1EwcDNsN09wendMOFoybGFt?=
 =?utf-8?B?LzZtcktQNTl5Z2pFcHo2L0gxZVVLU2FSTUcrWjlnUG93ckNDTHkxYWFXZmlP?=
 =?utf-8?B?NkYrMSs1WFlSS2ZBSXZVUTBZbkh5RytLRjVkVG42TnppdU1xY1dzbTBFMTQz?=
 =?utf-8?B?VWg4ZWVXcERpYlRrVm81K2VKekt3cjkxdys0SHBHUTdyZm1KUS9hMTI4UWhV?=
 =?utf-8?B?Yis0NnNWYnBWNVBNekhDNEM3eGJleEZQNUxzL0E5U3p2ZDA0OFhJTzhiZ0Zm?=
 =?utf-8?B?anljMTdxZmkyVWk2MGUxSjg5L3kxZ0hsY3dFUkVTRlZ4ai9RUDZYcFVsYTVz?=
 =?utf-8?B?Y1Qrcyt2MEZVTUJ3NnBzbTFuNmxidFFqWnZuaE5zL0NMZ0NPS3RMamJWOHBu?=
 =?utf-8?B?eXRUWkpwZm92em9tbTkyaDlhUXdHazFHNHpyQUNxVWVwS3ZvS0NCOExBTWp0?=
 =?utf-8?B?enpIYnYvWUJzY2Q1VW9jT3BXR2YyUVRRc2JLQjBUZjVmVjBEdG8zbVlGSFRY?=
 =?utf-8?B?UVlNSWFhMkdUWFFJVGdQeTA4azk4V04wd3JJNUxNZUhiVjlMaFhnenhwNVJM?=
 =?utf-8?B?NnhkSE14WXZlbjIzN0FMS01aaXJDNHl6RDgxTCtzRUx3aFpGckJ6Tkllb2U1?=
 =?utf-8?B?NGVwVVp3Nm9OSGNKbEprYXJ4aU1EWTJhOXNCUzF4eXc2WGJMZUR1MFZqTWM2?=
 =?utf-8?B?Mm9zbVFZbzFYVVY2YlRWRnZ2UmJyTWcrWXY2aTBxNUNubE5zN0R6S0UveEt1?=
 =?utf-8?B?a2tJdzFsY1NYUnliN1VlejVaQmR6cDVRa3Q3dUFiMUFmSmttYzBTcmpIWWJE?=
 =?utf-8?B?OURXTmU3SmgzZXp2TmdHeDRWSWtJYnZUcE9MMm1RbVRSUTdvV09XanludlM2?=
 =?utf-8?B?d1RPS0FNdml6b2hpTlhxdkpCbWIrU0tZN3lzYmd5SjhubUlzN3dkY2F4RTZm?=
 =?utf-8?B?cE9GdVhGSGNMOExSeDJYN1VNMi9PWjlPZ3FrTktpeTRSUjN1RGo1WjdOSjAw?=
 =?utf-8?B?VmdjVlY2YWMvS1M3ZXo3c2tmM0xCN3dPMnFnV0sxK3pTSlp6c1RTa0dZRHly?=
 =?utf-8?B?NmFBRHN3MmQyY290U2pZK3orQllSZUoxRCtaWHQ3WW5WeDJ1Y2RPR3J6ejNq?=
 =?utf-8?B?ZWFlR3dWWFJ5eTJVOU40cTNudXgwRm1PRy9hMVdCVXo4ZVhCUVVUNVlQeFNr?=
 =?utf-8?B?QlhNUWNyOTdVSFNsSmwwUmFvbDJxMU5zU2NDUHhVQ3hGUXZyT0I1a1ordy9W?=
 =?utf-8?B?MHQ4MFpZdXUwZFEwLzU1VW5KdDhlWGRLeENEWHVFNkYvbTBBekhMQzl4Z2FX?=
 =?utf-8?Q?x68XMaCIi1gDqZDfCjgGuT9+cHIbWdHpugU0j1g?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C706986B919AA1459A73A47B063F5BD9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc069903-328f-4ac3-9b7f-08d93fc01b4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2021 14:20:57.1344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iBxxCLbme45coX4iHFhyK6JvdobeLiaMmyiP4z71eBKbo9r6SyYJifX6b7EfWZYBw7PCDqaaMNHeRAbGDi4XE0xl2yMzSBKHcaK8OmfKuNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5736
X-OriginatorOrg: citrix.com

SGkgYWxsLA0KDQpUaGUgcHJvcG9zZWQgYWdlbmRhIGlzIGluIGh0dHBzOi8vY3J5cHRwYWQuZnIv
cGFkLyMvMi9wYWQvZWRpdC9pQ1hSTGFNTG9NWTh0Nm45NE1ZeXd2THQvIGFuZCB5b3UgY2FuIGVk
aXQgdG8gYWRkIGl0ZW1zLiAgQWx0ZXJuYXRpdmVseSwgeW91IGNhbiByZXBseSB0byB0aGlzIG1h
aWwgZGlyZWN0bHkuDQoNCkFnZW5kYSBpdGVtcyBhcHByZWNpYXRlZCBhIGZldyBkYXlzIGJlZm9y
ZSB0aGUgY2FsbDogcGxlYXNlIHB1dCB5b3VyIG5hbWUgYmVzaWRlcyBpdGVtcyBpZiB5b3UgZWRp
dCB0aGUgZG9jdW1lbnQuDQoNCk5vdGUgdGhhdCBhdCB0aGlzIGNhbGwgd2Ugd2lsbCBiZSBkaXNj
dXNzaW5nIGEgbmV3IG1vbnRobHkgdGltZSBmb3IgdGhlIGNhbGwuDQoNCiogVG8gYWxsb3cgdGlt
ZSB0byBzd2l0Y2ggYmV0d2VlbiBtZWV0aW5ncywgd2UnbGwgcGxhbiBvbiBzdGFydGluZyB0aGUg
YWdlbmRhIGF0IDE2OjA1IHNoYXJwLiAgQWltIHRvIGpvaW4gYnkgMTY6MDMgaWYgcG9zc2libGUg
dG8gYWxsb2NhdGUgdGltZSB0byBzb3J0IG91dCB0ZWNobmljYWwgZGlmZmljdWx0aWVzICZjDQoN
CiogSWYgeW91IHdhbnQgdG8gYmUgQ0MnZWQgcGxlYXNlIGFkZCBvciByZW1vdmUgeW91cnNlbGYg
ZnJvbSB0aGUgc2lnbi11cC1zaGVldCBhdCBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFk
L2VkaXQvRDl2R3ppaFB4eEFPZTZSRlB6MHNSQ2YrLw0KDQpCZXN0IFJlZ2FyZHMNCkdlb3JnZQ0K
DQoNCj09IERpYWwtaW4gSW5mb3JtYXRpb24gPT0NCiMjIE1lZXRpbmcgdGltZQ0KMTU6MDAgLSAx
NjowMCBVVEMNCkZ1cnRoZXIgSW50ZXJuYXRpb25hbCBtZWV0aW5nIHRpbWVzOiBodHRwczovL3d3
dy50aW1lYW5kZGF0ZS5jb20vd29ybGRjbG9jay9tZWV0aW5nZGV0YWlscy5odG1sP3llYXI9MjAy
MSZtb250aD0wNyZkYXk9OCZob3VyPTE1Jm1pbj0wJnNlYz0wJnAxPTEyMzQmcDI9MzcmcDM9MjI0
JnA0PTE3OQ0KDQoNCiMjIERpYWwgaW4gZGV0YWlscw0KV2ViOiBodHRwczovL21lZXQuaml0LnNp
L1hlblByb2plY3RDb21tdW5pdHlDYWxsDQoNCkRpYWwtaW4gaW5mbyBhbmQgcGluIGNhbiBiZSBm
b3VuZCBoZXJlOg0KDQpodHRwczovL21lZXQuaml0LnNpL3N0YXRpYy9kaWFsSW5JbmZvLmh0bWw/
cm9vbT1YZW5Qcm9qZWN0Q29tbXVuaXR5Q2FsbA==

