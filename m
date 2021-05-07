Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E957376440
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 13:06:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123955.233917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyJl-0002ed-EP; Fri, 07 May 2021 11:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123955.233917; Fri, 07 May 2021 11:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyJl-0002bj-Ap; Fri, 07 May 2021 11:06:49 +0000
Received: by outflank-mailman (input) for mailman id 123955;
 Fri, 07 May 2021 11:06:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leyJj-0002bc-Is
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 11:06:47 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d673c10e-7f68-4c9c-b400-171f81e4f3b3;
 Fri, 07 May 2021 11:06:46 +0000 (UTC)
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
X-Inumbo-ID: d673c10e-7f68-4c9c-b400-171f81e4f3b3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620385606;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=SiXL8HCi4a1geG1gxjTk0Watg0nvaMpsbWIYyd93bJQ=;
  b=YAiZN/hLdu4L8eLEwp72+jrRiQXf+Ct0wTlOMiRGEBgI2w+poqq6zg3A
   JZeHyJZwd0Yqyc9Z93kCMsy7L9zaeRe94KHVmrBC7L4WJUEw3UBw5Hloo
   lpGBOlD+cTZj9t16TOvaZ4ZAD8ieSc1qD98UKhsoYtPudLXWl2goDJM5o
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: He2XGgQ32VkzG8+ktl4hcypxa6gJfuAEemOd9WiHVDLCbUi5xYQYu+cF+w6w/W7urlwcZoA3EQ
 FFGLHrumAZRfKHebfzfbPvVjUqo8wXYFHBffiJ391E4KK6nfZN6XVNIziK1VWo/llehloky6ar
 wt8395SUIjrqC4rYKRikWSw09IJkPrDa02QDAAltqtrJqZRjwpezm7EafU2IZ+DgzkAWo1GWom
 JpJLysL7B6rJYtkp4wcDFQo6tVbkLijRbREuSJWU8iUVSme11XsoilPhkKtDqGUhy89t9qFBZL
 ubw=
X-SBRS: 5.1
X-MesageID: 44818672
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:FhyONqEMk1kBWAXwpLqE78eALOsnbusQ8zAX/mt6Q3VuA6ilfq
 GV8MjzsCWetN9/Yh4dcLy7VpVoI0m9yXcF2+gs1N6ZNWGN1VdAR7sSjrcKrQeQfhHWx6pw0r
 phbrg7KPCYNykcsS8i2njbL+od
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="44818672"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l28fDTJbKjJ2KlWpD02o/AJT+ixwbhl0X9ISJ3JA5UOpkCQOCgMPgAWEA46my6X4ih5dFK5ai3t6k/1K+tqBU0BWX4I3mrd7tuqRNNGbL2s2l2MytBUD0c/QWAeisHdBn4PldFdnw2fx6tCk+CDlvGWcy/3+NJ8NbLqlzNRMhVUUcD1CBBZo8JdFIoGjE20Z2cdJKS/pLQJEnZBOcOyIkbM4ARUjh2n65Do15nq4/Xhwkk8XLhHYNij4WfLvECy3ab/5399izj7eC+B8/9VWAaSj2p2Jl6qqtyf88uNRTgLHVCSvKpx4IrafGWxXdrkRHvnTZLAK5gY6Zacz101eDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8S8wkPmqqUfwri4uoZFuU5pUXK3Oogv3mO3oq70NVKg=;
 b=j73s6u9Gkp89XRgTVQCTbjHR5kJnw/HgWsbjCWuTPJs2Yw25MnQaT26Eu5NTGSuqrcSrT+S3OpXHfqo7mzP7ryguQ2PImYTh0+9eduo+82YT68CdywqrEr1YVlc4LEa377adsc8bLAn6qtXtZPJ4qeFJdL9Ww9RAaOeCVhdYbUn6BLKT16JPbyH8bpC+M8BbqSVH5BKSop+cWHml88sU+NwD5PkUpS5b0aqjLEHyLf0b5QcwSTqxArMucaHQxnYfdrz+84jOeSw25jjzNzhPPX22RdkEFsk3HDlIgRSd8xfgAbZvF3ET2TRaQ2fqfVp42XS+rWP3lLOzyk7DOUGFnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8S8wkPmqqUfwri4uoZFuU5pUXK3Oogv3mO3oq70NVKg=;
 b=i69C85iS/1TAGAg3US4Ka3ZL2UhFl+g+fG1NY14F22gIaXJZfPDpNl8rUDvMZ5J6iKlSINEpoKNTEcNpUGeB2HF/ilMtNXTCtFLndcOKi9VCLReXf8OOrUe5qkWWdro0aMQeh7pfH1Hiwf6NCs7sNw6t9KhsnWNiXFBq4D5l4Vg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH v4 00/10] libs/guest: new CPUID/MSR interface
Date: Fri,  7 May 2021 13:04:12 +0200
Message-ID: <20210507110422.24608-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0135.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e991d0b3-80ba-4829-c718-08d91148320d
X-MS-TrafficTypeDiagnostic: DM6PR03MB4683:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB468303F0BBA6A2BC52B7FED18F579@DM6PR03MB4683.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8eH5FwRUvAutucYBae0mmG0JDQVpxicYgPY0O+q9JDS7/DYrLkE29TRrG8VnwkSAYGywTSDmHCh/nZJh6UjMQyxqP+OFWbJNKXnTdlT503dSsGKWfOF0eBwGclSL5yZCgeOeUNUypz7nhwp1/RS6iDU90fNLzXZs7qEjnfdCFl9sOA6FHaUMYglllklJn0e3ubhGNL28CQSdK3E7+FVRdFEJgg3yHO6uwsStWKmftR0QsO1CA4faKGSX1zsX9P7d9s2QnaKW3ualHKvyvJeiyQZzrwvcIqcrRyBIUfVQMrd0MzR7wWKiD8gn8Cbsgd5IfvT11JEspwbbhNfLworWQXfdLk46GWb97jKhxnKUSc43jtlYBY7gt/ZiAHnJaWJqlNATfT90Uz5HJ6QvUiOk2eGrBU9aHAA21Ce1Zl3PS95F6KqWqlGmnZAkwfpDctkLnz1BgTgufzUpivnjahNFqQV5yO64rkgETCNoPITZ38tSVTT2jPFyl2sY7ZM8HmSfOO2arLdh1hTGzfElvD05IgqcVHPx+3r2v5ZHfE6MGW/2HgZMmEzp+cIOkjKD9G3TH03cupHrsjEIzy4ga34u8UnZkRCXALoNUyxmPoia2QA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(8936002)(478600001)(6666004)(956004)(2616005)(2906002)(6496006)(6486002)(26005)(1076003)(8676002)(16526019)(38100700002)(5660300002)(6916009)(316002)(66476007)(66556008)(83380400001)(66946007)(186003)(54906003)(107886003)(4326008)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?czl2S1phS3hqVi8yVFlUMVUwSCtNU2JZRVRJY1RPcmNKMnFRSStzMG5POEIz?=
 =?utf-8?B?VWJpWWxvY3lZUHovZHNaUHpNZ2Y4bjdndzJ4dk1XanZzY3FLUjB6dTkvc0lK?=
 =?utf-8?B?a08xZHNSaGpmNjVSY1BXbjh4K0RGWEFLN1BxU05CenVobFVtSDYvakZ0OVZt?=
 =?utf-8?B?NE1xVy9RaXp3VE0vWW1ZZnlhbHV5MXR4RG92eHErTlNvTDJaY3ArOVZQVlFs?=
 =?utf-8?B?azB3ejdFQ2RFUUc3WlIwZDRCR0NPY0V1STJ0c3VGT29LK0h4SmZuSlR6V0Nm?=
 =?utf-8?B?SE12djltbWFqQWlOdzRjUEhpRnlqRXowSkFhbXEySUlIS0k4dDJRUk0vZ00w?=
 =?utf-8?B?QnJFUkJ6eTF3NUlySStiY0k0NTE0Zmszc2ZkRzIvMVNJdnJqbjRzdkJFa0Zo?=
 =?utf-8?B?NWlIclRtcWpzcUVjWW1nRnJCSW9NY1ErNWNVYlVxQnRMeDVkVThJUTVGNW9s?=
 =?utf-8?B?SmEzYmZUb282WDRNTGFVVlU3Qi83SzdkeVVRSXFUUTgzdDNxWFJPdXpyQnVl?=
 =?utf-8?B?ckJ4azRJcm1VMzdwU1cwaWZaL1JQNVAxN2JIMDA3aEhYU1NqOHpobzBvdm1H?=
 =?utf-8?B?ODJzaVg4UW1RRTVLckttRVVSTnExTW5hMXhQd1VOTExPcmxKM3M0QTBBY1I0?=
 =?utf-8?B?L01RbnZ6TmhtbkJqVFF0b21DWW85S2tESWhDNDdjLzI4Sk42RGxnUVh6L2J4?=
 =?utf-8?B?b2p3QUttRFEvV1lKcnZ1Nll0UnpFVG00ZmUxbFNJVCtRd29iQk8vTmk3eTVG?=
 =?utf-8?B?Y3E4TTFvRWlGN3VSc1RKL0QzVFk1bXJQeVZWdTM0WHdLUVBzeXp6eStSb3Nu?=
 =?utf-8?B?Z29PUU5iUkRZNUhITjFNeGh2QmhFM2lQUk04VU1UR2R2YitoN0Vkcjl6dmI1?=
 =?utf-8?B?bUovM2lGUkNDSkRkNFo0TStIUjBLZm1rTWtzd1FQS3hmT3J4eWF6ZU9OU2Vk?=
 =?utf-8?B?elRIOUdoa3UxaTJtWEhFWXpzTXZKc3ZxRjE2OTNvT0hJbERiNERQdkY2SExR?=
 =?utf-8?B?V1ZQRjdHMWpOMXpNSnJUcCtjZ3Rjek5vTWl0bzdXdHZoVmxkOU5reWx4Q0xa?=
 =?utf-8?B?cFNPOHNkOXNYSGN6SDV5YlZQcFFrYmV0cEhHa2pvd1c2YklkZWc3dkFaMzRt?=
 =?utf-8?B?RUJMZFpZQkpQSC9IOGx3MFZYTjBRZ29rM29YdlJXSWxrQXZNTnIyVFV2STJn?=
 =?utf-8?B?ZGxmZERxZFdPS2hlbEFmUi9nc0Y4UDNNNjRDUVJvYWZTb1dVRFBnR1YwS3A3?=
 =?utf-8?B?QWVzNjF1d1RhR0FMdDYzampsUGpaS0Ftd0wzVkRaV0pvYmxpQTBuVHVpdUdW?=
 =?utf-8?B?YkEyMjh0LytmRXdySk1HdEJ3MmExZW5CRjFKek01VUNVMTQ2aXBMR09rVlpY?=
 =?utf-8?B?QXptcnMxRUhZd0xMZUMvL3VOMHI3MUVMTTE0bU83d3VFR21xMk1ldk1tTjJq?=
 =?utf-8?B?N2UxU3dHajRacmZzdTkrWE13cWtOd2gvV29Tc3VadU04T1RNdlkwaXpZamti?=
 =?utf-8?B?bS9nUjlqdTc3VXl5OFlXSHZZKzFLYnI3ZmdQYUlZTGdXRWpzQ09sZkVRMUVD?=
 =?utf-8?B?OC9EVEFSQ3EwTjRabThYU2ZmVXo0c0xTaXp0MmF2cFloUlZvaERzSXlUbmtX?=
 =?utf-8?B?ZTU2Ly8xSFMxWlFzOURqZXhNT0dHQ1R3V0xyWVh3cmRsOVVQYWthT0hJYllo?=
 =?utf-8?B?Z3N4NjkyL1ZvTjBQL0tMajZDNWhGL0FiMy9OY1pTVUpTK2U3T0toYjZLSzZn?=
 =?utf-8?Q?H//woXw5ftft3IQoATRei2AURc81XytuX5STx5G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e991d0b3-80ba-4829-c718-08d91148320d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 11:06:42.6648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlgumCSUWR5RLaDzvNA48h3qr34Ufz15kidJ3ePpi43p7hHV2DFKunwrDMn+HoCAL8sUmiPtys5nbBuAHGwRqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4683
X-OriginatorOrg: citrix.com

Hello,

The following series introduces a new CPUID/MSR interface for the
xenguest library. Such interface handles both CPUID and MSRs using the
same opaque object, and provides some helpers for the user to peek or
modify such data without exposing the backing type. This is useful for
future development as CPUID and MSRs are closely related, so it makes
handling those much easier if they are inside the same object (ie: a
change to a CPUID bit might expose or hide an MSR).

In this patch series libxl and other in tree users have been switched to
use the new interface, so it shouldn't result in any functional change
from a user point of view.

Note there are still some missing pieces likely. The way to modify CPUID
data is not ideal, as it requires fetching a leaf and modifying it
directly. We might want some kind of interface in order to set specific
CPUID features more easily, but that's to be discussed, and would be
done as a follow up series.

The addition of a helper to generate compatible policies given two
inputs has been removed from this iteration, sine Andrew Cooper has
posted a patch to set the foundation for that, and further work should
be done against that baseline.

Thanks, Roger.

Roger Pau Monne (10):
  libx86: introduce helper to fetch cpuid leaf
  libs/guest: allow fetching a specific CPUID leaf from a cpu policy
  libx86: introduce helper to fetch msr entry
  libs/guest: allow fetching a specific MSR entry from a cpu policy
  libs/guest: make a cpu policy compatible with older Xen versions
  libs/guest: introduce helper set cpu topology in cpu policy
  libs/guest: rework xc_cpuid_xend_policy
  libs/guest: apply a featureset into a cpu policy
  libs/{light,guest}: implement xc_cpuid_apply_policy in libxl
  libs/guest: (re)move xc_cpu_policy_apply_cpuid

 tools/include/libxl.h                    |   6 +-
 tools/include/xenctrl.h                  |  44 --
 tools/include/xenguest.h                 |  18 +
 tools/libs/guest/xg_cpuid_x86.c          | 633 ++++++++---------------
 tools/libs/light/libxl_cpuid.c           | 228 +++++++-
 tools/libs/light/libxl_internal.h        |  26 +
 tools/tests/cpu-policy/test-cpu-policy.c | 123 ++++-
 xen/arch/x86/cpuid.c                     |  55 +-
 xen/include/xen/lib/x86/cpuid.h          |  18 +
 xen/include/xen/lib/x86/msr.h            |  19 +-
 xen/lib/x86/cpuid.c                      |  51 ++
 xen/lib/x86/msr.c                        |  41 +-
 12 files changed, 717 insertions(+), 545 deletions(-)

-- 
2.31.1


