Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBD334786E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 13:25:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100967.192734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP2ZP-0006En-KZ; Wed, 24 Mar 2021 12:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100967.192734; Wed, 24 Mar 2021 12:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP2ZP-0006EK-FT; Wed, 24 Mar 2021 12:25:07 +0000
Received: by outflank-mailman (input) for mailman id 100967;
 Wed, 24 Mar 2021 12:25:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u5GA=IW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lP2ZN-0006Dk-Rb
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 12:25:05 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 803603d3-e5c7-45cd-9953-f8da25e04c05;
 Wed, 24 Mar 2021 12:25:04 +0000 (UTC)
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
X-Inumbo-ID: 803603d3-e5c7-45cd-9953-f8da25e04c05
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616588704;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=wp0RccVI1tCqlieLeZR40m+vQPb4oS3BJx8bkuHZwN0=;
  b=OPMde0qDQ22eE51UOJMqKXSPtmQfGPaAsr8J5yMZ/X4iUcTLYj8cRyWA
   7ZmEq2/1fY6MWul/5/guwm6OZBKK9VF7cocvlePsLLM0lBKm5HUsFi0mv
   a8Mntq/1hdcLZfzutjgQxHW86TZ78hX2H2tLwB0Vt4q8v05qKMwimhgBG
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sqVs07E0EEn59lR4dpgFyDvoW/AI21j1nNGlncoInsF8Vmnm4xrVcZ8fOcDivPXqUOxwbo5MZJ
 D0QQ/ss+k5hmK5x4u5m7hMVydbbdJwE4oeWwKOW8bcm0HH/fXUul2wA3ZDquClgqkS/cSixGIo
 qSDunZ64lDANUU9zT45I0wvLWDst78ZLKLEeFobnD7yO3amGUb4lfiVxqAB9ZrN9Ml59VKPat/
 xCgkfPGd7rNl22fZiJcIbt2wJQE5vkEuJOGcOFtLLyaB9TPDl1TEh0FqYpq8749JwOyqSvI/QP
 Ioo=
X-SBRS: 5.2
X-MesageID: 40013687
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0dEhXq/kXkf2ZH0sauBuk+FdcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsKV4hLxW5Ce2KmO2dxQxRLAod8KY
 GV4dBJqyHlVXMcaMm6AXdtZZm+m/TgkpX6bRkaQyM28QXmt0LU1JfWMTi9mi0fXTRG3Ks4/Q
 H+/TDRy62/v5iAu3nh/kDJ6ZA+oqqC9vJiA4i2htEROnHQjG+TFf9ccpmjmBxwn+218lYtl7
 D30mcdFuB+8WnYcG3wgTaF4XiY7B8U53XvyUCVjBLYyKSTLlJKaLsyuatjfhTU8EYmtt1nuZ
 g7pV6xjJZLEQjG2B30+tmgbWAaqmOPvXEgneQP5kYvNrc2Vbk5l/17wGplVL0EHC789bk9Fv
 hvAMz29J9tAC2nRkGckW91zNO2WHMvWj+AX0gZo8SQlwNbhXZj0iIjtYAit0ZF0Kh4Z4hP5u
 zCPKgtvLZSTvUOZaY4IOsaW8O4BkHEXBqkChPcHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8bYSvVeI2z9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykvGnv+4UDqTgKr
 eOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+dEmJpu7NN432ps3WePveP9PWYHQZc1K6Jk
 FGcCn4Jc1G4EzucGT/mgLtV3TkfVG63Z8YKtmew8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZJfukqaxo3iK7X/Fhl8ZfiZ1PwJw2vHNQnlKrQgFPwffarAYoeiSfmhUwT+hKgJgSdjVVC
 pSvU5+967yD5H4/1FtN/uXdkahy1cDrnODSJkR3oeZ493+R58+BpE6HIprFQvKEBRxsR1wqH
 hKbTIFQkO3LEKstYyVyLgvQM3Pfdh1hwmmZeROr2jEiEmarcYzAkcAUyWWSs6RiwY2Tz9yjl
 l8mpVvx4aoqHKKEy8Ske44OFpDZCCyDKhdBAqIXolSh4vmYRp9V2uMmDychSwiY2aCzTRguk
 XRaQmvPd3bCFtUvX5Vlpzn9155bU2xVUN9YHISi/w3KU32/lJIlcObbKu61GWcLmYYyuYGKT
 fffH85OQV13e260xaThRePHXgr3Y8VI+TYFbgvGoujnE+FGcmtr+UrDvVU9JFqOJTSqecNS/
 uYYBLQAzXiCe8lsjbl0EoNCW1Rkj0Dnvzp0hG+szT98347HPbIIFNpA5scOMqR6mD4R/COlL
 V15OhFydeYAyHUUJqhz6qSUhtobjX0ikSyR/szqZ9Vsbkp3YEDV6XzYH/t7jV/wB46LM3Ij0
 sQT6Rw3aDZNuZUDrkvUhMc2mBsqc+GI0QquDHnG+MSfVkiiHnAItOCioC43oYHMwmkrAv0NU
 L3yVwkw971Gw+C36UdEaQ+PCB/b1U98m1r+Iq5BsftITTvU+FI51yhNHChNJdbVaieAL0V6j
 J3+cuBkePSVy323mnrzHZGC5ML12asWsWpBg2QXcZO7tyhIFyJxpKQ3/Tbtka/dRKLL2IChY
 NEckQMbsNMzhka5bdHrRSae+jQuUIqk1xX/Dd9sEXis7LWuVvmIQ==
X-IronPort-AV: E=Sophos;i="5.81,274,1610427600"; 
   d="scan'208";a="40013687"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdIfxwYL/lKgra8DNRwBZyo6OQ1yO0rASDgObqnqMDBlLAw0sjCG1n7PRzCvsvSKhPnTW1LbgJSz/CDo9jsrTXUruyhrUQcRJa7gP4DFgrR2g4Fu/DOSNrEJ288Q12SVaA7/z/2Pdx6yh7dk46s7fPqQYGXpfge7xkSU1SoD2Mb2PziYyEE2TRPC5To2aKs4E8GVCdSfOn/xsrbZabNQhbMqUpFvc6ud4j9PqE5gFCAPLjeCJx9Vfb/xAZxNfU9jXRIhrKFHjLIXWy8by6p6YyopillHsBZswIzZcgrYuC2HB8FVZIKJKQlQFRbFDifSffq4vmjrRvyFKULB8enuJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdo8EeuM+xU2F1GMX+fxj8Mg5M4tPEbvnO/5QsPd9n8=;
 b=YFGANHNtSIEyWnTX1nOTT3mgQxuVezSMsoaPLNTZNC2pvwrSMpsJ6rFlkUE1ty+67WwpEd9a6S9aqWpEmVwSXiRMXfimG5SxmvKtELpTuBZmwdjGHrbTNdjfpzHz08vqBC0VdqLrVV4iZFI817av90ImpQeBZT8DJS0JC22jo2Ll7+b4Q0N26f/RE4OUaLCsCTI0KZs72uqmnrsXtZN30A/pabqyoavFeNT6Hzlx1/97NiejMXPKkcFaN5i52WYrj6OhZB2ez1TFpdVyPrpTFovGs2u2VpN1fxinP3lSfc7LAReHrakXOsrOfb9dqWSHTjrbNlkEk/xzkpXFQXAbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdo8EeuM+xU2F1GMX+fxj8Mg5M4tPEbvnO/5QsPd9n8=;
 b=ZR4Zy2yL8jOfVsterZDX6ZQiBpB/rdBqAGl3Qn3SudMrrQgBU09PEaz64CXpMp7QOn3WtZb3VBBmaDsaHS1mlT+PhCxU+5Mjv2oLGc3fUBkPkgkDEUEkiaV4ZYPd5NNJ+h8WPwIWlmoyPghfx6cNDr/fc3t9juRBOGwwzZcQzyM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v2 1/2] xen/x86: make XEN_BALLOON_MEMORY_HOTPLUG_LIMIT depend on MEMORY_HOTPLUG
Date: Wed, 24 Mar 2021 13:24:23 +0100
Message-ID: <20210324122424.58685-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210324122424.58685-1-roger.pau@citrix.com>
References: <20210324122424.58685-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0134.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40e8dc49-e1dd-4196-1c55-08d8eebfcc38
X-MS-TrafficTypeDiagnostic: DM4PR03MB5965:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5965FF332232503F24E305EA8F639@DM4PR03MB5965.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /zk0RPRwfPmSiYWmJP+BFuw2yj3aI6Kk69sYTjhLmkpTuNKnWXm5R77ww1StA2MvmP+6N0HlS1mECBVFsK3nplJlsur8yVQKK7Cvct5ZYuSzQLeAVW72nTB6tlhTL7gdENa/aoMc5k/++fE+n7YfmThIAiNCflT1AIT1IghH8kEPL1MyEWL90vf/bsu4WCHLcdfEL9yi7pGKGVDulB3NBBJkE2ky9wRMVk4PFa4bD5CaRcfVLZ2GbI4o/6CStk+kcBBiGBphNk3BJexxTBPjcUMBK2oQnQZ6FwvpdF5lW4XVLetkvcJcB+zzjVXjuqpatCwxbMitUTBChtLFIWeJZam72pWuihIl1wQM7nk6k2VUqEEnWjxaZLKapRaGVeTpTgaA7LibV2x1cEzaE0d8oWi1+Bty/yXAjrxa0Bsd10s+ZwdQC/W9xx6KP20zK/vs90gNkNh4aZGra3VFRvfYfqFwLC5YAwjGOtEiBWE11WT3Kg892yrmvS7Ljibiv+PIg/FpF9OCI5/0UMO+BIUkWUopuTbh5a9rnax6F0On4+XKk5j9KR4jxG/oubLLtgRoppVA0I+yzrhYtp+hBHmk1iBdMzUYxjqbPzKXzUuJPwGAdNgGeR3webH5QGfQ+pHCfRLFnjjp1Is+s+hFZ5TAEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(956004)(66946007)(2616005)(83380400001)(16526019)(1076003)(6486002)(8676002)(5660300002)(8936002)(478600001)(6496006)(36756003)(66556008)(2906002)(66476007)(6666004)(86362001)(38100700001)(316002)(54906003)(26005)(6916009)(4326008)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OTFqYnZSd29saHErejd1dGZpVDhVQ2RFS2dRaHNSS2hxV3hYR3h4NjJpcHdT?=
 =?utf-8?B?ak1aWHcrVHBGbkxQR1JpdklQMytrNytqSGEwUXE0TXhLbm9MMnFYWGNUM05Q?=
 =?utf-8?B?cHNOR1ppRkdjQ211UzB0N3ZJdExwT1BnQ0ZldnluKzZvZVZobEltZTl1N0hL?=
 =?utf-8?B?dGlncTAxNHY3aGxZUGRlOHBNQjlhSks3UnY0VGI2OHRObEJSTjFuUmJ5QW02?=
 =?utf-8?B?bFhJMEpDY0RTTmpDWnhxMTZ1NHg5elNNak9zekZROS9SZDkxVTZ6NDM4NGdK?=
 =?utf-8?B?Y055MkNsbElBa2RJZldrbnBNUy9NQzFwQUFKU2tkMEdhZGhwV0E0Yk5tdEdl?=
 =?utf-8?B?WUhFMHpZa3FrWGJmL3ROcTNMMnlQa0tiSHlrMDZHNHcxRHRONTdGUXJyTXR3?=
 =?utf-8?B?TWJDQ3I5emdDMDlIOUtRVTIxMk9zbmFUWldaWFY1ejhlTTNic3lhZXZBdjhq?=
 =?utf-8?B?MmxFb0NpelFpOWRQZGdKeWZ3d0E3M01HT21pcHZXRXBFQTVPY01YVlJjVHFR?=
 =?utf-8?B?Vm1XYTJKUHlYRXdBR0dLQ2VWc2pGUWttRTJJMDE5NTd4UVlObFRIKzd2WU1B?=
 =?utf-8?B?VzVRUStCYUx3VkVPUk1CdTR0UlRwQkV5SGxzOEJzbHRIU25kdlJoLzAyQWRz?=
 =?utf-8?B?UmwybHNKYUpQMnM5Q2lwMjg1WW15NW04UlZrTE9rUXJrVENwUUp5VytUYVhi?=
 =?utf-8?B?aU5DNDA3VGxZY0tiVWJEb0RwV0V1d3NtQjU3b2ZKbzdMZlZRZGl5UDQ4QnY2?=
 =?utf-8?B?eGQ1eThtTUVhdkZlZFJHdUM4eERwdGdFdU5IVWZWOURjaS9kVWhwOFVORDhS?=
 =?utf-8?B?L0Y2eHpxVXh0SUE5Wk5vQTdLYWVuZXpXN3FFMUVQOEw3SmhmRVFDUEpoNlcw?=
 =?utf-8?B?bU5JWTZZekI3Q1BmaEN5OHFld0lOMzFhQjVUUkNydVFwUkx6U2g4TVZET09v?=
 =?utf-8?B?VGRlU0ltU2x4OElFQzY2NWFrdFcyK3VHVDRFWEJ5NXFPWTBhSEhVRjBVck4r?=
 =?utf-8?B?djJxOE9tWmJmR2YwaS9McnVNSVBtdlNuVlE3bXpzd2c5TmxFQmtPTmRuaHZQ?=
 =?utf-8?B?dXd3QTI5enpzZE9BdUdEampua0psRE5SNGpKcnlkZmhlRkZKTjdOZ1BtSmt3?=
 =?utf-8?B?a09raCsvSjJoYWIyU2JtNjZjeTFMY0xOb2JObFFtUEQ0TmhYSXhsK1MzRkhY?=
 =?utf-8?B?WDRLc2ZhTzdsMlZScHBqS28yNHNMQXFrRGtrOE56MDNoc2hjTHRMVDFLazlW?=
 =?utf-8?B?eHRVUFZZMzJMaVhNelc2K20rNGtRSjQ2bzJQL3NkRE1lTWM1WjlNL0VLdnk2?=
 =?utf-8?B?L05Ic05GREtrVXZ6NE5vVTI3UmxxV1UvcUJObVNGc2dhRGhJWExYUFlWVU96?=
 =?utf-8?B?YjQzVEtXS3BVb0RnMmxNejBBVWFnL3lMbExSaWhvVTZjZjJVWVV1SGluNW13?=
 =?utf-8?B?T0c5K29Wa20xZGVNNG16b0h1emdhM1BxOUxjRVpuaWxydTA2SExqZXpucU5h?=
 =?utf-8?B?djJMeDRnTGJ0M3lYMXBnVTFHQTVtOHQza1BvM2R3aFJ1S0Ric2tZSHVQNERs?=
 =?utf-8?B?VmM2NTBINVFnOWdreHBRZDhhakJDY3dQY3A4dytHL0EvcXU0M1dwYTRiMkpa?=
 =?utf-8?B?T0llTC84Y1lmVE9NYkFIOW03WVRmb2JiTk9vWXZ1UUZqRFhRY2M1Tm9jZmJM?=
 =?utf-8?B?OWgzbTBMbFBEV1kwRUttQlJlNFlzZkYwcUY0TVpHd2JvZ3dTbE1KZHVoc3Bq?=
 =?utf-8?Q?ImhBQZcq4+Ld3NYd9vbyjiB5R35b7dStGF+5RHP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e8dc49-e1dd-4196-1c55-08d8eebfcc38
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 12:24:40.7678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhYMFO0dwCD17xrEJ/fktUxRJIohPJCyiKRD8Wsear2FPSIGwYog/+C2ueVDTLgXTLzx2I13HSJsR0yLo4RCAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5965
X-OriginatorOrg: citrix.com

The Xen memory hotplug limit should depend on the memory hotplug
generic option, rather than the Xen balloon configuration. It's
possible to have a kernel with generic memory hotplug enabled, but
without Xen balloon enabled, at which point memory hotplug won't work
correctly due to the size limitation of the p2m.

Rename the option to XEN_MEMORY_HOTPLUG_LIMIT since it's no longer
tied to ballooning.

Fixes: 9e2369c06c8a18 ("xen: add helpers to allocate unpopulated memory")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
---
 arch/x86/xen/p2m.c  | 4 ++--
 drivers/xen/Kconfig | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 17d80f751fcb..a33902d05e45 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -98,8 +98,8 @@ EXPORT_SYMBOL_GPL(xen_p2m_size);
 unsigned long xen_max_p2m_pfn __read_mostly;
 EXPORT_SYMBOL_GPL(xen_max_p2m_pfn);
 
-#ifdef CONFIG_XEN_BALLOON_MEMORY_HOTPLUG_LIMIT
-#define P2M_LIMIT CONFIG_XEN_BALLOON_MEMORY_HOTPLUG_LIMIT
+#ifdef CONFIG_XEN_MEMORY_HOTPLUG_LIMIT
+#define P2M_LIMIT CONFIG_XEN_MEMORY_HOTPLUG_LIMIT
 #else
 #define P2M_LIMIT 0
 #endif
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 41645fe6ad48..ea0efd290c37 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -50,11 +50,11 @@ config XEN_BALLOON_MEMORY_HOTPLUG
 
 	  SUBSYSTEM=="memory", ACTION=="add", RUN+="/bin/sh -c '[ -f /sys$devpath/state ] && echo online > /sys$devpath/state'"
 
-config XEN_BALLOON_MEMORY_HOTPLUG_LIMIT
+config XEN_MEMORY_HOTPLUG_LIMIT
 	int "Hotplugged memory limit (in GiB) for a PV guest"
 	default 512
 	depends on XEN_HAVE_PVMMU
-	depends on XEN_BALLOON_MEMORY_HOTPLUG
+	depends on MEMORY_HOTPLUG
 	help
 	  Maxmium amount of memory (in GiB) that a PV guest can be
 	  expanded to when using memory hotplug.
-- 
2.30.1


