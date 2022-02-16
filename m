Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18FF4B838F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 10:03:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273786.469057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGDg-0005iT-RD; Wed, 16 Feb 2022 09:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273786.469057; Wed, 16 Feb 2022 09:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGDg-0005fy-Mk; Wed, 16 Feb 2022 09:03:28 +0000
Received: by outflank-mailman (input) for mailman id 273786;
 Wed, 16 Feb 2022 09:03:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKGDf-0005Pr-0f
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 09:03:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ba13f4f-8f07-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 10:03:25 +0100 (CET)
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
X-Inumbo-ID: 4ba13f4f-8f07-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645002205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=WENpvfDNE8/oapQGORit/gp77hoSL3t4hzn01DyGrFI=;
  b=Me+z+fJX2y0/uNAHJ4NPdPlRM9cJprZm6/gYxk0MuFpDz5D5B/cJPOuk
   ChsW/bbW3kkEbnZ9J1gon4nIxFUg+OIcnG5YvJ7Elst3E20D5hHyn5JWa
   1h4M6p8bjeeZ6wpO3ITgm/005o7sJpDn/L79BAxAMoWwjYhsAVJkJhSsl
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jIAXe5Vxu4CM9GEz4a5xJuIb5Ahw5XpIqKYwYMiMlF8t3J/8ZqM/z3fZHVfR8VoqISu6HGILdk
 rREPM29RDkG+C1Qu2IY0BU5DkF9q0D8VuHh4yRDDBhXAnth6zIj+i38z6RrkHPBxOWkijwRhEE
 zJUNkAglnSOQbHBQ2ah8zbUyCtBNzrEwdxT10x7ja0qUL7/ZEiLzzvK8uH7iZDsbP4/eiFPjNA
 JEE82ACrIoP6anNNVTdTlukZHougpf+yHbIDr3GpE2Jnq/1iWBl8cfGj4LryvPVdISke2euFSl
 5nO2hpqcIb1lCH1EwKLrcEcp
X-SBRS: 5.1
X-MesageID: 66555052
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XcQIJq/vyKShVaQhluP9DrUDXHmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 GQbCG/Sa/nYazCke41/bNy/900CsJDWxtFrSQo+rC48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg3NYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhVw
 eUS9ryNGDtxYKKPxrQjYxNVHRxhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgmpt25gTR54yY
 eJFRH1Qch3DZiFiFVYVJp0bueal2XDgJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSSq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFqNjkFfe+cBL7Vk50LTmpTk6QuXO3dRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodtvxor6p5
 iVspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/IdENuWsvdRYwaK7onAMFh
 meJ5Gu9A7cJYhOXgVJfOdrtW6zGM4C8fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPQm0UFC7yhOHCKmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcDoLYmrXGYewiMdF55b7bjAcR2oX4hZHR+Nle0wXkzJ42o6f5HJZcweLAm8s1lzOJ1E
 KZZK5nRXKwXR2SV4SkZYLn8sJdmKEahizWRMnf3ezM4ZZNhGVDEo4e2Ygv1+SASJSOrrs9i8
 aa43wbWTMNbFQRvBcrbcty1yFa1sSRPke5+RRKQcNJSZF/t4M5hLCmo1q07JMQFKBPiwDqG1
 lnJXUdE9LeV+4JsqYvHn6GJqYutAtBSJEsCEjmJ96uyOAnb4nGnnd1KXtGXcG2PT2jz4qijO
 7lYlqmuLP0dkV9WmINgCLI3n7km7t7iqrIGnARpGHLHMwaiBr96eyTU2MBOsutGx6NDuBvwU
 UWKo4EINbKMMcLjMVgQOAt6MbjTiaBKwmHfvaYvPUH3xC5r577WA0xdMi6FhDFZMLYoYpgux
 v0suZJO5gGy4vbw3g1qUsyAG7ywE0E9
IronPort-HdrOrdr: A9a23:gi13batuwAMAQHMUoL2Cv3h57skC7IMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK6yXcT2/hvAV7CZnibhILMFuBfBOTZskTd8kHFh4tgPO
 JbAtJD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AWV0gJ1XYJNu/xKDwReOApP+tcKH
 LKjfA32QZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kSFjiWmgPNJt3c04l+KSHq4nc2omRCeg1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="66555052"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Af6tIjKOtVUQrHbUplyOLy2st/jtjqZlBI6RkRbPbDddnW/XyCIeyVku3K3jEtiTzh6hbS2q2i3LzfLY4ipIJzLDfuIatHMqvdj/UhTf7tFIhV0o8Rhoj9SmoYT34jUfWzU9RmVEFCe9HCfPJ1DhBrQur0UFUfapaWa0K8R4aU9ul7f2QEAH7xcC4sVLFSqDNNTPHkY26S3t8tewOuXFEEVNSE8mnTLlxwdUMaaBDgihf0j/MwRm8bLHocAsEO2PDsPYJosaOPPArTqMMJ4iwqvKJ+NQ5BNiA4JnzqKjB69ROKZNiITXY80DHebU879J6cRk8fOspb1t1+QrCckZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59r7fbZ3K+LcmEoyCa8BNqjqMu4sOS5sUKRPzfo807I=;
 b=DBpS0kWXM22tGUAlKqFmPblAc+gLjLRJ/C8P+HCTe13EOXTwztlvZ7jXkW72N5XnjAMUx0kvP44wM86LgA9ceBHVztICjes9NTyx73HYF6ggTJR6JnUJ+shRxQ/3+8FeVnWfEMhH3uSA8ojOSEAAsLX8XkWJbjgYKV2YkMOJhTLY5UQILpjUPyp8UZSGktqqsYJlDdQ+N/o/NFMLaitrRsrvBJ8yRFN3mQWKj53Yhmg9HzLuK10c8Vm2QVCnXpHNL64vUIpFJuoIIpupJo688qB6Te5p9v2LNzr7X7MOrhcmo0BfRtsrYgsICuJK8QABOvCDbrAvnRKt9R8pAbSPEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59r7fbZ3K+LcmEoyCa8BNqjqMu4sOS5sUKRPzfo807I=;
 b=Khx0ogaSgWq+Rh2fi7sNbVT7eNrWnpXf/J8suVrPur9BlAhfGFiKimPyj4G0EHtgBXQhKE/j7vt5zmJutjye383hHscFF/Z55imYBHKqqwsh4fsYaTVE7hSQrnIRFr6Nr6LGx8BgO5JqCWw4lTUGgURsHX6bptlfa4DzcHCwp2E=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/retpoline: rename retpoline Kconfig check to include GCC prefix
Date: Wed, 16 Feb 2022 10:02:58 +0100
Message-ID: <20220216090300.9424-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216090300.9424-1-roger.pau@citrix.com>
References: <20220216090300.9424-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::15) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac6e6ad0-fd85-4ff4-1786-08d9f12b2b72
X-MS-TrafficTypeDiagnostic: MWHPR03MB3104:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB310454247B9FC084CBB854CF8F359@MWHPR03MB3104.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3lbbXZGpyKFO2Qo66v6zPGMOjBsqvUGMYeFsgLnwByV/RARrCb86NlyhZGrBPIsOmIVq5kpiinxOg2AF3694I75F/4ZroH6xUSPu7E0pM207cdBvBx5Jw+1GFdtc6alZBPg9XzFizOayXRsvgXg5Zu335m+T3SizfnNYiLO5bNUzlUHI8T2jiZKTryA8M8EbaQEzl/NNiCNw6E4e4pVUq7KBNRLBaleUTEKAZgPSclAWsyi3CQgftRv5BYtq7Uoiyj4D1k83OuESzzbcFoA6zdA0ane2CFiI9VQDx8hkro/pf4yudLfpho9LY8N56DWbRxgT7lJAWYgpA4lM2hegK5a3OqLuxp5jXnBfUtiyoF0lD1A5j70BKwCX0CbFKkFym6pkrcz4ooaydywUou3s9zuCWS4CSuXut10hrJvrvr57gdGrkJCwwELmJdtxsgZVHS5BzdAkp/T8MG4EkVLjKVMBNR7C1sexnXFjih/ybUBkM2h5roJILiGjNu6CrmG5kV52mJEeOCdI1F2O8yTaCGk1VGYl+dgHxTxVd3O8eW7g4rTUcMER4ClUXCIe9eO3U9+gW3c9Y7+o/NHIDdRdf7eGTNo4G9wNeVHj4nGNdRQSPUZ+Jp+TwjtgGiruYbkJ8CFoTymRDxanbLytxcO7rQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(6512007)(2906002)(86362001)(6666004)(8936002)(6506007)(5660300002)(83380400001)(54906003)(508600001)(82960400001)(6486002)(38100700002)(6916009)(66476007)(36756003)(66946007)(316002)(2616005)(26005)(1076003)(186003)(66556008)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWtDRndDZ3laVHhRQzh6aXhjVmVQZkN3REFoWDROQnFMZG0xUTh4NUZ6UHR5?=
 =?utf-8?B?cmgyVE82MTduZXBVeGxHcUlDTXp4OFdaSzU5WjVQYytyTkNXc1RYekxqSmtm?=
 =?utf-8?B?Z2h2d0NwdmY0c1pWZGRjbWZYZUFNdjg2ZFg3WGVTc1lWUUkrOUhteFptS0cy?=
 =?utf-8?B?ZjZ0R29tV2pzL2xiNDlPc3ZZVzBkVXgrdHJUU1lIVlFDSzNJQXprRTlmV1N2?=
 =?utf-8?B?RDRBbDcxb1JERzNmZExhemJ2d2JWRzQzOFFLLysxeEZLM1BrTjkrU0dka2hP?=
 =?utf-8?B?ZU1QVWRJL3FZazVQL1lyR1QzZU1SRUlhZy90Ty8wTkxPa1lyTHRsKzVUSWlx?=
 =?utf-8?B?ZE80RzR2aTYvdkhHYzFPMFVYYTdSSjBncGJzOWV5RFkxa1lLTWRBSEJ4bWZs?=
 =?utf-8?B?NnNWUDNta0QyUUNaUnFDTXVUVmtta1MzTk1MYUxLNUZ6UjJaRU1QSm52TU1Q?=
 =?utf-8?B?cTNreERxUzhIWG5ybFY0T3lmTlFzL2J0SXpFS2p3UjFqWW5YekNUeDJrNkNr?=
 =?utf-8?B?TTAyZUdDQy9HenBaWUREYWc0S095VVQ3eFBEVXE4dCtnNmkzbkxkbk1BTXI0?=
 =?utf-8?B?TkJHTW1oOC80YkJpQ2N5alFmZVlwZWhyY1hOaUVSL01CaHpRd1dsamtZVUpq?=
 =?utf-8?B?dDBUdkR1N0hRa0FTSGJCdHgxMWJHOWNNOVF2YmFsZStvUFpUTkFrYXJRb0p0?=
 =?utf-8?B?MC80TmZLU1BoVHpON1NRR25OalhEdHI3MEFqNVhiYTR1M1pSRjZJaHIrL1Bj?=
 =?utf-8?B?V0ZFUDBCcStCQ01DOXU3NXJ5MjJTNktFMGcwZHgrejJxQ3FvL3JJNlZXayt5?=
 =?utf-8?B?RmRtUHZGUmhXLzBTd2xwTHlFemIxSEszOVNraWFrVytsTWk2U2NBK3JLczcw?=
 =?utf-8?B?QU5hcEFCdEZjTit6ZUNaRnFDZWNCTE1tUGU2Uk9NZlVZQ3V4NVVEUUdVSnNX?=
 =?utf-8?B?VnFjL0UrWTBGRUpsMWJldUVpSjJhVnh0L1RQNEUyRnFCWFlFaDJTK1RBelNB?=
 =?utf-8?B?dlhpbXlhM2pJQ1VGYTFsK25ndncxS3JXVFg0cXVDbTJQSXc1T3JEdlNBYlJj?=
 =?utf-8?B?ZmxuSW9wQng4OFIvTkt5WmYzaThyTTd1WDN1Myt5YnJuNnlPSk5XanpjTEJE?=
 =?utf-8?B?UzFSY0owYmVqMG91YVFQMFdOVjdmTFJwdElwbzh5RE5HcTh5eTkrVlhFNkdu?=
 =?utf-8?B?QzgzRTNNeFhqQ1Y3NlFjRU5MdlVZK21sK2ZtYUVlM2ZJWXZvODY4SHhQUjEw?=
 =?utf-8?B?RE5vMTM2VWVTMUtRbnlZQzNRQ1JnbDExUVN0M1E2Uzl0UEc3RFhoZEs5UEdx?=
 =?utf-8?B?cXppc3h6Nmt4d2ptYkR6bk5pcU1rYmo0K3psWUZzWmxDZVdIVDZ0S2d5K2FX?=
 =?utf-8?B?eWdvSXQ0MW9SMzFKRndleWhrdmhTcld1djZsakY4bVVJcm5xek4vN295L2xS?=
 =?utf-8?B?SnBmYzhYNm9Od3Z2Z1BnZU9NTlU0Vk5KcTdmdFUxR1U2QThHZTNtM0ppcFMv?=
 =?utf-8?B?b2ZwTGt4M3J4clViKzJnei95YVUyUHliRGFvVlk5YWdualZ2Wk8xT0M5MWJv?=
 =?utf-8?B?cW9sWVlTb0pYYUpDN213K2tYYWpuWnJaYXJBdU9pM2l5eC9DWGNVVHZHdkpN?=
 =?utf-8?B?RitFQlBwRGNaUnJSV241bk5waEluT216bjIrS3FBR2pwWFdab0JjMWREWHpT?=
 =?utf-8?B?R0Nia2pvZ0dzVXlwSEtlYjFUclFwdFB4MWl4K0tBeDBzdFNneElYVUMwbi92?=
 =?utf-8?B?RTl0c2pjYlRjdzdvQnZ2UlBTSTRGTlF0bExxTGs3bWZONCtkalFqKzBZa0w5?=
 =?utf-8?B?dmwvV3VGZi9IOXRpMVZRWEVzSlBUTWlxM2lZQ01PUlR5dmVhUDBmcHdvWXY1?=
 =?utf-8?B?YytBRXdyZzVOWFJSNGg3NzFGZjB3ZERqc0Q0VktFVkc0TFN6ZGw3QVVkTDE1?=
 =?utf-8?B?VStIVjFtQ1BVM2xvanBURzVlVXZLUTcvZjNaeWtoS0JXdkEwYlRGNVJEZHpZ?=
 =?utf-8?B?Y1ZIeHhUT1ZsK1pSU2xzY1BxNkM4YTc1STJ3ZG1DSm9na1pHNkJmVlJ5VnJX?=
 =?utf-8?B?d2hOa25JZ2N3N3ZXZFNIQi82Q3lpY2dEZWRyd2o2SjhHd0p3SmJZTHpNYnF6?=
 =?utf-8?B?d1VScWFBRWFTbUxuOTE4d1pyNm1CVGMvR2NIYUxPNmxTdE85U1A2QkxETUZI?=
 =?utf-8?Q?s8zW6q45Pu+0eyyUx/zuOec=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6e6ad0-fd85-4ff4-1786-08d9f12b2b72
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:03:16.8326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sP7axAO1hdQieDfN/70xItTj4uyBpjxHQM0CEVH4nB6n1zFz15fqA8hNFKw3wtKWy5XDm+QrWrhC4t24POLGog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3104
X-OriginatorOrg: citrix.com

Current retpoline checks apply to GCC only, so make it obvious by
prefixing the Kconfig option with GCC. Keep the previous option as a
way to signal generic retpoline support regardless of the underlying
compiler.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/Kconfig | 6 +++++-
 xen/arch/x86/arch.mk | 8 ++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index b4abfca46f..2cd713724f 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -32,9 +32,13 @@ config ARCH_DEFCONFIG
 	string
 	default "arch/x86/configs/x86_64_defconfig"
 
-config INDIRECT_THUNK
+config GCC_INDIRECT_THUNK
 	def_bool $(cc-option,-mindirect-branch-register)
 
+config INDIRECT_THUNK
+	depends on GCC_INDIRECT_THUNK
+	def_bool y
+
 config HAS_AS_CET_SS
 	# binutils >= 2.29 or LLVM >= 6
 	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy)
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index fa7cf38443..2da4bdb1ed 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -42,10 +42,10 @@ CFLAGS += -mno-red-zone -fpic
 # SSE setup for variadic function calls.
 CFLAGS += -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
 
-# Compile with thunk-extern, indirect-branch-register if avaiable.
-CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
-CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch-register
-CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
+# Compile with gcc thunk-extern, indirect-branch-register if available.
+CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
+CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -mindirect-branch-register
+CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -fno-jump-tables
 
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
 # this to be overridden elsewhere.
-- 
2.34.1


