Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5764143A3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 10:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192239.342603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSxVz-0004xG-No; Wed, 22 Sep 2021 08:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192239.342603; Wed, 22 Sep 2021 08:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSxVz-0004uB-Ik; Wed, 22 Sep 2021 08:22:03 +0000
Received: by outflank-mailman (input) for mailman id 192239;
 Wed, 22 Sep 2021 08:22:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSxVx-0004pu-VM
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 08:22:02 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 280ab036-1b7e-11ec-b962-12813bfff9fa;
 Wed, 22 Sep 2021 08:21:59 +0000 (UTC)
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
X-Inumbo-ID: 280ab036-1b7e-11ec-b962-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632298919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=UFeBg4V7WhycC2OZ2X38kzJnMjaHRI/emKcUl+Sg2oM=;
  b=f8iCrKmvLipTef9Ynlk1NBuioH/NuxYnBoCTLpH1ZHnVutT0QNOg8exd
   iG4qhjFXsN78Rf+Z4sdgq+KvtQMZh7K9Ile9GXqlx5lKrgh9bsq5p8t4i
   J2ZfzYQlOfpTxDn5viLs8miGm+C/tbPtJl+PR4P+vz3V38z9GOox4VuAZ
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: v6ae+TdAS45AqlttK1L+/fUh7eFpq41ArRGM0X4BN9ddn15wNIksIXqFskblmGJm/Kh96+1CIx
 CvOYYTx8QpyJbDHvX8kDiy2/b7rdJpUEJPE6ARr88HB4LQpK4hRfGTn7lHqbbHoZZODEYkSwdO
 IK6qoa3w3DTXvwaUScIMWhgGPFmsUJX3Vs0EFmeuVKCImWlqgOCn52Dl0knBZQvV4t9Tbskl+r
 NQsnN0N3aYcutP2mTubtxero/VVxFoVstrqum/oiYD9c8RzCdt6NftARyZIPhmnrNQId736FiG
 gE+1PitmFm5exQsVNLUb4/cH
X-SBRS: 5.1
X-MesageID: 52894196
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2lA926+147V4qFfNN1OSDrUDEHmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 mAYXjyGb/zbZmPyLtp3a96zoEMA6sCAyYIyTgo4rSA8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6w79j2NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhok
 O1xsJaLSj4kYPLhu7skbhZACzNHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFhmdh2pkfQ54yY
 eIDKjRfMy/vYCYWAVIFN5Ukjdr1jGvwJmgwRFW9+vNsvjm7IBZK+LriKt3OYfSRWN5Y2E2fo
 wru5H/lCxsXMNiezzut8X+2gOLL2yThV+o6Krq88fJ7hUyJ8UYaAhYWSFiTrOGwjwi1XNc3A
 0Ad5CcGt6U5802vCN7nUHWQomOAvxMac8pdFas98g7l4qvL4S6JC24cVDlDZdc68sgsSlQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJSMH6dT+pIA4jjrUU81uVqWyi7XdBjXY0
 z2M6i8kiN0uYdUjjvvhuwqd2nT1+8aPHlVdChjrsnyN91tBWIuvXI+R5AaEwNUfFbuWVkGTh
 S1R8ySB19ziHa1hhQTUHr5XReH3u67cWNHPqQUwRMh6rlxB71bmJNoJsW8kfC+FJ+5ZIWeBX
 aPFhe9GCHa/1lORZKlrasqaD80wxMAM/vy0C6iJMrKijnV3HTJrHR2Ch2bLhAgBc2B2yMnT3
 Kt3lu72Vh4n5VxPlmbeegvk+eZDKtoCKYbveHwG507/jer2iIGppUctbwLVM7FRAFKsiwTJ6
 ddPX/a3J+FkeLSmOEH/qNdLRXhTdCRTLc2m+qR/K7/YSiI7ST5JNhMk6e54E2CTt/8OzbmgE
 7DUchIw9WcTclWdeF3WNSg8OO2wNXu9xFpiVRER0Z+T8yFLSa6k7bsFdotxer8i9ed5yuVzQ
 eVDcMKFasmjgByek9jERZWi/oFkajqxggeCY3isbDQlJsYyTA3V4N70OADo8XBWXCawsMI/p
 Zym1x/aHsVfF1gzUp6OZaL91U61sFgchPl2AxnCLO5MdRi+64NtMSHw0KM6epleNRXZyzKG/
 A+KGhNE9/LVqoo4/YCR16CJpoukCcVkGU9eEzWJ5Lq6L3CCrGGi3ZVBQKCDejWEDDH4/6CrZ
 ON0yfDgMaJYwAYW4tQkS7sylPAw/driobNe3z9IJnSTYgT5EK5kL1mHwdJL6v9HyIhGtFbkQ
 UmI4NRbZ+mEYZu3DF4LKQM5Re2fzvVIyCLK5PE4LUimti96+L2LDRdbMxWW0XEPKbJ0NMUuw
 Ps7ud5Q4Au600J4PtGDhyFS1mKNMn1fDPl36sBEWNfm2lgx11VPQZ3AESunspiAZuJFPlQuP
 jLJ1rHJgK5Rxxaafnc+fZQXMTGxWXjaVMh28WI/
IronPort-HdrOrdr: A9a23:Sed+XqH9fmqeuynYpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.85,313,1624334400"; 
   d="scan'208";a="52894196"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWJtCZoJ3RK8BrwVuuq6W0DcE26fXCTsHbGxOQwoQbTgB7zgUH0XiomUOegXLep28Ft/uEnBAILDGCYY+jsA3b9kSV8pBfq7TSAHUR4tbb4u3Z4BIwiR1/+OdO8SkiFb2/YVEcWj4VHpj5EM8lICslQAO+FUyKsXRxYfpEeN9sdFOuktpLTPbnfISUfFCli58na7kA+ioUt8MBbIb49FNknpkB8sYRKrWCqLsLgOTFJg2LHBbFBKTzFI3gOh441nxDuWt8Z3fXE7GvgBPyc+AJJhJUL7Q2cZ4YXPD7o3l7M4g5PnFhc2diJfnqNfoCG5d9akccUyHHpbHCd5rQzPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=s6lQCVt6prMWfBrL/PhlimqEZ3vfPawL47OaNE9m03I=;
 b=aAsvlBmhbG+9mHV3Dt8XOgq2komdnpjXLdXBrHbIQ2Or+20uXnLe244BA8UkSGTRupsGZpOz9B3WUSszuzQcV9J0MBKK+5cJgB/baYwslKOCw5vBjj07IyfMuqGeYswKuOxjHhGFz2Q6/4h6mtqynR/w1+BHWHCfa2m1RtJhEIqd0Bpeqrdv98w3az8hXd03W1QcKWadJ4xsjoBzxBwTrA9vsLoUDlwkuxpJn4ELTQ/Uh/R8jaEL929IXPePoB8adq7lnxSQSixbClOV2owkPkcWro0DfWGWAxWVMj8bSlb1yBOYI5t82hxd2Z2sYhM/zzZ5i8GXJEJMKXPVJR6B3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6lQCVt6prMWfBrL/PhlimqEZ3vfPawL47OaNE9m03I=;
 b=aq5pjQM5s2Fys386chs6Cs+IkwUzU0RTX/7aEAAAxpMWWAYVNyxLYFuqXUrsPJ7zeb6N9VT/XWCkRsEP+njyfyNdK/Qu/OaPAE/ugn6JV5xNwPOQET9Y5Z2S5I5XZsGlz4nri42uvAoqQ+cVem+TRlkC6alqKdB0DirL0te/k94=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Anthony PERARD" <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/6] gnttab: allow setting max version per-domain
Date: Wed, 22 Sep 2021 10:21:19 +0200
Message-ID: <20210922082123.54374-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922082123.54374-1-roger.pau@citrix.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0191.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::16) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b4a01ee-bfa5-49de-5113-08d97da20985
X-MS-TrafficTypeDiagnostic: SN6PR03MB4015:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB40151AC853AC59CF61EF84BA8FA29@SN6PR03MB4015.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iSX0t8/ejFWgfv1Ko28SBs6ZcHMZjud+Ryl9xmuv/tCkU21iN30X9EGFP6d3g9OzJHIyeWBOn7Orf95fEJ/hjYlIfYwhAjXirzfmqn6/NatVWEhNU5wy5J40KDKd4EEqynY8bQ/8uXEr1M0ka95f8TReDM6JgpQwQ1RGEeBPekEBFFoyPQX7EgtvaOOrN0lZY5K0LvRRQ+KG0Q2+hLQv+TGQvZEE2GE9Vo2oKFeabEoW23f9rRNuqHVZ6/1f8wOKytMuVP0wAeyLxktaZ7HOK3m+X9QN9t9bWDt/15pdXI6NwrIEMAXdNlzhRl0yRRHNBOg8flr6w+vGYB3Do+kh74zu0mGvONYKZlj3eagHkfG2hIK5GSVuPO49pWONj4nAatHSSR6Lkv6tJF1dVm9o3If15+acAZz81sbfkL+xqi8iQ0OlF0mTtqRhNGVVm3rz4vjbR7B9K7vQdoQgrWPVmENewvmhZg3jPLYlgkvxf/d+oG47hz8mp9Uxc6GxWHje+iTTaf8e8TOMVgpFV8u6QSWstWUezqQv+WGe2k2ipxUK9Eg5ZlP1FmXVNYvVIMKNN3F14Yb5narOlbMigVZHO7ubqpqgHAuaLOJTbg/lbLggvRKzETGGqKmWGBKV8MKK43jBUPOKYBC63lAXpPxaKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(66946007)(4326008)(38100700002)(8936002)(186003)(956004)(86362001)(2616005)(8676002)(508600001)(54906003)(83380400001)(6496006)(26005)(6916009)(30864003)(2906002)(6666004)(5660300002)(1076003)(6486002)(36756003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXF5dDIvTG5jbERxOWh0dU9TZEJDd1pjeHJxZVVzaXdTUFFuTUFTbHVlNmlR?=
 =?utf-8?B?Y0hXaDhhcU9vbSt6VktYSlovbW9ILzV3ek14cmxOVHBhVW1rYVBoL1JmSlB3?=
 =?utf-8?B?V2Y2K1RydVhOSitMWkFwcytVa3lrTGRHKzV6SlRubDM3YlhPdmZCMnY5SXJX?=
 =?utf-8?B?bDRqMmpJaWFGMzlMdlh4cUYvZ3hsRnRidVB4RG0wdGlGQ0dlTTZ6SnVjSTFj?=
 =?utf-8?B?cE9JeGpGSkhRUDBjSXRuOUNPYmxIRTc1QVlGQmphMHFsNjd5UXZnRGFrY0la?=
 =?utf-8?B?aUNwS3BwWFV3YS9VMk5yclJHb2QrWCtiUFlwNnYrbjZ3N3EyUms2MjhOLzF6?=
 =?utf-8?B?N0hrTkVhQUp3N2g1SitZQnVFQmYrV2UrUElIVzZCbEVmREpwODExRmF1UXVO?=
 =?utf-8?B?TXJvM2d4Y0lYTlNnamQrOFJJMGpkM3NlWVhKblZJZWNlaC9GQXRWTEJ3Uzdm?=
 =?utf-8?B?d3VSeVhoNlJxczBCN25QMGYrdjltRFAzMVZOQU1BWU1qQ21hRWxiakR6UytI?=
 =?utf-8?B?Y0lUYnFUeHo5WEEzM04wb1MvK0t0S2VEUVJidDZLL1dGVlgyTHZ3Rnd4azRY?=
 =?utf-8?B?TS92K1NZR1Q0RUx3bUc2aFBMeWRCbUF5WVhJSjliYk9scEs4MmpSbVU3WGs5?=
 =?utf-8?B?T1RCdEhBdUJ6SW5HUlF4algrbUxRbWg3bWpwZjVKcGVENzBQVTV2VnNYVWZp?=
 =?utf-8?B?a0Zrc25FcjNnbVh4YXBHd0ZxWTFXclhnMGZpeVF3MC9jNUtMNW9VVXRGbWw2?=
 =?utf-8?B?THBvWlQrQmNwWjZzQVI5OUN0cjVyMG10VC81c2JkQzRqMlRnaDFwbEpYU2Jk?=
 =?utf-8?B?Mk5BMkhMWXgydWhGYkdPOFh5c1dQMnB3ZHdsbFVhQ1Q2b2ZWNzZEQUNiTEps?=
 =?utf-8?B?T0Y4WjZmVjNlRmdIRVZpZ1VvYmwwMWhpUGNmQnI4K25QVGZ6YmNXZFgrUXJF?=
 =?utf-8?B?YktGN3BnQ3FjaStsbExoeUhMRzRLZmhtRkFPZTZEV0ZIaGN2NHREQjBTajFj?=
 =?utf-8?B?Z2VUcmZQeCt5VU1iMlJhZHY2a00xaWdWcjFCRm96VDQyYVlCQVp3UjNqM0Ro?=
 =?utf-8?B?UVhKaTlPaERBbFBrOEZITUxsUkV5eDlCUWozRzhXYWRiMVBqTkV5MDV5c0V2?=
 =?utf-8?B?N1VZcWxzeWdTM3VvM3RjWFhpaE1Jc3hIdjRsWmJnRTU4ZUNaUGxxc0FuQS9N?=
 =?utf-8?B?YVhmNU9XaE9xRGdoNkluYldVckg3N0FlUCttYi9hTlBTMVZLclU5SEFXN2Fv?=
 =?utf-8?B?ZlJZbGlZSnlPN3FObGVtelBNcFdqanBXZ3BpTUxXWDU0R2JoRzl1ck1ZTmJ3?=
 =?utf-8?B?cGJINW9nZVp0d2NNNmxobHl3OUJvRVFGUFZoVDJWN2JUUXpjc09NbDI3SUJO?=
 =?utf-8?B?RDNhakdVMC8wV2hYMFBnaURLclF4MjlTNEJiTEJaK1JCcVhua3hrcThCbUZy?=
 =?utf-8?B?a2g1a3Vja2ttYnYrSHJnYTdhQ1NGK21xSEFCd1pUR003cU9WTDdGT09ER2VQ?=
 =?utf-8?B?ZUNDMVIzcVBCTVhtMFJTRm10eGxaU1ZpaXJVYkxaVWxUdFVrMVhBaFRWUU9G?=
 =?utf-8?B?aEdIaWsxaVdrYUxDYVBBUjgzUkdkUFF5UTBzSHNCSnVhZDdscEhTdy9pbFVz?=
 =?utf-8?B?cmhtM2g5SytuYjF6TlZrU0xDSnNkYklYMVd4TEpZcXN5cU10d3dSQ1RKWW5Y?=
 =?utf-8?B?cGRxcmtjNWhUNk54WitlNCtZeldlWVYxRk9zVGxJRWV5MEYxaFNZTFgyTzFV?=
 =?utf-8?Q?bE0Nd0ilAWxtPJBxUgLkGO+umE/4waBIo3spjF9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4a01ee-bfa5-49de-5113-08d97da20985
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 08:21:54.9428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: he5AWf2yRRdGH5sjsh/G9Y5uzpLBPKuKKrw8TRzE7y7BXYekATQZ0xd9gNCBUxsy0JRvpSzF0bpPUmydZ7hjxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4015
X-OriginatorOrg: citrix.com

Introduce a new domain create field so that toolstack can specify the
maximum grant table version usable by the domain. This is plumbed into
xl and settable by the user as max_grant_version.

Previously this was only settable on a per host basis using the
gnttab command line option.

Note the version is specified using 4 bits, which leaves room to
specify up to grant table version 14 (15 is used to signal default max
version). Given that we only have 2 grant table versions right now,
and a new version is unlikely in the near future using 4 bits seems
more than enough.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
NB: the stubdom max grant version is cloned from the domain one. Not
sure whether long term we might want to use different options for the
stubdom and the domain. In any case the attack surface will always be
max(stubdom, domain), so maybe it's just pointless to allow more fine
setting.
---
Changes since v1:
 - Introduce a grant_opts field and use the low 4 bits to specify the
   version. Remaining bits will be used for other purposes.
---
 docs/man/xl.cfg.5.pod.in             |  6 ++++++
 docs/man/xl.conf.5.pod.in            |  7 +++++++
 tools/helpers/init-xenstore-domain.c |  1 +
 tools/include/libxl.h                |  7 +++++++
 tools/libs/light/libxl_create.c      |  3 +++
 tools/libs/light/libxl_dm.c          |  1 +
 tools/libs/light/libxl_types.idl     |  1 +
 tools/ocaml/libs/xc/xenctrl.ml       |  1 +
 tools/ocaml/libs/xc/xenctrl.mli      |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c  |  7 ++++++-
 tools/xl/xl.c                        |  8 ++++++++
 tools/xl/xl.h                        |  1 +
 tools/xl/xl_parse.c                  |  9 +++++++++
 xen/arch/arm/domain_build.c          |  2 ++
 xen/arch/x86/setup.c                 |  1 +
 xen/common/domain.c                  |  3 ++-
 xen/common/grant_table.c             | 22 ++++++++++++++++++++--
 xen/include/public/domctl.h          | 12 ++++++++++--
 xen/include/xen/grant_table.h        |  5 +++--
 19 files changed, 90 insertions(+), 8 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 4b1e3028d2..a4bf2caafa 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -580,6 +580,12 @@ to have. This value controls how many pages of foreign domains can be accessed
 via the grant mechanism by this domain. The default value is settable via
 L<xl.conf(5)>.
 
+=item B<max_grant_version=NUMBER>
+
+Specify the maximum grant table version the domain is allowed to use. Current
+supported versions are 1 and 2. The default value is settable via
+L<xl.conf(5)>.
+
 =item B<nomigrate=BOOLEAN>
 
 Disable migration of this domain.  This enables certain other features
diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
index b48e99131a..0a70698a7c 100644
--- a/docs/man/xl.conf.5.pod.in
+++ b/docs/man/xl.conf.5.pod.in
@@ -101,6 +101,13 @@ Sets the default value for the C<max_maptrack_frames> domain config value.
 Default: value of Xen command line B<gnttab_max_maptrack_frames>
 parameter (or its default value if unspecified).
 
+=item B<max_grant_version=NUMBER>
+
+Sets the default value for the C<max_grant_version> domain config value.
+
+Default: value of Xen command line B<gnttab> parameter (or its default value if
+unspecified).
+
 =item B<vif.default.script="PATH">
 
 Configures the default hotplug script used by virtual network devices.
diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 6836002f0b..7cd1aa8f7c 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -88,6 +88,7 @@ static int build(xc_interface *xch)
          */
         .max_grant_frames = 4,
         .max_maptrack_frames = 128,
+        .grant_opts = 1,
     };
 
     xs_fd = open("/dev/xen/xenbus_backend", O_RDWR);
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b9ba16d698..7a35833312 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -502,6 +502,13 @@
  */
 #define LIBXL_HAVE_X86_MSR_RELAXED 1
 
+/*
+ * LIBXL_HAVE_MAX_GRANT_VERSION indicates libxl_domain_build_info has a
+ * max_grant_version field for setting the max grant table version per
+ * domain.
+ */
+#define LIBXL_HAVE_MAX_GRANT_VERSION 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index e356b2106d..1ee86602ae 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -606,6 +606,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
+            .grant_opts = b_info->max_grant_version == -1
+                          ? XEN_DOMCTL_GRANT_version_default
+                          : b_info->max_grant_version,
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
         };
 
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 9d93056b5c..9a8ddbe188 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2320,6 +2320,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
     dm_config->b_info.max_grant_frames = guest_config->b_info.max_grant_frames;
     dm_config->b_info.max_maptrack_frames = guest_config->b_info.max_maptrack_frames;
+    dm_config->b_info.max_grant_version = guest_config->b_info.max_grant_version;
 
     dm_config->b_info.u.pv.features = "";
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 3f9fff653a..37789a568c 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -518,6 +518,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("max_grant_frames",    uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
     ("max_maptrack_frames", uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
+    ("max_grant_version",   integer, {'init_val': '-1'}),
     
     ("device_model_version", libxl_device_model_version),
     ("device_model_stubdomain", libxl_defbool),
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index a5588c643f..6a8658bfec 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -83,6 +83,7 @@ type domctl_create_config =
 	max_evtchn_port: int;
 	max_grant_frames: int;
 	max_maptrack_frames: int;
+	max_grant_version: int;
 	arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 6e94940a8a..5933d32c70 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -75,6 +75,7 @@ type domctl_create_config = {
   max_evtchn_port: int;
   max_grant_frames: int;
   max_maptrack_frames: int;
+  max_grant_version: int;
   arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index ad953d36bd..1e60925069 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -188,7 +188,8 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 #define VAL_MAX_EVTCHN_PORT     Field(config, 5)
 #define VAL_MAX_GRANT_FRAMES    Field(config, 6)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
-#define VAL_ARCH                Field(config, 8)
+#define VAL_MAX_GRANT_VERSION   Field(config, 8)
+#define VAL_ARCH                Field(config, 9)
 
 	uint32_t domid = Int_val(wanted_domid);
 	int result;
@@ -198,6 +199,9 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 		.max_evtchn_port = Int_val(VAL_MAX_EVTCHN_PORT),
 		.max_grant_frames = Int_val(VAL_MAX_GRANT_FRAMES),
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
+		.grant_opts = Int_val(VAL_MAX_GRANT_VERSION) == -1
+			      ? XEN_DOMCTL_GRANT_version_default
+			      : Int_val(VAL_MAX_GRANT_VERSION),
 	};
 
 	domain_handle_of_uuid_string(cfg.handle, String_val(VAL_HANDLE));
@@ -251,6 +255,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 	}
 
 #undef VAL_ARCH
+#undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
 #undef VAL_MAX_GRANT_FRAMES
 #undef VAL_MAX_EVTCHN_PORT
diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 4107d10fd4..0fde879cf4 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -55,6 +55,7 @@ bool progress_use_cr = 0;
 bool timestamps = 0;
 int max_grant_frames = -1;
 int max_maptrack_frames = -1;
+int max_grant_version = -1;
 libxl_domid domid_policy = INVALID_DOMID;
 
 xentoollog_level minmsglevel = minmsglevel_default;
@@ -213,6 +214,13 @@ static void parse_global_config(const char *configfile,
     else if (e != ESRCH)
         exit(1);
 
+    e = xlu_cfg_get_bounded_long (config, "max_grant_version", 0,
+                                  INT_MAX, &l, 1);
+    if (!e)
+        max_grant_version = l;
+    else if (e != ESRCH)
+        exit(1);
+
     libxl_cpu_bitmap_alloc(ctx, &global_vm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_hvm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_pv_affinity_mask, 0);
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 7e23f30192..cf12c79a9b 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -282,6 +282,7 @@ extern char *default_colo_proxy_script;
 extern char *blkdev_start;
 extern int max_grant_frames;
 extern int max_maptrack_frames;
+extern int max_grant_version;
 extern libxl_bitmap global_vm_affinity_mask;
 extern libxl_bitmap global_hvm_affinity_mask;
 extern libxl_bitmap global_pv_affinity_mask;
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 17dddb4cd5..1206d7ea51 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1431,6 +1431,15 @@ void parse_config_data(const char *config_source,
     else
         exit(1);
 
+    e = xlu_cfg_get_bounded_long (config, "max_grant_version", 0,
+                                  INT_MAX, &l, 1);
+    if (e == ESRCH) /* not specified */
+        b_info->max_grant_version = max_grant_version;
+    else if (!e)
+        b_info->max_grant_version = l;
+    else
+        exit(1);
+
     libxl_defbool_set(&b_info->claim_mode, claim_mode);
 
     if (xlu_cfg_get_string (config, "on_poweroff", &buf, 0))
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d233d634c1..3beb1cbb41 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2649,6 +2649,7 @@ void __init create_domUs(void)
             .max_evtchn_port = -1,
             .max_grant_frames = -1,
             .max_maptrack_frames = -1,
+            .grant_opts = XEN_DOMCTL_GRANT_version_default,
         };
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
@@ -2756,6 +2757,7 @@ void __init create_dom0(void)
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
+        .grant_opts = XEN_DOMCTL_GRANT_version_default,
     };
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b101565f14..b5b6c75447 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -750,6 +750,7 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
+        .grant_opts = XEN_DOMCTL_GRANT_version_default,
         .max_vcpus = dom0_max_vcpus(),
         .arch = {
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6ee5d033b0..6519272c47 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -669,7 +669,8 @@ struct domain *domain_create(domid_t domid,
         init_status |= INIT_evtchn;
 
         if ( (err = grant_table_init(d, config->max_grant_frames,
-                                     config->max_maptrack_frames)) != 0 )
+                                     config->max_maptrack_frames,
+                                     config->grant_opts) != 0 ) )
             goto fail;
         init_status |= INIT_gnttab;
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index fe1fc11b22..c43e9d5ee4 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -53,6 +53,7 @@ struct grant_table {
     percpu_rwlock_t       lock;
     /* Lock protecting the maptrack limit */
     spinlock_t            maptrack_lock;
+    unsigned int          max_grant_version;
     /*
      * Defaults to v1.  May be changed with GNTTABOP_set_version.  All other
      * values are invalid.
@@ -1917,11 +1918,27 @@ active_alloc_failed:
 }
 
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames)
+                     int max_maptrack_frames, unsigned int options)
 {
     struct grant_table *gt;
+    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
     int ret = -ENOMEM;
 
+    if ( max_grant_version == XEN_DOMCTL_GRANT_version_default )
+        max_grant_version = opt_gnttab_max_version;
+    if ( !max_grant_version )
+    {
+        dprintk(XENLOG_INFO, "Invalid grant table version 0 requested\n");
+        return -EINVAL;
+    }
+    if ( max_grant_version > opt_gnttab_max_version )
+    {
+        dprintk(XENLOG_INFO,
+                "Requested grant version (%u) greater than supported (%u)\n",
+                max_grant_version, opt_gnttab_max_version);
+        return -EINVAL;
+    }
+
     /* Default to maximum value if no value was specified */
     if ( max_grant_frames < 0 )
         max_grant_frames = opt_max_grant_frames;
@@ -1947,6 +1964,7 @@ int grant_table_init(struct domain *d, int max_grant_frames,
     gt->gt_version = 1;
     gt->max_grant_frames = max_grant_frames;
     gt->max_maptrack_frames = max_maptrack_frames;
+    gt->max_grant_version = max_grant_version;
 
     /* Install the structure early to simplify the error path. */
     gt->domain = d;
@@ -3076,7 +3094,7 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
         goto out;
 
     res = -ENOSYS;
-    if ( op.version == 2 && opt_gnttab_max_version == 1 )
+    if ( op.version == 2 && gt->max_grant_version == 1 )
         goto out; /* Behave as before set_version was introduced. */
 
     res = 0;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 96696e3842..e2b47184a0 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -87,14 +87,22 @@ struct xen_domctl_createdomain {
     /*
      * Various domain limits, which impact the quantity of resources
      * (global mapping space, xenheap, etc) a guest may consume.  For
-     * max_grant_frames and max_maptrack_frames, < 0 means "use the
-     * default maximum value in the hypervisor".
+     * max_grant_frames, max_maptrack_frames and max_gnttab_version < 0
+     * means "use the default maximum value in the hypervisor".
      */
     uint32_t max_vcpus;
     uint32_t max_evtchn_port;
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
 
+/* Grant version, use low 4 bits. */
+#define XEN_DOMCTL_GRANT_version_mask    0xf
+#define XEN_DOMCTL_GRANT_version_default 0xf
+
+#define XEN_DOMCTLGRANT_MAX XEN_DOMCTL_GRANT_version_mask
+
+    uint32_t grant_opts;
+
     /* Per-vCPU buffer size in bytes.  0 to disable. */
     uint32_t vmtrace_size;
 
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 41713e2726..fe6225346f 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -36,7 +36,7 @@ extern unsigned int opt_max_grant_frames;
 
 /* Create/destroy per-domain grant table context. */
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames);
+                     int max_maptrack_frames, unsigned int options);
 void grant_table_destroy(
     struct domain *d);
 void grant_table_init_vcpu(struct vcpu *v);
@@ -67,7 +67,8 @@ int gnttab_acquire_resource(
 
 static inline int grant_table_init(struct domain *d,
                                    int max_grant_frames,
-                                   int max_maptrack_frames)
+                                   int max_maptrack_frames,
+                                   unsigned int options)
 {
     return 0;
 }
-- 
2.33.0


