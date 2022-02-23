Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 222D24C1842
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:12:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277582.474152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMuFH-0003Sg-Uo; Wed, 23 Feb 2022 16:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277582.474152; Wed, 23 Feb 2022 16:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMuFH-0003Pd-Qv; Wed, 23 Feb 2022 16:12:03 +0000
Received: by outflank-mailman (input) for mailman id 277582;
 Wed, 23 Feb 2022 16:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SA1M=TG=citrix.com=prvs=046235e00=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nMuFG-0003PN-6e
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 16:12:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53b1d626-94c3-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 17:12:00 +0100 (CET)
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
X-Inumbo-ID: 53b1d626-94c3-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645632719;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7xbFPH2Li6TZCQyrZw7+GvHiHu6zB9SvWjpmMapUFEs=;
  b=fCCmq1hMYNfjJYBQEfjmirnwQi/Fzk1yW93KQRX3BnLJemfZU8t6Ya7D
   1cKYtAYYLJTQhTfbuizVl+nK940utnsIVr/Ju9GmIl8A7mhwgjGpuXJcD
   1IqvVUXKdnj967kntfSZNpWNH75/TBJteP9qeBnSpe9h1VZ14cajroAgI
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64266158
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mBGom6yFoI1sKJGK5UR6t+c/xirEfRIJ4+MujC+fZmUNrF6WrkVVy
 WJLWWDXaf3bY2rxctAjOoS3o0lVvMCDy4ViS1ForCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy24PhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl9qyoEQUzNJL1tc8NUQtJUApAYYZl0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JwUQ6iHO
 ppxhTxHMj6aYQ9NOnUuM58Tt+Op1yf0cQEJkQfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCntT/7WZlUFab+/6Zum1qV7mMWARwSE1C8pJGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQ406c5hwGUeVpPsYq6hOciYHqvy26Lz1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpk+XFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tmuVh6b/PuREDGQ3C94acO51qXHb4
 RA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL+IN0OuGEkeBg5WirhRdMPS
 BWP0e+2zMUOVEZGkIctO97hYyjU5fKI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO96rghjlDi7bc2qkHyaPU+2OSf9pUEtawDVMIjULcqs/W3oz
 jqoH5HUk04GCLWmOEE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVACe0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:FGqhw6HXRh1aaZ+GpLqFBJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcV2/hrAV7GZmfbUQSTXeNfBOfZsljd8mjFh5NgPM
 RbAtZD4b/LfCFHZK/BiWHSebZQo+VvsprY/ds2p00dMj2CAJsQiTuRZDzrdnGfE2J9dOYE/d
 enl4N6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1wjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvW/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdb11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtZqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW/HAbgcYa
 dT5fznlbdrmQvwVQGYgoAv+q3nYp0LJGbIfqBY0fblkAS/nxhCvj4lLYIk7zU9HakGOul5Dt
 T/Q9VVfY51P7wrhIJGdZA8qJiMexrwqSylChPhHb2gLtBDB07w
X-IronPort-AV: E=Sophos;i="5.88,391,1635220800"; 
   d="scan'208";a="64266158"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dm0VmABYKOvW7td/RVFj6m7TkdsOvsAKcPbhs3mpXLhJPX9znC0lyMaWVQ8/swBPtAB/5GRuIPA1iCI1XCMMYtUiGaZqMSZPxOreFolr0yQnzxyOIjGSkNR12wUa68T+CGGvxc3I9SzGV0hskE8m3gQizcN2bZ5OfmrXZ5ebY52kmw64GEN2P0gzkCECLwgXbmyzqHfJRTnWVzABLZX2F5nOiKnIwbJ7jcM2LwaDWTmNODsKB1ZEQA318Wu5IApEF4gDIDMREC+wejIATK4hd0FE6yx1GOjac85UsTrMNTPPNBvEiYQvOMYx7enBAcq+kdo9Pc1wOAbakg5yvsyToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yanYrsGJL/uOVrabryc0fZ4FDX9w63P6n48/TQkTPlk=;
 b=ZAcOr0GevjZgNef2NCivQ09UYgSjf1wWXzS7m/WBN5vd7fR9L30gFcc3l/vC4hi1Z2W21aLUSaEopf6o+5Mh+Dx8sp6cM/kPfflBYYqjyG7fnmnIra7Tij5CqiTO8kNSlhp3IlIzeXGQusmTlWmnaD1/5lZgOPiIMw5EW7k+B4dTPKoWFtinLxfCZARIu0QGn6r9LBFHLH4wQlTZyE02JrkHO1YGhXFp4vOKns1h0an53HVJmAkiiun6Y1WRhFtYlAC5M9SLh7gF7efKqwi3pxmEKhvNLgaCSs1lzc4MpXBcKSG8WXZtBhx62PBm6Qqi1JUr2otDo8vKrwu6BdS4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yanYrsGJL/uOVrabryc0fZ4FDX9w63P6n48/TQkTPlk=;
 b=Q/Bh16SEmfcyWslVcw+2KuaJDBABOAdN10AzuGVRKfwpB8Z4JVZbrrNcMQ7jZdQYJ2lBH3CzwA22UqboBxitPHkb6i4GAJbhSkv1fq/bT+A1GxHEdN3/Pz4S66hkjelGoig66/1OmEaI+qwT2JWywmAUIyxjzoLByUSi05yeJCY=
Date: Wed, 23 Feb 2022 17:11:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alex Olson <this.is.a0lson@gmail.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC] Avoid dom0/HVM performance penalty from MSR access
 tightening
Message-ID: <YhZcxkY/BgPy/MTh@Air-de-Roger>
References: <949b4776e23e4607776685a7e2705b9e77f5b717.camel@gmail.com>
 <a1099ae9-9e0d-cf54-e786-835c13f2ba40@citrix.com>
 <d11e54d47776008c17762458e6abbd44ab0beed5.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d11e54d47776008c17762458e6abbd44ab0beed5.camel@gmail.com>
X-ClientProxiedBy: LO2P265CA0457.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07274b30-0621-4243-5a97-08d9f6e73600
X-MS-TrafficTypeDiagnostic: DM6PR03MB5276:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB52766363386C90A6D06F8F648F3C9@DM6PR03MB5276.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7flEBygXz6MYabB9B0aqgr9iEt4fyp7+z9jUgpjtGosVTSGz/W2TBizUMaFve4SIOwcLWbA0UjK3OWyre9NYag6Y4jmadHnw/c+JIDuprBYkPy3GcxhhiXaJmrjOxKk2/gRAwXUY525xAZqMB5W2FvCRCg4r/hH7M2Q+lCL7zpAdHSALQJHrQZoy1Tih8ztAwARrn2rK4eEGAdMW+9nYtKVsi7BZAz/mOfvh51/y0wF8BGj/DjFSQz5ci1V78CyxEYWT7qZv+uF5JKKdGrkUJcKNjWw0pzLf8KEiHUAwNMOWYVC8j4q0n7u3Ek4MQNIzCM9mHQhsEV89pBjjEVar9xKG5u8x2N013aEetqNkZbtXiH8XJiVgguB48ARXHLVrdJLzxpT/0mUwTTit7mICXv2hbihpACSnEnCqdHNLTyQShPgDzMorIODWn+LGbtOMfqnUea+NlcvHeaynIfxeRH8gWGnzMi+6ML4l3gHItQBrWs5nSN45VVd6y6JiGgdQcDtBsTkuqCEOCeyI31bnYprkyHnqT2IOgYVeZ2j1bu3IL9sBcTnmFMngidqKIJEjCSQ7SIfLw3+sJpbPEvf54n139DDAz/IP6bNC9WxuLihpKl7CLD4zpdDYqOUCbRKgnPwkiiLAUARDMplOc5Tc9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(85182001)(83380400001)(186003)(82960400001)(6916009)(26005)(2906002)(316002)(54906003)(38100700002)(4326008)(6506007)(6512007)(9686003)(6666004)(5660300002)(6486002)(8676002)(8936002)(33716001)(86362001)(508600001)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDdqMFNXOE11b1Fub2gvaEZGbEdWVVFxUnI2aUtRbHBRYmFHWHlVcUJHT0Jx?=
 =?utf-8?B?cG84dnhmaFVaNHlTaHB2dWlUbmNGS24yVzBvNlZNekNvZjJBVG1lYUlZb1Aw?=
 =?utf-8?B?eE1MdHVVRE9QSmlYYUJCdWkvNHMxS3VDMVZEYkR1VjVNUGhyaWJWbVlWSk9I?=
 =?utf-8?B?Yy9YTDNuNFE4RXRrWnZwVnpTTXorNTdPRXJmcG13OEtRaDJILytKcWIybkxu?=
 =?utf-8?B?UVJTOXJQbmEreHhPTVBiWjBxeHloTm14VjRmQ1NpZk9OU1NHeHFhOWZDSjBJ?=
 =?utf-8?B?bHlQdnpuQk5IY1p4aEVxbytNOEZLOHYra1krZXM1M25pVVB3SC9xT0ZWMkFa?=
 =?utf-8?B?dHdVRTE0SXJaUVpFRCtoSk83bGRnbzR3VXFaTXc5aDNhRlB1Q2JMY3ZTdG1h?=
 =?utf-8?B?U25WNk1RTDNFYk4wWDF5UVJIYU1HY0VUVU9uUEtwQWUrWWVaaTNTM0xFdWtt?=
 =?utf-8?B?QzFmd1A0RThkaHRmRzgxYk5YeHc3WkJtNTQ4M09HS01tL3FabThkSTJGNnIz?=
 =?utf-8?B?ZDFhWEYzcHZlVVgrUGFOYmk3bHRJYnY4OExFb0JzODBsMXQrZVlVR2dCQytW?=
 =?utf-8?B?NkdSL1lPZENUZmtPU1Y4Tk9VNDQ3UzZZaENoVkZyZC9pZk5JVVMwNzhIYytC?=
 =?utf-8?B?MXN3cWRUeklENGdKVWZjTmdZYWE0aEFSNG9ENUtjZlJPcVRpN2NvWVA4Vm11?=
 =?utf-8?B?eEN1ZTkvYmVWRVpxRWhPUWM2N2lxa21MOEZiWHlGclY3cnFqTjhDYmgwN1Ar?=
 =?utf-8?B?VkZtZlRjYkxhN09OSHk2YW13bE5tNXo4dEN1QWYyZTVYZ3NkUjJKSmswQm9a?=
 =?utf-8?B?UzVKR3FnbXB2bURJK2J2WUtSVk9ZRmw1emQ1OUo1TmUvaVRPQ2R2anJhOUNG?=
 =?utf-8?B?Wm5YSTFnZkpkOVNKYW8xblRWTHhPZGxETU1mMGRUZi9zTmF1cUI5eEhiU2Yz?=
 =?utf-8?B?UWhEN3lwS0Jkc045eUFGTXJnN2RYR3JVQkk0Zm1OWktGbkpSdW0yRmM3RVNL?=
 =?utf-8?B?cnByc2psdUFiNDVHSlpRVG9USmtHQmgwQWRsRUEzK2xyc0J4WWZqK1AxK2Jh?=
 =?utf-8?B?U0FUK3hNSTlUcjNnVE9lSzVNaFpxKzFWU2tvNkFLQXpjNEpaV3hndlE0OTNW?=
 =?utf-8?B?RUNxR2UxbVRUYVV5czlvVnI3QlhPY2FjNStVTnJTQy9QMVNja3podUJCeXBl?=
 =?utf-8?B?dzQ4eEhITmdWYk1uUFpxUW9rK00zZElxSTV1alRpOGxKUHpWc3JXeEVsNHJa?=
 =?utf-8?B?eDdhR0loaGVwWit1aDF3UWtVYm5LVWxpSlZQWHdlTEM0MldWTUliN2VBbGt5?=
 =?utf-8?B?UEozdzl4dXJqVUd5VmZBdG1XY0RMSEtoc1hzT0d3VlpCRkFuQVhvYnBqZkwr?=
 =?utf-8?B?bzU0ZXlHYU9YY2NyY3N1d1V2WmRRQTJsNkIxRkpvYitNQk1ieTJjbkhNSEQ1?=
 =?utf-8?B?WnlkRTJPZzR5QXkxNUtXUHdZeHhjalVEK0hrdXBqdS94UTdnL3lCeWMvYjBT?=
 =?utf-8?B?NEJHRUswdGlnVklEYng0aDgyUTBMNStkVFc5MyswNXF5UFZVTjJ5QnM5VFVu?=
 =?utf-8?B?cEw1Y2hIdGNqb0VaSTlENzNLQkgvVEllSjhxVWtTQkVwdW1renBaczlndTBK?=
 =?utf-8?B?SlVYR0U2M1Bjb3RyN1VzTU5MUkVockVuZThMaWVMeFRiU0tYN2pCdjE1dkI2?=
 =?utf-8?B?VEdCb3NSMmwvc3hObCs0WWMrSGtPYzN0VVZnS2ZSZ3BqemlJY0xqUmhTc1RM?=
 =?utf-8?B?ZW5kOXA1MU9YeG1kMDdtL2lJTkJNelNyWC9pUGhpb2QzMVRTMHVXNGtNdUx2?=
 =?utf-8?B?TG5JVHBhaTRYd2lMS3I3K2RHa3JlRU1zZWZXcVdmajRjM2o4V2orQ3BjUzla?=
 =?utf-8?B?QnFqSGR1dk1yaGIzRFZHaHFHTUNkd0EvWXpaOUZ4dm9LcStSQUdpeUlMRHgz?=
 =?utf-8?B?VFhvcG9JTDEwUTNRSTVGZHJCOG1mR1dJdW9jT1k1aVMwcHJybFFqd0VCSHZo?=
 =?utf-8?B?MG9PbXNGemJaWVhSa0ljL25qQUhHZWxwaUx3TVY2M3lqaGRrQTJaMkdDZmV3?=
 =?utf-8?B?UEw5bFpoeXFKNWVWMkRIbWNrcUVlVVVxR3RPVjBXU2I0MUsyMkR2UFo2clpH?=
 =?utf-8?B?RnM4SHlIckM4WERoMGZyY1JsQmlVL1E3bXhLdDZFQjgrZ29tTURRVHF5bzVr?=
 =?utf-8?Q?OiICTSGMbyY8iUG9YzGImW0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07274b30-0621-4243-5a97-08d9f6e73600
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:11:55.5225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/Kx6a7bRhHbhbBmui0xdEaWq/1vMnDcMzIbSub2TWInxYAJZvbrCABJ0JFJPwF8+Zcjuknb5vNlSyQMVdmnBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5276
X-OriginatorOrg: citrix.com

On Wed, Feb 23, 2022 at 09:38:56AM -0600, Alex Olson wrote:
> I appreciate your interest, apologies for not replying right away. I've been
> digging deeper to have a more meaningful resposne.
> 
> I had attempted to instrument the MSR reads, but only saw a small number reads
> being blocked by the code change. They appear to be the list below and the
> others seem fairly harmless:
> 
> 0x00000034	MSR_SMI_COUNT
> 0x0000019a	IA32_CLOCK_MODULATION/MSR_IA32_THERM_CONTROL MSR
> 0x000003f8	MSR_PKG_C3_RESIDENCY
> 0x000003f9	MSR_PKG_C6_RESIDENCY
> 0x000003fa	MSR_PKG_C7_RESIDENCY
> 0x00000606	MSR_RAPL_POWER_UNIT
> 0x0000060d	MSR_PKG_C2_RESIDENCY
> 0x00000611	MSR_PKG_ENERGY_STATUS
> 0x00000619	MSR_DRAM_ENERGY_STATUS
> 0x00000630	MSR_PKG_C8_RESIDENCY
> 0x00000631	MSR_PKG_C9_RESIDENCY
> 0x00000632	MSR_PKG_C10_RESIDENCY
> 0x00000639	MSR_PP0_ENERGY_STATUS
> 0x00000641	MSR_PP1_ENERGY_STATUS
> 
> As for my test program, it is just a crude loop compiled with "gcc -O3",
> normally takes about 10 seconds to execute:
> int main()
> {
>     for (volatile int i=1; i!=0; ++i){}
>     return 0;
> }
> 
> The relative changes in execution time of the test program and also that  HVM
> guest startup time (associated with the "qemu" process being busy) completely
> agreed.  I also observed the same changes under a PVH guest for the test
> program.
> 
> Thus, it seemed like the CPU was somehow operating a different frequency than
> expected, rather than faults consuming execution time.
> 
> -- (after a lot more investigation) --
> 
> Further instrumentation showed that the
> IA32_CLOCK_MODULATION/MSR_IA32_THERM_CONTROL MSR initially had value
> "0x10"  which appears to be invalid both in the Intel Software Developer's
> manual and what I think I'm seeing in the ACPI tables.
> 
> In dom0 Linux 5.2.38,  this value seems to have caused the
> acpi_processor_get_throttling_ptc() function to see an invalid result from
> acpi_get_throttling_state() and thus execute __acpi_processor_set_throttling()
> which wrote the MSR with a value of zero and had the side effect of disabling
> throttling (restoring normal performance).  (This all happened as the CPUs were
> detected).
> 
> When the unknown MSR reads are blocked, the call to
> __acpi_processor_set_throttling() did not occur since the MSR read did not
> result in the invalid value -- thus the CPU remained in a throttling state.
> 
> So far, this seems to explain the dom0 performance issues I saw.
> 
> The domU observation was related... In some of my testing, dom0 was limited (via
> Xen command-line) to a small number of cores so that the others could be
> dedicated to other domains.  When a domU VM was launched on the others (not used
> by dom0), its MSR remained at the original value resulting in low performance
> since dom0 hadn't a chance to rewrite it...   Thus, I saw different domU
> behavior based on the number of cores allocated to dom0.
> 
> 
> -- summary --
> 
> In desparation, I ended up resetting BIOS settings to defaults and mysteriously
> this issue doesn't occur anymore.  Not sure what could have gone wrong before as
> the original settings were not far from defaults.  It seems my issues stemmed
> from the server's BIOS setting the throttling MSR to an invalid value but it had
> illuminated some unusual behaviors under Xen...
> 
> It seems to me there are a few findings useful to the Xen developers from
> venturing down this rabbithole:
> 
> 1) For conditions in which MSR registers are writeable from PV guests (such as
> dom0),  they should probably be readable well, looks like MSR_IA32_THERM_CONTROL
> is currently one of a small number of "unreadable" but writeable
> MSRs.  Otherwise seemingly valid read-(check/modify)-write operations will
> behave incorrectly under Xen.

So it's one of those MSRs that's only writable when dom0 has it's
vCPUs pinned. We could allow dom0 to read from it in that case (that's
an oversight of the MSR handling rework), but it would seem better to
just remove access to it altogether: it's bogus to allow dom0 to play
with the MSR in the first place IMO, and it won't really solve issues
like the one reported here unless dom0 vCPUs == pCPUs and all are
pinned, so that dom0 can fix the MSR in all CPUs.

Thanks, Roger.

