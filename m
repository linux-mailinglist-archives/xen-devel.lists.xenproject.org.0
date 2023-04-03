Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF916D4879
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 16:29:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517465.802818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLAI-0001eR-5P; Mon, 03 Apr 2023 14:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517465.802818; Mon, 03 Apr 2023 14:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLAI-0001cP-2Y; Mon, 03 Apr 2023 14:28:10 +0000
Received: by outflank-mailman (input) for mailman id 517465;
 Mon, 03 Apr 2023 14:28:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W/KQ=72=citrix.com=prvs=450b71a79=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjLAF-0001cJ-LF
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 14:28:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbe73976-d22b-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 16:28:01 +0200 (CEST)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Apr 2023 10:27:52 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5241.namprd03.prod.outlook.com (2603:10b6:5:24c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.34; Mon, 3 Apr
 2023 14:27:50 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Mon, 3 Apr 2023
 14:27:50 +0000
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
X-Inumbo-ID: bbe73976-d22b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680532081;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=W48LfNmEx10sdamQf9Z+l8xZx5nNUTgaMAo86JMl588=;
  b=PrdTD8WIjJ7w4fbwdHL6s1IfS28R5Sj+X3OUnKq6OFkZynda8Bm9LWvE
   OkcIy2bQRybB0IDWgRg8RUONezmCgx3Dkth38IHWsHfhjTOofXfW894y0
   lXUgiUmwN6xHEZ8vNOeZdagvyJAedJElKRqQBMrIddHiV/y9eHtnXIjT6
   c=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 103501731
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:W0OpQ6liXCLCJColnsL7jnro5gynJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKWG6HaKuNYDCkfNp+b9m39BtXvMPRyNRqHlFu+yoyFCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgX5ASGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eM+eWtONA2pu8C/yraBd/g3tJotJvC+aevzulk4pd3YJdAPZMmbBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3ieC3WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHugBdpLS+bhnhJsqACJ/2AwBjZJb2GyhPWhukesae1xA
 kNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4J5oflqYRq1hbXFI87Suiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:Wgm9aqBUpm9+gGflHemV55DYdb4zR+YMi2TDtnoBMCC9F/bzqy
 nApoV/6faZskdyZJhko6HiBEDiexLhHPxOkO0s1N6ZNWGMhILrFuFfBODZslrd8kPFh4hgPG
 RbH5SWyuecMbG3t6nHCcCDfeod/A==
X-IronPort-AV: E=Sophos;i="5.98,314,1673931600"; 
   d="scan'208";a="103501731"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWu362jbBNliunOyuAp3h3gdwvNH/X19HuMKSGO0atc0oGVimOcA8ph/O1pm7mDP8ml+jmJsgydSIgBOmaxEAPE1/d7K3+0V1CQlZufiTTGfLlL4RmAgCYXQQppeWtBAiEZGPOsO2Yygfz2IDSnyzE7/cYVJHYbU5CczvZD0i//V/uV6W4Chy95/UPUwurd5KP7JsaFyj6/RRcGNAIUycsCe05rXmOJxF1MECwNhx3Cd3wTjXSx0bdxDGL5fvBUjN/zNfr8RdUEuB7tzmp8i1NJ+WlNeeol2qT/EHeywuohzaaECIRT3SxafSTw/WLQiGkRzoB8RjATP43T4jnXPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAfwAS67uPv82PW8HQEBVpAbw93Rh6M0Lh2mOQ5+z9k=;
 b=bXsUw9zjHuDG2HSDd8wCzEAeZeGUHYpq++tz0tYcvFmd++auWVhyKJNtLLifl6AV88jXskCdMUJ5uRM3C6k3pHXgJvzNbqQ4ToOjS88AGocnSjSmg0Cp1o0Q/5g1dyOHlBZ+EJGI83udAIqG8bWhAiQKJMKW1k0OzjKgOe3+E6L7b+CgNTPdKO7+g2Vts//2fxM14WnPkHXdD8mEka73rB2bCkglAyo9TshovP05NXZNS7YsJ8iSH2QHKZErmGttVY+cMsCMC6llBFMUZsafL9/q1dVsvAYm6t2TxCygD2sURiWtogY+dMqCDuandO6aFo7F48wVi6UGATuCI2puGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAfwAS67uPv82PW8HQEBVpAbw93Rh6M0Lh2mOQ5+z9k=;
 b=Z8Ch6u1IzzGH1C+wjElwH7e0V5ftQxVQvbxaQjevAD/DKXJNmYuCfa7eIVHHMqA7JGyCsIwSRE4noKbInsD1GGsZElOpXuUCok2m5HrxVPM81hiU+Dyf2PF0hSCyiaBorYsT4WszXcDOoQTBKXea230rrEjOC4NsbMxRi521zM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 3 Apr 2023 16:27:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] x86/p2m-pt: do type recalculations with p2m read lock
Message-ID: <ZCriYs9y6JU1gat9@Air-de-Roger>
References: <20230403101449.93323-1-roger.pau@citrix.com>
 <8d976d34-8a1e-95ad-3bc9-3cb704c1fae7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d976d34-8a1e-95ad-3bc9-3cb704c1fae7@suse.com>
X-ClientProxiedBy: BN9PR03CA0325.namprd03.prod.outlook.com
 (2603:10b6:408:112::30) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc82857-6909-4183-2529-08db344f9a66
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CMTS+V5ALtoPTYzCDgDBdeInc9OyLTqbZ0fc33ySvPmpqjJqFGPMkL0I+gcBk9vRIEmeAa8THkphAiw2GIo4Egos1Ti50eXSyco9Hh3TQ5Lh0S/fLXZmGgc9SoDgPL7OF9n19DuDmWoP/kOV6EQKqWq7Enr18nM6ZlMv3U/UTI5lFQhTUo1lE0dteo9BU7bA7rxeFrD+xkzDSITkg152h2cH5cPl2XkClMKoSET2o1w2UG0yQYmbEti+mMMHFQp1HJ1gAIxKrtFQe1uJ9kQLp8ZmhU98nKGD/QbTc/EBXDgfINXPeRSWee/gYLalT4YX6e43oLG6HfAt62wUy8e/OgCgRA1svLSs1OCIwnRC56rQ8xzHtJloyKkZA1Pvgw6eC0zC7iXSJAI5dZxgZhB7VfFQm0uyBzga6mt+eiKbeMEmxf+PwGfUnLlD6peq1A1HIfugaak8ni9tUvdIU0ne6l+MFVChMjcq69VOnkE7g7DYKO3w+lgEgkgCSag+0fiGar8I4NywzP0JVE1/gKDFqlh0MWzJX59+AflyY39T6CPLNWWD1rlhVY/aaWwV3nVA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199021)(6486002)(83380400001)(5660300002)(6916009)(8676002)(66556008)(66476007)(2906002)(66946007)(38100700002)(41300700001)(54906003)(4326008)(82960400001)(316002)(8936002)(86362001)(478600001)(6666004)(6512007)(26005)(6506007)(9686003)(85182001)(33716001)(186003)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aktwaFhnOWZGdWVJeGVNR2dWN3VWdXR3aW9CNHIrTTR1endPRDVKcDJ6UnRH?=
 =?utf-8?B?ZzZxMFlkK3lMRmlMZXNoaUdCQklkSzlpclhDeWRCdjZ3S3JUVTBlVVozNVV2?=
 =?utf-8?B?ZU51cEV5cGNGOUowVUtTQ1R0VGdHTHdZa3d2NXV3cEZJYmtUaGIzbEpmTHRZ?=
 =?utf-8?B?RndSRHFDaGU2YjdTT0hSYTJMN0cyZy9vUGlIUXJDVFBOeFBjWk5TeDcrUi91?=
 =?utf-8?B?UkNWMjl3eEFDbjRxTnBFUDBNN3BOYWx0clNUOTg4VEUvVDJaZEZhclUzZXp3?=
 =?utf-8?B?bzRXb2lwSlJUVmp0SWxxbG04TGZzK29XcXg5TWJVZVl1Tnk3eG5WMDk1dTRk?=
 =?utf-8?B?UHJjUzY0RXdzUEpMV3VpbURDMVB0YlFFcUhWM3FpeTZiaUdxNTBJSmkwNllD?=
 =?utf-8?B?TTlYdlRqT2c2NnNNQ0Y1bEoyOFVZWS9rRGRxNlg3VjFaRytLbjhkUHhtMzQv?=
 =?utf-8?B?RHBQNS9aeDhKMUY0aWYySFArbm9XTGpZMElvUHF2aTlTbFhBM1NNbWduTlhX?=
 =?utf-8?B?dmZYbzN1NUVPTzRLQTNoN0lSbFFMeFZ3cVdXcGhxamR4b1d3bnhiN0J0SVpy?=
 =?utf-8?B?TVlrd010SFRXS0J0dDMwT21xUUxmZjU3Wmg4VWJkQU5MQUFacEdMd0pNUTVm?=
 =?utf-8?B?UkZpY0FueFYzRi9wTVhnVFQzT3c2MTVmQ29leHdRU0VKMllBZDQxMUc1cDdu?=
 =?utf-8?B?LzQyM0c4MUlkdFZmbVEzTmFKVS94bW84QzI0czEydkd0RXJ6cll5bzlINUlX?=
 =?utf-8?B?blhJbVNuV1Z6SDNzWjh3OUlLT1FlbTUyQ3dkZmhoNjR3b1FEaDRJRnF2VTlz?=
 =?utf-8?B?ZlN5SjdZb21GMElOYW1VOVc2M1ZTVEFtTUVpZjdIVG81bDc1ZUpQMkUvWG9O?=
 =?utf-8?B?cFhscFdzS3M2NHRtRmZXSktSempubXd4SnEyVmhPd3cwWHBSSno0UXl1WVZY?=
 =?utf-8?B?SjhWby9HeGNDOTd3VXk0QUpjaEE0NXV6OXBFa0hVaDZCN25WR0xwcVdiWW5P?=
 =?utf-8?B?WWdzV3lOZzNnUXpEdTFNciszcjJMYTF4dUYyekU1QmxONTlLM0tqZnkyUHkr?=
 =?utf-8?B?ZXAwYjQ5b3JGZkhvWjl3TlljTWlZMDhEUC80QjhUK0hudHdMWkx3YmFGYXM5?=
 =?utf-8?B?eStqMEROZDdWZ2tteXpvSFpBUHNoS2M2SCtEZTdwOU9wRno3ZmJKQkpLNVgw?=
 =?utf-8?B?L1NRN1d0VFJuTktQcFF3SlpzWXE2dTJRc2RBbzNGdzcxTFRQQ204SUZabE5q?=
 =?utf-8?B?YUNSVFFIUEhuMmFhRjVDazBXejBmdDd5YWF1b09vQjRKR2dzRm9iQWROREFP?=
 =?utf-8?B?WDkvaWpXQnhLV0gydWJXeVE3bTFzODVXSFNVZlEzTHFHaC9mcGVPaXluLzB0?=
 =?utf-8?B?cWl0enJlV0tzeEU5WDF4UkRGdXRQOE9mb2hQWDBSMjY4SFZJTlZKTzBQM2hi?=
 =?utf-8?B?NW5NU09HeExhU1F2clNpaFdWcXJJUURYSHRsb0MybTU5VEtobDc4QVVIZjNM?=
 =?utf-8?B?aDB2OHRlY0c4ejJsT0F3bzNEQzR6LzVpbkVBVDQ1cVpReFF4RUZ4d0cxY0FI?=
 =?utf-8?B?MTdtejdWVDZrUFBiRzlZQS9NOTBreDBmbmR0NERPZVhFbWJScjdSdVRPVVhq?=
 =?utf-8?B?SCtnc29aaHpUTFo4RlJEQlJTOURoTjNNbUZrMDV6cWhtOUhtNW9kcE5OSTdi?=
 =?utf-8?B?Q0ZDNDA3NXlHTjd4VjdLbmVocDNRZlZOZGJkZjY3WXZFbGNwYytBMDRTalRX?=
 =?utf-8?B?QnZHSlBGTFZzVUc2QXc0RHJRRGx0NG1VT2dMUk9iUzBIOVJvLzZ2ay9CeDdT?=
 =?utf-8?B?WlBkQVp2QXczVkRBWmhlc3lremhGT2J1Z2RTZUFnTXFPczNGZ0hNcWRMclY0?=
 =?utf-8?B?U005REJMSmpsaEYrRkgxcTNwbUZKNkxtU0JMalNXem4ybmc4Y3JmSjNGNlc3?=
 =?utf-8?B?U0E2OWREajlSdlM5UGphWG8zNktIVGpxK0hOUW9TVUF4bVA5MG9mOGsxczlt?=
 =?utf-8?B?Q3F5dGZ5VXVRNkZFOWRNbWZtd1pHbG51QzQvVDRUQWpSVERlM0NPT2dIOW5Z?=
 =?utf-8?B?NW1lV3VyU1ZpeHdhbjRqKzhXOG51OUdVOGsyckZIV3hYV1kvOU4zd1JVTVAy?=
 =?utf-8?Q?dQn4msdkz6lSCF1TllD/aNkGC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K8q+NIF1BxydUNFf60C3GgpCEup+KnhHZxUYiotpMVLtYT4xVkR5ouuvjFlsFOx1mGdNuPmbGLdnL57V+65kD09YXZflELEr4Jc8Ihyjv5fiVm02BJ/UHhfVmlX2vQel6IfV9tYvDpa/x9cehU/ixumGso4yPQH1FMTVTayMG2Q4bnOnTR4i7ewjk1eqh/pDv4ACrAZw44sMLXNPUrKre5WFBx+IL3OKwU0kBelNIdlthBk61NeXrBeElbropDns0KGlKWTNt7rYAZlhXZwWYAUTEi3011oxOwXbHd5989J9d+Uc9Q3xhiLcv+FKYmHq7It1FkEHT9XtL50jiJ/rf4lA21l1hkziNyXAvxU7QiPTCgTIDDrPLYU9j6YT0PvAz1h3e2W6sLDCYQIgVfsdtJkqEtY1eH+zGLdvZViVagUTgc2vexPAvfEiQFCJ9V9OJgjzn5AfUWA15Aaf7335dxN+cIP9kvCpwnIFg9CKu355jMqNvNoFwIWBtJygQQL0tasRoQFVuIudNxZBch/N11d9ojo79rfD8Kbvdn0Rydrqs6AvXnaPhrvkwBdWZopf5GWNxhyB5+OmZOISQySyhuNbL9tUQpTtNE78LwdAc6EFI6TOArtwJeAw/wXjV1KkELAqAFhf8MqGQSFZu7/UYmOGpa1tY9bhr9bErzFQAwYEd929CgvuZrXN0ryU5BZoXfNSU0Y52PX623Dd7QRGO5ZOw92zsNlWZucn1tX8t4AoxWrB87SvGlYKSvcYEtH+DHEyO+WEm7LkAgm30qCXL/GaiXjb74J7oGK1fWdPc7eISQnL5JKOiaexiEtdWFeR
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc82857-6909-4183-2529-08db344f9a66
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:27:50.5791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZgaDS1TRPjCreLTNaPC3eS346DtHhHxyXwfFKkscOJT49QEC3JNJzq772aW6mJKLaxL8AItCIWYtDLn7hqJVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5241

On Mon, Apr 03, 2023 at 02:39:08PM +0200, Jan Beulich wrote:
> On 03.04.2023 12:14, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/mm/p2m-pt.c
> > +++ b/xen/arch/x86/mm/p2m-pt.c
> > @@ -486,9 +486,6 @@ static int cf_check do_recalc(struct p2m_domain *p2m, unsigned long gfn)
> >          p2m_type_t ot, nt;
> >          unsigned long mask = ~0UL << (level * PAGETABLE_ORDER);
> >  
> > -        if ( !valid_recalc(l1, e) )
> > -            P2M_DEBUG("bogus recalc leaf at d%d:%lx:%u\n",
> > -                      p2m->domain->domain_id, gfn, level);
> >          ot = p2m_flags_to_type(l1e_get_flags(e));
> >          nt = p2m_recalc_type_range(true, ot, p2m, gfn & mask, gfn | ~mask);
> >          if ( nt != ot )
> 
> I'm afraid I neither understand why you make this change, nor why you
> then leave the other use of valid_recalc() in place.

The message can be bogus if we allow concurrent do_recalc(), and I
did miss the previous one.

I missed the one at the top.  Originally I wanted to send the RFC with
just changing the lock to read mode, but then I though I might as
well fix that (now bogus) print message.

> > @@ -538,9 +535,9 @@ int p2m_pt_handle_deferred_changes(uint64_t gpa)
> >       */
> >      ASSERT(!altp2m_active(current->domain));
> >  
> > -    p2m_lock(p2m);
> > +    p2m_read_lock(p2m);
> >      rc = do_recalc(p2m, PFN_DOWN(gpa));
> > -    p2m_unlock(p2m);
> > +    p2m_read_unlock(p2m);
> >  
> >      return rc;
> >  }
> 
> How can this be safe, when do_recalc() involves p2m_next_level(), which
> may install new (intermediate) page tables?

Oh, great, didn't realize it was capable of doing so, it's more hidden
than in the EPT case.  Seems like this will only happen if a superpage
needs to be split because a lower order frame is being used as an
ioreq server page.

Do you think it would be safe to try to attempt to perform the recalc
with the read lock only and fallback to the write lock if there's a
need to call p2m_next_level()?

Do you agree it might be possible to do the recalc with just the read
lock if it's updating of PTE type / recalc flags only?

Thanks, Roger.

