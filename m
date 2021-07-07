Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD70C3BE371
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 09:16:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151975.280812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m11mh-0007aA-FY; Wed, 07 Jul 2021 07:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151975.280812; Wed, 07 Jul 2021 07:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m11mh-0007XI-C1; Wed, 07 Jul 2021 07:15:51 +0000
Received: by outflank-mailman (input) for mailman id 151975;
 Wed, 07 Jul 2021 07:15:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2f+4=L7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1m11mf-0007XC-7p
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 07:15:49 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26dd39c6-def3-11eb-84dc-12813bfff9fa;
 Wed, 07 Jul 2021 07:15:48 +0000 (UTC)
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
X-Inumbo-ID: 26dd39c6-def3-11eb-84dc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625642148;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Hn/VTdoW8FjMLt1k0X+caeWzYZXTiG2WgypLgMAK72w=;
  b=EBEI+d2FOqEfhiyUrYMeZgzMGr0e4Ca4WfNA5BELG1qe1awVkDrS1mFG
   wce/o4bNCl1awS/sWavETTl0tcV0UZn7h8K6CjKze4kzzqCtksK7C1EOZ
   z+oVE4YHcUhSbcDl8lAHxgvr9if1MNIIpxtg8H8V620y9LpFkRx/DM/xJ
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cvPudFtrfMEzYPEQToFdFSIQVoZMB0n4yyvarWtLGSmnL/N2c367yhiMJIfGHeAJYa36GXClYG
 CT7SfgbvFloKFXWsbKjK08T46fIsrGwJWQ1GyybKeP40ssRTS9/2iNgp3eiYte7zYoaUfI85ds
 /WkT6ikjKraHluUuwRmilZavIe1nZmypyZK4dDoQXI2UPzfWGtHWy/pEz87hgDvJSDylGcdk9d
 KF603FhY/arr4tsJTTUHbyjWpdu4WpJ2mk0dAlfeFvF9Kvda2t3U+Z9Q0ytr/SEokrZlb5uPnj
 gIA=
X-SBRS: 5.1
X-MesageID: 47701601
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3rPjPqN+3FA2T8BcTvajsMiBIKoaSvp037BN7SxMoH1uHfBw8v
 rEoB1173HJYVoqOU3I++rwXZVoMEm9yXcd2+B4V9qftW/dyQiVxa5ZnO3fKlbbaknDH4BmpM
 VdWpk7JNrsDUVryebWiTPIa+rIGeP3iZxBD43lvhBQcT0=
X-IronPort-AV: E=Sophos;i="5.83,331,1616472000"; 
   d="scan'208";a="47701601"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brFRIP6Mshp81an9xbdl90u/u5gWDJLvQUFJ88F0UNZMvGtXqsKOsdtBZcmJeBIkLbzYWDNcpyA9mxt95oIyGIGnoypkCgEpOoybkDpk+jb6wgSYXSbR5T7ElDVueNJn3Tlq170NTY9Vh1wjNm6pxhAAmKcZoo1qNYGFvmJ5QmKd6Gp2rIY9THhnoNWwDmFmsEEutBJlVPlyaLEPxoyx9IPkQqXliCrhr8Xwlsg0WDdVEdTXDd3R5M9VWex5ao4DdrgcwLvkq6byghBY5/hcJvzUUW704ir8+HXW7QWl6S07GnZyaCxkFd/IjuCB59+gx+qGOjRBqHi7J7yxdyH3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cs8ymGBrF7j+G3jCG9nSDz3vu1J1AeR1C6gb1yeBOWs=;
 b=hS0Zfklq47yNX4uWsgsDUAhUXdYZXk/n2/kO1fiHTh5jXOvfyqNGS/OiAjWFWdNP3lkTYWWUL/G1TlPmG5CHpVbkoW1gUN4yQISkpKKhmFJPwl9zsURfd2Aha+0MAObXkhuWw1Wux20LO2wjrZ31zW4StnUXASNJKL7XTziRWvVR/CKAm7RK7+ERj2OjzTMDrEyxLy9FZkSPzOnmkZ4QzpHp7NkaApLGudj6Zq9x0dc1ff7cUVOjwF5ifo5FmClfSlSnOWf2k6HYCyindihbJR/mEWxc39lN+Q1jmpp8H5O1s3SI3Svl2fFd0anubPqQZRnnhJS37Pd4qPm0jckBBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cs8ymGBrF7j+G3jCG9nSDz3vu1J1AeR1C6gb1yeBOWs=;
 b=J156MwWRqZdUUTT2abG/VzPOzlZRWqtPd2YBu5e9iF9Zd41b66/uwzLv/dwrBoxyw8h7lLRVV6cFrswN/bInH2KydQIh7pMYtkBiKRPVUa+M4aB31MKkl+5YsnDuLVi+uDmOo4WW6T33T57bUB/+chY/BYR3G3SXhhAGIy1iGug=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Ting-Wei Lan
	<lantw44@gmail.com>
Subject: [PATCH] tools/go: honor append build flags
Date: Wed,  7 Jul 2021 09:15:31 +0200
Message-ID: <20210707071531.69001-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0051.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41868968-1388-455e-7486-08d94117097b
X-MS-TrafficTypeDiagnostic: DM6PR03MB3577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB35779AACA564EF621A5C48728F1A9@DM6PR03MB3577.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fxs7ggKq+1kOLeWkAH+5X56VahEC3RW1Z/mJnFOkb5xIARIJ0kQ6yl9TsuVXp5/6tYBhCDFWcFPpaDySFZ6YjirQoMn+4T0a9f/cTJ+eytqnEqh8iVjO43JUhjhODNkv+CeuV7WZE1QI4i6CfZC/rB00/x0Z5u9gJ/y9tujAw8kLozGYvApLCFZ9snxYKAHam/qoad4LdkLGxuPbJ5ovg3N3btvjBdQzIFfmX9zeOKORZaLFv9l3mr/1HtMwU0Pt7JqwTnMjTsJLGhaGdqnuILIjo9L2jHfb25ZrER8g0rqQ/0T/jCE/MvFOLQ8Wopw6pKEhiXDznxSmxNLEpv7ZRGvB8Kxm+/PkqAGn9cFVf0mBbFdmhCQyCu1mwBHGfMy8/mx9yH1mxFQIXYIsCIEbanXIxZKg78AmIhManbsGXZL8DtZfYt2MiCAWLB2IfSRlCaWD4puVP6Q9rHszBf1UliI8H2Ll/fOrXtYLiVCE99uCaK0SupT45bPViI3Qry31b1X3NFEFg98Ii2etbF4fwjqTFEhK5tu/euxOpub8JXD5nSCivrwqF9wRC3WpazA9fMmb3ljHuHU0sZSOdkjuehQe85spr2ynOGRxsASo7hqd30Rhd5fvDjsey5ea2zNcn5OZJTJye/t6USf5RVXauA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(26005)(186003)(66476007)(2906002)(478600001)(36756003)(8936002)(6486002)(38100700002)(6916009)(6666004)(86362001)(8676002)(54906003)(956004)(316002)(1076003)(2616005)(5660300002)(4326008)(83380400001)(66556008)(66946007)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnNxNnJlNVZpTHFpSHlPK1ZyVnYwMWU4Y2dnYW5LZG1MNzMzOHZZbzRoRVJy?=
 =?utf-8?B?dC9VVFo2TkJuaFNDUnkzUlNXVW5lUGRjMENnWWJ4WWsyMzJaMkluSENyeGM1?=
 =?utf-8?B?SjZRanJNZWZjK0RoYytic3JnTVdITE5kMGhOTFZHVUV0ejcwRk8rK2M1QnhV?=
 =?utf-8?B?L2xNSWt4cUJUbTEvZEFoTFp4bkVGdEM3dnZiMTZwY1ErTCtEUS8vK2xIS1Rl?=
 =?utf-8?B?UWtveEx6WHBveEthTjR3cTBwTlBHODBVZ0NSNGJzZk85Wk45MkVVQUJPM3Y5?=
 =?utf-8?B?Z0h1a0ovelgvWTVQVlhQZXY2bTIraDJNaTFzT0crbm9DbzZWTTZKN1ZsNkxN?=
 =?utf-8?B?RC9uQU1nd2xMZWg2NFRJMGRDWkRKc3RnN1haNEIwU3pLc0Y3WW9idmloY0JR?=
 =?utf-8?B?TkZBbWhoZnp1bWVKQWZpK3BMTWZVOVZuaVhhY3dQSlErUjlZOFZubk9MV2VG?=
 =?utf-8?B?d1FuME9QVURRUEZjVlVJT3dmVmg1YWpHV3BEbFJZM3hxeithTWdHbWtacHJx?=
 =?utf-8?B?K2xFckduV0RheFlxWlY0MTB1YlMvdWtSdGovMy9tUXBLWU1kVHUvRVBLNXp5?=
 =?utf-8?B?NjVNbENBb3R4SmpEcTlINzF3UGp3TEkxVmx3M2VZMkE3bVhzL1JHRUxXQVZC?=
 =?utf-8?B?RVJSS05ROVRFVm11YVZrWUtNZXUyOGhkNTZMMjhDb2RPL0IwdC9PbnkvWW82?=
 =?utf-8?B?L1hLcjUxNGNpZzlTa1FjSDlLeGRvWnBXd21uYzNlY2c2SUFxVm5IWVpYampu?=
 =?utf-8?B?d09RRUNpaXZ6QkdzbDN5K0tJckU4WkRRVUJxelpseXUrWll5b25XdnVqVFky?=
 =?utf-8?B?VGozK2piUlUrb1l2TkNtbmpaNGJkMG5XbTcrSmFXeWpXZFQyZzJQbEErM0JY?=
 =?utf-8?B?NWVkMTR1SCtkWGdLeEw1dWZseEpxMXJXYnREd0lHc0xuaTdJRzFWRmRBL0Jp?=
 =?utf-8?B?dXMwczJ3c2wrY0xzYlM0QTk0YVhnc2R1Sk9WK1lxSXo2c2Q1TDdtWVFucE1V?=
 =?utf-8?B?eGY2WmNHeDJHWDZuaEdMWEUwNSs1TU9oNkpEL3c5ZkdVdXZPUk8xMUh5MjhH?=
 =?utf-8?B?dlRaTGxJY1JjMkc2WktiQ1dKNDdMWjhlRkwxZkwwM3NqbzNXQjduT0N3Rklq?=
 =?utf-8?B?OWkrSHpuaUZkUEVMVjJJeW5LOGo2UFlFSHF4czRtck1vb0xoYjRaUnlKNkUz?=
 =?utf-8?B?MitWM00xeGF3UzA1WkxDWk5HbXh4YVBRdnhzU2d2Z0FGek1Cekt1QlNqM2xX?=
 =?utf-8?B?SGQ1NG5XQjN0QzM4NVkzdzBaSGFQOEZWb3lNWHdFNldtc25IeEJDZUNXV0l3?=
 =?utf-8?B?UDNVV2hMQ1Vxb2R5dVRsQThBV2lMSXFwaEViZHBZWm5VekFIRk9FTkRHNzZx?=
 =?utf-8?B?aUJuUkY4bGxYaHhac1E4Mk5RM2d4R3MvQ1VpQXgxYlI2V3p4NUc5bE45OTBJ?=
 =?utf-8?B?cE9xTDF5SVpnWitmTWJ2SFNGQUJsMWMweUtGQWt6dUJrWnM3TXhHQXVwMzF4?=
 =?utf-8?B?emxHcXl2UllwYnBXVjJQYlRRNmVhSktRZGRzTU1PRHkrbnlRSUlnZzR0ekkv?=
 =?utf-8?B?TGoweTFIRGRYY0xYYVd1VEcrOHFxaDA4WWJENHN0cjhoZ0xSbVZ3ZldYNkJw?=
 =?utf-8?B?Y2tFaCt0b1BESzU2cm0vNkFWWjgzbXJmY1NMNWRRNUVqSDVadys4d3BYRzRo?=
 =?utf-8?B?TnlLL0tUdytkZStpckZNR2pRVWh4MlM5TDltTnlqUnUrN0Vjb2hWUWFJamNX?=
 =?utf-8?Q?3Y9rMJxvTseRWJ5qheG8R8Kl6cJm/0038KQoLhi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41868968-1388-455e-7486-08d94117097b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 07:15:45.0785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NyFpSn4sDWYTTb98x1XF+bpwWTOEQOyLA1IBZQ5S6wwN1UjsdYHE0kr8h9FuLayc41eQa8yMCnOX0eTlTe45/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3577
X-OriginatorOrg: citrix.com

Make the go build use APPEND_{C/LD}FLAGS when necessary, just like
other parts of the build.

Reported-by: Ting-Wei Lan <lantw44@gmail.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Note sure if it's the best way to add the appended flags, I'm not
familiar with the go build system. In any case this fixes the build
when required libraries (ie: yajl) are not part of the system search
path and instead passed in APPEND_{C/LD}FLAGS.
---
 tools/golang/xenlight/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index e394ef9b2b..64671f246c 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -27,7 +27,7 @@ GOXL_GEN_FILES = types.gen.go helpers.gen.go
 # so that it can find the actual library.
 .PHONY: build
 build: xenlight.go $(GOXL_GEN_FILES)
-	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_libxenlight) -L$(XEN_libxentoollog)" $(GO) build -x
+	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APPEND_CFLAGS)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_libxenlight) -L$(XEN_libxentoollog) $(APPEND_LDFLAGS)" $(GO) build -x
 
 .PHONY: install
 install: build
-- 
2.31.1


