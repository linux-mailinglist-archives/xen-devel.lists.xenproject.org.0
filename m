Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 768D3757C17
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 14:44:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565184.883133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLk49-0004PE-H1; Tue, 18 Jul 2023 12:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565184.883133; Tue, 18 Jul 2023 12:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLk49-0004Mn-DP; Tue, 18 Jul 2023 12:44:33 +0000
Received: by outflank-mailman (input) for mailman id 565184;
 Tue, 18 Jul 2023 12:44:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9jt=DE=citrix.com=prvs=5561f9d71=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLk48-0002IP-8L
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 12:44:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d55173fd-2568-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 14:44:29 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2023 08:44:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO6PR03MB6228.namprd03.prod.outlook.com (2603:10b6:5:35c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 12:44:12 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 12:44:12 +0000
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
X-Inumbo-ID: d55173fd-2568-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689684269;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=QGsl4OT+iTggPUJrovUVSAuwyNeFqK9Pe6BIahwm9qQ=;
  b=EO2UdwYubFl2bMITFV5Sn4Ywg6nMogUSEF0Gc+tfqy7S3df3BFBGSLff
   kjBIivgMD341hgdbcSyV4wRXffngogA3+E+u6e3e2LRs6k/yE9WACmh+W
   U23l98w2+y1R1MmtL+9gkZt37Lz0TQDinbehvJq9glXxI5TgP/PM9PjBS
   4=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 119178503
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9XYdM6JYSGuh+MPFFE+RE5QlxSXFcZb7ZxGr2PjKsXjdYENShT0Bz
 mZMXW6Fa/rcYmb2edBzO4238EwCvZ/TyYU3TgRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QVuPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5zAXhQ+
 swULQxSLTfev+2926+6Tflz05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv117aQzX6jA+r+EpW/9PVJkgOdx1dPJx0xamGRosSmqxSxDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBLSNrmK2YTzSa7Lj8hTC/JykTa3MDbCksTA0Z7t2lq4Y25jrXR8tnOL64iJvyAz6Y/
 tyRhC03hrFWh8hb0ay+pAnDm2j1+MmPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOjBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:w45Mw6t8ZdnHkdsHU+b/nWLW7skDldV00zEX/kB9WHVpm6uj5r
 +TdZUgpGPJYVMqM03I9uruBED+ewK/yXcY2+cs1M6ZLXHbUQiTTL2Kj7GP/9S6IVycygc178
 4JT0EXMrzN5DNB4PoSjjPTLz7OqOP3iZxBaI/lvgxQpcEDUdAc0+7TMHf/LmRGABhdIZI4EZ
 qa6OpLzgDQA0g/X4CrHF0IRfLKqdHqmfvdEHg7Lg9i6QWHgD+y3rrmGxiUty1uNA9n0PM57W
 PEnmXCl8Gej80=
X-Talos-CUID: 9a23:XV0Gtm/MRpJsFBXeiGGVv0oUA94qQnHY8CiTBBKABm1yVbySWUDFrQ==
X-Talos-MUID: 9a23:Wnw27wZrWpGVHOBTsD3npyM8OsZTv4uuL383u5Y7pOjeOnkl
X-IronPort-AV: E=Sophos;i="6.01,214,1684814400"; 
   d="scan'208";a="119178503"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZFQOPbvcaD0YYxeYe6fwavvQPm58Srzz8Or2MuED3Rl74URLMfEvorEhTPgSPL7zYJqxHJG4YpTWeNRn5w51r2kJpjlXNknsaWhVoO2lJYnaiLeqKz4VpwwcWniItmbdqUJA5u/HoKEr7pfztdJNi0LqGlmobzJQ3a0rDteNT9m62mzDE6XWwO5hFzAkjVvz60Olo/LG3J26J1/2LKJWqW/chtXvtjU6MZVLl6P62EyXho6BWoEmfglUKmmJs4hDmrGzSM6S8EhkQ6y5uWSHbZp0yx+prSEb7h117uwQ0I+D1ZXbHFSUuY8H5bHieLsSmMQlX7xoC5qUuNbsaLPcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+ah55pwSKrj0QLPdtYi0rT2uASDXc6qmyPXuOczQlM=;
 b=YmgOxT9A8x0JMoM7GFp8XkzOBkOyk+K7EbmQ8LTRskR4LQyZaLSmyQDSjcXFPLddACn0uAT8Az9yAN5veJF1r8fds/du+YJ1qhgxGd4GLb/7anXUnI+sJSM6AlWlXgT7KPKp1W5EdGsjk2RJUQZm/k+q8mA+md4BYZHC4FbG04bba8BH21z7SQXD8Fu14PVlyeZcLo07eswVxChb2kP1z6FHWZ/JAMl9TLSVQU1xqeHYJ2mzy5PFBTxGXd2YOA+nqg5Hi02U63hWFhy458bd8rK0c3neMOpfc1UiyU0senCEAziqTKR/95NGiq6ZjCoTfwyLA1HpJsV9UBPizz3Yug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+ah55pwSKrj0QLPdtYi0rT2uASDXc6qmyPXuOczQlM=;
 b=vUbbJrORQO5hOxzZ8jJVk6gqHkwjSLHtaXWUgEUaH2ZBYNVl5jkviIkkvQwvtMKE219iqeOfR7yK9sVimd5EUa7FUSNUU0II8gA+kKsqNjIHovbqcnbHFqjOh9p6O76xgxHgx+hWldCrH3TFe+uvDAvZb1nRLojyjPyZB5tc6RA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 4/5] x86/iommu: pass full IO-APIC RTE for remapping table update
Date: Tue, 18 Jul 2023 14:43:33 +0200
Message-ID: <20230718124334.36548-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718124334.36548-1-roger.pau@citrix.com>
References: <20230718124334.36548-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0598.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO6PR03MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: 4345a27c-46f0-4ba6-9603-08db878cafe6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BUKvqZ0Q75s5d8h54maaX3+fWQkX9C4T2Sc8PmZL5Ps4WW2kpb1NFDWh67rfXcHwmiN8bX4MiT4slMeSxfpEFIVzeddntwq0ipqm91g+Pa5gpt22QzOri+FKS8mfcy1gVsqvdm/kMIvUamaGnBXuewZnB6OYUU2MOUY8+dZRxsVvk/C/qP+3+bfiTCuM0mtJ5lpCtXdrmhg/UGoY/OOesrtJppXN/wd+VFtufl+TwReBugiY5VA2QO/g3JlwfE8GzEiTLBJy07KK6mRe6de9/I9aobhXF612m3gc93l9gMLewWgKUcTkwnO0/tn4l8Xw8gOYuL4fF7IjjkVs48dNgPc7fsCJM7CFPAQnUIT7SIuyLfYh2q2r7V0cYGcAnaZ7EGTmgRN0crPpOcEaVZ/B2ood7n2BvAxvMF13l5dvopqgz7nWHFcAWCkq7hOygE+lEb2Apm5/rZplQCL4oywvdGXu5xjofEU7YeuhfgRqCF+xsR6kuLXfFdnl/vGzzeCD6ju0SURdyZPlGvWY36SuPFiC+Fqppw31W8OAxYyFrtsELeSJtDS7HJewIvWNtS/o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(54906003)(478600001)(6506007)(26005)(186003)(1076003)(6486002)(6666004)(6512007)(2616005)(83380400001)(15650500001)(5660300002)(86362001)(38100700002)(8676002)(8936002)(41300700001)(82960400001)(4326008)(6916009)(316002)(2906002)(30864003)(36756003)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHpzNmt6QjkyMFJVWG9EbDR4RHp6OENXb2NuQ2p2ait2VFZrN2VLT2oreGpy?=
 =?utf-8?B?c3FVNyt0dlk0WmErenlUU1BhT1c2RGtQTjRvRmhPTjJHeEJvZFlKQ1o0bmww?=
 =?utf-8?B?SlNkdnoxYUVPaDM5SkY1Z3FFbG8zT29qLyt3czZ6K3o5dzlieVl6WlBaZFkw?=
 =?utf-8?B?QTkyMGQwTkVlMGMzQUdlYm5VTFZOR3luMU5ielloN1YxVmVVUWhWTnRBdzZD?=
 =?utf-8?B?U2FkSDBhRFR5eTZsWkh6djlkaFk1QTFsaTZ6YzlWZVUzb1B0QXJKQXBFMWl4?=
 =?utf-8?B?dUhiMEcxeEZWNUhZSnFha2d4Yy9Id0QrQ3N5UUNBdWMyU2R0S1dZWHhQRHNh?=
 =?utf-8?B?TmZtcGJEYWNtS3V4S2U1WFRKWmllOFNkZkkyYmx1SHlGTVBmUlRqTzFUNUQ4?=
 =?utf-8?B?dFQzbjFiSlNRajlLKzdxdy9xQmNjM2NrRzErTzIwNDQ2andZWmY0cU91dXFB?=
 =?utf-8?B?SWk5UGVoNDNiWWtNUVBsSS8yWVE4eVI3anBqNnp2bHpTak13SHVZUUxZREwx?=
 =?utf-8?B?aFE3clRUL1Z3RDZNcEU1c1ZoRzhHenZ2M21uMnViRXo4YVhGeTEyVEJSOWkv?=
 =?utf-8?B?T3dVMzFLSWZhamc2dkV4K3FVRGtiejZIVmF1eDJuVEd2b3d3dGhXQUtMMkww?=
 =?utf-8?B?TWV0MjhhYm9DaDBRY00wNTQxSXlQSVQ3WVphMFBrczJpSDhBU0ZOUmhIclNo?=
 =?utf-8?B?d1BKRENvMFJpMlJlNGJnWDl1QTRKeHZyaVNLc21yMVN2ODRSQ1NrMW5EWVQr?=
 =?utf-8?B?N2JaNDdMNCt3MEp6blVqUDRPR1QzeVBxd1VjVkhjU0ZiNXVJQ3N3RTRINmoz?=
 =?utf-8?B?YmFCcGt6aHQxc1lPUnczNDdwRE55bzhuSkgxeTZQU3l5UjBzZzVLck13UjhU?=
 =?utf-8?B?cUhhbWZIZzNiQlQ2M0xNOHhMUk9SSUJLQ0ZYNUNSVElZMUlkbUU3VTBpenpX?=
 =?utf-8?B?V3dzU3VsRzZNNEJHOXBITDZUVENWbUZDUkxIekJ6VHFySDdHMVYrY25xTVpJ?=
 =?utf-8?B?WTVSbkNIbnNlYTJ3MXc2cy9ESEdpT0dqcEdwbGFhUnovTjR0SkFOUERRS1NO?=
 =?utf-8?B?ajF3SlNoYUdUallxN0xDaVhmRnZncHZpOFF0TUd2bnJDajJqY0JtQlRZdnFx?=
 =?utf-8?B?eWJ1ek9lNVczallYbmVIYkdyL3FNMXNiMlBneWIzSlQ4OGhLcGY4ZkJHWDM1?=
 =?utf-8?B?ZmllZUJuTGZwNCsxUi9XL0p0TkFtNWplRWI3ZGJUM2E0YjFVR2toU3l3QURL?=
 =?utf-8?B?UXRBcnZsVnRqazk5SUIxdHVQOWlkd25DY2dNK0FRL3VrU0pDUW5LaGJqSEpo?=
 =?utf-8?B?TWJwNFd0TldoUkVrV2tXbGtINEdnVjhKSVQrc20yaWswbllPQkxQOEtsbHNP?=
 =?utf-8?B?VGNyNTZHNjZ1STBoQjVnbWZoeEpLLzB2Z3hLL2VoMXk1d3ZDdm9GRThvUk5n?=
 =?utf-8?B?VkVrdlEyOTBkN1ZVWGxPZitKcElWdDRZL2dsZ2hmcjVhSlE2YWpLWnBPTm8v?=
 =?utf-8?B?YXhidk9sR0UyWFZFY1lGU3huUzhXV3g3RTdVclBrN0p1REV0a1NPTThpdVhh?=
 =?utf-8?B?Mm0xa3IxU3lFc2V1UEJBQ1VrNHRPZUpxVzIyazJITFJQQkszUlNTZFUxcGxp?=
 =?utf-8?B?d0VSUlRpWVhTZitSUUEvWFVudXpEcHc3V1NFVVRHYUVBK2JaamJOMEhOdTBx?=
 =?utf-8?B?NkRhS29DOUIxVnh1UE1SM2pjdHpVMmwvbHdZM0I3UkNnbGVIME9UMCtBaExM?=
 =?utf-8?B?bHBSSXRMcTJPVE4rQnQyOXZXK2hsZzF2WGF4QTR1Z0lqcVFIbnAxRUNiaVdw?=
 =?utf-8?B?QlpPV2RhV2tNa2ZVV3l2Q0lmQTUvVEFLQ1BnQlZPVlZzWi9yVVZ2V2FuQUVP?=
 =?utf-8?B?MFVZMERJVnVuVVJobjgvWktHV0JuTXEyTDlHVENKUU95WVp4aWVrWjBWKzJz?=
 =?utf-8?B?TDdvb0pTcmw0SWNNaU04VHlQdU9QSUxod3FCNHFUR0htSFF3RGErcCs1dXFV?=
 =?utf-8?B?OEF4OGV4MkNuckx1M0JRTGpCQ3kxMXROWVVjUUxMMlU3K1M3RVZJRkJWU2lL?=
 =?utf-8?B?OFgweHhmOGNSai92QjdESlRmT1NaeHo1ZXdPWncvTFdhcHU1UTRZektsTVBm?=
 =?utf-8?B?Qy9tZHZYaERQak5iWW9BMmNveDFaTGtOZXg2eTVvRG1WaXN1T1RRUmM4TG9n?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UdWsIwL6buICfaqKHyido4dGICvIRPpAl4VTQKDWkwyuKR4+zv/cMIvztyNPh5sK+4hPZpDYKsdjiXGCmw9ZfNMVvjasw2SaVDfhQQ63blgFxN5tPxWTAUF8kCWmZW/BlM4CKaDh9z1U8Mlq2Uq37waNvDJek4n9TmX10IEyp+x/4FJW+SEP3fkei8MHRzo5zzs88w/gIpkvHD0dqAiX+boFMGPqMmSedDNcHuPPmaINlUB9L86C42nZzdaHD80QrE4+8dVylhzwB1sXFWdAbDDI0Uv+nr7Gsp2DWg3+f8om3PeRdYWHn1xAX+0/jvjVr8uKHQtJtO/Fld2OepgkMIHPUbFabf22lOCTgnDoXN7H5FOfLy3v+cUOOwwoBM051WKSttZayqo9h/F+dchBJWu12YJMhZhG0Z+/bzgQtId37obbkBArfr7uWs08/4X/p27UFV7PM5uaiHTl+pqx8gRZXQcy0hSo1KcjKKCHIJ+68p1z2bxciSs/b/e6zjbm2LqK2E1tonV7MMH2yOMHyQJmQOVE46Ipz6+I91ow+5bnpxPVeb4B8/FKdR2myqb4+mPfGnFiTIXZgB5s9DYHM8/x2pO/HaUjA9qXMk+WWCN1TI3XBZKZqjWmAfi4bR6lUdenf4NCdZ34sdh72HC217j6HgY5vPYMsAEvbWSA6R04k0EUU5AgI1116ubIu6AyLMKxx15XuUihd9gtVoqE0fLrK2ear3dH+KfULZaKsw897kHqnTsV2GHgxG1g7sR2bDMO0WwcoJD/Y2m1h9VpcxdouaqL7P1TeaLTdcsjXhC/QGt/5jN9U+jd3WS2juHQ6VigRbTVJ/nUyY6w73pB0XlI8llP/8Mn8qcp/Msx8yc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4345a27c-46f0-4ba6-9603-08db878cafe6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 12:44:12.0744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilWk9tL+rDO78UYMHQ9QCGOfo3z91C6unLHBQ+pxY6Pcvev/1dyfA3FEkVCi8DDvv1tEQxvrco69OkquwF5mjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6228

So that the remapping entry can be updated atomically when possible.

Doing such update atomically will avoid Xen having to mask the IO-APIC
pin prior to performing any interrupt movements (ie: changing the
destination and vector fields), as the interrupt remapping entry is
always consistent.

This also simplifies some of the logic on both VT-d and AMD-Vi
implementations, as having the full RTE available instead of half of
it avoids to possibly read and update the missing other half from
hardware.

While there remove the explicit zeroing of new_ire fields in
ioapic_rte_to_remap_entry() and initialize the variable at definition
so all fields are zeroed.  Note fields could be also initialized with
final values at definition, but I found that likely too much to be
done at this time.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Note that certain combination of changes to the RTE are impossible to
handle atomically. For example changing the vector and/or destination
fields together with the triggering mode is impossible to be performed
atomically (as the destination and vector is set in the IRTE, but the
triggering mode is set in the RTE).  Xen doesn't attempt to perform
such changes in a single update to the RTE anyway, so it's fine.

Naming the iommu_update_ire_from_apic() parameter RTE is not really
correct, as the format of the passed value expands the destination
field to be 32bits (in order to fit an x2APIC ID).  Passing an
IO_APIC_route_entry struct is not possible due to the circular
dependency that would create between io_apic.h and iommu.h.  It might
be possible to move IO_APIC_route_entry declaration to a different
header, but I haven't looked into it.
---
 xen/arch/x86/include/asm/iommu.h         |   3 +-
 xen/arch/x86/io_apic.c                   |   5 +-
 xen/drivers/passthrough/amd/iommu.h      |   2 +-
 xen/drivers/passthrough/amd/iommu_intr.c |  98 ++---------------
 xen/drivers/passthrough/vtd/extern.h     |   2 +-
 xen/drivers/passthrough/vtd/intremap.c   | 127 +++++++++++------------
 xen/drivers/passthrough/x86/iommu.c      |   4 +-
 xen/include/xen/iommu.h                  |   3 +-
 8 files changed, 80 insertions(+), 164 deletions(-)

diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 0540cd9faa87..eb720205e25e 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -84,7 +84,8 @@ struct iommu_init_ops {
 
 extern const struct iommu_init_ops *iommu_init_ops;
 
-void iommu_update_ire_from_apic(unsigned int apic, unsigned int reg, unsigned int value);
+void iommu_update_ire_from_apic(unsigned int apic, unsigned int pin,
+                                uint64_t rte);
 unsigned int iommu_read_apic_from_ire(unsigned int apic, unsigned int reg);
 int iommu_setup_hpet_msi(struct msi_desc *);
 
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 85b4b4c6bc98..255ba3e8b073 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -275,10 +275,7 @@ void __ioapic_write_entry(
         __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
     }
     else
-    {
-        iommu_update_ire_from_apic(apic, 0x11 + 2 * pin, eu.w2);
-        iommu_update_ire_from_apic(apic, 0x10 + 2 * pin, eu.w1);
-    }
+        iommu_update_ire_from_apic(apic, pin, e.raw);
 }
 
 static void ioapic_write_entry(
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 8bc3c35b1bb1..aa3681a9f2aa 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -300,7 +300,7 @@ int cf_check amd_iommu_free_intremap_table(
 unsigned int amd_iommu_intremap_table_order(
     const void *irt, const struct amd_iommu *iommu);
 void cf_check amd_iommu_ioapic_update_ire(
-    unsigned int apic, unsigned int reg, unsigned int value);
+    unsigned int apic, unsigned int pin, uint64_t raw);
 unsigned int cf_check amd_iommu_read_ioapic_from_ire(
     unsigned int apic, unsigned int reg);
 int cf_check amd_iommu_msi_msg_update_ire(
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index f32c418a7e49..bb324eb16da1 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -247,11 +247,6 @@ static void update_intremap_entry(const struct amd_iommu *iommu,
     }
 }
 
-static inline int get_rte_index(const struct IO_APIC_route_entry *rte)
-{
-    return rte->vector | (rte->delivery_mode << 8);
-}
-
 static inline void set_rte_index(struct IO_APIC_route_entry *rte, int offset)
 {
     rte->vector = (u8)offset;
@@ -267,7 +262,6 @@ static int update_intremap_entry_from_ioapic(
     int bdf,
     struct amd_iommu *iommu,
     struct IO_APIC_route_entry *rte,
-    bool_t lo_update,
     u16 *index)
 {
     unsigned long flags;
@@ -315,31 +309,6 @@ static int update_intremap_entry_from_ioapic(
         spin_lock(lock);
     }
 
-    if ( fresh )
-        /* nothing */;
-    else if ( !lo_update )
-    {
-        /*
-         * Low half of incoming RTE is already in remapped format,
-         * so need to recover vector and delivery mode from IRTE.
-         */
-        ASSERT(get_rte_index(rte) == offset);
-        if ( iommu->ctrl.ga_en )
-            vector = entry.ptr128->full.vector;
-        else
-            vector = entry.ptr32->flds.vector;
-        /* The IntType fields match for both formats. */
-        delivery_mode = entry.ptr32->flds.int_type;
-    }
-    else if ( x2apic_enabled )
-    {
-        /*
-         * High half of incoming RTE was read from the I/O APIC and hence may
-         * not hold the full destination, so need to recover full destination
-         * from IRTE.
-         */
-        dest = get_full_dest(entry.ptr128);
-    }
     update_intremap_entry(iommu, entry, vector, delivery_mode, dest_mode, dest);
 
     spin_unlock_irqrestore(lock, flags);
@@ -350,14 +319,11 @@ static int update_intremap_entry_from_ioapic(
 }
 
 void cf_check amd_iommu_ioapic_update_ire(
-    unsigned int apic, unsigned int reg, unsigned int value)
+    unsigned int apic, unsigned int pin, uint64_t raw)
 {
     struct IO_APIC_route_entry old_rte = { };
-    struct IO_APIC_route_entry new_rte = { };
-    unsigned int rte_lo = (reg & 1) ? reg - 1 : reg;
-    unsigned int pin = (reg - 0x10) / 2;
+    struct IO_APIC_route_entry new_rte = { .raw = raw };
     int seg, bdf, rc;
-    bool saved_mask, fresh = false;
     struct amd_iommu *iommu;
     unsigned int idx;
 
@@ -373,58 +339,23 @@ void cf_check amd_iommu_ioapic_update_ire(
     {
         AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
                        seg, bdf);
-        __io_apic_write(apic, reg, value);
+        __ioapic_write_entry(apic, pin, true, new_rte);
         return;
     }
 
-    /* save io-apic rte lower 32 bits */
-    *((u32 *)&old_rte) =  __io_apic_read(apic, rte_lo);
-    saved_mask = old_rte.mask;
-
-    if ( reg == rte_lo )
-    {
-        *((u32 *)&new_rte) = value;
-        /* read upper 32 bits from io-apic rte */
-        *(((u32 *)&new_rte) + 1) = __io_apic_read(apic, reg + 1);
-    }
-    else
-    {
-        *((u32 *)&new_rte) = *((u32 *)&old_rte);
-        *(((u32 *)&new_rte) + 1) = value;
-    }
-
-    if ( ioapic_sbdf[idx].pin_2_idx[pin] >= INTREMAP_MAX_ENTRIES )
-    {
-        ASSERT(saved_mask);
-
-        /*
-         * There's nowhere except the IRTE to store a full 32-bit destination,
-         * so we may not bypass entry allocation and updating of the low RTE
-         * half in the (usual) case of the high RTE half getting written first.
-         */
-        if ( new_rte.mask && !x2apic_enabled )
-        {
-            __io_apic_write(apic, reg, value);
-            return;
-        }
-
-        fresh = true;
-    }
-
+    old_rte = __ioapic_read_entry(apic, pin, true);
     /* mask the interrupt while we change the intremap table */
-    if ( !saved_mask )
+    if ( !old_rte.mask )
     {
         old_rte.mask = 1;
-        __io_apic_write(apic, rte_lo, *((u32 *)&old_rte));
+        __ioapic_write_entry(apic, pin, true, old_rte);
     }
 
     /* Update interrupt remapping entry */
     rc = update_intremap_entry_from_ioapic(
-             bdf, iommu, &new_rte, reg == rte_lo,
+             bdf, iommu, &new_rte,
              &ioapic_sbdf[idx].pin_2_idx[pin]);
 
-    __io_apic_write(apic, reg, ((u32 *)&new_rte)[reg != rte_lo]);
-
     if ( rc )
     {
         /* Keep the entry masked. */
@@ -433,20 +364,7 @@ void cf_check amd_iommu_ioapic_update_ire(
         return;
     }
 
-    /* For lower bits access, return directly to avoid double writes */
-    if ( reg == rte_lo )
-        return;
-
-    /*
-     * Unmask the interrupt after we have updated the intremap table. Also
-     * write the low half if a fresh entry was allocated for a high half
-     * update in x2APIC mode.
-     */
-    if ( !saved_mask || (x2apic_enabled && fresh) )
-    {
-        old_rte.mask = saved_mask;
-        __io_apic_write(apic, rte_lo, *((u32 *)&old_rte));
-    }
+    __ioapic_write_entry(apic, pin, true, new_rte);
 }
 
 unsigned int cf_check amd_iommu_read_ioapic_from_ire(
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index 39602d1f88f8..032a7c3b42cd 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -92,7 +92,7 @@ int cf_check intel_iommu_get_reserved_device_memory(
 unsigned int cf_check io_apic_read_remap_rte(
     unsigned int apic, unsigned int reg);
 void cf_check io_apic_write_remap_rte(
-    unsigned int apic, unsigned int reg, unsigned int value);
+    unsigned int apic, unsigned int ioapic_pin, uint64_t raw);
 
 struct msi_desc;
 struct msi_msg;
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 05df6d5759b1..845c180bb39c 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -328,12 +328,11 @@ static int remap_entry_to_ioapic_rte(
 
 static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
     int apic, unsigned int ioapic_pin, struct IO_xAPIC_route_entry *old_rte,
-    unsigned int rte_upper, unsigned int value)
+    struct IO_xAPIC_route_entry new_rte)
 {
     struct iremap_entry *iremap_entry = NULL, *iremap_entries;
-    struct iremap_entry new_ire;
+    struct iremap_entry new_ire = { };
     struct IO_APIC_route_remap_entry *remap_rte;
-    struct IO_xAPIC_route_entry new_rte;
     int index;
     unsigned long flags;
     bool init = false;
@@ -364,48 +363,37 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
 
     new_ire = *iremap_entry;
 
-    if ( rte_upper )
-    {
-        if ( x2apic_enabled )
-            new_ire.remap.dst = value;
-        else
-            new_ire.remap.dst = (value >> 24) << 8;
-    }
+    if ( x2apic_enabled )
+        new_ire.remap.dst = new_rte.dest.dest32;
     else
-    {
-        *(((u32 *)&new_rte) + 0) = value;
-        new_ire.remap.fpd = 0;
-        new_ire.remap.dm = new_rte.dest_mode;
-        new_ire.remap.tm = new_rte.trigger;
-        new_ire.remap.dlm = new_rte.delivery_mode;
-        /* Hardware require RH = 1 for LPR delivery mode */
-        new_ire.remap.rh = (new_ire.remap.dlm == dest_LowestPrio);
-        new_ire.remap.avail = 0;
-        new_ire.remap.res_1 = 0;
-        new_ire.remap.vector = new_rte.vector;
-        new_ire.remap.res_2 = 0;
-
-        set_ioapic_source_id(IO_APIC_ID(apic), &new_ire);
-        new_ire.remap.res_3 = 0;
-        new_ire.remap.res_4 = 0;
-        new_ire.remap.p = 1;     /* finally, set present bit */
-
-        /* now construct new ioapic rte entry */
-        remap_rte->vector = new_rte.vector;
-        remap_rte->delivery_mode = 0;    /* has to be 0 for remap format */
-        remap_rte->index_15 = (index >> 15) & 0x1;
-        remap_rte->index_0_14 = index & 0x7fff;
-
-        remap_rte->delivery_status = new_rte.delivery_status;
-        remap_rte->polarity = new_rte.polarity;
-        remap_rte->irr = new_rte.irr;
-        remap_rte->trigger = new_rte.trigger;
-        remap_rte->mask = new_rte.mask;
-        remap_rte->reserved = 0;
-        remap_rte->format = 1;    /* indicate remap format */
-    }
-
-    update_irte(iommu, iremap_entry, &new_ire, !init);
+        new_ire.remap.dst = (new_rte.dest.dest32 >> 24) << 8;
+
+    new_ire.remap.dm = new_rte.dest_mode;
+    new_ire.remap.tm = new_rte.trigger;
+    new_ire.remap.dlm = new_rte.delivery_mode;
+    /* Hardware require RH = 1 for LPR delivery mode */
+    new_ire.remap.rh = (new_ire.remap.dlm == dest_LowestPrio);
+    new_ire.remap.vector = new_rte.vector;
+
+    set_ioapic_source_id(IO_APIC_ID(apic), &new_ire);
+    new_ire.remap.p = 1;     /* finally, set present bit */
+
+    /* now construct new ioapic rte entry */
+    remap_rte->vector = new_rte.vector;
+    remap_rte->delivery_mode = 0;    /* has to be 0 for remap format */
+    remap_rte->index_15 = (index >> 15) & 0x1;
+    remap_rte->index_0_14 = index & 0x7fff;
+
+    remap_rte->delivery_status = new_rte.delivery_status;
+    remap_rte->polarity = new_rte.polarity;
+    remap_rte->irr = new_rte.irr;
+    remap_rte->trigger = new_rte.trigger;
+    remap_rte->mask = new_rte.mask;
+    remap_rte->reserved = 0;
+    remap_rte->format = 1;    /* indicate remap format */
+
+    /* If cmpxchg16b is not available the caller must mask the IO-APIC pin. */
+    update_irte(iommu, iremap_entry, &new_ire, !init && cpu_has_cx16);
     iommu_sync_cache(iremap_entry, sizeof(*iremap_entry));
     iommu_flush_iec_index(iommu, 0, index);
 
@@ -439,36 +427,47 @@ unsigned int cf_check io_apic_read_remap_rte(
 }
 
 void cf_check io_apic_write_remap_rte(
-    unsigned int apic, unsigned int reg, unsigned int value)
+    unsigned int apic, unsigned int pin, uint64_t raw)
 {
-    unsigned int pin = (reg - 0x10) / 2;
+    struct IO_xAPIC_route_entry rte = { .raw = raw };
     struct IO_xAPIC_route_entry old_rte = { };
     struct IO_APIC_route_remap_entry *remap_rte;
-    unsigned int rte_upper = (reg & 1) ? 1 : 0;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
-    int saved_mask;
-
-    old_rte = __ioapic_read_entry(apic, pin, true);
+    bool masked = true;
+    int rc;
 
     remap_rte = (struct IO_APIC_route_remap_entry *) &old_rte;
 
-    /* mask the interrupt while we change the intremap table */
-    saved_mask = remap_rte->mask;
-    remap_rte->mask = 1;
-    __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
-    remap_rte->mask = saved_mask;
-
-    if ( ioapic_rte_to_remap_entry(iommu, apic, pin,
-                                   &old_rte, rte_upper, value) )
+    if ( !cpu_has_cx16 )
     {
-        __io_apic_write(apic, reg, value);
+       /*
+        * Cannot atomically update the IRTE entry: mask the IO-APIC pin to
+        * avoid interrupts seeing an inconsistent IRTE entry.
+        */
+        old_rte = __ioapic_read_entry(apic, pin, true);
+        if ( !old_rte.mask )
+        {
+            masked = false;
+            old_rte.mask = 1;
+            __ioapic_write_entry(apic, pin, true, old_rte);
+        }
+    }
 
-        /* Recover the original value of 'mask' bit */
-        if ( rte_upper )
-            __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
+    rc = ioapic_rte_to_remap_entry(iommu, apic, pin, &old_rte, rte);
+    if ( rc )
+    {
+        if ( !masked )
+        {
+            /* Recover the original value of 'mask' bit */
+            old_rte.mask = 0;
+            __ioapic_write_entry(apic, pin, true, old_rte);
+        }
+        dprintk(XENLOG_ERR VTDPREFIX,
+                "failed to update IRTE for IO-APIC#%u pin %u: %d\n",
+                apic, pin, rc);
+        return;
     }
-    else
-        __ioapic_write_entry(apic, pin, true, old_rte);
+    __ioapic_write_entry(apic, pin, true, old_rte);
 }
 
 static void set_msi_source_id(struct pci_dev *pdev, struct iremap_entry *ire)
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index be71a4c4641c..d290855959f2 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -158,9 +158,9 @@ int iommu_enable_x2apic(void)
 }
 
 void iommu_update_ire_from_apic(
-    unsigned int apic, unsigned int reg, unsigned int value)
+    unsigned int apic, unsigned int pin, uint64_t rte)
 {
-    iommu_vcall(&iommu_ops, update_ire_from_apic, apic, reg, value);
+    iommu_vcall(&iommu_ops, update_ire_from_apic, apic, pin, rte);
 }
 
 unsigned int iommu_read_apic_from_ire(unsigned int apic, unsigned int reg)
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 405db59971c5..9335cd074cff 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -278,7 +278,8 @@ struct iommu_ops {
     int (*enable_x2apic)(void);
     void (*disable_x2apic)(void);
 
-    void (*update_ire_from_apic)(unsigned int apic, unsigned int reg, unsigned int value);
+    void (*update_ire_from_apic)(unsigned int apic, unsigned int pin,
+                                 uint64_t rte);
     unsigned int (*read_apic_from_ire)(unsigned int apic, unsigned int reg);
 
     int (*setup_hpet_msi)(struct msi_desc *);
-- 
2.41.0


