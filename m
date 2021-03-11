Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A06D33790F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 17:19:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96679.183179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKO1W-0001nM-Qw; Thu, 11 Mar 2021 16:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96679.183179; Thu, 11 Mar 2021 16:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKO1W-0001mx-N2; Thu, 11 Mar 2021 16:18:54 +0000
Received: by outflank-mailman (input) for mailman id 96679;
 Thu, 11 Mar 2021 16:18:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcZr=IJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lKO1V-0001ms-Bz
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 16:18:53 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7003e126-7f8e-4cb5-b2a8-de938ca58d3f;
 Thu, 11 Mar 2021 16:18:52 +0000 (UTC)
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
X-Inumbo-ID: 7003e126-7f8e-4cb5-b2a8-de938ca58d3f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615479532;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=x7YUYrmdrRgeguyBY9JGjIqs+8LZL7I2/XLMJjbfXG4=;
  b=gDigL+DV2exS/1GPYCGUivdacNTYGf7Z8lT8YTYQHf0f9nTslCb676Pn
   RG4TjTkca97bk8qGCizzwFsY4DCvfaxpy+jqVbm5CMjq2NdiSYmrdzwJX
   fdVTeJMqZRjPfm6JYiz0eDGlfr9/2Rmypiqqe2EOIdStJUy1kWeSa46tW
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wa9iYxhT79aHbbOR9AyHkXuZe9lHhjJpFIkNxRI6c0jB3NItdicUYkRYpQktpWiQHOnhRfXbTm
 qbHQisPb32rivUhS/D/wAAHGOL8FgqDSlk2PjFva5P4m99j8SbSCZQVTak41ghsbZKUUPtmety
 BIJEvXOLguNlIk628j3x5xQ6MXLh3oPM8NegCqdAgOrBj+xTfLYDEwjyBAZdmTPdhvFBKfFrE/
 JzkzjOVeKHJ+8qaAs8Bm58f8AaVvdW8TdXFa0LvOep64tkY2s9N4Lcbr9bHV4E7kOMTLWk7puV
 kUY=
X-SBRS: 5.2
X-MesageID: 39068817
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mlvOoKCaPoVdmv/lHegDtMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPvfVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VLdMgXE3Kpm2a
 9kGpITNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0McShBQchbnmNEIyycFVB7QxQDIJI/Go
 aV6MYvnUvfRV08aMOnCn4ZG9XZr9rQm578JTIADRgr6A6B5AnYl4LSOR6ewxsYTndz0a4vmF
 K17zDRy4eCl7WAyhHa33LO9Jg+orrc4/ZKGcDksLlvFhzCkQCtDb4RPYGqnDdwm+237UZvrd
 +kmWZcA+1Wy1f8Ol64ugHs3Q6I6kdd11bHxUWDiXXu5ezVLQhKc/Zpvo5SfhvH50dIhrgVu8
 gnrgHp1esiMTr6kCvw/NTOXR1x/3DExkYKquIPk2dZFbIXdb45l/1twGpuDJwCECjmgbpXad
 VGMce03ocyTXqndXzD+kFgzNuwN05DZCuucwwpv8yY1CVuh3Zpz0cU79x3pAZxyLsND7ZD/O
 jKKaJuifVnSdIXd7t0AKM7TdKwEXGle2ODDEuiZXDcUI0XMXPErJD6pJ0z+eGRYZQNiL8/go
 7IXl90vXM7EnieSPGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uu9HImYRcPuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFOUIp9cAXU6UqM6jEPyoisXrNNLoYJb9GzctXW3yRl
 EZWiLoGclG5ke3HlDihhz8XG7sZ1zf8Zp8HLOyxZlW9KE9cql39iQFg1Ww4c+GbRdYtLYtQU
 d4KLT71oO3zFPGulrg3iFMAF5wH0xV6LLvXzdhvgkRKX75dr4FppG6cWBW132XGw9nQ6rtYU
 hijmUy3ZjyA42bxCgkBd7iGHmdlWEvqHWDSIpZvaGf+8H/eNcdAow9UKJ8USXHfiYF2TpCmS
 NmUkspV0XfHjThheGOl5oPHtzScNF6nUOMOs5bqXXWsG2GvsExTn4nXzqjOPTnxDoGdn5xvB
 lc4qUfiL2PlXKEMm0kmtk1N1VKdSCqGr5cNR+EY49Vg7jvXwl1QQ6x9GWnoiB2XlCv21QZh2
 TnIyHRXf3QGFJStkpV1bvQ/Epuen+QeF9xbX5GoZRwfF62z0pb4KuuXO6ewmGRYlwNzqUmPD
 bJbSA7Dyluy9q0vSTl1QqqJDED/NEDL+bdBLMsf/XvwXurMpSPjrxDNeRT5oxZONfntfIrXe
 qTdxSOFi7xD/ok1mWu1y4YERgxjENhveLj2RXj4mT94WU2BuDKJk96A54cONOR4gHfNr61+a
 Q8qehwm+S+Mm/8MIHbjY7WaiNOMRPVryqdSfoypZVdoKI1s/9SEvDgIE31/UAC+C97CsH+0H
 46auBcxpvqP4d0Zcwcey5D5DMS5Z6yBXpuljazO/M0eFEmsmTSMNyI6YfZsLZHODz3mCLAfX
 2ktxBH9/jLXyG/xacXJqI5L2NRclU94h1Zjaq/XryVLAWhbOdY+lWmdle7bb9GUaCAcI9g4i
 pS0pWtn+WNcTD/1x2VlTxnIrhW+2LiZc+pGgqDFapp9NO9UG78zZeC0YqWjD3tTyG8ZFldrY
 pZdVYIZsAGswIctuQMo2OPY52yhFkknVtY6SxmkVCo+rHO2harIWh2dSvDgptXWjFPNGOvls
 qty5nC6EjA
X-IronPort-AV: E=Sophos;i="5.81,241,1610427600"; 
   d="scan'208";a="39068817"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIBAlC5AyDUV/soVo9JZCNMft3oj+hrRUMAeaOM5V6vXGGNc2Zg6aENdmzpUcxrOkaEcD3APpWtr4p/oF9kR41FGcN6lJacZ3Tb0JSMLLYmd1fhk1LQFNCjXMVKmyt8bVZ3GAx1mYPimtodEEQIyQ5zqGipkR8gfPHlaLnNUCeT2DdxJeh3owY0rEc8SOeNjRd+yLTO5ySE5gJyMi6AlQlJ7AU9iJA+xnzFfgN8ar8JE1+G/Ta5KEBOPmQwa7l3Ozan2LbA6I0GLFtPcbCF3Qg+qWUoDx6l7kJLTWpH9to2gJ9+kZ2cM91hGrjKuwMV/ELa9nXecSJhLtsaV131qiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7YUYrmdrRgeguyBY9JGjIqs+8LZL7I2/XLMJjbfXG4=;
 b=B6eOk5VCy+gxSviRINAC/bOa7lUAAQz7/lLjXCseCitfCEgLlu38NipMqjcK+NI65XbQa5sUKV3LygoWBm/0S54MCFEdbqBIIuKV9ODYkcQXkHX+7NpVmY982ziI6KnrKYnlFJLh0blqtktvblwz7FnOb32g2d9jF35JzH3q931QzmZbe+dzpZGOQaInOcUPELx2PuK6KXmkixdn1ezzcc1XbNrw1EyFOm+jI++1pQGizHLGXj2DQcEvpP9QOMgQIVXX8LLq4ROjy4FlyiDacEEaqDOL7HWNgsX756zddfHzIIM1KE4sK84TGUkpN8We/BxolPjgWfhU4TEmPQjTHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7YUYrmdrRgeguyBY9JGjIqs+8LZL7I2/XLMJjbfXG4=;
 b=CZC9lLaH7W8M/ky3smXVadk7VAhmEK5OSakxaBmI27N3J8IOXVn/Ki3Rvcuzur6oo1a7bMe+iEJcERIzOUnJ5PEqqX+N41wjnrOyM99FVXJUJ9NJWHFXEQG/ljOX3Fqi3VgGtrAkdT2Bof0PFXzrJA4cHNALsnceVNN5S1E0SEw=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, "Paul
 Durrant" <paul@xen.org>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
 <d375232a-d1a7-737c-0887-8b7e1c9a772d@suse.com>
 <13f03a67-18c2-e564-a0f6-84eccc7eeb76@citrix.com>
 <556ce32b-5087-b8b1-432e-643218dd8c6e@suse.com>
 <9ca069ab-8b6c-c8f1-d68b-4a9bb0cf5c56@citrix.com>
 <c8ed458a-6064-95d3-f189-f0928b09baca@suse.com>
 <62b79d56-2438-23ab-49c0-a8c4b290c4f7@citrix.com>
 <9a248354-f68b-8cba-f18c-f4a26473f9bf@suse.com>
 <586f5bcc-9d96-dc37-2aa1-aed0bf11117c@citrix.com>
 <0779dcee-4aa1-019c-3e6d-5b6330e395ee@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
Message-ID: <ab275b31-9800-c358-b7b1-1d052a7d08e4@citrix.com>
Date: Thu, 11 Mar 2021 16:18:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <0779dcee-4aa1-019c-3e6d-5b6330e395ee@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0070.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::21) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4187c471-da05-42fc-f3d4-08d8e4a94ffb
X-MS-TrafficTypeDiagnostic: BN7PR03MB3828:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB38282A22633951F748EA7678BA909@BN7PR03MB3828.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1MVTdaAJLCRR505ReOtWeU8yDdsEDWV3nmUT1A6/dfp9zd+bwJqLqiFDm2Z9BEIg9qKmnqzH8RvGSlVhebQ2Pd3qwPNrRh6VV90LQdyGcMr8D3CTgRXQxbIqROBLkQSKttkK5RXwvRIuPQ0ff7F8LodEakU7Hj46hxsw/9KED9KILEQmxVfoQIh/4kLIv5kqhAUV3FMJeJ5ZiycrIphRc6c9KvR3NgYsS7QNYf20kwO5HG9tgJc8O8gtQI4oWh0CQSXlJ+Xbh9w6JlhAAFpSbb8NgZwl9T0MOYQIlD274Ak3sukQKaa65HsREF7SUDpuHs2LGfZOp9hMVzdrC6bIE/KyzBAFKMd1NI2H6K5NliG9UhPuwVgG40e7aZWkcwiwy1XewnseqLvpHOcj7R0sPt/Zjkw1HPCx67z5qagHOWCqudzYfZkkMbHXR7VCFoJKMmYLkzwOlfe6gi8A6oo0JMVhW+Bzsff53HO0cEsOWXOggOq9pmWPr3wxIXFChXHGHOoSmN7XpWgeoEFPi9HypWo8ekMCwyJIe/VzSuOgUxax7MKxEjWaaULb/4IGWAZlbcwyXLobOcrzu/7p8Ejsap9LCZQwlMzLkk1FFnuKnL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(478600001)(66476007)(6666004)(66946007)(66556008)(31686004)(86362001)(316002)(26005)(54906003)(8936002)(53546011)(8676002)(16576012)(4326008)(83380400001)(186003)(2906002)(16526019)(6916009)(31696002)(5660300002)(2616005)(956004)(36756003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q3hoV1VCamVmL2Y4cFlKZkYzT0RYTTEvaUNxMWx0YksxWm81bnlaaHZUakVo?=
 =?utf-8?B?QnhwdTRQbHY3bTA5Z1lwVnNtb0o2d0xxV2lKWTczamZ4NWQ1UXIvSGtGYXU3?=
 =?utf-8?B?WDNDUmNmYWZEQ3M0bUVoUGNFWUhBcTVVMmNTeXM3RkxRajNtZUxrWFFrMWtK?=
 =?utf-8?B?VzdjajhSaEk5R2wxSEdrWSt4TCtGZ0FQSVQrMmVXRjBzb0YzMjd0YlIvMUl1?=
 =?utf-8?B?U1NjRS9XOWZHUnpWZVZKbU1ISWw1cmRFNHZOcW4rQU1NbnExQkpHWUhhTVN1?=
 =?utf-8?B?NEEzR1NyQzhEV3MrK1JBamVWeG80UHJXRkF4VXN1Z2dVZy9hMlNXMVV1Qm5R?=
 =?utf-8?B?c2Urb0V6a2xOby9ab2RKRGd3Y0UvTCt3ckthOVBrNEVKWGFzRm9HQmJQaDhp?=
 =?utf-8?B?VzlUY3FpanRHcWplejJndXRnanBUZEYydlhSZllBTGdBY29MYm5VWFpaRlB4?=
 =?utf-8?B?VUw1UG9zeGJncFQ5bW5Mb0lwWDM5dzkxd3RyTFN6VmNHL0plU3h6cGI5NlJm?=
 =?utf-8?B?Y2VjUExzbm5MR0NyOVdRaW1PbUpEbFk5VUZDWk90cHQ2c2IvVm91NGdzdDcr?=
 =?utf-8?B?WDZWU1RiK2pJcEs5eGdIeVo2ZkZDYmh3Y09HWHBndFNUbGR5eGw3VkVhbXZP?=
 =?utf-8?B?WVFMbFdrUEY4MkhiWmV3ajBIajd1UnIrWGJwQVlNNWNuQzB1TXRJeTJvdUM4?=
 =?utf-8?B?MGdOWnVCbGYzTVhwYmkvWWd1ODlkdmVwRDJHUkRwMW9XNXkvcWY4RmoxeWRq?=
 =?utf-8?B?a3ExeHJGTG1kUzI2eU5KRVFwN1dhc0F4NFh0NVZPWkRISWFkTWRQdTN1Rk5J?=
 =?utf-8?B?VUtaa2VuTUhUVFM4cnhGcC9xMkU5eERNS2VtalJGRU5mMERyTko3K29zclA0?=
 =?utf-8?B?eXI5SStMT1E2Z21tTTk5UlpaeGdWaDFYejM0VGNnN2tkVFpRN2NxRDdMZ1R6?=
 =?utf-8?B?eHVaTW40SWt1and0eUZMYTBLOTVreVhhVTZjL25POGQvanpvOVB0cExiK2RZ?=
 =?utf-8?B?dEZBemFrUWRXa3FJSlI5dWdrY3lJZGQxWElHQnB2aHFmUUdFcmVhVXNkK25n?=
 =?utf-8?B?M0ZHSXB6U0cwREZSZitXbEpWQ0U5bGllSDdWZHRvMzBFTENMell0dE45MTdo?=
 =?utf-8?B?UnRWUURBNExwMDJRZWFGQXBycWxWazB3VWVOQnpVK0FTbXRLNi9UWXA4aDFq?=
 =?utf-8?B?TXpjY2x6YzNmSTRMMzg1LzlQQ2lzWGZJOTF3QWlDaFY0eCs0M3BQak93dUZQ?=
 =?utf-8?B?eEQvK2NUdnNFL3NGWUphdkl3RllTa3JlRFpqNkV1dTRoOVdhUmdWMHJ3SWRk?=
 =?utf-8?B?TjE5TDdDVXVVWGYyellPL3hrMkllWUFmNUVaYzhzOEF3dGRtRmdqN3owbGpy?=
 =?utf-8?B?QXlYV1AvblpQN29XVS83UWxGbEdPZXpYajdlc2lYM0hFelZ1ZHJPZFFERzcy?=
 =?utf-8?B?L2kzUUJCN1Y5N2VWOGd4TTgrZWhxZ09WbldsZTJQRmtocDJ6a0NLVjVVcTJr?=
 =?utf-8?B?SHJad3VnVnZkTDU2aXBOY2VEN2lGT0lSVUZRK0RwYlFvNVhkRHVDbExNQVY1?=
 =?utf-8?B?T3VrT0dIVjZFTUZTTFQxMklEandGZUROeTh4QnVkdUEyUkNSM2ZRT20yMGx2?=
 =?utf-8?B?akpRNDg3VkQxQkpQTVRSczBQT2cvT0oyaXpWK0g5aGpCVzdVQk5vMmxyVUVP?=
 =?utf-8?B?QzkvQ2R3MEhqWko4ZEZSQUtPR2NCTTlRN2RFRVdrOFI2Z2RySG5qYis1Vlhw?=
 =?utf-8?Q?lVA95WSKFHqEwhsX7e7JgmOQaXnbEY2SLftyYGO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4187c471-da05-42fc-f3d4-08d8e4a94ffb
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 16:18:31.7392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usp43mGeKNEiZk5dvs7EXKHWBw20ELGx6ol4O2AU7il68uVEPx10hDH3oa5Bu4GMTG7S82R4LlSI1ZqpKXH2UCmZcMu6vTf53ALk0Bx94ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3828
X-OriginatorOrg: citrix.com

On 11/03/2021 14:44, Jan Beulich wrote:
> On 11.03.2021 14:43, Andrew Cooper wrote:
>> On 11/03/2021 13:28, Jan Beulich wrote:
>>> On 11.03.2021 14:00, Andrew Cooper wrote:
>>>> However, having laid things out in this way today, it occurs to me tha=
t
>>>> we should consider further cleanup as well.
>>>>
>>>> I do agree that code wanting to use the libxendevicemodel.h API almost
>>>> certainly don't want/need the dmop ABI.=C2=A0 (i.e. an individual cons=
umer
>>>> will want one, or the other, but almost certainly not both together).
>>>>
>>>> Should libxendevicemodel.h really be including dm_op.h?
>>> I was indeed wondering.
>>>
>>>> =C2=A0 AFAICT, it is
>>>> only the ioserverid_t typedef which is API shared between the two
>>>> contexts, and we can trivially typedef that locally.
>>> Hmm, a local typedef isn't nice - there should be one central point.
>>> Granted there's no risk for this to change in anywhere halfway
>>> foreseeable future, but still. Also neither C89 nor C99 allow a
>>> typedef to be repeated - in those versions we'd then rely on an
>>> extension.
>> I wonder if we're depending on that extension elsewhere.=C2=A0 As far as=
 the
>> stable libraries go, we are dependent on a Linux or BSD environment
>> currently.
> Right, but we'd like the headers to be consumable by any environment.
>
>> Alternatively we can drop the typedef and use uint16_t instead without
>> breaking things in practice.=C2=A0 (As long as we make the change in 4.1=
5 and
>> we lose the wiggle room afforded us by the entire interface being behind
>> __XEN_TOOLS__ previously).
>>
>> Thoughts?=C2=A0 I can't think of any ifdefary which would help, and swap=
ping
>> to uint16_t would reduce the use of an improperly namespaced identifier.
> I'm not outright against, but this might inspire people to use
> uint16_t elsewhere too, when they should use the typedef. How
> about a transient #define (suitably commented)?

Having actually experimented, it is more complicated.


/local/xen.git/tools/libs/devicemodel/../../../tools/include/xendevicemodel=
.h:283:45:
error: array type has incomplete element type =E2=80=98struct
xen_dm_op_modified_memory_extent=E2=80=99
=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_dm_op_modified_memory_extent extents[],=
 uint32_t nr);

so the dm_op include is necessary to use the libxendevicemodel API.

Also hvmmem_type_t and evtchn_port_t get used.

~Andrew


