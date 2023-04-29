Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A987E6F247C
	for <lists+xen-devel@lfdr.de>; Sat, 29 Apr 2023 13:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527598.820293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psixU-0001UP-NS; Sat, 29 Apr 2023 11:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527598.820293; Sat, 29 Apr 2023 11:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psixU-0001SF-Js; Sat, 29 Apr 2023 11:41:44 +0000
Received: by outflank-mailman (input) for mailman id 527598;
 Sat, 29 Apr 2023 11:41:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/eqU=AU=citrix.com=prvs=4767ec71a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1psixT-0001S9-70
 for xen-devel@lists.xenproject.org; Sat, 29 Apr 2023 11:41:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd6f0b23-e682-11ed-8611-37d641c3527e;
 Sat, 29 Apr 2023 13:41:40 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2023 07:41:37 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5634.namprd03.prod.outlook.com (2603:10b6:208:285::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Sat, 29 Apr
 2023 11:41:33 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.024; Sat, 29 Apr 2023
 11:41:33 +0000
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
X-Inumbo-ID: cd6f0b23-e682-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682768500;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=l9kbN7uogL6OLJNgtXYrZFuBuR84eLX0U/jpea1E274=;
  b=c2mYqWt/r0NJLzsIydvaz2AN/O6uIvUbmjwuTTHo/QIz0BuO0fv1lLzL
   SgVkqV9pWHv1uETf9MqUUT2yfdo+TZfOoplWgO8opO7tjxiqeKskmQ8YE
   QyLwj6qpyxZ3MRNkQ74xnFsk97tEpcybMsqiao83jNJ3UBFqjXV9409mS
   I=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 107717193
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tC+ed6tfZMhKGPfsamG9DCeSWOfnVLxfMUV32f8akzHdYApBsoF/q
 tZmKWCBafiOY2OjLdAnPY60901S75GDzdJrHldo+CtkFnhE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOExiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwaz8mcj7ZoNyK46viTfRGlPomLPa6M9ZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIK9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqaEz3wTCnQT/DjUHaWr8j9yDtHeSQupFc
 VQqwXMDp4sLoRnDot7VGkfQTGS/lgUHR9NaHuk+6QeM4qnZ+QCUAi4DVDEpQNUiuc0/QzAw0
 RmXltftCD5omLaRTm+RsLyTqFuaMi8QKG4eeSIeViMV7t/7uoYxgxnTCNF5H8adi9z+GTj0h
 TeQviU6r7wWgYgA0KDT1UDKhXegq4bESiYx5x7LRSS14wVhfomnaoe0r1/B4p59wJ2xS1CAu
 D0OnZeY5eVXVZWVznXVGKMKAa2j4OuDPHvEm1lzEpI99jOrvXm+YYRX5zI4L0BsWioZRQLUj
 IbokVs5zPdu0LGCNMebv6rZ5xwW8JXd
IronPort-HdrOrdr: A9a23:iLkkfaDqMZUvJKrlHemW55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9pYgBHpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qH/xTQXwH46+5Bxe
 NBXsFFebrN5IFB/KTHCd+DYrMd/OU=
X-Talos-CUID: 9a23:UR/G3G0cDgB57+elOyyM27xfWc8OblOH60nsAFbhDntDWoOQSWDB9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3Ag+lt8w3YiETRG0V2mrXOUeGlcjUj8pifT24oq6s?=
 =?us-ascii?q?/l9C8L3ZoBQzEoT6Ue9py?=
X-IronPort-AV: E=Sophos;i="5.99,237,1677560400"; 
   d="scan'208";a="107717193"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmsfvUHIzRyf+1rX+0xJWaB8LhkCfCFtInUQa3CsuN7vvMdiCBrXHEUYIJMODRS7drezrr4DZNeb9ILwywCIxCRMDTlWNJhPMZ6x1t07e2vjyvjPhmeZYwGHtSi445mcg9COElcrNSbiMt9kTA8lPVuurZdFDO/gbJKZrzCNiXTJh82b2213stNiLDbeAuOzA6/1AuR4ZgbFIFXM1K7sLjn2joJg+pppJWK3SHp2IZjoiYm0oI4FnTGI2zObmtQftSUlHqKCIWyZdf0t0ET0NCqdRV4hgllatph+oTA58X+va6UakJME0xledt0typZId+IxZvMijkAN5wnUSeL/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdywTMgkRK0eSOU+VAX0t/M8x8K1iVjOblidHhBmENU=;
 b=S7+CDJUtL4z4FHcoYhcOqqsBjZU8QJWWV0xIVglv9LH1NpbDR0Ma3JsV6O+zOAOZGRa/vpEzxQbOEmcCvNklo9oHkwjIMQCgmj+OT4jo3WEmGLTBHkeHQtFwu0SoAxyXOpQa4XySq3W7PcRQRYBM4wQMYfpC83jtGNeLRxhUxM5lkG7fCbc3VlzkdKRG3rwwN/XBpacu+QfF02aSGMpSHCtI+qN0GyNpAYOLrNfb+DLlyRB+oDCZLGoXt9OeGHSs4Bx5llN5hKvpW1mojj1MHqiuP4EbFjX0t5FXlB1MP/TSjV8HZrGOXYZlyjbcUMxVGO+z3G8EACcyBcd4jxVhQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdywTMgkRK0eSOU+VAX0t/M8x8K1iVjOblidHhBmENU=;
 b=cq5dqACjYbwZzLPjIA9Abxas04ot+E1/BrvxXd+c/2JZHicljovhNNUJs/2a3y5uIWG+03tXB8MoffBH5y81sEzGngOWzw+B8ckb2j0OTs/yX2/GJCvHB0AQAvyJklaiTM7phBhGmzQO+Q8dMRTaEzLORPP0eRIT6FXH+ctgfsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ca0144a6-2c57-0cc3-fd27-5dbe59491ef3@citrix.com>
Date: Sat, 29 Apr 2023 12:41:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: andrew.cooper3@citrix.com
Subject: Re: xen | Failed pipeline for staging | 6a47ba2f
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>, alejandro.vallejo@cloud.com
Cc: committers@xenproject.org, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail>
 <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0342.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: 62dd8ce5-6926-4cc1-1e92-08db48a6ae3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ctm4Lup13l9mhsd05rBrlX/Z/xbUnROhIYVuwLG6gqRYr3cCWwWZotjSXZqGQdKsCeV6EwmDi9p9mMoGeKdoNqisMl08dp9Pixl78053QEX18HZ7aDKczhM/3k7vsAZeXgaxs5c7gLwCyk+Y82OBE7xmvKQG56t9l3TWxq0fWdw7ZKsCojSNEZOQpDiZcsAXC0Lgl7NmYYeV3zURfGvkcCM63cKnzz2ScNKUe+F/ZrHlf+3QbOJeEIf5NA1NZKi9fPI2Liz8gSB+NYxgwg8f3LaS6kni0ugN8zm7hE2j2ovQhLAMqiBKQ8k7/Oj0eNbTQQjzVkCDs0u2BQ3X9s9ApMDxXL5JZBIOBuuqUF0PE5eNEho7fJuEn25TCf8gFlbbbKI8Dgz7ltLqyl/novjkACoW8rRgVS/4NUArqmdpzit4drS5MOpzTCfZ9meo8mLJ15R4N9v0TXNJVVxK90F8i3HzGzcwLBvpIJyP85+FBEGiAa8qAQwMpELfTlNvIZYSiqhmDytF/gyjX4hH0J8RcToxqt13mrlVIr9BH8SLWyALkDzfrMfY9kjlT8GqnkReyg+ApQTpi0v4YNjSUFlK8Lmf1rJ0JAm8Q0xr782n9SwQVrfsjcl8FqHXWHcOoAOQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199021)(41300700001)(316002)(478600001)(82960400001)(8676002)(2906002)(38100700002)(31696002)(6486002)(6666004)(86362001)(66476007)(66556008)(8936002)(83380400001)(5660300002)(66946007)(31686004)(4326008)(26005)(53546011)(2616005)(6512007)(36756003)(9686003)(6506007)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck01VEhxMTMzY2JxNnp5WTRZY3ZlTWFnRUMzbkQ0VFZROGljMHp4YXBDN3dQ?=
 =?utf-8?B?NVBtSTRSamZwWThCT2FQQnY5dXZ4NGFxbXR6dkwvQmcwUHV1Q3N5MVdBcyta?=
 =?utf-8?B?Sm1mQjEwR2pLY2RZNEZ3a3E5WExtRmxOYTluTElFY2hjWTBZTTdkdDlzMVNa?=
 =?utf-8?B?cWxlZEhJUGRjTThWNCtoazJLdk9YUnhWdUwycUJTRFRic0d2bWpRbVZsMnVB?=
 =?utf-8?B?QnJBYnoyaGNaTWlxQUtVb0djeFNadkNYUUVPekp6L0hUd3E0enJWRGZWQTEx?=
 =?utf-8?B?QzVWOVg0aHovQ3FCWmxnY29nWWlVK0k4cnozVUZIR2Z0dFplTE5yQStlZk81?=
 =?utf-8?B?ZlNXMmJXMW4zWFUrbUJjcnY3Z0xQS1ZhUjUxUTYrMHNvUi94a3lrN0VvU215?=
 =?utf-8?B?Mk16ZVZQUm5JU3NIcEc5N2JueWNPaXh1NWVqUnlKUkM1ZFdjelVSUDhNVGhu?=
 =?utf-8?B?UjB1dS9wT3pjUnNhN2gva0VhTnMxT0VFdXdNdkI5QStxTWdGb09kSDNjbjJk?=
 =?utf-8?B?cXk2bnRZL2tud0tvbXNXNzJZOFV0TkNENlRDTGdzQk5PbWNVTmZ0ZXlKNzNt?=
 =?utf-8?B?Q1djUTFDUlpNcHZFdHZlTGdURUs5dzdhQ25mdlZ3ekNueW10ODRPd2N6azR3?=
 =?utf-8?B?M1hUUThQM0daQXVLWkxiekZqSytnSmV6TDZRTHQ2aFdFWUFQU0hnSmVOL0dr?=
 =?utf-8?B?R1RYZEJOZG5pTWU0czJWTEpIN1RZT3Jsc1k1RE53NW1YQ3VCaUZyQVpQSmFL?=
 =?utf-8?B?Zi9uK1lwZVp5R3JESUNncTI4ZlpXb2x2VmJsclpFblJyTktFcmkxc1RKaWpj?=
 =?utf-8?B?U3VZUkhqbmtra1F0a1N6ZjhCdFRtU01xVXhGM3NTbGRUSzVKcDBqaC9oZk15?=
 =?utf-8?B?TlFqYTVHMGpqZVl6MTBOcmJFaEd3Y0NBNjdHMjI5VG1tdm41S2xsZjlXaXdD?=
 =?utf-8?B?eldLWUZwUm5jazhLcTNKcnFOMFJ4ZldVanBJLy9mZ0Z6dGxXRnk2V3R3MDdz?=
 =?utf-8?B?VmdQUHY1TjNtTHhiYlpwWnlJS09uQWd6UHBIY0FqdG1maVZJbWtteEtzbVIv?=
 =?utf-8?B?akMxeU0rdXVhMHNJRG9STzVzeWI4RTdKQUZXTnRQNFBPZUZ2QURVcWhxcGcr?=
 =?utf-8?B?U1p4cVZqWjBmSC8vSXBuZ3dlTHZmZnNyVXJOVlNlbElhSUpJbitmbnU0TkVQ?=
 =?utf-8?B?LzJFTnZwWW5pcG5LWnkyV0JtZURlRklYT05yUlY4ZHdWbnhvdXZqRWZoaGdU?=
 =?utf-8?B?dnNpOE5NYmxjR0k0U0VKR3V3SnhkUlpBVU4yT0lXZG0wMXlBUWRrdWZqcnND?=
 =?utf-8?B?RUNsbFlVbnJoZzFCQ1dGWTM5c3M1dTZFRzVYdVVFY0p1c0JxSkZxek1iRlN4?=
 =?utf-8?B?SzJhdTBCMmd5VXBYQ1FFN2haY3NkL2I0TDc0OU9DTzE2ekVwLzZIcFcrQ0hL?=
 =?utf-8?B?K3Q2ZFBwSSszTXczM0tLWTBSbUJLL2FrU2lDemFlOHBtWktVaElnbGk5UTg5?=
 =?utf-8?B?cU9zTUJXNVZYYSt5blBMVWVRdTJiOHRhVFNUSlgxK3MwRVNQb3RMZFFvL3BW?=
 =?utf-8?B?aC9GVUNhdCtEakI5VzErcnc4Y09iOFBjQWRVcTFnNHRHTkFNUVBXejFseTRO?=
 =?utf-8?B?YWptUHdUUnVILzljaDRGRHlUYmdmODl6T2JmemtXbm5FdkhlU3Z0TXdiaWFQ?=
 =?utf-8?B?ZmlrblZVUlNrbGd6WGNsSGxtZ0NHeU1xWjM1aCtxeEdjNUo2RzErMnErWnFj?=
 =?utf-8?B?aHJHdjdudHRsQy9JQTlQZk1pd29kWXlGWllQd2U5VnhrU3BkZTRPV1BRTllS?=
 =?utf-8?B?VGxvL3NRditiTFN1Tk1jMXI3NXcxOTFiczFmMzdXMUozVGNWRGkrRWE4Y2pt?=
 =?utf-8?B?OWdvOXp2RzdaSnBMVjB2WWRZUWdxV1hHQ0NOeXMrZUtKN2xHNGZOS1VjZWVo?=
 =?utf-8?B?Q1ZWaUZlR2tKeFN3aWcwZm42VDBud2JXSWdoYldWb3FFZmVTN3JuSW9RRUwz?=
 =?utf-8?B?cURYVnhjcCtXZGdacDZnalM2Ykp3bzFsVU9GdDhndUh6S05jSzFZWGpkd1hJ?=
 =?utf-8?B?SnRRVU56Y1I0UDQ1cHZuakZLK21aenhTQWYvNVZYMmVsK0REbTlISXpURk1m?=
 =?utf-8?B?aWkwQVRKbG45TEV2YzdZU0czTGFXMGxESnBCYVRndVQ1a2JlM1FMRDRDZ0RN?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r71SCAjLFZuZK+q6VYuyuFO/jKpf6waf6BE12lCYCnJlMYexsbXazDktTDdk8sQSOvlVNH5mjYsaubJ5nS60ZoOaKj0NFeP0PkpaRzd0NIScO3gtC6MPH3+YakFcITPC4/vQe0vM8rT2HkoYbJpdpme9nkUP8Vlx/jf4/Tg9xtPd/1t41PQSKYpGG7yaP3JlbXD/w9WMLm3NN9GwK/m1unad3dMuFmLhkhU5SzBTilbBA9Fj7Uu52wz8IxhQ7tU6aQaSwHE5rmaRj8ch0dI4Yq1XxXW9Uase3Dc0o0aRnPs+d8lzKvjub2DEvdtn9zpe/vNYvw42kTegTfMmwP/LjwS7j/e1/ueXdCKh9mi+icgjVxLzZibzHh+tt3h9DdSa9Gvaohikyc0wjZoplpMtJJdNl8BSwzJEYJNv4AJrFEv1Gfu0MIDsqxgPIa1KnUQQmvGUfGZ8rz2mXA02yv+Bi489EeC3bTu8qp2eQ6+OSLSQll1uLKGY1yxejPgwCs1kjhNqqhTTEI7TW7yxQwsh7TJCbxw9kkyoEFQv7aKSrHtx8u3P2xzRh9E1DCBmIs4ymJ84RL7IacMCLsFpyoQRf0WbELphpQ19ZTZyOT+plHK02wfqqJm8RUi0wlRPau/Rxiirca/ywt8+JVjVvmbw86g5n5+VquQoGEcX0O9xKnptmYz2r4mo8YZnTmAeMouBBdJoqoNgTsnorE/NRNtfT1sHenQeEDFQJAmcRFwZuYli6QUXl4BS75271vjqhMzIiRL21g9zg6FDVgYl6lQvVTyKdRhdZ+ZtTLjhL9+eS7CShvamsfS42SQ4jCW8ThDKArwoSASkLesXOb0aFMTrXbLcBYBgABbgugECLkYL1sXloGSw1h64BZEcTgCvUSVkbtUJu8+EaNAVlOlo4zM2Hg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62dd8ce5-6926-4cc1-1e92-08db48a6ae3b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 11:41:33.1639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dn9LalAbkNt4I2vuVowT8iyKaPo37ixW4wkoaWCsFiNe6gyNbetHDNK/26LeLw9c8JtbYsL0lADEUwTGlIjZpSFsQl0QBfanEVDNXx5JoVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5634

On 29/04/2023 4:05 am, Stefano Stabellini wrote:
> On Fri, 28 Apr 2023, GitLab wrote:
>> Pipeline #852233694 triggered by
>> [568538936b4ac45a343cb3a4ab0c6cda?s=48&d=identicon]
>> Ganis
>> had 3 failed jobs
>> Failed jobs
>> ✖
>> test
>> qemu-smoke-dom0less-arm64-gcc
> This is a real failure on staging. Unfortunately it is intermittent. It
> usually happens once every 3-8 tests for me.
>
> The test script is:
> automation/scripts/qemu-smoke-dom0less-arm64.sh
>
> and for this test it is invoked without arguments. It is starting 2
> dom0less VMs in parallel, then dom0 does a xl network-attach and the
> domU is supposed to setup eth0 and ping.
>
> The failure is that nothing happens after "xl network-attach". The domU
> never hotplugs any interfaces. I have logs that show that eth0 never
> shows up and the only interface is lo no matter how long we wait.
>
>
> On a hunch, I removed Alejandro patches. Without them, I ran 20 tests
> without any failures. I have not investigated further but it looks like
> one of these 4 commits is the problem:
>
> 2023-04-28 11:41 Alejandro Vallejo    tools: Make init-xenstore-domain use xc_domain_getinfolist()
> 2023-04-28 11:41 Alejandro Vallejo    tools: Refactor console/io.c to avoid using xc_domain_getinfo()
> 2023-04-28 11:41 Alejandro Vallejo    tools: Create xc_domain_getinfo_single()
> 2023-04-28 11:41 Alejandro Vallejo    tools: Make some callers of xc_domain_getinfo() use xc_domain_getinfol 

In commit order (reverse of above), these patches are:

1) Modify the python bindings and xenbaked
2) Introduce a new library function with a better API/ABI
3) Modify xenconsoled
4) Modify init-xenstore-domain

The test isn't using anything from 4 or 1, and 2 definitely isn't
breaking anything on its own.

That just leaves 3.  This test does turn activate xenconsoled by virtue
of invoking xencommons, but that doesn't help explain why a change in
xenconsoled interferes (and only intermittently on this one single test)
with `xl network-attach`.

The xenconsoled change does have correctness fix in it, requiring
xenconsoled to ask for all domains info in one go.  This does mean it's
hypercall-buffering (i.e. bouncing) a 4M array now where previously it
was racy figuring out which VMs had come and gone.

~Andrew

