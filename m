Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF4C79E361
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 11:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601095.937001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgM08-0000RY-60; Wed, 13 Sep 2023 09:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601095.937001; Wed, 13 Sep 2023 09:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgM08-0000PD-2K; Wed, 13 Sep 2023 09:17:36 +0000
Received: by outflank-mailman (input) for mailman id 601095;
 Wed, 13 Sep 2023 09:17:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rq8V=E5=citrix.com=prvs=6130a4f39=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qgM07-0000P7-67
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 09:17:35 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a48728c-5216-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 11:17:31 +0200 (CEST)
Received: from mail-dm3nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Sep 2023 05:17:09 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BL1PR03MB6087.namprd03.prod.outlook.com (2603:10b6:208:318::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 09:17:05 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783%6]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 09:17:05 +0000
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
X-Inumbo-ID: 5a48728c-5216-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694596653;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7Ld5/5GnGdHpJDWQEK9+zRfTByz1N/W9Wc5EvHLKZZg=;
  b=clIXHu8ZraAU4vpAwsQFYGodIRRZH2gAa2XENEkVcoLCwepQ9hx/fSH/
   vgvb5BJ0oD+Vnl4skFIA3CdYSSn+i1NcHrKkXzjWHSyjYQPRSoIWFJ+cZ
   3PqFbqMJn/w5jrS8Qv2gdT4+SZ6JI68K115cqudMYaCDryqoPRVm3l8+x
   c=;
X-CSE-ConnectionGUID: 4xjA7uBHQ8KZkfZI1A9bAg==
X-CSE-MsgGUID: owZraYzJR5SgzRDPdZPY4A==
X-IronPort-RemoteIP: 104.47.56.44
X-IronPort-MID: 121147907
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:e0i+xK98od7nDQmP7VdCDrUDp3+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mROX2iFMvmOY2r0Ko9+YYmz/RhS6seAm4BjHVM9pS88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks11BjOkGlA5AdmNKkQ5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkS5
 f4xdy0nTinTpNC1zoCaE8A9jO0seZyD0IM34hmMzBn/JNN+G9XvZv6P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilAtuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WWxH+kCdpNfFG+3vl1skea934xMkAtWkmBjcG1uHaPB/sKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluP1TM9KGYDYWoISFAD6ty7+oUr1EqTEpBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNOORENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:hZ7zq6812FfMdU4/Icduk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: =?us-ascii?q?9a23=3A9uujrGjp6f6CWz2Cvkc+D2xrXjJuLm3f5SjNCW+?=
 =?us-ascii?q?BWUVbS7OnaAa5qalNnJ87?=
X-Talos-MUID: 9a23:E0AKOQooK0p6PWVISQwezzZ9Bt1h0raMMh02noc8l/GIBxRBZx7I2Q==
X-IronPort-AV: E=Sophos;i="6.02,142,1688443200"; 
   d="scan'208";a="121147907"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvRQB+nZ0Ly3jPF5F2eS+/CyfYvVeURJCB52MPeHaQ6Mpt6NfVFNrBKttUZJcLj+ecvDpm/lLE1EO8znstQimodPF5+5dotZwJWU1Te0t2IAbkHUl2x/XXIs8AFRx3y1FMjXI0hD/cu4NBpBxeokJIwJWrtm3Mg1tW3v2yV6RvsBrCA5m8BTHlDXdwY5rlbH4lH09dGlcEAztbH1V2Ot1nyDdVbwbVSczqqN4yxc2xOnwBxSgwkh8bf6diRg+/BHCi8nx8GZ8MjfM07j7YpnMyvgjWhve+VhJCfI8+VhCiirdbIS+cztfgO3oXAvp0x34xWQOhJM1PhrTtCoX57wZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+4dj7WbiFp1ZrHRLEU8/l0JflKZAxi0+5xhEhqH5Dc=;
 b=YmOJWK0UuUW9veuzAtsBqhzNcUoZRLrHNV2RCrfzE0V3GI1aTMSU0mhX4IeeUXgP2/IxFGQ+mIe9CEreOSB/cG4flWTi4fvkvVhk0KODzZyOHD85mCcsq/IRXNImrvo42xeJKSjK2pHstI3jzbTeB0KLluupKCgseumCQOLihsDrtdDLZEp04PkjwXR9gVUCSOkvyxK51jBXRwmX5EWr7erb+mxxzDhiviq/fr4Hq9p0XYPPOAFNI6mtnbKWXnEBFtqNFU/U9YaT29XCBIQbyARhkJEu2yI45BJjy5zEgMoVGPaCQQkgvF1UxP5INaqmGSW9niJ2OZZvCoQp+KtBaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+4dj7WbiFp1ZrHRLEU8/l0JflKZAxi0+5xhEhqH5Dc=;
 b=Vr0kaRGbQCAtz4tB3VXwNFyAKc91SyTifNEIXLuffqRMrBugYocVc+caLZOriS1QTgCMz4bE7LwVBzZB84R2IkGhFU0qC5fuL7mwD/DkXBGGeCbPA6+6y29CA4WHSBfZTMEKvV9dDGQcIWE+iXCm/ernvP8ZoTgDaxW57lCrM64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 Sep 2023 11:16:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Message-ID: <ZQF-C_H-z05PNKHT@MacBook-MacBook-Pro-de-Roger.local>
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <809ef122-7060-c033-e50d-6e372ab89de9@suse.com>
 <ZQFwyG3FwCzpezTR@MacBook-MacBook-Pro-de-Roger.local>
 <99bae9ae-1711-28ca-c464-e638f0edd7a6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99bae9ae-1711-28ca-c464-e638f0edd7a6@suse.com>
X-ClientProxiedBy: LO4P123CA0321.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BL1PR03MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9f0658-dda8-47dc-bbf0-08dbb43a3245
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PgvBbD0D0LfDXZfGLmD8ImvXGz3ywk1GebF4TltleOINyUZm8NY2yPVKpdP5/KqTnNy+1SbD248ZfWbNrX8cpBL0HRKGfNwArfupGqJP14aDIHCsS7JxlZqJfu79XC7ppMlUlcbUSRGYmENVOLpfnGhni1eZ+0YDzCY6aF8FgS0yPgWY+0jYRN1Gh7BJFvShy8+avGOJi64pg1sh1BjGsV4gaeeJXlkVr2erLKPzcRxlFohGDvm1b54VHLs0hV5lcWpHdheu4KXTw7jGXwu9IBZbdaU3usNvTV1K68WpXW3DA2o9C/1/erGxVYdFv2xHstIaE+3RgqKI6qbA1f/Cjq11YuAJyhcF3XX6F6sqEkdHz4jrorGPL1r8T7r/0TqewxBr+yNKwWUD5x09Af1p/K6RxMJ1YnKpseyvw2Ct1jrxKBMKdEZ8VH7A5I3Pvij2HP4vmFd0oppRIwZiRr2Nw9KP7PuP2SZ/mkbKsSpG5zMbtE8okwcUFUAvnFljFv2umsZUFJTl8O27oM7nCl6yM9FPN56hrtts1iX79RVDUhQl4nXfS5LM2f8RbO0/7jmR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(53546011)(6666004)(6486002)(6506007)(9686003)(6512007)(478600001)(83380400001)(26005)(2906002)(66476007)(54906003)(66556008)(66946007)(316002)(5660300002)(4326008)(6916009)(8676002)(8936002)(41300700001)(85182001)(86362001)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXhqMDdFVno5MTAycmVlSnNSTldyRmVKSVYzUnFXVUZUZUhkQzN5TEYzbW9r?=
 =?utf-8?B?TFFtaUFNbnRPVW1tZFJQUUhJaTREa1lTVXdTL0pLYU5CRzlsTXE3WmF4a1Zk?=
 =?utf-8?B?a2tvTFpkM2o1M1lCWFB3N05VR3hoMzFlZHlUNnphWTJvL3NGaTBKM3lMTUZw?=
 =?utf-8?B?SDhwMFdlN1h6MUVCNkdtazZqY1pYT3RaR3F6cTlscmNvVCtRdWV2K3c0S2x4?=
 =?utf-8?B?TWNmNVQydXZXN0YrMmFqeVpWRUkvbVFiVWhUWElXUTc4N3FzSHNKc0VlNHZC?=
 =?utf-8?B?TVlTaWs3L0ZNSUN4UUdaUEsyS1g4ZmtwRUE5V2MwVXAwbSs0U2N1cDNvOHZB?=
 =?utf-8?B?bzlvclhNTHRoZlhOMzUzQUJmd0xRME9VRFphaTFRZy8vMEZ0L2tPcDM5ZmVL?=
 =?utf-8?B?eXYrZERyREQ1WWJGWEpZRGxYZ0J6R0FXVDBqNkU1ZTZabkxyMUI4Vkx4Y0dY?=
 =?utf-8?B?QXdkckFhR1lMZ0hQQkR5dTlWT2V6bDNCbmxkMU0wKzJOSzM4bE5Tb2dlOURQ?=
 =?utf-8?B?d2FNSEJPYkhoY3JybEtUMW1tTjNYaVF0L09rSDBGZFU3b0UydUhycTZ4cVVQ?=
 =?utf-8?B?dmhDMU1xRzZ0VStYZUlZVXNwZFdyRHllRzA4NDJnRSs0ZzUzci9tTkxUVEdP?=
 =?utf-8?B?N0plTXJQdUI0clU5ZlZ3QmNHMkc3SldpNjBpeXRrWG5NZ0JxbUZzbkdsS2VC?=
 =?utf-8?B?T1NNTlROdmJwQVBJTDVZQzB6b0xPcVZGOHhwVEU0NTVHTVRVY2NoYXR0akE5?=
 =?utf-8?B?U2UwUTg1RVZqdkk2bzdyTHRqT2VlSFlXdkUycG1HcnhhU2JhNXJDSWRoSHgw?=
 =?utf-8?B?SDhxUDNPV04vWVlrSHNkTU1sMnpYRksrbVlmTW1uQ3hZNjFhYjVsL2VkcnZ4?=
 =?utf-8?B?RFBRSG1kdldTbUhPdjQrNklyQVhiU1NneXIwRW5Bb2pjZDZqSEU0Zjh2bU9t?=
 =?utf-8?B?YTFCZFAyOTRRZGxjZGNHZGVUSStGQVNTUDlpMFh5MnlnaWlsUThMa1E5Tzhi?=
 =?utf-8?B?eWt3QnI0dXNnaUpiWGxxL3Q5RTA1eFVkSU1pd3o3a05Yb3hXZCtzc2N4MmJy?=
 =?utf-8?B?bWo0bzdhaVVqUHcrUUM0TFc3K3lYMUh0Sm5ncnRybGtDL2hCMjg0ZXBCZEtH?=
 =?utf-8?B?c2hnY0RybGJsYzY2Uk1ielhBQTRvVURna0MreHhlUnlHUnBUNDgzWGJBaXBK?=
 =?utf-8?B?a2c2eG5Eemtra0tOR2NoWDNhMjh5ekdCSjdrY05vV0lsQTZHemUwR2lQUFg3?=
 =?utf-8?B?Qkp6Vm93aGlOSlBnRUgzL2NIZm84dnV2VXhPMTJNZFJrK0EvYWxrVzNnNGp4?=
 =?utf-8?B?TlJ2bTFGRnZ0alBMdEF5TjhVbEVmelRTZ09nMkxtdm5oSkJObDByd0NYTnZM?=
 =?utf-8?B?N0ljdU0ra25STk9XcnhxejZ4bXZ5ZWxBWENNS2FJZDBEdkl1Wnk4N25hZW13?=
 =?utf-8?B?SGlHMHNVTXA2bHBZNG5rdDFYY1QycHc5QSt6c1hja09yajJCYUhlMXpGVkV0?=
 =?utf-8?B?Z3duRmsrR1htbFI0Z0Q3LzJ2NDE2KzIyenB1WGVQSDdseWNiR1JOQmI4TWNy?=
 =?utf-8?B?bHN4T0pGZDVzWnI0SmZpMzZ1RUlwU2tnVVE5K2tUREFzWFJVNjkwZ3hydnho?=
 =?utf-8?B?WDZZL1U1Nm1jUEFCcW00dlpIQnZ1S1J2RWRYYmhnZTdoMXo1OU1SSEZ4SlFi?=
 =?utf-8?B?UWlzZzNLUjllQmtsWWhQazJ6aFJxTmNSeHJnSGltTHBSQTlRYndFUXVGcUk3?=
 =?utf-8?B?MnRqYVJ6YVpuQUx2N1hGSkRBeC9WMS9ValplZENLSzZIL0N2Z1lxUml3bmZO?=
 =?utf-8?B?WUppZnFJOGFQU3NQUmpiWlZYQ1R0dW1YSkRDVnBrWHNaekNRbjJhdXc2Wjcv?=
 =?utf-8?B?SlpZQ3M1YzkwN2ZYUThQTUtUY3lxMkNLT2wzaS94OWhwWUtvOWwwMDM4NXBq?=
 =?utf-8?B?bUJ1NlF4N0JLc3FheHJrZG9JQll6NDZFSGFFRHlKOFBjMzI2WGZ5Wk51d1Jy?=
 =?utf-8?B?ay9MWDQrZDl4c0owVFFoS1lZTERDTnFpVEFOZEcvNmczd0JHMlpVNmVjdTRt?=
 =?utf-8?B?OWd2LzVVMHptUUhEbE5XcTlhY1h3bHU2N1VOQXVBUlpjOVRyZm96MFZ3aDhK?=
 =?utf-8?B?MTljNWZOM2tRbnFRckQvR1I3djByZ0lhKzNiWU5UVHdjcHE4VGJPSW9sa0ky?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jX5DT0lEAPNf43JuKoNOFSKfemWoTLO5XS6Ja3BddS7aab00nNedc4IhUo+wUzELLaw/UVCFu8iIkjagEyYZJEoeqhqAM8NssYsS3bV+LLBdP0IHz2QU7g1N4e2bxxSDXFRQjpINGFoFF+467+6oFIBYti8C//4DLhv9h2sYFqCYzfCI/1kTo0/PoIB67V4ZKHn4P6scKkt/zuBXkE5qF0kGSibrYSAKFXbVQ98cOUT3hvn+4Exl6c++vxyPHLCFvgQb30+e/fOJ6LJturUEO64yVtHMdY+wUwAxDlZw6HHLOs7xqrgdHbuvo+TjHI8a5mNtUVjwTBh4Cv3X/dXRw8iWikGv1Cn8co5HQ4XvDjBhyLfWpOKFP99DONuh8tJMcPpTemtZKznq7CP7/aQe3uehflkr0GWwmspiRA1rEk+yBWprcGJj5nnzfhjeYFg3ZagjqPSDFuIYjBuYQd4qFpiWZ1aYF70Vx/4uip4SWft52W9YVr6BqVtOAjr5hfgTtS4TTv+RHpKCQ5TJdO5n7lQ7iuIgXMF1wBj9D9VG6K+R2oMYpkq8TeZ1SzAPiCPS5k7Mu/KZM6ZIcUOgVap7BH0I1tpo1ZucbFUmpxwDHXplElDVAmxU03VY9ABxyzg+Xkzu5QCGqPfa/90Z4JGnMuH9FfhUghljOSW3GapA2o1RGQf3+dB/B8QsgqjhppLlDAQD9uSBoHdBmZS0h4bmSIIjcNCx7WenEaAnXJ4R1IqKiRqPjHHSnSY4mAlxb86LYXftC31luMpzVim+wpCMcBuTrfxYljpOL99U8/3kUlEd4B2womy53PRv/Qnbvc7Z
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9f0658-dda8-47dc-bbf0-08dbb43a3245
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 09:17:05.0537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWu6fcVLNEIA0LGdrWVF3pFjBhbZl/9loLM1qCUKVICetA0mQjcUWPVGLClRIwStczPv4LhzHxkUKw84pu4PTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6087

On Wed, Sep 13, 2023 at 10:35:17AM +0200, Jan Beulich wrote:
> On 13.09.2023 10:20, Roger Pau Monné wrote:
> > On Wed, Sep 13, 2023 at 08:14:46AM +0200, Jan Beulich wrote:
> >> On 12.09.2023 18:23, Roger Pau Monne wrote:
> >>> OpenBSD will attempt to unconditionally access PSTATE0 if HWCR.TscFreqSel is
> >>> set, and will also attempt to unconditionally access HWCR if the TSC is
> >>> reported as Invariant.
> >>>
> >>> The reasoning for exposing HWCR.TscFreqSel was to avoid Linux from printing a
> >>> (bogus) warning message, but doing so at the cost of OpenBSD not booting is not
> >>> a suitable solution.
> >>
> >> Why is the warning bogus? The PPR doesn't even state what the bit being
> >> clear means; it's a r/o one. On respective families it cannot possibly
> >> be correct to expose it clear.
> > 
> > There are other bits in the same MSR that only state the meaning of
> > one value and are not r/o, so my take is that being clear means "The
> > TSC doesn't increment at the P0 frequency".
> > 
> > Since it's model specific, it should be possible for some models to
> > have the bit clear.
> 
> The code that's in there right now already has a family >= 0x10 check.
> The Fam10 BKDG says (among other things) "BIOS should program this bit
> to 1." That, imo, doesn't leave much room for the bit being clear once
> an OS (or hypervisor) gains control from firmware.
> 
> >>> In order to fix expose an empty HWCR.
> >>>
> >>> Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> Not sure whether we want to expose something when is_cpufreq_controller() is
> >>> true, seeing as there's a special wrmsr handler for the same MSR in that case.
> >>> Likely should be done for PV only, but also likely quite bogus.
> >>
> >> Well, keying to is_cpufreq_controller() is indeed questionable, but is
> >> there any reason to not minimally expose the bit correctly when a
> >> domain cannot migrate?
> > 
> > We would then also need to expose PSTATE0 at least to make OpenBSD
> > happy (and any otehr guest that makes the connection between
> > TscFreqSel and getting the P0 frequency from PSTATE0.
> 
> If any such OSes can be used as Dom0, yes.

OpenBSD can't be used as dom0, but QubesOS does use the nomigrate flag
for domUs.

> And as said before, I view
> exposing PSTATE0 (with zero value) as a viable alternative to your
> partial revert anyway. What varies across families is how many PSTATEn
> there are, but at least starting from Fam10 PSTATE0 looks to always be
> there, with the top bit indicating validity of the other defined bits.

I did consider this, but it seemed to just dig us deeper into exposing
non-architectural MSRs, which in the long run is more likely to be
troublesome if newer models change the meaning of bits in PSTATEn.

Thanks, Roger.

