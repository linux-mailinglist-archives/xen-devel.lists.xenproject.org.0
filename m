Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188777808D8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 11:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585908.917118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWw2B-0002Kw-FA; Fri, 18 Aug 2023 09:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585908.917118; Fri, 18 Aug 2023 09:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWw2B-0002IB-BR; Fri, 18 Aug 2023 09:44:47 +0000
Received: by outflank-mailman (input) for mailman id 585908;
 Fri, 18 Aug 2023 09:44:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTTw=ED=citrix.com=prvs=587dba071=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWw29-0002I5-3R
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 09:44:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da4c3830-3dab-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 11:44:42 +0200 (CEST)
Received: from mail-mw2nam04lp2170.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Aug 2023 05:44:39 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB6861.namprd03.prod.outlook.com (2603:10b6:510:15e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 09:44:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 09:44:37 +0000
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
X-Inumbo-ID: da4c3830-3dab-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692351882;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LZUdv9m6GaSyVY7XvQLqRaZNI+y/RqohzYsHuK0PPTc=;
  b=K2dRuEsUgHmfC5RQ+6rQFmRe7/0tqfuX/AJsUITIsUVB2MC5+4f5jA7u
   oA/mVFSNHGJjzIvoaPIcNougaDYqgp6prs9fXSfMh0HMmEqwa9CMgECYt
   yuFHSg0y4zXaVS0+XC9hxQOFzLu5HJQXiH+ZqcCCM7qMQVh0u7oYAFJGX
   U=;
X-IronPort-RemoteIP: 104.47.73.170
X-IronPort-MID: 120314333
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:El8lNa19C6i2mf2j1fbD5f5wkn2cJEfYwER7XKvMYLTBsI5bp2RTx
 mcbXjjQafqKZTSmfY1/adjnp0sCsJ/TxodiTgVkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gxnNagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfMVxA0
 dglBBkxKR293u+zwon8EstomZF2RCXrFNt3VnBI6xj8VapjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6Kk1QZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqhANlLSObjrZaGhnWO/VRNFjcaSWG4//6CuGXjBNlgM
 UA9r39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTSoNTA9A5sa5pog21k7LVow6T/bzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:mlotI6ocNL1ahUmhojFbTK4aV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: 9a23:NUh5lm3T10t7pRgpieuDxbxfKv0rVlng4F7sZEKGUGtsSobSEX2U5/Yx
X-Talos-MUID: 9a23:HGSyQQl4wpTIfPmQDDeRdnp/D/82/Y6iFHoOz5I9ieLZaidPITu02WE=
X-IronPort-AV: E=Sophos;i="6.01,182,1684814400"; 
   d="scan'208";a="120314333"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbbT4H3GXwFDD0KEg9jJXQEjwrSBi8CrhVetv5JHYYAMCZX53XAxxxOcLIHxW/ewmAml5ayQNzZqDEhcfkFsewh+eiK6UIOwj+EE1rWPvNFamuxGXEMKdg0X6ISURaeSdKBgA3PoTmhVvlZjQgSuHeuGALjWancZltDW8rfA0276nZUSRm4UMU8tj9Iu0oko+524L1A3axiogNqc1m5fTOqZbTw8JEtMBItdz7Di1SCtJCyHJeWStGw5+Fajmt3dSKfzObMdaDU+XoRV/DIKttOtdTt20eNpLULL6RhkFIuPmVDEt/z9lOpKdFcHuwsRsGVcVgl+P+IsThYON3b+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkkICFPreOaQveNDAg4ZJAP9zGfSiosFc50pt6gdbsI=;
 b=f3Ur3U5aYx+afFCNV0K+v8rmi+qrNF1hXBrEkQvL+G+iZ148Ng78+nGmd1UVvJddiIo5SGw/RcM7PAXqm889oxuvDnMks958L0JPYo9eWD78KpJ7xHGHtfzI/J5GoosoHHwpQBrQbJPbHiF1r1CYwADVp9n/05eoO2E52B3hgO2u/n0T40P+Ax/q2q5Jjz5NHK10oc2baFifmcQPOCVtr1eS0pGmLOOF54++a08znFfXpcF4bE+94FRwQuOy3vbw8o6Bkw9RdN6BQV+m1m4BAbOAUmiYr52HgH7ICm+Yaxl10Xq9JZG6z8Hje3eUbTOVIj+7+PmwxA9NMnJ4b+k+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkkICFPreOaQveNDAg4ZJAP9zGfSiosFc50pt6gdbsI=;
 b=P3Pvjvx11vy4em6beOiUh1UU1pFlXyBlahIxv3ufCu5Hb4yMyiOm7lH/XlmwOJWijlvTfvt2gVB8KVzS1O5vtBJlJOld76TY3RcbDVgzVWmyj9HyiceK/UnIIxYOaBYE2Sw4MDq6KKb75ypXvcKKn9TNJSz7imkPO+8aMlr7Xs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e5f790ac-2f8d-7da8-8e6e-5691615e7d59@citrix.com>
Date: Fri, 18 Aug 2023 10:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] rombios: Work around GCC issue 99578
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230817204506.34827-1-andrew.cooper3@citrix.com>
 <622e33b5-7fae-ba1e-0100-667cd9b50ceb@suse.com>
In-Reply-To: <622e33b5-7fae-ba1e-0100-667cd9b50ceb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: db0ce52c-b020-4787-dea4-08db9fcfbc0a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mDwhUqcqRciCkQyYfN5LkkaqwdlL7vA59Ys5nsFd4nkn5/n0z1sm41PV8P/yDj5RWejK+uk9L3EEgijXEdFbsMi1Reaq8PvQXBFpOvDWBsLhiAcXur3XxSvVyXrkRwSsR8R1vN30knTHmRes/fW4FmJacDXViAqSyXK2GINjSfrsX3e0S2Ud8T0fyqpnlc+3Z/yAspduk1rAe+lz+dqCPYXDTeZ5yg0qzt+QJaqjOdpr0nbaiXpsgPdy3CS6K6pojseaR35sphHiXrwRNsllIOT/lTf2NRguIBH9hItqOwahv9VpKbAxKUM/arXKdb6Fr8NkD7EqmxnsNaoY5PX8LNfPoHBZLeupubZD9PtkKhP2ze508eCk44d8WG5s7wARHcRrrRVdR5gGkKp3qvX4rIur93K8/ISpm2koyJEXvP0bF7Uct0teZzfxUYcNit5a1CrVc7F9R/Qc6Xs/qLkfCeHfvX+98cyWIDN2r231QEXDoxpHaG+jgYkj5rMdDYBncN3ZoGEXWRruQu/yM9KgWke2YpWBu5f/jLFNLX7g+tzxxNhnuEHyyVBD/YygCbGyMFoZasuWkZePamuwXTLeRg26jOVSiUDl/0I/JSuZmJYNKtv1QOMFwyKGrfnmKLxNR+68YNTc66ZLAyR4x51wJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(451199024)(186009)(1800799009)(86362001)(31696002)(36756003)(31686004)(83380400001)(8936002)(8676002)(4326008)(5660300002)(2906002)(41300700001)(26005)(6666004)(6506007)(53546011)(6512007)(6486002)(2616005)(478600001)(82960400001)(66476007)(316002)(6916009)(38100700002)(66946007)(66556008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elA2WGhXeDRjUXVZNEFkbXNQU0JrQmhJS3VzV1I4MEZMNUJ1MWcrSE5tUy93?=
 =?utf-8?B?S0Z3Q1lGa0xFTnJKeVUzS01BNkluRE1jUlJiVDUxb0NYSHpxWGF1MC9SZkJq?=
 =?utf-8?B?NmVxMStZVG52Y0JITkVKVnQ2NDJvaVlxays1eDNxN1duc3VrM0Y3bmxock5Y?=
 =?utf-8?B?WjAvY0VTOEtmTkhvdnlMc0RHNVhGbDZ6MFlWZHNRdzRHVFRuWS9oSHFDSWRD?=
 =?utf-8?B?NWgwcy9RZStVbzUyYkV4OWdKdVJINXJYTzRBSWlQaVBQMlh6Zk5jWEZaV3Zp?=
 =?utf-8?B?TFBCb3NaaFBGNEdLTjhjTG44NkJUR2oyb3ZaUHNMa1FkbGZKTUNiVHNQR2Rj?=
 =?utf-8?B?TU9ZS3VoZmFGRUhhaEpKaEpYSjVRdlBjVUdvK0dBN3BhUnE4Ty9sQ3VuOEgx?=
 =?utf-8?B?WUUvRFlRSHU3NU9mZzN3eHpmRmtaRmFKdXQwajIrcDY2ajJKVEZ3M1dwUnc1?=
 =?utf-8?B?UVkwdEU3dWdOTFkzNzBZU2FSajNWQTF4L1V2a0lZUjJLSHpuVnlRR04rN2N5?=
 =?utf-8?B?VnNhRGVNQUJwU3cyZVJFeCsvamNvQTlFUnp3dVFMZnlZYVEzMngrR3lwank1?=
 =?utf-8?B?cXFrTHNFY2o4d2VmT2M3amVJalZpaW5vays3OHg2Z240MkFpYXBmUWxOYjhY?=
 =?utf-8?B?aGdJaEtJUUUzUHVFTGNEQXgySFVjaWdicVYrUXdwVStGTHVhQVZyc29KSDZ6?=
 =?utf-8?B?UEtvZVlpU28yV2J3UXlwSmUzYk51Q3dsN3NHaWI0Mzg1Wm9iZXFNdlZUc01X?=
 =?utf-8?B?L3JCSk1DeGNHT3I0MUx6V3h5YXA3TmVoZHUzYVA0SnJ6ZFVidUFIYmoyTHRm?=
 =?utf-8?B?cTRsOVVSRzA2TzR2azV1UlJRUjFWWDNsenZyRWN2ZVk4NVBKQVpmOFY1RHFa?=
 =?utf-8?B?R0Z2RDl0UEh6R29DZko2L202UDY5M2ZlU2xPcTU5M2E4Ky9DTlMyenh6RkpG?=
 =?utf-8?B?a2JNcEJocG1PaDhhbFB2MUZhbWdEVmkvS29iSUZkR3l4bGZJdUpZbzVZY1Vr?=
 =?utf-8?B?NUg5QkpCRmtpUFJGRXorRmtGRjVGUTZXS2tuaGw2TzV0QTFMdEpOd1pMVHV3?=
 =?utf-8?B?T2oxV29wZDdKN050eU14QUl2YXRNaG9NWi9VL01QWUpQSE5NMU9qakQ4dWRV?=
 =?utf-8?B?R1REWFBhMUVIQVBkOFR5aXBBajRCMnRPWnZ2RHVJRURpL2U4MGUvVFhLeVBD?=
 =?utf-8?B?SXYyeitrQW13ZjY1VnRQNXJYZEw5d1VKejNhOU93b1VvVGEwNnU5WUV4em11?=
 =?utf-8?B?Sy83TjlGZDRmMXIralZ1RXVLM0dERnlubW5SdFZWRUU5NkQ1TTdyTDljVlZ6?=
 =?utf-8?B?MmVZazhjbS9WT0Z5UStKOTZBSlZQUXptZXRvVFgzL1NWK09UR1pTNzVZeWhN?=
 =?utf-8?B?YU5QRDJZTUFUeUdNQ0MzUGFUa1NMTkN6RXg4NDRLTFVWZ3NqeVRUOXBRN3lP?=
 =?utf-8?B?bytUNkI0bFJ0OGw0Z2tQWlZ1OEtoMUFSZ1Q0RjQyVW9hNUxQYjhRN0VwZVpn?=
 =?utf-8?B?UlpPeFlrN0xHbXBwcFFBVWFiQUdMbU9DYjc1eUQyMmpOaUY1eW85Y21hc1Zq?=
 =?utf-8?B?WjFuQ0pTM0Ixb0FObFdjNU0rOHlaalNlV3pXUm1zTHJueHlwZXRhcHA4MGJM?=
 =?utf-8?B?T2lxZE0wd3IzZ2kvK0VRY1ZRbDNIbUY2MVY4NW9maVpSekpQZ3JxRTZlZFZ3?=
 =?utf-8?B?TjRmd0txc3dQTCtEZThUUmtTYkJLdWZXTitNeTRTUHZsVkhSQU5IcGJkRHg2?=
 =?utf-8?B?YThzOVAyZWFONnFiSWtYaXM3UHdQdFg5NlNlaGpsRHV5cWpBZ1NndUZEQmpT?=
 =?utf-8?B?dWxIVjMwUXhLcnpjSTl4ekphZkQyZXB1QWt0RzZhSlVxZ1Q4SlltclAxT3hn?=
 =?utf-8?B?TGJydFc5MnlBaFhtQ1ZveVJxci9MUFVpdm1tNWtpeFFsTzltbDZhcU9Fc3hm?=
 =?utf-8?B?UUJLSHdiRVdyWEZpWHN3Z0toRE5FVUtNY0lpQUdUaVpROHgzWEsvOEkzaGRX?=
 =?utf-8?B?ODhnYkZmRDhZWVhvalBYVDBsQndtQmZ0YlFrUWxPWENYSWc5ZWIzaS85UWgr?=
 =?utf-8?B?TnlGaVpRekNja1ExK2JKc1FMcW1ibDltY1p2cDNRaGdoU2E2MTV2WDM2YmY3?=
 =?utf-8?B?WEYxUU41MXZ4SjJKZ0gyNmN6bDdxcTFFYzV4UGdFNkpBc1FDcWxkZUlVQXRV?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ql137rDUCl8HUKEU/Iu9RIqxPqvSn2gMGCCmcwjPMJaj5jebQk2G343iljfEbhEOmfyfr/QS8XS+ZanPWonqANB2rosMtT/z0+KdVgkZs7R1yG/82I2Xsiz/aPXPw6NMHZViUBLwOOrs5dxkLv5SJkNYG5MxAku+eYM1Hi0AuQIMLOrM7tCPM5ARqcyG8Yb7DdiLCRTFnp1b5hfP/W3ZDCowAAlWpGYIuadSKplkhsHxD8SuVpFpks/nBmzb1ODclxKBs5Ty8VxjlCoonZaW73WNQz6GUb2vnhBq0YoKSO1bRHudFaNVMBljymIGStpNlfxW+pEzCy0CAjSdZVAmn5lGflSmDLRo2NkeQGZgd4I+3gJ5cpk0IOwdisSQhQNHv6oYCDkdiy9sBw54uTBWu99dkAmdnrKVypDoAnASR1cFeEN0wgPvwsUqCZR7VxHFGPyij5wnjBDloJFFCp1EtD2mqcYvR+qppfpvuN8XrN0JxGFsHQshHBemQKgpyONNhQpLidCiMhZB2iLBFAA9fqc6rLvEKk4/STZLRLjBPDHfPVlMOkIf1Gvr1ZEcKcdB2bJTEHi+iCg2EgtrD/n2zvauwYGfOb3tTI7TL6BLQskQUfS3/qvINNLRGyLc5OkLF6zr6PlB/wdtxTV5zDRfDdW4/OQk8ZqW/tBvYbrOsLmNBNHr265Lb/B27BycbGWJDgT0nkGDRg59nSgGHt0L2CNB5031epEKPScgRE0lrin8AmXzu/nN9BNDihRqqZNNK21/IKv8lU070x6BDARrqyrDzY0ocNRFv/+PqXyzfHfUrVtV4hlEVbTW1OkpE3Ia
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db0ce52c-b020-4787-dea4-08db9fcfbc0a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 09:44:36.7958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fy0t3RwOXzlSOPaMowKHEQ4XqljOX2nsl+bKIl/CpGt5enHog1OpYNtZZwX4vX80cDwaTCnpmryeoNs5hgx0IWpzjQf7BFTAVwH8IdwhHKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6861

On 18/08/2023 7:50 am, Jan Beulich wrote:
> On 17.08.2023 22:45, Andrew Cooper wrote:
>> GCC 12 objects to pointers derived from a constant:
>>
>>   util.c: In function 'find_rsdp':
>>   util.c:429:16: error: array subscript 0 is outside array bounds of 'uint16_t[0]' {aka 'short unsigned int[]'} [-Werror=array-bounds]
>>     429 |     ebda_seg = *(uint16_t *)ADDR_FROM_SEG_OFF(0x40, 0xe);
>>   cc1: all warnings being treated as errors
>>
> Yet supposedly the bug was fixed in 12.1 (and the fix also backported to
> 11.3). Did you spot anything in ADDR_FROM_SEG_OFF() and this particular
> use of it that is different from the patterns mentioned in that bug?

$ gcc --version
gcc (GCC) 12.2.1 20221121

At a guess, only a partial fix was backported into 12.1.  AIUI, it was
an area of logic which had already seen significant development in 13
before the behaviour was reverted.

The only thing interesting about ADDR_FROM_SEG_OFF() is the constant
folding required for the expression to become *(uint16_t *)0x40e, which
(I suspect) is why it compiles fine at -Og but fails at -O2.

>> This is a GCC bug, but work around it rather than turning array-bounds
>> checking off generally.
> I certainly agree here. I guess it's not worth trying to restrict the
> workaround for rombios (I will want to try doing so in the hypervisor).

Can I translate this to an ack?

~Andrew

