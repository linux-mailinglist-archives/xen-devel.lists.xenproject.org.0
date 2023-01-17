Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDDA670B8A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 23:21:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479873.743977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHuKO-0002tM-2f; Tue, 17 Jan 2023 22:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479873.743977; Tue, 17 Jan 2023 22:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHuKN-0002rQ-Uo; Tue, 17 Jan 2023 22:21:11 +0000
Received: by outflank-mailman (input) for mailman id 479873;
 Tue, 17 Jan 2023 22:21:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHuKM-0002rK-Fw
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 22:21:10 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38c23303-96b5-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 23:21:02 +0100 (CET)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jan 2023 17:20:51 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5826.namprd03.prod.outlook.com (2603:10b6:303:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 22:20:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 22:20:48 +0000
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
X-Inumbo-ID: 38c23303-96b5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673994062;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=t4EILZT52ZKSfqjd+zyNYWSgc1N/Ke0NH5zkAWZgzo0=;
  b=Z141X290tKs+uli37ZavHyqJAZHrKQjejkVrQdRT6X710zp/wdSAVP1R
   pP11UpXViOlyM0zxC2zPusgPgpqdqc9g0mpDTsotvh16E9jofi3mRzY4p
   ckJulyEvHDIKNOweFWYg7zaARQe482NZfUQmVTed506V27k1fRmvKo8JS
   E=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 92524489
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9/VhV6+UBL3CPxrD4rkkDrUDSn+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WAfCDzVMv3bajOjKox3O9++8BhX6MfQxoMwHQdsqis8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKkU5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkllq
 NMqCmEGRCmBmqWL56zkcdZHtsA8eZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUui9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCdhPTuHkpq8CbFu7mn0UGD0pb16BoqO3qmKedcACF
 Ew6w397xUQ13AnxJjXnZDW6vXqFsxg0S9dWVeog52mlyKDZ/gKYDWgsVSNaZZots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsVhAZ6tPupIUyiBPnTdt5FqOxyNrvFlnY3
 DSivCU4wbIJgqY2O76T+FnGh3emoMjPRwtsvAHPBDv6tUV+eZKvYJGu5R7D9/FcIY2FT16H+
 n8Zh8yZ6+NIBpaI/MCQfNgw8HiSz67tGFXhbZRHRvHNKxzFF6afQL1t
IronPort-HdrOrdr: A9a23:R/VzV62jYzO2bIahbCQ5UwqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="92524489"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCvanKGFTPEVIHcQw+DVEPSyhsi6rUVxricNj7iwTwVoUtqfShL1qERZodR3PbQOrjSrQhTgLvhIgz0oZ+PiF1Py+0Oa+qLcUujlG/e6npMSbtk4EQjfa7BPX/oRoi7WzmbARWEh8nY1LtljzZLeUJwEZzBl9H0vRUWmbzYsyj9GNuT0QXDENh0g0VWwHtAeAzqmy7qb4K03MI0Ibt5lVTUqIfmj7vdGgxKRmEyr6Hn5Z7wxnP5l4+VqfO2cYYzZoeQbxEQBrL7MHELxatt63veHciQA/Ju6J9MEvo4d+rg9Tqy+x8zJD/+ODtEJbY/OOHExdLJ5XNWiCQxxr8un/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4EILZT52ZKSfqjd+zyNYWSgc1N/Ke0NH5zkAWZgzo0=;
 b=NIOLTeDKIejYBhGhnTCY4TlC+k/XlnztYtUL7QfMTt9kgpB197p8qArwQZnfkF6HFSHs+Tpk/rssn/GLweWUEPZ+2TwxylpWn1O39e3bzR22TVFgYjtKieUhP7vzwRShNuYiVp8j02g2Rexh1uvO0uNSyEY3S9Yff8vTlroFSPfj7v57lrUmPPbbK3ErjYAomiCa2uvD2FvttavnYVcRtR5vHTnITXwn16W5cXrISPk7LPDNteNOu7kLJjQFgqPS2eUrd70zFx/V7kh9B/Icrktl90NTwNnoyRekCnky+4Muk++JCdNwuqDPJAfYZF43xk96yGypFnlpEFG66IjYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4EILZT52ZKSfqjd+zyNYWSgc1N/Ke0NH5zkAWZgzo0=;
 b=o7e8qPp4CctPtEfKzO+rGuGQpHnzA2w6JTIJuq91KB+oN1lcPn8U9cd/ZC02kgooLgfiJiZ9oA5VhSpqFth8Gaz3BB4pJ20SaMBj+kb9aiezoGM387Xx5p4r5CkYT6o6l68RJFzuO837TZy1icgurlr0pEHkCSYMH5Mw0T7WnFs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Thread-Topic: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Thread-Index: AQHY4457jyaOcvAnhkOdTNwMDM8hXq5O0KiAgFTsIQA=
Date: Tue, 17 Jan 2023 22:20:48 +0000
Message-ID: <bd6befdf-65eb-6937-fb85-449a5fa16794@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
 <f1229a27-f92c-a0dc-928e-1d78b928fdd0@xen.org>
In-Reply-To: <f1229a27-f92c-a0dc-928e-1d78b928fdd0@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO1PR03MB5826:EE_
x-ms-office365-filtering-correlation-id: 875819a8-a849-47d5-5ade-08daf8d91614
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bDIET0ZARl9SywFtOJIxFXShzurX48/v5NFBL8uOhWY8oV/riEV28TklpVw7+Y8lEZUCwkg7osplH6QJ9IlX2rWEfmU3IXp4o180nLJIOdzaULm9zUJn5YbCTV14ETm801D+7s305BeUVPI5KppoNAkxuN0drIy1LgYezhbDKQcBmPkWuIyy/ZyxYDzpj3sSxBc+Dn80413fWL3yog1nDi52PWRW9YhPTLvzrbK5iAdUZQ/gfH58m6AAATFzbeuQG6rCXLWSOpASWcRuwlzHQPd2ZLpz+Q1z8E/IcAl6DbJw2EzgOnYs1pjzTmbbHB912i0FS0OGqlU199MYBO+Tx4TpPQIxQR45yYnqcBKIyJ/zdIKTV7JWPDRl1W13YiF9O8sYiCFDx3UdSApuLSiTgcrWUU4e4MpFa4zfG6MLkpBX4w3odhy7cOqpWe+XydX7pBuSUhSSKvVI1es81xwki20Zj8Pj6dFmg9KSE6JxAmfoCaZ4PObiF6jR8iZV0vSYV/tgmullOUYj2+HgIQhxQRT7sVXnKuA1fTB/d8gojXDedncLTS4kNeleRT+2J6P9WapPCUQeHfNEeZQRHob+malih3EwjEhbcUc7b2XoCfidjcCSMs0aJu2nzWtR4QCfya2vgNEfur6p+pAc3q1zp+K+obAquiLah856kEwT3yLFt6htm201XV+gV4ooV3IPgnsAk1VEnr8ntPe8SoaysUfWHzWrkbUjzydyyfnQKdrUgwIiXwISth5GjlXs5DvfVU3Ib4JzciRbIcL7uLn6+Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199015)(31686004)(6486002)(478600001)(6512007)(26005)(6506007)(186003)(107886003)(71200400001)(91956017)(2616005)(76116006)(122000001)(110136005)(316002)(4326008)(64756008)(66446008)(8676002)(54906003)(83380400001)(36756003)(41300700001)(8936002)(2906002)(66476007)(66556008)(66946007)(38100700002)(86362001)(38070700005)(5660300002)(53546011)(31696002)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WG92UEZJdzQwL1JiNkRxK2hlUzBSekxMc3B0Y3Jwdm1HSEp5ZzkyUUxWYk42?=
 =?utf-8?B?UXNaQ0JQcjJwaTc1T1M3Zzhpa092MnFTcGJNRElYNkVFNklEYk80ZVhqUytQ?=
 =?utf-8?B?eld3ODR1VU16WXNic0YrQUZmUy9jSDNUcE9FclZJVlFhbktyUzgrQ3BiK0NP?=
 =?utf-8?B?aFJrMXJCa2xtcGszSXdHemVaUmFHdGQxK1Bzd2p6SWZLMVQ5eUt6SXRkcHBW?=
 =?utf-8?B?R0svTUNpaXpSUXdrS3dkVnRJUHVTalV1RU5XQTMwMWpQU202dDRnWWduMW9S?=
 =?utf-8?B?NVZkWG5tUlorY3BVNlJzcE1OZGRyZ3NwQlVVdUdQaC9RcGhyU0dLMnZrb0ZS?=
 =?utf-8?B?K085OUoxcVQxV3h2OVAwQWttZ1IxQVJsTWRVOTJJcUtXcUZNK1FPV2ZXL0Vu?=
 =?utf-8?B?UWIra3BmNmFFTFVDS0lVakY1TnZuOGVReElZTUxXK2Y4c3VFMFZhbVY4MGt3?=
 =?utf-8?B?RDlXQVMxRDluaEczWHJSMWZqcHVVYTJ6OTR1T0lNbDdwTCtUeGJFd2p2RzIy?=
 =?utf-8?B?cTVCWU5vWVlDREpscHc5S0xqTHJYeWZ2Tk9NWlE2T3NWRVN0VzBYMUtLVE1v?=
 =?utf-8?B?MCtoSldYNlBUMDJaQTNscTJYelRLUk9ua1RmTzZPRCtSQnNHZVc4cUJDQXJ1?=
 =?utf-8?B?MUxKMWVRcHIrcTlpZjZleTBSSUNlVVBzM2syYVV5SWROK29BTGJEVWFqNVox?=
 =?utf-8?B?d3pJOHB2cW82K2diVXEyUzlLeVVFa0FoUHVGczgwc1NYMFU0Rlg1d2FNRzNM?=
 =?utf-8?B?cmM2RjRPazFMMXNMVXdPODJYQkpNVmJHTERHc1RFYnQvVWRRZzdsbUJ6NjEz?=
 =?utf-8?B?b0h5ZjRCSjhJckVmQTN2eUVnVFltcEhzMTlvdmJpVFhvYU96SS9STzZMUXBl?=
 =?utf-8?B?R0krcm9VamI5Y2MvOVljRFVvY2Z3VEFpTEpIRTZVdmkvKzBiUURwMVZPaHdF?=
 =?utf-8?B?dmRIN0dxSk8ya2loV3U0eXh0SlBhckluUnVFZGVQSUF3MXJZOHR6V1ZZVmNB?=
 =?utf-8?B?dzFWeFJFY1MxL2Q0dEVtVzYrd0ZQaVNTRmFTWGZETTk4eS81aWhMZlFFUlpO?=
 =?utf-8?B?RjFsdUNsczZGSWMvb0liaGd1ZDgxbUl5YktTSjR6SGdvSTU1bE5EMDNLcG0y?=
 =?utf-8?B?Mks2cWYzZ3dQUnhSVVJnT3NiSFBYSlF0R2V5Yk1uNUNyWmpSSGdGQURhSThV?=
 =?utf-8?B?Z2lNQk85SDErNDhsRzBaWTVNME95OFpvN1dLY25qTzBHdkNhOUxtZGxTRWtm?=
 =?utf-8?B?YXUzYXhnREd0RzFLdWZiVStNbWZ6eVNhOGd4QUhQNnRiZFJpUGVld0lQalBl?=
 =?utf-8?B?dkJPbUlSd3p6b3I3OVFjWWE1T21xU1FUVjl1NEhoMERaTTFOc3cyRTBTN1BL?=
 =?utf-8?B?dWFTYUJHYlRxK1ZQSWtBVEZNb1o1d3N2OHpBMUZRcmVualhBcXhlTllHZUcv?=
 =?utf-8?B?Yk00RE5YbytUZXUvNDJBWm8wL3FlREMrYmJsRUJjbEJrZGZ2bXJiMmJRNWtQ?=
 =?utf-8?B?TlZnOXdCY1VSc1BtY3Z5WUtlWWtoYWMwbVowOEx0WTZVZGVXUUg0RDV3clFJ?=
 =?utf-8?B?dDZCUUJvWFU1eFFnbHV1Q1J3ZUFQNVQ1RHk2WE1QUEJwMVJpMzJ1L0kvSkpj?=
 =?utf-8?B?QW4wWnp0YXJ5L0x1TlRIZ0dqZmFCR0c2b0ZiclA3bHdEbWUvTmxmNGgxYmtp?=
 =?utf-8?B?amxXMllaMXd2TDFPUC8zTElxUE9zSFpDWi9DNGlSQlJRZlIzUEJiMjU5SGtx?=
 =?utf-8?B?SGhBOEJsS3E5eHAycDR1UUc5WjcxeWJ0VlgvbEVwSm5TZ0E5UDYzMVFWdmJ4?=
 =?utf-8?B?Lzc1ZE1qY240ZnJpVU55S0dJUGVOQWlIei9mNzh4RlhwMjh6dHYybkRkVkFG?=
 =?utf-8?B?Q0hFSUNYSUI4Mk5wbHNwODhHU3Z0WllKU0UyK1BTMzEzU2U4T2ZJZ1czb0hn?=
 =?utf-8?B?aEE3WHVYWjBuZzJGWEk3WVp3TWZjT1FBRzBvbWxUY1hMcHZUYjc0c08xTTJu?=
 =?utf-8?B?TmZiS2pwZGZjNjlUb0RZTldrQ0c1MFVaZEJtSGdwdDNQbUczamFHbXB3WDZx?=
 =?utf-8?B?RG5TWXNJWnN0L1lIaXBIZmd3ajlBdi81Wkc2KzlYVS9saHJQWEZTUzVlUUVw?=
 =?utf-8?Q?7FdWws15o2EFFiVdBpOkkxFiQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <73DC3300E788E245912762F40C90815E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ActAsjrPw3AArgw2E/YuXRoUvF/65UqEFU1A12XOBnzhVtMFZVLvlJwhb2jPoOjAzNxNkbBBZHPTfWFeOJcZyAb9yyWe+ENzflJsjvwKpDUwCnjZJ+SJIb+fj1rOg7kkIjj+GteLHBaVYyA9+oAUlPKinDkUJD2DKTPwF3zkokjMYwAISpxI8ExEOKfWHzNIW1SoJ3300qpYCvKblpbasWLETTZsle67xU7SQlcby7+3EBvR6RtqQh+F5Bot2qImSmgHM0Xylb+eCTPMWKtpZZYXdFKs8Y2zwmokJMVtrOKESVIKDbJvtPqmDMS3fvHISni1cQ6kPx9rwKsUAZ1WS6eqOuhIlAS4Nlyk3Z9TVedYpMw6mg5eLqfCJ8ew4paIJUj3UsjQ2f5JmZ+Rr/OUNWM7HEHz7xFX6lsSq3mYORH6RlmpT8ozUZIjIKrK8IbPf6ZOCtpZxFgyu2jzVzrkrzzBSolh9IPx05++WcEOGfwW12h8NV0flJEHVwb0Qz23PpQedwxofttBaADDTRbjgROkq5Grv3C+ZPHupmnK2nrklISKJXaJd3e2F1PZm335xaJrmaqUj4Qd1EifCB/V7TxtthTSWj4FDwP7He/3LyoDBzOmAw/AIIOmyK5HimuMhLK4x1Oo4iCov20GxCBXfx8GpdFxE/vPr8Blprzx971mufQofzv5B0Geu4++Xg1icbXfh/nvSp1OT9dsvhlFtHcZzqcT9gNrej81dYjVVNoAteojk1fjIkEP2eAnf8f1/SQ0xBAeUn3/3fHb25RWqRaG585ZLfRGewvHaIAA7AtFfpXcGrsatx6BcrbVeMksQKeyZ3NVdhk3fcRr8G7je01aUtHQi8uP4HY86AJoGQY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 875819a8-a849-47d5-5ade-08daf8d91614
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 22:20:48.7745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zqDT+URntbPd8ZSPhgRdS/ZgbIhVotU88DcEtymiRgCZ32bO9vWWOlojsF4MNjCjQ7q2PbZHcFJ/Tcwrv82Yy+oMqick0IclRZpPw6WmZKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5826

T24gMjQvMTEvMjAyMiA5OjI5IHBtLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpIEphbiwNCj4N
Cj4gSSBhbSBzdGlsbCBkaWdlc3RpbmcgdGhpcyBzZXJpZXMgYW5kIHJlcGx5aW5nIHdpdGggc29t
ZSBpbml0aWFsIGNvbW1lbnRzLg0KPg0KPiBPbiAxOS8xMC8yMDIyIDA5OjQzLCBKYW4gQmV1bGlj
aCB3cm90ZToNCj4+IFRoZSByZWdpc3RyYXRpb24gYnkgdmlydHVhbC9saW5lYXIgYWRkcmVzcyBo
YXMgZG93bnNpZGVzOiBBdCBsZWFzdCBvbg0KPj4geDg2IHRoZSBhY2Nlc3MgaXMgZXhwZW5zaXZl
IGZvciBIVk0vUFZIIGRvbWFpbnMuIEZ1cnRoZXJtb3JlIGZvciA2NC1iaXQNCj4+IFBWIGRvbWFp
bnMgdGhlIGFyZWFzIGFyZSBpbmFjY2Vzc2libGUgKGFuZCBoZW5jZSBjYW5ub3QgYmUgdXBkYXRl
ZCBieQ0KPj4gWGVuKSB3aGVuIGluIGd1ZXN0LXVzZXIgbW9kZS4NCj4+DQo+PiBJbiBwcmVwYXJh
dGlvbiBvZiB0aGUgaW50cm9kdWN0aW9uIG9mIG5ldyB2Q1BVIG9wZXJhdGlvbnMgYWxsb3dpbmcg
dG8NCj4+IHJlZ2lzdGVyIHRoZSByZXNwZWN0aXZlIGFyZWFzIChvbmUgb2YgdGhlIHR3byBpcyB4
ODYtc3BlY2lmaWMpIGJ5DQo+PiBndWVzdC1waHlzaWNhbCBhZGRyZXNzLCBmbGVzaCBvdXQgdGhl
IG1hcC91bm1hcCBmdW5jdGlvbnMuDQo+Pg0KPj4gTm90ZXdvcnRoeSBkaWZmZXJlbmNlcyBmcm9t
IG1hcF92Y3B1X2luZm8oKToNCj4+IC0gYXJlYXMgY2FuIGJlIHJlZ2lzdGVyZWQgbW9yZSB0aGFu
IG9uY2UgKGFuZCBkZS1yZWdpc3RlcmVkKSwNCj4+IC0gcmVtb3RlIHZDUFUtcyBhcmUgcGF1c2Vk
IHJhdGhlciB0aGFuIGNoZWNrZWQgZm9yIGJlaW5nIGRvd24gKHdoaWNoIGluDQo+PiDCoMKgIHBy
aW5jaXBsZSBjYW4gY2hhbmdlIHJpZ2h0IGFmdGVyIHRoZSBjaGVjayksDQo+PiAtIHRoZSBkb21h
aW4gbG9jayBpcyB0YWtlbiBmb3IgYSBtdWNoIHNtYWxsZXIgcmVnaW9uLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gUkZD
OiBCeSB1c2luZyBnbG9iYWwgZG9tYWluIHBhZ2UgbWFwcGluZ3MgdGhlIGRlbWFuZCBvbiB0aGUg
dW5kZXJseWluZw0KPj4gwqDCoMKgwqDCoCBWQSByYW5nZSBtYXkgaW5jcmVhc2Ugc2lnbmlmaWNh
bnRseS4gSSBkaWQgY29uc2lkZXIgdG8gdXNlIHBlci0NCj4+IMKgwqDCoMKgwqAgZG9tYWluIG1h
cHBpbmdzIGluc3RlYWQsIGJ1dCB0aGV5IGV4aXN0IGZvciB4ODYgb25seS4gT2YgY291cnNlIHdl
DQo+PiDCoMKgwqDCoMKgIGNvdWxkIGhhdmUgYXJjaF97LHVufW1hcF9ndWVzdF9hcmVhKCkgYWxp
YXNpbmcgZ2xvYmFsIGRvbWFpbiBwYWdlDQo+PiDCoMKgwqDCoMKgIG1hcHBpbmcgZnVuY3Rpb25z
IG9uIEFybSBhbmQgdXNpbmcgcGVyLWRvbWFpbiBtYXBwaW5ncyBvbiB4ODYuIFlldA0KPj4gwqDC
oMKgwqDCoCB0aGVuIGFnYWluIG1hcF92Y3B1X2luZm8oKSBkb2Vzbid0IGRvIHNvIGVpdGhlciAo
YWxiZWl0IHRoYXQncw0KPj4gwqDCoMKgwqDCoCBsaWtlbHkgdG8gYmUgY29udmVydGVkIHN1YnNl
cXVlbnRseSB0byB1c2UgbWFwX3ZjcHVfYXJlYSgpDQo+PiBhbnl3YXkpLg0KPj4NCj4+IFJGQzog
SW4gbWFwX2d1ZXN0X2FyZWEoKSBJJ20gbm90IGNoZWNraW5nIHRoZSBQMk0gdHlwZSwgaW5zdGVh
ZCAtIGp1c3QNCj4+IMKgwqDCoMKgwqAgbGlrZSBtYXBfdmNwdV9pbmZvKCkgLSBzb2xlbHkgcmVs
eWluZyBvbiB0aGUgdHlwZSByZWYgYWNxdWlzaXRpb24uDQo+PiDCoMKgwqDCoMKgIENoZWNraW5n
IGZvciBwMm1fcmFtX3J3IGFsb25lIHdvdWxkIGJlIHdyb25nLCBhcyBhdCBsZWFzdA0KPj4gwqDC
oMKgwqDCoCBwMm1fcmFtX2xvZ2RpcnR5IG91Z2h0IHRvIGFsc28gYmUgb2theSB0byB1c2UgaGVy
ZSAoYW5kIGluIHNpbWlsYXINCj4+IMKgwqDCoMKgwqAgY2FzZXMsIGUuZy4gaW4gQXJnbydzIGZp
bmRfcmluZ19tZm4oKSkuIHAybV9pc19wYWdlYWJsZSgpIGNvdWxkIGJlDQo+PiDCoMKgwqDCoMKg
IHVzZWQgaGVyZSAobGlrZSBhbHRwMm1fdmNwdV9lbmFibGVfdmUoKSBkb2VzKSBhcyB3ZWxsIGFz
IGluDQo+PiDCoMKgwqDCoMKgIG1hcF92Y3B1X2luZm8oKSwgeWV0IHRoZW4gYWdhaW4gdGhlIFAy
TSB0eXBlIGlzIHN0YWxlIGJ5IHRoZSB0aW1lDQo+PiDCoMKgwqDCoMKgIGl0IGlzIGJlaW5nIGxv
b2tlZCBhdCBhbnl3YXkgd2l0aG91dCB0aGUgUDJNIGxvY2sgaGVsZC4NCj4+DQo+PiAtLS0gYS94
ZW4vY29tbW9uL2RvbWFpbi5jDQo+PiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jDQo+PiBAQCAt
MTU2Myw3ICsxNTYzLDgyIEBAIGludCBtYXBfZ3Vlc3RfYXJlYShzdHJ1Y3QgdmNwdSAqdiwgcGFk
ZHINCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGd1
ZXN0X2FyZWEgKmFyZWEsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHZvaWQgKCpwb3B1bGF0ZSkodm9pZCAqZHN0LCBzdHJ1Y3QgdmNwdSAqdikpDQo+PiDCoCB7
DQo+PiAtwqDCoMKgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4+ICvCoMKgwqAgc3RydWN0IGRvbWFp
biAqY3VycmQgPSB2LT5kb21haW47DQo+PiArwqDCoMKgIHZvaWQgKm1hcCA9IE5VTEw7DQo+PiAr
wqDCoMKgIHN0cnVjdCBwYWdlX2luZm8gKnBnID0gTlVMTDsNCj4+ICvCoMKgwqAgaW50IHJjID0g
MDsNCj4+ICsNCj4+ICvCoMKgwqAgaWYgKCBnYWRkciApDQo+DQo+IDAgaXMgdGVjaG5pY2FsbHkg
YSB2YWxpZCAoZ3Vlc3QpIHBoeXNpY2FsIGFkZHJlc3Mgb24gQXJtLg0KDQpJdCBpcyBvbiB4ODYg
dG9vLCBidXQgdGhhdCdzIG5vdCB3aHkgMCBpcyBnZW5lcmFsbHkgY29uc2lkZXJlZCBhbg0KaW52
YWxpZCBhZGRyZXNzLg0KDQpTZWUgdGhlIG11bHRpdHVkZSBvZiBYU0FzLCBhbmQgbmVhci1YU0Fz
IHdoaWNoIGhhdmUgYmVlbiBjYXVzZWQgYnkgYmFkDQpsb2dpYyBpbiBYZW4gY2F1c2VkIGJ5IHRy
eWluZyB0byBtYWtlIGEgdmFyaWFibGUgaGVsZCBpbiBzdHJ1Y3QNCnZjcHUvZG9tYWluIGhhdmUg
YSBkZWZhdWx0IHZhbHVlIG90aGVyIHRoYW4gMC4NCg0KSXQncyBub3QgaW1wb3NzaWJsZSB0byB3
cml0ZSBzdWNoIGNvZGUgc2FmZWx5LCBhbmQgaW4gdGhpcyBjYXNlIEkgZXhwZWN0DQppdCBjYW4g
YmUgZG9uZSBieSB0aGUgTlVMTG5lc3MgKG9yIG5vdCkgb2YgdGhlIG1hcHBpbmcgcG9pbnRlciwg
cmF0aGVyDQp0aGFuIGJ5IHN0YXNoaW5nIHRoZSBnYWRkciwgYnV0IGhpc3RvcnkgaGFzIHByb3Zl
ZCByZXBlYXRlZGx5IHRoYXQgdGhpcw0KaXMgYSB2ZXJ5IGZlcnRpbGUgc291cmNlIG9mIHNlY3Vy
aXR5IGJ1Z3MuDQoNCn5BbmRyZXcNCg==

