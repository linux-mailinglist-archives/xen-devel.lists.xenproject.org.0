Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEFB75A93D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 10:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566473.885344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMP0O-0004Ay-0W; Thu, 20 Jul 2023 08:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566473.885344; Thu, 20 Jul 2023 08:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMP0N-00048t-T9; Thu, 20 Jul 2023 08:27:23 +0000
Received: by outflank-mailman (input) for mailman id 566473;
 Thu, 20 Jul 2023 08:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMP0M-0001O5-B3
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 08:27:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ed4a9ee-26d7-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 10:27:21 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 04:27:20 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5760.namprd03.prod.outlook.com (2603:10b6:a03:2d3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 08:27:18 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 08:27:18 +0000
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
X-Inumbo-ID: 3ed4a9ee-26d7-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689841641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=XXnoIEPy2cRhu/QaPgs1CH70iHB0p1XBTTphYXH3ckY=;
  b=fUqtaBg7dbb+MW1cYVfTs79b3jH+ikwnS/2rzpk6HI4bRZMpHpz/jxEZ
   +hxyAMYN1CYpHyg4f38UMOdKIdRNqF3Zv0UPVe7C76D3j1rmBUqmvhpb1
   erABy+tKudbkkBQi35PaH4txHA7wEz66E62I8k1JpOApml0ubgP5oUuk3
   g=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 115539026
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4UlgYa0HFF2en3nz3fbD5fdwkn2cJEfYwER7XKvMYLTBsI5bp2MDy
 WpKUDyCOfmCMGTzc9Anbt6/px8D7JXQyd5kTARopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNkPagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfHWd32
 sA1GB00SQmOv9nm3quZZfkxr5F2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1UZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137KSxnKjAtx6+LuQxuFJmU/Nx2IvCxQIZVeEq9qojkSRYocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZiFFQMwrsokxXzNC/
 l2GhdTyHhR0raaYD3ma89+pQSiaPCEUKSoJYnYCRA5cut37+ths11TIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPuZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:fL1lFKshDPKuy0WyK92XRQr37skDddV00zEX/kB9WHVpmwKj5q
 eTdZUgpHnJYVMqMk3I9urwW5VoLUm9yXcX2+gs1NWZLWvbUQKTRekI0WKI+UyEJ8SRzJ846U
 6iScRD4R/LYGSSQfyU3OBwKbgd/OU=
X-Talos-CUID: 9a23:61A2+WB6U8063gr6EzVhzWEoN/AIS1rEwU/rc1GhK0l5FZTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AY9eNzgyWYTz9ZOpmaj/DwmY1aTOaqJSxK1kfz5Q?=
 =?us-ascii?q?Ih8qNKxx8BD2+nTC9bbZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,218,1684814400"; 
   d="scan'208";a="115539026"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9lJFxO167n6DDG/X+8W77o03XjdwMfTH25MsP1ItfzF9bYR8/jxXfahRXYzZfK2ytHJmkQPP6cJNBG2TNKiUjauzrjYVVE+AXLZPP7Li7A8nAOdIbV8sdQ5TNsOnhJEaYv+DC2GfHILr8kRFJbqLS4Hc1LQlm9B9A9ZDBXLWI6BjxDL3l92SmRxzc6ev2N5wWo0BjHJoJVuQCf73HtPAeOY+u1L6exZqd+BWJJkk9kYzjBFlxCb/kLML+V5bVRp2DIcx8IqCck92g5wzhkiVo6mzGGcxtohjoz807mVlqUIBNO6mUXD1Tvptg8zHnWJtd7YAA8eAWUN56yyBiFu8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaCpjdHP+ibZJJJugwXJB87F7i53rlocJEgAzu7noVg=;
 b=m6zIfmosf83sMkJG5g3C/yFv+vC4ZMHeHu6aAIaiUEs42yeDvREBPxHl3VtSSN76X94rEOoRXxOZFKPwivRY0WmqD+3HxyCvVOHH1pjEG97PdC9e7N3x9O3FnhlDEgDPtFDeRxFId+TAigIlet0FqNmhgLp68CDQ+6Luesd0lggxnKCXd7JJSrqfDDbdkpn57OaMAUtvnQ7a8j134vbxtFjhtcZOApt6ZJUupsfXcgl0QNqJn/TzrpY2sIxJ2JPEviS3ILQBNMhaOEEcKoWM6L7I0Bf32OB3wCafo+id0EXkufVP4egpXZGMa+mFJbGXznBHlI8F23iREaydOR4/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaCpjdHP+ibZJJJugwXJB87F7i53rlocJEgAzu7noVg=;
 b=KlNdtA4xKODJf/bo85J1PcuTSGO8ujKR1Ji31ZMG9kpmetNpGThh20ZO0V+b7mxNcmIX7DIy+otqYqaNL75Ekj33KJ0MZ5KtleFbVNE98N1GODJlc5zhz7b8ne39WA41cVmT24xn+4FwyyOixccc6wUjSyWPepCK8xg6vQvejh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 6/6] libxl: add support for parsing MSR features
Date: Thu, 20 Jul 2023 10:25:40 +0200
Message-ID: <20230720082540.69444-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720082540.69444-1-roger.pau@citrix.com>
References: <20230720082540.69444-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0172.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: 23918c70-e80c-41c6-9163-08db88fb212d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UZ/5+VG0W5B/cQ28m9JCm6f0xj8EmIYZGhDi0dw05YQlR/kff3c2+t7pOeW3Z9ullDZwtPbhKUTjb+2tkG6zAm/YPl+pClTnA/ivNG3982dq/nt2DraTIWekQuQHLxuJi1sqWut7oNzz6msw7COmAb1Ly+TBDadqIYTg3HgXQs9z3ej+LW0qY1N16amA6tHQetYR/DmqT3rctUrP2iLAZy9FvuvFWb+4amMx7aGGskE9BwWu8a13jZIxwfMDgbA+554aK0lbv5mXoGig2n/OzOgZKx+T1BinMa1g70O+bsxMkIGZoXKkQyWS8WIVRqi+S/tuI3v8XnUz4rsycIq5VVtw8Brr+JXw1Nc1XUWkMuky9wK7V3/fyEgpQu1mDxdXYO+6kx787ku+b+4HweIfdqyGiAzb3xOdfJ3Si56wzxUr8bq2gdZjCp8Q2+O7ktubcM0efs/LeJDxCi9NV9zITWkffYkuUaQwBLTlLHYTJyaT0V77+3Aq3NSdYhRsOITjrG87aD9xkM4jqLv5lAytm8A8JUTdjRqkknKyBGf7hPZO9/aRlUmjUacDUsdtEara
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(86362001)(478600001)(83380400001)(1076003)(186003)(38100700002)(41300700001)(26005)(54906003)(6916009)(8676002)(8936002)(316002)(2906002)(4326008)(6512007)(66556008)(66946007)(6666004)(66476007)(6486002)(6506007)(82960400001)(2616005)(36756003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHk5TVdTblRZRTBqLzZQb0c1OTBxQ2hNcmxMNHVNL0NMNHhldE1zZjNsVUZj?=
 =?utf-8?B?empCZlF0TUpjYTVYT1Y4SnozU0RlbHZ1THhFS0ExMmlwY25pTXE0UDUvUmhE?=
 =?utf-8?B?VElVbitxVEhzMGlFWmxLbG1jSUIwMDBiZFozTnAvTlYyajFQMG4xSk04RC9P?=
 =?utf-8?B?Rk5OUVdrOThmSERiN3BMZ2VVb3ZhWUtOMlp2MXZrZW9XMkFoWGJlZEFseW96?=
 =?utf-8?B?TExpWWptUFRrUWpMellMbkZ5Mm02QmlLWkJONVFxdzhUSHp0M0Q2dHNIanZN?=
 =?utf-8?B?TEZJdWJJTDFwck5OU2VGN2wrWnh2MXZPUmZCbUl5ckFMNVhmaStieHBKRlBI?=
 =?utf-8?B?dEorMlVObXhOOFJrNWdiUkNaaUFOQU1IcHJ0Y0JrNjlVVW52cDFkVVBUdTR4?=
 =?utf-8?B?SFg3UnBST1o5Rm5rQzdqQW12N3QxNkxPWUxXZGFNMEprbTU1aW1jOEVHeTJz?=
 =?utf-8?B?Uk9EZDlMVGowWkdqZERzbHJQTWVVVytVVFIxTlNKUit6ckRURnVSZjR5RHFo?=
 =?utf-8?B?THh0aXlsN0NHNEo4NGQ1WEsxdVgyNUV0aldHbmNpRDNPRVFtNUlhWVM0NGZO?=
 =?utf-8?B?U3dzQ3dkd2hJTjZoTC91TWsrVHNkUjMzZGJ0YnFNM052czlJb3VyeTVRSnJj?=
 =?utf-8?B?S1J4dm93ZHU1MSt6YURFTTFPSFNGTmlyM1VIYUNIWkZhSlFtRmlTWnBub1ov?=
 =?utf-8?B?WmlBU1ZtUE1LNnI4d3ZIbVQ4NEEyV3NuVkh4NmRiVEFTZWgrdzNoUlNoZ09T?=
 =?utf-8?B?aVJVNHBpSGxhbzZyNytNdkhRNzlXckF1eWNQWklCb2t6M3NUUENKWW4rZUR4?=
 =?utf-8?B?bjdma0dmcmZvOHFkTWhEVjltTzRrM201em52am8vMWxDUVp4WEFKdzlSLy9B?=
 =?utf-8?B?eTN1K3Y2REVCWW1XZ2J3OFdDYmdTaHp5enJXYnJEL201REhkNFFCcTNZSUkx?=
 =?utf-8?B?eCs0U09VS0JOaGVUcWRUOCtYRW1hanBCMHpLM2pKWFhQMmVaelJLTisvalRO?=
 =?utf-8?B?TnVsck1nWnlQWCtVLzhaZm1BT3V6U3FyMmgwek5PaVZDLzA3RFFnWUdKSXI5?=
 =?utf-8?B?T1NJVXVJQi9hdEE1ZE9hcG9YMy9qYUtFOWFhUWxOVzVNM0NlcDU3TUtsZUo2?=
 =?utf-8?B?Y1hEK1o2ZW93VS9WWlg5WGpNeE1zYnVVNTk0VzE5QU5UaXc5dk5YVG9oejd5?=
 =?utf-8?B?TDA3SzEwbzAzdEQ2TFJGTmlaV28ySW1aUmp4bnN1QmFLd1VtbXluYm5qcDRH?=
 =?utf-8?B?ZitlOGFmcTlkSG9HTDYxblhidDN2SFBSOVNqS0Z4R1FwajNMN0NBT3BYeUth?=
 =?utf-8?B?WE95NUJZd2g5L0hncGZVUHJSc2Z4Sy9nTWZkVm9HcTh4bHBoblp2bnBWV3h6?=
 =?utf-8?B?YzZCNDREbGNvTStZb1pBcXJGK01yL1gyWDZNOERTR1RRTFVGZzd5aGdZZ3Ez?=
 =?utf-8?B?Y1RibG44S1lXUkt6dGsvUDBCWStnQjQ0VUNIck5HdVV5V0F5dUFLMXVSTVlr?=
 =?utf-8?B?YzBENVlRenI3VFdYQkVBZ0MxUXk1UGNxdU9UZzViWlhCSjNVSXlVSFlYVTE2?=
 =?utf-8?B?Nmp5bHBhaVExaFpkTnhtcjd6bGVEUU8vbUNqT2pRVzZ5bXJFbmhNbUhwVDNr?=
 =?utf-8?B?WUpEYmNWS3IwMnRlOGdtUlpFQjdtWkdoU083MThnN29aUGs1WDM1WkVwRXA4?=
 =?utf-8?B?K0tCWS9FRkpyeTFuZmFuRjZaSDVqV3lOZkplZy9LR2xvaW5qZXdocVdLVnhh?=
 =?utf-8?B?R1ZpaWRlakFuUk81blJlV0dtUlVIVnh2QnVZZjZxR3dwUm5HS2VLVWJUSGoy?=
 =?utf-8?B?dWVMQXJQMWNiWjhvWXJEYXB5Ujh0ckJUQUY5T3d4aTdKaW82a0duS0lBYWRK?=
 =?utf-8?B?Ym16akMxaWxEU1dOTVk5VlRqQnhVM2xGOHUrZnQ1Y2FzRXZBaHlCem5xc0E0?=
 =?utf-8?B?QVVSbDdjcWhRekhnUVBENU5heERXNEduSEg0dTJ2bXdhZE5FQng5cFIzYW5k?=
 =?utf-8?B?dFcwYzJsUFFuWm96cnFleDNSN1BmaDhMN2JtekQyZ1JYUDA2QjR1YVZFZFFX?=
 =?utf-8?B?N3FFTUlRLzNJWjQ1QmNoSm1OVHVRSlhCc1k0dnRJQWpDQjVFZE5mbmIvSjRU?=
 =?utf-8?B?THZFMTZpamo1MUN0WWUvS0dnTEhFMittM2NpR0MrVWdQclpTa3QrS21Mc1FR?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oETtcmSLBn+41zQ06RcJyF5ymU2yCHOoEzfTWB42+3B4gJS3ezBg/q1VNN8ilWLDBGDeDuCa1Wjngb/SpzQNAGJ4gyg0W+6YnDcha4v6M8zUFRKVqRjuh129UGBM0rIysFYXSnEfdjVywqJ0/6uDIlozjMLwzRVaZtA45xS6YbIq4ndnOt3CmoRvbmQnLQnVlDPxoRdlVKnZ4kPq2WSXhTKSvBSQJZ2tJXmJzIaglA+pDH3Apnfk2erJs6Yji1SMcs6w4EuEdgREv3b3vGKieOu784kCtWfPxXl+r76+E1NUYPLTOG9jWtIJDN29KBJtCVSepWYFqB3Xi4V7WIa1Jk5ehu0M4/lc4+dgLMnjjbEhJzLQzcbhBKxeMHmbz96Fzefrl2CpVVV7EonB9D56pF6ss/5Dn8di2Tj3LbcVAykFC07gkBJE2IKG/Qqb1gqElxAbrlTkg29u1Bo+gugqnlFgqhyzF/W4elqqoj0UhE7mmC07FU5yH9OLBLkoON5claaR1G5DJvBEZLKaUMubCQTncVQbKAB4ALTCPLunZaIn508ungwuU+a4njdPZ1tiq0aEiApN1V/3yI/k8CsvYXWmmXb9edqOoLdzlsKhhlDMrVb+MvWj3QZ0m9NOenFZ2OLPqn4Mx7rsT9wlYjc0N/q40wPZXPThHXntc0ZOBYB+QZyXyjuKXxgm5Sngj9/G+B3UC0UOHizMZ3gV49HK1wywg7JEXNGpx92hCBmqWOeHTgtzY62sxwRoGvAqp0kIddMgvKx0fPcXAx2PPYi8AVagfDHPKyYXIgHJudZBSFoOykY2e5CSlWbnnFyLpP6j
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23918c70-e80c-41c6-9163-08db88fb212d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 08:27:18.0487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9WLJr3r12xkh5oa+1mNTP//HfQdzGYSuIRzLqqACLZDOgy9gxiYsNzB77Gy5HO7rvRTA4hmp99Hm4/LfqUIRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5760

Introduce support for handling MSR features in
libxl_cpuid_parse_config().  The MSR policies are added to the
libxl_cpuid_policy like the CPUID one, which gets passed to
xc_cpuid_apply_policy().

This allows existing users of libxl to provide MSR related features as
key=value pairs to libxl_cpuid_parse_config() without requiring the
usage of a different API.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v2:
 - Add some braces.
---
 tools/libs/light/libxl_cpuid.c | 64 +++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index f8b2e45ee681..15fac03a9046 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -157,6 +157,60 @@ static int cpuid_add(libxl_cpuid_policy_list *policy,
     return 0;
 }
 
+static struct xc_msr *msr_find_match(libxl_cpuid_policy_list *pl, uint32_t index)
+{
+    unsigned int i = 0;
+    libxl_cpuid_policy_list policy = *pl;
+
+    if (policy == NULL)
+        policy = *pl = calloc(1, sizeof(*policy));
+
+    if (policy->msr != NULL) {
+        for (i = 0; policy->msr[i].index != XC_MSR_INPUT_UNUSED; i++) {
+            if (policy->msr[i].index == index) {
+                return &policy->msr[i];
+            }
+        }
+    }
+
+    policy->msr = realloc(policy->msr, sizeof(struct xc_msr) * (i + 2));
+    policy->msr[i].index = index;
+    memset(policy->msr[i].policy, 'x', ARRAY_SIZE(policy->msr[0].policy) - 1);
+    policy->msr[i].policy[ARRAY_SIZE(policy->msr[0].policy) - 1] = '\0';
+    policy->msr[i + 1].index = XC_MSR_INPUT_UNUSED;
+
+    return &policy->msr[i];
+}
+
+static int msr_add(libxl_cpuid_policy_list *policy, uint32_t index, unsigned int bit,
+                   const char *val)
+{
+    struct xc_msr *entry = msr_find_match(policy, index);
+
+    /* Only allow options taking a character for MSRs, no values allowed. */
+    if (strlen(val) != 1)
+        return 3;
+
+    switch (val[0]) {
+    case '0':
+    case '1':
+    case 'x':
+    case 'k':
+        entry->policy[63 - bit] = val[0];
+        break;
+
+    case 's':
+        /* Translate s -> k as xc_msr doesn't support the deprecated 's'. */
+        entry->policy[63 - bit] = 'k';
+        break;
+
+    default:
+        return 3;
+    }
+
+    return 0;
+}
+
 struct feature_name {
     const char *name;
     unsigned int bit;
@@ -336,7 +390,15 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
     }
 
     case FEAT_MSR:
-        return 2;
+    {
+        unsigned int bit = feat->bit % 32;
+
+        if (feature_to_policy[feat->bit / 32].msr.reg == CPUID_REG_EDX)
+            bit += 32;
+
+        return msr_add(policy, feature_to_policy[feat->bit / 32].msr.index,
+                       bit, val);
+    }
     }
 
     return 2;
-- 
2.41.0


