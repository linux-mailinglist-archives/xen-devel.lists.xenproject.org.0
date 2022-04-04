Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA854F1588
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 15:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298335.508188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbMS6-0003mk-0C; Mon, 04 Apr 2022 13:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298335.508188; Mon, 04 Apr 2022 13:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbMS5-0003kk-Sd; Mon, 04 Apr 2022 13:09:01 +0000
Received: by outflank-mailman (input) for mailman id 298335;
 Mon, 04 Apr 2022 13:09:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjy=UO=citrix.com=prvs=08688decb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbMS3-0003ke-Ps
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 13:09:00 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6274b348-b418-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 15:08:58 +0200 (CEST)
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
X-Inumbo-ID: 6274b348-b418-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649077738;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=w4W1mmhIJG/wrhq16Hco8z0EIArNWfq+lgavRD5CPNI=;
  b=aOy+CToA3J2NTrmzLDyTMRbI3Tegn4AKkQIPOKe7dHUOld36Iwkpc7iV
   DWV3TbBv5dcruobVqHIMrxdjyyGFPFXcwPMSGMemh35IogEqEyLIgkD2+
   0sMWNi/80niaKKb82hSac833Pz7Ys+sZpO9EKH3olX3XR75w/QqvM+tJI
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67939635
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:z4uPBahpTq/8/PAazGRHKfCBX161sRAKZh0ujC45NGQN5FlHY01je
 htvCz2GO/neM2ehLoskbdu/pk5TsZLTxtcyHABp/isxRCob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1vR4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YT0yAb3gkvYhaVp7PXlSEr1Wop2aJHfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiBN
 pFIN2EyBPjGS0RWC005UZxnprvr22ihSQJorUOyuINitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEmevnjS79HoUIG9WQ/PNwnEeawGBVDRQMTEa6utGwkEv4UNVaQ
 2QW8Cczqak59GSwU8LwGRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQoy
 1uIktXBFTFp9rqPRhqgGqy89G3of3JPdClbOHFCHVBtD8TfTJ8btAnwXvppApKPzf7bQR3f0
 yDQjnU7iOBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWKyC
 KMwkVkIjHO2AJdMRfUqC25WI553pZUM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FLZf0Vy5GVPg8kGbeqwIhPVkDnH1WKYT7H86T8vha+eDGOC79pUktbjNikdzVHIvb+V6Io
 r6zxuOByglFUf2WX8Uk2dV7ELz+FlBiXcqeg5UOLoare1M6cEl8W6656e5wIORNwvUK/tokC
 1ngAye0PnKk3iaZQehLA1g+AI7SsWFX9ilkbXR1bQ/3gxDOo++Htc8iSnf+RpF+nMRLxv9oV
 fgVPcKGB/VEUDPc/DoBK5L6qeRfmN6D32pi4wLNjOADQqNd
IronPort-HdrOrdr: A9a23:oE++iaj1D7YHEoCTph49Vjt1E3BQXt4ji2hC6mlwRA09TyX+rb
 HIoB17726RtN91YhodcL+7VJVoLUmyyXcX2+ks1NWZMjUO0VHAROsO0WKI+VzdMhy72ulB1b
 pxN4hSYeeAaGSSVPyKgzVQxexQouW6zA==
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="67939635"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hj2iBmm7235YCH8N0bgJi9cWUN5NbgAe+jFhkgl9Saq0noOCxxIYb7Sk4KQ/+fKAbISBhKKLxOIUhDVyVtWAg3rJDz4NLAtcRMn3+ZCjdoluzN+tK/TcSZqtYufE+FHVr/j3cNjYrFcJNvZ35g8sWXbnyxdUI0N50VKcITgUfW10nLqCy8rNk5JkRbwEzSz9k6FZS+s/4eL4tAKLuLg3yKsC7GZ3ULcYZ1vXN+vCV8Y8wT7b9kf930zZ7jeQMDveODz7L9UKjlHPmFy96SGy+B78QkO6+3VSKwEVZUrZaBbDSr8hCXZS7au1DC/UUyx8g3BD12skjRiEPqf3XD2a7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4W1mmhIJG/wrhq16Hco8z0EIArNWfq+lgavRD5CPNI=;
 b=RCudkLDyaWPNIXzoaMa6QZFI3sONrziv1mG6+KbIb/4IspIjW7/Y3KXpjCM8wKvwUR5ENhT5ZefYHAbBiCD5DG+Ce7nSyI1gdSRLQFa8g4DTAppjClTTD5e4RiljAKsJdEsU49B0gjRHu1WzhhSvLsgx0vE9FM9OAAGQ6IBecPcwmsWo0n1z63db/75gM9+ET4nXycwKThPNDk57NbzD4IcBMhynUcoCI4fYRzcnVrbBK+c9NGvh8hLH0Aw+gd2HUxO8e+K5JHver0+2yvP7nOxPw+6PJ/ytB6MD05CaWgiBcmvFNkqbij8bgBkcv24QLeTaMXi5EPJzThwhylsUtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4W1mmhIJG/wrhq16Hco8z0EIArNWfq+lgavRD5CPNI=;
 b=nqzf5I+KME7VwXqEwbDJQSjIiaAVLOvUl+kQvipqPxwERcywcTCH5Xz+88rr2lZejQI1QvfZsOnDl0xkijVC3slReuihob+C8Rdbipkw6c+/+JD7wEvv4Qjzqqv8P+RAoTJbhQ/a26WexFFzcemMJHvPNq+8qgydGO5WEojjBa8=
Date: Mon, 4 Apr 2022 15:08:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [PATCH v4 3/4] include: move STR() and IS_ALIGNED()
Message-ID: <Ykrt3/nP5EAmCDUa@Air-de-Roger>
References: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
 <9a0cf101-17fa-cad2-e791-15d8d8cc5b79@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a0cf101-17fa-cad2-e791-15d8d8cc5b79@suse.com>
X-ClientProxiedBy: MR2P264CA0042.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::30)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 044aeb09-103c-44af-808d-08da163c43f1
X-MS-TrafficTypeDiagnostic: CO2PR03MB2407:EE_
X-Microsoft-Antispam-PRVS: <CO2PR03MB240726C076449C1800D7BFBA8FE59@CO2PR03MB2407.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KsNMKCBluxISJBhGHWNZ0dnJyZJ/iyqImcpdKj1KzAEqKd7n6iMktXCkbSFzVLlXw2zWOJNF/+n1ZLBGqNNiKGFAaFQ0n1looVX7Sfh0Utb8gQ3KUWqtbS6S8mmChsuB+52ELVrRpZdhHIkL2u5Ojy9K8CeKT0KFQJ1KuSB1EJ+ZgpvxxZMD4VH6/SwR3P8Fo59uLizucQzh9bdzDb1ybni16fDYVXGNq0ln1Rf6wW/LIYlh6Qu/oKTOXMoWCzwAcAvMEEjw3my7W0c7p5QJ1OZBnDHYmLU1vJw8odz/S+wVUq6xiZyFEpJVc0KGbjd5CbCqqQJNXXM6kc+OGx2VatDkamBZPojX/Kfne4pqrQ9cuUPoKdU5obF8Cg14Uj9Xe8FabjAS3Q+Vz/8mQD/5JEdPopHBqMW+dl7NhptUnolNmys3xbGlXURSONdKjM5SmeTP7XtqDQZREgzgnwEq0wJVvabG2xsucEZv/sIYxG9bKOfPjxybFwHQKBsZ3YudeVH1lkkB0oWTpc8xjikx3OBJzkGy3yWc3uLVH1Wxvq2QF+zkstPFcJbbpOMftKyWJqbJSWPKFSpZT+lEuZfqZ/h95jL30VTO9XOTQzEVZU7hOLKFP/muDb1lSQKriFuJWjDcrtnG5631pOkOHPGO+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(54906003)(186003)(8676002)(26005)(558084003)(2906002)(316002)(33716001)(66946007)(66476007)(66556008)(4326008)(6916009)(82960400001)(38100700002)(6512007)(6666004)(5660300002)(86362001)(9686003)(8936002)(508600001)(6506007)(6486002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkFJNklFVTFhUDFhRmlFSHRXaDVuYitFaloxSGp0VkR6bzRpK0s1dytzNXJN?=
 =?utf-8?B?U2dIQXZMMEdQVU0veDQreDBDWXp5Z3BRUnVWRkxpUVprQkVGc3RaUmhjbXda?=
 =?utf-8?B?TVBtcEV4WEhiYmpkTWJXeVFzTnhBZE9mbnNHY0xWeSsxeWZZTXNWTmp6L3F3?=
 =?utf-8?B?RTZTbGNXaWVEQU9XY1V5ZlJjUGQ5cStxWFBvUzZQY3I0QnF1YTNXWGhBUHFp?=
 =?utf-8?B?Yi9jMFhFVFNRc2xYK3l1QmZpcHA5YkgrWlZTeHA4RlVzd3FXUkh1NlptbU8x?=
 =?utf-8?B?SkRRSHRGNTRKTGdWelR6dUNkVmxrWVd3SUswSk1BQkVlZ1IyejREWlZLYUJT?=
 =?utf-8?B?d3Z5djlpMzFYZEYwVlVhZTlvekpwR2UxRDFkQ0N2N3oyeGx4ZFljSWhsNXlC?=
 =?utf-8?B?STQ1aFM0Nzk2aUsvTTNSQjNNVVJQTHFJQlh2QzA2NGlZZnUrVitvcldENEdQ?=
 =?utf-8?B?enlTZUdBMnR0YU5WMlF5Z3RkNGNwNTA4OS9hdXNUZFBZUSsxZ2VpdFJuRW05?=
 =?utf-8?B?TEJvb0VpeVIxa3hra2JPQVRHa0g0MVVaNHVpNGRGRDZSdVprTVBKVmZsNzEr?=
 =?utf-8?B?MXd0YWo5Y044V2VSNDZWOUZrdDdaRDFBV090TjE5Skk5K29LZWNZVTBSNkNj?=
 =?utf-8?B?ZTNwTEdQY2FwZWhNd1BFa29aY2Y0VWVYR21aclF2OWR3QjhCWEJtQmtScTU5?=
 =?utf-8?B?VnhUUjJFSzlxc0xqMzE4OWM1WVR2WERQRU15T29RLy9GZWtPNk1QVU4yWWli?=
 =?utf-8?B?R2tCZlh0TE5pN1V5OFcwMVlmQUV2bk0rTlBCM1dYRjdFM1ZQVCtuKzlRbURV?=
 =?utf-8?B?dFdkRmdubjJrSTBDOWkwRmtjdS9kbUdXQjRwVy9mWDkyd1FVYnN1S1d4c1k2?=
 =?utf-8?B?a2k1TVl1dVBKVnFIdmJhZVB6NWVrbnpkTEJib1JkZGxCWWJtSFZ4QzNnakZJ?=
 =?utf-8?B?VGhmdVBoYjV2ZXUwRGtsRUhXRktJaHIyNWpHRUU3SldiYlJqbkJvcHFCTjhz?=
 =?utf-8?B?NGVaTFNlVi9NeU1jd1FyV0pXN2hzam1YaEdlclJNbTArL0FlMkQ3YmxZLzZY?=
 =?utf-8?B?R0lQeXdsY0x0WWNmNU80S0lpRDQwbGFIdTJyTHB0TkNHRUpqTWVtM1ZjcnhK?=
 =?utf-8?B?R0ErS29XcFljN05mdmgxZ0VML0ZtWGppZE5oVWtWTXN0Y3dCR29yZXRQOGJ2?=
 =?utf-8?B?RG16dU9qMHZYTE9ZdjZjNFc4ckVzZWJ6d0lTRTA5bm1Cd3E5SHFXYXFDbjFV?=
 =?utf-8?B?cTBabERNaHordEFuWmErRzdCcUdXRlNTUEp3c3hNYkxlS3Nua3NCY00ySVJv?=
 =?utf-8?B?ckhiSGZuVnMwTTYxQ2luU0xHOVhKVXJiV2lndzh5ZHlwMmxDKzUrVG1pcGw5?=
 =?utf-8?B?T2VvWlk5YVQ5a0ZYeDNSckNrdEJwd3ZRNk1zdXl4cnFESTdJSGhQdi9iWlk4?=
 =?utf-8?B?SXc4dmpPeWtvL2lKWFhwVUNIWGNYYTJucDdNcU1jSE5HalNoMVRpYW5CTUlq?=
 =?utf-8?B?WEtXUEJWUDl4ekNRelZvTzBrSHlQR09PNGJzc0c0NjNnV3MvUUN2RWJmWGRF?=
 =?utf-8?B?ZUhES1YzSHlRdDBYb09yanIyMjZxWVBxSHExRFR4RHJ0bm1Gd0QzRExNRHR6?=
 =?utf-8?B?VG1rc0FrYXJNMlI3YzU0SFFpalJPbDMyTDFvS3k5ZDY3eGMzTTZLWTN1VnpZ?=
 =?utf-8?B?QWc1TzNyZ3NZNjFzaXhsc1E3VDZRcHlkSWNkK09pZHJ5V2NPVnkxaVl2Lzd6?=
 =?utf-8?B?c3ltU2dwckNpRERlUHppZTlyeFducDlZdy92b1BwOUZDTTg3VzhodXMvVWpp?=
 =?utf-8?B?aHFEV3Y0aTRyVUZYb3NaSm5sSlQ0Y3BCV1dLYnh4R0ZBRExxR1hEaTlpb3BR?=
 =?utf-8?B?alpCN0kyakxhYXRlWGdYUnVHK3MwYlVPR1lCbzBldnJ5WndQa2lORFcxWmky?=
 =?utf-8?B?azdoNzFkc3pEMXZnOVBSSjZnRUNLZlhkQUVmUUxzbS9aZlErV013N2ZLTzZU?=
 =?utf-8?B?ZE9PNkNSbGk2Y0hzTkI2VDc4L3R6RDdrbzZJeGMzMHNOMElvSmVsZkQzQVQz?=
 =?utf-8?B?STJGdVlIaDl2SFYyMk9VQXVtY092MllNWUFXOGNLMGs3QXRZQ2xwcEx4cFBS?=
 =?utf-8?B?NkIyb0ZkMlVJbStTQ2grbWZUTGhZTS93QkVNdzZzM3ZUVWNOVDRZMnR1NmJ6?=
 =?utf-8?B?anphZWhhdUxYTkNjU2JaV0ZwcUloaEx5VUlBY2E4bzBDZE9xcU5WQmlhWS9z?=
 =?utf-8?B?RUh5RUZ6bnQ0ZnphNlU3TURFbVZWQnRaRHFURklIWHBmWG00MWo5Qlg3bUIx?=
 =?utf-8?B?djRoZVFPUUFjRnU2ZjB5VThDTTlKZ3FLdkZaUEdsVFJPOG9wVFp4V01GRE1u?=
 =?utf-8?Q?4vDmuZM8M44zy0fw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 044aeb09-103c-44af-808d-08da163c43f1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 13:08:52.1345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJrCCU54ee6aXuT7Bc3EfwgzoNjSCxEVVNjKsG57wnwaRCUIe3JDD900SZfAeFMq/GC2Iw1DZdGOi9dTwBr5Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2407
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 11:31:02AM +0200, Jan Beulich wrote:
> lib.h is imo a better fit for them than config.h.

Looks like most of what's in config.h could move to lib.h.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

