Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A3035E0D6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109829.209712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJdm-0006SY-E0; Tue, 13 Apr 2021 14:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109829.209712; Tue, 13 Apr 2021 14:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJdm-0006Rm-9n; Tue, 13 Apr 2021 14:03:42 +0000
Received: by outflank-mailman (input) for mailman id 109829;
 Tue, 13 Apr 2021 14:03:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJdl-0006KX-5I
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:03:41 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02147ad1-c3de-48ca-8106-a6755cb7693f;
 Tue, 13 Apr 2021 14:03:39 +0000 (UTC)
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
X-Inumbo-ID: 02147ad1-c3de-48ca-8106-a6755cb7693f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=y5+wq5v92xJaRWVBJA3GfnjlX1XmtbKxgDkEMUjd/7g=;
  b=ZBzbBoLw7qUwCwwxaYsH/pxKvPxjI6LrwoMrf7O3IS0cqh2qRI9dp7Cy
   6vQ8R5XA9qYvmDz6lmWGbyu97nDP3/G0z43+uy+pk9DgaHqhOMs8M1jkM
   0Cfrdu1v+HkZIfPP5waf1tKMXkoQAPoC+L1mLqqz2VuoIGZ3Y+H0lg9wt
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CxjGfYuM1jq6+8dncgah+SBVUc8hssM40RcThgFGL8K0u1z9MCHjKpvKpa8gS8XtKdklvjEkwm
 /F9PQY4IDbmaglIRpMR3eg7Uw0ByVs1iS92vLl+o3tX8rbXfLaoSN7PZPd2pB63i5LSORav+bu
 KPuMMGPMeNTtk4uH4TIRCOXQDWimWqg+8SwSoHvYWpX+fhK7k7jI3lKgFkB7snrASnWG2piv01
 ON+wAId+VKAr28GKI32dgw2D6oo/zzZnNuWRv0e6VgI0n5Xbzqkqut9xnl/TJrhlNSAFZIZFbB
 Z8w=
X-SBRS: 5.2
X-MesageID: 41322412
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:elh6cqj7ZxQ6f4HiewMU9HpWmHBQX19w3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+YsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmuZ
 tIW5NVTOf9BV0St6vHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WZEIyywe3cGIDVuL5w/CZ
 aa+457vDKmY3sadYCWAXMCUujFqbTw5e7bSDQBAAMq7xTLsCOw5NfBYmWl9zo9cxcK+7ct9m
 DZjxf0j5/Mj9iXwgLRvlWjiah+t8DmzrJ4da6xo+gTbg7hkwO5ILlmMofyxwwdhMGKxBIUnM
 LXoxEmVv4Dm0/5Wm2uuxPi103B/V8Vmgbf4GSVi3fivsD1LQhSY6Eq5fM7A2nkwnEts91m3K
 VA03jxjessMTr6kDng/N+Nbhl2lyOP0AsfuNQOhH9SW5Z2Us43kaUj+ipuYfI9NRO/woUmHO
 5yNdrb9fZbfHiLBkqpwFVH8ZiCWG8+EQyBRVVHksuJ0yJOlHQ89EcAwtcD901wuK4Vet1h3a
 DpI65onLZBQos/ar98Pv4IRY+SBnbWSRzBHWqOKT3cZe46EkOIj6SyzKQ+5emsdpBN5oA1go
 79XFRRsnN3U17yCOWVtac7sizlcSGYZ3DA28te7592tvnXX7zwKxCOT1gojo+Jv+gfOMvGQP
 y+UagmQsPLHC/LI8Jkzgf+U55dJT01S8sOoOs2XFqIv4blMYvvmuvHcOvCBbbkHDo+M1mPQE
 crbXzWHoFt/0qrUnj3jFz6QHX2YHHy+pp2Dez78oEouc0wH7wJljJQpUWy58mNJzEHmLcxZl
 FCLLTulb7+gWG3+G3P/lh4IxY1NDcQ3JzQF1dx4SMaOUL9drgO//+Ff3pJ4XeBLhhjC+TbDR
 BYvFYy3a6sNZSfyWQDBrucQyynpkpWgEjPY4YXm6WF68ugUIg/FIwaVKt4EhiOMQd0lwZsoG
 JqcxQFWUfbKzPrhcye/d8pLdCaU+M5rBagIMZSp36an16bv9sTSnwSWCPrbdSamj80Rz1fhk
 R49ogWhLboo0fpFUIPxMADdHFcYmWeB7xLSCCIfp9dlLzQdAZsdmuSnjCBhxYvem3lylUKig
 XaXF6pUMCOJmAYlmFT067s/l8xTGmbck5qQl1RsIF2Fw39yz1O+N7OQpD2/3qaa1MEzO1YDS
 rMZiEKJBhyg/qt0gSOpTqEHXI655knM+DHFo4/e7XL1n7FEvzPqYg2W9tvuLp1PtHnteEGFd
 +FcwiONTXiFqcH3ReWqntNAlgDlFAU1dfTnDvr42iz0CRhXb78IFF6S6oaJN/ZxW7+XPqM2I
 h4i9VwnebYCBSEVve2jYXsKxhEIVfvhETzaccCg5Vdp7gzu7t+BIOza0qB6Fh3mDEFaP7pn0
 YfSplh6L/POoVTb9UfEhgpi2YBpZCqFg8XqQT4De81QEE1g1LaN92P5aDUqbBHODz3mCLAfX
 2W8yhQ5J7+LlO+/I9fL6I7OmJNbkcgrFxk4eOZboXVYT/aPd1rzR6fMnWndqVaR7XAMbIMrg
 xi69XNu+OMbSL31ETxujR8S5g+vlqPcIeXAAiWH/RP/MH/EVOQgrGy6Mr2tQzJc1KAGg0lrL
 wAU1cRYMRFgiQji4Ny8hHacN2JnmsV131E4T9mkVbx3JOB+2mzJzAeDTHk
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41322412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2JvE0+ooWjkoP4e95ADW87M15OBVrGy6sw408MBCeoy3tNmm7tKOjfqw3pS356UDXjpB9PMPmTytxZ5TonYzgO4A/TlXdqWQlGXue9hz6nLFrngPFg55Vr7D+Qk4o/e1CDThaoUhF18iGyD3Qt82tFlnM+5oUPT5aC5d73u/ePscoZKEXFFeBP/bFfQ1PwYp6RQiLkq4jmZ7fVHjR+tRRh3h5cFw3hwjB8LVAV6yhM53L1oW/uoFHU5dQ/eQMXDMI8pAteGyzkSz8iaedZ2g71cJeFabVAI42c8kf9FPPkvTDR3pLgwUYx8bWPsMwvbKnQuzFrl8x719TFGk61N3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhDbUZkOllUWicuxg47GICno5ICsaetEMRtEl5iO2+0=;
 b=BKgnFeQa8/RVaVfkH6gEuL7rPWsNxtvv9MI2UlNgwQZRF6ofbv7SVAYNdc20vHlAjT71OhhGb4fLcTlRk3OjyJRSN65LNGkYNZbKNarhq9YsrroE/X51K+GVsIHT+YklYFrwU1h0HTcG6Y9xWLtiNvaTh7AjCxYZ+0h2kOPyMIeEYzMrZNT4vAZGGX28GEuxESlcFFijlxneiKQLIq48OkAOshxzhunmc0tBc7LdC91DDJNMZi7zbK2b3pluxDOLQhXN3h/VZboYHOuFF5DFow56jo+bltexGDLPzJeAT5Ez1AMBa+KxvUxQiO6yli5aV+aDbcIjY060DqY8BNrAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhDbUZkOllUWicuxg47GICno5ICsaetEMRtEl5iO2+0=;
 b=IFTJdP5kdWdvX1DO/Yw2nJIuP9le24n1HeV/+CaxNUp8Wxrea9N6DvUJsYTprC4xJC/DBXb9LC0kGsCbz3pIJxlG6TQICybF9/joiEKK8GZf+9hGYSQ+VRn0vh+FfKm6FM5sWW4bWLyMLyCi5J8VWmhk5O/MaAoAsX0+LgT1rEo=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 18/21] libs/guest: rework xc_cpuid_xend_policy
Date: Tue, 13 Apr 2021 16:01:36 +0200
Message-ID: <20210413140140.73690-19-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebbfea3f-dcd6-4205-08a4-08d8fe84eef3
X-MS-TrafficTypeDiagnostic: DM5PR03MB2969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29699EF24F8BBA1366D96FEA8F4F9@DM5PR03MB2969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BNb3tyYF9AEA2J87W+GYK1OEjjC7FUwqNAjYvUC66HxgD76ltkDWvU53LETwA0G0JQTpfHykJaMZjsFR9OUawuSs9cC6bV5A5UliuRcZoYOAx68z/LMif2p1tIonFfU3goXmPLmLUEJy0q0SIPKFEAZafmVtIJ90/z6PJGx2v0MlJJxDFEvtekkYi2aoJSgrFE0kFBRSXsoD6Z1vm9DTOzPTgcj0A334sQKC1nGGfxpSlbkDV9/5FiN8VXlZUyCrz15OaXe0CAM2gls2XxqoYKTR8gEbTUVYiselUu0uXedYzsyq2r6jXutv3JQKUnrEwuMJgvkIoUMhR5nbGdmiLw3/2hs5Fux4DdfMkZdwFXa4cEp+NqxsntuDfNJ1s/L94nRvn6hIBAWyocwpSVhCMRHfE3yyPtCbhjA+0ctdgAs5vPcyZ98KZb0Yfts0Wt7LsOuZr9u6rXX7oV/ivvZvVMjUIFa8Rh/pGP3CVcazfXkqBeL343q3DdyVTP+0/FgIPdeh4+6e7Q5R8XBPCHgk1+Z+pRlXZIiIr4oYC2H3D3BeJHV1xyqKZs3e2c01qGZqtWMO6B6xawJPTlIP/GY2+YBFPRVN3gmP/fmqRgZ82dM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39850400004)(366004)(83380400001)(186003)(6496006)(316002)(2906002)(4326008)(36756003)(54906003)(6916009)(2616005)(16526019)(26005)(478600001)(6486002)(1076003)(8676002)(8936002)(5660300002)(66556008)(66946007)(86362001)(66476007)(38100700002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c0Q3REtUajhLWUtoYWlJZ3NJNW5UejVZWUthTzE1U2kyeW9BdnhMU1pIeWRM?=
 =?utf-8?B?c2VMNG1qS3RjYWNvdlRxcXM3djhpZzh2TTM5U1N0akRRQzJvL0FSc1NBS2M4?=
 =?utf-8?B?Lzc4RUQ5SGxtcno1MjNZOUtxMkpMSnhtY1doRVdlWkZRK3QrTnRnYkJqR0J3?=
 =?utf-8?B?a0NLbmhzL1hBZmMvSHFmR0s4Nll6dktJc3VEenVmbjVFSUM2K0ZjREhNcEt1?=
 =?utf-8?B?cmNSdlQ0WWpJYzl6TnBWSGljY0tmdG9sbkRmRWtyWng1ZlI1Y1RHMW5aUE0z?=
 =?utf-8?B?VldwQ1Roam5jNSt4RTN2YzRhaXNlVzRudk0xbzMvZWtCSnRFSlZHOENvSTBp?=
 =?utf-8?B?dWVzbUVQSWpZTVhKRVYzaUlpWmZsWEQwZm5sUnR2WXR6VHVleEJ5MEpWZE5T?=
 =?utf-8?B?QkVycEZOZkMyYzBMVzRacHNUUml6TXo2ZWxLVUVlZkZ1MHp6NWVTci9wSmdr?=
 =?utf-8?B?VXplYlp6VVN4ZTl3ZTl2dGdnVjdabE44ajd6Q0dETDJ3SjlzRGRXTlNQVDJv?=
 =?utf-8?B?MndpbUxYTXBjMGp3ZDlmR2JQMlUyZzEwdHNEQ1VKRVhsYStIbXk2UjRMeEcx?=
 =?utf-8?B?MzRIZS81WXQ3S2VTUmx4N3FVWG0ybHdCSjdSZDViMnpXaXlHaWZ1WExqaTdK?=
 =?utf-8?B?RENTdTA3QmhtazVXaXh0enVpV2RaQTI4STVQUkxIMVZoS1hGOXZQeWFpN05I?=
 =?utf-8?B?aHM1aFlsNGhLTGRaaDRMWTBhb0RDbGIxcTIxZTgzZHp2a3VDYUcxZ2dZTW8v?=
 =?utf-8?B?OGsyZGFLMUtoTWxhdDMxMk9zbVQvVktqN1VtTkxIdUwvcXYrRWFzdUp3dmt6?=
 =?utf-8?B?UlJmckxaT2dtY1J4N0xPMVFOZDllSFZjTnVjUlBFNkRCTTdxUmJuWFd5UGI4?=
 =?utf-8?B?dk5MNUR4ekhSTjRHMUljNXl3L0ZQU1NoaEZMcFgvTFdIcVhKczVBUkZKTXFo?=
 =?utf-8?B?Y01YdTFzaVczT0pyUUtRcW1HVjNrYVpMa0hqMWVLbCs1KzdrdUU1aUJEWXNT?=
 =?utf-8?B?bkZJcTZHcXl2ekY3UWhFNGNqWHVOTC9mOFBmMmRNOWdUTmhsMTluZHdCdzFz?=
 =?utf-8?B?Y2JKMjZtZ25xdGRyaWpjZkRpQnYrcFB1OWdJcTM4ZWtIbGdLaWZaTUlQVDhy?=
 =?utf-8?B?N0g3Q04vMyt2bmFXSXF5QXh4ODh0T1pzUzJFU21WQVVoODhjKzRvUmh4VlZE?=
 =?utf-8?B?M0tPRStTcDBYM0dpSVhaLzMxcVVwakQzd3NBTVlFNUlRaFlmY2dMQ1RKbWJR?=
 =?utf-8?B?dnRBZ2I5eWd3dHd1Q1ltTmZGOHB6Wk1NT1hpdDBoTG9HaTRmSGNEWW5PRmRS?=
 =?utf-8?B?WXdVWHIwclVNVEJibEQvc29RangzWVFXcVYyN2ZUUVAxcDY2Z1V0Y3RlY3pz?=
 =?utf-8?B?bUZZc1ZPTmNXSFdkczdxRXgyb0YrbWc1TG9Ib1EydEVZMngwVnRPc0VwWFdj?=
 =?utf-8?B?dnlHOVprZHZESmhDdUxlZDdTc0FETnMxbHMySm1UaUdDZjhRYy9UOHBqendM?=
 =?utf-8?B?V1YwOExsKzRqS0g5d2QvaGx4N2duYVFLbXYxS2VBenRHMjhCT0lPdVRDUHZs?=
 =?utf-8?B?UnMwMk9KSFNzamo2eHVRV1pPUlZNOHBJMUZCZ0VNVkd6OWRGMFJwcGdLZmp6?=
 =?utf-8?B?Nmc0RVBJZ0FmbUZPcWpQbk1USnNQY3o0aWRHTW96dFNRWnVKaFQ4cVdVTFZP?=
 =?utf-8?B?VCtEZkE2SmE5QUVhaXRpR3lWV0MyMktmMUMrdzhFY0dKYkQrRHhsaXZGdzkv?=
 =?utf-8?Q?UetrT9WXuQGW6wsjn1FL9uUptLrtfdCtp7PJHmL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbfea3f-dcd6-4205-08a4-08d8fe84eef3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:03:37.2237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdQI8/0ShcO5vCUU8yRqMfMDVCB3C5aTDBNgAFguYRDA+o331dnaqHZgS6i1LUPfPHU8/nqZfhgN4a+ZBLXy5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2969
X-OriginatorOrg: citrix.com

Rename xc_cpuid_xend_policy to xc_cpu_policy_apply_cpuid and make it
public. Modify the function internally to use the new xc_cpu_policy_*
set of functions. Also don't apply the passed policy to a domain
directly, and instead modify the provided xc_cpu_policy_t. The caller
will be responsible of applying the modified cpu policy to the domain.

Note that further patches will end up removing this function, as the
callers should have the necessary helpers to modify an xc_cpu_policy_t
themselves.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |   4 +
 tools/libs/guest/xg_cpuid_x86.c | 182 ++++++++++++++------------------
 2 files changed, 84 insertions(+), 102 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index ec184bccd3f..ce0785f7654 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2635,6 +2635,10 @@ int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
 int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t policy,
                                   bool hvm);
 
+/* Apply an xc_xend_cpuid object to the policy. */
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
+                              const struct xc_xend_cpuid *cpuid, bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 83cd71148f7..06e3e8131d7 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -288,124 +288,107 @@ static xen_cpuid_leaf_t *find_leaf(
     return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
 }
 
-static int xc_cpuid_xend_policy(
-    xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
+                              const struct xc_xend_cpuid *cpuid, bool hvm)
 {
     int rc;
-    xc_dominfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    /*
-     * Three full policies.  The host, default for the domain type,
-     * and domain current.
-     */
-    xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
-    unsigned int nr_host, nr_def, nr_cur;
-
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
-    {
-        ERROR("Failed to obtain d%d info", domid);
-        rc = -ESRCH;
-        goto fail;
-    }
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto fail;
-    }
+    xc_cpu_policy_t host = NULL, def = NULL;
 
-    rc = -ENOMEM;
-    if ( (host = calloc(nr_leaves, sizeof(*host))) == NULL ||
-         (def  = calloc(nr_leaves, sizeof(*def)))  == NULL ||
-         (cur  = calloc(nr_leaves, sizeof(*cur)))  == NULL )
-    {
-        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
-        goto fail;
-    }
-
-    /* Get the domain's current policy. */
-    nr_msrs = 0;
-    nr_cur = nr_leaves;
-    rc = get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
-    if ( rc )
+    host = xc_cpu_policy_init();
+    def = xc_cpu_policy_init();
+    if ( !host || !def )
     {
-        PERROR("Failed to obtain d%d current policy", domid);
-        rc = -errno;
-        goto fail;
+        PERROR("Failed to init policies");
+        rc = -ENOMEM;
+        goto out;
     }
 
     /* Get the domain type's default policy. */
-    nr_msrs = 0;
-    nr_def = nr_leaves;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
                                            : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_def, def, &nr_msrs, NULL);
+                                  def);
     if ( rc )
     {
-        PERROR("Failed to obtain %s def policy", di.hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto fail;
+        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
+        goto out;
     }
 
     /* Get the host policy. */
-    nr_msrs = 0;
-    nr_host = nr_leaves;
-    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
-                               &nr_host, host, &nr_msrs, NULL);
+    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
     if ( rc )
     {
         PERROR("Failed to obtain host policy");
-        rc = -errno;
-        goto fail;
+        goto out;
     }
 
     rc = -EINVAL;
-    for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
+    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
     {
-        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur,
-                                               xend->leaf, xend->subleaf);
-        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def,
-                                                     xend->leaf, xend->subleaf);
-        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend->leaf,
-                                                      xend->subleaf);
-
-        if ( cur_leaf == NULL || def_leaf == NULL || host_leaf == NULL )
+        xen_cpuid_leaf_t cur_leaf;
+        xen_cpuid_leaf_t def_leaf;
+        xen_cpuid_leaf_t host_leaf;
+
+        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
+                                     &cur_leaf);
+        if ( rc )
         {
-            ERROR("Missing leaf %#x, subleaf %#x", xend->leaf, xend->subleaf);
-            goto fail;
+            ERROR("Failed to get current policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, def, cpuid->leaf, cpuid->subleaf,
+                                     &def_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get def policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, host, cpuid->leaf, cpuid->subleaf,
+                                     &host_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get host policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
         }
 
-        for ( unsigned int i = 0; i < ARRAY_SIZE(xend->policy); i++ )
+        for ( unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++ )
         {
-            uint32_t *cur_reg = &cur_leaf->a + i;
-            const uint32_t *def_reg = &def_leaf->a + i;
-            const uint32_t *host_reg = &host_leaf->a + i;
+            uint32_t *cur_reg = &cur_leaf.a + i;
+            const uint32_t *def_reg = &def_leaf.a + i;
+            const uint32_t *host_reg = &host_leaf.a + i;
 
-            if ( xend->policy[i] == NULL )
+            if ( cpuid->policy[i] == NULL )
                 continue;
 
             for ( unsigned int j = 0; j < 32; j++ )
             {
                 bool val;
 
-                if ( xend->policy[i][j] == '1' )
+                switch ( cpuid->policy[i][j] )
+                {
+                case '1':
                     val = true;
-                else if ( xend->policy[i][j] == '0' )
+                    break;
+
+                case '0':
                     val = false;
-                else if ( xend->policy[i][j] == 'x' )
+                    break;
+
+                case 'x':
                     val = test_bit(31 - j, def_reg);
-                else if ( xend->policy[i][j] == 'k' ||
-                          xend->policy[i][j] == 's' )
+                    break;
+
+                case 'k':
+                case 's':
                     val = test_bit(31 - j, host_reg);
-                else
-                {
+                    break;
+
+                default:
                     ERROR("Bad character '%c' in policy[%d] string '%s'",
-                          xend->policy[i][j], i, xend->policy[i]);
-                    goto fail;
+                          cpuid->policy[i][j], i, cpuid->policy[i]);
+                    goto out;
                 }
 
                 clear_bit(31 - j, cur_reg);
@@ -413,25 +396,19 @@ static int xc_cpuid_xend_policy(
                     set_bit(31 - j, cur_reg);
             }
         }
-    }
 
-    /* Feed the transformed currrent policy back up to Xen. */
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto fail;
+        rc = xc_cpu_policy_update_cpuid(xch, policy, &cur_leaf, 1);
+        if ( rc )
+        {
+            PERROR("Failed to set policy leaf %#x subleaf %#x",
+                   cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
     }
 
-    /* Success! */
-
- fail:
-    free(cur);
-    free(def);
-    free(host);
+ out:
+    xc_cpu_policy_destroy(def);
+    xc_cpu_policy_destroy(host);
 
     return rc;
 }
@@ -439,7 +416,7 @@ static int xc_cpuid_xend_policy(
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const uint32_t *featureset, unsigned int nr_features,
                           bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *xend)
+                          const struct xc_xend_cpuid *cpuid)
 {
     int rc;
     xc_dominfo_t di;
@@ -563,6 +540,10 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     *p = policy.cpuid;
 
+    rc = xc_cpu_policy_apply_cpuid(xch, &policy, cpuid, di.hvm);
+    if ( rc )
+        goto out;
+
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
     {
@@ -580,9 +561,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    if ( xend && (rc = xc_cpuid_xend_policy(xch, domid, xend)) )
-        goto out;
-
     rc = 0;
 
 out:
-- 
2.30.1


