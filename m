Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F651430D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 09:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316978.536100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkKnm-0003C0-16; Fri, 29 Apr 2022 07:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316978.536100; Fri, 29 Apr 2022 07:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkKnl-0003A8-UN; Fri, 29 Apr 2022 07:12:29 +0000
Received: by outflank-mailman (input) for mailman id 316978;
 Fri, 29 Apr 2022 07:12:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHQo=VH=citrix.com=prvs=11116ec15=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nkKnk-0003A2-Fq
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 07:12:28 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4fcd26d-c78b-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 09:12:21 +0200 (CEST)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 03:12:22 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CH2PR03MB5365.namprd03.prod.outlook.com (2603:10b6:610:a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Fri, 29 Apr
 2022 07:12:21 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 07:12:21 +0000
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
X-Inumbo-ID: b4fcd26d-c78b-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651216346;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WnpnSBuc1gVvz86m0gEDq9P6arpJ6v8lOmnnFgInYfg=;
  b=NrnLwO1dNMnF5cm/Aao+ZbnyH4vVB27M6UdSYaWEFO7PzRkcQseTmj7Q
   ltoF43iCZNEtXJJ9zVQlataNz3KQKrafANvkFz3ZfggABVOFDXMfBx+Zs
   vDSOKsgfYmf86L0WBJ+0i2x+bTkwzMoUvaS9WHz3yhzdJ7DIsjgZJliBw
   U=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 70614046
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xXmRjKLHXq/I/Gq8FE+Rl5UlxSXFcZb7ZxGr2PjKsXjdYENShWdWz
 zMXWD2HPvjcambwLdoia9mwpBgA75HQn4JmGQZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh3tQ52YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MxM6oy6ETwDBaTzws1NSjMCCQxCGLITrdcrIVDn2SCS52vvViK2htBRVgQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgH86FH/uiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33iemL2UE9jp5o4Ir2Xf3zChowYSuH9nHJ5+oGOFVjG2H8
 zeuE2PRR0ty2Mak4Tad6Xetmu/nlDv2Qp4PD6a/8uN2gVqV3SoYDxh+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasgBkYXNZBFvwg3yuEwKHU/gWxC3ANS3hKb9lOnNAybSwn0
 BmOhdyBLSdkt6GJD36U6LaPhSiuMDIRJGVEZChsZQkM5dX5sZwwph3KR9dnVqWyi7XdAirsy
 jqHqCw/gbQ7jsMR0ai/u1fdjFqEpIXNTwMzzhXaWCSi9AwRTISofZCy4F7Xq/NJNp+ET0Kpt
 WIB3cOZ6YgmD5uAiSiMS+UlB6yy6rCONzi0qVJhFpYu9jOp+la4YJtdpjp5IS9BPskIdDDza
 WfPqAhR49lVJ3LsYqhpC79dEOwvxKnkUNH6DPbda4MUZoArLFPZuiZzeUSXwmbh1lA2lr0yM
 ouadsDqCmsGDaNgz3y9QOJ1PaIX+x3SDFj7HfjTpylLG5LEDJJJYd/p6GezU90=
IronPort-HdrOrdr: A9a23:MwEuFKHslMDvjic2pLqFYZHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsOmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZVbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczIgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenEMLZTej8AjeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wgK7VBaM0o9
 gsCZ4Y5Y2mfvVmE56VO91xMfdfKla9Ny4kY1jiaGgOKsk8SgDwgq+yxokJz8eXX7FN5KcOuf
 36ISZlXCgJCg/TNfE=
X-IronPort-AV: E=Sophos;i="5.91,297,1647316800"; 
   d="scan'208";a="70614046"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPWu9VjjGhQwnEHUekevohaLkIGWxX8ZC9jJ3de+cpEzbdqYY5Pev1pcjn2qGz3ZRjffJVkJFiugRSSNcc7Vuqd9753gjc8LRR/J57xInsEglzeOs/AZAfiWLjtC5bPv7VRbIu84GpazdM6AjwPHsUgCvEis+tbdX+orJXf+1eYP17PhTlbgBTSxITkmIDdPf5w2QP8kPyUMBa8KgKRP9uH3qmz/AAyMNvSiFOEBHaZcwwN5s/QkG3nJLjJ9mX+1UPUtaR9RrVa9NGpdNxkCs3XdCOpoqUizyraulHGVYj1f2V2zltrCztdRtwb5Yru1jr12kDozChgd/bTzKOZVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6AzNnw/PMQ8kbmS8HmtG0ziHAI8nDGsmIYY/bdJPAk=;
 b=XkLYo4y5thOd86KjuwhXlfMk83zG2V+RDWDSHh7xdYRYXYl+f4t/ZjuzPU2XAzukBmRjAzu2gKzQFzzmU26xXpVrOORKi0s+sKbMiCH31KeIDigsDeHOb+7iE3Cser/305CfjpRApTn2m9jz05Wl19Apl8Ip7ldxz01hJK5SAv0z17wizDhQ3aei8X+OOP07lb/U1G4mgZymtLkHDHUVEzBfaG3GAZlKRDND91Rgct50LvfEs7t0+pGr3B874hWKe3wfRVjiCvWoM0oYo35PTsaXO9snRzLfpjDUch6OizrMowYSu8Jlz2V5odrj4SvPJJOEeoft04uH81Qzy/kQNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6AzNnw/PMQ8kbmS8HmtG0ziHAI8nDGsmIYY/bdJPAk=;
 b=a1jnYFdsVfb2n3IeTHM+NHezFh4Uvc2PjaX2YNPBTUzR2U29z9UjR0DaFGpGH/ydt2B+4HC0o8Mka3oaYUaG2TNVjPqli4nrrGNw7CFkR2M1awZtGPvLSYQxmhX9sfbIuDF781O4EH4AHq6QfvVm9/gZ2Dg4nXBTxxONZJpbYBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 29 Apr 2022 09:12:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>, scott.davis@starlab.io, jandryuk@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v3 1/2] xsm: create idle domain privileged and demote
 after setup
Message-ID: <YmuPz1Oe1ranStXe@Air-de-Roger>
References: <20220422163458.30170-1-dpsmith@apertussolutions.com>
 <20220422163458.30170-2-dpsmith@apertussolutions.com>
 <YmZtiJ5Jf1CNOpeZ@Air-de-Roger>
 <25e701d4-62ae-278d-b165-2201459c7cee@apertussolutions.com>
 <YmebdccTfa7wKc9U@Air-de-Roger>
 <c872d5c4-9a6b-b955-556c-7974382fc4c4@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c872d5c4-9a6b-b955-556c-7974382fc4c4@apertussolutions.com>
X-ClientProxiedBy: MR1P264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 163cf798-9af8-4bb8-b0c5-08da29af9a3e
X-MS-TrafficTypeDiagnostic: CH2PR03MB5365:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<CH2PR03MB5365F433F9D20AE3B406E90B8FFC9@CH2PR03MB5365.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o0WcZ9saLL0OtzyTTBMSgT9qOHYm4zO/KcFP5VIA6tO/F0C64mjIXNRS6goRybZU+7paJB+egNa7cdTPSYUBazS4xhJqrRmNoiRdxIuXpI1S5i7r+UthAmJMCU668DJU+KlWgxhCv0vs8wLJPcR7jNmCiwZ1nJmUJfgvHuEo79xfKQEV+vcjB9+IsKLN8N1RUluLQ/mwwwLAQOxiWtF6r/bULKCua/YjsbxbuRIj93xYicD4wW9ZjFleBCost/y9kIQ/uVDWWZwExOW3AFZhSGK9uWDp5MGIFnZcKOMuYKGFtLoxcHTouTxpTMZTBqhSvOWAItaIh6pMFCmSIxt+wED0W8zYcavUDsdWQ0imLhp4JdPIzVYippTmHyVCtiosD/CSvkikVu6q1/Jd8J1LyiXzXivCisQ0SoJag6EP4Rvqr5KKR2p1AXP7/q0g7LKXXT4vzRjR8YvzN0I98hTG2KNrerjMwsr03T4INFgaAohcxvKNN5M4LlAaWqtnFpCOm+vpGJV1e955J6cL0Dg7Yywh9doomzIrEjBN4HxRcYjM0Jyte3ldAT6xireKdNWSHrHMV2EeWENO8GmjrkSkgdloplChBZt6XOlwwtqkDnNnuRctcKctUVgtNrgy6q8OGQt1CTZNY/NpNwk9Q5p6YQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(54906003)(53546011)(26005)(66556008)(66946007)(6486002)(6506007)(33716001)(6512007)(6666004)(66476007)(9686003)(316002)(6916009)(86362001)(508600001)(82960400001)(38100700002)(83380400001)(186003)(2906002)(7416002)(8936002)(5660300002)(85182001)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0ZVL0NFbG1yZTdFQkordWxLR1hZdmhZQ1J5MGJiNHVmWnVIKzNCeDFpYlhy?=
 =?utf-8?B?ZG8rdEpZQ3NOVXRBK3NoSE9ZelZHV2JIQ0lUTmNSUG13dWsrZmxYT0prRXdE?=
 =?utf-8?B?V2g3N2xDWWZjYkZQUDdjcnhFUTRwZU1pYk5jQkdpTnM0aHdvZFUvamR0ckV4?=
 =?utf-8?B?bDFWWGxIcFRyb1JiU05Vb1lHc2I0UkpRRXpBZE5Ta1d2M0dCdjV1RERpUHJl?=
 =?utf-8?B?Vld6ck12d1hUcUdGcU1EMzBGV2VKdEhjYkdqbTRSaWZzZm9hK2hPZUx2N1I2?=
 =?utf-8?B?SS9WamdCNlNUT0FZcVhNNnJRSTFIUmNzOXB3OTl1d2RtSUwrVE01NEs5NzNL?=
 =?utf-8?B?QUhEcExXdmhyVWhKWnNmazlJY3BTd2xmNmFnTUpNS1MrN0hsQVg2L2V3RGNz?=
 =?utf-8?B?cW1YYjFFSzBLcmJrQXF6VGU5aUdVSnAveklRRTc4RXpGeVBZUUpDbDBOYUFU?=
 =?utf-8?B?dEd6czRsOWpuTEJLREt3RzIzQWFOZ1ZUK2cwV05SU1JaNEoxSERlb2dwZksx?=
 =?utf-8?B?bC9hSTRGeEVETzIvTmlYUmFaQlByWlRqMyt6cTltSEdLRDBpMW5jMC9sMDI4?=
 =?utf-8?B?VHJuK0VkMzcwczYyWmVmc0RXYW9xWHZFbGNhU3llMmFUdGtoaHJnNVpNTnh6?=
 =?utf-8?B?RTFObkdacE5WY1U2bWFsZGJmRFhRMGhrT05pVWhPV1poaUJNTnpjYVlvOVg5?=
 =?utf-8?B?cWN2WTNoWklFd3N6TDBzdHBGU0tRRlBhT1hBRXBFQW1Fc0RONzZsZ1d3ZVFQ?=
 =?utf-8?B?Q2pkeXFnUFhzV01lcjhVS09MYmsvUmlOSUZHUVR1R3k3NHc0a0xZZjdXU2hq?=
 =?utf-8?B?djY3NFVMcGhmSzBGem8zUWFiQk5ZSlhzR2srcFpRSWE1ZnNTOWI5TDNnYm8y?=
 =?utf-8?B?WEF0QithQ1M2WHhlSVBGNzdPRGkra3hTSmNoQUgwNXowZUNaQ3JhQ2hYMGUv?=
 =?utf-8?B?RVFoWDhjbnNCVWs3L1Z3eCtTY1NkMy8wbE1ZUGhhL1VrL20xc3VrQnByRnpv?=
 =?utf-8?B?MjVza3JrTEtwaFJjY0pqWitYeFZ4Wi9vanh0MkxiblJTYjJjZEtBZENURWtD?=
 =?utf-8?B?RlR3eW5IRzE2dmx1QVlmWUlTbFV1UVlrTTVIRDRIZHhQODZZbzA1U0MyRndl?=
 =?utf-8?B?bGhZcDNhRXIrWFN6R2NGck12VTcwdTJ0dWo3d1g3Wk9SNEtmTVlHR2EyQlBW?=
 =?utf-8?B?ZHJTUEJLQ0FURVBhM1B6UkhzY2hIdjJJV1ZTRkI5cHpabWRHRElsS00waW4w?=
 =?utf-8?B?bk9QcUtDaUY4eGRaZTE1TkNRcXdkdjRhdmtrOTBNNExzMjZ0VUZ6N3RpWFdk?=
 =?utf-8?B?K1ZMVjJWbVZqZ0dnUW1PaXI1N1JWd3lJcGR2c0QrMTdQVGR3WFdYY3VUWHRS?=
 =?utf-8?B?R0JBZHp3VnZwR0ZJSUFSSURrS0tXRitkQWhxa3RLOE9ud2Rwek5wUkx0aklJ?=
 =?utf-8?B?a3VXeEV4RTljckY5UzhndWg0dDA5N2tqM045aFRCNmFnTTVlQzkrcnR0RXl2?=
 =?utf-8?B?VmdvNmxvYlRVSSs0ZkF0UU8zU1pvQTVLMkordkNpWDU1anArREhTWElyZDJh?=
 =?utf-8?B?Ri9sWFJPR2o5dlFxRHZwVTdsd2ZhNVd6VzhXazZUTUlTOTlGTlp0QlVEVDZO?=
 =?utf-8?B?U1JXbGZrWTZTWGc2V0RyRkJBdEFWTzRVemRudkhxcVlPNisxUlNIaTNmODRQ?=
 =?utf-8?B?TFlKNDQ0cmMvQk5rRW93SEhMUDJCNDE4MGFxa0t2MU1xRWNKVGk4akp3V1U1?=
 =?utf-8?B?dmFwTkJVUXRXYmdFb1dITFNSV1UvZ3M2ak83S3lIV0NqbVFuZWtpeVd5VUM4?=
 =?utf-8?B?Zy93eFpBZmNleVFEOGY2UXhlTmllK0ppdU5LbFphZUtnUzJPNFV4MVNock5a?=
 =?utf-8?B?bnlUOVdMYnhSVmYyalFYS294bVpJNTIwTWJwajJodU13ZHdvSHlvNW5CT1Rx?=
 =?utf-8?B?U25pcWpSd2krMmFEL095VGZya3RzMExDb3dzREIwUEdGdFliK0QwMXZ2aXNz?=
 =?utf-8?B?WklFUDFyM3ZhdXloaEdPWmV0SytMWG9SckdPVDZoR25XcW5LRmhrZXdxZG0r?=
 =?utf-8?B?NFlqd0h3T3E5MjVJMEdTNE4raHpFSXVZUW14TlI1MUdOK2NQblZRN1VGQ0hn?=
 =?utf-8?B?azhPRnVVRGxHQUUxTGR4dXU3VGZGU1lwaHREaU8zYnNyaVZUUlhJa2NrOHVX?=
 =?utf-8?B?ZUo4eEhhTFYzOFFGczlQWlc4ZFVRbDcrbTZDMUpBaGRqOTEvak5CckdRQ1Bl?=
 =?utf-8?B?ZS8zbFhLWnJNNk9WZENXODdpT2l4YzYwMUZkbGUrSEt4MVh5UFV2OE1zSGV0?=
 =?utf-8?B?Nk5Ld2hrNEtmbytHdW5tMWxNejRKWHpuVmRXMnlZZ0JkZGVsZXJoNEk5ZDBO?=
 =?utf-8?Q?WiDS9PgoN21Izsb4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163cf798-9af8-4bb8-b0c5-08da29af9a3e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 07:12:21.2192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTvzmpkfTfMihzusuYQsfg6zMNBavXMKEjoxu9IBJa7u2JSrFb0rPHsPBuYC0sUPPIG0CA+MJn7UXiHLmPZ1vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5365

On Thu, Apr 28, 2022 at 10:57:42AM -0400, Daniel P. Smith wrote:
> On 4/26/22 03:12, Roger Pau Monné wrote:
> > On Mon, Apr 25, 2022 at 12:39:17PM -0400, Daniel P. Smith wrote:
> >> On 4/25/22 05:44, Roger Pau Monné wrote:
> >>> On Fri, Apr 22, 2022 at 12:34:57PM -0400, Daniel P. Smith wrote:
> >>>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> >>>> index 0bf63ffa84..8a62de2fd6 100644
> >>>> --- a/xen/xsm/flask/hooks.c
> >>>> +++ b/xen/xsm/flask/hooks.c
> >>>> @@ -186,6 +186,26 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
> >>>>      return 0;
> >>>>  }
> >>>>  
> >>>> +static int cf_check flask_set_system_active(void)
> >>>> +{
> >>>> +    struct domain *d = current->domain;
> >>>
> >>> Nit: you should also add the assert for d->is_privileged, I don't see
> >>> a reason for the xsm and flask functions to differ in that regard.
> >>
> >> This goes back to an issued I have raised before, is_privileged really
> >> encompasses two properties of a domain. Whether the domain is filling
> >> the special control domain role versus what accesses the domain has
> >> based on the context under which is_control_domain() is called. For
> >> instance the function init_domain_msr_policy() uses is_control_domain()
> >> not to make an access control decision but configure behavior. Under
> >> flask is_privileged no longer reflects the accesses a domain with it set
> >> will have, thus whether it is cleared when flask is enabled is
> >> irrelevant as far as flask is concerned. For the ASSERT, what matters is
> >> that the label was set to xenboot_t on construction and that it was not
> >> changed before reaching this point. Or in a short form, when under the
> >> default policy the expected state is concerned with is_privilege while
> >> for flask it is only the SID.
> > 
> > I certainly don't care that much, but you do set d->is_privileged =
> > false in flask_set_system_active, hence it would seem logic to expect
> > d->is_privileged == true also?
> 
> Yes, I did this just for consistency not because there is any
> significance of is_privilege on the idle domain, in both contexts for
> which is_privileged is used, when flask is the enforcing policy.
> 
> > If not for anything else, just to assert that the function is not
> > called twice.
> 
> Under this patch flask_set_system_active() is effectively a no-op, so
> calling it twice has no effect. In the next patch flask_set_system()
> becomes a real check and there is an ASSERT on the SID as that is the
> relevant context under flask and will ensure calling only once.
> 
> In the end I can add the ASSERT but it would be adding it for the sake
> of adding it as it would not be protecting the hypervisor from moving
> into an incorrect state.

If flask_set_system_active() is really a no-op then just adding a
comment in that regard and not touching is_privileged would be OK to
me, as otherwise I think it's confusing.

In any case I would leave that to the flask maintainers to decide.

Thanks, Roger.

