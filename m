Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8459375C616
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 13:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567497.886617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMoeX-0000vC-7T; Fri, 21 Jul 2023 11:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567497.886617; Fri, 21 Jul 2023 11:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMoeX-0000tD-4g; Fri, 21 Jul 2023 11:50:33 +0000
Received: by outflank-mailman (input) for mailman id 567497;
 Fri, 21 Jul 2023 11:50:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNy0=DH=citrix.com=prvs=559993d03=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMoeU-0000t2-Ds
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 11:50:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c81657d4-27bc-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 13:50:28 +0200 (CEST)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2023 07:49:56 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5005.namprd03.prod.outlook.com (2603:10b6:208:1a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 11:49:54 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 11:49:53 +0000
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
X-Inumbo-ID: c81657d4-27bc-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689940227;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=i/64G+VxsntXQCDfs68RSMXInkh2KmwKsgtD3J+iJ+4=;
  b=cxPGcAYTvVBOg54LOrWm/5RD811uPrt7uL5YHGYXQRXA/0+aiAfTOW/b
   9NGFJmHJhhV8c9jUevMjBSH/gTNiUY+BLSWIt0NsOPVWAGCMerNyiTX7P
   /Znlo/yqpswmIMauQTNYpRpzAXrsLoba0JcRRjNlXj6dlxFac/0MiLwkA
   o=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 116284130
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:t7M4Jqz5N4P7eMlg5IF6t+fwxyrEfRIJ4+MujC+fZmUNrF6WrkUCm
 jQZC2rQOayOZ2r3L9gnb963pEpX7cfdyNNlHFNv+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhP6kT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KW5Jz
 +0aeCkJVTyGl9Om7eqmeNEr2tt2eaEHPKtH0p1h5RfwKK9+BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVQquFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aRx3OnAdlKfFG+3tgxikev10wtMzEfWXCKitaCkHS+XPsKf
 iT4/QJr98De7neDcN75WBGppW+eiTQVUdFQDu4S5RmEz+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8ije/OjMcK2MYUgYCQREY+NnooIw1jRXnQ85qFei+ididJN3r6
 zWDrSx7gqpJi8cOjv2/5Qqe22nqoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaLhl8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:vBXziKj9b8OWMvMMUbQi0lQ8YXBQXrkji2hC6mlwRA09TyX4ra
 CTdZEgviMc5wx9ZJhNo7q90cq7IE80i6Qb3WB5B97LYOCMggeVxe9Zg7ff/w==
X-Talos-CUID: =?us-ascii?q?9a23=3ASQUvRmqIpNczqWDGHwmx7JXmUc8iSGzfnG7UGGO?=
 =?us-ascii?q?9GVd5ZeWIe2fXpLwxxg=3D=3D?=
X-Talos-MUID: 9a23:HIICmwhKBffhs//GG7BIZsMpEpxi+Zi/KH42vZwKkPivGhdqATeapWHi
X-IronPort-AV: E=Sophos;i="6.01,220,1684814400"; 
   d="scan'208";a="116284130"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWd/d/Ddj29TuLW5snPewHW4W3mcrshE8IuVZMWQlDOH5benqbh8W8MWEoSIRTQH07fUfQOhkpPyVqQhPVp9LCjqM1WCx760AW+LYJChiy1bjnBuf0F3PFHKG401lRxUcd2+89t8pTDoqHs8jnSEVdLBrFXebMY9GtMpiNEC+3uaup4k+2AFXDJpRE5BjbeuVzTnxQPjLFvKOwP/hNydRfGMDhW2Wcpq14tuOggEDWK5ENtSEt2IAksWA5Etd37SN9ctC6yfhMAkPJFLmuSuZQypxQBCHeKb0xkifpIt2JUasoqfYP2quRocOmB3ICNBCSxE+AY7+C2g8PAvAco+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFVPbUhyJa/3gyeFpGQ8TI2wBK1/1s1wphfArc12J18=;
 b=SRHi3NvejGk6B4LQwa3tiVZs3vksa8XRaCk5aEnhcli8p7qAger/qh3DUZfrVoY+Z6a3lNm7Jl0GiAbPwJ4VrB41x4v7ALKj4aw8A0M+/paXBy8hLmPuuwZq6EsoS/ECdFYmVoTGzY7ewvLRjeYB5T3+huY9nQHYb4YGsT7LLNLJ5nfSwHn7Tic4IhQZlBcgcA/IE/ee8Vtz01aCoHqvHRkPZgCX8PC9hYiEVIcgY/Rw0YpD3VMTsvJfqpQbC5HsERTct8ImGDg4oeZ5D1WA1MKBBFNQYj4JA3oImSgqBo1EQfhthE4O7Rpc0+RSu3XTe448xaS4zZd/Tk06qlSV1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFVPbUhyJa/3gyeFpGQ8TI2wBK1/1s1wphfArc12J18=;
 b=HtXMhbmmEI+hdELGTPQbIvua8xf65I1KA/EKM/jheXoAHyI+QJWF0duuFc3T7fzyT9ZvZkuHqbXMHyAAyNrsowTX/ubI0HTehKD6fg46X9cZhMzs0XdwLoKQhFYdcXp/MPWfIos411Ww4ppXbGbu9bSr8QRj9KJvqT8eBsgWmAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Jul 2023 13:49:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 07/13] vpci/header: handle p2m range sets per BAR
Message-ID: <ZLpw2618XT8X3IA8@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-8-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230720003205.1828537-8-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P123CA0197.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5005:EE_
X-MS-Office365-Filtering-Correlation-Id: 86122ec9-aeaf-4ec6-3068-08db89e098d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nrDlIQTY3x10ax8k7bW4NxGsUWu7FxcxRuB+otCMqYgMkPEVlDjxGuBCzDamIjQ4wxvxsWtPF7hKBThFLCMUkseeRC79SdBMD329F34+NjlFParX+XIH8sX3Jd5UybeP3rvyRKsDtYOOdLnYcFwEA5zEgwlpHGiRQgkJ/DiONFzF2p181lmx1ksSe1vWIfGIIK1gMP7zky90uTKFt304qr6/gjgJuDaOSwW6hh+sSORIC6X9ViiMKHOeDDFNBaxE2TFFwAVtEhoInjmI0fHMt/AXmCWistFT8T+4HwCNqY37Ytc8s1qtgTWW5a2AbC26jiP9dvcy091TVsq3e3F86WwgCVH8/odtXWrKfGwzuVFzPthBkTYJyV8SRC4KqjaQCCI0Qgxga4Jvps4iHOiAeX1nEIJe3+YxBC4wOQvS+LfRrSGxj0HxoXqz/SN6HxZ9Ts+3uoLN3wOn2EGpWH3qYSF1wJVsgfx2PJeXQVoCkWQ3fu1OjqaxZv+PKRrIJpXmGvbzH5v46nCgmnQAwp0u+Oo3akRjUg4JlTCajDRY4WFFhtBjHMlepi0KyLrzQZ1Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199021)(9686003)(6512007)(6666004)(66946007)(4326008)(6916009)(66556008)(66476007)(85182001)(6486002)(2906002)(54906003)(316002)(478600001)(86362001)(6506007)(83380400001)(186003)(82960400001)(38100700002)(5660300002)(30864003)(8936002)(8676002)(41300700001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUdDaFZiblJ4S0pHanlESnIrRGUycVFzdkVINHc3OGxWbmdpS0toOW9NY1A3?=
 =?utf-8?B?Q3pIN05JTURndXM4NXZnTnZ4eVdnMFdNcjNrRjdPekNMNEplYnM1T0pNdWln?=
 =?utf-8?B?dEVPbDh4c1dLbERkT1cxTTlHMHdkUjhmMUdRNys0SVVXRWF3dVBYQWpqZ3gw?=
 =?utf-8?B?TGhrb205ck12NzJ6dHFqekNoMkhuODJTUHZta25HQTRrdFVqanZSZCt0UTla?=
 =?utf-8?B?TjlucmJMK2lEWE5CRXc4SXNLL21STGpnQkkwaVNuVGNYb2NXS2N4Sk1naTBF?=
 =?utf-8?B?dUg0S0dpcGtOMVRQNGNVcUVFSlNPTjZoU0RqME03dmFXeldSMUVKblMxSmF0?=
 =?utf-8?B?cDBudFh0YnY5b0QvVHZhMWxCaHU4YTZEK0NxS3h2RDlQSHR3cENRWG55Qy9p?=
 =?utf-8?B?M2ZwODQ5MkhJV21kNnNsQXVsS2dobjNoL21KdktjWk1WcFdCYWkrc2M5NVZU?=
 =?utf-8?B?TDhEU1pwZVZUTkQwRkxNRVljckpjSXY3SkczS2pzRHBxcjJvb2xqNXRmVDYr?=
 =?utf-8?B?T2RaYlZhMkJkc0ZyMi9IMEZXVXFkem42NnVBZER3NDdBeVh2ekNuVUVRL2E3?=
 =?utf-8?B?VG5WdkIxdUpHNmJRcFUyYVJBdFVQMGQydGg5cUpZcnN4MWt6R0U0WVVJYkhJ?=
 =?utf-8?B?VExRU2cvT2o0WlhqS0NHQU5BZ3IzVmhQVC9zbFB4UTdlYnY1WmtEdWVDTVZU?=
 =?utf-8?B?MHp6UGF4bFBJemRPRkEvNUo5YThIOWp4NHphVUhiZE5SN1hBK2JlS1RZbmc2?=
 =?utf-8?B?UE9LNXdDWmZSTi8zaHZRZGZEMlJOVkx1Y1RZQWJpeEJnWStGM2VzVmVFWUlN?=
 =?utf-8?B?RE0vWXlMTDZNTWZvbERkNWxNdkVjNXBva294ZmppSHhKKzU0YjVlYVVLKzBY?=
 =?utf-8?B?V2d1dmN3QU94bFVsSHZCNERBL3FVeUgvM0tuSURkTm1nTzk1N0hxNWlKTVF0?=
 =?utf-8?B?eXErdVJVNUlXZmNvS2l1Nm5nZXlYVlJlSEk0TWNVcGFBTkZKV3RsWTE4dWZE?=
 =?utf-8?B?Z1BCM004eHRIWHJMcmQrbDkvdFJHUXR5M1c1K3oyRkhmVTc5TlFBK2RzT29W?=
 =?utf-8?B?eHJBRDdWVXQ5aHI2Q05FMThZY056b2o0Ry9LeWEvRHdoL3MvMzNzZ0ZaZm5S?=
 =?utf-8?B?VlhGbGZuK0dJd0NSM2ZnUEUvN1E1MzlEbGhNWkozN2k2QTRqN0d3WlVHRjE4?=
 =?utf-8?B?dXJmY0FxQUZtSnlMa3FtZldiemNld3VjWmRGRHRFa1hhOFN5WHFQN3ExcXFm?=
 =?utf-8?B?UldxZzRuTE1WSkEzUlBLSi9EVXFqck5YRzQ4ZW15b3JyeWw2YnlYQWNiREMv?=
 =?utf-8?B?OW5jaTVmWDAxcUd2cGJSQkdKQ0FHYVdIYzYwejMyMWUxOFh2ZUdRcUp1TFh0?=
 =?utf-8?B?L2RNNEgvNjZXZDEyd01UNkU3ZkU0VFlaZDVrUkcwaThBaGtpTGlXc01nekNz?=
 =?utf-8?B?Z21IRWVWUzcwc05RMEl1Vks5RFFLc3Mra0hWRStYWEVWQ1Z2dk8raElBaEdE?=
 =?utf-8?B?Y04zWjZmMVBQWGNJOW9KZy9HMG16bDBhSWZ4WDVvVnoxVG5DSmYwRDh2Q0VM?=
 =?utf-8?B?Zjl3ZitqM01zVGlDVVdqdHY1RmtPSnFtV1ZMKzVFQ01mLzBWVzBqblJGWjR3?=
 =?utf-8?B?Uk1IK2VvVFVTQ1FJVUpZN2pRaTFNWlJSN2h0b3graytBQUdHNnh6Qit6NGxr?=
 =?utf-8?B?RU9Ed2dtczQ4ZDIybG12YXRNUCtGUGxpZnk1dDhHTUpFZExmdmpRWU5lVktC?=
 =?utf-8?B?Q3VTL0pPdVJXc1VXN0U4WG5tZk1mdGVRZ1B4SWhmR3VlMkZBaUtIZ0FOaXBk?=
 =?utf-8?B?NXlhNU9Mdi9iTjRZejg1dHFVblhhM1ZBTVFJYUhXZnlnMGUwY0k2Zk83TUVs?=
 =?utf-8?B?RTBuUU0vaW1KRkJDZnVGaHlsQ2dQbzk0QVRwQUIxOHRPOW1MUE1PT3BnUjhI?=
 =?utf-8?B?b3pqQkdIT0dXNXp1RjRxQm5HcW5EdHBsRk1sZjVrMkpXYXBZSDBvSHdhM2Fx?=
 =?utf-8?B?VC9VSEFLYVVkbFpuWHAwa3hnWkgzbFVHTFYrdnFGMGhvby9oTEhnZ1h1bkxr?=
 =?utf-8?B?dVFrdlJaVll3cWVZQm5zeTZ3QTByeFV6emRsdFBmWWg3VkRjSmVWUUxuSWNG?=
 =?utf-8?B?anhpRjFuMklTNXlLMlRhUzlyc21PTURvU0lQcFZhNEl5ZHBTc0krSkNqR2da?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9lLEf1BjwTF+5G4oKwIp28wJiRwqGB+nbyOV36c6kkOqKjv1RMyMTOl6ZhpDp1ytKzAYpx3j8Z0JPn1Nh8UHiXLN1gV1xNGVlzJuPeSyViabNGmp6CUnAck0ugpdz8Di9EIFW3mYYhtCpsXwapAsD/jfqvDvJr05dGmsuBWortqDSw/AXbRC3SQZ12n2D1nSZ4pF9ZF39j+xIN5reBti7JnTTtgo2ajJbKMJrmEfqT49OhIvm1LOf0jwTu/D8C089nJRMMNOLxyx9s29WwVcwLEh53LRLw6GY1Q3H0KEnG7sCnx0qP4AiBnisCs43sJ0swaqbU4OwfQvABwpZ4mc5JfY8ujTPZO1UfV3IGijVsudcwO6KrDKFY1PlxadVK6sBye+6IQxfkiJ8Sewy/+Ct9Lgb/IxbWY+dF/WevijCE1M1Q1BU9gBKWE1WvmKUP0j4TNn8WUsYotFKDdZLkEoyQzCRqxDYnUR83zDzLL+AI8V/HXbKT2d5EbAVC+UAv6iEh4UpUnD8kn9/zXiMMRqadMW6qW3smJmbmJVmdl32zONE1uY6XiW5FruwhmpoXYTrvBH2KvhKjPMiwPWZOZ6wVLkjV7Drq8UvURMRm06xPF+LvHDKw37EtwWPAAVr18WsYykov7f7eBtzAQGO3IwcCYdxZENx6W+Dak1uI2i90/LPKvp+2NMehfzG1ezkNC8Ps25QWpXi7PmTiaphOhvPl9HCWaDUtVHxUMwkV2f9XFO9dPs6NHhQEwK324Au4tkE30cWI/nXG717ohKg2teWE+biAiYJdOJWVaZxTVOQLQzDmt3mXtjx3ZiTeR/S+Xz
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86122ec9-aeaf-4ec6-3068-08db89e098d4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 11:49:53.5085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8iH65UvYWYObqT09YRVlB44vFapVv9NsBu+f11SBCrArfedBF0PIoqn084QrQHmujMelb06wCBvR+Rdh//DMOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5005

On Thu, Jul 20, 2023 at 12:32:32AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Instead of handling a single range set, that contains all the memory
> regions of all the BARs and ROM, have them per BAR.
> As the range sets are now created when a PCI device is added and destroyed
> when it is removed so make them named and accounted.
> 
> Note that rangesets were chosen here despite there being only up to
> 3 separate ranges in each set (typically just 1). But rangeset per BAR
> was chosen for the ease of implementation and existing code re-usability.
> 
> This is in preparation of making non-identity mappings in p2m for the MMIOs.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v6:
> - update according to the new locking scheme
> - remove odd fail label in modify_bars
> Since v5:
> - fix comments
> - move rangeset allocation to init_bars and only allocate
>   for MAPPABLE BARs
> - check for overlap with the already setup BAR ranges
> Since v4:
> - use named range sets for BARs (Jan)
> - changes required by the new locking scheme
> - updated commit message (Jan)
> Since v3:
> - re-work vpci_cancel_pending accordingly to the per-BAR handling
> - s/num_mem_ranges/map_pending and s/uint8_t/bool
> - ASSERT(bar->mem) in modify_bars
> - create and destroy the rangesets on add/remove
> ---
>  xen/drivers/vpci/header.c | 235 ++++++++++++++++++++++++++++----------
>  xen/drivers/vpci/vpci.c   |   6 +
>  xen/include/xen/vpci.h    |   3 +-
>  3 files changed, 181 insertions(+), 63 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 5dc9b5338b..eb07fa0bb2 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -141,63 +141,106 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>  
>  bool vpci_process_pending(struct vcpu *v)
>  {
> -    if ( v->vpci.mem )
> +    struct pci_dev *pdev = v->vpci.pdev;
> +    if ( !pdev )
> +        return false;

I think this check is kind of inverted, you should check for
vpci.map_pending first, and then check that the rest of the fields are
also set (or complain otherwise as something went clearly wrong)?

> +
> +    if ( v->vpci.map_pending )
>      {
>          struct map_data data = {
>              .d = v->domain,
>              .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
>          };
> -        int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
> -
> -        if ( rc == -ERESTART )
> -            return true;
> +        struct vpci_header *header = &pdev->vpci->header;

You need to hold the per-domain rwlock in order to access
pdev->vpci.

> +        unsigned int i;
>  
>          write_lock(&v->domain->pci_lock);

Holding the lock in write mode for the duration of the mapping is
quite aggressive, as the mapping operation could be a long running
one.

Is this only locked in exclusive mode in order to have the right
locking for the vpci_remove_device() call below?

If so we might consider using a different error handling in order to
avoid taking the lock in exclusive mode.

> -        spin_lock(&v->vpci.pdev->vpci->lock);
> -        /* Disable memory decoding unconditionally on failure. */
> -        modify_decoding(v->vpci.pdev,
> -                        rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
> -                        !rc && v->vpci.rom_only);
> -        spin_unlock(&v->vpci.pdev->vpci->lock);
> -
> -        rangeset_destroy(v->vpci.mem);
> -        v->vpci.mem = NULL;
> -        if ( rc )
> -            /*
> -             * FIXME: in case of failure remove the device from the domain.
> -             * Note that there might still be leftover mappings. While this is
> -             * safe for Dom0, for DomUs the domain will likely need to be
> -             * killed in order to avoid leaking stale p2m mappings on
> -             * failure.
> -             */
> -            vpci_remove_device(v->vpci.pdev);
> +
> +        for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +        {
> +            struct vpci_bar *bar = &header->bars[i];
> +            int rc;
> +
> +            if ( rangeset_is_empty(bar->mem) )
> +                continue;
> +
> +            rc = rangeset_consume_ranges(bar->mem, map_range, &data);
> +
> +            if ( rc == -ERESTART )
> +            {
> +                write_unlock(&v->domain->pci_lock);
> +                return true;
> +            }
> +
> +            spin_lock(&pdev->vpci->lock);
> +            /* Disable memory decoding unconditionally on failure. */
> +            modify_decoding(pdev, rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY :
> +                                       v->vpci.cmd, !rc && v->vpci.rom_only);

This need to also be moved out of the loop, or else you would be
toggling the memory decoding bit every time a BAR is mapped or
unmapped.  This must be done once all BARs are {un,}mapped (so outside
of the for loop).

You will likely need to keep a call here that disables memory decoding
only if the mapping has failed.

> +            spin_unlock(&pdev->vpci->lock);
> +
> +            if ( rc )
> +            {
> +                /*
> +                 * FIXME: in case of failure remove the device from the domain.
> +                 * Note that there might still be leftover mappings. While this
> +                 * is safe for Dom0, for DomUs the domain needs to be killed in
> +                 * order to avoid leaking stale p2m mappings on failure.
> +                 */

You are already handling the domU case, so the comment needs to be
adjusted, as it's no longer a FIXME.  We might consider to just remove
the comment at once.

> +                v->vpci.map_pending = false;
> +
> +                if ( is_hardware_domain(v->domain) )
> +                {
> +                    vpci_remove_device(pdev);
> +                    write_unlock(&v->domain->pci_lock);
> +                }
> +                else
> +                {
> +                    write_unlock(&v->domain->pci_lock);
> +                    domain_crash(v->domain);
> +                }
> +                return false;
> +            }
> +        }
>          write_unlock(&v->domain->pci_lock);
> +
> +        v->vpci.map_pending = false;
>      }
>  
> +
>      return false;
>  }
>  
>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> -                            struct rangeset *mem, uint16_t cmd)
> +                            uint16_t cmd)
>  {
>      struct map_data data = { .d = d, .map = true };
> -    int rc;
> +    struct vpci_header *header = &pdev->vpci->header;
> +    int rc = 0;
> +    unsigned int i;
>  
>      ASSERT(rw_is_locked(&d->pci_lock));
>  
> -    while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
> -        /*
> -         * It's safe to drop and reacquire the lock in this context
> -         * without risking pdev disappearing because devices cannot be
> -         * removed until the initial domain has been started.
> -         */
> -        read_unlock(&d->pci_lock);
> -        process_pending_softirqs();
> -        read_lock(&d->pci_lock);
> -    }
> +        struct vpci_bar *bar = &header->bars[i];
>  
> -    rangeset_destroy(mem);
> +        if ( rangeset_is_empty(bar->mem) )
> +            continue;
> +
> +        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
> +                                              &data)) == -ERESTART )
> +        {
> +            /*
> +             * It's safe to drop and reacquire the lock in this context
> +             * without risking pdev disappearing because devices cannot be
> +             * removed until the initial domain has been started.
> +             */
> +            write_unlock(&d->pci_lock);
> +            process_pending_softirqs();
> +            write_lock(&d->pci_lock);
> +        }
> +    }
>      if ( !rc )
>          modify_decoding(pdev, cmd, false);
>  
> @@ -205,10 +248,12 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>  }
>  
>  static void defer_map(struct domain *d, struct pci_dev *pdev,
> -                      struct rangeset *mem, uint16_t cmd, bool rom_only)
> +                      uint16_t cmd, bool rom_only)
>  {
>      struct vcpu *curr = current;
>  
> +    ASSERT(!!rw_is_write_locked(&pdev->domain->pci_lock));

No need for the double !!.

> +
>      /*
>       * FIXME: when deferring the {un}map the state of the device should not
>       * be trusted. For example the enable bit is toggled after the device
> @@ -216,7 +261,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>       * started for the same device if the domain is not well-behaved.
>       */
>      curr->vpci.pdev = pdev;
> -    curr->vpci.mem = mem;
> +    curr->vpci.map_pending = true;
>      curr->vpci.cmd = cmd;
>      curr->vpci.rom_only = rom_only;
>      /*
> @@ -230,33 +275,34 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>  static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  {
>      struct vpci_header *header = &pdev->vpci->header;
> -    struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>      struct pci_dev *tmp, *dev = NULL;
>      const struct domain *d;
>      const struct vpci_msix *msix = pdev->vpci->msix;
> -    unsigned int i;
> +    unsigned int i, j;
>      int rc;
> +    bool map_pending;
>  
>      ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>  
> -    if ( !mem )
> -        return -ENOMEM;
> -
>      /*
> -     * Create a rangeset that represents the current device BARs memory region
> -     * and compare it against all the currently active BAR memory regions. If
> -     * an overlap is found, subtract it from the region to be mapped/unmapped.
> +     * Create a rangeset per BAR that represents the current device memory
> +     * region and compare it against all the currently active BAR memory
> +     * regions. If an overlap is found, subtract it from the region to be
> +     * mapped/unmapped.
>       *
> -     * First fill the rangeset with all the BARs of this device or with the ROM
> +     * First fill the rangesets with the BARs of this device or with the ROM

I think you need to drop the 's' from BARs also.

>       * BAR only, depending on whether the guest is toggling the memory decode
>       * bit of the command register, or the enable bit of the ROM BAR register.
>       */
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
> -        const struct vpci_bar *bar = &header->bars[i];
> +        struct vpci_bar *bar = &header->bars[i];
>          unsigned long start = PFN_DOWN(bar->addr);
>          unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>  
> +        if ( !bar->mem )
> +            continue;
> +
>          if ( !MAPPABLE_BAR(bar) ||
>               (rom_only ? bar->type != VPCI_BAR_ROM
>                         : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
> @@ -272,14 +318,31 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              continue;
>          }
>  
> -        rc = rangeset_add_range(mem, start, end);
> +        rc = rangeset_add_range(bar->mem, start, end);
>          if ( rc )
>          {
>              printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
>                     start, end, rc);
> -            rangeset_destroy(mem);
>              return rc;
>          }
> +
> +        /* Check for overlap with the already setup BAR ranges. */
> +        for ( j = 0; j < i; j++ )
> +        {
> +            struct vpci_bar *bar = &header->bars[j];

This is kind of confusing, as you are defining an inner 'bar' variable
that shadows the outside one.  Might be better to name it as prev_bar
or some such, to avoid the shadowing.

> +
> +            if ( rangeset_is_empty(bar->mem) )
> +                continue;
> +
> +            rc = rangeset_remove_range(bar->mem, start, end);
> +            if ( rc )
> +            {
> +                printk(XENLOG_G_WARNING
> +                       "Failed to remove overlapping range [%lx, %lx]: %d\n",
> +                       start, end, rc);

Might as well print the SBDF of the device while at it (same below).

You could also consider using gprintk instead of plain printk, and
avoid the _G_ tag in the log level.

> +                return rc;
> +            }
> +        }
>      }
>  
>      /* Remove any MSIX regions if present. */
> @@ -289,14 +352,21 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>          unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
>                                       vmsix_table_size(pdev->vpci, i) - 1);
>  
> -        rc = rangeset_remove_range(mem, start, end);
> -        if ( rc )
> +        for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
>          {
> -            printk(XENLOG_G_WARNING
> -                   "Failed to remove MSIX table [%lx, %lx]: %d\n",
> -                   start, end, rc);
> -            rangeset_destroy(mem);
> -            return rc;
> +            const struct vpci_bar *bar = &header->bars[j];
> +
> +            if ( rangeset_is_empty(bar->mem) )
> +                continue;
> +
> +            rc = rangeset_remove_range(bar->mem, start, end);
> +            if ( rc )
> +            {
> +                printk(XENLOG_G_WARNING
> +                       "Failed to remove MSIX table [%lx, %lx]: %d\n",
> +                       start, end, rc);
> +                return rc;
> +            }
>          }
>      }
>  
> @@ -341,7 +411,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                  unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>  
>                  if ( !bar->enabled ||
> -                     !rangeset_overlaps_range(mem, start, end) ||
> +                     !rangeset_overlaps_range(bar->mem, start, end) ||
>                       /*
>                        * If only the ROM enable bit is toggled check against
>                        * other BARs in the same device for overlaps, but not
> @@ -350,12 +420,11 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                       (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
>                      continue;
>  
> -                rc = rangeset_remove_range(mem, start, end);
> +                rc = rangeset_remove_range(bar->mem, start, end);

Urg, isn't 'bar' here pointing to the remote device BAR, not the BARs
that we want to map?

You need an inner loop that iterates over header->bars, much like you
do to handle the MSI-X table overlaps.

>                  if ( rc )
>                  {
>                      printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
>                             start, end, rc);
> -                    rangeset_destroy(mem);
>                      return rc;
>                  }
>              }
> @@ -380,10 +449,23 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>           * will always be to establish mappings and process all the BARs.
>           */
>          ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
> -        return apply_map(pdev->domain, pdev, mem, cmd);
> +        return apply_map(pdev->domain, pdev, cmd);
>      }
>  
> -    defer_map(dev->domain, dev, mem, cmd, rom_only);
> +    /* Find out how many memory ranges has left after MSI and overlaps. */
                                          ^ are (I think).
> +    map_pending = false;
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +        if ( !rangeset_is_empty(header->bars[i].mem) )
> +        {
> +            map_pending = true;
> +            break;
> +        }
> +
> +    /* If there's no mapping work write the command register now. */
> +    if ( !map_pending )
> +        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> +    else
> +        defer_map(dev->domain, dev, cmd, rom_only);

This is kind of not strictly required, and different from the current
approach where defer_map() gets called regardless of whether the
rangeset is all empty.

Could be moved to a separate commit.

>  
>      return 0;
>  }
> @@ -574,6 +656,19 @@ static void cf_check rom_write(
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  }
>  
> +static int bar_add_rangeset(struct pci_dev *pdev, struct vpci_bar *bar, int i)

pci_dev should be const, and i unsigned.

> +{
> +    char str[32];
> +
> +    snprintf(str, sizeof(str), "%pp:BAR%d", &pdev->sbdf, i);
> +
> +    bar->mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
> +    if ( !bar->mem )
> +        return -ENOMEM;
> +
> +    return 0;
> +}
> +
>  static int cf_check init_bars(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
> @@ -657,6 +752,13 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          else
>              bars[i].type = VPCI_BAR_MEM32;
>  
> +        rc = bar_add_rangeset(pdev, &bars[i], i);
> +        if ( rc )
> +        {
> +            bars[i].type = VPCI_BAR_EMPTY;
> +            return rc;
> +        }
> +
>          rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
>                                (i == num_bars - 1) ? PCI_BAR_LAST : 0);
>          if ( rc < 0 )
> @@ -707,6 +809,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
>                                     rom_reg, 4, rom);
>              if ( rc )
>                  rom->type = VPCI_BAR_EMPTY;
> +            else
> +            {
> +                rc = bar_add_rangeset(pdev, rom, i);
> +                if ( rc )
> +                {
> +                    rom->type = VPCI_BAR_EMPTY;
> +                    return rc;
> +                }

For both of the above: I don't think you need to set the BAR to EMPTY
if you are already returning an error, as the whole vCPI handling will
fail initialization.  Setting to empty only makes sense if we can try
to continue with normal operations.

> +            }
>          }
>      }
>      else
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index a97710a806..ca3505ecb7 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -38,6 +38,8 @@ extern vpci_register_init_t *const __end_vpci_array[];
>  
>  void vpci_remove_device(struct pci_dev *pdev)
>  {
> +    unsigned int i;
> +
>      ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>  
>      if ( !has_vpci(pdev->domain) || !pdev->vpci )
> @@ -63,6 +65,10 @@ void vpci_remove_device(struct pci_dev *pdev)
>              if ( pdev->vpci->msix->table[i] )
>                  iounmap(pdev->vpci->msix->table[i]);
>      }
> +
> +    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
> +        rangeset_destroy(pdev->vpci->header.bars[i].mem);
> +
>      xfree(pdev->vpci->msix);
>      xfree(pdev->vpci->msi);
>      xfree(pdev->vpci);
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 486a655e8d..b78dd6512b 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -72,6 +72,7 @@ struct vpci {
>              /* Guest view of the BAR: address and lower bits. */
>              uint64_t guest_reg;
>              uint64_t size;
> +            struct rangeset *mem;
>              enum {
>                  VPCI_BAR_EMPTY,
>                  VPCI_BAR_IO,
> @@ -156,9 +157,9 @@ struct vpci {
>  
>  struct vpci_vcpu {
>      /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
> -    struct rangeset *mem;
>      struct pci_dev *pdev;
>      uint16_t cmd;
> +    bool map_pending : 1;

I do wonder whether we really need the map_pending boolean field,
couldn't pdev != NULL be used as a way to signal a pending mapping
operation?

Thanks, Roger.

