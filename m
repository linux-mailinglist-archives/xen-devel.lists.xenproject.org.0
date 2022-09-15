Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6F15B9F24
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 17:48:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407572.650118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYr5n-0001cO-A5; Thu, 15 Sep 2022 15:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407572.650118; Thu, 15 Sep 2022 15:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYr5n-0001Zy-72; Thu, 15 Sep 2022 15:47:55 +0000
Received: by outflank-mailman (input) for mailman id 407572;
 Thu, 15 Sep 2022 15:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCqY=ZS=citrix.com=prvs=250640b55=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oYr5l-0001Zs-Vs
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 15:47:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c07db74d-350d-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 17:47:52 +0200 (CEST)
Received: from mail-bn1nam07lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Sep 2022 11:47:48 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO1PR03MB5681.namprd03.prod.outlook.com (2603:10b6:303:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 15:47:46 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%3]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 15:47:45 +0000
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
X-Inumbo-ID: c07db74d-350d-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663256872;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/17yFRdhIG+5VyiAdO5sFFQPWMl/QM3Xl2shr23pc84=;
  b=JJGwrGWCOMnTurWDm4WFE/7kCEF0gBfJe4JkB/14iFC4GnU6syUd11Pe
   9XluKQPcpHz0LTTq82COsJ+VmwZTSW3torU4Kx9GqxHTDaWhaOYBSDhuC
   mmgm2vX82+c7aHGi9x7mU/qilF3ilyLvy18ez36m98qK3Z1zggNlItkZh
   Y=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 80606967
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A0nfM+6i8YJdeaEpnh2QWwUn5X17brhtdQwwMu?=
 =?us-ascii?q?6ucuGbil+go9fh2pWK5dtnrn2Wzm5RB0dnFy2UPe8JSwMZk4PhseMG38tLF6?=
 =?us-ascii?q?db8exdWDO4iNIRjo6Ip8j288T9qj+jSb7iFUX8xBe6QbDmqnkbE5zeiAaCdE?=
 =?us-ascii?q?SCjgQooSZ/4RdWtAdYzcnPWCx0xAKi4JjIBDGU+daWVdmdCcmZclXHwehAvd?=
 =?us-ascii?q?LOoSbUcpXqY6aVcTnruhrYNXqvEOor7CAOyjLwbbhnMxED0CH1XBGHBfT3EO?=
 =?us-ascii?q?WRPVXL9ebeTf79uxZpBLRb4zU0v7a5QtxFZ4olJuajeKyQ3d75YABFBt4hng?=
 =?us-ascii?q?gzUl/ksBLv7//9Qs8h4ntToSDw6stBWQ7NNOgWbOabCQ3v5XHSeFS6QdyNMt?=
 =?us-ascii?q?p3nNVNshaRd6OpUedA9BQwrTTYcLWkWEwJGS8Uv4PDPRGQ+yN4qgWjS/ynQs?=
 =?us-ascii?q?SrIv+j7+3GDJyUy5mRkYvLm0POsKODCCZjIoU1Tpb9884eWOntUrzA9vuK9P?=
 =?us-ascii?q?AUBItqE/dk3hsuitEQQQAaVtshhp7J+72yF9mtm0WFchJkMR8/jAsDhtM3jX?=
 =?us-ascii?q?cGSrLYJxlNs6CQRcLBIRmLV092JCeLMXg0pJjm46B5Jr1oN8XPCu3z3BE0r0?=
 =?us-ascii?q?z9j8e9ZtUef4swRcIgSXPIIKNsuZg5I5DDsrbj9IYY6+S/BjOj1GBYcXFjmH?=
 =?us-ascii?q?CBNEwsTlYN8uCmMwPO++tTtUx8bUs61aoEhel0eHrjVvATCbkYNPRFyGO75W?=
 =?us-ascii?q?gKwexhEhgxNpXHwixx0YEeSkYkJjFpD5RBsrdbHVRjnnQCQksltEwvcZmy2T?=
 =?us-ascii?q?wveYGUKHyVFaDEeRaqluQfJZsH+7j32D9aZ7CpEJx9+5ph4gLs+KlbqXeNI+?=
 =?us-ascii?q?vhxIHD2VdTRB2XW9ASFs6i34u+hdt9oz4D7ooR7NH4r0SaGIBEES6W1clTX3?=
 =?us-ascii?q?7EJ/7RP6G2So42+FKHdNrs0UAgoZmLqG9sZAoXM9vZJd3KxTQ74oqgPiFqBG?=
 =?us-ascii?q?mEOGDmSM5Wj2H0NBorkgb1sUI/E2iNkYo5PLL4Gl89TPCbbLlWrLB84JZwEm?=
 =?us-ascii?q?8LLz/e2gDkP+UBifZm0/CkJtgGAps8c66GYF26vDtCF3bya+zk0JJzvk1fnj?=
 =?us-ascii?q?dOOWmvQgwPfbUsrMxpj8ZWlxLnDDC3bcbHP3hznpSFz5+C8dzWPh0RaFtzTd?=
 =?us-ascii?q?1uQyLFyjiSj2uphxOmeRM8f0+dbxWOhof+7BfnHjlsUMXKVVHARvOzo61jA0?=
 =?us-ascii?q?RuOn2C4QCzeEK7/r8tiS73dIb62kbBaikIhV2Xz6sqQLVPDBwM81A4LOGzDi?=
 =?us-ascii?q?yUPtWIBr0XwMDW9BvcCAHG8AXs8Hh9p6wv6I+lddLOGWmscHKNcSql3TWgMK?=
 =?us-ascii?q?9fKOtbqAL8x4njfhOj/7ENL/wKNXV1zmtmOMpnpahLARfcYCpkYywuIu/ELm?=
 =?us-ascii?q?CfxvhU8WZ1+BcNLYqSIn9FPBFJNnYFtlLwsDmHDDS6Z5tuEt9naDgz6D2SMF?=
 =?us-ascii?q?f4xUTD8fc9wrR/YySoZUsZYrMYp39UGR8YwEA6lBGbyRdMRjNhnT2qCqAHTM?=
 =?us-ascii?q?6umJiommSIeJvfwAHc5poLKgjm/LAcDtVfvbRWBt4L/X/O2mwD87OX7dlud6?=
 =?us-ascii?q?RuQnAS1Svx35XiC5aW/bp8Hp5tsjQVnPd7v18ytozcBhU6PD4uUqTVYhkrNV?=
 =?us-ascii?q?6olyQkSFTKoAPcf8QCX/48M5XmvJpAlOb7a3LPWn4b6v4nJvb3lQouspa7e1?=
 =?us-ascii?q?w3aT6EUwlCSr0u7uaff94iO7mXklA4CJ1qqmCQ9pwW6NDy9AKsla3pyRTnca?=
 =?us-ascii?q?ZAwZ7wLBUd7fiAaA0/BC/AfU9dUfT7q00BTDAkiJ3Eg4FT4rwGOgZmm9VflU?=
 =?us-ascii?q?9iaNrNgSxqqniWT2PFjc2mcQNrQIDyY0DXHrkHdcioYJYQlDeuvt0bjbcLXw?=
 =?us-ascii?q?3HKw8Z6J1vJevInH9dfPJ3a9Ri9X5/pSNWLi7mKFJEW+26oWVjhoBvShk6wW?=
 =?us-ascii?q?0tQW0xwuvsUIPCJLMrUayT7EylpFbafhF5T/PIAvsphCvQZ1Wv3HvZbFWj6E?=
 =?us-ascii?q?XKiKqmTKF8L6OZp6KeXYID5vBY96E7vF88LRQtp5vmQJ8f/7JBaKZh4s6MRV?=
 =?us-ascii?q?JFiAHe4KSxk4Qs0oP03SEbsomMH/pM1/pmt2niwmVNIcWUpf7ZQiZJDKWrGi?=
 =?us-ascii?q?M/C9QLtfes0IPMA4FyrNmcY9Sh0bnZ0fCvgfKagRWCJzClNkw/U92YFtr+k0?=
 =?us-ascii?q?wLci05bpCAYhh/LvpYP1Jn0SW6chMlqyFrA5LlMRACv0pSBjBJF467yO3y1c?=
 =?us-ascii?q?9jUAYigpOjR2SIs5fw5lRF8JKrZPqR2D18sknvyRpEra1SqYMVw/lV508YUP?=
 =?us-ascii?q?3OEaSjEIqdSWxlegWcphBghS3yYMRXk51d2UMm4oi0s64upqsin7qPYmzP75?=
 =?us-ascii?q?cACYdpO0gk/VvF+d9dOAsvoI4a/hG/+umANntJBTALSfg/Hh0l8SKmb5zZZ1?=
 =?us-ascii?q?SC1O6Mn4AJN1wWANm8=3D?=
X-IronPort-AV: E=Sophos;i="5.93,318,1654574400"; 
   d="scan'208";a="80606967"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPO/zGa94WSlqPMw32Alc1Ga5bd85pxzDJ0fB065L+vPGqQqIhaz7fi2r0SfVgVxJtNOxigKhlH98SLk8fVRqgON7k0p+mgH8iDiBOasEHaIGLnzoskPuKjzU/sVNx8fl1eWInw2i5yP5GBR/1AQvy4gLZ4nxMw5wSIEUgctdpub1DuscoPdaEnubanKlQiO5H8HdGKaVU5BASy1jqhsTssj0zbKg39rrACUyMlgrbux/qKM7WfMB5PkAz5sgoRsDSNcscQqLw1UnUWZ71+qhOszZsAHk7fvam6mvx4Mm6w2ZpzFKPogb5WPKs0pfkgAPXzqY2Xt2BlFdpWj3No9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH9VcU4cbLlRks4FhhET0OEZS/olN/hDHR6lQEb4pQQ=;
 b=TqGOyDtWu8l2IfxrYiQT9yTsMpqb2DrwoYhUl4L+sMW1VSJ8t+aUnNPEmDK8J5nqvBvdYqgDv8UiJmk6sevFgGAHC3pRKI6SZNeBx4ADVSQLWC/UFam2dtCGXz0JTlNMi9Dx0tcLYzvI4jOb2/UuIhhm7Q6o4f73qcvncBL+8z+2YRwB5EKxdeVpNPNgbpn9nbftMfQMSDEukqbnsQJUqcbx5CIJCBDJ8qQBMpNtSuPu+32pIqSH8zWQLZGGyUyssEfnDEUGmmPhtqsTyHhVZPVrWPyLy1OCnLCHsxBk9scrqe6Nqedd0hyI+Dl7EcsFD8fR+1UsAW/OSSdE7gz72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH9VcU4cbLlRks4FhhET0OEZS/olN/hDHR6lQEb4pQQ=;
 b=eSSnFY95+3541qVigaX4xKRI9zChzyytPvkd9q3HjcUXmc1iaGcPcGeYR7IUco1EkQ/1RvoOUhdz31d0XngKjdFLQ3C86GNfrhqpvwG4Ub83yLuA1BfAsZCTX8oqiTBYhhFs7Cvi2QdIAQiq+Q3x6nNfeuVDKuaiY8fMsWyG8vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 15 Sep 2022 17:47:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] libvirt: disable Werror for non-libvirt flights
Message-ID: <YyNJHURbDNeeZhEf@MacBook-Air-de-Roger.local>
References: <20220913100328.27771-1-roger.pau@citrix.com>
 <YyMyc0O9N9l1NzEZ@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyMyc0O9N9l1NzEZ@perard.uk.xensource.com>
X-ClientProxiedBy: LO4P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|CO1PR03MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: 84e08921-4fe3-4092-3fe4-08da9731a219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CgEb0eQc4rXiNje1Kxkd2YgBvvGNepN3DUFcLWpwjutSK1PWOQLBwxhw3LJ+J15wP3F46P4Kvdq0HI5tVEs/F/z0N2Wrjyd/b2vK+Lb41tJyUvVcfF6rodnjNAG7eaaXoB9ZpSv6TQ0kTmkQsoC1aa9LESGVVv7+MeYclT7PXaWbARa7oujr1tpXZOdwM+8dHcxAzKS0aC1nCbH5/jY017VI7qui7DLrw5QjGePVfTDBYI/OG8JkSXJMoya3q1iHQdveu3GqXsTUVVj3gtC9qEHb6AkSy5ImEoDXwHPfVdKrQHS12+oOWvyrVUMgMCZDjDTfwxG1NplWilYgepdIndlfK58zFUXdP5hEAz2CChyK2V8ema+sgC3zpvbll3zrinitL7QxLbG5vufp/qsPYFdvd56oLNZg4C66xySu6A+o5fUZkR+BI2i9UPsdd61iIRrzhI2CWKd3HDzv7AXs1A5Q1N5TFfGupsl+9XyW4tWjFtRPCYPK5exy0/M0BB9gP2E3chDyq9zZ4OfITksDB61y5LicXfCgTaTxAtxLjHK49/bYCli3VcNH6cGqqCj2i6QzmP60YMsW+njLxro/uCGKEsDNe8n4AonjWrIHYhppU/O1d5+4mpDAFZr6Q19rFt3wR5klUVqv4vL9R14N7PbMfA+TzQMcBLugj6Zz85UoXrZdqeC9rXYj3K1t/5REU2D247MFPsk8Q4VcKChbQSH/qKCgZ4rLXH/kkfVYSD9Lf5XbVTcln99Qs0/K9cwo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(316002)(8676002)(38100700002)(82960400001)(5660300002)(86362001)(4326008)(66946007)(66556008)(66476007)(8936002)(2906002)(85182001)(41300700001)(186003)(9686003)(966005)(478600001)(6506007)(26005)(6512007)(6486002)(6666004)(110136005)(66899012)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkNSS3A5SnJob1M5VUtsNHRWZ1Ywd0dkNlA1dkwyQjgrMWN3dE9tN1psRHZu?=
 =?utf-8?B?bVJwZjJGV2VxOWJBRm1uL1A1QjlLTDJyanJPdmFoK3I3QzFGZ0loaU9qQTBl?=
 =?utf-8?B?bXJmVGVRS05VQXpsanlRNUthOWErN3ozbjJhaEhQNDVuZGRkWURzSUNJc0dj?=
 =?utf-8?B?MUl1enBTYVdKOHAxbWV3azUrdEF0ejBPM0dCeGd5ckhUUHFLdDdIMS95c1hF?=
 =?utf-8?B?L25FcmJLUXNpZnI5YWliQmR3SllJLzdqNENBK2VRMTRzUld0eXNVNWxKZnFv?=
 =?utf-8?B?VVJLSitYWjJPVHBWUTlZL294dFdrL3VLdWgrUFoyK052UDk1RUtXdnRwaTcz?=
 =?utf-8?B?WmRWZ0lYOThyaU9yZi81OWpuL3JjUkZTLzk0UVFuaWlHQTJoL281ZVF0K3Zu?=
 =?utf-8?B?NnpHQlNRRDM5OVRqVWhrUlQyRDlIRXpVcEI4ZXBHek1lMlh4eGlIQloxbTZQ?=
 =?utf-8?B?N0o5c29BUkEyempyKzhXMGE4NWpiNEdic0NZR0dhc0x0SHhPQnhHbCtVeHdG?=
 =?utf-8?B?K1ExY3dwaHNwOGd3VUpBT0pDbDNHU1dxazh5SFF0Z0RtbVpLeEF3T2k3cTF0?=
 =?utf-8?B?a1ozcytCdDd2VjRmb0QzTHRBNGdhYUhNRmJnOUhVQ1Y0RW8vOVdiTlR2OURi?=
 =?utf-8?B?MFpodTdHZWlhZElnQmlXRk12dHRpM1E5UVR6VWJHRnIrZnhjNVMyR2YwcERZ?=
 =?utf-8?B?Vi9QVmxoRkV2UTJiS21RMUxXek5ZWjBzcnp2alowM2JNUjRUMTRuU25Xd25X?=
 =?utf-8?B?U0tkcERFeE9GYU50Q2VjRTNQZ2VUWUQ3WXhrMDE0eGx1MFBXZVdzYm5BYTdF?=
 =?utf-8?B?MnZIWGdSZ1hDdm15RHB2UXFiMmczOXVRMDhCUldzcmVOSFRmK1diU3BaeGht?=
 =?utf-8?B?dkRvYmEyWlRWNDk3UjlCdVF5dks5UTFZaU1ob0lrV1dSNG1NUkFwUGc5SGV0?=
 =?utf-8?B?QVRTUDlYWjYrdGJGZ3BrSWJzVytJU1BmYmxFTGlBZS9leEhlVmg4NjNCT1R1?=
 =?utf-8?B?a2VlZGU5c2NwSHNpUnRvem5MTXplVnBPcXFiSnRPTGE0VDJGUXBlMXdjME5y?=
 =?utf-8?B?Q01tWTZvOHRROTZ2RXA3M082Y2ljZ0dQVDZlQUtHV2FpT05BcXhwV0FPbG5x?=
 =?utf-8?B?T3lNRnJEYTkwM1d1bUtRa2czQkszZDN4RzRJL28zNGRZQXlSeUZFM05FK1Er?=
 =?utf-8?B?c25NTjhmbFhuRmw2dWtWUEtzMVhoRHRhTzBnWmxTQ3I1T2VyM3FXSGNBVE1R?=
 =?utf-8?B?aDRoWENuVUp5WTVEMUlNa2JqTktYZEVldEZmaTZJYis1OHg1dDROK3NwUFEr?=
 =?utf-8?B?ZFFRR2xncDdRR0lnT1RKbmpWOFRBVGs1S2pudkpQV1JSNHZ2WXdFc2tTOTBM?=
 =?utf-8?B?elBWZjhlT1RzeS9QdUpJYVNuY28rQWdaWHdQcTVLcE9qNFNzNTM3Y2tyRVBn?=
 =?utf-8?B?NlYyRHZ6cnBFVC9MMkVSdEhZYWROUndqc0V0RkxmV083WjZiU0hUOHRMLzU0?=
 =?utf-8?B?WUxIUzRoWlNNajVlNmdEMmhUNW56RmlUWXRqUU9RT0pCVHRVRVEvMTV3Rm90?=
 =?utf-8?B?WDRIL1RGMmdQUDFDbE9RNmdtc0VUa0xqNFlkbGlwQkRncHRRTjJISlNwbUF5?=
 =?utf-8?B?UmtEZXIrWWpZZmI1eDJ5azhhUkN3eEZPc1h4SXZXNTZOdXVlNUpKcU9hRzU0?=
 =?utf-8?B?MkJ4ZFhhSHdjZzhKQm56dlpYbGtMU3NYSXRNV25hc21CemZoZ0tkcHBpeGNk?=
 =?utf-8?B?dkNaN3B4M0F3eG00UytQREhCNTQzaDZWd2VxNWYrRGF0eWNRUFJVYUZmUkNP?=
 =?utf-8?B?RVRPVXlqT1puZjE4QnlieGxUS2FCcndDSEFNdlVtZlpMMlRUb2dxbWlIdUlQ?=
 =?utf-8?B?cHBjSm1lQXhZT3NTRlhVSWNrdFQ5Q29GNnQ3QnJyNllIcFdzQkRvZ2xkODVt?=
 =?utf-8?B?NDF4b0lrdm1jZmxQelpONk4zY0dDOCsxemhBWDB3eGV4ZXRFTUpINm44Z2lC?=
 =?utf-8?B?TVJON0lFUHg4SldkdlJ0R2xaellBd0VleElnNnRBcnZTMldGeXl2V1hkS2FP?=
 =?utf-8?B?ZStURlNacS93czN1UzVjVXhLa0dLS3hVWnc1aG9mZHE3M3k3MkdMN3M1OGxv?=
 =?utf-8?B?SG9qbWNXM2FQTHN4UFF2RGp6dEZ6QXV6Y0M0WHdMbkxlaEVwMjh2VC9sZ2pR?=
 =?utf-8?B?MkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e08921-4fe3-4092-3fe4-08da9731a219
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 15:47:45.9163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pnPj95OJa5tIwfdepyleiCDRyg6iCm/184zoF96mqI61ckU702p0B2Yv8PTgnNO9IIwkkurn2na0laVmcdLuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5681

On Thu, Sep 15, 2022 at 03:10:59PM +0100, Anthony PERARD wrote:
> On Tue, Sep 13, 2022 at 12:03:28PM +0200, Roger Pau Monne wrote:
> > Current usage of Werror=switch-enum by default for libvirt builds out
> > of the git tree causes issues when new items are added to libxl public
> > API enums if those are used in a switch statement in libvirt code.
> > This leads to libvirt build failures for seemingly unrelated libxl
> > changes.
> > 
> > In order to prevent those errors from blocking the push gate, disable
> > Werror for libvirt builds when not in a libvirt specific flight.
> > 
> > The errors will be reported on the libvirt flight, and block the
> > pushes there.  So the author of the changes in libxl is still expected
> > to send a fix to libvirt code.  This is no ideal, but the other option
> > is to just disable Werror for all libvirt builds and let libvirt
> > developers fix the breakage when they notice it.
> > 
> > runvar differences for a xen-unstable flight are:
> > 
> > --- /dev/fd/63  2022-09-13 09:53:58.044441678 +0000
> > +++ /dev/fd/62  2022-09-13 09:53:58.044441678 +0000
> > @@ -574,6 +574,10 @@
> >  test-xtf-amd64-amd64-3                                arch                            amd64
> >  test-xtf-amd64-amd64-4                                arch                            amd64
> >  test-xtf-amd64-amd64-5                                arch                            amd64
> > +build-amd64-libvirt                                   autogen_options                 --disable-werror
> > +build-arm64-libvirt                                   autogen_options                 --disable-werror
> > +build-armhf-libvirt                                   autogen_options                 --disable-werror
> > +build-i386-libvirt                                    autogen_options                 --disable-werror
> >  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    bios                            seabios
> >  test-amd64-amd64-qemuu-nested-amd                     bios                            seabios
> >  test-amd64-amd64-qemuu-nested-intel                   bios                            seabios
> > @@ -1217,6 +1221,10 @@
> >  build-arm64-libvirt                                   make_njobs                      1
> >  build-armhf-libvirt                                   make_njobs                      1
> >  build-i386-libvirt                                    make_njobs                      1
> > +build-amd64-libvirt                                   meson_options                   -Dgit_werror=disabled
> > +build-arm64-libvirt                                   meson_options                   -Dgit_werror=disabled
> > +build-armhf-libvirt                                   meson_options                   -Dgit_werror=disabled
> > +build-i386-libvirt                                    meson_options                   -Dgit_werror=disabled
> >  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict recipe_dmrestrict               true
> >  test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict  recipe_dmrestrict               true
> >  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict recipe_nomigrate                true
> 
> For "osstest" flight or "xen-unstable-smoke" flight, we would have the
> same difference, right?
> 
> The only branch with no change would be libvirt, right?

Indeed, that's the intention.

> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I'm unsure whether we want o disable Werror even for libvirt flights,
> > but this seems more conservative.
> > 
> > This does at least unblock the libvirt builds for both the
> > xen-unstable and the libvirt flights.
> > ---
> > Cc: Ian Jackson <iwj@xenproject.org>
> > Cc: Anthony PERARD <anthony.perard@citrix.com>
> > Cc: Julien Grall <julien@xen.org>
> > ---
> >  mfi-common       | 2 +-
> >  ts-libvirt-build | 3 ++-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mfi-common b/mfi-common
> > index 59e712f4..450229e9 100644
> > --- a/mfi-common
> > +++ b/mfi-common
> > @@ -459,7 +459,7 @@ create_build_jobs () {
> >      libvirt_build_runvars=''
> >      case "$branch" in
> >      libvirt*) ;;
> > -    *)        libvirt_build_runvars+=" make_njobs=1";;
> > +    *)        libvirt_build_runvars+=" make_njobs=1 meson_options=-Dgit_werror=disabled autogen_options=--disable-werror";;
> 
> For meson, I think '-Dwerror=false' would be enough, instead of the
> unusual 'git_werror' configuration.
> 
> But, we might not need to disable all errors, for meson we can have:
>     -Dc_args='-Wno-error=switch -Wno-error=switch-enum'
> 
> But disabling werror is fine too, as less likely to be an issue later.
> 
> Both 'werror' and 'c_args' seems to be meson built-in options rather
> than options implemented for only libvirt.
>     https://mesonbuild.com/Builtin-options.html
> While 'git_werror' is libvirt only.

I don't have a strong opinion really, I've used git_werror because
that's the first thing that I found in:

https://libvirt.org/git/?p=libvirt.git;a=blob;f=meson_options.txt

I don't mind using -Dwerror=false if that's considered better. Ian, do
you have an opinion?

Thanks, Roger.

