Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F02052D2D9
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 14:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332929.556701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrfVs-0006Qa-2X; Thu, 19 May 2022 12:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332929.556701; Thu, 19 May 2022 12:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrfVr-0006Np-Vb; Thu, 19 May 2022 12:44:19 +0000
Received: by outflank-mailman (input) for mailman id 332929;
 Thu, 19 May 2022 12:44:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDN/=V3=citrix.com=prvs=13146dc80=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nrfVq-0006NQ-7O
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 12:44:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63e8da7c-d771-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 14:44:16 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 May 2022 08:44:14 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5837.namprd03.prod.outlook.com (2603:10b6:a03:2df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Thu, 19 May
 2022 12:44:10 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 12:44:10 +0000
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
X-Inumbo-ID: 63e8da7c-d771-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652964257;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7xs7fh9jGwQ3TzYrbbOPuex8BoTxFH1w68QsiJXOWC4=;
  b=T/vXVvbIpY8spV8zTk107snWAL2ARunUxCSA+2mtNrxuEaVXvr6U2MQu
   flqgCHjjtGmELrgrzNiQC3U7rbMlHQImECouqrSOq5SHrG3vGMJuO40R4
   HmSZJ9IL0avZqAoMcLevSRP1isXbLphXgqJAK/jVN/EmbEIfxuvlrjHdJ
   M=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 72085922
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fbZNtKz7aceEUmi10AN6t+f0xyrEfRIJ4+MujC+fZmUNrF6WrkUBm
 jRLWW6DO/iMYTb1L9x1YYzl9x5Uv8PVnNJgHgI+/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12InhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplh8C8bwcJDPz1it8MdgVkSypAHI1t0eqSSZS/mZT7I0zuVVLJmq8rKX5seIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtadHeOWvLe03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrialK20F+QjPzUYxy2/9xSZQ4YPNCdPMQuCFZe5PmEjfr
 H2TqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqF+Owm0eDjUGWF39puO24malQM5WI
 UEQ/isorIAx+VatQ927WAe3yFabujYMVtwWFPc1gCmP16yS5Q+aD2oFSzdpado6uctwTjsvv
 neKks3oA3pzsbSTYXOb6rqQ6zi1PEA9PWIEICMJUwYBy93iu50oyALCSM55F6y4hcGzHiv/q
 w1mtwA7jrQXyMsUjaOy+Amdhyr2/sSQCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pnzjxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:x5pO0qsvnIkhpX0rSQnmseAM7skC5YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YaT0EcMqyNMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPHxXgspbnmNE42igYy9LrF4sP+tCKH
 PQ3LsPm9LmEk5nHviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sul
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A/eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wga7VBaM0ot
 gsCZ4Y6o2mfvVmEp6VO91xMPdfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.91,237,1647316800"; 
   d="scan'208";a="72085922"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQTo2HS1mfPrOBAzkDzST5oRpJy5/5feOybuZ5uni738OvebfWXlMSygZigRUrbeqy9OZq8h6ucKS59w2QMwDwoE0dpLUnsA4y1/DEUoAlxtKQawWuto2WXQ3KJl+TN4mUW5p4cp5JjPFm6I4di1CkP4oMzGxvHVQ6rF0HbQKn5rhIKOt7C6B+xmf81Bz8dN8HtYDlIsj/s/draxftzSFojBSjcWlMZt1HsdHc/unKIf/GDmDvhlj2PDq6i3UUwJgPtTwfLbIE9fNC6zsdjyomwl9qUd3kT3cwedHksLkRoEjgYGpdjlC+6N9QJyDr/+IHA620PqkhEe6Rijyg1mRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0AFcOzXgPed0QR8GiVtIfq1e/KCM27xxJIur1+7LhA=;
 b=hXM3IyJarJgjp6xPyz2XoR5lT256nYSRLXwjQncPaHDKXltT8dIz5KfAojFb1+pEBoJRKs7KhIVSRsKsIP07wFb+U2Zxk+sKVezgYdN/+4gf99O2ca45NwuVgFmgf+ldIa/595thzTAI3u/2fQPLRQ/E0sBqiCKPJW+iVGFUQfpYYMY9AwwXW9lPhSY3t7Jk8krbKKlM668oSuoWRB0/un36zdvm22A8/gHVkallOdguEHciEl+G61jYJeFRlu/K3xZClyKOWceKYRlEFVCADr70+hrfg2h8XKNPegH6GJ8aWoq/xHRDaAyN9WIuYhhNFBOuwHFyOLJ9MW782G7WkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0AFcOzXgPed0QR8GiVtIfq1e/KCM27xxJIur1+7LhA=;
 b=XomgmqFkrCbc16pocOcQ1xW3LHgq6+lySwrNisIbw9u4ztlIuzyxR/RMu9JXGLaS5ZIywY+u2wn3KhbFkHT1ZLhLEwjtaYT4dliKI2MbDuUbvvBZV5wYvwCm0Xysc8+7OHGPgvP5yg6mcIiF9VGwmsbSUQ31QkbQHHaah6iF6Ao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 19 May 2022 14:44:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/vmx: implement Notify VM Exit
Message-ID: <YoY7lrpnSMJjmurA@Air-de-Roger>
References: <20220517132130.38185-1-roger.pau@citrix.com>
 <20220517132130.38185-3-roger.pau@citrix.com>
 <5cf98549-6fc0-67f7-a882-0778e7ab6f98@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5cf98549-6fc0-67f7-a882-0778e7ab6f98@suse.com>
X-ClientProxiedBy: LO2P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d050804f-60f8-42af-89f9-08da39954522
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5837:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB5837298E48A2BC40331281308FD09@SJ0PR03MB5837.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BvbpqG2OCrOndi4Egqe4pk9qlWBoIhSgHu8JaDF0ypq03plPu3t8l3QDjuwiiXwH7wEHOjRfHJqsEgc07Kl708YMhXHH4Sizafna3ekHs+jxHaiuYa2+accAbgnsnWf7sHk7eJJsMnXbbyJMgq/LpqkLdfA492UIl4SgQFamNbAxUmXiFLdAQDMJTHU6h6kgojrhtJMcZr9R4y4JtOAv4qDWSHLClanCsf4ZF2GjvUAYLDHoAamscoX8SApaItwV/uJq7L/oIwfTs/ArOBTr730+itYqlpCvSig3F0pKAsfCTsesjesY8kmNfdeTts6aTMw9BLrt4FrQHK69VHzPV73JqRyXCsPNC2bYjEyhqWnHUxsyNY2elBwIYne3nI3TsjU/B83N6eH7ewo99emWHbHEtN43hKZGIiC1xma+9ubZfWqUCuZ2uFwEw0ZlBT92tQNsfglOpENobe+3e4Tq98x+vHy5xyJTYkrUqYcr9iR/4h6t2PiyhooKfFaz9VQMayZnaA+qfDLq4xY3koGAgTWts/LOkygoll0pQ01ems2po4dkTQd6H+o1q1VGcflZ854NDhx2op80ruMdTfqWtW0yy317MmrGknOPAqmr+aESCWN/4Q6yDnNySx+Kdc/kjArBxSpRoXLaKzhtyPsaew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8936002)(9686003)(6916009)(508600001)(2906002)(82960400001)(54906003)(5660300002)(6512007)(85182001)(4326008)(66556008)(66476007)(66946007)(186003)(8676002)(53546011)(316002)(86362001)(83380400001)(26005)(6506007)(38100700002)(6486002)(33716001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U24wSjZxR2FUTE0rUGJDbWk4dVg4Y2h6amM0V2haUEJ5VHdsZDRtTCtPOTJK?=
 =?utf-8?B?NkZPR0xEMEh6SC81QmtzY1d2bzRvQ0Y4dGErTms4eHg4c1FrOWZzOW9oMEFk?=
 =?utf-8?B?Z01qaDRQWi94U3hLL0Q5R0JSQzdMWFMyWEZwcHNkVHlHNXFQUHk0cWVUNjFB?=
 =?utf-8?B?ZmhKb2h3cjJyQ3p5SVJhWmNVb2JqYmxmUUlQS21mLyt5WDdaa05OdURRK1dy?=
 =?utf-8?B?VzVHWHIwbUtvM0pMN0dNZ1RqSlJLbFdPdkI3bE9xbDNEWkF4clZwZEJtYnJS?=
 =?utf-8?B?QTVZYTVDL1dPWWZIVExsb1JSdklxb1dkejR2Z3Q0Y2M3cUNxR2kraC9RNk1C?=
 =?utf-8?B?Wk9sd2ZHazJscjR3eC91V0pHR0RCSFN4TGpaUFFjT0h2SHNtQjYwcmpPRmZY?=
 =?utf-8?B?R0lXQkxzVUtJZVppVVh3czZCSi9BYktQZThwTUwzdnVqV2NWdkJZL0wwTytV?=
 =?utf-8?B?OWo5alBuL3MwanlqazlscUVDQUJZeVIxMmlkK2M1ZlZ5L3Uya2huSlV0bWhn?=
 =?utf-8?B?WC9QUER3Unh2NFN6b09QSklMdmlHcTY3c1AxMjRyTVJnVDMzeHlZWTY0RUNr?=
 =?utf-8?B?ZERtdHpsQ3pMWDI4RjMxckJtUERnZTBMTm94ZVFKVTlJRTh3TndjbEFsNnFt?=
 =?utf-8?B?V0toaXVoTUJ5b0MyRU1odVkwR3V6TUtlaVVsdFhMVHhHMW0ySXRXUU9MMCtT?=
 =?utf-8?B?NVBVVkR2ZUhmd2xTayt4Q2llSUZtT3Q5Y1cxWG01dCt1Mk80TjBWVzFMclRw?=
 =?utf-8?B?U1FrSjVaYmJ5M3Q4QllmOVpyUHVWRC9CTUJCejc3M2FaUkVDUHB5NC95RXZw?=
 =?utf-8?B?SEk0OTBZakdBNVpwYUpDODYwdWQ2dHVNQjFra21nLzc2ZFZnME01Vm9qRjQx?=
 =?utf-8?B?enhmYWFCSWllODJQMW9wR3NsT2hZL1AyQVM4dEJkd1FtOWRJaXdVVWdaUVJ4?=
 =?utf-8?B?dXlNWGw0d2RwR09yQ005eUtqQjAwMFpvK3N3QU5TcnAwY0Q5cWVkTnE3MW8y?=
 =?utf-8?B?QXZsMFdqWis5KzRNbExHeTZ5ZStzaHBDQ2tNN1EyQWVQVENNZEdablJhY3dU?=
 =?utf-8?B?eHZyWnNBUlJNRTQya1JXOTN0aS9JTTJNMm5IT3pyMGlCdG5tNklLZ21hOElW?=
 =?utf-8?B?VHZmeWtBSXRBbU1UQWx0SkNwWk5vSi9IQmZlRjlQVzVZVmZRampPd0trNHRR?=
 =?utf-8?B?dEpZU1YwUTRFOURBblRIN2NIR2FaOEgrVGJUdjU3ZVhnUTBpUDkyMS9OVUls?=
 =?utf-8?B?Y0poS1pTQWRqdEI1cEpFRnVVc05JYkJ5M01XMUt0Q2diUmtDaGQySkYxU3Bw?=
 =?utf-8?B?b0did25QeG5jNFRlMFpZUW9zVnJMd1owVkFqZEZCV241enl6MTFwckxnZVE4?=
 =?utf-8?B?Y0xSMDlsdjk5UFErSHNSMlpFVTFCMUwzRXhDOEVtcjY5ZkR3NHovK0VONUFn?=
 =?utf-8?B?L0xhNXdkeHJVVnlvaFZjSkN3T3dZSEU2K0Q4NDhpeDJsM3BRWXk5MVc4K1Za?=
 =?utf-8?B?OUNQVHdVMVhBR09laDF5RzBjS0l3OStPNjZxZytHb0hKZHRDd0VwSlQ3ZWdn?=
 =?utf-8?B?WnllU2pIb3UzUkplbkwwK2FjN1p2MXFPcUNucUpzdXBlV2pueXIwdFV4Zmha?=
 =?utf-8?B?MlpsVDFaUXM0TDdWRTF6WWtjNFJ5NVZRK3Q1NzhBZTk4Q2psaDFoSk9LbC9B?=
 =?utf-8?B?T0RBTE9BOTBLMWN0OTMwVEljMmllQ09mTXpUK1dDeFFSZkxmZTNreEtibk0z?=
 =?utf-8?B?VmdTL0ZYL3l0a3l3QXR1aFB0ejN5eE41YVBrZHhpSkFYRWthbEZPSVcwY1Ar?=
 =?utf-8?B?dERYUGV6MVhqbGtjYXExb0JsM0lLN2pOSEo4dWRDdk9wWkpuemQ0cENMcGdD?=
 =?utf-8?B?Q3VDUGViTExYOTRRUlRmYVBwY0t2MTk4Zi9qSnJlVWhudU8wQWxacUcrejd4?=
 =?utf-8?B?WVVyWUVJdUhxbkJ3M2QwVWMrL3ZaNjhoc1g4bFNpL1djK1ZvVldLc1FUQkxt?=
 =?utf-8?B?QVEzZGxzekM3SWlkbzJWM3dCMFNxVHRHbmtucmJUMWt0UndIVHZBckN2NUZV?=
 =?utf-8?B?ZVVaajNEVGQycW9wUDJINzVKb1FtZWN4UGRCRGFwRVc3UUZVMnJYa05FekJa?=
 =?utf-8?B?c3JOKzJlL1dSZFV6NlN1cFVqWE5XclM0SFFseEZHOFpnY24xTFR2L1JkZ2RE?=
 =?utf-8?B?WTJSbnRGWnZSYitxOE05Zm9RNlpLTWxFMzRTOUR5ZUlnSGdObjhvZVQ4dEpw?=
 =?utf-8?B?cUFJNzQwV0FMRjRNWFVET1pENXpCYTVzM0VybHJUUG04dmxFN1dTK21QeWh6?=
 =?utf-8?B?eU1MVkVpWGE3TjVYNXR1OXIwWnB0T2F6aTRPYjFzU1JUaVB6ZmU2L0ZBN2JP?=
 =?utf-8?Q?ioaU1vcQRpCZh+Qs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d050804f-60f8-42af-89f9-08da39954522
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 12:44:10.0554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vku9EUS6iCxAj7JgyBggv/LCSlUkHlNhrliy8uGQlh3/h910oz6GKqxnJoQ9LJTyHysSe5YfPerfHzPd/G7+CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5837

On Thu, May 19, 2022 at 08:50:55AM +0200, Jan Beulich wrote:
> On 17.05.2022 15:21, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/vmx/vmcs.c
> > +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> > @@ -67,6 +67,9 @@ integer_param("ple_gap", ple_gap);
> >  static unsigned int __read_mostly ple_window = 4096;
> >  integer_param("ple_window", ple_window);
> >  
> > +static int __read_mostly vm_notify_window;
> 
> __ro_after_init?

Yes, I tend to forget we have this now.

> > @@ -1333,6 +1338,19 @@ static int construct_vmcs(struct vcpu *v)
> >          rc = vmx_add_msr(v, MSR_FLUSH_CMD, FLUSH_CMD_L1D,
> >                           VMX_MSR_GUEST_LOADONLY);
> >  
> > +    if ( cpu_has_vmx_notify_vm_exiting && vm_notify_window >= 0 )
> 
> The assumption then is that values >= 2^^31 are nonsense? Generally
> I'd think we want to special case merely ~0u, giving the variable
> unsigned type.

OK, I really don't know whether >= 2^31 makes sense or not, I would
think that using such values the window would be too big to be
helpful.  In any case I don't see a point in preventing >= 2^31 so
will adjust the type and check.

> However, I also don't see where you disable use of
> the feature in that case: Merely skipping the VMCS update here isn't
> enough, is it? The field itself doesn't know any special case
> values (like ~0) as per the doc I'm looking at. So I guess the OR-ing
> in of SECONDARY_EXEC_NOTIFY_VM_EXITING in vmx_init_vmcs_config()
> wants to be conditional.

I've sent the disabling chunk as a followup, forgot to add it here,
sorry.

> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -4567,6 +4567,30 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
> >           */
> >          break;
> >  
> > +    case EXIT_REASON_NOTIFY:
> > +        __vmread(EXIT_QUALIFICATION, &exit_qualification);
> > +
> > +        if ( exit_qualification & NOTIFY_VM_CONTEXT_INVALID )
> > +        {
> > +            perfc_incr(vmnotify_crash);
> 
> Is this a useful event to count? We don't count other crash causes,
> iirc.

I thought it was helpful information from an admin PoV, but maybe I'm
mistaken.  I know we don't count other crash reasons, but that doesn't
mean it won't be helpful to do so.  Given that users have to opt-in to
enable counters I suggest to leave the counter there.

Thanks, Roger.

