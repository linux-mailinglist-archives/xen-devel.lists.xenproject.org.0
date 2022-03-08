Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C334D1A2B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:16:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286980.486722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRacz-0000GW-1f; Tue, 08 Mar 2022 14:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286980.486722; Tue, 08 Mar 2022 14:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRacy-0000Dn-UI; Tue, 08 Mar 2022 14:15:52 +0000
Received: by outflank-mailman (input) for mailman id 286980;
 Tue, 08 Mar 2022 14:15:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yKud=TT=citrix.com=prvs=05922dae9=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1nRacx-0000Dh-Qa
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:15:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f631ff3-9eea-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 15:15:50 +0100 (CET)
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
X-Inumbo-ID: 3f631ff3-9eea-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646748950;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2HeHIKEdlrtjMXLcUpqnf2x/zartlFrxW/wUCgLAFu8=;
  b=TXyQB3zHS3lD0x2L31ZRpoauUsJbo84lesEYuiqS1hz0znayrLOGcwZr
   8kxV0Vyj3vQaXKPNEMS2w1RNU3/4ppy4qUZzFhIk5vuJWEbwS0CGZLxaa
   64evd7vyol05uEHWzeeQ+xGOKiId5F7aV0paOBMupze6/dnYJi80VdR7L
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65715608
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nZcmoK9uNKVLaJU7y3OfDrUDXX6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mJOCG/XOPfeM2OnLtkkOtm+oBgAu8OBy4drT1RlrSo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oDpW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZyuECUGJ5Dco9hHXQAHDH8gMKNgpZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYoWomyTjWAOw5SJTHa67L+cVZzHE7gcUm8fP2O
 ZdGMGcxNESojxtnOnszJIsbkeqRgmDuYzdduGnOqvAryj2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfQmQvrVYRUE6e3ntZph1uJz2BVFxwSVnO8u/CyjkP4UNVaQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l4qje7hudB2MEZiVcc9Fgv8gzLRQoy
 1uIktXBFTFp9rqPRhqgGqy89G3of3JPdClbOHFCHVBtD8TfTJ8bjgyWbPl6Lb6Osof7AG7vn
 W6Hog5jruBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxL1WVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romxe0O
 Cc/WisLvfe/2UdGi4ctO+pd7OxwkcDd+SzNDKy8Uza3SsEZmPW71C9vf1WM+GvmjVIhl6oyU
 b/CL5ryUylKVP8+nGftLwv47VPN7nplrY80bcqnpylLLJLEPCLFIVv7GAHmgh8FAFOs/1yOr
 oc32zqiwBRDSuzuChQ7AqZIRW3m2UMTXMisw+QOL7brClM/RAkJVq+AqZt8KtcNt/kEyY/1E
 oSVBxYwJKzX3iacd21nqxlLNdvSYHqIhS5jbXx2YwfygCRLjETGxP53SqbbtIIPrYRL5fV1U
 +MEa4OHBPFOQS7A4DMTcd/2q4kKSfhhrVvm0/aNCNTnQ6Ndeg==
IronPort-HdrOrdr: A9a23:n25HNKjaHSOSGrK8c/xawMqqE3BQXuYji2hC6mlwRA09TyX+rb
 HLoB17726QtN9/YgBCpTntAsi9qBDnm6Kdg7NhWotKNTOO0AHEEGgL1/qF/9SKIVydygcy78
 ddmoFFeaTN5QcQt63HCXODfOrIauP3iJxA/t2z80tQ
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65715608"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWhQRxtVV0/8q2MDZNU+624k49PhWKvEA+2caYLy/3ReA+iz+g1q7YHL1E6Rle22yCzhD+oQeo1ckRScaA1IcGIrZ6033VE/eWv9d79EqqJuYeI8ot3wUkMtdiHCEIoi6a4gLZg1kszYwIvusb3UfwWMcKxNrKQJC60A6aHcwdp45+v9IoL4LLULZNOINewLxp6KX4TM7Jq9/NjTOjq1qBSpin2FQjKglgSeTZZNqHgrhSZ4an5yRuhtQgSWDBoJTe4r7VAMVl/r1Ug72y5ToRGUlqTdvve88hUmDZWIdqIoUYQ5tZy5tdHkf5CQFbeFCc1PtUB3pNHkLNDcIGZJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9iAbsB1s/A4KnLEnio5YFYI+jMcy7yQMqj8sr4/nNM=;
 b=m8w8JNXfQBgReBjSAKE6KRpjwYho3ReUV/9wIi3NreazSYx5W4q85zAuViA7uzj8gy6F4JOtw9r/htfZTObLfH7he1lcJOZgd0NoB20QinQwfkRdZ/MbS5TRYndiTvQSD+ixrkcmC6mXsPiX7Vh4yl9Hf06PRw19mmUemjzstd68Q9wsy5P9zItfcmq9a3WAPagZSwMjBLO8DtFU8lUZDbcxopUSAZZ2SHnvilnowCqvwzNwH3CrG5N1QA8HlM3grNZSFSxrC8l6q1mEs/QVk6DGUjxALy/90TzhremFkQ3YtoO428wsfoxogJEGhWPh9sjWdLkrQwHVg4B5lMnCmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9iAbsB1s/A4KnLEnio5YFYI+jMcy7yQMqj8sr4/nNM=;
 b=HeQDdlKrhrsIZwN0MqtEv1siw3O9ztB3DYLTMRiBdNRvZHwep3pgML2YeJTAdVY1lrFCPK7onOtMOoXXoyi/9e9KkCCyt0eZhmjxUEcsGApNmLkyHNfD5UvSI8S2Ghq9zFBJDkCmNyeywxU1N08Q+F21YC1di5hUklTJWn9ACtY=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [XEN PATCH v9 06/30] build: rework test/livepatch/Makefile
Thread-Topic: [XEN PATCH v9 06/30] build: rework test/livepatch/Makefile
Thread-Index: AQHYEdsrj9o/gZSMNUai9NV68j69Pqy1yb8h
Date: Tue, 8 Mar 2022 14:15:43 +0000
Message-ID: <PH0PR03MB6382F515DBAB3C21DCA2FA59F0099@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-7-anthony.perard@citrix.com>
In-Reply-To: <20220125110103.3527686-7-anthony.perard@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 95a5186f-1154-a36f-bbea-4d05aab51bb6
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b56c0180-af77-44d4-1f2b-08da010e21ad
x-ms-traffictypediagnostic: DM8PR03MB6261:EE_
x-microsoft-antispam-prvs: <DM8PR03MB62615C8D4AB16EBBA258EB9BF0099@DM8PR03MB6261.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lvTBvSRlfUU0HPh1R0xniD6I3M1rs4RAPEcvKqLtiNsZwbaH2Mu09D1RvgCWdH13WG47vByBmTDpyZAaU0ZT4UbQpeN+9GiOKc0rYga5/yBZzxVa7hBIdhvmpjy325i9czxHNJkArV3YJZtpfQ2ff+6AVT93Ulz8wKUWkHqZ0RjnHswHDeEv+cY8SpYwViXqlQAPd5MWet6NrPotnLn2Y2ncd3AiMRS8sKlRmOuUA8h4fiYvUhAU0lkpQlAD44JfdQmtPv/ZoWOpNpE+SyfHUlQWmlgt37WSxXh0XjqT7yvPYJpKsas37o93MwP1xMGCo2pp3xEVhL1J8m0h1fYpwWMwEDuyLQVQC6NobfXrdZsqFZOMwRe38q0atYs0q/yaVKJXV0aDYUF3OSxV7+j4iQertjShignBtPtYoS6Vin/4DZNu2uZcbiySXVWT5mxC0iFSJX77qJ5XAOvVwaLucugdgtadcXZtZ1+9BaSXOoGh3NN7SH8kjEACOIsAy0QK341ljelzTdrg2++H66xI6fK6IZRddk2M0aBgy+zv7xQWMBb9RiANPPl767MLYY8w7luDTgv2AiLqnooT/nnJTismH95AMZ1ND2svkxo1zXAyKTLM4/XGApJQutyzvoo05vXxnWnqSwsxIk7kmDql6laQDOQ6lKuvJfLIDWlZKLcfGespVFYUGRPjUO4xqc6HFVSMJr3ZHGsgX+SE5SEhZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(71200400001)(55016003)(53546011)(38100700002)(6506007)(2906002)(83380400001)(38070700005)(33656002)(82960400001)(5660300002)(316002)(91956017)(54906003)(26005)(8936002)(76116006)(66556008)(66946007)(52536014)(9686003)(44832011)(122000001)(86362001)(186003)(8676002)(66446008)(4326008)(508600001)(66476007)(110136005)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LOKu8rVF1KNdSCNRl+6mvP9EHsAcwVXk4hMJVRfq3ZjAVEcpsITT0FmOh9?=
 =?iso-8859-1?Q?nTgtn9lQipLGSngp27Xv9/r3u10hMjcdYKo+Tjw+2Ao0K1hjfKUP+TMElv?=
 =?iso-8859-1?Q?DG8eAGaItN9sNvLZOvI/2zRdIR5OjpkWuhBuyciXONkpfeULQ9sFXsvv0D?=
 =?iso-8859-1?Q?SpHitl9Lo57Ix26RJuj6GnuYQR5CzyW0CiT3kBbc01/c2kdBY0OfyUc1Ym?=
 =?iso-8859-1?Q?GXVs6yeHvw6PKAqD/evhESrnx2gI8kMiPgCk3qz6mPsSckKu2EQ35F5hIE?=
 =?iso-8859-1?Q?DhXijdpwtOn1n3pCZoxqtHBATxWsuMaNqUTwCsMfoNzEs8/KcRL0GfamXY?=
 =?iso-8859-1?Q?J+Jc85MQ6DcxqlKMlOuQbCrdTaiX2WUyPF3uipRg4webn9y9UokfQwjAFH?=
 =?iso-8859-1?Q?ea2oRVF/BVfzur8al1N6P/2lnWOoGplGnvolsRJo0NV2reqnJM4+4BPr0d?=
 =?iso-8859-1?Q?+UPxUfRbDk3hMeVJ2L2CLgoP/5L2b48/tDBvcWlkoQgQSVr/oDbeWKGLxr?=
 =?iso-8859-1?Q?04qR4k3Ms6Db9Hn5RQeuqTkrczcDO+8GuySSpDhHl3DVIA3UhW6Z1lnIZA?=
 =?iso-8859-1?Q?SlJXtM0ob4p04aswoDuvbZWJ+NPdpGUkPXZjCn8RMCgUI9lBWz3LtY3KJ7?=
 =?iso-8859-1?Q?j9fXWWtvTu591Mja4uCForu4wYkADlNQIp6POh2qns3sLnFbkKjNusrxDm?=
 =?iso-8859-1?Q?3uwCaRW0fyu3DPn3etrgaihqTfjNRmPvJjz4pnDw25ghkNHE9/iukTWGY8?=
 =?iso-8859-1?Q?zsEO0Wt5gAQA91AxKThFsFERxG5yTeGvKVVxuvdW65FRV3FQPlaOeci5XT?=
 =?iso-8859-1?Q?JkkfxkpUeJNr9dDb5K6S7wOkBhFA5xyPrVICcDo1DAjFLl2qPwGYSPPK3X?=
 =?iso-8859-1?Q?ZpLLPoaMyTWvhNTv1bWFde7JmVE9ZTe6+IhSL2VbmgawkFpBuNyvHW0EBN?=
 =?iso-8859-1?Q?mYoFZodRUy1CAB9cfMO++vRtmUVHWixmxfu5icj2eE7zdH2HytyNB924wR?=
 =?iso-8859-1?Q?ucgwzSeA01fIwPaP593yY8dryZgCN8PKoNyz27T9ZwM7Flq4iQvpa/bqZm?=
 =?iso-8859-1?Q?TvOrBuzK1epaQ+BXyLCHAX10Lkj17uMNDkP+Ys6wBUA3MUZMrfL7ILSQlb?=
 =?iso-8859-1?Q?KZhhmjlM3r9VTnuONkbwtBHHs8+8EfUm6kx6FQ6hIsuAe09wDZLj89PQxh?=
 =?iso-8859-1?Q?B6GOxrXLuPbEt0m0Jx4ENdQZWd3X82wdkk6NPD1hfuzU2h1qNSfTI8PpO3?=
 =?iso-8859-1?Q?9qhpa1g5l1rsRgJQBamtZ2siseOR0BUQtZ17+2pJwg0dUQ4sQgyg6Vcic7?=
 =?iso-8859-1?Q?NPL/Sj51XzwVtW7K+k6LcwY16rryEB8BMbur75Kx8/m01b+WPeSRENQiYR?=
 =?iso-8859-1?Q?ffJ5fucxphmCL+qXT1rgorS8yEcHB47taJi994wKwwqlznlz+mkGosbdau?=
 =?iso-8859-1?Q?eJ77PJswh21HrVaaPmpFlVv0DUPM8pctZ8CZVJEz+XEgrJE+clX6KmdFai?=
 =?iso-8859-1?Q?ca+lOLtHQSArV4fXdaKr126K/bgspw0bU2diei8EVAYiIN5TIQd6DCS47b?=
 =?iso-8859-1?Q?m6X+tflWmmjnDlaVkgEfQwBuvBZZ3QwHPVEJ9bGpiW73NAoOjCrDejdlyE?=
 =?iso-8859-1?Q?ecNN41rsdnlrlRL44v22l30SCJGDbyvuiv72JdhcwVOfxAL4VHCqvy9ylF?=
 =?iso-8859-1?Q?IFY2kyZH3+9HO/zwwAf7v8cbvPbtPQmv2EX2HlCqwFvHP7mclpt8NAKQmK?=
 =?iso-8859-1?Q?Y9EA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b56c0180-af77-44d4-1f2b-08da010e21ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 14:15:43.1260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3dVe8Q68b2AAnj8L9mdLjLaqJrTTSKAMzjB9fYgpGlc1UbLdTxx+c0AqWw45IjtjLGlg9BUDi6KIXLD6e71XVY+rAXp4IstMSjY/B/lO9I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6261
X-OriginatorOrg: citrix.com

> From: Anthony PERARD <anthony.perard@citrix.com>=0A=
> Sent: Tuesday, January 25, 2022 11:00 AM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Anthony Perard <anthony.perard@citrix.com>; Jan Beulich <jbeulich@sus=
e.com>; Andrew Cooper <Andrew.Cooper3@citrix.com>; George Dunlap <George.Du=
nlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini <sstabe=
llini@kernel.org>; Wei Liu <wl@xen.org>; Konrad Rzeszutek Wilk <konrad.wilk=
@oracle.com>; Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Subject: [XEN PATCH v9 06/30] build: rework test/livepatch/Makefile =0A=
>  =0A=
> This rework the livepatch/Makefile to make it less repetitive and make=0A=
> use of the facilities. All the targets to be built are now listed in=0A=
> $(extra-y) which will allow Rules.mk to build them without the need of=0A=
> a local target in a future patch.=0A=
> =0A=
> There are some changes/fixes in this patch:=0A=
> - when "xen-syms" is used for a target, it is added to the dependency=0A=
>   list of the target, which allow to rebuild the target when xen-syms=0A=
>   changes. But if "xen-syms" is missing, make simply fails.=0A=
> - modinfo.o wasn't removing it's $@.bin file like the other targets,=0A=
>   this is now done.=0A=
> - The command to build *.livepatch targets as been fixed to use=0A=
>   $(XEN_LDFLAGS) rather than just $(LDFLAGS) which is a fallout from=0A=
>   2740d96efdd3 ("xen/build: have the root Makefile generates the=0A=
>   CFLAGS")=0A=
> =0A=
> make will findout the dependencies of the *.livepatch files and thus=0A=
> what to built by "looking" at the objects listed in the *-objs=0A=
> variables. The actual dependencies is generated by the new=0A=
> "multi-depend" macro.=0A=
> =0A=
> "$(targets)" needs to be updated with the objects listed in the=0A=
> different *-objs variables to allow make to load the .*.cmd dependency=0A=
> files.=0A=
> =0A=
> This patch copies the macro "multi_depend" from Linux 5.12, and rename=0A=
> it to "multi-depend".=0A=
> =0A=
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>=0A=
> Acked-by: Jan Beulich <jbeulich@suse.com>=0A=
> ---=0A=
> =0A=
=0A=
Acked-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

