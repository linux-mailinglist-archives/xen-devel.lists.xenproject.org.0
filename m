Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A6C6BD55D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 17:18:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510702.788891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqII-0002mC-7F; Thu, 16 Mar 2023 16:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510702.788891; Thu, 16 Mar 2023 16:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqII-0002ip-3r; Thu, 16 Mar 2023 16:17:34 +0000
Received: by outflank-mailman (input) for mailman id 510702;
 Thu, 16 Mar 2023 16:17:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcqIF-0002ij-N7
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 16:17:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08b52e12-c416-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 17:17:25 +0100 (CET)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 12:17:09 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5231.namprd03.prod.outlook.com (2603:10b6:208:1e0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30; Thu, 16 Mar
 2023 16:17:03 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 16:17:01 +0000
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
X-Inumbo-ID: 08b52e12-c416-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678983445;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=bRgHK19H5wmLjBVui25zIcTJlAp68OmKVwRUztqD3f4=;
  b=JfvhAz4DIY8yMF7DB354ZfBFfExwsc9lcnjkLzOKStpBJl5NoxFlTyXR
   AJZNqrZK271aBfxgmdwBYjqXczrI1nBVvX1tfdKufeiHFz6DtdAU1waMI
   kyr9l/fnXKJGSaFZZgnNpDBqKRkPsC91xMHQR5/K7Q7ddlFqDpFbedzpt
   w=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 103564023
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9A0D4qth27RC+ucGMxIgw+BDuOfnVNhfMUV32f8akzHdYApBsoF/q
 tZmKWGGPvbcMWP8c9FyYYWy8hhVu5XSnd5rGQA/ri1nFCxB+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASHySFKZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBy4nMw3ErbON5bO/ettvq+IvLuTXFdZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4S9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiANlPSuHgrKUCbFu74jIxBywObF6AgsaJlB6jYo5OJ
 GEtw397xUQ13AnxJjXnZDWGp3qDsg8ZSsBnOeQw4wGQyYLZ+w+cQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAXJ2IfYS4PTSMe/sLu5oo0i3rnUdJLAKOzyNrvFlnYw
 S2OrSU4r6Uei4gMzarT1Uvcnzumq5zNTwg0zgbaRGSo6kV+foHNT5Sh9Fzz/ftGaoGDQTGpv
 3Uams7Y8OEHC7mMkjCARKMGG7TB2hqeGDjVgFoqFJ548T2ooienZdoJv284I1p1OMEZfzOve
 FXUpQ5a+J5UOj2tcLNzZIWyTc8tyMAMCOjYaxwdVfIWCrAZSeNN1H4GiZK4t4w1rHURrA==
IronPort-HdrOrdr: A9a23:JHzsXKHjxBNVuqkxpLqE7MeALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5IUtQ/uxoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="103564023"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVGjGgYv6rc9CoodpYwa+FKAfBR9RW5BwKLT0cbEgjxev/FETrmq57wXrUxOnnCXFesq4F0eQdRVMjvYLA5JGLnQpWPFmH1B1j7zNQ0+tN2qSvXDux/jBcTBC2ccZP+nBxWAhw5fU1/6MoeGfNPCHSvZVFuNOUZbkpF9vrIy6bluhNi5brHGGIPgOZecewTr5D9UiEXZViALMm/oa61r1p1OiA+nOFnYKfUmot7fk5zVz9mzmteCHwE89ZCFH97Eu7ipl9aNuJyEWNM06tPlk0AbOkgIu43kA2eTQmLeFzBDdZgrbdm+2zdQgfloy4V3De1CnrG8noZuXgopHZYulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gHcRfMgagFDJfPcqavwE32II0D7fwAP5uKy50EpeJc=;
 b=kIAY84zAK6Zj8pdQYjC0fT/WPZ8yy7FicGX4iDLZW3DT8zQ3A0gZRgzFiDjjESmi2aIHI7Z2ushZziJYBOceh1QAh3UdW7HL/zOvYawCy2rmHuagvzfeqIU5exD5MEZ0e6y7625cSfJ9EUkrOdpzJ7KCXGE3XHfedBz4dsp4zxeO4cS6ZG0cLl++rNUzjUbPnMjzxa33EiinciuG2Iy7vRIYRjmqm1Nph8gTi6MS52xLA8EHp/b9TdIpcu2YjT8tiqmSNeLQ+tGZtvXjn2UmtAHLcmSZ0WrXYnHklHE1Z+PcFafMtE3rpC65IW0NZshuhJp2zQS47TaHwpHM+5gjZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gHcRfMgagFDJfPcqavwE32II0D7fwAP5uKy50EpeJc=;
 b=MhqT72L/FIdfo2xsMdj/rp75AHHuTB9lDZNyX/8+FQg0GsIN3PaIX+eRkZtTbHq8IVEpAoE3W6+TFeHmU85Jnfs7kGQ8gjIrGEgKq++k4yNZU/9sQ+gSa3tYHS+YYts3LXokCXedHnW/oLOz48I98qtFJ/OuyDk8MuS7E31qmpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 17:16:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Message-ID: <ZBNA9q5DXJYG3KVp@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO2P265CA0498.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5231:EE_
X-MS-Office365-Filtering-Correlation-Id: 562bd50c-87f2-4dfa-b5e0-08db2639df6b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gpmnOHdFuxYX+MmGu5eV/NloJWglkvauTZqUWgEi9CpikMnaqfQppMLHS9XokEhpmLzoG7oQyP+9D286bb+8H65FBbYEVvLj8OCITEwjUd6YHAEp97fVQ7Yo/3ZSYT9Z43mP25nEjqe15CoKKXYEwtkj8MS3MXLhttCfplLTaYGAvv5ANdvnA+kX/us/B23RnsII4n29gD64kNJCMmNl9rMg7Bxg3B7T7C+vhgkGl4V9e9tFzIB3BYdm7tJbK+wEGlUi55UPGCvMU2OLuhKxNObFwdiOfGnKBUeCMsG89beS4duKmmY6RejL8bB0nyV0oSmuV+Asrq+VndKDXd9QYHqGPQ45KShPfu19VQUArJ7+irfd07AoasOpdpISkiNCuiBqQIBIHuNs4NkZK+WqAg8yeqhCReBARcH8mkKo5xfvt5wk2Tsr3LUqVEVNS2kZbFAaZGbSk1xNWthbGi7mUFFBiBUgvt5spxntnCHSCVP1fAMeYVuYBAPMn4LqwbSh0wZXCQ7vjdYuQ15ULXXmA4oPA2M47RM5sYPEOBDkfkMd8EiCGWk8RNuzUtB2fn4ofnPjFg2ou+wc8bqzzz/fJ2r2r1RVkqAblVl3pxSFIXD0hF/3BXimOv2m8JnJq+DOmXgcPzIQ8SPk6IT/6sfDrqKQ4PpOYj0sNs2DkJ8s8dZLHAS2zY8tDmNA2Vi7uZ4I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199018)(86362001)(82960400001)(85182001)(41300700001)(2906002)(5660300002)(4326008)(8936002)(7416002)(30864003)(6916009)(6506007)(66476007)(33716001)(26005)(6512007)(9686003)(186003)(83380400001)(38100700002)(316002)(54906003)(66556008)(66946007)(6486002)(6666004)(478600001)(8676002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU9FT2p6cGV0Z2NQL2F1eTkycnp0YUZLQVg1K2FzRDd0OTRxUjliZ01BdGZ3?=
 =?utf-8?B?S1RvbEFwRDhaRnZraVFSakkxVUhpaTBnZzJuTmRETS85cnRxNThVSEoxSFF0?=
 =?utf-8?B?U0ZtYTQrUzJ6eVNoMENXRXQzb3ZSSG0wR1p3eHp1Tml4STNoQlh6N3hVWUVy?=
 =?utf-8?B?K2JHWEY4ejBtWVNIZitWZXVjanlxSjMrRi9aSlJwYk15T0VCb1pjcDFPbEZT?=
 =?utf-8?B?UzBwakZiTFkwQndmZ2w2TVhtRnIyT0xTRWZlRk11WnJ0NzIwdEFkbFBJbElD?=
 =?utf-8?B?YnpvNXBvZWszdFM2b2YybHBkZDc0NmFKZ0xMWDFOOEk3TXRiRVV2eFVnYjNP?=
 =?utf-8?B?eXhGVXY1ckc5SDRLZFVTeUZVSmF3ME1UZnM0RzAzcFhielZJT0w1MDR5Tm90?=
 =?utf-8?B?ckRGRkJ1cW5BbFAyQTFXRWk0b3M5azl5WkZic2l5b3NDMHU5bThUZXhNMWs5?=
 =?utf-8?B?UDN5V3VwTXRCVkp0eDFwVjNuYVZzemtJQmFXYm93NFM1aThyYnhyN0N5MmJv?=
 =?utf-8?B?bnRkZ1B4cXlnOHpwbWxoWmxST2VudjhyaElqbVZ3NDRUZFVob2E0TUJ1RytR?=
 =?utf-8?B?aVZvTW5MTnhSVmNqQzlzcjN5c3BxUzVIVjVZTHpOcmxvNU9RUVY4dExvUjRI?=
 =?utf-8?B?WGxieS9FNmZ1YlVvSkd1akcvMUVQdU1rbnZBb016WFY4enJJbHFZY0MyRGE1?=
 =?utf-8?B?U3Y5OWZWcGFIbjRhTit0cnM0ZFpicE83K0RHZXpGN0NCV3lSSXZIMUpJb2U1?=
 =?utf-8?B?TTF4TDQ5OEhBSkNBUjlyZ2lUelgyam5TelBvYWhCaHRISCtRQ1hHTDFMS0Y4?=
 =?utf-8?B?Zm5rVlpOVFo5bkN6NEVPZUtpMEhJa1pWZHE4Q2NxZkJSWXpxTkFhYjl1dTNy?=
 =?utf-8?B?NFpJR095Y2RGR1BLSFlZRERwa0VoTDEvbWpuR25ZTTlMakZFOWZaWHJqQmRr?=
 =?utf-8?B?VWE5MldEM3p4b2tENjdRM01YM2UxUE1Qd1ZUWTU4Y3ZkbFg2anRxc2pwTnh4?=
 =?utf-8?B?YTY2bWM4MlFYV0ZYanJwRDJ6d2UzWGNYSER5U3JUcjFQMjBzbFk4cGp4c0JZ?=
 =?utf-8?B?ZUpyVnFQWUZCWWJWMGtNUlhaM3c1OEY4dWFZN0xRb1pBc3FPMENRa2NRS3NI?=
 =?utf-8?B?WWs3aGg4aE4xUVloekt3ZFlaUXpydktySWpWYTQvSm43YW9wVlYrMXc4ekU4?=
 =?utf-8?B?b2VFcHNnR2lLbnJ4VmZRR29CTmhOMGJQV2ZDQ0NVQkdIb0F2WHlOSjd1UU5X?=
 =?utf-8?B?ckVCTXBwVGlWYUxENTJqSEJZTTRvNm1ZUExSSkF0aXFva0E4dVh6UWdNSW5l?=
 =?utf-8?B?YUNnMnhabVB2akF4aWRDWXJ0WGtmMG8vMVN5UG5UdDZVUGJrWno1Q0dpQTNE?=
 =?utf-8?B?VnM5cmF4TldveE4vMGo5WUxzTFZEOUtKMElpRHFqcmZzaWk2bG1LMDFwMklF?=
 =?utf-8?B?Wnc1VzlreGZDdEJ5eHhhaVNvbG0vRmRQY0ZoRnBtWUpYQlhueWJPcmRvc2NG?=
 =?utf-8?B?R1h2SVJmaU80TFBjN1VmMVFxWTl4OUdHVFdGeDhqVEdNMUp4RVAzbDNUUDc4?=
 =?utf-8?B?eHlBbUJ6SnJHM2xOUWMrOFNPUTBKQkFyQkRFaW05eHR4bFViYjNjUU9YRmhn?=
 =?utf-8?B?Tm93dTJoc0d3Z3dFMTkxRXQwbHN3MERYQmZGK0RKV0puVFAxMFBicERmNkJF?=
 =?utf-8?B?ejZiTitDVWJqajJvUGZTR1ZCaUVwZlZ6T1UrSWxMU3JVVmNia3haQjVRMXJm?=
 =?utf-8?B?OEp3cjRkWXV4YzllUm5tZGI3V0FVU3ZZMjFCZURpUlEraUZpQVh2VWJ6VXVD?=
 =?utf-8?B?Y213L1NKMVFSR3JaUUJNNG01ckswa3p1Q1AvWjU0VUVjelQ4ZGR5eFVCaVhZ?=
 =?utf-8?B?OHZzaVh1bzBkb0RwTjhJOHJWbWt0SEkrbDN6WXYrYWhGQlN3Ykd4WkR3cEN5?=
 =?utf-8?B?bmsvWVZMOThtRXkzUVVzZnpBeGJ0d0dkTXQrRjhodmlTU082WUlrM21Gazl5?=
 =?utf-8?B?Vmx6QkpDUE04OFdEK0cvMlhKM2JVRjBsTnl1VVdTUll3VmJSNHFNWkd1MUNy?=
 =?utf-8?B?ZDY1WkJpdUhWdHV6ekNBZ2c2YUNIQ1VNM1NwaTFKY2dBOGFMWXFuYUFKcTNS?=
 =?utf-8?B?K2YyTjBGZ1ZCUmhFcGxwMjlnZnZvdCtUd21RejdpcnY3M0dOcFdzZzFmTll6?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7gBGDzFxslRWzCtiQmgq9PC/tI4Ck7JFtlbJ7ezE7saJS95/229n03t+OJtz2PpOjOWMJ2gef5mkTIGHGnAgIyLus3C2PZpu61T/knD5xVxqXfvI414WEnIRTzcuNm6jDe147H0ZgSo7Wun6omcaLj3FxfeKCKmh7gyWm1dNFOHsrqcadF1g+sQnPyBQltZKPgu26mA5CWyUla03uen07OVxIodRdwBgem9fCy6g1rxygCaFjGQ75CZjOiYCsW9Q+5jeQUUyo3IQaRsx7mjW5Y1yljI3TlZLhJ7n8eOzV7TC/31PkfvsdM/HoxS0H1PGKyKld3p0WzZu4LoIKsg/iPwVrrEK1mzd9Vkuop/1SSn4TOPzPUAzjTXuaInwfzMaJ5vlKX1IwoClcYYbf/iAVQgvFmUYOAm/OwdkSpLNXosOhHQK83O/WQUxp+SoWqs0OzjKSBI2BiEcfDRb4ZenTOtsKSsskiMOy5+QicWfZ9ApWq5Iv4xiYB50/jdZPIHOOE/m7i1TBf1faPcjWRV3w5nMmWB/Q9syzv9J2ygFT/s/kgA5IH4n+uVVYP0WEBGrP+QW4sCiN4mKG5o+BWTumsClwNwviWKSy9Pg8NWOvEvGKhr7mImMeXG3YEUUjG6hvC6jgFbj4nEs5ujPKuMQ8iwi+UXuW7IQWYPwss8T2fxqs+IqLjLaajIX1FPzmJeJpfd1ljnMzNdv8ktInAbr/ZNqtcAZbd09STcIwFTMkD5OdP28qeXSWm9XWNNuTIwaAfLAhx6rDX7HwrTknWipMxtUkLwwKuc67U3WyJmhriXnSeaGOXqutreiFSZhjSFn2mp6rkxV9cm1hqZcWgbXXxrV/kd/QFvtzTNBSsDZYdPl/Lvw3dr3yGl+l4tNIh9j5S3Om7gZBz6jHjuD1Kd28w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562bd50c-87f2-4dfa-b5e0-08db2639df6b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 16:17:01.3612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/Fef6hgCaFR+/UkYI5rlFB1tQ+LWw6MfTcGppDh8RNcKYRvC1csbut3AaNor3Z5KV5zoVyRwN1M3ZLm6SoGcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5231

On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
> Prior to this change, lifetime of pci_dev objects was protected by global
> pcidevs_lock(). Long-term plan is to remove this log, so we need some
                                                   ^ lock

I wouldn't say remove, as one way or another we need a lock to protect
concurrent accesses.

> other mechanism to ensure that those objects will not disappear under
> feet of code that access them. Reference counting is a good choice as
> it provides easy to comprehend way to control object lifetime.
> 
> This patch adds two new helper functions: pcidev_get() and
> pcidev_put(). pcidev_get() will increase reference counter, while
> pcidev_put() will decrease it, destroying object when counter reaches
> zero.
> 
> pcidev_get() should be used only when you already have a valid pointer
> to the object or you are holding lock that protects one of the
> lists (domain, pseg or ats) that store pci_dev structs.
> 
> pcidev_get() is rarely used directly, because there already are
> functions that will provide valid pointer to pci_dev struct:
> pci_get_pdev(), pci_get_real_pdev(). They will lock appropriate list,
> find needed object and increase its reference counter before returning
> to the caller.
> 
> Naturally, pci_put() should be called after finishing working with a
> received object. This is the reason why this patch have so many
> pcidev_put()s and so little pcidev_get()s: existing calls to
> pci_get_*() functions now will increase reference counter
> automatically, we just need to decrease it back when we finished.

After looking a bit into this, I would like to ask whether it's been
considered the need to increase the refcount for each use of a pdev.

For example I would consider the initial alloc_pdev() to take a
refcount, and then pci_remove_device() _must_ be the function that
removes the last refcount, so that it can return -EBUSY otherwise (see
my comment below).

I would also think that having the device assigned to a guest will take
another refcount, and then any usage from further callers (ie: like
vpci) will need some kind of protection from preventing the device
from being deassigned from a domain while vPCI handlers are running,
and the current refcount won't help with that.

That makes me wonder if for example callers of pci_get_pdev(d, sbdf)
do need to take an extra refcount, because such access is already
protected from the pdev going away by the fact that the device is
assigned to a guest.  But maybe it's too much work to separate users
of pci_get_pdev(d, ...); vs pci_get_pdev(NULL, ...);.

There's also a window when the refcount is dropped to 0, and the
destruction function is called, but at the same time a concurrent
thread could attempt to take a reference to the pdev still?

> 
> This patch removes "const" qualifier from some pdev pointers because
> pcidev_put() technically alters the contents of pci_dev structure.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> 
> ---
> 
> v3:
>  - Moved in from another patch series
>  - Fixed code formatting (tabs -> spaces)
>  - Removed erroneous pcidev_put in vga.c
>  - Added missing pcidev_put in couple of places
>  - removed mention of pci_get_pdev_by_domain()
> ---
>  xen/arch/x86/hvm/vmsi.c                  |   2 +-
>  xen/arch/x86/irq.c                       |   4 +
>  xen/arch/x86/msi.c                       |  44 +++++++-
>  xen/arch/x86/pci.c                       |   3 +
>  xen/arch/x86/physdev.c                   |  17 ++-
>  xen/common/sysctl.c                      |   7 +-
>  xen/drivers/passthrough/amd/iommu_init.c |  12 +-
>  xen/drivers/passthrough/amd/iommu_map.c  |   6 +-
>  xen/drivers/passthrough/pci.c            | 138 +++++++++++++++--------
>  xen/drivers/passthrough/vtd/quirks.c     |   2 +
>  xen/drivers/video/vga.c                  |   7 +-
>  xen/drivers/vpci/vpci.c                  |  16 ++-
>  xen/include/xen/pci.h                    |  18 +++
>  13 files changed, 215 insertions(+), 61 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 3cd4923060..8c3d673872 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -914,7 +914,7 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>  
>              spin_unlock(&msix->pdev->vpci->lock);
>              process_pending_softirqs();
> -            /* NB: we assume that pdev cannot go away for an alive domain. */
> +
>              if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
>                  return -EBUSY;
>              if ( pdev->vpci->msix != msix )
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 20150b1c7f..87464d82c8 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2175,6 +2175,7 @@ int map_domain_pirq(
>                  msi->entry_nr = ret;
>                  ret = -ENFILE;
>              }
> +            pcidev_put(pdev);
>              goto done;
>          }
>  
> @@ -2189,6 +2190,7 @@ int map_domain_pirq(
>              msi_desc->irq = -1;
>              msi_free_irq(msi_desc);
>              ret = -EBUSY;
> +            pcidev_put(pdev);
>              goto done;
>          }
>  
> @@ -2273,10 +2275,12 @@ int map_domain_pirq(
>              }
>              msi_desc->irq = -1;
>              msi_free_irq(msi_desc);
> +            pcidev_put(pdev);
>              goto done;
>          }
>  
>          set_domain_irq_pirq(d, irq, info);
> +        pcidev_put(pdev);
>          spin_unlock_irqrestore(&desc->lock, flags);
>      }
>      else
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index d0bf63df1d..91926fce50 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -572,6 +572,10 @@ int msi_free_irq(struct msi_desc *entry)
>                          virt_to_fix((unsigned long)entry->mask_base));
>  
>      list_del(&entry->list);
> +
> +    /* Corresponds to pcidev_get() in msi[x]_capability_init()  */
> +    pcidev_put(entry->dev);
> +
>      xfree(entry);
>      return 0;
>  }
> @@ -644,6 +648,7 @@ static int msi_capability_init(struct pci_dev *dev,
>              entry[i].msi.mpos = mpos;
>          entry[i].msi.nvec = 0;
>          entry[i].dev = dev;
> +        pcidev_get(dev);
>      }
>      entry->msi.nvec = nvec;
>      entry->irq = irq;
> @@ -703,22 +708,36 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
>               !num_vf || !offset || (num_vf > 1 && !stride) ||
>               bir >= PCI_SRIOV_NUM_BARS ||
>               !pdev->vf_rlen[bir] )
> +        {
> +            if ( pdev )
> +                pcidev_put(pdev);
>              return 0;
> +        }
>          base = pos + PCI_SRIOV_BAR;
>          vf -= PCI_BDF(bus, slot, func) + offset;
>          if ( vf < 0 )
> +        {
> +            pcidev_put(pdev);
>              return 0;
> +        }
>          if ( stride )
>          {
>              if ( vf % stride )
> +            {
> +                pcidev_put(pdev);
>                  return 0;
> +            }
>              vf /= stride;
>          }
>          if ( vf >= num_vf )
> +        {
> +            pcidev_put(pdev);
>              return 0;
> +        }
>          BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) != PCI_SRIOV_NUM_BARS);
>          disp = vf * pdev->vf_rlen[bir];
>          limit = PCI_SRIOV_NUM_BARS;
> +        pcidev_put(pdev);
>      }
>      else switch ( pci_conf_read8(PCI_SBDF(seg, bus, slot, func),
>                                   PCI_HEADER_TYPE) & 0x7f )
> @@ -925,6 +944,8 @@ static int msix_capability_init(struct pci_dev *dev,
>          entry->dev = dev;
>          entry->mask_base = base;
>  
> +        pcidev_get(dev);
> +
>          list_add_tail(&entry->list, &dev->msi_list);
>          *desc = entry;
>      }
> @@ -999,6 +1020,7 @@ static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
>  {
>      struct pci_dev *pdev;
>      struct msi_desc *old_desc;
> +    int ret;
>  
>      ASSERT(pcidevs_locked());
>      pdev = pci_get_pdev(NULL, msi->sbdf);
> @@ -1010,6 +1032,7 @@ static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
>      {
>          printk(XENLOG_ERR "irq %d already mapped to MSI on %pp\n",
>                 msi->irq, &pdev->sbdf);
> +        pcidev_put(pdev);
>          return -EEXIST;
>      }
>  
> @@ -1020,7 +1043,10 @@ static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
>          __pci_disable_msix(old_desc);
>      }
>  
> -    return msi_capability_init(pdev, msi->irq, desc, msi->entry_nr);
> +    ret = msi_capability_init(pdev, msi->irq, desc, msi->entry_nr);
> +    pcidev_put(pdev);
> +
> +    return ret;
>  }
>  
>  static void __pci_disable_msi(struct msi_desc *entry)
> @@ -1054,20 +1080,29 @@ static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
>  {
>      struct pci_dev *pdev;
>      struct msi_desc *old_desc;
> +    int ret;
>  
>      ASSERT(pcidevs_locked());
>      pdev = pci_get_pdev(NULL, msi->sbdf);
>      if ( !pdev || !pdev->msix )
> +    {
> +        if ( pdev )
> +            pcidev_put(pdev);
>          return -ENODEV;
> +    }
>  
>      if ( msi->entry_nr >= pdev->msix->nr_entries )
> +    {
> +        pcidev_put(pdev);
>          return -EINVAL;
> +    }
>  
>      old_desc = find_msi_entry(pdev, msi->irq, PCI_CAP_ID_MSIX);
>      if ( old_desc )
>      {
>          printk(XENLOG_ERR "irq %d already mapped to MSI-X on %pp\n",
>                 msi->irq, &pdev->sbdf);
> +        pcidev_put(pdev);
>          return -EEXIST;
>      }
>  
> @@ -1078,7 +1113,11 @@ static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
>          __pci_disable_msi(old_desc);
>      }
>  
> -    return msix_capability_init(pdev, msi, desc);
> +    ret = msix_capability_init(pdev, msi, desc);
> +
> +    pcidev_put(pdev);
> +
> +    return ret;
>  }
>  
>  static void _pci_cleanup_msix(struct arch_msix *msix)
> @@ -1159,6 +1198,7 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
>      }
>      else
>          rc = msix_capability_init(pdev, NULL, NULL);
> +    pcidev_put(pdev);
>      pcidevs_unlock();
>  
>      return rc;
> diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
> index 97b792e578..c1fcdf08d6 100644
> --- a/xen/arch/x86/pci.c
> +++ b/xen/arch/x86/pci.c
> @@ -92,7 +92,10 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
>  
>      pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bdf));
>      if ( pdev )
> +    {
>          rc = pci_msi_conf_write_intercept(pdev, reg, size, data);
> +        pcidev_put(pdev);
> +    }
>  
>      pcidevs_unlock();
>  
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index 2f1d955a96..96214a3d40 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -533,7 +533,14 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          pcidevs_lock();
>          pdev = pci_get_pdev(NULL,
>                              PCI_SBDF(0, restore_msi.bus, restore_msi.devfn));
> -        ret = pdev ? pci_restore_msi_state(pdev) : -ENODEV;
> +        if ( pdev )
> +        {
> +            ret = pci_restore_msi_state(pdev);
> +            pcidev_put(pdev);
> +        }
> +        else
> +            ret = -ENODEV;
> +
>          pcidevs_unlock();
>          break;
>      }
> @@ -548,7 +555,13 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  
>          pcidevs_lock();
>          pdev = pci_get_pdev(NULL, PCI_SBDF(dev.seg, dev.bus, dev.devfn));
> -        ret = pdev ? pci_restore_msi_state(pdev) : -ENODEV;
> +        if ( pdev )
> +        {
> +            ret =  pci_restore_msi_state(pdev);
> +            pcidev_put(pdev);
> +        }
> +        else
> +            ret = -ENODEV;
>          pcidevs_unlock();
>          break;
>      }
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 02505ab044..9af07fa92a 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -438,7 +438,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>          {
>              physdev_pci_device_t dev;
>              uint32_t node;
> -            const struct pci_dev *pdev;
> +            struct pci_dev *pdev;
>  
>              if ( copy_from_guest_offset(&dev, ti->devs, i, 1) )
>              {
> @@ -454,8 +454,11 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>                  node = XEN_INVALID_NODE_ID;
>              else
>                  node = pdev->node;
> -            pcidevs_unlock();
>  
> +            if ( pdev )
> +                pcidev_put(pdev);
> +
> +            pcidevs_unlock();
>              if ( copy_to_guest_offset(ti->nodes, i, &node, 1) )
>              {
>                  ret = -EFAULT;
> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> index 9773ccfcb4..f90b1c1e58 100644
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -646,6 +646,7 @@ static void cf_check parse_ppr_log_entry(struct amd_iommu *iommu, u32 entry[])
>  
>      if ( pdev )
>          guest_iommu_add_ppr_log(pdev->domain, entry);
> +    pcidev_put(pdev);
>  }
>  
>  static void iommu_check_ppr_log(struct amd_iommu *iommu)
> @@ -749,6 +750,11 @@ static bool_t __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
>      }
>  
>      pcidevs_lock();
> +    /*
> +     * XXX: it is unclear if this device can be removed. Right now
> +     * there is no code that clears msi.dev, so no one will decrease
> +     * refcount on it.
> +     */
>      iommu->msi.dev = pci_get_pdev(NULL, PCI_SBDF(iommu->seg, iommu->bdf));

I don't think we can remove an IOMMU from the system, so this is
fine as-is AFAICT.

>      pcidevs_unlock();
>      if ( !iommu->msi.dev )
> @@ -1274,7 +1280,7 @@ static int __init cf_check amd_iommu_setup_device_table(
>      {
>          if ( ivrs_mappings[bdf].valid )
>          {
> -            const struct pci_dev *pdev = NULL;
> +            struct pci_dev *pdev = NULL;
>  
>              /* add device table entry */
>              iommu_dte_add_device_entry(&dt[bdf], &ivrs_mappings[bdf]);
> @@ -1299,7 +1305,10 @@ static int __init cf_check amd_iommu_setup_device_table(
>                          pdev->msix ? pdev->msix->nr_entries
>                                     : pdev->msi_maxvec);
>                  if ( !ivrs_mappings[bdf].intremap_table )
> +                {
> +                    pcidev_put(pdev);
>                      return -ENOMEM;
> +                }
>  
>                  if ( pdev->phantom_stride )
>                  {
> @@ -1317,6 +1326,7 @@ static int __init cf_check amd_iommu_setup_device_table(
>                              ivrs_mappings[bdf].intremap_inuse;
>                      }
>                  }
> +                pcidev_put(pdev);
>              }
>  
>              amd_iommu_set_intremap_table(
> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
> index 993bac6f88..9d621e3d36 100644
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -724,14 +724,18 @@ int cf_check amd_iommu_get_reserved_device_memory(
>          if ( !iommu )
>          {
>              /* May need to trigger the workaround in find_iommu_for_device(). */
> -            const struct pci_dev *pdev;
> +            struct pci_dev *pdev;
>  
>              pcidevs_lock();
>              pdev = pci_get_pdev(NULL, sbdf);
>              pcidevs_unlock();
>  
>              if ( pdev )
> +            {
>                  iommu = find_iommu_for_device(seg, bdf);
> +                /* XXX: Should we hold pdev reference till end of the loop? */
> +                pcidev_put(pdev);

I don't think you need to hold a reference to the device until the end
of the loop, the data fetched there is from the ACPI tables.  If the
func() helper also needs a pdev instance is it's task to get one.

> +            }
>              if ( !iommu )
>                  continue;
>          }
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index b42acb8d7c..b32382aca0 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -328,6 +328,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      *((u8*) &pdev->bus) = bus;
>      *((u8*) &pdev->devfn) = devfn;
>      pdev->domain = NULL;
> +    refcnt_init(&pdev->refcnt);
>  
>      arch_pci_init_pdev(pdev);
>  
> @@ -422,33 +423,6 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      return pdev;
>  }
>  
> -static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
> -{
> -    /* update bus2bridge */
> -    switch ( pdev->type )
> -    {
> -        unsigned int sec_bus, sub_bus;
> -
> -        case DEV_TYPE_PCIe2PCI_BRIDGE:
> -        case DEV_TYPE_LEGACY_PCI_BRIDGE:
> -            sec_bus = pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
> -            sub_bus = pci_conf_read8(pdev->sbdf, PCI_SUBORDINATE_BUS);
> -
> -            spin_lock(&pseg->bus2bridge_lock);
> -            for ( ; sec_bus <= sub_bus; sec_bus++ )
> -                pseg->bus2bridge[sec_bus] = pseg->bus2bridge[pdev->bus];
> -            spin_unlock(&pseg->bus2bridge_lock);
> -            break;
> -
> -        default:
> -            break;
> -    }
> -
> -    list_del(&pdev->alldevs_list);
> -    pdev_msi_deinit(pdev);
> -    xfree(pdev);
> -}
> -
>  static void __init _pci_hide_device(struct pci_dev *pdev)
>  {
>      if ( pdev->domain )
> @@ -517,10 +491,14 @@ struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf)
>      {
>          if ( !(sbdf.devfn & stride) )
>              continue;
> +

Unrelated change?  There are some of those in the patch, should be
removed.

>          sbdf.devfn &= ~stride;
>          pdev = pci_get_pdev(NULL, sbdf);
>          if ( pdev && stride != pdev->phantom_stride )
> +        {
> +            pcidev_put(pdev);
>              pdev = NULL;
> +        }
>      }
>  
>      return pdev;
> @@ -548,13 +526,18 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
>          list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>              if ( pdev->sbdf.bdf == sbdf.bdf &&
>                   (!d || pdev->domain == d) )
> +            {
> +                pcidev_get(pdev);
>                  return pdev;
> +            }
>      }
>      else
>          list_for_each_entry ( pdev, &d->pdev_list, domain_list )
>              if ( pdev->sbdf.bdf == sbdf.bdf )
> +            {
> +                pcidev_get(pdev);
>                  return pdev;
> -
> +            }
>      return NULL;
>  }
>  
> @@ -663,7 +646,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>                              PCI_SBDF(seg, info->physfn.bus,
>                                       info->physfn.devfn));
>          if ( pdev )
> +        {
>              pf_is_extfn = pdev->info.is_extfn;
> +            pcidev_put(pdev);
> +        }
>          pcidevs_unlock();
>          if ( !pdev )
>              pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
> @@ -818,7 +804,9 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>              if ( pdev->domain )
>                  list_del(&pdev->domain_list);
>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
> -            free_pdev(pseg, pdev);
> +            list_del(&pdev->alldevs_list);
> +            pdev_msi_deinit(pdev);
> +            pcidev_put(pdev);

Hm, I think here we want to make sure that the device has been freed,
or else you would have to return -EBUSY to the calls to notify that
the device is still in use.

I think we need an extra pcidev_put_final() or similar that can be
used in pci_remove_device() to assert that the device has been
actually removed.

>              break;
>          }
>  
> @@ -848,7 +836,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>      {
>          ret = iommu_quarantine_dev_init(pci_to_dev(pdev));
>          if ( ret )
> -           return ret;
> +            goto out;
>  
>          target = dom_io;
>      }
> @@ -878,6 +866,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>      pdev->fault.count = 0;
>  
>   out:
> +    pcidev_put(pdev);
>      if ( ret )
>          printk(XENLOG_G_ERR "%pd: deassign (%pp) failed (%d)\n",
>                 d, &PCI_SBDF(seg, bus, devfn), ret);
> @@ -1011,7 +1000,10 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 devfn)
>              pdev->fault.count >>= 1;
>          pdev->fault.time = now;
>          if ( ++pdev->fault.count < PT_FAULT_THRESHOLD )
> +        {
> +            pcidev_put(pdev);
>              pdev = NULL;
> +        }
>      }
>      pcidevs_unlock();
>  
> @@ -1022,6 +1014,8 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 devfn)
>       * control it for us. */
>      cword = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cword & ~PCI_COMMAND_MASTER);
> +
> +    pcidev_put(pdev);
>  }
>  
>  /*
> @@ -1138,6 +1132,7 @@ static int __hwdom_init cf_check _setup_hwdom_pci_devices(
>                  printk(XENLOG_WARNING "Dom%d owning %pp?\n",
>                         pdev->domain->domain_id, &pdev->sbdf);
>  
> +            pcidev_put(pdev);
>              if ( iommu_verbose )
>              {
>                  pcidevs_unlock();
> @@ -1385,33 +1380,28 @@ static int iommu_remove_device(struct pci_dev *pdev)
>      return iommu_call(hd->platform_ops, remove_device, devfn, pci_to_dev(pdev));
>  }
>  
> -static int device_assigned(u16 seg, u8 bus, u8 devfn)
> +static int device_assigned(struct pci_dev *pdev)
>  {
> -    struct pci_dev *pdev;
>      int rc = 0;
>  
>      ASSERT(pcidevs_locked());
> -    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
> -
> -    if ( !pdev )
> -        rc = -ENODEV;
>      /*
>       * If the device exists and it is not owned by either the hardware
>       * domain or dom_io then it must be assigned to a guest, or be
>       * hidden (owned by dom_xen).
>       */
> -    else if ( pdev->domain != hardware_domain &&
> -              pdev->domain != dom_io )
> +    if ( pdev->domain != hardware_domain &&
> +         pdev->domain != dom_io )
>          rc = -EBUSY;
>  
>      return rc;
>  }
>  
>  /* Caller should hold the pcidevs_lock */

I would assume the caller has taken an extra reference to the pdev, so
holding the pcidevs_lock is no longer needed?

> -static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
> +static int assign_device(struct domain *d, struct pci_dev *pdev, u32 flag)
>  {
>      const struct domain_iommu *hd = dom_iommu(d);
> -    struct pci_dev *pdev;
> +    uint8_t devfn;
>      int rc = 0;
>  
>      if ( !is_iommu_enabled(d) )
> @@ -1422,10 +1412,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>  
>      /* device_assigned() should already have cleared the device for assignment */
>      ASSERT(pcidevs_locked());
> -    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
>      ASSERT(pdev && (pdev->domain == hardware_domain ||
>                      pdev->domain == dom_io));
>  
> +    devfn = pdev->devfn;
> +
>      /* Do not allow broken devices to be assigned to guests. */
>      rc = -EBADF;
>      if ( pdev->broken && d != hardware_domain && d != dom_io )
> @@ -1460,7 +1451,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>   done:
>      if ( rc )
>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
> -               d, &PCI_SBDF(seg, bus, devfn), rc);
> +               d, &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
>      /* The device is assigned to dom_io so mark it as quarantined */
>      else if ( d == dom_io )
>          pdev->quarantine = true;
> @@ -1595,6 +1586,9 @@ int iommu_do_pci_domctl(
>          ASSERT(d);
>          /* fall through */
>      case XEN_DOMCTL_test_assign_device:
> +    {
> +        struct pci_dev *pdev;
> +
>          /* Don't support self-assignment of devices. */
>          if ( d == current->domain )
>          {
> @@ -1622,26 +1616,36 @@ int iommu_do_pci_domctl(
>          seg = machine_sbdf >> 16;
>          bus = PCI_BUS(machine_sbdf);
>          devfn = PCI_DEVFN(machine_sbdf);
> -
>          pcidevs_lock();
> -        ret = device_assigned(seg, bus, devfn);
> +        pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
> +        if ( !pdev )
> +        {
> +            printk(XENLOG_G_INFO "%pp non-existent\n",
> +                   &PCI_SBDF(seg, bus, devfn));
> +            ret = -EINVAL;
> +            break;
> +        }
> +
> +        ret = device_assigned(pdev);
>          if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
>          {
>              if ( ret )
>              {
> -                printk(XENLOG_G_INFO "%pp already assigned, or non-existent\n",
> +                printk(XENLOG_G_INFO "%pp already assigned\n",
>                         &PCI_SBDF(seg, bus, devfn));
>                  ret = -EINVAL;
>              }
>          }
>          else if ( !ret )
> -            ret = assign_device(d, seg, bus, devfn, flags);
> +            ret = assign_device(d, pdev, flags);
> +
> +        pcidev_put(pdev);

I would think you need to keep the refcount here if ret == 0, so that
the device cannot be removed while assigned to a domain?

>          pcidevs_unlock();
>          if ( ret == -ERESTART )
>              ret = hypercall_create_continuation(__HYPERVISOR_domctl,
>                                                  "h", u_domctl);
>          break;
> -
> +    }
>      case XEN_DOMCTL_deassign_device:
>          /* Don't support self-deassignment of devices. */
>          if ( d == current->domain )
> @@ -1681,6 +1685,46 @@ int iommu_do_pci_domctl(
>      return ret;
>  }
>  
> +static void release_pdev(refcnt_t *refcnt)
> +{
> +    struct pci_dev *pdev = container_of(refcnt, struct pci_dev, refcnt);
> +    struct pci_seg *pseg = get_pseg(pdev->seg);
> +
> +    printk(XENLOG_DEBUG "PCI release device %pp\n", &pdev->sbdf);
> +
> +    /* update bus2bridge */
> +    switch ( pdev->type )
> +    {
> +        unsigned int sec_bus, sub_bus;
> +
> +        case DEV_TYPE_PCIe2PCI_BRIDGE:
> +        case DEV_TYPE_LEGACY_PCI_BRIDGE:
> +            sec_bus = pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
> +            sub_bus = pci_conf_read8(pdev->sbdf, PCI_SUBORDINATE_BUS);
> +
> +            spin_lock(&pseg->bus2bridge_lock);
> +            for ( ; sec_bus <= sub_bus; sec_bus++ )
> +                pseg->bus2bridge[sec_bus] = pseg->bus2bridge[pdev->bus];
> +            spin_unlock(&pseg->bus2bridge_lock);
> +            break;
> +
> +        default:
> +            break;
> +    }
> +
> +    xfree(pdev);
> +}
> +
> +void pcidev_get(struct pci_dev *pdev)
> +{
> +    refcnt_get(&pdev->refcnt);
> +}
> +
> +void pcidev_put(struct pci_dev *pdev)
> +{
> +    refcnt_put(&pdev->refcnt, release_pdev);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
> index fcc8f73e8b..d240da0416 100644
> --- a/xen/drivers/passthrough/vtd/quirks.c
> +++ b/xen/drivers/passthrough/vtd/quirks.c
> @@ -429,6 +429,8 @@ static int __must_check map_me_phantom_function(struct domain *domain,
>          rc = domain_context_unmap_one(domain, drhd->iommu, 0,
>                                        PCI_DEVFN(dev, 7));
>  
> +    pcidev_put(pdev);
> +
>      return rc;
>  }
>  
> diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
> index 0a03508bee..1049d4da6d 100644
> --- a/xen/drivers/video/vga.c
> +++ b/xen/drivers/video/vga.c
> @@ -114,7 +114,7 @@ void __init video_endboot(void)
>          for ( bus = 0; bus < 256; ++bus )
>              for ( devfn = 0; devfn < 256; ++devfn )
>              {
> -                const struct pci_dev *pdev;
> +                struct pci_dev *pdev;
>                  u8 b = bus, df = devfn, sb;
>  
>                  pcidevs_lock();
> @@ -126,7 +126,11 @@ void __init video_endboot(void)
>                                       PCI_CLASS_DEVICE) != 0x0300 ||
>                       !(pci_conf_read16(PCI_SBDF(0, bus, devfn), PCI_COMMAND) &
>                         (PCI_COMMAND_IO | PCI_COMMAND_MEMORY)) )
> +                {
> +                    if ( pdev )
> +                        pcidev_put(pdev);
>                      continue;
> +                }
>  
>                  while ( b )
>                  {
> @@ -157,6 +161,7 @@ void __init video_endboot(void)
>                             bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
>                      pci_hide_device(0, bus, devfn);
>                  }
> +                pcidev_put(pdev);
>              }
>      }
>  
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 6d48d496bb..5232f9605b 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -317,8 +317,8 @@ static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
>  
>  uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>  {
> -    const struct domain *d = current->domain;
> -    const struct pci_dev *pdev;
> +    struct domain *d = current->domain;

Why do you need to drop the const on domain here?

> +    struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
>      uint32_t data = ~(uint32_t)0;
> @@ -332,7 +332,11 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>      /* Find the PCI dev matching the address. */
>      pdev = pci_get_pdev(d, sbdf);
>      if ( !pdev || !pdev->vpci )
> +    {
> +        if ( pdev )
> +            pcidev_put(pdev);
>          return vpci_read_hw(sbdf, reg, size);
> +    }
>  
>      spin_lock(&pdev->vpci->lock);
>  
> @@ -378,6 +382,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>          ASSERT(data_offset < size);
>      }
>      spin_unlock(&pdev->vpci->lock);
> +    pcidev_put(pdev);
>  
>      if ( data_offset < size )
>      {
> @@ -420,8 +425,8 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>  void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>                  uint32_t data)
>  {
> -    const struct domain *d = current->domain;
> -    const struct pci_dev *pdev;
> +    struct domain *d = current->domain;
> +    struct pci_dev *pdev;

Same here regarding dropping the const of d.

Thanks, Roger.

