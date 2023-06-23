Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A4473B2EA
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 10:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554334.865470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCcVd-00049t-Pq; Fri, 23 Jun 2023 08:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554334.865470; Fri, 23 Jun 2023 08:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCcVd-00046Y-MT; Fri, 23 Jun 2023 08:51:13 +0000
Received: by outflank-mailman (input) for mailman id 554334;
 Fri, 23 Jun 2023 08:51:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XsjE=CL=citrix.com=prvs=5311150ae=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qCcVb-00046A-T1
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 08:51:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18112d90-11a3-11ee-b237-6b7b168915f2;
 Fri, 23 Jun 2023 10:51:09 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2023 04:51:06 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA2PR03MB5916.namprd03.prod.outlook.com (2603:10b6:806:115::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 08:51:03 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%6]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 08:51:02 +0000
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
X-Inumbo-ID: 18112d90-11a3-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687510269;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3e9wKhzwLzipYz1IHixIfwcuyWBi22B0TEIMQ2IgaUM=;
  b=hOJLZOXku7vRCsyM/fmnGOajMYrydYWxllkVxQkz0DR0PqaAru2hPnz/
   0J04hW/acCipINfCzdhuCoc+3kvogX8wZmCTqubx7xc4x2McvTCCJGzxr
   VyfzK+wdxFBbAURjNo/rCwovdY5/Nd32CyZ3z24phr9R/Ndhw9H8LJ51V
   Y=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 113883249
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jWAh/a4JY2Jg4eJVXumv/QxRtKrGchMFZxGqfqrLsTDasY5as4F+v
 mFOCmCPPfbeZzOmf4h+bo+18kxQvcTWytc2GVE9/i9kHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa4R5weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 +BHNRoVRCy6rO+05qu4G/QzucI7I5y+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOOF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHirCNlISOzQGvhChEbDm3w1KQUqWkq9uMerr2m+W48cA
 hlBksYphe1onKCxdfHDWBm/rG+BrwQrcdNaGO0n6ymA0qPRpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRuVPSUWNmYEaTUzZA0J+cT4oIozgxTMSf5uCKewyNbyHFnYw
 TqHsSw/jLU7ltMQ2uOw+lWvqy2ojojESEgy/Aq/dmC46gJ0Yqa1aoru7kLUhd5bN5qQRFSFu
 HkCmuCd4foIAJXLkzaCKM0VFaytz+aINnvbm1EHInU63zGk+nrmcYUO5jh7fR9tKpxdIWSvZ
 1LPswRM4pMVJGGtcaJ8f4O2DYIt0LTkEtPmEPvTa7Kif6RMSeNOxwk2DWb44ownuBFEfX0XU
 XtDTfuRMA==
IronPort-HdrOrdr: A9a23:FZ45cqj641Ma6DTxuQxz5xMY/nBQXiwji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPk3I/OrrBEDuexzhHPJOj7X5eI3SPjUO21HYS72Kj7GSoAEIcheWnoJgPO
 VbAs1D4bXLZmSS5vyKhDVQfexA/DGGmprY+ts3zR1WPH9Xg3cL1XYJNu6ZeHcGNDWvHfACZe
 OhDlIsnUvcRZwQBP7LfkUtbqz4iPDgsonpWhICDw5P0njzsdv5gISKaCRxx30lIkly/Ys=
X-Talos-CUID: 9a23:MvFkSGy3h/T/yeWOJnG+BgU+Bp84WGX38E77Lk2eEGU4VeKqT0efrfY=
X-Talos-MUID: 9a23:dt7aMgqYd6sUDzecV8sezzV5ZJp4xYW2NE8cl4w4qeyjNSwteB7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,151,1684814400"; 
   d="scan'208";a="113883249"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCC/kyV446eqqftsC1klNsftyIyyHUYg+AnwsP3Us9tW9nLHmjfTwgdv2IxeS8TAagArO0WAuu+CjygzLXi7QjNnbh40g4OoMEzQaOeDDkSTgg4ZqkmUzYpsdvsqv3xh/LdBoz6JJMLbprP9cdOXgjHbDxhZWAok2CxiuEWTxlUeXSFCcGjsXvNdE+TAJ795glNwHgwKH5eE5doQij9AMGDLV3eywUN9WPaAolssD9mLXM8J+Sewu0sMsDOZpDMHB/hQnSutiniJAdPhhCxZVWWQhqL4uVUwVtNtiktt9SkE0M1GsZ7/vqp6Ly+xM+bfErWoNzW+gPWYnAC+AQfOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Cwq3kztympJRScJkWlZG8+8n5xNCz3RbO2GZ/NShqE=;
 b=loOYqVCjVfEAcKsjyhVT8N7CDJlJMZyEeVmsv4dq8tNtKRHoe8b6sw1ZfGqap0n4fTGbRtHjrF7dR4Sh1NhjSBQogM8nC/KRaaSsKfTwh4ShvMsTKcVSISAyX2Ae/vqQY8xpEvpVCICUvWeHBv53U+qOFZOmZ7nSirZjPdiDp+twz8IxC9qcl2uKwvc4UTWr5nH+RFzaWyWU2wk27Gs9rBUAtuEfKtHuFlO8m5p+mvLmgdaObVm6IsLU0oZ0CmLjVt1MoW9LgpagqulvOLCgUlXaZ+K2iHRbL7MYrRzAYBEC806IUXLZ+dD2LjzUAbP8cQyhVYwENyv28mw634ytLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Cwq3kztympJRScJkWlZG8+8n5xNCz3RbO2GZ/NShqE=;
 b=IeivFcL23hyjlSo4TPhGOWEAjX2O5MOrJuhnU4fUUDfN3zS8mpLi/a7CiZg4jDpAr5w8+yo5BYylwo3e0P2hePf4HjPwl4KVcMvH/G3LPVLfEZv9l/6f5HED3sIHHB4tx4tBPSA2um7311utxd8FIHe6dM9aYMzrzSjIdD7qVA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 23 Jun 2023 10:50:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Message-ID: <ZJVc77SwvyKOEdnJ@MacBook-Air-de-Roger.local>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
 <ZIyOCan//39V3bdy@MacBook-Air-de-Roger.local>
 <87352kpj04.fsf@epam.com>
 <ZJQDGOrP1I3hR5Jj@MacBook-Air-de-Roger.local>
 <87ilbfnqmo.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ilbfnqmo.fsf@epam.com>
X-ClientProxiedBy: LO4P123CA0301.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA2PR03MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d04153-5960-4538-97eb-08db73c6f8f9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ViB9kQmowzF1W6uK89sTgPXzV3u22Bq5s5oQtF/AhkIV3sS6MQLUhzWUCYmqAhbEIW/Qkp5aQuNgcvdb7C65lAu4d27DB84p7enjz1bobnFa4M7xc8OeXiJhzmygX3+NRv483tpi0E5AYdFvoaYbdCR/4HiLLD89UY8ZFEc8irxCUPPikRBTDQxZ/wCGHkAhkdMB9XqIV5OO3ysijf9/2AsL09hzJ6ZGXmqnIQNkEiFrONHL8eIQrlZKUmKe1m1SL6t/y+gmK1Xx38u8qC52uh7IDPt7mo9Uq+xsWeEPa7PuUPamf00iomEHhfkh0bubbA57eWdmPn1CNM8A7UP4jCN1wBllJv+m1/Vif8G8k+NyeO140Rf1NiXRxrsDMM9u7Y5C5r52dtOavgXuFZh8eTfEH3bN2krbkpifp9/OvA0MhNWwLVKCPlubb85whMof9VuLL6da73WE37yIJjZKtMGWh57eTNIyXAsxqX1twvu0MNdE+zo6706feAWdBqDFljWA553ztpxuKAahNqJRqx01hjvcWNyBMekD5SVZlDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199021)(54906003)(478600001)(66899021)(6512007)(26005)(9686003)(6506007)(6666004)(966005)(6486002)(7416002)(5660300002)(2906002)(85182001)(4326008)(66556008)(66476007)(6916009)(66946007)(86362001)(8936002)(8676002)(41300700001)(83380400001)(316002)(82960400001)(38100700002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjJFTFRmVkk4YXQwZitOWi9rUmROOGpRQklqYko3TWdTR3JJVzlWaUtYTTh0?=
 =?utf-8?B?UWFVSjdGMHVDZUR1Z24rRTg1a1lJWWZSYWQ4K0tHOGhMKy9PcWdxMVdUT1ov?=
 =?utf-8?B?SVMrblhTMVdzNE0vNDNzZXFqU3BwMFVKc05ZYXVWb3FPSWp4RGd0a3ZMUlZk?=
 =?utf-8?B?bHNxKzZBbHBBdDNtZDkyTkk4OWlkaUpGM1RaWExsTmFFSWZxcmttMldCNitI?=
 =?utf-8?B?blNybGJPaEtnNTVWaVI3NVVwbHpENkswN2huZGtabVZuWCtZZmpIai9Pd0Y4?=
 =?utf-8?B?eEx0QXdXd0xoR3lEUVMzRUlmNWJMMnh6L2pMTk05eE50Q0JJYXJDMzNPNEFk?=
 =?utf-8?B?Sm5KRE9xaHBtWTd0RDQ5VGZEU1RhZWhaenVQQTFsd0NYaHYyays2eGdyaVUx?=
 =?utf-8?B?dzZrei9Pb0ViNVN6R3Z0UmVzSUxXS0w2ZmpFTVJOT2k3c3RyWjFHcVNwSlRJ?=
 =?utf-8?B?YUZjRnlWSFBQc29ZM1pzeEdjOUtpMTJuQW9rYkVXZG9CTjdmQUlrR1F6U3BL?=
 =?utf-8?B?V01OdVl6RFBoTnRDVXFVbW9ndVltQVFkVmNLZ0Y1eHpjV1A3YVZoNnRBdElG?=
 =?utf-8?B?cGFnNGIzSUJRcHV5bGZJclpHNmpXWVYwS1VudER4K3RIOWNqUzVjajRuOTZm?=
 =?utf-8?B?YXozd2NRcUVsOUxPTXFjaG1xSHQxOTZiZG9YT3NBbE5SSDVmR3V1dDMzbnZp?=
 =?utf-8?B?RllrUnpGLzd5L3ZYSytUcVdTYW9rS1hXM05Yb2krVDdRTUNqM0JHZXFmWTNC?=
 =?utf-8?B?UEc5eUc2VWtNaytjVWRnU3NITjBOK1Q0L2VlM2RFYUV3SkE1OG1kRENsY3VB?=
 =?utf-8?B?WGt2NTR5UjJYVlVkTE9uUExXV0lZczBOTzhHSXJObXdPSVVBNUNIM1krQjc3?=
 =?utf-8?B?VENnQ3lqN3J0NnMzcjlJamtqZ3ZPM0VKckhScTIrclpNVGQvSTdLVml3N05j?=
 =?utf-8?B?V3U2ZXF6dXJIKzM3NGVyUERzNzBJRTd5TGkzaVFCK3hoQjN5RTZFVmhqbHA0?=
 =?utf-8?B?MVhxbTU1eWI0cFM4cUxOMDNYRXYwbEc2VUgxOGVPaDNSejZtaGRUZE5wdDlU?=
 =?utf-8?B?S2Z4VmE0cmxCWW9EcjZocXlKc3JZenVCcjFVK3lhT09JeVhrdlBxZWlKbUFk?=
 =?utf-8?B?SzlkSkFaQUxkK09yWDl4WmdvaGxnUkMvbzd4TGtzci9PNE42c2lLTkFuZlFC?=
 =?utf-8?B?bUtXaWdxWTFFekNQQmk0OENMN3hvb2kydS9oRWFLSysyMnhRTi9BNjZZMGV4?=
 =?utf-8?B?SlBzeS9reld6OEdlZXBGdC9PSHIzN0tVVmpNRjBnVVZnMGhsMXljWE9RQURr?=
 =?utf-8?B?YkVEYjhBZ2hSUG9zSEFOeGtWeURxZzN5MHJaTlZUR3NYaXZuSUtNWStTWGlX?=
 =?utf-8?B?dUFwY3Q2QXZoMTI4REl1M28yK3BQZGJ3eWd4RlRUZEJ4NWpIakN6YnRUVUJP?=
 =?utf-8?B?cjRLRkFWd0dldjFKQllCdFY3RXU5aEF6UHBvRUtDd1hybTN1Y2UwckMxaFQr?=
 =?utf-8?B?US9RbHdmTjN3Q0d6REl3dzZjR3pQYVNjK1hEZlB1UkxwdFdwZ0dnVXJEaytz?=
 =?utf-8?B?NmNyeEdHWWNzRmg3eHBhTk5CR3ljK1lnZkNGMmNMaHNDQUN3TDBXdnFUN3BP?=
 =?utf-8?B?T3MyUlhtZElUU2lGWjA4cnhHTDNiVStuZ3ZmbzQzODVjWkZ4RmFEcCtxaVRP?=
 =?utf-8?B?ZTNDdzJEdStPbXVNd0tRVjdUQmxTVi9tY1JGbGtsMlZuSGpMdEFoQ2k0RXBs?=
 =?utf-8?B?SmhwR1VheDF2b3U0c2JWNHNiMEowWEdBMkxLMUlCNDB0bGhEb1BvVG9nSzYz?=
 =?utf-8?B?T3V4REVLK2ZWZWdBYWFFdFBFaWhnS1o1TnBhQlQ2VTJtOEUzTEdKYTR5OEVw?=
 =?utf-8?B?MHYyazVZQ0ROSDNzak5WWXQ0cDFmUGNLdThxVjgvaXB0dzZYZUhQWGJOTEhC?=
 =?utf-8?B?bzlLN0h5Y1p4OWFPT1hHREtUT2wwNVgyRlVGQjlnZHIxcmhkeExCZGZBYUNT?=
 =?utf-8?B?bnYvUEk2aUM4ZVNqVEZkVWVCWkZ0UnlGaUQvZ3VQYnZYYzduOERsRFZ5M0lR?=
 =?utf-8?B?Y2RWRmovTFFvNU1sT0l4MkJmUVR2VWdoL3QzRld3TEFNNlFiMVBiTUswenJ1?=
 =?utf-8?Q?X1mlGD2xnW7dOFsqvy/kJWY+x?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vugpjMzudzDbvd0kcjJMULnQ8Pwri98imoyI9bysYzP1nQ62DEPOqvC+Q6UOMowE8cA+QlNMAvGJFlwKt8jMtIdh7fitQr8N8tltbpCkaWsaILLz2bscca7CRGOpOMDLbrD3wasIrSJy0gxye4ZF5jHdGvg1vOamytPZVUpeo9QaJe/DBJikXJedJDP05mDMFuo+g2xvlN1BAk/xIzGhAysodCpaxje2vuTgZIk6cJ4dfv56iAlKbLP2H2UXwZyHK/YyReVI/vJ4PQ8zKo2xGftbdNj2G1wnOynNMu/ZjH63vFwt9MX9kOK5JkKpTsKemM8fyOUThKk3dbB7cWD1lMJAoxecm6yMmOOsZQ+ySuDF6iNg//tRCLlHL3SrSfVGoIXJOIdvXFqzQzZT/EUhZCdvdE20qak3wYx/u+bxiB6kOZHFlUZCtU61DmXtGMn4pN7FToAlwuP+wLA7ucJ/0JO1aGktLOFJf+NgYm/jUQ3c/qNC0p0YfKtS3ZcpVrE/F+zveJSnyt7YM/l7AWQp/6CtuoshslgCFE7pe8rlL2U14RBERiIVRz9+oZCh3WPpISnwFF3q5FsJy7OiDYHBporDvouEnbbbr3nP7iYyCJNfpZKUU8BPfc7uCgjj1KHshK1BQ6JS4Ar+nOrfYhfsaR4qiPmXsICn+NZVN/nCaRombTGggHeSkO5QzjbMZ9ttN8PASEmoPYWDYLHn6lpSEob64uRQRBPm8Hbdpo2q78mZmdayg+PhvMtHuzYvBjE7sztUxR2DhUPnnKmWNYs4KJolwVlmI4Ogsq2tJcTqKKGluXUUYi1FjWiwKqJYs203/ZSSfB++4IH0eHanHN19etKGjy5fbaz6klhUzDnHSrp9wm1BtrmvyTWMJUuGlvIK
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d04153-5960-4538-97eb-08db73c6f8f9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 08:51:02.4205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkQkV5y/bsiacCRALaNFuY1a82Nl8rK43bSqc9Lu2TijTBzWR8LJOdw2Y9NJu/+DSGPqt3S8563v9yR3KN+rnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5916

On Thu, Jun 22, 2023 at 09:17:36PM +0000, Volodymyr Babchuk wrote:
> 
> Hi Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Wed, Jun 21, 2023 at 10:07:20PM +0000, Volodymyr Babchuk wrote:
> >> 
> >> Hi Roger,
> >> 
> >> Roger Pau Monné <roger.pau@citrix.com> writes:
> >> 
> >> > On Tue, Jun 13, 2023 at 10:32:26AM +0000, Volodymyr Babchuk wrote:
> >> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> >> 
> >> >> Introduce a per-domain read/write lock to check whether vpci is present,
> >> >> so we are sure there are no accesses to the contents of the vpci struct
> >> >> if not. This lock can be used (and in a few cases is used right away)
> >> >> so that vpci removal can be performed while holding the lock in write
> >> >> mode. Previously such removal could race with vpci_read for example.
> >> >> 
> >> >> 1. Per-domain's vpci_rwlock is used to protect pdev->vpci structure
> >> >> from being removed.
> >> >> 
> >> >> 2. Writing the command register and ROM BAR register may trigger
> >> >> modify_bars to run, which in turn may access multiple pdevs while
> >> >> checking for the existing BAR's overlap. The overlapping check, if done
> >> >> under the read lock, requires vpci->lock to be acquired on both devices
> >> >> being compared, which may produce a deadlock. It is not possible to
> >> >> upgrade read lock to write lock in such a case. So, in order to prevent
> >> >> the deadlock, check which registers are going to be written and acquire
> >> >> the lock in the appropriate mode from the beginning.
> >> >> 
> >> >> All other code, which doesn't lead to pdev->vpci destruction and does not
> >> >> access multiple pdevs at the same time, can still use a combination of the
> >> >> read lock and pdev->vpci->lock.
> >> >> 
> >> >> 3. Optimize if ROM BAR write lock required detection by caching offset
> >> >> of the ROM BAR register in vpci->header->rom_reg which depends on
> >> >> header's type.
> >> >> 
> >> >> 4. Reduce locked region in vpci_remove_device as it is now possible
> >> >> to set pdev->vpci to NULL early right after the write lock is acquired.
> >> >> 
> >> >> 5. Reduce locked region in vpci_add_handlers as it is possible to
> >> >> initialize many more fields of the struct vpci before assigning it to
> >> >> pdev->vpci.
> >> >> 
> >> >> 6. vpci_{add|remove}_register are required to be called with the write lock
> >> >> held, but it is not feasible to add an assert there as it requires
> >> >> struct domain to be passed for that. So, add a comment about this requirement
> >> >> to these and other functions with the equivalent constraints.
> >> >> 
> >> >> 7. Drop const qualifier where the new rwlock is used and this is appropriate.
> >> >> 
> >> >> 8. Do not call process_pending_softirqs with any locks held. For that unlock
> >> >> prior the call and re-acquire the locks after. After re-acquiring the
> >> >> lock there is no need to check if pdev->vpci exists:
> >> >>  - in apply_map because of the context it is called (no race condition
> >> >>    possible)
> >> >>  - for MSI/MSI-X debug code because it is called at the end of
> >> >>    pdev->vpci access and no further access to pdev->vpci is made
> >> >> 
> >> >> 9. Check for !pdev->vpci in vpci_{read|write} after acquiring the lock
> >> >> and if so, allow reading or writing the hardware register directly. This is
> >> >> acceptable as we only deal with Dom0 as of now. Once DomU support is
> >> >> added the write will need to be ignored and read return all 0's for the
> >> >> guests, while Dom0 can still access the registers directly.
> >> >> 
> >> >> 10. Introduce pcidevs_trylock, so there is a possibility to try locking
> >> >> the pcidev's lock.
> >> >> 
> >> >> 11. Use pcidev's lock around for_each_pdev and pci_get_pdev_by_domain
> >> >> while accessing pdevs in vpci code.
> >> >> 
> >> >> 12. This is based on the discussion at [1].
> >> >> 
> >> >> [1] https://urldefense.com/v3/__https://lore.kernel.org/all/20220204063459.680961-4-andr2000@gmail.com/__;!!GF_29dbcQIUBPA!zPy31CWFWlyC0xhEHiSj6rOPe7RDSjLranI9KZqhG4ssmChJMWvsPLJPQGTcVsnnowZpP8-LaKJkIWIzb8ue0DoYhg$ [lore[.]kernel[.]org]
> >> >> 
> >> >> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >> >> Suggested-by: Jan Beulich <jbeulich@suse.com>
> >> >> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> >
> >> > Thanks.
> >> >
> >> > I haven't looked in full detail, but I'm afraid there's an ABBA
> >> > deadlock with the per-domain vpci lock and the pcidevs lock in
> >> > modify_bars() vs  vpci_add_handlers() and vpci_remove_device().
> >> >
> >> > I've made some comments below.
> >> 
> >> Thank you for the review. I believe that it is a good idea to have a
> >> per-domain pdev_list lock. See my answers below.
> >
> > I think it's important that the lock that protects domain->pdev_list
> > must be the same that also protects pdev->vpci, or else you might run
> > into similar ABBA deadlock situations.
> >
> > The problem then could be that in vpci_{read,write} you will take the
> > per-domain pdev lock in read mode in order to get the pdev, and for
> > writes to the command register or the ROM BAR you would have to
> > upgrade such lock to a write lock without dropping it, and we don't
> > have such functionality for rw locks ATM.
> >
> > Maybe just re-starting the function knowing that the lock must be
> > taken in write mode would be a good solution: writes to the command
> > register will already be slow since they are likely to involve
> > modifications to the p2m.
> 
> Looks like modify_bars() is the only cause for this extended lock. I
> know that this was discussed earlier, but can we rework modify_bars to
> not iterate over all the pdevs? We can store copy of all enabled BARs in
> a domain structure, protected by domain->vpci_lock. Something akin to
> 
> struct vpci_bar {
>         list_head list;
>         struct vpci *vpci;
>         unsigned long start;
>         unsigned long end;
>         bool is_rom;
> };

This IMO makes the logic more complicated, as each time a BAR is
updated we would have to change the cached address and size in two
different places.  It's also duplicated data that takes up memory, and
there are system with a non-trivial amount of PCI devices and thus
BARs to track.

I think it's easier to just make the newly introduced per-domain
rwlock also protect the domain's pdev_list (unless I'm missing
something).  AFAICT it would also simplify locking, as such rwlock
protecting the domain->pdev_list will avoid you from having to take
the pcidevs lock in vpci_{read,write} in order to find the device the
access belongs to.

Thanks, Roger.

