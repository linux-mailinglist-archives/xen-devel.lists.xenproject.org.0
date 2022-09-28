Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842525ED9D5
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 12:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413222.656746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odTzW-0007aD-A0; Wed, 28 Sep 2022 10:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413222.656746; Wed, 28 Sep 2022 10:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odTzW-0007XN-5o; Wed, 28 Sep 2022 10:08:34 +0000
Received: by outflank-mailman (input) for mailman id 413222;
 Wed, 28 Sep 2022 10:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG3S=Z7=citrix.com=prvs=2639d358c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1odTzV-0007XH-56
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 10:08:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f12e800-3f15-11ed-9374-c1cf23e5d27e;
 Wed, 28 Sep 2022 12:08:30 +0200 (CEST)
Received: from mail-bn8nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2022 06:08:25 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6680.namprd03.prod.outlook.com (2603:10b6:510:b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Wed, 28 Sep
 2022 10:08:23 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 10:08:23 +0000
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
X-Inumbo-ID: 7f12e800-3f15-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664359710;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YCiVrptvJN7Cv2+8DJANRLciWDWo97azXMqwt9oR1ew=;
  b=Z2i/xuFA+ZVFTOeBmzX947eosrc4mAut2G3vqYQfeWC6bjlKHanK199T
   zeXuZlSNjdtdKWguHZqvqLHL37fSS7TVXNLERoQkqzVuUykApF1luMdFt
   J3DcS3y72nJbdgBhsFUE8BwMYw5GTS+21WOVAHAwPbqlzzch2eHDK8TCl
   U=;
X-IronPort-RemoteIP: 104.47.74.40
X-IronPort-MID: 81502650
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ahcgSKrqNsbxjjBhE2jGiPR9J6heBmK0ZBIvgKrLsJaIsI4StFCzt
 garIBnSOquIYGWnc4gjOdzj9BwD6pXXyt8wHgs9rS0zHiNA8JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+55wehBtC5gZkPaER7AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 OcbNTIvMBW6mc226YuQSM5yuJoZI5y+VG8fkikIITDxK98DGcyGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MkEotiNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+WwHuhBt9KfFG+3sBjv0yW2E8UMyEPWAuEr6GdtEKgavsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBqW1qPe7gKdB24FZj1MctorsIkxXzNC/
 l2Um9LkAxR/vbvTTmiSnp+eoCmuIyETISkHbDUdUAoey9D5pcc4iRenZuhkFKm5n9jkAwbay
 jqBrDU9r7gLhMtN3KK+lXjYhxq8q56PSRQ6ji3VQ2Tj6Ap6bYykYoWA6F7H4PIGJ4GcJnGCs
 WYFnY6C7ekIJZCLiCGJBu4KGdmB9/uDdTHRn1NrN50g7Ci2vW6ue5hK5zNzL1svNdwLEQIFe
 2fWsAJVoZVVbH2jaPcrZ5rrU5hyi6/9Cd7iS/bYKMJUZYR8fxOG+ycoYlOM22fqkw4nlqRX1
 YqnTPtAxE0yUcxPpAdajc9HuVP37kjSHV/ueK0=
IronPort-HdrOrdr: A9a23:fy2Tiqm35Eeul/yhflUCWPAVNF7pDfOwimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtND4b7LfCRHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaFp2IhD0JbjpzfHcGJjWvUvECZe
 ChD4d81kydkTN9VLXKOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mMryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idirP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1PDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amFazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCQ2B9vSyLVU5nlhBgv/DT1NU5DXituA3Jy8PB96gIm00yQlCAjtY8idnRpzuNOd3AL3Z
 WHDk1SrsA+ciYnV9MDOA4/e7rINoXse2O5DIvAGyWRKIg3f1TwlrXQ3JIZoMmXRb1g9upApH
 2GaiISiVIP
X-IronPort-AV: E=Sophos;i="5.93,351,1654574400"; 
   d="scan'208";a="81502650"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVyc6YZwEH2n+QxqjI9Dg49MTiOG+XmCYqXXAwDKWCeT8Uxxj65qxfsdy+zziEjkB/ttvryLna78J96X2WsMwinkMDCWVOi1cBwa70YDOS9uh//nJKAg6sjppeOvJlfWoDLLHU3W7BiVGQutDxzVRnAhklgFwvWizjV+rWhqcjqlaSOKtlbpsC5F0Qv/jt+cAmm33m9CcWwAQSdpJNAV1ezW9J87pnjazAeK5SJectPp2bd3HpgLi2pGpEEs/AZK90yK9q3L2DlfbL0oHCFcHrDQrJ77oZZQ7n6rGjx06KJxg3m6/LjQ4bWAgQdFaU5t+aBFqOHsPAzTuPAGOobjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ePhxvt2zlcSYriCgVKyNQZELQ9eTrq7ZD5C+Vj2xrQ=;
 b=AD/al+wpka6LWjT17fTjqrZ8rbLqLDm0D7CxyqtA10ksSwVXbxHAA1T7fOHbW2m42Xxi8LoNazmSTz4OjnmC00vdSvOqTGpO8K7zwHukuE9T3dPywLFBzE40BwXBjsQvnIDPDPebZ/Zk/AXuJDoR6KFsCFkwF4wjqbQEeYBDfGpz8paVb4M3jncDvwkJkFALUEb2FYR0RNY4oarr3QzA8LkdeTntl5xfp19HbCoGnpc0ldxSSQlstr/nS6T+zetU0JgcAv5Db0MQsfWH5gHcU+ffijKTZBThnWKpzGSx0XcrEpUyv64ho1xNauS9wOlMLaF+ynl2PR1KgRbgIynK/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ePhxvt2zlcSYriCgVKyNQZELQ9eTrq7ZD5C+Vj2xrQ=;
 b=W3iCbXicAxJWiK6KfsYBAcRUUaO+bEafKS+mFhcRu8Iw9WtS0DF0lEe58zNg4/2g0DChmOYvRfcznc5hD8GTfMIibkznRrojo8qd9PYtxLd2dqDmA5Sq0puj6G45vHmrCf0zadI2CviB7mzBwu6c8JvarhkeHi7XbCk16Jm1hrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Sep 2022 12:08:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/ept: limit calls to memory_type_changed()
Message-ID: <YzQdEQbXhV2XDEKG@MacBook-Air-de-Roger.local>
References: <20220927153937.39389-1-roger.pau@citrix.com>
 <ff79be48-8146-0b33-bdb9-ad9f33083559@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ff79be48-8146-0b33-bdb9-ad9f33083559@suse.com>
X-ClientProxiedBy: LO4P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: 53129023-6781-4ca4-c4e2-08daa139606f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pz6zypkpg/4M0xaPboK+HBYOjXIOBLDfsiNv8S8YxzD5nDrtqgXa/D+pUI7c6dVWSEdzlc029NrDEt5LBUFLAW8CO6K+DOjOiBH2/FILU1QGze+pj3K9jNbi8bjwuChbiAnUOQalMgA6HLSbzbUNP0evXzhU0N9KhXqwTjfr/uzu5Dh09oa3BierLEUJ+Nj2kOlRDJKOB8iTWMSHgi6WMcdM/uUWB9DK1CZc7WfhbRE+5aICdifjCmrl3Bicr3YYwDt+Kq5XAs5P2nVZ1wUY8YnUBHU8jBGWR5fRaZRbFUevTiCYCYv3ADga6D9cZkQhsUt3DjiGIOhSAC1FoTKtCTHaGqsk4Jk04eV4dnpKIPsPBuq0jHygEDqLT2M56kQt1b93KALIkOrS9vDx7JbDN549WEXJDc6FPvYuzViLMWGLZJJYa8Y9iyDRSHGaYyDlp2mKnzvPPWQB4o5pQDmZkUKpCjfsKI3zVy+rf2aKQex/WgG4R1kdJPT5cSpKXGbjIwZyLxVUCcmgRYUNpmzFeErHGGtNsnGE1z5UW05XL7mAvSvrYEKKdY40RR7J3l1TRQoi52yrt7RYcDhscypyndIyfh+0JGsyGnMHlDZTeylgCPC3J7yEnwGb9lLjiGKonvJynifZ4jAIFyYjMrg2aW8dtA4BLDljeFUy9C+6pqdERdlRlQpuSFYCWJ9zLmKz4YAosrShy5gzsmSz6ydBAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199015)(6486002)(85182001)(83380400001)(82960400001)(86362001)(38100700002)(186003)(478600001)(6666004)(8676002)(6506007)(26005)(9686003)(54906003)(53546011)(6916009)(316002)(6512007)(8936002)(66476007)(5660300002)(66946007)(66556008)(2906002)(41300700001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clhWbzhNMlE4OUkxK1Y5TEx3UW8veW5qNFFUVXV0Tzl3NjFGWUcvcHplYXQ1?=
 =?utf-8?B?b0VyMGZPQlRHb1lTV3ZXZENxbXFzOVkvUDdrWHVvNE93akp1R0pWdGhtVWs4?=
 =?utf-8?B?SVBtbjdhSTR3b0hvS0NSTW1NYVNSNzc0OG5aMktHcDlCbnFWTDhqeHBFWElG?=
 =?utf-8?B?b3lTU1hJb1RTM2hhRHlGOEpQbWg0NzlKNDI2YWUwelBJeC9kd0djN1BVaWJV?=
 =?utf-8?B?eGNDcEpWSk5BMFB5cTR0em5vRVp5MHJpZDFrWmdxWDBDYkxiRlJmY2lEQWtS?=
 =?utf-8?B?Y21GQUNrZXVZbDFlWHlFL2lPWkcvUXhxNWxta0xCWlk2YTk5TGpjMzVzWGRk?=
 =?utf-8?B?U1VtSHQyNTV0dTFpdWZ0Q3VmS0p0U0I0RVl6cmh6M2JqKzViNXl3ZGpaTHhz?=
 =?utf-8?B?Tnoydi9MWEhIQ25jUytxUnQvRHp3M1BxcDhSSHgzZUxHcmhNNFN2U3h6aVMr?=
 =?utf-8?B?eFJORER0OU02RS9xMkppSVM5MEEzcG9lOHp5VlRzUU9sZzlicUpiWDIvbUxX?=
 =?utf-8?B?MVNNUG9qcFJzU0oyNTNtZjhPaG1pT2FKZmlJaDcrazNsaUlOODZYNnlwMTBL?=
 =?utf-8?B?Z0FhbTFHUXM3SjdnZmtpVHFtZEFDUkNkQTFkeVJ5Y25ZTjE1b2RqQjJjZnV5?=
 =?utf-8?B?TW11VjVCR0lZaW1XS25BczBFWWlWYmNqNll5K1I5ZkhJeWFteklzWHRuRVBs?=
 =?utf-8?B?bGd2L2o4TldoWmw1eG12WVhPQzZUc2tFMDZtRTNRcTdzTkd4MW90MU0xdzhS?=
 =?utf-8?B?QTRhcnp6UENxUUNJK1ZjaVYyTWpNQVg0bGNSMWRJMVVsQ2lHUHN2R1d6SXNi?=
 =?utf-8?B?cEJzUERJdlhLenJ5eEUrR29vbmQ5cDh2ZU8yU3RLMGZLNU5QekltdE10dmpl?=
 =?utf-8?B?THVEQzUvbWk3YTQ2ZEZNdWovQ0Y1enIxbWJRUXdrQ0F2UXBhRmpYYnRmemdR?=
 =?utf-8?B?N0l2RjZ5MWs1a2MzMUhpaVlEMFBBSytSbWJnWGorcDVFVDFnaS8xQ0d6Q0E3?=
 =?utf-8?B?amhGZmJsUFdpMEhxa1NjK0JabUVFOFFzQ2YvMkw3YmlETHVjVllIbUZ3VmE1?=
 =?utf-8?B?aFpjRVRic3huTlpJUmQrOUEzdVJFU1prN1g2QUlpYXZSRUJrRGpPRTN6Z1lC?=
 =?utf-8?B?Q3JUNk5hMmhPNEdJM0p2UzdFUyt3bUptVnYxNDJ0cldhcVY3eWtMS3Y0QTB3?=
 =?utf-8?B?UnVoaHJnUEdKY1MzMzRiWVVyRUlUYy9QOCtkTkJwK0huY2VrQzd5L1RrbE9R?=
 =?utf-8?B?NmdoY0gyZ2tGWlV1bmJCSURXN0h0YXo5OWZlOWYwSG1Sa0krdjZ5T0YyRjk5?=
 =?utf-8?B?QWwwb05mb1JjWlcyaWtrUUhrWHhGenpmM09tYzBtVGJYa2ZNalE2a0dPS0Fm?=
 =?utf-8?B?cW5iOXF1UExSY3ZmbDB4bXB3RjFscm5obU81cFVnRlBsYmlaZGppNFhBMExl?=
 =?utf-8?B?T0FxckYralFQOEpMQndFZkxhY2xyRjZieTRhYnkyNkxmSWJXQVdoTnFMV25O?=
 =?utf-8?B?K3haekZkNGIzd002WGpvSlR5KzZrRC9ETXd5anI0Skk3aWJKNjY5VVZJVzNp?=
 =?utf-8?B?dlBuMDU5emc3NjNvZ0J4dnUrKzVicFB3dXNTWDBEM1h3cENNTGJmSDF4V2RU?=
 =?utf-8?B?TjgxditER0ZHdDVkWE1DekRjYUhSTUtWSzdCUWRWZFRvYS9QbE5iaUpZQ1hH?=
 =?utf-8?B?SkQ2WFZOdTc2dCs4N2JJMUNzRUNrN2JCbjJrOFcyTVZoZ3NXd25MT2w4L3Nh?=
 =?utf-8?B?bkd2MlZuYXJ2MktTcWZKOEd4ekJFZGFkdzRBTHUxY3UzMUZ6STBqc28vWWNR?=
 =?utf-8?B?eitRVWNzL2lnbFgrZXFXMXhyeXg3bHlLWC9QMzRwSDRmQ2h4Y0prTzZXVnB2?=
 =?utf-8?B?MmxTTko0cXlLQTFsUWFmRUFkWEFSTys0aUpEVDF5cERFdzlXV2UyU2NZTU94?=
 =?utf-8?B?SlpGMFVZcDd4cDQwTUVsdHRBanlWVTh4NVFxaU9qMnBwWURqZkN5aGkyeHE0?=
 =?utf-8?B?alhjVTJWL1l4VnFaY2xsVEFPK05TVElrcU5pR2hoaHozdXJKWnJOSnhWNFdO?=
 =?utf-8?B?QUxReHhjUklVUmFRUUt1Vk51Z0RRRThKblBvQi9VODU2UUdnYkh2MmdKcUFC?=
 =?utf-8?B?WE1WM1ByUzZnckFpR01OOXNML21PYzVjSEtkaVFiRmhMaytxY1ZNNzRPMDRU?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53129023-6781-4ca4-c4e2-08daa139606f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 10:08:23.2460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPXpbEymZXYNQiWZvN9c6ZYu0DfOUtKEdrhbRtG4QCbPh0ob1FhtesNAg59MUVL0anjWmFBMmFXVTP1jels/lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6680

On Wed, Sep 28, 2022 at 10:01:26AM +0200, Jan Beulich wrote:
> On 27.09.2022 17:39, Roger Pau Monne wrote:
> > memory_type_changed() is currently only implemented for Intel EPT, and
> > results in the invalidation of EMT attributes on all the entries in
> > the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
> > when the guest tries to access any gfns for the first time, which
> > results in the recalculation of the EMT for the accessed page.  The
> > vmexit and the recalculations are expensive, and as such should be
> > avoided when possible.
> > 
> > Remove the call to memory_type_changed() from
> > XEN_DOMCTL_memory_mapping: there are no modifications of the
> > iomem_caps ranges anymore that could alter the return of
> > cache_flush_permitted() from that domctl.
> > 
> > Encapsulate calls to memory_type_changed() resulting from changes to
> > the domain iomem_caps or ioport_caps ranges in the helpers themselves
> > (io{ports,mem}_{permit,deny}_access()), and add a note in
> > epte_get_entry_emt() to remind that changes to the logic there likely
> > need to be propagaed to the IO capabilities helpers.
> > 
> > Note changes to the IO ports or memory ranges are not very common
> > during guest runtime, but Citrix Hypervisor has an use case for them
> > related to device passthrough.
> > 
> > Some Arm callers (implementations of the iomem_deny_access function
> > pointer field in gic_hw_operations struct) pass a const domain pointer
> > to iomem_deny_access(), which is questionable.  It works because
> > the rangeset is allocated separately from the domain struct, but
> > conceptually seems wrong to me, as passing a const pointer would imply
> > no changes to the domain data, and denying iomem accesses does change
> > the domain data.  Fix this by removing the const attribute from the
> > affected functions and call chain.
> 
> Personally I think this adjustment would better be a separate, prereq
> change.

Right - I was about to split it but didn't want to go through the
hassle if the approach didn't end up being well received.

Do you think placing the calls to memory_type_changed() inside the
{permit,deny}_,access is acceptable?

> > --- a/xen/include/xen/iocap.h
> > +++ b/xen/include/xen/iocap.h
> > @@ -7,13 +7,43 @@
> >  #ifndef __XEN_IOCAP_H__
> >  #define __XEN_IOCAP_H__
> >  
> > +#include <xen/sched.h>
> >  #include <xen/rangeset.h>
> >  #include <asm/iocap.h>
> > +#include <asm/p2m.h>
> 
> That's heavy dependencies you're adding. I wonder if the functions
> wouldn't better become out-of-line ones (but see also below).
> 
> > +static inline int iomem_permit_access(struct domain *d, unsigned long s,
> > +                                      unsigned long e)
> > +{
> > +    bool flush = cache_flush_permitted(d);
> > +    int ret = rangeset_add_range(d->iomem_caps, s, e);
> > +
> > +    if ( !ret && !is_iommu_enabled(d) && !flush )
> > +        /*
> > +         * Only flush if the range(s) are empty before this addition and
> > +         * IOMMU is not enabled for the domain, otherwise it makes no
> > +         * difference for effective cache attribute calculation purposes.
> > +         */
> > +        memory_type_changed(d);
> > +
> > +    return ret;
> > +}
> > +static inline int iomem_deny_access(struct domain *d, unsigned long s,
> > +                                    unsigned long e)
> > +{
> > +    int ret = rangeset_remove_range(d->iomem_caps, s, e);
> > +
> > +    if ( !ret && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
> > +        /*
> > +         * Only flush if the range(s) are empty after this removal and
> > +         * IOMMU is not enabled for the domain, otherwise it makes no
> > +         * difference for effective cache attribute calculation purposes.
> > +         */
> > +        memory_type_changed(d);
> > +
> > +    return ret;
> > +}
> 
> I'm surprised Arm's memory_type_changed() is an empty out-of-line function.
> This means the compiler can't eliminate this code (except when using LTO).
> But then cache_flush_permitted() (resolving to rangeset_is_empty()) can't
> be eliminated either, even if memory_type_changed() was. While gcc doc
> doesn't explicitly say that it may help (the talk about repeated invocations
> only), I wonder whether we shouldn't mark rangeset_is_empty() pure. In a
> reduced example that does help (once memory_type_changed() is also an
> inline function) with gcc12 - no call to rangeset_is_empty() remains.

Can look into it, do you want it to be a prereq of this patch?

Thanks, Roger.

