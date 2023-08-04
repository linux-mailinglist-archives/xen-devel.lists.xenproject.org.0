Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0076FD4D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 11:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577022.903811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRr8B-0004xe-Lf; Fri, 04 Aug 2023 09:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577022.903811; Fri, 04 Aug 2023 09:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRr8B-0004v5-Ij; Fri, 04 Aug 2023 09:29:59 +0000
Received: by outflank-mailman (input) for mailman id 577022;
 Fri, 04 Aug 2023 09:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ccdb=DV=citrix.com=prvs=573ccd360=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qRr89-0004tW-OL
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 09:29:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 775605bf-32a9-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 11:29:54 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Aug 2023 05:29:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5800.namprd03.prod.outlook.com (2603:10b6:510:31::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 09:29:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98%4]) with mapi id 15.20.6631.043; Fri, 4 Aug 2023
 09:29:41 +0000
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
X-Inumbo-ID: 775605bf-32a9-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691141394;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SRCvVe+S1DPLW95R0TrJ8z0SlTUu7EDvGqbeb2O13go=;
  b=IqiRx1Y4DNMMIJ5zeSaXoybDJToWvq0eEQMiuK3TEtBuGzxWmcy56/Z8
   ek0CDGsoiptEM1mV5on6tE4o0L6+4Pe7X+UneQkvqC45Jdpqxeh5LrZlg
   jyIL+/0O58QIV4Gc+F0bbAgD0GYshqC+s1s2nqRSXAYQwSlpZCyTVLZ8g
   M=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 118512424
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hFpuyKIIXSOBH9D7FE+Rh5UlxSXFcZb7ZxGr2PjKsXjdYENS0TIEz
 WVKUG/QbPaCZWGhKohxPIWz80MBvsWDmNVnHAZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gRiPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5WAj5t7
 PI5eAlcVTmhjdyIxY+WQ7RF05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqrBdtISOfknhJsqG+v92lQWTMRbkGm/eWzpRWkeNcBO
 1NBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rHP/w+TC2wATzhAQN8rrsk7QXotz
 FDht8ztLSxitvuSU3313rWJqTK/PwAFIGlEYjULJSMH7MPku5oblQ/UQ5BoF6vdptj8AzT52
 T2JhCk4mbQIjMQP2rm7/FbImDalrN7CSQtdzgfeWG6//x56TIGgbo2sr1Pc6J5oIJ6CS1idv
 FANg8WE8P0VFpaJiTCMR+MWWrqu4p6tOz3GgEVzGIEh+i7r5DioeYlK4xlxIU5oNoAPfjqBS
 F/ev0Zd6YFeOFOubLRreMShBsIy16/iGN/5EPfOYbJzjoNZcQaG+GRkYxGW1mW0yEw0y/hnZ
 9GcbNqmCmscBeJ/1j2qSuwB0LgtgCcj2WfUQpO9xBOiuVaDWEOopX4+GAPmRogEAGms8W05L
 /432xO29ihi
IronPort-HdrOrdr: A9a23:HNYX7qyQBqvv5rB1ylSVKrPxMegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67SdC9qADnhPlICO4qTMqftWjdyRGVxeRZgbcKrAeQeBEWmtQtsJ
 uINpIOc+EYbmIK8/oSgjPZLz9I+rDunsGVbKXlvg9QpGlRGt5dBmxCe2Km+yNNNW977NYCZf
 ihDp0tnUvdRZ1bVLXyOpFDNNKz1eHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lMzQi5C2rAr9E
 nCikjc6r+4u/+25xfA3yuLhq4m1OfJ+59mPoihm8IVIjLjhkKBY5lgYaSLuHQYsfyi81Ejlf
 jLulMFM95o433cU2mpqV/G2hXm0hwp93j+oGXozEfLkIjcfnYXGsBBjYVWfl/w7Fchhsh11O
 Zu03iCv5RaIBvclGCljuK4HS1Cpw6Rmz4PgOQTh3tQXc83b6JQl5UW+AdwHI0bFCz3xYg7GK
 1FDd3a5txRbVSGBkqp9VVH8ZiJZDAeDx2GSk8Ntoi81CVXpmlwyw8iyMkWjh47heUAYqgBw9
 6BHrVjlblIQMNTR7l6Hv09Tcy+DXGIaQ7QMUqJSG6XVJ0vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uM8uTx5dGmyq9AVlVZQ6diP222qIJ/4EVHNHQQGm+oREV4oWdSswkc47ms6
 3ZAuMQPxfhRVGebbqhkTeOHaW6EkNuI/H9iuxLKm5mnfi7WrECltarBso7d4CdWAoMayfYPk
 YpegTVCYFp0n2LM0WI9SQ5HUmdNXDCwQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AN7clmmvot2y8dkSU4h5Xt0BA6IsEcSL+1Xnxc3b?=
 =?us-ascii?q?pMk9LQoOrTGK98f5Nxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AlMKx8w8BwLS46xU0iI1qOD2Qf/VU0qHtWW4Kqo8?=
 =?us-ascii?q?b59WOGndqGDLDnCviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,254,1684814400"; 
   d="scan'208";a="118512424"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCHC5+ByiMpkKPCPNOADNI5soEaEh4hU41dWHd+xfeyTKnL4M2psJVRAG71uzu3hSqCEKzEi16RlpmJFzOnkuSPQT+JflKw1PFdMUUI6mQpXkMhk3TPaDNxuhIipgI5X3Ip6fuoHfMubOaEeaSU1JdBcvrlmXkAE/vCS5tZeuaBPyd9qV6FYlQ8DqwkpLgJKfhpY8WRgAU/9pbYTf+O94ebd2vaNzjWndLMh80Y4uyRcKo4VRg9McJ8JKuA9GGghx1ilCfUkr6qG1R6h40Ll83sgRg+GVXoFHrlDEnF2KcpVhf1O4t7uy3yiGSc/Yh2H0+v1h9lQGcB1WIOItH1tbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+qOK9cx+4ZjG6NCincp5adHyETuhf+yKMXpcOoYjUg=;
 b=lO+7utAJod30CXYvHdp0m6erJaVS+H82mFoO9UiDTzN0pDYZx2kkFibwiW73ofz5PnRodrTBxXIfU4AMIfeMxVZMaI82dXKIyyoEjMRyhwsFFAWF12zC3jHFKeXlBGj2MZAThqH8BnkjLCvC5bnFwWfgAty8Y6jAuFQK2S4R+CFUK5DJ7P+CWeYbPV5+e9mWAe4uVKbbvCURF5FoUMp4DBkY8U89AUGoyJx8x7Ej8yaUToXP2chMfqLdSJFB7KlZf3TP+d+peg7snUCYFRWH0sxncacKAUYNpHghopoT1ctjkUqGaay8qAJiZrt1GYlCQNKDudULXY7UDBq51A9Snw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+qOK9cx+4ZjG6NCincp5adHyETuhf+yKMXpcOoYjUg=;
 b=GlDpgPEoBgAU2c3MJvtb1+JNctN9WAGCFTSNCQ9IjAbzPcQoQ2uZAI6WZtUqy2WWCP5JLtPo3OH8jd6SLcQw6btcqtXLkIJvaflLgzQVsJUm52GeAxkWWF2OCNtgR+NG5VFIrnIipPjDW2oYJvhLpDJMIvqcSrBlviObzvex4KU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <722dfba8-a768-55c1-29bb-2d8525282b4b@citrix.com>
Date: Fri, 4 Aug 2023 10:29:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] subdom: Fix -Werror=address failure in tmp_emulator
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230803203650.1474936-1-andrew.cooper3@citrix.com>
 <f066a57c-3dcf-12f3-26b2-5f61f8fcaffe@suse.com>
In-Reply-To: <f066a57c-3dcf-12f3-26b2-5f61f8fcaffe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0494.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: f492d36f-6406-4ade-a4d7-08db94cd542f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3maSrMXhyW6llioz8B0nAN9xFQkpgGDWWB5jMP7Uab3FohIT+866GSqj3wDU2x9uvOoj/0RPVYwr1EHFdZMq1zVCq9Zhif+7YIxZoK66Ck22df0bNfj5dwHbIHM1IM9rbBGW+8rx0TzHnY568+iqYwoMpSXUYuF22gkaXNvIQTtOMaCb/4YjP3FT1yCu/jxpAHx7Q8OCsemfmkr5/o/pSgJje6AGEJNmcuYbjv0UEmmNgYD+QzuBc8/AJQKVNesst8veHjM4/cWLXZ9GgdaDgNmbVJmuls6bGrox3J+j+1AaM5aTiT6dg/O6w8A95IgVPsYFSLajY6qCkyRONo3TmumYZxgHsG6Fh5qhJJxJf0oOEfQTHkzSP1CMhJTwhhMdtsggRBAFOclLIW5k3VQVHd53zbxKN9GJ/yvaQvlAxI2/PRrOIOF5xV9wS4aayR9RBMp/fvjz2XS4+aki4ih23bEL30DgZH5zIE0voRdzBlZVu9kxpsuBidGt3cybVq4qB/y7n5DGhh8wbuFffcoqDbVSDkBXTrJJdgMhBbuCMLqkFN80OuKLbf324/92Ug5/6Egu4h4QrtFTIh3lyR+Ivix8QnU2GGQ1IbAOpMV/k5Itd/RVOXXzsf1BE72N31y2KbUoJwvbK0zWnZ3pzKxwux3ZlmE0o5YgLWkRtSCpaz2LNqxIC3Spv9HMwoh2g320
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(186006)(1800799003)(451199021)(86362001)(36756003)(31696002)(31686004)(66574015)(478600001)(54906003)(38100700002)(82960400001)(8676002)(2616005)(83380400001)(26005)(6506007)(53546011)(6512007)(6666004)(7416002)(41300700001)(8936002)(6486002)(966005)(316002)(66556008)(2906002)(66476007)(4326008)(6916009)(5660300002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzhtTlp6WjMvcG5XYjdIejFhR2tqQ2F6YmpGcW5XZXpVTzloRWJjZXpZVU0w?=
 =?utf-8?B?YjRGNnNLclp1NCtUQzdrVzNCWVkvbFFqM1BpcVE4R0RsaTBFZmdBSU04Qi9w?=
 =?utf-8?B?VksxVEpGVzlLUVlkOXpOUXpXMnd6YU56dk5hZDZuOTRabGRjNTFmNkl6dGNB?=
 =?utf-8?B?UHozeGphTnJvem5Ub3Z3L2ZYVGQwVUpST2ZsSC9OdndSU3J4MlpqV1NPRHV0?=
 =?utf-8?B?aWhFclhPN0lHdlVGTXF1TDFVQ3Q1dUVaSUJIbStmaGpaTGtOR3RVeDNNRkFr?=
 =?utf-8?B?SlYxRjJHRFh3RGxyMm42UDdIR3o3NkIvcm13TFdJYk1MUXZXREthOCtTVVN3?=
 =?utf-8?B?enNqcFV6dXBGREMvQ3R6WVQ5R0N6WldrQ2wwSko2SHk3dC81MFZ4TG5tSU96?=
 =?utf-8?B?ODNZU05tQmtwN3YrTUc4ME96VFYwRVYvRk0rUGpsS2JVb0JidG5JMDZVanBn?=
 =?utf-8?B?cTFHeHU0VTZQRkdXWXczZFJqYnlRNjMvOUVZOE1odjBpQVBDQ2NhNGpoamZ6?=
 =?utf-8?B?Smo0NEw0WEtYSzFyOUllK2VQYXZXSjd0WlE4RUV1TStrUjV6dUp2ejVQNmVZ?=
 =?utf-8?B?MDN6QU82OVpWZTZJQ09hcFJCM3l3SVQ1a284UGZ0UTFGQjZSTEFBY1YrdGc0?=
 =?utf-8?B?eFNjQThIZ0MxZTB3TThjY3JrUDQ3TjkwNVdNOXdkNGo3Q25nUDRWZUlyL2Q0?=
 =?utf-8?B?bFBxRFVNYU5LZERlNm1CejNmVHVmVDhCZENGQWl5bGtMdklFdmd3a0lvVURI?=
 =?utf-8?B?L2dkSXhKTldzcUM2K0JKRjI3ODgwVWFQU2MyUkN3VjdSSEpSR21rdUM0MnA3?=
 =?utf-8?B?Rmt5cTI0UklCRWhucmhjeFVzRFh3VjdSSDNzR2lrUXRxdUNEU0JqMEw2MTlU?=
 =?utf-8?B?bHRhazhCamcyQzBwbng1RFdlYis3cFJ1VzQ2ZElGUlcyMndwT3MwYldZcVk4?=
 =?utf-8?B?RERtbExhZnNHTS9BM08vVHlNMVpQeE1PS3hIeFI4WE5ZNTZBWkpkYXZ0NTBK?=
 =?utf-8?B?emxpVzNSaUQrcGtaRjZGQTFOVU1LMFhQRGluSEc2ZUJBc2ovZHA4Qnk2NHpL?=
 =?utf-8?B?WjJrNjJwVG1NWnZqWU0wWmlMVDhhNzFjcFJOWDRoVC83eE9ZcFNYVXZHdjF3?=
 =?utf-8?B?RW1GdHN3ekZFVmM0ci9vWUlUUDA0dlI0OGs0c1d4YVllbGFMSDNURzRxNXFm?=
 =?utf-8?B?K1lYQ3dQTVRuVjl6QUlLZ1JiZUJlY3o4TVlha21XRmxoMnVrSlFqN3dsc0lH?=
 =?utf-8?B?TGVGcWx6dzdkT1NZazNOc0JWVEtydUZUWE1vL3RIcXlJbGRVMkVpSEh6T2Jy?=
 =?utf-8?B?ZXRMK21ESWVQWXVHY0ptc3RXV1pLdVFrV1BHVVp3MTI3UmJ1SEZ6eTEyMm90?=
 =?utf-8?B?eGdOdmhnZFd3VGlGUFR0Wlo0RDZCUEM5UVA4NWR6QlpTM2toYzluaURKR21m?=
 =?utf-8?B?VmI5b2hUamtqMnZIbmgvTFQ3TGVIQ0dJY2h1Q3hmRmMzN0pmM0VEOGZYa1hE?=
 =?utf-8?B?ak5YS3d2MGRJMVF3ZzJTMHB4dVZGTGtoeU5KWC8vTlJ1T1JrbTVTQ0NzcGxi?=
 =?utf-8?B?QTNPM1ZEd3ViVExIcjJkV2pJMUR1TUdVV1c5QlpHS09VSVB2UktzQ2hkNTVq?=
 =?utf-8?B?cHRpMVpNV0hZeXR6REorczhsdTlzdkYyNGxKNUtCTDR3VTNabjdDcmcydWIx?=
 =?utf-8?B?cjE5ajlmbE9xY1RmdmRNdkhpTVljNTJnTitQdGROaGNOZDBiVjV4ZVRvMG9J?=
 =?utf-8?B?ZHBvOEZnNlkzUkExcEVrakROYk1EV3l4cWlqUzA0amhMMWV3Z25aN1ZUbDUx?=
 =?utf-8?B?dHR5L2x0Y3pjWUp2MThqRk9Od2c4WkxheC8zdDlEdkN2ekRZSkNlUk8rMjh5?=
 =?utf-8?B?TDlzdHdybjVTSCtSaGFYeU4raU54Uk9YTG1WcUZpZTFLRUZ1ajhFWFFsU3JN?=
 =?utf-8?B?dWk4OHI5MG5BMEE4K2x1TG0xM0xvRHZHaXJSbXd6MHJpaGFKL3FBSGV0MERu?=
 =?utf-8?B?OEJycU5WYUZnKytYR3RtWEo5U1FkbTZ5QXpLcHh1eDV6Zjk1MGluNTBWaWQ5?=
 =?utf-8?B?WHVpMzFzOFczcG9vMEtyczlXdWZwVVc3akRYb1kxa3h3TzlZWHNaNUJOOFdv?=
 =?utf-8?B?RlF4cGhBOVZYV0JQZWVPSE5JZlVINnpZTklKakFOaHcxTzd6OHQ2a0VFckZZ?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Q0ZWWFBYMko3Y0IyR0xGeVh3eE5TVXFCUjQ1MUVzNnhKMWUrS1B0Y0daRXBr?=
 =?utf-8?B?N0pWc2k2UkRYa2h1SzY0Z0JyNlRUMXMxa2hQd0ZrdWphOU1jYXcrWEpPeHRK?=
 =?utf-8?B?OWQzbHQ0SkJWbGRzZDdXbk1jWDZxWFY5OEdCM0xXOG1NanA5Q25PTTl2L2Jx?=
 =?utf-8?B?UVIzSFhLWWJjSXJWNkRMYUNncWFvbGRyK2xHU1RlMDBvTjdQT3M2M3FoeldJ?=
 =?utf-8?B?c3lJa2V6V0ZZdVVFTy9nM1BiNFJ2NTlHWEFEUWhORnlqWkpEMkljTTJ1b0hr?=
 =?utf-8?B?bHNjN0E1SmZzRlQwSm1jekR4QVlYS2dmUTJHUGFHRUpQcWFINkVXMGwzU2xl?=
 =?utf-8?B?Zmp3dUhRMHM1UnNKdVl0aHgrS1Z5ejIwOFh4TzgrQklhWFdTV2FTV2cwMHBR?=
 =?utf-8?B?R0lhOG05TVMwK0w0eUprWVVjcDB2Q1NNbHVTMDViMThUSFhWZFNQa0t3a3dP?=
 =?utf-8?B?bWVKcWhIbUtFZW5zUStSQ1lPVkFiUi9UdGR3ZmZJT1FDVzdhUmFjNXVGNFpL?=
 =?utf-8?B?d3ZoMEpEWk93eGlSZEh5Mmo2QWxFeVdEVGZLUUgyTFo2OGpVN2xUZU5pY3Nn?=
 =?utf-8?B?dkNpL1JnK3RIbFhFeGVESmM1clpRNHZtQk1zMmEzWDJWNkRjcGtlazdCVTRp?=
 =?utf-8?B?bkdyUTRTWHhwUEFHZTZUL2RLejJnVnQ2bno1RmR0N1FqMWlMT2g4bXc0eFB3?=
 =?utf-8?B?b3MrNnh6R0oxQUJidE9NZzlVWkRJdFlvanZqNHZZcnNHQThySTBlS1E3RXc4?=
 =?utf-8?B?TXJKdFc0UWNkVWxoNXh3SStwYStOcS9DVzZuNkgxUDFTbWlYQjl0VTd1VXVI?=
 =?utf-8?B?dHFVQ3FBMXN2Q2dBSnZVcDdySXRVc3FqMEkvS2N5SG90citFOWw1RG1ldW9Q?=
 =?utf-8?B?S2Fjd09qSHVJd213U2kwQkdVZmQ0VStnMTlvd0gvaGg3UlphbTc1cHRkZnpZ?=
 =?utf-8?B?Y3FPMWEwKzdjWmJHNzZsbFBYY25Md3VmSTRJbTByNVhSdndwdVV3b2RYZm5P?=
 =?utf-8?B?S2IxTURIeHdsK1o4TWxPVzJYNHRmTnA2Vk9jcFNiTE9oNWFrMXZKbTEySnZM?=
 =?utf-8?B?N2tyamhjSjhxemhtREZxTXVkbUJRVWtDa3paSUJwd0hXNGhqelVaeFREWGx0?=
 =?utf-8?B?UFVxVlJjd1ZqT0RHdTZrdXRKZ3RjNjkwbFpwV3BIWXFINEVkR0U3VXNVaFU0?=
 =?utf-8?B?V0d0NDR5alE5L2doQlprYlM4TFpYQ094V1J6cDBXeFcwZUZub2hXTXVML0hM?=
 =?utf-8?B?emFmMVF0NzNWbE9NUFB4L1JtSjVLdmlNRVdVYWR2T01jTi9BRnpMQlVEcjly?=
 =?utf-8?Q?PVCuDdW2YRHPD7XAIKYZT2mbW7Ir0ILP5b?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f492d36f-6406-4ade-a4d7-08db94cd542f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 09:29:40.8439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sz4nwb0J3qAI2HKXCSlXyJmxA9L7y9JkcMPRmE2h1mtyRyIH3NPmNG9n2O2uK5uT3ZO/xcDCOT8xdgxkkXELxEcJEZUM21suzi2ZnwXWShs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5800

On 04/08/2023 8:23 am, Jan Beulich wrote:
> On 03.08.2023 22:36, Andrew Cooper wrote:
>> The opensuse-tumbleweed build jobs currently fail with:
>>
>>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c: In function 'rsa_private':
>>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:56:7: error: the comparison will always evaluate as 'true' for the address of 'p' will never be NULL [-Werror=address]
>>      56 |   if (!key->p || !key->q || !key->u) {
>>         |       ^
>>   In file included from /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:17:
>>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.h:28:12: note: 'p' declared here
>>      28 |   tpm_bn_t p;
>>         |            ^
>>
>> This is because all tpm_bn_t's are 1-element arrays (of either a GMP or
>> OpenSSL BIGNUM flavour).  The author was probably meaning to do value checks,
>> but that's not what the code does.
> Looking at the code, I'm not sure about this. There could as well have been
> the intention to allow pointers there, then permitting them to be left at
> NULL. Who knows where that code came from originally.

Do you agree that the patch is no function change, or are you saying
that you think I got some of my analysis wrong?

>
>> Adjust it to compile.  No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: George Dunlap <George.Dunlap@eu.citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Juergen Gross <jgross@suse.com>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> CC: Jason Andryuk <jandryuk@gmail.com>
>> CC: Daniel Smith <dpsmith@apertussolutions.com>
>> CC: Christopher Clark <christopher.w.clark@gmail.com>
>>
>> While I've confirmed this to fix the build issue:
>>
>>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/955160430
>>
>> I'm -1 overall to the change, and would prefer to disable vtpm-stubdom
>> entirely.
>>
>> It's TPM 1.2 only, using decades-old libs, and some stuff in the upstream
>> https://github.com/PeterHuewe/tpm-emulator (which is still abandaonded as of
>> 2018) is just as concerning as the basic error here in rsa_private().
>>
>> vtpm-stubdom isn't credibly component of a Xen system, and we're wasting loads
>> of CI cycles testing it...
> Question is whether people might be using it, and I'm afraid that's a
> question we can't answer. Would it be an alternative to disable vtpm in
> this container's stubdom configure invocation? Obviously as other
> containers have their compilers updated, the same issue may surface
> there then ...

Well that's why I CC'd some of the usual suspects, but all I'm
suggesting (for now) is that we turn it off by default.

~Andrew

