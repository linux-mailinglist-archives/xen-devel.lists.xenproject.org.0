Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97CB394694
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 19:40:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134040.249602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmgSf-0000bU-Td; Fri, 28 May 2021 17:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134040.249602; Fri, 28 May 2021 17:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmgSf-0000Za-Q8; Fri, 28 May 2021 17:39:53 +0000
Received: by outflank-mailman (input) for mailman id 134040;
 Fri, 28 May 2021 17:39:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WKFi=KX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmgSe-0000ZU-5f
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 17:39:52 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id afdb6b55-a002-4e91-a80a-a657e596fcd2;
 Fri, 28 May 2021 17:39:50 +0000 (UTC)
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
X-Inumbo-ID: afdb6b55-a002-4e91-a80a-a657e596fcd2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622223590;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=5BtckwRaIBXJdw/3h71NRjQvhbftsf/iUxEvDmUVBig=;
  b=cfkKFb7VWl1VgJBu0mXkNvOYBiynzuFXp9fEeRYY1NIhCDSKB1k//nEr
   vEvMv54UpfeBjGaFqSs6aoGwce/T55H1+K0QXSWlUzfj6hnuEYP2v40K0
   lVvepnscuYSJOlaxCa7Su8nCyYeFCS2BXH35mxUVYmwQcXyYPU+V5GNY1
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: drCTXFmKwDD3qPKHW77HJ5YBDDWOCXK+qFfQhvsio+QDX5w1LRBR/FuEmKIh6Oa3+ZYRoHrWPv
 Sara1o6jG/SkrMIQ5jqsGELvwK7z3QqqgZlYrnt5Xv7Sqa1CFMMGXfdD+aL9twWLQOIkXcL5+O
 7gPHcRflczF9jcquYIwg75wQTpLEY6pzts9D0811EdbY/qkJotkUna+WqWYrj4Y38dKg2ec2+S
 6squxvXCTP/8Iyoyj+3gSeWvnkVuhHLS+MFhgEyGnVJLKwmLck6boEBA/PG9uUTYd98FTtF4yW
 PcA=
X-SBRS: 5.1
X-MesageID: 46432759
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5wR76av03py60ZZwBHc0K/aR7skCK4Mji2hC6mlwRA09TyXBrb
 HWoB1p726NtN9xYgBUpTnkAsO9qBznhPtICOUqU4tKGTOW3ldAT7sSmbcKoQeQfxEWn9Q1vc
 wMH8dD4Z/LfD9HZK3BgDVQZuxQouVvh5rY5ts2oU0NceggUdAa0+4wMHfgLmRGADBcA5w3DZ
 yd4dcCiQaBVB0sH7KGL0hAZvPEodLTkpLgfFohPD4IrCezrR7A0s+ML/CjtC1uGw+nBY1SuF
 QtvTaJm5lK6ZyAu2PhP0y/1eUopDOgp+EzdfBlxKUuW0XRYrTEXvUeZ5SS+C0wqPuirE0nis
 XIvn4bTrdOwmKUY2W8uxeoxAX6yjYp7BbZuC2lvUc=
X-IronPort-AV: E=Sophos;i="5.83,230,1616472000"; 
   d="scan'208";a="46432759"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cq9n60GHK/TrsJYLnUf21bTbKmbkIezdlsm4rp3aLhIKVF2JKls0xNK4uR5ntfhU49t9P/H6PkGpQUnO0kAicia8STHkTvs3zV4+xeEsgUUiWA/JeNu2DmALNQSq5ammTjW0IerCzr/IVJIUDzuP/EdYDo81mVFpKeErawVZihh9mvfTsy1jlnZpNLNs9N2ZjocJvYTo2VVy/p4tG2hGqJ7gRCm4dlPRPBNWsEtzfguKdJr6jrbVFreDmG/Wwv7n48IHF6OsrUXqGgLQp+5Hg85z0wbjAJdmOzd2Ovze2IG3+bFKAVFB7pWEUSOfzbIqkSQn++IH3sm0gaPTIzw3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFYCEX5tVKfuG4zjygC3ffVJw++0wA2LgWtWO7+wEEM=;
 b=gvDWsVffGYvMYr+OlJJCWveTIeK4skACKWASYO+PMdmI2WKq3pziAlbTc2bWOVhF7Ftb7qRe/qxIC56H3qRJmGza1JH2uMsWDeijATLPSOqZQ4fTyBVhdMLSXuKZhJMV36xUAEGo2oxHtucrSfp4FtP1b9nfO2knVYgfuhcqPkd1QWpgzF7EQXWhx9hlNeTNKTDviZqKoRNM9fU0d3RkrKVsrsDgiRJ/eQSAXVDC4oxY6Yc2LWKNSRegUVTWVW0Hj05ydMUCB4jTmtz8+jXZadSTsHsWnKhfuEYosE+yAYSxTVYoqQAUzxwWLtb82qPEYRP1yWvBbn2JI/DPJkdGjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFYCEX5tVKfuG4zjygC3ffVJw++0wA2LgWtWO7+wEEM=;
 b=MHvBNu27lO/rGML5Jzz17iIDG/UAVz+XcMeVwjnVquyACn+jZT9dfdI5atfD3/4UiyOouc3KNoCBmJ41jAkW0DAVX34wtuFmeuS5JvjQjsYM8/Vn+6bxRzLJ5UEKNkuvyP7rnDa7tHP46QJ9El0CvbMN6uoiMuEjztif2c4wep0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, George Dunlap
	<george.dunlap@citrix.com>
Subject: [PATCH 0/3] x86/ept: force WB to foreign and grant mappings
Date: Fri, 28 May 2021 19:39:32 +0200
Message-ID: <20210528173935.29919-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0137.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0951607f-c908-4e82-53f6-08d921ff9541
X-MS-TrafficTypeDiagnostic: DM6PR03MB3945:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB39451EA9FF93693CB0DAE0848F229@DM6PR03MB3945.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dOHZEQfT3tYnqSYDnOL3komV6I8Uf/b+UdT77NLZ4zdu9BeSkYCETMQi+nHAk4oNPLLCHwseWJq3d5Cc8czqpWNHIyC1Z9oSS6lRduYWjbhstBqfyZ/5/lVIPfHBqARP5kbjKY/mzkvi2qwckXYbtMLiRvdtefaq9DbM3+0HBuwuH1X3Mbwxzp8ZcuEECi7UDEJ4pdzdK7VGgbRne3rUFkYQbNwQnkUy/ErYCKnU3w7erpzpWKribPexAn0lpsNMmTCyq7JEJcifVXq8dQ3bii0dIOCqMLa1mMZU618yHotn4aaKgUXzfGdhA5h24uW4HT1EoXi0EpodUNnG+4oFGHidbNJr7V5k0TTugrOPCqPPjomBeTY+E/8fc4gCGPICMrVJ0MsXh4UmY6pgwGIcWenNZjW9auyFgWUgZDiBZolhqZyB3xmbsQdlgpocbqlArDGVZZjGtxD0/Ls1x08t2qpslmfzaqcHo4SGzvLh962beyad4yh4/MsjhV1rjv5gNdYJ3piHfeHSqq+s9rKZlQRxm1MWyAI6cXxft+d02v9HniXHRwa4cHwd6HP4Uv9YTTOhulrQJAsfl7VJleEeMAAAd3LmqyOE8lUeTFFH3BU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(16526019)(186003)(2906002)(316002)(26005)(66476007)(6496006)(8936002)(66946007)(66556008)(956004)(8676002)(36756003)(6666004)(6486002)(107886003)(83380400001)(38100700002)(1076003)(4326008)(86362001)(478600001)(4744005)(6916009)(54906003)(2616005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NjIrUnRpeTk4U3FiajZkbFFtQmZSaXdSUy9PRlpTSFEyTW5BU2xvbW5RSVBD?=
 =?utf-8?B?dzYySCs1cTVXVnZLTWI2eVZGTmhsT2hLakhVSmRXQzRYUVpXOWhhOFU2dWR3?=
 =?utf-8?B?ODViYThiSktOY3piTmNhRS9kWlRiNkk2M3ZxOWVMYzRoZ3VrUlg4eFMvQXJS?=
 =?utf-8?B?eXpkRFBXZWszK25tOHloRUtURkRyaUJTQ01zT3o1Z0dYcVJ6Rm0wc3dmT2hB?=
 =?utf-8?B?UEdPTW13clU3bFgrWnBVS2JrUGZ6R1oxY1BwOG4yM3JlczJpendDelUwbExh?=
 =?utf-8?B?M2hxSFJJTW9INXVMMmxPRkdLVWUzanBwNVBZZmJ0YmtubFo0QVVsS3N2Ymh5?=
 =?utf-8?B?Nndnc3BGR2FmYnphZGdwRWJsNm9HREsvZzhXVFNnQ0J5bHhXUUU3emNMSGt2?=
 =?utf-8?B?TitLaE9FVW43YW9KMHU5UDB1VCt2Q2QyaWZDcG5LSFVqQzdpQWozZzFaUW5a?=
 =?utf-8?B?ZXV5UGlNUUFzd05UWW9RSVBSa3NZUzVYYXMwVHQ0MGxSTVBUeG1qWWJaZFE2?=
 =?utf-8?B?dzBpbENXR0QzUmovT2ExMG9rbktNT3h1eFJXZ21KRU5IdUo3alBCQmduYUNE?=
 =?utf-8?B?Y2p2b2kzT202bkRzZzQ4OFdqTXA5eWJqWjluYVZjZjVFM0xNdlcwQkRMUVhZ?=
 =?utf-8?B?aTIrV2VaZGpMZVRhWHhzTzd0MHdRbVZGUjVVUCswZzMrNExoem9uYmluTk1w?=
 =?utf-8?B?WUdmQXQwZFg0TkZLeFYrMklxQ2xNZnlOT3NiTkNrYTY4bExYcWxBNzBKelZp?=
 =?utf-8?B?TGZHRXdGeGtONitiUU5LN0hFNmdSb1ZnZ003d0RnQTNQV1cxeWZsakIvYW1N?=
 =?utf-8?B?a1laYTBjL0FtQ0oxRjNCOERkalY0aitwS2Z4K0V3bUNmWmsrbERKTVc0MW9l?=
 =?utf-8?B?OG01aTE3c1AvSFFZSW1FS1FReVhNZ1ZtNlgzdjhXOENEZDBNZVkva05MN2th?=
 =?utf-8?B?cUpnYzJmM0Y4cUxxNmZrTHhnSjI1L21RZVNlRE44QUR6TytaRTM2bDNrYysr?=
 =?utf-8?B?bSt3ZlZjM0JHYVQzUldzZFljMFYxMzZiRDFEa3plSFA0TjJzUTE5V2RBbTR5?=
 =?utf-8?B?amh0akliRTZMci9aa1R0UFE5djEyVVR4N1FFSjVHcGtZeCtnU05kNG9QUUJm?=
 =?utf-8?B?dUk5RUprejByNlVhc3BsbUJsWjlzQkRPaTBVM2VvYkc0SzhjR2kvMFZoa2E3?=
 =?utf-8?B?Y1YrY0REWnJHUXd5bDNwMG15OTM1cFhMOCtFcHQ4bkpEeHNMek1rdy9qQmRI?=
 =?utf-8?B?elJ4WWp4UTh5alFWT2Y0U0pQZlFkd0o3b01ua0lUbDFIdWhFZHJoNkpSeGJ6?=
 =?utf-8?B?NjIrTEhGQXhNd0JERGNqTWQ1VzZyNlo1RTFNVWlOQjVnYjdpSWJ0LzJENEhZ?=
 =?utf-8?B?ZHNCL2RSNkhaY1dNVWFZb3VNekQ3ZFFBVGV0cUptQ09EZTJ0UmJZSHlHUGhW?=
 =?utf-8?B?akluQXh6M3hxbU9kTW9EanhWak1ObzhsTCtqS0huMDlEMGlJbExCRGU0akRT?=
 =?utf-8?B?cmdLc215U0prc1VGMzRlUitnQlpmOURNWDdnUUdTa1M5NlZsUmFXQmVyTUhY?=
 =?utf-8?B?QmNhT3lUOSszRkZpUGJ2SmYyeVU1aE9PQzl4UjJlRkhncUV2Mzd4Qkw2VHUx?=
 =?utf-8?B?Y2Z1ZTk5Z1dIRFczeHZ1OXdxbVI2cVVHcTl3OHhCK21DekFyZlRVeHUyNUJV?=
 =?utf-8?B?RkdOZkZEcU94ZG5oV1RXOGYrMkxGNkdXcW1Ua1dCdEZPN1UyZHdjRWwySDdU?=
 =?utf-8?Q?9+7yDsfX+m4tHuWi4oEANqqpDMzPtbBzsE4DS9U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0951607f-c908-4e82-53f6-08d921ff9541
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:39:45.5144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vOrAMgwUx/k1/lH4Ra9nYzdYBA9dhgg12yOIDRP6hxsPpD86/3dzpcVo+sZFVL4K3b07Dw9R6CFEl8FuX2d+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3945
X-OriginatorOrg: citrix.com


Hello,

The aim of this series is to force the cache attribute of foreign and
grant mappings to WB for HVM/PVH guests. This is required because those
mappings will be likely be using unpopulated memory ranges in the p2m,
and those are usually UC in the MTRR state.

Having the guest set the correct MTRR attributes is also unlikely,
because the number of MTRR ranges is finite.

Roger Pau Monne (3):
  x86/mtrr: remove stale function prototype
  x86/mtrr: move epte_get_entry_emt to p2m-ept.c
  x86/ept: force WB cache attributes for grant and foreign maps

 xen/arch/x86/hvm/mtrr.c           | 107 +---------------------
 xen/arch/x86/hvm/vmx/vmx.c        |   6 +-
 xen/arch/x86/mm/p2m-ept.c         | 145 ++++++++++++++++++++++++++++--
 xen/include/asm-x86/hvm/vmx/vmx.h |   2 +
 xen/include/asm-x86/mtrr.h        |   7 +-
 5 files changed, 147 insertions(+), 120 deletions(-)

-- 
2.31.1


