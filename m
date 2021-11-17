Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA09454446
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 10:54:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226660.391756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHdx-0000un-BH; Wed, 17 Nov 2021 09:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226660.391756; Wed, 17 Nov 2021 09:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHdx-0000sl-7Q; Wed, 17 Nov 2021 09:54:17 +0000
Received: by outflank-mailman (input) for mailman id 226660;
 Wed, 17 Nov 2021 09:54:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=74+5=QE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mnHdv-0000MY-Sx
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 09:54:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51ac2e55-478c-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 10:54:14 +0100 (CET)
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
X-Inumbo-ID: 51ac2e55-478c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637142854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=lGayQy7igq6wHjy+WtROZSFSpXIwFKP2OUqy45QMeAA=;
  b=bAMd71P4/DlYBjCAlAbs5b05HNkaqss7gHA51JV6FAC+wkqwQg4KrXZF
   50dirvtLULSvssIm1d/xMgpOhwQiLUKk4s+x9JSGT4AIVGtGRl/bui8N7
   9sMKIvv4zmL3kUwY+t/CTNaR4CsQoWgzUkrLTFzSYGAj23oZ4AoNXHYz4
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1kbvPQ8GizthAtNr1XpRsymf1oqoeks2JKwjAyV5KHHdsjzq+rgV+5MhFaM7soTSDVoutjL8Yw
 xSo2jD7St159934DM00cyVi/5VXovUOts7DpKIPdiEOMnVUHiePAlwHkbtNFxIg7uoec99cVDf
 5GHuHcK99KOV3+Be6Gnd6672mjJL80WevHDQqb+8MK/3NUpzpmf1LJNzv01CQWWOtYISLCLT+V
 yrCAp2FMqcAmY3vEXVr5DVK8DVEvhhXdDyqKypNvOZLGBWm2E1RIDbmfimILuU9Sc5U+Hqe099
 2azRx72wUna7ey1wOCzbLSRG
X-SBRS: 5.1
X-MesageID: 58038805
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
 IxM4Xb3JBWwnslkSOt7CiZXWgu7Kic2Hk41xH0=
IronPort-HdrOrdr: A9a23:lvQEr6Byn6O5dpjlHeg9sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90c67MA/hHP9OkPQs1NKZMjUO11HYSr2KgbGSoQEIXheOjdK1tp
 0QApSWaueAdGSS5PySiGLTc6dCsam6GeKT9J3jJh9WPH9XgspbnmBE42igYyhLrF4sP+tHKH
 PQ3LsLm9LmEk5nGviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Svl
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DPeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6Np+TgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeTf003MwmM29yUkqp+1WGmLeXLzAO91a9MwY/U/WuontrdCsT9Tpe+CQd9k1wva7VBaM0od
 gsCZ4Y5o2mePVmG56VNN1xMvdfNVa9NC4kSFjiWWgPNJt3cE4l+KSHqonc2omRCes1Jd0J6c
 38bG8=
X-IronPort-AV: E=Sophos;i="5.87,241,1631592000"; 
   d="scan'208";a="58038805"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZnVWSLcHb6KKihH+zac6zIPXBboLpWwuT2xal61+G+DGZOQLl4xDGIP5YZhnv2tjuWy422tzz8ILuXyhvX5QTqWxdd1jGOnOe9tf6GNyLGnYefQsY4YwRzuydXpBXk3nsYlOg1fIam2sDq6+T+uUBtSVmhVMiNik+lIabTDHv0uVbI8mSbAKiQcUPvqHDrqcx/Jwq5mLUqRlFIclzMhcIoK4NKW7g0tAiBHl7Uma7pcvCdT7+vBWb+9rVNGUYWqt8c50OecPnwpH7bGMEVkjqCZs0UBbi0WEamoNVZolYpNAfQnoD37FcaR7re+Zr/s92BrkXjQ6PwaEtfsgcsCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y06GO6sYHtogNBy+7y427BbKjOFuMhPCPbyl0XdHqNY=;
 b=PAZhHuX46XaUPjthir4T5yRyAYNs0mTtUOu032Pf9KF2nDC9Nof47PUfuN7lf2TRZLNlYeaf6FQujPUI4BfbBJeUee/Li7w+la8SxbmG+WtQQJ0n+gdtRYwBpkiLShFMX2S8HFxISbVCk223p9WpAAtzUr5tCKFpawgMPLngm7KasmZioTkOYoZQomRCNhU8wj7SkM/GIAxzxA2aXcJ5+l7T856QD9sOASR9TWk2g36SbXikeVj7Eln4s+hE2qY9btKt3qp1lBVQ5COSDzOTksB+3y8PqpoGcN9albVZnfAWyv8bBCLptkOOqDTaq8Fud6+ZCHBbQN4h6TdVe9UeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y06GO6sYHtogNBy+7y427BbKjOFuMhPCPbyl0XdHqNY=;
 b=I9ASMcJuZdHL7wrpDT1o3di7MA3qGmaiyfq/A/vTSNAtAkwoWgOEjbX7i4H6MMoymC6Eq+GB49UvsrcMLT4ECpZUqumbM2UD3UFvWEZw8Fn8Pi7bc1nbIitbB5GAVG4ZGTap2VuD965Qlb1dULRE/OyScvFdy+yqnI7Dq0ElwBI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Alistair Francis
	<alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Christian
 Lindig <christian.lindig@citrix.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Dario Faggioli <dfaggioli@suse.com>, David Scott <dave@recoil.org>, Doug
 Goldstein <cardoe@cardoe.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Josh Whitehead
	<josh.whitehead@dornerworks.com>, Juergen Gross <jgross@suse.com>, Julien
 Grall <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Meng Xu <mengxu@cis.upenn.edu>, Nick
 Rosbrook <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>, Quan Xu
	<quan.xu0@gmail.com>, Rahul Singh <rahul.singh@arm.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Shriram Rajagopalan <rshriram@cs.ubc.ca>, Stefano Stabellini
	<sstabellini@kernel.org>, Stewart Hildebrand
	<stewart.hildebrand@dornerworks.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	Tim Deegan <tim@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei
 Liu <wl@xen.org>, Community Manager <community.manager@xenproject.org>
Subject: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work during the 4.16 release cycle
Date: Wed, 17 Nov 2021 10:53:38 +0100
Message-ID: <20211117095338.14947-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117095338.14947-1-roger.pau@citrix.com>
References: <20211117095338.14947-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0169.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:236::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6abea90-d099-4c1b-7bd4-08d9a9b03355
X-MS-TrafficTypeDiagnostic: DM6PR03MB3577:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB35772DB7E7472E49018C5B208F9A9@DM6PR03MB3577.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: woM1/pSHnGTfn6qV6a3ABKYB8IO5/kO0bblHXhmxfJtjwbA/emy9/rCtWPYw2D0Qz0WyaIob2XX/f2QlNhaF4tLITXuw/c43GfjLJOK00GR29BG9Q2luY8XHIf6x3i3/FQQS4bt9ko4rizMxFl4e8QKlrTzqpVUQuPVZo9ZP65zcyZ7jGob4mCMKToUy8RIFHuIWgrVFwcBE1lWwtc8Xd+5EK83GTg2e1NY9ijhYj083l1jjdmzIrPMXxgBun3SFkQ769209XekcmA9aenmsCHMN9giJEWwrsnpie6fjO0vaeMxgdmz+cwVDkn2RxTZSCUkhF6HdButO/koxhCdWP3vn0sjI75VvK2GFg2C7uroFYK+AU6vZIpn0vFq3dRX4ro4EXeU2o7PuRV5wGeL/1oXPCkvp4mMwfd2mnbSfpDmMH9w5T+TMrYAluZORKWxRFXGvnuTTjG3H/vAsfbAyAJQA4UbH6fRp/kJR4EzjAeJs9NwrS4LR/Efs86HP5okST4EXezz+TkNTY/kdUL2XK4AvT+Ecjw/xDEZjexpgMmCiHmgTuZSvufPWdmt2Y5GjI2bk62PkWk6vMduk7agDsZmA2dL0qBr1cr/sIKbghvdqMzzae59nBzFgLCFtvZ+ObzwgW+FeKYXYtdDRbe/1tDompZk32qLyJSSH8Flt7+yVK3WqsvJo/Idp5ESBRrfodyRcBkMf+3NxCOfbRjdoOMnfNdpjqgSk7CbsIgbyXXenKn6uFzGthzLG/L/txiMZuveRdehOV6b6+mPD+P0Y5/W3/YBWr8sczpalEaMVxJOuxeN8VDShAGon7Qf1E9M5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(66556008)(38100700002)(316002)(6916009)(186003)(86362001)(82960400001)(8676002)(4326008)(5660300002)(54906003)(2906002)(26005)(6666004)(7406005)(83380400001)(7416002)(2616005)(508600001)(6486002)(36756003)(66946007)(6496006)(956004)(66476007)(8936002)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFFSTGRPdmhDWG1QMExrc2ZrR3FOaVdIdHdsMDQrQ2p2QmVwWjE1SDJZOFdM?=
 =?utf-8?B?TUVaazJNVnhCMDNpVEE5OFZRUGdDTG10SDk4OG5McnozeGJsNEhiVDYrTC9T?=
 =?utf-8?B?QUlCS3VLZjJKeEwvb3F0NUZsR3M4OGNSWk4wWTRaajF1Z0k2MGNxT0N2TTZ0?=
 =?utf-8?B?QUFnL0V4Y2xDZTU3TFNjc0tYZkFrMmFvdVNiYjBGaGtyMlRtNHIyY1pmY0c1?=
 =?utf-8?B?ZDdjS0hFMEtDT2lIb29IODhVWGpma2s2UDZFb1RTb21YWmQ1Z2VpVFcxdm1D?=
 =?utf-8?B?cWxBQnBZVFNYOE9uWDJVdDhneENVVmZDdktjNEt6amM2d2V1WDFDQ1k1V0pY?=
 =?utf-8?B?WXZFTWtYNG1sTFdJNVc0R1NRTElCNWtQQ0FjLzRYRG9HSmtOckZjbU5RdG9U?=
 =?utf-8?B?WmVYTE0wN2RQSUtCbERBeWlqdzNpczFqV3dxVkgreFgrNyt0aGhQODhQUUNZ?=
 =?utf-8?B?Z01UamVuVzYrZWFSbWpNR09Udm94SnNPd00rYmczdUlXQzhBSGgyNmJnb1JV?=
 =?utf-8?B?MlE4U3loamRwL0VBOE1WNFdQYWxQRWk0MVlYVm52OWozSHdldzRaaUhsSVFE?=
 =?utf-8?B?MjlWS1VsL1VjTldxdmpnZzhuNXVzNGxRTVJRRU94MFRMTUo4cUsvQmdVK3I1?=
 =?utf-8?B?YWs2MVRuVm1Vd000RGtZVEJJTEkyaE1uNlJYakpQYUVxRThRenRoejdtMVNl?=
 =?utf-8?B?SU5EU3BrV20xWFVmVVExaDJnejFueThESXFvMmNTekJYZ2xXbFpQa21Yb25J?=
 =?utf-8?B?Y1pDemt3UElNWHpQK0VKQ3U4RzdhTURJZDVNemFYazlkd2s1aHoxRWRuNGpO?=
 =?utf-8?B?QUZSRmlNODFQRzFGMk15Z21kcERoRGprK3gyNDRaZFFuUk9TSmRTMFRVUm1r?=
 =?utf-8?B?bjV6RFZPWDhoYmx0UEJJTS9LeWoydWxFemgrQWdyYkZVVWVhN2hFVXl0dHFh?=
 =?utf-8?B?TW9kcndOTm1lSjQyT1E2R1RzUythMllROStKM2JCUzRCTksvdWx0cEx0Rjlh?=
 =?utf-8?B?Nzk3MXc5T2ZqaERVVmkvb3JQazFhOHFuRUd3NDhrK21OUHh1RmRSaU5YNjBV?=
 =?utf-8?B?S2c1TW1ya3VVaTkyZ05qeS9VbWJNUEhEMldaQ2o3VXdqdUR2QlRBdXYvK3dz?=
 =?utf-8?B?cW5BVnpMSUVkWURod25lMlkxMXR3Y2xHL1VxSDdTZzNpOEcrWkw5bTh1cTQ2?=
 =?utf-8?B?NVg2TTNyZ2h2RGdyMkZEdGxQMXhOZGxpcWNQVmFmMm5mTGxFL2FDN2ZoWEcx?=
 =?utf-8?B?MjkyOEhVdFNoTU1QRGI1TVZzSDI1a09yaHdkMXV1OTU4elpNRGJCcnVLYzBN?=
 =?utf-8?B?MmdVTDNZbWdoVFBHQWJJNlNCMVFvV2tRUGNGUDdrTU1qVmNhQ21nT3c4S0wy?=
 =?utf-8?B?YVVQL2NWWWl1RXdJWEZ4KzFwQmgyR251RGh4S3AwSi90VWpHRW0ybkFLaWRU?=
 =?utf-8?B?SlVWQUJsVEIwczNBQjRtNnVDd0pNL1RWelVFQ0hkZ1ZSSzVaRG53MWhob3o3?=
 =?utf-8?B?MXZsdFhRZTVxd3BETTRQUUlYbDNqYXdwOW5YV28wQU5OalIweERXTlZ3T2lM?=
 =?utf-8?B?bXV0aXFlbnh5Qm9PSStkMFplaTl5UXRTYlJKZ0E4bmN2MzFkVkt1QVptYW1L?=
 =?utf-8?B?VWZScW03VW9LTnlza3I2OGJPdFNrN2FrMFcweGhXdWNqWXc1RkloNmJOMmJK?=
 =?utf-8?B?blNBZEVqc3BuS3pLbHBsSjVndkk3aGtOUUV6cFBMQ1NTaGlWaG95bENiTDF4?=
 =?utf-8?B?cXMwWGtDQkRCT3VncmZlbk1kR3R0bWxZRUhlcHZqckwvVU5BTUI0cWFFWXl6?=
 =?utf-8?B?VkZXZlZRQ1lDcmNxclFEQVR5b0hiQzhLT2ZmdTBmWi9qV1lyaUpqaUk5MTJP?=
 =?utf-8?B?TUFpY20xaEo1QUxmRkJBVml1U1R2UDl6cnJOK2xuLy92ZlFRZlkwMFEyWnE0?=
 =?utf-8?B?MUFvbWRCSUZ5cXZGTHozNWFJaXEyNmZyVG9TWjNqRWdpQ0NybnVkcFd0SE04?=
 =?utf-8?B?dkgwc1o5SjFIM1FqODNEbVhHeDFyMVdsYUFkanloc2RxV3Z6ZUJ6akhrM3VD?=
 =?utf-8?B?NEE0bmFaRVR3K2xIT0Nycm12dXZneTlTK3hBUmdmaTNUYzI3NjErbXdCdEd4?=
 =?utf-8?B?SGt6R09jaGZaWnVKY00xd3U3blBwV2JIUUpoVHFpV2ZRK0M4LzgrMml2MkJx?=
 =?utf-8?Q?ptLJkQRXMaCm7472cdCPlg0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6abea90-d099-4c1b-7bd4-08d9a9b03355
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:54:09.1697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neOzJjRmPS5JzWEOli2t+vgUOAF6CdFh1v4ZLd+yANSqlL0cLcO5hNqA4trGtxnTVUGryCg9Dg93z4+S9ERbRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3577
X-OriginatorOrg: citrix.com

Document some of the relevant changes during the 4.16 release cycle,
likely more entries are missing.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 CHANGELOG.md | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ad1a8c2bc2..8b0bdd9cf0 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
    no longer be built per default. In order to be able to use those, configure needs to
    be called with "--enable-qemu-traditional" as parameter.
+ - Fixes for credit2 scheduler stability in corner case conditions.
+ - Ongoing improvements in the hypervisor build system.
+ - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
+ - 32bit PV guests only supported in shim mode.
+ - Improved PVH dom0 debug key handling.
+ - Fix booting on some Intel systems without a PIT (i8254).
+
+### Added
+ - 32bit Arm builds to the automated tests.
+ - New x86 pagetable APIs.
+ - Arm vPMU support.
 
 ## [4.15.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - 2021-04-08
 
-- 
2.33.0


