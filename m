Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C96251C506
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 18:20:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322288.543555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmeDL-0007ui-Gf; Thu, 05 May 2022 16:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322288.543555; Thu, 05 May 2022 16:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmeDL-0007sj-Db; Thu, 05 May 2022 16:20:27 +0000
Received: by outflank-mailman (input) for mailman id 322288;
 Thu, 05 May 2022 16:20:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T22s=VN=citrix.com=prvs=11701087b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmeDJ-0007sd-Al
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 16:20:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42dbb5a8-cc8f-11ec-a406-831a346695d4;
 Thu, 05 May 2022 18:20:23 +0200 (CEST)
Received: from mail-bn8nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2022 12:20:20 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CH0PR03MB6068.namprd03.prod.outlook.com (2603:10b6:610:bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 16:20:17 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 16:20:17 +0000
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
X-Inumbo-ID: 42dbb5a8-cc8f-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651767623;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+m8VIJ+tfKH9iLdbUemtpwqiQFJXXARDYXyksSgNkGs=;
  b=e67wl41tAwwvSDZqj1BfmxmTn9cQQ9dhAV38n32ZmgCV4o430upKp+kP
   /4D0UROKP9UhCJDF/X9c5/QXKDefElswFkZ/Bo0srXW31ZUzK7QbwZ3r5
   eYACFC7M3NOwbBrvjItyYTJlDtXEK3kOdB2A8a1Zo6k8ns6tziMhjm0Qw
   U=;
X-IronPort-RemoteIP: 104.47.58.170
X-IronPort-MID: 70666300
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kzQO/ax+Nl+YUwTGJvd6t+c7xyrEfRIJ4+MujC+fZmUNrF6WrkUDx
 mofCjyAPPyJYDTxedkiYIWz9R9TvpaDz4VkQAs9/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12YXhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl9sD3VjwNApL1uvUPeTBxLgsuMaBN5+qSSZS/mZT7I0zuVVLJmqwrJmdmeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeE+OTuocwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgK2MG9gnN/cLb5UCJzhVj0KnCOeGIa9etX+lNtF2B+
 XPvqjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsH0QhmQsHOC+BkGVLJ4EOAk6QfL1qvd5S6YAHQJSnhKb9lOiSMtbTkj1
 1vMldW5AzVq6eSRUSjEqe/Sqi6uMy8IK2NEfTUDUQYO/9jkpsc0kw7LSdFgVqWyi7UZBA3N/
 txDlwBm7517sCLB///TEYzv6950mqX0cw==
IronPort-HdrOrdr: A9a23:Z5mB/qqMIty8Afj+kYuH5MIaV5uiL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCDwqhoPRPAh3Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iGnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAlqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocYTbqjVQGYgoBT+q3uYpxqdS32AHTq+/blnwS+pUoJjnfxn6ck7zI9HJFUcegx2w
 2LCNUtqFh0dL5mUUtMPpZ+fSKJMB28ffvtChPlHb21LtBPB5ryw6SHkokd1aWNRKEi6qcUtd
 DobG543FRCDn4GT/f+kaF2zg==
X-IronPort-AV: E=Sophos;i="5.91,201,1647316800"; 
   d="scan'208";a="70666300"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xk3Yae5ndyH8TyThio8szDecTUJOtAa6IjLtOIEyvObCn7hH3g3ioABr952m/8gRxJWb+AePMQjb6wfpJbFx2d5RAHWiR4xL+trk4qRqFjdib8Hqc+sfLhp4odOCxraltZc/tvtJQEBLFOAmuXdbVXMTtvK42tMXILDUlbYMsz3Hfsa8Y30SVCvaRW9aC6yIyokLmnnd9bSBLWWaLQh8iqqp4I2tVZcqOPbO07RNrvuvL4zvktXMrkUkjFygbjyrFgP3Im37+t4HWJSqHYZXRqO8k1rS6czWkIbyxS9dO3eSqxO4n61WHKeu/Hd4jqQY+Fhi9gHQ7qudRsZfaUXTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtbwLlmC0gqFVaUF7zwbjie0H2D9NdUOa+5LdUby7xs=;
 b=ebT959TuTFy/YtKBjTh6IF50WPblHK0mwZnAqNX2MHLUPJlm8VA8FN3tDHLXVNXDthUI626wfW+n2KYOX+uJAExGSCcWcLddNPTipfSHDM+oO5FqUNYXTwD67cK6E94ujn7j4607W8od3W1Yfc/+rJL7Mx1mN84Ob1kDQn6tc1Xjn/IMIGFPk0AD0B21sOw8oI/6t4D2XwWPBdrOGH3eudt49kYjCum+vpZarat9d0iHsuNMGL40kSblnqLESwREcSU2rPBs8mPxDelRsZ8VeBLxBahjJr8hwLeo/NOiLlYBJBb1bovorxX3TZzVVrshHwOfIB54fZN6VkV11LwoKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtbwLlmC0gqFVaUF7zwbjie0H2D9NdUOa+5LdUby7xs=;
 b=FYNegkgMp/D5PAiTWSHRMATaRpvOT4PPNCgtv4SO9cy8YLoF8C2W1maVCzG/+9N7bZApKGR1IMFO5RHeZPX9uMAi24Ki7hMWSRMRYRH5v/hfCjc+eLfLK3k0fV/vjFhrK7kdNp4kPui9byMupWK5Xo151es2Qd2X3TcouHbBLxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 May 2022 18:20:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v4 11/21] VT-d: allow use of superpage mappings
Message-ID: <YnP5PI0zXKzWyM6a@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <c73ae968-44a2-08f5-df26-7cf9b4a5b1aa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c73ae968-44a2-08f5-df26-7cf9b4a5b1aa@suse.com>
X-ClientProxiedBy: LO4P123CA0316.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6adad69-9e0a-4c89-a43f-08da2eb32467
X-MS-TrafficTypeDiagnostic: CH0PR03MB6068:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<CH0PR03MB6068A2343D599F24481F72C18FC29@CH0PR03MB6068.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	73SSyg8ARZNwjOaZxvEc1nYddDS1r0geCLHWtWKFxZbBS4yF+oJpvhYuGF53ZMUMbvCKPujGYS3mr3tErjkOqDMP9e51Umqn8f90RWSO7Dn9aZsT/X/cnR9/x6hiB/YRphzMzB4XGiB2Ct5B8wSQLqOZ8iKRRMf7HYivZS2X66ra5JUbe6MrgO3Lhnb8uAMfRxsn1X4KN4qvZD2vEBY7p1gbw+W98s4VX41r3TdrlJHSCpPYpdptFAds88a92G13qG0ZcprSNeCHAL5XdVYDWDnMyuCOB0uWMPfyYhg8fP/pg1moRlelu6tPz7Y0W2n5qjjkOgQzs4D02dbW5rvFcIem+LtQkOT5HIJVaPgyrqO4C0SmG+et2epqOtejPQvF5E/B2EqLe3Ex9PgsbO8vR0I0Bx/u8NorASb8kq1oKqVubR49Z6NmYnAitoERXb1dlf3GhcxYHb3xiYPDiCDlfL4cFHX9P3x1z1rVaJVHAEnWjZ7881iE4oczdNkdo/XWe7AjBIywNj/gDSH4iZiIMw9BV725gX74M96Hwo7wkzZrguzjYwqKMbgsutaXWe1XMQhCGBsj9c1hbBlmhVG05fohPPfzNyPPKxzyOzNLiLJu4EmdDsbBftfgko/V3i3Sm/gUDJdQ9VGjjwdbPkFk/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(316002)(2906002)(4744005)(6486002)(38100700002)(8936002)(6916009)(54906003)(5660300002)(508600001)(26005)(66476007)(82960400001)(4326008)(66946007)(66556008)(8676002)(86362001)(6506007)(9686003)(33716001)(6666004)(186003)(83380400001)(6512007)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHRVQWMySk1ZNWVFMml5NTdJaERmNmtoZERCSGU5d2RrbXZ1WmlONERyVVg5?=
 =?utf-8?B?T3RNZmlGcHRtb0NIY0lmNzA1Rm9sd0pYamtCQ1VtdmM2UU1yRXVGM0JRQTJG?=
 =?utf-8?B?MDZ6WU41cVN1c2dxY3B6T2E5bXZ0NkFKUG1sbjA3NHVNSC8yc2phRHpsbldC?=
 =?utf-8?B?TjBudEFrdG9MUVVSeTBPci90SkhTVC9VL3hVenhoZVdGR2JzSDMzZlQ4Y3Zs?=
 =?utf-8?B?MitIZW1WaWNoaWM1Zkd1RTV4NWxoTzFZaS9aTmkzUmNTUzdpQmxSdGJZWCtk?=
 =?utf-8?B?aXpJcS94eUM5TVEvaUdJeUtWeG5Ea1FwSDRkL01MT1FmaWpWbmk2dS9lUUFZ?=
 =?utf-8?B?N09ETXV0SHExUFlSeTJyenJ2NXBPUTdmY2crYldaUm1sOC9HbHNQQUFaOFg3?=
 =?utf-8?B?eEdUUzFTWWNkbkZyTnRQbTVqQ2Z4M2phaEdYR1VOYTd5S2JqTnFYY0xPSm1J?=
 =?utf-8?B?VlJsOEFyOTQzZEIzNjVRY3VpRVRvQkxSeHZiUHdVM1ZQRWovOXdQa2NMWmk1?=
 =?utf-8?B?aGUzaEcwMkVEOEppWkVmVkg3WXZQeGJBaHJYQ2dSb3pmZHdFcm1BU1lvNFQr?=
 =?utf-8?B?bUsrcFBNYUFtQjd5b2hWSUk1Si9KU2dBVW05MUVYM3NzSDYrOXcrbExqMzhJ?=
 =?utf-8?B?UStjSFdSWERxMTdrOFZHZnVwVUM0a0dKQ1hPMDdmQTZveGhMU2krdlY2cXIw?=
 =?utf-8?B?SThiaXl5OVU4cUVFU0JQc3JSbUNpanNsTDBjcVJHeGlQbkhTVDR4cGJha1dI?=
 =?utf-8?B?M1h2R1VINnhyaVpuVVMvREFuYk5sZWNiZ3ZZKzhoTzQxL21ocnpKc0JuU0lG?=
 =?utf-8?B?bkFLcGMyRDQ4Nmx3anRDbVVIbStNMW1zeUs3TDlucHlHeXlKSGhvbUpwK0Ez?=
 =?utf-8?B?Qk15V1BwOXRmcXBQS2tVZHBhdkVMeWVTbys2YTNmSlBZanNOSE1EU1owYzJn?=
 =?utf-8?B?YkpNVU8xcElrY1FKUS9SRUlMa3A1bHZ6YjV5Z004b1pWckNIOGVGUEg5OEQ1?=
 =?utf-8?B?YXYvcGNINzNUbnR3QSsreURTUWNnMWo0NGpiRmxKSDAraGszc2t6aWx4aW9S?=
 =?utf-8?B?UllCUzVCTTMyQTQxWHFFeTBudUxkcTRpYVM1VGVtLzR1TktKWDdYaCszM1hN?=
 =?utf-8?B?bTFyZEU3LzNYMS9TZmZzb2ZpOVNnSGkzdmN2ckduQnZLczBobWYwVjhWQUNP?=
 =?utf-8?B?NjJpTTBxbE91aTdqWGFabWVDQTZNb1NBajdXZ2hxRFJTS1B6QmxNWmRWMjRx?=
 =?utf-8?B?bHliaEJIRFZ6ck4vV2tLdzJJQVBuaUtGNi9zbS9CZ3BlTW9VbHQvdDhKd3hE?=
 =?utf-8?B?cCtZS2pSQ1VNeHQxRVIyOFh6T2g0WFN4K1R3L0FVN0Fid3pCTWtmUFlybTJ1?=
 =?utf-8?B?RDVtNXhtamFNSVIxdG94TzhKelV4dGtHWXZlZ3RybkR4dXA5WmJzd1RiMmtT?=
 =?utf-8?B?alExMU1DWUZzYWZSQVZUSUhrKzQvQllBeFZ5V2VQVVhBN1d2NjdEcWF1RnhO?=
 =?utf-8?B?S0lsUjRVNkJqRmpHckIxa0RjaDhNUS8xN0lCK0lheWxJMlRZN3NtSC9kRHZY?=
 =?utf-8?B?eHp6cll6VVh4OEhQMVhhK2Q1eHN2ZERwbVJOQnFCaTFVRHdmT052a2ltQXFG?=
 =?utf-8?B?L29QMkFRdW9jbEIwdWhVTGJMOXpPMDd1SFpMNFZEQWRqbFRWditHOFB6VUhW?=
 =?utf-8?B?K2N1Y2lITFdLYXJGT2tQMzYrL3NhSkNVbjR1M3hCMVhpTUlDMjZzcmZndFN1?=
 =?utf-8?B?Q2NZbGtuc0FqYVZMbE9GbnpMQlErSHZDMkU3ZVpHY3Y5MVIvTnE3eW1tbW9N?=
 =?utf-8?B?NWhkcjVxMGZielM2OEpOZy90TlNmZS93UTVDTDMvS2pPc0w1Z0RKMERPbTM4?=
 =?utf-8?B?b0VKa0l4bDlWOTIrU3U0dlR1U3VBM09VUHZidi9EU05pNXEvSXg0VUVLNEpy?=
 =?utf-8?B?clkyRFR4K05oTnZnWktxWm9Jb3l5c0haMnMxR1NTcG9lZGpXTWV2M3psZkUz?=
 =?utf-8?B?Z3Nmbm5HYjV0amxoYjNSZHdJWjRlMnEzSEF1eDJ4L29qQUl4VVhOM1hpdmM3?=
 =?utf-8?B?ZXdrYWI2MlE4TXA4VTJKdytBUXE4amp5VUtyem8zL3BLbEpBUUNmbmlCa1NK?=
 =?utf-8?B?UTZ3dFpzU0h2bnJBL0FhVVo4Mm5wNVM0ZFB6R3Y5NXA5UmtxRUMvY2dyUGN5?=
 =?utf-8?B?NGhSM2VlT3hMQ0xZN1lUb0JNOG9iblVRY1FtbzU4QlJKR0FTZ0dVMVg3UkZz?=
 =?utf-8?B?dXl0c3RONG5GeVJuQlVlL2J4UW52T2IxYjB0clhuTk1OTHFNblE2S1RFdmhI?=
 =?utf-8?B?V0l2QmVtTHN2c2QvazdaMnJpMU1yaFZ3VXBVWlpFL1hOSWdzT0FQN1VTMlpD?=
 =?utf-8?Q?3OAhIqrhvTaBHSAo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6adad69-9e0a-4c89-a43f-08da2eb32467
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 16:20:17.2704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXwc/nEUf7N/HRRhIzK/8xX8PWqCbFAHaKZ1Vb6DzD54MvstKJZ3+t1WFguChNE/5CzDYGTRYkj9QUBG2gKSsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6068

On Mon, Apr 25, 2022 at 10:38:37AM +0200, Jan Beulich wrote:
> ... depending on feature availability (and absence of quirks).
> 
> Also make the page table dumping function aware of superpages.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Might be interesting to also add an assert that the passed order
matches the supported values, like requested on AMD.

Thanks, Roger.

