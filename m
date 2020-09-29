Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9314127C400
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 13:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.33.157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDWo-0007v9-4B; Tue, 29 Sep 2020 11:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33.157; Tue, 29 Sep 2020 11:10:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDWo-0007uo-0F; Tue, 29 Sep 2020 11:10:38 +0000
Received: by outflank-mailman (input) for mailman id 33;
 Tue, 29 Sep 2020 11:10:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i8TF=DG=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kNDWm-0007ui-Gf
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:10:36 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a8e7618-17e4-446b-b1d3-4a0faf7b2837;
 Tue, 29 Sep 2020 11:10:35 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=i8TF=DG=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kNDWm-0007ui-Gf
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:10:36 +0000
X-Inumbo-ID: 1a8e7618-17e4-446b-b1d3-4a0faf7b2837
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1a8e7618-17e4-446b-b1d3-4a0faf7b2837;
	Tue, 29 Sep 2020 11:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601377836;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=UpBPJiC4w75wL0CvPVKPgMPBKLxaQ+vhl6DeAF5jt1E=;
  b=HblLyoZpfwanbSeaHJou8Mr5HT9PipMHa3kNr+futPIEmH+wpxwY+xxl
   uaoY8SToTx3V1gPa8nzyBG/J5xOlHFMxNBcg6C2k29EHk3XjQdUPP/Tdu
   5n86BDDvwOtUpywc5n+Pkx95zFt5FzCNDqwlGIwFWDO8BhnnSCeYDnLgT
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1qO1uq9wJlGXxIU61nbAJjyzRu4UpoaNE1iZ9klHZopgNWsODtJ02Pd8GPG7mxaqQ9PSzTib+3
 zQkLWrXi5I28VkNP7c9T3gOP6sN0n8n2ZmFKdVKSt+rfBCJfWwC4FfZ6txexLZf89BVDnUaagK
 iuKn/z/PFwC3x49E8CrQT1prGxmEEAheQR9MQa5LSnP5Y6HSuUaVsys5rQmA9kqQIzpjRg2X2H
 rOkjNalNTv1B7hOmVqDeF+bHse7m9JQgCuN/RiLgdjhC/mwOhnGzU/3uJxSFFCLLCH/fzknAmD
 x0g=
X-SBRS: None
X-MesageID: 27822801
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,318,1596513600"; 
   d="scan'208";a="27822801"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYP3O/fTjFNI6AdVNz/eRq1cmE2zvM2bf145xObLPpp1gyyrWCf0eS7wzz1+o3Qmr6gNjopVtMB4JFtCIDa0CaI31+CxsnIPvHUJsDEkNmi590Y2Bd88MmohoxuOB0GHmGKLFdSQsNsKiXjuOA043GEqACvhbaVVREKOPrcrMW+PEcNMKQxg7dnzycltT8mPrqngugjMRclMHe7zxNk6+9TgS7LsmIA4R1RAIp3SJvWJdAMpLBJZPSGElrMObwJttPceuA7osvpUJSfGoQExi8zw/vopQaFxu4WfLtLd3P1Q7rsZw0tXGAv61SGvkumn3hNP6PaksPvPG8TeWbnuZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpBPJiC4w75wL0CvPVKPgMPBKLxaQ+vhl6DeAF5jt1E=;
 b=FL2Mzm+NGRtzvGJ9kVC0PdG7HkFmv/RjMVs04nbH/kw70bJQD31Z1iB3E3XBbsCfOiFB59RqojrCDCJh2alSj8F/upV44rlnPhoWBJtNhNBuA6NS0eqssUOV0R69hDPHZbA4JLwSydAlu+Vt6STPZBP094RlIrjIaIEfHYANvPQvNtqhztuf4zChbYKkp10Nc3fGjrmCAmQr6QRCXaZyfA6L6BCBH7uiKCsTYx9vaB69q4xvqZ0jgziQeuDKO7C+qLAx0jE9eLT5fbwL/00s54uK4qIP+QtGcClCgRujZPYVCQVigjcyWchYwanLvEwM/sko7oLja2f02Z4ObMBBPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpBPJiC4w75wL0CvPVKPgMPBKLxaQ+vhl6DeAF5jt1E=;
 b=sDPr+jf5qCk7Cdb8Jt2hu12tfaDQ5ZahxoWPEIGsYsw+mF1DHnn4mYwp+nS/QUBHvbkV3dcMtm3661+vkaxdfXIv9OjPxk3obytMjyKtkzoYj+nikmfo15o9VSrS26RYpBTr4xkejifSwYOhxu9EQ/gqhHgFLRsZ/6LJP3uGVnE=
From: George Dunlap <George.Dunlap@citrix.com>
To: "open list:X86" <xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com"
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
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [ANNOUNCE] Call for agenda items for 1 October Community Call @ 15:00
 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 1 October Community Call @
 15:00 UTC
Thread-Index: AQHWllEivYrS7DEAmU63f76oDpExNA==
Date: Tue, 29 Sep 2020 11:10:27 +0000
Message-ID: <E0D70481-1FEB-48A8-8F5F-FB08F7395F09@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39e3e0ff-15e2-428b-c097-08d864684585
x-ms-traffictypediagnostic: BYAPR03MB3701:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB3701009ED969F1D36EB796F799320@BYAPR03MB3701.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6/qxQLbmdRROGpyXBMrpjGjRD8pHnhF0RUA5cNb2ZzcF1VT2HOQ7OImi28hDKpjhJ3zI6ukGxLiYYw/W755hyiZkWc+7PixxyDLPVIlwlPZb1StRiQ6dzaeckUPiqMz/KD/Eb0rSkq8jaj9DUCfVm4r3szJ53XszW5ABNML/zzZ0hBjEJrvCYDbF5OUTFpzAtLGu6LQbFYnXT+K2vBI48uf630CCS7yIgFPFqmsB25s/z+uMsJuSAqIq8WjJDfnr8RIvrZ3LfW8KelKFelWGDf+iQYHDzb2MLckq2h7EAthR2q0487yrtZ3fsNDY2o55+c0YV5zZPNdhlKLIHdc8Lbn2L4DkRnC5JaYL1dIuDwkhHsPpsg39WR55FZT2grpPJPPThFC82prZ7UvGpWnftEQC9tg05hEoKmPvWXykuhjUly5L+oiABJd38sEFl9OZPCbPE5h6L0d62/bCdprCPg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(6512007)(8676002)(8936002)(2906002)(5660300002)(4326008)(6916009)(7416002)(7406005)(36756003)(966005)(6506007)(316002)(76116006)(91956017)(54906003)(55236004)(478600001)(33656002)(6486002)(26005)(186003)(86362001)(2616005)(71200400001)(66946007)(66476007)(66556008)(64756008)(66446008)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: glfV4SY3ngE3KrGkPLGoe9cTwD2rkcrXByG2bLnlnM1HTMUv04BiMC8m6f4l5kU2ZvCVptAt/2SKdg9ZZW7uw1xXuPs6b5QjfyS1gA0AfX9V3MXhad0CmSGVmM98t2lrxyVm+yODG3w4FNWNpq2GuNJSmiRj7MBr3cSe1yatyh18SOsf1a4oLwZgzJtfmU9aY8H47ogGF3VWcuQ1bpnOjSnWObNqFGfr+G3+agX7RypZpH3lrz+oLk85xulsqz3Mer0I4Q421TDV/dDs3hGCWwSlbcJnBabOqp4Z1RwfncddOMCEk2F3PueONSu28gnG3bTtSYkUmBKCBCQNPOfVNWd/HTBGuYEcbHrFdHrwIeuilfxnlL+hYzQ0J1b4x33Rs4dNlGMcnYfTqfb88evia1qcdp0U6gaS9Do6I09pXumYrz/GwF1HTgQqhNs7e6xFWutZCwJPkK8QDLKAM9FYjuE0MrQHdx+tjuZtW3n51N0gzyBz8HVklP3er6bxBG2fALb8mD5heCLVmBRVoVOKSp47RV2Hcd37AXz+E6NvVvmxH73I+Baqubg3QxUEOZcE5yAwU9y80tMZOy+6daMazQNzhqCn4VMC8g+LW+vWUObwnAhMFmvNNlQpBfAXXfreJlT4GRU+bul7Q4EkaIO+EA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <056EF1EB68A39A448C9B15620E49399D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e3e0ff-15e2-428b-c097-08d864684585
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 11:10:27.6316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ASBgsGDUzETzeVVxpLtBuZMyD9zJef7bXEnm7rrk2YeGHFrhOfOqFkJnJUp7tmEAByYKKpLy7cM/gY4sqdawvBtEk8Mt0fB//oTcO3uPiXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3701
X-OriginatorOrg: citrix.com

SGkgYWxsLA0KDQpUaGUgcHJvcG9zZWQgYWdlbmRhIGlzIGluIGh0dHBzOi8vY3J5cHRwYWQuZnIv
cGFkLyMvMi9wYWQvZWRpdC9hZ0M5SEpaWDdTdWFURFYzajhycm5PcUEvIGFuZCB5b3UgY2FuIGVk
aXQgdG8gYWRkIGl0ZW1zLiAgQWx0ZXJuYXRpdmVseSwgeW91IGNhbiByZXBseSB0byB0aGlzIG1h
aWwgZGlyZWN0bHkuDQoNCkFnZW5kYSBpdGVtcyBhcHByZWNpYXRlZCBhIGZldyBkYXlzIGJlZm9y
ZSB0aGUgY2FsbDogcGxlYXNlIHB1dCB5b3VyIG5hbWUgYmVzaWRlcyBpdGVtcyBpZiB5b3UgZWRp
dCB0aGUgZG9jdW1lbnQuDQoNCk5vdGUgdGhlIGZvbGxvd2luZyBhZG1pbmlzdHJhdGl2ZSBjb252
ZW50aW9ucyBmb3IgdGhlIGNhbGw6DQoqIFVubGVzcywgYWdyZWVkIGluIHRoZSBwZXJ2aW91cyBt
ZWV0aW5nIG90aGVyd2lzZSwgdGhlIGNhbGwgaXMgb24gdGhlIDFzdCBUaHVyc2RheSBvZiBlYWNo
IG1vbnRoIGF0IDE2MDAgQnJpdGlzaCBUaW1lIChlaXRoZXIgR01UIG9yIEJTVCkNCiogSSB1c3Vh
bGx5IHNlbmQgb3V0IGEgbWVldGluZyByZW1pbmRlciBhIGZldyBkYXlzIGJlZm9yZSB3aXRoIGEg
cHJvdmlzaW9uYWwgYWdlbmRhDQoNCiogVG8gYWxsb3cgdGltZSB0byBzd2l0Y2ggYmV0d2VlbiBt
ZWV0aW5ncywgd2UnbGwgcGxhbiBvbiBzdGFydGluZyB0aGUgYWdlbmRhIGF0IDE2OjA1IHNoYXJw
LiAgQWltIHRvIGpvaW4gYnkgMTY6MDMgaWYgcG9zc2libGUgdG8gYWxsb2NhdGUgdGltZSB0byBz
b3J0IG91dCB0ZWNobmljYWwgZGlmZmljdWx0aWVzICZjDQoNCiogSWYgeW91IHdhbnQgdG8gYmUg
Q0MnZWQgcGxlYXNlIGFkZCBvciByZW1vdmUgeW91cnNlbGYgZnJvbSB0aGUgc2lnbi11cC1zaGVl
dCBhdCBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFkL2VkaXQvRDl2R3ppaFB4eEFPZTZS
RlB6MHNSQ2YrLw0KDQpCZXN0IFJlZ2FyZHMNCkdlb3JnZQ0KDQoNCg0KPT0gRGlhbC1pbiBJbmZv
cm1hdGlvbiA9PQ0KIyMgTWVldGluZyB0aW1lDQoxNTowMCAtIDE2OjAwIFVUQyAoZHVyaW5nIEJT
VCkNCkZ1cnRoZXIgSW50ZXJuYXRpb25hbCBtZWV0aW5nIHRpbWVzOiBodHRwczovL3d3dy50aW1l
YW5kZGF0ZS5jb20vd29ybGRjbG9jay9tZWV0aW5nZGV0YWlscy5odG1sP3llYXI9MjAyMCZtb250
aD01JmRheT03JmhvdXI9MTUmbWluPTAmc2VjPTAmcDE9MTIzNCZwMj0zNyZwMz0yMjQmcDQ9MTc5
DQoNCg0KIyMgRGlhbCBpbiBkZXRhaWxzDQpXZWI6IGh0dHBzOi8vd3d3LmdvdG9tZWV0Lm1lL0dl
b3JnZUR1bmxhcA0KDQpZb3UgY2FuIGFsc28gZGlhbCBpbiB1c2luZyB5b3VyIHBob25lLg0KQWNj
ZXNzIENvZGU6IDE2OC02ODItMTA5DQoNCkNoaW5hIChUb2xsIEZyZWUpOiA0MDA4IDgxMTA4NA0K
R2VybWFueTogKzQ5IDY5MiA1NzM2IDczMTcNClBvbGFuZCAoVG9sbCBGcmVlKTogMDAgODAwIDEx
MjQ3NTkNClVrcmFpbmUgKFRvbGwgRnJlZSk6IDAgODAwIDUwIDE3MzMNClVuaXRlZCBLaW5nZG9t
OiArNDQgMzMwIDIyMSAwMDg4DQpVbml0ZWQgU3RhdGVzOiArMSAoNTcxKSAzMTctMzEyOQ0KU3Bh
aW46ICszNCA5MzIgNzUgMjAwNA0KDQoNCk1vcmUgcGhvbmUgbnVtYmVycw0KQXVzdHJhbGlhOiAr
NjEgMiA5MDg3IDM2MDQNCkF1c3RyaWE6ICs0MyA3IDIwODEgNTQyNw0KQXJnZW50aW5hIChUb2xs
IEZyZWUpOiAwIDgwMCA0NDQgMzM3NQ0KQmFocmFpbiAoVG9sbCBGcmVlKTogODAwIDgxIDExMQ0K
QmVsYXJ1cyAoVG9sbCBGcmVlKTogOCA4MjAgMDAxMSAwNDAwDQpCZWxnaXVtOiArMzIgMjggOTMg
NzAxOA0KQnJhemlsIChUb2xsIEZyZWUpOiAwIDgwMCAwNDcgNDkwNg0KQnVsZ2FyaWEgKFRvbGwg
RnJlZSk6IDAwODAwIDEyMCA0NDE3DQpDYW5hZGE6ICsxICg2NDcpIDQ5Ny05MzkxDQpDaGlsZSAo
VG9sbCBGcmVlKTogODAwIDM5NSAxNTANCkNvbG9tYmlhIChUb2xsIEZyZWUpOiAwMSA4MDAgNTE4
IDQ0ODMNCkN6ZWNoIFJlcHVibGljIChUb2xsIEZyZWUpOiA4MDAgNTAwNDQ4DQpEZW5tYXJrOiAr
NDUgMzIgNzIgMDMgODINCkZpbmxhbmQ6ICszNTggOTIzIDE3IDA1NjgNCkZyYW5jZTogKzMzIDE3
MCA5NTAgNTk0DQpHcmVlY2UgKFRvbGwgRnJlZSk6IDAwIDgwMCA0NDE0IDM4MzgNCkhvbmcgS29u
ZyAoVG9sbCBGcmVlKTogMzA3MTMxNjk5MDYtODg2LTk2NQ0KSHVuZ2FyeSAoVG9sbCBGcmVlKTog
KDA2KSA4MCA5ODYgMjU1DQpJY2VsYW5kIChUb2xsIEZyZWUpOiA4MDAgNzIwNA0KSW5kaWEgKFRv
bGwgRnJlZSk6IDE4MDAyNjY5MjcyDQpJbmRvbmVzaWEgKFRvbGwgRnJlZSk6IDAwNyA4MDMgMDIw
IDUzNzUNCklyZWxhbmQ6ICszNTMgMTUgMzYwIDcyOA0KSXNyYWVsIChUb2xsIEZyZWUpOiAxIDgw
OSA0NTQgODMwDQpJdGFseTogKzM5IDAgMjQ3IDkyIDEzIDAxDQpKYXBhbiAoVG9sbCBGcmVlKTog
MCAxMjAgNjYzIDgwMA0KS29yZWEsIFJlcHVibGljIG9mIChUb2xsIEZyZWUpOiAwMDc5OCAxNCAy
MDcgNDkxNA0KTHV4ZW1ib3VyZyAoVG9sbCBGcmVlKTogODAwIDg1MTU4DQpNYWxheXNpYSAoVG9s
bCBGcmVlKTogMSA4MDAgODEgNjg1NA0KTWV4aWNvIChUb2xsIEZyZWUpOiAwMSA4MDAgNTIyIDEx
MzMNCk5ldGhlcmxhbmRzOiArMzEgMjA3IDk0MSAzNzcNCk5ldyBaZWFsYW5kOiArNjQgOSAyODAg
NjMwMg0KTm9yd2F5OiArNDcgMjEgOTMgMzcgNTENClBhbmFtYSAoVG9sbCBGcmVlKTogMDAgODAw
IDIyNiA3OTI4DQpQZXJ1IChUb2xsIEZyZWUpOiAwIDgwMCA3NzAyMw0KUGhpbGlwcGluZXMgKFRv
bGwgRnJlZSk6IDEgODAwIDExMTAgMTY2MQ0KUG9ydHVnYWwgKFRvbGwgRnJlZSk6IDgwMCA4MTkg
NTc1DQpSb21hbmlhIChUb2xsIEZyZWUpOiAwIDgwMCA0MTAgMDI5DQpSdXNzaWFuIEZlZGVyYXRp
b24gKFRvbGwgRnJlZSk6IDggODAwIDEwMCA2MjAzDQpTYXVkaSBBcmFiaWEgKFRvbGwgRnJlZSk6
IDgwMCA4NDQgMzYzMw0KU2luZ2Fwb3JlIChUb2xsIEZyZWUpOiAxODAwNzIzMTMyMw0KU291dGgg
QWZyaWNhIChUb2xsIEZyZWUpOiAwIDgwMCA1NTUgNDQ3DQpTd2VkZW46ICs0NiA4NTMgNTI3IDgy
Nw0KU3dpdHplcmxhbmQ6ICs0MSAyMjUgNDU5OSA3OA0KVGFpd2FuIChUb2xsIEZyZWUpOiAwIDgw
MCA2NjYgODU0DQpUaGFpbGFuZCAoVG9sbCBGcmVlKTogMDAxIDgwMCAwMTEgMDIzDQpUdXJrZXkg
KFRvbGwgRnJlZSk6IDAwIDgwMCA0NDg4IDIzNjgzDQpVbml0ZWQgQXJhYiBFbWlyYXRlcyAoVG9s
bCBGcmVlKTogODAwIDA0NCA0MDQzOQ0KVXJ1Z3VheSAoVG9sbCBGcmVlKTogMDAwNCAwMTkgMTAx
OA0KVmlldCBOYW0gKFRvbGwgRnJlZSk6IDEyMiA4MCA0ODENCuKAi+KAi+KAi+KAi+KAi+KAi+KA
iw0KDQpGaXJzdCBHb1RvTWVldGluZz8gTGV0J3MgZG8gYSBxdWljayBzeXN0ZW0gY2hlY2s6DQoN
Cmh0dHBzOi8vbGluay5nb3RvbWVldGluZy5jb20vc3lzdGVtLWNoZWNr

