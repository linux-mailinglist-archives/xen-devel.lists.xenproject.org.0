Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412AB6B9A0D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 16:43:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509721.786041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc6nS-0005zn-GW; Tue, 14 Mar 2023 15:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509721.786041; Tue, 14 Mar 2023 15:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc6nS-0005ww-Cn; Tue, 14 Mar 2023 15:42:42 +0000
Received: by outflank-mailman (input) for mailman id 509721;
 Tue, 14 Mar 2023 15:42:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dXSW=7G=citrix.com=prvs=430734c92=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pc6nR-0005wq-F7
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 15:42:41 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7ba62b5-c27e-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 16:42:38 +0100 (CET)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Mar 2023 11:42:34 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA2PR03MB5819.namprd03.prod.outlook.com (2603:10b6:806:113::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 15:42:32 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Tue, 14 Mar 2023
 15:42:32 +0000
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
X-Inumbo-ID: d7ba62b5-c27e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678808558;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tA8/TSn2UZHIUaKPx81BJl9qEPx0MNNqHM3Cds0C/fY=;
  b=RaLgWXxEKhPyWpD8wh7caf7o5QNAzO9I980vb65QHDevmKP2t4CjTMDZ
   nOpliVpqE8yBFAtkE0A4UzS2LSRfzDpoEc1XtPho+yh6GsnSMp9ySAKyU
   LwSj1wilpiuz9BfrbXJIGdJr4uL4LvNp63bTAh6w0MGOBLiXoWaBp+oTN
   g=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 100712812
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VBlx/6IvzFSsixvrFE+RH5QlxSXFcZb7ZxGr2PjKsXjdYENShDVSn
 DAeCzvSO/2JNjGmKYx/aYrn90wEvZ/Qz9FiHVBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QViPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5PIHpM8
 vAAFAwqawKCuuPt67mhYO9F05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLkGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03rCWx3OiAur+EpWmr9tWgnCQwlcSJ0QPaWa/hdK4sWqhDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8U49QWMx6z88wufQG8eQVZpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhq16bO8vT60fy8PIgcqdSICCAcI/dTniIUylQ7UCMZuFravid/4Ei22x
 CqFxBXSnJ0WhM8Pkq+9olbOhmv0ooCTF1ZpoALKQmii8wV1Ipa/YJCl4kTa6vAGK5uFSl6Gv
 z4PnM32AP0yMKxhXRelGI0ldIxFLd7cWNEAqTaDx6Ucygk=
IronPort-HdrOrdr: A9a23:nMkue6hyy7u9LgXr9+912ykRRnBQXiwji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPk3I/OrrBEDuexzhHPJOj7X5eI3SPjUO21HYS72Kj7GSoAEIcheWnoJgPO
 VbAs1D4bXLZmSS5vyKhDVQfexA/DGGmprY+ts3zR1WPH9Xg3cL1XYJNu6ZeHcGNDWvHfACZe
 OhDlIsnUvcRZwQBP7LfkUtbqz4iPDgsonpWhICDw5P0njzsdv5gISKaCRxx30lIkly/Ys=
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="100712812"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+W3kUaIJRJ6B9hbcNmAC7zFdnDsRuSL/8q0vOH74TUeWF9KDLzwtMv9dgUjcgLyPDOCD6M6lfOnX0GfdMH4li5bWSMOQRpGJ20abHUaePuVDyjuTiP8MXIfE+s2HpBECVGWJHowuzhZeFHx6fhNcSgPLYkPIR9Q3gA7b1hUYvxeVTuk/MmJLoKMHEcilol9MwUTNjOZv9goWzvfdd7MjnXdDfyukVVGqDmIEYOfV5RMeixoIpawBUZoZkapNf/InrqtEBk+PXDV261PIsmpHg3I3uGfuEzq8IuiJQxG3nfQ2EEi0mJeCaeuOQGf1gujzGzobgtqvksnby2kmGpEIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZ2pS40nOI6xw9QUw+KjuzX2QMDoxv1m7kj2GobSkbo=;
 b=D9H43711nWZPTk/ifplzKu0Mi5XH2yOnvyqgTfJzaQ/5kj47W0qGUKWREEU4AMKWX4/y6ytxwRgcPVKK7EDC6/TZvSow2sSqT7AElcfcGdMBfcIEOStBHG3skC99nbDTH3x36D4B6vmzS7MU0N0unpAtZQITXDsnsmCoBJMcGnonBJhEmitp43tLpwU+lb8Takys84chRutByb2UFQni7PxeUc33hfoNBmbuyF8rcKDP9dcek3wU0u9HOlzSVrpTWd67urb67SCZwbzpn/u6AYJEsiMK9oHlqxAo6dXAbFxZcfr93KVHXTAn/jaXz7M8MJIetQGbvtdyGK91wL+Gng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZ2pS40nOI6xw9QUw+KjuzX2QMDoxv1m7kj2GobSkbo=;
 b=HlA8HPlwqfIV/tKqfzBL7Y9HiZPUopPLrmU9bMw+Vc7WHGe4+40K5b88sFTI5uy/b6ZsimELd8MbsUpbfus0Kvhus7gqr8GWjWDQe0LkJMuJcHqublc0PBlQu3JqG42Xn3Y/m+sv+DMCIWUQWXB0TGBzoyqNh8X2M7Ha4aKrujc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 14 Mar 2023 16:42:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/grants: repurpose command line max options
Message-ID: <ZBCV4Y6Cz91eypUN@Air-de-Roger>
References: <20230314144553.8248-1-roger.pau@citrix.com>
 <7db90f7f-3344-75bf-120e-2113908adfb4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7db90f7f-3344-75bf-120e-2113908adfb4@suse.com>
X-ClientProxiedBy: LO4P265CA0158.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA2PR03MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 962e94a1-1fda-451b-4127-08db24a2b972
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x7wjNcG39sfG1yU118+TTM35XyHEwJAlx/CohD6mDgUwy+IhN+X4xAO4mewRS9igLThfqih7zdcUT4JBRdAv3yS/ZDWoIr/+3lJ/JKR+jKQU+wzwOAUt5stjmZLcSVza5PV9YDTcUjr631rbrFH64jFQmtwAnzISsKh24OI1Hr8rAEPmCC2yAS6oUisKB3idGkA20snQ0Q8z2/VG/7MC/BlZuPRwLYy9ytswGrPheuvfIxC+6JCLT37erY2uhy36+Nj1pfXPjwqkFaPzcdtlA3neQSmX4xIyVW+N8CAJ5uJABpktR/EnU3tB+xaCj1PzNoru/AMByZluR43PB1EPS2rn7Qb1Mqznoco/bTENSiTNJPItC7l3H/EZmi0v7LjYWRxNLTREmfYD7eQvAmhwu8/bfRPdj7butQXRK+HaV5mWa8tbRHbWTDWP8kvlP7SuvoO1KeQZLyNZVwu4tp5n883y/a/JHm4bBBRx3cK5gs5xEvpok6YUIEcDOLCPVIV2vLdSp2p8K6k3wBkfesF6E0AeJZ/W6NOqWS0r3Hxub/zo5FK5KT+T+3yVkR4vea3vNL7WIN3QmM3NqnGW9KOL1sZFDA8UpG+2ozDqUaiXjavQmfwpbrQIZwF93v48aLpFFFFexQs4gQrvxwZ0OFMmuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199018)(86362001)(478600001)(5660300002)(8676002)(9686003)(6666004)(6486002)(85182001)(2906002)(53546011)(26005)(186003)(6512007)(6506007)(41300700001)(82960400001)(4326008)(6916009)(66946007)(66556008)(38100700002)(33716001)(66476007)(83380400001)(8936002)(54906003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGtSQk9lNnJrU0Z6ODlJVUlZRVRJSzlQd2JTeklZa2V1UGRJY1JBR1ZYT1li?=
 =?utf-8?B?MGRlSDYzeldYU2tCdngwMDJwcENJU0psb0laM0FobVlUeDdrZ2pacXk5eUR5?=
 =?utf-8?B?S3ZHZHQ5ck1DT0lMREthdUlxbVBuZmxVWTl3NTU4TGVUcUJ2QjF4ZFFoV1Jw?=
 =?utf-8?B?d0prbDFqclpYbEVlOTRkdVpzK1dZWVpwMTBaRk55a3BYY1BXWnBWTUlNbjNH?=
 =?utf-8?B?TVhEMk9HTUd4ZllHUm52L1F1OEVoU1pNSlNIZFBpSW1pNXk3NUYxa1ZmckxJ?=
 =?utf-8?B?RTIxVHppWDg5UWY5eVZFV0EwMDJSYVVUN1ZOYmZFaXVHb1o2OUpmVHY4NVRI?=
 =?utf-8?B?UG41aFJ2TGNBR2dvRUdsQ1RoRzM4THExcFVTYVEvcE5yRk1RM3ZGWDRlSWp1?=
 =?utf-8?B?RzZQQ0hDOVNjQXFoRDdRbzRMU1N4Yi9rSEpTc1h5UVRuM1RJQkNXUE1qblpo?=
 =?utf-8?B?Si9hamxuQm1VSlF5MThQR1Roc2psOXFmL1hPeHhRRzlkVmJBb2QxcWhFU2py?=
 =?utf-8?B?K2lGOVNSeTZ0ZGVQNlRTSTF0cGo4aHRuZjI3M2dJMVdQQXAvemJIN0ZDY2VO?=
 =?utf-8?B?Vm9YUitTaWZsSVZhZGt6enkzUWc5ZDNYMjRyYXdoQ011Q2hFSWpLejVwbnNG?=
 =?utf-8?B?cDdNRENTS0tLMjQ4MW5UbHJmSXRhZnowTUxYWkJxeDhabGV2ZXlTWHRkc2RW?=
 =?utf-8?B?VVByNFpGRG1FRFZzTzdNM0FuT1ZtOHVaVlAvbDhGelpDNFpyeHZrUDlvVWlG?=
 =?utf-8?B?dHV0cmhkNk82SkpmZlhkSHEzY21aZTNDL2ZTdXNlcGovN2g3eFptYW83TVN1?=
 =?utf-8?B?dm1DQXNzSHdHL04yclpoWEhJMHYwWUt1cWk3bHZSRHhiTjhVcEhvNGNVdHhn?=
 =?utf-8?B?bk9lQnJYSXU0d0tKUlY5RS9hb2RTL3VCaWxUNkN0eWZ6Wkg1U0J4MDFtOUJC?=
 =?utf-8?B?d1I4NG50MTJNZHMwNXdTNmNINm9RTmNEb1RkU1p6aGxnOVdMQ2pBWU92K2RP?=
 =?utf-8?B?a3RINmNDM3VNVEZYQ2UwSXhGdnhiS0piMzd2YmVjVFNXUGd2SWtIUDNSOVNS?=
 =?utf-8?B?a1owQSszUG1EYXlKc0VmUHpIVnlucC9TNnBLNmlacnF0V3dhYXA1cTRaYmpu?=
 =?utf-8?B?TDlzU1dDb2U1SjhCSzF6YS8yR1FyR1ZKbTZ5YnhIUkYyYWxYYmgyRFFaTXJZ?=
 =?utf-8?B?dTF4THc3NmI5elJnRmhvb2JMNFRlbnRYYnFLcnYyZDkydDVleFE0Y3h4OVky?=
 =?utf-8?B?ZDFvaktwUDBQdEF6T2dEaUtLc1NLSTlWMjVYekZhZUhIUmFGb1lPMC92U1cr?=
 =?utf-8?B?Z1o2NWpkbDFZOHhMTTQvY01HNlVBTnlrYkJyejVNUWk3bmdJMEZlVURFNGRD?=
 =?utf-8?B?ZDdlSG9oQ2tpK1FvNlU2ZnlxTXBGeVVzTU9Td2FwWm5kdXJEdWpCQy9acXNG?=
 =?utf-8?B?U1lJWkEwckUxazQ3eXN0ZTFlUFN4ZHlyVnpyRTZMOVZkZVE0bmg4eDZVanhZ?=
 =?utf-8?B?RThxak13amZIL0huTnYwekdVSWt1SmFjRUxrVEQ5d2tvbHRmYllKYXl4UEhR?=
 =?utf-8?B?WXlBVGtsUTA5bzBFVjJKQ1NvTnlqVnY5Nm0wa0dFV3Ixc1BmZll3bVA4ZG9V?=
 =?utf-8?B?NnZwTnN0dGdQUmQvd3N2MzFNVkNKaUdTMXpXaFFFNU5UL1pQZHQ3TmpGcmF6?=
 =?utf-8?B?Qm5SRFJKWWZVMnRlL3VIOGV6bm51ZHVKd0VFR2s0ZXBTNytLUzVGNUM1RUcr?=
 =?utf-8?B?dVgwV1d3Z3RkbzZnV0d6L3EyTEs1OWRWVTZidFlZNjFFQU13U1AvdS9YaWty?=
 =?utf-8?B?bk5pTHREMURoUFR1bE9FSjhTUnhLQWJNekw1T2hhREFMOFRUcmtLSExJQ09p?=
 =?utf-8?B?bkNvWWV0V2R6VEF3c09pMnFHM2xVMWhRcWR3dHlEN3lTUnB6VzArb2xrZS90?=
 =?utf-8?B?RkpHL1hvZitacVVvSzJQL0RXSkJrYUluZENuYXZPckRtQzNURW5WWjNvQ2tQ?=
 =?utf-8?B?dkNDT0VKa0JLbHJCRFVvNmRuWEJPbXBNWTNnMjBNNmg4dnVVQVlMTXBDVlZP?=
 =?utf-8?B?MUNRWlNIZEd4WnFLRzBuaWhISTRtYVB0QlZWSGVPcUdzdlVwTUlqWW1YNlBm?=
 =?utf-8?B?QWlzRnh1Vjh0bUJxTjNYTHZkQ25FZTM1Tlpwb2NJcjZYSWs4MG5Yc3p0KzhE?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l/fk+49uMEukFlDehPSXSu5M611PY9dnQ89dcjE6ElZ6LQxdnIU5eqHjNnUndw0kaVG32bX6f/l74SY6hojDAUu0614fDY/uISPWK6EJiDURQeGnK3GQf5DctNGwBq6DfTVEHlmfo4Vl/8++SThqWVqE183Jo+VOwof3i6xKBy09aMmSxj/6y7eC4xdzNODU175h6cMjU1cV+p9ckFYQNMBGyJ3lCgVcoCXclbJ6MpPVREGf2ZYabFMBU0mdLREUvdfbC6UrkRKDyBC46vmqY4j0sH07n2qGXORVyz7WQy9A5MpuueCrPltvjhsefS2RWma1J4IIV9IgUoNtzmNQJVrY3Dybxvwhl7NM1lCaMzvlI3MUYUWN256CND+0TU5j2asHryqmQOTLbItJ7t93xLw52S6d5vLQBQg5If5kox6xkTpzX97E2+NjFa69X3jf3e1/NknDyAHjlTAFaiwjM1FxITLJP37p6hmhWXVC73xvnV2XoGsITXad0oQ3NAbvyuiQ3CqJdDDO1cDCuaDMaYaWKNWTXYmJUrhoD5t6C16ooeVG1+tPBgmv+/Iwpv/ymsWoTjqqlEWYSAp+rQzJneKGfk3ndJhWAZqVUTe3xIMg/FXhdqdge2TqUUq2RfUDnKT5DPu8bUvZNkCevo5iCY6rphgSNMmG62WCBlpqzxcEqSkwKMkxoMiSD3J5WQKNakWF3nfaqmdpCSAu1kzMMwsV5pNBmJHr8iTbPKHVFTPHstmrMwPSneeGfDBZyrY1NYPmXpi6oFHCcOAef/AQiBLAE7G/qW+NmTEAYujbHw1B4nHqqGoIoo7bEC0prlwgtcMTSKOmD4KLLGq8qBRtOnB1pnnRSJg+pdOrLDp5p/g=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962e94a1-1fda-451b-4127-08db24a2b972
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 15:42:32.0602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CT8P3tjvNYoNRMT1dZT79sQYVhFJg2rXC3iuny+t53K8VPxmmPWrCistHVfvQo1c5JDE6aqcSEZY1fmNRjixg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5819

On Tue, Mar 14, 2023 at 03:59:22PM +0100, Jan Beulich wrote:
> On 14.03.2023 15:45, Roger Pau Monne wrote:
> > Slightly change the meaning of the command line
> > gnttab_max_{maptrack_,}frames: do not use them as upper bounds for the
> > passed values at domain creation, instead just use them as defaults
> > in the absence of any provided value.
> > 
> > It's not very useful for the options to be used both as defaults and
> > as capping values for domain creation inputs.  The defaults passed on
> > the command line are used by dom0 which has a very different grant
> > requirements than a regular domU.  dom0 usually needs a bigger
> > maptrack array, while domU usually require a bigger number of grant
> > frames.
> > 
> > The relaxation in the logic for the maximum size of the grant and
> > maptrack table sizes doesn't change the fact that domain creation
> > hypercall can cause resource exhausting, so disaggregated setups
> > should take it into account.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit perhaps with yet one more wording change (which I'd be happy to
> make while committing, provided you agree):
> 
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -1232,11 +1232,11 @@ The usage of gnttab v2 is not security supported on ARM platforms.
> >  
> >  > Can be modified at runtime
> >  
> > -Specify the maximum number of frames which any domain may use as part
> > -of its grant table. This value is an upper boundary of the per-domain
> > -value settable via Xen tools.
> > +Specify the default upper bound on the number of frames which any domain may
> > +use as part of its grant table unless a different value is specified at domain
> > +creation.
> >  
> > -Dom0 is using this value for sizing its grant table.
> > +Note this value is the effective upper bound for dom0.
> 
> DomU-s created during Xen boot are equally taking this as their effective
> value, aiui. So I'd be inclined to amend this: "... for dom0, and for
> any domU created in the course of Xen booting".

Not really for domUs, as there's a way to pass a different value for
both options in the dt, see create_domUs().

Thanks, Roger.

