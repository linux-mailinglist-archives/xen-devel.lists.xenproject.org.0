Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F5E5FEC92
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:30:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422692.668895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHxk-0004ip-9M; Fri, 14 Oct 2022 10:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422692.668895; Fri, 14 Oct 2022 10:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHxk-0004ga-69; Fri, 14 Oct 2022 10:30:44 +0000
Received: by outflank-mailman (input) for mailman id 422692;
 Fri, 14 Oct 2022 10:30:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qaRP=2P=citrix.com=prvs=27923c854=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ojHxi-0004gS-EP
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:30:42 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e990f9c-4bab-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 12:30:40 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 06:30:36 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB4944.namprd03.prod.outlook.com (2603:10b6:208:1b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.22; Fri, 14 Oct
 2022 10:30:34 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 10:30:34 +0000
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
X-Inumbo-ID: 3e990f9c-4bab-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665743440;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=l/yY1pnpQ8B7x9nC2Mo08GJ+F20sE4qw2VAD19w/qRo=;
  b=Vrot/IdWCHh7HtVU24w9akNVLWa8qYIhuAVC6UWsWXYFPs8hw1lXO6vl
   2LhP0yZv9DksNluGvUeohYIE5CWq/K25xDt/LUopryu8y7AYxJH+0BIqO
   HY/YzZBOBHNBHuNjXnN2l09Fc4NdEXtAEFE2Yi40KQzJgFAhZuyaRM9aX
   g=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 82365720
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eXUAJqDY2l4bqhVW/xPiw5YqxClBgxIJ4kV8jS/XYbTApDN002BWy
 TAbUGmCOPeKYzTwc9h2ao+29RkG7MeEzoRiQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25K2u4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kfBIs9/Nt9UFhq8
 NwGCwoMXz2v26GplefTpulE3qzPLeHNFaZG4jRK626cCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWIA7gvN/MLb4ECKpOB1+KLqP9fPPMSDWO1en1qCp
 3KA9GP8av0fHIzFkmTYrSj07gPJtTPjZY4/Eu2Vzcw0vlSC7WkJVyQ0UVTu9JFVjWb7AbqzM
 Xc8+CAjsKwz/0yDVcTmUluzp3vslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQCy
 Vuhj97vQzt1v9W9VXOY3qeZq3W1Iyd9BU8PYzUVCzQM5dbLqZs2yBnIS75e/LWdi9T0HXT6x
 W+MpS1n37EL15dTjuO84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComVvlhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:xqBmF6A6v+4iyRTlHeg+sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4N6T33KQwVlUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDm1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9UfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ0yHtycegA2w
 3+CNUZqFh/dL5pUUtDPpZxfSKWMB27ffueChPlHX3XUIc6Blnql7nbpJ0I2cDCQu178HJ1ou
 WKbG9l
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="scan'208";a="82365720"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PD957D75Yrdf9lmPvUcVwG+E7bQaaZSSOdzVZXsr7Haeq3Xv/uApNjY8w/QcOXfg7xdhnWlRxR0437E+NA8SmHS4Xfju+bZ2A98X6/pL8EKdfv3VyGLGxcDmCi2C7yvBg5Q3s0l8uIGHOf5BAJ1ZfXOGf3J4UY9QBTWRKo8PEL8XlLiYwYmemfrAng3u1usZcSqdwqQQVwSnV3VcAek9kRJafIhw2uPg7a7+ipx/fbegXtF8mcCQHOZ9GrFW4oh7zH/kQEb3u/HmBVTWIctvtAPv52gnLTvE2AQJK+GOBdiUnClYmti5nw291IVjpvm0J+SasAkfg1llJ8f5J77q5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/O70qrqLleir06Q+TDztBUljEHDJW+cZ4CXvcP9Rx8Q=;
 b=HVcJl3ombemQION7NQlSI027RlB1SjreaDk8DjTFCwWrvAEGtegYf94NUcd7w3HMPg+/65HcSQIJse2q4LeBFlU02KR/JBfkkKtKUtunkJKrNgFcrJMrh/AYYr75OcPf/8nAH9yUhrLfIZlpaYhVwb5FDu4w6O4ng77D1ErVevFOTB6EHX+Adj3rowf5RX0hkW/zVv8loycXtWMV3r+z6FdUypSS0sEI28DzuIkPL91eBEHcJyEEeWryXVNn4OS0T1TrsmIEqFuXoFqHR3fmolkk1/1zGN8INVO1GMHc73oF0rE/JWB2kB0cUjYgRO6TVS51I4mFoSZtzFnscLppAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/O70qrqLleir06Q+TDztBUljEHDJW+cZ4CXvcP9Rx8Q=;
 b=Lvpa1WwUdvaBdfB0aHuEScih++pH/IrtxJjbT2YbOz62rqIZce8AP+/7nBpA528vQWAiuq+uhe28PfzP3wtK0bkcR4OJxc20AMYqMEbJeFrfPVODNgxFZezYOjlmypZcGdVcQTPChu/23EAXO6tP24UsTe4tcWW0aORdqX3yK3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 14 Oct 2022 12:30:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Tim Deegan <tim@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH][4.17] x86/shadow: drop (replace) bogus assertions
Message-ID: <Y0k6RSI0VJhTVmEi@Air-de-Roger>
References: <e447da22-23d6-d3db-313d-4e4ca009c3df@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e447da22-23d6-d3db-313d-4e4ca009c3df@suse.com>
X-ClientProxiedBy: LO4P123CA0656.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd5a149-b3d5-419e-09f0-08daadcf204f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q4PGnVqkyvAvyA5TRZ9ijZWzS7AAp5H6bIbnwvqe3czZFiXYIDZJFyXDIOIBrKofbyUHrWjj6AAVPZl83etik4yk6UsAWhwtzj5GUoqPfnZ28CKjOWJZntJZkFcM+3zu+pLHL79T6YWHtCo9gVJYMWL8lrGs6Fq18zdDH7z+f0SM//XmOQREYyI6Tfrhv2lavQ/PSi0azMuU5M7gdVrHYdXFtMEP+drGr8k6uaorn2UxZdV18gQK45/466Mk/VjfqbONNqJYDdnkkVXrnz0EXx6EiHkub1Qa1PZ6TDdTcTJ6yZ+378//ne7bEYdj/C7nzoSPTRgi0KcqWtMZfeVBXbDHQ5wPlhaGJcjxMQbapAHGNHd1h7EDVa6gCZYjuHxM2LjzbJG9/FvNn90nAtjL4mpVwfcvKnaOrAC1JiHzsvrF7ZJEWSZy/N1ZFZ6RmU7p3ZqeuX3FqDAzqvEhcX7EDZSHsSPM2A+gvzzjukC0hhjBgzVOnJyTJCXjLSb/0KVNHZMUodQ3dyXkGirhjgBXNygZSzLN5r8IwQgzCz2VNBGic0VzLgO2SgU/7ustR2yYbccW34xN6SKPKFeAhgATV5HgAXgZhe0HbuSCf60cT75cxXGCr8jhKtesUSN/ZS9EbbmtX5ZdyWO+pnaRgg2PwSBroRiHmavn+kft5svDrZ0Us4b9hUVzLmd4At7ermUnOLwmtizPvZ/a3iI3NMOkQKrJGA8B2TiIHs7Vu3CUo53aL85iv81RCLCynXYUDG6D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199015)(86362001)(8936002)(85182001)(6506007)(6666004)(5660300002)(2906002)(478600001)(186003)(33716001)(83380400001)(54906003)(6916009)(4326008)(6486002)(26005)(66556008)(66946007)(66476007)(8676002)(107886003)(41300700001)(82960400001)(38100700002)(316002)(9686003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3pTZ1NVbXoxODlNL3M5U2xYSnpqTk1PTmREOFRpc1VGcy9rMVQ2WlNGKzFo?=
 =?utf-8?B?YnNiSnlRSkZFV1k3V1ROOGErQlp4RG16czNUSWxkOHBCMzdWR1Bpck16QzRX?=
 =?utf-8?B?dmE4cGZaeXIyd1JPZCtDSEJiQjFrSkJXK2swNG5oOWRMQnNiUWtJcCtlcmhr?=
 =?utf-8?B?eWFrR2hOOHJKdGdsWk9uUncrQXBCZ2FabUhWUTMxZThlM3lzV3U3UXdmYlli?=
 =?utf-8?B?QURDM1R6dEk1aFVzRFNTaHp5YjVoaktveGxQcE1oUjBkRE1JK09iWUg5OEJj?=
 =?utf-8?B?WnB4bGtlNWlZUFpLaEFTa2JFb2JQa1Zqa1Rsc0U3YmxPVUlXR0FRSVRMTnZP?=
 =?utf-8?B?T2RsR1dhL2Q5aEhoV1J5QmtVSkZ5MHFISTNDaXB3WlFZNnZMcXZVbUtvOWpj?=
 =?utf-8?B?eG9PMlRJbGo3VHVhQXpOR2pOeW11TVp2Y2h6WVBRc1R5SlY1RzdZeFRwUHRU?=
 =?utf-8?B?SE1vWDV4NlhQcDZQK1EwUlhEclR2TXVUYnZoTzVnS0xTN1MrbU5BdkhjbERo?=
 =?utf-8?B?UjNyckRZWDhManNKY05jNmxrajNnVTAzelJkbW1xd3NqUWlxRnV4S0RGam5w?=
 =?utf-8?B?bHc2bWJILzR2SzAyOXR0ci9jWGVqTW1RUWhoSnluVmRnRU9DZmZ5L1h0ZlN4?=
 =?utf-8?B?c2dsS1Y3TmgrZHJXamp4Zzk3a29CcjhXY2doOEVCYm56aFM2NkV1V3FUMmhy?=
 =?utf-8?B?WVlRckQySmtONi9CL2taVlYyWWVMcUl6K1RJUW8yNlRCamMreDFBbkJaTFhU?=
 =?utf-8?B?YXpubllhMjVsYjU3c1JkQXd2WVRzMlZqaXVpUDRQbWxSMUdxbXAwTGpKc0hw?=
 =?utf-8?B?M2NhM2NDeWdLbEtNTHpmcXp6S2F6Ni9PamhiY0RSdzJSblRUbDFvUzhrSWpv?=
 =?utf-8?B?dmhXZE1hWjZFOFVCUFdMRy9EK2FHc2ZYcnZKL2M2SkhzR3hvVjFKTnFqaGhq?=
 =?utf-8?B?bzZIUSt5Vnp1dDE4UUMxOVA5VTNHVmpRSjhrTzdyTTVxVTk4VER3ZE1aM1FS?=
 =?utf-8?B?clJkVXJYa1lyaGFDeGZmSU9vRXk5ZU93WHdwcC9hUG1nWEcraFMreFl2ZXJ2?=
 =?utf-8?B?dmJRVExHaVdOUHlacXJhYmVjTkd4Y0VNejJ0Z3o1MlQyWlR4OHNTY0RUOXNK?=
 =?utf-8?B?YUNTN3Y3QXRyQkZlbXRBekhPdWdLZDBXWndhUnMyV1FzeTMwVXZUUnhRNC9v?=
 =?utf-8?B?UnZDaERlRzN5SXhiekNPUE9Wd21DaDYwU1JtbnVzZTRJdFVHd2RwZ0ExM3Uv?=
 =?utf-8?B?ejNXMk5XSkJLa3hMK1JyVUZjYVFSNG1paTNhMUFsVENGWGUwMDJkVVpZY0ZU?=
 =?utf-8?B?WmR2dVp1ekFWSzBFTkxLSy9OLzRMOVc2WTBCMjdSWGxOT3c2czN6bDZlTmEy?=
 =?utf-8?B?dS9mYjd2cW8wUmNUNnpSZDFYRmhMalpWa1pRNDB4d1pXd0o3WmxCUUczUE9H?=
 =?utf-8?B?N3ZjN2tYMFFQeE1pOERSdHdERmRTU3JRSGdDYTFMQ3dxeFEzT21RVnM0YU9S?=
 =?utf-8?B?OHFIcXVkbFRsOFp1cVJ4SndaVEhwSXVBeFdqQ29MTkJrWUkxaHBLeTJXUmpG?=
 =?utf-8?B?RTlMM3YvcXFwbWZVTE9iZHBSWDQvMnV2em9CREhaekZjMTNrc1dHNnZVM3Ba?=
 =?utf-8?B?NlBSVzNlS0RKRWpqOTB2L2R0L01OYVRFN09NaWpSYzZIZTVNaDA3T05NZkJG?=
 =?utf-8?B?MHhLQ1N5NXFSMHFNNkdYb010NTlIOGpTb0tkMy9DQlNoVzVERDJWN3R2Rkl6?=
 =?utf-8?B?aWIvdHdua0FBRzFhUUlDZHRBVUd6dFF5ZGhSN25IS1VUUU5ERmRXU0p3T2s4?=
 =?utf-8?B?bUdkQ01xVWMwc1JiMk5Tc1ZaZUNjL2VLd0d3Y2YyV2hnNGMyVGJ1cUs4VHdP?=
 =?utf-8?B?dlVqdEg4UzJPU2NBZC9CaktNd3VTY3UybEo3bzVmNHh2RlJCcXpxdlpyUGNa?=
 =?utf-8?B?V0pweGVCaEI0S3h3YVY4YjBoVnQxeEJQS2ZwVWpmalN1bEtUTkhkZWI3eUE5?=
 =?utf-8?B?NWp0dVFId1dnNm1CV081TmxoWWJRdHN0dlNiL25qNkVqZ1pSQ3drL1ZpMUY5?=
 =?utf-8?B?NEtYNXFEQUx5N1o2WkZPSkpDNHN4YUxRZFZxZGovUG9QNHpNWmNKVk1LejRm?=
 =?utf-8?Q?0V5JPEULf9VMBisDQrA4zvypM?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd5a149-b3d5-419e-09f0-08daadcf204f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 10:30:34.1215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Hh4Sr+od9fy1D+8CL6N46m0PAWK4DRYP2F2jEB6X+Q5jhk8+ZC3/0o+f2yWsG1lJUa+VYExyRBI20reP1TdpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4944

On Fri, Oct 14, 2022 at 10:49:55AM +0200, Jan Beulich wrote:
> The addition of a call to shadow_blow_tables() from shadow_teardown()
> has resulted in the "no vcpus" related assertion becoming triggerable:
> If domain_create() fails with at least one page successfully allocated
> in the course of shadow_enable(), or if domain_create() succeeds and
> the domain is then killed without ever invoking XEN_DOMCTL_max_vcpus.
> 
> The assertion's comment was bogus anyway: Shadow mode has been getting
> enabled before allocation of vCPU-s for quite some time. Convert the
> assertion to a conditional: As long as there are no vCPU-s, there's
> nothing to blow away.
> 
> Fixes: e7aa55c0aab3 ("x86/p2m: free the paging memory pool preemptively")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> A similar assertion/comment pair exists in _shadow_prealloc(); the
> comment is similarly bogus, and the assertion could in principle trigger
> e.g. when shadow_alloc_p2m_page() is called early enough. Replace those
> at the same time by a similar early return, here indicating failure to
> the caller (which will generally lead to the domain being crashed in
> shadow_prealloc()).

It's my understanding we do care about this because a control domain
could try to populate the p2m before calling XEN_DOMCTL_max_vcpus, and
hence could trigger the ASSERT, as otherwise asserting would be fine.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> While in shadow_blow_tables() the option exists to simply remove the
> assertion without adding a new conditional (the two loops simply will
> do nothing), the same isn't true for _shadow_prealloc(): There we
> would then trigger the ASSERT_UNREACHABLE() near the end of the
> function.

I think it's fine to exit early.

Thanks, Roger.

